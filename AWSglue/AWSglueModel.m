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

#import "AWSglueModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSglueErrorDomain = @"com.amazonaws.AWSglueErrorDomain";

@implementation AWSglueAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arguments" : @"Arguments",
             @"crawlerName" : @"CrawlerName",
             @"jobName" : @"JobName",
             @"notificationProperty" : @"NotificationProperty",
             @"securityConfiguration" : @"SecurityConfiguration",
             @"timeout" : @"Timeout",
             };
}

+ (NSValueTransformer *)notificationPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueNotificationProperty class]];
}

@end

@implementation AWSglueBatchCreatePartitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"partitionInputList" : @"PartitionInputList",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)partitionInputListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSgluePartitionInput class]];
}

@end

@implementation AWSglueBatchCreatePartitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSgluePartitionError class]];
}

@end

@implementation AWSglueBatchDeleteConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"connectionNameList" : @"ConnectionNameList",
             };
}

@end

@implementation AWSglueBatchDeleteConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             @"succeeded" : @"Succeeded",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSglueErrorDetail class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSglueBatchDeletePartitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"partitionsToDelete" : @"PartitionsToDelete",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)partitionsToDeleteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSgluePartitionValueList class]];
}

@end

@implementation AWSglueBatchDeletePartitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSgluePartitionError class]];
}

@end

@implementation AWSglueBatchDeleteTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"tablesToDelete" : @"TablesToDelete",
             };
}

@end

@implementation AWSglueBatchDeleteTableResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueTableError class]];
}

@end

@implementation AWSglueBatchDeleteTableVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"tableName" : @"TableName",
             @"versionIds" : @"VersionIds",
             };
}

@end

@implementation AWSglueBatchDeleteTableVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueTableVersionError class]];
}

@end

@implementation AWSglueBatchGetCrawlersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerNames" : @"CrawlerNames",
             };
}

@end

@implementation AWSglueBatchGetCrawlersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlers" : @"Crawlers",
             @"crawlersNotFound" : @"CrawlersNotFound",
             };
}

+ (NSValueTransformer *)crawlersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCrawler class]];
}

@end

@implementation AWSglueBatchGetDevEndpointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devEndpointNames" : @"DevEndpointNames",
             };
}

@end

@implementation AWSglueBatchGetDevEndpointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devEndpoints" : @"DevEndpoints",
             @"devEndpointsNotFound" : @"DevEndpointsNotFound",
             };
}

+ (NSValueTransformer *)devEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueDevEndpoint class]];
}

@end

@implementation AWSglueBatchGetJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobNames" : @"JobNames",
             };
}

@end

@implementation AWSglueBatchGetJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobs" : @"Jobs",
             @"jobsNotFound" : @"JobsNotFound",
             };
}

+ (NSValueTransformer *)jobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueJob class]];
}

@end

@implementation AWSglueBatchGetPartitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"partitionsToGet" : @"PartitionsToGet",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)partitionsToGetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSgluePartitionValueList class]];
}

@end

@implementation AWSglueBatchGetPartitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"partitions" : @"Partitions",
             @"unprocessedKeys" : @"UnprocessedKeys",
             };
}

+ (NSValueTransformer *)partitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSgluePartition class]];
}

+ (NSValueTransformer *)unprocessedKeysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSgluePartitionValueList class]];
}

@end

@implementation AWSglueBatchGetTriggersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"triggerNames" : @"TriggerNames",
             };
}

@end

@implementation AWSglueBatchGetTriggersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"triggers" : @"Triggers",
             @"triggersNotFound" : @"TriggersNotFound",
             };
}

+ (NSValueTransformer *)triggersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueTrigger class]];
}

@end

@implementation AWSglueBatchGetWorkflowsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeGraph" : @"IncludeGraph",
             @"names" : @"Names",
             };
}

@end

@implementation AWSglueBatchGetWorkflowsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"missingWorkflows" : @"MissingWorkflows",
             @"workflows" : @"Workflows",
             };
}

+ (NSValueTransformer *)workflowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueWorkflow class]];
}

@end

@implementation AWSglueBatchStopJobRunError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorDetail" : @"ErrorDetail",
             @"jobName" : @"JobName",
             @"jobRunId" : @"JobRunId",
             };
}

+ (NSValueTransformer *)errorDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueErrorDetail class]];
}

@end

@implementation AWSglueBatchStopJobRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobRunIds" : @"JobRunIds",
             };
}

@end

@implementation AWSglueBatchStopJobRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             @"successfulSubmissions" : @"SuccessfulSubmissions",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueBatchStopJobRunError class]];
}

+ (NSValueTransformer *)successfulSubmissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueBatchStopJobRunSuccessfulSubmission class]];
}

@end

@implementation AWSglueBatchStopJobRunSuccessfulSubmission

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobRunId" : @"JobRunId",
             };
}

@end

@implementation AWSglueCancelMLTaskRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskRunId" : @"TaskRunId",
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSglueCancelMLTaskRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"taskRunId" : @"TaskRunId",
             @"transformId" : @"TransformId",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeStopped);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeTimeout);
        }
        return @(AWSglueTaskStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTaskStatusTypeStarting:
                return @"STARTING";
            case AWSglueTaskStatusTypeRunning:
                return @"RUNNING";
            case AWSglueTaskStatusTypeStopping:
                return @"STOPPING";
            case AWSglueTaskStatusTypeStopped:
                return @"STOPPED";
            case AWSglueTaskStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSglueTaskStatusTypeFailed:
                return @"FAILED";
            case AWSglueTaskStatusTypeTimeout:
                return @"TIMEOUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueCatalogEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseName" : @"DatabaseName",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSglueCatalogImportStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importCompleted" : @"ImportCompleted",
             @"importTime" : @"ImportTime",
             @"importedBy" : @"ImportedBy",
             };
}

+ (NSValueTransformer *)importTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSglueCatalogTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseName" : @"DatabaseName",
             @"tables" : @"Tables",
             };
}

@end

@implementation AWSglueClassifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"csvClassifier" : @"CsvClassifier",
             @"grokClassifier" : @"GrokClassifier",
             @"jsonClassifier" : @"JsonClassifier",
             @"XMLClassifier" : @"XMLClassifier",
             };
}

+ (NSValueTransformer *)csvClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCsvClassifier class]];
}

+ (NSValueTransformer *)grokClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueGrokClassifier class]];
}

+ (NSValueTransformer *)jsonClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueJsonClassifier class]];
}

+ (NSValueTransformer *)XMLClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueXMLClassifier class]];
}

@end

@implementation AWSglueCloudWatchEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchEncryptionMode" : @"CloudWatchEncryptionMode",
             @"kmsKeyArn" : @"KmsKeyArn",
             };
}

+ (NSValueTransformer *)cloudWatchEncryptionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSglueCloudWatchEncryptionModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"SSE-KMS"] == NSOrderedSame) {
            return @(AWSglueCloudWatchEncryptionModeSseKms);
        }
        return @(AWSglueCloudWatchEncryptionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueCloudWatchEncryptionModeDisabled:
                return @"DISABLED";
            case AWSglueCloudWatchEncryptionModeSseKms:
                return @"SSE-KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueCodeGenEdge

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"source" : @"Source",
             @"target" : @"Target",
             @"targetParameter" : @"TargetParameter",
             };
}

@end

@implementation AWSglueCodeGenNode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"args" : @"Args",
             @"identifier" : @"Id",
             @"lineNumber" : @"LineNumber",
             @"nodeType" : @"NodeType",
             };
}

+ (NSValueTransformer *)argsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCodeGenNodeArg class]];
}

@end

@implementation AWSglueCodeGenNodeArg

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"param" : @"Param",
             @"value" : @"Value",
             };
}

@end

@implementation AWSglueColumn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"name" : @"Name",
             @"parameters" : @"Parameters",
             @"types" : @"Type",
             };
}

@end

@implementation AWSglueCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlState" : @"CrawlState",
             @"crawlerName" : @"CrawlerName",
             @"jobName" : @"JobName",
             @"logicalOperator" : @"LogicalOperator",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)crawlStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSglueCrawlStateRunning);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSglueCrawlStateSucceeded);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSglueCrawlStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSglueCrawlStateFailed);
        }
        return @(AWSglueCrawlStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueCrawlStateRunning:
                return @"RUNNING";
            case AWSglueCrawlStateSucceeded:
                return @"SUCCEEDED";
            case AWSglueCrawlStateCancelled:
                return @"CANCELLED";
            case AWSglueCrawlStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)logicalOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQUALS"] == NSOrderedSame) {
            return @(AWSglueLogicalOperatorEquals);
        }
        return @(AWSglueLogicalOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueLogicalOperatorEquals:
                return @"EQUALS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSglueJobRunStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSglueJobRunStateRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSglueJobRunStateStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSglueJobRunStateStopped);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSglueJobRunStateSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSglueJobRunStateFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSglueJobRunStateTimeout);
        }
        return @(AWSglueJobRunStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueJobRunStateStarting:
                return @"STARTING";
            case AWSglueJobRunStateRunning:
                return @"RUNNING";
            case AWSglueJobRunStateStopping:
                return @"STOPPING";
            case AWSglueJobRunStateStopped:
                return @"STOPPED";
            case AWSglueJobRunStateSucceeded:
                return @"SUCCEEDED";
            case AWSglueJobRunStateFailed:
                return @"FAILED";
            case AWSglueJobRunStateTimeout:
                return @"TIMEOUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueConfusionMatrix

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numFalseNegatives" : @"NumFalseNegatives",
             @"numFalsePositives" : @"NumFalsePositives",
             @"numTrueNegatives" : @"NumTrueNegatives",
             @"numTruePositives" : @"NumTruePositives",
             };
}

@end

@implementation AWSglueConnection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionProperties" : @"ConnectionProperties",
             @"connectionType" : @"ConnectionType",
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"lastUpdatedBy" : @"LastUpdatedBy",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"matchCriteria" : @"MatchCriteria",
             @"name" : @"Name",
             @"physicalConnectionRequirements" : @"PhysicalConnectionRequirements",
             };
}

+ (NSValueTransformer *)connectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JDBC"] == NSOrderedSame) {
            return @(AWSglueConnectionTypeJdbc);
        }
        if ([value caseInsensitiveCompare:@"SFTP"] == NSOrderedSame) {
            return @(AWSglueConnectionTypeSftp);
        }
        if ([value caseInsensitiveCompare:@"MONGODB"] == NSOrderedSame) {
            return @(AWSglueConnectionTypeMongodb);
        }
        if ([value caseInsensitiveCompare:@"KAFKA"] == NSOrderedSame) {
            return @(AWSglueConnectionTypeKafka);
        }
        return @(AWSglueConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueConnectionTypeJdbc:
                return @"JDBC";
            case AWSglueConnectionTypeSftp:
                return @"SFTP";
            case AWSglueConnectionTypeMongodb:
                return @"MONGODB";
            case AWSglueConnectionTypeKafka:
                return @"KAFKA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)physicalConnectionRequirementsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSgluePhysicalConnectionRequirements class]];
}

@end

@implementation AWSglueConnectionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionProperties" : @"ConnectionProperties",
             @"connectionType" : @"ConnectionType",
             @"detail" : @"Description",
             @"matchCriteria" : @"MatchCriteria",
             @"name" : @"Name",
             @"physicalConnectionRequirements" : @"PhysicalConnectionRequirements",
             };
}

+ (NSValueTransformer *)connectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JDBC"] == NSOrderedSame) {
            return @(AWSglueConnectionTypeJdbc);
        }
        if ([value caseInsensitiveCompare:@"SFTP"] == NSOrderedSame) {
            return @(AWSglueConnectionTypeSftp);
        }
        if ([value caseInsensitiveCompare:@"MONGODB"] == NSOrderedSame) {
            return @(AWSglueConnectionTypeMongodb);
        }
        if ([value caseInsensitiveCompare:@"KAFKA"] == NSOrderedSame) {
            return @(AWSglueConnectionTypeKafka);
        }
        return @(AWSglueConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueConnectionTypeJdbc:
                return @"JDBC";
            case AWSglueConnectionTypeSftp:
                return @"SFTP";
            case AWSglueConnectionTypeMongodb:
                return @"MONGODB";
            case AWSglueConnectionTypeKafka:
                return @"KAFKA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)physicalConnectionRequirementsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSgluePhysicalConnectionRequirements class]];
}

@end

@implementation AWSglueConnectionPasswordEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsKmsKeyId" : @"AwsKmsKeyId",
             @"returnConnectionPasswordEncrypted" : @"ReturnConnectionPasswordEncrypted",
             };
}

@end

@implementation AWSglueConnectionsList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connections" : @"Connections",
             };
}

@end

@implementation AWSglueCrawl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completedOn" : @"CompletedOn",
             @"errorMessage" : @"ErrorMessage",
             @"logGroup" : @"LogGroup",
             @"logStream" : @"LogStream",
             @"startedOn" : @"StartedOn",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)completedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSglueCrawlStateRunning);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSglueCrawlStateSucceeded);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSglueCrawlStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSglueCrawlStateFailed);
        }
        return @(AWSglueCrawlStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueCrawlStateRunning:
                return @"RUNNING";
            case AWSglueCrawlStateSucceeded:
                return @"SUCCEEDED";
            case AWSglueCrawlStateCancelled:
                return @"CANCELLED";
            case AWSglueCrawlStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueCrawler

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classifiers" : @"Classifiers",
             @"configuration" : @"Configuration",
             @"crawlElapsedTime" : @"CrawlElapsedTime",
             @"crawlerSecurityConfiguration" : @"CrawlerSecurityConfiguration",
             @"creationTime" : @"CreationTime",
             @"databaseName" : @"DatabaseName",
             @"detail" : @"Description",
             @"lastCrawl" : @"LastCrawl",
             @"lastUpdated" : @"LastUpdated",
             @"name" : @"Name",
             @"role" : @"Role",
             @"schedule" : @"Schedule",
             @"schemaChangePolicy" : @"SchemaChangePolicy",
             @"state" : @"State",
             @"tablePrefix" : @"TablePrefix",
             @"targets" : @"Targets",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastCrawlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueLastCrawlInfo class]];
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueSchedule class]];
}

+ (NSValueTransformer *)schemaChangePolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueSchemaChangePolicy class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSglueCrawlerStateReady);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSglueCrawlerStateRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSglueCrawlerStateStopping);
        }
        return @(AWSglueCrawlerStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueCrawlerStateReady:
                return @"READY";
            case AWSglueCrawlerStateRunning:
                return @"RUNNING";
            case AWSglueCrawlerStateStopping:
                return @"STOPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCrawlerTargets class]];
}

@end

@implementation AWSglueCrawlerMetrics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerName" : @"CrawlerName",
             @"lastRuntimeSeconds" : @"LastRuntimeSeconds",
             @"medianRuntimeSeconds" : @"MedianRuntimeSeconds",
             @"stillEstimating" : @"StillEstimating",
             @"tablesCreated" : @"TablesCreated",
             @"tablesDeleted" : @"TablesDeleted",
             @"tablesUpdated" : @"TablesUpdated",
             @"timeLeftSeconds" : @"TimeLeftSeconds",
             };
}

@end

@implementation AWSglueCrawlerNodeDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawls" : @"Crawls",
             };
}

+ (NSValueTransformer *)crawlsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCrawl class]];
}

@end

@implementation AWSglueCrawlerTargets

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogTargets" : @"CatalogTargets",
             @"dynamoDBTargets" : @"DynamoDBTargets",
             @"jdbcTargets" : @"JdbcTargets",
             @"s3Targets" : @"S3Targets",
             };
}

+ (NSValueTransformer *)catalogTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCatalogTarget class]];
}

+ (NSValueTransformer *)dynamoDBTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueDynamoDBTarget class]];
}

+ (NSValueTransformer *)jdbcTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueJdbcTarget class]];
}

+ (NSValueTransformer *)s3TargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueS3Target class]];
}

@end

@implementation AWSglueCreateClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"csvClassifier" : @"CsvClassifier",
             @"grokClassifier" : @"GrokClassifier",
             @"jsonClassifier" : @"JsonClassifier",
             @"XMLClassifier" : @"XMLClassifier",
             };
}

+ (NSValueTransformer *)csvClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCreateCsvClassifierRequest class]];
}

+ (NSValueTransformer *)grokClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCreateGrokClassifierRequest class]];
}

+ (NSValueTransformer *)jsonClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCreateJsonClassifierRequest class]];
}

+ (NSValueTransformer *)XMLClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCreateXMLClassifierRequest class]];
}

@end

@implementation AWSglueCreateClassifierResponse

@end

@implementation AWSglueCreateConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"connectionInput" : @"ConnectionInput",
             };
}

+ (NSValueTransformer *)connectionInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueConnectionInput class]];
}

@end

@implementation AWSglueCreateConnectionResponse

@end

@implementation AWSglueCreateCrawlerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classifiers" : @"Classifiers",
             @"configuration" : @"Configuration",
             @"crawlerSecurityConfiguration" : @"CrawlerSecurityConfiguration",
             @"databaseName" : @"DatabaseName",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"role" : @"Role",
             @"schedule" : @"Schedule",
             @"schemaChangePolicy" : @"SchemaChangePolicy",
             @"tablePrefix" : @"TablePrefix",
             @"tags" : @"Tags",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)schemaChangePolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueSchemaChangePolicy class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCrawlerTargets class]];
}

@end

@implementation AWSglueCreateCrawlerResponse

@end

@implementation AWSglueCreateCsvClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowSingleColumn" : @"AllowSingleColumn",
             @"containsHeader" : @"ContainsHeader",
             @"delimiter" : @"Delimiter",
             @"disableValueTrimming" : @"DisableValueTrimming",
             @"header" : @"Header",
             @"name" : @"Name",
             @"quoteSymbol" : @"QuoteSymbol",
             };
}

+ (NSValueTransformer *)containsHeaderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSglueCsvHeaderOptionUnknown);
        }
        if ([value caseInsensitiveCompare:@"PRESENT"] == NSOrderedSame) {
            return @(AWSglueCsvHeaderOptionPresent);
        }
        if ([value caseInsensitiveCompare:@"ABSENT"] == NSOrderedSame) {
            return @(AWSglueCsvHeaderOptionAbsent);
        }
        return @(AWSglueCsvHeaderOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueCsvHeaderOptionUnknown:
                return @"UNKNOWN";
            case AWSglueCsvHeaderOptionPresent:
                return @"PRESENT";
            case AWSglueCsvHeaderOptionAbsent:
                return @"ABSENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueCreateDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseInput" : @"DatabaseInput",
             };
}

+ (NSValueTransformer *)databaseInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueDatabaseInput class]];
}

@end

@implementation AWSglueCreateDatabaseResponse

@end

@implementation AWSglueCreateDevEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arguments" : @"Arguments",
             @"endpointName" : @"EndpointName",
             @"extraJarsS3Path" : @"ExtraJarsS3Path",
             @"extraPythonLibsS3Path" : @"ExtraPythonLibsS3Path",
             @"glueVersion" : @"GlueVersion",
             @"numberOfNodes" : @"NumberOfNodes",
             @"numberOfWorkers" : @"NumberOfWorkers",
             @"publicKey" : @"PublicKey",
             @"publicKeys" : @"PublicKeys",
             @"roleArn" : @"RoleArn",
             @"securityConfiguration" : @"SecurityConfiguration",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetId" : @"SubnetId",
             @"tags" : @"Tags",
             @"workerType" : @"WorkerType",
             };
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG2x);
        }
        return @(AWSglueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueWorkerTypeStandard:
                return @"Standard";
            case AWSglueWorkerTypeG1x:
                return @"G.1X";
            case AWSglueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueCreateDevEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arguments" : @"Arguments",
             @"availabilityZone" : @"AvailabilityZone",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"endpointName" : @"EndpointName",
             @"extraJarsS3Path" : @"ExtraJarsS3Path",
             @"extraPythonLibsS3Path" : @"ExtraPythonLibsS3Path",
             @"failureReason" : @"FailureReason",
             @"glueVersion" : @"GlueVersion",
             @"numberOfNodes" : @"NumberOfNodes",
             @"numberOfWorkers" : @"NumberOfWorkers",
             @"roleArn" : @"RoleArn",
             @"securityConfiguration" : @"SecurityConfiguration",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"status" : @"Status",
             @"subnetId" : @"SubnetId",
             @"vpcId" : @"VpcId",
             @"workerType" : @"WorkerType",
             @"yarnEndpointAddress" : @"YarnEndpointAddress",
             @"zeppelinRemoteSparkInterpreterPort" : @"ZeppelinRemoteSparkInterpreterPort",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG2x);
        }
        return @(AWSglueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueWorkerTypeStandard:
                return @"Standard";
            case AWSglueWorkerTypeG1x:
                return @"G.1X";
            case AWSglueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueCreateGrokClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"customPatterns" : @"CustomPatterns",
             @"grokPattern" : @"GrokPattern",
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueCreateJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedCapacity" : @"AllocatedCapacity",
             @"command" : @"Command",
             @"connections" : @"Connections",
             @"defaultArguments" : @"DefaultArguments",
             @"detail" : @"Description",
             @"executionProperty" : @"ExecutionProperty",
             @"glueVersion" : @"GlueVersion",
             @"logUri" : @"LogUri",
             @"maxCapacity" : @"MaxCapacity",
             @"maxRetries" : @"MaxRetries",
             @"name" : @"Name",
             @"nonOverridableArguments" : @"NonOverridableArguments",
             @"notificationProperty" : @"NotificationProperty",
             @"numberOfWorkers" : @"NumberOfWorkers",
             @"role" : @"Role",
             @"securityConfiguration" : @"SecurityConfiguration",
             @"tags" : @"Tags",
             @"timeout" : @"Timeout",
             @"workerType" : @"WorkerType",
             };
}

+ (NSValueTransformer *)commandJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueJobCommand class]];
}

+ (NSValueTransformer *)connectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueConnectionsList class]];
}

+ (NSValueTransformer *)executionPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueExecutionProperty class]];
}

+ (NSValueTransformer *)notificationPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueNotificationProperty class]];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG2x);
        }
        return @(AWSglueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueWorkerTypeStandard:
                return @"Standard";
            case AWSglueWorkerTypeG1x:
                return @"G.1X";
            case AWSglueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueCreateJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueCreateJsonClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jsonPath" : @"JsonPath",
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueCreateMLTransformRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"glueVersion" : @"GlueVersion",
             @"inputRecordTables" : @"InputRecordTables",
             @"maxCapacity" : @"MaxCapacity",
             @"maxRetries" : @"MaxRetries",
             @"name" : @"Name",
             @"numberOfWorkers" : @"NumberOfWorkers",
             @"parameters" : @"Parameters",
             @"role" : @"Role",
             @"tags" : @"Tags",
             @"timeout" : @"Timeout",
             @"workerType" : @"WorkerType",
             };
}

+ (NSValueTransformer *)inputRecordTablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueGlueTable class]];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTransformParameters class]];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG2x);
        }
        return @(AWSglueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueWorkerTypeStandard:
                return @"Standard";
            case AWSglueWorkerTypeG1x:
                return @"G.1X";
            case AWSglueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueCreateMLTransformResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSglueCreatePartitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"partitionInput" : @"PartitionInput",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)partitionInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSgluePartitionInput class]];
}

@end

@implementation AWSglueCreatePartitionResponse

@end

@implementation AWSglueCreateScriptRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dagEdges" : @"DagEdges",
             @"dagNodes" : @"DagNodes",
             @"language" : @"Language",
             };
}

+ (NSValueTransformer *)dagEdgesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCodeGenEdge class]];
}

+ (NSValueTransformer *)dagNodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCodeGenNode class]];
}

+ (NSValueTransformer *)languageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PYTHON"] == NSOrderedSame) {
            return @(AWSglueLanguagePython);
        }
        if ([value caseInsensitiveCompare:@"SCALA"] == NSOrderedSame) {
            return @(AWSglueLanguageScala);
        }
        return @(AWSglueLanguageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueLanguagePython:
                return @"PYTHON";
            case AWSglueLanguageScala:
                return @"SCALA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueCreateScriptResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pythonScript" : @"PythonScript",
             @"scalaCode" : @"ScalaCode",
             };
}

@end

@implementation AWSglueCreateSecurityConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueEncryptionConfiguration class]];
}

@end

@implementation AWSglueCreateSecurityConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTimestamp" : @"CreatedTimestamp",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSglueCreateTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"tableInput" : @"TableInput",
             };
}

+ (NSValueTransformer *)tableInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTableInput class]];
}

@end

@implementation AWSglueCreateTableResponse

@end

@implementation AWSglueCreateTriggerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"predicate" : @"Predicate",
             @"schedule" : @"Schedule",
             @"startOnCreation" : @"StartOnCreation",
             @"tags" : @"Tags",
             @"types" : @"Type",
             @"workflowName" : @"WorkflowName",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueAction class]];
}

+ (NSValueTransformer *)predicateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSgluePredicate class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SCHEDULED"] == NSOrderedSame) {
            return @(AWSglueTriggerTypeScheduled);
        }
        if ([value caseInsensitiveCompare:@"CONDITIONAL"] == NSOrderedSame) {
            return @(AWSglueTriggerTypeConditional);
        }
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSglueTriggerTypeOnDemand);
        }
        return @(AWSglueTriggerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTriggerTypeScheduled:
                return @"SCHEDULED";
            case AWSglueTriggerTypeConditional:
                return @"CONDITIONAL";
            case AWSglueTriggerTypeOnDemand:
                return @"ON_DEMAND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueCreateTriggerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueCreateUserDefinedFunctionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"functionInput" : @"FunctionInput",
             };
}

+ (NSValueTransformer *)functionInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueUserDefinedFunctionInput class]];
}

@end

@implementation AWSglueCreateUserDefinedFunctionResponse

@end

@implementation AWSglueCreateWorkflowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultRunProperties" : @"DefaultRunProperties",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSglueCreateWorkflowResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueCreateXMLClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"name" : @"Name",
             @"rowTag" : @"RowTag",
             };
}

@end

@implementation AWSglueCsvClassifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowSingleColumn" : @"AllowSingleColumn",
             @"containsHeader" : @"ContainsHeader",
             @"creationTime" : @"CreationTime",
             @"delimiter" : @"Delimiter",
             @"disableValueTrimming" : @"DisableValueTrimming",
             @"header" : @"Header",
             @"lastUpdated" : @"LastUpdated",
             @"name" : @"Name",
             @"quoteSymbol" : @"QuoteSymbol",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)containsHeaderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSglueCsvHeaderOptionUnknown);
        }
        if ([value caseInsensitiveCompare:@"PRESENT"] == NSOrderedSame) {
            return @(AWSglueCsvHeaderOptionPresent);
        }
        if ([value caseInsensitiveCompare:@"ABSENT"] == NSOrderedSame) {
            return @(AWSglueCsvHeaderOptionAbsent);
        }
        return @(AWSglueCsvHeaderOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueCsvHeaderOptionUnknown:
                return @"UNKNOWN";
            case AWSglueCsvHeaderOptionPresent:
                return @"PRESENT";
            case AWSglueCsvHeaderOptionAbsent:
                return @"ABSENT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSglueDataCatalogEncryptionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionPasswordEncryption" : @"ConnectionPasswordEncryption",
             @"encryptionAtRest" : @"EncryptionAtRest",
             };
}

+ (NSValueTransformer *)connectionPasswordEncryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueConnectionPasswordEncryption class]];
}

+ (NSValueTransformer *)encryptionAtRestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueEncryptionAtRest class]];
}

@end

@implementation AWSglueDataLakePrincipal

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataLakePrincipalIdentifier" : @"DataLakePrincipalIdentifier",
             };
}

@end

@implementation AWSglueDatabase

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTableDefaultPermissions" : @"CreateTableDefaultPermissions",
             @"createTime" : @"CreateTime",
             @"detail" : @"Description",
             @"locationUri" : @"LocationUri",
             @"name" : @"Name",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)createTableDefaultPermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSgluePrincipalPermissions class]];
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSglueDatabaseInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTableDefaultPermissions" : @"CreateTableDefaultPermissions",
             @"detail" : @"Description",
             @"locationUri" : @"LocationUri",
             @"name" : @"Name",
             @"parameters" : @"Parameters",
             };
}

+ (NSValueTransformer *)createTableDefaultPermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSgluePrincipalPermissions class]];
}

@end

@implementation AWSglueDeleteClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueDeleteClassifierResponse

@end

@implementation AWSglueDeleteConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"connectionName" : @"ConnectionName",
             };
}

@end

@implementation AWSglueDeleteConnectionResponse

@end

@implementation AWSglueDeleteCrawlerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueDeleteCrawlerResponse

@end

@implementation AWSglueDeleteDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueDeleteDatabaseResponse

@end

@implementation AWSglueDeleteDevEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointName" : @"EndpointName",
             };
}

@end

@implementation AWSglueDeleteDevEndpointResponse

@end

@implementation AWSglueDeleteJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             };
}

@end

@implementation AWSglueDeleteJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             };
}

@end

@implementation AWSglueDeleteMLTransformRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSglueDeleteMLTransformResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSglueDeletePartitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"partitionValues" : @"PartitionValues",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSglueDeletePartitionResponse

@end

@implementation AWSglueDeleteResourcePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyHashCondition" : @"PolicyHashCondition",
             };
}

@end

@implementation AWSglueDeleteResourcePolicyResponse

@end

@implementation AWSglueDeleteSecurityConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueDeleteSecurityConfigurationResponse

@end

@implementation AWSglueDeleteTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueDeleteTableResponse

@end

@implementation AWSglueDeleteTableVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"tableName" : @"TableName",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSglueDeleteTableVersionResponse

@end

@implementation AWSglueDeleteTriggerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueDeleteTriggerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueDeleteUserDefinedFunctionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSglueDeleteUserDefinedFunctionResponse

@end

@implementation AWSglueDeleteWorkflowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueDeleteWorkflowResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueDevEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arguments" : @"Arguments",
             @"availabilityZone" : @"AvailabilityZone",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"endpointName" : @"EndpointName",
             @"extraJarsS3Path" : @"ExtraJarsS3Path",
             @"extraPythonLibsS3Path" : @"ExtraPythonLibsS3Path",
             @"failureReason" : @"FailureReason",
             @"glueVersion" : @"GlueVersion",
             @"lastModifiedTimestamp" : @"LastModifiedTimestamp",
             @"lastUpdateStatus" : @"LastUpdateStatus",
             @"numberOfNodes" : @"NumberOfNodes",
             @"numberOfWorkers" : @"NumberOfWorkers",
             @"privateAddress" : @"PrivateAddress",
             @"publicAddress" : @"PublicAddress",
             @"publicKey" : @"PublicKey",
             @"publicKeys" : @"PublicKeys",
             @"roleArn" : @"RoleArn",
             @"securityConfiguration" : @"SecurityConfiguration",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"status" : @"Status",
             @"subnetId" : @"SubnetId",
             @"vpcId" : @"VpcId",
             @"workerType" : @"WorkerType",
             @"yarnEndpointAddress" : @"YarnEndpointAddress",
             @"zeppelinRemoteSparkInterpreterPort" : @"ZeppelinRemoteSparkInterpreterPort",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG2x);
        }
        return @(AWSglueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueWorkerTypeStandard:
                return @"Standard";
            case AWSglueWorkerTypeG1x:
                return @"G.1X";
            case AWSglueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueDevEndpointCustomLibraries

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"extraJarsS3Path" : @"ExtraJarsS3Path",
             @"extraPythonLibsS3Path" : @"ExtraPythonLibsS3Path",
             };
}

@end

@implementation AWSglueDynamoDBTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"path" : @"Path",
             };
}

@end

@implementation AWSglueEdge

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"sourceId" : @"SourceId",
             };
}

@end

@implementation AWSglueEncryptionAtRest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogEncryptionMode" : @"CatalogEncryptionMode",
             @"sseAwsKmsKeyId" : @"SseAwsKmsKeyId",
             };
}

+ (NSValueTransformer *)catalogEncryptionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSglueCatalogEncryptionModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"SSE-KMS"] == NSOrderedSame) {
            return @(AWSglueCatalogEncryptionModeSseKms);
        }
        return @(AWSglueCatalogEncryptionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueCatalogEncryptionModeDisabled:
                return @"DISABLED";
            case AWSglueCatalogEncryptionModeSseKms:
                return @"SSE-KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueEncryptionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchEncryption" : @"CloudWatchEncryption",
             @"jobBookmarksEncryption" : @"JobBookmarksEncryption",
             @"s3Encryption" : @"S3Encryption",
             };
}

+ (NSValueTransformer *)cloudWatchEncryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCloudWatchEncryption class]];
}

+ (NSValueTransformer *)jobBookmarksEncryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueJobBookmarksEncryption class]];
}

+ (NSValueTransformer *)s3EncryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueS3Encryption class]];
}

@end

@implementation AWSglueErrorDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             };
}

@end

@implementation AWSglueEvaluationMetrics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findMatchesMetrics" : @"FindMatchesMetrics",
             @"transformType" : @"TransformType",
             };
}

+ (NSValueTransformer *)findMatchesMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueFindMatchesMetrics class]];
}

+ (NSValueTransformer *)transformTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIND_MATCHES"] == NSOrderedSame) {
            return @(AWSglueTransformTypeFindMatches);
        }
        return @(AWSglueTransformTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTransformTypeFindMatches:
                return @"FIND_MATCHES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueExecutionProperty

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxConcurrentRuns" : @"MaxConcurrentRuns",
             };
}

@end

@implementation AWSglueExportLabelsTaskRunProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputS3Path" : @"OutputS3Path",
             };
}

@end

@implementation AWSglueFindMatchesMetrics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"areaUnderPRCurve" : @"AreaUnderPRCurve",
             @"confusionMatrix" : @"ConfusionMatrix",
             @"f1" : @"F1",
             @"precision" : @"Precision",
             @"recall" : @"Recall",
             };
}

+ (NSValueTransformer *)confusionMatrixJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueConfusionMatrix class]];
}

@end

@implementation AWSglueFindMatchesParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accuracyCostTradeoff" : @"AccuracyCostTradeoff",
             @"enforceProvidedLabels" : @"EnforceProvidedLabels",
             @"precisionRecallTradeoff" : @"PrecisionRecallTradeoff",
             @"primaryKeyColumnName" : @"PrimaryKeyColumnName",
             };
}

@end

@implementation AWSglueFindMatchesTaskRunProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobRunId" : @"JobRunId",
             };
}

@end

@implementation AWSglueGetCatalogImportStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             };
}

@end

@implementation AWSglueGetCatalogImportStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importStatus" : @"ImportStatus",
             };
}

+ (NSValueTransformer *)importStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCatalogImportStatus class]];
}

@end

@implementation AWSglueGetClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueGetClassifierResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classifier" : @"Classifier",
             };
}

+ (NSValueTransformer *)classifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueClassifier class]];
}

@end

@implementation AWSglueGetClassifiersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueGetClassifiersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classifiers" : @"Classifiers",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)classifiersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueClassifier class]];
}

@end

@implementation AWSglueGetConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"hidePassword" : @"HidePassword",
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueGetConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connection" : @"Connection",
             };
}

+ (NSValueTransformer *)connectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueConnection class]];
}

@end

@implementation AWSglueGetConnectionsFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionType" : @"ConnectionType",
             @"matchCriteria" : @"MatchCriteria",
             };
}

+ (NSValueTransformer *)connectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JDBC"] == NSOrderedSame) {
            return @(AWSglueConnectionTypeJdbc);
        }
        if ([value caseInsensitiveCompare:@"SFTP"] == NSOrderedSame) {
            return @(AWSglueConnectionTypeSftp);
        }
        if ([value caseInsensitiveCompare:@"MONGODB"] == NSOrderedSame) {
            return @(AWSglueConnectionTypeMongodb);
        }
        if ([value caseInsensitiveCompare:@"KAFKA"] == NSOrderedSame) {
            return @(AWSglueConnectionTypeKafka);
        }
        return @(AWSglueConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueConnectionTypeJdbc:
                return @"JDBC";
            case AWSglueConnectionTypeSftp:
                return @"SFTP";
            case AWSglueConnectionTypeMongodb:
                return @"MONGODB";
            case AWSglueConnectionTypeKafka:
                return @"KAFKA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueGetConnectionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"filter" : @"Filter",
             @"hidePassword" : @"HidePassword",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueGetConnectionsFilter class]];
}

@end

@implementation AWSglueGetConnectionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionList" : @"ConnectionList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)connectionListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueConnection class]];
}

@end

@implementation AWSglueGetCrawlerMetricsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerNameList" : @"CrawlerNameList",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueGetCrawlerMetricsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerMetricsList" : @"CrawlerMetricsList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)crawlerMetricsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCrawlerMetrics class]];
}

@end

@implementation AWSglueGetCrawlerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueGetCrawlerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawler" : @"Crawler",
             };
}

+ (NSValueTransformer *)crawlerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCrawler class]];
}

@end

@implementation AWSglueGetCrawlersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueGetCrawlersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlers" : @"Crawlers",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)crawlersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCrawler class]];
}

@end

@implementation AWSglueGetDataCatalogEncryptionSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             };
}

@end

@implementation AWSglueGetDataCatalogEncryptionSettingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataCatalogEncryptionSettings" : @"DataCatalogEncryptionSettings",
             };
}

+ (NSValueTransformer *)dataCatalogEncryptionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueDataCatalogEncryptionSettings class]];
}

@end

@implementation AWSglueGetDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueGetDatabaseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"database" : @"Database",
             };
}

+ (NSValueTransformer *)databaseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueDatabase class]];
}

@end

@implementation AWSglueGetDatabasesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueGetDatabasesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseList" : @"DatabaseList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)databaseListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueDatabase class]];
}

@end

@implementation AWSglueGetDataflowGraphRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pythonScript" : @"PythonScript",
             };
}

@end

@implementation AWSglueGetDataflowGraphResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dagEdges" : @"DagEdges",
             @"dagNodes" : @"DagNodes",
             };
}

+ (NSValueTransformer *)dagEdgesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCodeGenEdge class]];
}

+ (NSValueTransformer *)dagNodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCodeGenNode class]];
}

@end

@implementation AWSglueGetDevEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointName" : @"EndpointName",
             };
}

@end

@implementation AWSglueGetDevEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devEndpoint" : @"DevEndpoint",
             };
}

+ (NSValueTransformer *)devEndpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueDevEndpoint class]];
}

@end

@implementation AWSglueGetDevEndpointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueGetDevEndpointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devEndpoints" : @"DevEndpoints",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)devEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueDevEndpoint class]];
}

@end

@implementation AWSglueGetJobBookmarkRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSglueGetJobBookmarkResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobBookmarkEntry" : @"JobBookmarkEntry",
             };
}

+ (NSValueTransformer *)jobBookmarkEntryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueJobBookmarkEntry class]];
}

@end

@implementation AWSglueGetJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             };
}

@end

@implementation AWSglueGetJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"job" : @"Job",
             };
}

+ (NSValueTransformer *)jobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueJob class]];
}

@end

@implementation AWSglueGetJobRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"predecessorsIncluded" : @"PredecessorsIncluded",
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSglueGetJobRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobRun" : @"JobRun",
             };
}

+ (NSValueTransformer *)jobRunJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueJobRun class]];
}

@end

@implementation AWSglueGetJobRunsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueGetJobRunsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobRuns" : @"JobRuns",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobRunsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueJobRun class]];
}

@end

@implementation AWSglueGetJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueGetJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobs" : @"Jobs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueJob class]];
}

@end

@implementation AWSglueGetMLTaskRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskRunId" : @"TaskRunId",
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSglueGetMLTaskRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completedOn" : @"CompletedOn",
             @"errorString" : @"ErrorString",
             @"executionTime" : @"ExecutionTime",
             @"lastModifiedOn" : @"LastModifiedOn",
             @"logGroupName" : @"LogGroupName",
             @"properties" : @"Properties",
             @"startedOn" : @"StartedOn",
             @"status" : @"Status",
             @"taskRunId" : @"TaskRunId",
             @"transformId" : @"TransformId",
             };
}

+ (NSValueTransformer *)completedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)propertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTaskRunProperties class]];
}

+ (NSValueTransformer *)startedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeStopped);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeTimeout);
        }
        return @(AWSglueTaskStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTaskStatusTypeStarting:
                return @"STARTING";
            case AWSglueTaskStatusTypeRunning:
                return @"RUNNING";
            case AWSglueTaskStatusTypeStopping:
                return @"STOPPING";
            case AWSglueTaskStatusTypeStopped:
                return @"STOPPED";
            case AWSglueTaskStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSglueTaskStatusTypeFailed:
                return @"FAILED";
            case AWSglueTaskStatusTypeTimeout:
                return @"TIMEOUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueGetMLTaskRunsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sort" : @"Sort",
             @"transformId" : @"TransformId",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTaskRunFilterCriteria class]];
}

+ (NSValueTransformer *)sortJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTaskRunSortCriteria class]];
}

@end

@implementation AWSglueGetMLTaskRunsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"taskRuns" : @"TaskRuns",
             };
}

+ (NSValueTransformer *)taskRunsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueTaskRun class]];
}

@end

@implementation AWSglueGetMLTransformRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSglueGetMLTransformResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdOn" : @"CreatedOn",
             @"detail" : @"Description",
             @"evaluationMetrics" : @"EvaluationMetrics",
             @"glueVersion" : @"GlueVersion",
             @"inputRecordTables" : @"InputRecordTables",
             @"labelCount" : @"LabelCount",
             @"lastModifiedOn" : @"LastModifiedOn",
             @"maxCapacity" : @"MaxCapacity",
             @"maxRetries" : @"MaxRetries",
             @"name" : @"Name",
             @"numberOfWorkers" : @"NumberOfWorkers",
             @"parameters" : @"Parameters",
             @"role" : @"Role",
             @"schema" : @"Schema",
             @"status" : @"Status",
             @"timeout" : @"Timeout",
             @"transformId" : @"TransformId",
             @"workerType" : @"WorkerType",
             };
}

+ (NSValueTransformer *)createdOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)evaluationMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueEvaluationMetrics class]];
}

+ (NSValueTransformer *)inputRecordTablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueGlueTable class]];
}

+ (NSValueTransformer *)lastModifiedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTransformParameters class]];
}

+ (NSValueTransformer *)schemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueSchemaColumn class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_READY"] == NSOrderedSame) {
            return @(AWSglueTransformStatusTypeNotReady);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSglueTransformStatusTypeReady);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSglueTransformStatusTypeDeleting);
        }
        return @(AWSglueTransformStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTransformStatusTypeNotReady:
                return @"NOT_READY";
            case AWSglueTransformStatusTypeReady:
                return @"READY";
            case AWSglueTransformStatusTypeDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG2x);
        }
        return @(AWSglueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueWorkerTypeStandard:
                return @"Standard";
            case AWSglueWorkerTypeG1x:
                return @"G.1X";
            case AWSglueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueGetMLTransformsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sort" : @"Sort",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTransformFilterCriteria class]];
}

+ (NSValueTransformer *)sortJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTransformSortCriteria class]];
}

@end

@implementation AWSglueGetMLTransformsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"transforms" : @"Transforms",
             };
}

+ (NSValueTransformer *)transformsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueMLTransform class]];
}

@end

@implementation AWSglueGetMappingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"sinks" : @"Sinks",
             @"source" : @"Source",
             };
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueLocation class]];
}

+ (NSValueTransformer *)sinksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCatalogEntry class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCatalogEntry class]];
}

@end

@implementation AWSglueGetMappingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mapping" : @"Mapping",
             };
}

+ (NSValueTransformer *)mappingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueMappingEntry class]];
}

@end

@implementation AWSglueGetPartitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"partitionValues" : @"PartitionValues",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSglueGetPartitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"partition" : @"Partition",
             };
}

+ (NSValueTransformer *)partitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSgluePartition class]];
}

@end

@implementation AWSglueGetPartitionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"expression" : @"Expression",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"segment" : @"Segment",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)segmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueSegment class]];
}

@end

@implementation AWSglueGetPartitionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"partitions" : @"Partitions",
             };
}

+ (NSValueTransformer *)partitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSgluePartition class]];
}

@end

@implementation AWSglueGetPlanRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"language" : @"Language",
             @"location" : @"Location",
             @"mapping" : @"Mapping",
             @"sinks" : @"Sinks",
             @"source" : @"Source",
             };
}

+ (NSValueTransformer *)languageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PYTHON"] == NSOrderedSame) {
            return @(AWSglueLanguagePython);
        }
        if ([value caseInsensitiveCompare:@"SCALA"] == NSOrderedSame) {
            return @(AWSglueLanguageScala);
        }
        return @(AWSglueLanguageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueLanguagePython:
                return @"PYTHON";
            case AWSglueLanguageScala:
                return @"SCALA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueLocation class]];
}

+ (NSValueTransformer *)mappingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueMappingEntry class]];
}

+ (NSValueTransformer *)sinksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCatalogEntry class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCatalogEntry class]];
}

@end

@implementation AWSglueGetPlanResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pythonScript" : @"PythonScript",
             @"scalaCode" : @"ScalaCode",
             };
}

@end

@implementation AWSglueGetResourcePolicyRequest

@end

@implementation AWSglueGetResourcePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"policyHash" : @"PolicyHash",
             @"policyInJson" : @"PolicyInJson",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSglueGetSecurityConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueGetSecurityConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityConfiguration" : @"SecurityConfiguration",
             };
}

+ (NSValueTransformer *)securityConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueSecurityConfiguration class]];
}

@end

@implementation AWSglueGetSecurityConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueGetSecurityConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"securityConfigurations" : @"SecurityConfigurations",
             };
}

+ (NSValueTransformer *)securityConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueSecurityConfiguration class]];
}

@end

@implementation AWSglueGetTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueGetTableResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"table" : @"Table",
             };
}

+ (NSValueTransformer *)tableJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTable class]];
}

@end

@implementation AWSglueGetTableVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"tableName" : @"TableName",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSglueGetTableVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableVersion" : @"TableVersion",
             };
}

+ (NSValueTransformer *)tableVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTableVersion class]];
}

@end

@implementation AWSglueGetTableVersionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSglueGetTableVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tableVersions" : @"TableVersions",
             };
}

+ (NSValueTransformer *)tableVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueTableVersion class]];
}

@end

@implementation AWSglueGetTablesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"expression" : @"Expression",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueGetTablesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tableList" : @"TableList",
             };
}

+ (NSValueTransformer *)tableListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueTable class]];
}

@end

@implementation AWSglueGetTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSglueGetTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSglueGetTriggerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueGetTriggerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trigger" : @"Trigger",
             };
}

+ (NSValueTransformer *)triggerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTrigger class]];
}

@end

@implementation AWSglueGetTriggersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dependentJobName" : @"DependentJobName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueGetTriggersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"triggers" : @"Triggers",
             };
}

+ (NSValueTransformer *)triggersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueTrigger class]];
}

@end

@implementation AWSglueGetUserDefinedFunctionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSglueGetUserDefinedFunctionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userDefinedFunction" : @"UserDefinedFunction",
             };
}

+ (NSValueTransformer *)userDefinedFunctionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueUserDefinedFunction class]];
}

@end

@implementation AWSglueGetUserDefinedFunctionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"pattern" : @"Pattern",
             };
}

@end

@implementation AWSglueGetUserDefinedFunctionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"userDefinedFunctions" : @"UserDefinedFunctions",
             };
}

+ (NSValueTransformer *)userDefinedFunctionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueUserDefinedFunction class]];
}

@end

@implementation AWSglueGetWorkflowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeGraph" : @"IncludeGraph",
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueGetWorkflowResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workflow" : @"Workflow",
             };
}

+ (NSValueTransformer *)workflowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueWorkflow class]];
}

@end

@implementation AWSglueGetWorkflowRunPropertiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSglueGetWorkflowRunPropertiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"runProperties" : @"RunProperties",
             };
}

@end

@implementation AWSglueGetWorkflowRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeGraph" : @"IncludeGraph",
             @"name" : @"Name",
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSglueGetWorkflowRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"run" : @"Run",
             };
}

+ (NSValueTransformer *)runJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueWorkflowRun class]];
}

@end

@implementation AWSglueGetWorkflowRunsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeGraph" : @"IncludeGraph",
             @"maxResults" : @"MaxResults",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueGetWorkflowRunsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"runs" : @"Runs",
             };
}

+ (NSValueTransformer *)runsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueWorkflowRun class]];
}

@end

@implementation AWSglueGlueTable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"connectionName" : @"ConnectionName",
             @"databaseName" : @"DatabaseName",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSglueGrokClassifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"creationTime" : @"CreationTime",
             @"customPatterns" : @"CustomPatterns",
             @"grokPattern" : @"GrokPattern",
             @"lastUpdated" : @"LastUpdated",
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSglueImportCatalogToGlueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             };
}

@end

@implementation AWSglueImportCatalogToGlueResponse

@end

@implementation AWSglueImportLabelsTaskRunProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputS3Path" : @"InputS3Path",
             @"replace" : @"Replace",
             };
}

@end

@implementation AWSglueJdbcTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionName" : @"ConnectionName",
             @"exclusions" : @"Exclusions",
             @"path" : @"Path",
             };
}

@end

@implementation AWSglueJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedCapacity" : @"AllocatedCapacity",
             @"command" : @"Command",
             @"connections" : @"Connections",
             @"createdOn" : @"CreatedOn",
             @"defaultArguments" : @"DefaultArguments",
             @"detail" : @"Description",
             @"executionProperty" : @"ExecutionProperty",
             @"glueVersion" : @"GlueVersion",
             @"lastModifiedOn" : @"LastModifiedOn",
             @"logUri" : @"LogUri",
             @"maxCapacity" : @"MaxCapacity",
             @"maxRetries" : @"MaxRetries",
             @"name" : @"Name",
             @"nonOverridableArguments" : @"NonOverridableArguments",
             @"notificationProperty" : @"NotificationProperty",
             @"numberOfWorkers" : @"NumberOfWorkers",
             @"role" : @"Role",
             @"securityConfiguration" : @"SecurityConfiguration",
             @"timeout" : @"Timeout",
             @"workerType" : @"WorkerType",
             };
}

+ (NSValueTransformer *)commandJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueJobCommand class]];
}

+ (NSValueTransformer *)connectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueConnectionsList class]];
}

+ (NSValueTransformer *)createdOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)executionPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueExecutionProperty class]];
}

+ (NSValueTransformer *)lastModifiedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notificationPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueNotificationProperty class]];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG2x);
        }
        return @(AWSglueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueWorkerTypeStandard:
                return @"Standard";
            case AWSglueWorkerTypeG1x:
                return @"G.1X";
            case AWSglueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueJobBookmarkEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attempt" : @"Attempt",
             @"jobBookmark" : @"JobBookmark",
             @"jobName" : @"JobName",
             @"previousRunId" : @"PreviousRunId",
             @"run" : @"Run",
             @"runId" : @"RunId",
             @"version" : @"Version",
             };
}

@end

@implementation AWSglueJobBookmarksEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobBookmarksEncryptionMode" : @"JobBookmarksEncryptionMode",
             @"kmsKeyArn" : @"KmsKeyArn",
             };
}

+ (NSValueTransformer *)jobBookmarksEncryptionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSglueJobBookmarksEncryptionModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"CSE-KMS"] == NSOrderedSame) {
            return @(AWSglueJobBookmarksEncryptionModeCseKms);
        }
        return @(AWSglueJobBookmarksEncryptionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueJobBookmarksEncryptionModeDisabled:
                return @"DISABLED";
            case AWSglueJobBookmarksEncryptionModeCseKms:
                return @"CSE-KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueJobCommand

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"pythonVersion" : @"PythonVersion",
             @"scriptLocation" : @"ScriptLocation",
             };
}

@end

@implementation AWSglueJobNodeDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobRuns" : @"JobRuns",
             };
}

+ (NSValueTransformer *)jobRunsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueJobRun class]];
}

@end

@implementation AWSglueJobRun

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedCapacity" : @"AllocatedCapacity",
             @"arguments" : @"Arguments",
             @"attempt" : @"Attempt",
             @"completedOn" : @"CompletedOn",
             @"errorMessage" : @"ErrorMessage",
             @"executionTime" : @"ExecutionTime",
             @"glueVersion" : @"GlueVersion",
             @"identifier" : @"Id",
             @"jobName" : @"JobName",
             @"jobRunState" : @"JobRunState",
             @"lastModifiedOn" : @"LastModifiedOn",
             @"logGroupName" : @"LogGroupName",
             @"maxCapacity" : @"MaxCapacity",
             @"notificationProperty" : @"NotificationProperty",
             @"numberOfWorkers" : @"NumberOfWorkers",
             @"predecessorRuns" : @"PredecessorRuns",
             @"previousRunId" : @"PreviousRunId",
             @"securityConfiguration" : @"SecurityConfiguration",
             @"startedOn" : @"StartedOn",
             @"timeout" : @"Timeout",
             @"triggerName" : @"TriggerName",
             @"workerType" : @"WorkerType",
             };
}

+ (NSValueTransformer *)completedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)jobRunStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSglueJobRunStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSglueJobRunStateRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSglueJobRunStateStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSglueJobRunStateStopped);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSglueJobRunStateSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSglueJobRunStateFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSglueJobRunStateTimeout);
        }
        return @(AWSglueJobRunStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueJobRunStateStarting:
                return @"STARTING";
            case AWSglueJobRunStateRunning:
                return @"RUNNING";
            case AWSglueJobRunStateStopping:
                return @"STOPPING";
            case AWSglueJobRunStateStopped:
                return @"STOPPED";
            case AWSglueJobRunStateSucceeded:
                return @"SUCCEEDED";
            case AWSglueJobRunStateFailed:
                return @"FAILED";
            case AWSglueJobRunStateTimeout:
                return @"TIMEOUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notificationPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueNotificationProperty class]];
}

+ (NSValueTransformer *)predecessorRunsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSgluePredecessor class]];
}

+ (NSValueTransformer *)startedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG2x);
        }
        return @(AWSglueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueWorkerTypeStandard:
                return @"Standard";
            case AWSglueWorkerTypeG1x:
                return @"G.1X";
            case AWSglueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueJobUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedCapacity" : @"AllocatedCapacity",
             @"command" : @"Command",
             @"connections" : @"Connections",
             @"defaultArguments" : @"DefaultArguments",
             @"detail" : @"Description",
             @"executionProperty" : @"ExecutionProperty",
             @"glueVersion" : @"GlueVersion",
             @"logUri" : @"LogUri",
             @"maxCapacity" : @"MaxCapacity",
             @"maxRetries" : @"MaxRetries",
             @"nonOverridableArguments" : @"NonOverridableArguments",
             @"notificationProperty" : @"NotificationProperty",
             @"numberOfWorkers" : @"NumberOfWorkers",
             @"role" : @"Role",
             @"securityConfiguration" : @"SecurityConfiguration",
             @"timeout" : @"Timeout",
             @"workerType" : @"WorkerType",
             };
}

+ (NSValueTransformer *)commandJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueJobCommand class]];
}

+ (NSValueTransformer *)connectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueConnectionsList class]];
}

+ (NSValueTransformer *)executionPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueExecutionProperty class]];
}

+ (NSValueTransformer *)notificationPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueNotificationProperty class]];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG2x);
        }
        return @(AWSglueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueWorkerTypeStandard:
                return @"Standard";
            case AWSglueWorkerTypeG1x:
                return @"G.1X";
            case AWSglueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueJsonClassifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"jsonPath" : @"JsonPath",
             @"lastUpdated" : @"LastUpdated",
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSglueLabelingSetGenerationTaskRunProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputS3Path" : @"OutputS3Path",
             };
}

@end

@implementation AWSglueLastCrawlInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorMessage" : @"ErrorMessage",
             @"logGroup" : @"LogGroup",
             @"logStream" : @"LogStream",
             @"messagePrefix" : @"MessagePrefix",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSglueLastCrawlStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSglueLastCrawlStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSglueLastCrawlStatusFailed);
        }
        return @(AWSglueLastCrawlStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueLastCrawlStatusSucceeded:
                return @"SUCCEEDED";
            case AWSglueLastCrawlStatusCancelled:
                return @"CANCELLED";
            case AWSglueLastCrawlStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueListCrawlersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSglueListCrawlersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerNames" : @"CrawlerNames",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueListDevEndpointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSglueListDevEndpointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devEndpointNames" : @"DevEndpointNames",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueListJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSglueListJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobNames" : @"JobNames",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueListMLTransformsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sort" : @"Sort",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTransformFilterCriteria class]];
}

+ (NSValueTransformer *)sortJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTransformSortCriteria class]];
}

@end

@implementation AWSglueListMLTransformsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"transformIds" : @"TransformIds",
             };
}

@end

@implementation AWSglueListTriggersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dependentJobName" : @"DependentJobName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSglueListTriggersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"triggerNames" : @"TriggerNames",
             };
}

@end

@implementation AWSglueListWorkflowsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSglueListWorkflowsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"workflows" : @"Workflows",
             };
}

@end

@implementation AWSglueLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dynamoDB" : @"DynamoDB",
             @"jdbc" : @"Jdbc",
             @"s3" : @"S3",
             };
}

+ (NSValueTransformer *)dynamoDBJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCodeGenNodeArg class]];
}

+ (NSValueTransformer *)jdbcJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCodeGenNodeArg class]];
}

+ (NSValueTransformer *)s3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCodeGenNodeArg class]];
}

@end

@implementation AWSglueMLTransform

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdOn" : @"CreatedOn",
             @"detail" : @"Description",
             @"evaluationMetrics" : @"EvaluationMetrics",
             @"glueVersion" : @"GlueVersion",
             @"inputRecordTables" : @"InputRecordTables",
             @"labelCount" : @"LabelCount",
             @"lastModifiedOn" : @"LastModifiedOn",
             @"maxCapacity" : @"MaxCapacity",
             @"maxRetries" : @"MaxRetries",
             @"name" : @"Name",
             @"numberOfWorkers" : @"NumberOfWorkers",
             @"parameters" : @"Parameters",
             @"role" : @"Role",
             @"schema" : @"Schema",
             @"status" : @"Status",
             @"timeout" : @"Timeout",
             @"transformId" : @"TransformId",
             @"workerType" : @"WorkerType",
             };
}

+ (NSValueTransformer *)createdOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)evaluationMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueEvaluationMetrics class]];
}

+ (NSValueTransformer *)inputRecordTablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueGlueTable class]];
}

+ (NSValueTransformer *)lastModifiedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTransformParameters class]];
}

+ (NSValueTransformer *)schemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueSchemaColumn class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_READY"] == NSOrderedSame) {
            return @(AWSglueTransformStatusTypeNotReady);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSglueTransformStatusTypeReady);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSglueTransformStatusTypeDeleting);
        }
        return @(AWSglueTransformStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTransformStatusTypeNotReady:
                return @"NOT_READY";
            case AWSglueTransformStatusTypeReady:
                return @"READY";
            case AWSglueTransformStatusTypeDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG2x);
        }
        return @(AWSglueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueWorkerTypeStandard:
                return @"Standard";
            case AWSglueWorkerTypeG1x:
                return @"G.1X";
            case AWSglueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueMappingEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourcePath" : @"SourcePath",
             @"sourceTable" : @"SourceTable",
             @"sourceType" : @"SourceType",
             @"targetPath" : @"TargetPath",
             @"targetTable" : @"TargetTable",
             @"targetType" : @"TargetType",
             };
}

@end

@implementation AWSglueNode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerDetails" : @"CrawlerDetails",
             @"jobDetails" : @"JobDetails",
             @"name" : @"Name",
             @"triggerDetails" : @"TriggerDetails",
             @"types" : @"Type",
             @"uniqueId" : @"UniqueId",
             };
}

+ (NSValueTransformer *)crawlerDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCrawlerNodeDetails class]];
}

+ (NSValueTransformer *)jobDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueJobNodeDetails class]];
}

+ (NSValueTransformer *)triggerDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTriggerNodeDetails class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRAWLER"] == NSOrderedSame) {
            return @(AWSglueNodeTypeCrawler);
        }
        if ([value caseInsensitiveCompare:@"JOB"] == NSOrderedSame) {
            return @(AWSglueNodeTypeJob);
        }
        if ([value caseInsensitiveCompare:@"TRIGGER"] == NSOrderedSame) {
            return @(AWSglueNodeTypeTrigger);
        }
        return @(AWSglueNodeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueNodeTypeCrawler:
                return @"CRAWLER";
            case AWSglueNodeTypeJob:
                return @"JOB";
            case AWSglueNodeTypeTrigger:
                return @"TRIGGER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueNotificationProperty

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notifyDelayAfter" : @"NotifyDelayAfter",
             };
}

@end

@implementation AWSglueOrder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"column" : @"Column",
             @"sortOrder" : @"SortOrder",
             };
}

@end

@implementation AWSgluePartition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"databaseName" : @"DatabaseName",
             @"lastAccessTime" : @"LastAccessTime",
             @"lastAnalyzedTime" : @"LastAnalyzedTime",
             @"parameters" : @"Parameters",
             @"storageDescriptor" : @"StorageDescriptor",
             @"tableName" : @"TableName",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
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

+ (NSValueTransformer *)lastAnalyzedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)storageDescriptorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueStorageDescriptor class]];
}

@end

@implementation AWSgluePartitionError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorDetail" : @"ErrorDetail",
             @"partitionValues" : @"PartitionValues",
             };
}

+ (NSValueTransformer *)errorDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueErrorDetail class]];
}

@end

@implementation AWSgluePartitionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastAccessTime" : @"LastAccessTime",
             @"lastAnalyzedTime" : @"LastAnalyzedTime",
             @"parameters" : @"Parameters",
             @"storageDescriptor" : @"StorageDescriptor",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)lastAccessTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastAnalyzedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)storageDescriptorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueStorageDescriptor class]];
}

@end

@implementation AWSgluePartitionValueList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSgluePhysicalConnectionRequirements

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"securityGroupIdList" : @"SecurityGroupIdList",
             @"subnetId" : @"SubnetId",
             };
}

@end

@implementation AWSgluePredecessor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSgluePredicate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditions" : @"Conditions",
             @"logical" : @"Logical",
             };
}

+ (NSValueTransformer *)conditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueCondition class]];
}

+ (NSValueTransformer *)logicalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AND"] == NSOrderedSame) {
            return @(AWSglueLogicalAnd);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSglueLogicalAny);
        }
        return @(AWSglueLogicalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueLogicalAnd:
                return @"AND";
            case AWSglueLogicalAny:
                return @"ANY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSgluePrincipalPermissions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"permissions" : @"Permissions",
             @"principal" : @"Principal",
             };
}

+ (NSValueTransformer *)principalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueDataLakePrincipal class]];
}

@end

@implementation AWSgluePropertyPredicate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparator" : @"Comparator",
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)comparatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQUALS"] == NSOrderedSame) {
            return @(AWSglueComparatorEquals);
        }
        if ([value caseInsensitiveCompare:@"GREATER_THAN"] == NSOrderedSame) {
            return @(AWSglueComparatorGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN"] == NSOrderedSame) {
            return @(AWSglueComparatorLessThan);
        }
        if ([value caseInsensitiveCompare:@"GREATER_THAN_EQUALS"] == NSOrderedSame) {
            return @(AWSglueComparatorGreaterThanEquals);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN_EQUALS"] == NSOrderedSame) {
            return @(AWSglueComparatorLessThanEquals);
        }
        return @(AWSglueComparatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueComparatorEquals:
                return @"EQUALS";
            case AWSglueComparatorGreaterThan:
                return @"GREATER_THAN";
            case AWSglueComparatorLessThan:
                return @"LESS_THAN";
            case AWSglueComparatorGreaterThanEquals:
                return @"GREATER_THAN_EQUALS";
            case AWSglueComparatorLessThanEquals:
                return @"LESS_THAN_EQUALS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSgluePutDataCatalogEncryptionSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"dataCatalogEncryptionSettings" : @"DataCatalogEncryptionSettings",
             };
}

+ (NSValueTransformer *)dataCatalogEncryptionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueDataCatalogEncryptionSettings class]];
}

@end

@implementation AWSgluePutDataCatalogEncryptionSettingsResponse

@end

@implementation AWSgluePutResourcePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyExistsCondition" : @"PolicyExistsCondition",
             @"policyHashCondition" : @"PolicyHashCondition",
             @"policyInJson" : @"PolicyInJson",
             };
}

+ (NSValueTransformer *)policyExistsConditionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MUST_EXIST"] == NSOrderedSame) {
            return @(AWSglueExistConditionMustExist);
        }
        if ([value caseInsensitiveCompare:@"NOT_EXIST"] == NSOrderedSame) {
            return @(AWSglueExistConditionNotExist);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSglueExistConditionNone);
        }
        return @(AWSglueExistConditionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueExistConditionMustExist:
                return @"MUST_EXIST";
            case AWSglueExistConditionNotExist:
                return @"NOT_EXIST";
            case AWSglueExistConditionNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSgluePutResourcePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyHash" : @"PolicyHash",
             };
}

@end

@implementation AWSgluePutWorkflowRunPropertiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"runId" : @"RunId",
             @"runProperties" : @"RunProperties",
             };
}

@end

@implementation AWSgluePutWorkflowRunPropertiesResponse

@end

@implementation AWSglueResetJobBookmarkRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSglueResetJobBookmarkResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobBookmarkEntry" : @"JobBookmarkEntry",
             };
}

+ (NSValueTransformer *)jobBookmarkEntryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueJobBookmarkEntry class]];
}

@end

@implementation AWSglueResourceUri

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceType" : @"ResourceType",
             @"uri" : @"Uri",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JAR"] == NSOrderedSame) {
            return @(AWSglueResourceTypeJar);
        }
        if ([value caseInsensitiveCompare:@"FILE"] == NSOrderedSame) {
            return @(AWSglueResourceTypeFile);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVE"] == NSOrderedSame) {
            return @(AWSglueResourceTypeArchive);
        }
        return @(AWSglueResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueResourceTypeJar:
                return @"JAR";
            case AWSglueResourceTypeFile:
                return @"FILE";
            case AWSglueResourceTypeArchive:
                return @"ARCHIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueS3Encryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyArn" : @"KmsKeyArn",
             @"s3EncryptionMode" : @"S3EncryptionMode",
             };
}

+ (NSValueTransformer *)s3EncryptionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSglueS3EncryptionModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"SSE-KMS"] == NSOrderedSame) {
            return @(AWSglueS3EncryptionModeSseKms);
        }
        if ([value caseInsensitiveCompare:@"SSE-S3"] == NSOrderedSame) {
            return @(AWSglueS3EncryptionModeSseS3);
        }
        return @(AWSglueS3EncryptionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueS3EncryptionModeDisabled:
                return @"DISABLED";
            case AWSglueS3EncryptionModeSseKms:
                return @"SSE-KMS";
            case AWSglueS3EncryptionModeSseS3:
                return @"SSE-S3";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueS3Target

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusions" : @"Exclusions",
             @"path" : @"Path",
             };
}

@end

@implementation AWSglueSchedule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleExpression" : @"ScheduleExpression",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SCHEDULED"] == NSOrderedSame) {
            return @(AWSglueScheduleStateScheduled);
        }
        if ([value caseInsensitiveCompare:@"NOT_SCHEDULED"] == NSOrderedSame) {
            return @(AWSglueScheduleStateNotScheduled);
        }
        if ([value caseInsensitiveCompare:@"TRANSITIONING"] == NSOrderedSame) {
            return @(AWSglueScheduleStateTransitioning);
        }
        return @(AWSglueScheduleStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueScheduleStateScheduled:
                return @"SCHEDULED";
            case AWSglueScheduleStateNotScheduled:
                return @"NOT_SCHEDULED";
            case AWSglueScheduleStateTransitioning:
                return @"TRANSITIONING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueSchemaChangePolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteBehavior" : @"DeleteBehavior",
             @"updateBehavior" : @"UpdateBehavior",
             };
}

+ (NSValueTransformer *)deleteBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LOG"] == NSOrderedSame) {
            return @(AWSglueDeleteBehaviorLog);
        }
        if ([value caseInsensitiveCompare:@"DELETE_FROM_DATABASE"] == NSOrderedSame) {
            return @(AWSglueDeleteBehaviorDeleteFromDatabase);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATE_IN_DATABASE"] == NSOrderedSame) {
            return @(AWSglueDeleteBehaviorDeprecateInDatabase);
        }
        return @(AWSglueDeleteBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueDeleteBehaviorLog:
                return @"LOG";
            case AWSglueDeleteBehaviorDeleteFromDatabase:
                return @"DELETE_FROM_DATABASE";
            case AWSglueDeleteBehaviorDeprecateInDatabase:
                return @"DEPRECATE_IN_DATABASE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updateBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LOG"] == NSOrderedSame) {
            return @(AWSglueUpdateBehaviorLog);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_DATABASE"] == NSOrderedSame) {
            return @(AWSglueUpdateBehaviorUpdateInDatabase);
        }
        return @(AWSglueUpdateBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueUpdateBehaviorLog:
                return @"LOG";
            case AWSglueUpdateBehaviorUpdateInDatabase:
                return @"UPDATE_IN_DATABASE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueSchemaColumn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataType" : @"DataType",
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueSearchTablesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"searchText" : @"SearchText",
             @"sortCriteria" : @"SortCriteria",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSgluePropertyPredicate class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueSortCriterion class]];
}

@end

@implementation AWSglueSearchTablesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tableList" : @"TableList",
             };
}

+ (NSValueTransformer *)tableListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueTable class]];
}

@end

@implementation AWSglueSecurityConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTimeStamp" : @"CreatedTimeStamp",
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)createdTimeStampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueEncryptionConfiguration class]];
}

@end

@implementation AWSglueSegment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentNumber" : @"SegmentNumber",
             @"totalSegments" : @"TotalSegments",
             };
}

@end

@implementation AWSglueSerDeInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"parameters" : @"Parameters",
             @"serializationLibrary" : @"SerializationLibrary",
             };
}

@end

@implementation AWSglueSkewedInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"skewedColumnNames" : @"SkewedColumnNames",
             @"skewedColumnValueLocationMaps" : @"SkewedColumnValueLocationMaps",
             @"skewedColumnValues" : @"SkewedColumnValues",
             };
}

@end

@implementation AWSglueSortCriterion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldName" : @"FieldName",
             @"sort" : @"Sort",
             };
}

+ (NSValueTransformer *)sortJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASC"] == NSOrderedSame) {
            return @(AWSglueSortAsc);
        }
        if ([value caseInsensitiveCompare:@"DESC"] == NSOrderedSame) {
            return @(AWSglueSortDesc);
        }
        return @(AWSglueSortUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueSortAsc:
                return @"ASC";
            case AWSglueSortDesc:
                return @"DESC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueStartCrawlerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueStartCrawlerResponse

@end

@implementation AWSglueStartCrawlerScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerName" : @"CrawlerName",
             };
}

@end

@implementation AWSglueStartCrawlerScheduleResponse

@end

@implementation AWSglueStartExportLabelsTaskRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputS3Path" : @"OutputS3Path",
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSglueStartExportLabelsTaskRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskRunId" : @"TaskRunId",
             };
}

@end

@implementation AWSglueStartImportLabelsTaskRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputS3Path" : @"InputS3Path",
             @"replaceAllLabels" : @"ReplaceAllLabels",
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSglueStartImportLabelsTaskRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskRunId" : @"TaskRunId",
             };
}

@end

@implementation AWSglueStartJobRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocatedCapacity" : @"AllocatedCapacity",
             @"arguments" : @"Arguments",
             @"jobName" : @"JobName",
             @"jobRunId" : @"JobRunId",
             @"maxCapacity" : @"MaxCapacity",
             @"notificationProperty" : @"NotificationProperty",
             @"numberOfWorkers" : @"NumberOfWorkers",
             @"securityConfiguration" : @"SecurityConfiguration",
             @"timeout" : @"Timeout",
             @"workerType" : @"WorkerType",
             };
}

+ (NSValueTransformer *)notificationPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueNotificationProperty class]];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG2x);
        }
        return @(AWSglueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueWorkerTypeStandard:
                return @"Standard";
            case AWSglueWorkerTypeG1x:
                return @"G.1X";
            case AWSglueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueStartJobRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobRunId" : @"JobRunId",
             };
}

@end

@implementation AWSglueStartMLEvaluationTaskRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSglueStartMLEvaluationTaskRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskRunId" : @"TaskRunId",
             };
}

@end

@implementation AWSglueStartMLLabelingSetGenerationTaskRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputS3Path" : @"OutputS3Path",
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSglueStartMLLabelingSetGenerationTaskRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskRunId" : @"TaskRunId",
             };
}

@end

@implementation AWSglueStartTriggerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueStartTriggerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueStartWorkflowRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueStartWorkflowRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSglueStopCrawlerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueStopCrawlerResponse

@end

@implementation AWSglueStopCrawlerScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerName" : @"CrawlerName",
             };
}

@end

@implementation AWSglueStopCrawlerScheduleResponse

@end

@implementation AWSglueStopTriggerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueStopTriggerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueStorageDescriptor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketColumns" : @"BucketColumns",
             @"columns" : @"Columns",
             @"compressed" : @"Compressed",
             @"inputFormat" : @"InputFormat",
             @"location" : @"Location",
             @"numberOfBuckets" : @"NumberOfBuckets",
             @"outputFormat" : @"OutputFormat",
             @"parameters" : @"Parameters",
             @"serdeInfo" : @"SerdeInfo",
             @"skewedInfo" : @"SkewedInfo",
             @"sortColumns" : @"SortColumns",
             @"storedAsSubDirectories" : @"StoredAsSubDirectories",
             };
}

+ (NSValueTransformer *)columnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueColumn class]];
}

+ (NSValueTransformer *)serdeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueSerDeInfo class]];
}

+ (NSValueTransformer *)skewedInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueSkewedInfo class]];
}

+ (NSValueTransformer *)sortColumnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueOrder class]];
}

@end

@implementation AWSglueTable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"createdBy" : @"CreatedBy",
             @"databaseName" : @"DatabaseName",
             @"detail" : @"Description",
             @"isRegisteredWithLakeFormation" : @"IsRegisteredWithLakeFormation",
             @"lastAccessTime" : @"LastAccessTime",
             @"lastAnalyzedTime" : @"LastAnalyzedTime",
             @"name" : @"Name",
             @"owner" : @"Owner",
             @"parameters" : @"Parameters",
             @"partitionKeys" : @"PartitionKeys",
             @"retention" : @"Retention",
             @"storageDescriptor" : @"StorageDescriptor",
             @"tableType" : @"TableType",
             @"updateTime" : @"UpdateTime",
             @"viewExpandedText" : @"ViewExpandedText",
             @"viewOriginalText" : @"ViewOriginalText",
             };
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

+ (NSValueTransformer *)lastAnalyzedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)partitionKeysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueColumn class]];
}

+ (NSValueTransformer *)storageDescriptorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueStorageDescriptor class]];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSglueTableError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorDetail" : @"ErrorDetail",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)errorDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueErrorDetail class]];
}

@end

@implementation AWSglueTableInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"lastAccessTime" : @"LastAccessTime",
             @"lastAnalyzedTime" : @"LastAnalyzedTime",
             @"name" : @"Name",
             @"owner" : @"Owner",
             @"parameters" : @"Parameters",
             @"partitionKeys" : @"PartitionKeys",
             @"retention" : @"Retention",
             @"storageDescriptor" : @"StorageDescriptor",
             @"tableType" : @"TableType",
             @"viewExpandedText" : @"ViewExpandedText",
             @"viewOriginalText" : @"ViewOriginalText",
             };
}

+ (NSValueTransformer *)lastAccessTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastAnalyzedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)partitionKeysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueColumn class]];
}

+ (NSValueTransformer *)storageDescriptorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueStorageDescriptor class]];
}

@end

@implementation AWSglueTableVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"table" : @"Table",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)tableJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTable class]];
}

@end

@implementation AWSglueTableVersionError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorDetail" : @"ErrorDetail",
             @"tableName" : @"TableName",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)errorDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueErrorDetail class]];
}

@end

@implementation AWSglueTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagsToAdd" : @"TagsToAdd",
             };
}

@end

@implementation AWSglueTagResourceResponse

@end

@implementation AWSglueTaskRun

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completedOn" : @"CompletedOn",
             @"errorString" : @"ErrorString",
             @"executionTime" : @"ExecutionTime",
             @"lastModifiedOn" : @"LastModifiedOn",
             @"logGroupName" : @"LogGroupName",
             @"properties" : @"Properties",
             @"startedOn" : @"StartedOn",
             @"status" : @"Status",
             @"taskRunId" : @"TaskRunId",
             @"transformId" : @"TransformId",
             };
}

+ (NSValueTransformer *)completedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)propertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTaskRunProperties class]];
}

+ (NSValueTransformer *)startedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeStopped);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeTimeout);
        }
        return @(AWSglueTaskStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTaskStatusTypeStarting:
                return @"STARTING";
            case AWSglueTaskStatusTypeRunning:
                return @"RUNNING";
            case AWSglueTaskStatusTypeStopping:
                return @"STOPPING";
            case AWSglueTaskStatusTypeStopped:
                return @"STOPPED";
            case AWSglueTaskStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSglueTaskStatusTypeFailed:
                return @"FAILED";
            case AWSglueTaskStatusTypeTimeout:
                return @"TIMEOUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueTaskRunFilterCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"startedAfter" : @"StartedAfter",
             @"startedBefore" : @"StartedBefore",
             @"status" : @"Status",
             @"taskRunType" : @"TaskRunType",
             };
}

+ (NSValueTransformer *)startedAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startedBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeStopped);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSglueTaskStatusTypeTimeout);
        }
        return @(AWSglueTaskStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTaskStatusTypeStarting:
                return @"STARTING";
            case AWSglueTaskStatusTypeRunning:
                return @"RUNNING";
            case AWSglueTaskStatusTypeStopping:
                return @"STOPPING";
            case AWSglueTaskStatusTypeStopped:
                return @"STOPPED";
            case AWSglueTaskStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSglueTaskStatusTypeFailed:
                return @"FAILED";
            case AWSglueTaskStatusTypeTimeout:
                return @"TIMEOUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskRunTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EVALUATION"] == NSOrderedSame) {
            return @(AWSglueTaskTypeEvaluation);
        }
        if ([value caseInsensitiveCompare:@"LABELING_SET_GENERATION"] == NSOrderedSame) {
            return @(AWSglueTaskTypeLabelingSetGeneration);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_LABELS"] == NSOrderedSame) {
            return @(AWSglueTaskTypeImportLabels);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_LABELS"] == NSOrderedSame) {
            return @(AWSglueTaskTypeExportLabels);
        }
        if ([value caseInsensitiveCompare:@"FIND_MATCHES"] == NSOrderedSame) {
            return @(AWSglueTaskTypeFindMatches);
        }
        return @(AWSglueTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTaskTypeEvaluation:
                return @"EVALUATION";
            case AWSglueTaskTypeLabelingSetGeneration:
                return @"LABELING_SET_GENERATION";
            case AWSglueTaskTypeImportLabels:
                return @"IMPORT_LABELS";
            case AWSglueTaskTypeExportLabels:
                return @"EXPORT_LABELS";
            case AWSglueTaskTypeFindMatches:
                return @"FIND_MATCHES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueTaskRunProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportLabelsTaskRunProperties" : @"ExportLabelsTaskRunProperties",
             @"findMatchesTaskRunProperties" : @"FindMatchesTaskRunProperties",
             @"importLabelsTaskRunProperties" : @"ImportLabelsTaskRunProperties",
             @"labelingSetGenerationTaskRunProperties" : @"LabelingSetGenerationTaskRunProperties",
             @"taskType" : @"TaskType",
             };
}

+ (NSValueTransformer *)exportLabelsTaskRunPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueExportLabelsTaskRunProperties class]];
}

+ (NSValueTransformer *)findMatchesTaskRunPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueFindMatchesTaskRunProperties class]];
}

+ (NSValueTransformer *)importLabelsTaskRunPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueImportLabelsTaskRunProperties class]];
}

+ (NSValueTransformer *)labelingSetGenerationTaskRunPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueLabelingSetGenerationTaskRunProperties class]];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EVALUATION"] == NSOrderedSame) {
            return @(AWSglueTaskTypeEvaluation);
        }
        if ([value caseInsensitiveCompare:@"LABELING_SET_GENERATION"] == NSOrderedSame) {
            return @(AWSglueTaskTypeLabelingSetGeneration);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_LABELS"] == NSOrderedSame) {
            return @(AWSglueTaskTypeImportLabels);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_LABELS"] == NSOrderedSame) {
            return @(AWSglueTaskTypeExportLabels);
        }
        if ([value caseInsensitiveCompare:@"FIND_MATCHES"] == NSOrderedSame) {
            return @(AWSglueTaskTypeFindMatches);
        }
        return @(AWSglueTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTaskTypeEvaluation:
                return @"EVALUATION";
            case AWSglueTaskTypeLabelingSetGeneration:
                return @"LABELING_SET_GENERATION";
            case AWSglueTaskTypeImportLabels:
                return @"IMPORT_LABELS";
            case AWSglueTaskTypeExportLabels:
                return @"EXPORT_LABELS";
            case AWSglueTaskTypeFindMatches:
                return @"FIND_MATCHES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueTaskRunSortCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"column" : @"Column",
             @"sortDirection" : @"SortDirection",
             };
}

+ (NSValueTransformer *)columnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TASK_RUN_TYPE"] == NSOrderedSame) {
            return @(AWSglueTaskRunSortColumnTypeTaskRunType);
        }
        if ([value caseInsensitiveCompare:@"STATUS"] == NSOrderedSame) {
            return @(AWSglueTaskRunSortColumnTypeStatus);
        }
        if ([value caseInsensitiveCompare:@"STARTED"] == NSOrderedSame) {
            return @(AWSglueTaskRunSortColumnTypeStarted);
        }
        return @(AWSglueTaskRunSortColumnTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTaskRunSortColumnTypeTaskRunType:
                return @"TASK_RUN_TYPE";
            case AWSglueTaskRunSortColumnTypeStatus:
                return @"STATUS";
            case AWSglueTaskRunSortColumnTypeStarted:
                return @"STARTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortDirectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSglueSortDirectionTypeDescending);
        }
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSglueSortDirectionTypeAscending);
        }
        return @(AWSglueSortDirectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueSortDirectionTypeDescending:
                return @"DESCENDING";
            case AWSglueSortDirectionTypeAscending:
                return @"ASCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueTransformFilterCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdAfter" : @"CreatedAfter",
             @"createdBefore" : @"CreatedBefore",
             @"glueVersion" : @"GlueVersion",
             @"lastModifiedAfter" : @"LastModifiedAfter",
             @"lastModifiedBefore" : @"LastModifiedBefore",
             @"name" : @"Name",
             @"schema" : @"Schema",
             @"status" : @"Status",
             @"transformType" : @"TransformType",
             };
}

+ (NSValueTransformer *)createdAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)createdBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)schemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueSchemaColumn class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_READY"] == NSOrderedSame) {
            return @(AWSglueTransformStatusTypeNotReady);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSglueTransformStatusTypeReady);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSglueTransformStatusTypeDeleting);
        }
        return @(AWSglueTransformStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTransformStatusTypeNotReady:
                return @"NOT_READY";
            case AWSglueTransformStatusTypeReady:
                return @"READY";
            case AWSglueTransformStatusTypeDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transformTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIND_MATCHES"] == NSOrderedSame) {
            return @(AWSglueTransformTypeFindMatches);
        }
        return @(AWSglueTransformTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTransformTypeFindMatches:
                return @"FIND_MATCHES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueTransformParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findMatchesParameters" : @"FindMatchesParameters",
             @"transformType" : @"TransformType",
             };
}

+ (NSValueTransformer *)findMatchesParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueFindMatchesParameters class]];
}

+ (NSValueTransformer *)transformTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIND_MATCHES"] == NSOrderedSame) {
            return @(AWSglueTransformTypeFindMatches);
        }
        return @(AWSglueTransformTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTransformTypeFindMatches:
                return @"FIND_MATCHES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueTransformSortCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"column" : @"Column",
             @"sortDirection" : @"SortDirection",
             };
}

+ (NSValueTransformer *)columnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSglueTransformSortColumnTypeName);
        }
        if ([value caseInsensitiveCompare:@"TRANSFORM_TYPE"] == NSOrderedSame) {
            return @(AWSglueTransformSortColumnTypeTransformType);
        }
        if ([value caseInsensitiveCompare:@"STATUS"] == NSOrderedSame) {
            return @(AWSglueTransformSortColumnTypeStatus);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSglueTransformSortColumnTypeCreated);
        }
        if ([value caseInsensitiveCompare:@"LAST_MODIFIED"] == NSOrderedSame) {
            return @(AWSglueTransformSortColumnTypeLastModified);
        }
        return @(AWSglueTransformSortColumnTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTransformSortColumnTypeName:
                return @"NAME";
            case AWSglueTransformSortColumnTypeTransformType:
                return @"TRANSFORM_TYPE";
            case AWSglueTransformSortColumnTypeStatus:
                return @"STATUS";
            case AWSglueTransformSortColumnTypeCreated:
                return @"CREATED";
            case AWSglueTransformSortColumnTypeLastModified:
                return @"LAST_MODIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortDirectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSglueSortDirectionTypeDescending);
        }
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSglueSortDirectionTypeAscending);
        }
        return @(AWSglueSortDirectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueSortDirectionTypeDescending:
                return @"DESCENDING";
            case AWSglueSortDirectionTypeAscending:
                return @"ASCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueTrigger

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"predicate" : @"Predicate",
             @"schedule" : @"Schedule",
             @"state" : @"State",
             @"types" : @"Type",
             @"workflowName" : @"WorkflowName",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueAction class]];
}

+ (NSValueTransformer *)predicateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSgluePredicate class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSglueTriggerStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSglueTriggerStateCreated);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATING"] == NSOrderedSame) {
            return @(AWSglueTriggerStateActivating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATED"] == NSOrderedSame) {
            return @(AWSglueTriggerStateActivated);
        }
        if ([value caseInsensitiveCompare:@"DEACTIVATING"] == NSOrderedSame) {
            return @(AWSglueTriggerStateDeactivating);
        }
        if ([value caseInsensitiveCompare:@"DEACTIVATED"] == NSOrderedSame) {
            return @(AWSglueTriggerStateDeactivated);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSglueTriggerStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSglueTriggerStateUpdating);
        }
        return @(AWSglueTriggerStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTriggerStateCreating:
                return @"CREATING";
            case AWSglueTriggerStateCreated:
                return @"CREATED";
            case AWSglueTriggerStateActivating:
                return @"ACTIVATING";
            case AWSglueTriggerStateActivated:
                return @"ACTIVATED";
            case AWSglueTriggerStateDeactivating:
                return @"DEACTIVATING";
            case AWSglueTriggerStateDeactivated:
                return @"DEACTIVATED";
            case AWSglueTriggerStateDeleting:
                return @"DELETING";
            case AWSglueTriggerStateUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SCHEDULED"] == NSOrderedSame) {
            return @(AWSglueTriggerTypeScheduled);
        }
        if ([value caseInsensitiveCompare:@"CONDITIONAL"] == NSOrderedSame) {
            return @(AWSglueTriggerTypeConditional);
        }
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSglueTriggerTypeOnDemand);
        }
        return @(AWSglueTriggerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueTriggerTypeScheduled:
                return @"SCHEDULED";
            case AWSglueTriggerTypeConditional:
                return @"CONDITIONAL";
            case AWSglueTriggerTypeOnDemand:
                return @"ON_DEMAND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueTriggerNodeDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trigger" : @"Trigger",
             };
}

+ (NSValueTransformer *)triggerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTrigger class]];
}

@end

@implementation AWSglueTriggerUpdate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"predicate" : @"Predicate",
             @"schedule" : @"Schedule",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueAction class]];
}

+ (NSValueTransformer *)predicateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSgluePredicate class]];
}

@end

@implementation AWSglueUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagsToRemove" : @"TagsToRemove",
             };
}

@end

@implementation AWSglueUntagResourceResponse

@end

@implementation AWSglueUpdateClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"csvClassifier" : @"CsvClassifier",
             @"grokClassifier" : @"GrokClassifier",
             @"jsonClassifier" : @"JsonClassifier",
             @"XMLClassifier" : @"XMLClassifier",
             };
}

+ (NSValueTransformer *)csvClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueUpdateCsvClassifierRequest class]];
}

+ (NSValueTransformer *)grokClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueUpdateGrokClassifierRequest class]];
}

+ (NSValueTransformer *)jsonClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueUpdateJsonClassifierRequest class]];
}

+ (NSValueTransformer *)XMLClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueUpdateXMLClassifierRequest class]];
}

@end

@implementation AWSglueUpdateClassifierResponse

@end

@implementation AWSglueUpdateConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"connectionInput" : @"ConnectionInput",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)connectionInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueConnectionInput class]];
}

@end

@implementation AWSglueUpdateConnectionResponse

@end

@implementation AWSglueUpdateCrawlerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classifiers" : @"Classifiers",
             @"configuration" : @"Configuration",
             @"crawlerSecurityConfiguration" : @"CrawlerSecurityConfiguration",
             @"databaseName" : @"DatabaseName",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"role" : @"Role",
             @"schedule" : @"Schedule",
             @"schemaChangePolicy" : @"SchemaChangePolicy",
             @"tablePrefix" : @"TablePrefix",
             @"targets" : @"Targets",
             };
}

+ (NSValueTransformer *)schemaChangePolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueSchemaChangePolicy class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueCrawlerTargets class]];
}

@end

@implementation AWSglueUpdateCrawlerResponse

@end

@implementation AWSglueUpdateCrawlerScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerName" : @"CrawlerName",
             @"schedule" : @"Schedule",
             };
}

@end

@implementation AWSglueUpdateCrawlerScheduleResponse

@end

@implementation AWSglueUpdateCsvClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowSingleColumn" : @"AllowSingleColumn",
             @"containsHeader" : @"ContainsHeader",
             @"delimiter" : @"Delimiter",
             @"disableValueTrimming" : @"DisableValueTrimming",
             @"header" : @"Header",
             @"name" : @"Name",
             @"quoteSymbol" : @"QuoteSymbol",
             };
}

+ (NSValueTransformer *)containsHeaderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSglueCsvHeaderOptionUnknown);
        }
        if ([value caseInsensitiveCompare:@"PRESENT"] == NSOrderedSame) {
            return @(AWSglueCsvHeaderOptionPresent);
        }
        if ([value caseInsensitiveCompare:@"ABSENT"] == NSOrderedSame) {
            return @(AWSglueCsvHeaderOptionAbsent);
        }
        return @(AWSglueCsvHeaderOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueCsvHeaderOptionUnknown:
                return @"UNKNOWN";
            case AWSglueCsvHeaderOptionPresent:
                return @"PRESENT";
            case AWSglueCsvHeaderOptionAbsent:
                return @"ABSENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueUpdateDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseInput" : @"DatabaseInput",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)databaseInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueDatabaseInput class]];
}

@end

@implementation AWSglueUpdateDatabaseResponse

@end

@implementation AWSglueUpdateDevEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addArguments" : @"AddArguments",
             @"addPublicKeys" : @"AddPublicKeys",
             @"customLibraries" : @"CustomLibraries",
             @"deleteArguments" : @"DeleteArguments",
             @"deletePublicKeys" : @"DeletePublicKeys",
             @"endpointName" : @"EndpointName",
             @"publicKey" : @"PublicKey",
             @"updateEtlLibraries" : @"UpdateEtlLibraries",
             };
}

+ (NSValueTransformer *)customLibrariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueDevEndpointCustomLibraries class]];
}

@end

@implementation AWSglueUpdateDevEndpointResponse

@end

@implementation AWSglueUpdateGrokClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"customPatterns" : @"CustomPatterns",
             @"grokPattern" : @"GrokPattern",
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueUpdateJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobUpdate" : @"JobUpdate",
             };
}

+ (NSValueTransformer *)jobUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueJobUpdate class]];
}

@end

@implementation AWSglueUpdateJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             };
}

@end

@implementation AWSglueUpdateJsonClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jsonPath" : @"JsonPath",
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueUpdateMLTransformRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"glueVersion" : @"GlueVersion",
             @"maxCapacity" : @"MaxCapacity",
             @"maxRetries" : @"MaxRetries",
             @"name" : @"Name",
             @"numberOfWorkers" : @"NumberOfWorkers",
             @"parameters" : @"Parameters",
             @"role" : @"Role",
             @"timeout" : @"Timeout",
             @"transformId" : @"TransformId",
             @"workerType" : @"WorkerType",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTransformParameters class]];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSglueWorkerTypeG2x);
        }
        return @(AWSglueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueWorkerTypeStandard:
                return @"Standard";
            case AWSglueWorkerTypeG1x:
                return @"G.1X";
            case AWSglueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueUpdateMLTransformResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSglueUpdatePartitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"partitionInput" : @"PartitionInput",
             @"partitionValueList" : @"PartitionValueList",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)partitionInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSgluePartitionInput class]];
}

@end

@implementation AWSglueUpdatePartitionResponse

@end

@implementation AWSglueUpdateTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"skipArchive" : @"SkipArchive",
             @"tableInput" : @"TableInput",
             };
}

+ (NSValueTransformer *)tableInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTableInput class]];
}

@end

@implementation AWSglueUpdateTableResponse

@end

@implementation AWSglueUpdateTriggerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"triggerUpdate" : @"TriggerUpdate",
             };
}

+ (NSValueTransformer *)triggerUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTriggerUpdate class]];
}

@end

@implementation AWSglueUpdateTriggerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trigger" : @"Trigger",
             };
}

+ (NSValueTransformer *)triggerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueTrigger class]];
}

@end

@implementation AWSglueUpdateUserDefinedFunctionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"functionInput" : @"FunctionInput",
             @"functionName" : @"FunctionName",
             };
}

+ (NSValueTransformer *)functionInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueUserDefinedFunctionInput class]];
}

@end

@implementation AWSglueUpdateUserDefinedFunctionResponse

@end

@implementation AWSglueUpdateWorkflowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultRunProperties" : @"DefaultRunProperties",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueUpdateWorkflowResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSglueUpdateXMLClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"name" : @"Name",
             @"rowTag" : @"RowTag",
             };
}

@end

@implementation AWSglueUserDefinedFunction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"className" : @"ClassName",
             @"createTime" : @"CreateTime",
             @"functionName" : @"FunctionName",
             @"ownerName" : @"OwnerName",
             @"ownerType" : @"OwnerType",
             @"resourceUris" : @"ResourceUris",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)ownerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSgluePrincipalTypeUser);
        }
        if ([value caseInsensitiveCompare:@"ROLE"] == NSOrderedSame) {
            return @(AWSgluePrincipalTypeRole);
        }
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSgluePrincipalTypeGroup);
        }
        return @(AWSgluePrincipalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSgluePrincipalTypeUser:
                return @"USER";
            case AWSgluePrincipalTypeRole:
                return @"ROLE";
            case AWSgluePrincipalTypeGroup:
                return @"GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceUrisJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueResourceUri class]];
}

@end

@implementation AWSglueUserDefinedFunctionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"className" : @"ClassName",
             @"functionName" : @"FunctionName",
             @"ownerName" : @"OwnerName",
             @"ownerType" : @"OwnerType",
             @"resourceUris" : @"ResourceUris",
             };
}

+ (NSValueTransformer *)ownerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER"] == NSOrderedSame) {
            return @(AWSgluePrincipalTypeUser);
        }
        if ([value caseInsensitiveCompare:@"ROLE"] == NSOrderedSame) {
            return @(AWSgluePrincipalTypeRole);
        }
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSgluePrincipalTypeGroup);
        }
        return @(AWSgluePrincipalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSgluePrincipalTypeUser:
                return @"USER";
            case AWSgluePrincipalTypeRole:
                return @"ROLE";
            case AWSgluePrincipalTypeGroup:
                return @"GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceUrisJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueResourceUri class]];
}

@end

@implementation AWSglueWorkflow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdOn" : @"CreatedOn",
             @"defaultRunProperties" : @"DefaultRunProperties",
             @"detail" : @"Description",
             @"graph" : @"Graph",
             @"lastModifiedOn" : @"LastModifiedOn",
             @"lastRun" : @"LastRun",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)createdOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)graphJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueWorkflowGraph class]];
}

+ (NSValueTransformer *)lastModifiedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastRunJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueWorkflowRun class]];
}

@end

@implementation AWSglueWorkflowGraph

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"edges" : @"Edges",
             @"nodes" : @"Nodes",
             };
}

+ (NSValueTransformer *)edgesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueEdge class]];
}

+ (NSValueTransformer *)nodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSglueNode class]];
}

@end

@implementation AWSglueWorkflowRun

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completedOn" : @"CompletedOn",
             @"graph" : @"Graph",
             @"name" : @"Name",
             @"startedOn" : @"StartedOn",
             @"statistics" : @"Statistics",
             @"status" : @"Status",
             @"workflowRunId" : @"WorkflowRunId",
             @"workflowRunProperties" : @"WorkflowRunProperties",
             };
}

+ (NSValueTransformer *)completedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)graphJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueWorkflowGraph class]];
}

+ (NSValueTransformer *)startedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSglueWorkflowRunStatistics class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSglueWorkflowRunStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSglueWorkflowRunStatusCompleted);
        }
        return @(AWSglueWorkflowRunStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSglueWorkflowRunStatusRunning:
                return @"RUNNING";
            case AWSglueWorkflowRunStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSglueWorkflowRunStatistics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedActions" : @"FailedActions",
             @"runningActions" : @"RunningActions",
             @"stoppedActions" : @"StoppedActions",
             @"succeededActions" : @"SucceededActions",
             @"timeoutActions" : @"TimeoutActions",
             @"totalActions" : @"TotalActions",
             };
}

@end

@implementation AWSglueXMLClassifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"creationTime" : @"CreationTime",
             @"lastUpdated" : @"LastUpdated",
             @"name" : @"Name",
             @"rowTag" : @"RowTag",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end
