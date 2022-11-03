//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSLogsModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSLogsErrorDomain = @"com.amazonaws.AWSLogsErrorDomain";

@implementation AWSLogsAssociateKmsKeyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"kmsKeyId",
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsCancelExportTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSLogsCreateExportTaskRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"destination",
             @"destinationPrefix" : @"destinationPrefix",
             @"from" : @"from",
             @"logGroupName" : @"logGroupName",
             @"logStreamNamePrefix" : @"logStreamNamePrefix",
             @"taskName" : @"taskName",
             @"to" : @"to",
             };
}

@end

@implementation AWSLogsCreateExportTaskResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSLogsCreateLogGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"kmsKeyId",
             @"logGroupName" : @"logGroupName",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsCreateLogStreamRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"logStreamName" : @"logStreamName",
             };
}

@end

@implementation AWSLogsDeleteDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationName" : @"destinationName",
             };
}

@end

@implementation AWSLogsDeleteLogGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsDeleteLogStreamRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"logStreamName" : @"logStreamName",
             };
}

@end

@implementation AWSLogsDeleteMetricFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterName" : @"filterName",
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsDeleteQueryDefinitionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryDefinitionId" : @"queryDefinitionId",
             };
}

@end

@implementation AWSLogsDeleteQueryDefinitionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"success" : @"success",
             };
}

@end

@implementation AWSLogsDeleteResourcePolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSLogsDeleteRetentionPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsDeleteSubscriptionFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterName" : @"filterName",
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsDescribeDestinationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationNamePrefix" : @"DestinationNamePrefix",
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeDestinationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"destinations",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsDestination class]];
}

@end

@implementation AWSLogsDescribeExportTasksRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             @"statusCode" : @"statusCode",
             @"taskId" : @"taskId",
             };
}

+ (NSValueTransformer *)statusCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeCancelled);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeFailed);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodePending);
        }
        if ([value caseInsensitiveCompare:@"PENDING_CANCEL"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodePendingCancel);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeRunning);
        }
        return @(AWSLogsExportTaskStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsExportTaskStatusCodeCancelled:
                return @"CANCELLED";
            case AWSLogsExportTaskStatusCodeCompleted:
                return @"COMPLETED";
            case AWSLogsExportTaskStatusCodeFailed:
                return @"FAILED";
            case AWSLogsExportTaskStatusCodePending:
                return @"PENDING";
            case AWSLogsExportTaskStatusCodePendingCancel:
                return @"PENDING_CANCEL";
            case AWSLogsExportTaskStatusCodeRunning:
                return @"RUNNING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsDescribeExportTasksResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportTasks" : @"exportTasks",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)exportTasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsExportTask class]];
}

@end

@implementation AWSLogsDescribeLogGroupsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"logGroupNamePrefix" : @"logGroupNamePrefix",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeLogGroupsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroups" : @"logGroups",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)logGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsLogGroup class]];
}

@end

@implementation AWSLogsDescribeLogStreamsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"descending" : @"descending",
             @"limit" : @"limit",
             @"logGroupName" : @"logGroupName",
             @"logStreamNamePrefix" : @"logStreamNamePrefix",
             @"nextToken" : @"nextToken",
             @"orderBy" : @"orderBy",
             };
}

+ (NSValueTransformer *)orderByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LogStreamName"] == NSOrderedSame) {
            return @(AWSLogsOrderByLogStreamName);
        }
        if ([value caseInsensitiveCompare:@"LastEventTime"] == NSOrderedSame) {
            return @(AWSLogsOrderByLastEventTime);
        }
        return @(AWSLogsOrderByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsOrderByLogStreamName:
                return @"LogStreamName";
            case AWSLogsOrderByLastEventTime:
                return @"LastEventTime";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsDescribeLogStreamsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logStreams" : @"logStreams",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)logStreamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsLogStream class]];
}

@end

@implementation AWSLogsDescribeMetricFiltersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterNamePrefix" : @"filterNamePrefix",
             @"limit" : @"limit",
             @"logGroupName" : @"logGroupName",
             @"metricName" : @"metricName",
             @"metricNamespace" : @"metricNamespace",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeMetricFiltersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"metricFilters" : @"metricFilters",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)metricFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsMetricFilter class]];
}

@end

@implementation AWSLogsDescribeQueriesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Running"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Timeout"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusTimeout);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusUnknown);
        }
        return @(AWSLogsQueryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsQueryStatusScheduled:
                return @"Scheduled";
            case AWSLogsQueryStatusRunning:
                return @"Running";
            case AWSLogsQueryStatusComplete:
                return @"Complete";
            case AWSLogsQueryStatusFailed:
                return @"Failed";
            case AWSLogsQueryStatusCancelled:
                return @"Cancelled";
            case AWSLogsQueryStatusTimeout:
                return @"Timeout";
            case AWSLogsQueryStatusUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsDescribeQueriesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"queries" : @"queries",
             };
}

+ (NSValueTransformer *)queriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsQueryInfo class]];
}

@end

@implementation AWSLogsDescribeQueryDefinitionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"queryDefinitionNamePrefix" : @"queryDefinitionNamePrefix",
             };
}

@end

@implementation AWSLogsDescribeQueryDefinitionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"queryDefinitions" : @"queryDefinitions",
             };
}

+ (NSValueTransformer *)queryDefinitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsQueryDefinition class]];
}

@end

@implementation AWSLogsDescribeResourcePoliciesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeResourcePoliciesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"resourcePolicies" : @"resourcePolicies",
             };
}

+ (NSValueTransformer *)resourcePoliciesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsResourcePolicy class]];
}

@end

@implementation AWSLogsDescribeSubscriptionFiltersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterNamePrefix" : @"filterNamePrefix",
             @"limit" : @"limit",
             @"logGroupName" : @"logGroupName",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeSubscriptionFiltersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"subscriptionFilters" : @"subscriptionFilters",
             };
}

+ (NSValueTransformer *)subscriptionFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsSubscriptionFilter class]];
}

@end

@implementation AWSLogsDestination

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicy" : @"accessPolicy",
             @"arn" : @"arn",
             @"creationTime" : @"creationTime",
             @"destinationName" : @"destinationName",
             @"roleArn" : @"roleArn",
             @"targetArn" : @"targetArn",
             };
}

@end

@implementation AWSLogsDisassociateKmsKeyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsExportTask

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"destination",
             @"destinationPrefix" : @"destinationPrefix",
             @"executionInfo" : @"executionInfo",
             @"from" : @"from",
             @"logGroupName" : @"logGroupName",
             @"status" : @"status",
             @"taskId" : @"taskId",
             @"taskName" : @"taskName",
             @"to" : @"to",
             };
}

+ (NSValueTransformer *)executionInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsExportTaskExecutionInfo class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsExportTaskStatus class]];
}

@end

@implementation AWSLogsExportTaskExecutionInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionTime" : @"completionTime",
             @"creationTime" : @"creationTime",
             };
}

@end

@implementation AWSLogsExportTaskStatus

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"code",
             @"message" : @"message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeCancelled);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeFailed);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodePending);
        }
        if ([value caseInsensitiveCompare:@"PENDING_CANCEL"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodePendingCancel);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSLogsExportTaskStatusCodeRunning);
        }
        return @(AWSLogsExportTaskStatusCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsExportTaskStatusCodeCancelled:
                return @"CANCELLED";
            case AWSLogsExportTaskStatusCodeCompleted:
                return @"COMPLETED";
            case AWSLogsExportTaskStatusCodeFailed:
                return @"FAILED";
            case AWSLogsExportTaskStatusCodePending:
                return @"PENDING";
            case AWSLogsExportTaskStatusCodePendingCancel:
                return @"PENDING_CANCEL";
            case AWSLogsExportTaskStatusCodeRunning:
                return @"RUNNING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsFilterLogEventsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"filterPattern" : @"filterPattern",
             @"interleaved" : @"interleaved",
             @"limit" : @"limit",
             @"logGroupName" : @"logGroupName",
             @"logStreamNamePrefix" : @"logStreamNamePrefix",
             @"logStreamNames" : @"logStreamNames",
             @"nextToken" : @"nextToken",
             @"startTime" : @"startTime",
             };
}

@end

@implementation AWSLogsFilterLogEventsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"events",
             @"nextToken" : @"nextToken",
             @"searchedLogStreams" : @"searchedLogStreams",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsFilteredLogEvent class]];
}

+ (NSValueTransformer *)searchedLogStreamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsSearchedLogStream class]];
}

@end

@implementation AWSLogsFilteredLogEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventId" : @"eventId",
             @"ingestionTime" : @"ingestionTime",
             @"logStreamName" : @"logStreamName",
             @"message" : @"message",
             @"timestamp" : @"timestamp",
             };
}

@end

@implementation AWSLogsGetLogEventsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"limit" : @"limit",
             @"logGroupName" : @"logGroupName",
             @"logStreamName" : @"logStreamName",
             @"nextToken" : @"nextToken",
             @"startFromHead" : @"startFromHead",
             @"startTime" : @"startTime",
             };
}

@end

@implementation AWSLogsGetLogEventsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"events" : @"events",
             @"nextBackwardToken" : @"nextBackwardToken",
             @"nextForwardToken" : @"nextForwardToken",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsOutputLogEvent class]];
}

@end

@implementation AWSLogsGetLogGroupFieldsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"time" : @"time",
             };
}

@end

@implementation AWSLogsGetLogGroupFieldsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupFields" : @"logGroupFields",
             };
}

+ (NSValueTransformer *)logGroupFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsLogGroupField class]];
}

@end

@implementation AWSLogsGetLogRecordRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logRecordPointer" : @"logRecordPointer",
             };
}

@end

@implementation AWSLogsGetLogRecordResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logRecord" : @"logRecord",
             };
}

@end

@implementation AWSLogsGetQueryResultsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryId" : @"queryId",
             };
}

@end

@implementation AWSLogsGetQueryResultsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"results" : @"results",
             @"statistics" : @"statistics",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statisticsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsQueryStatistics class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Running"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Timeout"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusTimeout);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusUnknown);
        }
        return @(AWSLogsQueryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsQueryStatusScheduled:
                return @"Scheduled";
            case AWSLogsQueryStatusRunning:
                return @"Running";
            case AWSLogsQueryStatusComplete:
                return @"Complete";
            case AWSLogsQueryStatusFailed:
                return @"Failed";
            case AWSLogsQueryStatusCancelled:
                return @"Cancelled";
            case AWSLogsQueryStatusTimeout:
                return @"Timeout";
            case AWSLogsQueryStatusUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsInputLogEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"message",
             @"timestamp" : @"timestamp",
             };
}

@end

@implementation AWSLogsListTagsForResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSLogsListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsListTagsLogGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsListTagsLogGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsLogGroup

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"creationTime" : @"creationTime",
             @"kmsKeyId" : @"kmsKeyId",
             @"logGroupName" : @"logGroupName",
             @"metricFilterCount" : @"metricFilterCount",
             @"retentionInDays" : @"retentionInDays",
             @"storedBytes" : @"storedBytes",
             };
}

@end

@implementation AWSLogsLogGroupField

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"percent" : @"percent",
             };
}

@end

@implementation AWSLogsLogStream

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"creationTime" : @"creationTime",
             @"firstEventTimestamp" : @"firstEventTimestamp",
             @"lastEventTimestamp" : @"lastEventTimestamp",
             @"lastIngestionTime" : @"lastIngestionTime",
             @"logStreamName" : @"logStreamName",
             @"storedBytes" : @"storedBytes",
             @"uploadSequenceToken" : @"uploadSequenceToken",
             };
}

@end

@implementation AWSLogsMetricFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"creationTime",
             @"filterName" : @"filterName",
             @"filterPattern" : @"filterPattern",
             @"logGroupName" : @"logGroupName",
             @"metricTransformations" : @"metricTransformations",
             };
}

+ (NSValueTransformer *)metricTransformationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsMetricTransformation class]];
}

@end

@implementation AWSLogsMetricFilterMatchRecord

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventMessage" : @"eventMessage",
             @"eventNumber" : @"eventNumber",
             @"extractedValues" : @"extractedValues",
             };
}

@end

@implementation AWSLogsMetricTransformation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultValue" : @"defaultValue",
             @"dimensions" : @"dimensions",
             @"metricName" : @"metricName",
             @"metricNamespace" : @"metricNamespace",
             @"metricValue" : @"metricValue",
             @"unit" : @"unit",
             };
}

+ (NSValueTransformer *)unitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Seconds"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitSeconds);
        }
        if ([value caseInsensitiveCompare:@"Microseconds"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitMicroseconds);
        }
        if ([value caseInsensitiveCompare:@"Milliseconds"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"Bytes"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitBytes);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitKilobytes);
        }
        if ([value caseInsensitiveCompare:@"Megabytes"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitMegabytes);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitGigabytes);
        }
        if ([value caseInsensitiveCompare:@"Terabytes"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitTerabytes);
        }
        if ([value caseInsensitiveCompare:@"Bits"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitBits);
        }
        if ([value caseInsensitiveCompare:@"Kilobits"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitKilobits);
        }
        if ([value caseInsensitiveCompare:@"Megabits"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitMegabits);
        }
        if ([value caseInsensitiveCompare:@"Gigabits"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitGigabits);
        }
        if ([value caseInsensitiveCompare:@"Terabits"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitTerabits);
        }
        if ([value caseInsensitiveCompare:@"Percent"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitPercent);
        }
        if ([value caseInsensitiveCompare:@"Count"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitCount);
        }
        if ([value caseInsensitiveCompare:@"Bytes/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitBytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobytes/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitKilobytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabytes/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitMegabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabytes/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitGigabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabytes/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitTerabytesSecond);
        }
        if ([value caseInsensitiveCompare:@"Bits/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitBitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Kilobits/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitKilobitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Megabits/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitMegabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Gigabits/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitGigabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Terabits/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitTerabitsSecond);
        }
        if ([value caseInsensitiveCompare:@"Count/Second"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitCountSecond);
        }
        if ([value caseInsensitiveCompare:@"None"] == NSOrderedSame) {
            return @(AWSLogsStandardUnitNone);
        }
        return @(AWSLogsStandardUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsStandardUnitSeconds:
                return @"Seconds";
            case AWSLogsStandardUnitMicroseconds:
                return @"Microseconds";
            case AWSLogsStandardUnitMilliseconds:
                return @"Milliseconds";
            case AWSLogsStandardUnitBytes:
                return @"Bytes";
            case AWSLogsStandardUnitKilobytes:
                return @"Kilobytes";
            case AWSLogsStandardUnitMegabytes:
                return @"Megabytes";
            case AWSLogsStandardUnitGigabytes:
                return @"Gigabytes";
            case AWSLogsStandardUnitTerabytes:
                return @"Terabytes";
            case AWSLogsStandardUnitBits:
                return @"Bits";
            case AWSLogsStandardUnitKilobits:
                return @"Kilobits";
            case AWSLogsStandardUnitMegabits:
                return @"Megabits";
            case AWSLogsStandardUnitGigabits:
                return @"Gigabits";
            case AWSLogsStandardUnitTerabits:
                return @"Terabits";
            case AWSLogsStandardUnitPercent:
                return @"Percent";
            case AWSLogsStandardUnitCount:
                return @"Count";
            case AWSLogsStandardUnitBytesSecond:
                return @"Bytes/Second";
            case AWSLogsStandardUnitKilobytesSecond:
                return @"Kilobytes/Second";
            case AWSLogsStandardUnitMegabytesSecond:
                return @"Megabytes/Second";
            case AWSLogsStandardUnitGigabytesSecond:
                return @"Gigabytes/Second";
            case AWSLogsStandardUnitTerabytesSecond:
                return @"Terabytes/Second";
            case AWSLogsStandardUnitBitsSecond:
                return @"Bits/Second";
            case AWSLogsStandardUnitKilobitsSecond:
                return @"Kilobits/Second";
            case AWSLogsStandardUnitMegabitsSecond:
                return @"Megabits/Second";
            case AWSLogsStandardUnitGigabitsSecond:
                return @"Gigabits/Second";
            case AWSLogsStandardUnitTerabitsSecond:
                return @"Terabits/Second";
            case AWSLogsStandardUnitCountSecond:
                return @"Count/Second";
            case AWSLogsStandardUnitNone:
                return @"None";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsOutputLogEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ingestionTime" : @"ingestionTime",
             @"message" : @"message",
             @"timestamp" : @"timestamp",
             };
}

@end

@implementation AWSLogsPutDestinationPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicy" : @"accessPolicy",
             @"destinationName" : @"destinationName",
             @"forceUpdate" : @"forceUpdate",
             };
}

@end

@implementation AWSLogsPutDestinationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationName" : @"destinationName",
             @"roleArn" : @"roleArn",
             @"tags" : @"tags",
             @"targetArn" : @"targetArn",
             };
}

@end

@implementation AWSLogsPutDestinationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"destination",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsDestination class]];
}

@end

@implementation AWSLogsPutLogEventsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logEvents" : @"logEvents",
             @"logGroupName" : @"logGroupName",
             @"logStreamName" : @"logStreamName",
             @"sequenceToken" : @"sequenceToken",
             };
}

+ (NSValueTransformer *)logEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsInputLogEvent class]];
}

@end

@implementation AWSLogsPutLogEventsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextSequenceToken" : @"nextSequenceToken",
             @"rejectedLogEventsInfo" : @"rejectedLogEventsInfo",
             };
}

+ (NSValueTransformer *)rejectedLogEventsInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsRejectedLogEventsInfo class]];
}

@end

@implementation AWSLogsPutMetricFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterName" : @"filterName",
             @"filterPattern" : @"filterPattern",
             @"logGroupName" : @"logGroupName",
             @"metricTransformations" : @"metricTransformations",
             };
}

+ (NSValueTransformer *)metricTransformationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsMetricTransformation class]];
}

@end

@implementation AWSLogsPutQueryDefinitionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupNames" : @"logGroupNames",
             @"name" : @"name",
             @"queryDefinitionId" : @"queryDefinitionId",
             @"queryString" : @"queryString",
             };
}

@end

@implementation AWSLogsPutQueryDefinitionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryDefinitionId" : @"queryDefinitionId",
             };
}

@end

@implementation AWSLogsPutResourcePolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSLogsPutResourcePolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourcePolicy" : @"resourcePolicy",
             };
}

+ (NSValueTransformer *)resourcePolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsResourcePolicy class]];
}

@end

@implementation AWSLogsPutRetentionPolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"retentionInDays" : @"retentionInDays",
             };
}

@end

@implementation AWSLogsPutSubscriptionFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationArn" : @"destinationArn",
             @"distribution" : @"distribution",
             @"filterName" : @"filterName",
             @"filterPattern" : @"filterPattern",
             @"logGroupName" : @"logGroupName",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)distributionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Random"] == NSOrderedSame) {
            return @(AWSLogsDistributionRandom);
        }
        if ([value caseInsensitiveCompare:@"ByLogStream"] == NSOrderedSame) {
            return @(AWSLogsDistributionByLogStream);
        }
        return @(AWSLogsDistributionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsDistributionRandom:
                return @"Random";
            case AWSLogsDistributionByLogStream:
                return @"ByLogStream";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsQueryCompileError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"location",
             @"message" : @"message",
             };
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSLogsQueryCompileErrorLocation class]];
}

@end

@implementation AWSLogsQueryCompileErrorLocation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endCharOffset" : @"endCharOffset",
             @"startCharOffset" : @"startCharOffset",
             };
}

@end

@implementation AWSLogsQueryDefinition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastModified" : @"lastModified",
             @"logGroupNames" : @"logGroupNames",
             @"name" : @"name",
             @"queryDefinitionId" : @"queryDefinitionId",
             @"queryString" : @"queryString",
             };
}

@end

@implementation AWSLogsQueryInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"createTime",
             @"logGroupName" : @"logGroupName",
             @"queryId" : @"queryId",
             @"queryString" : @"queryString",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Scheduled"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"Running"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusRunning);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Timeout"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusTimeout);
        }
        if ([value caseInsensitiveCompare:@"Unknown"] == NSOrderedSame) {
            return @(AWSLogsQueryStatusUnknown);
        }
        return @(AWSLogsQueryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsQueryStatusScheduled:
                return @"Scheduled";
            case AWSLogsQueryStatusRunning:
                return @"Running";
            case AWSLogsQueryStatusComplete:
                return @"Complete";
            case AWSLogsQueryStatusFailed:
                return @"Failed";
            case AWSLogsQueryStatusCancelled:
                return @"Cancelled";
            case AWSLogsQueryStatusTimeout:
                return @"Timeout";
            case AWSLogsQueryStatusUnknown:
                return @"Unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsQueryStatistics

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytesScanned" : @"bytesScanned",
             @"recordsMatched" : @"recordsMatched",
             @"recordsScanned" : @"recordsScanned",
             };
}

@end

@implementation AWSLogsRejectedLogEventsInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expiredLogEventEndIndex" : @"expiredLogEventEndIndex",
             @"tooNewLogEventStartIndex" : @"tooNewLogEventStartIndex",
             @"tooOldLogEventEndIndex" : @"tooOldLogEventEndIndex",
             };
}

@end

@implementation AWSLogsResourcePolicy

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastUpdatedTime" : @"lastUpdatedTime",
             @"policyDocument" : @"policyDocument",
             @"policyName" : @"policyName",
             };
}

@end

@implementation AWSLogsResultField

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"field" : @"field",
             @"value" : @"value",
             };
}

@end

@implementation AWSLogsSearchedLogStream

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logStreamName" : @"logStreamName",
             @"searchedCompletely" : @"searchedCompletely",
             };
}

@end

@implementation AWSLogsStartQueryRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"limit" : @"limit",
             @"logGroupName" : @"logGroupName",
             @"logGroupNames" : @"logGroupNames",
             @"queryString" : @"queryString",
             @"startTime" : @"startTime",
             };
}

@end

@implementation AWSLogsStartQueryResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryId" : @"queryId",
             };
}

@end

@implementation AWSLogsStopQueryRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queryId" : @"queryId",
             };
}

@end

@implementation AWSLogsStopQueryResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"success" : @"success",
             };
}

@end

@implementation AWSLogsSubscriptionFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"creationTime",
             @"destinationArn" : @"destinationArn",
             @"distribution" : @"distribution",
             @"filterName" : @"filterName",
             @"filterPattern" : @"filterPattern",
             @"logGroupName" : @"logGroupName",
             @"roleArn" : @"roleArn",
             };
}

+ (NSValueTransformer *)distributionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Random"] == NSOrderedSame) {
            return @(AWSLogsDistributionRandom);
        }
        if ([value caseInsensitiveCompare:@"ByLogStream"] == NSOrderedSame) {
            return @(AWSLogsDistributionByLogStream);
        }
        return @(AWSLogsDistributionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSLogsDistributionRandom:
                return @"Random";
            case AWSLogsDistributionByLogStream:
                return @"ByLogStream";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSLogsTagLogGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsTagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsTestMetricFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterPattern" : @"filterPattern",
             @"logEventMessages" : @"logEventMessages",
             };
}

@end

@implementation AWSLogsTestMetricFilterResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"matches" : @"matches",
             };
}

+ (NSValueTransformer *)matchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSLogsMetricFilterMatchRecord class]];
}

@end

@implementation AWSLogsUntagLogGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsUntagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end
