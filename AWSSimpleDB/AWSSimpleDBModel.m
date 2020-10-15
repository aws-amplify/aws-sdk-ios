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

#import "AWSSimpleDBModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSimpleDBErrorDomain = @"com.amazonaws.AWSSimpleDBErrorDomain";

@implementation AWSSimpleDBAttribute

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alternateNameEncoding" : @"AlternateNameEncoding",
             @"alternateValueEncoding" : @"AlternateValueEncoding",
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSimpleDBBatchDeleteAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"items" : @"Items",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleDBDeletableItem class]];
}

@end

@implementation AWSSimpleDBBatchPutAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"items" : @"Items",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleDBReplaceableItem class]];
}

@end

@implementation AWSSimpleDBCreateDomainRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSSimpleDBDeletableItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleDBAttribute class]];
}

@end

@implementation AWSSimpleDBDeleteAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"domainName" : @"DomainName",
             @"expected" : @"Expected",
             @"itemName" : @"ItemName",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleDBAttribute class]];
}

+ (NSValueTransformer *)expectedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleDBUpdateCondition class]];
}

@end

@implementation AWSSimpleDBDeleteDomainRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSSimpleDBDomainMetadataRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSSimpleDBDomainMetadataResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeNameCount" : @"AttributeNameCount",
             @"attributeNamesSizeBytes" : @"AttributeNamesSizeBytes",
             @"attributeValueCount" : @"AttributeValueCount",
             @"attributeValuesSizeBytes" : @"AttributeValuesSizeBytes",
             @"itemCount" : @"ItemCount",
             @"itemNamesSizeBytes" : @"ItemNamesSizeBytes",
             @"timestamp" : @"Timestamp",
             };
}

@end

@implementation AWSSimpleDBGetAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeNames" : @"AttributeNames",
             @"consistentRead" : @"ConsistentRead",
             @"domainName" : @"DomainName",
             @"itemName" : @"ItemName",
             };
}

@end

@implementation AWSSimpleDBGetAttributesResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleDBAttribute class]];
}

@end

@implementation AWSSimpleDBItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alternateNameEncoding" : @"AlternateNameEncoding",
             @"attributes" : @"Attributes",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleDBAttribute class]];
}

@end

@implementation AWSSimpleDBListDomainsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxNumberOfDomains" : @"MaxNumberOfDomains",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSimpleDBListDomainsResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainNames" : @"DomainNames",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSimpleDBPutAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"domainName" : @"DomainName",
             @"expected" : @"Expected",
             @"itemName" : @"ItemName",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleDBReplaceableAttribute class]];
}

+ (NSValueTransformer *)expectedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleDBUpdateCondition class]];
}

@end

@implementation AWSSimpleDBReplaceableAttribute

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"replace" : @"Replace",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSimpleDBReplaceableItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleDBReplaceableAttribute class]];
}

@end

@implementation AWSSimpleDBSelectRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consistentRead" : @"ConsistentRead",
             @"nextToken" : @"NextToken",
             @"selectExpression" : @"SelectExpression",
             };
}

@end

@implementation AWSSimpleDBSelectResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleDBItem class]];
}

@end

@implementation AWSSimpleDBUpdateCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exists" : @"Exists",
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end
