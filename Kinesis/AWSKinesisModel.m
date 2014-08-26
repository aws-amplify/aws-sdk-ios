/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "AWSKinesisModel.h"
#import "AWSCategory.h"

NSString *const AWSKinesisErrorDomain = @"com.amazonaws.AWSKinesisErrorDomain";

@implementation AWSKinesisCreateStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"shardCount" : @"ShardCount",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisDeleteStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisDescribeStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveStartShardId" : @"ExclusiveStartShardId",
             @"limit" : @"Limit",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisDescribeStreamOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamDescription" : @"StreamDescription",
             };
}

+ (NSValueTransformer *)streamDescriptionJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisStreamDescription class]];
}

@end

@implementation AWSKinesisGetRecordsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"shardIterator" : @"ShardIterator",
             };
}

@end

@implementation AWSKinesisGetRecordsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextShardIterator" : @"NextShardIterator",
             @"records" : @"Records",
             };
}

+ (NSValueTransformer *)recordsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSKinesisRecord class]];
}

@end

@implementation AWSKinesisGetShardIteratorInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"shardId" : @"ShardId",
             @"shardIteratorType" : @"ShardIteratorType",
             @"startingSequenceNumber" : @"StartingSequenceNumber",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)shardIteratorTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"AT_SEQUENCE_NUMBER"]) {
            return @(AWSKinesisShardIteratorTypeAtSequenceNumber);
        }
        if ([value isEqualToString:@"AFTER_SEQUENCE_NUMBER"]) {
            return @(AWSKinesisShardIteratorTypeAfterSequenceNumber);
        }
        if ([value isEqualToString:@"TRIM_HORIZON"]) {
            return @(AWSKinesisShardIteratorTypeTrimHorizon);
        }
        if ([value isEqualToString:@"LATEST"]) {
            return @(AWSKinesisShardIteratorTypeLatest);
        }
        return @(AWSKinesisShardIteratorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisShardIteratorTypeAtSequenceNumber:
                return @"AT_SEQUENCE_NUMBER";
            case AWSKinesisShardIteratorTypeAfterSequenceNumber:
                return @"AFTER_SEQUENCE_NUMBER";
            case AWSKinesisShardIteratorTypeTrimHorizon:
                return @"TRIM_HORIZON";
            case AWSKinesisShardIteratorTypeLatest:
                return @"LATEST";
            case AWSKinesisShardIteratorTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisGetShardIteratorOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"shardIterator" : @"ShardIterator",
             };
}

@end

@implementation AWSKinesisHashKeyRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endingHashKey" : @"EndingHashKey",
             @"startingHashKey" : @"StartingHashKey",
             };
}

@end

@implementation AWSKinesisListStreamsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveStartStreamName" : @"ExclusiveStartStreamName",
             @"limit" : @"Limit",
             };
}

@end

@implementation AWSKinesisListStreamsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hasMoreStreams" : @"HasMoreStreams",
             @"streamNames" : @"StreamNames",
             };
}

@end

@implementation AWSKinesisMergeShardsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adjacentShardToMerge" : @"AdjacentShardToMerge",
             @"shardToMerge" : @"ShardToMerge",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisPutRecordInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             @"explicitHashKey" : @"ExplicitHashKey",
             @"partitionKey" : @"PartitionKey",
             @"sequenceNumberForOrdering" : @"SequenceNumberForOrdering",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisPutRecordOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sequenceNumber" : @"SequenceNumber",
             @"shardId" : @"ShardId",
             };
}

@end

@implementation AWSKinesisRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             @"partitionKey" : @"PartitionKey",
             @"sequenceNumber" : @"SequenceNumber",
             };
}

@end

@implementation AWSKinesisSequenceNumberRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endingSequenceNumber" : @"EndingSequenceNumber",
             @"startingSequenceNumber" : @"StartingSequenceNumber",
             };
}

@end

@implementation AWSKinesisShard

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adjacentParentShardId" : @"AdjacentParentShardId",
             @"hashKeyRange" : @"HashKeyRange",
             @"parentShardId" : @"ParentShardId",
             @"sequenceNumberRange" : @"SequenceNumberRange",
             @"shardId" : @"ShardId",
             };
}

+ (NSValueTransformer *)hashKeyRangeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisHashKeyRange class]];
}

+ (NSValueTransformer *)sequenceNumberRangeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisSequenceNumberRange class]];
}

@end

@implementation AWSKinesisSplitShardInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestStartingHashKey" : @"NewStartingHashKey",
             @"shardToSplit" : @"ShardToSplit",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisStreamDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hasMoreShards" : @"HasMoreShards",
             @"shards" : @"Shards",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             @"streamStatus" : @"StreamStatus",
             };
}

+ (NSValueTransformer *)shardsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSKinesisShard class]];
}

+ (NSValueTransformer *)streamStatusJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"CREATING"]) {
            return @(AWSKinesisStreamStatusCreating);
        }
        if ([value isEqualToString:@"DELETING"]) {
            return @(AWSKinesisStreamStatusDeleting);
        }
        if ([value isEqualToString:@"ACTIVE"]) {
            return @(AWSKinesisStreamStatusActive);
        }
        if ([value isEqualToString:@"UPDATING"]) {
            return @(AWSKinesisStreamStatusUpdating);
        }
        return @(AWSKinesisStreamStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisStreamStatusCreating:
                return @"CREATING";
            case AWSKinesisStreamStatusDeleting:
                return @"DELETING";
            case AWSKinesisStreamStatusActive:
                return @"ACTIVE";
            case AWSKinesisStreamStatusUpdating:
                return @"UPDATING";
            case AWSKinesisStreamStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end
