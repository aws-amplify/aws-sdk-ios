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

FOUNDATION_EXPORT NSString *const AWSAutoScalingErrorDomain;

typedef NS_ENUM(NSInteger, AWSAutoScalingErrorType) {
    AWSAutoScalingErrorUnknown,
    AWSAutoScalingErrorActiveInstanceRefreshNotFound,
    AWSAutoScalingErrorAlreadyExists,
    AWSAutoScalingErrorInstanceRefreshInProgress,
    AWSAutoScalingErrorInvalidNextToken,
    AWSAutoScalingErrorLimitExceeded,
    AWSAutoScalingErrorResourceContention,
    AWSAutoScalingErrorResourceInUse,
    AWSAutoScalingErrorScalingActivityInProgress,
    AWSAutoScalingErrorServiceLinkedRoleFailure,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingAcceleratorManufacturer) {
    AWSAutoScalingAcceleratorManufacturerUnknown,
    AWSAutoScalingAcceleratorManufacturerNvidia,
    AWSAutoScalingAcceleratorManufacturerAmd,
    AWSAutoScalingAcceleratorManufacturerAmazonWebServices,
    AWSAutoScalingAcceleratorManufacturerXilinx,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingAcceleratorName) {
    AWSAutoScalingAcceleratorNameUnknown,
    AWSAutoScalingAcceleratorNameA100,
    AWSAutoScalingAcceleratorNameV100,
    AWSAutoScalingAcceleratorNameK80,
    AWSAutoScalingAcceleratorNameT4,
    AWSAutoScalingAcceleratorNameM60,
    AWSAutoScalingAcceleratorNameRadeonProV520,
    AWSAutoScalingAcceleratorNameVu9p,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingAcceleratorType) {
    AWSAutoScalingAcceleratorTypeUnknown,
    AWSAutoScalingAcceleratorTypeGpu,
    AWSAutoScalingAcceleratorTypeFpga,
    AWSAutoScalingAcceleratorTypeInference,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingBareMetal) {
    AWSAutoScalingBareMetalUnknown,
    AWSAutoScalingBareMetalIncluded,
    AWSAutoScalingBareMetalExcluded,
    AWSAutoScalingBareMetalRequired,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingBurstablePerformance) {
    AWSAutoScalingBurstablePerformanceUnknown,
    AWSAutoScalingBurstablePerformanceIncluded,
    AWSAutoScalingBurstablePerformanceExcluded,
    AWSAutoScalingBurstablePerformanceRequired,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingCpuManufacturer) {
    AWSAutoScalingCpuManufacturerUnknown,
    AWSAutoScalingCpuManufacturerIntel,
    AWSAutoScalingCpuManufacturerAmd,
    AWSAutoScalingCpuManufacturerAmazonWebServices,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingInstanceGeneration) {
    AWSAutoScalingInstanceGenerationUnknown,
    AWSAutoScalingInstanceGenerationCurrent,
    AWSAutoScalingInstanceGenerationPrevious,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingInstanceMetadataEndpointState) {
    AWSAutoScalingInstanceMetadataEndpointStateUnknown,
    AWSAutoScalingInstanceMetadataEndpointStateDisabled,
    AWSAutoScalingInstanceMetadataEndpointStateEnabled,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingInstanceMetadataHttpTokensState) {
    AWSAutoScalingInstanceMetadataHttpTokensStateUnknown,
    AWSAutoScalingInstanceMetadataHttpTokensStateOptional,
    AWSAutoScalingInstanceMetadataHttpTokensStateRequired,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingInstanceRefreshStatus) {
    AWSAutoScalingInstanceRefreshStatusUnknown,
    AWSAutoScalingInstanceRefreshStatusPending,
    AWSAutoScalingInstanceRefreshStatusInProgress,
    AWSAutoScalingInstanceRefreshStatusSuccessful,
    AWSAutoScalingInstanceRefreshStatusFailed,
    AWSAutoScalingInstanceRefreshStatusCancelling,
    AWSAutoScalingInstanceRefreshStatusCancelled,
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
    AWSAutoScalingLifecycleStateWarmedPending,
    AWSAutoScalingLifecycleStateWarmedPendingWait,
    AWSAutoScalingLifecycleStateWarmedPendingProceed,
    AWSAutoScalingLifecycleStateWarmedTerminating,
    AWSAutoScalingLifecycleStateWarmedTerminatingWait,
    AWSAutoScalingLifecycleStateWarmedTerminatingProceed,
    AWSAutoScalingLifecycleStateWarmedTerminated,
    AWSAutoScalingLifecycleStateWarmedStopped,
    AWSAutoScalingLifecycleStateWarmedRunning,
    AWSAutoScalingLifecycleStateWarmedHibernated,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingLocalStorage) {
    AWSAutoScalingLocalStorageUnknown,
    AWSAutoScalingLocalStorageIncluded,
    AWSAutoScalingLocalStorageExcluded,
    AWSAutoScalingLocalStorageRequired,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingLocalStorageType) {
    AWSAutoScalingLocalStorageTypeUnknown,
    AWSAutoScalingLocalStorageTypeHdd,
    AWSAutoScalingLocalStorageTypeSsd,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingMetricStatistic) {
    AWSAutoScalingMetricStatisticUnknown,
    AWSAutoScalingMetricStatisticAverage,
    AWSAutoScalingMetricStatisticMinimum,
    AWSAutoScalingMetricStatisticMaximum,
    AWSAutoScalingMetricStatisticSampleCount,
    AWSAutoScalingMetricStatisticSum,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingMetricType) {
    AWSAutoScalingMetricTypeUnknown,
    AWSAutoScalingMetricTypeASGAverageCPUUtilization,
    AWSAutoScalingMetricTypeASGAverageNetworkIn,
    AWSAutoScalingMetricTypeASGAverageNetworkOut,
    AWSAutoScalingMetricTypeALBRequestCountPerTarget,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingPredefinedLoadMetricType) {
    AWSAutoScalingPredefinedLoadMetricTypeUnknown,
    AWSAutoScalingPredefinedLoadMetricTypeASGTotalCPUUtilization,
    AWSAutoScalingPredefinedLoadMetricTypeASGTotalNetworkIn,
    AWSAutoScalingPredefinedLoadMetricTypeASGTotalNetworkOut,
    AWSAutoScalingPredefinedLoadMetricTypeALBTargetGroupRequestCount,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingPredefinedMetricPairType) {
    AWSAutoScalingPredefinedMetricPairTypeUnknown,
    AWSAutoScalingPredefinedMetricPairTypeASGCPUUtilization,
    AWSAutoScalingPredefinedMetricPairTypeASGNetworkIn,
    AWSAutoScalingPredefinedMetricPairTypeASGNetworkOut,
    AWSAutoScalingPredefinedMetricPairTypeALBRequestCount,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingPredefinedScalingMetricType) {
    AWSAutoScalingPredefinedScalingMetricTypeUnknown,
    AWSAutoScalingPredefinedScalingMetricTypeASGAverageCPUUtilization,
    AWSAutoScalingPredefinedScalingMetricTypeASGAverageNetworkIn,
    AWSAutoScalingPredefinedScalingMetricTypeASGAverageNetworkOut,
    AWSAutoScalingPredefinedScalingMetricTypeALBRequestCountPerTarget,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingPredictiveScalingMaxCapacityBreachBehavior) {
    AWSAutoScalingPredictiveScalingMaxCapacityBreachBehaviorUnknown,
    AWSAutoScalingPredictiveScalingMaxCapacityBreachBehaviorHonorMaxCapacity,
    AWSAutoScalingPredictiveScalingMaxCapacityBreachBehaviorIncreaseMaxCapacity,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingPredictiveScalingMode) {
    AWSAutoScalingPredictiveScalingModeUnknown,
    AWSAutoScalingPredictiveScalingModeForecastAndScale,
    AWSAutoScalingPredictiveScalingModeForecastOnly,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingRefreshStrategy) {
    AWSAutoScalingRefreshStrategyUnknown,
    AWSAutoScalingRefreshStrategyRolling,
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

typedef NS_ENUM(NSInteger, AWSAutoScalingWarmPoolState) {
    AWSAutoScalingWarmPoolStateUnknown,
    AWSAutoScalingWarmPoolStateStopped,
    AWSAutoScalingWarmPoolStateRunning,
    AWSAutoScalingWarmPoolStateHibernated,
};

typedef NS_ENUM(NSInteger, AWSAutoScalingWarmPoolStatus) {
    AWSAutoScalingWarmPoolStatusUnknown,
    AWSAutoScalingWarmPoolStatusPendingDelete,
};

@class AWSAutoScalingAcceleratorCountRequest;
@class AWSAutoScalingAcceleratorTotalMemoryMiBRequest;
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
@class AWSAutoScalingBaselineEbsBandwidthMbpsRequest;
@class AWSAutoScalingBatchDeleteScheduledActionAnswer;
@class AWSAutoScalingBatchDeleteScheduledActionType;
@class AWSAutoScalingBatchPutScheduledUpdateGroupActionAnswer;
@class AWSAutoScalingBatchPutScheduledUpdateGroupActionType;
@class AWSAutoScalingBlockDeviceMapping;
@class AWSAutoScalingCancelInstanceRefreshAnswer;
@class AWSAutoScalingCancelInstanceRefreshType;
@class AWSAutoScalingCapacityForecast;
@class AWSAutoScalingCompleteLifecycleActionAnswer;
@class AWSAutoScalingCompleteLifecycleActionType;
@class AWSAutoScalingCreateAutoScalingGroupType;
@class AWSAutoScalingCreateLaunchConfigurationType;
@class AWSAutoScalingCreateOrUpdateTagsType;
@class AWSAutoScalingCustomizedMetricSpecification;
@class AWSAutoScalingDeleteAutoScalingGroupType;
@class AWSAutoScalingDeleteLifecycleHookAnswer;
@class AWSAutoScalingDeleteLifecycleHookType;
@class AWSAutoScalingDeleteNotificationConfigurationType;
@class AWSAutoScalingDeletePolicyType;
@class AWSAutoScalingDeleteScheduledActionType;
@class AWSAutoScalingDeleteTagsType;
@class AWSAutoScalingDeleteWarmPoolAnswer;
@class AWSAutoScalingDeleteWarmPoolType;
@class AWSAutoScalingDescribeAccountLimitsAnswer;
@class AWSAutoScalingDescribeAdjustmentTypesAnswer;
@class AWSAutoScalingDescribeAutoScalingInstancesType;
@class AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer;
@class AWSAutoScalingDescribeInstanceRefreshesAnswer;
@class AWSAutoScalingDescribeInstanceRefreshesType;
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
@class AWSAutoScalingDescribeWarmPoolAnswer;
@class AWSAutoScalingDescribeWarmPoolType;
@class AWSAutoScalingDesiredConfiguration;
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
@class AWSAutoScalingFailedScheduledUpdateGroupActionRequest;
@class AWSAutoScalingFilter;
@class AWSAutoScalingGetPredictiveScalingForecastAnswer;
@class AWSAutoScalingGetPredictiveScalingForecastType;
@class AWSAutoScalingInstance;
@class AWSAutoScalingInstanceMetadataOptions;
@class AWSAutoScalingInstanceMonitoring;
@class AWSAutoScalingInstanceRefresh;
@class AWSAutoScalingInstanceRefreshLivePoolProgress;
@class AWSAutoScalingInstanceRefreshProgressDetails;
@class AWSAutoScalingInstanceRefreshWarmPoolProgress;
@class AWSAutoScalingInstanceRequirements;
@class AWSAutoScalingInstanceReusePolicy;
@class AWSAutoScalingInstancesDistribution;
@class AWSAutoScalingLaunchConfiguration;
@class AWSAutoScalingLaunchConfigurationNameType;
@class AWSAutoScalingLaunchConfigurationNamesType;
@class AWSAutoScalingLaunchConfigurationsType;
@class AWSAutoScalingLaunchTemplate;
@class AWSAutoScalingLaunchTemplateOverrides;
@class AWSAutoScalingLaunchTemplateSpecification;
@class AWSAutoScalingLifecycleHook;
@class AWSAutoScalingLifecycleHookSpecification;
@class AWSAutoScalingLoadBalancerState;
@class AWSAutoScalingLoadBalancerTargetGroupState;
@class AWSAutoScalingLoadForecast;
@class AWSAutoScalingMemoryGiBPerVCpuRequest;
@class AWSAutoScalingMemoryMiBRequest;
@class AWSAutoScalingMetric;
@class AWSAutoScalingMetricCollectionType;
@class AWSAutoScalingMetricDataQuery;
@class AWSAutoScalingMetricDimension;
@class AWSAutoScalingMetricGranularityType;
@class AWSAutoScalingMetricStat;
@class AWSAutoScalingMixedInstancesPolicy;
@class AWSAutoScalingNetworkInterfaceCountRequest;
@class AWSAutoScalingNotificationConfiguration;
@class AWSAutoScalingPoliciesType;
@class AWSAutoScalingPolicyARNType;
@class AWSAutoScalingPredefinedMetricSpecification;
@class AWSAutoScalingPredictiveScalingConfiguration;
@class AWSAutoScalingPredictiveScalingCustomizedCapacityMetric;
@class AWSAutoScalingPredictiveScalingCustomizedLoadMetric;
@class AWSAutoScalingPredictiveScalingCustomizedScalingMetric;
@class AWSAutoScalingPredictiveScalingMetricSpecification;
@class AWSAutoScalingPredictiveScalingPredefinedLoadMetric;
@class AWSAutoScalingPredictiveScalingPredefinedMetricPair;
@class AWSAutoScalingPredictiveScalingPredefinedScalingMetric;
@class AWSAutoScalingProcessType;
@class AWSAutoScalingProcessesType;
@class AWSAutoScalingPutLifecycleHookAnswer;
@class AWSAutoScalingPutLifecycleHookType;
@class AWSAutoScalingPutNotificationConfigurationType;
@class AWSAutoScalingPutScalingPolicyType;
@class AWSAutoScalingPutScheduledUpdateGroupActionType;
@class AWSAutoScalingPutWarmPoolAnswer;
@class AWSAutoScalingPutWarmPoolType;
@class AWSAutoScalingRecordLifecycleActionHeartbeatAnswer;
@class AWSAutoScalingRecordLifecycleActionHeartbeatType;
@class AWSAutoScalingRefreshPreferences;
@class AWSAutoScalingScalingPolicy;
@class AWSAutoScalingScalingProcessQuery;
@class AWSAutoScalingScheduledActionsType;
@class AWSAutoScalingScheduledUpdateGroupAction;
@class AWSAutoScalingScheduledUpdateGroupActionRequest;
@class AWSAutoScalingSetDesiredCapacityType;
@class AWSAutoScalingSetInstanceHealthQuery;
@class AWSAutoScalingSetInstanceProtectionAnswer;
@class AWSAutoScalingSetInstanceProtectionQuery;
@class AWSAutoScalingStartInstanceRefreshAnswer;
@class AWSAutoScalingStartInstanceRefreshType;
@class AWSAutoScalingStepAdjustment;
@class AWSAutoScalingSuspendedProcess;
@class AWSAutoScalingTag;
@class AWSAutoScalingTagDescription;
@class AWSAutoScalingTagsType;
@class AWSAutoScalingTargetTrackingConfiguration;
@class AWSAutoScalingTerminateInstanceInAutoScalingGroupType;
@class AWSAutoScalingTotalLocalStorageGBRequest;
@class AWSAutoScalingUpdateAutoScalingGroupType;
@class AWSAutoScalingVCpuCountRequest;
@class AWSAutoScalingWarmPoolConfiguration;

/**
 <p>Specifies the minimum and maximum for the <code>AcceleratorCount</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>
 */
@interface AWSAutoScalingAcceleratorCountRequest : AWSModel


/**
 <p>The maximum value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max;

/**
 <p>The minimum value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable min;

@end

/**
 <p>Specifies the minimum and maximum for the <code>AcceleratorTotalMemoryMiB</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>
 */
@interface AWSAutoScalingAcceleratorTotalMemoryMiBRequest : AWSModel


/**
 <p>The memory maximum in MiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max;

/**
 <p>The memory minimum in MiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable min;

@end

/**
 
 */
@interface AWSAutoScalingActivitiesType : AWSModel


/**
 <p>The scaling activities. Activities are sorted by start time. Activities still in progress are described first.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingActivity *> * _Nullable activities;

/**
 <p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>
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
 <p>The Amazon Resource Name (ARN) of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupARN;

/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The state of the Auto Scaling group, which is either <code>InService</code> or <code>Deleted</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupState;

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
 
 */
@interface AWSAutoScalingActivityType : AWSModel


/**
 <p>A scaling activity.</p>
 */
@property (nonatomic, strong) AWSAutoScalingActivity * _Nullable activity;

@end

/**
 <p>Describes a policy adjustment type.</p>
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
 
 */
@interface AWSAutoScalingAttachInstancesQuery : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The IDs of the instances. You can specify up to 20 instances.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

@end

/**
 
 */
@interface AWSAutoScalingAttachLoadBalancerTargetGroupsResultType : AWSModel


@end

/**
 
 */
@interface AWSAutoScalingAttachLoadBalancerTargetGroupsType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The Amazon Resource Names (ARN) of the target groups. You can specify up to 10 target groups. To get the ARN of a target group, use the Elastic Load Balancing <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html">DescribeTargetGroups</a> API operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetGroupARNs;

@end

/**
 
 */
@interface AWSAutoScalingAttachLoadBalancersResultType : AWSModel


@end

/**
 
 */
@interface AWSAutoScalingAttachLoadBalancersType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The names of the load balancers. You can specify up to 10 load balancers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerNames;

@end

/**
 <p>Describes an Auto Scaling group.</p>
 Required parameters: [AutoScalingGroupName, MinSize, MaxSize, DesiredCapacity, DefaultCooldown, AvailabilityZones, HealthCheckType, CreatedTime]
 */
@interface AWSAutoScalingAutoScalingGroup : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupARN;

/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more Availability Zones for the group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>Indicates whether Capacity Rebalancing is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable capacityRebalance;

/**
 <p>Reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable context;

/**
 <p>The date and time the group was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The duration of the default cooldown period, in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultCooldown;

/**
 <p>The duration of the default instance warmup, in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultInstanceWarmup;

/**
 <p>The desired size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>The unit of measurement for the value specified for desired capacity. Amazon EC2 Auto Scaling supports <code>DesiredCapacityType</code> for attribute-based instance type selection only.</p>
 */
@property (nonatomic, strong) NSString * _Nullable desiredCapacityType;

/**
 <p>The metrics enabled for the group.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingEnabledMetric *> * _Nullable enabledMetrics;

/**
 <p>The duration of the health check grace period, in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckGracePeriod;

/**
 <p>The service to use for the health checks. The valid values are <code>EC2</code> and <code>ELB</code>. If you configure an Auto Scaling group to use <code>ELB</code> health checks, it considers the instance unhealthy if it fails either the EC2 status checks or the load balancer health checks.</p>
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
 <p>The launch template for the group.</p>
 */
@property (nonatomic, strong) AWSAutoScalingLaunchTemplateSpecification * _Nullable launchTemplate;

/**
 <p>One or more load balancers associated with the group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerNames;

/**
 <p>The maximum amount of time, in seconds, that an instance can be in service.</p><p>Valid Range: Minimum value of 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxInstanceLifetime;

/**
 <p>The maximum size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSize;

/**
 <p>The minimum size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

/**
 <p>The mixed instances policy for the group.</p>
 */
@property (nonatomic, strong) AWSAutoScalingMixedInstancesPolicy * _Nullable mixedInstancesPolicy;

/**
 <p>Indicates whether newly launched instances are protected from termination by Amazon EC2 Auto Scaling when scaling in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable latestInstancesProtectedFromScaleIn;

/**
 <p>The name of the placement group into which to launch your instances, if any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable placementGroup;

/**
 <p>The predicted capacity of the group when it has a predictive scaling policy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable predictedCapacity;

/**
 <p>The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group uses to call other Amazon Web Services on your behalf.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceLinkedRoleARN;

/**
 <p>The current state of the group when the <a>DeleteAutoScalingGroup</a> operation is in progress.</p>
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
 <p>One or more subnet IDs, if applicable, separated by commas.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VPCZoneIdentifier;

/**
 <p>The warm pool for the group.</p>
 */
@property (nonatomic, strong) AWSAutoScalingWarmPoolConfiguration * _Nullable warmPoolConfiguration;

/**
 <p>The current size of the warm pool.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable warmPoolSize;

@end

/**
 
 */
@interface AWSAutoScalingAutoScalingGroupNamesType : AWSRequest


/**
 <p>The names of the Auto Scaling groups. By default, you can only specify up to 50 names. You can optionally increase this limit using the <code>MaxRecords</code> parameter.</p><p>If you omit this parameter, all Auto Scaling groups are described.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoScalingGroupNames;

/**
 <p>One or more filters to limit the results based on specific tags. </p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAutoScalingAutoScalingGroupsType : AWSModel


/**
 <p>The groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingAutoScalingGroup *> * _Nullable autoScalingGroups;

/**
 <p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Describes an EC2 instance associated with an Auto Scaling group.</p>
 Required parameters: [InstanceId, AutoScalingGroupName, AvailabilityZone, LifecycleState, HealthStatus, ProtectedFromScaleIn]
 */
@interface AWSAutoScalingAutoScalingInstanceDetails : AWSModel


/**
 <p>The name of the Auto Scaling group for the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The Availability Zone for the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The last reported health status of this instance. "Healthy" means that the instance is healthy and should remain in service. "Unhealthy" means that the instance is unhealthy and Amazon EC2 Auto Scaling should terminate and replace it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthStatus;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The instance type of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The launch configuration used to launch the instance. This value is not available if you attached the instance to the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

/**
 <p>The launch template for the instance.</p>
 */
@property (nonatomic, strong) AWSAutoScalingLaunchTemplateSpecification * _Nullable launchTemplate;

/**
 <p>The lifecycle state for the instance. The <code>Quarantined</code> state is not used. For information about lifecycle states, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroupLifecycle.html">Instance lifecycle</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p><p>Valid Values: <code>Pending</code> | <code>Pending:Wait</code> | <code>Pending:Proceed</code> | <code>Quarantined</code> | <code>InService</code> | <code>Terminating</code> | <code>Terminating:Wait</code> | <code>Terminating:Proceed</code> | <code>Terminated</code> | <code>Detaching</code> | <code>Detached</code> | <code>EnteringStandby</code> | <code>Standby</code> | <code>Warmed:Pending</code> | <code>Warmed:Pending:Wait</code> | <code>Warmed:Pending:Proceed</code> | <code>Warmed:Terminating</code> | <code>Warmed:Terminating:Wait</code> | <code>Warmed:Terminating:Proceed</code> | <code>Warmed:Terminated</code> | <code>Warmed:Stopped</code> | <code>Warmed:Running</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleState;

/**
 <p>Indicates whether the instance is protected from termination by Amazon EC2 Auto Scaling when scaling in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable protectedFromScaleIn;

/**
 <p>The number of capacity units contributed by the instance based on its instance type.</p><p>Valid Range: Minimum value of 1. Maximum value of 999.</p>
 */
@property (nonatomic, strong) NSString * _Nullable weightedCapacity;

@end

/**
 
 */
@interface AWSAutoScalingAutoScalingInstancesType : AWSModel


/**
 <p>The instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingAutoScalingInstanceDetails *> * _Nullable autoScalingInstances;

/**
 <p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Specifies the minimum and maximum for the <code>BaselineEbsBandwidthMbps</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>
 */
@interface AWSAutoScalingBaselineEbsBandwidthMbpsRequest : AWSModel


/**
 <p>The maximum value in Mbps.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max;

/**
 <p>The minimum value in Mbps.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable min;

@end

/**
 
 */
@interface AWSAutoScalingBatchDeleteScheduledActionAnswer : AWSModel


/**
 <p>The names of the scheduled actions that could not be deleted, including an error message.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingFailedScheduledUpdateGroupActionRequest *> * _Nullable failedScheduledActions;

@end

/**
 
 */
@interface AWSAutoScalingBatchDeleteScheduledActionType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The names of the scheduled actions to delete. The maximum number allowed is 50. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scheduledActionNames;

@end

/**
 
 */
@interface AWSAutoScalingBatchPutScheduledUpdateGroupActionAnswer : AWSModel


/**
 <p>The names of the scheduled actions that could not be created or updated, including an error message.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingFailedScheduledUpdateGroupActionRequest *> * _Nullable failedScheduledUpdateGroupActions;

@end

/**
 
 */
@interface AWSAutoScalingBatchPutScheduledUpdateGroupActionType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more scheduled actions. The maximum number allowed is 50.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingScheduledUpdateGroupActionRequest *> * _Nullable scheduledUpdateGroupActions;

@end

/**
 <p>Describes a block device mapping.</p>
 Required parameters: [DeviceName]
 */
@interface AWSAutoScalingBlockDeviceMapping : AWSModel


/**
 <p>The device name exposed to the EC2 instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>). For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html">Device Naming on Linux Instances</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>Parameters used to automatically set up EBS volumes when an instance is launched.</p><p>You can specify either <code>VirtualName</code> or <code>Ebs</code>, but not both.</p>
 */
@property (nonatomic, strong) AWSAutoScalingEbs * _Nullable ebs;

/**
 <p>Setting this value to <code>true</code> suppresses the specified device included in the block device mapping of the AMI.</p><p>If <code>NoDevice</code> is <code>true</code> for the root device, instances might fail the EC2 health check. In that case, Amazon EC2 Auto Scaling launches replacement instances.</p><p>If you specify <code>NoDevice</code>, you cannot specify <code>Ebs</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable noDevice;

/**
 <p>The name of the virtual device (for example, <code>ephemeral0</code>).</p><p>You can specify either <code>VirtualName</code> or <code>Ebs</code>, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualName;

@end

/**
 
 */
@interface AWSAutoScalingCancelInstanceRefreshAnswer : AWSModel


/**
 <p>The instance refresh ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceRefreshId;

@end

/**
 
 */
@interface AWSAutoScalingCancelInstanceRefreshType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

@end

/**
 <p>A <code>GetPredictiveScalingForecast</code> call returns the capacity forecast for a predictive scaling policy. This structure includes the data points for that capacity forecast, along with the timestamps of those data points. </p>
 Required parameters: [Timestamps, Values]
 */
@interface AWSAutoScalingCapacityForecast : AWSModel


/**
 <p>The timestamps for the data points, in UTC format.</p>
 */
@property (nonatomic, strong) NSArray<NSDate *> * _Nullable timestamps;

/**
 <p>The values of the data points.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable values;

@end

/**
 
 */
@interface AWSAutoScalingCompleteLifecycleActionAnswer : AWSModel


@end

/**
 
 */
@interface AWSAutoScalingCompleteLifecycleActionType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
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
 <p>A universally unique identifier (UUID) that identifies a specific lifecycle action associated with an instance. Amazon EC2 Auto Scaling sends this token to the notification target you specified when you created the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleActionToken;

/**
 <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleHookName;

@end

/**
 
 */
@interface AWSAutoScalingCreateAutoScalingGroupType : AWSRequest


/**
 <p>The name of the Auto Scaling group. This name must be unique per Region per account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>A list of Availability Zones where instances in the Auto Scaling group can be created. This parameter is optional if you specify one or more subnets for <code>VPCZoneIdentifier</code>.</p><p>Conditional: If your account supports EC2-Classic and VPC, this parameter is required to launch instances into EC2-Classic.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>Indicates whether Capacity Rebalancing is enabled. Otherwise, Capacity Rebalancing is disabled. When you turn on Capacity Rebalancing, Amazon EC2 Auto Scaling attempts to launch a Spot Instance whenever Amazon EC2 notifies that a Spot Instance is at an elevated risk of interruption. After launching a new instance, it then terminates an old instance. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-capacity-rebalancing.html">Amazon EC2 Auto Scaling Capacity Rebalancing</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable capacityRebalance;

/**
 <p>Reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable context;

/**
 <p><i>Only needed if you use simple scaling policies.</i></p><p>The amount of time, in seconds, between one scaling activity ending and another one starting due to simple scaling policies. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html">Scaling cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>Default: <code>300</code> seconds</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultCooldown;

/**
 <p>The amount of time, in seconds, until a newly launched instance can contribute to the Amazon CloudWatch metrics. This delay lets an instance finish initializing before Amazon EC2 Auto Scaling aggregates instance metrics, resulting in more reliable usage data. Set this value equal to the amount of time that it takes for resource consumption to become stable after an instance reaches the <code>InService</code> state. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-default-instance-warmup.html">Set the default instance warmup for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><important><p>To manage your warm-up settings at the group level, we recommend that you set the default instance warmup, <i>even if its value is set to 0 seconds</i>. This also optimizes the performance of scaling policies that scale continuously, such as target tracking and step scaling policies. </p><p>If you need to remove a value that you previously set, include the property but specify <code>-1</code> for the value. However, we strongly recommend keeping the default instance warmup enabled by specifying a minimum value of <code>0</code>.</p></important><p>Default: None </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultInstanceWarmup;

/**
 <p>The desired capacity is the initial capacity of the Auto Scaling group at the time of its creation and the capacity it attempts to maintain. It can scale beyond this capacity if you configure auto scaling. This number must be greater than or equal to the minimum size of the group and less than or equal to the maximum size of the group. If you do not specify a desired capacity, the default is the minimum size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>The unit of measurement for the value specified for desired capacity. Amazon EC2 Auto Scaling supports <code>DesiredCapacityType</code> for attribute-based instance type selection only. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-instance-type-requirements.html">Creating an Auto Scaling group using attribute-based instance type selection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>By default, Amazon EC2 Auto Scaling specifies <code>units</code>, which translates into number of instances.</p><p>Valid values: <code>units</code> | <code>vcpu</code> | <code>memory-mib</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable desiredCapacityType;

/**
 <p><i/></p><p>The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before checking the health status of an EC2 instance that has come into service and marking it unhealthy due to a failed Elastic Load Balancing or custom health check. This is useful if your instances do not immediately pass these health checks after they enter the <code>InService</code> state. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html#health-check-grace-period">Health check grace period</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>Default: <code>0</code> seconds</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckGracePeriod;

/**
 <p>The service to use for the health checks. The valid values are <code>EC2</code> (default) and <code>ELB</code>. If you configure an Auto Scaling group to use load balancer (ELB) health checks, it considers the instance unhealthy if it fails either the EC2 status checks or the load balancer health checks. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html">Health checks for Auto Scaling instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckType;

/**
 <p>The ID of the instance used to base the launch configuration on. If specified, Amazon EC2 Auto Scaling uses the configuration values from the specified instance to create a new launch configuration. To get the instance ID, use the Amazon EC2 <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html">DescribeInstances</a> API operation. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-from-instance.html">Creating an Auto Scaling group using an EC2 instance</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The name of the launch configuration to use to launch instances. </p><p>Conditional: You must specify either a launch template (<code>LaunchTemplate</code> or <code>MixedInstancesPolicy</code>) or a launch configuration (<code>LaunchConfigurationName</code> or <code>InstanceId</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

/**
 <p>Parameters used to specify the launch template and version to use to launch instances. </p><p>Conditional: You must specify either a launch template (<code>LaunchTemplate</code> or <code>MixedInstancesPolicy</code>) or a launch configuration (<code>LaunchConfigurationName</code> or <code>InstanceId</code>).</p><note><p>The launch template that is specified must be configured for use with an Auto Scaling group. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-template.html">Creating a launch template for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p></note>
 */
@property (nonatomic, strong) AWSAutoScalingLaunchTemplateSpecification * _Nullable launchTemplate;

/**
 <p>One or more lifecycle hooks for the group, which specify actions to perform when Amazon EC2 Auto Scaling launches or terminates instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingLifecycleHookSpecification *> * _Nullable lifecycleHookSpecificationList;

/**
 <p>A list of Classic Load Balancers associated with this Auto Scaling group. For Application Load Balancers, Network Load Balancers, and Gateway Load Balancers, specify the <code>TargetGroupARNs</code> property instead.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerNames;

/**
 <p>The maximum amount of time, in seconds, that an instance can be in service. The default is null. If specified, the value must be either 0 or a number equal to or greater than 86,400 seconds (1 day). For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-max-instance-lifetime.html">Replacing Auto Scaling instances based on maximum instance lifetime</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxInstanceLifetime;

/**
 <p>The maximum size of the group.</p><note><p>With a mixed instances policy that uses instance weighting, Amazon EC2 Auto Scaling may need to go above <code>MaxSize</code> to meet your capacity requirements. In this event, Amazon EC2 Auto Scaling will never go above <code>MaxSize</code> by more than your largest instance weight (weights that define how many units each instance contributes to the desired capacity of the group).</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSize;

/**
 <p>The minimum size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

/**
 <p>An embedded object that specifies a mixed instances policy.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups.html">Auto Scaling groups with multiple instance types and purchase options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSAutoScalingMixedInstancesPolicy * _Nullable mixedInstancesPolicy;

/**
 <p>Indicates whether newly launched instances are protected from termination by Amazon EC2 Auto Scaling when scaling in. For more information about preventing instances from terminating on scale in, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-protection.html">Using instance scale-in protection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable latestInstancesProtectedFromScaleIn;

/**
 <p>The name of an existing placement group into which to launch your instances. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement groups</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><note><p>A <i>cluster</i> placement group is a logical grouping of instances within a single Availability Zone. You cannot specify multiple Availability Zones and a cluster placement group. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable placementGroup;

/**
 <p>The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group uses to call other Amazon Web Services on your behalf. By default, Amazon EC2 Auto Scaling uses a service-linked role named <code>AWSServiceRoleForAutoScaling</code>, which it creates if it does not exist. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-service-linked-role.html">Service-linked roles</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceLinkedRoleARN;

/**
 <p>One or more tags. You can tag your Auto Scaling group and propagate the tags to the Amazon EC2 instances it launches. Tags are not propagated to Amazon EBS volumes. To add tags to Amazon EBS volumes, specify the tags in a launch template but use caution. If the launch template specifies an instance tag with a key that is also specified for the Auto Scaling group, Amazon EC2 Auto Scaling overrides the value of that instance tag with the value specified by the Auto Scaling group. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html">Tagging Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingTag *> * _Nullable tags;

/**
 <p>The Amazon Resource Names (ARN) of the target groups to associate with the Auto Scaling group. Instances are registered as targets in a target group, and traffic is routed to the target group. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html">Elastic Load Balancing and Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetGroupARNs;

/**
 <p>A policy or a list of policies that are used to select the instance to terminate. These policies are executed in the order that you list them. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html">Controlling which Auto Scaling instances terminate during scale in</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable terminationPolicies;

/**
 <p>A comma-separated list of subnet IDs for a virtual private cloud (VPC) where instances in the Auto Scaling group can be created. If you specify <code>VPCZoneIdentifier</code> with <code>AvailabilityZones</code>, the subnets that you specify for this parameter must reside in those Availability Zones.</p><p>Conditional: If your account supports EC2-Classic and VPC, this parameter is required to launch instances into a VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VPCZoneIdentifier;

@end

/**
 
 */
@interface AWSAutoScalingCreateLaunchConfigurationType : AWSRequest


/**
 <p>For Auto Scaling groups that are running in a virtual private cloud (VPC), specifies whether to assign a public IP address to the group's instances. If you specify <code>true</code>, each instance in the Auto Scaling group receives a unique public IP address. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html">Launching Auto Scaling instances in a VPC</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>If you specify this parameter, you must specify at least one subnet for <code>VPCZoneIdentifier</code> when you create your group.</p><note><p>If the instance is launched into a default subnet, the default is to assign a public IP address, unless you disabled the option to assign a public IP address on the subnet. If the instance is launched into a nondefault subnet, the default is not to assign a public IP address, unless you enabled the option to assign a public IP address on the subnet.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable associatePublicIpAddress;

/**
 <p>A block device mapping, which specifies the block devices for the instance. You can specify virtual devices and EBS volumes. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html">Block Device Mapping</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingBlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p><i>EC2-Classic retires on August 15, 2022. This parameter is not supported after that date.</i></p><p>The ID of a ClassicLink-enabled VPC to link your EC2-Classic instances to. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable classicLinkVPCId;

/**
 <p><i>EC2-Classic retires on August 15, 2022. This parameter is not supported after that date.</i></p><p>The IDs of one or more security groups for the specified ClassicLink-enabled VPC. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html">ClassicLink</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><p>If you specify the <code>ClassicLinkVPCId</code> parameter, you must specify this parameter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable classicLinkVPCSecurityGroups;

/**
 <p>Specifies whether the launch configuration is optimized for EBS I/O (<code>true</code>) or not (<code>false</code>). The optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal I/O performance. This optimization is not available with all instance types. Additional fees are incurred when you enable EBS optimization for an instance type that is not EBS-optimized by default. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html">Amazon EBS-optimized instances</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><p>The default value is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsOptimized;

/**
 <p>The name or the Amazon Resource Name (ARN) of the instance profile associated with the IAM role for the instance. The instance profile contains the IAM role.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/us-iam-role.html">IAM role for applications that run on Amazon EC2 instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamInstanceProfile;

/**
 <p>The ID of the Amazon Machine Image (AMI) that was assigned during registration. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html">Finding an AMI</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><p>If you do not specify <code>InstanceId</code>, you must specify <code>ImageId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The ID of the instance to use to create the launch configuration. The new launch configuration derives attributes from the instance, except for the block device mapping.</p><p>To create a launch configuration with a block device mapping or override any other instance attributes, specify them as part of the same request.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-lc-with-instanceID.html">Creating a launch configuration using an EC2 instance</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>If you do not specify <code>InstanceId</code>, you must specify both <code>ImageId</code> and <code>InstanceType</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Controls whether instances in this group are launched with detailed (<code>true</code>) or basic (<code>false</code>) monitoring.</p><p>The default value is <code>true</code> (enabled).</p><important><p>When detailed monitoring is enabled, Amazon CloudWatch generates metrics every minute and your account is charged a fee. When you disable detailed monitoring, CloudWatch generates metrics every 5 minutes. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/latest/userguide/enable-as-instance-metrics.html">Configure Monitoring for Auto Scaling Instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p></important>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceMonitoring * _Nullable instanceMonitoring;

/**
 <p>Specifies the instance type of the EC2 instance.</p><p>For information about available instance types, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes">Available Instance Types</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><p>If you do not specify <code>InstanceId</code>, you must specify <code>InstanceType</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The ID of the kernel associated with the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kernelId;

/**
 <p>The name of the key pair. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Amazon EC2 Key Pairs</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>The name of the launch configuration. This name must be unique per Region per account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

/**
 <p>The metadata options for the instances. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-config.html#launch-configurations-imds">Configuring the Instance Metadata Options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceMetadataOptions * _Nullable metadataOptions;

/**
 <p>The tenancy of the instance. An instance with <code>dedicated</code> tenancy runs on isolated, single-tenant hardware and can only be launched into a VPC.</p><p>To launch dedicated instances into a shared tenancy VPC (a VPC with the instance placement tenancy attribute set to <code>default</code>), you must set the value of this parameter to <code>dedicated</code>.</p><p>If you specify <code>PlacementTenancy</code>, you must specify at least one subnet for <code>VPCZoneIdentifier</code> when you create your group.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-dedicated-instances.html">Configuring instance tenancy with Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>Valid Values: <code>default</code> | <code>dedicated</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable placementTenancy;

/**
 <p>The ID of the RAM disk to select.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ramdiskId;

/**
 <p>A list that contains the security groups to assign to the instances in the Auto Scaling group.</p><p>[EC2-VPC] Specify the security group IDs. For more information, see <a href="https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p><p>[EC2-Classic] Specify either the security group names or the security group IDs. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html">Amazon EC2 Security Groups</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The maximum hourly price to be paid for any Spot Instance launched to fulfill the request. Spot Instances are launched when the price you specify exceeds the current Spot price. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-launch-spot-instances.html">Requesting Spot Instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><note><p>When you change your maximum price by creating a new launch configuration, running instances will continue to run as long as the maximum price for those running instances is higher than the current Spot price.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable spotPrice;

/**
 <p>The user data to make available to the launched EC2 instances. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html">Instance metadata and user data</a> (Linux) and <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-metadata.html">Instance metadata and user data</a> (Windows). If you are using a command line tool, base64-encoding is performed for you, and you can load the text from a file. Otherwise, you must provide base64-encoded text. User data is limited to 16 KB.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userData;

@end

/**
 
 */
@interface AWSAutoScalingCreateOrUpdateTagsType : AWSRequest


/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingTag *> * _Nullable tags;

@end

/**
 <p>Represents a CloudWatch metric of your choosing for a target tracking scaling policy to use with Amazon EC2 Auto Scaling.</p><p>To create your customized metric specification:</p><ul><li><p>Add values for each required parameter from CloudWatch. You can use an existing metric, or a new metric that you create. To use your own metric, you must first publish the metric to CloudWatch. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html">Publish custom metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p></li><li><p>Choose a metric that changes proportionally with capacity. The value of the metric should increase or decrease in inverse proportion to the number of capacity units. That is, the value of the metric should decrease when capacity increases.</p></li></ul><p>For more information about the CloudWatch terminology below, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html">Amazon CloudWatch concepts</a>.</p><note><p>Each individual service provides information about the metrics, namespace, and dimensions they use. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html">Amazon Web Services services that publish CloudWatch metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p></note>
 Required parameters: [MetricName, Namespace, Statistic]
 */
@interface AWSAutoScalingCustomizedMetricSpecification : AWSModel


/**
 <p>The dimensions of the metric.</p><p>Conditional: If you published your metric with dimensions, you must specify the same dimensions in your scaling policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingMetricDimension *> * _Nullable dimensions;

/**
 <p>The name of the metric. To get the exact metric name, namespace, and dimensions, inspect the <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Metric.html">Metric</a> object that is returned by a call to <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html">ListMetrics</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

/**
 <p>The statistic of the metric.</p>
 */
@property (nonatomic, assign) AWSAutoScalingMetricStatistic statistic;

/**
 <p>The unit of the metric. For a complete list of the units that CloudWatch supports, see the <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html">MetricDatum</a> data type in the <i>Amazon CloudWatch API Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

@end

/**
 
 */
@interface AWSAutoScalingDeleteAutoScalingGroupType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>Specifies that the group is to be deleted along with all instances associated with the group, without waiting for all instances to be terminated. This parameter also deletes any outstanding lifecycle actions associated with the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceDelete;

@end

/**
 
 */
@interface AWSAutoScalingDeleteLifecycleHookAnswer : AWSModel


@end

/**
 
 */
@interface AWSAutoScalingDeleteLifecycleHookType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleHookName;

@end

/**
 
 */
@interface AWSAutoScalingDeleteNotificationConfigurationType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicARN;

@end

/**
 
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
 
 */
@interface AWSAutoScalingDeleteTagsType : AWSRequest


/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSAutoScalingDeleteWarmPoolAnswer : AWSModel


@end

/**
 
 */
@interface AWSAutoScalingDeleteWarmPoolType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>Specifies that the warm pool is to be deleted along with all of its associated instances, without waiting for all instances to be terminated. This parameter also deletes any outstanding lifecycle actions associated with the warm pool instances.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceDelete;

@end

/**
 
 */
@interface AWSAutoScalingDescribeAccountLimitsAnswer : AWSModel


/**
 <p>The maximum number of groups allowed for your account. The default is 200 groups per Region.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxNumberOfAutoScalingGroups;

/**
 <p>The maximum number of launch configurations allowed for your account. The default is 200 launch configurations per Region.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxNumberOfLaunchConfigurations;

/**
 <p>The current number of groups for your account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfAutoScalingGroups;

/**
 <p>The current number of launch configurations for your account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfLaunchConfigurations;

@end

/**
 
 */
@interface AWSAutoScalingDescribeAdjustmentTypesAnswer : AWSModel


/**
 <p>The policy adjustment types.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingAdjustmentType *> * _Nullable adjustmentTypes;

@end

/**
 
 */
@interface AWSAutoScalingDescribeAutoScalingInstancesType : AWSRequest


/**
 <p>The IDs of the instances. If you omit this parameter, all Auto Scaling instances are described. If you specify an ID that does not exist, it is ignored with no error.</p><p>Array Members: Maximum number of 50 items.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>50</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer : AWSModel


/**
 <p>The notification types.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoScalingNotificationTypes;

@end

/**
 
 */
@interface AWSAutoScalingDescribeInstanceRefreshesAnswer : AWSModel


/**
 <p>The instance refreshes for the specified group.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingInstanceRefresh *> * _Nullable instanceRefreshes;

/**
 <p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAutoScalingDescribeInstanceRefreshesType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more instance refresh IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceRefreshIds;

/**
 <p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAutoScalingDescribeLifecycleHookTypesAnswer : AWSModel


/**
 <p>The lifecycle hook types.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable lifecycleHookTypes;

@end

/**
 
 */
@interface AWSAutoScalingDescribeLifecycleHooksAnswer : AWSModel


/**
 <p>The lifecycle hooks for the specified group.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingLifecycleHook *> * _Nullable lifecycleHooks;

@end

/**
 
 */
@interface AWSAutoScalingDescribeLifecycleHooksType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The names of one or more lifecycle hooks. If you omit this parameter, all lifecycle hooks are described.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable lifecycleHookNames;

@end

/**
 
 */
@interface AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The maximum number of items to return with this call. The default value is <code>100</code> and the maximum value is <code>100</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse : AWSModel


/**
 <p>Information about the target groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingLoadBalancerTargetGroupState *> * _Nullable loadBalancerTargetGroups;

/**
 <p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAutoScalingDescribeLoadBalancersRequest : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The maximum number of items to return with this call. The default value is <code>100</code> and the maximum value is <code>100</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAutoScalingDescribeLoadBalancersResponse : AWSModel


/**
 <p>The load balancers.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingLoadBalancerState *> * _Nullable loadBalancers;

/**
 <p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
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
 
 */
@interface AWSAutoScalingDescribeNotificationConfigurationsAnswer : AWSModel


/**
 <p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The notification configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingNotificationConfiguration *> * _Nullable notificationConfigurations;

@end

/**
 
 */
@interface AWSAutoScalingDescribeNotificationConfigurationsType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoScalingGroupNames;

/**
 <p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAutoScalingDescribePoliciesType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The maximum number of items to be returned with each call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The names of one or more policies. If you omit this parameter, all policies are described. If a group name is provided, the results are limited to that group. If you specify an unknown policy name, it is ignored with no error.</p><p>Array Members: Maximum number of 50 items.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNames;

/**
 <p>One or more policy types. The valid values are <code>SimpleScaling</code>, <code>StepScaling</code>, <code>TargetTrackingScaling</code>, and <code>PredictiveScaling</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyTypes;

@end

/**
 
 */
@interface AWSAutoScalingDescribeScalingActivitiesType : AWSRequest


/**
 <p>The activity IDs of the desired scaling activities. If you omit this parameter, all activities for the past six weeks are described. If unknown activities are requested, they are ignored with no error. If you specify an Auto Scaling group, the results are limited to that group.</p><p>Array Members: Maximum number of 50 IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable activityIds;

/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>Indicates whether to include scaling activity from deleted Auto Scaling groups.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeDeletedGroups;

/**
 <p>The maximum number of items to return with this call. The default value is <code>100</code> and the maximum value is <code>100</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAutoScalingDescribeScheduledActionsType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The latest scheduled start time to return. If scheduled action names are provided, this parameter is ignored.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The names of one or more scheduled actions. If you omit this parameter, all scheduled actions are described. If you specify an unknown scheduled action, it is ignored with no error.</p><p>Array Members: Maximum number of 50 actions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scheduledActionNames;

/**
 <p>The earliest scheduled start time to return. If scheduled action names are provided, this parameter is ignored.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSAutoScalingDescribeTagsType : AWSRequest


/**
 <p>One or more filters to scope the tags to return. The maximum number of filters per filter type (for example, <code>auto-scaling-group</code>) is 1000.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingFilter *> * _Nullable filters;

/**
 <p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAutoScalingDescribeTerminationPolicyTypesAnswer : AWSModel


/**
 <p>The termination policies supported by Amazon EC2 Auto Scaling: <code>OldestInstance</code>, <code>OldestLaunchConfiguration</code>, <code>NewestInstance</code>, <code>ClosestToNextInstanceHour</code>, <code>Default</code>, <code>OldestLaunchTemplate</code>, and <code>AllocationStrategy</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable terminationPolicyTypes;

@end

/**
 
 */
@interface AWSAutoScalingDescribeWarmPoolAnswer : AWSModel


/**
 <p>The instances that are currently in the warm pool.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingInstance *> * _Nullable instances;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The warm pool configuration details. </p>
 */
@property (nonatomic, strong) AWSAutoScalingWarmPoolConfiguration * _Nullable warmPoolConfiguration;

@end

/**
 
 */
@interface AWSAutoScalingDescribeWarmPoolType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The maximum number of instances to return with this call. The maximum value is <code>50</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of instances to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Describes the desired configuration for an instance refresh. </p><p>If you specify a desired configuration, you must specify either a <code>LaunchTemplate</code> or a <code>MixedInstancesPolicy</code>. </p>
 */
@interface AWSAutoScalingDesiredConfiguration : AWSModel


/**
 <p>Describes the launch template and the version of the launch template that Amazon EC2 Auto Scaling uses to launch Amazon EC2 instances. For more information about launch templates, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchTemplates.html">Launch templates</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSAutoScalingLaunchTemplateSpecification * _Nullable launchTemplate;

/**
 <p>Describes a mixed instances policy. A mixed instances policy contains the instance types that Amazon EC2 Auto Scaling can launch and other information that Amazon EC2 Auto Scaling can use to launch instances and help optimize your costs. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups.html">Auto Scaling groups with multiple instance types and purchase options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSAutoScalingMixedInstancesPolicy * _Nullable mixedInstancesPolicy;

@end

/**
 
 */
@interface AWSAutoScalingDetachInstancesAnswer : AWSModel


/**
 <p>The activities related to detaching the instances from the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingActivity *> * _Nullable activities;

@end

/**
 
 */
@interface AWSAutoScalingDetachInstancesQuery : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The IDs of the instances. You can specify up to 20 instances.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>Indicates whether the Auto Scaling group decrements the desired capacity value by the number of instances detached.</p>
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
 <p>The Amazon Resource Names (ARN) of the target groups. You can specify up to 10 target groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetGroupARNs;

@end

/**
 
 */
@interface AWSAutoScalingDetachLoadBalancersResultType : AWSModel


@end

/**
 
 */
@interface AWSAutoScalingDetachLoadBalancersType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The names of the load balancers. You can specify up to 10 load balancers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable loadBalancerNames;

@end

/**
 
 */
@interface AWSAutoScalingDisableMetricsCollectionQuery : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>Specifies one or more of the following metrics:</p><ul><li><p><code>GroupMinSize</code></p></li><li><p><code>GroupMaxSize</code></p></li><li><p><code>GroupDesiredCapacity</code></p></li><li><p><code>GroupInServiceInstances</code></p></li><li><p><code>GroupPendingInstances</code></p></li><li><p><code>GroupStandbyInstances</code></p></li><li><p><code>GroupTerminatingInstances</code></p></li><li><p><code>GroupTotalInstances</code></p></li><li><p><code>GroupInServiceCapacity</code></p></li><li><p><code>GroupPendingCapacity</code></p></li><li><p><code>GroupStandbyCapacity</code></p></li><li><p><code>GroupTerminatingCapacity</code></p></li><li><p><code>GroupTotalCapacity</code></p></li><li><p><code>WarmPoolDesiredCapacity</code></p></li><li><p><code>WarmPoolWarmedCapacity</code></p></li><li><p><code>WarmPoolPendingCapacity</code></p></li><li><p><code>WarmPoolTerminatingCapacity</code></p></li><li><p><code>WarmPoolTotalCapacity</code></p></li><li><p><code>GroupAndWarmPoolDesiredCapacity</code></p></li><li><p><code>GroupAndWarmPoolTotalCapacity</code></p></li></ul><p>If you omit this parameter, all metrics are disabled. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable metrics;

@end

/**
 <p>Describes information used to set up an Amazon EBS volume specified in a block device mapping.</p>
 */
@interface AWSAutoScalingEbs : AWSModel


/**
 <p>Indicates whether the volume is deleted on instance termination. For Amazon EC2 Auto Scaling, the default value is <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

/**
 <p>Specifies whether the volume should be encrypted. Encrypted EBS volumes can only be attached to instances that support Amazon EBS encryption. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#EBSEncryption_supported_instances">Supported instance types</a>. If your AMI uses encrypted volumes, you can also only launch it on supported instance types.</p><note><p>If you are creating a volume from a snapshot, you cannot create an unencrypted volume from an encrypted snapshot. Also, you cannot specify a KMS key ID when using a launch configuration.</p><p>If you enable encryption by default, the EBS volumes that you create are always encrypted, either using the Amazon Web Services managed KMS key or a customer-managed KMS key, regardless of whether the snapshot was encrypted. </p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-data-protection.html#encryption">Using Amazon Web Services KMS keys to encrypt Amazon EBS volumes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The number of input/output (I/O) operations per second (IOPS) to provision for the volume. For <code>gp3</code> and <code>io1</code> volumes, this represents the number of IOPS that are provisioned for the volume. For <code>gp2</code> volumes, this represents the baseline performance of the volume and the rate at which the volume accumulates I/O credits for bursting. </p><p>The following are the supported values for each volume type: </p><ul><li><p><code>gp3</code>: 3,000-16,000 IOPS</p></li><li><p><code>io1</code>: 100-64,000 IOPS</p></li></ul><p>For <code>io1</code> volumes, we guarantee 64,000 IOPS only for <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#ec2-nitro-instances">Instances built on the Nitro System</a>. Other instance families guarantee performance up to 32,000 IOPS. </p><p><code>Iops</code> is supported when the volume type is <code>gp3</code> or <code>io1</code> and required only when the volume type is <code>io1</code>. (Not used with <code>standard</code>, <code>gp2</code>, <code>st1</code>, or <code>sc1</code> volumes.) </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>The snapshot ID of the volume to use.</p><p>You must specify either a <code>VolumeSize</code> or a <code>SnapshotId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>The throughput (MiBps) to provision for a <code>gp3</code> volume.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable throughput;

/**
 <p>The volume size, in GiBs. The following are the supported volumes sizes for each volume type: </p><ul><li><p><code>gp2</code> and <code>gp3</code>: 1-16,384</p></li><li><p><code>io1</code>: 4-16,384</p></li><li><p><code>st1</code> and <code>sc1</code>: 125-16,384</p></li><li><p><code>standard</code>: 1-1,024</p></li></ul><p>You must specify either a <code>SnapshotId</code> or a <code>VolumeSize</code>. If you specify both <code>SnapshotId</code> and <code>VolumeSize</code>, the volume size must be equal or greater than the size of the snapshot.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSize;

/**
 <p>The volume type. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html">Amazon EBS volume types</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><p>Valid Values: <code>standard</code> | <code>io1</code> | <code>gp2</code> | <code>st1</code> | <code>sc1</code> | <code>gp3</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeType;

@end

/**
 
 */
@interface AWSAutoScalingEnableMetricsCollectionQuery : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The granularity to associate with the metrics to collect. The only valid value is <code>1Minute</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable granularity;

/**
 <p>Specifies which group-level metrics to start collecting. You can specify one or more of the following metrics:</p><ul><li><p><code>GroupMinSize</code></p></li><li><p><code>GroupMaxSize</code></p></li><li><p><code>GroupDesiredCapacity</code></p></li><li><p><code>GroupInServiceInstances</code></p></li><li><p><code>GroupPendingInstances</code></p></li><li><p><code>GroupStandbyInstances</code></p></li><li><p><code>GroupTerminatingInstances</code></p></li><li><p><code>GroupTotalInstances</code></p></li></ul><p>The instance weighting feature supports the following additional metrics: </p><ul><li><p><code>GroupInServiceCapacity</code></p></li><li><p><code>GroupPendingCapacity</code></p></li><li><p><code>GroupStandbyCapacity</code></p></li><li><p><code>GroupTerminatingCapacity</code></p></li><li><p><code>GroupTotalCapacity</code></p></li></ul><p>The warm pools feature supports the following additional metrics: </p><ul><li><p><code>WarmPoolDesiredCapacity</code></p></li><li><p><code>WarmPoolWarmedCapacity</code></p></li><li><p><code>WarmPoolPendingCapacity</code></p></li><li><p><code>WarmPoolTerminatingCapacity</code></p></li><li><p><code>WarmPoolTotalCapacity</code></p></li><li><p><code>GroupAndWarmPoolDesiredCapacity</code></p></li><li><p><code>GroupAndWarmPoolTotalCapacity</code></p></li></ul><p>If you omit this parameter, all metrics are enabled. </p>
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
 <p>One of the following metrics:</p><ul><li><p><code>GroupMinSize</code></p></li><li><p><code>GroupMaxSize</code></p></li><li><p><code>GroupDesiredCapacity</code></p></li><li><p><code>GroupInServiceInstances</code></p></li><li><p><code>GroupPendingInstances</code></p></li><li><p><code>GroupStandbyInstances</code></p></li><li><p><code>GroupTerminatingInstances</code></p></li><li><p><code>GroupTotalInstances</code></p></li><li><p><code>GroupInServiceCapacity</code></p></li><li><p><code>GroupPendingCapacity</code></p></li><li><p><code>GroupStandbyCapacity</code></p></li><li><p><code>GroupTerminatingCapacity</code></p></li><li><p><code>GroupTotalCapacity</code></p></li><li><p><code>WarmPoolDesiredCapacity</code></p></li><li><p><code>WarmPoolWarmedCapacity</code></p></li><li><p><code>WarmPoolPendingCapacity</code></p></li><li><p><code>WarmPoolTerminatingCapacity</code></p></li><li><p><code>WarmPoolTotalCapacity</code></p></li><li><p><code>GroupAndWarmPoolDesiredCapacity</code></p></li><li><p><code>GroupAndWarmPoolTotalCapacity</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable metric;

@end

/**
 
 */
@interface AWSAutoScalingEnterStandbyAnswer : AWSModel


/**
 <p>The activities related to moving instances into <code>Standby</code> mode.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingActivity *> * _Nullable activities;

@end

/**
 
 */
@interface AWSAutoScalingEnterStandbyQuery : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The IDs of the instances. You can specify up to 20 instances.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>Indicates whether to decrement the desired capacity of the Auto Scaling group by the number of instances moved to <code>Standby</code> mode.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable shouldDecrementDesiredCapacity;

@end

/**
 
 */
@interface AWSAutoScalingExecutePolicyType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The breach threshold for the alarm.</p><p>Required if the policy type is <code>StepScaling</code> and not supported otherwise.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable breachThreshold;

/**
 <p>Indicates whether Amazon EC2 Auto Scaling waits for the cooldown period to complete before executing the policy.</p><p>Valid only if the policy type is <code>SimpleScaling</code>. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html">Scaling cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable honorCooldown;

/**
 <p>The metric value to compare to <code>BreachThreshold</code>. This enables you to execute a policy of type <code>StepScaling</code> and determine which step adjustment to use. For example, if the breach threshold is 50 and you want to use a step adjustment with a lower bound of 0 and an upper bound of 10, you can set the metric value to 59.</p><p>If you specify a metric value that doesn't correspond to a step adjustment for the policy, the call returns an error.</p><p>Required if the policy type is <code>StepScaling</code> and not supported otherwise.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable metricValue;

/**
 <p>The name or ARN of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSAutoScalingExitStandbyAnswer : AWSModel


/**
 <p>The activities related to moving instances out of <code>Standby</code> mode.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingActivity *> * _Nullable activities;

@end

/**
 
 */
@interface AWSAutoScalingExitStandbyQuery : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The IDs of the instances. You can specify up to 20 instances.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

@end

/**
 <p>Describes a scheduled action that could not be created, updated, or deleted.</p>
 Required parameters: [ScheduledActionName]
 */
@interface AWSAutoScalingFailedScheduledUpdateGroupActionRequest : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The error message accompanying the error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The name of the scheduled action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

@end

/**
 <p>Describes a filter that is used to return a more specific list of results from a describe operation.</p><p>If you specify multiple filters, the filters are automatically logically joined with an <code>AND</code>, and the request returns only the results that match all of the specified filters. </p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html">Tagging Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@interface AWSAutoScalingFilter : AWSModel


/**
 <p>The name of the filter.</p><p>The valid values for <code>Name</code> depend on which API operation you're using with the filter (<a>DescribeAutoScalingGroups</a> or <a>DescribeTags</a>).</p><p><b>DescribeAutoScalingGroups</b></p><p>Valid values for <code>Name</code> include the following: </p><ul><li><p><code>tag-key</code> - Accepts tag keys. The results only include information about the Auto Scaling groups associated with these tag keys. </p></li><li><p><code>tag-value</code> - Accepts tag values. The results only include information about the Auto Scaling groups associated with these tag values. </p></li><li><p><code>tag:&lt;key&gt;</code> - Accepts the key/value combination of the tag. Use the tag key in the filter name and the tag value as the filter value. The results only include information about the Auto Scaling groups associated with the specified key/value combination. </p></li></ul><p><b>DescribeTags</b></p><p>Valid values for <code>Name</code> include the following: </p><ul><li><p><code>auto-scaling-group</code> - Accepts the names of Auto Scaling groups. The results only include information about the tags associated with these Auto Scaling groups. </p></li><li><p><code>key</code> - Accepts tag keys. The results only include information about the tags associated with these tag keys. </p></li><li><p><code>value</code> - Accepts tag values. The results only include information about the tags associated with these tag values. </p></li><li><p><code>propagate-at-launch</code> - Accepts a Boolean value, which specifies whether tags propagate to instances at launch. The results only include information about the tags associated with the specified Boolean value. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>One or more filter values. Filter values are case-sensitive. </p><p>If you specify multiple values for a filter, the values are automatically logically joined with an <code>OR</code>, and the request returns all results that match any of the specified values. For example, specify "tag:environment" for the filter name and "production,development" for the filter values to find Auto Scaling groups with the tag "environment=production" or "environment=development".</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 
 */
@interface AWSAutoScalingGetPredictiveScalingForecastAnswer : AWSModel


/**
 <p>The capacity forecast.</p>
 */
@property (nonatomic, strong) AWSAutoScalingCapacityForecast * _Nullable capacityForecast;

/**
 <p>The load forecast.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingLoadForecast *> * _Nullable loadForecast;

/**
 <p>The time the forecast was made.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSAutoScalingGetPredictiveScalingForecastType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The exclusive end time of the time range for the forecast data to get. The maximum time duration between the start and end time is 30 days. </p><p>Although this parameter can accept a date and time that is more than two days in the future, the availability of forecast data has limits. Amazon EC2 Auto Scaling only issues forecasts for periods of two days in advance.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The inclusive start time of the time range for the forecast data to get. At most, the date and time can be one year before the current date and time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p>Describes an EC2 instance.</p>
 Required parameters: [InstanceId, AvailabilityZone, LifecycleState, HealthStatus, ProtectedFromScaleIn]
 */
@interface AWSAutoScalingInstance : AWSModel


/**
 <p>The Availability Zone in which the instance is running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The last reported health status of the instance. "Healthy" means that the instance is healthy and should remain in service. "Unhealthy" means that the instance is unhealthy and that Amazon EC2 Auto Scaling should terminate and replace it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthStatus;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The instance type of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The launch configuration associated with the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

/**
 <p>The launch template for the instance.</p>
 */
@property (nonatomic, strong) AWSAutoScalingLaunchTemplateSpecification * _Nullable launchTemplate;

/**
 <p>A description of the current lifecycle state. The <code>Quarantined</code> state is not used. For information about lifecycle states, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroupLifecycle.html">Instance lifecycle</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>
 */
@property (nonatomic, assign) AWSAutoScalingLifecycleState lifecycleState;

/**
 <p>Indicates whether the instance is protected from termination by Amazon EC2 Auto Scaling when scaling in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable protectedFromScaleIn;

/**
 <p>The number of capacity units contributed by the instance based on its instance type.</p><p>Valid Range: Minimum value of 1. Maximum value of 999.</p>
 */
@property (nonatomic, strong) NSString * _Nullable weightedCapacity;

@end

/**
 <p>The metadata options for the instances. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-config.html#launch-configurations-imds">Configuring the Instance Metadata Options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@interface AWSAutoScalingInstanceMetadataOptions : AWSModel


/**
 <p>This parameter enables or disables the HTTP metadata endpoint on your instances. If the parameter is not specified, the default state is <code>enabled</code>.</p><note><p>If you specify a value of <code>disabled</code>, you will not be able to access your instance metadata. </p></note>
 */
@property (nonatomic, assign) AWSAutoScalingInstanceMetadataEndpointState httpEndpoint;

/**
 <p>The desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the further instance metadata requests can travel.</p><p>Default: 1</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable httpPutResponseHopLimit;

/**
 <p>The state of token usage for your instance metadata requests. If the parameter is not specified in the request, the default state is <code>optional</code>.</p><p>If the state is <code>optional</code>, you can choose to retrieve instance metadata with or without a signed token header on your request. If you retrieve the IAM role credentials without a token, the version 1.0 role credentials are returned. If you retrieve the IAM role credentials using a valid signed token, the version 2.0 role credentials are returned.</p><p>If the state is <code>required</code>, you must send a signed token header with any instance metadata retrieval requests. In this state, retrieving the IAM role credentials always returns the version 2.0 credentials; the version 1.0 credentials are not available.</p>
 */
@property (nonatomic, assign) AWSAutoScalingInstanceMetadataHttpTokensState httpTokens;

@end

/**
 <p>Describes whether detailed monitoring is enabled for the Auto Scaling instances.</p>
 */
@interface AWSAutoScalingInstanceMonitoring : AWSModel


/**
 <p>If <code>true</code>, detailed monitoring is enabled. Otherwise, basic monitoring is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Describes an instance refresh for an Auto Scaling group. </p>
 */
@interface AWSAutoScalingInstanceRefresh : AWSModel


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>Describes the specific update you want to deploy.</p>
 */
@property (nonatomic, strong) AWSAutoScalingDesiredConfiguration * _Nullable desiredConfiguration;

/**
 <p>The date and time at which the instance refresh ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The instance refresh ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceRefreshId;

/**
 <p>The number of instances remaining to update before the instance refresh is complete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancesToUpdate;

/**
 <p>The percentage of the instance refresh that is complete. For each instance replacement, Amazon EC2 Auto Scaling tracks the instance's health status and warm-up time. When the instance's health status changes to healthy and the specified warm-up time passes, the instance is considered updated and is added to the percentage complete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentageComplete;

/**
 <p>Describes the preferences for an instance refresh.</p>
 */
@property (nonatomic, strong) AWSAutoScalingRefreshPreferences * _Nullable preferences;

/**
 <p>Additional progress details for an Auto Scaling group that has a warm pool.</p>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceRefreshProgressDetails * _Nullable progressDetails;

/**
 <p>The date and time at which the instance refresh began.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The current status for the instance refresh operation:</p><ul><li><p><code>Pending</code> - The request was created, but the operation has not started.</p></li><li><p><code>InProgress</code> - The operation is in progress.</p></li><li><p><code>Successful</code> - The operation completed successfully.</p></li><li><p><code>Failed</code> - The operation failed to complete. You can troubleshoot using the status reason and the scaling activities. </p></li><li><p><code>Cancelling</code> - An ongoing operation is being cancelled. Cancellation does not roll back any replacements that have already been completed, but it prevents new replacements from being started. </p></li><li><p><code>Cancelled</code> - The operation is cancelled. </p></li></ul>
 */
@property (nonatomic, assign) AWSAutoScalingInstanceRefreshStatus status;

/**
 <p>Provides more details about the current status of the instance refresh. </p>
 */
@property (nonatomic, strong) NSString * _Nullable statusReason;

@end

/**
 <p>Reports the progress of an instance refresh on instances that are in the Auto Scaling group.</p>
 */
@interface AWSAutoScalingInstanceRefreshLivePoolProgress : AWSModel


/**
 <p>The number of instances remaining to update.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancesToUpdate;

/**
 <p>The percentage of instances in the Auto Scaling group that have been replaced. For each instance replacement, Amazon EC2 Auto Scaling tracks the instance's health status and warm-up time. When the instance's health status changes to healthy and the specified warm-up time passes, the instance is considered updated and is added to the percentage complete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentageComplete;

@end

/**
 <p>Reports the progress of an instance refresh on an Auto Scaling group that has a warm pool. This includes separate details for instances in the warm pool and instances in the Auto Scaling group (the live pool).</p>
 */
@interface AWSAutoScalingInstanceRefreshProgressDetails : AWSModel


/**
 <p>Indicates the progress of an instance refresh on instances that are in the Auto Scaling group.</p>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceRefreshLivePoolProgress * _Nullable livePoolProgress;

/**
 <p>Indicates the progress of an instance refresh on instances that are in the warm pool.</p>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceRefreshWarmPoolProgress * _Nullable warmPoolProgress;

@end

/**
 <p>Reports the progress of an instance refresh on instances that are in the warm pool.</p>
 */
@interface AWSAutoScalingInstanceRefreshWarmPoolProgress : AWSModel


/**
 <p>The number of instances remaining to update.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancesToUpdate;

/**
 <p>The percentage of instances in the warm pool that have been replaced. For each instance replacement, Amazon EC2 Auto Scaling tracks the instance's health status and warm-up time. When the instance's health status changes to healthy and the specified warm-up time passes, the instance is considered updated and is added to the percentage complete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percentageComplete;

@end

/**
 <p>When you specify multiple parameters, you get instance types that satisfy all of the specified parameters. If you specify multiple values for a parameter, you get instance types that satisfy any of the specified values.</p><p>Represents requirements for the types of instances that can be launched. You must specify <code>VCpuCount</code> and <code>MemoryMiB</code>, but all other parameters are optional. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-instance-type-requirements.html">Creating an Auto Scaling group using attribute-based instance type selection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 Required parameters: [VCpuCount, MemoryMiB]
 */
@interface AWSAutoScalingInstanceRequirements : AWSModel


/**
 <p>The minimum and maximum number of accelerators (GPUs, FPGAs, or Amazon Web Services Inferentia chips) for an instance type.</p><p>To exclude accelerator-enabled instance types, set <code>Max</code> to <code>0</code>.</p><p>Default: No minimum or maximum</p>
 */
@property (nonatomic, strong) AWSAutoScalingAcceleratorCountRequest * _Nullable acceleratorCount;

/**
 <p>Indicates whether instance types must have accelerators by specific manufacturers.</p><ul><li><p>For instance types with NVIDIA devices, specify <code>nvidia</code>.</p></li><li><p>For instance types with AMD devices, specify <code>amd</code>.</p></li><li><p>For instance types with Amazon Web Services devices, specify <code>amazon-web-services</code>.</p></li><li><p>For instance types with Xilinx devices, specify <code>xilinx</code>.</p></li></ul><p>Default: Any manufacturer</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable acceleratorManufacturers;

/**
 <p>Lists the accelerators that must be on an instance type.</p><ul><li><p>For instance types with NVIDIA A100 GPUs, specify <code>a100</code>.</p></li><li><p>For instance types with NVIDIA V100 GPUs, specify <code>v100</code>.</p></li><li><p>For instance types with NVIDIA K80 GPUs, specify <code>k80</code>.</p></li><li><p>For instance types with NVIDIA T4 GPUs, specify <code>t4</code>.</p></li><li><p>For instance types with NVIDIA M60 GPUs, specify <code>m60</code>.</p></li><li><p>For instance types with AMD Radeon Pro V520 GPUs, specify <code>radeon-pro-v520</code>.</p></li><li><p>For instance types with Xilinx VU9P FPGAs, specify <code>vu9p</code>.</p></li></ul><p>Default: Any accelerator</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable acceleratorNames;

/**
 <p>The minimum and maximum total memory size for the accelerators on an instance type, in MiB.</p><p>Default: No minimum or maximum</p>
 */
@property (nonatomic, strong) AWSAutoScalingAcceleratorTotalMemoryMiBRequest * _Nullable acceleratorTotalMemoryMiB;

/**
 <p>Lists the accelerator types that must be on an instance type.</p><ul><li><p>For instance types with GPU accelerators, specify <code>gpu</code>.</p></li><li><p>For instance types with FPGA accelerators, specify <code>fpga</code>.</p></li><li><p>For instance types with inference accelerators, specify <code>inference</code>.</p></li></ul><p>Default: Any accelerator type</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable acceleratorTypes;

/**
 <p>Indicates whether bare metal instance types are included, excluded, or required.</p><p>Default: <code>excluded</code></p>
 */
@property (nonatomic, assign) AWSAutoScalingBareMetal bareMetal;

/**
 <p>The minimum and maximum baseline bandwidth performance for an instance type, in Mbps. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-optimized.html">Amazon EBS–optimized instances</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><p>Default: No minimum or maximum</p>
 */
@property (nonatomic, strong) AWSAutoScalingBaselineEbsBandwidthMbpsRequest * _Nullable baselineEbsBandwidthMbps;

/**
 <p>Indicates whether burstable performance instance types are included, excluded, or required. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html">Burstable performance instances</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><p>Default: <code>excluded</code></p>
 */
@property (nonatomic, assign) AWSAutoScalingBurstablePerformance burstablePerformance;

/**
 <p>Lists which specific CPU manufacturers to include.</p><ul><li><p>For instance types with Intel CPUs, specify <code>intel</code>.</p></li><li><p>For instance types with AMD CPUs, specify <code>amd</code>.</p></li><li><p>For instance types with Amazon Web Services CPUs, specify <code>amazon-web-services</code>.</p></li></ul><note><p>Don't confuse the CPU hardware manufacturer with the CPU hardware architecture. Instances will be launched with a compatible CPU architecture based on the Amazon Machine Image (AMI) that you specify in your launch template. </p></note><p>Default: Any manufacturer</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cpuManufacturers;

/**
 <p>Lists which instance types to exclude. You can use strings with one or more wild cards, represented by an asterisk (<code>*</code>). The following are examples: <code>c5*</code>, <code>m5a.*</code>, <code>r*</code>, <code>*3*</code>. </p><p>For example, if you specify <code>c5*</code>, you are excluding the entire C5 instance family, which includes all C5a and C5n instance types. If you specify <code>m5a.*</code>, you are excluding all the M5a instance types, but not the M5n instance types.</p><p>Default: No excluded instance types</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable excludedInstanceTypes;

/**
 <p>Indicates whether current or previous generation instance types are included.</p><ul><li><p>For current generation instance types, specify <code>current</code>. The current generation includes EC2 instance types currently recommended for use. This typically includes the latest two to three generations in each instance family. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance types</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p></li><li><p>For previous generation instance types, specify <code>previous</code>.</p></li></ul><p>Default: Any current or previous generation</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceGenerations;

/**
 <p>Indicates whether instance types with instance store volumes are included, excluded, or required. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html">Amazon EC2 instance store</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><p>Default: <code>included</code></p>
 */
@property (nonatomic, assign) AWSAutoScalingLocalStorage localStorage;

/**
 <p>Indicates the type of local storage that is required.</p><ul><li><p>For instance types with hard disk drive (HDD) storage, specify <code>hdd</code>.</p></li><li><p>For instance types with solid state drive (SSD) storage, specify <code>sdd</code>.</p></li></ul><p>Default: Any local storage type</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable localStorageTypes;

/**
 <p>The minimum and maximum amount of memory per vCPU for an instance type, in GiB.</p><p>Default: No minimum or maximum</p>
 */
@property (nonatomic, strong) AWSAutoScalingMemoryGiBPerVCpuRequest * _Nullable memoryGiBPerVCpu;

/**
 <p>The minimum and maximum instance memory size for an instance type, in MiB.</p>
 */
@property (nonatomic, strong) AWSAutoScalingMemoryMiBRequest * _Nullable memoryMiB;

/**
 <p>The minimum and maximum number of network interfaces for an instance type.</p><p>Default: No minimum or maximum</p>
 */
@property (nonatomic, strong) AWSAutoScalingNetworkInterfaceCountRequest * _Nullable networkInterfaceCount;

/**
 <p>The price protection threshold for On-Demand Instances. This is the maximum you’ll pay for an On-Demand Instance, expressed as a percentage higher than the cheapest M, C, or R instance type with your specified attributes. When Amazon EC2 Auto Scaling selects instance types with your attributes, we will exclude instance types whose price is higher than your threshold. The parameter accepts an integer, which Amazon EC2 Auto Scaling interprets as a percentage. To turn off price protection, specify a high value, such as <code>999999</code>. </p><p>If you set <code>DesiredCapacityType</code> to <code>vcpu</code> or <code>memory-mib</code>, the price protection threshold is applied based on the per vCPU or per memory price instead of the per instance price. </p><p>Default: <code>20</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable onDemandMaxPricePercentageOverLowestPrice;

/**
 <p>Indicates whether instance types must provide On-Demand Instance hibernation support.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireHibernateSupport;

/**
 <p>The price protection threshold for Spot Instances. This is the maximum you’ll pay for a Spot Instance, expressed as a percentage higher than the cheapest M, C, or R instance type with your specified attributes. When Amazon EC2 Auto Scaling selects instance types with your attributes, we will exclude instance types whose price is higher than your threshold. The parameter accepts an integer, which Amazon EC2 Auto Scaling interprets as a percentage. To turn off price protection, specify a high value, such as <code>999999</code>. </p><p>If you set <code>DesiredCapacityType</code> to <code>vcpu</code> or <code>memory-mib</code>, the price protection threshold is applied based on the per vCPU or per memory price instead of the per instance price. </p><p>Default: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable spotMaxPricePercentageOverLowestPrice;

/**
 <p>The minimum and maximum total local storage size for an instance type, in GB.</p><p>Default: No minimum or maximum</p>
 */
@property (nonatomic, strong) AWSAutoScalingTotalLocalStorageGBRequest * _Nullable totalLocalStorageGB;

/**
 <p>The minimum and maximum number of vCPUs for an instance type.</p>
 */
@property (nonatomic, strong) AWSAutoScalingVCpuCountRequest * _Nullable VCpuCount;

@end

/**
 <p>Describes an instance reuse policy for a warm pool. </p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html">Warm pools for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@interface AWSAutoScalingInstanceReusePolicy : AWSModel


/**
 <p>Specifies whether instances in the Auto Scaling group can be returned to the warm pool on scale in. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable reuseOnScaleIn;

@end

/**
 <p>Describes an instances distribution for an Auto Scaling group.</p>
 */
@interface AWSAutoScalingInstancesDistribution : AWSModel


/**
 <p>The order of the launch template overrides to use in fulfilling On-Demand capacity. </p><p>If you specify <code>lowest-price</code>, Amazon EC2 Auto Scaling uses price to determine the order, launching the lowest price first. </p><p>If you specify <code>prioritized</code>, Amazon EC2 Auto Scaling uses the priority that you assigned to each launch template override, launching the highest priority first. If all your On-Demand capacity cannot be fulfilled using your highest priority instance, then Amazon EC2 Auto Scaling launches the remaining capacity using the second priority instance type, and so on.</p><p>Default: <code>lowest-price</code> for Auto Scaling groups that specify <a>InstanceRequirements</a> in the overrides and <code>prioritized</code> for Auto Scaling groups that don't.</p>
 */
@property (nonatomic, strong) NSString * _Nullable onDemandAllocationStrategy;

/**
 <p>The minimum amount of the Auto Scaling group's capacity that must be fulfilled by On-Demand Instances. This base portion is launched first as your group scales.</p><p>If you specify weights for the instance types in the overrides, the base capacity is measured in the same unit of measurement as the instance types. If you specify <a>InstanceRequirements</a> in the overrides, the base capacity is measured in the same unit of measurement as your group's desired capacity.</p><p>Default: <code>0</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable onDemandBaseCapacity;

/**
 <p>Controls the percentages of On-Demand Instances and Spot Instances for your additional capacity beyond <code>OnDemandBaseCapacity</code>. Expressed as a number (for example, 20 specifies 20% On-Demand Instances, 80% Spot Instances). If set to 100, only On-Demand Instances are used.</p><p>Default: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable onDemandPercentageAboveBaseCapacity;

/**
 <p>Indicates how to allocate instances across Spot Instance pools. </p><p>If the allocation strategy is <code>lowest-price</code>, the Auto Scaling group launches instances using the Spot pools with the lowest price, and evenly allocates your instances across the number of Spot pools that you specify. </p><p>If the allocation strategy is <code>capacity-optimized</code> (recommended), the Auto Scaling group launches instances using Spot pools that are optimally chosen based on the available Spot capacity. Alternatively, you can use <code>capacity-optimized-prioritized</code> and set the order of instance types in the list of launch template overrides from highest to lowest priority (from first to last in the list). Amazon EC2 Auto Scaling honors the instance type priorities on a best-effort basis but optimizes for capacity first. </p><p>Default: <code>lowest-price</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable spotAllocationStrategy;

/**
 <p>The number of Spot Instance pools across which to allocate your Spot Instances. The Spot pools are determined from the different instance types in the overrides. Valid only when the Spot allocation strategy is <code>lowest-price</code>. Value must be in the range of 1–20.</p><p>Default: <code>2</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable spotInstancePools;

/**
 <p>The maximum price per unit hour that you are willing to pay for a Spot Instance. If you keep the value at its default (unspecified), Amazon EC2 Auto Scaling uses the On-Demand price as the maximum Spot price. To remove a value that you previously set, include the property but specify an empty string ("") for the value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotMaxPrice;

@end

/**
 <p>Describes a launch configuration.</p>
 Required parameters: [LaunchConfigurationName, ImageId, InstanceType, CreatedTime]
 */
@interface AWSAutoScalingLaunchConfiguration : AWSModel


/**
 <p>For Auto Scaling groups that are running in a VPC, specifies whether to assign a public IP address to the group's instances. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html">Launching Auto Scaling instances in a VPC</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable associatePublicIpAddress;

/**
 <p>A block device mapping, which specifies the block devices for the instance. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html">Block Device Mapping</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingBlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p><i>EC2-Classic retires on August 15, 2022. This parameter is not supported after that date.</i></p><p>The ID of a ClassicLink-enabled VPC to link your EC2-Classic instances to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable classicLinkVPCId;

/**
 <p><i>EC2-Classic retires on August 15, 2022. This parameter is not supported after that date.</i></p><p>The IDs of one or more security groups for the VPC specified in <code>ClassicLinkVPCId</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable classicLinkVPCSecurityGroups;

/**
 <p>The creation date and time for the launch configuration.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>Specifies whether the launch configuration is optimized for EBS I/O (<code>true</code>) or not (<code>false</code>). For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html">Amazon EBS-Optimized Instances</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsOptimized;

/**
 <p>The name or the Amazon Resource Name (ARN) of the instance profile associated with the IAM role for the instance. The instance profile contains the IAM role. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/us-iam-role.html">IAM role for applications that run on Amazon EC2 instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamInstanceProfile;

/**
 <p>The ID of the Amazon Machine Image (AMI) to use to launch your EC2 instances. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html">Finding an AMI</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>Controls whether instances in this group are launched with detailed (<code>true</code>) or basic (<code>false</code>) monitoring.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/latest/userguide/enable-as-instance-metrics.html">Configure Monitoring for Auto Scaling Instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceMonitoring * _Nullable instanceMonitoring;

/**
 <p>The instance type for the instances.</p><p>For information about available instance types, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes">Available Instance Types</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The ID of the kernel associated with the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kernelId;

/**
 <p>The name of the key pair.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html">Amazon EC2 Key Pairs</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>
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
 <p>The metadata options for the instances. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-config.html#launch-configurations-imds">Configuring the Instance Metadata Options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceMetadataOptions * _Nullable metadataOptions;

/**
 <p>The tenancy of the instance, either <code>default</code> or <code>dedicated</code>. An instance with <code>dedicated</code> tenancy runs on isolated, single-tenant hardware and can only be launched into a VPC.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-dedicated-instances.html">Configuring instance tenancy with Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable placementTenancy;

/**
 <p>The ID of the RAM disk associated with the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ramdiskId;

/**
 <p>A list that contains the security groups to assign to the instances in the Auto Scaling group. For more information, see <a href="https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The maximum hourly price to be paid for any Spot Instance launched to fulfill the request. Spot Instances are launched when the price you specify exceeds the current Spot price. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-launch-spot-instances.html">Requesting Spot Instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotPrice;

/**
 <p>The user data to make available to the launched EC2 instances. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html">Instance metadata and user data</a> (Linux) and <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-metadata.html">Instance metadata and user data</a> (Windows). If you are using a command line tool, base64-encoding is performed for you, and you can load the text from a file. Otherwise, you must provide base64-encoded text. User data is limited to 16 KB.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userData;

@end

/**
 
 */
@interface AWSAutoScalingLaunchConfigurationNameType : AWSRequest


/**
 <p>The name of the launch configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

@end

/**
 
 */
@interface AWSAutoScalingLaunchConfigurationNamesType : AWSRequest


/**
 <p>The launch configuration names. If you omit this parameter, all launch configurations are described.</p><p>Array Members: Maximum number of 50 items.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable launchConfigurationNames;

/**
 <p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxRecords;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAutoScalingLaunchConfigurationsType : AWSModel


/**
 <p>The launch configurations.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingLaunchConfiguration *> * _Nullable launchConfigurations;

/**
 <p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Describes a launch template and overrides. You specify these properties as part of a mixed instances policy. </p>
 */
@interface AWSAutoScalingLaunchTemplate : AWSModel


/**
 <p>The launch template to use.</p>
 */
@property (nonatomic, strong) AWSAutoScalingLaunchTemplateSpecification * _Nullable launchTemplateSpecification;

/**
 <p>Any properties that you specify override the same properties in the launch template. If not provided, Amazon EC2 Auto Scaling uses the instance type or instance type requirements specified in the launch template when it launches an instance.</p><p>The overrides can include either one or more instance types or a set of instance requirements, but not both.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingLaunchTemplateOverrides *> * _Nullable overrides;

@end

/**
 <p>Describes an override for a launch template. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-configuring-overrides.html">Configuring overrides</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>
 */
@interface AWSAutoScalingLaunchTemplateOverrides : AWSModel


/**
 <p>The instance requirements. When you specify instance requirements, Amazon EC2 Auto Scaling finds instance types that satisfy your requirements, and then uses your On-Demand and Spot allocation strategies to launch instances from these instance types, in the same way as when you specify a list of specific instance types. </p>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceRequirements * _Nullable instanceRequirements;

/**
 <p>The instance type, such as <code>m3.xlarge</code>. You must use an instance type that is supported in your requested Region and Availability Zones. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>Provides a launch template for the specified instance type or instance requirements. For example, some instance types might require a launch template with a different AMI. If not provided, Amazon EC2 Auto Scaling uses the launch template that's defined for your mixed instances policy. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups-launch-template-overrides.html">Specifying a different launch template for an instance type</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>
 */
@property (nonatomic, strong) AWSAutoScalingLaunchTemplateSpecification * _Nullable launchTemplateSpecification;

/**
 <p>The number of capacity units provided by the instance type specified in <code>InstanceType</code> in terms of virtual CPUs, memory, storage, throughput, or other relative performance characteristic. When a Spot or On-Demand Instance is launched, the capacity units count toward the desired capacity. Amazon EC2 Auto Scaling launches instances until the desired capacity is totally fulfilled, even if this results in an overage. For example, if there are two units remaining to fulfill capacity, and Amazon EC2 Auto Scaling can only launch an instance with a <code>WeightedCapacity</code> of five units, the instance is launched, and the desired capacity is exceeded by three units. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups-instance-weighting.html">Configuring instance weighting for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. Value must be in the range of 1–999.</p>
 */
@property (nonatomic, strong) NSString * _Nullable weightedCapacity;

@end

/**
 <p>Describes the launch template and the version of the launch template that Amazon EC2 Auto Scaling uses to launch Amazon EC2 instances. For more information about launch templates, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchTemplates.html">Launch templates</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@interface AWSAutoScalingLaunchTemplateSpecification : AWSModel


/**
 <p>The ID of the launch template. To get the template ID, use the Amazon EC2 <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeLaunchTemplates.html">DescribeLaunchTemplates</a> API operation. New launch templates can be created using the Amazon EC2 <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateLaunchTemplate.html">CreateLaunchTemplate</a> API. </p><p>Conditional: You must specify either a <code>LaunchTemplateId</code> or a <code>LaunchTemplateName</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchTemplateId;

/**
 <p>The name of the launch template. To get the template name, use the Amazon EC2 <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeLaunchTemplates.html">DescribeLaunchTemplates</a> API operation. New launch templates can be created using the Amazon EC2 <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateLaunchTemplate.html">CreateLaunchTemplate</a> API. </p><p>Conditional: You must specify either a <code>LaunchTemplateId</code> or a <code>LaunchTemplateName</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchTemplateName;

/**
 <p>The version number, <code>$Latest</code>, or <code>$Default</code>. To get the version number, use the Amazon EC2 <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeLaunchTemplateVersions.html">DescribeLaunchTemplateVersions</a> API operation. New launch template versions can be created using the Amazon EC2 <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateLaunchTemplateVersion.html">CreateLaunchTemplateVersion</a> API. If the value is <code>$Latest</code>, Amazon EC2 Auto Scaling selects the latest version of the launch template when launching instances. If the value is <code>$Default</code>, Amazon EC2 Auto Scaling selects the default version of the launch template when launching instances. The default value is <code>$Default</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Describes a lifecycle hook. A lifecycle hook lets you create solutions that are aware of events in the Auto Scaling instance lifecycle, and then perform a custom action on instances when the corresponding lifecycle event occurs.</p>
 */
@interface AWSAutoScalingLifecycleHook : AWSModel


/**
 <p>The name of the Auto Scaling group for the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The possible values are <code>CONTINUE</code> and <code>ABANDON</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultResult;

/**
 <p>The maximum time, in seconds, that an instance can remain in a wait state. The maximum is 172800 seconds (48 hours) or 100 times <code>HeartbeatTimeout</code>, whichever is smaller.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable globalTimeout;

/**
 <p>The maximum time, in seconds, that can elapse before the lifecycle hook times out. If the lifecycle hook times out, Amazon EC2 Auto Scaling performs the action that you specified in the <code>DefaultResult</code> parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable heartbeatTimeout;

/**
 <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleHookName;

/**
 <p>The state of the EC2 instance to which to attach the lifecycle hook. The following are possible values:</p><ul><li><p>autoscaling:EC2_INSTANCE_LAUNCHING</p></li><li><p>autoscaling:EC2_INSTANCE_TERMINATING</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleTransition;

/**
 <p>Additional information that is included any time Amazon EC2 Auto Scaling sends a message to the notification target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationMetadata;

/**
 <p>The ARN of the target that Amazon EC2 Auto Scaling sends notifications to when an instance is in the transition state for the lifecycle hook. The notification target can be either an SQS queue or an SNS topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationTargetARN;

/**
 <p>The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target (an Amazon SNS topic or an Amazon SQS queue).</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

@end

/**
 <p>Describes information used to specify a lifecycle hook for an Auto Scaling group.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 Required parameters: [LifecycleHookName, LifecycleTransition]
 */
@interface AWSAutoScalingLifecycleHookSpecification : AWSModel


/**
 <p>Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The valid values are <code>CONTINUE</code> and <code>ABANDON</code>. The default value is <code>ABANDON</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultResult;

/**
 <p>The maximum time, in seconds, that can elapse before the lifecycle hook times out.</p><p>If the lifecycle hook times out, Amazon EC2 Auto Scaling performs the action that you specified in the <code>DefaultResult</code> parameter. You can prevent the lifecycle hook from timing out by calling <a>RecordLifecycleActionHeartbeat</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable heartbeatTimeout;

/**
 <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleHookName;

/**
 <p>The state of the EC2 instance to which you want to attach the lifecycle hook. The valid values are:</p><ul><li><p>autoscaling:EC2_INSTANCE_LAUNCHING</p></li><li><p>autoscaling:EC2_INSTANCE_TERMINATING</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleTransition;

/**
 <p>Additional information that you want to include any time Amazon EC2 Auto Scaling sends a message to the notification target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationMetadata;

/**
 <p>The ARN of the target that Amazon EC2 Auto Scaling sends notifications to when an instance is in the transition state for the lifecycle hook. The notification target can be either an SQS queue or an SNS topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationTargetARN;

/**
 <p>The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target.</p><p>Valid only if the notification target is an Amazon SNS topic or an Amazon SQS queue. Required for new lifecycle hooks, but optional when updating existing hooks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

@end

/**
 <p>Describes the state of a Classic Load Balancer.</p>
 */
@interface AWSAutoScalingLoadBalancerState : AWSModel


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>One of the following load balancer states:</p><ul><li><p><code>Adding</code> - The Auto Scaling instances are being registered with the load balancer.</p></li><li><p><code>Added</code> - All Auto Scaling instances are registered with the load balancer.</p></li><li><p><code>InService</code> - At least one Auto Scaling instance passed an <code>ELB</code> health check.</p></li><li><p><code>Removing</code> - The Auto Scaling instances are being deregistered from the load balancer. If connection draining is enabled, Elastic Load Balancing waits for in-flight requests to complete before deregistering the instances.</p></li><li><p><code>Removed</code> - All Auto Scaling instances are deregistered from the load balancer.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable state;

@end

/**
 <p>Describes the state of a target group.</p>
 */
@interface AWSAutoScalingLoadBalancerTargetGroupState : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the target group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerTargetGroupARN;

/**
 <p>The state of the target group.</p><ul><li><p><code>Adding</code> - The Auto Scaling instances are being registered with the target group.</p></li><li><p><code>Added</code> - All Auto Scaling instances are registered with the target group.</p></li><li><p><code>InService</code> - At least one Auto Scaling instance passed an <code>ELB</code> health check.</p></li><li><p><code>Removing</code> - The Auto Scaling instances are being deregistered from the target group. If connection draining is enabled, Elastic Load Balancing waits for in-flight requests to complete before deregistering the instances.</p></li><li><p><code>Removed</code> - All Auto Scaling instances are deregistered from the target group.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable state;

@end

/**
 <p>A <code>GetPredictiveScalingForecast</code> call returns the load forecast for a predictive scaling policy. This structure includes the data points for that load forecast, along with the timestamps of those data points and the metric specification. </p>
 Required parameters: [Timestamps, Values, MetricSpecification]
 */
@interface AWSAutoScalingLoadForecast : AWSModel


/**
 <p>The metric specification for the load forecast.</p>
 */
@property (nonatomic, strong) AWSAutoScalingPredictiveScalingMetricSpecification * _Nullable metricSpecification;

/**
 <p>The timestamps for the data points, in UTC format.</p>
 */
@property (nonatomic, strong) NSArray<NSDate *> * _Nullable timestamps;

/**
 <p>The values of the data points.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable values;

@end

/**
 <p>Specifies the minimum and maximum for the <code>MemoryGiBPerVCpu</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>
 */
@interface AWSAutoScalingMemoryGiBPerVCpuRequest : AWSModel


/**
 <p>The memory maximum in GiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max;

/**
 <p>The memory minimum in GiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable min;

@end

/**
 <p>Specifies the minimum and maximum for the <code>MemoryMiB</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>
 Required parameters: [Min]
 */
@interface AWSAutoScalingMemoryMiBRequest : AWSModel


/**
 <p>The memory maximum in MiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max;

/**
 <p>The memory minimum in MiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable min;

@end

/**
 <p>Represents a specific metric. </p>
 Required parameters: [Namespace, MetricName]
 */
@interface AWSAutoScalingMetric : AWSModel


/**
 <p>The dimensions for the metric. For the list of available dimensions, see the Amazon Web Services documentation available from the table in <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html">Amazon Web Services services that publish CloudWatch metrics </a> in the <i>Amazon CloudWatch User Guide</i>. </p><p>Conditional: If you published your metric with dimensions, you must specify the same dimensions in your scaling policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingMetricDimension *> * _Nullable dimensions;

/**
 <p>The name of the metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The namespace of the metric. For more information, see the table in <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html">Amazon Web Services services that publish CloudWatch metrics </a> in the <i>Amazon CloudWatch User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable namespace;

@end

/**
 <p>Describes a metric.</p>
 */
@interface AWSAutoScalingMetricCollectionType : AWSModel


/**
 <p>One of the following metrics:</p><ul><li><p><code>GroupMinSize</code></p></li><li><p><code>GroupMaxSize</code></p></li><li><p><code>GroupDesiredCapacity</code></p></li><li><p><code>GroupInServiceInstances</code></p></li><li><p><code>GroupPendingInstances</code></p></li><li><p><code>GroupStandbyInstances</code></p></li><li><p><code>GroupTerminatingInstances</code></p></li><li><p><code>GroupTotalInstances</code></p></li><li><p><code>GroupInServiceCapacity</code></p></li><li><p><code>GroupPendingCapacity</code></p></li><li><p><code>GroupStandbyCapacity</code></p></li><li><p><code>GroupTerminatingCapacity</code></p></li><li><p><code>GroupTotalCapacity</code></p></li><li><p><code>WarmPoolDesiredCapacity</code></p></li><li><p><code>WarmPoolWarmedCapacity</code></p></li><li><p><code>WarmPoolPendingCapacity</code></p></li><li><p><code>WarmPoolTerminatingCapacity</code></p></li><li><p><code>WarmPoolTotalCapacity</code></p></li><li><p><code>GroupAndWarmPoolDesiredCapacity</code></p></li><li><p><code>GroupAndWarmPoolTotalCapacity</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable metric;

@end

/**
 <p>The metric data to return. Also defines whether this call is returning data for one metric only, or whether it is performing a math expression on the values of returned metric statistics to create a new time series. A time series is a series of data points, each of which is associated with a timestamp.</p><p>For more information and examples, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/predictive-scaling-customized-metric-specification.html">Advanced predictive scaling policy configurations using custom metrics</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 Required parameters: [Id]
 */
@interface AWSAutoScalingMetricDataQuery : AWSModel


/**
 <p>The math expression to perform on the returned data, if this object is performing a math expression. This expression can use the <code>Id</code> of the other metrics to refer to those metrics, and can also use the <code>Id</code> of other expressions to use the result of those expressions. </p><p>Conditional: Within each <code>MetricDataQuery</code> object, you must specify either <code>Expression</code> or <code>MetricStat</code>, but not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expression;

/**
 <p>A short name that identifies the object's results in the response. This name must be unique among all <code>MetricDataQuery</code> objects specified for a single scaling policy. If you are performing math expressions on this set of data, this name represents that data and can serve as a variable in the mathematical expression. The valid characters are letters, numbers, and underscores. The first character must be a lowercase letter. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A human-readable label for this metric or expression. This is especially useful if this is a math expression, so that you know what the value represents.</p>
 */
@property (nonatomic, strong) NSString * _Nullable label;

/**
 <p>Information about the metric data to return.</p><p>Conditional: Within each <code>MetricDataQuery</code> object, you must specify either <code>Expression</code> or <code>MetricStat</code>, but not both.</p>
 */
@property (nonatomic, strong) AWSAutoScalingMetricStat * _Nullable metricStat;

/**
 <p>Indicates whether to return the timestamps and raw data values of this metric. </p><p>If you use any math expressions, specify <code>true</code> for this value for only the final math expression that the metric specification is based on. You must specify <code>false</code> for <code>ReturnData</code> for all the other metrics and expressions used in the metric specification.</p><p>If you are only retrieving metrics and not performing any math expressions, do not specify anything for <code>ReturnData</code>. This sets it to its default (<code>true</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returnData;

@end

/**
 <p>Describes the dimension of a metric.</p>
 Required parameters: [Name, Value]
 */
@interface AWSAutoScalingMetricDimension : AWSModel


/**
 <p>The name of the dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of the dimension.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

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
 <p>This structure defines the CloudWatch metric to return, along with the statistic, period, and unit.</p><p>For more information about the CloudWatch terminology below, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html">Amazon CloudWatch concepts</a> in the <i>Amazon CloudWatch User Guide</i>.</p>
 Required parameters: [Metric, Stat]
 */
@interface AWSAutoScalingMetricStat : AWSModel


/**
 <p>The CloudWatch metric to return, including the metric name, namespace, and dimensions. To get the exact metric name, namespace, and dimensions, inspect the <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Metric.html">Metric</a> object that is returned by a call to <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html">ListMetrics</a>.</p>
 */
@property (nonatomic, strong) AWSAutoScalingMetric * _Nullable metric;

/**
 <p>The statistic to return. It can include any CloudWatch statistic or extended statistic. For a list of valid values, see the table in <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Statistic">Statistics</a> in the <i>Amazon CloudWatch User Guide</i>.</p><p>The most commonly used metrics for predictive scaling are <code>Average</code> and <code>Sum</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stat;

/**
 <p>The unit to use for the returned data points. For a complete list of the units that CloudWatch supports, see the <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html">MetricDatum</a> data type in the <i>Amazon CloudWatch API Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable unit;

@end

/**
 <p>Describes a mixed instances policy. A mixed instances policy contains the instance types that Amazon EC2 Auto Scaling can launch and other information that Amazon EC2 Auto Scaling can use to launch instances and help optimize your costs. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups.html">Auto Scaling groups with multiple instance types and purchase options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@interface AWSAutoScalingMixedInstancesPolicy : AWSModel


/**
 <p>Specifies the instances distribution.</p>
 */
@property (nonatomic, strong) AWSAutoScalingInstancesDistribution * _Nullable instancesDistribution;

/**
 <p>Specifies the launch template to use and the instance types (overrides) that are used to launch EC2 instances to fulfill On-Demand and Spot capacities. Required when creating a mixed instances policy.</p>
 */
@property (nonatomic, strong) AWSAutoScalingLaunchTemplate * _Nullable launchTemplate;

@end

/**
 <p>Specifies the minimum and maximum for the <code>NetworkInterfaceCount</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>
 */
@interface AWSAutoScalingNetworkInterfaceCountRequest : AWSModel


/**
 <p>The maximum number of network interfaces.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max;

/**
 <p>The minimum number of network interfaces.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable min;

@end

/**
 <p>Describes a notification.</p>
 */
@interface AWSAutoScalingNotificationConfiguration : AWSModel


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One of the following event notification types:</p><ul><li><p><code>autoscaling:EC2_INSTANCE_LAUNCH</code></p></li><li><p><code>autoscaling:EC2_INSTANCE_LAUNCH_ERROR</code></p></li><li><p><code>autoscaling:EC2_INSTANCE_TERMINATE</code></p></li><li><p><code>autoscaling:EC2_INSTANCE_TERMINATE_ERROR</code></p></li><li><p><code>autoscaling:TEST_NOTIFICATION</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable notificationType;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicARN;

@end

/**
 
 */
@interface AWSAutoScalingPoliciesType : AWSModel


/**
 <p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>
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
 <p>The CloudWatch alarms created for the target tracking scaling policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingAlarm *> * _Nullable alarms;

/**
 <p>The Amazon Resource Name (ARN) of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyARN;

@end

/**
 <p>Represents a predefined metric for a target tracking scaling policy to use with Amazon EC2 Auto Scaling.</p>
 Required parameters: [PredefinedMetricType]
 */
@interface AWSAutoScalingPredefinedMetricSpecification : AWSModel


/**
 <p>The metric type. The following predefined metrics are available:</p><ul><li><p><code>ASGAverageCPUUtilization</code> - Average CPU utilization of the Auto Scaling group.</p></li><li><p><code>ASGAverageNetworkIn</code> - Average number of bytes received on all network interfaces by the Auto Scaling group.</p></li><li><p><code>ASGAverageNetworkOut</code> - Average number of bytes sent out on all network interfaces by the Auto Scaling group.</p></li><li><p><code>ALBRequestCountPerTarget</code> - Average Application Load Balancer request count per target for your Auto Scaling group.</p></li></ul>
 */
@property (nonatomic, assign) AWSAutoScalingMetricType predefinedMetricType;

/**
 <p>A label that uniquely identifies a specific Application Load Balancer target group from which to determine the average request count served by your Auto Scaling group. You can't specify a resource label unless the target group is attached to the Auto Scaling group.</p><p>You create the resource label by appending the final portion of the load balancer ARN and the final portion of the target group ARN into a single value, separated by a forward slash (/). The format of the resource label is:</p><p><code>app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff</code>.</p><p>Where:</p><ul><li><p>app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer ARN</p></li><li><p>targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target group ARN.</p></li></ul><p>To find the ARN for an Application Load Balancer, use the <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a> API operation. To find the ARN for the target group, use the <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html">DescribeTargetGroups</a> API operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceLabel;

@end

/**
 <p>Represents a predictive scaling policy configuration to use with Amazon EC2 Auto Scaling.</p>
 Required parameters: [MetricSpecifications]
 */
@interface AWSAutoScalingPredictiveScalingConfiguration : AWSModel


/**
 <p>Defines the behavior that should be applied if the forecast capacity approaches or exceeds the maximum capacity of the Auto Scaling group. Defaults to <code>HonorMaxCapacity</code> if not specified.</p><p>The following are possible values:</p><ul><li><p><code>HonorMaxCapacity</code> - Amazon EC2 Auto Scaling cannot scale out capacity higher than the maximum capacity. The maximum capacity is enforced as a hard limit. </p></li><li><p><code>IncreaseMaxCapacity</code> - Amazon EC2 Auto Scaling can scale out capacity higher than the maximum capacity when the forecast capacity is close to or exceeds the maximum capacity. The upper limit is determined by the forecasted capacity and the value for <code>MaxCapacityBuffer</code>.</p></li></ul>
 */
@property (nonatomic, assign) AWSAutoScalingPredictiveScalingMaxCapacityBreachBehavior maxCapacityBreachBehavior;

/**
 <p>The size of the capacity buffer to use when the forecast capacity is close to or exceeds the maximum capacity. The value is specified as a percentage relative to the forecast capacity. For example, if the buffer is 10, this means a 10 percent buffer, such that if the forecast capacity is 50, and the maximum capacity is 40, then the effective maximum capacity is 55.</p><p>If set to 0, Amazon EC2 Auto Scaling may scale capacity higher than the maximum capacity to equal but not exceed forecast capacity. </p><p>Required if the <code>MaxCapacityBreachBehavior</code> property is set to <code>IncreaseMaxCapacity</code>, and cannot be used otherwise.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCapacityBuffer;

/**
 <p>This structure includes the metrics and target utilization to use for predictive scaling. </p><p>This is an array, but we currently only support a single metric specification. That is, you can specify a target value and a single metric pair, or a target value and one scaling metric and one load metric.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingPredictiveScalingMetricSpecification *> * _Nullable metricSpecifications;

/**
 <p>The predictive scaling mode. Defaults to <code>ForecastOnly</code> if not specified.</p>
 */
@property (nonatomic, assign) AWSAutoScalingPredictiveScalingMode mode;

/**
 <p>The amount of time, in seconds, by which the instance launch time can be advanced. For example, the forecast says to add capacity at 10:00 AM, and you choose to pre-launch instances by 5 minutes. In that case, the instances will be launched at 9:55 AM. The intention is to give resources time to be provisioned. It can take a few minutes to launch an EC2 instance. The actual amount of time required depends on several factors, such as the size of the instance and whether there are startup scripts to complete. </p><p>The value must be less than the forecast interval duration of 3600 seconds (60 minutes). Defaults to 300 seconds if not specified. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable schedulingBufferTime;

@end

/**
 <p>Describes a customized capacity metric for a predictive scaling policy.</p>
 Required parameters: [MetricDataQueries]
 */
@interface AWSAutoScalingPredictiveScalingCustomizedCapacityMetric : AWSModel


/**
 <p>One or more metric data queries to provide the data points for a capacity metric. Use multiple metric data queries only if you are performing a math expression on returned data. </p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingMetricDataQuery *> * _Nullable metricDataQueries;

@end

/**
 <p>Describes a custom load metric for a predictive scaling policy.</p>
 Required parameters: [MetricDataQueries]
 */
@interface AWSAutoScalingPredictiveScalingCustomizedLoadMetric : AWSModel


/**
 <p>One or more metric data queries to provide the data points for a load metric. Use multiple metric data queries only if you are performing a math expression on returned data. </p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingMetricDataQuery *> * _Nullable metricDataQueries;

@end

/**
 <p>Describes a custom scaling metric for a predictive scaling policy.</p>
 Required parameters: [MetricDataQueries]
 */
@interface AWSAutoScalingPredictiveScalingCustomizedScalingMetric : AWSModel


/**
 <p>One or more metric data queries to provide the data points for a scaling metric. Use multiple metric data queries only if you are performing a math expression on returned data. </p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingMetricDataQuery *> * _Nullable metricDataQueries;

@end

/**
 <p>This structure specifies the metrics and target utilization settings for a predictive scaling policy. </p><p>You must specify either a metric pair, or a load metric and a scaling metric individually. Specifying a metric pair instead of individual metrics provides a simpler way to configure metrics for a scaling policy. You choose the metric pair, and the policy automatically knows the correct sum and average statistics to use for the load metric and the scaling metric.</p><p>Example</p><ul><li><p>You create a predictive scaling policy and specify <code>ALBRequestCount</code> as the value for the metric pair and <code>1000.0</code> as the target value. For this type of metric, you must provide the metric dimension for the corresponding target group, so you also provide a resource label for the Application Load Balancer target group that is attached to your Auto Scaling group.</p></li><li><p>The number of requests the target group receives per minute provides the load metric, and the request count averaged between the members of the target group provides the scaling metric. In CloudWatch, this refers to the <code>RequestCount</code> and <code>RequestCountPerTarget</code> metrics, respectively.</p></li><li><p>For optimal use of predictive scaling, you adhere to the best practice of using a dynamic scaling policy to automatically scale between the minimum capacity and maximum capacity in response to real-time changes in resource utilization.</p></li><li><p>Amazon EC2 Auto Scaling consumes data points for the load metric over the last 14 days and creates an hourly load forecast for predictive scaling. (A minimum of 24 hours of data is required.)</p></li><li><p>After creating the load forecast, Amazon EC2 Auto Scaling determines when to reduce or increase the capacity of your Auto Scaling group in each hour of the forecast period so that the average number of requests received by each instance is as close to 1000 requests per minute as possible at all times.</p></li></ul><p>For information about using custom metrics with predictive scaling, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/predictive-scaling-customized-metric-specification.html">Advanced predictive scaling policy configurations using custom metrics</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 Required parameters: [TargetValue]
 */
@interface AWSAutoScalingPredictiveScalingMetricSpecification : AWSModel


/**
 <p>The customized capacity metric specification.</p>
 */
@property (nonatomic, strong) AWSAutoScalingPredictiveScalingCustomizedCapacityMetric * _Nullable customizedCapacityMetricSpecification;

/**
 <p>The customized load metric specification.</p>
 */
@property (nonatomic, strong) AWSAutoScalingPredictiveScalingCustomizedLoadMetric * _Nullable customizedLoadMetricSpecification;

/**
 <p>The customized scaling metric specification.</p>
 */
@property (nonatomic, strong) AWSAutoScalingPredictiveScalingCustomizedScalingMetric * _Nullable customizedScalingMetricSpecification;

/**
 <p>The predefined load metric specification.</p>
 */
@property (nonatomic, strong) AWSAutoScalingPredictiveScalingPredefinedLoadMetric * _Nullable predefinedLoadMetricSpecification;

/**
 <p>The predefined metric pair specification from which Amazon EC2 Auto Scaling determines the appropriate scaling metric and load metric to use.</p>
 */
@property (nonatomic, strong) AWSAutoScalingPredictiveScalingPredefinedMetricPair * _Nullable predefinedMetricPairSpecification;

/**
 <p>The predefined scaling metric specification.</p>
 */
@property (nonatomic, strong) AWSAutoScalingPredictiveScalingPredefinedScalingMetric * _Nullable predefinedScalingMetricSpecification;

/**
 <p>Specifies the target utilization.</p><note><p>Some metrics are based on a count instead of a percentage, such as the request count for an Application Load Balancer or the number of messages in an SQS queue. If the scaling policy specifies one of these metrics, specify the target utilization as the optimal average request or message count per instance during any one-minute interval. </p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetValue;

@end

/**
 <p>Describes a load metric for a predictive scaling policy.</p><p>When returned in the output of <code>DescribePolicies</code>, it indicates that a predictive scaling policy uses individually specified load and scaling metrics instead of a metric pair.</p>
 Required parameters: [PredefinedMetricType]
 */
@interface AWSAutoScalingPredictiveScalingPredefinedLoadMetric : AWSModel


/**
 <p>The metric type.</p>
 */
@property (nonatomic, assign) AWSAutoScalingPredefinedLoadMetricType predefinedMetricType;

/**
 <p>A label that uniquely identifies a specific Application Load Balancer target group from which to determine the request count served by your Auto Scaling group. You can't specify a resource label unless the target group is attached to the Auto Scaling group.</p><p>You create the resource label by appending the final portion of the load balancer ARN and the final portion of the target group ARN into a single value, separated by a forward slash (/). The format of the resource label is:</p><p><code>app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff</code>.</p><p>Where:</p><ul><li><p>app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer ARN</p></li><li><p>targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target group ARN.</p></li></ul><p>To find the ARN for an Application Load Balancer, use the <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a> API operation. To find the ARN for the target group, use the <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html">DescribeTargetGroups</a> API operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceLabel;

@end

/**
 <p>Represents a metric pair for a predictive scaling policy. </p>
 Required parameters: [PredefinedMetricType]
 */
@interface AWSAutoScalingPredictiveScalingPredefinedMetricPair : AWSModel


/**
 <p>Indicates which metrics to use. There are two different types of metrics for each metric type: one is a load metric and one is a scaling metric. For example, if the metric type is <code>ASGCPUUtilization</code>, the Auto Scaling group's total CPU metric is used as the load metric, and the average CPU metric is used for the scaling metric.</p>
 */
@property (nonatomic, assign) AWSAutoScalingPredefinedMetricPairType predefinedMetricType;

/**
 <p>A label that uniquely identifies a specific Application Load Balancer target group from which to determine the total and average request count served by your Auto Scaling group. You can't specify a resource label unless the target group is attached to the Auto Scaling group.</p><p>You create the resource label by appending the final portion of the load balancer ARN and the final portion of the target group ARN into a single value, separated by a forward slash (/). The format of the resource label is:</p><p><code>app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff</code>.</p><p>Where:</p><ul><li><p>app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer ARN</p></li><li><p>targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target group ARN.</p></li></ul><p>To find the ARN for an Application Load Balancer, use the <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a> API operation. To find the ARN for the target group, use the <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html">DescribeTargetGroups</a> API operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceLabel;

@end

/**
 <p>Describes a scaling metric for a predictive scaling policy.</p><p>When returned in the output of <code>DescribePolicies</code>, it indicates that a predictive scaling policy uses individually specified load and scaling metrics instead of a metric pair.</p>
 Required parameters: [PredefinedMetricType]
 */
@interface AWSAutoScalingPredictiveScalingPredefinedScalingMetric : AWSModel


/**
 <p>The metric type.</p>
 */
@property (nonatomic, assign) AWSAutoScalingPredefinedScalingMetricType predefinedMetricType;

/**
 <p>A label that uniquely identifies a specific Application Load Balancer target group from which to determine the average request count served by your Auto Scaling group. You can't specify a resource label unless the target group is attached to the Auto Scaling group.</p><p>You create the resource label by appending the final portion of the load balancer ARN and the final portion of the target group ARN into a single value, separated by a forward slash (/). The format of the resource label is:</p><p><code>app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff</code>.</p><p>Where:</p><ul><li><p>app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer ARN</p></li><li><p>targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target group ARN.</p></li></ul><p>To find the ARN for an Application Load Balancer, use the <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a> API operation. To find the ARN for the target group, use the <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html">DescribeTargetGroups</a> API operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceLabel;

@end

/**
 <p>Describes a process type.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html#process-types">Scaling processes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 Required parameters: [ProcessName]
 */
@interface AWSAutoScalingProcessType : AWSModel


/**
 <p>One of the following processes:</p><ul><li><p><code>Launch</code></p></li><li><p><code>Terminate</code></p></li><li><p><code>AddToLoadBalancer</code></p></li><li><p><code>AlarmNotification</code></p></li><li><p><code>AZRebalance</code></p></li><li><p><code>HealthCheck</code></p></li><li><p><code>InstanceRefresh</code></p></li><li><p><code>ReplaceUnhealthy</code></p></li><li><p><code>ScheduledActions</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable processName;

@end

/**
 
 */
@interface AWSAutoScalingProcessesType : AWSModel


/**
 <p>The names of the process types.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingProcessType *> * _Nullable processes;

@end

/**
 
 */
@interface AWSAutoScalingPutLifecycleHookAnswer : AWSModel


@end

/**
 
 */
@interface AWSAutoScalingPutLifecycleHookType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. This parameter can be either <code>CONTINUE</code> or <code>ABANDON</code>. The default value is <code>ABANDON</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultResult;

/**
 <p>The maximum time, in seconds, that can elapse before the lifecycle hook times out. The range is from <code>30</code> to <code>7200</code> seconds. The default value is <code>3600</code> seconds (1 hour).</p><p>If the lifecycle hook times out, Amazon EC2 Auto Scaling performs the action that you specified in the <code>DefaultResult</code> parameter. You can prevent the lifecycle hook from timing out by calling the <a>RecordLifecycleActionHeartbeat</a> API.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable heartbeatTimeout;

/**
 <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleHookName;

/**
 <p>The instance state to which you want to attach the lifecycle hook. The valid values are:</p><ul><li><p>autoscaling:EC2_INSTANCE_LAUNCHING</p></li><li><p>autoscaling:EC2_INSTANCE_TERMINATING</p></li></ul><p>Required for new lifecycle hooks, but optional when updating existing hooks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleTransition;

/**
 <p>Additional information that you want to include any time Amazon EC2 Auto Scaling sends a message to the notification target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationMetadata;

/**
 <p>The ARN of the notification target that Amazon EC2 Auto Scaling uses to notify you when an instance is in the transition state for the lifecycle hook. This target can be either an SQS queue or an SNS topic.</p><p>If you specify an empty string, this overrides the current ARN.</p><p>This operation uses the JSON format when sending notifications to an Amazon SQS queue, and an email key-value pair format when sending notifications to an Amazon SNS topic.</p><p>When you specify a notification target, Amazon EC2 Auto Scaling sends it a test message. Test messages contain the following additional key-value pair: <code>"Event": "autoscaling:TEST_NOTIFICATION"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationTargetARN;

/**
 <p>The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target.</p><p>Valid only if the notification target is an Amazon SNS topic or an Amazon SQS queue. Required for new lifecycle hooks, but optional when updating existing hooks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleARN;

@end

/**
 
 */
@interface AWSAutoScalingPutNotificationConfigurationType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The type of event that causes the notification to be sent. To query the notification types supported by Amazon EC2 Auto Scaling, call the <a>DescribeAutoScalingNotificationTypes</a> API.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notificationTypes;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicARN;

@end

/**
 
 */
@interface AWSAutoScalingPutScalingPolicyType : AWSRequest


/**
 <p>Specifies how the scaling adjustment is interpreted (for example, an absolute number or a percentage). The valid values are <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and <code>PercentChangeInCapacity</code>.</p><p>Required if the policy type is <code>StepScaling</code> or <code>SimpleScaling</code>. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html#as-scaling-adjustment">Scaling adjustment types</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adjustmentType;

/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>A cooldown period, in seconds, that applies to a specific simple scaling policy. When a cooldown period is specified here, it overrides the default cooldown.</p><p>Valid only if the policy type is <code>SimpleScaling</code>. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html">Scaling cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>Default: None</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cooldown;

/**
 <p>Indicates whether the scaling policy is enabled or disabled. The default is enabled. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enable-disable-scaling-policy.html">Disabling a scaling policy for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p><i>Not needed if the default instance warmup is defined for the group.</i></p><p>The estimated time, in seconds, until a newly launched instance can contribute to the CloudWatch metrics. This warm-up period applies to instances launched due to a specific target tracking or step scaling policy. When a warm-up period is specified here, it overrides the default instance warmup.</p><p>Valid only if the policy type is <code>TargetTrackingScaling</code> or <code>StepScaling</code>.</p><note><p>The default is to use the value for the default instance warmup defined for the group. If default instance warmup is null, then <code>EstimatedInstanceWarmup</code> falls back to the value of default cooldown.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable estimatedInstanceWarmup;

/**
 <p>The aggregation type for the CloudWatch metrics. The valid values are <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code>. If the aggregation type is null, the value is treated as <code>Average</code>.</p><p>Valid only if the policy type is <code>StepScaling</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricAggregationType;

/**
 <p>The minimum value to scale by when the adjustment type is <code>PercentChangeInCapacity</code>. For example, suppose that you create a step scaling policy to scale out an Auto Scaling group by 25 percent and you specify a <code>MinAdjustmentMagnitude</code> of 2. If the group has 4 instances and the scaling policy is performed, 25 percent of 4 is 1. However, because you specified a <code>MinAdjustmentMagnitude</code> of 2, Amazon EC2 Auto Scaling scales out the group by 2 instances.</p><p>Valid only if the policy type is <code>StepScaling</code> or <code>SimpleScaling</code>. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html#as-scaling-adjustment">Scaling adjustment types</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><note><p>Some Auto Scaling groups use instance weights. In this case, set the <code>MinAdjustmentMagnitude</code> to a value that is at least as large as your largest instance weight.</p></note>
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
 <p>One of the following policy types: </p><ul><li><p><code>TargetTrackingScaling</code></p></li><li><p><code>StepScaling</code></p></li><li><p><code>SimpleScaling</code> (default)</p></li><li><p><code>PredictiveScaling</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable policyType;

/**
 <p>A predictive scaling policy. Provides support for predefined and custom metrics.</p><p>Predefined metrics include CPU utilization, network in/out, and the Application Load Balancer request count.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_PredictiveScalingConfiguration.html">PredictiveScalingConfiguration</a> in the <i>Amazon EC2 Auto Scaling API Reference</i>.</p><p>Required if the policy type is <code>PredictiveScaling</code>.</p>
 */
@property (nonatomic, strong) AWSAutoScalingPredictiveScalingConfiguration * _Nullable predictiveScalingConfiguration;

/**
 <p>The amount by which to scale, based on the specified adjustment type. A positive value adds to the current capacity while a negative number removes from the current capacity. For exact capacity, you must specify a positive value.</p><p>Required if the policy type is <code>SimpleScaling</code>. (Not used with any other policy type.) </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scalingAdjustment;

/**
 <p>A set of adjustments that enable you to scale based on the size of the alarm breach.</p><p>Required if the policy type is <code>StepScaling</code>. (Not used with any other policy type.) </p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingStepAdjustment *> * _Nullable stepAdjustments;

/**
 <p>A target tracking scaling policy. Provides support for predefined or custom metrics.</p><p>The following predefined metrics are available:</p><ul><li><p><code>ASGAverageCPUUtilization</code></p></li><li><p><code>ASGAverageNetworkIn</code></p></li><li><p><code>ASGAverageNetworkOut</code></p></li><li><p><code>ALBRequestCountPerTarget</code></p></li></ul><p>If you specify <code>ALBRequestCountPerTarget</code> for the metric, you must specify the <code>ResourceLabel</code> parameter with the <code>PredefinedMetricSpecification</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_TargetTrackingConfiguration.html">TargetTrackingConfiguration</a> in the <i>Amazon EC2 Auto Scaling API Reference</i>.</p><p>Required if the policy type is <code>TargetTrackingScaling</code>.</p>
 */
@property (nonatomic, strong) AWSAutoScalingTargetTrackingConfiguration * _Nullable targetTrackingConfiguration;

@end

/**
 
 */
@interface AWSAutoScalingPutScheduledUpdateGroupActionType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The desired capacity is the initial capacity of the Auto Scaling group after the scheduled action runs and the capacity it attempts to maintain. It can scale beyond this capacity if you add more scaling conditions. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>The date and time for the recurring schedule to end, in UTC.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The maximum size of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSize;

/**
 <p>The minimum size of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

/**
 <p>The recurring schedule for this action. This format consists of five fields separated by white spaces: [Minute] [Hour] [Day_of_Month] [Month_of_Year] [Day_of_Week]. The value must be in quotes (for example, <code>"30 0 1 1,6,12 *"</code>). For more information about this format, see <a href="http://crontab.org">Crontab</a>.</p><p>When <code>StartTime</code> and <code>EndTime</code> are specified with <code>Recurrence</code>, they form the boundaries of when the recurring action starts and stops.</p><p>Cron expressions use Universal Coordinated Time (UTC) by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recurrence;

/**
 <p>The name of this scaling action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

/**
 <p>The date and time for this action to start, in YYYY-MM-DDThh:mm:ssZ format in UTC/GMT only and in quotes (for example, <code>"2019-06-01T00:00:00Z"</code>).</p><p>If you specify <code>Recurrence</code> and <code>StartTime</code>, Amazon EC2 Auto Scaling performs the action at this time, and then performs the action based on the specified recurrence.</p><p>If you try to schedule your action in the past, Amazon EC2 Auto Scaling returns an error message.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>This parameter is no longer used.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable time;

/**
 <p>Specifies the time zone for a cron expression. If a time zone is not provided, UTC is used by default. </p><p>Valid values are the canonical names of the IANA time zones, derived from the IANA Time Zone Database (such as <code>Etc/GMT+9</code> or <code>Pacific/Tahiti</code>). For more information, see <a href="https://en.wikipedia.org/wiki/List_of_tz_database_time_zones">https://en.wikipedia.org/wiki/List_of_tz_database_time_zones</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeZone;

@end

/**
 
 */
@interface AWSAutoScalingPutWarmPoolAnswer : AWSModel


@end

/**
 
 */
@interface AWSAutoScalingPutWarmPoolType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>Indicates whether instances in the Auto Scaling group can be returned to the warm pool on scale in. The default is to terminate instances in the Auto Scaling group when the group scales in.</p>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceReusePolicy * _Nullable instanceReusePolicy;

/**
 <p>Specifies the maximum number of instances that are allowed to be in the warm pool or in any state except <code>Terminated</code> for the Auto Scaling group. This is an optional property. Specify it only if you do not want the warm pool size to be determined by the difference between the group's maximum capacity and its desired capacity. </p><important><p>If a value for <code>MaxGroupPreparedCapacity</code> is not specified, Amazon EC2 Auto Scaling launches and maintains the difference between the group's maximum capacity and its desired capacity. If you specify a value for <code>MaxGroupPreparedCapacity</code>, Amazon EC2 Auto Scaling uses the difference between the <code>MaxGroupPreparedCapacity</code> and the desired capacity instead. </p><p>The size of the warm pool is dynamic. Only when <code>MaxGroupPreparedCapacity</code> and <code>MinSize</code> are set to the same value does the warm pool have an absolute size.</p></important><p>If the desired capacity of the Auto Scaling group is higher than the <code>MaxGroupPreparedCapacity</code>, the capacity of the warm pool is 0, unless you specify a value for <code>MinSize</code>. To remove a value that you previously set, include the property but specify -1 for the value. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxGroupPreparedCapacity;

/**
 <p>Specifies the minimum number of instances to maintain in the warm pool. This helps you to ensure that there is always a certain number of warmed instances available to handle traffic spikes. Defaults to 0 if not specified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

/**
 <p>Sets the instance state to transition to after the lifecycle actions are complete. Default is <code>Stopped</code>.</p>
 */
@property (nonatomic, assign) AWSAutoScalingWarmPoolState poolState;

@end

/**
 
 */
@interface AWSAutoScalingRecordLifecycleActionHeartbeatAnswer : AWSModel


@end

/**
 
 */
@interface AWSAutoScalingRecordLifecycleActionHeartbeatType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A token that uniquely identifies a specific lifecycle action associated with an instance. Amazon EC2 Auto Scaling sends this token to the notification target that you specified when you created the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleActionToken;

/**
 <p>The name of the lifecycle hook.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lifecycleHookName;

@end

/**
 <p>Describes the preferences for an instance refresh.</p>
 */
@interface AWSAutoScalingRefreshPreferences : AWSModel


/**
 <p>The amount of time, in seconds, to wait after a checkpoint before continuing. This property is optional, but if you specify a value for it, you must also specify a value for <code>CheckpointPercentages</code>. If you specify a value for <code>CheckpointPercentages</code> and not for <code>CheckpointDelay</code>, the <code>CheckpointDelay</code> defaults to <code>3600</code> (1 hour). </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable checkpointDelay;

/**
 <p>Threshold values for each checkpoint in ascending order. Each number must be unique. To replace all instances in the Auto Scaling group, the last number in the array must be <code>100</code>.</p><p>For usage examples, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-adding-checkpoints-instance-refresh.html">Adding checkpoints to an instance refresh</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable checkpointPercentages;

/**
 <p><i>Not needed if the default instance warmup is defined for the group.</i></p><p>The duration of the instance warmup, in seconds.</p><note><p>The default is to use the value for the default instance warmup defined for the group. If default instance warmup is null, then <code>InstanceWarmup</code> falls back to the value of the health check grace period.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceWarmup;

/**
 <p>The amount of capacity in the Auto Scaling group that must pass your group's health checks to allow the operation to continue. The value is expressed as a percentage of the desired capacity of the Auto Scaling group (rounded up to the nearest integer). The default is <code>90</code>.</p><p>Setting the minimum healthy percentage to 100 percent limits the rate of replacement to one instance at a time. In contrast, setting it to 0 percent has the effect of replacing all instances at the same time. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minHealthyPercentage;

/**
 <p>A boolean value that indicates whether skip matching is enabled. If true, then Amazon EC2 Auto Scaling skips replacing instances that match the desired configuration. If no desired configuration is specified, then it skips replacing instances that have the same configuration that is already set on the group. The default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable skipMatching;

@end

/**
 <p>Describes a scaling policy.</p>
 */
@interface AWSAutoScalingScalingPolicy : AWSModel


/**
 <p>Specifies how the scaling adjustment is interpreted (for example, an absolute number or a percentage). The valid values are <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and <code>PercentChangeInCapacity</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adjustmentType;

/**
 <p>The CloudWatch alarms related to the policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingAlarm *> * _Nullable alarms;

/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The duration of the policy's cooldown period, in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cooldown;

/**
 <p>Indicates whether the policy is enabled (<code>true</code>) or disabled (<code>false</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The estimated time, in seconds, until a newly launched instance can contribute to the CloudWatch metrics.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable estimatedInstanceWarmup;

/**
 <p>The aggregation type for the CloudWatch metrics. The valid values are <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricAggregationType;

/**
 <p>The minimum value to scale by when the adjustment type is <code>PercentChangeInCapacity</code>. </p>
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
 <p>One of the following policy types: </p><ul><li><p><code>TargetTrackingScaling</code></p></li><li><p><code>StepScaling</code></p></li><li><p><code>SimpleScaling</code> (default)</p></li><li><p><code>PredictiveScaling</code></p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html">Target tracking scaling policies</a> and <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html">Step and simple scaling policies</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyType;

/**
 <p>A predictive scaling policy.</p>
 */
@property (nonatomic, strong) AWSAutoScalingPredictiveScalingConfiguration * _Nullable predictiveScalingConfiguration;

/**
 <p>The amount by which to scale, based on the specified adjustment type. A positive value adds to the current capacity while a negative number removes from the current capacity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable scalingAdjustment;

/**
 <p>A set of adjustments that enable you to scale based on the size of the alarm breach.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingStepAdjustment *> * _Nullable stepAdjustments;

/**
 <p>A target tracking scaling policy.</p>
 */
@property (nonatomic, strong) AWSAutoScalingTargetTrackingConfiguration * _Nullable targetTrackingConfiguration;

@end

/**
 
 */
@interface AWSAutoScalingScalingProcessQuery : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more of the following processes:</p><ul><li><p><code>Launch</code></p></li><li><p><code>Terminate</code></p></li><li><p><code>AddToLoadBalancer</code></p></li><li><p><code>AlarmNotification</code></p></li><li><p><code>AZRebalance</code></p></li><li><p><code>HealthCheck</code></p></li><li><p><code>InstanceRefresh</code></p></li><li><p><code>ReplaceUnhealthy</code></p></li><li><p><code>ScheduledActions</code></p></li></ul><p>If you omit this parameter, all processes are specified.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scalingProcesses;

@end

/**
 
 */
@interface AWSAutoScalingScheduledActionsType : AWSModel


/**
 <p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The scheduled actions.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingScheduledUpdateGroupAction *> * _Nullable scheduledUpdateGroupActions;

@end

/**
 <p>Describes a scheduled scaling action.</p>
 */
@interface AWSAutoScalingScheduledUpdateGroupAction : AWSModel


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The desired capacity is the initial capacity of the Auto Scaling group after the scheduled action runs and the capacity it attempts to maintain.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>The date and time in UTC for the recurring schedule to end. For example, <code>"2019-06-01T00:00:00Z"</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The maximum size of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSize;

/**
 <p>The minimum size of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

/**
 <p>The recurring schedule for the action, in Unix cron syntax format.</p><p>When <code>StartTime</code> and <code>EndTime</code> are specified with <code>Recurrence</code>, they form the boundaries of when the recurring action starts and stops.</p>
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
 <p>The date and time in UTC for this action to start. For example, <code>"2019-06-01T00:00:00Z"</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>This parameter is no longer used.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable time;

/**
 <p>The time zone for the cron expression.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeZone;

@end

/**
 <p>Describes information used for one or more scheduled scaling action updates in a <a>BatchPutScheduledUpdateGroupAction</a> operation.</p>
 Required parameters: [ScheduledActionName]
 */
@interface AWSAutoScalingScheduledUpdateGroupActionRequest : AWSModel


/**
 <p>The desired capacity is the initial capacity of the Auto Scaling group after the scheduled action runs and the capacity it attempts to maintain.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>The date and time for the recurring schedule to end, in UTC.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The maximum size of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSize;

/**
 <p>The minimum size of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

/**
 <p>The recurring schedule for the action, in Unix cron syntax format. This format consists of five fields separated by white spaces: [Minute] [Hour] [Day_of_Month] [Month_of_Year] [Day_of_Week]. The value must be in quotes (for example, <code>"30 0 1 1,6,12 *"</code>). For more information about this format, see <a href="http://crontab.org">Crontab</a>.</p><p>When <code>StartTime</code> and <code>EndTime</code> are specified with <code>Recurrence</code>, they form the boundaries of when the recurring action starts and stops.</p><p>Cron expressions use Universal Coordinated Time (UTC) by default.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recurrence;

/**
 <p>The name of the scaling action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledActionName;

/**
 <p>The date and time for the action to start, in YYYY-MM-DDThh:mm:ssZ format in UTC/GMT only and in quotes (for example, <code>"2019-06-01T00:00:00Z"</code>).</p><p>If you specify <code>Recurrence</code> and <code>StartTime</code>, Amazon EC2 Auto Scaling performs the action at this time, and then performs the action based on the specified recurrence.</p><p>If you try to schedule the action in the past, Amazon EC2 Auto Scaling returns an error message.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>Specifies the time zone for a cron expression. If a time zone is not provided, UTC is used by default. </p><p>Valid values are the canonical names of the IANA time zones, derived from the IANA Time Zone Database (such as <code>Etc/GMT+9</code> or <code>Pacific/Tahiti</code>). For more information, see <a href="https://en.wikipedia.org/wiki/List_of_tz_database_time_zones">https://en.wikipedia.org/wiki/List_of_tz_database_time_zones</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeZone;

@end

/**
 
 */
@interface AWSAutoScalingSetDesiredCapacityType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The desired capacity is the initial capacity of the Auto Scaling group after this operation completes and the capacity it attempts to maintain.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>Indicates whether Amazon EC2 Auto Scaling waits for the cooldown period to complete before initiating a scaling activity to set your Auto Scaling group to its new capacity. By default, Amazon EC2 Auto Scaling does not honor the cooldown period during manual scaling activities.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable honorCooldown;

@end

/**
 
 */
@interface AWSAutoScalingSetInstanceHealthQuery : AWSRequest


/**
 <p>The health status of the instance. Set to <code>Healthy</code> to have the instance remain in service. Set to <code>Unhealthy</code> to have the instance be out of service. Amazon EC2 Auto Scaling terminates and replaces the unhealthy instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthStatus;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>If the Auto Scaling group of the specified instance has a <code>HealthCheckGracePeriod</code> specified for the group, by default, this call respects the grace period. Set this to <code>False</code>, to have the call not respect the grace period associated with the group.</p><p>For more information about the health check grace period, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CreateAutoScalingGroup.html">CreateAutoScalingGroup</a> in the <i>Amazon EC2 Auto Scaling API Reference</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable shouldRespectGracePeriod;

@end

/**
 
 */
@interface AWSAutoScalingSetInstanceProtectionAnswer : AWSModel


@end

/**
 
 */
@interface AWSAutoScalingSetInstanceProtectionQuery : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>One or more instance IDs. You can specify up to 50 instances.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>Indicates whether the instance is protected from termination by Amazon EC2 Auto Scaling when scaling in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable protectedFromScaleIn;

@end

/**
 
 */
@interface AWSAutoScalingStartInstanceRefreshAnswer : AWSModel


/**
 <p>A unique ID for tracking the progress of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceRefreshId;

@end

/**
 
 */
@interface AWSAutoScalingStartInstanceRefreshType : AWSRequest


/**
 <p>The name of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable autoScalingGroupName;

/**
 <p>The desired configuration. For example, the desired configuration can specify a new launch template or a new version of the current launch template.</p><p>Once the instance refresh succeeds, Amazon EC2 Auto Scaling updates the settings of the Auto Scaling group to reflect the new desired configuration. </p><note><p>When you specify a new launch template or a new version of the current launch template for your desired configuration, consider enabling the <code>SkipMatching</code> property in preferences. If it's enabled, Amazon EC2 Auto Scaling skips replacing instances that already use the specified launch template and version. This can help you reduce the number of replacements that are required to apply updates. </p></note>
 */
@property (nonatomic, strong) AWSAutoScalingDesiredConfiguration * _Nullable desiredConfiguration;

/**
 <p>Set of preferences associated with the instance refresh request. If not provided, the default values are used.</p>
 */
@property (nonatomic, strong) AWSAutoScalingRefreshPreferences * _Nullable preferences;

/**
 <p>The strategy to use for the instance refresh. The only valid value is <code>Rolling</code>.</p><p>A rolling update helps you update your instances gradually. A rolling update can fail due to failed health checks or if instances are on standby or are protected from scale in. If the rolling update process fails, any instances that are replaced are not rolled back to their previous configuration. </p>
 */
@property (nonatomic, assign) AWSAutoScalingRefreshStrategy strategy;

@end

/**
 <p>Describes information used to create a step adjustment for a step scaling policy.</p><p>For the following examples, suppose that you have an alarm with a breach threshold of 50:</p><ul><li><p>To trigger the adjustment when the metric is greater than or equal to 50 and less than 60, specify a lower bound of 0 and an upper bound of 10.</p></li><li><p>To trigger the adjustment when the metric is greater than 40 and less than or equal to 50, specify a lower bound of -10 and an upper bound of 0.</p></li></ul><p>There are a few rules for the step adjustments for your step policy:</p><ul><li><p>The ranges of your step adjustments can't overlap or have a gap.</p></li><li><p>At most, one step adjustment can have a null lower bound. If one step adjustment has a negative lower bound, then there must be a step adjustment with a null lower bound.</p></li><li><p>At most, one step adjustment can have a null upper bound. If one step adjustment has a positive upper bound, then there must be a step adjustment with a null upper bound.</p></li><li><p>The upper and lower bound can't be null in the same step adjustment.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html#as-scaling-steps">Step adjustments</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
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
 <p>Describes an auto scaling process that has been suspended.</p><p>For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html#process-types">Scaling processes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
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
 <p>The name of the Auto Scaling group.</p>
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
 
 */
@interface AWSAutoScalingTagsType : AWSModel


/**
 <p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSAutoScalingTagDescription *> * _Nullable tags;

@end

/**
 <p>Represents a target tracking scaling policy configuration to use with Amazon EC2 Auto Scaling.</p>
 Required parameters: [TargetValue]
 */
@interface AWSAutoScalingTargetTrackingConfiguration : AWSModel


/**
 <p>A customized metric. You must specify either a predefined metric or a customized metric.</p>
 */
@property (nonatomic, strong) AWSAutoScalingCustomizedMetricSpecification * _Nullable customizedMetricSpecification;

/**
 <p>Indicates whether scaling in by the target tracking scaling policy is disabled. If scaling in is disabled, the target tracking scaling policy doesn't remove instances from the Auto Scaling group. Otherwise, the target tracking scaling policy can remove instances from the Auto Scaling group. The default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableScaleIn;

/**
 <p>A predefined metric. You must specify either a predefined metric or a customized metric.</p>
 */
@property (nonatomic, strong) AWSAutoScalingPredefinedMetricSpecification * _Nullable predefinedMetricSpecification;

/**
 <p>The target value for the metric.</p><note><p>Some metrics are based on a count instead of a percentage, such as the request count for an Application Load Balancer or the number of messages in an SQS queue. If the scaling policy specifies one of these metrics, specify the target utilization as the optimal average request or message count per instance during any one-minute interval. </p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetValue;

@end

/**
 
 */
@interface AWSAutoScalingTerminateInstanceInAutoScalingGroupType : AWSRequest


/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Indicates whether terminating the instance also decrements the size of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable shouldDecrementDesiredCapacity;

@end

/**
 <p>Specifies the minimum and maximum for the <code>TotalLocalStorageGB</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>
 */
@interface AWSAutoScalingTotalLocalStorageGBRequest : AWSModel


/**
 <p>The storage maximum in GB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max;

/**
 <p>The storage minimum in GB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable min;

@end

/**
 
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
 <p>Enables or disables Capacity Rebalancing. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-capacity-rebalancing.html">Amazon EC2 Auto Scaling Capacity Rebalancing</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable capacityRebalance;

/**
 <p>Reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable context;

/**
 <p><i>Only needed if you use simple scaling policies.</i></p><p>The amount of time, in seconds, between one scaling activity ending and another one starting due to simple scaling policies. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html">Scaling cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultCooldown;

/**
 <p>The amount of time, in seconds, until a newly launched instance can contribute to the Amazon CloudWatch metrics. This delay lets an instance finish initializing before Amazon EC2 Auto Scaling aggregates instance metrics, resulting in more reliable usage data. Set this value equal to the amount of time that it takes for resource consumption to become stable after an instance reaches the <code>InService</code> state. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-default-instance-warmup.html">Set the default instance warmup for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><important><p>To manage your warm-up settings at the group level, we recommend that you set the default instance warmup, <i>even if its value is set to 0 seconds</i>. This also optimizes the performance of scaling policies that scale continuously, such as target tracking and step scaling policies. </p><p>If you need to remove a value that you previously set, include the property but specify <code>-1</code> for the value. However, we strongly recommend keeping the default instance warmup enabled by specifying a minimum value of <code>0</code>.</p></important>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultInstanceWarmup;

/**
 <p>The desired capacity is the initial capacity of the Auto Scaling group after this operation completes and the capacity it attempts to maintain. This number must be greater than or equal to the minimum size of the group and less than or equal to the maximum size of the group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable desiredCapacity;

/**
 <p>The unit of measurement for the value specified for desired capacity. Amazon EC2 Auto Scaling supports <code>DesiredCapacityType</code> for attribute-based instance type selection only. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-instance-type-requirements.html">Creating an Auto Scaling group using attribute-based instance type selection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p><p>By default, Amazon EC2 Auto Scaling specifies <code>units</code>, which translates into number of instances.</p><p>Valid values: <code>units</code> | <code>vcpu</code> | <code>memory-mib</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable desiredCapacityType;

/**
 <p>The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before checking the health status of an EC2 instance that has come into service and marking it unhealthy due to a failed Elastic Load Balancing or custom health check. This is useful if your instances do not immediately pass these health checks after they enter the <code>InService</code> state. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html#health-check-grace-period">Health check grace period</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable healthCheckGracePeriod;

/**
 <p>The service to use for the health checks. The valid values are <code>EC2</code> and <code>ELB</code>. If you configure an Auto Scaling group to use <code>ELB</code> health checks, it considers the instance unhealthy if it fails either the EC2 status checks or the load balancer health checks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckType;

/**
 <p>The name of the launch configuration. If you specify <code>LaunchConfigurationName</code> in your update request, you can't specify <code>LaunchTemplate</code> or <code>MixedInstancesPolicy</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchConfigurationName;

/**
 <p>The launch template and version to use to specify the updates. If you specify <code>LaunchTemplate</code> in your update request, you can't specify <code>LaunchConfigurationName</code> or <code>MixedInstancesPolicy</code>.</p>
 */
@property (nonatomic, strong) AWSAutoScalingLaunchTemplateSpecification * _Nullable launchTemplate;

/**
 <p>The maximum amount of time, in seconds, that an instance can be in service. The default is null. If specified, the value must be either 0 or a number equal to or greater than 86,400 seconds (1 day). To clear a previously set value, specify a new value of 0. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-max-instance-lifetime.html">Replacing Auto Scaling instances based on maximum instance lifetime</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxInstanceLifetime;

/**
 <p>The maximum size of the Auto Scaling group.</p><note><p>With a mixed instances policy that uses instance weighting, Amazon EC2 Auto Scaling may need to go above <code>MaxSize</code> to meet your capacity requirements. In this event, Amazon EC2 Auto Scaling will never go above <code>MaxSize</code> by more than your largest instance weight (weights that define how many units each instance contributes to the desired capacity of the group).</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSize;

/**
 <p>The minimum size of the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

/**
 <p>An embedded object that specifies a mixed instances policy. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups.html">Auto Scaling groups with multiple instance types and purchase options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSAutoScalingMixedInstancesPolicy * _Nullable mixedInstancesPolicy;

/**
 <p>Indicates whether newly launched instances are protected from termination by Amazon EC2 Auto Scaling when scaling in. For more information about preventing instances from terminating on scale in, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-protection.html">Using instance scale-in protection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable latestInstancesProtectedFromScaleIn;

/**
 <p>The name of an existing placement group into which to launch your instances. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html">Placement groups</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p><note><p>A <i>cluster</i> placement group is a logical grouping of instances within a single Availability Zone. You cannot specify multiple Availability Zones and a cluster placement group. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable placementGroup;

/**
 <p>The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group uses to call other Amazon Web Services on your behalf. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-service-linked-role.html">Service-linked roles</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceLinkedRoleARN;

/**
 <p>A policy or a list of policies that are used to select the instances to terminate. The policies are executed in the order that you list them. For more information, see <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html">Controlling which Auto Scaling instances terminate during scale in</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable terminationPolicies;

/**
 <p>A comma-separated list of subnet IDs for a virtual private cloud (VPC). If you specify <code>VPCZoneIdentifier</code> with <code>AvailabilityZones</code>, the subnets that you specify for this parameter must reside in those Availability Zones.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VPCZoneIdentifier;

@end

/**
 <p>Specifies the minimum and maximum for the <code>VCpuCount</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>
 Required parameters: [Min]
 */
@interface AWSAutoScalingVCpuCountRequest : AWSModel


/**
 <p>The maximum number of vCPUs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable max;

/**
 <p>The minimum number of vCPUs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable min;

@end

/**
 <p>Describes a warm pool configuration. </p>
 */
@interface AWSAutoScalingWarmPoolConfiguration : AWSModel


/**
 <p>The instance reuse policy.</p>
 */
@property (nonatomic, strong) AWSAutoScalingInstanceReusePolicy * _Nullable instanceReusePolicy;

/**
 <p>The maximum number of instances that are allowed to be in the warm pool or in any state except <code>Terminated</code> for the Auto Scaling group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxGroupPreparedCapacity;

/**
 <p>The minimum number of instances to maintain in the warm pool.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSize;

/**
 <p>The instance state to transition to after the lifecycle actions are complete.</p>
 */
@property (nonatomic, assign) AWSAutoScalingWarmPoolState poolState;

/**
 <p>The status of a warm pool that is marked for deletion.</p>
 */
@property (nonatomic, assign) AWSAutoScalingWarmPoolStatus status;

@end

NS_ASSUME_NONNULL_END
