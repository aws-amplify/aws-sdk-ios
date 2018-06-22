//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@implementation AWSDynamoDBBackupDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupDetails" : @"BackupDetails",
             @"sourceTableDetails" : @"SourceTableDetails",
             @"sourceTableFeatureDetails" : @"SourceTableFeatureDetails",
             };
}

+ (NSValueTransformer *)backupDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBBackupDetails class]];
}

+ (NSValueTransformer *)sourceTableDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSourceTableDetails class]];
}

+ (NSValueTransformer *)sourceTableFeatureDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSourceTableFeatureDetails class]];
}

@end

@implementation AWSDynamoDBBackupDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupArn" : @"BackupArn",
             @"backupCreationDateTime" : @"BackupCreationDateTime",
             @"backupName" : @"BackupName",
             @"backupSizeBytes" : @"BackupSizeBytes",
             @"backupStatus" : @"BackupStatus",
             };
}

+ (NSValueTransformer *)backupCreationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)backupStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupStatusAvailable);
        }
        return @(AWSDynamoDBBackupStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBackupStatusCreating:
                return @"CREATING";
            case AWSDynamoDBBackupStatusDeleted:
                return @"DELETED";
            case AWSDynamoDBBackupStatusAvailable:
                return @"AVAILABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBBackupSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupArn" : @"BackupArn",
             @"backupCreationDateTime" : @"BackupCreationDateTime",
             @"backupName" : @"BackupName",
             @"backupSizeBytes" : @"BackupSizeBytes",
             @"backupStatus" : @"BackupStatus",
             @"tableArn" : @"TableArn",
             @"tableId" : @"TableId",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)backupCreationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)backupStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSDynamoDBBackupStatusAvailable);
        }
        return @(AWSDynamoDBBackupStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBBackupStatusCreating:
                return @"CREATING";
            case AWSDynamoDBBackupStatusDeleted:
                return @"DELETED";
            case AWSDynamoDBBackupStatusAvailable:
                return @"AVAILABLE";
            default:
                return nil;
        }
    }];
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

@implementation AWSDynamoDBContinuousBackupsDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continuousBackupsStatus" : @"ContinuousBackupsStatus",
             @"pointInTimeRecoveryDescription" : @"PointInTimeRecoveryDescription",
             };
}

+ (NSValueTransformer *)continuousBackupsStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBContinuousBackupsStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBContinuousBackupsStatusDisabled);
        }
        return @(AWSDynamoDBContinuousBackupsStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBContinuousBackupsStatusEnabled:
                return @"ENABLED";
            case AWSDynamoDBContinuousBackupsStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pointInTimeRecoveryDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBPointInTimeRecoveryDescription class]];
}

@end

@implementation AWSDynamoDBCreateBackupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupName" : @"BackupName",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBCreateBackupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupDetails" : @"BackupDetails",
             };
}

+ (NSValueTransformer *)backupDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBBackupDetails class]];
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

@implementation AWSDynamoDBCreateGlobalTableInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplica class]];
}

@end

@implementation AWSDynamoDBCreateGlobalTableOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableDescription" : @"GlobalTableDescription",
             };
}

+ (NSValueTransformer *)globalTableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBGlobalTableDescription class]];
}

@end

@implementation AWSDynamoDBCreateReplicaAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionName" : @"RegionName",
             };
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
             @"SSESpecification" : @"SSESpecification",
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

+ (NSValueTransformer *)SSESpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSSESpecification class]];
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

@implementation AWSDynamoDBDeleteBackupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupArn" : @"BackupArn",
             };
}

@end

@implementation AWSDynamoDBDeleteBackupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupDescription" : @"BackupDescription",
             };
}

+ (NSValueTransformer *)backupDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBBackupDescription class]];
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

@implementation AWSDynamoDBDeleteReplicaAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionName" : @"RegionName",
             };
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

@implementation AWSDynamoDBDescribeBackupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupArn" : @"BackupArn",
             };
}

@end

@implementation AWSDynamoDBDescribeBackupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupDescription" : @"BackupDescription",
             };
}

+ (NSValueTransformer *)backupDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBBackupDescription class]];
}

@end

@implementation AWSDynamoDBDescribeContinuousBackupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBDescribeContinuousBackupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continuousBackupsDescription" : @"ContinuousBackupsDescription",
             };
}

+ (NSValueTransformer *)continuousBackupsDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBContinuousBackupsDescription class]];
}

@end

@implementation AWSDynamoDBDescribeGlobalTableInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             };
}

@end

@implementation AWSDynamoDBDescribeGlobalTableOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableDescription" : @"GlobalTableDescription",
             };
}

+ (NSValueTransformer *)globalTableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBGlobalTableDescription class]];
}

@end

@implementation AWSDynamoDBDescribeGlobalTableSettingsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             };
}

@end

@implementation AWSDynamoDBDescribeGlobalTableSettingsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             @"replicaSettings" : @"ReplicaSettings",
             };
}

+ (NSValueTransformer *)replicaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaSettingsDescription class]];
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

@implementation AWSDynamoDBDescribeTimeToLiveInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSDynamoDBDescribeTimeToLiveOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timeToLiveDescription" : @"TimeToLiveDescription",
             };
}

+ (NSValueTransformer *)timeToLiveDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTimeToLiveDescription class]];
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

@implementation AWSDynamoDBGlobalSecondaryIndexInfo

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

@implementation AWSDynamoDBGlobalTable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplica class]];
}

@end

@implementation AWSDynamoDBGlobalTableDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDateTime" : @"CreationDateTime",
             @"globalTableArn" : @"GlobalTableArn",
             @"globalTableName" : @"GlobalTableName",
             @"globalTableStatus" : @"GlobalTableStatus",
             @"replicationGroup" : @"ReplicationGroup",
             };
}

+ (NSValueTransformer *)creationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)globalTableStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBGlobalTableStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBGlobalTableStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSDynamoDBGlobalTableStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBGlobalTableStatusUpdating);
        }
        return @(AWSDynamoDBGlobalTableStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBGlobalTableStatusCreating:
                return @"CREATING";
            case AWSDynamoDBGlobalTableStatusActive:
                return @"ACTIVE";
            case AWSDynamoDBGlobalTableStatusDeleting:
                return @"DELETING";
            case AWSDynamoDBGlobalTableStatusUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)replicationGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaDescription class]];
}

@end

@implementation AWSDynamoDBGlobalTableGlobalSecondaryIndexSettingsUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"provisionedWriteCapacityUnits" : @"ProvisionedWriteCapacityUnits",
             };
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

@implementation AWSDynamoDBListBackupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveStartBackupArn" : @"ExclusiveStartBackupArn",
             @"limit" : @"Limit",
             @"tableName" : @"TableName",
             @"timeRangeLowerBound" : @"TimeRangeLowerBound",
             @"timeRangeUpperBound" : @"TimeRangeUpperBound",
             };
}

+ (NSValueTransformer *)timeRangeLowerBoundJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)timeRangeUpperBoundJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDynamoDBListBackupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupSummaries" : @"BackupSummaries",
             @"lastEvaluatedBackupArn" : @"LastEvaluatedBackupArn",
             };
}

+ (NSValueTransformer *)backupSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBBackupSummary class]];
}

@end

@implementation AWSDynamoDBListGlobalTablesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveStartGlobalTableName" : @"ExclusiveStartGlobalTableName",
             @"limit" : @"Limit",
             @"regionName" : @"RegionName",
             };
}

@end

@implementation AWSDynamoDBListGlobalTablesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTables" : @"GlobalTables",
             @"lastEvaluatedGlobalTableName" : @"LastEvaluatedGlobalTableName",
             };
}

+ (NSValueTransformer *)globalTablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalTable class]];
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

@implementation AWSDynamoDBListTagsOfResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSDynamoDBListTagsOfResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBTag class]];
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

@implementation AWSDynamoDBLocalSecondaryIndexInfo

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

@implementation AWSDynamoDBPointInTimeRecoveryDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"earliestRestorableDateTime" : @"EarliestRestorableDateTime",
             @"latestRestorableDateTime" : @"LatestRestorableDateTime",
             @"pointInTimeRecoveryStatus" : @"PointInTimeRecoveryStatus",
             };
}

+ (NSValueTransformer *)earliestRestorableDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)latestRestorableDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)pointInTimeRecoveryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBPointInTimeRecoveryStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBPointInTimeRecoveryStatusDisabled);
        }
        return @(AWSDynamoDBPointInTimeRecoveryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBPointInTimeRecoveryStatusEnabled:
                return @"ENABLED";
            case AWSDynamoDBPointInTimeRecoveryStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBPointInTimeRecoverySpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pointInTimeRecoveryEnabled" : @"PointInTimeRecoveryEnabled",
             };
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

@implementation AWSDynamoDBReplica

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionName" : @"RegionName",
             };
}

@end

@implementation AWSDynamoDBReplicaDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionName" : @"RegionName",
             };
}

@end

@implementation AWSDynamoDBReplicaGlobalSecondaryIndexSettingsDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"indexStatus" : @"IndexStatus",
             @"provisionedReadCapacityUnits" : @"ProvisionedReadCapacityUnits",
             @"provisionedWriteCapacityUnits" : @"ProvisionedWriteCapacityUnits",
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

@end

@implementation AWSDynamoDBReplicaGlobalSecondaryIndexSettingsUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"indexName" : @"IndexName",
             @"provisionedReadCapacityUnits" : @"ProvisionedReadCapacityUnits",
             };
}

@end

@implementation AWSDynamoDBReplicaSettingsDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionName" : @"RegionName",
             @"replicaGlobalSecondaryIndexSettings" : @"ReplicaGlobalSecondaryIndexSettings",
             @"replicaProvisionedReadCapacityUnits" : @"ReplicaProvisionedReadCapacityUnits",
             @"replicaProvisionedWriteCapacityUnits" : @"ReplicaProvisionedWriteCapacityUnits",
             @"replicaStatus" : @"ReplicaStatus",
             };
}

+ (NSValueTransformer *)replicaGlobalSecondaryIndexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaGlobalSecondaryIndexSettingsDescription class]];
}

+ (NSValueTransformer *)replicaStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSDynamoDBReplicaStatusActive);
        }
        return @(AWSDynamoDBReplicaStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBReplicaStatusCreating:
                return @"CREATING";
            case AWSDynamoDBReplicaStatusUpdating:
                return @"UPDATING";
            case AWSDynamoDBReplicaStatusDeleting:
                return @"DELETING";
            case AWSDynamoDBReplicaStatusActive:
                return @"ACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBReplicaSettingsUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regionName" : @"RegionName",
             @"replicaGlobalSecondaryIndexSettingsUpdate" : @"ReplicaGlobalSecondaryIndexSettingsUpdate",
             @"replicaProvisionedReadCapacityUnits" : @"ReplicaProvisionedReadCapacityUnits",
             };
}

+ (NSValueTransformer *)replicaGlobalSecondaryIndexSettingsUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaGlobalSecondaryIndexSettingsUpdate class]];
}

@end

@implementation AWSDynamoDBReplicaUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"create" : @"Create",
             @"remove" : @"Delete",
             };
}

+ (NSValueTransformer *)createJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBCreateReplicaAction class]];
}

+ (NSValueTransformer *)removeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBDeleteReplicaAction class]];
}

@end

@implementation AWSDynamoDBRestoreSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"restoreDateTime" : @"RestoreDateTime",
             @"restoreInProgress" : @"RestoreInProgress",
             @"sourceBackupArn" : @"SourceBackupArn",
             @"sourceTableArn" : @"SourceTableArn",
             };
}

+ (NSValueTransformer *)restoreDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDynamoDBRestoreTableFromBackupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backupArn" : @"BackupArn",
             @"targetTableName" : @"TargetTableName",
             };
}

@end

@implementation AWSDynamoDBRestoreTableFromBackupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableDescription" : @"TableDescription",
             };
}

+ (NSValueTransformer *)tableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableDescription class]];
}

@end

@implementation AWSDynamoDBRestoreTableToPointInTimeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"restoreDateTime" : @"RestoreDateTime",
             @"sourceTableName" : @"SourceTableName",
             @"targetTableName" : @"TargetTableName",
             @"useLatestRestorableTime" : @"UseLatestRestorableTime",
             };
}

+ (NSValueTransformer *)restoreDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDynamoDBRestoreTableToPointInTimeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableDescription" : @"TableDescription",
             };
}

+ (NSValueTransformer *)tableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTableDescription class]];
}

@end

@implementation AWSDynamoDBSSEDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"KMSMasterKeyArn" : @"KMSMasterKeyArn",
             @"SSEType" : @"SSEType",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)SSETypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSDynamoDBSSETypeAES256);
        }
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSDynamoDBSSETypeKms);
        }
        return @(AWSDynamoDBSSETypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBSSETypeAES256:
                return @"AES256";
            case AWSDynamoDBSSETypeKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBSSEStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBSSEStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBSSEStatusDisabling);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBSSEStatusDisabled);
        }
        return @(AWSDynamoDBSSEStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBSSEStatusEnabling:
                return @"ENABLING";
            case AWSDynamoDBSSEStatusEnabled:
                return @"ENABLED";
            case AWSDynamoDBSSEStatusDisabling:
                return @"DISABLING";
            case AWSDynamoDBSSEStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBSSESpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
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

@implementation AWSDynamoDBSourceTableDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"itemCount" : @"ItemCount",
             @"keySchema" : @"KeySchema",
             @"provisionedThroughput" : @"ProvisionedThroughput",
             @"tableArn" : @"TableArn",
             @"tableCreationDateTime" : @"TableCreationDateTime",
             @"tableId" : @"TableId",
             @"tableName" : @"TableName",
             @"tableSizeBytes" : @"TableSizeBytes",
             };
}

+ (NSValueTransformer *)keySchemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBKeySchemaElement class]];
}

+ (NSValueTransformer *)provisionedThroughputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBProvisionedThroughput class]];
}

+ (NSValueTransformer *)tableCreationDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDynamoDBSourceTableFeatureDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalSecondaryIndexes" : @"GlobalSecondaryIndexes",
             @"localSecondaryIndexes" : @"LocalSecondaryIndexes",
             @"SSEDescription" : @"SSEDescription",
             @"streamDescription" : @"StreamDescription",
             @"timeToLiveDescription" : @"TimeToLiveDescription",
             };
}

+ (NSValueTransformer *)globalSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalSecondaryIndexInfo class]];
}

+ (NSValueTransformer *)localSecondaryIndexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBLocalSecondaryIndexInfo class]];
}

+ (NSValueTransformer *)SSEDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSSEDescription class]];
}

+ (NSValueTransformer *)streamDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBStreamSpecification class]];
}

+ (NSValueTransformer *)timeToLiveDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTimeToLiveDescription class]];
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
             @"restoreSummary" : @"RestoreSummary",
             @"SSEDescription" : @"SSEDescription",
             @"streamSpecification" : @"StreamSpecification",
             @"tableArn" : @"TableArn",
             @"tableId" : @"TableId",
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

+ (NSValueTransformer *)restoreSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBRestoreSummary class]];
}

+ (NSValueTransformer *)SSEDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBSSEDescription class]];
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

@implementation AWSDynamoDBTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSDynamoDBTagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBTag class]];
}

@end

@implementation AWSDynamoDBTimeToLiveDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"timeToLiveStatus" : @"TimeToLiveStatus",
             };
}

+ (NSValueTransformer *)timeToLiveStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBTimeToLiveStatusEnabling);
        }
        if ([value caseInsensitiveCompare:@"DISABLING"] == NSOrderedSame) {
            return @(AWSDynamoDBTimeToLiveStatusDisabling);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBTimeToLiveStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSDynamoDBTimeToLiveStatusDisabled);
        }
        return @(AWSDynamoDBTimeToLiveStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDynamoDBTimeToLiveStatusEnabling:
                return @"ENABLING";
            case AWSDynamoDBTimeToLiveStatusDisabling:
                return @"DISABLING";
            case AWSDynamoDBTimeToLiveStatusEnabled:
                return @"ENABLED";
            case AWSDynamoDBTimeToLiveStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDynamoDBTimeToLiveSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSDynamoDBUntagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSDynamoDBUpdateContinuousBackupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pointInTimeRecoverySpecification" : @"PointInTimeRecoverySpecification",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)pointInTimeRecoverySpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBPointInTimeRecoverySpecification class]];
}

@end

@implementation AWSDynamoDBUpdateContinuousBackupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"continuousBackupsDescription" : @"ContinuousBackupsDescription",
             };
}

+ (NSValueTransformer *)continuousBackupsDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBContinuousBackupsDescription class]];
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

@implementation AWSDynamoDBUpdateGlobalTableInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             @"replicaUpdates" : @"ReplicaUpdates",
             };
}

+ (NSValueTransformer *)replicaUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaUpdate class]];
}

@end

@implementation AWSDynamoDBUpdateGlobalTableOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableDescription" : @"GlobalTableDescription",
             };
}

+ (NSValueTransformer *)globalTableDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBGlobalTableDescription class]];
}

@end

@implementation AWSDynamoDBUpdateGlobalTableSettingsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableGlobalSecondaryIndexSettingsUpdate" : @"GlobalTableGlobalSecondaryIndexSettingsUpdate",
             @"globalTableName" : @"GlobalTableName",
             @"globalTableProvisionedWriteCapacityUnits" : @"GlobalTableProvisionedWriteCapacityUnits",
             @"replicaSettingsUpdate" : @"ReplicaSettingsUpdate",
             };
}

+ (NSValueTransformer *)globalTableGlobalSecondaryIndexSettingsUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBGlobalTableGlobalSecondaryIndexSettingsUpdate class]];
}

+ (NSValueTransformer *)replicaSettingsUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaSettingsUpdate class]];
}

@end

@implementation AWSDynamoDBUpdateGlobalTableSettingsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"globalTableName" : @"GlobalTableName",
             @"replicaSettings" : @"ReplicaSettings",
             };
}

+ (NSValueTransformer *)replicaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDynamoDBReplicaSettingsDescription class]];
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

@implementation AWSDynamoDBUpdateTimeToLiveInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableName" : @"TableName",
             @"timeToLiveSpecification" : @"TimeToLiveSpecification",
             };
}

+ (NSValueTransformer *)timeToLiveSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTimeToLiveSpecification class]];
}

@end

@implementation AWSDynamoDBUpdateTimeToLiveOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timeToLiveSpecification" : @"TimeToLiveSpecification",
             };
}

+ (NSValueTransformer *)timeToLiveSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDynamoDBTimeToLiveSpecification class]];
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
