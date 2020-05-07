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

#import "AWSAppConfigModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSAppConfigErrorDomain = @"com.amazonaws.AWSAppConfigErrorDomain";

@implementation AWSAppConfigApplication

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAppConfigApplications

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppConfigApplication class]];
}

@end

@implementation AWSAppConfigConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationVersion" : @"ConfigurationVersion",
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             };
}

@end

@implementation AWSAppConfigConfigurationProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"locationUri" : @"LocationUri",
             @"name" : @"Name",
             @"retrievalRoleArn" : @"RetrievalRoleArn",
             @"validators" : @"Validators",
             };
}

+ (NSValueTransformer *)validatorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppConfigValidator class]];
}

@end

@implementation AWSAppConfigConfigurationProfileSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"identifier" : @"Id",
             @"locationUri" : @"LocationUri",
             @"name" : @"Name",
             @"validatorTypes" : @"ValidatorTypes",
             };
}

@end

@implementation AWSAppConfigConfigurationProfiles

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppConfigConfigurationProfileSummary class]];
}

@end

@implementation AWSAppConfigCreateApplicationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSAppConfigCreateConfigurationProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"detail" : @"Description",
             @"locationUri" : @"LocationUri",
             @"name" : @"Name",
             @"retrievalRoleArn" : @"RetrievalRoleArn",
             @"tags" : @"Tags",
             @"validators" : @"Validators",
             };
}

+ (NSValueTransformer *)validatorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppConfigValidator class]];
}

@end

@implementation AWSAppConfigCreateDeploymentStrategyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentDurationInMinutes" : @"DeploymentDurationInMinutes",
             @"detail" : @"Description",
             @"finalBakeTimeInMinutes" : @"FinalBakeTimeInMinutes",
             @"growthFactor" : @"GrowthFactor",
             @"growthType" : @"GrowthType",
             @"name" : @"Name",
             @"replicateTo" : @"ReplicateTo",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)growthTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LINEAR"] == NSOrderedSame) {
            return @(AWSAppConfigGrowthTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"EXPONENTIAL"] == NSOrderedSame) {
            return @(AWSAppConfigGrowthTypeExponential);
        }
        return @(AWSAppConfigGrowthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppConfigGrowthTypeLinear:
                return @"LINEAR";
            case AWSAppConfigGrowthTypeExponential:
                return @"EXPONENTIAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)replicateToJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSAppConfigReplicateToNone);
        }
        if ([value caseInsensitiveCompare:@"SSM_DOCUMENT"] == NSOrderedSame) {
            return @(AWSAppConfigReplicateToSsmDocument);
        }
        return @(AWSAppConfigReplicateToUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppConfigReplicateToNone:
                return @"NONE";
            case AWSAppConfigReplicateToSsmDocument:
                return @"SSM_DOCUMENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppConfigCreateEnvironmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"detail" : @"Description",
             @"monitors" : @"Monitors",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)monitorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppConfigMonitor class]];
}

@end

@implementation AWSAppConfigDeleteApplicationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSAppConfigDeleteConfigurationProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"configurationProfileId" : @"ConfigurationProfileId",
             };
}

@end

@implementation AWSAppConfigDeleteDeploymentStrategyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentStrategyId" : @"DeploymentStrategyId",
             };
}

@end

@implementation AWSAppConfigDeleteEnvironmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"environmentId" : @"EnvironmentId",
             };
}

@end

@implementation AWSAppConfigDeployment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"completedAt" : @"CompletedAt",
             @"configurationLocationUri" : @"ConfigurationLocationUri",
             @"configurationName" : @"ConfigurationName",
             @"configurationProfileId" : @"ConfigurationProfileId",
             @"configurationVersion" : @"ConfigurationVersion",
             @"deploymentDurationInMinutes" : @"DeploymentDurationInMinutes",
             @"deploymentNumber" : @"DeploymentNumber",
             @"deploymentStrategyId" : @"DeploymentStrategyId",
             @"detail" : @"Description",
             @"environmentId" : @"EnvironmentId",
             @"eventLog" : @"EventLog",
             @"finalBakeTimeInMinutes" : @"FinalBakeTimeInMinutes",
             @"growthFactor" : @"GrowthFactor",
             @"growthType" : @"GrowthType",
             @"percentageComplete" : @"PercentageComplete",
             @"startedAt" : @"StartedAt",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)completedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)eventLogJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppConfigDeploymentEvent class]];
}

+ (NSValueTransformer *)growthTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LINEAR"] == NSOrderedSame) {
            return @(AWSAppConfigGrowthTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"EXPONENTIAL"] == NSOrderedSame) {
            return @(AWSAppConfigGrowthTypeExponential);
        }
        return @(AWSAppConfigGrowthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppConfigGrowthTypeLinear:
                return @"LINEAR";
            case AWSAppConfigGrowthTypeExponential:
                return @"EXPONENTIAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BAKING"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentStateBaking);
        }
        if ([value caseInsensitiveCompare:@"VALIDATING"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentStateValidating);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYING"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentStateDeploying);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentStateComplete);
        }
        if ([value caseInsensitiveCompare:@"ROLLING_BACK"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentStateRollingBack);
        }
        if ([value caseInsensitiveCompare:@"ROLLED_BACK"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentStateRolledBack);
        }
        return @(AWSAppConfigDeploymentStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppConfigDeploymentStateBaking:
                return @"BAKING";
            case AWSAppConfigDeploymentStateValidating:
                return @"VALIDATING";
            case AWSAppConfigDeploymentStateDeploying:
                return @"DEPLOYING";
            case AWSAppConfigDeploymentStateComplete:
                return @"COMPLETE";
            case AWSAppConfigDeploymentStateRollingBack:
                return @"ROLLING_BACK";
            case AWSAppConfigDeploymentStateRolledBack:
                return @"ROLLED_BACK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppConfigDeploymentEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"eventType" : @"EventType",
             @"occurredAt" : @"OccurredAt",
             @"triggeredBy" : @"TriggeredBy",
             };
}

+ (NSValueTransformer *)eventTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PERCENTAGE_UPDATED"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentEventTypePercentageUpdated);
        }
        if ([value caseInsensitiveCompare:@"ROLLBACK_STARTED"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentEventTypeRollbackStarted);
        }
        if ([value caseInsensitiveCompare:@"ROLLBACK_COMPLETED"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentEventTypeRollbackCompleted);
        }
        if ([value caseInsensitiveCompare:@"BAKE_TIME_STARTED"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentEventTypeBakeTimeStarted);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYMENT_STARTED"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentEventTypeDeploymentStarted);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYMENT_COMPLETED"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentEventTypeDeploymentCompleted);
        }
        return @(AWSAppConfigDeploymentEventTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppConfigDeploymentEventTypePercentageUpdated:
                return @"PERCENTAGE_UPDATED";
            case AWSAppConfigDeploymentEventTypeRollbackStarted:
                return @"ROLLBACK_STARTED";
            case AWSAppConfigDeploymentEventTypeRollbackCompleted:
                return @"ROLLBACK_COMPLETED";
            case AWSAppConfigDeploymentEventTypeBakeTimeStarted:
                return @"BAKE_TIME_STARTED";
            case AWSAppConfigDeploymentEventTypeDeploymentStarted:
                return @"DEPLOYMENT_STARTED";
            case AWSAppConfigDeploymentEventTypeDeploymentCompleted:
                return @"DEPLOYMENT_COMPLETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)occurredAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)triggeredByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSAppConfigTriggeredByUser);
        }
        if ([value caseInsensitiveCompare:@"APPCONFIG"] == NSOrderedSame) {
            return @(AWSAppConfigTriggeredByAppconfig);
        }
        if ([value caseInsensitiveCompare:@"CLOUDWATCH_ALARM"] == NSOrderedSame) {
            return @(AWSAppConfigTriggeredByCloudwatchAlarm);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_ERROR"] == NSOrderedSame) {
            return @(AWSAppConfigTriggeredByInternalError);
        }
        return @(AWSAppConfigTriggeredByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppConfigTriggeredByUser:
                return @"USER";
            case AWSAppConfigTriggeredByAppconfig:
                return @"APPCONFIG";
            case AWSAppConfigTriggeredByCloudwatchAlarm:
                return @"CLOUDWATCH_ALARM";
            case AWSAppConfigTriggeredByInternalError:
                return @"INTERNAL_ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppConfigDeploymentStrategies

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppConfigDeploymentStrategy class]];
}

@end

@implementation AWSAppConfigDeploymentStrategy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentDurationInMinutes" : @"DeploymentDurationInMinutes",
             @"detail" : @"Description",
             @"finalBakeTimeInMinutes" : @"FinalBakeTimeInMinutes",
             @"growthFactor" : @"GrowthFactor",
             @"growthType" : @"GrowthType",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"replicateTo" : @"ReplicateTo",
             };
}

+ (NSValueTransformer *)growthTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LINEAR"] == NSOrderedSame) {
            return @(AWSAppConfigGrowthTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"EXPONENTIAL"] == NSOrderedSame) {
            return @(AWSAppConfigGrowthTypeExponential);
        }
        return @(AWSAppConfigGrowthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppConfigGrowthTypeLinear:
                return @"LINEAR";
            case AWSAppConfigGrowthTypeExponential:
                return @"EXPONENTIAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)replicateToJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSAppConfigReplicateToNone);
        }
        if ([value caseInsensitiveCompare:@"SSM_DOCUMENT"] == NSOrderedSame) {
            return @(AWSAppConfigReplicateToSsmDocument);
        }
        return @(AWSAppConfigReplicateToUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppConfigReplicateToNone:
                return @"NONE";
            case AWSAppConfigReplicateToSsmDocument:
                return @"SSM_DOCUMENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppConfigDeploymentSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completedAt" : @"CompletedAt",
             @"configurationName" : @"ConfigurationName",
             @"configurationVersion" : @"ConfigurationVersion",
             @"deploymentDurationInMinutes" : @"DeploymentDurationInMinutes",
             @"deploymentNumber" : @"DeploymentNumber",
             @"finalBakeTimeInMinutes" : @"FinalBakeTimeInMinutes",
             @"growthFactor" : @"GrowthFactor",
             @"growthType" : @"GrowthType",
             @"percentageComplete" : @"PercentageComplete",
             @"startedAt" : @"StartedAt",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)completedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)growthTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LINEAR"] == NSOrderedSame) {
            return @(AWSAppConfigGrowthTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"EXPONENTIAL"] == NSOrderedSame) {
            return @(AWSAppConfigGrowthTypeExponential);
        }
        return @(AWSAppConfigGrowthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppConfigGrowthTypeLinear:
                return @"LINEAR";
            case AWSAppConfigGrowthTypeExponential:
                return @"EXPONENTIAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BAKING"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentStateBaking);
        }
        if ([value caseInsensitiveCompare:@"VALIDATING"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentStateValidating);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYING"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentStateDeploying);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentStateComplete);
        }
        if ([value caseInsensitiveCompare:@"ROLLING_BACK"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentStateRollingBack);
        }
        if ([value caseInsensitiveCompare:@"ROLLED_BACK"] == NSOrderedSame) {
            return @(AWSAppConfigDeploymentStateRolledBack);
        }
        return @(AWSAppConfigDeploymentStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppConfigDeploymentStateBaking:
                return @"BAKING";
            case AWSAppConfigDeploymentStateValidating:
                return @"VALIDATING";
            case AWSAppConfigDeploymentStateDeploying:
                return @"DEPLOYING";
            case AWSAppConfigDeploymentStateComplete:
                return @"COMPLETE";
            case AWSAppConfigDeploymentStateRollingBack:
                return @"ROLLING_BACK";
            case AWSAppConfigDeploymentStateRolledBack:
                return @"ROLLED_BACK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppConfigDeployments

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppConfigDeploymentSummary class]];
}

@end

@implementation AWSAppConfigEnvironment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"monitors" : @"Monitors",
             @"name" : @"Name",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)monitorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppConfigMonitor class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"READY_FOR_DEPLOYMENT"] == NSOrderedSame) {
            return @(AWSAppConfigEnvironmentStateReadyForDeployment);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYING"] == NSOrderedSame) {
            return @(AWSAppConfigEnvironmentStateDeploying);
        }
        if ([value caseInsensitiveCompare:@"ROLLING_BACK"] == NSOrderedSame) {
            return @(AWSAppConfigEnvironmentStateRollingBack);
        }
        if ([value caseInsensitiveCompare:@"ROLLED_BACK"] == NSOrderedSame) {
            return @(AWSAppConfigEnvironmentStateRolledBack);
        }
        return @(AWSAppConfigEnvironmentStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppConfigEnvironmentStateReadyForDeployment:
                return @"READY_FOR_DEPLOYMENT";
            case AWSAppConfigEnvironmentStateDeploying:
                return @"DEPLOYING";
            case AWSAppConfigEnvironmentStateRollingBack:
                return @"ROLLING_BACK";
            case AWSAppConfigEnvironmentStateRolledBack:
                return @"ROLLED_BACK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppConfigEnvironments

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppConfigEnvironment class]];
}

@end

@implementation AWSAppConfigGetApplicationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSAppConfigGetConfigurationProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"configurationProfileId" : @"ConfigurationProfileId",
             };
}

@end

@implementation AWSAppConfigGetConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"application" : @"Application",
             @"clientConfigurationVersion" : @"ClientConfigurationVersion",
             @"clientId" : @"ClientId",
             @"configuration" : @"Configuration",
             @"environment" : @"Environment",
             };
}

@end

@implementation AWSAppConfigGetDeploymentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"deploymentNumber" : @"DeploymentNumber",
             @"environmentId" : @"EnvironmentId",
             };
}

@end

@implementation AWSAppConfigGetDeploymentStrategyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentStrategyId" : @"DeploymentStrategyId",
             };
}

@end

@implementation AWSAppConfigGetEnvironmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"environmentId" : @"EnvironmentId",
             };
}

@end

@implementation AWSAppConfigListApplicationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAppConfigListConfigurationProfilesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAppConfigListDeploymentStrategiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAppConfigListDeploymentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"environmentId" : @"EnvironmentId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAppConfigListEnvironmentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAppConfigListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSAppConfigMonitor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmArn" : @"AlarmArn",
             @"alarmRoleArn" : @"AlarmRoleArn",
             };
}

@end

@implementation AWSAppConfigResourceTags

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSAppConfigStartDeploymentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"configurationProfileId" : @"ConfigurationProfileId",
             @"configurationVersion" : @"ConfigurationVersion",
             @"deploymentStrategyId" : @"DeploymentStrategyId",
             @"detail" : @"Description",
             @"environmentId" : @"EnvironmentId",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSAppConfigStopDeploymentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"deploymentNumber" : @"DeploymentNumber",
             @"environmentId" : @"EnvironmentId",
             };
}

@end

@implementation AWSAppConfigTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSAppConfigUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSAppConfigUpdateApplicationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAppConfigUpdateConfigurationProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"configurationProfileId" : @"ConfigurationProfileId",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"retrievalRoleArn" : @"RetrievalRoleArn",
             @"validators" : @"Validators",
             };
}

+ (NSValueTransformer *)validatorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppConfigValidator class]];
}

@end

@implementation AWSAppConfigUpdateDeploymentStrategyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentDurationInMinutes" : @"DeploymentDurationInMinutes",
             @"deploymentStrategyId" : @"DeploymentStrategyId",
             @"detail" : @"Description",
             @"finalBakeTimeInMinutes" : @"FinalBakeTimeInMinutes",
             @"growthFactor" : @"GrowthFactor",
             @"growthType" : @"GrowthType",
             };
}

+ (NSValueTransformer *)growthTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LINEAR"] == NSOrderedSame) {
            return @(AWSAppConfigGrowthTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"EXPONENTIAL"] == NSOrderedSame) {
            return @(AWSAppConfigGrowthTypeExponential);
        }
        return @(AWSAppConfigGrowthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppConfigGrowthTypeLinear:
                return @"LINEAR";
            case AWSAppConfigGrowthTypeExponential:
                return @"EXPONENTIAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppConfigUpdateEnvironmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"detail" : @"Description",
             @"environmentId" : @"EnvironmentId",
             @"monitors" : @"Monitors",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)monitorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppConfigMonitor class]];
}

@end

@implementation AWSAppConfigValidateConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"configurationProfileId" : @"ConfigurationProfileId",
             @"configurationVersion" : @"ConfigurationVersion",
             };
}

@end

@implementation AWSAppConfigValidator

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JSON_SCHEMA"] == NSOrderedSame) {
            return @(AWSAppConfigValidatorTypeJsonSchema);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSAppConfigValidatorTypeLambda);
        }
        return @(AWSAppConfigValidatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppConfigValidatorTypeJsonSchema:
                return @"JSON_SCHEMA";
            case AWSAppConfigValidatorTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end
