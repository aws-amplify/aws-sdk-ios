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

#import "AWSKinesisVideoArchivedMediaModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSKinesisVideoArchivedMediaErrorDomain = @"com.amazonaws.AWSKinesisVideoArchivedMediaErrorDomain";

@implementation AWSKinesisVideoArchivedMediaFragment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragmentLengthInMilliseconds" : @"FragmentLengthInMilliseconds",
             @"fragmentNumber" : @"FragmentNumber",
             @"fragmentSizeInBytes" : @"FragmentSizeInBytes",
             @"producerTimestamp" : @"ProducerTimestamp",
             @"serverTimestamp" : @"ServerTimestamp",
             };
}

+ (NSValueTransformer *)producerTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)serverTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKinesisVideoArchivedMediaFragmentSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragmentSelectorType" : @"FragmentSelectorType",
             @"timestampRange" : @"TimestampRange",
             };
}

+ (NSValueTransformer *)fragmentSelectorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaFragmentSelectorTypeProducerTimestamp);
        }
        if ([value caseInsensitiveCompare:@"SERVER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaFragmentSelectorTypeServerTimestamp);
        }
        return @(AWSKinesisVideoArchivedMediaFragmentSelectorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaFragmentSelectorTypeProducerTimestamp:
                return @"PRODUCER_TIMESTAMP";
            case AWSKinesisVideoArchivedMediaFragmentSelectorTypeServerTimestamp:
                return @"SERVER_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoArchivedMediaTimestampRange class]];
}

@end

@implementation AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"discontinuityMode" : @"DiscontinuityMode",
             @"expires" : @"Expires",
             @"HLSFragmentSelector" : @"HLSFragmentSelector",
             @"maxMediaPlaylistFragmentResults" : @"MaxMediaPlaylistFragmentResults",
             @"playbackMode" : @"PlaybackMode",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)discontinuityModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALWAYS"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaDiscontinuityModeAlways);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaDiscontinuityModeNever);
        }
        return @(AWSKinesisVideoArchivedMediaDiscontinuityModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaDiscontinuityModeAlways:
                return @"ALWAYS";
            case AWSKinesisVideoArchivedMediaDiscontinuityModeNever:
                return @"NEVER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)HLSFragmentSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoArchivedMediaHLSFragmentSelector class]];
}

+ (NSValueTransformer *)playbackModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LIVE"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaPlaybackModeLive);
        }
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaPlaybackModeOnDemand);
        }
        return @(AWSKinesisVideoArchivedMediaPlaybackModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaPlaybackModeLive:
                return @"LIVE";
            case AWSKinesisVideoArchivedMediaPlaybackModeOnDemand:
                return @"ON_DEMAND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"HLSStreamingSessionURL" : @"HLSStreamingSessionURL",
             };
}

@end

@implementation AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragments" : @"Fragments",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"payload" : @"Payload",
             };
}

@end

@implementation AWSKinesisVideoArchivedMediaHLSFragmentSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragmentSelectorType" : @"FragmentSelectorType",
             @"timestampRange" : @"TimestampRange",
             };
}

+ (NSValueTransformer *)fragmentSelectorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaHLSFragmentSelectorTypeProducerTimestamp);
        }
        if ([value caseInsensitiveCompare:@"SERVER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaHLSFragmentSelectorTypeServerTimestamp);
        }
        return @(AWSKinesisVideoArchivedMediaHLSFragmentSelectorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaHLSFragmentSelectorTypeProducerTimestamp:
                return @"PRODUCER_TIMESTAMP";
            case AWSKinesisVideoArchivedMediaHLSFragmentSelectorTypeServerTimestamp:
                return @"SERVER_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoArchivedMediaHLSTimestampRange class]];
}

@end

@implementation AWSKinesisVideoArchivedMediaHLSTimestampRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTimestamp" : @"EndTimestamp",
             @"startTimestamp" : @"StartTimestamp",
             };
}

+ (NSValueTransformer *)endTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKinesisVideoArchivedMediaListFragmentsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragmentSelector" : @"FragmentSelector",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)fragmentSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoArchivedMediaFragmentSelector class]];
}

@end

@implementation AWSKinesisVideoArchivedMediaListFragmentsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragments" : @"Fragments",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)fragmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisVideoArchivedMediaFragment class]];
}

@end

@implementation AWSKinesisVideoArchivedMediaTimestampRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTimestamp" : @"EndTimestamp",
             @"startTimestamp" : @"StartTimestamp",
             };
}

+ (NSValueTransformer *)endTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end
