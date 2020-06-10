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

#import "AWSAppconfigModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSAppconfigErrorDomain = @"com.amazonaws.AWSAppconfigErrorDomain";

@implementation AWSAppconfigApplication

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAppconfigApplications

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppconfigApplication class]];
}

@end

@implementation AWSAppconfigConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationVersion" : @"ConfigurationVersion",
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             };
}

@end

@implementation AWSAppconfigConfigurationProfile

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppconfigValidator class]];
}

@end

@implementation AWSAppconfigConfigurationProfileSummary

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

@implementation AWSAppconfigConfigurationProfiles

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppconfigConfigurationProfileSummary class]];
}

@end

@implementation AWSAppconfigCreateApplicationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSAppconfigCreateConfigurationProfileRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppconfigValidator class]];
}

@end

@implementation AWSAppconfigCreateDeploymentStrategyRequest

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
            return @(AWSAppconfigGrowthTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"EXPONENTIAL"] == NSOrderedSame) {
            return @(AWSAppconfigGrowthTypeExponential);
        }
        return @(AWSAppconfigGrowthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppconfigGrowthTypeLinear:
                return @"LINEAR";
            case AWSAppconfigGrowthTypeExponential:
                return @"EXPONENTIAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)replicateToJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSAppconfigReplicateToNone);
        }
        if ([value caseInsensitiveCompare:@"SSM_DOCUMENT"] == NSOrderedSame) {
            return @(AWSAppconfigReplicateToSsmDocument);
        }
        return @(AWSAppconfigReplicateToUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppconfigReplicateToNone:
                return @"NONE";
            case AWSAppconfigReplicateToSsmDocument:
                return @"SSM_DOCUMENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppconfigCreateEnvironmentRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppconfigMonitor class]];
}

@end

@implementation AWSAppconfigDeleteApplicationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSAppconfigDeleteConfigurationProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"configurationProfileId" : @"ConfigurationProfileId",
             };
}

@end

@implementation AWSAppconfigDeleteDeploymentStrategyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentStrategyId" : @"DeploymentStrategyId",
             };
}

@end

@implementation AWSAppconfigDeleteEnvironmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"environmentId" : @"EnvironmentId",
             };
}

@end

@implementation AWSAppconfigDeployment

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppconfigDeploymentEvent class]];
}

+ (NSValueTransformer *)growthTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LINEAR"] == NSOrderedSame) {
            return @(AWSAppconfigGrowthTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"EXPONENTIAL"] == NSOrderedSame) {
            return @(AWSAppconfigGrowthTypeExponential);
        }
        return @(AWSAppconfigGrowthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppconfigGrowthTypeLinear:
                return @"LINEAR";
            case AWSAppconfigGrowthTypeExponential:
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
            return @(AWSAppconfigDeploymentStateBaking);
        }
        if ([value caseInsensitiveCompare:@"VALIDATING"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentStateValidating);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYING"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentStateDeploying);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentStateComplete);
        }
        if ([value caseInsensitiveCompare:@"ROLLING_BACK"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentStateRollingBack);
        }
        if ([value caseInsensitiveCompare:@"ROLLED_BACK"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentStateRolledBack);
        }
        return @(AWSAppconfigDeploymentStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppconfigDeploymentStateBaking:
                return @"BAKING";
            case AWSAppconfigDeploymentStateValidating:
                return @"VALIDATING";
            case AWSAppconfigDeploymentStateDeploying:
                return @"DEPLOYING";
            case AWSAppconfigDeploymentStateComplete:
                return @"COMPLETE";
            case AWSAppconfigDeploymentStateRollingBack:
                return @"ROLLING_BACK";
            case AWSAppconfigDeploymentStateRolledBack:
                return @"ROLLED_BACK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppconfigDeploymentEvent

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
            return @(AWSAppconfigDeploymentEventTypePercentageUpdated);
        }
        if ([value caseInsensitiveCompare:@"ROLLBACK_STARTED"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentEventTypeRollbackStarted);
        }
        if ([value caseInsensitiveCompare:@"ROLLBACK_COMPLETED"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentEventTypeRollbackCompleted);
        }
        if ([value caseInsensitiveCompare:@"BAKE_TIME_STARTED"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentEventTypeBakeTimeStarted);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYMENT_STARTED"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentEventTypeDeploymentStarted);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYMENT_COMPLETED"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentEventTypeDeploymentCompleted);
        }
        return @(AWSAppconfigDeploymentEventTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppconfigDeploymentEventTypePercentageUpdated:
                return @"PERCENTAGE_UPDATED";
            case AWSAppconfigDeploymentEventTypeRollbackStarted:
                return @"ROLLBACK_STARTED";
            case AWSAppconfigDeploymentEventTypeRollbackCompleted:
                return @"ROLLBACK_COMPLETED";
            case AWSAppconfigDeploymentEventTypeBakeTimeStarted:
                return @"BAKE_TIME_STARTED";
            case AWSAppconfigDeploymentEventTypeDeploymentStarted:
                return @"DEPLOYMENT_STARTED";
            case AWSAppconfigDeploymentEventTypeDeploymentCompleted:
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
            return @(AWSAppconfigTriggeredByUser);
        }
        if ([value caseInsensitiveCompare:@"APPCONFIG"] == NSOrderedSame) {
            return @(AWSAppconfigTriggeredByAppconfig);
        }
        if ([value caseInsensitiveCompare:@"CLOUDWATCH_ALARM"] == NSOrderedSame) {
            return @(AWSAppconfigTriggeredByCloudwatchAlarm);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_ERROR"] == NSOrderedSame) {
            return @(AWSAppconfigTriggeredByInternalError);
        }
        return @(AWSAppconfigTriggeredByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppconfigTriggeredByUser:
                return @"USER";
            case AWSAppconfigTriggeredByAppconfig:
                return @"APPCONFIG";
            case AWSAppconfigTriggeredByCloudwatchAlarm:
                return @"CLOUDWATCH_ALARM";
            case AWSAppconfigTriggeredByInternalError:
                return @"INTERNAL_ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppconfigDeploymentStrategies

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppconfigDeploymentStrategy class]];
}

@end

@implementation AWSAppconfigDeploymentStrategy

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
            return @(AWSAppconfigGrowthTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"EXPONENTIAL"] == NSOrderedSame) {
            return @(AWSAppconfigGrowthTypeExponential);
        }
        return @(AWSAppconfigGrowthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppconfigGrowthTypeLinear:
                return @"LINEAR";
            case AWSAppconfigGrowthTypeExponential:
                return @"EXPONENTIAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)replicateToJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSAppconfigReplicateToNone);
        }
        if ([value caseInsensitiveCompare:@"SSM_DOCUMENT"] == NSOrderedSame) {
            return @(AWSAppconfigReplicateToSsmDocument);
        }
        return @(AWSAppconfigReplicateToUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppconfigReplicateToNone:
                return @"NONE";
            case AWSAppconfigReplicateToSsmDocument:
                return @"SSM_DOCUMENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppconfigDeploymentSummary

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
            return @(AWSAppconfigGrowthTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"EXPONENTIAL"] == NSOrderedSame) {
            return @(AWSAppconfigGrowthTypeExponential);
        }
        return @(AWSAppconfigGrowthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppconfigGrowthTypeLinear:
                return @"LINEAR";
            case AWSAppconfigGrowthTypeExponential:
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
            return @(AWSAppconfigDeploymentStateBaking);
        }
        if ([value caseInsensitiveCompare:@"VALIDATING"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentStateValidating);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYING"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentStateDeploying);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentStateComplete);
        }
        if ([value caseInsensitiveCompare:@"ROLLING_BACK"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentStateRollingBack);
        }
        if ([value caseInsensitiveCompare:@"ROLLED_BACK"] == NSOrderedSame) {
            return @(AWSAppconfigDeploymentStateRolledBack);
        }
        return @(AWSAppconfigDeploymentStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppconfigDeploymentStateBaking:
                return @"BAKING";
            case AWSAppconfigDeploymentStateValidating:
                return @"VALIDATING";
            case AWSAppconfigDeploymentStateDeploying:
                return @"DEPLOYING";
            case AWSAppconfigDeploymentStateComplete:
                return @"COMPLETE";
            case AWSAppconfigDeploymentStateRollingBack:
                return @"ROLLING_BACK";
            case AWSAppconfigDeploymentStateRolledBack:
                return @"ROLLED_BACK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppconfigDeployments

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppconfigDeploymentSummary class]];
}

@end

@implementation AWSAppconfigEnvironment

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppconfigMonitor class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"READY_FOR_DEPLOYMENT"] == NSOrderedSame) {
            return @(AWSAppconfigEnvironmentStateReadyForDeployment);
        }
        if ([value caseInsensitiveCompare:@"DEPLOYING"] == NSOrderedSame) {
            return @(AWSAppconfigEnvironmentStateDeploying);
        }
        if ([value caseInsensitiveCompare:@"ROLLING_BACK"] == NSOrderedSame) {
            return @(AWSAppconfigEnvironmentStateRollingBack);
        }
        if ([value caseInsensitiveCompare:@"ROLLED_BACK"] == NSOrderedSame) {
            return @(AWSAppconfigEnvironmentStateRolledBack);
        }
        return @(AWSAppconfigEnvironmentStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppconfigEnvironmentStateReadyForDeployment:
                return @"READY_FOR_DEPLOYMENT";
            case AWSAppconfigEnvironmentStateDeploying:
                return @"DEPLOYING";
            case AWSAppconfigEnvironmentStateRollingBack:
                return @"ROLLING_BACK";
            case AWSAppconfigEnvironmentStateRolledBack:
                return @"ROLLED_BACK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppconfigEnvironments

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppconfigEnvironment class]];
}

@end

@implementation AWSAppconfigGetApplicationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSAppconfigGetConfigurationProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"configurationProfileId" : @"ConfigurationProfileId",
             };
}

@end

@implementation AWSAppconfigGetConfigurationRequest

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

@implementation AWSAppconfigGetDeploymentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"deploymentNumber" : @"DeploymentNumber",
             @"environmentId" : @"EnvironmentId",
             };
}

@end

@implementation AWSAppconfigGetDeploymentStrategyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentStrategyId" : @"DeploymentStrategyId",
             };
}

@end

@implementation AWSAppconfigGetEnvironmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"environmentId" : @"EnvironmentId",
             };
}

@end

@implementation AWSAppconfigListApplicationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAppconfigListConfigurationProfilesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAppconfigListDeploymentStrategiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAppconfigListDeploymentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"environmentId" : @"EnvironmentId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAppconfigListEnvironmentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAppconfigListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSAppconfigMonitor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alarmArn" : @"AlarmArn",
             @"alarmRoleArn" : @"AlarmRoleArn",
             };
}

@end

@implementation AWSAppconfigResourceTags

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSAppconfigStartDeploymentRequest

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

@implementation AWSAppconfigStopDeploymentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"deploymentNumber" : @"DeploymentNumber",
             @"environmentId" : @"EnvironmentId",
             };
}

@end

@implementation AWSAppconfigTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSAppconfigUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSAppconfigUpdateApplicationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAppconfigUpdateConfigurationProfileRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppconfigValidator class]];
}

@end

@implementation AWSAppconfigUpdateDeploymentStrategyRequest

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
            return @(AWSAppconfigGrowthTypeLinear);
        }
        if ([value caseInsensitiveCompare:@"EXPONENTIAL"] == NSOrderedSame) {
            return @(AWSAppconfigGrowthTypeExponential);
        }
        return @(AWSAppconfigGrowthTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppconfigGrowthTypeLinear:
                return @"LINEAR";
            case AWSAppconfigGrowthTypeExponential:
                return @"EXPONENTIAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAppconfigUpdateEnvironmentRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAppconfigMonitor class]];
}

@end

@implementation AWSAppconfigValidateConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"configurationProfileId" : @"ConfigurationProfileId",
             @"configurationVersion" : @"ConfigurationVersion",
             };
}

@end

@implementation AWSAppconfigValidator

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JSON_SCHEMA"] == NSOrderedSame) {
            return @(AWSAppconfigValidatorTypeJsonSchema);
        }
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSAppconfigValidatorTypeLambda);
        }
        return @(AWSAppconfigValidatorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAppconfigValidatorTypeJsonSchema:
                return @"JSON_SCHEMA";
            case AWSAppconfigValidatorTypeLambda:
                return @"LAMBDA";
            default:
                return nil;
        }
    }];
}

@end
