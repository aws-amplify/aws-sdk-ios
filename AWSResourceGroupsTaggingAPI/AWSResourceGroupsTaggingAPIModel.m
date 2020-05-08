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

#import "AWSResourceGroupsTaggingAPIModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSResourceGroupsTaggingAPIErrorDomain = @"com.amazonaws.AWSResourceGroupsTaggingAPIErrorDomain";

@implementation AWSResourceGroupsTaggingAPIComplianceDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceStatus" : @"ComplianceStatus",
             @"keysWithNoncompliantValues" : @"KeysWithNoncompliantValues",
             @"noncompliantKeys" : @"NoncompliantKeys",
             };
}

@end

@implementation AWSResourceGroupsTaggingAPIDescribeReportCreationInput

@end

@implementation AWSResourceGroupsTaggingAPIDescribeReportCreationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorMessage" : @"ErrorMessage",
             @"s3Location" : @"S3Location",
             @"status" : @"Status",
             };
}

@end

@implementation AWSResourceGroupsTaggingAPIFailureInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"statusCode" : @"StatusCode",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"InternalServiceException"] == NSOrderedSame) {
            return @(AWSResourceGroupsTaggingAPIErrorCodeInternalServiceException);
        }
        if ([value caseInsensitiveCompare:@"InvalidParameterException"] == NSOrderedSame) {
            return @(AWSResourceGroupsTaggingAPIErrorCodeInvalidParameterException);
        }
        return @(AWSResourceGroupsTaggingAPIErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSResourceGroupsTaggingAPIErrorCodeInternalServiceException:
                return @"InternalServiceException";
            case AWSResourceGroupsTaggingAPIErrorCodeInvalidParameterException:
                return @"InvalidParameterException";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSResourceGroupsTaggingAPIGetComplianceSummaryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupBy" : @"GroupBy",
             @"maxResults" : @"MaxResults",
             @"paginationToken" : @"PaginationToken",
             @"regionFilters" : @"RegionFilters",
             @"resourceTypeFilters" : @"ResourceTypeFilters",
             @"tagKeyFilters" : @"TagKeyFilters",
             @"targetIdFilters" : @"TargetIdFilters",
             };
}

@end

@implementation AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"paginationToken" : @"PaginationToken",
             @"summaryList" : @"SummaryList",
             };
}

+ (NSValueTransformer *)summaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSResourceGroupsTaggingAPISummary class]];
}

@end

@implementation AWSResourceGroupsTaggingAPIGetResourcesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"excludeCompliantResources" : @"ExcludeCompliantResources",
             @"includeComplianceDetails" : @"IncludeComplianceDetails",
             @"paginationToken" : @"PaginationToken",
             @"resourceTypeFilters" : @"ResourceTypeFilters",
             @"resourcesPerPage" : @"ResourcesPerPage",
             @"tagFilters" : @"TagFilters",
             @"tagsPerPage" : @"TagsPerPage",
             };
}

+ (NSValueTransformer *)tagFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSResourceGroupsTaggingAPITagFilter class]];
}

@end

@implementation AWSResourceGroupsTaggingAPIGetResourcesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"paginationToken" : @"PaginationToken",
             @"resourceTagMappingList" : @"ResourceTagMappingList",
             };
}

+ (NSValueTransformer *)resourceTagMappingListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSResourceGroupsTaggingAPIResourceTagMapping class]];
}

@end

@implementation AWSResourceGroupsTaggingAPIGetTagKeysInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"paginationToken" : @"PaginationToken",
             };
}

@end

@implementation AWSResourceGroupsTaggingAPIGetTagKeysOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"paginationToken" : @"PaginationToken",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSResourceGroupsTaggingAPIGetTagValuesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"paginationToken" : @"PaginationToken",
             };
}

@end

@implementation AWSResourceGroupsTaggingAPIGetTagValuesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"paginationToken" : @"PaginationToken",
             @"tagValues" : @"TagValues",
             };
}

@end

@implementation AWSResourceGroupsTaggingAPIResourceTagMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"complianceDetails" : @"ComplianceDetails",
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)complianceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSResourceGroupsTaggingAPIComplianceDetails class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSResourceGroupsTaggingAPITag class]];
}

@end

@implementation AWSResourceGroupsTaggingAPIStartReportCreationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             };
}

@end

@implementation AWSResourceGroupsTaggingAPIStartReportCreationOutput

@end

@implementation AWSResourceGroupsTaggingAPISummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastUpdated" : @"LastUpdated",
             @"nonCompliantResources" : @"NonCompliantResources",
             @"region" : @"Region",
             @"resourceType" : @"ResourceType",
             @"targetId" : @"TargetId",
             @"targetIdType" : @"TargetIdType",
             };
}

+ (NSValueTransformer *)targetIdTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCOUNT"] == NSOrderedSame) {
            return @(AWSResourceGroupsTaggingAPITargetIdTypeAccount);
        }
        if ([value caseInsensitiveCompare:@"OU"] == NSOrderedSame) {
            return @(AWSResourceGroupsTaggingAPITargetIdTypeOu);
        }
        if ([value caseInsensitiveCompare:@"ROOT"] == NSOrderedSame) {
            return @(AWSResourceGroupsTaggingAPITargetIdTypeRoot);
        }
        return @(AWSResourceGroupsTaggingAPITargetIdTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSResourceGroupsTaggingAPITargetIdTypeAccount:
                return @"ACCOUNT";
            case AWSResourceGroupsTaggingAPITargetIdTypeOu:
                return @"OU";
            case AWSResourceGroupsTaggingAPITargetIdTypeRoot:
                return @"ROOT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSResourceGroupsTaggingAPITag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSResourceGroupsTaggingAPITagFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSResourceGroupsTaggingAPITagResourcesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARNList" : @"ResourceARNList",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSResourceGroupsTaggingAPITagResourcesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedResourcesMap" : @"FailedResourcesMap",
             };
}

+ (NSValueTransformer *)failedResourcesMapJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSResourceGroupsTaggingAPIFailureInfo class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSResourceGroupsTaggingAPIUntagResourcesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARNList" : @"ResourceARNList",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSResourceGroupsTaggingAPIUntagResourcesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedResourcesMap" : @"FailedResourcesMap",
             };
}

+ (NSValueTransformer *)failedResourcesMapJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSResourceGroupsTaggingAPIFailureInfo class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end
