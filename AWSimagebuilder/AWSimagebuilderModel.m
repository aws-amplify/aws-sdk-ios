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

#import "AWSimagebuilderModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSimagebuilderErrorDomain = @"com.amazonaws.AWSimagebuilderErrorDomain";

@implementation AWSimagebuilderAmi

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderImageState class]];
}

@end

@implementation AWSimagebuilderAmiDistributionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amiTags" : @"amiTags",
             @"detail" : @"description",
             @"launchPermission" : @"launchPermission",
             @"name" : @"name",
             };
}

+ (NSValueTransformer *)launchPermissionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderLaunchPermissionConfiguration class]];
}

@end

@implementation AWSimagebuilderCancelImageCreationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             };
}

@end

@implementation AWSimagebuilderCancelImageCreationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderComponent

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
             @"tags" : @"tags",
             @"types" : @"type",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformLinux);
        }
        return @(AWSimagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPlatformWindows:
                return @"Windows";
            case AWSimagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILD"] == NSOrderedSame) {
            return @(AWSimagebuilderComponentTypeBuild);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSimagebuilderComponentTypeTest);
        }
        return @(AWSimagebuilderComponentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderComponentTypeBuild:
                return @"BUILD";
            case AWSimagebuilderComponentTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderComponentConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentArn" : @"componentArn",
             };
}

@end

@implementation AWSimagebuilderComponentSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"changeDescription" : @"changeDescription",
             @"dateCreated" : @"dateCreated",
             @"detail" : @"description",
             @"name" : @"name",
             @"owner" : @"owner",
             @"platform" : @"platform",
             @"tags" : @"tags",
             @"types" : @"type",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformLinux);
        }
        return @(AWSimagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPlatformWindows:
                return @"Windows";
            case AWSimagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILD"] == NSOrderedSame) {
            return @(AWSimagebuilderComponentTypeBuild);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSimagebuilderComponentTypeTest);
        }
        return @(AWSimagebuilderComponentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderComponentTypeBuild:
                return @"BUILD";
            case AWSimagebuilderComponentTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderComponentVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"dateCreated" : @"dateCreated",
             @"detail" : @"description",
             @"name" : @"name",
             @"owner" : @"owner",
             @"platform" : @"platform",
             @"types" : @"type",
             @"version" : @"version",
             };
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformLinux);
        }
        return @(AWSimagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPlatformWindows:
                return @"Windows";
            case AWSimagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILD"] == NSOrderedSame) {
            return @(AWSimagebuilderComponentTypeBuild);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSimagebuilderComponentTypeTest);
        }
        return @(AWSimagebuilderComponentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderComponentTypeBuild:
                return @"BUILD";
            case AWSimagebuilderComponentTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderCreateComponentRequest

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
             @"tags" : @"tags",
             @"uri" : @"uri",
             };
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformLinux);
        }
        return @(AWSimagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPlatformWindows:
                return @"Windows";
            case AWSimagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderCreateComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"componentBuildVersionArn" : @"componentBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderCreateDistributionConfigurationRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderDistribution class]];
}

@end

@implementation AWSimagebuilderCreateDistributionConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderCreateImagePipelineRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderImageTestsConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderSchedule class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSimagebuilderPipelineStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSimagebuilderPipelineStatusEnabled);
        }
        return @(AWSimagebuilderPipelineStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPipelineStatusDisabled:
                return @"DISABLED";
            case AWSimagebuilderPipelineStatusEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderCreateImagePipelineResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imagePipelineArn" : @"imagePipelineArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderCreateImageRecipeRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderInstanceBlockDeviceMapping class]];
}

+ (NSValueTransformer *)componentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderComponentConfiguration class]];
}

@end

@implementation AWSimagebuilderCreateImageRecipeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imageRecipeArn" : @"imageRecipeArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderCreateImageRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderImageTestsConfiguration class]];
}

@end

@implementation AWSimagebuilderCreateImageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderCreateInfrastructureConfigurationRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderLogging class]];
}

@end

@implementation AWSimagebuilderCreateInfrastructureConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderDeleteComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentBuildVersionArn" : @"componentBuildVersionArn",
             };
}

@end

@implementation AWSimagebuilderDeleteComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentBuildVersionArn" : @"componentBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderDeleteDistributionConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             };
}

@end

@implementation AWSimagebuilderDeleteDistributionConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderDeleteImagePipelineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imagePipelineArn" : @"imagePipelineArn",
             };
}

@end

@implementation AWSimagebuilderDeleteImagePipelineResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imagePipelineArn" : @"imagePipelineArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderDeleteImageRecipeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeArn" : @"imageRecipeArn",
             };
}

@end

@implementation AWSimagebuilderDeleteImageRecipeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeArn" : @"imageRecipeArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderDeleteImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             };
}

@end

@implementation AWSimagebuilderDeleteImageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderDeleteInfrastructureConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             };
}

@end

@implementation AWSimagebuilderDeleteInfrastructureConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderDistribution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amiDistributionConfiguration" : @"amiDistributionConfiguration",
             @"licenseConfigurationArns" : @"licenseConfigurationArns",
             @"region" : @"region",
             };
}

+ (NSValueTransformer *)amiDistributionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderAmiDistributionConfiguration class]];
}

@end

@implementation AWSimagebuilderDistributionConfiguration

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderDistribution class]];
}

@end

@implementation AWSimagebuilderDistributionConfigurationSummary

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

@implementation AWSimagebuilderEbsInstanceBlockDeviceSpecification

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
            return @(AWSimagebuilderEbsVolumeTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"io1"] == NSOrderedSame) {
            return @(AWSimagebuilderEbsVolumeTypeIO1);
        }
        if ([value caseInsensitiveCompare:@"gp2"] == NSOrderedSame) {
            return @(AWSimagebuilderEbsVolumeTypeGp2);
        }
        if ([value caseInsensitiveCompare:@"sc1"] == NSOrderedSame) {
            return @(AWSimagebuilderEbsVolumeTypeSc1);
        }
        if ([value caseInsensitiveCompare:@"st1"] == NSOrderedSame) {
            return @(AWSimagebuilderEbsVolumeTypeSt1);
        }
        return @(AWSimagebuilderEbsVolumeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderEbsVolumeTypeStandard:
                return @"standard";
            case AWSimagebuilderEbsVolumeTypeIO1:
                return @"io1";
            case AWSimagebuilderEbsVolumeTypeGp2:
                return @"gp2";
            case AWSimagebuilderEbsVolumeTypeSc1:
                return @"sc1";
            case AWSimagebuilderEbsVolumeTypeSt1:
                return @"st1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"values" : @"values",
             };
}

@end

@implementation AWSimagebuilderGetComponentPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentArn" : @"componentArn",
             };
}

@end

@implementation AWSimagebuilderGetComponentPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"policy",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderGetComponentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentBuildVersionArn" : @"componentBuildVersionArn",
             };
}

@end

@implementation AWSimagebuilderGetComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"component" : @"component",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)componentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderComponent class]];
}

@end

@implementation AWSimagebuilderGetDistributionConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             };
}

@end

@implementation AWSimagebuilderGetDistributionConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfiguration" : @"distributionConfiguration",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)distributionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderDistributionConfiguration class]];
}

@end

@implementation AWSimagebuilderGetImagePipelineRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imagePipelineArn" : @"imagePipelineArn",
             };
}

@end

@implementation AWSimagebuilderGetImagePipelineResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imagePipeline" : @"imagePipeline",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imagePipelineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderImagePipeline class]];
}

@end

@implementation AWSimagebuilderGetImagePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageArn" : @"imageArn",
             };
}

@end

@implementation AWSimagebuilderGetImagePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"policy",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderGetImageRecipePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeArn" : @"imageRecipeArn",
             };
}

@end

@implementation AWSimagebuilderGetImageRecipePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"policy",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderGetImageRecipeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeArn" : @"imageRecipeArn",
             };
}

@end

@implementation AWSimagebuilderGetImageRecipeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipe" : @"imageRecipe",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imageRecipeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderImageRecipe class]];
}

@end

@implementation AWSimagebuilderGetImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             };
}

@end

@implementation AWSimagebuilderGetImageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"image" : @"image",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderImage class]];
}

@end

@implementation AWSimagebuilderGetInfrastructureConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             };
}

@end

@implementation AWSimagebuilderGetInfrastructureConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"infrastructureConfiguration" : @"infrastructureConfiguration",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)infrastructureConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderInfrastructureConfiguration class]];
}

@end

@implementation AWSimagebuilderImage

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderDistributionConfiguration class]];
}

+ (NSValueTransformer *)imageRecipeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderImageRecipe class]];
}

+ (NSValueTransformer *)imageTestsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderImageTestsConfiguration class]];
}

+ (NSValueTransformer *)infrastructureConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderInfrastructureConfiguration class]];
}

+ (NSValueTransformer *)outputResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderOutputResources class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformLinux);
        }
        return @(AWSimagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPlatformWindows:
                return @"Windows";
            case AWSimagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderImageState class]];
}

@end

@implementation AWSimagebuilderImagePipeline

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderImageTestsConfiguration class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformLinux);
        }
        return @(AWSimagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPlatformWindows:
                return @"Windows";
            case AWSimagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderSchedule class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSimagebuilderPipelineStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSimagebuilderPipelineStatusEnabled);
        }
        return @(AWSimagebuilderPipelineStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPipelineStatusDisabled:
                return @"DISABLED";
            case AWSimagebuilderPipelineStatusEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderImageRecipe

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderInstanceBlockDeviceMapping class]];
}

+ (NSValueTransformer *)componentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderComponentConfiguration class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformLinux);
        }
        return @(AWSimagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPlatformWindows:
                return @"Windows";
            case AWSimagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderImageRecipeSummary

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
            return @(AWSimagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformLinux);
        }
        return @(AWSimagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPlatformWindows:
                return @"Windows";
            case AWSimagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderImageState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reason" : @"reason",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSimagebuilderImageStatusPending);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSimagebuilderImageStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"BUILDING"] == NSOrderedSame) {
            return @(AWSimagebuilderImageStatusBuilding);
        }
        if ([value caseInsensitiveCompare:@"TESTING"] == NSOrderedSame) {
            return @(AWSimagebuilderImageStatusTesting);
        }
        if ([value caseInsensitiveCompare:@"DISTRIBUTING"] == NSOrderedSame) {
            return @(AWSimagebuilderImageStatusDistributing);
        }
        if ([value caseInsensitiveCompare:@"INTEGRATING"] == NSOrderedSame) {
            return @(AWSimagebuilderImageStatusIntegrating);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSimagebuilderImageStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSimagebuilderImageStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSimagebuilderImageStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSimagebuilderImageStatusDeprecated);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSimagebuilderImageStatusDeleted);
        }
        return @(AWSimagebuilderImageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderImageStatusPending:
                return @"PENDING";
            case AWSimagebuilderImageStatusCreating:
                return @"CREATING";
            case AWSimagebuilderImageStatusBuilding:
                return @"BUILDING";
            case AWSimagebuilderImageStatusTesting:
                return @"TESTING";
            case AWSimagebuilderImageStatusDistributing:
                return @"DISTRIBUTING";
            case AWSimagebuilderImageStatusIntegrating:
                return @"INTEGRATING";
            case AWSimagebuilderImageStatusAvailable:
                return @"AVAILABLE";
            case AWSimagebuilderImageStatusCancelled:
                return @"CANCELLED";
            case AWSimagebuilderImageStatusFailed:
                return @"FAILED";
            case AWSimagebuilderImageStatusDeprecated:
                return @"DEPRECATED";
            case AWSimagebuilderImageStatusDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderImageSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderOutputResources class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformLinux);
        }
        return @(AWSimagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPlatformWindows:
                return @"Windows";
            case AWSimagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderImageState class]];
}

@end

@implementation AWSimagebuilderImageTestsConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageTestsEnabled" : @"imageTestsEnabled",
             @"timeoutMinutes" : @"timeoutMinutes",
             };
}

@end

@implementation AWSimagebuilderImageVersion

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
            return @(AWSimagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformLinux);
        }
        return @(AWSimagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPlatformWindows:
                return @"Windows";
            case AWSimagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderImportComponentRequest

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
            return @(AWSimagebuilderComponentFormatShell);
        }
        return @(AWSimagebuilderComponentFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderComponentFormatShell:
                return @"SHELL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformWindows);
        }
        if ([value caseInsensitiveCompare:@"Linux"] == NSOrderedSame) {
            return @(AWSimagebuilderPlatformLinux);
        }
        return @(AWSimagebuilderPlatformUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPlatformWindows:
                return @"Windows";
            case AWSimagebuilderPlatformLinux:
                return @"Linux";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BUILD"] == NSOrderedSame) {
            return @(AWSimagebuilderComponentTypeBuild);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSimagebuilderComponentTypeTest);
        }
        return @(AWSimagebuilderComponentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderComponentTypeBuild:
                return @"BUILD";
            case AWSimagebuilderComponentTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderImportComponentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"componentBuildVersionArn" : @"componentBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderInfrastructureConfiguration

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderLogging class]];
}

@end

@implementation AWSimagebuilderInfrastructureConfigurationSummary

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

@implementation AWSimagebuilderInstanceBlockDeviceMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceName" : @"deviceName",
             @"ebs" : @"ebs",
             @"noDevice" : @"noDevice",
             @"virtualName" : @"virtualName",
             };
}

+ (NSValueTransformer *)ebsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderEbsInstanceBlockDeviceSpecification class]];
}

@end

@implementation AWSimagebuilderLaunchPermissionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userGroups" : @"userGroups",
             @"userIds" : @"userIds",
             };
}

@end

@implementation AWSimagebuilderListComponentBuildVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentVersionArn" : @"componentVersionArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSimagebuilderListComponentBuildVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentSummaryList" : @"componentSummaryList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)componentSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderComponentSummary class]];
}

@end

@implementation AWSimagebuilderListComponentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"owner" : @"owner",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderFilter class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Self"] == NSOrderedSame) {
            return @(AWSimagebuilderOwnershipSelf);
        }
        if ([value caseInsensitiveCompare:@"Shared"] == NSOrderedSame) {
            return @(AWSimagebuilderOwnershipShared);
        }
        if ([value caseInsensitiveCompare:@"Amazon"] == NSOrderedSame) {
            return @(AWSimagebuilderOwnershipAmazon);
        }
        return @(AWSimagebuilderOwnershipUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderOwnershipSelf:
                return @"Self";
            case AWSimagebuilderOwnershipShared:
                return @"Shared";
            case AWSimagebuilderOwnershipAmazon:
                return @"Amazon";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderListComponentsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentVersionList" : @"componentVersionList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)componentVersionListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderComponentVersion class]];
}

@end

@implementation AWSimagebuilderListDistributionConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderFilter class]];
}

@end

@implementation AWSimagebuilderListDistributionConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfigurationSummaryList" : @"distributionConfigurationSummaryList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)distributionConfigurationSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderDistributionConfigurationSummary class]];
}

@end

@implementation AWSimagebuilderListImageBuildVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"imageVersionArn" : @"imageVersionArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderFilter class]];
}

@end

@implementation AWSimagebuilderListImageBuildVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageSummaryList" : @"imageSummaryList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imageSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderImageSummary class]];
}

@end

@implementation AWSimagebuilderListImagePipelineImagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"imagePipelineArn" : @"imagePipelineArn",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderFilter class]];
}

@end

@implementation AWSimagebuilderListImagePipelineImagesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageSummaryList" : @"imageSummaryList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imageSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderImageSummary class]];
}

@end

@implementation AWSimagebuilderListImagePipelinesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderFilter class]];
}

@end

@implementation AWSimagebuilderListImagePipelinesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imagePipelineList" : @"imagePipelineList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imagePipelineListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderImagePipeline class]];
}

@end

@implementation AWSimagebuilderListImageRecipesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"owner" : @"owner",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderFilter class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Self"] == NSOrderedSame) {
            return @(AWSimagebuilderOwnershipSelf);
        }
        if ([value caseInsensitiveCompare:@"Shared"] == NSOrderedSame) {
            return @(AWSimagebuilderOwnershipShared);
        }
        if ([value caseInsensitiveCompare:@"Amazon"] == NSOrderedSame) {
            return @(AWSimagebuilderOwnershipAmazon);
        }
        return @(AWSimagebuilderOwnershipUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderOwnershipSelf:
                return @"Self";
            case AWSimagebuilderOwnershipShared:
                return @"Shared";
            case AWSimagebuilderOwnershipAmazon:
                return @"Amazon";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderListImageRecipesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeSummaryList" : @"imageRecipeSummaryList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imageRecipeSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderImageRecipeSummary class]];
}

@end

@implementation AWSimagebuilderListImagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"owner" : @"owner",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderFilter class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Self"] == NSOrderedSame) {
            return @(AWSimagebuilderOwnershipSelf);
        }
        if ([value caseInsensitiveCompare:@"Shared"] == NSOrderedSame) {
            return @(AWSimagebuilderOwnershipShared);
        }
        if ([value caseInsensitiveCompare:@"Amazon"] == NSOrderedSame) {
            return @(AWSimagebuilderOwnershipAmazon);
        }
        return @(AWSimagebuilderOwnershipUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderOwnershipSelf:
                return @"Self";
            case AWSimagebuilderOwnershipShared:
                return @"Shared";
            case AWSimagebuilderOwnershipAmazon:
                return @"Amazon";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderListImagesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageVersionList" : @"imageVersionList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)imageVersionListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderImageVersion class]];
}

@end

@implementation AWSimagebuilderListInfrastructureConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderFilter class]];
}

@end

@implementation AWSimagebuilderListInfrastructureConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"infrastructureConfigurationSummaryList" : @"infrastructureConfigurationSummaryList",
             @"nextToken" : @"nextToken",
             @"requestId" : @"requestId",
             };
}

+ (NSValueTransformer *)infrastructureConfigurationSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderInfrastructureConfigurationSummary class]];
}

@end

@implementation AWSimagebuilderListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSimagebuilderListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSimagebuilderLogging

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Logs" : @"s3Logs",
             };
}

+ (NSValueTransformer *)s3LogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderS3Logs class]];
}

@end

@implementation AWSimagebuilderOutputResources

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amis" : @"amis",
             };
}

+ (NSValueTransformer *)amisJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderAmi class]];
}

@end

@implementation AWSimagebuilderPutComponentPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentArn" : @"componentArn",
             @"policy" : @"policy",
             };
}

@end

@implementation AWSimagebuilderPutComponentPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"componentArn" : @"componentArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderPutImagePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageArn" : @"imageArn",
             @"policy" : @"policy",
             };
}

@end

@implementation AWSimagebuilderPutImagePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageArn" : @"imageArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderPutImageRecipePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeArn" : @"imageRecipeArn",
             @"policy" : @"policy",
             };
}

@end

@implementation AWSimagebuilderPutImageRecipePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageRecipeArn" : @"imageRecipeArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderS3Logs

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3BucketName" : @"s3BucketName",
             @"s3KeyPrefix" : @"s3KeyPrefix",
             };
}

@end

@implementation AWSimagebuilderSchedule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pipelineExecutionStartCondition" : @"pipelineExecutionStartCondition",
             @"scheduleExpression" : @"scheduleExpression",
             };
}

+ (NSValueTransformer *)pipelineExecutionStartConditionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXPRESSION_MATCH_ONLY"] == NSOrderedSame) {
            return @(AWSimagebuilderPipelineExecutionStartConditionExpressionMatchOnly);
        }
        if ([value caseInsensitiveCompare:@"EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE"] == NSOrderedSame) {
            return @(AWSimagebuilderPipelineExecutionStartConditionExpressionMatchAndDependencyUpdatesAvailable);
        }
        return @(AWSimagebuilderPipelineExecutionStartConditionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPipelineExecutionStartConditionExpressionMatchOnly:
                return @"EXPRESSION_MATCH_ONLY";
            case AWSimagebuilderPipelineExecutionStartConditionExpressionMatchAndDependencyUpdatesAvailable:
                return @"EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderStartImagePipelineExecutionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imagePipelineArn" : @"imagePipelineArn",
             };
}

@end

@implementation AWSimagebuilderStartImagePipelineExecutionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imageBuildVersionArn" : @"imageBuildVersionArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSimagebuilderTagResourceResponse

@end

@implementation AWSimagebuilderUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSimagebuilderUntagResourceResponse

@end

@implementation AWSimagebuilderUpdateDistributionConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"detail" : @"description",
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             @"distributions" : @"distributions",
             };
}

+ (NSValueTransformer *)distributionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSimagebuilderDistribution class]];
}

@end

@implementation AWSimagebuilderUpdateDistributionConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"distributionConfigurationArn" : @"distributionConfigurationArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderUpdateImagePipelineRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderImageTestsConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderSchedule class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSimagebuilderPipelineStatusDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSimagebuilderPipelineStatusEnabled);
        }
        return @(AWSimagebuilderPipelineStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSimagebuilderPipelineStatusDisabled:
                return @"DISABLED";
            case AWSimagebuilderPipelineStatusEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSimagebuilderUpdateImagePipelineResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"imagePipelineArn" : @"imagePipelineArn",
             @"requestId" : @"requestId",
             };
}

@end

@implementation AWSimagebuilderUpdateInfrastructureConfigurationRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSimagebuilderLogging class]];
}

@end

@implementation AWSimagebuilderUpdateInfrastructureConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"clientToken",
             @"infrastructureConfigurationArn" : @"infrastructureConfigurationArn",
             @"requestId" : @"requestId",
             };
}

@end
