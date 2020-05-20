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

FOUNDATION_EXPORT NSString *const AWSCodedeployErrorDomain;

typedef NS_ENUM(NSInteger, AWSCodedeployErrorType) {
    AWSCodedeployErrorUnknown,
    AWSCodedeployErrorAlarmsLimitExceeded,
    AWSCodedeployErrorApplicationAlreadyExists,
    AWSCodedeployErrorApplicationDoesNotExist,
    AWSCodedeployErrorApplicationLimitExceeded,
    AWSCodedeployErrorApplicationNameRequired,
    AWSCodedeployErrorArnNotSupported,
    AWSCodedeployErrorBatchLimitExceeded,
    AWSCodedeployErrorBucketNameFilterRequired,
    AWSCodedeployErrorDeploymentAlreadyCompleted,
    AWSCodedeployErrorDeploymentAlreadyStarted,
    AWSCodedeployErrorDeploymentConfigAlreadyExists,
    AWSCodedeployErrorDeploymentConfigDoesNotExist,
    AWSCodedeployErrorDeploymentConfigInUse,
    AWSCodedeployErrorDeploymentConfigLimitExceeded,
    AWSCodedeployErrorDeploymentConfigNameRequired,
    AWSCodedeployErrorDeploymentDoesNotExist,
    AWSCodedeployErrorDeploymentGroupAlreadyExists,
    AWSCodedeployErrorDeploymentGroupDoesNotExist,
    AWSCodedeployErrorDeploymentGroupLimitExceeded,
    AWSCodedeployErrorDeploymentGroupNameRequired,
    AWSCodedeployErrorDeploymentIdRequired,
    AWSCodedeployErrorDeploymentIsNotInReadyState,
    AWSCodedeployErrorDeploymentLimitExceeded,
    AWSCodedeployErrorDeploymentNotStarted,
    AWSCodedeployErrorDeploymentTargetDoesNotExist,
    AWSCodedeployErrorDeploymentTargetIdRequired,
    AWSCodedeployErrorDeploymentTargetListSizeExceeded,
    AWSCodedeployErrorDescriptionTooLong,
    AWSCodedeployErrorECSServiceMappingLimitExceeded,
    AWSCodedeployErrorGitHubAccountTokenDoesNotExist,
    AWSCodedeployErrorGitHubAccountTokenNameRequired,
    AWSCodedeployErrorIamArnRequired,
    AWSCodedeployErrorIamSessionArnAlreadyRegistered,
    AWSCodedeployErrorIamUserArnAlreadyRegistered,
    AWSCodedeployErrorIamUserArnRequired,
    AWSCodedeployErrorInstanceDoesNotExist,
    AWSCodedeployErrorInstanceIdRequired,
    AWSCodedeployErrorInstanceLimitExceeded,
    AWSCodedeployErrorInstanceNameAlreadyRegistered,
    AWSCodedeployErrorInstanceNameRequired,
    AWSCodedeployErrorInstanceNotRegistered,
    AWSCodedeployErrorInvalidAlarmConfig,
    AWSCodedeployErrorInvalidApplicationName,
    AWSCodedeployErrorInvalidArn,
    AWSCodedeployErrorInvalidAutoRollbackConfig,
    AWSCodedeployErrorInvalidAutoScalingGroup,
    AWSCodedeployErrorInvalidBlueGreenDeploymentConfiguration,
    AWSCodedeployErrorInvalidBucketNameFilter,
    AWSCodedeployErrorInvalidComputePlatform,
    AWSCodedeployErrorInvalidDeployedStateFilter,
    AWSCodedeployErrorInvalidDeploymentConfigId,
    AWSCodedeployErrorInvalidDeploymentConfigName,
    AWSCodedeployErrorInvalidDeploymentGroupName,
    AWSCodedeployErrorInvalidDeploymentId,
    AWSCodedeployErrorInvalidDeploymentInstanceType,
    AWSCodedeployErrorInvalidDeploymentStatus,
    AWSCodedeployErrorInvalidDeploymentStyle,
    AWSCodedeployErrorInvalidDeploymentTargetId,
    AWSCodedeployErrorInvalidDeploymentWaitType,
    AWSCodedeployErrorInvalidEC2TagCombination,
    AWSCodedeployErrorInvalidEC2Tag,
    AWSCodedeployErrorInvalidECSService,
    AWSCodedeployErrorInvalidExternalId,
    AWSCodedeployErrorInvalidFileExistsBehavior,
    AWSCodedeployErrorInvalidGitHubAccountToken,
    AWSCodedeployErrorInvalidGitHubAccountTokenName,
    AWSCodedeployErrorInvalidIamSessionArn,
    AWSCodedeployErrorInvalidIamUserArn,
    AWSCodedeployErrorInvalidIgnoreApplicationStopFailuresValue,
    AWSCodedeployErrorInvalidInput,
    AWSCodedeployErrorInvalidInstanceId,
    AWSCodedeployErrorInvalidInstanceName,
    AWSCodedeployErrorInvalidInstanceStatus,
    AWSCodedeployErrorInvalidInstanceType,
    AWSCodedeployErrorInvalidKeyPrefixFilter,
    AWSCodedeployErrorInvalidLifecycleEventHookExecutionId,
    AWSCodedeployErrorInvalidLifecycleEventHookExecutionStatus,
    AWSCodedeployErrorInvalidLoadBalancerInfo,
    AWSCodedeployErrorInvalidMinimumHealthyHostValue,
    AWSCodedeployErrorInvalidNextToken,
    AWSCodedeployErrorInvalidOnPremisesTagCombination,
    AWSCodedeployErrorInvalidOperation,
    AWSCodedeployErrorInvalidRegistrationStatus,
    AWSCodedeployErrorInvalidRevision,
    AWSCodedeployErrorInvalidRole,
    AWSCodedeployErrorInvalidSortBy,
    AWSCodedeployErrorInvalidSortOrder,
    AWSCodedeployErrorInvalidTag,
    AWSCodedeployErrorInvalidTagFilter,
    AWSCodedeployErrorInvalidTagsToAdd,
    AWSCodedeployErrorInvalidTarget,
    AWSCodedeployErrorInvalidTargetFilterName,
    AWSCodedeployErrorInvalidTargetGroupPair,
    AWSCodedeployErrorInvalidTargetInstances,
    AWSCodedeployErrorInvalidTimeRange,
    AWSCodedeployErrorInvalidTrafficRoutingConfiguration,
    AWSCodedeployErrorInvalidTriggerConfig,
    AWSCodedeployErrorInvalidUpdateOutdatedInstancesOnlyValue,
    AWSCodedeployErrorLifecycleEventAlreadyCompleted,
    AWSCodedeployErrorLifecycleHookLimitExceeded,
    AWSCodedeployErrorMultipleIamArnsProvided,
    AWSCodedeployErrorOperationNotSupported,
    AWSCodedeployErrorResourceArnRequired,
    AWSCodedeployErrorResourceValidation,
    AWSCodedeployErrorRevisionDoesNotExist,
    AWSCodedeployErrorRevisionRequired,
    AWSCodedeployErrorRoleRequired,
    AWSCodedeployErrorTagLimitExceeded,
    AWSCodedeployErrorTagRequired,
    AWSCodedeployErrorTagSetListLimitExceeded,
    AWSCodedeployErrorThrottling,
    AWSCodedeployErrorTriggerTargetsLimitExceeded,
    AWSCodedeployErrorUnsupportedActionForDeploymentType,
};

typedef NS_ENUM(NSInteger, AWSCodedeployApplicationRevisionSortBy) {
    AWSCodedeployApplicationRevisionSortByUnknown,
    AWSCodedeployApplicationRevisionSortByRegisterTime,
    AWSCodedeployApplicationRevisionSortByFirstUsedTime,
    AWSCodedeployApplicationRevisionSortByLastUsedTime,
};

typedef NS_ENUM(NSInteger, AWSCodedeployAutoRollbackEvent) {
    AWSCodedeployAutoRollbackEventUnknown,
    AWSCodedeployAutoRollbackEventDeploymentFailure,
    AWSCodedeployAutoRollbackEventDeploymentStopOnAlarm,
    AWSCodedeployAutoRollbackEventDeploymentStopOnRequest,
};

typedef NS_ENUM(NSInteger, AWSCodedeployBundleType) {
    AWSCodedeployBundleTypeUnknown,
    AWSCodedeployBundleTypeTar,
    AWSCodedeployBundleTypeTgz,
    AWSCodedeployBundleTypeZip,
    AWSCodedeployBundleTypeYaml,
    AWSCodedeployBundleTypeJson,
};

typedef NS_ENUM(NSInteger, AWSCodedeployComputePlatform) {
    AWSCodedeployComputePlatformUnknown,
    AWSCodedeployComputePlatformServer,
    AWSCodedeployComputePlatformLambda,
    AWSCodedeployComputePlatformEcs,
};

typedef NS_ENUM(NSInteger, AWSCodedeployDeploymentCreator) {
    AWSCodedeployDeploymentCreatorUnknown,
    AWSCodedeployDeploymentCreatorUser,
    AWSCodedeployDeploymentCreatorAutoscaling,
    AWSCodedeployDeploymentCreatorCodeDeployRollback,
    AWSCodedeployDeploymentCreatorCodeDeploy,
    AWSCodedeployDeploymentCreatorCloudFormation,
    AWSCodedeployDeploymentCreatorCloudFormationRollback,
};

typedef NS_ENUM(NSInteger, AWSCodedeployDeploymentOption) {
    AWSCodedeployDeploymentOptionUnknown,
    AWSCodedeployDeploymentOptionWithTrafficControl,
    AWSCodedeployDeploymentOptionWithoutTrafficControl,
};

typedef NS_ENUM(NSInteger, AWSCodedeployDeploymentReadyAction) {
    AWSCodedeployDeploymentReadyActionUnknown,
    AWSCodedeployDeploymentReadyActionContinueDeployment,
    AWSCodedeployDeploymentReadyActionStopDeployment,
};

typedef NS_ENUM(NSInteger, AWSCodedeployDeploymentStatus) {
    AWSCodedeployDeploymentStatusUnknown,
    AWSCodedeployDeploymentStatusCreated,
    AWSCodedeployDeploymentStatusQueued,
    AWSCodedeployDeploymentStatusInProgress,
    AWSCodedeployDeploymentStatusBaking,
    AWSCodedeployDeploymentStatusSucceeded,
    AWSCodedeployDeploymentStatusFailed,
    AWSCodedeployDeploymentStatusStopped,
    AWSCodedeployDeploymentStatusReady,
};

typedef NS_ENUM(NSInteger, AWSCodedeployDeploymentTargetType) {
    AWSCodedeployDeploymentTargetTypeUnknown,
    AWSCodedeployDeploymentTargetTypeInstanceTarget,
    AWSCodedeployDeploymentTargetTypeLambdaTarget,
    AWSCodedeployDeploymentTargetTypeECSTarget,
    AWSCodedeployDeploymentTargetTypeCloudFormationTarget,
};

typedef NS_ENUM(NSInteger, AWSCodedeployDeploymentType) {
    AWSCodedeployDeploymentTypeUnknown,
    AWSCodedeployDeploymentTypeInPlace,
    AWSCodedeployDeploymentTypeBlueGreen,
};

typedef NS_ENUM(NSInteger, AWSCodedeployDeploymentWaitType) {
    AWSCodedeployDeploymentWaitTypeUnknown,
    AWSCodedeployDeploymentWaitTypeReadyWait,
    AWSCodedeployDeploymentWaitTypeTerminationWait,
};

typedef NS_ENUM(NSInteger, AWSCodedeployEC2TagFilterType) {
    AWSCodedeployEC2TagFilterTypeUnknown,
    AWSCodedeployEC2TagFilterTypeKeyOnly,
    AWSCodedeployEC2TagFilterTypeValueOnly,
    AWSCodedeployEC2TagFilterTypeKeyAndValue,
};

typedef NS_ENUM(NSInteger, AWSCodedeployErrorCode) {
    AWSCodedeployErrorCodeUnknown,
    AWSCodedeployErrorCodeAgentIssue,
    AWSCodedeployErrorCodeAlarmActive,
    AWSCodedeployErrorCodeApplicationMissing,
    AWSCodedeployErrorCodeAutoscalingValidationError,
    AWSCodedeployErrorCodeAutoScalingConfiguration,
    AWSCodedeployErrorCodeAutoScalingIamRolePermissions,
    AWSCodedeployErrorCodeCodedeployResourceCannotBeFound,
    AWSCodedeployErrorCodeCustomerApplicationUnhealthy,
    AWSCodedeployErrorCodeDeploymentGroupMissing,
    AWSCodedeployErrorCodeEcsUpdateError,
    AWSCodedeployErrorCodeElasticLoadBalancingInvalid,
    AWSCodedeployErrorCodeElbInvalidInstance,
    AWSCodedeployErrorCodeHealthConstraints,
    AWSCodedeployErrorCodeHealthConstraintsInvalid,
    AWSCodedeployErrorCodeHookExecutionFailure,
    AWSCodedeployErrorCodeIamRoleMissing,
    AWSCodedeployErrorCodeIamRolePermissions,
    AWSCodedeployErrorCodeInternalError,
    AWSCodedeployErrorCodeInvalidEcsService,
    AWSCodedeployErrorCodeInvalidLambdaConfiguration,
    AWSCodedeployErrorCodeInvalidLambdaFunction,
    AWSCodedeployErrorCodeInvalidRevision,
    AWSCodedeployErrorCodeManualStop,
    AWSCodedeployErrorCodeMissingBlueGreenDeploymentConfiguration,
    AWSCodedeployErrorCodeMissingElbInformation,
    AWSCodedeployErrorCodeMissingGithubToken,
    AWSCodedeployErrorCodeNoEc2Subscription,
    AWSCodedeployErrorCodeNoInstances,
    AWSCodedeployErrorCodeOverMaxInstances,
    AWSCodedeployErrorCodeResourceLimitExceeded,
    AWSCodedeployErrorCodeRevisionMissing,
    AWSCodedeployErrorCodeThrottled,
    AWSCodedeployErrorCodeTimeout,
    AWSCodedeployErrorCodeCloudformationStackFailure,
};

typedef NS_ENUM(NSInteger, AWSCodedeployFileExistsBehavior) {
    AWSCodedeployFileExistsBehaviorUnknown,
    AWSCodedeployFileExistsBehaviorDisallow,
    AWSCodedeployFileExistsBehaviorOverwrite,
    AWSCodedeployFileExistsBehaviorRetain,
};

typedef NS_ENUM(NSInteger, AWSCodedeployGreenFleetProvisioningAction) {
    AWSCodedeployGreenFleetProvisioningActionUnknown,
    AWSCodedeployGreenFleetProvisioningActionDiscoverExisting,
    AWSCodedeployGreenFleetProvisioningActionCopyAutoScalingGroup,
};

typedef NS_ENUM(NSInteger, AWSCodedeployInstanceAction) {
    AWSCodedeployInstanceActionUnknown,
    AWSCodedeployInstanceActionTerminate,
    AWSCodedeployInstanceActionKeepAlive,
};

typedef NS_ENUM(NSInteger, AWSCodedeployInstanceStatus) {
    AWSCodedeployInstanceStatusUnknown,
    AWSCodedeployInstanceStatusPending,
    AWSCodedeployInstanceStatusInProgress,
    AWSCodedeployInstanceStatusSucceeded,
    AWSCodedeployInstanceStatusFailed,
    AWSCodedeployInstanceStatusSkipped,
    AWSCodedeployInstanceStatusReady,
};

typedef NS_ENUM(NSInteger, AWSCodedeployInstanceType) {
    AWSCodedeployInstanceTypeUnknown,
    AWSCodedeployInstanceTypeBlue,
    AWSCodedeployInstanceTypeGreen,
};

typedef NS_ENUM(NSInteger, AWSCodedeployLifecycleErrorCode) {
    AWSCodedeployLifecycleErrorCodeUnknown,
    AWSCodedeployLifecycleErrorCodeSuccess,
    AWSCodedeployLifecycleErrorCodeScriptMissing,
    AWSCodedeployLifecycleErrorCodeScriptNotExecutable,
    AWSCodedeployLifecycleErrorCodeScriptTimedOut,
    AWSCodedeployLifecycleErrorCodeScriptFailed,
    AWSCodedeployLifecycleErrorCodeUnknownError,
};

typedef NS_ENUM(NSInteger, AWSCodedeployLifecycleEventStatus) {
    AWSCodedeployLifecycleEventStatusUnknown,
    AWSCodedeployLifecycleEventStatusPending,
    AWSCodedeployLifecycleEventStatusInProgress,
    AWSCodedeployLifecycleEventStatusSucceeded,
    AWSCodedeployLifecycleEventStatusFailed,
    AWSCodedeployLifecycleEventStatusSkipped,
};

typedef NS_ENUM(NSInteger, AWSCodedeployListStateFilterAction) {
    AWSCodedeployListStateFilterActionUnknown,
    AWSCodedeployListStateFilterActionInclude,
    AWSCodedeployListStateFilterActionExclude,
    AWSCodedeployListStateFilterActionIgnore,
};

typedef NS_ENUM(NSInteger, AWSCodedeployMinimumHealthyHostsType) {
    AWSCodedeployMinimumHealthyHostsTypeUnknown,
    AWSCodedeployMinimumHealthyHostsTypeHostCount,
    AWSCodedeployMinimumHealthyHostsTypeFleetPercent,
};

typedef NS_ENUM(NSInteger, AWSCodedeployRegistrationStatus) {
    AWSCodedeployRegistrationStatusUnknown,
    AWSCodedeployRegistrationStatusRegistered,
    AWSCodedeployRegistrationStatusDeregistered,
};

typedef NS_ENUM(NSInteger, AWSCodedeployRevisionLocationType) {
    AWSCodedeployRevisionLocationTypeUnknown,
    AWSCodedeployRevisionLocationTypeS3,
    AWSCodedeployRevisionLocationTypeGitHub,
    AWSCodedeployRevisionLocationTypeString,
    AWSCodedeployRevisionLocationTypeAppSpecContent,
};

typedef NS_ENUM(NSInteger, AWSCodedeploySortOrder) {
    AWSCodedeploySortOrderUnknown,
    AWSCodedeploySortOrderAscending,
    AWSCodedeploySortOrderDescending,
};

typedef NS_ENUM(NSInteger, AWSCodedeployStopStatus) {
    AWSCodedeployStopStatusUnknown,
    AWSCodedeployStopStatusPending,
    AWSCodedeployStopStatusSucceeded,
};

typedef NS_ENUM(NSInteger, AWSCodedeployTagFilterType) {
    AWSCodedeployTagFilterTypeUnknown,
    AWSCodedeployTagFilterTypeKeyOnly,
    AWSCodedeployTagFilterTypeValueOnly,
    AWSCodedeployTagFilterTypeKeyAndValue,
};

typedef NS_ENUM(NSInteger, AWSCodedeployTargetFilterName) {
    AWSCodedeployTargetFilterNameUnknown,
    AWSCodedeployTargetFilterNameTargetStatus,
    AWSCodedeployTargetFilterNameServerInstanceLabel,
};

typedef NS_ENUM(NSInteger, AWSCodedeployTargetLabel) {
    AWSCodedeployTargetLabelUnknown,
    AWSCodedeployTargetLabelBlue,
    AWSCodedeployTargetLabelGreen,
};

typedef NS_ENUM(NSInteger, AWSCodedeployTargetStatus) {
    AWSCodedeployTargetStatusUnknown,
    AWSCodedeployTargetStatusPending,
    AWSCodedeployTargetStatusInProgress,
    AWSCodedeployTargetStatusSucceeded,
    AWSCodedeployTargetStatusFailed,
    AWSCodedeployTargetStatusSkipped,
    AWSCodedeployTargetStatusReady,
};

typedef NS_ENUM(NSInteger, AWSCodedeployTrafficRoutingType) {
    AWSCodedeployTrafficRoutingTypeUnknown,
    AWSCodedeployTrafficRoutingTypeTimeBasedCanary,
    AWSCodedeployTrafficRoutingTypeTimeBasedLinear,
    AWSCodedeployTrafficRoutingTypeAllAtOnce,
};

typedef NS_ENUM(NSInteger, AWSCodedeployTriggerEventType) {
    AWSCodedeployTriggerEventTypeUnknown,
    AWSCodedeployTriggerEventTypeDeploymentStart,
    AWSCodedeployTriggerEventTypeDeploymentSuccess,
    AWSCodedeployTriggerEventTypeDeploymentFailure,
    AWSCodedeployTriggerEventTypeDeploymentStop,
    AWSCodedeployTriggerEventTypeDeploymentRollback,
    AWSCodedeployTriggerEventTypeDeploymentReady,
    AWSCodedeployTriggerEventTypeInstanceStart,
    AWSCodedeployTriggerEventTypeInstanceSuccess,
    AWSCodedeployTriggerEventTypeInstanceFailure,
    AWSCodedeployTriggerEventTypeInstanceReady,
};

@class AWSCodedeployAddTagsToOnPremisesInstancesInput;
@class AWSCodedeployAlarm;
@class AWSCodedeployAlarmConfiguration;
@class AWSCodedeployAppSpecContent;
@class AWSCodedeployApplicationInfo;
@class AWSCodedeployAutoRollbackConfiguration;
@class AWSCodedeployAutoScalingGroup;
@class AWSCodedeployBatchGetApplicationRevisionsInput;
@class AWSCodedeployBatchGetApplicationRevisionsOutput;
@class AWSCodedeployBatchGetApplicationsInput;
@class AWSCodedeployBatchGetApplicationsOutput;
@class AWSCodedeployBatchGetDeploymentGroupsInput;
@class AWSCodedeployBatchGetDeploymentGroupsOutput;
@class AWSCodedeployBatchGetDeploymentInstancesInput;
@class AWSCodedeployBatchGetDeploymentInstancesOutput;
@class AWSCodedeployBatchGetDeploymentTargetsInput;
@class AWSCodedeployBatchGetDeploymentTargetsOutput;
@class AWSCodedeployBatchGetDeploymentsInput;
@class AWSCodedeployBatchGetDeploymentsOutput;
@class AWSCodedeployBatchGetOnPremisesInstancesInput;
@class AWSCodedeployBatchGetOnPremisesInstancesOutput;
@class AWSCodedeployBlueGreenDeploymentConfiguration;
@class AWSCodedeployBlueInstanceTerminationOption;
@class AWSCodedeployCloudFormationTarget;
@class AWSCodedeployContinueDeploymentInput;
@class AWSCodedeployCreateApplicationInput;
@class AWSCodedeployCreateApplicationOutput;
@class AWSCodedeployCreateDeploymentConfigInput;
@class AWSCodedeployCreateDeploymentConfigOutput;
@class AWSCodedeployCreateDeploymentGroupInput;
@class AWSCodedeployCreateDeploymentGroupOutput;
@class AWSCodedeployCreateDeploymentInput;
@class AWSCodedeployCreateDeploymentOutput;
@class AWSCodedeployDeleteApplicationInput;
@class AWSCodedeployDeleteDeploymentConfigInput;
@class AWSCodedeployDeleteDeploymentGroupInput;
@class AWSCodedeployDeleteDeploymentGroupOutput;
@class AWSCodedeployDeleteGitHubAccountTokenInput;
@class AWSCodedeployDeleteGitHubAccountTokenOutput;
@class AWSCodedeployDeleteResourcesByExternalIdInput;
@class AWSCodedeployDeleteResourcesByExternalIdOutput;
@class AWSCodedeployDeploymentConfigInfo;
@class AWSCodedeployDeploymentGroupInfo;
@class AWSCodedeployDeploymentInfo;
@class AWSCodedeployDeploymentOverview;
@class AWSCodedeployDeploymentReadyOption;
@class AWSCodedeployDeploymentStyle;
@class AWSCodedeployDeploymentTarget;
@class AWSCodedeployDeregisterOnPremisesInstanceInput;
@class AWSCodedeployDiagnostics;
@class AWSCodedeployEC2TagFilter;
@class AWSCodedeployEC2TagSet;
@class AWSCodedeployECSService;
@class AWSCodedeployECSTarget;
@class AWSCodedeployECSTaskSet;
@class AWSCodedeployELBInfo;
@class AWSCodedeployErrorInformation;
@class AWSCodedeployGenericRevisionInfo;
@class AWSCodedeployGetApplicationInput;
@class AWSCodedeployGetApplicationOutput;
@class AWSCodedeployGetApplicationRevisionInput;
@class AWSCodedeployGetApplicationRevisionOutput;
@class AWSCodedeployGetDeploymentConfigInput;
@class AWSCodedeployGetDeploymentConfigOutput;
@class AWSCodedeployGetDeploymentGroupInput;
@class AWSCodedeployGetDeploymentGroupOutput;
@class AWSCodedeployGetDeploymentInput;
@class AWSCodedeployGetDeploymentInstanceInput;
@class AWSCodedeployGetDeploymentInstanceOutput;
@class AWSCodedeployGetDeploymentOutput;
@class AWSCodedeployGetDeploymentTargetInput;
@class AWSCodedeployGetDeploymentTargetOutput;
@class AWSCodedeployGetOnPremisesInstanceInput;
@class AWSCodedeployGetOnPremisesInstanceOutput;
@class AWSCodedeployGitHubLocation;
@class AWSCodedeployGreenFleetProvisioningOption;
@class AWSCodedeployInstanceInfo;
@class AWSCodedeployInstanceSummary;
@class AWSCodedeployInstanceTarget;
@class AWSCodedeployLambdaFunctionInfo;
@class AWSCodedeployLambdaTarget;
@class AWSCodedeployLastDeploymentInfo;
@class AWSCodedeployLifecycleEvent;
@class AWSCodedeployListApplicationRevisionsInput;
@class AWSCodedeployListApplicationRevisionsOutput;
@class AWSCodedeployListApplicationsInput;
@class AWSCodedeployListApplicationsOutput;
@class AWSCodedeployListDeploymentConfigsInput;
@class AWSCodedeployListDeploymentConfigsOutput;
@class AWSCodedeployListDeploymentGroupsInput;
@class AWSCodedeployListDeploymentGroupsOutput;
@class AWSCodedeployListDeploymentInstancesInput;
@class AWSCodedeployListDeploymentInstancesOutput;
@class AWSCodedeployListDeploymentTargetsInput;
@class AWSCodedeployListDeploymentTargetsOutput;
@class AWSCodedeployListDeploymentsInput;
@class AWSCodedeployListDeploymentsOutput;
@class AWSCodedeployListGitHubAccountTokenNamesInput;
@class AWSCodedeployListGitHubAccountTokenNamesOutput;
@class AWSCodedeployListOnPremisesInstancesInput;
@class AWSCodedeployListOnPremisesInstancesOutput;
@class AWSCodedeployListTagsForResourceInput;
@class AWSCodedeployListTagsForResourceOutput;
@class AWSCodedeployLoadBalancerInfo;
@class AWSCodedeployMinimumHealthyHosts;
@class AWSCodedeployOnPremisesTagSet;
@class AWSCodedeployPutLifecycleEventHookExecutionStatusInput;
@class AWSCodedeployPutLifecycleEventHookExecutionStatusOutput;
@class AWSCodedeployRawString;
@class AWSCodedeployRegisterApplicationRevisionInput;
@class AWSCodedeployRegisterOnPremisesInstanceInput;
@class AWSCodedeployRemoveTagsFromOnPremisesInstancesInput;
@class AWSCodedeployRevisionInfo;
@class AWSCodedeployRevisionLocation;
@class AWSCodedeployRollbackInfo;
@class AWSCodedeployS3Location;
@class AWSCodedeploySkipWaitTimeForInstanceTerminationInput;
@class AWSCodedeployStopDeploymentInput;
@class AWSCodedeployStopDeploymentOutput;
@class AWSCodedeployTag;
@class AWSCodedeployTagFilter;
@class AWSCodedeployTagResourceInput;
@class AWSCodedeployTagResourceOutput;
@class AWSCodedeployTargetGroupInfo;
@class AWSCodedeployTargetGroupPairInfo;
@class AWSCodedeployTargetInstances;
@class AWSCodedeployTimeBasedCanary;
@class AWSCodedeployTimeBasedLinear;
@class AWSCodedeployTimeRange;
@class AWSCodedeployTrafficRoute;
@class AWSCodedeployTrafficRoutingConfig;
@class AWSCodedeployTriggerConfig;
@class AWSCodedeployUntagResourceInput;
@class AWSCodedeployUntagResourceOutput;
@class AWSCodedeployUpdateApplicationInput;
@class AWSCodedeployUpdateDeploymentGroupInput;
@class AWSCodedeployUpdateDeploymentGroupOutput;

/**
 <p>Represents the input of, and adds tags to, an on-premises instance operation.</p>
 Required parameters: [tags, instanceNames]
 */
@interface AWSCodedeployAddTagsToOnPremisesInstancesInput : AWSRequest


/**
 <p>The names of the on-premises instances to which to add tags.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceNames;

/**
 <p>The tag key-value pairs to add to the on-premises instances.</p><p>Keys and values are both required. Keys cannot be null or empty strings. Value-only tags are not allowed.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTag *> * _Nullable tags;

@end

/**
 <p>Information about an alarm.</p>
 */
@interface AWSCodedeployAlarm : AWSModel


/**
 <p>The name of the alarm. Maximum length is 255 characters. Each alarm name can be used only once in a list of alarms.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Information about alarms associated with the deployment group.</p>
 */
@interface AWSCodedeployAlarmConfiguration : AWSModel


/**
 <p>A list of alarms configured for the deployment group. A maximum of 10 alarms can be added to a deployment group.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployAlarm *> * _Nullable alarms;

/**
 <p>Indicates whether the alarm configuration is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Indicates whether a deployment should continue if information about the current state of alarms cannot be retrieved from Amazon CloudWatch. The default value is false.</p><ul><li><p><code>true</code>: The deployment proceeds even if alarm status information can't be retrieved from Amazon CloudWatch.</p></li><li><p><code>false</code>: The deployment stops if alarm status information can't be retrieved from Amazon CloudWatch.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable ignorePollAlarmFailure;

@end

/**
 <p> A revision for an AWS Lambda or Amazon ECS deployment that is a YAML-formatted or JSON-formatted string. For AWS Lambda and Amazon ECS deployments, the revision is the same as the AppSpec file. This method replaces the deprecated <code>RawString</code> data type. </p>
 */
@interface AWSCodedeployAppSpecContent : AWSModel


/**
 <p> The YAML-formatted or JSON-formatted revision string. </p><p> For an AWS Lambda deployment, the content includes a Lambda function name, the alias for its original version, and the alias for its replacement version. The deployment shifts traffic from the original version of the Lambda function to the replacement version. </p><p> For an Amazon ECS deployment, the content includes the task name, information about the load balancer that serves traffic to the container, and more. </p><p> For both types of deployments, the content can specify Lambda functions that run at specified hooks, such as <code>BeforeInstall</code>, during a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p> The SHA256 hash value of the revision content. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sha256;

@end

/**
 <p>Information about an application.</p>
 */
@interface AWSCodedeployApplicationInfo : AWSModel


/**
 <p>The application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The application name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The destination platform type for deployment of the application (<code>Lambda</code> or <code>Server</code>).</p>
 */
@property (nonatomic, assign) AWSCodedeployComputePlatform computePlatform;

/**
 <p>The time at which the application was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The name for a connection to a GitHub account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gitHubAccountName;

/**
 <p>True if the user has authenticated with GitHub for the specified application. Otherwise, false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable linkedToGitHub;

@end

/**
 <p>Information about a configuration for automatically rolling back to a previous version of an application revision when a deployment is not completed successfully.</p>
 */
@interface AWSCodedeployAutoRollbackConfiguration : AWSModel


/**
 <p>Indicates whether a defined automatic rollback configuration is currently enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The event type or types that trigger a rollback.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable events;

@end

/**
 <p>Information about an Auto Scaling group.</p>
 */
@interface AWSCodedeployAutoScalingGroup : AWSModel


/**
 <p>An Auto Scaling lifecycle event hook name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hook;

/**
 <p>The Auto Scaling group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Represents the input of a <code>BatchGetApplicationRevisions</code> operation.</p>
 Required parameters: [applicationName, revisions]
 */
@interface AWSCodedeployBatchGetApplicationRevisionsInput : AWSRequest


/**
 <p>The name of an AWS CodeDeploy application about which to get revision information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>An array of <code>RevisionLocation</code> objects that specify information to get about the application revisions, including type and location. The maximum number of <code>RevisionLocation</code> objects you can specify is 25.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployRevisionLocation *> * _Nullable revisions;

@end

/**
 <p>Represents the output of a <code>BatchGetApplicationRevisions</code> operation.</p>
 */
@interface AWSCodedeployBatchGetApplicationRevisionsOutput : AWSModel


/**
 <p>The name of the application that corresponds to the revisions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>Information about errors that might have occurred during the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>Additional information about the revisions, including the type and location.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployRevisionInfo *> * _Nullable revisions;

@end

/**
 <p>Represents the input of a <code>BatchGetApplications</code> operation.</p>
 Required parameters: [applicationNames]
 */
@interface AWSCodedeployBatchGetApplicationsInput : AWSRequest


/**
 <p>A list of application names separated by spaces. The maximum number of application names you can specify is 100.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable applicationNames;

@end

/**
 <p>Represents the output of a <code>BatchGetApplications</code> operation.</p>
 */
@interface AWSCodedeployBatchGetApplicationsOutput : AWSModel


/**
 <p>Information about the applications.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployApplicationInfo *> * _Nullable applicationsInfo;

@end

/**
 <p>Represents the input of a <code>BatchGetDeploymentGroups</code> operation.</p>
 Required parameters: [applicationName, deploymentGroupNames]
 */
@interface AWSCodedeployBatchGetDeploymentGroupsInput : AWSRequest


/**
 <p>The name of an AWS CodeDeploy application associated with the applicable IAM user or AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The names of the deployment groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deploymentGroupNames;

@end

/**
 <p>Represents the output of a <code>BatchGetDeploymentGroups</code> operation.</p>
 */
@interface AWSCodedeployBatchGetDeploymentGroupsOutput : AWSModel


/**
 <p>Information about the deployment groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployDeploymentGroupInfo *> * _Nullable deploymentGroupsInfo;

/**
 <p>Information about errors that might have occurred during the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

@end

/**
 <p> Represents the input of a <code>BatchGetDeploymentInstances</code> operation. </p>
 Required parameters: [deploymentId, instanceIds]
 */
@interface AWSCodedeployBatchGetDeploymentInstancesInput : AWSRequest


/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The unique IDs of instances used in the deployment. The maximum number of instance IDs you can specify is 25.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

@end

/**
 <p>Represents the output of a <code>BatchGetDeploymentInstances</code> operation.</p>
 */
@interface AWSCodedeployBatchGetDeploymentInstancesOutput : AWSModel


/**
 <p>Information about errors that might have occurred during the API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>Information about the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployInstanceSummary *> * _Nullable instancesSummary;

@end

/**
 
 */
@interface AWSCodedeployBatchGetDeploymentTargetsInput : AWSRequest


/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p> The unique IDs of the deployment targets. The compute platform of the deployment determines the type of the targets and their formats. The maximum number of deployment target IDs you can specify is 25.</p><ul><li><p> For deployments that use the EC2/On-premises compute platform, the target IDs are EC2 or on-premises instances IDs, and their target type is <code>instanceTarget</code>. </p></li><li><p> For deployments that use the AWS Lambda compute platform, the target IDs are the names of Lambda functions, and their target type is <code>instanceTarget</code>. </p></li><li><p> For deployments that use the Amazon ECS compute platform, the target IDs are pairs of Amazon ECS clusters and services specified using the format <code>&lt;clustername&gt;:&lt;servicename&gt;</code>. Their target type is <code>ecsTarget</code>. </p></li><li><p> For deployments that are deployed with AWS CloudFormation, the target IDs are CloudFormation stack IDs. Their target type is <code>cloudFormationTarget</code>. </p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetIds;

@end

/**
 
 */
@interface AWSCodedeployBatchGetDeploymentTargetsOutput : AWSModel


/**
 <p> A list of target objects for a deployment. Each target object contains details about the target, such as its status and lifecycle events. The type of the target objects depends on the deployment' compute platform. </p><ul><li><p><b>EC2/On-premises</b>: Each target object is an EC2 or on-premises instance. </p></li><li><p><b>AWS Lambda</b>: The target object is a specific version of an AWS Lambda function. </p></li><li><p><b>Amazon ECS</b>: The target object is an Amazon ECS service. </p></li><li><p><b>CloudFormation</b>: The target object is an AWS CloudFormation blue/green deployment. </p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployDeploymentTarget *> * _Nullable deploymentTargets;

@end

/**
 <p> Represents the input of a <code>BatchGetDeployments</code> operation. </p>
 Required parameters: [deploymentIds]
 */
@interface AWSCodedeployBatchGetDeploymentsInput : AWSRequest


/**
 <p> A list of deployment IDs, separated by spaces. The maximum number of deployment IDs you can specify is 25.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deploymentIds;

@end

/**
 <p> Represents the output of a <code>BatchGetDeployments</code> operation. </p>
 */
@interface AWSCodedeployBatchGetDeploymentsOutput : AWSModel


/**
 <p> Information about the deployments. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployDeploymentInfo *> * _Nullable deploymentsInfo;

@end

/**
 <p>Represents the input of a <code>BatchGetOnPremisesInstances</code> operation.</p>
 Required parameters: [instanceNames]
 */
@interface AWSCodedeployBatchGetOnPremisesInstancesInput : AWSRequest


/**
 <p>The names of the on-premises instances about which to get information. The maximum number of instance names you can specify is 25.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceNames;

@end

/**
 <p>Represents the output of a <code>BatchGetOnPremisesInstances</code> operation.</p>
 */
@interface AWSCodedeployBatchGetOnPremisesInstancesOutput : AWSModel


/**
 <p>Information about the on-premises instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployInstanceInfo *> * _Nullable instanceInfos;

@end

/**
 <p>Information about blue/green deployment options for a deployment group.</p>
 */
@interface AWSCodedeployBlueGreenDeploymentConfiguration : AWSModel


/**
 <p>Information about the action to take when newly provisioned instances are ready to receive traffic in a blue/green deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployDeploymentReadyOption * _Nullable deploymentReadyOption;

/**
 <p>Information about how instances are provisioned for a replacement environment in a blue/green deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployGreenFleetProvisioningOption * _Nullable greenFleetProvisioningOption;

/**
 <p>Information about whether to terminate instances in the original fleet during a blue/green deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployBlueInstanceTerminationOption * _Nullable terminateBlueInstancesOnDeploymentSuccess;

@end

/**
 <p>Information about whether instances in the original environment are terminated when a blue/green deployment is successful. <code>BlueInstanceTerminationOption</code> does not apply to Lambda deployments. </p>
 */
@interface AWSCodedeployBlueInstanceTerminationOption : AWSModel


/**
 <p>The action to take on instances in the original environment after a successful blue/green deployment.</p><ul><li><p><code>TERMINATE</code>: Instances are terminated after a specified wait time.</p></li><li><p><code>KEEP_ALIVE</code>: Instances are left running after they are deregistered from the load balancer and removed from the deployment group.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployInstanceAction action;

/**
 <p>For an Amazon EC2 deployment, the number of minutes to wait after a successful blue/green deployment before terminating instances from the original environment.</p><p> For an Amazon ECS deployment, the number of minutes before deleting the original (blue) task set. During an Amazon ECS deployment, CodeDeploy shifts traffic from the original (blue) task set to a replacement (green) task set. </p><p> The maximum setting is 2880 minutes (2 days). </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable terminationWaitTimeInMinutes;

@end

/**
 <p> Information about the target to be updated by an AWS CloudFormation blue/green deployment. This target type is used for all deployments initiated by a CloudFormation stack update.</p>
 */
@interface AWSCodedeployCloudFormationTarget : AWSModel


/**
 <p>The unique ID of an AWS CloudFormation blue/green deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p> The date and time when the target application was updated by an AWS CloudFormation blue/green deployment. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p> The lifecycle events of the AWS CloudFormation blue/green deployment to this target application. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployLifecycleEvent *> * _Nullable lifecycleEvents;

/**
 <p>The resource type for the AWS CloudFormation blue/green deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p> The status of an AWS CloudFormation blue/green deployment's target application. </p>
 */
@property (nonatomic, assign) AWSCodedeployTargetStatus status;

/**
 <p> The unique ID of a deployment target that has a type of <code>CloudFormationTarget</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetId;

/**
 <p>The percentage of production traffic that the target version of an AWS CloudFormation blue/green deployment receives.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetVersionWeight;

@end

/**
 
 */
@interface AWSCodedeployContinueDeploymentInput : AWSRequest


/**
 <p> The unique ID of a blue/green deployment for which you want to start rerouting traffic to the replacement environment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p> The status of the deployment's waiting period. <code>READY_WAIT</code> indicates that the deployment is ready to start shifting traffic. <code>TERMINATION_WAIT</code> indicates that the traffic is shifted, but the original target is not terminated. </p>
 */
@property (nonatomic, assign) AWSCodedeployDeploymentWaitType deploymentWaitType;

@end

/**
 <p>Represents the input of a <code>CreateApplication</code> operation.</p>
 Required parameters: [applicationName]
 */
@interface AWSCodedeployCreateApplicationInput : AWSRequest


/**
 <p>The name of the application. This name must be unique with the applicable IAM user or AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p> The destination platform type for the deployment (<code>Lambda</code>, <code>Server</code>, or <code>ECS</code>).</p>
 */
@property (nonatomic, assign) AWSCodedeployComputePlatform computePlatform;

/**
 <p> The metadata that you apply to CodeDeploy applications to help you organize and categorize them. Each tag consists of a key and an optional value, both of which you define. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTag *> * _Nullable tags;

@end

/**
 <p>Represents the output of a <code>CreateApplication</code> operation.</p>
 */
@interface AWSCodedeployCreateApplicationOutput : AWSModel


/**
 <p>A unique application ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

@end

/**
 <p>Represents the input of a <code>CreateDeploymentConfig</code> operation.</p>
 Required parameters: [deploymentConfigName]
 */
@interface AWSCodedeployCreateDeploymentConfigInput : AWSRequest


/**
 <p>The destination platform type for the deployment (<code>Lambda</code>, <code>Server</code>, or <code>ECS</code>).</p>
 */
@property (nonatomic, assign) AWSCodedeployComputePlatform computePlatform;

/**
 <p>The name of the deployment configuration to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentConfigName;

/**
 <p>The minimum number of healthy instances that should be available at any time during the deployment. There are two parameters expected in the input: type and value.</p><p>The type parameter takes either of the following values:</p><ul><li><p>HOST_COUNT: The value parameter represents the minimum number of healthy instances as an absolute value.</p></li><li><p>FLEET_PERCENT: The value parameter represents the minimum number of healthy instances as a percentage of the total number of instances in the deployment. If you specify FLEET_PERCENT, at the start of the deployment, AWS CodeDeploy converts the percentage to the equivalent number of instances and rounds up fractional instances.</p></li></ul><p>The value parameter takes an integer.</p><p>For example, to set a minimum of 95% healthy instance, specify a type of FLEET_PERCENT and a value of 95.</p>
 */
@property (nonatomic, strong) AWSCodedeployMinimumHealthyHosts * _Nullable minimumHealthyHosts;

/**
 <p>The configuration that specifies how the deployment traffic is routed.</p>
 */
@property (nonatomic, strong) AWSCodedeployTrafficRoutingConfig * _Nullable trafficRoutingConfig;

@end

/**
 <p>Represents the output of a <code>CreateDeploymentConfig</code> operation.</p>
 */
@interface AWSCodedeployCreateDeploymentConfigOutput : AWSModel


/**
 <p>A unique deployment configuration ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentConfigId;

@end

/**
 <p>Represents the input of a <code>CreateDeploymentGroup</code> operation.</p>
 Required parameters: [applicationName, deploymentGroupName, serviceRoleArn]
 */
@interface AWSCodedeployCreateDeploymentGroupInput : AWSRequest


/**
 <p>Information to add about Amazon CloudWatch alarms when the deployment group is created.</p>
 */
@property (nonatomic, strong) AWSCodedeployAlarmConfiguration * _Nullable alarmConfiguration;

/**
 <p>The name of an AWS CodeDeploy application associated with the IAM user or AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>Configuration information for an automatic rollback that is added when a deployment group is created.</p>
 */
@property (nonatomic, strong) AWSCodedeployAutoRollbackConfiguration * _Nullable autoRollbackConfiguration;

/**
 <p>A list of associated Amazon EC2 Auto Scaling groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoScalingGroups;

/**
 <p>Information about blue/green deployment options for a deployment group.</p>
 */
@property (nonatomic, strong) AWSCodedeployBlueGreenDeploymentConfiguration * _Nullable blueGreenDeploymentConfiguration;

/**
 <p>If specified, the deployment configuration name can be either one of the predefined configurations provided with AWS CodeDeploy or a custom deployment configuration that you create by calling the create deployment configuration operation.</p><p><code>CodeDeployDefault.OneAtATime</code> is the default deployment configuration. It is used if a configuration isn't specified for the deployment or deployment group.</p><p>For more information about the predefined deployment configurations in AWS CodeDeploy, see <a href="https://docs.aws.amazon.com/codedeploy/latest/userguide/deployment-configurations.html">Working with Deployment Configurations in CodeDeploy</a> in the <i>AWS CodeDeploy User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentConfigName;

/**
 <p>The name of a new deployment group for the specified application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentGroupName;

/**
 <p>Information about the type of deployment, in-place or blue/green, that you want to run and whether to route deployment traffic behind a load balancer.</p>
 */
@property (nonatomic, strong) AWSCodedeployDeploymentStyle * _Nullable deploymentStyle;

/**
 <p>The Amazon EC2 tags on which to filter. The deployment group includes EC2 instances with any of the specified tags. Cannot be used in the same call as ec2TagSet.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployEC2TagFilter *> * _Nullable ec2TagFilters;

/**
 <p>Information about groups of tags applied to EC2 instances. The deployment group includes only EC2 instances identified by all the tag groups. Cannot be used in the same call as <code>ec2TagFilters</code>.</p>
 */
@property (nonatomic, strong) AWSCodedeployEC2TagSet * _Nullable ec2TagSet;

/**
 <p> The target Amazon ECS services in the deployment group. This applies only to deployment groups that use the Amazon ECS compute platform. A target Amazon ECS service is specified as an Amazon ECS cluster and service name pair using the format <code>&lt;clustername&gt;:&lt;servicename&gt;</code>. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployECSService *> * _Nullable ecsServices;

/**
 <p>Information about the load balancer used in a deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployLoadBalancerInfo * _Nullable loadBalancerInfo;

/**
 <p>The on-premises instance tags on which to filter. The deployment group includes on-premises instances with any of the specified tags. Cannot be used in the same call as <code>OnPremisesTagSet</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTagFilter *> * _Nullable onPremisesInstanceTagFilters;

/**
 <p>Information about groups of tags applied to on-premises instances. The deployment group includes only on-premises instances identified by all of the tag groups. Cannot be used in the same call as <code>onPremisesInstanceTagFilters</code>.</p>
 */
@property (nonatomic, strong) AWSCodedeployOnPremisesTagSet * _Nullable onPremisesTagSet;

/**
 <p>A service role Amazon Resource Name (ARN) that allows AWS CodeDeploy to act on the user's behalf when interacting with AWS services.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleArn;

/**
 <p> The metadata that you apply to CodeDeploy deployment groups to help you organize and categorize them. Each tag consists of a key and an optional value, both of which you define. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTag *> * _Nullable tags;

/**
 <p>Information about triggers to create when the deployment group is created. For examples, see <a href="https://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-notify-sns.html">Create a Trigger for an AWS CodeDeploy Event</a> in the <i>AWS CodeDeploy User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTriggerConfig *> * _Nullable triggerConfigurations;

@end

/**
 <p>Represents the output of a <code>CreateDeploymentGroup</code> operation.</p>
 */
@interface AWSCodedeployCreateDeploymentGroupOutput : AWSModel


/**
 <p>A unique deployment group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentGroupId;

@end

/**
 <p>Represents the input of a <code>CreateDeployment</code> operation.</p>
 Required parameters: [applicationName]
 */
@interface AWSCodedeployCreateDeploymentInput : AWSRequest


/**
 <p>The name of an AWS CodeDeploy application associated with the IAM user or AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>Configuration information for an automatic rollback that is added when a deployment is created.</p>
 */
@property (nonatomic, strong) AWSCodedeployAutoRollbackConfiguration * _Nullable autoRollbackConfiguration;

/**
 <p>The name of a deployment configuration associated with the IAM user or AWS account.</p><p>If not specified, the value configured in the deployment group is used as the default. If the deployment group does not have a deployment configuration associated with it, <code>CodeDeployDefault</code>.<code>OneAtATime</code> is used by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentConfigName;

/**
 <p>The name of the deployment group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentGroupName;

/**
 <p>A comment about the deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Information about how AWS CodeDeploy handles files that already exist in a deployment target location but weren't part of the previous successful deployment.</p><p>The <code>fileExistsBehavior</code> parameter takes any of the following values:</p><ul><li><p>DISALLOW: The deployment fails. This is also the default behavior if no option is specified.</p></li><li><p>OVERWRITE: The version of the file from the application revision currently being deployed replaces the version already on the instance.</p></li><li><p>RETAIN: The version of the file already on the instance is kept and used as part of the new deployment.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployFileExistsBehavior fileExistsBehavior;

/**
 <p> If true, then if an <code>ApplicationStop</code>, <code>BeforeBlockTraffic</code>, or <code>AfterBlockTraffic</code> deployment lifecycle event to an instance fails, then the deployment continues to the next deployment lifecycle event. For example, if <code>ApplicationStop</code> fails, the deployment continues with <code>DownloadBundle</code>. If <code>BeforeBlockTraffic</code> fails, the deployment continues with <code>BlockTraffic</code>. If <code>AfterBlockTraffic</code> fails, the deployment continues with <code>ApplicationStop</code>. </p><p> If false or not specified, then if a lifecycle event fails during a deployment to an instance, that deployment fails. If deployment to that instance is part of an overall deployment and the number of healthy hosts is not less than the minimum number of healthy hosts, then a deployment to the next instance is attempted. </p><p> During a deployment, the AWS CodeDeploy agent runs the scripts specified for <code>ApplicationStop</code>, <code>BeforeBlockTraffic</code>, and <code>AfterBlockTraffic</code> in the AppSpec file from the previous successful deployment. (All other scripts are run from the AppSpec file in the current deployment.) If one of these scripts contains an error and does not run successfully, the deployment can fail. </p><p> If the cause of the failure is a script from the last successful deployment that will never run successfully, create a new deployment and use <code>ignoreApplicationStopFailures</code> to specify that the <code>ApplicationStop</code>, <code>BeforeBlockTraffic</code>, and <code>AfterBlockTraffic</code> failures should be ignored. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ignoreApplicationStopFailures;

/**
 <p> The type and location of the revision to deploy. </p>
 */
@property (nonatomic, strong) AWSCodedeployRevisionLocation * _Nullable revision;

/**
 <p> Information about the instances that belong to the replacement environment in a blue/green deployment. </p>
 */
@property (nonatomic, strong) AWSCodedeployTargetInstances * _Nullable targetInstances;

/**
 <p> Indicates whether to deploy to all instances or only to instances that are not running the latest application revision. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable updateOutdatedInstancesOnly;

@end

/**
 <p> Represents the output of a <code>CreateDeployment</code> operation. </p>
 */
@interface AWSCodedeployCreateDeploymentOutput : AWSModel


/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

@end

/**
 <p>Represents the input of a <code>DeleteApplication</code> operation.</p>
 Required parameters: [applicationName]
 */
@interface AWSCodedeployDeleteApplicationInput : AWSRequest


/**
 <p>The name of an AWS CodeDeploy application associated with the IAM user or AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

@end

/**
 <p>Represents the input of a <code>DeleteDeploymentConfig</code> operation.</p>
 Required parameters: [deploymentConfigName]
 */
@interface AWSCodedeployDeleteDeploymentConfigInput : AWSRequest


/**
 <p>The name of a deployment configuration associated with the IAM user or AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentConfigName;

@end

/**
 <p>Represents the input of a <code>DeleteDeploymentGroup</code> operation.</p>
 Required parameters: [applicationName, deploymentGroupName]
 */
@interface AWSCodedeployDeleteDeploymentGroupInput : AWSRequest


/**
 <p>The name of an AWS CodeDeploy application associated with the IAM user or AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The name of a deployment group for the specified application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentGroupName;

@end

/**
 <p>Represents the output of a <code>DeleteDeploymentGroup</code> operation.</p>
 */
@interface AWSCodedeployDeleteDeploymentGroupOutput : AWSModel


/**
 <p>If the output contains no data, and the corresponding deployment group contained at least one Auto Scaling group, AWS CodeDeploy successfully removed all corresponding Auto Scaling lifecycle event hooks from the Amazon EC2 instances in the Auto Scaling group. If the output contains data, AWS CodeDeploy could not remove some Auto Scaling lifecycle event hooks from the Amazon EC2 instances in the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployAutoScalingGroup *> * _Nullable hooksNotCleanedUp;

@end

/**
 <p>Represents the input of a <code>DeleteGitHubAccount</code> operation.</p>
 */
@interface AWSCodedeployDeleteGitHubAccountTokenInput : AWSRequest


/**
 <p>The name of the GitHub account connection to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenName;

@end

/**
 <p>Represents the output of a <code>DeleteGitHubAccountToken</code> operation.</p>
 */
@interface AWSCodedeployDeleteGitHubAccountTokenOutput : AWSModel


/**
 <p>The name of the GitHub account connection that was deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenName;

@end

/**
 
 */
@interface AWSCodedeployDeleteResourcesByExternalIdInput : AWSRequest


/**
 <p>The unique ID of an external resource (for example, a CloudFormation stack ID) that is linked to one or more CodeDeploy resources.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

@end

/**
 
 */
@interface AWSCodedeployDeleteResourcesByExternalIdOutput : AWSModel


@end

/**
 <p>Information about a deployment configuration.</p>
 */
@interface AWSCodedeployDeploymentConfigInfo : AWSModel


/**
 <p>The destination platform type for the deployment (<code>Lambda</code>, <code>Server</code>, or <code>ECS</code>).</p>
 */
@property (nonatomic, assign) AWSCodedeployComputePlatform computePlatform;

/**
 <p>The time at which the deployment configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The deployment configuration ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentConfigId;

/**
 <p>The deployment configuration name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentConfigName;

/**
 <p>Information about the number or percentage of minimum healthy instance.</p>
 */
@property (nonatomic, strong) AWSCodedeployMinimumHealthyHosts * _Nullable minimumHealthyHosts;

/**
 <p>The configuration that specifies how the deployment traffic is routed. Used for deployments with a Lambda or ECS compute platform only.</p>
 */
@property (nonatomic, strong) AWSCodedeployTrafficRoutingConfig * _Nullable trafficRoutingConfig;

@end

/**
 <p>Information about a deployment group.</p>
 */
@interface AWSCodedeployDeploymentGroupInfo : AWSModel


/**
 <p>A list of alarms associated with the deployment group.</p>
 */
@property (nonatomic, strong) AWSCodedeployAlarmConfiguration * _Nullable alarmConfiguration;

/**
 <p>The application name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>Information about the automatic rollback configuration associated with the deployment group.</p>
 */
@property (nonatomic, strong) AWSCodedeployAutoRollbackConfiguration * _Nullable autoRollbackConfiguration;

/**
 <p>A list of associated Auto Scaling groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployAutoScalingGroup *> * _Nullable autoScalingGroups;

/**
 <p>Information about blue/green deployment options for a deployment group.</p>
 */
@property (nonatomic, strong) AWSCodedeployBlueGreenDeploymentConfiguration * _Nullable blueGreenDeploymentConfiguration;

/**
 <p>The destination platform type for the deployment (<code>Lambda</code>, <code>Server</code>, or <code>ECS</code>).</p>
 */
@property (nonatomic, assign) AWSCodedeployComputePlatform computePlatform;

/**
 <p>The deployment configuration name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentConfigName;

/**
 <p>The deployment group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentGroupId;

/**
 <p>The deployment group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentGroupName;

/**
 <p>Information about the type of deployment, either in-place or blue/green, you want to run and whether to route deployment traffic behind a load balancer.</p>
 */
@property (nonatomic, strong) AWSCodedeployDeploymentStyle * _Nullable deploymentStyle;

/**
 <p>The Amazon EC2 tags on which to filter. The deployment group includes EC2 instances with any of the specified tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployEC2TagFilter *> * _Nullable ec2TagFilters;

/**
 <p>Information about groups of tags applied to an EC2 instance. The deployment group includes only EC2 instances identified by all of the tag groups. Cannot be used in the same call as ec2TagFilters.</p>
 */
@property (nonatomic, strong) AWSCodedeployEC2TagSet * _Nullable ec2TagSet;

/**
 <p> The target Amazon ECS services in the deployment group. This applies only to deployment groups that use the Amazon ECS compute platform. A target Amazon ECS service is specified as an Amazon ECS cluster and service name pair using the format <code>&lt;clustername&gt;:&lt;servicename&gt;</code>. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployECSService *> * _Nullable ecsServices;

/**
 <p>Information about the most recent attempted deployment to the deployment group.</p>
 */
@property (nonatomic, strong) AWSCodedeployLastDeploymentInfo * _Nullable lastAttemptedDeployment;

/**
 <p>Information about the most recent successful deployment to the deployment group.</p>
 */
@property (nonatomic, strong) AWSCodedeployLastDeploymentInfo * _Nullable lastSuccessfulDeployment;

/**
 <p>Information about the load balancer to use in a deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployLoadBalancerInfo * _Nullable loadBalancerInfo;

/**
 <p>The on-premises instance tags on which to filter. The deployment group includes on-premises instances with any of the specified tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTagFilter *> * _Nullable onPremisesInstanceTagFilters;

/**
 <p>Information about groups of tags applied to an on-premises instance. The deployment group includes only on-premises instances identified by all the tag groups. Cannot be used in the same call as onPremisesInstanceTagFilters.</p>
 */
@property (nonatomic, strong) AWSCodedeployOnPremisesTagSet * _Nullable onPremisesTagSet;

/**
 <p>A service role Amazon Resource Name (ARN) that grants CodeDeploy permission to make calls to AWS services on your behalf. For more information, see <a href="https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-create-service-role.html">Create a Service Role for AWS CodeDeploy</a> in the <i>AWS CodeDeploy User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleArn;

/**
 <p>Information about the deployment group's target revision, including type and location.</p>
 */
@property (nonatomic, strong) AWSCodedeployRevisionLocation * _Nullable targetRevision;

/**
 <p>Information about triggers associated with the deployment group.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTriggerConfig *> * _Nullable triggerConfigurations;

@end

/**
 <p>Information about a deployment.</p>
 */
@interface AWSCodedeployDeploymentInfo : AWSModel


/**
 <p>Provides information about the results of a deployment, such as whether instances in the original environment in a blue/green deployment were not terminated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable additionalDeploymentStatusInfo;

/**
 <p>The application name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>Information about the automatic rollback configuration associated with the deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployAutoRollbackConfiguration * _Nullable autoRollbackConfiguration;

/**
 <p>Information about blue/green deployment options for this deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployBlueGreenDeploymentConfiguration * _Nullable blueGreenDeploymentConfiguration;

/**
 <p>A timestamp that indicates when the deployment was complete.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completeTime;

/**
 <p>The destination platform type for the deployment (<code>Lambda</code>, <code>Server</code>, or <code>ECS</code>).</p>
 */
@property (nonatomic, assign) AWSCodedeployComputePlatform computePlatform;

/**
 <p>A timestamp that indicates when the deployment was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The means by which the deployment was created:</p><ul><li><p><code>user</code>: A user created the deployment.</p></li><li><p><code>autoscaling</code>: Amazon EC2 Auto Scaling created the deployment.</p></li><li><p><code>codeDeployRollback</code>: A rollback process created the deployment.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployDeploymentCreator creator;

/**
 <p> The deployment configuration name. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentConfigName;

/**
 <p> The deployment group name. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentGroupName;

/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>A summary of the deployment status of the instances in the deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployDeploymentOverview * _Nullable deploymentOverview;

/**
 <p>Messages that contain information about the status of a deployment.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deploymentStatusMessages;

/**
 <p>Information about the type of deployment, either in-place or blue/green, you want to run and whether to route deployment traffic behind a load balancer.</p>
 */
@property (nonatomic, strong) AWSCodedeployDeploymentStyle * _Nullable deploymentStyle;

/**
 <p>A comment about the deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Information about any error associated with this deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployErrorInformation * _Nullable errorInformation;

/**
 <p>The unique ID for an external resource (for example, a CloudFormation stack ID) that is linked to this deployment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 <p>Information about how AWS CodeDeploy handles files that already exist in a deployment target location but weren't part of the previous successful deployment.</p><ul><li><p><code>DISALLOW</code>: The deployment fails. This is also the default behavior if no option is specified.</p></li><li><p><code>OVERWRITE</code>: The version of the file from the application revision currently being deployed replaces the version already on the instance.</p></li><li><p><code>RETAIN</code>: The version of the file already on the instance is kept and used as part of the new deployment.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployFileExistsBehavior fileExistsBehavior;

/**
 <p> If true, then if an <code>ApplicationStop</code>, <code>BeforeBlockTraffic</code>, or <code>AfterBlockTraffic</code> deployment lifecycle event to an instance fails, then the deployment continues to the next deployment lifecycle event. For example, if <code>ApplicationStop</code> fails, the deployment continues with DownloadBundle. If <code>BeforeBlockTraffic</code> fails, the deployment continues with <code>BlockTraffic</code>. If <code>AfterBlockTraffic</code> fails, the deployment continues with <code>ApplicationStop</code>. </p><p> If false or not specified, then if a lifecycle event fails during a deployment to an instance, that deployment fails. If deployment to that instance is part of an overall deployment and the number of healthy hosts is not less than the minimum number of healthy hosts, then a deployment to the next instance is attempted. </p><p> During a deployment, the AWS CodeDeploy agent runs the scripts specified for <code>ApplicationStop</code>, <code>BeforeBlockTraffic</code>, and <code>AfterBlockTraffic</code> in the AppSpec file from the previous successful deployment. (All other scripts are run from the AppSpec file in the current deployment.) If one of these scripts contains an error and does not run successfully, the deployment can fail. </p><p> If the cause of the failure is a script from the last successful deployment that will never run successfully, create a new deployment and use <code>ignoreApplicationStopFailures</code> to specify that the <code>ApplicationStop</code>, <code>BeforeBlockTraffic</code>, and <code>AfterBlockTraffic</code> failures should be ignored. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ignoreApplicationStopFailures;

/**
 <p>Indicates whether the wait period set for the termination of instances in the original environment has started. Status is 'false' if the KEEP_ALIVE option is specified. Otherwise, 'true' as soon as the termination wait period starts.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceTerminationWaitTimeStarted;

/**
 <p>Information about the load balancer used in the deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployLoadBalancerInfo * _Nullable loadBalancerInfo;

/**
 <p>Information about the application revision that was deployed to the deployment group before the most recent successful deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployRevisionLocation * _Nullable previousRevision;

/**
 <p>Information about the location of stored application artifacts and the service from which to retrieve them.</p>
 */
@property (nonatomic, strong) AWSCodedeployRevisionLocation * _Nullable revision;

/**
 <p>Information about a deployment rollback.</p>
 */
@property (nonatomic, strong) AWSCodedeployRollbackInfo * _Nullable rollbackInfo;

/**
 <p>A timestamp that indicates when the deployment was deployed to the deployment group.</p><p>In some cases, the reported value of the start time might be later than the complete time. This is due to differences in the clock settings of backend servers that participate in the deployment process.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The current state of the deployment as a whole.</p>
 */
@property (nonatomic, assign) AWSCodedeployDeploymentStatus status;

/**
 <p>Information about the instances that belong to the replacement environment in a blue/green deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployTargetInstances * _Nullable targetInstances;

/**
 <p>Indicates whether only instances that are not running the latest application revision are to be deployed to.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable updateOutdatedInstancesOnly;

@end

/**
 <p>Information about the deployment status of the instances in the deployment.</p>
 */
@interface AWSCodedeployDeploymentOverview : AWSModel


/**
 <p>The number of instances in the deployment in a failed state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failed;

/**
 <p>The number of instances in which the deployment is in progress.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inProgress;

/**
 <p>The number of instances in the deployment in a pending state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pending;

/**
 <p>The number of instances in a replacement environment ready to receive traffic in a blue/green deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ready;

/**
 <p>The number of instances in the deployment in a skipped state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable skipped;

/**
 <p>The number of instances in the deployment to which revisions have been successfully deployed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable succeeded;

@end

/**
 <p>Information about how traffic is rerouted to instances in a replacement environment in a blue/green deployment.</p>
 */
@interface AWSCodedeployDeploymentReadyOption : AWSModel


/**
 <p>Information about when to reroute traffic from an original environment to a replacement environment in a blue/green deployment.</p><ul><li><p>CONTINUE_DEPLOYMENT: Register new instances with the load balancer immediately after the new application revision is installed on the instances in the replacement environment.</p></li><li><p>STOP_DEPLOYMENT: Do not register new instances with a load balancer unless traffic rerouting is started using <a>ContinueDeployment</a>. If traffic rerouting is not started before the end of the specified wait period, the deployment status is changed to Stopped.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployDeploymentReadyAction actionOnTimeout;

/**
 <p>The number of minutes to wait before the status of a blue/green deployment is changed to Stopped if rerouting is not started manually. Applies only to the <code>STOP_DEPLOYMENT</code> option for <code>actionOnTimeout</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable waitTimeInMinutes;

@end

/**
 <p>Information about the type of deployment, either in-place or blue/green, you want to run and whether to route deployment traffic behind a load balancer.</p>
 */
@interface AWSCodedeployDeploymentStyle : AWSModel


/**
 <p>Indicates whether to route deployment traffic behind a load balancer.</p>
 */
@property (nonatomic, assign) AWSCodedeployDeploymentOption deploymentOption;

/**
 <p>Indicates whether to run an in-place deployment or a blue/green deployment.</p>
 */
@property (nonatomic, assign) AWSCodedeployDeploymentType deploymentType;

@end

/**
 <p> Information about the deployment target. </p>
 */
@interface AWSCodedeployDeploymentTarget : AWSModel


/**
 <p> Information about the target to be updated by an AWS CloudFormation blue/green deployment. This target type is used for all deployments initiated by a CloudFormation stack update.</p>
 */
@property (nonatomic, strong) AWSCodedeployCloudFormationTarget * _Nullable cloudFormationTarget;

/**
 <p>The deployment type that is specific to the deployment's compute platform or deployments initiated by a CloudFormation stack update.</p>
 */
@property (nonatomic, assign) AWSCodedeployDeploymentTargetType deploymentTargetType;

/**
 <p> Information about the target for a deployment that uses the Amazon ECS compute platform. </p>
 */
@property (nonatomic, strong) AWSCodedeployECSTarget * _Nullable ecsTarget;

/**
 <p> Information about the target for a deployment that uses the EC2/On-premises compute platform. </p>
 */
@property (nonatomic, strong) AWSCodedeployInstanceTarget * _Nullable instanceTarget;

/**
 <p> Information about the target for a deployment that uses the AWS Lambda compute platform. </p>
 */
@property (nonatomic, strong) AWSCodedeployLambdaTarget * _Nullable lambdaTarget;

@end

/**
 <p>Represents the input of a <code>DeregisterOnPremisesInstance</code> operation.</p>
 Required parameters: [instanceName]
 */
@interface AWSCodedeployDeregisterOnPremisesInstanceInput : AWSRequest


/**
 <p>The name of the on-premises instance to deregister.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

@end

/**
 <p>Diagnostic information about executable scripts that are part of a deployment.</p>
 */
@interface AWSCodedeployDiagnostics : AWSModel


/**
 <p>The associated error code:</p><ul><li><p>Success: The specified script ran.</p></li><li><p>ScriptMissing: The specified script was not found in the specified location.</p></li><li><p>ScriptNotExecutable: The specified script is not a recognized executable file type.</p></li><li><p>ScriptTimedOut: The specified script did not finish running in the specified time period.</p></li><li><p>ScriptFailed: The specified script failed to run as expected.</p></li><li><p>UnknownError: The specified script did not run for an unknown reason.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployLifecycleErrorCode errorCode;

/**
 <p>The last portion of the diagnostic log.</p><p>If available, AWS CodeDeploy returns up to the last 4 KB of the diagnostic log.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logTail;

/**
 <p>The message associated with the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The name of the script.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scriptName;

@end

/**
 <p>Information about an EC2 tag filter.</p>
 */
@interface AWSCodedeployEC2TagFilter : AWSModel


/**
 <p>The tag filter key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The tag filter type:</p><ul><li><p><code>KEY_ONLY</code>: Key only.</p></li><li><p><code>VALUE_ONLY</code>: Value only.</p></li><li><p><code>KEY_AND_VALUE</code>: Key and value.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployEC2TagFilterType types;

/**
 <p>The tag filter value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about groups of EC2 instance tags.</p>
 */
@interface AWSCodedeployEC2TagSet : AWSModel


/**
 <p>A list that contains other lists of EC2 instance tag groups. For an instance to be included in the deployment group, it must be identified by all of the tag groups in the list.</p>
 */
@property (nonatomic, strong) NSArray<NSArray<AWSCodedeployEC2TagFilter *> *> * _Nullable ec2TagSetList;

@end

/**
 <p> Contains the service and cluster names used to identify an Amazon ECS deployment's target. </p>
 */
@interface AWSCodedeployECSService : AWSModel


/**
 <p> The name of the cluster that the Amazon ECS service is associated with. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterName;

/**
 <p> The name of the target Amazon ECS service. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

@end

/**
 <p> Information about the target of an Amazon ECS deployment. </p>
 */
@interface AWSCodedeployECSTarget : AWSModel


/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p> The date and time when the target Amazon ECS application was updated by a deployment. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p> The lifecycle events of the deployment to this target Amazon ECS application. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployLifecycleEvent *> * _Nullable lifecycleEvents;

/**
 <p> The status an Amazon ECS deployment's target ECS application. </p>
 */
@property (nonatomic, assign) AWSCodedeployTargetStatus status;

/**
 <p> The Amazon Resource Name (ARN) of the target. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

/**
 <p> The unique ID of a deployment target that has a type of <code>ecsTarget</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetId;

/**
 <p> The <code>ECSTaskSet</code> objects associated with the ECS target. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployECSTaskSet *> * _Nullable taskSetsInfo;

@end

/**
 <p> Information about a set of Amazon ECS tasks in an AWS CodeDeploy deployment. An Amazon ECS task set includes details such as the desired number of tasks, how many tasks are running, and whether the task set serves production traffic. An AWS CodeDeploy application that uses the Amazon ECS compute platform deploys a containerized application in an Amazon ECS service as a task set. </p>
 */
@interface AWSCodedeployECSTaskSet : AWSModel


/**
 <p> The number of tasks in a task set. During a deployment that uses the Amazon ECS compute type, CodeDeploy instructs Amazon ECS to create a new task set and uses this value to determine how many tasks to create. After the updated task set is created, CodeDeploy shifts traffic to the new task set. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCount;

/**
 <p> A unique ID of an <code>ECSTaskSet</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifer;

/**
 <p> The number of tasks in the task set that are in the <code>PENDING</code> status during an Amazon ECS deployment. A task in the <code>PENDING</code> state is preparing to enter the <code>RUNNING</code> state. A task set enters the <code>PENDING</code> status when it launches for the first time, or when it is restarted after being in the <code>STOPPED</code> state. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pendingCount;

/**
 <p> The number of tasks in the task set that are in the <code>RUNNING</code> status during an Amazon ECS deployment. A task in the <code>RUNNING</code> state is running and ready for use. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable runningCount;

/**
 <p> The status of the task set. There are three valid task set statuses: </p><ul><li><p><code>PRIMARY</code>: Indicates the task set is serving production traffic. </p></li><li><p><code>ACTIVE</code>: Indicates the task set is not serving production traffic. </p></li><li><p><code>DRAINING</code>: Indicates the tasks in the task set are being stopped and their corresponding targets are being deregistered from their target group. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p> The target group associated with the task set. The target group is used by AWS CodeDeploy to manage traffic to a task set. </p>
 */
@property (nonatomic, strong) AWSCodedeployTargetGroupInfo * _Nullable targetGroup;

/**
 <p> A label that identifies whether the ECS task set is an original target (<code>BLUE</code>) or a replacement target (<code>GREEN</code>). </p>
 */
@property (nonatomic, assign) AWSCodedeployTargetLabel taskSetLabel;

/**
 <p> The percentage of traffic served by this task set. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable trafficWeight;

@end

/**
 <p>Information about a load balancer in Elastic Load Balancing to use in a deployment. Instances are registered directly with a load balancer, and traffic is routed to the load balancer.</p>
 */
@interface AWSCodedeployELBInfo : AWSModel


/**
 <p>For blue/green deployments, the name of the load balancer that is used to route traffic from original instances to replacement instances in a blue/green deployment. For in-place deployments, the name of the load balancer that instances are deregistered from so they are not serving traffic during a deployment, and then re-registered with after the deployment is complete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Information about a deployment error.</p>
 */
@interface AWSCodedeployErrorInformation : AWSModel


/**
 <p>For more information, see <a href="https://docs.aws.amazon.com/codedeploy/latest/userguide/error-codes.html">Error Codes for AWS CodeDeploy</a> in the <a href="https://docs.aws.amazon.com/codedeploy/latest/userguide">AWS CodeDeploy User Guide</a>.</p><p>The error code:</p><ul><li><p>APPLICATION_MISSING: The application was missing. This error code is most likely raised if the application is deleted after the deployment is created, but before it is started.</p></li><li><p>DEPLOYMENT_GROUP_MISSING: The deployment group was missing. This error code is most likely raised if the deployment group is deleted after the deployment is created, but before it is started.</p></li><li><p>HEALTH_CONSTRAINTS: The deployment failed on too many instances to be successfully deployed within the instance health constraints specified.</p></li><li><p>HEALTH_CONSTRAINTS_INVALID: The revision cannot be successfully deployed within the instance health constraints specified.</p></li><li><p>IAM_ROLE_MISSING: The service role cannot be accessed.</p></li><li><p>IAM_ROLE_PERMISSIONS: The service role does not have the correct permissions.</p></li><li><p>INTERNAL_ERROR: There was an internal error.</p></li><li><p>NO_EC2_SUBSCRIPTION: The calling account is not subscribed to Amazon EC2.</p></li><li><p>NO_INSTANCES: No instances were specified, or no instances can be found.</p></li><li><p>OVER_MAX_INSTANCES: The maximum number of instances was exceeded.</p></li><li><p>THROTTLED: The operation was throttled because the calling account exceeded the throttling limits of one or more AWS services.</p></li><li><p>TIMEOUT: The deployment has timed out.</p></li><li><p>REVISION_MISSING: The revision ID was missing. This error code is most likely raised if the revision is deleted after the deployment is created, but before it is started.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployErrorCode code;

/**
 <p>An accompanying error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Information about an application revision.</p>
 */
@interface AWSCodedeployGenericRevisionInfo : AWSModel


/**
 <p>The deployment groups for which this is the current target revision.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deploymentGroups;

/**
 <p>A comment about the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>When the revision was first used by AWS CodeDeploy.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable firstUsedTime;

/**
 <p>When the revision was last used by AWS CodeDeploy.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUsedTime;

/**
 <p>When the revision was registered with AWS CodeDeploy.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable registerTime;

@end

/**
 <p>Represents the input of a <code>GetApplication</code> operation.</p>
 Required parameters: [applicationName]
 */
@interface AWSCodedeployGetApplicationInput : AWSRequest


/**
 <p>The name of an AWS CodeDeploy application associated with the IAM user or AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

@end

/**
 <p>Represents the output of a <code>GetApplication</code> operation.</p>
 */
@interface AWSCodedeployGetApplicationOutput : AWSModel


/**
 <p>Information about the application.</p>
 */
@property (nonatomic, strong) AWSCodedeployApplicationInfo * _Nullable application;

@end

/**
 <p>Represents the input of a <code>GetApplicationRevision</code> operation.</p>
 Required parameters: [applicationName, revision]
 */
@interface AWSCodedeployGetApplicationRevisionInput : AWSRequest


/**
 <p>The name of the application that corresponds to the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>Information about the application revision to get, including type and location.</p>
 */
@property (nonatomic, strong) AWSCodedeployRevisionLocation * _Nullable revision;

@end

/**
 <p>Represents the output of a <code>GetApplicationRevision</code> operation.</p>
 */
@interface AWSCodedeployGetApplicationRevisionOutput : AWSModel


/**
 <p>The name of the application that corresponds to the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>Additional information about the revision, including type and location.</p>
 */
@property (nonatomic, strong) AWSCodedeployRevisionLocation * _Nullable revision;

/**
 <p>General information about the revision.</p>
 */
@property (nonatomic, strong) AWSCodedeployGenericRevisionInfo * _Nullable revisionInfo;

@end

/**
 <p>Represents the input of a <code>GetDeploymentConfig</code> operation.</p>
 Required parameters: [deploymentConfigName]
 */
@interface AWSCodedeployGetDeploymentConfigInput : AWSRequest


/**
 <p>The name of a deployment configuration associated with the IAM user or AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentConfigName;

@end

/**
 <p>Represents the output of a <code>GetDeploymentConfig</code> operation.</p>
 */
@interface AWSCodedeployGetDeploymentConfigOutput : AWSModel


/**
 <p>Information about the deployment configuration.</p>
 */
@property (nonatomic, strong) AWSCodedeployDeploymentConfigInfo * _Nullable deploymentConfigInfo;

@end

/**
 <p>Represents the input of a <code>GetDeploymentGroup</code> operation.</p>
 Required parameters: [applicationName, deploymentGroupName]
 */
@interface AWSCodedeployGetDeploymentGroupInput : AWSRequest


/**
 <p>The name of an AWS CodeDeploy application associated with the IAM user or AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The name of a deployment group for the specified application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentGroupName;

@end

/**
 <p>Represents the output of a <code>GetDeploymentGroup</code> operation.</p>
 */
@interface AWSCodedeployGetDeploymentGroupOutput : AWSModel


/**
 <p>Information about the deployment group.</p>
 */
@property (nonatomic, strong) AWSCodedeployDeploymentGroupInfo * _Nullable deploymentGroupInfo;

@end

/**
 <p>Represents the input of a <code>GetDeployment</code> operation.</p>
 Required parameters: [deploymentId]
 */
@interface AWSCodedeployGetDeploymentInput : AWSRequest


/**
 <p> The unique ID of a deployment associated with the IAM user or AWS account. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

@end

/**
 <p> Represents the input of a <code>GetDeploymentInstance</code> operation. </p>
 Required parameters: [deploymentId, instanceId]
 */
@interface AWSCodedeployGetDeploymentInstanceInput : AWSRequest


/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p> The unique ID of an instance in the deployment group. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 <p> Represents the output of a <code>GetDeploymentInstance</code> operation. </p>
 */
@interface AWSCodedeployGetDeploymentInstanceOutput : AWSModel


/**
 <p> Information about the instance. </p>
 */
@property (nonatomic, strong) AWSCodedeployInstanceSummary * _Nullable instanceSummary;

@end

/**
 <p>Represents the output of a <code>GetDeployment</code> operation.</p>
 */
@interface AWSCodedeployGetDeploymentOutput : AWSModel


/**
 <p>Information about the deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployDeploymentInfo * _Nullable deploymentInfo;

@end

/**
 
 */
@interface AWSCodedeployGetDeploymentTargetInput : AWSRequest


/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p> The unique ID of a deployment target. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetId;

@end

/**
 
 */
@interface AWSCodedeployGetDeploymentTargetOutput : AWSModel


/**
 <p> A deployment target that contains information about a deployment such as its status, lifecycle events, and when it was last updated. It also contains metadata about the deployment target. The deployment target metadata depends on the deployment target's type (<code>instanceTarget</code>, <code>lambdaTarget</code>, or <code>ecsTarget</code>). </p>
 */
@property (nonatomic, strong) AWSCodedeployDeploymentTarget * _Nullable deploymentTarget;

@end

/**
 <p> Represents the input of a <code>GetOnPremisesInstance</code> operation. </p>
 Required parameters: [instanceName]
 */
@interface AWSCodedeployGetOnPremisesInstanceInput : AWSRequest


/**
 <p> The name of the on-premises instance about which to get information. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

@end

/**
 <p> Represents the output of a <code>GetOnPremisesInstance</code> operation. </p>
 */
@interface AWSCodedeployGetOnPremisesInstanceOutput : AWSModel


/**
 <p> Information about the on-premises instance. </p>
 */
@property (nonatomic, strong) AWSCodedeployInstanceInfo * _Nullable instanceInfo;

@end

/**
 <p>Information about the location of application artifacts stored in GitHub.</p>
 */
@interface AWSCodedeployGitHubLocation : AWSModel


/**
 <p>The SHA1 commit ID of the GitHub commit that represents the bundled artifacts for the application revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commitId;

/**
 <p>The GitHub account and repository pair that stores a reference to the commit that represents the bundled artifacts for the application revision. </p><p>Specified as account/repository.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repository;

@end

/**
 <p>Information about the instances that belong to the replacement environment in a blue/green deployment.</p>
 */
@interface AWSCodedeployGreenFleetProvisioningOption : AWSModel


/**
 <p>The method used to add instances to a replacement environment.</p><ul><li><p><code>DISCOVER_EXISTING</code>: Use instances that already exist or will be created manually.</p></li><li><p><code>COPY_AUTO_SCALING_GROUP</code>: Use settings from a specified Auto Scaling group to define and create instances in a new Auto Scaling group.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployGreenFleetProvisioningAction action;

@end

/**
 <p>Information about an on-premises instance.</p>
 */
@interface AWSCodedeployInstanceInfo : AWSModel


/**
 <p>If the on-premises instance was deregistered, the time at which the on-premises instance was deregistered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deregisterTime;

/**
 <p>The ARN of the IAM session associated with the on-premises instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamSessionArn;

/**
 <p>The IAM user ARN associated with the on-premises instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamUserArn;

/**
 <p>The ARN of the on-premises instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceArn;

/**
 <p>The name of the on-premises instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

/**
 <p>The time at which the on-premises instance was registered.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable registerTime;

/**
 <p>The tags currently associated with the on-premises instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTag *> * _Nullable tags;

@end

/**
 <p>Information about an instance in a deployment.</p>
 */
@interface AWSCodedeployInstanceSummary : AWSModel


/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>The instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Information about which environment an instance belongs to in a blue/green deployment.</p><ul><li><p>BLUE: The instance is part of the original environment.</p></li><li><p>GREEN: The instance is part of the replacement environment.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployInstanceType instanceType;

/**
 <p>A timestamp that indicates when the instance information was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>A list of lifecycle events for this instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployLifecycleEvent *> * _Nullable lifecycleEvents;

/**
 <p>The deployment status for this instance:</p><ul><li><p><code>Pending</code>: The deployment is pending for this instance.</p></li><li><p><code>In Progress</code>: The deployment is in progress for this instance.</p></li><li><p><code>Succeeded</code>: The deployment has succeeded for this instance.</p></li><li><p><code>Failed</code>: The deployment has failed for this instance.</p></li><li><p><code>Skipped</code>: The deployment has been skipped for this instance.</p></li><li><p><code>Unknown</code>: The deployment status is unknown for this instance.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployInstanceStatus status;

@end

/**
 <p> A target Amazon EC2 or on-premises instance during a deployment that uses the EC2/On-premises compute platform. </p>
 */
@interface AWSCodedeployInstanceTarget : AWSModel


/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p> A label that identifies whether the instance is an original target (<code>BLUE</code>) or a replacement target (<code>GREEN</code>). </p>
 */
@property (nonatomic, assign) AWSCodedeployTargetLabel instanceLabel;

/**
 <p> The date and time when the target instance was updated by a deployment. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p> The lifecycle events of the deployment to this target instance. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployLifecycleEvent *> * _Nullable lifecycleEvents;

/**
 <p> The status an EC2/On-premises deployment's target instance. </p>
 */
@property (nonatomic, assign) AWSCodedeployTargetStatus status;

/**
 <p> The Amazon Resource Name (ARN) of the target. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

/**
 <p> The unique ID of a deployment target that has a type of <code>instanceTarget</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetId;

@end

/**
 <p> Information about a Lambda function specified in a deployment. </p>
 */
@interface AWSCodedeployLambdaFunctionInfo : AWSModel


/**
 <p> The version of a Lambda function that production traffic points to. </p>
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

/**
 <p> The alias of a Lambda function. For more information, see <a href="https://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html">AWS Lambda Function Aliases</a> in the <i>AWS Lambda Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionAlias;

/**
 <p> The name of a Lambda function. </p>
 */
@property (nonatomic, strong) NSString * _Nullable functionName;

/**
 <p> The version of a Lambda function that production traffic points to after the Lambda function is deployed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetVersion;

/**
 <p> The percentage of production traffic that the target version of a Lambda function receives. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetVersionWeight;

@end

/**
 <p> Information about the target AWS Lambda function during an AWS Lambda deployment. </p>
 */
@interface AWSCodedeployLambdaTarget : AWSModel


/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p> A <code>LambdaFunctionInfo</code> object that describes a target Lambda function. </p>
 */
@property (nonatomic, strong) AWSCodedeployLambdaFunctionInfo * _Nullable lambdaFunctionInfo;

/**
 <p> The date and time when the target Lambda function was updated by a deployment. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p> The lifecycle events of the deployment to this target Lambda function. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployLifecycleEvent *> * _Nullable lifecycleEvents;

/**
 <p> The status an AWS Lambda deployment's target Lambda function. </p>
 */
@property (nonatomic, assign) AWSCodedeployTargetStatus status;

/**
 <p> The Amazon Resource Name (ARN) of the target. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

/**
 <p> The unique ID of a deployment target that has a type of <code>lambdaTarget</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetId;

@end

/**
 <p>Information about the most recent attempted or successful deployment to a deployment group.</p>
 */
@interface AWSCodedeployLastDeploymentInfo : AWSModel


/**
 <p>A timestamp that indicates when the most recent deployment to the deployment group started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>A timestamp that indicates when the most recent deployment to the deployment group was complete.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The status of the most recent deployment.</p>
 */
@property (nonatomic, assign) AWSCodedeployDeploymentStatus status;

@end

/**
 <p>Information about a deployment lifecycle event.</p>
 */
@interface AWSCodedeployLifecycleEvent : AWSModel


/**
 <p>Diagnostic information about the deployment lifecycle event.</p>
 */
@property (nonatomic, strong) AWSCodedeployDiagnostics * _Nullable diagnostics;

/**
 <p>A timestamp that indicates when the deployment lifecycle event ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The deployment lifecycle event name, such as <code>ApplicationStop</code>, <code>BeforeInstall</code>, <code>AfterInstall</code>, <code>ApplicationStart</code>, or <code>ValidateService</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleEventName;

/**
 <p>A timestamp that indicates when the deployment lifecycle event started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The deployment lifecycle event status:</p><ul><li><p>Pending: The deployment lifecycle event is pending.</p></li><li><p>InProgress: The deployment lifecycle event is in progress.</p></li><li><p>Succeeded: The deployment lifecycle event ran successfully.</p></li><li><p>Failed: The deployment lifecycle event has failed.</p></li><li><p>Skipped: The deployment lifecycle event has been skipped.</p></li><li><p>Unknown: The deployment lifecycle event is unknown.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployLifecycleEventStatus status;

@end

/**
 <p> Represents the input of a <code>ListApplicationRevisions</code> operation. </p>
 Required parameters: [applicationName]
 */
@interface AWSCodedeployListApplicationRevisionsInput : AWSRequest


/**
 <p> The name of an AWS CodeDeploy application associated with the IAM user or AWS account. </p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p> Whether to list revisions based on whether the revision is the target revision of a deployment group: </p><ul><li><p><code>include</code>: List revisions that are target revisions of a deployment group.</p></li><li><p><code>exclude</code>: Do not list revisions that are target revisions of a deployment group.</p></li><li><p><code>ignore</code>: List all revisions.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployListStateFilterAction deployed;

/**
 <p>An identifier returned from the previous <code>ListApplicationRevisions</code> call. It can be used to return the next set of applications in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> An Amazon S3 bucket name to limit the search for revisions. </p><p> If set to null, all of the user's buckets are searched. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p> A key prefix for the set of Amazon S3 objects to limit the search for revisions. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3KeyPrefix;

/**
 <p>The column name to use to sort the list results:</p><ul><li><p><code>registerTime</code>: Sort by the time the revisions were registered with AWS CodeDeploy.</p></li><li><p><code>firstUsedTime</code>: Sort by the time the revisions were first used in a deployment.</p></li><li><p><code>lastUsedTime</code>: Sort by the time the revisions were last used in a deployment.</p></li></ul><p> If not specified or set to null, the results are returned in an arbitrary order. </p>
 */
@property (nonatomic, assign) AWSCodedeployApplicationRevisionSortBy sortBy;

/**
 <p> The order in which to sort the list results: </p><ul><li><p><code>ascending</code>: ascending order.</p></li><li><p><code>descending</code>: descending order.</p></li></ul><p>If not specified, the results are sorted in ascending order.</p><p>If set to null, the results are sorted in an arbitrary order.</p>
 */
@property (nonatomic, assign) AWSCodedeploySortOrder sortOrder;

@end

/**
 <p>Represents the output of a <code>ListApplicationRevisions</code> operation.</p>
 */
@interface AWSCodedeployListApplicationRevisionsOutput : AWSModel


/**
 <p>If a large amount of information is returned, an identifier is also returned. It can be used in a subsequent list application revisions call to return the next set of application revisions in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of locations that contain the matching revisions.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployRevisionLocation *> * _Nullable revisions;

@end

/**
 <p>Represents the input of a <code>ListApplications</code> operation.</p>
 */
@interface AWSCodedeployListApplicationsInput : AWSRequest


/**
 <p>An identifier returned from the previous list applications call. It can be used to return the next set of applications in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the output of a ListApplications operation.</p>
 */
@interface AWSCodedeployListApplicationsOutput : AWSModel


/**
 <p>A list of application names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable applications;

/**
 <p>If a large amount of information is returned, an identifier is also returned. It can be used in a subsequent list applications call to return the next set of applications in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the input of a <code>ListDeploymentConfigs</code> operation.</p>
 */
@interface AWSCodedeployListDeploymentConfigsInput : AWSRequest


/**
 <p>An identifier returned from the previous <code>ListDeploymentConfigs</code> call. It can be used to return the next set of deployment configurations in the list. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the output of a <code>ListDeploymentConfigs</code> operation.</p>
 */
@interface AWSCodedeployListDeploymentConfigsOutput : AWSModel


/**
 <p>A list of deployment configurations, including built-in configurations such as <code>CodeDeployDefault.OneAtATime</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deploymentConfigsList;

/**
 <p>If a large amount of information is returned, an identifier is also returned. It can be used in a subsequent list deployment configurations call to return the next set of deployment configurations in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the input of a <code>ListDeploymentGroups</code> operation.</p>
 Required parameters: [applicationName]
 */
@interface AWSCodedeployListDeploymentGroupsInput : AWSRequest


/**
 <p>The name of an AWS CodeDeploy application associated with the IAM user or AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>An identifier returned from the previous list deployment groups call. It can be used to return the next set of deployment groups in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the output of a <code>ListDeploymentGroups</code> operation.</p>
 */
@interface AWSCodedeployListDeploymentGroupsOutput : AWSModel


/**
 <p>The application name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>A list of deployment group names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deploymentGroups;

/**
 <p>If a large amount of information is returned, an identifier is also returned. It can be used in a subsequent list deployment groups call to return the next set of deployment groups in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> Represents the input of a <code>ListDeploymentInstances</code> operation. </p>
 Required parameters: [deploymentId]
 */
@interface AWSCodedeployListDeploymentInstancesInput : AWSRequest


/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p>A subset of instances to list by status:</p><ul><li><p><code>Pending</code>: Include those instances with pending deployments.</p></li><li><p><code>InProgress</code>: Include those instances where deployments are still in progress.</p></li><li><p><code>Succeeded</code>: Include those instances with successful deployments.</p></li><li><p><code>Failed</code>: Include those instances with failed deployments.</p></li><li><p><code>Skipped</code>: Include those instances with skipped deployments.</p></li><li><p><code>Unknown</code>: Include those instances with deployments in an unknown state.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceStatusFilter;

/**
 <p>The set of instances in a blue/green deployment, either those in the original environment ("BLUE") or those in the replacement environment ("GREEN"), for which you want to view instance information.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceTypeFilter;

/**
 <p>An identifier returned from the previous list deployment instances call. It can be used to return the next set of deployment instances in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the output of a <code>ListDeploymentInstances</code> operation.</p>
 */
@interface AWSCodedeployListDeploymentInstancesOutput : AWSModel


/**
 <p>A list of instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instancesList;

/**
 <p>If a large amount of information is returned, an identifier is also returned. It can be used in a subsequent list deployment instances call to return the next set of deployment instances in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCodedeployListDeploymentTargetsInput : AWSRequest


/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p> A token identifier returned from the previous <code>ListDeploymentTargets</code> call. It can be used to return the next set of deployment targets in the list. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> A key used to filter the returned targets. The two valid values are:</p><ul><li><p><code>TargetStatus</code> - A <code>TargetStatus</code> filter string can be <code>Failed</code>, <code>InProgress</code>, <code>Pending</code>, <code>Ready</code>, <code>Skipped</code>, <code>Succeeded</code>, or <code>Unknown</code>. </p></li><li><p><code>ServerInstanceLabel</code> - A <code>ServerInstanceLabel</code> filter string can be <code>Blue</code> or <code>Green</code>. </p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable targetFilters;

@end

/**
 
 */
@interface AWSCodedeployListDeploymentTargetsOutput : AWSModel


/**
 <p> If a large amount of information is returned, a token identifier is also returned. It can be used in a subsequent <code>ListDeploymentTargets</code> call to return the next set of deployment targets in the list. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The unique IDs of deployment targets. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetIds;

@end

/**
 <p>Represents the input of a <code>ListDeployments</code> operation.</p>
 */
@interface AWSCodedeployListDeploymentsInput : AWSRequest


/**
 <p>The name of an AWS CodeDeploy application associated with the IAM user or AWS account.</p><note><p>If <code>applicationName</code> is specified, then <code>deploymentGroupName</code> must be specified. If it is not specified, then <code>deploymentGroupName</code> must not be specified. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>A time range (start and end) for returning a subset of the list of deployments.</p>
 */
@property (nonatomic, strong) AWSCodedeployTimeRange * _Nullable createTimeRange;

/**
 <p>The name of a deployment group for the specified application.</p><note><p>If <code>deploymentGroupName</code> is specified, then <code>applicationName</code> must be specified. If it is not specified, then <code>applicationName</code> must not be specified. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentGroupName;

/**
 <p>The unique ID of an external resource for returning deployments linked to the external resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 <p>A subset of deployments to list by status:</p><ul><li><p><code>Created</code>: Include created deployments in the resulting list.</p></li><li><p><code>Queued</code>: Include queued deployments in the resulting list.</p></li><li><p><code>In Progress</code>: Include in-progress deployments in the resulting list.</p></li><li><p><code>Succeeded</code>: Include successful deployments in the resulting list.</p></li><li><p><code>Failed</code>: Include failed deployments in the resulting list.</p></li><li><p><code>Stopped</code>: Include stopped deployments in the resulting list.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable includeOnlyStatuses;

/**
 <p>An identifier returned from the previous list deployments call. It can be used to return the next set of deployments in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the output of a <code>ListDeployments</code> operation.</p>
 */
@interface AWSCodedeployListDeploymentsOutput : AWSModel


/**
 <p>A list of deployment IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deployments;

/**
 <p>If a large amount of information is returned, an identifier is also returned. It can be used in a subsequent list deployments call to return the next set of deployments in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the input of a <code>ListGitHubAccountTokenNames</code> operation.</p>
 */
@interface AWSCodedeployListGitHubAccountTokenNamesInput : AWSRequest


/**
 <p>An identifier returned from the previous <code>ListGitHubAccountTokenNames</code> call. It can be used to return the next set of names in the list. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the output of a <code>ListGitHubAccountTokenNames</code> operation.</p>
 */
@interface AWSCodedeployListGitHubAccountTokenNamesOutput : AWSModel


/**
 <p>If a large amount of information is returned, an identifier is also returned. It can be used in a subsequent <code>ListGitHubAccountTokenNames</code> call to return the next set of names in the list. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of names of connections to GitHub accounts.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tokenNameList;

@end

/**
 <p>Represents the input of a <code>ListOnPremisesInstances</code> operation.</p>
 */
@interface AWSCodedeployListOnPremisesInstancesInput : AWSRequest


/**
 <p>An identifier returned from the previous list on-premises instances call. It can be used to return the next set of on-premises instances in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The registration status of the on-premises instances:</p><ul><li><p><code>Deregistered</code>: Include deregistered on-premises instances in the resulting list.</p></li><li><p><code>Registered</code>: Include registered on-premises instances in the resulting list.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployRegistrationStatus registrationStatus;

/**
 <p>The on-premises instance tags that are used to restrict the on-premises instance names returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTagFilter *> * _Nullable tagFilters;

@end

/**
 <p>Represents the output of the list on-premises instances operation.</p>
 */
@interface AWSCodedeployListOnPremisesInstancesOutput : AWSModel


/**
 <p>The list of matching on-premises instance names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceNames;

/**
 <p>If a large amount of information is returned, an identifier is also returned. It can be used in a subsequent list on-premises instances call to return the next set of on-premises instances in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCodedeployListTagsForResourceInput : AWSRequest


/**
 <p>An identifier returned from the previous <code>ListTagsForResource</code> call. It can be used to return the next set of applications in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> The ARN of a CodeDeploy resource. <code>ListTagsForResource</code> returns all the tags associated with the resource that is identified by the <code>ResourceArn</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSCodedeployListTagsForResourceOutput : AWSModel


/**
 <p>If a large amount of information is returned, an identifier is also returned. It can be used in a subsequent list application revisions call to return the next set of application revisions in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> A list of tags returned by <code>ListTagsForResource</code>. The tags are associated with the resource identified by the input <code>ResourceArn</code> parameter. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTag *> * _Nullable tags;

@end

/**
 <p>Information about the Elastic Load Balancing load balancer or target group used in a deployment.</p>
 */
@interface AWSCodedeployLoadBalancerInfo : AWSModel


/**
 <p>An array that contains information about the load balancer to use for load balancing in a deployment. In Elastic Load Balancing, load balancers are used with Classic Load Balancers.</p><note><p> Adding more than one load balancer to the array is not supported. </p></note>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployELBInfo *> * _Nullable elbInfoList;

/**
 <p>An array that contains information about the target group to use for load balancing in a deployment. In Elastic Load Balancing, target groups are used with Application Load Balancers.</p><note><p> Adding more than one target group to the array is not supported. </p></note>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTargetGroupInfo *> * _Nullable targetGroupInfoList;

/**
 <p> The target group pair information. This is an array of <code>TargeGroupPairInfo</code> objects with a maximum size of one. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTargetGroupPairInfo *> * _Nullable targetGroupPairInfoList;

@end

/**
 <p>Information about minimum healthy instance.</p>
 */
@interface AWSCodedeployMinimumHealthyHosts : AWSModel


/**
 <p>The minimum healthy instance type:</p><ul><li><p><code>HOST_COUNT</code>: The minimum number of healthy instances as an absolute value.</p></li><li><p><code>FLEET_PERCENT</code>: The minimum number of healthy instances as a percentage of the total number of instances in the deployment.</p></li></ul><p>In an example of nine instances, if a HOST_COUNT of six is specified, deploy to up to three instances at a time. The deployment is successful if six or more instances are deployed to successfully. Otherwise, the deployment fails. If a FLEET_PERCENT of 40 is specified, deploy to up to five instances at a time. The deployment is successful if four or more instances are deployed to successfully. Otherwise, the deployment fails.</p><note><p>In a call to the <code>GetDeploymentConfig</code>, CodeDeployDefault.OneAtATime returns a minimum healthy instance type of MOST_CONCURRENCY and a value of 1. This means a deployment to only one instance at a time. (You cannot set the type to MOST_CONCURRENCY, only to HOST_COUNT or FLEET_PERCENT.) In addition, with CodeDeployDefault.OneAtATime, AWS CodeDeploy attempts to ensure that all instances but one are kept in a healthy state during the deployment. Although this allows one instance at a time to be taken offline for a new deployment, it also means that if the deployment to the last instance fails, the overall deployment is still successful.</p></note><p>For more information, see <a href="https://docs.aws.amazon.com/codedeploy/latest/userguide/instances-health.html">AWS CodeDeploy Instance Health</a> in the <i>AWS CodeDeploy User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSCodedeployMinimumHealthyHostsType types;

/**
 <p>The minimum healthy instance value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>Information about groups of on-premises instance tags.</p>
 */
@interface AWSCodedeployOnPremisesTagSet : AWSModel


/**
 <p>A list that contains other lists of on-premises instance tag groups. For an instance to be included in the deployment group, it must be identified by all of the tag groups in the list.</p>
 */
@property (nonatomic, strong) NSArray<NSArray<AWSCodedeployTagFilter *> *> * _Nullable onPremisesTagSetList;

@end

/**
 
 */
@interface AWSCodedeployPutLifecycleEventHookExecutionStatusInput : AWSRequest


/**
 <p> The unique ID of a deployment. Pass this ID to a Lambda function that validates a deployment lifecycle event. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

/**
 <p> The execution ID of a deployment's lifecycle hook. A deployment lifecycle hook is specified in the <code>hooks</code> section of the AppSpec file. </p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleEventHookExecutionId;

/**
 <p>The result of a Lambda function that validates a deployment lifecycle event (<code>Succeeded</code> or <code>Failed</code>).</p>
 */
@property (nonatomic, assign) AWSCodedeployLifecycleEventStatus status;

@end

/**
 
 */
@interface AWSCodedeployPutLifecycleEventHookExecutionStatusOutput : AWSModel


/**
 <p>The execution ID of the lifecycle event hook. A hook is specified in the <code>hooks</code> section of the deployment's AppSpec file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleEventHookExecutionId;

@end

/**
 <p>A revision for an AWS Lambda deployment that is a YAML-formatted or JSON-formatted string. For AWS Lambda deployments, the revision is the same as the AppSpec file.</p>
 */
@interface AWSCodedeployRawString : AWSModel


/**
 <p>The YAML-formatted or JSON-formatted revision string. It includes information about which Lambda function to update and optional Lambda functions that validate deployment lifecycle events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The SHA256 hash value of the revision content.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sha256;

@end

/**
 <p>Represents the input of a RegisterApplicationRevision operation.</p>
 Required parameters: [applicationName, revision]
 */
@interface AWSCodedeployRegisterApplicationRevisionInput : AWSRequest


/**
 <p>The name of an AWS CodeDeploy application associated with the IAM user or AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>A comment about the revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Information about the application revision to register, including type and location.</p>
 */
@property (nonatomic, strong) AWSCodedeployRevisionLocation * _Nullable revision;

@end

/**
 <p>Represents the input of the register on-premises instance operation.</p>
 Required parameters: [instanceName]
 */
@interface AWSCodedeployRegisterOnPremisesInstanceInput : AWSRequest


/**
 <p>The ARN of the IAM session to associate with the on-premises instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamSessionArn;

/**
 <p>The ARN of the IAM user to associate with the on-premises instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamUserArn;

/**
 <p>The name of the on-premises instance to register.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

@end

/**
 <p>Represents the input of a <code>RemoveTagsFromOnPremisesInstances</code> operation.</p>
 Required parameters: [tags, instanceNames]
 */
@interface AWSCodedeployRemoveTagsFromOnPremisesInstancesInput : AWSRequest


/**
 <p>The names of the on-premises instances from which to remove tags.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceNames;

/**
 <p>The tag key-value pairs to remove from the on-premises instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTag *> * _Nullable tags;

@end

/**
 <p>Information about an application revision.</p>
 */
@interface AWSCodedeployRevisionInfo : AWSModel


/**
 <p>Information about an application revision, including usage details and associated deployment groups.</p>
 */
@property (nonatomic, strong) AWSCodedeployGenericRevisionInfo * _Nullable genericRevisionInfo;

/**
 <p>Information about the location and type of an application revision.</p>
 */
@property (nonatomic, strong) AWSCodedeployRevisionLocation * _Nullable revisionLocation;

@end

/**
 <p>Information about the location of an application revision.</p>
 */
@interface AWSCodedeployRevisionLocation : AWSModel


/**
 <p> The content of an AppSpec file for an AWS Lambda or Amazon ECS deployment. The content is formatted as JSON or YAML and stored as a RawString. </p>
 */
@property (nonatomic, strong) AWSCodedeployAppSpecContent * _Nullable appSpecContent;

/**
 <p>Information about the location of application artifacts stored in GitHub.</p>
 */
@property (nonatomic, strong) AWSCodedeployGitHubLocation * _Nullable gitHubLocation;

/**
 <p>The type of application revision:</p><ul><li><p>S3: An application revision stored in Amazon S3.</p></li><li><p>GitHub: An application revision stored in GitHub (EC2/On-premises deployments only).</p></li><li><p>String: A YAML-formatted or JSON-formatted string (AWS Lambda deployments only).</p></li><li><p>AppSpecContent: An <code>AppSpecContent</code> object that contains the contents of an AppSpec file for an AWS Lambda or Amazon ECS deployment. The content is formatted as JSON or YAML stored as a RawString.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployRevisionLocationType revisionType;

/**
 <p>Information about the location of a revision stored in Amazon S3. </p>
 */
@property (nonatomic, strong) AWSCodedeployS3Location * _Nullable s3Location;

/**
 <p>Information about the location of an AWS Lambda deployment revision stored as a RawString.</p>
 */
@property (nonatomic, strong) AWSCodedeployRawString * _Nullable string;

@end

/**
 <p>Information about a deployment rollback.</p>
 */
@interface AWSCodedeployRollbackInfo : AWSModel


/**
 <p>The ID of the deployment rollback.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rollbackDeploymentId;

/**
 <p>Information that describes the status of a deployment rollback (for example, whether the deployment can't be rolled back, is in progress, failed, or succeeded). </p>
 */
@property (nonatomic, strong) NSString * _Nullable rollbackMessage;

/**
 <p>The deployment ID of the deployment that was underway and triggered a rollback deployment because it failed or was stopped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rollbackTriggeringDeploymentId;

@end

/**
 <p>Information about the location of application artifacts stored in Amazon S3.</p>
 */
@interface AWSCodedeployS3Location : AWSModel


/**
 <p>The name of the Amazon S3 bucket where the application revision is stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The file type of the application revision. Must be one of the following:</p><ul><li><p><code>tar</code>: A tar archive file.</p></li><li><p><code>tgz</code>: A compressed tar archive file.</p></li><li><p><code>zip</code>: A zip archive file.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployBundleType bundleType;

/**
 <p>The ETag of the Amazon S3 object that represents the bundled artifacts for the application revision.</p><p>If the ETag is not specified as an input parameter, ETag validation of the object is skipped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eTag;

/**
 <p>The name of the Amazon S3 object that represents the bundled artifacts for the application revision.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>A specific version of the Amazon S3 object that represents the bundled artifacts for the application revision.</p><p>If the version is not specified, the system uses the most recent version by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSCodedeploySkipWaitTimeForInstanceTerminationInput : AWSRequest


/**
 <p> The unique ID of a blue/green deployment for which you want to skip the instance termination wait time. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

@end

/**
 <p> Represents the input of a <code>StopDeployment</code> operation. </p>
 Required parameters: [deploymentId]
 */
@interface AWSCodedeployStopDeploymentInput : AWSRequest


/**
 <p> Indicates, when a deployment is stopped, whether instances that have been updated should be rolled back to the previous version of the application revision. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoRollbackEnabled;

/**
 <p> The unique ID of a deployment. </p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentId;

@end

/**
 <p> Represents the output of a <code>StopDeployment</code> operation. </p>
 */
@interface AWSCodedeployStopDeploymentOutput : AWSModel


/**
 <p>The status of the stop deployment operation:</p><ul><li><p>Pending: The stop operation is pending.</p></li><li><p>Succeeded: The stop operation was successful.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployStopStatus status;

/**
 <p>An accompanying status message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 <p>Information about a tag.</p>
 */
@interface AWSCodedeployTag : AWSModel


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
 <p>Information about an on-premises instance tag filter.</p>
 */
@interface AWSCodedeployTagFilter : AWSModel


/**
 <p>The on-premises instance tag filter key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The on-premises instance tag filter type:</p><ul><li><p>KEY_ONLY: Key only.</p></li><li><p>VALUE_ONLY: Value only.</p></li><li><p>KEY_AND_VALUE: Key and value.</p></li></ul>
 */
@property (nonatomic, assign) AWSCodedeployTagFilterType types;

/**
 <p>The on-premises instance tag filter value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSCodedeployTagResourceInput : AWSRequest


/**
 <p> The ARN of a resource, such as a CodeDeploy application or deployment group. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p> A list of tags that <code>TagResource</code> associates with a resource. The resource is identified by the <code>ResourceArn</code> input parameter. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSCodedeployTagResourceOutput : AWSModel


@end

/**
 <p>Information about a target group in Elastic Load Balancing to use in a deployment. Instances are registered as targets in a target group, and traffic is routed to the target group.</p>
 */
@interface AWSCodedeployTargetGroupInfo : AWSModel


/**
 <p>For blue/green deployments, the name of the target group that instances in the original environment are deregistered from, and instances in the replacement environment are registered with. For in-place deployments, the name of the target group that instances are deregistered from, so they are not serving traffic during a deployment, and then re-registered with after the deployment is complete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p> Information about two target groups and how traffic is routed during an Amazon ECS deployment. An optional test traffic route can be specified. </p>
 */
@interface AWSCodedeployTargetGroupPairInfo : AWSModel


/**
 <p> The path used by a load balancer to route production traffic when an Amazon ECS deployment is complete. </p>
 */
@property (nonatomic, strong) AWSCodedeployTrafficRoute * _Nullable prodTrafficRoute;

/**
 <p> One pair of target groups. One is associated with the original task set. The second is associated with the task set that serves traffic after the deployment is complete. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTargetGroupInfo *> * _Nullable targetGroups;

/**
 <p> An optional path used by a load balancer to route test traffic after an Amazon ECS deployment. Validation can occur while test traffic is served during a deployment. </p>
 */
@property (nonatomic, strong) AWSCodedeployTrafficRoute * _Nullable testTrafficRoute;

@end

/**
 <p>Information about the instances to be used in the replacement environment in a blue/green deployment.</p>
 */
@interface AWSCodedeployTargetInstances : AWSModel


/**
 <p>The names of one or more Auto Scaling groups to identify a replacement environment for a blue/green deployment.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoScalingGroups;

/**
 <p>Information about the groups of EC2 instance tags that an instance must be identified by in order for it to be included in the replacement environment for a blue/green deployment. Cannot be used in the same call as <code>tagFilters</code>.</p>
 */
@property (nonatomic, strong) AWSCodedeployEC2TagSet * _Nullable ec2TagSet;

/**
 <p>The tag filter key, type, and value used to identify Amazon EC2 instances in a replacement environment for a blue/green deployment. Cannot be used in the same call as <code>ec2TagSet</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployEC2TagFilter *> * _Nullable tagFilters;

@end

/**
 <p>A configuration that shifts traffic from one version of a Lambda function or ECS task set to another in two increments. The original and target Lambda function versions or ECS task sets are specified in the deployment's AppSpec file.</p>
 */
@interface AWSCodedeployTimeBasedCanary : AWSModel


/**
 <p>The number of minutes between the first and second traffic shifts of a <code>TimeBasedCanary</code> deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable canaryInterval;

/**
 <p>The percentage of traffic to shift in the first increment of a <code>TimeBasedCanary</code> deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable canaryPercentage;

@end

/**
 <p>A configuration that shifts traffic from one version of a Lambda function or ECS task set to another in equal increments, with an equal number of minutes between each increment. The original and target Lambda function versions or ECS task sets are specified in the deployment's AppSpec file.</p>
 */
@interface AWSCodedeployTimeBasedLinear : AWSModel


/**
 <p>The number of minutes between each incremental traffic shift of a <code>TimeBasedLinear</code> deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable linearInterval;

/**
 <p>The percentage of traffic that is shifted at the start of each increment of a <code>TimeBasedLinear</code> deployment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable linearPercentage;

@end

/**
 <p>Information about a time range.</p>
 */
@interface AWSCodedeployTimeRange : AWSModel


/**
 <p>The end time of the time range.</p><note><p>Specify null to leave the end time open-ended.</p></note>
 */
@property (nonatomic, strong) NSDate * _Nullable end;

/**
 <p>The start time of the time range.</p><note><p>Specify null to leave the start time open-ended.</p></note>
 */
@property (nonatomic, strong) NSDate * _Nullable start;

@end

/**
 <p> Information about a listener. The listener contains the path used to route traffic that is received from the load balancer to a target group. </p>
 */
@interface AWSCodedeployTrafficRoute : AWSModel


/**
 <p> The Amazon Resource Name (ARN) of one listener. The listener identifies the route between a target group and a load balancer. This is an array of strings with a maximum size of one. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable listenerArns;

@end

/**
 <p>The configuration that specifies how traffic is shifted from one version of a Lambda function to another version during an AWS Lambda deployment, or from one Amazon ECS task set to another during an Amazon ECS deployment.</p>
 */
@interface AWSCodedeployTrafficRoutingConfig : AWSModel


/**
 <p>A configuration that shifts traffic from one version of a Lambda function or ECS task set to another in two increments. The original and target Lambda function versions or ECS task sets are specified in the deployment's AppSpec file.</p>
 */
@property (nonatomic, strong) AWSCodedeployTimeBasedCanary * _Nullable timeBasedCanary;

/**
 <p>A configuration that shifts traffic from one version of a Lambda function or ECS task set to another in equal increments, with an equal number of minutes between each increment. The original and target Lambda function versions or ECS task sets are specified in the deployment's AppSpec file.</p>
 */
@property (nonatomic, strong) AWSCodedeployTimeBasedLinear * _Nullable timeBasedLinear;

/**
 <p>The type of traffic shifting (<code>TimeBasedCanary</code> or <code>TimeBasedLinear</code>) used by a deployment configuration.</p>
 */
@property (nonatomic, assign) AWSCodedeployTrafficRoutingType types;

@end

/**
 <p>Information about notification triggers for the deployment group.</p>
 */
@interface AWSCodedeployTriggerConfig : AWSModel


/**
 <p>The event type or types for which notifications are triggered.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable triggerEvents;

/**
 <p>The name of the notification trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable triggerName;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service topic through which notifications about deployment or instance events are sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable triggerTargetArn;

@end

/**
 
 */
@interface AWSCodedeployUntagResourceInput : AWSRequest


/**
 <p> The Amazon Resource Name (ARN) that specifies from which resource to disassociate the tags with the keys in the <code>TagKeys</code> input parameter. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p> A list of keys of <code>Tag</code> objects. The <code>Tag</code> objects identified by the keys are disassociated from the resource specified by the <code>ResourceArn</code> input parameter. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSCodedeployUntagResourceOutput : AWSModel


@end

/**
 <p>Represents the input of an <code>UpdateApplication</code> operation.</p>
 */
@interface AWSCodedeployUpdateApplicationInput : AWSRequest


/**
 <p>The current name of the application you want to change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>The new name to give the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestApplicationName;

@end

/**
 <p>Represents the input of an <code>UpdateDeploymentGroup</code> operation.</p>
 Required parameters: [applicationName, currentDeploymentGroupName]
 */
@interface AWSCodedeployUpdateDeploymentGroupInput : AWSRequest


/**
 <p>Information to add or change about Amazon CloudWatch alarms when the deployment group is updated.</p>
 */
@property (nonatomic, strong) AWSCodedeployAlarmConfiguration * _Nullable alarmConfiguration;

/**
 <p>The application name that corresponds to the deployment group to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationName;

/**
 <p>Information for an automatic rollback configuration that is added or changed when a deployment group is updated.</p>
 */
@property (nonatomic, strong) AWSCodedeployAutoRollbackConfiguration * _Nullable autoRollbackConfiguration;

/**
 <p>The replacement list of Auto Scaling groups to be included in the deployment group, if you want to change them. To keep the Auto Scaling groups, enter their names. To remove Auto Scaling groups, do not enter any Auto Scaling group names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoScalingGroups;

/**
 <p>Information about blue/green deployment options for a deployment group.</p>
 */
@property (nonatomic, strong) AWSCodedeployBlueGreenDeploymentConfiguration * _Nullable blueGreenDeploymentConfiguration;

/**
 <p>The current name of the deployment group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentDeploymentGroupName;

/**
 <p>The replacement deployment configuration name to use, if you want to change it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deploymentConfigName;

/**
 <p>Information about the type of deployment, either in-place or blue/green, you want to run and whether to route deployment traffic behind a load balancer.</p>
 */
@property (nonatomic, strong) AWSCodedeployDeploymentStyle * _Nullable deploymentStyle;

/**
 <p>The replacement set of Amazon EC2 tags on which to filter, if you want to change them. To keep the existing tags, enter their names. To remove tags, do not enter any tag names.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployEC2TagFilter *> * _Nullable ec2TagFilters;

/**
 <p>Information about groups of tags applied to on-premises instances. The deployment group includes only EC2 instances identified by all the tag groups.</p>
 */
@property (nonatomic, strong) AWSCodedeployEC2TagSet * _Nullable ec2TagSet;

/**
 <p> The target Amazon ECS services in the deployment group. This applies only to deployment groups that use the Amazon ECS compute platform. A target Amazon ECS service is specified as an Amazon ECS cluster and service name pair using the format <code>&lt;clustername&gt;:&lt;servicename&gt;</code>. </p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployECSService *> * _Nullable ecsServices;

/**
 <p>Information about the load balancer used in a deployment.</p>
 */
@property (nonatomic, strong) AWSCodedeployLoadBalancerInfo * _Nullable loadBalancerInfo;

/**
 <p>The new name of the deployment group, if you want to change it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestDeploymentGroupName;

/**
 <p>The replacement set of on-premises instance tags on which to filter, if you want to change them. To keep the existing tags, enter their names. To remove tags, do not enter any tag names.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTagFilter *> * _Nullable onPremisesInstanceTagFilters;

/**
 <p>Information about an on-premises instance tag set. The deployment group includes only on-premises instances identified by all the tag groups.</p>
 */
@property (nonatomic, strong) AWSCodedeployOnPremisesTagSet * _Nullable onPremisesTagSet;

/**
 <p>A replacement ARN for the service role, if you want to change it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRoleArn;

/**
 <p>Information about triggers to change when the deployment group is updated. For examples, see <a href="https://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-notify-edit.html">Edit a Trigger in a CodeDeploy Deployment Group</a> in the <i>AWS CodeDeploy User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployTriggerConfig *> * _Nullable triggerConfigurations;

@end

/**
 <p>Represents the output of an <code>UpdateDeploymentGroup</code> operation.</p>
 */
@interface AWSCodedeployUpdateDeploymentGroupOutput : AWSModel


/**
 <p>If the output contains no data, and the corresponding deployment group contained at least one Auto Scaling group, AWS CodeDeploy successfully removed all corresponding Auto Scaling lifecycle event hooks from the AWS account. If the output contains data, AWS CodeDeploy could not remove some Auto Scaling lifecycle event hooks from the AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSCodedeployAutoScalingGroup *> * _Nullable hooksNotCleanedUp;

@end

NS_ASSUME_NONNULL_END
