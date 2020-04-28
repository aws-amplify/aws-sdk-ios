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

#import "AWSapi.ecrModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSapi.ecrErrorDomain = @"com.amazonaws.AWSapi.ecrErrorDomain";

@implementation AWSapi.ecrAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

@end

@implementation AWSapi.ecrAuthorizationData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizationToken" : @"authorizationToken",
             @"expiresAt" : @"expiresAt",
             @"proxyEndpoint" : @"proxyEndpoint",
             };
}

+ (NSValueTransformer *)expiresAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.ecrBatchCheckLayerAvailabilityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerDigests" : @"layerDigests",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrBatchCheckLayerAvailabilityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failures" : @"failures",
             @"layers" : @"layers",
             };
}

+ (NSValueTransformer *)failuresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrLayerFailure class]];
}

+ (NSValueTransformer *)layersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrLayer class]];
}

@end

@implementation AWSapi.ecrBatchDeleteImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageIds" : @"imageIds",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrImageIdentifier class]];
}

@end

@implementation AWSapi.ecrBatchDeleteImageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failures" : @"failures",
             @"imageIds" : @"imageIds",
             };
}

+ (NSValueTransformer *)failuresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrImageFailure class]];
}

+ (NSValueTransformer *)imageIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrImageIdentifier class]];
}

@end

@implementation AWSapi.ecrBatchGetImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptedMediaTypes" : @"acceptedMediaTypes",
             @"imageIds" : @"imageIds",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrImageIdentifier class]];
}

@end

@implementation AWSapi.ecrBatchGetImageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failures" : @"failures",
             @"images" : @"images",
             };
}

+ (NSValueTransformer *)failuresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrImageFailure class]];
}

+ (NSValueTransformer *)imagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrImage class]];
}

@end

@implementation AWSapi.ecrCompleteLayerUploadRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerDigests" : @"layerDigests",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             @"uploadId" : @"uploadId",
             };
}

@end

@implementation AWSapi.ecrCompleteLayerUploadResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerDigest" : @"layerDigest",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             @"uploadId" : @"uploadId",
             };
}

@end

@implementation AWSapi.ecrCreateRepositoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageScanningConfiguration" : @"imageScanningConfiguration",
             @"imageTagMutability" : @"imageTagMutability",
             @"repositoryName" : @"repositoryName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)imageScanningConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageScanningConfiguration class]];
}

+ (NSValueTransformer *)imageTagMutabilityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MUTABLE"] == NSOrderedSame) {
            return @(AWSapi.ecrImageTagMutabilityMutable);
        }
        if ([value caseInsensitiveCompare:@"IMMUTABLE"] == NSOrderedSame) {
            return @(AWSapi.ecrImageTagMutabilityImmutable);
        }
        return @(AWSapi.ecrImageTagMutabilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrImageTagMutabilityMutable:
                return @"MUTABLE";
            case AWSapi.ecrImageTagMutabilityImmutable:
                return @"IMMUTABLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrTag class]];
}

@end

@implementation AWSapi.ecrCreateRepositoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repository" : @"repository",
             };
}

+ (NSValueTransformer *)repositoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrRepository class]];
}

@end

@implementation AWSapi.ecrDeleteLifecyclePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrDeleteLifecyclePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastEvaluatedAt" : @"lastEvaluatedAt",
             @"lifecyclePolicyText" : @"lifecyclePolicyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)lastEvaluatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.ecrDeleteRepositoryPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrDeleteRepositoryPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyText" : @"policyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrDeleteRepositoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"force" : @"force",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrDeleteRepositoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repository" : @"repository",
             };
}

+ (NSValueTransformer *)repositoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrRepository class]];
}

@end

@implementation AWSapi.ecrDescribeImageScanFindingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"imageId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageIdentifier class]];
}

@end

@implementation AWSapi.ecrDescribeImageScanFindingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"imageId",
             @"imageScanFindings" : @"imageScanFindings",
             @"imageScanStatus" : @"imageScanStatus",
             @"nextToken" : @"nextToken",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageIdentifier class]];
}

+ (NSValueTransformer *)imageScanFindingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageScanFindings class]];
}

+ (NSValueTransformer *)imageScanStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageScanStatus class]];
}

@end

@implementation AWSapi.ecrDescribeImagesFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagStatus" : @"tagStatus",
             };
}

+ (NSValueTransformer *)tagStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TAGGED"] == NSOrderedSame) {
            return @(AWSapi.ecrTagStatusTagged);
        }
        if ([value caseInsensitiveCompare:@"UNTAGGED"] == NSOrderedSame) {
            return @(AWSapi.ecrTagStatusUntagged);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSapi.ecrTagStatusAny);
        }
        return @(AWSapi.ecrTagStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrTagStatusTagged:
                return @"TAGGED";
            case AWSapi.ecrTagStatusUntagged:
                return @"UNTAGGED";
            case AWSapi.ecrTagStatusAny:
                return @"ANY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.ecrDescribeImagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             @"imageIds" : @"imageIds",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrDescribeImagesFilter class]];
}

+ (NSValueTransformer *)imageIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrImageIdentifier class]];
}

@end

@implementation AWSapi.ecrDescribeImagesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageDetails" : @"imageDetails",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)imageDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrImageDetail class]];
}

@end

@implementation AWSapi.ecrDescribeRepositoriesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"registryId" : @"registryId",
             @"repositoryNames" : @"repositoryNames",
             };
}

@end

@implementation AWSapi.ecrDescribeRepositoriesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"repositories" : @"repositories",
             };
}

+ (NSValueTransformer *)repositoriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrRepository class]];
}

@end

@implementation AWSapi.ecrGetAuthorizationTokenRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryIds" : @"registryIds",
             };
}

@end

@implementation AWSapi.ecrGetAuthorizationTokenResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizationData" : @"authorizationData",
             };
}

+ (NSValueTransformer *)authorizationDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrAuthorizationData class]];
}

@end

@implementation AWSapi.ecrGetDownloadUrlForLayerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerDigest" : @"layerDigest",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrGetDownloadUrlForLayerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"downloadUrl" : @"downloadUrl",
             @"layerDigest" : @"layerDigest",
             };
}

@end

@implementation AWSapi.ecrGetLifecyclePolicyPreviewRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             @"imageIds" : @"imageIds",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrLifecyclePolicyPreviewFilter class]];
}

+ (NSValueTransformer *)imageIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrImageIdentifier class]];
}

@end

@implementation AWSapi.ecrGetLifecyclePolicyPreviewResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecyclePolicyText" : @"lifecyclePolicyText",
             @"nextToken" : @"nextToken",
             @"previewResults" : @"previewResults",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             @"status" : @"status",
             @"summary" : @"summary",
             };
}

+ (NSValueTransformer *)previewResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrLifecyclePolicyPreviewResult class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSapi.ecrLifecyclePolicyPreviewStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSapi.ecrLifecyclePolicyPreviewStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSapi.ecrLifecyclePolicyPreviewStatusExpired);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapi.ecrLifecyclePolicyPreviewStatusFailed);
        }
        return @(AWSapi.ecrLifecyclePolicyPreviewStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrLifecyclePolicyPreviewStatusInProgress:
                return @"IN_PROGRESS";
            case AWSapi.ecrLifecyclePolicyPreviewStatusComplete:
                return @"COMPLETE";
            case AWSapi.ecrLifecyclePolicyPreviewStatusExpired:
                return @"EXPIRED";
            case AWSapi.ecrLifecyclePolicyPreviewStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)summaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrLifecyclePolicyPreviewSummary class]];
}

@end

@implementation AWSapi.ecrGetLifecyclePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrGetLifecyclePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastEvaluatedAt" : @"lastEvaluatedAt",
             @"lifecyclePolicyText" : @"lifecyclePolicyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)lastEvaluatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.ecrGetRepositoryPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrGetRepositoryPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyText" : @"policyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"imageId",
             @"imageManifest" : @"imageManifest",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageIdentifier class]];
}

@end

@implementation AWSapi.ecrImageDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageDigest" : @"imageDigest",
             @"imagePushedAt" : @"imagePushedAt",
             @"imageScanFindingsSummary" : @"imageScanFindingsSummary",
             @"imageScanStatus" : @"imageScanStatus",
             @"imageSizeInBytes" : @"imageSizeInBytes",
             @"imageTags" : @"imageTags",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imagePushedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)imageScanFindingsSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageScanFindingsSummary class]];
}

+ (NSValueTransformer *)imageScanStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageScanStatus class]];
}

@end

@implementation AWSapi.ecrImageFailure

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureCode" : @"failureCode",
             @"failureReason" : @"failureReason",
             @"imageId" : @"imageId",
             };
}

+ (NSValueTransformer *)failureCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InvalidImageDigest"] == NSOrderedSame) {
            return @(AWSapi.ecrImageFailureCodeInvalidImageDigest);
        }
        if ([value caseInsensitiveCompare:@"InvalidImageTag"] == NSOrderedSame) {
            return @(AWSapi.ecrImageFailureCodeInvalidImageTag);
        }
        if ([value caseInsensitiveCompare:@"ImageTagDoesNotMatchDigest"] == NSOrderedSame) {
            return @(AWSapi.ecrImageFailureCodeImageTagDoesNotMatchDigest);
        }
        if ([value caseInsensitiveCompare:@"ImageNotFound"] == NSOrderedSame) {
            return @(AWSapi.ecrImageFailureCodeImageNotFound);
        }
        if ([value caseInsensitiveCompare:@"MissingDigestAndTag"] == NSOrderedSame) {
            return @(AWSapi.ecrImageFailureCodeMissingDigestAndTag);
        }
        if ([value caseInsensitiveCompare:@"ImageReferencedByManifestList"] == NSOrderedSame) {
            return @(AWSapi.ecrImageFailureCodeImageReferencedByManifestList);
        }
        return @(AWSapi.ecrImageFailureCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrImageFailureCodeInvalidImageDigest:
                return @"InvalidImageDigest";
            case AWSapi.ecrImageFailureCodeInvalidImageTag:
                return @"InvalidImageTag";
            case AWSapi.ecrImageFailureCodeImageTagDoesNotMatchDigest:
                return @"ImageTagDoesNotMatchDigest";
            case AWSapi.ecrImageFailureCodeImageNotFound:
                return @"ImageNotFound";
            case AWSapi.ecrImageFailureCodeMissingDigestAndTag:
                return @"MissingDigestAndTag";
            case AWSapi.ecrImageFailureCodeImageReferencedByManifestList:
                return @"ImageReferencedByManifestList";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)imageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageIdentifier class]];
}

@end

@implementation AWSapi.ecrImageIdentifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageDigest" : @"imageDigest",
             @"imageTag" : @"imageTag",
             };
}

@end

@implementation AWSapi.ecrImageScanFinding

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"attributes",
             @"detail" : @"description",
             @"name" : @"name",
             @"severity" : @"severity",
             @"uri" : @"uri",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrAttribute class]];
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSapi.ecrFindingSeverityInformational);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSapi.ecrFindingSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSapi.ecrFindingSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSapi.ecrFindingSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSapi.ecrFindingSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"UNDEFINED"] == NSOrderedSame) {
            return @(AWSapi.ecrFindingSeverityUndefined);
        }
        return @(AWSapi.ecrFindingSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrFindingSeverityInformational:
                return @"INFORMATIONAL";
            case AWSapi.ecrFindingSeverityLow:
                return @"LOW";
            case AWSapi.ecrFindingSeverityMedium:
                return @"MEDIUM";
            case AWSapi.ecrFindingSeverityHigh:
                return @"HIGH";
            case AWSapi.ecrFindingSeverityCritical:
                return @"CRITICAL";
            case AWSapi.ecrFindingSeverityUndefined:
                return @"UNDEFINED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.ecrImageScanFindings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingSeverityCounts" : @"findingSeverityCounts",
             @"findings" : @"findings",
             @"imageScanCompletedAt" : @"imageScanCompletedAt",
             @"vulnerabilitySourceUpdatedAt" : @"vulnerabilitySourceUpdatedAt",
             };
}

+ (NSValueTransformer *)findingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrImageScanFinding class]];
}

+ (NSValueTransformer *)imageScanCompletedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vulnerabilitySourceUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.ecrImageScanFindingsSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingSeverityCounts" : @"findingSeverityCounts",
             @"imageScanCompletedAt" : @"imageScanCompletedAt",
             @"vulnerabilitySourceUpdatedAt" : @"vulnerabilitySourceUpdatedAt",
             };
}

+ (NSValueTransformer *)imageScanCompletedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vulnerabilitySourceUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.ecrImageScanStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSapi.ecrScanStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSapi.ecrScanStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapi.ecrScanStatusFailed);
        }
        return @(AWSapi.ecrScanStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrScanStatusInProgress:
                return @"IN_PROGRESS";
            case AWSapi.ecrScanStatusComplete:
                return @"COMPLETE";
            case AWSapi.ecrScanStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.ecrImageScanningConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scanOnPush" : @"scanOnPush",
             };
}

@end

@implementation AWSapi.ecrInitiateLayerUploadRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrInitiateLayerUploadResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"partSize" : @"partSize",
             @"uploadId" : @"uploadId",
             };
}

@end

@implementation AWSapi.ecrLayer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerAvailability" : @"layerAvailability",
             @"layerDigest" : @"layerDigest",
             @"layerSize" : @"layerSize",
             @"mediaType" : @"mediaType",
             };
}

+ (NSValueTransformer *)layerAvailabilityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSapi.ecrLayerAvailabilityAvailable);
        }
        if ([value caseInsensitiveCompare:@"UNAVAILABLE"] == NSOrderedSame) {
            return @(AWSapi.ecrLayerAvailabilityUnavailable);
        }
        return @(AWSapi.ecrLayerAvailabilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrLayerAvailabilityAvailable:
                return @"AVAILABLE";
            case AWSapi.ecrLayerAvailabilityUnavailable:
                return @"UNAVAILABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.ecrLayerFailure

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureCode" : @"failureCode",
             @"failureReason" : @"failureReason",
             @"layerDigest" : @"layerDigest",
             };
}

+ (NSValueTransformer *)failureCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InvalidLayerDigest"] == NSOrderedSame) {
            return @(AWSapi.ecrLayerFailureCodeInvalidLayerDigest);
        }
        if ([value caseInsensitiveCompare:@"MissingLayerDigest"] == NSOrderedSame) {
            return @(AWSapi.ecrLayerFailureCodeMissingLayerDigest);
        }
        return @(AWSapi.ecrLayerFailureCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrLayerFailureCodeInvalidLayerDigest:
                return @"InvalidLayerDigest";
            case AWSapi.ecrLayerFailureCodeMissingLayerDigest:
                return @"MissingLayerDigest";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.ecrLifecyclePolicyPreviewFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagStatus" : @"tagStatus",
             };
}

+ (NSValueTransformer *)tagStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TAGGED"] == NSOrderedSame) {
            return @(AWSapi.ecrTagStatusTagged);
        }
        if ([value caseInsensitiveCompare:@"UNTAGGED"] == NSOrderedSame) {
            return @(AWSapi.ecrTagStatusUntagged);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSapi.ecrTagStatusAny);
        }
        return @(AWSapi.ecrTagStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrTagStatusTagged:
                return @"TAGGED";
            case AWSapi.ecrTagStatusUntagged:
                return @"UNTAGGED";
            case AWSapi.ecrTagStatusAny:
                return @"ANY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.ecrLifecyclePolicyPreviewResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"action",
             @"appliedRulePriority" : @"appliedRulePriority",
             @"imageDigest" : @"imageDigest",
             @"imagePushedAt" : @"imagePushedAt",
             @"imageTags" : @"imageTags",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrLifecyclePolicyRuleAction class]];
}

+ (NSValueTransformer *)imagePushedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSapi.ecrLifecyclePolicyPreviewSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expiringImageTotalCount" : @"expiringImageTotalCount",
             };
}

@end

@implementation AWSapi.ecrLifecyclePolicyRuleAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXPIRE"] == NSOrderedSame) {
            return @(AWSapi.ecrImageActionTypeExpire);
        }
        return @(AWSapi.ecrImageActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrImageActionTypeExpire:
                return @"EXPIRE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.ecrListImagesFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagStatus" : @"tagStatus",
             };
}

+ (NSValueTransformer *)tagStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TAGGED"] == NSOrderedSame) {
            return @(AWSapi.ecrTagStatusTagged);
        }
        if ([value caseInsensitiveCompare:@"UNTAGGED"] == NSOrderedSame) {
            return @(AWSapi.ecrTagStatusUntagged);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSapi.ecrTagStatusAny);
        }
        return @(AWSapi.ecrTagStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrTagStatusTagged:
                return @"TAGGED";
            case AWSapi.ecrTagStatusUntagged:
                return @"UNTAGGED";
            case AWSapi.ecrTagStatusAny:
                return @"ANY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.ecrListImagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"filter",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrListImagesFilter class]];
}

@end

@implementation AWSapi.ecrListImagesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageIds" : @"imageIds",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)imageIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrImageIdentifier class]];
}

@end

@implementation AWSapi.ecrListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSapi.ecrListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrTag class]];
}

@end

@implementation AWSapi.ecrPutImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageManifest" : @"imageManifest",
             @"imageTag" : @"imageTag",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrPutImageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"image" : @"image",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImage class]];
}

@end

@implementation AWSapi.ecrPutImageScanningConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageScanningConfiguration" : @"imageScanningConfiguration",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageScanningConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageScanningConfiguration class]];
}

@end

@implementation AWSapi.ecrPutImageScanningConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageScanningConfiguration" : @"imageScanningConfiguration",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageScanningConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageScanningConfiguration class]];
}

@end

@implementation AWSapi.ecrPutImageTagMutabilityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageTagMutability" : @"imageTagMutability",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageTagMutabilityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MUTABLE"] == NSOrderedSame) {
            return @(AWSapi.ecrImageTagMutabilityMutable);
        }
        if ([value caseInsensitiveCompare:@"IMMUTABLE"] == NSOrderedSame) {
            return @(AWSapi.ecrImageTagMutabilityImmutable);
        }
        return @(AWSapi.ecrImageTagMutabilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrImageTagMutabilityMutable:
                return @"MUTABLE";
            case AWSapi.ecrImageTagMutabilityImmutable:
                return @"IMMUTABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.ecrPutImageTagMutabilityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageTagMutability" : @"imageTagMutability",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageTagMutabilityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MUTABLE"] == NSOrderedSame) {
            return @(AWSapi.ecrImageTagMutabilityMutable);
        }
        if ([value caseInsensitiveCompare:@"IMMUTABLE"] == NSOrderedSame) {
            return @(AWSapi.ecrImageTagMutabilityImmutable);
        }
        return @(AWSapi.ecrImageTagMutabilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrImageTagMutabilityMutable:
                return @"MUTABLE";
            case AWSapi.ecrImageTagMutabilityImmutable:
                return @"IMMUTABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.ecrPutLifecyclePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecyclePolicyText" : @"lifecyclePolicyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrPutLifecyclePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecyclePolicyText" : @"lifecyclePolicyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrRepository

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAt" : @"createdAt",
             @"imageScanningConfiguration" : @"imageScanningConfiguration",
             @"imageTagMutability" : @"imageTagMutability",
             @"registryId" : @"registryId",
             @"repositoryArn" : @"repositoryArn",
             @"repositoryName" : @"repositoryName",
             @"repositoryUri" : @"repositoryUri",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)imageScanningConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageScanningConfiguration class]];
}

+ (NSValueTransformer *)imageTagMutabilityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MUTABLE"] == NSOrderedSame) {
            return @(AWSapi.ecrImageTagMutabilityMutable);
        }
        if ([value caseInsensitiveCompare:@"IMMUTABLE"] == NSOrderedSame) {
            return @(AWSapi.ecrImageTagMutabilityImmutable);
        }
        return @(AWSapi.ecrImageTagMutabilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrImageTagMutabilityMutable:
                return @"MUTABLE";
            case AWSapi.ecrImageTagMutabilityImmutable:
                return @"IMMUTABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.ecrSetRepositoryPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"force" : @"force",
             @"policyText" : @"policyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrSetRepositoryPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyText" : @"policyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrStartImageScanRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"imageId",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageIdentifier class]];
}

@end

@implementation AWSapi.ecrStartImageScanResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"imageId",
             @"imageScanStatus" : @"imageScanStatus",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageIdentifier class]];
}

+ (NSValueTransformer *)imageScanStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.ecrImageScanStatus class]];
}

@end

@implementation AWSapi.ecrStartLifecyclePolicyPreviewRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecyclePolicyText" : @"lifecyclePolicyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSapi.ecrStartLifecyclePolicyPreviewResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecyclePolicyText" : @"lifecyclePolicyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSapi.ecrLifecyclePolicyPreviewStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSapi.ecrLifecyclePolicyPreviewStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSapi.ecrLifecyclePolicyPreviewStatusExpired);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSapi.ecrLifecyclePolicyPreviewStatusFailed);
        }
        return @(AWSapi.ecrLifecyclePolicyPreviewStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.ecrLifecyclePolicyPreviewStatusInProgress:
                return @"IN_PROGRESS";
            case AWSapi.ecrLifecyclePolicyPreviewStatusComplete:
                return @"COMPLETE";
            case AWSapi.ecrLifecyclePolicyPreviewStatusExpired:
                return @"EXPIRED";
            case AWSapi.ecrLifecyclePolicyPreviewStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.ecrTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSapi.ecrTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.ecrTag class]];
}

@end

@implementation AWSapi.ecrTagResourceResponse

@end

@implementation AWSapi.ecrUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSapi.ecrUntagResourceResponse

@end

@implementation AWSapi.ecrUploadLayerPartRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerPartBlob" : @"layerPartBlob",
             @"partFirstByte" : @"partFirstByte",
             @"partLastByte" : @"partLastByte",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             @"uploadId" : @"uploadId",
             };
}

@end

@implementation AWSapi.ecrUploadLayerPartResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastByteReceived" : @"lastByteReceived",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             @"uploadId" : @"uploadId",
             };
}

@end
