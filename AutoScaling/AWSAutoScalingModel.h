/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSNetworking.h"
#import "AWSModel.h"

FOUNDATION_EXPORT NSString *const AWSAutoScalingErrorDomain;

typedef NS_ENUM(NSInteger, AWSAutoScalingErrorType) {
    AWSAutoScalingErrorUnknown,
    AWSAutoScalingErrorIncompleteSignature,
    AWSAutoScalingErrorInvalidClientTokenId,
    AWSAutoScalingErrorMissingAuthenticationToken,
    AWSAutoScalingErrorAlreadyExists,
    AWSAutoScalingErrorInvalidNextToken,
    AWSAutoScalingErrorLimitExceeded,
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
    AWSAutoScalingScalingActivityStatusCodeWaitingForSpotInstanceRequestId,
    AWSAutoScalingScalingActivityStatusCodeWaitingForSpotInstanceId,
    AWSAutoScalingScalingActivityStatusCodeWaitingForInstanceId,
    AWSAutoScalingScalingActivityStatusCodePreInService,
    AWSAutoScalingScalingActivityStatusCodeInProgress,
    AWSAutoScalingScalingActivityStatusCodeWaitingForELBConnectionDraining,
    AWSAutoScalingScalingActivityStatusCodeMidLifecycleAction,
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
@class AWSAutoScalingSuspendedProcess;
@class AWSAutoScalingTag;
@class AWSAutoScalingTagDescription;
@class AWSAutoScalingTagsType;
@class AWSAutoScalingTerminateInstanceInAutoScalingGroupType;
@class AWSAutoScalingUpdateAutoScalingGroupType;

/**
 * <p> The output for the <a>DescribeScalingActivities</a> action. </p>
 * Required parameters: [Activities]
 */
@interface AWSAutoScalingActivitiesType : AWSModel


/**
 * <p> A list of the requested scaling activities. </p>
 */
@property (nonatomic, strong) NSArray *activities;

/**
 * <p> Acts as a paging mechanism for large result sets. Set to a non-empty string if there are additional results waiting to be returned. Pass this in to subsequent calls to return additional results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p> A scaling Activity is a long-running process that represents a change to your AutoScalingGroup, such as changing the size of the group. It can also be a process to replace an instance, or a process to perform any other long-running operations supported by the API. </p>
 * Required parameters: [ActivityId, AutoScalingGroupName, Cause, StartTime, StatusCode]
 */
@interface AWSAutoScalingActivity : AWSModel


/**
 * <p> Specifies the ID of the activity. </p>
 */
@property (nonatomic, strong) NSString *activityId;

/**
 * <p> The name of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> Contains the reason the activity was begun. </p>
 */
@property (nonatomic, strong) NSString *cause;
@property (nonatomic, strong) NSString *detail;

/**
 * <p> Contains details of the scaling activity. </p>
 */
@property (nonatomic, strong) NSString *details;

/**
 * <p> Provides the end time of this activity. </p>
 */
@property (nonatomic, strong) NSDate *endTime;

/**
 * <p> Specifies a value between 0 and 100 that indicates the progress of the activity. </p>
 */
@property (nonatomic, strong) NSNumber *progress;

/**
 * <p> Provides the start time of this activity. </p>
 */
@property (nonatomic, strong) NSDate *startTime;

/**
 * <p> Contains the current status of the activity. </p>
 */
@property (nonatomic, assign) AWSAutoScalingScalingActivityStatusCode statusCode;

/**
 * <p> Contains a friendly, more verbose description of the activity status. </p>
 */
@property (nonatomic, strong) NSString *statusMessage;

@end

/**
 * <p> The output for the <a>TerminateInstanceInAutoScalingGroup</a> action. </p>
 */
@interface AWSAutoScalingActivityType : AWSModel


/**
 * <p> A scaling Activity. </p>
 */
@property (nonatomic, strong) AWSAutoScalingActivity *activity;

@end

/**
 * <p> Specifies whether the <a>PutScalingPolicy</a><code>ScalingAdjustment</code> parameter is an absolute number or a percentage of the current capacity. </p>
 */
@interface AWSAutoScalingAdjustmentType : AWSModel


/**
 * <p>A policy adjustment type. Valid values are <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and <code>PercentChangeInCapacity</code>.</p>
 */
@property (nonatomic, strong) NSString *adjustmentType;

@end

/**
 * <p>The Alarm data type.</p>
 */
@interface AWSAutoScalingAlarm : AWSModel


/**
 * <p>The Amazon Resource Name (ARN) of the alarm.</p>
 */
@property (nonatomic, strong) NSString *alarmARN;

/**
 * <p>The name of the alarm.</p>
 */
@property (nonatomic, strong) NSString *alarmName;

@end

@interface AWSAutoScalingAttachInstancesQuery : AWSRequest


/**
 * <p> The name of the Auto Scaling group to which to attach the specified instance(s). </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> One or more IDs of the Amazon EC2 instances to attach to the specified Auto Scaling group. You must specify at least one instance ID. </p>
 */
@property (nonatomic, strong) NSArray *instanceIds;

@end

/**
 * <p> The AutoScalingGroup data type. </p>
 * Required parameters: [AutoScalingGroupName, LaunchConfigurationName, MinSize, MaxSize, DesiredCapacity, DefaultCooldown, AvailabilityZones, HealthCheckType, CreatedTime]
 */
@interface AWSAutoScalingAutoScalingGroup : AWSModel


/**
 * <p> The Amazon Resource Name (ARN) of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupARN;

/**
 * <p> Specifies the name of the group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> Contains a list of Availability Zones for the group. </p>
 */
@property (nonatomic, strong) NSArray *availabilityZones;

/**
 * <p> Specifies the date and time the Auto Scaling group was created. </p>
 */
@property (nonatomic, strong) NSDate *createdTime;

/**
 * <p> The number of seconds after a scaling activity completes before any further scaling activities can start. </p>
 */
@property (nonatomic, strong) NSNumber *defaultCooldown;

/**
 * <p> Specifies the desired capacity for the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *desiredCapacity;

/**
 * <p> A list of metrics enabled for this Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSArray *enabledMetrics;

/**
 * <p> The length of time that Auto Scaling waits before checking an instance's health status. The grace period begins when an instance comes into service. </p>
 */
@property (nonatomic, strong) NSNumber *healthCheckGracePeriod;

/**
 * <p> The service of interest for the health status check, either "EC2" for Amazon EC2 or "ELB" for Elastic Load Balancing. </p>
 */
@property (nonatomic, strong) NSString *healthCheckType;

/**
 * <p> Provides a summary list of Amazon EC2 instances. </p>
 */
@property (nonatomic, strong) NSArray *instances;

/**
 * <p> Specifies the name of the associated <a>LaunchConfiguration</a>. </p>
 */
@property (nonatomic, strong) NSString *launchConfigurationName;

/**
 * <p> A list of load balancers associated with this Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSArray *loadBalancerNames;

/**
 * <p> Contains the maximum size of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *maxSize;

/**
 * <p> Contains the minimum size of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *minSize;

/**
 * <p> The name of the cluster placement group, if applicable. For more information, go to <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using_cluster_computing.html"> Using Cluster Instances</a> in the Amazon EC2 User Guide. </p>
 */
@property (nonatomic, strong) NSString *placementGroup;

/**
 * <p> The current state of the Auto Scaling group when a <a>DeleteAutoScalingGroup</a> action is in progress. </p>
 */
@property (nonatomic, strong) NSString *status;

/**
 * <p> Suspended processes associated with this Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSArray *suspendedProcesses;

/**
 * <p> A list of tags for the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p> A standalone termination policy or a list of termination policies for this Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSArray *terminationPolicies;

/**
 * <p> The subnet identifier for the Amazon VPC connection, if applicable. You can specify several subnets in a comma-separated list. </p><p> When you specify <code>VPCZoneIdentifier</code> with <code>AvailabilityZones</code>, ensure that the subnets' Availability Zones match the values you specify for <code>AvailabilityZones</code>. </p>
 */
@property (nonatomic, strong) NSString *VPCZoneIdentifier;

@end

/**
 * <p> The <code>AutoScalingGroupNamesType</code> data type. </p>
 */
@interface AWSAutoScalingAutoScalingGroupNamesType : AWSRequest


/**
 * <p> A list of Auto Scaling group names. </p>
 */
@property (nonatomic, strong) NSArray *autoScalingGroupNames;

/**
 * <p> The maximum number of records to return. </p>
 */
@property (nonatomic, strong) NSNumber *maxRecords;

/**
 * <p> A string that marks the start of the next batch of returned results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p> The <code>AutoScalingGroupsType</code> data type. </p>
 * Required parameters: [AutoScalingGroups]
 */
@interface AWSAutoScalingAutoScalingGroupsType : AWSModel


/**
 * <p> A list of Auto Scaling groups. </p>
 */
@property (nonatomic, strong) NSArray *autoScalingGroups;

/**
 * <p> A string that marks the start of the next batch of returned results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p> The <code>AutoScalingInstanceDetails</code> data type. </p>
 * Required parameters: [InstanceId, AutoScalingGroupName, AvailabilityZone, LifecycleState, HealthStatus, LaunchConfigurationName]
 */
@interface AWSAutoScalingAutoScalingInstanceDetails : AWSModel


/**
 * <p> The name of the Auto Scaling group associated with this instance. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The Availability Zone in which this instance resides. </p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p> The health status of this instance. "Healthy" means that the instance is healthy and should remain in service. "Unhealthy" means that the instance is unhealthy. Auto Scaling should terminate and replace it. </p>
 */
@property (nonatomic, strong) NSString *healthStatus;

/**
 * <p> The instance ID of the Amazon EC2 instance. </p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p> The launch configuration associated with this instance. </p>
 */
@property (nonatomic, strong) NSString *launchConfigurationName;

/**
 * <p> The life cycle state of this instance. for more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AS_Concepts.html#instance-lifecycle">Instance Lifecycle State</a> in the <i>Auto Scaling Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSString *lifecycleState;

@end

/**
 * <p> The <code>AutoScalingInstancesType</code> data type. </p>
 */
@interface AWSAutoScalingAutoScalingInstancesType : AWSModel


/**
 * <p> A list of Auto Scaling instances. </p>
 */
@property (nonatomic, strong) NSArray *autoScalingInstances;

/**
 * <p> A string that marks the start of the next batch of returned results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p> The <code>BlockDeviceMapping</code> data type. </p>
 * Required parameters: [DeviceName]
 */
@interface AWSAutoScalingBlockDeviceMapping : AWSModel


/**
 * <p> The name of the device within Amazon EC2 (for example, /dev/sdh or xvdh). </p>
 */
@property (nonatomic, strong) NSString *deviceName;

/**
 * <p> The Elastic Block Storage volume information. </p>
 */
@property (nonatomic, strong) AWSAutoScalingEbs *ebs;

/**
 * <p> Suppresses the device mapping. </p>
 */
@property (nonatomic, strong) NSNumber *noDevice;

/**
 * <p>The virtual name associated with the device. </p>
 */
@property (nonatomic, strong) NSString *virtualName;

@end

/**
 * <p>The output of the <a>CompleteLifecycleAction</a>. </p>
 */
@interface AWSAutoScalingCompleteLifecycleActionAnswer : AWSModel


@end

@interface AWSAutoScalingCompleteLifecycleActionType : AWSRequest


/**
 * <p>The name of the Auto Scaling group to which the lifecycle hook belongs.</p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p>The action the Auto Scaling group should take. The value for this parameter can be either <code>CONTINUE</code> or <code>ABANDON</code>.</p>
 */
@property (nonatomic, strong) NSString *lifecycleActionResult;

/**
 * <p>A universally unique identifier (UUID) that identifies a specific lifecycle action associated with an instance. Auto Scaling sends this token to the notification target you specified when you created the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString *lifecycleActionToken;

/**
 * <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString *lifecycleHookName;

@end

/**
 * <p></p>
 * Required parameters: [AutoScalingGroupName, MinSize, MaxSize]
 */
@interface AWSAutoScalingCreateAutoScalingGroupType : AWSRequest


/**
 * <p> The name of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> A list of Availability Zones for the Auto Scaling group. This is required unless you have specified subnets. </p>
 */
@property (nonatomic, strong) NSArray *availabilityZones;

/**
 * <p> The amount of time, in seconds, between a successful scaling activity and the succeeding scaling activity.</p><p>If a <code>DefaultCooldown</code> period is not specified, Auto Scaling uses the default value of 300 as the default cool down period for the Auto Scaling group. For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AS_Concepts.html#Cooldown">Cooldown Period</a></p>
 */
@property (nonatomic, strong) NSNumber *defaultCooldown;

/**
 * <p> The number of Amazon EC2 instances that should be running in the group. The desired capacity must be greater than or equal to the minimum size and less than or equal to the maximum size specified for the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *desiredCapacity;

/**
 * <p>Length of time in seconds after a new Amazon EC2 instance comes into service that Auto Scaling starts checking its health. During this time any health check failure for the that instance is ignored.</p><p>This is required if you are adding <code>ELB</code> health check. Frequently, new instances need to warm up, briefly, before they can pass a health check. To provide ample warm-up time, set the health check grace period of the group to match the expected startup period of your application.</p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/as-add-elb-healthcheck.html#as-add-elb-healthcheck-api">Add an Elastic Load Balancing Health Check</a>.</p>
 */
@property (nonatomic, strong) NSNumber *healthCheckGracePeriod;

/**
 * <p>The service you want the health checks from, Amazon EC2 or Elastic Load Balancer. Valid values are <code>EC2</code> or <code>ELB</code>.</p><p>By default, the Auto Scaling health check uses the results of Amazon EC2 instance status checks to determine the health of an instance. For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AS_Concepts.html#healthcheck">Health Check</a>.</p>
 */
@property (nonatomic, strong) NSString *healthCheckType;

/**
 * <p> The ID of the Amazon EC2 instance you want to use to create the Auto Scaling group. Use this attribute if you want to create an Auto Scaling group using an EC2 instance instead of a launch configuration. </p><p> When you use an instance to create an Auto Scaling group, a new launch configuration is first created and then associated with the Auto Scaling group. The new launch configuration derives all its attributes from the instance that is used to create the Auto Scaling group, with the exception of <code>BlockDeviceMapping</code>. </p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/create-asg-from-instance.html">Create an Auto Scaling Group Using EC2 Instance</a> in the <i>Auto Scaling Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p> The name of an existing launch configuration to use to launch new instances. Use this attribute if you want to create an Auto Scaling group using an existing launch configuration instead of an EC2 instance. </p>
 */
@property (nonatomic, strong) NSString *launchConfigurationName;

/**
 * <p> A list of existing Elastic Load Balancing load balancers to use. The load balancers must be associated with the AWS account. </p><p>For information on using load balancers, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US_SetUpASLBApp.html">Load Balance Your Auto Scaling Group</a> in the <i>Auto Scaling Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray *loadBalancerNames;

/**
 * <p> The maximum size of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *maxSize;

/**
 * <p> The minimum size of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *minSize;

/**
 * <p>Physical location of an existing cluster placement group into which you want to launch your instances. For information about cluster placement group, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using_cluster_computing.html">Using Cluster Instances</a></p>
 */
@property (nonatomic, strong) NSString *placementGroup;

/**
 * <p> The tag to be created or updated. Each tag should be defined by its resource type, resource ID, key, value, and a propagate flag. Valid values: key=<i>value</i>, value=<i>value</i>, propagate=<i>true</i> or <i>false</i>. Value and propagate are optional parameters.</p><p>For information about using tags, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/ASTagging.html">Tag Your Auto Scaling Groups and Amazon EC2 Instances</a> in the <i>Auto Scaling Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>A standalone termination policy or a list of termination policies used to select the instance to terminate. The policies are executed in the order that they are listed. </p><p> For more information on configuring a termination policy for your Auto Scaling group, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/us-termination-policy.html">Instance Termination Policy for Your Auto Scaling Group</a> in the <i>Auto Scaling Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSArray *terminationPolicies;

/**
 * <p>A comma-separated list of subnet identifiers of Amazon Virtual Private Clouds (Amazon VPCs).</p><p>If you specify subnets and Availability Zones with this call, ensure that the subnets' Availability Zones match the Availability Zones specified. </p><p>For information on launching your Auto Scaling group into Amazon VPC subnets, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/autoscalingsubnets.html">Auto Scaling in Amazon Virtual Private Cloud</a> in the <i>Auto Scaling Developer Guide</i> .</p>
 */
@property (nonatomic, strong) NSString *VPCZoneIdentifier;

@end

/**
 * <p></p>
 * Required parameters: [LaunchConfigurationName]
 */
@interface AWSAutoScalingCreateLaunchConfigurationType : AWSRequest


/**
 * <p>Used for Auto Scaling groups that launch instances into an Amazon Virtual Private Cloud (Amazon VPC). Specifies whether to assign a public IP address to each instance launched in a Amazon VPC. For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/autoscalingsubnets.html">Auto Scaling in Amazon Virtual Private Cloud</a>.</p><p>Default: If the instance is launched into a default subnet in a default VPC, the default is <code>true</code>. If the instance is launched into a nondefault subnet in a VPC, the default is <code>false</code>. For information about default VPC and VPC platforms, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide//as-supported-platforms.html">Supported Platforms</a>.</p>
 */
@property (nonatomic, strong) NSNumber *associatePublicIpAddress;

/**
 * <p> A list of mappings that specify how block devices are exposed to the instance. Each mapping is made up of a <i>VirtualName</i>, a <i>DeviceName</i>, and an <i>ebs</i> data structure that contains information about the associated Elastic Block Storage volume. For more information about Amazon EC2 BlockDeviceMappings, go to <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/index.html?block-device-mapping-concepts.html"> Block Device Mapping</a> in the Amazon EC2 product documentation. </p>
 */
@property (nonatomic, strong) NSArray *blockDeviceMappings;

/**
 * <p> Whether the instance is optimized for EBS I/O. The optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization is not available with all instance types. Additional usage charges apply when using an EBS Optimized instance. By default the instance is not optimized for EBS I/O. For information about EBS-optimized instances, go to <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#EBSOptimized">EBS-Optimized Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p>
 */
@property (nonatomic, strong) NSNumber *ebsOptimized;

/**
 * <p>The name or the Amazon Resource Name (ARN) of the instance profile associated with the IAM role for the instance.</p><p>Amazon EC2 instances launched with an IAM role will automatically have AWS security credentials available. You can use IAM roles with Auto Scaling to automatically enable applications running on your Amazon EC2 instances to securely access other AWS resources. For information on launching EC2 instances with an IAM role, go to <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/us-iam-role.html">Launching Auto Scaling Instances With an IAM Role</a> in the <i>Auto Scaling Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString *iamInstanceProfile;

/**
 * <p> Unique ID of the Amazon Machine Image (AMI) you want to use to launch your EC2 instances. For information about finding Amazon EC2 AMIs, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html">Finding a Suitable AMI</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString *imageId;

/**
 * <p> The ID of the Amazon EC2 instance you want to use to create the launch configuration. Use this attribute if you want the launch configuration to derive its attributes from an EC2 instance. </p><p> When you use an instance to create a launch configuration, all you need to specify is the <code>InstanceId</code>. The new launch configuration, by default, derives all the attributes from the specified instance with the exception of <code>BlockDeviceMapping</code>. </p><p>If you want to create a launch configuration with <code>BlockDeviceMapping</code> or override any other instance attributes, specify them as part of the same request.</p><p>For more information on using an InstanceID to create a launch configuration, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/create-lc-with-instanceID.html">Create a Launch Configuration Using an Amazon EC2 Instance</a> in the <i>Auto Scaling Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>Enables detailed monitoring if it is disabled. Detailed monitoring is enabled by default.</p><p> When detailed monitoring is enabled, Amazon Cloudwatch will generate metrics every minute and your account will be charged a fee. When you disable detailed monitoring, by specifying <code>False</code>, Cloudwatch will generate metrics every 5 minutes. For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/as-instance-monitoring.html">Monitor Your Auto Scaling Instances</a>. For information about Amazon CloudWatch, see the <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/Welcome.html">Amazon CloudWatch Developer Guide</a>. </p>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceMonitoring *instanceMonitoring;

/**
 * <p> The instance type of the Amazon EC2 instance. For information about available Amazon EC2 instance types, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes"> Available Instance Types</a> in the <i>Amazon Elastic Cloud Compute User Guide.</i></p>
 */
@property (nonatomic, strong) NSString *instanceType;

/**
 * <p> The ID of the kernel associated with the Amazon EC2 AMI. </p>
 */
@property (nonatomic, strong) NSString *kernelId;

/**
 * <p> The name of the Amazon EC2 key pair. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/generating-a-keypair.html">Getting a Key Pair</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString *keyName;

/**
 * <p> The name of the launch configuration to create. </p>
 */
@property (nonatomic, strong) NSString *launchConfigurationName;

/**
 * <p>The tenancy of the instance. An instance with a tenancy of <code>dedicated</code> runs on single-tenant hardware and can only be launched in a VPC.</p><p>You must set the value of this parameter to <code>dedicated</code> if want to launch Dedicated Instances in a shared tenancy VPC (VPC with instance placement tenancy attribute set to <code>default</code>).</p><p>If you specify a value for this parameter, be sure to specify at least one VPC subnet using the <i>VPCZoneIdentifier</i> parameter when you create your Auto Scaling group. </p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/autoscalingsubnets.html">Auto Scaling in Amazon Virtual Private Cloud</a> in the <i>Auto Scaling Developer Guide</i>. </p><p>Valid values: <code>default</code> | <code>dedicated</code></p>
 */
@property (nonatomic, strong) NSString *placementTenancy;

/**
 * <p> The ID of the RAM disk associated with the Amazon EC2 AMI. </p>
 */
@property (nonatomic, strong) NSString *ramdiskId;

/**
 * <p> The security groups with which to associate Amazon EC2 or Amazon VPC instances.</p><p>If your instances are launched in EC2, you can either specify Amazon EC2 security group names or the security group IDs. For more information about Amazon EC2 security groups, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/index.html?using-network-security.html"> Using Security Groups</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>If your instances are launched within VPC, specify Amazon VPC security group IDs. For more information about Amazon VPC security groups, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/index.html?VPC_SecurityGroups.html">Security Groups</a> in the <i>Amazon Virtual Private Cloud User Guide</i>. </p>
 */
@property (nonatomic, strong) NSArray *securityGroups;

/**
 * <p>The maximum hourly price to be paid for any Spot Instance launched to fulfill the request. Spot Instances are launched when the price you specify exceeds the current Spot market price. For more information on launching Spot Instances, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/US-SpotInstances.html"> Using Auto Scaling to Launch Spot Instances</a> in the <i>Auto Scaling Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSString *spotPrice;

/**
 * <p> The user data to make available to the launched Amazon EC2 instances. For more information about Amazon EC2 user data, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html#instancedata-user-data-retrieval">User Data Retrieval</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString *userData;

@end

/**
 * <p></p>
 * Required parameters: [Tags]
 */
@interface AWSAutoScalingCreateOrUpdateTagsType : AWSRequest


/**
 * <p> The tag to be created or updated. Each tag should be defined by its resource type, resource ID, key, value, and a propagate flag. The resource type and resource ID identify the type and name of resource for which the tag is created. Currently, <code>auto-scaling-group</code> is the only supported resource type. The valid value for the resource ID is <i>groupname</i>. </p><p>The <code>PropagateAtLaunch</code> flag defines whether the new tag will be applied to instances launched by the Auto Scaling group. Valid values are <code>true</code> or <code>false</code>. However, instances that are already running will not get the new or updated tag. Likewise, when you modify a tag, the updated version will be applied only to new instances launched by the Auto Scaling group after the change. Running instances that had the previous version of the tag will continue to have the older tag. </p><p>When you create a tag and a tag of the same name already exists, the operation overwrites the previous tag definition, but you will not get an error message. </p>
 */
@property (nonatomic, strong) NSArray *tags;

@end

/**
 * <p></p>
 * Required parameters: [AutoScalingGroupName]
 */
@interface AWSAutoScalingDeleteAutoScalingGroupType : AWSRequest


/**
 * <p> The name of the Auto Scaling group to delete. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p>Starting with API version 2011-01-01, specifies that the Auto Scaling group will be deleted along with all instances associated with the group, without waiting for all instances to be terminated. This parameter also deletes any lifecycle actions associated with the group. </p>
 */
@property (nonatomic, strong) NSNumber *forceDelete;

@end

/**
 * <p>The output of the <a>DeleteLifecycleHook</a> action. </p>
 */
@interface AWSAutoScalingDeleteLifecycleHookAnswer : AWSModel


@end

@interface AWSAutoScalingDeleteLifecycleHookType : AWSRequest


/**
 * <p>The name of the Auto Scaling group to which the lifecycle hook belongs.</p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString *lifecycleHookName;

@end

/**
 * <p></p>
 * Required parameters: [AutoScalingGroupName, TopicARN]
 */
@interface AWSAutoScalingDeleteNotificationConfigurationType : AWSRequest


/**
 * <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic.</p>
 */
@property (nonatomic, strong) NSString *topicARN;

@end

/**
 * <p></p>
 * Required parameters: [PolicyName]
 */
@interface AWSAutoScalingDeletePolicyType : AWSRequest


/**
 * <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p>The name or PolicyARN of the policy you want to delete.</p>
 */
@property (nonatomic, strong) NSString *policyName;

@end

/**
 * <p></p>
 * Required parameters: [ScheduledActionName]
 */
@interface AWSAutoScalingDeleteScheduledActionType : AWSRequest


/**
 * <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p>The name of the action you want to delete.</p>
 */
@property (nonatomic, strong) NSString *scheduledActionName;

@end

/**
 * <p></p>
 * Required parameters: [Tags]
 */
@interface AWSAutoScalingDeleteTagsType : AWSRequest


/**
 * <p>Each tag should be defined by its resource type, resource ID, key, value, and a propagate flag. Valid values are: Resource type = <i>auto-scaling-group</i>, Resource ID = <i>AutoScalingGroupName</i>, key=<i>value</i>, value=<i>value</i>, propagate=<i>true</i> or <i>false</i>. </p>
 */
@property (nonatomic, strong) NSArray *tags;

@end

/**
 * <p> The output of the <a>DescribeAccountLimitsResult</a> action. </p>
 */
@interface AWSAutoScalingDescribeAccountLimitsAnswer : AWSModel


/**
 * <p> The maximum number of Auto Scaling groups allowed for your AWS account. </p>
 */
@property (nonatomic, strong) NSNumber *maxNumberOfAutoScalingGroups;

/**
 * <p> The maximum number of launch configurations allowed for your AWS account. </p>
 */
@property (nonatomic, strong) NSNumber *maxNumberOfLaunchConfigurations;

@end

/**
 * <p> The output of the <a>DescribeAdjustmentTypes</a> action. </p>
 */
@interface AWSAutoScalingDescribeAdjustmentTypesAnswer : AWSModel


/**
 * <p> A list of specific policy adjustment types. </p>
 */
@property (nonatomic, strong) NSArray *adjustmentTypes;

@end

@interface AWSAutoScalingDescribeAutoScalingInstancesType : AWSRequest


/**
 * <p> The list of Auto Scaling instances to describe. If this list is omitted, all auto scaling instances are described. The list of requested instances cannot contain more than 50 items. If unknown instances are requested, they are ignored with no error. </p>
 */
@property (nonatomic, strong) NSArray *instanceIds;

/**
 * <p> The maximum number of Auto Scaling instances to be described with each call. </p>
 */
@property (nonatomic, strong) NSNumber *maxRecords;

/**
 * <p> The token returned by a previous call to indicate that there is more data available. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p>The <code>AutoScalingNotificationTypes</code> data type.</p>
 */
@interface AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer : AWSModel


/**
 * <p>Returns a list of all notification types supported by Auto Scaling. They are:</p><ul><li><p><code>autoscaling:EC2_INSTANCE_LAUNCH</code></p></li><li><p><code>autoscaling:EC2_INSTANCE_LAUNCH_ERROR</code></p></li><li><p><code>autoscaling:EC2_INSTANCE_TERMINATE</code></p></li><li><p><code>autoscaling:EC2_INSTANCE_TERMINATE_ERROR</code></p></li><li><p><code>autoscaling:TEST_NOTIFICATION</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray *autoScalingNotificationTypes;

@end

@interface AWSAutoScalingDescribeLifecycleHookTypesAnswer : AWSModel


/**
 * <p>Returns a list of all notification types supported by Auto Scaling. They are:</p><ul><li><p><code>autoscaling:EC2_INSTANCE_LAUNCHING</code></p></li><li><p><code>autoscaling:EC2_INSTANCE_TERMINATING</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray *lifecycleHookTypes;

@end

/**
 * <p>The output of the <a>DescribeLifecycleHooks</a> action. </p>
 */
@interface AWSAutoScalingDescribeLifecycleHooksAnswer : AWSModel


/**
 * <p> A list describing the lifecycle hooks that belong to the specified Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSArray *lifecycleHooks;

@end

@interface AWSAutoScalingDescribeLifecycleHooksType : AWSRequest


/**
 * <p>The name of one or more Auto Scaling groups.</p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p>The name of one or more lifecycle hooks.</p>
 */
@property (nonatomic, strong) NSArray *lifecycleHookNames;

@end

/**
 * <p>The output of the <a>DescribeMetricCollectionTypes</a> action.</p>
 */
@interface AWSAutoScalingDescribeMetricCollectionTypesAnswer : AWSModel


/**
 * <p>A list of granularities for the listed Metrics.</p>
 */
@property (nonatomic, strong) NSArray *granularities;

/**
 * <p>The list of Metrics collected. The following metrics are supported: </p><ul><li><p>GroupMinSize</p></li><li><p>GroupMaxSize</p></li><li><p>GroupDesiredCapacity</p></li><li><p>GroupInServiceInstances</p></li><li><p>GroupPendingInstances</p></li><li><p>GroupStandbyInstances</p></li><li><p>GroupTerminatingInstances</p></li><li><p>GroupTotalInstances</p></li></ul>
 */
@property (nonatomic, strong) NSArray *metrics;

@end

/**
 * <p>The output of the <a>DescribeNotificationConfigurations</a> action.</p>
 * Required parameters: [NotificationConfigurations]
 */
@interface AWSAutoScalingDescribeNotificationConfigurationsAnswer : AWSModel


/**
 * <p>A string that is used to mark the start of the next batch of returned results for pagination.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>The list of notification configurations.</p>
 */
@property (nonatomic, strong) NSArray *notificationConfigurations;

@end

@interface AWSAutoScalingDescribeNotificationConfigurationsType : AWSRequest


/**
 * <p> The name of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSArray *autoScalingGroupNames;

/**
 * <p>Maximum number of records to be returned. </p>
 */
@property (nonatomic, strong) NSNumber *maxRecords;

/**
 * <p> A string that is used to mark the start of the next batch of returned results for pagination. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSAutoScalingDescribePoliciesType : AWSRequest


/**
 * <p> The name of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The maximum number of policies that will be described with each call. </p>
 */
@property (nonatomic, strong) NSNumber *maxRecords;

/**
 * <p> A string that is used to mark the start of the next batch of returned results for pagination. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p> A list of policy names or policy ARNs to be described. If this list is omitted, all policy names are described. If an auto scaling group name is provided, the results are limited to that group. The list of requested policy names cannot contain more than 50 items. If unknown policy names are requested, they are ignored with no error. </p>
 */
@property (nonatomic, strong) NSArray *policyNames;

@end

/**
 * <p></p>
 */
@interface AWSAutoScalingDescribeScalingActivitiesType : AWSRequest


/**
 * <p> A list containing the activity IDs of the desired scaling activities. If this list is omitted, all activities are described. If an <code>AutoScalingGroupName</code> is provided, the results are limited to that group. The list of requested activities cannot contain more than 50 items. If unknown activities are requested, they are ignored with no error. </p>
 */
@property (nonatomic, strong) NSArray *activityIds;

/**
 * <p> The name of the <a>AutoScalingGroup</a>. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The maximum number of scaling activities to return. </p>
 */
@property (nonatomic, strong) NSNumber *maxRecords;

/**
 * <p> A string that marks the start of the next batch of returned results for pagination. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSAutoScalingDescribeScheduledActionsType : AWSRequest


/**
 * <p> The name of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The latest scheduled start time to return. If scheduled action names are provided, this field is ignored. </p>
 */
@property (nonatomic, strong) NSDate *endTime;

/**
 * <p> The maximum number of scheduled actions to return. </p>
 */
@property (nonatomic, strong) NSNumber *maxRecords;

/**
 * <p> A string that marks the start of the next batch of returned results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p> A list of scheduled actions to be described. If this list is omitted, all scheduled actions are described. The list of requested scheduled actions cannot contain more than 50 items. If an auto scaling group name is provided, the results are limited to that group. If unknown scheduled actions are requested, they are ignored with no error. </p>
 */
@property (nonatomic, strong) NSArray *scheduledActionNames;

/**
 * <p> The earliest scheduled start time to return. If scheduled action names are provided, this field will be ignored. </p>
 */
@property (nonatomic, strong) NSDate *startTime;

@end

/**
 * <p></p>
 */
@interface AWSAutoScalingDescribeTagsType : AWSRequest


/**
 * <p> The value of the filter type used to identify the tags to be returned. For example, you can filter so that tags are returned according to Auto Scaling group, the key and value, or whether the new tag will be applied to instances launched after the tag is created (PropagateAtLaunch). </p>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p> The maximum number of records to return. </p>
 */
@property (nonatomic, strong) NSNumber *maxRecords;

/**
 * <p> A string that marks the start of the next batch of returned results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p>The <code>TerminationPolicyTypes</code> data type.</p>
 */
@interface AWSAutoScalingDescribeTerminationPolicyTypesAnswer : AWSModel


/**
 * <p> Termination policies supported by Auto Scaling. They are: <code>OldestInstance</code>, <code>OldestLaunchConfiguration</code>, <code>NewestInstance</code>, <code>ClosestToNextInstanceHour</code>, <code>Default</code></p>
 */
@property (nonatomic, strong) NSArray *terminationPolicyTypes;

@end

/**
 * <p>The output of the <a>DetachInstances</a> action. </p>
 */
@interface AWSAutoScalingDetachInstancesAnswer : AWSModel


/**
 * <p> A list describing the activities related to detaching the instances from the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSArray *activities;

@end

@interface AWSAutoScalingDetachInstancesQuery : AWSRequest


/**
 * <p> The name of the Auto Scaling group from which to detach instances. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> A list of instances to detach from the Auto Scaling group. You must specify at least one instance ID. </p>
 */
@property (nonatomic, strong) NSArray *instanceIds;

/**
 * <p> Specifies if the detached instance should decrement the desired capacity value for the Auto Scaling group. If set to <code>True</code>, the Auto Scaling group decrements the desired capacity value by the number of instances detached. </p>
 */
@property (nonatomic, strong) NSNumber *shouldDecrementDesiredCapacity;

@end

@interface AWSAutoScalingDisableMetricsCollectionQuery : AWSRequest


/**
 * <p>The name or ARN of the Auto Scaling Group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The list of metrics to disable. If no metrics are specified, all metrics are disabled. The following metrics are supported: </p><ul><li><p>GroupMinSize</p></li><li><p>GroupMaxSize</p></li><li><p>GroupDesiredCapacity</p></li><li><p>GroupInServiceInstances</p></li><li><p>GroupPendingInstances</p></li><li><p>GroupStandbyInstances</p></li><li><p>GroupTerminatingInstances</p></li><li><p>GroupTotalInstances</p></li></ul>
 */
@property (nonatomic, strong) NSArray *metrics;

@end

/**
 * <p>The Ebs data type.</p>
 */
@interface AWSAutoScalingEbs : AWSModel


/**
 * <p>Indicates whether to delete the volume on instance termination. </p><p>Default: <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber *deleteOnTermination;

/**
 * <p>The number of I/O operations per second (IOPS) that the volume supports.</p><p>The maximum ratio of IOPS to volume size is 30.0</p><p>Valid Values: Range is 100 to 4000.</p><p>Default: None.</p>
 */
@property (nonatomic, strong) NSNumber *iops;

/**
 * <p> The snapshot ID. </p>
 */
@property (nonatomic, strong) NSString *snapshotId;

/**
 * <p>The volume size, in gigabytes.</p><p>Valid values: If the volume type is <code>io1</code>, the minimum size of the volume is 10.</p><p>Default: If you're creating the volume from a snapshot, and you don't specify a volume size, the default is the snapshot size.</p><p>Required: Required when the volume type is <code>io1</code>. </p>
 */
@property (nonatomic, strong) NSNumber *volumeSize;

/**
 * <p>The volume type.</p><p>Valid values: <code>standard | io1</code></p><p>Default: <code>standard</code></p>
 */
@property (nonatomic, strong) NSString *volumeType;

@end

@interface AWSAutoScalingEnableMetricsCollectionQuery : AWSRequest


/**
 * <p>The name or ARN of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The granularity to associate with the metrics to collect. Currently, the only legal granularity is "1Minute". </p>
 */
@property (nonatomic, strong) NSString *granularity;

/**
 * <p> The list of metrics to collect. If no metrics are specified, all metrics are enabled. The following metrics are supported: </p><ul><li><p>GroupMinSize</p></li><li><p>GroupMaxSize</p></li><li><p>GroupDesiredCapacity</p></li><li><p>GroupInServiceInstances</p></li><li><p>GroupPendingInstances</p></li><li><p>GroupStandbyInstances</p></li><li><p>GroupTerminatingInstances</p></li><li><p>GroupTotalInstances</p></li></ul>
 */
@property (nonatomic, strong) NSArray *metrics;

@end

/**
 * <p> The <code>EnabledMetric</code> data type. </p>
 */
@interface AWSAutoScalingEnabledMetric : AWSModel


/**
 * <p> The granularity of the enabled metric. </p>
 */
@property (nonatomic, strong) NSString *granularity;

/**
 * <p> The name of the enabled metric. </p>
 */
@property (nonatomic, strong) NSString *metric;

@end

/**
 * <p>The output of the <a>EnterStandby</a> action. </p>
 */
@interface AWSAutoScalingEnterStandbyAnswer : AWSModel


/**
 * <p> A list describing the activities related to moving instances into Standby mode. </p>
 */
@property (nonatomic, strong) NSArray *activities;

@end

@interface AWSAutoScalingEnterStandbyQuery : AWSRequest


/**
 * <p> The name of the Auto Scaling group from which to move instances into Standby mode. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The instances to move into Standby mode. You must specify at least one instance ID. </p>
 */
@property (nonatomic, strong) NSArray *instanceIds;

/**
 * <p> Specifies whether the instances moved to Standby mode count as part of the Auto Scaling group's desired capacity. If set, the desired capacity for the Auto Scaling group decrements by the number of instances moved to Standby mode. </p>
 */
@property (nonatomic, strong) NSNumber *shouldDecrementDesiredCapacity;

@end

@interface AWSAutoScalingExecutePolicyType : AWSRequest


/**
 * <p> The name or the Amazon Resource Name (ARN) of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p>Set to <code>True</code> if you want Auto Scaling to wait for the cooldown period associated with the Auto Scaling group to complete before executing the policy.</p><p>Set to <code>False</code> if you want Auto Scaling to circumvent the cooldown period associated with the Auto Scaling group and execute the policy before the cooldown period ends. </p><p>For information about cooldown period, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AS_Concepts.html#Cooldown">Cooldown Period</a> in the <i>Auto Scaling Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber *honorCooldown;

/**
 * <p> The name or ARN of the policy you want to run. </p>
 */
@property (nonatomic, strong) NSString *policyName;

@end

/**
 * <p>The output of the <a>ExitStandby</a> action. </p>
 */
@interface AWSAutoScalingExitStandbyAnswer : AWSModel


/**
 * <p>A list describing the activities related to moving instances out of Standby mode.</p>
 */
@property (nonatomic, strong) NSArray *activities;

@end

@interface AWSAutoScalingExitStandbyQuery : AWSRequest


/**
 * <p> The name of the Auto Scaling group from which to move instances out of Standby mode. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> A list of instances to move out of Standby mode. You must specify at least one instance ID. </p>
 */
@property (nonatomic, strong) NSArray *instanceIds;

@end

/**
 * <p>The <code>Filter</code> data type.</p>
 */
@interface AWSAutoScalingFilter : AWSModel


/**
 * <p> The name of the filter. Valid Name values are: <code>"auto-scaling-group"</code>, <code>"key"</code>, <code>"value"</code>, and <code>"propagate-at-launch"</code>. </p>
 */
@property (nonatomic, strong) NSString *name;

/**
 * <p> The value of the filter. </p>
 */
@property (nonatomic, strong) NSArray *values;

@end

/**
 * <p> The <code>Instance</code> data type. </p>
 * Required parameters: [InstanceId, AvailabilityZone, LifecycleState, HealthStatus, LaunchConfigurationName]
 */
@interface AWSAutoScalingInstance : AWSModel


/**
 * <p> Availability Zones associated with this instance. </p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p> The instance's health status. </p>
 */
@property (nonatomic, strong) NSString *healthStatus;

/**
 * <p> Specifies the ID of the Amazon EC2 instance. </p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p> The launch configuration associated with this instance. </p>
 */
@property (nonatomic, strong) NSString *launchConfigurationName;

/**
 * <p> Contains a description of the current <i>lifecycle</i> state. </p>
 */
@property (nonatomic, assign) AWSAutoScalingLifecycleState lifecycleState;

@end

/**
 * <p> The <code>InstanceMonitoring</code> data type. </p>
 */
@interface AWSAutoScalingInstanceMonitoring : AWSModel


/**
 * <p> If <code>True</code>, instance monitoring is enabled. </p>
 */
@property (nonatomic, strong) NSNumber *enabled;

@end

/**
 * <p> The <code>LaunchConfiguration</code> data type. </p>
 * Required parameters: [LaunchConfigurationName, ImageId, InstanceType, CreatedTime]
 */
@interface AWSAutoScalingLaunchConfiguration : AWSModel


/**
 * <p>Specifies whether the instance is associated with a public IP address (<code>true</code>) or not (<code>false</code>).</p>
 */
@property (nonatomic, strong) NSNumber *associatePublicIpAddress;

/**
 * <p> Specifies how block devices are exposed to the instance. Each mapping is made up of a <i>virtualName</i> and a <i>deviceName</i>. </p>
 */
@property (nonatomic, strong) NSArray *blockDeviceMappings;

/**
 * <p> Provides the creation date and time for this launch configuration. </p>
 */
@property (nonatomic, strong) NSDate *createdTime;

/**
 * <p>Specifies whether the instance is optimized for EBS I/O (<i>true</i>) or not (<i>false</i>).</p>
 */
@property (nonatomic, strong) NSNumber *ebsOptimized;

/**
 * <p>Provides the name or the Amazon Resource Name (ARN) of the instance profile associated with the IAM role for the instance. The instance profile contains the IAM role. </p>
 */
@property (nonatomic, strong) NSString *iamInstanceProfile;

/**
 * <p> Provides the unique ID of the <i>Amazon Machine Image</i> (AMI) that was assigned during registration. </p>
 */
@property (nonatomic, strong) NSString *imageId;

/**
 * <p> Controls whether instances in this group are launched with detailed monitoring or not. </p>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceMonitoring *instanceMonitoring;

/**
 * <p> Specifies the instance type of the Amazon EC2 instance. </p>
 */
@property (nonatomic, strong) NSString *instanceType;

/**
 * <p> Provides the ID of the kernel associated with the Amazon EC2 AMI. </p>
 */
@property (nonatomic, strong) NSString *kernelId;

/**
 * <p> Provides the name of the Amazon EC2 key pair. </p>
 */
@property (nonatomic, strong) NSString *keyName;

/**
 * <p> The launch configuration's Amazon Resource Name (ARN). </p>
 */
@property (nonatomic, strong) NSString *launchConfigurationARN;

/**
 * <p> Specifies the name of the launch configuration. </p>
 */
@property (nonatomic, strong) NSString *launchConfigurationName;

/**
 * <p>Specifies the tenancy of the instance. It can be either <code>default</code> or <code>dedicated</code>. An instance with <code>dedicated</code> tenancy runs in an isolated, single-tenant hardware and it can only be launched in a VPC.</p>
 */
@property (nonatomic, strong) NSString *placementTenancy;

/**
 * <p> Provides ID of the RAM disk associated with the Amazon EC2 AMI. </p>
 */
@property (nonatomic, strong) NSString *ramdiskId;

/**
 * <p> A description of the security groups to associate with the Amazon EC2 instances. </p>
 */
@property (nonatomic, strong) NSArray *securityGroups;

/**
 * <p>Specifies the price to bid when launching Spot Instances.</p>
 */
@property (nonatomic, strong) NSString *spotPrice;

/**
 * <p> The user data available to the launched Amazon EC2 instances. </p>
 */
@property (nonatomic, strong) NSString *userData;

@end

/**
 * <p></p>
 * Required parameters: [LaunchConfigurationName]
 */
@interface AWSAutoScalingLaunchConfigurationNameType : AWSRequest


/**
 * <p> The name of the launch configuration. </p>
 */
@property (nonatomic, strong) NSString *launchConfigurationName;

@end

/**
 * <p> The <code>LaunchConfigurationNamesType</code> data type. </p>
 */
@interface AWSAutoScalingLaunchConfigurationNamesType : AWSRequest


/**
 * <p> A list of launch configuration names. </p>
 */
@property (nonatomic, strong) NSArray *launchConfigurationNames;

/**
 * <p> The maximum number of launch configurations. The default is 100. </p>
 */
@property (nonatomic, strong) NSNumber *maxRecords;

/**
 * <p> A string that marks the start of the next batch of returned results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p> The <code>LaunchConfigurationsType</code> data type. </p>
 * Required parameters: [LaunchConfigurations]
 */
@interface AWSAutoScalingLaunchConfigurationsType : AWSModel


/**
 * <p> A list of launch configurations. </p>
 */
@property (nonatomic, strong) NSArray *launchConfigurations;

/**
 * <p> A string that marks the start of the next batch of returned results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

/**
 * <p> A lifecycle hook tells Auto Scaling that you want to perform an action when an instance launches or terminates. When you have a lifecycle hook in place, the Auto Scaling group will either: </p><ul><li> Pause the instance after it launches, but before it is put into service </li><li> Pause the instance as it terminates, but before it is fully terminated </li></ul><p>To learn more, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingPendingState.html">Auto Scaling Pending State</a> and <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AutoScalingTerminatingState.html">Auto Scaling Terminating State</a>.</p>
 */
@interface AWSAutoScalingLifecycleHook : AWSModel


/**
 * <p> The name of the Auto Scaling group to which the lifecycle action belongs. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p>Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The value for this parameter can be either <code>CONTINUE</code> or <code>ABANDON</code>. The default value for this parameter is <code>CONTINUE</code>.</p>
 */
@property (nonatomic, strong) NSString *defaultResult;

/**
 * <p>The maximum length of time an instance can remain in a <code>Pending:Wait</code> or <code>Terminating:Wait</code> state. Currently, this value is set at 48 hours.</p>
 */
@property (nonatomic, strong) NSNumber *globalTimeout;

/**
 * <p>Defines the amount of time that can elapse before the lifecycle hook times out. When the lifecycle hook times out, Auto Scaling performs the action defined in the <code>DefaultResult</code> parameter. You can prevent the lifecycle hook from timing out by calling <a>RecordLifecycleActionHeartbeat</a>.</p>
 */
@property (nonatomic, strong) NSNumber *heartbeatTimeout;

/**
 * <p> The name of the lifecycle action hook. </p>
 */
@property (nonatomic, strong) NSString *lifecycleHookName;

/**
 * <p>The Amazon EC2 instance state to which you want to attach the lifecycle hook. See <a>DescribeLifecycleHooks</a> for a list of available lifecycle hook types.</p>
 */
@property (nonatomic, strong) NSString *lifecycleTransition;

/**
 * <p>Contains additional information that you want to include any time Auto Scaling sends a message to the notification target.</p>
 */
@property (nonatomic, strong) NSString *notificationMetadata;

/**
 * <p>The ARN of the notification target that Auto Scaling will use to notify you when an instance is in the transition state for the lifecycle hook. This ARN target can be either an SQS queue or an SNS topic. The notification message sent to the target will include:</p><ul><li>Lifecycle action token</li><li>User account ID</li><li>Name of the Auto Scaling group</li><li>Lifecycle hook name</li><li>EC2 instance ID</li><li>Lifecycle transition</li><li>Notification metadata</li></ul>
 */
@property (nonatomic, strong) NSString *notificationTargetARN;

/**
 * <p>The ARN of the Amazon IAM role that allows the Auto Scaling group to publish to the specified notification target.</p>
 */
@property (nonatomic, strong) NSString *roleARN;

@end

/**
 * <p> The MetricCollectionType data type. </p>
 */
@interface AWSAutoScalingMetricCollectionType : AWSModel

@property (nonatomic, strong) NSString *metric;

@end

/**
 * <p> The MetricGranularityType data type. </p>
 */
@interface AWSAutoScalingMetricGranularityType : AWSModel


/**
 * <p> The granularity of a Metric. </p>
 */
@property (nonatomic, strong) NSString *granularity;

@end

/**
 * <p> The <code>NotificationConfiguration</code> data type. </p>
 */
@interface AWSAutoScalingNotificationConfiguration : AWSModel


/**
 * <p> Specifies the Auto Scaling group name. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The types of events for an action to start. </p>
 */
@property (nonatomic, strong) NSString *notificationType;

/**
 * <p> The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic. </p>
 */
@property (nonatomic, strong) NSString *topicARN;

@end

/**
 * <p> The <code>PoliciesType</code> data type. </p>
 */
@interface AWSAutoScalingPoliciesType : AWSModel


/**
 * <p> A string that marks the start of the next batch of returned results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p> A list of scaling policies. </p>
 */
@property (nonatomic, strong) NSArray *scalingPolicies;

@end

/**
 * <p> The <code>PolicyARNType</code> data type. </p>
 */
@interface AWSAutoScalingPolicyARNType : AWSModel


/**
 * <p> A policy's Amazon Resource Name (ARN). </p>
 */
@property (nonatomic, strong) NSString *policyARN;

@end

/**
 * <p> There are two primary Auto Scaling process types--<code>Launch</code> and <code>Terminate</code>. The <code>Launch</code> process creates a new Amazon EC2 instance for an Auto Scaling group, and the <code>Terminate</code> process removes an existing Amazon EC2 instance. </p><p> The remaining Auto Scaling process types relate to specific Auto Scaling features: <ul><li>AddToLoadBalancer</li><li>AlarmNotification</li><li>AZRebalance</li><li>HealthCheck</li><li>ReplaceUnhealthy</li><li>ScheduledActions</li></ul></p><important><p> If you suspend <code>Launch</code> or <code>Terminate</code>, all other process types are affected to varying degrees. The following descriptions discuss how each process type is affected by a suspension of <code>Launch</code> or <code>Terminate</code>. </p></important><p> The <code>AddToLoadBalancer</code> process type adds instances to the load balancer when the instances are launched. If you suspend this process, Auto Scaling will launch the instances but will not add them to the load balancer. If you resume the <code>AddToLoadBalancer</code> process, Auto Scaling will also resume adding new instances to the load balancer when they are launched. However, Auto Scaling will not add running instances that were launched while the process was suspended; those instances must be added manually using the the <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/APIReference/API_RegisterInstancesWithLoadBalancer.html"> RegisterInstancesWithLoadBalancer</a> call in the <i>Elastic Load Balancing API Reference</i>. </p><p> The <code>AlarmNotification</code> process type accepts notifications from Amazon CloudWatch alarms that are associated with the Auto Scaling group. If you suspend the <code>AlarmNotification</code> process type, Auto Scaling will not automatically execute scaling policies that would be triggered by alarms. </p><p> Although the <code>AlarmNotification</code> process type is not directly affected by a suspension of <code>Launch</code> or <code>Terminate</code>, alarm notifications are often used to signal that a change in the size of the Auto Scaling group is warranted. If you suspend <code>Launch</code> or <code>Terminate</code>, Auto Scaling might not be able to implement the alarm's associated policy. </p><p> The <code>AZRebalance</code> process type seeks to maintain a balanced number of instances across Availability Zones within a Region. If you remove an Availability Zone from your Auto Scaling group or an Availability Zone otherwise becomes unhealthy or unavailable, Auto Scaling launches new instances in an unaffected Availability Zone before terminating the unhealthy or unavailable instances. When the unhealthy Availability Zone returns to a healthy state, Auto Scaling automatically redistributes the application instances evenly across all of the designated Availability Zones. </p><important><p> If you call <a>SuspendProcesses</a> on the <code>launch</code> process type, the <code>AZRebalance</code> process will neither launch new instances nor terminate existing instances. This is because the <code>AZRebalance</code> process terminates existing instances only after launching the replacement instances. </p><p> If you call <a>SuspendProcesses</a> on the <code>terminate</code> process type, the <code>AZRebalance</code> process can cause your Auto Scaling group to grow up to ten percent larger than the maximum size. This is because Auto Scaling allows groups to temporarily grow larger than the maximum size during rebalancing activities. If Auto Scaling cannot terminate instances, your Auto Scaling group could remain up to ten percent larger than the maximum size until you resume the <code>terminate</code> process type. </p></important><p> The <code>HealthCheck</code> process type checks the health of the instances. Auto Scaling marks an instance as unhealthy if Amazon EC2 or Elastic Load Balancing informs Auto Scaling that the instance is unhealthy. The <code>HealthCheck</code> process can override the health status of an instance that you set with <a>SetInstanceHealth</a>. </p><p> The <code>ReplaceUnhealthy</code> process type terminates instances that are marked as unhealthy and subsequently creates new instances to replace them. This process calls both of the primary process types--first <code>Terminate</code> and then <code>Launch</code>. </p><important><p> The <code>HealthCheck</code> process type works in conjunction with the <code>ReplaceUnhealthly</code> process type to provide health check functionality. If you suspend either <code>Launch</code> or <code>Terminate</code>, the <code>ReplaceUnhealthy</code> process type will not function properly. </p></important><p> The <code>ScheduledActions</code> process type performs scheduled actions that you create with <a>PutScheduledUpdateGroupAction</a>. Scheduled actions often involve launching new instances or terminating existing instances. If you suspend either <code>Launch</code> or <code>Terminate</code>, your scheduled actions might not function as expected. </p>
 * Required parameters: [ProcessName]
 */
@interface AWSAutoScalingProcessType : AWSModel


/**
 * <p> The name of a process. </p>
 */
@property (nonatomic, strong) NSString *processName;

@end

/**
 * <p> The output of the <a>DescribeScalingProcessTypes</a> action. </p>
 */
@interface AWSAutoScalingProcessesType : AWSModel


/**
 * <p> A list of <a>ProcessType</a> names. </p>
 */
@property (nonatomic, strong) NSArray *processes;

@end

/**
 * <p>The output of the <a>PutLifecycleHook</a> action. </p>
 */
@interface AWSAutoScalingPutLifecycleHookAnswer : AWSModel


@end

@interface AWSAutoScalingPutLifecycleHookType : AWSRequest


/**
 * <p>The name of the Auto Scaling group to which you want to assign the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p>Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The value for this parameter can be either <code>CONTINUE</code> or <code>ABANDON</code>. The default value for this parameter is <code>ABANDON</code>.</p>
 */
@property (nonatomic, strong) NSString *defaultResult;

/**
 * <p>Defines the amount of time, in seconds, that can elapse before the lifecycle hook times out. When the lifecycle hook times out, Auto Scaling performs the action defined in the <code>DefaultResult</code> parameter. You can prevent the lifecycle hook from timing out by calling <a>RecordLifecycleActionHeartbeat</a>. The default value for this parameter is 3600 seconds (1 hour).</p>
 */
@property (nonatomic, strong) NSNumber *heartbeatTimeout;

/**
 * <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString *lifecycleHookName;

/**
 * <p>The Amazon EC2 instance state to which you want to attach the lifecycle hook. See <a>DescribeLifecycleHookTypes</a> for a list of available lifecycle hook types.</p>
 */
@property (nonatomic, strong) NSString *lifecycleTransition;

/**
 * <p>Contains additional information that you want to include any time Auto Scaling sends a message to the notification target.</p>
 */
@property (nonatomic, strong) NSString *notificationMetadata;

/**
 * <p>The ARN of the notification target that Auto Scaling will use to notify you when an instance is in the transition state for the lifecycle hook. This ARN target can be either an SQS queue or an SNS topic. </p><p>The notification message sent to the target will include:</p><ul><li><b>LifecycleActionToken</b>. The Lifecycle action token.</li><li><b>AccountId</b>. The user account ID.</li><li><b>AutoScalingGroupName</b>. The name of the Auto Scaling group.</li><li><b>LifecycleHookName</b>. The lifecycle hook name.</li><li><b>EC2InstanceId</b>. The EC2 instance ID.</li><li><b>LifecycleTransition</b>. The lifecycle transition.</li><li><b>NotificationMetadata</b>. The notification metadata.</li></ul><p>This operation uses the JSON format when sending notifications to an Amazon SQS queue, and an email key/value pair format when sending notifications to an Amazon SNS topic.</p><p>When you call this operation, a test message is sent to the notification target. This test message contains an additional key/value pair: <code>Event:autoscaling:TEST_NOTIFICATION</code>.</p>
 */
@property (nonatomic, strong) NSString *notificationTargetARN;

/**
 * <p>The ARN of the Amazon IAM role that allows the Auto Scaling group to publish to the specified notification target.</p>
 */
@property (nonatomic, strong) NSString *roleARN;

@end

@interface AWSAutoScalingPutNotificationConfigurationType : AWSRequest


/**
 * <p> The name of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p>The type of event that will cause the notification to be sent. For details about notification types supported by Auto Scaling, see <a>DescribeAutoScalingNotificationTypes</a>.</p>
 */
@property (nonatomic, strong) NSArray *notificationTypes;

/**
 * <p> The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) topic. </p>
 */
@property (nonatomic, strong) NSString *topicARN;

@end

@interface AWSAutoScalingPutScalingPolicyType : AWSRequest


/**
 * <p> Specifies whether the <code>ScalingAdjustment</code> is an absolute number or a percentage of the current capacity. Valid values are <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and <code>PercentChangeInCapacity</code>. </p><p>For more information about the adjustment types supported by Auto Scaling, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/as-scale-based-on-demand.html">Scale Based on Demand</a>.</p>
 */
@property (nonatomic, strong) NSString *adjustmentType;

/**
 * <p> The name or ARN of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start. </p><p>For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AS_Concepts.html#Cooldown">Cooldown Period</a></p>
 */
@property (nonatomic, strong) NSNumber *cooldown;

/**
 * <p> Used with <code>AdjustmentType</code> with the value <code>PercentChangeInCapacity</code>, the scaling policy changes the <code>DesiredCapacity</code> of the Auto Scaling group by at least the number of instances specified in the value. </p><p> You will get a <code>ValidationError</code> if you use <code>MinAdjustmentStep</code> on a policy with an <code>AdjustmentType</code> other than <code>PercentChangeInCapacity</code>. </p>
 */
@property (nonatomic, strong) NSNumber *minAdjustmentStep;

/**
 * <p>The name of the policy you want to create or update.</p>
 */
@property (nonatomic, strong) NSString *policyName;

/**
 * <p> The number of instances by which to scale. <code>AdjustmentType</code> determines the interpretation of this number (e.g., as an absolute number or as a percentage of the existing Auto Scaling group size). A positive increment adds to the current capacity and a negative value removes from the current capacity. </p>
 */
@property (nonatomic, strong) NSNumber *scalingAdjustment;

@end

@interface AWSAutoScalingPutScheduledUpdateGroupActionType : AWSRequest


/**
 * <p> The name or ARN of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The number of Amazon EC2 instances that should be running in the group. </p>
 */
@property (nonatomic, strong) NSNumber *desiredCapacity;

/**
 * <p>The time for this action to end.</p>
 */
@property (nonatomic, strong) NSDate *endTime;

/**
 * <p> The maximum size for the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *maxSize;

/**
 * <p> The minimum size for the new Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *minSize;

/**
 * <p> The time when recurring future actions will start. Start time is specified by the user following the Unix cron syntax format. For information about cron syntax, go to <a href="http://en.wikipedia.org/wiki/Cron">Wikipedia, The Free Encyclopedia</a>.</p><p>When <code>StartTime</code> and <code>EndTime</code> are specified with <code>Recurrence</code>, they form the boundaries of when the recurring action will start and stop.</p>
 */
@property (nonatomic, strong) NSString *recurrence;

/**
 * <p> The name of this scaling action. </p>
 */
@property (nonatomic, strong) NSString *scheduledActionName;

/**
 * <p>The time for this action to start, as in <code>--start-time 2010-06-01T00:00:00Z</code>.</p><p>If you try to schedule your action in the past, Auto Scaling returns an error message. </p><p>When <code>StartTime</code> and <code>EndTime</code> are specified with <code>Recurrence</code>, they form the boundaries of when the recurring action will start and stop.</p>
 */
@property (nonatomic, strong) NSDate *startTime;

/**
 * <p><code>Time</code> is deprecated.</p><p>The time for this action to start. <code>Time</code> is an alias for <code>StartTime</code> and can be specified instead of <code>StartTime</code>, or vice versa. If both <code>Time</code> and <code>StartTime</code> are specified, their values should be identical. Otherwise, <code>PutScheduledUpdateGroupAction</code> will return an error.</p>
 */
@property (nonatomic, strong) NSDate *time;

@end

/**
 * <p>The output of the <a>RecordLifecycleActionHeartbeat</a> action. </p>
 */
@interface AWSAutoScalingRecordLifecycleActionHeartbeatAnswer : AWSModel


@end

@interface AWSAutoScalingRecordLifecycleActionHeartbeatType : AWSRequest


/**
 * <p>The name of the Auto Scaling group to which the hook belongs.</p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p>A token that uniquely identifies a specific lifecycle action associated with an instance. Auto Scaling sends this token to the notification target you specified when you created the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString *lifecycleActionToken;

/**
 * <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString *lifecycleHookName;

@end

/**
 * <p> The <code>ScalingPolicy</code> data type. </p>
 */
@interface AWSAutoScalingScalingPolicy : AWSModel


/**
 * <p> Specifies whether the <code>ScalingAdjustment</code> is an absolute number or a percentage of the current capacity. Valid values are <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and <code>PercentChangeInCapacity</code>. </p>
 */
@property (nonatomic, strong) NSString *adjustmentType;

/**
 * <p> A list of CloudWatch Alarms related to the policy. </p>
 */
@property (nonatomic, strong) NSArray *alarms;

/**
 * <p> The name of the Auto Scaling group associated with this scaling policy. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The amount of time, in seconds, after a scaling activity completes before any further trigger-related scaling activities can start. </p>
 */
@property (nonatomic, strong) NSNumber *cooldown;

/**
 * <p> Changes the <code>DesiredCapacity</code> of the Auto Scaling group by at least the specified number of instances. </p>
 */
@property (nonatomic, strong) NSNumber *minAdjustmentStep;

/**
 * <p> The Amazon Resource Name (ARN) of the policy. </p>
 */
@property (nonatomic, strong) NSString *policyARN;

/**
 * <p> The name of the scaling policy. </p>
 */
@property (nonatomic, strong) NSString *policyName;

/**
 * <p> The number associated with the specified adjustment type. A positive value adds to the current capacity and a negative value removes from the current capacity. </p>
 */
@property (nonatomic, strong) NSNumber *scalingAdjustment;

@end

@interface AWSAutoScalingScalingProcessQuery : AWSRequest


/**
 * <p> The name or Amazon Resource Name (ARN) of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The processes that you want to suspend or resume, which can include one or more of the following: </p><ul><li>Launch</li><li>Terminate</li><li>HealthCheck</li><li>ReplaceUnhealthy</li><li>AZRebalance</li><li>AlarmNotification</li><li>ScheduledActions</li><li>AddToLoadBalancer</li></ul><p> To suspend all process types, omit this parameter. </p>
 */
@property (nonatomic, strong) NSArray *scalingProcesses;

@end

/**
 * <p> A scaling action that is scheduled for a future time and date. An action can be scheduled up to thirty days in advance. </p><p> Starting with API version 2011-01-01, you can use <code>recurrence</code> to specify that a scaling action occurs regularly on a schedule. </p>
 */
@interface AWSAutoScalingScheduledActionsType : AWSModel


/**
 * <p> A string that marks the start of the next batch of returned results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p> A list of scheduled actions designed to update an Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSArray *scheduledUpdateGroupActions;

@end

/**
 * <p> This data type stores information about a scheduled update to an Auto Scaling group. </p>
 */
@interface AWSAutoScalingScheduledUpdateGroupAction : AWSModel


/**
 * <p> The name of the Auto Scaling group to be updated. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The number of instances you prefer to maintain in your Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *desiredCapacity;

/**
 * <p> The time that the action is scheduled to end. This value can be up to one month in the future. </p>
 */
@property (nonatomic, strong) NSDate *endTime;

/**
 * <p> The maximum size of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *maxSize;

/**
 * <p> The minimum size of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *minSize;

/**
 * <p> The regular schedule that an action occurs. </p>
 */
@property (nonatomic, strong) NSString *recurrence;

/**
 * <p> The Amazon Resource Name (ARN) of this scheduled action. </p>
 */
@property (nonatomic, strong) NSString *scheduledActionARN;

/**
 * <p> The name of this scheduled action. </p>
 */
@property (nonatomic, strong) NSString *scheduledActionName;

/**
 * <p> The time that the action is scheduled to begin. This value can be up to one month in the future. </p><p>When <code>StartTime</code> and <code>EndTime</code> are specified with <code>Recurrence</code>, they form the boundaries of when the recurring action will start and stop.</p>
 */
@property (nonatomic, strong) NSDate *startTime;

/**
 * <p><code>Time</code> is deprecated.</p><p>The time that the action is scheduled to begin. <code>Time</code> is an alias for <code>StartTime</code>. </p>
 */
@property (nonatomic, strong) NSDate *time;

@end

/**
 * <p></p>
 * Required parameters: [AutoScalingGroupName, DesiredCapacity]
 */
@interface AWSAutoScalingSetDesiredCapacityType : AWSRequest


/**
 * <p> The name of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> The new capacity setting for the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *desiredCapacity;

/**
 * <p> By default, <code>SetDesiredCapacity</code> overrides any cooldown period associated with the Auto Scaling group. Set to <code>True</code> if you want Auto Scaling to wait for the cooldown period associated with the Auto Scaling group to complete before initiating a scaling activity to set your Auto Scaling group to the new capacity setting. </p>
 */
@property (nonatomic, strong) NSNumber *honorCooldown;

@end

@interface AWSAutoScalingSetInstanceHealthQuery : AWSRequest


/**
 * <p> The health status of the instance. Set to <code>Healthy</code> if you want the instance to remain in service. Set to <code>Unhealthy</code> if you want the instance to be out of service. Auto Scaling will terminate and replace the unhealthy instance. </p>
 */
@property (nonatomic, strong) NSString *healthStatus;

/**
 * <p> The identifier of the Amazon EC2 instance. </p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>If the Auto Scaling group of the specified instance has a <code>HealthCheckGracePeriod</code> specified for the group, by default, this call will respect the grace period. Set this to <code>False</code>, if you do not want the call to respect the grace period associated with the group.</p><p>For more information, see the <code>HealthCheckGracePeriod</code> parameter description in the <a>CreateAutoScalingGroup</a> action. </p>
 */
@property (nonatomic, strong) NSNumber *shouldRespectGracePeriod;

@end

/**
 * <p> An Auto Scaling process that has been suspended. For more information, see <a>ProcessType</a>. </p>
 */
@interface AWSAutoScalingSuspendedProcess : AWSModel


/**
 * <p> The name of the suspended process. </p>
 */
@property (nonatomic, strong) NSString *processName;

/**
 * <p> The reason that the process was suspended. </p>
 */
@property (nonatomic, strong) NSString *suspensionReason;

@end

/**
 * <p> The tag applied to an Auto Scaling group. </p>
 * Required parameters: [Key]
 */
@interface AWSAutoScalingTag : AWSModel


/**
 * <p> The key of the tag. </p>
 */
@property (nonatomic, strong) NSString *key;

/**
 * <p> Specifies whether the new tag will be applied to instances launched after the tag is created. The same behavior applies to updates: If you change a tag, the changed tag will be applied to all instances launched after you made the change. </p>
 */
@property (nonatomic, strong) NSNumber *propagateAtLaunch;

/**
 * <p> The name of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *resourceId;

/**
 * <p> The kind of resource to which the tag is applied. Currently, Auto Scaling supports the <code>auto-scaling-group</code> resource type. </p>
 */
@property (nonatomic, strong) NSString *resourceType;

/**
 * <p> The value of the tag. </p>
 */
@property (nonatomic, strong) NSString *value;

@end

/**
 * <p> The tag applied to an Auto Scaling group. </p>
 */
@interface AWSAutoScalingTagDescription : AWSModel


/**
 * <p> The key of the tag. </p>
 */
@property (nonatomic, strong) NSString *key;

/**
 * <p> Specifies whether the new tag will be applied to instances launched after the tag is created. The same behavior applies to updates: If you change a tag, the changed tag will be applied to all instances launched after you made the change. </p>
 */
@property (nonatomic, strong) NSNumber *propagateAtLaunch;

/**
 * <p> The name of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *resourceId;

/**
 * <p> The kind of resource to which the tag is applied. Currently, Auto Scaling supports the <code>auto-scaling-group</code> resource type. </p>
 */
@property (nonatomic, strong) NSString *resourceType;

/**
 * <p> The value of the tag. </p>
 */
@property (nonatomic, strong) NSString *value;

@end

/**
 * <p></p>
 */
@interface AWSAutoScalingTagsType : AWSModel


/**
 * <p> A string used to mark the start of the next batch of returned results. </p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p> The list of tags. </p>
 */
@property (nonatomic, strong) NSArray *tags;

@end

/**
 * <p></p>
 * Required parameters: [InstanceId, ShouldDecrementDesiredCapacity]
 */
@interface AWSAutoScalingTerminateInstanceInAutoScalingGroupType : AWSRequest


/**
 * <p> The ID of the Amazon EC2 instance to be terminated. </p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p> Specifies whether (<i>true</i>) or not (<i>false</i>) terminating this instance should also decrement the size of the <a>AutoScalingGroup</a>. </p>
 */
@property (nonatomic, strong) NSNumber *shouldDecrementDesiredCapacity;

@end

/**
 * <p></p>
 * Required parameters: [AutoScalingGroupName]
 */
@interface AWSAutoScalingUpdateAutoScalingGroupType : AWSRequest


/**
 * <p> The name of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSString *autoScalingGroupName;

/**
 * <p> Availability Zones for the group. </p>
 */
@property (nonatomic, strong) NSArray *availabilityZones;

/**
 * <p> The amount of time, in seconds, after a scaling activity completes before any further scaling activities can start. For more information, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/AS_Concepts.html#Cooldown">Cooldown Period</a>. </p>
 */
@property (nonatomic, strong) NSNumber *defaultCooldown;

/**
 * <p> The desired capacity for the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *desiredCapacity;

/**
 * <p> The length of time that Auto Scaling waits before checking an instance's health status. The grace period begins when the instance passes System Status and the Instance Status checks from Amazon EC2. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeInstanceStatus.html">DescribeInstanceStatus</a>. </p>
 */
@property (nonatomic, strong) NSNumber *healthCheckGracePeriod;

/**
 * <p> The type of health check for the instances in the Auto Scaling group. The health check type can either be <code>EC2</code> for Amazon EC2 or <code>ELB</code> for Elastic Load Balancing. </p>
 */
@property (nonatomic, strong) NSString *healthCheckType;

/**
 * <p> The name of the launch configuration. </p>
 */
@property (nonatomic, strong) NSString *launchConfigurationName;

/**
 * <p> The maximum size of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *maxSize;

/**
 * <p> The minimum size of the Auto Scaling group. </p>
 */
@property (nonatomic, strong) NSNumber *minSize;

/**
 * <p> The name of the cluster placement group, if applicable. For more information, go to <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using_cluster_computing.html"> Using Cluster Instances</a> in the Amazon EC2 User Guide. </p>
 */
@property (nonatomic, strong) NSString *placementGroup;

/**
 * <p> A standalone termination policy or a list of termination policies used to select the instance to terminate. The policies are executed in the order that they are listed. </p><p> For more information on creating a termination policy for your Auto Scaling group, go to <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/us-termination-policy.html">Instance Termination Policy for Your Auto Scaling Group</a> in the the <i>Auto Scaling Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSArray *terminationPolicies;

/**
 * <p> The subnet identifier for the Amazon VPC connection, if applicable. You can specify several subnets in a comma-separated list. </p><p> When you specify <code>VPCZoneIdentifier</code> with <code>AvailabilityZones</code>, ensure that the subnets' Availability Zones match the values you specify for <code>AvailabilityZones</code>. </p><p> For more information on creating your Auto Scaling group in Amazon VPC by specifying subnets, see <a href="http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/autoscalingsubnets.html">Launch Auto Scaling Instances into Amazon VPC</a> in the the <i>Auto Scaling Developer Guide</i>. </p>
 */
@property (nonatomic, strong) NSString *VPCZoneIdentifier;

@end
