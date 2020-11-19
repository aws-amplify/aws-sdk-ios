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

#import "AWSAutoScalingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSAutoScalingErrorDomain = @"com.amazonaws.AWSAutoScalingErrorDomain";

@implementation AWSAutoScalingActivitiesType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activities" : @"Activities",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)activitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingActivity class]];
}

@end

@implementation AWSAutoScalingActivity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activityId" : @"ActivityId",
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"cause" : @"Cause",
             @"detail" : @"Description",
             @"details" : @"Details",
             @"endTime" : @"EndTime",
             @"progress" : @"Progress",
             @"startTime" : @"StartTime",
             @"statusCode" : @"StatusCode",
             @"statusMessage" : @"StatusMessage",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PendingSpotBidPlacement"] == NSOrderedSame) {
            return @(AWSAutoScalingScalingActivityStatusCodePendingSpotBidPlacement);
        }
        if ([value caseInsensitiveCompare:@"WaitingForSpotInstanceRequestId"] == NSOrderedSame) {
            return @(AWSAutoScalingScalingActivityStatusCodeWaitingForSpotInstanceRequestId);
        }
        if ([value caseInsensitiveCompare:@"WaitingForSpotInstanceId"] == NSOrderedSame) {
            return @(AWSAutoScalingScalingActivityStatusCodeWaitingForSpotInstanceId);
        }
        if ([value caseInsensitiveCompare:@"WaitingForInstanceId"] == NSOrderedSame) {
            return @(AWSAutoScalingScalingActivityStatusCodeWaitingForInstanceId);
        }
        if ([value caseInsensitiveCompare:@"PreInService"] == NSOrderedSame) {
            return @(AWSAutoScalingScalingActivityStatusCodePreInService);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSAutoScalingScalingActivityStatusCodeInProgress);
        }
        if ([value caseInsensitiveCompare:@"WaitingForELBConnectionDraining"] == NSOrderedSame) {
            return @(AWSAutoScalingScalingActivityStatusCodeWaitingForELBConnectionDraining);
        }
        if ([value caseInsensitiveCompare:@"MidLifecycleAction"] == NSOrderedSame) {
            return @(AWSAutoScalingScalingActivityStatusCodeMidLifecycleAction);
        }
        if ([value caseInsensitiveCompare:@"WaitingForInstanceWarmup"] == NSOrderedSame) {
            return @(AWSAutoScalingScalingActivityStatusCodeWaitingForInstanceWarmup);
        }
        if ([value caseInsensitiveCompare:@"Successful"] == NSOrderedSame) {
            return @(AWSAutoScalingScalingActivityStatusCodeSuccessful);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSAutoScalingScalingActivityStatusCodeFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSAutoScalingScalingActivityStatusCodeCancelled);
        }
        return @(AWSAutoScalingScalingActivityStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAutoScalingScalingActivityStatusCodePendingSpotBidPlacement:
                return @"PendingSpotBidPlacement";
            case AWSAutoScalingScalingActivityStatusCodeWaitingForSpotInstanceRequestId:
                return @"WaitingForSpotInstanceRequestId";
            case AWSAutoScalingScalingActivityStatusCodeWaitingForSpotInstanceId:
                return @"WaitingForSpotInstanceId";
            case AWSAutoScalingScalingActivityStatusCodeWaitingForInstanceId:
                return @"WaitingForInstanceId";
            case AWSAutoScalingScalingActivityStatusCodePreInService:
                return @"PreInService";
            case AWSAutoScalingScalingActivityStatusCodeInProgress:
                return @"InProgress";
            case AWSAutoScalingScalingActivityStatusCodeWaitingForELBConnectionDraining:
                return @"WaitingForELBConnectionDraining";
            case AWSAutoScalingScalingActivityStatusCodeMidLifecycleAction:
                return @"MidLifecycleAction";
            case AWSAutoScalingScalingActivityStatusCodeWaitingForInstanceWarmup:
                return @"WaitingForInstanceWarmup";
            case AWSAutoScalingScalingActivityStatusCodeSuccessful:
                return @"Successful";
            case AWSAutoScalingScalingActivityStatusCodeFailed:
                return @"Failed";
            case AWSAutoScalingScalingActivityStatusCodeCancelled:
                return @"Cancelled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAutoScalingActivityType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activity" : @"Activity",
             };
}

+ (NSValueTransformer *)activityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingActivity class]];
}

@end

@implementation AWSAutoScalingAdjustmentType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adjustmentType" : @"AdjustmentType",
             };
}

@end

@implementation AWSAutoScalingAlarm

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmARN" : @"AlarmARN",
             @"alarmName" : @"AlarmName",
             };
}

@end

@implementation AWSAutoScalingAttachInstancesQuery

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceIds" : @"InstanceIds",
             };
}

@end

@implementation AWSAutoScalingAttachLoadBalancerTargetGroupsResultType

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSAutoScalingAttachLoadBalancerTargetGroupsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"targetGroupARNs" : @"TargetGroupARNs",
             };
}

@end

@implementation AWSAutoScalingAttachLoadBalancersResultType

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSAutoScalingAttachLoadBalancersType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"loadBalancerNames" : @"LoadBalancerNames",
             };
}

@end

@implementation AWSAutoScalingAutoScalingGroup

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupARN" : @"AutoScalingGroupARN",
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"availabilityZones" : @"AvailabilityZones",
             @"capacityRebalance" : @"CapacityRebalance",
             @"createdTime" : @"CreatedTime",
             @"defaultCooldown" : @"DefaultCooldown",
             @"desiredCapacity" : @"DesiredCapacity",
             @"enabledMetrics" : @"EnabledMetrics",
             @"healthCheckGracePeriod" : @"HealthCheckGracePeriod",
             @"healthCheckType" : @"HealthCheckType",
             @"instances" : @"Instances",
             @"launchConfigurationName" : @"LaunchConfigurationName",
             @"launchTemplate" : @"LaunchTemplate",
             @"loadBalancerNames" : @"LoadBalancerNames",
             @"maxInstanceLifetime" : @"MaxInstanceLifetime",
             @"maxSize" : @"MaxSize",
             @"minSize" : @"MinSize",
             @"mixedInstancesPolicy" : @"MixedInstancesPolicy",
             @"latestInstancesProtectedFromScaleIn" : @"NewInstancesProtectedFromScaleIn",
             @"placementGroup" : @"PlacementGroup",
             @"serviceLinkedRoleARN" : @"ServiceLinkedRoleARN",
             @"status" : @"Status",
             @"suspendedProcesses" : @"SuspendedProcesses",
             @"tags" : @"Tags",
             @"targetGroupARNs" : @"TargetGroupARNs",
             @"terminationPolicies" : @"TerminationPolicies",
             @"VPCZoneIdentifier" : @"VPCZoneIdentifier",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)enabledMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingEnabledMetric class]];
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingInstance class]];
}

+ (NSValueTransformer *)launchTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingLaunchTemplateSpecification class]];
}

+ (NSValueTransformer *)mixedInstancesPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingMixedInstancesPolicy class]];
}

+ (NSValueTransformer *)suspendedProcessesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingSuspendedProcess class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingTagDescription class]];
}

@end

@implementation AWSAutoScalingAutoScalingGroupNamesType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupNames" : @"AutoScalingGroupNames",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingAutoScalingGroupsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroups" : @"AutoScalingGroups",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)autoScalingGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingAutoScalingGroup class]];
}

@end

@implementation AWSAutoScalingAutoScalingInstanceDetails

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"availabilityZone" : @"AvailabilityZone",
             @"healthStatus" : @"HealthStatus",
             @"instanceId" : @"InstanceId",
             @"instanceType" : @"InstanceType",
             @"launchConfigurationName" : @"LaunchConfigurationName",
             @"launchTemplate" : @"LaunchTemplate",
             @"lifecycleState" : @"LifecycleState",
             @"protectedFromScaleIn" : @"ProtectedFromScaleIn",
             @"weightedCapacity" : @"WeightedCapacity",
             };
}

+ (NSValueTransformer *)launchTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingLaunchTemplateSpecification class]];
}

@end

@implementation AWSAutoScalingAutoScalingInstancesType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingInstances" : @"AutoScalingInstances",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)autoScalingInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingAutoScalingInstanceDetails class]];
}

@end

@implementation AWSAutoScalingBatchDeleteScheduledActionAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedScheduledActions" : @"FailedScheduledActions",
             };
}

+ (NSValueTransformer *)failedScheduledActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingFailedScheduledUpdateGroupActionRequest class]];
}

@end

@implementation AWSAutoScalingBatchDeleteScheduledActionType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"scheduledActionNames" : @"ScheduledActionNames",
             };
}

@end

@implementation AWSAutoScalingBatchPutScheduledUpdateGroupActionAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedScheduledUpdateGroupActions" : @"FailedScheduledUpdateGroupActions",
             };
}

+ (NSValueTransformer *)failedScheduledUpdateGroupActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingFailedScheduledUpdateGroupActionRequest class]];
}

@end

@implementation AWSAutoScalingBatchPutScheduledUpdateGroupActionType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"scheduledUpdateGroupActions" : @"ScheduledUpdateGroupActions",
             };
}

+ (NSValueTransformer *)scheduledUpdateGroupActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingScheduledUpdateGroupActionRequest class]];
}

@end

@implementation AWSAutoScalingBlockDeviceMapping

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceName" : @"DeviceName",
             @"ebs" : @"Ebs",
             @"noDevice" : @"NoDevice",
             @"virtualName" : @"VirtualName",
             };
}

+ (NSValueTransformer *)ebsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingEbs class]];
}

@end

@implementation AWSAutoScalingCancelInstanceRefreshAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceRefreshId" : @"InstanceRefreshId",
             };
}

@end

@implementation AWSAutoScalingCancelInstanceRefreshType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             };
}

@end

@implementation AWSAutoScalingCompleteLifecycleActionAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSAutoScalingCompleteLifecycleActionType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceId" : @"InstanceId",
             @"lifecycleActionResult" : @"LifecycleActionResult",
             @"lifecycleActionToken" : @"LifecycleActionToken",
             @"lifecycleHookName" : @"LifecycleHookName",
             };
}

@end

@implementation AWSAutoScalingCreateAutoScalingGroupType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"availabilityZones" : @"AvailabilityZones",
             @"capacityRebalance" : @"CapacityRebalance",
             @"defaultCooldown" : @"DefaultCooldown",
             @"desiredCapacity" : @"DesiredCapacity",
             @"healthCheckGracePeriod" : @"HealthCheckGracePeriod",
             @"healthCheckType" : @"HealthCheckType",
             @"instanceId" : @"InstanceId",
             @"launchConfigurationName" : @"LaunchConfigurationName",
             @"launchTemplate" : @"LaunchTemplate",
             @"lifecycleHookSpecificationList" : @"LifecycleHookSpecificationList",
             @"loadBalancerNames" : @"LoadBalancerNames",
             @"maxInstanceLifetime" : @"MaxInstanceLifetime",
             @"maxSize" : @"MaxSize",
             @"minSize" : @"MinSize",
             @"mixedInstancesPolicy" : @"MixedInstancesPolicy",
             @"latestInstancesProtectedFromScaleIn" : @"NewInstancesProtectedFromScaleIn",
             @"placementGroup" : @"PlacementGroup",
             @"serviceLinkedRoleARN" : @"ServiceLinkedRoleARN",
             @"tags" : @"Tags",
             @"targetGroupARNs" : @"TargetGroupARNs",
             @"terminationPolicies" : @"TerminationPolicies",
             @"VPCZoneIdentifier" : @"VPCZoneIdentifier",
             };
}

+ (NSValueTransformer *)launchTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingLaunchTemplateSpecification class]];
}

+ (NSValueTransformer *)lifecycleHookSpecificationListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingLifecycleHookSpecification class]];
}

+ (NSValueTransformer *)mixedInstancesPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingMixedInstancesPolicy class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingTag class]];
}

@end

@implementation AWSAutoScalingCreateLaunchConfigurationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatePublicIpAddress" : @"AssociatePublicIpAddress",
             @"blockDeviceMappings" : @"BlockDeviceMappings",
             @"classicLinkVPCId" : @"ClassicLinkVPCId",
             @"classicLinkVPCSecurityGroups" : @"ClassicLinkVPCSecurityGroups",
             @"ebsOptimized" : @"EbsOptimized",
             @"iamInstanceProfile" : @"IamInstanceProfile",
             @"imageId" : @"ImageId",
             @"instanceId" : @"InstanceId",
             @"instanceMonitoring" : @"InstanceMonitoring",
             @"instanceType" : @"InstanceType",
             @"kernelId" : @"KernelId",
             @"keyName" : @"KeyName",
             @"launchConfigurationName" : @"LaunchConfigurationName",
             @"metadataOptions" : @"MetadataOptions",
             @"placementTenancy" : @"PlacementTenancy",
             @"ramdiskId" : @"RamdiskId",
             @"securityGroups" : @"SecurityGroups",
             @"spotPrice" : @"SpotPrice",
             @"userData" : @"UserData",
             };
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingBlockDeviceMapping class]];
}

+ (NSValueTransformer *)instanceMonitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingInstanceMonitoring class]];
}

+ (NSValueTransformer *)metadataOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingInstanceMetadataOptions class]];
}

@end

@implementation AWSAutoScalingCreateOrUpdateTagsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingTag class]];
}

@end

@implementation AWSAutoScalingCustomizedMetricSpecification

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"metricName" : @"MetricName",
             @"namespace" : @"Namespace",
             @"statistic" : @"Statistic",
             @"unit" : @"Unit",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingMetricDimension class]];
}

+ (NSValueTransformer *)statisticJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Average"] == NSOrderedSame) {
            return @(AWSAutoScalingMetricStatisticAverage);
        }
        if ([value caseInsensitiveCompare:@"Minimum"] == NSOrderedSame) {
            return @(AWSAutoScalingMetricStatisticMinimum);
        }
        if ([value caseInsensitiveCompare:@"Maximum"] == NSOrderedSame) {
            return @(AWSAutoScalingMetricStatisticMaximum);
        }
        if ([value caseInsensitiveCompare:@"SampleCount"] == NSOrderedSame) {
            return @(AWSAutoScalingMetricStatisticSampleCount);
        }
        if ([value caseInsensitiveCompare:@"Sum"] == NSOrderedSame) {
            return @(AWSAutoScalingMetricStatisticSum);
        }
        return @(AWSAutoScalingMetricStatisticUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAutoScalingMetricStatisticAverage:
                return @"Average";
            case AWSAutoScalingMetricStatisticMinimum:
                return @"Minimum";
            case AWSAutoScalingMetricStatisticMaximum:
                return @"Maximum";
            case AWSAutoScalingMetricStatisticSampleCount:
                return @"SampleCount";
            case AWSAutoScalingMetricStatisticSum:
                return @"Sum";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAutoScalingDeleteAutoScalingGroupType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"forceDelete" : @"ForceDelete",
             };
}

@end

@implementation AWSAutoScalingDeleteLifecycleHookAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSAutoScalingDeleteLifecycleHookType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"lifecycleHookName" : @"LifecycleHookName",
             };
}

@end

@implementation AWSAutoScalingDeleteNotificationConfigurationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"topicARN" : @"TopicARN",
             };
}

@end

@implementation AWSAutoScalingDeletePolicyType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSAutoScalingDeleteScheduledActionType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"scheduledActionName" : @"ScheduledActionName",
             };
}

@end

@implementation AWSAutoScalingDeleteTagsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingTag class]];
}

@end

@implementation AWSAutoScalingDescribeAccountLimitsAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxNumberOfAutoScalingGroups" : @"MaxNumberOfAutoScalingGroups",
             @"maxNumberOfLaunchConfigurations" : @"MaxNumberOfLaunchConfigurations",
             @"numberOfAutoScalingGroups" : @"NumberOfAutoScalingGroups",
             @"numberOfLaunchConfigurations" : @"NumberOfLaunchConfigurations",
             };
}

@end

@implementation AWSAutoScalingDescribeAdjustmentTypesAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adjustmentTypes" : @"AdjustmentTypes",
             };
}

+ (NSValueTransformer *)adjustmentTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingAdjustmentType class]];
}

@end

@implementation AWSAutoScalingDescribeAutoScalingInstancesType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceIds" : @"InstanceIds",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingNotificationTypes" : @"AutoScalingNotificationTypes",
             };
}

@end

@implementation AWSAutoScalingDescribeInstanceRefreshesAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceRefreshes" : @"InstanceRefreshes",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instanceRefreshesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingInstanceRefresh class]];
}

@end

@implementation AWSAutoScalingDescribeInstanceRefreshesType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceRefreshIds" : @"InstanceRefreshIds",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingDescribeLifecycleHookTypesAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecycleHookTypes" : @"LifecycleHookTypes",
             };
}

@end

@implementation AWSAutoScalingDescribeLifecycleHooksAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecycleHooks" : @"LifecycleHooks",
             };
}

+ (NSValueTransformer *)lifecycleHooksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingLifecycleHook class]];
}

@end

@implementation AWSAutoScalingDescribeLifecycleHooksType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"lifecycleHookNames" : @"LifecycleHookNames",
             };
}

@end

@implementation AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerTargetGroups" : @"LoadBalancerTargetGroups",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)loadBalancerTargetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingLoadBalancerTargetGroupState class]];
}

@end

@implementation AWSAutoScalingDescribeLoadBalancersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingDescribeLoadBalancersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancers" : @"LoadBalancers",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)loadBalancersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingLoadBalancerState class]];
}

@end

@implementation AWSAutoScalingDescribeMetricCollectionTypesAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"granularities" : @"Granularities",
             @"metrics" : @"Metrics",
             };
}

+ (NSValueTransformer *)granularitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingMetricGranularityType class]];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingMetricCollectionType class]];
}

@end

@implementation AWSAutoScalingDescribeNotificationConfigurationsAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"notificationConfigurations" : @"NotificationConfigurations",
             };
}

+ (NSValueTransformer *)notificationConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingNotificationConfiguration class]];
}

@end

@implementation AWSAutoScalingDescribeNotificationConfigurationsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupNames" : @"AutoScalingGroupNames",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingDescribePoliciesType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             @"policyNames" : @"PolicyNames",
             @"policyTypes" : @"PolicyTypes",
             };
}

@end

@implementation AWSAutoScalingDescribeScalingActivitiesType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activityIds" : @"ActivityIds",
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingDescribeScheduledActionsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"endTime" : @"EndTime",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             @"scheduledActionNames" : @"ScheduledActionNames",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSAutoScalingDescribeTagsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingFilter class]];
}

@end

@implementation AWSAutoScalingDescribeTerminationPolicyTypesAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"terminationPolicyTypes" : @"TerminationPolicyTypes",
             };
}

@end

@implementation AWSAutoScalingDetachInstancesAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activities" : @"Activities",
             };
}

+ (NSValueTransformer *)activitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingActivity class]];
}

@end

@implementation AWSAutoScalingDetachInstancesQuery

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceIds" : @"InstanceIds",
             @"shouldDecrementDesiredCapacity" : @"ShouldDecrementDesiredCapacity",
             };
}

@end

@implementation AWSAutoScalingDetachLoadBalancerTargetGroupsResultType

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSAutoScalingDetachLoadBalancerTargetGroupsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"targetGroupARNs" : @"TargetGroupARNs",
             };
}

@end

@implementation AWSAutoScalingDetachLoadBalancersResultType

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSAutoScalingDetachLoadBalancersType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"loadBalancerNames" : @"LoadBalancerNames",
             };
}

@end

@implementation AWSAutoScalingDisableMetricsCollectionQuery

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"metrics" : @"Metrics",
             };
}

@end

@implementation AWSAutoScalingEbs

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteOnTermination" : @"DeleteOnTermination",
             @"encrypted" : @"Encrypted",
             @"iops" : @"Iops",
             @"snapshotId" : @"SnapshotId",
             @"volumeSize" : @"VolumeSize",
             @"volumeType" : @"VolumeType",
             };
}

@end

@implementation AWSAutoScalingEnableMetricsCollectionQuery

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"granularity" : @"Granularity",
             @"metrics" : @"Metrics",
             };
}

@end

@implementation AWSAutoScalingEnabledMetric

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"granularity" : @"Granularity",
             @"metric" : @"Metric",
             };
}

@end

@implementation AWSAutoScalingEnterStandbyAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activities" : @"Activities",
             };
}

+ (NSValueTransformer *)activitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingActivity class]];
}

@end

@implementation AWSAutoScalingEnterStandbyQuery

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceIds" : @"InstanceIds",
             @"shouldDecrementDesiredCapacity" : @"ShouldDecrementDesiredCapacity",
             };
}

@end

@implementation AWSAutoScalingExecutePolicyType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"breachThreshold" : @"BreachThreshold",
             @"honorCooldown" : @"HonorCooldown",
             @"metricValue" : @"MetricValue",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSAutoScalingExitStandbyAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activities" : @"Activities",
             };
}

+ (NSValueTransformer *)activitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingActivity class]];
}

@end

@implementation AWSAutoScalingExitStandbyQuery

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceIds" : @"InstanceIds",
             };
}

@end

@implementation AWSAutoScalingFailedScheduledUpdateGroupActionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"scheduledActionName" : @"ScheduledActionName",
             };
}

@end

@implementation AWSAutoScalingFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSAutoScalingInstance

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"healthStatus" : @"HealthStatus",
             @"instanceId" : @"InstanceId",
             @"instanceType" : @"InstanceType",
             @"launchConfigurationName" : @"LaunchConfigurationName",
             @"launchTemplate" : @"LaunchTemplate",
             @"lifecycleState" : @"LifecycleState",
             @"protectedFromScaleIn" : @"ProtectedFromScaleIn",
             @"weightedCapacity" : @"WeightedCapacity",
             };
}

+ (NSValueTransformer *)launchTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingLaunchTemplateSpecification class]];
}

+ (NSValueTransformer *)lifecycleStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSAutoScalingLifecycleStatePending);
        }
        if ([value caseInsensitiveCompare:@"Pending:Wait"] == NSOrderedSame) {
            return @(AWSAutoScalingLifecycleStatePendingWait);
        }
        if ([value caseInsensitiveCompare:@"Pending:Proceed"] == NSOrderedSame) {
            return @(AWSAutoScalingLifecycleStatePendingProceed);
        }
        if ([value caseInsensitiveCompare:@"Quarantined"] == NSOrderedSame) {
            return @(AWSAutoScalingLifecycleStateQuarantined);
        }
        if ([value caseInsensitiveCompare:@"InService"] == NSOrderedSame) {
            return @(AWSAutoScalingLifecycleStateInService);
        }
        if ([value caseInsensitiveCompare:@"Terminating"] == NSOrderedSame) {
            return @(AWSAutoScalingLifecycleStateTerminating);
        }
        if ([value caseInsensitiveCompare:@"Terminating:Wait"] == NSOrderedSame) {
            return @(AWSAutoScalingLifecycleStateTerminatingWait);
        }
        if ([value caseInsensitiveCompare:@"Terminating:Proceed"] == NSOrderedSame) {
            return @(AWSAutoScalingLifecycleStateTerminatingProceed);
        }
        if ([value caseInsensitiveCompare:@"Terminated"] == NSOrderedSame) {
            return @(AWSAutoScalingLifecycleStateTerminated);
        }
        if ([value caseInsensitiveCompare:@"Detaching"] == NSOrderedSame) {
            return @(AWSAutoScalingLifecycleStateDetaching);
        }
        if ([value caseInsensitiveCompare:@"Detached"] == NSOrderedSame) {
            return @(AWSAutoScalingLifecycleStateDetached);
        }
        if ([value caseInsensitiveCompare:@"EnteringStandby"] == NSOrderedSame) {
            return @(AWSAutoScalingLifecycleStateEnteringStandby);
        }
        if ([value caseInsensitiveCompare:@"Standby"] == NSOrderedSame) {
            return @(AWSAutoScalingLifecycleStateStandby);
        }
        return @(AWSAutoScalingLifecycleStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAutoScalingLifecycleStatePending:
                return @"Pending";
            case AWSAutoScalingLifecycleStatePendingWait:
                return @"Pending:Wait";
            case AWSAutoScalingLifecycleStatePendingProceed:
                return @"Pending:Proceed";
            case AWSAutoScalingLifecycleStateQuarantined:
                return @"Quarantined";
            case AWSAutoScalingLifecycleStateInService:
                return @"InService";
            case AWSAutoScalingLifecycleStateTerminating:
                return @"Terminating";
            case AWSAutoScalingLifecycleStateTerminatingWait:
                return @"Terminating:Wait";
            case AWSAutoScalingLifecycleStateTerminatingProceed:
                return @"Terminating:Proceed";
            case AWSAutoScalingLifecycleStateTerminated:
                return @"Terminated";
            case AWSAutoScalingLifecycleStateDetaching:
                return @"Detaching";
            case AWSAutoScalingLifecycleStateDetached:
                return @"Detached";
            case AWSAutoScalingLifecycleStateEnteringStandby:
                return @"EnteringStandby";
            case AWSAutoScalingLifecycleStateStandby:
                return @"Standby";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAutoScalingInstanceMetadataOptions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"httpEndpoint" : @"HttpEndpoint",
             @"httpPutResponseHopLimit" : @"HttpPutResponseHopLimit",
             @"httpTokens" : @"HttpTokens",
             };
}

+ (NSValueTransformer *)httpEndpointJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"disabled"] == NSOrderedSame) {
            return @(AWSAutoScalingInstanceMetadataEndpointStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"enabled"] == NSOrderedSame) {
            return @(AWSAutoScalingInstanceMetadataEndpointStateEnabled);
        }
        return @(AWSAutoScalingInstanceMetadataEndpointStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAutoScalingInstanceMetadataEndpointStateDisabled:
                return @"disabled";
            case AWSAutoScalingInstanceMetadataEndpointStateEnabled:
                return @"enabled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)httpTokensJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"optional"] == NSOrderedSame) {
            return @(AWSAutoScalingInstanceMetadataHttpTokensStateOptional);
        }
        if ([value caseInsensitiveCompare:@"required"] == NSOrderedSame) {
            return @(AWSAutoScalingInstanceMetadataHttpTokensStateRequired);
        }
        return @(AWSAutoScalingInstanceMetadataHttpTokensStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAutoScalingInstanceMetadataHttpTokensStateOptional:
                return @"optional";
            case AWSAutoScalingInstanceMetadataHttpTokensStateRequired:
                return @"required";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAutoScalingInstanceMonitoring

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSAutoScalingInstanceRefresh

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"endTime" : @"EndTime",
             @"instanceRefreshId" : @"InstanceRefreshId",
             @"instancesToUpdate" : @"InstancesToUpdate",
             @"percentageComplete" : @"PercentageComplete",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             @"statusReason" : @"StatusReason",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSAutoScalingInstanceRefreshStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSAutoScalingInstanceRefreshStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Successful"] == NSOrderedSame) {
            return @(AWSAutoScalingInstanceRefreshStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSAutoScalingInstanceRefreshStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSAutoScalingInstanceRefreshStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSAutoScalingInstanceRefreshStatusCancelled);
        }
        return @(AWSAutoScalingInstanceRefreshStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAutoScalingInstanceRefreshStatusPending:
                return @"Pending";
            case AWSAutoScalingInstanceRefreshStatusInProgress:
                return @"InProgress";
            case AWSAutoScalingInstanceRefreshStatusSuccessful:
                return @"Successful";
            case AWSAutoScalingInstanceRefreshStatusFailed:
                return @"Failed";
            case AWSAutoScalingInstanceRefreshStatusCancelling:
                return @"Cancelling";
            case AWSAutoScalingInstanceRefreshStatusCancelled:
                return @"Cancelled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAutoScalingInstancesDistribution

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"onDemandAllocationStrategy" : @"OnDemandAllocationStrategy",
             @"onDemandBaseCapacity" : @"OnDemandBaseCapacity",
             @"onDemandPercentageAboveBaseCapacity" : @"OnDemandPercentageAboveBaseCapacity",
             @"spotAllocationStrategy" : @"SpotAllocationStrategy",
             @"spotInstancePools" : @"SpotInstancePools",
             @"spotMaxPrice" : @"SpotMaxPrice",
             };
}

@end

@implementation AWSAutoScalingLaunchConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatePublicIpAddress" : @"AssociatePublicIpAddress",
             @"blockDeviceMappings" : @"BlockDeviceMappings",
             @"classicLinkVPCId" : @"ClassicLinkVPCId",
             @"classicLinkVPCSecurityGroups" : @"ClassicLinkVPCSecurityGroups",
             @"createdTime" : @"CreatedTime",
             @"ebsOptimized" : @"EbsOptimized",
             @"iamInstanceProfile" : @"IamInstanceProfile",
             @"imageId" : @"ImageId",
             @"instanceMonitoring" : @"InstanceMonitoring",
             @"instanceType" : @"InstanceType",
             @"kernelId" : @"KernelId",
             @"keyName" : @"KeyName",
             @"launchConfigurationARN" : @"LaunchConfigurationARN",
             @"launchConfigurationName" : @"LaunchConfigurationName",
             @"metadataOptions" : @"MetadataOptions",
             @"placementTenancy" : @"PlacementTenancy",
             @"ramdiskId" : @"RamdiskId",
             @"securityGroups" : @"SecurityGroups",
             @"spotPrice" : @"SpotPrice",
             @"userData" : @"UserData",
             };
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingBlockDeviceMapping class]];
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)instanceMonitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingInstanceMonitoring class]];
}

+ (NSValueTransformer *)metadataOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingInstanceMetadataOptions class]];
}

@end

@implementation AWSAutoScalingLaunchConfigurationNameType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"launchConfigurationName" : @"LaunchConfigurationName",
             };
}

@end

@implementation AWSAutoScalingLaunchConfigurationNamesType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"launchConfigurationNames" : @"LaunchConfigurationNames",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingLaunchConfigurationsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"launchConfigurations" : @"LaunchConfigurations",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)launchConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingLaunchConfiguration class]];
}

@end

@implementation AWSAutoScalingLaunchTemplate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"launchTemplateSpecification" : @"LaunchTemplateSpecification",
             @"overrides" : @"Overrides",
             };
}

+ (NSValueTransformer *)launchTemplateSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingLaunchTemplateSpecification class]];
}

+ (NSValueTransformer *)overridesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingLaunchTemplateOverrides class]];
}

@end

@implementation AWSAutoScalingLaunchTemplateOverrides

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceType" : @"InstanceType",
             @"launchTemplateSpecification" : @"LaunchTemplateSpecification",
             @"weightedCapacity" : @"WeightedCapacity",
             };
}

+ (NSValueTransformer *)launchTemplateSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingLaunchTemplateSpecification class]];
}

@end

@implementation AWSAutoScalingLaunchTemplateSpecification

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"launchTemplateId" : @"LaunchTemplateId",
             @"launchTemplateName" : @"LaunchTemplateName",
             @"version" : @"Version",
             };
}

@end

@implementation AWSAutoScalingLifecycleHook

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"defaultResult" : @"DefaultResult",
             @"globalTimeout" : @"GlobalTimeout",
             @"heartbeatTimeout" : @"HeartbeatTimeout",
             @"lifecycleHookName" : @"LifecycleHookName",
             @"lifecycleTransition" : @"LifecycleTransition",
             @"notificationMetadata" : @"NotificationMetadata",
             @"notificationTargetARN" : @"NotificationTargetARN",
             @"roleARN" : @"RoleARN",
             };
}

@end

@implementation AWSAutoScalingLifecycleHookSpecification

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultResult" : @"DefaultResult",
             @"heartbeatTimeout" : @"HeartbeatTimeout",
             @"lifecycleHookName" : @"LifecycleHookName",
             @"lifecycleTransition" : @"LifecycleTransition",
             @"notificationMetadata" : @"NotificationMetadata",
             @"notificationTargetARN" : @"NotificationTargetARN",
             @"roleARN" : @"RoleARN",
             };
}

@end

@implementation AWSAutoScalingLoadBalancerState

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"state" : @"State",
             };
}

@end

@implementation AWSAutoScalingLoadBalancerTargetGroupState

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerTargetGroupARN" : @"LoadBalancerTargetGroupARN",
             @"state" : @"State",
             };
}

@end

@implementation AWSAutoScalingMetricCollectionType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metric" : @"Metric",
             };
}

@end

@implementation AWSAutoScalingMetricDimension

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSAutoScalingMetricGranularityType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"granularity" : @"Granularity",
             };
}

@end

@implementation AWSAutoScalingMixedInstancesPolicy

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instancesDistribution" : @"InstancesDistribution",
             @"launchTemplate" : @"LaunchTemplate",
             };
}

+ (NSValueTransformer *)instancesDistributionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingInstancesDistribution class]];
}

+ (NSValueTransformer *)launchTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingLaunchTemplate class]];
}

@end

@implementation AWSAutoScalingNotificationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"notificationType" : @"NotificationType",
             @"topicARN" : @"TopicARN",
             };
}

@end

@implementation AWSAutoScalingPoliciesType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scalingPolicies" : @"ScalingPolicies",
             };
}

+ (NSValueTransformer *)scalingPoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingScalingPolicy class]];
}

@end

@implementation AWSAutoScalingPolicyARNType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarms" : @"Alarms",
             @"policyARN" : @"PolicyARN",
             };
}

+ (NSValueTransformer *)alarmsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingAlarm class]];
}

@end

@implementation AWSAutoScalingPredefinedMetricSpecification

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"predefinedMetricType" : @"PredefinedMetricType",
             @"resourceLabel" : @"ResourceLabel",
             };
}

+ (NSValueTransformer *)predefinedMetricTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASGAverageCPUUtilization"] == NSOrderedSame) {
            return @(AWSAutoScalingMetricTypeASGAverageCPUUtilization);
        }
        if ([value caseInsensitiveCompare:@"ASGAverageNetworkIn"] == NSOrderedSame) {
            return @(AWSAutoScalingMetricTypeASGAverageNetworkIn);
        }
        if ([value caseInsensitiveCompare:@"ASGAverageNetworkOut"] == NSOrderedSame) {
            return @(AWSAutoScalingMetricTypeASGAverageNetworkOut);
        }
        if ([value caseInsensitiveCompare:@"ALBRequestCountPerTarget"] == NSOrderedSame) {
            return @(AWSAutoScalingMetricTypeALBRequestCountPerTarget);
        }
        return @(AWSAutoScalingMetricTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAutoScalingMetricTypeASGAverageCPUUtilization:
                return @"ASGAverageCPUUtilization";
            case AWSAutoScalingMetricTypeASGAverageNetworkIn:
                return @"ASGAverageNetworkIn";
            case AWSAutoScalingMetricTypeASGAverageNetworkOut:
                return @"ASGAverageNetworkOut";
            case AWSAutoScalingMetricTypeALBRequestCountPerTarget:
                return @"ALBRequestCountPerTarget";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAutoScalingProcessType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processName" : @"ProcessName",
             };
}

@end

@implementation AWSAutoScalingProcessesType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processes" : @"Processes",
             };
}

+ (NSValueTransformer *)processesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingProcessType class]];
}

@end

@implementation AWSAutoScalingPutLifecycleHookAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSAutoScalingPutLifecycleHookType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"defaultResult" : @"DefaultResult",
             @"heartbeatTimeout" : @"HeartbeatTimeout",
             @"lifecycleHookName" : @"LifecycleHookName",
             @"lifecycleTransition" : @"LifecycleTransition",
             @"notificationMetadata" : @"NotificationMetadata",
             @"notificationTargetARN" : @"NotificationTargetARN",
             @"roleARN" : @"RoleARN",
             };
}

@end

@implementation AWSAutoScalingPutNotificationConfigurationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"notificationTypes" : @"NotificationTypes",
             @"topicARN" : @"TopicARN",
             };
}

@end

@implementation AWSAutoScalingPutScalingPolicyType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adjustmentType" : @"AdjustmentType",
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"cooldown" : @"Cooldown",
             @"enabled" : @"Enabled",
             @"estimatedInstanceWarmup" : @"EstimatedInstanceWarmup",
             @"metricAggregationType" : @"MetricAggregationType",
             @"minAdjustmentMagnitude" : @"MinAdjustmentMagnitude",
             @"minAdjustmentStep" : @"MinAdjustmentStep",
             @"policyName" : @"PolicyName",
             @"policyType" : @"PolicyType",
             @"scalingAdjustment" : @"ScalingAdjustment",
             @"stepAdjustments" : @"StepAdjustments",
             @"targetTrackingConfiguration" : @"TargetTrackingConfiguration",
             };
}

+ (NSValueTransformer *)stepAdjustmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingStepAdjustment class]];
}

+ (NSValueTransformer *)targetTrackingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingTargetTrackingConfiguration class]];
}

@end

@implementation AWSAutoScalingPutScheduledUpdateGroupActionType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"desiredCapacity" : @"DesiredCapacity",
             @"endTime" : @"EndTime",
             @"maxSize" : @"MaxSize",
             @"minSize" : @"MinSize",
             @"recurrence" : @"Recurrence",
             @"scheduledActionName" : @"ScheduledActionName",
             @"startTime" : @"StartTime",
             @"time" : @"Time",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)timeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSAutoScalingRecordLifecycleActionHeartbeatAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSAutoScalingRecordLifecycleActionHeartbeatType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceId" : @"InstanceId",
             @"lifecycleActionToken" : @"LifecycleActionToken",
             @"lifecycleHookName" : @"LifecycleHookName",
             };
}

@end

@implementation AWSAutoScalingRefreshPreferences

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceWarmup" : @"InstanceWarmup",
             @"minHealthyPercentage" : @"MinHealthyPercentage",
             };
}

@end

@implementation AWSAutoScalingScalingPolicy

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adjustmentType" : @"AdjustmentType",
             @"alarms" : @"Alarms",
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"cooldown" : @"Cooldown",
             @"enabled" : @"Enabled",
             @"estimatedInstanceWarmup" : @"EstimatedInstanceWarmup",
             @"metricAggregationType" : @"MetricAggregationType",
             @"minAdjustmentMagnitude" : @"MinAdjustmentMagnitude",
             @"minAdjustmentStep" : @"MinAdjustmentStep",
             @"policyARN" : @"PolicyARN",
             @"policyName" : @"PolicyName",
             @"policyType" : @"PolicyType",
             @"scalingAdjustment" : @"ScalingAdjustment",
             @"stepAdjustments" : @"StepAdjustments",
             @"targetTrackingConfiguration" : @"TargetTrackingConfiguration",
             };
}

+ (NSValueTransformer *)alarmsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingAlarm class]];
}

+ (NSValueTransformer *)stepAdjustmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingStepAdjustment class]];
}

+ (NSValueTransformer *)targetTrackingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingTargetTrackingConfiguration class]];
}

@end

@implementation AWSAutoScalingScalingProcessQuery

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"scalingProcesses" : @"ScalingProcesses",
             };
}

@end

@implementation AWSAutoScalingScheduledActionsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scheduledUpdateGroupActions" : @"ScheduledUpdateGroupActions",
             };
}

+ (NSValueTransformer *)scheduledUpdateGroupActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingScheduledUpdateGroupAction class]];
}

@end

@implementation AWSAutoScalingScheduledUpdateGroupAction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"desiredCapacity" : @"DesiredCapacity",
             @"endTime" : @"EndTime",
             @"maxSize" : @"MaxSize",
             @"minSize" : @"MinSize",
             @"recurrence" : @"Recurrence",
             @"scheduledActionARN" : @"ScheduledActionARN",
             @"scheduledActionName" : @"ScheduledActionName",
             @"startTime" : @"StartTime",
             @"time" : @"Time",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)timeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSAutoScalingScheduledUpdateGroupActionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"desiredCapacity" : @"DesiredCapacity",
             @"endTime" : @"EndTime",
             @"maxSize" : @"MaxSize",
             @"minSize" : @"MinSize",
             @"recurrence" : @"Recurrence",
             @"scheduledActionName" : @"ScheduledActionName",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSAutoScalingSetDesiredCapacityType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"desiredCapacity" : @"DesiredCapacity",
             @"honorCooldown" : @"HonorCooldown",
             };
}

@end

@implementation AWSAutoScalingSetInstanceHealthQuery

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthStatus" : @"HealthStatus",
             @"instanceId" : @"InstanceId",
             @"shouldRespectGracePeriod" : @"ShouldRespectGracePeriod",
             };
}

@end

@implementation AWSAutoScalingSetInstanceProtectionAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSAutoScalingSetInstanceProtectionQuery

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceIds" : @"InstanceIds",
             @"protectedFromScaleIn" : @"ProtectedFromScaleIn",
             };
}

@end

@implementation AWSAutoScalingStartInstanceRefreshAnswer

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceRefreshId" : @"InstanceRefreshId",
             };
}

@end

@implementation AWSAutoScalingStartInstanceRefreshType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"preferences" : @"Preferences",
             @"strategy" : @"Strategy",
             };
}

+ (NSValueTransformer *)preferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingRefreshPreferences class]];
}

+ (NSValueTransformer *)strategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Rolling"] == NSOrderedSame) {
            return @(AWSAutoScalingRefreshStrategyRolling);
        }
        return @(AWSAutoScalingRefreshStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAutoScalingRefreshStrategyRolling:
                return @"Rolling";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAutoScalingStepAdjustment

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricIntervalLowerBound" : @"MetricIntervalLowerBound",
             @"metricIntervalUpperBound" : @"MetricIntervalUpperBound",
             @"scalingAdjustment" : @"ScalingAdjustment",
             };
}

@end

@implementation AWSAutoScalingSuspendedProcess

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processName" : @"ProcessName",
             @"suspensionReason" : @"SuspensionReason",
             };
}

@end

@implementation AWSAutoScalingTag

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"propagateAtLaunch" : @"PropagateAtLaunch",
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"value" : @"Value",
             };
}

@end

@implementation AWSAutoScalingTagDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"propagateAtLaunch" : @"PropagateAtLaunch",
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"value" : @"Value",
             };
}

@end

@implementation AWSAutoScalingTagsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingTagDescription class]];
}

@end

@implementation AWSAutoScalingTargetTrackingConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customizedMetricSpecification" : @"CustomizedMetricSpecification",
             @"disableScaleIn" : @"DisableScaleIn",
             @"predefinedMetricSpecification" : @"PredefinedMetricSpecification",
             @"targetValue" : @"TargetValue",
             };
}

+ (NSValueTransformer *)customizedMetricSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingCustomizedMetricSpecification class]];
}

+ (NSValueTransformer *)predefinedMetricSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingPredefinedMetricSpecification class]];
}

@end

@implementation AWSAutoScalingTerminateInstanceInAutoScalingGroupType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"shouldDecrementDesiredCapacity" : @"ShouldDecrementDesiredCapacity",
             };
}

@end

@implementation AWSAutoScalingUpdateAutoScalingGroupType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"availabilityZones" : @"AvailabilityZones",
             @"capacityRebalance" : @"CapacityRebalance",
             @"defaultCooldown" : @"DefaultCooldown",
             @"desiredCapacity" : @"DesiredCapacity",
             @"healthCheckGracePeriod" : @"HealthCheckGracePeriod",
             @"healthCheckType" : @"HealthCheckType",
             @"launchConfigurationName" : @"LaunchConfigurationName",
             @"launchTemplate" : @"LaunchTemplate",
             @"maxInstanceLifetime" : @"MaxInstanceLifetime",
             @"maxSize" : @"MaxSize",
             @"minSize" : @"MinSize",
             @"mixedInstancesPolicy" : @"MixedInstancesPolicy",
             @"latestInstancesProtectedFromScaleIn" : @"NewInstancesProtectedFromScaleIn",
             @"placementGroup" : @"PlacementGroup",
             @"serviceLinkedRoleARN" : @"ServiceLinkedRoleARN",
             @"terminationPolicies" : @"TerminationPolicies",
             @"VPCZoneIdentifier" : @"VPCZoneIdentifier",
             };
}

+ (NSValueTransformer *)launchTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingLaunchTemplateSpecification class]];
}

+ (NSValueTransformer *)mixedInstancesPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAutoScalingMixedInstancesPolicy class]];
}

@end
