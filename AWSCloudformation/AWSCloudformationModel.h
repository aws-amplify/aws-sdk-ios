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

FOUNDATION_EXPORT NSString *const AWSCloudformationErrorDomain;

typedef NS_ENUM(NSInteger, AWSCloudformationErrorType) {
    AWSCloudformationErrorUnknown,
    AWSCloudformationErrorAlreadyExists,
    AWSCloudformationErrorCFNRegistry,
    AWSCloudformationErrorChangeSetNotFound,
    AWSCloudformationErrorCreatedButModified,
    AWSCloudformationErrorInsufficientCapabilities,
    AWSCloudformationErrorInvalidChangeSetStatus,
    AWSCloudformationErrorInvalidOperation,
    AWSCloudformationErrorInvalidStateTransition,
    AWSCloudformationErrorLimitExceeded,
    AWSCloudformationErrorNameAlreadyExists,
    AWSCloudformationErrorOperationIdAlreadyExists,
    AWSCloudformationErrorOperationInProgress,
    AWSCloudformationErrorOperationNotFound,
    AWSCloudformationErrorOperationStatusCheckFailed,
    AWSCloudformationErrorStackInstanceNotFound,
    AWSCloudformationErrorStackSetNotEmpty,
    AWSCloudformationErrorStackSetNotFound,
    AWSCloudformationErrorStaleRequest,
    AWSCloudformationErrorTokenAlreadyExists,
    AWSCloudformationErrorTypeNotFound,
};

typedef NS_ENUM(NSInteger, AWSCloudformationAccountGateStatus) {
    AWSCloudformationAccountGateStatusUnknown,
    AWSCloudformationAccountGateStatusSucceeded,
    AWSCloudformationAccountGateStatusFailed,
    AWSCloudformationAccountGateStatusSkipped,
};

typedef NS_ENUM(NSInteger, AWSCloudformationCapability) {
    AWSCloudformationCapabilityUnknown,
    AWSCloudformationCapabilityCapabilityIam,
    AWSCloudformationCapabilityCapabilityNamedIam,
    AWSCloudformationCapabilityCapabilityAutoExpand,
};

typedef NS_ENUM(NSInteger, AWSCloudformationChangeAction) {
    AWSCloudformationChangeActionUnknown,
    AWSCloudformationChangeActionAdd,
    AWSCloudformationChangeActionModify,
    AWSCloudformationChangeActionRemove,
    AWSCloudformationChangeActionImport,
};

typedef NS_ENUM(NSInteger, AWSCloudformationChangeSetStatus) {
    AWSCloudformationChangeSetStatusUnknown,
    AWSCloudformationChangeSetStatusCreatePending,
    AWSCloudformationChangeSetStatusCreateInProgress,
    AWSCloudformationChangeSetStatusCreateComplete,
    AWSCloudformationChangeSetStatusDeleteComplete,
    AWSCloudformationChangeSetStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSCloudformationChangeSetType) {
    AWSCloudformationChangeSetTypeUnknown,
    AWSCloudformationChangeSetTypeCreate,
    AWSCloudformationChangeSetTypeUpdate,
    AWSCloudformationChangeSetTypeImport,
};

typedef NS_ENUM(NSInteger, AWSCloudformationChangeSource) {
    AWSCloudformationChangeSourceUnknown,
    AWSCloudformationChangeSourceResourceReference,
    AWSCloudformationChangeSourceParameterReference,
    AWSCloudformationChangeSourceResourceAttribute,
    AWSCloudformationChangeSourceDirectModification,
    AWSCloudformationChangeSourceAutomatic,
};

typedef NS_ENUM(NSInteger, AWSCloudformationChangeType) {
    AWSCloudformationChangeTypeUnknown,
    AWSCloudformationChangeTypeResource,
};

typedef NS_ENUM(NSInteger, AWSCloudformationDeprecatedStatus) {
    AWSCloudformationDeprecatedStatusUnknown,
    AWSCloudformationDeprecatedStatusLive,
    AWSCloudformationDeprecatedStatusDeprecated,
};

typedef NS_ENUM(NSInteger, AWSCloudformationDifferenceType) {
    AWSCloudformationDifferenceTypeUnknown,
    AWSCloudformationDifferenceTypeAdd,
    AWSCloudformationDifferenceTypeRemove,
    AWSCloudformationDifferenceTypeNotEqual,
};

typedef NS_ENUM(NSInteger, AWSCloudformationEvaluationType) {
    AWSCloudformationEvaluationTypeUnknown,
    AWSCloudformationEvaluationTypeStatic,
    AWSCloudformationEvaluationTypeDynamic,
};

typedef NS_ENUM(NSInteger, AWSCloudformationExecutionStatus) {
    AWSCloudformationExecutionStatusUnknown,
    AWSCloudformationExecutionStatusUnavailable,
    AWSCloudformationExecutionStatusAvailable,
    AWSCloudformationExecutionStatusExecuteInProgress,
    AWSCloudformationExecutionStatusExecuteComplete,
    AWSCloudformationExecutionStatusExecuteFailed,
    AWSCloudformationExecutionStatusObsolete,
};

typedef NS_ENUM(NSInteger, AWSCloudformationHandlerErrorCode) {
    AWSCloudformationHandlerErrorCodeUnknown,
    AWSCloudformationHandlerErrorCodeNotUpdatable,
    AWSCloudformationHandlerErrorCodeInvalidRequest,
    AWSCloudformationHandlerErrorCodeAccessDenied,
    AWSCloudformationHandlerErrorCodeInvalidCredentials,
    AWSCloudformationHandlerErrorCodeAlreadyExists,
    AWSCloudformationHandlerErrorCodeNotFound,
    AWSCloudformationHandlerErrorCodeResourceConflict,
    AWSCloudformationHandlerErrorCodeThrottling,
    AWSCloudformationHandlerErrorCodeServiceLimitExceeded,
    AWSCloudformationHandlerErrorCodeNotStabilized,
    AWSCloudformationHandlerErrorCodeGeneralServiceException,
    AWSCloudformationHandlerErrorCodeServiceInternalError,
    AWSCloudformationHandlerErrorCodeNetworkFailure,
    AWSCloudformationHandlerErrorCodeInternalFailure,
};

typedef NS_ENUM(NSInteger, AWSCloudformationOnFailure) {
    AWSCloudformationOnFailureUnknown,
    AWSCloudformationOnFailureDoNothing,
    AWSCloudformationOnFailureRollback,
    AWSCloudformationOnFailureDelete,
};

typedef NS_ENUM(NSInteger, AWSCloudformationOperationStatus) {
    AWSCloudformationOperationStatusUnknown,
    AWSCloudformationOperationStatusPending,
    AWSCloudformationOperationStatusInProgress,
    AWSCloudformationOperationStatusSuccess,
    AWSCloudformationOperationStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSCloudformationPermissionModels) {
    AWSCloudformationPermissionModelsUnknown,
    AWSCloudformationPermissionModelsServiceManaged,
    AWSCloudformationPermissionModelsSelfManaged,
};

typedef NS_ENUM(NSInteger, AWSCloudformationProvisioningType) {
    AWSCloudformationProvisioningTypeUnknown,
    AWSCloudformationProvisioningTypeNonProvisionable,
    AWSCloudformationProvisioningTypeImmutable,
    AWSCloudformationProvisioningTypeFullyMutable,
};

typedef NS_ENUM(NSInteger, AWSCloudformationRegistrationStatus) {
    AWSCloudformationRegistrationStatusUnknown,
    AWSCloudformationRegistrationStatusComplete,
    AWSCloudformationRegistrationStatusInProgress,
    AWSCloudformationRegistrationStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSCloudformationRegistryType) {
    AWSCloudformationRegistryTypeUnknown,
    AWSCloudformationRegistryTypeResource,
};

typedef NS_ENUM(NSInteger, AWSCloudformationReplacement) {
    AWSCloudformationReplacementUnknown,
    AWSCloudformationReplacementTrue,
    AWSCloudformationReplacementFalse,
    AWSCloudformationReplacementConditional,
};

typedef NS_ENUM(NSInteger, AWSCloudformationRequiresRecreation) {
    AWSCloudformationRequiresRecreationUnknown,
    AWSCloudformationRequiresRecreationNever,
    AWSCloudformationRequiresRecreationConditionally,
    AWSCloudformationRequiresRecreationAlways,
};

typedef NS_ENUM(NSInteger, AWSCloudformationResourceAttribute) {
    AWSCloudformationResourceAttributeUnknown,
    AWSCloudformationResourceAttributeProperties,
    AWSCloudformationResourceAttributeMetadata,
    AWSCloudformationResourceAttributeCreationPolicy,
    AWSCloudformationResourceAttributeUpdatePolicy,
    AWSCloudformationResourceAttributeDeletionPolicy,
    AWSCloudformationResourceAttributeTags,
};

typedef NS_ENUM(NSInteger, AWSCloudformationResourceSignalStatus) {
    AWSCloudformationResourceSignalStatusUnknown,
    AWSCloudformationResourceSignalStatusSuccess,
    AWSCloudformationResourceSignalStatusFailure,
};

typedef NS_ENUM(NSInteger, AWSCloudformationResourceStatus) {
    AWSCloudformationResourceStatusUnknown,
    AWSCloudformationResourceStatusCreateInProgress,
    AWSCloudformationResourceStatusCreateFailed,
    AWSCloudformationResourceStatusCreateComplete,
    AWSCloudformationResourceStatusDeleteInProgress,
    AWSCloudformationResourceStatusDeleteFailed,
    AWSCloudformationResourceStatusDeleteComplete,
    AWSCloudformationResourceStatusDeleteSkipped,
    AWSCloudformationResourceStatusUpdateInProgress,
    AWSCloudformationResourceStatusUpdateFailed,
    AWSCloudformationResourceStatusUpdateComplete,
    AWSCloudformationResourceStatusImportFailed,
    AWSCloudformationResourceStatusImportComplete,
    AWSCloudformationResourceStatusImportInProgress,
    AWSCloudformationResourceStatusImportRollbackInProgress,
    AWSCloudformationResourceStatusImportRollbackFailed,
    AWSCloudformationResourceStatusImportRollbackComplete,
};

typedef NS_ENUM(NSInteger, AWSCloudformationStackDriftDetectionStatus) {
    AWSCloudformationStackDriftDetectionStatusUnknown,
    AWSCloudformationStackDriftDetectionStatusDetectionInProgress,
    AWSCloudformationStackDriftDetectionStatusDetectionFailed,
    AWSCloudformationStackDriftDetectionStatusDetectionComplete,
};

typedef NS_ENUM(NSInteger, AWSCloudformationStackDriftStatus) {
    AWSCloudformationStackDriftStatusUnknown,
    AWSCloudformationStackDriftStatusDrifted,
    AWSCloudformationStackDriftStatusInSync,
    AWSCloudformationStackDriftStatusNotChecked,
};

typedef NS_ENUM(NSInteger, AWSCloudformationStackInstanceDetailedStatus) {
    AWSCloudformationStackInstanceDetailedStatusUnknown,
    AWSCloudformationStackInstanceDetailedStatusPending,
    AWSCloudformationStackInstanceDetailedStatusRunning,
    AWSCloudformationStackInstanceDetailedStatusSucceeded,
    AWSCloudformationStackInstanceDetailedStatusFailed,
    AWSCloudformationStackInstanceDetailedStatusCancelled,
    AWSCloudformationStackInstanceDetailedStatusInoperable,
};

typedef NS_ENUM(NSInteger, AWSCloudformationStackInstanceFilterName) {
    AWSCloudformationStackInstanceFilterNameUnknown,
    AWSCloudformationStackInstanceFilterNameDetailedStatus,
};

typedef NS_ENUM(NSInteger, AWSCloudformationStackInstanceStatus) {
    AWSCloudformationStackInstanceStatusUnknown,
    AWSCloudformationStackInstanceStatusCurrent,
    AWSCloudformationStackInstanceStatusOutdated,
    AWSCloudformationStackInstanceStatusInoperable,
};

typedef NS_ENUM(NSInteger, AWSCloudformationStackResourceDriftStatus) {
    AWSCloudformationStackResourceDriftStatusUnknown,
    AWSCloudformationStackResourceDriftStatusInSync,
    AWSCloudformationStackResourceDriftStatusModified,
    AWSCloudformationStackResourceDriftStatusDeleted,
    AWSCloudformationStackResourceDriftStatusNotChecked,
};

typedef NS_ENUM(NSInteger, AWSCloudformationStackSetDriftDetectionStatus) {
    AWSCloudformationStackSetDriftDetectionStatusUnknown,
    AWSCloudformationStackSetDriftDetectionStatusCompleted,
    AWSCloudformationStackSetDriftDetectionStatusFailed,
    AWSCloudformationStackSetDriftDetectionStatusPartialSuccess,
    AWSCloudformationStackSetDriftDetectionStatusInProgress,
    AWSCloudformationStackSetDriftDetectionStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSCloudformationStackSetDriftStatus) {
    AWSCloudformationStackSetDriftStatusUnknown,
    AWSCloudformationStackSetDriftStatusDrifted,
    AWSCloudformationStackSetDriftStatusInSync,
    AWSCloudformationStackSetDriftStatusNotChecked,
};

typedef NS_ENUM(NSInteger, AWSCloudformationStackSetOperationAction) {
    AWSCloudformationStackSetOperationActionUnknown,
    AWSCloudformationStackSetOperationActionCreate,
    AWSCloudformationStackSetOperationActionUpdate,
    AWSCloudformationStackSetOperationActionDelete,
    AWSCloudformationStackSetOperationActionDetectDrift,
};

typedef NS_ENUM(NSInteger, AWSCloudformationStackSetOperationResultStatus) {
    AWSCloudformationStackSetOperationResultStatusUnknown,
    AWSCloudformationStackSetOperationResultStatusPending,
    AWSCloudformationStackSetOperationResultStatusRunning,
    AWSCloudformationStackSetOperationResultStatusSucceeded,
    AWSCloudformationStackSetOperationResultStatusFailed,
    AWSCloudformationStackSetOperationResultStatusCancelled,
};

typedef NS_ENUM(NSInteger, AWSCloudformationStackSetOperationStatus) {
    AWSCloudformationStackSetOperationStatusUnknown,
    AWSCloudformationStackSetOperationStatusRunning,
    AWSCloudformationStackSetOperationStatusSucceeded,
    AWSCloudformationStackSetOperationStatusFailed,
    AWSCloudformationStackSetOperationStatusStopping,
    AWSCloudformationStackSetOperationStatusStopped,
    AWSCloudformationStackSetOperationStatusQueued,
};

typedef NS_ENUM(NSInteger, AWSCloudformationStackSetStatus) {
    AWSCloudformationStackSetStatusUnknown,
    AWSCloudformationStackSetStatusActive,
    AWSCloudformationStackSetStatusDeleted,
};

typedef NS_ENUM(NSInteger, AWSCloudformationStackStatus) {
    AWSCloudformationStackStatusUnknown,
    AWSCloudformationStackStatusCreateInProgress,
    AWSCloudformationStackStatusCreateFailed,
    AWSCloudformationStackStatusCreateComplete,
    AWSCloudformationStackStatusRollbackInProgress,
    AWSCloudformationStackStatusRollbackFailed,
    AWSCloudformationStackStatusRollbackComplete,
    AWSCloudformationStackStatusDeleteInProgress,
    AWSCloudformationStackStatusDeleteFailed,
    AWSCloudformationStackStatusDeleteComplete,
    AWSCloudformationStackStatusUpdateInProgress,
    AWSCloudformationStackStatusUpdateCompleteCleanupInProgress,
    AWSCloudformationStackStatusUpdateComplete,
    AWSCloudformationStackStatusUpdateRollbackInProgress,
    AWSCloudformationStackStatusUpdateRollbackFailed,
    AWSCloudformationStackStatusUpdateRollbackCompleteCleanupInProgress,
    AWSCloudformationStackStatusUpdateRollbackComplete,
    AWSCloudformationStackStatusReviewInProgress,
    AWSCloudformationStackStatusImportInProgress,
    AWSCloudformationStackStatusImportComplete,
    AWSCloudformationStackStatusImportRollbackInProgress,
    AWSCloudformationStackStatusImportRollbackFailed,
    AWSCloudformationStackStatusImportRollbackComplete,
};

typedef NS_ENUM(NSInteger, AWSCloudformationTemplateStage) {
    AWSCloudformationTemplateStageUnknown,
    AWSCloudformationTemplateStageOriginal,
    AWSCloudformationTemplateStageProcessed,
};

typedef NS_ENUM(NSInteger, AWSCloudformationVisibility) {
    AWSCloudformationVisibilityUnknown,
    AWSCloudformationVisibilityPublic,
    AWSCloudformationVisibilityPrivate,
};

@class AWSCloudformationAccountGateResult;
@class AWSCloudformationAccountLimit;
@class AWSCloudformationAutoDeployment;
@class AWSCloudformationCancelUpdateStackInput;
@class AWSCloudformationChange;
@class AWSCloudformationChangeSetSummary;
@class AWSCloudformationContinueUpdateRollbackInput;
@class AWSCloudformationContinueUpdateRollbackOutput;
@class AWSCloudformationCreateChangeSetInput;
@class AWSCloudformationCreateChangeSetOutput;
@class AWSCloudformationCreateStackInput;
@class AWSCloudformationCreateStackInstancesInput;
@class AWSCloudformationCreateStackInstancesOutput;
@class AWSCloudformationCreateStackOutput;
@class AWSCloudformationCreateStackSetInput;
@class AWSCloudformationCreateStackSetOutput;
@class AWSCloudformationDeleteChangeSetInput;
@class AWSCloudformationDeleteChangeSetOutput;
@class AWSCloudformationDeleteStackInput;
@class AWSCloudformationDeleteStackInstancesInput;
@class AWSCloudformationDeleteStackInstancesOutput;
@class AWSCloudformationDeleteStackSetInput;
@class AWSCloudformationDeleteStackSetOutput;
@class AWSCloudformationDeploymentTargets;
@class AWSCloudformationDeregisterTypeInput;
@class AWSCloudformationDeregisterTypeOutput;
@class AWSCloudformationDescribeAccountLimitsInput;
@class AWSCloudformationDescribeAccountLimitsOutput;
@class AWSCloudformationDescribeChangeSetInput;
@class AWSCloudformationDescribeChangeSetOutput;
@class AWSCloudformationDescribeStackDriftDetectionStatusInput;
@class AWSCloudformationDescribeStackDriftDetectionStatusOutput;
@class AWSCloudformationDescribeStackEventsInput;
@class AWSCloudformationDescribeStackEventsOutput;
@class AWSCloudformationDescribeStackInstanceInput;
@class AWSCloudformationDescribeStackInstanceOutput;
@class AWSCloudformationDescribeStackResourceDriftsInput;
@class AWSCloudformationDescribeStackResourceDriftsOutput;
@class AWSCloudformationDescribeStackResourceInput;
@class AWSCloudformationDescribeStackResourceOutput;
@class AWSCloudformationDescribeStackResourcesInput;
@class AWSCloudformationDescribeStackResourcesOutput;
@class AWSCloudformationDescribeStackSetInput;
@class AWSCloudformationDescribeStackSetOperationInput;
@class AWSCloudformationDescribeStackSetOperationOutput;
@class AWSCloudformationDescribeStackSetOutput;
@class AWSCloudformationDescribeStacksInput;
@class AWSCloudformationDescribeStacksOutput;
@class AWSCloudformationDescribeTypeInput;
@class AWSCloudformationDescribeTypeOutput;
@class AWSCloudformationDescribeTypeRegistrationInput;
@class AWSCloudformationDescribeTypeRegistrationOutput;
@class AWSCloudformationDetectStackDriftInput;
@class AWSCloudformationDetectStackDriftOutput;
@class AWSCloudformationDetectStackResourceDriftInput;
@class AWSCloudformationDetectStackResourceDriftOutput;
@class AWSCloudformationDetectStackSetDriftInput;
@class AWSCloudformationDetectStackSetDriftOutput;
@class AWSCloudformationEstimateTemplateCostInput;
@class AWSCloudformationEstimateTemplateCostOutput;
@class AWSCloudformationExecuteChangeSetInput;
@class AWSCloudformationExecuteChangeSetOutput;
@class AWSCloudformationExport;
@class AWSCloudformationGetStackPolicyInput;
@class AWSCloudformationGetStackPolicyOutput;
@class AWSCloudformationGetTemplateInput;
@class AWSCloudformationGetTemplateOutput;
@class AWSCloudformationGetTemplateSummaryInput;
@class AWSCloudformationGetTemplateSummaryOutput;
@class AWSCloudformationListChangeSetsInput;
@class AWSCloudformationListChangeSetsOutput;
@class AWSCloudformationListExportsInput;
@class AWSCloudformationListExportsOutput;
@class AWSCloudformationListImportsInput;
@class AWSCloudformationListImportsOutput;
@class AWSCloudformationListStackInstancesInput;
@class AWSCloudformationListStackInstancesOutput;
@class AWSCloudformationListStackResourcesInput;
@class AWSCloudformationListStackResourcesOutput;
@class AWSCloudformationListStackSetOperationResultsInput;
@class AWSCloudformationListStackSetOperationResultsOutput;
@class AWSCloudformationListStackSetOperationsInput;
@class AWSCloudformationListStackSetOperationsOutput;
@class AWSCloudformationListStackSetsInput;
@class AWSCloudformationListStackSetsOutput;
@class AWSCloudformationListStacksInput;
@class AWSCloudformationListStacksOutput;
@class AWSCloudformationListTypeRegistrationsInput;
@class AWSCloudformationListTypeRegistrationsOutput;
@class AWSCloudformationListTypeVersionsInput;
@class AWSCloudformationListTypeVersionsOutput;
@class AWSCloudformationListTypesInput;
@class AWSCloudformationListTypesOutput;
@class AWSCloudformationLoggingConfig;
@class AWSCloudformationOutput;
@class AWSCloudformationParameter;
@class AWSCloudformationParameterConstraints;
@class AWSCloudformationParameterDeclaration;
@class AWSCloudformationPhysicalResourceIdContextKeyValuePair;
@class AWSCloudformationPropertyDifference;
@class AWSCloudformationRecordHandlerProgressInput;
@class AWSCloudformationRecordHandlerProgressOutput;
@class AWSCloudformationRegisterTypeInput;
@class AWSCloudformationRegisterTypeOutput;
@class AWSCloudformationResourceChange;
@class AWSCloudformationResourceChangeDetail;
@class AWSCloudformationResourceIdentifierSummary;
@class AWSCloudformationResourceTargetDefinition;
@class AWSCloudformationResourceToImport;
@class AWSCloudformationRollbackConfiguration;
@class AWSCloudformationRollbackTrigger;
@class AWSCloudformationSetStackPolicyInput;
@class AWSCloudformationSetTypeDefaultVersionInput;
@class AWSCloudformationSetTypeDefaultVersionOutput;
@class AWSCloudformationSignalResourceInput;
@class AWSCloudformationStack;
@class AWSCloudformationStackDriftInformation;
@class AWSCloudformationStackDriftInformationSummary;
@class AWSCloudformationStackEvent;
@class AWSCloudformationStackInstance;
@class AWSCloudformationStackInstanceComprehensiveStatus;
@class AWSCloudformationStackInstanceFilter;
@class AWSCloudformationStackInstanceSummary;
@class AWSCloudformationStackResource;
@class AWSCloudformationStackResourceDetail;
@class AWSCloudformationStackResourceDrift;
@class AWSCloudformationStackResourceDriftInformation;
@class AWSCloudformationStackResourceDriftInformationSummary;
@class AWSCloudformationStackResourceSummary;
@class AWSCloudformationStackSet;
@class AWSCloudformationStackSetDriftDetectionDetails;
@class AWSCloudformationStackSetOperation;
@class AWSCloudformationStackSetOperationPreferences;
@class AWSCloudformationStackSetOperationResultSummary;
@class AWSCloudformationStackSetOperationSummary;
@class AWSCloudformationStackSetSummary;
@class AWSCloudformationStackSummary;
@class AWSCloudformationStopStackSetOperationInput;
@class AWSCloudformationStopStackSetOperationOutput;
@class AWSCloudformationTag;
@class AWSCloudformationTemplateParameter;
@class AWSCloudformationTypeSummary;
@class AWSCloudformationTypeVersionSummary;
@class AWSCloudformationUpdateStackInput;
@class AWSCloudformationUpdateStackInstancesInput;
@class AWSCloudformationUpdateStackInstancesOutput;
@class AWSCloudformationUpdateStackOutput;
@class AWSCloudformationUpdateStackSetInput;
@class AWSCloudformationUpdateStackSetOutput;
@class AWSCloudformationUpdateTerminationProtectionInput;
@class AWSCloudformationUpdateTerminationProtectionOutput;
@class AWSCloudformationValidateTemplateInput;
@class AWSCloudformationValidateTemplateOutput;

/**
 <p>Structure that contains the results of the account gate function which AWS CloudFormation invokes, if present, before proceeding with a stack set operation in an account and Region.</p><p>For each account and Region, AWS CloudFormation lets you specify a Lamdba function that encapsulates any requirements that must be met before CloudFormation can proceed with a stack set operation in that account and Region. CloudFormation invokes the function each time a stack set operation is requested for that account and Region; if the function returns <code>FAILED</code>, CloudFormation cancels the operation in that account and Region, and sets the stack set operation result status for that account and Region to <code>FAILED</code>. </p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-account-gating.html">Configuring a target account gate</a>.</p>
 */
@interface AWSCloudformationAccountGateResult : AWSModel


/**
 <p>The status of the account gate function.</p><ul><li><p><code>SUCCEEDED</code>: The account gate function has determined that the account and Region passes any requirements for a stack set operation to occur. AWS CloudFormation proceeds with the stack operation in that account and Region. </p></li><li><p><code>FAILED</code>: The account gate function has determined that the account and Region does not meet the requirements for a stack set operation to occur. AWS CloudFormation cancels the stack set operation in that account and Region, and sets the stack set operation result status for that account and Region to <code>FAILED</code>. </p></li><li><p><code>SKIPPED</code>: AWS CloudFormation has skipped calling the account gate function for this account and Region, for one of the following reasons:</p><ul><li><p>An account gate function has not been specified for the account and Region. AWS CloudFormation proceeds with the stack set operation in this account and Region.</p></li><li><p>The <code>AWSCloudFormationStackSetExecutionRole</code> of the stack set adminstration account lacks permissions to invoke the function. AWS CloudFormation proceeds with the stack set operation in this account and Region.</p></li><li><p>Either no action is necessary, or no action is possible, on the stack. AWS CloudFormation skips the stack set operation in this account and Region.</p></li></ul></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationAccountGateStatus status;

/**
 <p>The reason for the account gate status assigned to this account and Region for the stack set operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

@end

/**
 <p>The AccountLimit data type. </p><p>CloudFormation has the following limits per account:</p><ul><li><p>Number of concurrent resources</p></li><li><p>Number of stacks</p></li><li><p>Number of stack outputs</p></li></ul><p>For more information about these account limits, and other CloudFormation limits, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html">AWS CloudFormation Limits</a> in the <i>AWS CloudFormation User Guide</i>.</p>
 */
@interface AWSCloudformationAccountLimit : AWSModel


/**
 <p>The name of the account limit.</p><p>Values: <code>ConcurrentResourcesLimit</code> | <code>StackLimit</code> | <code>StackOutputsLimit</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value that is associated with the account limit name.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>[<code>Service-managed</code> permissions] Describes whether StackSets automatically deploys to AWS Organizations accounts that are added to a target organization or organizational unit (OU).</p>
 */
@interface AWSCloudformationAutoDeployment : AWSModel


/**
 <p>If set to <code>true</code>, StackSets automatically deploys additional stack instances to AWS Organizations accounts that are added to a target organization or organizational unit (OU) in the specified Regions. If an account is removed from a target organization or OU, StackSets deletes stack instances from the account in the specified Regions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>If set to <code>true</code>, stack resources are retained when an account is removed from a target organization or OU. If set to <code>false</code>, stack resources are deleted. Specify only if <code>Enabled</code> is set to <code>True</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retainStacksOnAccountRemoval;

@end

/**
 <p>The input for the <a>CancelUpdateStack</a> action.</p>
 Required parameters: [StackName]
 */
@interface AWSCloudformationCancelUpdateStackInput : AWSRequest


/**
 <p>A unique identifier for this <code>CancelUpdateStack</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to cancel an update on a stack with the same name. You might retry <code>CancelUpdateStack</code> requests to ensure that AWS CloudFormation successfully received them.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The name or the unique stack ID that is associated with the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p>The <code>Change</code> structure describes the changes AWS CloudFormation will perform if you execute the change set.</p>
 */
@interface AWSCloudformationChange : AWSModel


/**
 <p>A <code>ResourceChange</code> structure that describes the resource and action that AWS CloudFormation will perform.</p>
 */
@property (nonatomic, strong) AWSCloudformationResourceChange * _Nullable resourceChange;

/**
 <p>The type of entity that AWS CloudFormation changes. Currently, the only entity type is <code>Resource</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationChangeType types;

@end

/**
 <p>The <code>ChangeSetSummary</code> structure describes a change set, its status, and the stack with which it's associated.</p>
 */
@interface AWSCloudformationChangeSetSummary : AWSModel


/**
 <p>The ID of the change set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetId;

/**
 <p>The name of the change set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetName;

/**
 <p>The start time when the change set was created, in UTC.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Descriptive information about the change set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If the change set execution status is <code>AVAILABLE</code>, you can execute the change set. If you can’t execute the change set, the status indicates why. For example, a change set might be in an <code>UNAVAILABLE</code> state because AWS CloudFormation is still creating it or in an <code>OBSOLETE</code> state because the stack was already updated.</p>
 */
@property (nonatomic, assign) AWSCloudformationExecutionStatus executionStatus;

/**
 <p>The ID of the stack with which the change set is associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

/**
 <p>The name of the stack with which the change set is associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>The state of the change set, such as <code>CREATE_IN_PROGRESS</code>, <code>CREATE_COMPLETE</code>, or <code>FAILED</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationChangeSetStatus status;

/**
 <p>A description of the change set's status. For example, if your change set is in the <code>FAILED</code> state, AWS CloudFormation shows the error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

@end

/**
 <p>The input for the <a>ContinueUpdateRollback</a> action.</p>
 Required parameters: [StackName]
 */
@interface AWSCloudformationContinueUpdateRollbackInput : AWSRequest


/**
 <p>A unique identifier for this <code>ContinueUpdateRollback</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to continue the rollback to a stack with the same name. You might retry <code>ContinueUpdateRollback</code> requests to ensure that AWS CloudFormation successfully received them.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>A list of the logical IDs of the resources that AWS CloudFormation skips during the continue update rollback operation. You can specify only resources that are in the <code>UPDATE_FAILED</code> state because a rollback failed. You can't specify resources that are in the <code>UPDATE_FAILED</code> state for other reasons, for example, because an update was cancelled. To check why a resource update failed, use the <a>DescribeStackResources</a> action, and view the resource status reason. </p><important><p>Specify this property to skip rolling back resources that AWS CloudFormation can't successfully roll back. We recommend that you <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed"> troubleshoot</a> resources before skipping them. AWS CloudFormation sets the status of the specified resources to <code>UPDATE_COMPLETE</code> and continues to roll back the stack. After the rollback is complete, the state of the skipped resources will be inconsistent with the state of the resources in the stack template. Before performing another stack update, you must update the stack or resources to be consistent with each other. If you don't, subsequent stack updates might fail, and the stack will become unrecoverable. </p></important><p>Specify the minimum number of resources required to successfully roll back your stack. For example, a failed resource update might cause dependent resources to fail. In this case, it might not be necessary to skip the dependent resources. </p><p>To skip resources that are part of nested stacks, use the following format: <code>NestedStackName.ResourceLogicalID</code>. If you want to specify the logical ID of a stack resource (<code>Type: AWS::CloudFormation::Stack</code>) in the <code>ResourcesToSkip</code> list, then its corresponding embedded stack must be in one of the following states: <code>DELETE_IN_PROGRESS</code>, <code>DELETE_COMPLETE</code>, or <code>DELETE_FAILED</code>. </p><note><p>Don't confuse a child stack's name with its corresponding logical ID defined in the parent stack. For an example of a continue update rollback operation with nested stacks, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html#nested-stacks">Using ResourcesToSkip to recover a nested stacks hierarchy</a>. </p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourcesToSkip;

/**
 <p>The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that AWS CloudFormation assumes to roll back the stack. AWS CloudFormation uses the role's credentials to make calls on your behalf. AWS CloudFormation always uses this role for all future operations on the stack. As long as users have permission to operate on the stack, AWS CloudFormation uses this role even if the users don't have permission to pass it. Ensure that the role grants least privilege.</p><p>If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The name or the unique ID of the stack that you want to continue rolling back.</p><note><p>Don't specify the name of a nested stack (a stack that was created by using the <code>AWS::CloudFormation::Stack</code> resource). Instead, use this operation on the parent stack (the stack that contains the <code>AWS::CloudFormation::Stack</code> resource).</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p>The output for a <a>ContinueUpdateRollback</a> action.</p>
 */
@interface AWSCloudformationContinueUpdateRollbackOutput : AWSModel


@end

/**
 <p>The input for the <a>CreateChangeSet</a> action.</p>
 Required parameters: [StackName, ChangeSetName]
 */
@interface AWSCloudformationCreateChangeSetInput : AWSRequest


/**
 <p>In some cases, you must explicitly acknowledge that your stack template contains certain capabilities in order for AWS CloudFormation to create the stack.</p><ul><li><p><code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code></p><p>Some stack templates might include resources that can affect permissions in your AWS account; for example, by creating new AWS Identity and Access Management (IAM) users. For those stacks, you must explicitly acknowledge this by specifying one of these capabilities.</p><p>The following IAM resources require you to specify either the <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code> capability.</p><ul><li><p>If you have IAM resources, you can specify either capability. </p></li><li><p>If you have IAM resources with custom names, you <i>must</i> specify <code>CAPABILITY_NAMED_IAM</code>. </p></li><li><p>If you don't specify either of these capabilities, AWS CloudFormation returns an <code>InsufficientCapabilities</code> error.</p></li></ul><p>If your stack template contains these resources, we recommend that you review all permissions associated with them and edit their permissions if necessary.</p><ul><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html"> AWS::IAM::AccessKey</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html"> AWS::IAM::Group</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html"> AWS::IAM::InstanceProfile</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html"> AWS::IAM::Policy</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html"> AWS::IAM::Role</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html"> AWS::IAM::User</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html"> AWS::IAM::UserToGroupAddition</a></p></li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p></li><li><p><code>CAPABILITY_AUTO_EXPAND</code></p><p>Some template contain macros. Macros perform custom processing on templates; this can include simple actions like find-and-replace operations, all the way to extensive transformations of entire templates. Because of this, users typically create a change set from the processed template, so that they can review the changes resulting from the macros before actually creating the stack. If your stack template contains one or more macros, and you choose to create a stack directly from the processed template, without first reviewing the resulting changes in a change set, you must acknowledge this capability. This includes the <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a> and <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a> transforms, which are macros hosted by AWS CloudFormation.</p><note><p>This capacity does not apply to creating change sets, and specifying it when creating change sets has no effect.</p><p>Also, change sets do not currently support nested stacks. If you want to create a stack from a stack template that contains macros <i>and</i> nested stacks, you must create or update the stack directly from the template using the <a>CreateStack</a> or <a>UpdateStack</a> action, and specifying this capability.</p></note><p>For more information on macros, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable capabilities;

/**
 <p>The name of the change set. The name must be unique among all change sets that are associated with the specified stack.</p><p>A change set name can contain only alphanumeric, case sensitive characters and hyphens. It must start with an alphabetic character and cannot exceed 128 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetName;

/**
 <p>The type of change set operation. To create a change set for a new stack, specify <code>CREATE</code>. To create a change set for an existing stack, specify <code>UPDATE</code>. To create a change set for an import operation, specify <code>IMPORT</code>.</p><p>If you create a change set for a new stack, AWS Cloudformation creates a stack with a unique stack ID, but no template or resources. The stack will be in the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-describing-stacks.html#d0e11995"><code>REVIEW_IN_PROGRESS</code></a> state until you execute the change set.</p><p>By default, AWS CloudFormation specifies <code>UPDATE</code>. You can't use the <code>UPDATE</code> type to create a change set for a new stack or the <code>CREATE</code> type to create a change set for an existing stack.</p>
 */
@property (nonatomic, assign) AWSCloudformationChangeSetType changeSetType;

/**
 <p>A unique identifier for this <code>CreateChangeSet</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to create another change set with the same name. You might retry <code>CreateChangeSet</code> requests to ensure that AWS CloudFormation successfully received them.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A description to help you identify this change set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Names (ARNs) of Amazon Simple Notification Service (Amazon SNS) topics that AWS CloudFormation associates with the stack. To remove all associated notification topics, specify an empty list.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notificationARNs;

/**
 <p>A list of <code>Parameter</code> structures that specify input parameters for the change set. For more information, see the <a>Parameter</a> data type.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationParameter *> * _Nullable parameters;

/**
 <p>The template resource types that you have permissions to work with if you execute this change set, such as <code>AWS::EC2::Instance</code>, <code>AWS::EC2::*</code>, or <code>Custom::MyCustomInstance</code>.</p><p>If the list of resource types doesn't include a resource type that you're updating, the stack update fails. By default, AWS CloudFormation grants permissions to all resource types. AWS Identity and Access Management (IAM) uses this parameter for condition keys in IAM policies for AWS CloudFormation. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html">Controlling Access with AWS Identity and Access Management</a> in the AWS CloudFormation User Guide.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceTypes;

/**
 <p>The resources to import into your stack.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationResourceToImport *> * _Nullable resourcesToImport;

/**
 <p>The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that AWS CloudFormation assumes when executing the change set. AWS CloudFormation uses the role's credentials to make calls on your behalf. AWS CloudFormation uses this role for all future operations on the stack. As long as users have permission to operate on the stack, AWS CloudFormation uses this role even if the users don't have permission to pass it. Ensure that the role grants least privilege.</p><p>If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The rollback triggers for AWS CloudFormation to monitor during stack creation and updating operations, and for the specified monitoring period afterwards.</p>
 */
@property (nonatomic, strong) AWSCloudformationRollbackConfiguration * _Nullable rollbackConfiguration;

/**
 <p>The name or the unique ID of the stack for which you are creating a change set. AWS CloudFormation generates the change set by comparing this stack's information with the information that you submit, such as a modified template or different parameter input values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>Key-value pairs to associate with this stack. AWS CloudFormation also propagates these tags to resources in the stack. You can specify a maximum of 50 tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationTag *> * _Nullable tags;

/**
 <p>A structure that contains the body of the revised template, with a minimum length of 1 byte and a maximum length of 51,200 bytes. AWS CloudFormation generates the change set by comparing this template with the template of the stack that you specified.</p><p>Conditional: You must specify only <code>TemplateBody</code> or <code>TemplateURL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

/**
 <p>The location of the file that contains the revised template. The URL must point to a template (max size: 460,800 bytes) that is located in an S3 bucket. AWS CloudFormation generates the change set by comparing this template with the stack that you specified.</p><p>Conditional: You must specify only <code>TemplateBody</code> or <code>TemplateURL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateURL;

/**
 <p>Whether to reuse the template that is associated with the stack to create the change set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usePreviousTemplate;

@end

/**
 <p>The output for the <a>CreateChangeSet</a> action.</p>
 */
@interface AWSCloudformationCreateChangeSetOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the change set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The unique ID of the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

@end

/**
 <p>The input for <a>CreateStack</a> action.</p>
 Required parameters: [StackName]
 */
@interface AWSCloudformationCreateStackInput : AWSRequest


/**
 <p>In some cases, you must explicitly acknowledge that your stack template contains certain capabilities in order for AWS CloudFormation to create the stack.</p><ul><li><p><code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code></p><p>Some stack templates might include resources that can affect permissions in your AWS account; for example, by creating new AWS Identity and Access Management (IAM) users. For those stacks, you must explicitly acknowledge this by specifying one of these capabilities.</p><p>The following IAM resources require you to specify either the <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code> capability.</p><ul><li><p>If you have IAM resources, you can specify either capability. </p></li><li><p>If you have IAM resources with custom names, you <i>must</i> specify <code>CAPABILITY_NAMED_IAM</code>. </p></li><li><p>If you don't specify either of these capabilities, AWS CloudFormation returns an <code>InsufficientCapabilities</code> error.</p></li></ul><p>If your stack template contains these resources, we recommend that you review all permissions associated with them and edit their permissions if necessary.</p><ul><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html"> AWS::IAM::AccessKey</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html"> AWS::IAM::Group</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html"> AWS::IAM::InstanceProfile</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html"> AWS::IAM::Policy</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html"> AWS::IAM::Role</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html"> AWS::IAM::User</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html"> AWS::IAM::UserToGroupAddition</a></p></li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p></li><li><p><code>CAPABILITY_AUTO_EXPAND</code></p><p>Some template contain macros. Macros perform custom processing on templates; this can include simple actions like find-and-replace operations, all the way to extensive transformations of entire templates. Because of this, users typically create a change set from the processed template, so that they can review the changes resulting from the macros before actually creating the stack. If your stack template contains one or more macros, and you choose to create a stack directly from the processed template, without first reviewing the resulting changes in a change set, you must acknowledge this capability. This includes the <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a> and <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a> transforms, which are macros hosted by AWS CloudFormation.</p><p>Change sets do not currently support nested stacks. If you want to create a stack from a stack template that contains macros <i>and</i> nested stacks, you must create the stack directly from the template using this capability.</p><important><p>You should only create stacks directly from a stack template that contains macros if you know what processing the macro performs.</p><p>Each macro relies on an underlying Lambda service function for processing stack templates. Be aware that the Lambda function owner can update the function operation without AWS CloudFormation being notified.</p></important><p>For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable capabilities;

/**
 <p>A unique identifier for this <code>CreateStack</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to create a stack with the same name. You might retry <code>CreateStack</code> requests to ensure that AWS CloudFormation successfully received them.</p><p>All events triggered by a given stack operation are assigned the same client request token, which you can use to track operations. For example, if you execute a <code>CreateStack</code> operation with the token <code>token1</code>, then all the <code>StackEvents</code> generated by that operation will have <code>ClientRequestToken</code> set as <code>token1</code>.</p><p>In the console, stack operations display the client request token on the Events tab. Stack operations that are initiated from the console use the token format <i>Console-StackOperation-ID</i>, which helps you easily identify the stack operation . For example, if you create a stack using the console, each stack event would be assigned the same token in the following format: <code>Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>Set to <code>true</code> to disable rollback of the stack if stack creation failed. You can specify either <code>DisableRollback</code> or <code>OnFailure</code>, but not both.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableRollback;

/**
 <p>Whether to enable termination protection on the specified stack. If a user attempts to delete a stack with termination protection enabled, the operation fails and the stack remains unchanged. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html">Protecting a Stack From Being Deleted</a> in the <i>AWS CloudFormation User Guide</i>. Termination protection is disabled on stacks by default. </p><p> For <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">nested stacks</a>, termination protection is set on the root stack and cannot be changed directly on the nested stack.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableTerminationProtection;

/**
 <p>The Simple Notification Service (SNS) topic ARNs to publish stack related events. You can find your SNS topic ARNs using the SNS console or your Command Line Interface (CLI).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notificationARNs;

/**
 <p>Determines what action will be taken if stack creation fails. This must be one of: DO_NOTHING, ROLLBACK, or DELETE. You can specify either <code>OnFailure</code> or <code>DisableRollback</code>, but not both.</p><p>Default: <code>ROLLBACK</code></p>
 */
@property (nonatomic, assign) AWSCloudformationOnFailure onFailure;

/**
 <p>A list of <code>Parameter</code> structures that specify input parameters for the stack. For more information, see the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html">Parameter</a> data type.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationParameter *> * _Nullable parameters;

/**
 <p>The template resource types that you have permissions to work with for this create stack action, such as <code>AWS::EC2::Instance</code>, <code>AWS::EC2::*</code>, or <code>Custom::MyCustomInstance</code>. Use the following syntax to describe template resource types: <code>AWS::*</code> (for all AWS resource), <code>Custom::*</code> (for all custom resources), <code>Custom::<i>logical_ID</i></code> (for a specific custom resource), <code>AWS::<i>service_name</i>::*</code> (for all resources of a particular AWS service), and <code>AWS::<i>service_name</i>::<i>resource_logical_ID</i></code> (for a specific AWS resource).</p><p>If the list of resource types doesn't include a resource that you're creating, the stack creation fails. By default, AWS CloudFormation grants permissions to all resource types. AWS Identity and Access Management (IAM) uses this parameter for AWS CloudFormation-specific condition keys in IAM policies. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html">Controlling Access with AWS Identity and Access Management</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceTypes;

/**
 <p>The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that AWS CloudFormation assumes to create the stack. AWS CloudFormation uses the role's credentials to make calls on your behalf. AWS CloudFormation always uses this role for all future operations on the stack. As long as users have permission to operate on the stack, AWS CloudFormation uses this role even if the users don't have permission to pass it. Ensure that the role grants least privilege.</p><p>If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The rollback triggers for AWS CloudFormation to monitor during stack creation and updating operations, and for the specified monitoring period afterwards.</p>
 */
@property (nonatomic, strong) AWSCloudformationRollbackConfiguration * _Nullable rollbackConfiguration;

/**
 <p>The name that is associated with the stack. The name must be unique in the Region in which you are creating the stack.</p><note><p>A stack name can contain only alphanumeric characters (case sensitive) and hyphens. It must start with an alphabetic character and cannot be longer than 128 characters.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>Structure containing the stack policy body. For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html"> Prevent Updates to Stack Resources</a> in the <i>AWS CloudFormation User Guide</i>. You can specify either the <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackPolicyBody;

/**
 <p>Location of a file containing the stack policy. The URL must point to a policy (maximum size: 16 KB) located in an S3 bucket in the same Region as the stack. You can specify either the <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackPolicyURL;

/**
 <p>Key-value pairs to associate with this stack. AWS CloudFormation also propagates these tags to the resources created in the stack. A maximum number of 50 tags can be specified.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationTag *> * _Nullable tags;

/**
 <p>Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes. For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.</p><p>Conditional: You must specify either the <code>TemplateBody</code> or the <code>TemplateURL</code> parameter, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

/**
 <p>Location of file containing the template body. The URL must point to a template (max size: 460,800 bytes) that is located in an Amazon S3 bucket. For more information, go to the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.</p><p>Conditional: You must specify either the <code>TemplateBody</code> or the <code>TemplateURL</code> parameter, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateURL;

/**
 <p>The amount of time that can pass before the stack status becomes CREATE_FAILED; if <code>DisableRollback</code> is not set or is set to <code>false</code>, the stack will be rolled back.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMinutes;

@end

/**
 
 */
@interface AWSCloudformationCreateStackInstancesInput : AWSRequest


/**
 <p>[<code>Self-managed</code> permissions] The names of one or more AWS accounts that you want to create stack instances in the specified Region(s) for.</p><p>You can specify <code>Accounts</code> or <code>DeploymentTargets</code>, but not both.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accounts;

/**
 <p>[<code>Service-managed</code> permissions] The AWS Organizations accounts for which to create stack instances in the specified Regions.</p><p>You can specify <code>Accounts</code> or <code>DeploymentTargets</code>, but not both.</p>
 */
@property (nonatomic, strong) AWSCloudformationDeploymentTargets * _Nullable deploymentTargets;

/**
 <p>The unique identifier for this stack set operation. </p><p>The operation ID also functions as an idempotency token, to ensure that AWS CloudFormation performs the stack set operation only once, even if you retry the request multiple times. You might retry stack set operation requests to ensure that AWS CloudFormation successfully received them.</p><p>If you don't specify an operation ID, the SDK generates one automatically. </p><p>Repeating this stack set operation with a new operation ID retries all stack instances whose status is <code>OUTDATED</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

/**
 <p>Preferences for how AWS CloudFormation performs this stack set operation.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackSetOperationPreferences * _Nullable operationPreferences;

/**
 <p>A list of stack set parameters whose values you want to override in the selected stack instances.</p><p>Any overridden parameter values will be applied to all stack instances in the specified accounts and Regions. When specifying parameters and their values, be aware of how AWS CloudFormation sets parameter values during stack instance operations:</p><ul><li><p>To override the current value for a parameter, include the parameter and specify its value.</p></li><li><p>To leave a parameter set to its present value, you can do one of the following:</p><ul><li><p>Do not include the parameter in the list.</p></li><li><p>Include the parameter and specify <code>UsePreviousValue</code> as <code>true</code>. (You cannot specify both a value and set <code>UsePreviousValue</code> to <code>true</code>.)</p></li></ul></li><li><p>To set all overridden parameter back to the values specified in the stack set, specify a parameter list but do not include any parameters.</p></li><li><p>To leave all parameters set to their present values, do not specify this property at all.</p></li></ul><p>During stack set updates, any parameter values overridden for a stack instance are not updated, but retain their overridden value.</p><p>You can only override the parameter <i>values</i> that are specified in the stack set; to add or delete a parameter itself, use <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html">UpdateStackSet</a> to update the stack set template.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationParameter *> * _Nullable parameterOverrides;

/**
 <p>The names of one or more Regions where you want to create stack instances using the specified AWS account(s). </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable regions;

/**
 <p>The name or unique ID of the stack set that you want to create stack instances from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

@end

/**
 
 */
@interface AWSCloudformationCreateStackInstancesOutput : AWSModel


/**
 <p>The unique identifier for this stack set operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>The output for a <a>CreateStack</a> action.</p>
 */
@interface AWSCloudformationCreateStackOutput : AWSModel


/**
 <p>Unique identifier of the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

@end

/**
 
 */
@interface AWSCloudformationCreateStackSetInput : AWSRequest


/**
 <p>The Amazon Resource Number (ARN) of the IAM role to use to create this stack set. </p><p>Specify an IAM role only if you are using customized administrator roles to control which users or groups can manage specific stack sets within the same administrator account. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html">Prerequisites: Granting Permissions for Stack Set Operations</a> in the <i>AWS CloudFormation User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable administrationRoleARN;

/**
 <p>Describes whether StackSets automatically deploys to AWS Organizations accounts that are added to the target organization or organizational unit (OU). Specify only if <code>PermissionModel</code> is <code>SERVICE_MANAGED</code>.</p>
 */
@property (nonatomic, strong) AWSCloudformationAutoDeployment * _Nullable autoDeployment;

/**
 <p>In some cases, you must explicitly acknowledge that your stack set template contains certain capabilities in order for AWS CloudFormation to create the stack set and related stack instances.</p><ul><li><p><code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code></p><p>Some stack templates might include resources that can affect permissions in your AWS account; for example, by creating new AWS Identity and Access Management (IAM) users. For those stack sets, you must explicitly acknowledge this by specifying one of these capabilities.</p><p>The following IAM resources require you to specify either the <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code> capability.</p><ul><li><p>If you have IAM resources, you can specify either capability. </p></li><li><p>If you have IAM resources with custom names, you <i>must</i> specify <code>CAPABILITY_NAMED_IAM</code>. </p></li><li><p>If you don't specify either of these capabilities, AWS CloudFormation returns an <code>InsufficientCapabilities</code> error.</p></li></ul><p>If your stack template contains these resources, we recommend that you review all permissions associated with them and edit their permissions if necessary.</p><ul><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html"> AWS::IAM::AccessKey</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html"> AWS::IAM::Group</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html"> AWS::IAM::InstanceProfile</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html"> AWS::IAM::Policy</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html"> AWS::IAM::Role</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html"> AWS::IAM::User</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html"> AWS::IAM::UserToGroupAddition</a></p></li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p></li><li><p><code>CAPABILITY_AUTO_EXPAND</code></p><p>Some templates contain macros. If your stack template contains one or more macros, and you choose to create a stack directly from the processed template, without first reviewing the resulting changes in a change set, you must acknowledge this capability. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.</p><note><p>Stack sets do not currently support macros in stack templates. (This includes the <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a> and <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a> transforms, which are macros hosted by AWS CloudFormation.) Even if you specify this capability, if you include a macro in your template the stack set operation will fail.</p></note></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable capabilities;

/**
 <p>A unique identifier for this <code>CreateStackSet</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to create another stack set with the same name. You might retry <code>CreateStackSet</code> requests to ensure that AWS CloudFormation successfully received them.</p><p>If you don't specify an operation ID, the SDK generates one automatically. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>A description of the stack set. You can use the description to identify the stack set's purpose or other important information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the IAM execution role to use to create the stack set. If you do not specify an execution role, AWS CloudFormation uses the <code>AWSCloudFormationStackSetExecutionRole</code> role for the stack set operation.</p><p>Specify an IAM role only if you are using customized execution roles to control which stack resources users and groups can include in their stack sets. </p>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleName;

/**
 <p>The input parameters for the stack set template. </p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationParameter *> * _Nullable parameters;

/**
 <p>Describes how the IAM roles required for stack set operations are created. By default, <code>SELF-MANAGED</code> is specified.</p><ul><li><p>With <code>self-managed</code> permissions, you must create the administrator and execution roles required to deploy to target accounts. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html">Grant Self-Managed Stack Set Permissions</a>.</p></li><li><p>With <code>service-managed</code> permissions, StackSets automatically creates the IAM roles required to deploy to accounts managed by AWS Organizations. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html">Grant Service-Managed Stack Set Permissions</a>.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationPermissionModels permissionModel;

/**
 <p>The name to associate with the stack set. The name must be unique in the Region where you create your stack set.</p><note><p>A stack name can contain only alphanumeric characters (case-sensitive) and hyphens. It must start with an alphabetic character and can't be longer than 128 characters.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

/**
 <p>The key-value pairs to associate with this stack set and the stacks created from it. AWS CloudFormation also propagates these tags to supported resources that are created in the stacks. A maximum number of 50 tags can be specified.</p><p>If you specify tags as part of a <code>CreateStackSet</code> action, AWS CloudFormation checks to see if you have the required IAM permission to tag resources. If you don't, the entire <code>CreateStackSet</code> action fails with an <code>access denied</code> error, and the stack set is not created.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationTag *> * _Nullable tags;

/**
 <p>The structure that contains the template body, with a minimum length of 1 byte and a maximum length of 51,200 bytes. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.</p><p>Conditional: You must specify either the TemplateBody or the TemplateURL parameter, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

/**
 <p>The location of the file that contains the template body. The URL must point to a template (maximum size: 460,800 bytes) that's located in an Amazon S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.</p><p>Conditional: You must specify either the TemplateBody or the TemplateURL parameter, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateURL;

@end

/**
 
 */
@interface AWSCloudformationCreateStackSetOutput : AWSModel


/**
 <p>The ID of the stack set that you're creating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetId;

@end

/**
 <p>The input for the <a>DeleteChangeSet</a> action.</p>
 Required parameters: [ChangeSetName]
 */
@interface AWSCloudformationDeleteChangeSetInput : AWSRequest


/**
 <p>The name or Amazon Resource Name (ARN) of the change set that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetName;

/**
 <p>If you specified the name of a change set to delete, specify the stack name or ID (ARN) that is associated with it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p>The output for the <a>DeleteChangeSet</a> action.</p>
 */
@interface AWSCloudformationDeleteChangeSetOutput : AWSModel


@end

/**
 <p>The input for <a>DeleteStack</a> action.</p>
 Required parameters: [StackName]
 */
@interface AWSCloudformationDeleteStackInput : AWSRequest


/**
 <p>A unique identifier for this <code>DeleteStack</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to delete a stack with the same name. You might retry <code>DeleteStack</code> requests to ensure that AWS CloudFormation successfully received them.</p><p>All events triggered by a given stack operation are assigned the same client request token, which you can use to track operations. For example, if you execute a <code>CreateStack</code> operation with the token <code>token1</code>, then all the <code>StackEvents</code> generated by that operation will have <code>ClientRequestToken</code> set as <code>token1</code>.</p><p>In the console, stack operations display the client request token on the Events tab. Stack operations that are initiated from the console use the token format <i>Console-StackOperation-ID</i>, which helps you easily identify the stack operation . For example, if you create a stack using the console, each stack event would be assigned the same token in the following format: <code>Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>For stacks in the <code>DELETE_FAILED</code> state, a list of resource logical IDs that are associated with the resources you want to retain. During deletion, AWS CloudFormation deletes the stack but does not delete the retained resources.</p><p>Retaining resources is useful when you cannot delete a resource, such as a non-empty S3 bucket, but you want to delete the stack.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable retainResources;

/**
 <p>The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that AWS CloudFormation assumes to delete the stack. AWS CloudFormation uses the role's credentials to make calls on your behalf.</p><p>If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The name or the unique stack ID that is associated with the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 
 */
@interface AWSCloudformationDeleteStackInstancesInput : AWSRequest


/**
 <p>[<code>Self-managed</code> permissions] The names of the AWS accounts that you want to delete stack instances for.</p><p>You can specify <code>Accounts</code> or <code>DeploymentTargets</code>, but not both.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accounts;

/**
 <p>[<code>Service-managed</code> permissions] The AWS Organizations accounts from which to delete stack instances.</p><p>You can specify <code>Accounts</code> or <code>DeploymentTargets</code>, but not both.</p>
 */
@property (nonatomic, strong) AWSCloudformationDeploymentTargets * _Nullable deploymentTargets;

/**
 <p>The unique identifier for this stack set operation. </p><p>If you don't specify an operation ID, the SDK generates one automatically. </p><p>The operation ID also functions as an idempotency token, to ensure that AWS CloudFormation performs the stack set operation only once, even if you retry the request multiple times. You can retry stack set operation requests to ensure that AWS CloudFormation successfully received them.</p><p>Repeating this stack set operation with a new operation ID retries all stack instances whose status is <code>OUTDATED</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

/**
 <p>Preferences for how AWS CloudFormation performs this stack set operation.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackSetOperationPreferences * _Nullable operationPreferences;

/**
 <p>The Regions where you want to delete stack set instances. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable regions;

/**
 <p>Removes the stack instances from the specified stack set, but doesn't delete the stacks. You can't reassociate a retained stack or add an existing, saved stack to a new stack set.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options">Stack set operation options</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retainStacks;

/**
 <p>The name or unique ID of the stack set that you want to delete stack instances for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

@end

/**
 
 */
@interface AWSCloudformationDeleteStackInstancesOutput : AWSModel


/**
 <p>The unique identifier for this stack set operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 
 */
@interface AWSCloudformationDeleteStackSetInput : AWSRequest


/**
 <p>The name or unique ID of the stack set that you're deleting. You can obtain this value by running <a>ListStackSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

@end

/**
 
 */
@interface AWSCloudformationDeleteStackSetOutput : AWSModel


@end

/**
 <p>[<code>Service-managed</code> permissions] The AWS Organizations accounts to which StackSets deploys. StackSets does not deploy stack instances to the organization master account, even if the master account is in your organization or in an OU in your organization.</p><p>For update operations, you can specify either <code>Accounts</code> or <code>OrganizationalUnitIds</code>. For create and delete operations, specify <code>OrganizationalUnitIds</code>.</p>
 */
@interface AWSCloudformationDeploymentTargets : AWSModel


/**
 <p>The names of one or more AWS accounts for which you want to deploy stack set updates.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accounts;

/**
 <p>The organization root ID or organizational unit (OU) IDs to which StackSets deploys.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable organizationalUnitIds;

@end

/**
 
 */
@interface AWSCloudformationDeregisterTypeInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the type.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The kind of type.</p><p>Currently the only valid value is <code>RESOURCE</code>.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationRegistryType types;

/**
 <p>The name of the type.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

/**
 <p>The ID of a specific version of the type. The version ID is the value at the end of the Amazon Resource Name (ARN) assigned to the type version when it is registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSCloudformationDeregisterTypeOutput : AWSModel


@end

/**
 <p>The input for the <a>DescribeAccountLimits</a> action.</p>
 */
@interface AWSCloudformationDescribeAccountLimitsInput : AWSRequest


/**
 <p>A string that identifies the next page of limits that you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The output for the <a>DescribeAccountLimits</a> action.</p>
 */
@interface AWSCloudformationDescribeAccountLimitsOutput : AWSModel


/**
 <p>An account limit structure that contain a list of AWS CloudFormation account limits and their values.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationAccountLimit *> * _Nullable accountLimits;

/**
 <p>If the output exceeds 1 MB in size, a string that identifies the next page of limits. If no additional page exists, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The input for the <a>DescribeChangeSet</a> action.</p>
 Required parameters: [ChangeSetName]
 */
@interface AWSCloudformationDescribeChangeSetInput : AWSRequest


/**
 <p>The name or Amazon Resource Name (ARN) of the change set that you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetName;

/**
 <p>A string (provided by the <a>DescribeChangeSet</a> response output) that identifies the next page of information that you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>If you specified the name of a change set, specify the stack name or ID (ARN) of the change set you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p>The output for the <a>DescribeChangeSet</a> action.</p>
 */
@interface AWSCloudformationDescribeChangeSetOutput : AWSModel


/**
 <p>If you execute the change set, the list of capabilities that were explicitly acknowledged when the change set was created.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable capabilities;

/**
 <p>The ARN of the change set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetId;

/**
 <p>The name of the change set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetName;

/**
 <p>A list of <code>Change</code> structures that describes the resources AWS CloudFormation changes if you execute the change set.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationChange *> * _Nullable changes;

/**
 <p>The start time when the change set was created, in UTC.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Information about the change set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If the change set execution status is <code>AVAILABLE</code>, you can execute the change set. If you can’t execute the change set, the status indicates why. For example, a change set might be in an <code>UNAVAILABLE</code> state because AWS CloudFormation is still creating it or in an <code>OBSOLETE</code> state because the stack was already updated.</p>
 */
@property (nonatomic, assign) AWSCloudformationExecutionStatus executionStatus;

/**
 <p>If the output exceeds 1 MB, a string that identifies the next page of changes. If there is no additional page, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ARNs of the Amazon Simple Notification Service (Amazon SNS) topics that will be associated with the stack if you execute the change set.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notificationARNs;

/**
 <p>A list of <code>Parameter</code> structures that describes the input parameters and their values used to create the change set. For more information, see the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html">Parameter</a> data type.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationParameter *> * _Nullable parameters;

/**
 <p>The rollback triggers for AWS CloudFormation to monitor during stack creation and updating operations, and for the specified monitoring period afterwards.</p>
 */
@property (nonatomic, strong) AWSCloudformationRollbackConfiguration * _Nullable rollbackConfiguration;

/**
 <p>The ARN of the stack that is associated with the change set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

/**
 <p>The name of the stack that is associated with the change set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>The current status of the change set, such as <code>CREATE_IN_PROGRESS</code>, <code>CREATE_COMPLETE</code>, or <code>FAILED</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationChangeSetStatus status;

/**
 <p>A description of the change set's status. For example, if your attempt to create a change set failed, AWS CloudFormation shows the error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

/**
 <p>If you execute the change set, the tags that will be associated with the stack.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSCloudformationDescribeStackDriftDetectionStatusInput : AWSRequest


/**
 <p>The ID of the drift detection results of this operation. </p><p>AWS CloudFormation generates new results, with a new drift detection ID, each time this operation is run. However, the number of drift results AWS CloudFormation retains for any given stack, and for how long, may vary. </p>
 */
@property (nonatomic, strong) NSString * _Nullable stackDriftDetectionId;

@end

/**
 
 */
@interface AWSCloudformationDescribeStackDriftDetectionStatusOutput : AWSModel


/**
 <p>The status of the stack drift detection operation.</p><ul><li><p><code>DETECTION_COMPLETE</code>: The stack drift detection operation has successfully completed for all resources in the stack that support drift detection. (Resources that do not currently support stack detection remain unchecked.)</p><p>If you specified logical resource IDs for AWS CloudFormation to use as a filter for the stack drift detection operation, only the resources with those logical IDs are checked for drift.</p></li><li><p><code>DETECTION_FAILED</code>: The stack drift detection operation has failed for at least one resource in the stack. Results will be available for resources on which AWS CloudFormation successfully completed drift detection.</p></li><li><p><code>DETECTION_IN_PROGRESS</code>: The stack drift detection operation is currently in progress.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackDriftDetectionStatus detectionStatus;

/**
 <p>The reason the stack drift detection operation has its current status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectionStatusReason;

/**
 <p>Total number of stack resources that have drifted. This is NULL until the drift detection operation reaches a status of <code>DETECTION_COMPLETE</code>. This value will be 0 for stacks whose drift status is <code>IN_SYNC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable driftedStackResourceCount;

/**
 <p>The ID of the drift detection results of this operation. </p><p>AWS CloudFormation generates new results, with a new drift detection ID, each time this operation is run. However, the number of reports AWS CloudFormation retains for any given stack, and for how long, may vary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackDriftDetectionId;

/**
 <p>Status of the stack's actual configuration compared to its expected configuration. </p><ul><li><p><code>DRIFTED</code>: The stack differs from its expected template configuration. A stack is considered to have drifted if one or more of its resources have drifted.</p></li><li><p><code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack differs from its expected template configuration.</p></li><li><p><code>IN_SYNC</code>: The stack's actual configuration matches its expected template configuration.</p></li><li><p><code>UNKNOWN</code>: This value is reserved for future use.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackDriftStatus stackDriftStatus;

/**
 <p>The ID of the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

/**
 <p>Time at which the stack drift detection operation was initiated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 <p>The input for <a>DescribeStackEvents</a> action.</p>
 */
@interface AWSCloudformationDescribeStackEventsInput : AWSRequest


/**
 <p>A string that identifies the next page of events that you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name or the unique stack ID that is associated with the stack, which are not always interchangeable:</p><ul><li><p>Running stacks: You can specify either the stack's name or its unique stack ID.</p></li><li><p>Deleted stacks: You must specify the unique stack ID.</p></li></ul><p>Default: There is no default value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p>The output for a <a>DescribeStackEvents</a> action.</p>
 */
@interface AWSCloudformationDescribeStackEventsOutput : AWSModel


/**
 <p>If the output exceeds 1 MB in size, a string that identifies the next page of events. If no additional page exists, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>StackEvents</code> structures.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationStackEvent *> * _Nullable stackEvents;

@end

/**
 
 */
@interface AWSCloudformationDescribeStackInstanceInput : AWSRequest


/**
 <p>The ID of an AWS account that's associated with this stack instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackInstanceAccount;

/**
 <p>The name of a Region that's associated with this stack instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackInstanceRegion;

/**
 <p>The name or the unique stack ID of the stack set that you want to get stack instance information for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

@end

/**
 
 */
@interface AWSCloudformationDescribeStackInstanceOutput : AWSModel


/**
 <p>The stack instance that matches the specified request parameters.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackInstance * _Nullable stackInstance;

@end

/**
 
 */
@interface AWSCloudformationDescribeStackResourceDriftsInput : AWSRequest


/**
 <p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string that identifies the next page of stack resource drift results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the stack for which you want drift information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>The resource drift status values to use as filters for the resource drift results returned.</p><ul><li><p><code>DELETED</code>: The resource differs from its expected template configuration in that the resource has been deleted.</p></li><li><p><code>MODIFIED</code>: One or more resource properties differ from their expected template values.</p></li><li><p><code>IN_SYNC</code>: The resources's actual configuration matches its expected template configuration.</p></li><li><p><code>NOT_CHECKED</code>: AWS CloudFormation does not currently return this value.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stackResourceDriftStatusFilters;

@end

/**
 
 */
@interface AWSCloudformationDescribeStackResourceDriftsOutput : AWSModel


/**
 <p>If the request doesn't return all of the remaining results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call <code>DescribeStackResourceDrifts</code> again and assign that token to the request object's <code>NextToken</code> parameter. If the request returns all results, <code>NextToken</code> is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Drift information for the resources that have been checked for drift in the specified stack. This includes actual and expected configuration values for resources where AWS CloudFormation detects drift.</p><p>For a given stack, there will be one <code>StackResourceDrift</code> for each stack resource that has been checked for drift. Resources that have not yet been checked for drift are not included. Resources that do not currently support drift detection are not checked, and so not included. For a list of resources that support drift detection, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources that Support Drift Detection</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationStackResourceDrift *> * _Nullable stackResourceDrifts;

@end

/**
 <p>The input for <a>DescribeStackResource</a> action.</p>
 Required parameters: [StackName, LogicalResourceId]
 */
@interface AWSCloudformationDescribeStackResourceInput : AWSRequest


/**
 <p>The logical name of the resource as specified in the template.</p><p>Default: There is no default value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logicalResourceId;

/**
 <p>The name or the unique stack ID that is associated with the stack, which are not always interchangeable:</p><ul><li><p>Running stacks: You can specify either the stack's name or its unique stack ID.</p></li><li><p>Deleted stacks: You must specify the unique stack ID.</p></li></ul><p>Default: There is no default value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p>The output for a <a>DescribeStackResource</a> action.</p>
 */
@interface AWSCloudformationDescribeStackResourceOutput : AWSModel


/**
 <p>A <code>StackResourceDetail</code> structure containing the description of the specified resource in the specified stack.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackResourceDetail * _Nullable stackResourceDetail;

@end

/**
 <p>The input for <a>DescribeStackResources</a> action.</p>
 */
@interface AWSCloudformationDescribeStackResourcesInput : AWSRequest


/**
 <p>The logical name of the resource as specified in the template.</p><p>Default: There is no default value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logicalResourceId;

/**
 <p>The name or unique identifier that corresponds to a physical instance ID of a resource supported by AWS CloudFormation.</p><p>For example, for an Amazon Elastic Compute Cloud (EC2) instance, <code>PhysicalResourceId</code> corresponds to the <code>InstanceId</code>. You can pass the EC2 <code>InstanceId</code> to <code>DescribeStackResources</code> to find which stack the instance belongs to and what other resources are part of the stack.</p><p>Required: Conditional. If you do not specify <code>PhysicalResourceId</code>, you must specify <code>StackName</code>.</p><p>Default: There is no default value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable physicalResourceId;

/**
 <p>The name or the unique stack ID that is associated with the stack, which are not always interchangeable:</p><ul><li><p>Running stacks: You can specify either the stack's name or its unique stack ID.</p></li><li><p>Deleted stacks: You must specify the unique stack ID.</p></li></ul><p>Default: There is no default value.</p><p>Required: Conditional. If you do not specify <code>StackName</code>, you must specify <code>PhysicalResourceId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p>The output for a <a>DescribeStackResources</a> action.</p>
 */
@interface AWSCloudformationDescribeStackResourcesOutput : AWSModel


/**
 <p>A list of <code>StackResource</code> structures.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationStackResource *> * _Nullable stackResources;

@end

/**
 
 */
@interface AWSCloudformationDescribeStackSetInput : AWSRequest


/**
 <p>The name or unique ID of the stack set whose description you want.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

@end

/**
 
 */
@interface AWSCloudformationDescribeStackSetOperationInput : AWSRequest


/**
 <p>The unique ID of the stack set operation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

/**
 <p>The name or the unique stack ID of the stack set for the stack operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

@end

/**
 
 */
@interface AWSCloudformationDescribeStackSetOperationOutput : AWSModel


/**
 <p>The specified stack set operation.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackSetOperation * _Nullable stackSetOperation;

@end

/**
 
 */
@interface AWSCloudformationDescribeStackSetOutput : AWSModel


/**
 <p>The specified stack set.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackSet * _Nullable stackSet;

@end

/**
 <p>The input for <a>DescribeStacks</a> action.</p>
 */
@interface AWSCloudformationDescribeStacksInput : AWSRequest


/**
 <p>A string that identifies the next page of stacks that you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name or the unique stack ID that is associated with the stack, which are not always interchangeable:</p><ul><li><p>Running stacks: You can specify either the stack's name or its unique stack ID.</p></li><li><p>Deleted stacks: You must specify the unique stack ID.</p></li></ul><p>Default: There is no default value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p>The output for a <a>DescribeStacks</a> action.</p>
 */
@interface AWSCloudformationDescribeStacksOutput : AWSModel


/**
 <p>If the output exceeds 1 MB in size, a string that identifies the next page of stacks. If no additional page exists, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of stack structures.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationStack *> * _Nullable stacks;

@end

/**
 
 */
@interface AWSCloudformationDescribeTypeInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the type.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The kind of type. </p><p>Currently the only valid value is <code>RESOURCE</code>.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationRegistryType types;

/**
 <p>The name of the type.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

/**
 <p>The ID of a specific version of the type. The version ID is the value at the end of the Amazon Resource Name (ARN) assigned to the type version when it is registered.</p><p>If you specify a <code>VersionId</code>, <code>DescribeType</code> returns information about that specific type version. Otherwise, it returns information about the default type version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSCloudformationDescribeTypeOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The ID of the default version of the type. The default version is used when the type version is not specified.</p><p>To set the default version of a type, use <code><a>SetTypeDefaultVersion</a></code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultVersionId;

/**
 <p>The deprecation status of the type.</p><p>Valid values include:</p><ul><li><p><code>LIVE</code>: The type is registered and can be used in CloudFormation operations, dependent on its provisioning behavior and visibility scope.</p></li><li><p><code>DEPRECATED</code>: The type has been deregistered and can no longer be used in CloudFormation operations. </p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationDeprecatedStatus deprecatedStatus;

/**
 <p>The description of the registered type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The URL of a page providing detailed documentation for this type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable documentationUrl;

/**
 <p>The Amazon Resource Name (ARN) of the IAM execution role used to register the type. If your resource type calls AWS APIs in any of its handlers, you must create an <i><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM execution role</a></i> that includes the necessary permissions to call those AWS APIs, and provision that execution role in your account. CloudFormation then assumes that execution role to provide your resource type with the appropriate credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleArn;

/**
 <p>Whether the specified type version is set as the default version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>When the specified type version was registered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdated;

/**
 <p>Contains logging configuration information for a type.</p>
 */
@property (nonatomic, strong) AWSCloudformationLoggingConfig * _Nullable loggingConfig;

/**
 <p>The provisioning behavior of the type. AWS CloudFormation determines the provisioning type during registration, based on the types of handlers in the schema handler package submitted.</p><p>Valid values include:</p><ul><li><p><code>FULLY_MUTABLE</code>: The type includes an update handler to process updates to the type during stack update operations.</p></li><li><p><code>IMMUTABLE</code>: The type does not include an update handler, so the type cannot be updated and must instead be replaced during stack update operations.</p></li><li><p><code>NON_PROVISIONABLE</code>: The type does not include all of the following handlers, and therefore cannot actually be provisioned.</p><ul><li><p>create</p></li><li><p>read</p></li><li><p>delete</p></li></ul></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationProvisioningType provisioningType;

/**
 <p>The schema that defines the type.</p><p>For more information on type schemas, see <a href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html">Resource Provider Schema</a> in the <i>CloudFormation CLI User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schema;

/**
 <p>The URL of the source code for the type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceUrl;

/**
 <p>When the specified type version was registered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timeCreated;

/**
 <p>The kind of type. </p><p>Currently the only valid value is <code>RESOURCE</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationRegistryType types;

/**
 <p>The name of the registered type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

/**
 <p>The scope at which the type is visible and usable in CloudFormation operations.</p><p>Valid values include:</p><ul><li><p><code>PRIVATE</code>: The type is only visible and usable within the account in which it is registered. Currently, AWS CloudFormation marks any types you register as <code>PRIVATE</code>.</p></li><li><p><code>PUBLIC</code>: The type is publically visible and usable within any Amazon account.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationVisibility visibility;

@end

/**
 
 */
@interface AWSCloudformationDescribeTypeRegistrationInput : AWSRequest


/**
 <p>The identifier for this registration request.</p><p>This registration token is generated by CloudFormation when you initiate a registration request using <code><a>RegisterType</a></code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registrationToken;

@end

/**
 
 */
@interface AWSCloudformationDescribeTypeRegistrationOutput : AWSModel


/**
 <p>The description of the type registration request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The current status of the type registration request.</p>
 */
@property (nonatomic, assign) AWSCloudformationRegistrationStatus progressStatus;

/**
 <p>The Amazon Resource Name (ARN) of the type being registered.</p><p>For registration requests with a <code>ProgressStatus</code> of other than <code>COMPLETE</code>, this will be <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeArn;

/**
 <p>The Amazon Resource Name (ARN) of this specific version of the type being registered.</p><p>For registration requests with a <code>ProgressStatus</code> of other than <code>COMPLETE</code>, this will be <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeVersionArn;

@end

/**
 
 */
@interface AWSCloudformationDetectStackDriftInput : AWSRequest


/**
 <p>The logical names of any resources you want to use as filters.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logicalResourceIds;

/**
 <p>The name of the stack for which you want to detect drift. </p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 
 */
@interface AWSCloudformationDetectStackDriftOutput : AWSModel


/**
 <p>The ID of the drift detection results of this operation. </p><p>AWS CloudFormation generates new results, with a new drift detection ID, each time this operation is run. However, the number of drift results AWS CloudFormation retains for any given stack, and for how long, may vary. </p>
 */
@property (nonatomic, strong) NSString * _Nullable stackDriftDetectionId;

@end

/**
 
 */
@interface AWSCloudformationDetectStackResourceDriftInput : AWSRequest


/**
 <p>The logical name of the resource for which to return drift information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logicalResourceId;

/**
 <p>The name of the stack to which the resource belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 
 */
@interface AWSCloudformationDetectStackResourceDriftOutput : AWSModel


/**
 <p>Information about whether the resource's actual configuration has drifted from its expected template configuration, including actual and expected property values and any differences detected.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackResourceDrift * _Nullable stackResourceDrift;

@end

/**
 
 */
@interface AWSCloudformationDetectStackSetDriftInput : AWSRequest


/**
 <p><i>The ID of the stack set operation.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

/**
 <p>The user-specified preferences for how AWS CloudFormation performs a stack set operation. </p><p>For more information on maximum concurrent accounts and failure tolerance, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options">Stack set operation options</a>.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackSetOperationPreferences * _Nullable operationPreferences;

/**
 <p>The name of the stack set on which to perform the drift detection operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

@end

/**
 
 */
@interface AWSCloudformationDetectStackSetDriftOutput : AWSModel


/**
 <p>The ID of the drift detection stack set operation. </p><p>you can use this operation id with <code><a>DescribeStackSetOperation</a></code> to monitor the progress of the drift detection operation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>The input for an <a>EstimateTemplateCost</a> action.</p>
 */
@interface AWSCloudformationEstimateTemplateCostInput : AWSRequest


/**
 <p>A list of <code>Parameter</code> structures that specify input parameters.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationParameter *> * _Nullable parameters;

/**
 <p>Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes. (For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.)</p><p>Conditional: You must pass <code>TemplateBody</code> or <code>TemplateURL</code>. If both are passed, only <code>TemplateBody</code> is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

/**
 <p>Location of file containing the template body. The URL must point to a template that is located in an Amazon S3 bucket. For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.</p><p>Conditional: You must pass <code>TemplateURL</code> or <code>TemplateBody</code>. If both are passed, only <code>TemplateBody</code> is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateURL;

@end

/**
 <p>The output for a <a>EstimateTemplateCost</a> action.</p>
 */
@interface AWSCloudformationEstimateTemplateCostOutput : AWSModel


/**
 <p>An AWS Simple Monthly Calculator URL with a query string that describes the resources required to run the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>The input for the <a>ExecuteChangeSet</a> action.</p>
 Required parameters: [ChangeSetName]
 */
@interface AWSCloudformationExecuteChangeSetInput : AWSRequest


/**
 <p>The name or ARN of the change set that you want use to update the specified stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetName;

/**
 <p>A unique identifier for this <code>ExecuteChangeSet</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to execute a change set to update a stack with the same name. You might retry <code>ExecuteChangeSet</code> requests to ensure that AWS CloudFormation successfully received them.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>If you specified the name of a change set, specify the stack name or ID (ARN) that is associated with the change set you want to execute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p>The output for the <a>ExecuteChangeSet</a> action.</p>
 */
@interface AWSCloudformationExecuteChangeSetOutput : AWSModel


@end

/**
 <p>The <code>Export</code> structure describes the exported output values for a stack.</p>
 */
@interface AWSCloudformationExport : AWSModel


/**
 <p>The stack that contains the exported output name and value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exportingStackId;

/**
 <p>The name of exported output value. Use this name and the <code>Fn::ImportValue</code> function to import the associated value into other stacks. The name is defined in the <code>Export</code> field in the associated stack's <code>Outputs</code> section.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of the exported output, such as a resource physical ID. This value is defined in the <code>Export</code> field in the associated stack's <code>Outputs</code> section.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The input for the <a>GetStackPolicy</a> action.</p>
 Required parameters: [StackName]
 */
@interface AWSCloudformationGetStackPolicyInput : AWSRequest


/**
 <p>The name or unique stack ID that is associated with the stack whose policy you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p>The output for the <a>GetStackPolicy</a> action.</p>
 */
@interface AWSCloudformationGetStackPolicyOutput : AWSModel


/**
 <p>Structure containing the stack policy body. (For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html"> Prevent Updates to Stack Resources</a> in the AWS CloudFormation User Guide.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackPolicyBody;

@end

/**
 <p>The input for a <a>GetTemplate</a> action.</p>
 */
@interface AWSCloudformationGetTemplateInput : AWSRequest


/**
 <p>The name or Amazon Resource Name (ARN) of a change set for which AWS CloudFormation returns the associated template. If you specify a name, you must also specify the <code>StackName</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetName;

/**
 <p>The name or the unique stack ID that is associated with the stack, which are not always interchangeable:</p><ul><li><p>Running stacks: You can specify either the stack's name or its unique stack ID.</p></li><li><p>Deleted stacks: You must specify the unique stack ID.</p></li></ul><p>Default: There is no default value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>For templates that include transforms, the stage of the template that AWS CloudFormation returns. To get the user-submitted template, specify <code>Original</code>. To get the template after AWS CloudFormation has processed all transforms, specify <code>Processed</code>. </p><p>If the template doesn't include transforms, <code>Original</code> and <code>Processed</code> return the same template. By default, AWS CloudFormation specifies <code>Original</code>. </p>
 */
@property (nonatomic, assign) AWSCloudformationTemplateStage templateStage;

@end

/**
 <p>The output for <a>GetTemplate</a> action.</p>
 */
@interface AWSCloudformationGetTemplateOutput : AWSModel


/**
 <p>The stage of the template that you can retrieve. For stacks, the <code>Original</code> and <code>Processed</code> templates are always available. For change sets, the <code>Original</code> template is always available. After AWS CloudFormation finishes creating the change set, the <code>Processed</code> template becomes available.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stagesAvailable;

/**
 <p>Structure containing the template body. (For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.)</p><p>AWS CloudFormation returns the same template that was used when the stack was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

@end

/**
 <p>The input for the <a>GetTemplateSummary</a> action.</p>
 */
@interface AWSCloudformationGetTemplateSummaryInput : AWSRequest


/**
 <p>The name or the stack ID that is associated with the stack, which are not always interchangeable. For running stacks, you can specify either the stack's name or its unique stack ID. For deleted stack, you must specify the unique stack ID.</p><p>Conditional: You must specify only one of the following parameters: <code>StackName</code>, <code>StackSetName</code>, <code>TemplateBody</code>, or <code>TemplateURL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>The name or unique ID of the stack set from which the stack was created.</p><p>Conditional: You must specify only one of the following parameters: <code>StackName</code>, <code>StackSetName</code>, <code>TemplateBody</code>, or <code>TemplateURL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

/**
 <p>Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes. For more information about templates, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.</p><p>Conditional: You must specify only one of the following parameters: <code>StackName</code>, <code>StackSetName</code>, <code>TemplateBody</code>, or <code>TemplateURL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

/**
 <p>Location of file containing the template body. The URL must point to a template (max size: 460,800 bytes) that is located in an Amazon S3 bucket. For more information about templates, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.</p><p>Conditional: You must specify only one of the following parameters: <code>StackName</code>, <code>StackSetName</code>, <code>TemplateBody</code>, or <code>TemplateURL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateURL;

@end

/**
 <p>The output for the <a>GetTemplateSummary</a> action.</p>
 */
@interface AWSCloudformationGetTemplateSummaryOutput : AWSModel


/**
 <p>The capabilities found within the template. If your template contains IAM resources, you must specify the CAPABILITY_IAM or CAPABILITY_NAMED_IAM value for this parameter when you use the <a>CreateStack</a> or <a>UpdateStack</a> actions with your template; otherwise, those actions return an InsufficientCapabilities error.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable capabilities;

/**
 <p>The list of resources that generated the values in the <code>Capabilities</code> response element.</p>
 */
@property (nonatomic, strong) NSString * _Nullable capabilitiesReason;

/**
 <p>A list of the transforms that are declared in the template.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable declaredTransforms;

/**
 <p>The value that is defined in the <code>Description</code> property of the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The value that is defined for the <code>Metadata</code> property of the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>A list of parameter declarations that describe various properties for each parameter.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationParameterDeclaration *> * _Nullable parameters;

/**
 <p>A list of resource identifier summaries that describe the target resources of an import operation and the properties you can provide during the import to identify the target resources. For example, <code>BucketName</code> is a possible identifier property for an <code>AWS::S3::Bucket</code> resource. </p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationResourceIdentifierSummary *> * _Nullable resourceIdentifierSummaries;

/**
 <p>A list of all the template resource types that are defined in the template, such as <code>AWS::EC2::Instance</code>, <code>AWS::Dynamo::Table</code>, and <code>Custom::MyCustomInstance</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceTypes;

/**
 <p>The AWS template format version, which identifies the capabilities of the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>The input for the <a>ListChangeSets</a> action.</p>
 Required parameters: [StackName]
 */
@interface AWSCloudformationListChangeSetsInput : AWSRequest


/**
 <p>A string (provided by the <a>ListChangeSets</a> response output) that identifies the next page of change sets that you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name or the Amazon Resource Name (ARN) of the stack for which you want to list change sets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p>The output for the <a>ListChangeSets</a> action.</p>
 */
@interface AWSCloudformationListChangeSetsOutput : AWSModel


/**
 <p>If the output exceeds 1 MB, a string that identifies the next page of change sets. If there is no additional page, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>ChangeSetSummary</code> structures that provides the ID and status of each change set for the specified stack.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationChangeSetSummary *> * _Nullable summaries;

@end

/**
 
 */
@interface AWSCloudformationListExportsInput : AWSRequest


/**
 <p>A string (provided by the <a>ListExports</a> response output) that identifies the next page of exported output values that you asked to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCloudformationListExportsOutput : AWSModel


/**
 <p>The output for the <a>ListExports</a> action.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationExport *> * _Nullable exports;

/**
 <p>If the output exceeds 100 exported output values, a string that identifies the next page of exports. If there is no additional page, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCloudformationListImportsInput : AWSRequest


/**
 <p>The name of the exported output value. AWS CloudFormation returns the stack names that are importing this value. </p>
 */
@property (nonatomic, strong) NSString * _Nullable exportName;

/**
 <p>A string (provided by the <a>ListImports</a> response output) that identifies the next page of stacks that are importing the specified exported output value. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCloudformationListImportsOutput : AWSModel


/**
 <p>A list of stack names that are importing the specified exported output value. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable imports;

/**
 <p>A string that identifies the next page of exports. If there is no additional page, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCloudformationListStackInstancesInput : AWSRequest


/**
 <p>The status that stack instances are filtered by.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationStackInstanceFilter *> * _Nullable filters;

/**
 <p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous request didn't return all of the remaining results, the response's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call <code>ListStackInstances</code> again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the AWS account that you want to list stack instances for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackInstanceAccount;

/**
 <p>The name of the Region where you want to list stack instances. </p>
 */
@property (nonatomic, strong) NSString * _Nullable stackInstanceRegion;

/**
 <p>The name or unique ID of the stack set that you want to list stack instances for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

@end

/**
 
 */
@interface AWSCloudformationListStackInstancesOutput : AWSModel


/**
 <p>If the request doesn't return all of the remaining results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call <code>ListStackInstances</code> again and assign that token to the request object's <code>NextToken</code> parameter. If the request returns all results, <code>NextToken</code> is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>StackInstanceSummary</code> structures that contain information about the specified stack instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationStackInstanceSummary *> * _Nullable summaries;

@end

/**
 <p>The input for the <a>ListStackResource</a> action.</p>
 Required parameters: [StackName]
 */
@interface AWSCloudformationListStackResourcesInput : AWSRequest


/**
 <p>A string that identifies the next page of stack resources that you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name or the unique stack ID that is associated with the stack, which are not always interchangeable:</p><ul><li><p>Running stacks: You can specify either the stack's name or its unique stack ID.</p></li><li><p>Deleted stacks: You must specify the unique stack ID.</p></li></ul><p>Default: There is no default value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p>The output for a <a>ListStackResources</a> action.</p>
 */
@interface AWSCloudformationListStackResourcesOutput : AWSModel


/**
 <p>If the output exceeds 1 MB, a string that identifies the next page of stack resources. If no additional page exists, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>StackResourceSummary</code> structures.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationStackResourceSummary *> * _Nullable stackResourceSummaries;

@end

/**
 
 */
@interface AWSCloudformationListStackSetOperationResultsInput : AWSRequest


/**
 <p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous request didn't return all of the remaining results, the response object's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call <code>ListStackSetOperationResults</code> again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the stack set operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

/**
 <p>The name or unique ID of the stack set that you want to get operation results for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

@end

/**
 
 */
@interface AWSCloudformationListStackSetOperationResultsOutput : AWSModel


/**
 <p>If the request doesn't return all results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call <code>ListOperationResults</code> again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, <code>NextToken</code> is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>StackSetOperationResultSummary</code> structures that contain information about the specified operation results, for accounts and Regions that are included in the operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationStackSetOperationResultSummary *> * _Nullable summaries;

@end

/**
 
 */
@interface AWSCloudformationListStackSetOperationsInput : AWSRequest


/**
 <p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous paginated request didn't return all of the remaining results, the response object's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call <code>ListStackSetOperations</code> again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name or unique ID of the stack set that you want to get operation summaries for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

@end

/**
 
 */
@interface AWSCloudformationListStackSetOperationsOutput : AWSModel


/**
 <p>If the request doesn't return all results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call <code>ListOperationResults</code> again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, <code>NextToken</code> is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>StackSetOperationSummary</code> structures that contain summary information about operations for the specified stack set.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationStackSetOperationSummary *> * _Nullable summaries;

@end

/**
 
 */
@interface AWSCloudformationListStackSetsInput : AWSRequest


/**
 <p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous paginated request didn't return all of the remaining results, the response object's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call <code>ListStackSets</code> again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The status of the stack sets that you want to get summary information about.</p>
 */
@property (nonatomic, assign) AWSCloudformationStackSetStatus status;

@end

/**
 
 */
@interface AWSCloudformationListStackSetsOutput : AWSModel


/**
 <p>If the request doesn't return all of the remaining results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call <code>ListStackInstances</code> again and assign that token to the request object's <code>NextToken</code> parameter. If the request returns all results, <code>NextToken</code> is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>StackSetSummary</code> structures that contain information about the user's stack sets.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationStackSetSummary *> * _Nullable summaries;

@end

/**
 <p>The input for <a>ListStacks</a> action.</p>
 */
@interface AWSCloudformationListStacksInput : AWSRequest


/**
 <p>A string that identifies the next page of stacks that you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Stack status to use as a filter. Specify one or more stack status codes to list only stacks with the specified status codes. For a complete list of stack status codes, see the <code>StackStatus</code> parameter of the <a>Stack</a> data type.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stackStatusFilter;

@end

/**
 <p>The output for <a>ListStacks</a> action.</p>
 */
@interface AWSCloudformationListStacksOutput : AWSModel


/**
 <p>If the output exceeds 1 MB in size, a string that identifies the next page of stacks. If no additional page exists, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>StackSummary</code> structures containing information about the specified stacks.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationStackSummary *> * _Nullable stackSummaries;

@end

/**
 
 */
@interface AWSCloudformationListTypeRegistrationsInput : AWSRequest


/**
 <p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous paginated request didn't return all of the remaining results, the response object's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call this action again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The current status of the type registration request.</p><p>The default is <code>IN_PROGRESS</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationRegistrationStatus registrationStatusFilter;

/**
 <p>The kind of type.</p><p>Currently the only valid value is <code>RESOURCE</code>.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationRegistryType types;

/**
 <p>The Amazon Resource Name (ARN) of the type.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeArn;

/**
 <p>The name of the type.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 
 */
@interface AWSCloudformationListTypeRegistrationsOutput : AWSModel


/**
 <p>If the request doesn't return all of the remaining results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call this action again and assign that token to the request object's <code>NextToken</code> parameter. If the request returns all results, <code>NextToken</code> is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> A list of type registration tokens.</p><p>Use <code><a>DescribeTypeRegistration</a></code> to return detailed information about a type registration request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable registrationTokenList;

@end

/**
 
 */
@interface AWSCloudformationListTypeVersionsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the type for which you want version summary information.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The deprecation status of the type versions that you want to get summary information about.</p><p>Valid values include:</p><ul><li><p><code>LIVE</code>: The type version is registered and can be used in CloudFormation operations, dependent on its provisioning behavior and visibility scope.</p></li><li><p><code>DEPRECATED</code>: The type version has been deregistered and can no longer be used in CloudFormation operations. </p></li></ul><p>The default is <code>LIVE</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationDeprecatedStatus deprecatedStatus;

/**
 <p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous paginated request didn't return all of the remaining results, the response object's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call this action again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The kind of the type.</p><p>Currently the only valid value is <code>RESOURCE</code>.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationRegistryType types;

/**
 <p>The name of the type for which you want version summary information.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 
 */
@interface AWSCloudformationListTypeVersionsOutput : AWSModel


/**
 <p>If the request doesn't return all of the remaining results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call this action again and assign that token to the request object's <code>NextToken</code> parameter. If the request returns all results, <code>NextToken</code> is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>TypeVersionSummary</code> structures that contain information about the specified type's versions.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationTypeVersionSummary *> * _Nullable typeVersionSummaries;

@end

/**
 
 */
@interface AWSCloudformationListTypesInput : AWSRequest


/**
 <p>The deprecation status of the types that you want to get summary information about.</p><p>Valid values include:</p><ul><li><p><code>LIVE</code>: The type is registered for use in CloudFormation operations.</p></li><li><p><code>DEPRECATED</code>: The type has been deregistered and can no longer be used in CloudFormation operations. </p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationDeprecatedStatus deprecatedStatus;

/**
 <p>The maximum number of results to be returned with a single call. If the number of available results exceeds this maximum, the response includes a <code>NextToken</code> value that you can assign to the <code>NextToken</code> request parameter to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous paginated request didn't return all of the remaining results, the response object's <code>NextToken</code> parameter value is set to a token. To retrieve the next set of results, call this action again and assign that token to the request object's <code>NextToken</code> parameter. If there are no remaining results, the previous response object's <code>NextToken</code> parameter is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The provisioning behavior of the type. AWS CloudFormation determines the provisioning type during registration, based on the types of handlers in the schema handler package submitted.</p><p>Valid values include:</p><ul><li><p><code>FULLY_MUTABLE</code>: The type includes an update handler to process updates to the type during stack update operations.</p></li><li><p><code>IMMUTABLE</code>: The type does not include an update handler, so the type cannot be updated and must instead be replaced during stack update operations.</p></li><li><p><code>NON_PROVISIONABLE</code>: The type does not include create, read, and delete handlers, and therefore cannot actually be provisioned.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationProvisioningType provisioningType;

/**
 <p>The scope at which the type is visible and usable in CloudFormation operations.</p><p>Valid values include:</p><ul><li><p><code>PRIVATE</code>: The type is only visible and usable within the account in which it is registered. Currently, AWS CloudFormation marks any types you create as <code>PRIVATE</code>.</p></li><li><p><code>PUBLIC</code>: The type is publically visible and usable within any Amazon account.</p></li></ul><p>The default is <code>PRIVATE</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationVisibility visibility;

@end

/**
 
 */
@interface AWSCloudformationListTypesOutput : AWSModel


/**
 <p>If the request doesn't return all of the remaining results, <code>NextToken</code> is set to a token. To retrieve the next set of results, call this action again and assign that token to the request object's <code>NextToken</code> parameter. If the request returns all results, <code>NextToken</code> is set to <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of <code>TypeSummary</code> structures that contain information about the specified types.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationTypeSummary *> * _Nullable typeSummaries;

@end

/**
 <p>Contains logging configuration information for a type.</p>
 Required parameters: [LogRoleArn, LogGroupName]
 */
@interface AWSCloudformationLoggingConfig : AWSModel


/**
 <p>The Amazon CloudWatch log group to which CloudFormation sends error logging information when invoking the type's handlers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The ARN of the role that CloudFormation should assume when sending log entries to CloudWatch logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logRoleArn;

@end

/**
 <p>The Output data type.</p>
 */
@interface AWSCloudformationOutput : AWSModel


/**
 <p>User defined description associated with the output.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the export associated with the output.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exportName;

/**
 <p>The key associated with the output.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputKey;

/**
 <p>The value associated with the output.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputValue;

@end

/**
 <p>The Parameter data type.</p>
 */
@interface AWSCloudformationParameter : AWSModel


/**
 <p>The key associated with the parameter. If you don't specify a key and value for a particular parameter, AWS CloudFormation uses the default value that is specified in your template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterKey;

/**
 <p>The input value associated with the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterValue;

/**
 <p>Read-only. The value that corresponds to a Systems Manager parameter key. This field is returned only for <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html#aws-ssm-parameter-types"><code>SSM</code> parameter types</a> in the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resolvedValue;

/**
 <p>During a stack update, use the existing parameter value that the stack is using for a given parameter key. If you specify <code>true</code>, do not specify a parameter value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usePreviousValue;

@end

/**
 <p>A set of criteria that AWS CloudFormation uses to validate parameter values. Although other constraints might be defined in the stack template, AWS CloudFormation returns only the <code>AllowedValues</code> property.</p>
 */
@interface AWSCloudformationParameterConstraints : AWSModel


/**
 <p>A list of values that are permitted for a parameter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedValues;

@end

/**
 <p>The ParameterDeclaration data type.</p>
 */
@interface AWSCloudformationParameterDeclaration : AWSModel


/**
 <p>The default value of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>The description that is associate with the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Flag that indicates whether the parameter value is shown as plain text in logs and in the AWS Management Console.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable noEcho;

/**
 <p>The criteria that AWS CloudFormation uses to validate parameter values.</p>
 */
@property (nonatomic, strong) AWSCloudformationParameterConstraints * _Nullable parameterConstraints;

/**
 <p>The name that is associated with the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterKey;

/**
 <p>The type of parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterType;

@end

/**
 <p>Context information that enables AWS CloudFormation to uniquely identify a resource. AWS CloudFormation uses context key-value pairs in cases where a resource's logical and physical IDs are not enough to uniquely identify that resource. Each context key-value pair specifies a resource that contains the targeted resource.</p>
 Required parameters: [Key, Value]
 */
@interface AWSCloudformationPhysicalResourceIdContextKeyValuePair : AWSModel


/**
 <p>The resource context key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The resource context value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about a resource property whose actual value differs from its expected value, as defined in the stack template and any values specified as template parameters. These will be present only for resources whose <code>StackResourceDriftStatus</code> is <code>MODIFIED</code>. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p>
 Required parameters: [PropertyPath, ExpectedValue, ActualValue, DifferenceType]
 */
@interface AWSCloudformationPropertyDifference : AWSModel


/**
 <p>The actual property value of the resource property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actualValue;

/**
 <p>The type of property difference.</p><ul><li><p><code>ADD</code>: A value has been added to a resource property that is an array or list data type.</p></li><li><p><code>REMOVE</code>: The property has been removed from the current resource configuration.</p></li><li><p><code>NOT_EQUAL</code>: The current property value differs from its expected value (as defined in the stack template and any values specified as template parameters).</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationDifferenceType differenceType;

/**
 <p>The expected property value of the resource property, as defined in the stack template and any values specified as template parameters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedValue;

/**
 <p>The fully-qualified path to the resource property.</p>
 */
@property (nonatomic, strong) NSString * _Nullable propertyPath;

@end

/**
 
 */
@interface AWSCloudformationRecordHandlerProgressInput : AWSRequest


/**
 <p>Reserved for use by the <a href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation CLI</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bearerToken;

/**
 <p>Reserved for use by the <a href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation CLI</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>Reserved for use by the <a href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation CLI</a>.</p>
 */
@property (nonatomic, assign) AWSCloudformationOperationStatus currentOperationStatus;

/**
 <p>Reserved for use by the <a href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation CLI</a>.</p>
 */
@property (nonatomic, assign) AWSCloudformationHandlerErrorCode errorCode;

/**
 <p>Reserved for use by the <a href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation CLI</a>.</p>
 */
@property (nonatomic, assign) AWSCloudformationOperationStatus operationStatus;

/**
 <p>Reserved for use by the <a href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation CLI</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceModel;

/**
 <p>Reserved for use by the <a href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html">CloudFormation CLI</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 
 */
@interface AWSCloudformationRecordHandlerProgressOutput : AWSModel


@end

/**
 
 */
@interface AWSCloudformationRegisterTypeInput : AWSRequest


/**
 <p>A unique identifier that acts as an idempotency key for this registration request. Specifying a client request token prevents CloudFormation from generating more than one version of a type from the same registeration request, even if the request is submitted multiple times. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role for CloudFormation to assume when invoking the resource provider. If your resource type calls AWS APIs in any of its handlers, you must create an <i><a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM execution role</a></i> that includes the necessary permissions to call those AWS APIs, and provision that execution role in your account. When CloudFormation needs to invoke the resource provider handler, CloudFormation assumes this execution role to create a temporary session token, which it then passes to the resource provider handler, thereby supplying your resource provider with the appropriate credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleArn;

/**
 <p>Specifies logging configuration information for a type.</p>
 */
@property (nonatomic, strong) AWSCloudformationLoggingConfig * _Nullable loggingConfig;

/**
 <p>A url to the S3 bucket containing the schema handler package that contains the schema, event handlers, and associated files for the type you want to register.</p><p>For information on generating a schema handler package for the type you want to register, see <a href="https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-cli-submit.html">submit</a> in the <i>CloudFormation CLI User Guide</i>.</p><note><p>As part of registering a resource provider type, CloudFormation must be able to access the S3 bucket which contains the schema handler package for that resource provider. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry.html#registry-register-permissions">IAM Permissions for Registering a Resource Provider</a> in the <i>AWS CloudFormation User Guide</i>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable schemaHandlerPackage;

/**
 <p>The kind of type.</p><p>Currently, the only valid value is <code>RESOURCE</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationRegistryType types;

/**
 <p>The name of the type being registered.</p><p>We recommend that type names adhere to the following pattern: <i>company_or_organization</i>::<i>service</i>::<i>type</i>.</p><note><p>The following organization namespaces are reserved and cannot be used in your resource type names:</p><ul><li><p><code>Alexa</code></p></li><li><p><code>AMZN</code></p></li><li><p><code>Amazon</code></p></li><li><p><code>AWS</code></p></li><li><p><code>Custom</code></p></li><li><p><code>Dev</code></p></li></ul></note>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 
 */
@interface AWSCloudformationRegisterTypeOutput : AWSModel


/**
 <p>The identifier for this registration request.</p><p>Use this registration token when calling <code><a>DescribeTypeRegistration</a></code>, which returns information about the status and IDs of the type registration. </p>
 */
@property (nonatomic, strong) NSString * _Nullable registrationToken;

@end

/**
 <p>The <code>ResourceChange</code> structure describes the resource and the action that AWS CloudFormation will perform on it if you execute this change set.</p>
 */
@interface AWSCloudformationResourceChange : AWSModel


/**
 <p>The action that AWS CloudFormation takes on the resource, such as <code>Add</code> (adds a new resource), <code>Modify</code> (changes a resource), or <code>Remove</code> (deletes a resource).</p>
 */
@property (nonatomic, assign) AWSCloudformationChangeAction action;

/**
 <p>For the <code>Modify</code> action, a list of <code>ResourceChangeDetail</code> structures that describes the changes that AWS CloudFormation will make to the resource. </p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationResourceChangeDetail *> * _Nullable details;

/**
 <p>The resource's logical ID, which is defined in the stack's template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logicalResourceId;

/**
 <p>The resource's physical ID (resource name). Resources that you are adding don't have physical IDs because they haven't been created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable physicalResourceId;

/**
 <p>For the <code>Modify</code> action, indicates whether AWS CloudFormation will replace the resource by creating a new one and deleting the old one. This value depends on the value of the <code>RequiresRecreation</code> property in the <code>ResourceTargetDefinition</code> structure. For example, if the <code>RequiresRecreation</code> field is <code>Always</code> and the <code>Evaluation</code> field is <code>Static</code>, <code>Replacement</code> is <code>True</code>. If the <code>RequiresRecreation</code> field is <code>Always</code> and the <code>Evaluation</code> field is <code>Dynamic</code>, <code>Replacement</code> is <code>Conditionally</code>.</p><p>If you have multiple changes with different <code>RequiresRecreation</code> values, the <code>Replacement</code> value depends on the change with the most impact. A <code>RequiresRecreation</code> value of <code>Always</code> has the most impact, followed by <code>Conditionally</code>, and then <code>Never</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationReplacement replacement;

/**
 <p>The type of AWS CloudFormation resource, such as <code>AWS::S3::Bucket</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>For the <code>Modify</code> action, indicates which resource attribute is triggering this update, such as a change in the resource attribute's <code>Metadata</code>, <code>Properties</code>, or <code>Tags</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scope;

@end

/**
 <p>For a resource with <code>Modify</code> as the action, the <code>ResourceChange</code> structure describes the changes AWS CloudFormation will make to that resource.</p>
 */
@interface AWSCloudformationResourceChangeDetail : AWSModel


/**
 <p>The identity of the entity that triggered this change. This entity is a member of the group that is specified by the <code>ChangeSource</code> field. For example, if you modified the value of the <code>KeyPairName</code> parameter, the <code>CausingEntity</code> is the name of the parameter (<code>KeyPairName</code>).</p><p>If the <code>ChangeSource</code> value is <code>DirectModification</code>, no value is given for <code>CausingEntity</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable causingEntity;

/**
 <p>The group to which the <code>CausingEntity</code> value belongs. There are five entity groups:</p><ul><li><p><code>ResourceReference</code> entities are <code>Ref</code> intrinsic functions that refer to resources in the template, such as <code>{ "Ref" : "MyEC2InstanceResource" }</code>.</p></li><li><p><code>ParameterReference</code> entities are <code>Ref</code> intrinsic functions that get template parameter values, such as <code>{ "Ref" : "MyPasswordParameter" }</code>.</p></li><li><p><code>ResourceAttribute</code> entities are <code>Fn::GetAtt</code> intrinsic functions that get resource attribute values, such as <code>{ "Fn::GetAtt" : [ "MyEC2InstanceResource", "PublicDnsName" ] }</code>.</p></li><li><p><code>DirectModification</code> entities are changes that are made directly to the template.</p></li><li><p><code>Automatic</code> entities are <code>AWS::CloudFormation::Stack</code> resource types, which are also known as nested stacks. If you made no changes to the <code>AWS::CloudFormation::Stack</code> resource, AWS CloudFormation sets the <code>ChangeSource</code> to <code>Automatic</code> because the nested stack's template might have changed. Changes to a nested stack's template aren't visible to AWS CloudFormation until you run an update on the parent stack.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationChangeSource changeSource;

/**
 <p>Indicates whether AWS CloudFormation can determine the target value, and whether the target value will change before you execute a change set.</p><p>For <code>Static</code> evaluations, AWS CloudFormation can determine that the target value will change, and its value. For example, if you directly modify the <code>InstanceType</code> property of an EC2 instance, AWS CloudFormation knows that this property value will change, and its value, so this is a <code>Static</code> evaluation.</p><p>For <code>Dynamic</code> evaluations, cannot determine the target value because it depends on the result of an intrinsic function, such as a <code>Ref</code> or <code>Fn::GetAtt</code> intrinsic function, when the stack is updated. For example, if your template includes a reference to a resource that is conditionally recreated, the value of the reference (the physical ID of the resource) might change, depending on if the resource is recreated. If the resource is recreated, it will have a new physical ID, so all references to that resource will also be updated.</p>
 */
@property (nonatomic, assign) AWSCloudformationEvaluationType evaluation;

/**
 <p>A <code>ResourceTargetDefinition</code> structure that describes the field that AWS CloudFormation will change and whether the resource will be recreated.</p>
 */
@property (nonatomic, strong) AWSCloudformationResourceTargetDefinition * _Nullable target;

@end

/**
 <p>Describes the target resources of a specific type in your import template (for example, all <code>AWS::S3::Bucket</code> resources) and the properties you can provide during the import to identify resources of that type.</p>
 */
@interface AWSCloudformationResourceIdentifierSummary : AWSModel


/**
 <p>The logical IDs of the target resources of the specified <code>ResourceType</code>, as defined in the import template.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logicalResourceIds;

/**
 <p>The resource properties you can provide during the import to identify your target resources. For example, <code>BucketName</code> is a possible identifier property for <code>AWS::S3::Bucket</code> resources.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceIdentifiers;

/**
 <p>The template resource type of the target resources, such as <code>AWS::S3::Bucket</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

@end

/**
 <p>The field that AWS CloudFormation will change, such as the name of a resource's property, and whether the resource will be recreated.</p>
 */
@interface AWSCloudformationResourceTargetDefinition : AWSModel


/**
 <p>Indicates which resource attribute is triggering this update, such as a change in the resource attribute's <code>Metadata</code>, <code>Properties</code>, or <code>Tags</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationResourceAttribute attribute;

/**
 <p>If the <code>Attribute</code> value is <code>Properties</code>, the name of the property. For all other attributes, the value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>If the <code>Attribute</code> value is <code>Properties</code>, indicates whether a change to this property causes the resource to be recreated. The value can be <code>Never</code>, <code>Always</code>, or <code>Conditionally</code>. To determine the conditions for a <code>Conditionally</code> recreation, see the update behavior for that <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html">property</a> in the AWS CloudFormation User Guide.</p>
 */
@property (nonatomic, assign) AWSCloudformationRequiresRecreation requiresRecreation;

@end

/**
 <p>Describes the target resource of an import operation.</p>
 Required parameters: [ResourceType, LogicalResourceId, ResourceIdentifier]
 */
@interface AWSCloudformationResourceToImport : AWSModel


/**
 <p>The logical ID of the target resource as specified in the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logicalResourceId;

/**
 <p>A key-value pair that identifies the target resource. The key is an identifier property (for example, <code>BucketName</code> for <code>AWS::S3::Bucket</code> resources) and the value is the actual property value (for example, <code>MyS3Bucket</code>).</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable resourceIdentifier;

/**
 <p>The type of resource to import into your stack, such as <code>AWS::S3::Bucket</code>. For a list of supported resource types, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html">Resources that support import operations</a> in the AWS CloudFormation User Guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

@end

/**
 <p>Structure containing the rollback triggers for AWS CloudFormation to monitor during stack creation and updating operations, and for the specified monitoring period afterwards.</p><p>Rollback triggers enable you to have AWS CloudFormation monitor the state of your application during stack creation and updating, and to roll back that operation if the application breaches the threshold of any of the alarms you've specified. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-rollback-triggers.html">Monitor and Roll Back Stack Operations</a>.</p>
 */
@interface AWSCloudformationRollbackConfiguration : AWSModel


/**
 <p>The amount of time, in minutes, during which CloudFormation should monitor all the rollback triggers after the stack creation or update operation deploys all necessary resources.</p><p>The default is 0 minutes.</p><p>If you specify a monitoring period but do not specify any rollback triggers, CloudFormation still waits the specified period of time before cleaning up old resources after update operations. You can use this monitoring period to perform any manual stack validation desired, and manually cancel the stack creation or update (using <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CancelUpdateStack.html">CancelUpdateStack</a>, for example) as necessary.</p><p>If you specify 0 for this parameter, CloudFormation still monitors the specified rollback triggers during stack creation and update operations. Then, for update operations, it begins disposing of old resources immediately once the operation completes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable monitoringTimeInMinutes;

/**
 <p>The triggers to monitor during stack creation or update actions. </p><p>By default, AWS CloudFormation saves the rollback triggers specified for a stack and applies them to any subsequent update operations for the stack, unless you specify otherwise. If you do specify rollback triggers for this parameter, those triggers replace any list of triggers previously specified for the stack. This means:</p><ul><li><p>To use the rollback triggers previously specified for this stack, if any, don't specify this parameter.</p></li><li><p>To specify new or updated rollback triggers, you must specify <i>all</i> the triggers that you want used for this stack, even triggers you've specifed before (for example, when creating the stack or during a previous stack update). Any triggers that you don't include in the updated list of triggers are no longer applied to the stack.</p></li><li><p>To remove all currently specified triggers, specify an empty list for this parameter.</p></li></ul><p>If a specified trigger is missing, the entire stack operation fails and is rolled back. </p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationRollbackTrigger *> * _Nullable rollbackTriggers;

@end

/**
 <p>A rollback trigger AWS CloudFormation monitors during creation and updating of stacks. If any of the alarms you specify goes to ALARM state during the stack operation or within the specified monitoring period afterwards, CloudFormation rolls back the entire stack operation. </p>
 Required parameters: [Arn, Type]
 */
@interface AWSCloudformationRollbackTrigger : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the rollback trigger.</p><p>If a specified trigger is missing, the entire stack operation fails and is rolled back. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The resource type of the rollback trigger. Currently, <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html">AWS::CloudWatch::Alarm</a> is the only supported resource type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>The input for the <a>SetStackPolicy</a> action.</p>
 Required parameters: [StackName]
 */
@interface AWSCloudformationSetStackPolicyInput : AWSRequest


/**
 <p>The name or unique stack ID that you want to associate a policy with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>Structure containing the stack policy body. For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html"> Prevent Updates to Stack Resources</a> in the AWS CloudFormation User Guide. You can specify either the <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackPolicyBody;

/**
 <p>Location of a file containing the stack policy. The URL must point to a policy (maximum size: 16 KB) located in an S3 bucket in the same Region as the stack. You can specify either the <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackPolicyURL;

@end

/**
 
 */
@interface AWSCloudformationSetTypeDefaultVersionInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the type for which you want version summary information.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The kind of type.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, assign) AWSCloudformationRegistryType types;

/**
 <p>The name of the type.</p><p>Conditional: You must specify either <code>TypeName</code> and <code>Type</code>, or <code>Arn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

/**
 <p>The ID of a specific version of the type. The version ID is the value at the end of the Amazon Resource Name (ARN) assigned to the type version when it is registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSCloudformationSetTypeDefaultVersionOutput : AWSModel


@end

/**
 <p>The input for the <a>SignalResource</a> action.</p>
 Required parameters: [StackName, LogicalResourceId, UniqueId, Status]
 */
@interface AWSCloudformationSignalResourceInput : AWSRequest


/**
 <p>The logical ID of the resource that you want to signal. The logical ID is the name of the resource that given in the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logicalResourceId;

/**
 <p>The stack name or unique stack ID that includes the resource that you want to signal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>The status of the signal, which is either success or failure. A failure signal causes AWS CloudFormation to immediately fail the stack creation or update.</p>
 */
@property (nonatomic, assign) AWSCloudformationResourceSignalStatus status;

/**
 <p>A unique ID of the signal. When you signal Amazon EC2 instances or Auto Scaling groups, specify the instance ID that you are signaling as the unique ID. If you send multiple signals to a single resource (such as signaling a wait condition), each signal requires a different unique ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uniqueId;

@end

/**
 <p>The Stack data type.</p>
 Required parameters: [StackName, CreationTime, StackStatus]
 */
@interface AWSCloudformationStack : AWSModel


/**
 <p>The capabilities allowed in the stack.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable capabilities;

/**
 <p>The unique ID of the change set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeSetId;

/**
 <p>The time at which the stack was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The time the stack was deleted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletionTime;

/**
 <p>A user-defined description associated with the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Boolean to enable or disable rollback on stack creation failures:</p><ul><li><p><code>true</code>: disable rollback</p></li><li><p><code>false</code>: enable rollback</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableRollback;

/**
 <p>Information on whether a stack's actual configuration differs, or has <i>drifted</i>, from it's expected configuration, as defined in the stack template and any values specified as template parameters. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackDriftInformation * _Nullable driftInformation;

/**
 <p>Whether termination protection is enabled for the stack.</p><p> For <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">nested stacks</a>, termination protection is set on the root stack and cannot be changed directly on the nested stack. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html">Protecting a Stack From Being Deleted</a> in the <i>AWS CloudFormation User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableTerminationProtection;

/**
 <p>The time the stack was last updated. This field will only be returned if the stack has been updated at least once.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>SNS topic ARNs to which stack related events are published.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notificationARNs;

/**
 <p>A list of output structures.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationOutput *> * _Nullable outputs;

/**
 <p>A list of <code>Parameter</code> structures.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationParameter *> * _Nullable parameters;

/**
 <p>For nested stacks--stacks created as resources for another stack--the stack ID of the direct parent of this stack. For the first level of nested stacks, the root stack is also the parent stack.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">Working with Nested Stacks</a> in the <i>AWS CloudFormation User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentId;

/**
 <p>The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that is associated with the stack. During a stack operation, AWS CloudFormation uses this role's credentials to make calls on your behalf.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The rollback triggers for AWS CloudFormation to monitor during stack creation and updating operations, and for the specified monitoring period afterwards.</p>
 */
@property (nonatomic, strong) AWSCloudformationRollbackConfiguration * _Nullable rollbackConfiguration;

/**
 <p>For nested stacks--stacks created as resources for another stack--the stack ID of the top-level stack to which the nested stack ultimately belongs.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">Working with Nested Stacks</a> in the <i>AWS CloudFormation User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rootId;

/**
 <p>Unique identifier of the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

/**
 <p>The name associated with the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>Current status of the stack.</p>
 */
@property (nonatomic, assign) AWSCloudformationStackStatus stackStatus;

/**
 <p>Success/failure message associated with the stack status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackStatusReason;

/**
 <p>A list of <code>Tag</code>s that specify information about the stack.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationTag *> * _Nullable tags;

/**
 <p>The amount of time within which stack creation should complete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInMinutes;

@end

/**
 <p>Contains information about whether the stack's actual configuration differs, or has <i>drifted</i>, from its expected configuration, as defined in the stack template and any values specified as template parameters. A stack is considered to have drifted if one or more of its resources have drifted.</p>
 Required parameters: [StackDriftStatus]
 */
@interface AWSCloudformationStackDriftInformation : AWSModel


/**
 <p>Most recent time when a drift detection operation was initiated on the stack, or any of its individual resources that support drift detection.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastCheckTimestamp;

/**
 <p>Status of the stack's actual configuration compared to its expected template configuration. </p><ul><li><p><code>DRIFTED</code>: The stack differs from its expected template configuration. A stack is considered to have drifted if one or more of its resources have drifted.</p></li><li><p><code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack differs from its expected template configuration.</p></li><li><p><code>IN_SYNC</code>: The stack's actual configuration matches its expected template configuration.</p></li><li><p><code>UNKNOWN</code>: This value is reserved for future use.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackDriftStatus stackDriftStatus;

@end

/**
 <p>Contains information about whether the stack's actual configuration differs, or has <i>drifted</i>, from its expected configuration, as defined in the stack template and any values specified as template parameters. A stack is considered to have drifted if one or more of its resources have drifted.</p>
 Required parameters: [StackDriftStatus]
 */
@interface AWSCloudformationStackDriftInformationSummary : AWSModel


/**
 <p>Most recent time when a drift detection operation was initiated on the stack, or any of its individual resources that support drift detection.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastCheckTimestamp;

/**
 <p>Status of the stack's actual configuration compared to its expected template configuration. </p><ul><li><p><code>DRIFTED</code>: The stack differs from its expected template configuration. A stack is considered to have drifted if one or more of its resources have drifted.</p></li><li><p><code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack differs from its expected template configuration.</p></li><li><p><code>IN_SYNC</code>: The stack's actual configuration matches its expected template configuration.</p></li><li><p><code>UNKNOWN</code>: This value is reserved for future use.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackDriftStatus stackDriftStatus;

@end

/**
 <p>The StackEvent data type.</p>
 Required parameters: [StackId, EventId, StackName, Timestamp]
 */
@interface AWSCloudformationStackEvent : AWSModel


/**
 <p>The token passed to the operation that generated this event.</p><p>All events triggered by a given stack operation are assigned the same client request token, which you can use to track operations. For example, if you execute a <code>CreateStack</code> operation with the token <code>token1</code>, then all the <code>StackEvents</code> generated by that operation will have <code>ClientRequestToken</code> set as <code>token1</code>.</p><p>In the console, stack operations display the client request token on the Events tab. Stack operations that are initiated from the console use the token format <i>Console-StackOperation-ID</i>, which helps you easily identify the stack operation . For example, if you create a stack using the console, each stack event would be assigned the same token in the following format: <code>Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The unique ID of this event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 <p>The logical name of the resource specified in the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logicalResourceId;

/**
 <p>The name or unique identifier associated with the physical instance of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable physicalResourceId;

/**
 <p>BLOB of the properties used to create the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceProperties;

/**
 <p>Current status of the resource.</p>
 */
@property (nonatomic, assign) AWSCloudformationResourceStatus resourceStatus;

/**
 <p>Success/failure message associated with the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceStatusReason;

/**
 <p>Type of resource. (For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html"> AWS Resource Types Reference</a> in the AWS CloudFormation User Guide.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The unique ID name of the instance of the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

/**
 <p>The name associated with a stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>Time the status was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 <p>An AWS CloudFormation stack, in a specific account and Region, that's part of a stack set operation. A stack instance is a reference to an attempted or actual stack in a given account within a given Region. A stack instance can exist without a stack—for example, if the stack couldn't be created for some reason. A stack instance is associated with only one stack set. Each stack instance contains the ID of its associated stack set, as well as the ID of the actual stack and the stack status.</p>
 */
@interface AWSCloudformationStackInstance : AWSModel


/**
 <p>[<code>Self-managed</code> permissions] The name of the AWS account that the stack instance is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable account;

/**
 <p>Status of the stack instance's actual configuration compared to the expected template and parameter configuration of the stack set to which it belongs. </p><ul><li><p><code>DRIFTED</code>: The stack differs from the expected template and parameter configuration of the stack set to which it belongs. A stack instance is considered to have drifted if one or more of the resources in the associated stack have drifted.</p></li><li><p><code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack instance differs from its expected stack set configuration.</p></li><li><p><code>IN_SYNC</code>: The stack instance's actual configuration matches its expected stack set configuration.</p></li><li><p><code>UNKNOWN</code>: This value is reserved for future use.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackDriftStatus driftStatus;

/**
 <p>Most recent time when CloudFormation performed a drift detection operation on the stack instance. This value will be <code>NULL</code> for any stack instance on which drift detection has not yet been performed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastDriftCheckTimestamp;

/**
 <p>[<code>Service-managed</code> permissions] The organization root ID or organizational unit (OU) IDs that you specified for <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html">DeploymentTargets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationalUnitId;

/**
 <p>A list of parameters from the stack set template whose values have been overridden in this stack instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationParameter *> * _Nullable parameterOverrides;

/**
 <p>The name of the AWS Region that the stack instance is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The ID of the stack instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

/**
 <p>The detailed status of the stack instance.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackInstanceComprehensiveStatus * _Nullable stackInstanceStatus;

/**
 <p>The name or unique ID of the stack set that the stack instance is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetId;

/**
 <p>The status of the stack instance, in terms of its synchronization with its associated stack set.</p><ul><li><p><code>INOPERABLE</code>: A <code>DeleteStackInstances</code> operation has failed and left the stack in an unstable state. Stacks in this state are excluded from further <code>UpdateStackSet</code> operations. You might need to perform a <code>DeleteStackInstances</code> operation, with <code>RetainStacks</code> set to <code>true</code>, to delete the stack instance, and then delete the stack manually.</p></li><li><p><code>OUTDATED</code>: The stack isn't currently up to date with the stack set because:</p><ul><li><p>The associated stack failed during a <code>CreateStackSet</code> or <code>UpdateStackSet</code> operation. </p></li><li><p>The stack was part of a <code>CreateStackSet</code> or <code>UpdateStackSet</code> operation that failed or was stopped before the stack was created or updated. </p></li></ul></li><li><p><code>CURRENT</code>: The stack is currently up to date with the stack set.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackInstanceStatus status;

/**
 <p>The explanation for the specific status code that is assigned to this stack instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

@end

/**
 <p>The detailed status of the stack instance.</p>
 */
@interface AWSCloudformationStackInstanceComprehensiveStatus : AWSModel


/**
 <ul><li><p><code>CANCELLED</code>: The operation in the specified account and Region has been cancelled. This is either because a user has stopped the stack set operation, or because the failure tolerance of the stack set operation has been exceeded.</p></li><li><p><code>FAILED</code>: The operation in the specified account and Region failed. If the stack set operation fails in enough accounts within a Region, the failure tolerance for the stack set operation as a whole might be exceeded.</p></li><li><p><code>INOPERABLE</code>: A <code>DeleteStackInstances</code> operation has failed and left the stack in an unstable state. Stacks in this state are excluded from further <code>UpdateStackSet</code> operations. You might need to perform a <code>DeleteStackInstances</code> operation, with <code>RetainStacks</code> set to <code>true</code>, to delete the stack instance, and then delete the stack manually.</p></li><li><p><code>PENDING</code>: The operation in the specified account and Region has yet to start.</p></li><li><p><code>RUNNING</code>: The operation in the specified account and Region is currently in progress.</p></li><li><p><code>SUCCEEDED</code>: The operation in the specified account and Region completed successfully.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackInstanceDetailedStatus detailedStatus;

@end

/**
 <p>The status that stack instances are filtered by.</p>
 */
@interface AWSCloudformationStackInstanceFilter : AWSModel


/**
 <p>The type of filter to apply.</p>
 */
@property (nonatomic, assign) AWSCloudformationStackInstanceFilterName name;

/**
 <p>The status to filter by.</p>
 */
@property (nonatomic, strong) NSString * _Nullable values;

@end

/**
 <p>The structure that contains summary information about a stack instance.</p>
 */
@interface AWSCloudformationStackInstanceSummary : AWSModel


/**
 <p>[<code>Self-managed</code> permissions] The name of the AWS account that the stack instance is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable account;

/**
 <p>Status of the stack instance's actual configuration compared to the expected template and parameter configuration of the stack set to which it belongs. </p><ul><li><p><code>DRIFTED</code>: The stack differs from the expected template and parameter configuration of the stack set to which it belongs. A stack instance is considered to have drifted if one or more of the resources in the associated stack have drifted.</p></li><li><p><code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the stack instance differs from its expected stack set configuration.</p></li><li><p><code>IN_SYNC</code>: The stack instance's actual configuration matches its expected stack set configuration.</p></li><li><p><code>UNKNOWN</code>: This value is reserved for future use.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackDriftStatus driftStatus;

/**
 <p>Most recent time when CloudFormation performed a drift detection operation on the stack instance. This value will be <code>NULL</code> for any stack instance on which drift detection has not yet been performed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastDriftCheckTimestamp;

/**
 <p>[<code>Service-managed</code> permissions] The organization root ID or organizational unit (OU) IDs that you specified for <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html">DeploymentTargets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationalUnitId;

/**
 <p>The name of the AWS Region that the stack instance is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The ID of the stack instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

/**
 <p>The detailed status of the stack instance.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackInstanceComprehensiveStatus * _Nullable stackInstanceStatus;

/**
 <p>The name or unique ID of the stack set that the stack instance is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetId;

/**
 <p>The status of the stack instance, in terms of its synchronization with its associated stack set.</p><ul><li><p><code>INOPERABLE</code>: A <code>DeleteStackInstances</code> operation has failed and left the stack in an unstable state. Stacks in this state are excluded from further <code>UpdateStackSet</code> operations. You might need to perform a <code>DeleteStackInstances</code> operation, with <code>RetainStacks</code> set to <code>true</code>, to delete the stack instance, and then delete the stack manually.</p></li><li><p><code>OUTDATED</code>: The stack isn't currently up to date with the stack set because:</p><ul><li><p>The associated stack failed during a <code>CreateStackSet</code> or <code>UpdateStackSet</code> operation. </p></li><li><p>The stack was part of a <code>CreateStackSet</code> or <code>UpdateStackSet</code> operation that failed or was stopped before the stack was created or updated. </p></li></ul></li><li><p><code>CURRENT</code>: The stack is currently up to date with the stack set.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackInstanceStatus status;

/**
 <p>The explanation for the specific status code assigned to this stack instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

@end

/**
 <p>The StackResource data type.</p>
 Required parameters: [LogicalResourceId, ResourceType, Timestamp, ResourceStatus]
 */
@interface AWSCloudformationStackResource : AWSModel


/**
 <p>User defined description associated with the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Information about whether the resource's actual configuration differs, or has <i>drifted</i>, from its expected configuration, as defined in the stack template and any values specified as template parameters. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackResourceDriftInformation * _Nullable driftInformation;

/**
 <p>The logical name of the resource specified in the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logicalResourceId;

/**
 <p>The name or unique identifier that corresponds to a physical instance ID of a resource supported by AWS CloudFormation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable physicalResourceId;

/**
 <p>Current status of the resource.</p>
 */
@property (nonatomic, assign) AWSCloudformationResourceStatus resourceStatus;

/**
 <p>Success/failure message associated with the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceStatusReason;

/**
 <p>Type of resource. (For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html"> AWS Resource Types Reference</a> in the AWS CloudFormation User Guide.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>Unique identifier of the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

/**
 <p>The name associated with the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>Time the status was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 <p>Contains detailed information about the specified stack resource.</p>
 Required parameters: [LogicalResourceId, ResourceType, LastUpdatedTimestamp, ResourceStatus]
 */
@interface AWSCloudformationStackResourceDetail : AWSModel


/**
 <p>User defined description associated with the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Information about whether the resource's actual configuration differs, or has <i>drifted</i>, from its expected configuration, as defined in the stack template and any values specified as template parameters. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackResourceDriftInformation * _Nullable driftInformation;

/**
 <p>Time the status was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p>The logical name of the resource specified in the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logicalResourceId;

/**
 <p>The content of the <code>Metadata</code> attribute declared for the resource. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-metadata.html">Metadata Attribute</a> in the AWS CloudFormation User Guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metadata;

/**
 <p>The name or unique identifier that corresponds to a physical instance ID of a resource supported by AWS CloudFormation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable physicalResourceId;

/**
 <p>Current status of the resource.</p>
 */
@property (nonatomic, assign) AWSCloudformationResourceStatus resourceStatus;

/**
 <p>Success/failure message associated with the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceStatusReason;

/**
 <p>Type of resource. ((For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html"> AWS Resource Types Reference</a> in the AWS CloudFormation User Guide.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>Unique identifier of the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

/**
 <p>The name associated with the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 <p>Contains the drift information for a resource that has been checked for drift. This includes actual and expected property values for resources in which AWS CloudFormation has detected drift. Only resource properties explicitly defined in the stack template are checked for drift. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p><p>Resources that do not currently support drift detection cannot be checked. For a list of resources that support drift detection, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources that Support Drift Detection</a>.</p><p>Use <a>DetectStackResourceDrift</a> to detect drift on individual resources, or <a>DetectStackDrift</a> to detect drift on all resources in a given stack that support drift detection.</p>
 Required parameters: [StackId, LogicalResourceId, ResourceType, StackResourceDriftStatus, Timestamp]
 */
@interface AWSCloudformationStackResourceDrift : AWSModel


/**
 <p>A JSON structure containing the actual property values of the stack resource.</p><p>For resources whose <code>StackResourceDriftStatus</code> is <code>DELETED</code>, this structure will not be present. </p>
 */
@property (nonatomic, strong) NSString * _Nullable actualProperties;

/**
 <p>A JSON structure containing the expected property values of the stack resource, as defined in the stack template and any values specified as template parameters. </p><p>For resources whose <code>StackResourceDriftStatus</code> is <code>DELETED</code>, this structure will not be present. </p>
 */
@property (nonatomic, strong) NSString * _Nullable expectedProperties;

/**
 <p>The logical name of the resource specified in the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logicalResourceId;

/**
 <p>The name or unique identifier that corresponds to a physical instance ID of a resource supported by AWS CloudFormation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable physicalResourceId;

/**
 <p>Context information that enables AWS CloudFormation to uniquely identify a resource. AWS CloudFormation uses context key-value pairs in cases where a resource's logical and physical IDs are not enough to uniquely identify that resource. Each context key-value pair specifies a unique resource that contains the targeted resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationPhysicalResourceIdContextKeyValuePair *> * _Nullable physicalResourceIdContext;

/**
 <p>A collection of the resource properties whose actual values differ from their expected values. These will be present only for resources whose <code>StackResourceDriftStatus</code> is <code>MODIFIED</code>. </p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationPropertyDifference *> * _Nullable propertyDifferences;

/**
 <p>The type of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The ID of the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

/**
 <p>Status of the resource's actual configuration compared to its expected configuration</p><ul><li><p><code>DELETED</code>: The resource differs from its expected template configuration because the resource has been deleted.</p></li><li><p><code>MODIFIED</code>: One or more resource properties differ from their expected values (as defined in the stack template and any values specified as template parameters).</p></li><li><p><code>IN_SYNC</code>: The resources's actual configuration matches its expected template configuration.</p></li><li><p><code>NOT_CHECKED</code>: AWS CloudFormation does not currently return this value.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackResourceDriftStatus stackResourceDriftStatus;

/**
 <p>Time at which AWS CloudFormation performed drift detection on the stack resource.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 <p>Contains information about whether the resource's actual configuration differs, or has <i>drifted</i>, from its expected configuration.</p>
 Required parameters: [StackResourceDriftStatus]
 */
@interface AWSCloudformationStackResourceDriftInformation : AWSModel


/**
 <p>When AWS CloudFormation last checked if the resource had drifted from its expected configuration.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastCheckTimestamp;

/**
 <p>Status of the resource's actual configuration compared to its expected configuration</p><ul><li><p><code>DELETED</code>: The resource differs from its expected configuration in that it has been deleted.</p></li><li><p><code>MODIFIED</code>: The resource differs from its expected configuration.</p></li><li><p><code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the resource differs from its expected configuration.</p><p>Any resources that do not currently support drift detection have a status of <code>NOT_CHECKED</code>. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources that Support Drift Detection</a>. </p></li><li><p><code>IN_SYNC</code>: The resources's actual configuration matches its expected configuration.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackResourceDriftStatus stackResourceDriftStatus;

@end

/**
 <p>Summarizes information about whether the resource's actual configuration differs, or has <i>drifted</i>, from its expected configuration.</p>
 Required parameters: [StackResourceDriftStatus]
 */
@interface AWSCloudformationStackResourceDriftInformationSummary : AWSModel


/**
 <p>When AWS CloudFormation last checked if the resource had drifted from its expected configuration.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastCheckTimestamp;

/**
 <p>Status of the resource's actual configuration compared to its expected configuration</p><ul><li><p><code>DELETED</code>: The resource differs from its expected configuration in that it has been deleted.</p></li><li><p><code>MODIFIED</code>: The resource differs from its expected configuration.</p></li><li><p><code>NOT_CHECKED</code>: AWS CloudFormation has not checked if the resource differs from its expected configuration.</p><p>Any resources that do not currently support drift detection have a status of <code>NOT_CHECKED</code>. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift-resource-list.html">Resources that Support Drift Detection</a>. If you performed an <a>ContinueUpdateRollback</a> operation on a stack, any resources included in <code>ResourcesToSkip</code> will also have a status of <code>NOT_CHECKED</code>. For more information on skipping resources during rollback operations, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html">Continue Rolling Back an Update</a> in the AWS CloudFormation User Guide.</p></li><li><p><code>IN_SYNC</code>: The resources's actual configuration matches its expected configuration.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackResourceDriftStatus stackResourceDriftStatus;

@end

/**
 <p>Contains high-level information about the specified stack resource.</p>
 Required parameters: [LogicalResourceId, ResourceType, LastUpdatedTimestamp, ResourceStatus]
 */
@interface AWSCloudformationStackResourceSummary : AWSModel


/**
 <p>Information about whether the resource's actual configuration differs, or has <i>drifted</i>, from its expected configuration, as defined in the stack template and any values specified as template parameters. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackResourceDriftInformationSummary * _Nullable driftInformation;

/**
 <p>Time the status was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p>The logical name of the resource specified in the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logicalResourceId;

/**
 <p>The name or unique identifier that corresponds to a physical instance ID of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable physicalResourceId;

/**
 <p>Current status of the resource.</p>
 */
@property (nonatomic, assign) AWSCloudformationResourceStatus resourceStatus;

/**
 <p>Success/failure message associated with the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceStatusReason;

/**
 <p>Type of resource. (For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html"> AWS Resource Types Reference</a> in the AWS CloudFormation User Guide.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

@end

/**
 <p>A structure that contains information about a stack set. A stack set enables you to provision stacks into AWS accounts and across Regions by using a single CloudFormation template. In the stack set, you specify the template to use, as well as any parameters and capabilities that the template requires. </p>
 */
@interface AWSCloudformationStackSet : AWSModel


/**
 <p>The Amazon Resource Number (ARN) of the IAM role used to create or update the stack set.</p><p>Use customized administrator roles to control which users or groups can manage specific stack sets within the same administrator account. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html">Prerequisites: Granting Permissions for Stack Set Operations</a> in the <i>AWS CloudFormation User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable administrationRoleARN;

/**
 <p>[<code>Service-managed</code> permissions] Describes whether StackSets automatically deploys to AWS Organizations accounts that are added to a target organization or organizational unit (OU).</p>
 */
@property (nonatomic, strong) AWSCloudformationAutoDeployment * _Nullable autoDeployment;

/**
 <p>The capabilities that are allowed in the stack set. Some stack set templates might include resources that can affect permissions in your AWS account—for example, by creating new AWS Identity and Access Management (IAM) users. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging IAM Resources in AWS CloudFormation Templates.</a></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable capabilities;

/**
 <p>A description of the stack set that you specify when the stack set is created or updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the IAM execution role used to create or update the stack set. </p><p>Use customized execution roles to control which stack resources users and groups can include in their stack sets. </p>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleName;

/**
 <p>[<code>Service-managed</code> permissions] The organization root ID or organizational unit (OU) IDs that you specified for <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html">DeploymentTargets</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable organizationalUnitIds;

/**
 <p>A list of input parameters for a stack set.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationParameter *> * _Nullable parameters;

/**
 <p>Describes how the IAM roles required for stack set operations are created.</p><ul><li><p>With <code>self-managed</code> permissions, you must create the administrator and execution roles required to deploy to target accounts. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html">Grant Self-Managed Stack Set Permissions</a>.</p></li><li><p>With <code>service-managed</code> permissions, StackSets automatically creates the IAM roles required to deploy to accounts managed by AWS Organizations. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html">Grant Service-Managed Stack Set Permissions</a>.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationPermissionModels permissionModel;

/**
 <p>The Amazon Resource Number (ARN) of the stack set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetARN;

/**
 <p>Detailed information about the drift status of the stack set.</p><p>For stack sets, contains information about the last <i>completed</i> drift operation performed on the stack set. Information about drift operations currently in progress is not included.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackSetDriftDetectionDetails * _Nullable stackSetDriftDetectionDetails;

/**
 <p>The ID of the stack set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetId;

/**
 <p>The name that's associated with the stack set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

/**
 <p>The status of the stack set.</p>
 */
@property (nonatomic, assign) AWSCloudformationStackSetStatus status;

/**
 <p>A list of tags that specify information about the stack set. A maximum number of 50 tags can be specified.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationTag *> * _Nullable tags;

/**
 <p>The structure that contains the body of the template that was used to create or update the stack set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

@end

/**
 <p>Detailed information about the drift status of the stack set.</p><p>For stack sets, contains information about the last <i>completed</i> drift operation performed on the stack set. Information about drift operations in-progress is not included. </p><p>For stack set operations, includes information about drift operations currently being performed on the stack set.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html">Detecting Unmanaged Changes in Stack Sets</a> in the <i>AWS CloudFormation User Guide</i>.</p>
 */
@interface AWSCloudformationStackSetDriftDetectionDetails : AWSModel


/**
 <p>The status of the stack set drift detection operation.</p><ul><li><p><code>COMPLETED</code>: The drift detection operation completed without failing on any stack instances.</p></li><li><p><code>FAILED</code>: The drift detection operation exceeded the specified failure tolerance. </p></li><li><p><code>PARTIAL_SUCCESS</code>: The drift detection operation completed without exceeding the failure tolerance for the operation.</p></li><li><p><code>IN_PROGRESS</code>: The drift detection operation is currently being performed.</p></li><li><p><code>STOPPED</code>: The user has cancelled the drift detection operation.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackSetDriftDetectionStatus driftDetectionStatus;

/**
 <p>Status of the stack set's actual configuration compared to its expected template and parameter configuration. A stack set is considered to have drifted if one or more of its stack instances have drifted from their expected template and parameter configuration.</p><ul><li><p><code>DRIFTED</code>: One or more of the stack instances belonging to the stack set stack differs from the expected template and parameter configuration. A stack instance is considered to have drifted if one or more of the resources in the associated stack have drifted.</p></li><li><p><code>NOT_CHECKED</code>: AWS CloudFormation has not checked the stack set for drift.</p></li><li><p><code>IN_SYNC</code>: All of the stack instances belonging to the stack set stack match from the expected template and parameter configuration.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackSetDriftStatus driftStatus;

/**
 <p>The number of stack instances that have drifted from the expected template and parameter configuration of the stack set. A stack instance is considered to have drifted if one or more of the resources in the associated stack do not match their expected configuration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable driftedStackInstancesCount;

/**
 <p>The number of stack instances for which the drift detection operation failed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedStackInstancesCount;

/**
 <p>The number of stack instances that are currently being checked for drift.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inProgressStackInstancesCount;

/**
 <p>The number of stack instances which match the expected template and parameter configuration of the stack set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inSyncStackInstancesCount;

/**
 <p>Most recent time when CloudFormation performed a drift detection operation on the stack set. This value will be <code>NULL</code> for any stack set on which drift detection has not yet been performed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastDriftCheckTimestamp;

/**
 <p>The total number of stack instances belonging to this stack set. </p><p>The total number of stack instances is equal to the total of:</p><ul><li><p>Stack instances that match the stack set configuration. </p></li><li><p>Stack instances that have drifted from the stack set configuration. </p></li><li><p>Stack instances where the drift detection operation has failed.</p></li><li><p>Stack instances currently being checked for drift.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalStackInstancesCount;

@end

/**
 <p>The structure that contains information about a stack set operation. </p>
 */
@interface AWSCloudformationStackSetOperation : AWSModel


/**
 <p>The type of stack set operation: <code>CREATE</code>, <code>UPDATE</code>, or <code>DELETE</code>. Create and delete operations affect only the specified stack set instances that are associated with the specified stack set. Update operations affect both the stack set itself, as well as <i>all</i> associated stack set instances.</p>
 */
@property (nonatomic, assign) AWSCloudformationStackSetOperationAction action;

/**
 <p>The Amazon Resource Number (ARN) of the IAM role used to perform this stack set operation. </p><p>Use customized administrator roles to control which users or groups can manage specific stack sets within the same administrator account. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html">Define Permissions for Multiple Administrators</a> in the <i>AWS CloudFormation User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable administrationRoleARN;

/**
 <p>The time at which the operation was initiated. Note that the creation times for the stack set operation might differ from the creation time of the individual stacks themselves. This is because AWS CloudFormation needs to perform preparatory work for the operation, such as dispatching the work to the requested Regions, before actually creating the first stacks.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimestamp;

/**
 <p>[<code>Service-managed</code> permissions] The AWS Organizations accounts affected by the stack operation.</p>
 */
@property (nonatomic, strong) AWSCloudformationDeploymentTargets * _Nullable deploymentTargets;

/**
 <p>The time at which the stack set operation ended, across all accounts and Regions specified. Note that this doesn't necessarily mean that the stack set operation was successful, or even attempted, in each account or Region.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTimestamp;

/**
 <p>The name of the IAM execution role used to create or update the stack set.</p><p>Use customized execution roles to control which stack resources users and groups can include in their stack sets. </p>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleName;

/**
 <p>The unique ID of a stack set operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

/**
 <p>The preferences for how AWS CloudFormation performs this stack set operation.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackSetOperationPreferences * _Nullable operationPreferences;

/**
 <p>For stack set operations of action type <code>DELETE</code>, specifies whether to remove the stack instances from the specified stack set, but doesn't delete the stacks. You can't reassociate a retained stack, or add an existing, saved stack to a new stack set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retainStacks;

/**
 <p>Detailed information about the drift status of the stack set. This includes information about drift operations currently being performed on the stack set.</p><p>this information will only be present for stack set operations whose <code>Action</code> type is <code>DETECT_DRIFT</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html">Detecting Unmanaged Changes in Stack Sets</a> in the AWS CloudFormation User Guide.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackSetDriftDetectionDetails * _Nullable stackSetDriftDetectionDetails;

/**
 <p>The ID of the stack set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetId;

/**
 <p>The status of the operation. </p><ul><li><p><code>FAILED</code>: The operation exceeded the specified failure tolerance. The failure tolerance value that you've set for an operation is applied for each Region during stack create and update operations. If the number of failed stacks within a Region exceeds the failure tolerance, the status of the operation in the Region is set to <code>FAILED</code>. This in turn sets the status of the operation as a whole to <code>FAILED</code>, and AWS CloudFormation cancels the operation in any remaining Regions.</p></li><li><p><code>QUEUED</code>: [<code>Service-managed</code> permissions] For automatic deployments that require a sequence of operations, the operation is queued to be performed. For more information, see the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-status-codes">stack set operation status codes</a> in the AWS CloudFormation User Guide.</p></li><li><p><code>RUNNING</code>: The operation is currently being performed.</p></li><li><p><code>STOPPED</code>: The user has cancelled the operation.</p></li><li><p><code>STOPPING</code>: The operation is in the process of stopping, at user request. </p></li><li><p><code>SUCCEEDED</code>: The operation completed creating or updating all the specified stacks without exceeding the failure tolerance for the operation.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackSetOperationStatus status;

@end

/**
 <p>The user-specified preferences for how AWS CloudFormation performs a stack set operation. </p><p>For more information on maximum concurrent accounts and failure tolerance, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options">Stack set operation options</a>.</p>
 */
@interface AWSCloudformationStackSetOperationPreferences : AWSModel


/**
 <p>The number of accounts, per Region, for which this operation can fail before AWS CloudFormation stops the operation in that Region. If the operation is stopped in a Region, AWS CloudFormation doesn't attempt the operation in any subsequent Regions.</p><p>Conditional: You must specify either <code>FailureToleranceCount</code> or <code>FailureTolerancePercentage</code> (but not both).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failureToleranceCount;

/**
 <p>The percentage of accounts, per Region, for which this stack operation can fail before AWS CloudFormation stops the operation in that Region. If the operation is stopped in a Region, AWS CloudFormation doesn't attempt the operation in any subsequent Regions.</p><p>When calculating the number of accounts based on the specified percentage, AWS CloudFormation rounds <i>down</i> to the next whole number.</p><p>Conditional: You must specify either <code>FailureToleranceCount</code> or <code>FailureTolerancePercentage</code>, but not both.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failureTolerancePercentage;

/**
 <p>The maximum number of accounts in which to perform this operation at one time. This is dependent on the value of <code>FailureToleranceCount</code>. <code>MaxConcurrentCount</code> is at most one more than the <code>FailureToleranceCount</code>.</p><p>Note that this setting lets you specify the <i>maximum</i> for operations. For large deployments, under certain circumstances the actual number of accounts acted upon concurrently may be lower due to service throttling.</p><p>Conditional: You must specify either <code>MaxConcurrentCount</code> or <code>MaxConcurrentPercentage</code>, but not both.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxConcurrentCount;

/**
 <p>The maximum percentage of accounts in which to perform this operation at one time.</p><p>When calculating the number of accounts based on the specified percentage, AWS CloudFormation rounds down to the next whole number. This is true except in cases where rounding down would result is zero. In this case, CloudFormation sets the number as one instead.</p><p>Note that this setting lets you specify the <i>maximum</i> for operations. For large deployments, under certain circumstances the actual number of accounts acted upon concurrently may be lower due to service throttling.</p><p>Conditional: You must specify either <code>MaxConcurrentCount</code> or <code>MaxConcurrentPercentage</code>, but not both.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxConcurrentPercentage;

/**
 <p>The order of the Regions in where you want to perform the stack operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable regionOrder;

@end

/**
 <p>The structure that contains information about a specified operation's results for a given account in a given Region.</p>
 */
@interface AWSCloudformationStackSetOperationResultSummary : AWSModel


/**
 <p>[<code>Self-managed</code> permissions] The name of the AWS account for this operation result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable account;

/**
 <p>The results of the account gate function AWS CloudFormation invokes, if present, before proceeding with stack set operations in an account</p>
 */
@property (nonatomic, strong) AWSCloudformationAccountGateResult * _Nullable accountGateResult;

/**
 <p>[<code>Service-managed</code> permissions] The organization root ID or organizational unit (OU) IDs that you specified for <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeploymentTargets.html">DeploymentTargets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationalUnitId;

/**
 <p>The name of the AWS Region for this operation result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The result status of the stack set operation for the given account in the given Region.</p><ul><li><p><code>CANCELLED</code>: The operation in the specified account and Region has been cancelled. This is either because a user has stopped the stack set operation, or because the failure tolerance of the stack set operation has been exceeded.</p></li><li><p><code>FAILED</code>: The operation in the specified account and Region failed. </p><p>If the stack set operation fails in enough accounts within a Region, the failure tolerance for the stack set operation as a whole might be exceeded. </p></li><li><p><code>RUNNING</code>: The operation in the specified account and Region is currently in progress.</p></li><li><p><code>PENDING</code>: The operation in the specified account and Region has yet to start. </p></li><li><p><code>SUCCEEDED</code>: The operation in the specified account and Region completed successfully.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackSetOperationResultStatus status;

/**
 <p>The reason for the assigned result status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

@end

/**
 <p>The structures that contain summary information about the specified operation.</p>
 */
@interface AWSCloudformationStackSetOperationSummary : AWSModel


/**
 <p>The type of operation: <code>CREATE</code>, <code>UPDATE</code>, or <code>DELETE</code>. Create and delete operations affect only the specified stack instances that are associated with the specified stack set. Update operations affect both the stack set itself as well as <i>all</i> associated stack set instances.</p>
 */
@property (nonatomic, assign) AWSCloudformationStackSetOperationAction action;

/**
 <p>The time at which the operation was initiated. Note that the creation times for the stack set operation might differ from the creation time of the individual stacks themselves. This is because AWS CloudFormation needs to perform preparatory work for the operation, such as dispatching the work to the requested Regions, before actually creating the first stacks.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimestamp;

/**
 <p>The time at which the stack set operation ended, across all accounts and Regions specified. Note that this doesn't necessarily mean that the stack set operation was successful, or even attempted, in each account or Region.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTimestamp;

/**
 <p>The unique ID of the stack set operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

/**
 <p>The overall status of the operation.</p><ul><li><p><code>FAILED</code>: The operation exceeded the specified failure tolerance. The failure tolerance value that you've set for an operation is applied for each Region during stack create and update operations. If the number of failed stacks within a Region exceeds the failure tolerance, the status of the operation in the Region is set to <code>FAILED</code>. This in turn sets the status of the operation as a whole to <code>FAILED</code>, and AWS CloudFormation cancels the operation in any remaining Regions.</p></li><li><p><code>QUEUED</code>: [<code>Service-managed</code> permissions] For automatic deployments that require a sequence of operations, the operation is queued to be performed. For more information, see the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-status-codes">stack set operation status codes</a> in the AWS CloudFormation User Guide.</p></li><li><p><code>RUNNING</code>: The operation is currently being performed.</p></li><li><p><code>STOPPED</code>: The user has cancelled the operation.</p></li><li><p><code>STOPPING</code>: The operation is in the process of stopping, at user request. </p></li><li><p><code>SUCCEEDED</code>: The operation completed creating or updating all the specified stacks without exceeding the failure tolerance for the operation.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackSetOperationStatus status;

@end

/**
 <p>The structures that contain summary information about the specified stack set.</p>
 */
@interface AWSCloudformationStackSetSummary : AWSModel


/**
 <p>[<code>Service-managed</code> permissions] Describes whether StackSets automatically deploys to AWS Organizations accounts that are added to a target organizational unit (OU).</p>
 */
@property (nonatomic, strong) AWSCloudformationAutoDeployment * _Nullable autoDeployment;

/**
 <p>A description of the stack set that you specify when the stack set is created or updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Status of the stack set's actual configuration compared to its expected template and parameter configuration. A stack set is considered to have drifted if one or more of its stack instances have drifted from their expected template and parameter configuration.</p><ul><li><p><code>DRIFTED</code>: One or more of the stack instances belonging to the stack set stack differs from the expected template and parameter configuration. A stack instance is considered to have drifted if one or more of the resources in the associated stack have drifted.</p></li><li><p><code>NOT_CHECKED</code>: AWS CloudFormation has not checked the stack set for drift.</p></li><li><p><code>IN_SYNC</code>: All of the stack instances belonging to the stack set stack match from the expected template and parameter configuration.</p></li><li><p><code>UNKNOWN</code>: This value is reserved for future use.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationStackDriftStatus driftStatus;

/**
 <p>Most recent time when CloudFormation performed a drift detection operation on the stack set. This value will be <code>NULL</code> for any stack set on which drift detection has not yet been performed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastDriftCheckTimestamp;

/**
 <p>Describes how the IAM roles required for stack set operations are created.</p><ul><li><p>With <code>self-managed</code> permissions, you must create the administrator and execution roles required to deploy to target accounts. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html">Grant Self-Managed Stack Set Permissions</a>.</p></li><li><p>With <code>service-managed</code> permissions, StackSets automatically creates the IAM roles required to deploy to accounts managed by AWS Organizations. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html">Grant Service-Managed Stack Set Permissions</a>.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationPermissionModels permissionModel;

/**
 <p>The ID of the stack set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetId;

/**
 <p>The name of the stack set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

/**
 <p>The status of the stack set.</p>
 */
@property (nonatomic, assign) AWSCloudformationStackSetStatus status;

@end

/**
 <p>The StackSummary Data Type</p>
 Required parameters: [StackName, CreationTime, StackStatus]
 */
@interface AWSCloudformationStackSummary : AWSModel


/**
 <p>The time the stack was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The time the stack was deleted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletionTime;

/**
 <p>Summarizes information on whether a stack's actual configuration differs, or has <i>drifted</i>, from it's expected configuration, as defined in the stack template and any values specified as template parameters. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html">Detecting Unregulated Configuration Changes to Stacks and Resources</a>.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackDriftInformationSummary * _Nullable driftInformation;

/**
 <p>The time the stack was last updated. This field will only be returned if the stack has been updated at least once.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>For nested stacks--stacks created as resources for another stack--the stack ID of the direct parent of this stack. For the first level of nested stacks, the root stack is also the parent stack.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">Working with Nested Stacks</a> in the <i>AWS CloudFormation User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentId;

/**
 <p>For nested stacks--stacks created as resources for another stack--the stack ID of the top-level stack to which the nested stack ultimately belongs.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html">Working with Nested Stacks</a> in the <i>AWS CloudFormation User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rootId;

/**
 <p>Unique stack identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

/**
 <p>The name associated with the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>The current status of the stack.</p>
 */
@property (nonatomic, assign) AWSCloudformationStackStatus stackStatus;

/**
 <p>Success/Failure message associated with the stack status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackStatusReason;

/**
 <p>The template description of the template used to create the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateDescription;

@end

/**
 
 */
@interface AWSCloudformationStopStackSetOperationInput : AWSRequest


/**
 <p>The ID of the stack operation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

/**
 <p>The name or unique ID of the stack set that you want to stop the operation for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

@end

/**
 
 */
@interface AWSCloudformationStopStackSetOperationOutput : AWSModel


@end

/**
 <p>The Tag type enables you to specify a key-value pair that can be used to store information about an AWS CloudFormation stack.</p>
 Required parameters: [Key, Value]
 */
@interface AWSCloudformationTag : AWSModel


/**
 <p><i>Required</i>. A string used to identify this tag. You can specify a maximum of 128 characters for a tag key. Tags owned by Amazon Web Services (AWS) have the reserved prefix: <code>aws:</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p><i>Required</i>. A string containing the value for this tag. You can specify a maximum of 256 characters for a tag value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The TemplateParameter data type.</p>
 */
@interface AWSCloudformationTemplateParameter : AWSModel


/**
 <p>The default value associated with the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>User defined description associated with the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Flag indicating whether the parameter should be displayed as plain text in logs and UIs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable noEcho;

/**
 <p>The name associated with the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterKey;

@end

/**
 <p>Contains summary information about the specified CloudFormation type.</p>
 */
@interface AWSCloudformationTypeSummary : AWSModel


/**
 <p>The ID of the default version of the type. The default version is used when the type version is not specified.</p><p>To set the default version of a type, use <code><a>SetTypeDefaultVersion</a></code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultVersionId;

/**
 <p>The description of the type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>When the current default version of the type was registered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdated;

/**
 <p>The kind of type.</p>
 */
@property (nonatomic, assign) AWSCloudformationRegistryType types;

/**
 <p>The Amazon Resource Name (ARN) of the type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeArn;

/**
 <p>The name of the type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

@end

/**
 <p>Contains summary information about a specific version of a CloudFormation type.</p>
 */
@interface AWSCloudformationTypeVersionSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the type version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The description of the type version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Whether the specified type version is set as the default version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>When the version was registered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timeCreated;

/**
 <p>The kind of type.</p>
 */
@property (nonatomic, assign) AWSCloudformationRegistryType types;

/**
 <p>The name of the type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable typeName;

/**
 <p>The ID of a specific version of the type. The version ID is the value at the end of the Amazon Resource Name (ARN) assigned to the type version when it is registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>The input for an <a>UpdateStack</a> action.</p>
 Required parameters: [StackName]
 */
@interface AWSCloudformationUpdateStackInput : AWSRequest


/**
 <p>In some cases, you must explicitly acknowledge that your stack template contains certain capabilities in order for AWS CloudFormation to update the stack.</p><ul><li><p><code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code></p><p>Some stack templates might include resources that can affect permissions in your AWS account; for example, by creating new AWS Identity and Access Management (IAM) users. For those stacks, you must explicitly acknowledge this by specifying one of these capabilities.</p><p>The following IAM resources require you to specify either the <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code> capability.</p><ul><li><p>If you have IAM resources, you can specify either capability. </p></li><li><p>If you have IAM resources with custom names, you <i>must</i> specify <code>CAPABILITY_NAMED_IAM</code>. </p></li><li><p>If you don't specify either of these capabilities, AWS CloudFormation returns an <code>InsufficientCapabilities</code> error.</p></li></ul><p>If your stack template contains these resources, we recommend that you review all permissions associated with them and edit their permissions if necessary.</p><ul><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html"> AWS::IAM::AccessKey</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html"> AWS::IAM::Group</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html"> AWS::IAM::InstanceProfile</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html"> AWS::IAM::Policy</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html"> AWS::IAM::Role</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html"> AWS::IAM::User</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html"> AWS::IAM::UserToGroupAddition</a></p></li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p></li><li><p><code>CAPABILITY_AUTO_EXPAND</code></p><p>Some template contain macros. Macros perform custom processing on templates; this can include simple actions like find-and-replace operations, all the way to extensive transformations of entire templates. Because of this, users typically create a change set from the processed template, so that they can review the changes resulting from the macros before actually updating the stack. If your stack template contains one or more macros, and you choose to update a stack directly from the processed template, without first reviewing the resulting changes in a change set, you must acknowledge this capability. This includes the <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a> and <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a> transforms, which are macros hosted by AWS CloudFormation.</p><p>Change sets do not currently support nested stacks. If you want to update a stack from a stack template that contains macros <i>and</i> nested stacks, you must update the stack directly from the template using this capability.</p><important><p>You should only update stacks directly from a stack template that contains macros if you know what processing the macro performs.</p><p>Each macro relies on an underlying Lambda service function for processing stack templates. Be aware that the Lambda function owner can update the function operation without AWS CloudFormation being notified.</p></important><p>For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable capabilities;

/**
 <p>A unique identifier for this <code>UpdateStack</code> request. Specify this token if you plan to retry requests so that AWS CloudFormation knows that you're not attempting to update a stack with the same name. You might retry <code>UpdateStack</code> requests to ensure that AWS CloudFormation successfully received them.</p><p>All events triggered by a given stack operation are assigned the same client request token, which you can use to track operations. For example, if you execute a <code>CreateStack</code> operation with the token <code>token1</code>, then all the <code>StackEvents</code> generated by that operation will have <code>ClientRequestToken</code> set as <code>token1</code>.</p><p>In the console, stack operations display the client request token on the Events tab. Stack operations that are initiated from the console use the token format <i>Console-StackOperation-ID</i>, which helps you easily identify the stack operation . For example, if you create a stack using the console, each stack event would be assigned the same token in the following format: <code>Console-CreateStack-7f59c3cf-00d2-40c7-b2ff-e75db0987002</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>Amazon Simple Notification Service topic Amazon Resource Names (ARNs) that AWS CloudFormation associates with the stack. Specify an empty list to remove all notification topics.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notificationARNs;

/**
 <p>A list of <code>Parameter</code> structures that specify input parameters for the stack. For more information, see the <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_Parameter.html">Parameter</a> data type.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationParameter *> * _Nullable parameters;

/**
 <p>The template resource types that you have permissions to work with for this update stack action, such as <code>AWS::EC2::Instance</code>, <code>AWS::EC2::*</code>, or <code>Custom::MyCustomInstance</code>.</p><p>If the list of resource types doesn't include a resource that you're updating, the stack update fails. By default, AWS CloudFormation grants permissions to all resource types. AWS Identity and Access Management (IAM) uses this parameter for AWS CloudFormation-specific condition keys in IAM policies. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html">Controlling Access with AWS Identity and Access Management</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceTypes;

/**
 <p>The Amazon Resource Name (ARN) of an AWS Identity and Access Management (IAM) role that AWS CloudFormation assumes to update the stack. AWS CloudFormation uses the role's credentials to make calls on your behalf. AWS CloudFormation always uses this role for all future operations on the stack. As long as users have permission to operate on the stack, AWS CloudFormation uses this role even if the users don't have permission to pass it. Ensure that the role grants least privilege.</p><p>If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

/**
 <p>The rollback triggers for AWS CloudFormation to monitor during stack creation and updating operations, and for the specified monitoring period afterwards.</p>
 */
@property (nonatomic, strong) AWSCloudformationRollbackConfiguration * _Nullable rollbackConfiguration;

/**
 <p>The name or unique stack ID of the stack to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

/**
 <p>Structure containing a new stack policy body. You can specify either the <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter, but not both.</p><p>You might update the stack policy, for example, in order to protect a new resource that you created during a stack update. If you do not specify a stack policy, the current policy that is associated with the stack is unchanged.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackPolicyBody;

/**
 <p>Structure containing the temporary overriding stack policy body. You can specify either the <code>StackPolicyDuringUpdateBody</code> or the <code>StackPolicyDuringUpdateURL</code> parameter, but not both.</p><p>If you want to update protected resources, specify a temporary overriding stack policy during this update. If you do not specify a stack policy, the current policy that is associated with the stack will be used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackPolicyDuringUpdateBody;

/**
 <p>Location of a file containing the temporary overriding stack policy. The URL must point to a policy (max size: 16KB) located in an S3 bucket in the same Region as the stack. You can specify either the <code>StackPolicyDuringUpdateBody</code> or the <code>StackPolicyDuringUpdateURL</code> parameter, but not both.</p><p>If you want to update protected resources, specify a temporary overriding stack policy during this update. If you do not specify a stack policy, the current policy that is associated with the stack will be used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackPolicyDuringUpdateURL;

/**
 <p>Location of a file containing the updated stack policy. The URL must point to a policy (max size: 16KB) located in an S3 bucket in the same Region as the stack. You can specify either the <code>StackPolicyBody</code> or the <code>StackPolicyURL</code> parameter, but not both.</p><p>You might update the stack policy, for example, in order to protect a new resource that you created during a stack update. If you do not specify a stack policy, the current policy that is associated with the stack is unchanged.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackPolicyURL;

/**
 <p>Key-value pairs to associate with this stack. AWS CloudFormation also propagates these tags to supported resources in the stack. You can specify a maximum number of 50 tags.</p><p>If you don't specify this parameter, AWS CloudFormation doesn't modify the stack's tags. If you specify an empty value, AWS CloudFormation removes all associated tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationTag *> * _Nullable tags;

/**
 <p>Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes. (For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.)</p><p>Conditional: You must specify only one of the following parameters: <code>TemplateBody</code>, <code>TemplateURL</code>, or set the <code>UsePreviousTemplate</code> to <code>true</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

/**
 <p>Location of file containing the template body. The URL must point to a template that is located in an Amazon S3 bucket. For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.</p><p>Conditional: You must specify only one of the following parameters: <code>TemplateBody</code>, <code>TemplateURL</code>, or set the <code>UsePreviousTemplate</code> to <code>true</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateURL;

/**
 <p>Reuse the existing template that is associated with the stack that you are updating.</p><p>Conditional: You must specify only one of the following parameters: <code>TemplateBody</code>, <code>TemplateURL</code>, or set the <code>UsePreviousTemplate</code> to <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usePreviousTemplate;

@end

/**
 
 */
@interface AWSCloudformationUpdateStackInstancesInput : AWSRequest


/**
 <p>[<code>Self-managed</code> permissions] The names of one or more AWS accounts for which you want to update parameter values for stack instances. The overridden parameter values will be applied to all stack instances in the specified accounts and Regions.</p><p>You can specify <code>Accounts</code> or <code>DeploymentTargets</code>, but not both.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accounts;

/**
 <p>[<code>Service-managed</code> permissions] The AWS Organizations accounts for which you want to update parameter values for stack instances. If your update targets OUs, the overridden parameter values only apply to the accounts that are currently in the target OUs and their child OUs. Accounts added to the target OUs and their child OUs in the future won't use the overridden values.</p><p>You can specify <code>Accounts</code> or <code>DeploymentTargets</code>, but not both.</p>
 */
@property (nonatomic, strong) AWSCloudformationDeploymentTargets * _Nullable deploymentTargets;

/**
 <p>The unique identifier for this stack set operation. </p><p>The operation ID also functions as an idempotency token, to ensure that AWS CloudFormation performs the stack set operation only once, even if you retry the request multiple times. You might retry stack set operation requests to ensure that AWS CloudFormation successfully received them.</p><p>If you don't specify an operation ID, the SDK generates one automatically. </p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

/**
 <p>Preferences for how AWS CloudFormation performs this stack set operation.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackSetOperationPreferences * _Nullable operationPreferences;

/**
 <p> A list of input parameters whose values you want to update for the specified stack instances. </p><p>Any overridden parameter values will be applied to all stack instances in the specified accounts and Regions. When specifying parameters and their values, be aware of how AWS CloudFormation sets parameter values during stack instance update operations:</p><ul><li><p>To override the current value for a parameter, include the parameter and specify its value.</p></li><li><p>To leave a parameter set to its present value, you can do one of the following:</p><ul><li><p>Do not include the parameter in the list.</p></li><li><p>Include the parameter and specify <code>UsePreviousValue</code> as <code>true</code>. (You cannot specify both a value and set <code>UsePreviousValue</code> to <code>true</code>.)</p></li></ul></li><li><p>To set all overridden parameter back to the values specified in the stack set, specify a parameter list but do not include any parameters.</p></li><li><p>To leave all parameters set to their present values, do not specify this property at all.</p></li></ul><p>During stack set updates, any parameter values overridden for a stack instance are not updated, but retain their overridden value.</p><p>You can only override the parameter <i>values</i> that are specified in the stack set; to add or delete a parameter itself, use <code>UpdateStackSet</code> to update the stack set template. If you add a parameter to a template, before you can override the parameter value specified in the stack set you must first use <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html">UpdateStackSet</a> to update all stack instances with the updated template and parameter value specified in the stack set. Once a stack instance has been updated with the new parameter, you can then override the parameter value using <code>UpdateStackInstances</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationParameter *> * _Nullable parameterOverrides;

/**
 <p>The names of one or more Regions in which you want to update parameter values for stack instances. The overridden parameter values will be applied to all stack instances in the specified accounts and Regions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable regions;

/**
 <p>The name or unique ID of the stack set associated with the stack instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

@end

/**
 
 */
@interface AWSCloudformationUpdateStackInstancesOutput : AWSModel


/**
 <p>The unique identifier for this stack set operation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>The output for an <a>UpdateStack</a> action.</p>
 */
@interface AWSCloudformationUpdateStackOutput : AWSModel


/**
 <p>Unique identifier of the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

@end

/**
 
 */
@interface AWSCloudformationUpdateStackSetInput : AWSRequest


/**
 <p>[<code>Self-managed</code> permissions] The accounts in which to update associated stack instances. If you specify accounts, you must also specify the Regions in which to update stack set instances.</p><p>To update <i>all</i> the stack instances associated with this stack set, do not specify the <code>Accounts</code> or <code>Regions</code> properties.</p><p>If the stack set update includes changes to the template (that is, if the <code>TemplateBody</code> or <code>TemplateURL</code> properties are specified), or the <code>Parameters</code> property, AWS CloudFormation marks all stack instances with a status of <code>OUTDATED</code> prior to updating the stack instances in the specified accounts and Regions. If the stack set update does not include changes to the template or parameters, AWS CloudFormation updates the stack instances in the specified accounts and Regions, while leaving all other stack instances with their existing stack instance status. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accounts;

/**
 <p>The Amazon Resource Number (ARN) of the IAM role to use to update this stack set.</p><p>Specify an IAM role only if you are using customized administrator roles to control which users or groups can manage specific stack sets within the same administrator account. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html">Granting Permissions for Stack Set Operations</a> in the <i>AWS CloudFormation User Guide</i>.</p><p>If you specified a customized administrator role when you created the stack set, you must specify a customized administrator role, even if it is the same customized administrator role used with this stack set previously.</p>
 */
@property (nonatomic, strong) NSString * _Nullable administrationRoleARN;

/**
 <p>[<code>Service-managed</code> permissions] Describes whether StackSets automatically deploys to AWS Organizations accounts that are added to a target organization or organizational unit (OU).</p><p>If you specify <code>AutoDeployment</code>, do not specify <code>DeploymentTargets</code> or <code>Regions</code>.</p>
 */
@property (nonatomic, strong) AWSCloudformationAutoDeployment * _Nullable autoDeployment;

/**
 <p>In some cases, you must explicitly acknowledge that your stack template contains certain capabilities in order for AWS CloudFormation to update the stack set and its associated stack instances.</p><ul><li><p><code>CAPABILITY_IAM</code> and <code>CAPABILITY_NAMED_IAM</code></p><p>Some stack templates might include resources that can affect permissions in your AWS account; for example, by creating new AWS Identity and Access Management (IAM) users. For those stacks sets, you must explicitly acknowledge this by specifying one of these capabilities.</p><p>The following IAM resources require you to specify either the <code>CAPABILITY_IAM</code> or <code>CAPABILITY_NAMED_IAM</code> capability.</p><ul><li><p>If you have IAM resources, you can specify either capability. </p></li><li><p>If you have IAM resources with custom names, you <i>must</i> specify <code>CAPABILITY_NAMED_IAM</code>. </p></li><li><p>If you don't specify either of these capabilities, AWS CloudFormation returns an <code>InsufficientCapabilities</code> error.</p></li></ul><p>If your stack template contains these resources, we recommend that you review all permissions associated with them and edit their permissions if necessary.</p><ul><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-accesskey.html"> AWS::IAM::AccessKey</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html"> AWS::IAM::Group</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html"> AWS::IAM::InstanceProfile</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-policy.html"> AWS::IAM::Policy</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html"> AWS::IAM::Role</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-user.html"> AWS::IAM::User</a></p></li><li><p><a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-addusertogroup.html"> AWS::IAM::UserToGroupAddition</a></p></li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p></li><li><p><code>CAPABILITY_AUTO_EXPAND</code></p><p>Some templates contain macros. If your stack template contains one or more macros, and you choose to update a stack directly from the processed template, without first reviewing the resulting changes in a change set, you must acknowledge this capability. For more information, see <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html">Using AWS CloudFormation Macros to Perform Custom Processing on Templates</a>.</p><important><p>Stack sets do not currently support macros in stack templates. (This includes the <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html">AWS::Include</a> and <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/transform-aws-serverless.html">AWS::Serverless</a> transforms, which are macros hosted by AWS CloudFormation.) Even if you specify this capability, if you include a macro in your template the stack set operation will fail.</p></important></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable capabilities;

/**
 <p>[<code>Service-managed</code> permissions] The AWS Organizations accounts in which to update associated stack instances.</p><p>To update all the stack instances associated with this stack set, do not specify <code>DeploymentTargets</code> or <code>Regions</code>.</p><p>If the stack set update includes changes to the template (that is, if <code>TemplateBody</code> or <code>TemplateURL</code> is specified), or the <code>Parameters</code>, AWS CloudFormation marks all stack instances with a status of <code>OUTDATED</code> prior to updating the stack instances in the specified accounts and Regions. If the stack set update does not include changes to the template or parameters, AWS CloudFormation updates the stack instances in the specified accounts and Regions, while leaving all other stack instances with their existing stack instance status.</p>
 */
@property (nonatomic, strong) AWSCloudformationDeploymentTargets * _Nullable deploymentTargets;

/**
 <p>A brief description of updates that you are making.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the IAM execution role to use to update the stack set. If you do not specify an execution role, AWS CloudFormation uses the <code>AWSCloudFormationStackSetExecutionRole</code> role for the stack set operation.</p><p>Specify an IAM role only if you are using customized execution roles to control which stack resources users and groups can include in their stack sets. </p><p> If you specify a customized execution role, AWS CloudFormation uses that role to update the stack. If you do not specify a customized execution role, AWS CloudFormation performs the update using the role previously associated with the stack set, so long as you have permissions to perform operations on the stack set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleName;

/**
 <p>The unique ID for this stack set operation. </p><p>The operation ID also functions as an idempotency token, to ensure that AWS CloudFormation performs the stack set operation only once, even if you retry the request multiple times. You might retry stack set operation requests to ensure that AWS CloudFormation successfully received them.</p><p>If you don't specify an operation ID, AWS CloudFormation generates one automatically.</p><p>Repeating this stack set operation with a new operation ID retries all stack instances whose status is <code>OUTDATED</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

/**
 <p>Preferences for how AWS CloudFormation performs this stack set operation.</p>
 */
@property (nonatomic, strong) AWSCloudformationStackSetOperationPreferences * _Nullable operationPreferences;

/**
 <p>A list of input parameters for the stack set template. </p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationParameter *> * _Nullable parameters;

/**
 <p>Describes how the IAM roles required for stack set operations are created. You cannot modify <code>PermissionModel</code> if there are stack instances associated with your stack set.</p><ul><li><p>With <code>self-managed</code> permissions, you must create the administrator and execution roles required to deploy to target accounts. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-self-managed.html">Grant Self-Managed Stack Set Permissions</a>.</p></li><li><p>With <code>service-managed</code> permissions, StackSets automatically creates the IAM roles required to deploy to accounts managed by AWS Organizations. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs-service-managed.html">Grant Service-Managed Stack Set Permissions</a>.</p></li></ul>
 */
@property (nonatomic, assign) AWSCloudformationPermissionModels permissionModel;

/**
 <p>The Regions in which to update associated stack instances. If you specify Regions, you must also specify accounts in which to update stack set instances.</p><p>To update <i>all</i> the stack instances associated with this stack set, do not specify the <code>Accounts</code> or <code>Regions</code> properties.</p><p>If the stack set update includes changes to the template (that is, if the <code>TemplateBody</code> or <code>TemplateURL</code> properties are specified), or the <code>Parameters</code> property, AWS CloudFormation marks all stack instances with a status of <code>OUTDATED</code> prior to updating the stack instances in the specified accounts and Regions. If the stack set update does not include changes to the template or parameters, AWS CloudFormation updates the stack instances in the specified accounts and Regions, while leaving all other stack instances with their existing stack instance status. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable regions;

/**
 <p>The name or unique ID of the stack set that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackSetName;

/**
 <p>The key-value pairs to associate with this stack set and the stacks created from it. AWS CloudFormation also propagates these tags to supported resources that are created in the stacks. You can specify a maximum number of 50 tags.</p><p>If you specify tags for this parameter, those tags replace any list of tags that are currently associated with this stack set. This means:</p><ul><li><p>If you don't specify this parameter, AWS CloudFormation doesn't modify the stack's tags. </p></li><li><p>If you specify <i>any</i> tags using this parameter, you must specify <i>all</i> the tags that you want associated with this stack set, even tags you've specifed before (for example, when creating the stack set or during a previous update of the stack set.). Any tags that you don't include in the updated list of tags are removed from the stack set, and therefore from the stacks and resources as well. </p></li><li><p>If you specify an empty value, AWS CloudFormation removes all currently associated tags.</p></li></ul><p>If you specify new tags as part of an <code>UpdateStackSet</code> action, AWS CloudFormation checks to see if you have the required IAM permission to tag resources. If you omit tags that are currently associated with the stack set from the list of tags you specify, AWS CloudFormation assumes that you want to remove those tags from the stack set, and checks to see if you have permission to untag resources. If you don't have the necessary permission(s), the entire <code>UpdateStackSet</code> action fails with an <code>access denied</code> error, and the stack set is not updated.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationTag *> * _Nullable tags;

/**
 <p>The structure that contains the template body, with a minimum length of 1 byte and a maximum length of 51,200 bytes. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.</p><p>Conditional: You must specify only one of the following parameters: <code>TemplateBody</code> or <code>TemplateURL</code>—or set <code>UsePreviousTemplate</code> to true.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

/**
 <p>The location of the file that contains the template body. The URL must point to a template (maximum size: 460,800 bytes) that is located in an Amazon S3 bucket. For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.</p><p>Conditional: You must specify only one of the following parameters: <code>TemplateBody</code> or <code>TemplateURL</code>—or set <code>UsePreviousTemplate</code> to true. </p>
 */
@property (nonatomic, strong) NSString * _Nullable templateURL;

/**
 <p>Use the existing template that's associated with the stack set that you're updating.</p><p>Conditional: You must specify only one of the following parameters: <code>TemplateBody</code> or <code>TemplateURL</code>—or set <code>UsePreviousTemplate</code> to true. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usePreviousTemplate;

@end

/**
 
 */
@interface AWSCloudformationUpdateStackSetOutput : AWSModel


/**
 <p>The unique ID for this stack set operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 
 */
@interface AWSCloudformationUpdateTerminationProtectionInput : AWSRequest


/**
 <p>Whether to enable termination protection on the specified stack.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableTerminationProtection;

/**
 <p>The name or unique ID of the stack for which you want to set termination protection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackName;

@end

/**
 
 */
@interface AWSCloudformationUpdateTerminationProtectionOutput : AWSModel


/**
 <p>The unique ID of the stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stackId;

@end

/**
 <p>The input for <a>ValidateTemplate</a> action.</p>
 */
@interface AWSCloudformationValidateTemplateInput : AWSRequest


/**
 <p>Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes. For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.</p><p>Conditional: You must pass <code>TemplateURL</code> or <code>TemplateBody</code>. If both are passed, only <code>TemplateBody</code> is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateBody;

/**
 <p>Location of file containing the template body. The URL must point to a template (max size: 460,800 bytes) that is located in an Amazon S3 bucket. For more information, go to <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html">Template Anatomy</a> in the AWS CloudFormation User Guide.</p><p>Conditional: You must pass <code>TemplateURL</code> or <code>TemplateBody</code>. If both are passed, only <code>TemplateBody</code> is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable templateURL;

@end

/**
 <p>The output for <a>ValidateTemplate</a> action.</p>
 */
@interface AWSCloudformationValidateTemplateOutput : AWSModel


/**
 <p>The capabilities found within the template. If your template contains IAM resources, you must specify the CAPABILITY_IAM or CAPABILITY_NAMED_IAM value for this parameter when you use the <a>CreateStack</a> or <a>UpdateStack</a> actions with your template; otherwise, those actions return an InsufficientCapabilities error.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html#capabilities">Acknowledging IAM Resources in AWS CloudFormation Templates</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable capabilities;

/**
 <p>The list of resources that generated the values in the <code>Capabilities</code> response element.</p>
 */
@property (nonatomic, strong) NSString * _Nullable capabilitiesReason;

/**
 <p>A list of the transforms that are declared in the template.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable declaredTransforms;

/**
 <p>The description found within the template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A list of <code>TemplateParameter</code> structures.</p>
 */
@property (nonatomic, strong) NSArray<AWSCloudformationTemplateParameter *> * _Nullable parameters;

@end

NS_ASSUME_NONNULL_END
