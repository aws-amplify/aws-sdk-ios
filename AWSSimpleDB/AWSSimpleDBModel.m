/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSSimpleDBModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSimpleDBErrorDomain = @"com.amazonaws.AWSSimpleDBErrorDomain";

@implementation AWSSimpleDBAttribute

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSSimpleDBDeletableAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSimpleDBDeletableItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleDBDeletableAttribute class]];
}

@end

@implementation AWSSimpleDBDeleteAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"domainName" : @"DomainName",
             @"expected" : @"Expected",
             @"itemName" : @"ItemName",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSimpleDBDeletableAttribute class]];
}

+ (NSValueTransformer *)expectedJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSimpleDBUpdateCondition class]];
}

@end

@implementation AWSSimpleDBDeleteDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSSimpleDBDomainMetadataRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSSimpleDBDomainMetadataResult

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxNumberOfDomains" : @"MaxNumberOfDomains",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSimpleDBListDomainsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainNames" : @"DomainNames",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSimpleDBPutAttributesRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"replace" : @"Replace",
             @"value" : @"Value",
             };
}

@end

@implementation AWSSimpleDBReplaceableItem

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consistentRead" : @"ConsistentRead",
             @"nextToken" : @"NextToken",
             @"selectExpression" : @"SelectExpression",
             };
}

@end

@implementation AWSSimpleDBSelectResult

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exists" : @"Exists",
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end
