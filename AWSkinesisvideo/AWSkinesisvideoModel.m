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

#import "AWSkinesisvideoModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSkinesisvideoErrorDomain = @"com.amazonaws.AWSkinesisvideoErrorDomain";

@implementation AWSkinesisvideoClipFragmentSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragmentSelectorType" : @"FragmentSelectorType",
             @"timestampRange" : @"TimestampRange",
             };
}

+ (NSValueTransformer *)fragmentSelectorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSkinesisvideoClipFragmentSelectorTypeProducerTimestamp);
        }
        if ([value caseInsensitiveCompare:@"SERVER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSkinesisvideoClipFragmentSelectorTypeServerTimestamp);
        }
        return @(AWSkinesisvideoClipFragmentSelectorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSkinesisvideoClipFragmentSelectorTypeProducerTimestamp:
                return @"PRODUCER_TIMESTAMP";
            case AWSkinesisvideoClipFragmentSelectorTypeServerTimestamp:
                return @"SERVER_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSkinesisvideoClipTimestampRange class]];
}

@end

@implementation AWSkinesisvideoClipTimestampRange

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

@implementation AWSkinesisvideoDASHFragmentSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragmentSelectorType" : @"FragmentSelectorType",
             @"timestampRange" : @"TimestampRange",
             };
}

+ (NSValueTransformer *)fragmentSelectorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSkinesisvideoDASHFragmentSelectorTypeProducerTimestamp);
        }
        if ([value caseInsensitiveCompare:@"SERVER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSkinesisvideoDASHFragmentSelectorTypeServerTimestamp);
        }
        return @(AWSkinesisvideoDASHFragmentSelectorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSkinesisvideoDASHFragmentSelectorTypeProducerTimestamp:
                return @"PRODUCER_TIMESTAMP";
            case AWSkinesisvideoDASHFragmentSelectorTypeServerTimestamp:
                return @"SERVER_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSkinesisvideoDASHTimestampRange class]];
}

@end

@implementation AWSkinesisvideoDASHTimestampRange

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

@implementation AWSkinesisvideoFragment

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

@implementation AWSkinesisvideoFragmentSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragmentSelectorType" : @"FragmentSelectorType",
             @"timestampRange" : @"TimestampRange",
             };
}

+ (NSValueTransformer *)fragmentSelectorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSkinesisvideoFragmentSelectorTypeProducerTimestamp);
        }
        if ([value caseInsensitiveCompare:@"SERVER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSkinesisvideoFragmentSelectorTypeServerTimestamp);
        }
        return @(AWSkinesisvideoFragmentSelectorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSkinesisvideoFragmentSelectorTypeProducerTimestamp:
                return @"PRODUCER_TIMESTAMP";
            case AWSkinesisvideoFragmentSelectorTypeServerTimestamp:
                return @"SERVER_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSkinesisvideoTimestampRange class]];
}

@end

@implementation AWSkinesisvideoGetClipInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clipFragmentSelector" : @"ClipFragmentSelector",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)clipFragmentSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSkinesisvideoClipFragmentSelector class]];
}

@end

@implementation AWSkinesisvideoGetClipOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"payload" : @"Payload",
             };
}

@end

@implementation AWSkinesisvideoGetDASHStreamingSessionURLInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DASHFragmentSelector" : @"DASHFragmentSelector",
             @"displayFragmentNumber" : @"DisplayFragmentNumber",
             @"displayFragmentTimestamp" : @"DisplayFragmentTimestamp",
             @"expires" : @"Expires",
             @"maxManifestFragmentResults" : @"MaxManifestFragmentResults",
             @"playbackMode" : @"PlaybackMode",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)DASHFragmentSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSkinesisvideoDASHFragmentSelector class]];
}

+ (NSValueTransformer *)displayFragmentNumberJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALWAYS"] == NSOrderedSame) {
            return @(AWSkinesisvideoDASHDisplayFragmentNumberAlways);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSkinesisvideoDASHDisplayFragmentNumberNever);
        }
        return @(AWSkinesisvideoDASHDisplayFragmentNumberUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSkinesisvideoDASHDisplayFragmentNumberAlways:
                return @"ALWAYS";
            case AWSkinesisvideoDASHDisplayFragmentNumberNever:
                return @"NEVER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)displayFragmentTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALWAYS"] == NSOrderedSame) {
            return @(AWSkinesisvideoDASHDisplayFragmentTimestampAlways);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSkinesisvideoDASHDisplayFragmentTimestampNever);
        }
        return @(AWSkinesisvideoDASHDisplayFragmentTimestampUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSkinesisvideoDASHDisplayFragmentTimestampAlways:
                return @"ALWAYS";
            case AWSkinesisvideoDASHDisplayFragmentTimestampNever:
                return @"NEVER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)playbackModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LIVE"] == NSOrderedSame) {
            return @(AWSkinesisvideoDASHPlaybackModeLive);
        }
        if ([value caseInsensitiveCompare:@"LIVE_REPLAY"] == NSOrderedSame) {
            return @(AWSkinesisvideoDASHPlaybackModeLiveReplay);
        }
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSkinesisvideoDASHPlaybackModeOnDemand);
        }
        return @(AWSkinesisvideoDASHPlaybackModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSkinesisvideoDASHPlaybackModeLive:
                return @"LIVE";
            case AWSkinesisvideoDASHPlaybackModeLiveReplay:
                return @"LIVE_REPLAY";
            case AWSkinesisvideoDASHPlaybackModeOnDemand:
                return @"ON_DEMAND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSkinesisvideoGetDASHStreamingSessionURLOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DASHStreamingSessionURL" : @"DASHStreamingSessionURL",
             };
}

@end

@implementation AWSkinesisvideoGetHLSStreamingSessionURLInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containerFormat" : @"ContainerFormat",
             @"discontinuityMode" : @"DiscontinuityMode",
             @"displayFragmentTimestamp" : @"DisplayFragmentTimestamp",
             @"expires" : @"Expires",
             @"HLSFragmentSelector" : @"HLSFragmentSelector",
             @"maxMediaPlaylistFragmentResults" : @"MaxMediaPlaylistFragmentResults",
             @"playbackMode" : @"PlaybackMode",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)containerFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAGMENTED_MP4"] == NSOrderedSame) {
            return @(AWSkinesisvideoContainerFormatFragmentedMp4);
        }
        if ([value caseInsensitiveCompare:@"MPEG_TS"] == NSOrderedSame) {
            return @(AWSkinesisvideoContainerFormatMpegTs);
        }
        return @(AWSkinesisvideoContainerFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSkinesisvideoContainerFormatFragmentedMp4:
                return @"FRAGMENTED_MP4";
            case AWSkinesisvideoContainerFormatMpegTs:
                return @"MPEG_TS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)discontinuityModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALWAYS"] == NSOrderedSame) {
            return @(AWSkinesisvideoHLSDiscontinuityModeAlways);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSkinesisvideoHLSDiscontinuityModeNever);
        }
        if ([value caseInsensitiveCompare:@"ON_DISCONTINUITY"] == NSOrderedSame) {
            return @(AWSkinesisvideoHLSDiscontinuityModeOnDiscontinuity);
        }
        return @(AWSkinesisvideoHLSDiscontinuityModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSkinesisvideoHLSDiscontinuityModeAlways:
                return @"ALWAYS";
            case AWSkinesisvideoHLSDiscontinuityModeNever:
                return @"NEVER";
            case AWSkinesisvideoHLSDiscontinuityModeOnDiscontinuity:
                return @"ON_DISCONTINUITY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)displayFragmentTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALWAYS"] == NSOrderedSame) {
            return @(AWSkinesisvideoHLSDisplayFragmentTimestampAlways);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSkinesisvideoHLSDisplayFragmentTimestampNever);
        }
        return @(AWSkinesisvideoHLSDisplayFragmentTimestampUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSkinesisvideoHLSDisplayFragmentTimestampAlways:
                return @"ALWAYS";
            case AWSkinesisvideoHLSDisplayFragmentTimestampNever:
                return @"NEVER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)HLSFragmentSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSkinesisvideoHLSFragmentSelector class]];
}

+ (NSValueTransformer *)playbackModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LIVE"] == NSOrderedSame) {
            return @(AWSkinesisvideoHLSPlaybackModeLive);
        }
        if ([value caseInsensitiveCompare:@"LIVE_REPLAY"] == NSOrderedSame) {
            return @(AWSkinesisvideoHLSPlaybackModeLiveReplay);
        }
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSkinesisvideoHLSPlaybackModeOnDemand);
        }
        return @(AWSkinesisvideoHLSPlaybackModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSkinesisvideoHLSPlaybackModeLive:
                return @"LIVE";
            case AWSkinesisvideoHLSPlaybackModeLiveReplay:
                return @"LIVE_REPLAY";
            case AWSkinesisvideoHLSPlaybackModeOnDemand:
                return @"ON_DEMAND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSkinesisvideoGetHLSStreamingSessionURLOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"HLSStreamingSessionURL" : @"HLSStreamingSessionURL",
             };
}

@end

@implementation AWSkinesisvideoGetMediaForFragmentListInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragments" : @"Fragments",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSkinesisvideoGetMediaForFragmentListOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"payload" : @"Payload",
             };
}

@end

@implementation AWSkinesisvideoHLSFragmentSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragmentSelectorType" : @"FragmentSelectorType",
             @"timestampRange" : @"TimestampRange",
             };
}

+ (NSValueTransformer *)fragmentSelectorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSkinesisvideoHLSFragmentSelectorTypeProducerTimestamp);
        }
        if ([value caseInsensitiveCompare:@"SERVER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSkinesisvideoHLSFragmentSelectorTypeServerTimestamp);
        }
        return @(AWSkinesisvideoHLSFragmentSelectorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSkinesisvideoHLSFragmentSelectorTypeProducerTimestamp:
                return @"PRODUCER_TIMESTAMP";
            case AWSkinesisvideoHLSFragmentSelectorTypeServerTimestamp:
                return @"SERVER_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSkinesisvideoHLSTimestampRange class]];
}

@end

@implementation AWSkinesisvideoHLSTimestampRange

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

@implementation AWSkinesisvideoListFragmentsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragmentSelector" : @"FragmentSelector",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)fragmentSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSkinesisvideoFragmentSelector class]];
}

@end

@implementation AWSkinesisvideoListFragmentsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragments" : @"Fragments",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)fragmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSkinesisvideoFragment class]];
}

@end

@implementation AWSkinesisvideoTimestampRange

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
