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

#import "AWSMediapackagevodModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSMediapackagevodErrorDomain = @"com.amazonaws.AWSMediapackagevodErrorDomain";

@implementation AWSMediapackagevodAsset

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediapackagevodEgressEndpoint class]];
}

@end

@implementation AWSMediapackagevodAssetCreateParameters

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

@implementation AWSMediapackagevodAssetList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assets" : @"Assets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)assetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediapackagevodAssetShallow class]];
}

@end

@implementation AWSMediapackagevodAssetShallow

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

@implementation AWSMediapackagevodAuthorization

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cdnIdentifierSecret" : @"CdnIdentifierSecret",
             @"secretsRoleArn" : @"SecretsRoleArn",
             };
}

@end

@implementation AWSMediapackagevodCmafEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spekeKeyProvider" : @"SpekeKeyProvider",
             };
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodSpekeKeyProvider class]];
}

@end

@implementation AWSMediapackagevodCmafPackage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryption" : @"Encryption",
             @"hlsManifests" : @"HlsManifests",
             @"segmentDurationSeconds" : @"SegmentDurationSeconds",
             };
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodCmafEncryption class]];
}

+ (NSValueTransformer *)hlsManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediapackagevodHlsManifest class]];
}

@end

@implementation AWSMediapackagevodCreateAssetRequest

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

@implementation AWSMediapackagevodCreateAssetResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediapackagevodEgressEndpoint class]];
}

@end

@implementation AWSMediapackagevodCreatePackagingConfigurationRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodCmafPackage class]];
}

+ (NSValueTransformer *)dashPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodDashPackage class]];
}

+ (NSValueTransformer *)hlsPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodHlsPackage class]];
}

+ (NSValueTransformer *)mssPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodMssPackage class]];
}

@end

@implementation AWSMediapackagevodCreatePackagingConfigurationResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodCmafPackage class]];
}

+ (NSValueTransformer *)dashPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodDashPackage class]];
}

+ (NSValueTransformer *)hlsPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodHlsPackage class]];
}

+ (NSValueTransformer *)mssPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodMssPackage class]];
}

@end

@implementation AWSMediapackagevodCreatePackagingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorization" : @"Authorization",
             @"identifier" : @"Id",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)authorizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodAuthorization class]];
}

@end

@implementation AWSMediapackagevodCreatePackagingGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"authorization" : @"Authorization",
             @"domainName" : @"DomainName",
             @"identifier" : @"Id",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)authorizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodAuthorization class]];
}

@end

@implementation AWSMediapackagevodDashEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spekeKeyProvider" : @"SpekeKeyProvider",
             };
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodSpekeKeyProvider class]];
}

@end

@implementation AWSMediapackagevodDashManifest

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
            return @(AWSMediapackagevodManifestLayoutFull);
        }
        if ([value caseInsensitiveCompare:@"COMPACT"] == NSOrderedSame) {
            return @(AWSMediapackagevodManifestLayoutCompact);
        }
        return @(AWSMediapackagevodManifestLayoutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediapackagevodManifestLayoutFull:
                return @"FULL";
            case AWSMediapackagevodManifestLayoutCompact:
                return @"COMPACT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediapackagevodProfileNone);
        }
        if ([value caseInsensitiveCompare:@"HBBTV_1_5"] == NSOrderedSame) {
            return @(AWSMediapackagevodProfileHbbtv15);
        }
        return @(AWSMediapackagevodProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediapackagevodProfileNone:
                return @"NONE";
            case AWSMediapackagevodProfileHbbtv15:
                return @"HBBTV_1_5";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)streamSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodStreamSelection class]];
}

@end

@implementation AWSMediapackagevodDashPackage

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediapackagevodDashManifest class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodDashEncryption class]];
}

+ (NSValueTransformer *)segmentTemplateFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NUMBER_WITH_TIMELINE"] == NSOrderedSame) {
            return @(AWSMediapackagevodSegmentTemplateFormatNumberWithTimeline);
        }
        if ([value caseInsensitiveCompare:@"TIME_WITH_TIMELINE"] == NSOrderedSame) {
            return @(AWSMediapackagevodSegmentTemplateFormatTimeWithTimeline);
        }
        if ([value caseInsensitiveCompare:@"NUMBER_WITH_DURATION"] == NSOrderedSame) {
            return @(AWSMediapackagevodSegmentTemplateFormatNumberWithDuration);
        }
        return @(AWSMediapackagevodSegmentTemplateFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediapackagevodSegmentTemplateFormatNumberWithTimeline:
                return @"NUMBER_WITH_TIMELINE";
            case AWSMediapackagevodSegmentTemplateFormatTimeWithTimeline:
                return @"TIME_WITH_TIMELINE";
            case AWSMediapackagevodSegmentTemplateFormatNumberWithDuration:
                return @"NUMBER_WITH_DURATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediapackagevodDeleteAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSMediapackagevodDeleteAssetResponse

@end

@implementation AWSMediapackagevodDeletePackagingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSMediapackagevodDeletePackagingConfigurationResponse

@end

@implementation AWSMediapackagevodDeletePackagingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSMediapackagevodDeletePackagingGroupResponse

@end

@implementation AWSMediapackagevodDescribeAssetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSMediapackagevodDescribeAssetResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediapackagevodEgressEndpoint class]];
}

@end

@implementation AWSMediapackagevodDescribePackagingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSMediapackagevodDescribePackagingConfigurationResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodCmafPackage class]];
}

+ (NSValueTransformer *)dashPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodDashPackage class]];
}

+ (NSValueTransformer *)hlsPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodHlsPackage class]];
}

+ (NSValueTransformer *)mssPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodMssPackage class]];
}

@end

@implementation AWSMediapackagevodDescribePackagingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSMediapackagevodDescribePackagingGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"authorization" : @"Authorization",
             @"domainName" : @"DomainName",
             @"identifier" : @"Id",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)authorizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodAuthorization class]];
}

@end

@implementation AWSMediapackagevodEgressEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"packagingConfigurationId" : @"PackagingConfigurationId",
             @"url" : @"Url",
             };
}

@end

@implementation AWSMediapackagevodHlsEncryption

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
            return @(AWSMediapackagevodEncryptionMethodAes128);
        }
        if ([value caseInsensitiveCompare:@"SAMPLE_AES"] == NSOrderedSame) {
            return @(AWSMediapackagevodEncryptionMethodSampleAes);
        }
        return @(AWSMediapackagevodEncryptionMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediapackagevodEncryptionMethodAes128:
                return @"AES_128";
            case AWSMediapackagevodEncryptionMethodSampleAes:
                return @"SAMPLE_AES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodSpekeKeyProvider class]];
}

@end

@implementation AWSMediapackagevodHlsManifest

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
            return @(AWSMediapackagevodAdMarkersNone);
        }
        if ([value caseInsensitiveCompare:@"SCTE35_ENHANCED"] == NSOrderedSame) {
            return @(AWSMediapackagevodAdMarkersScte35Enhanced);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMediapackagevodAdMarkersPassthrough);
        }
        return @(AWSMediapackagevodAdMarkersUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediapackagevodAdMarkersNone:
                return @"NONE";
            case AWSMediapackagevodAdMarkersScte35Enhanced:
                return @"SCTE35_ENHANCED";
            case AWSMediapackagevodAdMarkersPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)streamSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodStreamSelection class]];
}

@end

@implementation AWSMediapackagevodHlsPackage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryption" : @"Encryption",
             @"hlsManifests" : @"HlsManifests",
             @"segmentDurationSeconds" : @"SegmentDurationSeconds",
             @"useAudioRenditionGroup" : @"UseAudioRenditionGroup",
             };
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodHlsEncryption class]];
}

+ (NSValueTransformer *)hlsManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediapackagevodHlsManifest class]];
}

@end

@implementation AWSMediapackagevodListAssetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"packagingGroupId" : @"PackagingGroupId",
             };
}

@end

@implementation AWSMediapackagevodListAssetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"assets" : @"Assets",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)assetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediapackagevodAssetShallow class]];
}

@end

@implementation AWSMediapackagevodListPackagingConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"packagingGroupId" : @"PackagingGroupId",
             };
}

@end

@implementation AWSMediapackagevodListPackagingConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"packagingConfigurations" : @"PackagingConfigurations",
             };
}

+ (NSValueTransformer *)packagingConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediapackagevodPackagingConfiguration class]];
}

@end

@implementation AWSMediapackagevodListPackagingGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSMediapackagevodListPackagingGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"packagingGroups" : @"PackagingGroups",
             };
}

+ (NSValueTransformer *)packagingGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediapackagevodPackagingGroup class]];
}

@end

@implementation AWSMediapackagevodListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSMediapackagevodListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSMediapackagevodMssEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spekeKeyProvider" : @"SpekeKeyProvider",
             };
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodSpekeKeyProvider class]];
}

@end

@implementation AWSMediapackagevodMssManifest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestName" : @"ManifestName",
             @"streamSelection" : @"StreamSelection",
             };
}

+ (NSValueTransformer *)streamSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodStreamSelection class]];
}

@end

@implementation AWSMediapackagevodMssPackage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryption" : @"Encryption",
             @"mssManifests" : @"MssManifests",
             @"segmentDurationSeconds" : @"SegmentDurationSeconds",
             };
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodMssEncryption class]];
}

+ (NSValueTransformer *)mssManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediapackagevodMssManifest class]];
}

@end

@implementation AWSMediapackagevodPackagingConfiguration

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodCmafPackage class]];
}

+ (NSValueTransformer *)dashPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodDashPackage class]];
}

+ (NSValueTransformer *)hlsPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodHlsPackage class]];
}

+ (NSValueTransformer *)mssPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodMssPackage class]];
}

@end

@implementation AWSMediapackagevodPackagingConfigurationCreateParameters

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodCmafPackage class]];
}

+ (NSValueTransformer *)dashPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodDashPackage class]];
}

+ (NSValueTransformer *)hlsPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodHlsPackage class]];
}

+ (NSValueTransformer *)mssPackageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodMssPackage class]];
}

@end

@implementation AWSMediapackagevodPackagingConfigurationList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"packagingConfigurations" : @"PackagingConfigurations",
             };
}

+ (NSValueTransformer *)packagingConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediapackagevodPackagingConfiguration class]];
}

@end

@implementation AWSMediapackagevodPackagingGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"authorization" : @"Authorization",
             @"domainName" : @"DomainName",
             @"identifier" : @"Id",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)authorizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodAuthorization class]];
}

@end

@implementation AWSMediapackagevodPackagingGroupCreateParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorization" : @"Authorization",
             @"identifier" : @"Id",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)authorizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodAuthorization class]];
}

@end

@implementation AWSMediapackagevodPackagingGroupList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"packagingGroups" : @"PackagingGroups",
             };
}

+ (NSValueTransformer *)packagingGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediapackagevodPackagingGroup class]];
}

@end

@implementation AWSMediapackagevodPackagingGroupUpdateParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorization" : @"Authorization",
             };
}

+ (NSValueTransformer *)authorizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodAuthorization class]];
}

@end

@implementation AWSMediapackagevodSpekeKeyProvider

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"systemIds" : @"SystemIds",
             @"url" : @"Url",
             };
}

@end

@implementation AWSMediapackagevodStreamSelection

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
            return @(AWSMediapackagevodStreamOrderOriginal);
        }
        if ([value caseInsensitiveCompare:@"VIDEO_BITRATE_ASCENDING"] == NSOrderedSame) {
            return @(AWSMediapackagevodStreamOrderVideoBitrateAscending);
        }
        if ([value caseInsensitiveCompare:@"VIDEO_BITRATE_DESCENDING"] == NSOrderedSame) {
            return @(AWSMediapackagevodStreamOrderVideoBitrateDescending);
        }
        return @(AWSMediapackagevodStreamOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediapackagevodStreamOrderOriginal:
                return @"ORIGINAL";
            case AWSMediapackagevodStreamOrderVideoBitrateAscending:
                return @"VIDEO_BITRATE_ASCENDING";
            case AWSMediapackagevodStreamOrderVideoBitrateDescending:
                return @"VIDEO_BITRATE_DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediapackagevodTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSMediapackagevodTagsModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSMediapackagevodUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSMediapackagevodUpdatePackagingGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorization" : @"Authorization",
             @"identifier" : @"Id",
             };
}

+ (NSValueTransformer *)authorizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodAuthorization class]];
}

@end

@implementation AWSMediapackagevodUpdatePackagingGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"authorization" : @"Authorization",
             @"domainName" : @"DomainName",
             @"identifier" : @"Id",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)authorizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediapackagevodAuthorization class]];
}

@end
