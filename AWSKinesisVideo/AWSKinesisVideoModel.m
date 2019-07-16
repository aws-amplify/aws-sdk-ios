//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSKinesisVideoModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSKinesisVideoErrorDomain = @"com.amazonaws.AWSKinesisVideoErrorDomain";

@implementation AWSKinesisVideoCreateStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataRetentionInHours" : @"DataRetentionInHours",
             @"deviceName" : @"DeviceName",
             @"kmsKeyId" : @"KmsKeyId",
             @"mediaType" : @"MediaType",
             @"streamName" : @"StreamName",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSKinesisVideoCreateStreamOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamARN" : @"StreamARN",
             };
}

@end

@implementation AWSKinesisVideoDeleteStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentVersion" : @"CurrentVersion",
             @"streamARN" : @"StreamARN",
             };
}

@end

@implementation AWSKinesisVideoDeleteStreamOutput

@end

@implementation AWSKinesisVideoDescribeStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisVideoDescribeStreamOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamInfo" : @"StreamInfo",
             };
}

+ (NSValueTransformer *)streamInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoStreamInfo class]];
}

@end

@implementation AWSKinesisVideoGetDataEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APIName" : @"APIName",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)APINameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUT_MEDIA"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINamePutMedia);
        }
        if ([value caseInsensitiveCompare:@"GET_MEDIA"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINameGetMedia);
        }
        if ([value caseInsensitiveCompare:@"LIST_FRAGMENTS"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINameListFragments);
        }
        if ([value caseInsensitiveCompare:@"GET_MEDIA_FOR_FRAGMENT_LIST"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINameGetMediaForFragmentList);
        }
        if ([value caseInsensitiveCompare:@"GET_HLS_STREAMING_SESSION_URL"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINameGetHlsStreamingSessionUrl);
        }
        if ([value caseInsensitiveCompare:@"GET_DASH_STREAMING_SESSION_URL"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINameGetDashStreamingSessionUrl);
        }
        return @(AWSKinesisVideoAPINameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoAPINamePutMedia:
                return @"PUT_MEDIA";
            case AWSKinesisVideoAPINameGetMedia:
                return @"GET_MEDIA";
            case AWSKinesisVideoAPINameListFragments:
                return @"LIST_FRAGMENTS";
            case AWSKinesisVideoAPINameGetMediaForFragmentList:
                return @"GET_MEDIA_FOR_FRAGMENT_LIST";
            case AWSKinesisVideoAPINameGetHlsStreamingSessionUrl:
                return @"GET_HLS_STREAMING_SESSION_URL";
            case AWSKinesisVideoAPINameGetDashStreamingSessionUrl:
                return @"GET_DASH_STREAMING_SESSION_URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoGetDataEndpointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataEndpoint" : @"DataEndpoint",
             };
}

@end

@implementation AWSKinesisVideoListStreamsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"streamNameCondition" : @"StreamNameCondition",
             };
}

+ (NSValueTransformer *)streamNameConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoStreamNameCondition class]];
}

@end

@implementation AWSKinesisVideoListStreamsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"streamInfoList" : @"StreamInfoList",
             };
}

+ (NSValueTransformer *)streamInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisVideoStreamInfo class]];
}

@end

@implementation AWSKinesisVideoListTagsForStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisVideoListTagsForStreamOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSKinesisVideoStreamInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"dataRetentionInHours" : @"DataRetentionInHours",
             @"deviceName" : @"DeviceName",
             @"kmsKeyId" : @"KmsKeyId",
             @"mediaType" : @"MediaType",
             @"status" : @"Status",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
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

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKinesisVideoStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKinesisVideoStatusActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSKinesisVideoStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKinesisVideoStatusDeleting);
        }
        return @(AWSKinesisVideoStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoStatusCreating:
                return @"CREATING";
            case AWSKinesisVideoStatusActive:
                return @"ACTIVE";
            case AWSKinesisVideoStatusUpdating:
                return @"UPDATING";
            case AWSKinesisVideoStatusDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoStreamNameCondition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparisonOperator" : @"ComparisonOperator",
             @"comparisonValue" : @"ComparisonValue",
             };
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BEGINS_WITH"] == NSOrderedSame) {
            return @(AWSKinesisVideoComparisonOperatorBeginsWith);
        }
        return @(AWSKinesisVideoComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoComparisonOperatorBeginsWith:
                return @"BEGINS_WITH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoTagStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSKinesisVideoTagStreamOutput

@end

@implementation AWSKinesisVideoUntagStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             @"tagKeyList" : @"TagKeyList",
             };
}

@end

@implementation AWSKinesisVideoUntagStreamOutput

@end

@implementation AWSKinesisVideoUpdateDataRetentionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentVersion" : @"CurrentVersion",
             @"dataRetentionChangeInHours" : @"DataRetentionChangeInHours",
             @"operation" : @"Operation",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCREASE_DATA_RETENTION"] == NSOrderedSame) {
            return @(AWSKinesisVideoUpdateDataRetentionOperationIncreaseDataRetention);
        }
        if ([value caseInsensitiveCompare:@"DECREASE_DATA_RETENTION"] == NSOrderedSame) {
            return @(AWSKinesisVideoUpdateDataRetentionOperationDecreaseDataRetention);
        }
        return @(AWSKinesisVideoUpdateDataRetentionOperationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoUpdateDataRetentionOperationIncreaseDataRetention:
                return @"INCREASE_DATA_RETENTION";
            case AWSKinesisVideoUpdateDataRetentionOperationDecreaseDataRetention:
                return @"DECREASE_DATA_RETENTION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoUpdateDataRetentionOutput

@end

@implementation AWSKinesisVideoUpdateStreamInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentVersion" : @"CurrentVersion",
             @"deviceName" : @"DeviceName",
             @"mediaType" : @"MediaType",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisVideoUpdateStreamOutput

@end
