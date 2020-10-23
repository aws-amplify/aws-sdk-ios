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

#import "AWSKinesisModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSKinesisErrorDomain = @"com.amazonaws.AWSKinesisErrorDomain";

@implementation AWSKinesisAddTagsToStreamInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamName" : @"StreamName",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSKinesisCreateStreamInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"shardCount" : @"ShardCount",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisDecreaseStreamRetentionPeriodInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"retentionPeriodHours" : @"RetentionPeriodHours",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisDeleteStreamInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisDescribeLimitsInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisDescribeLimitsOutput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"openShardCount" : @"OpenShardCount",
             @"shardLimit" : @"ShardLimit",
             };
}

@end

@implementation AWSKinesisDescribeStreamInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveStartShardId" : @"ExclusiveStartShardId",
             @"limit" : @"Limit",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisDescribeStreamOutput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamDescription" : @"StreamDescription",
             };
}

+ (NSValueTransformer *)streamDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisStreamDescription class]];
}

@end

@implementation AWSKinesisDescribeStreamSummaryInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisDescribeStreamSummaryOutput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamDescriptionSummary" : @"StreamDescriptionSummary",
             };
}

+ (NSValueTransformer *)streamDescriptionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisStreamDescriptionSummary class]];
}

@end

@implementation AWSKinesisDisableEnhancedMonitoringInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"shardLevelMetrics" : @"ShardLevelMetrics",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisEnableEnhancedMonitoringInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"shardLevelMetrics" : @"ShardLevelMetrics",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisEnhancedMetrics

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"shardLevelMetrics" : @"ShardLevelMetrics",
             };
}

@end

@implementation AWSKinesisEnhancedMonitoringOutput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentShardLevelMetrics" : @"CurrentShardLevelMetrics",
             @"desiredShardLevelMetrics" : @"DesiredShardLevelMetrics",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisGetRecordsInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"shardIterator" : @"ShardIterator",
             };
}

@end

@implementation AWSKinesisGetRecordsOutput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"millisBehindLatest" : @"MillisBehindLatest",
             @"nextShardIterator" : @"NextShardIterator",
             @"records" : @"Records",
             };
}

+ (NSValueTransformer *)recordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisRecord class]];
}

@end

@implementation AWSKinesisGetShardIteratorInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"shardId" : @"ShardId",
             @"shardIteratorType" : @"ShardIteratorType",
             @"startingSequenceNumber" : @"StartingSequenceNumber",
             @"streamName" : @"StreamName",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)shardIteratorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AT_SEQUENCE_NUMBER"] == NSOrderedSame) {
            return @(AWSKinesisShardIteratorTypeAtSequenceNumber);
        }
        if ([value caseInsensitiveCompare:@"AFTER_SEQUENCE_NUMBER"] == NSOrderedSame) {
            return @(AWSKinesisShardIteratorTypeAfterSequenceNumber);
        }
        if ([value caseInsensitiveCompare:@"TRIM_HORIZON"] == NSOrderedSame) {
            return @(AWSKinesisShardIteratorTypeTrimHorizon);
        }
        if ([value caseInsensitiveCompare:@"LATEST"] == NSOrderedSame) {
            return @(AWSKinesisShardIteratorTypeLatest);
        }
        if ([value caseInsensitiveCompare:@"AT_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSKinesisShardIteratorTypeAtTimestamp);
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
            case AWSKinesisShardIteratorTypeAtTimestamp:
                return @"AT_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKinesisGetShardIteratorOutput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"shardIterator" : @"ShardIterator",
             };
}

@end

@implementation AWSKinesisHashKeyRange

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endingHashKey" : @"EndingHashKey",
             @"startingHashKey" : @"StartingHashKey",
             };
}

@end

@implementation AWSKinesisIncreaseStreamRetentionPeriodInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"retentionPeriodHours" : @"RetentionPeriodHours",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisListShardsInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveStartShardId" : @"ExclusiveStartShardId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"streamCreationTimestamp" : @"StreamCreationTimestamp",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)streamCreationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKinesisListShardsOutput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"shards" : @"Shards",
             };
}

+ (NSValueTransformer *)shardsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisShard class]];
}

@end

@implementation AWSKinesisListStreamsInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveStartStreamName" : @"ExclusiveStartStreamName",
             @"limit" : @"Limit",
             };
}

@end

@implementation AWSKinesisListStreamsOutput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hasMoreStreams" : @"HasMoreStreams",
             @"streamNames" : @"StreamNames",
             };
}

@end

@implementation AWSKinesisListTagsForStreamInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exclusiveStartTagKey" : @"ExclusiveStartTagKey",
             @"limit" : @"Limit",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisListTagsForStreamOutput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hasMoreTags" : @"HasMoreTags",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisTag class]];
}

@end

@implementation AWSKinesisMergeShardsInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adjacentShardToMerge" : @"AdjacentShardToMerge",
             @"shardToMerge" : @"ShardToMerge",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisPutRecordInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

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

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionType" : @"EncryptionType",
             @"sequenceNumber" : @"SequenceNumber",
             @"shardId" : @"ShardId",
             };
}

+ (NSValueTransformer *)encryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeKms);
        }
        return @(AWSKinesisEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisEncryptionTypeNone:
                return @"NONE";
            case AWSKinesisEncryptionTypeKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisPutRecordsInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"records" : @"Records",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)recordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisPutRecordsRequestEntry class]];
}

@end

@implementation AWSKinesisPutRecordsOutput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionType" : @"EncryptionType",
             @"failedRecordCount" : @"FailedRecordCount",
             @"records" : @"Records",
             };
}

+ (NSValueTransformer *)encryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeKms);
        }
        return @(AWSKinesisEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisEncryptionTypeNone:
                return @"NONE";
            case AWSKinesisEncryptionTypeKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisPutRecordsResultEntry class]];
}

@end

@implementation AWSKinesisPutRecordsRequestEntry

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             @"explicitHashKey" : @"ExplicitHashKey",
             @"partitionKey" : @"PartitionKey",
             };
}

@end

@implementation AWSKinesisPutRecordsResultEntry

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"sequenceNumber" : @"SequenceNumber",
             @"shardId" : @"ShardId",
             };
}

@end

@implementation AWSKinesisRecord

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateArrivalTimestamp" : @"ApproximateArrivalTimestamp",
             @"data" : @"Data",
             @"encryptionType" : @"EncryptionType",
             @"partitionKey" : @"PartitionKey",
             @"sequenceNumber" : @"SequenceNumber",
             };
}

+ (NSValueTransformer *)approximateArrivalTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)encryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeKms);
        }
        return @(AWSKinesisEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisEncryptionTypeNone:
                return @"NONE";
            case AWSKinesisEncryptionTypeKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisRemoveTagsFromStreamInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamName" : @"StreamName",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSKinesisSequenceNumberRange

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endingSequenceNumber" : @"EndingSequenceNumber",
             @"startingSequenceNumber" : @"StartingSequenceNumber",
             };
}

@end

@implementation AWSKinesisShard

+ (BOOL) supportsSecureCoding {
    return YES;
}

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisHashKeyRange class]];
}

+ (NSValueTransformer *)sequenceNumberRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisSequenceNumberRange class]];
}

@end

@implementation AWSKinesisSplitShardInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestStartingHashKey" : @"NewStartingHashKey",
             @"shardToSplit" : @"ShardToSplit",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisStartStreamEncryptionInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionType" : @"EncryptionType",
             @"keyId" : @"KeyId",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)encryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeKms);
        }
        return @(AWSKinesisEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisEncryptionTypeNone:
                return @"NONE";
            case AWSKinesisEncryptionTypeKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisStopStreamEncryptionInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionType" : @"EncryptionType",
             @"keyId" : @"KeyId",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)encryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeKms);
        }
        return @(AWSKinesisEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisEncryptionTypeNone:
                return @"NONE";
            case AWSKinesisEncryptionTypeKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisStreamDescription

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionType" : @"EncryptionType",
             @"enhancedMonitoring" : @"EnhancedMonitoring",
             @"hasMoreShards" : @"HasMoreShards",
             @"keyId" : @"KeyId",
             @"retentionPeriodHours" : @"RetentionPeriodHours",
             @"shards" : @"Shards",
             @"streamARN" : @"StreamARN",
             @"streamCreationTimestamp" : @"StreamCreationTimestamp",
             @"streamName" : @"StreamName",
             @"streamStatus" : @"StreamStatus",
             };
}

+ (NSValueTransformer *)encryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeKms);
        }
        return @(AWSKinesisEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisEncryptionTypeNone:
                return @"NONE";
            case AWSKinesisEncryptionTypeKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)enhancedMonitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisEnhancedMetrics class]];
}

+ (NSValueTransformer *)shardsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisShard class]];
}

+ (NSValueTransformer *)streamCreationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)streamStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKinesisStreamStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKinesisStreamStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKinesisStreamStatusActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisStreamDescriptionSummary

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionType" : @"EncryptionType",
             @"enhancedMonitoring" : @"EnhancedMonitoring",
             @"keyId" : @"KeyId",
             @"openShardCount" : @"OpenShardCount",
             @"retentionPeriodHours" : @"RetentionPeriodHours",
             @"streamARN" : @"StreamARN",
             @"streamCreationTimestamp" : @"StreamCreationTimestamp",
             @"streamName" : @"StreamName",
             @"streamStatus" : @"StreamStatus",
             };
}

+ (NSValueTransformer *)encryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeNone);
        }
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSKinesisEncryptionTypeKms);
        }
        return @(AWSKinesisEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisEncryptionTypeNone:
                return @"NONE";
            case AWSKinesisEncryptionTypeKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)enhancedMonitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisEnhancedMetrics class]];
}

+ (NSValueTransformer *)streamCreationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)streamStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKinesisStreamStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKinesisStreamStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKinesisStreamStatusActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisTag

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSKinesisUpdateShardCountInput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scalingType" : @"ScalingType",
             @"streamName" : @"StreamName",
             @"targetShardCount" : @"TargetShardCount",
             };
}

+ (NSValueTransformer *)scalingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNIFORM_SCALING"] == NSOrderedSame) {
            return @(AWSKinesisScalingTypeUniformScaling);
        }
        return @(AWSKinesisScalingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisScalingTypeUniformScaling:
                return @"UNIFORM_SCALING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisUpdateShardCountOutput

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentShardCount" : @"CurrentShardCount",
             @"streamName" : @"StreamName",
             @"targetShardCount" : @"TargetShardCount",
             };
}

@end
