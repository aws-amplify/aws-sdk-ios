//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adjustmentType" : @"AdjustmentType",
             };
}

@end

@implementation AWSAutoScalingAlarm

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmARN" : @"AlarmARN",
             @"alarmName" : @"AlarmName",
             };
}

@end

@implementation AWSAutoScalingAttachInstancesQuery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceIds" : @"InstanceIds",
             };
}

@end

@implementation AWSAutoScalingAttachLoadBalancerTargetGroupsResultType

@end

@implementation AWSAutoScalingAttachLoadBalancerTargetGroupsType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"targetGroupARNs" : @"TargetGroupARNs",
             };
}

@end

@implementation AWSAutoScalingAttachLoadBalancersResultType

@end

@implementation AWSAutoScalingAttachLoadBalancersType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"loadBalancerNames" : @"LoadBalancerNames",
             };
}

@end

@implementation AWSAutoScalingAutoScalingGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupARN" : @"AutoScalingGroupARN",
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"availabilityZones" : @"AvailabilityZones",
             @"createdTime" : @"CreatedTime",
             @"defaultCooldown" : @"DefaultCooldown",
             @"desiredCapacity" : @"DesiredCapacity",
             @"enabledMetrics" : @"EnabledMetrics",
             @"healthCheckGracePeriod" : @"HealthCheckGracePeriod",
             @"healthCheckType" : @"HealthCheckType",
             @"instances" : @"Instances",
             @"launchConfigurationName" : @"LaunchConfigurationName",
             @"loadBalancerNames" : @"LoadBalancerNames",
             @"maxSize" : @"MaxSize",
             @"minSize" : @"MinSize",
             @"latestInstancesProtectedFromScaleIn" : @"NewInstancesProtectedFromScaleIn",
             @"placementGroup" : @"PlacementGroup",
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

+ (NSValueTransformer *)suspendedProcessesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingSuspendedProcess class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingTagDescription class]];
}

@end

@implementation AWSAutoScalingAutoScalingGroupNamesType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupNames" : @"AutoScalingGroupNames",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingAutoScalingGroupsType

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"availabilityZone" : @"AvailabilityZone",
             @"healthStatus" : @"HealthStatus",
             @"instanceId" : @"InstanceId",
             @"launchConfigurationName" : @"LaunchConfigurationName",
             @"lifecycleState" : @"LifecycleState",
             @"protectedFromScaleIn" : @"ProtectedFromScaleIn",
             };
}

@end

@implementation AWSAutoScalingAutoScalingInstancesType

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

@implementation AWSAutoScalingBlockDeviceMapping

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

@implementation AWSAutoScalingCompleteLifecycleActionAnswer

@end

@implementation AWSAutoScalingCompleteLifecycleActionType

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"availabilityZones" : @"AvailabilityZones",
             @"defaultCooldown" : @"DefaultCooldown",
             @"desiredCapacity" : @"DesiredCapacity",
             @"healthCheckGracePeriod" : @"HealthCheckGracePeriod",
             @"healthCheckType" : @"HealthCheckType",
             @"instanceId" : @"InstanceId",
             @"launchConfigurationName" : @"LaunchConfigurationName",
             @"loadBalancerNames" : @"LoadBalancerNames",
             @"maxSize" : @"MaxSize",
             @"minSize" : @"MinSize",
             @"latestInstancesProtectedFromScaleIn" : @"NewInstancesProtectedFromScaleIn",
             @"placementGroup" : @"PlacementGroup",
             @"tags" : @"Tags",
             @"targetGroupARNs" : @"TargetGroupARNs",
             @"terminationPolicies" : @"TerminationPolicies",
             @"VPCZoneIdentifier" : @"VPCZoneIdentifier",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingTag class]];
}

@end

@implementation AWSAutoScalingCreateLaunchConfigurationType

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

@end

@implementation AWSAutoScalingCreateOrUpdateTagsType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingTag class]];
}

@end

@implementation AWSAutoScalingDeleteAutoScalingGroupType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"forceDelete" : @"ForceDelete",
             };
}

@end

@implementation AWSAutoScalingDeleteLifecycleHookAnswer

@end

@implementation AWSAutoScalingDeleteLifecycleHookType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"lifecycleHookName" : @"LifecycleHookName",
             };
}

@end

@implementation AWSAutoScalingDeleteNotificationConfigurationType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"topicARN" : @"TopicARN",
             };
}

@end

@implementation AWSAutoScalingDeletePolicyType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"policyName" : @"PolicyName",
             };
}

@end

@implementation AWSAutoScalingDeleteScheduledActionType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"scheduledActionName" : @"ScheduledActionName",
             };
}

@end

@implementation AWSAutoScalingDeleteTagsType

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceIds" : @"InstanceIds",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingNotificationTypes" : @"AutoScalingNotificationTypes",
             };
}

@end

@implementation AWSAutoScalingDescribeLifecycleHookTypesAnswer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecycleHookTypes" : @"LifecycleHookTypes",
             };
}

@end

@implementation AWSAutoScalingDescribeLifecycleHooksAnswer

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"lifecycleHookNames" : @"LifecycleHookNames",
             };
}

@end

@implementation AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingDescribeLoadBalancersResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupNames" : @"AutoScalingGroupNames",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingDescribePoliciesType

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"terminationPolicyTypes" : @"TerminationPolicyTypes",
             };
}

@end

@implementation AWSAutoScalingDetachInstancesAnswer

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceIds" : @"InstanceIds",
             @"shouldDecrementDesiredCapacity" : @"ShouldDecrementDesiredCapacity",
             };
}

@end

@implementation AWSAutoScalingDetachLoadBalancerTargetGroupsResultType

@end

@implementation AWSAutoScalingDetachLoadBalancerTargetGroupsType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"targetGroupARNs" : @"TargetGroupARNs",
             };
}

@end

@implementation AWSAutoScalingDetachLoadBalancersResultType

@end

@implementation AWSAutoScalingDetachLoadBalancersType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"loadBalancerNames" : @"LoadBalancerNames",
             };
}

@end

@implementation AWSAutoScalingDisableMetricsCollectionQuery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"metrics" : @"Metrics",
             };
}

@end

@implementation AWSAutoScalingEbs

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"granularity" : @"Granularity",
             @"metrics" : @"Metrics",
             };
}

@end

@implementation AWSAutoScalingEnabledMetric

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"granularity" : @"Granularity",
             @"metric" : @"Metric",
             };
}

@end

@implementation AWSAutoScalingEnterStandbyAnswer

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceIds" : @"InstanceIds",
             @"shouldDecrementDesiredCapacity" : @"ShouldDecrementDesiredCapacity",
             };
}

@end

@implementation AWSAutoScalingExecutePolicyType

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceIds" : @"InstanceIds",
             };
}

@end

@implementation AWSAutoScalingFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSAutoScalingInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"healthStatus" : @"HealthStatus",
             @"instanceId" : @"InstanceId",
             @"launchConfigurationName" : @"LaunchConfigurationName",
             @"lifecycleState" : @"LifecycleState",
             @"protectedFromScaleIn" : @"ProtectedFromScaleIn",
             };
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

@implementation AWSAutoScalingInstanceMonitoring

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSAutoScalingLaunchConfiguration

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

@end

@implementation AWSAutoScalingLaunchConfigurationNameType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"launchConfigurationName" : @"LaunchConfigurationName",
             };
}

@end

@implementation AWSAutoScalingLaunchConfigurationNamesType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"launchConfigurationNames" : @"LaunchConfigurationNames",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAutoScalingLaunchConfigurationsType

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

@implementation AWSAutoScalingLifecycleHook

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

@implementation AWSAutoScalingLoadBalancerState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerName" : @"LoadBalancerName",
             @"state" : @"State",
             };
}

@end

@implementation AWSAutoScalingLoadBalancerTargetGroupState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancerTargetGroupARN" : @"LoadBalancerTargetGroupARN",
             @"state" : @"State",
             };
}

@end

@implementation AWSAutoScalingMetricCollectionType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metric" : @"Metric",
             };
}

@end

@implementation AWSAutoScalingMetricGranularityType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"granularity" : @"Granularity",
             };
}

@end

@implementation AWSAutoScalingNotificationConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"notificationType" : @"NotificationType",
             @"topicARN" : @"TopicARN",
             };
}

@end

@implementation AWSAutoScalingPoliciesType

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyARN" : @"PolicyARN",
             };
}

@end

@implementation AWSAutoScalingProcessType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processName" : @"ProcessName",
             };
}

@end

@implementation AWSAutoScalingProcessesType

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

@end

@implementation AWSAutoScalingPutLifecycleHookType

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"notificationTypes" : @"NotificationTypes",
             @"topicARN" : @"TopicARN",
             };
}

@end

@implementation AWSAutoScalingPutScalingPolicyType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adjustmentType" : @"AdjustmentType",
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"cooldown" : @"Cooldown",
             @"estimatedInstanceWarmup" : @"EstimatedInstanceWarmup",
             @"metricAggregationType" : @"MetricAggregationType",
             @"minAdjustmentMagnitude" : @"MinAdjustmentMagnitude",
             @"minAdjustmentStep" : @"MinAdjustmentStep",
             @"policyName" : @"PolicyName",
             @"policyType" : @"PolicyType",
             @"scalingAdjustment" : @"ScalingAdjustment",
             @"stepAdjustments" : @"StepAdjustments",
             };
}

+ (NSValueTransformer *)stepAdjustmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingStepAdjustment class]];
}

@end

@implementation AWSAutoScalingPutScheduledUpdateGroupActionType

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

@end

@implementation AWSAutoScalingRecordLifecycleActionHeartbeatType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceId" : @"InstanceId",
             @"lifecycleActionToken" : @"LifecycleActionToken",
             @"lifecycleHookName" : @"LifecycleHookName",
             };
}

@end

@implementation AWSAutoScalingScalingPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adjustmentType" : @"AdjustmentType",
             @"alarms" : @"Alarms",
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"cooldown" : @"Cooldown",
             @"estimatedInstanceWarmup" : @"EstimatedInstanceWarmup",
             @"metricAggregationType" : @"MetricAggregationType",
             @"minAdjustmentMagnitude" : @"MinAdjustmentMagnitude",
             @"minAdjustmentStep" : @"MinAdjustmentStep",
             @"policyARN" : @"PolicyARN",
             @"policyName" : @"PolicyName",
             @"policyType" : @"PolicyType",
             @"scalingAdjustment" : @"ScalingAdjustment",
             @"stepAdjustments" : @"StepAdjustments",
             };
}

+ (NSValueTransformer *)alarmsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingAlarm class]];
}

+ (NSValueTransformer *)stepAdjustmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAutoScalingStepAdjustment class]];
}

@end

@implementation AWSAutoScalingScalingProcessQuery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"scalingProcesses" : @"ScalingProcesses",
             };
}

@end

@implementation AWSAutoScalingScheduledActionsType

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

@implementation AWSAutoScalingSetDesiredCapacityType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"desiredCapacity" : @"DesiredCapacity",
             @"honorCooldown" : @"HonorCooldown",
             };
}

@end

@implementation AWSAutoScalingSetInstanceHealthQuery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthStatus" : @"HealthStatus",
             @"instanceId" : @"InstanceId",
             @"shouldRespectGracePeriod" : @"ShouldRespectGracePeriod",
             };
}

@end

@implementation AWSAutoScalingSetInstanceProtectionAnswer

@end

@implementation AWSAutoScalingSetInstanceProtectionQuery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"instanceIds" : @"InstanceIds",
             @"protectedFromScaleIn" : @"ProtectedFromScaleIn",
             };
}

@end

@implementation AWSAutoScalingStepAdjustment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricIntervalLowerBound" : @"MetricIntervalLowerBound",
             @"metricIntervalUpperBound" : @"MetricIntervalUpperBound",
             @"scalingAdjustment" : @"ScalingAdjustment",
             };
}

@end

@implementation AWSAutoScalingSuspendedProcess

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"processName" : @"ProcessName",
             @"suspensionReason" : @"SuspensionReason",
             };
}

@end

@implementation AWSAutoScalingTag

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

@implementation AWSAutoScalingTerminateInstanceInAutoScalingGroupType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"shouldDecrementDesiredCapacity" : @"ShouldDecrementDesiredCapacity",
             };
}

@end

@implementation AWSAutoScalingUpdateAutoScalingGroupType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroupName" : @"AutoScalingGroupName",
             @"availabilityZones" : @"AvailabilityZones",
             @"defaultCooldown" : @"DefaultCooldown",
             @"desiredCapacity" : @"DesiredCapacity",
             @"healthCheckGracePeriod" : @"HealthCheckGracePeriod",
             @"healthCheckType" : @"HealthCheckType",
             @"launchConfigurationName" : @"LaunchConfigurationName",
             @"maxSize" : @"MaxSize",
             @"minSize" : @"MinSize",
             @"latestInstancesProtectedFromScaleIn" : @"NewInstancesProtectedFromScaleIn",
             @"placementGroup" : @"PlacementGroup",
             @"terminationPolicies" : @"TerminationPolicies",
             @"VPCZoneIdentifier" : @"VPCZoneIdentifier",
             };
}

@end
