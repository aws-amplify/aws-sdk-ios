//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSDynamoDBModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSDynamoDBErrorDomain = @"com.amazonaws.AWSDynamoDBErrorDomain";

@implementation AWSDynamoDBAttributeDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeType" : @"AttributeType",
             };
}

+ (NSValueTransformer *)attributeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S"] == NSOrderedSame) {
            return @(AWSDynamoDBScalarAttributeTypeS);
        }
        if ([value caseInsensitiveCompare:@"N"] == NSOrderedSame) {
            return @(AWSDynamoDBScalarAttributeTypeN);
        }
        if ([value caseInsensitiveCompare:@"B"] == NSOrderedSame) {
            return @(AWSDynamoDBScalarAttributeTypeB);
        }
        return @(AWSDynamoDBScalarAttributeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBScalarAttributeTypeS:
                return @"S";
            case AWSDynamoDBScalarAttributeTypeN:
                return @"N";
            case AWSDynamoDBScalarAttributeTypeB:
                return @"B";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBAttributeValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"B" : @"B",
             @"BOOLEAN" : @"BOOL",
             @"BS" : @"BS",
             @"L" : @"L",
             @"M" : @"M",
             @"N" : @"N",
             @"NS" : @"NS",
             @"NIL" : @"NULL",
             @"S" : @"S",
             @"SS" : @"SS",
             };
}

+ (NSValueTransformer *)LJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeValue class]];
}

+ (NSValueTransformer *)MJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBAttributeValueUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADD"] == NSOrderedSame) {
            return @(AWSDynamoDBAttributeActionAdd);
        }
        if ([value caseInsensitiveCompare:@"PUT"] == NSOrderedSame) {
            return @(AWSDynamoDBAttributeActionPut);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSDynamoDBAttributeActionDelete);
        }
        return @(AWSDynamoDBAttributeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBAttributeActionAdd:
                return @"ADD";
            case AWSDynamoDBAttributeActionPut:
                return @"PUT";
            case AWSDynamoDBAttributeActionDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAttributeValue class]];
}

@end

@implementation AWSDynamoDBBatchGetItemInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestItems" : @"RequestItems",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             };
}

+ (NSValueTransformer *)requestItemsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBKeysAndAttributes class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBBatchGetItemOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"responses" : @"Responses",
             @"unprocessedKeys" : @"UnprocessedKeys",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)responsesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONArrayDictionary:JSONDictionary arrayElementType:@"map" withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONArrayDictionaryFromMapMTLDictionary:mapMTLDictionary arrayElementType:@"map"];
    }];
}

+ (NSValueTransformer *)unprocessedKeysJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBKeysAndAttributes class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBBatchWriteItemInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"requestItems" : @"RequestItems",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"returnItemCollectionMetrics" : @"ReturnItemCollectionMetrics",
             };
}

+ (NSValueTransformer *)requestItemsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONArrayDictionary:JSONDictionary arrayElementType:@"structure" withModelClass:[AWSDynamoDBWriteRequest class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONArrayDictionaryFromMapMTLDictionary:mapMTLDictionary arrayElementType:@"structure"];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnItemCollectionMetricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIZE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsSize);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsNone);
        }
        return @(AWSDynamoDBReturnItemCollectionMetricsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnItemCollectionMetricsSize:
                return @"SIZE";
            case AWSDynamoDBReturnItemCollectionMetricsNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBBatchWriteItemOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"itemCollectionMetrics" : @"ItemCollectionMetrics",
             @"unprocessedItems" : @"UnprocessedItems",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemCollectionMetricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONArrayDictionary:JSONDictionary arrayElementType:@"structure" withModelClass:[AWSDynamoDBItemCollectionMetrics class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONArrayDictionaryFromMapMTLDictionary:mapMTLDictionary arrayElementType:@"structure"];
    }];
}

+ (NSValueTransformer *)unprocessedItemsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONArrayDictionary:JSONDictionary arrayElementType:@"structure" withModelClass:[AWSDynamoDBWriteRequest class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONArrayDictionaryFromMapMTLDictionary:mapMTLDictionary arrayElementType:@"structure"];
    }];
}

@end

@implementation AWSDynamoDBCapacity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capacityUnits" : @"CapacityUnits",
             };
}

@end

@implementation AWSDynamoDBCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeValueList" : @"AttributeValueList",
             @"comparisonOperator" : @"ComparisonOperator",
             };
}

+ (NSValueTransformer *)attributeValueListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeValue class]];
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQ"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorEQ);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNE);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorIN);
        }
        if ([value caseInsensitiveCompare:@"LE"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorLE);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorLT);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorGE);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorGT);
        }
        if ([value caseInsensitiveCompare:@"BETWEEN"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorBetween);
        }
        if ([value caseInsensitiveCompare:@"NOT_NULL"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNotNull);
        }
        if ([value caseInsensitiveCompare:@"NULL"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNull);
        }
        if ([value caseInsensitiveCompare:@"CONTAINS"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorContains);
        }
        if ([value caseInsensitiveCompare:@"NOT_CONTAINS"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNotContains);
        }
        if ([value caseInsensitiveCompare:@"BEGINS_WITH"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorBeginsWith);
        }
        return @(AWSDynamoDBComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBComparisonOperatorEQ:
                return @"EQ";
            case AWSDynamoDBComparisonOperatorNE:
                return @"NE";
            case AWSDynamoDBComparisonOperatorIN:
                return @"IN";
            case AWSDynamoDBComparisonOperatorLE:
                return @"LE";
            case AWSDynamoDBComparisonOperatorLT:
                return @"LT";
            case AWSDynamoDBComparisonOperatorGE:
                return @"GE";
            case AWSDynamoDBComparisonOperatorGT:
                return @"GT";
            case AWSDynamoDBComparisonOperatorBetween:
                return @"BETWEEN";
            case AWSDynamoDBComparisonOperatorNotNull:
                return @"NOT_NULL";
            case AWSDynamoDBComparisonOperatorNull:
                return @"NULL";
            case AWSDynamoDBComparisonOperatorContains:
                return @"CONTAINS";
            case AWSDynamoDBComparisonOperatorNotContains:
                return @"NOT_CONTAINS";
            case AWSDynamoDBComparisonOperatorBeginsWith:
                return @"BEGINS_WITH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBConsumedCapacity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capacityUnits" : @"CapacityUnits",
             @"globalSecondaryIndexes" : @"GlobalSecondaryIndexes",
             @"localSecondaryIndexes" : @"LocalSecondaryIndexes",
             @"table" : @"Table",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)globalSecondaryIndexesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBCapacity class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)localSecondaryIndexesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBCapacity class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)tableJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBCapacity class]];
}

@end

@implementation AWSDynamoDBCreateGlobalSecondaryIndexAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"keySchema" : @"KeySchema",
             @"projection" : @"Projection",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             };
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)projectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProjection class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

@end

@implementation AWSDynamoDBCreateTableInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeDefinitions" : @"AttributeDefinitions",
             @"globalSecondaryIndexes" : @"GlobalSecondaryIndexes",
             @"keySchema" : @"KeySchema",
             @"localSecondaryIndexes" : @"LocalSecondaryIndexes",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             @"streamSpecification" : @"StreamSpecification",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)attributeDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeDefinition class]];
}

+ (NSValueTransformer *)globalSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalSecondaryIndex class]];
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)localSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBLocalSecondaryIndex class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

+ (NSValueTransformer *)streamSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBStreamSpecification class]];
}

@end

@implementation AWSDynamoDBCreateTableOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableDescription" : @"TableDescription",
             };
}

+ (NSValueTransformer *)tableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableDescription class]];
}

@end

@implementation AWSDynamoDBDeleteGlobalSecondaryIndexAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             };
}

@end

@implementation AWSDynamoDBDeleteItemInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditionExpression" : @"ConditionExpression",
             @"conditionalOperator" : @"ConditionalOperator",
             @"expected" : @"Expected",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"key" : @"Key",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"returnItemCollectionMetrics" : @"ReturnItemCollectionMetrics",
             @"returnValues" : @"ReturnValues",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)conditionalOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AND"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorAnd);
        }
        if ([value caseInsensitiveCompare:@"OR"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorOr);
        }
        return @(AWSDynamoDBConditionalOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBConditionalOperatorAnd:
                return @"AND";
            case AWSDynamoDBConditionalOperatorOr:
                return @"OR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)expectedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBExpectedAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnItemCollectionMetricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIZE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsSize);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsNone);
        }
        return @(AWSDynamoDBReturnItemCollectionMetricsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnItemCollectionMetricsSize:
                return @"SIZE";
            case AWSDynamoDBReturnItemCollectionMetricsNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueNone);
        }
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueAllOld);
        }
        if ([value caseInsensitiveCompare:@"UPDATED_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueUpdatedOld);
        }
        if ([value caseInsensitiveCompare:@"ALL_NEW"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueAllNew);
        }
        if ([value caseInsensitiveCompare:@"UPDATED_NEW"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueUpdatedNew);
        }
        return @(AWSDynamoDBReturnValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValueNone:
                return @"NONE";
            case AWSDynamoDBReturnValueAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValueUpdatedOld:
                return @"UPDATED_OLD";
            case AWSDynamoDBReturnValueAllNew:
                return @"ALL_NEW";
            case AWSDynamoDBReturnValueUpdatedNew:
                return @"UPDATED_NEW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBDeleteItemOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"consumedCapacity" : @"ConsumedCapacity",
             @"itemCollectionMetrics" : @"ItemCollectionMetrics",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemCollectionMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBItemCollectionMetrics class]];
}

@end

@implementation AWSDynamoDBDeleteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBDeleteTableInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBDeleteTableOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableDescription" : @"TableDescription",
             };
}

+ (NSValueTransformer *)tableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableDescription class]];
}

@end

@implementation AWSDynamoDBDescribeLimitsInput

@end

@implementation AWSDynamoDBDescribeLimitsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountMaxReadCapacityUnits" : @"AccountMaxReadCapacityUnits",
             @"accountMaxWriteCapacityUnits" : @"AccountMaxWriteCapacityUnits",
             @"tableMaxReadCapacityUnits" : @"TableMaxReadCapacityUnits",
             @"tableMaxWriteCapacityUnits" : @"TableMaxWriteCapacityUnits",
             };
}

@end

@implementation AWSDynamoDBDescribeTableInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBDescribeTableOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"table" : @"Table",
             };
}

+ (NSValueTransformer *)tableJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableDescription class]];
}

@end

@implementation AWSDynamoDBExpectedAttributeValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeValueList" : @"AttributeValueList",
             @"comparisonOperator" : @"ComparisonOperator",
             @"exists" : @"Exists",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)attributeValueListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeValue class]];
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQ"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorEQ);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNE);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorIN);
        }
        if ([value caseInsensitiveCompare:@"LE"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorLE);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorLT);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorGE);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorGT);
        }
        if ([value caseInsensitiveCompare:@"BETWEEN"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorBetween);
        }
        if ([value caseInsensitiveCompare:@"NOT_NULL"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNotNull);
        }
        if ([value caseInsensitiveCompare:@"NULL"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNull);
        }
        if ([value caseInsensitiveCompare:@"CONTAINS"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorContains);
        }
        if ([value caseInsensitiveCompare:@"NOT_CONTAINS"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorNotContains);
        }
        if ([value caseInsensitiveCompare:@"BEGINS_WITH"] == NSOrderedSame) {
            return @(AWSDynamoDBComparisonOperatorBeginsWith);
        }
        return @(AWSDynamoDBComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBComparisonOperatorEQ:
                return @"EQ";
            case AWSDynamoDBComparisonOperatorNE:
                return @"NE";
            case AWSDynamoDBComparisonOperatorIN:
                return @"IN";
            case AWSDynamoDBComparisonOperatorLE:
                return @"LE";
            case AWSDynamoDBComparisonOperatorLT:
                return @"LT";
            case AWSDynamoDBComparisonOperatorGE:
                return @"GE";
            case AWSDynamoDBComparisonOperatorGT:
                return @"GT";
            case AWSDynamoDBComparisonOperatorBetween:
                return @"BETWEEN";
            case AWSDynamoDBComparisonOperatorNotNull:
                return @"NOT_NULL";
            case AWSDynamoDBComparisonOperatorNull:
                return @"NULL";
            case AWSDynamoDBComparisonOperatorContains:
                return @"CONTAINS";
            case AWSDynamoDBComparisonOperatorNotContains:
                return @"NOT_CONTAINS";
            case AWSDynamoDBComparisonOperatorBeginsWith:
                return @"BEGINS_WITH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBAttributeValue class]];
}

@end

@implementation AWSDynamoDBGetItemInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributesToGet" : @"AttributesToGet",
             @"consistentRead" : @"ConsistentRead",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"key" : @"Key",
             @"projectionExpression" : @"ProjectionExpression",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBGetItemOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"item" : @"Item",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBGlobalSecondaryIndex

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"keySchema" : @"KeySchema",
             @"projection" : @"Projection",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             };
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)projectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProjection class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

@end

@implementation AWSDynamoDBGlobalSecondaryIndexDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backfilling" : @"Backfilling",
             @"indexArn" : @"IndexArn",
             @"indexName" : @"IndexName",
             @"indexSizeBytes" : @"IndexSizeBytes",
             @"indexStatus" : @"IndexStatus",
             @"itemCount" : @"ItemCount",
             @"keySchema" : @"KeySchema",
             @"projection" : @"Projection",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             };
}

+ (NSValueTransformer *)indexStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBIndexStatusActive);
        }
        return @(AWSDynamoDBIndexStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBIndexStatusCreating:
                return @"CREATING";
            case AWSDynamoDBIndexStatusUpdating:
                return @"UPDATING";
            case AWSDynamoDBIndexStatusDeleting:
                return @"DELETING";
            case AWSDynamoDBIndexStatusActive:
                return @"ACTIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)projectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProjection class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughputDescription class]];
}

@end

@implementation AWSDynamoDBGlobalSecondaryIndexUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"create" : @"Create",
             @"remove" : @"Delete",
             @"update" : @"Update",
             };
}

+ (NSValueTransformer *)createJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBCreateGlobalSecondaryIndexAction class]];
}

+ (NSValueTransformer *)removeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBDeleteGlobalSecondaryIndexAction class]];
}

+ (NSValueTransformer *)updateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBUpdateGlobalSecondaryIndexAction class]];
}

@end

@implementation AWSDynamoDBItemCollectionMetrics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"itemCollectionKey" : @"ItemCollectionKey",
             @"sizeEstimateRangeGB" : @"SizeEstimateRangeGB",
             };
}

+ (NSValueTransformer *)itemCollectionKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBKeySchemaElement

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"keyType" : @"KeyType",
             };
}

+ (NSValueTransformer *)keyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HASH"] == NSOrderedSame) {
            return @(AWSDynamoDBKeyTypeHash);
        }
        if ([value caseInsensitiveCompare:@"RANGE"] == NSOrderedSame) {
            return @(AWSDynamoDBKeyTypeRange);
        }
        return @(AWSDynamoDBKeyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBKeyTypeHash:
                return @"HASH";
            case AWSDynamoDBKeyTypeRange:
                return @"RANGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBKeysAndAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributesToGet" : @"AttributesToGet",
             @"consistentRead" : @"ConsistentRead",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"keys" : @"Keys",
             @"projectionExpression" : @"ProjectionExpression",
             };
}

+ (NSValueTransformer *)keysJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

@end

@implementation AWSDynamoDBListTablesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveStartTableName" : @"ExclusiveStartTableName",
             @"limit" : @"Limit",
             };
}

@end

@implementation AWSDynamoDBListTablesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastEvaluatedTableName" : @"LastEvaluatedTableName",
             @"tableNames" : @"TableNames",
             };
}

@end

@implementation AWSDynamoDBLocalSecondaryIndex

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"keySchema" : @"KeySchema",
             @"projection" : @"Projection",
             };
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)projectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProjection class]];
}

@end

@implementation AWSDynamoDBLocalSecondaryIndexDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexArn" : @"IndexArn",
             @"indexName" : @"IndexName",
             @"indexSizeBytes" : @"IndexSizeBytes",
             @"itemCount" : @"ItemCount",
             @"keySchema" : @"KeySchema",
             @"projection" : @"Projection",
             };
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)projectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProjection class]];
}

@end

@implementation AWSDynamoDBProjection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nonKeyAttributes" : @"NonKeyAttributes",
             @"projectionType" : @"ProjectionType",
             };
}

+ (NSValueTransformer *)projectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSDynamoDBProjectionTypeAll);
        }
        if ([value caseInsensitiveCompare:@"KEYS_ONLY"] == NSOrderedSame) {
            return @(AWSDynamoDBProjectionTypeKeysOnly);
        }
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSDynamoDBProjectionTypeInclude);
        }
        return @(AWSDynamoDBProjectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBProjectionTypeAll:
                return @"ALL";
            case AWSDynamoDBProjectionTypeKeysOnly:
                return @"KEYS_ONLY";
            case AWSDynamoDBProjectionTypeInclude:
                return @"INCLUDE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBProvisionedThroughput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"readCapacityUnits" : @"ReadCapacityUnits",
             @"writeCapacityUnits" : @"WriteCapacityUnits",
             };
}

@end

@implementation AWSDynamoDBProvisionedThroughputDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastDecreaseDateTime" : @"LastDecreaseDateTime",
             @"lastIncreaseDateTime" : @"LastIncreaseDateTime",
             @"numberOfDecreasesToday" : @"NumberOfDecreasesToday",
             @"readCapacityUnits" : @"ReadCapacityUnits",
             @"writeCapacityUnits" : @"WriteCapacityUnits",
             };
}

+ (NSValueTransformer *)lastDecreaseDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastIncreaseDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDynamoDBPutItemInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditionExpression" : @"ConditionExpression",
             @"conditionalOperator" : @"ConditionalOperator",
             @"expected" : @"Expected",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"item" : @"Item",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"returnItemCollectionMetrics" : @"ReturnItemCollectionMetrics",
             @"returnValues" : @"ReturnValues",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)conditionalOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AND"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorAnd);
        }
        if ([value caseInsensitiveCompare:@"OR"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorOr);
        }
        return @(AWSDynamoDBConditionalOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBConditionalOperatorAnd:
                return @"AND";
            case AWSDynamoDBConditionalOperatorOr:
                return @"OR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)expectedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBExpectedAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnItemCollectionMetricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIZE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsSize);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsNone);
        }
        return @(AWSDynamoDBReturnItemCollectionMetricsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnItemCollectionMetricsSize:
                return @"SIZE";
            case AWSDynamoDBReturnItemCollectionMetricsNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueNone);
        }
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueAllOld);
        }
        if ([value caseInsensitiveCompare:@"UPDATED_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueUpdatedOld);
        }
        if ([value caseInsensitiveCompare:@"ALL_NEW"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueAllNew);
        }
        if ([value caseInsensitiveCompare:@"UPDATED_NEW"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueUpdatedNew);
        }
        return @(AWSDynamoDBReturnValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValueNone:
                return @"NONE";
            case AWSDynamoDBReturnValueAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValueUpdatedOld:
                return @"UPDATED_OLD";
            case AWSDynamoDBReturnValueAllNew:
                return @"ALL_NEW";
            case AWSDynamoDBReturnValueUpdatedNew:
                return @"UPDATED_NEW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBPutItemOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"consumedCapacity" : @"ConsumedCapacity",
             @"itemCollectionMetrics" : @"ItemCollectionMetrics",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemCollectionMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBItemCollectionMetrics class]];
}

@end

@implementation AWSDynamoDBPutRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBQueryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributesToGet" : @"AttributesToGet",
             @"conditionalOperator" : @"ConditionalOperator",
             @"consistentRead" : @"ConsistentRead",
             @"exclusiveStartKey" : @"ExclusiveStartKey",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"filterExpression" : @"FilterExpression",
             @"indexName" : @"IndexName",
             @"keyConditionExpression" : @"KeyConditionExpression",
             @"keyConditions" : @"KeyConditions",
             @"limit" : @"Limit",
             @"projectionExpression" : @"ProjectionExpression",
             @"queryFilter" : @"QueryFilter",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"scanIndexForward" : @"ScanIndexForward",
             @"select" : @"Select",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)conditionalOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AND"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorAnd);
        }
        if ([value caseInsensitiveCompare:@"OR"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorOr);
        }
        return @(AWSDynamoDBConditionalOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBConditionalOperatorAnd:
                return @"AND";
            case AWSDynamoDBConditionalOperatorOr:
                return @"OR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)exclusiveStartKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)keyConditionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBCondition class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)queryFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBCondition class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)selectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_ATTRIBUTES"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectAllAttributes);
        }
        if ([value caseInsensitiveCompare:@"ALL_PROJECTED_ATTRIBUTES"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectAllProjectedAttributes);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIC_ATTRIBUTES"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectSpecificAttributes);
        }
        if ([value caseInsensitiveCompare:@"COUNT"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectCount);
        }
        return @(AWSDynamoDBSelectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBSelectAllAttributes:
                return @"ALL_ATTRIBUTES";
            case AWSDynamoDBSelectAllProjectedAttributes:
                return @"ALL_PROJECTED_ATTRIBUTES";
            case AWSDynamoDBSelectSpecificAttributes:
                return @"SPECIFIC_ATTRIBUTES";
            case AWSDynamoDBSelectCount:
                return @"COUNT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBQueryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"count" : @"Count",
             @"items" : @"Items",
             @"lastEvaluatedKey" : @"LastEvaluatedKey",
             @"scannedCount" : @"ScannedCount",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)lastEvaluatedKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBScanInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributesToGet" : @"AttributesToGet",
             @"conditionalOperator" : @"ConditionalOperator",
             @"consistentRead" : @"ConsistentRead",
             @"exclusiveStartKey" : @"ExclusiveStartKey",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"filterExpression" : @"FilterExpression",
             @"indexName" : @"IndexName",
             @"limit" : @"Limit",
             @"projectionExpression" : @"ProjectionExpression",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"scanFilter" : @"ScanFilter",
             @"segment" : @"Segment",
             @"select" : @"Select",
             @"tableName" : @"TableName",
             @"totalSegments" : @"TotalSegments",
             };
}

+ (NSValueTransformer *)conditionalOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AND"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorAnd);
        }
        if ([value caseInsensitiveCompare:@"OR"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorOr);
        }
        return @(AWSDynamoDBConditionalOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBConditionalOperatorAnd:
                return @"AND";
            case AWSDynamoDBConditionalOperatorOr:
                return @"OR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)exclusiveStartKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scanFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBCondition class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)selectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL_ATTRIBUTES"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectAllAttributes);
        }
        if ([value caseInsensitiveCompare:@"ALL_PROJECTED_ATTRIBUTES"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectAllProjectedAttributes);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIC_ATTRIBUTES"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectSpecificAttributes);
        }
        if ([value caseInsensitiveCompare:@"COUNT"] == NSOrderedSame) {
            return @(AWSDynamoDBSelectCount);
        }
        return @(AWSDynamoDBSelectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBSelectAllAttributes:
                return @"ALL_ATTRIBUTES";
            case AWSDynamoDBSelectAllProjectedAttributes:
                return @"ALL_PROJECTED_ATTRIBUTES";
            case AWSDynamoDBSelectSpecificAttributes:
                return @"SPECIFIC_ATTRIBUTES";
            case AWSDynamoDBSelectCount:
                return @"COUNT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBScanOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"consumedCapacity" : @"ConsumedCapacity",
             @"count" : @"Count",
             @"items" : @"Items",
             @"lastEvaluatedKey" : @"LastEvaluatedKey",
             @"scannedCount" : @"ScannedCount",
             };
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

+ (NSValueTransformer *)lastEvaluatedKeyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSDynamoDBStreamSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamEnabled" : @"StreamEnabled",
             @"streamViewType" : @"StreamViewType",
             };
}

+ (NSValueTransformer *)streamViewTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NEW_IMAGE"] == NSOrderedSame) {
            return @(AWSDynamoDBStreamViewTypeNewImage);
        }
        if ([value caseInsensitiveCompare:@"OLD_IMAGE"] == NSOrderedSame) {
            return @(AWSDynamoDBStreamViewTypeOldImage);
        }
        if ([value caseInsensitiveCompare:@"NEW_AND_OLD_IMAGES"] == NSOrderedSame) {
            return @(AWSDynamoDBStreamViewTypeNewAndOldImages);
        }
        if ([value caseInsensitiveCompare:@"KEYS_ONLY"] == NSOrderedSame) {
            return @(AWSDynamoDBStreamViewTypeKeysOnly);
        }
        return @(AWSDynamoDBStreamViewTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBStreamViewTypeNewImage:
                return @"NEW_IMAGE";
            case AWSDynamoDBStreamViewTypeOldImage:
                return @"OLD_IMAGE";
            case AWSDynamoDBStreamViewTypeNewAndOldImages:
                return @"NEW_AND_OLD_IMAGES";
            case AWSDynamoDBStreamViewTypeKeysOnly:
                return @"KEYS_ONLY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBTableDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeDefinitions" : @"AttributeDefinitions",
             @"creationDateTime" : @"CreationDateTime",
             @"globalSecondaryIndexes" : @"GlobalSecondaryIndexes",
             @"itemCount" : @"ItemCount",
             @"keySchema" : @"KeySchema",
             @"latestStreamArn" : @"LatestStreamArn",
             @"latestStreamLabel" : @"LatestStreamLabel",
             @"localSecondaryIndexes" : @"LocalSecondaryIndexes",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             @"streamSpecification" : @"StreamSpecification",
             @"tableArn" : @"TableArn",
             @"tableName" : @"TableName",
             @"tableSizeBytes" : @"TableSizeBytes",
             @"tableStatus" : @"TableStatus",
             };
}

+ (NSValueTransformer *)attributeDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeDefinition class]];
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)globalSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalSecondaryIndexDescription class]];
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)localSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBLocalSecondaryIndexDescription class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughputDescription class]];
}

+ (NSValueTransformer *)streamSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBStreamSpecification class]];
}

+ (NSValueTransformer *)tableStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBTableStatusActive);
        }
        return @(AWSDynamoDBTableStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBTableStatusCreating:
                return @"CREATING";
            case AWSDynamoDBTableStatusUpdating:
                return @"UPDATING";
            case AWSDynamoDBTableStatusDeleting:
                return @"DELETING";
            case AWSDynamoDBTableStatusActive:
                return @"ACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBUpdateGlobalSecondaryIndexAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             };
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

@end

@implementation AWSDynamoDBUpdateItemInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeUpdates" : @"AttributeUpdates",
             @"conditionExpression" : @"ConditionExpression",
             @"conditionalOperator" : @"ConditionalOperator",
             @"expected" : @"Expected",
             @"expressionAttributeNames" : @"ExpressionAttributeNames",
             @"expressionAttributeValues" : @"ExpressionAttributeValues",
             @"key" : @"Key",
             @"returnConsumedCapacity" : @"ReturnConsumedCapacity",
             @"returnItemCollectionMetrics" : @"ReturnItemCollectionMetrics",
             @"returnValues" : @"ReturnValues",
             @"tableName" : @"TableName",
             @"updateExpression" : @"UpdateExpression",
             };
}

+ (NSValueTransformer *)attributeUpdatesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValueUpdate class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)conditionalOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AND"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorAnd);
        }
        if ([value caseInsensitiveCompare:@"OR"] == NSOrderedSame) {
            return @(AWSDynamoDBConditionalOperatorOr);
        }
        return @(AWSDynamoDBConditionalOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBConditionalOperatorAnd:
                return @"AND";
            case AWSDynamoDBConditionalOperatorOr:
                return @"OR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)expectedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBExpectedAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)expressionAttributeValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)returnConsumedCapacityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INDEXES"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityIndexes);
        }
        if ([value caseInsensitiveCompare:@"TOTAL"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityTotal);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnConsumedCapacityNone);
        }
        return @(AWSDynamoDBReturnConsumedCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnConsumedCapacityIndexes:
                return @"INDEXES";
            case AWSDynamoDBReturnConsumedCapacityTotal:
                return @"TOTAL";
            case AWSDynamoDBReturnConsumedCapacityNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnItemCollectionMetricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIZE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsSize);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnItemCollectionMetricsNone);
        }
        return @(AWSDynamoDBReturnItemCollectionMetricsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnItemCollectionMetricsSize:
                return @"SIZE";
            case AWSDynamoDBReturnItemCollectionMetricsNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)returnValuesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueNone);
        }
        if ([value caseInsensitiveCompare:@"ALL_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueAllOld);
        }
        if ([value caseInsensitiveCompare:@"UPDATED_OLD"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueUpdatedOld);
        }
        if ([value caseInsensitiveCompare:@"ALL_NEW"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueAllNew);
        }
        if ([value caseInsensitiveCompare:@"UPDATED_NEW"] == NSOrderedSame) {
            return @(AWSDynamoDBReturnValueUpdatedNew);
        }
        return @(AWSDynamoDBReturnValueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReturnValueNone:
                return @"NONE";
            case AWSDynamoDBReturnValueAllOld:
                return @"ALL_OLD";
            case AWSDynamoDBReturnValueUpdatedOld:
                return @"UPDATED_OLD";
            case AWSDynamoDBReturnValueAllNew:
                return @"ALL_NEW";
            case AWSDynamoDBReturnValueUpdatedNew:
                return @"UPDATED_NEW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBUpdateItemOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"consumedCapacity" : @"ConsumedCapacity",
             @"itemCollectionMetrics" : @"ItemCollectionMetrics",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSDynamoDBAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)consumedCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBConsumedCapacity class]];
}

+ (NSValueTransformer *)itemCollectionMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBItemCollectionMetrics class]];
}

@end

@implementation AWSDynamoDBUpdateTableInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeDefinitions" : @"AttributeDefinitions",
             @"globalSecondaryIndexUpdates" : @"GlobalSecondaryIndexUpdates",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             @"streamSpecification" : @"StreamSpecification",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)attributeDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBAttributeDefinition class]];
}

+ (NSValueTransformer *)globalSecondaryIndexUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalSecondaryIndexUpdate class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

+ (NSValueTransformer *)streamSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBStreamSpecification class]];
}

@end

@implementation AWSDynamoDBUpdateTableOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableDescription" : @"TableDescription",
             };
}

+ (NSValueTransformer *)tableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableDescription class]];
}

@end

@implementation AWSDynamoDBWriteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteRequest" : @"DeleteRequest",
             @"putRequest" : @"PutRequest",
             };
}

+ (NSValueTransformer *)deleteRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBDeleteRequest class]];
}

+ (NSValueTransformer *)putRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBPutRequest class]];
}

@end
