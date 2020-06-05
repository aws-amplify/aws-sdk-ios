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

#import "AWSCloudfrontModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSCloudfrontErrorDomain = @"com.amazonaws.AWSCloudfrontErrorDomain";

@implementation AWSCloudfrontActiveTrustedSigners

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontSigner class]];
}

@end

@implementation AWSCloudfrontAliasICPRecordal

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CNAME" : @"CNAME",
             @"ICPRecordalStatus" : @"ICPRecordalStatus",
             };
}

+ (NSValueTransformer *)ICPRecordalStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APPROVED"] == NSOrderedSame) {
            return @(AWSCloudfrontICPRecordalStatusApproved);
        }
        if ([value caseInsensitiveCompare:@"SUSPENDED"] == NSOrderedSame) {
            return @(AWSCloudfrontICPRecordalStatusSuspended);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSCloudfrontICPRecordalStatusPending);
        }
        return @(AWSCloudfrontICPRecordalStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontICPRecordalStatusApproved:
                return @"APPROVED";
            case AWSCloudfrontICPRecordalStatusSuspended:
                return @"SUSPENDED";
            case AWSCloudfrontICPRecordalStatusPending:
                return @"PENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudfrontAliases

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

@end

@implementation AWSCloudfrontAllowedMethods

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cachedMethods" : @"CachedMethods",
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)cachedMethodsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCachedMethods class]];
}

@end

@implementation AWSCloudfrontCacheBehavior

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedMethods" : @"AllowedMethods",
             @"compress" : @"Compress",
             @"defaultTTL" : @"DefaultTTL",
             @"fieldLevelEncryptionId" : @"FieldLevelEncryptionId",
             @"forwardedValues" : @"ForwardedValues",
             @"lambdaFunctionAssociations" : @"LambdaFunctionAssociations",
             @"maxTTL" : @"MaxTTL",
             @"minTTL" : @"MinTTL",
             @"pathPattern" : @"PathPattern",
             @"smoothStreaming" : @"SmoothStreaming",
             @"targetOriginId" : @"TargetOriginId",
             @"trustedSigners" : @"TrustedSigners",
             @"viewerProtocolPolicy" : @"ViewerProtocolPolicy",
             };
}

+ (NSValueTransformer *)allowedMethodsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontAllowedMethods class]];
}

+ (NSValueTransformer *)forwardedValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontForwardedValues class]];
}

+ (NSValueTransformer *)lambdaFunctionAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontLambdaFunctionAssociations class]];
}

+ (NSValueTransformer *)trustedSignersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontTrustedSigners class]];
}

+ (NSValueTransformer *)viewerProtocolPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"allow-all"] == NSOrderedSame) {
            return @(AWSCloudfrontViewerProtocolPolicyAllowAll);
        }
        if ([value caseInsensitiveCompare:@"https-only"] == NSOrderedSame) {
            return @(AWSCloudfrontViewerProtocolPolicyHttpsOnly);
        }
        if ([value caseInsensitiveCompare:@"redirect-to-https"] == NSOrderedSame) {
            return @(AWSCloudfrontViewerProtocolPolicyRedirectToHttps);
        }
        return @(AWSCloudfrontViewerProtocolPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontViewerProtocolPolicyAllowAll:
                return @"allow-all";
            case AWSCloudfrontViewerProtocolPolicyHttpsOnly:
                return @"https-only";
            case AWSCloudfrontViewerProtocolPolicyRedirectToHttps:
                return @"redirect-to-https";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudfrontCacheBehaviors

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontCacheBehavior class]];
}

@end

@implementation AWSCloudfrontCachedMethods

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

@end

@implementation AWSCloudfrontCloudFrontOriginAccessIdentity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFrontOriginAccessIdentityConfig" : @"CloudFrontOriginAccessIdentityConfig",
             @"identifier" : @"Id",
             @"s3CanonicalUserId" : @"S3CanonicalUserId",
             };
}

+ (NSValueTransformer *)cloudFrontOriginAccessIdentityConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCloudFrontOriginAccessIdentityConfig class]];
}

@end

@implementation AWSCloudfrontCloudFrontOriginAccessIdentityConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"comment" : @"Comment",
             };
}

@end

@implementation AWSCloudfrontCloudFrontOriginAccessIdentityList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"items" : @"Items",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"nextMarker" : @"NextMarker",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontCloudFrontOriginAccessIdentitySummary class]];
}

@end

@implementation AWSCloudfrontCloudFrontOriginAccessIdentitySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"identifier" : @"Id",
             @"s3CanonicalUserId" : @"S3CanonicalUserId",
             };
}

@end

@implementation AWSCloudfrontContentTypeProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"format" : @"Format",
             @"profileId" : @"ProfileId",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"URLEncoded"] == NSOrderedSame) {
            return @(AWSCloudfrontFormatURLEncoded);
        }
        return @(AWSCloudfrontFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontFormatURLEncoded:
                return @"URLEncoded";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudfrontContentTypeProfileConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentTypeProfiles" : @"ContentTypeProfiles",
             @"forwardWhenContentTypeIsUnknown" : @"ForwardWhenContentTypeIsUnknown",
             };
}

+ (NSValueTransformer *)contentTypeProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontContentTypeProfiles class]];
}

@end

@implementation AWSCloudfrontContentTypeProfiles

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontContentTypeProfile class]];
}

@end

@implementation AWSCloudfrontCookieNames

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

@end

@implementation AWSCloudfrontCookiePreference

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"forward" : @"Forward",
             @"whitelistedNames" : @"WhitelistedNames",
             };
}

+ (NSValueTransformer *)forwardJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"none"] == NSOrderedSame) {
            return @(AWSCloudfrontItemSelectionNone);
        }
        if ([value caseInsensitiveCompare:@"whitelist"] == NSOrderedSame) {
            return @(AWSCloudfrontItemSelectionWhitelist);
        }
        if ([value caseInsensitiveCompare:@"all"] == NSOrderedSame) {
            return @(AWSCloudfrontItemSelectionAll);
        }
        return @(AWSCloudfrontItemSelectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontItemSelectionNone:
                return @"none";
            case AWSCloudfrontItemSelectionWhitelist:
                return @"whitelist";
            case AWSCloudfrontItemSelectionAll:
                return @"all";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)whitelistedNamesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCookieNames class]];
}

@end

@implementation AWSCloudfrontCreateCloudFrontOriginAccessIdentityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFrontOriginAccessIdentityConfig" : @"CloudFrontOriginAccessIdentityConfig",
             };
}

+ (NSValueTransformer *)cloudFrontOriginAccessIdentityConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCloudFrontOriginAccessIdentityConfig class]];
}

@end

@implementation AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFrontOriginAccessIdentity" : @"CloudFrontOriginAccessIdentity",
             @"ETag" : @"ETag",
             @"location" : @"Location",
             };
}

+ (NSValueTransformer *)cloudFrontOriginAccessIdentityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCloudFrontOriginAccessIdentity class]];
}

@end

@implementation AWSCloudfrontCreateDistributionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfig" : @"DistributionConfig",
             };
}

+ (NSValueTransformer *)distributionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDistributionConfig class]];
}

@end

@implementation AWSCloudfrontCreateDistributionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distribution" : @"Distribution",
             @"ETag" : @"ETag",
             @"location" : @"Location",
             };
}

+ (NSValueTransformer *)distributionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDistribution class]];
}

@end

@implementation AWSCloudfrontCreateDistributionWithTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfigWithTags" : @"DistributionConfigWithTags",
             };
}

+ (NSValueTransformer *)distributionConfigWithTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDistributionConfigWithTags class]];
}

@end

@implementation AWSCloudfrontCreateDistributionWithTagsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distribution" : @"Distribution",
             @"ETag" : @"ETag",
             @"location" : @"Location",
             };
}

+ (NSValueTransformer *)distributionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDistribution class]];
}

@end

@implementation AWSCloudfrontCreateFieldLevelEncryptionConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldLevelEncryptionConfig" : @"FieldLevelEncryptionConfig",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionConfig class]];
}

@end

@implementation AWSCloudfrontCreateFieldLevelEncryptionConfigResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"fieldLevelEncryption" : @"FieldLevelEncryption",
             @"location" : @"Location",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryption class]];
}

@end

@implementation AWSCloudfrontCreateFieldLevelEncryptionProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldLevelEncryptionProfileConfig" : @"FieldLevelEncryptionProfileConfig",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionProfileConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionProfileConfig class]];
}

@end

@implementation AWSCloudfrontCreateFieldLevelEncryptionProfileResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"fieldLevelEncryptionProfile" : @"FieldLevelEncryptionProfile",
             @"location" : @"Location",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionProfile class]];
}

@end

@implementation AWSCloudfrontCreateInvalidationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionId" : @"DistributionId",
             @"invalidationBatch" : @"InvalidationBatch",
             };
}

+ (NSValueTransformer *)invalidationBatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontInvalidationBatch class]];
}

@end

@implementation AWSCloudfrontCreateInvalidationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invalidation" : @"Invalidation",
             @"location" : @"Location",
             };
}

+ (NSValueTransformer *)invalidationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontInvalidation class]];
}

@end

@implementation AWSCloudfrontCreatePublicKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"publicKeyConfig" : @"PublicKeyConfig",
             };
}

+ (NSValueTransformer *)publicKeyConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontPublicKeyConfig class]];
}

@end

@implementation AWSCloudfrontCreatePublicKeyResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"location" : @"Location",
             @"publicKey" : @"PublicKey",
             };
}

+ (NSValueTransformer *)publicKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontPublicKey class]];
}

@end

@implementation AWSCloudfrontCreateStreamingDistributionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamingDistributionConfig" : @"StreamingDistributionConfig",
             };
}

+ (NSValueTransformer *)streamingDistributionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontStreamingDistributionConfig class]];
}

@end

@implementation AWSCloudfrontCreateStreamingDistributionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"location" : @"Location",
             @"streamingDistribution" : @"StreamingDistribution",
             };
}

+ (NSValueTransformer *)streamingDistributionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontStreamingDistribution class]];
}

@end

@implementation AWSCloudfrontCreateStreamingDistributionWithTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamingDistributionConfigWithTags" : @"StreamingDistributionConfigWithTags",
             };
}

+ (NSValueTransformer *)streamingDistributionConfigWithTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontStreamingDistributionConfigWithTags class]];
}

@end

@implementation AWSCloudfrontCreateStreamingDistributionWithTagsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"location" : @"Location",
             @"streamingDistribution" : @"StreamingDistribution",
             };
}

+ (NSValueTransformer *)streamingDistributionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontStreamingDistribution class]];
}

@end

@implementation AWSCloudfrontCustomErrorResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCachingMinTTL" : @"ErrorCachingMinTTL",
             @"errorCode" : @"ErrorCode",
             @"responseCode" : @"ResponseCode",
             @"responsePagePath" : @"ResponsePagePath",
             };
}

@end

@implementation AWSCloudfrontCustomErrorResponses

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontCustomErrorResponse class]];
}

@end

@implementation AWSCloudfrontCustomHeaders

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontOriginCustomHeader class]];
}

@end

@implementation AWSCloudfrontCustomOriginConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"HTTPPort" : @"HTTPPort",
             @"HTTPSPort" : @"HTTPSPort",
             @"originKeepaliveTimeout" : @"OriginKeepaliveTimeout",
             @"originProtocolPolicy" : @"OriginProtocolPolicy",
             @"originReadTimeout" : @"OriginReadTimeout",
             @"originSslProtocols" : @"OriginSslProtocols",
             };
}

+ (NSValueTransformer *)originProtocolPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"http-only"] == NSOrderedSame) {
            return @(AWSCloudfrontOriginProtocolPolicyHttpOnly);
        }
        if ([value caseInsensitiveCompare:@"match-viewer"] == NSOrderedSame) {
            return @(AWSCloudfrontOriginProtocolPolicyMatchViewer);
        }
        if ([value caseInsensitiveCompare:@"https-only"] == NSOrderedSame) {
            return @(AWSCloudfrontOriginProtocolPolicyHttpsOnly);
        }
        return @(AWSCloudfrontOriginProtocolPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontOriginProtocolPolicyHttpOnly:
                return @"http-only";
            case AWSCloudfrontOriginProtocolPolicyMatchViewer:
                return @"match-viewer";
            case AWSCloudfrontOriginProtocolPolicyHttpsOnly:
                return @"https-only";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)originSslProtocolsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontOriginSslProtocols class]];
}

@end

@implementation AWSCloudfrontDefaultCacheBehavior

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedMethods" : @"AllowedMethods",
             @"compress" : @"Compress",
             @"defaultTTL" : @"DefaultTTL",
             @"fieldLevelEncryptionId" : @"FieldLevelEncryptionId",
             @"forwardedValues" : @"ForwardedValues",
             @"lambdaFunctionAssociations" : @"LambdaFunctionAssociations",
             @"maxTTL" : @"MaxTTL",
             @"minTTL" : @"MinTTL",
             @"smoothStreaming" : @"SmoothStreaming",
             @"targetOriginId" : @"TargetOriginId",
             @"trustedSigners" : @"TrustedSigners",
             @"viewerProtocolPolicy" : @"ViewerProtocolPolicy",
             };
}

+ (NSValueTransformer *)allowedMethodsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontAllowedMethods class]];
}

+ (NSValueTransformer *)forwardedValuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontForwardedValues class]];
}

+ (NSValueTransformer *)lambdaFunctionAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontLambdaFunctionAssociations class]];
}

+ (NSValueTransformer *)trustedSignersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontTrustedSigners class]];
}

+ (NSValueTransformer *)viewerProtocolPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"allow-all"] == NSOrderedSame) {
            return @(AWSCloudfrontViewerProtocolPolicyAllowAll);
        }
        if ([value caseInsensitiveCompare:@"https-only"] == NSOrderedSame) {
            return @(AWSCloudfrontViewerProtocolPolicyHttpsOnly);
        }
        if ([value caseInsensitiveCompare:@"redirect-to-https"] == NSOrderedSame) {
            return @(AWSCloudfrontViewerProtocolPolicyRedirectToHttps);
        }
        return @(AWSCloudfrontViewerProtocolPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontViewerProtocolPolicyAllowAll:
                return @"allow-all";
            case AWSCloudfrontViewerProtocolPolicyHttpsOnly:
                return @"https-only";
            case AWSCloudfrontViewerProtocolPolicyRedirectToHttps:
                return @"redirect-to-https";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudfrontDeleteCloudFrontOriginAccessIdentityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"ifMatch" : @"IfMatch",
             };
}

@end

@implementation AWSCloudfrontDeleteDistributionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"ifMatch" : @"IfMatch",
             };
}

@end

@implementation AWSCloudfrontDeleteFieldLevelEncryptionConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"ifMatch" : @"IfMatch",
             };
}

@end

@implementation AWSCloudfrontDeleteFieldLevelEncryptionProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"ifMatch" : @"IfMatch",
             };
}

@end

@implementation AWSCloudfrontDeletePublicKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"ifMatch" : @"IfMatch",
             };
}

@end

@implementation AWSCloudfrontDeleteStreamingDistributionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"ifMatch" : @"IfMatch",
             };
}

@end

@implementation AWSCloudfrontDistribution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"activeTrustedSigners" : @"ActiveTrustedSigners",
             @"aliasICPRecordals" : @"AliasICPRecordals",
             @"distributionConfig" : @"DistributionConfig",
             @"domainName" : @"DomainName",
             @"identifier" : @"Id",
             @"inProgressInvalidationBatches" : @"InProgressInvalidationBatches",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)activeTrustedSignersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontActiveTrustedSigners class]];
}

+ (NSValueTransformer *)aliasICPRecordalsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontAliasICPRecordal class]];
}

+ (NSValueTransformer *)distributionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDistributionConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudfrontDistributionConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliases" : @"Aliases",
             @"cacheBehaviors" : @"CacheBehaviors",
             @"callerReference" : @"CallerReference",
             @"comment" : @"Comment",
             @"customErrorResponses" : @"CustomErrorResponses",
             @"defaultCacheBehavior" : @"DefaultCacheBehavior",
             @"defaultRootObject" : @"DefaultRootObject",
             @"enabled" : @"Enabled",
             @"httpVersion" : @"HttpVersion",
             @"isIPV6Enabled" : @"IsIPV6Enabled",
             @"logging" : @"Logging",
             @"originGroups" : @"OriginGroups",
             @"origins" : @"Origins",
             @"priceClass" : @"PriceClass",
             @"restrictions" : @"Restrictions",
             @"viewerCertificate" : @"ViewerCertificate",
             @"webACLId" : @"WebACLId",
             };
}

+ (NSValueTransformer *)aliasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontAliases class]];
}

+ (NSValueTransformer *)cacheBehaviorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCacheBehaviors class]];
}

+ (NSValueTransformer *)customErrorResponsesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCustomErrorResponses class]];
}

+ (NSValueTransformer *)defaultCacheBehaviorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDefaultCacheBehavior class]];
}

+ (NSValueTransformer *)httpVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"http1.1"] == NSOrderedSame) {
            return @(AWSCloudfrontHttpVersionHttp11);
        }
        if ([value caseInsensitiveCompare:@"http2"] == NSOrderedSame) {
            return @(AWSCloudfrontHttpVersionHttp2);
        }
        return @(AWSCloudfrontHttpVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontHttpVersionHttp11:
                return @"http1.1";
            case AWSCloudfrontHttpVersionHttp2:
                return @"http2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)loggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontLoggingConfig class]];
}

+ (NSValueTransformer *)originGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontOriginGroups class]];
}

+ (NSValueTransformer *)originsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontOrigins class]];
}

+ (NSValueTransformer *)priceClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PriceClass_100"] == NSOrderedSame) {
            return @(AWSCloudfrontPriceClassPriceClass100);
        }
        if ([value caseInsensitiveCompare:@"PriceClass_200"] == NSOrderedSame) {
            return @(AWSCloudfrontPriceClassPriceClass200);
        }
        if ([value caseInsensitiveCompare:@"PriceClass_All"] == NSOrderedSame) {
            return @(AWSCloudfrontPriceClassPriceClassAll);
        }
        return @(AWSCloudfrontPriceClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontPriceClassPriceClass100:
                return @"PriceClass_100";
            case AWSCloudfrontPriceClassPriceClass200:
                return @"PriceClass_200";
            case AWSCloudfrontPriceClassPriceClassAll:
                return @"PriceClass_All";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)restrictionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontRestrictions class]];
}

+ (NSValueTransformer *)viewerCertificateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontViewerCertificate class]];
}

@end

@implementation AWSCloudfrontDistributionConfigWithTags

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfig" : @"DistributionConfig",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)distributionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDistributionConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontTags class]];
}

@end

@implementation AWSCloudfrontDistributionList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"items" : @"Items",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"nextMarker" : @"NextMarker",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontDistributionSummary class]];
}

@end

@implementation AWSCloudfrontDistributionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"aliasICPRecordals" : @"AliasICPRecordals",
             @"aliases" : @"Aliases",
             @"cacheBehaviors" : @"CacheBehaviors",
             @"comment" : @"Comment",
             @"customErrorResponses" : @"CustomErrorResponses",
             @"defaultCacheBehavior" : @"DefaultCacheBehavior",
             @"domainName" : @"DomainName",
             @"enabled" : @"Enabled",
             @"httpVersion" : @"HttpVersion",
             @"identifier" : @"Id",
             @"isIPV6Enabled" : @"IsIPV6Enabled",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"originGroups" : @"OriginGroups",
             @"origins" : @"Origins",
             @"priceClass" : @"PriceClass",
             @"restrictions" : @"Restrictions",
             @"status" : @"Status",
             @"viewerCertificate" : @"ViewerCertificate",
             @"webACLId" : @"WebACLId",
             };
}

+ (NSValueTransformer *)aliasICPRecordalsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontAliasICPRecordal class]];
}

+ (NSValueTransformer *)aliasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontAliases class]];
}

+ (NSValueTransformer *)cacheBehaviorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCacheBehaviors class]];
}

+ (NSValueTransformer *)customErrorResponsesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCustomErrorResponses class]];
}

+ (NSValueTransformer *)defaultCacheBehaviorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDefaultCacheBehavior class]];
}

+ (NSValueTransformer *)httpVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"http1.1"] == NSOrderedSame) {
            return @(AWSCloudfrontHttpVersionHttp11);
        }
        if ([value caseInsensitiveCompare:@"http2"] == NSOrderedSame) {
            return @(AWSCloudfrontHttpVersionHttp2);
        }
        return @(AWSCloudfrontHttpVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontHttpVersionHttp11:
                return @"http1.1";
            case AWSCloudfrontHttpVersionHttp2:
                return @"http2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)originGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontOriginGroups class]];
}

+ (NSValueTransformer *)originsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontOrigins class]];
}

+ (NSValueTransformer *)priceClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PriceClass_100"] == NSOrderedSame) {
            return @(AWSCloudfrontPriceClassPriceClass100);
        }
        if ([value caseInsensitiveCompare:@"PriceClass_200"] == NSOrderedSame) {
            return @(AWSCloudfrontPriceClassPriceClass200);
        }
        if ([value caseInsensitiveCompare:@"PriceClass_All"] == NSOrderedSame) {
            return @(AWSCloudfrontPriceClassPriceClassAll);
        }
        return @(AWSCloudfrontPriceClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontPriceClassPriceClass100:
                return @"PriceClass_100";
            case AWSCloudfrontPriceClassPriceClass200:
                return @"PriceClass_200";
            case AWSCloudfrontPriceClassPriceClassAll:
                return @"PriceClass_All";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)restrictionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontRestrictions class]];
}

+ (NSValueTransformer *)viewerCertificateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontViewerCertificate class]];
}

@end

@implementation AWSCloudfrontEncryptionEntities

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontEncryptionEntity class]];
}

@end

@implementation AWSCloudfrontEncryptionEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldPatterns" : @"FieldPatterns",
             @"providerId" : @"ProviderId",
             @"publicKeyId" : @"PublicKeyId",
             };
}

+ (NSValueTransformer *)fieldPatternsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldPatterns class]];
}

@end

@implementation AWSCloudfrontFieldLevelEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldLevelEncryptionConfig" : @"FieldLevelEncryptionConfig",
             @"identifier" : @"Id",
             @"lastModifiedTime" : @"LastModifiedTime",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudfrontFieldLevelEncryptionConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"comment" : @"Comment",
             @"contentTypeProfileConfig" : @"ContentTypeProfileConfig",
             @"queryArgProfileConfig" : @"QueryArgProfileConfig",
             };
}

+ (NSValueTransformer *)contentTypeProfileConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontContentTypeProfileConfig class]];
}

+ (NSValueTransformer *)queryArgProfileConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontQueryArgProfileConfig class]];
}

@end

@implementation AWSCloudfrontFieldLevelEncryptionList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"maxItems" : @"MaxItems",
             @"nextMarker" : @"NextMarker",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionSummary class]];
}

@end

@implementation AWSCloudfrontFieldLevelEncryptionProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldLevelEncryptionProfileConfig" : @"FieldLevelEncryptionProfileConfig",
             @"identifier" : @"Id",
             @"lastModifiedTime" : @"LastModifiedTime",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionProfileConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionProfileConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudfrontFieldLevelEncryptionProfileConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"comment" : @"Comment",
             @"encryptionEntities" : @"EncryptionEntities",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)encryptionEntitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontEncryptionEntities class]];
}

@end

@implementation AWSCloudfrontFieldLevelEncryptionProfileList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"maxItems" : @"MaxItems",
             @"nextMarker" : @"NextMarker",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionProfileSummary class]];
}

@end

@implementation AWSCloudfrontFieldLevelEncryptionProfileSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"encryptionEntities" : @"EncryptionEntities",
             @"identifier" : @"Id",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)encryptionEntitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontEncryptionEntities class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudfrontFieldLevelEncryptionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"contentTypeProfileConfig" : @"ContentTypeProfileConfig",
             @"identifier" : @"Id",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"queryArgProfileConfig" : @"QueryArgProfileConfig",
             };
}

+ (NSValueTransformer *)contentTypeProfileConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontContentTypeProfileConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)queryArgProfileConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontQueryArgProfileConfig class]];
}

@end

@implementation AWSCloudfrontFieldPatterns

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

@end

@implementation AWSCloudfrontForwardedValues

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cookies" : @"Cookies",
             @"headers" : @"Headers",
             @"queryString" : @"QueryString",
             @"queryStringCacheKeys" : @"QueryStringCacheKeys",
             };
}

+ (NSValueTransformer *)cookiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCookiePreference class]];
}

+ (NSValueTransformer *)headersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontHeaders class]];
}

+ (NSValueTransformer *)queryStringCacheKeysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontQueryStringCacheKeys class]];
}

@end

@implementation AWSCloudfrontGeoRestriction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             @"restrictionType" : @"RestrictionType",
             };
}

+ (NSValueTransformer *)restrictionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"blacklist"] == NSOrderedSame) {
            return @(AWSCloudfrontGeoRestrictionTypeBlacklist);
        }
        if ([value caseInsensitiveCompare:@"whitelist"] == NSOrderedSame) {
            return @(AWSCloudfrontGeoRestrictionTypeWhitelist);
        }
        if ([value caseInsensitiveCompare:@"none"] == NSOrderedSame) {
            return @(AWSCloudfrontGeoRestrictionTypeNone);
        }
        return @(AWSCloudfrontGeoRestrictionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontGeoRestrictionTypeBlacklist:
                return @"blacklist";
            case AWSCloudfrontGeoRestrictionTypeWhitelist:
                return @"whitelist";
            case AWSCloudfrontGeoRestrictionTypeNone:
                return @"none";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFrontOriginAccessIdentityConfig" : @"CloudFrontOriginAccessIdentityConfig",
             @"ETag" : @"ETag",
             };
}

+ (NSValueTransformer *)cloudFrontOriginAccessIdentityConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCloudFrontOriginAccessIdentityConfig class]];
}

@end

@implementation AWSCloudfrontGetCloudFrontOriginAccessIdentityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSCloudfrontGetCloudFrontOriginAccessIdentityResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFrontOriginAccessIdentity" : @"CloudFrontOriginAccessIdentity",
             @"ETag" : @"ETag",
             };
}

+ (NSValueTransformer *)cloudFrontOriginAccessIdentityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCloudFrontOriginAccessIdentity class]];
}

@end

@implementation AWSCloudfrontGetDistributionConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSCloudfrontGetDistributionConfigResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfig" : @"DistributionConfig",
             @"ETag" : @"ETag",
             };
}

+ (NSValueTransformer *)distributionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDistributionConfig class]];
}

@end

@implementation AWSCloudfrontGetDistributionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSCloudfrontGetDistributionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distribution" : @"Distribution",
             @"ETag" : @"ETag",
             };
}

+ (NSValueTransformer *)distributionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDistribution class]];
}

@end

@implementation AWSCloudfrontGetFieldLevelEncryptionConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSCloudfrontGetFieldLevelEncryptionConfigResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"fieldLevelEncryptionConfig" : @"FieldLevelEncryptionConfig",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionConfig class]];
}

@end

@implementation AWSCloudfrontGetFieldLevelEncryptionProfileConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"fieldLevelEncryptionProfileConfig" : @"FieldLevelEncryptionProfileConfig",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionProfileConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionProfileConfig class]];
}

@end

@implementation AWSCloudfrontGetFieldLevelEncryptionProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSCloudfrontGetFieldLevelEncryptionProfileResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"fieldLevelEncryptionProfile" : @"FieldLevelEncryptionProfile",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionProfile class]];
}

@end

@implementation AWSCloudfrontGetFieldLevelEncryptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSCloudfrontGetFieldLevelEncryptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"fieldLevelEncryption" : @"FieldLevelEncryption",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryption class]];
}

@end

@implementation AWSCloudfrontGetInvalidationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionId" : @"DistributionId",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSCloudfrontGetInvalidationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invalidation" : @"Invalidation",
             };
}

+ (NSValueTransformer *)invalidationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontInvalidation class]];
}

@end

@implementation AWSCloudfrontGetPublicKeyConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSCloudfrontGetPublicKeyConfigResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"publicKeyConfig" : @"PublicKeyConfig",
             };
}

+ (NSValueTransformer *)publicKeyConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontPublicKeyConfig class]];
}

@end

@implementation AWSCloudfrontGetPublicKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSCloudfrontGetPublicKeyResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"publicKey" : @"PublicKey",
             };
}

+ (NSValueTransformer *)publicKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontPublicKey class]];
}

@end

@implementation AWSCloudfrontGetStreamingDistributionConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSCloudfrontGetStreamingDistributionConfigResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"streamingDistributionConfig" : @"StreamingDistributionConfig",
             };
}

+ (NSValueTransformer *)streamingDistributionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontStreamingDistributionConfig class]];
}

@end

@implementation AWSCloudfrontGetStreamingDistributionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSCloudfrontGetStreamingDistributionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"streamingDistribution" : @"StreamingDistribution",
             };
}

+ (NSValueTransformer *)streamingDistributionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontStreamingDistribution class]];
}

@end

@implementation AWSCloudfrontHeaders

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

@end

@implementation AWSCloudfrontInvalidation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"identifier" : @"Id",
             @"invalidationBatch" : @"InvalidationBatch",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)invalidationBatchJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontInvalidationBatch class]];
}

@end

@implementation AWSCloudfrontInvalidationBatch

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"paths" : @"Paths",
             };
}

+ (NSValueTransformer *)pathsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontPaths class]];
}

@end

@implementation AWSCloudfrontInvalidationList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"items" : @"Items",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"nextMarker" : @"NextMarker",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontInvalidationSummary class]];
}

@end

@implementation AWSCloudfrontInvalidationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"identifier" : @"Id",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudfrontKeyPairIds

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

@end

@implementation AWSCloudfrontLambdaFunctionAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventType" : @"EventType",
             @"includeBody" : @"IncludeBody",
             @"lambdaFunctionARN" : @"LambdaFunctionARN",
             };
}

+ (NSValueTransformer *)eventTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"viewer-request"] == NSOrderedSame) {
            return @(AWSCloudfrontEventTypeViewerRequest);
        }
        if ([value caseInsensitiveCompare:@"viewer-response"] == NSOrderedSame) {
            return @(AWSCloudfrontEventTypeViewerResponse);
        }
        if ([value caseInsensitiveCompare:@"origin-request"] == NSOrderedSame) {
            return @(AWSCloudfrontEventTypeOriginRequest);
        }
        if ([value caseInsensitiveCompare:@"origin-response"] == NSOrderedSame) {
            return @(AWSCloudfrontEventTypeOriginResponse);
        }
        return @(AWSCloudfrontEventTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontEventTypeViewerRequest:
                return @"viewer-request";
            case AWSCloudfrontEventTypeViewerResponse:
                return @"viewer-response";
            case AWSCloudfrontEventTypeOriginRequest:
                return @"origin-request";
            case AWSCloudfrontEventTypeOriginResponse:
                return @"origin-response";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCloudfrontLambdaFunctionAssociations

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontLambdaFunctionAssociation class]];
}

@end

@implementation AWSCloudfrontListCloudFrontOriginAccessIdentitiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFrontOriginAccessIdentityList" : @"CloudFrontOriginAccessIdentityList",
             };
}

+ (NSValueTransformer *)cloudFrontOriginAccessIdentityListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCloudFrontOriginAccessIdentityList class]];
}

@end

@implementation AWSCloudfrontListDistributionsByWebACLIdRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"webACLId" : @"WebACLId",
             };
}

@end

@implementation AWSCloudfrontListDistributionsByWebACLIdResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionList" : @"DistributionList",
             };
}

+ (NSValueTransformer *)distributionListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDistributionList class]];
}

@end

@implementation AWSCloudfrontListDistributionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSCloudfrontListDistributionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionList" : @"DistributionList",
             };
}

+ (NSValueTransformer *)distributionListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDistributionList class]];
}

@end

@implementation AWSCloudfrontListFieldLevelEncryptionConfigsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSCloudfrontListFieldLevelEncryptionConfigsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldLevelEncryptionList" : @"FieldLevelEncryptionList",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionList class]];
}

@end

@implementation AWSCloudfrontListFieldLevelEncryptionProfilesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSCloudfrontListFieldLevelEncryptionProfilesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldLevelEncryptionProfileList" : @"FieldLevelEncryptionProfileList",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionProfileListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionProfileList class]];
}

@end

@implementation AWSCloudfrontListInvalidationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionId" : @"DistributionId",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSCloudfrontListInvalidationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invalidationList" : @"InvalidationList",
             };
}

+ (NSValueTransformer *)invalidationListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontInvalidationList class]];
}

@end

@implementation AWSCloudfrontListPublicKeysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSCloudfrontListPublicKeysResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"publicKeyList" : @"PublicKeyList",
             };
}

+ (NSValueTransformer *)publicKeyListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontPublicKeyList class]];
}

@end

@implementation AWSCloudfrontListStreamingDistributionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSCloudfrontListStreamingDistributionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamingDistributionList" : @"StreamingDistributionList",
             };
}

+ (NSValueTransformer *)streamingDistributionListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontStreamingDistributionList class]];
}

@end

@implementation AWSCloudfrontListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             };
}

@end

@implementation AWSCloudfrontListTagsForResourceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontTags class]];
}

@end

@implementation AWSCloudfrontLoggingConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"enabled" : @"Enabled",
             @"includeCookies" : @"IncludeCookies",
             @"prefix" : @"Prefix",
             };
}

@end

@implementation AWSCloudfrontOrigin

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionAttempts" : @"ConnectionAttempts",
             @"connectionTimeout" : @"ConnectionTimeout",
             @"customHeaders" : @"CustomHeaders",
             @"customOriginConfig" : @"CustomOriginConfig",
             @"domainName" : @"DomainName",
             @"identifier" : @"Id",
             @"originPath" : @"OriginPath",
             @"s3OriginConfig" : @"S3OriginConfig",
             };
}

+ (NSValueTransformer *)customHeadersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCustomHeaders class]];
}

+ (NSValueTransformer *)customOriginConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCustomOriginConfig class]];
}

+ (NSValueTransformer *)s3OriginConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontS3OriginConfig class]];
}

@end

@implementation AWSCloudfrontOriginCustomHeader

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"headerName" : @"HeaderName",
             @"headerValue" : @"HeaderValue",
             };
}

@end

@implementation AWSCloudfrontOriginGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failoverCriteria" : @"FailoverCriteria",
             @"identifier" : @"Id",
             @"members" : @"Members",
             };
}

+ (NSValueTransformer *)failoverCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontOriginGroupFailoverCriteria class]];
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontOriginGroupMembers class]];
}

@end

@implementation AWSCloudfrontOriginGroupFailoverCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"statusCodes" : @"StatusCodes",
             };
}

+ (NSValueTransformer *)statusCodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontStatusCodes class]];
}

@end

@implementation AWSCloudfrontOriginGroupMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"originId" : @"OriginId",
             };
}

@end

@implementation AWSCloudfrontOriginGroupMembers

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontOriginGroupMember class]];
}

@end

@implementation AWSCloudfrontOriginGroups

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontOriginGroup class]];
}

@end

@implementation AWSCloudfrontOriginSslProtocols

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

@end

@implementation AWSCloudfrontOrigins

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontOrigin class]];
}

@end

@implementation AWSCloudfrontPaths

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

@end

@implementation AWSCloudfrontPublicKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"CreatedTime",
             @"identifier" : @"Id",
             @"publicKeyConfig" : @"PublicKeyConfig",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)publicKeyConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontPublicKeyConfig class]];
}

@end

@implementation AWSCloudfrontPublicKeyConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callerReference" : @"CallerReference",
             @"comment" : @"Comment",
             @"encodedKey" : @"EncodedKey",
             @"name" : @"Name",
             };
}

@end

@implementation AWSCloudfrontPublicKeyList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"maxItems" : @"MaxItems",
             @"nextMarker" : @"NextMarker",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontPublicKeySummary class]];
}

@end

@implementation AWSCloudfrontPublicKeySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"createdTime" : @"CreatedTime",
             @"encodedKey" : @"EncodedKey",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSCloudfrontQueryArgProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"profileId" : @"ProfileId",
             @"queryArg" : @"QueryArg",
             };
}

@end

@implementation AWSCloudfrontQueryArgProfileConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"forwardWhenQueryArgProfileIsUnknown" : @"ForwardWhenQueryArgProfileIsUnknown",
             @"queryArgProfiles" : @"QueryArgProfiles",
             };
}

+ (NSValueTransformer *)queryArgProfilesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontQueryArgProfiles class]];
}

@end

@implementation AWSCloudfrontQueryArgProfiles

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontQueryArgProfile class]];
}

@end

@implementation AWSCloudfrontQueryStringCacheKeys

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

@end

@implementation AWSCloudfrontRestrictions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"geoRestriction" : @"GeoRestriction",
             };
}

+ (NSValueTransformer *)geoRestrictionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontGeoRestriction class]];
}

@end

@implementation AWSCloudfrontS3Origin

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"originAccessIdentity" : @"OriginAccessIdentity",
             };
}

@end

@implementation AWSCloudfrontS3OriginConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"originAccessIdentity" : @"OriginAccessIdentity",
             };
}

@end

@implementation AWSCloudfrontSigner

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsAccountNumber" : @"AwsAccountNumber",
             @"keyPairIds" : @"KeyPairIds",
             };
}

+ (NSValueTransformer *)keyPairIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontKeyPairIds class]];
}

@end

@implementation AWSCloudfrontStatusCodes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

@end

@implementation AWSCloudfrontStreamingDistribution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"activeTrustedSigners" : @"ActiveTrustedSigners",
             @"domainName" : @"DomainName",
             @"identifier" : @"Id",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"status" : @"Status",
             @"streamingDistributionConfig" : @"StreamingDistributionConfig",
             };
}

+ (NSValueTransformer *)activeTrustedSignersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontActiveTrustedSigners class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)streamingDistributionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontStreamingDistributionConfig class]];
}

@end

@implementation AWSCloudfrontStreamingDistributionConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliases" : @"Aliases",
             @"callerReference" : @"CallerReference",
             @"comment" : @"Comment",
             @"enabled" : @"Enabled",
             @"logging" : @"Logging",
             @"priceClass" : @"PriceClass",
             @"s3Origin" : @"S3Origin",
             @"trustedSigners" : @"TrustedSigners",
             };
}

+ (NSValueTransformer *)aliasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontAliases class]];
}

+ (NSValueTransformer *)loggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontStreamingLoggingConfig class]];
}

+ (NSValueTransformer *)priceClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PriceClass_100"] == NSOrderedSame) {
            return @(AWSCloudfrontPriceClassPriceClass100);
        }
        if ([value caseInsensitiveCompare:@"PriceClass_200"] == NSOrderedSame) {
            return @(AWSCloudfrontPriceClassPriceClass200);
        }
        if ([value caseInsensitiveCompare:@"PriceClass_All"] == NSOrderedSame) {
            return @(AWSCloudfrontPriceClassPriceClassAll);
        }
        return @(AWSCloudfrontPriceClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontPriceClassPriceClass100:
                return @"PriceClass_100";
            case AWSCloudfrontPriceClassPriceClass200:
                return @"PriceClass_200";
            case AWSCloudfrontPriceClassPriceClassAll:
                return @"PriceClass_All";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3OriginJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontS3Origin class]];
}

+ (NSValueTransformer *)trustedSignersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontTrustedSigners class]];
}

@end

@implementation AWSCloudfrontStreamingDistributionConfigWithTags

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamingDistributionConfig" : @"StreamingDistributionConfig",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)streamingDistributionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontStreamingDistributionConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontTags class]];
}

@end

@implementation AWSCloudfrontStreamingDistributionList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isTruncated" : @"IsTruncated",
             @"items" : @"Items",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"nextMarker" : @"NextMarker",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontStreamingDistributionSummary class]];
}

@end

@implementation AWSCloudfrontStreamingDistributionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"aliases" : @"Aliases",
             @"comment" : @"Comment",
             @"domainName" : @"DomainName",
             @"enabled" : @"Enabled",
             @"identifier" : @"Id",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"priceClass" : @"PriceClass",
             @"s3Origin" : @"S3Origin",
             @"status" : @"Status",
             @"trustedSigners" : @"TrustedSigners",
             };
}

+ (NSValueTransformer *)aliasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontAliases class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)priceClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PriceClass_100"] == NSOrderedSame) {
            return @(AWSCloudfrontPriceClassPriceClass100);
        }
        if ([value caseInsensitiveCompare:@"PriceClass_200"] == NSOrderedSame) {
            return @(AWSCloudfrontPriceClassPriceClass200);
        }
        if ([value caseInsensitiveCompare:@"PriceClass_All"] == NSOrderedSame) {
            return @(AWSCloudfrontPriceClassPriceClassAll);
        }
        return @(AWSCloudfrontPriceClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontPriceClassPriceClass100:
                return @"PriceClass_100";
            case AWSCloudfrontPriceClassPriceClass200:
                return @"PriceClass_200";
            case AWSCloudfrontPriceClassPriceClassAll:
                return @"PriceClass_All";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)s3OriginJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontS3Origin class]];
}

+ (NSValueTransformer *)trustedSignersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontTrustedSigners class]];
}

@end

@implementation AWSCloudfrontStreamingLoggingConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"enabled" : @"Enabled",
             @"prefix" : @"Prefix",
             };
}

@end

@implementation AWSCloudfrontTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSCloudfrontTagKeys

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             };
}

@end

@implementation AWSCloudfrontTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontTags class]];
}

@end

@implementation AWSCloudfrontTags

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCloudfrontTag class]];
}

@end

@implementation AWSCloudfrontTrustedSigners

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"items" : @"Items",
             @"quantity" : @"Quantity",
             };
}

@end

@implementation AWSCloudfrontUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             @"tagKeys" : @"TagKeys",
             };
}

+ (NSValueTransformer *)tagKeysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontTagKeys class]];
}

@end

@implementation AWSCloudfrontUpdateCloudFrontOriginAccessIdentityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFrontOriginAccessIdentityConfig" : @"CloudFrontOriginAccessIdentityConfig",
             @"identifier" : @"Id",
             @"ifMatch" : @"IfMatch",
             };
}

+ (NSValueTransformer *)cloudFrontOriginAccessIdentityConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCloudFrontOriginAccessIdentityConfig class]];
}

@end

@implementation AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFrontOriginAccessIdentity" : @"CloudFrontOriginAccessIdentity",
             @"ETag" : @"ETag",
             };
}

+ (NSValueTransformer *)cloudFrontOriginAccessIdentityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontCloudFrontOriginAccessIdentity class]];
}

@end

@implementation AWSCloudfrontUpdateDistributionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributionConfig" : @"DistributionConfig",
             @"identifier" : @"Id",
             @"ifMatch" : @"IfMatch",
             };
}

+ (NSValueTransformer *)distributionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDistributionConfig class]];
}

@end

@implementation AWSCloudfrontUpdateDistributionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distribution" : @"Distribution",
             @"ETag" : @"ETag",
             };
}

+ (NSValueTransformer *)distributionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontDistribution class]];
}

@end

@implementation AWSCloudfrontUpdateFieldLevelEncryptionConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldLevelEncryptionConfig" : @"FieldLevelEncryptionConfig",
             @"identifier" : @"Id",
             @"ifMatch" : @"IfMatch",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionConfig class]];
}

@end

@implementation AWSCloudfrontUpdateFieldLevelEncryptionConfigResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"fieldLevelEncryption" : @"FieldLevelEncryption",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryption class]];
}

@end

@implementation AWSCloudfrontUpdateFieldLevelEncryptionProfileRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldLevelEncryptionProfileConfig" : @"FieldLevelEncryptionProfileConfig",
             @"identifier" : @"Id",
             @"ifMatch" : @"IfMatch",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionProfileConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionProfileConfig class]];
}

@end

@implementation AWSCloudfrontUpdateFieldLevelEncryptionProfileResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"fieldLevelEncryptionProfile" : @"FieldLevelEncryptionProfile",
             };
}

+ (NSValueTransformer *)fieldLevelEncryptionProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontFieldLevelEncryptionProfile class]];
}

@end

@implementation AWSCloudfrontUpdatePublicKeyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"ifMatch" : @"IfMatch",
             @"publicKeyConfig" : @"PublicKeyConfig",
             };
}

+ (NSValueTransformer *)publicKeyConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontPublicKeyConfig class]];
}

@end

@implementation AWSCloudfrontUpdatePublicKeyResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"publicKey" : @"PublicKey",
             };
}

+ (NSValueTransformer *)publicKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontPublicKey class]];
}

@end

@implementation AWSCloudfrontUpdateStreamingDistributionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"ifMatch" : @"IfMatch",
             @"streamingDistributionConfig" : @"StreamingDistributionConfig",
             };
}

+ (NSValueTransformer *)streamingDistributionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontStreamingDistributionConfig class]];
}

@end

@implementation AWSCloudfrontUpdateStreamingDistributionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"streamingDistribution" : @"StreamingDistribution",
             };
}

+ (NSValueTransformer *)streamingDistributionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCloudfrontStreamingDistribution class]];
}

@end

@implementation AWSCloudfrontViewerCertificate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ACMCertificateArn" : @"ACMCertificateArn",
             @"certificate" : @"Certificate",
             @"certificateSource" : @"CertificateSource",
             @"cloudFrontDefaultCertificate" : @"CloudFrontDefaultCertificate",
             @"IAMCertificateId" : @"IAMCertificateId",
             @"minimumProtocolVersion" : @"MinimumProtocolVersion",
             @"SSLSupportMethod" : @"SSLSupportMethod",
             };
}

+ (NSValueTransformer *)certificateSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"cloudfront"] == NSOrderedSame) {
            return @(AWSCloudfrontCertificateSourceCloudfront);
        }
        if ([value caseInsensitiveCompare:@"iam"] == NSOrderedSame) {
            return @(AWSCloudfrontCertificateSourceIam);
        }
        if ([value caseInsensitiveCompare:@"acm"] == NSOrderedSame) {
            return @(AWSCloudfrontCertificateSourceAcm);
        }
        return @(AWSCloudfrontCertificateSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontCertificateSourceCloudfront:
                return @"cloudfront";
            case AWSCloudfrontCertificateSourceIam:
                return @"iam";
            case AWSCloudfrontCertificateSourceAcm:
                return @"acm";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)minimumProtocolVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SSLv3"] == NSOrderedSame) {
            return @(AWSCloudfrontMinimumProtocolVersionSSLv3);
        }
        if ([value caseInsensitiveCompare:@"TLSv1"] == NSOrderedSame) {
            return @(AWSCloudfrontMinimumProtocolVersionTLSv1);
        }
        if ([value caseInsensitiveCompare:@"TLSv1_2016"] == NSOrderedSame) {
            return @(AWSCloudfrontMinimumProtocolVersionTLSv12016);
        }
        if ([value caseInsensitiveCompare:@"TLSv1.1_2016"] == NSOrderedSame) {
            return @(AWSCloudfrontMinimumProtocolVersionTLSv112016);
        }
        if ([value caseInsensitiveCompare:@"TLSv1.2_2018"] == NSOrderedSame) {
            return @(AWSCloudfrontMinimumProtocolVersionTLSv122018);
        }
        return @(AWSCloudfrontMinimumProtocolVersionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontMinimumProtocolVersionSSLv3:
                return @"SSLv3";
            case AWSCloudfrontMinimumProtocolVersionTLSv1:
                return @"TLSv1";
            case AWSCloudfrontMinimumProtocolVersionTLSv12016:
                return @"TLSv1_2016";
            case AWSCloudfrontMinimumProtocolVersionTLSv112016:
                return @"TLSv1.1_2016";
            case AWSCloudfrontMinimumProtocolVersionTLSv122018:
                return @"TLSv1.2_2018";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)SSLSupportMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"sni-only"] == NSOrderedSame) {
            return @(AWSCloudfrontSSLSupportMethodSniOnly);
        }
        if ([value caseInsensitiveCompare:@"vip"] == NSOrderedSame) {
            return @(AWSCloudfrontSSLSupportMethodVip);
        }
        return @(AWSCloudfrontSSLSupportMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCloudfrontSSLSupportMethodSniOnly:
                return @"sni-only";
            case AWSCloudfrontSSLSupportMethodVip:
                return @"vip";
            default:
                return nil;
        }
    }];
}

@end
