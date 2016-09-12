//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

FOUNDATION_EXPORT NSString *const AWSAutoScalingErrorDomain;

typedef NS_ENUM(NSInteger, AWSAutoScalingErrorType) {
    AWSAutoScalingErrorUnknown,
    AWSAutoScalingErrorAlreadyExists,
    AWSAutoScalingErrorInvalidNextToken,
    AWSAutoScalingErrorLimitExceeded,
    AWSAutoScalingErrorResourceContention,
    AWSAutoScalingErrorResourceInUse,
    AWSAutoScalingErrorScalingActivityInProgress,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingLifecycleState) {
    AWSAutoScalingLifecycleStateUnknown,
    AWSAutoScalingLifecycleStatePending,
    AWSAutoScalingLifecycleStatePendingWait,
    AWSAutoScalingLifecycleStatePendingProceed,
    AWSAutoScalingLifecycleStateQuarantined,
    AWSAutoScalingLifecycleStateInService,
    AWSAutoScalingLifecycleStateTerminating,
    AWSAutoScalingLifecycleStateTerminatingWait,
    AWSAutoScalingLifecycleStateTerminatingProceed,
    AWSAutoScalingLifecycleStateTerminated,
    AWSAutoScalingLifecycleStateDetaching,
    AWSAutoScalingLifecycleStateDetached,
    AWSAutoScalingLifecycleStateEnteringStandby,
    AWSAutoScalingLifecycleStateStandby,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingScalingActivityStatusCode) {
    AWSAutoScalingScalingActivityStatusCodeUnknown,
    AWSAutoScalingScalingActivityStatusCodePendingSpotBidPlacement,
    AWSAutoScalingScalingActivityStatusCodeWaitingForSpotInstanceRequestId,
    AWSAutoScalingScalingActivityStatusCodeWaitingForSpotInstanceId,
    AWSAutoScalingScalingActivityStatusCodeWaitingForInstanceId,
    AWSAutoScalingScalingActivityStatusCodePreInService,
    AWSAutoScalingScalingActivityStatusCodeInProgress,
    AWSAutoScalingScalingActivityStatusCodeWaitingForELBConnectionDraining,
    AWSAutoScalingScalingActivityStatusCodeMidLifecycleAction,
    AWSAutoScalingScalingActivityStatusCodeWaitingForInstanceWarmup,
    AWSAutoScalingScalingActivityStatusCodeSuccessful,
    AWSAutoScalingScalingActivityStatusCodeFailed,
    AWSAutoScalingScalingActivityStatusCodeCancelled,
};

@class AWSAutoScalingActivitiesType;
@class AWSAutoScalingActivity;
@class AWSAutoScalingActivityType;
@class AWSAutoScalingAdjustmentType;
@class AWSAutoScalingAlarm;
@class AWSAutoScalingAttachInstancesQuery;
@class AWSAutoScalingAttachLoadBalancerTargetGroupsResultType;
@class AWSAutoScalingAttachLoadBalancerTargetGroupsType;
@class AWSAutoScalingAttachLoadBalancersResultType;
@class AWSAutoScalingAttachLoadBalancersType;
@class AWSAutoScalingAutoScalingGroup;
@class AWSAutoScalingAutoScalingGroupNamesType;
@class AWSAutoScalingAutoScalingGroupsType;
@class AWSAutoScalingAutoScalingInstanceDetails;
@class AWSAutoScalingAutoScalingInstancesType;
@class AWSAutoScalingBlockDeviceMapping;
@class AWSAutoScalingCompleteLifecycleActionAnswer;
@class AWSAutoScalingCompleteLifecycleActionType;
@class AWSAutoScalingCreateAutoScalingGroupType;
@class AWSAutoScalingCreateLaunchConfigurationType;
@class AWSAutoScalingCreateOrUpdateTagsType;
@class AWSAutoScalingDeleteAutoScalingGroupType;
@class AWSAutoScalingDeleteLifecycleHookAnswer;
@class AWSAutoScalingDeleteLifecycleHookType;
@class AWSAutoScalingDeleteNotificationConfigurationType;
@class AWSAutoScalingDeletePolicyType;
@class AWSAutoScalingDeleteScheduledActionType;
@class AWSAutoScalingDeleteTagsType;
@class AWSAutoScalingDescribeAccountLimitsAnswer;
@class AWSAutoScalingDescribeAdjustmentTypesAnswer;
@class AWSAutoScalingDescribeAutoScalingInstancesType;
@class AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer;
@class AWSAutoScalingDescribeLifecycleHookTypesAnswer;
@class AWSAutoScalingDescribeLifecycleHooksAnswer;
@class AWSAutoScalingDescribeLifecycleHooksType;
@class AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest;
@class AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse;
@class AWSAutoScalingDescribeLoadBalancersRequest;
@class AWSAutoScalingDescribeLoadBalancersResponse;
@class AWSAutoScalingDescribeMetricCollectionTypesAnswer;
@class AWSAutoScalingDescribeNotificationConfigurationsAnswer;
@class AWSAutoScalingDescribeNotificationConfigurationsType;
@class AWSAutoScalingDescribePoliciesType;
@class AWSAutoScalingDescribeScalingActivitiesType;
@class AWSAutoScalingDescribeScheduledActionsType;
@class AWSAutoScalingDescribeTagsType;
@class AWSAutoScalingDescribeTerminationPolicyTypesAnswer;
@class AWSAutoScalingDetachInstancesAnswer;
@class AWSAutoScalingDetachInstancesQuery;
@class AWSAutoScalingDetachLoadBalancerTargetGroupsResultType;
@class AWSAutoScalingDetachLoadBalancerTargetGroupsType;
@class AWSAutoScalingDetachLoadBalancersResultType;
@class AWSAutoScalingDetachLoadBalancersType;
@class AWSAutoScalingDisableMetricsCollectionQuery;
@class AWSAutoScalingEbs;
@class AWSAutoScalingEnableMetricsCollectionQuery;
@class AWSAutoScalingEnabledMetric;
@class AWSAutoScalingEnterStandbyAnswer;
@class AWSAutoScalingEnterStandbyQuery;
@class AWSAutoScalingExecutePolicyType;
@class AWSAutoScalingExitStandbyAnswer;
@class AWSAutoScalingExitStandbyQuery;
@class AWSAutoScalingFilter;
@class AWSAutoScalingInstance;
@class AWSAutoScalingInstanceMonitoring;
@class AWSAutoScalingLaunchConfiguration;
@class AWSAutoScalingLaunchConfigurationNameType;
@class AWSAutoScalingLaunchConfigurationNamesType;
@class AWSAutoScalingLaunchConfigurationsType;
@class AWSAutoScalingLifecycleHook;
@class AWSAutoScalingLoadBalancerState;
@class AWSAutoScalingLoadBalancerTargetGroupState;
@class AWSAutoScalingMetricCollectionType;
@class AWSAutoScalingMetricGranularityType;
@class AWSAutoScalingNotificationConfiguration;
@class AWSAutoScalingPoliciesType;
@class AWSAutoScalingPolicyARNType;
@class AWSAutoScalingProcessType;
@class AWSAutoScalingProcessesType;
@class AWSAutoScalingPutLifecycleHookAnswer;
@class AWSAutoScalingPutLifecycleHookType;
@class AWSAutoScalingPutNotificationConfigurationType;
@class AWSAutoScalingPutScalingPolicyType;
@class AWSAutoScalingPutScheduledUpdateGroupActionType;
@class AWSAutoScalingRecordLifecycleActionHeartbeatAnswer;
@class AWSAutoScalingRecordLifecycleActionHeartbeatType;
@class AWSAutoScalingScalingPolicy;
@class AWSAutoScalingScalingProcessQuery;
@class AWSAutoScalingScheduledActionsType;
@class AWSAutoScalingScheduledUpdateGroupAction;
@class AWSAutoScalingSetDesiredCapacityType;
@class AWSAutoScalingSetInstanceHealthQuery;
@class AWSAutoScalingSetInstanceProtectionAnswer;
@class AWSAutoScalingSetInstanceProtectionQuery;
@class AWSAutoScalingStepAdjustment;
@class AWSAutoScalingSuspendedProcess;
@class AWSAutoScalingTag;
@class AWSAutoScalingTagDescription;
@class AWSAutoScalingTagsType;
@class AWSAutoScalingTerminateInstanceInAutoScalingGroupType;
@class AWSAutoScalingUpdateAutoScalingGroupType;

/**
 <p>Contains the output of DescribeScalingActivities.</p>
 Required parameters: [Activities]
 */
@interface AWSAutoScalingActivitiesType : AWSModel


/**
 <p>The scaling activities. Activities are sorted by start time. Activities still in progress are described first.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingActivity *> * _Nullable activities;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Describes scaling activity, which is a long-running process that represents a change to your Auto Scaling group, such as changing its size or replacing an instance.</p>
 Required parameters: [ActivityId, AutoScalingGroupName, Cause, StartTime, StatusCode]
 */
@interface AWSAutoScalingActivity : AWSModel


/**
 <p>The ID of the activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activityId;

/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The reason the activity began.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cause;

/**
 <p>A friendly, more verbose description of the activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The details about the activity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable details;

/**
 <p>The end time of the activity.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>A value between 0 and 100 that indicates the progress of the activity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable progress;

/**
 <p>The start time of the activity.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The current status of the activity.</p>
 */
@property (nonatomic, assign) AWSAutoScalingScalingActivityStatusCode statusCode;

/**
 <p>A friendly, more verbose description of the activity status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 <p>Contains the output of TerminateInstancesInAutoScalingGroup.</p>
 */
@interface AWSAutoScalingActivityType : AWSModel


/**
 <p>A scaling activity.</p>
 */
@property (nonatomic, strong) AWSAutoScalingActivity * _Nullable activity;

@end

/**
 <p>Describes a policy adjustment type.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/as-scale-based-on-demand.html">Dynamic Scaling</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@interface AWSAutoScalingAdjustmentType : AWSModel


/**
 <p>The policy adjustment type. The valid values are <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and <code>PercentChangeInCapacity</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adjustmentType;

@end

/**
 <p>Describes an alarm.</p>
 */
@interface AWSAutoScalingAlarm : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmARN;

/**
 <p>The name of the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

@end

/**
 <p>Contains the parameters for AttachInstances.</p>
 Required parameters: [AutoScalingGroupName]
 */
@interface AWSAutoScalingAttachInstancesQuery : AWSRequest


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

@end

/**
 
 */
@interface AWSAutoScalingAttachLoadBalancerTargetGroupsResultType : AWSModel


@end

/**
 <p>Contains the parameters for AttachLoadBalancerTargetGroups.</p>
 Required parameters: [AutoScalingGroupName, TargetGroupARNs]
 */
@interface AWSAutoScalingAttachLoadBalancerTargetGroupsType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The Amazon Resource Names (ARN) of the target groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetGroupARNs;

@end

/**
 <p>Contains the output of AttachLoadBalancers.</p>
 */
@interface AWSAutoScalingAttachLoadBalancersResultType : AWSModel


@end

/**
 <p>Contains the parameters for AttachLoadBalancers.</p>
 Required parameters: [AutoScalingGroupName, LoadBalancerNames]
 */
@interface AWSAutoScalingAttachLoadBalancersType : AWSRequest


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more load balancer names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerNames;

@end

/**
 <p>Describes an Auto Scaling group.</p>
 Required parameters: [AutoScalingGroupName, MinSize, MaxSize, DesiredCapacity, DefaultCooldown, AvailabilityZones, HealthCheckType, CreatedTime]
 */
@interface AWSAutoScalingAutoScalingGroup : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupARN;

/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more Availability Zones for the group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>The date and time the group was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The amount of time, in seconds, after a scaling activity completes before another scaling activity can start.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultCooldown;

/**
 <p>The desired size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>The metrics enabled for the group.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingEnabledMetric *> * _Nullable enabledMetrics;

/**
 <p>The amount of time, in seconds, that Auto Scaling waits before checking the health status of an EC2 instance that has come into service.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckGracePeriod;

/**
 <p>The service to use for the health checks. The valid values are <code>EC2</code> and <code>ELB</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckType;

/**
 <p>The EC2 instances associated with the group.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingInstance *> * _Nullable instances;

/**
 <p>The name of the associated launch configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

/**
 <p>One or more load balancers associated with the group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerNames;

/**
 <p>The maximum size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSize;

/**
 <p>The minimum size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

/**
 <p>Indicates whether newly launched instances are protected from termination by Auto Scaling when scaling in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable latestInstancesProtectedFromScaleIn;

/**
 <p>The name of the placement group into which you'll launch your instances, if any. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable placementGroup;

/**
 <p>The current state of the group when <a>DeleteAutoScalingGroup</a> is in progress.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The suspended processes associated with the group.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingSuspendedProcess *> * _Nullable suspendedProcesses;

/**
 <p>The tags for the group.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingTagDescription *> * _Nullable tags;

/**
 <p>The Amazon Resource Names (ARN) of the target groups for your load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetGroupARNs;

/**
 <p>The termination policies for the group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable terminationPolicies;

/**
 <p>One or more subnet IDs, if applicable, separated by commas.</p><p>If you specify <code>VPCZoneIdentifier</code> and <code>AvailabilityZones</code>, ensure that the Availability Zones of the subnets match the values for <code>AvailabilityZones</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VPCZoneIdentifier;

@end

/**
 <p>Contains the parameters for DescribeAutoScalingGroups.</p>
 */
@interface AWSAutoScalingAutoScalingGroupNamesType : AWSRequest


/**
 <p>The group names. If you omit this parameter, all Auto Scaling groups are described.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoScalingGroupNames;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output for DescribeAutoScalingGroups.</p>
 Required parameters: [AutoScalingGroups]
 */
@interface AWSAutoScalingAutoScalingGroupsType : AWSModel


/**
 <p>The groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingAutoScalingGroup *> * _Nullable autoScalingGroups;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Describes an EC2 instance associated with an Auto Scaling group.</p>
 Required parameters: [InstanceId, AutoScalingGroupName, AvailabilityZone, LifecycleState, HealthStatus, LaunchConfigurationName, ProtectedFromScaleIn]
 */
@interface AWSAutoScalingAutoScalingInstanceDetails : AWSModel


/**
 <p>The name of the Auto Scaling group associated with the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The Availability Zone for the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The last reported health status of this instance. "Healthy" means that the instance is healthy and should remain in service. "Unhealthy" means that the instance is unhealthy and Auto Scaling should terminate and replace it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthStatus;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The launch configuration associated with the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

/**
 <p>The lifecycle state for the instance. For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html">Auto Scaling Lifecycle</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleState;

/**
 <p>Indicates whether the instance is protected from termination by Auto Scaling when scaling in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable protectedFromScaleIn;

@end

/**
 <p>Contains the output of DescribeAutoScalingInstances.</p>
 */
@interface AWSAutoScalingAutoScalingInstancesType : AWSModel


/**
 <p>The instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingAutoScalingInstanceDetails *> * _Nullable autoScalingInstances;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Describes a block device mapping.</p>
 Required parameters: [DeviceName]
 */
@interface AWSAutoScalingBlockDeviceMapping : AWSModel


/**
 <p>The device name exposed to the EC2 instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>The information about the Amazon EBS volume.</p>
 */
@property (nonatomic, strong) AWSAutoScalingEbs * _Nullable ebs;

/**
 <p>Suppresses a device mapping.</p><p>If this parameter is true for the root device, the instance might fail the EC2 health check. Auto Scaling launches a replacement instance if the instance fails the health check.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable noDevice;

/**
 <p>The name of the virtual device (for example, <code>ephemeral0</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualName;

@end

/**
 <p>Contains the output of CompleteLifecycleAction.</p>
 */
@interface AWSAutoScalingCompleteLifecycleActionAnswer : AWSModel


@end

/**
 <p>Contains the parameters for CompleteLifecycleAction.</p>
 Required parameters: [LifecycleHookName, AutoScalingGroupName, LifecycleActionResult]
 */
@interface AWSAutoScalingCompleteLifecycleActionType : AWSRequest


/**
 <p>The name of the group for the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The action for the group to take. This parameter can be either <code>CONTINUE</code> or <code>ABANDON</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleActionResult;

/**
 <p>A universally unique identifier (UUID) that identifies a specific lifecycle action associated with an instance. Auto Scaling sends this token to the notification target you specified when you created the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleActionToken;

/**
 <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleHookName;

@end

/**
 <p>Contains the parameters for CreateAutoScalingGroup.</p>
 Required parameters: [AutoScalingGroupName, MinSize, MaxSize]
 */
@interface AWSAutoScalingCreateAutoScalingGroupType : AWSRequest


/**
 <p>The name of the group. This name must be unique within the scope of your AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more Availability Zones for the group. This parameter is optional if you specify one or more subnets.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>The amount of time, in seconds, after a scaling activity completes before another scaling activity can start. The default is 300.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/Cooldown.html">Auto Scaling Cooldowns</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultCooldown;

/**
 <p>The number of EC2 instances that should be running in the group. This number must be greater than or equal to the minimum size of the group and less than or equal to the maximum size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>The amount of time, in seconds, that Auto Scaling waits before checking the health status of an EC2 instance that has come into service. During this time, any health check failures for the instance are ignored. The default is 0.</p><p>This parameter is required if you are adding an <code>ELB</code> health check.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/healthcheck.html">Health Checks</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckGracePeriod;

/**
 <p>The service to use for the health checks. The valid values are <code>EC2</code> and <code>ELB</code>.</p><p>By default, health checks use Amazon EC2 instance status checks to determine the health of an instance. For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/healthcheck.html">Health Checks</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckType;

/**
 <p>The ID of the instance used to create a launch configuration for the group. Alternatively, specify a launch configuration instead of an EC2 instance.</p><p>When you specify an ID of an instance, Auto Scaling creates a new launch configuration and associates it with the group. This launch configuration derives its attributes from the specified instance, with the exception of the block device mapping.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/create-asg-from-instance.html">Create an Auto Scaling Group Using an EC2 Instance</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the launch configuration. Alternatively, specify an EC2 instance instead of a launch configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

/**
 <p>One or more Classic load balancers. To specify an Application load balancer, use <code>TargetGroupARNs</code> instead.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US_SetUpASLBApp.html">Using a Load Balancer With an Auto Scaling Group</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerNames;

/**
 <p>The maximum size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSize;

/**
 <p>The minimum size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

/**
 <p>Indicates whether newly launched instances are protected from termination by Auto Scaling when scaling in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable latestInstancesProtectedFromScaleIn;

/**
 <p>The name of the placement group into which you'll launch your instances, if any. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable placementGroup;

/**
 <p>One or more tags.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/ASTagging.html">Tagging Auto Scaling Groups and Instances</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingTag *> * _Nullable tags;

/**
 <p>The Amazon Resource Names (ARN) of the target groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetGroupARNs;

/**
 <p>One or more termination policies used to select the instance to terminate. These policies are executed in the order that they are listed.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingBehavior.InstanceTermination.html">Controlling Which Instances Auto Scaling Terminates During Scale In</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable terminationPolicies;

/**
 <p>A comma-separated list of subnet identifiers for your virtual private cloud (VPC).</p><p>If you specify subnets and Availability Zones with this call, ensure that the subnets' Availability Zones match the Availability Zones specified.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/asg-in-vpc.html">Launching Auto Scaling Instances in a VPC</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VPCZoneIdentifier;

@end

/**
 <p>Contains the parameters for CreateLaunchConfiguration.</p>
 Required parameters: [LaunchConfigurationName]
 */
@interface AWSAutoScalingCreateLaunchConfigurationType : AWSRequest


/**
 <p>Used for groups that launch instances into a virtual private cloud (VPC). Specifies whether to assign a public IP address to each instance. For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/asg-in-vpc.html">Launching Auto Scaling Instances in a VPC</a> in the <i>Auto Scaling User Guide</i>.</p><p>If you specify this parameter, be sure to specify at least one subnet when you create your group.</p><p>Default: If the instance is launched into a default subnet, the default is <code>true</code>. If the instance is launched into a nondefault subnet, the default is <code>false</code>. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html">Supported Platforms</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable associatePublicIpAddress;

/**
 <p>One or more mappings that specify how block devices are exposed to the instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html">Block Device Mapping</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingBlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>The ID of a ClassicLink-enabled VPC to link your EC2-Classic instances to. This parameter is supported only if you are launching EC2-Classic instances. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable classicLinkVPCId;

/**
 <p>The IDs of one or more security groups for the specified ClassicLink-enabled VPC. This parameter is required if you specify a ClassicLink-enabled VPC, and is not supported otherwise. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable classicLinkVPCSecurityGroups;

/**
 <p>Indicates whether the instance is optimized for Amazon EBS I/O. By default, the instance is not optimized for EBS I/O. The optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal I/O performance. This optimization is not available with all instance types. Additional usage charges apply. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html">Amazon EBS-Optimized Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsOptimized;

/**
 <p>The name or the Amazon Resource Name (ARN) of the instance profile associated with the IAM role for the instance.</p><p>EC2 instances launched with an IAM role will automatically have AWS security credentials available. You can use IAM roles with Auto Scaling to automatically enable applications running on your EC2 instances to securely access other AWS resources. For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/us-iam-role.html">Launch Auto Scaling Instances with an IAM Role</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamInstanceProfile;

/**
 <p>The ID of the Amazon Machine Image (AMI) to use to launch your EC2 instances. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html">Finding an AMI</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The ID of the instance to use to create the launch configuration.</p><p>The new launch configuration derives attributes from the instance, with the exception of the block device mapping.</p><p>To create a launch configuration with a block device mapping or override any other instance attributes, specify them as part of the same request.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/create-lc-with-instanceID.html">Create a Launch Configuration Using an EC2 Instance</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Enables detailed monitoring if it is disabled. Detailed monitoring is enabled by default.</p><p>When detailed monitoring is enabled, Amazon CloudWatch generates metrics every minute and your account is charged a fee. When you disable detailed monitoring, by specifying <code>False</code>, CloudWatch generates metrics every 5 minutes. For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/as-instance-monitoring.html">Monitoring Your Auto Scaling Instances and Groups</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceMonitoring * _Nullable instanceMonitoring;

/**
 <p>The instance type of the EC2 instance. For information about available instance types, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes"> Available Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The ID of the kernel associated with the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kernelId;

/**
 <p>The name of the key pair. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Amazon EC2 Key Pairs</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>The name of the launch configuration. This name must be unique within the scope of your AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

/**
 <p>The tenancy of the instance. An instance with a tenancy of <code>dedicated</code> runs on single-tenant hardware and can only be launched into a VPC.</p><p>You must set the value of this parameter to <code>dedicated</code> if want to launch Dedicated Instances into a shared tenancy VPC (VPC with instance placement tenancy attribute set to <code>default</code>).</p><p>If you specify this parameter, be sure to specify at least one subnet when you create your group.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/asg-in-vpc.html">Launching Auto Scaling Instances in a VPC</a> in the <i>Auto Scaling User Guide</i>.</p><p>Valid values: <code>default</code> | <code>dedicated</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable placementTenancy;

/**
 <p>The ID of the RAM disk associated with the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ramdiskId;

/**
 <p>One or more security groups with which to associate the instances.</p><p>If your instances are launched in EC2-Classic, you can either specify security group names or the security group IDs. For more information about security groups for EC2-Classic, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Amazon EC2 Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>If your instances are launched into a VPC, specify security group IDs. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The maximum hourly price to be paid for any Spot Instance launched to fulfill the request. Spot Instances are launched when the price you specify exceeds the current Spot market price. For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US-SpotInstances.html">Launching Spot Instances in Your Auto Scaling Group</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotPrice;

/**
 <p>The user data to make available to the launched EC2 instances. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html">Instance Metadata and User Data</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userData;

@end

/**
 <p>Contains the parameters for CreateOrUpdateTags.</p>
 Required parameters: [Tags]
 */
@interface AWSAutoScalingCreateOrUpdateTagsType : AWSRequest


/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingTag *> * _Nullable tags;

@end

/**
 <p>Contains the parameters for DeleteAutoScalingGroup.</p>
 Required parameters: [AutoScalingGroupName]
 */
@interface AWSAutoScalingDeleteAutoScalingGroupType : AWSRequest


/**
 <p>The name of the group to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>Specifies that the group will be deleted along with all instances associated with the group, without waiting for all instances to be terminated. This parameter also deletes any lifecycle actions associated with the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceDelete;

@end

/**
 <p>Contains the output of DeleteLifecycleHook.</p>
 */
@interface AWSAutoScalingDeleteLifecycleHookAnswer : AWSModel


@end

/**
 <p>Contains the parameters for DeleteLifecycleHook.</p>
 Required parameters: [LifecycleHookName, AutoScalingGroupName]
 */
@interface AWSAutoScalingDeleteLifecycleHookType : AWSRequest


/**
 <p>The name of the Auto Scaling group for the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleHookName;

@end

/**
 <p>Contains the parameters for DeleteNotificationConfiguration.</p>
 Required parameters: [AutoScalingGroupName, TopicARN]
 */
@interface AWSAutoScalingDeleteNotificationConfigurationType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicARN;

@end

/**
 <p>Contains the parameters for DeletePolicy.</p>
 Required parameters: [PolicyName]
 */
@interface AWSAutoScalingDeletePolicyType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The name or Amazon Resource Name (ARN) of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Contains the parameters for DeleteScheduledAction.</p>
 Required parameters: [AutoScalingGroupName, ScheduledActionName]
 */
@interface AWSAutoScalingDeleteScheduledActionType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The name of the action to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

@end

/**
 <p>Contains the parameters for DeleteTags.</p>
 Required parameters: [Tags]
 */
@interface AWSAutoScalingDeleteTagsType : AWSRequest


/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingTag *> * _Nullable tags;

@end

/**
 <p>Contains the parameters for DescribeAccountLimits.</p>
 */
@interface AWSAutoScalingDescribeAccountLimitsAnswer : AWSModel


/**
 <p>The maximum number of groups allowed for your AWS account. The default limit is 20 per region.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxNumberOfAutoScalingGroups;

/**
 <p>The maximum number of launch configurations allowed for your AWS account. The default limit is 100 per region.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxNumberOfLaunchConfigurations;

/**
 <p>The current number of groups for your AWS account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfAutoScalingGroups;

/**
 <p>The current number of launch configurations for your AWS account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfLaunchConfigurations;

@end

/**
 <p>Contains the parameters for DescribeAdjustmentTypes.</p>
 */
@interface AWSAutoScalingDescribeAdjustmentTypesAnswer : AWSModel


/**
 <p>The policy adjustment types.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingAdjustmentType *> * _Nullable adjustmentTypes;

@end

/**
 <p>Contains the parameters for DescribeAutoScalingInstances.</p>
 */
@interface AWSAutoScalingDescribeAutoScalingInstancesType : AWSRequest


/**
 <p>The instances to describe; up to 50 instance IDs. If you omit this parameter, all Auto Scaling instances are described. If you specify an ID that does not exist, it is ignored with no error.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeAutoScalingNotificationTypes.</p>
 */
@interface AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer : AWSModel


/**
 <p>The notification types.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoScalingNotificationTypes;

@end

/**
 <p>Contains the output of DescribeLifecycleHookTypes.</p>
 */
@interface AWSAutoScalingDescribeLifecycleHookTypesAnswer : AWSModel


/**
 <p>The lifecycle hook types.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable lifecycleHookTypes;

@end

/**
 <p>Contains the output of DescribeLifecycleHooks.</p>
 */
@interface AWSAutoScalingDescribeLifecycleHooksAnswer : AWSModel


/**
 <p>The lifecycle hooks for the specified group.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingLifecycleHook *> * _Nullable lifecycleHooks;

@end

/**
 <p>Contains the parameters for DescribeLifecycleHooks.</p>
 Required parameters: [AutoScalingGroupName]
 */
@interface AWSAutoScalingDescribeLifecycleHooksType : AWSRequest


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The names of one or more lifecycle hooks. If you omit this parameter, all lifecycle hooks are described.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable lifecycleHookNames;

@end

/**
 <p>Contains the parameters for DescribeLoadBalancerTargetGroups.</p>
 Required parameters: [AutoScalingGroupName]
 */
@interface AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeLoadBalancerTargetGroups.</p>
 */
@interface AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse : AWSModel


/**
 <p>Information about the target groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingLoadBalancerTargetGroupState *> * _Nullable loadBalancerTargetGroups;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the parameters for DescribeLoadBalancers.</p>
 Required parameters: [AutoScalingGroupName]
 */
@interface AWSAutoScalingDescribeLoadBalancersRequest : AWSRequest


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeLoadBalancers.</p>
 */
@interface AWSAutoScalingDescribeLoadBalancersResponse : AWSModel


/**
 <p>The load balancers.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingLoadBalancerState *> * _Nullable loadBalancers;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeMetricsCollectionTypes.</p>
 */
@interface AWSAutoScalingDescribeMetricCollectionTypesAnswer : AWSModel


/**
 <p>The granularities for the metrics.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingMetricGranularityType *> * _Nullable granularities;

/**
 <p>One or more metrics.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingMetricCollectionType *> * _Nullable metrics;

@end

/**
 <p>Contains the output from DescribeNotificationConfigurations.</p>
 Required parameters: [NotificationConfigurations]
 */
@interface AWSAutoScalingDescribeNotificationConfigurationsAnswer : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The notification configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingNotificationConfiguration *> * _Nullable notificationConfigurations;

@end

/**
 <p>Contains the parameters for DescribeNotificationConfigurations.</p>
 */
@interface AWSAutoScalingDescribeNotificationConfigurationsType : AWSRequest


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoScalingGroupNames;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the parameters for DescribePolicies.</p>
 */
@interface AWSAutoScalingDescribePoliciesType : AWSRequest


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The maximum number of items to be returned with each call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>One or more policy names or policy ARNs to be described. If you omit this parameter, all policy names are described. If an group name is provided, the results are limited to that group. This list is limited to 50 items. If you specify an unknown policy name, it is ignored with no error.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNames;

/**
 <p>One or more policy types. Valid values are <code>SimpleScaling</code> and <code>StepScaling</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyTypes;

@end

/**
 <p>Contains the parameters for DescribeScalingActivities.</p>
 */
@interface AWSAutoScalingDescribeScalingActivitiesType : AWSRequest


/**
 <p>The activity IDs of the desired scaling activities. If you omit this parameter, all activities for the past six weeks are described. If you specify an Auto Scaling group, the results are limited to that group. The list of requested activities cannot contain more than 50 items. If unknown activities are requested, they are ignored with no error.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable activityIds;

/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the parameters for DescribeScheduledActions.</p>
 */
@interface AWSAutoScalingDescribeScheduledActionsType : AWSRequest


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The latest scheduled start time to return. If scheduled action names are provided, this parameter is ignored.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Describes one or more scheduled actions. If you omit this parameter, all scheduled actions are described. If you specify an unknown scheduled action, it is ignored with no error.</p><p>You can describe up to a maximum of 50 instances with a single call. If there are more items to return, the call returns a token. To get the next set of items, repeat the call with the returned token.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scheduledActionNames;

/**
 <p>The earliest scheduled start time to return. If scheduled action names are provided, this parameter is ignored.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p>Contains the parameters for DescribeTags.</p>
 */
@interface AWSAutoScalingDescribeTagsType : AWSRequest


/**
 <p>A filter used to scope the tags to return.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeTerminationPolicyTypes.</p>
 */
@interface AWSAutoScalingDescribeTerminationPolicyTypesAnswer : AWSModel


/**
 <p>The termination policies supported by Auto Scaling (<code>OldestInstance</code>, <code>OldestLaunchConfiguration</code>, <code>NewestInstance</code>, <code>ClosestToNextInstanceHour</code>, and <code>Default</code>).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable terminationPolicyTypes;

@end

/**
 <p>Contains the output of DetachInstances.</p>
 */
@interface AWSAutoScalingDetachInstancesAnswer : AWSModel


/**
 <p>The activities related to detaching the instances from the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingActivity *> * _Nullable activities;

@end

/**
 <p>Contains the parameters for DetachInstances.</p>
 Required parameters: [AutoScalingGroupName, ShouldDecrementDesiredCapacity]
 */
@interface AWSAutoScalingDetachInstancesQuery : AWSRequest


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>If <code>True</code>, the Auto Scaling group decrements the desired capacity value by the number of instances detached.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable shouldDecrementDesiredCapacity;

@end

/**
 
 */
@interface AWSAutoScalingDetachLoadBalancerTargetGroupsResultType : AWSModel


@end

/**
 
 */
@interface AWSAutoScalingDetachLoadBalancerTargetGroupsType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The Amazon Resource Names (ARN) of the target groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetGroupARNs;

@end

/**
 <p>Contains the output for DetachLoadBalancers.</p>
 */
@interface AWSAutoScalingDetachLoadBalancersResultType : AWSModel


@end

/**
 <p>Contains the parameters for DetachLoadBalancers.</p>
 Required parameters: [AutoScalingGroupName, LoadBalancerNames]
 */
@interface AWSAutoScalingDetachLoadBalancersType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more load balancer names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerNames;

@end

/**
 <p>Contains the parameters for DisableMetricsCollection.</p>
 Required parameters: [AutoScalingGroupName]
 */
@interface AWSAutoScalingDisableMetricsCollectionQuery : AWSRequest


/**
 <p>The name or Amazon Resource Name (ARN) of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more of the following metrics. If you omit this parameter, all metrics are disabled.</p><ul><li><p><code>GroupMinSize</code></p></li><li><p><code>GroupMaxSize</code></p></li><li><p><code>GroupDesiredCapacity</code></p></li><li><p><code>GroupInServiceInstances</code></p></li><li><p><code>GroupPendingInstances</code></p></li><li><p><code>GroupStandbyInstances</code></p></li><li><p><code>GroupTerminatingInstances</code></p></li><li><p><code>GroupTotalInstances</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable metrics;

@end

/**
 <p>Describes an Amazon EBS volume.</p>
 */
@interface AWSAutoScalingEbs : AWSModel


/**
 <p>Indicates whether the volume is deleted on instance termination.</p><p>Default: <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

/**
 <p>Indicates whether the volume should be encrypted. Encrypted EBS volumes must be attached to instances that support Amazon EBS encryption. Volumes that are created from encrypted snapshots are automatically encrypted. There is no way to create an encrypted volume from an unencrypted snapshot or an unencrypted volume from an encrypted snapshot. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The number of I/O operations per second (IOPS) to provision for the volume.</p><p>Constraint: Required when the volume type is <code>io1</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>The ID of the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>The volume size, in GiB. For <code>standard</code> volumes, specify a value from 1 to 1,024. For <code>io1</code> volumes, specify a value from 4 to 16,384. For <code>gp2</code> volumes, specify a value from 1 to 16,384. If you specify a snapshot, the volume size must be equal to or larger than the snapshot size.</p><p>Default: If you create a volume from a snapshot and you don't specify a volume size, the default is the snapshot size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSize;

/**
 <p>The volume type. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html">Amazon EBS Volume Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Valid values: <code>standard</code> | <code>io1</code> | <code>gp2</code></p><p>Default: <code>standard</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeType;

@end

/**
 <p>Contains the parameters for EnableMetricsCollection.</p>
 Required parameters: [AutoScalingGroupName, Granularity]
 */
@interface AWSAutoScalingEnableMetricsCollectionQuery : AWSRequest


/**
 <p>The name or ARN of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The granularity to associate with the metrics to collect. The only valid value is <code>1Minute</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable granularity;

/**
 <p>One or more of the following metrics. If you omit this parameter, all metrics are enabled.</p><ul><li><p><code>GroupMinSize</code></p></li><li><p><code>GroupMaxSize</code></p></li><li><p><code>GroupDesiredCapacity</code></p></li><li><p><code>GroupInServiceInstances</code></p></li><li><p><code>GroupPendingInstances</code></p></li><li><p><code>GroupStandbyInstances</code></p></li><li><p><code>GroupTerminatingInstances</code></p></li><li><p><code>GroupTotalInstances</code></p></li></ul><p>Note that the <code>GroupStandbyInstances</code> metric is not enabled by default. You must explicitly request this metric.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable metrics;

@end

/**
 <p>Describes an enabled metric.</p>
 */
@interface AWSAutoScalingEnabledMetric : AWSModel


/**
 <p>The granularity of the metric. The only valid value is <code>1Minute</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable granularity;

/**
 <p>One of the following metrics:</p><ul><li><p><code>GroupMinSize</code></p></li><li><p><code>GroupMaxSize</code></p></li><li><p><code>GroupDesiredCapacity</code></p></li><li><p><code>GroupInServiceInstances</code></p></li><li><p><code>GroupPendingInstances</code></p></li><li><p><code>GroupStandbyInstances</code></p></li><li><p><code>GroupTerminatingInstances</code></p></li><li><p><code>GroupTotalInstances</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable metric;

@end

/**
 <p>Contains the output of EnterStandby.</p>
 */
@interface AWSAutoScalingEnterStandbyAnswer : AWSModel


/**
 <p>The activities related to moving instances into <code>Standby</code> mode.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingActivity *> * _Nullable activities;

@end

/**
 <p>Contains the parameters for EnteStandby.</p>
 Required parameters: [AutoScalingGroupName, ShouldDecrementDesiredCapacity]
 */
@interface AWSAutoScalingEnterStandbyQuery : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more instances to move into <code>Standby</code> mode. You must specify at least one instance ID.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>Specifies whether the instances moved to <code>Standby</code> mode count as part of the Auto Scaling group's desired capacity. If set, the desired capacity for the Auto Scaling group decrements by the number of instances moved to <code>Standby</code> mode.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable shouldDecrementDesiredCapacity;

@end

/**
 <p>Contains the parameters for ExecutePolicy.</p>
 Required parameters: [PolicyName]
 */
@interface AWSAutoScalingExecutePolicyType : AWSRequest


/**
 <p>The name or Amazon Resource Name (ARN) of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The breach threshold for the alarm.</p><p>This parameter is required if the policy type is <code>StepScaling</code> and not supported otherwise.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable breachThreshold;

/**
 <p>If this parameter is true, Auto Scaling waits for the cooldown period to complete before executing the policy. Otherwise, Auto Scaling executes the policy without waiting for the cooldown period to complete.</p><p>This parameter is not supported if the policy type is <code>StepScaling</code>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/Cooldown.html">Auto Scaling Cooldowns</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable honorCooldown;

/**
 <p>The metric value to compare to <code>BreachThreshold</code>. This enables you to execute a policy of type <code>StepScaling</code> and determine which step adjustment to use. For example, if the breach threshold is 50 and you want to use a step adjustment with a lower bound of 0 and an upper bound of 10, you can set the metric value to 59.</p><p>If you specify a metric value that doesn't correspond to a step adjustment for the policy, the call returns an error.</p><p>This parameter is required if the policy type is <code>StepScaling</code> and not supported otherwise.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable metricValue;

/**
 <p>The name or ARN of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Contains the parameters for ExitStandby.</p>
 */
@interface AWSAutoScalingExitStandbyAnswer : AWSModel


/**
 <p>The activities related to moving instances out of <code>Standby</code> mode.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingActivity *> * _Nullable activities;

@end

/**
 <p>Contains the parameters for ExitStandby.</p>
 Required parameters: [AutoScalingGroupName]
 */
@interface AWSAutoScalingExitStandbyQuery : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more instance IDs. You must specify at least one instance ID.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

@end

/**
 <p>Describes a filter.</p>
 */
@interface AWSAutoScalingFilter : AWSModel


/**
 <p>The name of the filter. The valid values are: <code>"auto-scaling-group"</code>, <code>"key"</code>, <code>"value"</code>, and <code>"propagate-at-launch"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of the filter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Describes an EC2 instance.</p>
 Required parameters: [InstanceId, AvailabilityZone, LifecycleState, HealthStatus, LaunchConfigurationName, ProtectedFromScaleIn]
 */
@interface AWSAutoScalingInstance : AWSModel


/**
 <p>The Availability Zone in which the instance is running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The last reported health status of the instance. "Healthy" means that the instance is healthy and should remain in service. "Unhealthy" means that the instance is unhealthy and Auto Scaling should terminate and replace it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthStatus;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The launch configuration associated with the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

/**
 <p>A description of the current lifecycle state. Note that the <code>Quarantined</code> state is not used.</p>
 */
@property (nonatomic, assign) AWSAutoScalingLifecycleState lifecycleState;

/**
 <p>Indicates whether the instance is protected from termination by Auto Scaling when scaling in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable protectedFromScaleIn;

@end

/**
 <p>Describes whether instance monitoring is enabled.</p>
 */
@interface AWSAutoScalingInstanceMonitoring : AWSModel


/**
 <p>If <code>True</code>, instance monitoring is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Describes a launch configuration.</p>
 Required parameters: [LaunchConfigurationName, ImageId, InstanceType, CreatedTime]
 */
@interface AWSAutoScalingLaunchConfiguration : AWSModel


/**
 <p>[EC2-VPC] Indicates whether to assign a public IP address to each instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable associatePublicIpAddress;

/**
 <p>A block device mapping, which specifies the block devices for the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingBlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>The ID of a ClassicLink-enabled VPC to link your EC2-Classic instances to. This parameter can only be used if you are launching EC2-Classic instances. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable classicLinkVPCId;

/**
 <p>The IDs of one or more security groups for the VPC specified in <code>ClassicLinkVPCId</code>. This parameter is required if you specify a ClassicLink-enabled VPC, and cannot be used otherwise. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable classicLinkVPCSecurityGroups;

/**
 <p>The creation date and time for the launch configuration.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>Controls whether the instance is optimized for EBS I/O (<code>true</code>) or not (<code>false</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsOptimized;

/**
 <p>The name or Amazon Resource Name (ARN) of the instance profile associated with the IAM role for the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamInstanceProfile;

/**
 <p>The ID of the Amazon Machine Image (AMI).</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>Controls whether instances in this group are launched with detailed monitoring.</p>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceMonitoring * _Nullable instanceMonitoring;

/**
 <p>The instance type for the instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The ID of the kernel associated with the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kernelId;

/**
 <p>The name of the key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>The Amazon Resource Name (ARN) of the launch configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationARN;

/**
 <p>The name of the launch configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

/**
 <p>The tenancy of the instance, either <code>default</code> or <code>dedicated</code>. An instance with <code>dedicated</code> tenancy runs in an isolated, single-tenant hardware and can only be launched into a VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable placementTenancy;

/**
 <p>The ID of the RAM disk associated with the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ramdiskId;

/**
 <p>The security groups to associate with the instances.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The price to bid when launching Spot Instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotPrice;

/**
 <p>The user data available to the instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userData;

@end

/**
 <p>Contains the parameters for DeleteLaunchConfiguration.</p>
 Required parameters: [LaunchConfigurationName]
 */
@interface AWSAutoScalingLaunchConfigurationNameType : AWSRequest


/**
 <p>The name of the launch configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

@end

/**
 <p>Contains the parameters for DescribeLaunchConfigurations.</p>
 */
@interface AWSAutoScalingLaunchConfigurationNamesType : AWSRequest


/**
 <p>The launch configuration names. If you omit this parameter, all launch configurations are described.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable launchConfigurationNames;

/**
 <p>The maximum number of items to return with this call. The default is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeLaunchConfigurations.</p>
 Required parameters: [LaunchConfigurations]
 */
@interface AWSAutoScalingLaunchConfigurationsType : AWSModel


/**
 <p>The launch configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingLaunchConfiguration *> * _Nullable launchConfigurations;

/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Describes a lifecycle hook, which tells Auto Scaling that you want to perform an action when an instance launches or terminates. When you have a lifecycle hook in place, the Auto Scaling group will either:</p><ul><li><p>Pause the instance after it launches, but before it is put into service</p></li><li><p>Pause the instance as it terminates, but before it is fully terminated</p></li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingGroupLifecycle.html">Auto Scaling Lifecycle</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@interface AWSAutoScalingLifecycleHook : AWSModel


/**
 <p>The name of the Auto Scaling group for the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The valid values are <code>CONTINUE</code> and <code>ABANDON</code>. The default value is <code>CONTINUE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultResult;

/**
 <p>The maximum time, in seconds, that an instance can remain in a <code>Pending:Wait</code> or <code>Terminating:Wait</code> state. The default is 172800 seconds (48 hours).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable globalTimeout;

/**
 <p>The maximum time, in seconds, that can elapse before the lifecycle hook times out. The default is 3600 seconds (1 hour). When the lifecycle hook times out, Auto Scaling performs the default action. You can prevent the lifecycle hook from timing out by calling <a>RecordLifecycleActionHeartbeat</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable heartbeatTimeout;

/**
 <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleHookName;

/**
 <p>The state of the EC2 instance to which you want to attach the lifecycle hook. For a list of lifecycle hook types, see <a>DescribeLifecycleHookTypes</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleTransition;

/**
 <p>Additional information that you want to include any time Auto Scaling sends a message to the notification target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationMetadata;

/**
 <p>The ARN of the notification target that Auto Scaling uses to notify you when an instance is in the transition state for the lifecycle hook. This ARN target can be either an SQS queue or an SNS topic. The notification message sent to the target includes the following:</p><ul><li><p>Lifecycle action token</p></li><li><p>User account ID</p></li><li><p>Name of the Auto Scaling group</p></li><li><p>Lifecycle hook name</p></li><li><p>EC2 instance ID</p></li><li><p>Lifecycle transition</p></li><li><p>Notification metadata</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable notificationTargetARN;

/**
 <p>The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

@end

/**
 <p>Describes the state of a Classic load balancer.</p><p>If you specify a load balancer when creating the Auto Scaling group, the state of the load balancer is <code>InService</code>.</p><p>If you attach a load balancer to an existing Auto Scaling group, the initial state is <code>Adding</code>. The state transitions to <code>Added</code> after all instances in the group are registered with the load balancer. If ELB health checks are enabled for the load balancer, the state transitions to <code>InService</code> after at least one instance in the group passes the health check. If EC2 health checks are enabled instead, the load balancer remains in the <code>Added</code> state.</p>
 */
@interface AWSAutoScalingLoadBalancerState : AWSModel


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>One of the following load balancer states:</p><ul><li><p><code>Adding</code> - The instances in the group are being registered with the load balancer.</p></li><li><p><code>Added</code> - All instances in the group are registered with the load balancer.</p></li><li><p><code>InService</code> - At least one instance in the group passed an ELB health check.</p></li><li><p><code>Removing</code> - The instances in the group are being deregistered from the load balancer. If connection draining is enabled, Elastic Load Balancing waits for in-flight requests to complete before deregistering the instances.</p></li><li><p><code>Removed</code> - All instances in the group are deregistered from the load balancer.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable state;

@end

/**
 <p>Describes the state of a target group.</p><p>If you attach a target group to an existing Auto Scaling group, the initial state is <code>Adding</code>. The state transitions to <code>Added</code> after all Auto Scaling instances are registered with the target group. If ELB health checks are enabled, the state transitions to <code>InService</code> after at least one Auto Scaling instance passes the health check. If EC2 health checks are enabled instead, the target group remains in the <code>Added</code> state.</p>
 */
@interface AWSAutoScalingLoadBalancerTargetGroupState : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerTargetGroupARN;

/**
 <p>The state of the target group.</p><ul><li><p><code>Adding</code> - The Auto Scaling instances are being registered with the target group.</p></li><li><p><code>Added</code> - All Auto Scaling instances are registered with the target group.</p></li><li><p><code>InService</code> - At least one Auto Scaling instance passed an ELB health check.</p></li><li><p><code>Removing</code> - The Auto Scaling instances are being deregistered from the target group. If connection draining is enabled, Elastic Load Balancing waits for in-flight requests to complete before deregistering the instances.</p></li><li><p><code>Removed</code> - All Auto Scaling instances are deregistered from the target group.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable state;

@end

/**
 <p>Describes a metric.</p>
 */
@interface AWSAutoScalingMetricCollectionType : AWSModel


/**
 <p>One of the following metrics:</p><ul><li><p><code>GroupMinSize</code></p></li><li><p><code>GroupMaxSize</code></p></li><li><p><code>GroupDesiredCapacity</code></p></li><li><p><code>GroupInServiceInstances</code></p></li><li><p><code>GroupPendingInstances</code></p></li><li><p><code>GroupStandbyInstances</code></p></li><li><p><code>GroupTerminatingInstances</code></p></li><li><p><code>GroupTotalInstances</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable metric;

@end

/**
 <p>Describes a granularity of a metric.</p>
 */
@interface AWSAutoScalingMetricGranularityType : AWSModel


/**
 <p>The granularity. The only valid value is <code>1Minute</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable granularity;

@end

/**
 <p>Describes a notification.</p>
 */
@interface AWSAutoScalingNotificationConfiguration : AWSModel


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One of the following event notification types:</p><ul><li><p><code>autoscaling:EC2_INSTANCE_LAUNCH</code></p></li><li><p><code>autoscaling:EC2_INSTANCE_LAUNCH_ERROR</code></p></li><li><p><code>autoscaling:EC2_INSTANCE_TERMINATE</code></p></li><li><p><code>autoscaling:EC2_INSTANCE_TERMINATE_ERROR</code></p></li><li><p><code>autoscaling:TEST_NOTIFICATION</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable notificationType;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicARN;

@end

/**
 <p>Contains the output of DescribePolicies.</p>
 */
@interface AWSAutoScalingPoliciesType : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The scaling policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingScalingPolicy *> * _Nullable scalingPolicies;

@end

/**
 <p>Contains the output of PutScalingPolicy.</p>
 */
@interface AWSAutoScalingPolicyARNType : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyARN;

@end

/**
 <p>Describes a process type.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US_SuspendResume.html#process-types">Auto Scaling Processes</a> in the <i>Auto Scaling User Guide</i>.</p>
 Required parameters: [ProcessName]
 */
@interface AWSAutoScalingProcessType : AWSModel


/**
 <p>One of the following processes:</p><ul><li><p><code>Launch</code></p></li><li><p><code>Terminate</code></p></li><li><p><code>AddToLoadBalancer</code></p></li><li><p><code>AlarmNotification</code></p></li><li><p><code>AZRebalance</code></p></li><li><p><code>HealthCheck</code></p></li><li><p><code>ReplaceUnhealthy</code></p></li><li><p><code>ScheduledActions</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable processName;

@end

/**
 <p>Contains the output of DescribeScalingProcessTypes.</p>
 */
@interface AWSAutoScalingProcessesType : AWSModel


/**
 <p>The names of the process types.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingProcessType *> * _Nullable processes;

@end

/**
 <p>Contains the output of PutLifecycleHook.</p>
 */
@interface AWSAutoScalingPutLifecycleHookAnswer : AWSModel


@end

/**
 <p>Contains the parameters for PutLifecycleHook.</p>
 Required parameters: [LifecycleHookName, AutoScalingGroupName]
 */
@interface AWSAutoScalingPutLifecycleHookType : AWSRequest


/**
 <p>The name of the Auto Scaling group to which you want to assign the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. This parameter can be either <code>CONTINUE</code> or <code>ABANDON</code>. The default value is <code>ABANDON</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultResult;

/**
 <p>The amount of time, in seconds, that can elapse before the lifecycle hook times out. When the lifecycle hook times out, Auto Scaling performs the default action. You can prevent the lifecycle hook from timing out by calling <a>RecordLifecycleActionHeartbeat</a>. The default is 3600 seconds (1 hour).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable heartbeatTimeout;

/**
 <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleHookName;

/**
 <p>The instance state to which you want to attach the lifecycle hook. For a list of lifecycle hook types, see <a>DescribeLifecycleHookTypes</a>.</p><p>This parameter is required for new lifecycle hooks, but optional when updating existing hooks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleTransition;

/**
 <p>Contains additional information that you want to include any time Auto Scaling sends a message to the notification target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationMetadata;

/**
 <p>The ARN of the notification target that Auto Scaling will use to notify you when an instance is in the transition state for the lifecycle hook. This target can be either an SQS queue or an SNS topic. If you specify an empty string, this overrides the current ARN.</p><p>The notification messages sent to the target include the following information:</p><ul><li><p><b>AutoScalingGroupName</b>. The name of the Auto Scaling group.</p></li><li><p><b>AccountId</b>. The AWS account ID.</p></li><li><p><b>LifecycleTransition</b>. The lifecycle hook type.</p></li><li><p><b>LifecycleActionToken</b>. The lifecycle action token.</p></li><li><p><b>EC2InstanceId</b>. The EC2 instance ID.</p></li><li><p><b>LifecycleHookName</b>. The name of the lifecycle hook.</p></li><li><p><b>NotificationMetadata</b>. User-defined information.</p></li></ul><p>This operation uses the JSON format when sending notifications to an Amazon SQS queue, and an email key/value pair format when sending notifications to an Amazon SNS topic.</p><p>When you specify a notification target, Auto Scaling sends it a test message. Test messages contains the following additional key/value pair: <code>"Event": "autoscaling:TEST_NOTIFICATION"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationTargetARN;

/**
 <p>The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target.</p><p>This parameter is required for new lifecycle hooks, but optional when updating existing hooks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

@end

/**
 <p>Contains the parameters for PutNotificationConfiguration.</p>
 Required parameters: [AutoScalingGroupName, TopicARN, NotificationTypes]
 */
@interface AWSAutoScalingPutNotificationConfigurationType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The type of event that will cause the notification to be sent. For details about notification types supported by Auto Scaling, see <a>DescribeAutoScalingNotificationTypes</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notificationTypes;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicARN;

@end

/**
 <p>Contains the parameters for PutScalingPolicy.</p>
 Required parameters: [AutoScalingGroupName, PolicyName, AdjustmentType]
 */
@interface AWSAutoScalingPutScalingPolicyType : AWSRequest


/**
 <p>The adjustment type. Valid values are <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and <code>PercentChangeInCapacity</code>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/as-scale-based-on-demand.html">Dynamic Scaling</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adjustmentType;

/**
 <p>The name or ARN of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start. If this parameter is not specified, the default cooldown period for the group applies.</p><p>This parameter is not supported unless the policy type is <code>SimpleScaling</code>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/Cooldown.html">Auto Scaling Cooldowns</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cooldown;

/**
 <p>The estimated time, in seconds, until a newly launched instance can contribute to the CloudWatch metrics. The default is to use the value specified for the default cooldown period for the group.</p><p>This parameter is not supported if the policy type is <code>SimpleScaling</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable estimatedInstanceWarmup;

/**
 <p>The aggregation type for the CloudWatch metrics. Valid values are <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code>. If the aggregation type is null, the value is treated as <code>Average</code>.</p><p>This parameter is not supported if the policy type is <code>SimpleScaling</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricAggregationType;

/**
 <p>The minimum number of instances to scale. If the value of <code>AdjustmentType</code> is <code>PercentChangeInCapacity</code>, the scaling policy changes the <code>DesiredCapacity</code> of the Auto Scaling group by at least this many instances. Otherwise, the error is <code>ValidationError</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minAdjustmentMagnitude;

/**
 <p>Available for backward compatibility. Use <code>MinAdjustmentMagnitude</code> instead.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minAdjustmentStep;

/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy type. Valid values are <code>SimpleScaling</code> and <code>StepScaling</code>. If the policy type is null, the value is treated as <code>SimpleScaling</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyType;

/**
 <p>The amount by which to scale, based on the specified adjustment type. A positive value adds to the current capacity while a negative number removes from the current capacity.</p><p>This parameter is required if the policy type is <code>SimpleScaling</code> and not supported otherwise.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scalingAdjustment;

/**
 <p>A set of adjustments that enable you to scale based on the size of the alarm breach.</p><p>This parameter is required if the policy type is <code>StepScaling</code> and not supported otherwise.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingStepAdjustment *> * _Nullable stepAdjustments;

@end

/**
 <p>Contains the parameters for PutScheduledUpdateGroupAction.</p>
 Required parameters: [AutoScalingGroupName, ScheduledActionName]
 */
@interface AWSAutoScalingPutScheduledUpdateGroupActionType : AWSRequest


/**
 <p>The name or Amazon Resource Name (ARN) of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The number of EC2 instances that should be running in the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>The time for this action to end.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The maximum size for the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSize;

/**
 <p>The minimum size for the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

/**
 <p>The time when recurring future actions will start. Start time is specified by the user following the Unix cron syntax format. For more information, see <a href="http://en.wikipedia.org/wiki/Cron">Cron</a> in Wikipedia.</p><p>When <code>StartTime</code> and <code>EndTime</code> are specified with <code>Recurrence</code>, they form the boundaries of when the recurring action will start and stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recurrence;

/**
 <p>The name of this scaling action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

/**
 <p>The time for this action to start, in "YYYY-MM-DDThh:mm:ssZ" format in UTC/GMT only (for example, <code>2014-06-01T00:00:00Z</code>).</p><p>If you try to schedule your action in the past, Auto Scaling returns an error message.</p><p>When <code>StartTime</code> and <code>EndTime</code> are specified with <code>Recurrence</code>, they form the boundaries of when the recurring action starts and stops.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>This parameter is deprecated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable time;

@end

/**
 <p>Contains the output of RecordLifecycleActionHeartBeat.</p>
 */
@interface AWSAutoScalingRecordLifecycleActionHeartbeatAnswer : AWSModel


@end

/**
 <p>Contains the parameters for RecordLifecycleActionHeartbeat.</p>
 Required parameters: [LifecycleHookName, AutoScalingGroupName]
 */
@interface AWSAutoScalingRecordLifecycleActionHeartbeatType : AWSRequest


/**
 <p>The name of the Auto Scaling group for the hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A token that uniquely identifies a specific lifecycle action associated with an instance. Auto Scaling sends this token to the notification target you specified when you created the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleActionToken;

/**
 <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleHookName;

@end

/**
 <p>Describes a scaling policy.</p>
 */
@interface AWSAutoScalingScalingPolicy : AWSModel


/**
 <p>The adjustment type, which specifies how <code>ScalingAdjustment</code> is interpreted. Valid values are <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and <code>PercentChangeInCapacity</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adjustmentType;

/**
 <p>The CloudWatch alarms related to the policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingAlarm *> * _Nullable alarms;

/**
 <p>The name of the Auto Scaling group associated with this scaling policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The amount of time, in seconds, after a scaling activity completes before any further trigger-related scaling activities can start.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cooldown;

/**
 <p>The estimated time, in seconds, until a newly launched instance can contribute to the CloudWatch metrics.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable estimatedInstanceWarmup;

/**
 <p>The aggregation type for the CloudWatch metrics. Valid values are <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricAggregationType;

/**
 <p>The minimum number of instances to scale. If the value of <code>AdjustmentType</code> is <code>PercentChangeInCapacity</code>, the scaling policy changes the <code>DesiredCapacity</code> of the Auto Scaling group by at least this many instances. Otherwise, the error is <code>ValidationError</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minAdjustmentMagnitude;

/**
 <p>Available for backward compatibility. Use <code>MinAdjustmentMagnitude</code> instead.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minAdjustmentStep;

/**
 <p>The Amazon Resource Name (ARN) of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyARN;

/**
 <p>The name of the scaling policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy type. Valid values are <code>SimpleScaling</code> and <code>StepScaling</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyType;

/**
 <p>The amount by which to scale, based on the specified adjustment type. A positive value adds to the current capacity while a negative number removes from the current capacity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scalingAdjustment;

/**
 <p>A set of adjustments that enable you to scale based on the size of the alarm breach.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingStepAdjustment *> * _Nullable stepAdjustments;

@end

/**
 <p>Contains the parameters for SuspendProcesses and ResumeProcesses.</p>
 Required parameters: [AutoScalingGroupName]
 */
@interface AWSAutoScalingScalingProcessQuery : AWSRequest


/**
 <p>The name or Amazon Resource Name (ARN) of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more of the following processes. If you omit this parameter, all processes are specified.</p><ul><li><p><code>Launch</code></p></li><li><p><code>Terminate</code></p></li><li><p><code>HealthCheck</code></p></li><li><p><code>ReplaceUnhealthy</code></p></li><li><p><code>AZRebalance</code></p></li><li><p><code>AlarmNotification</code></p></li><li><p><code>ScheduledActions</code></p></li><li><p><code>AddToLoadBalancer</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scalingProcesses;

@end

/**
 <p>Contains the output of DescribeScheduledActions.</p>
 */
@interface AWSAutoScalingScheduledActionsType : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The scheduled actions.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingScheduledUpdateGroupAction *> * _Nullable scheduledUpdateGroupActions;

@end

/**
 <p>Describes a scheduled update to an Auto Scaling group.</p>
 */
@interface AWSAutoScalingScheduledUpdateGroupAction : AWSModel


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The number of instances you prefer to maintain in the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>The date and time that the action is scheduled to end. This date and time can be up to one month in the future.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The maximum size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSize;

/**
 <p>The minimum size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

/**
 <p>The recurring schedule for the action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recurrence;

/**
 <p>The Amazon Resource Name (ARN) of the scheduled action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionARN;

/**
 <p>The name of the scheduled action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

/**
 <p>The date and time that the action is scheduled to begin. This date and time can be up to one month in the future.</p><p>When <code>StartTime</code> and <code>EndTime</code> are specified with <code>Recurrence</code>, they form the boundaries of when the recurring action will start and stop.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>This parameter is deprecated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable time;

@end

/**
 <p>Contains the parameters for SetDesiredCapacity.</p>
 Required parameters: [AutoScalingGroupName, DesiredCapacity]
 */
@interface AWSAutoScalingSetDesiredCapacityType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The number of EC2 instances that should be running in the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>By default, <code>SetDesiredCapacity</code> overrides any cooldown period associated with the Auto Scaling group. Specify <code>True</code> to make Auto Scaling to wait for the cool-down period associated with the Auto Scaling group to complete before initiating a scaling activity to set your Auto Scaling group to its new capacity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable honorCooldown;

@end

/**
 <p>Contains the parameters for SetInstanceHealth.</p>
 Required parameters: [InstanceId, HealthStatus]
 */
@interface AWSAutoScalingSetInstanceHealthQuery : AWSRequest


/**
 <p>The health status of the instance. Set to <code>Healthy</code> if you want the instance to remain in service. Set to <code>Unhealthy</code> if you want the instance to be out of service. Auto Scaling will terminate and replace the unhealthy instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthStatus;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>If the Auto Scaling group of the specified instance has a <code>HealthCheckGracePeriod</code> specified for the group, by default, this call will respect the grace period. Set this to <code>False</code>, if you do not want the call to respect the grace period associated with the group.</p><p>For more information, see the description of the health check grace period for <a>CreateAutoScalingGroup</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable shouldRespectGracePeriod;

@end

/**
 <p>Contains the output of SetInstanceProtection.</p>
 */
@interface AWSAutoScalingSetInstanceProtectionAnswer : AWSModel


@end

/**
 <p>Contains the parameters for SetInstanceProtection.</p>
 Required parameters: [InstanceIds, AutoScalingGroupName, ProtectedFromScaleIn]
 */
@interface AWSAutoScalingSetInstanceProtectionQuery : AWSRequest


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>Indicates whether the instance is protected from termination by Auto Scaling when scaling in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable protectedFromScaleIn;

@end

/**
 <p>Describes an adjustment based on the difference between the value of the aggregated CloudWatch metric and the breach threshold that you've defined for the alarm.</p><p>For the following examples, suppose that you have an alarm with a breach threshold of 50:</p><ul><li><p>If you want the adjustment to be triggered when the metric is greater than or equal to 50 and less than 60, specify a lower bound of 0 and an upper bound of 10.</p></li><li><p>If you want the adjustment to be triggered when the metric is greater than 40 and less than or equal to 50, specify a lower bound of -10 and an upper bound of 0.</p></li></ul><p>There are a few rules for the step adjustments for your step policy:</p><ul><li><p>The ranges of your step adjustments can't overlap or have a gap.</p></li><li><p>At most one step adjustment can have a null lower bound. If one step adjustment has a negative lower bound, then there must be a step adjustment with a null lower bound.</p></li><li><p>At most one step adjustment can have a null upper bound. If one step adjustment has a positive upper bound, then there must be a step adjustment with a null upper bound.</p></li><li><p>The upper and lower bound can't be null in the same step adjustment.</p></li></ul>
 Required parameters: [ScalingAdjustment]
 */
@interface AWSAutoScalingStepAdjustment : AWSModel


/**
 <p>The lower bound for the difference between the alarm threshold and the CloudWatch metric. If the metric value is above the breach threshold, the lower bound is inclusive (the metric must be greater than or equal to the threshold plus the lower bound). Otherwise, it is exclusive (the metric must be greater than the threshold plus the lower bound). A null value indicates negative infinity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable metricIntervalLowerBound;

/**
 <p>The upper bound for the difference between the alarm threshold and the CloudWatch metric. If the metric value is above the breach threshold, the upper bound is exclusive (the metric must be less than the threshold plus the upper bound). Otherwise, it is inclusive (the metric must be less than or equal to the threshold plus the upper bound). A null value indicates positive infinity.</p><p>The upper bound must be greater than the lower bound.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable metricIntervalUpperBound;

/**
 <p>The amount by which to scale, based on the specified adjustment type. A positive value adds to the current capacity while a negative number removes from the current capacity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scalingAdjustment;

@end

/**
 <p>Describes an Auto Scaling process that has been suspended. For more information, see <a>ProcessType</a>.</p>
 */
@interface AWSAutoScalingSuspendedProcess : AWSModel


/**
 <p>The name of the suspended process.</p>
 */
@property (nonatomic, strong) NSString * _Nullable processName;

/**
 <p>The reason that the process was suspended.</p>
 */
@property (nonatomic, strong) NSString * _Nullable suspensionReason;

@end

/**
 <p>Describes a tag for an Auto Scaling group.</p>
 Required parameters: [Key]
 */
@interface AWSAutoScalingTag : AWSModel


/**
 <p>The tag key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Determines whether the tag is added to new instances as they are launched in the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable propagateAtLaunch;

/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of resource. The only supported value is <code>auto-scaling-group</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The tag value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Describes a tag for an Auto Scaling group.</p>
 */
@interface AWSAutoScalingTagDescription : AWSModel


/**
 <p>The tag key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Determines whether the tag is added to new instances as they are launched in the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable propagateAtLaunch;

/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of resource. The only supported value is <code>auto-scaling-group</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The tag value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Contains the output of DescribeTags.</p>
 */
@interface AWSAutoScalingTagsType : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingTagDescription *> * _Nullable tags;

@end

/**
 <p>Contains the parameters for TerminateInstanceInAutoScalingGroup.</p>
 Required parameters: [InstanceId, ShouldDecrementDesiredCapacity]
 */
@interface AWSAutoScalingTerminateInstanceInAutoScalingGroupType : AWSRequest


/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>If <code>true</code>, terminating the instance also decrements the size of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable shouldDecrementDesiredCapacity;

@end

/**
 <p>Contains the parameters for UpdateAutoScalingGroup.</p>
 Required parameters: [AutoScalingGroupName]
 */
@interface AWSAutoScalingUpdateAutoScalingGroupType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more Availability Zones for the group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>The amount of time, in seconds, after a scaling activity completes before another scaling activity can start. The default is 300.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/Cooldown.html">Auto Scaling Cooldowns</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultCooldown;

/**
 <p>The number of EC2 instances that should be running in the Auto Scaling group. This number must be greater than or equal to the minimum size of the group and less than or equal to the maximum size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>The amount of time, in seconds, that Auto Scaling waits before checking the health status of an EC2 instance that has come into service. The default is 0.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/healthcheck.html">Health Checks</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckGracePeriod;

/**
 <p>The service to use for the health checks. The valid values are <code>EC2</code> and <code>ELB</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckType;

/**
 <p>The name of the launch configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

/**
 <p>The maximum size of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSize;

/**
 <p>The minimum size of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

/**
 <p>Indicates whether newly launched instances are protected from termination by Auto Scaling when scaling in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable latestInstancesProtectedFromScaleIn;

/**
 <p>The name of the placement group into which you'll launch your instances, if any. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable placementGroup;

/**
 <p>A standalone termination policy or a list of termination policies used to select the instance to terminate. The policies are executed in the order that they are listed.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingBehavior.InstanceTermination.html">Controlling Which Instances Auto Scaling Terminates During Scale In</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable terminationPolicies;

/**
 <p>The ID of the subnet, if you are launching into a VPC. You can specify several subnets in a comma-separated list.</p><p>When you specify <code>VPCZoneIdentifier</code> with <code>AvailabilityZones</code>, ensure that the subnets' Availability Zones match the values you specify for <code>AvailabilityZones</code>.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/asg-in-vpc.html">Launching Auto Scaling Instances in a VPC</a> in the <i>Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VPCZoneIdentifier;

@end

NS_ASSUME_NONNULL_END
