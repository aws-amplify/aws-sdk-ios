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

#import "AWSCodedeployModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSCodedeployErrorDomain = @"com.amazonaws.AWSCodedeployErrorDomain";

@implementation AWSCodedeployAddTagsToOnPremisesInstancesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceNames" : @"instanceNames",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTag class]];
}

@end

@implementation AWSCodedeployAlarm

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSCodedeployAlarmConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarms" : @"alarms",
             @"enabled" : @"enabled",
             @"ignorePollAlarmFailure" : @"ignorePollAlarmFailure",
             };
}

+ (NSValueTransformer *)alarmsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployAlarm class]];
}

@end

@implementation AWSCodedeployAppSpecContent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"content",
             @"sha256" : @"sha256",
             };
}

@end

@implementation AWSCodedeployApplicationInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"applicationId",
             @"applicationName" : @"applicationName",
             @"computePlatform" : @"computePlatform",
             @"createTime" : @"createTime",
             @"gitHubAccountName" : @"gitHubAccountName",
             @"linkedToGitHub" : @"linkedToGitHub",
             };
}

+ (NSValueTransformer *)computePlatformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Server"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformServer);
        }
        if ([value caseInsensitiveCompare:@"Lambda"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformLambda);
        }
        if ([value caseInsensitiveCompare:@"ECS"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformEcs);
        }
        return @(AWSCodedeployComputePlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployComputePlatformServer:
                return @"Server";
            case AWSCodedeployComputePlatformLambda:
                return @"Lambda";
            case AWSCodedeployComputePlatformEcs:
                return @"ECS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCodedeployAutoRollbackConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"enabled",
             @"events" : @"events",
             };
}

@end

@implementation AWSCodedeployAutoScalingGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hook" : @"hook",
             @"name" : @"name",
             };
}

@end

@implementation AWSCodedeployBatchGetApplicationRevisionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"revisions" : @"revisions",
             };
}

+ (NSValueTransformer *)revisionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployRevisionLocation class]];
}

@end

@implementation AWSCodedeployBatchGetApplicationRevisionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"errorMessage" : @"errorMessage",
             @"revisions" : @"revisions",
             };
}

+ (NSValueTransformer *)revisionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployRevisionInfo class]];
}

@end

@implementation AWSCodedeployBatchGetApplicationsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationNames" : @"applicationNames",
             };
}

@end

@implementation AWSCodedeployBatchGetApplicationsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationsInfo" : @"applicationsInfo",
             };
}

+ (NSValueTransformer *)applicationsInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployApplicationInfo class]];
}

@end

@implementation AWSCodedeployBatchGetDeploymentGroupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"deploymentGroupNames" : @"deploymentGroupNames",
             };
}

@end

@implementation AWSCodedeployBatchGetDeploymentGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentGroupsInfo" : @"deploymentGroupsInfo",
             @"errorMessage" : @"errorMessage",
             };
}

+ (NSValueTransformer *)deploymentGroupsInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployDeploymentGroupInfo class]];
}

@end

@implementation AWSCodedeployBatchGetDeploymentInstancesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             @"instanceIds" : @"instanceIds",
             };
}

@end

@implementation AWSCodedeployBatchGetDeploymentInstancesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorMessage" : @"errorMessage",
             @"instancesSummary" : @"instancesSummary",
             };
}

+ (NSValueTransformer *)instancesSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployInstanceSummary class]];
}

@end

@implementation AWSCodedeployBatchGetDeploymentTargetsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             @"targetIds" : @"targetIds",
             };
}

@end

@implementation AWSCodedeployBatchGetDeploymentTargetsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentTargets" : @"deploymentTargets",
             };
}

+ (NSValueTransformer *)deploymentTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployDeploymentTarget class]];
}

@end

@implementation AWSCodedeployBatchGetDeploymentsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentIds" : @"deploymentIds",
             };
}

@end

@implementation AWSCodedeployBatchGetDeploymentsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentsInfo" : @"deploymentsInfo",
             };
}

+ (NSValueTransformer *)deploymentsInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployDeploymentInfo class]];
}

@end

@implementation AWSCodedeployBatchGetOnPremisesInstancesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceNames" : @"instanceNames",
             };
}

@end

@implementation AWSCodedeployBatchGetOnPremisesInstancesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceInfos" : @"instanceInfos",
             };
}

+ (NSValueTransformer *)instanceInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployInstanceInfo class]];
}

@end

@implementation AWSCodedeployBlueGreenDeploymentConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentReadyOption" : @"deploymentReadyOption",
             @"greenFleetProvisioningOption" : @"greenFleetProvisioningOption",
             @"terminateBlueInstancesOnDeploymentSuccess" : @"terminateBlueInstancesOnDeploymentSuccess",
             };
}

+ (NSValueTransformer *)deploymentReadyOptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployDeploymentReadyOption class]];
}

+ (NSValueTransformer *)greenFleetProvisioningOptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployGreenFleetProvisioningOption class]];
}

+ (NSValueTransformer *)terminateBlueInstancesOnDeploymentSuccessJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployBlueInstanceTerminationOption class]];
}

@end

@implementation AWSCodedeployBlueInstanceTerminationOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"action",
             @"terminationWaitTimeInMinutes" : @"terminationWaitTimeInMinutes",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TERMINATE"] == NSOrderedSame) {
            return @(AWSCodedeployInstanceActionTerminate);
        }
        if ([value caseInsensitiveCompare:@"KEEP_ALIVE"] == NSOrderedSame) {
            return @(AWSCodedeployInstanceActionKeepAlive);
        }
        return @(AWSCodedeployInstanceActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployInstanceActionTerminate:
                return @"TERMINATE";
            case AWSCodedeployInstanceActionKeepAlive:
                return @"KEEP_ALIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployCloudFormationTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"lifecycleEvents" : @"lifecycleEvents",
             @"resourceType" : @"resourceType",
             @"status" : @"status",
             @"targetId" : @"targetId",
             @"targetVersionWeight" : @"targetVersionWeight",
             };
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lifecycleEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployLifecycleEvent class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Skipped"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusSkipped);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusUnknown);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusReady);
        }
        return @(AWSCodedeployTargetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployTargetStatusPending:
                return @"Pending";
            case AWSCodedeployTargetStatusInProgress:
                return @"InProgress";
            case AWSCodedeployTargetStatusSucceeded:
                return @"Succeeded";
            case AWSCodedeployTargetStatusFailed:
                return @"Failed";
            case AWSCodedeployTargetStatusSkipped:
                return @"Skipped";
            case AWSCodedeployTargetStatusUnknown:
                return @"Unknown";
            case AWSCodedeployTargetStatusReady:
                return @"Ready";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployContinueDeploymentInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             @"deploymentWaitType" : @"deploymentWaitType",
             };
}

+ (NSValueTransformer *)deploymentWaitTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"READY_WAIT"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentWaitTypeReadyWait);
        }
        if ([value caseInsensitiveCompare:@"TERMINATION_WAIT"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentWaitTypeTerminationWait);
        }
        return @(AWSCodedeployDeploymentWaitTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployDeploymentWaitTypeReadyWait:
                return @"READY_WAIT";
            case AWSCodedeployDeploymentWaitTypeTerminationWait:
                return @"TERMINATION_WAIT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployCreateApplicationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"computePlatform" : @"computePlatform",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)computePlatformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Server"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformServer);
        }
        if ([value caseInsensitiveCompare:@"Lambda"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformLambda);
        }
        if ([value caseInsensitiveCompare:@"ECS"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformEcs);
        }
        return @(AWSCodedeployComputePlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployComputePlatformServer:
                return @"Server";
            case AWSCodedeployComputePlatformLambda:
                return @"Lambda";
            case AWSCodedeployComputePlatformEcs:
                return @"ECS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTag class]];
}

@end

@implementation AWSCodedeployCreateApplicationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"applicationId",
             };
}

@end

@implementation AWSCodedeployCreateDeploymentConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"computePlatform" : @"computePlatform",
             @"deploymentConfigName" : @"deploymentConfigName",
             @"minimumHealthyHosts" : @"minimumHealthyHosts",
             @"trafficRoutingConfig" : @"trafficRoutingConfig",
             };
}

+ (NSValueTransformer *)computePlatformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Server"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformServer);
        }
        if ([value caseInsensitiveCompare:@"Lambda"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformLambda);
        }
        if ([value caseInsensitiveCompare:@"ECS"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformEcs);
        }
        return @(AWSCodedeployComputePlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployComputePlatformServer:
                return @"Server";
            case AWSCodedeployComputePlatformLambda:
                return @"Lambda";
            case AWSCodedeployComputePlatformEcs:
                return @"ECS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)minimumHealthyHostsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployMinimumHealthyHosts class]];
}

+ (NSValueTransformer *)trafficRoutingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployTrafficRoutingConfig class]];
}

@end

@implementation AWSCodedeployCreateDeploymentConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentConfigId" : @"deploymentConfigId",
             };
}

@end

@implementation AWSCodedeployCreateDeploymentGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmConfiguration" : @"alarmConfiguration",
             @"applicationName" : @"applicationName",
             @"autoRollbackConfiguration" : @"autoRollbackConfiguration",
             @"autoScalingGroups" : @"autoScalingGroups",
             @"blueGreenDeploymentConfiguration" : @"blueGreenDeploymentConfiguration",
             @"deploymentConfigName" : @"deploymentConfigName",
             @"deploymentGroupName" : @"deploymentGroupName",
             @"deploymentStyle" : @"deploymentStyle",
             @"ec2TagFilters" : @"ec2TagFilters",
             @"ec2TagSet" : @"ec2TagSet",
             @"ecsServices" : @"ecsServices",
             @"loadBalancerInfo" : @"loadBalancerInfo",
             @"onPremisesInstanceTagFilters" : @"onPremisesInstanceTagFilters",
             @"onPremisesTagSet" : @"onPremisesTagSet",
             @"serviceRoleArn" : @"serviceRoleArn",
             @"tags" : @"tags",
             @"triggerConfigurations" : @"triggerConfigurations",
             };
}

+ (NSValueTransformer *)alarmConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployAlarmConfiguration class]];
}

+ (NSValueTransformer *)autoRollbackConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployAutoRollbackConfiguration class]];
}

+ (NSValueTransformer *)blueGreenDeploymentConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployBlueGreenDeploymentConfiguration class]];
}

+ (NSValueTransformer *)deploymentStyleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployDeploymentStyle class]];
}

+ (NSValueTransformer *)ec2TagFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployEC2TagFilter class]];
}

+ (NSValueTransformer *)ec2TagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployEC2TagSet class]];
}

+ (NSValueTransformer *)ecsServicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployECSService class]];
}

+ (NSValueTransformer *)loadBalancerInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployLoadBalancerInfo class]];
}

+ (NSValueTransformer *)onPremisesInstanceTagFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTagFilter class]];
}

+ (NSValueTransformer *)onPremisesTagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployOnPremisesTagSet class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTag class]];
}

+ (NSValueTransformer *)triggerConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTriggerConfig class]];
}

@end

@implementation AWSCodedeployCreateDeploymentGroupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentGroupId" : @"deploymentGroupId",
             };
}

@end

@implementation AWSCodedeployCreateDeploymentInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"autoRollbackConfiguration" : @"autoRollbackConfiguration",
             @"deploymentConfigName" : @"deploymentConfigName",
             @"deploymentGroupName" : @"deploymentGroupName",
             @"detail" : @"description",
             @"fileExistsBehavior" : @"fileExistsBehavior",
             @"ignoreApplicationStopFailures" : @"ignoreApplicationStopFailures",
             @"revision" : @"revision",
             @"targetInstances" : @"targetInstances",
             @"updateOutdatedInstancesOnly" : @"updateOutdatedInstancesOnly",
             };
}

+ (NSValueTransformer *)autoRollbackConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployAutoRollbackConfiguration class]];
}

+ (NSValueTransformer *)fileExistsBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISALLOW"] == NSOrderedSame) {
            return @(AWSCodedeployFileExistsBehaviorDisallow);
        }
        if ([value caseInsensitiveCompare:@"OVERWRITE"] == NSOrderedSame) {
            return @(AWSCodedeployFileExistsBehaviorOverwrite);
        }
        if ([value caseInsensitiveCompare:@"RETAIN"] == NSOrderedSame) {
            return @(AWSCodedeployFileExistsBehaviorRetain);
        }
        return @(AWSCodedeployFileExistsBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployFileExistsBehaviorDisallow:
                return @"DISALLOW";
            case AWSCodedeployFileExistsBehaviorOverwrite:
                return @"OVERWRITE";
            case AWSCodedeployFileExistsBehaviorRetain:
                return @"RETAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)revisionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployRevisionLocation class]];
}

+ (NSValueTransformer *)targetInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployTargetInstances class]];
}

@end

@implementation AWSCodedeployCreateDeploymentOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             };
}

@end

@implementation AWSCodedeployDeleteApplicationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             };
}

@end

@implementation AWSCodedeployDeleteDeploymentConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentConfigName" : @"deploymentConfigName",
             };
}

@end

@implementation AWSCodedeployDeleteDeploymentGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"deploymentGroupName" : @"deploymentGroupName",
             };
}

@end

@implementation AWSCodedeployDeleteDeploymentGroupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hooksNotCleanedUp" : @"hooksNotCleanedUp",
             };
}

+ (NSValueTransformer *)hooksNotCleanedUpJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployAutoScalingGroup class]];
}

@end

@implementation AWSCodedeployDeleteGitHubAccountTokenInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tokenName" : @"tokenName",
             };
}

@end

@implementation AWSCodedeployDeleteGitHubAccountTokenOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tokenName" : @"tokenName",
             };
}

@end

@implementation AWSCodedeployDeleteResourcesByExternalIdInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"externalId" : @"externalId",
             };
}

@end

@implementation AWSCodedeployDeleteResourcesByExternalIdOutput

@end

@implementation AWSCodedeployDeploymentConfigInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"computePlatform" : @"computePlatform",
             @"createTime" : @"createTime",
             @"deploymentConfigId" : @"deploymentConfigId",
             @"deploymentConfigName" : @"deploymentConfigName",
             @"minimumHealthyHosts" : @"minimumHealthyHosts",
             @"trafficRoutingConfig" : @"trafficRoutingConfig",
             };
}

+ (NSValueTransformer *)computePlatformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Server"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformServer);
        }
        if ([value caseInsensitiveCompare:@"Lambda"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformLambda);
        }
        if ([value caseInsensitiveCompare:@"ECS"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformEcs);
        }
        return @(AWSCodedeployComputePlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployComputePlatformServer:
                return @"Server";
            case AWSCodedeployComputePlatformLambda:
                return @"Lambda";
            case AWSCodedeployComputePlatformEcs:
                return @"ECS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)minimumHealthyHostsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployMinimumHealthyHosts class]];
}

+ (NSValueTransformer *)trafficRoutingConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployTrafficRoutingConfig class]];
}

@end

@implementation AWSCodedeployDeploymentGroupInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmConfiguration" : @"alarmConfiguration",
             @"applicationName" : @"applicationName",
             @"autoRollbackConfiguration" : @"autoRollbackConfiguration",
             @"autoScalingGroups" : @"autoScalingGroups",
             @"blueGreenDeploymentConfiguration" : @"blueGreenDeploymentConfiguration",
             @"computePlatform" : @"computePlatform",
             @"deploymentConfigName" : @"deploymentConfigName",
             @"deploymentGroupId" : @"deploymentGroupId",
             @"deploymentGroupName" : @"deploymentGroupName",
             @"deploymentStyle" : @"deploymentStyle",
             @"ec2TagFilters" : @"ec2TagFilters",
             @"ec2TagSet" : @"ec2TagSet",
             @"ecsServices" : @"ecsServices",
             @"lastAttemptedDeployment" : @"lastAttemptedDeployment",
             @"lastSuccessfulDeployment" : @"lastSuccessfulDeployment",
             @"loadBalancerInfo" : @"loadBalancerInfo",
             @"onPremisesInstanceTagFilters" : @"onPremisesInstanceTagFilters",
             @"onPremisesTagSet" : @"onPremisesTagSet",
             @"serviceRoleArn" : @"serviceRoleArn",
             @"targetRevision" : @"targetRevision",
             @"triggerConfigurations" : @"triggerConfigurations",
             };
}

+ (NSValueTransformer *)alarmConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployAlarmConfiguration class]];
}

+ (NSValueTransformer *)autoRollbackConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployAutoRollbackConfiguration class]];
}

+ (NSValueTransformer *)autoScalingGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployAutoScalingGroup class]];
}

+ (NSValueTransformer *)blueGreenDeploymentConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployBlueGreenDeploymentConfiguration class]];
}

+ (NSValueTransformer *)computePlatformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Server"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformServer);
        }
        if ([value caseInsensitiveCompare:@"Lambda"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformLambda);
        }
        if ([value caseInsensitiveCompare:@"ECS"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformEcs);
        }
        return @(AWSCodedeployComputePlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployComputePlatformServer:
                return @"Server";
            case AWSCodedeployComputePlatformLambda:
                return @"Lambda";
            case AWSCodedeployComputePlatformEcs:
                return @"ECS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deploymentStyleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployDeploymentStyle class]];
}

+ (NSValueTransformer *)ec2TagFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployEC2TagFilter class]];
}

+ (NSValueTransformer *)ec2TagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployEC2TagSet class]];
}

+ (NSValueTransformer *)ecsServicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployECSService class]];
}

+ (NSValueTransformer *)lastAttemptedDeploymentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployLastDeploymentInfo class]];
}

+ (NSValueTransformer *)lastSuccessfulDeploymentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployLastDeploymentInfo class]];
}

+ (NSValueTransformer *)loadBalancerInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployLoadBalancerInfo class]];
}

+ (NSValueTransformer *)onPremisesInstanceTagFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTagFilter class]];
}

+ (NSValueTransformer *)onPremisesTagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployOnPremisesTagSet class]];
}

+ (NSValueTransformer *)targetRevisionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployRevisionLocation class]];
}

+ (NSValueTransformer *)triggerConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTriggerConfig class]];
}

@end

@implementation AWSCodedeployDeploymentInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalDeploymentStatusInfo" : @"additionalDeploymentStatusInfo",
             @"applicationName" : @"applicationName",
             @"autoRollbackConfiguration" : @"autoRollbackConfiguration",
             @"blueGreenDeploymentConfiguration" : @"blueGreenDeploymentConfiguration",
             @"completeTime" : @"completeTime",
             @"computePlatform" : @"computePlatform",
             @"createTime" : @"createTime",
             @"creator" : @"creator",
             @"deploymentConfigName" : @"deploymentConfigName",
             @"deploymentGroupName" : @"deploymentGroupName",
             @"deploymentId" : @"deploymentId",
             @"deploymentOverview" : @"deploymentOverview",
             @"deploymentStatusMessages" : @"deploymentStatusMessages",
             @"deploymentStyle" : @"deploymentStyle",
             @"detail" : @"description",
             @"errorInformation" : @"errorInformation",
             @"externalId" : @"externalId",
             @"fileExistsBehavior" : @"fileExistsBehavior",
             @"ignoreApplicationStopFailures" : @"ignoreApplicationStopFailures",
             @"instanceTerminationWaitTimeStarted" : @"instanceTerminationWaitTimeStarted",
             @"loadBalancerInfo" : @"loadBalancerInfo",
             @"previousRevision" : @"previousRevision",
             @"revision" : @"revision",
             @"rollbackInfo" : @"rollbackInfo",
             @"startTime" : @"startTime",
             @"status" : @"status",
             @"targetInstances" : @"targetInstances",
             @"updateOutdatedInstancesOnly" : @"updateOutdatedInstancesOnly",
             };
}

+ (NSValueTransformer *)autoRollbackConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployAutoRollbackConfiguration class]];
}

+ (NSValueTransformer *)blueGreenDeploymentConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployBlueGreenDeploymentConfiguration class]];
}

+ (NSValueTransformer *)completeTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)computePlatformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Server"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformServer);
        }
        if ([value caseInsensitiveCompare:@"Lambda"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformLambda);
        }
        if ([value caseInsensitiveCompare:@"ECS"] == NSOrderedSame) {
            return @(AWSCodedeployComputePlatformEcs);
        }
        return @(AWSCodedeployComputePlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployComputePlatformServer:
                return @"Server";
            case AWSCodedeployComputePlatformLambda:
                return @"Lambda";
            case AWSCodedeployComputePlatformEcs:
                return @"ECS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"user"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentCreatorUser);
        }
        if ([value caseInsensitiveCompare:@"autoscaling"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentCreatorAutoscaling);
        }
        if ([value caseInsensitiveCompare:@"codeDeployRollback"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentCreatorCodeDeployRollback);
        }
        if ([value caseInsensitiveCompare:@"CodeDeploy"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentCreatorCodeDeploy);
        }
        if ([value caseInsensitiveCompare:@"CloudFormation"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentCreatorCloudFormation);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationRollback"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentCreatorCloudFormationRollback);
        }
        return @(AWSCodedeployDeploymentCreatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployDeploymentCreatorUser:
                return @"user";
            case AWSCodedeployDeploymentCreatorAutoscaling:
                return @"autoscaling";
            case AWSCodedeployDeploymentCreatorCodeDeployRollback:
                return @"codeDeployRollback";
            case AWSCodedeployDeploymentCreatorCodeDeploy:
                return @"CodeDeploy";
            case AWSCodedeployDeploymentCreatorCloudFormation:
                return @"CloudFormation";
            case AWSCodedeployDeploymentCreatorCloudFormationRollback:
                return @"CloudFormationRollback";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deploymentOverviewJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployDeploymentOverview class]];
}

+ (NSValueTransformer *)deploymentStyleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployDeploymentStyle class]];
}

+ (NSValueTransformer *)errorInformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployErrorInformation class]];
}

+ (NSValueTransformer *)fileExistsBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISALLOW"] == NSOrderedSame) {
            return @(AWSCodedeployFileExistsBehaviorDisallow);
        }
        if ([value caseInsensitiveCompare:@"OVERWRITE"] == NSOrderedSame) {
            return @(AWSCodedeployFileExistsBehaviorOverwrite);
        }
        if ([value caseInsensitiveCompare:@"RETAIN"] == NSOrderedSame) {
            return @(AWSCodedeployFileExistsBehaviorRetain);
        }
        return @(AWSCodedeployFileExistsBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployFileExistsBehaviorDisallow:
                return @"DISALLOW";
            case AWSCodedeployFileExistsBehaviorOverwrite:
                return @"OVERWRITE";
            case AWSCodedeployFileExistsBehaviorRetain:
                return @"RETAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)loadBalancerInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployLoadBalancerInfo class]];
}

+ (NSValueTransformer *)previousRevisionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployRevisionLocation class]];
}

+ (NSValueTransformer *)revisionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployRevisionLocation class]];
}

+ (NSValueTransformer *)rollbackInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployRollbackInfo class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Created"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"Queued"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Baking"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusBaking);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusReady);
        }
        return @(AWSCodedeployDeploymentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployDeploymentStatusCreated:
                return @"Created";
            case AWSCodedeployDeploymentStatusQueued:
                return @"Queued";
            case AWSCodedeployDeploymentStatusInProgress:
                return @"InProgress";
            case AWSCodedeployDeploymentStatusBaking:
                return @"Baking";
            case AWSCodedeployDeploymentStatusSucceeded:
                return @"Succeeded";
            case AWSCodedeployDeploymentStatusFailed:
                return @"Failed";
            case AWSCodedeployDeploymentStatusStopped:
                return @"Stopped";
            case AWSCodedeployDeploymentStatusReady:
                return @"Ready";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployTargetInstances class]];
}

@end

@implementation AWSCodedeployDeploymentOverview

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failed" : @"Failed",
             @"inProgress" : @"InProgress",
             @"pending" : @"Pending",
             @"ready" : @"Ready",
             @"skipped" : @"Skipped",
             @"succeeded" : @"Succeeded",
             };
}

@end

@implementation AWSCodedeployDeploymentReadyOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionOnTimeout" : @"actionOnTimeout",
             @"waitTimeInMinutes" : @"waitTimeInMinutes",
             };
}

+ (NSValueTransformer *)actionOnTimeoutJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTINUE_DEPLOYMENT"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentReadyActionContinueDeployment);
        }
        if ([value caseInsensitiveCompare:@"STOP_DEPLOYMENT"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentReadyActionStopDeployment);
        }
        return @(AWSCodedeployDeploymentReadyActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployDeploymentReadyActionContinueDeployment:
                return @"CONTINUE_DEPLOYMENT";
            case AWSCodedeployDeploymentReadyActionStopDeployment:
                return @"STOP_DEPLOYMENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployDeploymentStyle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentOption" : @"deploymentOption",
             @"deploymentType" : @"deploymentType",
             };
}

+ (NSValueTransformer *)deploymentOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WITH_TRAFFIC_CONTROL"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentOptionWithTrafficControl);
        }
        if ([value caseInsensitiveCompare:@"WITHOUT_TRAFFIC_CONTROL"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentOptionWithoutTrafficControl);
        }
        return @(AWSCodedeployDeploymentOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployDeploymentOptionWithTrafficControl:
                return @"WITH_TRAFFIC_CONTROL";
            case AWSCodedeployDeploymentOptionWithoutTrafficControl:
                return @"WITHOUT_TRAFFIC_CONTROL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deploymentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PLACE"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentTypeInPlace);
        }
        if ([value caseInsensitiveCompare:@"BLUE_GREEN"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentTypeBlueGreen);
        }
        return @(AWSCodedeployDeploymentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployDeploymentTypeInPlace:
                return @"IN_PLACE";
            case AWSCodedeployDeploymentTypeBlueGreen:
                return @"BLUE_GREEN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployDeploymentTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFormationTarget" : @"cloudFormationTarget",
             @"deploymentTargetType" : @"deploymentTargetType",
             @"ecsTarget" : @"ecsTarget",
             @"instanceTarget" : @"instanceTarget",
             @"lambdaTarget" : @"lambdaTarget",
             };
}

+ (NSValueTransformer *)cloudFormationTargetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployCloudFormationTarget class]];
}

+ (NSValueTransformer *)deploymentTargetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InstanceTarget"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentTargetTypeInstanceTarget);
        }
        if ([value caseInsensitiveCompare:@"LambdaTarget"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentTargetTypeLambdaTarget);
        }
        if ([value caseInsensitiveCompare:@"ECSTarget"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentTargetTypeECSTarget);
        }
        if ([value caseInsensitiveCompare:@"CloudFormationTarget"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentTargetTypeCloudFormationTarget);
        }
        return @(AWSCodedeployDeploymentTargetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployDeploymentTargetTypeInstanceTarget:
                return @"InstanceTarget";
            case AWSCodedeployDeploymentTargetTypeLambdaTarget:
                return @"LambdaTarget";
            case AWSCodedeployDeploymentTargetTypeECSTarget:
                return @"ECSTarget";
            case AWSCodedeployDeploymentTargetTypeCloudFormationTarget:
                return @"CloudFormationTarget";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ecsTargetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployECSTarget class]];
}

+ (NSValueTransformer *)instanceTargetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployInstanceTarget class]];
}

+ (NSValueTransformer *)lambdaTargetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployLambdaTarget class]];
}

@end

@implementation AWSCodedeployDeregisterOnPremisesInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             };
}

@end

@implementation AWSCodedeployDiagnostics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"errorCode",
             @"logTail" : @"logTail",
             @"message" : @"message",
             @"scriptName" : @"scriptName",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleErrorCodeSuccess);
        }
        if ([value caseInsensitiveCompare:@"ScriptMissing"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleErrorCodeScriptMissing);
        }
        if ([value caseInsensitiveCompare:@"ScriptNotExecutable"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleErrorCodeScriptNotExecutable);
        }
        if ([value caseInsensitiveCompare:@"ScriptTimedOut"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleErrorCodeScriptTimedOut);
        }
        if ([value caseInsensitiveCompare:@"ScriptFailed"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleErrorCodeScriptFailed);
        }
        if ([value caseInsensitiveCompare:@"UnknownError"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleErrorCodeUnknownError);
        }
        return @(AWSCodedeployLifecycleErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployLifecycleErrorCodeSuccess:
                return @"Success";
            case AWSCodedeployLifecycleErrorCodeScriptMissing:
                return @"ScriptMissing";
            case AWSCodedeployLifecycleErrorCodeScriptNotExecutable:
                return @"ScriptNotExecutable";
            case AWSCodedeployLifecycleErrorCodeScriptTimedOut:
                return @"ScriptTimedOut";
            case AWSCodedeployLifecycleErrorCodeScriptFailed:
                return @"ScriptFailed";
            case AWSCodedeployLifecycleErrorCodeUnknownError:
                return @"UnknownError";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployEC2TagFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"KEY_ONLY"] == NSOrderedSame) {
            return @(AWSCodedeployEC2TagFilterTypeKeyOnly);
        }
        if ([value caseInsensitiveCompare:@"VALUE_ONLY"] == NSOrderedSame) {
            return @(AWSCodedeployEC2TagFilterTypeValueOnly);
        }
        if ([value caseInsensitiveCompare:@"KEY_AND_VALUE"] == NSOrderedSame) {
            return @(AWSCodedeployEC2TagFilterTypeKeyAndValue);
        }
        return @(AWSCodedeployEC2TagFilterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployEC2TagFilterTypeKeyOnly:
                return @"KEY_ONLY";
            case AWSCodedeployEC2TagFilterTypeValueOnly:
                return @"VALUE_ONLY";
            case AWSCodedeployEC2TagFilterTypeKeyAndValue:
                return @"KEY_AND_VALUE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployEC2TagSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ec2TagSetList" : @"ec2TagSetList",
             };
}

@end

@implementation AWSCodedeployECSService

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterName" : @"clusterName",
             @"serviceName" : @"serviceName",
             };
}

@end

@implementation AWSCodedeployECSTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"lifecycleEvents" : @"lifecycleEvents",
             @"status" : @"status",
             @"targetArn" : @"targetArn",
             @"targetId" : @"targetId",
             @"taskSetsInfo" : @"taskSetsInfo",
             };
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lifecycleEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployLifecycleEvent class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Skipped"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusSkipped);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusUnknown);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusReady);
        }
        return @(AWSCodedeployTargetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployTargetStatusPending:
                return @"Pending";
            case AWSCodedeployTargetStatusInProgress:
                return @"InProgress";
            case AWSCodedeployTargetStatusSucceeded:
                return @"Succeeded";
            case AWSCodedeployTargetStatusFailed:
                return @"Failed";
            case AWSCodedeployTargetStatusSkipped:
                return @"Skipped";
            case AWSCodedeployTargetStatusUnknown:
                return @"Unknown";
            case AWSCodedeployTargetStatusReady:
                return @"Ready";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskSetsInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployECSTaskSet class]];
}

@end

@implementation AWSCodedeployECSTaskSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"desiredCount" : @"desiredCount",
             @"identifer" : @"identifer",
             @"pendingCount" : @"pendingCount",
             @"runningCount" : @"runningCount",
             @"status" : @"status",
             @"targetGroup" : @"targetGroup",
             @"taskSetLabel" : @"taskSetLabel",
             @"trafficWeight" : @"trafficWeight",
             };
}

+ (NSValueTransformer *)targetGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployTargetGroupInfo class]];
}

+ (NSValueTransformer *)taskSetLabelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Blue"] == NSOrderedSame) {
            return @(AWSCodedeployTargetLabelBlue);
        }
        if ([value caseInsensitiveCompare:@"Green"] == NSOrderedSame) {
            return @(AWSCodedeployTargetLabelGreen);
        }
        return @(AWSCodedeployTargetLabelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployTargetLabelBlue:
                return @"Blue";
            case AWSCodedeployTargetLabelGreen:
                return @"Green";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployELBInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSCodedeployErrorInformation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"message" : @"message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AGENT_ISSUE"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeAgentIssue);
        }
        if ([value caseInsensitiveCompare:@"ALARM_ACTIVE"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeAlarmActive);
        }
        if ([value caseInsensitiveCompare:@"APPLICATION_MISSING"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeApplicationMissing);
        }
        if ([value caseInsensitiveCompare:@"AUTOSCALING_VALIDATION_ERROR"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeAutoscalingValidationError);
        }
        if ([value caseInsensitiveCompare:@"AUTO_SCALING_CONFIGURATION"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeAutoScalingConfiguration);
        }
        if ([value caseInsensitiveCompare:@"AUTO_SCALING_IAM_ROLE_PERMISSIONS"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeAutoScalingIamRolePermissions);
        }
        if ([value caseInsensitiveCompare:@"CODEDEPLOY_RESOURCE_CANNOT_BE_FOUND"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeCodedeployResourceCannotBeFound);
        }
        if ([value caseInsensitiveCompare:@"CUSTOMER_APPLICATION_UNHEALTHY"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeCustomerApplicationUnhealthy);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYMENT_GROUP_MISSING"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeDeploymentGroupMissing);
        }
        if ([value caseInsensitiveCompare:@"ECS_UPDATE_ERROR"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeEcsUpdateError);
        }
        if ([value caseInsensitiveCompare:@"ELASTIC_LOAD_BALANCING_INVALID"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeElasticLoadBalancingInvalid);
        }
        if ([value caseInsensitiveCompare:@"ELB_INVALID_INSTANCE"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeElbInvalidInstance);
        }
        if ([value caseInsensitiveCompare:@"HEALTH_CONSTRAINTS"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeHealthConstraints);
        }
        if ([value caseInsensitiveCompare:@"HEALTH_CONSTRAINTS_INVALID"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeHealthConstraintsInvalid);
        }
        if ([value caseInsensitiveCompare:@"HOOK_EXECUTION_FAILURE"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeHookExecutionFailure);
        }
        if ([value caseInsensitiveCompare:@"IAM_ROLE_MISSING"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeIamRoleMissing);
        }
        if ([value caseInsensitiveCompare:@"IAM_ROLE_PERMISSIONS"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeIamRolePermissions);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_ERROR"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"INVALID_ECS_SERVICE"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeInvalidEcsService);
        }
        if ([value caseInsensitiveCompare:@"INVALID_LAMBDA_CONFIGURATION"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeInvalidLambdaConfiguration);
        }
        if ([value caseInsensitiveCompare:@"INVALID_LAMBDA_FUNCTION"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeInvalidLambdaFunction);
        }
        if ([value caseInsensitiveCompare:@"INVALID_REVISION"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeInvalidRevision);
        }
        if ([value caseInsensitiveCompare:@"MANUAL_STOP"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeManualStop);
        }
        if ([value caseInsensitiveCompare:@"MISSING_BLUE_GREEN_DEPLOYMENT_CONFIGURATION"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeMissingBlueGreenDeploymentConfiguration);
        }
        if ([value caseInsensitiveCompare:@"MISSING_ELB_INFORMATION"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeMissingElbInformation);
        }
        if ([value caseInsensitiveCompare:@"MISSING_GITHUB_TOKEN"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeMissingGithubToken);
        }
        if ([value caseInsensitiveCompare:@"NO_EC2_SUBSCRIPTION"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeNoEc2Subscription);
        }
        if ([value caseInsensitiveCompare:@"NO_INSTANCES"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeNoInstances);
        }
        if ([value caseInsensitiveCompare:@"OVER_MAX_INSTANCES"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeOverMaxInstances);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_LIMIT_EXCEEDED"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeResourceLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"REVISION_MISSING"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeRevisionMissing);
        }
        if ([value caseInsensitiveCompare:@"THROTTLED"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeThrottled);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeTimeout);
        }
        if ([value caseInsensitiveCompare:@"CLOUDFORMATION_STACK_FAILURE"] == NSOrderedSame) {
            return @(AWSCodedeployErrorCodeCloudformationStackFailure);
        }
        return @(AWSCodedeployErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployErrorCodeAgentIssue:
                return @"AGENT_ISSUE";
            case AWSCodedeployErrorCodeAlarmActive:
                return @"ALARM_ACTIVE";
            case AWSCodedeployErrorCodeApplicationMissing:
                return @"APPLICATION_MISSING";
            case AWSCodedeployErrorCodeAutoscalingValidationError:
                return @"AUTOSCALING_VALIDATION_ERROR";
            case AWSCodedeployErrorCodeAutoScalingConfiguration:
                return @"AUTO_SCALING_CONFIGURATION";
            case AWSCodedeployErrorCodeAutoScalingIamRolePermissions:
                return @"AUTO_SCALING_IAM_ROLE_PERMISSIONS";
            case AWSCodedeployErrorCodeCodedeployResourceCannotBeFound:
                return @"CODEDEPLOY_RESOURCE_CANNOT_BE_FOUND";
            case AWSCodedeployErrorCodeCustomerApplicationUnhealthy:
                return @"CUSTOMER_APPLICATION_UNHEALTHY";
            case AWSCodedeployErrorCodeDeploymentGroupMissing:
                return @"DEPLOYMENT_GROUP_MISSING";
            case AWSCodedeployErrorCodeEcsUpdateError:
                return @"ECS_UPDATE_ERROR";
            case AWSCodedeployErrorCodeElasticLoadBalancingInvalid:
                return @"ELASTIC_LOAD_BALANCING_INVALID";
            case AWSCodedeployErrorCodeElbInvalidInstance:
                return @"ELB_INVALID_INSTANCE";
            case AWSCodedeployErrorCodeHealthConstraints:
                return @"HEALTH_CONSTRAINTS";
            case AWSCodedeployErrorCodeHealthConstraintsInvalid:
                return @"HEALTH_CONSTRAINTS_INVALID";
            case AWSCodedeployErrorCodeHookExecutionFailure:
                return @"HOOK_EXECUTION_FAILURE";
            case AWSCodedeployErrorCodeIamRoleMissing:
                return @"IAM_ROLE_MISSING";
            case AWSCodedeployErrorCodeIamRolePermissions:
                return @"IAM_ROLE_PERMISSIONS";
            case AWSCodedeployErrorCodeInternalError:
                return @"INTERNAL_ERROR";
            case AWSCodedeployErrorCodeInvalidEcsService:
                return @"INVALID_ECS_SERVICE";
            case AWSCodedeployErrorCodeInvalidLambdaConfiguration:
                return @"INVALID_LAMBDA_CONFIGURATION";
            case AWSCodedeployErrorCodeInvalidLambdaFunction:
                return @"INVALID_LAMBDA_FUNCTION";
            case AWSCodedeployErrorCodeInvalidRevision:
                return @"INVALID_REVISION";
            case AWSCodedeployErrorCodeManualStop:
                return @"MANUAL_STOP";
            case AWSCodedeployErrorCodeMissingBlueGreenDeploymentConfiguration:
                return @"MISSING_BLUE_GREEN_DEPLOYMENT_CONFIGURATION";
            case AWSCodedeployErrorCodeMissingElbInformation:
                return @"MISSING_ELB_INFORMATION";
            case AWSCodedeployErrorCodeMissingGithubToken:
                return @"MISSING_GITHUB_TOKEN";
            case AWSCodedeployErrorCodeNoEc2Subscription:
                return @"NO_EC2_SUBSCRIPTION";
            case AWSCodedeployErrorCodeNoInstances:
                return @"NO_INSTANCES";
            case AWSCodedeployErrorCodeOverMaxInstances:
                return @"OVER_MAX_INSTANCES";
            case AWSCodedeployErrorCodeResourceLimitExceeded:
                return @"RESOURCE_LIMIT_EXCEEDED";
            case AWSCodedeployErrorCodeRevisionMissing:
                return @"REVISION_MISSING";
            case AWSCodedeployErrorCodeThrottled:
                return @"THROTTLED";
            case AWSCodedeployErrorCodeTimeout:
                return @"TIMEOUT";
            case AWSCodedeployErrorCodeCloudformationStackFailure:
                return @"CLOUDFORMATION_STACK_FAILURE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployGenericRevisionInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentGroups" : @"deploymentGroups",
             @"detail" : @"description",
             @"firstUsedTime" : @"firstUsedTime",
             @"lastUsedTime" : @"lastUsedTime",
             @"registerTime" : @"registerTime",
             };
}

+ (NSValueTransformer *)firstUsedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUsedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)registerTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCodedeployGetApplicationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             };
}

@end

@implementation AWSCodedeployGetApplicationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"application" : @"application",
             };
}

+ (NSValueTransformer *)applicationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployApplicationInfo class]];
}

@end

@implementation AWSCodedeployGetApplicationRevisionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"revision" : @"revision",
             };
}

+ (NSValueTransformer *)revisionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployRevisionLocation class]];
}

@end

@implementation AWSCodedeployGetApplicationRevisionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"revision" : @"revision",
             @"revisionInfo" : @"revisionInfo",
             };
}

+ (NSValueTransformer *)revisionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployRevisionLocation class]];
}

+ (NSValueTransformer *)revisionInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployGenericRevisionInfo class]];
}

@end

@implementation AWSCodedeployGetDeploymentConfigInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentConfigName" : @"deploymentConfigName",
             };
}

@end

@implementation AWSCodedeployGetDeploymentConfigOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentConfigInfo" : @"deploymentConfigInfo",
             };
}

+ (NSValueTransformer *)deploymentConfigInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployDeploymentConfigInfo class]];
}

@end

@implementation AWSCodedeployGetDeploymentGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"deploymentGroupName" : @"deploymentGroupName",
             };
}

@end

@implementation AWSCodedeployGetDeploymentGroupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentGroupInfo" : @"deploymentGroupInfo",
             };
}

+ (NSValueTransformer *)deploymentGroupInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployDeploymentGroupInfo class]];
}

@end

@implementation AWSCodedeployGetDeploymentInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             };
}

@end

@implementation AWSCodedeployGetDeploymentInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             @"instanceId" : @"instanceId",
             };
}

@end

@implementation AWSCodedeployGetDeploymentInstanceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceSummary" : @"instanceSummary",
             };
}

+ (NSValueTransformer *)instanceSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployInstanceSummary class]];
}

@end

@implementation AWSCodedeployGetDeploymentOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentInfo" : @"deploymentInfo",
             };
}

+ (NSValueTransformer *)deploymentInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployDeploymentInfo class]];
}

@end

@implementation AWSCodedeployGetDeploymentTargetInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             @"targetId" : @"targetId",
             };
}

@end

@implementation AWSCodedeployGetDeploymentTargetOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentTarget" : @"deploymentTarget",
             };
}

+ (NSValueTransformer *)deploymentTargetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployDeploymentTarget class]];
}

@end

@implementation AWSCodedeployGetOnPremisesInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceName" : @"instanceName",
             };
}

@end

@implementation AWSCodedeployGetOnPremisesInstanceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceInfo" : @"instanceInfo",
             };
}

+ (NSValueTransformer *)instanceInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployInstanceInfo class]];
}

@end

@implementation AWSCodedeployGitHubLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitId" : @"commitId",
             @"repository" : @"repository",
             };
}

@end

@implementation AWSCodedeployGreenFleetProvisioningOption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"action",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISCOVER_EXISTING"] == NSOrderedSame) {
            return @(AWSCodedeployGreenFleetProvisioningActionDiscoverExisting);
        }
        if ([value caseInsensitiveCompare:@"COPY_AUTO_SCALING_GROUP"] == NSOrderedSame) {
            return @(AWSCodedeployGreenFleetProvisioningActionCopyAutoScalingGroup);
        }
        return @(AWSCodedeployGreenFleetProvisioningActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployGreenFleetProvisioningActionDiscoverExisting:
                return @"DISCOVER_EXISTING";
            case AWSCodedeployGreenFleetProvisioningActionCopyAutoScalingGroup:
                return @"COPY_AUTO_SCALING_GROUP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployInstanceInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deregisterTime" : @"deregisterTime",
             @"iamSessionArn" : @"iamSessionArn",
             @"iamUserArn" : @"iamUserArn",
             @"instanceArn" : @"instanceArn",
             @"instanceName" : @"instanceName",
             @"registerTime" : @"registerTime",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)deregisterTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)registerTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTag class]];
}

@end

@implementation AWSCodedeployInstanceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             @"instanceId" : @"instanceId",
             @"instanceType" : @"instanceType",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"lifecycleEvents" : @"lifecycleEvents",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Blue"] == NSOrderedSame) {
            return @(AWSCodedeployInstanceTypeBlue);
        }
        if ([value caseInsensitiveCompare:@"Green"] == NSOrderedSame) {
            return @(AWSCodedeployInstanceTypeGreen);
        }
        return @(AWSCodedeployInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployInstanceTypeBlue:
                return @"Blue";
            case AWSCodedeployInstanceTypeGreen:
                return @"Green";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lifecycleEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployLifecycleEvent class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSCodedeployInstanceStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSCodedeployInstanceStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSCodedeployInstanceStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCodedeployInstanceStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Skipped"] == NSOrderedSame) {
            return @(AWSCodedeployInstanceStatusSkipped);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSCodedeployInstanceStatusUnknown);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSCodedeployInstanceStatusReady);
        }
        return @(AWSCodedeployInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployInstanceStatusPending:
                return @"Pending";
            case AWSCodedeployInstanceStatusInProgress:
                return @"InProgress";
            case AWSCodedeployInstanceStatusSucceeded:
                return @"Succeeded";
            case AWSCodedeployInstanceStatusFailed:
                return @"Failed";
            case AWSCodedeployInstanceStatusSkipped:
                return @"Skipped";
            case AWSCodedeployInstanceStatusUnknown:
                return @"Unknown";
            case AWSCodedeployInstanceStatusReady:
                return @"Ready";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployInstanceTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             @"instanceLabel" : @"instanceLabel",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"lifecycleEvents" : @"lifecycleEvents",
             @"status" : @"status",
             @"targetArn" : @"targetArn",
             @"targetId" : @"targetId",
             };
}

+ (NSValueTransformer *)instanceLabelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Blue"] == NSOrderedSame) {
            return @(AWSCodedeployTargetLabelBlue);
        }
        if ([value caseInsensitiveCompare:@"Green"] == NSOrderedSame) {
            return @(AWSCodedeployTargetLabelGreen);
        }
        return @(AWSCodedeployTargetLabelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployTargetLabelBlue:
                return @"Blue";
            case AWSCodedeployTargetLabelGreen:
                return @"Green";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lifecycleEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployLifecycleEvent class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Skipped"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusSkipped);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusUnknown);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusReady);
        }
        return @(AWSCodedeployTargetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployTargetStatusPending:
                return @"Pending";
            case AWSCodedeployTargetStatusInProgress:
                return @"InProgress";
            case AWSCodedeployTargetStatusSucceeded:
                return @"Succeeded";
            case AWSCodedeployTargetStatusFailed:
                return @"Failed";
            case AWSCodedeployTargetStatusSkipped:
                return @"Skipped";
            case AWSCodedeployTargetStatusUnknown:
                return @"Unknown";
            case AWSCodedeployTargetStatusReady:
                return @"Ready";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployLambdaFunctionInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentVersion" : @"currentVersion",
             @"functionAlias" : @"functionAlias",
             @"functionName" : @"functionName",
             @"targetVersion" : @"targetVersion",
             @"targetVersionWeight" : @"targetVersionWeight",
             };
}

@end

@implementation AWSCodedeployLambdaTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             @"lambdaFunctionInfo" : @"lambdaFunctionInfo",
             @"lastUpdatedAt" : @"lastUpdatedAt",
             @"lifecycleEvents" : @"lifecycleEvents",
             @"status" : @"status",
             @"targetArn" : @"targetArn",
             @"targetId" : @"targetId",
             };
}

+ (NSValueTransformer *)lambdaFunctionInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployLambdaFunctionInfo class]];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lifecycleEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployLifecycleEvent class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Skipped"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusSkipped);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusUnknown);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSCodedeployTargetStatusReady);
        }
        return @(AWSCodedeployTargetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployTargetStatusPending:
                return @"Pending";
            case AWSCodedeployTargetStatusInProgress:
                return @"InProgress";
            case AWSCodedeployTargetStatusSucceeded:
                return @"Succeeded";
            case AWSCodedeployTargetStatusFailed:
                return @"Failed";
            case AWSCodedeployTargetStatusSkipped:
                return @"Skipped";
            case AWSCodedeployTargetStatusUnknown:
                return @"Unknown";
            case AWSCodedeployTargetStatusReady:
                return @"Ready";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployLastDeploymentInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"createTime",
             @"deploymentId" : @"deploymentId",
             @"endTime" : @"endTime",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Created"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"Queued"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Baking"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusBaking);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSCodedeployDeploymentStatusReady);
        }
        return @(AWSCodedeployDeploymentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployDeploymentStatusCreated:
                return @"Created";
            case AWSCodedeployDeploymentStatusQueued:
                return @"Queued";
            case AWSCodedeployDeploymentStatusInProgress:
                return @"InProgress";
            case AWSCodedeployDeploymentStatusBaking:
                return @"Baking";
            case AWSCodedeployDeploymentStatusSucceeded:
                return @"Succeeded";
            case AWSCodedeployDeploymentStatusFailed:
                return @"Failed";
            case AWSCodedeployDeploymentStatusStopped:
                return @"Stopped";
            case AWSCodedeployDeploymentStatusReady:
                return @"Ready";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployLifecycleEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diagnostics" : @"diagnostics",
             @"endTime" : @"endTime",
             @"lifecycleEventName" : @"lifecycleEventName",
             @"startTime" : @"startTime",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)diagnosticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployDiagnostics class]];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleEventStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleEventStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleEventStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleEventStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Skipped"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleEventStatusSkipped);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleEventStatusUnknown);
        }
        return @(AWSCodedeployLifecycleEventStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployLifecycleEventStatusPending:
                return @"Pending";
            case AWSCodedeployLifecycleEventStatusInProgress:
                return @"InProgress";
            case AWSCodedeployLifecycleEventStatusSucceeded:
                return @"Succeeded";
            case AWSCodedeployLifecycleEventStatusFailed:
                return @"Failed";
            case AWSCodedeployLifecycleEventStatusSkipped:
                return @"Skipped";
            case AWSCodedeployLifecycleEventStatusUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployListApplicationRevisionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"deployed" : @"deployed",
             @"nextToken" : @"nextToken",
             @"s3Bucket" : @"s3Bucket",
             @"s3KeyPrefix" : @"s3KeyPrefix",
             @"sortBy" : @"sortBy",
             @"sortOrder" : @"sortOrder",
             };
}

+ (NSValueTransformer *)deployedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"include"] == NSOrderedSame) {
            return @(AWSCodedeployListStateFilterActionInclude);
        }
        if ([value caseInsensitiveCompare:@"exclude"] == NSOrderedSame) {
            return @(AWSCodedeployListStateFilterActionExclude);
        }
        if ([value caseInsensitiveCompare:@"ignore"] == NSOrderedSame) {
            return @(AWSCodedeployListStateFilterActionIgnore);
        }
        return @(AWSCodedeployListStateFilterActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployListStateFilterActionInclude:
                return @"include";
            case AWSCodedeployListStateFilterActionExclude:
                return @"exclude";
            case AWSCodedeployListStateFilterActionIgnore:
                return @"ignore";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"registerTime"] == NSOrderedSame) {
            return @(AWSCodedeployApplicationRevisionSortByRegisterTime);
        }
        if ([value caseInsensitiveCompare:@"firstUsedTime"] == NSOrderedSame) {
            return @(AWSCodedeployApplicationRevisionSortByFirstUsedTime);
        }
        if ([value caseInsensitiveCompare:@"lastUsedTime"] == NSOrderedSame) {
            return @(AWSCodedeployApplicationRevisionSortByLastUsedTime);
        }
        return @(AWSCodedeployApplicationRevisionSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployApplicationRevisionSortByRegisterTime:
                return @"registerTime";
            case AWSCodedeployApplicationRevisionSortByFirstUsedTime:
                return @"firstUsedTime";
            case AWSCodedeployApplicationRevisionSortByLastUsedTime:
                return @"lastUsedTime";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ascending"] == NSOrderedSame) {
            return @(AWSCodedeploySortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"descending"] == NSOrderedSame) {
            return @(AWSCodedeploySortOrderDescending);
        }
        return @(AWSCodedeploySortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeploySortOrderAscending:
                return @"ascending";
            case AWSCodedeploySortOrderDescending:
                return @"descending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployListApplicationRevisionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"revisions" : @"revisions",
             };
}

+ (NSValueTransformer *)revisionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployRevisionLocation class]];
}

@end

@implementation AWSCodedeployListApplicationsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodedeployListApplicationsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applications" : @"applications",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodedeployListDeploymentConfigsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodedeployListDeploymentConfigsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentConfigsList" : @"deploymentConfigsList",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodedeployListDeploymentGroupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodedeployListDeploymentGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"deploymentGroups" : @"deploymentGroups",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodedeployListDeploymentInstancesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             @"instanceStatusFilter" : @"instanceStatusFilter",
             @"instanceTypeFilter" : @"instanceTypeFilter",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodedeployListDeploymentInstancesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instancesList" : @"instancesList",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodedeployListDeploymentTargetsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             @"nextToken" : @"nextToken",
             @"targetFilters" : @"targetFilters",
             };
}

@end

@implementation AWSCodedeployListDeploymentTargetsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"targetIds" : @"targetIds",
             };
}

@end

@implementation AWSCodedeployListDeploymentsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"createTimeRange" : @"createTimeRange",
             @"deploymentGroupName" : @"deploymentGroupName",
             @"externalId" : @"externalId",
             @"includeOnlyStatuses" : @"includeOnlyStatuses",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)createTimeRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployTimeRange class]];
}

@end

@implementation AWSCodedeployListDeploymentsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deployments" : @"deployments",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodedeployListGitHubAccountTokenNamesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodedeployListGitHubAccountTokenNamesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"tokenNameList" : @"tokenNameList",
             };
}

@end

@implementation AWSCodedeployListOnPremisesInstancesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"registrationStatus" : @"registrationStatus",
             @"tagFilters" : @"tagFilters",
             };
}

+ (NSValueTransformer *)registrationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Registered"] == NSOrderedSame) {
            return @(AWSCodedeployRegistrationStatusRegistered);
        }
        if ([value caseInsensitiveCompare:@"Deregistered"] == NSOrderedSame) {
            return @(AWSCodedeployRegistrationStatusDeregistered);
        }
        return @(AWSCodedeployRegistrationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployRegistrationStatusRegistered:
                return @"Registered";
            case AWSCodedeployRegistrationStatusDeregistered:
                return @"Deregistered";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTagFilter class]];
}

@end

@implementation AWSCodedeployListOnPremisesInstancesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceNames" : @"instanceNames",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSCodedeployListTagsForResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSCodedeployListTagsForResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTag class]];
}

@end

@implementation AWSCodedeployLoadBalancerInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"elbInfoList" : @"elbInfoList",
             @"targetGroupInfoList" : @"targetGroupInfoList",
             @"targetGroupPairInfoList" : @"targetGroupPairInfoList",
             };
}

+ (NSValueTransformer *)elbInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployELBInfo class]];
}

+ (NSValueTransformer *)targetGroupInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTargetGroupInfo class]];
}

+ (NSValueTransformer *)targetGroupPairInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTargetGroupPairInfo class]];
}

@end

@implementation AWSCodedeployMinimumHealthyHosts

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"type",
             @"value" : @"value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HOST_COUNT"] == NSOrderedSame) {
            return @(AWSCodedeployMinimumHealthyHostsTypeHostCount);
        }
        if ([value caseInsensitiveCompare:@"FLEET_PERCENT"] == NSOrderedSame) {
            return @(AWSCodedeployMinimumHealthyHostsTypeFleetPercent);
        }
        return @(AWSCodedeployMinimumHealthyHostsTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployMinimumHealthyHostsTypeHostCount:
                return @"HOST_COUNT";
            case AWSCodedeployMinimumHealthyHostsTypeFleetPercent:
                return @"FLEET_PERCENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployOnPremisesTagSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"onPremisesTagSetList" : @"onPremisesTagSetList",
             };
}

@end

@implementation AWSCodedeployPutLifecycleEventHookExecutionStatusInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             @"lifecycleEventHookExecutionId" : @"lifecycleEventHookExecutionId",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleEventStatusPending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleEventStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleEventStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleEventStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Skipped"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleEventStatusSkipped);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSCodedeployLifecycleEventStatusUnknown);
        }
        return @(AWSCodedeployLifecycleEventStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployLifecycleEventStatusPending:
                return @"Pending";
            case AWSCodedeployLifecycleEventStatusInProgress:
                return @"InProgress";
            case AWSCodedeployLifecycleEventStatusSucceeded:
                return @"Succeeded";
            case AWSCodedeployLifecycleEventStatusFailed:
                return @"Failed";
            case AWSCodedeployLifecycleEventStatusSkipped:
                return @"Skipped";
            case AWSCodedeployLifecycleEventStatusUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployPutLifecycleEventHookExecutionStatusOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecycleEventHookExecutionId" : @"lifecycleEventHookExecutionId",
             };
}

@end

@implementation AWSCodedeployRawString

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"content",
             @"sha256" : @"sha256",
             };
}

@end

@implementation AWSCodedeployRegisterApplicationRevisionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"detail" : @"description",
             @"revision" : @"revision",
             };
}

+ (NSValueTransformer *)revisionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployRevisionLocation class]];
}

@end

@implementation AWSCodedeployRegisterOnPremisesInstanceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iamSessionArn" : @"iamSessionArn",
             @"iamUserArn" : @"iamUserArn",
             @"instanceName" : @"instanceName",
             };
}

@end

@implementation AWSCodedeployRemoveTagsFromOnPremisesInstancesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceNames" : @"instanceNames",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTag class]];
}

@end

@implementation AWSCodedeployRevisionInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"genericRevisionInfo" : @"genericRevisionInfo",
             @"revisionLocation" : @"revisionLocation",
             };
}

+ (NSValueTransformer *)genericRevisionInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployGenericRevisionInfo class]];
}

+ (NSValueTransformer *)revisionLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployRevisionLocation class]];
}

@end

@implementation AWSCodedeployRevisionLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appSpecContent" : @"appSpecContent",
             @"gitHubLocation" : @"gitHubLocation",
             @"revisionType" : @"revisionType",
             @"s3Location" : @"s3Location",
             @"string" : @"string",
             };
}

+ (NSValueTransformer *)appSpecContentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployAppSpecContent class]];
}

+ (NSValueTransformer *)gitHubLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployGitHubLocation class]];
}

+ (NSValueTransformer *)revisionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSCodedeployRevisionLocationTypeS3);
        }
        if ([value caseInsensitiveCompare:@"GitHub"] == NSOrderedSame) {
            return @(AWSCodedeployRevisionLocationTypeGitHub);
        }
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSCodedeployRevisionLocationTypeString);
        }
        if ([value caseInsensitiveCompare:@"AppSpecContent"] == NSOrderedSame) {
            return @(AWSCodedeployRevisionLocationTypeAppSpecContent);
        }
        return @(AWSCodedeployRevisionLocationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployRevisionLocationTypeS3:
                return @"S3";
            case AWSCodedeployRevisionLocationTypeGitHub:
                return @"GitHub";
            case AWSCodedeployRevisionLocationTypeString:
                return @"String";
            case AWSCodedeployRevisionLocationTypeAppSpecContent:
                return @"AppSpecContent";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3LocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployS3Location class]];
}

+ (NSValueTransformer *)stringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployRawString class]];
}

@end

@implementation AWSCodedeployRollbackInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rollbackDeploymentId" : @"rollbackDeploymentId",
             @"rollbackMessage" : @"rollbackMessage",
             @"rollbackTriggeringDeploymentId" : @"rollbackTriggeringDeploymentId",
             };
}

@end

@implementation AWSCodedeployS3Location

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"bucket",
             @"bundleType" : @"bundleType",
             @"eTag" : @"eTag",
             @"key" : @"key",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)bundleTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"tar"] == NSOrderedSame) {
            return @(AWSCodedeployBundleTypeTar);
        }
        if ([value caseInsensitiveCompare:@"tgz"] == NSOrderedSame) {
            return @(AWSCodedeployBundleTypeTgz);
        }
        if ([value caseInsensitiveCompare:@"zip"] == NSOrderedSame) {
            return @(AWSCodedeployBundleTypeZip);
        }
        if ([value caseInsensitiveCompare:@"YAML"] == NSOrderedSame) {
            return @(AWSCodedeployBundleTypeYaml);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSCodedeployBundleTypeJson);
        }
        return @(AWSCodedeployBundleTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployBundleTypeTar:
                return @"tar";
            case AWSCodedeployBundleTypeTgz:
                return @"tgz";
            case AWSCodedeployBundleTypeZip:
                return @"zip";
            case AWSCodedeployBundleTypeYaml:
                return @"YAML";
            case AWSCodedeployBundleTypeJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeploySkipWaitTimeForInstanceTerminationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"deploymentId",
             };
}

@end

@implementation AWSCodedeployStopDeploymentInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoRollbackEnabled" : @"autoRollbackEnabled",
             @"deploymentId" : @"deploymentId",
             };
}

@end

@implementation AWSCodedeployStopDeploymentOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             @"statusMessage" : @"statusMessage",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSCodedeployStopStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSCodedeployStopStatusSucceeded);
        }
        return @(AWSCodedeployStopStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployStopStatusPending:
                return @"Pending";
            case AWSCodedeployStopStatusSucceeded:
                return @"Succeeded";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSCodedeployTagFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"KEY_ONLY"] == NSOrderedSame) {
            return @(AWSCodedeployTagFilterTypeKeyOnly);
        }
        if ([value caseInsensitiveCompare:@"VALUE_ONLY"] == NSOrderedSame) {
            return @(AWSCodedeployTagFilterTypeValueOnly);
        }
        if ([value caseInsensitiveCompare:@"KEY_AND_VALUE"] == NSOrderedSame) {
            return @(AWSCodedeployTagFilterTypeKeyAndValue);
        }
        return @(AWSCodedeployTagFilterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployTagFilterTypeKeyOnly:
                return @"KEY_ONLY";
            case AWSCodedeployTagFilterTypeValueOnly:
                return @"VALUE_ONLY";
            case AWSCodedeployTagFilterTypeKeyAndValue:
                return @"KEY_AND_VALUE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployTagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTag class]];
}

@end

@implementation AWSCodedeployTagResourceOutput

@end

@implementation AWSCodedeployTargetGroupInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             };
}

@end

@implementation AWSCodedeployTargetGroupPairInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prodTrafficRoute" : @"prodTrafficRoute",
             @"targetGroups" : @"targetGroups",
             @"testTrafficRoute" : @"testTrafficRoute",
             };
}

+ (NSValueTransformer *)prodTrafficRouteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployTrafficRoute class]];
}

+ (NSValueTransformer *)targetGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTargetGroupInfo class]];
}

+ (NSValueTransformer *)testTrafficRouteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployTrafficRoute class]];
}

@end

@implementation AWSCodedeployTargetInstances

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroups" : @"autoScalingGroups",
             @"ec2TagSet" : @"ec2TagSet",
             @"tagFilters" : @"tagFilters",
             };
}

+ (NSValueTransformer *)ec2TagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployEC2TagSet class]];
}

+ (NSValueTransformer *)tagFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployEC2TagFilter class]];
}

@end

@implementation AWSCodedeployTimeBasedCanary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"canaryInterval" : @"canaryInterval",
             @"canaryPercentage" : @"canaryPercentage",
             };
}

@end

@implementation AWSCodedeployTimeBasedLinear

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"linearInterval" : @"linearInterval",
             @"linearPercentage" : @"linearPercentage",
             };
}

@end

@implementation AWSCodedeployTimeRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"end" : @"end",
             @"start" : @"start",
             };
}

+ (NSValueTransformer *)endJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCodedeployTrafficRoute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listenerArns" : @"listenerArns",
             };
}

@end

@implementation AWSCodedeployTrafficRoutingConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timeBasedCanary" : @"timeBasedCanary",
             @"timeBasedLinear" : @"timeBasedLinear",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)timeBasedCanaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployTimeBasedCanary class]];
}

+ (NSValueTransformer *)timeBasedLinearJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployTimeBasedLinear class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TimeBasedCanary"] == NSOrderedSame) {
            return @(AWSCodedeployTrafficRoutingTypeTimeBasedCanary);
        }
        if ([value caseInsensitiveCompare:@"TimeBasedLinear"] == NSOrderedSame) {
            return @(AWSCodedeployTrafficRoutingTypeTimeBasedLinear);
        }
        if ([value caseInsensitiveCompare:@"AllAtOnce"] == NSOrderedSame) {
            return @(AWSCodedeployTrafficRoutingTypeAllAtOnce);
        }
        return @(AWSCodedeployTrafficRoutingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCodedeployTrafficRoutingTypeTimeBasedCanary:
                return @"TimeBasedCanary";
            case AWSCodedeployTrafficRoutingTypeTimeBasedLinear:
                return @"TimeBasedLinear";
            case AWSCodedeployTrafficRoutingTypeAllAtOnce:
                return @"AllAtOnce";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCodedeployTriggerConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"triggerEvents" : @"triggerEvents",
             @"triggerName" : @"triggerName",
             @"triggerTargetArn" : @"triggerTargetArn",
             };
}

@end

@implementation AWSCodedeployUntagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSCodedeployUntagResourceOutput

@end

@implementation AWSCodedeployUpdateApplicationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"applicationName",
             @"latestApplicationName" : @"newApplicationName",
             };
}

@end

@implementation AWSCodedeployUpdateDeploymentGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmConfiguration" : @"alarmConfiguration",
             @"applicationName" : @"applicationName",
             @"autoRollbackConfiguration" : @"autoRollbackConfiguration",
             @"autoScalingGroups" : @"autoScalingGroups",
             @"blueGreenDeploymentConfiguration" : @"blueGreenDeploymentConfiguration",
             @"currentDeploymentGroupName" : @"currentDeploymentGroupName",
             @"deploymentConfigName" : @"deploymentConfigName",
             @"deploymentStyle" : @"deploymentStyle",
             @"ec2TagFilters" : @"ec2TagFilters",
             @"ec2TagSet" : @"ec2TagSet",
             @"ecsServices" : @"ecsServices",
             @"loadBalancerInfo" : @"loadBalancerInfo",
             @"latestDeploymentGroupName" : @"newDeploymentGroupName",
             @"onPremisesInstanceTagFilters" : @"onPremisesInstanceTagFilters",
             @"onPremisesTagSet" : @"onPremisesTagSet",
             @"serviceRoleArn" : @"serviceRoleArn",
             @"triggerConfigurations" : @"triggerConfigurations",
             };
}

+ (NSValueTransformer *)alarmConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployAlarmConfiguration class]];
}

+ (NSValueTransformer *)autoRollbackConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployAutoRollbackConfiguration class]];
}

+ (NSValueTransformer *)blueGreenDeploymentConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployBlueGreenDeploymentConfiguration class]];
}

+ (NSValueTransformer *)deploymentStyleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployDeploymentStyle class]];
}

+ (NSValueTransformer *)ec2TagFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployEC2TagFilter class]];
}

+ (NSValueTransformer *)ec2TagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployEC2TagSet class]];
}

+ (NSValueTransformer *)ecsServicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployECSService class]];
}

+ (NSValueTransformer *)loadBalancerInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployLoadBalancerInfo class]];
}

+ (NSValueTransformer *)onPremisesInstanceTagFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTagFilter class]];
}

+ (NSValueTransformer *)onPremisesTagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCodedeployOnPremisesTagSet class]];
}

+ (NSValueTransformer *)triggerConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployTriggerConfig class]];
}

@end

@implementation AWSCodedeployUpdateDeploymentGroupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hooksNotCleanedUp" : @"hooksNotCleanedUp",
             };
}

+ (NSValueTransformer *)hooksNotCleanedUpJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCodedeployAutoScalingGroup class]];
}

@end
