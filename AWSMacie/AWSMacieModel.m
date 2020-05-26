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

#import "AWSMacieModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSMacieErrorDomain = @"com.amazonaws.AWSMacieErrorDomain";

@implementation AWSMacieAssociateMemberAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"memberAccountId" : @"memberAccountId",
             };
}

@end

@implementation AWSMacieAssociateS3ResourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"memberAccountId" : @"memberAccountId",
             @"s3Resources" : @"s3Resources",
             };
}

+ (NSValueTransformer *)s3ResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMacieS3ResourceClassification class]];
}

@end

@implementation AWSMacieAssociateS3ResourcesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedS3Resources" : @"failedS3Resources",
             };
}

+ (NSValueTransformer *)failedS3ResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMacieFailedS3Resource class]];
}

@end

@implementation AWSMacieClassificationType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continuous" : @"continuous",
             @"oneTime" : @"oneTime",
             };
}

+ (NSValueTransformer *)continuousJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL"] == NSOrderedSame) {
            return @(AWSMacieS3ContinuousClassificationTypeFull);
        }
        return @(AWSMacieS3ContinuousClassificationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMacieS3ContinuousClassificationTypeFull:
                return @"FULL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)oneTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL"] == NSOrderedSame) {
            return @(AWSMacieS3OneTimeClassificationTypeFull);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMacieS3OneTimeClassificationTypeNone);
        }
        return @(AWSMacieS3OneTimeClassificationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMacieS3OneTimeClassificationTypeFull:
                return @"FULL";
            case AWSMacieS3OneTimeClassificationTypeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMacieClassificationTypeUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continuous" : @"continuous",
             @"oneTime" : @"oneTime",
             };
}

+ (NSValueTransformer *)continuousJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL"] == NSOrderedSame) {
            return @(AWSMacieS3ContinuousClassificationTypeFull);
        }
        return @(AWSMacieS3ContinuousClassificationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMacieS3ContinuousClassificationTypeFull:
                return @"FULL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)oneTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL"] == NSOrderedSame) {
            return @(AWSMacieS3OneTimeClassificationTypeFull);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMacieS3OneTimeClassificationTypeNone);
        }
        return @(AWSMacieS3OneTimeClassificationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMacieS3OneTimeClassificationTypeFull:
                return @"FULL";
            case AWSMacieS3OneTimeClassificationTypeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMacieDisassociateMemberAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"memberAccountId" : @"memberAccountId",
             };
}

@end

@implementation AWSMacieDisassociateS3ResourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatedS3Resources" : @"associatedS3Resources",
             @"memberAccountId" : @"memberAccountId",
             };
}

+ (NSValueTransformer *)associatedS3ResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMacieS3Resource class]];
}

@end

@implementation AWSMacieDisassociateS3ResourcesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedS3Resources" : @"failedS3Resources",
             };
}

+ (NSValueTransformer *)failedS3ResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMacieFailedS3Resource class]];
}

@end

@implementation AWSMacieFailedS3Resource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"errorCode",
             @"errorMessage" : @"errorMessage",
             @"failedItem" : @"failedItem",
             };
}

+ (NSValueTransformer *)failedItemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMacieS3Resource class]];
}

@end

@implementation AWSMacieListMemberAccountsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSMacieListMemberAccountsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"memberAccounts" : @"memberAccounts",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)memberAccountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMacieMemberAccount class]];
}

@end

@implementation AWSMacieListS3ResourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"memberAccountId" : @"memberAccountId",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSMacieListS3ResourcesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"s3Resources" : @"s3Resources",
             };
}

+ (NSValueTransformer *)s3ResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMacieS3ResourceClassification class]];
}

@end

@implementation AWSMacieMemberAccount

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"accountId",
             };
}

@end

@implementation AWSMacieS3Resource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"bucketName",
             @"prefix" : @"prefix",
             };
}

@end

@implementation AWSMacieS3ResourceClassification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"bucketName",
             @"classificationType" : @"classificationType",
             @"prefix" : @"prefix",
             };
}

+ (NSValueTransformer *)classificationTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMacieClassificationType class]];
}

@end

@implementation AWSMacieS3ResourceClassificationUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketName" : @"bucketName",
             @"classificationTypeUpdate" : @"classificationTypeUpdate",
             @"prefix" : @"prefix",
             };
}

+ (NSValueTransformer *)classificationTypeUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMacieClassificationTypeUpdate class]];
}

@end

@implementation AWSMacieUpdateS3ResourcesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"memberAccountId" : @"memberAccountId",
             @"s3ResourcesUpdate" : @"s3ResourcesUpdate",
             };
}

+ (NSValueTransformer *)s3ResourcesUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMacieS3ResourceClassificationUpdate class]];
}

@end

@implementation AWSMacieUpdateS3ResourcesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedS3Resources" : @"failedS3Resources",
             };
}

+ (NSValueTransformer *)failedS3ResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMacieFailedS3Resource class]];
}

@end
