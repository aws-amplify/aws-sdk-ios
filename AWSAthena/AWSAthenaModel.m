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

#import "AWSAthenaModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSAthenaErrorDomain = @"com.amazonaws.AWSAthenaErrorDomain";

@implementation AWSAthenaBatchGetNamedQueryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"namedQueryIds" : @"NamedQueryIds",
             };
}

@end

@implementation AWSAthenaBatchGetNamedQueryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"namedQueries" : @"NamedQueries",
             @"unprocessedNamedQueryIds" : @"UnprocessedNamedQueryIds",
             };
}

+ (NSValueTransformer *)namedQueriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaNamedQuery class]];
}

+ (NSValueTransformer *)unprocessedNamedQueryIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaUnprocessedNamedQueryId class]];
}

@end

@implementation AWSAthenaBatchGetQueryExecutionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryExecutionIds" : @"QueryExecutionIds",
             };
}

@end

@implementation AWSAthenaBatchGetQueryExecutionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryExecutions" : @"QueryExecutions",
             @"unprocessedQueryExecutionIds" : @"UnprocessedQueryExecutionIds",
             };
}

+ (NSValueTransformer *)queryExecutionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaQueryExecution class]];
}

+ (NSValueTransformer *)unprocessedQueryExecutionIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaUnprocessedQueryExecutionId class]];
}

@end

@implementation AWSAthenaColumn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"name" : @"Name",
             @"types" : @"Type",
             };
}

@end

@implementation AWSAthenaColumnInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"caseSensitive" : @"CaseSensitive",
             @"catalogName" : @"CatalogName",
             @"label" : @"Label",
             @"name" : @"Name",
             @"nullable" : @"Nullable",
             @"precision" : @"Precision",
             @"scale" : @"Scale",
             @"schemaName" : @"SchemaName",
             @"tableName" : @"TableName",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)nullableJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_NULL"] == NSOrderedSame) {
            return @(AWSAthenaColumnNullableNotNull);
        }
        if ([value caseInsensitiveCompare:@"NULLABLE"] == NSOrderedSame) {
            return @(AWSAthenaColumnNullableNullable);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSAthenaColumnNullableUnknown);
        }
        return @(AWSAthenaColumnNullableUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAthenaColumnNullableNotNull:
                return @"NOT_NULL";
            case AWSAthenaColumnNullableNullable:
                return @"NULLABLE";
            case AWSAthenaColumnNullableUnknown:
                return @"UNKNOWN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAthenaCreateDataCatalogInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             @"parameters" : @"Parameters",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaTag class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSAthenaDataCatalogTypeLambda);
        }
        if ([value caseInsensitiveCompare:@"GLUE"] == NSOrderedSame) {
            return @(AWSAthenaDataCatalogTypeGlue);
        }
        if ([value caseInsensitiveCompare:@"HIVE"] == NSOrderedSame) {
            return @(AWSAthenaDataCatalogTypeHive);
        }
        return @(AWSAthenaDataCatalogTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAthenaDataCatalogTypeLambda:
                return @"LAMBDA";
            case AWSAthenaDataCatalogTypeGlue:
                return @"GLUE";
            case AWSAthenaDataCatalogTypeHive:
                return @"HIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAthenaCreateDataCatalogOutput

@end

@implementation AWSAthenaCreateNamedQueryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"database" : @"Database",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"queryString" : @"QueryString",
             @"workGroup" : @"WorkGroup",
             };
}

@end

@implementation AWSAthenaCreateNamedQueryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"namedQueryId" : @"NamedQueryId",
             };
}

@end

@implementation AWSAthenaCreateWorkGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configuration" : @"Configuration",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaWorkGroupConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaTag class]];
}

@end

@implementation AWSAthenaCreateWorkGroupOutput

@end

@implementation AWSAthenaDataCatalog

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             @"parameters" : @"Parameters",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSAthenaDataCatalogTypeLambda);
        }
        if ([value caseInsensitiveCompare:@"GLUE"] == NSOrderedSame) {
            return @(AWSAthenaDataCatalogTypeGlue);
        }
        if ([value caseInsensitiveCompare:@"HIVE"] == NSOrderedSame) {
            return @(AWSAthenaDataCatalogTypeHive);
        }
        return @(AWSAthenaDataCatalogTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAthenaDataCatalogTypeLambda:
                return @"LAMBDA";
            case AWSAthenaDataCatalogTypeGlue:
                return @"GLUE";
            case AWSAthenaDataCatalogTypeHive:
                return @"HIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAthenaDataCatalogSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogName" : @"CatalogName",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSAthenaDataCatalogTypeLambda);
        }
        if ([value caseInsensitiveCompare:@"GLUE"] == NSOrderedSame) {
            return @(AWSAthenaDataCatalogTypeGlue);
        }
        if ([value caseInsensitiveCompare:@"HIVE"] == NSOrderedSame) {
            return @(AWSAthenaDataCatalogTypeHive);
        }
        return @(AWSAthenaDataCatalogTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAthenaDataCatalogTypeLambda:
                return @"LAMBDA";
            case AWSAthenaDataCatalogTypeGlue:
                return @"GLUE";
            case AWSAthenaDataCatalogTypeHive:
                return @"HIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAthenaDatabase

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             @"parameters" : @"Parameters",
             };
}

@end

@implementation AWSAthenaDatum

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"varCharValue" : @"VarCharValue",
             };
}

@end

@implementation AWSAthenaDeleteDataCatalogInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSAthenaDeleteDataCatalogOutput

@end

@implementation AWSAthenaDeleteNamedQueryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"namedQueryId" : @"NamedQueryId",
             };
}

@end

@implementation AWSAthenaDeleteNamedQueryOutput

@end

@implementation AWSAthenaDeleteWorkGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recursiveDeleteOption" : @"RecursiveDeleteOption",
             @"workGroup" : @"WorkGroup",
             };
}

@end

@implementation AWSAthenaDeleteWorkGroupOutput

@end

@implementation AWSAthenaEncryptionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionOption" : @"EncryptionOption",
             @"kmsKey" : @"KmsKey",
             };
}

+ (NSValueTransformer *)encryptionOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SSE_S3"] == NSOrderedSame) {
            return @(AWSAthenaEncryptionOptionSseS3);
        }
        if ([value caseInsensitiveCompare:@"SSE_KMS"] == NSOrderedSame) {
            return @(AWSAthenaEncryptionOptionSseKms);
        }
        if ([value caseInsensitiveCompare:@"CSE_KMS"] == NSOrderedSame) {
            return @(AWSAthenaEncryptionOptionCseKms);
        }
        return @(AWSAthenaEncryptionOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAthenaEncryptionOptionSseS3:
                return @"SSE_S3";
            case AWSAthenaEncryptionOptionSseKms:
                return @"SSE_KMS";
            case AWSAthenaEncryptionOptionCseKms:
                return @"CSE_KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAthenaGetDataCatalogInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSAthenaGetDataCatalogOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataCatalog" : @"DataCatalog",
             };
}

+ (NSValueTransformer *)dataCatalogJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaDataCatalog class]];
}

@end

@implementation AWSAthenaGetDatabaseInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogName" : @"CatalogName",
             @"databaseName" : @"DatabaseName",
             };
}

@end

@implementation AWSAthenaGetDatabaseOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"database" : @"Database",
             };
}

+ (NSValueTransformer *)databaseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaDatabase class]];
}

@end

@implementation AWSAthenaGetNamedQueryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"namedQueryId" : @"NamedQueryId",
             };
}

@end

@implementation AWSAthenaGetNamedQueryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"namedQuery" : @"NamedQuery",
             };
}

+ (NSValueTransformer *)namedQueryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaNamedQuery class]];
}

@end

@implementation AWSAthenaGetQueryExecutionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryExecutionId" : @"QueryExecutionId",
             };
}

@end

@implementation AWSAthenaGetQueryExecutionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryExecution" : @"QueryExecution",
             };
}

+ (NSValueTransformer *)queryExecutionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaQueryExecution class]];
}

@end

@implementation AWSAthenaGetQueryResultsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"queryExecutionId" : @"QueryExecutionId",
             };
}

@end

@implementation AWSAthenaGetQueryResultsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resultSet" : @"ResultSet",
             @"updateCount" : @"UpdateCount",
             };
}

+ (NSValueTransformer *)resultSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaResultSet class]];
}

@end

@implementation AWSAthenaGetTableMetadataInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogName" : @"CatalogName",
             @"databaseName" : @"DatabaseName",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSAthenaGetTableMetadataOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableMetadata" : @"TableMetadata",
             };
}

+ (NSValueTransformer *)tableMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaTableMetadata class]];
}

@end

@implementation AWSAthenaGetWorkGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workGroup" : @"WorkGroup",
             };
}

@end

@implementation AWSAthenaGetWorkGroupOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workGroup" : @"WorkGroup",
             };
}

+ (NSValueTransformer *)workGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaWorkGroup class]];
}

@end

@implementation AWSAthenaListDataCatalogsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAthenaListDataCatalogsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataCatalogsSummary" : @"DataCatalogsSummary",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)dataCatalogsSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaDataCatalogSummary class]];
}

@end

@implementation AWSAthenaListDatabasesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogName" : @"CatalogName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAthenaListDatabasesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseList" : @"DatabaseList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)databaseListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaDatabase class]];
}

@end

@implementation AWSAthenaListNamedQueriesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"workGroup" : @"WorkGroup",
             };
}

@end

@implementation AWSAthenaListNamedQueriesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"namedQueryIds" : @"NamedQueryIds",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAthenaListQueryExecutionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"workGroup" : @"WorkGroup",
             };
}

@end

@implementation AWSAthenaListQueryExecutionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"queryExecutionIds" : @"QueryExecutionIds",
             };
}

@end

@implementation AWSAthenaListTableMetadataInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogName" : @"CatalogName",
             @"databaseName" : @"DatabaseName",
             @"expression" : @"Expression",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAthenaListTableMetadataOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tableMetadataList" : @"TableMetadataList",
             };
}

+ (NSValueTransformer *)tableMetadataListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaTableMetadata class]];
}

@end

@implementation AWSAthenaListTagsForResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSAthenaListTagsForResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaTag class]];
}

@end

@implementation AWSAthenaListWorkGroupsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAthenaListWorkGroupsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"workGroups" : @"WorkGroups",
             };
}

+ (NSValueTransformer *)workGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaWorkGroupSummary class]];
}

@end

@implementation AWSAthenaNamedQuery

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"database" : @"Database",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"namedQueryId" : @"NamedQueryId",
             @"queryString" : @"QueryString",
             @"workGroup" : @"WorkGroup",
             };
}

@end

@implementation AWSAthenaQueryExecution

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"query" : @"Query",
             @"queryExecutionContext" : @"QueryExecutionContext",
             @"queryExecutionId" : @"QueryExecutionId",
             @"resultConfiguration" : @"ResultConfiguration",
             @"statementType" : @"StatementType",
             @"statistics" : @"Statistics",
             @"status" : @"Status",
             @"workGroup" : @"WorkGroup",
             };
}

+ (NSValueTransformer *)queryExecutionContextJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaQueryExecutionContext class]];
}

+ (NSValueTransformer *)resultConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaResultConfiguration class]];
}

+ (NSValueTransformer *)statementTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DDL"] == NSOrderedSame) {
            return @(AWSAthenaStatementTypeDdl);
        }
        if ([value caseInsensitiveCompare:@"DML"] == NSOrderedSame) {
            return @(AWSAthenaStatementTypeDml);
        }
        if ([value caseInsensitiveCompare:@"UTILITY"] == NSOrderedSame) {
            return @(AWSAthenaStatementTypeUtility);
        }
        return @(AWSAthenaStatementTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAthenaStatementTypeDdl:
                return @"DDL";
            case AWSAthenaStatementTypeDml:
                return @"DML";
            case AWSAthenaStatementTypeUtility:
                return @"UTILITY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaQueryExecutionStatistics class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaQueryExecutionStatus class]];
}

@end

@implementation AWSAthenaQueryExecutionContext

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalog" : @"Catalog",
             @"database" : @"Database",
             };
}

@end

@implementation AWSAthenaQueryExecutionStatistics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataManifestLocation" : @"DataManifestLocation",
             @"dataScannedInBytes" : @"DataScannedInBytes",
             @"engineExecutionTimeInMillis" : @"EngineExecutionTimeInMillis",
             @"queryPlanningTimeInMillis" : @"QueryPlanningTimeInMillis",
             @"queryQueueTimeInMillis" : @"QueryQueueTimeInMillis",
             @"serviceProcessingTimeInMillis" : @"ServiceProcessingTimeInMillis",
             @"totalExecutionTimeInMillis" : @"TotalExecutionTimeInMillis",
             };
}

@end

@implementation AWSAthenaQueryExecutionStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionDateTime" : @"CompletionDateTime",
             @"state" : @"State",
             @"stateChangeReason" : @"StateChangeReason",
             @"submissionDateTime" : @"SubmissionDateTime",
             };
}

+ (NSValueTransformer *)completionDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSAthenaQueryExecutionStateQueued);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSAthenaQueryExecutionStateRunning);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSAthenaQueryExecutionStateSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSAthenaQueryExecutionStateFailed);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSAthenaQueryExecutionStateCancelled);
        }
        return @(AWSAthenaQueryExecutionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAthenaQueryExecutionStateQueued:
                return @"QUEUED";
            case AWSAthenaQueryExecutionStateRunning:
                return @"RUNNING";
            case AWSAthenaQueryExecutionStateSucceeded:
                return @"SUCCEEDED";
            case AWSAthenaQueryExecutionStateFailed:
                return @"FAILED";
            case AWSAthenaQueryExecutionStateCancelled:
                return @"CANCELLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submissionDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAthenaResultConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"outputLocation" : @"OutputLocation",
             };
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaEncryptionConfiguration class]];
}

@end

@implementation AWSAthenaResultConfigurationUpdates

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"outputLocation" : @"OutputLocation",
             @"removeEncryptionConfiguration" : @"RemoveEncryptionConfiguration",
             @"removeOutputLocation" : @"RemoveOutputLocation",
             };
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaEncryptionConfiguration class]];
}

@end

@implementation AWSAthenaResultSet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resultSetMetadata" : @"ResultSetMetadata",
             @"rows" : @"Rows",
             };
}

+ (NSValueTransformer *)resultSetMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaResultSetMetadata class]];
}

+ (NSValueTransformer *)rowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaRow class]];
}

@end

@implementation AWSAthenaResultSetMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columnInfo" : @"ColumnInfo",
             };
}

+ (NSValueTransformer *)columnInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaColumnInfo class]];
}

@end

@implementation AWSAthenaRow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             };
}

+ (NSValueTransformer *)dataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaDatum class]];
}

@end

@implementation AWSAthenaStartQueryExecutionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"queryExecutionContext" : @"QueryExecutionContext",
             @"queryString" : @"QueryString",
             @"resultConfiguration" : @"ResultConfiguration",
             @"workGroup" : @"WorkGroup",
             };
}

+ (NSValueTransformer *)queryExecutionContextJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaQueryExecutionContext class]];
}

+ (NSValueTransformer *)resultConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaResultConfiguration class]];
}

@end

@implementation AWSAthenaStartQueryExecutionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryExecutionId" : @"QueryExecutionId",
             };
}

@end

@implementation AWSAthenaStopQueryExecutionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryExecutionId" : @"QueryExecutionId",
             };
}

@end

@implementation AWSAthenaStopQueryExecutionOutput

@end

@implementation AWSAthenaTableMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columns" : @"Columns",
             @"createTime" : @"CreateTime",
             @"lastAccessTime" : @"LastAccessTime",
             @"name" : @"Name",
             @"parameters" : @"Parameters",
             @"partitionKeys" : @"PartitionKeys",
             @"tableType" : @"TableType",
             };
}

+ (NSValueTransformer *)columnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaColumn class]];
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastAccessTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)partitionKeysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaColumn class]];
}

@end

@implementation AWSAthenaTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSAthenaTagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAthenaTag class]];
}

@end

@implementation AWSAthenaTagResourceOutput

@end

@implementation AWSAthenaUnprocessedNamedQueryId

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"namedQueryId" : @"NamedQueryId",
             };
}

@end

@implementation AWSAthenaUnprocessedQueryExecutionId

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"queryExecutionId" : @"QueryExecutionId",
             };
}

@end

@implementation AWSAthenaUntagResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSAthenaUntagResourceOutput

@end

@implementation AWSAthenaUpdateDataCatalogInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             @"parameters" : @"Parameters",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LAMBDA"] == NSOrderedSame) {
            return @(AWSAthenaDataCatalogTypeLambda);
        }
        if ([value caseInsensitiveCompare:@"GLUE"] == NSOrderedSame) {
            return @(AWSAthenaDataCatalogTypeGlue);
        }
        if ([value caseInsensitiveCompare:@"HIVE"] == NSOrderedSame) {
            return @(AWSAthenaDataCatalogTypeHive);
        }
        return @(AWSAthenaDataCatalogTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAthenaDataCatalogTypeLambda:
                return @"LAMBDA";
            case AWSAthenaDataCatalogTypeGlue:
                return @"GLUE";
            case AWSAthenaDataCatalogTypeHive:
                return @"HIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAthenaUpdateDataCatalogOutput

@end

@implementation AWSAthenaUpdateWorkGroupInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationUpdates" : @"ConfigurationUpdates",
             @"detail" : @"Description",
             @"state" : @"State",
             @"workGroup" : @"WorkGroup",
             };
}

+ (NSValueTransformer *)configurationUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaWorkGroupConfigurationUpdates class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSAthenaWorkGroupStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSAthenaWorkGroupStateDisabled);
        }
        return @(AWSAthenaWorkGroupStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAthenaWorkGroupStateEnabled:
                return @"ENABLED";
            case AWSAthenaWorkGroupStateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAthenaUpdateWorkGroupOutput

@end

@implementation AWSAthenaWorkGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configuration" : @"Configuration",
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaWorkGroupConfiguration class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSAthenaWorkGroupStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSAthenaWorkGroupStateDisabled);
        }
        return @(AWSAthenaWorkGroupStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAthenaWorkGroupStateEnabled:
                return @"ENABLED";
            case AWSAthenaWorkGroupStateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAthenaWorkGroupConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytesScannedCutoffPerQuery" : @"BytesScannedCutoffPerQuery",
             @"enforceWorkGroupConfiguration" : @"EnforceWorkGroupConfiguration",
             @"publishCloudWatchMetricsEnabled" : @"PublishCloudWatchMetricsEnabled",
             @"requesterPaysEnabled" : @"RequesterPaysEnabled",
             @"resultConfiguration" : @"ResultConfiguration",
             };
}

+ (NSValueTransformer *)resultConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaResultConfiguration class]];
}

@end

@implementation AWSAthenaWorkGroupConfigurationUpdates

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytesScannedCutoffPerQuery" : @"BytesScannedCutoffPerQuery",
             @"enforceWorkGroupConfiguration" : @"EnforceWorkGroupConfiguration",
             @"publishCloudWatchMetricsEnabled" : @"PublishCloudWatchMetricsEnabled",
             @"removeBytesScannedCutoffPerQuery" : @"RemoveBytesScannedCutoffPerQuery",
             @"requesterPaysEnabled" : @"RequesterPaysEnabled",
             @"resultConfigurationUpdates" : @"ResultConfigurationUpdates",
             };
}

+ (NSValueTransformer *)resultConfigurationUpdatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAthenaResultConfigurationUpdates class]];
}

@end

@implementation AWSAthenaWorkGroupSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSAthenaWorkGroupStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSAthenaWorkGroupStateDisabled);
        }
        return @(AWSAthenaWorkGroupStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAthenaWorkGroupStateEnabled:
                return @"ENABLED";
            case AWSAthenaWorkGroupStateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end
