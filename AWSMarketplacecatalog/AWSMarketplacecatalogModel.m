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

#import "AWSMarketplacecatalogModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSMarketplacecatalogErrorDomain = @"com.amazonaws.AWSMarketplacecatalogErrorDomain";

@implementation AWSMarketplacecatalogCancelChangeSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalog" : @"Catalog",
             @"changeSetId" : @"ChangeSetId",
             };
}

@end

@implementation AWSMarketplacecatalogCancelChangeSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeSetArn" : @"ChangeSetArn",
             @"changeSetId" : @"ChangeSetId",
             };
}

@end

@implementation AWSMarketplacecatalogChange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeType" : @"ChangeType",
             @"details" : @"Details",
             @"entity" : @"Entity",
             };
}

+ (NSValueTransformer *)entityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMarketplacecatalogEntity class]];
}

@end

@implementation AWSMarketplacecatalogChangeSetSummaryListItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeSetArn" : @"ChangeSetArn",
             @"changeSetId" : @"ChangeSetId",
             @"changeSetName" : @"ChangeSetName",
             @"endTime" : @"EndTime",
             @"entityIdList" : @"EntityIdList",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PREPARING"] == NSOrderedSame) {
            return @(AWSMarketplacecatalogChangeStatusPreparing);
        }
        if ([value caseInsensitiveCompare:@"APPLYING"] == NSOrderedSame) {
            return @(AWSMarketplacecatalogChangeStatusApplying);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSMarketplacecatalogChangeStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSMarketplacecatalogChangeStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSMarketplacecatalogChangeStatusFailed);
        }
        return @(AWSMarketplacecatalogChangeStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMarketplacecatalogChangeStatusPreparing:
                return @"PREPARING";
            case AWSMarketplacecatalogChangeStatusApplying:
                return @"APPLYING";
            case AWSMarketplacecatalogChangeStatusSucceeded:
                return @"SUCCEEDED";
            case AWSMarketplacecatalogChangeStatusCancelled:
                return @"CANCELLED";
            case AWSMarketplacecatalogChangeStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMarketplacecatalogChangeSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeType" : @"ChangeType",
             @"details" : @"Details",
             @"entity" : @"Entity",
             @"errorDetailList" : @"ErrorDetailList",
             };
}

+ (NSValueTransformer *)entityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMarketplacecatalogEntity class]];
}

+ (NSValueTransformer *)errorDetailListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMarketplacecatalogErrorDetail class]];
}

@end

@implementation AWSMarketplacecatalogDescribeChangeSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalog" : @"Catalog",
             @"changeSetId" : @"ChangeSetId",
             };
}

@end

@implementation AWSMarketplacecatalogDescribeChangeSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeSet" : @"ChangeSet",
             @"changeSetArn" : @"ChangeSetArn",
             @"changeSetId" : @"ChangeSetId",
             @"changeSetName" : @"ChangeSetName",
             @"endTime" : @"EndTime",
             @"failureDescription" : @"FailureDescription",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)changeSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMarketplacecatalogChangeSummary class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PREPARING"] == NSOrderedSame) {
            return @(AWSMarketplacecatalogChangeStatusPreparing);
        }
        if ([value caseInsensitiveCompare:@"APPLYING"] == NSOrderedSame) {
            return @(AWSMarketplacecatalogChangeStatusApplying);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSMarketplacecatalogChangeStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSMarketplacecatalogChangeStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSMarketplacecatalogChangeStatusFailed);
        }
        return @(AWSMarketplacecatalogChangeStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMarketplacecatalogChangeStatusPreparing:
                return @"PREPARING";
            case AWSMarketplacecatalogChangeStatusApplying:
                return @"APPLYING";
            case AWSMarketplacecatalogChangeStatusSucceeded:
                return @"SUCCEEDED";
            case AWSMarketplacecatalogChangeStatusCancelled:
                return @"CANCELLED";
            case AWSMarketplacecatalogChangeStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMarketplacecatalogDescribeEntityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalog" : @"Catalog",
             @"entityId" : @"EntityId",
             };
}

@end

@implementation AWSMarketplacecatalogDescribeEntityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             @"entityArn" : @"EntityArn",
             @"entityIdentifier" : @"EntityIdentifier",
             @"entityType" : @"EntityType",
             @"lastModifiedDate" : @"LastModifiedDate",
             };
}

@end

@implementation AWSMarketplacecatalogEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Identifier",
             @"types" : @"Type",
             };
}

@end

@implementation AWSMarketplacecatalogEntitySummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityArn" : @"EntityArn",
             @"entityId" : @"EntityId",
             @"entityType" : @"EntityType",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"name" : @"Name",
             @"visibility" : @"Visibility",
             };
}

@end

@implementation AWSMarketplacecatalogErrorDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             };
}

@end

@implementation AWSMarketplacecatalogFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"valueList" : @"ValueList",
             };
}

@end

@implementation AWSMarketplacecatalogListChangeSetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalog" : @"Catalog",
             @"filterList" : @"FilterList",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sort" : @"Sort",
             };
}

+ (NSValueTransformer *)filterListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMarketplacecatalogFilter class]];
}

+ (NSValueTransformer *)sortJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMarketplacecatalogSort class]];
}

@end

@implementation AWSMarketplacecatalogListChangeSetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeSetSummaryList" : @"ChangeSetSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)changeSetSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMarketplacecatalogChangeSetSummaryListItem class]];
}

@end

@implementation AWSMarketplacecatalogListEntitiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalog" : @"Catalog",
             @"entityType" : @"EntityType",
             @"filterList" : @"FilterList",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sort" : @"Sort",
             };
}

+ (NSValueTransformer *)filterListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMarketplacecatalogFilter class]];
}

+ (NSValueTransformer *)sortJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMarketplacecatalogSort class]];
}

@end

@implementation AWSMarketplacecatalogListEntitiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entitySummaryList" : @"EntitySummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entitySummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMarketplacecatalogEntitySummary class]];
}

@end

@implementation AWSMarketplacecatalogSort

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSMarketplacecatalogSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSMarketplacecatalogSortOrderDescending);
        }
        return @(AWSMarketplacecatalogSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMarketplacecatalogSortOrderAscending:
                return @"ASCENDING";
            case AWSMarketplacecatalogSortOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMarketplacecatalogStartChangeSetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalog" : @"Catalog",
             @"changeSet" : @"ChangeSet",
             @"changeSetName" : @"ChangeSetName",
             @"clientRequestToken" : @"ClientRequestToken",
             };
}

+ (NSValueTransformer *)changeSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMarketplacecatalogChange class]];
}

@end

@implementation AWSMarketplacecatalogStartChangeSetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"changeSetArn" : @"ChangeSetArn",
             @"changeSetId" : @"ChangeSetId",
             };
}

@end
