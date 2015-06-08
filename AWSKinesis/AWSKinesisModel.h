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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

FOUNDATION_EXPORT NSString *const AWSKinesisErrorDomain;

typedef NS_ENUM(NSInteger, AWSKinesisErrorType) {
    AWSKinesisErrorUnknown,
    AWSKinesisErrorIncompleteSignature,
    AWSKinesisErrorInvalidClientTokenId,
    AWSKinesisErrorMissingAuthenticationToken,
    AWSKinesisErrorExpiredIterator,
    AWSKinesisErrorInvalidArgument,
    AWSKinesisErrorLimitExceeded,
    AWSKinesisErrorProvisionedThroughputExceeded,
    AWSKinesisErrorResourceInUse,
    AWSKinesisErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSKinesisShardIteratorType) {
    AWSKinesisShardIteratorTypeUnknown,
    AWSKinesisShardIteratorTypeAtSequenceNumber,
    AWSKinesisShardIteratorTypeAfterSequenceNumber,
    AWSKinesisShardIteratorTypeTrimHorizon,
    AWSKinesisShardIteratorTypeLatest,
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
@class AWSKinesisDeleteStreamInput;
@class AWSKinesisDescribeStreamInput;
@class AWSKinesisDescribeStreamOutput;
@class AWSKinesisGetRecordsInput;
@class AWSKinesisGetRecordsOutput;
@class AWSKinesisGetShardIteratorInput;
@class AWSKinesisGetShardIteratorOutput;
@class AWSKinesisHashKeyRange;
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
@class AWSKinesisStreamDescription;
@class AWSKinesisTag;

/**
 <p>Represents the input for <code>AddTagsToStream</code>.</p>
 Required parameters: [StreamName, Tags]
 */
@interface AWSKinesisAddTagsToStreamInput : AWSRequest


/**
 <p>The name of the stream.</p>
 */
@property (nonatomic, strong) NSString *streamName;

/**
 <p>The set of key-value pairs to use to create the tags.</p>
 */
@property (nonatomic, strong) NSDictionary *tags;

@end

/**
 <p>Represents the input for <code>CreateStream</code>.</p>
 Required parameters: [StreamName, ShardCount]
 */
@interface AWSKinesisCreateStreamInput : AWSRequest


/**
 <p>The number of shards that the stream will use. The throughput of the stream is a function of the number of shards; more shards are required for greater provisioned throughput.</p><p><b>Note:</b> The default limit for an AWS account is 10 shards per stream. If you need to create a stream with more than 10 shards, <a href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">contact AWS Support</a> to increase the limit on your account.</p>
 */
@property (nonatomic, strong) NSNumber *shardCount;

/**
 <p>A name to identify the stream. The stream name is scoped to the AWS account used by the application that creates the stream. It is also scoped by region. That is, two streams in two different AWS accounts can have the same name, and two streams in the same AWS account, but in two different regions, can have the same name.</p>
 */
@property (nonatomic, strong) NSString *streamName;

@end

/**
 <p>Represents the input for <code>DeleteStream</code>.</p>
 Required parameters: [StreamName]
 */
@interface AWSKinesisDeleteStreamInput : AWSRequest


/**
 <p>The name of the stream to delete.</p>
 */
@property (nonatomic, strong) NSString *streamName;

@end

/**
 <p>Represents the input for <code>DescribeStream</code>.</p>
 Required parameters: [StreamName]
 */
@interface AWSKinesisDescribeStreamInput : AWSRequest


/**
 <p>The shard ID of the shard to start with.</p>
 */
@property (nonatomic, strong) NSString *exclusiveStartShardId;

/**
 <p>The maximum number of shards to return.</p>
 */
@property (nonatomic, strong) NSNumber *limit;

/**
 <p>The name of the stream to describe.</p>
 */
@property (nonatomic, strong) NSString *streamName;

@end

/**
 <p>Represents the output for <code>DescribeStream</code>.</p>
 Required parameters: [StreamDescription]
 */
@interface AWSKinesisDescribeStreamOutput : AWSModel


/**
 <p>The current status of the stream, the stream ARN, an array of shard objects that comprise the stream, and states whether there are more shards available.</p>
 */
@property (nonatomic, strong) AWSKinesisStreamDescription *streamDescription;

@end

/**
 <p>Represents the input for <code>GetRecords</code>.</p>
 Required parameters: [ShardIterator]
 */
@interface AWSKinesisGetRecordsInput : AWSRequest


/**
 <p>The maximum number of records to return. Specify a value of up to 10,000. If you specify a value that is greater than 10,000, <code>GetRecords</code> throws <code>InvalidArgumentException</code>.</p>
 */
@property (nonatomic, strong) NSNumber *limit;

/**
 <p>The position in the shard from which you want to start sequentially reading data records. A shard iterator specifies this position using the sequence number of a data record in the shard.</p>
 */
@property (nonatomic, strong) NSString *shardIterator;

@end

/**
 <p>Represents the output for <code>GetRecords</code>.</p>
 Required parameters: [Records]
 */
@interface AWSKinesisGetRecordsOutput : AWSModel


/**
 <p>The next position in the shard from which to start sequentially reading data records. If set to <code>null</code>, the shard has been closed and the requested iterator will not return any more data. </p>
 */
@property (nonatomic, strong) NSString *nextShardIterator;

/**
 <P>The data records retrieved from the shard.</P>
 */
@property (nonatomic, strong) NSArray *records;

@end

/**
 <p>Represents the input for <code>GetShardIterator</code>.</p>
 Required parameters: [StreamName, ShardId, ShardIteratorType]
 */
@interface AWSKinesisGetShardIteratorInput : AWSRequest


/**
 <p>The shard ID of the shard to get the iterator for.</p>
 */
@property (nonatomic, strong) NSString *shardId;

/**
 <p>Determines how the shard iterator is used to start reading data records from the shard.</p><p>The following are the valid shard iterator types:</p><ul><li>AT_SEQUENCE_NUMBER - Start reading exactly from the position denoted by a specific sequence number.</li><li>AFTER_SEQUENCE_NUMBER - Start reading right after the position denoted by a specific sequence number.</li><li>TRIM_HORIZON - Start reading at the last untrimmed record in the shard in the system, which is the oldest data record in the shard.</li><li>LATEST - Start reading just after the most recent record in the shard, so that you always read the most recent data in the shard.</li></ul>
 */
@property (nonatomic, assign) AWSKinesisShardIteratorType shardIteratorType;

/**
 <p>The sequence number of the data record in the shard from which to start reading from.</p>
 */
@property (nonatomic, strong) NSString *startingSequenceNumber;

/**
 <p>The name of the stream.</p>
 */
@property (nonatomic, strong) NSString *streamName;

@end

/**
 <p>Represents the output for <code>GetShardIterator</code>.</p>
 */
@interface AWSKinesisGetShardIteratorOutput : AWSModel


/**
 <p>The position in the shard from which to start reading data records sequentially. A shard iterator specifies this position using the sequence number of a data record in a shard.</p>
 */
@property (nonatomic, strong) NSString *shardIterator;

@end

/**
 <p>The range of possible hash key values for the shard, which is a set of ordered contiguous positive integers.</p>
 Required parameters: [StartingHashKey, EndingHashKey]
 */
@interface AWSKinesisHashKeyRange : AWSModel


/**
 <p>The ending hash key of the hash key range.</p>
 */
@property (nonatomic, strong) NSString *endingHashKey;

/**
 <p>The starting hash key of the hash key range.</p>
 */
@property (nonatomic, strong) NSString *startingHashKey;

@end

/**
 <p>Represents the input for <code>ListStreams</code>.</p>
 */
@interface AWSKinesisListStreamsInput : AWSRequest


/**
 <p>The name of the stream to start the list with.</p>
 */
@property (nonatomic, strong) NSString *exclusiveStartStreamName;

/**
 <p>The maximum number of streams to list.</p>
 */
@property (nonatomic, strong) NSNumber *limit;

@end

/**
 <p>Represents the output for <code>ListStreams</code>.</p>
 Required parameters: [StreamNames, HasMoreStreams]
 */
@interface AWSKinesisListStreamsOutput : AWSModel


/**
 <p>If set to <code>true</code>, there are more streams available to list.</p>
 */
@property (nonatomic, strong) NSNumber *hasMoreStreams;

/**
 <p>The names of the streams that are associated with the AWS account making the <code>ListStreams</code> request.</p>
 */
@property (nonatomic, strong) NSArray *streamNames;

@end

/**
 <p>Represents the input for <code>ListTagsForStream</code>.</p>
 Required parameters: [StreamName]
 */
@interface AWSKinesisListTagsForStreamInput : AWSRequest


/**
 <p>The key to use as the starting point for the list of tags. If this parameter is set, <code>ListTagsForStream</code> gets all tags that occur after <code>ExclusiveStartTagKey</code>. </p>
 */
@property (nonatomic, strong) NSString *exclusiveStartTagKey;

/**
 <p>The number of tags to return. If this number is less than the total number of tags associated with the stream, <code>HasMoreTags</code> is set to <code>true</code>. To list additional tags, set <code>ExclusiveStartTagKey</code> to the last key in the response.</p>
 */
@property (nonatomic, strong) NSNumber *limit;

/**
 <p>The name of the stream.</p>
 */
@property (nonatomic, strong) NSString *streamName;

@end

/**
 <p>Represents the output for <code>ListTagsForStream</code>.</p>
 Required parameters: [Tags, HasMoreTags]
 */
@interface AWSKinesisListTagsForStreamOutput : AWSModel


/**
 <p>If set to <code>true</code>, more tags are available. To request additional tags, set <code>ExclusiveStartTagKey</code> to the key of the last tag returned.</p>
 */
@property (nonatomic, strong) NSNumber *hasMoreTags;

/**
 <p>A list of tags associated with <code>StreamName</code>, starting with the first tag after <code>ExclusiveStartTagKey</code> and up to the specified <code>Limit</code>. </p>
 */
@property (nonatomic, strong) NSArray *tags;

@end

/**
 <p>Represents the input for <code>MergeShards</code>.</p>
 Required parameters: [StreamName, ShardToMerge, AdjacentShardToMerge]
 */
@interface AWSKinesisMergeShardsInput : AWSRequest


/**
 <p>The shard ID of the adjacent shard for the merge.</p>
 */
@property (nonatomic, strong) NSString *adjacentShardToMerge;

/**
 <p>The shard ID of the shard to combine with the adjacent shard for the merge.</p>
 */
@property (nonatomic, strong) NSString *shardToMerge;

/**
 <p>The name of the stream for the merge.</p>
 */
@property (nonatomic, strong) NSString *streamName;

@end

/**
 <p>Represents the input for <code>PutRecord</code>.</p>
 Required parameters: [StreamName, Data, PartitionKey]
 */
@interface AWSKinesisPutRecordInput : AWSRequest


/**
 <p>The data blob to put into the record, which is base64-encoded when the blob is serialized. The maximum size of the data blob (the payload before base64-encoding) is 50 kilobytes (KB) </p>
 */
@property (nonatomic, strong) NSData *data;

/**
 <p>The hash value used to explicitly determine the shard the data record is assigned to by overriding the partition key hash.</p>
 */
@property (nonatomic, strong) NSString *explicitHashKey;

/**
 <p>Determines which shard in the stream the data record is assigned to. Partition keys are Unicode strings with a maximum length limit of 256 bytes. Amazon Kinesis uses the partition key as input to a hash function that maps the partition key and associated data to a specific shard. Specifically, an MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards. As a result of this hashing mechanism, all data records with the same partition key will map to the same shard within the stream.</p>
 */
@property (nonatomic, strong) NSString *partitionKey;

/**
 <p>Guarantees strictly increasing sequence numbers, for puts from the same client and to the same partition key. Usage: set the <code>SequenceNumberForOrdering</code> of record <i>n</i> to the sequence number of record <i>n-1</i> (as returned in the <a>PutRecordResult</a> when putting record <i>n-1</i>). If this parameter is not set, records will be coarsely ordered based on arrival time.</p>
 */
@property (nonatomic, strong) NSString *sequenceNumberForOrdering;

/**
 <p>The name of the stream to put the data record into.</p>
 */
@property (nonatomic, strong) NSString *streamName;

@end

/**
 <p>Represents the output for <code>PutRecord</code>.</p>
 Required parameters: [ShardId, SequenceNumber]
 */
@interface AWSKinesisPutRecordOutput : AWSModel


/**
 <p>The sequence number identifier that was assigned to the put data record. The sequence number for the record is unique across all records in the stream. A sequence number is the identifier associated with every record put into the stream.</p>
 */
@property (nonatomic, strong) NSString *sequenceNumber;

/**
 <p>The shard ID of the shard where the data record was placed.</p>
 */
@property (nonatomic, strong) NSString *shardId;

@end

/**
 <p>A <code>PutRecords</code> request.</p>
 Required parameters: [Records, StreamName]
 */
@interface AWSKinesisPutRecordsInput : AWSRequest


/**
 <p>The records associated with the request.</p>
 */
@property (nonatomic, strong) NSArray *records;

/**
 <p>The stream name associated with the request.</p>
 */
@property (nonatomic, strong) NSString *streamName;

@end

/**
 <p><code>PutRecords</code> results.</p>
 Required parameters: [Records]
 */
@interface AWSKinesisPutRecordsOutput : AWSModel


/**
 <p>The number of unsuccessfully processed records in a <code>PutRecords</code> request.</p>
 */
@property (nonatomic, strong) NSNumber *failedRecordCount;

/**
 <p>An array of successfully and unsuccessfully processed record results, correlated with the request by natural ordering. A record that is successfully added to your Amazon Kinesis stream includes <code>SequenceNumber</code> and <code>ShardId</code> in the result. A record that fails to be added to your Amazon Kinesis stream includes <code>ErrorCode</code> and <code>ErrorMessage</code> in the result.</p>
 */
@property (nonatomic, strong) NSArray *records;

@end

/**
 <p>Represents the output for <code>PutRecords</code>.</p>
 Required parameters: [Data, PartitionKey]
 */
@interface AWSKinesisPutRecordsRequestEntry : AWSModel


/**
 <p>The data blob to put into the record, which is base64-encoded when the blob is serialized. The maximum size of the data blob (the payload before base64-encoding) is 50 kilobytes (KB)</p>
 */
@property (nonatomic, strong) NSData *data;

/**
 <p>The hash value used to determine explicitly the shard that the data record is assigned to by overriding the partition key hash.</p>
 */
@property (nonatomic, strong) NSString *explicitHashKey;

/**
 <p>Determines which shard in the stream the data record is assigned to. Partition keys are Unicode strings with a maximum length limit of 256 bytes. Amazon Kinesis uses the partition key as input to a hash function that maps the partition key and associated data to a specific shard. Specifically, an MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards. As a result of this hashing mechanism, all data records with the same partition key map to the same shard within the stream.</p>
 */
@property (nonatomic, strong) NSString *partitionKey;

@end

/**
 <p>Represents the result of an individual record from a <code>PutRecords</code> request. A record that is successfully added to your Amazon Kinesis stream includes SequenceNumber and ShardId in the result. A record that fails to be added to your Amazon Kinesis stream includes ErrorCode and ErrorMessage in the result.</p>
 */
@interface AWSKinesisPutRecordsResultEntry : AWSModel


/**
 <p>The error code for an individual record result. <code>ErrorCodes</code> can be either <code>ProvisionedThroughputExceededException</code> or <code>InternalFailure</code>.</p>
 */
@property (nonatomic, strong) NSString *errorCode;

/**
 <p>The error message for an individual record result. An <code>ErrorCode</code> value of <code>ProvisionedThroughputExceededException</code> has an error message that includes the account ID, stream name, and shard ID. An <code>ErrorCode</code> value of <code>InternalFailure</code> has the error message <code>"Internal Service Failure"</code>.</p>
 */
@property (nonatomic, strong) NSString *errorMessage;

/**
 <p>The sequence number for an individual record result.</p>
 */
@property (nonatomic, strong) NSString *sequenceNumber;

/**
 <p>The shard ID for an individual record result.</p>
 */
@property (nonatomic, strong) NSString *shardId;

@end

/**
 <p>The unit of data of the Amazon Kinesis stream, which is composed of a sequence number, a partition key, and a data blob.</p>
 Required parameters: [SequenceNumber, Data, PartitionKey]
 */
@interface AWSKinesisRecord : AWSModel


/**
 <p>The data blob. The data in the blob is both opaque and immutable to the Amazon Kinesis service, which does not inspect, interpret, or change the data in the blob in any way. The maximum size of the data blob (the payload before base64-encoding) is 50 kilobytes (KB) </p>
 */
@property (nonatomic, strong) NSData *data;

/**
 <p>Identifies which shard in the stream the data record is assigned to.</p>
 */
@property (nonatomic, strong) NSString *partitionKey;

/**
 <p>The unique identifier for the record in the Amazon Kinesis stream.</p>
 */
@property (nonatomic, strong) NSString *sequenceNumber;

@end

/**
 <p>Represents the input for <code>RemoveTagsFromStream</code>.</p>
 Required parameters: [StreamName, TagKeys]
 */
@interface AWSKinesisRemoveTagsFromStreamInput : AWSRequest


/**
 <p>The name of the stream.</p>
 */
@property (nonatomic, strong) NSString *streamName;

/**
 <p>A list of tag keys. Each corresponding tag is removed from the stream.</p>
 */
@property (nonatomic, strong) NSArray *tagKeys;

@end

/**
 <p>The range of possible sequence numbers for the shard.</p>
 Required parameters: [StartingSequenceNumber]
 */
@interface AWSKinesisSequenceNumberRange : AWSModel


/**
 <p>The ending sequence number for the range. Shards that are in the OPEN state have an ending sequence number of <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString *endingSequenceNumber;

/**
 <p>The starting sequence number for the range.</p>
 */
@property (nonatomic, strong) NSString *startingSequenceNumber;

@end

/**
 <p>A uniquely identified group of data records in an Amazon Kinesis stream.</p>
 Required parameters: [ShardId, HashKeyRange, SequenceNumberRange]
 */
@interface AWSKinesisShard : AWSModel


/**
 <p>The shard Id of the shard adjacent to the shard's parent.</p>
 */
@property (nonatomic, strong) NSString *adjacentParentShardId;

/**
 <p>The range of possible hash key values for the shard, which is a set of ordered contiguous positive integers.</p>
 */
@property (nonatomic, strong) AWSKinesisHashKeyRange *hashKeyRange;

/**
 <p>The shard Id of the shard's parent.</p>
 */
@property (nonatomic, strong) NSString *parentShardId;

/**
 <p>The range of possible sequence numbers for the shard.</p>
 */
@property (nonatomic, strong) AWSKinesisSequenceNumberRange *sequenceNumberRange;

/**
 <p>The unique identifier of the shard within the Amazon Kinesis stream.</p>
 */
@property (nonatomic, strong) NSString *shardId;

@end

/**
 <p>Represents the input for <code>SplitShard</code>.</p>
 Required parameters: [StreamName, ShardToSplit, NewStartingHashKey]
 */
@interface AWSKinesisSplitShardInput : AWSRequest


/**
 <p>A hash key value for the starting hash key of one of the child shards created by the split. The hash key range for a given shard constitutes a set of ordered contiguous positive integers. The value for <code>NewStartingHashKey</code> must be in the range of hash keys being mapped into the shard. The <code>NewStartingHashKey</code> hash key value and all higher hash key values in hash key range are distributed to one of the child shards. All the lower hash key values in the range are distributed to the other child shard.</p>
 */
@property (nonatomic, strong) NSString *latestStartingHashKey;

/**
 <p>The shard ID of the shard to split.</p>
 */
@property (nonatomic, strong) NSString *shardToSplit;

/**
 <p>The name of the stream for the shard split.</p>
 */
@property (nonatomic, strong) NSString *streamName;

@end

/**
 <p>Represents the output for <code>DescribeStream</code>.</p>
 Required parameters: [StreamName, StreamARN, StreamStatus, Shards, HasMoreShards]
 */
@interface AWSKinesisStreamDescription : AWSModel


/**
 <p>If set to <code>true</code>, more shards in the stream are available to describe.</p>
 */
@property (nonatomic, strong) NSNumber *hasMoreShards;

/**
 <p>The shards that comprise the stream.</p>
 */
@property (nonatomic, strong) NSArray *shards;

/**
 <p>The Amazon Resource Name (ARN) for the stream being described.</p>
 */
@property (nonatomic, strong) NSString *streamARN;

/**
 <p>The name of the stream being described.</p>
 */
@property (nonatomic, strong) NSString *streamName;

/**
 <p>The current status of the stream being described.</p><p>The stream status is one of the following states:</p><ul><li><code>CREATING</code> - The stream is being created. Amazon Kinesis immediately returns and sets <code>StreamStatus</code> to <code>CREATING</code>.</li><li><code>DELETING</code> - The stream is being deleted. The specified stream is in the <code>DELETING</code> state until Amazon Kinesis completes the deletion.</li><li><code>ACTIVE</code> - The stream exists and is ready for read and write operations or deletion. You should perform read and write operations only on an <code>ACTIVE</code> stream.</li><li><code>UPDATING</code> - Shards in the stream are being merged or split. Read and write operations continue to work while the stream is in the <code>UPDATING</code> state.</li></ul>
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
@property (nonatomic, strong) NSString *key;

/**
 <p>An optional string, typically used to describe or define the tag. Maximum length: 256 characters. Valid characters: Unicode letters, digits, white space, _ . / = + - % @</p>
 */
@property (nonatomic, strong) NSString *value;

@end
