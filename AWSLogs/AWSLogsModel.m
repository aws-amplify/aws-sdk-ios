//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@implementation AWSLogsCancelExportTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSLogsCreateExportTaskRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"taskId",
             };
}

@end

@implementation AWSLogsCreateLogGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsCreateLogStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"logStreamName" : @"logStreamName",
             };
}

@end

@implementation AWSLogsDeleteDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationName" : @"destinationName",
             };
}

@end

@implementation AWSLogsDeleteLogGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsDeleteLogStreamRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"logStreamName" : @"logStreamName",
             };
}

@end

@implementation AWSLogsDeleteMetricFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterName" : @"filterName",
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsDeleteRetentionPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsDeleteSubscriptionFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterName" : @"filterName",
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsDescribeDestinationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationNamePrefix" : @"DestinationNamePrefix",
             @"limit" : @"limit",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeDestinationsResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"limit",
             @"logGroupNamePrefix" : @"logGroupNamePrefix",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSLogsDescribeLogGroupsResponse

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

@implementation AWSLogsDescribeSubscriptionFiltersRequest

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

@implementation AWSLogsExportTask

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionTime" : @"completionTime",
             @"creationTime" : @"creationTime",
             };
}

@end

@implementation AWSLogsExportTaskStatus

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"endTime",
             @"filterPattern" : @"filterPattern",
             @"interleaved" : @"interleaved",
             @"limit" : @"limit",
             @"logGroupName" : @"logGroupName",
             @"logStreamNames" : @"logStreamNames",
             @"nextToken" : @"nextToken",
             @"startTime" : @"startTime",
             };
}

@end

@implementation AWSLogsFilterLogEventsResponse

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

@implementation AWSLogsInputLogEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"message",
             @"timestamp" : @"timestamp",
             };
}

@end

@implementation AWSLogsListTagsLogGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             };
}

@end

@implementation AWSLogsListTagsLogGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsLogGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"arn",
             @"creationTime" : @"creationTime",
             @"logGroupName" : @"logGroupName",
             @"metricFilterCount" : @"metricFilterCount",
             @"retentionInDays" : @"retentionInDays",
             @"storedBytes" : @"storedBytes",
             };
}

@end

@implementation AWSLogsLogStream

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventMessage" : @"eventMessage",
             @"eventNumber" : @"eventNumber",
             @"extractedValues" : @"extractedValues",
             };
}

@end

@implementation AWSLogsMetricTransformation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultValue" : @"defaultValue",
             @"metricName" : @"metricName",
             @"metricNamespace" : @"metricNamespace",
             @"metricValue" : @"metricValue",
             };
}

@end

@implementation AWSLogsOutputLogEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ingestionTime" : @"ingestionTime",
             @"message" : @"message",
             @"timestamp" : @"timestamp",
             };
}

@end

@implementation AWSLogsPutDestinationPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPolicy" : @"accessPolicy",
             @"destinationName" : @"destinationName",
             };
}

@end

@implementation AWSLogsPutDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationName" : @"destinationName",
             @"roleArn" : @"roleArn",
             @"targetArn" : @"targetArn",
             };
}

@end

@implementation AWSLogsPutDestinationResponse

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

@implementation AWSLogsPutRetentionPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"retentionInDays" : @"retentionInDays",
             };
}

@end

@implementation AWSLogsPutSubscriptionFilterRequest

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

@implementation AWSLogsRejectedLogEventsInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expiredLogEventEndIndex" : @"expiredLogEventEndIndex",
             @"tooNewLogEventStartIndex" : @"tooNewLogEventStartIndex",
             @"tooOldLogEventEndIndex" : @"tooOldLogEventEndIndex",
             };
}

@end

@implementation AWSLogsSearchedLogStream

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logStreamName" : @"logStreamName",
             @"searchedCompletely" : @"searchedCompletely",
             };
}

@end

@implementation AWSLogsSubscriptionFilter

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSLogsTestMetricFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterPattern" : @"filterPattern",
             @"logEventMessages" : @"logEventMessages",
             };
}

@end

@implementation AWSLogsTestMetricFilterResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"logGroupName" : @"logGroupName",
             @"tags" : @"tags",
             };
}

@end
