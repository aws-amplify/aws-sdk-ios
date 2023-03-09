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

#import "AWSKinesisVideoArchivedMediaModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSKinesisVideoArchivedMediaErrorDomain = @"com.amazonaws.AWSKinesisVideoArchivedMediaErrorDomain";

@implementation AWSKinesisVideoArchivedMediaClipFragmentSelector

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragmentSelectorType" : @"FragmentSelectorType",
             @"timestampRange" : @"TimestampRange",
             };
}

+ (NSValueTransformer *)fragmentSelectorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaClipFragmentSelectorTypeProducerTimestamp);
        }
        if ([value caseInsensitiveCompare:@"SERVER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaClipFragmentSelectorTypeServerTimestamp);
        }
        return @(AWSKinesisVideoArchivedMediaClipFragmentSelectorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaClipFragmentSelectorTypeProducerTimestamp:
                return @"PRODUCER_TIMESTAMP";
            case AWSKinesisVideoArchivedMediaClipFragmentSelectorTypeServerTimestamp:
                return @"SERVER_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoArchivedMediaClipTimestampRange class]];
}

@end

@implementation AWSKinesisVideoArchivedMediaClipTimestampRange

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSKinesisVideoArchivedMediaDASHFragmentSelector

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragmentSelectorType" : @"FragmentSelectorType",
             @"timestampRange" : @"TimestampRange",
             };
}

+ (NSValueTransformer *)fragmentSelectorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaDASHFragmentSelectorTypeProducerTimestamp);
        }
        if ([value caseInsensitiveCompare:@"SERVER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaDASHFragmentSelectorTypeServerTimestamp);
        }
        return @(AWSKinesisVideoArchivedMediaDASHFragmentSelectorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaDASHFragmentSelectorTypeProducerTimestamp:
                return @"PRODUCER_TIMESTAMP";
            case AWSKinesisVideoArchivedMediaDASHFragmentSelectorTypeServerTimestamp:
                return @"SERVER_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoArchivedMediaDASHTimestampRange class]];
}

@end

@implementation AWSKinesisVideoArchivedMediaDASHTimestampRange

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSKinesisVideoArchivedMediaFragment

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSKinesisVideoArchivedMediaGetClipInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clipFragmentSelector" : @"ClipFragmentSelector",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)clipFragmentSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoArchivedMediaClipFragmentSelector class]];
}

@end

@implementation AWSKinesisVideoArchivedMediaGetClipOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"payload" : @"Payload",
             };
}

@end

@implementation AWSKinesisVideoArchivedMediaGetDASHStreamingSessionURLInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoArchivedMediaDASHFragmentSelector class]];
}

+ (NSValueTransformer *)displayFragmentNumberJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALWAYS"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaDASHDisplayFragmentNumberAlways);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaDASHDisplayFragmentNumberNever);
        }
        return @(AWSKinesisVideoArchivedMediaDASHDisplayFragmentNumberUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaDASHDisplayFragmentNumberAlways:
                return @"ALWAYS";
            case AWSKinesisVideoArchivedMediaDASHDisplayFragmentNumberNever:
                return @"NEVER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)displayFragmentTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALWAYS"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaDASHDisplayFragmentTimestampAlways);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaDASHDisplayFragmentTimestampNever);
        }
        return @(AWSKinesisVideoArchivedMediaDASHDisplayFragmentTimestampUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaDASHDisplayFragmentTimestampAlways:
                return @"ALWAYS";
            case AWSKinesisVideoArchivedMediaDASHDisplayFragmentTimestampNever:
                return @"NEVER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)playbackModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LIVE"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaDASHPlaybackModeLive);
        }
        if ([value caseInsensitiveCompare:@"LIVE_REPLAY"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaDASHPlaybackModeLiveReplay);
        }
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaDASHPlaybackModeOnDemand);
        }
        return @(AWSKinesisVideoArchivedMediaDASHPlaybackModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaDASHPlaybackModeLive:
                return @"LIVE";
            case AWSKinesisVideoArchivedMediaDASHPlaybackModeLiveReplay:
                return @"LIVE_REPLAY";
            case AWSKinesisVideoArchivedMediaDASHPlaybackModeOnDemand:
                return @"ON_DEMAND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoArchivedMediaGetDASHStreamingSessionURLOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"DASHStreamingSessionURL" : @"DASHStreamingSessionURL",
             };
}

@end

@implementation AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
            return @(AWSKinesisVideoArchivedMediaContainerFormatFragmentedMp4);
        }
        if ([value caseInsensitiveCompare:@"MPEG_TS"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaContainerFormatMpegTs);
        }
        return @(AWSKinesisVideoArchivedMediaContainerFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaContainerFormatFragmentedMp4:
                return @"FRAGMENTED_MP4";
            case AWSKinesisVideoArchivedMediaContainerFormatMpegTs:
                return @"MPEG_TS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)discontinuityModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALWAYS"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaHLSDiscontinuityModeAlways);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaHLSDiscontinuityModeNever);
        }
        if ([value caseInsensitiveCompare:@"ON_DISCONTINUITY"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaHLSDiscontinuityModeOnDiscontinuity);
        }
        return @(AWSKinesisVideoArchivedMediaHLSDiscontinuityModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaHLSDiscontinuityModeAlways:
                return @"ALWAYS";
            case AWSKinesisVideoArchivedMediaHLSDiscontinuityModeNever:
                return @"NEVER";
            case AWSKinesisVideoArchivedMediaHLSDiscontinuityModeOnDiscontinuity:
                return @"ON_DISCONTINUITY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)displayFragmentTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALWAYS"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaHLSDisplayFragmentTimestampAlways);
        }
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaHLSDisplayFragmentTimestampNever);
        }
        return @(AWSKinesisVideoArchivedMediaHLSDisplayFragmentTimestampUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaHLSDisplayFragmentTimestampAlways:
                return @"ALWAYS";
            case AWSKinesisVideoArchivedMediaHLSDisplayFragmentTimestampNever:
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
            return @(AWSKinesisVideoArchivedMediaHLSPlaybackModeLive);
        }
        if ([value caseInsensitiveCompare:@"LIVE_REPLAY"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaHLSPlaybackModeLiveReplay);
        }
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaHLSPlaybackModeOnDemand);
        }
        return @(AWSKinesisVideoArchivedMediaHLSPlaybackModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaHLSPlaybackModeLive:
                return @"LIVE";
            case AWSKinesisVideoArchivedMediaHLSPlaybackModeLiveReplay:
                return @"LIVE_REPLAY";
            case AWSKinesisVideoArchivedMediaHLSPlaybackModeOnDemand:
                return @"ON_DEMAND";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"HLSStreamingSessionURL" : @"HLSStreamingSessionURL",
             };
}

@end

@implementation AWSKinesisVideoArchivedMediaGetImagesInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTimestamp" : @"EndTimestamp",
             @"format" : @"Format",
             @"formatConfig" : @"FormatConfig",
             @"heightPixels" : @"HeightPixels",
             @"imageSelectorType" : @"ImageSelectorType",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"samplingInterval" : @"SamplingInterval",
             @"startTimestamp" : @"StartTimestamp",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             @"widthPixels" : @"WidthPixels",
             };
}

+ (NSValueTransformer *)endTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JPEG"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaFormatJpeg);
        }
        if ([value caseInsensitiveCompare:@"PNG"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaFormatPng);
        }
        return @(AWSKinesisVideoArchivedMediaFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaFormatJpeg:
                return @"JPEG";
            case AWSKinesisVideoArchivedMediaFormatPng:
                return @"PNG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)imageSelectorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRODUCER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaImageSelectorTypeProducerTimestamp);
        }
        if ([value caseInsensitiveCompare:@"SERVER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaImageSelectorTypeServerTimestamp);
        }
        return @(AWSKinesisVideoArchivedMediaImageSelectorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaImageSelectorTypeProducerTimestamp:
                return @"PRODUCER_TIMESTAMP";
            case AWSKinesisVideoArchivedMediaImageSelectorTypeServerTimestamp:
                return @"SERVER_TIMESTAMP";
            default:
                return nil;
        }
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

@implementation AWSKinesisVideoArchivedMediaGetImagesOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"images" : @"Images",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)imagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisVideoArchivedMediaImage class]];
}

@end

@implementation AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragments" : @"Fragments",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"payload" : @"Payload",
             };
}

@end

@implementation AWSKinesisVideoArchivedMediaHLSFragmentSelector

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSKinesisVideoArchivedMediaImage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"Error",
             @"imageContent" : @"ImageContent",
             @"timeStamp" : @"TimeStamp",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_MEDIA"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaImageErrorNoMedia);
        }
        if ([value caseInsensitiveCompare:@"MEDIA_ERROR"] == NSOrderedSame) {
            return @(AWSKinesisVideoArchivedMediaImageErrorMediaError);
        }
        return @(AWSKinesisVideoArchivedMediaImageErrorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoArchivedMediaImageErrorNoMedia:
                return @"NO_MEDIA";
            case AWSKinesisVideoArchivedMediaImageErrorMediaError:
                return @"MEDIA_ERROR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timeStampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSKinesisVideoArchivedMediaListFragmentsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fragmentSelector" : @"FragmentSelector",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)fragmentSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoArchivedMediaFragmentSelector class]];
}

@end

@implementation AWSKinesisVideoArchivedMediaListFragmentsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
