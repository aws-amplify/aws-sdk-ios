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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSKinesisErrorDomain;

typedef NS_ENUM(NSInteger, AWSKinesisErrorType) {
    AWSKinesisErrorUnknown,
    AWSKinesisErrorExpiredIterator,
    AWSKinesisErrorExpiredNextToken,
    AWSKinesisErrorInvalidArgument,
    AWSKinesisErrorKMSAccessDenied,
    AWSKinesisErrorKMSDisabled,
    AWSKinesisErrorKMSInvalidState,
    AWSKinesisErrorKMSNotFound,
    AWSKinesisErrorKMSOptInRequired,
    AWSKinesisErrorKMSThrottling,
    AWSKinesisErrorLimitExceeded,
    AWSKinesisErrorProvisionedThroughputExceeded,
    AWSKinesisErrorResourceInUse,
    AWSKinesisErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSKinesisEncryptionType) {
    AWSKinesisEncryptionTypeUnknown,
    AWSKinesisEncryptionTypeNone,
    AWSKinesisEncryptionTypeKms,
};

typedef NS_ENUM(NSInteger, AWSKinesisMetricsName) {
    AWSKinesisMetricsNameUnknown,
    AWSKinesisMetricsNameIncomingBytes,
    AWSKinesisMetricsNameIncomingRecords,
    AWSKinesisMetricsNameOutgoingBytes,
    AWSKinesisMetricsNameOutgoingRecords,
    AWSKinesisMetricsNameWriteProvisionedThroughputExceeded,
    AWSKinesisMetricsNameReadProvisionedThroughputExceeded,
    AWSKinesisMetricsNameIteratorAgeMilliseconds,
    AWSKinesisMetricsNameAll,
};

typedef NS_ENUM(NSInteger, AWSKinesisScalingType) {
    AWSKinesisScalingTypeUnknown,
    AWSKinesisScalingTypeUniformScaling,
};

typedef NS_ENUM(NSInteger, AWSKinesisShardIteratorType) {
    AWSKinesisShardIteratorTypeUnknown,
    AWSKinesisShardIteratorTypeAtSequenceNumber,
    AWSKinesisShardIteratorTypeAfterSequenceNumber,
    AWSKinesisShardIteratorTypeTrimHorizon,
    AWSKinesisShardIteratorTypeLatest,
    AWSKinesisShardIteratorTypeAtTimestamp,
};

typedef NS_ENUM(NSInteger, AWSKinesisStreamStatus) {
    AWSKinesisStreamStatusUnknown,
    AWSKinesisStreamStatusCreating,
    AWSKinesisStreamStatusDeleting,
    AWSKinesisStreamStatusActive,
    AWSKinesisStreamStatusUpdating,
};

@class AWSKinesisAddTagsToStreamInput;
@class AWSKinesisCreateStreamInput;
@class AWSKinesisDecreaseStreamRetentionPeriodInput;
@class AWSKinesisDeleteStreamInput;
@class AWSKinesisDescribeLimitsInput;
@class AWSKinesisDescribeLimitsOutput;
@class AWSKinesisDescribeStreamInput;
@class AWSKinesisDescribeStreamOutput;
@class AWSKinesisDescribeStreamSummaryInput;
@class AWSKinesisDescribeStreamSummaryOutput;
@class AWSKinesisDisableEnhancedMonitoringInput;
@class AWSKinesisEnableEnhancedMonitoringInput;
@class AWSKinesisEnhancedMetrics;
@class AWSKinesisEnhancedMonitoringOutput;
@class AWSKinesisGetRecordsInput;
@class AWSKinesisGetRecordsOutput;
@class AWSKinesisGetShardIteratorInput;
@class AWSKinesisGetShardIteratorOutput;
@class AWSKinesisHashKeyRange;
@class AWSKinesisIncreaseStreamRetentionPeriodInput;
@class AWSKinesisListShardsInput;
@class AWSKinesisListShardsOutput;
@class AWSKinesisListStreamsInput;
@class AWSKinesisListStreamsOutput;
@class AWSKinesisListTagsForStreamInput;
@class AWSKinesisListTagsForStreamOutput;
@class AWSKinesisMergeShardsInput;
@class AWSKinesisPutRecordInput;
@class AWSKinesisPutRecordOutput;
@class AWSKinesisPutRecordsInput;
@class AWSKinesisPutRecordsOutput;
@class AWSKinesisPutRecordsRequestEntry;
@class AWSKinesisPutRecordsResultEntry;
@class AWSKinesisRecord;
@class AWSKinesisRemoveTagsFromStreamInput;
@class AWSKinesisSequenceNumberRange;
@class AWSKinesisShard;
@class AWSKinesisSplitShardInput;
@class AWSKinesisStartStreamEncryptionInput;
@class AWSKinesisStopStreamEncryptionInput;
@class AWSKinesisStreamDescription;
@class AWSKinesisStreamDescriptionSummary;
@class AWSKinesisTag;
@class AWSKinesisUpdateShardCountInput;
@class AWSKinesisUpdateShardCountOutput;

/**
 <p>Represents the input for <code>AddTagsToStream</code>.</p>
 Required parameters: [StreamName, Tags]
 */
@interface AWSKinesisAddTagsToStreamInput : AWSRequest


/**
 <p>The name of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>The set of key-value pairs to use to create the tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Represents the input for <code>CreateStream</code>.</p>
 Required parameters: [StreamName, ShardCount]
 */
@interface AWSKinesisCreateStreamInput : AWSRequest


/**
 <p>The number of shards that the stream will use. The throughput of the stream is a function of the number of shards; more shards are required for greater provisioned throughput.</p><p>DefaultShardLimit;</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable shardCount;

/**
 <p>A name to identify the stream. The stream name is scoped to the AWS account used by the application that creates the stream. It is also scoped by AWS Region. That is, two streams in two different AWS accounts can have the same name. Two streams in the same AWS account but in two different Regions can also have the same name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Represents the input for <a>DecreaseStreamRetentionPeriod</a>.</p>
 Required parameters: [StreamName, RetentionPeriodHours]
 */
@interface AWSKinesisDecreaseStreamRetentionPeriodInput : AWSRequest


/**
 <p>The new retention period of the stream, in hours. Must be less than the current retention period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retentionPeriodHours;

/**
 <p>The name of the stream to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Represents the input for <a>DeleteStream</a>.</p>
 Required parameters: [StreamName]
 */
@interface AWSKinesisDeleteStreamInput : AWSRequest


/**
 <p>The name of the stream to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisDescribeLimitsInput : AWSRequest


@end

/**
 
 */
@interface AWSKinesisDescribeLimitsOutput : AWSModel


/**
 <p>The number of open shards.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable openShardCount;

/**
 <p>The maximum number of shards.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable shardLimit;

@end

/**
 <p>Represents the input for <code>DescribeStream</code>.</p>
 Required parameters: [StreamName]
 */
@interface AWSKinesisDescribeStreamInput : AWSRequest


/**
 <p>The shard ID of the shard to start with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exclusiveStartShardId;

/**
 <p>The maximum number of shards to return in a single call. The default value is 100. If you specify a value greater than 100, at most 100 shards are returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The name of the stream to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Represents the output for <code>DescribeStream</code>.</p>
 Required parameters: [StreamDescription]
 */
@interface AWSKinesisDescribeStreamOutput : AWSModel


/**
 <p>The current status of the stream, the stream Amazon Resource Name (ARN), an array of shard objects that comprise the stream, and whether there are more shards available.</p>
 */
@property (nonatomic, strong) AWSKinesisStreamDescription * _Nullable streamDescription;

@end

/**
 
 */
@interface AWSKinesisDescribeStreamSummaryInput : AWSRequest


/**
 <p>The name of the stream to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisDescribeStreamSummaryOutput : AWSModel


/**
 <p>A <a>StreamDescriptionSummary</a> containing information about the stream.</p>
 */
@property (nonatomic, strong) AWSKinesisStreamDescriptionSummary * _Nullable streamDescriptionSummary;

@end

/**
 <p>Represents the input for <a>DisableEnhancedMonitoring</a>.</p>
 Required parameters: [StreamName, ShardLevelMetrics]
 */
@interface AWSKinesisDisableEnhancedMonitoringInput : AWSRequest


/**
 <p>List of shard-level metrics to disable.</p><p>The following are the valid shard-level metrics. The value "<code>ALL</code>" disables every metric.</p><ul><li><p><code>IncomingBytes</code></p></li><li><p><code>IncomingRecords</code></p></li><li><p><code>OutgoingBytes</code></p></li><li><p><code>OutgoingRecords</code></p></li><li><p><code>WriteProvisionedThroughputExceeded</code></p></li><li><p><code>ReadProvisionedThroughputExceeded</code></p></li><li><p><code>IteratorAgeMilliseconds</code></p></li><li><p><code>ALL</code></p></li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html">Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch</a> in the <i>Amazon Kinesis Data Streams Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable shardLevelMetrics;

/**
 <p>The name of the Kinesis data stream for which to disable enhanced monitoring.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Represents the input for <a>EnableEnhancedMonitoring</a>.</p>
 Required parameters: [StreamName, ShardLevelMetrics]
 */
@interface AWSKinesisEnableEnhancedMonitoringInput : AWSRequest


/**
 <p>List of shard-level metrics to enable.</p><p>The following are the valid shard-level metrics. The value "<code>ALL</code>" enables every metric.</p><ul><li><p><code>IncomingBytes</code></p></li><li><p><code>IncomingRecords</code></p></li><li><p><code>OutgoingBytes</code></p></li><li><p><code>OutgoingRecords</code></p></li><li><p><code>WriteProvisionedThroughputExceeded</code></p></li><li><p><code>ReadProvisionedThroughputExceeded</code></p></li><li><p><code>IteratorAgeMilliseconds</code></p></li><li><p><code>ALL</code></p></li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html">Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch</a> in the <i>Amazon Kinesis Data Streams Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable shardLevelMetrics;

/**
 <p>The name of the stream for which to enable enhanced monitoring.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Represents enhanced metrics types.</p>
 */
@interface AWSKinesisEnhancedMetrics : AWSModel


/**
 <p>List of shard-level metrics.</p><p>The following are the valid shard-level metrics. The value "<code>ALL</code>" enhances every metric.</p><ul><li><p><code>IncomingBytes</code></p></li><li><p><code>IncomingRecords</code></p></li><li><p><code>OutgoingBytes</code></p></li><li><p><code>OutgoingRecords</code></p></li><li><p><code>WriteProvisionedThroughputExceeded</code></p></li><li><p><code>ReadProvisionedThroughputExceeded</code></p></li><li><p><code>IteratorAgeMilliseconds</code></p></li><li><p><code>ALL</code></p></li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html">Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch</a> in the <i>Amazon Kinesis Data Streams Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable shardLevelMetrics;

@end

/**
 <p>Represents the output for <a>EnableEnhancedMonitoring</a> and <a>DisableEnhancedMonitoring</a>.</p>
 */
@interface AWSKinesisEnhancedMonitoringOutput : AWSModel


/**
 <p>Represents the current state of the metrics that are in the enhanced state before the operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable currentShardLevelMetrics;

/**
 <p>Represents the list of all the metrics that would be in the enhanced state after the operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable desiredShardLevelMetrics;

/**
 <p>The name of the Kinesis data stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Represents the input for <a>GetRecords</a>.</p>
 Required parameters: [ShardIterator]
 */
@interface AWSKinesisGetRecordsInput : AWSRequest


/**
 <p>The maximum number of records to return. Specify a value of up to 10,000. If you specify a value that is greater than 10,000, <a>GetRecords</a> throws <code>InvalidArgumentException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The position in the shard from which you want to start sequentially reading data records. A shard iterator specifies this position using the sequence number of a data record in the shard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shardIterator;

@end

/**
 <p>Represents the output for <a>GetRecords</a>.</p>
 Required parameters: [Records]
 */
@interface AWSKinesisGetRecordsOutput : AWSModel


/**
 <p>The number of milliseconds the <a>GetRecords</a> response is from the tip of the stream, indicating how far behind current time the consumer is. A value of zero indicates that record processing is caught up, and there are no new records to process at this moment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable millisBehindLatest;

/**
 <p>The next position in the shard from which to start sequentially reading data records. If set to <code>null</code>, the shard has been closed and the requested iterator does not return any more data. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextShardIterator;

/**
 <p>The data records retrieved from the shard.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisRecord *> * _Nullable records;

@end

/**
 <p>Represents the input for <code>GetShardIterator</code>.</p>
 Required parameters: [StreamName, ShardId, ShardIteratorType]
 */
@interface AWSKinesisGetShardIteratorInput : AWSRequest


/**
 <p>The shard ID of the Kinesis Data Streams shard to get the iterator for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shardId;

/**
 <p>Determines how the shard iterator is used to start reading data records from the shard.</p><p>The following are the valid Amazon Kinesis shard iterator types:</p><ul><li><p>AT_SEQUENCE_NUMBER - Start reading from the position denoted by a specific sequence number, provided in the value <code>StartingSequenceNumber</code>.</p></li><li><p>AFTER_SEQUENCE_NUMBER - Start reading right after the position denoted by a specific sequence number, provided in the value <code>StartingSequenceNumber</code>.</p></li><li><p>AT_TIMESTAMP - Start reading from the position denoted by a specific time stamp, provided in the value <code>Timestamp</code>.</p></li><li><p>TRIM_HORIZON - Start reading at the last untrimmed record in the shard in the system, which is the oldest data record in the shard.</p></li><li><p>LATEST - Start reading just after the most recent record in the shard, so that you always read the most recent data in the shard.</p></li></ul>
 */
@property (nonatomic, assign) AWSKinesisShardIteratorType shardIteratorType;

/**
 <p>The sequence number of the data record in the shard from which to start reading. Used with shard iterator type AT_SEQUENCE_NUMBER and AFTER_SEQUENCE_NUMBER.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startingSequenceNumber;

/**
 <p>The name of the Amazon Kinesis data stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>The time stamp of the data record from which to start reading. Used with shard iterator type AT_TIMESTAMP. A time stamp is the Unix epoch date with precision in milliseconds. For example, <code>2016-04-04T19:58:46.480-00:00</code> or <code>1459799926.480</code>. If a record with this exact time stamp does not exist, the iterator returned is for the next (later) record. If the time stamp is older than the current trim horizon, the iterator returned is for the oldest untrimmed data record (TRIM_HORIZON).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 <p>Represents the output for <code>GetShardIterator</code>.</p>
 */
@interface AWSKinesisGetShardIteratorOutput : AWSModel


/**
 <p>The position in the shard from which to start reading data records sequentially. A shard iterator specifies this position using the sequence number of a data record in a shard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shardIterator;

@end

/**
 <p>The range of possible hash key values for the shard, which is a set of ordered contiguous positive integers.</p>
 Required parameters: [StartingHashKey, EndingHashKey]
 */
@interface AWSKinesisHashKeyRange : AWSModel


/**
 <p>The ending hash key of the hash key range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endingHashKey;

/**
 <p>The starting hash key of the hash key range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startingHashKey;

@end

/**
 <p>Represents the input for <a>IncreaseStreamRetentionPeriod</a>.</p>
 Required parameters: [StreamName, RetentionPeriodHours]
 */
@interface AWSKinesisIncreaseStreamRetentionPeriodInput : AWSRequest


/**
 <p>The new retention period of the stream, in hours. Must be more than the current retention period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retentionPeriodHours;

/**
 <p>The name of the stream to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisListShardsInput : AWSRequest


/**
 <p>The ID of the shard to start the list with. </p><p>If you don't specify this parameter, the default behavior is for <code>ListShards</code> to list the shards starting with the first one in the stream.</p><p>You cannot specify this parameter if you specify <code>NextToken</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exclusiveStartShardId;

/**
 <p>The maximum number of shards to return in a single call to <code>ListShards</code>. The minimum value you can specify for this parameter is 1, and the maximum is 1,000, which is also the default.</p><p>When the number of shards to be listed is greater than the value of <code>MaxResults</code>, the response contains a <code>NextToken</code> value that you can use in a subsequent call to <code>ListShards</code> to list the next set of shards.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>When the number of shards in the data stream is greater than the default value for the <code>MaxResults</code> parameter, or if you explicitly specify a value for <code>MaxResults</code> that is less than the number of shards in the data stream, the response includes a pagination token named <code>NextToken</code>. You can specify this <code>NextToken</code> value in a subsequent call to <code>ListShards</code> to list the next set of shards.</p><p>Don't specify <code>StreamName</code> or <code>StreamCreationTimestamp</code> if you specify <code>NextToken</code> because the latter unambiguously identifies the stream.</p><p>You can optionally specify a value for the <code>MaxResults</code> parameter when you specify <code>NextToken</code>. If you specify a <code>MaxResults</code> value that is less than the number of shards that the operation returns if you don't specify <code>MaxResults</code>, the response will contain a new <code>NextToken</code> value. You can use the new <code>NextToken</code> value in a subsequent call to the <code>ListShards</code> operation.</p><important><p>Tokens expire after 300 seconds. When you obtain a value for <code>NextToken</code> in the response to a call to <code>ListShards</code>, you have 300 seconds to use that value. If you specify an expired token in a call to <code>ListShards</code>, you get <code>ExpiredNextTokenException</code>.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specify this input parameter to distinguish data streams that have the same name. For example, if you create a data stream and then delete it, and you later create another data stream with the same name, you can use this input parameter to specify which of the two streams you want to list the shards for.</p><p>You cannot specify this parameter if you specify the <code>NextToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable streamCreationTimestamp;

/**
 <p>The name of the data stream whose shards you want to list. </p><p>You cannot specify this parameter if you specify the <code>NextToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisListShardsOutput : AWSModel


/**
 <p>When the number of shards in the data stream is greater than the default value for the <code>MaxResults</code> parameter, or if you explicitly specify a value for <code>MaxResults</code> that is less than the number of shards in the data stream, the response includes a pagination token named <code>NextToken</code>. You can specify this <code>NextToken</code> value in a subsequent call to <code>ListShards</code> to list the next set of shards. For more information about the use of this pagination token when calling the <code>ListShards</code> operation, see <a>ListShardsInput$NextToken</a>.</p><important><p>Tokens expire after 300 seconds. When you obtain a value for <code>NextToken</code> in the response to a call to <code>ListShards</code>, you have 300 seconds to use that value. If you specify an expired token in a call to <code>ListShards</code>, you get <code>ExpiredNextTokenException</code>.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of JSON objects. Each object represents one shard and specifies the IDs of the shard, the shard's parent, and the shard that's adjacent to the shard's parent. Each object also contains the starting and ending hash keys and the starting and ending sequence numbers for the shard.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisShard *> * _Nullable shards;

@end

/**
 <p>Represents the input for <code>ListStreams</code>.</p>
 */
@interface AWSKinesisListStreamsInput : AWSRequest


/**
 <p>The name of the stream to start the list with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exclusiveStartStreamName;

/**
 <p>The maximum number of streams to list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

@end

/**
 <p>Represents the output for <code>ListStreams</code>.</p>
 Required parameters: [StreamNames, HasMoreStreams]
 */
@interface AWSKinesisListStreamsOutput : AWSModel


/**
 <p>If set to <code>true</code>, there are more streams available to list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasMoreStreams;

/**
 <p>The names of the streams that are associated with the AWS account making the <code>ListStreams</code> request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable streamNames;

@end

/**
 <p>Represents the input for <code>ListTagsForStream</code>.</p>
 Required parameters: [StreamName]
 */
@interface AWSKinesisListTagsForStreamInput : AWSRequest


/**
 <p>The key to use as the starting point for the list of tags. If this parameter is set, <code>ListTagsForStream</code> gets all tags that occur after <code>ExclusiveStartTagKey</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable exclusiveStartTagKey;

/**
 <p>The number of tags to return. If this number is less than the total number of tags associated with the stream, <code>HasMoreTags</code> is set to <code>true</code>. To list additional tags, set <code>ExclusiveStartTagKey</code> to the last key in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The name of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Represents the output for <code>ListTagsForStream</code>.</p>
 Required parameters: [Tags, HasMoreTags]
 */
@interface AWSKinesisListTagsForStreamOutput : AWSModel


/**
 <p>If set to <code>true</code>, more tags are available. To request additional tags, set <code>ExclusiveStartTagKey</code> to the key of the last tag returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasMoreTags;

/**
 <p>A list of tags associated with <code>StreamName</code>, starting with the first tag after <code>ExclusiveStartTagKey</code> and up to the specified <code>Limit</code>. </p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisTag *> * _Nullable tags;

@end

/**
 <p>Represents the input for <code>MergeShards</code>.</p>
 Required parameters: [StreamName, ShardToMerge, AdjacentShardToMerge]
 */
@interface AWSKinesisMergeShardsInput : AWSRequest


/**
 <p>The shard ID of the adjacent shard for the merge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adjacentShardToMerge;

/**
 <p>The shard ID of the shard to combine with the adjacent shard for the merge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shardToMerge;

/**
 <p>The name of the stream for the merge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Represents the input for <code>PutRecord</code>.</p>
 Required parameters: [StreamName, Data, PartitionKey]
 */
@interface AWSKinesisPutRecordInput : AWSRequest


/**
 <p>The data blob to put into the record, which is base64-encoded when the blob is serialized. When the data blob (the payload before base64-encoding) is added to the partition key size, the total size must not exceed the maximum record size (1 MB).</p>
 */
@property (nonatomic, strong) NSData * _Nullable data;

/**
 <p>The hash value used to explicitly determine the shard the data record is assigned to by overriding the partition key hash.</p>
 */
@property (nonatomic, strong) NSString * _Nullable explicitHashKey;

/**
 <p>Determines which shard in the stream the data record is assigned to. Partition keys are Unicode strings with a maximum length limit of 256 characters for each key. Amazon Kinesis Data Streams uses the partition key as input to a hash function that maps the partition key and associated data to a specific shard. Specifically, an MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards. As a result of this hashing mechanism, all data records with the same partition key map to the same shard within the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable partitionKey;

/**
 <p>Guarantees strictly increasing sequence numbers, for puts from the same client and to the same partition key. Usage: set the <code>SequenceNumberForOrdering</code> of record <i>n</i> to the sequence number of record <i>n-1</i> (as returned in the result when putting record <i>n-1</i>). If this parameter is not set, records are coarsely ordered based on arrival time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sequenceNumberForOrdering;

/**
 <p>The name of the stream to put the data record into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Represents the output for <code>PutRecord</code>.</p>
 Required parameters: [ShardId, SequenceNumber]
 */
@interface AWSKinesisPutRecordOutput : AWSModel


/**
 <p>The encryption type to use on the record. This parameter can be one of the following values:</p><ul><li><p><code>NONE</code>: Do not encrypt the records in the stream.</p></li><li><p><code>KMS</code>: Use server-side encryption on the records in the stream using a customer-managed AWS KMS key.</p></li></ul>
 */
@property (nonatomic, assign) AWSKinesisEncryptionType encryptionType;

/**
 <p>The sequence number identifier that was assigned to the put data record. The sequence number for the record is unique across all records in the stream. A sequence number is the identifier associated with every record put into the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sequenceNumber;

/**
 <p>The shard ID of the shard where the data record was placed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shardId;

@end

/**
 <p>A <code>PutRecords</code> request.</p>
 Required parameters: [Records, StreamName]
 */
@interface AWSKinesisPutRecordsInput : AWSRequest


/**
 <p>The records associated with the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisPutRecordsRequestEntry *> * _Nullable records;

/**
 <p>The stream name associated with the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p><code>PutRecords</code> results.</p>
 Required parameters: [Records]
 */
@interface AWSKinesisPutRecordsOutput : AWSModel


/**
 <p>The encryption type used on the records. This parameter can be one of the following values:</p><ul><li><p><code>NONE</code>: Do not encrypt the records.</p></li><li><p><code>KMS</code>: Use server-side encryption on the records using a customer-managed AWS KMS key.</p></li></ul>
 */
@property (nonatomic, assign) AWSKinesisEncryptionType encryptionType;

/**
 <p>The number of unsuccessfully processed records in a <code>PutRecords</code> request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedRecordCount;

/**
 <p>An array of successfully and unsuccessfully processed record results, correlated with the request by natural ordering. A record that is successfully added to a stream includes <code>SequenceNumber</code> and <code>ShardId</code> in the result. A record that fails to be added to a stream includes <code>ErrorCode</code> and <code>ErrorMessage</code> in the result.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisPutRecordsResultEntry *> * _Nullable records;

@end

/**
 <p>Represents the output for <code>PutRecords</code>.</p>
 Required parameters: [Data, PartitionKey]
 */
@interface AWSKinesisPutRecordsRequestEntry : AWSModel


/**
 <p>The data blob to put into the record, which is base64-encoded when the blob is serialized. When the data blob (the payload before base64-encoding) is added to the partition key size, the total size must not exceed the maximum record size (1 MB).</p>
 */
@property (nonatomic, strong) NSData * _Nullable data;

/**
 <p>The hash value used to determine explicitly the shard that the data record is assigned to by overriding the partition key hash.</p>
 */
@property (nonatomic, strong) NSString * _Nullable explicitHashKey;

/**
 <p>Determines which shard in the stream the data record is assigned to. Partition keys are Unicode strings with a maximum length limit of 256 characters for each key. Amazon Kinesis Data Streams uses the partition key as input to a hash function that maps the partition key and associated data to a specific shard. Specifically, an MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards. As a result of this hashing mechanism, all data records with the same partition key map to the same shard within the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable partitionKey;

@end

/**
 <p>Represents the result of an individual record from a <code>PutRecords</code> request. A record that is successfully added to a stream includes <code>SequenceNumber</code> and <code>ShardId</code> in the result. A record that fails to be added to the stream includes <code>ErrorCode</code> and <code>ErrorMessage</code> in the result.</p>
 */
@interface AWSKinesisPutRecordsResultEntry : AWSModel


/**
 <p>The error code for an individual record result. <code>ErrorCodes</code> can be either <code>ProvisionedThroughputExceededException</code> or <code>InternalFailure</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The error message for an individual record result. An <code>ErrorCode</code> value of <code>ProvisionedThroughputExceededException</code> has an error message that includes the account ID, stream name, and shard ID. An <code>ErrorCode</code> value of <code>InternalFailure</code> has the error message <code>"Internal Service Failure"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The sequence number for an individual record result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sequenceNumber;

/**
 <p>The shard ID for an individual record result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shardId;

@end

/**
 <p>The unit of data of the Kinesis data stream, which is composed of a sequence number, a partition key, and a data blob.</p>
 Required parameters: [SequenceNumber, Data, PartitionKey]
 */
@interface AWSKinesisRecord : AWSModel


/**
 <p>The approximate time that the record was inserted into the stream.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable approximateArrivalTimestamp;

/**
 <p>The data blob. The data in the blob is both opaque and immutable to Kinesis Data Streams, which does not inspect, interpret, or change the data in the blob in any way. When the data blob (the payload before base64-encoding) is added to the partition key size, the total size must not exceed the maximum record size (1 MB).</p>
 */
@property (nonatomic, strong) NSData * _Nullable data;

/**
 <p>The encryption type used on the record. This parameter can be one of the following values:</p><ul><li><p><code>NONE</code>: Do not encrypt the records in the stream.</p></li><li><p><code>KMS</code>: Use server-side encryption on the records in the stream using a customer-managed AWS KMS key.</p></li></ul>
 */
@property (nonatomic, assign) AWSKinesisEncryptionType encryptionType;

/**
 <p>Identifies which shard in the stream the data record is assigned to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable partitionKey;

/**
 <p>The unique identifier of the record within its shard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sequenceNumber;

@end

/**
 <p>Represents the input for <code>RemoveTagsFromStream</code>.</p>
 Required parameters: [StreamName, TagKeys]
 */
@interface AWSKinesisRemoveTagsFromStreamInput : AWSRequest


/**
 <p>The name of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>A list of tag keys. Each corresponding tag is removed from the stream.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p>The range of possible sequence numbers for the shard.</p>
 Required parameters: [StartingSequenceNumber]
 */
@interface AWSKinesisSequenceNumberRange : AWSModel


/**
 <p>The ending sequence number for the range. Shards that are in the OPEN state have an ending sequence number of <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endingSequenceNumber;

/**
 <p>The starting sequence number for the range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable startingSequenceNumber;

@end

/**
 <p>A uniquely identified group of data records in a Kinesis data stream.</p>
 Required parameters: [ShardId, HashKeyRange, SequenceNumberRange]
 */
@interface AWSKinesisShard : AWSModel


/**
 <p>The shard ID of the shard adjacent to the shard's parent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adjacentParentShardId;

/**
 <p>The range of possible hash key values for the shard, which is a set of ordered contiguous positive integers.</p>
 */
@property (nonatomic, strong) AWSKinesisHashKeyRange * _Nullable hashKeyRange;

/**
 <p>The shard ID of the shard's parent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentShardId;

/**
 <p>The range of possible sequence numbers for the shard.</p>
 */
@property (nonatomic, strong) AWSKinesisSequenceNumberRange * _Nullable sequenceNumberRange;

/**
 <p>The unique identifier of the shard within the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shardId;

@end

/**
 <p>Represents the input for <code>SplitShard</code>.</p>
 Required parameters: [StreamName, ShardToSplit, NewStartingHashKey]
 */
@interface AWSKinesisSplitShardInput : AWSRequest


/**
 <p>A hash key value for the starting hash key of one of the child shards created by the split. The hash key range for a given shard constitutes a set of ordered contiguous positive integers. The value for <code>NewStartingHashKey</code> must be in the range of hash keys being mapped into the shard. The <code>NewStartingHashKey</code> hash key value and all higher hash key values in hash key range are distributed to one of the child shards. All the lower hash key values in the range are distributed to the other child shard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestStartingHashKey;

/**
 <p>The shard ID of the shard to split.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shardToSplit;

/**
 <p>The name of the stream for the shard split.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisStartStreamEncryptionInput : AWSRequest


/**
 <p>The encryption type to use. The only valid value is <code>KMS</code>.</p>
 */
@property (nonatomic, assign) AWSKinesisEncryptionType encryptionType;

/**
 <p>The GUID for the customer-managed AWS KMS key to use for encryption. This value can be a globally unique identifier, a fully specified Amazon Resource Name (ARN) to either an alias or a key, or an alias name prefixed by "alias/".You can also use a master key owned by Kinesis Data Streams by specifying the alias <code>aws/kinesis</code>.</p><ul><li><p>Key ARN example: <code>arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</code></p></li><li><p>Alias ARN example: <code>arn:aws:kms:us-east-1:123456789012:alias/MyAliasName</code></p></li><li><p>Globally unique key ID example: <code>12345678-1234-1234-1234-123456789012</code></p></li><li><p>Alias name example: <code>alias/MyAliasName</code></p></li><li><p>Master key owned by Kinesis Data Streams: <code>alias/aws/kinesis</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The name of the stream for which to start encrypting records.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisStopStreamEncryptionInput : AWSRequest


/**
 <p>The encryption type. The only valid value is <code>KMS</code>.</p>
 */
@property (nonatomic, assign) AWSKinesisEncryptionType encryptionType;

/**
 <p>The GUID for the customer-managed AWS KMS key to use for encryption. This value can be a globally unique identifier, a fully specified Amazon Resource Name (ARN) to either an alias or a key, or an alias name prefixed by "alias/".You can also use a master key owned by Kinesis Data Streams by specifying the alias <code>aws/kinesis</code>.</p><ul><li><p>Key ARN example: <code>arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</code></p></li><li><p>Alias ARN example: <code>arn:aws:kms:us-east-1:123456789012:alias/MyAliasName</code></p></li><li><p>Globally unique key ID example: <code>12345678-1234-1234-1234-123456789012</code></p></li><li><p>Alias name example: <code>alias/MyAliasName</code></p></li><li><p>Master key owned by Kinesis Data Streams: <code>alias/aws/kinesis</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The name of the stream on which to stop encrypting records.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Represents the output for <a>DescribeStream</a>.</p>
 Required parameters: [StreamName, StreamARN, StreamStatus, Shards, HasMoreShards, RetentionPeriodHours, StreamCreationTimestamp, EnhancedMonitoring]
 */
@interface AWSKinesisStreamDescription : AWSModel


/**
 <p>The server-side encryption type used on the stream. This parameter can be one of the following values:</p><ul><li><p><code>NONE</code>: Do not encrypt the records in the stream.</p></li><li><p><code>KMS</code>: Use server-side encryption on the records in the stream using a customer-managed AWS KMS key.</p></li></ul>
 */
@property (nonatomic, assign) AWSKinesisEncryptionType encryptionType;

/**
 <p>Represents the current enhanced monitoring settings of the stream.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisEnhancedMetrics *> * _Nullable enhancedMonitoring;

/**
 <p>If set to <code>true</code>, more shards in the stream are available to describe.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasMoreShards;

/**
 <p>The GUID for the customer-managed AWS KMS key to use for encryption. This value can be a globally unique identifier, a fully specified ARN to either an alias or a key, or an alias name prefixed by "alias/".You can also use a master key owned by Kinesis Data Streams by specifying the alias <code>aws/kinesis</code>.</p><ul><li><p>Key ARN example: <code>arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</code></p></li><li><p>Alias ARN example: <code>arn:aws:kms:us-east-1:123456789012:alias/MyAliasName</code></p></li><li><p>Globally unique key ID example: <code>12345678-1234-1234-1234-123456789012</code></p></li><li><p>Alias name example: <code>alias/MyAliasName</code></p></li><li><p>Master key owned by Kinesis Data Streams: <code>alias/aws/kinesis</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The current retention period, in hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retentionPeriodHours;

/**
 <p>The shards that comprise the stream.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisShard *> * _Nullable shards;

/**
 <p>The Amazon Resource Name (ARN) for the stream being described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The approximate time that the stream was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable streamCreationTimestamp;

/**
 <p>The name of the stream being described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>The current status of the stream being described. The stream status is one of the following states:</p><ul><li><p><code>CREATING</code> - The stream is being created. Kinesis Data Streams immediately returns and sets <code>StreamStatus</code> to <code>CREATING</code>.</p></li><li><p><code>DELETING</code> - The stream is being deleted. The specified stream is in the <code>DELETING</code> state until Kinesis Data Streams completes the deletion.</p></li><li><p><code>ACTIVE</code> - The stream exists and is ready for read and write operations or deletion. You should perform read and write operations only on an <code>ACTIVE</code> stream.</p></li><li><p><code>UPDATING</code> - Shards in the stream are being merged or split. Read and write operations continue to work while the stream is in the <code>UPDATING</code> state.</p></li></ul>
 */
@property (nonatomic, assign) AWSKinesisStreamStatus streamStatus;

@end

/**
 <p>Represents the output for <a>DescribeStreamSummary</a></p>
 Required parameters: [StreamName, StreamARN, StreamStatus, RetentionPeriodHours, StreamCreationTimestamp, EnhancedMonitoring, OpenShardCount]
 */
@interface AWSKinesisStreamDescriptionSummary : AWSModel


/**
 <p>The encryption type used. This value is one of the following:</p><ul><li><p><code>KMS</code></p></li><li><p><code>NONE</code></p></li></ul>
 */
@property (nonatomic, assign) AWSKinesisEncryptionType encryptionType;

/**
 <p>Represents the current enhanced monitoring settings of the stream.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisEnhancedMetrics *> * _Nullable enhancedMonitoring;

/**
 <p>The GUID for the customer-managed AWS KMS key to use for encryption. This value can be a globally unique identifier, a fully specified ARN to either an alias or a key, or an alias name prefixed by "alias/".You can also use a master key owned by Kinesis Data Streams by specifying the alias <code>aws/kinesis</code>.</p><ul><li><p>Key ARN example: <code>arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</code></p></li><li><p>Alias ARN example: <code> arn:aws:kms:us-east-1:123456789012:alias/MyAliasName</code></p></li><li><p>Globally unique key ID example: <code>12345678-1234-1234-1234-123456789012</code></p></li><li><p>Alias name example: <code>alias/MyAliasName</code></p></li><li><p>Master key owned by Kinesis Data Streams: <code>alias/aws/kinesis</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable keyId;

/**
 <p>The number of open shards in the stream.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable openShardCount;

/**
 <p>The current retention period, in hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable retentionPeriodHours;

/**
 <p>The Amazon Resource Name (ARN) for the stream being described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The approximate time that the stream was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable streamCreationTimestamp;

/**
 <p>The name of the stream being described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>The current status of the stream being described. The stream status is one of the following states:</p><ul><li><p><code>CREATING</code> - The stream is being created. Kinesis Data Streams immediately returns and sets <code>StreamStatus</code> to <code>CREATING</code>.</p></li><li><p><code>DELETING</code> - The stream is being deleted. The specified stream is in the <code>DELETING</code> state until Kinesis Data Streams completes the deletion.</p></li><li><p><code>ACTIVE</code> - The stream exists and is ready for read and write operations or deletion. You should perform read and write operations only on an <code>ACTIVE</code> stream.</p></li><li><p><code>UPDATING</code> - Shards in the stream are being merged or split. Read and write operations continue to work while the stream is in the <code>UPDATING</code> state.</p></li></ul>
 */
@property (nonatomic, assign) AWSKinesisStreamStatus streamStatus;

@end

/**
 <p>Metadata assigned to the stream, consisting of a key-value pair.</p>
 Required parameters: [Key]
 */
@interface AWSKinesisTag : AWSModel


/**
 <p>A unique identifier for the tag. Maximum length: 128 characters. Valid characters: Unicode letters, digits, white space, _ . / = + - % @</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>An optional string, typically used to describe or define the tag. Maximum length: 256 characters. Valid characters: Unicode letters, digits, white space, _ . / = + - % @</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSKinesisUpdateShardCountInput : AWSRequest


/**
 <p>The scaling type. Uniform scaling creates shards of equal size.</p>
 */
@property (nonatomic, assign) AWSKinesisScalingType scalingType;

/**
 <p>The name of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>The new number of shards.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetShardCount;

@end

/**
 
 */
@interface AWSKinesisUpdateShardCountOutput : AWSModel


/**
 <p>The current number of shards.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentShardCount;

/**
 <p>The name of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>The updated number of shards.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetShardCount;

@end

NS_ASSUME_NONNULL_END
