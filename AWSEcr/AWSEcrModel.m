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

#import "AWSEcrModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSEcrErrorDomain = @"com.amazonaws.AWSEcrErrorDomain";

@implementation AWSEcrAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

@end

@implementation AWSEcrAuthorizationData

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

@implementation AWSEcrBatchCheckLayerAvailabilityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerDigests" : @"layerDigests",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrBatchCheckLayerAvailabilityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failures" : @"failures",
             @"layers" : @"layers",
             };
}

+ (NSValueTransformer *)failuresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrLayerFailure class]];
}

+ (NSValueTransformer *)layersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrLayer class]];
}

@end

@implementation AWSEcrBatchDeleteImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageIds" : @"imageIds",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrImageIdentifier class]];
}

@end

@implementation AWSEcrBatchDeleteImageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failures" : @"failures",
             @"imageIds" : @"imageIds",
             };
}

+ (NSValueTransformer *)failuresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrImageFailure class]];
}

+ (NSValueTransformer *)imageIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrImageIdentifier class]];
}

@end

@implementation AWSEcrBatchGetImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptedMediaTypes" : @"acceptedMediaTypes",
             @"imageIds" : @"imageIds",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrImageIdentifier class]];
}

@end

@implementation AWSEcrBatchGetImageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failures" : @"failures",
             @"images" : @"images",
             };
}

+ (NSValueTransformer *)failuresJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrImageFailure class]];
}

+ (NSValueTransformer *)imagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrImage class]];
}

@end

@implementation AWSEcrCompleteLayerUploadRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerDigests" : @"layerDigests",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             @"uploadId" : @"uploadId",
             };
}

@end

@implementation AWSEcrCompleteLayerUploadResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerDigest" : @"layerDigest",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             @"uploadId" : @"uploadId",
             };
}

@end

@implementation AWSEcrCreateRepositoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageScanningConfiguration" : @"imageScanningConfiguration",
             @"imageTagMutability" : @"imageTagMutability",
             @"repositoryName" : @"repositoryName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)imageScanningConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageScanningConfiguration class]];
}

+ (NSValueTransformer *)imageTagMutabilityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MUTABLE"] == NSOrderedSame) {
            return @(AWSEcrImageTagMutabilityMutable);
        }
        if ([value caseInsensitiveCompare:@"IMMUTABLE"] == NSOrderedSame) {
            return @(AWSEcrImageTagMutabilityImmutable);
        }
        return @(AWSEcrImageTagMutabilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrImageTagMutabilityMutable:
                return @"MUTABLE";
            case AWSEcrImageTagMutabilityImmutable:
                return @"IMMUTABLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrTag class]];
}

@end

@implementation AWSEcrCreateRepositoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repository" : @"repository",
             };
}

+ (NSValueTransformer *)repositoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrRepository class]];
}

@end

@implementation AWSEcrDeleteLifecyclePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrDeleteLifecyclePolicyResponse

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

@implementation AWSEcrDeleteRepositoryPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrDeleteRepositoryPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyText" : @"policyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrDeleteRepositoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"force" : @"force",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrDeleteRepositoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repository" : @"repository",
             };
}

+ (NSValueTransformer *)repositoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrRepository class]];
}

@end

@implementation AWSEcrDescribeImageScanFindingsRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageIdentifier class]];
}

@end

@implementation AWSEcrDescribeImageScanFindingsResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageIdentifier class]];
}

+ (NSValueTransformer *)imageScanFindingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageScanFindings class]];
}

+ (NSValueTransformer *)imageScanStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageScanStatus class]];
}

@end

@implementation AWSEcrDescribeImagesFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagStatus" : @"tagStatus",
             };
}

+ (NSValueTransformer *)tagStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TAGGED"] == NSOrderedSame) {
            return @(AWSEcrTagStatusTagged);
        }
        if ([value caseInsensitiveCompare:@"UNTAGGED"] == NSOrderedSame) {
            return @(AWSEcrTagStatusUntagged);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSEcrTagStatusAny);
        }
        return @(AWSEcrTagStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrTagStatusTagged:
                return @"TAGGED";
            case AWSEcrTagStatusUntagged:
                return @"UNTAGGED";
            case AWSEcrTagStatusAny:
                return @"ANY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEcrDescribeImagesRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrDescribeImagesFilter class]];
}

+ (NSValueTransformer *)imageIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrImageIdentifier class]];
}

@end

@implementation AWSEcrDescribeImagesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageDetails" : @"imageDetails",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)imageDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrImageDetail class]];
}

@end

@implementation AWSEcrDescribeRepositoriesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"registryId" : @"registryId",
             @"repositoryNames" : @"repositoryNames",
             };
}

@end

@implementation AWSEcrDescribeRepositoriesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"repositories" : @"repositories",
             };
}

+ (NSValueTransformer *)repositoriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrRepository class]];
}

@end

@implementation AWSEcrGetAuthorizationTokenRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryIds" : @"registryIds",
             };
}

@end

@implementation AWSEcrGetAuthorizationTokenResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizationData" : @"authorizationData",
             };
}

+ (NSValueTransformer *)authorizationDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrAuthorizationData class]];
}

@end

@implementation AWSEcrGetDownloadUrlForLayerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"layerDigest" : @"layerDigest",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrGetDownloadUrlForLayerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"downloadUrl" : @"downloadUrl",
             @"layerDigest" : @"layerDigest",
             };
}

@end

@implementation AWSEcrGetLifecyclePolicyPreviewRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrLifecyclePolicyPreviewFilter class]];
}

+ (NSValueTransformer *)imageIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrImageIdentifier class]];
}

@end

@implementation AWSEcrGetLifecyclePolicyPreviewResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrLifecyclePolicyPreviewResult class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSEcrLifecyclePolicyPreviewStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSEcrLifecyclePolicyPreviewStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSEcrLifecyclePolicyPreviewStatusExpired);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSEcrLifecyclePolicyPreviewStatusFailed);
        }
        return @(AWSEcrLifecyclePolicyPreviewStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrLifecyclePolicyPreviewStatusInProgress:
                return @"IN_PROGRESS";
            case AWSEcrLifecyclePolicyPreviewStatusComplete:
                return @"COMPLETE";
            case AWSEcrLifecyclePolicyPreviewStatusExpired:
                return @"EXPIRED";
            case AWSEcrLifecyclePolicyPreviewStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)summaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrLifecyclePolicyPreviewSummary class]];
}

@end

@implementation AWSEcrGetLifecyclePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrGetLifecyclePolicyResponse

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

@implementation AWSEcrGetRepositoryPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrGetRepositoryPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyText" : @"policyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"imageId",
             @"imageManifest" : @"imageManifest",
             @"imageManifestMediaType" : @"imageManifestMediaType",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageIdentifier class]];
}

@end

@implementation AWSEcrImageDetail

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageScanFindingsSummary class]];
}

+ (NSValueTransformer *)imageScanStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageScanStatus class]];
}

@end

@implementation AWSEcrImageFailure

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
            return @(AWSEcrImageFailureCodeInvalidImageDigest);
        }
        if ([value caseInsensitiveCompare:@"InvalidImageTag"] == NSOrderedSame) {
            return @(AWSEcrImageFailureCodeInvalidImageTag);
        }
        if ([value caseInsensitiveCompare:@"ImageTagDoesNotMatchDigest"] == NSOrderedSame) {
            return @(AWSEcrImageFailureCodeImageTagDoesNotMatchDigest);
        }
        if ([value caseInsensitiveCompare:@"ImageNotFound"] == NSOrderedSame) {
            return @(AWSEcrImageFailureCodeImageNotFound);
        }
        if ([value caseInsensitiveCompare:@"MissingDigestAndTag"] == NSOrderedSame) {
            return @(AWSEcrImageFailureCodeMissingDigestAndTag);
        }
        if ([value caseInsensitiveCompare:@"ImageReferencedByManifestList"] == NSOrderedSame) {
            return @(AWSEcrImageFailureCodeImageReferencedByManifestList);
        }
        return @(AWSEcrImageFailureCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrImageFailureCodeInvalidImageDigest:
                return @"InvalidImageDigest";
            case AWSEcrImageFailureCodeInvalidImageTag:
                return @"InvalidImageTag";
            case AWSEcrImageFailureCodeImageTagDoesNotMatchDigest:
                return @"ImageTagDoesNotMatchDigest";
            case AWSEcrImageFailureCodeImageNotFound:
                return @"ImageNotFound";
            case AWSEcrImageFailureCodeMissingDigestAndTag:
                return @"MissingDigestAndTag";
            case AWSEcrImageFailureCodeImageReferencedByManifestList:
                return @"ImageReferencedByManifestList";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)imageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageIdentifier class]];
}

@end

@implementation AWSEcrImageIdentifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageDigest" : @"imageDigest",
             @"imageTag" : @"imageTag",
             };
}

@end

@implementation AWSEcrImageScanFinding

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrAttribute class]];
}

+ (NSValueTransformer *)severityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INFORMATIONAL"] == NSOrderedSame) {
            return @(AWSEcrFindingSeverityInformational);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSEcrFindingSeverityLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSEcrFindingSeverityMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSEcrFindingSeverityHigh);
        }
        if ([value caseInsensitiveCompare:@"CRITICAL"] == NSOrderedSame) {
            return @(AWSEcrFindingSeverityCritical);
        }
        if ([value caseInsensitiveCompare:@"UNDEFINED"] == NSOrderedSame) {
            return @(AWSEcrFindingSeverityUndefined);
        }
        return @(AWSEcrFindingSeverityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrFindingSeverityInformational:
                return @"INFORMATIONAL";
            case AWSEcrFindingSeverityLow:
                return @"LOW";
            case AWSEcrFindingSeverityMedium:
                return @"MEDIUM";
            case AWSEcrFindingSeverityHigh:
                return @"HIGH";
            case AWSEcrFindingSeverityCritical:
                return @"CRITICAL";
            case AWSEcrFindingSeverityUndefined:
                return @"UNDEFINED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEcrImageScanFindings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findingSeverityCounts" : @"findingSeverityCounts",
             @"findings" : @"findings",
             @"imageScanCompletedAt" : @"imageScanCompletedAt",
             @"vulnerabilitySourceUpdatedAt" : @"vulnerabilitySourceUpdatedAt",
             };
}

+ (NSValueTransformer *)findingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrImageScanFinding class]];
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

@implementation AWSEcrImageScanFindingsSummary

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

@implementation AWSEcrImageScanStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"description",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSEcrScanStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSEcrScanStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSEcrScanStatusFailed);
        }
        return @(AWSEcrScanStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrScanStatusInProgress:
                return @"IN_PROGRESS";
            case AWSEcrScanStatusComplete:
                return @"COMPLETE";
            case AWSEcrScanStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEcrImageScanningConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scanOnPush" : @"scanOnPush",
             };
}

@end

@implementation AWSEcrInitiateLayerUploadRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrInitiateLayerUploadResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"partSize" : @"partSize",
             @"uploadId" : @"uploadId",
             };
}

@end

@implementation AWSEcrLayer

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
            return @(AWSEcrLayerAvailabilityAvailable);
        }
        if ([value caseInsensitiveCompare:@"UNAVAILABLE"] == NSOrderedSame) {
            return @(AWSEcrLayerAvailabilityUnavailable);
        }
        return @(AWSEcrLayerAvailabilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrLayerAvailabilityAvailable:
                return @"AVAILABLE";
            case AWSEcrLayerAvailabilityUnavailable:
                return @"UNAVAILABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEcrLayerFailure

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
            return @(AWSEcrLayerFailureCodeInvalidLayerDigest);
        }
        if ([value caseInsensitiveCompare:@"MissingLayerDigest"] == NSOrderedSame) {
            return @(AWSEcrLayerFailureCodeMissingLayerDigest);
        }
        return @(AWSEcrLayerFailureCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrLayerFailureCodeInvalidLayerDigest:
                return @"InvalidLayerDigest";
            case AWSEcrLayerFailureCodeMissingLayerDigest:
                return @"MissingLayerDigest";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEcrLifecyclePolicyPreviewFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagStatus" : @"tagStatus",
             };
}

+ (NSValueTransformer *)tagStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TAGGED"] == NSOrderedSame) {
            return @(AWSEcrTagStatusTagged);
        }
        if ([value caseInsensitiveCompare:@"UNTAGGED"] == NSOrderedSame) {
            return @(AWSEcrTagStatusUntagged);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSEcrTagStatusAny);
        }
        return @(AWSEcrTagStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrTagStatusTagged:
                return @"TAGGED";
            case AWSEcrTagStatusUntagged:
                return @"UNTAGGED";
            case AWSEcrTagStatusAny:
                return @"ANY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEcrLifecyclePolicyPreviewResult

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrLifecyclePolicyRuleAction class]];
}

+ (NSValueTransformer *)imagePushedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSEcrLifecyclePolicyPreviewSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expiringImageTotalCount" : @"expiringImageTotalCount",
             };
}

@end

@implementation AWSEcrLifecyclePolicyRuleAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXPIRE"] == NSOrderedSame) {
            return @(AWSEcrImageActionTypeExpire);
        }
        return @(AWSEcrImageActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrImageActionTypeExpire:
                return @"EXPIRE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEcrListImagesFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagStatus" : @"tagStatus",
             };
}

+ (NSValueTransformer *)tagStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TAGGED"] == NSOrderedSame) {
            return @(AWSEcrTagStatusTagged);
        }
        if ([value caseInsensitiveCompare:@"UNTAGGED"] == NSOrderedSame) {
            return @(AWSEcrTagStatusUntagged);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSEcrTagStatusAny);
        }
        return @(AWSEcrTagStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrTagStatusTagged:
                return @"TAGGED";
            case AWSEcrTagStatusUntagged:
                return @"UNTAGGED";
            case AWSEcrTagStatusAny:
                return @"ANY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEcrListImagesRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrListImagesFilter class]];
}

@end

@implementation AWSEcrListImagesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageIds" : @"imageIds",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)imageIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrImageIdentifier class]];
}

@end

@implementation AWSEcrListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSEcrListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrTag class]];
}

@end

@implementation AWSEcrPutImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageManifest" : @"imageManifest",
             @"imageManifestMediaType" : @"imageManifestMediaType",
             @"imageTag" : @"imageTag",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrPutImageResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"image" : @"image",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImage class]];
}

@end

@implementation AWSEcrPutImageScanningConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageScanningConfiguration" : @"imageScanningConfiguration",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageScanningConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageScanningConfiguration class]];
}

@end

@implementation AWSEcrPutImageScanningConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageScanningConfiguration" : @"imageScanningConfiguration",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageScanningConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageScanningConfiguration class]];
}

@end

@implementation AWSEcrPutImageTagMutabilityRequest

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
            return @(AWSEcrImageTagMutabilityMutable);
        }
        if ([value caseInsensitiveCompare:@"IMMUTABLE"] == NSOrderedSame) {
            return @(AWSEcrImageTagMutabilityImmutable);
        }
        return @(AWSEcrImageTagMutabilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrImageTagMutabilityMutable:
                return @"MUTABLE";
            case AWSEcrImageTagMutabilityImmutable:
                return @"IMMUTABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEcrPutImageTagMutabilityResponse

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
            return @(AWSEcrImageTagMutabilityMutable);
        }
        if ([value caseInsensitiveCompare:@"IMMUTABLE"] == NSOrderedSame) {
            return @(AWSEcrImageTagMutabilityImmutable);
        }
        return @(AWSEcrImageTagMutabilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrImageTagMutabilityMutable:
                return @"MUTABLE";
            case AWSEcrImageTagMutabilityImmutable:
                return @"IMMUTABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEcrPutLifecyclePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecyclePolicyText" : @"lifecyclePolicyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrPutLifecyclePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecyclePolicyText" : @"lifecyclePolicyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrRepository

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageScanningConfiguration class]];
}

+ (NSValueTransformer *)imageTagMutabilityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MUTABLE"] == NSOrderedSame) {
            return @(AWSEcrImageTagMutabilityMutable);
        }
        if ([value caseInsensitiveCompare:@"IMMUTABLE"] == NSOrderedSame) {
            return @(AWSEcrImageTagMutabilityImmutable);
        }
        return @(AWSEcrImageTagMutabilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrImageTagMutabilityMutable:
                return @"MUTABLE";
            case AWSEcrImageTagMutabilityImmutable:
                return @"IMMUTABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEcrSetRepositoryPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"force" : @"force",
             @"policyText" : @"policyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrSetRepositoryPolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyText" : @"policyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrStartImageScanRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"imageId",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageIdentifier class]];
}

@end

@implementation AWSEcrStartImageScanResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"imageId",
             @"imageScanStatus" : @"imageScanStatus",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

+ (NSValueTransformer *)imageIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageIdentifier class]];
}

+ (NSValueTransformer *)imageScanStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEcrImageScanStatus class]];
}

@end

@implementation AWSEcrStartLifecyclePolicyPreviewRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lifecyclePolicyText" : @"lifecyclePolicyText",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             };
}

@end

@implementation AWSEcrStartLifecyclePolicyPreviewResponse

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
            return @(AWSEcrLifecyclePolicyPreviewStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSEcrLifecyclePolicyPreviewStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSEcrLifecyclePolicyPreviewStatusExpired);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSEcrLifecyclePolicyPreviewStatusFailed);
        }
        return @(AWSEcrLifecyclePolicyPreviewStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEcrLifecyclePolicyPreviewStatusInProgress:
                return @"IN_PROGRESS";
            case AWSEcrLifecyclePolicyPreviewStatusComplete:
                return @"COMPLETE";
            case AWSEcrLifecyclePolicyPreviewStatusExpired:
                return @"EXPIRED";
            case AWSEcrLifecyclePolicyPreviewStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEcrTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSEcrTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEcrTag class]];
}

@end

@implementation AWSEcrTagResourceResponse

@end

@implementation AWSEcrUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSEcrUntagResourceResponse

@end

@implementation AWSEcrUploadLayerPartRequest

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

@implementation AWSEcrUploadLayerPartResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastByteReceived" : @"lastByteReceived",
             @"registryId" : @"registryId",
             @"repositoryName" : @"repositoryName",
             @"uploadId" : @"uploadId",
             };
}

@end
