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

FOUNDATION_EXPORT NSString *const AWSEmrErrorDomain;

typedef NS_ENUM(NSInteger, AWSEmrErrorType) {
    AWSEmrErrorUnknown,
    AWSEmrErrorInternalServer,
    AWSEmrErrorInternalServer,
    AWSEmrErrorInvalidRequest,
};

typedef NS_ENUM(NSInteger, AWSEmrActionOnFailure) {
    AWSEmrActionOnFailureUnknown,
    AWSEmrActionOnFailureTerminateJobFlow,
    AWSEmrActionOnFailureTerminateCluster,
    AWSEmrActionOnFailureCancelAndWait,
    AWSEmrActionOnFailureContinue,
};

typedef NS_ENUM(NSInteger, AWSEmrAdjustmentType) {
    AWSEmrAdjustmentTypeUnknown,
    AWSEmrAdjustmentTypeChangeInCapacity,
    AWSEmrAdjustmentTypePercentChangeInCapacity,
    AWSEmrAdjustmentTypeExactCapacity,
};

typedef NS_ENUM(NSInteger, AWSEmrAutoScalingPolicyState) {
    AWSEmrAutoScalingPolicyStateUnknown,
    AWSEmrAutoScalingPolicyStatePending,
    AWSEmrAutoScalingPolicyStateAttaching,
    AWSEmrAutoScalingPolicyStateAttached,
    AWSEmrAutoScalingPolicyStateDetaching,
    AWSEmrAutoScalingPolicyStateDetached,
    AWSEmrAutoScalingPolicyStateFailed,
};

typedef NS_ENUM(NSInteger, AWSEmrAutoScalingPolicyStateChangeReasonCode) {
    AWSEmrAutoScalingPolicyStateChangeReasonCodeUnknown,
    AWSEmrAutoScalingPolicyStateChangeReasonCodeUserRequest,
    AWSEmrAutoScalingPolicyStateChangeReasonCodeProvisionFailure,
    AWSEmrAutoScalingPolicyStateChangeReasonCodeCleanupFailure,
};

typedef NS_ENUM(NSInteger, AWSEmrCancelStepsRequestStatus) {
    AWSEmrCancelStepsRequestStatusUnknown,
    AWSEmrCancelStepsRequestStatusSubmitted,
    AWSEmrCancelStepsRequestStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSEmrClusterState) {
    AWSEmrClusterStateUnknown,
    AWSEmrClusterStateStarting,
    AWSEmrClusterStateBootstrapping,
    AWSEmrClusterStateRunning,
    AWSEmrClusterStateWaiting,
    AWSEmrClusterStateTerminating,
    AWSEmrClusterStateTerminated,
    AWSEmrClusterStateTerminatedWithErrors,
};

typedef NS_ENUM(NSInteger, AWSEmrClusterStateChangeReasonCode) {
    AWSEmrClusterStateChangeReasonCodeUnknown,
    AWSEmrClusterStateChangeReasonCodeInternalError,
    AWSEmrClusterStateChangeReasonCodeValidationError,
    AWSEmrClusterStateChangeReasonCodeInstanceFailure,
    AWSEmrClusterStateChangeReasonCodeInstanceFleetTimeout,
    AWSEmrClusterStateChangeReasonCodeBootstrapFailure,
    AWSEmrClusterStateChangeReasonCodeUserRequest,
    AWSEmrClusterStateChangeReasonCodeStepFailure,
    AWSEmrClusterStateChangeReasonCodeAllStepsCompleted,
};

typedef NS_ENUM(NSInteger, AWSEmrComparisonOperator) {
    AWSEmrComparisonOperatorUnknown,
    AWSEmrComparisonOperatorGreaterThanOrEqual,
    AWSEmrComparisonOperatorGreaterThan,
    AWSEmrComparisonOperatorLessThan,
    AWSEmrComparisonOperatorLessThanOrEqual,
};

typedef NS_ENUM(NSInteger, AWSEmrComputeLimitsUnitType) {
    AWSEmrComputeLimitsUnitTypeUnknown,
    AWSEmrComputeLimitsUnitTypeInstanceFleetUnits,
    AWSEmrComputeLimitsUnitTypeInstances,
    AWSEmrComputeLimitsUnitTypeVcpu,
};

typedef NS_ENUM(NSInteger, AWSEmrInstanceCollectionType) {
    AWSEmrInstanceCollectionTypeUnknown,
    AWSEmrInstanceCollectionTypeInstanceFleet,
    AWSEmrInstanceCollectionTypeInstanceGroup,
};

typedef NS_ENUM(NSInteger, AWSEmrInstanceFleetState) {
    AWSEmrInstanceFleetStateUnknown,
    AWSEmrInstanceFleetStateProvisioning,
    AWSEmrInstanceFleetStateBootstrapping,
    AWSEmrInstanceFleetStateRunning,
    AWSEmrInstanceFleetStateResizing,
    AWSEmrInstanceFleetStateSuspended,
    AWSEmrInstanceFleetStateTerminating,
    AWSEmrInstanceFleetStateTerminated,
};

typedef NS_ENUM(NSInteger, AWSEmrInstanceFleetStateChangeReasonCode) {
    AWSEmrInstanceFleetStateChangeReasonCodeUnknown,
    AWSEmrInstanceFleetStateChangeReasonCodeInternalError,
    AWSEmrInstanceFleetStateChangeReasonCodeValidationError,
    AWSEmrInstanceFleetStateChangeReasonCodeInstanceFailure,
    AWSEmrInstanceFleetStateChangeReasonCodeClusterTerminated,
};

typedef NS_ENUM(NSInteger, AWSEmrInstanceFleetType) {
    AWSEmrInstanceFleetTypeUnknown,
    AWSEmrInstanceFleetTypeMaster,
    AWSEmrInstanceFleetTypeCore,
    AWSEmrInstanceFleetTypeTask,
};

typedef NS_ENUM(NSInteger, AWSEmrInstanceGroupState) {
    AWSEmrInstanceGroupStateUnknown,
    AWSEmrInstanceGroupStateProvisioning,
    AWSEmrInstanceGroupStateBootstrapping,
    AWSEmrInstanceGroupStateRunning,
    AWSEmrInstanceGroupStateReconfiguring,
    AWSEmrInstanceGroupStateResizing,
    AWSEmrInstanceGroupStateSuspended,
    AWSEmrInstanceGroupStateTerminating,
    AWSEmrInstanceGroupStateTerminated,
    AWSEmrInstanceGroupStateArrested,
    AWSEmrInstanceGroupStateShuttingDown,
    AWSEmrInstanceGroupStateEnded,
};

typedef NS_ENUM(NSInteger, AWSEmrInstanceGroupStateChangeReasonCode) {
    AWSEmrInstanceGroupStateChangeReasonCodeUnknown,
    AWSEmrInstanceGroupStateChangeReasonCodeInternalError,
    AWSEmrInstanceGroupStateChangeReasonCodeValidationError,
    AWSEmrInstanceGroupStateChangeReasonCodeInstanceFailure,
    AWSEmrInstanceGroupStateChangeReasonCodeClusterTerminated,
};

typedef NS_ENUM(NSInteger, AWSEmrInstanceGroupType) {
    AWSEmrInstanceGroupTypeUnknown,
    AWSEmrInstanceGroupTypeMaster,
    AWSEmrInstanceGroupTypeCore,
    AWSEmrInstanceGroupTypeTask,
};

typedef NS_ENUM(NSInteger, AWSEmrInstanceRoleType) {
    AWSEmrInstanceRoleTypeUnknown,
    AWSEmrInstanceRoleTypeMaster,
    AWSEmrInstanceRoleTypeCore,
    AWSEmrInstanceRoleTypeTask,
};

typedef NS_ENUM(NSInteger, AWSEmrInstanceState) {
    AWSEmrInstanceStateUnknown,
    AWSEmrInstanceStateAwaitingFulfillment,
    AWSEmrInstanceStateProvisioning,
    AWSEmrInstanceStateBootstrapping,
    AWSEmrInstanceStateRunning,
    AWSEmrInstanceStateTerminated,
};

typedef NS_ENUM(NSInteger, AWSEmrInstanceStateChangeReasonCode) {
    AWSEmrInstanceStateChangeReasonCodeUnknown,
    AWSEmrInstanceStateChangeReasonCodeInternalError,
    AWSEmrInstanceStateChangeReasonCodeValidationError,
    AWSEmrInstanceStateChangeReasonCodeInstanceFailure,
    AWSEmrInstanceStateChangeReasonCodeBootstrapFailure,
    AWSEmrInstanceStateChangeReasonCodeClusterTerminated,
};

typedef NS_ENUM(NSInteger, AWSEmrJobFlowExecutionState) {
    AWSEmrJobFlowExecutionStateUnknown,
    AWSEmrJobFlowExecutionStateStarting,
    AWSEmrJobFlowExecutionStateBootstrapping,
    AWSEmrJobFlowExecutionStateRunning,
    AWSEmrJobFlowExecutionStateWaiting,
    AWSEmrJobFlowExecutionStateShuttingDown,
    AWSEmrJobFlowExecutionStateTerminated,
    AWSEmrJobFlowExecutionStateCompleted,
    AWSEmrJobFlowExecutionStateFailed,
};

typedef NS_ENUM(NSInteger, AWSEmrMarketType) {
    AWSEmrMarketTypeUnknown,
    AWSEmrMarketTypeOnDemand,
    AWSEmrMarketTypeSpot,
};

typedef NS_ENUM(NSInteger, AWSEmrRepoUpgradeOnBoot) {
    AWSEmrRepoUpgradeOnBootUnknown,
    AWSEmrRepoUpgradeOnBootSecurity,
    AWSEmrRepoUpgradeOnBootNone,
};

typedef NS_ENUM(NSInteger, AWSEmrScaleDownBehavior) {
    AWSEmrScaleDownBehaviorUnknown,
    AWSEmrScaleDownBehaviorTerminateAtInstanceHour,
    AWSEmrScaleDownBehaviorTerminateAtTaskCompletion,
};

typedef NS_ENUM(NSInteger, AWSEmrSpotProvisioningTimeoutAction) {
    AWSEmrSpotProvisioningTimeoutActionUnknown,
    AWSEmrSpotProvisioningTimeoutActionSwitchToOnDemand,
    AWSEmrSpotProvisioningTimeoutActionTerminateCluster,
};

typedef NS_ENUM(NSInteger, AWSEmrStatistic) {
    AWSEmrStatisticUnknown,
    AWSEmrStatisticSampleCount,
    AWSEmrStatisticAverage,
    AWSEmrStatisticSum,
    AWSEmrStatisticMinimum,
    AWSEmrStatisticMaximum,
};

typedef NS_ENUM(NSInteger, AWSEmrStepCancellationOption) {
    AWSEmrStepCancellationOptionUnknown,
    AWSEmrStepCancellationOptionSendInterrupt,
    AWSEmrStepCancellationOptionTerminateProcess,
};

typedef NS_ENUM(NSInteger, AWSEmrStepExecutionState) {
    AWSEmrStepExecutionStateUnknown,
    AWSEmrStepExecutionStatePending,
    AWSEmrStepExecutionStateRunning,
    AWSEmrStepExecutionStateContinue,
    AWSEmrStepExecutionStateCompleted,
    AWSEmrStepExecutionStateCancelled,
    AWSEmrStepExecutionStateFailed,
    AWSEmrStepExecutionStateInterrupted,
};

typedef NS_ENUM(NSInteger, AWSEmrStepState) {
    AWSEmrStepStateUnknown,
    AWSEmrStepStatePending,
    AWSEmrStepStateCancelPending,
    AWSEmrStepStateRunning,
    AWSEmrStepStateCompleted,
    AWSEmrStepStateCancelled,
    AWSEmrStepStateFailed,
    AWSEmrStepStateInterrupted,
};

typedef NS_ENUM(NSInteger, AWSEmrStepStateChangeReasonCode) {
    AWSEmrStepStateChangeReasonCodeUnknown,
    AWSEmrStepStateChangeReasonCodeNone,
};

typedef NS_ENUM(NSInteger, AWSEmrUnit) {
    AWSEmrUnitUnknown,
    AWSEmrUnitNone,
    AWSEmrUnitSeconds,
    AWSEmrUnitMicroSeconds,
    AWSEmrUnitMilliSeconds,
    AWSEmrUnitBytes,
    AWSEmrUnitKiloBytes,
    AWSEmrUnitMegaBytes,
    AWSEmrUnitGigaBytes,
    AWSEmrUnitTeraBytes,
    AWSEmrUnitBits,
    AWSEmrUnitKiloBits,
    AWSEmrUnitMegaBits,
    AWSEmrUnitGigaBits,
    AWSEmrUnitTeraBits,
    AWSEmrUnitPercent,
    AWSEmrUnitCount,
    AWSEmrUnitBytesPerSecond,
    AWSEmrUnitKiloBytesPerSecond,
    AWSEmrUnitMegaBytesPerSecond,
    AWSEmrUnitGigaBytesPerSecond,
    AWSEmrUnitTeraBytesPerSecond,
    AWSEmrUnitBitsPerSecond,
    AWSEmrUnitKiloBitsPerSecond,
    AWSEmrUnitMegaBitsPerSecond,
    AWSEmrUnitGigaBitsPerSecond,
    AWSEmrUnitTeraBitsPerSecond,
    AWSEmrUnitCountPerSecond,
};

@class AWSEmrAddInstanceFleetInput;
@class AWSEmrAddInstanceFleetOutput;
@class AWSEmrAddInstanceGroupsInput;
@class AWSEmrAddInstanceGroupsOutput;
@class AWSEmrAddJobFlowStepsInput;
@class AWSEmrAddJobFlowStepsOutput;
@class AWSEmrAddTagsInput;
@class AWSEmrAddTagsOutput;
@class AWSEmrApplication;
@class AWSEmrAutoScalingPolicy;
@class AWSEmrAutoScalingPolicyDescription;
@class AWSEmrAutoScalingPolicyStateChangeReason;
@class AWSEmrAutoScalingPolicyStatus;
@class AWSEmrBlockPublicAccessConfiguration;
@class AWSEmrBlockPublicAccessConfigurationMetadata;
@class AWSEmrBootstrapActionConfig;
@class AWSEmrBootstrapActionDetail;
@class AWSEmrCancelStepsInfo;
@class AWSEmrCancelStepsInput;
@class AWSEmrCancelStepsOutput;
@class AWSEmrCloudWatchAlarmDefinition;
@class AWSEmrCluster;
@class AWSEmrClusterStateChangeReason;
@class AWSEmrClusterStatus;
@class AWSEmrClusterSummary;
@class AWSEmrClusterTimeline;
@class AWSEmrCommand;
@class AWSEmrComputeLimits;
@class AWSEmrConfiguration;
@class AWSEmrCreateSecurityConfigurationInput;
@class AWSEmrCreateSecurityConfigurationOutput;
@class AWSEmrDeleteSecurityConfigurationInput;
@class AWSEmrDeleteSecurityConfigurationOutput;
@class AWSEmrDescribeClusterInput;
@class AWSEmrDescribeClusterOutput;
@class AWSEmrDescribeJobFlowsInput;
@class AWSEmrDescribeJobFlowsOutput;
@class AWSEmrDescribeSecurityConfigurationInput;
@class AWSEmrDescribeSecurityConfigurationOutput;
@class AWSEmrDescribeStepInput;
@class AWSEmrDescribeStepOutput;
@class AWSEmrEbsBlockDevice;
@class AWSEmrEbsBlockDeviceConfig;
@class AWSEmrEbsConfiguration;
@class AWSEmrEbsVolume;
@class AWSEmrEc2InstanceAttributes;
@class AWSEmrFailureDetails;
@class AWSEmrGetBlockPublicAccessConfigurationInput;
@class AWSEmrGetBlockPublicAccessConfigurationOutput;
@class AWSEmrGetManagedScalingPolicyInput;
@class AWSEmrGetManagedScalingPolicyOutput;
@class AWSEmrHadoopJarStepConfig;
@class AWSEmrHadoopStepConfig;
@class AWSEmrInstance;
@class AWSEmrInstanceFleet;
@class AWSEmrInstanceFleetConfig;
@class AWSEmrInstanceFleetModifyConfig;
@class AWSEmrInstanceFleetProvisioningSpecifications;
@class AWSEmrInstanceFleetStateChangeReason;
@class AWSEmrInstanceFleetStatus;
@class AWSEmrInstanceFleetTimeline;
@class AWSEmrInstanceGroup;
@class AWSEmrInstanceGroupConfig;
@class AWSEmrInstanceGroupDetail;
@class AWSEmrInstanceGroupModifyConfig;
@class AWSEmrInstanceGroupStateChangeReason;
@class AWSEmrInstanceGroupStatus;
@class AWSEmrInstanceGroupTimeline;
@class AWSEmrInstanceResizePolicy;
@class AWSEmrInstanceStateChangeReason;
@class AWSEmrInstanceStatus;
@class AWSEmrInstanceTimeline;
@class AWSEmrInstanceTypeConfig;
@class AWSEmrInstanceTypeSpecification;
@class AWSEmrJobFlowDetail;
@class AWSEmrJobFlowExecutionStatusDetail;
@class AWSEmrJobFlowInstancesConfig;
@class AWSEmrJobFlowInstancesDetail;
@class AWSEmrKerberosAttributes;
@class AWSEmrKeyValue;
@class AWSEmrListBootstrapActionsInput;
@class AWSEmrListBootstrapActionsOutput;
@class AWSEmrListClustersInput;
@class AWSEmrListClustersOutput;
@class AWSEmrListInstanceFleetsInput;
@class AWSEmrListInstanceFleetsOutput;
@class AWSEmrListInstanceGroupsInput;
@class AWSEmrListInstanceGroupsOutput;
@class AWSEmrListInstancesInput;
@class AWSEmrListInstancesOutput;
@class AWSEmrListSecurityConfigurationsInput;
@class AWSEmrListSecurityConfigurationsOutput;
@class AWSEmrListStepsInput;
@class AWSEmrListStepsOutput;
@class AWSEmrManagedScalingPolicy;
@class AWSEmrMetricDimension;
@class AWSEmrModifyClusterInput;
@class AWSEmrModifyClusterOutput;
@class AWSEmrModifyInstanceFleetInput;
@class AWSEmrModifyInstanceGroupsInput;
@class AWSEmrPlacementType;
@class AWSEmrPortRange;
@class AWSEmrPutAutoScalingPolicyInput;
@class AWSEmrPutAutoScalingPolicyOutput;
@class AWSEmrPutBlockPublicAccessConfigurationInput;
@class AWSEmrPutBlockPublicAccessConfigurationOutput;
@class AWSEmrPutManagedScalingPolicyInput;
@class AWSEmrPutManagedScalingPolicyOutput;
@class AWSEmrRemoveAutoScalingPolicyInput;
@class AWSEmrRemoveAutoScalingPolicyOutput;
@class AWSEmrRemoveManagedScalingPolicyInput;
@class AWSEmrRemoveManagedScalingPolicyOutput;
@class AWSEmrRemoveTagsInput;
@class AWSEmrRemoveTagsOutput;
@class AWSEmrRunJobFlowInput;
@class AWSEmrRunJobFlowOutput;
@class AWSEmrScalingAction;
@class AWSEmrScalingConstraints;
@class AWSEmrScalingRule;
@class AWSEmrScalingTrigger;
@class AWSEmrScriptBootstrapActionConfig;
@class AWSEmrSecurityConfigurationSummary;
@class AWSEmrSetTerminationProtectionInput;
@class AWSEmrSetVisibleToAllUsersInput;
@class AWSEmrShrinkPolicy;
@class AWSEmrSimpleScalingPolicyConfiguration;
@class AWSEmrSpotProvisioningSpecification;
@class AWSEmrStep;
@class AWSEmrStepConfig;
@class AWSEmrStepDetail;
@class AWSEmrStepExecutionStatusDetail;
@class AWSEmrStepStateChangeReason;
@class AWSEmrStepStatus;
@class AWSEmrStepSummary;
@class AWSEmrStepTimeline;
@class AWSEmrSupportedProductConfig;
@class AWSEmrTag;
@class AWSEmrTerminateJobFlowsInput;
@class AWSEmrVolumeSpecification;

/**
 
 */
@interface AWSEmrAddInstanceFleetInput : AWSRequest


/**
 <p>The unique identifier of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>Specifies the configuration of the instance fleet.</p>
 */
@property (nonatomic, strong) AWSEmrInstanceFleetConfig * _Nullable instanceFleet;

@end

/**
 
 */
@interface AWSEmrAddInstanceFleetOutput : AWSModel


/**
 <p>The Amazon Resource Name of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
 <p>The unique identifier of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The unique identifier of the instance fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceFleetId;

@end

/**
 <p>Input to an AddInstanceGroups call.</p>
 Required parameters: [InstanceGroups, JobFlowId]
 */
@interface AWSEmrAddInstanceGroupsInput : AWSRequest


/**
 <p>Instance groups to add.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrInstanceGroupConfig *> * _Nullable instanceGroups;

/**
 <p>Job flow in which to add the instance groups.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobFlowId;

@end

/**
 <p>Output from an AddInstanceGroups call.</p>
 */
@interface AWSEmrAddInstanceGroupsOutput : AWSModel


/**
 <p>The Amazon Resource Name of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
 <p>Instance group IDs of the newly created instance groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceGroupIds;

/**
 <p>The job flow ID in which the instance groups are added.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobFlowId;

@end

/**
 <p> The input argument to the <a>AddJobFlowSteps</a> operation. </p>
 Required parameters: [JobFlowId, Steps]
 */
@interface AWSEmrAddJobFlowStepsInput : AWSRequest


/**
 <p>A string that uniquely identifies the job flow. This identifier is returned by <a>RunJobFlow</a> and can also be obtained from <a>ListClusters</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable jobFlowId;

/**
 <p> A list of <a>StepConfig</a> to be executed by the job flow. </p>
 */
@property (nonatomic, strong) NSArray<AWSEmrStepConfig *> * _Nullable steps;

@end

/**
 <p> The output for the <a>AddJobFlowSteps</a> operation. </p>
 */
@interface AWSEmrAddJobFlowStepsOutput : AWSModel


/**
 <p>The identifiers of the list of steps added to the job flow.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stepIds;

@end

/**
 <p>This input identifies a cluster and a list of tags to attach.</p>
 Required parameters: [ResourceId, Tags]
 */
@interface AWSEmrAddTagsInput : AWSRequest


/**
 <p>The Amazon EMR resource identifier to which tags will be added. This value must be a cluster identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>A list of tags to associate with a cluster and propagate to EC2 instances. Tags are user-defined key/value pairs that consist of a required key string with a maximum of 128 characters, and an optional value string with a maximum of 256 characters.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrTag *> * _Nullable tags;

@end

/**
 <p>This output indicates the result of adding tags to a resource.</p>
 */
@interface AWSEmrAddTagsOutput : AWSModel


@end

/**
 <p>With Amazon EMR release version 4.0 and later, the only accepted parameter is the application name. To pass arguments to applications, you use configuration classifications specified using configuration JSON objects. For more information, see <a href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html">Configuring Applications</a>.</p><p>With earlier Amazon EMR releases, the application is any Amazon or third-party software that you can add to the cluster. This structure contains a list of strings that indicates the software to use with the cluster and accepts a user argument list. Amazon EMR accepts and forwards the argument list to the corresponding installation script as bootstrap action argument.</p>
 */
@interface AWSEmrApplication : AWSModel


/**
 <p>This option is for advanced users only. This is meta information about third-party applications that third-party vendors use for testing purposes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable additionalInfo;

/**
 <p>Arguments for Amazon EMR to pass to the application.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable args;

/**
 <p>The name of the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version of the application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>An automatic scaling policy for a core instance group or task instance group in an Amazon EMR cluster. An automatic scaling policy defines how an instance group dynamically adds and terminates EC2 instances in response to the value of a CloudWatch metric. See <a>PutAutoScalingPolicy</a>.</p>
 Required parameters: [Constraints, Rules]
 */
@interface AWSEmrAutoScalingPolicy : AWSModel


/**
 <p>The upper and lower EC2 instance limits for an automatic scaling policy. Automatic scaling activity will not cause an instance group to grow above or below these limits.</p>
 */
@property (nonatomic, strong) AWSEmrScalingConstraints * _Nullable constraints;

/**
 <p>The scale-in and scale-out rules that comprise the automatic scaling policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrScalingRule *> * _Nullable rules;

@end

/**
 <p>An automatic scaling policy for a core instance group or task instance group in an Amazon EMR cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates EC2 instances in response to the value of a CloudWatch metric. See <a>PutAutoScalingPolicy</a>.</p>
 */
@interface AWSEmrAutoScalingPolicyDescription : AWSModel


/**
 <p>The upper and lower EC2 instance limits for an automatic scaling policy. Automatic scaling activity will not cause an instance group to grow above or below these limits.</p>
 */
@property (nonatomic, strong) AWSEmrScalingConstraints * _Nullable constraints;

/**
 <p>The scale-in and scale-out rules that comprise the automatic scaling policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrScalingRule *> * _Nullable rules;

/**
 <p>The status of an automatic scaling policy. </p>
 */
@property (nonatomic, strong) AWSEmrAutoScalingPolicyStatus * _Nullable status;

@end

/**
 <p>The reason for an <a>AutoScalingPolicyStatus</a> change.</p>
 */
@interface AWSEmrAutoScalingPolicyStateChangeReason : AWSModel


/**
 <p>The code indicating the reason for the change in status.<code>USER_REQUEST</code> indicates that the scaling policy status was changed by a user. <code>PROVISION_FAILURE</code> indicates that the status change was because the policy failed to provision. <code>CLEANUP_FAILURE</code> indicates an error.</p>
 */
@property (nonatomic, assign) AWSEmrAutoScalingPolicyStateChangeReasonCode code;

/**
 <p>A friendly, more verbose message that accompanies an automatic scaling policy state change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>The status of an automatic scaling policy. </p>
 */
@interface AWSEmrAutoScalingPolicyStatus : AWSModel


/**
 <p>Indicates the status of the automatic scaling policy.</p>
 */
@property (nonatomic, assign) AWSEmrAutoScalingPolicyState state;

/**
 <p>The reason for a change in status.</p>
 */
@property (nonatomic, strong) AWSEmrAutoScalingPolicyStateChangeReason * _Nullable stateChangeReason;

@end

/**
 <p>A configuration for Amazon EMR block public access. When <code>BlockPublicSecurityGroupRules</code> is set to <code>true</code>, Amazon EMR prevents cluster creation if one of the cluster's security groups has a rule that allows inbound traffic from 0.0.0.0/0 or ::/0 on a port, unless the port is specified as an exception using <code>PermittedPublicSecurityGroupRuleRanges</code>.</p>
 Required parameters: [BlockPublicSecurityGroupRules]
 */
@interface AWSEmrBlockPublicAccessConfiguration : AWSModel


/**
 <p>Indicates whether EMR block public access is enabled (<code>true</code>) or disabled (<code>false</code>). By default, the value is <code>false</code> for accounts that have created EMR clusters before July 2019. For accounts created after this, the default is <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable blockPublicSecurityGroupRules;

/**
 <p>Specifies ports and port ranges that are permitted to have security group rules that allow inbound traffic from all public sources. For example, if Port 23 (Telnet) is specified for <code>PermittedPublicSecurityGroupRuleRanges</code>, Amazon EMR allows cluster creation if a security group associated with the cluster has a rule that allows inbound traffic on Port 23 from IPv4 0.0.0.0/0 or IPv6 port ::/0 as the source.</p><p>By default, Port 22, which is used for SSH access to the cluster EC2 instances, is in the list of <code>PermittedPublicSecurityGroupRuleRanges</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrPortRange *> * _Nullable permittedPublicSecurityGroupRuleRanges;

@end

/**
 <p>Properties that describe the AWS principal that created the <code>BlockPublicAccessConfiguration</code> using the <code>PutBlockPublicAccessConfiguration</code> action as well as the date and time that the configuration was created. Each time a configuration for block public access is updated, Amazon EMR updates this metadata.</p>
 Required parameters: [CreationDateTime, CreatedByArn]
 */
@interface AWSEmrBlockPublicAccessConfigurationMetadata : AWSModel


/**
 <p>The Amazon Resource Name that created or last modified the configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdByArn;

/**
 <p>The date and time that the configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

@end

/**
 <p>Configuration of a bootstrap action.</p>
 Required parameters: [Name, ScriptBootstrapAction]
 */
@interface AWSEmrBootstrapActionConfig : AWSModel


/**
 <p>The name of the bootstrap action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The script run by the bootstrap action.</p>
 */
@property (nonatomic, strong) AWSEmrScriptBootstrapActionConfig * _Nullable scriptBootstrapAction;

@end

/**
 <p>Reports the configuration of a bootstrap action in a cluster (job flow).</p>
 */
@interface AWSEmrBootstrapActionDetail : AWSModel


/**
 <p>A description of the bootstrap action.</p>
 */
@property (nonatomic, strong) AWSEmrBootstrapActionConfig * _Nullable bootstrapActionConfig;

@end

/**
 <p>Specification of the status of a CancelSteps request. Available only in Amazon EMR version 4.8.0 and later, excluding version 5.0.0.</p>
 */
@interface AWSEmrCancelStepsInfo : AWSModel


/**
 <p>The reason for the failure if the CancelSteps request fails.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reason;

/**
 <p>The status of a CancelSteps Request. The value may be SUBMITTED or FAILED.</p>
 */
@property (nonatomic, assign) AWSEmrCancelStepsRequestStatus status;

/**
 <p>The encrypted StepId of a step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stepId;

@end

/**
 <p>The input argument to the <a>CancelSteps</a> operation.</p>
 Required parameters: [ClusterId, StepIds]
 */
@interface AWSEmrCancelStepsInput : AWSRequest


/**
 <p>The <code>ClusterID</code> for which specified steps will be canceled. Use <a>RunJobFlow</a> and <a>ListClusters</a> to get ClusterIDs. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The option to choose for cancelling <code>RUNNING</code> steps. By default, the value is <code>SEND_INTERRUPT</code>.</p>
 */
@property (nonatomic, assign) AWSEmrStepCancellationOption stepCancellationOption;

/**
 <p>The list of <code>StepIDs</code> to cancel. Use <a>ListSteps</a> to get steps and their states for the specified cluster.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stepIds;

@end

/**
 <p> The output for the <a>CancelSteps</a> operation. </p>
 */
@interface AWSEmrCancelStepsOutput : AWSModel


/**
 <p>A list of <a>CancelStepsInfo</a>, which shows the status of specified cancel requests for each <code>StepID</code> specified.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrCancelStepsInfo *> * _Nullable cancelStepsInfoList;

@end

/**
 <p>The definition of a CloudWatch metric alarm, which determines when an automatic scaling activity is triggered. When the defined alarm conditions are satisfied, scaling activity begins.</p>
 Required parameters: [ComparisonOperator, MetricName, Period, Threshold]
 */
@interface AWSEmrCloudWatchAlarmDefinition : AWSModel


/**
 <p>Determines how the metric specified by <code>MetricName</code> is compared to the value specified by <code>Threshold</code>.</p>
 */
@property (nonatomic, assign) AWSEmrComparisonOperator comparisonOperator;

/**
 <p>A CloudWatch metric dimension.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrMetricDimension *> * _Nullable dimensions;

/**
 <p>The number of periods, in five-minute increments, during which the alarm condition must exist before the alarm triggers automatic scaling activity. The default value is <code>1</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationPeriods;

/**
 <p>The name of the CloudWatch metric that is watched to determine an alarm condition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace for the CloudWatch metric. The default is <code>AWS/ElasticMapReduce</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The period, in seconds, over which the statistic is applied. EMR CloudWatch metrics are emitted every five minutes (300 seconds), so if an EMR CloudWatch metric is specified, specify <code>300</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The statistic to apply to the metric associated with the alarm. The default is <code>AVERAGE</code>.</p>
 */
@property (nonatomic, assign) AWSEmrStatistic statistic;

/**
 <p>The value against which the specified statistic is compared.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable threshold;

/**
 <p>The unit of measure associated with the CloudWatch metric being watched. The value specified for <code>Unit</code> must correspond to the units specified in the CloudWatch metric.</p>
 */
@property (nonatomic, assign) AWSEmrUnit unit;

@end

/**
 <p>The detailed description of the cluster.</p>
 */
@interface AWSEmrCluster : AWSModel


/**
 <p>The applications installed on this cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrApplication *> * _Nullable applications;

/**
 <p>An IAM role for automatic scaling policies. The default role is <code>EMR_AutoScaling_DefaultRole</code>. The IAM role provides permissions that the automatic scaling feature requires to launch and terminate EC2 instances in an instance group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingRole;

/**
 <p>Specifies whether the cluster should terminate after completing all steps.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoTerminate;

/**
 <p>The Amazon Resource Name of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
 <p>Applies only to Amazon EMR releases 4.x and later. The list of Configurations supplied to the EMR cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrConfiguration *> * _Nullable configurations;

/**
 <p>Available only in Amazon EMR version 5.7.0 and later. The ID of a custom Amazon EBS-backed Linux AMI if the cluster uses a custom AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customAmiId;

/**
 <p>The size, in GiB, of the EBS root device volume of the Linux AMI that is used for each EC2 instance. Available in Amazon EMR version 4.x and later.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsRootVolumeSize;

/**
 <p>Provides information about the EC2 instances in a cluster grouped by category. For example, key name, subnet ID, IAM instance profile, and so on.</p>
 */
@property (nonatomic, strong) AWSEmrEc2InstanceAttributes * _Nullable ec2InstanceAttributes;

/**
 <p>The unique identifier for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note><p>The instance group configuration of the cluster. A value of <code>INSTANCE_GROUP</code> indicates a uniform instance group configuration. A value of <code>INSTANCE_FLEET</code> indicates an instance fleets configuration.</p>
 */
@property (nonatomic, assign) AWSEmrInstanceCollectionType instanceCollectionType;

/**
 <p>Attributes for Kerberos configuration when Kerberos authentication is enabled using a security configuration. For more information see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html">Use Kerberos Authentication</a> in the <i>EMR Management Guide</i>.</p>
 */
@property (nonatomic, strong) AWSEmrKerberosAttributes * _Nullable kerberosAttributes;

/**
 <p> The AWS KMS customer master key (CMK) used for encrypting log files. This attribute is only available with EMR version 5.30.0 and later, excluding EMR 6.0.0. </p>
 */
@property (nonatomic, strong) NSString * _Nullable logEncryptionKmsKeyId;

/**
 <p>The path to the Amazon S3 location where logs for this cluster are stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logUri;

/**
 <p>The DNS name of the master node. If the cluster is on a private subnet, this is the private DNS name. On a public subnet, this is the public DNS name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterPublicDnsName;

/**
 <p>The name of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An approximation of the cost of the cluster, represented in m1.small/hours. This value is incremented one time for every hour an m1.small instance runs. Larger instances are weighted more, so an EC2 instance that is roughly four times more expensive would result in the normalized instance hours being incremented by four. This result is only an approximation and does not reflect the actual billing rate.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable normalizedInstanceHours;

/**
 <p> The Amazon Resource Name (ARN) of the Outpost where the cluster is launched. </p>
 */
@property (nonatomic, strong) NSString * _Nullable outpostArn;

/**
 <p>The Amazon EMR release label, which determines the version of open-source application packages installed on the cluster. Release labels are in the form <code>emr-x.x.x</code>, where x.x.x is an Amazon EMR release version such as <code>emr-5.14.0</code>. For more information about Amazon EMR release versions and included application versions and features, see <a href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/">https://docs.aws.amazon.com/emr/latest/ReleaseGuide/</a>. The release label applies only to Amazon EMR releases version 4.0 and later. Earlier versions use <code>AmiVersion</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable releaseLabel;

/**
 <p>Applies only when <code>CustomAmiID</code> is used. Specifies the type of updates that are applied from the Amazon Linux AMI package repositories when an instance boots using the AMI.</p>
 */
@property (nonatomic, assign) AWSEmrRepoUpgradeOnBoot repoUpgradeOnBoot;

/**
 <p>The AMI version requested for this cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestedAmiVersion;

/**
 <p>The AMI version running on this cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable runningAmiVersion;

/**
 <p>The way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or an instance group is resized. <code>TERMINATE_AT_INSTANCE_HOUR</code> indicates that Amazon EMR terminates nodes at the instance-hour boundary, regardless of when the request to terminate the instance was submitted. This option is only available with Amazon EMR 5.1.0 and later and is the default for clusters created using that version. <code>TERMINATE_AT_TASK_COMPLETION</code> indicates that Amazon EMR blacklists and drains tasks from nodes before terminating the Amazon EC2 instances, regardless of the instance-hour boundary. With either behavior, Amazon EMR removes the least active nodes first and blocks instance termination if it could lead to HDFS corruption. <code>TERMINATE_AT_TASK_COMPLETION</code> is available only in Amazon EMR version 4.1.0 and later, and is the default for versions of Amazon EMR earlier than 5.1.0.</p>
 */
@property (nonatomic, assign) AWSEmrScaleDownBehavior scaleDownBehavior;

/**
 <p>The name of the security configuration applied to the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityConfiguration;

/**
 <p>The IAM role that will be assumed by the Amazon EMR service to access AWS resources on your behalf.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>The current status details about the cluster.</p>
 */
@property (nonatomic, strong) AWSEmrClusterStatus * _Nullable status;

/**
 <p>Specifies the number of steps that can be executed concurrently.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stepConcurrencyLevel;

/**
 <p>A list of tags associated with a cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrTag *> * _Nullable tags;

/**
 <p>Indicates whether Amazon EMR will lock the cluster to prevent the EC2 instances from being terminated by an API call or user intervention, or in the event of a cluster error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable terminationProtected;

/**
 <p>Indicates whether the cluster is visible to all IAM users of the AWS account associated with the cluster. The default value, <code>true</code>, indicates that all IAM users in the AWS account can perform cluster actions if they have the proper IAM policy permissions. If this value is <code>false</code>, only the IAM user that created the cluster can perform actions. This value can be changed on a running cluster by using the <a>SetVisibleToAllUsers</a> action. You can override the default value of <code>true</code> when you create a cluster by using the <code>VisibleToAllUsers</code> parameter of the <code>RunJobFlow</code> action.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable visibleToAllUsers;

@end

/**
 <p>The reason that the cluster changed to its current state.</p>
 */
@interface AWSEmrClusterStateChangeReason : AWSModel


/**
 <p>The programmatic code for the state change reason.</p>
 */
@property (nonatomic, assign) AWSEmrClusterStateChangeReasonCode code;

/**
 <p>The descriptive message for the state change reason.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>The detailed status of the cluster.</p>
 */
@interface AWSEmrClusterStatus : AWSModel


/**
 <p>The current state of the cluster.</p>
 */
@property (nonatomic, assign) AWSEmrClusterState state;

/**
 <p>The reason for the cluster status change.</p>
 */
@property (nonatomic, strong) AWSEmrClusterStateChangeReason * _Nullable stateChangeReason;

/**
 <p>A timeline that represents the status of a cluster over the lifetime of the cluster.</p>
 */
@property (nonatomic, strong) AWSEmrClusterTimeline * _Nullable timeline;

@end

/**
 <p>The summary description of the cluster.</p>
 */
@interface AWSEmrClusterSummary : AWSModel


/**
 <p>The Amazon Resource Name of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
 <p>The unique identifier for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An approximation of the cost of the cluster, represented in m1.small/hours. This value is incremented one time for every hour an m1.small instance runs. Larger instances are weighted more, so an EC2 instance that is roughly four times more expensive would result in the normalized instance hours being incremented by four. This result is only an approximation and does not reflect the actual billing rate.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable normalizedInstanceHours;

/**
 <p> The Amazon Resource Name (ARN) of the Outpost where the cluster is launched. </p>
 */
@property (nonatomic, strong) NSString * _Nullable outpostArn;

/**
 <p>The details about the current status of the cluster.</p>
 */
@property (nonatomic, strong) AWSEmrClusterStatus * _Nullable status;

@end

/**
 <p>Represents the timeline of the cluster's lifecycle.</p>
 */
@interface AWSEmrClusterTimeline : AWSModel


/**
 <p>The creation date and time of the cluster.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The date and time when the cluster was terminated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDateTime;

/**
 <p>The date and time when the cluster was ready to execute steps.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable readyDateTime;

@end

/**
 <p>An entity describing an executable that runs on a cluster.</p>
 */
@interface AWSEmrCommand : AWSModel


/**
 <p>Arguments for Amazon EMR to pass to the command for execution.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable args;

/**
 <p>The name of the command.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Amazon S3 location of the command script.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scriptPath;

@end

/**
 <p> The EC2 unit limits for a managed scaling policy. The managed scaling activity of a cluster can not be above or below these limits. The limit only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>
 Required parameters: [UnitType, MinimumCapacityUnits, MaximumCapacityUnits]
 */
@interface AWSEmrComputeLimits : AWSModel


/**
 <p> The upper boundary of EC2 units. It is measured through VCPU cores or instances for instance groups and measured through units for instance fleets. Managed scaling activities are not allowed beyond this boundary. The limit only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumCapacityUnits;

/**
 <p> The upper boundary of on-demand EC2 units. It is measured through VCPU cores or instances for instance groups and measured through units for instance fleets. The on-demand units are not allowed to scale beyond this boundary. The limit only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumOnDemandCapacityUnits;

/**
 <p> The lower boundary of EC2 units. It is measured through VCPU cores or instances for instance groups and measured through units for instance fleets. Managed scaling activities are not allowed beyond this boundary. The limit only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimumCapacityUnits;

/**
 <p> The unit type used for specifying a managed scaling policy. </p>
 */
@property (nonatomic, assign) AWSEmrComputeLimitsUnitType unitType;

@end

/**
 <note><p>Amazon EMR releases 4.x or later.</p></note><p>An optional configuration specification to be used when provisioning cluster instances, which can include configurations for applications and software bundled with Amazon EMR. A configuration consists of a classification, properties, and optional nested configurations. A classification refers to an application-specific configuration file. Properties are the settings you want to change in that file. For more information, see <a href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-configure-apps.html">Configuring Applications</a>.</p>
 */
@interface AWSEmrConfiguration : AWSModel


/**
 <p>The classification within a configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable classification;

/**
 <p>A list of additional configurations to apply within a configuration object.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrConfiguration *> * _Nullable configurations;

/**
 <p>A set of properties specified within a configuration classification.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable properties;

@end

/**
 
 */
@interface AWSEmrCreateSecurityConfigurationInput : AWSRequest


/**
 <p>The name of the security configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The security configuration details in JSON format. For JSON parameters and examples, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-security-configurations.html">Use Security Configurations to Set Up Cluster Security</a> in the <i>Amazon EMR Management Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityConfiguration;

@end

/**
 
 */
@interface AWSEmrCreateSecurityConfigurationOutput : AWSModel


/**
 <p>The date and time the security configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The name of the security configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSEmrDeleteSecurityConfigurationInput : AWSRequest


/**
 <p>The name of the security configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSEmrDeleteSecurityConfigurationOutput : AWSModel


@end

/**
 <p>This input determines which cluster to describe.</p>
 Required parameters: [ClusterId]
 */
@interface AWSEmrDescribeClusterInput : AWSRequest


/**
 <p>The identifier of the cluster to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

@end

/**
 <p>This output contains the description of the cluster.</p>
 */
@interface AWSEmrDescribeClusterOutput : AWSModel


/**
 <p>This output contains the details for the requested cluster.</p>
 */
@property (nonatomic, strong) AWSEmrCluster * _Nullable cluster;

@end

/**
 <p> The input for the <a>DescribeJobFlows</a> operation. </p>
 */
@interface AWSEmrDescribeJobFlowsInput : AWSRequest


/**
 <p>Return only job flows created after this date and time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAfter;

/**
 <p>Return only job flows created before this date and time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdBefore;

/**
 <p>Return only job flows whose job flow ID is contained in this list.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobFlowIds;

/**
 <p>Return only job flows whose state is contained in this list.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobFlowStates;

@end

/**
 <p> The output for the <a>DescribeJobFlows</a> operation. </p>
 */
@interface AWSEmrDescribeJobFlowsOutput : AWSModel


/**
 <p>A list of job flows matching the parameters supplied.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrJobFlowDetail *> * _Nullable jobFlows;

@end

/**
 
 */
@interface AWSEmrDescribeSecurityConfigurationInput : AWSRequest


/**
 <p>The name of the security configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSEmrDescribeSecurityConfigurationOutput : AWSModel


/**
 <p>The date and time the security configuration was created</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The name of the security configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The security configuration details in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityConfiguration;

@end

/**
 <p>This input determines which step to describe.</p>
 Required parameters: [ClusterId, StepId]
 */
@interface AWSEmrDescribeStepInput : AWSRequest


/**
 <p>The identifier of the cluster with steps to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The identifier of the step to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stepId;

@end

/**
 <p>This output contains the description of the cluster step.</p>
 */
@interface AWSEmrDescribeStepOutput : AWSModel


/**
 <p>The step details for the requested step identifier.</p>
 */
@property (nonatomic, strong) AWSEmrStep * _Nullable step;

@end

/**
 <p>Configuration of requested EBS block device associated with the instance group.</p>
 */
@interface AWSEmrEbsBlockDevice : AWSModel


/**
 <p>The device name that is exposed to the instance, such as /dev/sdh.</p>
 */
@property (nonatomic, strong) NSString * _Nullable device;

/**
 <p>EBS volume specifications such as volume type, IOPS, and size (GiB) that will be requested for the EBS volume attached to an EC2 instance in the cluster.</p>
 */
@property (nonatomic, strong) AWSEmrVolumeSpecification * _Nullable volumeSpecification;

@end

/**
 <p>Configuration of requested EBS block device associated with the instance group with count of volumes that will be associated to every instance.</p>
 Required parameters: [VolumeSpecification]
 */
@interface AWSEmrEbsBlockDeviceConfig : AWSModel


/**
 <p>EBS volume specifications such as volume type, IOPS, and size (GiB) that will be requested for the EBS volume attached to an EC2 instance in the cluster.</p>
 */
@property (nonatomic, strong) AWSEmrVolumeSpecification * _Nullable volumeSpecification;

/**
 <p>Number of EBS volumes with a specific volume configuration that will be associated with every instance in the instance group</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumesPerInstance;

@end

/**
 <p>The Amazon EBS configuration of a cluster instance.</p>
 */
@interface AWSEmrEbsConfiguration : AWSModel


/**
 <p>An array of Amazon EBS volume specifications attached to a cluster instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrEbsBlockDeviceConfig *> * _Nullable ebsBlockDeviceConfigs;

/**
 <p>Indicates whether an Amazon EBS volume is EBS-optimized.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsOptimized;

@end

/**
 <p>EBS block device that's attached to an EC2 instance.</p>
 */
@interface AWSEmrEbsVolume : AWSModel


/**
 <p>The device name that is exposed to the instance, such as /dev/sdh.</p>
 */
@property (nonatomic, strong) NSString * _Nullable device;

/**
 <p>The volume identifier of the EBS volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

@end

/**
 <p>Provides information about the EC2 instances in a cluster grouped by category. For example, key name, subnet ID, IAM instance profile, and so on.</p>
 */
@interface AWSEmrEc2InstanceAttributes : AWSModel


/**
 <p>A list of additional Amazon EC2 security group IDs for the master node.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalMasterSecurityGroups;

/**
 <p>A list of additional Amazon EC2 security group IDs for the core and task nodes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalSlaveSecurityGroups;

/**
 <p>The Availability Zone in which the cluster will run. </p>
 */
@property (nonatomic, strong) NSString * _Nullable ec2AvailabilityZone;

/**
 <p>The name of the Amazon EC2 key pair to use when connecting with SSH into the master node as a user named "hadoop".</p>
 */
@property (nonatomic, strong) NSString * _Nullable ec2KeyName;

/**
 <p>Set this parameter to the identifier of the Amazon VPC subnet where you want the cluster to launch. If you do not specify this value, and your account supports EC2-Classic, the cluster launches in EC2-Classic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ec2SubnetId;

/**
 <p>The identifier of the Amazon EC2 security group for the master node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emrManagedMasterSecurityGroup;

/**
 <p>The identifier of the Amazon EC2 security group for the core and task nodes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emrManagedSlaveSecurityGroup;

/**
 <p>The IAM role that was specified when the cluster was launched. The EC2 instances of the cluster assume this role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamInstanceProfile;

/**
 <p>Applies to clusters configured with the instance fleets option. Specifies one or more Availability Zones in which to launch EC2 cluster instances when the EC2-Classic network configuration is supported. Amazon EMR chooses the Availability Zone with the best fit from among the list of <code>RequestedEc2AvailabilityZones</code>, and then launches all cluster instances within that Availability Zone. If you do not specify this value, Amazon EMR chooses the Availability Zone for you. <code>RequestedEc2SubnetIDs</code> and <code>RequestedEc2AvailabilityZones</code> cannot be specified together.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable requestedEc2AvailabilityZones;

/**
 <p>Applies to clusters configured with the instance fleets option. Specifies the unique identifier of one or more Amazon EC2 subnets in which to launch EC2 cluster instances. Subnets must exist within the same VPC. Amazon EMR chooses the EC2 subnet with the best fit from among the list of <code>RequestedEc2SubnetIds</code>, and then launches all cluster instances within that Subnet. If this value is not specified, and the account and Region support EC2-Classic networks, the cluster launches instances in the EC2-Classic network and uses <code>RequestedEc2AvailabilityZones</code> instead of this setting. If EC2-Classic is not supported, and no Subnet is specified, Amazon EMR chooses the subnet for you. <code>RequestedEc2SubnetIDs</code> and <code>RequestedEc2AvailabilityZones</code> cannot be specified together.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable requestedEc2SubnetIds;

/**
 <p>The identifier of the Amazon EC2 security group for the Amazon EMR service to access clusters in VPC private subnets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceAccessSecurityGroup;

@end

/**
 <p>The details of the step failure. The service attempts to detect the root cause for many common failures.</p>
 */
@interface AWSEmrFailureDetails : AWSModel


/**
 <p>The path to the log file where the step failure root cause was originally recorded.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logFile;

/**
 <p>The descriptive message including the error the EMR service has identified as the cause of step failure. This is text from an error log that describes the root cause of the failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The reason for the step failure. In the case where the service cannot successfully determine the root cause of the failure, it returns "Unknown Error" as a reason.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reason;

@end

/**
 
 */
@interface AWSEmrGetBlockPublicAccessConfigurationInput : AWSRequest


@end

/**
 
 */
@interface AWSEmrGetBlockPublicAccessConfigurationOutput : AWSModel


/**
 <p>A configuration for Amazon EMR block public access. The configuration applies to all clusters created in your account for the current Region. The configuration specifies whether block public access is enabled. If block public access is enabled, security groups associated with the cluster cannot have rules that allow inbound traffic from 0.0.0.0/0 or ::/0 on a port, unless the port is specified as an exception using <code>PermittedPublicSecurityGroupRuleRanges</code> in the <code>BlockPublicAccessConfiguration</code>. By default, Port 22 (SSH) is an exception, and public access is allowed on this port. You can change this by updating the block public access configuration to remove the exception.</p><note><p>For accounts that created clusters in a Region before November 25, 2019, block public access is disabled by default in that Region. To use this feature, you must manually enable and configure it. For accounts that did not create an EMR cluster in a Region before this date, block public access is enabled by default in that Region.</p></note>
 */
@property (nonatomic, strong) AWSEmrBlockPublicAccessConfiguration * _Nullable blockPublicAccessConfiguration;

/**
 <p>Properties that describe the AWS principal that created the <code>BlockPublicAccessConfiguration</code> using the <code>PutBlockPublicAccessConfiguration</code> action as well as the date and time that the configuration was created. Each time a configuration for block public access is updated, Amazon EMR updates this metadata.</p>
 */
@property (nonatomic, strong) AWSEmrBlockPublicAccessConfigurationMetadata * _Nullable blockPublicAccessConfigurationMetadata;

@end

/**
 
 */
@interface AWSEmrGetManagedScalingPolicyInput : AWSRequest


/**
 <p> Specifies the ID of the cluster for which the managed scaling policy will be fetched. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

@end

/**
 
 */
@interface AWSEmrGetManagedScalingPolicyOutput : AWSModel


/**
 <p> Specifies the managed scaling policy that is attached to an Amazon EMR cluster. </p>
 */
@property (nonatomic, strong) AWSEmrManagedScalingPolicy * _Nullable managedScalingPolicy;

@end

/**
 <p>A job flow step consisting of a JAR file whose main function will be executed. The main function submits a job for Hadoop to execute and waits for the job to finish or fail.</p>
 Required parameters: [Jar]
 */
@interface AWSEmrHadoopJarStepConfig : AWSModel


/**
 <p>A list of command line arguments passed to the JAR file's main function when executed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable args;

/**
 <p>A path to a JAR file run during the step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jar;

/**
 <p>The name of the main class in the specified Java file. If not specified, the JAR file should specify a Main-Class in its manifest file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mainClass;

/**
 <p>A list of Java properties that are set when the step runs. You can use these properties to pass key value pairs to your main function.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrKeyValue *> * _Nullable properties;

@end

/**
 <p>A cluster step consisting of a JAR file whose main function will be executed. The main function submits a job for Hadoop to execute and waits for the job to finish or fail.</p>
 */
@interface AWSEmrHadoopStepConfig : AWSModel


/**
 <p>The list of command line arguments to pass to the JAR file's main function for execution.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable args;

/**
 <p>The path to the JAR file that runs during the step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jar;

/**
 <p>The name of the main class in the specified Java file. If not specified, the JAR file should specify a main class in its manifest file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mainClass;

/**
 <p>The list of Java properties that are set when the step runs. You can use these properties to pass key value pairs to your main function.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable properties;

@end

/**
 <p>Represents an EC2 instance provisioned as part of cluster.</p>
 */
@interface AWSEmrInstance : AWSModel


/**
 <p>The list of EBS volumes that are attached to this instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrEbsVolume *> * _Nullable ebsVolumes;

/**
 <p>The unique identifier of the instance in Amazon EC2.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ec2InstanceId;

/**
 <p>The unique identifier for the instance in Amazon EMR.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The unique identifier of the instance fleet to which an EC2 instance belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceFleetId;

/**
 <p>The identifier of the instance group to which this instance belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceGroupId;

/**
 <p>The EC2 instance type, for example <code>m3.xlarge</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The instance purchasing option. Valid values are <code>ON_DEMAND</code> or <code>SPOT</code>. </p>
 */
@property (nonatomic, assign) AWSEmrMarketType market;

/**
 <p>The private DNS name of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateDnsName;

/**
 <p>The private IP address of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

/**
 <p>The public DNS name of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicDnsName;

/**
 <p>The public IP address of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIpAddress;

/**
 <p>The current status of the instance.</p>
 */
@property (nonatomic, strong) AWSEmrInstanceStatus * _Nullable status;

@end

/**
 <p>Describes an instance fleet, which is a group of EC2 instances that host a particular node type (master, core, or task) in an Amazon EMR cluster. Instance fleets can consist of a mix of instance types and On-Demand and Spot instances, which are provisioned to meet a defined target capacity. </p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 */
@interface AWSEmrInstanceFleet : AWSModel


/**
 <p>The unique identifier of the instance fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The node type that the instance fleet hosts. Valid values are MASTER, CORE, or TASK. </p>
 */
@property (nonatomic, assign) AWSEmrInstanceFleetType instanceFleetType;

/**
 <p>The specification for the instance types that comprise an instance fleet. Up to five unique instance specifications may be defined for each instance fleet. </p>
 */
@property (nonatomic, strong) NSArray<AWSEmrInstanceTypeSpecification *> * _Nullable instanceTypeSpecifications;

/**
 <p>Describes the launch specification for an instance fleet. </p>
 */
@property (nonatomic, strong) AWSEmrInstanceFleetProvisioningSpecifications * _Nullable launchSpecifications;

/**
 <p>A friendly name for the instance fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The number of On-Demand units that have been provisioned for the instance fleet to fulfill <code>TargetOnDemandCapacity</code>. This provisioned capacity might be less than or greater than <code>TargetOnDemandCapacity</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable provisionedOnDemandCapacity;

/**
 <p>The number of Spot units that have been provisioned for this instance fleet to fulfill <code>TargetSpotCapacity</code>. This provisioned capacity might be less than or greater than <code>TargetSpotCapacity</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable provisionedSpotCapacity;

/**
 <p>The current status of the instance fleet. </p>
 */
@property (nonatomic, strong) AWSEmrInstanceFleetStatus * _Nullable status;

/**
 <p>The target capacity of On-Demand units for the instance fleet, which determines how many On-Demand instances to provision. When the instance fleet launches, Amazon EMR tries to provision On-Demand instances as specified by <a>InstanceTypeConfig</a>. Each instance configuration has a specified <code>WeightedCapacity</code>. When an On-Demand instance is provisioned, the <code>WeightedCapacity</code> units count toward the target capacity. Amazon EMR provisions instances until the target capacity is totally fulfilled, even if this results in an overage. For example, if there are 2 units remaining to fulfill capacity, and Amazon EMR can only provision an instance with a <code>WeightedCapacity</code> of 5 units, the instance is provisioned, and the target capacity is exceeded by 3 units. You can use <a>InstanceFleet$ProvisionedOnDemandCapacity</a> to determine the Spot capacity units that have been provisioned for the instance fleet.</p><note><p>If not specified or set to 0, only Spot instances are provisioned for the instance fleet using <code>TargetSpotCapacity</code>. At least one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> should be greater than 0. For a master instance fleet, only one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> can be specified, and its value must be 1.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetOnDemandCapacity;

/**
 <p>The target capacity of Spot units for the instance fleet, which determines how many Spot instances to provision. When the instance fleet launches, Amazon EMR tries to provision Spot instances as specified by <a>InstanceTypeConfig</a>. Each instance configuration has a specified <code>WeightedCapacity</code>. When a Spot instance is provisioned, the <code>WeightedCapacity</code> units count toward the target capacity. Amazon EMR provisions instances until the target capacity is totally fulfilled, even if this results in an overage. For example, if there are 2 units remaining to fulfill capacity, and Amazon EMR can only provision an instance with a <code>WeightedCapacity</code> of 5 units, the instance is provisioned, and the target capacity is exceeded by 3 units. You can use <a>InstanceFleet$ProvisionedSpotCapacity</a> to determine the Spot capacity units that have been provisioned for the instance fleet.</p><note><p>If not specified or set to 0, only On-Demand instances are provisioned for the instance fleet. At least one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> should be greater than 0. For a master instance fleet, only one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> can be specified, and its value must be 1.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetSpotCapacity;

@end

/**
 <p>The configuration that defines an instance fleet.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 Required parameters: [InstanceFleetType]
 */
@interface AWSEmrInstanceFleetConfig : AWSModel


/**
 <p>The node type that the instance fleet hosts. Valid values are MASTER,CORE,and TASK.</p>
 */
@property (nonatomic, assign) AWSEmrInstanceFleetType instanceFleetType;

/**
 <p>The instance type configurations that define the EC2 instances in the instance fleet.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrInstanceTypeConfig *> * _Nullable instanceTypeConfigs;

/**
 <p>The launch specification for the instance fleet.</p>
 */
@property (nonatomic, strong) AWSEmrInstanceFleetProvisioningSpecifications * _Nullable launchSpecifications;

/**
 <p>The friendly name of the instance fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The target capacity of On-Demand units for the instance fleet, which determines how many On-Demand instances to provision. When the instance fleet launches, Amazon EMR tries to provision On-Demand instances as specified by <a>InstanceTypeConfig</a>. Each instance configuration has a specified <code>WeightedCapacity</code>. When an On-Demand instance is provisioned, the <code>WeightedCapacity</code> units count toward the target capacity. Amazon EMR provisions instances until the target capacity is totally fulfilled, even if this results in an overage. For example, if there are 2 units remaining to fulfill capacity, and Amazon EMR can only provision an instance with a <code>WeightedCapacity</code> of 5 units, the instance is provisioned, and the target capacity is exceeded by 3 units.</p><note><p>If not specified or set to 0, only Spot instances are provisioned for the instance fleet using <code>TargetSpotCapacity</code>. At least one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> should be greater than 0. For a master instance fleet, only one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> can be specified, and its value must be 1.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetOnDemandCapacity;

/**
 <p>The target capacity of Spot units for the instance fleet, which determines how many Spot instances to provision. When the instance fleet launches, Amazon EMR tries to provision Spot instances as specified by <a>InstanceTypeConfig</a>. Each instance configuration has a specified <code>WeightedCapacity</code>. When a Spot instance is provisioned, the <code>WeightedCapacity</code> units count toward the target capacity. Amazon EMR provisions instances until the target capacity is totally fulfilled, even if this results in an overage. For example, if there are 2 units remaining to fulfill capacity, and Amazon EMR can only provision an instance with a <code>WeightedCapacity</code> of 5 units, the instance is provisioned, and the target capacity is exceeded by 3 units.</p><note><p>If not specified or set to 0, only On-Demand instances are provisioned for the instance fleet. At least one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> should be greater than 0. For a master instance fleet, only one of <code>TargetSpotCapacity</code> and <code>TargetOnDemandCapacity</code> can be specified, and its value must be 1.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetSpotCapacity;

@end

/**
 <p>Configuration parameters for an instance fleet modification request.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 Required parameters: [InstanceFleetId]
 */
@interface AWSEmrInstanceFleetModifyConfig : AWSModel


/**
 <p>A unique identifier for the instance fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceFleetId;

/**
 <p>The target capacity of On-Demand units for the instance fleet. For more information see <a>InstanceFleetConfig$TargetOnDemandCapacity</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetOnDemandCapacity;

/**
 <p>The target capacity of Spot units for the instance fleet. For more information, see <a>InstanceFleetConfig$TargetSpotCapacity</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetSpotCapacity;

@end

/**
 <p>The launch specification for Spot instances in the fleet, which determines the defined duration and provisioning timeout behavior.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 Required parameters: [SpotSpecification]
 */
@interface AWSEmrInstanceFleetProvisioningSpecifications : AWSModel


/**
 <p>The launch specification for Spot instances in the fleet, which determines the defined duration and provisioning timeout behavior.</p>
 */
@property (nonatomic, strong) AWSEmrSpotProvisioningSpecification * _Nullable spotSpecification;

@end

/**
 <p>Provides status change reason details for the instance fleet.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 */
@interface AWSEmrInstanceFleetStateChangeReason : AWSModel


/**
 <p>A code corresponding to the reason the state change occurred.</p>
 */
@property (nonatomic, assign) AWSEmrInstanceFleetStateChangeReasonCode code;

/**
 <p>An explanatory message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>The status of the instance fleet.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 */
@interface AWSEmrInstanceFleetStatus : AWSModel


/**
 <p>A code representing the instance fleet status.</p><ul><li><p><code>PROVISIONING</code>—The instance fleet is provisioning EC2 resources and is not yet ready to run jobs.</p></li><li><p><code>BOOTSTRAPPING</code>—EC2 instances and other resources have been provisioned and the bootstrap actions specified for the instances are underway.</p></li><li><p><code>RUNNING</code>—EC2 instances and other resources are running. They are either executing jobs or waiting to execute jobs.</p></li><li><p><code>RESIZING</code>—A resize operation is underway. EC2 instances are either being added or removed.</p></li><li><p><code>SUSPENDED</code>—A resize operation could not complete. Existing EC2 instances are running, but instances can't be added or removed.</p></li><li><p><code>TERMINATING</code>—The instance fleet is terminating EC2 instances.</p></li><li><p><code>TERMINATED</code>—The instance fleet is no longer active, and all EC2 instances have been terminated.</p></li></ul>
 */
@property (nonatomic, assign) AWSEmrInstanceFleetState state;

/**
 <p>Provides status change reason details for the instance fleet.</p>
 */
@property (nonatomic, strong) AWSEmrInstanceFleetStateChangeReason * _Nullable stateChangeReason;

/**
 <p>Provides historical timestamps for the instance fleet, including the time of creation, the time it became ready to run jobs, and the time of termination.</p>
 */
@property (nonatomic, strong) AWSEmrInstanceFleetTimeline * _Nullable timeline;

@end

/**
 <p>Provides historical timestamps for the instance fleet, including the time of creation, the time it became ready to run jobs, and the time of termination.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 */
@interface AWSEmrInstanceFleetTimeline : AWSModel


/**
 <p>The time and date the instance fleet was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The time and date the instance fleet terminated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDateTime;

/**
 <p>The time and date the instance fleet was ready to run jobs.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable readyDateTime;

@end

/**
 <p>This entity represents an instance group, which is a group of instances that have common purpose. For example, CORE instance group is used for HDFS.</p>
 */
@interface AWSEmrInstanceGroup : AWSModel


/**
 <p>An automatic scaling policy for a core instance group or task instance group in an Amazon EMR cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates EC2 instances in response to the value of a CloudWatch metric. See PutAutoScalingPolicy.</p>
 */
@property (nonatomic, strong) AWSEmrAutoScalingPolicyDescription * _Nullable autoScalingPolicy;

/**
 <p>The bid price for each EC2 Spot instance type as defined by <code>InstanceType</code>. Expressed in USD. If neither <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code> is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to 100%.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bidPrice;

/**
 <note><p>Amazon EMR releases 4.x or later.</p></note><p>The list of configurations supplied for an EMR cluster instance group. You can specify a separate configuration for each instance group (master, core, and task).</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrConfiguration *> * _Nullable configurations;

/**
 <p>The version number of the requested configuration specification for this instance group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable configurationsVersion;

/**
 <p>The EBS block devices that are mapped to this instance group.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrEbsBlockDevice *> * _Nullable ebsBlockDevices;

/**
 <p>If the instance group is EBS-optimized. An Amazon EBS-optimized instance uses an optimized configuration stack and provides additional, dedicated capacity for Amazon EBS I/O.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsOptimized;

/**
 <p>The identifier of the instance group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The type of the instance group. Valid values are MASTER, CORE or TASK.</p>
 */
@property (nonatomic, assign) AWSEmrInstanceGroupType instanceGroupType;

/**
 <p>The EC2 instance type for all instances in the instance group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>A list of configurations that were successfully applied for an instance group last time.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrConfiguration *> * _Nullable lastSuccessfullyAppliedConfigurations;

/**
 <p>The version number of a configuration specification that was successfully applied for an instance group last time. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lastSuccessfullyAppliedConfigurationsVersion;

/**
 <p>The marketplace to provision instances for this group. Valid values are ON_DEMAND or SPOT.</p>
 */
@property (nonatomic, assign) AWSEmrMarketType market;

/**
 <p>The name of the instance group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The target number of instances for the instance group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requestedInstanceCount;

/**
 <p>The number of instances currently running in this instance group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable runningInstanceCount;

/**
 <p>Policy for customizing shrink operations.</p>
 */
@property (nonatomic, strong) AWSEmrShrinkPolicy * _Nullable shrinkPolicy;

/**
 <p>The current status of the instance group.</p>
 */
@property (nonatomic, strong) AWSEmrInstanceGroupStatus * _Nullable status;

@end

/**
 <p>Configuration defining a new instance group.</p>
 Required parameters: [InstanceRole, InstanceType, InstanceCount]
 */
@interface AWSEmrInstanceGroupConfig : AWSModel


/**
 <p>An automatic scaling policy for a core instance group or task instance group in an Amazon EMR cluster. The automatic scaling policy defines how an instance group dynamically adds and terminates EC2 instances in response to the value of a CloudWatch metric. See <a>PutAutoScalingPolicy</a>.</p>
 */
@property (nonatomic, strong) AWSEmrAutoScalingPolicy * _Nullable autoScalingPolicy;

/**
 <p>The bid price for each EC2 Spot instance type as defined by <code>InstanceType</code>. Expressed in USD. If neither <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code> is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to 100%.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bidPrice;

/**
 <note><p>Amazon EMR releases 4.x or later.</p></note><p>The list of configurations supplied for an EMR cluster instance group. You can specify a separate configuration for each instance group (master, core, and task).</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrConfiguration *> * _Nullable configurations;

/**
 <p>EBS configurations that will be attached to each EC2 instance in the instance group.</p>
 */
@property (nonatomic, strong) AWSEmrEbsConfiguration * _Nullable ebsConfiguration;

/**
 <p>Target number of instances for the instance group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>The role of the instance group in the cluster.</p>
 */
@property (nonatomic, assign) AWSEmrInstanceRoleType instanceRole;

/**
 <p>The EC2 instance type for all instances in the instance group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>Market type of the EC2 instances used to create a cluster node.</p>
 */
@property (nonatomic, assign) AWSEmrMarketType market;

/**
 <p>Friendly name given to the instance group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Detailed information about an instance group.</p>
 Required parameters: [Market, InstanceRole, InstanceType, InstanceRequestCount, InstanceRunningCount, State, CreationDateTime]
 */
@interface AWSEmrInstanceGroupDetail : AWSModel


/**
 <p>The bid price for each EC2 Spot instance type as defined by <code>InstanceType</code>. Expressed in USD. If neither <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code> is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to 100%.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bidPrice;

/**
 <p>The date/time the instance group was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The date/time the instance group was terminated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDateTime;

/**
 <p>Unique identifier for the instance group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceGroupId;

/**
 <p>Target number of instances to run in the instance group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceRequestCount;

/**
 <p>Instance group role in the cluster</p>
 */
@property (nonatomic, assign) AWSEmrInstanceRoleType instanceRole;

/**
 <p>Actual count of running instances.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceRunningCount;

/**
 <p>EC2 instance type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>Details regarding the state of the instance group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastStateChangeReason;

/**
 <p>Market type of the EC2 instances used to create a cluster node.</p>
 */
@property (nonatomic, assign) AWSEmrMarketType market;

/**
 <p>Friendly name for the instance group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The date/time the instance group was available to the cluster.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable readyDateTime;

/**
 <p>The date/time the instance group was started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDateTime;

/**
 <p>State of instance group. The following values are deprecated: STARTING, TERMINATED, and FAILED.</p>
 */
@property (nonatomic, assign) AWSEmrInstanceGroupState state;

@end

/**
 <p>Modify the size or configurations of an instance group.</p>
 Required parameters: [InstanceGroupId]
 */
@interface AWSEmrInstanceGroupModifyConfig : AWSModel


/**
 <p>A list of new or modified configurations to apply for an instance group.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrConfiguration *> * _Nullable configurations;

/**
 <p>The EC2 InstanceIds to terminate. After you terminate the instances, the instance group will not return to its original requested size.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable EC2InstanceIdsToTerminate;

/**
 <p>Target size for the instance group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>Unique ID of the instance group to expand or shrink.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceGroupId;

/**
 <p>Policy for customizing shrink operations.</p>
 */
@property (nonatomic, strong) AWSEmrShrinkPolicy * _Nullable shrinkPolicy;

@end

/**
 <p>The status change reason details for the instance group.</p>
 */
@interface AWSEmrInstanceGroupStateChangeReason : AWSModel


/**
 <p>The programmable code for the state change reason.</p>
 */
@property (nonatomic, assign) AWSEmrInstanceGroupStateChangeReasonCode code;

/**
 <p>The status change reason description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>The details of the instance group status.</p>
 */
@interface AWSEmrInstanceGroupStatus : AWSModel


/**
 <p>The current state of the instance group.</p>
 */
@property (nonatomic, assign) AWSEmrInstanceGroupState state;

/**
 <p>The status change reason details for the instance group.</p>
 */
@property (nonatomic, strong) AWSEmrInstanceGroupStateChangeReason * _Nullable stateChangeReason;

/**
 <p>The timeline of the instance group status over time.</p>
 */
@property (nonatomic, strong) AWSEmrInstanceGroupTimeline * _Nullable timeline;

@end

/**
 <p>The timeline of the instance group lifecycle.</p>
 */
@interface AWSEmrInstanceGroupTimeline : AWSModel


/**
 <p>The creation date and time of the instance group.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The date and time when the instance group terminated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDateTime;

/**
 <p>The date and time when the instance group became ready to perform tasks.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable readyDateTime;

@end

/**
 <p>Custom policy for requesting termination protection or termination of specific instances when shrinking an instance group.</p>
 */
@interface AWSEmrInstanceResizePolicy : AWSModel


/**
 <p>Decommissioning timeout override for the specific list of instances to be terminated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceTerminationTimeout;

/**
 <p>Specific list of instances to be protected when shrinking an instance group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instancesToProtect;

/**
 <p>Specific list of instances to be terminated when shrinking an instance group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instancesToTerminate;

@end

/**
 <p>The details of the status change reason for the instance.</p>
 */
@interface AWSEmrInstanceStateChangeReason : AWSModel


/**
 <p>The programmable code for the state change reason.</p>
 */
@property (nonatomic, assign) AWSEmrInstanceStateChangeReasonCode code;

/**
 <p>The status change reason description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>The instance status details.</p>
 */
@interface AWSEmrInstanceStatus : AWSModel


/**
 <p>The current state of the instance.</p>
 */
@property (nonatomic, assign) AWSEmrInstanceState state;

/**
 <p>The details of the status change reason for the instance.</p>
 */
@property (nonatomic, strong) AWSEmrInstanceStateChangeReason * _Nullable stateChangeReason;

/**
 <p>The timeline of the instance status over time.</p>
 */
@property (nonatomic, strong) AWSEmrInstanceTimeline * _Nullable timeline;

@end

/**
 <p>The timeline of the instance lifecycle.</p>
 */
@interface AWSEmrInstanceTimeline : AWSModel


/**
 <p>The creation date and time of the instance.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The date and time when the instance was terminated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDateTime;

/**
 <p>The date and time when the instance was ready to perform tasks.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable readyDateTime;

@end

/**
 <p>An instance type configuration for each instance type in an instance fleet, which determines the EC2 instances Amazon EMR attempts to provision to fulfill On-Demand and Spot target capacities. There can be a maximum of 5 instance type configurations in a fleet.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 Required parameters: [InstanceType]
 */
@interface AWSEmrInstanceTypeConfig : AWSModel


/**
 <p>The bid price for each EC2 Spot instance type as defined by <code>InstanceType</code>. Expressed in USD. If neither <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code> is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to 100%. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bidPrice;

/**
 <p>The bid price, as a percentage of On-Demand price, for each EC2 Spot instance as defined by <code>InstanceType</code>. Expressed as a number (for example, 20 specifies 20%). If neither <code>BidPrice</code> nor <code>BidPriceAsPercentageOfOnDemandPrice</code> is provided, <code>BidPriceAsPercentageOfOnDemandPrice</code> defaults to 100%.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bidPriceAsPercentageOfOnDemandPrice;

/**
 <p>A configuration classification that applies when provisioning cluster instances, which can include configurations for applications and software that run on the cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrConfiguration *> * _Nullable configurations;

/**
 <p>The configuration of Amazon Elastic Block Storage (EBS) attached to each instance as defined by <code>InstanceType</code>. </p>
 */
@property (nonatomic, strong) AWSEmrEbsConfiguration * _Nullable ebsConfiguration;

/**
 <p>An EC2 instance type, such as <code>m3.xlarge</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The number of units that a provisioned instance of this type provides toward fulfilling the target capacities defined in <a>InstanceFleetConfig</a>. This value is 1 for a master instance fleet, and must be 1 or greater for core and task instance fleets. Defaults to 1 if not specified. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable weightedCapacity;

@end

/**
 <p>The configuration specification for each instance type in an instance fleet.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 */
@interface AWSEmrInstanceTypeSpecification : AWSModel


/**
 <p>The bid price for each EC2 Spot instance type as defined by <code>InstanceType</code>. Expressed in USD.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bidPrice;

/**
 <p>The bid price, as a percentage of On-Demand price, for each EC2 Spot instance as defined by <code>InstanceType</code>. Expressed as a number (for example, 20 specifies 20%).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bidPriceAsPercentageOfOnDemandPrice;

/**
 <p>A configuration classification that applies when provisioning cluster instances, which can include configurations for applications and software bundled with Amazon EMR.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrConfiguration *> * _Nullable configurations;

/**
 <p>The configuration of Amazon Elastic Block Storage (EBS) attached to each instance as defined by <code>InstanceType</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrEbsBlockDevice *> * _Nullable ebsBlockDevices;

/**
 <p>Evaluates to <code>TRUE</code> when the specified <code>InstanceType</code> is EBS-optimized.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsOptimized;

/**
 <p>The EC2 instance type, for example <code>m3.xlarge</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The number of units that a provisioned instance of this type provides toward fulfilling the target capacities defined in <a>InstanceFleetConfig</a>. Capacity values represent performance characteristics such as vCPUs, memory, or I/O. If not specified, the default value is 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable weightedCapacity;

@end

/**
 <p>A description of a cluster (job flow).</p>
 Required parameters: [JobFlowId, Name, ExecutionStatusDetail, Instances]
 */
@interface AWSEmrJobFlowDetail : AWSModel


/**
 <p>Applies only to Amazon EMR AMI versions 3.x and 2.x. For Amazon EMR releases 4.0 and later, <code>ReleaseLabel</code> is used. To specify a custom AMI, use <code>CustomAmiID</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amiVersion;

/**
 <p>An IAM role for automatic scaling policies. The default role is <code>EMR_AutoScaling_DefaultRole</code>. The IAM role provides a way for the automatic scaling feature to get the required permissions it needs to launch and terminate EC2 instances in an instance group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingRole;

/**
 <p>A list of the bootstrap actions run by the job flow.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrBootstrapActionDetail *> * _Nullable bootstrapActions;

/**
 <p>Describes the execution status of the job flow.</p>
 */
@property (nonatomic, strong) AWSEmrJobFlowExecutionStatusDetail * _Nullable executionStatusDetail;

/**
 <p>Describes the Amazon EC2 instances of the job flow.</p>
 */
@property (nonatomic, strong) AWSEmrJobFlowInstancesDetail * _Nullable instances;

/**
 <p>The job flow identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobFlowId;

/**
 <p>The IAM role that was specified when the job flow was launched. The EC2 instances of the job flow assume this role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobFlowRole;

/**
 <p>The AWS KMS customer master key (CMK) used for encrypting log files. This attribute is only available with EMR version 5.30.0 and later, excluding EMR 6.0.0.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logEncryptionKmsKeyId;

/**
 <p>The location in Amazon S3 where log files for the job are stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logUri;

/**
 <p>The name of the job flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or an instance group is resized. <code>TERMINATE_AT_INSTANCE_HOUR</code> indicates that Amazon EMR terminates nodes at the instance-hour boundary, regardless of when the request to terminate the instance was submitted. This option is only available with Amazon EMR 5.1.0 and later and is the default for clusters created using that version. <code>TERMINATE_AT_TASK_COMPLETION</code> indicates that Amazon EMR blacklists and drains tasks from nodes before terminating the Amazon EC2 instances, regardless of the instance-hour boundary. With either behavior, Amazon EMR removes the least active nodes first and blocks instance termination if it could lead to HDFS corruption. <code>TERMINATE_AT_TASK_COMPLETION</code> available only in Amazon EMR version 4.1.0 and later, and is the default for versions of Amazon EMR earlier than 5.1.0.</p>
 */
@property (nonatomic, assign) AWSEmrScaleDownBehavior scaleDownBehavior;

/**
 <p>The IAM role that will be assumed by the Amazon EMR service to access AWS resources on your behalf.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>A list of steps run by the job flow.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrStepDetail *> * _Nullable steps;

/**
 <p>A list of strings set by third party software when the job flow is launched. If you are not using third party software to manage the job flow this value is empty.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedProducts;

/**
 <p>Indicates whether the cluster is visible to all IAM users of the AWS account associated with the cluster. The default value, <code>true</code>, indicates that all IAM users in the AWS account can perform cluster actions if they have the proper IAM policy permissions. If this value is <code>false</code>, only the IAM user that created the cluster can perform actions. This value can be changed on a running cluster by using the <a>SetVisibleToAllUsers</a> action. You can override the default value of <code>true</code> when you create a cluster by using the <code>VisibleToAllUsers</code> parameter of the <code>RunJobFlow</code> action.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable visibleToAllUsers;

@end

/**
 <p>Describes the status of the cluster (job flow).</p>
 Required parameters: [State, CreationDateTime]
 */
@interface AWSEmrJobFlowExecutionStatusDetail : AWSModel


/**
 <p>The creation date and time of the job flow.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The completion date and time of the job flow.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDateTime;

/**
 <p>Description of the job flow last changed state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastStateChangeReason;

/**
 <p>The date and time when the job flow was ready to start running bootstrap actions.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable readyDateTime;

/**
 <p>The start date and time of the job flow.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDateTime;

/**
 <p>The state of the job flow.</p>
 */
@property (nonatomic, assign) AWSEmrJobFlowExecutionState state;

@end

/**
 <p>A description of the Amazon EC2 instance on which the cluster (job flow) runs. A valid JobFlowInstancesConfig must contain either InstanceGroups or InstanceFleets, which is the recommended configuration. They cannot be used together. You may also have MasterInstanceType, SlaveInstanceType, and InstanceCount (all three must be present), but we don't recommend this configuration.</p>
 */
@interface AWSEmrJobFlowInstancesConfig : AWSModel


/**
 <p>A list of additional Amazon EC2 security group IDs for the master node.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalMasterSecurityGroups;

/**
 <p>A list of additional Amazon EC2 security group IDs for the core and task nodes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalSlaveSecurityGroups;

/**
 <p>The name of the EC2 key pair that can be used to ssh to the master node as the user called "hadoop."</p>
 */
@property (nonatomic, strong) NSString * _Nullable ec2KeyName;

/**
 <p>Applies to clusters that use the uniform instance group configuration. To launch the cluster in Amazon Virtual Private Cloud (Amazon VPC), set this parameter to the identifier of the Amazon VPC subnet where you want the cluster to launch. If you do not specify this value and your account supports EC2-Classic, the cluster launches in EC2-Classic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ec2SubnetId;

/**
 <p>Applies to clusters that use the instance fleet configuration. When multiple EC2 subnet IDs are specified, Amazon EMR evaluates them and launches instances in the optimal subnet.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ec2SubnetIds;

/**
 <p>The identifier of the Amazon EC2 security group for the master node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emrManagedMasterSecurityGroup;

/**
 <p>The identifier of the Amazon EC2 security group for the core and task nodes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emrManagedSlaveSecurityGroup;

/**
 <p>Applies only to Amazon EMR release versions earlier than 4.0. The Hadoop version for the cluster. Valid inputs are "0.18" (deprecated), "0.20" (deprecated), "0.20.205" (deprecated), "1.0.3", "2.2.0", or "2.4.0". If you do not set this value, the default of 0.18 is used, unless the <code>AmiVersion</code> parameter is set in the RunJobFlow call, in which case the default version of Hadoop for that AMI version is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hadoopVersion;

/**
 <p>The number of EC2 instances in the cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note><p>Describes the EC2 instances and instance configurations for clusters that use the instance fleet configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrInstanceFleetConfig *> * _Nullable instanceFleets;

/**
 <p>Configuration for the instance groups in a cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrInstanceGroupConfig *> * _Nullable instanceGroups;

/**
 <p>Specifies whether the cluster should remain available after completing all steps.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable keepJobFlowAliveWhenNoSteps;

/**
 <p>The EC2 instance type of the master node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterInstanceType;

/**
 <p>The Availability Zone in which the cluster runs.</p>
 */
@property (nonatomic, strong) AWSEmrPlacementType * _Nullable placement;

/**
 <p>The identifier of the Amazon EC2 security group for the Amazon EMR service to access clusters in VPC private subnets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceAccessSecurityGroup;

/**
 <p>The EC2 instance type of the core and task nodes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable slaveInstanceType;

/**
 <p>Specifies whether to lock the cluster to prevent the Amazon EC2 instances from being terminated by API call, user intervention, or in the event of a job-flow error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable terminationProtected;

@end

/**
 <p>Specify the type of Amazon EC2 instances that the cluster (job flow) runs on.</p>
 Required parameters: [MasterInstanceType, SlaveInstanceType, InstanceCount]
 */
@interface AWSEmrJobFlowInstancesDetail : AWSModel


/**
 <p>The name of an Amazon EC2 key pair that can be used to ssh to the master node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ec2KeyName;

/**
 <p>For clusters launched within Amazon Virtual Private Cloud, this is the identifier of the subnet where the cluster was launched.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ec2SubnetId;

/**
 <p>The Hadoop version for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hadoopVersion;

/**
 <p>The number of Amazon EC2 instances in the cluster. If the value is 1, the same instance serves as both the master and core and task node. If the value is greater than 1, one instance is the master node and all others are core and task nodes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>Details about the instance groups in a cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrInstanceGroupDetail *> * _Nullable instanceGroups;

/**
 <p>Specifies whether the cluster should remain available after completing all steps.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable keepJobFlowAliveWhenNoSteps;

/**
 <p>The Amazon EC2 instance identifier of the master node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterInstanceId;

/**
 <p>The Amazon EC2 master node instance type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterInstanceType;

/**
 <p>The DNS name of the master node. If the cluster is on a private subnet, this is the private DNS name. On a public subnet, this is the public DNS name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterPublicDnsName;

/**
 <p>An approximation of the cost of the cluster, represented in m1.small/hours. This value is incremented one time for every hour that an m1.small runs. Larger instances are weighted more, so an Amazon EC2 instance that is roughly four times more expensive would result in the normalized instance hours being incremented by four. This result is only an approximation and does not reflect the actual billing rate.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable normalizedInstanceHours;

/**
 <p>The Amazon EC2 Availability Zone for the cluster.</p>
 */
@property (nonatomic, strong) AWSEmrPlacementType * _Nullable placement;

/**
 <p>The Amazon EC2 core and task node instance type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable slaveInstanceType;

/**
 <p>Specifies whether the Amazon EC2 instances in the cluster are protected from termination by API calls, user intervention, or in the event of a job-flow error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable terminationProtected;

@end

/**
 <p>Attributes for Kerberos configuration when Kerberos authentication is enabled using a security configuration. For more information see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html">Use Kerberos Authentication</a> in the <i>EMR Management Guide</i>.</p>
 Required parameters: [Realm, KdcAdminPassword]
 */
@interface AWSEmrKerberosAttributes : AWSModel


/**
 <p>The Active Directory password for <code>ADDomainJoinUser</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ADDomainJoinPassword;

/**
 <p>Required only when establishing a cross-realm trust with an Active Directory domain. A user with sufficient privileges to join resources to the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ADDomainJoinUser;

/**
 <p>Required only when establishing a cross-realm trust with a KDC in a different realm. The cross-realm principal password, which must be identical across realms.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crossRealmTrustPrincipalPassword;

/**
 <p>The password used within the cluster for the kadmin service on the cluster-dedicated KDC, which maintains Kerberos principals, password policies, and keytabs for the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kdcAdminPassword;

/**
 <p>The name of the Kerberos realm to which all nodes in a cluster belong. For example, <code>EC2.INTERNAL</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable realm;

@end

/**
 <p>A key value pair.</p>
 */
@interface AWSEmrKeyValue : AWSModel


/**
 <p>The unique identifier of a key value pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value part of the identified key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>This input determines which bootstrap actions to retrieve.</p>
 Required parameters: [ClusterId]
 */
@interface AWSEmrListBootstrapActionsInput : AWSRequest


/**
 <p>The cluster identifier for the bootstrap actions to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The pagination token that indicates the next set of results to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>This output contains the bootstrap actions detail.</p>
 */
@interface AWSEmrListBootstrapActionsOutput : AWSModel


/**
 <p>The bootstrap actions associated with the cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrCommand *> * _Nullable bootstrapActions;

/**
 <p>The pagination token that indicates the next set of results to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>This input determines how the ListClusters action filters the list of clusters that it returns.</p>
 */
@interface AWSEmrListClustersInput : AWSRequest


/**
 <p>The cluster state filters to apply when listing clusters.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable clusterStates;

/**
 <p>The creation date and time beginning value filter for listing clusters.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAfter;

/**
 <p>The creation date and time end value filter for listing clusters.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdBefore;

/**
 <p>The pagination token that indicates the next set of results to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>This contains a ClusterSummaryList with the cluster details; for example, the cluster IDs, names, and status.</p>
 */
@interface AWSEmrListClustersOutput : AWSModel


/**
 <p>The list of clusters for the account based on the given filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrClusterSummary *> * _Nullable clusters;

/**
 <p>The pagination token that indicates the next set of results to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSEmrListInstanceFleetsInput : AWSRequest


/**
 <p>The unique identifier of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The pagination token that indicates the next set of results to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSEmrListInstanceFleetsOutput : AWSModel


/**
 <p>The list of instance fleets for the cluster and given filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrInstanceFleet *> * _Nullable instanceFleets;

/**
 <p>The pagination token that indicates the next set of results to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>This input determines which instance groups to retrieve.</p>
 Required parameters: [ClusterId]
 */
@interface AWSEmrListInstanceGroupsInput : AWSRequest


/**
 <p>The identifier of the cluster for which to list the instance groups.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The pagination token that indicates the next set of results to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>This input determines which instance groups to retrieve.</p>
 */
@interface AWSEmrListInstanceGroupsOutput : AWSModel


/**
 <p>The list of instance groups for the cluster and given filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrInstanceGroup *> * _Nullable instanceGroups;

/**
 <p>The pagination token that indicates the next set of results to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>This input determines which instances to list.</p>
 Required parameters: [ClusterId]
 */
@interface AWSEmrListInstancesInput : AWSRequest


/**
 <p>The identifier of the cluster for which to list the instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The unique identifier of the instance fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceFleetId;

/**
 <p>The node type of the instance fleet. For example MASTER, CORE, or TASK.</p>
 */
@property (nonatomic, assign) AWSEmrInstanceFleetType instanceFleetType;

/**
 <p>The identifier of the instance group for which to list the instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceGroupId;

/**
 <p>The type of instance group for which to list the instances.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceGroupTypes;

/**
 <p>A list of instance states that will filter the instances returned with this request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceStates;

/**
 <p>The pagination token that indicates the next set of results to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>This output contains the list of instances.</p>
 */
@interface AWSEmrListInstancesOutput : AWSModel


/**
 <p>The list of instances for the cluster and given filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrInstance *> * _Nullable instances;

/**
 <p>The pagination token that indicates the next set of results to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSEmrListSecurityConfigurationsInput : AWSRequest


/**
 <p>The pagination token that indicates the set of results to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSEmrListSecurityConfigurationsOutput : AWSModel


/**
 <p>A pagination token that indicates the next set of results to retrieve. Include the marker in the next ListSecurityConfiguration call to retrieve the next page of results, if required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The creation date and time, and name, of each security configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrSecurityConfigurationSummary *> * _Nullable securityConfigurations;

@end

/**
 <p>This input determines which steps to list.</p>
 Required parameters: [ClusterId]
 */
@interface AWSEmrListStepsInput : AWSRequest


/**
 <p>The identifier of the cluster for which to list the steps.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The pagination token that indicates the next set of results to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The filter to limit the step list based on the identifier of the steps. You can specify a maximum of ten Step IDs. The character constraint applies to the overall length of the array.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stepIds;

/**
 <p>The filter to limit the step list based on certain states.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stepStates;

@end

/**
 <p>This output contains the list of steps returned in reverse order. This means that the last step is the first element in the list.</p>
 */
@interface AWSEmrListStepsOutput : AWSModel


/**
 <p>The pagination token that indicates the next set of results to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The filtered list of steps for the cluster.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrStepSummary *> * _Nullable steps;

@end

/**
 <p> Managed scaling policy for an Amazon EMR cluster. The policy specifies the limits for resources that can be added or terminated from a cluster. The policy only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>
 */
@interface AWSEmrManagedScalingPolicy : AWSModel


/**
 <p> The EC2 unit limits for a managed scaling policy. The managed scaling activity of a cluster is not allowed to go above or below these limits. The limit only applies to the core and task nodes. The master node cannot be scaled after initial configuration. </p>
 */
@property (nonatomic, strong) AWSEmrComputeLimits * _Nullable computeLimits;

@end

/**
 <p>A CloudWatch dimension, which is specified using a <code>Key</code> (known as a <code>Name</code> in CloudWatch), <code>Value</code> pair. By default, Amazon EMR uses one dimension whose <code>Key</code> is <code>JobFlowID</code> and <code>Value</code> is a variable representing the cluster ID, which is <code>${emr.clusterId}</code>. This enables the rule to bootstrap when the cluster ID becomes available.</p>
 */
@interface AWSEmrMetricDimension : AWSModel


/**
 <p>The dimension name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The dimension value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSEmrModifyClusterInput : AWSRequest


/**
 <p>The unique identifier of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The number of steps that can be executed concurrently. You can specify a maximum of 256 steps. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stepConcurrencyLevel;

@end

/**
 
 */
@interface AWSEmrModifyClusterOutput : AWSModel


/**
 <p>The number of steps that can be executed concurrently.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stepConcurrencyLevel;

@end

/**
 
 */
@interface AWSEmrModifyInstanceFleetInput : AWSRequest


/**
 <p>The unique identifier of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>The unique identifier of the instance fleet.</p>
 */
@property (nonatomic, strong) AWSEmrInstanceFleetModifyConfig * _Nullable instanceFleet;

@end

/**
 <p>Change the size of some instance groups.</p>
 */
@interface AWSEmrModifyInstanceGroupsInput : AWSRequest


/**
 <p>The ID of the cluster to which the instance group belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>Instance groups to change.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrInstanceGroupModifyConfig *> * _Nullable instanceGroups;

@end

/**
 <p>The Amazon EC2 Availability Zone configuration of the cluster (job flow).</p>
 */
@interface AWSEmrPlacementType : AWSModel


/**
 <p>The Amazon EC2 Availability Zone for the cluster. <code>AvailabilityZone</code> is used for uniform instance groups, while <code>AvailabilityZones</code> (plural) is used for instance fleets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>When multiple Availability Zones are specified, Amazon EMR evaluates them and launches instances in the optimal Availability Zone. <code>AvailabilityZones</code> is used for instance fleets, while <code>AvailabilityZone</code> (singular) is used for uniform instance groups.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

@end

/**
 <p>A list of port ranges that are permitted to allow inbound traffic from all public IP addresses. To specify a single port, use the same value for <code>MinRange</code> and <code>MaxRange</code>.</p>
 Required parameters: [MinRange]
 */
@interface AWSEmrPortRange : AWSModel


/**
 <p>The smallest port number in a specified range of port numbers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRange;

/**
 <p>The smallest port number in a specified range of port numbers.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minRange;

@end

/**
 
 */
@interface AWSEmrPutAutoScalingPolicyInput : AWSRequest


/**
 <p>Specifies the definition of the automatic scaling policy.</p>
 */
@property (nonatomic, strong) AWSEmrAutoScalingPolicy * _Nullable autoScalingPolicy;

/**
 <p>Specifies the ID of a cluster. The instance group to which the automatic scaling policy is applied is within this cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>Specifies the ID of the instance group to which the automatic scaling policy is applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceGroupId;

@end

/**
 
 */
@interface AWSEmrPutAutoScalingPolicyOutput : AWSModel


/**
 <p>The automatic scaling policy definition.</p>
 */
@property (nonatomic, strong) AWSEmrAutoScalingPolicyDescription * _Nullable autoScalingPolicy;

/**
 <p>The Amazon Resource Name of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
 <p>Specifies the ID of a cluster. The instance group to which the automatic scaling policy is applied is within this cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>Specifies the ID of the instance group to which the scaling policy is applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceGroupId;

@end

/**
 
 */
@interface AWSEmrPutBlockPublicAccessConfigurationInput : AWSRequest


/**
 <p>A configuration for Amazon EMR block public access. The configuration applies to all clusters created in your account for the current Region. The configuration specifies whether block public access is enabled. If block public access is enabled, security groups associated with the cluster cannot have rules that allow inbound traffic from 0.0.0.0/0 or ::/0 on a port, unless the port is specified as an exception using <code>PermittedPublicSecurityGroupRuleRanges</code> in the <code>BlockPublicAccessConfiguration</code>. By default, Port 22 (SSH) is an exception, and public access is allowed on this port. You can change this by updating <code>BlockPublicSecurityGroupRules</code> to remove the exception.</p><note><p>For accounts that created clusters in a Region before November 25, 2019, block public access is disabled by default in that Region. To use this feature, you must manually enable and configure it. For accounts that did not create an EMR cluster in a Region before this date, block public access is enabled by default in that Region.</p></note>
 */
@property (nonatomic, strong) AWSEmrBlockPublicAccessConfiguration * _Nullable blockPublicAccessConfiguration;

@end

/**
 
 */
@interface AWSEmrPutBlockPublicAccessConfigurationOutput : AWSModel


@end

/**
 
 */
@interface AWSEmrPutManagedScalingPolicyInput : AWSRequest


/**
 <p> Specifies the ID of an EMR cluster where the managed scaling policy is attached. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p> Specifies the constraints for the managed scaling policy. </p>
 */
@property (nonatomic, strong) AWSEmrManagedScalingPolicy * _Nullable managedScalingPolicy;

@end

/**
 
 */
@interface AWSEmrPutManagedScalingPolicyOutput : AWSModel


@end

/**
 
 */
@interface AWSEmrRemoveAutoScalingPolicyInput : AWSRequest


/**
 <p>Specifies the ID of a cluster. The instance group to which the automatic scaling policy is applied is within this cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

/**
 <p>Specifies the ID of the instance group to which the scaling policy is applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceGroupId;

@end

/**
 
 */
@interface AWSEmrRemoveAutoScalingPolicyOutput : AWSModel


@end

/**
 
 */
@interface AWSEmrRemoveManagedScalingPolicyInput : AWSRequest


/**
 <p> Specifies the ID of the cluster from which the managed scaling policy will be removed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterId;

@end

/**
 
 */
@interface AWSEmrRemoveManagedScalingPolicyOutput : AWSModel


@end

/**
 <p>This input identifies a cluster and a list of tags to remove.</p>
 Required parameters: [ResourceId, TagKeys]
 */
@interface AWSEmrRemoveTagsInput : AWSRequest


/**
 <p>The Amazon EMR resource identifier from which tags will be removed. This value must be a cluster identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>A list of tag keys to remove from a resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p>This output indicates the result of removing tags from a resource.</p>
 */
@interface AWSEmrRemoveTagsOutput : AWSModel


@end

/**
 <p> Input to the <a>RunJobFlow</a> operation. </p>
 Required parameters: [Name, Instances]
 */
@interface AWSEmrRunJobFlowInput : AWSRequest


/**
 <p>A JSON string for selecting additional features.</p>
 */
@property (nonatomic, strong) NSString * _Nullable additionalInfo;

/**
 <p>Applies only to Amazon EMR AMI versions 3.x and 2.x. For Amazon EMR releases 4.0 and later, <code>ReleaseLabel</code> is used. To specify a custom AMI, use <code>CustomAmiID</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amiVersion;

/**
 <p>Applies to Amazon EMR releases 4.0 and later. A case-insensitive list of applications for Amazon EMR to install and configure when launching the cluster. For a list of applications available for each Amazon EMR release version, see the <a href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/">Amazon EMR Release Guide</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrApplication *> * _Nullable applications;

/**
 <p>An IAM role for automatic scaling policies. The default role is <code>EMR_AutoScaling_DefaultRole</code>. The IAM role provides permissions that the automatic scaling feature requires to launch and terminate EC2 instances in an instance group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingRole;

/**
 <p>A list of bootstrap actions to run before Hadoop starts on the cluster nodes.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrBootstrapActionConfig *> * _Nullable bootstrapActions;

/**
 <p>For Amazon EMR releases 4.0 and later. The list of configurations supplied for the EMR cluster you are creating.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrConfiguration *> * _Nullable configurations;

/**
 <p>Available only in Amazon EMR version 5.7.0 and later. The ID of a custom Amazon EBS-backed Linux AMI. If specified, Amazon EMR uses this AMI when it launches cluster EC2 instances. For more information about custom AMIs in Amazon EMR, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-custom-ami.html">Using a Custom AMI</a> in the <i>Amazon EMR Management Guide</i>. If omitted, the cluster uses the base Linux AMI for the <code>ReleaseLabel</code> specified. For Amazon EMR versions 2.x and 3.x, use <code>AmiVersion</code> instead.</p><p>For information about creating a custom AMI, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html">Creating an Amazon EBS-Backed Linux AMI</a> in the <i>Amazon Elastic Compute Cloud User Guide for Linux Instances</i>. For information about finding an AMI ID, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html">Finding a Linux AMI</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable customAmiId;

/**
 <p>The size, in GiB, of the EBS root device volume of the Linux AMI that is used for each EC2 instance. Available in Amazon EMR version 4.x and later.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsRootVolumeSize;

/**
 <p>A specification of the number and type of Amazon EC2 instances.</p>
 */
@property (nonatomic, strong) AWSEmrJobFlowInstancesConfig * _Nullable instances;

/**
 <p>Also called instance profile and EC2 role. An IAM role for an EMR cluster. The EC2 instances of the cluster assume this role. The default role is <code>EMR_EC2_DefaultRole</code>. In order to use the default role, you must have already created it using the CLI or console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobFlowRole;

/**
 <p>Attributes for Kerberos configuration when Kerberos authentication is enabled using a security configuration. For more information see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-kerberos.html">Use Kerberos Authentication</a> in the <i>EMR Management Guide</i>.</p>
 */
@property (nonatomic, strong) AWSEmrKerberosAttributes * _Nullable kerberosAttributes;

/**
 <p>The AWS KMS customer master key (CMK) used for encrypting log files. If a value is not provided, the logs will remain encrypted by AES-256. This attribute is only available with EMR version 5.30.0 and later, excluding EMR 6.0.0.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logEncryptionKmsKeyId;

/**
 <p>The location in Amazon S3 to write the log files of the job flow. If a value is not provided, logs are not created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logUri;

/**
 <p> The specified managed scaling policy for an Amazon EMR cluster. </p>
 */
@property (nonatomic, strong) AWSEmrManagedScalingPolicy * _Nullable managedScalingPolicy;

/**
 <p>The name of the job flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <note><p>For Amazon EMR releases 3.x and 2.x. For Amazon EMR releases 4.x and later, use Applications.</p></note><p>A list of strings that indicates third-party software to use with the job flow that accepts a user argument list. EMR accepts and forwards the argument list to the corresponding installation script as bootstrap action arguments. For more information, see "Launch a Job Flow on the MapR Distribution for Hadoop" in the <a href="https://docs.aws.amazon.com/emr/latest/DeveloperGuide/emr-dg.pdf">Amazon EMR Developer Guide</a>. Supported values are:</p><ul><li><p>"mapr-m3" - launch the cluster using MapR M3 Edition.</p></li><li><p>"mapr-m5" - launch the cluster using MapR M5 Edition.</p></li><li><p>"mapr" with the user arguments specifying "--edition,m3" or "--edition,m5" - launch the job flow using MapR M3 or M5 Edition respectively.</p></li><li><p>"mapr-m7" - launch the cluster using MapR M7 Edition.</p></li><li><p>"hunk" - launch the cluster with the Hunk Big Data Analtics Platform.</p></li><li><p>"hue"- launch the cluster with Hue installed.</p></li><li><p>"spark" - launch the cluster with Apache Spark installed.</p></li><li><p>"ganglia" - launch the cluster with the Ganglia Monitoring System installed.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEmrSupportedProductConfig *> * _Nullable latestSupportedProducts;

/**
 <p>The Amazon EMR release label, which determines the version of open-source application packages installed on the cluster. Release labels are in the form <code>emr-x.x.x</code>, where x.x.x is an Amazon EMR release version such as <code>emr-5.14.0</code>. For more information about Amazon EMR release versions and included application versions and features, see <a href="https://docs.aws.amazon.com/emr/latest/ReleaseGuide/">https://docs.aws.amazon.com/emr/latest/ReleaseGuide/</a>. The release label applies only to Amazon EMR releases version 4.0 and later. Earlier versions use <code>AmiVersion</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable releaseLabel;

/**
 <p>Applies only when <code>CustomAmiID</code> is used. Specifies which updates from the Amazon Linux AMI package repositories to apply automatically when the instance boots using the AMI. If omitted, the default is <code>SECURITY</code>, which indicates that only security updates are applied. If <code>NONE</code> is specified, no updates are applied, and all updates must be applied manually.</p>
 */
@property (nonatomic, assign) AWSEmrRepoUpgradeOnBoot repoUpgradeOnBoot;

/**
 <p>Specifies the way that individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or an instance group is resized. <code>TERMINATE_AT_INSTANCE_HOUR</code> indicates that Amazon EMR terminates nodes at the instance-hour boundary, regardless of when the request to terminate the instance was submitted. This option is only available with Amazon EMR 5.1.0 and later and is the default for clusters created using that version. <code>TERMINATE_AT_TASK_COMPLETION</code> indicates that Amazon EMR blacklists and drains tasks from nodes before terminating the Amazon EC2 instances, regardless of the instance-hour boundary. With either behavior, Amazon EMR removes the least active nodes first and blocks instance termination if it could lead to HDFS corruption. <code>TERMINATE_AT_TASK_COMPLETION</code> available only in Amazon EMR version 4.1.0 and later, and is the default for versions of Amazon EMR earlier than 5.1.0.</p>
 */
@property (nonatomic, assign) AWSEmrScaleDownBehavior scaleDownBehavior;

/**
 <p>The name of a security configuration to apply to the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable securityConfiguration;

/**
 <p>The IAM role that will be assumed by the Amazon EMR service to access AWS resources on your behalf.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>Specifies the number of steps that can be executed concurrently. The default value is <code>1</code>. The maximum value is <code>256</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stepConcurrencyLevel;

/**
 <p>A list of steps to run.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrStepConfig *> * _Nullable steps;

/**
 <note><p>For Amazon EMR releases 3.x and 2.x. For Amazon EMR releases 4.x and later, use Applications.</p></note><p>A list of strings that indicates third-party software to use. For more information, see the <a href="https://docs.aws.amazon.com/emr/latest/DeveloperGuide/emr-dg.pdf">Amazon EMR Developer Guide</a>. Currently supported values are:</p><ul><li><p>"mapr-m3" - launch the job flow using MapR M3 Edition.</p></li><li><p>"mapr-m5" - launch the job flow using MapR M5 Edition.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedProducts;

/**
 <p>A list of tags to associate with a cluster and propagate to Amazon EC2 instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSEmrTag *> * _Nullable tags;

/**
 <p>A value of <code>true</code> indicates that all IAM users in the AWS account can perform cluster actions if they have the proper IAM policy permissions. This is the default. A value of <code>false</code> indicates that only the IAM user who created the cluster can perform actions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable visibleToAllUsers;

@end

/**
 <p> The result of the <a>RunJobFlow</a> operation. </p>
 */
@interface AWSEmrRunJobFlowOutput : AWSModel


/**
 <p>The Amazon Resource Name of the cluster.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clusterArn;

/**
 <p>An unique identifier for the job flow.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobFlowId;

@end

/**
 <p>The type of adjustment the automatic scaling activity makes when triggered, and the periodicity of the adjustment.</p>
 Required parameters: [SimpleScalingPolicyConfiguration]
 */
@interface AWSEmrScalingAction : AWSModel


/**
 <p>Not available for instance groups. Instance groups use the market type specified for the group.</p>
 */
@property (nonatomic, assign) AWSEmrMarketType market;

/**
 <p>The type of adjustment the automatic scaling activity makes when triggered, and the periodicity of the adjustment.</p>
 */
@property (nonatomic, strong) AWSEmrSimpleScalingPolicyConfiguration * _Nullable simpleScalingPolicyConfiguration;

@end

/**
 <p>The upper and lower EC2 instance limits for an automatic scaling policy. Automatic scaling activities triggered by automatic scaling rules will not cause an instance group to grow above or below these limits.</p>
 Required parameters: [MinCapacity, MaxCapacity]
 */
@interface AWSEmrScalingConstraints : AWSModel


/**
 <p>The upper boundary of EC2 instances in an instance group beyond which scaling activities are not allowed to grow. Scale-out activities will not add instances beyond this boundary.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacity;

/**
 <p>The lower boundary of EC2 instances in an instance group below which scaling activities are not allowed to shrink. Scale-in activities will not terminate instances below this boundary.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minCapacity;

@end

/**
 <p>A scale-in or scale-out rule that defines scaling activity, including the CloudWatch metric alarm that triggers activity, how EC2 instances are added or removed, and the periodicity of adjustments. The automatic scaling policy for an instance group can comprise one or more automatic scaling rules.</p>
 Required parameters: [Name, Action, Trigger]
 */
@interface AWSEmrScalingRule : AWSModel


/**
 <p>The conditions that trigger an automatic scaling activity.</p>
 */
@property (nonatomic, strong) AWSEmrScalingAction * _Nullable action;

/**
 <p>A friendly, more verbose description of the automatic scaling rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name used to identify an automatic scaling rule. Rule names must be unique within a scaling policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The CloudWatch alarm definition that determines when automatic scaling activity is triggered.</p>
 */
@property (nonatomic, strong) AWSEmrScalingTrigger * _Nullable trigger;

@end

/**
 <p>The conditions that trigger an automatic scaling activity.</p>
 Required parameters: [CloudWatchAlarmDefinition]
 */
@interface AWSEmrScalingTrigger : AWSModel


/**
 <p>The definition of a CloudWatch metric alarm. When the defined alarm conditions are met along with other trigger parameters, scaling activity begins.</p>
 */
@property (nonatomic, strong) AWSEmrCloudWatchAlarmDefinition * _Nullable cloudWatchAlarmDefinition;

@end

/**
 <p>Configuration of the script to run during a bootstrap action.</p>
 Required parameters: [Path]
 */
@interface AWSEmrScriptBootstrapActionConfig : AWSModel


/**
 <p>A list of command line arguments to pass to the bootstrap action script.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable args;

/**
 <p>Location of the script to run during a bootstrap action. Can be either a location in Amazon S3 or on a local file system.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>The creation date and time, and name, of a security configuration.</p>
 */
@interface AWSEmrSecurityConfigurationSummary : AWSModel


/**
 <p>The date and time the security configuration was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The name of the security configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p> The input argument to the <a>TerminationProtection</a> operation. </p>
 Required parameters: [JobFlowIds, TerminationProtected]
 */
@interface AWSEmrSetTerminationProtectionInput : AWSRequest


/**
 <p> A list of strings that uniquely identify the clusters to protect. This identifier is returned by <a>RunJobFlow</a> and can also be obtained from <a>DescribeJobFlows</a> . </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobFlowIds;

/**
 <p>A Boolean that indicates whether to protect the cluster and prevent the Amazon EC2 instances in the cluster from shutting down due to API calls, user intervention, or job-flow error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable terminationProtected;

@end

/**
 <p>The input to the SetVisibleToAllUsers action.</p>
 Required parameters: [JobFlowIds, VisibleToAllUsers]
 */
@interface AWSEmrSetVisibleToAllUsersInput : AWSRequest


/**
 <p>The unique identifier of the job flow (cluster).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobFlowIds;

/**
 <p>A value of <code>true</code> indicates that all IAM users in the AWS account can perform cluster actions if they have the proper IAM policy permissions. This is the default. A value of <code>false</code> indicates that only the IAM user who created the cluster can perform actions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable visibleToAllUsers;

@end

/**
 <p>Policy for customizing shrink operations. Allows configuration of decommissioning timeout and targeted instance shrinking.</p>
 */
@interface AWSEmrShrinkPolicy : AWSModel


/**
 <p>The desired timeout for decommissioning an instance. Overrides the default YARN decommissioning timeout.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable decommissionTimeout;

/**
 <p>Custom policy for requesting termination protection or termination of specific instances when shrinking an instance group.</p>
 */
@property (nonatomic, strong) AWSEmrInstanceResizePolicy * _Nullable instanceResizePolicy;

@end

/**
 <p>An automatic scaling configuration, which describes how the policy adds or removes instances, the cooldown period, and the number of EC2 instances that will be added each time the CloudWatch metric alarm condition is satisfied.</p>
 Required parameters: [ScalingAdjustment]
 */
@interface AWSEmrSimpleScalingPolicyConfiguration : AWSModel


/**
 <p>The way in which EC2 instances are added (if <code>ScalingAdjustment</code> is a positive number) or terminated (if <code>ScalingAdjustment</code> is a negative number) each time the scaling activity is triggered. <code>CHANGE_IN_CAPACITY</code> is the default. <code>CHANGE_IN_CAPACITY</code> indicates that the EC2 instance count increments or decrements by <code>ScalingAdjustment</code>, which should be expressed as an integer. <code>PERCENT_CHANGE_IN_CAPACITY</code> indicates the instance count increments or decrements by the percentage specified by <code>ScalingAdjustment</code>, which should be expressed as an integer. For example, 20 indicates an increase in 20% increments of cluster capacity. <code>EXACT_CAPACITY</code> indicates the scaling activity results in an instance group with the number of EC2 instances specified by <code>ScalingAdjustment</code>, which should be expressed as a positive integer.</p>
 */
@property (nonatomic, assign) AWSEmrAdjustmentType adjustmentType;

/**
 <p>The amount of time, in seconds, after a scaling activity completes before any further trigger-related scaling activities can start. The default value is 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable coolDown;

/**
 <p>The amount by which to scale in or scale out, based on the specified <code>AdjustmentType</code>. A positive value adds to the instance group's EC2 instance count while a negative number removes instances. If <code>AdjustmentType</code> is set to <code>EXACT_CAPACITY</code>, the number should only be a positive integer. If <code>AdjustmentType</code> is set to <code>PERCENT_CHANGE_IN_CAPACITY</code>, the value should express the percentage as an integer. For example, -20 indicates a decrease in 20% increments of cluster capacity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scalingAdjustment;

@end

/**
 <p>The launch specification for Spot instances in the instance fleet, which determines the defined duration and provisioning timeout behavior.</p><note><p>The instance fleet configuration is available only in Amazon EMR versions 4.8.0 and later, excluding 5.0.x versions.</p></note>
 Required parameters: [TimeoutDurationMinutes, TimeoutAction]
 */
@interface AWSEmrSpotProvisioningSpecification : AWSModel


/**
 <p>The defined duration for Spot instances (also known as Spot blocks) in minutes. When specified, the Spot instance does not terminate before the defined duration expires, and defined duration pricing for Spot instances applies. Valid values are 60, 120, 180, 240, 300, or 360. The duration period starts as soon as a Spot instance receives its instance ID. At the end of the duration, Amazon EC2 marks the Spot instance for termination and provides a Spot instance termination notice, which gives the instance a two-minute warning before it terminates. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable blockDurationMinutes;

/**
 <p>The action to take when <code>TargetSpotCapacity</code> has not been fulfilled when the <code>TimeoutDurationMinutes</code> has expired; that is, when all Spot instances could not be provisioned within the Spot provisioning timeout. Valid values are <code>TERMINATE_CLUSTER</code> and <code>SWITCH_TO_ON_DEMAND</code>. SWITCH_TO_ON_DEMAND specifies that if no Spot instances are available, On-Demand Instances should be provisioned to fulfill any remaining Spot capacity.</p>
 */
@property (nonatomic, assign) AWSEmrSpotProvisioningTimeoutAction timeoutAction;

/**
 <p>The spot provisioning timeout period in minutes. If Spot instances are not provisioned within this time period, the <code>TimeOutAction</code> is taken. Minimum value is 5 and maximum value is 1440. The timeout applies only during initial provisioning, when the cluster is first created.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutDurationMinutes;

@end

/**
 <p>This represents a step in a cluster.</p>
 */
@interface AWSEmrStep : AWSModel


/**
 <p>The action to take when the cluster step fails. Possible values are TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is provided for backward compatibility. We recommend using TERMINATE_CLUSTER instead.</p>
 */
@property (nonatomic, assign) AWSEmrActionOnFailure actionOnFailure;

/**
 <p>The Hadoop job configuration of the cluster step.</p>
 */
@property (nonatomic, strong) AWSEmrHadoopStepConfig * _Nullable config;

/**
 <p>The identifier of the cluster step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the cluster step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current execution status details of the cluster step.</p>
 */
@property (nonatomic, strong) AWSEmrStepStatus * _Nullable status;

@end

/**
 <p>Specification of a cluster (job flow) step.</p>
 Required parameters: [Name, HadoopJarStep]
 */
@interface AWSEmrStepConfig : AWSModel


/**
 <p>The action to take when the cluster step fails. Possible values are TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is provided for backward compatibility. We recommend using TERMINATE_CLUSTER instead.</p>
 */
@property (nonatomic, assign) AWSEmrActionOnFailure actionOnFailure;

/**
 <p>The JAR file used for the step.</p>
 */
@property (nonatomic, strong) AWSEmrHadoopJarStepConfig * _Nullable hadoopJarStep;

/**
 <p>The name of the step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Combines the execution state and configuration of a step.</p>
 Required parameters: [StepConfig, ExecutionStatusDetail]
 */
@interface AWSEmrStepDetail : AWSModel


/**
 <p>The description of the step status.</p>
 */
@property (nonatomic, strong) AWSEmrStepExecutionStatusDetail * _Nullable executionStatusDetail;

/**
 <p>The step configuration.</p>
 */
@property (nonatomic, strong) AWSEmrStepConfig * _Nullable stepConfig;

@end

/**
 <p>The execution state of a step.</p>
 Required parameters: [State, CreationDateTime]
 */
@interface AWSEmrStepExecutionStatusDetail : AWSModel


/**
 <p>The creation date and time of the step.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The completion date and time of the step.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDateTime;

/**
 <p>A description of the step's current state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastStateChangeReason;

/**
 <p>The start date and time of the step.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDateTime;

/**
 <p>The state of the step.</p>
 */
@property (nonatomic, assign) AWSEmrStepExecutionState state;

@end

/**
 <p>The details of the step state change reason.</p>
 */
@interface AWSEmrStepStateChangeReason : AWSModel


/**
 <p>The programmable code for the state change reason. Note: Currently, the service provides no code for the state change.</p>
 */
@property (nonatomic, assign) AWSEmrStepStateChangeReasonCode code;

/**
 <p>The descriptive message for the state change reason.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>The execution status details of the cluster step.</p>
 */
@interface AWSEmrStepStatus : AWSModel


/**
 <p>The details for the step failure including reason, message, and log file path where the root cause was identified.</p>
 */
@property (nonatomic, strong) AWSEmrFailureDetails * _Nullable failureDetails;

/**
 <p>The execution state of the cluster step.</p>
 */
@property (nonatomic, assign) AWSEmrStepState state;

/**
 <p>The reason for the step execution status change.</p>
 */
@property (nonatomic, strong) AWSEmrStepStateChangeReason * _Nullable stateChangeReason;

/**
 <p>The timeline of the cluster step status over time.</p>
 */
@property (nonatomic, strong) AWSEmrStepTimeline * _Nullable timeline;

@end

/**
 <p>The summary of the cluster step.</p>
 */
@interface AWSEmrStepSummary : AWSModel


/**
 <p>The action to take when the cluster step fails. Possible values are TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE. TERMINATE_JOB_FLOW is available for backward compatibility. We recommend using TERMINATE_CLUSTER instead.</p>
 */
@property (nonatomic, assign) AWSEmrActionOnFailure actionOnFailure;

/**
 <p>The Hadoop job configuration of the cluster step.</p>
 */
@property (nonatomic, strong) AWSEmrHadoopStepConfig * _Nullable config;

/**
 <p>The identifier of the cluster step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the cluster step.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The current execution status details of the cluster step.</p>
 */
@property (nonatomic, strong) AWSEmrStepStatus * _Nullable status;

@end

/**
 <p>The timeline of the cluster step lifecycle.</p>
 */
@interface AWSEmrStepTimeline : AWSModel


/**
 <p>The date and time when the cluster step was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDateTime;

/**
 <p>The date and time when the cluster step execution completed or failed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endDateTime;

/**
 <p>The date and time when the cluster step execution started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDateTime;

@end

/**
 <p>The list of supported product configurations which allow user-supplied arguments. EMR accepts these arguments and forwards them to the corresponding installation script as bootstrap action arguments.</p>
 */
@interface AWSEmrSupportedProductConfig : AWSModel


/**
 <p>The list of user-supplied arguments.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable args;

/**
 <p>The name of the product configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A key/value pair containing user-defined metadata that you can associate with an Amazon EMR resource. Tags make it easier to associate clusters in various ways, such as grouping clusters to track your Amazon EMR resource allocation costs. For more information, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag Clusters</a>. </p>
 */
@interface AWSEmrTag : AWSModel


/**
 <p>A user-defined key, which is the minimum required information for a valid tag. For more information, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag </a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>A user-defined value, which is optional in a tag. For more information, see <a href="https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html">Tag Clusters</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p> Input to the <a>TerminateJobFlows</a> operation. </p>
 Required parameters: [JobFlowIds]
 */
@interface AWSEmrTerminateJobFlowsInput : AWSRequest


/**
 <p>A list of job flows to be shutdown.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable jobFlowIds;

@end

/**
 <p>EBS volume specifications such as volume type, IOPS, and size (GiB) that will be requested for the EBS volume attached to an EC2 instance in the cluster.</p>
 Required parameters: [VolumeType, SizeInGB]
 */
@interface AWSEmrVolumeSpecification : AWSModel


/**
 <p>The number of I/O operations per second (IOPS) that the volume supports.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>The volume size, in gibibytes (GiB). This can be a number from 1 - 1024. If the volume type is EBS-optimized, the minimum value is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInGB;

/**
 <p>The volume type. Volume types supported are gp2, io1, standard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeType;

@end

NS_ASSUME_NONNULL_END
