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

#import "AWSAWSCodeStarconnectionsModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSAWSCodeStarconnectionsErrorDomain = @"com.amazonaws.AWSAWSCodeStarconnectionsErrorDomain";

@implementation AWSAWSCodeStarconnectionsConnection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionArn" : @"ConnectionArn",
             @"connectionName" : @"ConnectionName",
             @"connectionStatus" : @"ConnectionStatus",
             @"ownerAccountId" : @"OwnerAccountId",
             @"providerType" : @"ProviderType",
             };
}

+ (NSValueTransformer *)connectionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSAWSCodeStarconnectionsConnectionStatusPending);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSAWSCodeStarconnectionsConnectionStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSAWSCodeStarconnectionsConnectionStatusError);
        }
        return @(AWSAWSCodeStarconnectionsConnectionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSCodeStarconnectionsConnectionStatusPending:
                return @"PENDING";
            case AWSAWSCodeStarconnectionsConnectionStatusAvailable:
                return @"AVAILABLE";
            case AWSAWSCodeStarconnectionsConnectionStatusError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)providerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Bitbucket"] == NSOrderedSame) {
            return @(AWSAWSCodeStarconnectionsProviderTypeBitbucket);
        }
        return @(AWSAWSCodeStarconnectionsProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSCodeStarconnectionsProviderTypeBitbucket:
                return @"Bitbucket";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSCodeStarconnectionsCreateConnectionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionName" : @"ConnectionName",
             @"providerType" : @"ProviderType",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)providerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Bitbucket"] == NSOrderedSame) {
            return @(AWSAWSCodeStarconnectionsProviderTypeBitbucket);
        }
        return @(AWSAWSCodeStarconnectionsProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSCodeStarconnectionsProviderTypeBitbucket:
                return @"Bitbucket";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSCodeStarconnectionsTag class]];
}

@end

@implementation AWSAWSCodeStarconnectionsCreateConnectionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionArn" : @"ConnectionArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSCodeStarconnectionsTag class]];
}

@end

@implementation AWSAWSCodeStarconnectionsDeleteConnectionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionArn" : @"ConnectionArn",
             };
}

@end

@implementation AWSAWSCodeStarconnectionsDeleteConnectionOutput

@end

@implementation AWSAWSCodeStarconnectionsGetConnectionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionArn" : @"ConnectionArn",
             };
}

@end

@implementation AWSAWSCodeStarconnectionsGetConnectionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connection" : @"Connection",
             };
}

+ (NSValueTransformer *)connectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSCodeStarconnectionsConnection class]];
}

@end

@implementation AWSAWSCodeStarconnectionsListConnectionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"providerTypeFilter" : @"ProviderTypeFilter",
             };
}

+ (NSValueTransformer *)providerTypeFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Bitbucket"] == NSOrderedSame) {
            return @(AWSAWSCodeStarconnectionsProviderTypeBitbucket);
        }
        return @(AWSAWSCodeStarconnectionsProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSCodeStarconnectionsProviderTypeBitbucket:
                return @"Bitbucket";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSCodeStarconnectionsListConnectionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connections" : @"Connections",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)connectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSCodeStarconnectionsConnection class]];
}

@end

@implementation AWSAWSCodeStarconnectionsListTagsForResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSAWSCodeStarconnectionsListTagsForResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSCodeStarconnectionsTag class]];
}

@end

@implementation AWSAWSCodeStarconnectionsTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSAWSCodeStarconnectionsTagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSCodeStarconnectionsTag class]];
}

@end

@implementation AWSAWSCodeStarconnectionsTagResourceOutput

@end

@implementation AWSAWSCodeStarconnectionsUntagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSAWSCodeStarconnectionsUntagResourceOutput

@end
