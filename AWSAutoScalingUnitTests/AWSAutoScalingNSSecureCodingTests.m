//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSAutoScalingModel.h"

@interface AWSAutoScalingNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSAutoScalingAcceleratorCountRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAcceleratorTotalMemoryMiBRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingActivitiesType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingActivity API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingActivityType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAdjustmentType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAlarm API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAlarmSpecification API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAttachInstancesQuery API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAttachLoadBalancerTargetGroupsResultType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAttachLoadBalancerTargetGroupsType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAttachLoadBalancersResultType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAttachLoadBalancersType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAttachTrafficSourcesResultType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAttachTrafficSourcesType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAutoScalingGroup API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAutoScalingGroupNamesType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAutoScalingGroupsType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAutoScalingInstanceDetails API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingAutoScalingInstancesType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingBaselineEbsBandwidthMbpsRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingBatchDeleteScheduledActionAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingBatchDeleteScheduledActionType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingBatchPutScheduledUpdateGroupActionAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingBatchPutScheduledUpdateGroupActionType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingBlockDeviceMapping API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingCancelInstanceRefreshAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingCancelInstanceRefreshType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingCapacityForecast API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingCompleteLifecycleActionAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingCompleteLifecycleActionType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingCreateAutoScalingGroupType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingCreateLaunchConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingCreateOrUpdateTagsType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingCustomizedMetricSpecification API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDeleteAutoScalingGroupType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDeleteLifecycleHookAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDeleteLifecycleHookType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDeleteNotificationConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDeletePolicyType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDeleteScheduledActionType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDeleteTagsType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDeleteWarmPoolAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDeleteWarmPoolType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeAccountLimitsAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeAdjustmentTypesAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeAutoScalingInstancesType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeInstanceRefreshesAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeInstanceRefreshesType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeLifecycleHookTypesAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeLifecycleHooksAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeLifecycleHooksType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeLoadBalancersRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeLoadBalancersResponse API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeMetricCollectionTypesAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeNotificationConfigurationsAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeNotificationConfigurationsType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribePoliciesType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeScalingActivitiesType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeScheduledActionsType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeTagsType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeTerminationPolicyTypesAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeTrafficSourcesRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeTrafficSourcesResponse API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeWarmPoolAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDescribeWarmPoolType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDesiredConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDetachInstancesAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDetachInstancesQuery API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDetachLoadBalancerTargetGroupsResultType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDetachLoadBalancerTargetGroupsType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDetachLoadBalancersResultType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDetachLoadBalancersType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDetachTrafficSourcesResultType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDetachTrafficSourcesType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingDisableMetricsCollectionQuery API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingEbs API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingEnableMetricsCollectionQuery API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingEnabledMetric API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingEnterStandbyAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingEnterStandbyQuery API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingExecutePolicyType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingExitStandbyAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingExitStandbyQuery API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingFailedScheduledUpdateGroupActionRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingFilter API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingGetPredictiveScalingForecastAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingGetPredictiveScalingForecastType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingInstance API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingInstanceMaintenancePolicy API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingInstanceMetadataOptions API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingInstanceMonitoring API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingInstanceRefresh API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingInstanceRefreshLivePoolProgress API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingInstanceRefreshProgressDetails API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingInstanceRefreshWarmPoolProgress API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingInstanceRequirements API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingInstanceReusePolicy API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingInstancesDistribution API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingLaunchConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingLaunchConfigurationNameType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingLaunchConfigurationNamesType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingLaunchConfigurationsType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingLaunchTemplate API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingLaunchTemplateOverrides API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingLaunchTemplateSpecification API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingLifecycleHook API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingLifecycleHookSpecification API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingLoadBalancerState API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingLoadBalancerTargetGroupState API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingLoadForecast API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingMemoryGiBPerVCpuRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingMemoryMiBRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingMetric API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingMetricCollectionType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingMetricDataQuery API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingMetricDimension API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingMetricGranularityType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingMetricStat API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingMixedInstancesPolicy API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingNetworkBandwidthGbpsRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingNetworkInterfaceCountRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingNotificationConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPoliciesType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPolicyARNType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPredefinedMetricSpecification API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPredictiveScalingConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPredictiveScalingCustomizedCapacityMetric API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPredictiveScalingCustomizedLoadMetric API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPredictiveScalingCustomizedScalingMetric API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPredictiveScalingMetricSpecification API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPredictiveScalingPredefinedLoadMetric API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPredictiveScalingPredefinedMetricPair API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPredictiveScalingPredefinedScalingMetric API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingProcessType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingProcessesType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPutLifecycleHookAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPutLifecycleHookType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPutNotificationConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPutScalingPolicyType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPutScheduledUpdateGroupActionType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPutWarmPoolAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingPutWarmPoolType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingRecordLifecycleActionHeartbeatAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingRecordLifecycleActionHeartbeatType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingRefreshPreferences API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingRollbackDetails API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingRollbackInstanceRefreshAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingRollbackInstanceRefreshType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingScalingPolicy API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingScalingProcessQuery API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingScheduledActionsType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingScheduledUpdateGroupAction API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingScheduledUpdateGroupActionRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingSetDesiredCapacityType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingSetInstanceHealthQuery API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingSetInstanceProtectionAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingSetInstanceProtectionQuery API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingStartInstanceRefreshAnswer API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingStartInstanceRefreshType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingStepAdjustment API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingSuspendedProcess API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingTag API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingTagDescription API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingTagsType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingTargetTrackingConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingTargetTrackingMetricDataQuery API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingTargetTrackingMetricStat API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingTerminateInstanceInAutoScalingGroupType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingTotalLocalStorageGBRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingTrafficSourceIdentifier API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingTrafficSourceState API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingUpdateAutoScalingGroupType API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingVCpuCountRequest API_AVAILABLE(ios(11));
- (void) test_AWSAutoScalingWarmPoolConfiguration API_AVAILABLE(ios(11));

@end

@implementation AWSAutoScalingNSSecureCodingTests

- (void) test_AWSAutoScalingAcceleratorCountRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingAcceleratorCountRequest class]];
}

- (void) test_AWSAutoScalingAcceleratorTotalMemoryMiBRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingAcceleratorTotalMemoryMiBRequest class]];
}

- (void) test_AWSAutoScalingActivitiesType {
    [self validateSecureCodingForClass:[AWSAutoScalingActivitiesType class]];
}

- (void) test_AWSAutoScalingActivity {
    [self validateSecureCodingForClass:[AWSAutoScalingActivity class]];
}

- (void) test_AWSAutoScalingActivityType {
    [self validateSecureCodingForClass:[AWSAutoScalingActivityType class]];
}

- (void) test_AWSAutoScalingAdjustmentType {
    [self validateSecureCodingForClass:[AWSAutoScalingAdjustmentType class]];
}

- (void) test_AWSAutoScalingAlarm {
    [self validateSecureCodingForClass:[AWSAutoScalingAlarm class]];
}

- (void) test_AWSAutoScalingAlarmSpecification {
    [self validateSecureCodingForClass:[AWSAutoScalingAlarmSpecification class]];
}

- (void) test_AWSAutoScalingAttachInstancesQuery {
    [self validateSecureCodingForClass:[AWSAutoScalingAttachInstancesQuery class]];
}

- (void) test_AWSAutoScalingAttachLoadBalancerTargetGroupsResultType {
    [self validateSecureCodingForClass:[AWSAutoScalingAttachLoadBalancerTargetGroupsResultType class]];
}

- (void) test_AWSAutoScalingAttachLoadBalancerTargetGroupsType {
    [self validateSecureCodingForClass:[AWSAutoScalingAttachLoadBalancerTargetGroupsType class]];
}

- (void) test_AWSAutoScalingAttachLoadBalancersResultType {
    [self validateSecureCodingForClass:[AWSAutoScalingAttachLoadBalancersResultType class]];
}

- (void) test_AWSAutoScalingAttachLoadBalancersType {
    [self validateSecureCodingForClass:[AWSAutoScalingAttachLoadBalancersType class]];
}

- (void) test_AWSAutoScalingAttachTrafficSourcesResultType {
    [self validateSecureCodingForClass:[AWSAutoScalingAttachTrafficSourcesResultType class]];
}

- (void) test_AWSAutoScalingAttachTrafficSourcesType {
    [self validateSecureCodingForClass:[AWSAutoScalingAttachTrafficSourcesType class]];
}

- (void) test_AWSAutoScalingAutoScalingGroup {
    [self validateSecureCodingForClass:[AWSAutoScalingAutoScalingGroup class]];
}

- (void) test_AWSAutoScalingAutoScalingGroupNamesType {
    [self validateSecureCodingForClass:[AWSAutoScalingAutoScalingGroupNamesType class]];
}

- (void) test_AWSAutoScalingAutoScalingGroupsType {
    [self validateSecureCodingForClass:[AWSAutoScalingAutoScalingGroupsType class]];
}

- (void) test_AWSAutoScalingAutoScalingInstanceDetails {
    [self validateSecureCodingForClass:[AWSAutoScalingAutoScalingInstanceDetails class]];
}

- (void) test_AWSAutoScalingAutoScalingInstancesType {
    [self validateSecureCodingForClass:[AWSAutoScalingAutoScalingInstancesType class]];
}

- (void) test_AWSAutoScalingBaselineEbsBandwidthMbpsRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingBaselineEbsBandwidthMbpsRequest class]];
}

- (void) test_AWSAutoScalingBatchDeleteScheduledActionAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingBatchDeleteScheduledActionAnswer class]];
}

- (void) test_AWSAutoScalingBatchDeleteScheduledActionType {
    [self validateSecureCodingForClass:[AWSAutoScalingBatchDeleteScheduledActionType class]];
}

- (void) test_AWSAutoScalingBatchPutScheduledUpdateGroupActionAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingBatchPutScheduledUpdateGroupActionAnswer class]];
}

- (void) test_AWSAutoScalingBatchPutScheduledUpdateGroupActionType {
    [self validateSecureCodingForClass:[AWSAutoScalingBatchPutScheduledUpdateGroupActionType class]];
}

- (void) test_AWSAutoScalingBlockDeviceMapping {
    [self validateSecureCodingForClass:[AWSAutoScalingBlockDeviceMapping class]];
}

- (void) test_AWSAutoScalingCancelInstanceRefreshAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingCancelInstanceRefreshAnswer class]];
}

- (void) test_AWSAutoScalingCancelInstanceRefreshType {
    [self validateSecureCodingForClass:[AWSAutoScalingCancelInstanceRefreshType class]];
}

- (void) test_AWSAutoScalingCapacityForecast {
    [self validateSecureCodingForClass:[AWSAutoScalingCapacityForecast class]];
}

- (void) test_AWSAutoScalingCompleteLifecycleActionAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingCompleteLifecycleActionAnswer class]];
}

- (void) test_AWSAutoScalingCompleteLifecycleActionType {
    [self validateSecureCodingForClass:[AWSAutoScalingCompleteLifecycleActionType class]];
}

- (void) test_AWSAutoScalingCreateAutoScalingGroupType {
    [self validateSecureCodingForClass:[AWSAutoScalingCreateAutoScalingGroupType class]];
}

- (void) test_AWSAutoScalingCreateLaunchConfigurationType {
    [self validateSecureCodingForClass:[AWSAutoScalingCreateLaunchConfigurationType class]];
}

- (void) test_AWSAutoScalingCreateOrUpdateTagsType {
    [self validateSecureCodingForClass:[AWSAutoScalingCreateOrUpdateTagsType class]];
}

- (void) test_AWSAutoScalingCustomizedMetricSpecification {
    [self validateSecureCodingForClass:[AWSAutoScalingCustomizedMetricSpecification class]];
}

- (void) test_AWSAutoScalingDeleteAutoScalingGroupType {
    [self validateSecureCodingForClass:[AWSAutoScalingDeleteAutoScalingGroupType class]];
}

- (void) test_AWSAutoScalingDeleteLifecycleHookAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingDeleteLifecycleHookAnswer class]];
}

- (void) test_AWSAutoScalingDeleteLifecycleHookType {
    [self validateSecureCodingForClass:[AWSAutoScalingDeleteLifecycleHookType class]];
}

- (void) test_AWSAutoScalingDeleteNotificationConfigurationType {
    [self validateSecureCodingForClass:[AWSAutoScalingDeleteNotificationConfigurationType class]];
}

- (void) test_AWSAutoScalingDeletePolicyType {
    [self validateSecureCodingForClass:[AWSAutoScalingDeletePolicyType class]];
}

- (void) test_AWSAutoScalingDeleteScheduledActionType {
    [self validateSecureCodingForClass:[AWSAutoScalingDeleteScheduledActionType class]];
}

- (void) test_AWSAutoScalingDeleteTagsType {
    [self validateSecureCodingForClass:[AWSAutoScalingDeleteTagsType class]];
}

- (void) test_AWSAutoScalingDeleteWarmPoolAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingDeleteWarmPoolAnswer class]];
}

- (void) test_AWSAutoScalingDeleteWarmPoolType {
    [self validateSecureCodingForClass:[AWSAutoScalingDeleteWarmPoolType class]];
}

- (void) test_AWSAutoScalingDescribeAccountLimitsAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeAccountLimitsAnswer class]];
}

- (void) test_AWSAutoScalingDescribeAdjustmentTypesAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeAdjustmentTypesAnswer class]];
}

- (void) test_AWSAutoScalingDescribeAutoScalingInstancesType {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeAutoScalingInstancesType class]];
}

- (void) test_AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer class]];
}

- (void) test_AWSAutoScalingDescribeInstanceRefreshesAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeInstanceRefreshesAnswer class]];
}

- (void) test_AWSAutoScalingDescribeInstanceRefreshesType {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeInstanceRefreshesType class]];
}

- (void) test_AWSAutoScalingDescribeLifecycleHookTypesAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeLifecycleHookTypesAnswer class]];
}

- (void) test_AWSAutoScalingDescribeLifecycleHooksAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeLifecycleHooksAnswer class]];
}

- (void) test_AWSAutoScalingDescribeLifecycleHooksType {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeLifecycleHooksType class]];
}

- (void) test_AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest class]];
}

- (void) test_AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse class]];
}

- (void) test_AWSAutoScalingDescribeLoadBalancersRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeLoadBalancersRequest class]];
}

- (void) test_AWSAutoScalingDescribeLoadBalancersResponse {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeLoadBalancersResponse class]];
}

- (void) test_AWSAutoScalingDescribeMetricCollectionTypesAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeMetricCollectionTypesAnswer class]];
}

- (void) test_AWSAutoScalingDescribeNotificationConfigurationsAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeNotificationConfigurationsAnswer class]];
}

- (void) test_AWSAutoScalingDescribeNotificationConfigurationsType {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeNotificationConfigurationsType class]];
}

- (void) test_AWSAutoScalingDescribePoliciesType {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribePoliciesType class]];
}

- (void) test_AWSAutoScalingDescribeScalingActivitiesType {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeScalingActivitiesType class]];
}

- (void) test_AWSAutoScalingDescribeScheduledActionsType {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeScheduledActionsType class]];
}

- (void) test_AWSAutoScalingDescribeTagsType {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeTagsType class]];
}

- (void) test_AWSAutoScalingDescribeTerminationPolicyTypesAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeTerminationPolicyTypesAnswer class]];
}

- (void) test_AWSAutoScalingDescribeTrafficSourcesRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeTrafficSourcesRequest class]];
}

- (void) test_AWSAutoScalingDescribeTrafficSourcesResponse {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeTrafficSourcesResponse class]];
}

- (void) test_AWSAutoScalingDescribeWarmPoolAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeWarmPoolAnswer class]];
}

- (void) test_AWSAutoScalingDescribeWarmPoolType {
    [self validateSecureCodingForClass:[AWSAutoScalingDescribeWarmPoolType class]];
}

- (void) test_AWSAutoScalingDesiredConfiguration {
    [self validateSecureCodingForClass:[AWSAutoScalingDesiredConfiguration class]];
}

- (void) test_AWSAutoScalingDetachInstancesAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingDetachInstancesAnswer class]];
}

- (void) test_AWSAutoScalingDetachInstancesQuery {
    [self validateSecureCodingForClass:[AWSAutoScalingDetachInstancesQuery class]];
}

- (void) test_AWSAutoScalingDetachLoadBalancerTargetGroupsResultType {
    [self validateSecureCodingForClass:[AWSAutoScalingDetachLoadBalancerTargetGroupsResultType class]];
}

- (void) test_AWSAutoScalingDetachLoadBalancerTargetGroupsType {
    [self validateSecureCodingForClass:[AWSAutoScalingDetachLoadBalancerTargetGroupsType class]];
}

- (void) test_AWSAutoScalingDetachLoadBalancersResultType {
    [self validateSecureCodingForClass:[AWSAutoScalingDetachLoadBalancersResultType class]];
}

- (void) test_AWSAutoScalingDetachLoadBalancersType {
    [self validateSecureCodingForClass:[AWSAutoScalingDetachLoadBalancersType class]];
}

- (void) test_AWSAutoScalingDetachTrafficSourcesResultType {
    [self validateSecureCodingForClass:[AWSAutoScalingDetachTrafficSourcesResultType class]];
}

- (void) test_AWSAutoScalingDetachTrafficSourcesType {
    [self validateSecureCodingForClass:[AWSAutoScalingDetachTrafficSourcesType class]];
}

- (void) test_AWSAutoScalingDisableMetricsCollectionQuery {
    [self validateSecureCodingForClass:[AWSAutoScalingDisableMetricsCollectionQuery class]];
}

- (void) test_AWSAutoScalingEbs {
    [self validateSecureCodingForClass:[AWSAutoScalingEbs class]];
}

- (void) test_AWSAutoScalingEnableMetricsCollectionQuery {
    [self validateSecureCodingForClass:[AWSAutoScalingEnableMetricsCollectionQuery class]];
}

- (void) test_AWSAutoScalingEnabledMetric {
    [self validateSecureCodingForClass:[AWSAutoScalingEnabledMetric class]];
}

- (void) test_AWSAutoScalingEnterStandbyAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingEnterStandbyAnswer class]];
}

- (void) test_AWSAutoScalingEnterStandbyQuery {
    [self validateSecureCodingForClass:[AWSAutoScalingEnterStandbyQuery class]];
}

- (void) test_AWSAutoScalingExecutePolicyType {
    [self validateSecureCodingForClass:[AWSAutoScalingExecutePolicyType class]];
}

- (void) test_AWSAutoScalingExitStandbyAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingExitStandbyAnswer class]];
}

- (void) test_AWSAutoScalingExitStandbyQuery {
    [self validateSecureCodingForClass:[AWSAutoScalingExitStandbyQuery class]];
}

- (void) test_AWSAutoScalingFailedScheduledUpdateGroupActionRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingFailedScheduledUpdateGroupActionRequest class]];
}

- (void) test_AWSAutoScalingFilter {
    [self validateSecureCodingForClass:[AWSAutoScalingFilter class]];
}

- (void) test_AWSAutoScalingGetPredictiveScalingForecastAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingGetPredictiveScalingForecastAnswer class]];
}

- (void) test_AWSAutoScalingGetPredictiveScalingForecastType {
    [self validateSecureCodingForClass:[AWSAutoScalingGetPredictiveScalingForecastType class]];
}

- (void) test_AWSAutoScalingInstance {
    [self validateSecureCodingForClass:[AWSAutoScalingInstance class]];
}

- (void) test_AWSAutoScalingInstanceMaintenancePolicy {
    [self validateSecureCodingForClass:[AWSAutoScalingInstanceMaintenancePolicy class]];
}

- (void) test_AWSAutoScalingInstanceMetadataOptions {
    [self validateSecureCodingForClass:[AWSAutoScalingInstanceMetadataOptions class]];
}

- (void) test_AWSAutoScalingInstanceMonitoring {
    [self validateSecureCodingForClass:[AWSAutoScalingInstanceMonitoring class]];
}

- (void) test_AWSAutoScalingInstanceRefresh {
    [self validateSecureCodingForClass:[AWSAutoScalingInstanceRefresh class]];
}

- (void) test_AWSAutoScalingInstanceRefreshLivePoolProgress {
    [self validateSecureCodingForClass:[AWSAutoScalingInstanceRefreshLivePoolProgress class]];
}

- (void) test_AWSAutoScalingInstanceRefreshProgressDetails {
    [self validateSecureCodingForClass:[AWSAutoScalingInstanceRefreshProgressDetails class]];
}

- (void) test_AWSAutoScalingInstanceRefreshWarmPoolProgress {
    [self validateSecureCodingForClass:[AWSAutoScalingInstanceRefreshWarmPoolProgress class]];
}

- (void) test_AWSAutoScalingInstanceRequirements {
    [self validateSecureCodingForClass:[AWSAutoScalingInstanceRequirements class]];
}

- (void) test_AWSAutoScalingInstanceReusePolicy {
    [self validateSecureCodingForClass:[AWSAutoScalingInstanceReusePolicy class]];
}

- (void) test_AWSAutoScalingInstancesDistribution {
    [self validateSecureCodingForClass:[AWSAutoScalingInstancesDistribution class]];
}

- (void) test_AWSAutoScalingLaunchConfiguration {
    [self validateSecureCodingForClass:[AWSAutoScalingLaunchConfiguration class]];
}

- (void) test_AWSAutoScalingLaunchConfigurationNameType {
    [self validateSecureCodingForClass:[AWSAutoScalingLaunchConfigurationNameType class]];
}

- (void) test_AWSAutoScalingLaunchConfigurationNamesType {
    [self validateSecureCodingForClass:[AWSAutoScalingLaunchConfigurationNamesType class]];
}

- (void) test_AWSAutoScalingLaunchConfigurationsType {
    [self validateSecureCodingForClass:[AWSAutoScalingLaunchConfigurationsType class]];
}

- (void) test_AWSAutoScalingLaunchTemplate {
    [self validateSecureCodingForClass:[AWSAutoScalingLaunchTemplate class]];
}

- (void) test_AWSAutoScalingLaunchTemplateOverrides {
    [self validateSecureCodingForClass:[AWSAutoScalingLaunchTemplateOverrides class]];
}

- (void) test_AWSAutoScalingLaunchTemplateSpecification {
    [self validateSecureCodingForClass:[AWSAutoScalingLaunchTemplateSpecification class]];
}

- (void) test_AWSAutoScalingLifecycleHook {
    [self validateSecureCodingForClass:[AWSAutoScalingLifecycleHook class]];
}

- (void) test_AWSAutoScalingLifecycleHookSpecification {
    [self validateSecureCodingForClass:[AWSAutoScalingLifecycleHookSpecification class]];
}

- (void) test_AWSAutoScalingLoadBalancerState {
    [self validateSecureCodingForClass:[AWSAutoScalingLoadBalancerState class]];
}

- (void) test_AWSAutoScalingLoadBalancerTargetGroupState {
    [self validateSecureCodingForClass:[AWSAutoScalingLoadBalancerTargetGroupState class]];
}

- (void) test_AWSAutoScalingLoadForecast {
    [self validateSecureCodingForClass:[AWSAutoScalingLoadForecast class]];
}

- (void) test_AWSAutoScalingMemoryGiBPerVCpuRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingMemoryGiBPerVCpuRequest class]];
}

- (void) test_AWSAutoScalingMemoryMiBRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingMemoryMiBRequest class]];
}

- (void) test_AWSAutoScalingMetric {
    [self validateSecureCodingForClass:[AWSAutoScalingMetric class]];
}

- (void) test_AWSAutoScalingMetricCollectionType {
    [self validateSecureCodingForClass:[AWSAutoScalingMetricCollectionType class]];
}

- (void) test_AWSAutoScalingMetricDataQuery {
    [self validateSecureCodingForClass:[AWSAutoScalingMetricDataQuery class]];
}

- (void) test_AWSAutoScalingMetricDimension {
    [self validateSecureCodingForClass:[AWSAutoScalingMetricDimension class]];
}

- (void) test_AWSAutoScalingMetricGranularityType {
    [self validateSecureCodingForClass:[AWSAutoScalingMetricGranularityType class]];
}

- (void) test_AWSAutoScalingMetricStat {
    [self validateSecureCodingForClass:[AWSAutoScalingMetricStat class]];
}

- (void) test_AWSAutoScalingMixedInstancesPolicy {
    [self validateSecureCodingForClass:[AWSAutoScalingMixedInstancesPolicy class]];
}

- (void) test_AWSAutoScalingNetworkBandwidthGbpsRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingNetworkBandwidthGbpsRequest class]];
}

- (void) test_AWSAutoScalingNetworkInterfaceCountRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingNetworkInterfaceCountRequest class]];
}

- (void) test_AWSAutoScalingNotificationConfiguration {
    [self validateSecureCodingForClass:[AWSAutoScalingNotificationConfiguration class]];
}

- (void) test_AWSAutoScalingPoliciesType {
    [self validateSecureCodingForClass:[AWSAutoScalingPoliciesType class]];
}

- (void) test_AWSAutoScalingPolicyARNType {
    [self validateSecureCodingForClass:[AWSAutoScalingPolicyARNType class]];
}

- (void) test_AWSAutoScalingPredefinedMetricSpecification {
    [self validateSecureCodingForClass:[AWSAutoScalingPredefinedMetricSpecification class]];
}

- (void) test_AWSAutoScalingPredictiveScalingConfiguration {
    [self validateSecureCodingForClass:[AWSAutoScalingPredictiveScalingConfiguration class]];
}

- (void) test_AWSAutoScalingPredictiveScalingCustomizedCapacityMetric {
    [self validateSecureCodingForClass:[AWSAutoScalingPredictiveScalingCustomizedCapacityMetric class]];
}

- (void) test_AWSAutoScalingPredictiveScalingCustomizedLoadMetric {
    [self validateSecureCodingForClass:[AWSAutoScalingPredictiveScalingCustomizedLoadMetric class]];
}

- (void) test_AWSAutoScalingPredictiveScalingCustomizedScalingMetric {
    [self validateSecureCodingForClass:[AWSAutoScalingPredictiveScalingCustomizedScalingMetric class]];
}

- (void) test_AWSAutoScalingPredictiveScalingMetricSpecification {
    [self validateSecureCodingForClass:[AWSAutoScalingPredictiveScalingMetricSpecification class]];
}

- (void) test_AWSAutoScalingPredictiveScalingPredefinedLoadMetric {
    [self validateSecureCodingForClass:[AWSAutoScalingPredictiveScalingPredefinedLoadMetric class]];
}

- (void) test_AWSAutoScalingPredictiveScalingPredefinedMetricPair {
    [self validateSecureCodingForClass:[AWSAutoScalingPredictiveScalingPredefinedMetricPair class]];
}

- (void) test_AWSAutoScalingPredictiveScalingPredefinedScalingMetric {
    [self validateSecureCodingForClass:[AWSAutoScalingPredictiveScalingPredefinedScalingMetric class]];
}

- (void) test_AWSAutoScalingProcessType {
    [self validateSecureCodingForClass:[AWSAutoScalingProcessType class]];
}

- (void) test_AWSAutoScalingProcessesType {
    [self validateSecureCodingForClass:[AWSAutoScalingProcessesType class]];
}

- (void) test_AWSAutoScalingPutLifecycleHookAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingPutLifecycleHookAnswer class]];
}

- (void) test_AWSAutoScalingPutLifecycleHookType {
    [self validateSecureCodingForClass:[AWSAutoScalingPutLifecycleHookType class]];
}

- (void) test_AWSAutoScalingPutNotificationConfigurationType {
    [self validateSecureCodingForClass:[AWSAutoScalingPutNotificationConfigurationType class]];
}

- (void) test_AWSAutoScalingPutScalingPolicyType {
    [self validateSecureCodingForClass:[AWSAutoScalingPutScalingPolicyType class]];
}

- (void) test_AWSAutoScalingPutScheduledUpdateGroupActionType {
    [self validateSecureCodingForClass:[AWSAutoScalingPutScheduledUpdateGroupActionType class]];
}

- (void) test_AWSAutoScalingPutWarmPoolAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingPutWarmPoolAnswer class]];
}

- (void) test_AWSAutoScalingPutWarmPoolType {
    [self validateSecureCodingForClass:[AWSAutoScalingPutWarmPoolType class]];
}

- (void) test_AWSAutoScalingRecordLifecycleActionHeartbeatAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingRecordLifecycleActionHeartbeatAnswer class]];
}

- (void) test_AWSAutoScalingRecordLifecycleActionHeartbeatType {
    [self validateSecureCodingForClass:[AWSAutoScalingRecordLifecycleActionHeartbeatType class]];
}

- (void) test_AWSAutoScalingRefreshPreferences {
    [self validateSecureCodingForClass:[AWSAutoScalingRefreshPreferences class]];
}

- (void) test_AWSAutoScalingRollbackDetails {
    [self validateSecureCodingForClass:[AWSAutoScalingRollbackDetails class]];
}

- (void) test_AWSAutoScalingRollbackInstanceRefreshAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingRollbackInstanceRefreshAnswer class]];
}

- (void) test_AWSAutoScalingRollbackInstanceRefreshType {
    [self validateSecureCodingForClass:[AWSAutoScalingRollbackInstanceRefreshType class]];
}

- (void) test_AWSAutoScalingScalingPolicy {
    [self validateSecureCodingForClass:[AWSAutoScalingScalingPolicy class]];
}

- (void) test_AWSAutoScalingScalingProcessQuery {
    [self validateSecureCodingForClass:[AWSAutoScalingScalingProcessQuery class]];
}

- (void) test_AWSAutoScalingScheduledActionsType {
    [self validateSecureCodingForClass:[AWSAutoScalingScheduledActionsType class]];
}

- (void) test_AWSAutoScalingScheduledUpdateGroupAction {
    [self validateSecureCodingForClass:[AWSAutoScalingScheduledUpdateGroupAction class]];
}

- (void) test_AWSAutoScalingScheduledUpdateGroupActionRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingScheduledUpdateGroupActionRequest class]];
}

- (void) test_AWSAutoScalingSetDesiredCapacityType {
    [self validateSecureCodingForClass:[AWSAutoScalingSetDesiredCapacityType class]];
}

- (void) test_AWSAutoScalingSetInstanceHealthQuery {
    [self validateSecureCodingForClass:[AWSAutoScalingSetInstanceHealthQuery class]];
}

- (void) test_AWSAutoScalingSetInstanceProtectionAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingSetInstanceProtectionAnswer class]];
}

- (void) test_AWSAutoScalingSetInstanceProtectionQuery {
    [self validateSecureCodingForClass:[AWSAutoScalingSetInstanceProtectionQuery class]];
}

- (void) test_AWSAutoScalingStartInstanceRefreshAnswer {
    [self validateSecureCodingForClass:[AWSAutoScalingStartInstanceRefreshAnswer class]];
}

- (void) test_AWSAutoScalingStartInstanceRefreshType {
    [self validateSecureCodingForClass:[AWSAutoScalingStartInstanceRefreshType class]];
}

- (void) test_AWSAutoScalingStepAdjustment {
    [self validateSecureCodingForClass:[AWSAutoScalingStepAdjustment class]];
}

- (void) test_AWSAutoScalingSuspendedProcess {
    [self validateSecureCodingForClass:[AWSAutoScalingSuspendedProcess class]];
}

- (void) test_AWSAutoScalingTag {
    [self validateSecureCodingForClass:[AWSAutoScalingTag class]];
}

- (void) test_AWSAutoScalingTagDescription {
    [self validateSecureCodingForClass:[AWSAutoScalingTagDescription class]];
}

- (void) test_AWSAutoScalingTagsType {
    [self validateSecureCodingForClass:[AWSAutoScalingTagsType class]];
}

- (void) test_AWSAutoScalingTargetTrackingConfiguration {
    [self validateSecureCodingForClass:[AWSAutoScalingTargetTrackingConfiguration class]];
}

- (void) test_AWSAutoScalingTargetTrackingMetricDataQuery {
    [self validateSecureCodingForClass:[AWSAutoScalingTargetTrackingMetricDataQuery class]];
}

- (void) test_AWSAutoScalingTargetTrackingMetricStat {
    [self validateSecureCodingForClass:[AWSAutoScalingTargetTrackingMetricStat class]];
}

- (void) test_AWSAutoScalingTerminateInstanceInAutoScalingGroupType {
    [self validateSecureCodingForClass:[AWSAutoScalingTerminateInstanceInAutoScalingGroupType class]];
}

- (void) test_AWSAutoScalingTotalLocalStorageGBRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingTotalLocalStorageGBRequest class]];
}

- (void) test_AWSAutoScalingTrafficSourceIdentifier {
    [self validateSecureCodingForClass:[AWSAutoScalingTrafficSourceIdentifier class]];
}

- (void) test_AWSAutoScalingTrafficSourceState {
    [self validateSecureCodingForClass:[AWSAutoScalingTrafficSourceState class]];
}

- (void) test_AWSAutoScalingUpdateAutoScalingGroupType {
    [self validateSecureCodingForClass:[AWSAutoScalingUpdateAutoScalingGroupType class]];
}

- (void) test_AWSAutoScalingVCpuCountRequest {
    [self validateSecureCodingForClass:[AWSAutoScalingVCpuCountRequest class]];
}

- (void) test_AWSAutoScalingWarmPoolConfiguration {
    [self validateSecureCodingForClass:[AWSAutoScalingWarmPoolConfiguration class]];
}

@end

