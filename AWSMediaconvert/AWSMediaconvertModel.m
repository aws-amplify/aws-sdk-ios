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

#import "AWSMediaconvertModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSMediaconvertErrorDomain = @"com.amazonaws.AWSMediaconvertErrorDomain";

@implementation AWSMediaconvertAacSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioDescriptionBroadcasterMix" : @"AudioDescriptionBroadcasterMix",
             @"bitrate" : @"Bitrate",
             @"codecProfile" : @"CodecProfile",
             @"codingMode" : @"CodingMode",
             @"rateControlMode" : @"RateControlMode",
             @"rawFormat" : @"RawFormat",
             @"sampleRate" : @"SampleRate",
             @"specification" : @"Specification",
             @"vbrQuality" : @"VbrQuality",
             };
}

+ (NSValueTransformer *)audioDescriptionBroadcasterMixJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BROADCASTER_MIXED_AD"] == NSOrderedSame) {
            return @(AWSMediaconvertAacAudioDescriptionBroadcasterMixBroadcasterMixedAd);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSMediaconvertAacAudioDescriptionBroadcasterMixNormal);
        }
        return @(AWSMediaconvertAacAudioDescriptionBroadcasterMixUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAacAudioDescriptionBroadcasterMixBroadcasterMixedAd:
                return @"BROADCASTER_MIXED_AD";
            case AWSMediaconvertAacAudioDescriptionBroadcasterMixNormal:
                return @"NORMAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LC"] == NSOrderedSame) {
            return @(AWSMediaconvertAacCodecProfileLc);
        }
        if ([value caseInsensitiveCompare:@"HEV1"] == NSOrderedSame) {
            return @(AWSMediaconvertAacCodecProfileHev1);
        }
        if ([value caseInsensitiveCompare:@"HEV2"] == NSOrderedSame) {
            return @(AWSMediaconvertAacCodecProfileHev2);
        }
        return @(AWSMediaconvertAacCodecProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAacCodecProfileLc:
                return @"LC";
            case AWSMediaconvertAacCodecProfileHev1:
                return @"HEV1";
            case AWSMediaconvertAacCodecProfileHev2:
                return @"HEV2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AD_RECEIVER_MIX"] == NSOrderedSame) {
            return @(AWSMediaconvertAacCodingModeAdReceiverMix);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_0"] == NSOrderedSame) {
            return @(AWSMediaconvertAacCodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_1"] == NSOrderedSame) {
            return @(AWSMediaconvertAacCodingModeCodingMode11);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSMediaconvertAacCodingModeCodingMode20);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_5_1"] == NSOrderedSame) {
            return @(AWSMediaconvertAacCodingModeCodingMode51);
        }
        return @(AWSMediaconvertAacCodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAacCodingModeAdReceiverMix:
                return @"AD_RECEIVER_MIX";
            case AWSMediaconvertAacCodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSMediaconvertAacCodingModeCodingMode11:
                return @"CODING_MODE_1_1";
            case AWSMediaconvertAacCodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            case AWSMediaconvertAacCodingModeCodingMode51:
                return @"CODING_MODE_5_1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSMediaconvertAacRateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSMediaconvertAacRateControlModeVbr);
        }
        return @(AWSMediaconvertAacRateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAacRateControlModeCbr:
                return @"CBR";
            case AWSMediaconvertAacRateControlModeVbr:
                return @"VBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rawFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LATM_LOAS"] == NSOrderedSame) {
            return @(AWSMediaconvertAacRawFormatLatmLoas);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertAacRawFormatNone);
        }
        return @(AWSMediaconvertAacRawFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAacRawFormatLatmLoas:
                return @"LATM_LOAS";
            case AWSMediaconvertAacRawFormatNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)specificationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MPEG2"] == NSOrderedSame) {
            return @(AWSMediaconvertAacSpecificationMpeg2);
        }
        if ([value caseInsensitiveCompare:@"MPEG4"] == NSOrderedSame) {
            return @(AWSMediaconvertAacSpecificationMpeg4);
        }
        return @(AWSMediaconvertAacSpecificationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAacSpecificationMpeg2:
                return @"MPEG2";
            case AWSMediaconvertAacSpecificationMpeg4:
                return @"MPEG4";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vbrQualityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSMediaconvertAacVbrQualityLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM_LOW"] == NSOrderedSame) {
            return @(AWSMediaconvertAacVbrQualityMediumLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM_HIGH"] == NSOrderedSame) {
            return @(AWSMediaconvertAacVbrQualityMediumHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMediaconvertAacVbrQualityHigh);
        }
        return @(AWSMediaconvertAacVbrQualityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAacVbrQualityLow:
                return @"LOW";
            case AWSMediaconvertAacVbrQualityMediumLow:
                return @"MEDIUM_LOW";
            case AWSMediaconvertAacVbrQualityMediumHigh:
                return @"MEDIUM_HIGH";
            case AWSMediaconvertAacVbrQualityHigh:
                return @"HIGH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertAc3Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitrate" : @"Bitrate",
             @"bitstreamMode" : @"BitstreamMode",
             @"codingMode" : @"CodingMode",
             @"dialnorm" : @"Dialnorm",
             @"dynamicRangeCompressionProfile" : @"DynamicRangeCompressionProfile",
             @"lfeFilter" : @"LfeFilter",
             @"metadataControl" : @"MetadataControl",
             @"sampleRate" : @"SampleRate",
             };
}

+ (NSValueTransformer *)bitstreamModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETE_MAIN"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3BitstreamModeCompleteMain);
        }
        if ([value caseInsensitiveCompare:@"COMMENTARY"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3BitstreamModeCommentary);
        }
        if ([value caseInsensitiveCompare:@"DIALOGUE"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3BitstreamModeDialogue);
        }
        if ([value caseInsensitiveCompare:@"EMERGENCY"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3BitstreamModeEmergency);
        }
        if ([value caseInsensitiveCompare:@"HEARING_IMPAIRED"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3BitstreamModeHearingImpaired);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_AND_EFFECTS"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3BitstreamModeMusicAndEffects);
        }
        if ([value caseInsensitiveCompare:@"VISUALLY_IMPAIRED"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3BitstreamModeVisuallyImpaired);
        }
        if ([value caseInsensitiveCompare:@"VOICE_OVER"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3BitstreamModeVoiceOver);
        }
        return @(AWSMediaconvertAc3BitstreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAc3BitstreamModeCompleteMain:
                return @"COMPLETE_MAIN";
            case AWSMediaconvertAc3BitstreamModeCommentary:
                return @"COMMENTARY";
            case AWSMediaconvertAc3BitstreamModeDialogue:
                return @"DIALOGUE";
            case AWSMediaconvertAc3BitstreamModeEmergency:
                return @"EMERGENCY";
            case AWSMediaconvertAc3BitstreamModeHearingImpaired:
                return @"HEARING_IMPAIRED";
            case AWSMediaconvertAc3BitstreamModeMusicAndEffects:
                return @"MUSIC_AND_EFFECTS";
            case AWSMediaconvertAc3BitstreamModeVisuallyImpaired:
                return @"VISUALLY_IMPAIRED";
            case AWSMediaconvertAc3BitstreamModeVoiceOver:
                return @"VOICE_OVER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_0"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3CodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_1"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3CodingModeCodingMode11);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3CodingModeCodingMode20);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_3_2_LFE"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3CodingModeCodingMode32Lfe);
        }
        return @(AWSMediaconvertAc3CodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAc3CodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSMediaconvertAc3CodingModeCodingMode11:
                return @"CODING_MODE_1_1";
            case AWSMediaconvertAc3CodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            case AWSMediaconvertAc3CodingModeCodingMode32Lfe:
                return @"CODING_MODE_3_2_LFE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicRangeCompressionProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3DynamicRangeCompressionProfileFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3DynamicRangeCompressionProfileNone);
        }
        return @(AWSMediaconvertAc3DynamicRangeCompressionProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAc3DynamicRangeCompressionProfileFilmStandard:
                return @"FILM_STANDARD";
            case AWSMediaconvertAc3DynamicRangeCompressionProfileNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lfeFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3LfeFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3LfeFilterDisabled);
        }
        return @(AWSMediaconvertAc3LfeFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAc3LfeFilterEnabled:
                return @"ENABLED";
            case AWSMediaconvertAc3LfeFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metadataControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3MetadataControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSMediaconvertAc3MetadataControlUseConfigured);
        }
        return @(AWSMediaconvertAc3MetadataControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAc3MetadataControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSMediaconvertAc3MetadataControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertAccelerationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mode" : @"Mode",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertAccelerationModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertAccelerationModeEnabled);
        }
        if ([value caseInsensitiveCompare:@"PREFERRED"] == NSOrderedSame) {
            return @(AWSMediaconvertAccelerationModePreferred);
        }
        return @(AWSMediaconvertAccelerationModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAccelerationModeDisabled:
                return @"DISABLED";
            case AWSMediaconvertAccelerationModeEnabled:
                return @"ENABLED";
            case AWSMediaconvertAccelerationModePreferred:
                return @"PREFERRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertAiffSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitDepth" : @"BitDepth",
             @"channels" : @"Channels",
             @"sampleRate" : @"SampleRate",
             };
}

@end

@implementation AWSMediaconvertAncillarySourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"convert608To708" : @"Convert608To708",
             @"sourceAncillaryChannelNumber" : @"SourceAncillaryChannelNumber",
             @"terminateCaptions" : @"TerminateCaptions",
             };
}

+ (NSValueTransformer *)convert608To708JSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UPCONVERT"] == NSOrderedSame) {
            return @(AWSMediaconvertAncillaryConvert608To708Upconvert);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertAncillaryConvert608To708Disabled);
        }
        return @(AWSMediaconvertAncillaryConvert608To708Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAncillaryConvert608To708Upconvert:
                return @"UPCONVERT";
            case AWSMediaconvertAncillaryConvert608To708Disabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)terminateCaptionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"END_OF_INPUT"] == NSOrderedSame) {
            return @(AWSMediaconvertAncillaryTerminateCaptionsEndOfInput);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertAncillaryTerminateCaptionsDisabled);
        }
        return @(AWSMediaconvertAncillaryTerminateCaptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAncillaryTerminateCaptionsEndOfInput:
                return @"END_OF_INPUT";
            case AWSMediaconvertAncillaryTerminateCaptionsDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertAssociateCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSMediaconvertAssociateCertificateResponse

@end

@implementation AWSMediaconvertAudioCodecSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aacSettings" : @"AacSettings",
             @"ac3Settings" : @"Ac3Settings",
             @"aiffSettings" : @"AiffSettings",
             @"codec" : @"Codec",
             @"eac3AtmosSettings" : @"Eac3AtmosSettings",
             @"eac3Settings" : @"Eac3Settings",
             @"mp2Settings" : @"Mp2Settings",
             @"mp3Settings" : @"Mp3Settings",
             @"opusSettings" : @"OpusSettings",
             @"vorbisSettings" : @"VorbisSettings",
             @"wavSettings" : @"WavSettings",
             };
}

+ (NSValueTransformer *)aacSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAacSettings class]];
}

+ (NSValueTransformer *)ac3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAc3Settings class]];
}

+ (NSValueTransformer *)aiffSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAiffSettings class]];
}

+ (NSValueTransformer *)codecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AAC"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioCodecAac);
        }
        if ([value caseInsensitiveCompare:@"MP2"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioCodecMp2);
        }
        if ([value caseInsensitiveCompare:@"MP3"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioCodecMp3);
        }
        if ([value caseInsensitiveCompare:@"WAV"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioCodecWav);
        }
        if ([value caseInsensitiveCompare:@"AIFF"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioCodecAiff);
        }
        if ([value caseInsensitiveCompare:@"AC3"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioCodecAc3);
        }
        if ([value caseInsensitiveCompare:@"EAC3"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioCodecEac3);
        }
        if ([value caseInsensitiveCompare:@"EAC3_ATMOS"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioCodecEac3Atmos);
        }
        if ([value caseInsensitiveCompare:@"VORBIS"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioCodecVorbis);
        }
        if ([value caseInsensitiveCompare:@"OPUS"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioCodecOpus);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioCodecPassthrough);
        }
        return @(AWSMediaconvertAudioCodecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAudioCodecAac:
                return @"AAC";
            case AWSMediaconvertAudioCodecMp2:
                return @"MP2";
            case AWSMediaconvertAudioCodecMp3:
                return @"MP3";
            case AWSMediaconvertAudioCodecWav:
                return @"WAV";
            case AWSMediaconvertAudioCodecAiff:
                return @"AIFF";
            case AWSMediaconvertAudioCodecAc3:
                return @"AC3";
            case AWSMediaconvertAudioCodecEac3:
                return @"EAC3";
            case AWSMediaconvertAudioCodecEac3Atmos:
                return @"EAC3_ATMOS";
            case AWSMediaconvertAudioCodecVorbis:
                return @"VORBIS";
            case AWSMediaconvertAudioCodecOpus:
                return @"OPUS";
            case AWSMediaconvertAudioCodecPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)eac3AtmosSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertEac3AtmosSettings class]];
}

+ (NSValueTransformer *)eac3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertEac3Settings class]];
}

+ (NSValueTransformer *)mp2SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertMp2Settings class]];
}

+ (NSValueTransformer *)mp3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertMp3Settings class]];
}

+ (NSValueTransformer *)opusSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertOpusSettings class]];
}

+ (NSValueTransformer *)vorbisSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertVorbisSettings class]];
}

+ (NSValueTransformer *)wavSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertWavSettings class]];
}

@end

@implementation AWSMediaconvertAudioDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioNormalizationSettings" : @"AudioNormalizationSettings",
             @"audioSourceName" : @"AudioSourceName",
             @"audioType" : @"AudioType",
             @"audioTypeControl" : @"AudioTypeControl",
             @"codecSettings" : @"CodecSettings",
             @"customLanguageCode" : @"CustomLanguageCode",
             @"languageCode" : @"LanguageCode",
             @"languageCodeControl" : @"LanguageCodeControl",
             @"remixSettings" : @"RemixSettings",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)audioNormalizationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAudioNormalizationSettings class]];
}

+ (NSValueTransformer *)audioTypeControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioTypeControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioTypeControlUseConfigured);
        }
        return @(AWSMediaconvertAudioTypeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAudioTypeControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSMediaconvertAudioTypeControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAudioCodecSettings class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEng);
        }
        if ([value caseInsensitiveCompare:@"SPA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSpa);
        }
        if ([value caseInsensitiveCompare:@"FRA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFra);
        }
        if ([value caseInsensitiveCompare:@"DEU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDeu);
        }
        if ([value caseInsensitiveCompare:@"GER"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGer);
        }
        if ([value caseInsensitiveCompare:@"ZHO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZho);
        }
        if ([value caseInsensitiveCompare:@"ARA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAra);
        }
        if ([value caseInsensitiveCompare:@"HIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHin);
        }
        if ([value caseInsensitiveCompare:@"JPN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeJpn);
        }
        if ([value caseInsensitiveCompare:@"RUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRus);
        }
        if ([value caseInsensitiveCompare:@"POR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePor);
        }
        if ([value caseInsensitiveCompare:@"ITA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIta);
        }
        if ([value caseInsensitiveCompare:@"URD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUrd);
        }
        if ([value caseInsensitiveCompare:@"VIE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVie);
        }
        if ([value caseInsensitiveCompare:@"KOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKor);
        }
        if ([value caseInsensitiveCompare:@"PAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePan);
        }
        if ([value caseInsensitiveCompare:@"ABK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAbk);
        }
        if ([value caseInsensitiveCompare:@"AAR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAar);
        }
        if ([value caseInsensitiveCompare:@"AFR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAfr);
        }
        if ([value caseInsensitiveCompare:@"AKA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAka);
        }
        if ([value caseInsensitiveCompare:@"SQI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSqi);
        }
        if ([value caseInsensitiveCompare:@"AMH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAmh);
        }
        if ([value caseInsensitiveCompare:@"ARG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeArg);
        }
        if ([value caseInsensitiveCompare:@"HYE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHye);
        }
        if ([value caseInsensitiveCompare:@"ASM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAsm);
        }
        if ([value caseInsensitiveCompare:@"AVA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAva);
        }
        if ([value caseInsensitiveCompare:@"AVE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAve);
        }
        if ([value caseInsensitiveCompare:@"AYM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAym);
        }
        if ([value caseInsensitiveCompare:@"AZE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAze);
        }
        if ([value caseInsensitiveCompare:@"BAM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBam);
        }
        if ([value caseInsensitiveCompare:@"BAK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBak);
        }
        if ([value caseInsensitiveCompare:@"EUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEus);
        }
        if ([value caseInsensitiveCompare:@"BEL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBel);
        }
        if ([value caseInsensitiveCompare:@"BEN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBen);
        }
        if ([value caseInsensitiveCompare:@"BIH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBih);
        }
        if ([value caseInsensitiveCompare:@"BIS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBis);
        }
        if ([value caseInsensitiveCompare:@"BOS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBos);
        }
        if ([value caseInsensitiveCompare:@"BRE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBre);
        }
        if ([value caseInsensitiveCompare:@"BUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBul);
        }
        if ([value caseInsensitiveCompare:@"MYA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMya);
        }
        if ([value caseInsensitiveCompare:@"CAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCat);
        }
        if ([value caseInsensitiveCompare:@"KHM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKhm);
        }
        if ([value caseInsensitiveCompare:@"CHA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCha);
        }
        if ([value caseInsensitiveCompare:@"CHE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChe);
        }
        if ([value caseInsensitiveCompare:@"NYA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNya);
        }
        if ([value caseInsensitiveCompare:@"CHU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChu);
        }
        if ([value caseInsensitiveCompare:@"CHV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChv);
        }
        if ([value caseInsensitiveCompare:@"COR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCor);
        }
        if ([value caseInsensitiveCompare:@"COS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCos);
        }
        if ([value caseInsensitiveCompare:@"CRE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCre);
        }
        if ([value caseInsensitiveCompare:@"HRV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHrv);
        }
        if ([value caseInsensitiveCompare:@"CES"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCes);
        }
        if ([value caseInsensitiveCompare:@"DAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDan);
        }
        if ([value caseInsensitiveCompare:@"DIV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDiv);
        }
        if ([value caseInsensitiveCompare:@"NLD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNld);
        }
        if ([value caseInsensitiveCompare:@"DZO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDzo);
        }
        if ([value caseInsensitiveCompare:@"ENM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEnm);
        }
        if ([value caseInsensitiveCompare:@"EPO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEpo);
        }
        if ([value caseInsensitiveCompare:@"EST"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEst);
        }
        if ([value caseInsensitiveCompare:@"EWE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEwe);
        }
        if ([value caseInsensitiveCompare:@"FAO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFao);
        }
        if ([value caseInsensitiveCompare:@"FIJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFij);
        }
        if ([value caseInsensitiveCompare:@"FIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFin);
        }
        if ([value caseInsensitiveCompare:@"FRM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFrm);
        }
        if ([value caseInsensitiveCompare:@"FUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFul);
        }
        if ([value caseInsensitiveCompare:@"GLA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGla);
        }
        if ([value caseInsensitiveCompare:@"GLG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGlg);
        }
        if ([value caseInsensitiveCompare:@"LUG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLug);
        }
        if ([value caseInsensitiveCompare:@"KAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKat);
        }
        if ([value caseInsensitiveCompare:@"ELL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEll);
        }
        if ([value caseInsensitiveCompare:@"GRN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGrn);
        }
        if ([value caseInsensitiveCompare:@"GUJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGuj);
        }
        if ([value caseInsensitiveCompare:@"HAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHat);
        }
        if ([value caseInsensitiveCompare:@"HAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHau);
        }
        if ([value caseInsensitiveCompare:@"HEB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHeb);
        }
        if ([value caseInsensitiveCompare:@"HER"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHer);
        }
        if ([value caseInsensitiveCompare:@"HMO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHmo);
        }
        if ([value caseInsensitiveCompare:@"HUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHun);
        }
        if ([value caseInsensitiveCompare:@"ISL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIsl);
        }
        if ([value caseInsensitiveCompare:@"IDO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIdo);
        }
        if ([value caseInsensitiveCompare:@"IBO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIbo);
        }
        if ([value caseInsensitiveCompare:@"IND"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeInd);
        }
        if ([value caseInsensitiveCompare:@"INA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIna);
        }
        if ([value caseInsensitiveCompare:@"ILE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIle);
        }
        if ([value caseInsensitiveCompare:@"IKU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIku);
        }
        if ([value caseInsensitiveCompare:@"IPK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIpk);
        }
        if ([value caseInsensitiveCompare:@"GLE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGle);
        }
        if ([value caseInsensitiveCompare:@"JAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeJav);
        }
        if ([value caseInsensitiveCompare:@"KAL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKal);
        }
        if ([value caseInsensitiveCompare:@"KAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKan);
        }
        if ([value caseInsensitiveCompare:@"KAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKau);
        }
        if ([value caseInsensitiveCompare:@"KAS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKas);
        }
        if ([value caseInsensitiveCompare:@"KAZ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKaz);
        }
        if ([value caseInsensitiveCompare:@"KIK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKik);
        }
        if ([value caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKin);
        }
        if ([value caseInsensitiveCompare:@"KIR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKir);
        }
        if ([value caseInsensitiveCompare:@"KOM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKom);
        }
        if ([value caseInsensitiveCompare:@"KON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKon);
        }
        if ([value caseInsensitiveCompare:@"KUA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKua);
        }
        if ([value caseInsensitiveCompare:@"KUR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKur);
        }
        if ([value caseInsensitiveCompare:@"LAO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLao);
        }
        if ([value caseInsensitiveCompare:@"LAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLat);
        }
        if ([value caseInsensitiveCompare:@"LAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLav);
        }
        if ([value caseInsensitiveCompare:@"LIM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLim);
        }
        if ([value caseInsensitiveCompare:@"LIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLin);
        }
        if ([value caseInsensitiveCompare:@"LIT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLit);
        }
        if ([value caseInsensitiveCompare:@"LUB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLub);
        }
        if ([value caseInsensitiveCompare:@"LTZ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLtz);
        }
        if ([value caseInsensitiveCompare:@"MKD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMkd);
        }
        if ([value caseInsensitiveCompare:@"MLG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMlg);
        }
        if ([value caseInsensitiveCompare:@"MSA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMsa);
        }
        if ([value caseInsensitiveCompare:@"MAL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMal);
        }
        if ([value caseInsensitiveCompare:@"MLT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMlt);
        }
        if ([value caseInsensitiveCompare:@"GLV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGlv);
        }
        if ([value caseInsensitiveCompare:@"MRI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMri);
        }
        if ([value caseInsensitiveCompare:@"MAR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMar);
        }
        if ([value caseInsensitiveCompare:@"MAH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMah);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMon);
        }
        if ([value caseInsensitiveCompare:@"NAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNau);
        }
        if ([value caseInsensitiveCompare:@"NAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNav);
        }
        if ([value caseInsensitiveCompare:@"NDE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNde);
        }
        if ([value caseInsensitiveCompare:@"NBL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNbl);
        }
        if ([value caseInsensitiveCompare:@"NDO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNdo);
        }
        if ([value caseInsensitiveCompare:@"NEP"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNep);
        }
        if ([value caseInsensitiveCompare:@"SME"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSme);
        }
        if ([value caseInsensitiveCompare:@"NOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNor);
        }
        if ([value caseInsensitiveCompare:@"NOB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNob);
        }
        if ([value caseInsensitiveCompare:@"NNO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNno);
        }
        if ([value caseInsensitiveCompare:@"OCI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOci);
        }
        if ([value caseInsensitiveCompare:@"OJI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOji);
        }
        if ([value caseInsensitiveCompare:@"ORI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOri);
        }
        if ([value caseInsensitiveCompare:@"ORM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOrm);
        }
        if ([value caseInsensitiveCompare:@"OSS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOss);
        }
        if ([value caseInsensitiveCompare:@"PLI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePli);
        }
        if ([value caseInsensitiveCompare:@"FAS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFas);
        }
        if ([value caseInsensitiveCompare:@"POL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePol);
        }
        if ([value caseInsensitiveCompare:@"PUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePus);
        }
        if ([value caseInsensitiveCompare:@"QUE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQue);
        }
        if ([value caseInsensitiveCompare:@"QAA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQaa);
        }
        if ([value caseInsensitiveCompare:@"RON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRon);
        }
        if ([value caseInsensitiveCompare:@"ROH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRoh);
        }
        if ([value caseInsensitiveCompare:@"RUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRun);
        }
        if ([value caseInsensitiveCompare:@"SMO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSmo);
        }
        if ([value caseInsensitiveCompare:@"SAG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSag);
        }
        if ([value caseInsensitiveCompare:@"SAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSan);
        }
        if ([value caseInsensitiveCompare:@"SRD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSrd);
        }
        if ([value caseInsensitiveCompare:@"SRB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSrb);
        }
        if ([value caseInsensitiveCompare:@"SNA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSna);
        }
        if ([value caseInsensitiveCompare:@"III"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIii);
        }
        if ([value caseInsensitiveCompare:@"SND"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSnd);
        }
        if ([value caseInsensitiveCompare:@"SIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSin);
        }
        if ([value caseInsensitiveCompare:@"SLK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSlk);
        }
        if ([value caseInsensitiveCompare:@"SLV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSlv);
        }
        if ([value caseInsensitiveCompare:@"SOM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSom);
        }
        if ([value caseInsensitiveCompare:@"SOT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSot);
        }
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSun);
        }
        if ([value caseInsensitiveCompare:@"SWA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSwa);
        }
        if ([value caseInsensitiveCompare:@"SSW"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSsw);
        }
        if ([value caseInsensitiveCompare:@"SWE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSwe);
        }
        if ([value caseInsensitiveCompare:@"TGL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTgl);
        }
        if ([value caseInsensitiveCompare:@"TAH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTah);
        }
        if ([value caseInsensitiveCompare:@"TGK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTgk);
        }
        if ([value caseInsensitiveCompare:@"TAM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTam);
        }
        if ([value caseInsensitiveCompare:@"TAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTat);
        }
        if ([value caseInsensitiveCompare:@"TEL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTel);
        }
        if ([value caseInsensitiveCompare:@"THA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTha);
        }
        if ([value caseInsensitiveCompare:@"BOD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBod);
        }
        if ([value caseInsensitiveCompare:@"TIR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTir);
        }
        if ([value caseInsensitiveCompare:@"TON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTon);
        }
        if ([value caseInsensitiveCompare:@"TSO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTso);
        }
        if ([value caseInsensitiveCompare:@"TSN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTsn);
        }
        if ([value caseInsensitiveCompare:@"TUR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTur);
        }
        if ([value caseInsensitiveCompare:@"TUK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTuk);
        }
        if ([value caseInsensitiveCompare:@"TWI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTwi);
        }
        if ([value caseInsensitiveCompare:@"UIG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUig);
        }
        if ([value caseInsensitiveCompare:@"UKR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUkr);
        }
        if ([value caseInsensitiveCompare:@"UZB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUzb);
        }
        if ([value caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVen);
        }
        if ([value caseInsensitiveCompare:@"VOL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVol);
        }
        if ([value caseInsensitiveCompare:@"WLN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeWln);
        }
        if ([value caseInsensitiveCompare:@"CYM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCym);
        }
        if ([value caseInsensitiveCompare:@"FRY"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFry);
        }
        if ([value caseInsensitiveCompare:@"WOL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeWol);
        }
        if ([value caseInsensitiveCompare:@"XHO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeXho);
        }
        if ([value caseInsensitiveCompare:@"YID"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeYid);
        }
        if ([value caseInsensitiveCompare:@"YOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeYor);
        }
        if ([value caseInsensitiveCompare:@"ZHA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZha);
        }
        if ([value caseInsensitiveCompare:@"ZUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZul);
        }
        if ([value caseInsensitiveCompare:@"ORJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOrj);
        }
        if ([value caseInsensitiveCompare:@"QPC"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQpc);
        }
        if ([value caseInsensitiveCompare:@"TNG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTng);
        }
        return @(AWSMediaconvertLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertLanguageCodeEng:
                return @"ENG";
            case AWSMediaconvertLanguageCodeSpa:
                return @"SPA";
            case AWSMediaconvertLanguageCodeFra:
                return @"FRA";
            case AWSMediaconvertLanguageCodeDeu:
                return @"DEU";
            case AWSMediaconvertLanguageCodeGer:
                return @"GER";
            case AWSMediaconvertLanguageCodeZho:
                return @"ZHO";
            case AWSMediaconvertLanguageCodeAra:
                return @"ARA";
            case AWSMediaconvertLanguageCodeHin:
                return @"HIN";
            case AWSMediaconvertLanguageCodeJpn:
                return @"JPN";
            case AWSMediaconvertLanguageCodeRus:
                return @"RUS";
            case AWSMediaconvertLanguageCodePor:
                return @"POR";
            case AWSMediaconvertLanguageCodeIta:
                return @"ITA";
            case AWSMediaconvertLanguageCodeUrd:
                return @"URD";
            case AWSMediaconvertLanguageCodeVie:
                return @"VIE";
            case AWSMediaconvertLanguageCodeKor:
                return @"KOR";
            case AWSMediaconvertLanguageCodePan:
                return @"PAN";
            case AWSMediaconvertLanguageCodeAbk:
                return @"ABK";
            case AWSMediaconvertLanguageCodeAar:
                return @"AAR";
            case AWSMediaconvertLanguageCodeAfr:
                return @"AFR";
            case AWSMediaconvertLanguageCodeAka:
                return @"AKA";
            case AWSMediaconvertLanguageCodeSqi:
                return @"SQI";
            case AWSMediaconvertLanguageCodeAmh:
                return @"AMH";
            case AWSMediaconvertLanguageCodeArg:
                return @"ARG";
            case AWSMediaconvertLanguageCodeHye:
                return @"HYE";
            case AWSMediaconvertLanguageCodeAsm:
                return @"ASM";
            case AWSMediaconvertLanguageCodeAva:
                return @"AVA";
            case AWSMediaconvertLanguageCodeAve:
                return @"AVE";
            case AWSMediaconvertLanguageCodeAym:
                return @"AYM";
            case AWSMediaconvertLanguageCodeAze:
                return @"AZE";
            case AWSMediaconvertLanguageCodeBam:
                return @"BAM";
            case AWSMediaconvertLanguageCodeBak:
                return @"BAK";
            case AWSMediaconvertLanguageCodeEus:
                return @"EUS";
            case AWSMediaconvertLanguageCodeBel:
                return @"BEL";
            case AWSMediaconvertLanguageCodeBen:
                return @"BEN";
            case AWSMediaconvertLanguageCodeBih:
                return @"BIH";
            case AWSMediaconvertLanguageCodeBis:
                return @"BIS";
            case AWSMediaconvertLanguageCodeBos:
                return @"BOS";
            case AWSMediaconvertLanguageCodeBre:
                return @"BRE";
            case AWSMediaconvertLanguageCodeBul:
                return @"BUL";
            case AWSMediaconvertLanguageCodeMya:
                return @"MYA";
            case AWSMediaconvertLanguageCodeCat:
                return @"CAT";
            case AWSMediaconvertLanguageCodeKhm:
                return @"KHM";
            case AWSMediaconvertLanguageCodeCha:
                return @"CHA";
            case AWSMediaconvertLanguageCodeChe:
                return @"CHE";
            case AWSMediaconvertLanguageCodeNya:
                return @"NYA";
            case AWSMediaconvertLanguageCodeChu:
                return @"CHU";
            case AWSMediaconvertLanguageCodeChv:
                return @"CHV";
            case AWSMediaconvertLanguageCodeCor:
                return @"COR";
            case AWSMediaconvertLanguageCodeCos:
                return @"COS";
            case AWSMediaconvertLanguageCodeCre:
                return @"CRE";
            case AWSMediaconvertLanguageCodeHrv:
                return @"HRV";
            case AWSMediaconvertLanguageCodeCes:
                return @"CES";
            case AWSMediaconvertLanguageCodeDan:
                return @"DAN";
            case AWSMediaconvertLanguageCodeDiv:
                return @"DIV";
            case AWSMediaconvertLanguageCodeNld:
                return @"NLD";
            case AWSMediaconvertLanguageCodeDzo:
                return @"DZO";
            case AWSMediaconvertLanguageCodeEnm:
                return @"ENM";
            case AWSMediaconvertLanguageCodeEpo:
                return @"EPO";
            case AWSMediaconvertLanguageCodeEst:
                return @"EST";
            case AWSMediaconvertLanguageCodeEwe:
                return @"EWE";
            case AWSMediaconvertLanguageCodeFao:
                return @"FAO";
            case AWSMediaconvertLanguageCodeFij:
                return @"FIJ";
            case AWSMediaconvertLanguageCodeFin:
                return @"FIN";
            case AWSMediaconvertLanguageCodeFrm:
                return @"FRM";
            case AWSMediaconvertLanguageCodeFul:
                return @"FUL";
            case AWSMediaconvertLanguageCodeGla:
                return @"GLA";
            case AWSMediaconvertLanguageCodeGlg:
                return @"GLG";
            case AWSMediaconvertLanguageCodeLug:
                return @"LUG";
            case AWSMediaconvertLanguageCodeKat:
                return @"KAT";
            case AWSMediaconvertLanguageCodeEll:
                return @"ELL";
            case AWSMediaconvertLanguageCodeGrn:
                return @"GRN";
            case AWSMediaconvertLanguageCodeGuj:
                return @"GUJ";
            case AWSMediaconvertLanguageCodeHat:
                return @"HAT";
            case AWSMediaconvertLanguageCodeHau:
                return @"HAU";
            case AWSMediaconvertLanguageCodeHeb:
                return @"HEB";
            case AWSMediaconvertLanguageCodeHer:
                return @"HER";
            case AWSMediaconvertLanguageCodeHmo:
                return @"HMO";
            case AWSMediaconvertLanguageCodeHun:
                return @"HUN";
            case AWSMediaconvertLanguageCodeIsl:
                return @"ISL";
            case AWSMediaconvertLanguageCodeIdo:
                return @"IDO";
            case AWSMediaconvertLanguageCodeIbo:
                return @"IBO";
            case AWSMediaconvertLanguageCodeInd:
                return @"IND";
            case AWSMediaconvertLanguageCodeIna:
                return @"INA";
            case AWSMediaconvertLanguageCodeIle:
                return @"ILE";
            case AWSMediaconvertLanguageCodeIku:
                return @"IKU";
            case AWSMediaconvertLanguageCodeIpk:
                return @"IPK";
            case AWSMediaconvertLanguageCodeGle:
                return @"GLE";
            case AWSMediaconvertLanguageCodeJav:
                return @"JAV";
            case AWSMediaconvertLanguageCodeKal:
                return @"KAL";
            case AWSMediaconvertLanguageCodeKan:
                return @"KAN";
            case AWSMediaconvertLanguageCodeKau:
                return @"KAU";
            case AWSMediaconvertLanguageCodeKas:
                return @"KAS";
            case AWSMediaconvertLanguageCodeKaz:
                return @"KAZ";
            case AWSMediaconvertLanguageCodeKik:
                return @"KIK";
            case AWSMediaconvertLanguageCodeKin:
                return @"KIN";
            case AWSMediaconvertLanguageCodeKir:
                return @"KIR";
            case AWSMediaconvertLanguageCodeKom:
                return @"KOM";
            case AWSMediaconvertLanguageCodeKon:
                return @"KON";
            case AWSMediaconvertLanguageCodeKua:
                return @"KUA";
            case AWSMediaconvertLanguageCodeKur:
                return @"KUR";
            case AWSMediaconvertLanguageCodeLao:
                return @"LAO";
            case AWSMediaconvertLanguageCodeLat:
                return @"LAT";
            case AWSMediaconvertLanguageCodeLav:
                return @"LAV";
            case AWSMediaconvertLanguageCodeLim:
                return @"LIM";
            case AWSMediaconvertLanguageCodeLin:
                return @"LIN";
            case AWSMediaconvertLanguageCodeLit:
                return @"LIT";
            case AWSMediaconvertLanguageCodeLub:
                return @"LUB";
            case AWSMediaconvertLanguageCodeLtz:
                return @"LTZ";
            case AWSMediaconvertLanguageCodeMkd:
                return @"MKD";
            case AWSMediaconvertLanguageCodeMlg:
                return @"MLG";
            case AWSMediaconvertLanguageCodeMsa:
                return @"MSA";
            case AWSMediaconvertLanguageCodeMal:
                return @"MAL";
            case AWSMediaconvertLanguageCodeMlt:
                return @"MLT";
            case AWSMediaconvertLanguageCodeGlv:
                return @"GLV";
            case AWSMediaconvertLanguageCodeMri:
                return @"MRI";
            case AWSMediaconvertLanguageCodeMar:
                return @"MAR";
            case AWSMediaconvertLanguageCodeMah:
                return @"MAH";
            case AWSMediaconvertLanguageCodeMon:
                return @"MON";
            case AWSMediaconvertLanguageCodeNau:
                return @"NAU";
            case AWSMediaconvertLanguageCodeNav:
                return @"NAV";
            case AWSMediaconvertLanguageCodeNde:
                return @"NDE";
            case AWSMediaconvertLanguageCodeNbl:
                return @"NBL";
            case AWSMediaconvertLanguageCodeNdo:
                return @"NDO";
            case AWSMediaconvertLanguageCodeNep:
                return @"NEP";
            case AWSMediaconvertLanguageCodeSme:
                return @"SME";
            case AWSMediaconvertLanguageCodeNor:
                return @"NOR";
            case AWSMediaconvertLanguageCodeNob:
                return @"NOB";
            case AWSMediaconvertLanguageCodeNno:
                return @"NNO";
            case AWSMediaconvertLanguageCodeOci:
                return @"OCI";
            case AWSMediaconvertLanguageCodeOji:
                return @"OJI";
            case AWSMediaconvertLanguageCodeOri:
                return @"ORI";
            case AWSMediaconvertLanguageCodeOrm:
                return @"ORM";
            case AWSMediaconvertLanguageCodeOss:
                return @"OSS";
            case AWSMediaconvertLanguageCodePli:
                return @"PLI";
            case AWSMediaconvertLanguageCodeFas:
                return @"FAS";
            case AWSMediaconvertLanguageCodePol:
                return @"POL";
            case AWSMediaconvertLanguageCodePus:
                return @"PUS";
            case AWSMediaconvertLanguageCodeQue:
                return @"QUE";
            case AWSMediaconvertLanguageCodeQaa:
                return @"QAA";
            case AWSMediaconvertLanguageCodeRon:
                return @"RON";
            case AWSMediaconvertLanguageCodeRoh:
                return @"ROH";
            case AWSMediaconvertLanguageCodeRun:
                return @"RUN";
            case AWSMediaconvertLanguageCodeSmo:
                return @"SMO";
            case AWSMediaconvertLanguageCodeSag:
                return @"SAG";
            case AWSMediaconvertLanguageCodeSan:
                return @"SAN";
            case AWSMediaconvertLanguageCodeSrd:
                return @"SRD";
            case AWSMediaconvertLanguageCodeSrb:
                return @"SRB";
            case AWSMediaconvertLanguageCodeSna:
                return @"SNA";
            case AWSMediaconvertLanguageCodeIii:
                return @"III";
            case AWSMediaconvertLanguageCodeSnd:
                return @"SND";
            case AWSMediaconvertLanguageCodeSin:
                return @"SIN";
            case AWSMediaconvertLanguageCodeSlk:
                return @"SLK";
            case AWSMediaconvertLanguageCodeSlv:
                return @"SLV";
            case AWSMediaconvertLanguageCodeSom:
                return @"SOM";
            case AWSMediaconvertLanguageCodeSot:
                return @"SOT";
            case AWSMediaconvertLanguageCodeSun:
                return @"SUN";
            case AWSMediaconvertLanguageCodeSwa:
                return @"SWA";
            case AWSMediaconvertLanguageCodeSsw:
                return @"SSW";
            case AWSMediaconvertLanguageCodeSwe:
                return @"SWE";
            case AWSMediaconvertLanguageCodeTgl:
                return @"TGL";
            case AWSMediaconvertLanguageCodeTah:
                return @"TAH";
            case AWSMediaconvertLanguageCodeTgk:
                return @"TGK";
            case AWSMediaconvertLanguageCodeTam:
                return @"TAM";
            case AWSMediaconvertLanguageCodeTat:
                return @"TAT";
            case AWSMediaconvertLanguageCodeTel:
                return @"TEL";
            case AWSMediaconvertLanguageCodeTha:
                return @"THA";
            case AWSMediaconvertLanguageCodeBod:
                return @"BOD";
            case AWSMediaconvertLanguageCodeTir:
                return @"TIR";
            case AWSMediaconvertLanguageCodeTon:
                return @"TON";
            case AWSMediaconvertLanguageCodeTso:
                return @"TSO";
            case AWSMediaconvertLanguageCodeTsn:
                return @"TSN";
            case AWSMediaconvertLanguageCodeTur:
                return @"TUR";
            case AWSMediaconvertLanguageCodeTuk:
                return @"TUK";
            case AWSMediaconvertLanguageCodeTwi:
                return @"TWI";
            case AWSMediaconvertLanguageCodeUig:
                return @"UIG";
            case AWSMediaconvertLanguageCodeUkr:
                return @"UKR";
            case AWSMediaconvertLanguageCodeUzb:
                return @"UZB";
            case AWSMediaconvertLanguageCodeVen:
                return @"VEN";
            case AWSMediaconvertLanguageCodeVol:
                return @"VOL";
            case AWSMediaconvertLanguageCodeWln:
                return @"WLN";
            case AWSMediaconvertLanguageCodeCym:
                return @"CYM";
            case AWSMediaconvertLanguageCodeFry:
                return @"FRY";
            case AWSMediaconvertLanguageCodeWol:
                return @"WOL";
            case AWSMediaconvertLanguageCodeXho:
                return @"XHO";
            case AWSMediaconvertLanguageCodeYid:
                return @"YID";
            case AWSMediaconvertLanguageCodeYor:
                return @"YOR";
            case AWSMediaconvertLanguageCodeZha:
                return @"ZHA";
            case AWSMediaconvertLanguageCodeZul:
                return @"ZUL";
            case AWSMediaconvertLanguageCodeOrj:
                return @"ORJ";
            case AWSMediaconvertLanguageCodeQpc:
                return @"QPC";
            case AWSMediaconvertLanguageCodeTng:
                return @"TNG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioLanguageCodeControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioLanguageCodeControlUseConfigured);
        }
        return @(AWSMediaconvertAudioLanguageCodeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAudioLanguageCodeControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSMediaconvertAudioLanguageCodeControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)remixSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertRemixSettings class]];
}

@end

@implementation AWSMediaconvertAudioNormalizationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithm" : @"Algorithm",
             @"algorithmControl" : @"AlgorithmControl",
             @"correctionGateLevel" : @"CorrectionGateLevel",
             @"loudnessLogging" : @"LoudnessLogging",
             @"peakCalculation" : @"PeakCalculation",
             @"targetLkfs" : @"TargetLkfs",
             };
}

+ (NSValueTransformer *)algorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_1"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioNormalizationAlgorithmItuBs17701);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_2"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioNormalizationAlgorithmItuBs17702);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_3"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioNormalizationAlgorithmItuBs17703);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_4"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioNormalizationAlgorithmItuBs17704);
        }
        return @(AWSMediaconvertAudioNormalizationAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAudioNormalizationAlgorithmItuBs17701:
                return @"ITU_BS_1770_1";
            case AWSMediaconvertAudioNormalizationAlgorithmItuBs17702:
                return @"ITU_BS_1770_2";
            case AWSMediaconvertAudioNormalizationAlgorithmItuBs17703:
                return @"ITU_BS_1770_3";
            case AWSMediaconvertAudioNormalizationAlgorithmItuBs17704:
                return @"ITU_BS_1770_4";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)algorithmControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CORRECT_AUDIO"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioNormalizationAlgorithmControlCorrectAudio);
        }
        if ([value caseInsensitiveCompare:@"MEASURE_ONLY"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioNormalizationAlgorithmControlMeasureOnly);
        }
        return @(AWSMediaconvertAudioNormalizationAlgorithmControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAudioNormalizationAlgorithmControlCorrectAudio:
                return @"CORRECT_AUDIO";
            case AWSMediaconvertAudioNormalizationAlgorithmControlMeasureOnly:
                return @"MEASURE_ONLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)loudnessLoggingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LOG"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioNormalizationLoudnessLoggingLog);
        }
        if ([value caseInsensitiveCompare:@"DONT_LOG"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioNormalizationLoudnessLoggingDontLog);
        }
        return @(AWSMediaconvertAudioNormalizationLoudnessLoggingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAudioNormalizationLoudnessLoggingLog:
                return @"LOG";
            case AWSMediaconvertAudioNormalizationLoudnessLoggingDontLog:
                return @"DONT_LOG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)peakCalculationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRUE_PEAK"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioNormalizationPeakCalculationTruePeak);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioNormalizationPeakCalculationNone);
        }
        return @(AWSMediaconvertAudioNormalizationPeakCalculationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAudioNormalizationPeakCalculationTruePeak:
                return @"TRUE_PEAK";
            case AWSMediaconvertAudioNormalizationPeakCalculationNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertAudioSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customLanguageCode" : @"CustomLanguageCode",
             @"defaultSelection" : @"DefaultSelection",
             @"externalAudioFileInput" : @"ExternalAudioFileInput",
             @"languageCode" : @"LanguageCode",
             @"offset" : @"Offset",
             @"pids" : @"Pids",
             @"programSelection" : @"ProgramSelection",
             @"remixSettings" : @"RemixSettings",
             @"selectorType" : @"SelectorType",
             @"tracks" : @"Tracks",
             };
}

+ (NSValueTransformer *)defaultSelectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioDefaultSelectionDefault);
        }
        if ([value caseInsensitiveCompare:@"NOT_DEFAULT"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioDefaultSelectionNotDefault);
        }
        return @(AWSMediaconvertAudioDefaultSelectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAudioDefaultSelectionDefault:
                return @"DEFAULT";
            case AWSMediaconvertAudioDefaultSelectionNotDefault:
                return @"NOT_DEFAULT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEng);
        }
        if ([value caseInsensitiveCompare:@"SPA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSpa);
        }
        if ([value caseInsensitiveCompare:@"FRA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFra);
        }
        if ([value caseInsensitiveCompare:@"DEU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDeu);
        }
        if ([value caseInsensitiveCompare:@"GER"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGer);
        }
        if ([value caseInsensitiveCompare:@"ZHO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZho);
        }
        if ([value caseInsensitiveCompare:@"ARA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAra);
        }
        if ([value caseInsensitiveCompare:@"HIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHin);
        }
        if ([value caseInsensitiveCompare:@"JPN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeJpn);
        }
        if ([value caseInsensitiveCompare:@"RUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRus);
        }
        if ([value caseInsensitiveCompare:@"POR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePor);
        }
        if ([value caseInsensitiveCompare:@"ITA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIta);
        }
        if ([value caseInsensitiveCompare:@"URD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUrd);
        }
        if ([value caseInsensitiveCompare:@"VIE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVie);
        }
        if ([value caseInsensitiveCompare:@"KOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKor);
        }
        if ([value caseInsensitiveCompare:@"PAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePan);
        }
        if ([value caseInsensitiveCompare:@"ABK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAbk);
        }
        if ([value caseInsensitiveCompare:@"AAR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAar);
        }
        if ([value caseInsensitiveCompare:@"AFR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAfr);
        }
        if ([value caseInsensitiveCompare:@"AKA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAka);
        }
        if ([value caseInsensitiveCompare:@"SQI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSqi);
        }
        if ([value caseInsensitiveCompare:@"AMH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAmh);
        }
        if ([value caseInsensitiveCompare:@"ARG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeArg);
        }
        if ([value caseInsensitiveCompare:@"HYE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHye);
        }
        if ([value caseInsensitiveCompare:@"ASM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAsm);
        }
        if ([value caseInsensitiveCompare:@"AVA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAva);
        }
        if ([value caseInsensitiveCompare:@"AVE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAve);
        }
        if ([value caseInsensitiveCompare:@"AYM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAym);
        }
        if ([value caseInsensitiveCompare:@"AZE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAze);
        }
        if ([value caseInsensitiveCompare:@"BAM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBam);
        }
        if ([value caseInsensitiveCompare:@"BAK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBak);
        }
        if ([value caseInsensitiveCompare:@"EUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEus);
        }
        if ([value caseInsensitiveCompare:@"BEL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBel);
        }
        if ([value caseInsensitiveCompare:@"BEN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBen);
        }
        if ([value caseInsensitiveCompare:@"BIH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBih);
        }
        if ([value caseInsensitiveCompare:@"BIS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBis);
        }
        if ([value caseInsensitiveCompare:@"BOS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBos);
        }
        if ([value caseInsensitiveCompare:@"BRE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBre);
        }
        if ([value caseInsensitiveCompare:@"BUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBul);
        }
        if ([value caseInsensitiveCompare:@"MYA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMya);
        }
        if ([value caseInsensitiveCompare:@"CAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCat);
        }
        if ([value caseInsensitiveCompare:@"KHM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKhm);
        }
        if ([value caseInsensitiveCompare:@"CHA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCha);
        }
        if ([value caseInsensitiveCompare:@"CHE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChe);
        }
        if ([value caseInsensitiveCompare:@"NYA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNya);
        }
        if ([value caseInsensitiveCompare:@"CHU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChu);
        }
        if ([value caseInsensitiveCompare:@"CHV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChv);
        }
        if ([value caseInsensitiveCompare:@"COR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCor);
        }
        if ([value caseInsensitiveCompare:@"COS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCos);
        }
        if ([value caseInsensitiveCompare:@"CRE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCre);
        }
        if ([value caseInsensitiveCompare:@"HRV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHrv);
        }
        if ([value caseInsensitiveCompare:@"CES"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCes);
        }
        if ([value caseInsensitiveCompare:@"DAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDan);
        }
        if ([value caseInsensitiveCompare:@"DIV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDiv);
        }
        if ([value caseInsensitiveCompare:@"NLD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNld);
        }
        if ([value caseInsensitiveCompare:@"DZO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDzo);
        }
        if ([value caseInsensitiveCompare:@"ENM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEnm);
        }
        if ([value caseInsensitiveCompare:@"EPO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEpo);
        }
        if ([value caseInsensitiveCompare:@"EST"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEst);
        }
        if ([value caseInsensitiveCompare:@"EWE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEwe);
        }
        if ([value caseInsensitiveCompare:@"FAO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFao);
        }
        if ([value caseInsensitiveCompare:@"FIJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFij);
        }
        if ([value caseInsensitiveCompare:@"FIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFin);
        }
        if ([value caseInsensitiveCompare:@"FRM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFrm);
        }
        if ([value caseInsensitiveCompare:@"FUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFul);
        }
        if ([value caseInsensitiveCompare:@"GLA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGla);
        }
        if ([value caseInsensitiveCompare:@"GLG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGlg);
        }
        if ([value caseInsensitiveCompare:@"LUG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLug);
        }
        if ([value caseInsensitiveCompare:@"KAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKat);
        }
        if ([value caseInsensitiveCompare:@"ELL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEll);
        }
        if ([value caseInsensitiveCompare:@"GRN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGrn);
        }
        if ([value caseInsensitiveCompare:@"GUJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGuj);
        }
        if ([value caseInsensitiveCompare:@"HAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHat);
        }
        if ([value caseInsensitiveCompare:@"HAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHau);
        }
        if ([value caseInsensitiveCompare:@"HEB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHeb);
        }
        if ([value caseInsensitiveCompare:@"HER"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHer);
        }
        if ([value caseInsensitiveCompare:@"HMO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHmo);
        }
        if ([value caseInsensitiveCompare:@"HUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHun);
        }
        if ([value caseInsensitiveCompare:@"ISL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIsl);
        }
        if ([value caseInsensitiveCompare:@"IDO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIdo);
        }
        if ([value caseInsensitiveCompare:@"IBO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIbo);
        }
        if ([value caseInsensitiveCompare:@"IND"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeInd);
        }
        if ([value caseInsensitiveCompare:@"INA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIna);
        }
        if ([value caseInsensitiveCompare:@"ILE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIle);
        }
        if ([value caseInsensitiveCompare:@"IKU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIku);
        }
        if ([value caseInsensitiveCompare:@"IPK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIpk);
        }
        if ([value caseInsensitiveCompare:@"GLE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGle);
        }
        if ([value caseInsensitiveCompare:@"JAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeJav);
        }
        if ([value caseInsensitiveCompare:@"KAL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKal);
        }
        if ([value caseInsensitiveCompare:@"KAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKan);
        }
        if ([value caseInsensitiveCompare:@"KAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKau);
        }
        if ([value caseInsensitiveCompare:@"KAS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKas);
        }
        if ([value caseInsensitiveCompare:@"KAZ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKaz);
        }
        if ([value caseInsensitiveCompare:@"KIK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKik);
        }
        if ([value caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKin);
        }
        if ([value caseInsensitiveCompare:@"KIR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKir);
        }
        if ([value caseInsensitiveCompare:@"KOM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKom);
        }
        if ([value caseInsensitiveCompare:@"KON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKon);
        }
        if ([value caseInsensitiveCompare:@"KUA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKua);
        }
        if ([value caseInsensitiveCompare:@"KUR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKur);
        }
        if ([value caseInsensitiveCompare:@"LAO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLao);
        }
        if ([value caseInsensitiveCompare:@"LAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLat);
        }
        if ([value caseInsensitiveCompare:@"LAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLav);
        }
        if ([value caseInsensitiveCompare:@"LIM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLim);
        }
        if ([value caseInsensitiveCompare:@"LIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLin);
        }
        if ([value caseInsensitiveCompare:@"LIT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLit);
        }
        if ([value caseInsensitiveCompare:@"LUB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLub);
        }
        if ([value caseInsensitiveCompare:@"LTZ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLtz);
        }
        if ([value caseInsensitiveCompare:@"MKD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMkd);
        }
        if ([value caseInsensitiveCompare:@"MLG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMlg);
        }
        if ([value caseInsensitiveCompare:@"MSA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMsa);
        }
        if ([value caseInsensitiveCompare:@"MAL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMal);
        }
        if ([value caseInsensitiveCompare:@"MLT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMlt);
        }
        if ([value caseInsensitiveCompare:@"GLV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGlv);
        }
        if ([value caseInsensitiveCompare:@"MRI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMri);
        }
        if ([value caseInsensitiveCompare:@"MAR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMar);
        }
        if ([value caseInsensitiveCompare:@"MAH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMah);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMon);
        }
        if ([value caseInsensitiveCompare:@"NAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNau);
        }
        if ([value caseInsensitiveCompare:@"NAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNav);
        }
        if ([value caseInsensitiveCompare:@"NDE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNde);
        }
        if ([value caseInsensitiveCompare:@"NBL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNbl);
        }
        if ([value caseInsensitiveCompare:@"NDO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNdo);
        }
        if ([value caseInsensitiveCompare:@"NEP"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNep);
        }
        if ([value caseInsensitiveCompare:@"SME"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSme);
        }
        if ([value caseInsensitiveCompare:@"NOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNor);
        }
        if ([value caseInsensitiveCompare:@"NOB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNob);
        }
        if ([value caseInsensitiveCompare:@"NNO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNno);
        }
        if ([value caseInsensitiveCompare:@"OCI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOci);
        }
        if ([value caseInsensitiveCompare:@"OJI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOji);
        }
        if ([value caseInsensitiveCompare:@"ORI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOri);
        }
        if ([value caseInsensitiveCompare:@"ORM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOrm);
        }
        if ([value caseInsensitiveCompare:@"OSS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOss);
        }
        if ([value caseInsensitiveCompare:@"PLI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePli);
        }
        if ([value caseInsensitiveCompare:@"FAS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFas);
        }
        if ([value caseInsensitiveCompare:@"POL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePol);
        }
        if ([value caseInsensitiveCompare:@"PUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePus);
        }
        if ([value caseInsensitiveCompare:@"QUE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQue);
        }
        if ([value caseInsensitiveCompare:@"QAA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQaa);
        }
        if ([value caseInsensitiveCompare:@"RON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRon);
        }
        if ([value caseInsensitiveCompare:@"ROH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRoh);
        }
        if ([value caseInsensitiveCompare:@"RUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRun);
        }
        if ([value caseInsensitiveCompare:@"SMO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSmo);
        }
        if ([value caseInsensitiveCompare:@"SAG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSag);
        }
        if ([value caseInsensitiveCompare:@"SAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSan);
        }
        if ([value caseInsensitiveCompare:@"SRD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSrd);
        }
        if ([value caseInsensitiveCompare:@"SRB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSrb);
        }
        if ([value caseInsensitiveCompare:@"SNA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSna);
        }
        if ([value caseInsensitiveCompare:@"III"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIii);
        }
        if ([value caseInsensitiveCompare:@"SND"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSnd);
        }
        if ([value caseInsensitiveCompare:@"SIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSin);
        }
        if ([value caseInsensitiveCompare:@"SLK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSlk);
        }
        if ([value caseInsensitiveCompare:@"SLV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSlv);
        }
        if ([value caseInsensitiveCompare:@"SOM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSom);
        }
        if ([value caseInsensitiveCompare:@"SOT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSot);
        }
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSun);
        }
        if ([value caseInsensitiveCompare:@"SWA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSwa);
        }
        if ([value caseInsensitiveCompare:@"SSW"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSsw);
        }
        if ([value caseInsensitiveCompare:@"SWE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSwe);
        }
        if ([value caseInsensitiveCompare:@"TGL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTgl);
        }
        if ([value caseInsensitiveCompare:@"TAH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTah);
        }
        if ([value caseInsensitiveCompare:@"TGK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTgk);
        }
        if ([value caseInsensitiveCompare:@"TAM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTam);
        }
        if ([value caseInsensitiveCompare:@"TAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTat);
        }
        if ([value caseInsensitiveCompare:@"TEL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTel);
        }
        if ([value caseInsensitiveCompare:@"THA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTha);
        }
        if ([value caseInsensitiveCompare:@"BOD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBod);
        }
        if ([value caseInsensitiveCompare:@"TIR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTir);
        }
        if ([value caseInsensitiveCompare:@"TON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTon);
        }
        if ([value caseInsensitiveCompare:@"TSO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTso);
        }
        if ([value caseInsensitiveCompare:@"TSN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTsn);
        }
        if ([value caseInsensitiveCompare:@"TUR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTur);
        }
        if ([value caseInsensitiveCompare:@"TUK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTuk);
        }
        if ([value caseInsensitiveCompare:@"TWI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTwi);
        }
        if ([value caseInsensitiveCompare:@"UIG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUig);
        }
        if ([value caseInsensitiveCompare:@"UKR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUkr);
        }
        if ([value caseInsensitiveCompare:@"UZB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUzb);
        }
        if ([value caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVen);
        }
        if ([value caseInsensitiveCompare:@"VOL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVol);
        }
        if ([value caseInsensitiveCompare:@"WLN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeWln);
        }
        if ([value caseInsensitiveCompare:@"CYM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCym);
        }
        if ([value caseInsensitiveCompare:@"FRY"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFry);
        }
        if ([value caseInsensitiveCompare:@"WOL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeWol);
        }
        if ([value caseInsensitiveCompare:@"XHO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeXho);
        }
        if ([value caseInsensitiveCompare:@"YID"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeYid);
        }
        if ([value caseInsensitiveCompare:@"YOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeYor);
        }
        if ([value caseInsensitiveCompare:@"ZHA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZha);
        }
        if ([value caseInsensitiveCompare:@"ZUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZul);
        }
        if ([value caseInsensitiveCompare:@"ORJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOrj);
        }
        if ([value caseInsensitiveCompare:@"QPC"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQpc);
        }
        if ([value caseInsensitiveCompare:@"TNG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTng);
        }
        return @(AWSMediaconvertLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertLanguageCodeEng:
                return @"ENG";
            case AWSMediaconvertLanguageCodeSpa:
                return @"SPA";
            case AWSMediaconvertLanguageCodeFra:
                return @"FRA";
            case AWSMediaconvertLanguageCodeDeu:
                return @"DEU";
            case AWSMediaconvertLanguageCodeGer:
                return @"GER";
            case AWSMediaconvertLanguageCodeZho:
                return @"ZHO";
            case AWSMediaconvertLanguageCodeAra:
                return @"ARA";
            case AWSMediaconvertLanguageCodeHin:
                return @"HIN";
            case AWSMediaconvertLanguageCodeJpn:
                return @"JPN";
            case AWSMediaconvertLanguageCodeRus:
                return @"RUS";
            case AWSMediaconvertLanguageCodePor:
                return @"POR";
            case AWSMediaconvertLanguageCodeIta:
                return @"ITA";
            case AWSMediaconvertLanguageCodeUrd:
                return @"URD";
            case AWSMediaconvertLanguageCodeVie:
                return @"VIE";
            case AWSMediaconvertLanguageCodeKor:
                return @"KOR";
            case AWSMediaconvertLanguageCodePan:
                return @"PAN";
            case AWSMediaconvertLanguageCodeAbk:
                return @"ABK";
            case AWSMediaconvertLanguageCodeAar:
                return @"AAR";
            case AWSMediaconvertLanguageCodeAfr:
                return @"AFR";
            case AWSMediaconvertLanguageCodeAka:
                return @"AKA";
            case AWSMediaconvertLanguageCodeSqi:
                return @"SQI";
            case AWSMediaconvertLanguageCodeAmh:
                return @"AMH";
            case AWSMediaconvertLanguageCodeArg:
                return @"ARG";
            case AWSMediaconvertLanguageCodeHye:
                return @"HYE";
            case AWSMediaconvertLanguageCodeAsm:
                return @"ASM";
            case AWSMediaconvertLanguageCodeAva:
                return @"AVA";
            case AWSMediaconvertLanguageCodeAve:
                return @"AVE";
            case AWSMediaconvertLanguageCodeAym:
                return @"AYM";
            case AWSMediaconvertLanguageCodeAze:
                return @"AZE";
            case AWSMediaconvertLanguageCodeBam:
                return @"BAM";
            case AWSMediaconvertLanguageCodeBak:
                return @"BAK";
            case AWSMediaconvertLanguageCodeEus:
                return @"EUS";
            case AWSMediaconvertLanguageCodeBel:
                return @"BEL";
            case AWSMediaconvertLanguageCodeBen:
                return @"BEN";
            case AWSMediaconvertLanguageCodeBih:
                return @"BIH";
            case AWSMediaconvertLanguageCodeBis:
                return @"BIS";
            case AWSMediaconvertLanguageCodeBos:
                return @"BOS";
            case AWSMediaconvertLanguageCodeBre:
                return @"BRE";
            case AWSMediaconvertLanguageCodeBul:
                return @"BUL";
            case AWSMediaconvertLanguageCodeMya:
                return @"MYA";
            case AWSMediaconvertLanguageCodeCat:
                return @"CAT";
            case AWSMediaconvertLanguageCodeKhm:
                return @"KHM";
            case AWSMediaconvertLanguageCodeCha:
                return @"CHA";
            case AWSMediaconvertLanguageCodeChe:
                return @"CHE";
            case AWSMediaconvertLanguageCodeNya:
                return @"NYA";
            case AWSMediaconvertLanguageCodeChu:
                return @"CHU";
            case AWSMediaconvertLanguageCodeChv:
                return @"CHV";
            case AWSMediaconvertLanguageCodeCor:
                return @"COR";
            case AWSMediaconvertLanguageCodeCos:
                return @"COS";
            case AWSMediaconvertLanguageCodeCre:
                return @"CRE";
            case AWSMediaconvertLanguageCodeHrv:
                return @"HRV";
            case AWSMediaconvertLanguageCodeCes:
                return @"CES";
            case AWSMediaconvertLanguageCodeDan:
                return @"DAN";
            case AWSMediaconvertLanguageCodeDiv:
                return @"DIV";
            case AWSMediaconvertLanguageCodeNld:
                return @"NLD";
            case AWSMediaconvertLanguageCodeDzo:
                return @"DZO";
            case AWSMediaconvertLanguageCodeEnm:
                return @"ENM";
            case AWSMediaconvertLanguageCodeEpo:
                return @"EPO";
            case AWSMediaconvertLanguageCodeEst:
                return @"EST";
            case AWSMediaconvertLanguageCodeEwe:
                return @"EWE";
            case AWSMediaconvertLanguageCodeFao:
                return @"FAO";
            case AWSMediaconvertLanguageCodeFij:
                return @"FIJ";
            case AWSMediaconvertLanguageCodeFin:
                return @"FIN";
            case AWSMediaconvertLanguageCodeFrm:
                return @"FRM";
            case AWSMediaconvertLanguageCodeFul:
                return @"FUL";
            case AWSMediaconvertLanguageCodeGla:
                return @"GLA";
            case AWSMediaconvertLanguageCodeGlg:
                return @"GLG";
            case AWSMediaconvertLanguageCodeLug:
                return @"LUG";
            case AWSMediaconvertLanguageCodeKat:
                return @"KAT";
            case AWSMediaconvertLanguageCodeEll:
                return @"ELL";
            case AWSMediaconvertLanguageCodeGrn:
                return @"GRN";
            case AWSMediaconvertLanguageCodeGuj:
                return @"GUJ";
            case AWSMediaconvertLanguageCodeHat:
                return @"HAT";
            case AWSMediaconvertLanguageCodeHau:
                return @"HAU";
            case AWSMediaconvertLanguageCodeHeb:
                return @"HEB";
            case AWSMediaconvertLanguageCodeHer:
                return @"HER";
            case AWSMediaconvertLanguageCodeHmo:
                return @"HMO";
            case AWSMediaconvertLanguageCodeHun:
                return @"HUN";
            case AWSMediaconvertLanguageCodeIsl:
                return @"ISL";
            case AWSMediaconvertLanguageCodeIdo:
                return @"IDO";
            case AWSMediaconvertLanguageCodeIbo:
                return @"IBO";
            case AWSMediaconvertLanguageCodeInd:
                return @"IND";
            case AWSMediaconvertLanguageCodeIna:
                return @"INA";
            case AWSMediaconvertLanguageCodeIle:
                return @"ILE";
            case AWSMediaconvertLanguageCodeIku:
                return @"IKU";
            case AWSMediaconvertLanguageCodeIpk:
                return @"IPK";
            case AWSMediaconvertLanguageCodeGle:
                return @"GLE";
            case AWSMediaconvertLanguageCodeJav:
                return @"JAV";
            case AWSMediaconvertLanguageCodeKal:
                return @"KAL";
            case AWSMediaconvertLanguageCodeKan:
                return @"KAN";
            case AWSMediaconvertLanguageCodeKau:
                return @"KAU";
            case AWSMediaconvertLanguageCodeKas:
                return @"KAS";
            case AWSMediaconvertLanguageCodeKaz:
                return @"KAZ";
            case AWSMediaconvertLanguageCodeKik:
                return @"KIK";
            case AWSMediaconvertLanguageCodeKin:
                return @"KIN";
            case AWSMediaconvertLanguageCodeKir:
                return @"KIR";
            case AWSMediaconvertLanguageCodeKom:
                return @"KOM";
            case AWSMediaconvertLanguageCodeKon:
                return @"KON";
            case AWSMediaconvertLanguageCodeKua:
                return @"KUA";
            case AWSMediaconvertLanguageCodeKur:
                return @"KUR";
            case AWSMediaconvertLanguageCodeLao:
                return @"LAO";
            case AWSMediaconvertLanguageCodeLat:
                return @"LAT";
            case AWSMediaconvertLanguageCodeLav:
                return @"LAV";
            case AWSMediaconvertLanguageCodeLim:
                return @"LIM";
            case AWSMediaconvertLanguageCodeLin:
                return @"LIN";
            case AWSMediaconvertLanguageCodeLit:
                return @"LIT";
            case AWSMediaconvertLanguageCodeLub:
                return @"LUB";
            case AWSMediaconvertLanguageCodeLtz:
                return @"LTZ";
            case AWSMediaconvertLanguageCodeMkd:
                return @"MKD";
            case AWSMediaconvertLanguageCodeMlg:
                return @"MLG";
            case AWSMediaconvertLanguageCodeMsa:
                return @"MSA";
            case AWSMediaconvertLanguageCodeMal:
                return @"MAL";
            case AWSMediaconvertLanguageCodeMlt:
                return @"MLT";
            case AWSMediaconvertLanguageCodeGlv:
                return @"GLV";
            case AWSMediaconvertLanguageCodeMri:
                return @"MRI";
            case AWSMediaconvertLanguageCodeMar:
                return @"MAR";
            case AWSMediaconvertLanguageCodeMah:
                return @"MAH";
            case AWSMediaconvertLanguageCodeMon:
                return @"MON";
            case AWSMediaconvertLanguageCodeNau:
                return @"NAU";
            case AWSMediaconvertLanguageCodeNav:
                return @"NAV";
            case AWSMediaconvertLanguageCodeNde:
                return @"NDE";
            case AWSMediaconvertLanguageCodeNbl:
                return @"NBL";
            case AWSMediaconvertLanguageCodeNdo:
                return @"NDO";
            case AWSMediaconvertLanguageCodeNep:
                return @"NEP";
            case AWSMediaconvertLanguageCodeSme:
                return @"SME";
            case AWSMediaconvertLanguageCodeNor:
                return @"NOR";
            case AWSMediaconvertLanguageCodeNob:
                return @"NOB";
            case AWSMediaconvertLanguageCodeNno:
                return @"NNO";
            case AWSMediaconvertLanguageCodeOci:
                return @"OCI";
            case AWSMediaconvertLanguageCodeOji:
                return @"OJI";
            case AWSMediaconvertLanguageCodeOri:
                return @"ORI";
            case AWSMediaconvertLanguageCodeOrm:
                return @"ORM";
            case AWSMediaconvertLanguageCodeOss:
                return @"OSS";
            case AWSMediaconvertLanguageCodePli:
                return @"PLI";
            case AWSMediaconvertLanguageCodeFas:
                return @"FAS";
            case AWSMediaconvertLanguageCodePol:
                return @"POL";
            case AWSMediaconvertLanguageCodePus:
                return @"PUS";
            case AWSMediaconvertLanguageCodeQue:
                return @"QUE";
            case AWSMediaconvertLanguageCodeQaa:
                return @"QAA";
            case AWSMediaconvertLanguageCodeRon:
                return @"RON";
            case AWSMediaconvertLanguageCodeRoh:
                return @"ROH";
            case AWSMediaconvertLanguageCodeRun:
                return @"RUN";
            case AWSMediaconvertLanguageCodeSmo:
                return @"SMO";
            case AWSMediaconvertLanguageCodeSag:
                return @"SAG";
            case AWSMediaconvertLanguageCodeSan:
                return @"SAN";
            case AWSMediaconvertLanguageCodeSrd:
                return @"SRD";
            case AWSMediaconvertLanguageCodeSrb:
                return @"SRB";
            case AWSMediaconvertLanguageCodeSna:
                return @"SNA";
            case AWSMediaconvertLanguageCodeIii:
                return @"III";
            case AWSMediaconvertLanguageCodeSnd:
                return @"SND";
            case AWSMediaconvertLanguageCodeSin:
                return @"SIN";
            case AWSMediaconvertLanguageCodeSlk:
                return @"SLK";
            case AWSMediaconvertLanguageCodeSlv:
                return @"SLV";
            case AWSMediaconvertLanguageCodeSom:
                return @"SOM";
            case AWSMediaconvertLanguageCodeSot:
                return @"SOT";
            case AWSMediaconvertLanguageCodeSun:
                return @"SUN";
            case AWSMediaconvertLanguageCodeSwa:
                return @"SWA";
            case AWSMediaconvertLanguageCodeSsw:
                return @"SSW";
            case AWSMediaconvertLanguageCodeSwe:
                return @"SWE";
            case AWSMediaconvertLanguageCodeTgl:
                return @"TGL";
            case AWSMediaconvertLanguageCodeTah:
                return @"TAH";
            case AWSMediaconvertLanguageCodeTgk:
                return @"TGK";
            case AWSMediaconvertLanguageCodeTam:
                return @"TAM";
            case AWSMediaconvertLanguageCodeTat:
                return @"TAT";
            case AWSMediaconvertLanguageCodeTel:
                return @"TEL";
            case AWSMediaconvertLanguageCodeTha:
                return @"THA";
            case AWSMediaconvertLanguageCodeBod:
                return @"BOD";
            case AWSMediaconvertLanguageCodeTir:
                return @"TIR";
            case AWSMediaconvertLanguageCodeTon:
                return @"TON";
            case AWSMediaconvertLanguageCodeTso:
                return @"TSO";
            case AWSMediaconvertLanguageCodeTsn:
                return @"TSN";
            case AWSMediaconvertLanguageCodeTur:
                return @"TUR";
            case AWSMediaconvertLanguageCodeTuk:
                return @"TUK";
            case AWSMediaconvertLanguageCodeTwi:
                return @"TWI";
            case AWSMediaconvertLanguageCodeUig:
                return @"UIG";
            case AWSMediaconvertLanguageCodeUkr:
                return @"UKR";
            case AWSMediaconvertLanguageCodeUzb:
                return @"UZB";
            case AWSMediaconvertLanguageCodeVen:
                return @"VEN";
            case AWSMediaconvertLanguageCodeVol:
                return @"VOL";
            case AWSMediaconvertLanguageCodeWln:
                return @"WLN";
            case AWSMediaconvertLanguageCodeCym:
                return @"CYM";
            case AWSMediaconvertLanguageCodeFry:
                return @"FRY";
            case AWSMediaconvertLanguageCodeWol:
                return @"WOL";
            case AWSMediaconvertLanguageCodeXho:
                return @"XHO";
            case AWSMediaconvertLanguageCodeYid:
                return @"YID";
            case AWSMediaconvertLanguageCodeYor:
                return @"YOR";
            case AWSMediaconvertLanguageCodeZha:
                return @"ZHA";
            case AWSMediaconvertLanguageCodeZul:
                return @"ZUL";
            case AWSMediaconvertLanguageCodeOrj:
                return @"ORJ";
            case AWSMediaconvertLanguageCodeQpc:
                return @"QPC";
            case AWSMediaconvertLanguageCodeTng:
                return @"TNG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)remixSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertRemixSettings class]];
}

+ (NSValueTransformer *)selectorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PID"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioSelectorTypePid);
        }
        if ([value caseInsensitiveCompare:@"TRACK"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioSelectorTypeTrack);
        }
        if ([value caseInsensitiveCompare:@"LANGUAGE_CODE"] == NSOrderedSame) {
            return @(AWSMediaconvertAudioSelectorTypeLanguageCode);
        }
        return @(AWSMediaconvertAudioSelectorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAudioSelectorTypePid:
                return @"PID";
            case AWSMediaconvertAudioSelectorTypeTrack:
                return @"TRACK";
            case AWSMediaconvertAudioSelectorTypeLanguageCode:
                return @"LANGUAGE_CODE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertAudioSelectorGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioSelectorNames" : @"AudioSelectorNames",
             };
}

@end

@implementation AWSMediaconvertAv1QvbrSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"qvbrQualityLevel" : @"QvbrQualityLevel",
             @"qvbrQualityLevelFineTune" : @"QvbrQualityLevelFineTune",
             };
}

@end

@implementation AWSMediaconvertAv1Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adaptiveQuantization" : @"AdaptiveQuantization",
             @"framerateControl" : @"FramerateControl",
             @"framerateConversionAlgorithm" : @"FramerateConversionAlgorithm",
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             @"gopSize" : @"GopSize",
             @"maxBitrate" : @"MaxBitrate",
             @"numberBFramesBetweenReferenceFrames" : @"NumberBFramesBetweenReferenceFrames",
             @"qvbrSettings" : @"QvbrSettings",
             @"rateControlMode" : @"RateControlMode",
             @"slices" : @"Slices",
             @"spatialAdaptiveQuantization" : @"SpatialAdaptiveQuantization",
             };
}

+ (NSValueTransformer *)adaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSMediaconvertAv1AdaptiveQuantizationOff);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSMediaconvertAv1AdaptiveQuantizationLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSMediaconvertAv1AdaptiveQuantizationMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMediaconvertAv1AdaptiveQuantizationHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGHER"] == NSOrderedSame) {
            return @(AWSMediaconvertAv1AdaptiveQuantizationHigher);
        }
        if ([value caseInsensitiveCompare:@"MAX"] == NSOrderedSame) {
            return @(AWSMediaconvertAv1AdaptiveQuantizationMax);
        }
        return @(AWSMediaconvertAv1AdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAv1AdaptiveQuantizationOff:
                return @"OFF";
            case AWSMediaconvertAv1AdaptiveQuantizationLow:
                return @"LOW";
            case AWSMediaconvertAv1AdaptiveQuantizationMedium:
                return @"MEDIUM";
            case AWSMediaconvertAv1AdaptiveQuantizationHigh:
                return @"HIGH";
            case AWSMediaconvertAv1AdaptiveQuantizationHigher:
                return @"HIGHER";
            case AWSMediaconvertAv1AdaptiveQuantizationMax:
                return @"MAX";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertAv1FramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMediaconvertAv1FramerateControlSpecified);
        }
        return @(AWSMediaconvertAv1FramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAv1FramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMediaconvertAv1FramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateConversionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUPLICATE_DROP"] == NSOrderedSame) {
            return @(AWSMediaconvertAv1FramerateConversionAlgorithmDuplicateDrop);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE"] == NSOrderedSame) {
            return @(AWSMediaconvertAv1FramerateConversionAlgorithmInterpolate);
        }
        return @(AWSMediaconvertAv1FramerateConversionAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAv1FramerateConversionAlgorithmDuplicateDrop:
                return @"DUPLICATE_DROP";
            case AWSMediaconvertAv1FramerateConversionAlgorithmInterpolate:
                return @"INTERPOLATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qvbrSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAv1QvbrSettings class]];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QVBR"] == NSOrderedSame) {
            return @(AWSMediaconvertAv1RateControlModeQvbr);
        }
        return @(AWSMediaconvertAv1RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAv1RateControlModeQvbr:
                return @"QVBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spatialAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertAv1SpatialAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertAv1SpatialAdaptiveQuantizationEnabled);
        }
        return @(AWSMediaconvertAv1SpatialAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAv1SpatialAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSMediaconvertAv1SpatialAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertAvailBlanking

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availBlankingImage" : @"AvailBlankingImage",
             };
}

@end

@implementation AWSMediaconvertBurninDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alignment" : @"Alignment",
             @"backgroundColor" : @"BackgroundColor",
             @"backgroundOpacity" : @"BackgroundOpacity",
             @"fontColor" : @"FontColor",
             @"fontOpacity" : @"FontOpacity",
             @"fontResolution" : @"FontResolution",
             @"fontScript" : @"FontScript",
             @"fontSize" : @"FontSize",
             @"outlineColor" : @"OutlineColor",
             @"outlineSize" : @"OutlineSize",
             @"shadowColor" : @"ShadowColor",
             @"shadowOpacity" : @"ShadowOpacity",
             @"shadowXOffset" : @"ShadowXOffset",
             @"shadowYOffset" : @"ShadowYOffset",
             @"teletextSpacing" : @"TeletextSpacing",
             @"XPosition" : @"XPosition",
             @"YPosition" : @"YPosition",
             };
}

+ (NSValueTransformer *)alignmentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CENTERED"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleAlignmentCentered);
        }
        if ([value caseInsensitiveCompare:@"LEFT"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleAlignmentLeft);
        }
        return @(AWSMediaconvertBurninSubtitleAlignmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertBurninSubtitleAlignmentCentered:
                return @"CENTERED";
            case AWSMediaconvertBurninSubtitleAlignmentLeft:
                return @"LEFT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)backgroundColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleBackgroundColorNone);
        }
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleBackgroundColorBlack);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleBackgroundColorWhite);
        }
        return @(AWSMediaconvertBurninSubtitleBackgroundColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertBurninSubtitleBackgroundColorNone:
                return @"NONE";
            case AWSMediaconvertBurninSubtitleBackgroundColorBlack:
                return @"BLACK";
            case AWSMediaconvertBurninSubtitleBackgroundColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fontColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleFontColorWhite);
        }
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleFontColorBlack);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleFontColorYellow);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleFontColorRed);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleFontColorGreen);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleFontColorBlue);
        }
        return @(AWSMediaconvertBurninSubtitleFontColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertBurninSubtitleFontColorWhite:
                return @"WHITE";
            case AWSMediaconvertBurninSubtitleFontColorBlack:
                return @"BLACK";
            case AWSMediaconvertBurninSubtitleFontColorYellow:
                return @"YELLOW";
            case AWSMediaconvertBurninSubtitleFontColorRed:
                return @"RED";
            case AWSMediaconvertBurninSubtitleFontColorGreen:
                return @"GREEN";
            case AWSMediaconvertBurninSubtitleFontColorBlue:
                return @"BLUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fontScriptJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTOMATIC"] == NSOrderedSame) {
            return @(AWSMediaconvertFontScriptAutomatic);
        }
        if ([value caseInsensitiveCompare:@"HANS"] == NSOrderedSame) {
            return @(AWSMediaconvertFontScriptHans);
        }
        if ([value caseInsensitiveCompare:@"HANT"] == NSOrderedSame) {
            return @(AWSMediaconvertFontScriptHant);
        }
        return @(AWSMediaconvertFontScriptUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertFontScriptAutomatic:
                return @"AUTOMATIC";
            case AWSMediaconvertFontScriptHans:
                return @"HANS";
            case AWSMediaconvertFontScriptHant:
                return @"HANT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outlineColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleOutlineColorBlack);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleOutlineColorWhite);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleOutlineColorYellow);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleOutlineColorRed);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleOutlineColorGreen);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleOutlineColorBlue);
        }
        return @(AWSMediaconvertBurninSubtitleOutlineColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertBurninSubtitleOutlineColorBlack:
                return @"BLACK";
            case AWSMediaconvertBurninSubtitleOutlineColorWhite:
                return @"WHITE";
            case AWSMediaconvertBurninSubtitleOutlineColorYellow:
                return @"YELLOW";
            case AWSMediaconvertBurninSubtitleOutlineColorRed:
                return @"RED";
            case AWSMediaconvertBurninSubtitleOutlineColorGreen:
                return @"GREEN";
            case AWSMediaconvertBurninSubtitleOutlineColorBlue:
                return @"BLUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)shadowColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleShadowColorNone);
        }
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleShadowColorBlack);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleShadowColorWhite);
        }
        return @(AWSMediaconvertBurninSubtitleShadowColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertBurninSubtitleShadowColorNone:
                return @"NONE";
            case AWSMediaconvertBurninSubtitleShadowColorBlack:
                return @"BLACK";
            case AWSMediaconvertBurninSubtitleShadowColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)teletextSpacingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIXED_GRID"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleTeletextSpacingFixedGrid);
        }
        if ([value caseInsensitiveCompare:@"PROPORTIONAL"] == NSOrderedSame) {
            return @(AWSMediaconvertBurninSubtitleTeletextSpacingProportional);
        }
        return @(AWSMediaconvertBurninSubtitleTeletextSpacingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertBurninSubtitleTeletextSpacingFixedGrid:
                return @"FIXED_GRID";
            case AWSMediaconvertBurninSubtitleTeletextSpacingProportional:
                return @"PROPORTIONAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertCancelJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSMediaconvertCancelJobResponse

@end

@implementation AWSMediaconvertCaptionDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captionSelectorName" : @"CaptionSelectorName",
             @"customLanguageCode" : @"CustomLanguageCode",
             @"destinationSettings" : @"DestinationSettings",
             @"languageCode" : @"LanguageCode",
             @"languageDescription" : @"LanguageDescription",
             };
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertCaptionDestinationSettings class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEng);
        }
        if ([value caseInsensitiveCompare:@"SPA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSpa);
        }
        if ([value caseInsensitiveCompare:@"FRA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFra);
        }
        if ([value caseInsensitiveCompare:@"DEU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDeu);
        }
        if ([value caseInsensitiveCompare:@"GER"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGer);
        }
        if ([value caseInsensitiveCompare:@"ZHO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZho);
        }
        if ([value caseInsensitiveCompare:@"ARA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAra);
        }
        if ([value caseInsensitiveCompare:@"HIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHin);
        }
        if ([value caseInsensitiveCompare:@"JPN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeJpn);
        }
        if ([value caseInsensitiveCompare:@"RUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRus);
        }
        if ([value caseInsensitiveCompare:@"POR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePor);
        }
        if ([value caseInsensitiveCompare:@"ITA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIta);
        }
        if ([value caseInsensitiveCompare:@"URD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUrd);
        }
        if ([value caseInsensitiveCompare:@"VIE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVie);
        }
        if ([value caseInsensitiveCompare:@"KOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKor);
        }
        if ([value caseInsensitiveCompare:@"PAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePan);
        }
        if ([value caseInsensitiveCompare:@"ABK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAbk);
        }
        if ([value caseInsensitiveCompare:@"AAR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAar);
        }
        if ([value caseInsensitiveCompare:@"AFR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAfr);
        }
        if ([value caseInsensitiveCompare:@"AKA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAka);
        }
        if ([value caseInsensitiveCompare:@"SQI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSqi);
        }
        if ([value caseInsensitiveCompare:@"AMH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAmh);
        }
        if ([value caseInsensitiveCompare:@"ARG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeArg);
        }
        if ([value caseInsensitiveCompare:@"HYE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHye);
        }
        if ([value caseInsensitiveCompare:@"ASM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAsm);
        }
        if ([value caseInsensitiveCompare:@"AVA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAva);
        }
        if ([value caseInsensitiveCompare:@"AVE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAve);
        }
        if ([value caseInsensitiveCompare:@"AYM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAym);
        }
        if ([value caseInsensitiveCompare:@"AZE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAze);
        }
        if ([value caseInsensitiveCompare:@"BAM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBam);
        }
        if ([value caseInsensitiveCompare:@"BAK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBak);
        }
        if ([value caseInsensitiveCompare:@"EUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEus);
        }
        if ([value caseInsensitiveCompare:@"BEL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBel);
        }
        if ([value caseInsensitiveCompare:@"BEN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBen);
        }
        if ([value caseInsensitiveCompare:@"BIH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBih);
        }
        if ([value caseInsensitiveCompare:@"BIS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBis);
        }
        if ([value caseInsensitiveCompare:@"BOS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBos);
        }
        if ([value caseInsensitiveCompare:@"BRE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBre);
        }
        if ([value caseInsensitiveCompare:@"BUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBul);
        }
        if ([value caseInsensitiveCompare:@"MYA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMya);
        }
        if ([value caseInsensitiveCompare:@"CAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCat);
        }
        if ([value caseInsensitiveCompare:@"KHM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKhm);
        }
        if ([value caseInsensitiveCompare:@"CHA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCha);
        }
        if ([value caseInsensitiveCompare:@"CHE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChe);
        }
        if ([value caseInsensitiveCompare:@"NYA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNya);
        }
        if ([value caseInsensitiveCompare:@"CHU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChu);
        }
        if ([value caseInsensitiveCompare:@"CHV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChv);
        }
        if ([value caseInsensitiveCompare:@"COR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCor);
        }
        if ([value caseInsensitiveCompare:@"COS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCos);
        }
        if ([value caseInsensitiveCompare:@"CRE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCre);
        }
        if ([value caseInsensitiveCompare:@"HRV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHrv);
        }
        if ([value caseInsensitiveCompare:@"CES"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCes);
        }
        if ([value caseInsensitiveCompare:@"DAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDan);
        }
        if ([value caseInsensitiveCompare:@"DIV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDiv);
        }
        if ([value caseInsensitiveCompare:@"NLD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNld);
        }
        if ([value caseInsensitiveCompare:@"DZO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDzo);
        }
        if ([value caseInsensitiveCompare:@"ENM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEnm);
        }
        if ([value caseInsensitiveCompare:@"EPO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEpo);
        }
        if ([value caseInsensitiveCompare:@"EST"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEst);
        }
        if ([value caseInsensitiveCompare:@"EWE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEwe);
        }
        if ([value caseInsensitiveCompare:@"FAO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFao);
        }
        if ([value caseInsensitiveCompare:@"FIJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFij);
        }
        if ([value caseInsensitiveCompare:@"FIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFin);
        }
        if ([value caseInsensitiveCompare:@"FRM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFrm);
        }
        if ([value caseInsensitiveCompare:@"FUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFul);
        }
        if ([value caseInsensitiveCompare:@"GLA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGla);
        }
        if ([value caseInsensitiveCompare:@"GLG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGlg);
        }
        if ([value caseInsensitiveCompare:@"LUG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLug);
        }
        if ([value caseInsensitiveCompare:@"KAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKat);
        }
        if ([value caseInsensitiveCompare:@"ELL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEll);
        }
        if ([value caseInsensitiveCompare:@"GRN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGrn);
        }
        if ([value caseInsensitiveCompare:@"GUJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGuj);
        }
        if ([value caseInsensitiveCompare:@"HAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHat);
        }
        if ([value caseInsensitiveCompare:@"HAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHau);
        }
        if ([value caseInsensitiveCompare:@"HEB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHeb);
        }
        if ([value caseInsensitiveCompare:@"HER"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHer);
        }
        if ([value caseInsensitiveCompare:@"HMO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHmo);
        }
        if ([value caseInsensitiveCompare:@"HUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHun);
        }
        if ([value caseInsensitiveCompare:@"ISL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIsl);
        }
        if ([value caseInsensitiveCompare:@"IDO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIdo);
        }
        if ([value caseInsensitiveCompare:@"IBO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIbo);
        }
        if ([value caseInsensitiveCompare:@"IND"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeInd);
        }
        if ([value caseInsensitiveCompare:@"INA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIna);
        }
        if ([value caseInsensitiveCompare:@"ILE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIle);
        }
        if ([value caseInsensitiveCompare:@"IKU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIku);
        }
        if ([value caseInsensitiveCompare:@"IPK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIpk);
        }
        if ([value caseInsensitiveCompare:@"GLE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGle);
        }
        if ([value caseInsensitiveCompare:@"JAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeJav);
        }
        if ([value caseInsensitiveCompare:@"KAL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKal);
        }
        if ([value caseInsensitiveCompare:@"KAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKan);
        }
        if ([value caseInsensitiveCompare:@"KAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKau);
        }
        if ([value caseInsensitiveCompare:@"KAS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKas);
        }
        if ([value caseInsensitiveCompare:@"KAZ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKaz);
        }
        if ([value caseInsensitiveCompare:@"KIK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKik);
        }
        if ([value caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKin);
        }
        if ([value caseInsensitiveCompare:@"KIR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKir);
        }
        if ([value caseInsensitiveCompare:@"KOM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKom);
        }
        if ([value caseInsensitiveCompare:@"KON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKon);
        }
        if ([value caseInsensitiveCompare:@"KUA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKua);
        }
        if ([value caseInsensitiveCompare:@"KUR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKur);
        }
        if ([value caseInsensitiveCompare:@"LAO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLao);
        }
        if ([value caseInsensitiveCompare:@"LAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLat);
        }
        if ([value caseInsensitiveCompare:@"LAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLav);
        }
        if ([value caseInsensitiveCompare:@"LIM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLim);
        }
        if ([value caseInsensitiveCompare:@"LIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLin);
        }
        if ([value caseInsensitiveCompare:@"LIT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLit);
        }
        if ([value caseInsensitiveCompare:@"LUB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLub);
        }
        if ([value caseInsensitiveCompare:@"LTZ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLtz);
        }
        if ([value caseInsensitiveCompare:@"MKD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMkd);
        }
        if ([value caseInsensitiveCompare:@"MLG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMlg);
        }
        if ([value caseInsensitiveCompare:@"MSA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMsa);
        }
        if ([value caseInsensitiveCompare:@"MAL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMal);
        }
        if ([value caseInsensitiveCompare:@"MLT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMlt);
        }
        if ([value caseInsensitiveCompare:@"GLV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGlv);
        }
        if ([value caseInsensitiveCompare:@"MRI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMri);
        }
        if ([value caseInsensitiveCompare:@"MAR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMar);
        }
        if ([value caseInsensitiveCompare:@"MAH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMah);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMon);
        }
        if ([value caseInsensitiveCompare:@"NAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNau);
        }
        if ([value caseInsensitiveCompare:@"NAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNav);
        }
        if ([value caseInsensitiveCompare:@"NDE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNde);
        }
        if ([value caseInsensitiveCompare:@"NBL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNbl);
        }
        if ([value caseInsensitiveCompare:@"NDO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNdo);
        }
        if ([value caseInsensitiveCompare:@"NEP"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNep);
        }
        if ([value caseInsensitiveCompare:@"SME"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSme);
        }
        if ([value caseInsensitiveCompare:@"NOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNor);
        }
        if ([value caseInsensitiveCompare:@"NOB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNob);
        }
        if ([value caseInsensitiveCompare:@"NNO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNno);
        }
        if ([value caseInsensitiveCompare:@"OCI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOci);
        }
        if ([value caseInsensitiveCompare:@"OJI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOji);
        }
        if ([value caseInsensitiveCompare:@"ORI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOri);
        }
        if ([value caseInsensitiveCompare:@"ORM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOrm);
        }
        if ([value caseInsensitiveCompare:@"OSS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOss);
        }
        if ([value caseInsensitiveCompare:@"PLI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePli);
        }
        if ([value caseInsensitiveCompare:@"FAS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFas);
        }
        if ([value caseInsensitiveCompare:@"POL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePol);
        }
        if ([value caseInsensitiveCompare:@"PUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePus);
        }
        if ([value caseInsensitiveCompare:@"QUE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQue);
        }
        if ([value caseInsensitiveCompare:@"QAA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQaa);
        }
        if ([value caseInsensitiveCompare:@"RON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRon);
        }
        if ([value caseInsensitiveCompare:@"ROH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRoh);
        }
        if ([value caseInsensitiveCompare:@"RUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRun);
        }
        if ([value caseInsensitiveCompare:@"SMO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSmo);
        }
        if ([value caseInsensitiveCompare:@"SAG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSag);
        }
        if ([value caseInsensitiveCompare:@"SAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSan);
        }
        if ([value caseInsensitiveCompare:@"SRD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSrd);
        }
        if ([value caseInsensitiveCompare:@"SRB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSrb);
        }
        if ([value caseInsensitiveCompare:@"SNA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSna);
        }
        if ([value caseInsensitiveCompare:@"III"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIii);
        }
        if ([value caseInsensitiveCompare:@"SND"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSnd);
        }
        if ([value caseInsensitiveCompare:@"SIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSin);
        }
        if ([value caseInsensitiveCompare:@"SLK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSlk);
        }
        if ([value caseInsensitiveCompare:@"SLV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSlv);
        }
        if ([value caseInsensitiveCompare:@"SOM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSom);
        }
        if ([value caseInsensitiveCompare:@"SOT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSot);
        }
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSun);
        }
        if ([value caseInsensitiveCompare:@"SWA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSwa);
        }
        if ([value caseInsensitiveCompare:@"SSW"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSsw);
        }
        if ([value caseInsensitiveCompare:@"SWE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSwe);
        }
        if ([value caseInsensitiveCompare:@"TGL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTgl);
        }
        if ([value caseInsensitiveCompare:@"TAH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTah);
        }
        if ([value caseInsensitiveCompare:@"TGK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTgk);
        }
        if ([value caseInsensitiveCompare:@"TAM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTam);
        }
        if ([value caseInsensitiveCompare:@"TAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTat);
        }
        if ([value caseInsensitiveCompare:@"TEL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTel);
        }
        if ([value caseInsensitiveCompare:@"THA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTha);
        }
        if ([value caseInsensitiveCompare:@"BOD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBod);
        }
        if ([value caseInsensitiveCompare:@"TIR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTir);
        }
        if ([value caseInsensitiveCompare:@"TON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTon);
        }
        if ([value caseInsensitiveCompare:@"TSO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTso);
        }
        if ([value caseInsensitiveCompare:@"TSN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTsn);
        }
        if ([value caseInsensitiveCompare:@"TUR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTur);
        }
        if ([value caseInsensitiveCompare:@"TUK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTuk);
        }
        if ([value caseInsensitiveCompare:@"TWI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTwi);
        }
        if ([value caseInsensitiveCompare:@"UIG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUig);
        }
        if ([value caseInsensitiveCompare:@"UKR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUkr);
        }
        if ([value caseInsensitiveCompare:@"UZB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUzb);
        }
        if ([value caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVen);
        }
        if ([value caseInsensitiveCompare:@"VOL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVol);
        }
        if ([value caseInsensitiveCompare:@"WLN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeWln);
        }
        if ([value caseInsensitiveCompare:@"CYM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCym);
        }
        if ([value caseInsensitiveCompare:@"FRY"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFry);
        }
        if ([value caseInsensitiveCompare:@"WOL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeWol);
        }
        if ([value caseInsensitiveCompare:@"XHO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeXho);
        }
        if ([value caseInsensitiveCompare:@"YID"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeYid);
        }
        if ([value caseInsensitiveCompare:@"YOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeYor);
        }
        if ([value caseInsensitiveCompare:@"ZHA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZha);
        }
        if ([value caseInsensitiveCompare:@"ZUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZul);
        }
        if ([value caseInsensitiveCompare:@"ORJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOrj);
        }
        if ([value caseInsensitiveCompare:@"QPC"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQpc);
        }
        if ([value caseInsensitiveCompare:@"TNG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTng);
        }
        return @(AWSMediaconvertLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertLanguageCodeEng:
                return @"ENG";
            case AWSMediaconvertLanguageCodeSpa:
                return @"SPA";
            case AWSMediaconvertLanguageCodeFra:
                return @"FRA";
            case AWSMediaconvertLanguageCodeDeu:
                return @"DEU";
            case AWSMediaconvertLanguageCodeGer:
                return @"GER";
            case AWSMediaconvertLanguageCodeZho:
                return @"ZHO";
            case AWSMediaconvertLanguageCodeAra:
                return @"ARA";
            case AWSMediaconvertLanguageCodeHin:
                return @"HIN";
            case AWSMediaconvertLanguageCodeJpn:
                return @"JPN";
            case AWSMediaconvertLanguageCodeRus:
                return @"RUS";
            case AWSMediaconvertLanguageCodePor:
                return @"POR";
            case AWSMediaconvertLanguageCodeIta:
                return @"ITA";
            case AWSMediaconvertLanguageCodeUrd:
                return @"URD";
            case AWSMediaconvertLanguageCodeVie:
                return @"VIE";
            case AWSMediaconvertLanguageCodeKor:
                return @"KOR";
            case AWSMediaconvertLanguageCodePan:
                return @"PAN";
            case AWSMediaconvertLanguageCodeAbk:
                return @"ABK";
            case AWSMediaconvertLanguageCodeAar:
                return @"AAR";
            case AWSMediaconvertLanguageCodeAfr:
                return @"AFR";
            case AWSMediaconvertLanguageCodeAka:
                return @"AKA";
            case AWSMediaconvertLanguageCodeSqi:
                return @"SQI";
            case AWSMediaconvertLanguageCodeAmh:
                return @"AMH";
            case AWSMediaconvertLanguageCodeArg:
                return @"ARG";
            case AWSMediaconvertLanguageCodeHye:
                return @"HYE";
            case AWSMediaconvertLanguageCodeAsm:
                return @"ASM";
            case AWSMediaconvertLanguageCodeAva:
                return @"AVA";
            case AWSMediaconvertLanguageCodeAve:
                return @"AVE";
            case AWSMediaconvertLanguageCodeAym:
                return @"AYM";
            case AWSMediaconvertLanguageCodeAze:
                return @"AZE";
            case AWSMediaconvertLanguageCodeBam:
                return @"BAM";
            case AWSMediaconvertLanguageCodeBak:
                return @"BAK";
            case AWSMediaconvertLanguageCodeEus:
                return @"EUS";
            case AWSMediaconvertLanguageCodeBel:
                return @"BEL";
            case AWSMediaconvertLanguageCodeBen:
                return @"BEN";
            case AWSMediaconvertLanguageCodeBih:
                return @"BIH";
            case AWSMediaconvertLanguageCodeBis:
                return @"BIS";
            case AWSMediaconvertLanguageCodeBos:
                return @"BOS";
            case AWSMediaconvertLanguageCodeBre:
                return @"BRE";
            case AWSMediaconvertLanguageCodeBul:
                return @"BUL";
            case AWSMediaconvertLanguageCodeMya:
                return @"MYA";
            case AWSMediaconvertLanguageCodeCat:
                return @"CAT";
            case AWSMediaconvertLanguageCodeKhm:
                return @"KHM";
            case AWSMediaconvertLanguageCodeCha:
                return @"CHA";
            case AWSMediaconvertLanguageCodeChe:
                return @"CHE";
            case AWSMediaconvertLanguageCodeNya:
                return @"NYA";
            case AWSMediaconvertLanguageCodeChu:
                return @"CHU";
            case AWSMediaconvertLanguageCodeChv:
                return @"CHV";
            case AWSMediaconvertLanguageCodeCor:
                return @"COR";
            case AWSMediaconvertLanguageCodeCos:
                return @"COS";
            case AWSMediaconvertLanguageCodeCre:
                return @"CRE";
            case AWSMediaconvertLanguageCodeHrv:
                return @"HRV";
            case AWSMediaconvertLanguageCodeCes:
                return @"CES";
            case AWSMediaconvertLanguageCodeDan:
                return @"DAN";
            case AWSMediaconvertLanguageCodeDiv:
                return @"DIV";
            case AWSMediaconvertLanguageCodeNld:
                return @"NLD";
            case AWSMediaconvertLanguageCodeDzo:
                return @"DZO";
            case AWSMediaconvertLanguageCodeEnm:
                return @"ENM";
            case AWSMediaconvertLanguageCodeEpo:
                return @"EPO";
            case AWSMediaconvertLanguageCodeEst:
                return @"EST";
            case AWSMediaconvertLanguageCodeEwe:
                return @"EWE";
            case AWSMediaconvertLanguageCodeFao:
                return @"FAO";
            case AWSMediaconvertLanguageCodeFij:
                return @"FIJ";
            case AWSMediaconvertLanguageCodeFin:
                return @"FIN";
            case AWSMediaconvertLanguageCodeFrm:
                return @"FRM";
            case AWSMediaconvertLanguageCodeFul:
                return @"FUL";
            case AWSMediaconvertLanguageCodeGla:
                return @"GLA";
            case AWSMediaconvertLanguageCodeGlg:
                return @"GLG";
            case AWSMediaconvertLanguageCodeLug:
                return @"LUG";
            case AWSMediaconvertLanguageCodeKat:
                return @"KAT";
            case AWSMediaconvertLanguageCodeEll:
                return @"ELL";
            case AWSMediaconvertLanguageCodeGrn:
                return @"GRN";
            case AWSMediaconvertLanguageCodeGuj:
                return @"GUJ";
            case AWSMediaconvertLanguageCodeHat:
                return @"HAT";
            case AWSMediaconvertLanguageCodeHau:
                return @"HAU";
            case AWSMediaconvertLanguageCodeHeb:
                return @"HEB";
            case AWSMediaconvertLanguageCodeHer:
                return @"HER";
            case AWSMediaconvertLanguageCodeHmo:
                return @"HMO";
            case AWSMediaconvertLanguageCodeHun:
                return @"HUN";
            case AWSMediaconvertLanguageCodeIsl:
                return @"ISL";
            case AWSMediaconvertLanguageCodeIdo:
                return @"IDO";
            case AWSMediaconvertLanguageCodeIbo:
                return @"IBO";
            case AWSMediaconvertLanguageCodeInd:
                return @"IND";
            case AWSMediaconvertLanguageCodeIna:
                return @"INA";
            case AWSMediaconvertLanguageCodeIle:
                return @"ILE";
            case AWSMediaconvertLanguageCodeIku:
                return @"IKU";
            case AWSMediaconvertLanguageCodeIpk:
                return @"IPK";
            case AWSMediaconvertLanguageCodeGle:
                return @"GLE";
            case AWSMediaconvertLanguageCodeJav:
                return @"JAV";
            case AWSMediaconvertLanguageCodeKal:
                return @"KAL";
            case AWSMediaconvertLanguageCodeKan:
                return @"KAN";
            case AWSMediaconvertLanguageCodeKau:
                return @"KAU";
            case AWSMediaconvertLanguageCodeKas:
                return @"KAS";
            case AWSMediaconvertLanguageCodeKaz:
                return @"KAZ";
            case AWSMediaconvertLanguageCodeKik:
                return @"KIK";
            case AWSMediaconvertLanguageCodeKin:
                return @"KIN";
            case AWSMediaconvertLanguageCodeKir:
                return @"KIR";
            case AWSMediaconvertLanguageCodeKom:
                return @"KOM";
            case AWSMediaconvertLanguageCodeKon:
                return @"KON";
            case AWSMediaconvertLanguageCodeKua:
                return @"KUA";
            case AWSMediaconvertLanguageCodeKur:
                return @"KUR";
            case AWSMediaconvertLanguageCodeLao:
                return @"LAO";
            case AWSMediaconvertLanguageCodeLat:
                return @"LAT";
            case AWSMediaconvertLanguageCodeLav:
                return @"LAV";
            case AWSMediaconvertLanguageCodeLim:
                return @"LIM";
            case AWSMediaconvertLanguageCodeLin:
                return @"LIN";
            case AWSMediaconvertLanguageCodeLit:
                return @"LIT";
            case AWSMediaconvertLanguageCodeLub:
                return @"LUB";
            case AWSMediaconvertLanguageCodeLtz:
                return @"LTZ";
            case AWSMediaconvertLanguageCodeMkd:
                return @"MKD";
            case AWSMediaconvertLanguageCodeMlg:
                return @"MLG";
            case AWSMediaconvertLanguageCodeMsa:
                return @"MSA";
            case AWSMediaconvertLanguageCodeMal:
                return @"MAL";
            case AWSMediaconvertLanguageCodeMlt:
                return @"MLT";
            case AWSMediaconvertLanguageCodeGlv:
                return @"GLV";
            case AWSMediaconvertLanguageCodeMri:
                return @"MRI";
            case AWSMediaconvertLanguageCodeMar:
                return @"MAR";
            case AWSMediaconvertLanguageCodeMah:
                return @"MAH";
            case AWSMediaconvertLanguageCodeMon:
                return @"MON";
            case AWSMediaconvertLanguageCodeNau:
                return @"NAU";
            case AWSMediaconvertLanguageCodeNav:
                return @"NAV";
            case AWSMediaconvertLanguageCodeNde:
                return @"NDE";
            case AWSMediaconvertLanguageCodeNbl:
                return @"NBL";
            case AWSMediaconvertLanguageCodeNdo:
                return @"NDO";
            case AWSMediaconvertLanguageCodeNep:
                return @"NEP";
            case AWSMediaconvertLanguageCodeSme:
                return @"SME";
            case AWSMediaconvertLanguageCodeNor:
                return @"NOR";
            case AWSMediaconvertLanguageCodeNob:
                return @"NOB";
            case AWSMediaconvertLanguageCodeNno:
                return @"NNO";
            case AWSMediaconvertLanguageCodeOci:
                return @"OCI";
            case AWSMediaconvertLanguageCodeOji:
                return @"OJI";
            case AWSMediaconvertLanguageCodeOri:
                return @"ORI";
            case AWSMediaconvertLanguageCodeOrm:
                return @"ORM";
            case AWSMediaconvertLanguageCodeOss:
                return @"OSS";
            case AWSMediaconvertLanguageCodePli:
                return @"PLI";
            case AWSMediaconvertLanguageCodeFas:
                return @"FAS";
            case AWSMediaconvertLanguageCodePol:
                return @"POL";
            case AWSMediaconvertLanguageCodePus:
                return @"PUS";
            case AWSMediaconvertLanguageCodeQue:
                return @"QUE";
            case AWSMediaconvertLanguageCodeQaa:
                return @"QAA";
            case AWSMediaconvertLanguageCodeRon:
                return @"RON";
            case AWSMediaconvertLanguageCodeRoh:
                return @"ROH";
            case AWSMediaconvertLanguageCodeRun:
                return @"RUN";
            case AWSMediaconvertLanguageCodeSmo:
                return @"SMO";
            case AWSMediaconvertLanguageCodeSag:
                return @"SAG";
            case AWSMediaconvertLanguageCodeSan:
                return @"SAN";
            case AWSMediaconvertLanguageCodeSrd:
                return @"SRD";
            case AWSMediaconvertLanguageCodeSrb:
                return @"SRB";
            case AWSMediaconvertLanguageCodeSna:
                return @"SNA";
            case AWSMediaconvertLanguageCodeIii:
                return @"III";
            case AWSMediaconvertLanguageCodeSnd:
                return @"SND";
            case AWSMediaconvertLanguageCodeSin:
                return @"SIN";
            case AWSMediaconvertLanguageCodeSlk:
                return @"SLK";
            case AWSMediaconvertLanguageCodeSlv:
                return @"SLV";
            case AWSMediaconvertLanguageCodeSom:
                return @"SOM";
            case AWSMediaconvertLanguageCodeSot:
                return @"SOT";
            case AWSMediaconvertLanguageCodeSun:
                return @"SUN";
            case AWSMediaconvertLanguageCodeSwa:
                return @"SWA";
            case AWSMediaconvertLanguageCodeSsw:
                return @"SSW";
            case AWSMediaconvertLanguageCodeSwe:
                return @"SWE";
            case AWSMediaconvertLanguageCodeTgl:
                return @"TGL";
            case AWSMediaconvertLanguageCodeTah:
                return @"TAH";
            case AWSMediaconvertLanguageCodeTgk:
                return @"TGK";
            case AWSMediaconvertLanguageCodeTam:
                return @"TAM";
            case AWSMediaconvertLanguageCodeTat:
                return @"TAT";
            case AWSMediaconvertLanguageCodeTel:
                return @"TEL";
            case AWSMediaconvertLanguageCodeTha:
                return @"THA";
            case AWSMediaconvertLanguageCodeBod:
                return @"BOD";
            case AWSMediaconvertLanguageCodeTir:
                return @"TIR";
            case AWSMediaconvertLanguageCodeTon:
                return @"TON";
            case AWSMediaconvertLanguageCodeTso:
                return @"TSO";
            case AWSMediaconvertLanguageCodeTsn:
                return @"TSN";
            case AWSMediaconvertLanguageCodeTur:
                return @"TUR";
            case AWSMediaconvertLanguageCodeTuk:
                return @"TUK";
            case AWSMediaconvertLanguageCodeTwi:
                return @"TWI";
            case AWSMediaconvertLanguageCodeUig:
                return @"UIG";
            case AWSMediaconvertLanguageCodeUkr:
                return @"UKR";
            case AWSMediaconvertLanguageCodeUzb:
                return @"UZB";
            case AWSMediaconvertLanguageCodeVen:
                return @"VEN";
            case AWSMediaconvertLanguageCodeVol:
                return @"VOL";
            case AWSMediaconvertLanguageCodeWln:
                return @"WLN";
            case AWSMediaconvertLanguageCodeCym:
                return @"CYM";
            case AWSMediaconvertLanguageCodeFry:
                return @"FRY";
            case AWSMediaconvertLanguageCodeWol:
                return @"WOL";
            case AWSMediaconvertLanguageCodeXho:
                return @"XHO";
            case AWSMediaconvertLanguageCodeYid:
                return @"YID";
            case AWSMediaconvertLanguageCodeYor:
                return @"YOR";
            case AWSMediaconvertLanguageCodeZha:
                return @"ZHA";
            case AWSMediaconvertLanguageCodeZul:
                return @"ZUL";
            case AWSMediaconvertLanguageCodeOrj:
                return @"ORJ";
            case AWSMediaconvertLanguageCodeQpc:
                return @"QPC";
            case AWSMediaconvertLanguageCodeTng:
                return @"TNG";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertCaptionDescriptionPreset

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customLanguageCode" : @"CustomLanguageCode",
             @"destinationSettings" : @"DestinationSettings",
             @"languageCode" : @"LanguageCode",
             @"languageDescription" : @"LanguageDescription",
             };
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertCaptionDestinationSettings class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEng);
        }
        if ([value caseInsensitiveCompare:@"SPA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSpa);
        }
        if ([value caseInsensitiveCompare:@"FRA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFra);
        }
        if ([value caseInsensitiveCompare:@"DEU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDeu);
        }
        if ([value caseInsensitiveCompare:@"GER"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGer);
        }
        if ([value caseInsensitiveCompare:@"ZHO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZho);
        }
        if ([value caseInsensitiveCompare:@"ARA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAra);
        }
        if ([value caseInsensitiveCompare:@"HIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHin);
        }
        if ([value caseInsensitiveCompare:@"JPN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeJpn);
        }
        if ([value caseInsensitiveCompare:@"RUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRus);
        }
        if ([value caseInsensitiveCompare:@"POR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePor);
        }
        if ([value caseInsensitiveCompare:@"ITA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIta);
        }
        if ([value caseInsensitiveCompare:@"URD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUrd);
        }
        if ([value caseInsensitiveCompare:@"VIE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVie);
        }
        if ([value caseInsensitiveCompare:@"KOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKor);
        }
        if ([value caseInsensitiveCompare:@"PAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePan);
        }
        if ([value caseInsensitiveCompare:@"ABK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAbk);
        }
        if ([value caseInsensitiveCompare:@"AAR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAar);
        }
        if ([value caseInsensitiveCompare:@"AFR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAfr);
        }
        if ([value caseInsensitiveCompare:@"AKA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAka);
        }
        if ([value caseInsensitiveCompare:@"SQI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSqi);
        }
        if ([value caseInsensitiveCompare:@"AMH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAmh);
        }
        if ([value caseInsensitiveCompare:@"ARG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeArg);
        }
        if ([value caseInsensitiveCompare:@"HYE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHye);
        }
        if ([value caseInsensitiveCompare:@"ASM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAsm);
        }
        if ([value caseInsensitiveCompare:@"AVA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAva);
        }
        if ([value caseInsensitiveCompare:@"AVE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAve);
        }
        if ([value caseInsensitiveCompare:@"AYM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAym);
        }
        if ([value caseInsensitiveCompare:@"AZE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAze);
        }
        if ([value caseInsensitiveCompare:@"BAM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBam);
        }
        if ([value caseInsensitiveCompare:@"BAK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBak);
        }
        if ([value caseInsensitiveCompare:@"EUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEus);
        }
        if ([value caseInsensitiveCompare:@"BEL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBel);
        }
        if ([value caseInsensitiveCompare:@"BEN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBen);
        }
        if ([value caseInsensitiveCompare:@"BIH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBih);
        }
        if ([value caseInsensitiveCompare:@"BIS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBis);
        }
        if ([value caseInsensitiveCompare:@"BOS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBos);
        }
        if ([value caseInsensitiveCompare:@"BRE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBre);
        }
        if ([value caseInsensitiveCompare:@"BUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBul);
        }
        if ([value caseInsensitiveCompare:@"MYA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMya);
        }
        if ([value caseInsensitiveCompare:@"CAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCat);
        }
        if ([value caseInsensitiveCompare:@"KHM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKhm);
        }
        if ([value caseInsensitiveCompare:@"CHA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCha);
        }
        if ([value caseInsensitiveCompare:@"CHE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChe);
        }
        if ([value caseInsensitiveCompare:@"NYA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNya);
        }
        if ([value caseInsensitiveCompare:@"CHU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChu);
        }
        if ([value caseInsensitiveCompare:@"CHV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChv);
        }
        if ([value caseInsensitiveCompare:@"COR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCor);
        }
        if ([value caseInsensitiveCompare:@"COS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCos);
        }
        if ([value caseInsensitiveCompare:@"CRE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCre);
        }
        if ([value caseInsensitiveCompare:@"HRV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHrv);
        }
        if ([value caseInsensitiveCompare:@"CES"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCes);
        }
        if ([value caseInsensitiveCompare:@"DAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDan);
        }
        if ([value caseInsensitiveCompare:@"DIV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDiv);
        }
        if ([value caseInsensitiveCompare:@"NLD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNld);
        }
        if ([value caseInsensitiveCompare:@"DZO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDzo);
        }
        if ([value caseInsensitiveCompare:@"ENM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEnm);
        }
        if ([value caseInsensitiveCompare:@"EPO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEpo);
        }
        if ([value caseInsensitiveCompare:@"EST"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEst);
        }
        if ([value caseInsensitiveCompare:@"EWE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEwe);
        }
        if ([value caseInsensitiveCompare:@"FAO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFao);
        }
        if ([value caseInsensitiveCompare:@"FIJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFij);
        }
        if ([value caseInsensitiveCompare:@"FIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFin);
        }
        if ([value caseInsensitiveCompare:@"FRM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFrm);
        }
        if ([value caseInsensitiveCompare:@"FUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFul);
        }
        if ([value caseInsensitiveCompare:@"GLA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGla);
        }
        if ([value caseInsensitiveCompare:@"GLG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGlg);
        }
        if ([value caseInsensitiveCompare:@"LUG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLug);
        }
        if ([value caseInsensitiveCompare:@"KAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKat);
        }
        if ([value caseInsensitiveCompare:@"ELL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEll);
        }
        if ([value caseInsensitiveCompare:@"GRN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGrn);
        }
        if ([value caseInsensitiveCompare:@"GUJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGuj);
        }
        if ([value caseInsensitiveCompare:@"HAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHat);
        }
        if ([value caseInsensitiveCompare:@"HAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHau);
        }
        if ([value caseInsensitiveCompare:@"HEB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHeb);
        }
        if ([value caseInsensitiveCompare:@"HER"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHer);
        }
        if ([value caseInsensitiveCompare:@"HMO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHmo);
        }
        if ([value caseInsensitiveCompare:@"HUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHun);
        }
        if ([value caseInsensitiveCompare:@"ISL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIsl);
        }
        if ([value caseInsensitiveCompare:@"IDO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIdo);
        }
        if ([value caseInsensitiveCompare:@"IBO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIbo);
        }
        if ([value caseInsensitiveCompare:@"IND"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeInd);
        }
        if ([value caseInsensitiveCompare:@"INA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIna);
        }
        if ([value caseInsensitiveCompare:@"ILE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIle);
        }
        if ([value caseInsensitiveCompare:@"IKU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIku);
        }
        if ([value caseInsensitiveCompare:@"IPK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIpk);
        }
        if ([value caseInsensitiveCompare:@"GLE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGle);
        }
        if ([value caseInsensitiveCompare:@"JAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeJav);
        }
        if ([value caseInsensitiveCompare:@"KAL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKal);
        }
        if ([value caseInsensitiveCompare:@"KAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKan);
        }
        if ([value caseInsensitiveCompare:@"KAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKau);
        }
        if ([value caseInsensitiveCompare:@"KAS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKas);
        }
        if ([value caseInsensitiveCompare:@"KAZ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKaz);
        }
        if ([value caseInsensitiveCompare:@"KIK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKik);
        }
        if ([value caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKin);
        }
        if ([value caseInsensitiveCompare:@"KIR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKir);
        }
        if ([value caseInsensitiveCompare:@"KOM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKom);
        }
        if ([value caseInsensitiveCompare:@"KON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKon);
        }
        if ([value caseInsensitiveCompare:@"KUA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKua);
        }
        if ([value caseInsensitiveCompare:@"KUR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKur);
        }
        if ([value caseInsensitiveCompare:@"LAO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLao);
        }
        if ([value caseInsensitiveCompare:@"LAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLat);
        }
        if ([value caseInsensitiveCompare:@"LAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLav);
        }
        if ([value caseInsensitiveCompare:@"LIM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLim);
        }
        if ([value caseInsensitiveCompare:@"LIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLin);
        }
        if ([value caseInsensitiveCompare:@"LIT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLit);
        }
        if ([value caseInsensitiveCompare:@"LUB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLub);
        }
        if ([value caseInsensitiveCompare:@"LTZ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLtz);
        }
        if ([value caseInsensitiveCompare:@"MKD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMkd);
        }
        if ([value caseInsensitiveCompare:@"MLG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMlg);
        }
        if ([value caseInsensitiveCompare:@"MSA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMsa);
        }
        if ([value caseInsensitiveCompare:@"MAL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMal);
        }
        if ([value caseInsensitiveCompare:@"MLT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMlt);
        }
        if ([value caseInsensitiveCompare:@"GLV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGlv);
        }
        if ([value caseInsensitiveCompare:@"MRI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMri);
        }
        if ([value caseInsensitiveCompare:@"MAR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMar);
        }
        if ([value caseInsensitiveCompare:@"MAH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMah);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMon);
        }
        if ([value caseInsensitiveCompare:@"NAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNau);
        }
        if ([value caseInsensitiveCompare:@"NAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNav);
        }
        if ([value caseInsensitiveCompare:@"NDE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNde);
        }
        if ([value caseInsensitiveCompare:@"NBL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNbl);
        }
        if ([value caseInsensitiveCompare:@"NDO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNdo);
        }
        if ([value caseInsensitiveCompare:@"NEP"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNep);
        }
        if ([value caseInsensitiveCompare:@"SME"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSme);
        }
        if ([value caseInsensitiveCompare:@"NOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNor);
        }
        if ([value caseInsensitiveCompare:@"NOB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNob);
        }
        if ([value caseInsensitiveCompare:@"NNO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNno);
        }
        if ([value caseInsensitiveCompare:@"OCI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOci);
        }
        if ([value caseInsensitiveCompare:@"OJI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOji);
        }
        if ([value caseInsensitiveCompare:@"ORI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOri);
        }
        if ([value caseInsensitiveCompare:@"ORM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOrm);
        }
        if ([value caseInsensitiveCompare:@"OSS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOss);
        }
        if ([value caseInsensitiveCompare:@"PLI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePli);
        }
        if ([value caseInsensitiveCompare:@"FAS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFas);
        }
        if ([value caseInsensitiveCompare:@"POL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePol);
        }
        if ([value caseInsensitiveCompare:@"PUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePus);
        }
        if ([value caseInsensitiveCompare:@"QUE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQue);
        }
        if ([value caseInsensitiveCompare:@"QAA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQaa);
        }
        if ([value caseInsensitiveCompare:@"RON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRon);
        }
        if ([value caseInsensitiveCompare:@"ROH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRoh);
        }
        if ([value caseInsensitiveCompare:@"RUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRun);
        }
        if ([value caseInsensitiveCompare:@"SMO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSmo);
        }
        if ([value caseInsensitiveCompare:@"SAG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSag);
        }
        if ([value caseInsensitiveCompare:@"SAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSan);
        }
        if ([value caseInsensitiveCompare:@"SRD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSrd);
        }
        if ([value caseInsensitiveCompare:@"SRB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSrb);
        }
        if ([value caseInsensitiveCompare:@"SNA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSna);
        }
        if ([value caseInsensitiveCompare:@"III"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIii);
        }
        if ([value caseInsensitiveCompare:@"SND"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSnd);
        }
        if ([value caseInsensitiveCompare:@"SIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSin);
        }
        if ([value caseInsensitiveCompare:@"SLK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSlk);
        }
        if ([value caseInsensitiveCompare:@"SLV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSlv);
        }
        if ([value caseInsensitiveCompare:@"SOM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSom);
        }
        if ([value caseInsensitiveCompare:@"SOT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSot);
        }
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSun);
        }
        if ([value caseInsensitiveCompare:@"SWA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSwa);
        }
        if ([value caseInsensitiveCompare:@"SSW"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSsw);
        }
        if ([value caseInsensitiveCompare:@"SWE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSwe);
        }
        if ([value caseInsensitiveCompare:@"TGL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTgl);
        }
        if ([value caseInsensitiveCompare:@"TAH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTah);
        }
        if ([value caseInsensitiveCompare:@"TGK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTgk);
        }
        if ([value caseInsensitiveCompare:@"TAM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTam);
        }
        if ([value caseInsensitiveCompare:@"TAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTat);
        }
        if ([value caseInsensitiveCompare:@"TEL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTel);
        }
        if ([value caseInsensitiveCompare:@"THA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTha);
        }
        if ([value caseInsensitiveCompare:@"BOD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBod);
        }
        if ([value caseInsensitiveCompare:@"TIR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTir);
        }
        if ([value caseInsensitiveCompare:@"TON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTon);
        }
        if ([value caseInsensitiveCompare:@"TSO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTso);
        }
        if ([value caseInsensitiveCompare:@"TSN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTsn);
        }
        if ([value caseInsensitiveCompare:@"TUR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTur);
        }
        if ([value caseInsensitiveCompare:@"TUK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTuk);
        }
        if ([value caseInsensitiveCompare:@"TWI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTwi);
        }
        if ([value caseInsensitiveCompare:@"UIG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUig);
        }
        if ([value caseInsensitiveCompare:@"UKR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUkr);
        }
        if ([value caseInsensitiveCompare:@"UZB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUzb);
        }
        if ([value caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVen);
        }
        if ([value caseInsensitiveCompare:@"VOL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVol);
        }
        if ([value caseInsensitiveCompare:@"WLN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeWln);
        }
        if ([value caseInsensitiveCompare:@"CYM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCym);
        }
        if ([value caseInsensitiveCompare:@"FRY"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFry);
        }
        if ([value caseInsensitiveCompare:@"WOL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeWol);
        }
        if ([value caseInsensitiveCompare:@"XHO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeXho);
        }
        if ([value caseInsensitiveCompare:@"YID"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeYid);
        }
        if ([value caseInsensitiveCompare:@"YOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeYor);
        }
        if ([value caseInsensitiveCompare:@"ZHA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZha);
        }
        if ([value caseInsensitiveCompare:@"ZUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZul);
        }
        if ([value caseInsensitiveCompare:@"ORJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOrj);
        }
        if ([value caseInsensitiveCompare:@"QPC"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQpc);
        }
        if ([value caseInsensitiveCompare:@"TNG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTng);
        }
        return @(AWSMediaconvertLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertLanguageCodeEng:
                return @"ENG";
            case AWSMediaconvertLanguageCodeSpa:
                return @"SPA";
            case AWSMediaconvertLanguageCodeFra:
                return @"FRA";
            case AWSMediaconvertLanguageCodeDeu:
                return @"DEU";
            case AWSMediaconvertLanguageCodeGer:
                return @"GER";
            case AWSMediaconvertLanguageCodeZho:
                return @"ZHO";
            case AWSMediaconvertLanguageCodeAra:
                return @"ARA";
            case AWSMediaconvertLanguageCodeHin:
                return @"HIN";
            case AWSMediaconvertLanguageCodeJpn:
                return @"JPN";
            case AWSMediaconvertLanguageCodeRus:
                return @"RUS";
            case AWSMediaconvertLanguageCodePor:
                return @"POR";
            case AWSMediaconvertLanguageCodeIta:
                return @"ITA";
            case AWSMediaconvertLanguageCodeUrd:
                return @"URD";
            case AWSMediaconvertLanguageCodeVie:
                return @"VIE";
            case AWSMediaconvertLanguageCodeKor:
                return @"KOR";
            case AWSMediaconvertLanguageCodePan:
                return @"PAN";
            case AWSMediaconvertLanguageCodeAbk:
                return @"ABK";
            case AWSMediaconvertLanguageCodeAar:
                return @"AAR";
            case AWSMediaconvertLanguageCodeAfr:
                return @"AFR";
            case AWSMediaconvertLanguageCodeAka:
                return @"AKA";
            case AWSMediaconvertLanguageCodeSqi:
                return @"SQI";
            case AWSMediaconvertLanguageCodeAmh:
                return @"AMH";
            case AWSMediaconvertLanguageCodeArg:
                return @"ARG";
            case AWSMediaconvertLanguageCodeHye:
                return @"HYE";
            case AWSMediaconvertLanguageCodeAsm:
                return @"ASM";
            case AWSMediaconvertLanguageCodeAva:
                return @"AVA";
            case AWSMediaconvertLanguageCodeAve:
                return @"AVE";
            case AWSMediaconvertLanguageCodeAym:
                return @"AYM";
            case AWSMediaconvertLanguageCodeAze:
                return @"AZE";
            case AWSMediaconvertLanguageCodeBam:
                return @"BAM";
            case AWSMediaconvertLanguageCodeBak:
                return @"BAK";
            case AWSMediaconvertLanguageCodeEus:
                return @"EUS";
            case AWSMediaconvertLanguageCodeBel:
                return @"BEL";
            case AWSMediaconvertLanguageCodeBen:
                return @"BEN";
            case AWSMediaconvertLanguageCodeBih:
                return @"BIH";
            case AWSMediaconvertLanguageCodeBis:
                return @"BIS";
            case AWSMediaconvertLanguageCodeBos:
                return @"BOS";
            case AWSMediaconvertLanguageCodeBre:
                return @"BRE";
            case AWSMediaconvertLanguageCodeBul:
                return @"BUL";
            case AWSMediaconvertLanguageCodeMya:
                return @"MYA";
            case AWSMediaconvertLanguageCodeCat:
                return @"CAT";
            case AWSMediaconvertLanguageCodeKhm:
                return @"KHM";
            case AWSMediaconvertLanguageCodeCha:
                return @"CHA";
            case AWSMediaconvertLanguageCodeChe:
                return @"CHE";
            case AWSMediaconvertLanguageCodeNya:
                return @"NYA";
            case AWSMediaconvertLanguageCodeChu:
                return @"CHU";
            case AWSMediaconvertLanguageCodeChv:
                return @"CHV";
            case AWSMediaconvertLanguageCodeCor:
                return @"COR";
            case AWSMediaconvertLanguageCodeCos:
                return @"COS";
            case AWSMediaconvertLanguageCodeCre:
                return @"CRE";
            case AWSMediaconvertLanguageCodeHrv:
                return @"HRV";
            case AWSMediaconvertLanguageCodeCes:
                return @"CES";
            case AWSMediaconvertLanguageCodeDan:
                return @"DAN";
            case AWSMediaconvertLanguageCodeDiv:
                return @"DIV";
            case AWSMediaconvertLanguageCodeNld:
                return @"NLD";
            case AWSMediaconvertLanguageCodeDzo:
                return @"DZO";
            case AWSMediaconvertLanguageCodeEnm:
                return @"ENM";
            case AWSMediaconvertLanguageCodeEpo:
                return @"EPO";
            case AWSMediaconvertLanguageCodeEst:
                return @"EST";
            case AWSMediaconvertLanguageCodeEwe:
                return @"EWE";
            case AWSMediaconvertLanguageCodeFao:
                return @"FAO";
            case AWSMediaconvertLanguageCodeFij:
                return @"FIJ";
            case AWSMediaconvertLanguageCodeFin:
                return @"FIN";
            case AWSMediaconvertLanguageCodeFrm:
                return @"FRM";
            case AWSMediaconvertLanguageCodeFul:
                return @"FUL";
            case AWSMediaconvertLanguageCodeGla:
                return @"GLA";
            case AWSMediaconvertLanguageCodeGlg:
                return @"GLG";
            case AWSMediaconvertLanguageCodeLug:
                return @"LUG";
            case AWSMediaconvertLanguageCodeKat:
                return @"KAT";
            case AWSMediaconvertLanguageCodeEll:
                return @"ELL";
            case AWSMediaconvertLanguageCodeGrn:
                return @"GRN";
            case AWSMediaconvertLanguageCodeGuj:
                return @"GUJ";
            case AWSMediaconvertLanguageCodeHat:
                return @"HAT";
            case AWSMediaconvertLanguageCodeHau:
                return @"HAU";
            case AWSMediaconvertLanguageCodeHeb:
                return @"HEB";
            case AWSMediaconvertLanguageCodeHer:
                return @"HER";
            case AWSMediaconvertLanguageCodeHmo:
                return @"HMO";
            case AWSMediaconvertLanguageCodeHun:
                return @"HUN";
            case AWSMediaconvertLanguageCodeIsl:
                return @"ISL";
            case AWSMediaconvertLanguageCodeIdo:
                return @"IDO";
            case AWSMediaconvertLanguageCodeIbo:
                return @"IBO";
            case AWSMediaconvertLanguageCodeInd:
                return @"IND";
            case AWSMediaconvertLanguageCodeIna:
                return @"INA";
            case AWSMediaconvertLanguageCodeIle:
                return @"ILE";
            case AWSMediaconvertLanguageCodeIku:
                return @"IKU";
            case AWSMediaconvertLanguageCodeIpk:
                return @"IPK";
            case AWSMediaconvertLanguageCodeGle:
                return @"GLE";
            case AWSMediaconvertLanguageCodeJav:
                return @"JAV";
            case AWSMediaconvertLanguageCodeKal:
                return @"KAL";
            case AWSMediaconvertLanguageCodeKan:
                return @"KAN";
            case AWSMediaconvertLanguageCodeKau:
                return @"KAU";
            case AWSMediaconvertLanguageCodeKas:
                return @"KAS";
            case AWSMediaconvertLanguageCodeKaz:
                return @"KAZ";
            case AWSMediaconvertLanguageCodeKik:
                return @"KIK";
            case AWSMediaconvertLanguageCodeKin:
                return @"KIN";
            case AWSMediaconvertLanguageCodeKir:
                return @"KIR";
            case AWSMediaconvertLanguageCodeKom:
                return @"KOM";
            case AWSMediaconvertLanguageCodeKon:
                return @"KON";
            case AWSMediaconvertLanguageCodeKua:
                return @"KUA";
            case AWSMediaconvertLanguageCodeKur:
                return @"KUR";
            case AWSMediaconvertLanguageCodeLao:
                return @"LAO";
            case AWSMediaconvertLanguageCodeLat:
                return @"LAT";
            case AWSMediaconvertLanguageCodeLav:
                return @"LAV";
            case AWSMediaconvertLanguageCodeLim:
                return @"LIM";
            case AWSMediaconvertLanguageCodeLin:
                return @"LIN";
            case AWSMediaconvertLanguageCodeLit:
                return @"LIT";
            case AWSMediaconvertLanguageCodeLub:
                return @"LUB";
            case AWSMediaconvertLanguageCodeLtz:
                return @"LTZ";
            case AWSMediaconvertLanguageCodeMkd:
                return @"MKD";
            case AWSMediaconvertLanguageCodeMlg:
                return @"MLG";
            case AWSMediaconvertLanguageCodeMsa:
                return @"MSA";
            case AWSMediaconvertLanguageCodeMal:
                return @"MAL";
            case AWSMediaconvertLanguageCodeMlt:
                return @"MLT";
            case AWSMediaconvertLanguageCodeGlv:
                return @"GLV";
            case AWSMediaconvertLanguageCodeMri:
                return @"MRI";
            case AWSMediaconvertLanguageCodeMar:
                return @"MAR";
            case AWSMediaconvertLanguageCodeMah:
                return @"MAH";
            case AWSMediaconvertLanguageCodeMon:
                return @"MON";
            case AWSMediaconvertLanguageCodeNau:
                return @"NAU";
            case AWSMediaconvertLanguageCodeNav:
                return @"NAV";
            case AWSMediaconvertLanguageCodeNde:
                return @"NDE";
            case AWSMediaconvertLanguageCodeNbl:
                return @"NBL";
            case AWSMediaconvertLanguageCodeNdo:
                return @"NDO";
            case AWSMediaconvertLanguageCodeNep:
                return @"NEP";
            case AWSMediaconvertLanguageCodeSme:
                return @"SME";
            case AWSMediaconvertLanguageCodeNor:
                return @"NOR";
            case AWSMediaconvertLanguageCodeNob:
                return @"NOB";
            case AWSMediaconvertLanguageCodeNno:
                return @"NNO";
            case AWSMediaconvertLanguageCodeOci:
                return @"OCI";
            case AWSMediaconvertLanguageCodeOji:
                return @"OJI";
            case AWSMediaconvertLanguageCodeOri:
                return @"ORI";
            case AWSMediaconvertLanguageCodeOrm:
                return @"ORM";
            case AWSMediaconvertLanguageCodeOss:
                return @"OSS";
            case AWSMediaconvertLanguageCodePli:
                return @"PLI";
            case AWSMediaconvertLanguageCodeFas:
                return @"FAS";
            case AWSMediaconvertLanguageCodePol:
                return @"POL";
            case AWSMediaconvertLanguageCodePus:
                return @"PUS";
            case AWSMediaconvertLanguageCodeQue:
                return @"QUE";
            case AWSMediaconvertLanguageCodeQaa:
                return @"QAA";
            case AWSMediaconvertLanguageCodeRon:
                return @"RON";
            case AWSMediaconvertLanguageCodeRoh:
                return @"ROH";
            case AWSMediaconvertLanguageCodeRun:
                return @"RUN";
            case AWSMediaconvertLanguageCodeSmo:
                return @"SMO";
            case AWSMediaconvertLanguageCodeSag:
                return @"SAG";
            case AWSMediaconvertLanguageCodeSan:
                return @"SAN";
            case AWSMediaconvertLanguageCodeSrd:
                return @"SRD";
            case AWSMediaconvertLanguageCodeSrb:
                return @"SRB";
            case AWSMediaconvertLanguageCodeSna:
                return @"SNA";
            case AWSMediaconvertLanguageCodeIii:
                return @"III";
            case AWSMediaconvertLanguageCodeSnd:
                return @"SND";
            case AWSMediaconvertLanguageCodeSin:
                return @"SIN";
            case AWSMediaconvertLanguageCodeSlk:
                return @"SLK";
            case AWSMediaconvertLanguageCodeSlv:
                return @"SLV";
            case AWSMediaconvertLanguageCodeSom:
                return @"SOM";
            case AWSMediaconvertLanguageCodeSot:
                return @"SOT";
            case AWSMediaconvertLanguageCodeSun:
                return @"SUN";
            case AWSMediaconvertLanguageCodeSwa:
                return @"SWA";
            case AWSMediaconvertLanguageCodeSsw:
                return @"SSW";
            case AWSMediaconvertLanguageCodeSwe:
                return @"SWE";
            case AWSMediaconvertLanguageCodeTgl:
                return @"TGL";
            case AWSMediaconvertLanguageCodeTah:
                return @"TAH";
            case AWSMediaconvertLanguageCodeTgk:
                return @"TGK";
            case AWSMediaconvertLanguageCodeTam:
                return @"TAM";
            case AWSMediaconvertLanguageCodeTat:
                return @"TAT";
            case AWSMediaconvertLanguageCodeTel:
                return @"TEL";
            case AWSMediaconvertLanguageCodeTha:
                return @"THA";
            case AWSMediaconvertLanguageCodeBod:
                return @"BOD";
            case AWSMediaconvertLanguageCodeTir:
                return @"TIR";
            case AWSMediaconvertLanguageCodeTon:
                return @"TON";
            case AWSMediaconvertLanguageCodeTso:
                return @"TSO";
            case AWSMediaconvertLanguageCodeTsn:
                return @"TSN";
            case AWSMediaconvertLanguageCodeTur:
                return @"TUR";
            case AWSMediaconvertLanguageCodeTuk:
                return @"TUK";
            case AWSMediaconvertLanguageCodeTwi:
                return @"TWI";
            case AWSMediaconvertLanguageCodeUig:
                return @"UIG";
            case AWSMediaconvertLanguageCodeUkr:
                return @"UKR";
            case AWSMediaconvertLanguageCodeUzb:
                return @"UZB";
            case AWSMediaconvertLanguageCodeVen:
                return @"VEN";
            case AWSMediaconvertLanguageCodeVol:
                return @"VOL";
            case AWSMediaconvertLanguageCodeWln:
                return @"WLN";
            case AWSMediaconvertLanguageCodeCym:
                return @"CYM";
            case AWSMediaconvertLanguageCodeFry:
                return @"FRY";
            case AWSMediaconvertLanguageCodeWol:
                return @"WOL";
            case AWSMediaconvertLanguageCodeXho:
                return @"XHO";
            case AWSMediaconvertLanguageCodeYid:
                return @"YID";
            case AWSMediaconvertLanguageCodeYor:
                return @"YOR";
            case AWSMediaconvertLanguageCodeZha:
                return @"ZHA";
            case AWSMediaconvertLanguageCodeZul:
                return @"ZUL";
            case AWSMediaconvertLanguageCodeOrj:
                return @"ORJ";
            case AWSMediaconvertLanguageCodeQpc:
                return @"QPC";
            case AWSMediaconvertLanguageCodeTng:
                return @"TNG";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertCaptionDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"burninDestinationSettings" : @"BurninDestinationSettings",
             @"destinationType" : @"DestinationType",
             @"dvbSubDestinationSettings" : @"DvbSubDestinationSettings",
             @"embeddedDestinationSettings" : @"EmbeddedDestinationSettings",
             @"imscDestinationSettings" : @"ImscDestinationSettings",
             @"sccDestinationSettings" : @"SccDestinationSettings",
             @"teletextDestinationSettings" : @"TeletextDestinationSettings",
             @"ttmlDestinationSettings" : @"TtmlDestinationSettings",
             };
}

+ (NSValueTransformer *)burninDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertBurninDestinationSettings class]];
}

+ (NSValueTransformer *)destinationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BURN_IN"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionDestinationTypeBurnIn);
        }
        if ([value caseInsensitiveCompare:@"DVB_SUB"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionDestinationTypeDvbSub);
        }
        if ([value caseInsensitiveCompare:@"EMBEDDED"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionDestinationTypeEmbedded);
        }
        if ([value caseInsensitiveCompare:@"EMBEDDED_PLUS_SCTE20"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionDestinationTypeEmbeddedPlusScte20);
        }
        if ([value caseInsensitiveCompare:@"IMSC"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionDestinationTypeImsc);
        }
        if ([value caseInsensitiveCompare:@"SCTE20_PLUS_EMBEDDED"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionDestinationTypeScte20PlusEmbedded);
        }
        if ([value caseInsensitiveCompare:@"SCC"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionDestinationTypeScc);
        }
        if ([value caseInsensitiveCompare:@"SRT"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionDestinationTypeSrt);
        }
        if ([value caseInsensitiveCompare:@"SMI"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionDestinationTypeSmi);
        }
        if ([value caseInsensitiveCompare:@"TELETEXT"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionDestinationTypeTeletext);
        }
        if ([value caseInsensitiveCompare:@"TTML"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionDestinationTypeTtml);
        }
        if ([value caseInsensitiveCompare:@"WEBVTT"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionDestinationTypeWebvtt);
        }
        return @(AWSMediaconvertCaptionDestinationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCaptionDestinationTypeBurnIn:
                return @"BURN_IN";
            case AWSMediaconvertCaptionDestinationTypeDvbSub:
                return @"DVB_SUB";
            case AWSMediaconvertCaptionDestinationTypeEmbedded:
                return @"EMBEDDED";
            case AWSMediaconvertCaptionDestinationTypeEmbeddedPlusScte20:
                return @"EMBEDDED_PLUS_SCTE20";
            case AWSMediaconvertCaptionDestinationTypeImsc:
                return @"IMSC";
            case AWSMediaconvertCaptionDestinationTypeScte20PlusEmbedded:
                return @"SCTE20_PLUS_EMBEDDED";
            case AWSMediaconvertCaptionDestinationTypeScc:
                return @"SCC";
            case AWSMediaconvertCaptionDestinationTypeSrt:
                return @"SRT";
            case AWSMediaconvertCaptionDestinationTypeSmi:
                return @"SMI";
            case AWSMediaconvertCaptionDestinationTypeTeletext:
                return @"TELETEXT";
            case AWSMediaconvertCaptionDestinationTypeTtml:
                return @"TTML";
            case AWSMediaconvertCaptionDestinationTypeWebvtt:
                return @"WEBVTT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dvbSubDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDvbSubDestinationSettings class]];
}

+ (NSValueTransformer *)embeddedDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertEmbeddedDestinationSettings class]];
}

+ (NSValueTransformer *)imscDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertImscDestinationSettings class]];
}

+ (NSValueTransformer *)sccDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertSccDestinationSettings class]];
}

+ (NSValueTransformer *)teletextDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertTeletextDestinationSettings class]];
}

+ (NSValueTransformer *)ttmlDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertTtmlDestinationSettings class]];
}

@end

@implementation AWSMediaconvertCaptionSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customLanguageCode" : @"CustomLanguageCode",
             @"languageCode" : @"LanguageCode",
             @"sourceSettings" : @"SourceSettings",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEng);
        }
        if ([value caseInsensitiveCompare:@"SPA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSpa);
        }
        if ([value caseInsensitiveCompare:@"FRA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFra);
        }
        if ([value caseInsensitiveCompare:@"DEU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDeu);
        }
        if ([value caseInsensitiveCompare:@"GER"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGer);
        }
        if ([value caseInsensitiveCompare:@"ZHO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZho);
        }
        if ([value caseInsensitiveCompare:@"ARA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAra);
        }
        if ([value caseInsensitiveCompare:@"HIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHin);
        }
        if ([value caseInsensitiveCompare:@"JPN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeJpn);
        }
        if ([value caseInsensitiveCompare:@"RUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRus);
        }
        if ([value caseInsensitiveCompare:@"POR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePor);
        }
        if ([value caseInsensitiveCompare:@"ITA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIta);
        }
        if ([value caseInsensitiveCompare:@"URD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUrd);
        }
        if ([value caseInsensitiveCompare:@"VIE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVie);
        }
        if ([value caseInsensitiveCompare:@"KOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKor);
        }
        if ([value caseInsensitiveCompare:@"PAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePan);
        }
        if ([value caseInsensitiveCompare:@"ABK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAbk);
        }
        if ([value caseInsensitiveCompare:@"AAR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAar);
        }
        if ([value caseInsensitiveCompare:@"AFR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAfr);
        }
        if ([value caseInsensitiveCompare:@"AKA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAka);
        }
        if ([value caseInsensitiveCompare:@"SQI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSqi);
        }
        if ([value caseInsensitiveCompare:@"AMH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAmh);
        }
        if ([value caseInsensitiveCompare:@"ARG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeArg);
        }
        if ([value caseInsensitiveCompare:@"HYE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHye);
        }
        if ([value caseInsensitiveCompare:@"ASM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAsm);
        }
        if ([value caseInsensitiveCompare:@"AVA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAva);
        }
        if ([value caseInsensitiveCompare:@"AVE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAve);
        }
        if ([value caseInsensitiveCompare:@"AYM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAym);
        }
        if ([value caseInsensitiveCompare:@"AZE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAze);
        }
        if ([value caseInsensitiveCompare:@"BAM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBam);
        }
        if ([value caseInsensitiveCompare:@"BAK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBak);
        }
        if ([value caseInsensitiveCompare:@"EUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEus);
        }
        if ([value caseInsensitiveCompare:@"BEL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBel);
        }
        if ([value caseInsensitiveCompare:@"BEN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBen);
        }
        if ([value caseInsensitiveCompare:@"BIH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBih);
        }
        if ([value caseInsensitiveCompare:@"BIS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBis);
        }
        if ([value caseInsensitiveCompare:@"BOS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBos);
        }
        if ([value caseInsensitiveCompare:@"BRE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBre);
        }
        if ([value caseInsensitiveCompare:@"BUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBul);
        }
        if ([value caseInsensitiveCompare:@"MYA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMya);
        }
        if ([value caseInsensitiveCompare:@"CAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCat);
        }
        if ([value caseInsensitiveCompare:@"KHM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKhm);
        }
        if ([value caseInsensitiveCompare:@"CHA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCha);
        }
        if ([value caseInsensitiveCompare:@"CHE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChe);
        }
        if ([value caseInsensitiveCompare:@"NYA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNya);
        }
        if ([value caseInsensitiveCompare:@"CHU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChu);
        }
        if ([value caseInsensitiveCompare:@"CHV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChv);
        }
        if ([value caseInsensitiveCompare:@"COR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCor);
        }
        if ([value caseInsensitiveCompare:@"COS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCos);
        }
        if ([value caseInsensitiveCompare:@"CRE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCre);
        }
        if ([value caseInsensitiveCompare:@"HRV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHrv);
        }
        if ([value caseInsensitiveCompare:@"CES"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCes);
        }
        if ([value caseInsensitiveCompare:@"DAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDan);
        }
        if ([value caseInsensitiveCompare:@"DIV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDiv);
        }
        if ([value caseInsensitiveCompare:@"NLD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNld);
        }
        if ([value caseInsensitiveCompare:@"DZO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDzo);
        }
        if ([value caseInsensitiveCompare:@"ENM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEnm);
        }
        if ([value caseInsensitiveCompare:@"EPO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEpo);
        }
        if ([value caseInsensitiveCompare:@"EST"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEst);
        }
        if ([value caseInsensitiveCompare:@"EWE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEwe);
        }
        if ([value caseInsensitiveCompare:@"FAO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFao);
        }
        if ([value caseInsensitiveCompare:@"FIJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFij);
        }
        if ([value caseInsensitiveCompare:@"FIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFin);
        }
        if ([value caseInsensitiveCompare:@"FRM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFrm);
        }
        if ([value caseInsensitiveCompare:@"FUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFul);
        }
        if ([value caseInsensitiveCompare:@"GLA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGla);
        }
        if ([value caseInsensitiveCompare:@"GLG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGlg);
        }
        if ([value caseInsensitiveCompare:@"LUG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLug);
        }
        if ([value caseInsensitiveCompare:@"KAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKat);
        }
        if ([value caseInsensitiveCompare:@"ELL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEll);
        }
        if ([value caseInsensitiveCompare:@"GRN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGrn);
        }
        if ([value caseInsensitiveCompare:@"GUJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGuj);
        }
        if ([value caseInsensitiveCompare:@"HAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHat);
        }
        if ([value caseInsensitiveCompare:@"HAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHau);
        }
        if ([value caseInsensitiveCompare:@"HEB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHeb);
        }
        if ([value caseInsensitiveCompare:@"HER"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHer);
        }
        if ([value caseInsensitiveCompare:@"HMO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHmo);
        }
        if ([value caseInsensitiveCompare:@"HUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHun);
        }
        if ([value caseInsensitiveCompare:@"ISL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIsl);
        }
        if ([value caseInsensitiveCompare:@"IDO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIdo);
        }
        if ([value caseInsensitiveCompare:@"IBO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIbo);
        }
        if ([value caseInsensitiveCompare:@"IND"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeInd);
        }
        if ([value caseInsensitiveCompare:@"INA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIna);
        }
        if ([value caseInsensitiveCompare:@"ILE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIle);
        }
        if ([value caseInsensitiveCompare:@"IKU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIku);
        }
        if ([value caseInsensitiveCompare:@"IPK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIpk);
        }
        if ([value caseInsensitiveCompare:@"GLE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGle);
        }
        if ([value caseInsensitiveCompare:@"JAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeJav);
        }
        if ([value caseInsensitiveCompare:@"KAL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKal);
        }
        if ([value caseInsensitiveCompare:@"KAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKan);
        }
        if ([value caseInsensitiveCompare:@"KAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKau);
        }
        if ([value caseInsensitiveCompare:@"KAS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKas);
        }
        if ([value caseInsensitiveCompare:@"KAZ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKaz);
        }
        if ([value caseInsensitiveCompare:@"KIK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKik);
        }
        if ([value caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKin);
        }
        if ([value caseInsensitiveCompare:@"KIR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKir);
        }
        if ([value caseInsensitiveCompare:@"KOM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKom);
        }
        if ([value caseInsensitiveCompare:@"KON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKon);
        }
        if ([value caseInsensitiveCompare:@"KUA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKua);
        }
        if ([value caseInsensitiveCompare:@"KUR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKur);
        }
        if ([value caseInsensitiveCompare:@"LAO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLao);
        }
        if ([value caseInsensitiveCompare:@"LAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLat);
        }
        if ([value caseInsensitiveCompare:@"LAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLav);
        }
        if ([value caseInsensitiveCompare:@"LIM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLim);
        }
        if ([value caseInsensitiveCompare:@"LIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLin);
        }
        if ([value caseInsensitiveCompare:@"LIT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLit);
        }
        if ([value caseInsensitiveCompare:@"LUB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLub);
        }
        if ([value caseInsensitiveCompare:@"LTZ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLtz);
        }
        if ([value caseInsensitiveCompare:@"MKD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMkd);
        }
        if ([value caseInsensitiveCompare:@"MLG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMlg);
        }
        if ([value caseInsensitiveCompare:@"MSA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMsa);
        }
        if ([value caseInsensitiveCompare:@"MAL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMal);
        }
        if ([value caseInsensitiveCompare:@"MLT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMlt);
        }
        if ([value caseInsensitiveCompare:@"GLV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGlv);
        }
        if ([value caseInsensitiveCompare:@"MRI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMri);
        }
        if ([value caseInsensitiveCompare:@"MAR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMar);
        }
        if ([value caseInsensitiveCompare:@"MAH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMah);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMon);
        }
        if ([value caseInsensitiveCompare:@"NAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNau);
        }
        if ([value caseInsensitiveCompare:@"NAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNav);
        }
        if ([value caseInsensitiveCompare:@"NDE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNde);
        }
        if ([value caseInsensitiveCompare:@"NBL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNbl);
        }
        if ([value caseInsensitiveCompare:@"NDO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNdo);
        }
        if ([value caseInsensitiveCompare:@"NEP"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNep);
        }
        if ([value caseInsensitiveCompare:@"SME"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSme);
        }
        if ([value caseInsensitiveCompare:@"NOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNor);
        }
        if ([value caseInsensitiveCompare:@"NOB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNob);
        }
        if ([value caseInsensitiveCompare:@"NNO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNno);
        }
        if ([value caseInsensitiveCompare:@"OCI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOci);
        }
        if ([value caseInsensitiveCompare:@"OJI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOji);
        }
        if ([value caseInsensitiveCompare:@"ORI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOri);
        }
        if ([value caseInsensitiveCompare:@"ORM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOrm);
        }
        if ([value caseInsensitiveCompare:@"OSS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOss);
        }
        if ([value caseInsensitiveCompare:@"PLI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePli);
        }
        if ([value caseInsensitiveCompare:@"FAS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFas);
        }
        if ([value caseInsensitiveCompare:@"POL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePol);
        }
        if ([value caseInsensitiveCompare:@"PUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePus);
        }
        if ([value caseInsensitiveCompare:@"QUE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQue);
        }
        if ([value caseInsensitiveCompare:@"QAA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQaa);
        }
        if ([value caseInsensitiveCompare:@"RON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRon);
        }
        if ([value caseInsensitiveCompare:@"ROH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRoh);
        }
        if ([value caseInsensitiveCompare:@"RUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRun);
        }
        if ([value caseInsensitiveCompare:@"SMO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSmo);
        }
        if ([value caseInsensitiveCompare:@"SAG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSag);
        }
        if ([value caseInsensitiveCompare:@"SAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSan);
        }
        if ([value caseInsensitiveCompare:@"SRD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSrd);
        }
        if ([value caseInsensitiveCompare:@"SRB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSrb);
        }
        if ([value caseInsensitiveCompare:@"SNA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSna);
        }
        if ([value caseInsensitiveCompare:@"III"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIii);
        }
        if ([value caseInsensitiveCompare:@"SND"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSnd);
        }
        if ([value caseInsensitiveCompare:@"SIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSin);
        }
        if ([value caseInsensitiveCompare:@"SLK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSlk);
        }
        if ([value caseInsensitiveCompare:@"SLV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSlv);
        }
        if ([value caseInsensitiveCompare:@"SOM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSom);
        }
        if ([value caseInsensitiveCompare:@"SOT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSot);
        }
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSun);
        }
        if ([value caseInsensitiveCompare:@"SWA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSwa);
        }
        if ([value caseInsensitiveCompare:@"SSW"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSsw);
        }
        if ([value caseInsensitiveCompare:@"SWE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSwe);
        }
        if ([value caseInsensitiveCompare:@"TGL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTgl);
        }
        if ([value caseInsensitiveCompare:@"TAH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTah);
        }
        if ([value caseInsensitiveCompare:@"TGK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTgk);
        }
        if ([value caseInsensitiveCompare:@"TAM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTam);
        }
        if ([value caseInsensitiveCompare:@"TAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTat);
        }
        if ([value caseInsensitiveCompare:@"TEL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTel);
        }
        if ([value caseInsensitiveCompare:@"THA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTha);
        }
        if ([value caseInsensitiveCompare:@"BOD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBod);
        }
        if ([value caseInsensitiveCompare:@"TIR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTir);
        }
        if ([value caseInsensitiveCompare:@"TON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTon);
        }
        if ([value caseInsensitiveCompare:@"TSO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTso);
        }
        if ([value caseInsensitiveCompare:@"TSN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTsn);
        }
        if ([value caseInsensitiveCompare:@"TUR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTur);
        }
        if ([value caseInsensitiveCompare:@"TUK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTuk);
        }
        if ([value caseInsensitiveCompare:@"TWI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTwi);
        }
        if ([value caseInsensitiveCompare:@"UIG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUig);
        }
        if ([value caseInsensitiveCompare:@"UKR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUkr);
        }
        if ([value caseInsensitiveCompare:@"UZB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUzb);
        }
        if ([value caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVen);
        }
        if ([value caseInsensitiveCompare:@"VOL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVol);
        }
        if ([value caseInsensitiveCompare:@"WLN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeWln);
        }
        if ([value caseInsensitiveCompare:@"CYM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCym);
        }
        if ([value caseInsensitiveCompare:@"FRY"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFry);
        }
        if ([value caseInsensitiveCompare:@"WOL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeWol);
        }
        if ([value caseInsensitiveCompare:@"XHO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeXho);
        }
        if ([value caseInsensitiveCompare:@"YID"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeYid);
        }
        if ([value caseInsensitiveCompare:@"YOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeYor);
        }
        if ([value caseInsensitiveCompare:@"ZHA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZha);
        }
        if ([value caseInsensitiveCompare:@"ZUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZul);
        }
        if ([value caseInsensitiveCompare:@"ORJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOrj);
        }
        if ([value caseInsensitiveCompare:@"QPC"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQpc);
        }
        if ([value caseInsensitiveCompare:@"TNG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTng);
        }
        return @(AWSMediaconvertLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertLanguageCodeEng:
                return @"ENG";
            case AWSMediaconvertLanguageCodeSpa:
                return @"SPA";
            case AWSMediaconvertLanguageCodeFra:
                return @"FRA";
            case AWSMediaconvertLanguageCodeDeu:
                return @"DEU";
            case AWSMediaconvertLanguageCodeGer:
                return @"GER";
            case AWSMediaconvertLanguageCodeZho:
                return @"ZHO";
            case AWSMediaconvertLanguageCodeAra:
                return @"ARA";
            case AWSMediaconvertLanguageCodeHin:
                return @"HIN";
            case AWSMediaconvertLanguageCodeJpn:
                return @"JPN";
            case AWSMediaconvertLanguageCodeRus:
                return @"RUS";
            case AWSMediaconvertLanguageCodePor:
                return @"POR";
            case AWSMediaconvertLanguageCodeIta:
                return @"ITA";
            case AWSMediaconvertLanguageCodeUrd:
                return @"URD";
            case AWSMediaconvertLanguageCodeVie:
                return @"VIE";
            case AWSMediaconvertLanguageCodeKor:
                return @"KOR";
            case AWSMediaconvertLanguageCodePan:
                return @"PAN";
            case AWSMediaconvertLanguageCodeAbk:
                return @"ABK";
            case AWSMediaconvertLanguageCodeAar:
                return @"AAR";
            case AWSMediaconvertLanguageCodeAfr:
                return @"AFR";
            case AWSMediaconvertLanguageCodeAka:
                return @"AKA";
            case AWSMediaconvertLanguageCodeSqi:
                return @"SQI";
            case AWSMediaconvertLanguageCodeAmh:
                return @"AMH";
            case AWSMediaconvertLanguageCodeArg:
                return @"ARG";
            case AWSMediaconvertLanguageCodeHye:
                return @"HYE";
            case AWSMediaconvertLanguageCodeAsm:
                return @"ASM";
            case AWSMediaconvertLanguageCodeAva:
                return @"AVA";
            case AWSMediaconvertLanguageCodeAve:
                return @"AVE";
            case AWSMediaconvertLanguageCodeAym:
                return @"AYM";
            case AWSMediaconvertLanguageCodeAze:
                return @"AZE";
            case AWSMediaconvertLanguageCodeBam:
                return @"BAM";
            case AWSMediaconvertLanguageCodeBak:
                return @"BAK";
            case AWSMediaconvertLanguageCodeEus:
                return @"EUS";
            case AWSMediaconvertLanguageCodeBel:
                return @"BEL";
            case AWSMediaconvertLanguageCodeBen:
                return @"BEN";
            case AWSMediaconvertLanguageCodeBih:
                return @"BIH";
            case AWSMediaconvertLanguageCodeBis:
                return @"BIS";
            case AWSMediaconvertLanguageCodeBos:
                return @"BOS";
            case AWSMediaconvertLanguageCodeBre:
                return @"BRE";
            case AWSMediaconvertLanguageCodeBul:
                return @"BUL";
            case AWSMediaconvertLanguageCodeMya:
                return @"MYA";
            case AWSMediaconvertLanguageCodeCat:
                return @"CAT";
            case AWSMediaconvertLanguageCodeKhm:
                return @"KHM";
            case AWSMediaconvertLanguageCodeCha:
                return @"CHA";
            case AWSMediaconvertLanguageCodeChe:
                return @"CHE";
            case AWSMediaconvertLanguageCodeNya:
                return @"NYA";
            case AWSMediaconvertLanguageCodeChu:
                return @"CHU";
            case AWSMediaconvertLanguageCodeChv:
                return @"CHV";
            case AWSMediaconvertLanguageCodeCor:
                return @"COR";
            case AWSMediaconvertLanguageCodeCos:
                return @"COS";
            case AWSMediaconvertLanguageCodeCre:
                return @"CRE";
            case AWSMediaconvertLanguageCodeHrv:
                return @"HRV";
            case AWSMediaconvertLanguageCodeCes:
                return @"CES";
            case AWSMediaconvertLanguageCodeDan:
                return @"DAN";
            case AWSMediaconvertLanguageCodeDiv:
                return @"DIV";
            case AWSMediaconvertLanguageCodeNld:
                return @"NLD";
            case AWSMediaconvertLanguageCodeDzo:
                return @"DZO";
            case AWSMediaconvertLanguageCodeEnm:
                return @"ENM";
            case AWSMediaconvertLanguageCodeEpo:
                return @"EPO";
            case AWSMediaconvertLanguageCodeEst:
                return @"EST";
            case AWSMediaconvertLanguageCodeEwe:
                return @"EWE";
            case AWSMediaconvertLanguageCodeFao:
                return @"FAO";
            case AWSMediaconvertLanguageCodeFij:
                return @"FIJ";
            case AWSMediaconvertLanguageCodeFin:
                return @"FIN";
            case AWSMediaconvertLanguageCodeFrm:
                return @"FRM";
            case AWSMediaconvertLanguageCodeFul:
                return @"FUL";
            case AWSMediaconvertLanguageCodeGla:
                return @"GLA";
            case AWSMediaconvertLanguageCodeGlg:
                return @"GLG";
            case AWSMediaconvertLanguageCodeLug:
                return @"LUG";
            case AWSMediaconvertLanguageCodeKat:
                return @"KAT";
            case AWSMediaconvertLanguageCodeEll:
                return @"ELL";
            case AWSMediaconvertLanguageCodeGrn:
                return @"GRN";
            case AWSMediaconvertLanguageCodeGuj:
                return @"GUJ";
            case AWSMediaconvertLanguageCodeHat:
                return @"HAT";
            case AWSMediaconvertLanguageCodeHau:
                return @"HAU";
            case AWSMediaconvertLanguageCodeHeb:
                return @"HEB";
            case AWSMediaconvertLanguageCodeHer:
                return @"HER";
            case AWSMediaconvertLanguageCodeHmo:
                return @"HMO";
            case AWSMediaconvertLanguageCodeHun:
                return @"HUN";
            case AWSMediaconvertLanguageCodeIsl:
                return @"ISL";
            case AWSMediaconvertLanguageCodeIdo:
                return @"IDO";
            case AWSMediaconvertLanguageCodeIbo:
                return @"IBO";
            case AWSMediaconvertLanguageCodeInd:
                return @"IND";
            case AWSMediaconvertLanguageCodeIna:
                return @"INA";
            case AWSMediaconvertLanguageCodeIle:
                return @"ILE";
            case AWSMediaconvertLanguageCodeIku:
                return @"IKU";
            case AWSMediaconvertLanguageCodeIpk:
                return @"IPK";
            case AWSMediaconvertLanguageCodeGle:
                return @"GLE";
            case AWSMediaconvertLanguageCodeJav:
                return @"JAV";
            case AWSMediaconvertLanguageCodeKal:
                return @"KAL";
            case AWSMediaconvertLanguageCodeKan:
                return @"KAN";
            case AWSMediaconvertLanguageCodeKau:
                return @"KAU";
            case AWSMediaconvertLanguageCodeKas:
                return @"KAS";
            case AWSMediaconvertLanguageCodeKaz:
                return @"KAZ";
            case AWSMediaconvertLanguageCodeKik:
                return @"KIK";
            case AWSMediaconvertLanguageCodeKin:
                return @"KIN";
            case AWSMediaconvertLanguageCodeKir:
                return @"KIR";
            case AWSMediaconvertLanguageCodeKom:
                return @"KOM";
            case AWSMediaconvertLanguageCodeKon:
                return @"KON";
            case AWSMediaconvertLanguageCodeKua:
                return @"KUA";
            case AWSMediaconvertLanguageCodeKur:
                return @"KUR";
            case AWSMediaconvertLanguageCodeLao:
                return @"LAO";
            case AWSMediaconvertLanguageCodeLat:
                return @"LAT";
            case AWSMediaconvertLanguageCodeLav:
                return @"LAV";
            case AWSMediaconvertLanguageCodeLim:
                return @"LIM";
            case AWSMediaconvertLanguageCodeLin:
                return @"LIN";
            case AWSMediaconvertLanguageCodeLit:
                return @"LIT";
            case AWSMediaconvertLanguageCodeLub:
                return @"LUB";
            case AWSMediaconvertLanguageCodeLtz:
                return @"LTZ";
            case AWSMediaconvertLanguageCodeMkd:
                return @"MKD";
            case AWSMediaconvertLanguageCodeMlg:
                return @"MLG";
            case AWSMediaconvertLanguageCodeMsa:
                return @"MSA";
            case AWSMediaconvertLanguageCodeMal:
                return @"MAL";
            case AWSMediaconvertLanguageCodeMlt:
                return @"MLT";
            case AWSMediaconvertLanguageCodeGlv:
                return @"GLV";
            case AWSMediaconvertLanguageCodeMri:
                return @"MRI";
            case AWSMediaconvertLanguageCodeMar:
                return @"MAR";
            case AWSMediaconvertLanguageCodeMah:
                return @"MAH";
            case AWSMediaconvertLanguageCodeMon:
                return @"MON";
            case AWSMediaconvertLanguageCodeNau:
                return @"NAU";
            case AWSMediaconvertLanguageCodeNav:
                return @"NAV";
            case AWSMediaconvertLanguageCodeNde:
                return @"NDE";
            case AWSMediaconvertLanguageCodeNbl:
                return @"NBL";
            case AWSMediaconvertLanguageCodeNdo:
                return @"NDO";
            case AWSMediaconvertLanguageCodeNep:
                return @"NEP";
            case AWSMediaconvertLanguageCodeSme:
                return @"SME";
            case AWSMediaconvertLanguageCodeNor:
                return @"NOR";
            case AWSMediaconvertLanguageCodeNob:
                return @"NOB";
            case AWSMediaconvertLanguageCodeNno:
                return @"NNO";
            case AWSMediaconvertLanguageCodeOci:
                return @"OCI";
            case AWSMediaconvertLanguageCodeOji:
                return @"OJI";
            case AWSMediaconvertLanguageCodeOri:
                return @"ORI";
            case AWSMediaconvertLanguageCodeOrm:
                return @"ORM";
            case AWSMediaconvertLanguageCodeOss:
                return @"OSS";
            case AWSMediaconvertLanguageCodePli:
                return @"PLI";
            case AWSMediaconvertLanguageCodeFas:
                return @"FAS";
            case AWSMediaconvertLanguageCodePol:
                return @"POL";
            case AWSMediaconvertLanguageCodePus:
                return @"PUS";
            case AWSMediaconvertLanguageCodeQue:
                return @"QUE";
            case AWSMediaconvertLanguageCodeQaa:
                return @"QAA";
            case AWSMediaconvertLanguageCodeRon:
                return @"RON";
            case AWSMediaconvertLanguageCodeRoh:
                return @"ROH";
            case AWSMediaconvertLanguageCodeRun:
                return @"RUN";
            case AWSMediaconvertLanguageCodeSmo:
                return @"SMO";
            case AWSMediaconvertLanguageCodeSag:
                return @"SAG";
            case AWSMediaconvertLanguageCodeSan:
                return @"SAN";
            case AWSMediaconvertLanguageCodeSrd:
                return @"SRD";
            case AWSMediaconvertLanguageCodeSrb:
                return @"SRB";
            case AWSMediaconvertLanguageCodeSna:
                return @"SNA";
            case AWSMediaconvertLanguageCodeIii:
                return @"III";
            case AWSMediaconvertLanguageCodeSnd:
                return @"SND";
            case AWSMediaconvertLanguageCodeSin:
                return @"SIN";
            case AWSMediaconvertLanguageCodeSlk:
                return @"SLK";
            case AWSMediaconvertLanguageCodeSlv:
                return @"SLV";
            case AWSMediaconvertLanguageCodeSom:
                return @"SOM";
            case AWSMediaconvertLanguageCodeSot:
                return @"SOT";
            case AWSMediaconvertLanguageCodeSun:
                return @"SUN";
            case AWSMediaconvertLanguageCodeSwa:
                return @"SWA";
            case AWSMediaconvertLanguageCodeSsw:
                return @"SSW";
            case AWSMediaconvertLanguageCodeSwe:
                return @"SWE";
            case AWSMediaconvertLanguageCodeTgl:
                return @"TGL";
            case AWSMediaconvertLanguageCodeTah:
                return @"TAH";
            case AWSMediaconvertLanguageCodeTgk:
                return @"TGK";
            case AWSMediaconvertLanguageCodeTam:
                return @"TAM";
            case AWSMediaconvertLanguageCodeTat:
                return @"TAT";
            case AWSMediaconvertLanguageCodeTel:
                return @"TEL";
            case AWSMediaconvertLanguageCodeTha:
                return @"THA";
            case AWSMediaconvertLanguageCodeBod:
                return @"BOD";
            case AWSMediaconvertLanguageCodeTir:
                return @"TIR";
            case AWSMediaconvertLanguageCodeTon:
                return @"TON";
            case AWSMediaconvertLanguageCodeTso:
                return @"TSO";
            case AWSMediaconvertLanguageCodeTsn:
                return @"TSN";
            case AWSMediaconvertLanguageCodeTur:
                return @"TUR";
            case AWSMediaconvertLanguageCodeTuk:
                return @"TUK";
            case AWSMediaconvertLanguageCodeTwi:
                return @"TWI";
            case AWSMediaconvertLanguageCodeUig:
                return @"UIG";
            case AWSMediaconvertLanguageCodeUkr:
                return @"UKR";
            case AWSMediaconvertLanguageCodeUzb:
                return @"UZB";
            case AWSMediaconvertLanguageCodeVen:
                return @"VEN";
            case AWSMediaconvertLanguageCodeVol:
                return @"VOL";
            case AWSMediaconvertLanguageCodeWln:
                return @"WLN";
            case AWSMediaconvertLanguageCodeCym:
                return @"CYM";
            case AWSMediaconvertLanguageCodeFry:
                return @"FRY";
            case AWSMediaconvertLanguageCodeWol:
                return @"WOL";
            case AWSMediaconvertLanguageCodeXho:
                return @"XHO";
            case AWSMediaconvertLanguageCodeYid:
                return @"YID";
            case AWSMediaconvertLanguageCodeYor:
                return @"YOR";
            case AWSMediaconvertLanguageCodeZha:
                return @"ZHA";
            case AWSMediaconvertLanguageCodeZul:
                return @"ZUL";
            case AWSMediaconvertLanguageCodeOrj:
                return @"ORJ";
            case AWSMediaconvertLanguageCodeQpc:
                return @"QPC";
            case AWSMediaconvertLanguageCodeTng:
                return @"TNG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertCaptionSourceSettings class]];
}

@end

@implementation AWSMediaconvertCaptionSourceFramerate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             };
}

@end

@implementation AWSMediaconvertCaptionSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ancillarySourceSettings" : @"AncillarySourceSettings",
             @"dvbSubSourceSettings" : @"DvbSubSourceSettings",
             @"embeddedSourceSettings" : @"EmbeddedSourceSettings",
             @"fileSourceSettings" : @"FileSourceSettings",
             @"sourceType" : @"SourceType",
             @"teletextSourceSettings" : @"TeletextSourceSettings",
             @"trackSourceSettings" : @"TrackSourceSettings",
             };
}

+ (NSValueTransformer *)ancillarySourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAncillarySourceSettings class]];
}

+ (NSValueTransformer *)dvbSubSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDvbSubSourceSettings class]];
}

+ (NSValueTransformer *)embeddedSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertEmbeddedSourceSettings class]];
}

+ (NSValueTransformer *)fileSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertFileSourceSettings class]];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ANCILLARY"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionSourceTypeAncillary);
        }
        if ([value caseInsensitiveCompare:@"DVB_SUB"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionSourceTypeDvbSub);
        }
        if ([value caseInsensitiveCompare:@"EMBEDDED"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionSourceTypeEmbedded);
        }
        if ([value caseInsensitiveCompare:@"SCTE20"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionSourceTypeScte20);
        }
        if ([value caseInsensitiveCompare:@"SCC"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionSourceTypeScc);
        }
        if ([value caseInsensitiveCompare:@"TTML"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionSourceTypeTtml);
        }
        if ([value caseInsensitiveCompare:@"STL"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionSourceTypeStl);
        }
        if ([value caseInsensitiveCompare:@"SRT"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionSourceTypeSrt);
        }
        if ([value caseInsensitiveCompare:@"SMI"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionSourceTypeSmi);
        }
        if ([value caseInsensitiveCompare:@"TELETEXT"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionSourceTypeTeletext);
        }
        if ([value caseInsensitiveCompare:@"NULL_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionSourceTypeNullSource);
        }
        if ([value caseInsensitiveCompare:@"IMSC"] == NSOrderedSame) {
            return @(AWSMediaconvertCaptionSourceTypeImsc);
        }
        return @(AWSMediaconvertCaptionSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCaptionSourceTypeAncillary:
                return @"ANCILLARY";
            case AWSMediaconvertCaptionSourceTypeDvbSub:
                return @"DVB_SUB";
            case AWSMediaconvertCaptionSourceTypeEmbedded:
                return @"EMBEDDED";
            case AWSMediaconvertCaptionSourceTypeScte20:
                return @"SCTE20";
            case AWSMediaconvertCaptionSourceTypeScc:
                return @"SCC";
            case AWSMediaconvertCaptionSourceTypeTtml:
                return @"TTML";
            case AWSMediaconvertCaptionSourceTypeStl:
                return @"STL";
            case AWSMediaconvertCaptionSourceTypeSrt:
                return @"SRT";
            case AWSMediaconvertCaptionSourceTypeSmi:
                return @"SMI";
            case AWSMediaconvertCaptionSourceTypeTeletext:
                return @"TELETEXT";
            case AWSMediaconvertCaptionSourceTypeNullSource:
                return @"NULL_SOURCE";
            case AWSMediaconvertCaptionSourceTypeImsc:
                return @"IMSC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)teletextSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertTeletextSourceSettings class]];
}

+ (NSValueTransformer *)trackSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertTrackSourceSettings class]];
}

@end

@implementation AWSMediaconvertChannelMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputChannels" : @"OutputChannels",
             };
}

+ (NSValueTransformer *)outputChannelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertOutputChannelMapping class]];
}

@end

@implementation AWSMediaconvertCmafAdditionalManifest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestNameModifier" : @"ManifestNameModifier",
             @"selectedOutputs" : @"SelectedOutputs",
             };
}

@end

@implementation AWSMediaconvertCmafEncryptionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constantInitializationVector" : @"ConstantInitializationVector",
             @"encryptionMethod" : @"EncryptionMethod",
             @"initializationVectorInManifest" : @"InitializationVectorInManifest",
             @"spekeKeyProvider" : @"SpekeKeyProvider",
             @"staticKeyProvider" : @"StaticKeyProvider",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)encryptionMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAMPLE_AES"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafEncryptionTypeSampleAes);
        }
        if ([value caseInsensitiveCompare:@"AES_CTR"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafEncryptionTypeAesCtr);
        }
        return @(AWSMediaconvertCmafEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmafEncryptionTypeSampleAes:
                return @"SAMPLE_AES";
            case AWSMediaconvertCmafEncryptionTypeAesCtr:
                return @"AES_CTR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)initializationVectorInManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafInitializationVectorInManifestInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafInitializationVectorInManifestExclude);
        }
        return @(AWSMediaconvertCmafInitializationVectorInManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmafInitializationVectorInManifestInclude:
                return @"INCLUDE";
            case AWSMediaconvertCmafInitializationVectorInManifestExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertSpekeKeyProviderCmaf class]];
}

+ (NSValueTransformer *)staticKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertStaticKeyProvider class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SPEKE"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafKeyProviderTypeSpeke);
        }
        if ([value caseInsensitiveCompare:@"STATIC_KEY"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafKeyProviderTypeStaticKey);
        }
        return @(AWSMediaconvertCmafKeyProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmafKeyProviderTypeSpeke:
                return @"SPEKE";
            case AWSMediaconvertCmafKeyProviderTypeStaticKey:
                return @"STATIC_KEY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertCmafGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalManifests" : @"AdditionalManifests",
             @"baseUrl" : @"BaseUrl",
             @"clientCache" : @"ClientCache",
             @"codecSpecification" : @"CodecSpecification",
             @"destination" : @"Destination",
             @"destinationSettings" : @"DestinationSettings",
             @"encryption" : @"Encryption",
             @"fragmentLength" : @"FragmentLength",
             @"manifestCompression" : @"ManifestCompression",
             @"manifestDurationFormat" : @"ManifestDurationFormat",
             @"minBufferTime" : @"MinBufferTime",
             @"minFinalSegmentLength" : @"MinFinalSegmentLength",
             @"mpdProfile" : @"MpdProfile",
             @"segmentControl" : @"SegmentControl",
             @"segmentLength" : @"SegmentLength",
             @"streamInfResolution" : @"StreamInfResolution",
             @"writeDashManifest" : @"WriteDashManifest",
             @"writeHlsManifest" : @"WriteHlsManifest",
             @"writeSegmentTimelineInRepresentation" : @"WriteSegmentTimelineInRepresentation",
             };
}

+ (NSValueTransformer *)additionalManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertCmafAdditionalManifest class]];
}

+ (NSValueTransformer *)clientCacheJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafClientCacheDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafClientCacheEnabled);
        }
        return @(AWSMediaconvertCmafClientCacheUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmafClientCacheDisabled:
                return @"DISABLED";
            case AWSMediaconvertCmafClientCacheEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecSpecificationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RFC_6381"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafCodecSpecificationRfc6381);
        }
        if ([value caseInsensitiveCompare:@"RFC_4281"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafCodecSpecificationRfc4281);
        }
        return @(AWSMediaconvertCmafCodecSpecificationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmafCodecSpecificationRfc6381:
                return @"RFC_6381";
            case AWSMediaconvertCmafCodecSpecificationRfc4281:
                return @"RFC_4281";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDestinationSettings class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertCmafEncryptionSettings class]];
}

+ (NSValueTransformer *)manifestCompressionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafManifestCompressionGzip);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafManifestCompressionNone);
        }
        return @(AWSMediaconvertCmafManifestCompressionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmafManifestCompressionGzip:
                return @"GZIP";
            case AWSMediaconvertCmafManifestCompressionNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)manifestDurationFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FLOATING_POINT"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafManifestDurationFormatFloatingPoint);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafManifestDurationFormatInteger);
        }
        return @(AWSMediaconvertCmafManifestDurationFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmafManifestDurationFormatFloatingPoint:
                return @"FLOATING_POINT";
            case AWSMediaconvertCmafManifestDurationFormatInteger:
                return @"INTEGER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mpdProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAIN_PROFILE"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafMpdProfileMainProfile);
        }
        if ([value caseInsensitiveCompare:@"ON_DEMAND_PROFILE"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafMpdProfileOnDemandProfile);
        }
        return @(AWSMediaconvertCmafMpdProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmafMpdProfileMainProfile:
                return @"MAIN_PROFILE";
            case AWSMediaconvertCmafMpdProfileOnDemandProfile:
                return @"ON_DEMAND_PROFILE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_FILE"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafSegmentControlSingleFile);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTED_FILES"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafSegmentControlSegmentedFiles);
        }
        return @(AWSMediaconvertCmafSegmentControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmafSegmentControlSingleFile:
                return @"SINGLE_FILE";
            case AWSMediaconvertCmafSegmentControlSegmentedFiles:
                return @"SEGMENTED_FILES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)streamInfResolutionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafStreamInfResolutionInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafStreamInfResolutionExclude);
        }
        return @(AWSMediaconvertCmafStreamInfResolutionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmafStreamInfResolutionInclude:
                return @"INCLUDE";
            case AWSMediaconvertCmafStreamInfResolutionExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)writeDashManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafWriteDASHManifestDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafWriteDASHManifestEnabled);
        }
        return @(AWSMediaconvertCmafWriteDASHManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmafWriteDASHManifestDisabled:
                return @"DISABLED";
            case AWSMediaconvertCmafWriteDASHManifestEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)writeHlsManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafWriteHLSManifestDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafWriteHLSManifestEnabled);
        }
        return @(AWSMediaconvertCmafWriteHLSManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmafWriteHLSManifestDisabled:
                return @"DISABLED";
            case AWSMediaconvertCmafWriteHLSManifestEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)writeSegmentTimelineInRepresentationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafWriteSegmentTimelineInRepresentationEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertCmafWriteSegmentTimelineInRepresentationDisabled);
        }
        return @(AWSMediaconvertCmafWriteSegmentTimelineInRepresentationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmafWriteSegmentTimelineInRepresentationEnabled:
                return @"ENABLED";
            case AWSMediaconvertCmafWriteSegmentTimelineInRepresentationDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertCmfcSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scte35Esam" : @"Scte35Esam",
             @"scte35Source" : @"Scte35Source",
             };
}

+ (NSValueTransformer *)scte35EsamJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSMediaconvertCmfcScte35EsamInsert);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertCmfcScte35EsamNone);
        }
        return @(AWSMediaconvertCmfcScte35EsamUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmfcScte35EsamInsert:
                return @"INSERT";
            case AWSMediaconvertCmfcScte35EsamNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35SourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMediaconvertCmfcScte35SourcePassthrough);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertCmfcScte35SourceNone);
        }
        return @(AWSMediaconvertCmfcScte35SourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCmfcScte35SourcePassthrough:
                return @"PASSTHROUGH";
            case AWSMediaconvertCmfcScte35SourceNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertColorCorrector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"brightness" : @"Brightness",
             @"colorSpaceConversion" : @"ColorSpaceConversion",
             @"contrast" : @"Contrast",
             @"hdr10Metadata" : @"Hdr10Metadata",
             @"hue" : @"Hue",
             @"saturation" : @"Saturation",
             };
}

+ (NSValueTransformer *)colorSpaceConversionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertColorSpaceConversionNone);
        }
        if ([value caseInsensitiveCompare:@"FORCE_601"] == NSOrderedSame) {
            return @(AWSMediaconvertColorSpaceConversionForce601);
        }
        if ([value caseInsensitiveCompare:@"FORCE_709"] == NSOrderedSame) {
            return @(AWSMediaconvertColorSpaceConversionForce709);
        }
        if ([value caseInsensitiveCompare:@"FORCE_HDR10"] == NSOrderedSame) {
            return @(AWSMediaconvertColorSpaceConversionForceHdr10);
        }
        if ([value caseInsensitiveCompare:@"FORCE_HLG_2020"] == NSOrderedSame) {
            return @(AWSMediaconvertColorSpaceConversionForceHlg2020);
        }
        return @(AWSMediaconvertColorSpaceConversionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertColorSpaceConversionNone:
                return @"NONE";
            case AWSMediaconvertColorSpaceConversionForce601:
                return @"FORCE_601";
            case AWSMediaconvertColorSpaceConversionForce709:
                return @"FORCE_709";
            case AWSMediaconvertColorSpaceConversionForceHdr10:
                return @"FORCE_HDR10";
            case AWSMediaconvertColorSpaceConversionForceHlg2020:
                return @"FORCE_HLG_2020";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hdr10MetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertHdr10Metadata class]];
}

@end

@implementation AWSMediaconvertContainerSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cmfcSettings" : @"CmfcSettings",
             @"container" : @"Container",
             @"f4vSettings" : @"F4vSettings",
             @"m2tsSettings" : @"M2tsSettings",
             @"m3u8Settings" : @"M3u8Settings",
             @"movSettings" : @"MovSettings",
             @"mp4Settings" : @"Mp4Settings",
             @"mpdSettings" : @"MpdSettings",
             @"mxfSettings" : @"MxfSettings",
             };
}

+ (NSValueTransformer *)cmfcSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertCmfcSettings class]];
}

+ (NSValueTransformer *)containerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"F4V"] == NSOrderedSame) {
            return @(AWSMediaconvertContainerTypeF4v);
        }
        if ([value caseInsensitiveCompare:@"ISMV"] == NSOrderedSame) {
            return @(AWSMediaconvertContainerTypeIsmv);
        }
        if ([value caseInsensitiveCompare:@"M2TS"] == NSOrderedSame) {
            return @(AWSMediaconvertContainerTypeM2ts);
        }
        if ([value caseInsensitiveCompare:@"M3U8"] == NSOrderedSame) {
            return @(AWSMediaconvertContainerTypeM3u8);
        }
        if ([value caseInsensitiveCompare:@"CMFC"] == NSOrderedSame) {
            return @(AWSMediaconvertContainerTypeCmfc);
        }
        if ([value caseInsensitiveCompare:@"MOV"] == NSOrderedSame) {
            return @(AWSMediaconvertContainerTypeMov);
        }
        if ([value caseInsensitiveCompare:@"MP4"] == NSOrderedSame) {
            return @(AWSMediaconvertContainerTypeMp4);
        }
        if ([value caseInsensitiveCompare:@"MPD"] == NSOrderedSame) {
            return @(AWSMediaconvertContainerTypeMpd);
        }
        if ([value caseInsensitiveCompare:@"MXF"] == NSOrderedSame) {
            return @(AWSMediaconvertContainerTypeMxf);
        }
        if ([value caseInsensitiveCompare:@"WEBM"] == NSOrderedSame) {
            return @(AWSMediaconvertContainerTypeWebm);
        }
        if ([value caseInsensitiveCompare:@"RAW"] == NSOrderedSame) {
            return @(AWSMediaconvertContainerTypeRAW);
        }
        return @(AWSMediaconvertContainerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertContainerTypeF4v:
                return @"F4V";
            case AWSMediaconvertContainerTypeIsmv:
                return @"ISMV";
            case AWSMediaconvertContainerTypeM2ts:
                return @"M2TS";
            case AWSMediaconvertContainerTypeM3u8:
                return @"M3U8";
            case AWSMediaconvertContainerTypeCmfc:
                return @"CMFC";
            case AWSMediaconvertContainerTypeMov:
                return @"MOV";
            case AWSMediaconvertContainerTypeMp4:
                return @"MP4";
            case AWSMediaconvertContainerTypeMpd:
                return @"MPD";
            case AWSMediaconvertContainerTypeMxf:
                return @"MXF";
            case AWSMediaconvertContainerTypeWebm:
                return @"WEBM";
            case AWSMediaconvertContainerTypeRAW:
                return @"RAW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)f4vSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertF4vSettings class]];
}

+ (NSValueTransformer *)m2tsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertM2tsSettings class]];
}

+ (NSValueTransformer *)m3u8SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertM3u8Settings class]];
}

+ (NSValueTransformer *)movSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertMovSettings class]];
}

+ (NSValueTransformer *)mp4SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertMp4Settings class]];
}

+ (NSValueTransformer *)mpdSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertMpdSettings class]];
}

+ (NSValueTransformer *)mxfSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertMxfSettings class]];
}

@end

@implementation AWSMediaconvertCreateJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accelerationSettings" : @"AccelerationSettings",
             @"billingTagsSource" : @"BillingTagsSource",
             @"clientRequestToken" : @"ClientRequestToken",
             @"hopDestinations" : @"HopDestinations",
             @"jobTemplate" : @"JobTemplate",
             @"priority" : @"Priority",
             @"queue" : @"Queue",
             @"role" : @"Role",
             @"settings" : @"Settings",
             @"simulateReservedQueue" : @"SimulateReservedQueue",
             @"statusUpdateInterval" : @"StatusUpdateInterval",
             @"tags" : @"Tags",
             @"userMetadata" : @"UserMetadata",
             };
}

+ (NSValueTransformer *)accelerationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAccelerationSettings class]];
}

+ (NSValueTransformer *)billingTagsSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUE"] == NSOrderedSame) {
            return @(AWSMediaconvertBillingTagsSourceQueue);
        }
        if ([value caseInsensitiveCompare:@"PRESET"] == NSOrderedSame) {
            return @(AWSMediaconvertBillingTagsSourcePreset);
        }
        if ([value caseInsensitiveCompare:@"JOB_TEMPLATE"] == NSOrderedSame) {
            return @(AWSMediaconvertBillingTagsSourceJobTemplate);
        }
        if ([value caseInsensitiveCompare:@"JOB"] == NSOrderedSame) {
            return @(AWSMediaconvertBillingTagsSourceJob);
        }
        return @(AWSMediaconvertBillingTagsSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertBillingTagsSourceQueue:
                return @"QUEUE";
            case AWSMediaconvertBillingTagsSourcePreset:
                return @"PRESET";
            case AWSMediaconvertBillingTagsSourceJobTemplate:
                return @"JOB_TEMPLATE";
            case AWSMediaconvertBillingTagsSourceJob:
                return @"JOB";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hopDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertHopDestination class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertJobSettings class]];
}

+ (NSValueTransformer *)simulateReservedQueueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertSimulateReservedQueueDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertSimulateReservedQueueEnabled);
        }
        return @(AWSMediaconvertSimulateReservedQueueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertSimulateReservedQueueDisabled:
                return @"DISABLED";
            case AWSMediaconvertSimulateReservedQueueEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusUpdateIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECONDS_10"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds10);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_12"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds12);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_15"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds15);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_20"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds20);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_30"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds30);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_60"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds60);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_120"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds120);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_180"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds180);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_240"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds240);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_300"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds300);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_360"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds360);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_420"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds420);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_480"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds480);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_540"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds540);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_600"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds600);
        }
        return @(AWSMediaconvertStatusUpdateIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertStatusUpdateIntervalSeconds10:
                return @"SECONDS_10";
            case AWSMediaconvertStatusUpdateIntervalSeconds12:
                return @"SECONDS_12";
            case AWSMediaconvertStatusUpdateIntervalSeconds15:
                return @"SECONDS_15";
            case AWSMediaconvertStatusUpdateIntervalSeconds20:
                return @"SECONDS_20";
            case AWSMediaconvertStatusUpdateIntervalSeconds30:
                return @"SECONDS_30";
            case AWSMediaconvertStatusUpdateIntervalSeconds60:
                return @"SECONDS_60";
            case AWSMediaconvertStatusUpdateIntervalSeconds120:
                return @"SECONDS_120";
            case AWSMediaconvertStatusUpdateIntervalSeconds180:
                return @"SECONDS_180";
            case AWSMediaconvertStatusUpdateIntervalSeconds240:
                return @"SECONDS_240";
            case AWSMediaconvertStatusUpdateIntervalSeconds300:
                return @"SECONDS_300";
            case AWSMediaconvertStatusUpdateIntervalSeconds360:
                return @"SECONDS_360";
            case AWSMediaconvertStatusUpdateIntervalSeconds420:
                return @"SECONDS_420";
            case AWSMediaconvertStatusUpdateIntervalSeconds480:
                return @"SECONDS_480";
            case AWSMediaconvertStatusUpdateIntervalSeconds540:
                return @"SECONDS_540";
            case AWSMediaconvertStatusUpdateIntervalSeconds600:
                return @"SECONDS_600";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertCreateJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"job" : @"Job",
             };
}

+ (NSValueTransformer *)jobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertJob class]];
}

@end

@implementation AWSMediaconvertCreateJobTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accelerationSettings" : @"AccelerationSettings",
             @"category" : @"Category",
             @"detail" : @"Description",
             @"hopDestinations" : @"HopDestinations",
             @"name" : @"Name",
             @"priority" : @"Priority",
             @"queue" : @"Queue",
             @"settings" : @"Settings",
             @"statusUpdateInterval" : @"StatusUpdateInterval",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)accelerationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAccelerationSettings class]];
}

+ (NSValueTransformer *)hopDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertHopDestination class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertJobTemplateSettings class]];
}

+ (NSValueTransformer *)statusUpdateIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECONDS_10"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds10);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_12"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds12);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_15"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds15);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_20"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds20);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_30"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds30);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_60"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds60);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_120"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds120);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_180"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds180);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_240"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds240);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_300"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds300);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_360"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds360);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_420"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds420);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_480"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds480);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_540"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds540);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_600"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds600);
        }
        return @(AWSMediaconvertStatusUpdateIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertStatusUpdateIntervalSeconds10:
                return @"SECONDS_10";
            case AWSMediaconvertStatusUpdateIntervalSeconds12:
                return @"SECONDS_12";
            case AWSMediaconvertStatusUpdateIntervalSeconds15:
                return @"SECONDS_15";
            case AWSMediaconvertStatusUpdateIntervalSeconds20:
                return @"SECONDS_20";
            case AWSMediaconvertStatusUpdateIntervalSeconds30:
                return @"SECONDS_30";
            case AWSMediaconvertStatusUpdateIntervalSeconds60:
                return @"SECONDS_60";
            case AWSMediaconvertStatusUpdateIntervalSeconds120:
                return @"SECONDS_120";
            case AWSMediaconvertStatusUpdateIntervalSeconds180:
                return @"SECONDS_180";
            case AWSMediaconvertStatusUpdateIntervalSeconds240:
                return @"SECONDS_240";
            case AWSMediaconvertStatusUpdateIntervalSeconds300:
                return @"SECONDS_300";
            case AWSMediaconvertStatusUpdateIntervalSeconds360:
                return @"SECONDS_360";
            case AWSMediaconvertStatusUpdateIntervalSeconds420:
                return @"SECONDS_420";
            case AWSMediaconvertStatusUpdateIntervalSeconds480:
                return @"SECONDS_480";
            case AWSMediaconvertStatusUpdateIntervalSeconds540:
                return @"SECONDS_540";
            case AWSMediaconvertStatusUpdateIntervalSeconds600:
                return @"SECONDS_600";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertCreateJobTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobTemplate" : @"JobTemplate",
             };
}

+ (NSValueTransformer *)jobTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertJobTemplate class]];
}

@end

@implementation AWSMediaconvertCreatePresetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"category" : @"Category",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"settings" : @"Settings",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertPresetSettings class]];
}

@end

@implementation AWSMediaconvertCreatePresetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"preset" : @"Preset",
             };
}

+ (NSValueTransformer *)presetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertPreset class]];
}

@end

@implementation AWSMediaconvertCreateQueueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             @"pricingPlan" : @"PricingPlan",
             @"reservationPlanSettings" : @"ReservationPlanSettings",
             @"status" : @"Status",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)pricingPlanJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSMediaconvertPricingPlanOnDemand);
        }
        if ([value caseInsensitiveCompare:@"RESERVED"] == NSOrderedSame) {
            return @(AWSMediaconvertPricingPlanReserved);
        }
        return @(AWSMediaconvertPricingPlanUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertPricingPlanOnDemand:
                return @"ON_DEMAND";
            case AWSMediaconvertPricingPlanReserved:
                return @"RESERVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)reservationPlanSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertReservationPlanSettings class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSMediaconvertQueueStatusActive);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSMediaconvertQueueStatusPaused);
        }
        return @(AWSMediaconvertQueueStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertQueueStatusActive:
                return @"ACTIVE";
            case AWSMediaconvertQueueStatusPaused:
                return @"PAUSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertCreateQueueResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queue" : @"Queue",
             };
}

+ (NSValueTransformer *)queueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertQueue class]];
}

@end

@implementation AWSMediaconvertDashAdditionalManifest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestNameModifier" : @"ManifestNameModifier",
             @"selectedOutputs" : @"SelectedOutputs",
             };
}

@end

@implementation AWSMediaconvertDashIsoEncryptionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"playbackDeviceCompatibility" : @"PlaybackDeviceCompatibility",
             @"spekeKeyProvider" : @"SpekeKeyProvider",
             };
}

+ (NSValueTransformer *)playbackDeviceCompatibilityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CENC_V1"] == NSOrderedSame) {
            return @(AWSMediaconvertDashIsoPlaybackDeviceCompatibilityCencV1);
        }
        if ([value caseInsensitiveCompare:@"UNENCRYPTED_SEI"] == NSOrderedSame) {
            return @(AWSMediaconvertDashIsoPlaybackDeviceCompatibilityUnencryptedSei);
        }
        return @(AWSMediaconvertDashIsoPlaybackDeviceCompatibilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDashIsoPlaybackDeviceCompatibilityCencV1:
                return @"CENC_V1";
            case AWSMediaconvertDashIsoPlaybackDeviceCompatibilityUnencryptedSei:
                return @"UNENCRYPTED_SEI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertSpekeKeyProvider class]];
}

@end

@implementation AWSMediaconvertDashIsoGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalManifests" : @"AdditionalManifests",
             @"baseUrl" : @"BaseUrl",
             @"destination" : @"Destination",
             @"destinationSettings" : @"DestinationSettings",
             @"encryption" : @"Encryption",
             @"fragmentLength" : @"FragmentLength",
             @"hbbtvCompliance" : @"HbbtvCompliance",
             @"minBufferTime" : @"MinBufferTime",
             @"mpdProfile" : @"MpdProfile",
             @"segmentControl" : @"SegmentControl",
             @"segmentLength" : @"SegmentLength",
             @"writeSegmentTimelineInRepresentation" : @"WriteSegmentTimelineInRepresentation",
             };
}

+ (NSValueTransformer *)additionalManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertDashAdditionalManifest class]];
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDestinationSettings class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDashIsoEncryptionSettings class]];
}

+ (NSValueTransformer *)hbbtvComplianceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HBBTV_1_5"] == NSOrderedSame) {
            return @(AWSMediaconvertDashIsoHbbtvComplianceHbbtv15);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertDashIsoHbbtvComplianceNone);
        }
        return @(AWSMediaconvertDashIsoHbbtvComplianceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDashIsoHbbtvComplianceHbbtv15:
                return @"HBBTV_1_5";
            case AWSMediaconvertDashIsoHbbtvComplianceNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mpdProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAIN_PROFILE"] == NSOrderedSame) {
            return @(AWSMediaconvertDashIsoMpdProfileMainProfile);
        }
        if ([value caseInsensitiveCompare:@"ON_DEMAND_PROFILE"] == NSOrderedSame) {
            return @(AWSMediaconvertDashIsoMpdProfileOnDemandProfile);
        }
        return @(AWSMediaconvertDashIsoMpdProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDashIsoMpdProfileMainProfile:
                return @"MAIN_PROFILE";
            case AWSMediaconvertDashIsoMpdProfileOnDemandProfile:
                return @"ON_DEMAND_PROFILE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_FILE"] == NSOrderedSame) {
            return @(AWSMediaconvertDashIsoSegmentControlSingleFile);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTED_FILES"] == NSOrderedSame) {
            return @(AWSMediaconvertDashIsoSegmentControlSegmentedFiles);
        }
        return @(AWSMediaconvertDashIsoSegmentControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDashIsoSegmentControlSingleFile:
                return @"SINGLE_FILE";
            case AWSMediaconvertDashIsoSegmentControlSegmentedFiles:
                return @"SEGMENTED_FILES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)writeSegmentTimelineInRepresentationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertDashIsoWriteSegmentTimelineInRepresentationEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertDashIsoWriteSegmentTimelineInRepresentationDisabled);
        }
        return @(AWSMediaconvertDashIsoWriteSegmentTimelineInRepresentationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDashIsoWriteSegmentTimelineInRepresentationEnabled:
                return @"ENABLED";
            case AWSMediaconvertDashIsoWriteSegmentTimelineInRepresentationDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertDeinterlacer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithm" : @"Algorithm",
             @"control" : @"Control",
             @"mode" : @"Mode",
             };
}

+ (NSValueTransformer *)algorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERPOLATE"] == NSOrderedSame) {
            return @(AWSMediaconvertDeinterlaceAlgorithmInterpolate);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE_TICKER"] == NSOrderedSame) {
            return @(AWSMediaconvertDeinterlaceAlgorithmInterpolateTicker);
        }
        if ([value caseInsensitiveCompare:@"BLEND"] == NSOrderedSame) {
            return @(AWSMediaconvertDeinterlaceAlgorithmBlend);
        }
        if ([value caseInsensitiveCompare:@"BLEND_TICKER"] == NSOrderedSame) {
            return @(AWSMediaconvertDeinterlaceAlgorithmBlendTicker);
        }
        return @(AWSMediaconvertDeinterlaceAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDeinterlaceAlgorithmInterpolate:
                return @"INTERPOLATE";
            case AWSMediaconvertDeinterlaceAlgorithmInterpolateTicker:
                return @"INTERPOLATE_TICKER";
            case AWSMediaconvertDeinterlaceAlgorithmBlend:
                return @"BLEND";
            case AWSMediaconvertDeinterlaceAlgorithmBlendTicker:
                return @"BLEND_TICKER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)controlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FORCE_ALL_FRAMES"] == NSOrderedSame) {
            return @(AWSMediaconvertDeinterlacerControlForceAllFrames);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSMediaconvertDeinterlacerControlNormal);
        }
        return @(AWSMediaconvertDeinterlacerControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDeinterlacerControlForceAllFrames:
                return @"FORCE_ALL_FRAMES";
            case AWSMediaconvertDeinterlacerControlNormal:
                return @"NORMAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEINTERLACE"] == NSOrderedSame) {
            return @(AWSMediaconvertDeinterlacerModeDeinterlace);
        }
        if ([value caseInsensitiveCompare:@"INVERSE_TELECINE"] == NSOrderedSame) {
            return @(AWSMediaconvertDeinterlacerModeInverseTelecine);
        }
        if ([value caseInsensitiveCompare:@"ADAPTIVE"] == NSOrderedSame) {
            return @(AWSMediaconvertDeinterlacerModeAdaptive);
        }
        return @(AWSMediaconvertDeinterlacerModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDeinterlacerModeDeinterlace:
                return @"DEINTERLACE";
            case AWSMediaconvertDeinterlacerModeInverseTelecine:
                return @"INVERSE_TELECINE";
            case AWSMediaconvertDeinterlacerModeAdaptive:
                return @"ADAPTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertDeleteJobTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSMediaconvertDeleteJobTemplateResponse

@end

@implementation AWSMediaconvertDeletePresetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSMediaconvertDeletePresetResponse

@end

@implementation AWSMediaconvertDeleteQueueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSMediaconvertDeleteQueueResponse

@end

@implementation AWSMediaconvertDescribeEndpointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"mode" : @"Mode",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSMediaconvertDescribeEndpointsModeDefault);
        }
        if ([value caseInsensitiveCompare:@"GET_ONLY"] == NSOrderedSame) {
            return @(AWSMediaconvertDescribeEndpointsModeGetOnly);
        }
        return @(AWSMediaconvertDescribeEndpointsModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDescribeEndpointsModeDefault:
                return @"DEFAULT";
            case AWSMediaconvertDescribeEndpointsModeGetOnly:
                return @"GET_ONLY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertDescribeEndpointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoints" : @"Endpoints",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)endpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertEndpoint class]];
}

@end

@implementation AWSMediaconvertDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Settings" : @"S3Settings",
             };
}

+ (NSValueTransformer *)s3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertS3DestinationSettings class]];
}

@end

@implementation AWSMediaconvertDisassociateCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSMediaconvertDisassociateCertificateResponse

@end

@implementation AWSMediaconvertDolbyVision

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"l6Metadata" : @"L6Metadata",
             @"l6Mode" : @"L6Mode",
             @"profile" : @"Profile",
             };
}

+ (NSValueTransformer *)l6MetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDolbyVisionLevel6Metadata class]];
}

+ (NSValueTransformer *)l6ModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMediaconvertDolbyVisionLevel6ModePassthrough);
        }
        if ([value caseInsensitiveCompare:@"RECALCULATE"] == NSOrderedSame) {
            return @(AWSMediaconvertDolbyVisionLevel6ModeRecalculate);
        }
        if ([value caseInsensitiveCompare:@"SPECIFY"] == NSOrderedSame) {
            return @(AWSMediaconvertDolbyVisionLevel6ModeSpecify);
        }
        return @(AWSMediaconvertDolbyVisionLevel6ModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDolbyVisionLevel6ModePassthrough:
                return @"PASSTHROUGH";
            case AWSMediaconvertDolbyVisionLevel6ModeRecalculate:
                return @"RECALCULATE";
            case AWSMediaconvertDolbyVisionLevel6ModeSpecify:
                return @"SPECIFY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROFILE_5"] == NSOrderedSame) {
            return @(AWSMediaconvertDolbyVisionProfileProfile5);
        }
        return @(AWSMediaconvertDolbyVisionProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDolbyVisionProfileProfile5:
                return @"PROFILE_5";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertDolbyVisionLevel6Metadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxCll" : @"MaxCll",
             @"maxFall" : @"MaxFall",
             };
}

@end

@implementation AWSMediaconvertDvbNitSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkId" : @"NetworkId",
             @"networkName" : @"NetworkName",
             @"nitInterval" : @"NitInterval",
             };
}

@end

@implementation AWSMediaconvertDvbSdtSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputSdt" : @"OutputSdt",
             @"sdtInterval" : @"SdtInterval",
             @"serviceName" : @"ServiceName",
             @"serviceProviderName" : @"ServiceProviderName",
             };
}

+ (NSValueTransformer *)outputSdtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SDT_FOLLOW"] == NSOrderedSame) {
            return @(AWSMediaconvertOutputSdtSdtFollow);
        }
        if ([value caseInsensitiveCompare:@"SDT_FOLLOW_IF_PRESENT"] == NSOrderedSame) {
            return @(AWSMediaconvertOutputSdtSdtFollowIfPresent);
        }
        if ([value caseInsensitiveCompare:@"SDT_MANUAL"] == NSOrderedSame) {
            return @(AWSMediaconvertOutputSdtSdtManual);
        }
        if ([value caseInsensitiveCompare:@"SDT_NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertOutputSdtSdtNone);
        }
        return @(AWSMediaconvertOutputSdtUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertOutputSdtSdtFollow:
                return @"SDT_FOLLOW";
            case AWSMediaconvertOutputSdtSdtFollowIfPresent:
                return @"SDT_FOLLOW_IF_PRESENT";
            case AWSMediaconvertOutputSdtSdtManual:
                return @"SDT_MANUAL";
            case AWSMediaconvertOutputSdtSdtNone:
                return @"SDT_NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertDvbSubDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alignment" : @"Alignment",
             @"backgroundColor" : @"BackgroundColor",
             @"backgroundOpacity" : @"BackgroundOpacity",
             @"fontColor" : @"FontColor",
             @"fontOpacity" : @"FontOpacity",
             @"fontResolution" : @"FontResolution",
             @"fontScript" : @"FontScript",
             @"fontSize" : @"FontSize",
             @"outlineColor" : @"OutlineColor",
             @"outlineSize" : @"OutlineSize",
             @"shadowColor" : @"ShadowColor",
             @"shadowOpacity" : @"ShadowOpacity",
             @"shadowXOffset" : @"ShadowXOffset",
             @"shadowYOffset" : @"ShadowYOffset",
             @"subtitlingType" : @"SubtitlingType",
             @"teletextSpacing" : @"TeletextSpacing",
             @"XPosition" : @"XPosition",
             @"YPosition" : @"YPosition",
             };
}

+ (NSValueTransformer *)alignmentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CENTERED"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleAlignmentCentered);
        }
        if ([value caseInsensitiveCompare:@"LEFT"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleAlignmentLeft);
        }
        return @(AWSMediaconvertDvbSubtitleAlignmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDvbSubtitleAlignmentCentered:
                return @"CENTERED";
            case AWSMediaconvertDvbSubtitleAlignmentLeft:
                return @"LEFT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)backgroundColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleBackgroundColorNone);
        }
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleBackgroundColorBlack);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleBackgroundColorWhite);
        }
        return @(AWSMediaconvertDvbSubtitleBackgroundColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDvbSubtitleBackgroundColorNone:
                return @"NONE";
            case AWSMediaconvertDvbSubtitleBackgroundColorBlack:
                return @"BLACK";
            case AWSMediaconvertDvbSubtitleBackgroundColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fontColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleFontColorWhite);
        }
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleFontColorBlack);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleFontColorYellow);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleFontColorRed);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleFontColorGreen);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleFontColorBlue);
        }
        return @(AWSMediaconvertDvbSubtitleFontColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDvbSubtitleFontColorWhite:
                return @"WHITE";
            case AWSMediaconvertDvbSubtitleFontColorBlack:
                return @"BLACK";
            case AWSMediaconvertDvbSubtitleFontColorYellow:
                return @"YELLOW";
            case AWSMediaconvertDvbSubtitleFontColorRed:
                return @"RED";
            case AWSMediaconvertDvbSubtitleFontColorGreen:
                return @"GREEN";
            case AWSMediaconvertDvbSubtitleFontColorBlue:
                return @"BLUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fontScriptJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTOMATIC"] == NSOrderedSame) {
            return @(AWSMediaconvertFontScriptAutomatic);
        }
        if ([value caseInsensitiveCompare:@"HANS"] == NSOrderedSame) {
            return @(AWSMediaconvertFontScriptHans);
        }
        if ([value caseInsensitiveCompare:@"HANT"] == NSOrderedSame) {
            return @(AWSMediaconvertFontScriptHant);
        }
        return @(AWSMediaconvertFontScriptUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertFontScriptAutomatic:
                return @"AUTOMATIC";
            case AWSMediaconvertFontScriptHans:
                return @"HANS";
            case AWSMediaconvertFontScriptHant:
                return @"HANT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outlineColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleOutlineColorBlack);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleOutlineColorWhite);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleOutlineColorYellow);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleOutlineColorRed);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleOutlineColorGreen);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleOutlineColorBlue);
        }
        return @(AWSMediaconvertDvbSubtitleOutlineColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDvbSubtitleOutlineColorBlack:
                return @"BLACK";
            case AWSMediaconvertDvbSubtitleOutlineColorWhite:
                return @"WHITE";
            case AWSMediaconvertDvbSubtitleOutlineColorYellow:
                return @"YELLOW";
            case AWSMediaconvertDvbSubtitleOutlineColorRed:
                return @"RED";
            case AWSMediaconvertDvbSubtitleOutlineColorGreen:
                return @"GREEN";
            case AWSMediaconvertDvbSubtitleOutlineColorBlue:
                return @"BLUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)shadowColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleShadowColorNone);
        }
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleShadowColorBlack);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleShadowColorWhite);
        }
        return @(AWSMediaconvertDvbSubtitleShadowColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDvbSubtitleShadowColorNone:
                return @"NONE";
            case AWSMediaconvertDvbSubtitleShadowColorBlack:
                return @"BLACK";
            case AWSMediaconvertDvbSubtitleShadowColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)subtitlingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HEARING_IMPAIRED"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitlingTypeHearingImpaired);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitlingTypeStandard);
        }
        return @(AWSMediaconvertDvbSubtitlingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDvbSubtitlingTypeHearingImpaired:
                return @"HEARING_IMPAIRED";
            case AWSMediaconvertDvbSubtitlingTypeStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)teletextSpacingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIXED_GRID"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleTeletextSpacingFixedGrid);
        }
        if ([value caseInsensitiveCompare:@"PROPORTIONAL"] == NSOrderedSame) {
            return @(AWSMediaconvertDvbSubtitleTeletextSpacingProportional);
        }
        return @(AWSMediaconvertDvbSubtitleTeletextSpacingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDvbSubtitleTeletextSpacingFixedGrid:
                return @"FIXED_GRID";
            case AWSMediaconvertDvbSubtitleTeletextSpacingProportional:
                return @"PROPORTIONAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertDvbSubSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pid" : @"Pid",
             };
}

@end

@implementation AWSMediaconvertDvbTdtSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tdtInterval" : @"TdtInterval",
             };
}

@end

@implementation AWSMediaconvertEac3AtmosSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitrate" : @"Bitrate",
             @"bitstreamMode" : @"BitstreamMode",
             @"codingMode" : @"CodingMode",
             @"dialogueIntelligence" : @"DialogueIntelligence",
             @"dynamicRangeCompressionLine" : @"DynamicRangeCompressionLine",
             @"dynamicRangeCompressionRf" : @"DynamicRangeCompressionRf",
             @"loRoCenterMixLevel" : @"LoRoCenterMixLevel",
             @"loRoSurroundMixLevel" : @"LoRoSurroundMixLevel",
             @"ltRtCenterMixLevel" : @"LtRtCenterMixLevel",
             @"ltRtSurroundMixLevel" : @"LtRtSurroundMixLevel",
             @"meteringMode" : @"MeteringMode",
             @"sampleRate" : @"SampleRate",
             @"speechThreshold" : @"SpeechThreshold",
             @"stereoDownmix" : @"StereoDownmix",
             @"surroundExMode" : @"SurroundExMode",
             };
}

+ (NSValueTransformer *)bitstreamModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETE_MAIN"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosBitstreamModeCompleteMain);
        }
        return @(AWSMediaconvertEac3AtmosBitstreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3AtmosBitstreamModeCompleteMain:
                return @"COMPLETE_MAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODING_MODE_9_1_6"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosCodingModeCodingMode916);
        }
        return @(AWSMediaconvertEac3AtmosCodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3AtmosCodingModeCodingMode916:
                return @"CODING_MODE_9_1_6";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dialogueIntelligenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDialogueIntelligenceEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDialogueIntelligenceDisabled);
        }
        return @(AWSMediaconvertEac3AtmosDialogueIntelligenceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3AtmosDialogueIntelligenceEnabled:
                return @"ENABLED";
            case AWSMediaconvertEac3AtmosDialogueIntelligenceDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicRangeCompressionLineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionLineNone);
        }
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionLineFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"FILM_LIGHT"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionLineFilmLight);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_STANDARD"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionLineMusicStandard);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_LIGHT"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionLineMusicLight);
        }
        if ([value caseInsensitiveCompare:@"SPEECH"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionLineSpeech);
        }
        return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionLineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3AtmosDynamicRangeCompressionLineNone:
                return @"NONE";
            case AWSMediaconvertEac3AtmosDynamicRangeCompressionLineFilmStandard:
                return @"FILM_STANDARD";
            case AWSMediaconvertEac3AtmosDynamicRangeCompressionLineFilmLight:
                return @"FILM_LIGHT";
            case AWSMediaconvertEac3AtmosDynamicRangeCompressionLineMusicStandard:
                return @"MUSIC_STANDARD";
            case AWSMediaconvertEac3AtmosDynamicRangeCompressionLineMusicLight:
                return @"MUSIC_LIGHT";
            case AWSMediaconvertEac3AtmosDynamicRangeCompressionLineSpeech:
                return @"SPEECH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicRangeCompressionRfJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionRfNone);
        }
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionRfFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"FILM_LIGHT"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionRfFilmLight);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_STANDARD"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionRfMusicStandard);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_LIGHT"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionRfMusicLight);
        }
        if ([value caseInsensitiveCompare:@"SPEECH"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionRfSpeech);
        }
        return @(AWSMediaconvertEac3AtmosDynamicRangeCompressionRfUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3AtmosDynamicRangeCompressionRfNone:
                return @"NONE";
            case AWSMediaconvertEac3AtmosDynamicRangeCompressionRfFilmStandard:
                return @"FILM_STANDARD";
            case AWSMediaconvertEac3AtmosDynamicRangeCompressionRfFilmLight:
                return @"FILM_LIGHT";
            case AWSMediaconvertEac3AtmosDynamicRangeCompressionRfMusicStandard:
                return @"MUSIC_STANDARD";
            case AWSMediaconvertEac3AtmosDynamicRangeCompressionRfMusicLight:
                return @"MUSIC_LIGHT";
            case AWSMediaconvertEac3AtmosDynamicRangeCompressionRfSpeech:
                return @"SPEECH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)meteringModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LEQ_A"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosMeteringModeLeqA);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_1"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosMeteringModeItuBs17701);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_2"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosMeteringModeItuBs17702);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_3"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosMeteringModeItuBs17703);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_4"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosMeteringModeItuBs17704);
        }
        return @(AWSMediaconvertEac3AtmosMeteringModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3AtmosMeteringModeLeqA:
                return @"LEQ_A";
            case AWSMediaconvertEac3AtmosMeteringModeItuBs17701:
                return @"ITU_BS_1770_1";
            case AWSMediaconvertEac3AtmosMeteringModeItuBs17702:
                return @"ITU_BS_1770_2";
            case AWSMediaconvertEac3AtmosMeteringModeItuBs17703:
                return @"ITU_BS_1770_3";
            case AWSMediaconvertEac3AtmosMeteringModeItuBs17704:
                return @"ITU_BS_1770_4";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stereoDownmixJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosStereoDownmixNotIndicated);
        }
        if ([value caseInsensitiveCompare:@"STEREO"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosStereoDownmixStereo);
        }
        if ([value caseInsensitiveCompare:@"SURROUND"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosStereoDownmixSurround);
        }
        if ([value caseInsensitiveCompare:@"DPL2"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosStereoDownmixDpl2);
        }
        return @(AWSMediaconvertEac3AtmosStereoDownmixUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3AtmosStereoDownmixNotIndicated:
                return @"NOT_INDICATED";
            case AWSMediaconvertEac3AtmosStereoDownmixStereo:
                return @"STEREO";
            case AWSMediaconvertEac3AtmosStereoDownmixSurround:
                return @"SURROUND";
            case AWSMediaconvertEac3AtmosStereoDownmixDpl2:
                return @"DPL2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)surroundExModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosSurroundExModeNotIndicated);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosSurroundExModeEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AtmosSurroundExModeDisabled);
        }
        return @(AWSMediaconvertEac3AtmosSurroundExModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3AtmosSurroundExModeNotIndicated:
                return @"NOT_INDICATED";
            case AWSMediaconvertEac3AtmosSurroundExModeEnabled:
                return @"ENABLED";
            case AWSMediaconvertEac3AtmosSurroundExModeDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertEac3Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attenuationControl" : @"AttenuationControl",
             @"bitrate" : @"Bitrate",
             @"bitstreamMode" : @"BitstreamMode",
             @"codingMode" : @"CodingMode",
             @"dcFilter" : @"DcFilter",
             @"dialnorm" : @"Dialnorm",
             @"dynamicRangeCompressionLine" : @"DynamicRangeCompressionLine",
             @"dynamicRangeCompressionRf" : @"DynamicRangeCompressionRf",
             @"lfeControl" : @"LfeControl",
             @"lfeFilter" : @"LfeFilter",
             @"loRoCenterMixLevel" : @"LoRoCenterMixLevel",
             @"loRoSurroundMixLevel" : @"LoRoSurroundMixLevel",
             @"ltRtCenterMixLevel" : @"LtRtCenterMixLevel",
             @"ltRtSurroundMixLevel" : @"LtRtSurroundMixLevel",
             @"metadataControl" : @"MetadataControl",
             @"passthroughControl" : @"PassthroughControl",
             @"phaseControl" : @"PhaseControl",
             @"sampleRate" : @"SampleRate",
             @"stereoDownmix" : @"StereoDownmix",
             @"surroundExMode" : @"SurroundExMode",
             @"surroundMode" : @"SurroundMode",
             };
}

+ (NSValueTransformer *)attenuationControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ATTENUATE_3_DB"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AttenuationControlAttenuate3Db);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3AttenuationControlNone);
        }
        return @(AWSMediaconvertEac3AttenuationControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3AttenuationControlAttenuate3Db:
                return @"ATTENUATE_3_DB";
            case AWSMediaconvertEac3AttenuationControlNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bitstreamModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETE_MAIN"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3BitstreamModeCompleteMain);
        }
        if ([value caseInsensitiveCompare:@"COMMENTARY"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3BitstreamModeCommentary);
        }
        if ([value caseInsensitiveCompare:@"EMERGENCY"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3BitstreamModeEmergency);
        }
        if ([value caseInsensitiveCompare:@"HEARING_IMPAIRED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3BitstreamModeHearingImpaired);
        }
        if ([value caseInsensitiveCompare:@"VISUALLY_IMPAIRED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3BitstreamModeVisuallyImpaired);
        }
        return @(AWSMediaconvertEac3BitstreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3BitstreamModeCompleteMain:
                return @"COMPLETE_MAIN";
            case AWSMediaconvertEac3BitstreamModeCommentary:
                return @"COMMENTARY";
            case AWSMediaconvertEac3BitstreamModeEmergency:
                return @"EMERGENCY";
            case AWSMediaconvertEac3BitstreamModeHearingImpaired:
                return @"HEARING_IMPAIRED";
            case AWSMediaconvertEac3BitstreamModeVisuallyImpaired:
                return @"VISUALLY_IMPAIRED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_0"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3CodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3CodingModeCodingMode20);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_3_2"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3CodingModeCodingMode32);
        }
        return @(AWSMediaconvertEac3CodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3CodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSMediaconvertEac3CodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            case AWSMediaconvertEac3CodingModeCodingMode32:
                return @"CODING_MODE_3_2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dcFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DcFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DcFilterDisabled);
        }
        return @(AWSMediaconvertEac3DcFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3DcFilterEnabled:
                return @"ENABLED";
            case AWSMediaconvertEac3DcFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicRangeCompressionLineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DynamicRangeCompressionLineNone);
        }
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DynamicRangeCompressionLineFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"FILM_LIGHT"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DynamicRangeCompressionLineFilmLight);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_STANDARD"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DynamicRangeCompressionLineMusicStandard);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_LIGHT"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DynamicRangeCompressionLineMusicLight);
        }
        if ([value caseInsensitiveCompare:@"SPEECH"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DynamicRangeCompressionLineSpeech);
        }
        return @(AWSMediaconvertEac3DynamicRangeCompressionLineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3DynamicRangeCompressionLineNone:
                return @"NONE";
            case AWSMediaconvertEac3DynamicRangeCompressionLineFilmStandard:
                return @"FILM_STANDARD";
            case AWSMediaconvertEac3DynamicRangeCompressionLineFilmLight:
                return @"FILM_LIGHT";
            case AWSMediaconvertEac3DynamicRangeCompressionLineMusicStandard:
                return @"MUSIC_STANDARD";
            case AWSMediaconvertEac3DynamicRangeCompressionLineMusicLight:
                return @"MUSIC_LIGHT";
            case AWSMediaconvertEac3DynamicRangeCompressionLineSpeech:
                return @"SPEECH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicRangeCompressionRfJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DynamicRangeCompressionRfNone);
        }
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DynamicRangeCompressionRfFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"FILM_LIGHT"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DynamicRangeCompressionRfFilmLight);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_STANDARD"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DynamicRangeCompressionRfMusicStandard);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_LIGHT"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DynamicRangeCompressionRfMusicLight);
        }
        if ([value caseInsensitiveCompare:@"SPEECH"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3DynamicRangeCompressionRfSpeech);
        }
        return @(AWSMediaconvertEac3DynamicRangeCompressionRfUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3DynamicRangeCompressionRfNone:
                return @"NONE";
            case AWSMediaconvertEac3DynamicRangeCompressionRfFilmStandard:
                return @"FILM_STANDARD";
            case AWSMediaconvertEac3DynamicRangeCompressionRfFilmLight:
                return @"FILM_LIGHT";
            case AWSMediaconvertEac3DynamicRangeCompressionRfMusicStandard:
                return @"MUSIC_STANDARD";
            case AWSMediaconvertEac3DynamicRangeCompressionRfMusicLight:
                return @"MUSIC_LIGHT";
            case AWSMediaconvertEac3DynamicRangeCompressionRfSpeech:
                return @"SPEECH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lfeControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LFE"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3LfeControlLfe);
        }
        if ([value caseInsensitiveCompare:@"NO_LFE"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3LfeControlNoLfe);
        }
        return @(AWSMediaconvertEac3LfeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3LfeControlLfe:
                return @"LFE";
            case AWSMediaconvertEac3LfeControlNoLfe:
                return @"NO_LFE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lfeFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3LfeFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3LfeFilterDisabled);
        }
        return @(AWSMediaconvertEac3LfeFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3LfeFilterEnabled:
                return @"ENABLED";
            case AWSMediaconvertEac3LfeFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metadataControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3MetadataControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3MetadataControlUseConfigured);
        }
        return @(AWSMediaconvertEac3MetadataControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3MetadataControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSMediaconvertEac3MetadataControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)passthroughControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHEN_POSSIBLE"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3PassthroughControlWhenPossible);
        }
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3PassthroughControlNoPassthrough);
        }
        return @(AWSMediaconvertEac3PassthroughControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3PassthroughControlWhenPossible:
                return @"WHEN_POSSIBLE";
            case AWSMediaconvertEac3PassthroughControlNoPassthrough:
                return @"NO_PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)phaseControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SHIFT_90_DEGREES"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3PhaseControlShift90Degrees);
        }
        if ([value caseInsensitiveCompare:@"NO_SHIFT"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3PhaseControlNoShift);
        }
        return @(AWSMediaconvertEac3PhaseControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3PhaseControlShift90Degrees:
                return @"SHIFT_90_DEGREES";
            case AWSMediaconvertEac3PhaseControlNoShift:
                return @"NO_SHIFT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stereoDownmixJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3StereoDownmixNotIndicated);
        }
        if ([value caseInsensitiveCompare:@"LO_RO"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3StereoDownmixLoRo);
        }
        if ([value caseInsensitiveCompare:@"LT_RT"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3StereoDownmixLtRt);
        }
        if ([value caseInsensitiveCompare:@"DPL2"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3StereoDownmixDpl2);
        }
        return @(AWSMediaconvertEac3StereoDownmixUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3StereoDownmixNotIndicated:
                return @"NOT_INDICATED";
            case AWSMediaconvertEac3StereoDownmixLoRo:
                return @"LO_RO";
            case AWSMediaconvertEac3StereoDownmixLtRt:
                return @"LT_RT";
            case AWSMediaconvertEac3StereoDownmixDpl2:
                return @"DPL2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)surroundExModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3SurroundExModeNotIndicated);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3SurroundExModeEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3SurroundExModeDisabled);
        }
        return @(AWSMediaconvertEac3SurroundExModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3SurroundExModeNotIndicated:
                return @"NOT_INDICATED";
            case AWSMediaconvertEac3SurroundExModeEnabled:
                return @"ENABLED";
            case AWSMediaconvertEac3SurroundExModeDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)surroundModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3SurroundModeNotIndicated);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3SurroundModeEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEac3SurroundModeDisabled);
        }
        return @(AWSMediaconvertEac3SurroundModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEac3SurroundModeNotIndicated:
                return @"NOT_INDICATED";
            case AWSMediaconvertEac3SurroundModeEnabled:
                return @"ENABLED";
            case AWSMediaconvertEac3SurroundModeDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertEmbeddedDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination608ChannelNumber" : @"Destination608ChannelNumber",
             @"destination708ServiceNumber" : @"Destination708ServiceNumber",
             };
}

@end

@implementation AWSMediaconvertEmbeddedSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"convert608To708" : @"Convert608To708",
             @"source608ChannelNumber" : @"Source608ChannelNumber",
             @"source608TrackNumber" : @"Source608TrackNumber",
             @"terminateCaptions" : @"TerminateCaptions",
             };
}

+ (NSValueTransformer *)convert608To708JSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UPCONVERT"] == NSOrderedSame) {
            return @(AWSMediaconvertEmbeddedConvert608To708Upconvert);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEmbeddedConvert608To708Disabled);
        }
        return @(AWSMediaconvertEmbeddedConvert608To708Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEmbeddedConvert608To708Upconvert:
                return @"UPCONVERT";
            case AWSMediaconvertEmbeddedConvert608To708Disabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)terminateCaptionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"END_OF_INPUT"] == NSOrderedSame) {
            return @(AWSMediaconvertEmbeddedTerminateCaptionsEndOfInput);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertEmbeddedTerminateCaptionsDisabled);
        }
        return @(AWSMediaconvertEmbeddedTerminateCaptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertEmbeddedTerminateCaptionsEndOfInput:
                return @"END_OF_INPUT";
            case AWSMediaconvertEmbeddedTerminateCaptionsDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"url" : @"Url",
             };
}

@end

@implementation AWSMediaconvertEsamManifestConfirmConditionNotification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mccXml" : @"MccXml",
             };
}

@end

@implementation AWSMediaconvertEsamSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestConfirmConditionNotification" : @"ManifestConfirmConditionNotification",
             @"responseSignalPreroll" : @"ResponseSignalPreroll",
             @"signalProcessingNotification" : @"SignalProcessingNotification",
             };
}

+ (NSValueTransformer *)manifestConfirmConditionNotificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertEsamManifestConfirmConditionNotification class]];
}

+ (NSValueTransformer *)signalProcessingNotificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertEsamSignalProcessingNotification class]];
}

@end

@implementation AWSMediaconvertEsamSignalProcessingNotification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sccXml" : @"SccXml",
             };
}

@end

@implementation AWSMediaconvertExceptionBody

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSMediaconvertF4vSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"moovPlacement" : @"MoovPlacement",
             };
}

+ (NSValueTransformer *)moovPlacementJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE_DOWNLOAD"] == NSOrderedSame) {
            return @(AWSMediaconvertF4vMoovPlacementProgressiveDownload);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSMediaconvertF4vMoovPlacementNormal);
        }
        return @(AWSMediaconvertF4vMoovPlacementUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertF4vMoovPlacementProgressiveDownload:
                return @"PROGRESSIVE_DOWNLOAD";
            case AWSMediaconvertF4vMoovPlacementNormal:
                return @"NORMAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertFileGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             @"destinationSettings" : @"DestinationSettings",
             };
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDestinationSettings class]];
}

@end

@implementation AWSMediaconvertFileSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"convert608To708" : @"Convert608To708",
             @"framerate" : @"Framerate",
             @"sourceFile" : @"SourceFile",
             @"timeDelta" : @"TimeDelta",
             };
}

+ (NSValueTransformer *)convert608To708JSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UPCONVERT"] == NSOrderedSame) {
            return @(AWSMediaconvertFileSourceConvert608To708Upconvert);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertFileSourceConvert608To708Disabled);
        }
        return @(AWSMediaconvertFileSourceConvert608To708Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertFileSourceConvert608To708Upconvert:
                return @"UPCONVERT";
            case AWSMediaconvertFileSourceConvert608To708Disabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertCaptionSourceFramerate class]];
}

@end

@implementation AWSMediaconvertFrameCaptureSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             @"maxCaptures" : @"MaxCaptures",
             @"quality" : @"Quality",
             };
}

@end

@implementation AWSMediaconvertGetJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSMediaconvertGetJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"job" : @"Job",
             };
}

+ (NSValueTransformer *)jobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertJob class]];
}

@end

@implementation AWSMediaconvertGetJobTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSMediaconvertGetJobTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobTemplate" : @"JobTemplate",
             };
}

+ (NSValueTransformer *)jobTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertJobTemplate class]];
}

@end

@implementation AWSMediaconvertGetPresetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSMediaconvertGetPresetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"preset" : @"Preset",
             };
}

+ (NSValueTransformer *)presetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertPreset class]];
}

@end

@implementation AWSMediaconvertGetQueueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSMediaconvertGetQueueResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queue" : @"Queue",
             };
}

+ (NSValueTransformer *)queueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertQueue class]];
}

@end

@implementation AWSMediaconvertH264QvbrSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxAverageBitrate" : @"MaxAverageBitrate",
             @"qvbrQualityLevel" : @"QvbrQualityLevel",
             @"qvbrQualityLevelFineTune" : @"QvbrQualityLevelFineTune",
             };
}

@end

@implementation AWSMediaconvertH264Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adaptiveQuantization" : @"AdaptiveQuantization",
             @"bitrate" : @"Bitrate",
             @"codecLevel" : @"CodecLevel",
             @"codecProfile" : @"CodecProfile",
             @"dynamicSubGop" : @"DynamicSubGop",
             @"entropyEncoding" : @"EntropyEncoding",
             @"fieldEncoding" : @"FieldEncoding",
             @"flickerAdaptiveQuantization" : @"FlickerAdaptiveQuantization",
             @"framerateControl" : @"FramerateControl",
             @"framerateConversionAlgorithm" : @"FramerateConversionAlgorithm",
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             @"gopBReference" : @"GopBReference",
             @"gopClosedCadence" : @"GopClosedCadence",
             @"gopSize" : @"GopSize",
             @"gopSizeUnits" : @"GopSizeUnits",
             @"hrdBufferInitialFillPercentage" : @"HrdBufferInitialFillPercentage",
             @"hrdBufferSize" : @"HrdBufferSize",
             @"interlaceMode" : @"InterlaceMode",
             @"maxBitrate" : @"MaxBitrate",
             @"minIInterval" : @"MinIInterval",
             @"numberBFramesBetweenReferenceFrames" : @"NumberBFramesBetweenReferenceFrames",
             @"numberReferenceFrames" : @"NumberReferenceFrames",
             @"parControl" : @"ParControl",
             @"parDenominator" : @"ParDenominator",
             @"parNumerator" : @"ParNumerator",
             @"qualityTuningLevel" : @"QualityTuningLevel",
             @"qvbrSettings" : @"QvbrSettings",
             @"rateControlMode" : @"RateControlMode",
             @"repeatPps" : @"RepeatPps",
             @"sceneChangeDetect" : @"SceneChangeDetect",
             @"slices" : @"Slices",
             @"slowPal" : @"SlowPal",
             @"softness" : @"Softness",
             @"spatialAdaptiveQuantization" : @"SpatialAdaptiveQuantization",
             @"syntax" : @"Syntax",
             @"telecine" : @"Telecine",
             @"temporalAdaptiveQuantization" : @"TemporalAdaptiveQuantization",
             @"unregisteredSeiTimecode" : @"UnregisteredSeiTimecode",
             };
}

+ (NSValueTransformer *)adaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSMediaconvertH264AdaptiveQuantizationOff);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSMediaconvertH264AdaptiveQuantizationLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSMediaconvertH264AdaptiveQuantizationMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMediaconvertH264AdaptiveQuantizationHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGHER"] == NSOrderedSame) {
            return @(AWSMediaconvertH264AdaptiveQuantizationHigher);
        }
        if ([value caseInsensitiveCompare:@"MAX"] == NSOrderedSame) {
            return @(AWSMediaconvertH264AdaptiveQuantizationMax);
        }
        return @(AWSMediaconvertH264AdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264AdaptiveQuantizationOff:
                return @"OFF";
            case AWSMediaconvertH264AdaptiveQuantizationLow:
                return @"LOW";
            case AWSMediaconvertH264AdaptiveQuantizationMedium:
                return @"MEDIUM";
            case AWSMediaconvertH264AdaptiveQuantizationHigh:
                return @"HIGH";
            case AWSMediaconvertH264AdaptiveQuantizationHigher:
                return @"HIGHER";
            case AWSMediaconvertH264AdaptiveQuantizationMax:
                return @"MAX";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelAuto);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_1"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel1);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_1_1"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel11);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_1_2"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel12);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_1_3"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel13);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_2"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel2);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_2_1"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel21);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_2_2"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel22);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_3"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel3);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_3_1"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel31);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_3_2"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel32);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_4"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel4);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_4_1"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel41);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_4_2"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel42);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_5"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel5);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_5_1"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel51);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_5_2"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecLevelLevel52);
        }
        return @(AWSMediaconvertH264CodecLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264CodecLevelAuto:
                return @"AUTO";
            case AWSMediaconvertH264CodecLevelLevel1:
                return @"LEVEL_1";
            case AWSMediaconvertH264CodecLevelLevel11:
                return @"LEVEL_1_1";
            case AWSMediaconvertH264CodecLevelLevel12:
                return @"LEVEL_1_2";
            case AWSMediaconvertH264CodecLevelLevel13:
                return @"LEVEL_1_3";
            case AWSMediaconvertH264CodecLevelLevel2:
                return @"LEVEL_2";
            case AWSMediaconvertH264CodecLevelLevel21:
                return @"LEVEL_2_1";
            case AWSMediaconvertH264CodecLevelLevel22:
                return @"LEVEL_2_2";
            case AWSMediaconvertH264CodecLevelLevel3:
                return @"LEVEL_3";
            case AWSMediaconvertH264CodecLevelLevel31:
                return @"LEVEL_3_1";
            case AWSMediaconvertH264CodecLevelLevel32:
                return @"LEVEL_3_2";
            case AWSMediaconvertH264CodecLevelLevel4:
                return @"LEVEL_4";
            case AWSMediaconvertH264CodecLevelLevel41:
                return @"LEVEL_4_1";
            case AWSMediaconvertH264CodecLevelLevel42:
                return @"LEVEL_4_2";
            case AWSMediaconvertH264CodecLevelLevel5:
                return @"LEVEL_5";
            case AWSMediaconvertH264CodecLevelLevel51:
                return @"LEVEL_5_1";
            case AWSMediaconvertH264CodecLevelLevel52:
                return @"LEVEL_5_2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BASELINE"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecProfileBaseline);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecProfileHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGH_10BIT"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecProfileHigh10bit);
        }
        if ([value caseInsensitiveCompare:@"HIGH_422"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecProfileHigh422);
        }
        if ([value caseInsensitiveCompare:@"HIGH_422_10BIT"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecProfileHigh42210bit);
        }
        if ([value caseInsensitiveCompare:@"MAIN"] == NSOrderedSame) {
            return @(AWSMediaconvertH264CodecProfileMain);
        }
        return @(AWSMediaconvertH264CodecProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264CodecProfileBaseline:
                return @"BASELINE";
            case AWSMediaconvertH264CodecProfileHigh:
                return @"HIGH";
            case AWSMediaconvertH264CodecProfileHigh10bit:
                return @"HIGH_10BIT";
            case AWSMediaconvertH264CodecProfileHigh422:
                return @"HIGH_422";
            case AWSMediaconvertH264CodecProfileHigh42210bit:
                return @"HIGH_422_10BIT";
            case AWSMediaconvertH264CodecProfileMain:
                return @"MAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicSubGopJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADAPTIVE"] == NSOrderedSame) {
            return @(AWSMediaconvertH264DynamicSubGopAdaptive);
        }
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSMediaconvertH264DynamicSubGopStatic);
        }
        return @(AWSMediaconvertH264DynamicSubGopUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264DynamicSubGopAdaptive:
                return @"ADAPTIVE";
            case AWSMediaconvertH264DynamicSubGopStatic:
                return @"STATIC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)entropyEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CABAC"] == NSOrderedSame) {
            return @(AWSMediaconvertH264EntropyEncodingCabac);
        }
        if ([value caseInsensitiveCompare:@"CAVLC"] == NSOrderedSame) {
            return @(AWSMediaconvertH264EntropyEncodingCavlc);
        }
        return @(AWSMediaconvertH264EntropyEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264EntropyEncodingCabac:
                return @"CABAC";
            case AWSMediaconvertH264EntropyEncodingCavlc:
                return @"CAVLC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fieldEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PAFF"] == NSOrderedSame) {
            return @(AWSMediaconvertH264FieldEncodingPaff);
        }
        if ([value caseInsensitiveCompare:@"FORCE_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertH264FieldEncodingForceField);
        }
        return @(AWSMediaconvertH264FieldEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264FieldEncodingPaff:
                return @"PAFF";
            case AWSMediaconvertH264FieldEncodingForceField:
                return @"FORCE_FIELD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)flickerAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264FlickerAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264FlickerAdaptiveQuantizationEnabled);
        }
        return @(AWSMediaconvertH264FlickerAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264FlickerAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSMediaconvertH264FlickerAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertH264FramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264FramerateControlSpecified);
        }
        return @(AWSMediaconvertH264FramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264FramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMediaconvertH264FramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateConversionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUPLICATE_DROP"] == NSOrderedSame) {
            return @(AWSMediaconvertH264FramerateConversionAlgorithmDuplicateDrop);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE"] == NSOrderedSame) {
            return @(AWSMediaconvertH264FramerateConversionAlgorithmInterpolate);
        }
        return @(AWSMediaconvertH264FramerateConversionAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264FramerateConversionAlgorithmDuplicateDrop:
                return @"DUPLICATE_DROP";
            case AWSMediaconvertH264FramerateConversionAlgorithmInterpolate:
                return @"INTERPOLATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopBReferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264GopBReferenceDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264GopBReferenceEnabled);
        }
        return @(AWSMediaconvertH264GopBReferenceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264GopBReferenceDisabled:
                return @"DISABLED";
            case AWSMediaconvertH264GopBReferenceEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopSizeUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAMES"] == NSOrderedSame) {
            return @(AWSMediaconvertH264GopSizeUnitsFrames);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSMediaconvertH264GopSizeUnitsSeconds);
        }
        return @(AWSMediaconvertH264GopSizeUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264GopSizeUnitsFrames:
                return @"FRAMES";
            case AWSMediaconvertH264GopSizeUnitsSeconds:
                return @"SECONDS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)interlaceModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE"] == NSOrderedSame) {
            return @(AWSMediaconvertH264InterlaceModeProgressive);
        }
        if ([value caseInsensitiveCompare:@"TOP_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertH264InterlaceModeTopField);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertH264InterlaceModeBottomField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_TOP_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertH264InterlaceModeFollowTopField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertH264InterlaceModeFollowBottomField);
        }
        return @(AWSMediaconvertH264InterlaceModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264InterlaceModeProgressive:
                return @"PROGRESSIVE";
            case AWSMediaconvertH264InterlaceModeTopField:
                return @"TOP_FIELD";
            case AWSMediaconvertH264InterlaceModeBottomField:
                return @"BOTTOM_FIELD";
            case AWSMediaconvertH264InterlaceModeFollowTopField:
                return @"FOLLOW_TOP_FIELD";
            case AWSMediaconvertH264InterlaceModeFollowBottomField:
                return @"FOLLOW_BOTTOM_FIELD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertH264ParControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264ParControlSpecified);
        }
        return @(AWSMediaconvertH264ParControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264ParControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMediaconvertH264ParControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qualityTuningLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_PASS"] == NSOrderedSame) {
            return @(AWSMediaconvertH264QualityTuningLevelSinglePass);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PASS_HQ"] == NSOrderedSame) {
            return @(AWSMediaconvertH264QualityTuningLevelSinglePassHq);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PASS_HQ"] == NSOrderedSame) {
            return @(AWSMediaconvertH264QualityTuningLevelMultiPassHq);
        }
        return @(AWSMediaconvertH264QualityTuningLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264QualityTuningLevelSinglePass:
                return @"SINGLE_PASS";
            case AWSMediaconvertH264QualityTuningLevelSinglePassHq:
                return @"SINGLE_PASS_HQ";
            case AWSMediaconvertH264QualityTuningLevelMultiPassHq:
                return @"MULTI_PASS_HQ";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qvbrSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertH264QvbrSettings class]];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSMediaconvertH264RateControlModeVbr);
        }
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSMediaconvertH264RateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"QVBR"] == NSOrderedSame) {
            return @(AWSMediaconvertH264RateControlModeQvbr);
        }
        return @(AWSMediaconvertH264RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264RateControlModeVbr:
                return @"VBR";
            case AWSMediaconvertH264RateControlModeCbr:
                return @"CBR";
            case AWSMediaconvertH264RateControlModeQvbr:
                return @"QVBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)repeatPpsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264RepeatPpsDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264RepeatPpsEnabled);
        }
        return @(AWSMediaconvertH264RepeatPpsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264RepeatPpsDisabled:
                return @"DISABLED";
            case AWSMediaconvertH264RepeatPpsEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sceneChangeDetectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264SceneChangeDetectDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264SceneChangeDetectEnabled);
        }
        if ([value caseInsensitiveCompare:@"TRANSITION_DETECTION"] == NSOrderedSame) {
            return @(AWSMediaconvertH264SceneChangeDetectTransitionDetection);
        }
        return @(AWSMediaconvertH264SceneChangeDetectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264SceneChangeDetectDisabled:
                return @"DISABLED";
            case AWSMediaconvertH264SceneChangeDetectEnabled:
                return @"ENABLED";
            case AWSMediaconvertH264SceneChangeDetectTransitionDetection:
                return @"TRANSITION_DETECTION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)slowPalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264SlowPalDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264SlowPalEnabled);
        }
        return @(AWSMediaconvertH264SlowPalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264SlowPalDisabled:
                return @"DISABLED";
            case AWSMediaconvertH264SlowPalEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spatialAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264SpatialAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264SpatialAdaptiveQuantizationEnabled);
        }
        return @(AWSMediaconvertH264SpatialAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264SpatialAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSMediaconvertH264SpatialAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)syntaxJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSMediaconvertH264SyntaxDefault);
        }
        if ([value caseInsensitiveCompare:@"RP2027"] == NSOrderedSame) {
            return @(AWSMediaconvertH264SyntaxRp2027);
        }
        return @(AWSMediaconvertH264SyntaxUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264SyntaxDefault:
                return @"DEFAULT";
            case AWSMediaconvertH264SyntaxRp2027:
                return @"RP2027";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)telecineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertH264TelecineNone);
        }
        if ([value caseInsensitiveCompare:@"SOFT"] == NSOrderedSame) {
            return @(AWSMediaconvertH264TelecineSoft);
        }
        if ([value caseInsensitiveCompare:@"HARD"] == NSOrderedSame) {
            return @(AWSMediaconvertH264TelecineHard);
        }
        return @(AWSMediaconvertH264TelecineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264TelecineNone:
                return @"NONE";
            case AWSMediaconvertH264TelecineSoft:
                return @"SOFT";
            case AWSMediaconvertH264TelecineHard:
                return @"HARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)temporalAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264TemporalAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264TemporalAdaptiveQuantizationEnabled);
        }
        return @(AWSMediaconvertH264TemporalAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264TemporalAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSMediaconvertH264TemporalAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unregisteredSeiTimecodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264UnregisteredSeiTimecodeDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH264UnregisteredSeiTimecodeEnabled);
        }
        return @(AWSMediaconvertH264UnregisteredSeiTimecodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH264UnregisteredSeiTimecodeDisabled:
                return @"DISABLED";
            case AWSMediaconvertH264UnregisteredSeiTimecodeEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertH265QvbrSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxAverageBitrate" : @"MaxAverageBitrate",
             @"qvbrQualityLevel" : @"QvbrQualityLevel",
             @"qvbrQualityLevelFineTune" : @"QvbrQualityLevelFineTune",
             };
}

@end

@implementation AWSMediaconvertH265Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adaptiveQuantization" : @"AdaptiveQuantization",
             @"alternateTransferFunctionSei" : @"AlternateTransferFunctionSei",
             @"bitrate" : @"Bitrate",
             @"codecLevel" : @"CodecLevel",
             @"codecProfile" : @"CodecProfile",
             @"dynamicSubGop" : @"DynamicSubGop",
             @"flickerAdaptiveQuantization" : @"FlickerAdaptiveQuantization",
             @"framerateControl" : @"FramerateControl",
             @"framerateConversionAlgorithm" : @"FramerateConversionAlgorithm",
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             @"gopBReference" : @"GopBReference",
             @"gopClosedCadence" : @"GopClosedCadence",
             @"gopSize" : @"GopSize",
             @"gopSizeUnits" : @"GopSizeUnits",
             @"hrdBufferInitialFillPercentage" : @"HrdBufferInitialFillPercentage",
             @"hrdBufferSize" : @"HrdBufferSize",
             @"interlaceMode" : @"InterlaceMode",
             @"maxBitrate" : @"MaxBitrate",
             @"minIInterval" : @"MinIInterval",
             @"numberBFramesBetweenReferenceFrames" : @"NumberBFramesBetweenReferenceFrames",
             @"numberReferenceFrames" : @"NumberReferenceFrames",
             @"parControl" : @"ParControl",
             @"parDenominator" : @"ParDenominator",
             @"parNumerator" : @"ParNumerator",
             @"qualityTuningLevel" : @"QualityTuningLevel",
             @"qvbrSettings" : @"QvbrSettings",
             @"rateControlMode" : @"RateControlMode",
             @"sampleAdaptiveOffsetFilterMode" : @"SampleAdaptiveOffsetFilterMode",
             @"sceneChangeDetect" : @"SceneChangeDetect",
             @"slices" : @"Slices",
             @"slowPal" : @"SlowPal",
             @"spatialAdaptiveQuantization" : @"SpatialAdaptiveQuantization",
             @"telecine" : @"Telecine",
             @"temporalAdaptiveQuantization" : @"TemporalAdaptiveQuantization",
             @"temporalIds" : @"TemporalIds",
             @"tiles" : @"Tiles",
             @"unregisteredSeiTimecode" : @"UnregisteredSeiTimecode",
             @"writeMp4PackagingType" : @"WriteMp4PackagingType",
             };
}

+ (NSValueTransformer *)adaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSMediaconvertH265AdaptiveQuantizationOff);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSMediaconvertH265AdaptiveQuantizationLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSMediaconvertH265AdaptiveQuantizationMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMediaconvertH265AdaptiveQuantizationHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGHER"] == NSOrderedSame) {
            return @(AWSMediaconvertH265AdaptiveQuantizationHigher);
        }
        if ([value caseInsensitiveCompare:@"MAX"] == NSOrderedSame) {
            return @(AWSMediaconvertH265AdaptiveQuantizationMax);
        }
        return @(AWSMediaconvertH265AdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265AdaptiveQuantizationOff:
                return @"OFF";
            case AWSMediaconvertH265AdaptiveQuantizationLow:
                return @"LOW";
            case AWSMediaconvertH265AdaptiveQuantizationMedium:
                return @"MEDIUM";
            case AWSMediaconvertH265AdaptiveQuantizationHigh:
                return @"HIGH";
            case AWSMediaconvertH265AdaptiveQuantizationHigher:
                return @"HIGHER";
            case AWSMediaconvertH265AdaptiveQuantizationMax:
                return @"MAX";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)alternateTransferFunctionSeiJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265AlternateTransferFunctionSeiDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265AlternateTransferFunctionSeiEnabled);
        }
        return @(AWSMediaconvertH265AlternateTransferFunctionSeiUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265AlternateTransferFunctionSeiDisabled:
                return @"DISABLED";
            case AWSMediaconvertH265AlternateTransferFunctionSeiEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelAuto);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_1"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelLevel1);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_2"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelLevel2);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_2_1"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelLevel21);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_3"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelLevel3);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_3_1"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelLevel31);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_4"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelLevel4);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_4_1"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelLevel41);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_5"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelLevel5);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_5_1"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelLevel51);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_5_2"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelLevel52);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_6"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelLevel6);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_6_1"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelLevel61);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_6_2"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecLevelLevel62);
        }
        return @(AWSMediaconvertH265CodecLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265CodecLevelAuto:
                return @"AUTO";
            case AWSMediaconvertH265CodecLevelLevel1:
                return @"LEVEL_1";
            case AWSMediaconvertH265CodecLevelLevel2:
                return @"LEVEL_2";
            case AWSMediaconvertH265CodecLevelLevel21:
                return @"LEVEL_2_1";
            case AWSMediaconvertH265CodecLevelLevel3:
                return @"LEVEL_3";
            case AWSMediaconvertH265CodecLevelLevel31:
                return @"LEVEL_3_1";
            case AWSMediaconvertH265CodecLevelLevel4:
                return @"LEVEL_4";
            case AWSMediaconvertH265CodecLevelLevel41:
                return @"LEVEL_4_1";
            case AWSMediaconvertH265CodecLevelLevel5:
                return @"LEVEL_5";
            case AWSMediaconvertH265CodecLevelLevel51:
                return @"LEVEL_5_1";
            case AWSMediaconvertH265CodecLevelLevel52:
                return @"LEVEL_5_2";
            case AWSMediaconvertH265CodecLevelLevel6:
                return @"LEVEL_6";
            case AWSMediaconvertH265CodecLevelLevel61:
                return @"LEVEL_6_1";
            case AWSMediaconvertH265CodecLevelLevel62:
                return @"LEVEL_6_2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAIN_MAIN"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecProfileMainMain);
        }
        if ([value caseInsensitiveCompare:@"MAIN_HIGH"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecProfileMainHigh);
        }
        if ([value caseInsensitiveCompare:@"MAIN10_MAIN"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecProfileMain10Main);
        }
        if ([value caseInsensitiveCompare:@"MAIN10_HIGH"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecProfileMain10High);
        }
        if ([value caseInsensitiveCompare:@"MAIN_422_8BIT_MAIN"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecProfileMain4228bitMain);
        }
        if ([value caseInsensitiveCompare:@"MAIN_422_8BIT_HIGH"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecProfileMain4228bitHigh);
        }
        if ([value caseInsensitiveCompare:@"MAIN_422_10BIT_MAIN"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecProfileMain42210bitMain);
        }
        if ([value caseInsensitiveCompare:@"MAIN_422_10BIT_HIGH"] == NSOrderedSame) {
            return @(AWSMediaconvertH265CodecProfileMain42210bitHigh);
        }
        return @(AWSMediaconvertH265CodecProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265CodecProfileMainMain:
                return @"MAIN_MAIN";
            case AWSMediaconvertH265CodecProfileMainHigh:
                return @"MAIN_HIGH";
            case AWSMediaconvertH265CodecProfileMain10Main:
                return @"MAIN10_MAIN";
            case AWSMediaconvertH265CodecProfileMain10High:
                return @"MAIN10_HIGH";
            case AWSMediaconvertH265CodecProfileMain4228bitMain:
                return @"MAIN_422_8BIT_MAIN";
            case AWSMediaconvertH265CodecProfileMain4228bitHigh:
                return @"MAIN_422_8BIT_HIGH";
            case AWSMediaconvertH265CodecProfileMain42210bitMain:
                return @"MAIN_422_10BIT_MAIN";
            case AWSMediaconvertH265CodecProfileMain42210bitHigh:
                return @"MAIN_422_10BIT_HIGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicSubGopJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADAPTIVE"] == NSOrderedSame) {
            return @(AWSMediaconvertH265DynamicSubGopAdaptive);
        }
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSMediaconvertH265DynamicSubGopStatic);
        }
        return @(AWSMediaconvertH265DynamicSubGopUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265DynamicSubGopAdaptive:
                return @"ADAPTIVE";
            case AWSMediaconvertH265DynamicSubGopStatic:
                return @"STATIC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)flickerAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265FlickerAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265FlickerAdaptiveQuantizationEnabled);
        }
        return @(AWSMediaconvertH265FlickerAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265FlickerAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSMediaconvertH265FlickerAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertH265FramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265FramerateControlSpecified);
        }
        return @(AWSMediaconvertH265FramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265FramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMediaconvertH265FramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateConversionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUPLICATE_DROP"] == NSOrderedSame) {
            return @(AWSMediaconvertH265FramerateConversionAlgorithmDuplicateDrop);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE"] == NSOrderedSame) {
            return @(AWSMediaconvertH265FramerateConversionAlgorithmInterpolate);
        }
        return @(AWSMediaconvertH265FramerateConversionAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265FramerateConversionAlgorithmDuplicateDrop:
                return @"DUPLICATE_DROP";
            case AWSMediaconvertH265FramerateConversionAlgorithmInterpolate:
                return @"INTERPOLATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopBReferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265GopBReferenceDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265GopBReferenceEnabled);
        }
        return @(AWSMediaconvertH265GopBReferenceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265GopBReferenceDisabled:
                return @"DISABLED";
            case AWSMediaconvertH265GopBReferenceEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopSizeUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAMES"] == NSOrderedSame) {
            return @(AWSMediaconvertH265GopSizeUnitsFrames);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSMediaconvertH265GopSizeUnitsSeconds);
        }
        return @(AWSMediaconvertH265GopSizeUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265GopSizeUnitsFrames:
                return @"FRAMES";
            case AWSMediaconvertH265GopSizeUnitsSeconds:
                return @"SECONDS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)interlaceModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE"] == NSOrderedSame) {
            return @(AWSMediaconvertH265InterlaceModeProgressive);
        }
        if ([value caseInsensitiveCompare:@"TOP_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertH265InterlaceModeTopField);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertH265InterlaceModeBottomField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_TOP_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertH265InterlaceModeFollowTopField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertH265InterlaceModeFollowBottomField);
        }
        return @(AWSMediaconvertH265InterlaceModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265InterlaceModeProgressive:
                return @"PROGRESSIVE";
            case AWSMediaconvertH265InterlaceModeTopField:
                return @"TOP_FIELD";
            case AWSMediaconvertH265InterlaceModeBottomField:
                return @"BOTTOM_FIELD";
            case AWSMediaconvertH265InterlaceModeFollowTopField:
                return @"FOLLOW_TOP_FIELD";
            case AWSMediaconvertH265InterlaceModeFollowBottomField:
                return @"FOLLOW_BOTTOM_FIELD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertH265ParControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265ParControlSpecified);
        }
        return @(AWSMediaconvertH265ParControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265ParControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMediaconvertH265ParControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qualityTuningLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_PASS"] == NSOrderedSame) {
            return @(AWSMediaconvertH265QualityTuningLevelSinglePass);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PASS_HQ"] == NSOrderedSame) {
            return @(AWSMediaconvertH265QualityTuningLevelSinglePassHq);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PASS_HQ"] == NSOrderedSame) {
            return @(AWSMediaconvertH265QualityTuningLevelMultiPassHq);
        }
        return @(AWSMediaconvertH265QualityTuningLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265QualityTuningLevelSinglePass:
                return @"SINGLE_PASS";
            case AWSMediaconvertH265QualityTuningLevelSinglePassHq:
                return @"SINGLE_PASS_HQ";
            case AWSMediaconvertH265QualityTuningLevelMultiPassHq:
                return @"MULTI_PASS_HQ";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qvbrSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertH265QvbrSettings class]];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSMediaconvertH265RateControlModeVbr);
        }
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSMediaconvertH265RateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"QVBR"] == NSOrderedSame) {
            return @(AWSMediaconvertH265RateControlModeQvbr);
        }
        return @(AWSMediaconvertH265RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265RateControlModeVbr:
                return @"VBR";
            case AWSMediaconvertH265RateControlModeCbr:
                return @"CBR";
            case AWSMediaconvertH265RateControlModeQvbr:
                return @"QVBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sampleAdaptiveOffsetFilterModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSMediaconvertH265SampleAdaptiveOffsetFilterModeDefault);
        }
        if ([value caseInsensitiveCompare:@"ADAPTIVE"] == NSOrderedSame) {
            return @(AWSMediaconvertH265SampleAdaptiveOffsetFilterModeAdaptive);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSMediaconvertH265SampleAdaptiveOffsetFilterModeOff);
        }
        return @(AWSMediaconvertH265SampleAdaptiveOffsetFilterModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265SampleAdaptiveOffsetFilterModeDefault:
                return @"DEFAULT";
            case AWSMediaconvertH265SampleAdaptiveOffsetFilterModeAdaptive:
                return @"ADAPTIVE";
            case AWSMediaconvertH265SampleAdaptiveOffsetFilterModeOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sceneChangeDetectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265SceneChangeDetectDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265SceneChangeDetectEnabled);
        }
        if ([value caseInsensitiveCompare:@"TRANSITION_DETECTION"] == NSOrderedSame) {
            return @(AWSMediaconvertH265SceneChangeDetectTransitionDetection);
        }
        return @(AWSMediaconvertH265SceneChangeDetectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265SceneChangeDetectDisabled:
                return @"DISABLED";
            case AWSMediaconvertH265SceneChangeDetectEnabled:
                return @"ENABLED";
            case AWSMediaconvertH265SceneChangeDetectTransitionDetection:
                return @"TRANSITION_DETECTION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)slowPalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265SlowPalDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265SlowPalEnabled);
        }
        return @(AWSMediaconvertH265SlowPalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265SlowPalDisabled:
                return @"DISABLED";
            case AWSMediaconvertH265SlowPalEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spatialAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265SpatialAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265SpatialAdaptiveQuantizationEnabled);
        }
        return @(AWSMediaconvertH265SpatialAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265SpatialAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSMediaconvertH265SpatialAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)telecineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertH265TelecineNone);
        }
        if ([value caseInsensitiveCompare:@"SOFT"] == NSOrderedSame) {
            return @(AWSMediaconvertH265TelecineSoft);
        }
        if ([value caseInsensitiveCompare:@"HARD"] == NSOrderedSame) {
            return @(AWSMediaconvertH265TelecineHard);
        }
        return @(AWSMediaconvertH265TelecineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265TelecineNone:
                return @"NONE";
            case AWSMediaconvertH265TelecineSoft:
                return @"SOFT";
            case AWSMediaconvertH265TelecineHard:
                return @"HARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)temporalAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265TemporalAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265TemporalAdaptiveQuantizationEnabled);
        }
        return @(AWSMediaconvertH265TemporalAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265TemporalAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSMediaconvertH265TemporalAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)temporalIdsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265TemporalIdsDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265TemporalIdsEnabled);
        }
        return @(AWSMediaconvertH265TemporalIdsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265TemporalIdsDisabled:
                return @"DISABLED";
            case AWSMediaconvertH265TemporalIdsEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tilesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265TilesDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265TilesEnabled);
        }
        return @(AWSMediaconvertH265TilesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265TilesDisabled:
                return @"DISABLED";
            case AWSMediaconvertH265TilesEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unregisteredSeiTimecodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265UnregisteredSeiTimecodeDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertH265UnregisteredSeiTimecodeEnabled);
        }
        return @(AWSMediaconvertH265UnregisteredSeiTimecodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265UnregisteredSeiTimecodeDisabled:
                return @"DISABLED";
            case AWSMediaconvertH265UnregisteredSeiTimecodeEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)writeMp4PackagingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HVC1"] == NSOrderedSame) {
            return @(AWSMediaconvertH265WriteMp4PackagingTypeHvc1);
        }
        if ([value caseInsensitiveCompare:@"HEV1"] == NSOrderedSame) {
            return @(AWSMediaconvertH265WriteMp4PackagingTypeHev1);
        }
        return @(AWSMediaconvertH265WriteMp4PackagingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertH265WriteMp4PackagingTypeHvc1:
                return @"HVC1";
            case AWSMediaconvertH265WriteMp4PackagingTypeHev1:
                return @"HEV1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertHdr10Metadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bluePrimaryX" : @"BluePrimaryX",
             @"bluePrimaryY" : @"BluePrimaryY",
             @"greenPrimaryX" : @"GreenPrimaryX",
             @"greenPrimaryY" : @"GreenPrimaryY",
             @"maxContentLightLevel" : @"MaxContentLightLevel",
             @"maxFrameAverageLightLevel" : @"MaxFrameAverageLightLevel",
             @"maxLuminance" : @"MaxLuminance",
             @"minLuminance" : @"MinLuminance",
             @"redPrimaryX" : @"RedPrimaryX",
             @"redPrimaryY" : @"RedPrimaryY",
             @"whitePointX" : @"WhitePointX",
             @"whitePointY" : @"WhitePointY",
             };
}

@end

@implementation AWSMediaconvertHlsAdditionalManifest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestNameModifier" : @"ManifestNameModifier",
             @"selectedOutputs" : @"SelectedOutputs",
             };
}

@end

@implementation AWSMediaconvertHlsCaptionLanguageMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captionChannel" : @"CaptionChannel",
             @"customLanguageCode" : @"CustomLanguageCode",
             @"languageCode" : @"LanguageCode",
             @"languageDescription" : @"LanguageDescription",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEng);
        }
        if ([value caseInsensitiveCompare:@"SPA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSpa);
        }
        if ([value caseInsensitiveCompare:@"FRA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFra);
        }
        if ([value caseInsensitiveCompare:@"DEU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDeu);
        }
        if ([value caseInsensitiveCompare:@"GER"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGer);
        }
        if ([value caseInsensitiveCompare:@"ZHO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZho);
        }
        if ([value caseInsensitiveCompare:@"ARA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAra);
        }
        if ([value caseInsensitiveCompare:@"HIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHin);
        }
        if ([value caseInsensitiveCompare:@"JPN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeJpn);
        }
        if ([value caseInsensitiveCompare:@"RUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRus);
        }
        if ([value caseInsensitiveCompare:@"POR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePor);
        }
        if ([value caseInsensitiveCompare:@"ITA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIta);
        }
        if ([value caseInsensitiveCompare:@"URD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUrd);
        }
        if ([value caseInsensitiveCompare:@"VIE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVie);
        }
        if ([value caseInsensitiveCompare:@"KOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKor);
        }
        if ([value caseInsensitiveCompare:@"PAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePan);
        }
        if ([value caseInsensitiveCompare:@"ABK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAbk);
        }
        if ([value caseInsensitiveCompare:@"AAR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAar);
        }
        if ([value caseInsensitiveCompare:@"AFR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAfr);
        }
        if ([value caseInsensitiveCompare:@"AKA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAka);
        }
        if ([value caseInsensitiveCompare:@"SQI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSqi);
        }
        if ([value caseInsensitiveCompare:@"AMH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAmh);
        }
        if ([value caseInsensitiveCompare:@"ARG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeArg);
        }
        if ([value caseInsensitiveCompare:@"HYE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHye);
        }
        if ([value caseInsensitiveCompare:@"ASM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAsm);
        }
        if ([value caseInsensitiveCompare:@"AVA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAva);
        }
        if ([value caseInsensitiveCompare:@"AVE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAve);
        }
        if ([value caseInsensitiveCompare:@"AYM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAym);
        }
        if ([value caseInsensitiveCompare:@"AZE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeAze);
        }
        if ([value caseInsensitiveCompare:@"BAM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBam);
        }
        if ([value caseInsensitiveCompare:@"BAK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBak);
        }
        if ([value caseInsensitiveCompare:@"EUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEus);
        }
        if ([value caseInsensitiveCompare:@"BEL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBel);
        }
        if ([value caseInsensitiveCompare:@"BEN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBen);
        }
        if ([value caseInsensitiveCompare:@"BIH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBih);
        }
        if ([value caseInsensitiveCompare:@"BIS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBis);
        }
        if ([value caseInsensitiveCompare:@"BOS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBos);
        }
        if ([value caseInsensitiveCompare:@"BRE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBre);
        }
        if ([value caseInsensitiveCompare:@"BUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBul);
        }
        if ([value caseInsensitiveCompare:@"MYA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMya);
        }
        if ([value caseInsensitiveCompare:@"CAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCat);
        }
        if ([value caseInsensitiveCompare:@"KHM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKhm);
        }
        if ([value caseInsensitiveCompare:@"CHA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCha);
        }
        if ([value caseInsensitiveCompare:@"CHE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChe);
        }
        if ([value caseInsensitiveCompare:@"NYA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNya);
        }
        if ([value caseInsensitiveCompare:@"CHU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChu);
        }
        if ([value caseInsensitiveCompare:@"CHV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeChv);
        }
        if ([value caseInsensitiveCompare:@"COR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCor);
        }
        if ([value caseInsensitiveCompare:@"COS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCos);
        }
        if ([value caseInsensitiveCompare:@"CRE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCre);
        }
        if ([value caseInsensitiveCompare:@"HRV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHrv);
        }
        if ([value caseInsensitiveCompare:@"CES"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCes);
        }
        if ([value caseInsensitiveCompare:@"DAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDan);
        }
        if ([value caseInsensitiveCompare:@"DIV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDiv);
        }
        if ([value caseInsensitiveCompare:@"NLD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNld);
        }
        if ([value caseInsensitiveCompare:@"DZO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeDzo);
        }
        if ([value caseInsensitiveCompare:@"ENM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEnm);
        }
        if ([value caseInsensitiveCompare:@"EPO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEpo);
        }
        if ([value caseInsensitiveCompare:@"EST"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEst);
        }
        if ([value caseInsensitiveCompare:@"EWE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEwe);
        }
        if ([value caseInsensitiveCompare:@"FAO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFao);
        }
        if ([value caseInsensitiveCompare:@"FIJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFij);
        }
        if ([value caseInsensitiveCompare:@"FIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFin);
        }
        if ([value caseInsensitiveCompare:@"FRM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFrm);
        }
        if ([value caseInsensitiveCompare:@"FUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFul);
        }
        if ([value caseInsensitiveCompare:@"GLA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGla);
        }
        if ([value caseInsensitiveCompare:@"GLG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGlg);
        }
        if ([value caseInsensitiveCompare:@"LUG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLug);
        }
        if ([value caseInsensitiveCompare:@"KAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKat);
        }
        if ([value caseInsensitiveCompare:@"ELL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeEll);
        }
        if ([value caseInsensitiveCompare:@"GRN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGrn);
        }
        if ([value caseInsensitiveCompare:@"GUJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGuj);
        }
        if ([value caseInsensitiveCompare:@"HAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHat);
        }
        if ([value caseInsensitiveCompare:@"HAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHau);
        }
        if ([value caseInsensitiveCompare:@"HEB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHeb);
        }
        if ([value caseInsensitiveCompare:@"HER"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHer);
        }
        if ([value caseInsensitiveCompare:@"HMO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHmo);
        }
        if ([value caseInsensitiveCompare:@"HUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeHun);
        }
        if ([value caseInsensitiveCompare:@"ISL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIsl);
        }
        if ([value caseInsensitiveCompare:@"IDO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIdo);
        }
        if ([value caseInsensitiveCompare:@"IBO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIbo);
        }
        if ([value caseInsensitiveCompare:@"IND"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeInd);
        }
        if ([value caseInsensitiveCompare:@"INA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIna);
        }
        if ([value caseInsensitiveCompare:@"ILE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIle);
        }
        if ([value caseInsensitiveCompare:@"IKU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIku);
        }
        if ([value caseInsensitiveCompare:@"IPK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIpk);
        }
        if ([value caseInsensitiveCompare:@"GLE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGle);
        }
        if ([value caseInsensitiveCompare:@"JAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeJav);
        }
        if ([value caseInsensitiveCompare:@"KAL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKal);
        }
        if ([value caseInsensitiveCompare:@"KAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKan);
        }
        if ([value caseInsensitiveCompare:@"KAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKau);
        }
        if ([value caseInsensitiveCompare:@"KAS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKas);
        }
        if ([value caseInsensitiveCompare:@"KAZ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKaz);
        }
        if ([value caseInsensitiveCompare:@"KIK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKik);
        }
        if ([value caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKin);
        }
        if ([value caseInsensitiveCompare:@"KIR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKir);
        }
        if ([value caseInsensitiveCompare:@"KOM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKom);
        }
        if ([value caseInsensitiveCompare:@"KON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKon);
        }
        if ([value caseInsensitiveCompare:@"KUA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKua);
        }
        if ([value caseInsensitiveCompare:@"KUR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeKur);
        }
        if ([value caseInsensitiveCompare:@"LAO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLao);
        }
        if ([value caseInsensitiveCompare:@"LAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLat);
        }
        if ([value caseInsensitiveCompare:@"LAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLav);
        }
        if ([value caseInsensitiveCompare:@"LIM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLim);
        }
        if ([value caseInsensitiveCompare:@"LIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLin);
        }
        if ([value caseInsensitiveCompare:@"LIT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLit);
        }
        if ([value caseInsensitiveCompare:@"LUB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLub);
        }
        if ([value caseInsensitiveCompare:@"LTZ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeLtz);
        }
        if ([value caseInsensitiveCompare:@"MKD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMkd);
        }
        if ([value caseInsensitiveCompare:@"MLG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMlg);
        }
        if ([value caseInsensitiveCompare:@"MSA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMsa);
        }
        if ([value caseInsensitiveCompare:@"MAL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMal);
        }
        if ([value caseInsensitiveCompare:@"MLT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMlt);
        }
        if ([value caseInsensitiveCompare:@"GLV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeGlv);
        }
        if ([value caseInsensitiveCompare:@"MRI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMri);
        }
        if ([value caseInsensitiveCompare:@"MAR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMar);
        }
        if ([value caseInsensitiveCompare:@"MAH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMah);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeMon);
        }
        if ([value caseInsensitiveCompare:@"NAU"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNau);
        }
        if ([value caseInsensitiveCompare:@"NAV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNav);
        }
        if ([value caseInsensitiveCompare:@"NDE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNde);
        }
        if ([value caseInsensitiveCompare:@"NBL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNbl);
        }
        if ([value caseInsensitiveCompare:@"NDO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNdo);
        }
        if ([value caseInsensitiveCompare:@"NEP"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNep);
        }
        if ([value caseInsensitiveCompare:@"SME"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSme);
        }
        if ([value caseInsensitiveCompare:@"NOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNor);
        }
        if ([value caseInsensitiveCompare:@"NOB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNob);
        }
        if ([value caseInsensitiveCompare:@"NNO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeNno);
        }
        if ([value caseInsensitiveCompare:@"OCI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOci);
        }
        if ([value caseInsensitiveCompare:@"OJI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOji);
        }
        if ([value caseInsensitiveCompare:@"ORI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOri);
        }
        if ([value caseInsensitiveCompare:@"ORM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOrm);
        }
        if ([value caseInsensitiveCompare:@"OSS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOss);
        }
        if ([value caseInsensitiveCompare:@"PLI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePli);
        }
        if ([value caseInsensitiveCompare:@"FAS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFas);
        }
        if ([value caseInsensitiveCompare:@"POL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePol);
        }
        if ([value caseInsensitiveCompare:@"PUS"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodePus);
        }
        if ([value caseInsensitiveCompare:@"QUE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQue);
        }
        if ([value caseInsensitiveCompare:@"QAA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQaa);
        }
        if ([value caseInsensitiveCompare:@"RON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRon);
        }
        if ([value caseInsensitiveCompare:@"ROH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRoh);
        }
        if ([value caseInsensitiveCompare:@"RUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeRun);
        }
        if ([value caseInsensitiveCompare:@"SMO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSmo);
        }
        if ([value caseInsensitiveCompare:@"SAG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSag);
        }
        if ([value caseInsensitiveCompare:@"SAN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSan);
        }
        if ([value caseInsensitiveCompare:@"SRD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSrd);
        }
        if ([value caseInsensitiveCompare:@"SRB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSrb);
        }
        if ([value caseInsensitiveCompare:@"SNA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSna);
        }
        if ([value caseInsensitiveCompare:@"III"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeIii);
        }
        if ([value caseInsensitiveCompare:@"SND"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSnd);
        }
        if ([value caseInsensitiveCompare:@"SIN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSin);
        }
        if ([value caseInsensitiveCompare:@"SLK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSlk);
        }
        if ([value caseInsensitiveCompare:@"SLV"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSlv);
        }
        if ([value caseInsensitiveCompare:@"SOM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSom);
        }
        if ([value caseInsensitiveCompare:@"SOT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSot);
        }
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSun);
        }
        if ([value caseInsensitiveCompare:@"SWA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSwa);
        }
        if ([value caseInsensitiveCompare:@"SSW"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSsw);
        }
        if ([value caseInsensitiveCompare:@"SWE"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeSwe);
        }
        if ([value caseInsensitiveCompare:@"TGL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTgl);
        }
        if ([value caseInsensitiveCompare:@"TAH"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTah);
        }
        if ([value caseInsensitiveCompare:@"TGK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTgk);
        }
        if ([value caseInsensitiveCompare:@"TAM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTam);
        }
        if ([value caseInsensitiveCompare:@"TAT"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTat);
        }
        if ([value caseInsensitiveCompare:@"TEL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTel);
        }
        if ([value caseInsensitiveCompare:@"THA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTha);
        }
        if ([value caseInsensitiveCompare:@"BOD"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeBod);
        }
        if ([value caseInsensitiveCompare:@"TIR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTir);
        }
        if ([value caseInsensitiveCompare:@"TON"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTon);
        }
        if ([value caseInsensitiveCompare:@"TSO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTso);
        }
        if ([value caseInsensitiveCompare:@"TSN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTsn);
        }
        if ([value caseInsensitiveCompare:@"TUR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTur);
        }
        if ([value caseInsensitiveCompare:@"TUK"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTuk);
        }
        if ([value caseInsensitiveCompare:@"TWI"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTwi);
        }
        if ([value caseInsensitiveCompare:@"UIG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUig);
        }
        if ([value caseInsensitiveCompare:@"UKR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUkr);
        }
        if ([value caseInsensitiveCompare:@"UZB"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeUzb);
        }
        if ([value caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVen);
        }
        if ([value caseInsensitiveCompare:@"VOL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeVol);
        }
        if ([value caseInsensitiveCompare:@"WLN"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeWln);
        }
        if ([value caseInsensitiveCompare:@"CYM"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeCym);
        }
        if ([value caseInsensitiveCompare:@"FRY"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeFry);
        }
        if ([value caseInsensitiveCompare:@"WOL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeWol);
        }
        if ([value caseInsensitiveCompare:@"XHO"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeXho);
        }
        if ([value caseInsensitiveCompare:@"YID"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeYid);
        }
        if ([value caseInsensitiveCompare:@"YOR"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeYor);
        }
        if ([value caseInsensitiveCompare:@"ZHA"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZha);
        }
        if ([value caseInsensitiveCompare:@"ZUL"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeZul);
        }
        if ([value caseInsensitiveCompare:@"ORJ"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeOrj);
        }
        if ([value caseInsensitiveCompare:@"QPC"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeQpc);
        }
        if ([value caseInsensitiveCompare:@"TNG"] == NSOrderedSame) {
            return @(AWSMediaconvertLanguageCodeTng);
        }
        return @(AWSMediaconvertLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertLanguageCodeEng:
                return @"ENG";
            case AWSMediaconvertLanguageCodeSpa:
                return @"SPA";
            case AWSMediaconvertLanguageCodeFra:
                return @"FRA";
            case AWSMediaconvertLanguageCodeDeu:
                return @"DEU";
            case AWSMediaconvertLanguageCodeGer:
                return @"GER";
            case AWSMediaconvertLanguageCodeZho:
                return @"ZHO";
            case AWSMediaconvertLanguageCodeAra:
                return @"ARA";
            case AWSMediaconvertLanguageCodeHin:
                return @"HIN";
            case AWSMediaconvertLanguageCodeJpn:
                return @"JPN";
            case AWSMediaconvertLanguageCodeRus:
                return @"RUS";
            case AWSMediaconvertLanguageCodePor:
                return @"POR";
            case AWSMediaconvertLanguageCodeIta:
                return @"ITA";
            case AWSMediaconvertLanguageCodeUrd:
                return @"URD";
            case AWSMediaconvertLanguageCodeVie:
                return @"VIE";
            case AWSMediaconvertLanguageCodeKor:
                return @"KOR";
            case AWSMediaconvertLanguageCodePan:
                return @"PAN";
            case AWSMediaconvertLanguageCodeAbk:
                return @"ABK";
            case AWSMediaconvertLanguageCodeAar:
                return @"AAR";
            case AWSMediaconvertLanguageCodeAfr:
                return @"AFR";
            case AWSMediaconvertLanguageCodeAka:
                return @"AKA";
            case AWSMediaconvertLanguageCodeSqi:
                return @"SQI";
            case AWSMediaconvertLanguageCodeAmh:
                return @"AMH";
            case AWSMediaconvertLanguageCodeArg:
                return @"ARG";
            case AWSMediaconvertLanguageCodeHye:
                return @"HYE";
            case AWSMediaconvertLanguageCodeAsm:
                return @"ASM";
            case AWSMediaconvertLanguageCodeAva:
                return @"AVA";
            case AWSMediaconvertLanguageCodeAve:
                return @"AVE";
            case AWSMediaconvertLanguageCodeAym:
                return @"AYM";
            case AWSMediaconvertLanguageCodeAze:
                return @"AZE";
            case AWSMediaconvertLanguageCodeBam:
                return @"BAM";
            case AWSMediaconvertLanguageCodeBak:
                return @"BAK";
            case AWSMediaconvertLanguageCodeEus:
                return @"EUS";
            case AWSMediaconvertLanguageCodeBel:
                return @"BEL";
            case AWSMediaconvertLanguageCodeBen:
                return @"BEN";
            case AWSMediaconvertLanguageCodeBih:
                return @"BIH";
            case AWSMediaconvertLanguageCodeBis:
                return @"BIS";
            case AWSMediaconvertLanguageCodeBos:
                return @"BOS";
            case AWSMediaconvertLanguageCodeBre:
                return @"BRE";
            case AWSMediaconvertLanguageCodeBul:
                return @"BUL";
            case AWSMediaconvertLanguageCodeMya:
                return @"MYA";
            case AWSMediaconvertLanguageCodeCat:
                return @"CAT";
            case AWSMediaconvertLanguageCodeKhm:
                return @"KHM";
            case AWSMediaconvertLanguageCodeCha:
                return @"CHA";
            case AWSMediaconvertLanguageCodeChe:
                return @"CHE";
            case AWSMediaconvertLanguageCodeNya:
                return @"NYA";
            case AWSMediaconvertLanguageCodeChu:
                return @"CHU";
            case AWSMediaconvertLanguageCodeChv:
                return @"CHV";
            case AWSMediaconvertLanguageCodeCor:
                return @"COR";
            case AWSMediaconvertLanguageCodeCos:
                return @"COS";
            case AWSMediaconvertLanguageCodeCre:
                return @"CRE";
            case AWSMediaconvertLanguageCodeHrv:
                return @"HRV";
            case AWSMediaconvertLanguageCodeCes:
                return @"CES";
            case AWSMediaconvertLanguageCodeDan:
                return @"DAN";
            case AWSMediaconvertLanguageCodeDiv:
                return @"DIV";
            case AWSMediaconvertLanguageCodeNld:
                return @"NLD";
            case AWSMediaconvertLanguageCodeDzo:
                return @"DZO";
            case AWSMediaconvertLanguageCodeEnm:
                return @"ENM";
            case AWSMediaconvertLanguageCodeEpo:
                return @"EPO";
            case AWSMediaconvertLanguageCodeEst:
                return @"EST";
            case AWSMediaconvertLanguageCodeEwe:
                return @"EWE";
            case AWSMediaconvertLanguageCodeFao:
                return @"FAO";
            case AWSMediaconvertLanguageCodeFij:
                return @"FIJ";
            case AWSMediaconvertLanguageCodeFin:
                return @"FIN";
            case AWSMediaconvertLanguageCodeFrm:
                return @"FRM";
            case AWSMediaconvertLanguageCodeFul:
                return @"FUL";
            case AWSMediaconvertLanguageCodeGla:
                return @"GLA";
            case AWSMediaconvertLanguageCodeGlg:
                return @"GLG";
            case AWSMediaconvertLanguageCodeLug:
                return @"LUG";
            case AWSMediaconvertLanguageCodeKat:
                return @"KAT";
            case AWSMediaconvertLanguageCodeEll:
                return @"ELL";
            case AWSMediaconvertLanguageCodeGrn:
                return @"GRN";
            case AWSMediaconvertLanguageCodeGuj:
                return @"GUJ";
            case AWSMediaconvertLanguageCodeHat:
                return @"HAT";
            case AWSMediaconvertLanguageCodeHau:
                return @"HAU";
            case AWSMediaconvertLanguageCodeHeb:
                return @"HEB";
            case AWSMediaconvertLanguageCodeHer:
                return @"HER";
            case AWSMediaconvertLanguageCodeHmo:
                return @"HMO";
            case AWSMediaconvertLanguageCodeHun:
                return @"HUN";
            case AWSMediaconvertLanguageCodeIsl:
                return @"ISL";
            case AWSMediaconvertLanguageCodeIdo:
                return @"IDO";
            case AWSMediaconvertLanguageCodeIbo:
                return @"IBO";
            case AWSMediaconvertLanguageCodeInd:
                return @"IND";
            case AWSMediaconvertLanguageCodeIna:
                return @"INA";
            case AWSMediaconvertLanguageCodeIle:
                return @"ILE";
            case AWSMediaconvertLanguageCodeIku:
                return @"IKU";
            case AWSMediaconvertLanguageCodeIpk:
                return @"IPK";
            case AWSMediaconvertLanguageCodeGle:
                return @"GLE";
            case AWSMediaconvertLanguageCodeJav:
                return @"JAV";
            case AWSMediaconvertLanguageCodeKal:
                return @"KAL";
            case AWSMediaconvertLanguageCodeKan:
                return @"KAN";
            case AWSMediaconvertLanguageCodeKau:
                return @"KAU";
            case AWSMediaconvertLanguageCodeKas:
                return @"KAS";
            case AWSMediaconvertLanguageCodeKaz:
                return @"KAZ";
            case AWSMediaconvertLanguageCodeKik:
                return @"KIK";
            case AWSMediaconvertLanguageCodeKin:
                return @"KIN";
            case AWSMediaconvertLanguageCodeKir:
                return @"KIR";
            case AWSMediaconvertLanguageCodeKom:
                return @"KOM";
            case AWSMediaconvertLanguageCodeKon:
                return @"KON";
            case AWSMediaconvertLanguageCodeKua:
                return @"KUA";
            case AWSMediaconvertLanguageCodeKur:
                return @"KUR";
            case AWSMediaconvertLanguageCodeLao:
                return @"LAO";
            case AWSMediaconvertLanguageCodeLat:
                return @"LAT";
            case AWSMediaconvertLanguageCodeLav:
                return @"LAV";
            case AWSMediaconvertLanguageCodeLim:
                return @"LIM";
            case AWSMediaconvertLanguageCodeLin:
                return @"LIN";
            case AWSMediaconvertLanguageCodeLit:
                return @"LIT";
            case AWSMediaconvertLanguageCodeLub:
                return @"LUB";
            case AWSMediaconvertLanguageCodeLtz:
                return @"LTZ";
            case AWSMediaconvertLanguageCodeMkd:
                return @"MKD";
            case AWSMediaconvertLanguageCodeMlg:
                return @"MLG";
            case AWSMediaconvertLanguageCodeMsa:
                return @"MSA";
            case AWSMediaconvertLanguageCodeMal:
                return @"MAL";
            case AWSMediaconvertLanguageCodeMlt:
                return @"MLT";
            case AWSMediaconvertLanguageCodeGlv:
                return @"GLV";
            case AWSMediaconvertLanguageCodeMri:
                return @"MRI";
            case AWSMediaconvertLanguageCodeMar:
                return @"MAR";
            case AWSMediaconvertLanguageCodeMah:
                return @"MAH";
            case AWSMediaconvertLanguageCodeMon:
                return @"MON";
            case AWSMediaconvertLanguageCodeNau:
                return @"NAU";
            case AWSMediaconvertLanguageCodeNav:
                return @"NAV";
            case AWSMediaconvertLanguageCodeNde:
                return @"NDE";
            case AWSMediaconvertLanguageCodeNbl:
                return @"NBL";
            case AWSMediaconvertLanguageCodeNdo:
                return @"NDO";
            case AWSMediaconvertLanguageCodeNep:
                return @"NEP";
            case AWSMediaconvertLanguageCodeSme:
                return @"SME";
            case AWSMediaconvertLanguageCodeNor:
                return @"NOR";
            case AWSMediaconvertLanguageCodeNob:
                return @"NOB";
            case AWSMediaconvertLanguageCodeNno:
                return @"NNO";
            case AWSMediaconvertLanguageCodeOci:
                return @"OCI";
            case AWSMediaconvertLanguageCodeOji:
                return @"OJI";
            case AWSMediaconvertLanguageCodeOri:
                return @"ORI";
            case AWSMediaconvertLanguageCodeOrm:
                return @"ORM";
            case AWSMediaconvertLanguageCodeOss:
                return @"OSS";
            case AWSMediaconvertLanguageCodePli:
                return @"PLI";
            case AWSMediaconvertLanguageCodeFas:
                return @"FAS";
            case AWSMediaconvertLanguageCodePol:
                return @"POL";
            case AWSMediaconvertLanguageCodePus:
                return @"PUS";
            case AWSMediaconvertLanguageCodeQue:
                return @"QUE";
            case AWSMediaconvertLanguageCodeQaa:
                return @"QAA";
            case AWSMediaconvertLanguageCodeRon:
                return @"RON";
            case AWSMediaconvertLanguageCodeRoh:
                return @"ROH";
            case AWSMediaconvertLanguageCodeRun:
                return @"RUN";
            case AWSMediaconvertLanguageCodeSmo:
                return @"SMO";
            case AWSMediaconvertLanguageCodeSag:
                return @"SAG";
            case AWSMediaconvertLanguageCodeSan:
                return @"SAN";
            case AWSMediaconvertLanguageCodeSrd:
                return @"SRD";
            case AWSMediaconvertLanguageCodeSrb:
                return @"SRB";
            case AWSMediaconvertLanguageCodeSna:
                return @"SNA";
            case AWSMediaconvertLanguageCodeIii:
                return @"III";
            case AWSMediaconvertLanguageCodeSnd:
                return @"SND";
            case AWSMediaconvertLanguageCodeSin:
                return @"SIN";
            case AWSMediaconvertLanguageCodeSlk:
                return @"SLK";
            case AWSMediaconvertLanguageCodeSlv:
                return @"SLV";
            case AWSMediaconvertLanguageCodeSom:
                return @"SOM";
            case AWSMediaconvertLanguageCodeSot:
                return @"SOT";
            case AWSMediaconvertLanguageCodeSun:
                return @"SUN";
            case AWSMediaconvertLanguageCodeSwa:
                return @"SWA";
            case AWSMediaconvertLanguageCodeSsw:
                return @"SSW";
            case AWSMediaconvertLanguageCodeSwe:
                return @"SWE";
            case AWSMediaconvertLanguageCodeTgl:
                return @"TGL";
            case AWSMediaconvertLanguageCodeTah:
                return @"TAH";
            case AWSMediaconvertLanguageCodeTgk:
                return @"TGK";
            case AWSMediaconvertLanguageCodeTam:
                return @"TAM";
            case AWSMediaconvertLanguageCodeTat:
                return @"TAT";
            case AWSMediaconvertLanguageCodeTel:
                return @"TEL";
            case AWSMediaconvertLanguageCodeTha:
                return @"THA";
            case AWSMediaconvertLanguageCodeBod:
                return @"BOD";
            case AWSMediaconvertLanguageCodeTir:
                return @"TIR";
            case AWSMediaconvertLanguageCodeTon:
                return @"TON";
            case AWSMediaconvertLanguageCodeTso:
                return @"TSO";
            case AWSMediaconvertLanguageCodeTsn:
                return @"TSN";
            case AWSMediaconvertLanguageCodeTur:
                return @"TUR";
            case AWSMediaconvertLanguageCodeTuk:
                return @"TUK";
            case AWSMediaconvertLanguageCodeTwi:
                return @"TWI";
            case AWSMediaconvertLanguageCodeUig:
                return @"UIG";
            case AWSMediaconvertLanguageCodeUkr:
                return @"UKR";
            case AWSMediaconvertLanguageCodeUzb:
                return @"UZB";
            case AWSMediaconvertLanguageCodeVen:
                return @"VEN";
            case AWSMediaconvertLanguageCodeVol:
                return @"VOL";
            case AWSMediaconvertLanguageCodeWln:
                return @"WLN";
            case AWSMediaconvertLanguageCodeCym:
                return @"CYM";
            case AWSMediaconvertLanguageCodeFry:
                return @"FRY";
            case AWSMediaconvertLanguageCodeWol:
                return @"WOL";
            case AWSMediaconvertLanguageCodeXho:
                return @"XHO";
            case AWSMediaconvertLanguageCodeYid:
                return @"YID";
            case AWSMediaconvertLanguageCodeYor:
                return @"YOR";
            case AWSMediaconvertLanguageCodeZha:
                return @"ZHA";
            case AWSMediaconvertLanguageCodeZul:
                return @"ZUL";
            case AWSMediaconvertLanguageCodeOrj:
                return @"ORJ";
            case AWSMediaconvertLanguageCodeQpc:
                return @"QPC";
            case AWSMediaconvertLanguageCodeTng:
                return @"TNG";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertHlsEncryptionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constantInitializationVector" : @"ConstantInitializationVector",
             @"encryptionMethod" : @"EncryptionMethod",
             @"initializationVectorInManifest" : @"InitializationVectorInManifest",
             @"offlineEncrypted" : @"OfflineEncrypted",
             @"spekeKeyProvider" : @"SpekeKeyProvider",
             @"staticKeyProvider" : @"StaticKeyProvider",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)encryptionMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES128"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsEncryptionTypeAes128);
        }
        if ([value caseInsensitiveCompare:@"SAMPLE_AES"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsEncryptionTypeSampleAes);
        }
        return @(AWSMediaconvertHlsEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsEncryptionTypeAes128:
                return @"AES128";
            case AWSMediaconvertHlsEncryptionTypeSampleAes:
                return @"SAMPLE_AES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)initializationVectorInManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsInitializationVectorInManifestInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsInitializationVectorInManifestExclude);
        }
        return @(AWSMediaconvertHlsInitializationVectorInManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsInitializationVectorInManifestInclude:
                return @"INCLUDE";
            case AWSMediaconvertHlsInitializationVectorInManifestExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offlineEncryptedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsOfflineEncryptedEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsOfflineEncryptedDisabled);
        }
        return @(AWSMediaconvertHlsOfflineEncryptedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsOfflineEncryptedEnabled:
                return @"ENABLED";
            case AWSMediaconvertHlsOfflineEncryptedDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertSpekeKeyProvider class]];
}

+ (NSValueTransformer *)staticKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertStaticKeyProvider class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SPEKE"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsKeyProviderTypeSpeke);
        }
        if ([value caseInsensitiveCompare:@"STATIC_KEY"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsKeyProviderTypeStaticKey);
        }
        return @(AWSMediaconvertHlsKeyProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsKeyProviderTypeSpeke:
                return @"SPEKE";
            case AWSMediaconvertHlsKeyProviderTypeStaticKey:
                return @"STATIC_KEY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertHlsGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adMarkers" : @"AdMarkers",
             @"additionalManifests" : @"AdditionalManifests",
             @"baseUrl" : @"BaseUrl",
             @"captionLanguageMappings" : @"CaptionLanguageMappings",
             @"captionLanguageSetting" : @"CaptionLanguageSetting",
             @"clientCache" : @"ClientCache",
             @"codecSpecification" : @"CodecSpecification",
             @"destination" : @"Destination",
             @"destinationSettings" : @"DestinationSettings",
             @"directoryStructure" : @"DirectoryStructure",
             @"encryption" : @"Encryption",
             @"manifestCompression" : @"ManifestCompression",
             @"manifestDurationFormat" : @"ManifestDurationFormat",
             @"minFinalSegmentLength" : @"MinFinalSegmentLength",
             @"minSegmentLength" : @"MinSegmentLength",
             @"outputSelection" : @"OutputSelection",
             @"programDateTime" : @"ProgramDateTime",
             @"programDateTimePeriod" : @"ProgramDateTimePeriod",
             @"segmentControl" : @"SegmentControl",
             @"segmentLength" : @"SegmentLength",
             @"segmentsPerSubdirectory" : @"SegmentsPerSubdirectory",
             @"streamInfResolution" : @"StreamInfResolution",
             @"timedMetadataId3Frame" : @"TimedMetadataId3Frame",
             @"timedMetadataId3Period" : @"TimedMetadataId3Period",
             @"timestampDeltaMilliseconds" : @"TimestampDeltaMilliseconds",
             };
}

+ (NSValueTransformer *)additionalManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertHlsAdditionalManifest class]];
}

+ (NSValueTransformer *)captionLanguageMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertHlsCaptionLanguageMapping class]];
}

+ (NSValueTransformer *)captionLanguageSettingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsCaptionLanguageSettingInsert);
        }
        if ([value caseInsensitiveCompare:@"OMIT"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsCaptionLanguageSettingOmit);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsCaptionLanguageSettingNone);
        }
        return @(AWSMediaconvertHlsCaptionLanguageSettingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsCaptionLanguageSettingInsert:
                return @"INSERT";
            case AWSMediaconvertHlsCaptionLanguageSettingOmit:
                return @"OMIT";
            case AWSMediaconvertHlsCaptionLanguageSettingNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)clientCacheJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsClientCacheDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsClientCacheEnabled);
        }
        return @(AWSMediaconvertHlsClientCacheUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsClientCacheDisabled:
                return @"DISABLED";
            case AWSMediaconvertHlsClientCacheEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecSpecificationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RFC_6381"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsCodecSpecificationRfc6381);
        }
        if ([value caseInsensitiveCompare:@"RFC_4281"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsCodecSpecificationRfc4281);
        }
        return @(AWSMediaconvertHlsCodecSpecificationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsCodecSpecificationRfc6381:
                return @"RFC_6381";
            case AWSMediaconvertHlsCodecSpecificationRfc4281:
                return @"RFC_4281";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDestinationSettings class]];
}

+ (NSValueTransformer *)directoryStructureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_DIRECTORY"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsDirectoryStructureSingleDirectory);
        }
        if ([value caseInsensitiveCompare:@"SUBDIRECTORY_PER_STREAM"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsDirectoryStructureSubdirectoryPerStream);
        }
        return @(AWSMediaconvertHlsDirectoryStructureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsDirectoryStructureSingleDirectory:
                return @"SINGLE_DIRECTORY";
            case AWSMediaconvertHlsDirectoryStructureSubdirectoryPerStream:
                return @"SUBDIRECTORY_PER_STREAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertHlsEncryptionSettings class]];
}

+ (NSValueTransformer *)manifestCompressionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsManifestCompressionGzip);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsManifestCompressionNone);
        }
        return @(AWSMediaconvertHlsManifestCompressionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsManifestCompressionGzip:
                return @"GZIP";
            case AWSMediaconvertHlsManifestCompressionNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)manifestDurationFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FLOATING_POINT"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsManifestDurationFormatFloatingPoint);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsManifestDurationFormatInteger);
        }
        return @(AWSMediaconvertHlsManifestDurationFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsManifestDurationFormatFloatingPoint:
                return @"FLOATING_POINT";
            case AWSMediaconvertHlsManifestDurationFormatInteger:
                return @"INTEGER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputSelectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MANIFESTS_AND_SEGMENTS"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsOutputSelectionManifestsAndSegments);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTS_ONLY"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsOutputSelectionSegmentsOnly);
        }
        return @(AWSMediaconvertHlsOutputSelectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsOutputSelectionManifestsAndSegments:
                return @"MANIFESTS_AND_SEGMENTS";
            case AWSMediaconvertHlsOutputSelectionSegmentsOnly:
                return @"SEGMENTS_ONLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)programDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsProgramDateTimeInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsProgramDateTimeExclude);
        }
        return @(AWSMediaconvertHlsProgramDateTimeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsProgramDateTimeInclude:
                return @"INCLUDE";
            case AWSMediaconvertHlsProgramDateTimeExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_FILE"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsSegmentControlSingleFile);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTED_FILES"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsSegmentControlSegmentedFiles);
        }
        return @(AWSMediaconvertHlsSegmentControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsSegmentControlSingleFile:
                return @"SINGLE_FILE";
            case AWSMediaconvertHlsSegmentControlSegmentedFiles:
                return @"SEGMENTED_FILES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)streamInfResolutionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsStreamInfResolutionInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsStreamInfResolutionExclude);
        }
        return @(AWSMediaconvertHlsStreamInfResolutionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsStreamInfResolutionInclude:
                return @"INCLUDE";
            case AWSMediaconvertHlsStreamInfResolutionExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataId3FrameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsTimedMetadataId3FrameNone);
        }
        if ([value caseInsensitiveCompare:@"PRIV"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsTimedMetadataId3FramePriv);
        }
        if ([value caseInsensitiveCompare:@"TDRL"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsTimedMetadataId3FrameTdrl);
        }
        return @(AWSMediaconvertHlsTimedMetadataId3FrameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsTimedMetadataId3FrameNone:
                return @"NONE";
            case AWSMediaconvertHlsTimedMetadataId3FramePriv:
                return @"PRIV";
            case AWSMediaconvertHlsTimedMetadataId3FrameTdrl:
                return @"TDRL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertHlsSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioGroupId" : @"AudioGroupId",
             @"audioOnlyContainer" : @"AudioOnlyContainer",
             @"audioRenditionSets" : @"AudioRenditionSets",
             @"audioTrackType" : @"AudioTrackType",
             @"IFrameOnlyManifest" : @"IFrameOnlyManifest",
             @"segmentModifier" : @"SegmentModifier",
             };
}

+ (NSValueTransformer *)audioOnlyContainerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTOMATIC"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsAudioOnlyContainerAutomatic);
        }
        if ([value caseInsensitiveCompare:@"M2TS"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsAudioOnlyContainerM2ts);
        }
        return @(AWSMediaconvertHlsAudioOnlyContainerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsAudioOnlyContainerAutomatic:
                return @"AUTOMATIC";
            case AWSMediaconvertHlsAudioOnlyContainerM2ts:
                return @"M2TS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)audioTrackTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsAudioTrackTypeAlternateAudioAutoSelectDefault);
        }
        if ([value caseInsensitiveCompare:@"ALTERNATE_AUDIO_AUTO_SELECT"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsAudioTrackTypeAlternateAudioAutoSelect);
        }
        if ([value caseInsensitiveCompare:@"ALTERNATE_AUDIO_NOT_AUTO_SELECT"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsAudioTrackTypeAlternateAudioNotAutoSelect);
        }
        if ([value caseInsensitiveCompare:@"AUDIO_ONLY_VARIANT_STREAM"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsAudioTrackTypeAudioOnlyVariantStream);
        }
        return @(AWSMediaconvertHlsAudioTrackTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsAudioTrackTypeAlternateAudioAutoSelectDefault:
                return @"ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT";
            case AWSMediaconvertHlsAudioTrackTypeAlternateAudioAutoSelect:
                return @"ALTERNATE_AUDIO_AUTO_SELECT";
            case AWSMediaconvertHlsAudioTrackTypeAlternateAudioNotAutoSelect:
                return @"ALTERNATE_AUDIO_NOT_AUTO_SELECT";
            case AWSMediaconvertHlsAudioTrackTypeAudioOnlyVariantStream:
                return @"AUDIO_ONLY_VARIANT_STREAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)IFrameOnlyManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsIFrameOnlyManifestInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertHlsIFrameOnlyManifestExclude);
        }
        return @(AWSMediaconvertHlsIFrameOnlyManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertHlsIFrameOnlyManifestInclude:
                return @"INCLUDE";
            case AWSMediaconvertHlsIFrameOnlyManifestExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertHopDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"priority" : @"Priority",
             @"queue" : @"Queue",
             @"waitMinutes" : @"WaitMinutes",
             };
}

@end

@implementation AWSMediaconvertId3Insertion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"id3" : @"Id3",
             @"timecode" : @"Timecode",
             };
}

@end

@implementation AWSMediaconvertImageInserter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insertableImages" : @"InsertableImages",
             };
}

+ (NSValueTransformer *)insertableImagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertInsertableImage class]];
}

@end

@implementation AWSMediaconvertImscDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stylePassthrough" : @"StylePassthrough",
             };
}

+ (NSValueTransformer *)stylePassthroughJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertImscStylePassthroughEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertImscStylePassthroughDisabled);
        }
        return @(AWSMediaconvertImscStylePassthroughUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertImscStylePassthroughEnabled:
                return @"ENABLED";
            case AWSMediaconvertImscStylePassthroughDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioSelectorGroups" : @"AudioSelectorGroups",
             @"audioSelectors" : @"AudioSelectors",
             @"captionSelectors" : @"CaptionSelectors",
             @"crop" : @"Crop",
             @"deblockFilter" : @"DeblockFilter",
             @"decryptionSettings" : @"DecryptionSettings",
             @"denoiseFilter" : @"DenoiseFilter",
             @"fileInput" : @"FileInput",
             @"filterEnable" : @"FilterEnable",
             @"filterStrength" : @"FilterStrength",
             @"imageInserter" : @"ImageInserter",
             @"inputClippings" : @"InputClippings",
             @"position" : @"Position",
             @"programNumber" : @"ProgramNumber",
             @"psiControl" : @"PsiControl",
             @"supplementalImps" : @"SupplementalImps",
             @"timecodeSource" : @"TimecodeSource",
             @"timecodeStart" : @"TimecodeStart",
             @"videoSelector" : @"VideoSelector",
             };
}

+ (NSValueTransformer *)audioSelectorGroupsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSMediaconvertAudioSelectorGroup class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)audioSelectorsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSMediaconvertAudioSelector class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)captionSelectorsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSMediaconvertCaptionSelector class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)cropJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertRectangle class]];
}

+ (NSValueTransformer *)deblockFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertInputDeblockFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertInputDeblockFilterDisabled);
        }
        return @(AWSMediaconvertInputDeblockFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertInputDeblockFilterEnabled:
                return @"ENABLED";
            case AWSMediaconvertInputDeblockFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)decryptionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertInputDecryptionSettings class]];
}

+ (NSValueTransformer *)denoiseFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertInputDenoiseFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertInputDenoiseFilterDisabled);
        }
        return @(AWSMediaconvertInputDenoiseFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertInputDenoiseFilterEnabled:
                return @"ENABLED";
            case AWSMediaconvertInputDenoiseFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)filterEnableJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMediaconvertInputFilterEnableAuto);
        }
        if ([value caseInsensitiveCompare:@"DISABLE"] == NSOrderedSame) {
            return @(AWSMediaconvertInputFilterEnableDisable);
        }
        if ([value caseInsensitiveCompare:@"FORCE"] == NSOrderedSame) {
            return @(AWSMediaconvertInputFilterEnableForce);
        }
        return @(AWSMediaconvertInputFilterEnableUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertInputFilterEnableAuto:
                return @"AUTO";
            case AWSMediaconvertInputFilterEnableDisable:
                return @"DISABLE";
            case AWSMediaconvertInputFilterEnableForce:
                return @"FORCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)imageInserterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertImageInserter class]];
}

+ (NSValueTransformer *)inputClippingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertInputClipping class]];
}

+ (NSValueTransformer *)positionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertRectangle class]];
}

+ (NSValueTransformer *)psiControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IGNORE_PSI"] == NSOrderedSame) {
            return @(AWSMediaconvertInputPsiControlIgnorePsi);
        }
        if ([value caseInsensitiveCompare:@"USE_PSI"] == NSOrderedSame) {
            return @(AWSMediaconvertInputPsiControlUsePsi);
        }
        return @(AWSMediaconvertInputPsiControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertInputPsiControlIgnorePsi:
                return @"IGNORE_PSI";
            case AWSMediaconvertInputPsiControlUsePsi:
                return @"USE_PSI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timecodeSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMBEDDED"] == NSOrderedSame) {
            return @(AWSMediaconvertInputTimecodeSourceEmbedded);
        }
        if ([value caseInsensitiveCompare:@"ZEROBASED"] == NSOrderedSame) {
            return @(AWSMediaconvertInputTimecodeSourceZerobased);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIEDSTART"] == NSOrderedSame) {
            return @(AWSMediaconvertInputTimecodeSourceSpecifiedstart);
        }
        return @(AWSMediaconvertInputTimecodeSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertInputTimecodeSourceEmbedded:
                return @"EMBEDDED";
            case AWSMediaconvertInputTimecodeSourceZerobased:
                return @"ZEROBASED";
            case AWSMediaconvertInputTimecodeSourceSpecifiedstart:
                return @"SPECIFIEDSTART";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)videoSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertVideoSelector class]];
}

@end

@implementation AWSMediaconvertInputClipping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTimecode" : @"EndTimecode",
             @"startTimecode" : @"StartTimecode",
             };
}

@end

@implementation AWSMediaconvertInputDecryptionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"decryptionMode" : @"DecryptionMode",
             @"encryptedDecryptionKey" : @"EncryptedDecryptionKey",
             @"initializationVector" : @"InitializationVector",
             @"kmsKeyRegion" : @"KmsKeyRegion",
             };
}

+ (NSValueTransformer *)decryptionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES_CTR"] == NSOrderedSame) {
            return @(AWSMediaconvertDecryptionModeAesCtr);
        }
        if ([value caseInsensitiveCompare:@"AES_CBC"] == NSOrderedSame) {
            return @(AWSMediaconvertDecryptionModeAesCbc);
        }
        if ([value caseInsensitiveCompare:@"AES_GCM"] == NSOrderedSame) {
            return @(AWSMediaconvertDecryptionModeAesGcm);
        }
        return @(AWSMediaconvertDecryptionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDecryptionModeAesCtr:
                return @"AES_CTR";
            case AWSMediaconvertDecryptionModeAesCbc:
                return @"AES_CBC";
            case AWSMediaconvertDecryptionModeAesGcm:
                return @"AES_GCM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertInputTemplate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioSelectorGroups" : @"AudioSelectorGroups",
             @"audioSelectors" : @"AudioSelectors",
             @"captionSelectors" : @"CaptionSelectors",
             @"crop" : @"Crop",
             @"deblockFilter" : @"DeblockFilter",
             @"denoiseFilter" : @"DenoiseFilter",
             @"filterEnable" : @"FilterEnable",
             @"filterStrength" : @"FilterStrength",
             @"imageInserter" : @"ImageInserter",
             @"inputClippings" : @"InputClippings",
             @"position" : @"Position",
             @"programNumber" : @"ProgramNumber",
             @"psiControl" : @"PsiControl",
             @"timecodeSource" : @"TimecodeSource",
             @"timecodeStart" : @"TimecodeStart",
             @"videoSelector" : @"VideoSelector",
             };
}

+ (NSValueTransformer *)audioSelectorGroupsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSMediaconvertAudioSelectorGroup class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)audioSelectorsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSMediaconvertAudioSelector class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)captionSelectorsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSMediaconvertCaptionSelector class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)cropJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertRectangle class]];
}

+ (NSValueTransformer *)deblockFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertInputDeblockFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertInputDeblockFilterDisabled);
        }
        return @(AWSMediaconvertInputDeblockFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertInputDeblockFilterEnabled:
                return @"ENABLED";
            case AWSMediaconvertInputDeblockFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)denoiseFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertInputDenoiseFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertInputDenoiseFilterDisabled);
        }
        return @(AWSMediaconvertInputDenoiseFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertInputDenoiseFilterEnabled:
                return @"ENABLED";
            case AWSMediaconvertInputDenoiseFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)filterEnableJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMediaconvertInputFilterEnableAuto);
        }
        if ([value caseInsensitiveCompare:@"DISABLE"] == NSOrderedSame) {
            return @(AWSMediaconvertInputFilterEnableDisable);
        }
        if ([value caseInsensitiveCompare:@"FORCE"] == NSOrderedSame) {
            return @(AWSMediaconvertInputFilterEnableForce);
        }
        return @(AWSMediaconvertInputFilterEnableUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertInputFilterEnableAuto:
                return @"AUTO";
            case AWSMediaconvertInputFilterEnableDisable:
                return @"DISABLE";
            case AWSMediaconvertInputFilterEnableForce:
                return @"FORCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)imageInserterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertImageInserter class]];
}

+ (NSValueTransformer *)inputClippingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertInputClipping class]];
}

+ (NSValueTransformer *)positionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertRectangle class]];
}

+ (NSValueTransformer *)psiControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IGNORE_PSI"] == NSOrderedSame) {
            return @(AWSMediaconvertInputPsiControlIgnorePsi);
        }
        if ([value caseInsensitiveCompare:@"USE_PSI"] == NSOrderedSame) {
            return @(AWSMediaconvertInputPsiControlUsePsi);
        }
        return @(AWSMediaconvertInputPsiControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertInputPsiControlIgnorePsi:
                return @"IGNORE_PSI";
            case AWSMediaconvertInputPsiControlUsePsi:
                return @"USE_PSI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timecodeSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMBEDDED"] == NSOrderedSame) {
            return @(AWSMediaconvertInputTimecodeSourceEmbedded);
        }
        if ([value caseInsensitiveCompare:@"ZEROBASED"] == NSOrderedSame) {
            return @(AWSMediaconvertInputTimecodeSourceZerobased);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIEDSTART"] == NSOrderedSame) {
            return @(AWSMediaconvertInputTimecodeSourceSpecifiedstart);
        }
        return @(AWSMediaconvertInputTimecodeSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertInputTimecodeSourceEmbedded:
                return @"EMBEDDED";
            case AWSMediaconvertInputTimecodeSourceZerobased:
                return @"ZEROBASED";
            case AWSMediaconvertInputTimecodeSourceSpecifiedstart:
                return @"SPECIFIEDSTART";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)videoSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertVideoSelector class]];
}

@end

@implementation AWSMediaconvertInsertableImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"fadeIn" : @"FadeIn",
             @"fadeOut" : @"FadeOut",
             @"height" : @"Height",
             @"imageInserterInput" : @"ImageInserterInput",
             @"imageX" : @"ImageX",
             @"imageY" : @"ImageY",
             @"layer" : @"Layer",
             @"opacity" : @"Opacity",
             @"startTime" : @"StartTime",
             @"width" : @"Width",
             };
}

@end

@implementation AWSMediaconvertJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accelerationSettings" : @"AccelerationSettings",
             @"accelerationStatus" : @"AccelerationStatus",
             @"arn" : @"Arn",
             @"billingTagsSource" : @"BillingTagsSource",
             @"createdAt" : @"CreatedAt",
             @"currentPhase" : @"CurrentPhase",
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"hopDestinations" : @"HopDestinations",
             @"identifier" : @"Id",
             @"jobPercentComplete" : @"JobPercentComplete",
             @"jobTemplate" : @"JobTemplate",
             @"messages" : @"Messages",
             @"outputGroupDetails" : @"OutputGroupDetails",
             @"priority" : @"Priority",
             @"queue" : @"Queue",
             @"queueTransitions" : @"QueueTransitions",
             @"retryCount" : @"RetryCount",
             @"role" : @"Role",
             @"settings" : @"Settings",
             @"simulateReservedQueue" : @"SimulateReservedQueue",
             @"status" : @"Status",
             @"statusUpdateInterval" : @"StatusUpdateInterval",
             @"timing" : @"Timing",
             @"userMetadata" : @"UserMetadata",
             };
}

+ (NSValueTransformer *)accelerationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAccelerationSettings class]];
}

+ (NSValueTransformer *)accelerationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_APPLICABLE"] == NSOrderedSame) {
            return @(AWSMediaconvertAccelerationStatusNotApplicable);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSMediaconvertAccelerationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"ACCELERATED"] == NSOrderedSame) {
            return @(AWSMediaconvertAccelerationStatusAccelerated);
        }
        if ([value caseInsensitiveCompare:@"NOT_ACCELERATED"] == NSOrderedSame) {
            return @(AWSMediaconvertAccelerationStatusNotAccelerated);
        }
        return @(AWSMediaconvertAccelerationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAccelerationStatusNotApplicable:
                return @"NOT_APPLICABLE";
            case AWSMediaconvertAccelerationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSMediaconvertAccelerationStatusAccelerated:
                return @"ACCELERATED";
            case AWSMediaconvertAccelerationStatusNotAccelerated:
                return @"NOT_ACCELERATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)billingTagsSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUE"] == NSOrderedSame) {
            return @(AWSMediaconvertBillingTagsSourceQueue);
        }
        if ([value caseInsensitiveCompare:@"PRESET"] == NSOrderedSame) {
            return @(AWSMediaconvertBillingTagsSourcePreset);
        }
        if ([value caseInsensitiveCompare:@"JOB_TEMPLATE"] == NSOrderedSame) {
            return @(AWSMediaconvertBillingTagsSourceJobTemplate);
        }
        if ([value caseInsensitiveCompare:@"JOB"] == NSOrderedSame) {
            return @(AWSMediaconvertBillingTagsSourceJob);
        }
        return @(AWSMediaconvertBillingTagsSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertBillingTagsSourceQueue:
                return @"QUEUE";
            case AWSMediaconvertBillingTagsSourcePreset:
                return @"PRESET";
            case AWSMediaconvertBillingTagsSourceJobTemplate:
                return @"JOB_TEMPLATE";
            case AWSMediaconvertBillingTagsSourceJob:
                return @"JOB";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)currentPhaseJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROBING"] == NSOrderedSame) {
            return @(AWSMediaconvertJobPhaseProbing);
        }
        if ([value caseInsensitiveCompare:@"TRANSCODING"] == NSOrderedSame) {
            return @(AWSMediaconvertJobPhaseTranscoding);
        }
        if ([value caseInsensitiveCompare:@"UPLOADING"] == NSOrderedSame) {
            return @(AWSMediaconvertJobPhaseUploading);
        }
        return @(AWSMediaconvertJobPhaseUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertJobPhaseProbing:
                return @"PROBING";
            case AWSMediaconvertJobPhaseTranscoding:
                return @"TRANSCODING";
            case AWSMediaconvertJobPhaseUploading:
                return @"UPLOADING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hopDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertHopDestination class]];
}

+ (NSValueTransformer *)messagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertJobMessages class]];
}

+ (NSValueTransformer *)outputGroupDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertOutputGroupDetail class]];
}

+ (NSValueTransformer *)queueTransitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertQueueTransition class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertJobSettings class]];
}

+ (NSValueTransformer *)simulateReservedQueueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertSimulateReservedQueueDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertSimulateReservedQueueEnabled);
        }
        return @(AWSMediaconvertSimulateReservedQueueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertSimulateReservedQueueDisabled:
                return @"DISABLED";
            case AWSMediaconvertSimulateReservedQueueEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSMediaconvertJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"PROGRESSING"] == NSOrderedSame) {
            return @(AWSMediaconvertJobStatusProgressing);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSMediaconvertJobStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSMediaconvertJobStatusCanceled);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSMediaconvertJobStatusError);
        }
        return @(AWSMediaconvertJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSMediaconvertJobStatusProgressing:
                return @"PROGRESSING";
            case AWSMediaconvertJobStatusComplete:
                return @"COMPLETE";
            case AWSMediaconvertJobStatusCanceled:
                return @"CANCELED";
            case AWSMediaconvertJobStatusError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusUpdateIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECONDS_10"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds10);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_12"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds12);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_15"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds15);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_20"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds20);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_30"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds30);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_60"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds60);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_120"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds120);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_180"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds180);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_240"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds240);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_300"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds300);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_360"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds360);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_420"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds420);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_480"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds480);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_540"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds540);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_600"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds600);
        }
        return @(AWSMediaconvertStatusUpdateIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertStatusUpdateIntervalSeconds10:
                return @"SECONDS_10";
            case AWSMediaconvertStatusUpdateIntervalSeconds12:
                return @"SECONDS_12";
            case AWSMediaconvertStatusUpdateIntervalSeconds15:
                return @"SECONDS_15";
            case AWSMediaconvertStatusUpdateIntervalSeconds20:
                return @"SECONDS_20";
            case AWSMediaconvertStatusUpdateIntervalSeconds30:
                return @"SECONDS_30";
            case AWSMediaconvertStatusUpdateIntervalSeconds60:
                return @"SECONDS_60";
            case AWSMediaconvertStatusUpdateIntervalSeconds120:
                return @"SECONDS_120";
            case AWSMediaconvertStatusUpdateIntervalSeconds180:
                return @"SECONDS_180";
            case AWSMediaconvertStatusUpdateIntervalSeconds240:
                return @"SECONDS_240";
            case AWSMediaconvertStatusUpdateIntervalSeconds300:
                return @"SECONDS_300";
            case AWSMediaconvertStatusUpdateIntervalSeconds360:
                return @"SECONDS_360";
            case AWSMediaconvertStatusUpdateIntervalSeconds420:
                return @"SECONDS_420";
            case AWSMediaconvertStatusUpdateIntervalSeconds480:
                return @"SECONDS_480";
            case AWSMediaconvertStatusUpdateIntervalSeconds540:
                return @"SECONDS_540";
            case AWSMediaconvertStatusUpdateIntervalSeconds600:
                return @"SECONDS_600";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertTiming class]];
}

@end

@implementation AWSMediaconvertJobMessages

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"info" : @"Info",
             @"warning" : @"Warning",
             };
}

@end

@implementation AWSMediaconvertJobSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adAvailOffset" : @"AdAvailOffset",
             @"availBlanking" : @"AvailBlanking",
             @"esam" : @"Esam",
             @"inputs" : @"Inputs",
             @"motionImageInserter" : @"MotionImageInserter",
             @"nielsenConfiguration" : @"NielsenConfiguration",
             @"outputGroups" : @"OutputGroups",
             @"timecodeConfig" : @"TimecodeConfig",
             @"timedMetadataInsertion" : @"TimedMetadataInsertion",
             };
}

+ (NSValueTransformer *)availBlankingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAvailBlanking class]];
}

+ (NSValueTransformer *)esamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertEsamSettings class]];
}

+ (NSValueTransformer *)inputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertInput class]];
}

+ (NSValueTransformer *)motionImageInserterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertMotionImageInserter class]];
}

+ (NSValueTransformer *)nielsenConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertNielsenConfiguration class]];
}

+ (NSValueTransformer *)outputGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertOutputGroup class]];
}

+ (NSValueTransformer *)timecodeConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertTimecodeConfig class]];
}

+ (NSValueTransformer *)timedMetadataInsertionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertTimedMetadataInsertion class]];
}

@end

@implementation AWSMediaconvertJobTemplate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accelerationSettings" : @"AccelerationSettings",
             @"arn" : @"Arn",
             @"category" : @"Category",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"hopDestinations" : @"HopDestinations",
             @"lastUpdated" : @"LastUpdated",
             @"name" : @"Name",
             @"priority" : @"Priority",
             @"queue" : @"Queue",
             @"settings" : @"Settings",
             @"statusUpdateInterval" : @"StatusUpdateInterval",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)accelerationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAccelerationSettings class]];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)hopDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertHopDestination class]];
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertJobTemplateSettings class]];
}

+ (NSValueTransformer *)statusUpdateIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECONDS_10"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds10);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_12"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds12);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_15"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds15);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_20"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds20);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_30"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds30);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_60"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds60);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_120"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds120);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_180"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds180);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_240"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds240);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_300"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds300);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_360"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds360);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_420"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds420);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_480"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds480);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_540"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds540);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_600"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds600);
        }
        return @(AWSMediaconvertStatusUpdateIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertStatusUpdateIntervalSeconds10:
                return @"SECONDS_10";
            case AWSMediaconvertStatusUpdateIntervalSeconds12:
                return @"SECONDS_12";
            case AWSMediaconvertStatusUpdateIntervalSeconds15:
                return @"SECONDS_15";
            case AWSMediaconvertStatusUpdateIntervalSeconds20:
                return @"SECONDS_20";
            case AWSMediaconvertStatusUpdateIntervalSeconds30:
                return @"SECONDS_30";
            case AWSMediaconvertStatusUpdateIntervalSeconds60:
                return @"SECONDS_60";
            case AWSMediaconvertStatusUpdateIntervalSeconds120:
                return @"SECONDS_120";
            case AWSMediaconvertStatusUpdateIntervalSeconds180:
                return @"SECONDS_180";
            case AWSMediaconvertStatusUpdateIntervalSeconds240:
                return @"SECONDS_240";
            case AWSMediaconvertStatusUpdateIntervalSeconds300:
                return @"SECONDS_300";
            case AWSMediaconvertStatusUpdateIntervalSeconds360:
                return @"SECONDS_360";
            case AWSMediaconvertStatusUpdateIntervalSeconds420:
                return @"SECONDS_420";
            case AWSMediaconvertStatusUpdateIntervalSeconds480:
                return @"SECONDS_480";
            case AWSMediaconvertStatusUpdateIntervalSeconds540:
                return @"SECONDS_540";
            case AWSMediaconvertStatusUpdateIntervalSeconds600:
                return @"SECONDS_600";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSMediaconvertTypesSystem);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSMediaconvertTypesCustom);
        }
        return @(AWSMediaconvertTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertTypesSystem:
                return @"SYSTEM";
            case AWSMediaconvertTypesCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertJobTemplateSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adAvailOffset" : @"AdAvailOffset",
             @"availBlanking" : @"AvailBlanking",
             @"esam" : @"Esam",
             @"inputs" : @"Inputs",
             @"motionImageInserter" : @"MotionImageInserter",
             @"nielsenConfiguration" : @"NielsenConfiguration",
             @"outputGroups" : @"OutputGroups",
             @"timecodeConfig" : @"TimecodeConfig",
             @"timedMetadataInsertion" : @"TimedMetadataInsertion",
             };
}

+ (NSValueTransformer *)availBlankingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAvailBlanking class]];
}

+ (NSValueTransformer *)esamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertEsamSettings class]];
}

+ (NSValueTransformer *)inputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertInputTemplate class]];
}

+ (NSValueTransformer *)motionImageInserterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertMotionImageInserter class]];
}

+ (NSValueTransformer *)nielsenConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertNielsenConfiguration class]];
}

+ (NSValueTransformer *)outputGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertOutputGroup class]];
}

+ (NSValueTransformer *)timecodeConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertTimecodeConfig class]];
}

+ (NSValueTransformer *)timedMetadataInsertionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertTimedMetadataInsertion class]];
}

@end

@implementation AWSMediaconvertListJobTemplatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"category" : @"Category",
             @"listBy" : @"ListBy",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"order" : @"Order",
             };
}

+ (NSValueTransformer *)listByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSMediaconvertJobTemplateListByName);
        }
        if ([value caseInsensitiveCompare:@"CREATION_DATE"] == NSOrderedSame) {
            return @(AWSMediaconvertJobTemplateListByCreationDate);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSMediaconvertJobTemplateListBySystem);
        }
        return @(AWSMediaconvertJobTemplateListByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertJobTemplateListByName:
                return @"NAME";
            case AWSMediaconvertJobTemplateListByCreationDate:
                return @"CREATION_DATE";
            case AWSMediaconvertJobTemplateListBySystem:
                return @"SYSTEM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)orderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSMediaconvertOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSMediaconvertOrderDescending);
        }
        return @(AWSMediaconvertOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertOrderAscending:
                return @"ASCENDING";
            case AWSMediaconvertOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertListJobTemplatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobTemplates" : @"JobTemplates",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobTemplatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertJobTemplate class]];
}

@end

@implementation AWSMediaconvertListJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"order" : @"Order",
             @"queue" : @"Queue",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)orderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSMediaconvertOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSMediaconvertOrderDescending);
        }
        return @(AWSMediaconvertOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertOrderAscending:
                return @"ASCENDING";
            case AWSMediaconvertOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSMediaconvertJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"PROGRESSING"] == NSOrderedSame) {
            return @(AWSMediaconvertJobStatusProgressing);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSMediaconvertJobStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSMediaconvertJobStatusCanceled);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSMediaconvertJobStatusError);
        }
        return @(AWSMediaconvertJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSMediaconvertJobStatusProgressing:
                return @"PROGRESSING";
            case AWSMediaconvertJobStatusComplete:
                return @"COMPLETE";
            case AWSMediaconvertJobStatusCanceled:
                return @"CANCELED";
            case AWSMediaconvertJobStatusError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertListJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobs" : @"Jobs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertJob class]];
}

@end

@implementation AWSMediaconvertListPresetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"category" : @"Category",
             @"listBy" : @"ListBy",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"order" : @"Order",
             };
}

+ (NSValueTransformer *)listByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSMediaconvertPresetListByName);
        }
        if ([value caseInsensitiveCompare:@"CREATION_DATE"] == NSOrderedSame) {
            return @(AWSMediaconvertPresetListByCreationDate);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSMediaconvertPresetListBySystem);
        }
        return @(AWSMediaconvertPresetListByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertPresetListByName:
                return @"NAME";
            case AWSMediaconvertPresetListByCreationDate:
                return @"CREATION_DATE";
            case AWSMediaconvertPresetListBySystem:
                return @"SYSTEM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)orderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSMediaconvertOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSMediaconvertOrderDescending);
        }
        return @(AWSMediaconvertOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertOrderAscending:
                return @"ASCENDING";
            case AWSMediaconvertOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertListPresetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"presets" : @"Presets",
             };
}

+ (NSValueTransformer *)presetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertPreset class]];
}

@end

@implementation AWSMediaconvertListQueuesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listBy" : @"ListBy",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"order" : @"Order",
             };
}

+ (NSValueTransformer *)listByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSMediaconvertQueueListByName);
        }
        if ([value caseInsensitiveCompare:@"CREATION_DATE"] == NSOrderedSame) {
            return @(AWSMediaconvertQueueListByCreationDate);
        }
        return @(AWSMediaconvertQueueListByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertQueueListByName:
                return @"NAME";
            case AWSMediaconvertQueueListByCreationDate:
                return @"CREATION_DATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)orderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSMediaconvertOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSMediaconvertOrderDescending);
        }
        return @(AWSMediaconvertOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertOrderAscending:
                return @"ASCENDING";
            case AWSMediaconvertOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertListQueuesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"queues" : @"Queues",
             };
}

+ (NSValueTransformer *)queuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertQueue class]];
}

@end

@implementation AWSMediaconvertListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSMediaconvertListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceTags" : @"ResourceTags",
             };
}

+ (NSValueTransformer *)resourceTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertResourceTags class]];
}

@end

@implementation AWSMediaconvertM2tsScte35Esam

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scte35EsamPid" : @"Scte35EsamPid",
             };
}

@end

@implementation AWSMediaconvertM2tsSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioBufferModel" : @"AudioBufferModel",
             @"audioFramesPerPes" : @"AudioFramesPerPes",
             @"audioPids" : @"AudioPids",
             @"bitrate" : @"Bitrate",
             @"bufferModel" : @"BufferModel",
             @"dvbNitSettings" : @"DvbNitSettings",
             @"dvbSdtSettings" : @"DvbSdtSettings",
             @"dvbSubPids" : @"DvbSubPids",
             @"dvbTdtSettings" : @"DvbTdtSettings",
             @"dvbTeletextPid" : @"DvbTeletextPid",
             @"ebpAudioInterval" : @"EbpAudioInterval",
             @"ebpPlacement" : @"EbpPlacement",
             @"esRateInPes" : @"EsRateInPes",
             @"forceTsVideoEbpOrder" : @"ForceTsVideoEbpOrder",
             @"fragmentTime" : @"FragmentTime",
             @"maxPcrInterval" : @"MaxPcrInterval",
             @"minEbpInterval" : @"MinEbpInterval",
             @"nielsenId3" : @"NielsenId3",
             @"nullPacketBitrate" : @"NullPacketBitrate",
             @"patInterval" : @"PatInterval",
             @"pcrControl" : @"PcrControl",
             @"pcrPid" : @"PcrPid",
             @"pmtInterval" : @"PmtInterval",
             @"pmtPid" : @"PmtPid",
             @"privateMetadataPid" : @"PrivateMetadataPid",
             @"programNumber" : @"ProgramNumber",
             @"rateMode" : @"RateMode",
             @"scte35Esam" : @"Scte35Esam",
             @"scte35Pid" : @"Scte35Pid",
             @"scte35Source" : @"Scte35Source",
             @"segmentationMarkers" : @"SegmentationMarkers",
             @"segmentationStyle" : @"SegmentationStyle",
             @"segmentationTime" : @"SegmentationTime",
             @"timedMetadataPid" : @"TimedMetadataPid",
             @"transportStreamId" : @"TransportStreamId",
             @"videoPid" : @"VideoPid",
             };
}

+ (NSValueTransformer *)audioBufferModelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DVB"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsAudioBufferModelDvb);
        }
        if ([value caseInsensitiveCompare:@"ATSC"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsAudioBufferModelAtsc);
        }
        return @(AWSMediaconvertM2tsAudioBufferModelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM2tsAudioBufferModelDvb:
                return @"DVB";
            case AWSMediaconvertM2tsAudioBufferModelAtsc:
                return @"ATSC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bufferModelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MULTIPLEX"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsBufferModelMultiplex);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsBufferModelNone);
        }
        return @(AWSMediaconvertM2tsBufferModelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM2tsBufferModelMultiplex:
                return @"MULTIPLEX";
            case AWSMediaconvertM2tsBufferModelNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dvbNitSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDvbNitSettings class]];
}

+ (NSValueTransformer *)dvbSdtSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDvbSdtSettings class]];
}

+ (NSValueTransformer *)dvbTdtSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDvbTdtSettings class]];
}

+ (NSValueTransformer *)ebpAudioIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VIDEO_AND_FIXED_INTERVALS"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsEbpAudioIntervalVideoAndFixedIntervals);
        }
        if ([value caseInsensitiveCompare:@"VIDEO_INTERVAL"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsEbpAudioIntervalVideoInterval);
        }
        return @(AWSMediaconvertM2tsEbpAudioIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM2tsEbpAudioIntervalVideoAndFixedIntervals:
                return @"VIDEO_AND_FIXED_INTERVALS";
            case AWSMediaconvertM2tsEbpAudioIntervalVideoInterval:
                return @"VIDEO_INTERVAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ebpPlacementJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VIDEO_AND_AUDIO_PIDS"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsEbpPlacementVideoAndAudioPids);
        }
        if ([value caseInsensitiveCompare:@"VIDEO_PID"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsEbpPlacementVideoPid);
        }
        return @(AWSMediaconvertM2tsEbpPlacementUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM2tsEbpPlacementVideoAndAudioPids:
                return @"VIDEO_AND_AUDIO_PIDS";
            case AWSMediaconvertM2tsEbpPlacementVideoPid:
                return @"VIDEO_PID";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)esRateInPesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsEsRateInPesInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsEsRateInPesExclude);
        }
        return @(AWSMediaconvertM2tsEsRateInPesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM2tsEsRateInPesInclude:
                return @"INCLUDE";
            case AWSMediaconvertM2tsEsRateInPesExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)forceTsVideoEbpOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FORCE"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsForceTsVideoEbpOrderForce);
        }
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsForceTsVideoEbpOrderDefault);
        }
        return @(AWSMediaconvertM2tsForceTsVideoEbpOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM2tsForceTsVideoEbpOrderForce:
                return @"FORCE";
            case AWSMediaconvertM2tsForceTsVideoEbpOrderDefault:
                return @"DEFAULT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nielsenId3JSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsNielsenId3Insert);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsNielsenId3None);
        }
        return @(AWSMediaconvertM2tsNielsenId3Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM2tsNielsenId3Insert:
                return @"INSERT";
            case AWSMediaconvertM2tsNielsenId3None:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pcrControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PCR_EVERY_PES_PACKET"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsPcrControlPcrEveryPesPacket);
        }
        if ([value caseInsensitiveCompare:@"CONFIGURED_PCR_PERIOD"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsPcrControlConfiguredPcrPeriod);
        }
        return @(AWSMediaconvertM2tsPcrControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM2tsPcrControlPcrEveryPesPacket:
                return @"PCR_EVERY_PES_PACKET";
            case AWSMediaconvertM2tsPcrControlConfiguredPcrPeriod:
                return @"CONFIGURED_PCR_PERIOD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsRateModeVbr);
        }
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsRateModeCbr);
        }
        return @(AWSMediaconvertM2tsRateModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM2tsRateModeVbr:
                return @"VBR";
            case AWSMediaconvertM2tsRateModeCbr:
                return @"CBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35EsamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertM2tsScte35Esam class]];
}

+ (NSValueTransformer *)scte35SourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsScte35SourcePassthrough);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsScte35SourceNone);
        }
        return @(AWSMediaconvertM2tsScte35SourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM2tsScte35SourcePassthrough:
                return @"PASSTHROUGH";
            case AWSMediaconvertM2tsScte35SourceNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentationMarkersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsSegmentationMarkersNone);
        }
        if ([value caseInsensitiveCompare:@"RAI_SEGSTART"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsSegmentationMarkersRaiSegstart);
        }
        if ([value caseInsensitiveCompare:@"RAI_ADAPT"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsSegmentationMarkersRaiAdapt);
        }
        if ([value caseInsensitiveCompare:@"PSI_SEGSTART"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsSegmentationMarkersPsiSegstart);
        }
        if ([value caseInsensitiveCompare:@"EBP"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsSegmentationMarkersEbp);
        }
        if ([value caseInsensitiveCompare:@"EBP_LEGACY"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsSegmentationMarkersEbpLegacy);
        }
        return @(AWSMediaconvertM2tsSegmentationMarkersUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM2tsSegmentationMarkersNone:
                return @"NONE";
            case AWSMediaconvertM2tsSegmentationMarkersRaiSegstart:
                return @"RAI_SEGSTART";
            case AWSMediaconvertM2tsSegmentationMarkersRaiAdapt:
                return @"RAI_ADAPT";
            case AWSMediaconvertM2tsSegmentationMarkersPsiSegstart:
                return @"PSI_SEGSTART";
            case AWSMediaconvertM2tsSegmentationMarkersEbp:
                return @"EBP";
            case AWSMediaconvertM2tsSegmentationMarkersEbpLegacy:
                return @"EBP_LEGACY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentationStyleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAINTAIN_CADENCE"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsSegmentationStyleMaintainCadence);
        }
        if ([value caseInsensitiveCompare:@"RESET_CADENCE"] == NSOrderedSame) {
            return @(AWSMediaconvertM2tsSegmentationStyleResetCadence);
        }
        return @(AWSMediaconvertM2tsSegmentationStyleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM2tsSegmentationStyleMaintainCadence:
                return @"MAINTAIN_CADENCE";
            case AWSMediaconvertM2tsSegmentationStyleResetCadence:
                return @"RESET_CADENCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertM3u8Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioFramesPerPes" : @"AudioFramesPerPes",
             @"audioPids" : @"AudioPids",
             @"nielsenId3" : @"NielsenId3",
             @"patInterval" : @"PatInterval",
             @"pcrControl" : @"PcrControl",
             @"pcrPid" : @"PcrPid",
             @"pmtInterval" : @"PmtInterval",
             @"pmtPid" : @"PmtPid",
             @"privateMetadataPid" : @"PrivateMetadataPid",
             @"programNumber" : @"ProgramNumber",
             @"scte35Pid" : @"Scte35Pid",
             @"scte35Source" : @"Scte35Source",
             @"timedMetadata" : @"TimedMetadata",
             @"timedMetadataPid" : @"TimedMetadataPid",
             @"transportStreamId" : @"TransportStreamId",
             @"videoPid" : @"VideoPid",
             };
}

+ (NSValueTransformer *)nielsenId3JSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSMediaconvertM3u8NielsenId3Insert);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertM3u8NielsenId3None);
        }
        return @(AWSMediaconvertM3u8NielsenId3Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM3u8NielsenId3Insert:
                return @"INSERT";
            case AWSMediaconvertM3u8NielsenId3None:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pcrControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PCR_EVERY_PES_PACKET"] == NSOrderedSame) {
            return @(AWSMediaconvertM3u8PcrControlPcrEveryPesPacket);
        }
        if ([value caseInsensitiveCompare:@"CONFIGURED_PCR_PERIOD"] == NSOrderedSame) {
            return @(AWSMediaconvertM3u8PcrControlConfiguredPcrPeriod);
        }
        return @(AWSMediaconvertM3u8PcrControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM3u8PcrControlPcrEveryPesPacket:
                return @"PCR_EVERY_PES_PACKET";
            case AWSMediaconvertM3u8PcrControlConfiguredPcrPeriod:
                return @"CONFIGURED_PCR_PERIOD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35SourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMediaconvertM3u8Scte35SourcePassthrough);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertM3u8Scte35SourceNone);
        }
        return @(AWSMediaconvertM3u8Scte35SourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertM3u8Scte35SourcePassthrough:
                return @"PASSTHROUGH";
            case AWSMediaconvertM3u8Scte35SourceNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMediaconvertTimedMetadataPassthrough);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertTimedMetadataNone);
        }
        return @(AWSMediaconvertTimedMetadataUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertTimedMetadataPassthrough:
                return @"PASSTHROUGH";
            case AWSMediaconvertTimedMetadataNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertMotionImageInserter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"framerate" : @"Framerate",
             @"input" : @"Input",
             @"insertionMode" : @"InsertionMode",
             @"offset" : @"Offset",
             @"playback" : @"Playback",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)framerateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertMotionImageInsertionFramerate class]];
}

+ (NSValueTransformer *)insertionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MOV"] == NSOrderedSame) {
            return @(AWSMediaconvertMotionImageInsertionModeMov);
        }
        if ([value caseInsensitiveCompare:@"PNG"] == NSOrderedSame) {
            return @(AWSMediaconvertMotionImageInsertionModePng);
        }
        return @(AWSMediaconvertMotionImageInsertionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMotionImageInsertionModeMov:
                return @"MOV";
            case AWSMediaconvertMotionImageInsertionModePng:
                return @"PNG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offsetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertMotionImageInsertionOffset class]];
}

+ (NSValueTransformer *)playbackJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONCE"] == NSOrderedSame) {
            return @(AWSMediaconvertMotionImagePlaybackOnce);
        }
        if ([value caseInsensitiveCompare:@"REPEAT"] == NSOrderedSame) {
            return @(AWSMediaconvertMotionImagePlaybackRepeat);
        }
        return @(AWSMediaconvertMotionImagePlaybackUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMotionImagePlaybackOnce:
                return @"ONCE";
            case AWSMediaconvertMotionImagePlaybackRepeat:
                return @"REPEAT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertMotionImageInsertionFramerate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             };
}

@end

@implementation AWSMediaconvertMotionImageInsertionOffset

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageX" : @"ImageX",
             @"imageY" : @"ImageY",
             };
}

@end

@implementation AWSMediaconvertMovSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clapAtom" : @"ClapAtom",
             @"cslgAtom" : @"CslgAtom",
             @"mpeg2FourCCControl" : @"Mpeg2FourCCControl",
             @"paddingControl" : @"PaddingControl",
             @"reference" : @"Reference",
             };
}

+ (NSValueTransformer *)clapAtomJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertMovClapAtomInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertMovClapAtomExclude);
        }
        return @(AWSMediaconvertMovClapAtomUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMovClapAtomInclude:
                return @"INCLUDE";
            case AWSMediaconvertMovClapAtomExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)cslgAtomJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertMovCslgAtomInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertMovCslgAtomExclude);
        }
        return @(AWSMediaconvertMovCslgAtomUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMovCslgAtomInclude:
                return @"INCLUDE";
            case AWSMediaconvertMovCslgAtomExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mpeg2FourCCControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"XDCAM"] == NSOrderedSame) {
            return @(AWSMediaconvertMovMpeg2FourCCControlXdcam);
        }
        if ([value caseInsensitiveCompare:@"MPEG"] == NSOrderedSame) {
            return @(AWSMediaconvertMovMpeg2FourCCControlMpeg);
        }
        return @(AWSMediaconvertMovMpeg2FourCCControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMovMpeg2FourCCControlXdcam:
                return @"XDCAM";
            case AWSMediaconvertMovMpeg2FourCCControlMpeg:
                return @"MPEG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)paddingControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OMNEON"] == NSOrderedSame) {
            return @(AWSMediaconvertMovPaddingControlOmneon);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertMovPaddingControlNone);
        }
        return @(AWSMediaconvertMovPaddingControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMovPaddingControlOmneon:
                return @"OMNEON";
            case AWSMediaconvertMovPaddingControlNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)referenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SELF_CONTAINED"] == NSOrderedSame) {
            return @(AWSMediaconvertMovReferenceSelfContained);
        }
        if ([value caseInsensitiveCompare:@"EXTERNAL"] == NSOrderedSame) {
            return @(AWSMediaconvertMovReferenceExternal);
        }
        return @(AWSMediaconvertMovReferenceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMovReferenceSelfContained:
                return @"SELF_CONTAINED";
            case AWSMediaconvertMovReferenceExternal:
                return @"EXTERNAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertMp2Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitrate" : @"Bitrate",
             @"channels" : @"Channels",
             @"sampleRate" : @"SampleRate",
             };
}

@end

@implementation AWSMediaconvertMp3Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitrate" : @"Bitrate",
             @"channels" : @"Channels",
             @"rateControlMode" : @"RateControlMode",
             @"sampleRate" : @"SampleRate",
             @"vbrQuality" : @"VbrQuality",
             };
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSMediaconvertMp3RateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSMediaconvertMp3RateControlModeVbr);
        }
        return @(AWSMediaconvertMp3RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMp3RateControlModeCbr:
                return @"CBR";
            case AWSMediaconvertMp3RateControlModeVbr:
                return @"VBR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertMp4Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cslgAtom" : @"CslgAtom",
             @"cttsVersion" : @"CttsVersion",
             @"freeSpaceBox" : @"FreeSpaceBox",
             @"moovPlacement" : @"MoovPlacement",
             @"mp4MajorBrand" : @"Mp4MajorBrand",
             };
}

+ (NSValueTransformer *)cslgAtomJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertMp4CslgAtomInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertMp4CslgAtomExclude);
        }
        return @(AWSMediaconvertMp4CslgAtomUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMp4CslgAtomInclude:
                return @"INCLUDE";
            case AWSMediaconvertMp4CslgAtomExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)freeSpaceBoxJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertMp4FreeSpaceBoxInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMediaconvertMp4FreeSpaceBoxExclude);
        }
        return @(AWSMediaconvertMp4FreeSpaceBoxUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMp4FreeSpaceBoxInclude:
                return @"INCLUDE";
            case AWSMediaconvertMp4FreeSpaceBoxExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)moovPlacementJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE_DOWNLOAD"] == NSOrderedSame) {
            return @(AWSMediaconvertMp4MoovPlacementProgressiveDownload);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSMediaconvertMp4MoovPlacementNormal);
        }
        return @(AWSMediaconvertMp4MoovPlacementUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMp4MoovPlacementProgressiveDownload:
                return @"PROGRESSIVE_DOWNLOAD";
            case AWSMediaconvertMp4MoovPlacementNormal:
                return @"NORMAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertMpdSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captionContainerType" : @"CaptionContainerType",
             @"scte35Esam" : @"Scte35Esam",
             @"scte35Source" : @"Scte35Source",
             };
}

+ (NSValueTransformer *)captionContainerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RAW"] == NSOrderedSame) {
            return @(AWSMediaconvertMpdCaptionContainerTypeRAW);
        }
        if ([value caseInsensitiveCompare:@"FRAGMENTED_MP4"] == NSOrderedSame) {
            return @(AWSMediaconvertMpdCaptionContainerTypeFragmentedMp4);
        }
        return @(AWSMediaconvertMpdCaptionContainerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpdCaptionContainerTypeRAW:
                return @"RAW";
            case AWSMediaconvertMpdCaptionContainerTypeFragmentedMp4:
                return @"FRAGMENTED_MP4";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35EsamJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSMediaconvertMpdScte35EsamInsert);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertMpdScte35EsamNone);
        }
        return @(AWSMediaconvertMpdScte35EsamUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpdScte35EsamInsert:
                return @"INSERT";
            case AWSMediaconvertMpdScte35EsamNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35SourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMediaconvertMpdScte35SourcePassthrough);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertMpdScte35SourceNone);
        }
        return @(AWSMediaconvertMpdScte35SourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpdScte35SourcePassthrough:
                return @"PASSTHROUGH";
            case AWSMediaconvertMpdScte35SourceNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertMpeg2Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adaptiveQuantization" : @"AdaptiveQuantization",
             @"bitrate" : @"Bitrate",
             @"codecLevel" : @"CodecLevel",
             @"codecProfile" : @"CodecProfile",
             @"dynamicSubGop" : @"DynamicSubGop",
             @"framerateControl" : @"FramerateControl",
             @"framerateConversionAlgorithm" : @"FramerateConversionAlgorithm",
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             @"gopClosedCadence" : @"GopClosedCadence",
             @"gopSize" : @"GopSize",
             @"gopSizeUnits" : @"GopSizeUnits",
             @"hrdBufferInitialFillPercentage" : @"HrdBufferInitialFillPercentage",
             @"hrdBufferSize" : @"HrdBufferSize",
             @"interlaceMode" : @"InterlaceMode",
             @"intraDcPrecision" : @"IntraDcPrecision",
             @"maxBitrate" : @"MaxBitrate",
             @"minIInterval" : @"MinIInterval",
             @"numberBFramesBetweenReferenceFrames" : @"NumberBFramesBetweenReferenceFrames",
             @"parControl" : @"ParControl",
             @"parDenominator" : @"ParDenominator",
             @"parNumerator" : @"ParNumerator",
             @"qualityTuningLevel" : @"QualityTuningLevel",
             @"rateControlMode" : @"RateControlMode",
             @"sceneChangeDetect" : @"SceneChangeDetect",
             @"slowPal" : @"SlowPal",
             @"softness" : @"Softness",
             @"spatialAdaptiveQuantization" : @"SpatialAdaptiveQuantization",
             @"syntax" : @"Syntax",
             @"telecine" : @"Telecine",
             @"temporalAdaptiveQuantization" : @"TemporalAdaptiveQuantization",
             };
}

+ (NSValueTransformer *)adaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2AdaptiveQuantizationOff);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2AdaptiveQuantizationLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2AdaptiveQuantizationMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2AdaptiveQuantizationHigh);
        }
        return @(AWSMediaconvertMpeg2AdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2AdaptiveQuantizationOff:
                return @"OFF";
            case AWSMediaconvertMpeg2AdaptiveQuantizationLow:
                return @"LOW";
            case AWSMediaconvertMpeg2AdaptiveQuantizationMedium:
                return @"MEDIUM";
            case AWSMediaconvertMpeg2AdaptiveQuantizationHigh:
                return @"HIGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2CodecLevelAuto);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2CodecLevelLow);
        }
        if ([value caseInsensitiveCompare:@"MAIN"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2CodecLevelMain);
        }
        if ([value caseInsensitiveCompare:@"HIGH1440"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2CodecLevelHigh1440);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2CodecLevelHigh);
        }
        return @(AWSMediaconvertMpeg2CodecLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2CodecLevelAuto:
                return @"AUTO";
            case AWSMediaconvertMpeg2CodecLevelLow:
                return @"LOW";
            case AWSMediaconvertMpeg2CodecLevelMain:
                return @"MAIN";
            case AWSMediaconvertMpeg2CodecLevelHigh1440:
                return @"HIGH1440";
            case AWSMediaconvertMpeg2CodecLevelHigh:
                return @"HIGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAIN"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2CodecProfileMain);
        }
        if ([value caseInsensitiveCompare:@"PROFILE_422"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2CodecProfileProfile422);
        }
        return @(AWSMediaconvertMpeg2CodecProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2CodecProfileMain:
                return @"MAIN";
            case AWSMediaconvertMpeg2CodecProfileProfile422:
                return @"PROFILE_422";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicSubGopJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADAPTIVE"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2DynamicSubGopAdaptive);
        }
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2DynamicSubGopStatic);
        }
        return @(AWSMediaconvertMpeg2DynamicSubGopUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2DynamicSubGopAdaptive:
                return @"ADAPTIVE";
            case AWSMediaconvertMpeg2DynamicSubGopStatic:
                return @"STATIC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2FramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2FramerateControlSpecified);
        }
        return @(AWSMediaconvertMpeg2FramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2FramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMediaconvertMpeg2FramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateConversionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUPLICATE_DROP"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2FramerateConversionAlgorithmDuplicateDrop);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2FramerateConversionAlgorithmInterpolate);
        }
        return @(AWSMediaconvertMpeg2FramerateConversionAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2FramerateConversionAlgorithmDuplicateDrop:
                return @"DUPLICATE_DROP";
            case AWSMediaconvertMpeg2FramerateConversionAlgorithmInterpolate:
                return @"INTERPOLATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopSizeUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAMES"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2GopSizeUnitsFrames);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2GopSizeUnitsSeconds);
        }
        return @(AWSMediaconvertMpeg2GopSizeUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2GopSizeUnitsFrames:
                return @"FRAMES";
            case AWSMediaconvertMpeg2GopSizeUnitsSeconds:
                return @"SECONDS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)interlaceModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2InterlaceModeProgressive);
        }
        if ([value caseInsensitiveCompare:@"TOP_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2InterlaceModeTopField);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2InterlaceModeBottomField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_TOP_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2InterlaceModeFollowTopField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2InterlaceModeFollowBottomField);
        }
        return @(AWSMediaconvertMpeg2InterlaceModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2InterlaceModeProgressive:
                return @"PROGRESSIVE";
            case AWSMediaconvertMpeg2InterlaceModeTopField:
                return @"TOP_FIELD";
            case AWSMediaconvertMpeg2InterlaceModeBottomField:
                return @"BOTTOM_FIELD";
            case AWSMediaconvertMpeg2InterlaceModeFollowTopField:
                return @"FOLLOW_TOP_FIELD";
            case AWSMediaconvertMpeg2InterlaceModeFollowBottomField:
                return @"FOLLOW_BOTTOM_FIELD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)intraDcPrecisionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2IntraDcPrecisionAuto);
        }
        if ([value caseInsensitiveCompare:@"INTRA_DC_PRECISION_8"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2IntraDcPrecisionIntraDcPrecision8);
        }
        if ([value caseInsensitiveCompare:@"INTRA_DC_PRECISION_9"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2IntraDcPrecisionIntraDcPrecision9);
        }
        if ([value caseInsensitiveCompare:@"INTRA_DC_PRECISION_10"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2IntraDcPrecisionIntraDcPrecision10);
        }
        if ([value caseInsensitiveCompare:@"INTRA_DC_PRECISION_11"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2IntraDcPrecisionIntraDcPrecision11);
        }
        return @(AWSMediaconvertMpeg2IntraDcPrecisionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2IntraDcPrecisionAuto:
                return @"AUTO";
            case AWSMediaconvertMpeg2IntraDcPrecisionIntraDcPrecision8:
                return @"INTRA_DC_PRECISION_8";
            case AWSMediaconvertMpeg2IntraDcPrecisionIntraDcPrecision9:
                return @"INTRA_DC_PRECISION_9";
            case AWSMediaconvertMpeg2IntraDcPrecisionIntraDcPrecision10:
                return @"INTRA_DC_PRECISION_10";
            case AWSMediaconvertMpeg2IntraDcPrecisionIntraDcPrecision11:
                return @"INTRA_DC_PRECISION_11";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2ParControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2ParControlSpecified);
        }
        return @(AWSMediaconvertMpeg2ParControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2ParControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMediaconvertMpeg2ParControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qualityTuningLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_PASS"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2QualityTuningLevelSinglePass);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PASS"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2QualityTuningLevelMultiPass);
        }
        return @(AWSMediaconvertMpeg2QualityTuningLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2QualityTuningLevelSinglePass:
                return @"SINGLE_PASS";
            case AWSMediaconvertMpeg2QualityTuningLevelMultiPass:
                return @"MULTI_PASS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2RateControlModeVbr);
        }
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2RateControlModeCbr);
        }
        return @(AWSMediaconvertMpeg2RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2RateControlModeVbr:
                return @"VBR";
            case AWSMediaconvertMpeg2RateControlModeCbr:
                return @"CBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sceneChangeDetectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2SceneChangeDetectDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2SceneChangeDetectEnabled);
        }
        return @(AWSMediaconvertMpeg2SceneChangeDetectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2SceneChangeDetectDisabled:
                return @"DISABLED";
            case AWSMediaconvertMpeg2SceneChangeDetectEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)slowPalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2SlowPalDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2SlowPalEnabled);
        }
        return @(AWSMediaconvertMpeg2SlowPalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2SlowPalDisabled:
                return @"DISABLED";
            case AWSMediaconvertMpeg2SlowPalEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spatialAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2SpatialAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2SpatialAdaptiveQuantizationEnabled);
        }
        return @(AWSMediaconvertMpeg2SpatialAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2SpatialAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSMediaconvertMpeg2SpatialAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)syntaxJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2SyntaxDefault);
        }
        if ([value caseInsensitiveCompare:@"D_10"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2SyntaxD10);
        }
        return @(AWSMediaconvertMpeg2SyntaxUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2SyntaxDefault:
                return @"DEFAULT";
            case AWSMediaconvertMpeg2SyntaxD10:
                return @"D_10";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)telecineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2TelecineNone);
        }
        if ([value caseInsensitiveCompare:@"SOFT"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2TelecineSoft);
        }
        if ([value caseInsensitiveCompare:@"HARD"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2TelecineHard);
        }
        return @(AWSMediaconvertMpeg2TelecineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2TelecineNone:
                return @"NONE";
            case AWSMediaconvertMpeg2TelecineSoft:
                return @"SOFT";
            case AWSMediaconvertMpeg2TelecineHard:
                return @"HARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)temporalAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2TemporalAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertMpeg2TemporalAdaptiveQuantizationEnabled);
        }
        return @(AWSMediaconvertMpeg2TemporalAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMpeg2TemporalAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSMediaconvertMpeg2TemporalAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertMsSmoothAdditionalManifest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestNameModifier" : @"ManifestNameModifier",
             @"selectedOutputs" : @"SelectedOutputs",
             };
}

@end

@implementation AWSMediaconvertMsSmoothEncryptionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spekeKeyProvider" : @"SpekeKeyProvider",
             };
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertSpekeKeyProvider class]];
}

@end

@implementation AWSMediaconvertMsSmoothGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalManifests" : @"AdditionalManifests",
             @"audioDeduplication" : @"AudioDeduplication",
             @"destination" : @"Destination",
             @"destinationSettings" : @"DestinationSettings",
             @"encryption" : @"Encryption",
             @"fragmentLength" : @"FragmentLength",
             @"manifestEncoding" : @"ManifestEncoding",
             };
}

+ (NSValueTransformer *)additionalManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertMsSmoothAdditionalManifest class]];
}

+ (NSValueTransformer *)audioDeduplicationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMBINE_DUPLICATE_STREAMS"] == NSOrderedSame) {
            return @(AWSMediaconvertMsSmoothAudioDeduplicationCombineDuplicateStreams);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertMsSmoothAudioDeduplicationNone);
        }
        return @(AWSMediaconvertMsSmoothAudioDeduplicationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMsSmoothAudioDeduplicationCombineDuplicateStreams:
                return @"COMBINE_DUPLICATE_STREAMS";
            case AWSMediaconvertMsSmoothAudioDeduplicationNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDestinationSettings class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertMsSmoothEncryptionSettings class]];
}

+ (NSValueTransformer *)manifestEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UTF8"] == NSOrderedSame) {
            return @(AWSMediaconvertMsSmoothManifestEncodingUtf8);
        }
        if ([value caseInsensitiveCompare:@"UTF16"] == NSOrderedSame) {
            return @(AWSMediaconvertMsSmoothManifestEncodingUtf16);
        }
        return @(AWSMediaconvertMsSmoothManifestEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMsSmoothManifestEncodingUtf8:
                return @"UTF8";
            case AWSMediaconvertMsSmoothManifestEncodingUtf16:
                return @"UTF16";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertMxfSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afdSignaling" : @"AfdSignaling",
             };
}

+ (NSValueTransformer *)afdSignalingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_COPY"] == NSOrderedSame) {
            return @(AWSMediaconvertMxfAfdSignalingNoCopy);
        }
        if ([value caseInsensitiveCompare:@"COPY_FROM_VIDEO"] == NSOrderedSame) {
            return @(AWSMediaconvertMxfAfdSignalingCopyFromVideo);
        }
        return @(AWSMediaconvertMxfAfdSignalingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertMxfAfdSignalingNoCopy:
                return @"NO_COPY";
            case AWSMediaconvertMxfAfdSignalingCopyFromVideo:
                return @"COPY_FROM_VIDEO";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertNielsenConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"breakoutCode" : @"BreakoutCode",
             @"distributorId" : @"DistributorId",
             };
}

@end

@implementation AWSMediaconvertNoiseReducer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"filterSettings" : @"FilterSettings",
             @"spatialFilterSettings" : @"SpatialFilterSettings",
             @"temporalFilterSettings" : @"TemporalFilterSettings",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BILATERAL"] == NSOrderedSame) {
            return @(AWSMediaconvertNoiseReducerFilterBilateral);
        }
        if ([value caseInsensitiveCompare:@"MEAN"] == NSOrderedSame) {
            return @(AWSMediaconvertNoiseReducerFilterMean);
        }
        if ([value caseInsensitiveCompare:@"GAUSSIAN"] == NSOrderedSame) {
            return @(AWSMediaconvertNoiseReducerFilterGaussian);
        }
        if ([value caseInsensitiveCompare:@"LANCZOS"] == NSOrderedSame) {
            return @(AWSMediaconvertNoiseReducerFilterLanczos);
        }
        if ([value caseInsensitiveCompare:@"SHARPEN"] == NSOrderedSame) {
            return @(AWSMediaconvertNoiseReducerFilterSharpen);
        }
        if ([value caseInsensitiveCompare:@"CONSERVE"] == NSOrderedSame) {
            return @(AWSMediaconvertNoiseReducerFilterConserve);
        }
        if ([value caseInsensitiveCompare:@"SPATIAL"] == NSOrderedSame) {
            return @(AWSMediaconvertNoiseReducerFilterSpatial);
        }
        if ([value caseInsensitiveCompare:@"TEMPORAL"] == NSOrderedSame) {
            return @(AWSMediaconvertNoiseReducerFilterTemporal);
        }
        return @(AWSMediaconvertNoiseReducerFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertNoiseReducerFilterBilateral:
                return @"BILATERAL";
            case AWSMediaconvertNoiseReducerFilterMean:
                return @"MEAN";
            case AWSMediaconvertNoiseReducerFilterGaussian:
                return @"GAUSSIAN";
            case AWSMediaconvertNoiseReducerFilterLanczos:
                return @"LANCZOS";
            case AWSMediaconvertNoiseReducerFilterSharpen:
                return @"SHARPEN";
            case AWSMediaconvertNoiseReducerFilterConserve:
                return @"CONSERVE";
            case AWSMediaconvertNoiseReducerFilterSpatial:
                return @"SPATIAL";
            case AWSMediaconvertNoiseReducerFilterTemporal:
                return @"TEMPORAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)filterSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertNoiseReducerFilterSettings class]];
}

+ (NSValueTransformer *)spatialFilterSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertNoiseReducerSpatialFilterSettings class]];
}

+ (NSValueTransformer *)temporalFilterSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertNoiseReducerTemporalFilterSettings class]];
}

@end

@implementation AWSMediaconvertNoiseReducerFilterSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"strength" : @"Strength",
             };
}

@end

@implementation AWSMediaconvertNoiseReducerSpatialFilterSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"postFilterSharpenStrength" : @"PostFilterSharpenStrength",
             @"speed" : @"Speed",
             @"strength" : @"Strength",
             };
}

@end

@implementation AWSMediaconvertNoiseReducerTemporalFilterSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggressiveMode" : @"AggressiveMode",
             @"postTemporalSharpening" : @"PostTemporalSharpening",
             @"speed" : @"Speed",
             @"strength" : @"Strength",
             };
}

+ (NSValueTransformer *)postTemporalSharpeningJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertNoiseFilterPostTemporalSharpeningDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertNoiseFilterPostTemporalSharpeningEnabled);
        }
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMediaconvertNoiseFilterPostTemporalSharpeningAuto);
        }
        return @(AWSMediaconvertNoiseFilterPostTemporalSharpeningUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertNoiseFilterPostTemporalSharpeningDisabled:
                return @"DISABLED";
            case AWSMediaconvertNoiseFilterPostTemporalSharpeningEnabled:
                return @"ENABLED";
            case AWSMediaconvertNoiseFilterPostTemporalSharpeningAuto:
                return @"AUTO";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertOpusSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitrate" : @"Bitrate",
             @"channels" : @"Channels",
             @"sampleRate" : @"SampleRate",
             };
}

@end

@implementation AWSMediaconvertOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioDescriptions" : @"AudioDescriptions",
             @"captionDescriptions" : @"CaptionDescriptions",
             @"containerSettings" : @"ContainerSettings",
             @"extension" : @"Extension",
             @"nameModifier" : @"NameModifier",
             @"outputSettings" : @"OutputSettings",
             @"preset" : @"Preset",
             @"videoDescription" : @"VideoDescription",
             };
}

+ (NSValueTransformer *)audioDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertAudioDescription class]];
}

+ (NSValueTransformer *)captionDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertCaptionDescription class]];
}

+ (NSValueTransformer *)containerSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertContainerSettings class]];
}

+ (NSValueTransformer *)outputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertOutputSettings class]];
}

+ (NSValueTransformer *)videoDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertVideoDescription class]];
}

@end

@implementation AWSMediaconvertOutputChannelMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputChannels" : @"InputChannels",
             };
}

@end

@implementation AWSMediaconvertOutputDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInMs" : @"DurationInMs",
             @"videoDetails" : @"VideoDetails",
             };
}

+ (NSValueTransformer *)videoDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertVideoDetail class]];
}

@end

@implementation AWSMediaconvertOutputGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customName" : @"CustomName",
             @"name" : @"Name",
             @"outputGroupSettings" : @"OutputGroupSettings",
             @"outputs" : @"Outputs",
             };
}

+ (NSValueTransformer *)outputGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertOutputGroupSettings class]];
}

+ (NSValueTransformer *)outputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertOutput class]];
}

@end

@implementation AWSMediaconvertOutputGroupDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputDetails" : @"OutputDetails",
             };
}

+ (NSValueTransformer *)outputDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertOutputDetail class]];
}

@end

@implementation AWSMediaconvertOutputGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cmafGroupSettings" : @"CmafGroupSettings",
             @"dashIsoGroupSettings" : @"DashIsoGroupSettings",
             @"fileGroupSettings" : @"FileGroupSettings",
             @"hlsGroupSettings" : @"HlsGroupSettings",
             @"msSmoothGroupSettings" : @"MsSmoothGroupSettings",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)cmafGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertCmafGroupSettings class]];
}

+ (NSValueTransformer *)dashIsoGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDashIsoGroupSettings class]];
}

+ (NSValueTransformer *)fileGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertFileGroupSettings class]];
}

+ (NSValueTransformer *)hlsGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertHlsGroupSettings class]];
}

+ (NSValueTransformer *)msSmoothGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertMsSmoothGroupSettings class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HLS_GROUP_SETTINGS"] == NSOrderedSame) {
            return @(AWSMediaconvertOutputGroupTypeHlsGroupSettings);
        }
        if ([value caseInsensitiveCompare:@"DASH_ISO_GROUP_SETTINGS"] == NSOrderedSame) {
            return @(AWSMediaconvertOutputGroupTypeDashIsoGroupSettings);
        }
        if ([value caseInsensitiveCompare:@"FILE_GROUP_SETTINGS"] == NSOrderedSame) {
            return @(AWSMediaconvertOutputGroupTypeFileGroupSettings);
        }
        if ([value caseInsensitiveCompare:@"MS_SMOOTH_GROUP_SETTINGS"] == NSOrderedSame) {
            return @(AWSMediaconvertOutputGroupTypeMsSmoothGroupSettings);
        }
        if ([value caseInsensitiveCompare:@"CMAF_GROUP_SETTINGS"] == NSOrderedSame) {
            return @(AWSMediaconvertOutputGroupTypeCmafGroupSettings);
        }
        return @(AWSMediaconvertOutputGroupTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertOutputGroupTypeHlsGroupSettings:
                return @"HLS_GROUP_SETTINGS";
            case AWSMediaconvertOutputGroupTypeDashIsoGroupSettings:
                return @"DASH_ISO_GROUP_SETTINGS";
            case AWSMediaconvertOutputGroupTypeFileGroupSettings:
                return @"FILE_GROUP_SETTINGS";
            case AWSMediaconvertOutputGroupTypeMsSmoothGroupSettings:
                return @"MS_SMOOTH_GROUP_SETTINGS";
            case AWSMediaconvertOutputGroupTypeCmafGroupSettings:
                return @"CMAF_GROUP_SETTINGS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hlsSettings" : @"HlsSettings",
             };
}

+ (NSValueTransformer *)hlsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertHlsSettings class]];
}

@end

@implementation AWSMediaconvertPreset

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"category" : @"Category",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"lastUpdated" : @"LastUpdated",
             @"name" : @"Name",
             @"settings" : @"Settings",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertPresetSettings class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSMediaconvertTypesSystem);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSMediaconvertTypesCustom);
        }
        return @(AWSMediaconvertTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertTypesSystem:
                return @"SYSTEM";
            case AWSMediaconvertTypesCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertPresetSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioDescriptions" : @"AudioDescriptions",
             @"captionDescriptions" : @"CaptionDescriptions",
             @"containerSettings" : @"ContainerSettings",
             @"videoDescription" : @"VideoDescription",
             };
}

+ (NSValueTransformer *)audioDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertAudioDescription class]];
}

+ (NSValueTransformer *)captionDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertCaptionDescriptionPreset class]];
}

+ (NSValueTransformer *)containerSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertContainerSettings class]];
}

+ (NSValueTransformer *)videoDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertVideoDescription class]];
}

@end

@implementation AWSMediaconvertProresSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codecProfile" : @"CodecProfile",
             @"framerateControl" : @"FramerateControl",
             @"framerateConversionAlgorithm" : @"FramerateConversionAlgorithm",
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             @"interlaceMode" : @"InterlaceMode",
             @"parControl" : @"ParControl",
             @"parDenominator" : @"ParDenominator",
             @"parNumerator" : @"ParNumerator",
             @"slowPal" : @"SlowPal",
             @"telecine" : @"Telecine",
             };
}

+ (NSValueTransformer *)codecProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APPLE_PRORES_422"] == NSOrderedSame) {
            return @(AWSMediaconvertProresCodecProfileAppleProres422);
        }
        if ([value caseInsensitiveCompare:@"APPLE_PRORES_422_HQ"] == NSOrderedSame) {
            return @(AWSMediaconvertProresCodecProfileAppleProres422Hq);
        }
        if ([value caseInsensitiveCompare:@"APPLE_PRORES_422_LT"] == NSOrderedSame) {
            return @(AWSMediaconvertProresCodecProfileAppleProres422Lt);
        }
        if ([value caseInsensitiveCompare:@"APPLE_PRORES_422_PROXY"] == NSOrderedSame) {
            return @(AWSMediaconvertProresCodecProfileAppleProres422Proxy);
        }
        return @(AWSMediaconvertProresCodecProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertProresCodecProfileAppleProres422:
                return @"APPLE_PRORES_422";
            case AWSMediaconvertProresCodecProfileAppleProres422Hq:
                return @"APPLE_PRORES_422_HQ";
            case AWSMediaconvertProresCodecProfileAppleProres422Lt:
                return @"APPLE_PRORES_422_LT";
            case AWSMediaconvertProresCodecProfileAppleProres422Proxy:
                return @"APPLE_PRORES_422_PROXY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertProresFramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMediaconvertProresFramerateControlSpecified);
        }
        return @(AWSMediaconvertProresFramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertProresFramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMediaconvertProresFramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateConversionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUPLICATE_DROP"] == NSOrderedSame) {
            return @(AWSMediaconvertProresFramerateConversionAlgorithmDuplicateDrop);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE"] == NSOrderedSame) {
            return @(AWSMediaconvertProresFramerateConversionAlgorithmInterpolate);
        }
        return @(AWSMediaconvertProresFramerateConversionAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertProresFramerateConversionAlgorithmDuplicateDrop:
                return @"DUPLICATE_DROP";
            case AWSMediaconvertProresFramerateConversionAlgorithmInterpolate:
                return @"INTERPOLATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)interlaceModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE"] == NSOrderedSame) {
            return @(AWSMediaconvertProresInterlaceModeProgressive);
        }
        if ([value caseInsensitiveCompare:@"TOP_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertProresInterlaceModeTopField);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertProresInterlaceModeBottomField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_TOP_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertProresInterlaceModeFollowTopField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSMediaconvertProresInterlaceModeFollowBottomField);
        }
        return @(AWSMediaconvertProresInterlaceModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertProresInterlaceModeProgressive:
                return @"PROGRESSIVE";
            case AWSMediaconvertProresInterlaceModeTopField:
                return @"TOP_FIELD";
            case AWSMediaconvertProresInterlaceModeBottomField:
                return @"BOTTOM_FIELD";
            case AWSMediaconvertProresInterlaceModeFollowTopField:
                return @"FOLLOW_TOP_FIELD";
            case AWSMediaconvertProresInterlaceModeFollowBottomField:
                return @"FOLLOW_BOTTOM_FIELD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertProresParControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMediaconvertProresParControlSpecified);
        }
        return @(AWSMediaconvertProresParControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertProresParControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMediaconvertProresParControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)slowPalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertProresSlowPalDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertProresSlowPalEnabled);
        }
        return @(AWSMediaconvertProresSlowPalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertProresSlowPalDisabled:
                return @"DISABLED";
            case AWSMediaconvertProresSlowPalEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)telecineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertProresTelecineNone);
        }
        if ([value caseInsensitiveCompare:@"HARD"] == NSOrderedSame) {
            return @(AWSMediaconvertProresTelecineHard);
        }
        return @(AWSMediaconvertProresTelecineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertProresTelecineNone:
                return @"NONE";
            case AWSMediaconvertProresTelecineHard:
                return @"HARD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertQueue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"lastUpdated" : @"LastUpdated",
             @"name" : @"Name",
             @"pricingPlan" : @"PricingPlan",
             @"progressingJobsCount" : @"ProgressingJobsCount",
             @"reservationPlan" : @"ReservationPlan",
             @"status" : @"Status",
             @"submittedJobsCount" : @"SubmittedJobsCount",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)pricingPlanJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ON_DEMAND"] == NSOrderedSame) {
            return @(AWSMediaconvertPricingPlanOnDemand);
        }
        if ([value caseInsensitiveCompare:@"RESERVED"] == NSOrderedSame) {
            return @(AWSMediaconvertPricingPlanReserved);
        }
        return @(AWSMediaconvertPricingPlanUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertPricingPlanOnDemand:
                return @"ON_DEMAND";
            case AWSMediaconvertPricingPlanReserved:
                return @"RESERVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)reservationPlanJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertReservationPlan class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSMediaconvertQueueStatusActive);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSMediaconvertQueueStatusPaused);
        }
        return @(AWSMediaconvertQueueStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertQueueStatusActive:
                return @"ACTIVE";
            case AWSMediaconvertQueueStatusPaused:
                return @"PAUSED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSMediaconvertTypesSystem);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSMediaconvertTypesCustom);
        }
        return @(AWSMediaconvertTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertTypesSystem:
                return @"SYSTEM";
            case AWSMediaconvertTypesCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertQueueTransition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationQueue" : @"DestinationQueue",
             @"sourceQueue" : @"SourceQueue",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSMediaconvertRectangle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"height" : @"Height",
             @"width" : @"Width",
             @"X" : @"X",
             @"Y" : @"Y",
             };
}

@end

@implementation AWSMediaconvertRemixSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelMapping" : @"ChannelMapping",
             @"channelsIn" : @"ChannelsIn",
             @"channelsOut" : @"ChannelsOut",
             };
}

+ (NSValueTransformer *)channelMappingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertChannelMapping class]];
}

@end

@implementation AWSMediaconvertReservationPlan

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitment" : @"Commitment",
             @"expiresAt" : @"ExpiresAt",
             @"purchasedAt" : @"PurchasedAt",
             @"renewalType" : @"RenewalType",
             @"reservedSlots" : @"ReservedSlots",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)commitmentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_YEAR"] == NSOrderedSame) {
            return @(AWSMediaconvertCommitmentOneYear);
        }
        return @(AWSMediaconvertCommitmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCommitmentOneYear:
                return @"ONE_YEAR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)expiresAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)purchasedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)renewalTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO_RENEW"] == NSOrderedSame) {
            return @(AWSMediaconvertRenewalTypeAutoRenew);
        }
        if ([value caseInsensitiveCompare:@"EXPIRE"] == NSOrderedSame) {
            return @(AWSMediaconvertRenewalTypeExpire);
        }
        return @(AWSMediaconvertRenewalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertRenewalTypeAutoRenew:
                return @"AUTO_RENEW";
            case AWSMediaconvertRenewalTypeExpire:
                return @"EXPIRE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSMediaconvertReservationPlanStatusActive);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSMediaconvertReservationPlanStatusExpired);
        }
        return @(AWSMediaconvertReservationPlanStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertReservationPlanStatusActive:
                return @"ACTIVE";
            case AWSMediaconvertReservationPlanStatusExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertReservationPlanSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitment" : @"Commitment",
             @"renewalType" : @"RenewalType",
             @"reservedSlots" : @"ReservedSlots",
             };
}

+ (NSValueTransformer *)commitmentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_YEAR"] == NSOrderedSame) {
            return @(AWSMediaconvertCommitmentOneYear);
        }
        return @(AWSMediaconvertCommitmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertCommitmentOneYear:
                return @"ONE_YEAR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)renewalTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO_RENEW"] == NSOrderedSame) {
            return @(AWSMediaconvertRenewalTypeAutoRenew);
        }
        if ([value caseInsensitiveCompare:@"EXPIRE"] == NSOrderedSame) {
            return @(AWSMediaconvertRenewalTypeExpire);
        }
        return @(AWSMediaconvertRenewalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertRenewalTypeAutoRenew:
                return @"AUTO_RENEW";
            case AWSMediaconvertRenewalTypeExpire:
                return @"EXPIRE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertResourceTags

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSMediaconvertS3DestinationAccessControl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cannedAcl" : @"CannedAcl",
             };
}

+ (NSValueTransformer *)cannedAclJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC_READ"] == NSOrderedSame) {
            return @(AWSMediaconvertS3ObjectCannedAclPublicRead);
        }
        if ([value caseInsensitiveCompare:@"AUTHENTICATED_READ"] == NSOrderedSame) {
            return @(AWSMediaconvertS3ObjectCannedAclAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"BUCKET_OWNER_READ"] == NSOrderedSame) {
            return @(AWSMediaconvertS3ObjectCannedAclBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"BUCKET_OWNER_FULL_CONTROL"] == NSOrderedSame) {
            return @(AWSMediaconvertS3ObjectCannedAclBucketOwnerFullControl);
        }
        return @(AWSMediaconvertS3ObjectCannedAclUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertS3ObjectCannedAclPublicRead:
                return @"PUBLIC_READ";
            case AWSMediaconvertS3ObjectCannedAclAuthenticatedRead:
                return @"AUTHENTICATED_READ";
            case AWSMediaconvertS3ObjectCannedAclBucketOwnerRead:
                return @"BUCKET_OWNER_READ";
            case AWSMediaconvertS3ObjectCannedAclBucketOwnerFullControl:
                return @"BUCKET_OWNER_FULL_CONTROL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertS3DestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessControl" : @"AccessControl",
             @"encryption" : @"Encryption",
             };
}

+ (NSValueTransformer *)accessControlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertS3DestinationAccessControl class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertS3EncryptionSettings class]];
}

@end

@implementation AWSMediaconvertS3EncryptionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionType" : @"EncryptionType",
             @"kmsKeyArn" : @"KmsKeyArn",
             };
}

+ (NSValueTransformer *)encryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVER_SIDE_ENCRYPTION_S3"] == NSOrderedSame) {
            return @(AWSMediaconvertS3ServerSideEncryptionTypeServerSideEncryptionS3);
        }
        if ([value caseInsensitiveCompare:@"SERVER_SIDE_ENCRYPTION_KMS"] == NSOrderedSame) {
            return @(AWSMediaconvertS3ServerSideEncryptionTypeServerSideEncryptionKms);
        }
        return @(AWSMediaconvertS3ServerSideEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertS3ServerSideEncryptionTypeServerSideEncryptionS3:
                return @"SERVER_SIDE_ENCRYPTION_S3";
            case AWSMediaconvertS3ServerSideEncryptionTypeServerSideEncryptionKms:
                return @"SERVER_SIDE_ENCRYPTION_KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertSccDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"framerate" : @"Framerate",
             };
}

+ (NSValueTransformer *)framerateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAMERATE_23_97"] == NSOrderedSame) {
            return @(AWSMediaconvertSccDestinationFramerateFramerate2397);
        }
        if ([value caseInsensitiveCompare:@"FRAMERATE_24"] == NSOrderedSame) {
            return @(AWSMediaconvertSccDestinationFramerateFramerate24);
        }
        if ([value caseInsensitiveCompare:@"FRAMERATE_25"] == NSOrderedSame) {
            return @(AWSMediaconvertSccDestinationFramerateFramerate25);
        }
        if ([value caseInsensitiveCompare:@"FRAMERATE_29_97_DROPFRAME"] == NSOrderedSame) {
            return @(AWSMediaconvertSccDestinationFramerateFramerate2997Dropframe);
        }
        if ([value caseInsensitiveCompare:@"FRAMERATE_29_97_NON_DROPFRAME"] == NSOrderedSame) {
            return @(AWSMediaconvertSccDestinationFramerateFramerate2997NonDropframe);
        }
        return @(AWSMediaconvertSccDestinationFramerateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertSccDestinationFramerateFramerate2397:
                return @"FRAMERATE_23_97";
            case AWSMediaconvertSccDestinationFramerateFramerate24:
                return @"FRAMERATE_24";
            case AWSMediaconvertSccDestinationFramerateFramerate25:
                return @"FRAMERATE_25";
            case AWSMediaconvertSccDestinationFramerateFramerate2997Dropframe:
                return @"FRAMERATE_29_97_DROPFRAME";
            case AWSMediaconvertSccDestinationFramerateFramerate2997NonDropframe:
                return @"FRAMERATE_29_97_NON_DROPFRAME";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertSpekeKeyProvider

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             @"resourceId" : @"ResourceId",
             @"systemIds" : @"SystemIds",
             @"url" : @"Url",
             };
}

@end

@implementation AWSMediaconvertSpekeKeyProviderCmaf

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             @"dashSignaledSystemIds" : @"DashSignaledSystemIds",
             @"hlsSignaledSystemIds" : @"HlsSignaledSystemIds",
             @"resourceId" : @"ResourceId",
             @"url" : @"Url",
             };
}

@end

@implementation AWSMediaconvertStaticKeyProvider

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyFormat" : @"KeyFormat",
             @"keyFormatVersions" : @"KeyFormatVersions",
             @"staticKeyValue" : @"StaticKeyValue",
             @"url" : @"Url",
             };
}

@end

@implementation AWSMediaconvertTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSMediaconvertTagResourceResponse

@end

@implementation AWSMediaconvertTeletextDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageNumber" : @"PageNumber",
             @"pageTypes" : @"PageTypes",
             };
}

@end

@implementation AWSMediaconvertTeletextSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageNumber" : @"PageNumber",
             };
}

@end

@implementation AWSMediaconvertTimecodeBurnin

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fontSize" : @"FontSize",
             @"position" : @"Position",
             @"prefix" : @"Prefix",
             };
}

+ (NSValueTransformer *)positionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TOP_CENTER"] == NSOrderedSame) {
            return @(AWSMediaconvertTimecodeBurninPositionTopCenter);
        }
        if ([value caseInsensitiveCompare:@"TOP_LEFT"] == NSOrderedSame) {
            return @(AWSMediaconvertTimecodeBurninPositionTopLeft);
        }
        if ([value caseInsensitiveCompare:@"TOP_RIGHT"] == NSOrderedSame) {
            return @(AWSMediaconvertTimecodeBurninPositionTopRight);
        }
        if ([value caseInsensitiveCompare:@"MIDDLE_LEFT"] == NSOrderedSame) {
            return @(AWSMediaconvertTimecodeBurninPositionMiddleLeft);
        }
        if ([value caseInsensitiveCompare:@"MIDDLE_CENTER"] == NSOrderedSame) {
            return @(AWSMediaconvertTimecodeBurninPositionMiddleCenter);
        }
        if ([value caseInsensitiveCompare:@"MIDDLE_RIGHT"] == NSOrderedSame) {
            return @(AWSMediaconvertTimecodeBurninPositionMiddleRight);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_LEFT"] == NSOrderedSame) {
            return @(AWSMediaconvertTimecodeBurninPositionBottomLeft);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_CENTER"] == NSOrderedSame) {
            return @(AWSMediaconvertTimecodeBurninPositionBottomCenter);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_RIGHT"] == NSOrderedSame) {
            return @(AWSMediaconvertTimecodeBurninPositionBottomRight);
        }
        return @(AWSMediaconvertTimecodeBurninPositionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertTimecodeBurninPositionTopCenter:
                return @"TOP_CENTER";
            case AWSMediaconvertTimecodeBurninPositionTopLeft:
                return @"TOP_LEFT";
            case AWSMediaconvertTimecodeBurninPositionTopRight:
                return @"TOP_RIGHT";
            case AWSMediaconvertTimecodeBurninPositionMiddleLeft:
                return @"MIDDLE_LEFT";
            case AWSMediaconvertTimecodeBurninPositionMiddleCenter:
                return @"MIDDLE_CENTER";
            case AWSMediaconvertTimecodeBurninPositionMiddleRight:
                return @"MIDDLE_RIGHT";
            case AWSMediaconvertTimecodeBurninPositionBottomLeft:
                return @"BOTTOM_LEFT";
            case AWSMediaconvertTimecodeBurninPositionBottomCenter:
                return @"BOTTOM_CENTER";
            case AWSMediaconvertTimecodeBurninPositionBottomRight:
                return @"BOTTOM_RIGHT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertTimecodeConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"anchor" : @"Anchor",
             @"source" : @"Source",
             @"start" : @"Start",
             @"timestampOffset" : @"TimestampOffset",
             };
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMBEDDED"] == NSOrderedSame) {
            return @(AWSMediaconvertTimecodeSourceEmbedded);
        }
        if ([value caseInsensitiveCompare:@"ZEROBASED"] == NSOrderedSame) {
            return @(AWSMediaconvertTimecodeSourceZerobased);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIEDSTART"] == NSOrderedSame) {
            return @(AWSMediaconvertTimecodeSourceSpecifiedstart);
        }
        return @(AWSMediaconvertTimecodeSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertTimecodeSourceEmbedded:
                return @"EMBEDDED";
            case AWSMediaconvertTimecodeSourceZerobased:
                return @"ZEROBASED";
            case AWSMediaconvertTimecodeSourceSpecifiedstart:
                return @"SPECIFIEDSTART";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertTimedMetadataInsertion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"id3Insertions" : @"Id3Insertions",
             };
}

+ (NSValueTransformer *)id3InsertionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertId3Insertion class]];
}

@end

@implementation AWSMediaconvertTiming

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"finishTime" : @"FinishTime",
             @"startTime" : @"StartTime",
             @"submitTime" : @"SubmitTime",
             };
}

+ (NSValueTransformer *)finishTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSMediaconvertTrackSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trackNumber" : @"TrackNumber",
             };
}

@end

@implementation AWSMediaconvertTtmlDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stylePassthrough" : @"StylePassthrough",
             };
}

+ (NSValueTransformer *)stylePassthroughJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertTtmlStylePassthroughEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertTtmlStylePassthroughDisabled);
        }
        return @(AWSMediaconvertTtmlStylePassthroughUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertTtmlStylePassthroughEnabled:
                return @"ENABLED";
            case AWSMediaconvertTtmlStylePassthroughDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSMediaconvertUntagResourceResponse

@end

@implementation AWSMediaconvertUpdateJobTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accelerationSettings" : @"AccelerationSettings",
             @"category" : @"Category",
             @"detail" : @"Description",
             @"hopDestinations" : @"HopDestinations",
             @"name" : @"Name",
             @"priority" : @"Priority",
             @"queue" : @"Queue",
             @"settings" : @"Settings",
             @"statusUpdateInterval" : @"StatusUpdateInterval",
             };
}

+ (NSValueTransformer *)accelerationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAccelerationSettings class]];
}

+ (NSValueTransformer *)hopDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediaconvertHopDestination class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertJobTemplateSettings class]];
}

+ (NSValueTransformer *)statusUpdateIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECONDS_10"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds10);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_12"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds12);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_15"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds15);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_20"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds20);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_30"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds30);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_60"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds60);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_120"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds120);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_180"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds180);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_240"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds240);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_300"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds300);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_360"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds360);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_420"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds420);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_480"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds480);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_540"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds540);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_600"] == NSOrderedSame) {
            return @(AWSMediaconvertStatusUpdateIntervalSeconds600);
        }
        return @(AWSMediaconvertStatusUpdateIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertStatusUpdateIntervalSeconds10:
                return @"SECONDS_10";
            case AWSMediaconvertStatusUpdateIntervalSeconds12:
                return @"SECONDS_12";
            case AWSMediaconvertStatusUpdateIntervalSeconds15:
                return @"SECONDS_15";
            case AWSMediaconvertStatusUpdateIntervalSeconds20:
                return @"SECONDS_20";
            case AWSMediaconvertStatusUpdateIntervalSeconds30:
                return @"SECONDS_30";
            case AWSMediaconvertStatusUpdateIntervalSeconds60:
                return @"SECONDS_60";
            case AWSMediaconvertStatusUpdateIntervalSeconds120:
                return @"SECONDS_120";
            case AWSMediaconvertStatusUpdateIntervalSeconds180:
                return @"SECONDS_180";
            case AWSMediaconvertStatusUpdateIntervalSeconds240:
                return @"SECONDS_240";
            case AWSMediaconvertStatusUpdateIntervalSeconds300:
                return @"SECONDS_300";
            case AWSMediaconvertStatusUpdateIntervalSeconds360:
                return @"SECONDS_360";
            case AWSMediaconvertStatusUpdateIntervalSeconds420:
                return @"SECONDS_420";
            case AWSMediaconvertStatusUpdateIntervalSeconds480:
                return @"SECONDS_480";
            case AWSMediaconvertStatusUpdateIntervalSeconds540:
                return @"SECONDS_540";
            case AWSMediaconvertStatusUpdateIntervalSeconds600:
                return @"SECONDS_600";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertUpdateJobTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobTemplate" : @"JobTemplate",
             };
}

+ (NSValueTransformer *)jobTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertJobTemplate class]];
}

@end

@implementation AWSMediaconvertUpdatePresetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"category" : @"Category",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"settings" : @"Settings",
             };
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertPresetSettings class]];
}

@end

@implementation AWSMediaconvertUpdatePresetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"preset" : @"Preset",
             };
}

+ (NSValueTransformer *)presetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertPreset class]];
}

@end

@implementation AWSMediaconvertUpdateQueueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             @"reservationPlanSettings" : @"ReservationPlanSettings",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)reservationPlanSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertReservationPlanSettings class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSMediaconvertQueueStatusActive);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSMediaconvertQueueStatusPaused);
        }
        return @(AWSMediaconvertQueueStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertQueueStatusActive:
                return @"ACTIVE";
            case AWSMediaconvertQueueStatusPaused:
                return @"PAUSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertUpdateQueueResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queue" : @"Queue",
             };
}

+ (NSValueTransformer *)queueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertQueue class]];
}

@end

@implementation AWSMediaconvertVideoCodecSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"av1Settings" : @"Av1Settings",
             @"codec" : @"Codec",
             @"frameCaptureSettings" : @"FrameCaptureSettings",
             @"h264Settings" : @"H264Settings",
             @"h265Settings" : @"H265Settings",
             @"mpeg2Settings" : @"Mpeg2Settings",
             @"proresSettings" : @"ProresSettings",
             @"vp8Settings" : @"Vp8Settings",
             @"vp9Settings" : @"Vp9Settings",
             };
}

+ (NSValueTransformer *)av1SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertAv1Settings class]];
}

+ (NSValueTransformer *)codecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAME_CAPTURE"] == NSOrderedSame) {
            return @(AWSMediaconvertVideoCodecFrameCapture);
        }
        if ([value caseInsensitiveCompare:@"AV1"] == NSOrderedSame) {
            return @(AWSMediaconvertVideoCodecAv1);
        }
        if ([value caseInsensitiveCompare:@"H_264"] == NSOrderedSame) {
            return @(AWSMediaconvertVideoCodecH264);
        }
        if ([value caseInsensitiveCompare:@"H_265"] == NSOrderedSame) {
            return @(AWSMediaconvertVideoCodecH265);
        }
        if ([value caseInsensitiveCompare:@"MPEG2"] == NSOrderedSame) {
            return @(AWSMediaconvertVideoCodecMpeg2);
        }
        if ([value caseInsensitiveCompare:@"PRORES"] == NSOrderedSame) {
            return @(AWSMediaconvertVideoCodecProres);
        }
        if ([value caseInsensitiveCompare:@"VP8"] == NSOrderedSame) {
            return @(AWSMediaconvertVideoCodecVp8);
        }
        if ([value caseInsensitiveCompare:@"VP9"] == NSOrderedSame) {
            return @(AWSMediaconvertVideoCodecVp9);
        }
        return @(AWSMediaconvertVideoCodecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertVideoCodecFrameCapture:
                return @"FRAME_CAPTURE";
            case AWSMediaconvertVideoCodecAv1:
                return @"AV1";
            case AWSMediaconvertVideoCodecH264:
                return @"H_264";
            case AWSMediaconvertVideoCodecH265:
                return @"H_265";
            case AWSMediaconvertVideoCodecMpeg2:
                return @"MPEG2";
            case AWSMediaconvertVideoCodecProres:
                return @"PRORES";
            case AWSMediaconvertVideoCodecVp8:
                return @"VP8";
            case AWSMediaconvertVideoCodecVp9:
                return @"VP9";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)frameCaptureSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertFrameCaptureSettings class]];
}

+ (NSValueTransformer *)h264SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertH264Settings class]];
}

+ (NSValueTransformer *)h265SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertH265Settings class]];
}

+ (NSValueTransformer *)mpeg2SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertMpeg2Settings class]];
}

+ (NSValueTransformer *)proresSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertProresSettings class]];
}

+ (NSValueTransformer *)vp8SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertVp8Settings class]];
}

+ (NSValueTransformer *)vp9SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertVp9Settings class]];
}

@end

@implementation AWSMediaconvertVideoDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afdSignaling" : @"AfdSignaling",
             @"antiAlias" : @"AntiAlias",
             @"codecSettings" : @"CodecSettings",
             @"colorMetadata" : @"ColorMetadata",
             @"crop" : @"Crop",
             @"dropFrameTimecode" : @"DropFrameTimecode",
             @"fixedAfd" : @"FixedAfd",
             @"height" : @"Height",
             @"position" : @"Position",
             @"respondToAfd" : @"RespondToAfd",
             @"scalingBehavior" : @"ScalingBehavior",
             @"sharpness" : @"Sharpness",
             @"timecodeInsertion" : @"TimecodeInsertion",
             @"videoPreprocessors" : @"VideoPreprocessors",
             @"width" : @"Width",
             };
}

+ (NSValueTransformer *)afdSignalingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertAfdSignalingNone);
        }
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMediaconvertAfdSignalingAuto);
        }
        if ([value caseInsensitiveCompare:@"FIXED"] == NSOrderedSame) {
            return @(AWSMediaconvertAfdSignalingFixed);
        }
        return @(AWSMediaconvertAfdSignalingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAfdSignalingNone:
                return @"NONE";
            case AWSMediaconvertAfdSignalingAuto:
                return @"AUTO";
            case AWSMediaconvertAfdSignalingFixed:
                return @"FIXED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)antiAliasJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertAntiAliasDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertAntiAliasEnabled);
        }
        return @(AWSMediaconvertAntiAliasUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAntiAliasDisabled:
                return @"DISABLED";
            case AWSMediaconvertAntiAliasEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertVideoCodecSettings class]];
}

+ (NSValueTransformer *)colorMetadataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSMediaconvertColorMetadataIgnore);
        }
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSMediaconvertColorMetadataInsert);
        }
        return @(AWSMediaconvertColorMetadataUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertColorMetadataIgnore:
                return @"IGNORE";
            case AWSMediaconvertColorMetadataInsert:
                return @"INSERT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)cropJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertRectangle class]];
}

+ (NSValueTransformer *)dropFrameTimecodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertDropFrameTimecodeDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertDropFrameTimecodeEnabled);
        }
        return @(AWSMediaconvertDropFrameTimecodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertDropFrameTimecodeDisabled:
                return @"DISABLED";
            case AWSMediaconvertDropFrameTimecodeEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)positionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertRectangle class]];
}

+ (NSValueTransformer *)respondToAfdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMediaconvertRespondToAfdNone);
        }
        if ([value caseInsensitiveCompare:@"RESPOND"] == NSOrderedSame) {
            return @(AWSMediaconvertRespondToAfdRespond);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMediaconvertRespondToAfdPassthrough);
        }
        return @(AWSMediaconvertRespondToAfdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertRespondToAfdNone:
                return @"NONE";
            case AWSMediaconvertRespondToAfdRespond:
                return @"RESPOND";
            case AWSMediaconvertRespondToAfdPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scalingBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSMediaconvertScalingBehaviorDefault);
        }
        if ([value caseInsensitiveCompare:@"STRETCH_TO_OUTPUT"] == NSOrderedSame) {
            return @(AWSMediaconvertScalingBehaviorStretchToOutput);
        }
        return @(AWSMediaconvertScalingBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertScalingBehaviorDefault:
                return @"DEFAULT";
            case AWSMediaconvertScalingBehaviorStretchToOutput:
                return @"STRETCH_TO_OUTPUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timecodeInsertionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMediaconvertVideoTimecodeInsertionDisabled);
        }
        if ([value caseInsensitiveCompare:@"PIC_TIMING_SEI"] == NSOrderedSame) {
            return @(AWSMediaconvertVideoTimecodeInsertionPicTimingSei);
        }
        return @(AWSMediaconvertVideoTimecodeInsertionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertVideoTimecodeInsertionDisabled:
                return @"DISABLED";
            case AWSMediaconvertVideoTimecodeInsertionPicTimingSei:
                return @"PIC_TIMING_SEI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)videoPreprocessorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertVideoPreprocessor class]];
}

@end

@implementation AWSMediaconvertVideoDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"heightInPx" : @"HeightInPx",
             @"widthInPx" : @"WidthInPx",
             };
}

@end

@implementation AWSMediaconvertVideoPreprocessor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"colorCorrector" : @"ColorCorrector",
             @"deinterlacer" : @"Deinterlacer",
             @"dolbyVision" : @"DolbyVision",
             @"imageInserter" : @"ImageInserter",
             @"noiseReducer" : @"NoiseReducer",
             @"timecodeBurnin" : @"TimecodeBurnin",
             };
}

+ (NSValueTransformer *)colorCorrectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertColorCorrector class]];
}

+ (NSValueTransformer *)deinterlacerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDeinterlacer class]];
}

+ (NSValueTransformer *)dolbyVisionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertDolbyVision class]];
}

+ (NSValueTransformer *)imageInserterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertImageInserter class]];
}

+ (NSValueTransformer *)noiseReducerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertNoiseReducer class]];
}

+ (NSValueTransformer *)timecodeBurninJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertTimecodeBurnin class]];
}

@end

@implementation AWSMediaconvertVideoSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alphaBehavior" : @"AlphaBehavior",
             @"colorSpace" : @"ColorSpace",
             @"colorSpaceUsage" : @"ColorSpaceUsage",
             @"hdr10Metadata" : @"Hdr10Metadata",
             @"pid" : @"Pid",
             @"programNumber" : @"ProgramNumber",
             @"rotate" : @"Rotate",
             };
}

+ (NSValueTransformer *)alphaBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISCARD"] == NSOrderedSame) {
            return @(AWSMediaconvertAlphaBehaviorDiscard);
        }
        if ([value caseInsensitiveCompare:@"REMAP_TO_LUMA"] == NSOrderedSame) {
            return @(AWSMediaconvertAlphaBehaviorRemapToLuma);
        }
        return @(AWSMediaconvertAlphaBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertAlphaBehaviorDiscard:
                return @"DISCARD";
            case AWSMediaconvertAlphaBehaviorRemapToLuma:
                return @"REMAP_TO_LUMA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorSpaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW"] == NSOrderedSame) {
            return @(AWSMediaconvertColorSpaceFollow);
        }
        if ([value caseInsensitiveCompare:@"REC_601"] == NSOrderedSame) {
            return @(AWSMediaconvertColorSpaceRec601);
        }
        if ([value caseInsensitiveCompare:@"REC_709"] == NSOrderedSame) {
            return @(AWSMediaconvertColorSpaceRec709);
        }
        if ([value caseInsensitiveCompare:@"HDR10"] == NSOrderedSame) {
            return @(AWSMediaconvertColorSpaceHdr10);
        }
        if ([value caseInsensitiveCompare:@"HLG_2020"] == NSOrderedSame) {
            return @(AWSMediaconvertColorSpaceHlg2020);
        }
        return @(AWSMediaconvertColorSpaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertColorSpaceFollow:
                return @"FOLLOW";
            case AWSMediaconvertColorSpaceRec601:
                return @"REC_601";
            case AWSMediaconvertColorSpaceRec709:
                return @"REC_709";
            case AWSMediaconvertColorSpaceHdr10:
                return @"HDR10";
            case AWSMediaconvertColorSpaceHlg2020:
                return @"HLG_2020";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorSpaceUsageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FORCE"] == NSOrderedSame) {
            return @(AWSMediaconvertColorSpaceUsageForce);
        }
        if ([value caseInsensitiveCompare:@"FALLBACK"] == NSOrderedSame) {
            return @(AWSMediaconvertColorSpaceUsageFallback);
        }
        return @(AWSMediaconvertColorSpaceUsageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertColorSpaceUsageForce:
                return @"FORCE";
            case AWSMediaconvertColorSpaceUsageFallback:
                return @"FALLBACK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hdr10MetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediaconvertHdr10Metadata class]];
}

+ (NSValueTransformer *)rotateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEGREE_0"] == NSOrderedSame) {
            return @(AWSMediaconvertInputRotateDegree0);
        }
        if ([value caseInsensitiveCompare:@"DEGREES_90"] == NSOrderedSame) {
            return @(AWSMediaconvertInputRotateDegrees90);
        }
        if ([value caseInsensitiveCompare:@"DEGREES_180"] == NSOrderedSame) {
            return @(AWSMediaconvertInputRotateDegrees180);
        }
        if ([value caseInsensitiveCompare:@"DEGREES_270"] == NSOrderedSame) {
            return @(AWSMediaconvertInputRotateDegrees270);
        }
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMediaconvertInputRotateAuto);
        }
        return @(AWSMediaconvertInputRotateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertInputRotateDegree0:
                return @"DEGREE_0";
            case AWSMediaconvertInputRotateDegrees90:
                return @"DEGREES_90";
            case AWSMediaconvertInputRotateDegrees180:
                return @"DEGREES_180";
            case AWSMediaconvertInputRotateDegrees270:
                return @"DEGREES_270";
            case AWSMediaconvertInputRotateAuto:
                return @"AUTO";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertVorbisSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             @"sampleRate" : @"SampleRate",
             @"vbrQuality" : @"VbrQuality",
             };
}

@end

@implementation AWSMediaconvertVp8Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitrate" : @"Bitrate",
             @"framerateControl" : @"FramerateControl",
             @"framerateConversionAlgorithm" : @"FramerateConversionAlgorithm",
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             @"gopSize" : @"GopSize",
             @"hrdBufferSize" : @"HrdBufferSize",
             @"maxBitrate" : @"MaxBitrate",
             @"parControl" : @"ParControl",
             @"parDenominator" : @"ParDenominator",
             @"parNumerator" : @"ParNumerator",
             @"qualityTuningLevel" : @"QualityTuningLevel",
             @"rateControlMode" : @"RateControlMode",
             };
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertVp8FramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMediaconvertVp8FramerateControlSpecified);
        }
        return @(AWSMediaconvertVp8FramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertVp8FramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMediaconvertVp8FramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateConversionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUPLICATE_DROP"] == NSOrderedSame) {
            return @(AWSMediaconvertVp8FramerateConversionAlgorithmDuplicateDrop);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE"] == NSOrderedSame) {
            return @(AWSMediaconvertVp8FramerateConversionAlgorithmInterpolate);
        }
        return @(AWSMediaconvertVp8FramerateConversionAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertVp8FramerateConversionAlgorithmDuplicateDrop:
                return @"DUPLICATE_DROP";
            case AWSMediaconvertVp8FramerateConversionAlgorithmInterpolate:
                return @"INTERPOLATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertVp8ParControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMediaconvertVp8ParControlSpecified);
        }
        return @(AWSMediaconvertVp8ParControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertVp8ParControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMediaconvertVp8ParControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qualityTuningLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MULTI_PASS"] == NSOrderedSame) {
            return @(AWSMediaconvertVp8QualityTuningLevelMultiPass);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PASS_HQ"] == NSOrderedSame) {
            return @(AWSMediaconvertVp8QualityTuningLevelMultiPassHq);
        }
        return @(AWSMediaconvertVp8QualityTuningLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertVp8QualityTuningLevelMultiPass:
                return @"MULTI_PASS";
            case AWSMediaconvertVp8QualityTuningLevelMultiPassHq:
                return @"MULTI_PASS_HQ";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSMediaconvertVp8RateControlModeVbr);
        }
        return @(AWSMediaconvertVp8RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertVp8RateControlModeVbr:
                return @"VBR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertVp9Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitrate" : @"Bitrate",
             @"framerateControl" : @"FramerateControl",
             @"framerateConversionAlgorithm" : @"FramerateConversionAlgorithm",
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             @"gopSize" : @"GopSize",
             @"hrdBufferSize" : @"HrdBufferSize",
             @"maxBitrate" : @"MaxBitrate",
             @"parControl" : @"ParControl",
             @"parDenominator" : @"ParDenominator",
             @"parNumerator" : @"ParNumerator",
             @"qualityTuningLevel" : @"QualityTuningLevel",
             @"rateControlMode" : @"RateControlMode",
             };
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertVp9FramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMediaconvertVp9FramerateControlSpecified);
        }
        return @(AWSMediaconvertVp9FramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertVp9FramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMediaconvertVp9FramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateConversionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUPLICATE_DROP"] == NSOrderedSame) {
            return @(AWSMediaconvertVp9FramerateConversionAlgorithmDuplicateDrop);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE"] == NSOrderedSame) {
            return @(AWSMediaconvertVp9FramerateConversionAlgorithmInterpolate);
        }
        return @(AWSMediaconvertVp9FramerateConversionAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertVp9FramerateConversionAlgorithmDuplicateDrop:
                return @"DUPLICATE_DROP";
            case AWSMediaconvertVp9FramerateConversionAlgorithmInterpolate:
                return @"INTERPOLATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMediaconvertVp9ParControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMediaconvertVp9ParControlSpecified);
        }
        return @(AWSMediaconvertVp9ParControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertVp9ParControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMediaconvertVp9ParControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qualityTuningLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MULTI_PASS"] == NSOrderedSame) {
            return @(AWSMediaconvertVp9QualityTuningLevelMultiPass);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PASS_HQ"] == NSOrderedSame) {
            return @(AWSMediaconvertVp9QualityTuningLevelMultiPassHq);
        }
        return @(AWSMediaconvertVp9QualityTuningLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertVp9QualityTuningLevelMultiPass:
                return @"MULTI_PASS";
            case AWSMediaconvertVp9QualityTuningLevelMultiPassHq:
                return @"MULTI_PASS_HQ";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSMediaconvertVp9RateControlModeVbr);
        }
        return @(AWSMediaconvertVp9RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertVp9RateControlModeVbr:
                return @"VBR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediaconvertWavSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitDepth" : @"BitDepth",
             @"channels" : @"Channels",
             @"format" : @"Format",
             @"sampleRate" : @"SampleRate",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RIFF"] == NSOrderedSame) {
            return @(AWSMediaconvertWavFormatRiff);
        }
        if ([value caseInsensitiveCompare:@"RF64"] == NSOrderedSame) {
            return @(AWSMediaconvertWavFormatRf64);
        }
        return @(AWSMediaconvertWavFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediaconvertWavFormatRiff:
                return @"RIFF";
            case AWSMediaconvertWavFormatRf64:
                return @"RF64";
            default:
                return nil;
        }
    }];
}

@end
