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

#import "AWSElasticbeanstalkModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSElasticbeanstalkErrorDomain = @"com.amazonaws.AWSElasticbeanstalkErrorDomain";

@implementation AWSElasticbeanstalkAbortEnvironmentUpdateMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             };
}

@end

@implementation AWSElasticbeanstalkApplicationDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationArn" : @"ApplicationArn",
             @"applicationName" : @"ApplicationName",
             @"configurationTemplates" : @"ConfigurationTemplates",
             @"dateCreated" : @"DateCreated",
             @"dateUpdated" : @"DateUpdated",
             @"detail" : @"Description",
             @"resourceLifecycleConfig" : @"ResourceLifecycleConfig",
             @"versions" : @"Versions",
             };
}

+ (NSValueTransformer *)dateCreatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)dateUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)resourceLifecycleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkApplicationResourceLifecycleConfig class]];
}

@end

@implementation AWSElasticbeanstalkApplicationDescriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"application" : @"Application",
             };
}

+ (NSValueTransformer *)applicationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkApplicationDescription class]];
}

@end

@implementation AWSElasticbeanstalkApplicationDescriptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applications" : @"Applications",
             };
}

+ (NSValueTransformer *)applicationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkApplicationDescription class]];
}

@end

@implementation AWSElasticbeanstalkApplicationMetrics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"latency" : @"Latency",
             @"requestCount" : @"RequestCount",
             @"statusCodes" : @"StatusCodes",
             };
}

+ (NSValueTransformer *)latencyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkLatency class]];
}

+ (NSValueTransformer *)statusCodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkStatusCodes class]];
}

@end

@implementation AWSElasticbeanstalkApplicationResourceLifecycleConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceRole" : @"ServiceRole",
             @"versionLifecycleConfig" : @"VersionLifecycleConfig",
             };
}

+ (NSValueTransformer *)versionLifecycleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkApplicationVersionLifecycleConfig class]];
}

@end

@implementation AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"resourceLifecycleConfig" : @"ResourceLifecycleConfig",
             };
}

+ (NSValueTransformer *)resourceLifecycleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkApplicationResourceLifecycleConfig class]];
}

@end

@implementation AWSElasticbeanstalkApplicationVersionDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"applicationVersionArn" : @"ApplicationVersionArn",
             @"buildArn" : @"BuildArn",
             @"dateCreated" : @"DateCreated",
             @"dateUpdated" : @"DateUpdated",
             @"detail" : @"Description",
             @"sourceBuildInformation" : @"SourceBuildInformation",
             @"sourceBundle" : @"SourceBundle",
             @"status" : @"Status",
             @"versionLabel" : @"VersionLabel",
             };
}

+ (NSValueTransformer *)dateCreatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)dateUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)sourceBuildInformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkSourceBuildInformation class]];
}

+ (NSValueTransformer *)sourceBundleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkS3Location class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Processed"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkApplicationVersionStatusProcessed);
        }
        if ([value caseInsensitiveCompare:@"Unprocessed"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkApplicationVersionStatusUnprocessed);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkApplicationVersionStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Processing"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkApplicationVersionStatusProcessing);
        }
        if ([value caseInsensitiveCompare:@"Building"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkApplicationVersionStatusBuilding);
        }
        return @(AWSElasticbeanstalkApplicationVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkApplicationVersionStatusProcessed:
                return @"Processed";
            case AWSElasticbeanstalkApplicationVersionStatusUnprocessed:
                return @"Unprocessed";
            case AWSElasticbeanstalkApplicationVersionStatusFailed:
                return @"Failed";
            case AWSElasticbeanstalkApplicationVersionStatusProcessing:
                return @"Processing";
            case AWSElasticbeanstalkApplicationVersionStatusBuilding:
                return @"Building";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticbeanstalkApplicationVersionDescriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationVersion" : @"ApplicationVersion",
             };
}

+ (NSValueTransformer *)applicationVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkApplicationVersionDescription class]];
}

@end

@implementation AWSElasticbeanstalkApplicationVersionDescriptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationVersions" : @"ApplicationVersions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)applicationVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkApplicationVersionDescription class]];
}

@end

@implementation AWSElasticbeanstalkApplicationVersionLifecycleConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxAgeRule" : @"MaxAgeRule",
             @"maxCountRule" : @"MaxCountRule",
             };
}

+ (NSValueTransformer *)maxAgeRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkMaxAgeRule class]];
}

+ (NSValueTransformer *)maxCountRuleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkMaxCountRule class]];
}

@end

@implementation AWSElasticbeanstalkApplyEnvironmentManagedActionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionId" : @"ActionId",
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             };
}

@end

@implementation AWSElasticbeanstalkApplyEnvironmentManagedActionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionDescription" : @"ActionDescription",
             @"actionId" : @"ActionId",
             @"actionType" : @"ActionType",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)actionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InstanceRefresh"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionTypeInstanceRefresh);
        }
        if ([value caseInsensitiveCompare:@"PlatformUpdate"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionTypePlatformUpdate);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionTypeUnknown);
        }
        return @(AWSElasticbeanstalkActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkActionTypeInstanceRefresh:
                return @"InstanceRefresh";
            case AWSElasticbeanstalkActionTypePlatformUpdate:
                return @"PlatformUpdate";
            case AWSElasticbeanstalkActionTypeUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticbeanstalkAssociateEnvironmentOperationsRoleMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentName" : @"EnvironmentName",
             @"operationsRole" : @"OperationsRole",
             };
}

@end

@implementation AWSElasticbeanstalkAutoScalingGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSElasticbeanstalkBuildConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"artifactName" : @"ArtifactName",
             @"codeBuildServiceRole" : @"CodeBuildServiceRole",
             @"computeType" : @"ComputeType",
             @"image" : @"Image",
             @"timeoutInMinutes" : @"TimeoutInMinutes",
             };
}

+ (NSValueTransformer *)computeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_SMALL"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkComputeTypeBuildGeneral1Small);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_MEDIUM"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkComputeTypeBuildGeneral1Medium);
        }
        if ([value caseInsensitiveCompare:@"BUILD_GENERAL1_LARGE"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkComputeTypeBuildGeneral1Large);
        }
        return @(AWSElasticbeanstalkComputeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkComputeTypeBuildGeneral1Small:
                return @"BUILD_GENERAL1_SMALL";
            case AWSElasticbeanstalkComputeTypeBuildGeneral1Medium:
                return @"BUILD_GENERAL1_MEDIUM";
            case AWSElasticbeanstalkComputeTypeBuildGeneral1Large:
                return @"BUILD_GENERAL1_LARGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticbeanstalkBuilder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             };
}

@end

@implementation AWSElasticbeanstalkCPUUtilization

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IOWait" : @"IOWait",
             @"IRQ" : @"IRQ",
             @"idle" : @"Idle",
             @"nice" : @"Nice",
             @"privileged" : @"Privileged",
             @"softIRQ" : @"SoftIRQ",
             @"system" : @"System",
             @"user" : @"User",
             };
}

@end

@implementation AWSElasticbeanstalkCheckDNSAvailabilityMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CNAMEPrefix" : @"CNAMEPrefix",
             };
}

@end

@implementation AWSElasticbeanstalkCheckDNSAvailabilityResultMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"available" : @"Available",
             @"fullyQualifiedCNAME" : @"FullyQualifiedCNAME",
             };
}

@end

@implementation AWSElasticbeanstalkComposeEnvironmentsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"groupName" : @"GroupName",
             @"versionLabels" : @"VersionLabels",
             };
}

@end

@implementation AWSElasticbeanstalkConfigurationOptionDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeSeverity" : @"ChangeSeverity",
             @"defaultValue" : @"DefaultValue",
             @"maxLength" : @"MaxLength",
             @"maxValue" : @"MaxValue",
             @"minValue" : @"MinValue",
             @"name" : @"Name",
             @"namespace" : @"Namespace",
             @"regex" : @"Regex",
             @"userDefined" : @"UserDefined",
             @"valueOptions" : @"ValueOptions",
             @"valueType" : @"ValueType",
             };
}

+ (NSValueTransformer *)regexJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkOptionRestrictionRegex class]];
}

+ (NSValueTransformer *)valueTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Scalar"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkConfigurationOptionValueTypeScalar);
        }
        if ([value caseInsensitiveCompare:@"List"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkConfigurationOptionValueTypeList);
        }
        return @(AWSElasticbeanstalkConfigurationOptionValueTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkConfigurationOptionValueTypeScalar:
                return @"Scalar";
            case AWSElasticbeanstalkConfigurationOptionValueTypeList:
                return @"List";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticbeanstalkConfigurationOptionSetting

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"namespace" : @"Namespace",
             @"optionName" : @"OptionName",
             @"resourceName" : @"ResourceName",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticbeanstalkConfigurationOptionsDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"options" : @"Options",
             @"platformArn" : @"PlatformArn",
             @"solutionStackName" : @"SolutionStackName",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkConfigurationOptionDescription class]];
}

@end

@implementation AWSElasticbeanstalkConfigurationSettingsDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"dateCreated" : @"DateCreated",
             @"dateUpdated" : @"DateUpdated",
             @"deploymentStatus" : @"DeploymentStatus",
             @"detail" : @"Description",
             @"environmentName" : @"EnvironmentName",
             @"optionSettings" : @"OptionSettings",
             @"platformArn" : @"PlatformArn",
             @"solutionStackName" : @"SolutionStackName",
             @"templateName" : @"TemplateName",
             };
}

+ (NSValueTransformer *)dateCreatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)dateUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)deploymentStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"deployed"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkConfigurationDeploymentStatusDeployed);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkConfigurationDeploymentStatusPending);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkConfigurationDeploymentStatusFailed);
        }
        return @(AWSElasticbeanstalkConfigurationDeploymentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkConfigurationDeploymentStatusDeployed:
                return @"deployed";
            case AWSElasticbeanstalkConfigurationDeploymentStatusPending:
                return @"pending";
            case AWSElasticbeanstalkConfigurationDeploymentStatusFailed:
                return @"failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)optionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkConfigurationOptionSetting class]];
}

@end

@implementation AWSElasticbeanstalkConfigurationSettingsDescriptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSettings" : @"ConfigurationSettings",
             };
}

+ (NSValueTransformer *)configurationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkConfigurationSettingsDescription class]];
}

@end

@implementation AWSElasticbeanstalkConfigurationSettingsValidationMessages

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messages" : @"Messages",
             };
}

+ (NSValueTransformer *)messagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkValidationMessage class]];
}

@end

@implementation AWSElasticbeanstalkCreateApplicationMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"detail" : @"Description",
             @"resourceLifecycleConfig" : @"ResourceLifecycleConfig",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)resourceLifecycleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkApplicationResourceLifecycleConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkTag class]];
}

@end

@implementation AWSElasticbeanstalkCreateApplicationVersionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"autoCreateApplication" : @"AutoCreateApplication",
             @"buildConfiguration" : @"BuildConfiguration",
             @"detail" : @"Description",
             @"process" : @"Process",
             @"sourceBuildInformation" : @"SourceBuildInformation",
             @"sourceBundle" : @"SourceBundle",
             @"tags" : @"Tags",
             @"versionLabel" : @"VersionLabel",
             };
}

+ (NSValueTransformer *)buildConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkBuildConfiguration class]];
}

+ (NSValueTransformer *)sourceBuildInformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkSourceBuildInformation class]];
}

+ (NSValueTransformer *)sourceBundleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkS3Location class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkTag class]];
}

@end

@implementation AWSElasticbeanstalkCreateConfigurationTemplateMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"detail" : @"Description",
             @"environmentId" : @"EnvironmentId",
             @"optionSettings" : @"OptionSettings",
             @"platformArn" : @"PlatformArn",
             @"solutionStackName" : @"SolutionStackName",
             @"sourceConfiguration" : @"SourceConfiguration",
             @"tags" : @"Tags",
             @"templateName" : @"TemplateName",
             };
}

+ (NSValueTransformer *)optionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkConfigurationOptionSetting class]];
}

+ (NSValueTransformer *)sourceConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkSourceConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkTag class]];
}

@end

@implementation AWSElasticbeanstalkCreateEnvironmentMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"CNAMEPrefix" : @"CNAMEPrefix",
             @"detail" : @"Description",
             @"environmentName" : @"EnvironmentName",
             @"groupName" : @"GroupName",
             @"operationsRole" : @"OperationsRole",
             @"optionSettings" : @"OptionSettings",
             @"optionsToRemove" : @"OptionsToRemove",
             @"platformArn" : @"PlatformArn",
             @"solutionStackName" : @"SolutionStackName",
             @"tags" : @"Tags",
             @"templateName" : @"TemplateName",
             @"tier" : @"Tier",
             @"versionLabel" : @"VersionLabel",
             };
}

+ (NSValueTransformer *)optionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkConfigurationOptionSetting class]];
}

+ (NSValueTransformer *)optionsToRemoveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkOptionSpecification class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkTag class]];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkEnvironmentTier class]];
}

@end

@implementation AWSElasticbeanstalkCreatePlatformVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentName" : @"EnvironmentName",
             @"optionSettings" : @"OptionSettings",
             @"platformDefinitionBundle" : @"PlatformDefinitionBundle",
             @"platformName" : @"PlatformName",
             @"platformVersion" : @"PlatformVersion",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)optionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkConfigurationOptionSetting class]];
}

+ (NSValueTransformer *)platformDefinitionBundleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkS3Location class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkTag class]];
}

@end

@implementation AWSElasticbeanstalkCreatePlatformVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"builder" : @"Builder",
             @"platformSummary" : @"PlatformSummary",
             };
}

+ (NSValueTransformer *)builderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkBuilder class]];
}

+ (NSValueTransformer *)platformSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkPlatformSummary class]];
}

@end

@implementation AWSElasticbeanstalkCreateStorageLocationResultMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             };
}

@end

@implementation AWSElasticbeanstalkCustomAmi

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"ImageId",
             @"virtualizationType" : @"VirtualizationType",
             };
}

@end

@implementation AWSElasticbeanstalkDeleteApplicationMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"terminateEnvByForce" : @"TerminateEnvByForce",
             };
}

@end

@implementation AWSElasticbeanstalkDeleteApplicationVersionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"deleteSourceBundle" : @"DeleteSourceBundle",
             @"versionLabel" : @"VersionLabel",
             };
}

@end

@implementation AWSElasticbeanstalkDeleteConfigurationTemplateMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"templateName" : @"TemplateName",
             };
}

@end

@implementation AWSElasticbeanstalkDeleteEnvironmentConfigurationMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"environmentName" : @"EnvironmentName",
             };
}

@end

@implementation AWSElasticbeanstalkDeletePlatformVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"platformArn" : @"PlatformArn",
             };
}

@end

@implementation AWSElasticbeanstalkDeletePlatformVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"platformSummary" : @"PlatformSummary",
             };
}

+ (NSValueTransformer *)platformSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkPlatformSummary class]];
}

@end

@implementation AWSElasticbeanstalkDeployment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deploymentId" : @"DeploymentId",
             @"deploymentTime" : @"DeploymentTime",
             @"status" : @"Status",
             @"versionLabel" : @"VersionLabel",
             };
}

+ (NSValueTransformer *)deploymentTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSElasticbeanstalkDescribeAccountAttributesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceQuotas" : @"ResourceQuotas",
             };
}

+ (NSValueTransformer *)resourceQuotasJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkResourceQuotas class]];
}

@end

@implementation AWSElasticbeanstalkDescribeApplicationVersionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             @"versionLabels" : @"VersionLabels",
             };
}

@end

@implementation AWSElasticbeanstalkDescribeApplicationsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationNames" : @"ApplicationNames",
             };
}

@end

@implementation AWSElasticbeanstalkDescribeConfigurationOptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"environmentName" : @"EnvironmentName",
             @"options" : @"Options",
             @"platformArn" : @"PlatformArn",
             @"solutionStackName" : @"SolutionStackName",
             @"templateName" : @"TemplateName",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkOptionSpecification class]];
}

@end

@implementation AWSElasticbeanstalkDescribeConfigurationSettingsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"environmentName" : @"EnvironmentName",
             @"templateName" : @"TemplateName",
             };
}

@end

@implementation AWSElasticbeanstalkDescribeEnvironmentHealthRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeNames" : @"AttributeNames",
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             };
}

@end

@implementation AWSElasticbeanstalkDescribeEnvironmentHealthResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationMetrics" : @"ApplicationMetrics",
             @"causes" : @"Causes",
             @"color" : @"Color",
             @"environmentName" : @"EnvironmentName",
             @"healthStatus" : @"HealthStatus",
             @"instancesHealth" : @"InstancesHealth",
             @"refreshedAt" : @"RefreshedAt",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)applicationMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkApplicationMetrics class]];
}

+ (NSValueTransformer *)instancesHealthJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkInstanceHealthSummary class]];
}

+ (NSValueTransformer *)refreshedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Green"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthGreen);
        }
        if ([value caseInsensitiveCompare:@"Yellow"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthYellow);
        }
        if ([value caseInsensitiveCompare:@"Red"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthRed);
        }
        if ([value caseInsensitiveCompare:@"Grey"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthGrey);
        }
        return @(AWSElasticbeanstalkEnvironmentHealthUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkEnvironmentHealthGreen:
                return @"Green";
            case AWSElasticbeanstalkEnvironmentHealthYellow:
                return @"Yellow";
            case AWSElasticbeanstalkEnvironmentHealthRed:
                return @"Red";
            case AWSElasticbeanstalkEnvironmentHealthGrey:
                return @"Grey";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             @"maxItems" : @"MaxItems",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"managedActionHistoryItems" : @"ManagedActionHistoryItems",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)managedActionHistoryItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkManagedActionHistoryItem class]];
}

@end

@implementation AWSElasticbeanstalkDescribeEnvironmentManagedActionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Running"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionStatusUnknown);
        }
        return @(AWSElasticbeanstalkActionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkActionStatusScheduled:
                return @"Scheduled";
            case AWSElasticbeanstalkActionStatusPending:
                return @"Pending";
            case AWSElasticbeanstalkActionStatusRunning:
                return @"Running";
            case AWSElasticbeanstalkActionStatusUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"managedActions" : @"ManagedActions",
             };
}

+ (NSValueTransformer *)managedActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkManagedAction class]];
}

@end

@implementation AWSElasticbeanstalkDescribeEnvironmentResourcesMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             };
}

@end

@implementation AWSElasticbeanstalkDescribeEnvironmentsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"environmentIds" : @"EnvironmentIds",
             @"environmentNames" : @"EnvironmentNames",
             @"includeDeleted" : @"IncludeDeleted",
             @"includedDeletedBackTo" : @"IncludedDeletedBackTo",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             @"versionLabel" : @"VersionLabel",
             };
}

+ (NSValueTransformer *)includedDeletedBackToJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSElasticbeanstalkDescribeEventsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"endTime" : @"EndTime",
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             @"platformArn" : @"PlatformArn",
             @"requestId" : @"RequestId",
             @"severity" : @"Severity",
             @"startTime" : @"StartTime",
             @"templateName" : @"TemplateName",
             @"versionLabel" : @"VersionLabel",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRACE"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEventSeverityTrace);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEventSeverityDebug);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEventSeverityInfo);
        }
        if ([value caseInsensitiveCompare:@"WARN"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEventSeverityWarn);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEventSeverityError);
        }
        if ([value caseInsensitiveCompare:@"FATAL"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEventSeverityFatal);
        }
        return @(AWSElasticbeanstalkEventSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkEventSeverityTrace:
                return @"TRACE";
            case AWSElasticbeanstalkEventSeverityDebug:
                return @"DEBUG";
            case AWSElasticbeanstalkEventSeverityInfo:
                return @"INFO";
            case AWSElasticbeanstalkEventSeverityWarn:
                return @"WARN";
            case AWSElasticbeanstalkEventSeverityError:
                return @"ERROR";
            case AWSElasticbeanstalkEventSeverityFatal:
                return @"FATAL";
            default:
                return nil;
        }
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

@implementation AWSElasticbeanstalkDescribeInstancesHealthRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeNames" : @"AttributeNames",
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSElasticbeanstalkDescribeInstancesHealthResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceHealthList" : @"InstanceHealthList",
             @"nextToken" : @"NextToken",
             @"refreshedAt" : @"RefreshedAt",
             };
}

+ (NSValueTransformer *)instanceHealthListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkSingleInstanceHealth class]];
}

+ (NSValueTransformer *)refreshedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSElasticbeanstalkDescribePlatformVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"platformArn" : @"PlatformArn",
             };
}

@end

@implementation AWSElasticbeanstalkDescribePlatformVersionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"platformDescription" : @"PlatformDescription",
             };
}

+ (NSValueTransformer *)platformDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkPlatformDescription class]];
}

@end

@implementation AWSElasticbeanstalkDisassociateEnvironmentOperationsRoleMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentName" : @"EnvironmentName",
             };
}

@end

@implementation AWSElasticbeanstalkEnvironmentDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortableOperationInProgress" : @"AbortableOperationInProgress",
             @"applicationName" : @"ApplicationName",
             @"CNAME" : @"CNAME",
             @"dateCreated" : @"DateCreated",
             @"dateUpdated" : @"DateUpdated",
             @"detail" : @"Description",
             @"endpointURL" : @"EndpointURL",
             @"environmentArn" : @"EnvironmentArn",
             @"environmentId" : @"EnvironmentId",
             @"environmentLinks" : @"EnvironmentLinks",
             @"environmentName" : @"EnvironmentName",
             @"health" : @"Health",
             @"healthStatus" : @"HealthStatus",
             @"operationsRole" : @"OperationsRole",
             @"platformArn" : @"PlatformArn",
             @"resources" : @"Resources",
             @"solutionStackName" : @"SolutionStackName",
             @"status" : @"Status",
             @"templateName" : @"TemplateName",
             @"tier" : @"Tier",
             @"versionLabel" : @"VersionLabel",
             };
}

+ (NSValueTransformer *)dateCreatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)dateUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)environmentLinksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkEnvironmentLink class]];
}

+ (NSValueTransformer *)healthJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Green"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthGreen);
        }
        if ([value caseInsensitiveCompare:@"Yellow"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthYellow);
        }
        if ([value caseInsensitiveCompare:@"Red"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthRed);
        }
        if ([value caseInsensitiveCompare:@"Grey"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthGrey);
        }
        return @(AWSElasticbeanstalkEnvironmentHealthUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkEnvironmentHealthGreen:
                return @"Green";
            case AWSElasticbeanstalkEnvironmentHealthYellow:
                return @"Yellow";
            case AWSElasticbeanstalkEnvironmentHealthRed:
                return @"Red";
            case AWSElasticbeanstalkEnvironmentHealthGrey:
                return @"Grey";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)healthStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NoData"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthStatusNoData);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthStatusUnknown);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Ok"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthStatusOK);
        }
        if ([value caseInsensitiveCompare:@"Info"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthStatusInfo);
        }
        if ([value caseInsensitiveCompare:@"Warning"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthStatusWarning);
        }
        if ([value caseInsensitiveCompare:@"Degraded"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthStatusDegraded);
        }
        if ([value caseInsensitiveCompare:@"Severe"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthStatusSevere);
        }
        if ([value caseInsensitiveCompare:@"Suspended"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentHealthStatusSuspended);
        }
        return @(AWSElasticbeanstalkEnvironmentHealthStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkEnvironmentHealthStatusNoData:
                return @"NoData";
            case AWSElasticbeanstalkEnvironmentHealthStatusUnknown:
                return @"Unknown";
            case AWSElasticbeanstalkEnvironmentHealthStatusPending:
                return @"Pending";
            case AWSElasticbeanstalkEnvironmentHealthStatusOK:
                return @"Ok";
            case AWSElasticbeanstalkEnvironmentHealthStatusInfo:
                return @"Info";
            case AWSElasticbeanstalkEnvironmentHealthStatusWarning:
                return @"Warning";
            case AWSElasticbeanstalkEnvironmentHealthStatusDegraded:
                return @"Degraded";
            case AWSElasticbeanstalkEnvironmentHealthStatusSevere:
                return @"Severe";
            case AWSElasticbeanstalkEnvironmentHealthStatusSuspended:
                return @"Suspended";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkEnvironmentResourcesDescription class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Launching"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentStatusLaunching);
        }
        if ([value caseInsensitiveCompare:@"Updating"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentStatusReady);
        }
        if ([value caseInsensitiveCompare:@"Terminating"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentStatusTerminating);
        }
        if ([value caseInsensitiveCompare:@"Terminated"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentStatusTerminated);
        }
        return @(AWSElasticbeanstalkEnvironmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkEnvironmentStatusLaunching:
                return @"Launching";
            case AWSElasticbeanstalkEnvironmentStatusUpdating:
                return @"Updating";
            case AWSElasticbeanstalkEnvironmentStatusReady:
                return @"Ready";
            case AWSElasticbeanstalkEnvironmentStatusTerminating:
                return @"Terminating";
            case AWSElasticbeanstalkEnvironmentStatusTerminated:
                return @"Terminated";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkEnvironmentTier class]];
}

@end

@implementation AWSElasticbeanstalkEnvironmentDescriptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environments" : @"Environments",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)environmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkEnvironmentDescription class]];
}

@end

@implementation AWSElasticbeanstalkEnvironmentInfoDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ec2InstanceId" : @"Ec2InstanceId",
             @"infoType" : @"InfoType",
             @"message" : @"Message",
             @"sampleTimestamp" : @"SampleTimestamp",
             };
}

+ (NSValueTransformer *)infoTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"tail"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentInfoTypeTail);
        }
        if ([value caseInsensitiveCompare:@"bundle"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentInfoTypeBundle);
        }
        return @(AWSElasticbeanstalkEnvironmentInfoTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkEnvironmentInfoTypeTail:
                return @"tail";
            case AWSElasticbeanstalkEnvironmentInfoTypeBundle:
                return @"bundle";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sampleTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSElasticbeanstalkEnvironmentLink

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentName" : @"EnvironmentName",
             @"linkName" : @"LinkName",
             };
}

@end

@implementation AWSElasticbeanstalkEnvironmentResourceDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoScalingGroups" : @"AutoScalingGroups",
             @"environmentName" : @"EnvironmentName",
             @"instances" : @"Instances",
             @"launchConfigurations" : @"LaunchConfigurations",
             @"launchTemplates" : @"LaunchTemplates",
             @"loadBalancers" : @"LoadBalancers",
             @"queues" : @"Queues",
             @"triggers" : @"Triggers",
             };
}

+ (NSValueTransformer *)autoScalingGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkAutoScalingGroup class]];
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkInstance class]];
}

+ (NSValueTransformer *)launchConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkLaunchConfiguration class]];
}

+ (NSValueTransformer *)launchTemplatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkLaunchTemplate class]];
}

+ (NSValueTransformer *)loadBalancersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkLoadBalancer class]];
}

+ (NSValueTransformer *)queuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkQueue class]];
}

+ (NSValueTransformer *)triggersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkTrigger class]];
}

@end

@implementation AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentResources" : @"EnvironmentResources",
             };
}

+ (NSValueTransformer *)environmentResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkEnvironmentResourceDescription class]];
}

@end

@implementation AWSElasticbeanstalkEnvironmentResourcesDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loadBalancer" : @"LoadBalancer",
             };
}

+ (NSValueTransformer *)loadBalancerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkLoadBalancerDescription class]];
}

@end

@implementation AWSElasticbeanstalkEnvironmentTier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"types" : @"Type",
             @"version" : @"Version",
             };
}

@end

@implementation AWSElasticbeanstalkEventDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"environmentName" : @"EnvironmentName",
             @"eventDate" : @"EventDate",
             @"message" : @"Message",
             @"platformArn" : @"PlatformArn",
             @"requestId" : @"RequestId",
             @"severity" : @"Severity",
             @"templateName" : @"TemplateName",
             @"versionLabel" : @"VersionLabel",
             };
}

+ (NSValueTransformer *)eventDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRACE"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEventSeverityTrace);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEventSeverityDebug);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEventSeverityInfo);
        }
        if ([value caseInsensitiveCompare:@"WARN"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEventSeverityWarn);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEventSeverityError);
        }
        if ([value caseInsensitiveCompare:@"FATAL"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEventSeverityFatal);
        }
        return @(AWSElasticbeanstalkEventSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkEventSeverityTrace:
                return @"TRACE";
            case AWSElasticbeanstalkEventSeverityDebug:
                return @"DEBUG";
            case AWSElasticbeanstalkEventSeverityInfo:
                return @"INFO";
            case AWSElasticbeanstalkEventSeverityWarn:
                return @"WARN";
            case AWSElasticbeanstalkEventSeverityError:
                return @"ERROR";
            case AWSElasticbeanstalkEventSeverityFatal:
                return @"FATAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticbeanstalkEventDescriptionsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"Events",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkEventDescription class]];
}

@end

@implementation AWSElasticbeanstalkInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSElasticbeanstalkInstanceHealthSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"degraded" : @"Degraded",
             @"info" : @"Info",
             @"noData" : @"NoData",
             @"ok" : @"Ok",
             @"pending" : @"Pending",
             @"severe" : @"Severe",
             @"unknown" : @"Unknown",
             @"warning" : @"Warning",
             };
}

@end

@implementation AWSElasticbeanstalkLatency

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"p10" : @"P10",
             @"p50" : @"P50",
             @"p75" : @"P75",
             @"p85" : @"P85",
             @"p90" : @"P90",
             @"p95" : @"P95",
             @"p99" : @"P99",
             @"p999" : @"P999",
             };
}

@end

@implementation AWSElasticbeanstalkLaunchConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSElasticbeanstalkLaunchTemplate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSElasticbeanstalkListAvailableSolutionStacksResultMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"solutionStackDetails" : @"SolutionStackDetails",
             @"solutionStacks" : @"SolutionStacks",
             };
}

+ (NSValueTransformer *)solutionStackDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkSolutionStackDescription class]];
}

@end

@implementation AWSElasticbeanstalkListPlatformBranchesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkSearchFilter class]];
}

@end

@implementation AWSElasticbeanstalkListPlatformBranchesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"platformBranchSummaryList" : @"PlatformBranchSummaryList",
             };
}

+ (NSValueTransformer *)platformBranchSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkPlatformBranchSummary class]];
}

@end

@implementation AWSElasticbeanstalkListPlatformVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxRecords" : @"MaxRecords",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkPlatformFilter class]];
}

@end

@implementation AWSElasticbeanstalkListPlatformVersionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"platformSummaryList" : @"PlatformSummaryList",
             };
}

+ (NSValueTransformer *)platformSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkPlatformSummary class]];
}

@end

@implementation AWSElasticbeanstalkListTagsForResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSElasticbeanstalkListener

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"port" : @"Port",
             @"protocols" : @"Protocol",
             };
}

@end

@implementation AWSElasticbeanstalkLoadBalancer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSElasticbeanstalkLoadBalancerDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             @"listeners" : @"Listeners",
             @"loadBalancerName" : @"LoadBalancerName",
             };
}

+ (NSValueTransformer *)listenersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkListener class]];
}

@end

@implementation AWSElasticbeanstalkManagedAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionDescription" : @"ActionDescription",
             @"actionId" : @"ActionId",
             @"actionType" : @"ActionType",
             @"status" : @"Status",
             @"windowStartTime" : @"WindowStartTime",
             };
}

+ (NSValueTransformer *)actionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InstanceRefresh"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionTypeInstanceRefresh);
        }
        if ([value caseInsensitiveCompare:@"PlatformUpdate"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionTypePlatformUpdate);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionTypeUnknown);
        }
        return @(AWSElasticbeanstalkActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkActionTypeInstanceRefresh:
                return @"InstanceRefresh";
            case AWSElasticbeanstalkActionTypePlatformUpdate:
                return @"PlatformUpdate";
            case AWSElasticbeanstalkActionTypeUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Running"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionStatusUnknown);
        }
        return @(AWSElasticbeanstalkActionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkActionStatusScheduled:
                return @"Scheduled";
            case AWSElasticbeanstalkActionStatusPending:
                return @"Pending";
            case AWSElasticbeanstalkActionStatusRunning:
                return @"Running";
            case AWSElasticbeanstalkActionStatusUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)windowStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSElasticbeanstalkManagedActionHistoryItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionDescription" : @"ActionDescription",
             @"actionId" : @"ActionId",
             @"actionType" : @"ActionType",
             @"executedTime" : @"ExecutedTime",
             @"failureDescription" : @"FailureDescription",
             @"failureType" : @"FailureType",
             @"finishedTime" : @"FinishedTime",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)actionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InstanceRefresh"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionTypeInstanceRefresh);
        }
        if ([value caseInsensitiveCompare:@"PlatformUpdate"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionTypePlatformUpdate);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionTypeUnknown);
        }
        return @(AWSElasticbeanstalkActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkActionTypeInstanceRefresh:
                return @"InstanceRefresh";
            case AWSElasticbeanstalkActionTypePlatformUpdate:
                return @"PlatformUpdate";
            case AWSElasticbeanstalkActionTypeUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)executedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)failureTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UpdateCancelled"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkFailureTypeUpdateCancelled);
        }
        if ([value caseInsensitiveCompare:@"CancellationFailed"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkFailureTypeCancellationFailed);
        }
        if ([value caseInsensitiveCompare:@"RollbackFailed"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkFailureTypeRollbackFailed);
        }
        if ([value caseInsensitiveCompare:@"RollbackSuccessful"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkFailureTypeRollbackSuccessful);
        }
        if ([value caseInsensitiveCompare:@"InternalFailure"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkFailureTypeInternalFailure);
        }
        if ([value caseInsensitiveCompare:@"InvalidEnvironmentState"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkFailureTypeInvalidEnvironmentState);
        }
        if ([value caseInsensitiveCompare:@"PermissionsError"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkFailureTypePermissionsError);
        }
        return @(AWSElasticbeanstalkFailureTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkFailureTypeUpdateCancelled:
                return @"UpdateCancelled";
            case AWSElasticbeanstalkFailureTypeCancellationFailed:
                return @"CancellationFailed";
            case AWSElasticbeanstalkFailureTypeRollbackFailed:
                return @"RollbackFailed";
            case AWSElasticbeanstalkFailureTypeRollbackSuccessful:
                return @"RollbackSuccessful";
            case AWSElasticbeanstalkFailureTypeInternalFailure:
                return @"InternalFailure";
            case AWSElasticbeanstalkFailureTypeInvalidEnvironmentState:
                return @"InvalidEnvironmentState";
            case AWSElasticbeanstalkFailureTypePermissionsError:
                return @"PermissionsError";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)finishedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Completed"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionHistoryStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionHistoryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkActionHistoryStatusUnknown);
        }
        return @(AWSElasticbeanstalkActionHistoryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkActionHistoryStatusCompleted:
                return @"Completed";
            case AWSElasticbeanstalkActionHistoryStatusFailed:
                return @"Failed";
            case AWSElasticbeanstalkActionHistoryStatusUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticbeanstalkMaxAgeRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteSourceFromS3" : @"DeleteSourceFromS3",
             @"enabled" : @"Enabled",
             @"maxAgeInDays" : @"MaxAgeInDays",
             };
}

@end

@implementation AWSElasticbeanstalkMaxCountRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteSourceFromS3" : @"DeleteSourceFromS3",
             @"enabled" : @"Enabled",
             @"maxCount" : @"MaxCount",
             };
}

@end

@implementation AWSElasticbeanstalkOptionRestrictionRegex

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"label" : @"Label",
             @"pattern" : @"Pattern",
             };
}

@end

@implementation AWSElasticbeanstalkOptionSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"namespace" : @"Namespace",
             @"optionName" : @"OptionName",
             @"resourceName" : @"ResourceName",
             };
}

@end

@implementation AWSElasticbeanstalkPlatformBranchSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branchName" : @"BranchName",
             @"branchOrder" : @"BranchOrder",
             @"lifecycleState" : @"LifecycleState",
             @"platformName" : @"PlatformName",
             @"supportedTierList" : @"SupportedTierList",
             };
}

@end

@implementation AWSElasticbeanstalkPlatformDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAmiList" : @"CustomAmiList",
             @"dateCreated" : @"DateCreated",
             @"dateUpdated" : @"DateUpdated",
             @"detail" : @"Description",
             @"frameworks" : @"Frameworks",
             @"maintainer" : @"Maintainer",
             @"operatingSystemName" : @"OperatingSystemName",
             @"operatingSystemVersion" : @"OperatingSystemVersion",
             @"platformArn" : @"PlatformArn",
             @"platformBranchLifecycleState" : @"PlatformBranchLifecycleState",
             @"platformBranchName" : @"PlatformBranchName",
             @"platformCategory" : @"PlatformCategory",
             @"platformLifecycleState" : @"PlatformLifecycleState",
             @"platformName" : @"PlatformName",
             @"platformOwner" : @"PlatformOwner",
             @"platformStatus" : @"PlatformStatus",
             @"platformVersion" : @"PlatformVersion",
             @"programmingLanguages" : @"ProgrammingLanguages",
             @"solutionStackName" : @"SolutionStackName",
             @"supportedAddonList" : @"SupportedAddonList",
             @"supportedTierList" : @"SupportedTierList",
             };
}

+ (NSValueTransformer *)customAmiListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkCustomAmi class]];
}

+ (NSValueTransformer *)dateCreatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)dateUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)frameworksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkPlatformFramework class]];
}

+ (NSValueTransformer *)platformStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkPlatformStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkPlatformStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkPlatformStatusReady);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkPlatformStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Deleted"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkPlatformStatusDeleted);
        }
        return @(AWSElasticbeanstalkPlatformStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkPlatformStatusCreating:
                return @"Creating";
            case AWSElasticbeanstalkPlatformStatusFailed:
                return @"Failed";
            case AWSElasticbeanstalkPlatformStatusReady:
                return @"Ready";
            case AWSElasticbeanstalkPlatformStatusDeleting:
                return @"Deleting";
            case AWSElasticbeanstalkPlatformStatusDeleted:
                return @"Deleted";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)programmingLanguagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkPlatformProgrammingLanguage class]];
}

@end

@implementation AWSElasticbeanstalkPlatformFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operator" : @"Operator",
             @"types" : @"Type",
             @"values" : @"Values",
             };
}

@end

@implementation AWSElasticbeanstalkPlatformFramework

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

@end

@implementation AWSElasticbeanstalkPlatformProgrammingLanguage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

@end

@implementation AWSElasticbeanstalkPlatformSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operatingSystemName" : @"OperatingSystemName",
             @"operatingSystemVersion" : @"OperatingSystemVersion",
             @"platformArn" : @"PlatformArn",
             @"platformBranchLifecycleState" : @"PlatformBranchLifecycleState",
             @"platformBranchName" : @"PlatformBranchName",
             @"platformCategory" : @"PlatformCategory",
             @"platformLifecycleState" : @"PlatformLifecycleState",
             @"platformOwner" : @"PlatformOwner",
             @"platformStatus" : @"PlatformStatus",
             @"platformVersion" : @"PlatformVersion",
             @"supportedAddonList" : @"SupportedAddonList",
             @"supportedTierList" : @"SupportedTierList",
             };
}

+ (NSValueTransformer *)platformStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Creating"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkPlatformStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkPlatformStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkPlatformStatusReady);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkPlatformStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"Deleted"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkPlatformStatusDeleted);
        }
        return @(AWSElasticbeanstalkPlatformStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkPlatformStatusCreating:
                return @"Creating";
            case AWSElasticbeanstalkPlatformStatusFailed:
                return @"Failed";
            case AWSElasticbeanstalkPlatformStatusReady:
                return @"Ready";
            case AWSElasticbeanstalkPlatformStatusDeleting:
                return @"Deleting";
            case AWSElasticbeanstalkPlatformStatusDeleted:
                return @"Deleted";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticbeanstalkQueue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"URL" : @"URL",
             };
}

@end

@implementation AWSElasticbeanstalkRebuildEnvironmentMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             };
}

@end

@implementation AWSElasticbeanstalkRequestEnvironmentInfoMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             @"infoType" : @"InfoType",
             };
}

+ (NSValueTransformer *)infoTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"tail"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentInfoTypeTail);
        }
        if ([value caseInsensitiveCompare:@"bundle"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentInfoTypeBundle);
        }
        return @(AWSElasticbeanstalkEnvironmentInfoTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkEnvironmentInfoTypeTail:
                return @"tail";
            case AWSElasticbeanstalkEnvironmentInfoTypeBundle:
                return @"bundle";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticbeanstalkResourceQuota

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximum" : @"Maximum",
             };
}

@end

@implementation AWSElasticbeanstalkResourceQuotas

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationQuota" : @"ApplicationQuota",
             @"applicationVersionQuota" : @"ApplicationVersionQuota",
             @"configurationTemplateQuota" : @"ConfigurationTemplateQuota",
             @"customPlatformQuota" : @"CustomPlatformQuota",
             @"environmentQuota" : @"EnvironmentQuota",
             };
}

+ (NSValueTransformer *)applicationQuotaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkResourceQuota class]];
}

+ (NSValueTransformer *)applicationVersionQuotaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkResourceQuota class]];
}

+ (NSValueTransformer *)configurationTemplateQuotaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkResourceQuota class]];
}

+ (NSValueTransformer *)customPlatformQuotaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkResourceQuota class]];
}

+ (NSValueTransformer *)environmentQuotaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkResourceQuota class]];
}

@end

@implementation AWSElasticbeanstalkResourceTagsDescriptionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"resourceTags" : @"ResourceTags",
             };
}

+ (NSValueTransformer *)resourceTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkTag class]];
}

@end

@implementation AWSElasticbeanstalkRestartAppServerMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             };
}

@end

@implementation AWSElasticbeanstalkRetrieveEnvironmentInfoMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             @"infoType" : @"InfoType",
             };
}

+ (NSValueTransformer *)infoTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"tail"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentInfoTypeTail);
        }
        if ([value caseInsensitiveCompare:@"bundle"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkEnvironmentInfoTypeBundle);
        }
        return @(AWSElasticbeanstalkEnvironmentInfoTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkEnvironmentInfoTypeTail:
                return @"tail";
            case AWSElasticbeanstalkEnvironmentInfoTypeBundle:
                return @"bundle";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentInfo" : @"EnvironmentInfo",
             };
}

+ (NSValueTransformer *)environmentInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkEnvironmentInfoDescription class]];
}

@end

@implementation AWSElasticbeanstalkS3Location

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3Key" : @"S3Key",
             };
}

@end

@implementation AWSElasticbeanstalkSearchFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"operator" : @"Operator",
             @"values" : @"Values",
             };
}

@end

@implementation AWSElasticbeanstalkSingleInstanceHealth

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationMetrics" : @"ApplicationMetrics",
             @"availabilityZone" : @"AvailabilityZone",
             @"causes" : @"Causes",
             @"color" : @"Color",
             @"deployment" : @"Deployment",
             @"healthStatus" : @"HealthStatus",
             @"instanceId" : @"InstanceId",
             @"instanceType" : @"InstanceType",
             @"launchedAt" : @"LaunchedAt",
             @"system" : @"System",
             };
}

+ (NSValueTransformer *)applicationMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkApplicationMetrics class]];
}

+ (NSValueTransformer *)deploymentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkDeployment class]];
}

+ (NSValueTransformer *)launchedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)systemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkSystemStatus class]];
}

@end

@implementation AWSElasticbeanstalkSolutionStackDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"permittedFileTypes" : @"PermittedFileTypes",
             @"solutionStackName" : @"SolutionStackName",
             };
}

@end

@implementation AWSElasticbeanstalkSourceBuildInformation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceLocation" : @"SourceLocation",
             @"sourceRepository" : @"SourceRepository",
             @"sourceType" : @"SourceType",
             };
}

+ (NSValueTransformer *)sourceRepositoryJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CodeCommit"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkSourceRepositoryCodeCommit);
        }
        if ([value caseInsensitiveCompare:@"S3"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkSourceRepositoryS3);
        }
        return @(AWSElasticbeanstalkSourceRepositoryUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkSourceRepositoryCodeCommit:
                return @"CodeCommit";
            case AWSElasticbeanstalkSourceRepositoryS3:
                return @"S3";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Git"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkSourceTypeGit);
        }
        if ([value caseInsensitiveCompare:@"Zip"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkSourceTypeZip);
        }
        return @(AWSElasticbeanstalkSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkSourceTypeGit:
                return @"Git";
            case AWSElasticbeanstalkSourceTypeZip:
                return @"Zip";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSElasticbeanstalkSourceConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"templateName" : @"TemplateName",
             };
}

@end

@implementation AWSElasticbeanstalkStatusCodes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status2xx" : @"Status2xx",
             @"status3xx" : @"Status3xx",
             @"status4xx" : @"Status4xx",
             @"status5xx" : @"Status5xx",
             };
}

@end

@implementation AWSElasticbeanstalkSwapEnvironmentCNAMEsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationEnvironmentId" : @"DestinationEnvironmentId",
             @"destinationEnvironmentName" : @"DestinationEnvironmentName",
             @"sourceEnvironmentId" : @"SourceEnvironmentId",
             @"sourceEnvironmentName" : @"SourceEnvironmentName",
             };
}

@end

@implementation AWSElasticbeanstalkSystemStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CPUUtilization" : @"CPUUtilization",
             @"loadAverage" : @"LoadAverage",
             };
}

+ (NSValueTransformer *)CPUUtilizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkCPUUtilization class]];
}

@end

@implementation AWSElasticbeanstalkTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSElasticbeanstalkTerminateEnvironmentMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             @"forceTerminate" : @"ForceTerminate",
             @"terminateResources" : @"TerminateResources",
             };
}

@end

@implementation AWSElasticbeanstalkTrigger

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSElasticbeanstalkUpdateApplicationMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"detail" : @"Description",
             };
}

@end

@implementation AWSElasticbeanstalkUpdateApplicationResourceLifecycleMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"resourceLifecycleConfig" : @"ResourceLifecycleConfig",
             };
}

+ (NSValueTransformer *)resourceLifecycleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkApplicationResourceLifecycleConfig class]];
}

@end

@implementation AWSElasticbeanstalkUpdateApplicationVersionMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"detail" : @"Description",
             @"versionLabel" : @"VersionLabel",
             };
}

@end

@implementation AWSElasticbeanstalkUpdateConfigurationTemplateMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"detail" : @"Description",
             @"optionSettings" : @"OptionSettings",
             @"optionsToRemove" : @"OptionsToRemove",
             @"templateName" : @"TemplateName",
             };
}

+ (NSValueTransformer *)optionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkConfigurationOptionSetting class]];
}

+ (NSValueTransformer *)optionsToRemoveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkOptionSpecification class]];
}

@end

@implementation AWSElasticbeanstalkUpdateEnvironmentMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"detail" : @"Description",
             @"environmentId" : @"EnvironmentId",
             @"environmentName" : @"EnvironmentName",
             @"groupName" : @"GroupName",
             @"optionSettings" : @"OptionSettings",
             @"optionsToRemove" : @"OptionsToRemove",
             @"platformArn" : @"PlatformArn",
             @"solutionStackName" : @"SolutionStackName",
             @"templateName" : @"TemplateName",
             @"tier" : @"Tier",
             @"versionLabel" : @"VersionLabel",
             };
}

+ (NSValueTransformer *)optionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkConfigurationOptionSetting class]];
}

+ (NSValueTransformer *)optionsToRemoveJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkOptionSpecification class]];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSElasticbeanstalkEnvironmentTier class]];
}

@end

@implementation AWSElasticbeanstalkUpdateTagsForResourceMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagsToAdd" : @"TagsToAdd",
             @"tagsToRemove" : @"TagsToRemove",
             };
}

+ (NSValueTransformer *)tagsToAddJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkTag class]];
}

@end

@implementation AWSElasticbeanstalkValidateConfigurationSettingsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationName" : @"ApplicationName",
             @"environmentName" : @"EnvironmentName",
             @"optionSettings" : @"OptionSettings",
             @"templateName" : @"TemplateName",
             };
}

+ (NSValueTransformer *)optionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSElasticbeanstalkConfigurationOptionSetting class]];
}

@end

@implementation AWSElasticbeanstalkValidationMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"namespace" : @"Namespace",
             @"optionName" : @"OptionName",
             @"severity" : @"Severity",
             };
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"error"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkValidationSeverityError);
        }
        if ([value caseInsensitiveCompare:@"warning"] == NSOrderedSame) {
            return @(AWSElasticbeanstalkValidationSeverityWarning);
        }
        return @(AWSElasticbeanstalkValidationSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSElasticbeanstalkValidationSeverityError:
                return @"error";
            case AWSElasticbeanstalkValidationSeverityWarning:
                return @"warning";
            default:
                return nil;
        }
    }];
}

@end
