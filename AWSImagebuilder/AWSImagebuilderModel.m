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

#import "AWSImagebuilderModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSImagebuilderErrorDomain = @"com.amazonaws.AWSImagebuilderErrorDomain";

@implementation AWSImagebuilderAmi

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"image" : @"image",
             @"name" : @"name",
             @"region" : @"region",
             @"state" : @"state",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderImageState class]];
}

@end

@implementation AWSImagebuilderAmiDistributionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amiTags" : @"amiTags",
             @"detail" : @"description",
             @"launchPermission" : @"launchPermission",
             @"name" : @"name",
             };
}

+ (NSValueTransformer *)launchPermissionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderLaunchPermissionConfiguration class]];
}

@end

@implementation AWSImagebuilderCancelImageCreationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             };
}

@end

@implementation AWSImagebuilderCancelImageCreationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderComponent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"changeDescription" : @"changeDescription",
             @"data" : @"data",
             @"dateCreated" : @"dateCreated",
             @"detail" : @"description",
             @"encrypted" : @"encrypted",
             @"kmsKeyId" : @"kmsKeyId",
             @"name" : @"name",
             @"owner" : @"owner",
             @"platform" : @"platform",
             @"supportedOsVersions" : @"supportedOsVersions",
             @"tags" : @"tags",
             @"types" : @"type",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformLinux);
        }
        return @(AWSImagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPlatformWindows:
                return @"Windows";
            case AWSImagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILD"] == NSOrderedSame) {
            return @(AWSImagebuilderComponentTypeBuild);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSImagebuilderComponentTypeTest);
        }
        return @(AWSImagebuilderComponentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderComponentTypeBuild:
                return @"BUILD";
            case AWSImagebuilderComponentTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderComponentConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentArn" : @"componentArn",
             };
}

@end

@implementation AWSImagebuilderComponentSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"changeDescription" : @"changeDescription",
             @"dateCreated" : @"dateCreated",
             @"detail" : @"description",
             @"name" : @"name",
             @"owner" : @"owner",
             @"platform" : @"platform",
             @"supportedOsVersions" : @"supportedOsVersions",
             @"tags" : @"tags",
             @"types" : @"type",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformLinux);
        }
        return @(AWSImagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPlatformWindows:
                return @"Windows";
            case AWSImagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILD"] == NSOrderedSame) {
            return @(AWSImagebuilderComponentTypeBuild);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSImagebuilderComponentTypeTest);
        }
        return @(AWSImagebuilderComponentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderComponentTypeBuild:
                return @"BUILD";
            case AWSImagebuilderComponentTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderComponentVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"dateCreated" : @"dateCreated",
             @"detail" : @"description",
             @"name" : @"name",
             @"owner" : @"owner",
             @"platform" : @"platform",
             @"supportedOsVersions" : @"supportedOsVersions",
             @"types" : @"type",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformLinux);
        }
        return @(AWSImagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPlatformWindows:
                return @"Windows";
            case AWSImagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILD"] == NSOrderedSame) {
            return @(AWSImagebuilderComponentTypeBuild);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSImagebuilderComponentTypeTest);
        }
        return @(AWSImagebuilderComponentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderComponentTypeBuild:
                return @"BUILD";
            case AWSImagebuilderComponentTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderCreateComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeDescription" : @"changeDescription",
             @"clientToken" : @"clientToken",
             @"data" : @"data",
             @"detail" : @"description",
             @"kmsKeyId" : @"kmsKeyId",
             @"name" : @"name",
             @"platform" : @"platform",
             @"semanticVersion" : @"semanticVersion",
             @"supportedOsVersions" : @"supportedOsVersions",
             @"tags" : @"tags",
             @"uri" : @"uri",
             };
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformLinux);
        }
        return @(AWSImagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPlatformWindows:
                return @"Windows";
            case AWSImagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderCreateComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"componentBuildVersionArn" : @"componentBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderCreateDistributionConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"detail" : @"description",
             @"distributions" : @"distributions",
             @"name" : @"name",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)distributionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderDistribution class]];
}

@end

@implementation AWSImagebuilderCreateDistributionConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderCreateImagePipelineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"detail" : @"description",
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             @"enhancedImageMetadataEnabled" : @"enhancedImageMetadataEnabled",
             @"imageRecipeArn" : @"imageRecipeArn",
             @"imageTestsConfiguration" : @"imageTestsConfiguration",
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             @"name" : @"name",
             @"schedule" : @"schedule",
             @"status" : @"status",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)imageTestsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderImageTestsConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderSchedule class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSImagebuilderPipelineStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSImagebuilderPipelineStatusEnabled);
        }
        return @(AWSImagebuilderPipelineStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPipelineStatusDisabled:
                return @"DISABLED";
            case AWSImagebuilderPipelineStatusEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderCreateImagePipelineResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imagePipelineArn" : @"imagePipelineArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderCreateImageRecipeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockDeviceMappings" : @"blockDeviceMappings",
             @"clientToken" : @"clientToken",
             @"components" : @"components",
             @"detail" : @"description",
             @"name" : @"name",
             @"parentImage" : @"parentImage",
             @"semanticVersion" : @"semanticVersion",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderInstanceBlockDeviceMapping class]];
}

+ (NSValueTransformer *)componentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderComponentConfiguration class]];
}

@end

@implementation AWSImagebuilderCreateImageRecipeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imageRecipeArn" : @"imageRecipeArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderCreateImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             @"enhancedImageMetadataEnabled" : @"enhancedImageMetadataEnabled",
             @"imageRecipeArn" : @"imageRecipeArn",
             @"imageTestsConfiguration" : @"imageTestsConfiguration",
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)imageTestsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderImageTestsConfiguration class]];
}

@end

@implementation AWSImagebuilderCreateImageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderCreateInfrastructureConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"detail" : @"description",
             @"instanceProfileName" : @"instanceProfileName",
             @"instanceTypes" : @"instanceTypes",
             @"keyPair" : @"keyPair",
             @"logging" : @"logging",
             @"name" : @"name",
             @"securityGroupIds" : @"securityGroupIds",
             @"snsTopicArn" : @"snsTopicArn",
             @"subnetId" : @"subnetId",
             @"tags" : @"tags",
             @"terminateInstanceOnFailure" : @"terminateInstanceOnFailure",
             };
}

+ (NSValueTransformer *)loggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderLogging class]];
}

@end

@implementation AWSImagebuilderCreateInfrastructureConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderDeleteComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentBuildVersionArn" : @"componentBuildVersionArn",
             };
}

@end

@implementation AWSImagebuilderDeleteComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentBuildVersionArn" : @"componentBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderDeleteDistributionConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             };
}

@end

@implementation AWSImagebuilderDeleteDistributionConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderDeleteImagePipelineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imagePipelineArn" : @"imagePipelineArn",
             };
}

@end

@implementation AWSImagebuilderDeleteImagePipelineResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imagePipelineArn" : @"imagePipelineArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderDeleteImageRecipeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeArn" : @"imageRecipeArn",
             };
}

@end

@implementation AWSImagebuilderDeleteImageRecipeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeArn" : @"imageRecipeArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderDeleteImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             };
}

@end

@implementation AWSImagebuilderDeleteImageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderDeleteInfrastructureConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             };
}

@end

@implementation AWSImagebuilderDeleteInfrastructureConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderDistribution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amiDistributionConfiguration" : @"amiDistributionConfiguration",
             @"licenseConfigurationArns" : @"licenseConfigurationArns",
             @"region" : @"region",
             };
}

+ (NSValueTransformer *)amiDistributionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderAmiDistributionConfiguration class]];
}

@end

@implementation AWSImagebuilderDistributionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"dateCreated" : @"dateCreated",
             @"dateUpdated" : @"dateUpdated",
             @"detail" : @"description",
             @"distributions" : @"distributions",
             @"name" : @"name",
             @"tags" : @"tags",
             @"timeoutMinutes" : @"timeoutMinutes",
             };
}

+ (NSValueTransformer *)distributionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderDistribution class]];
}

@end

@implementation AWSImagebuilderDistributionConfigurationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"dateCreated" : @"dateCreated",
             @"dateUpdated" : @"dateUpdated",
             @"detail" : @"description",
             @"name" : @"name",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSImagebuilderEbsInstanceBlockDeviceSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteOnTermination" : @"deleteOnTermination",
             @"encrypted" : @"encrypted",
             @"iops" : @"iops",
             @"kmsKeyId" : @"kmsKeyId",
             @"snapshotId" : @"snapshotId",
             @"volumeSize" : @"volumeSize",
             @"volumeType" : @"volumeType",
             };
}

+ (NSValueTransformer *)volumeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"standard"] == NSOrderedSame) {
            return @(AWSImagebuilderEbsVolumeTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"io1"] == NSOrderedSame) {
            return @(AWSImagebuilderEbsVolumeTypeIO1);
        }
        if ([value caseInsensitiveCompare:@"gp2"] == NSOrderedSame) {
            return @(AWSImagebuilderEbsVolumeTypeGp2);
        }
        if ([value caseInsensitiveCompare:@"sc1"] == NSOrderedSame) {
            return @(AWSImagebuilderEbsVolumeTypeSc1);
        }
        if ([value caseInsensitiveCompare:@"st1"] == NSOrderedSame) {
            return @(AWSImagebuilderEbsVolumeTypeSt1);
        }
        return @(AWSImagebuilderEbsVolumeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderEbsVolumeTypeStandard:
                return @"standard";
            case AWSImagebuilderEbsVolumeTypeIO1:
                return @"io1";
            case AWSImagebuilderEbsVolumeTypeGp2:
                return @"gp2";
            case AWSImagebuilderEbsVolumeTypeSc1:
                return @"sc1";
            case AWSImagebuilderEbsVolumeTypeSt1:
                return @"st1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"values" : @"values",
             };
}

@end

@implementation AWSImagebuilderGetComponentPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentArn" : @"componentArn",
             };
}

@end

@implementation AWSImagebuilderGetComponentPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"policy",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderGetComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentBuildVersionArn" : @"componentBuildVersionArn",
             };
}

@end

@implementation AWSImagebuilderGetComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"component" : @"component",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)componentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderComponent class]];
}

@end

@implementation AWSImagebuilderGetDistributionConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             };
}

@end

@implementation AWSImagebuilderGetDistributionConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfiguration" : @"distributionConfiguration",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)distributionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderDistributionConfiguration class]];
}

@end

@implementation AWSImagebuilderGetImagePipelineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imagePipelineArn" : @"imagePipelineArn",
             };
}

@end

@implementation AWSImagebuilderGetImagePipelineResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imagePipeline" : @"imagePipeline",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imagePipelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderImagePipeline class]];
}

@end

@implementation AWSImagebuilderGetImagePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageArn" : @"imageArn",
             };
}

@end

@implementation AWSImagebuilderGetImagePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"policy",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderGetImageRecipePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeArn" : @"imageRecipeArn",
             };
}

@end

@implementation AWSImagebuilderGetImageRecipePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"policy",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderGetImageRecipeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeArn" : @"imageRecipeArn",
             };
}

@end

@implementation AWSImagebuilderGetImageRecipeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipe" : @"imageRecipe",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imageRecipeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderImageRecipe class]];
}

@end

@implementation AWSImagebuilderGetImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             };
}

@end

@implementation AWSImagebuilderGetImageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"image" : @"image",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderImage class]];
}

@end

@implementation AWSImagebuilderGetInfrastructureConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             };
}

@end

@implementation AWSImagebuilderGetInfrastructureConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"infrastructureConfiguration" : @"infrastructureConfiguration",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)infrastructureConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderInfrastructureConfiguration class]];
}

@end

@implementation AWSImagebuilderImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"dateCreated" : @"dateCreated",
             @"distributionConfiguration" : @"distributionConfiguration",
             @"enhancedImageMetadataEnabled" : @"enhancedImageMetadataEnabled",
             @"imageRecipe" : @"imageRecipe",
             @"imageTestsConfiguration" : @"imageTestsConfiguration",
             @"infrastructureConfiguration" : @"infrastructureConfiguration",
             @"name" : @"name",
             @"osVersion" : @"osVersion",
             @"outputResources" : @"outputResources",
             @"platform" : @"platform",
             @"sourcePipelineArn" : @"sourcePipelineArn",
             @"sourcePipelineName" : @"sourcePipelineName",
             @"state" : @"state",
             @"tags" : @"tags",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)distributionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderDistributionConfiguration class]];
}

+ (NSValueTransformer *)imageRecipeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderImageRecipe class]];
}

+ (NSValueTransformer *)imageTestsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderImageTestsConfiguration class]];
}

+ (NSValueTransformer *)infrastructureConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderInfrastructureConfiguration class]];
}

+ (NSValueTransformer *)outputResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderOutputResources class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformLinux);
        }
        return @(AWSImagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPlatformWindows:
                return @"Windows";
            case AWSImagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderImageState class]];
}

@end

@implementation AWSImagebuilderImagePipeline

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"dateCreated" : @"dateCreated",
             @"dateLastRun" : @"dateLastRun",
             @"dateNextRun" : @"dateNextRun",
             @"dateUpdated" : @"dateUpdated",
             @"detail" : @"description",
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             @"enhancedImageMetadataEnabled" : @"enhancedImageMetadataEnabled",
             @"imageRecipeArn" : @"imageRecipeArn",
             @"imageTestsConfiguration" : @"imageTestsConfiguration",
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             @"name" : @"name",
             @"platform" : @"platform",
             @"schedule" : @"schedule",
             @"status" : @"status",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)imageTestsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderImageTestsConfiguration class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformLinux);
        }
        return @(AWSImagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPlatformWindows:
                return @"Windows";
            case AWSImagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderSchedule class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSImagebuilderPipelineStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSImagebuilderPipelineStatusEnabled);
        }
        return @(AWSImagebuilderPipelineStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPipelineStatusDisabled:
                return @"DISABLED";
            case AWSImagebuilderPipelineStatusEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderImageRecipe

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"blockDeviceMappings" : @"blockDeviceMappings",
             @"components" : @"components",
             @"dateCreated" : @"dateCreated",
             @"detail" : @"description",
             @"name" : @"name",
             @"owner" : @"owner",
             @"parentImage" : @"parentImage",
             @"platform" : @"platform",
             @"tags" : @"tags",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderInstanceBlockDeviceMapping class]];
}

+ (NSValueTransformer *)componentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderComponentConfiguration class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformLinux);
        }
        return @(AWSImagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPlatformWindows:
                return @"Windows";
            case AWSImagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderImageRecipeSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"dateCreated" : @"dateCreated",
             @"name" : @"name",
             @"owner" : @"owner",
             @"parentImage" : @"parentImage",
             @"platform" : @"platform",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformLinux);
        }
        return @(AWSImagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPlatformWindows:
                return @"Windows";
            case AWSImagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderImageState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reason" : @"reason",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSImagebuilderImageStatusPending);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSImagebuilderImageStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"BUILDING"] == NSOrderedSame) {
            return @(AWSImagebuilderImageStatusBuilding);
        }
        if ([value caseInsensitiveCompare:@"TESTING"] == NSOrderedSame) {
            return @(AWSImagebuilderImageStatusTesting);
        }
        if ([value caseInsensitiveCompare:@"DISTRIBUTING"] == NSOrderedSame) {
            return @(AWSImagebuilderImageStatusDistributing);
        }
        if ([value caseInsensitiveCompare:@"INTEGRATING"] == NSOrderedSame) {
            return @(AWSImagebuilderImageStatusIntegrating);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSImagebuilderImageStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSImagebuilderImageStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSImagebuilderImageStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSImagebuilderImageStatusDeprecated);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSImagebuilderImageStatusDeleted);
        }
        return @(AWSImagebuilderImageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderImageStatusPending:
                return @"PENDING";
            case AWSImagebuilderImageStatusCreating:
                return @"CREATING";
            case AWSImagebuilderImageStatusBuilding:
                return @"BUILDING";
            case AWSImagebuilderImageStatusTesting:
                return @"TESTING";
            case AWSImagebuilderImageStatusDistributing:
                return @"DISTRIBUTING";
            case AWSImagebuilderImageStatusIntegrating:
                return @"INTEGRATING";
            case AWSImagebuilderImageStatusAvailable:
                return @"AVAILABLE";
            case AWSImagebuilderImageStatusCancelled:
                return @"CANCELLED";
            case AWSImagebuilderImageStatusFailed:
                return @"FAILED";
            case AWSImagebuilderImageStatusDeprecated:
                return @"DEPRECATED";
            case AWSImagebuilderImageStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderImageSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"dateCreated" : @"dateCreated",
             @"name" : @"name",
             @"osVersion" : @"osVersion",
             @"outputResources" : @"outputResources",
             @"owner" : @"owner",
             @"platform" : @"platform",
             @"state" : @"state",
             @"tags" : @"tags",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)outputResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderOutputResources class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformLinux);
        }
        return @(AWSImagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPlatformWindows:
                return @"Windows";
            case AWSImagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderImageState class]];
}

@end

@implementation AWSImagebuilderImageTestsConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageTestsEnabled" : @"imageTestsEnabled",
             @"timeoutMinutes" : @"timeoutMinutes",
             };
}

@end

@implementation AWSImagebuilderImageVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"dateCreated" : @"dateCreated",
             @"name" : @"name",
             @"osVersion" : @"osVersion",
             @"owner" : @"owner",
             @"platform" : @"platform",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformLinux);
        }
        return @(AWSImagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPlatformWindows:
                return @"Windows";
            case AWSImagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderImportComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeDescription" : @"changeDescription",
             @"clientToken" : @"clientToken",
             @"data" : @"data",
             @"detail" : @"description",
             @"format" : @"format",
             @"kmsKeyId" : @"kmsKeyId",
             @"name" : @"name",
             @"platform" : @"platform",
             @"semanticVersion" : @"semanticVersion",
             @"tags" : @"tags",
             @"types" : @"type",
             @"uri" : @"uri",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SHELL"] == NSOrderedSame) {
            return @(AWSImagebuilderComponentFormatShell);
        }
        return @(AWSImagebuilderComponentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderComponentFormatShell:
                return @"SHELL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSImagebuilderPlatformLinux);
        }
        return @(AWSImagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPlatformWindows:
                return @"Windows";
            case AWSImagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILD"] == NSOrderedSame) {
            return @(AWSImagebuilderComponentTypeBuild);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSImagebuilderComponentTypeTest);
        }
        return @(AWSImagebuilderComponentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderComponentTypeBuild:
                return @"BUILD";
            case AWSImagebuilderComponentTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderImportComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"componentBuildVersionArn" : @"componentBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderInfrastructureConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"dateCreated" : @"dateCreated",
             @"dateUpdated" : @"dateUpdated",
             @"detail" : @"description",
             @"instanceProfileName" : @"instanceProfileName",
             @"instanceTypes" : @"instanceTypes",
             @"keyPair" : @"keyPair",
             @"logging" : @"logging",
             @"name" : @"name",
             @"securityGroupIds" : @"securityGroupIds",
             @"snsTopicArn" : @"snsTopicArn",
             @"subnetId" : @"subnetId",
             @"tags" : @"tags",
             @"terminateInstanceOnFailure" : @"terminateInstanceOnFailure",
             };
}

+ (NSValueTransformer *)loggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderLogging class]];
}

@end

@implementation AWSImagebuilderInfrastructureConfigurationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"dateCreated" : @"dateCreated",
             @"dateUpdated" : @"dateUpdated",
             @"detail" : @"description",
             @"name" : @"name",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSImagebuilderInstanceBlockDeviceMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceName" : @"deviceName",
             @"ebs" : @"ebs",
             @"noDevice" : @"noDevice",
             @"virtualName" : @"virtualName",
             };
}

+ (NSValueTransformer *)ebsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderEbsInstanceBlockDeviceSpecification class]];
}

@end

@implementation AWSImagebuilderLaunchPermissionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userGroups" : @"userGroups",
             @"userIds" : @"userIds",
             };
}

@end

@implementation AWSImagebuilderListComponentBuildVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentVersionArn" : @"componentVersionArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSImagebuilderListComponentBuildVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentSummaryList" : @"componentSummaryList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)componentSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderComponentSummary class]];
}

@end

@implementation AWSImagebuilderListComponentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"owner" : @"owner",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderFilter class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Self"] == NSOrderedSame) {
            return @(AWSImagebuilderOwnershipSelf);
        }
        if ([value caseInsensitiveCompare:@"Shared"] == NSOrderedSame) {
            return @(AWSImagebuilderOwnershipShared);
        }
        if ([value caseInsensitiveCompare:@"Amazon"] == NSOrderedSame) {
            return @(AWSImagebuilderOwnershipAmazon);
        }
        return @(AWSImagebuilderOwnershipUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderOwnershipSelf:
                return @"Self";
            case AWSImagebuilderOwnershipShared:
                return @"Shared";
            case AWSImagebuilderOwnershipAmazon:
                return @"Amazon";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderListComponentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentVersionList" : @"componentVersionList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)componentVersionListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderComponentVersion class]];
}

@end

@implementation AWSImagebuilderListDistributionConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderFilter class]];
}

@end

@implementation AWSImagebuilderListDistributionConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfigurationSummaryList" : @"distributionConfigurationSummaryList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)distributionConfigurationSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderDistributionConfigurationSummary class]];
}

@end

@implementation AWSImagebuilderListImageBuildVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"imageVersionArn" : @"imageVersionArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderFilter class]];
}

@end

@implementation AWSImagebuilderListImageBuildVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageSummaryList" : @"imageSummaryList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imageSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderImageSummary class]];
}

@end

@implementation AWSImagebuilderListImagePipelineImagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"imagePipelineArn" : @"imagePipelineArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderFilter class]];
}

@end

@implementation AWSImagebuilderListImagePipelineImagesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageSummaryList" : @"imageSummaryList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imageSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderImageSummary class]];
}

@end

@implementation AWSImagebuilderListImagePipelinesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderFilter class]];
}

@end

@implementation AWSImagebuilderListImagePipelinesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imagePipelineList" : @"imagePipelineList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imagePipelineListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderImagePipeline class]];
}

@end

@implementation AWSImagebuilderListImageRecipesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"owner" : @"owner",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderFilter class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Self"] == NSOrderedSame) {
            return @(AWSImagebuilderOwnershipSelf);
        }
        if ([value caseInsensitiveCompare:@"Shared"] == NSOrderedSame) {
            return @(AWSImagebuilderOwnershipShared);
        }
        if ([value caseInsensitiveCompare:@"Amazon"] == NSOrderedSame) {
            return @(AWSImagebuilderOwnershipAmazon);
        }
        return @(AWSImagebuilderOwnershipUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderOwnershipSelf:
                return @"Self";
            case AWSImagebuilderOwnershipShared:
                return @"Shared";
            case AWSImagebuilderOwnershipAmazon:
                return @"Amazon";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderListImageRecipesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeSummaryList" : @"imageRecipeSummaryList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imageRecipeSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderImageRecipeSummary class]];
}

@end

@implementation AWSImagebuilderListImagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"owner" : @"owner",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderFilter class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Self"] == NSOrderedSame) {
            return @(AWSImagebuilderOwnershipSelf);
        }
        if ([value caseInsensitiveCompare:@"Shared"] == NSOrderedSame) {
            return @(AWSImagebuilderOwnershipShared);
        }
        if ([value caseInsensitiveCompare:@"Amazon"] == NSOrderedSame) {
            return @(AWSImagebuilderOwnershipAmazon);
        }
        return @(AWSImagebuilderOwnershipUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderOwnershipSelf:
                return @"Self";
            case AWSImagebuilderOwnershipShared:
                return @"Shared";
            case AWSImagebuilderOwnershipAmazon:
                return @"Amazon";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderListImagesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageVersionList" : @"imageVersionList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imageVersionListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderImageVersion class]];
}

@end

@implementation AWSImagebuilderListInfrastructureConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderFilter class]];
}

@end

@implementation AWSImagebuilderListInfrastructureConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"infrastructureConfigurationSummaryList" : @"infrastructureConfigurationSummaryList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)infrastructureConfigurationSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderInfrastructureConfigurationSummary class]];
}

@end

@implementation AWSImagebuilderListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSImagebuilderListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSImagebuilderLogging

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Logs" : @"s3Logs",
             };
}

+ (NSValueTransformer *)s3LogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderS3Logs class]];
}

@end

@implementation AWSImagebuilderOutputResources

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amis" : @"amis",
             };
}

+ (NSValueTransformer *)amisJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderAmi class]];
}

@end

@implementation AWSImagebuilderPutComponentPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentArn" : @"componentArn",
             @"policy" : @"policy",
             };
}

@end

@implementation AWSImagebuilderPutComponentPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentArn" : @"componentArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderPutImagePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageArn" : @"imageArn",
             @"policy" : @"policy",
             };
}

@end

@implementation AWSImagebuilderPutImagePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageArn" : @"imageArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderPutImageRecipePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeArn" : @"imageRecipeArn",
             @"policy" : @"policy",
             };
}

@end

@implementation AWSImagebuilderPutImageRecipePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeArn" : @"imageRecipeArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderS3Logs

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3BucketName" : @"s3BucketName",
             @"s3KeyPrefix" : @"s3KeyPrefix",
             };
}

@end

@implementation AWSImagebuilderSchedule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pipelineExecutionStartCondition" : @"pipelineExecutionStartCondition",
             @"scheduleExpression" : @"scheduleExpression",
             };
}

+ (NSValueTransformer *)pipelineExecutionStartConditionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXPRESSION_MATCH_ONLY"] == NSOrderedSame) {
            return @(AWSImagebuilderPipelineExecutionStartConditionExpressionMatchOnly);
        }
        if ([value caseInsensitiveCompare:@"EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE"] == NSOrderedSame) {
            return @(AWSImagebuilderPipelineExecutionStartConditionExpressionMatchAndDependencyUpdatesAvailable);
        }
        return @(AWSImagebuilderPipelineExecutionStartConditionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPipelineExecutionStartConditionExpressionMatchOnly:
                return @"EXPRESSION_MATCH_ONLY";
            case AWSImagebuilderPipelineExecutionStartConditionExpressionMatchAndDependencyUpdatesAvailable:
                return @"EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderStartImagePipelineExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imagePipelineArn" : @"imagePipelineArn",
             };
}

@end

@implementation AWSImagebuilderStartImagePipelineExecutionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSImagebuilderTagResourceResponse

@end

@implementation AWSImagebuilderUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSImagebuilderUntagResourceResponse

@end

@implementation AWSImagebuilderUpdateDistributionConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"detail" : @"description",
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             @"distributions" : @"distributions",
             };
}

+ (NSValueTransformer *)distributionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSImagebuilderDistribution class]];
}

@end

@implementation AWSImagebuilderUpdateDistributionConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderUpdateImagePipelineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"detail" : @"description",
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             @"enhancedImageMetadataEnabled" : @"enhancedImageMetadataEnabled",
             @"imagePipelineArn" : @"imagePipelineArn",
             @"imageRecipeArn" : @"imageRecipeArn",
             @"imageTestsConfiguration" : @"imageTestsConfiguration",
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             @"schedule" : @"schedule",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)imageTestsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderImageTestsConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderSchedule class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSImagebuilderPipelineStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSImagebuilderPipelineStatusEnabled);
        }
        return @(AWSImagebuilderPipelineStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSImagebuilderPipelineStatusDisabled:
                return @"DISABLED";
            case AWSImagebuilderPipelineStatusEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSImagebuilderUpdateImagePipelineResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imagePipelineArn" : @"imagePipelineArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSImagebuilderUpdateInfrastructureConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"detail" : @"description",
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             @"instanceProfileName" : @"instanceProfileName",
             @"instanceTypes" : @"instanceTypes",
             @"keyPair" : @"keyPair",
             @"logging" : @"logging",
             @"securityGroupIds" : @"securityGroupIds",
             @"snsTopicArn" : @"snsTopicArn",
             @"subnetId" : @"subnetId",
             @"terminateInstanceOnFailure" : @"terminateInstanceOnFailure",
             };
}

+ (NSValueTransformer *)loggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSImagebuilderLogging class]];
}

@end

@implementation AWSImagebuilderUpdateInfrastructureConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             @"requestId" : @"requestId",
             };
}

@end
