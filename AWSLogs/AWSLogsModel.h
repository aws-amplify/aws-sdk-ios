//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSLogsErrorDomain;

typedef NS_ENUM(NSInteger, AWSLogsErrorType) {
    AWSLogsErrorUnknown,
    AWSLogsErrorDataAlreadyAccepted,
    AWSLogsErrorInvalidOperation,
    AWSLogsErrorInvalidParameter,
    AWSLogsErrorInvalidSequenceToken,
    AWSLogsErrorLimitExceeded,
    AWSLogsErrorMalformedQuery,
    AWSLogsErrorOperationAborted,
    AWSLogsErrorResourceAlreadyExists,
    AWSLogsErrorResourceNotFound,
    AWSLogsErrorServiceUnavailable,
    AWSLogsErrorTooManyTags,
    AWSLogsErrorUnrecognizedClient,
};

typedef NS_ENUM(NSInteger, AWSLogsDataProtectionStatus) {
    AWSLogsDataProtectionStatusUnknown,
    AWSLogsDataProtectionStatusActivated,
    AWSLogsDataProtectionStatusDeleted,
    AWSLogsDataProtectionStatusArchived,
    AWSLogsDataProtectionStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSLogsDistribution) {
    AWSLogsDistributionUnknown,
    AWSLogsDistributionRandom,
    AWSLogsDistributionByLogStream,
};

typedef NS_ENUM(NSInteger, AWSLogsExportTaskStatusCode) {
    AWSLogsExportTaskStatusCodeUnknown,
    AWSLogsExportTaskStatusCodeCancelled,
    AWSLogsExportTaskStatusCodeCompleted,
    AWSLogsExportTaskStatusCodeFailed,
    AWSLogsExportTaskStatusCodePending,
    AWSLogsExportTaskStatusCodePendingCancel,
    AWSLogsExportTaskStatusCodeRunning,
};

typedef NS_ENUM(NSInteger, AWSLogsInheritedProperty) {
    AWSLogsInheritedPropertyUnknown,
    AWSLogsInheritedPropertyAccountDataProtection,
};

typedef NS_ENUM(NSInteger, AWSLogsOrderBy) {
    AWSLogsOrderByUnknown,
    AWSLogsOrderByLogStreamName,
    AWSLogsOrderByLastEventTime,
};

typedef NS_ENUM(NSInteger, AWSLogsPolicyType) {
    AWSLogsPolicyTypeUnknown,
    AWSLogsPolicyTypeDataProtectionPolicy,
};

typedef NS_ENUM(NSInteger, AWSLogsQueryStatus) {
    AWSLogsQueryStatusUnknown,
    AWSLogsQueryStatusScheduled,
    AWSLogsQueryStatusRunning,
    AWSLogsQueryStatusComplete,
    AWSLogsQueryStatusFailed,
    AWSLogsQueryStatusCancelled,
    AWSLogsQueryStatusTimeout,
};

typedef NS_ENUM(NSInteger, AWSLogsScope) {
    AWSLogsScopeUnknown,
    AWSLogsScopeAll,
};

typedef NS_ENUM(NSInteger, AWSLogsStandardUnit) {
    AWSLogsStandardUnitUnknown,
    AWSLogsStandardUnitSeconds,
    AWSLogsStandardUnitMicroseconds,
    AWSLogsStandardUnitMilliseconds,
    AWSLogsStandardUnitBytes,
    AWSLogsStandardUnitKilobytes,
    AWSLogsStandardUnitMegabytes,
    AWSLogsStandardUnitGigabytes,
    AWSLogsStandardUnitTerabytes,
    AWSLogsStandardUnitBits,
    AWSLogsStandardUnitKilobits,
    AWSLogsStandardUnitMegabits,
    AWSLogsStandardUnitGigabits,
    AWSLogsStandardUnitTerabits,
    AWSLogsStandardUnitPercent,
    AWSLogsStandardUnitCount,
    AWSLogsStandardUnitBytesSecond,
    AWSLogsStandardUnitKilobytesSecond,
    AWSLogsStandardUnitMegabytesSecond,
    AWSLogsStandardUnitGigabytesSecond,
    AWSLogsStandardUnitTerabytesSecond,
    AWSLogsStandardUnitBitsSecond,
    AWSLogsStandardUnitKilobitsSecond,
    AWSLogsStandardUnitMegabitsSecond,
    AWSLogsStandardUnitGigabitsSecond,
    AWSLogsStandardUnitTerabitsSecond,
    AWSLogsStandardUnitCountSecond,
    AWSLogsStandardUnitNone,
};

@class AWSLogsAccountPolicy;
@class AWSLogsAssociateKmsKeyRequest;
@class AWSLogsCancelExportTaskRequest;
@class AWSLogsCreateExportTaskRequest;
@class AWSLogsCreateExportTaskResponse;
@class AWSLogsCreateLogGroupRequest;
@class AWSLogsCreateLogStreamRequest;
@class AWSLogsDeleteAccountPolicyRequest;
@class AWSLogsDeleteDataProtectionPolicyRequest;
@class AWSLogsDeleteDestinationRequest;
@class AWSLogsDeleteLogGroupRequest;
@class AWSLogsDeleteLogStreamRequest;
@class AWSLogsDeleteMetricFilterRequest;
@class AWSLogsDeleteQueryDefinitionRequest;
@class AWSLogsDeleteQueryDefinitionResponse;
@class AWSLogsDeleteResourcePolicyRequest;
@class AWSLogsDeleteRetentionPolicyRequest;
@class AWSLogsDeleteSubscriptionFilterRequest;
@class AWSLogsDescribeAccountPoliciesRequest;
@class AWSLogsDescribeAccountPoliciesResponse;
@class AWSLogsDescribeDestinationsRequest;
@class AWSLogsDescribeDestinationsResponse;
@class AWSLogsDescribeExportTasksRequest;
@class AWSLogsDescribeExportTasksResponse;
@class AWSLogsDescribeLogGroupsRequest;
@class AWSLogsDescribeLogGroupsResponse;
@class AWSLogsDescribeLogStreamsRequest;
@class AWSLogsDescribeLogStreamsResponse;
@class AWSLogsDescribeMetricFiltersRequest;
@class AWSLogsDescribeMetricFiltersResponse;
@class AWSLogsDescribeQueriesRequest;
@class AWSLogsDescribeQueriesResponse;
@class AWSLogsDescribeQueryDefinitionsRequest;
@class AWSLogsDescribeQueryDefinitionsResponse;
@class AWSLogsDescribeResourcePoliciesRequest;
@class AWSLogsDescribeResourcePoliciesResponse;
@class AWSLogsDescribeSubscriptionFiltersRequest;
@class AWSLogsDescribeSubscriptionFiltersResponse;
@class AWSLogsDestination;
@class AWSLogsDisassociateKmsKeyRequest;
@class AWSLogsExportTask;
@class AWSLogsExportTaskExecutionInfo;
@class AWSLogsExportTaskStatus;
@class AWSLogsFilterLogEventsRequest;
@class AWSLogsFilterLogEventsResponse;
@class AWSLogsFilteredLogEvent;
@class AWSLogsGetDataProtectionPolicyRequest;
@class AWSLogsGetDataProtectionPolicyResponse;
@class AWSLogsGetLogEventsRequest;
@class AWSLogsGetLogEventsResponse;
@class AWSLogsGetLogGroupFieldsRequest;
@class AWSLogsGetLogGroupFieldsResponse;
@class AWSLogsGetLogRecordRequest;
@class AWSLogsGetLogRecordResponse;
@class AWSLogsGetQueryResultsRequest;
@class AWSLogsGetQueryResultsResponse;
@class AWSLogsInputLogEvent;
@class AWSLogsListTagsForResourceRequest;
@class AWSLogsListTagsForResourceResponse;
@class AWSLogsListTagsLogGroupRequest;
@class AWSLogsListTagsLogGroupResponse;
@class AWSLogsLogGroup;
@class AWSLogsLogGroupField;
@class AWSLogsLogStream;
@class AWSLogsMetricFilter;
@class AWSLogsMetricFilterMatchRecord;
@class AWSLogsMetricTransformation;
@class AWSLogsOutputLogEvent;
@class AWSLogsPutAccountPolicyRequest;
@class AWSLogsPutAccountPolicyResponse;
@class AWSLogsPutDataProtectionPolicyRequest;
@class AWSLogsPutDataProtectionPolicyResponse;
@class AWSLogsPutDestinationPolicyRequest;
@class AWSLogsPutDestinationRequest;
@class AWSLogsPutDestinationResponse;
@class AWSLogsPutLogEventsRequest;
@class AWSLogsPutLogEventsResponse;
@class AWSLogsPutMetricFilterRequest;
@class AWSLogsPutQueryDefinitionRequest;
@class AWSLogsPutQueryDefinitionResponse;
@class AWSLogsPutResourcePolicyRequest;
@class AWSLogsPutResourcePolicyResponse;
@class AWSLogsPutRetentionPolicyRequest;
@class AWSLogsPutSubscriptionFilterRequest;
@class AWSLogsQueryCompileError;
@class AWSLogsQueryCompileErrorLocation;
@class AWSLogsQueryDefinition;
@class AWSLogsQueryInfo;
@class AWSLogsQueryStatistics;
@class AWSLogsRejectedLogEventsInfo;
@class AWSLogsResourcePolicy;
@class AWSLogsResultField;
@class AWSLogsSearchedLogStream;
@class AWSLogsStartQueryRequest;
@class AWSLogsStartQueryResponse;
@class AWSLogsStopQueryRequest;
@class AWSLogsStopQueryResponse;
@class AWSLogsSubscriptionFilter;
@class AWSLogsTagLogGroupRequest;
@class AWSLogsTagResourceRequest;
@class AWSLogsTestMetricFilterRequest;
@class AWSLogsTestMetricFilterResponse;
@class AWSLogsUntagLogGroupRequest;
@class AWSLogsUntagResourceRequest;

/**
 <p>A structure that contains information about one CloudWatch Logs account policy.</p>
 */
@interface AWSLogsAccountPolicy : AWSModel


/**
 <p>The Amazon Web Services account ID that the policy applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The date and time that this policy was most recently updated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lastUpdatedTime;

/**
 <p>The policy document for this account policy.</p><p>The JSON specified in <code>policyDocument</code> can be up to 30,720 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The name of the account policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The type of policy for this account policy.</p>
 */
@property (nonatomic, assign) AWSLogsPolicyType policyType;

/**
 <p>The scope of the account policy.</p>
 */
@property (nonatomic, assign) AWSLogsScope scope;

@end

/**
 
 */
@interface AWSLogsAssociateKmsKeyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data. This must be a symmetric KMS key. For more information, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms">Amazon Resource Names</a> and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric Keys</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

@end

/**
 
 */
@interface AWSLogsCancelExportTaskRequest : AWSRequest


/**
 <p>The ID of the export task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSLogsCreateExportTaskRequest : AWSRequest


/**
 <p>The name of S3 bucket for the exported log data. The bucket must be in the same Amazon Web Services Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destination;

/**
 <p>The prefix used as the start of the key for every object exported. If you don't specify a value, the default is <code>exportedlogs</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationPrefix;

/**
 <p>The start time of the range for the request, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp earlier than this time are not exported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable from;

/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>Export only log streams that match the provided prefix. If you don't specify a value, no prefix filter is applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logStreamNamePrefix;

/**
 <p>The name of the export task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskName;

/**
 <p>The end time of the range for the request, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp later than this time are not exported.</p><p>You must specify a time that is not earlier than when this log group was created.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable to;

@end

/**
 
 */
@interface AWSLogsCreateExportTaskResponse : AWSModel


/**
 <p>The ID of the export task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSLogsCreateLogGroupRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data. For more information, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms">Amazon Resource Names</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The key-value pairs to use for the tags.</p><p>You can grant users access to certain log groups while preventing them from accessing other log groups. To do so, tag your groups and use IAM policies that refer to those tags. To assign tags when you create a log group, you must have either the <code>logs:TagResource</code> or <code>logs:TagLogGroup</code> permission. For more information about tagging, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging Amazon Web Services resources</a>. For more information about using tags to control access, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Controlling access to Amazon Web Services resources using tags</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLogsCreateLogStreamRequest : AWSRequest


/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The name of the log stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logStreamName;

@end

/**
 
 */
@interface AWSLogsDeleteAccountPolicyRequest : AWSRequest


/**
 <p>The name of the policy to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The type of policy to delete. Currently, the only valid value is <code>DATA_PROTECTION_POLICY</code>.</p>
 */
@property (nonatomic, assign) AWSLogsPolicyType policyType;

@end

/**
 
 */
@interface AWSLogsDeleteDataProtectionPolicyRequest : AWSRequest


/**
 <p>The name or ARN of the log group that you want to delete the data protection policy for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupIdentifier;

@end

/**
 
 */
@interface AWSLogsDeleteDestinationRequest : AWSRequest


/**
 <p>The name of the destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationName;

@end

/**
 
 */
@interface AWSLogsDeleteLogGroupRequest : AWSRequest


/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

@end

/**
 
 */
@interface AWSLogsDeleteLogStreamRequest : AWSRequest


/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The name of the log stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logStreamName;

@end

/**
 
 */
@interface AWSLogsDeleteMetricFilterRequest : AWSRequest


/**
 <p>The name of the metric filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterName;

/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

@end

/**
 
 */
@interface AWSLogsDeleteQueryDefinitionRequest : AWSRequest


/**
 <p>The ID of the query definition that you want to delete. You can use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html">DescribeQueryDefinitions</a> to retrieve the IDs of your saved query definitions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryDefinitionId;

@end

/**
 
 */
@interface AWSLogsDeleteQueryDefinitionResponse : AWSModel


/**
 <p>A value of TRUE indicates that the operation succeeded. FALSE indicates that the operation failed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable success;

@end

/**
 
 */
@interface AWSLogsDeleteResourcePolicyRequest : AWSRequest


/**
 <p>The name of the policy to be revoked. This parameter is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSLogsDeleteRetentionPolicyRequest : AWSRequest


/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

@end

/**
 
 */
@interface AWSLogsDeleteSubscriptionFilterRequest : AWSRequest


/**
 <p>The name of the subscription filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterName;

/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

@end

/**
 
 */
@interface AWSLogsDescribeAccountPoliciesRequest : AWSRequest


/**
 <p>If you are using an account that is set up as a monitoring account for CloudWatch unified cross-account observability, you can use this to specify the account ID of a source account. If you do, the operation returns the account policy for the specified account. Currently, you can specify only one account ID in this parameter.</p><p>If you omit this parameter, only the policy in the current account is returned.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIdentifiers;

/**
 <p>Use this parameter to limit the returned policies to only the policy with the name that you specify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>Use this parameter to limit the returned policies to only the policies that match the policy type that you specify. Currently, the only valid value is <code>DATA_PROTECTION_POLICY</code>.</p>
 */
@property (nonatomic, assign) AWSLogsPolicyType policyType;

@end

/**
 
 */
@interface AWSLogsDescribeAccountPoliciesResponse : AWSModel


/**
 <p>An array of structures that contain information about the CloudWatch Logs account policies that match the specified filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsAccountPolicy *> * _Nullable accountPolicies;

@end

/**
 
 */
@interface AWSLogsDescribeDestinationsRequest : AWSRequest


/**
 <p>The prefix to match. If you don't specify a value, no prefix filter is applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationNamePrefix;

/**
 <p>The maximum number of items returned. If you don't specify a value, the default maximum value of 50 items is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLogsDescribeDestinationsResponse : AWSModel


/**
 <p>The destinations.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsDestination *> * _Nullable destinations;

/**
 <p>The token for the next set of items to return. The token expires after 24 hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLogsDescribeExportTasksRequest : AWSRequest


/**
 <p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The status code of the export task. Specifying a status code filters the results to zero or more export tasks.</p>
 */
@property (nonatomic, assign) AWSLogsExportTaskStatusCode statusCode;

/**
 <p>The ID of the export task. Specifying a task ID filters the results to one or zero export tasks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSLogsDescribeExportTasksResponse : AWSModel


/**
 <p>The export tasks.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsExportTask *> * _Nullable exportTasks;

/**
 <p>The token for the next set of items to return. The token expires after 24 hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLogsDescribeLogGroupsRequest : AWSRequest


/**
 <p>When <code>includeLinkedAccounts</code> is set to <code>True</code>, use this parameter to specify the list of accounts to search. You can specify as many as 20 account IDs in the array. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIdentifiers;

/**
 <p>If you are using a monitoring account, set this to <code>True</code> to have the operation return log groups in the accounts listed in <code>accountIdentifiers</code>.</p><p>If this parameter is set to <code>true</code> and <code>accountIdentifiers</code> contains a null value, the operation returns all log groups in the monitoring account and all log groups in all source accounts that are linked to the monitoring account. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeLinkedAccounts;

/**
 <p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a string for this parameter, the operation returns only log groups that have names that match the string based on a case-sensitive substring search. For example, if you specify <code>Foo</code>, log groups named <code>FooBar</code>, <code>aws/Foo</code>, and <code>GroupFoo</code> would match, but <code>foo</code>, <code>F/o/o</code> and <code>Froo</code> would not match.</p><p>If you specify <code>logGroupNamePattern</code> in your request, then only <code>arn</code>, <code>creationTime</code>, and <code>logGroupName</code> are included in the response. </p><note><p><code>logGroupNamePattern</code> and <code>logGroupNamePrefix</code> are mutually exclusive. Only one of these parameters can be passed. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupNamePattern;

/**
 <p>The prefix to match.</p><note><p><code>logGroupNamePrefix</code> and <code>logGroupNamePattern</code> are mutually exclusive. Only one of these parameters can be passed. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupNamePrefix;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLogsDescribeLogGroupsResponse : AWSModel


/**
 <p>The log groups.</p><p>If the <code>retentionInDays</code> value is not included for a log group, then that log group's events do not expire.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsLogGroup *> * _Nullable logGroups;

/**
 <p>The token for the next set of items to return. The token expires after 24 hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLogsDescribeLogStreamsRequest : AWSRequest


/**
 <p>If the value is true, results are returned in descending order. If the value is to false, results are returned in ascending order. The default value is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable descending;

/**
 <p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>Specify either the name or ARN of the log group to view. If the log group is in a source account and you are using a monitoring account, you must use the log group ARN.</p><note><p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupIdentifier;

/**
 <p>The name of the log group.</p><note><p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The prefix to match.</p><p>If <code>orderBy</code> is <code>LastEventTime</code>, you cannot specify this parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logStreamNamePrefix;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>If the value is <code>LogStreamName</code>, the results are ordered by log stream name. If the value is <code>LastEventTime</code>, the results are ordered by the event time. The default value is <code>LogStreamName</code>.</p><p>If you order the results by event time, you cannot specify the <code>logStreamNamePrefix</code> parameter.</p><p><code>lastEventTimestamp</code> represents the time of the most recent log event in the log stream in CloudWatch Logs. This number is expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. <code>lastEventTimestamp</code> updates on an eventual consistency basis. It typically updates in less than an hour from ingestion, but in rare situations might take longer.</p>
 */
@property (nonatomic, assign) AWSLogsOrderBy orderBy;

@end

/**
 
 */
@interface AWSLogsDescribeLogStreamsResponse : AWSModel


/**
 <p>The log streams.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsLogStream *> * _Nullable logStreams;

/**
 <p>The token for the next set of items to return. The token expires after 24 hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLogsDescribeMetricFiltersRequest : AWSRequest


/**
 <p>The prefix to match. CloudWatch Logs uses the value that you set here only if you also include the <code>logGroupName</code> parameter in your request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterNamePrefix;

/**
 <p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>Filters results to include only those with the specified metric name. If you include this parameter in your request, you must also include the <code>metricNamespace</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>Filters results to include only those in the specified namespace. If you include this parameter in your request, you must also include the <code>metricName</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricNamespace;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLogsDescribeMetricFiltersResponse : AWSModel


/**
 <p>The metric filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsMetricFilter *> * _Nullable metricFilters;

/**
 <p>The token for the next set of items to return. The token expires after 24 hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLogsDescribeQueriesRequest : AWSRequest


/**
 <p>Limits the returned queries to only those for the specified log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>Limits the number of returned queries to the specified number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. The token expires after 24 hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Limits the returned queries to only those that have the specified status. Valid values are <code>Cancelled</code>, <code>Complete</code>, <code>Failed</code>, <code>Running</code>, and <code>Scheduled</code>.</p>
 */
@property (nonatomic, assign) AWSLogsQueryStatus status;

@end

/**
 
 */
@interface AWSLogsDescribeQueriesResponse : AWSModel


/**
 <p>The token for the next set of items to return. The token expires after 24 hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of queries that match the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsQueryInfo *> * _Nullable queries;

@end

/**
 
 */
@interface AWSLogsDescribeQueryDefinitionsRequest : AWSRequest


/**
 <p>Limits the number of returned query definitions to the specified number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. The token expires after 24 hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Use this parameter to filter your results to only the query definitions that have names that start with the prefix you specify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryDefinitionNamePrefix;

@end

/**
 
 */
@interface AWSLogsDescribeQueryDefinitionsResponse : AWSModel


/**
 <p>The token for the next set of items to return. The token expires after 24 hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of query definitions that match your request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsQueryDefinition *> * _Nullable queryDefinitions;

@end

/**
 
 */
@interface AWSLogsDescribeResourcePoliciesRequest : AWSRequest


/**
 <p>The maximum number of resource policies to be displayed with one call of this API.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The token for the next set of items to return. The token expires after 24 hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLogsDescribeResourcePoliciesResponse : AWSModel


/**
 <p>The token for the next set of items to return. The token expires after 24 hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The resource policies that exist in this account.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsResourcePolicy *> * _Nullable resourcePolicies;

@end

/**
 
 */
@interface AWSLogsDescribeSubscriptionFiltersRequest : AWSRequest


/**
 <p>The prefix to match. If you don't specify a value, no prefix filter is applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterNamePrefix;

/**
 <p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLogsDescribeSubscriptionFiltersResponse : AWSModel


/**
 <p>The token for the next set of items to return. The token expires after 24 hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The subscription filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsSubscriptionFilter *> * _Nullable subscriptionFilters;

@end

/**
 <p>Represents a cross-account destination that receives subscription log events.</p>
 */
@interface AWSLogsDestination : AWSModel


/**
 <p>An IAM policy document that governs which Amazon Web Services accounts can create subscription filters against this destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicy;

/**
 <p>The ARN of this destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The creation time of the destination, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable creationTime;

/**
 <p>The name of the destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationName;

/**
 <p>A role for impersonation, used when delivering log events to the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The Amazon Resource Name (ARN) of the physical target where the log events are delivered (for example, a Kinesis stream).</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 
 */
@interface AWSLogsDisassociateKmsKeyRequest : AWSRequest


/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

@end

/**
 <p>Represents an export task.</p>
 */
@interface AWSLogsExportTask : AWSModel


/**
 <p>The name of the S3 bucket to which the log data was exported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destination;

/**
 <p>The prefix that was used as the start of Amazon S3 key for every object exported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationPrefix;

/**
 <p>Execution information about the export task.</p>
 */
@property (nonatomic, strong) AWSLogsExportTaskExecutionInfo * _Nullable executionInfo;

/**
 <p>The start time, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp before this time are not exported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable from;

/**
 <p>The name of the log group from which logs data was exported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The status of the export task.</p>
 */
@property (nonatomic, strong) AWSLogsExportTaskStatus * _Nullable status;

/**
 <p>The ID of the export task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p>The name of the export task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskName;

/**
 <p>The end time, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp later than this time are not exported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable to;

@end

/**
 <p>Represents the status of an export task.</p>
 */
@interface AWSLogsExportTaskExecutionInfo : AWSModel


/**
 <p>The completion time of the export task, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable completionTime;

/**
 <p>The creation time of the export task, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable creationTime;

@end

/**
 <p>Represents the status of an export task.</p>
 */
@interface AWSLogsExportTaskStatus : AWSModel


/**
 <p>The status code of the export task.</p>
 */
@property (nonatomic, assign) AWSLogsExportTaskStatusCode code;

/**
 <p>The status message related to the status code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 
 */
@interface AWSLogsFilterLogEventsRequest : AWSRequest


/**
 <p>The end of the time range, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp later than this time are not returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endTime;

/**
 <p>The filter pattern to use. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html">Filter and Pattern Syntax</a>.</p><p>If not provided, all the events are matched.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterPattern;

/**
 <p>If the value is true, the operation attempts to provide responses that contain events from multiple log streams within the log group, interleaved in a single response. If the value is false, all the matched log events in the first log stream are searched first, then those in the next log stream, and so on.</p><p><b>Important</b> As of June 17, 2019, this parameter is ignored and the value is assumed to be true. The response from this operation always interleaves events from multiple log streams within a log group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable interleaved;

/**
 <p>The maximum number of events to return. The default is 10,000 events.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>Specify either the name or ARN of the log group to view log events from. If the log group is in a source account and you are using a monitoring account, you must use the log group ARN.</p><note><p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupIdentifier;

/**
 <p>The name of the log group to search.</p><note><p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>Filters the results to include only events from log streams that have names starting with this prefix.</p><p>If you specify a value for both <code>logStreamNamePrefix</code> and <code>logStreamNames</code>, but the value for <code>logStreamNamePrefix</code> does not match any log stream names specified in <code>logStreamNames</code>, the action returns an <code>InvalidParameterException</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logStreamNamePrefix;

/**
 <p>Filters the results to only logs from the log streams in this list.</p><p>If you specify a value for both <code>logStreamNamePrefix</code> and <code>logStreamNames</code>, the action returns an <code>InvalidParameterException</code> error.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logStreamNames;

/**
 <p>The token for the next set of events to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The start of the time range, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp before this time are not returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startTime;

/**
 <p>Specify <code>true</code> to display the log event fields with all sensitive data unmasked and visible. The default is <code>false</code>.</p><p>To use this operation with this parameter, you must be signed into an account with the <code>logs:Unmask</code> permission.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unmask;

@end

/**
 
 */
@interface AWSLogsFilterLogEventsResponse : AWSModel


/**
 <p>The matched events.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsFilteredLogEvent *> * _Nullable events;

/**
 <p>The token to use when requesting the next set of items. The token expires after 24 hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p><b>Important</b> As of May 15, 2020, this parameter is no longer supported. This parameter returns an empty list.</p><p>Indicates which log streams have been searched and whether each has been searched completely.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsSearchedLogStream *> * _Nullable searchedLogStreams;

@end

/**
 <p>Represents a matched event.</p>
 */
@interface AWSLogsFilteredLogEvent : AWSModel


/**
 <p>The ID of the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 <p>The time the event was ingested, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ingestionTime;

/**
 <p>The name of the log stream to which this event belongs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logStreamName;

/**
 <p>The data contained in the log event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The time the event occurred, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 
 */
@interface AWSLogsGetDataProtectionPolicyRequest : AWSRequest


/**
 <p>The name or ARN of the log group that contains the data protection policy that you want to see.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupIdentifier;

@end

/**
 
 */
@interface AWSLogsGetDataProtectionPolicyResponse : AWSModel


/**
 <p>The date and time that this policy was most recently updated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lastUpdatedTime;

/**
 <p>The log group name or ARN that you specified in your request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupIdentifier;

/**
 <p>The data protection policy document for this log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

@end

/**
 
 */
@interface AWSLogsGetLogEventsRequest : AWSRequest


/**
 <p>The end of the time range, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp equal to or later than this time are not included.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endTime;

/**
 <p>The maximum number of log events returned. If you don't specify a limit, the default is as many log events as can fit in a response size of 1 MB (up to 10,000 log events).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>Specify either the name or ARN of the log group to view events from. If the log group is in a source account and you are using a monitoring account, you must use the log group ARN.</p><note><p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupIdentifier;

/**
 <p>The name of the log group.</p><note><p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The name of the log stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logStreamName;

/**
 <p>The token for the next set of items to return. (You received this token from a previous call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>If the value is true, the earliest log events are returned first. If the value is false, the latest log events are returned first. The default value is false.</p><p>If you are using a previous <code>nextForwardToken</code> value as the <code>nextToken</code> in this operation, you must specify <code>true</code> for <code>startFromHead</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startFromHead;

/**
 <p>The start of the time range, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp equal to this time or later than this time are included. Events with a timestamp earlier than this time are not included.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startTime;

/**
 <p>Specify <code>true</code> to display the log event fields with all sensitive data unmasked and visible. The default is <code>false</code>.</p><p>To use this operation with this parameter, you must be signed into an account with the <code>logs:Unmask</code> permission.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unmask;

@end

/**
 
 */
@interface AWSLogsGetLogEventsResponse : AWSModel


/**
 <p>The events.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsOutputLogEvent *> * _Nullable events;

/**
 <p>The token for the next set of items in the backward direction. The token expires after 24 hours. This token is not null. If you have reached the end of the stream, it returns the same token you passed in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextBackwardToken;

/**
 <p>The token for the next set of items in the forward direction. The token expires after 24 hours. If you have reached the end of the stream, it returns the same token you passed in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextForwardToken;

@end

/**
 
 */
@interface AWSLogsGetLogGroupFieldsRequest : AWSRequest


/**
 <p>Specify either the name or ARN of the log group to view. If the log group is in a source account and you are using a monitoring account, you must specify the ARN.</p><note><p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupIdentifier;

/**
 <p>The name of the log group to search.</p><note><p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The time to set as the center of the query. If you specify <code>time</code>, the 15 minutes before this time are queries. If you omit <code>time</code>, the 8 minutes before and 8 minutes after this time are searched.</p><p>The <code>time</code> value is specified as epoch time, which is the number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable time;

@end

/**
 
 */
@interface AWSLogsGetLogGroupFieldsResponse : AWSModel


/**
 <p>The array of fields found in the query. Each object in the array contains the name of the field, along with the percentage of time it appeared in the log events that were queried.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsLogGroupField *> * _Nullable logGroupFields;

@end

/**
 
 */
@interface AWSLogsGetLogRecordRequest : AWSRequest


/**
 <p>The pointer corresponding to the log event record you want to retrieve. You get this from the response of a <code>GetQueryResults</code> operation. In that response, the value of the <code>@ptr</code> field for a log event is the value to use as <code>logRecordPointer</code> to retrieve that complete log event record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logRecordPointer;

/**
 <p>Specify <code>true</code> to display the log event fields with all sensitive data unmasked and visible. The default is <code>false</code>.</p><p>To use this operation with this parameter, you must be signed into an account with the <code>logs:Unmask</code> permission.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unmask;

@end

/**
 
 */
@interface AWSLogsGetLogRecordResponse : AWSModel


/**
 <p>The requested log event, as a JSON string.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable logRecord;

@end

/**
 
 */
@interface AWSLogsGetQueryResultsRequest : AWSRequest


/**
 <p>The ID number of the query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryId;

@end

/**
 
 */
@interface AWSLogsGetQueryResultsResponse : AWSModel


/**
 <p>The log events that matched the query criteria during the most recent time it ran.</p><p>The <code>results</code> value is an array of arrays. Each log event is one object in the top-level array. Each of these log event objects is an array of <code>field</code>/<code>value</code> pairs.</p>
 */
@property (nonatomic, strong) NSArray<NSArray<AWSLogsResultField *> *> * _Nullable results;

/**
 <p>Includes the number of log events scanned by the query, the number of log events that matched the query criteria, and the total number of bytes in the log events that were scanned. These values reflect the full raw results of the query.</p>
 */
@property (nonatomic, strong) AWSLogsQueryStatistics * _Nullable statistics;

/**
 <p>The status of the most recent running of the query. Possible values are <code>Cancelled</code>, <code>Complete</code>, <code>Failed</code>, <code>Running</code>, <code>Scheduled</code>, <code>Timeout</code>, and <code>Unknown</code>.</p><p>Queries time out after 60 minutes of runtime. To avoid having your queries time out, reduce the time range being searched or partition your query into a number of queries.</p>
 */
@property (nonatomic, assign) AWSLogsQueryStatus status;

@end

/**
 <p>Represents a log event, which is a record of activity that was recorded by the application or resource being monitored.</p>
 Required parameters: [timestamp, message]
 */
@interface AWSLogsInputLogEvent : AWSModel


/**
 <p>The raw event message. Each log event can be no larger than 256 KB.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The time the event occurred, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 
 */
@interface AWSLogsListTagsForResourceRequest : AWSRequest


/**
 <p>The ARN of the resource that you want to view tags for.</p><p>The ARN format of a log group is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:log-group:<i>log-group-name</i></code></p><p>The ARN format of a destination is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:destination:<i>destination-name</i></code></p><p>For more information about ARN format, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html">CloudWatch Logs resources and operations</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSLogsListTagsForResourceResponse : AWSModel


/**
 <p>The list of tags associated with the requested resource.&gt;</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLogsListTagsLogGroupRequest : AWSRequest


/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

@end

/**
 
 */
@interface AWSLogsListTagsLogGroupResponse : AWSModel


/**
 <p>The tags for the log group.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Represents a log group.</p>
 */
@interface AWSLogsLogGroup : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The creation time of the log group, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable creationTime;

/**
 <p>Displays whether this log group has a protection policy, or whether it had one in the past. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html">PutDataProtectionPolicy</a>.</p>
 */
@property (nonatomic, assign) AWSLogsDataProtectionStatus dataProtectionStatus;

/**
 <p>Displays all the properties that this log group has inherited from account-level settings.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inheritedProperties;

/**
 <p>The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The number of metric filters.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable metricFilterCount;

/**
 <p>The number of days to retain the log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, and 3653.</p><p>To set a log group so that its log events do not expire, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DeleteRetentionPolicy.html">DeleteRetentionPolicy</a>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retentionInDays;

/**
 <p>The number of bytes stored.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storedBytes;

@end

/**
 <p>The fields contained in log events found by a <code>GetLogGroupFields</code> operation, along with the percentage of queried log events in which each field appears.</p>
 */
@interface AWSLogsLogGroupField : AWSModel


/**
 <p>The name of a log field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The percentage of log events queried that contained the field.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable percent;

@end

/**
 <p>Represents a log stream, which is a sequence of log events from a single emitter of logs.</p>
 */
@interface AWSLogsLogStream : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the log stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The creation time of the stream, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable creationTime;

/**
 <p>The time of the first event, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable firstEventTimestamp;

/**
 <p>The time of the most recent log event in the log stream in CloudWatch Logs. This number is expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. The <code>lastEventTime</code> value updates on an eventual consistency basis. It typically updates in less than an hour from ingestion, but in rare situations might take longer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lastEventTimestamp;

/**
 <p>The ingestion time, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code> The <code>lastIngestionTime</code> value updates on an eventual consistency basis. It typically updates in less than an hour after ingestion, but in rare situations might take longer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lastIngestionTime;

/**
 <p>The name of the log stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logStreamName;

/**
 <p>The number of bytes stored.</p><p><b>Important:</b> As of June 17, 2019, this parameter is no longer supported for log streams, and is always reported as zero. This change applies only to log streams. The <code>storedBytes</code> parameter for log groups is not affected.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable storedBytes;

/**
 <p>The sequence token.</p><important><p>The sequence token is now ignored in <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are always accepted regardless of receiving an invalid sequence token. You don't need to obtain <code>uploadSequenceToken</code> to use a <code>PutLogEvents</code> action.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable uploadSequenceToken;

@end

/**
 <p>Metric filters express how CloudWatch Logs would extract metric observations from ingested log events and transform them into metric data in a CloudWatch metric.</p>
 */
@interface AWSLogsMetricFilter : AWSModel


/**
 <p>The creation time of the metric filter, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable creationTime;

/**
 <p>The name of the metric filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterName;

/**
 <p>A symbolic description of how CloudWatch Logs should interpret the data in each log event. For example, a log event can contain timestamps, IP addresses, strings, and so on. You use the filter pattern to specify what to look for in the log event message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterPattern;

/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The metric transformations.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsMetricTransformation *> * _Nullable metricTransformations;

@end

/**
 <p>Represents a matched event.</p>
 */
@interface AWSLogsMetricFilterMatchRecord : AWSModel


/**
 <p>The raw event data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventMessage;

/**
 <p>The event number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable eventNumber;

/**
 <p>The values extracted from the event data by the filter.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable extractedValues;

@end

/**
 <p>Indicates how to transform ingested log events to metric data in a CloudWatch metric.</p>
 Required parameters: [metricName, metricNamespace, metricValue]
 */
@interface AWSLogsMetricTransformation : AWSModel


/**
 <p>(Optional) The value to emit when a filter pattern does not match a log event. This value can be null.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultValue;

/**
 <p>The fields to use as dimensions for the metric. One metric filter can include as many as three dimensions.</p><important><p>Metrics extracted from log events are charged as custom metrics. To prevent unexpected high charges, do not specify high-cardinality fields such as <code>IPAddress</code> or <code>requestID</code> as dimensions. Each different value found for a dimension is treated as a separate metric and accrues charges as a separate custom metric. </p><p>CloudWatch Logs disables a metric filter if it generates 1000 different name/value pairs for your specified dimensions within a certain amount of time. This helps to prevent accidental high charges.</p><p>You can also set up a billing alarm to alert you if your charges are higher than expected. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html"> Creating a Billing Alarm to Monitor Your Estimated Amazon Web Services Charges</a>. </p></important>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable dimensions;

/**
 <p>The name of the CloudWatch metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>A custom namespace to contain your metric in CloudWatch. Use namespaces to group together metrics that are similar. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Namespace">Namespaces</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricNamespace;

/**
 <p>The value to publish to the CloudWatch metric when a filter pattern matches a log event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricValue;

/**
 <p>The unit to assign to the metric. If you omit this, the unit is set as <code>None</code>.</p>
 */
@property (nonatomic, assign) AWSLogsStandardUnit unit;

@end

/**
 <p>Represents a log event.</p>
 */
@interface AWSLogsOutputLogEvent : AWSModel


/**
 <p>The time the event was ingested, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ingestionTime;

/**
 <p>The data contained in the log event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The time the event occurred, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timestamp;

@end

/**
 
 */
@interface AWSLogsPutAccountPolicyRequest : AWSRequest


/**
 <p>Specify the data protection policy, in JSON.</p><p>This policy must include two JSON blocks:</p><ul><li><p>The first block must include both a <code>DataIdentifer</code> array and an <code>Operation</code> property with an <code>Audit</code> action. The <code>DataIdentifer</code> array lists the types of sensitive data that you want to mask. For more information about the available options, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data-types.html">Types of data that you can mask</a>.</p><p>The <code>Operation</code> property with an <code>Audit</code> action is required to find the sensitive data terms. This <code>Audit</code> action must contain a <code>FindingsDestination</code> object. You can optionally use that <code>FindingsDestination</code> object to list one or more destinations to send audit findings to. If you specify destinations such as log groups, Kinesis Data Firehose streams, and S3 buckets, they must already exist.</p></li><li><p>The second block must include both a <code>DataIdentifer</code> array and an <code>Operation</code> property with an <code>Deidentify</code> action. The <code>DataIdentifer</code> array must exactly match the <code>DataIdentifer</code> array in the first block of the policy.</p><p>The <code>Operation</code> property with the <code>Deidentify</code> action is what actually masks the data, and it must contain the <code> "MaskConfig": {}</code> object. The <code> "MaskConfig": {}</code> object must be empty.</p></li></ul><p>For an example data protection policy, see the <b>Examples</b> section on this page.</p><important><p>The contents of the two <code>DataIdentifer</code> arrays must match exactly.</p></important><p>In addition to the two JSON blocks, the <code>policyDocument</code> can also include <code>Name</code>, <code>Description</code>, and <code>Version</code> fields. The <code>Name</code> is different than the operation's <code>policyName</code> parameter, and is used as a dimension when CloudWatch Logs reports audit findings metrics to CloudWatch.</p><p>The JSON specified in <code>policyDocument</code> can be up to 30,720 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>A name for the policy. This must be unique within the account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>Currently the only valid value for this parameter is <code>DATA_PROTECTION_POLICY</code>.</p>
 */
@property (nonatomic, assign) AWSLogsPolicyType policyType;

/**
 <p>Currently the only valid value for this parameter is <code>GLOBAL</code>, which specifies that the data protection policy applies to all log groups in the account. If you omit this parameter, the default of <code>GLOBAL</code> is used.</p>
 */
@property (nonatomic, assign) AWSLogsScope scope;

@end

/**
 
 */
@interface AWSLogsPutAccountPolicyResponse : AWSModel


/**
 <p>The account policy that you created.</p>
 */
@property (nonatomic, strong) AWSLogsAccountPolicy * _Nullable accountPolicy;

@end

/**
 
 */
@interface AWSLogsPutDataProtectionPolicyRequest : AWSRequest


/**
 <p>Specify either the log group name or log group ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupIdentifier;

/**
 <p>Specify the data protection policy, in JSON.</p><p>This policy must include two JSON blocks:</p><ul><li><p>The first block must include both a <code>DataIdentifer</code> array and an <code>Operation</code> property with an <code>Audit</code> action. The <code>DataIdentifer</code> array lists the types of sensitive data that you want to mask. For more information about the available options, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data-types.html">Types of data that you can mask</a>.</p><p>The <code>Operation</code> property with an <code>Audit</code> action is required to find the sensitive data terms. This <code>Audit</code> action must contain a <code>FindingsDestination</code> object. You can optionally use that <code>FindingsDestination</code> object to list one or more destinations to send audit findings to. If you specify destinations such as log groups, Kinesis Data Firehose streams, and S3 buckets, they must already exist.</p></li><li><p>The second block must include both a <code>DataIdentifer</code> array and an <code>Operation</code> property with an <code>Deidentify</code> action. The <code>DataIdentifer</code> array must exactly match the <code>DataIdentifer</code> array in the first block of the policy.</p><p>The <code>Operation</code> property with the <code>Deidentify</code> action is what actually masks the data, and it must contain the <code> "MaskConfig": {}</code> object. The <code> "MaskConfig": {}</code> object must be empty.</p></li></ul><p>For an example data protection policy, see the <b>Examples</b> section on this page.</p><important><p>The contents of the two <code>DataIdentifer</code> arrays must match exactly.</p></important><p>In addition to the two JSON blocks, the <code>policyDocument</code> can also include <code>Name</code>, <code>Description</code>, and <code>Version</code> fields. The <code>Name</code> is used as a dimension when CloudWatch Logs reports audit findings metrics to CloudWatch.</p><p>The JSON specified in <code>policyDocument</code> can be up to 30,720 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

@end

/**
 
 */
@interface AWSLogsPutDataProtectionPolicyResponse : AWSModel


/**
 <p>The date and time that this policy was most recently updated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lastUpdatedTime;

/**
 <p>The log group name or ARN that you specified in your request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupIdentifier;

/**
 <p>The data protection policy used for this log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

@end

/**
 
 */
@interface AWSLogsPutDestinationPolicyRequest : AWSRequest


/**
 <p>An IAM policy document that authorizes cross-account users to deliver their log events to the associated destination. This can be up to 5120 bytes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicy;

/**
 <p>A name for an existing destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationName;

/**
 <p>Specify true if you are updating an existing destination policy to grant permission to an organization ID instead of granting permission to individual Amazon Web Services accounts. Before you update a destination policy this way, you must first update the subscription filters in the accounts that send logs to this destination. If you do not, the subscription filters might stop working. By specifying <code>true</code> for <code>forceUpdate</code>, you are affirming that you have already updated the subscription filters. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Cross-Account-Log_Subscription-Update.html"> Updating an existing cross-account subscription</a></p><p>If you omit this parameter, the default of <code>false</code> is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceUpdate;

@end

/**
 
 */
@interface AWSLogsPutDestinationRequest : AWSRequest


/**
 <p>A name for the destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationName;

/**
 <p>The ARN of an IAM role that grants CloudWatch Logs permissions to call the Amazon Kinesis <code>PutRecord</code> operation on the destination stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>An optional list of key-value pairs to associate with the resource.</p><p>For more information about tagging, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging Amazon Web Services resources</a></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The ARN of an Amazon Kinesis stream to which to deliver matching log events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 
 */
@interface AWSLogsPutDestinationResponse : AWSModel


/**
 <p>The destination.</p>
 */
@property (nonatomic, strong) AWSLogsDestination * _Nullable destination;

@end

/**
 
 */
@interface AWSLogsPutLogEventsRequest : AWSRequest


/**
 <p>The log events.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsInputLogEvent *> * _Nullable logEvents;

/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The name of the log stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logStreamName;

/**
 <p>The sequence token obtained from the response of the previous <code>PutLogEvents</code> call.</p><important><p>The <code>sequenceToken</code> parameter is now ignored in <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are now accepted and never return <code>InvalidSequenceTokenException</code> or <code>DataAlreadyAcceptedException</code> even if the sequence token is not valid.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable sequenceToken;

@end

/**
 
 */
@interface AWSLogsPutLogEventsResponse : AWSModel


/**
 <p>The next sequence token.</p><important><p>This field has been deprecated.</p><p>The sequence token is now ignored in <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are always accepted even if the sequence token is not valid. You can use parallel <code>PutLogEvents</code> actions on the same log stream and you do not need to wait for the response of a previous <code>PutLogEvents</code> action to obtain the <code>nextSequenceToken</code> value.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable nextSequenceToken;

/**
 <p>The rejected events.</p>
 */
@property (nonatomic, strong) AWSLogsRejectedLogEventsInfo * _Nullable rejectedLogEventsInfo;

@end

/**
 
 */
@interface AWSLogsPutMetricFilterRequest : AWSRequest


/**
 <p>A name for the metric filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterName;

/**
 <p>A filter pattern for extracting metric data out of ingested log events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterPattern;

/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>A collection of information that defines how metric data gets emitted.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsMetricTransformation *> * _Nullable metricTransformations;

@end

/**
 
 */
@interface AWSLogsPutQueryDefinitionRequest : AWSRequest


/**
 <p>Use this parameter to include specific log groups as part of your query definition.</p><p>If you are updating a query definition and you omit this parameter, then the updated definition will contain no log groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logGroupNames;

/**
 <p>A name for the query definition. If you are saving numerous query definitions, we recommend that you name them. This way, you can find the ones you want by using the first part of the name as a filter in the <code>queryDefinitionNamePrefix</code> parameter of <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html">DescribeQueryDefinitions</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>If you are updating a query definition, use this parameter to specify the ID of the query definition that you want to update. You can use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html">DescribeQueryDefinitions</a> to retrieve the IDs of your saved query definitions.</p><p>If you are creating a query definition, do not specify this parameter. CloudWatch generates a unique ID for the new query definition and include it in the response to this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryDefinitionId;

/**
 <p>The query string to use for this definition. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch Logs Insights Query Syntax</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

@end

/**
 
 */
@interface AWSLogsPutQueryDefinitionResponse : AWSModel


/**
 <p>The ID of the query definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryDefinitionId;

@end

/**
 
 */
@interface AWSLogsPutResourcePolicyRequest : AWSRequest


/**
 <p>Details of the new policy, including the identity of the principal that is enabled to put logs to this account. This is formatted as a JSON string. This parameter is required.</p><p>The following example creates a resource policy enabling the Route 53 service to put DNS query logs in to the specified log group. Replace <code>"logArn"</code> with the ARN of your CloudWatch Logs resource, such as a log group or log stream.</p><p>CloudWatch Logs also supports <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourcearn">aws:SourceArn</a> and <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourceaccount">aws:SourceAccount</a> condition context keys.</p><p>In the example resource policy, you would replace the value of <code>SourceArn</code> with the resource making the call from Route 53 to CloudWatch Logs. You would also replace the value of <code>SourceAccount</code> with the Amazon Web Services account ID making that call.</p><p/><p><code>{ "Version": "2012-10-17", "Statement": [ { "Sid": "Route53LogsToCloudWatchLogs", "Effect": "Allow", "Principal": { "Service": [ "route53.amazonaws.com" ] }, "Action": "logs:PutLogEvents", "Resource": "logArn", "Condition": { "ArnLike": { "aws:SourceArn": "myRoute53ResourceArn" }, "StringEquals": { "aws:SourceAccount": "myAwsAccountId" } } } ] }</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>Name of the new policy. This parameter is required.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSLogsPutResourcePolicyResponse : AWSModel


/**
 <p>The new policy.</p>
 */
@property (nonatomic, strong) AWSLogsResourcePolicy * _Nullable resourcePolicy;

@end

/**
 
 */
@interface AWSLogsPutRetentionPolicyRequest : AWSRequest


/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The number of days to retain the log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, and 3653.</p><p>To set a log group so that its log events do not expire, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DeleteRetentionPolicy.html">DeleteRetentionPolicy</a>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retentionInDays;

@end

/**
 
 */
@interface AWSLogsPutSubscriptionFilterRequest : AWSRequest


/**
 <p>The ARN of the destination to deliver matching log events to. Currently, the supported destinations are:</p><ul><li><p>An Amazon Kinesis stream belonging to the same account as the subscription filter, for same-account delivery.</p></li><li><p>A logical destination (specified using an ARN) belonging to a different account, for cross-account delivery.</p><p>If you're setting up a cross-account subscription, the destination must have an IAM policy associated with it. The IAM policy must allow the sender to send logs to the destination. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html">PutDestinationPolicy</a>.</p></li><li><p>A Kinesis Data Firehose delivery stream belonging to the same account as the subscription filter, for same-account delivery.</p></li><li><p>A Lambda function belonging to the same account as the subscription filter, for same-account delivery.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable destinationArn;

/**
 <p>The method used to distribute log data to the destination. By default, log data is grouped by log stream, but the grouping can be set to random for a more even distribution. This property is only applicable when the destination is an Amazon Kinesis data stream. </p>
 */
@property (nonatomic, assign) AWSLogsDistribution distribution;

/**
 <p>A name for the subscription filter. If you are updating an existing filter, you must specify the correct name in <code>filterName</code>. To find the name of the filter currently associated with a log group, use <a href="https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeSubscriptionFilters.html">DescribeSubscriptionFilters</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterName;

/**
 <p>A filter pattern for subscribing to a filtered stream of log events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterPattern;

/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The ARN of an IAM role that grants CloudWatch Logs permissions to deliver ingested log events to the destination stream. You don't need to provide the ARN when you are working with a logical destination for cross-account delivery.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Reserved.</p>
 */
@interface AWSLogsQueryCompileError : AWSModel


/**
 <p>Reserved.</p>
 */
@property (nonatomic, strong) AWSLogsQueryCompileErrorLocation * _Nullable location;

/**
 <p>Reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Reserved.</p>
 */
@interface AWSLogsQueryCompileErrorLocation : AWSModel


/**
 <p>Reserved.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endCharOffset;

/**
 <p>Reserved.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startCharOffset;

@end

/**
 <p>This structure contains details about a saved CloudWatch Logs Insights query definition.</p>
 */
@interface AWSLogsQueryDefinition : AWSModel


/**
 <p>The date that the query definition was most recently modified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lastModified;

/**
 <p>If this query definition contains a list of log groups that it is limited to, that list appears here.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logGroupNames;

/**
 <p>The name of the query definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique ID of the query definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryDefinitionId;

/**
 <p>The query string to use for this definition. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch Logs Insights Query Syntax</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

@end

/**
 <p>Information about one CloudWatch Logs Insights query that matches the request in a <code>DescribeQueries</code> operation. </p>
 */
@interface AWSLogsQueryInfo : AWSModel


/**
 <p>The date and time that this query was created.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable createTime;

/**
 <p>The name of the log group scanned by this query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The unique ID number of this query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryId;

/**
 <p>The query string used in this query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The status of this query. Possible values are <code>Cancelled</code>, <code>Complete</code>, <code>Failed</code>, <code>Running</code>, <code>Scheduled</code>, and <code>Unknown</code>.</p>
 */
@property (nonatomic, assign) AWSLogsQueryStatus status;

@end

/**
 <p>Contains the number of log events scanned by the query, the number of log events that matched the query criteria, and the total number of bytes in the log events that were scanned.</p>
 */
@interface AWSLogsQueryStatistics : AWSModel


/**
 <p>The total number of bytes in the log events scanned during the query.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesScanned;

/**
 <p>The number of log events that matched the query string.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recordsMatched;

/**
 <p>The total number of log events scanned during the query.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recordsScanned;

@end

/**
 <p>Represents the rejected events.</p>
 */
@interface AWSLogsRejectedLogEventsInfo : AWSModel


/**
 <p>The expired log events.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expiredLogEventEndIndex;

/**
 <p>The log events that are too new.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tooNewLogEventStartIndex;

/**
 <p>The log events that are dated too far in the past.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tooOldLogEventEndIndex;

@end

/**
 <p>A policy enabling one or more entities to put logs to a log group in this account.</p>
 */
@interface AWSLogsResourcePolicy : AWSModel


/**
 <p>Timestamp showing when this policy was last updated, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lastUpdatedTime;

/**
 <p>The details of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The name of the resource policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Contains one field from one log event returned by a CloudWatch Logs Insights query, along with the value of that field.</p><p>For more information about the fields that are generated by CloudWatch logs, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html">Supported Logs and Discovered Fields</a>.</p>
 */
@interface AWSLogsResultField : AWSModel


/**
 <p>The log event field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable field;

/**
 <p>The value of this field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Represents the search status of a log stream.</p>
 */
@interface AWSLogsSearchedLogStream : AWSModel


/**
 <p>The name of the log stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logStreamName;

/**
 <p>Indicates whether all the events in this log stream were searched.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable searchedCompletely;

@end

/**
 
 */
@interface AWSLogsStartQueryRequest : AWSRequest


/**
 <p>The end of the time range to query. The range is inclusive, so the specified end time is included in the query. Specified as epoch time, the number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endTime;

/**
 <p>The maximum number of log events to return in the query. If the query string uses the <code>fields</code> command, only the specified fields and their values are returned. The default is 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The list of log groups to query. You can include up to 50 log groups.</p><p>You can specify them by the log group name or ARN. If a log group that you're querying is in a source account and you're using a monitoring account, you must specify the ARN of the log group here. The query definition must also be defined in the monitoring account.</p><p>If you specify an ARN, the ARN can't end with an asterisk (*).</p><p>A <code>StartQuery</code> operation must include exactly one of the following parameters: <code>logGroupName</code>, <code>logGroupNames</code> or <code>logGroupIdentifiers</code>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logGroupIdentifiers;

/**
 <p>The log group on which to perform the query.</p><note><p>A <code>StartQuery</code> operation must include exactly one of the following parameters: <code>logGroupName</code>, <code>logGroupNames</code> or <code>logGroupIdentifiers</code>. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The list of log groups to be queried. You can include up to 50 log groups.</p><note><p>A <code>StartQuery</code> operation must include exactly one of the following parameters: <code>logGroupName</code>, <code>logGroupNames</code> or <code>logGroupIdentifiers</code>. </p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logGroupNames;

/**
 <p>The query string to use. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">CloudWatch Logs Insights Query Syntax</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryString;

/**
 <p>The beginning of the time range to query. The range is inclusive, so the specified start time is included in the query. Specified as epoch time, the number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startTime;

@end

/**
 
 */
@interface AWSLogsStartQueryResponse : AWSModel


/**
 <p>The unique ID of the query. </p>
 */
@property (nonatomic, strong) NSString * _Nullable queryId;

@end

/**
 
 */
@interface AWSLogsStopQueryRequest : AWSRequest


/**
 <p>The ID number of the query to stop. To find this ID number, use <code>DescribeQueries</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryId;

@end

/**
 
 */
@interface AWSLogsStopQueryResponse : AWSModel


/**
 <p>This is true if the query was stopped by the <code>StopQuery</code> operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable success;

@end

/**
 <p>Represents a subscription filter.</p>
 */
@interface AWSLogsSubscriptionFilter : AWSModel


/**
 <p>The creation time of the subscription filter, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable creationTime;

/**
 <p>The Amazon Resource Name (ARN) of the destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationArn;

/**
 <p>The method used to distribute log data to the destination, which can be either random or grouped by log stream.</p>
 */
@property (nonatomic, assign) AWSLogsDistribution distribution;

/**
 <p>The name of the subscription filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterName;

/**
 <p>A symbolic description of how CloudWatch Logs should interpret the data in each log event. For example, a log event can contain timestamps, IP addresses, strings, and so on. You use the filter pattern to specify what to look for in the log event message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterPattern;

/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 
 */
@interface AWSLogsTagLogGroupRequest : AWSRequest


/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The key-value pairs to use for the tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLogsTagResourceRequest : AWSRequest


/**
 <p>The ARN of the resource that you're adding tags to.</p><p>The ARN format of a log group is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:log-group:<i>log-group-name</i></code></p><p>The ARN format of a destination is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:destination:<i>destination-name</i></code></p><p>For more information about ARN format, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html">CloudWatch Logs resources and operations</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The list of key-value pairs to associate with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLogsTestMetricFilterRequest : AWSRequest


/**
 <p>A symbolic description of how CloudWatch Logs should interpret the data in each log event. For example, a log event can contain timestamps, IP addresses, strings, and so on. You use the filter pattern to specify what to look for in the log event message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterPattern;

/**
 <p>The log event messages to test.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logEventMessages;

@end

/**
 
 */
@interface AWSLogsTestMetricFilterResponse : AWSModel


/**
 <p>The matched events.</p>
 */
@property (nonatomic, strong) NSArray<AWSLogsMetricFilterMatchRecord *> * _Nullable matches;

@end

/**
 
 */
@interface AWSLogsUntagLogGroupRequest : AWSRequest


/**
 <p>The name of the log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The tag keys. The corresponding tags are removed from the log group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLogsUntagResourceRequest : AWSRequest


/**
 <p>The ARN of the CloudWatch Logs resource that you're removing tags from.</p><p>The ARN format of a log group is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:log-group:<i>log-group-name</i></code></p><p>The ARN format of a destination is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:destination:<i>destination-name</i></code></p><p>For more information about ARN format, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html">CloudWatch Logs resources and operations</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The list of tag keys to remove from the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

NS_ASSUME_NONNULL_END
