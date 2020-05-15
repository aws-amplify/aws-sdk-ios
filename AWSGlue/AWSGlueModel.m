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

#import "AWSGlueModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSGlueErrorDomain = @"com.amazonaws.AWSGlueErrorDomain";

@implementation AWSGlueAction

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueNotificationProperty class]];
}

@end

@implementation AWSGlueBatchCreatePartitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"partitionInputList" : @"PartitionInputList",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)partitionInputListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGluePartitionInput class]];
}

@end

@implementation AWSGlueBatchCreatePartitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGluePartitionError class]];
}

@end

@implementation AWSGlueBatchDeleteConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"connectionNameList" : @"ConnectionNameList",
             };
}

@end

@implementation AWSGlueBatchDeleteConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             @"succeeded" : @"Succeeded",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSGlueErrorDetail class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSGlueBatchDeletePartitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"partitionsToDelete" : @"PartitionsToDelete",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)partitionsToDeleteJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGluePartitionValueList class]];
}

@end

@implementation AWSGlueBatchDeletePartitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGluePartitionError class]];
}

@end

@implementation AWSGlueBatchDeleteTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"tablesToDelete" : @"TablesToDelete",
             };
}

@end

@implementation AWSGlueBatchDeleteTableResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueTableError class]];
}

@end

@implementation AWSGlueBatchDeleteTableVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"tableName" : @"TableName",
             @"versionIds" : @"VersionIds",
             };
}

@end

@implementation AWSGlueBatchDeleteTableVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueTableVersionError class]];
}

@end

@implementation AWSGlueBatchGetCrawlersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerNames" : @"CrawlerNames",
             };
}

@end

@implementation AWSGlueBatchGetCrawlersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlers" : @"Crawlers",
             @"crawlersNotFound" : @"CrawlersNotFound",
             };
}

+ (NSValueTransformer *)crawlersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCrawler class]];
}

@end

@implementation AWSGlueBatchGetDevEndpointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devEndpointNames" : @"DevEndpointNames",
             };
}

@end

@implementation AWSGlueBatchGetDevEndpointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devEndpoints" : @"DevEndpoints",
             @"devEndpointsNotFound" : @"DevEndpointsNotFound",
             };
}

+ (NSValueTransformer *)devEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueDevEndpoint class]];
}

@end

@implementation AWSGlueBatchGetJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobNames" : @"JobNames",
             };
}

@end

@implementation AWSGlueBatchGetJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobs" : @"Jobs",
             @"jobsNotFound" : @"JobsNotFound",
             };
}

+ (NSValueTransformer *)jobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueJob class]];
}

@end

@implementation AWSGlueBatchGetPartitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"partitionsToGet" : @"PartitionsToGet",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)partitionsToGetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGluePartitionValueList class]];
}

@end

@implementation AWSGlueBatchGetPartitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"partitions" : @"Partitions",
             @"unprocessedKeys" : @"UnprocessedKeys",
             };
}

+ (NSValueTransformer *)partitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGluePartition class]];
}

+ (NSValueTransformer *)unprocessedKeysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGluePartitionValueList class]];
}

@end

@implementation AWSGlueBatchGetTriggersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"triggerNames" : @"TriggerNames",
             };
}

@end

@implementation AWSGlueBatchGetTriggersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"triggers" : @"Triggers",
             @"triggersNotFound" : @"TriggersNotFound",
             };
}

+ (NSValueTransformer *)triggersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueTrigger class]];
}

@end

@implementation AWSGlueBatchGetWorkflowsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeGraph" : @"IncludeGraph",
             @"names" : @"Names",
             };
}

@end

@implementation AWSGlueBatchGetWorkflowsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"missingWorkflows" : @"MissingWorkflows",
             @"workflows" : @"Workflows",
             };
}

+ (NSValueTransformer *)workflowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueWorkflow class]];
}

@end

@implementation AWSGlueBatchStopJobRunError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorDetail" : @"ErrorDetail",
             @"jobName" : @"JobName",
             @"jobRunId" : @"JobRunId",
             };
}

+ (NSValueTransformer *)errorDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueErrorDetail class]];
}

@end

@implementation AWSGlueBatchStopJobRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobRunIds" : @"JobRunIds",
             };
}

@end

@implementation AWSGlueBatchStopJobRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             @"successfulSubmissions" : @"SuccessfulSubmissions",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueBatchStopJobRunError class]];
}

+ (NSValueTransformer *)successfulSubmissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueBatchStopJobRunSuccessfulSubmission class]];
}

@end

@implementation AWSGlueBatchStopJobRunSuccessfulSubmission

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobRunId" : @"JobRunId",
             };
}

@end

@implementation AWSGlueCancelMLTaskRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskRunId" : @"TaskRunId",
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSGlueCancelMLTaskRunResponse

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
            return @(AWSGlueTaskStatusTypeStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeStopped);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeTimeout);
        }
        return @(AWSGlueTaskStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTaskStatusTypeStarting:
                return @"STARTING";
            case AWSGlueTaskStatusTypeRunning:
                return @"RUNNING";
            case AWSGlueTaskStatusTypeStopping:
                return @"STOPPING";
            case AWSGlueTaskStatusTypeStopped:
                return @"STOPPED";
            case AWSGlueTaskStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSGlueTaskStatusTypeFailed:
                return @"FAILED";
            case AWSGlueTaskStatusTypeTimeout:
                return @"TIMEOUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueCatalogEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseName" : @"DatabaseName",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSGlueCatalogImportStatus

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

@implementation AWSGlueCatalogTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseName" : @"DatabaseName",
             @"tables" : @"Tables",
             };
}

@end

@implementation AWSGlueClassifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"csvClassifier" : @"CsvClassifier",
             @"grokClassifier" : @"GrokClassifier",
             @"jsonClassifier" : @"JsonClassifier",
             @"XMLClassifier" : @"XMLClassifier",
             };
}

+ (NSValueTransformer *)csvClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCsvClassifier class]];
}

+ (NSValueTransformer *)grokClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueGrokClassifier class]];
}

+ (NSValueTransformer *)jsonClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueJsonClassifier class]];
}

+ (NSValueTransformer *)XMLClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueXMLClassifier class]];
}

@end

@implementation AWSGlueCloudWatchEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchEncryptionMode" : @"CloudWatchEncryptionMode",
             @"kmsKeyArn" : @"KmsKeyArn",
             };
}

+ (NSValueTransformer *)cloudWatchEncryptionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSGlueCloudWatchEncryptionModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"SSE-KMS"] == NSOrderedSame) {
            return @(AWSGlueCloudWatchEncryptionModeSseKms);
        }
        return @(AWSGlueCloudWatchEncryptionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueCloudWatchEncryptionModeDisabled:
                return @"DISABLED";
            case AWSGlueCloudWatchEncryptionModeSseKms:
                return @"SSE-KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueCodeGenEdge

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"source" : @"Source",
             @"target" : @"Target",
             @"targetParameter" : @"TargetParameter",
             };
}

@end

@implementation AWSGlueCodeGenNode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"args" : @"Args",
             @"identifier" : @"Id",
             @"lineNumber" : @"LineNumber",
             @"nodeType" : @"NodeType",
             };
}

+ (NSValueTransformer *)argsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCodeGenNodeArg class]];
}

@end

@implementation AWSGlueCodeGenNodeArg

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"param" : @"Param",
             @"value" : @"Value",
             };
}

@end

@implementation AWSGlueColumn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"name" : @"Name",
             @"parameters" : @"Parameters",
             @"types" : @"Type",
             };
}

@end

@implementation AWSGlueCondition

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
            return @(AWSGlueCrawlStateRunning);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSGlueCrawlStateCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSGlueCrawlStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSGlueCrawlStateSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSGlueCrawlStateFailed);
        }
        return @(AWSGlueCrawlStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueCrawlStateRunning:
                return @"RUNNING";
            case AWSGlueCrawlStateCancelling:
                return @"CANCELLING";
            case AWSGlueCrawlStateCancelled:
                return @"CANCELLED";
            case AWSGlueCrawlStateSucceeded:
                return @"SUCCEEDED";
            case AWSGlueCrawlStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)logicalOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQUALS"] == NSOrderedSame) {
            return @(AWSGlueLogicalOperatorEquals);
        }
        return @(AWSGlueLogicalOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueLogicalOperatorEquals:
                return @"EQUALS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSGlueJobRunStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSGlueJobRunStateRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSGlueJobRunStateStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSGlueJobRunStateStopped);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSGlueJobRunStateSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSGlueJobRunStateFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSGlueJobRunStateTimeout);
        }
        return @(AWSGlueJobRunStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueJobRunStateStarting:
                return @"STARTING";
            case AWSGlueJobRunStateRunning:
                return @"RUNNING";
            case AWSGlueJobRunStateStopping:
                return @"STOPPING";
            case AWSGlueJobRunStateStopped:
                return @"STOPPED";
            case AWSGlueJobRunStateSucceeded:
                return @"SUCCEEDED";
            case AWSGlueJobRunStateFailed:
                return @"FAILED";
            case AWSGlueJobRunStateTimeout:
                return @"TIMEOUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueConfusionMatrix

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numFalseNegatives" : @"NumFalseNegatives",
             @"numFalsePositives" : @"NumFalsePositives",
             @"numTrueNegatives" : @"NumTrueNegatives",
             @"numTruePositives" : @"NumTruePositives",
             };
}

@end

@implementation AWSGlueConnection

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
            return @(AWSGlueConnectionTypeJdbc);
        }
        if ([value caseInsensitiveCompare:@"SFTP"] == NSOrderedSame) {
            return @(AWSGlueConnectionTypeSftp);
        }
        if ([value caseInsensitiveCompare:@"MONGODB"] == NSOrderedSame) {
            return @(AWSGlueConnectionTypeMongodb);
        }
        if ([value caseInsensitiveCompare:@"KAFKA"] == NSOrderedSame) {
            return @(AWSGlueConnectionTypeKafka);
        }
        return @(AWSGlueConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueConnectionTypeJdbc:
                return @"JDBC";
            case AWSGlueConnectionTypeSftp:
                return @"SFTP";
            case AWSGlueConnectionTypeMongodb:
                return @"MONGODB";
            case AWSGlueConnectionTypeKafka:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGluePhysicalConnectionRequirements class]];
}

@end

@implementation AWSGlueConnectionInput

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
            return @(AWSGlueConnectionTypeJdbc);
        }
        if ([value caseInsensitiveCompare:@"SFTP"] == NSOrderedSame) {
            return @(AWSGlueConnectionTypeSftp);
        }
        if ([value caseInsensitiveCompare:@"MONGODB"] == NSOrderedSame) {
            return @(AWSGlueConnectionTypeMongodb);
        }
        if ([value caseInsensitiveCompare:@"KAFKA"] == NSOrderedSame) {
            return @(AWSGlueConnectionTypeKafka);
        }
        return @(AWSGlueConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueConnectionTypeJdbc:
                return @"JDBC";
            case AWSGlueConnectionTypeSftp:
                return @"SFTP";
            case AWSGlueConnectionTypeMongodb:
                return @"MONGODB";
            case AWSGlueConnectionTypeKafka:
                return @"KAFKA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)physicalConnectionRequirementsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGluePhysicalConnectionRequirements class]];
}

@end

@implementation AWSGlueConnectionPasswordEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsKmsKeyId" : @"AwsKmsKeyId",
             @"returnConnectionPasswordEncrypted" : @"ReturnConnectionPasswordEncrypted",
             };
}

@end

@implementation AWSGlueConnectionsList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connections" : @"Connections",
             };
}

@end

@implementation AWSGlueCrawl

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
            return @(AWSGlueCrawlStateRunning);
        }
        if ([value caseInsensitiveCompare:@"CANCELLING"] == NSOrderedSame) {
            return @(AWSGlueCrawlStateCancelling);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSGlueCrawlStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSGlueCrawlStateSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSGlueCrawlStateFailed);
        }
        return @(AWSGlueCrawlStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueCrawlStateRunning:
                return @"RUNNING";
            case AWSGlueCrawlStateCancelling:
                return @"CANCELLING";
            case AWSGlueCrawlStateCancelled:
                return @"CANCELLED";
            case AWSGlueCrawlStateSucceeded:
                return @"SUCCEEDED";
            case AWSGlueCrawlStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueCrawler

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueLastCrawlInfo class]];
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueSchedule class]];
}

+ (NSValueTransformer *)schemaChangePolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueSchemaChangePolicy class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSGlueCrawlerStateReady);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSGlueCrawlerStateRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSGlueCrawlerStateStopping);
        }
        return @(AWSGlueCrawlerStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueCrawlerStateReady:
                return @"READY";
            case AWSGlueCrawlerStateRunning:
                return @"RUNNING";
            case AWSGlueCrawlerStateStopping:
                return @"STOPPING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCrawlerTargets class]];
}

@end

@implementation AWSGlueCrawlerMetrics

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

@implementation AWSGlueCrawlerNodeDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawls" : @"Crawls",
             };
}

+ (NSValueTransformer *)crawlsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCrawl class]];
}

@end

@implementation AWSGlueCrawlerTargets

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogTargets" : @"CatalogTargets",
             @"dynamoDBTargets" : @"DynamoDBTargets",
             @"jdbcTargets" : @"JdbcTargets",
             @"s3Targets" : @"S3Targets",
             };
}

+ (NSValueTransformer *)catalogTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCatalogTarget class]];
}

+ (NSValueTransformer *)dynamoDBTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueDynamoDBTarget class]];
}

+ (NSValueTransformer *)jdbcTargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueJdbcTarget class]];
}

+ (NSValueTransformer *)s3TargetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueS3Target class]];
}

@end

@implementation AWSGlueCreateClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"csvClassifier" : @"CsvClassifier",
             @"grokClassifier" : @"GrokClassifier",
             @"jsonClassifier" : @"JsonClassifier",
             @"XMLClassifier" : @"XMLClassifier",
             };
}

+ (NSValueTransformer *)csvClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCreateCsvClassifierRequest class]];
}

+ (NSValueTransformer *)grokClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCreateGrokClassifierRequest class]];
}

+ (NSValueTransformer *)jsonClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCreateJsonClassifierRequest class]];
}

+ (NSValueTransformer *)XMLClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCreateXMLClassifierRequest class]];
}

@end

@implementation AWSGlueCreateClassifierResponse

@end

@implementation AWSGlueCreateConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"connectionInput" : @"ConnectionInput",
             };
}

+ (NSValueTransformer *)connectionInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueConnectionInput class]];
}

@end

@implementation AWSGlueCreateConnectionResponse

@end

@implementation AWSGlueCreateCrawlerRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueSchemaChangePolicy class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCrawlerTargets class]];
}

@end

@implementation AWSGlueCreateCrawlerResponse

@end

@implementation AWSGlueCreateCsvClassifierRequest

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
            return @(AWSGlueCsvHeaderOptionUnknown);
        }
        if ([value caseInsensitiveCompare:@"PRESENT"] == NSOrderedSame) {
            return @(AWSGlueCsvHeaderOptionPresent);
        }
        if ([value caseInsensitiveCompare:@"ABSENT"] == NSOrderedSame) {
            return @(AWSGlueCsvHeaderOptionAbsent);
        }
        return @(AWSGlueCsvHeaderOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueCsvHeaderOptionUnknown:
                return @"UNKNOWN";
            case AWSGlueCsvHeaderOptionPresent:
                return @"PRESENT";
            case AWSGlueCsvHeaderOptionAbsent:
                return @"ABSENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueCreateDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseInput" : @"DatabaseInput",
             };
}

+ (NSValueTransformer *)databaseInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueDatabaseInput class]];
}

@end

@implementation AWSGlueCreateDatabaseResponse

@end

@implementation AWSGlueCreateDevEndpointRequest

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
            return @(AWSGlueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG2x);
        }
        return @(AWSGlueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueWorkerTypeStandard:
                return @"Standard";
            case AWSGlueWorkerTypeG1x:
                return @"G.1X";
            case AWSGlueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueCreateDevEndpointResponse

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
            return @(AWSGlueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG2x);
        }
        return @(AWSGlueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueWorkerTypeStandard:
                return @"Standard";
            case AWSGlueWorkerTypeG1x:
                return @"G.1X";
            case AWSGlueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueCreateGrokClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"customPatterns" : @"CustomPatterns",
             @"grokPattern" : @"GrokPattern",
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueCreateJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueJobCommand class]];
}

+ (NSValueTransformer *)connectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueConnectionsList class]];
}

+ (NSValueTransformer *)executionPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueExecutionProperty class]];
}

+ (NSValueTransformer *)notificationPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueNotificationProperty class]];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG2x);
        }
        return @(AWSGlueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueWorkerTypeStandard:
                return @"Standard";
            case AWSGlueWorkerTypeG1x:
                return @"G.1X";
            case AWSGlueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueCreateJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueCreateJsonClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jsonPath" : @"JsonPath",
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueCreateMLTransformRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueGlueTable class]];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTransformParameters class]];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG2x);
        }
        return @(AWSGlueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueWorkerTypeStandard:
                return @"Standard";
            case AWSGlueWorkerTypeG1x:
                return @"G.1X";
            case AWSGlueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueCreateMLTransformResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSGlueCreatePartitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"partitionInput" : @"PartitionInput",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)partitionInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGluePartitionInput class]];
}

@end

@implementation AWSGlueCreatePartitionResponse

@end

@implementation AWSGlueCreateScriptRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dagEdges" : @"DagEdges",
             @"dagNodes" : @"DagNodes",
             @"language" : @"Language",
             };
}

+ (NSValueTransformer *)dagEdgesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCodeGenEdge class]];
}

+ (NSValueTransformer *)dagNodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCodeGenNode class]];
}

+ (NSValueTransformer *)languageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PYTHON"] == NSOrderedSame) {
            return @(AWSGlueLanguagePython);
        }
        if ([value caseInsensitiveCompare:@"SCALA"] == NSOrderedSame) {
            return @(AWSGlueLanguageScala);
        }
        return @(AWSGlueLanguageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueLanguagePython:
                return @"PYTHON";
            case AWSGlueLanguageScala:
                return @"SCALA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueCreateScriptResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pythonScript" : @"PythonScript",
             @"scalaCode" : @"ScalaCode",
             };
}

@end

@implementation AWSGlueCreateSecurityConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionConfiguration" : @"EncryptionConfiguration",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)encryptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueEncryptionConfiguration class]];
}

@end

@implementation AWSGlueCreateSecurityConfigurationResponse

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

@implementation AWSGlueCreateTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"tableInput" : @"TableInput",
             };
}

+ (NSValueTransformer *)tableInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTableInput class]];
}

@end

@implementation AWSGlueCreateTableResponse

@end

@implementation AWSGlueCreateTriggerRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueAction class]];
}

+ (NSValueTransformer *)predicateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGluePredicate class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SCHEDULED"] == NSOrderedSame) {
            return @(AWSGlueTriggerTypeScheduled);
        }
        if ([value caseInsensitiveCompare:@"CONDITIONAL"] == NSOrderedSame) {
            return @(AWSGlueTriggerTypeConditional);
        }
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSGlueTriggerTypeOnDemand);
        }
        return @(AWSGlueTriggerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTriggerTypeScheduled:
                return @"SCHEDULED";
            case AWSGlueTriggerTypeConditional:
                return @"CONDITIONAL";
            case AWSGlueTriggerTypeOnDemand:
                return @"ON_DEMAND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueCreateTriggerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueCreateUserDefinedFunctionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"functionInput" : @"FunctionInput",
             };
}

+ (NSValueTransformer *)functionInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueUserDefinedFunctionInput class]];
}

@end

@implementation AWSGlueCreateUserDefinedFunctionResponse

@end

@implementation AWSGlueCreateWorkflowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultRunProperties" : @"DefaultRunProperties",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSGlueCreateWorkflowResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueCreateXMLClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"name" : @"Name",
             @"rowTag" : @"RowTag",
             };
}

@end

@implementation AWSGlueCsvClassifier

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
            return @(AWSGlueCsvHeaderOptionUnknown);
        }
        if ([value caseInsensitiveCompare:@"PRESENT"] == NSOrderedSame) {
            return @(AWSGlueCsvHeaderOptionPresent);
        }
        if ([value caseInsensitiveCompare:@"ABSENT"] == NSOrderedSame) {
            return @(AWSGlueCsvHeaderOptionAbsent);
        }
        return @(AWSGlueCsvHeaderOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueCsvHeaderOptionUnknown:
                return @"UNKNOWN";
            case AWSGlueCsvHeaderOptionPresent:
                return @"PRESENT";
            case AWSGlueCsvHeaderOptionAbsent:
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

@implementation AWSGlueDataCatalogEncryptionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionPasswordEncryption" : @"ConnectionPasswordEncryption",
             @"encryptionAtRest" : @"EncryptionAtRest",
             };
}

+ (NSValueTransformer *)connectionPasswordEncryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueConnectionPasswordEncryption class]];
}

+ (NSValueTransformer *)encryptionAtRestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueEncryptionAtRest class]];
}

@end

@implementation AWSGlueDataLakePrincipal

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataLakePrincipalIdentifier" : @"DataLakePrincipalIdentifier",
             };
}

@end

@implementation AWSGlueDatabase

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGluePrincipalPermissions class]];
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSGlueDatabaseInput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGluePrincipalPermissions class]];
}

@end

@implementation AWSGlueDeleteClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueDeleteClassifierResponse

@end

@implementation AWSGlueDeleteConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"connectionName" : @"ConnectionName",
             };
}

@end

@implementation AWSGlueDeleteConnectionResponse

@end

@implementation AWSGlueDeleteCrawlerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueDeleteCrawlerResponse

@end

@implementation AWSGlueDeleteDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueDeleteDatabaseResponse

@end

@implementation AWSGlueDeleteDevEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointName" : @"EndpointName",
             };
}

@end

@implementation AWSGlueDeleteDevEndpointResponse

@end

@implementation AWSGlueDeleteJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             };
}

@end

@implementation AWSGlueDeleteJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             };
}

@end

@implementation AWSGlueDeleteMLTransformRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSGlueDeleteMLTransformResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSGlueDeletePartitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"partitionValues" : @"PartitionValues",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSGlueDeletePartitionResponse

@end

@implementation AWSGlueDeleteResourcePolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyHashCondition" : @"PolicyHashCondition",
             };
}

@end

@implementation AWSGlueDeleteResourcePolicyResponse

@end

@implementation AWSGlueDeleteSecurityConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueDeleteSecurityConfigurationResponse

@end

@implementation AWSGlueDeleteTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueDeleteTableResponse

@end

@implementation AWSGlueDeleteTableVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"tableName" : @"TableName",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSGlueDeleteTableVersionResponse

@end

@implementation AWSGlueDeleteTriggerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueDeleteTriggerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueDeleteUserDefinedFunctionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSGlueDeleteUserDefinedFunctionResponse

@end

@implementation AWSGlueDeleteWorkflowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueDeleteWorkflowResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueDevEndpoint

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
            return @(AWSGlueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG2x);
        }
        return @(AWSGlueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueWorkerTypeStandard:
                return @"Standard";
            case AWSGlueWorkerTypeG1x:
                return @"G.1X";
            case AWSGlueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueDevEndpointCustomLibraries

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"extraJarsS3Path" : @"ExtraJarsS3Path",
             @"extraPythonLibsS3Path" : @"ExtraPythonLibsS3Path",
             };
}

@end

@implementation AWSGlueDynamoDBTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"path" : @"Path",
             };
}

@end

@implementation AWSGlueEdge

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationId" : @"DestinationId",
             @"sourceId" : @"SourceId",
             };
}

@end

@implementation AWSGlueEncryptionAtRest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogEncryptionMode" : @"CatalogEncryptionMode",
             @"sseAwsKmsKeyId" : @"SseAwsKmsKeyId",
             };
}

+ (NSValueTransformer *)catalogEncryptionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSGlueCatalogEncryptionModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"SSE-KMS"] == NSOrderedSame) {
            return @(AWSGlueCatalogEncryptionModeSseKms);
        }
        return @(AWSGlueCatalogEncryptionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueCatalogEncryptionModeDisabled:
                return @"DISABLED";
            case AWSGlueCatalogEncryptionModeSseKms:
                return @"SSE-KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueEncryptionConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchEncryption" : @"CloudWatchEncryption",
             @"jobBookmarksEncryption" : @"JobBookmarksEncryption",
             @"s3Encryption" : @"S3Encryption",
             };
}

+ (NSValueTransformer *)cloudWatchEncryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCloudWatchEncryption class]];
}

+ (NSValueTransformer *)jobBookmarksEncryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueJobBookmarksEncryption class]];
}

+ (NSValueTransformer *)s3EncryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueS3Encryption class]];
}

@end

@implementation AWSGlueErrorDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             };
}

@end

@implementation AWSGlueEvaluationMetrics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findMatchesMetrics" : @"FindMatchesMetrics",
             @"transformType" : @"TransformType",
             };
}

+ (NSValueTransformer *)findMatchesMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueFindMatchesMetrics class]];
}

+ (NSValueTransformer *)transformTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIND_MATCHES"] == NSOrderedSame) {
            return @(AWSGlueTransformTypeFindMatches);
        }
        return @(AWSGlueTransformTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTransformTypeFindMatches:
                return @"FIND_MATCHES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueExecutionProperty

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxConcurrentRuns" : @"MaxConcurrentRuns",
             };
}

@end

@implementation AWSGlueExportLabelsTaskRunProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputS3Path" : @"OutputS3Path",
             };
}

@end

@implementation AWSGlueFindMatchesMetrics

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueConfusionMatrix class]];
}

@end

@implementation AWSGlueFindMatchesParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accuracyCostTradeoff" : @"AccuracyCostTradeoff",
             @"enforceProvidedLabels" : @"EnforceProvidedLabels",
             @"precisionRecallTradeoff" : @"PrecisionRecallTradeoff",
             @"primaryKeyColumnName" : @"PrimaryKeyColumnName",
             };
}

@end

@implementation AWSGlueFindMatchesTaskRunProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobRunId" : @"JobRunId",
             };
}

@end

@implementation AWSGlueGetCatalogImportStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             };
}

@end

@implementation AWSGlueGetCatalogImportStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importStatus" : @"ImportStatus",
             };
}

+ (NSValueTransformer *)importStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCatalogImportStatus class]];
}

@end

@implementation AWSGlueGetClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueGetClassifierResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classifier" : @"Classifier",
             };
}

+ (NSValueTransformer *)classifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueClassifier class]];
}

@end

@implementation AWSGlueGetClassifiersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueGetClassifiersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classifiers" : @"Classifiers",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)classifiersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueClassifier class]];
}

@end

@implementation AWSGlueGetConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"hidePassword" : @"HidePassword",
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueGetConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connection" : @"Connection",
             };
}

+ (NSValueTransformer *)connectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueConnection class]];
}

@end

@implementation AWSGlueGetConnectionsFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionType" : @"ConnectionType",
             @"matchCriteria" : @"MatchCriteria",
             };
}

+ (NSValueTransformer *)connectionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JDBC"] == NSOrderedSame) {
            return @(AWSGlueConnectionTypeJdbc);
        }
        if ([value caseInsensitiveCompare:@"SFTP"] == NSOrderedSame) {
            return @(AWSGlueConnectionTypeSftp);
        }
        if ([value caseInsensitiveCompare:@"MONGODB"] == NSOrderedSame) {
            return @(AWSGlueConnectionTypeMongodb);
        }
        if ([value caseInsensitiveCompare:@"KAFKA"] == NSOrderedSame) {
            return @(AWSGlueConnectionTypeKafka);
        }
        return @(AWSGlueConnectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueConnectionTypeJdbc:
                return @"JDBC";
            case AWSGlueConnectionTypeSftp:
                return @"SFTP";
            case AWSGlueConnectionTypeMongodb:
                return @"MONGODB";
            case AWSGlueConnectionTypeKafka:
                return @"KAFKA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueGetConnectionsRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueGetConnectionsFilter class]];
}

@end

@implementation AWSGlueGetConnectionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionList" : @"ConnectionList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)connectionListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueConnection class]];
}

@end

@implementation AWSGlueGetCrawlerMetricsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerNameList" : @"CrawlerNameList",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueGetCrawlerMetricsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerMetricsList" : @"CrawlerMetricsList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)crawlerMetricsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCrawlerMetrics class]];
}

@end

@implementation AWSGlueGetCrawlerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueGetCrawlerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawler" : @"Crawler",
             };
}

+ (NSValueTransformer *)crawlerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCrawler class]];
}

@end

@implementation AWSGlueGetCrawlersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueGetCrawlersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlers" : @"Crawlers",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)crawlersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCrawler class]];
}

@end

@implementation AWSGlueGetDataCatalogEncryptionSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             };
}

@end

@implementation AWSGlueGetDataCatalogEncryptionSettingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataCatalogEncryptionSettings" : @"DataCatalogEncryptionSettings",
             };
}

+ (NSValueTransformer *)dataCatalogEncryptionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueDataCatalogEncryptionSettings class]];
}

@end

@implementation AWSGlueGetDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueGetDatabaseResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"database" : @"Database",
             };
}

+ (NSValueTransformer *)databaseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueDatabase class]];
}

@end

@implementation AWSGlueGetDatabasesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueGetDatabasesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"databaseList" : @"DatabaseList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)databaseListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueDatabase class]];
}

@end

@implementation AWSGlueGetDataflowGraphRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pythonScript" : @"PythonScript",
             };
}

@end

@implementation AWSGlueGetDataflowGraphResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dagEdges" : @"DagEdges",
             @"dagNodes" : @"DagNodes",
             };
}

+ (NSValueTransformer *)dagEdgesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCodeGenEdge class]];
}

+ (NSValueTransformer *)dagNodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCodeGenNode class]];
}

@end

@implementation AWSGlueGetDevEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointName" : @"EndpointName",
             };
}

@end

@implementation AWSGlueGetDevEndpointResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devEndpoint" : @"DevEndpoint",
             };
}

+ (NSValueTransformer *)devEndpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueDevEndpoint class]];
}

@end

@implementation AWSGlueGetDevEndpointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueGetDevEndpointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devEndpoints" : @"DevEndpoints",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)devEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueDevEndpoint class]];
}

@end

@implementation AWSGlueGetJobBookmarkRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSGlueGetJobBookmarkResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobBookmarkEntry" : @"JobBookmarkEntry",
             };
}

+ (NSValueTransformer *)jobBookmarkEntryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueJobBookmarkEntry class]];
}

@end

@implementation AWSGlueGetJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             };
}

@end

@implementation AWSGlueGetJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"job" : @"Job",
             };
}

+ (NSValueTransformer *)jobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueJob class]];
}

@end

@implementation AWSGlueGetJobRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"predecessorsIncluded" : @"PredecessorsIncluded",
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSGlueGetJobRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobRun" : @"JobRun",
             };
}

+ (NSValueTransformer *)jobRunJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueJobRun class]];
}

@end

@implementation AWSGlueGetJobRunsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueGetJobRunsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobRuns" : @"JobRuns",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobRunsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueJobRun class]];
}

@end

@implementation AWSGlueGetJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueGetJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobs" : @"Jobs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueJob class]];
}

@end

@implementation AWSGlueGetMLTaskRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskRunId" : @"TaskRunId",
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSGlueGetMLTaskRunResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTaskRunProperties class]];
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
            return @(AWSGlueTaskStatusTypeStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeStopped);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeTimeout);
        }
        return @(AWSGlueTaskStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTaskStatusTypeStarting:
                return @"STARTING";
            case AWSGlueTaskStatusTypeRunning:
                return @"RUNNING";
            case AWSGlueTaskStatusTypeStopping:
                return @"STOPPING";
            case AWSGlueTaskStatusTypeStopped:
                return @"STOPPED";
            case AWSGlueTaskStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSGlueTaskStatusTypeFailed:
                return @"FAILED";
            case AWSGlueTaskStatusTypeTimeout:
                return @"TIMEOUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueGetMLTaskRunsRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTaskRunFilterCriteria class]];
}

+ (NSValueTransformer *)sortJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTaskRunSortCriteria class]];
}

@end

@implementation AWSGlueGetMLTaskRunsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"taskRuns" : @"TaskRuns",
             };
}

+ (NSValueTransformer *)taskRunsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueTaskRun class]];
}

@end

@implementation AWSGlueGetMLTransformRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSGlueGetMLTransformResponse

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueEvaluationMetrics class]];
}

+ (NSValueTransformer *)inputRecordTablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueGlueTable class]];
}

+ (NSValueTransformer *)lastModifiedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTransformParameters class]];
}

+ (NSValueTransformer *)schemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueSchemaColumn class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_READY"] == NSOrderedSame) {
            return @(AWSGlueTransformStatusTypeNotReady);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSGlueTransformStatusTypeReady);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSGlueTransformStatusTypeDeleting);
        }
        return @(AWSGlueTransformStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTransformStatusTypeNotReady:
                return @"NOT_READY";
            case AWSGlueTransformStatusTypeReady:
                return @"READY";
            case AWSGlueTransformStatusTypeDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG2x);
        }
        return @(AWSGlueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueWorkerTypeStandard:
                return @"Standard";
            case AWSGlueWorkerTypeG1x:
                return @"G.1X";
            case AWSGlueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueGetMLTransformsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"sort" : @"Sort",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTransformFilterCriteria class]];
}

+ (NSValueTransformer *)sortJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTransformSortCriteria class]];
}

@end

@implementation AWSGlueGetMLTransformsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"transforms" : @"Transforms",
             };
}

+ (NSValueTransformer *)transformsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueMLTransform class]];
}

@end

@implementation AWSGlueGetMappingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"sinks" : @"Sinks",
             @"source" : @"Source",
             };
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueLocation class]];
}

+ (NSValueTransformer *)sinksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCatalogEntry class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCatalogEntry class]];
}

@end

@implementation AWSGlueGetMappingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mapping" : @"Mapping",
             };
}

+ (NSValueTransformer *)mappingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueMappingEntry class]];
}

@end

@implementation AWSGlueGetPartitionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"partitionValues" : @"PartitionValues",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSGlueGetPartitionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"partition" : @"Partition",
             };
}

+ (NSValueTransformer *)partitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGluePartition class]];
}

@end

@implementation AWSGlueGetPartitionsRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueSegment class]];
}

@end

@implementation AWSGlueGetPartitionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"partitions" : @"Partitions",
             };
}

+ (NSValueTransformer *)partitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGluePartition class]];
}

@end

@implementation AWSGlueGetPlanRequest

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
            return @(AWSGlueLanguagePython);
        }
        if ([value caseInsensitiveCompare:@"SCALA"] == NSOrderedSame) {
            return @(AWSGlueLanguageScala);
        }
        return @(AWSGlueLanguageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueLanguagePython:
                return @"PYTHON";
            case AWSGlueLanguageScala:
                return @"SCALA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueLocation class]];
}

+ (NSValueTransformer *)mappingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueMappingEntry class]];
}

+ (NSValueTransformer *)sinksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCatalogEntry class]];
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCatalogEntry class]];
}

@end

@implementation AWSGlueGetPlanResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pythonScript" : @"PythonScript",
             @"scalaCode" : @"ScalaCode",
             };
}

@end

@implementation AWSGlueGetResourcePolicyRequest

@end

@implementation AWSGlueGetResourcePolicyResponse

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

@implementation AWSGlueGetSecurityConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueGetSecurityConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityConfiguration" : @"SecurityConfiguration",
             };
}

+ (NSValueTransformer *)securityConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueSecurityConfiguration class]];
}

@end

@implementation AWSGlueGetSecurityConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueGetSecurityConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"securityConfigurations" : @"SecurityConfigurations",
             };
}

+ (NSValueTransformer *)securityConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueSecurityConfiguration class]];
}

@end

@implementation AWSGlueGetTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueGetTableResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"table" : @"Table",
             };
}

+ (NSValueTransformer *)tableJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTable class]];
}

@end

@implementation AWSGlueGetTableVersionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"tableName" : @"TableName",
             @"versionId" : @"VersionId",
             };
}

@end

@implementation AWSGlueGetTableVersionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tableVersion" : @"TableVersion",
             };
}

+ (NSValueTransformer *)tableVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTableVersion class]];
}

@end

@implementation AWSGlueGetTableVersionsRequest

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

@implementation AWSGlueGetTableVersionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tableVersions" : @"TableVersions",
             };
}

+ (NSValueTransformer *)tableVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueTableVersion class]];
}

@end

@implementation AWSGlueGetTablesRequest

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

@implementation AWSGlueGetTablesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tableList" : @"TableList",
             };
}

+ (NSValueTransformer *)tableListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueTable class]];
}

@end

@implementation AWSGlueGetTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSGlueGetTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSGlueGetTriggerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueGetTriggerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trigger" : @"Trigger",
             };
}

+ (NSValueTransformer *)triggerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTrigger class]];
}

@end

@implementation AWSGlueGetTriggersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dependentJobName" : @"DependentJobName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueGetTriggersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"triggers" : @"Triggers",
             };
}

+ (NSValueTransformer *)triggersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueTrigger class]];
}

@end

@implementation AWSGlueGetUserDefinedFunctionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"functionName" : @"FunctionName",
             };
}

@end

@implementation AWSGlueGetUserDefinedFunctionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userDefinedFunction" : @"UserDefinedFunction",
             };
}

+ (NSValueTransformer *)userDefinedFunctionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueUserDefinedFunction class]];
}

@end

@implementation AWSGlueGetUserDefinedFunctionsRequest

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

@implementation AWSGlueGetUserDefinedFunctionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"userDefinedFunctions" : @"UserDefinedFunctions",
             };
}

+ (NSValueTransformer *)userDefinedFunctionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueUserDefinedFunction class]];
}

@end

@implementation AWSGlueGetWorkflowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeGraph" : @"IncludeGraph",
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueGetWorkflowResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"workflow" : @"Workflow",
             };
}

+ (NSValueTransformer *)workflowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueWorkflow class]];
}

@end

@implementation AWSGlueGetWorkflowRunPropertiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSGlueGetWorkflowRunPropertiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"runProperties" : @"RunProperties",
             };
}

@end

@implementation AWSGlueGetWorkflowRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeGraph" : @"IncludeGraph",
             @"name" : @"Name",
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSGlueGetWorkflowRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"run" : @"Run",
             };
}

+ (NSValueTransformer *)runJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueWorkflowRun class]];
}

@end

@implementation AWSGlueGetWorkflowRunsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"includeGraph" : @"IncludeGraph",
             @"maxResults" : @"MaxResults",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueGetWorkflowRunsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"runs" : @"Runs",
             };
}

+ (NSValueTransformer *)runsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueWorkflowRun class]];
}

@end

@implementation AWSGlueGlueTable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"connectionName" : @"ConnectionName",
             @"databaseName" : @"DatabaseName",
             @"tableName" : @"TableName",
             };
}

@end

@implementation AWSGlueGrokClassifier

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

@implementation AWSGlueImportCatalogToGlueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             };
}

@end

@implementation AWSGlueImportCatalogToGlueResponse

@end

@implementation AWSGlueImportLabelsTaskRunProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputS3Path" : @"InputS3Path",
             @"replace" : @"Replace",
             };
}

@end

@implementation AWSGlueJdbcTarget

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionName" : @"ConnectionName",
             @"exclusions" : @"Exclusions",
             @"path" : @"Path",
             };
}

@end

@implementation AWSGlueJob

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueJobCommand class]];
}

+ (NSValueTransformer *)connectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueConnectionsList class]];
}

+ (NSValueTransformer *)createdOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)executionPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueExecutionProperty class]];
}

+ (NSValueTransformer *)lastModifiedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notificationPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueNotificationProperty class]];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG2x);
        }
        return @(AWSGlueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueWorkerTypeStandard:
                return @"Standard";
            case AWSGlueWorkerTypeG1x:
                return @"G.1X";
            case AWSGlueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueJobBookmarkEntry

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

@implementation AWSGlueJobBookmarksEncryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobBookmarksEncryptionMode" : @"JobBookmarksEncryptionMode",
             @"kmsKeyArn" : @"KmsKeyArn",
             };
}

+ (NSValueTransformer *)jobBookmarksEncryptionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSGlueJobBookmarksEncryptionModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"CSE-KMS"] == NSOrderedSame) {
            return @(AWSGlueJobBookmarksEncryptionModeCseKms);
        }
        return @(AWSGlueJobBookmarksEncryptionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueJobBookmarksEncryptionModeDisabled:
                return @"DISABLED";
            case AWSGlueJobBookmarksEncryptionModeCseKms:
                return @"CSE-KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueJobCommand

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"pythonVersion" : @"PythonVersion",
             @"scriptLocation" : @"ScriptLocation",
             };
}

@end

@implementation AWSGlueJobNodeDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobRuns" : @"JobRuns",
             };
}

+ (NSValueTransformer *)jobRunsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueJobRun class]];
}

@end

@implementation AWSGlueJobRun

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
            return @(AWSGlueJobRunStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSGlueJobRunStateRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSGlueJobRunStateStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSGlueJobRunStateStopped);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSGlueJobRunStateSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSGlueJobRunStateFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSGlueJobRunStateTimeout);
        }
        return @(AWSGlueJobRunStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueJobRunStateStarting:
                return @"STARTING";
            case AWSGlueJobRunStateRunning:
                return @"RUNNING";
            case AWSGlueJobRunStateStopping:
                return @"STOPPING";
            case AWSGlueJobRunStateStopped:
                return @"STOPPED";
            case AWSGlueJobRunStateSucceeded:
                return @"SUCCEEDED";
            case AWSGlueJobRunStateFailed:
                return @"FAILED";
            case AWSGlueJobRunStateTimeout:
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueNotificationProperty class]];
}

+ (NSValueTransformer *)predecessorRunsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGluePredecessor class]];
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
            return @(AWSGlueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG2x);
        }
        return @(AWSGlueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueWorkerTypeStandard:
                return @"Standard";
            case AWSGlueWorkerTypeG1x:
                return @"G.1X";
            case AWSGlueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueJobUpdate

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueJobCommand class]];
}

+ (NSValueTransformer *)connectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueConnectionsList class]];
}

+ (NSValueTransformer *)executionPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueExecutionProperty class]];
}

+ (NSValueTransformer *)notificationPropertyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueNotificationProperty class]];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG2x);
        }
        return @(AWSGlueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueWorkerTypeStandard:
                return @"Standard";
            case AWSGlueWorkerTypeG1x:
                return @"G.1X";
            case AWSGlueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueJsonClassifier

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

@implementation AWSGlueLabelingSetGenerationTaskRunProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputS3Path" : @"OutputS3Path",
             };
}

@end

@implementation AWSGlueLastCrawlInfo

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
            return @(AWSGlueLastCrawlStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSGlueLastCrawlStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSGlueLastCrawlStatusFailed);
        }
        return @(AWSGlueLastCrawlStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueLastCrawlStatusSucceeded:
                return @"SUCCEEDED";
            case AWSGlueLastCrawlStatusCancelled:
                return @"CANCELLED";
            case AWSGlueLastCrawlStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueListCrawlersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSGlueListCrawlersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerNames" : @"CrawlerNames",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueListDevEndpointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSGlueListDevEndpointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devEndpointNames" : @"DevEndpointNames",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueListJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSGlueListJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobNames" : @"JobNames",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueListMLTransformsRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTransformFilterCriteria class]];
}

+ (NSValueTransformer *)sortJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTransformSortCriteria class]];
}

@end

@implementation AWSGlueListMLTransformsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"transformIds" : @"TransformIds",
             };
}

@end

@implementation AWSGlueListTriggersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dependentJobName" : @"DependentJobName",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSGlueListTriggersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"triggerNames" : @"TriggerNames",
             };
}

@end

@implementation AWSGlueListWorkflowsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSGlueListWorkflowsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"workflows" : @"Workflows",
             };
}

@end

@implementation AWSGlueLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dynamoDB" : @"DynamoDB",
             @"jdbc" : @"Jdbc",
             @"s3" : @"S3",
             };
}

+ (NSValueTransformer *)dynamoDBJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCodeGenNodeArg class]];
}

+ (NSValueTransformer *)jdbcJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCodeGenNodeArg class]];
}

+ (NSValueTransformer *)s3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCodeGenNodeArg class]];
}

@end

@implementation AWSGlueMLTransform

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueEvaluationMetrics class]];
}

+ (NSValueTransformer *)inputRecordTablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueGlueTable class]];
}

+ (NSValueTransformer *)lastModifiedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTransformParameters class]];
}

+ (NSValueTransformer *)schemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueSchemaColumn class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_READY"] == NSOrderedSame) {
            return @(AWSGlueTransformStatusTypeNotReady);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSGlueTransformStatusTypeReady);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSGlueTransformStatusTypeDeleting);
        }
        return @(AWSGlueTransformStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTransformStatusTypeNotReady:
                return @"NOT_READY";
            case AWSGlueTransformStatusTypeReady:
                return @"READY";
            case AWSGlueTransformStatusTypeDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG2x);
        }
        return @(AWSGlueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueWorkerTypeStandard:
                return @"Standard";
            case AWSGlueWorkerTypeG1x:
                return @"G.1X";
            case AWSGlueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueMappingEntry

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

@implementation AWSGlueNode

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCrawlerNodeDetails class]];
}

+ (NSValueTransformer *)jobDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueJobNodeDetails class]];
}

+ (NSValueTransformer *)triggerDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTriggerNodeDetails class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CRAWLER"] == NSOrderedSame) {
            return @(AWSGlueNodeTypeCrawler);
        }
        if ([value caseInsensitiveCompare:@"JOB"] == NSOrderedSame) {
            return @(AWSGlueNodeTypeJob);
        }
        if ([value caseInsensitiveCompare:@"TRIGGER"] == NSOrderedSame) {
            return @(AWSGlueNodeTypeTrigger);
        }
        return @(AWSGlueNodeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueNodeTypeCrawler:
                return @"CRAWLER";
            case AWSGlueNodeTypeJob:
                return @"JOB";
            case AWSGlueNodeTypeTrigger:
                return @"TRIGGER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueNotificationProperty

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notifyDelayAfter" : @"NotifyDelayAfter",
             };
}

@end

@implementation AWSGlueOrder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"column" : @"Column",
             @"sortOrder" : @"SortOrder",
             };
}

@end

@implementation AWSGluePartition

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueStorageDescriptor class]];
}

@end

@implementation AWSGluePartitionError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorDetail" : @"ErrorDetail",
             @"partitionValues" : @"PartitionValues",
             };
}

+ (NSValueTransformer *)errorDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueErrorDetail class]];
}

@end

@implementation AWSGluePartitionInput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueStorageDescriptor class]];
}

@end

@implementation AWSGluePartitionValueList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"values" : @"Values",
             };
}

@end

@implementation AWSGluePhysicalConnectionRequirements

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"securityGroupIdList" : @"SecurityGroupIdList",
             @"subnetId" : @"SubnetId",
             };
}

@end

@implementation AWSGluePredecessor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSGluePredicate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditions" : @"Conditions",
             @"logical" : @"Logical",
             };
}

+ (NSValueTransformer *)conditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueCondition class]];
}

+ (NSValueTransformer *)logicalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AND"] == NSOrderedSame) {
            return @(AWSGlueLogicalAnd);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSGlueLogicalAny);
        }
        return @(AWSGlueLogicalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueLogicalAnd:
                return @"AND";
            case AWSGlueLogicalAny:
                return @"ANY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGluePrincipalPermissions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"permissions" : @"Permissions",
             @"principal" : @"Principal",
             };
}

+ (NSValueTransformer *)principalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueDataLakePrincipal class]];
}

@end

@implementation AWSGluePropertyPredicate

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
            return @(AWSGlueComparatorEquals);
        }
        if ([value caseInsensitiveCompare:@"GREATER_THAN"] == NSOrderedSame) {
            return @(AWSGlueComparatorGreaterThan);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN"] == NSOrderedSame) {
            return @(AWSGlueComparatorLessThan);
        }
        if ([value caseInsensitiveCompare:@"GREATER_THAN_EQUALS"] == NSOrderedSame) {
            return @(AWSGlueComparatorGreaterThanEquals);
        }
        if ([value caseInsensitiveCompare:@"LESS_THAN_EQUALS"] == NSOrderedSame) {
            return @(AWSGlueComparatorLessThanEquals);
        }
        return @(AWSGlueComparatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueComparatorEquals:
                return @"EQUALS";
            case AWSGlueComparatorGreaterThan:
                return @"GREATER_THAN";
            case AWSGlueComparatorLessThan:
                return @"LESS_THAN";
            case AWSGlueComparatorGreaterThanEquals:
                return @"GREATER_THAN_EQUALS";
            case AWSGlueComparatorLessThanEquals:
                return @"LESS_THAN_EQUALS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGluePutDataCatalogEncryptionSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"dataCatalogEncryptionSettings" : @"DataCatalogEncryptionSettings",
             };
}

+ (NSValueTransformer *)dataCatalogEncryptionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueDataCatalogEncryptionSettings class]];
}

@end

@implementation AWSGluePutDataCatalogEncryptionSettingsResponse

@end

@implementation AWSGluePutResourcePolicyRequest

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
            return @(AWSGlueExistConditionMustExist);
        }
        if ([value caseInsensitiveCompare:@"NOT_EXIST"] == NSOrderedSame) {
            return @(AWSGlueExistConditionNotExist);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSGlueExistConditionNone);
        }
        return @(AWSGlueExistConditionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueExistConditionMustExist:
                return @"MUST_EXIST";
            case AWSGlueExistConditionNotExist:
                return @"NOT_EXIST";
            case AWSGlueExistConditionNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGluePutResourcePolicyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyHash" : @"PolicyHash",
             };
}

@end

@implementation AWSGluePutWorkflowRunPropertiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"runId" : @"RunId",
             @"runProperties" : @"RunProperties",
             };
}

@end

@implementation AWSGluePutWorkflowRunPropertiesResponse

@end

@implementation AWSGlueResetJobBookmarkRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSGlueResetJobBookmarkResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobBookmarkEntry" : @"JobBookmarkEntry",
             };
}

+ (NSValueTransformer *)jobBookmarkEntryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueJobBookmarkEntry class]];
}

@end

@implementation AWSGlueResourceUri

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceType" : @"ResourceType",
             @"uri" : @"Uri",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JAR"] == NSOrderedSame) {
            return @(AWSGlueResourceTypeJar);
        }
        if ([value caseInsensitiveCompare:@"FILE"] == NSOrderedSame) {
            return @(AWSGlueResourceTypeFile);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVE"] == NSOrderedSame) {
            return @(AWSGlueResourceTypeArchive);
        }
        return @(AWSGlueResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueResourceTypeJar:
                return @"JAR";
            case AWSGlueResourceTypeFile:
                return @"FILE";
            case AWSGlueResourceTypeArchive:
                return @"ARCHIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueS3Encryption

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyArn" : @"KmsKeyArn",
             @"s3EncryptionMode" : @"S3EncryptionMode",
             };
}

+ (NSValueTransformer *)s3EncryptionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSGlueS3EncryptionModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"SSE-KMS"] == NSOrderedSame) {
            return @(AWSGlueS3EncryptionModeSseKms);
        }
        if ([value caseInsensitiveCompare:@"SSE-S3"] == NSOrderedSame) {
            return @(AWSGlueS3EncryptionModeSseS3);
        }
        return @(AWSGlueS3EncryptionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueS3EncryptionModeDisabled:
                return @"DISABLED";
            case AWSGlueS3EncryptionModeSseKms:
                return @"SSE-KMS";
            case AWSGlueS3EncryptionModeSseS3:
                return @"SSE-S3";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueS3Target

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusions" : @"Exclusions",
             @"path" : @"Path",
             };
}

@end

@implementation AWSGlueSchedule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleExpression" : @"ScheduleExpression",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SCHEDULED"] == NSOrderedSame) {
            return @(AWSGlueScheduleStateScheduled);
        }
        if ([value caseInsensitiveCompare:@"NOT_SCHEDULED"] == NSOrderedSame) {
            return @(AWSGlueScheduleStateNotScheduled);
        }
        if ([value caseInsensitiveCompare:@"TRANSITIONING"] == NSOrderedSame) {
            return @(AWSGlueScheduleStateTransitioning);
        }
        return @(AWSGlueScheduleStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueScheduleStateScheduled:
                return @"SCHEDULED";
            case AWSGlueScheduleStateNotScheduled:
                return @"NOT_SCHEDULED";
            case AWSGlueScheduleStateTransitioning:
                return @"TRANSITIONING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueSchemaChangePolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteBehavior" : @"DeleteBehavior",
             @"updateBehavior" : @"UpdateBehavior",
             };
}

+ (NSValueTransformer *)deleteBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LOG"] == NSOrderedSame) {
            return @(AWSGlueDeleteBehaviorLog);
        }
        if ([value caseInsensitiveCompare:@"DELETE_FROM_DATABASE"] == NSOrderedSame) {
            return @(AWSGlueDeleteBehaviorDeleteFromDatabase);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATE_IN_DATABASE"] == NSOrderedSame) {
            return @(AWSGlueDeleteBehaviorDeprecateInDatabase);
        }
        return @(AWSGlueDeleteBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueDeleteBehaviorLog:
                return @"LOG";
            case AWSGlueDeleteBehaviorDeleteFromDatabase:
                return @"DELETE_FROM_DATABASE";
            case AWSGlueDeleteBehaviorDeprecateInDatabase:
                return @"DEPRECATE_IN_DATABASE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updateBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LOG"] == NSOrderedSame) {
            return @(AWSGlueUpdateBehaviorLog);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_IN_DATABASE"] == NSOrderedSame) {
            return @(AWSGlueUpdateBehaviorUpdateInDatabase);
        }
        return @(AWSGlueUpdateBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueUpdateBehaviorLog:
                return @"LOG";
            case AWSGlueUpdateBehaviorUpdateInDatabase:
                return @"UPDATE_IN_DATABASE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueSchemaColumn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataType" : @"DataType",
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueSearchTablesRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGluePropertyPredicate class]];
}

+ (NSValueTransformer *)sortCriteriaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueSortCriterion class]];
}

@end

@implementation AWSGlueSearchTablesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tableList" : @"TableList",
             };
}

+ (NSValueTransformer *)tableListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueTable class]];
}

@end

@implementation AWSGlueSecurityConfiguration

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueEncryptionConfiguration class]];
}

@end

@implementation AWSGlueSegment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentNumber" : @"SegmentNumber",
             @"totalSegments" : @"TotalSegments",
             };
}

@end

@implementation AWSGlueSerDeInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"parameters" : @"Parameters",
             @"serializationLibrary" : @"SerializationLibrary",
             };
}

@end

@implementation AWSGlueSkewedInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"skewedColumnNames" : @"SkewedColumnNames",
             @"skewedColumnValueLocationMaps" : @"SkewedColumnValueLocationMaps",
             @"skewedColumnValues" : @"SkewedColumnValues",
             };
}

@end

@implementation AWSGlueSortCriterion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fieldName" : @"FieldName",
             @"sort" : @"Sort",
             };
}

+ (NSValueTransformer *)sortJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASC"] == NSOrderedSame) {
            return @(AWSGlueSortAsc);
        }
        if ([value caseInsensitiveCompare:@"DESC"] == NSOrderedSame) {
            return @(AWSGlueSortDesc);
        }
        return @(AWSGlueSortUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueSortAsc:
                return @"ASC";
            case AWSGlueSortDesc:
                return @"DESC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueStartCrawlerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueStartCrawlerResponse

@end

@implementation AWSGlueStartCrawlerScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerName" : @"CrawlerName",
             };
}

@end

@implementation AWSGlueStartCrawlerScheduleResponse

@end

@implementation AWSGlueStartExportLabelsTaskRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputS3Path" : @"OutputS3Path",
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSGlueStartExportLabelsTaskRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskRunId" : @"TaskRunId",
             };
}

@end

@implementation AWSGlueStartImportLabelsTaskRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputS3Path" : @"InputS3Path",
             @"replaceAllLabels" : @"ReplaceAllLabels",
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSGlueStartImportLabelsTaskRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskRunId" : @"TaskRunId",
             };
}

@end

@implementation AWSGlueStartJobRunRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueNotificationProperty class]];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG2x);
        }
        return @(AWSGlueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueWorkerTypeStandard:
                return @"Standard";
            case AWSGlueWorkerTypeG1x:
                return @"G.1X";
            case AWSGlueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueStartJobRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobRunId" : @"JobRunId",
             };
}

@end

@implementation AWSGlueStartMLEvaluationTaskRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSGlueStartMLEvaluationTaskRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskRunId" : @"TaskRunId",
             };
}

@end

@implementation AWSGlueStartMLLabelingSetGenerationTaskRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputS3Path" : @"OutputS3Path",
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSGlueStartMLLabelingSetGenerationTaskRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskRunId" : @"TaskRunId",
             };
}

@end

@implementation AWSGlueStartTriggerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueStartTriggerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueStartWorkflowRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueStartWorkflowRunResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSGlueStopCrawlerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueStopCrawlerResponse

@end

@implementation AWSGlueStopCrawlerScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerName" : @"CrawlerName",
             };
}

@end

@implementation AWSGlueStopCrawlerScheduleResponse

@end

@implementation AWSGlueStopTriggerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueStopTriggerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueStopWorkflowRunRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"runId" : @"RunId",
             };
}

@end

@implementation AWSGlueStopWorkflowRunResponse

@end

@implementation AWSGlueStorageDescriptor

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueColumn class]];
}

+ (NSValueTransformer *)serdeInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueSerDeInfo class]];
}

+ (NSValueTransformer *)skewedInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueSkewedInfo class]];
}

+ (NSValueTransformer *)sortColumnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueOrder class]];
}

@end

@implementation AWSGlueTable

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueColumn class]];
}

+ (NSValueTransformer *)storageDescriptorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueStorageDescriptor class]];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSGlueTableError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorDetail" : @"ErrorDetail",
             @"tableName" : @"TableName",
             };
}

+ (NSValueTransformer *)errorDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueErrorDetail class]];
}

@end

@implementation AWSGlueTableInput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueColumn class]];
}

+ (NSValueTransformer *)storageDescriptorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueStorageDescriptor class]];
}

@end

@implementation AWSGlueTableVersion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"table" : @"Table",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)tableJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTable class]];
}

@end

@implementation AWSGlueTableVersionError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorDetail" : @"ErrorDetail",
             @"tableName" : @"TableName",
             @"versionId" : @"VersionId",
             };
}

+ (NSValueTransformer *)errorDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueErrorDetail class]];
}

@end

@implementation AWSGlueTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagsToAdd" : @"TagsToAdd",
             };
}

@end

@implementation AWSGlueTagResourceResponse

@end

@implementation AWSGlueTaskRun

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTaskRunProperties class]];
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
            return @(AWSGlueTaskStatusTypeStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeStopped);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeTimeout);
        }
        return @(AWSGlueTaskStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTaskStatusTypeStarting:
                return @"STARTING";
            case AWSGlueTaskStatusTypeRunning:
                return @"RUNNING";
            case AWSGlueTaskStatusTypeStopping:
                return @"STOPPING";
            case AWSGlueTaskStatusTypeStopped:
                return @"STOPPED";
            case AWSGlueTaskStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSGlueTaskStatusTypeFailed:
                return @"FAILED";
            case AWSGlueTaskStatusTypeTimeout:
                return @"TIMEOUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueTaskRunFilterCriteria

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
            return @(AWSGlueTaskStatusTypeStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeRunning);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeStopped);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSGlueTaskStatusTypeTimeout);
        }
        return @(AWSGlueTaskStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTaskStatusTypeStarting:
                return @"STARTING";
            case AWSGlueTaskStatusTypeRunning:
                return @"RUNNING";
            case AWSGlueTaskStatusTypeStopping:
                return @"STOPPING";
            case AWSGlueTaskStatusTypeStopped:
                return @"STOPPED";
            case AWSGlueTaskStatusTypeSucceeded:
                return @"SUCCEEDED";
            case AWSGlueTaskStatusTypeFailed:
                return @"FAILED";
            case AWSGlueTaskStatusTypeTimeout:
                return @"TIMEOUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskRunTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EVALUATION"] == NSOrderedSame) {
            return @(AWSGlueTaskTypeEvaluation);
        }
        if ([value caseInsensitiveCompare:@"LABELING_SET_GENERATION"] == NSOrderedSame) {
            return @(AWSGlueTaskTypeLabelingSetGeneration);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_LABELS"] == NSOrderedSame) {
            return @(AWSGlueTaskTypeImportLabels);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_LABELS"] == NSOrderedSame) {
            return @(AWSGlueTaskTypeExportLabels);
        }
        if ([value caseInsensitiveCompare:@"FIND_MATCHES"] == NSOrderedSame) {
            return @(AWSGlueTaskTypeFindMatches);
        }
        return @(AWSGlueTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTaskTypeEvaluation:
                return @"EVALUATION";
            case AWSGlueTaskTypeLabelingSetGeneration:
                return @"LABELING_SET_GENERATION";
            case AWSGlueTaskTypeImportLabels:
                return @"IMPORT_LABELS";
            case AWSGlueTaskTypeExportLabels:
                return @"EXPORT_LABELS";
            case AWSGlueTaskTypeFindMatches:
                return @"FIND_MATCHES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueTaskRunProperties

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueExportLabelsTaskRunProperties class]];
}

+ (NSValueTransformer *)findMatchesTaskRunPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueFindMatchesTaskRunProperties class]];
}

+ (NSValueTransformer *)importLabelsTaskRunPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueImportLabelsTaskRunProperties class]];
}

+ (NSValueTransformer *)labelingSetGenerationTaskRunPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueLabelingSetGenerationTaskRunProperties class]];
}

+ (NSValueTransformer *)taskTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EVALUATION"] == NSOrderedSame) {
            return @(AWSGlueTaskTypeEvaluation);
        }
        if ([value caseInsensitiveCompare:@"LABELING_SET_GENERATION"] == NSOrderedSame) {
            return @(AWSGlueTaskTypeLabelingSetGeneration);
        }
        if ([value caseInsensitiveCompare:@"IMPORT_LABELS"] == NSOrderedSame) {
            return @(AWSGlueTaskTypeImportLabels);
        }
        if ([value caseInsensitiveCompare:@"EXPORT_LABELS"] == NSOrderedSame) {
            return @(AWSGlueTaskTypeExportLabels);
        }
        if ([value caseInsensitiveCompare:@"FIND_MATCHES"] == NSOrderedSame) {
            return @(AWSGlueTaskTypeFindMatches);
        }
        return @(AWSGlueTaskTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTaskTypeEvaluation:
                return @"EVALUATION";
            case AWSGlueTaskTypeLabelingSetGeneration:
                return @"LABELING_SET_GENERATION";
            case AWSGlueTaskTypeImportLabels:
                return @"IMPORT_LABELS";
            case AWSGlueTaskTypeExportLabels:
                return @"EXPORT_LABELS";
            case AWSGlueTaskTypeFindMatches:
                return @"FIND_MATCHES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueTaskRunSortCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"column" : @"Column",
             @"sortDirection" : @"SortDirection",
             };
}

+ (NSValueTransformer *)columnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TASK_RUN_TYPE"] == NSOrderedSame) {
            return @(AWSGlueTaskRunSortColumnTypeTaskRunType);
        }
        if ([value caseInsensitiveCompare:@"STATUS"] == NSOrderedSame) {
            return @(AWSGlueTaskRunSortColumnTypeStatus);
        }
        if ([value caseInsensitiveCompare:@"STARTED"] == NSOrderedSame) {
            return @(AWSGlueTaskRunSortColumnTypeStarted);
        }
        return @(AWSGlueTaskRunSortColumnTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTaskRunSortColumnTypeTaskRunType:
                return @"TASK_RUN_TYPE";
            case AWSGlueTaskRunSortColumnTypeStatus:
                return @"STATUS";
            case AWSGlueTaskRunSortColumnTypeStarted:
                return @"STARTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortDirectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSGlueSortDirectionTypeDescending);
        }
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSGlueSortDirectionTypeAscending);
        }
        return @(AWSGlueSortDirectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueSortDirectionTypeDescending:
                return @"DESCENDING";
            case AWSGlueSortDirectionTypeAscending:
                return @"ASCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueTransformFilterCriteria

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueSchemaColumn class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_READY"] == NSOrderedSame) {
            return @(AWSGlueTransformStatusTypeNotReady);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSGlueTransformStatusTypeReady);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSGlueTransformStatusTypeDeleting);
        }
        return @(AWSGlueTransformStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTransformStatusTypeNotReady:
                return @"NOT_READY";
            case AWSGlueTransformStatusTypeReady:
                return @"READY";
            case AWSGlueTransformStatusTypeDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transformTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIND_MATCHES"] == NSOrderedSame) {
            return @(AWSGlueTransformTypeFindMatches);
        }
        return @(AWSGlueTransformTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTransformTypeFindMatches:
                return @"FIND_MATCHES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueTransformParameters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"findMatchesParameters" : @"FindMatchesParameters",
             @"transformType" : @"TransformType",
             };
}

+ (NSValueTransformer *)findMatchesParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueFindMatchesParameters class]];
}

+ (NSValueTransformer *)transformTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIND_MATCHES"] == NSOrderedSame) {
            return @(AWSGlueTransformTypeFindMatches);
        }
        return @(AWSGlueTransformTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTransformTypeFindMatches:
                return @"FIND_MATCHES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueTransformSortCriteria

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"column" : @"Column",
             @"sortDirection" : @"SortDirection",
             };
}

+ (NSValueTransformer *)columnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSGlueTransformSortColumnTypeName);
        }
        if ([value caseInsensitiveCompare:@"TRANSFORM_TYPE"] == NSOrderedSame) {
            return @(AWSGlueTransformSortColumnTypeTransformType);
        }
        if ([value caseInsensitiveCompare:@"STATUS"] == NSOrderedSame) {
            return @(AWSGlueTransformSortColumnTypeStatus);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSGlueTransformSortColumnTypeCreated);
        }
        if ([value caseInsensitiveCompare:@"LAST_MODIFIED"] == NSOrderedSame) {
            return @(AWSGlueTransformSortColumnTypeLastModified);
        }
        return @(AWSGlueTransformSortColumnTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTransformSortColumnTypeName:
                return @"NAME";
            case AWSGlueTransformSortColumnTypeTransformType:
                return @"TRANSFORM_TYPE";
            case AWSGlueTransformSortColumnTypeStatus:
                return @"STATUS";
            case AWSGlueTransformSortColumnTypeCreated:
                return @"CREATED";
            case AWSGlueTransformSortColumnTypeLastModified:
                return @"LAST_MODIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortDirectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSGlueSortDirectionTypeDescending);
        }
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSGlueSortDirectionTypeAscending);
        }
        return @(AWSGlueSortDirectionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueSortDirectionTypeDescending:
                return @"DESCENDING";
            case AWSGlueSortDirectionTypeAscending:
                return @"ASCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueTrigger

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueAction class]];
}

+ (NSValueTransformer *)predicateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGluePredicate class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSGlueTriggerStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSGlueTriggerStateCreated);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATING"] == NSOrderedSame) {
            return @(AWSGlueTriggerStateActivating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVATED"] == NSOrderedSame) {
            return @(AWSGlueTriggerStateActivated);
        }
        if ([value caseInsensitiveCompare:@"DEACTIVATING"] == NSOrderedSame) {
            return @(AWSGlueTriggerStateDeactivating);
        }
        if ([value caseInsensitiveCompare:@"DEACTIVATED"] == NSOrderedSame) {
            return @(AWSGlueTriggerStateDeactivated);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSGlueTriggerStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSGlueTriggerStateUpdating);
        }
        return @(AWSGlueTriggerStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTriggerStateCreating:
                return @"CREATING";
            case AWSGlueTriggerStateCreated:
                return @"CREATED";
            case AWSGlueTriggerStateActivating:
                return @"ACTIVATING";
            case AWSGlueTriggerStateActivated:
                return @"ACTIVATED";
            case AWSGlueTriggerStateDeactivating:
                return @"DEACTIVATING";
            case AWSGlueTriggerStateDeactivated:
                return @"DEACTIVATED";
            case AWSGlueTriggerStateDeleting:
                return @"DELETING";
            case AWSGlueTriggerStateUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SCHEDULED"] == NSOrderedSame) {
            return @(AWSGlueTriggerTypeScheduled);
        }
        if ([value caseInsensitiveCompare:@"CONDITIONAL"] == NSOrderedSame) {
            return @(AWSGlueTriggerTypeConditional);
        }
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSGlueTriggerTypeOnDemand);
        }
        return @(AWSGlueTriggerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueTriggerTypeScheduled:
                return @"SCHEDULED";
            case AWSGlueTriggerTypeConditional:
                return @"CONDITIONAL";
            case AWSGlueTriggerTypeOnDemand:
                return @"ON_DEMAND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueTriggerNodeDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trigger" : @"Trigger",
             };
}

+ (NSValueTransformer *)triggerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTrigger class]];
}

@end

@implementation AWSGlueTriggerUpdate

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueAction class]];
}

+ (NSValueTransformer *)predicateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGluePredicate class]];
}

@end

@implementation AWSGlueUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagsToRemove" : @"TagsToRemove",
             };
}

@end

@implementation AWSGlueUntagResourceResponse

@end

@implementation AWSGlueUpdateClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"csvClassifier" : @"CsvClassifier",
             @"grokClassifier" : @"GrokClassifier",
             @"jsonClassifier" : @"JsonClassifier",
             @"XMLClassifier" : @"XMLClassifier",
             };
}

+ (NSValueTransformer *)csvClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueUpdateCsvClassifierRequest class]];
}

+ (NSValueTransformer *)grokClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueUpdateGrokClassifierRequest class]];
}

+ (NSValueTransformer *)jsonClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueUpdateJsonClassifierRequest class]];
}

+ (NSValueTransformer *)XMLClassifierJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueUpdateXMLClassifierRequest class]];
}

@end

@implementation AWSGlueUpdateClassifierResponse

@end

@implementation AWSGlueUpdateConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"connectionInput" : @"ConnectionInput",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)connectionInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueConnectionInput class]];
}

@end

@implementation AWSGlueUpdateConnectionResponse

@end

@implementation AWSGlueUpdateCrawlerRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueSchemaChangePolicy class]];
}

+ (NSValueTransformer *)targetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueCrawlerTargets class]];
}

@end

@implementation AWSGlueUpdateCrawlerResponse

@end

@implementation AWSGlueUpdateCrawlerScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"crawlerName" : @"CrawlerName",
             @"schedule" : @"Schedule",
             };
}

@end

@implementation AWSGlueUpdateCrawlerScheduleResponse

@end

@implementation AWSGlueUpdateCsvClassifierRequest

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
            return @(AWSGlueCsvHeaderOptionUnknown);
        }
        if ([value caseInsensitiveCompare:@"PRESENT"] == NSOrderedSame) {
            return @(AWSGlueCsvHeaderOptionPresent);
        }
        if ([value caseInsensitiveCompare:@"ABSENT"] == NSOrderedSame) {
            return @(AWSGlueCsvHeaderOptionAbsent);
        }
        return @(AWSGlueCsvHeaderOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueCsvHeaderOptionUnknown:
                return @"UNKNOWN";
            case AWSGlueCsvHeaderOptionPresent:
                return @"PRESENT";
            case AWSGlueCsvHeaderOptionAbsent:
                return @"ABSENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueUpdateDatabaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseInput" : @"DatabaseInput",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)databaseInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueDatabaseInput class]];
}

@end

@implementation AWSGlueUpdateDatabaseResponse

@end

@implementation AWSGlueUpdateDevEndpointRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueDevEndpointCustomLibraries class]];
}

@end

@implementation AWSGlueUpdateDevEndpointResponse

@end

@implementation AWSGlueUpdateGrokClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"customPatterns" : @"CustomPatterns",
             @"grokPattern" : @"GrokPattern",
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueUpdateJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobUpdate" : @"JobUpdate",
             };
}

+ (NSValueTransformer *)jobUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueJobUpdate class]];
}

@end

@implementation AWSGlueUpdateJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             };
}

@end

@implementation AWSGlueUpdateJsonClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jsonPath" : @"JsonPath",
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueUpdateMLTransformRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTransformParameters class]];
}

+ (NSValueTransformer *)workerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Standard"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"G.1X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG1x);
        }
        if ([value caseInsensitiveCompare:@"G.2X"] == NSOrderedSame) {
            return @(AWSGlueWorkerTypeG2x);
        }
        return @(AWSGlueWorkerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueWorkerTypeStandard:
                return @"Standard";
            case AWSGlueWorkerTypeG1x:
                return @"G.1X";
            case AWSGlueWorkerTypeG2x:
                return @"G.2X";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueUpdateMLTransformResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transformId" : @"TransformId",
             };
}

@end

@implementation AWSGlueUpdatePartitionRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGluePartitionInput class]];
}

@end

@implementation AWSGlueUpdatePartitionResponse

@end

@implementation AWSGlueUpdateTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"skipArchive" : @"SkipArchive",
             @"tableInput" : @"TableInput",
             };
}

+ (NSValueTransformer *)tableInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTableInput class]];
}

@end

@implementation AWSGlueUpdateTableResponse

@end

@implementation AWSGlueUpdateTriggerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"triggerUpdate" : @"TriggerUpdate",
             };
}

+ (NSValueTransformer *)triggerUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTriggerUpdate class]];
}

@end

@implementation AWSGlueUpdateTriggerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trigger" : @"Trigger",
             };
}

+ (NSValueTransformer *)triggerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueTrigger class]];
}

@end

@implementation AWSGlueUpdateUserDefinedFunctionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"catalogId" : @"CatalogId",
             @"databaseName" : @"DatabaseName",
             @"functionInput" : @"FunctionInput",
             @"functionName" : @"FunctionName",
             };
}

+ (NSValueTransformer *)functionInputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueUserDefinedFunctionInput class]];
}

@end

@implementation AWSGlueUpdateUserDefinedFunctionResponse

@end

@implementation AWSGlueUpdateWorkflowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultRunProperties" : @"DefaultRunProperties",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueUpdateWorkflowResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSGlueUpdateXMLClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classification" : @"Classification",
             @"name" : @"Name",
             @"rowTag" : @"RowTag",
             };
}

@end

@implementation AWSGlueUserDefinedFunction

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
            return @(AWSGluePrincipalTypeUser);
        }
        if ([value caseInsensitiveCompare:@"ROLE"] == NSOrderedSame) {
            return @(AWSGluePrincipalTypeRole);
        }
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSGluePrincipalTypeGroup);
        }
        return @(AWSGluePrincipalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGluePrincipalTypeUser:
                return @"USER";
            case AWSGluePrincipalTypeRole:
                return @"ROLE";
            case AWSGluePrincipalTypeGroup:
                return @"GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceUrisJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueResourceUri class]];
}

@end

@implementation AWSGlueUserDefinedFunctionInput

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
            return @(AWSGluePrincipalTypeUser);
        }
        if ([value caseInsensitiveCompare:@"ROLE"] == NSOrderedSame) {
            return @(AWSGluePrincipalTypeRole);
        }
        if ([value caseInsensitiveCompare:@"GROUP"] == NSOrderedSame) {
            return @(AWSGluePrincipalTypeGroup);
        }
        return @(AWSGluePrincipalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGluePrincipalTypeUser:
                return @"USER";
            case AWSGluePrincipalTypeRole:
                return @"ROLE";
            case AWSGluePrincipalTypeGroup:
                return @"GROUP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceUrisJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueResourceUri class]];
}

@end

@implementation AWSGlueWorkflow

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueWorkflowGraph class]];
}

+ (NSValueTransformer *)lastModifiedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastRunJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueWorkflowRun class]];
}

@end

@implementation AWSGlueWorkflowGraph

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"edges" : @"Edges",
             @"nodes" : @"Nodes",
             };
}

+ (NSValueTransformer *)edgesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueEdge class]];
}

+ (NSValueTransformer *)nodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSGlueNode class]];
}

@end

@implementation AWSGlueWorkflowRun

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueWorkflowGraph class]];
}

+ (NSValueTransformer *)startedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSGlueWorkflowRunStatistics class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSGlueWorkflowRunStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSGlueWorkflowRunStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSGlueWorkflowRunStatusStopping);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSGlueWorkflowRunStatusStopped);
        }
        return @(AWSGlueWorkflowRunStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSGlueWorkflowRunStatusRunning:
                return @"RUNNING";
            case AWSGlueWorkflowRunStatusCompleted:
                return @"COMPLETED";
            case AWSGlueWorkflowRunStatusStopping:
                return @"STOPPING";
            case AWSGlueWorkflowRunStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSGlueWorkflowRunStatistics

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

@implementation AWSGlueXMLClassifier

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
