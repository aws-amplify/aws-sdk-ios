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

#import "AWSmediapackage-vodModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSmediapackage-vodErrorDomain = @"com.amazonaws.AWSmediapackage-vodErrorDomain";

@implementation AWSmediapackage-vodAsset

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdAt" : @"CreatedAt",
             @"egressEndpoints" : @"EgressEndpoints",
             @"identifier" : @"Id",
             @"packagingGroupId" : @"PackagingGroupId",
             @"resourceId" : @"ResourceId",
             @"sourceArn" : @"SourceArn",
             @"sourceRoleArn" : @"SourceRoleArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediapackage-vodEgressEndpoint class]];
}

@end

@implementation AWSmediapackage-vodAssetCreateParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"packagingGroupId" : @"PackagingGroupId",
             @"resourceId" : @"ResourceId",
             @"sourceArn" : @"SourceArn",
             @"sourceRoleArn" : @"SourceRoleArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmediapackage-vodAssetList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assets" : @"Assets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)assetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediapackage-vodAssetShallow class]];
}

@end

@implementation AWSmediapackage-vodAssetShallow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdAt" : @"CreatedAt",
             @"identifier" : @"Id",
             @"packagingGroupId" : @"PackagingGroupId",
             @"resourceId" : @"ResourceId",
             @"sourceArn" : @"SourceArn",
             @"sourceRoleArn" : @"SourceRoleArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmediapackage-vodCmafEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spekeKeyProvider" : @"SpekeKeyProvider",
             };
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodSpekeKeyProvider class]];
}

@end

@implementation AWSmediapackage-vodCmafPackage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryption" : @"Encryption",
             @"hlsManifests" : @"HlsManifests",
             @"segmentDurationSeconds" : @"SegmentDurationSeconds",
             };
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodCmafEncryption class]];
}

+ (NSValueTransformer *)hlsManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediapackage-vodHlsManifest class]];
}

@end

@implementation AWSmediapackage-vodCreateAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"packagingGroupId" : @"PackagingGroupId",
             @"resourceId" : @"ResourceId",
             @"sourceArn" : @"SourceArn",
             @"sourceRoleArn" : @"SourceRoleArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmediapackage-vodCreateAssetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdAt" : @"CreatedAt",
             @"egressEndpoints" : @"EgressEndpoints",
             @"identifier" : @"Id",
             @"packagingGroupId" : @"PackagingGroupId",
             @"resourceId" : @"ResourceId",
             @"sourceArn" : @"SourceArn",
             @"sourceRoleArn" : @"SourceRoleArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediapackage-vodEgressEndpoint class]];
}

@end

@implementation AWSmediapackage-vodCreatePackagingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cmafPackage" : @"CmafPackage",
             @"dashPackage" : @"DashPackage",
             @"hlsPackage" : @"HlsPackage",
             @"identifier" : @"Id",
             @"mssPackage" : @"MssPackage",
             @"packagingGroupId" : @"PackagingGroupId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)cmafPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodCmafPackage class]];
}

+ (NSValueTransformer *)dashPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodDashPackage class]];
}

+ (NSValueTransformer *)hlsPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodHlsPackage class]];
}

+ (NSValueTransformer *)mssPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodMssPackage class]];
}

@end

@implementation AWSmediapackage-vodCreatePackagingConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"cmafPackage" : @"CmafPackage",
             @"dashPackage" : @"DashPackage",
             @"hlsPackage" : @"HlsPackage",
             @"identifier" : @"Id",
             @"mssPackage" : @"MssPackage",
             @"packagingGroupId" : @"PackagingGroupId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)cmafPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodCmafPackage class]];
}

+ (NSValueTransformer *)dashPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodDashPackage class]];
}

+ (NSValueTransformer *)hlsPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodHlsPackage class]];
}

+ (NSValueTransformer *)mssPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodMssPackage class]];
}

@end

@implementation AWSmediapackage-vodCreatePackagingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmediapackage-vodCreatePackagingGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"domainName" : @"DomainName",
             @"identifier" : @"Id",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmediapackage-vodDashEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spekeKeyProvider" : @"SpekeKeyProvider",
             };
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodSpekeKeyProvider class]];
}

@end

@implementation AWSmediapackage-vodDashManifest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestLayout" : @"ManifestLayout",
             @"manifestName" : @"ManifestName",
             @"minBufferTimeSeconds" : @"MinBufferTimeSeconds",
             @"profile" : @"Profile",
             @"streamSelection" : @"StreamSelection",
             };
}

+ (NSValueTransformer *)manifestLayoutJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL"] == NSOrderedSame) {
            return @(AWSmediapackage-vodManifestLayoutFull);
        }
        if ([value caseInsensitiveCompare:@"COMPACT"] == NSOrderedSame) {
            return @(AWSmediapackage-vodManifestLayoutCompact);
        }
        return @(AWSmediapackage-vodManifestLayoutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediapackage-vodManifestLayoutFull:
                return @"FULL";
            case AWSmediapackage-vodManifestLayoutCompact:
                return @"COMPACT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediapackage-vodProfileNone);
        }
        if ([value caseInsensitiveCompare:@"HBBTV_1_5"] == NSOrderedSame) {
            return @(AWSmediapackage-vodProfileHbbtv15);
        }
        return @(AWSmediapackage-vodProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediapackage-vodProfileNone:
                return @"NONE";
            case AWSmediapackage-vodProfileHbbtv15:
                return @"HBBTV_1_5";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)streamSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodStreamSelection class]];
}

@end

@implementation AWSmediapackage-vodDashPackage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dashManifests" : @"DashManifests",
             @"encryption" : @"Encryption",
             @"periodTriggers" : @"PeriodTriggers",
             @"segmentDurationSeconds" : @"SegmentDurationSeconds",
             @"segmentTemplateFormat" : @"SegmentTemplateFormat",
             };
}

+ (NSValueTransformer *)dashManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediapackage-vodDashManifest class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodDashEncryption class]];
}

+ (NSValueTransformer *)segmentTemplateFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NUMBER_WITH_TIMELINE"] == NSOrderedSame) {
            return @(AWSmediapackage-vodSegmentTemplateFormatNumberWithTimeline);
        }
        if ([value caseInsensitiveCompare:@"TIME_WITH_TIMELINE"] == NSOrderedSame) {
            return @(AWSmediapackage-vodSegmentTemplateFormatTimeWithTimeline);
        }
        if ([value caseInsensitiveCompare:@"NUMBER_WITH_DURATION"] == NSOrderedSame) {
            return @(AWSmediapackage-vodSegmentTemplateFormatNumberWithDuration);
        }
        return @(AWSmediapackage-vodSegmentTemplateFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediapackage-vodSegmentTemplateFormatNumberWithTimeline:
                return @"NUMBER_WITH_TIMELINE";
            case AWSmediapackage-vodSegmentTemplateFormatTimeWithTimeline:
                return @"TIME_WITH_TIMELINE";
            case AWSmediapackage-vodSegmentTemplateFormatNumberWithDuration:
                return @"NUMBER_WITH_DURATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediapackage-vodDeleteAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSmediapackage-vodDeleteAssetResponse

@end

@implementation AWSmediapackage-vodDeletePackagingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSmediapackage-vodDeletePackagingConfigurationResponse

@end

@implementation AWSmediapackage-vodDeletePackagingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSmediapackage-vodDeletePackagingGroupResponse

@end

@implementation AWSmediapackage-vodDescribeAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSmediapackage-vodDescribeAssetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdAt" : @"CreatedAt",
             @"egressEndpoints" : @"EgressEndpoints",
             @"identifier" : @"Id",
             @"packagingGroupId" : @"PackagingGroupId",
             @"resourceId" : @"ResourceId",
             @"sourceArn" : @"SourceArn",
             @"sourceRoleArn" : @"SourceRoleArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediapackage-vodEgressEndpoint class]];
}

@end

@implementation AWSmediapackage-vodDescribePackagingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSmediapackage-vodDescribePackagingConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"cmafPackage" : @"CmafPackage",
             @"dashPackage" : @"DashPackage",
             @"hlsPackage" : @"HlsPackage",
             @"identifier" : @"Id",
             @"mssPackage" : @"MssPackage",
             @"packagingGroupId" : @"PackagingGroupId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)cmafPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodCmafPackage class]];
}

+ (NSValueTransformer *)dashPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodDashPackage class]];
}

+ (NSValueTransformer *)hlsPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodHlsPackage class]];
}

+ (NSValueTransformer *)mssPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodMssPackage class]];
}

@end

@implementation AWSmediapackage-vodDescribePackagingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSmediapackage-vodDescribePackagingGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"domainName" : @"DomainName",
             @"identifier" : @"Id",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmediapackage-vodEgressEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"packagingConfigurationId" : @"PackagingConfigurationId",
             @"url" : @"Url",
             };
}

@end

@implementation AWSmediapackage-vodHlsEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constantInitializationVector" : @"ConstantInitializationVector",
             @"encryptionMethod" : @"EncryptionMethod",
             @"spekeKeyProvider" : @"SpekeKeyProvider",
             };
}

+ (NSValueTransformer *)encryptionMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES_128"] == NSOrderedSame) {
            return @(AWSmediapackage-vodEncryptionMethodAes128);
        }
        if ([value caseInsensitiveCompare:@"SAMPLE_AES"] == NSOrderedSame) {
            return @(AWSmediapackage-vodEncryptionMethodSampleAes);
        }
        return @(AWSmediapackage-vodEncryptionMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediapackage-vodEncryptionMethodAes128:
                return @"AES_128";
            case AWSmediapackage-vodEncryptionMethodSampleAes:
                return @"SAMPLE_AES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodSpekeKeyProvider class]];
}

@end

@implementation AWSmediapackage-vodHlsManifest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adMarkers" : @"AdMarkers",
             @"includeIframeOnlyStream" : @"IncludeIframeOnlyStream",
             @"manifestName" : @"ManifestName",
             @"programDateTimeIntervalSeconds" : @"ProgramDateTimeIntervalSeconds",
             @"repeatExtXKey" : @"RepeatExtXKey",
             @"streamSelection" : @"StreamSelection",
             };
}

+ (NSValueTransformer *)adMarkersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediapackage-vodAdMarkersNone);
        }
        if ([value caseInsensitiveCompare:@"SCTE35_ENHANCED"] == NSOrderedSame) {
            return @(AWSmediapackage-vodAdMarkersScte35Enhanced);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmediapackage-vodAdMarkersPassthrough);
        }
        return @(AWSmediapackage-vodAdMarkersUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediapackage-vodAdMarkersNone:
                return @"NONE";
            case AWSmediapackage-vodAdMarkersScte35Enhanced:
                return @"SCTE35_ENHANCED";
            case AWSmediapackage-vodAdMarkersPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)streamSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodStreamSelection class]];
}

@end

@implementation AWSmediapackage-vodHlsPackage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryption" : @"Encryption",
             @"hlsManifests" : @"HlsManifests",
             @"segmentDurationSeconds" : @"SegmentDurationSeconds",
             @"useAudioRenditionGroup" : @"UseAudioRenditionGroup",
             };
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodHlsEncryption class]];
}

+ (NSValueTransformer *)hlsManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediapackage-vodHlsManifest class]];
}

@end

@implementation AWSmediapackage-vodListAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"packagingGroupId" : @"PackagingGroupId",
             };
}

@end

@implementation AWSmediapackage-vodListAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assets" : @"Assets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)assetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediapackage-vodAssetShallow class]];
}

@end

@implementation AWSmediapackage-vodListPackagingConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"packagingGroupId" : @"PackagingGroupId",
             };
}

@end

@implementation AWSmediapackage-vodListPackagingConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"packagingConfigurations" : @"PackagingConfigurations",
             };
}

+ (NSValueTransformer *)packagingConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediapackage-vodPackagingConfiguration class]];
}

@end

@implementation AWSmediapackage-vodListPackagingGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSmediapackage-vodListPackagingGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"packagingGroups" : @"PackagingGroups",
             };
}

+ (NSValueTransformer *)packagingGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediapackage-vodPackagingGroup class]];
}

@end

@implementation AWSmediapackage-vodListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSmediapackage-vodListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmediapackage-vodMssEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spekeKeyProvider" : @"SpekeKeyProvider",
             };
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodSpekeKeyProvider class]];
}

@end

@implementation AWSmediapackage-vodMssManifest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestName" : @"ManifestName",
             @"streamSelection" : @"StreamSelection",
             };
}

+ (NSValueTransformer *)streamSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodStreamSelection class]];
}

@end

@implementation AWSmediapackage-vodMssPackage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryption" : @"Encryption",
             @"mssManifests" : @"MssManifests",
             @"segmentDurationSeconds" : @"SegmentDurationSeconds",
             };
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodMssEncryption class]];
}

+ (NSValueTransformer *)mssManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediapackage-vodMssManifest class]];
}

@end

@implementation AWSmediapackage-vodPackagingConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"cmafPackage" : @"CmafPackage",
             @"dashPackage" : @"DashPackage",
             @"hlsPackage" : @"HlsPackage",
             @"identifier" : @"Id",
             @"mssPackage" : @"MssPackage",
             @"packagingGroupId" : @"PackagingGroupId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)cmafPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodCmafPackage class]];
}

+ (NSValueTransformer *)dashPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodDashPackage class]];
}

+ (NSValueTransformer *)hlsPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodHlsPackage class]];
}

+ (NSValueTransformer *)mssPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodMssPackage class]];
}

@end

@implementation AWSmediapackage-vodPackagingConfigurationCreateParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cmafPackage" : @"CmafPackage",
             @"dashPackage" : @"DashPackage",
             @"hlsPackage" : @"HlsPackage",
             @"identifier" : @"Id",
             @"mssPackage" : @"MssPackage",
             @"packagingGroupId" : @"PackagingGroupId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)cmafPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodCmafPackage class]];
}

+ (NSValueTransformer *)dashPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodDashPackage class]];
}

+ (NSValueTransformer *)hlsPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodHlsPackage class]];
}

+ (NSValueTransformer *)mssPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediapackage-vodMssPackage class]];
}

@end

@implementation AWSmediapackage-vodPackagingConfigurationList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"packagingConfigurations" : @"PackagingConfigurations",
             };
}

+ (NSValueTransformer *)packagingConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediapackage-vodPackagingConfiguration class]];
}

@end

@implementation AWSmediapackage-vodPackagingGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"domainName" : @"DomainName",
             @"identifier" : @"Id",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmediapackage-vodPackagingGroupCreateParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmediapackage-vodPackagingGroupList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"packagingGroups" : @"PackagingGroups",
             };
}

+ (NSValueTransformer *)packagingGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediapackage-vodPackagingGroup class]];
}

@end

@implementation AWSmediapackage-vodSpekeKeyProvider

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"systemIds" : @"SystemIds",
             @"url" : @"Url",
             };
}

@end

@implementation AWSmediapackage-vodStreamSelection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxVideoBitsPerSecond" : @"MaxVideoBitsPerSecond",
             @"minVideoBitsPerSecond" : @"MinVideoBitsPerSecond",
             @"streamOrder" : @"StreamOrder",
             };
}

+ (NSValueTransformer *)streamOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ORIGINAL"] == NSOrderedSame) {
            return @(AWSmediapackage-vodStreamOrderOriginal);
        }
        if ([value caseInsensitiveCompare:@"VIDEO_BITRATE_ASCENDING"] == NSOrderedSame) {
            return @(AWSmediapackage-vodStreamOrderVideoBitrateAscending);
        }
        if ([value caseInsensitiveCompare:@"VIDEO_BITRATE_DESCENDING"] == NSOrderedSame) {
            return @(AWSmediapackage-vodStreamOrderVideoBitrateDescending);
        }
        return @(AWSmediapackage-vodStreamOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediapackage-vodStreamOrderOriginal:
                return @"ORIGINAL";
            case AWSmediapackage-vodStreamOrderVideoBitrateAscending:
                return @"VIDEO_BITRATE_ASCENDING";
            case AWSmediapackage-vodStreamOrderVideoBitrateDescending:
                return @"VIDEO_BITRATE_DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediapackage-vodTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmediapackage-vodTagsModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmediapackage-vodUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end
