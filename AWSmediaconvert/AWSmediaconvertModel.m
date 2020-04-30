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

#import "AWSmediaconvertModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSmediaconvertErrorDomain = @"com.amazonaws.AWSmediaconvertErrorDomain";

@implementation AWSmediaconvertAacSettings

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
            return @(AWSmediaconvertAacAudioDescriptionBroadcasterMixBroadcasterMixedAd);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSmediaconvertAacAudioDescriptionBroadcasterMixNormal);
        }
        return @(AWSmediaconvertAacAudioDescriptionBroadcasterMixUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAacAudioDescriptionBroadcasterMixBroadcasterMixedAd:
                return @"BROADCASTER_MIXED_AD";
            case AWSmediaconvertAacAudioDescriptionBroadcasterMixNormal:
                return @"NORMAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LC"] == NSOrderedSame) {
            return @(AWSmediaconvertAacCodecProfileLc);
        }
        if ([value caseInsensitiveCompare:@"HEV1"] == NSOrderedSame) {
            return @(AWSmediaconvertAacCodecProfileHev1);
        }
        if ([value caseInsensitiveCompare:@"HEV2"] == NSOrderedSame) {
            return @(AWSmediaconvertAacCodecProfileHev2);
        }
        return @(AWSmediaconvertAacCodecProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAacCodecProfileLc:
                return @"LC";
            case AWSmediaconvertAacCodecProfileHev1:
                return @"HEV1";
            case AWSmediaconvertAacCodecProfileHev2:
                return @"HEV2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AD_RECEIVER_MIX"] == NSOrderedSame) {
            return @(AWSmediaconvertAacCodingModeAdReceiverMix);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_0"] == NSOrderedSame) {
            return @(AWSmediaconvertAacCodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_1"] == NSOrderedSame) {
            return @(AWSmediaconvertAacCodingModeCodingMode11);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSmediaconvertAacCodingModeCodingMode20);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_5_1"] == NSOrderedSame) {
            return @(AWSmediaconvertAacCodingModeCodingMode51);
        }
        return @(AWSmediaconvertAacCodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAacCodingModeAdReceiverMix:
                return @"AD_RECEIVER_MIX";
            case AWSmediaconvertAacCodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSmediaconvertAacCodingModeCodingMode11:
                return @"CODING_MODE_1_1";
            case AWSmediaconvertAacCodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            case AWSmediaconvertAacCodingModeCodingMode51:
                return @"CODING_MODE_5_1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSmediaconvertAacRateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSmediaconvertAacRateControlModeVbr);
        }
        return @(AWSmediaconvertAacRateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAacRateControlModeCbr:
                return @"CBR";
            case AWSmediaconvertAacRateControlModeVbr:
                return @"VBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rawFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LATM_LOAS"] == NSOrderedSame) {
            return @(AWSmediaconvertAacRawFormatLatmLoas);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertAacRawFormatNone);
        }
        return @(AWSmediaconvertAacRawFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAacRawFormatLatmLoas:
                return @"LATM_LOAS";
            case AWSmediaconvertAacRawFormatNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)specificationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MPEG2"] == NSOrderedSame) {
            return @(AWSmediaconvertAacSpecificationMpeg2);
        }
        if ([value caseInsensitiveCompare:@"MPEG4"] == NSOrderedSame) {
            return @(AWSmediaconvertAacSpecificationMpeg4);
        }
        return @(AWSmediaconvertAacSpecificationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAacSpecificationMpeg2:
                return @"MPEG2";
            case AWSmediaconvertAacSpecificationMpeg4:
                return @"MPEG4";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vbrQualityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSmediaconvertAacVbrQualityLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM_LOW"] == NSOrderedSame) {
            return @(AWSmediaconvertAacVbrQualityMediumLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM_HIGH"] == NSOrderedSame) {
            return @(AWSmediaconvertAacVbrQualityMediumHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSmediaconvertAacVbrQualityHigh);
        }
        return @(AWSmediaconvertAacVbrQualityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAacVbrQualityLow:
                return @"LOW";
            case AWSmediaconvertAacVbrQualityMediumLow:
                return @"MEDIUM_LOW";
            case AWSmediaconvertAacVbrQualityMediumHigh:
                return @"MEDIUM_HIGH";
            case AWSmediaconvertAacVbrQualityHigh:
                return @"HIGH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertAc3Settings

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
            return @(AWSmediaconvertAc3BitstreamModeCompleteMain);
        }
        if ([value caseInsensitiveCompare:@"COMMENTARY"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3BitstreamModeCommentary);
        }
        if ([value caseInsensitiveCompare:@"DIALOGUE"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3BitstreamModeDialogue);
        }
        if ([value caseInsensitiveCompare:@"EMERGENCY"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3BitstreamModeEmergency);
        }
        if ([value caseInsensitiveCompare:@"HEARING_IMPAIRED"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3BitstreamModeHearingImpaired);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_AND_EFFECTS"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3BitstreamModeMusicAndEffects);
        }
        if ([value caseInsensitiveCompare:@"VISUALLY_IMPAIRED"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3BitstreamModeVisuallyImpaired);
        }
        if ([value caseInsensitiveCompare:@"VOICE_OVER"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3BitstreamModeVoiceOver);
        }
        return @(AWSmediaconvertAc3BitstreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAc3BitstreamModeCompleteMain:
                return @"COMPLETE_MAIN";
            case AWSmediaconvertAc3BitstreamModeCommentary:
                return @"COMMENTARY";
            case AWSmediaconvertAc3BitstreamModeDialogue:
                return @"DIALOGUE";
            case AWSmediaconvertAc3BitstreamModeEmergency:
                return @"EMERGENCY";
            case AWSmediaconvertAc3BitstreamModeHearingImpaired:
                return @"HEARING_IMPAIRED";
            case AWSmediaconvertAc3BitstreamModeMusicAndEffects:
                return @"MUSIC_AND_EFFECTS";
            case AWSmediaconvertAc3BitstreamModeVisuallyImpaired:
                return @"VISUALLY_IMPAIRED";
            case AWSmediaconvertAc3BitstreamModeVoiceOver:
                return @"VOICE_OVER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_0"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3CodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_1"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3CodingModeCodingMode11);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3CodingModeCodingMode20);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_3_2_LFE"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3CodingModeCodingMode32Lfe);
        }
        return @(AWSmediaconvertAc3CodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAc3CodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSmediaconvertAc3CodingModeCodingMode11:
                return @"CODING_MODE_1_1";
            case AWSmediaconvertAc3CodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            case AWSmediaconvertAc3CodingModeCodingMode32Lfe:
                return @"CODING_MODE_3_2_LFE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicRangeCompressionProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3DynamicRangeCompressionProfileFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3DynamicRangeCompressionProfileNone);
        }
        return @(AWSmediaconvertAc3DynamicRangeCompressionProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAc3DynamicRangeCompressionProfileFilmStandard:
                return @"FILM_STANDARD";
            case AWSmediaconvertAc3DynamicRangeCompressionProfileNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lfeFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3LfeFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3LfeFilterDisabled);
        }
        return @(AWSmediaconvertAc3LfeFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAc3LfeFilterEnabled:
                return @"ENABLED";
            case AWSmediaconvertAc3LfeFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metadataControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3MetadataControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSmediaconvertAc3MetadataControlUseConfigured);
        }
        return @(AWSmediaconvertAc3MetadataControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAc3MetadataControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSmediaconvertAc3MetadataControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertAccelerationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mode" : @"Mode",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertAccelerationModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertAccelerationModeEnabled);
        }
        if ([value caseInsensitiveCompare:@"PREFERRED"] == NSOrderedSame) {
            return @(AWSmediaconvertAccelerationModePreferred);
        }
        return @(AWSmediaconvertAccelerationModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAccelerationModeDisabled:
                return @"DISABLED";
            case AWSmediaconvertAccelerationModeEnabled:
                return @"ENABLED";
            case AWSmediaconvertAccelerationModePreferred:
                return @"PREFERRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertAiffSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitDepth" : @"BitDepth",
             @"channels" : @"Channels",
             @"sampleRate" : @"SampleRate",
             };
}

@end

@implementation AWSmediaconvertAncillarySourceSettings

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
            return @(AWSmediaconvertAncillaryConvert608To708Upconvert);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertAncillaryConvert608To708Disabled);
        }
        return @(AWSmediaconvertAncillaryConvert608To708Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAncillaryConvert608To708Upconvert:
                return @"UPCONVERT";
            case AWSmediaconvertAncillaryConvert608To708Disabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)terminateCaptionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"END_OF_INPUT"] == NSOrderedSame) {
            return @(AWSmediaconvertAncillaryTerminateCaptionsEndOfInput);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertAncillaryTerminateCaptionsDisabled);
        }
        return @(AWSmediaconvertAncillaryTerminateCaptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAncillaryTerminateCaptionsEndOfInput:
                return @"END_OF_INPUT";
            case AWSmediaconvertAncillaryTerminateCaptionsDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertAssociateCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSmediaconvertAssociateCertificateResponse

@end

@implementation AWSmediaconvertAudioCodecSettings

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
             @"wavSettings" : @"WavSettings",
             };
}

+ (NSValueTransformer *)aacSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAacSettings class]];
}

+ (NSValueTransformer *)ac3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAc3Settings class]];
}

+ (NSValueTransformer *)aiffSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAiffSettings class]];
}

+ (NSValueTransformer *)codecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AAC"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioCodecAac);
        }
        if ([value caseInsensitiveCompare:@"MP2"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioCodecMp2);
        }
        if ([value caseInsensitiveCompare:@"MP3"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioCodecMp3);
        }
        if ([value caseInsensitiveCompare:@"WAV"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioCodecWav);
        }
        if ([value caseInsensitiveCompare:@"AIFF"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioCodecAiff);
        }
        if ([value caseInsensitiveCompare:@"AC3"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioCodecAc3);
        }
        if ([value caseInsensitiveCompare:@"EAC3"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioCodecEac3);
        }
        if ([value caseInsensitiveCompare:@"EAC3_ATMOS"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioCodecEac3Atmos);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioCodecPassthrough);
        }
        return @(AWSmediaconvertAudioCodecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAudioCodecAac:
                return @"AAC";
            case AWSmediaconvertAudioCodecMp2:
                return @"MP2";
            case AWSmediaconvertAudioCodecMp3:
                return @"MP3";
            case AWSmediaconvertAudioCodecWav:
                return @"WAV";
            case AWSmediaconvertAudioCodecAiff:
                return @"AIFF";
            case AWSmediaconvertAudioCodecAc3:
                return @"AC3";
            case AWSmediaconvertAudioCodecEac3:
                return @"EAC3";
            case AWSmediaconvertAudioCodecEac3Atmos:
                return @"EAC3_ATMOS";
            case AWSmediaconvertAudioCodecPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)eac3AtmosSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertEac3AtmosSettings class]];
}

+ (NSValueTransformer *)eac3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertEac3Settings class]];
}

+ (NSValueTransformer *)mp2SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertMp2Settings class]];
}

+ (NSValueTransformer *)mp3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertMp3Settings class]];
}

+ (NSValueTransformer *)wavSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertWavSettings class]];
}

@end

@implementation AWSmediaconvertAudioDescription

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAudioNormalizationSettings class]];
}

+ (NSValueTransformer *)audioTypeControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioTypeControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioTypeControlUseConfigured);
        }
        return @(AWSmediaconvertAudioTypeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAudioTypeControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSmediaconvertAudioTypeControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAudioCodecSettings class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEng);
        }
        if ([value caseInsensitiveCompare:@"SPA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSpa);
        }
        if ([value caseInsensitiveCompare:@"FRA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFra);
        }
        if ([value caseInsensitiveCompare:@"DEU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDeu);
        }
        if ([value caseInsensitiveCompare:@"GER"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGer);
        }
        if ([value caseInsensitiveCompare:@"ZHO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZho);
        }
        if ([value caseInsensitiveCompare:@"ARA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAra);
        }
        if ([value caseInsensitiveCompare:@"HIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHin);
        }
        if ([value caseInsensitiveCompare:@"JPN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeJpn);
        }
        if ([value caseInsensitiveCompare:@"RUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRus);
        }
        if ([value caseInsensitiveCompare:@"POR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePor);
        }
        if ([value caseInsensitiveCompare:@"ITA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIta);
        }
        if ([value caseInsensitiveCompare:@"URD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUrd);
        }
        if ([value caseInsensitiveCompare:@"VIE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVie);
        }
        if ([value caseInsensitiveCompare:@"KOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKor);
        }
        if ([value caseInsensitiveCompare:@"PAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePan);
        }
        if ([value caseInsensitiveCompare:@"ABK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAbk);
        }
        if ([value caseInsensitiveCompare:@"AAR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAar);
        }
        if ([value caseInsensitiveCompare:@"AFR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAfr);
        }
        if ([value caseInsensitiveCompare:@"AKA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAka);
        }
        if ([value caseInsensitiveCompare:@"SQI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSqi);
        }
        if ([value caseInsensitiveCompare:@"AMH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAmh);
        }
        if ([value caseInsensitiveCompare:@"ARG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeArg);
        }
        if ([value caseInsensitiveCompare:@"HYE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHye);
        }
        if ([value caseInsensitiveCompare:@"ASM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAsm);
        }
        if ([value caseInsensitiveCompare:@"AVA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAva);
        }
        if ([value caseInsensitiveCompare:@"AVE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAve);
        }
        if ([value caseInsensitiveCompare:@"AYM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAym);
        }
        if ([value caseInsensitiveCompare:@"AZE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAze);
        }
        if ([value caseInsensitiveCompare:@"BAM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBam);
        }
        if ([value caseInsensitiveCompare:@"BAK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBak);
        }
        if ([value caseInsensitiveCompare:@"EUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEus);
        }
        if ([value caseInsensitiveCompare:@"BEL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBel);
        }
        if ([value caseInsensitiveCompare:@"BEN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBen);
        }
        if ([value caseInsensitiveCompare:@"BIH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBih);
        }
        if ([value caseInsensitiveCompare:@"BIS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBis);
        }
        if ([value caseInsensitiveCompare:@"BOS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBos);
        }
        if ([value caseInsensitiveCompare:@"BRE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBre);
        }
        if ([value caseInsensitiveCompare:@"BUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBul);
        }
        if ([value caseInsensitiveCompare:@"MYA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMya);
        }
        if ([value caseInsensitiveCompare:@"CAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCat);
        }
        if ([value caseInsensitiveCompare:@"KHM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKhm);
        }
        if ([value caseInsensitiveCompare:@"CHA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCha);
        }
        if ([value caseInsensitiveCompare:@"CHE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChe);
        }
        if ([value caseInsensitiveCompare:@"NYA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNya);
        }
        if ([value caseInsensitiveCompare:@"CHU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChu);
        }
        if ([value caseInsensitiveCompare:@"CHV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChv);
        }
        if ([value caseInsensitiveCompare:@"COR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCor);
        }
        if ([value caseInsensitiveCompare:@"COS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCos);
        }
        if ([value caseInsensitiveCompare:@"CRE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCre);
        }
        if ([value caseInsensitiveCompare:@"HRV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHrv);
        }
        if ([value caseInsensitiveCompare:@"CES"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCes);
        }
        if ([value caseInsensitiveCompare:@"DAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDan);
        }
        if ([value caseInsensitiveCompare:@"DIV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDiv);
        }
        if ([value caseInsensitiveCompare:@"NLD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNld);
        }
        if ([value caseInsensitiveCompare:@"DZO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDzo);
        }
        if ([value caseInsensitiveCompare:@"ENM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEnm);
        }
        if ([value caseInsensitiveCompare:@"EPO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEpo);
        }
        if ([value caseInsensitiveCompare:@"EST"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEst);
        }
        if ([value caseInsensitiveCompare:@"EWE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEwe);
        }
        if ([value caseInsensitiveCompare:@"FAO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFao);
        }
        if ([value caseInsensitiveCompare:@"FIJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFij);
        }
        if ([value caseInsensitiveCompare:@"FIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFin);
        }
        if ([value caseInsensitiveCompare:@"FRM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFrm);
        }
        if ([value caseInsensitiveCompare:@"FUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFul);
        }
        if ([value caseInsensitiveCompare:@"GLA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGla);
        }
        if ([value caseInsensitiveCompare:@"GLG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGlg);
        }
        if ([value caseInsensitiveCompare:@"LUG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLug);
        }
        if ([value caseInsensitiveCompare:@"KAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKat);
        }
        if ([value caseInsensitiveCompare:@"ELL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEll);
        }
        if ([value caseInsensitiveCompare:@"GRN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGrn);
        }
        if ([value caseInsensitiveCompare:@"GUJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGuj);
        }
        if ([value caseInsensitiveCompare:@"HAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHat);
        }
        if ([value caseInsensitiveCompare:@"HAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHau);
        }
        if ([value caseInsensitiveCompare:@"HEB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHeb);
        }
        if ([value caseInsensitiveCompare:@"HER"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHer);
        }
        if ([value caseInsensitiveCompare:@"HMO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHmo);
        }
        if ([value caseInsensitiveCompare:@"HUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHun);
        }
        if ([value caseInsensitiveCompare:@"ISL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIsl);
        }
        if ([value caseInsensitiveCompare:@"IDO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIdo);
        }
        if ([value caseInsensitiveCompare:@"IBO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIbo);
        }
        if ([value caseInsensitiveCompare:@"IND"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeInd);
        }
        if ([value caseInsensitiveCompare:@"INA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIna);
        }
        if ([value caseInsensitiveCompare:@"ILE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIle);
        }
        if ([value caseInsensitiveCompare:@"IKU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIku);
        }
        if ([value caseInsensitiveCompare:@"IPK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIpk);
        }
        if ([value caseInsensitiveCompare:@"GLE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGle);
        }
        if ([value caseInsensitiveCompare:@"JAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeJav);
        }
        if ([value caseInsensitiveCompare:@"KAL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKal);
        }
        if ([value caseInsensitiveCompare:@"KAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKan);
        }
        if ([value caseInsensitiveCompare:@"KAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKau);
        }
        if ([value caseInsensitiveCompare:@"KAS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKas);
        }
        if ([value caseInsensitiveCompare:@"KAZ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKaz);
        }
        if ([value caseInsensitiveCompare:@"KIK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKik);
        }
        if ([value caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKin);
        }
        if ([value caseInsensitiveCompare:@"KIR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKir);
        }
        if ([value caseInsensitiveCompare:@"KOM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKom);
        }
        if ([value caseInsensitiveCompare:@"KON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKon);
        }
        if ([value caseInsensitiveCompare:@"KUA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKua);
        }
        if ([value caseInsensitiveCompare:@"KUR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKur);
        }
        if ([value caseInsensitiveCompare:@"LAO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLao);
        }
        if ([value caseInsensitiveCompare:@"LAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLat);
        }
        if ([value caseInsensitiveCompare:@"LAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLav);
        }
        if ([value caseInsensitiveCompare:@"LIM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLim);
        }
        if ([value caseInsensitiveCompare:@"LIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLin);
        }
        if ([value caseInsensitiveCompare:@"LIT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLit);
        }
        if ([value caseInsensitiveCompare:@"LUB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLub);
        }
        if ([value caseInsensitiveCompare:@"LTZ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLtz);
        }
        if ([value caseInsensitiveCompare:@"MKD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMkd);
        }
        if ([value caseInsensitiveCompare:@"MLG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMlg);
        }
        if ([value caseInsensitiveCompare:@"MSA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMsa);
        }
        if ([value caseInsensitiveCompare:@"MAL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMal);
        }
        if ([value caseInsensitiveCompare:@"MLT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMlt);
        }
        if ([value caseInsensitiveCompare:@"GLV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGlv);
        }
        if ([value caseInsensitiveCompare:@"MRI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMri);
        }
        if ([value caseInsensitiveCompare:@"MAR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMar);
        }
        if ([value caseInsensitiveCompare:@"MAH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMah);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMon);
        }
        if ([value caseInsensitiveCompare:@"NAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNau);
        }
        if ([value caseInsensitiveCompare:@"NAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNav);
        }
        if ([value caseInsensitiveCompare:@"NDE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNde);
        }
        if ([value caseInsensitiveCompare:@"NBL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNbl);
        }
        if ([value caseInsensitiveCompare:@"NDO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNdo);
        }
        if ([value caseInsensitiveCompare:@"NEP"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNep);
        }
        if ([value caseInsensitiveCompare:@"SME"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSme);
        }
        if ([value caseInsensitiveCompare:@"NOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNor);
        }
        if ([value caseInsensitiveCompare:@"NOB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNob);
        }
        if ([value caseInsensitiveCompare:@"NNO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNno);
        }
        if ([value caseInsensitiveCompare:@"OCI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOci);
        }
        if ([value caseInsensitiveCompare:@"OJI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOji);
        }
        if ([value caseInsensitiveCompare:@"ORI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOri);
        }
        if ([value caseInsensitiveCompare:@"ORM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOrm);
        }
        if ([value caseInsensitiveCompare:@"OSS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOss);
        }
        if ([value caseInsensitiveCompare:@"PLI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePli);
        }
        if ([value caseInsensitiveCompare:@"FAS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFas);
        }
        if ([value caseInsensitiveCompare:@"POL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePol);
        }
        if ([value caseInsensitiveCompare:@"PUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePus);
        }
        if ([value caseInsensitiveCompare:@"QUE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQue);
        }
        if ([value caseInsensitiveCompare:@"QAA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQaa);
        }
        if ([value caseInsensitiveCompare:@"RON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRon);
        }
        if ([value caseInsensitiveCompare:@"ROH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRoh);
        }
        if ([value caseInsensitiveCompare:@"RUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRun);
        }
        if ([value caseInsensitiveCompare:@"SMO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSmo);
        }
        if ([value caseInsensitiveCompare:@"SAG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSag);
        }
        if ([value caseInsensitiveCompare:@"SAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSan);
        }
        if ([value caseInsensitiveCompare:@"SRD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSrd);
        }
        if ([value caseInsensitiveCompare:@"SRB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSrb);
        }
        if ([value caseInsensitiveCompare:@"SNA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSna);
        }
        if ([value caseInsensitiveCompare:@"III"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIii);
        }
        if ([value caseInsensitiveCompare:@"SND"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSnd);
        }
        if ([value caseInsensitiveCompare:@"SIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSin);
        }
        if ([value caseInsensitiveCompare:@"SLK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSlk);
        }
        if ([value caseInsensitiveCompare:@"SLV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSlv);
        }
        if ([value caseInsensitiveCompare:@"SOM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSom);
        }
        if ([value caseInsensitiveCompare:@"SOT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSot);
        }
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSun);
        }
        if ([value caseInsensitiveCompare:@"SWA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSwa);
        }
        if ([value caseInsensitiveCompare:@"SSW"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSsw);
        }
        if ([value caseInsensitiveCompare:@"SWE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSwe);
        }
        if ([value caseInsensitiveCompare:@"TGL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTgl);
        }
        if ([value caseInsensitiveCompare:@"TAH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTah);
        }
        if ([value caseInsensitiveCompare:@"TGK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTgk);
        }
        if ([value caseInsensitiveCompare:@"TAM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTam);
        }
        if ([value caseInsensitiveCompare:@"TAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTat);
        }
        if ([value caseInsensitiveCompare:@"TEL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTel);
        }
        if ([value caseInsensitiveCompare:@"THA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTha);
        }
        if ([value caseInsensitiveCompare:@"BOD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBod);
        }
        if ([value caseInsensitiveCompare:@"TIR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTir);
        }
        if ([value caseInsensitiveCompare:@"TON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTon);
        }
        if ([value caseInsensitiveCompare:@"TSO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTso);
        }
        if ([value caseInsensitiveCompare:@"TSN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTsn);
        }
        if ([value caseInsensitiveCompare:@"TUR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTur);
        }
        if ([value caseInsensitiveCompare:@"TUK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTuk);
        }
        if ([value caseInsensitiveCompare:@"TWI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTwi);
        }
        if ([value caseInsensitiveCompare:@"UIG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUig);
        }
        if ([value caseInsensitiveCompare:@"UKR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUkr);
        }
        if ([value caseInsensitiveCompare:@"UZB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUzb);
        }
        if ([value caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVen);
        }
        if ([value caseInsensitiveCompare:@"VOL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVol);
        }
        if ([value caseInsensitiveCompare:@"WLN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeWln);
        }
        if ([value caseInsensitiveCompare:@"CYM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCym);
        }
        if ([value caseInsensitiveCompare:@"FRY"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFry);
        }
        if ([value caseInsensitiveCompare:@"WOL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeWol);
        }
        if ([value caseInsensitiveCompare:@"XHO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeXho);
        }
        if ([value caseInsensitiveCompare:@"YID"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeYid);
        }
        if ([value caseInsensitiveCompare:@"YOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeYor);
        }
        if ([value caseInsensitiveCompare:@"ZHA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZha);
        }
        if ([value caseInsensitiveCompare:@"ZUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZul);
        }
        if ([value caseInsensitiveCompare:@"ORJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOrj);
        }
        if ([value caseInsensitiveCompare:@"QPC"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQpc);
        }
        if ([value caseInsensitiveCompare:@"TNG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTng);
        }
        return @(AWSmediaconvertLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertLanguageCodeEng:
                return @"ENG";
            case AWSmediaconvertLanguageCodeSpa:
                return @"SPA";
            case AWSmediaconvertLanguageCodeFra:
                return @"FRA";
            case AWSmediaconvertLanguageCodeDeu:
                return @"DEU";
            case AWSmediaconvertLanguageCodeGer:
                return @"GER";
            case AWSmediaconvertLanguageCodeZho:
                return @"ZHO";
            case AWSmediaconvertLanguageCodeAra:
                return @"ARA";
            case AWSmediaconvertLanguageCodeHin:
                return @"HIN";
            case AWSmediaconvertLanguageCodeJpn:
                return @"JPN";
            case AWSmediaconvertLanguageCodeRus:
                return @"RUS";
            case AWSmediaconvertLanguageCodePor:
                return @"POR";
            case AWSmediaconvertLanguageCodeIta:
                return @"ITA";
            case AWSmediaconvertLanguageCodeUrd:
                return @"URD";
            case AWSmediaconvertLanguageCodeVie:
                return @"VIE";
            case AWSmediaconvertLanguageCodeKor:
                return @"KOR";
            case AWSmediaconvertLanguageCodePan:
                return @"PAN";
            case AWSmediaconvertLanguageCodeAbk:
                return @"ABK";
            case AWSmediaconvertLanguageCodeAar:
                return @"AAR";
            case AWSmediaconvertLanguageCodeAfr:
                return @"AFR";
            case AWSmediaconvertLanguageCodeAka:
                return @"AKA";
            case AWSmediaconvertLanguageCodeSqi:
                return @"SQI";
            case AWSmediaconvertLanguageCodeAmh:
                return @"AMH";
            case AWSmediaconvertLanguageCodeArg:
                return @"ARG";
            case AWSmediaconvertLanguageCodeHye:
                return @"HYE";
            case AWSmediaconvertLanguageCodeAsm:
                return @"ASM";
            case AWSmediaconvertLanguageCodeAva:
                return @"AVA";
            case AWSmediaconvertLanguageCodeAve:
                return @"AVE";
            case AWSmediaconvertLanguageCodeAym:
                return @"AYM";
            case AWSmediaconvertLanguageCodeAze:
                return @"AZE";
            case AWSmediaconvertLanguageCodeBam:
                return @"BAM";
            case AWSmediaconvertLanguageCodeBak:
                return @"BAK";
            case AWSmediaconvertLanguageCodeEus:
                return @"EUS";
            case AWSmediaconvertLanguageCodeBel:
                return @"BEL";
            case AWSmediaconvertLanguageCodeBen:
                return @"BEN";
            case AWSmediaconvertLanguageCodeBih:
                return @"BIH";
            case AWSmediaconvertLanguageCodeBis:
                return @"BIS";
            case AWSmediaconvertLanguageCodeBos:
                return @"BOS";
            case AWSmediaconvertLanguageCodeBre:
                return @"BRE";
            case AWSmediaconvertLanguageCodeBul:
                return @"BUL";
            case AWSmediaconvertLanguageCodeMya:
                return @"MYA";
            case AWSmediaconvertLanguageCodeCat:
                return @"CAT";
            case AWSmediaconvertLanguageCodeKhm:
                return @"KHM";
            case AWSmediaconvertLanguageCodeCha:
                return @"CHA";
            case AWSmediaconvertLanguageCodeChe:
                return @"CHE";
            case AWSmediaconvertLanguageCodeNya:
                return @"NYA";
            case AWSmediaconvertLanguageCodeChu:
                return @"CHU";
            case AWSmediaconvertLanguageCodeChv:
                return @"CHV";
            case AWSmediaconvertLanguageCodeCor:
                return @"COR";
            case AWSmediaconvertLanguageCodeCos:
                return @"COS";
            case AWSmediaconvertLanguageCodeCre:
                return @"CRE";
            case AWSmediaconvertLanguageCodeHrv:
                return @"HRV";
            case AWSmediaconvertLanguageCodeCes:
                return @"CES";
            case AWSmediaconvertLanguageCodeDan:
                return @"DAN";
            case AWSmediaconvertLanguageCodeDiv:
                return @"DIV";
            case AWSmediaconvertLanguageCodeNld:
                return @"NLD";
            case AWSmediaconvertLanguageCodeDzo:
                return @"DZO";
            case AWSmediaconvertLanguageCodeEnm:
                return @"ENM";
            case AWSmediaconvertLanguageCodeEpo:
                return @"EPO";
            case AWSmediaconvertLanguageCodeEst:
                return @"EST";
            case AWSmediaconvertLanguageCodeEwe:
                return @"EWE";
            case AWSmediaconvertLanguageCodeFao:
                return @"FAO";
            case AWSmediaconvertLanguageCodeFij:
                return @"FIJ";
            case AWSmediaconvertLanguageCodeFin:
                return @"FIN";
            case AWSmediaconvertLanguageCodeFrm:
                return @"FRM";
            case AWSmediaconvertLanguageCodeFul:
                return @"FUL";
            case AWSmediaconvertLanguageCodeGla:
                return @"GLA";
            case AWSmediaconvertLanguageCodeGlg:
                return @"GLG";
            case AWSmediaconvertLanguageCodeLug:
                return @"LUG";
            case AWSmediaconvertLanguageCodeKat:
                return @"KAT";
            case AWSmediaconvertLanguageCodeEll:
                return @"ELL";
            case AWSmediaconvertLanguageCodeGrn:
                return @"GRN";
            case AWSmediaconvertLanguageCodeGuj:
                return @"GUJ";
            case AWSmediaconvertLanguageCodeHat:
                return @"HAT";
            case AWSmediaconvertLanguageCodeHau:
                return @"HAU";
            case AWSmediaconvertLanguageCodeHeb:
                return @"HEB";
            case AWSmediaconvertLanguageCodeHer:
                return @"HER";
            case AWSmediaconvertLanguageCodeHmo:
                return @"HMO";
            case AWSmediaconvertLanguageCodeHun:
                return @"HUN";
            case AWSmediaconvertLanguageCodeIsl:
                return @"ISL";
            case AWSmediaconvertLanguageCodeIdo:
                return @"IDO";
            case AWSmediaconvertLanguageCodeIbo:
                return @"IBO";
            case AWSmediaconvertLanguageCodeInd:
                return @"IND";
            case AWSmediaconvertLanguageCodeIna:
                return @"INA";
            case AWSmediaconvertLanguageCodeIle:
                return @"ILE";
            case AWSmediaconvertLanguageCodeIku:
                return @"IKU";
            case AWSmediaconvertLanguageCodeIpk:
                return @"IPK";
            case AWSmediaconvertLanguageCodeGle:
                return @"GLE";
            case AWSmediaconvertLanguageCodeJav:
                return @"JAV";
            case AWSmediaconvertLanguageCodeKal:
                return @"KAL";
            case AWSmediaconvertLanguageCodeKan:
                return @"KAN";
            case AWSmediaconvertLanguageCodeKau:
                return @"KAU";
            case AWSmediaconvertLanguageCodeKas:
                return @"KAS";
            case AWSmediaconvertLanguageCodeKaz:
                return @"KAZ";
            case AWSmediaconvertLanguageCodeKik:
                return @"KIK";
            case AWSmediaconvertLanguageCodeKin:
                return @"KIN";
            case AWSmediaconvertLanguageCodeKir:
                return @"KIR";
            case AWSmediaconvertLanguageCodeKom:
                return @"KOM";
            case AWSmediaconvertLanguageCodeKon:
                return @"KON";
            case AWSmediaconvertLanguageCodeKua:
                return @"KUA";
            case AWSmediaconvertLanguageCodeKur:
                return @"KUR";
            case AWSmediaconvertLanguageCodeLao:
                return @"LAO";
            case AWSmediaconvertLanguageCodeLat:
                return @"LAT";
            case AWSmediaconvertLanguageCodeLav:
                return @"LAV";
            case AWSmediaconvertLanguageCodeLim:
                return @"LIM";
            case AWSmediaconvertLanguageCodeLin:
                return @"LIN";
            case AWSmediaconvertLanguageCodeLit:
                return @"LIT";
            case AWSmediaconvertLanguageCodeLub:
                return @"LUB";
            case AWSmediaconvertLanguageCodeLtz:
                return @"LTZ";
            case AWSmediaconvertLanguageCodeMkd:
                return @"MKD";
            case AWSmediaconvertLanguageCodeMlg:
                return @"MLG";
            case AWSmediaconvertLanguageCodeMsa:
                return @"MSA";
            case AWSmediaconvertLanguageCodeMal:
                return @"MAL";
            case AWSmediaconvertLanguageCodeMlt:
                return @"MLT";
            case AWSmediaconvertLanguageCodeGlv:
                return @"GLV";
            case AWSmediaconvertLanguageCodeMri:
                return @"MRI";
            case AWSmediaconvertLanguageCodeMar:
                return @"MAR";
            case AWSmediaconvertLanguageCodeMah:
                return @"MAH";
            case AWSmediaconvertLanguageCodeMon:
                return @"MON";
            case AWSmediaconvertLanguageCodeNau:
                return @"NAU";
            case AWSmediaconvertLanguageCodeNav:
                return @"NAV";
            case AWSmediaconvertLanguageCodeNde:
                return @"NDE";
            case AWSmediaconvertLanguageCodeNbl:
                return @"NBL";
            case AWSmediaconvertLanguageCodeNdo:
                return @"NDO";
            case AWSmediaconvertLanguageCodeNep:
                return @"NEP";
            case AWSmediaconvertLanguageCodeSme:
                return @"SME";
            case AWSmediaconvertLanguageCodeNor:
                return @"NOR";
            case AWSmediaconvertLanguageCodeNob:
                return @"NOB";
            case AWSmediaconvertLanguageCodeNno:
                return @"NNO";
            case AWSmediaconvertLanguageCodeOci:
                return @"OCI";
            case AWSmediaconvertLanguageCodeOji:
                return @"OJI";
            case AWSmediaconvertLanguageCodeOri:
                return @"ORI";
            case AWSmediaconvertLanguageCodeOrm:
                return @"ORM";
            case AWSmediaconvertLanguageCodeOss:
                return @"OSS";
            case AWSmediaconvertLanguageCodePli:
                return @"PLI";
            case AWSmediaconvertLanguageCodeFas:
                return @"FAS";
            case AWSmediaconvertLanguageCodePol:
                return @"POL";
            case AWSmediaconvertLanguageCodePus:
                return @"PUS";
            case AWSmediaconvertLanguageCodeQue:
                return @"QUE";
            case AWSmediaconvertLanguageCodeQaa:
                return @"QAA";
            case AWSmediaconvertLanguageCodeRon:
                return @"RON";
            case AWSmediaconvertLanguageCodeRoh:
                return @"ROH";
            case AWSmediaconvertLanguageCodeRun:
                return @"RUN";
            case AWSmediaconvertLanguageCodeSmo:
                return @"SMO";
            case AWSmediaconvertLanguageCodeSag:
                return @"SAG";
            case AWSmediaconvertLanguageCodeSan:
                return @"SAN";
            case AWSmediaconvertLanguageCodeSrd:
                return @"SRD";
            case AWSmediaconvertLanguageCodeSrb:
                return @"SRB";
            case AWSmediaconvertLanguageCodeSna:
                return @"SNA";
            case AWSmediaconvertLanguageCodeIii:
                return @"III";
            case AWSmediaconvertLanguageCodeSnd:
                return @"SND";
            case AWSmediaconvertLanguageCodeSin:
                return @"SIN";
            case AWSmediaconvertLanguageCodeSlk:
                return @"SLK";
            case AWSmediaconvertLanguageCodeSlv:
                return @"SLV";
            case AWSmediaconvertLanguageCodeSom:
                return @"SOM";
            case AWSmediaconvertLanguageCodeSot:
                return @"SOT";
            case AWSmediaconvertLanguageCodeSun:
                return @"SUN";
            case AWSmediaconvertLanguageCodeSwa:
                return @"SWA";
            case AWSmediaconvertLanguageCodeSsw:
                return @"SSW";
            case AWSmediaconvertLanguageCodeSwe:
                return @"SWE";
            case AWSmediaconvertLanguageCodeTgl:
                return @"TGL";
            case AWSmediaconvertLanguageCodeTah:
                return @"TAH";
            case AWSmediaconvertLanguageCodeTgk:
                return @"TGK";
            case AWSmediaconvertLanguageCodeTam:
                return @"TAM";
            case AWSmediaconvertLanguageCodeTat:
                return @"TAT";
            case AWSmediaconvertLanguageCodeTel:
                return @"TEL";
            case AWSmediaconvertLanguageCodeTha:
                return @"THA";
            case AWSmediaconvertLanguageCodeBod:
                return @"BOD";
            case AWSmediaconvertLanguageCodeTir:
                return @"TIR";
            case AWSmediaconvertLanguageCodeTon:
                return @"TON";
            case AWSmediaconvertLanguageCodeTso:
                return @"TSO";
            case AWSmediaconvertLanguageCodeTsn:
                return @"TSN";
            case AWSmediaconvertLanguageCodeTur:
                return @"TUR";
            case AWSmediaconvertLanguageCodeTuk:
                return @"TUK";
            case AWSmediaconvertLanguageCodeTwi:
                return @"TWI";
            case AWSmediaconvertLanguageCodeUig:
                return @"UIG";
            case AWSmediaconvertLanguageCodeUkr:
                return @"UKR";
            case AWSmediaconvertLanguageCodeUzb:
                return @"UZB";
            case AWSmediaconvertLanguageCodeVen:
                return @"VEN";
            case AWSmediaconvertLanguageCodeVol:
                return @"VOL";
            case AWSmediaconvertLanguageCodeWln:
                return @"WLN";
            case AWSmediaconvertLanguageCodeCym:
                return @"CYM";
            case AWSmediaconvertLanguageCodeFry:
                return @"FRY";
            case AWSmediaconvertLanguageCodeWol:
                return @"WOL";
            case AWSmediaconvertLanguageCodeXho:
                return @"XHO";
            case AWSmediaconvertLanguageCodeYid:
                return @"YID";
            case AWSmediaconvertLanguageCodeYor:
                return @"YOR";
            case AWSmediaconvertLanguageCodeZha:
                return @"ZHA";
            case AWSmediaconvertLanguageCodeZul:
                return @"ZUL";
            case AWSmediaconvertLanguageCodeOrj:
                return @"ORJ";
            case AWSmediaconvertLanguageCodeQpc:
                return @"QPC";
            case AWSmediaconvertLanguageCodeTng:
                return @"TNG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioLanguageCodeControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioLanguageCodeControlUseConfigured);
        }
        return @(AWSmediaconvertAudioLanguageCodeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAudioLanguageCodeControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSmediaconvertAudioLanguageCodeControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)remixSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertRemixSettings class]];
}

@end

@implementation AWSmediaconvertAudioNormalizationSettings

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
            return @(AWSmediaconvertAudioNormalizationAlgorithmItuBs17701);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_2"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioNormalizationAlgorithmItuBs17702);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_3"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioNormalizationAlgorithmItuBs17703);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_4"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioNormalizationAlgorithmItuBs17704);
        }
        return @(AWSmediaconvertAudioNormalizationAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAudioNormalizationAlgorithmItuBs17701:
                return @"ITU_BS_1770_1";
            case AWSmediaconvertAudioNormalizationAlgorithmItuBs17702:
                return @"ITU_BS_1770_2";
            case AWSmediaconvertAudioNormalizationAlgorithmItuBs17703:
                return @"ITU_BS_1770_3";
            case AWSmediaconvertAudioNormalizationAlgorithmItuBs17704:
                return @"ITU_BS_1770_4";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)algorithmControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CORRECT_AUDIO"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioNormalizationAlgorithmControlCorrectAudio);
        }
        if ([value caseInsensitiveCompare:@"MEASURE_ONLY"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioNormalizationAlgorithmControlMeasureOnly);
        }
        return @(AWSmediaconvertAudioNormalizationAlgorithmControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAudioNormalizationAlgorithmControlCorrectAudio:
                return @"CORRECT_AUDIO";
            case AWSmediaconvertAudioNormalizationAlgorithmControlMeasureOnly:
                return @"MEASURE_ONLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)loudnessLoggingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LOG"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioNormalizationLoudnessLoggingLog);
        }
        if ([value caseInsensitiveCompare:@"DONT_LOG"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioNormalizationLoudnessLoggingDontLog);
        }
        return @(AWSmediaconvertAudioNormalizationLoudnessLoggingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAudioNormalizationLoudnessLoggingLog:
                return @"LOG";
            case AWSmediaconvertAudioNormalizationLoudnessLoggingDontLog:
                return @"DONT_LOG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)peakCalculationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRUE_PEAK"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioNormalizationPeakCalculationTruePeak);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioNormalizationPeakCalculationNone);
        }
        return @(AWSmediaconvertAudioNormalizationPeakCalculationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAudioNormalizationPeakCalculationTruePeak:
                return @"TRUE_PEAK";
            case AWSmediaconvertAudioNormalizationPeakCalculationNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertAudioSelector

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
            return @(AWSmediaconvertAudioDefaultSelectionDefault);
        }
        if ([value caseInsensitiveCompare:@"NOT_DEFAULT"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioDefaultSelectionNotDefault);
        }
        return @(AWSmediaconvertAudioDefaultSelectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAudioDefaultSelectionDefault:
                return @"DEFAULT";
            case AWSmediaconvertAudioDefaultSelectionNotDefault:
                return @"NOT_DEFAULT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEng);
        }
        if ([value caseInsensitiveCompare:@"SPA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSpa);
        }
        if ([value caseInsensitiveCompare:@"FRA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFra);
        }
        if ([value caseInsensitiveCompare:@"DEU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDeu);
        }
        if ([value caseInsensitiveCompare:@"GER"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGer);
        }
        if ([value caseInsensitiveCompare:@"ZHO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZho);
        }
        if ([value caseInsensitiveCompare:@"ARA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAra);
        }
        if ([value caseInsensitiveCompare:@"HIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHin);
        }
        if ([value caseInsensitiveCompare:@"JPN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeJpn);
        }
        if ([value caseInsensitiveCompare:@"RUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRus);
        }
        if ([value caseInsensitiveCompare:@"POR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePor);
        }
        if ([value caseInsensitiveCompare:@"ITA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIta);
        }
        if ([value caseInsensitiveCompare:@"URD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUrd);
        }
        if ([value caseInsensitiveCompare:@"VIE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVie);
        }
        if ([value caseInsensitiveCompare:@"KOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKor);
        }
        if ([value caseInsensitiveCompare:@"PAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePan);
        }
        if ([value caseInsensitiveCompare:@"ABK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAbk);
        }
        if ([value caseInsensitiveCompare:@"AAR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAar);
        }
        if ([value caseInsensitiveCompare:@"AFR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAfr);
        }
        if ([value caseInsensitiveCompare:@"AKA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAka);
        }
        if ([value caseInsensitiveCompare:@"SQI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSqi);
        }
        if ([value caseInsensitiveCompare:@"AMH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAmh);
        }
        if ([value caseInsensitiveCompare:@"ARG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeArg);
        }
        if ([value caseInsensitiveCompare:@"HYE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHye);
        }
        if ([value caseInsensitiveCompare:@"ASM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAsm);
        }
        if ([value caseInsensitiveCompare:@"AVA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAva);
        }
        if ([value caseInsensitiveCompare:@"AVE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAve);
        }
        if ([value caseInsensitiveCompare:@"AYM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAym);
        }
        if ([value caseInsensitiveCompare:@"AZE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAze);
        }
        if ([value caseInsensitiveCompare:@"BAM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBam);
        }
        if ([value caseInsensitiveCompare:@"BAK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBak);
        }
        if ([value caseInsensitiveCompare:@"EUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEus);
        }
        if ([value caseInsensitiveCompare:@"BEL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBel);
        }
        if ([value caseInsensitiveCompare:@"BEN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBen);
        }
        if ([value caseInsensitiveCompare:@"BIH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBih);
        }
        if ([value caseInsensitiveCompare:@"BIS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBis);
        }
        if ([value caseInsensitiveCompare:@"BOS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBos);
        }
        if ([value caseInsensitiveCompare:@"BRE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBre);
        }
        if ([value caseInsensitiveCompare:@"BUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBul);
        }
        if ([value caseInsensitiveCompare:@"MYA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMya);
        }
        if ([value caseInsensitiveCompare:@"CAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCat);
        }
        if ([value caseInsensitiveCompare:@"KHM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKhm);
        }
        if ([value caseInsensitiveCompare:@"CHA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCha);
        }
        if ([value caseInsensitiveCompare:@"CHE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChe);
        }
        if ([value caseInsensitiveCompare:@"NYA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNya);
        }
        if ([value caseInsensitiveCompare:@"CHU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChu);
        }
        if ([value caseInsensitiveCompare:@"CHV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChv);
        }
        if ([value caseInsensitiveCompare:@"COR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCor);
        }
        if ([value caseInsensitiveCompare:@"COS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCos);
        }
        if ([value caseInsensitiveCompare:@"CRE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCre);
        }
        if ([value caseInsensitiveCompare:@"HRV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHrv);
        }
        if ([value caseInsensitiveCompare:@"CES"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCes);
        }
        if ([value caseInsensitiveCompare:@"DAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDan);
        }
        if ([value caseInsensitiveCompare:@"DIV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDiv);
        }
        if ([value caseInsensitiveCompare:@"NLD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNld);
        }
        if ([value caseInsensitiveCompare:@"DZO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDzo);
        }
        if ([value caseInsensitiveCompare:@"ENM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEnm);
        }
        if ([value caseInsensitiveCompare:@"EPO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEpo);
        }
        if ([value caseInsensitiveCompare:@"EST"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEst);
        }
        if ([value caseInsensitiveCompare:@"EWE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEwe);
        }
        if ([value caseInsensitiveCompare:@"FAO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFao);
        }
        if ([value caseInsensitiveCompare:@"FIJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFij);
        }
        if ([value caseInsensitiveCompare:@"FIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFin);
        }
        if ([value caseInsensitiveCompare:@"FRM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFrm);
        }
        if ([value caseInsensitiveCompare:@"FUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFul);
        }
        if ([value caseInsensitiveCompare:@"GLA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGla);
        }
        if ([value caseInsensitiveCompare:@"GLG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGlg);
        }
        if ([value caseInsensitiveCompare:@"LUG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLug);
        }
        if ([value caseInsensitiveCompare:@"KAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKat);
        }
        if ([value caseInsensitiveCompare:@"ELL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEll);
        }
        if ([value caseInsensitiveCompare:@"GRN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGrn);
        }
        if ([value caseInsensitiveCompare:@"GUJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGuj);
        }
        if ([value caseInsensitiveCompare:@"HAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHat);
        }
        if ([value caseInsensitiveCompare:@"HAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHau);
        }
        if ([value caseInsensitiveCompare:@"HEB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHeb);
        }
        if ([value caseInsensitiveCompare:@"HER"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHer);
        }
        if ([value caseInsensitiveCompare:@"HMO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHmo);
        }
        if ([value caseInsensitiveCompare:@"HUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHun);
        }
        if ([value caseInsensitiveCompare:@"ISL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIsl);
        }
        if ([value caseInsensitiveCompare:@"IDO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIdo);
        }
        if ([value caseInsensitiveCompare:@"IBO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIbo);
        }
        if ([value caseInsensitiveCompare:@"IND"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeInd);
        }
        if ([value caseInsensitiveCompare:@"INA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIna);
        }
        if ([value caseInsensitiveCompare:@"ILE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIle);
        }
        if ([value caseInsensitiveCompare:@"IKU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIku);
        }
        if ([value caseInsensitiveCompare:@"IPK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIpk);
        }
        if ([value caseInsensitiveCompare:@"GLE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGle);
        }
        if ([value caseInsensitiveCompare:@"JAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeJav);
        }
        if ([value caseInsensitiveCompare:@"KAL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKal);
        }
        if ([value caseInsensitiveCompare:@"KAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKan);
        }
        if ([value caseInsensitiveCompare:@"KAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKau);
        }
        if ([value caseInsensitiveCompare:@"KAS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKas);
        }
        if ([value caseInsensitiveCompare:@"KAZ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKaz);
        }
        if ([value caseInsensitiveCompare:@"KIK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKik);
        }
        if ([value caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKin);
        }
        if ([value caseInsensitiveCompare:@"KIR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKir);
        }
        if ([value caseInsensitiveCompare:@"KOM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKom);
        }
        if ([value caseInsensitiveCompare:@"KON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKon);
        }
        if ([value caseInsensitiveCompare:@"KUA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKua);
        }
        if ([value caseInsensitiveCompare:@"KUR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKur);
        }
        if ([value caseInsensitiveCompare:@"LAO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLao);
        }
        if ([value caseInsensitiveCompare:@"LAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLat);
        }
        if ([value caseInsensitiveCompare:@"LAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLav);
        }
        if ([value caseInsensitiveCompare:@"LIM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLim);
        }
        if ([value caseInsensitiveCompare:@"LIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLin);
        }
        if ([value caseInsensitiveCompare:@"LIT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLit);
        }
        if ([value caseInsensitiveCompare:@"LUB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLub);
        }
        if ([value caseInsensitiveCompare:@"LTZ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLtz);
        }
        if ([value caseInsensitiveCompare:@"MKD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMkd);
        }
        if ([value caseInsensitiveCompare:@"MLG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMlg);
        }
        if ([value caseInsensitiveCompare:@"MSA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMsa);
        }
        if ([value caseInsensitiveCompare:@"MAL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMal);
        }
        if ([value caseInsensitiveCompare:@"MLT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMlt);
        }
        if ([value caseInsensitiveCompare:@"GLV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGlv);
        }
        if ([value caseInsensitiveCompare:@"MRI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMri);
        }
        if ([value caseInsensitiveCompare:@"MAR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMar);
        }
        if ([value caseInsensitiveCompare:@"MAH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMah);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMon);
        }
        if ([value caseInsensitiveCompare:@"NAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNau);
        }
        if ([value caseInsensitiveCompare:@"NAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNav);
        }
        if ([value caseInsensitiveCompare:@"NDE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNde);
        }
        if ([value caseInsensitiveCompare:@"NBL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNbl);
        }
        if ([value caseInsensitiveCompare:@"NDO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNdo);
        }
        if ([value caseInsensitiveCompare:@"NEP"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNep);
        }
        if ([value caseInsensitiveCompare:@"SME"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSme);
        }
        if ([value caseInsensitiveCompare:@"NOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNor);
        }
        if ([value caseInsensitiveCompare:@"NOB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNob);
        }
        if ([value caseInsensitiveCompare:@"NNO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNno);
        }
        if ([value caseInsensitiveCompare:@"OCI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOci);
        }
        if ([value caseInsensitiveCompare:@"OJI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOji);
        }
        if ([value caseInsensitiveCompare:@"ORI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOri);
        }
        if ([value caseInsensitiveCompare:@"ORM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOrm);
        }
        if ([value caseInsensitiveCompare:@"OSS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOss);
        }
        if ([value caseInsensitiveCompare:@"PLI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePli);
        }
        if ([value caseInsensitiveCompare:@"FAS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFas);
        }
        if ([value caseInsensitiveCompare:@"POL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePol);
        }
        if ([value caseInsensitiveCompare:@"PUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePus);
        }
        if ([value caseInsensitiveCompare:@"QUE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQue);
        }
        if ([value caseInsensitiveCompare:@"QAA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQaa);
        }
        if ([value caseInsensitiveCompare:@"RON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRon);
        }
        if ([value caseInsensitiveCompare:@"ROH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRoh);
        }
        if ([value caseInsensitiveCompare:@"RUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRun);
        }
        if ([value caseInsensitiveCompare:@"SMO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSmo);
        }
        if ([value caseInsensitiveCompare:@"SAG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSag);
        }
        if ([value caseInsensitiveCompare:@"SAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSan);
        }
        if ([value caseInsensitiveCompare:@"SRD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSrd);
        }
        if ([value caseInsensitiveCompare:@"SRB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSrb);
        }
        if ([value caseInsensitiveCompare:@"SNA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSna);
        }
        if ([value caseInsensitiveCompare:@"III"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIii);
        }
        if ([value caseInsensitiveCompare:@"SND"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSnd);
        }
        if ([value caseInsensitiveCompare:@"SIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSin);
        }
        if ([value caseInsensitiveCompare:@"SLK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSlk);
        }
        if ([value caseInsensitiveCompare:@"SLV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSlv);
        }
        if ([value caseInsensitiveCompare:@"SOM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSom);
        }
        if ([value caseInsensitiveCompare:@"SOT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSot);
        }
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSun);
        }
        if ([value caseInsensitiveCompare:@"SWA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSwa);
        }
        if ([value caseInsensitiveCompare:@"SSW"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSsw);
        }
        if ([value caseInsensitiveCompare:@"SWE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSwe);
        }
        if ([value caseInsensitiveCompare:@"TGL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTgl);
        }
        if ([value caseInsensitiveCompare:@"TAH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTah);
        }
        if ([value caseInsensitiveCompare:@"TGK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTgk);
        }
        if ([value caseInsensitiveCompare:@"TAM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTam);
        }
        if ([value caseInsensitiveCompare:@"TAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTat);
        }
        if ([value caseInsensitiveCompare:@"TEL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTel);
        }
        if ([value caseInsensitiveCompare:@"THA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTha);
        }
        if ([value caseInsensitiveCompare:@"BOD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBod);
        }
        if ([value caseInsensitiveCompare:@"TIR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTir);
        }
        if ([value caseInsensitiveCompare:@"TON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTon);
        }
        if ([value caseInsensitiveCompare:@"TSO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTso);
        }
        if ([value caseInsensitiveCompare:@"TSN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTsn);
        }
        if ([value caseInsensitiveCompare:@"TUR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTur);
        }
        if ([value caseInsensitiveCompare:@"TUK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTuk);
        }
        if ([value caseInsensitiveCompare:@"TWI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTwi);
        }
        if ([value caseInsensitiveCompare:@"UIG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUig);
        }
        if ([value caseInsensitiveCompare:@"UKR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUkr);
        }
        if ([value caseInsensitiveCompare:@"UZB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUzb);
        }
        if ([value caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVen);
        }
        if ([value caseInsensitiveCompare:@"VOL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVol);
        }
        if ([value caseInsensitiveCompare:@"WLN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeWln);
        }
        if ([value caseInsensitiveCompare:@"CYM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCym);
        }
        if ([value caseInsensitiveCompare:@"FRY"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFry);
        }
        if ([value caseInsensitiveCompare:@"WOL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeWol);
        }
        if ([value caseInsensitiveCompare:@"XHO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeXho);
        }
        if ([value caseInsensitiveCompare:@"YID"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeYid);
        }
        if ([value caseInsensitiveCompare:@"YOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeYor);
        }
        if ([value caseInsensitiveCompare:@"ZHA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZha);
        }
        if ([value caseInsensitiveCompare:@"ZUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZul);
        }
        if ([value caseInsensitiveCompare:@"ORJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOrj);
        }
        if ([value caseInsensitiveCompare:@"QPC"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQpc);
        }
        if ([value caseInsensitiveCompare:@"TNG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTng);
        }
        return @(AWSmediaconvertLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertLanguageCodeEng:
                return @"ENG";
            case AWSmediaconvertLanguageCodeSpa:
                return @"SPA";
            case AWSmediaconvertLanguageCodeFra:
                return @"FRA";
            case AWSmediaconvertLanguageCodeDeu:
                return @"DEU";
            case AWSmediaconvertLanguageCodeGer:
                return @"GER";
            case AWSmediaconvertLanguageCodeZho:
                return @"ZHO";
            case AWSmediaconvertLanguageCodeAra:
                return @"ARA";
            case AWSmediaconvertLanguageCodeHin:
                return @"HIN";
            case AWSmediaconvertLanguageCodeJpn:
                return @"JPN";
            case AWSmediaconvertLanguageCodeRus:
                return @"RUS";
            case AWSmediaconvertLanguageCodePor:
                return @"POR";
            case AWSmediaconvertLanguageCodeIta:
                return @"ITA";
            case AWSmediaconvertLanguageCodeUrd:
                return @"URD";
            case AWSmediaconvertLanguageCodeVie:
                return @"VIE";
            case AWSmediaconvertLanguageCodeKor:
                return @"KOR";
            case AWSmediaconvertLanguageCodePan:
                return @"PAN";
            case AWSmediaconvertLanguageCodeAbk:
                return @"ABK";
            case AWSmediaconvertLanguageCodeAar:
                return @"AAR";
            case AWSmediaconvertLanguageCodeAfr:
                return @"AFR";
            case AWSmediaconvertLanguageCodeAka:
                return @"AKA";
            case AWSmediaconvertLanguageCodeSqi:
                return @"SQI";
            case AWSmediaconvertLanguageCodeAmh:
                return @"AMH";
            case AWSmediaconvertLanguageCodeArg:
                return @"ARG";
            case AWSmediaconvertLanguageCodeHye:
                return @"HYE";
            case AWSmediaconvertLanguageCodeAsm:
                return @"ASM";
            case AWSmediaconvertLanguageCodeAva:
                return @"AVA";
            case AWSmediaconvertLanguageCodeAve:
                return @"AVE";
            case AWSmediaconvertLanguageCodeAym:
                return @"AYM";
            case AWSmediaconvertLanguageCodeAze:
                return @"AZE";
            case AWSmediaconvertLanguageCodeBam:
                return @"BAM";
            case AWSmediaconvertLanguageCodeBak:
                return @"BAK";
            case AWSmediaconvertLanguageCodeEus:
                return @"EUS";
            case AWSmediaconvertLanguageCodeBel:
                return @"BEL";
            case AWSmediaconvertLanguageCodeBen:
                return @"BEN";
            case AWSmediaconvertLanguageCodeBih:
                return @"BIH";
            case AWSmediaconvertLanguageCodeBis:
                return @"BIS";
            case AWSmediaconvertLanguageCodeBos:
                return @"BOS";
            case AWSmediaconvertLanguageCodeBre:
                return @"BRE";
            case AWSmediaconvertLanguageCodeBul:
                return @"BUL";
            case AWSmediaconvertLanguageCodeMya:
                return @"MYA";
            case AWSmediaconvertLanguageCodeCat:
                return @"CAT";
            case AWSmediaconvertLanguageCodeKhm:
                return @"KHM";
            case AWSmediaconvertLanguageCodeCha:
                return @"CHA";
            case AWSmediaconvertLanguageCodeChe:
                return @"CHE";
            case AWSmediaconvertLanguageCodeNya:
                return @"NYA";
            case AWSmediaconvertLanguageCodeChu:
                return @"CHU";
            case AWSmediaconvertLanguageCodeChv:
                return @"CHV";
            case AWSmediaconvertLanguageCodeCor:
                return @"COR";
            case AWSmediaconvertLanguageCodeCos:
                return @"COS";
            case AWSmediaconvertLanguageCodeCre:
                return @"CRE";
            case AWSmediaconvertLanguageCodeHrv:
                return @"HRV";
            case AWSmediaconvertLanguageCodeCes:
                return @"CES";
            case AWSmediaconvertLanguageCodeDan:
                return @"DAN";
            case AWSmediaconvertLanguageCodeDiv:
                return @"DIV";
            case AWSmediaconvertLanguageCodeNld:
                return @"NLD";
            case AWSmediaconvertLanguageCodeDzo:
                return @"DZO";
            case AWSmediaconvertLanguageCodeEnm:
                return @"ENM";
            case AWSmediaconvertLanguageCodeEpo:
                return @"EPO";
            case AWSmediaconvertLanguageCodeEst:
                return @"EST";
            case AWSmediaconvertLanguageCodeEwe:
                return @"EWE";
            case AWSmediaconvertLanguageCodeFao:
                return @"FAO";
            case AWSmediaconvertLanguageCodeFij:
                return @"FIJ";
            case AWSmediaconvertLanguageCodeFin:
                return @"FIN";
            case AWSmediaconvertLanguageCodeFrm:
                return @"FRM";
            case AWSmediaconvertLanguageCodeFul:
                return @"FUL";
            case AWSmediaconvertLanguageCodeGla:
                return @"GLA";
            case AWSmediaconvertLanguageCodeGlg:
                return @"GLG";
            case AWSmediaconvertLanguageCodeLug:
                return @"LUG";
            case AWSmediaconvertLanguageCodeKat:
                return @"KAT";
            case AWSmediaconvertLanguageCodeEll:
                return @"ELL";
            case AWSmediaconvertLanguageCodeGrn:
                return @"GRN";
            case AWSmediaconvertLanguageCodeGuj:
                return @"GUJ";
            case AWSmediaconvertLanguageCodeHat:
                return @"HAT";
            case AWSmediaconvertLanguageCodeHau:
                return @"HAU";
            case AWSmediaconvertLanguageCodeHeb:
                return @"HEB";
            case AWSmediaconvertLanguageCodeHer:
                return @"HER";
            case AWSmediaconvertLanguageCodeHmo:
                return @"HMO";
            case AWSmediaconvertLanguageCodeHun:
                return @"HUN";
            case AWSmediaconvertLanguageCodeIsl:
                return @"ISL";
            case AWSmediaconvertLanguageCodeIdo:
                return @"IDO";
            case AWSmediaconvertLanguageCodeIbo:
                return @"IBO";
            case AWSmediaconvertLanguageCodeInd:
                return @"IND";
            case AWSmediaconvertLanguageCodeIna:
                return @"INA";
            case AWSmediaconvertLanguageCodeIle:
                return @"ILE";
            case AWSmediaconvertLanguageCodeIku:
                return @"IKU";
            case AWSmediaconvertLanguageCodeIpk:
                return @"IPK";
            case AWSmediaconvertLanguageCodeGle:
                return @"GLE";
            case AWSmediaconvertLanguageCodeJav:
                return @"JAV";
            case AWSmediaconvertLanguageCodeKal:
                return @"KAL";
            case AWSmediaconvertLanguageCodeKan:
                return @"KAN";
            case AWSmediaconvertLanguageCodeKau:
                return @"KAU";
            case AWSmediaconvertLanguageCodeKas:
                return @"KAS";
            case AWSmediaconvertLanguageCodeKaz:
                return @"KAZ";
            case AWSmediaconvertLanguageCodeKik:
                return @"KIK";
            case AWSmediaconvertLanguageCodeKin:
                return @"KIN";
            case AWSmediaconvertLanguageCodeKir:
                return @"KIR";
            case AWSmediaconvertLanguageCodeKom:
                return @"KOM";
            case AWSmediaconvertLanguageCodeKon:
                return @"KON";
            case AWSmediaconvertLanguageCodeKua:
                return @"KUA";
            case AWSmediaconvertLanguageCodeKur:
                return @"KUR";
            case AWSmediaconvertLanguageCodeLao:
                return @"LAO";
            case AWSmediaconvertLanguageCodeLat:
                return @"LAT";
            case AWSmediaconvertLanguageCodeLav:
                return @"LAV";
            case AWSmediaconvertLanguageCodeLim:
                return @"LIM";
            case AWSmediaconvertLanguageCodeLin:
                return @"LIN";
            case AWSmediaconvertLanguageCodeLit:
                return @"LIT";
            case AWSmediaconvertLanguageCodeLub:
                return @"LUB";
            case AWSmediaconvertLanguageCodeLtz:
                return @"LTZ";
            case AWSmediaconvertLanguageCodeMkd:
                return @"MKD";
            case AWSmediaconvertLanguageCodeMlg:
                return @"MLG";
            case AWSmediaconvertLanguageCodeMsa:
                return @"MSA";
            case AWSmediaconvertLanguageCodeMal:
                return @"MAL";
            case AWSmediaconvertLanguageCodeMlt:
                return @"MLT";
            case AWSmediaconvertLanguageCodeGlv:
                return @"GLV";
            case AWSmediaconvertLanguageCodeMri:
                return @"MRI";
            case AWSmediaconvertLanguageCodeMar:
                return @"MAR";
            case AWSmediaconvertLanguageCodeMah:
                return @"MAH";
            case AWSmediaconvertLanguageCodeMon:
                return @"MON";
            case AWSmediaconvertLanguageCodeNau:
                return @"NAU";
            case AWSmediaconvertLanguageCodeNav:
                return @"NAV";
            case AWSmediaconvertLanguageCodeNde:
                return @"NDE";
            case AWSmediaconvertLanguageCodeNbl:
                return @"NBL";
            case AWSmediaconvertLanguageCodeNdo:
                return @"NDO";
            case AWSmediaconvertLanguageCodeNep:
                return @"NEP";
            case AWSmediaconvertLanguageCodeSme:
                return @"SME";
            case AWSmediaconvertLanguageCodeNor:
                return @"NOR";
            case AWSmediaconvertLanguageCodeNob:
                return @"NOB";
            case AWSmediaconvertLanguageCodeNno:
                return @"NNO";
            case AWSmediaconvertLanguageCodeOci:
                return @"OCI";
            case AWSmediaconvertLanguageCodeOji:
                return @"OJI";
            case AWSmediaconvertLanguageCodeOri:
                return @"ORI";
            case AWSmediaconvertLanguageCodeOrm:
                return @"ORM";
            case AWSmediaconvertLanguageCodeOss:
                return @"OSS";
            case AWSmediaconvertLanguageCodePli:
                return @"PLI";
            case AWSmediaconvertLanguageCodeFas:
                return @"FAS";
            case AWSmediaconvertLanguageCodePol:
                return @"POL";
            case AWSmediaconvertLanguageCodePus:
                return @"PUS";
            case AWSmediaconvertLanguageCodeQue:
                return @"QUE";
            case AWSmediaconvertLanguageCodeQaa:
                return @"QAA";
            case AWSmediaconvertLanguageCodeRon:
                return @"RON";
            case AWSmediaconvertLanguageCodeRoh:
                return @"ROH";
            case AWSmediaconvertLanguageCodeRun:
                return @"RUN";
            case AWSmediaconvertLanguageCodeSmo:
                return @"SMO";
            case AWSmediaconvertLanguageCodeSag:
                return @"SAG";
            case AWSmediaconvertLanguageCodeSan:
                return @"SAN";
            case AWSmediaconvertLanguageCodeSrd:
                return @"SRD";
            case AWSmediaconvertLanguageCodeSrb:
                return @"SRB";
            case AWSmediaconvertLanguageCodeSna:
                return @"SNA";
            case AWSmediaconvertLanguageCodeIii:
                return @"III";
            case AWSmediaconvertLanguageCodeSnd:
                return @"SND";
            case AWSmediaconvertLanguageCodeSin:
                return @"SIN";
            case AWSmediaconvertLanguageCodeSlk:
                return @"SLK";
            case AWSmediaconvertLanguageCodeSlv:
                return @"SLV";
            case AWSmediaconvertLanguageCodeSom:
                return @"SOM";
            case AWSmediaconvertLanguageCodeSot:
                return @"SOT";
            case AWSmediaconvertLanguageCodeSun:
                return @"SUN";
            case AWSmediaconvertLanguageCodeSwa:
                return @"SWA";
            case AWSmediaconvertLanguageCodeSsw:
                return @"SSW";
            case AWSmediaconvertLanguageCodeSwe:
                return @"SWE";
            case AWSmediaconvertLanguageCodeTgl:
                return @"TGL";
            case AWSmediaconvertLanguageCodeTah:
                return @"TAH";
            case AWSmediaconvertLanguageCodeTgk:
                return @"TGK";
            case AWSmediaconvertLanguageCodeTam:
                return @"TAM";
            case AWSmediaconvertLanguageCodeTat:
                return @"TAT";
            case AWSmediaconvertLanguageCodeTel:
                return @"TEL";
            case AWSmediaconvertLanguageCodeTha:
                return @"THA";
            case AWSmediaconvertLanguageCodeBod:
                return @"BOD";
            case AWSmediaconvertLanguageCodeTir:
                return @"TIR";
            case AWSmediaconvertLanguageCodeTon:
                return @"TON";
            case AWSmediaconvertLanguageCodeTso:
                return @"TSO";
            case AWSmediaconvertLanguageCodeTsn:
                return @"TSN";
            case AWSmediaconvertLanguageCodeTur:
                return @"TUR";
            case AWSmediaconvertLanguageCodeTuk:
                return @"TUK";
            case AWSmediaconvertLanguageCodeTwi:
                return @"TWI";
            case AWSmediaconvertLanguageCodeUig:
                return @"UIG";
            case AWSmediaconvertLanguageCodeUkr:
                return @"UKR";
            case AWSmediaconvertLanguageCodeUzb:
                return @"UZB";
            case AWSmediaconvertLanguageCodeVen:
                return @"VEN";
            case AWSmediaconvertLanguageCodeVol:
                return @"VOL";
            case AWSmediaconvertLanguageCodeWln:
                return @"WLN";
            case AWSmediaconvertLanguageCodeCym:
                return @"CYM";
            case AWSmediaconvertLanguageCodeFry:
                return @"FRY";
            case AWSmediaconvertLanguageCodeWol:
                return @"WOL";
            case AWSmediaconvertLanguageCodeXho:
                return @"XHO";
            case AWSmediaconvertLanguageCodeYid:
                return @"YID";
            case AWSmediaconvertLanguageCodeYor:
                return @"YOR";
            case AWSmediaconvertLanguageCodeZha:
                return @"ZHA";
            case AWSmediaconvertLanguageCodeZul:
                return @"ZUL";
            case AWSmediaconvertLanguageCodeOrj:
                return @"ORJ";
            case AWSmediaconvertLanguageCodeQpc:
                return @"QPC";
            case AWSmediaconvertLanguageCodeTng:
                return @"TNG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)remixSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertRemixSettings class]];
}

+ (NSValueTransformer *)selectorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PID"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioSelectorTypePid);
        }
        if ([value caseInsensitiveCompare:@"TRACK"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioSelectorTypeTrack);
        }
        if ([value caseInsensitiveCompare:@"LANGUAGE_CODE"] == NSOrderedSame) {
            return @(AWSmediaconvertAudioSelectorTypeLanguageCode);
        }
        return @(AWSmediaconvertAudioSelectorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAudioSelectorTypePid:
                return @"PID";
            case AWSmediaconvertAudioSelectorTypeTrack:
                return @"TRACK";
            case AWSmediaconvertAudioSelectorTypeLanguageCode:
                return @"LANGUAGE_CODE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertAudioSelectorGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioSelectorNames" : @"AudioSelectorNames",
             };
}

@end

@implementation AWSmediaconvertAv1QvbrSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"qvbrQualityLevel" : @"QvbrQualityLevel",
             @"qvbrQualityLevelFineTune" : @"QvbrQualityLevelFineTune",
             };
}

@end

@implementation AWSmediaconvertAv1Settings

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
            return @(AWSmediaconvertAv1AdaptiveQuantizationOff);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSmediaconvertAv1AdaptiveQuantizationLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSmediaconvertAv1AdaptiveQuantizationMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSmediaconvertAv1AdaptiveQuantizationHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGHER"] == NSOrderedSame) {
            return @(AWSmediaconvertAv1AdaptiveQuantizationHigher);
        }
        if ([value caseInsensitiveCompare:@"MAX"] == NSOrderedSame) {
            return @(AWSmediaconvertAv1AdaptiveQuantizationMax);
        }
        return @(AWSmediaconvertAv1AdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAv1AdaptiveQuantizationOff:
                return @"OFF";
            case AWSmediaconvertAv1AdaptiveQuantizationLow:
                return @"LOW";
            case AWSmediaconvertAv1AdaptiveQuantizationMedium:
                return @"MEDIUM";
            case AWSmediaconvertAv1AdaptiveQuantizationHigh:
                return @"HIGH";
            case AWSmediaconvertAv1AdaptiveQuantizationHigher:
                return @"HIGHER";
            case AWSmediaconvertAv1AdaptiveQuantizationMax:
                return @"MAX";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSmediaconvertAv1FramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSmediaconvertAv1FramerateControlSpecified);
        }
        return @(AWSmediaconvertAv1FramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAv1FramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSmediaconvertAv1FramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateConversionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUPLICATE_DROP"] == NSOrderedSame) {
            return @(AWSmediaconvertAv1FramerateConversionAlgorithmDuplicateDrop);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE"] == NSOrderedSame) {
            return @(AWSmediaconvertAv1FramerateConversionAlgorithmInterpolate);
        }
        return @(AWSmediaconvertAv1FramerateConversionAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAv1FramerateConversionAlgorithmDuplicateDrop:
                return @"DUPLICATE_DROP";
            case AWSmediaconvertAv1FramerateConversionAlgorithmInterpolate:
                return @"INTERPOLATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qvbrSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAv1QvbrSettings class]];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QVBR"] == NSOrderedSame) {
            return @(AWSmediaconvertAv1RateControlModeQvbr);
        }
        return @(AWSmediaconvertAv1RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAv1RateControlModeQvbr:
                return @"QVBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spatialAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertAv1SpatialAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertAv1SpatialAdaptiveQuantizationEnabled);
        }
        return @(AWSmediaconvertAv1SpatialAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAv1SpatialAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSmediaconvertAv1SpatialAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertAvailBlanking

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availBlankingImage" : @"AvailBlankingImage",
             };
}

@end

@implementation AWSmediaconvertBurninDestinationSettings

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
            return @(AWSmediaconvertBurninSubtitleAlignmentCentered);
        }
        if ([value caseInsensitiveCompare:@"LEFT"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleAlignmentLeft);
        }
        return @(AWSmediaconvertBurninSubtitleAlignmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertBurninSubtitleAlignmentCentered:
                return @"CENTERED";
            case AWSmediaconvertBurninSubtitleAlignmentLeft:
                return @"LEFT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)backgroundColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleBackgroundColorNone);
        }
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleBackgroundColorBlack);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleBackgroundColorWhite);
        }
        return @(AWSmediaconvertBurninSubtitleBackgroundColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertBurninSubtitleBackgroundColorNone:
                return @"NONE";
            case AWSmediaconvertBurninSubtitleBackgroundColorBlack:
                return @"BLACK";
            case AWSmediaconvertBurninSubtitleBackgroundColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fontColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleFontColorWhite);
        }
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleFontColorBlack);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleFontColorYellow);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleFontColorRed);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleFontColorGreen);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleFontColorBlue);
        }
        return @(AWSmediaconvertBurninSubtitleFontColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertBurninSubtitleFontColorWhite:
                return @"WHITE";
            case AWSmediaconvertBurninSubtitleFontColorBlack:
                return @"BLACK";
            case AWSmediaconvertBurninSubtitleFontColorYellow:
                return @"YELLOW";
            case AWSmediaconvertBurninSubtitleFontColorRed:
                return @"RED";
            case AWSmediaconvertBurninSubtitleFontColorGreen:
                return @"GREEN";
            case AWSmediaconvertBurninSubtitleFontColorBlue:
                return @"BLUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fontScriptJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTOMATIC"] == NSOrderedSame) {
            return @(AWSmediaconvertFontScriptAutomatic);
        }
        if ([value caseInsensitiveCompare:@"HANS"] == NSOrderedSame) {
            return @(AWSmediaconvertFontScriptHans);
        }
        if ([value caseInsensitiveCompare:@"HANT"] == NSOrderedSame) {
            return @(AWSmediaconvertFontScriptHant);
        }
        return @(AWSmediaconvertFontScriptUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertFontScriptAutomatic:
                return @"AUTOMATIC";
            case AWSmediaconvertFontScriptHans:
                return @"HANS";
            case AWSmediaconvertFontScriptHant:
                return @"HANT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outlineColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleOutlineColorBlack);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleOutlineColorWhite);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleOutlineColorYellow);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleOutlineColorRed);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleOutlineColorGreen);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleOutlineColorBlue);
        }
        return @(AWSmediaconvertBurninSubtitleOutlineColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertBurninSubtitleOutlineColorBlack:
                return @"BLACK";
            case AWSmediaconvertBurninSubtitleOutlineColorWhite:
                return @"WHITE";
            case AWSmediaconvertBurninSubtitleOutlineColorYellow:
                return @"YELLOW";
            case AWSmediaconvertBurninSubtitleOutlineColorRed:
                return @"RED";
            case AWSmediaconvertBurninSubtitleOutlineColorGreen:
                return @"GREEN";
            case AWSmediaconvertBurninSubtitleOutlineColorBlue:
                return @"BLUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)shadowColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleShadowColorNone);
        }
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleShadowColorBlack);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleShadowColorWhite);
        }
        return @(AWSmediaconvertBurninSubtitleShadowColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertBurninSubtitleShadowColorNone:
                return @"NONE";
            case AWSmediaconvertBurninSubtitleShadowColorBlack:
                return @"BLACK";
            case AWSmediaconvertBurninSubtitleShadowColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)teletextSpacingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIXED_GRID"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleTeletextSpacingFixedGrid);
        }
        if ([value caseInsensitiveCompare:@"PROPORTIONAL"] == NSOrderedSame) {
            return @(AWSmediaconvertBurninSubtitleTeletextSpacingProportional);
        }
        return @(AWSmediaconvertBurninSubtitleTeletextSpacingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertBurninSubtitleTeletextSpacingFixedGrid:
                return @"FIXED_GRID";
            case AWSmediaconvertBurninSubtitleTeletextSpacingProportional:
                return @"PROPORTIONAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertCancelJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSmediaconvertCancelJobResponse

@end

@implementation AWSmediaconvertCaptionDescription

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertCaptionDestinationSettings class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEng);
        }
        if ([value caseInsensitiveCompare:@"SPA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSpa);
        }
        if ([value caseInsensitiveCompare:@"FRA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFra);
        }
        if ([value caseInsensitiveCompare:@"DEU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDeu);
        }
        if ([value caseInsensitiveCompare:@"GER"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGer);
        }
        if ([value caseInsensitiveCompare:@"ZHO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZho);
        }
        if ([value caseInsensitiveCompare:@"ARA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAra);
        }
        if ([value caseInsensitiveCompare:@"HIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHin);
        }
        if ([value caseInsensitiveCompare:@"JPN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeJpn);
        }
        if ([value caseInsensitiveCompare:@"RUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRus);
        }
        if ([value caseInsensitiveCompare:@"POR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePor);
        }
        if ([value caseInsensitiveCompare:@"ITA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIta);
        }
        if ([value caseInsensitiveCompare:@"URD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUrd);
        }
        if ([value caseInsensitiveCompare:@"VIE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVie);
        }
        if ([value caseInsensitiveCompare:@"KOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKor);
        }
        if ([value caseInsensitiveCompare:@"PAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePan);
        }
        if ([value caseInsensitiveCompare:@"ABK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAbk);
        }
        if ([value caseInsensitiveCompare:@"AAR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAar);
        }
        if ([value caseInsensitiveCompare:@"AFR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAfr);
        }
        if ([value caseInsensitiveCompare:@"AKA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAka);
        }
        if ([value caseInsensitiveCompare:@"SQI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSqi);
        }
        if ([value caseInsensitiveCompare:@"AMH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAmh);
        }
        if ([value caseInsensitiveCompare:@"ARG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeArg);
        }
        if ([value caseInsensitiveCompare:@"HYE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHye);
        }
        if ([value caseInsensitiveCompare:@"ASM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAsm);
        }
        if ([value caseInsensitiveCompare:@"AVA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAva);
        }
        if ([value caseInsensitiveCompare:@"AVE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAve);
        }
        if ([value caseInsensitiveCompare:@"AYM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAym);
        }
        if ([value caseInsensitiveCompare:@"AZE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAze);
        }
        if ([value caseInsensitiveCompare:@"BAM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBam);
        }
        if ([value caseInsensitiveCompare:@"BAK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBak);
        }
        if ([value caseInsensitiveCompare:@"EUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEus);
        }
        if ([value caseInsensitiveCompare:@"BEL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBel);
        }
        if ([value caseInsensitiveCompare:@"BEN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBen);
        }
        if ([value caseInsensitiveCompare:@"BIH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBih);
        }
        if ([value caseInsensitiveCompare:@"BIS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBis);
        }
        if ([value caseInsensitiveCompare:@"BOS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBos);
        }
        if ([value caseInsensitiveCompare:@"BRE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBre);
        }
        if ([value caseInsensitiveCompare:@"BUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBul);
        }
        if ([value caseInsensitiveCompare:@"MYA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMya);
        }
        if ([value caseInsensitiveCompare:@"CAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCat);
        }
        if ([value caseInsensitiveCompare:@"KHM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKhm);
        }
        if ([value caseInsensitiveCompare:@"CHA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCha);
        }
        if ([value caseInsensitiveCompare:@"CHE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChe);
        }
        if ([value caseInsensitiveCompare:@"NYA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNya);
        }
        if ([value caseInsensitiveCompare:@"CHU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChu);
        }
        if ([value caseInsensitiveCompare:@"CHV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChv);
        }
        if ([value caseInsensitiveCompare:@"COR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCor);
        }
        if ([value caseInsensitiveCompare:@"COS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCos);
        }
        if ([value caseInsensitiveCompare:@"CRE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCre);
        }
        if ([value caseInsensitiveCompare:@"HRV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHrv);
        }
        if ([value caseInsensitiveCompare:@"CES"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCes);
        }
        if ([value caseInsensitiveCompare:@"DAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDan);
        }
        if ([value caseInsensitiveCompare:@"DIV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDiv);
        }
        if ([value caseInsensitiveCompare:@"NLD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNld);
        }
        if ([value caseInsensitiveCompare:@"DZO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDzo);
        }
        if ([value caseInsensitiveCompare:@"ENM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEnm);
        }
        if ([value caseInsensitiveCompare:@"EPO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEpo);
        }
        if ([value caseInsensitiveCompare:@"EST"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEst);
        }
        if ([value caseInsensitiveCompare:@"EWE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEwe);
        }
        if ([value caseInsensitiveCompare:@"FAO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFao);
        }
        if ([value caseInsensitiveCompare:@"FIJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFij);
        }
        if ([value caseInsensitiveCompare:@"FIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFin);
        }
        if ([value caseInsensitiveCompare:@"FRM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFrm);
        }
        if ([value caseInsensitiveCompare:@"FUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFul);
        }
        if ([value caseInsensitiveCompare:@"GLA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGla);
        }
        if ([value caseInsensitiveCompare:@"GLG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGlg);
        }
        if ([value caseInsensitiveCompare:@"LUG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLug);
        }
        if ([value caseInsensitiveCompare:@"KAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKat);
        }
        if ([value caseInsensitiveCompare:@"ELL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEll);
        }
        if ([value caseInsensitiveCompare:@"GRN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGrn);
        }
        if ([value caseInsensitiveCompare:@"GUJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGuj);
        }
        if ([value caseInsensitiveCompare:@"HAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHat);
        }
        if ([value caseInsensitiveCompare:@"HAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHau);
        }
        if ([value caseInsensitiveCompare:@"HEB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHeb);
        }
        if ([value caseInsensitiveCompare:@"HER"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHer);
        }
        if ([value caseInsensitiveCompare:@"HMO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHmo);
        }
        if ([value caseInsensitiveCompare:@"HUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHun);
        }
        if ([value caseInsensitiveCompare:@"ISL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIsl);
        }
        if ([value caseInsensitiveCompare:@"IDO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIdo);
        }
        if ([value caseInsensitiveCompare:@"IBO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIbo);
        }
        if ([value caseInsensitiveCompare:@"IND"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeInd);
        }
        if ([value caseInsensitiveCompare:@"INA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIna);
        }
        if ([value caseInsensitiveCompare:@"ILE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIle);
        }
        if ([value caseInsensitiveCompare:@"IKU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIku);
        }
        if ([value caseInsensitiveCompare:@"IPK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIpk);
        }
        if ([value caseInsensitiveCompare:@"GLE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGle);
        }
        if ([value caseInsensitiveCompare:@"JAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeJav);
        }
        if ([value caseInsensitiveCompare:@"KAL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKal);
        }
        if ([value caseInsensitiveCompare:@"KAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKan);
        }
        if ([value caseInsensitiveCompare:@"KAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKau);
        }
        if ([value caseInsensitiveCompare:@"KAS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKas);
        }
        if ([value caseInsensitiveCompare:@"KAZ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKaz);
        }
        if ([value caseInsensitiveCompare:@"KIK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKik);
        }
        if ([value caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKin);
        }
        if ([value caseInsensitiveCompare:@"KIR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKir);
        }
        if ([value caseInsensitiveCompare:@"KOM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKom);
        }
        if ([value caseInsensitiveCompare:@"KON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKon);
        }
        if ([value caseInsensitiveCompare:@"KUA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKua);
        }
        if ([value caseInsensitiveCompare:@"KUR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKur);
        }
        if ([value caseInsensitiveCompare:@"LAO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLao);
        }
        if ([value caseInsensitiveCompare:@"LAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLat);
        }
        if ([value caseInsensitiveCompare:@"LAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLav);
        }
        if ([value caseInsensitiveCompare:@"LIM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLim);
        }
        if ([value caseInsensitiveCompare:@"LIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLin);
        }
        if ([value caseInsensitiveCompare:@"LIT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLit);
        }
        if ([value caseInsensitiveCompare:@"LUB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLub);
        }
        if ([value caseInsensitiveCompare:@"LTZ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLtz);
        }
        if ([value caseInsensitiveCompare:@"MKD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMkd);
        }
        if ([value caseInsensitiveCompare:@"MLG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMlg);
        }
        if ([value caseInsensitiveCompare:@"MSA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMsa);
        }
        if ([value caseInsensitiveCompare:@"MAL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMal);
        }
        if ([value caseInsensitiveCompare:@"MLT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMlt);
        }
        if ([value caseInsensitiveCompare:@"GLV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGlv);
        }
        if ([value caseInsensitiveCompare:@"MRI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMri);
        }
        if ([value caseInsensitiveCompare:@"MAR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMar);
        }
        if ([value caseInsensitiveCompare:@"MAH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMah);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMon);
        }
        if ([value caseInsensitiveCompare:@"NAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNau);
        }
        if ([value caseInsensitiveCompare:@"NAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNav);
        }
        if ([value caseInsensitiveCompare:@"NDE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNde);
        }
        if ([value caseInsensitiveCompare:@"NBL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNbl);
        }
        if ([value caseInsensitiveCompare:@"NDO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNdo);
        }
        if ([value caseInsensitiveCompare:@"NEP"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNep);
        }
        if ([value caseInsensitiveCompare:@"SME"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSme);
        }
        if ([value caseInsensitiveCompare:@"NOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNor);
        }
        if ([value caseInsensitiveCompare:@"NOB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNob);
        }
        if ([value caseInsensitiveCompare:@"NNO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNno);
        }
        if ([value caseInsensitiveCompare:@"OCI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOci);
        }
        if ([value caseInsensitiveCompare:@"OJI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOji);
        }
        if ([value caseInsensitiveCompare:@"ORI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOri);
        }
        if ([value caseInsensitiveCompare:@"ORM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOrm);
        }
        if ([value caseInsensitiveCompare:@"OSS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOss);
        }
        if ([value caseInsensitiveCompare:@"PLI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePli);
        }
        if ([value caseInsensitiveCompare:@"FAS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFas);
        }
        if ([value caseInsensitiveCompare:@"POL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePol);
        }
        if ([value caseInsensitiveCompare:@"PUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePus);
        }
        if ([value caseInsensitiveCompare:@"QUE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQue);
        }
        if ([value caseInsensitiveCompare:@"QAA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQaa);
        }
        if ([value caseInsensitiveCompare:@"RON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRon);
        }
        if ([value caseInsensitiveCompare:@"ROH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRoh);
        }
        if ([value caseInsensitiveCompare:@"RUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRun);
        }
        if ([value caseInsensitiveCompare:@"SMO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSmo);
        }
        if ([value caseInsensitiveCompare:@"SAG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSag);
        }
        if ([value caseInsensitiveCompare:@"SAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSan);
        }
        if ([value caseInsensitiveCompare:@"SRD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSrd);
        }
        if ([value caseInsensitiveCompare:@"SRB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSrb);
        }
        if ([value caseInsensitiveCompare:@"SNA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSna);
        }
        if ([value caseInsensitiveCompare:@"III"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIii);
        }
        if ([value caseInsensitiveCompare:@"SND"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSnd);
        }
        if ([value caseInsensitiveCompare:@"SIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSin);
        }
        if ([value caseInsensitiveCompare:@"SLK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSlk);
        }
        if ([value caseInsensitiveCompare:@"SLV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSlv);
        }
        if ([value caseInsensitiveCompare:@"SOM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSom);
        }
        if ([value caseInsensitiveCompare:@"SOT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSot);
        }
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSun);
        }
        if ([value caseInsensitiveCompare:@"SWA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSwa);
        }
        if ([value caseInsensitiveCompare:@"SSW"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSsw);
        }
        if ([value caseInsensitiveCompare:@"SWE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSwe);
        }
        if ([value caseInsensitiveCompare:@"TGL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTgl);
        }
        if ([value caseInsensitiveCompare:@"TAH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTah);
        }
        if ([value caseInsensitiveCompare:@"TGK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTgk);
        }
        if ([value caseInsensitiveCompare:@"TAM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTam);
        }
        if ([value caseInsensitiveCompare:@"TAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTat);
        }
        if ([value caseInsensitiveCompare:@"TEL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTel);
        }
        if ([value caseInsensitiveCompare:@"THA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTha);
        }
        if ([value caseInsensitiveCompare:@"BOD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBod);
        }
        if ([value caseInsensitiveCompare:@"TIR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTir);
        }
        if ([value caseInsensitiveCompare:@"TON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTon);
        }
        if ([value caseInsensitiveCompare:@"TSO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTso);
        }
        if ([value caseInsensitiveCompare:@"TSN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTsn);
        }
        if ([value caseInsensitiveCompare:@"TUR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTur);
        }
        if ([value caseInsensitiveCompare:@"TUK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTuk);
        }
        if ([value caseInsensitiveCompare:@"TWI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTwi);
        }
        if ([value caseInsensitiveCompare:@"UIG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUig);
        }
        if ([value caseInsensitiveCompare:@"UKR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUkr);
        }
        if ([value caseInsensitiveCompare:@"UZB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUzb);
        }
        if ([value caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVen);
        }
        if ([value caseInsensitiveCompare:@"VOL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVol);
        }
        if ([value caseInsensitiveCompare:@"WLN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeWln);
        }
        if ([value caseInsensitiveCompare:@"CYM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCym);
        }
        if ([value caseInsensitiveCompare:@"FRY"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFry);
        }
        if ([value caseInsensitiveCompare:@"WOL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeWol);
        }
        if ([value caseInsensitiveCompare:@"XHO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeXho);
        }
        if ([value caseInsensitiveCompare:@"YID"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeYid);
        }
        if ([value caseInsensitiveCompare:@"YOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeYor);
        }
        if ([value caseInsensitiveCompare:@"ZHA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZha);
        }
        if ([value caseInsensitiveCompare:@"ZUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZul);
        }
        if ([value caseInsensitiveCompare:@"ORJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOrj);
        }
        if ([value caseInsensitiveCompare:@"QPC"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQpc);
        }
        if ([value caseInsensitiveCompare:@"TNG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTng);
        }
        return @(AWSmediaconvertLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertLanguageCodeEng:
                return @"ENG";
            case AWSmediaconvertLanguageCodeSpa:
                return @"SPA";
            case AWSmediaconvertLanguageCodeFra:
                return @"FRA";
            case AWSmediaconvertLanguageCodeDeu:
                return @"DEU";
            case AWSmediaconvertLanguageCodeGer:
                return @"GER";
            case AWSmediaconvertLanguageCodeZho:
                return @"ZHO";
            case AWSmediaconvertLanguageCodeAra:
                return @"ARA";
            case AWSmediaconvertLanguageCodeHin:
                return @"HIN";
            case AWSmediaconvertLanguageCodeJpn:
                return @"JPN";
            case AWSmediaconvertLanguageCodeRus:
                return @"RUS";
            case AWSmediaconvertLanguageCodePor:
                return @"POR";
            case AWSmediaconvertLanguageCodeIta:
                return @"ITA";
            case AWSmediaconvertLanguageCodeUrd:
                return @"URD";
            case AWSmediaconvertLanguageCodeVie:
                return @"VIE";
            case AWSmediaconvertLanguageCodeKor:
                return @"KOR";
            case AWSmediaconvertLanguageCodePan:
                return @"PAN";
            case AWSmediaconvertLanguageCodeAbk:
                return @"ABK";
            case AWSmediaconvertLanguageCodeAar:
                return @"AAR";
            case AWSmediaconvertLanguageCodeAfr:
                return @"AFR";
            case AWSmediaconvertLanguageCodeAka:
                return @"AKA";
            case AWSmediaconvertLanguageCodeSqi:
                return @"SQI";
            case AWSmediaconvertLanguageCodeAmh:
                return @"AMH";
            case AWSmediaconvertLanguageCodeArg:
                return @"ARG";
            case AWSmediaconvertLanguageCodeHye:
                return @"HYE";
            case AWSmediaconvertLanguageCodeAsm:
                return @"ASM";
            case AWSmediaconvertLanguageCodeAva:
                return @"AVA";
            case AWSmediaconvertLanguageCodeAve:
                return @"AVE";
            case AWSmediaconvertLanguageCodeAym:
                return @"AYM";
            case AWSmediaconvertLanguageCodeAze:
                return @"AZE";
            case AWSmediaconvertLanguageCodeBam:
                return @"BAM";
            case AWSmediaconvertLanguageCodeBak:
                return @"BAK";
            case AWSmediaconvertLanguageCodeEus:
                return @"EUS";
            case AWSmediaconvertLanguageCodeBel:
                return @"BEL";
            case AWSmediaconvertLanguageCodeBen:
                return @"BEN";
            case AWSmediaconvertLanguageCodeBih:
                return @"BIH";
            case AWSmediaconvertLanguageCodeBis:
                return @"BIS";
            case AWSmediaconvertLanguageCodeBos:
                return @"BOS";
            case AWSmediaconvertLanguageCodeBre:
                return @"BRE";
            case AWSmediaconvertLanguageCodeBul:
                return @"BUL";
            case AWSmediaconvertLanguageCodeMya:
                return @"MYA";
            case AWSmediaconvertLanguageCodeCat:
                return @"CAT";
            case AWSmediaconvertLanguageCodeKhm:
                return @"KHM";
            case AWSmediaconvertLanguageCodeCha:
                return @"CHA";
            case AWSmediaconvertLanguageCodeChe:
                return @"CHE";
            case AWSmediaconvertLanguageCodeNya:
                return @"NYA";
            case AWSmediaconvertLanguageCodeChu:
                return @"CHU";
            case AWSmediaconvertLanguageCodeChv:
                return @"CHV";
            case AWSmediaconvertLanguageCodeCor:
                return @"COR";
            case AWSmediaconvertLanguageCodeCos:
                return @"COS";
            case AWSmediaconvertLanguageCodeCre:
                return @"CRE";
            case AWSmediaconvertLanguageCodeHrv:
                return @"HRV";
            case AWSmediaconvertLanguageCodeCes:
                return @"CES";
            case AWSmediaconvertLanguageCodeDan:
                return @"DAN";
            case AWSmediaconvertLanguageCodeDiv:
                return @"DIV";
            case AWSmediaconvertLanguageCodeNld:
                return @"NLD";
            case AWSmediaconvertLanguageCodeDzo:
                return @"DZO";
            case AWSmediaconvertLanguageCodeEnm:
                return @"ENM";
            case AWSmediaconvertLanguageCodeEpo:
                return @"EPO";
            case AWSmediaconvertLanguageCodeEst:
                return @"EST";
            case AWSmediaconvertLanguageCodeEwe:
                return @"EWE";
            case AWSmediaconvertLanguageCodeFao:
                return @"FAO";
            case AWSmediaconvertLanguageCodeFij:
                return @"FIJ";
            case AWSmediaconvertLanguageCodeFin:
                return @"FIN";
            case AWSmediaconvertLanguageCodeFrm:
                return @"FRM";
            case AWSmediaconvertLanguageCodeFul:
                return @"FUL";
            case AWSmediaconvertLanguageCodeGla:
                return @"GLA";
            case AWSmediaconvertLanguageCodeGlg:
                return @"GLG";
            case AWSmediaconvertLanguageCodeLug:
                return @"LUG";
            case AWSmediaconvertLanguageCodeKat:
                return @"KAT";
            case AWSmediaconvertLanguageCodeEll:
                return @"ELL";
            case AWSmediaconvertLanguageCodeGrn:
                return @"GRN";
            case AWSmediaconvertLanguageCodeGuj:
                return @"GUJ";
            case AWSmediaconvertLanguageCodeHat:
                return @"HAT";
            case AWSmediaconvertLanguageCodeHau:
                return @"HAU";
            case AWSmediaconvertLanguageCodeHeb:
                return @"HEB";
            case AWSmediaconvertLanguageCodeHer:
                return @"HER";
            case AWSmediaconvertLanguageCodeHmo:
                return @"HMO";
            case AWSmediaconvertLanguageCodeHun:
                return @"HUN";
            case AWSmediaconvertLanguageCodeIsl:
                return @"ISL";
            case AWSmediaconvertLanguageCodeIdo:
                return @"IDO";
            case AWSmediaconvertLanguageCodeIbo:
                return @"IBO";
            case AWSmediaconvertLanguageCodeInd:
                return @"IND";
            case AWSmediaconvertLanguageCodeIna:
                return @"INA";
            case AWSmediaconvertLanguageCodeIle:
                return @"ILE";
            case AWSmediaconvertLanguageCodeIku:
                return @"IKU";
            case AWSmediaconvertLanguageCodeIpk:
                return @"IPK";
            case AWSmediaconvertLanguageCodeGle:
                return @"GLE";
            case AWSmediaconvertLanguageCodeJav:
                return @"JAV";
            case AWSmediaconvertLanguageCodeKal:
                return @"KAL";
            case AWSmediaconvertLanguageCodeKan:
                return @"KAN";
            case AWSmediaconvertLanguageCodeKau:
                return @"KAU";
            case AWSmediaconvertLanguageCodeKas:
                return @"KAS";
            case AWSmediaconvertLanguageCodeKaz:
                return @"KAZ";
            case AWSmediaconvertLanguageCodeKik:
                return @"KIK";
            case AWSmediaconvertLanguageCodeKin:
                return @"KIN";
            case AWSmediaconvertLanguageCodeKir:
                return @"KIR";
            case AWSmediaconvertLanguageCodeKom:
                return @"KOM";
            case AWSmediaconvertLanguageCodeKon:
                return @"KON";
            case AWSmediaconvertLanguageCodeKua:
                return @"KUA";
            case AWSmediaconvertLanguageCodeKur:
                return @"KUR";
            case AWSmediaconvertLanguageCodeLao:
                return @"LAO";
            case AWSmediaconvertLanguageCodeLat:
                return @"LAT";
            case AWSmediaconvertLanguageCodeLav:
                return @"LAV";
            case AWSmediaconvertLanguageCodeLim:
                return @"LIM";
            case AWSmediaconvertLanguageCodeLin:
                return @"LIN";
            case AWSmediaconvertLanguageCodeLit:
                return @"LIT";
            case AWSmediaconvertLanguageCodeLub:
                return @"LUB";
            case AWSmediaconvertLanguageCodeLtz:
                return @"LTZ";
            case AWSmediaconvertLanguageCodeMkd:
                return @"MKD";
            case AWSmediaconvertLanguageCodeMlg:
                return @"MLG";
            case AWSmediaconvertLanguageCodeMsa:
                return @"MSA";
            case AWSmediaconvertLanguageCodeMal:
                return @"MAL";
            case AWSmediaconvertLanguageCodeMlt:
                return @"MLT";
            case AWSmediaconvertLanguageCodeGlv:
                return @"GLV";
            case AWSmediaconvertLanguageCodeMri:
                return @"MRI";
            case AWSmediaconvertLanguageCodeMar:
                return @"MAR";
            case AWSmediaconvertLanguageCodeMah:
                return @"MAH";
            case AWSmediaconvertLanguageCodeMon:
                return @"MON";
            case AWSmediaconvertLanguageCodeNau:
                return @"NAU";
            case AWSmediaconvertLanguageCodeNav:
                return @"NAV";
            case AWSmediaconvertLanguageCodeNde:
                return @"NDE";
            case AWSmediaconvertLanguageCodeNbl:
                return @"NBL";
            case AWSmediaconvertLanguageCodeNdo:
                return @"NDO";
            case AWSmediaconvertLanguageCodeNep:
                return @"NEP";
            case AWSmediaconvertLanguageCodeSme:
                return @"SME";
            case AWSmediaconvertLanguageCodeNor:
                return @"NOR";
            case AWSmediaconvertLanguageCodeNob:
                return @"NOB";
            case AWSmediaconvertLanguageCodeNno:
                return @"NNO";
            case AWSmediaconvertLanguageCodeOci:
                return @"OCI";
            case AWSmediaconvertLanguageCodeOji:
                return @"OJI";
            case AWSmediaconvertLanguageCodeOri:
                return @"ORI";
            case AWSmediaconvertLanguageCodeOrm:
                return @"ORM";
            case AWSmediaconvertLanguageCodeOss:
                return @"OSS";
            case AWSmediaconvertLanguageCodePli:
                return @"PLI";
            case AWSmediaconvertLanguageCodeFas:
                return @"FAS";
            case AWSmediaconvertLanguageCodePol:
                return @"POL";
            case AWSmediaconvertLanguageCodePus:
                return @"PUS";
            case AWSmediaconvertLanguageCodeQue:
                return @"QUE";
            case AWSmediaconvertLanguageCodeQaa:
                return @"QAA";
            case AWSmediaconvertLanguageCodeRon:
                return @"RON";
            case AWSmediaconvertLanguageCodeRoh:
                return @"ROH";
            case AWSmediaconvertLanguageCodeRun:
                return @"RUN";
            case AWSmediaconvertLanguageCodeSmo:
                return @"SMO";
            case AWSmediaconvertLanguageCodeSag:
                return @"SAG";
            case AWSmediaconvertLanguageCodeSan:
                return @"SAN";
            case AWSmediaconvertLanguageCodeSrd:
                return @"SRD";
            case AWSmediaconvertLanguageCodeSrb:
                return @"SRB";
            case AWSmediaconvertLanguageCodeSna:
                return @"SNA";
            case AWSmediaconvertLanguageCodeIii:
                return @"III";
            case AWSmediaconvertLanguageCodeSnd:
                return @"SND";
            case AWSmediaconvertLanguageCodeSin:
                return @"SIN";
            case AWSmediaconvertLanguageCodeSlk:
                return @"SLK";
            case AWSmediaconvertLanguageCodeSlv:
                return @"SLV";
            case AWSmediaconvertLanguageCodeSom:
                return @"SOM";
            case AWSmediaconvertLanguageCodeSot:
                return @"SOT";
            case AWSmediaconvertLanguageCodeSun:
                return @"SUN";
            case AWSmediaconvertLanguageCodeSwa:
                return @"SWA";
            case AWSmediaconvertLanguageCodeSsw:
                return @"SSW";
            case AWSmediaconvertLanguageCodeSwe:
                return @"SWE";
            case AWSmediaconvertLanguageCodeTgl:
                return @"TGL";
            case AWSmediaconvertLanguageCodeTah:
                return @"TAH";
            case AWSmediaconvertLanguageCodeTgk:
                return @"TGK";
            case AWSmediaconvertLanguageCodeTam:
                return @"TAM";
            case AWSmediaconvertLanguageCodeTat:
                return @"TAT";
            case AWSmediaconvertLanguageCodeTel:
                return @"TEL";
            case AWSmediaconvertLanguageCodeTha:
                return @"THA";
            case AWSmediaconvertLanguageCodeBod:
                return @"BOD";
            case AWSmediaconvertLanguageCodeTir:
                return @"TIR";
            case AWSmediaconvertLanguageCodeTon:
                return @"TON";
            case AWSmediaconvertLanguageCodeTso:
                return @"TSO";
            case AWSmediaconvertLanguageCodeTsn:
                return @"TSN";
            case AWSmediaconvertLanguageCodeTur:
                return @"TUR";
            case AWSmediaconvertLanguageCodeTuk:
                return @"TUK";
            case AWSmediaconvertLanguageCodeTwi:
                return @"TWI";
            case AWSmediaconvertLanguageCodeUig:
                return @"UIG";
            case AWSmediaconvertLanguageCodeUkr:
                return @"UKR";
            case AWSmediaconvertLanguageCodeUzb:
                return @"UZB";
            case AWSmediaconvertLanguageCodeVen:
                return @"VEN";
            case AWSmediaconvertLanguageCodeVol:
                return @"VOL";
            case AWSmediaconvertLanguageCodeWln:
                return @"WLN";
            case AWSmediaconvertLanguageCodeCym:
                return @"CYM";
            case AWSmediaconvertLanguageCodeFry:
                return @"FRY";
            case AWSmediaconvertLanguageCodeWol:
                return @"WOL";
            case AWSmediaconvertLanguageCodeXho:
                return @"XHO";
            case AWSmediaconvertLanguageCodeYid:
                return @"YID";
            case AWSmediaconvertLanguageCodeYor:
                return @"YOR";
            case AWSmediaconvertLanguageCodeZha:
                return @"ZHA";
            case AWSmediaconvertLanguageCodeZul:
                return @"ZUL";
            case AWSmediaconvertLanguageCodeOrj:
                return @"ORJ";
            case AWSmediaconvertLanguageCodeQpc:
                return @"QPC";
            case AWSmediaconvertLanguageCodeTng:
                return @"TNG";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertCaptionDescriptionPreset

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customLanguageCode" : @"CustomLanguageCode",
             @"destinationSettings" : @"DestinationSettings",
             @"languageCode" : @"LanguageCode",
             @"languageDescription" : @"LanguageDescription",
             };
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertCaptionDestinationSettings class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEng);
        }
        if ([value caseInsensitiveCompare:@"SPA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSpa);
        }
        if ([value caseInsensitiveCompare:@"FRA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFra);
        }
        if ([value caseInsensitiveCompare:@"DEU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDeu);
        }
        if ([value caseInsensitiveCompare:@"GER"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGer);
        }
        if ([value caseInsensitiveCompare:@"ZHO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZho);
        }
        if ([value caseInsensitiveCompare:@"ARA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAra);
        }
        if ([value caseInsensitiveCompare:@"HIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHin);
        }
        if ([value caseInsensitiveCompare:@"JPN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeJpn);
        }
        if ([value caseInsensitiveCompare:@"RUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRus);
        }
        if ([value caseInsensitiveCompare:@"POR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePor);
        }
        if ([value caseInsensitiveCompare:@"ITA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIta);
        }
        if ([value caseInsensitiveCompare:@"URD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUrd);
        }
        if ([value caseInsensitiveCompare:@"VIE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVie);
        }
        if ([value caseInsensitiveCompare:@"KOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKor);
        }
        if ([value caseInsensitiveCompare:@"PAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePan);
        }
        if ([value caseInsensitiveCompare:@"ABK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAbk);
        }
        if ([value caseInsensitiveCompare:@"AAR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAar);
        }
        if ([value caseInsensitiveCompare:@"AFR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAfr);
        }
        if ([value caseInsensitiveCompare:@"AKA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAka);
        }
        if ([value caseInsensitiveCompare:@"SQI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSqi);
        }
        if ([value caseInsensitiveCompare:@"AMH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAmh);
        }
        if ([value caseInsensitiveCompare:@"ARG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeArg);
        }
        if ([value caseInsensitiveCompare:@"HYE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHye);
        }
        if ([value caseInsensitiveCompare:@"ASM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAsm);
        }
        if ([value caseInsensitiveCompare:@"AVA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAva);
        }
        if ([value caseInsensitiveCompare:@"AVE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAve);
        }
        if ([value caseInsensitiveCompare:@"AYM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAym);
        }
        if ([value caseInsensitiveCompare:@"AZE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAze);
        }
        if ([value caseInsensitiveCompare:@"BAM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBam);
        }
        if ([value caseInsensitiveCompare:@"BAK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBak);
        }
        if ([value caseInsensitiveCompare:@"EUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEus);
        }
        if ([value caseInsensitiveCompare:@"BEL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBel);
        }
        if ([value caseInsensitiveCompare:@"BEN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBen);
        }
        if ([value caseInsensitiveCompare:@"BIH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBih);
        }
        if ([value caseInsensitiveCompare:@"BIS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBis);
        }
        if ([value caseInsensitiveCompare:@"BOS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBos);
        }
        if ([value caseInsensitiveCompare:@"BRE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBre);
        }
        if ([value caseInsensitiveCompare:@"BUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBul);
        }
        if ([value caseInsensitiveCompare:@"MYA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMya);
        }
        if ([value caseInsensitiveCompare:@"CAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCat);
        }
        if ([value caseInsensitiveCompare:@"KHM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKhm);
        }
        if ([value caseInsensitiveCompare:@"CHA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCha);
        }
        if ([value caseInsensitiveCompare:@"CHE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChe);
        }
        if ([value caseInsensitiveCompare:@"NYA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNya);
        }
        if ([value caseInsensitiveCompare:@"CHU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChu);
        }
        if ([value caseInsensitiveCompare:@"CHV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChv);
        }
        if ([value caseInsensitiveCompare:@"COR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCor);
        }
        if ([value caseInsensitiveCompare:@"COS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCos);
        }
        if ([value caseInsensitiveCompare:@"CRE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCre);
        }
        if ([value caseInsensitiveCompare:@"HRV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHrv);
        }
        if ([value caseInsensitiveCompare:@"CES"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCes);
        }
        if ([value caseInsensitiveCompare:@"DAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDan);
        }
        if ([value caseInsensitiveCompare:@"DIV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDiv);
        }
        if ([value caseInsensitiveCompare:@"NLD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNld);
        }
        if ([value caseInsensitiveCompare:@"DZO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDzo);
        }
        if ([value caseInsensitiveCompare:@"ENM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEnm);
        }
        if ([value caseInsensitiveCompare:@"EPO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEpo);
        }
        if ([value caseInsensitiveCompare:@"EST"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEst);
        }
        if ([value caseInsensitiveCompare:@"EWE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEwe);
        }
        if ([value caseInsensitiveCompare:@"FAO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFao);
        }
        if ([value caseInsensitiveCompare:@"FIJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFij);
        }
        if ([value caseInsensitiveCompare:@"FIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFin);
        }
        if ([value caseInsensitiveCompare:@"FRM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFrm);
        }
        if ([value caseInsensitiveCompare:@"FUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFul);
        }
        if ([value caseInsensitiveCompare:@"GLA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGla);
        }
        if ([value caseInsensitiveCompare:@"GLG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGlg);
        }
        if ([value caseInsensitiveCompare:@"LUG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLug);
        }
        if ([value caseInsensitiveCompare:@"KAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKat);
        }
        if ([value caseInsensitiveCompare:@"ELL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEll);
        }
        if ([value caseInsensitiveCompare:@"GRN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGrn);
        }
        if ([value caseInsensitiveCompare:@"GUJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGuj);
        }
        if ([value caseInsensitiveCompare:@"HAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHat);
        }
        if ([value caseInsensitiveCompare:@"HAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHau);
        }
        if ([value caseInsensitiveCompare:@"HEB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHeb);
        }
        if ([value caseInsensitiveCompare:@"HER"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHer);
        }
        if ([value caseInsensitiveCompare:@"HMO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHmo);
        }
        if ([value caseInsensitiveCompare:@"HUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHun);
        }
        if ([value caseInsensitiveCompare:@"ISL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIsl);
        }
        if ([value caseInsensitiveCompare:@"IDO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIdo);
        }
        if ([value caseInsensitiveCompare:@"IBO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIbo);
        }
        if ([value caseInsensitiveCompare:@"IND"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeInd);
        }
        if ([value caseInsensitiveCompare:@"INA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIna);
        }
        if ([value caseInsensitiveCompare:@"ILE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIle);
        }
        if ([value caseInsensitiveCompare:@"IKU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIku);
        }
        if ([value caseInsensitiveCompare:@"IPK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIpk);
        }
        if ([value caseInsensitiveCompare:@"GLE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGle);
        }
        if ([value caseInsensitiveCompare:@"JAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeJav);
        }
        if ([value caseInsensitiveCompare:@"KAL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKal);
        }
        if ([value caseInsensitiveCompare:@"KAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKan);
        }
        if ([value caseInsensitiveCompare:@"KAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKau);
        }
        if ([value caseInsensitiveCompare:@"KAS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKas);
        }
        if ([value caseInsensitiveCompare:@"KAZ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKaz);
        }
        if ([value caseInsensitiveCompare:@"KIK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKik);
        }
        if ([value caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKin);
        }
        if ([value caseInsensitiveCompare:@"KIR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKir);
        }
        if ([value caseInsensitiveCompare:@"KOM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKom);
        }
        if ([value caseInsensitiveCompare:@"KON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKon);
        }
        if ([value caseInsensitiveCompare:@"KUA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKua);
        }
        if ([value caseInsensitiveCompare:@"KUR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKur);
        }
        if ([value caseInsensitiveCompare:@"LAO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLao);
        }
        if ([value caseInsensitiveCompare:@"LAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLat);
        }
        if ([value caseInsensitiveCompare:@"LAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLav);
        }
        if ([value caseInsensitiveCompare:@"LIM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLim);
        }
        if ([value caseInsensitiveCompare:@"LIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLin);
        }
        if ([value caseInsensitiveCompare:@"LIT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLit);
        }
        if ([value caseInsensitiveCompare:@"LUB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLub);
        }
        if ([value caseInsensitiveCompare:@"LTZ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLtz);
        }
        if ([value caseInsensitiveCompare:@"MKD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMkd);
        }
        if ([value caseInsensitiveCompare:@"MLG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMlg);
        }
        if ([value caseInsensitiveCompare:@"MSA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMsa);
        }
        if ([value caseInsensitiveCompare:@"MAL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMal);
        }
        if ([value caseInsensitiveCompare:@"MLT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMlt);
        }
        if ([value caseInsensitiveCompare:@"GLV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGlv);
        }
        if ([value caseInsensitiveCompare:@"MRI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMri);
        }
        if ([value caseInsensitiveCompare:@"MAR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMar);
        }
        if ([value caseInsensitiveCompare:@"MAH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMah);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMon);
        }
        if ([value caseInsensitiveCompare:@"NAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNau);
        }
        if ([value caseInsensitiveCompare:@"NAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNav);
        }
        if ([value caseInsensitiveCompare:@"NDE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNde);
        }
        if ([value caseInsensitiveCompare:@"NBL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNbl);
        }
        if ([value caseInsensitiveCompare:@"NDO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNdo);
        }
        if ([value caseInsensitiveCompare:@"NEP"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNep);
        }
        if ([value caseInsensitiveCompare:@"SME"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSme);
        }
        if ([value caseInsensitiveCompare:@"NOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNor);
        }
        if ([value caseInsensitiveCompare:@"NOB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNob);
        }
        if ([value caseInsensitiveCompare:@"NNO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNno);
        }
        if ([value caseInsensitiveCompare:@"OCI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOci);
        }
        if ([value caseInsensitiveCompare:@"OJI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOji);
        }
        if ([value caseInsensitiveCompare:@"ORI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOri);
        }
        if ([value caseInsensitiveCompare:@"ORM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOrm);
        }
        if ([value caseInsensitiveCompare:@"OSS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOss);
        }
        if ([value caseInsensitiveCompare:@"PLI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePli);
        }
        if ([value caseInsensitiveCompare:@"FAS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFas);
        }
        if ([value caseInsensitiveCompare:@"POL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePol);
        }
        if ([value caseInsensitiveCompare:@"PUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePus);
        }
        if ([value caseInsensitiveCompare:@"QUE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQue);
        }
        if ([value caseInsensitiveCompare:@"QAA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQaa);
        }
        if ([value caseInsensitiveCompare:@"RON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRon);
        }
        if ([value caseInsensitiveCompare:@"ROH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRoh);
        }
        if ([value caseInsensitiveCompare:@"RUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRun);
        }
        if ([value caseInsensitiveCompare:@"SMO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSmo);
        }
        if ([value caseInsensitiveCompare:@"SAG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSag);
        }
        if ([value caseInsensitiveCompare:@"SAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSan);
        }
        if ([value caseInsensitiveCompare:@"SRD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSrd);
        }
        if ([value caseInsensitiveCompare:@"SRB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSrb);
        }
        if ([value caseInsensitiveCompare:@"SNA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSna);
        }
        if ([value caseInsensitiveCompare:@"III"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIii);
        }
        if ([value caseInsensitiveCompare:@"SND"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSnd);
        }
        if ([value caseInsensitiveCompare:@"SIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSin);
        }
        if ([value caseInsensitiveCompare:@"SLK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSlk);
        }
        if ([value caseInsensitiveCompare:@"SLV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSlv);
        }
        if ([value caseInsensitiveCompare:@"SOM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSom);
        }
        if ([value caseInsensitiveCompare:@"SOT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSot);
        }
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSun);
        }
        if ([value caseInsensitiveCompare:@"SWA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSwa);
        }
        if ([value caseInsensitiveCompare:@"SSW"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSsw);
        }
        if ([value caseInsensitiveCompare:@"SWE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSwe);
        }
        if ([value caseInsensitiveCompare:@"TGL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTgl);
        }
        if ([value caseInsensitiveCompare:@"TAH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTah);
        }
        if ([value caseInsensitiveCompare:@"TGK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTgk);
        }
        if ([value caseInsensitiveCompare:@"TAM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTam);
        }
        if ([value caseInsensitiveCompare:@"TAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTat);
        }
        if ([value caseInsensitiveCompare:@"TEL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTel);
        }
        if ([value caseInsensitiveCompare:@"THA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTha);
        }
        if ([value caseInsensitiveCompare:@"BOD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBod);
        }
        if ([value caseInsensitiveCompare:@"TIR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTir);
        }
        if ([value caseInsensitiveCompare:@"TON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTon);
        }
        if ([value caseInsensitiveCompare:@"TSO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTso);
        }
        if ([value caseInsensitiveCompare:@"TSN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTsn);
        }
        if ([value caseInsensitiveCompare:@"TUR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTur);
        }
        if ([value caseInsensitiveCompare:@"TUK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTuk);
        }
        if ([value caseInsensitiveCompare:@"TWI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTwi);
        }
        if ([value caseInsensitiveCompare:@"UIG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUig);
        }
        if ([value caseInsensitiveCompare:@"UKR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUkr);
        }
        if ([value caseInsensitiveCompare:@"UZB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUzb);
        }
        if ([value caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVen);
        }
        if ([value caseInsensitiveCompare:@"VOL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVol);
        }
        if ([value caseInsensitiveCompare:@"WLN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeWln);
        }
        if ([value caseInsensitiveCompare:@"CYM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCym);
        }
        if ([value caseInsensitiveCompare:@"FRY"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFry);
        }
        if ([value caseInsensitiveCompare:@"WOL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeWol);
        }
        if ([value caseInsensitiveCompare:@"XHO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeXho);
        }
        if ([value caseInsensitiveCompare:@"YID"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeYid);
        }
        if ([value caseInsensitiveCompare:@"YOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeYor);
        }
        if ([value caseInsensitiveCompare:@"ZHA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZha);
        }
        if ([value caseInsensitiveCompare:@"ZUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZul);
        }
        if ([value caseInsensitiveCompare:@"ORJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOrj);
        }
        if ([value caseInsensitiveCompare:@"QPC"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQpc);
        }
        if ([value caseInsensitiveCompare:@"TNG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTng);
        }
        return @(AWSmediaconvertLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertLanguageCodeEng:
                return @"ENG";
            case AWSmediaconvertLanguageCodeSpa:
                return @"SPA";
            case AWSmediaconvertLanguageCodeFra:
                return @"FRA";
            case AWSmediaconvertLanguageCodeDeu:
                return @"DEU";
            case AWSmediaconvertLanguageCodeGer:
                return @"GER";
            case AWSmediaconvertLanguageCodeZho:
                return @"ZHO";
            case AWSmediaconvertLanguageCodeAra:
                return @"ARA";
            case AWSmediaconvertLanguageCodeHin:
                return @"HIN";
            case AWSmediaconvertLanguageCodeJpn:
                return @"JPN";
            case AWSmediaconvertLanguageCodeRus:
                return @"RUS";
            case AWSmediaconvertLanguageCodePor:
                return @"POR";
            case AWSmediaconvertLanguageCodeIta:
                return @"ITA";
            case AWSmediaconvertLanguageCodeUrd:
                return @"URD";
            case AWSmediaconvertLanguageCodeVie:
                return @"VIE";
            case AWSmediaconvertLanguageCodeKor:
                return @"KOR";
            case AWSmediaconvertLanguageCodePan:
                return @"PAN";
            case AWSmediaconvertLanguageCodeAbk:
                return @"ABK";
            case AWSmediaconvertLanguageCodeAar:
                return @"AAR";
            case AWSmediaconvertLanguageCodeAfr:
                return @"AFR";
            case AWSmediaconvertLanguageCodeAka:
                return @"AKA";
            case AWSmediaconvertLanguageCodeSqi:
                return @"SQI";
            case AWSmediaconvertLanguageCodeAmh:
                return @"AMH";
            case AWSmediaconvertLanguageCodeArg:
                return @"ARG";
            case AWSmediaconvertLanguageCodeHye:
                return @"HYE";
            case AWSmediaconvertLanguageCodeAsm:
                return @"ASM";
            case AWSmediaconvertLanguageCodeAva:
                return @"AVA";
            case AWSmediaconvertLanguageCodeAve:
                return @"AVE";
            case AWSmediaconvertLanguageCodeAym:
                return @"AYM";
            case AWSmediaconvertLanguageCodeAze:
                return @"AZE";
            case AWSmediaconvertLanguageCodeBam:
                return @"BAM";
            case AWSmediaconvertLanguageCodeBak:
                return @"BAK";
            case AWSmediaconvertLanguageCodeEus:
                return @"EUS";
            case AWSmediaconvertLanguageCodeBel:
                return @"BEL";
            case AWSmediaconvertLanguageCodeBen:
                return @"BEN";
            case AWSmediaconvertLanguageCodeBih:
                return @"BIH";
            case AWSmediaconvertLanguageCodeBis:
                return @"BIS";
            case AWSmediaconvertLanguageCodeBos:
                return @"BOS";
            case AWSmediaconvertLanguageCodeBre:
                return @"BRE";
            case AWSmediaconvertLanguageCodeBul:
                return @"BUL";
            case AWSmediaconvertLanguageCodeMya:
                return @"MYA";
            case AWSmediaconvertLanguageCodeCat:
                return @"CAT";
            case AWSmediaconvertLanguageCodeKhm:
                return @"KHM";
            case AWSmediaconvertLanguageCodeCha:
                return @"CHA";
            case AWSmediaconvertLanguageCodeChe:
                return @"CHE";
            case AWSmediaconvertLanguageCodeNya:
                return @"NYA";
            case AWSmediaconvertLanguageCodeChu:
                return @"CHU";
            case AWSmediaconvertLanguageCodeChv:
                return @"CHV";
            case AWSmediaconvertLanguageCodeCor:
                return @"COR";
            case AWSmediaconvertLanguageCodeCos:
                return @"COS";
            case AWSmediaconvertLanguageCodeCre:
                return @"CRE";
            case AWSmediaconvertLanguageCodeHrv:
                return @"HRV";
            case AWSmediaconvertLanguageCodeCes:
                return @"CES";
            case AWSmediaconvertLanguageCodeDan:
                return @"DAN";
            case AWSmediaconvertLanguageCodeDiv:
                return @"DIV";
            case AWSmediaconvertLanguageCodeNld:
                return @"NLD";
            case AWSmediaconvertLanguageCodeDzo:
                return @"DZO";
            case AWSmediaconvertLanguageCodeEnm:
                return @"ENM";
            case AWSmediaconvertLanguageCodeEpo:
                return @"EPO";
            case AWSmediaconvertLanguageCodeEst:
                return @"EST";
            case AWSmediaconvertLanguageCodeEwe:
                return @"EWE";
            case AWSmediaconvertLanguageCodeFao:
                return @"FAO";
            case AWSmediaconvertLanguageCodeFij:
                return @"FIJ";
            case AWSmediaconvertLanguageCodeFin:
                return @"FIN";
            case AWSmediaconvertLanguageCodeFrm:
                return @"FRM";
            case AWSmediaconvertLanguageCodeFul:
                return @"FUL";
            case AWSmediaconvertLanguageCodeGla:
                return @"GLA";
            case AWSmediaconvertLanguageCodeGlg:
                return @"GLG";
            case AWSmediaconvertLanguageCodeLug:
                return @"LUG";
            case AWSmediaconvertLanguageCodeKat:
                return @"KAT";
            case AWSmediaconvertLanguageCodeEll:
                return @"ELL";
            case AWSmediaconvertLanguageCodeGrn:
                return @"GRN";
            case AWSmediaconvertLanguageCodeGuj:
                return @"GUJ";
            case AWSmediaconvertLanguageCodeHat:
                return @"HAT";
            case AWSmediaconvertLanguageCodeHau:
                return @"HAU";
            case AWSmediaconvertLanguageCodeHeb:
                return @"HEB";
            case AWSmediaconvertLanguageCodeHer:
                return @"HER";
            case AWSmediaconvertLanguageCodeHmo:
                return @"HMO";
            case AWSmediaconvertLanguageCodeHun:
                return @"HUN";
            case AWSmediaconvertLanguageCodeIsl:
                return @"ISL";
            case AWSmediaconvertLanguageCodeIdo:
                return @"IDO";
            case AWSmediaconvertLanguageCodeIbo:
                return @"IBO";
            case AWSmediaconvertLanguageCodeInd:
                return @"IND";
            case AWSmediaconvertLanguageCodeIna:
                return @"INA";
            case AWSmediaconvertLanguageCodeIle:
                return @"ILE";
            case AWSmediaconvertLanguageCodeIku:
                return @"IKU";
            case AWSmediaconvertLanguageCodeIpk:
                return @"IPK";
            case AWSmediaconvertLanguageCodeGle:
                return @"GLE";
            case AWSmediaconvertLanguageCodeJav:
                return @"JAV";
            case AWSmediaconvertLanguageCodeKal:
                return @"KAL";
            case AWSmediaconvertLanguageCodeKan:
                return @"KAN";
            case AWSmediaconvertLanguageCodeKau:
                return @"KAU";
            case AWSmediaconvertLanguageCodeKas:
                return @"KAS";
            case AWSmediaconvertLanguageCodeKaz:
                return @"KAZ";
            case AWSmediaconvertLanguageCodeKik:
                return @"KIK";
            case AWSmediaconvertLanguageCodeKin:
                return @"KIN";
            case AWSmediaconvertLanguageCodeKir:
                return @"KIR";
            case AWSmediaconvertLanguageCodeKom:
                return @"KOM";
            case AWSmediaconvertLanguageCodeKon:
                return @"KON";
            case AWSmediaconvertLanguageCodeKua:
                return @"KUA";
            case AWSmediaconvertLanguageCodeKur:
                return @"KUR";
            case AWSmediaconvertLanguageCodeLao:
                return @"LAO";
            case AWSmediaconvertLanguageCodeLat:
                return @"LAT";
            case AWSmediaconvertLanguageCodeLav:
                return @"LAV";
            case AWSmediaconvertLanguageCodeLim:
                return @"LIM";
            case AWSmediaconvertLanguageCodeLin:
                return @"LIN";
            case AWSmediaconvertLanguageCodeLit:
                return @"LIT";
            case AWSmediaconvertLanguageCodeLub:
                return @"LUB";
            case AWSmediaconvertLanguageCodeLtz:
                return @"LTZ";
            case AWSmediaconvertLanguageCodeMkd:
                return @"MKD";
            case AWSmediaconvertLanguageCodeMlg:
                return @"MLG";
            case AWSmediaconvertLanguageCodeMsa:
                return @"MSA";
            case AWSmediaconvertLanguageCodeMal:
                return @"MAL";
            case AWSmediaconvertLanguageCodeMlt:
                return @"MLT";
            case AWSmediaconvertLanguageCodeGlv:
                return @"GLV";
            case AWSmediaconvertLanguageCodeMri:
                return @"MRI";
            case AWSmediaconvertLanguageCodeMar:
                return @"MAR";
            case AWSmediaconvertLanguageCodeMah:
                return @"MAH";
            case AWSmediaconvertLanguageCodeMon:
                return @"MON";
            case AWSmediaconvertLanguageCodeNau:
                return @"NAU";
            case AWSmediaconvertLanguageCodeNav:
                return @"NAV";
            case AWSmediaconvertLanguageCodeNde:
                return @"NDE";
            case AWSmediaconvertLanguageCodeNbl:
                return @"NBL";
            case AWSmediaconvertLanguageCodeNdo:
                return @"NDO";
            case AWSmediaconvertLanguageCodeNep:
                return @"NEP";
            case AWSmediaconvertLanguageCodeSme:
                return @"SME";
            case AWSmediaconvertLanguageCodeNor:
                return @"NOR";
            case AWSmediaconvertLanguageCodeNob:
                return @"NOB";
            case AWSmediaconvertLanguageCodeNno:
                return @"NNO";
            case AWSmediaconvertLanguageCodeOci:
                return @"OCI";
            case AWSmediaconvertLanguageCodeOji:
                return @"OJI";
            case AWSmediaconvertLanguageCodeOri:
                return @"ORI";
            case AWSmediaconvertLanguageCodeOrm:
                return @"ORM";
            case AWSmediaconvertLanguageCodeOss:
                return @"OSS";
            case AWSmediaconvertLanguageCodePli:
                return @"PLI";
            case AWSmediaconvertLanguageCodeFas:
                return @"FAS";
            case AWSmediaconvertLanguageCodePol:
                return @"POL";
            case AWSmediaconvertLanguageCodePus:
                return @"PUS";
            case AWSmediaconvertLanguageCodeQue:
                return @"QUE";
            case AWSmediaconvertLanguageCodeQaa:
                return @"QAA";
            case AWSmediaconvertLanguageCodeRon:
                return @"RON";
            case AWSmediaconvertLanguageCodeRoh:
                return @"ROH";
            case AWSmediaconvertLanguageCodeRun:
                return @"RUN";
            case AWSmediaconvertLanguageCodeSmo:
                return @"SMO";
            case AWSmediaconvertLanguageCodeSag:
                return @"SAG";
            case AWSmediaconvertLanguageCodeSan:
                return @"SAN";
            case AWSmediaconvertLanguageCodeSrd:
                return @"SRD";
            case AWSmediaconvertLanguageCodeSrb:
                return @"SRB";
            case AWSmediaconvertLanguageCodeSna:
                return @"SNA";
            case AWSmediaconvertLanguageCodeIii:
                return @"III";
            case AWSmediaconvertLanguageCodeSnd:
                return @"SND";
            case AWSmediaconvertLanguageCodeSin:
                return @"SIN";
            case AWSmediaconvertLanguageCodeSlk:
                return @"SLK";
            case AWSmediaconvertLanguageCodeSlv:
                return @"SLV";
            case AWSmediaconvertLanguageCodeSom:
                return @"SOM";
            case AWSmediaconvertLanguageCodeSot:
                return @"SOT";
            case AWSmediaconvertLanguageCodeSun:
                return @"SUN";
            case AWSmediaconvertLanguageCodeSwa:
                return @"SWA";
            case AWSmediaconvertLanguageCodeSsw:
                return @"SSW";
            case AWSmediaconvertLanguageCodeSwe:
                return @"SWE";
            case AWSmediaconvertLanguageCodeTgl:
                return @"TGL";
            case AWSmediaconvertLanguageCodeTah:
                return @"TAH";
            case AWSmediaconvertLanguageCodeTgk:
                return @"TGK";
            case AWSmediaconvertLanguageCodeTam:
                return @"TAM";
            case AWSmediaconvertLanguageCodeTat:
                return @"TAT";
            case AWSmediaconvertLanguageCodeTel:
                return @"TEL";
            case AWSmediaconvertLanguageCodeTha:
                return @"THA";
            case AWSmediaconvertLanguageCodeBod:
                return @"BOD";
            case AWSmediaconvertLanguageCodeTir:
                return @"TIR";
            case AWSmediaconvertLanguageCodeTon:
                return @"TON";
            case AWSmediaconvertLanguageCodeTso:
                return @"TSO";
            case AWSmediaconvertLanguageCodeTsn:
                return @"TSN";
            case AWSmediaconvertLanguageCodeTur:
                return @"TUR";
            case AWSmediaconvertLanguageCodeTuk:
                return @"TUK";
            case AWSmediaconvertLanguageCodeTwi:
                return @"TWI";
            case AWSmediaconvertLanguageCodeUig:
                return @"UIG";
            case AWSmediaconvertLanguageCodeUkr:
                return @"UKR";
            case AWSmediaconvertLanguageCodeUzb:
                return @"UZB";
            case AWSmediaconvertLanguageCodeVen:
                return @"VEN";
            case AWSmediaconvertLanguageCodeVol:
                return @"VOL";
            case AWSmediaconvertLanguageCodeWln:
                return @"WLN";
            case AWSmediaconvertLanguageCodeCym:
                return @"CYM";
            case AWSmediaconvertLanguageCodeFry:
                return @"FRY";
            case AWSmediaconvertLanguageCodeWol:
                return @"WOL";
            case AWSmediaconvertLanguageCodeXho:
                return @"XHO";
            case AWSmediaconvertLanguageCodeYid:
                return @"YID";
            case AWSmediaconvertLanguageCodeYor:
                return @"YOR";
            case AWSmediaconvertLanguageCodeZha:
                return @"ZHA";
            case AWSmediaconvertLanguageCodeZul:
                return @"ZUL";
            case AWSmediaconvertLanguageCodeOrj:
                return @"ORJ";
            case AWSmediaconvertLanguageCodeQpc:
                return @"QPC";
            case AWSmediaconvertLanguageCodeTng:
                return @"TNG";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertCaptionDestinationSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertBurninDestinationSettings class]];
}

+ (NSValueTransformer *)destinationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BURN_IN"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionDestinationTypeBurnIn);
        }
        if ([value caseInsensitiveCompare:@"DVB_SUB"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionDestinationTypeDvbSub);
        }
        if ([value caseInsensitiveCompare:@"EMBEDDED"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionDestinationTypeEmbedded);
        }
        if ([value caseInsensitiveCompare:@"EMBEDDED_PLUS_SCTE20"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionDestinationTypeEmbeddedPlusScte20);
        }
        if ([value caseInsensitiveCompare:@"IMSC"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionDestinationTypeImsc);
        }
        if ([value caseInsensitiveCompare:@"SCTE20_PLUS_EMBEDDED"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionDestinationTypeScte20PlusEmbedded);
        }
        if ([value caseInsensitiveCompare:@"SCC"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionDestinationTypeScc);
        }
        if ([value caseInsensitiveCompare:@"SRT"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionDestinationTypeSrt);
        }
        if ([value caseInsensitiveCompare:@"SMI"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionDestinationTypeSmi);
        }
        if ([value caseInsensitiveCompare:@"TELETEXT"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionDestinationTypeTeletext);
        }
        if ([value caseInsensitiveCompare:@"TTML"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionDestinationTypeTtml);
        }
        if ([value caseInsensitiveCompare:@"WEBVTT"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionDestinationTypeWebvtt);
        }
        return @(AWSmediaconvertCaptionDestinationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCaptionDestinationTypeBurnIn:
                return @"BURN_IN";
            case AWSmediaconvertCaptionDestinationTypeDvbSub:
                return @"DVB_SUB";
            case AWSmediaconvertCaptionDestinationTypeEmbedded:
                return @"EMBEDDED";
            case AWSmediaconvertCaptionDestinationTypeEmbeddedPlusScte20:
                return @"EMBEDDED_PLUS_SCTE20";
            case AWSmediaconvertCaptionDestinationTypeImsc:
                return @"IMSC";
            case AWSmediaconvertCaptionDestinationTypeScte20PlusEmbedded:
                return @"SCTE20_PLUS_EMBEDDED";
            case AWSmediaconvertCaptionDestinationTypeScc:
                return @"SCC";
            case AWSmediaconvertCaptionDestinationTypeSrt:
                return @"SRT";
            case AWSmediaconvertCaptionDestinationTypeSmi:
                return @"SMI";
            case AWSmediaconvertCaptionDestinationTypeTeletext:
                return @"TELETEXT";
            case AWSmediaconvertCaptionDestinationTypeTtml:
                return @"TTML";
            case AWSmediaconvertCaptionDestinationTypeWebvtt:
                return @"WEBVTT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dvbSubDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDvbSubDestinationSettings class]];
}

+ (NSValueTransformer *)embeddedDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertEmbeddedDestinationSettings class]];
}

+ (NSValueTransformer *)imscDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertImscDestinationSettings class]];
}

+ (NSValueTransformer *)sccDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertSccDestinationSettings class]];
}

+ (NSValueTransformer *)teletextDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertTeletextDestinationSettings class]];
}

+ (NSValueTransformer *)ttmlDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertTtmlDestinationSettings class]];
}

@end

@implementation AWSmediaconvertCaptionSelector

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
            return @(AWSmediaconvertLanguageCodeEng);
        }
        if ([value caseInsensitiveCompare:@"SPA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSpa);
        }
        if ([value caseInsensitiveCompare:@"FRA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFra);
        }
        if ([value caseInsensitiveCompare:@"DEU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDeu);
        }
        if ([value caseInsensitiveCompare:@"GER"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGer);
        }
        if ([value caseInsensitiveCompare:@"ZHO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZho);
        }
        if ([value caseInsensitiveCompare:@"ARA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAra);
        }
        if ([value caseInsensitiveCompare:@"HIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHin);
        }
        if ([value caseInsensitiveCompare:@"JPN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeJpn);
        }
        if ([value caseInsensitiveCompare:@"RUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRus);
        }
        if ([value caseInsensitiveCompare:@"POR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePor);
        }
        if ([value caseInsensitiveCompare:@"ITA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIta);
        }
        if ([value caseInsensitiveCompare:@"URD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUrd);
        }
        if ([value caseInsensitiveCompare:@"VIE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVie);
        }
        if ([value caseInsensitiveCompare:@"KOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKor);
        }
        if ([value caseInsensitiveCompare:@"PAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePan);
        }
        if ([value caseInsensitiveCompare:@"ABK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAbk);
        }
        if ([value caseInsensitiveCompare:@"AAR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAar);
        }
        if ([value caseInsensitiveCompare:@"AFR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAfr);
        }
        if ([value caseInsensitiveCompare:@"AKA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAka);
        }
        if ([value caseInsensitiveCompare:@"SQI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSqi);
        }
        if ([value caseInsensitiveCompare:@"AMH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAmh);
        }
        if ([value caseInsensitiveCompare:@"ARG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeArg);
        }
        if ([value caseInsensitiveCompare:@"HYE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHye);
        }
        if ([value caseInsensitiveCompare:@"ASM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAsm);
        }
        if ([value caseInsensitiveCompare:@"AVA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAva);
        }
        if ([value caseInsensitiveCompare:@"AVE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAve);
        }
        if ([value caseInsensitiveCompare:@"AYM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAym);
        }
        if ([value caseInsensitiveCompare:@"AZE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAze);
        }
        if ([value caseInsensitiveCompare:@"BAM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBam);
        }
        if ([value caseInsensitiveCompare:@"BAK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBak);
        }
        if ([value caseInsensitiveCompare:@"EUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEus);
        }
        if ([value caseInsensitiveCompare:@"BEL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBel);
        }
        if ([value caseInsensitiveCompare:@"BEN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBen);
        }
        if ([value caseInsensitiveCompare:@"BIH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBih);
        }
        if ([value caseInsensitiveCompare:@"BIS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBis);
        }
        if ([value caseInsensitiveCompare:@"BOS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBos);
        }
        if ([value caseInsensitiveCompare:@"BRE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBre);
        }
        if ([value caseInsensitiveCompare:@"BUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBul);
        }
        if ([value caseInsensitiveCompare:@"MYA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMya);
        }
        if ([value caseInsensitiveCompare:@"CAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCat);
        }
        if ([value caseInsensitiveCompare:@"KHM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKhm);
        }
        if ([value caseInsensitiveCompare:@"CHA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCha);
        }
        if ([value caseInsensitiveCompare:@"CHE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChe);
        }
        if ([value caseInsensitiveCompare:@"NYA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNya);
        }
        if ([value caseInsensitiveCompare:@"CHU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChu);
        }
        if ([value caseInsensitiveCompare:@"CHV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChv);
        }
        if ([value caseInsensitiveCompare:@"COR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCor);
        }
        if ([value caseInsensitiveCompare:@"COS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCos);
        }
        if ([value caseInsensitiveCompare:@"CRE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCre);
        }
        if ([value caseInsensitiveCompare:@"HRV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHrv);
        }
        if ([value caseInsensitiveCompare:@"CES"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCes);
        }
        if ([value caseInsensitiveCompare:@"DAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDan);
        }
        if ([value caseInsensitiveCompare:@"DIV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDiv);
        }
        if ([value caseInsensitiveCompare:@"NLD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNld);
        }
        if ([value caseInsensitiveCompare:@"DZO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDzo);
        }
        if ([value caseInsensitiveCompare:@"ENM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEnm);
        }
        if ([value caseInsensitiveCompare:@"EPO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEpo);
        }
        if ([value caseInsensitiveCompare:@"EST"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEst);
        }
        if ([value caseInsensitiveCompare:@"EWE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEwe);
        }
        if ([value caseInsensitiveCompare:@"FAO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFao);
        }
        if ([value caseInsensitiveCompare:@"FIJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFij);
        }
        if ([value caseInsensitiveCompare:@"FIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFin);
        }
        if ([value caseInsensitiveCompare:@"FRM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFrm);
        }
        if ([value caseInsensitiveCompare:@"FUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFul);
        }
        if ([value caseInsensitiveCompare:@"GLA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGla);
        }
        if ([value caseInsensitiveCompare:@"GLG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGlg);
        }
        if ([value caseInsensitiveCompare:@"LUG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLug);
        }
        if ([value caseInsensitiveCompare:@"KAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKat);
        }
        if ([value caseInsensitiveCompare:@"ELL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEll);
        }
        if ([value caseInsensitiveCompare:@"GRN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGrn);
        }
        if ([value caseInsensitiveCompare:@"GUJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGuj);
        }
        if ([value caseInsensitiveCompare:@"HAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHat);
        }
        if ([value caseInsensitiveCompare:@"HAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHau);
        }
        if ([value caseInsensitiveCompare:@"HEB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHeb);
        }
        if ([value caseInsensitiveCompare:@"HER"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHer);
        }
        if ([value caseInsensitiveCompare:@"HMO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHmo);
        }
        if ([value caseInsensitiveCompare:@"HUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHun);
        }
        if ([value caseInsensitiveCompare:@"ISL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIsl);
        }
        if ([value caseInsensitiveCompare:@"IDO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIdo);
        }
        if ([value caseInsensitiveCompare:@"IBO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIbo);
        }
        if ([value caseInsensitiveCompare:@"IND"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeInd);
        }
        if ([value caseInsensitiveCompare:@"INA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIna);
        }
        if ([value caseInsensitiveCompare:@"ILE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIle);
        }
        if ([value caseInsensitiveCompare:@"IKU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIku);
        }
        if ([value caseInsensitiveCompare:@"IPK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIpk);
        }
        if ([value caseInsensitiveCompare:@"GLE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGle);
        }
        if ([value caseInsensitiveCompare:@"JAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeJav);
        }
        if ([value caseInsensitiveCompare:@"KAL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKal);
        }
        if ([value caseInsensitiveCompare:@"KAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKan);
        }
        if ([value caseInsensitiveCompare:@"KAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKau);
        }
        if ([value caseInsensitiveCompare:@"KAS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKas);
        }
        if ([value caseInsensitiveCompare:@"KAZ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKaz);
        }
        if ([value caseInsensitiveCompare:@"KIK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKik);
        }
        if ([value caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKin);
        }
        if ([value caseInsensitiveCompare:@"KIR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKir);
        }
        if ([value caseInsensitiveCompare:@"KOM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKom);
        }
        if ([value caseInsensitiveCompare:@"KON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKon);
        }
        if ([value caseInsensitiveCompare:@"KUA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKua);
        }
        if ([value caseInsensitiveCompare:@"KUR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKur);
        }
        if ([value caseInsensitiveCompare:@"LAO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLao);
        }
        if ([value caseInsensitiveCompare:@"LAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLat);
        }
        if ([value caseInsensitiveCompare:@"LAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLav);
        }
        if ([value caseInsensitiveCompare:@"LIM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLim);
        }
        if ([value caseInsensitiveCompare:@"LIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLin);
        }
        if ([value caseInsensitiveCompare:@"LIT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLit);
        }
        if ([value caseInsensitiveCompare:@"LUB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLub);
        }
        if ([value caseInsensitiveCompare:@"LTZ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLtz);
        }
        if ([value caseInsensitiveCompare:@"MKD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMkd);
        }
        if ([value caseInsensitiveCompare:@"MLG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMlg);
        }
        if ([value caseInsensitiveCompare:@"MSA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMsa);
        }
        if ([value caseInsensitiveCompare:@"MAL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMal);
        }
        if ([value caseInsensitiveCompare:@"MLT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMlt);
        }
        if ([value caseInsensitiveCompare:@"GLV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGlv);
        }
        if ([value caseInsensitiveCompare:@"MRI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMri);
        }
        if ([value caseInsensitiveCompare:@"MAR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMar);
        }
        if ([value caseInsensitiveCompare:@"MAH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMah);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMon);
        }
        if ([value caseInsensitiveCompare:@"NAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNau);
        }
        if ([value caseInsensitiveCompare:@"NAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNav);
        }
        if ([value caseInsensitiveCompare:@"NDE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNde);
        }
        if ([value caseInsensitiveCompare:@"NBL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNbl);
        }
        if ([value caseInsensitiveCompare:@"NDO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNdo);
        }
        if ([value caseInsensitiveCompare:@"NEP"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNep);
        }
        if ([value caseInsensitiveCompare:@"SME"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSme);
        }
        if ([value caseInsensitiveCompare:@"NOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNor);
        }
        if ([value caseInsensitiveCompare:@"NOB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNob);
        }
        if ([value caseInsensitiveCompare:@"NNO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNno);
        }
        if ([value caseInsensitiveCompare:@"OCI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOci);
        }
        if ([value caseInsensitiveCompare:@"OJI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOji);
        }
        if ([value caseInsensitiveCompare:@"ORI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOri);
        }
        if ([value caseInsensitiveCompare:@"ORM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOrm);
        }
        if ([value caseInsensitiveCompare:@"OSS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOss);
        }
        if ([value caseInsensitiveCompare:@"PLI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePli);
        }
        if ([value caseInsensitiveCompare:@"FAS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFas);
        }
        if ([value caseInsensitiveCompare:@"POL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePol);
        }
        if ([value caseInsensitiveCompare:@"PUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePus);
        }
        if ([value caseInsensitiveCompare:@"QUE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQue);
        }
        if ([value caseInsensitiveCompare:@"QAA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQaa);
        }
        if ([value caseInsensitiveCompare:@"RON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRon);
        }
        if ([value caseInsensitiveCompare:@"ROH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRoh);
        }
        if ([value caseInsensitiveCompare:@"RUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRun);
        }
        if ([value caseInsensitiveCompare:@"SMO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSmo);
        }
        if ([value caseInsensitiveCompare:@"SAG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSag);
        }
        if ([value caseInsensitiveCompare:@"SAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSan);
        }
        if ([value caseInsensitiveCompare:@"SRD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSrd);
        }
        if ([value caseInsensitiveCompare:@"SRB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSrb);
        }
        if ([value caseInsensitiveCompare:@"SNA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSna);
        }
        if ([value caseInsensitiveCompare:@"III"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIii);
        }
        if ([value caseInsensitiveCompare:@"SND"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSnd);
        }
        if ([value caseInsensitiveCompare:@"SIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSin);
        }
        if ([value caseInsensitiveCompare:@"SLK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSlk);
        }
        if ([value caseInsensitiveCompare:@"SLV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSlv);
        }
        if ([value caseInsensitiveCompare:@"SOM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSom);
        }
        if ([value caseInsensitiveCompare:@"SOT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSot);
        }
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSun);
        }
        if ([value caseInsensitiveCompare:@"SWA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSwa);
        }
        if ([value caseInsensitiveCompare:@"SSW"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSsw);
        }
        if ([value caseInsensitiveCompare:@"SWE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSwe);
        }
        if ([value caseInsensitiveCompare:@"TGL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTgl);
        }
        if ([value caseInsensitiveCompare:@"TAH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTah);
        }
        if ([value caseInsensitiveCompare:@"TGK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTgk);
        }
        if ([value caseInsensitiveCompare:@"TAM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTam);
        }
        if ([value caseInsensitiveCompare:@"TAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTat);
        }
        if ([value caseInsensitiveCompare:@"TEL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTel);
        }
        if ([value caseInsensitiveCompare:@"THA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTha);
        }
        if ([value caseInsensitiveCompare:@"BOD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBod);
        }
        if ([value caseInsensitiveCompare:@"TIR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTir);
        }
        if ([value caseInsensitiveCompare:@"TON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTon);
        }
        if ([value caseInsensitiveCompare:@"TSO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTso);
        }
        if ([value caseInsensitiveCompare:@"TSN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTsn);
        }
        if ([value caseInsensitiveCompare:@"TUR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTur);
        }
        if ([value caseInsensitiveCompare:@"TUK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTuk);
        }
        if ([value caseInsensitiveCompare:@"TWI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTwi);
        }
        if ([value caseInsensitiveCompare:@"UIG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUig);
        }
        if ([value caseInsensitiveCompare:@"UKR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUkr);
        }
        if ([value caseInsensitiveCompare:@"UZB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUzb);
        }
        if ([value caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVen);
        }
        if ([value caseInsensitiveCompare:@"VOL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVol);
        }
        if ([value caseInsensitiveCompare:@"WLN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeWln);
        }
        if ([value caseInsensitiveCompare:@"CYM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCym);
        }
        if ([value caseInsensitiveCompare:@"FRY"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFry);
        }
        if ([value caseInsensitiveCompare:@"WOL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeWol);
        }
        if ([value caseInsensitiveCompare:@"XHO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeXho);
        }
        if ([value caseInsensitiveCompare:@"YID"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeYid);
        }
        if ([value caseInsensitiveCompare:@"YOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeYor);
        }
        if ([value caseInsensitiveCompare:@"ZHA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZha);
        }
        if ([value caseInsensitiveCompare:@"ZUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZul);
        }
        if ([value caseInsensitiveCompare:@"ORJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOrj);
        }
        if ([value caseInsensitiveCompare:@"QPC"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQpc);
        }
        if ([value caseInsensitiveCompare:@"TNG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTng);
        }
        return @(AWSmediaconvertLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertLanguageCodeEng:
                return @"ENG";
            case AWSmediaconvertLanguageCodeSpa:
                return @"SPA";
            case AWSmediaconvertLanguageCodeFra:
                return @"FRA";
            case AWSmediaconvertLanguageCodeDeu:
                return @"DEU";
            case AWSmediaconvertLanguageCodeGer:
                return @"GER";
            case AWSmediaconvertLanguageCodeZho:
                return @"ZHO";
            case AWSmediaconvertLanguageCodeAra:
                return @"ARA";
            case AWSmediaconvertLanguageCodeHin:
                return @"HIN";
            case AWSmediaconvertLanguageCodeJpn:
                return @"JPN";
            case AWSmediaconvertLanguageCodeRus:
                return @"RUS";
            case AWSmediaconvertLanguageCodePor:
                return @"POR";
            case AWSmediaconvertLanguageCodeIta:
                return @"ITA";
            case AWSmediaconvertLanguageCodeUrd:
                return @"URD";
            case AWSmediaconvertLanguageCodeVie:
                return @"VIE";
            case AWSmediaconvertLanguageCodeKor:
                return @"KOR";
            case AWSmediaconvertLanguageCodePan:
                return @"PAN";
            case AWSmediaconvertLanguageCodeAbk:
                return @"ABK";
            case AWSmediaconvertLanguageCodeAar:
                return @"AAR";
            case AWSmediaconvertLanguageCodeAfr:
                return @"AFR";
            case AWSmediaconvertLanguageCodeAka:
                return @"AKA";
            case AWSmediaconvertLanguageCodeSqi:
                return @"SQI";
            case AWSmediaconvertLanguageCodeAmh:
                return @"AMH";
            case AWSmediaconvertLanguageCodeArg:
                return @"ARG";
            case AWSmediaconvertLanguageCodeHye:
                return @"HYE";
            case AWSmediaconvertLanguageCodeAsm:
                return @"ASM";
            case AWSmediaconvertLanguageCodeAva:
                return @"AVA";
            case AWSmediaconvertLanguageCodeAve:
                return @"AVE";
            case AWSmediaconvertLanguageCodeAym:
                return @"AYM";
            case AWSmediaconvertLanguageCodeAze:
                return @"AZE";
            case AWSmediaconvertLanguageCodeBam:
                return @"BAM";
            case AWSmediaconvertLanguageCodeBak:
                return @"BAK";
            case AWSmediaconvertLanguageCodeEus:
                return @"EUS";
            case AWSmediaconvertLanguageCodeBel:
                return @"BEL";
            case AWSmediaconvertLanguageCodeBen:
                return @"BEN";
            case AWSmediaconvertLanguageCodeBih:
                return @"BIH";
            case AWSmediaconvertLanguageCodeBis:
                return @"BIS";
            case AWSmediaconvertLanguageCodeBos:
                return @"BOS";
            case AWSmediaconvertLanguageCodeBre:
                return @"BRE";
            case AWSmediaconvertLanguageCodeBul:
                return @"BUL";
            case AWSmediaconvertLanguageCodeMya:
                return @"MYA";
            case AWSmediaconvertLanguageCodeCat:
                return @"CAT";
            case AWSmediaconvertLanguageCodeKhm:
                return @"KHM";
            case AWSmediaconvertLanguageCodeCha:
                return @"CHA";
            case AWSmediaconvertLanguageCodeChe:
                return @"CHE";
            case AWSmediaconvertLanguageCodeNya:
                return @"NYA";
            case AWSmediaconvertLanguageCodeChu:
                return @"CHU";
            case AWSmediaconvertLanguageCodeChv:
                return @"CHV";
            case AWSmediaconvertLanguageCodeCor:
                return @"COR";
            case AWSmediaconvertLanguageCodeCos:
                return @"COS";
            case AWSmediaconvertLanguageCodeCre:
                return @"CRE";
            case AWSmediaconvertLanguageCodeHrv:
                return @"HRV";
            case AWSmediaconvertLanguageCodeCes:
                return @"CES";
            case AWSmediaconvertLanguageCodeDan:
                return @"DAN";
            case AWSmediaconvertLanguageCodeDiv:
                return @"DIV";
            case AWSmediaconvertLanguageCodeNld:
                return @"NLD";
            case AWSmediaconvertLanguageCodeDzo:
                return @"DZO";
            case AWSmediaconvertLanguageCodeEnm:
                return @"ENM";
            case AWSmediaconvertLanguageCodeEpo:
                return @"EPO";
            case AWSmediaconvertLanguageCodeEst:
                return @"EST";
            case AWSmediaconvertLanguageCodeEwe:
                return @"EWE";
            case AWSmediaconvertLanguageCodeFao:
                return @"FAO";
            case AWSmediaconvertLanguageCodeFij:
                return @"FIJ";
            case AWSmediaconvertLanguageCodeFin:
                return @"FIN";
            case AWSmediaconvertLanguageCodeFrm:
                return @"FRM";
            case AWSmediaconvertLanguageCodeFul:
                return @"FUL";
            case AWSmediaconvertLanguageCodeGla:
                return @"GLA";
            case AWSmediaconvertLanguageCodeGlg:
                return @"GLG";
            case AWSmediaconvertLanguageCodeLug:
                return @"LUG";
            case AWSmediaconvertLanguageCodeKat:
                return @"KAT";
            case AWSmediaconvertLanguageCodeEll:
                return @"ELL";
            case AWSmediaconvertLanguageCodeGrn:
                return @"GRN";
            case AWSmediaconvertLanguageCodeGuj:
                return @"GUJ";
            case AWSmediaconvertLanguageCodeHat:
                return @"HAT";
            case AWSmediaconvertLanguageCodeHau:
                return @"HAU";
            case AWSmediaconvertLanguageCodeHeb:
                return @"HEB";
            case AWSmediaconvertLanguageCodeHer:
                return @"HER";
            case AWSmediaconvertLanguageCodeHmo:
                return @"HMO";
            case AWSmediaconvertLanguageCodeHun:
                return @"HUN";
            case AWSmediaconvertLanguageCodeIsl:
                return @"ISL";
            case AWSmediaconvertLanguageCodeIdo:
                return @"IDO";
            case AWSmediaconvertLanguageCodeIbo:
                return @"IBO";
            case AWSmediaconvertLanguageCodeInd:
                return @"IND";
            case AWSmediaconvertLanguageCodeIna:
                return @"INA";
            case AWSmediaconvertLanguageCodeIle:
                return @"ILE";
            case AWSmediaconvertLanguageCodeIku:
                return @"IKU";
            case AWSmediaconvertLanguageCodeIpk:
                return @"IPK";
            case AWSmediaconvertLanguageCodeGle:
                return @"GLE";
            case AWSmediaconvertLanguageCodeJav:
                return @"JAV";
            case AWSmediaconvertLanguageCodeKal:
                return @"KAL";
            case AWSmediaconvertLanguageCodeKan:
                return @"KAN";
            case AWSmediaconvertLanguageCodeKau:
                return @"KAU";
            case AWSmediaconvertLanguageCodeKas:
                return @"KAS";
            case AWSmediaconvertLanguageCodeKaz:
                return @"KAZ";
            case AWSmediaconvertLanguageCodeKik:
                return @"KIK";
            case AWSmediaconvertLanguageCodeKin:
                return @"KIN";
            case AWSmediaconvertLanguageCodeKir:
                return @"KIR";
            case AWSmediaconvertLanguageCodeKom:
                return @"KOM";
            case AWSmediaconvertLanguageCodeKon:
                return @"KON";
            case AWSmediaconvertLanguageCodeKua:
                return @"KUA";
            case AWSmediaconvertLanguageCodeKur:
                return @"KUR";
            case AWSmediaconvertLanguageCodeLao:
                return @"LAO";
            case AWSmediaconvertLanguageCodeLat:
                return @"LAT";
            case AWSmediaconvertLanguageCodeLav:
                return @"LAV";
            case AWSmediaconvertLanguageCodeLim:
                return @"LIM";
            case AWSmediaconvertLanguageCodeLin:
                return @"LIN";
            case AWSmediaconvertLanguageCodeLit:
                return @"LIT";
            case AWSmediaconvertLanguageCodeLub:
                return @"LUB";
            case AWSmediaconvertLanguageCodeLtz:
                return @"LTZ";
            case AWSmediaconvertLanguageCodeMkd:
                return @"MKD";
            case AWSmediaconvertLanguageCodeMlg:
                return @"MLG";
            case AWSmediaconvertLanguageCodeMsa:
                return @"MSA";
            case AWSmediaconvertLanguageCodeMal:
                return @"MAL";
            case AWSmediaconvertLanguageCodeMlt:
                return @"MLT";
            case AWSmediaconvertLanguageCodeGlv:
                return @"GLV";
            case AWSmediaconvertLanguageCodeMri:
                return @"MRI";
            case AWSmediaconvertLanguageCodeMar:
                return @"MAR";
            case AWSmediaconvertLanguageCodeMah:
                return @"MAH";
            case AWSmediaconvertLanguageCodeMon:
                return @"MON";
            case AWSmediaconvertLanguageCodeNau:
                return @"NAU";
            case AWSmediaconvertLanguageCodeNav:
                return @"NAV";
            case AWSmediaconvertLanguageCodeNde:
                return @"NDE";
            case AWSmediaconvertLanguageCodeNbl:
                return @"NBL";
            case AWSmediaconvertLanguageCodeNdo:
                return @"NDO";
            case AWSmediaconvertLanguageCodeNep:
                return @"NEP";
            case AWSmediaconvertLanguageCodeSme:
                return @"SME";
            case AWSmediaconvertLanguageCodeNor:
                return @"NOR";
            case AWSmediaconvertLanguageCodeNob:
                return @"NOB";
            case AWSmediaconvertLanguageCodeNno:
                return @"NNO";
            case AWSmediaconvertLanguageCodeOci:
                return @"OCI";
            case AWSmediaconvertLanguageCodeOji:
                return @"OJI";
            case AWSmediaconvertLanguageCodeOri:
                return @"ORI";
            case AWSmediaconvertLanguageCodeOrm:
                return @"ORM";
            case AWSmediaconvertLanguageCodeOss:
                return @"OSS";
            case AWSmediaconvertLanguageCodePli:
                return @"PLI";
            case AWSmediaconvertLanguageCodeFas:
                return @"FAS";
            case AWSmediaconvertLanguageCodePol:
                return @"POL";
            case AWSmediaconvertLanguageCodePus:
                return @"PUS";
            case AWSmediaconvertLanguageCodeQue:
                return @"QUE";
            case AWSmediaconvertLanguageCodeQaa:
                return @"QAA";
            case AWSmediaconvertLanguageCodeRon:
                return @"RON";
            case AWSmediaconvertLanguageCodeRoh:
                return @"ROH";
            case AWSmediaconvertLanguageCodeRun:
                return @"RUN";
            case AWSmediaconvertLanguageCodeSmo:
                return @"SMO";
            case AWSmediaconvertLanguageCodeSag:
                return @"SAG";
            case AWSmediaconvertLanguageCodeSan:
                return @"SAN";
            case AWSmediaconvertLanguageCodeSrd:
                return @"SRD";
            case AWSmediaconvertLanguageCodeSrb:
                return @"SRB";
            case AWSmediaconvertLanguageCodeSna:
                return @"SNA";
            case AWSmediaconvertLanguageCodeIii:
                return @"III";
            case AWSmediaconvertLanguageCodeSnd:
                return @"SND";
            case AWSmediaconvertLanguageCodeSin:
                return @"SIN";
            case AWSmediaconvertLanguageCodeSlk:
                return @"SLK";
            case AWSmediaconvertLanguageCodeSlv:
                return @"SLV";
            case AWSmediaconvertLanguageCodeSom:
                return @"SOM";
            case AWSmediaconvertLanguageCodeSot:
                return @"SOT";
            case AWSmediaconvertLanguageCodeSun:
                return @"SUN";
            case AWSmediaconvertLanguageCodeSwa:
                return @"SWA";
            case AWSmediaconvertLanguageCodeSsw:
                return @"SSW";
            case AWSmediaconvertLanguageCodeSwe:
                return @"SWE";
            case AWSmediaconvertLanguageCodeTgl:
                return @"TGL";
            case AWSmediaconvertLanguageCodeTah:
                return @"TAH";
            case AWSmediaconvertLanguageCodeTgk:
                return @"TGK";
            case AWSmediaconvertLanguageCodeTam:
                return @"TAM";
            case AWSmediaconvertLanguageCodeTat:
                return @"TAT";
            case AWSmediaconvertLanguageCodeTel:
                return @"TEL";
            case AWSmediaconvertLanguageCodeTha:
                return @"THA";
            case AWSmediaconvertLanguageCodeBod:
                return @"BOD";
            case AWSmediaconvertLanguageCodeTir:
                return @"TIR";
            case AWSmediaconvertLanguageCodeTon:
                return @"TON";
            case AWSmediaconvertLanguageCodeTso:
                return @"TSO";
            case AWSmediaconvertLanguageCodeTsn:
                return @"TSN";
            case AWSmediaconvertLanguageCodeTur:
                return @"TUR";
            case AWSmediaconvertLanguageCodeTuk:
                return @"TUK";
            case AWSmediaconvertLanguageCodeTwi:
                return @"TWI";
            case AWSmediaconvertLanguageCodeUig:
                return @"UIG";
            case AWSmediaconvertLanguageCodeUkr:
                return @"UKR";
            case AWSmediaconvertLanguageCodeUzb:
                return @"UZB";
            case AWSmediaconvertLanguageCodeVen:
                return @"VEN";
            case AWSmediaconvertLanguageCodeVol:
                return @"VOL";
            case AWSmediaconvertLanguageCodeWln:
                return @"WLN";
            case AWSmediaconvertLanguageCodeCym:
                return @"CYM";
            case AWSmediaconvertLanguageCodeFry:
                return @"FRY";
            case AWSmediaconvertLanguageCodeWol:
                return @"WOL";
            case AWSmediaconvertLanguageCodeXho:
                return @"XHO";
            case AWSmediaconvertLanguageCodeYid:
                return @"YID";
            case AWSmediaconvertLanguageCodeYor:
                return @"YOR";
            case AWSmediaconvertLanguageCodeZha:
                return @"ZHA";
            case AWSmediaconvertLanguageCodeZul:
                return @"ZUL";
            case AWSmediaconvertLanguageCodeOrj:
                return @"ORJ";
            case AWSmediaconvertLanguageCodeQpc:
                return @"QPC";
            case AWSmediaconvertLanguageCodeTng:
                return @"TNG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertCaptionSourceSettings class]];
}

@end

@implementation AWSmediaconvertCaptionSourceFramerate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             };
}

@end

@implementation AWSmediaconvertCaptionSourceSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAncillarySourceSettings class]];
}

+ (NSValueTransformer *)dvbSubSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDvbSubSourceSettings class]];
}

+ (NSValueTransformer *)embeddedSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertEmbeddedSourceSettings class]];
}

+ (NSValueTransformer *)fileSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertFileSourceSettings class]];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ANCILLARY"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionSourceTypeAncillary);
        }
        if ([value caseInsensitiveCompare:@"DVB_SUB"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionSourceTypeDvbSub);
        }
        if ([value caseInsensitiveCompare:@"EMBEDDED"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionSourceTypeEmbedded);
        }
        if ([value caseInsensitiveCompare:@"SCTE20"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionSourceTypeScte20);
        }
        if ([value caseInsensitiveCompare:@"SCC"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionSourceTypeScc);
        }
        if ([value caseInsensitiveCompare:@"TTML"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionSourceTypeTtml);
        }
        if ([value caseInsensitiveCompare:@"STL"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionSourceTypeStl);
        }
        if ([value caseInsensitiveCompare:@"SRT"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionSourceTypeSrt);
        }
        if ([value caseInsensitiveCompare:@"SMI"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionSourceTypeSmi);
        }
        if ([value caseInsensitiveCompare:@"TELETEXT"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionSourceTypeTeletext);
        }
        if ([value caseInsensitiveCompare:@"NULL_SOURCE"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionSourceTypeNullSource);
        }
        if ([value caseInsensitiveCompare:@"IMSC"] == NSOrderedSame) {
            return @(AWSmediaconvertCaptionSourceTypeImsc);
        }
        return @(AWSmediaconvertCaptionSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCaptionSourceTypeAncillary:
                return @"ANCILLARY";
            case AWSmediaconvertCaptionSourceTypeDvbSub:
                return @"DVB_SUB";
            case AWSmediaconvertCaptionSourceTypeEmbedded:
                return @"EMBEDDED";
            case AWSmediaconvertCaptionSourceTypeScte20:
                return @"SCTE20";
            case AWSmediaconvertCaptionSourceTypeScc:
                return @"SCC";
            case AWSmediaconvertCaptionSourceTypeTtml:
                return @"TTML";
            case AWSmediaconvertCaptionSourceTypeStl:
                return @"STL";
            case AWSmediaconvertCaptionSourceTypeSrt:
                return @"SRT";
            case AWSmediaconvertCaptionSourceTypeSmi:
                return @"SMI";
            case AWSmediaconvertCaptionSourceTypeTeletext:
                return @"TELETEXT";
            case AWSmediaconvertCaptionSourceTypeNullSource:
                return @"NULL_SOURCE";
            case AWSmediaconvertCaptionSourceTypeImsc:
                return @"IMSC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)teletextSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertTeletextSourceSettings class]];
}

+ (NSValueTransformer *)trackSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertTrackSourceSettings class]];
}

@end

@implementation AWSmediaconvertChannelMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputChannels" : @"OutputChannels",
             };
}

+ (NSValueTransformer *)outputChannelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertOutputChannelMapping class]];
}

@end

@implementation AWSmediaconvertCmafAdditionalManifest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestNameModifier" : @"ManifestNameModifier",
             @"selectedOutputs" : @"SelectedOutputs",
             };
}

@end

@implementation AWSmediaconvertCmafEncryptionSettings

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
            return @(AWSmediaconvertCmafEncryptionTypeSampleAes);
        }
        if ([value caseInsensitiveCompare:@"AES_CTR"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafEncryptionTypeAesCtr);
        }
        return @(AWSmediaconvertCmafEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmafEncryptionTypeSampleAes:
                return @"SAMPLE_AES";
            case AWSmediaconvertCmafEncryptionTypeAesCtr:
                return @"AES_CTR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)initializationVectorInManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafInitializationVectorInManifestInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafInitializationVectorInManifestExclude);
        }
        return @(AWSmediaconvertCmafInitializationVectorInManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmafInitializationVectorInManifestInclude:
                return @"INCLUDE";
            case AWSmediaconvertCmafInitializationVectorInManifestExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertSpekeKeyProviderCmaf class]];
}

+ (NSValueTransformer *)staticKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertStaticKeyProvider class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SPEKE"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafKeyProviderTypeSpeke);
        }
        if ([value caseInsensitiveCompare:@"STATIC_KEY"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafKeyProviderTypeStaticKey);
        }
        return @(AWSmediaconvertCmafKeyProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmafKeyProviderTypeSpeke:
                return @"SPEKE";
            case AWSmediaconvertCmafKeyProviderTypeStaticKey:
                return @"STATIC_KEY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertCmafGroupSettings

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertCmafAdditionalManifest class]];
}

+ (NSValueTransformer *)clientCacheJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafClientCacheDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafClientCacheEnabled);
        }
        return @(AWSmediaconvertCmafClientCacheUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmafClientCacheDisabled:
                return @"DISABLED";
            case AWSmediaconvertCmafClientCacheEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecSpecificationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RFC_6381"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafCodecSpecificationRfc6381);
        }
        if ([value caseInsensitiveCompare:@"RFC_4281"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafCodecSpecificationRfc4281);
        }
        return @(AWSmediaconvertCmafCodecSpecificationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmafCodecSpecificationRfc6381:
                return @"RFC_6381";
            case AWSmediaconvertCmafCodecSpecificationRfc4281:
                return @"RFC_4281";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDestinationSettings class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertCmafEncryptionSettings class]];
}

+ (NSValueTransformer *)manifestCompressionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafManifestCompressionGzip);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafManifestCompressionNone);
        }
        return @(AWSmediaconvertCmafManifestCompressionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmafManifestCompressionGzip:
                return @"GZIP";
            case AWSmediaconvertCmafManifestCompressionNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)manifestDurationFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FLOATING_POINT"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafManifestDurationFormatFloatingPoint);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafManifestDurationFormatInteger);
        }
        return @(AWSmediaconvertCmafManifestDurationFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmafManifestDurationFormatFloatingPoint:
                return @"FLOATING_POINT";
            case AWSmediaconvertCmafManifestDurationFormatInteger:
                return @"INTEGER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mpdProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAIN_PROFILE"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafMpdProfileMainProfile);
        }
        if ([value caseInsensitiveCompare:@"ON_DEMAND_PROFILE"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafMpdProfileOnDemandProfile);
        }
        return @(AWSmediaconvertCmafMpdProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmafMpdProfileMainProfile:
                return @"MAIN_PROFILE";
            case AWSmediaconvertCmafMpdProfileOnDemandProfile:
                return @"ON_DEMAND_PROFILE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_FILE"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafSegmentControlSingleFile);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTED_FILES"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafSegmentControlSegmentedFiles);
        }
        return @(AWSmediaconvertCmafSegmentControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmafSegmentControlSingleFile:
                return @"SINGLE_FILE";
            case AWSmediaconvertCmafSegmentControlSegmentedFiles:
                return @"SEGMENTED_FILES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)streamInfResolutionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafStreamInfResolutionInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafStreamInfResolutionExclude);
        }
        return @(AWSmediaconvertCmafStreamInfResolutionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmafStreamInfResolutionInclude:
                return @"INCLUDE";
            case AWSmediaconvertCmafStreamInfResolutionExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)writeDashManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafWriteDASHManifestDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafWriteDASHManifestEnabled);
        }
        return @(AWSmediaconvertCmafWriteDASHManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmafWriteDASHManifestDisabled:
                return @"DISABLED";
            case AWSmediaconvertCmafWriteDASHManifestEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)writeHlsManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafWriteHLSManifestDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafWriteHLSManifestEnabled);
        }
        return @(AWSmediaconvertCmafWriteHLSManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmafWriteHLSManifestDisabled:
                return @"DISABLED";
            case AWSmediaconvertCmafWriteHLSManifestEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)writeSegmentTimelineInRepresentationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafWriteSegmentTimelineInRepresentationEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertCmafWriteSegmentTimelineInRepresentationDisabled);
        }
        return @(AWSmediaconvertCmafWriteSegmentTimelineInRepresentationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmafWriteSegmentTimelineInRepresentationEnabled:
                return @"ENABLED";
            case AWSmediaconvertCmafWriteSegmentTimelineInRepresentationDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertCmfcSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scte35Esam" : @"Scte35Esam",
             @"scte35Source" : @"Scte35Source",
             };
}

+ (NSValueTransformer *)scte35EsamJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSmediaconvertCmfcScte35EsamInsert);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertCmfcScte35EsamNone);
        }
        return @(AWSmediaconvertCmfcScte35EsamUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmfcScte35EsamInsert:
                return @"INSERT";
            case AWSmediaconvertCmfcScte35EsamNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35SourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmediaconvertCmfcScte35SourcePassthrough);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertCmfcScte35SourceNone);
        }
        return @(AWSmediaconvertCmfcScte35SourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCmfcScte35SourcePassthrough:
                return @"PASSTHROUGH";
            case AWSmediaconvertCmfcScte35SourceNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertColorCorrector

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
            return @(AWSmediaconvertColorSpaceConversionNone);
        }
        if ([value caseInsensitiveCompare:@"FORCE_601"] == NSOrderedSame) {
            return @(AWSmediaconvertColorSpaceConversionForce601);
        }
        if ([value caseInsensitiveCompare:@"FORCE_709"] == NSOrderedSame) {
            return @(AWSmediaconvertColorSpaceConversionForce709);
        }
        if ([value caseInsensitiveCompare:@"FORCE_HDR10"] == NSOrderedSame) {
            return @(AWSmediaconvertColorSpaceConversionForceHdr10);
        }
        if ([value caseInsensitiveCompare:@"FORCE_HLG_2020"] == NSOrderedSame) {
            return @(AWSmediaconvertColorSpaceConversionForceHlg2020);
        }
        return @(AWSmediaconvertColorSpaceConversionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertColorSpaceConversionNone:
                return @"NONE";
            case AWSmediaconvertColorSpaceConversionForce601:
                return @"FORCE_601";
            case AWSmediaconvertColorSpaceConversionForce709:
                return @"FORCE_709";
            case AWSmediaconvertColorSpaceConversionForceHdr10:
                return @"FORCE_HDR10";
            case AWSmediaconvertColorSpaceConversionForceHlg2020:
                return @"FORCE_HLG_2020";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hdr10MetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertHdr10Metadata class]];
}

@end

@implementation AWSmediaconvertContainerSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertCmfcSettings class]];
}

+ (NSValueTransformer *)containerJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"F4V"] == NSOrderedSame) {
            return @(AWSmediaconvertContainerTypeF4v);
        }
        if ([value caseInsensitiveCompare:@"ISMV"] == NSOrderedSame) {
            return @(AWSmediaconvertContainerTypeIsmv);
        }
        if ([value caseInsensitiveCompare:@"M2TS"] == NSOrderedSame) {
            return @(AWSmediaconvertContainerTypeM2ts);
        }
        if ([value caseInsensitiveCompare:@"M3U8"] == NSOrderedSame) {
            return @(AWSmediaconvertContainerTypeM3u8);
        }
        if ([value caseInsensitiveCompare:@"CMFC"] == NSOrderedSame) {
            return @(AWSmediaconvertContainerTypeCmfc);
        }
        if ([value caseInsensitiveCompare:@"MOV"] == NSOrderedSame) {
            return @(AWSmediaconvertContainerTypeMov);
        }
        if ([value caseInsensitiveCompare:@"MP4"] == NSOrderedSame) {
            return @(AWSmediaconvertContainerTypeMp4);
        }
        if ([value caseInsensitiveCompare:@"MPD"] == NSOrderedSame) {
            return @(AWSmediaconvertContainerTypeMpd);
        }
        if ([value caseInsensitiveCompare:@"MXF"] == NSOrderedSame) {
            return @(AWSmediaconvertContainerTypeMxf);
        }
        if ([value caseInsensitiveCompare:@"RAW"] == NSOrderedSame) {
            return @(AWSmediaconvertContainerTypeRAW);
        }
        return @(AWSmediaconvertContainerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertContainerTypeF4v:
                return @"F4V";
            case AWSmediaconvertContainerTypeIsmv:
                return @"ISMV";
            case AWSmediaconvertContainerTypeM2ts:
                return @"M2TS";
            case AWSmediaconvertContainerTypeM3u8:
                return @"M3U8";
            case AWSmediaconvertContainerTypeCmfc:
                return @"CMFC";
            case AWSmediaconvertContainerTypeMov:
                return @"MOV";
            case AWSmediaconvertContainerTypeMp4:
                return @"MP4";
            case AWSmediaconvertContainerTypeMpd:
                return @"MPD";
            case AWSmediaconvertContainerTypeMxf:
                return @"MXF";
            case AWSmediaconvertContainerTypeRAW:
                return @"RAW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)f4vSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertF4vSettings class]];
}

+ (NSValueTransformer *)m2tsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertM2tsSettings class]];
}

+ (NSValueTransformer *)m3u8SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertM3u8Settings class]];
}

+ (NSValueTransformer *)movSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertMovSettings class]];
}

+ (NSValueTransformer *)mp4SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertMp4Settings class]];
}

+ (NSValueTransformer *)mpdSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertMpdSettings class]];
}

+ (NSValueTransformer *)mxfSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertMxfSettings class]];
}

@end

@implementation AWSmediaconvertCreateJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAccelerationSettings class]];
}

+ (NSValueTransformer *)billingTagsSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUE"] == NSOrderedSame) {
            return @(AWSmediaconvertBillingTagsSourceQueue);
        }
        if ([value caseInsensitiveCompare:@"PRESET"] == NSOrderedSame) {
            return @(AWSmediaconvertBillingTagsSourcePreset);
        }
        if ([value caseInsensitiveCompare:@"JOB_TEMPLATE"] == NSOrderedSame) {
            return @(AWSmediaconvertBillingTagsSourceJobTemplate);
        }
        if ([value caseInsensitiveCompare:@"JOB"] == NSOrderedSame) {
            return @(AWSmediaconvertBillingTagsSourceJob);
        }
        return @(AWSmediaconvertBillingTagsSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertBillingTagsSourceQueue:
                return @"QUEUE";
            case AWSmediaconvertBillingTagsSourcePreset:
                return @"PRESET";
            case AWSmediaconvertBillingTagsSourceJobTemplate:
                return @"JOB_TEMPLATE";
            case AWSmediaconvertBillingTagsSourceJob:
                return @"JOB";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hopDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertHopDestination class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertJobSettings class]];
}

+ (NSValueTransformer *)simulateReservedQueueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertSimulateReservedQueueDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertSimulateReservedQueueEnabled);
        }
        return @(AWSmediaconvertSimulateReservedQueueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertSimulateReservedQueueDisabled:
                return @"DISABLED";
            case AWSmediaconvertSimulateReservedQueueEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusUpdateIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECONDS_10"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds10);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_12"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds12);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_15"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds15);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_20"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds20);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_30"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds30);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_60"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds60);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_120"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds120);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_180"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds180);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_240"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds240);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_300"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds300);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_360"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds360);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_420"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds420);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_480"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds480);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_540"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds540);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_600"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds600);
        }
        return @(AWSmediaconvertStatusUpdateIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertStatusUpdateIntervalSeconds10:
                return @"SECONDS_10";
            case AWSmediaconvertStatusUpdateIntervalSeconds12:
                return @"SECONDS_12";
            case AWSmediaconvertStatusUpdateIntervalSeconds15:
                return @"SECONDS_15";
            case AWSmediaconvertStatusUpdateIntervalSeconds20:
                return @"SECONDS_20";
            case AWSmediaconvertStatusUpdateIntervalSeconds30:
                return @"SECONDS_30";
            case AWSmediaconvertStatusUpdateIntervalSeconds60:
                return @"SECONDS_60";
            case AWSmediaconvertStatusUpdateIntervalSeconds120:
                return @"SECONDS_120";
            case AWSmediaconvertStatusUpdateIntervalSeconds180:
                return @"SECONDS_180";
            case AWSmediaconvertStatusUpdateIntervalSeconds240:
                return @"SECONDS_240";
            case AWSmediaconvertStatusUpdateIntervalSeconds300:
                return @"SECONDS_300";
            case AWSmediaconvertStatusUpdateIntervalSeconds360:
                return @"SECONDS_360";
            case AWSmediaconvertStatusUpdateIntervalSeconds420:
                return @"SECONDS_420";
            case AWSmediaconvertStatusUpdateIntervalSeconds480:
                return @"SECONDS_480";
            case AWSmediaconvertStatusUpdateIntervalSeconds540:
                return @"SECONDS_540";
            case AWSmediaconvertStatusUpdateIntervalSeconds600:
                return @"SECONDS_600";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertCreateJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"job" : @"Job",
             };
}

+ (NSValueTransformer *)jobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertJob class]];
}

@end

@implementation AWSmediaconvertCreateJobTemplateRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAccelerationSettings class]];
}

+ (NSValueTransformer *)hopDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertHopDestination class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertJobTemplateSettings class]];
}

+ (NSValueTransformer *)statusUpdateIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECONDS_10"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds10);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_12"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds12);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_15"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds15);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_20"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds20);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_30"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds30);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_60"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds60);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_120"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds120);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_180"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds180);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_240"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds240);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_300"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds300);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_360"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds360);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_420"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds420);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_480"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds480);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_540"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds540);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_600"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds600);
        }
        return @(AWSmediaconvertStatusUpdateIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertStatusUpdateIntervalSeconds10:
                return @"SECONDS_10";
            case AWSmediaconvertStatusUpdateIntervalSeconds12:
                return @"SECONDS_12";
            case AWSmediaconvertStatusUpdateIntervalSeconds15:
                return @"SECONDS_15";
            case AWSmediaconvertStatusUpdateIntervalSeconds20:
                return @"SECONDS_20";
            case AWSmediaconvertStatusUpdateIntervalSeconds30:
                return @"SECONDS_30";
            case AWSmediaconvertStatusUpdateIntervalSeconds60:
                return @"SECONDS_60";
            case AWSmediaconvertStatusUpdateIntervalSeconds120:
                return @"SECONDS_120";
            case AWSmediaconvertStatusUpdateIntervalSeconds180:
                return @"SECONDS_180";
            case AWSmediaconvertStatusUpdateIntervalSeconds240:
                return @"SECONDS_240";
            case AWSmediaconvertStatusUpdateIntervalSeconds300:
                return @"SECONDS_300";
            case AWSmediaconvertStatusUpdateIntervalSeconds360:
                return @"SECONDS_360";
            case AWSmediaconvertStatusUpdateIntervalSeconds420:
                return @"SECONDS_420";
            case AWSmediaconvertStatusUpdateIntervalSeconds480:
                return @"SECONDS_480";
            case AWSmediaconvertStatusUpdateIntervalSeconds540:
                return @"SECONDS_540";
            case AWSmediaconvertStatusUpdateIntervalSeconds600:
                return @"SECONDS_600";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertCreateJobTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobTemplate" : @"JobTemplate",
             };
}

+ (NSValueTransformer *)jobTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertJobTemplate class]];
}

@end

@implementation AWSmediaconvertCreatePresetRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertPresetSettings class]];
}

@end

@implementation AWSmediaconvertCreatePresetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"preset" : @"Preset",
             };
}

+ (NSValueTransformer *)presetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertPreset class]];
}

@end

@implementation AWSmediaconvertCreateQueueRequest

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
            return @(AWSmediaconvertPricingPlanOnDemand);
        }
        if ([value caseInsensitiveCompare:@"RESERVED"] == NSOrderedSame) {
            return @(AWSmediaconvertPricingPlanReserved);
        }
        return @(AWSmediaconvertPricingPlanUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertPricingPlanOnDemand:
                return @"ON_DEMAND";
            case AWSmediaconvertPricingPlanReserved:
                return @"RESERVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)reservationPlanSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertReservationPlanSettings class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSmediaconvertQueueStatusActive);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSmediaconvertQueueStatusPaused);
        }
        return @(AWSmediaconvertQueueStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertQueueStatusActive:
                return @"ACTIVE";
            case AWSmediaconvertQueueStatusPaused:
                return @"PAUSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertCreateQueueResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queue" : @"Queue",
             };
}

+ (NSValueTransformer *)queueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertQueue class]];
}

@end

@implementation AWSmediaconvertDashAdditionalManifest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestNameModifier" : @"ManifestNameModifier",
             @"selectedOutputs" : @"SelectedOutputs",
             };
}

@end

@implementation AWSmediaconvertDashIsoEncryptionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"playbackDeviceCompatibility" : @"PlaybackDeviceCompatibility",
             @"spekeKeyProvider" : @"SpekeKeyProvider",
             };
}

+ (NSValueTransformer *)playbackDeviceCompatibilityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CENC_V1"] == NSOrderedSame) {
            return @(AWSmediaconvertDashIsoPlaybackDeviceCompatibilityCencV1);
        }
        if ([value caseInsensitiveCompare:@"UNENCRYPTED_SEI"] == NSOrderedSame) {
            return @(AWSmediaconvertDashIsoPlaybackDeviceCompatibilityUnencryptedSei);
        }
        return @(AWSmediaconvertDashIsoPlaybackDeviceCompatibilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDashIsoPlaybackDeviceCompatibilityCencV1:
                return @"CENC_V1";
            case AWSmediaconvertDashIsoPlaybackDeviceCompatibilityUnencryptedSei:
                return @"UNENCRYPTED_SEI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertSpekeKeyProvider class]];
}

@end

@implementation AWSmediaconvertDashIsoGroupSettings

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertDashAdditionalManifest class]];
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDestinationSettings class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDashIsoEncryptionSettings class]];
}

+ (NSValueTransformer *)hbbtvComplianceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HBBTV_1_5"] == NSOrderedSame) {
            return @(AWSmediaconvertDashIsoHbbtvComplianceHbbtv15);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertDashIsoHbbtvComplianceNone);
        }
        return @(AWSmediaconvertDashIsoHbbtvComplianceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDashIsoHbbtvComplianceHbbtv15:
                return @"HBBTV_1_5";
            case AWSmediaconvertDashIsoHbbtvComplianceNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mpdProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAIN_PROFILE"] == NSOrderedSame) {
            return @(AWSmediaconvertDashIsoMpdProfileMainProfile);
        }
        if ([value caseInsensitiveCompare:@"ON_DEMAND_PROFILE"] == NSOrderedSame) {
            return @(AWSmediaconvertDashIsoMpdProfileOnDemandProfile);
        }
        return @(AWSmediaconvertDashIsoMpdProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDashIsoMpdProfileMainProfile:
                return @"MAIN_PROFILE";
            case AWSmediaconvertDashIsoMpdProfileOnDemandProfile:
                return @"ON_DEMAND_PROFILE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_FILE"] == NSOrderedSame) {
            return @(AWSmediaconvertDashIsoSegmentControlSingleFile);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTED_FILES"] == NSOrderedSame) {
            return @(AWSmediaconvertDashIsoSegmentControlSegmentedFiles);
        }
        return @(AWSmediaconvertDashIsoSegmentControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDashIsoSegmentControlSingleFile:
                return @"SINGLE_FILE";
            case AWSmediaconvertDashIsoSegmentControlSegmentedFiles:
                return @"SEGMENTED_FILES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)writeSegmentTimelineInRepresentationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertDashIsoWriteSegmentTimelineInRepresentationEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertDashIsoWriteSegmentTimelineInRepresentationDisabled);
        }
        return @(AWSmediaconvertDashIsoWriteSegmentTimelineInRepresentationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDashIsoWriteSegmentTimelineInRepresentationEnabled:
                return @"ENABLED";
            case AWSmediaconvertDashIsoWriteSegmentTimelineInRepresentationDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertDeinterlacer

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
            return @(AWSmediaconvertDeinterlaceAlgorithmInterpolate);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE_TICKER"] == NSOrderedSame) {
            return @(AWSmediaconvertDeinterlaceAlgorithmInterpolateTicker);
        }
        if ([value caseInsensitiveCompare:@"BLEND"] == NSOrderedSame) {
            return @(AWSmediaconvertDeinterlaceAlgorithmBlend);
        }
        if ([value caseInsensitiveCompare:@"BLEND_TICKER"] == NSOrderedSame) {
            return @(AWSmediaconvertDeinterlaceAlgorithmBlendTicker);
        }
        return @(AWSmediaconvertDeinterlaceAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDeinterlaceAlgorithmInterpolate:
                return @"INTERPOLATE";
            case AWSmediaconvertDeinterlaceAlgorithmInterpolateTicker:
                return @"INTERPOLATE_TICKER";
            case AWSmediaconvertDeinterlaceAlgorithmBlend:
                return @"BLEND";
            case AWSmediaconvertDeinterlaceAlgorithmBlendTicker:
                return @"BLEND_TICKER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)controlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FORCE_ALL_FRAMES"] == NSOrderedSame) {
            return @(AWSmediaconvertDeinterlacerControlForceAllFrames);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSmediaconvertDeinterlacerControlNormal);
        }
        return @(AWSmediaconvertDeinterlacerControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDeinterlacerControlForceAllFrames:
                return @"FORCE_ALL_FRAMES";
            case AWSmediaconvertDeinterlacerControlNormal:
                return @"NORMAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEINTERLACE"] == NSOrderedSame) {
            return @(AWSmediaconvertDeinterlacerModeDeinterlace);
        }
        if ([value caseInsensitiveCompare:@"INVERSE_TELECINE"] == NSOrderedSame) {
            return @(AWSmediaconvertDeinterlacerModeInverseTelecine);
        }
        if ([value caseInsensitiveCompare:@"ADAPTIVE"] == NSOrderedSame) {
            return @(AWSmediaconvertDeinterlacerModeAdaptive);
        }
        return @(AWSmediaconvertDeinterlacerModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDeinterlacerModeDeinterlace:
                return @"DEINTERLACE";
            case AWSmediaconvertDeinterlacerModeInverseTelecine:
                return @"INVERSE_TELECINE";
            case AWSmediaconvertDeinterlacerModeAdaptive:
                return @"ADAPTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertDeleteJobTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSmediaconvertDeleteJobTemplateResponse

@end

@implementation AWSmediaconvertDeletePresetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSmediaconvertDeletePresetResponse

@end

@implementation AWSmediaconvertDeleteQueueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSmediaconvertDeleteQueueResponse

@end

@implementation AWSmediaconvertDescribeEndpointsRequest

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
            return @(AWSmediaconvertDescribeEndpointsModeDefault);
        }
        if ([value caseInsensitiveCompare:@"GET_ONLY"] == NSOrderedSame) {
            return @(AWSmediaconvertDescribeEndpointsModeGetOnly);
        }
        return @(AWSmediaconvertDescribeEndpointsModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDescribeEndpointsModeDefault:
                return @"DEFAULT";
            case AWSmediaconvertDescribeEndpointsModeGetOnly:
                return @"GET_ONLY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertDescribeEndpointsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoints" : @"Endpoints",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)endpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertEndpoint class]];
}

@end

@implementation AWSmediaconvertDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Settings" : @"S3Settings",
             };
}

+ (NSValueTransformer *)s3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertS3DestinationSettings class]];
}

@end

@implementation AWSmediaconvertDisassociateCertificateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSmediaconvertDisassociateCertificateResponse

@end

@implementation AWSmediaconvertDolbyVision

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"l6Metadata" : @"L6Metadata",
             @"l6Mode" : @"L6Mode",
             @"profile" : @"Profile",
             };
}

+ (NSValueTransformer *)l6MetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDolbyVisionLevel6Metadata class]];
}

+ (NSValueTransformer *)l6ModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmediaconvertDolbyVisionLevel6ModePassthrough);
        }
        if ([value caseInsensitiveCompare:@"RECALCULATE"] == NSOrderedSame) {
            return @(AWSmediaconvertDolbyVisionLevel6ModeRecalculate);
        }
        if ([value caseInsensitiveCompare:@"SPECIFY"] == NSOrderedSame) {
            return @(AWSmediaconvertDolbyVisionLevel6ModeSpecify);
        }
        return @(AWSmediaconvertDolbyVisionLevel6ModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDolbyVisionLevel6ModePassthrough:
                return @"PASSTHROUGH";
            case AWSmediaconvertDolbyVisionLevel6ModeRecalculate:
                return @"RECALCULATE";
            case AWSmediaconvertDolbyVisionLevel6ModeSpecify:
                return @"SPECIFY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROFILE_5"] == NSOrderedSame) {
            return @(AWSmediaconvertDolbyVisionProfileProfile5);
        }
        return @(AWSmediaconvertDolbyVisionProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDolbyVisionProfileProfile5:
                return @"PROFILE_5";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertDolbyVisionLevel6Metadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxCll" : @"MaxCll",
             @"maxFall" : @"MaxFall",
             };
}

@end

@implementation AWSmediaconvertDvbNitSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkId" : @"NetworkId",
             @"networkName" : @"NetworkName",
             @"nitInterval" : @"NitInterval",
             };
}

@end

@implementation AWSmediaconvertDvbSdtSettings

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
            return @(AWSmediaconvertOutputSdtSdtFollow);
        }
        if ([value caseInsensitiveCompare:@"SDT_FOLLOW_IF_PRESENT"] == NSOrderedSame) {
            return @(AWSmediaconvertOutputSdtSdtFollowIfPresent);
        }
        if ([value caseInsensitiveCompare:@"SDT_MANUAL"] == NSOrderedSame) {
            return @(AWSmediaconvertOutputSdtSdtManual);
        }
        if ([value caseInsensitiveCompare:@"SDT_NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertOutputSdtSdtNone);
        }
        return @(AWSmediaconvertOutputSdtUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertOutputSdtSdtFollow:
                return @"SDT_FOLLOW";
            case AWSmediaconvertOutputSdtSdtFollowIfPresent:
                return @"SDT_FOLLOW_IF_PRESENT";
            case AWSmediaconvertOutputSdtSdtManual:
                return @"SDT_MANUAL";
            case AWSmediaconvertOutputSdtSdtNone:
                return @"SDT_NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertDvbSubDestinationSettings

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
            return @(AWSmediaconvertDvbSubtitleAlignmentCentered);
        }
        if ([value caseInsensitiveCompare:@"LEFT"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleAlignmentLeft);
        }
        return @(AWSmediaconvertDvbSubtitleAlignmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDvbSubtitleAlignmentCentered:
                return @"CENTERED";
            case AWSmediaconvertDvbSubtitleAlignmentLeft:
                return @"LEFT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)backgroundColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleBackgroundColorNone);
        }
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleBackgroundColorBlack);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleBackgroundColorWhite);
        }
        return @(AWSmediaconvertDvbSubtitleBackgroundColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDvbSubtitleBackgroundColorNone:
                return @"NONE";
            case AWSmediaconvertDvbSubtitleBackgroundColorBlack:
                return @"BLACK";
            case AWSmediaconvertDvbSubtitleBackgroundColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fontColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleFontColorWhite);
        }
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleFontColorBlack);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleFontColorYellow);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleFontColorRed);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleFontColorGreen);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleFontColorBlue);
        }
        return @(AWSmediaconvertDvbSubtitleFontColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDvbSubtitleFontColorWhite:
                return @"WHITE";
            case AWSmediaconvertDvbSubtitleFontColorBlack:
                return @"BLACK";
            case AWSmediaconvertDvbSubtitleFontColorYellow:
                return @"YELLOW";
            case AWSmediaconvertDvbSubtitleFontColorRed:
                return @"RED";
            case AWSmediaconvertDvbSubtitleFontColorGreen:
                return @"GREEN";
            case AWSmediaconvertDvbSubtitleFontColorBlue:
                return @"BLUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fontScriptJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTOMATIC"] == NSOrderedSame) {
            return @(AWSmediaconvertFontScriptAutomatic);
        }
        if ([value caseInsensitiveCompare:@"HANS"] == NSOrderedSame) {
            return @(AWSmediaconvertFontScriptHans);
        }
        if ([value caseInsensitiveCompare:@"HANT"] == NSOrderedSame) {
            return @(AWSmediaconvertFontScriptHant);
        }
        return @(AWSmediaconvertFontScriptUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertFontScriptAutomatic:
                return @"AUTOMATIC";
            case AWSmediaconvertFontScriptHans:
                return @"HANS";
            case AWSmediaconvertFontScriptHant:
                return @"HANT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outlineColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleOutlineColorBlack);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleOutlineColorWhite);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleOutlineColorYellow);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleOutlineColorRed);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleOutlineColorGreen);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleOutlineColorBlue);
        }
        return @(AWSmediaconvertDvbSubtitleOutlineColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDvbSubtitleOutlineColorBlack:
                return @"BLACK";
            case AWSmediaconvertDvbSubtitleOutlineColorWhite:
                return @"WHITE";
            case AWSmediaconvertDvbSubtitleOutlineColorYellow:
                return @"YELLOW";
            case AWSmediaconvertDvbSubtitleOutlineColorRed:
                return @"RED";
            case AWSmediaconvertDvbSubtitleOutlineColorGreen:
                return @"GREEN";
            case AWSmediaconvertDvbSubtitleOutlineColorBlue:
                return @"BLUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)shadowColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleShadowColorNone);
        }
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleShadowColorBlack);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleShadowColorWhite);
        }
        return @(AWSmediaconvertDvbSubtitleShadowColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDvbSubtitleShadowColorNone:
                return @"NONE";
            case AWSmediaconvertDvbSubtitleShadowColorBlack:
                return @"BLACK";
            case AWSmediaconvertDvbSubtitleShadowColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)subtitlingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HEARING_IMPAIRED"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitlingTypeHearingImpaired);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitlingTypeStandard);
        }
        return @(AWSmediaconvertDvbSubtitlingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDvbSubtitlingTypeHearingImpaired:
                return @"HEARING_IMPAIRED";
            case AWSmediaconvertDvbSubtitlingTypeStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)teletextSpacingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIXED_GRID"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleTeletextSpacingFixedGrid);
        }
        if ([value caseInsensitiveCompare:@"PROPORTIONAL"] == NSOrderedSame) {
            return @(AWSmediaconvertDvbSubtitleTeletextSpacingProportional);
        }
        return @(AWSmediaconvertDvbSubtitleTeletextSpacingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDvbSubtitleTeletextSpacingFixedGrid:
                return @"FIXED_GRID";
            case AWSmediaconvertDvbSubtitleTeletextSpacingProportional:
                return @"PROPORTIONAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertDvbSubSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pid" : @"Pid",
             };
}

@end

@implementation AWSmediaconvertDvbTdtSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tdtInterval" : @"TdtInterval",
             };
}

@end

@implementation AWSmediaconvertEac3AtmosSettings

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
            return @(AWSmediaconvertEac3AtmosBitstreamModeCompleteMain);
        }
        return @(AWSmediaconvertEac3AtmosBitstreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3AtmosBitstreamModeCompleteMain:
                return @"COMPLETE_MAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODING_MODE_9_1_6"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosCodingModeCodingMode916);
        }
        return @(AWSmediaconvertEac3AtmosCodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3AtmosCodingModeCodingMode916:
                return @"CODING_MODE_9_1_6";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dialogueIntelligenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDialogueIntelligenceEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDialogueIntelligenceDisabled);
        }
        return @(AWSmediaconvertEac3AtmosDialogueIntelligenceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3AtmosDialogueIntelligenceEnabled:
                return @"ENABLED";
            case AWSmediaconvertEac3AtmosDialogueIntelligenceDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicRangeCompressionLineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionLineNone);
        }
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionLineFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"FILM_LIGHT"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionLineFilmLight);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_STANDARD"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionLineMusicStandard);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_LIGHT"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionLineMusicLight);
        }
        if ([value caseInsensitiveCompare:@"SPEECH"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionLineSpeech);
        }
        return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionLineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3AtmosDynamicRangeCompressionLineNone:
                return @"NONE";
            case AWSmediaconvertEac3AtmosDynamicRangeCompressionLineFilmStandard:
                return @"FILM_STANDARD";
            case AWSmediaconvertEac3AtmosDynamicRangeCompressionLineFilmLight:
                return @"FILM_LIGHT";
            case AWSmediaconvertEac3AtmosDynamicRangeCompressionLineMusicStandard:
                return @"MUSIC_STANDARD";
            case AWSmediaconvertEac3AtmosDynamicRangeCompressionLineMusicLight:
                return @"MUSIC_LIGHT";
            case AWSmediaconvertEac3AtmosDynamicRangeCompressionLineSpeech:
                return @"SPEECH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicRangeCompressionRfJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionRfNone);
        }
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionRfFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"FILM_LIGHT"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionRfFilmLight);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_STANDARD"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionRfMusicStandard);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_LIGHT"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionRfMusicLight);
        }
        if ([value caseInsensitiveCompare:@"SPEECH"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionRfSpeech);
        }
        return @(AWSmediaconvertEac3AtmosDynamicRangeCompressionRfUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3AtmosDynamicRangeCompressionRfNone:
                return @"NONE";
            case AWSmediaconvertEac3AtmosDynamicRangeCompressionRfFilmStandard:
                return @"FILM_STANDARD";
            case AWSmediaconvertEac3AtmosDynamicRangeCompressionRfFilmLight:
                return @"FILM_LIGHT";
            case AWSmediaconvertEac3AtmosDynamicRangeCompressionRfMusicStandard:
                return @"MUSIC_STANDARD";
            case AWSmediaconvertEac3AtmosDynamicRangeCompressionRfMusicLight:
                return @"MUSIC_LIGHT";
            case AWSmediaconvertEac3AtmosDynamicRangeCompressionRfSpeech:
                return @"SPEECH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)meteringModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LEQ_A"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosMeteringModeLeqA);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_1"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosMeteringModeItuBs17701);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_2"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosMeteringModeItuBs17702);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_3"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosMeteringModeItuBs17703);
        }
        if ([value caseInsensitiveCompare:@"ITU_BS_1770_4"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosMeteringModeItuBs17704);
        }
        return @(AWSmediaconvertEac3AtmosMeteringModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3AtmosMeteringModeLeqA:
                return @"LEQ_A";
            case AWSmediaconvertEac3AtmosMeteringModeItuBs17701:
                return @"ITU_BS_1770_1";
            case AWSmediaconvertEac3AtmosMeteringModeItuBs17702:
                return @"ITU_BS_1770_2";
            case AWSmediaconvertEac3AtmosMeteringModeItuBs17703:
                return @"ITU_BS_1770_3";
            case AWSmediaconvertEac3AtmosMeteringModeItuBs17704:
                return @"ITU_BS_1770_4";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stereoDownmixJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosStereoDownmixNotIndicated);
        }
        if ([value caseInsensitiveCompare:@"STEREO"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosStereoDownmixStereo);
        }
        if ([value caseInsensitiveCompare:@"SURROUND"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosStereoDownmixSurround);
        }
        if ([value caseInsensitiveCompare:@"DPL2"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosStereoDownmixDpl2);
        }
        return @(AWSmediaconvertEac3AtmosStereoDownmixUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3AtmosStereoDownmixNotIndicated:
                return @"NOT_INDICATED";
            case AWSmediaconvertEac3AtmosStereoDownmixStereo:
                return @"STEREO";
            case AWSmediaconvertEac3AtmosStereoDownmixSurround:
                return @"SURROUND";
            case AWSmediaconvertEac3AtmosStereoDownmixDpl2:
                return @"DPL2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)surroundExModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosSurroundExModeNotIndicated);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosSurroundExModeEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AtmosSurroundExModeDisabled);
        }
        return @(AWSmediaconvertEac3AtmosSurroundExModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3AtmosSurroundExModeNotIndicated:
                return @"NOT_INDICATED";
            case AWSmediaconvertEac3AtmosSurroundExModeEnabled:
                return @"ENABLED";
            case AWSmediaconvertEac3AtmosSurroundExModeDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertEac3Settings

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
            return @(AWSmediaconvertEac3AttenuationControlAttenuate3Db);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3AttenuationControlNone);
        }
        return @(AWSmediaconvertEac3AttenuationControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3AttenuationControlAttenuate3Db:
                return @"ATTENUATE_3_DB";
            case AWSmediaconvertEac3AttenuationControlNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bitstreamModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETE_MAIN"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3BitstreamModeCompleteMain);
        }
        if ([value caseInsensitiveCompare:@"COMMENTARY"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3BitstreamModeCommentary);
        }
        if ([value caseInsensitiveCompare:@"EMERGENCY"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3BitstreamModeEmergency);
        }
        if ([value caseInsensitiveCompare:@"HEARING_IMPAIRED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3BitstreamModeHearingImpaired);
        }
        if ([value caseInsensitiveCompare:@"VISUALLY_IMPAIRED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3BitstreamModeVisuallyImpaired);
        }
        return @(AWSmediaconvertEac3BitstreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3BitstreamModeCompleteMain:
                return @"COMPLETE_MAIN";
            case AWSmediaconvertEac3BitstreamModeCommentary:
                return @"COMMENTARY";
            case AWSmediaconvertEac3BitstreamModeEmergency:
                return @"EMERGENCY";
            case AWSmediaconvertEac3BitstreamModeHearingImpaired:
                return @"HEARING_IMPAIRED";
            case AWSmediaconvertEac3BitstreamModeVisuallyImpaired:
                return @"VISUALLY_IMPAIRED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_0"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3CodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3CodingModeCodingMode20);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_3_2"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3CodingModeCodingMode32);
        }
        return @(AWSmediaconvertEac3CodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3CodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSmediaconvertEac3CodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            case AWSmediaconvertEac3CodingModeCodingMode32:
                return @"CODING_MODE_3_2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dcFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DcFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DcFilterDisabled);
        }
        return @(AWSmediaconvertEac3DcFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3DcFilterEnabled:
                return @"ENABLED";
            case AWSmediaconvertEac3DcFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicRangeCompressionLineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DynamicRangeCompressionLineNone);
        }
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DynamicRangeCompressionLineFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"FILM_LIGHT"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DynamicRangeCompressionLineFilmLight);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_STANDARD"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DynamicRangeCompressionLineMusicStandard);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_LIGHT"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DynamicRangeCompressionLineMusicLight);
        }
        if ([value caseInsensitiveCompare:@"SPEECH"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DynamicRangeCompressionLineSpeech);
        }
        return @(AWSmediaconvertEac3DynamicRangeCompressionLineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3DynamicRangeCompressionLineNone:
                return @"NONE";
            case AWSmediaconvertEac3DynamicRangeCompressionLineFilmStandard:
                return @"FILM_STANDARD";
            case AWSmediaconvertEac3DynamicRangeCompressionLineFilmLight:
                return @"FILM_LIGHT";
            case AWSmediaconvertEac3DynamicRangeCompressionLineMusicStandard:
                return @"MUSIC_STANDARD";
            case AWSmediaconvertEac3DynamicRangeCompressionLineMusicLight:
                return @"MUSIC_LIGHT";
            case AWSmediaconvertEac3DynamicRangeCompressionLineSpeech:
                return @"SPEECH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicRangeCompressionRfJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DynamicRangeCompressionRfNone);
        }
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DynamicRangeCompressionRfFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"FILM_LIGHT"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DynamicRangeCompressionRfFilmLight);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_STANDARD"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DynamicRangeCompressionRfMusicStandard);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_LIGHT"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DynamicRangeCompressionRfMusicLight);
        }
        if ([value caseInsensitiveCompare:@"SPEECH"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3DynamicRangeCompressionRfSpeech);
        }
        return @(AWSmediaconvertEac3DynamicRangeCompressionRfUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3DynamicRangeCompressionRfNone:
                return @"NONE";
            case AWSmediaconvertEac3DynamicRangeCompressionRfFilmStandard:
                return @"FILM_STANDARD";
            case AWSmediaconvertEac3DynamicRangeCompressionRfFilmLight:
                return @"FILM_LIGHT";
            case AWSmediaconvertEac3DynamicRangeCompressionRfMusicStandard:
                return @"MUSIC_STANDARD";
            case AWSmediaconvertEac3DynamicRangeCompressionRfMusicLight:
                return @"MUSIC_LIGHT";
            case AWSmediaconvertEac3DynamicRangeCompressionRfSpeech:
                return @"SPEECH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lfeControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LFE"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3LfeControlLfe);
        }
        if ([value caseInsensitiveCompare:@"NO_LFE"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3LfeControlNoLfe);
        }
        return @(AWSmediaconvertEac3LfeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3LfeControlLfe:
                return @"LFE";
            case AWSmediaconvertEac3LfeControlNoLfe:
                return @"NO_LFE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lfeFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3LfeFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3LfeFilterDisabled);
        }
        return @(AWSmediaconvertEac3LfeFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3LfeFilterEnabled:
                return @"ENABLED";
            case AWSmediaconvertEac3LfeFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metadataControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3MetadataControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3MetadataControlUseConfigured);
        }
        return @(AWSmediaconvertEac3MetadataControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3MetadataControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSmediaconvertEac3MetadataControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)passthroughControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WHEN_POSSIBLE"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3PassthroughControlWhenPossible);
        }
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3PassthroughControlNoPassthrough);
        }
        return @(AWSmediaconvertEac3PassthroughControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3PassthroughControlWhenPossible:
                return @"WHEN_POSSIBLE";
            case AWSmediaconvertEac3PassthroughControlNoPassthrough:
                return @"NO_PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)phaseControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SHIFT_90_DEGREES"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3PhaseControlShift90Degrees);
        }
        if ([value caseInsensitiveCompare:@"NO_SHIFT"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3PhaseControlNoShift);
        }
        return @(AWSmediaconvertEac3PhaseControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3PhaseControlShift90Degrees:
                return @"SHIFT_90_DEGREES";
            case AWSmediaconvertEac3PhaseControlNoShift:
                return @"NO_SHIFT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stereoDownmixJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3StereoDownmixNotIndicated);
        }
        if ([value caseInsensitiveCompare:@"LO_RO"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3StereoDownmixLoRo);
        }
        if ([value caseInsensitiveCompare:@"LT_RT"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3StereoDownmixLtRt);
        }
        if ([value caseInsensitiveCompare:@"DPL2"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3StereoDownmixDpl2);
        }
        return @(AWSmediaconvertEac3StereoDownmixUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3StereoDownmixNotIndicated:
                return @"NOT_INDICATED";
            case AWSmediaconvertEac3StereoDownmixLoRo:
                return @"LO_RO";
            case AWSmediaconvertEac3StereoDownmixLtRt:
                return @"LT_RT";
            case AWSmediaconvertEac3StereoDownmixDpl2:
                return @"DPL2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)surroundExModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3SurroundExModeNotIndicated);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3SurroundExModeEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3SurroundExModeDisabled);
        }
        return @(AWSmediaconvertEac3SurroundExModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3SurroundExModeNotIndicated:
                return @"NOT_INDICATED";
            case AWSmediaconvertEac3SurroundExModeEnabled:
                return @"ENABLED";
            case AWSmediaconvertEac3SurroundExModeDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)surroundModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3SurroundModeNotIndicated);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3SurroundModeEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEac3SurroundModeDisabled);
        }
        return @(AWSmediaconvertEac3SurroundModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEac3SurroundModeNotIndicated:
                return @"NOT_INDICATED";
            case AWSmediaconvertEac3SurroundModeEnabled:
                return @"ENABLED";
            case AWSmediaconvertEac3SurroundModeDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertEmbeddedDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination608ChannelNumber" : @"Destination608ChannelNumber",
             @"destination708ServiceNumber" : @"Destination708ServiceNumber",
             };
}

@end

@implementation AWSmediaconvertEmbeddedSourceSettings

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
            return @(AWSmediaconvertEmbeddedConvert608To708Upconvert);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEmbeddedConvert608To708Disabled);
        }
        return @(AWSmediaconvertEmbeddedConvert608To708Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEmbeddedConvert608To708Upconvert:
                return @"UPCONVERT";
            case AWSmediaconvertEmbeddedConvert608To708Disabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)terminateCaptionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"END_OF_INPUT"] == NSOrderedSame) {
            return @(AWSmediaconvertEmbeddedTerminateCaptionsEndOfInput);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertEmbeddedTerminateCaptionsDisabled);
        }
        return @(AWSmediaconvertEmbeddedTerminateCaptionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertEmbeddedTerminateCaptionsEndOfInput:
                return @"END_OF_INPUT";
            case AWSmediaconvertEmbeddedTerminateCaptionsDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"url" : @"Url",
             };
}

@end

@implementation AWSmediaconvertEsamManifestConfirmConditionNotification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mccXml" : @"MccXml",
             };
}

@end

@implementation AWSmediaconvertEsamSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestConfirmConditionNotification" : @"ManifestConfirmConditionNotification",
             @"responseSignalPreroll" : @"ResponseSignalPreroll",
             @"signalProcessingNotification" : @"SignalProcessingNotification",
             };
}

+ (NSValueTransformer *)manifestConfirmConditionNotificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertEsamManifestConfirmConditionNotification class]];
}

+ (NSValueTransformer *)signalProcessingNotificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertEsamSignalProcessingNotification class]];
}

@end

@implementation AWSmediaconvertEsamSignalProcessingNotification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sccXml" : @"SccXml",
             };
}

@end

@implementation AWSmediaconvertExceptionBody

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSmediaconvertF4vSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"moovPlacement" : @"MoovPlacement",
             };
}

+ (NSValueTransformer *)moovPlacementJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE_DOWNLOAD"] == NSOrderedSame) {
            return @(AWSmediaconvertF4vMoovPlacementProgressiveDownload);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSmediaconvertF4vMoovPlacementNormal);
        }
        return @(AWSmediaconvertF4vMoovPlacementUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertF4vMoovPlacementProgressiveDownload:
                return @"PROGRESSIVE_DOWNLOAD";
            case AWSmediaconvertF4vMoovPlacementNormal:
                return @"NORMAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertFileGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             @"destinationSettings" : @"DestinationSettings",
             };
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDestinationSettings class]];
}

@end

@implementation AWSmediaconvertFileSourceSettings

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
            return @(AWSmediaconvertFileSourceConvert608To708Upconvert);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertFileSourceConvert608To708Disabled);
        }
        return @(AWSmediaconvertFileSourceConvert608To708Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertFileSourceConvert608To708Upconvert:
                return @"UPCONVERT";
            case AWSmediaconvertFileSourceConvert608To708Disabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertCaptionSourceFramerate class]];
}

@end

@implementation AWSmediaconvertFrameCaptureSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             @"maxCaptures" : @"MaxCaptures",
             @"quality" : @"Quality",
             };
}

@end

@implementation AWSmediaconvertGetJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSmediaconvertGetJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"job" : @"Job",
             };
}

+ (NSValueTransformer *)jobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertJob class]];
}

@end

@implementation AWSmediaconvertGetJobTemplateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSmediaconvertGetJobTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobTemplate" : @"JobTemplate",
             };
}

+ (NSValueTransformer *)jobTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertJobTemplate class]];
}

@end

@implementation AWSmediaconvertGetPresetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSmediaconvertGetPresetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"preset" : @"Preset",
             };
}

+ (NSValueTransformer *)presetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertPreset class]];
}

@end

@implementation AWSmediaconvertGetQueueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSmediaconvertGetQueueResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queue" : @"Queue",
             };
}

+ (NSValueTransformer *)queueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertQueue class]];
}

@end

@implementation AWSmediaconvertH264QvbrSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxAverageBitrate" : @"MaxAverageBitrate",
             @"qvbrQualityLevel" : @"QvbrQualityLevel",
             @"qvbrQualityLevelFineTune" : @"QvbrQualityLevelFineTune",
             };
}

@end

@implementation AWSmediaconvertH264Settings

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
            return @(AWSmediaconvertH264AdaptiveQuantizationOff);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSmediaconvertH264AdaptiveQuantizationLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSmediaconvertH264AdaptiveQuantizationMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSmediaconvertH264AdaptiveQuantizationHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGHER"] == NSOrderedSame) {
            return @(AWSmediaconvertH264AdaptiveQuantizationHigher);
        }
        if ([value caseInsensitiveCompare:@"MAX"] == NSOrderedSame) {
            return @(AWSmediaconvertH264AdaptiveQuantizationMax);
        }
        return @(AWSmediaconvertH264AdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264AdaptiveQuantizationOff:
                return @"OFF";
            case AWSmediaconvertH264AdaptiveQuantizationLow:
                return @"LOW";
            case AWSmediaconvertH264AdaptiveQuantizationMedium:
                return @"MEDIUM";
            case AWSmediaconvertH264AdaptiveQuantizationHigh:
                return @"HIGH";
            case AWSmediaconvertH264AdaptiveQuantizationHigher:
                return @"HIGHER";
            case AWSmediaconvertH264AdaptiveQuantizationMax:
                return @"MAX";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelAuto);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_1"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel1);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_1_1"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel11);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_1_2"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel12);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_1_3"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel13);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_2"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel2);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_2_1"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel21);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_2_2"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel22);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_3"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel3);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_3_1"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel31);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_3_2"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel32);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_4"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel4);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_4_1"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel41);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_4_2"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel42);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_5"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel5);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_5_1"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel51);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_5_2"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecLevelLevel52);
        }
        return @(AWSmediaconvertH264CodecLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264CodecLevelAuto:
                return @"AUTO";
            case AWSmediaconvertH264CodecLevelLevel1:
                return @"LEVEL_1";
            case AWSmediaconvertH264CodecLevelLevel11:
                return @"LEVEL_1_1";
            case AWSmediaconvertH264CodecLevelLevel12:
                return @"LEVEL_1_2";
            case AWSmediaconvertH264CodecLevelLevel13:
                return @"LEVEL_1_3";
            case AWSmediaconvertH264CodecLevelLevel2:
                return @"LEVEL_2";
            case AWSmediaconvertH264CodecLevelLevel21:
                return @"LEVEL_2_1";
            case AWSmediaconvertH264CodecLevelLevel22:
                return @"LEVEL_2_2";
            case AWSmediaconvertH264CodecLevelLevel3:
                return @"LEVEL_3";
            case AWSmediaconvertH264CodecLevelLevel31:
                return @"LEVEL_3_1";
            case AWSmediaconvertH264CodecLevelLevel32:
                return @"LEVEL_3_2";
            case AWSmediaconvertH264CodecLevelLevel4:
                return @"LEVEL_4";
            case AWSmediaconvertH264CodecLevelLevel41:
                return @"LEVEL_4_1";
            case AWSmediaconvertH264CodecLevelLevel42:
                return @"LEVEL_4_2";
            case AWSmediaconvertH264CodecLevelLevel5:
                return @"LEVEL_5";
            case AWSmediaconvertH264CodecLevelLevel51:
                return @"LEVEL_5_1";
            case AWSmediaconvertH264CodecLevelLevel52:
                return @"LEVEL_5_2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BASELINE"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecProfileBaseline);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecProfileHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGH_10BIT"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecProfileHigh10bit);
        }
        if ([value caseInsensitiveCompare:@"HIGH_422"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecProfileHigh422);
        }
        if ([value caseInsensitiveCompare:@"HIGH_422_10BIT"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecProfileHigh42210bit);
        }
        if ([value caseInsensitiveCompare:@"MAIN"] == NSOrderedSame) {
            return @(AWSmediaconvertH264CodecProfileMain);
        }
        return @(AWSmediaconvertH264CodecProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264CodecProfileBaseline:
                return @"BASELINE";
            case AWSmediaconvertH264CodecProfileHigh:
                return @"HIGH";
            case AWSmediaconvertH264CodecProfileHigh10bit:
                return @"HIGH_10BIT";
            case AWSmediaconvertH264CodecProfileHigh422:
                return @"HIGH_422";
            case AWSmediaconvertH264CodecProfileHigh42210bit:
                return @"HIGH_422_10BIT";
            case AWSmediaconvertH264CodecProfileMain:
                return @"MAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicSubGopJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADAPTIVE"] == NSOrderedSame) {
            return @(AWSmediaconvertH264DynamicSubGopAdaptive);
        }
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSmediaconvertH264DynamicSubGopStatic);
        }
        return @(AWSmediaconvertH264DynamicSubGopUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264DynamicSubGopAdaptive:
                return @"ADAPTIVE";
            case AWSmediaconvertH264DynamicSubGopStatic:
                return @"STATIC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)entropyEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CABAC"] == NSOrderedSame) {
            return @(AWSmediaconvertH264EntropyEncodingCabac);
        }
        if ([value caseInsensitiveCompare:@"CAVLC"] == NSOrderedSame) {
            return @(AWSmediaconvertH264EntropyEncodingCavlc);
        }
        return @(AWSmediaconvertH264EntropyEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264EntropyEncodingCabac:
                return @"CABAC";
            case AWSmediaconvertH264EntropyEncodingCavlc:
                return @"CAVLC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fieldEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PAFF"] == NSOrderedSame) {
            return @(AWSmediaconvertH264FieldEncodingPaff);
        }
        if ([value caseInsensitiveCompare:@"FORCE_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertH264FieldEncodingForceField);
        }
        return @(AWSmediaconvertH264FieldEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264FieldEncodingPaff:
                return @"PAFF";
            case AWSmediaconvertH264FieldEncodingForceField:
                return @"FORCE_FIELD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)flickerAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264FlickerAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264FlickerAdaptiveQuantizationEnabled);
        }
        return @(AWSmediaconvertH264FlickerAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264FlickerAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSmediaconvertH264FlickerAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSmediaconvertH264FramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264FramerateControlSpecified);
        }
        return @(AWSmediaconvertH264FramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264FramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSmediaconvertH264FramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateConversionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUPLICATE_DROP"] == NSOrderedSame) {
            return @(AWSmediaconvertH264FramerateConversionAlgorithmDuplicateDrop);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE"] == NSOrderedSame) {
            return @(AWSmediaconvertH264FramerateConversionAlgorithmInterpolate);
        }
        return @(AWSmediaconvertH264FramerateConversionAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264FramerateConversionAlgorithmDuplicateDrop:
                return @"DUPLICATE_DROP";
            case AWSmediaconvertH264FramerateConversionAlgorithmInterpolate:
                return @"INTERPOLATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopBReferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264GopBReferenceDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264GopBReferenceEnabled);
        }
        return @(AWSmediaconvertH264GopBReferenceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264GopBReferenceDisabled:
                return @"DISABLED";
            case AWSmediaconvertH264GopBReferenceEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopSizeUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAMES"] == NSOrderedSame) {
            return @(AWSmediaconvertH264GopSizeUnitsFrames);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSmediaconvertH264GopSizeUnitsSeconds);
        }
        return @(AWSmediaconvertH264GopSizeUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264GopSizeUnitsFrames:
                return @"FRAMES";
            case AWSmediaconvertH264GopSizeUnitsSeconds:
                return @"SECONDS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)interlaceModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE"] == NSOrderedSame) {
            return @(AWSmediaconvertH264InterlaceModeProgressive);
        }
        if ([value caseInsensitiveCompare:@"TOP_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertH264InterlaceModeTopField);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertH264InterlaceModeBottomField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_TOP_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertH264InterlaceModeFollowTopField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertH264InterlaceModeFollowBottomField);
        }
        return @(AWSmediaconvertH264InterlaceModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264InterlaceModeProgressive:
                return @"PROGRESSIVE";
            case AWSmediaconvertH264InterlaceModeTopField:
                return @"TOP_FIELD";
            case AWSmediaconvertH264InterlaceModeBottomField:
                return @"BOTTOM_FIELD";
            case AWSmediaconvertH264InterlaceModeFollowTopField:
                return @"FOLLOW_TOP_FIELD";
            case AWSmediaconvertH264InterlaceModeFollowBottomField:
                return @"FOLLOW_BOTTOM_FIELD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSmediaconvertH264ParControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264ParControlSpecified);
        }
        return @(AWSmediaconvertH264ParControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264ParControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSmediaconvertH264ParControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qualityTuningLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_PASS"] == NSOrderedSame) {
            return @(AWSmediaconvertH264QualityTuningLevelSinglePass);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PASS_HQ"] == NSOrderedSame) {
            return @(AWSmediaconvertH264QualityTuningLevelSinglePassHq);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PASS_HQ"] == NSOrderedSame) {
            return @(AWSmediaconvertH264QualityTuningLevelMultiPassHq);
        }
        return @(AWSmediaconvertH264QualityTuningLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264QualityTuningLevelSinglePass:
                return @"SINGLE_PASS";
            case AWSmediaconvertH264QualityTuningLevelSinglePassHq:
                return @"SINGLE_PASS_HQ";
            case AWSmediaconvertH264QualityTuningLevelMultiPassHq:
                return @"MULTI_PASS_HQ";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qvbrSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertH264QvbrSettings class]];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSmediaconvertH264RateControlModeVbr);
        }
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSmediaconvertH264RateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"QVBR"] == NSOrderedSame) {
            return @(AWSmediaconvertH264RateControlModeQvbr);
        }
        return @(AWSmediaconvertH264RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264RateControlModeVbr:
                return @"VBR";
            case AWSmediaconvertH264RateControlModeCbr:
                return @"CBR";
            case AWSmediaconvertH264RateControlModeQvbr:
                return @"QVBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)repeatPpsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264RepeatPpsDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264RepeatPpsEnabled);
        }
        return @(AWSmediaconvertH264RepeatPpsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264RepeatPpsDisabled:
                return @"DISABLED";
            case AWSmediaconvertH264RepeatPpsEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sceneChangeDetectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264SceneChangeDetectDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264SceneChangeDetectEnabled);
        }
        if ([value caseInsensitiveCompare:@"TRANSITION_DETECTION"] == NSOrderedSame) {
            return @(AWSmediaconvertH264SceneChangeDetectTransitionDetection);
        }
        return @(AWSmediaconvertH264SceneChangeDetectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264SceneChangeDetectDisabled:
                return @"DISABLED";
            case AWSmediaconvertH264SceneChangeDetectEnabled:
                return @"ENABLED";
            case AWSmediaconvertH264SceneChangeDetectTransitionDetection:
                return @"TRANSITION_DETECTION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)slowPalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264SlowPalDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264SlowPalEnabled);
        }
        return @(AWSmediaconvertH264SlowPalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264SlowPalDisabled:
                return @"DISABLED";
            case AWSmediaconvertH264SlowPalEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spatialAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264SpatialAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264SpatialAdaptiveQuantizationEnabled);
        }
        return @(AWSmediaconvertH264SpatialAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264SpatialAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSmediaconvertH264SpatialAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)syntaxJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSmediaconvertH264SyntaxDefault);
        }
        if ([value caseInsensitiveCompare:@"RP2027"] == NSOrderedSame) {
            return @(AWSmediaconvertH264SyntaxRp2027);
        }
        return @(AWSmediaconvertH264SyntaxUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264SyntaxDefault:
                return @"DEFAULT";
            case AWSmediaconvertH264SyntaxRp2027:
                return @"RP2027";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)telecineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertH264TelecineNone);
        }
        if ([value caseInsensitiveCompare:@"SOFT"] == NSOrderedSame) {
            return @(AWSmediaconvertH264TelecineSoft);
        }
        if ([value caseInsensitiveCompare:@"HARD"] == NSOrderedSame) {
            return @(AWSmediaconvertH264TelecineHard);
        }
        return @(AWSmediaconvertH264TelecineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264TelecineNone:
                return @"NONE";
            case AWSmediaconvertH264TelecineSoft:
                return @"SOFT";
            case AWSmediaconvertH264TelecineHard:
                return @"HARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)temporalAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264TemporalAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264TemporalAdaptiveQuantizationEnabled);
        }
        return @(AWSmediaconvertH264TemporalAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264TemporalAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSmediaconvertH264TemporalAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unregisteredSeiTimecodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264UnregisteredSeiTimecodeDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH264UnregisteredSeiTimecodeEnabled);
        }
        return @(AWSmediaconvertH264UnregisteredSeiTimecodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH264UnregisteredSeiTimecodeDisabled:
                return @"DISABLED";
            case AWSmediaconvertH264UnregisteredSeiTimecodeEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertH265QvbrSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxAverageBitrate" : @"MaxAverageBitrate",
             @"qvbrQualityLevel" : @"QvbrQualityLevel",
             @"qvbrQualityLevelFineTune" : @"QvbrQualityLevelFineTune",
             };
}

@end

@implementation AWSmediaconvertH265Settings

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
            return @(AWSmediaconvertH265AdaptiveQuantizationOff);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSmediaconvertH265AdaptiveQuantizationLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSmediaconvertH265AdaptiveQuantizationMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSmediaconvertH265AdaptiveQuantizationHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGHER"] == NSOrderedSame) {
            return @(AWSmediaconvertH265AdaptiveQuantizationHigher);
        }
        if ([value caseInsensitiveCompare:@"MAX"] == NSOrderedSame) {
            return @(AWSmediaconvertH265AdaptiveQuantizationMax);
        }
        return @(AWSmediaconvertH265AdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265AdaptiveQuantizationOff:
                return @"OFF";
            case AWSmediaconvertH265AdaptiveQuantizationLow:
                return @"LOW";
            case AWSmediaconvertH265AdaptiveQuantizationMedium:
                return @"MEDIUM";
            case AWSmediaconvertH265AdaptiveQuantizationHigh:
                return @"HIGH";
            case AWSmediaconvertH265AdaptiveQuantizationHigher:
                return @"HIGHER";
            case AWSmediaconvertH265AdaptiveQuantizationMax:
                return @"MAX";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)alternateTransferFunctionSeiJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265AlternateTransferFunctionSeiDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265AlternateTransferFunctionSeiEnabled);
        }
        return @(AWSmediaconvertH265AlternateTransferFunctionSeiUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265AlternateTransferFunctionSeiDisabled:
                return @"DISABLED";
            case AWSmediaconvertH265AlternateTransferFunctionSeiEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelAuto);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_1"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelLevel1);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_2"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelLevel2);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_2_1"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelLevel21);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_3"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelLevel3);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_3_1"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelLevel31);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_4"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelLevel4);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_4_1"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelLevel41);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_5"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelLevel5);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_5_1"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelLevel51);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_5_2"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelLevel52);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_6"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelLevel6);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_6_1"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelLevel61);
        }
        if ([value caseInsensitiveCompare:@"LEVEL_6_2"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecLevelLevel62);
        }
        return @(AWSmediaconvertH265CodecLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265CodecLevelAuto:
                return @"AUTO";
            case AWSmediaconvertH265CodecLevelLevel1:
                return @"LEVEL_1";
            case AWSmediaconvertH265CodecLevelLevel2:
                return @"LEVEL_2";
            case AWSmediaconvertH265CodecLevelLevel21:
                return @"LEVEL_2_1";
            case AWSmediaconvertH265CodecLevelLevel3:
                return @"LEVEL_3";
            case AWSmediaconvertH265CodecLevelLevel31:
                return @"LEVEL_3_1";
            case AWSmediaconvertH265CodecLevelLevel4:
                return @"LEVEL_4";
            case AWSmediaconvertH265CodecLevelLevel41:
                return @"LEVEL_4_1";
            case AWSmediaconvertH265CodecLevelLevel5:
                return @"LEVEL_5";
            case AWSmediaconvertH265CodecLevelLevel51:
                return @"LEVEL_5_1";
            case AWSmediaconvertH265CodecLevelLevel52:
                return @"LEVEL_5_2";
            case AWSmediaconvertH265CodecLevelLevel6:
                return @"LEVEL_6";
            case AWSmediaconvertH265CodecLevelLevel61:
                return @"LEVEL_6_1";
            case AWSmediaconvertH265CodecLevelLevel62:
                return @"LEVEL_6_2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAIN_MAIN"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecProfileMainMain);
        }
        if ([value caseInsensitiveCompare:@"MAIN_HIGH"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecProfileMainHigh);
        }
        if ([value caseInsensitiveCompare:@"MAIN10_MAIN"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecProfileMain10Main);
        }
        if ([value caseInsensitiveCompare:@"MAIN10_HIGH"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecProfileMain10High);
        }
        if ([value caseInsensitiveCompare:@"MAIN_422_8BIT_MAIN"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecProfileMain4228bitMain);
        }
        if ([value caseInsensitiveCompare:@"MAIN_422_8BIT_HIGH"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecProfileMain4228bitHigh);
        }
        if ([value caseInsensitiveCompare:@"MAIN_422_10BIT_MAIN"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecProfileMain42210bitMain);
        }
        if ([value caseInsensitiveCompare:@"MAIN_422_10BIT_HIGH"] == NSOrderedSame) {
            return @(AWSmediaconvertH265CodecProfileMain42210bitHigh);
        }
        return @(AWSmediaconvertH265CodecProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265CodecProfileMainMain:
                return @"MAIN_MAIN";
            case AWSmediaconvertH265CodecProfileMainHigh:
                return @"MAIN_HIGH";
            case AWSmediaconvertH265CodecProfileMain10Main:
                return @"MAIN10_MAIN";
            case AWSmediaconvertH265CodecProfileMain10High:
                return @"MAIN10_HIGH";
            case AWSmediaconvertH265CodecProfileMain4228bitMain:
                return @"MAIN_422_8BIT_MAIN";
            case AWSmediaconvertH265CodecProfileMain4228bitHigh:
                return @"MAIN_422_8BIT_HIGH";
            case AWSmediaconvertH265CodecProfileMain42210bitMain:
                return @"MAIN_422_10BIT_MAIN";
            case AWSmediaconvertH265CodecProfileMain42210bitHigh:
                return @"MAIN_422_10BIT_HIGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicSubGopJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADAPTIVE"] == NSOrderedSame) {
            return @(AWSmediaconvertH265DynamicSubGopAdaptive);
        }
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSmediaconvertH265DynamicSubGopStatic);
        }
        return @(AWSmediaconvertH265DynamicSubGopUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265DynamicSubGopAdaptive:
                return @"ADAPTIVE";
            case AWSmediaconvertH265DynamicSubGopStatic:
                return @"STATIC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)flickerAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265FlickerAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265FlickerAdaptiveQuantizationEnabled);
        }
        return @(AWSmediaconvertH265FlickerAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265FlickerAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSmediaconvertH265FlickerAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSmediaconvertH265FramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265FramerateControlSpecified);
        }
        return @(AWSmediaconvertH265FramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265FramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSmediaconvertH265FramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateConversionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUPLICATE_DROP"] == NSOrderedSame) {
            return @(AWSmediaconvertH265FramerateConversionAlgorithmDuplicateDrop);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE"] == NSOrderedSame) {
            return @(AWSmediaconvertH265FramerateConversionAlgorithmInterpolate);
        }
        return @(AWSmediaconvertH265FramerateConversionAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265FramerateConversionAlgorithmDuplicateDrop:
                return @"DUPLICATE_DROP";
            case AWSmediaconvertH265FramerateConversionAlgorithmInterpolate:
                return @"INTERPOLATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopBReferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265GopBReferenceDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265GopBReferenceEnabled);
        }
        return @(AWSmediaconvertH265GopBReferenceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265GopBReferenceDisabled:
                return @"DISABLED";
            case AWSmediaconvertH265GopBReferenceEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopSizeUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAMES"] == NSOrderedSame) {
            return @(AWSmediaconvertH265GopSizeUnitsFrames);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSmediaconvertH265GopSizeUnitsSeconds);
        }
        return @(AWSmediaconvertH265GopSizeUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265GopSizeUnitsFrames:
                return @"FRAMES";
            case AWSmediaconvertH265GopSizeUnitsSeconds:
                return @"SECONDS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)interlaceModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE"] == NSOrderedSame) {
            return @(AWSmediaconvertH265InterlaceModeProgressive);
        }
        if ([value caseInsensitiveCompare:@"TOP_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertH265InterlaceModeTopField);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertH265InterlaceModeBottomField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_TOP_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertH265InterlaceModeFollowTopField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertH265InterlaceModeFollowBottomField);
        }
        return @(AWSmediaconvertH265InterlaceModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265InterlaceModeProgressive:
                return @"PROGRESSIVE";
            case AWSmediaconvertH265InterlaceModeTopField:
                return @"TOP_FIELD";
            case AWSmediaconvertH265InterlaceModeBottomField:
                return @"BOTTOM_FIELD";
            case AWSmediaconvertH265InterlaceModeFollowTopField:
                return @"FOLLOW_TOP_FIELD";
            case AWSmediaconvertH265InterlaceModeFollowBottomField:
                return @"FOLLOW_BOTTOM_FIELD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSmediaconvertH265ParControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265ParControlSpecified);
        }
        return @(AWSmediaconvertH265ParControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265ParControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSmediaconvertH265ParControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qualityTuningLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_PASS"] == NSOrderedSame) {
            return @(AWSmediaconvertH265QualityTuningLevelSinglePass);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PASS_HQ"] == NSOrderedSame) {
            return @(AWSmediaconvertH265QualityTuningLevelSinglePassHq);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PASS_HQ"] == NSOrderedSame) {
            return @(AWSmediaconvertH265QualityTuningLevelMultiPassHq);
        }
        return @(AWSmediaconvertH265QualityTuningLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265QualityTuningLevelSinglePass:
                return @"SINGLE_PASS";
            case AWSmediaconvertH265QualityTuningLevelSinglePassHq:
                return @"SINGLE_PASS_HQ";
            case AWSmediaconvertH265QualityTuningLevelMultiPassHq:
                return @"MULTI_PASS_HQ";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qvbrSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertH265QvbrSettings class]];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSmediaconvertH265RateControlModeVbr);
        }
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSmediaconvertH265RateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"QVBR"] == NSOrderedSame) {
            return @(AWSmediaconvertH265RateControlModeQvbr);
        }
        return @(AWSmediaconvertH265RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265RateControlModeVbr:
                return @"VBR";
            case AWSmediaconvertH265RateControlModeCbr:
                return @"CBR";
            case AWSmediaconvertH265RateControlModeQvbr:
                return @"QVBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sampleAdaptiveOffsetFilterModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSmediaconvertH265SampleAdaptiveOffsetFilterModeDefault);
        }
        if ([value caseInsensitiveCompare:@"ADAPTIVE"] == NSOrderedSame) {
            return @(AWSmediaconvertH265SampleAdaptiveOffsetFilterModeAdaptive);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSmediaconvertH265SampleAdaptiveOffsetFilterModeOff);
        }
        return @(AWSmediaconvertH265SampleAdaptiveOffsetFilterModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265SampleAdaptiveOffsetFilterModeDefault:
                return @"DEFAULT";
            case AWSmediaconvertH265SampleAdaptiveOffsetFilterModeAdaptive:
                return @"ADAPTIVE";
            case AWSmediaconvertH265SampleAdaptiveOffsetFilterModeOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sceneChangeDetectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265SceneChangeDetectDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265SceneChangeDetectEnabled);
        }
        if ([value caseInsensitiveCompare:@"TRANSITION_DETECTION"] == NSOrderedSame) {
            return @(AWSmediaconvertH265SceneChangeDetectTransitionDetection);
        }
        return @(AWSmediaconvertH265SceneChangeDetectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265SceneChangeDetectDisabled:
                return @"DISABLED";
            case AWSmediaconvertH265SceneChangeDetectEnabled:
                return @"ENABLED";
            case AWSmediaconvertH265SceneChangeDetectTransitionDetection:
                return @"TRANSITION_DETECTION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)slowPalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265SlowPalDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265SlowPalEnabled);
        }
        return @(AWSmediaconvertH265SlowPalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265SlowPalDisabled:
                return @"DISABLED";
            case AWSmediaconvertH265SlowPalEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spatialAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265SpatialAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265SpatialAdaptiveQuantizationEnabled);
        }
        return @(AWSmediaconvertH265SpatialAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265SpatialAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSmediaconvertH265SpatialAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)telecineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertH265TelecineNone);
        }
        if ([value caseInsensitiveCompare:@"SOFT"] == NSOrderedSame) {
            return @(AWSmediaconvertH265TelecineSoft);
        }
        if ([value caseInsensitiveCompare:@"HARD"] == NSOrderedSame) {
            return @(AWSmediaconvertH265TelecineHard);
        }
        return @(AWSmediaconvertH265TelecineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265TelecineNone:
                return @"NONE";
            case AWSmediaconvertH265TelecineSoft:
                return @"SOFT";
            case AWSmediaconvertH265TelecineHard:
                return @"HARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)temporalAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265TemporalAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265TemporalAdaptiveQuantizationEnabled);
        }
        return @(AWSmediaconvertH265TemporalAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265TemporalAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSmediaconvertH265TemporalAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)temporalIdsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265TemporalIdsDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265TemporalIdsEnabled);
        }
        return @(AWSmediaconvertH265TemporalIdsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265TemporalIdsDisabled:
                return @"DISABLED";
            case AWSmediaconvertH265TemporalIdsEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tilesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265TilesDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265TilesEnabled);
        }
        return @(AWSmediaconvertH265TilesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265TilesDisabled:
                return @"DISABLED";
            case AWSmediaconvertH265TilesEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unregisteredSeiTimecodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265UnregisteredSeiTimecodeDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertH265UnregisteredSeiTimecodeEnabled);
        }
        return @(AWSmediaconvertH265UnregisteredSeiTimecodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265UnregisteredSeiTimecodeDisabled:
                return @"DISABLED";
            case AWSmediaconvertH265UnregisteredSeiTimecodeEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)writeMp4PackagingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HVC1"] == NSOrderedSame) {
            return @(AWSmediaconvertH265WriteMp4PackagingTypeHvc1);
        }
        if ([value caseInsensitiveCompare:@"HEV1"] == NSOrderedSame) {
            return @(AWSmediaconvertH265WriteMp4PackagingTypeHev1);
        }
        return @(AWSmediaconvertH265WriteMp4PackagingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertH265WriteMp4PackagingTypeHvc1:
                return @"HVC1";
            case AWSmediaconvertH265WriteMp4PackagingTypeHev1:
                return @"HEV1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertHdr10Metadata

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

@implementation AWSmediaconvertHlsAdditionalManifest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestNameModifier" : @"ManifestNameModifier",
             @"selectedOutputs" : @"SelectedOutputs",
             };
}

@end

@implementation AWSmediaconvertHlsCaptionLanguageMapping

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
            return @(AWSmediaconvertLanguageCodeEng);
        }
        if ([value caseInsensitiveCompare:@"SPA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSpa);
        }
        if ([value caseInsensitiveCompare:@"FRA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFra);
        }
        if ([value caseInsensitiveCompare:@"DEU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDeu);
        }
        if ([value caseInsensitiveCompare:@"GER"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGer);
        }
        if ([value caseInsensitiveCompare:@"ZHO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZho);
        }
        if ([value caseInsensitiveCompare:@"ARA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAra);
        }
        if ([value caseInsensitiveCompare:@"HIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHin);
        }
        if ([value caseInsensitiveCompare:@"JPN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeJpn);
        }
        if ([value caseInsensitiveCompare:@"RUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRus);
        }
        if ([value caseInsensitiveCompare:@"POR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePor);
        }
        if ([value caseInsensitiveCompare:@"ITA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIta);
        }
        if ([value caseInsensitiveCompare:@"URD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUrd);
        }
        if ([value caseInsensitiveCompare:@"VIE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVie);
        }
        if ([value caseInsensitiveCompare:@"KOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKor);
        }
        if ([value caseInsensitiveCompare:@"PAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePan);
        }
        if ([value caseInsensitiveCompare:@"ABK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAbk);
        }
        if ([value caseInsensitiveCompare:@"AAR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAar);
        }
        if ([value caseInsensitiveCompare:@"AFR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAfr);
        }
        if ([value caseInsensitiveCompare:@"AKA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAka);
        }
        if ([value caseInsensitiveCompare:@"SQI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSqi);
        }
        if ([value caseInsensitiveCompare:@"AMH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAmh);
        }
        if ([value caseInsensitiveCompare:@"ARG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeArg);
        }
        if ([value caseInsensitiveCompare:@"HYE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHye);
        }
        if ([value caseInsensitiveCompare:@"ASM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAsm);
        }
        if ([value caseInsensitiveCompare:@"AVA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAva);
        }
        if ([value caseInsensitiveCompare:@"AVE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAve);
        }
        if ([value caseInsensitiveCompare:@"AYM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAym);
        }
        if ([value caseInsensitiveCompare:@"AZE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeAze);
        }
        if ([value caseInsensitiveCompare:@"BAM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBam);
        }
        if ([value caseInsensitiveCompare:@"BAK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBak);
        }
        if ([value caseInsensitiveCompare:@"EUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEus);
        }
        if ([value caseInsensitiveCompare:@"BEL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBel);
        }
        if ([value caseInsensitiveCompare:@"BEN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBen);
        }
        if ([value caseInsensitiveCompare:@"BIH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBih);
        }
        if ([value caseInsensitiveCompare:@"BIS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBis);
        }
        if ([value caseInsensitiveCompare:@"BOS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBos);
        }
        if ([value caseInsensitiveCompare:@"BRE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBre);
        }
        if ([value caseInsensitiveCompare:@"BUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBul);
        }
        if ([value caseInsensitiveCompare:@"MYA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMya);
        }
        if ([value caseInsensitiveCompare:@"CAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCat);
        }
        if ([value caseInsensitiveCompare:@"KHM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKhm);
        }
        if ([value caseInsensitiveCompare:@"CHA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCha);
        }
        if ([value caseInsensitiveCompare:@"CHE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChe);
        }
        if ([value caseInsensitiveCompare:@"NYA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNya);
        }
        if ([value caseInsensitiveCompare:@"CHU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChu);
        }
        if ([value caseInsensitiveCompare:@"CHV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeChv);
        }
        if ([value caseInsensitiveCompare:@"COR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCor);
        }
        if ([value caseInsensitiveCompare:@"COS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCos);
        }
        if ([value caseInsensitiveCompare:@"CRE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCre);
        }
        if ([value caseInsensitiveCompare:@"HRV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHrv);
        }
        if ([value caseInsensitiveCompare:@"CES"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCes);
        }
        if ([value caseInsensitiveCompare:@"DAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDan);
        }
        if ([value caseInsensitiveCompare:@"DIV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDiv);
        }
        if ([value caseInsensitiveCompare:@"NLD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNld);
        }
        if ([value caseInsensitiveCompare:@"DZO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeDzo);
        }
        if ([value caseInsensitiveCompare:@"ENM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEnm);
        }
        if ([value caseInsensitiveCompare:@"EPO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEpo);
        }
        if ([value caseInsensitiveCompare:@"EST"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEst);
        }
        if ([value caseInsensitiveCompare:@"EWE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEwe);
        }
        if ([value caseInsensitiveCompare:@"FAO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFao);
        }
        if ([value caseInsensitiveCompare:@"FIJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFij);
        }
        if ([value caseInsensitiveCompare:@"FIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFin);
        }
        if ([value caseInsensitiveCompare:@"FRM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFrm);
        }
        if ([value caseInsensitiveCompare:@"FUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFul);
        }
        if ([value caseInsensitiveCompare:@"GLA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGla);
        }
        if ([value caseInsensitiveCompare:@"GLG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGlg);
        }
        if ([value caseInsensitiveCompare:@"LUG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLug);
        }
        if ([value caseInsensitiveCompare:@"KAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKat);
        }
        if ([value caseInsensitiveCompare:@"ELL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeEll);
        }
        if ([value caseInsensitiveCompare:@"GRN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGrn);
        }
        if ([value caseInsensitiveCompare:@"GUJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGuj);
        }
        if ([value caseInsensitiveCompare:@"HAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHat);
        }
        if ([value caseInsensitiveCompare:@"HAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHau);
        }
        if ([value caseInsensitiveCompare:@"HEB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHeb);
        }
        if ([value caseInsensitiveCompare:@"HER"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHer);
        }
        if ([value caseInsensitiveCompare:@"HMO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHmo);
        }
        if ([value caseInsensitiveCompare:@"HUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeHun);
        }
        if ([value caseInsensitiveCompare:@"ISL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIsl);
        }
        if ([value caseInsensitiveCompare:@"IDO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIdo);
        }
        if ([value caseInsensitiveCompare:@"IBO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIbo);
        }
        if ([value caseInsensitiveCompare:@"IND"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeInd);
        }
        if ([value caseInsensitiveCompare:@"INA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIna);
        }
        if ([value caseInsensitiveCompare:@"ILE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIle);
        }
        if ([value caseInsensitiveCompare:@"IKU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIku);
        }
        if ([value caseInsensitiveCompare:@"IPK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIpk);
        }
        if ([value caseInsensitiveCompare:@"GLE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGle);
        }
        if ([value caseInsensitiveCompare:@"JAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeJav);
        }
        if ([value caseInsensitiveCompare:@"KAL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKal);
        }
        if ([value caseInsensitiveCompare:@"KAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKan);
        }
        if ([value caseInsensitiveCompare:@"KAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKau);
        }
        if ([value caseInsensitiveCompare:@"KAS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKas);
        }
        if ([value caseInsensitiveCompare:@"KAZ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKaz);
        }
        if ([value caseInsensitiveCompare:@"KIK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKik);
        }
        if ([value caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKin);
        }
        if ([value caseInsensitiveCompare:@"KIR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKir);
        }
        if ([value caseInsensitiveCompare:@"KOM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKom);
        }
        if ([value caseInsensitiveCompare:@"KON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKon);
        }
        if ([value caseInsensitiveCompare:@"KUA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKua);
        }
        if ([value caseInsensitiveCompare:@"KUR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeKur);
        }
        if ([value caseInsensitiveCompare:@"LAO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLao);
        }
        if ([value caseInsensitiveCompare:@"LAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLat);
        }
        if ([value caseInsensitiveCompare:@"LAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLav);
        }
        if ([value caseInsensitiveCompare:@"LIM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLim);
        }
        if ([value caseInsensitiveCompare:@"LIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLin);
        }
        if ([value caseInsensitiveCompare:@"LIT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLit);
        }
        if ([value caseInsensitiveCompare:@"LUB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLub);
        }
        if ([value caseInsensitiveCompare:@"LTZ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeLtz);
        }
        if ([value caseInsensitiveCompare:@"MKD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMkd);
        }
        if ([value caseInsensitiveCompare:@"MLG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMlg);
        }
        if ([value caseInsensitiveCompare:@"MSA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMsa);
        }
        if ([value caseInsensitiveCompare:@"MAL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMal);
        }
        if ([value caseInsensitiveCompare:@"MLT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMlt);
        }
        if ([value caseInsensitiveCompare:@"GLV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeGlv);
        }
        if ([value caseInsensitiveCompare:@"MRI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMri);
        }
        if ([value caseInsensitiveCompare:@"MAR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMar);
        }
        if ([value caseInsensitiveCompare:@"MAH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMah);
        }
        if ([value caseInsensitiveCompare:@"MON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeMon);
        }
        if ([value caseInsensitiveCompare:@"NAU"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNau);
        }
        if ([value caseInsensitiveCompare:@"NAV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNav);
        }
        if ([value caseInsensitiveCompare:@"NDE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNde);
        }
        if ([value caseInsensitiveCompare:@"NBL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNbl);
        }
        if ([value caseInsensitiveCompare:@"NDO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNdo);
        }
        if ([value caseInsensitiveCompare:@"NEP"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNep);
        }
        if ([value caseInsensitiveCompare:@"SME"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSme);
        }
        if ([value caseInsensitiveCompare:@"NOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNor);
        }
        if ([value caseInsensitiveCompare:@"NOB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNob);
        }
        if ([value caseInsensitiveCompare:@"NNO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeNno);
        }
        if ([value caseInsensitiveCompare:@"OCI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOci);
        }
        if ([value caseInsensitiveCompare:@"OJI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOji);
        }
        if ([value caseInsensitiveCompare:@"ORI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOri);
        }
        if ([value caseInsensitiveCompare:@"ORM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOrm);
        }
        if ([value caseInsensitiveCompare:@"OSS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOss);
        }
        if ([value caseInsensitiveCompare:@"PLI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePli);
        }
        if ([value caseInsensitiveCompare:@"FAS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFas);
        }
        if ([value caseInsensitiveCompare:@"POL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePol);
        }
        if ([value caseInsensitiveCompare:@"PUS"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodePus);
        }
        if ([value caseInsensitiveCompare:@"QUE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQue);
        }
        if ([value caseInsensitiveCompare:@"QAA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQaa);
        }
        if ([value caseInsensitiveCompare:@"RON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRon);
        }
        if ([value caseInsensitiveCompare:@"ROH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRoh);
        }
        if ([value caseInsensitiveCompare:@"RUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeRun);
        }
        if ([value caseInsensitiveCompare:@"SMO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSmo);
        }
        if ([value caseInsensitiveCompare:@"SAG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSag);
        }
        if ([value caseInsensitiveCompare:@"SAN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSan);
        }
        if ([value caseInsensitiveCompare:@"SRD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSrd);
        }
        if ([value caseInsensitiveCompare:@"SRB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSrb);
        }
        if ([value caseInsensitiveCompare:@"SNA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSna);
        }
        if ([value caseInsensitiveCompare:@"III"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeIii);
        }
        if ([value caseInsensitiveCompare:@"SND"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSnd);
        }
        if ([value caseInsensitiveCompare:@"SIN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSin);
        }
        if ([value caseInsensitiveCompare:@"SLK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSlk);
        }
        if ([value caseInsensitiveCompare:@"SLV"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSlv);
        }
        if ([value caseInsensitiveCompare:@"SOM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSom);
        }
        if ([value caseInsensitiveCompare:@"SOT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSot);
        }
        if ([value caseInsensitiveCompare:@"SUN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSun);
        }
        if ([value caseInsensitiveCompare:@"SWA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSwa);
        }
        if ([value caseInsensitiveCompare:@"SSW"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSsw);
        }
        if ([value caseInsensitiveCompare:@"SWE"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeSwe);
        }
        if ([value caseInsensitiveCompare:@"TGL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTgl);
        }
        if ([value caseInsensitiveCompare:@"TAH"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTah);
        }
        if ([value caseInsensitiveCompare:@"TGK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTgk);
        }
        if ([value caseInsensitiveCompare:@"TAM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTam);
        }
        if ([value caseInsensitiveCompare:@"TAT"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTat);
        }
        if ([value caseInsensitiveCompare:@"TEL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTel);
        }
        if ([value caseInsensitiveCompare:@"THA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTha);
        }
        if ([value caseInsensitiveCompare:@"BOD"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeBod);
        }
        if ([value caseInsensitiveCompare:@"TIR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTir);
        }
        if ([value caseInsensitiveCompare:@"TON"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTon);
        }
        if ([value caseInsensitiveCompare:@"TSO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTso);
        }
        if ([value caseInsensitiveCompare:@"TSN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTsn);
        }
        if ([value caseInsensitiveCompare:@"TUR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTur);
        }
        if ([value caseInsensitiveCompare:@"TUK"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTuk);
        }
        if ([value caseInsensitiveCompare:@"TWI"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTwi);
        }
        if ([value caseInsensitiveCompare:@"UIG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUig);
        }
        if ([value caseInsensitiveCompare:@"UKR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUkr);
        }
        if ([value caseInsensitiveCompare:@"UZB"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeUzb);
        }
        if ([value caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVen);
        }
        if ([value caseInsensitiveCompare:@"VOL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeVol);
        }
        if ([value caseInsensitiveCompare:@"WLN"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeWln);
        }
        if ([value caseInsensitiveCompare:@"CYM"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeCym);
        }
        if ([value caseInsensitiveCompare:@"FRY"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeFry);
        }
        if ([value caseInsensitiveCompare:@"WOL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeWol);
        }
        if ([value caseInsensitiveCompare:@"XHO"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeXho);
        }
        if ([value caseInsensitiveCompare:@"YID"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeYid);
        }
        if ([value caseInsensitiveCompare:@"YOR"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeYor);
        }
        if ([value caseInsensitiveCompare:@"ZHA"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZha);
        }
        if ([value caseInsensitiveCompare:@"ZUL"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeZul);
        }
        if ([value caseInsensitiveCompare:@"ORJ"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeOrj);
        }
        if ([value caseInsensitiveCompare:@"QPC"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeQpc);
        }
        if ([value caseInsensitiveCompare:@"TNG"] == NSOrderedSame) {
            return @(AWSmediaconvertLanguageCodeTng);
        }
        return @(AWSmediaconvertLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertLanguageCodeEng:
                return @"ENG";
            case AWSmediaconvertLanguageCodeSpa:
                return @"SPA";
            case AWSmediaconvertLanguageCodeFra:
                return @"FRA";
            case AWSmediaconvertLanguageCodeDeu:
                return @"DEU";
            case AWSmediaconvertLanguageCodeGer:
                return @"GER";
            case AWSmediaconvertLanguageCodeZho:
                return @"ZHO";
            case AWSmediaconvertLanguageCodeAra:
                return @"ARA";
            case AWSmediaconvertLanguageCodeHin:
                return @"HIN";
            case AWSmediaconvertLanguageCodeJpn:
                return @"JPN";
            case AWSmediaconvertLanguageCodeRus:
                return @"RUS";
            case AWSmediaconvertLanguageCodePor:
                return @"POR";
            case AWSmediaconvertLanguageCodeIta:
                return @"ITA";
            case AWSmediaconvertLanguageCodeUrd:
                return @"URD";
            case AWSmediaconvertLanguageCodeVie:
                return @"VIE";
            case AWSmediaconvertLanguageCodeKor:
                return @"KOR";
            case AWSmediaconvertLanguageCodePan:
                return @"PAN";
            case AWSmediaconvertLanguageCodeAbk:
                return @"ABK";
            case AWSmediaconvertLanguageCodeAar:
                return @"AAR";
            case AWSmediaconvertLanguageCodeAfr:
                return @"AFR";
            case AWSmediaconvertLanguageCodeAka:
                return @"AKA";
            case AWSmediaconvertLanguageCodeSqi:
                return @"SQI";
            case AWSmediaconvertLanguageCodeAmh:
                return @"AMH";
            case AWSmediaconvertLanguageCodeArg:
                return @"ARG";
            case AWSmediaconvertLanguageCodeHye:
                return @"HYE";
            case AWSmediaconvertLanguageCodeAsm:
                return @"ASM";
            case AWSmediaconvertLanguageCodeAva:
                return @"AVA";
            case AWSmediaconvertLanguageCodeAve:
                return @"AVE";
            case AWSmediaconvertLanguageCodeAym:
                return @"AYM";
            case AWSmediaconvertLanguageCodeAze:
                return @"AZE";
            case AWSmediaconvertLanguageCodeBam:
                return @"BAM";
            case AWSmediaconvertLanguageCodeBak:
                return @"BAK";
            case AWSmediaconvertLanguageCodeEus:
                return @"EUS";
            case AWSmediaconvertLanguageCodeBel:
                return @"BEL";
            case AWSmediaconvertLanguageCodeBen:
                return @"BEN";
            case AWSmediaconvertLanguageCodeBih:
                return @"BIH";
            case AWSmediaconvertLanguageCodeBis:
                return @"BIS";
            case AWSmediaconvertLanguageCodeBos:
                return @"BOS";
            case AWSmediaconvertLanguageCodeBre:
                return @"BRE";
            case AWSmediaconvertLanguageCodeBul:
                return @"BUL";
            case AWSmediaconvertLanguageCodeMya:
                return @"MYA";
            case AWSmediaconvertLanguageCodeCat:
                return @"CAT";
            case AWSmediaconvertLanguageCodeKhm:
                return @"KHM";
            case AWSmediaconvertLanguageCodeCha:
                return @"CHA";
            case AWSmediaconvertLanguageCodeChe:
                return @"CHE";
            case AWSmediaconvertLanguageCodeNya:
                return @"NYA";
            case AWSmediaconvertLanguageCodeChu:
                return @"CHU";
            case AWSmediaconvertLanguageCodeChv:
                return @"CHV";
            case AWSmediaconvertLanguageCodeCor:
                return @"COR";
            case AWSmediaconvertLanguageCodeCos:
                return @"COS";
            case AWSmediaconvertLanguageCodeCre:
                return @"CRE";
            case AWSmediaconvertLanguageCodeHrv:
                return @"HRV";
            case AWSmediaconvertLanguageCodeCes:
                return @"CES";
            case AWSmediaconvertLanguageCodeDan:
                return @"DAN";
            case AWSmediaconvertLanguageCodeDiv:
                return @"DIV";
            case AWSmediaconvertLanguageCodeNld:
                return @"NLD";
            case AWSmediaconvertLanguageCodeDzo:
                return @"DZO";
            case AWSmediaconvertLanguageCodeEnm:
                return @"ENM";
            case AWSmediaconvertLanguageCodeEpo:
                return @"EPO";
            case AWSmediaconvertLanguageCodeEst:
                return @"EST";
            case AWSmediaconvertLanguageCodeEwe:
                return @"EWE";
            case AWSmediaconvertLanguageCodeFao:
                return @"FAO";
            case AWSmediaconvertLanguageCodeFij:
                return @"FIJ";
            case AWSmediaconvertLanguageCodeFin:
                return @"FIN";
            case AWSmediaconvertLanguageCodeFrm:
                return @"FRM";
            case AWSmediaconvertLanguageCodeFul:
                return @"FUL";
            case AWSmediaconvertLanguageCodeGla:
                return @"GLA";
            case AWSmediaconvertLanguageCodeGlg:
                return @"GLG";
            case AWSmediaconvertLanguageCodeLug:
                return @"LUG";
            case AWSmediaconvertLanguageCodeKat:
                return @"KAT";
            case AWSmediaconvertLanguageCodeEll:
                return @"ELL";
            case AWSmediaconvertLanguageCodeGrn:
                return @"GRN";
            case AWSmediaconvertLanguageCodeGuj:
                return @"GUJ";
            case AWSmediaconvertLanguageCodeHat:
                return @"HAT";
            case AWSmediaconvertLanguageCodeHau:
                return @"HAU";
            case AWSmediaconvertLanguageCodeHeb:
                return @"HEB";
            case AWSmediaconvertLanguageCodeHer:
                return @"HER";
            case AWSmediaconvertLanguageCodeHmo:
                return @"HMO";
            case AWSmediaconvertLanguageCodeHun:
                return @"HUN";
            case AWSmediaconvertLanguageCodeIsl:
                return @"ISL";
            case AWSmediaconvertLanguageCodeIdo:
                return @"IDO";
            case AWSmediaconvertLanguageCodeIbo:
                return @"IBO";
            case AWSmediaconvertLanguageCodeInd:
                return @"IND";
            case AWSmediaconvertLanguageCodeIna:
                return @"INA";
            case AWSmediaconvertLanguageCodeIle:
                return @"ILE";
            case AWSmediaconvertLanguageCodeIku:
                return @"IKU";
            case AWSmediaconvertLanguageCodeIpk:
                return @"IPK";
            case AWSmediaconvertLanguageCodeGle:
                return @"GLE";
            case AWSmediaconvertLanguageCodeJav:
                return @"JAV";
            case AWSmediaconvertLanguageCodeKal:
                return @"KAL";
            case AWSmediaconvertLanguageCodeKan:
                return @"KAN";
            case AWSmediaconvertLanguageCodeKau:
                return @"KAU";
            case AWSmediaconvertLanguageCodeKas:
                return @"KAS";
            case AWSmediaconvertLanguageCodeKaz:
                return @"KAZ";
            case AWSmediaconvertLanguageCodeKik:
                return @"KIK";
            case AWSmediaconvertLanguageCodeKin:
                return @"KIN";
            case AWSmediaconvertLanguageCodeKir:
                return @"KIR";
            case AWSmediaconvertLanguageCodeKom:
                return @"KOM";
            case AWSmediaconvertLanguageCodeKon:
                return @"KON";
            case AWSmediaconvertLanguageCodeKua:
                return @"KUA";
            case AWSmediaconvertLanguageCodeKur:
                return @"KUR";
            case AWSmediaconvertLanguageCodeLao:
                return @"LAO";
            case AWSmediaconvertLanguageCodeLat:
                return @"LAT";
            case AWSmediaconvertLanguageCodeLav:
                return @"LAV";
            case AWSmediaconvertLanguageCodeLim:
                return @"LIM";
            case AWSmediaconvertLanguageCodeLin:
                return @"LIN";
            case AWSmediaconvertLanguageCodeLit:
                return @"LIT";
            case AWSmediaconvertLanguageCodeLub:
                return @"LUB";
            case AWSmediaconvertLanguageCodeLtz:
                return @"LTZ";
            case AWSmediaconvertLanguageCodeMkd:
                return @"MKD";
            case AWSmediaconvertLanguageCodeMlg:
                return @"MLG";
            case AWSmediaconvertLanguageCodeMsa:
                return @"MSA";
            case AWSmediaconvertLanguageCodeMal:
                return @"MAL";
            case AWSmediaconvertLanguageCodeMlt:
                return @"MLT";
            case AWSmediaconvertLanguageCodeGlv:
                return @"GLV";
            case AWSmediaconvertLanguageCodeMri:
                return @"MRI";
            case AWSmediaconvertLanguageCodeMar:
                return @"MAR";
            case AWSmediaconvertLanguageCodeMah:
                return @"MAH";
            case AWSmediaconvertLanguageCodeMon:
                return @"MON";
            case AWSmediaconvertLanguageCodeNau:
                return @"NAU";
            case AWSmediaconvertLanguageCodeNav:
                return @"NAV";
            case AWSmediaconvertLanguageCodeNde:
                return @"NDE";
            case AWSmediaconvertLanguageCodeNbl:
                return @"NBL";
            case AWSmediaconvertLanguageCodeNdo:
                return @"NDO";
            case AWSmediaconvertLanguageCodeNep:
                return @"NEP";
            case AWSmediaconvertLanguageCodeSme:
                return @"SME";
            case AWSmediaconvertLanguageCodeNor:
                return @"NOR";
            case AWSmediaconvertLanguageCodeNob:
                return @"NOB";
            case AWSmediaconvertLanguageCodeNno:
                return @"NNO";
            case AWSmediaconvertLanguageCodeOci:
                return @"OCI";
            case AWSmediaconvertLanguageCodeOji:
                return @"OJI";
            case AWSmediaconvertLanguageCodeOri:
                return @"ORI";
            case AWSmediaconvertLanguageCodeOrm:
                return @"ORM";
            case AWSmediaconvertLanguageCodeOss:
                return @"OSS";
            case AWSmediaconvertLanguageCodePli:
                return @"PLI";
            case AWSmediaconvertLanguageCodeFas:
                return @"FAS";
            case AWSmediaconvertLanguageCodePol:
                return @"POL";
            case AWSmediaconvertLanguageCodePus:
                return @"PUS";
            case AWSmediaconvertLanguageCodeQue:
                return @"QUE";
            case AWSmediaconvertLanguageCodeQaa:
                return @"QAA";
            case AWSmediaconvertLanguageCodeRon:
                return @"RON";
            case AWSmediaconvertLanguageCodeRoh:
                return @"ROH";
            case AWSmediaconvertLanguageCodeRun:
                return @"RUN";
            case AWSmediaconvertLanguageCodeSmo:
                return @"SMO";
            case AWSmediaconvertLanguageCodeSag:
                return @"SAG";
            case AWSmediaconvertLanguageCodeSan:
                return @"SAN";
            case AWSmediaconvertLanguageCodeSrd:
                return @"SRD";
            case AWSmediaconvertLanguageCodeSrb:
                return @"SRB";
            case AWSmediaconvertLanguageCodeSna:
                return @"SNA";
            case AWSmediaconvertLanguageCodeIii:
                return @"III";
            case AWSmediaconvertLanguageCodeSnd:
                return @"SND";
            case AWSmediaconvertLanguageCodeSin:
                return @"SIN";
            case AWSmediaconvertLanguageCodeSlk:
                return @"SLK";
            case AWSmediaconvertLanguageCodeSlv:
                return @"SLV";
            case AWSmediaconvertLanguageCodeSom:
                return @"SOM";
            case AWSmediaconvertLanguageCodeSot:
                return @"SOT";
            case AWSmediaconvertLanguageCodeSun:
                return @"SUN";
            case AWSmediaconvertLanguageCodeSwa:
                return @"SWA";
            case AWSmediaconvertLanguageCodeSsw:
                return @"SSW";
            case AWSmediaconvertLanguageCodeSwe:
                return @"SWE";
            case AWSmediaconvertLanguageCodeTgl:
                return @"TGL";
            case AWSmediaconvertLanguageCodeTah:
                return @"TAH";
            case AWSmediaconvertLanguageCodeTgk:
                return @"TGK";
            case AWSmediaconvertLanguageCodeTam:
                return @"TAM";
            case AWSmediaconvertLanguageCodeTat:
                return @"TAT";
            case AWSmediaconvertLanguageCodeTel:
                return @"TEL";
            case AWSmediaconvertLanguageCodeTha:
                return @"THA";
            case AWSmediaconvertLanguageCodeBod:
                return @"BOD";
            case AWSmediaconvertLanguageCodeTir:
                return @"TIR";
            case AWSmediaconvertLanguageCodeTon:
                return @"TON";
            case AWSmediaconvertLanguageCodeTso:
                return @"TSO";
            case AWSmediaconvertLanguageCodeTsn:
                return @"TSN";
            case AWSmediaconvertLanguageCodeTur:
                return @"TUR";
            case AWSmediaconvertLanguageCodeTuk:
                return @"TUK";
            case AWSmediaconvertLanguageCodeTwi:
                return @"TWI";
            case AWSmediaconvertLanguageCodeUig:
                return @"UIG";
            case AWSmediaconvertLanguageCodeUkr:
                return @"UKR";
            case AWSmediaconvertLanguageCodeUzb:
                return @"UZB";
            case AWSmediaconvertLanguageCodeVen:
                return @"VEN";
            case AWSmediaconvertLanguageCodeVol:
                return @"VOL";
            case AWSmediaconvertLanguageCodeWln:
                return @"WLN";
            case AWSmediaconvertLanguageCodeCym:
                return @"CYM";
            case AWSmediaconvertLanguageCodeFry:
                return @"FRY";
            case AWSmediaconvertLanguageCodeWol:
                return @"WOL";
            case AWSmediaconvertLanguageCodeXho:
                return @"XHO";
            case AWSmediaconvertLanguageCodeYid:
                return @"YID";
            case AWSmediaconvertLanguageCodeYor:
                return @"YOR";
            case AWSmediaconvertLanguageCodeZha:
                return @"ZHA";
            case AWSmediaconvertLanguageCodeZul:
                return @"ZUL";
            case AWSmediaconvertLanguageCodeOrj:
                return @"ORJ";
            case AWSmediaconvertLanguageCodeQpc:
                return @"QPC";
            case AWSmediaconvertLanguageCodeTng:
                return @"TNG";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertHlsEncryptionSettings

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
            return @(AWSmediaconvertHlsEncryptionTypeAes128);
        }
        if ([value caseInsensitiveCompare:@"SAMPLE_AES"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsEncryptionTypeSampleAes);
        }
        return @(AWSmediaconvertHlsEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsEncryptionTypeAes128:
                return @"AES128";
            case AWSmediaconvertHlsEncryptionTypeSampleAes:
                return @"SAMPLE_AES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)initializationVectorInManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsInitializationVectorInManifestInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsInitializationVectorInManifestExclude);
        }
        return @(AWSmediaconvertHlsInitializationVectorInManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsInitializationVectorInManifestInclude:
                return @"INCLUDE";
            case AWSmediaconvertHlsInitializationVectorInManifestExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offlineEncryptedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsOfflineEncryptedEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsOfflineEncryptedDisabled);
        }
        return @(AWSmediaconvertHlsOfflineEncryptedUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsOfflineEncryptedEnabled:
                return @"ENABLED";
            case AWSmediaconvertHlsOfflineEncryptedDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertSpekeKeyProvider class]];
}

+ (NSValueTransformer *)staticKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertStaticKeyProvider class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SPEKE"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsKeyProviderTypeSpeke);
        }
        if ([value caseInsensitiveCompare:@"STATIC_KEY"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsKeyProviderTypeStaticKey);
        }
        return @(AWSmediaconvertHlsKeyProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsKeyProviderTypeSpeke:
                return @"SPEKE";
            case AWSmediaconvertHlsKeyProviderTypeStaticKey:
                return @"STATIC_KEY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertHlsGroupSettings

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertHlsAdditionalManifest class]];
}

+ (NSValueTransformer *)captionLanguageMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertHlsCaptionLanguageMapping class]];
}

+ (NSValueTransformer *)captionLanguageSettingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsCaptionLanguageSettingInsert);
        }
        if ([value caseInsensitiveCompare:@"OMIT"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsCaptionLanguageSettingOmit);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsCaptionLanguageSettingNone);
        }
        return @(AWSmediaconvertHlsCaptionLanguageSettingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsCaptionLanguageSettingInsert:
                return @"INSERT";
            case AWSmediaconvertHlsCaptionLanguageSettingOmit:
                return @"OMIT";
            case AWSmediaconvertHlsCaptionLanguageSettingNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)clientCacheJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsClientCacheDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsClientCacheEnabled);
        }
        return @(AWSmediaconvertHlsClientCacheUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsClientCacheDisabled:
                return @"DISABLED";
            case AWSmediaconvertHlsClientCacheEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecSpecificationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RFC_6381"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsCodecSpecificationRfc6381);
        }
        if ([value caseInsensitiveCompare:@"RFC_4281"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsCodecSpecificationRfc4281);
        }
        return @(AWSmediaconvertHlsCodecSpecificationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsCodecSpecificationRfc6381:
                return @"RFC_6381";
            case AWSmediaconvertHlsCodecSpecificationRfc4281:
                return @"RFC_4281";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDestinationSettings class]];
}

+ (NSValueTransformer *)directoryStructureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_DIRECTORY"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsDirectoryStructureSingleDirectory);
        }
        if ([value caseInsensitiveCompare:@"SUBDIRECTORY_PER_STREAM"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsDirectoryStructureSubdirectoryPerStream);
        }
        return @(AWSmediaconvertHlsDirectoryStructureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsDirectoryStructureSingleDirectory:
                return @"SINGLE_DIRECTORY";
            case AWSmediaconvertHlsDirectoryStructureSubdirectoryPerStream:
                return @"SUBDIRECTORY_PER_STREAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertHlsEncryptionSettings class]];
}

+ (NSValueTransformer *)manifestCompressionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsManifestCompressionGzip);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsManifestCompressionNone);
        }
        return @(AWSmediaconvertHlsManifestCompressionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsManifestCompressionGzip:
                return @"GZIP";
            case AWSmediaconvertHlsManifestCompressionNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)manifestDurationFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FLOATING_POINT"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsManifestDurationFormatFloatingPoint);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsManifestDurationFormatInteger);
        }
        return @(AWSmediaconvertHlsManifestDurationFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsManifestDurationFormatFloatingPoint:
                return @"FLOATING_POINT";
            case AWSmediaconvertHlsManifestDurationFormatInteger:
                return @"INTEGER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputSelectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MANIFESTS_AND_SEGMENTS"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsOutputSelectionManifestsAndSegments);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTS_ONLY"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsOutputSelectionSegmentsOnly);
        }
        return @(AWSmediaconvertHlsOutputSelectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsOutputSelectionManifestsAndSegments:
                return @"MANIFESTS_AND_SEGMENTS";
            case AWSmediaconvertHlsOutputSelectionSegmentsOnly:
                return @"SEGMENTS_ONLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)programDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsProgramDateTimeInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsProgramDateTimeExclude);
        }
        return @(AWSmediaconvertHlsProgramDateTimeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsProgramDateTimeInclude:
                return @"INCLUDE";
            case AWSmediaconvertHlsProgramDateTimeExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_FILE"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsSegmentControlSingleFile);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTED_FILES"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsSegmentControlSegmentedFiles);
        }
        return @(AWSmediaconvertHlsSegmentControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsSegmentControlSingleFile:
                return @"SINGLE_FILE";
            case AWSmediaconvertHlsSegmentControlSegmentedFiles:
                return @"SEGMENTED_FILES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)streamInfResolutionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsStreamInfResolutionInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsStreamInfResolutionExclude);
        }
        return @(AWSmediaconvertHlsStreamInfResolutionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsStreamInfResolutionInclude:
                return @"INCLUDE";
            case AWSmediaconvertHlsStreamInfResolutionExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataId3FrameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsTimedMetadataId3FrameNone);
        }
        if ([value caseInsensitiveCompare:@"PRIV"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsTimedMetadataId3FramePriv);
        }
        if ([value caseInsensitiveCompare:@"TDRL"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsTimedMetadataId3FrameTdrl);
        }
        return @(AWSmediaconvertHlsTimedMetadataId3FrameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsTimedMetadataId3FrameNone:
                return @"NONE";
            case AWSmediaconvertHlsTimedMetadataId3FramePriv:
                return @"PRIV";
            case AWSmediaconvertHlsTimedMetadataId3FrameTdrl:
                return @"TDRL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertHlsSettings

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
            return @(AWSmediaconvertHlsAudioOnlyContainerAutomatic);
        }
        if ([value caseInsensitiveCompare:@"M2TS"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsAudioOnlyContainerM2ts);
        }
        return @(AWSmediaconvertHlsAudioOnlyContainerUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsAudioOnlyContainerAutomatic:
                return @"AUTOMATIC";
            case AWSmediaconvertHlsAudioOnlyContainerM2ts:
                return @"M2TS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)audioTrackTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsAudioTrackTypeAlternateAudioAutoSelectDefault);
        }
        if ([value caseInsensitiveCompare:@"ALTERNATE_AUDIO_AUTO_SELECT"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsAudioTrackTypeAlternateAudioAutoSelect);
        }
        if ([value caseInsensitiveCompare:@"ALTERNATE_AUDIO_NOT_AUTO_SELECT"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsAudioTrackTypeAlternateAudioNotAutoSelect);
        }
        if ([value caseInsensitiveCompare:@"AUDIO_ONLY_VARIANT_STREAM"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsAudioTrackTypeAudioOnlyVariantStream);
        }
        return @(AWSmediaconvertHlsAudioTrackTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsAudioTrackTypeAlternateAudioAutoSelectDefault:
                return @"ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT";
            case AWSmediaconvertHlsAudioTrackTypeAlternateAudioAutoSelect:
                return @"ALTERNATE_AUDIO_AUTO_SELECT";
            case AWSmediaconvertHlsAudioTrackTypeAlternateAudioNotAutoSelect:
                return @"ALTERNATE_AUDIO_NOT_AUTO_SELECT";
            case AWSmediaconvertHlsAudioTrackTypeAudioOnlyVariantStream:
                return @"AUDIO_ONLY_VARIANT_STREAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)IFrameOnlyManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsIFrameOnlyManifestInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertHlsIFrameOnlyManifestExclude);
        }
        return @(AWSmediaconvertHlsIFrameOnlyManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertHlsIFrameOnlyManifestInclude:
                return @"INCLUDE";
            case AWSmediaconvertHlsIFrameOnlyManifestExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertHopDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"priority" : @"Priority",
             @"queue" : @"Queue",
             @"waitMinutes" : @"WaitMinutes",
             };
}

@end

@implementation AWSmediaconvertId3Insertion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"id3" : @"Id3",
             @"timecode" : @"Timecode",
             };
}

@end

@implementation AWSmediaconvertImageInserter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"insertableImages" : @"InsertableImages",
             };
}

+ (NSValueTransformer *)insertableImagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertInsertableImage class]];
}

@end

@implementation AWSmediaconvertImscDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stylePassthrough" : @"StylePassthrough",
             };
}

+ (NSValueTransformer *)stylePassthroughJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertImscStylePassthroughEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertImscStylePassthroughDisabled);
        }
        return @(AWSmediaconvertImscStylePassthroughUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertImscStylePassthroughEnabled:
                return @"ENABLED";
            case AWSmediaconvertImscStylePassthroughDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertInput

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
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSmediaconvertAudioSelectorGroup class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)audioSelectorsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSmediaconvertAudioSelector class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)captionSelectorsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSmediaconvertCaptionSelector class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)cropJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertRectangle class]];
}

+ (NSValueTransformer *)deblockFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertInputDeblockFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertInputDeblockFilterDisabled);
        }
        return @(AWSmediaconvertInputDeblockFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertInputDeblockFilterEnabled:
                return @"ENABLED";
            case AWSmediaconvertInputDeblockFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)decryptionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertInputDecryptionSettings class]];
}

+ (NSValueTransformer *)denoiseFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertInputDenoiseFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertInputDenoiseFilterDisabled);
        }
        return @(AWSmediaconvertInputDenoiseFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertInputDenoiseFilterEnabled:
                return @"ENABLED";
            case AWSmediaconvertInputDenoiseFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)filterEnableJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmediaconvertInputFilterEnableAuto);
        }
        if ([value caseInsensitiveCompare:@"DISABLE"] == NSOrderedSame) {
            return @(AWSmediaconvertInputFilterEnableDisable);
        }
        if ([value caseInsensitiveCompare:@"FORCE"] == NSOrderedSame) {
            return @(AWSmediaconvertInputFilterEnableForce);
        }
        return @(AWSmediaconvertInputFilterEnableUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertInputFilterEnableAuto:
                return @"AUTO";
            case AWSmediaconvertInputFilterEnableDisable:
                return @"DISABLE";
            case AWSmediaconvertInputFilterEnableForce:
                return @"FORCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)imageInserterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertImageInserter class]];
}

+ (NSValueTransformer *)inputClippingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertInputClipping class]];
}

+ (NSValueTransformer *)positionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertRectangle class]];
}

+ (NSValueTransformer *)psiControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IGNORE_PSI"] == NSOrderedSame) {
            return @(AWSmediaconvertInputPsiControlIgnorePsi);
        }
        if ([value caseInsensitiveCompare:@"USE_PSI"] == NSOrderedSame) {
            return @(AWSmediaconvertInputPsiControlUsePsi);
        }
        return @(AWSmediaconvertInputPsiControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertInputPsiControlIgnorePsi:
                return @"IGNORE_PSI";
            case AWSmediaconvertInputPsiControlUsePsi:
                return @"USE_PSI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timecodeSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMBEDDED"] == NSOrderedSame) {
            return @(AWSmediaconvertInputTimecodeSourceEmbedded);
        }
        if ([value caseInsensitiveCompare:@"ZEROBASED"] == NSOrderedSame) {
            return @(AWSmediaconvertInputTimecodeSourceZerobased);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIEDSTART"] == NSOrderedSame) {
            return @(AWSmediaconvertInputTimecodeSourceSpecifiedstart);
        }
        return @(AWSmediaconvertInputTimecodeSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertInputTimecodeSourceEmbedded:
                return @"EMBEDDED";
            case AWSmediaconvertInputTimecodeSourceZerobased:
                return @"ZEROBASED";
            case AWSmediaconvertInputTimecodeSourceSpecifiedstart:
                return @"SPECIFIEDSTART";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)videoSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertVideoSelector class]];
}

@end

@implementation AWSmediaconvertInputClipping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTimecode" : @"EndTimecode",
             @"startTimecode" : @"StartTimecode",
             };
}

@end

@implementation AWSmediaconvertInputDecryptionSettings

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
            return @(AWSmediaconvertDecryptionModeAesCtr);
        }
        if ([value caseInsensitiveCompare:@"AES_CBC"] == NSOrderedSame) {
            return @(AWSmediaconvertDecryptionModeAesCbc);
        }
        if ([value caseInsensitiveCompare:@"AES_GCM"] == NSOrderedSame) {
            return @(AWSmediaconvertDecryptionModeAesGcm);
        }
        return @(AWSmediaconvertDecryptionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDecryptionModeAesCtr:
                return @"AES_CTR";
            case AWSmediaconvertDecryptionModeAesCbc:
                return @"AES_CBC";
            case AWSmediaconvertDecryptionModeAesGcm:
                return @"AES_GCM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertInputTemplate

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
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSmediaconvertAudioSelectorGroup class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)audioSelectorsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSmediaconvertAudioSelector class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)captionSelectorsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSmediaconvertCaptionSelector class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)cropJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertRectangle class]];
}

+ (NSValueTransformer *)deblockFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertInputDeblockFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertInputDeblockFilterDisabled);
        }
        return @(AWSmediaconvertInputDeblockFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertInputDeblockFilterEnabled:
                return @"ENABLED";
            case AWSmediaconvertInputDeblockFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)denoiseFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertInputDenoiseFilterEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertInputDenoiseFilterDisabled);
        }
        return @(AWSmediaconvertInputDenoiseFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertInputDenoiseFilterEnabled:
                return @"ENABLED";
            case AWSmediaconvertInputDenoiseFilterDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)filterEnableJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmediaconvertInputFilterEnableAuto);
        }
        if ([value caseInsensitiveCompare:@"DISABLE"] == NSOrderedSame) {
            return @(AWSmediaconvertInputFilterEnableDisable);
        }
        if ([value caseInsensitiveCompare:@"FORCE"] == NSOrderedSame) {
            return @(AWSmediaconvertInputFilterEnableForce);
        }
        return @(AWSmediaconvertInputFilterEnableUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertInputFilterEnableAuto:
                return @"AUTO";
            case AWSmediaconvertInputFilterEnableDisable:
                return @"DISABLE";
            case AWSmediaconvertInputFilterEnableForce:
                return @"FORCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)imageInserterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertImageInserter class]];
}

+ (NSValueTransformer *)inputClippingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertInputClipping class]];
}

+ (NSValueTransformer *)positionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertRectangle class]];
}

+ (NSValueTransformer *)psiControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IGNORE_PSI"] == NSOrderedSame) {
            return @(AWSmediaconvertInputPsiControlIgnorePsi);
        }
        if ([value caseInsensitiveCompare:@"USE_PSI"] == NSOrderedSame) {
            return @(AWSmediaconvertInputPsiControlUsePsi);
        }
        return @(AWSmediaconvertInputPsiControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertInputPsiControlIgnorePsi:
                return @"IGNORE_PSI";
            case AWSmediaconvertInputPsiControlUsePsi:
                return @"USE_PSI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timecodeSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMBEDDED"] == NSOrderedSame) {
            return @(AWSmediaconvertInputTimecodeSourceEmbedded);
        }
        if ([value caseInsensitiveCompare:@"ZEROBASED"] == NSOrderedSame) {
            return @(AWSmediaconvertInputTimecodeSourceZerobased);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIEDSTART"] == NSOrderedSame) {
            return @(AWSmediaconvertInputTimecodeSourceSpecifiedstart);
        }
        return @(AWSmediaconvertInputTimecodeSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertInputTimecodeSourceEmbedded:
                return @"EMBEDDED";
            case AWSmediaconvertInputTimecodeSourceZerobased:
                return @"ZEROBASED";
            case AWSmediaconvertInputTimecodeSourceSpecifiedstart:
                return @"SPECIFIEDSTART";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)videoSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertVideoSelector class]];
}

@end

@implementation AWSmediaconvertInsertableImage

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

@implementation AWSmediaconvertJob

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAccelerationSettings class]];
}

+ (NSValueTransformer *)accelerationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_APPLICABLE"] == NSOrderedSame) {
            return @(AWSmediaconvertAccelerationStatusNotApplicable);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSmediaconvertAccelerationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"ACCELERATED"] == NSOrderedSame) {
            return @(AWSmediaconvertAccelerationStatusAccelerated);
        }
        if ([value caseInsensitiveCompare:@"NOT_ACCELERATED"] == NSOrderedSame) {
            return @(AWSmediaconvertAccelerationStatusNotAccelerated);
        }
        return @(AWSmediaconvertAccelerationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAccelerationStatusNotApplicable:
                return @"NOT_APPLICABLE";
            case AWSmediaconvertAccelerationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSmediaconvertAccelerationStatusAccelerated:
                return @"ACCELERATED";
            case AWSmediaconvertAccelerationStatusNotAccelerated:
                return @"NOT_ACCELERATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)billingTagsSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUE"] == NSOrderedSame) {
            return @(AWSmediaconvertBillingTagsSourceQueue);
        }
        if ([value caseInsensitiveCompare:@"PRESET"] == NSOrderedSame) {
            return @(AWSmediaconvertBillingTagsSourcePreset);
        }
        if ([value caseInsensitiveCompare:@"JOB_TEMPLATE"] == NSOrderedSame) {
            return @(AWSmediaconvertBillingTagsSourceJobTemplate);
        }
        if ([value caseInsensitiveCompare:@"JOB"] == NSOrderedSame) {
            return @(AWSmediaconvertBillingTagsSourceJob);
        }
        return @(AWSmediaconvertBillingTagsSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertBillingTagsSourceQueue:
                return @"QUEUE";
            case AWSmediaconvertBillingTagsSourcePreset:
                return @"PRESET";
            case AWSmediaconvertBillingTagsSourceJobTemplate:
                return @"JOB_TEMPLATE";
            case AWSmediaconvertBillingTagsSourceJob:
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
            return @(AWSmediaconvertJobPhaseProbing);
        }
        if ([value caseInsensitiveCompare:@"TRANSCODING"] == NSOrderedSame) {
            return @(AWSmediaconvertJobPhaseTranscoding);
        }
        if ([value caseInsensitiveCompare:@"UPLOADING"] == NSOrderedSame) {
            return @(AWSmediaconvertJobPhaseUploading);
        }
        return @(AWSmediaconvertJobPhaseUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertJobPhaseProbing:
                return @"PROBING";
            case AWSmediaconvertJobPhaseTranscoding:
                return @"TRANSCODING";
            case AWSmediaconvertJobPhaseUploading:
                return @"UPLOADING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hopDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertHopDestination class]];
}

+ (NSValueTransformer *)messagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertJobMessages class]];
}

+ (NSValueTransformer *)outputGroupDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertOutputGroupDetail class]];
}

+ (NSValueTransformer *)queueTransitionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertQueueTransition class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertJobSettings class]];
}

+ (NSValueTransformer *)simulateReservedQueueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertSimulateReservedQueueDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertSimulateReservedQueueEnabled);
        }
        return @(AWSmediaconvertSimulateReservedQueueUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertSimulateReservedQueueDisabled:
                return @"DISABLED";
            case AWSmediaconvertSimulateReservedQueueEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSmediaconvertJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"PROGRESSING"] == NSOrderedSame) {
            return @(AWSmediaconvertJobStatusProgressing);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSmediaconvertJobStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSmediaconvertJobStatusCanceled);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSmediaconvertJobStatusError);
        }
        return @(AWSmediaconvertJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSmediaconvertJobStatusProgressing:
                return @"PROGRESSING";
            case AWSmediaconvertJobStatusComplete:
                return @"COMPLETE";
            case AWSmediaconvertJobStatusCanceled:
                return @"CANCELED";
            case AWSmediaconvertJobStatusError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusUpdateIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECONDS_10"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds10);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_12"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds12);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_15"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds15);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_20"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds20);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_30"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds30);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_60"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds60);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_120"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds120);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_180"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds180);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_240"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds240);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_300"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds300);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_360"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds360);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_420"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds420);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_480"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds480);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_540"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds540);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_600"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds600);
        }
        return @(AWSmediaconvertStatusUpdateIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertStatusUpdateIntervalSeconds10:
                return @"SECONDS_10";
            case AWSmediaconvertStatusUpdateIntervalSeconds12:
                return @"SECONDS_12";
            case AWSmediaconvertStatusUpdateIntervalSeconds15:
                return @"SECONDS_15";
            case AWSmediaconvertStatusUpdateIntervalSeconds20:
                return @"SECONDS_20";
            case AWSmediaconvertStatusUpdateIntervalSeconds30:
                return @"SECONDS_30";
            case AWSmediaconvertStatusUpdateIntervalSeconds60:
                return @"SECONDS_60";
            case AWSmediaconvertStatusUpdateIntervalSeconds120:
                return @"SECONDS_120";
            case AWSmediaconvertStatusUpdateIntervalSeconds180:
                return @"SECONDS_180";
            case AWSmediaconvertStatusUpdateIntervalSeconds240:
                return @"SECONDS_240";
            case AWSmediaconvertStatusUpdateIntervalSeconds300:
                return @"SECONDS_300";
            case AWSmediaconvertStatusUpdateIntervalSeconds360:
                return @"SECONDS_360";
            case AWSmediaconvertStatusUpdateIntervalSeconds420:
                return @"SECONDS_420";
            case AWSmediaconvertStatusUpdateIntervalSeconds480:
                return @"SECONDS_480";
            case AWSmediaconvertStatusUpdateIntervalSeconds540:
                return @"SECONDS_540";
            case AWSmediaconvertStatusUpdateIntervalSeconds600:
                return @"SECONDS_600";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertTiming class]];
}

@end

@implementation AWSmediaconvertJobMessages

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"info" : @"Info",
             @"warning" : @"Warning",
             };
}

@end

@implementation AWSmediaconvertJobSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAvailBlanking class]];
}

+ (NSValueTransformer *)esamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertEsamSettings class]];
}

+ (NSValueTransformer *)inputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertInput class]];
}

+ (NSValueTransformer *)motionImageInserterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertMotionImageInserter class]];
}

+ (NSValueTransformer *)nielsenConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertNielsenConfiguration class]];
}

+ (NSValueTransformer *)outputGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertOutputGroup class]];
}

+ (NSValueTransformer *)timecodeConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertTimecodeConfig class]];
}

+ (NSValueTransformer *)timedMetadataInsertionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertTimedMetadataInsertion class]];
}

@end

@implementation AWSmediaconvertJobTemplate

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAccelerationSettings class]];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)hopDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertHopDestination class]];
}

+ (NSValueTransformer *)lastUpdatedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertJobTemplateSettings class]];
}

+ (NSValueTransformer *)statusUpdateIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECONDS_10"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds10);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_12"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds12);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_15"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds15);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_20"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds20);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_30"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds30);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_60"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds60);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_120"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds120);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_180"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds180);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_240"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds240);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_300"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds300);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_360"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds360);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_420"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds420);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_480"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds480);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_540"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds540);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_600"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds600);
        }
        return @(AWSmediaconvertStatusUpdateIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertStatusUpdateIntervalSeconds10:
                return @"SECONDS_10";
            case AWSmediaconvertStatusUpdateIntervalSeconds12:
                return @"SECONDS_12";
            case AWSmediaconvertStatusUpdateIntervalSeconds15:
                return @"SECONDS_15";
            case AWSmediaconvertStatusUpdateIntervalSeconds20:
                return @"SECONDS_20";
            case AWSmediaconvertStatusUpdateIntervalSeconds30:
                return @"SECONDS_30";
            case AWSmediaconvertStatusUpdateIntervalSeconds60:
                return @"SECONDS_60";
            case AWSmediaconvertStatusUpdateIntervalSeconds120:
                return @"SECONDS_120";
            case AWSmediaconvertStatusUpdateIntervalSeconds180:
                return @"SECONDS_180";
            case AWSmediaconvertStatusUpdateIntervalSeconds240:
                return @"SECONDS_240";
            case AWSmediaconvertStatusUpdateIntervalSeconds300:
                return @"SECONDS_300";
            case AWSmediaconvertStatusUpdateIntervalSeconds360:
                return @"SECONDS_360";
            case AWSmediaconvertStatusUpdateIntervalSeconds420:
                return @"SECONDS_420";
            case AWSmediaconvertStatusUpdateIntervalSeconds480:
                return @"SECONDS_480";
            case AWSmediaconvertStatusUpdateIntervalSeconds540:
                return @"SECONDS_540";
            case AWSmediaconvertStatusUpdateIntervalSeconds600:
                return @"SECONDS_600";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSmediaconvertTypesSystem);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSmediaconvertTypesCustom);
        }
        return @(AWSmediaconvertTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertTypesSystem:
                return @"SYSTEM";
            case AWSmediaconvertTypesCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertJobTemplateSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAvailBlanking class]];
}

+ (NSValueTransformer *)esamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertEsamSettings class]];
}

+ (NSValueTransformer *)inputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertInputTemplate class]];
}

+ (NSValueTransformer *)motionImageInserterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertMotionImageInserter class]];
}

+ (NSValueTransformer *)nielsenConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertNielsenConfiguration class]];
}

+ (NSValueTransformer *)outputGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertOutputGroup class]];
}

+ (NSValueTransformer *)timecodeConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertTimecodeConfig class]];
}

+ (NSValueTransformer *)timedMetadataInsertionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertTimedMetadataInsertion class]];
}

@end

@implementation AWSmediaconvertListJobTemplatesRequest

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
            return @(AWSmediaconvertJobTemplateListByName);
        }
        if ([value caseInsensitiveCompare:@"CREATION_DATE"] == NSOrderedSame) {
            return @(AWSmediaconvertJobTemplateListByCreationDate);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSmediaconvertJobTemplateListBySystem);
        }
        return @(AWSmediaconvertJobTemplateListByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertJobTemplateListByName:
                return @"NAME";
            case AWSmediaconvertJobTemplateListByCreationDate:
                return @"CREATION_DATE";
            case AWSmediaconvertJobTemplateListBySystem:
                return @"SYSTEM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)orderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSmediaconvertOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSmediaconvertOrderDescending);
        }
        return @(AWSmediaconvertOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertOrderAscending:
                return @"ASCENDING";
            case AWSmediaconvertOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertListJobTemplatesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobTemplates" : @"JobTemplates",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobTemplatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertJobTemplate class]];
}

@end

@implementation AWSmediaconvertListJobsRequest

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
            return @(AWSmediaconvertOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSmediaconvertOrderDescending);
        }
        return @(AWSmediaconvertOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertOrderAscending:
                return @"ASCENDING";
            case AWSmediaconvertOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSmediaconvertJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"PROGRESSING"] == NSOrderedSame) {
            return @(AWSmediaconvertJobStatusProgressing);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSmediaconvertJobStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSmediaconvertJobStatusCanceled);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSmediaconvertJobStatusError);
        }
        return @(AWSmediaconvertJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSmediaconvertJobStatusProgressing:
                return @"PROGRESSING";
            case AWSmediaconvertJobStatusComplete:
                return @"COMPLETE";
            case AWSmediaconvertJobStatusCanceled:
                return @"CANCELED";
            case AWSmediaconvertJobStatusError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertListJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobs" : @"Jobs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertJob class]];
}

@end

@implementation AWSmediaconvertListPresetsRequest

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
            return @(AWSmediaconvertPresetListByName);
        }
        if ([value caseInsensitiveCompare:@"CREATION_DATE"] == NSOrderedSame) {
            return @(AWSmediaconvertPresetListByCreationDate);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSmediaconvertPresetListBySystem);
        }
        return @(AWSmediaconvertPresetListByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertPresetListByName:
                return @"NAME";
            case AWSmediaconvertPresetListByCreationDate:
                return @"CREATION_DATE";
            case AWSmediaconvertPresetListBySystem:
                return @"SYSTEM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)orderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSmediaconvertOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSmediaconvertOrderDescending);
        }
        return @(AWSmediaconvertOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertOrderAscending:
                return @"ASCENDING";
            case AWSmediaconvertOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertListPresetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"presets" : @"Presets",
             };
}

+ (NSValueTransformer *)presetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertPreset class]];
}

@end

@implementation AWSmediaconvertListQueuesRequest

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
            return @(AWSmediaconvertQueueListByName);
        }
        if ([value caseInsensitiveCompare:@"CREATION_DATE"] == NSOrderedSame) {
            return @(AWSmediaconvertQueueListByCreationDate);
        }
        return @(AWSmediaconvertQueueListByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertQueueListByName:
                return @"NAME";
            case AWSmediaconvertQueueListByCreationDate:
                return @"CREATION_DATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)orderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSmediaconvertOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSmediaconvertOrderDescending);
        }
        return @(AWSmediaconvertOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertOrderAscending:
                return @"ASCENDING";
            case AWSmediaconvertOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertListQueuesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"queues" : @"Queues",
             };
}

+ (NSValueTransformer *)queuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertQueue class]];
}

@end

@implementation AWSmediaconvertListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             };
}

@end

@implementation AWSmediaconvertListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceTags" : @"ResourceTags",
             };
}

+ (NSValueTransformer *)resourceTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertResourceTags class]];
}

@end

@implementation AWSmediaconvertM2tsScte35Esam

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scte35EsamPid" : @"Scte35EsamPid",
             };
}

@end

@implementation AWSmediaconvertM2tsSettings

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
            return @(AWSmediaconvertM2tsAudioBufferModelDvb);
        }
        if ([value caseInsensitiveCompare:@"ATSC"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsAudioBufferModelAtsc);
        }
        return @(AWSmediaconvertM2tsAudioBufferModelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM2tsAudioBufferModelDvb:
                return @"DVB";
            case AWSmediaconvertM2tsAudioBufferModelAtsc:
                return @"ATSC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bufferModelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MULTIPLEX"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsBufferModelMultiplex);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsBufferModelNone);
        }
        return @(AWSmediaconvertM2tsBufferModelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM2tsBufferModelMultiplex:
                return @"MULTIPLEX";
            case AWSmediaconvertM2tsBufferModelNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dvbNitSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDvbNitSettings class]];
}

+ (NSValueTransformer *)dvbSdtSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDvbSdtSettings class]];
}

+ (NSValueTransformer *)dvbTdtSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDvbTdtSettings class]];
}

+ (NSValueTransformer *)ebpAudioIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VIDEO_AND_FIXED_INTERVALS"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsEbpAudioIntervalVideoAndFixedIntervals);
        }
        if ([value caseInsensitiveCompare:@"VIDEO_INTERVAL"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsEbpAudioIntervalVideoInterval);
        }
        return @(AWSmediaconvertM2tsEbpAudioIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM2tsEbpAudioIntervalVideoAndFixedIntervals:
                return @"VIDEO_AND_FIXED_INTERVALS";
            case AWSmediaconvertM2tsEbpAudioIntervalVideoInterval:
                return @"VIDEO_INTERVAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ebpPlacementJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VIDEO_AND_AUDIO_PIDS"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsEbpPlacementVideoAndAudioPids);
        }
        if ([value caseInsensitiveCompare:@"VIDEO_PID"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsEbpPlacementVideoPid);
        }
        return @(AWSmediaconvertM2tsEbpPlacementUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM2tsEbpPlacementVideoAndAudioPids:
                return @"VIDEO_AND_AUDIO_PIDS";
            case AWSmediaconvertM2tsEbpPlacementVideoPid:
                return @"VIDEO_PID";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)esRateInPesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsEsRateInPesInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsEsRateInPesExclude);
        }
        return @(AWSmediaconvertM2tsEsRateInPesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM2tsEsRateInPesInclude:
                return @"INCLUDE";
            case AWSmediaconvertM2tsEsRateInPesExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)forceTsVideoEbpOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FORCE"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsForceTsVideoEbpOrderForce);
        }
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsForceTsVideoEbpOrderDefault);
        }
        return @(AWSmediaconvertM2tsForceTsVideoEbpOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM2tsForceTsVideoEbpOrderForce:
                return @"FORCE";
            case AWSmediaconvertM2tsForceTsVideoEbpOrderDefault:
                return @"DEFAULT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nielsenId3JSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsNielsenId3Insert);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsNielsenId3None);
        }
        return @(AWSmediaconvertM2tsNielsenId3Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM2tsNielsenId3Insert:
                return @"INSERT";
            case AWSmediaconvertM2tsNielsenId3None:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pcrControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PCR_EVERY_PES_PACKET"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsPcrControlPcrEveryPesPacket);
        }
        if ([value caseInsensitiveCompare:@"CONFIGURED_PCR_PERIOD"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsPcrControlConfiguredPcrPeriod);
        }
        return @(AWSmediaconvertM2tsPcrControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM2tsPcrControlPcrEveryPesPacket:
                return @"PCR_EVERY_PES_PACKET";
            case AWSmediaconvertM2tsPcrControlConfiguredPcrPeriod:
                return @"CONFIGURED_PCR_PERIOD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsRateModeVbr);
        }
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsRateModeCbr);
        }
        return @(AWSmediaconvertM2tsRateModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM2tsRateModeVbr:
                return @"VBR";
            case AWSmediaconvertM2tsRateModeCbr:
                return @"CBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35EsamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertM2tsScte35Esam class]];
}

+ (NSValueTransformer *)scte35SourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsScte35SourcePassthrough);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsScte35SourceNone);
        }
        return @(AWSmediaconvertM2tsScte35SourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM2tsScte35SourcePassthrough:
                return @"PASSTHROUGH";
            case AWSmediaconvertM2tsScte35SourceNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentationMarkersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsSegmentationMarkersNone);
        }
        if ([value caseInsensitiveCompare:@"RAI_SEGSTART"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsSegmentationMarkersRaiSegstart);
        }
        if ([value caseInsensitiveCompare:@"RAI_ADAPT"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsSegmentationMarkersRaiAdapt);
        }
        if ([value caseInsensitiveCompare:@"PSI_SEGSTART"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsSegmentationMarkersPsiSegstart);
        }
        if ([value caseInsensitiveCompare:@"EBP"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsSegmentationMarkersEbp);
        }
        if ([value caseInsensitiveCompare:@"EBP_LEGACY"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsSegmentationMarkersEbpLegacy);
        }
        return @(AWSmediaconvertM2tsSegmentationMarkersUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM2tsSegmentationMarkersNone:
                return @"NONE";
            case AWSmediaconvertM2tsSegmentationMarkersRaiSegstart:
                return @"RAI_SEGSTART";
            case AWSmediaconvertM2tsSegmentationMarkersRaiAdapt:
                return @"RAI_ADAPT";
            case AWSmediaconvertM2tsSegmentationMarkersPsiSegstart:
                return @"PSI_SEGSTART";
            case AWSmediaconvertM2tsSegmentationMarkersEbp:
                return @"EBP";
            case AWSmediaconvertM2tsSegmentationMarkersEbpLegacy:
                return @"EBP_LEGACY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentationStyleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAINTAIN_CADENCE"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsSegmentationStyleMaintainCadence);
        }
        if ([value caseInsensitiveCompare:@"RESET_CADENCE"] == NSOrderedSame) {
            return @(AWSmediaconvertM2tsSegmentationStyleResetCadence);
        }
        return @(AWSmediaconvertM2tsSegmentationStyleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM2tsSegmentationStyleMaintainCadence:
                return @"MAINTAIN_CADENCE";
            case AWSmediaconvertM2tsSegmentationStyleResetCadence:
                return @"RESET_CADENCE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertM3u8Settings

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
            return @(AWSmediaconvertM3u8NielsenId3Insert);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertM3u8NielsenId3None);
        }
        return @(AWSmediaconvertM3u8NielsenId3Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM3u8NielsenId3Insert:
                return @"INSERT";
            case AWSmediaconvertM3u8NielsenId3None:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pcrControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PCR_EVERY_PES_PACKET"] == NSOrderedSame) {
            return @(AWSmediaconvertM3u8PcrControlPcrEveryPesPacket);
        }
        if ([value caseInsensitiveCompare:@"CONFIGURED_PCR_PERIOD"] == NSOrderedSame) {
            return @(AWSmediaconvertM3u8PcrControlConfiguredPcrPeriod);
        }
        return @(AWSmediaconvertM3u8PcrControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM3u8PcrControlPcrEveryPesPacket:
                return @"PCR_EVERY_PES_PACKET";
            case AWSmediaconvertM3u8PcrControlConfiguredPcrPeriod:
                return @"CONFIGURED_PCR_PERIOD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35SourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmediaconvertM3u8Scte35SourcePassthrough);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertM3u8Scte35SourceNone);
        }
        return @(AWSmediaconvertM3u8Scte35SourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertM3u8Scte35SourcePassthrough:
                return @"PASSTHROUGH";
            case AWSmediaconvertM3u8Scte35SourceNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmediaconvertTimedMetadataPassthrough);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertTimedMetadataNone);
        }
        return @(AWSmediaconvertTimedMetadataUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertTimedMetadataPassthrough:
                return @"PASSTHROUGH";
            case AWSmediaconvertTimedMetadataNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertMotionImageInserter

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertMotionImageInsertionFramerate class]];
}

+ (NSValueTransformer *)insertionModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MOV"] == NSOrderedSame) {
            return @(AWSmediaconvertMotionImageInsertionModeMov);
        }
        if ([value caseInsensitiveCompare:@"PNG"] == NSOrderedSame) {
            return @(AWSmediaconvertMotionImageInsertionModePng);
        }
        return @(AWSmediaconvertMotionImageInsertionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMotionImageInsertionModeMov:
                return @"MOV";
            case AWSmediaconvertMotionImageInsertionModePng:
                return @"PNG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offsetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertMotionImageInsertionOffset class]];
}

+ (NSValueTransformer *)playbackJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONCE"] == NSOrderedSame) {
            return @(AWSmediaconvertMotionImagePlaybackOnce);
        }
        if ([value caseInsensitiveCompare:@"REPEAT"] == NSOrderedSame) {
            return @(AWSmediaconvertMotionImagePlaybackRepeat);
        }
        return @(AWSmediaconvertMotionImagePlaybackUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMotionImagePlaybackOnce:
                return @"ONCE";
            case AWSmediaconvertMotionImagePlaybackRepeat:
                return @"REPEAT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertMotionImageInsertionFramerate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             };
}

@end

@implementation AWSmediaconvertMotionImageInsertionOffset

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageX" : @"ImageX",
             @"imageY" : @"ImageY",
             };
}

@end

@implementation AWSmediaconvertMovSettings

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
            return @(AWSmediaconvertMovClapAtomInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertMovClapAtomExclude);
        }
        return @(AWSmediaconvertMovClapAtomUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMovClapAtomInclude:
                return @"INCLUDE";
            case AWSmediaconvertMovClapAtomExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)cslgAtomJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertMovCslgAtomInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertMovCslgAtomExclude);
        }
        return @(AWSmediaconvertMovCslgAtomUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMovCslgAtomInclude:
                return @"INCLUDE";
            case AWSmediaconvertMovCslgAtomExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mpeg2FourCCControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"XDCAM"] == NSOrderedSame) {
            return @(AWSmediaconvertMovMpeg2FourCCControlXdcam);
        }
        if ([value caseInsensitiveCompare:@"MPEG"] == NSOrderedSame) {
            return @(AWSmediaconvertMovMpeg2FourCCControlMpeg);
        }
        return @(AWSmediaconvertMovMpeg2FourCCControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMovMpeg2FourCCControlXdcam:
                return @"XDCAM";
            case AWSmediaconvertMovMpeg2FourCCControlMpeg:
                return @"MPEG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)paddingControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OMNEON"] == NSOrderedSame) {
            return @(AWSmediaconvertMovPaddingControlOmneon);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertMovPaddingControlNone);
        }
        return @(AWSmediaconvertMovPaddingControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMovPaddingControlOmneon:
                return @"OMNEON";
            case AWSmediaconvertMovPaddingControlNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)referenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SELF_CONTAINED"] == NSOrderedSame) {
            return @(AWSmediaconvertMovReferenceSelfContained);
        }
        if ([value caseInsensitiveCompare:@"EXTERNAL"] == NSOrderedSame) {
            return @(AWSmediaconvertMovReferenceExternal);
        }
        return @(AWSmediaconvertMovReferenceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMovReferenceSelfContained:
                return @"SELF_CONTAINED";
            case AWSmediaconvertMovReferenceExternal:
                return @"EXTERNAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertMp2Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitrate" : @"Bitrate",
             @"channels" : @"Channels",
             @"sampleRate" : @"SampleRate",
             };
}

@end

@implementation AWSmediaconvertMp3Settings

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
            return @(AWSmediaconvertMp3RateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSmediaconvertMp3RateControlModeVbr);
        }
        return @(AWSmediaconvertMp3RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMp3RateControlModeCbr:
                return @"CBR";
            case AWSmediaconvertMp3RateControlModeVbr:
                return @"VBR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertMp4Settings

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
            return @(AWSmediaconvertMp4CslgAtomInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertMp4CslgAtomExclude);
        }
        return @(AWSmediaconvertMp4CslgAtomUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMp4CslgAtomInclude:
                return @"INCLUDE";
            case AWSmediaconvertMp4CslgAtomExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)freeSpaceBoxJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertMp4FreeSpaceBoxInclude);
        }
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmediaconvertMp4FreeSpaceBoxExclude);
        }
        return @(AWSmediaconvertMp4FreeSpaceBoxUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMp4FreeSpaceBoxInclude:
                return @"INCLUDE";
            case AWSmediaconvertMp4FreeSpaceBoxExclude:
                return @"EXCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)moovPlacementJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE_DOWNLOAD"] == NSOrderedSame) {
            return @(AWSmediaconvertMp4MoovPlacementProgressiveDownload);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSmediaconvertMp4MoovPlacementNormal);
        }
        return @(AWSmediaconvertMp4MoovPlacementUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMp4MoovPlacementProgressiveDownload:
                return @"PROGRESSIVE_DOWNLOAD";
            case AWSmediaconvertMp4MoovPlacementNormal:
                return @"NORMAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertMpdSettings

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
            return @(AWSmediaconvertMpdCaptionContainerTypeRAW);
        }
        if ([value caseInsensitiveCompare:@"FRAGMENTED_MP4"] == NSOrderedSame) {
            return @(AWSmediaconvertMpdCaptionContainerTypeFragmentedMp4);
        }
        return @(AWSmediaconvertMpdCaptionContainerTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpdCaptionContainerTypeRAW:
                return @"RAW";
            case AWSmediaconvertMpdCaptionContainerTypeFragmentedMp4:
                return @"FRAGMENTED_MP4";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35EsamJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSmediaconvertMpdScte35EsamInsert);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertMpdScte35EsamNone);
        }
        return @(AWSmediaconvertMpdScte35EsamUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpdScte35EsamInsert:
                return @"INSERT";
            case AWSmediaconvertMpdScte35EsamNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35SourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmediaconvertMpdScte35SourcePassthrough);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertMpdScte35SourceNone);
        }
        return @(AWSmediaconvertMpdScte35SourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpdScte35SourcePassthrough:
                return @"PASSTHROUGH";
            case AWSmediaconvertMpdScte35SourceNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertMpeg2Settings

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
            return @(AWSmediaconvertMpeg2AdaptiveQuantizationOff);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2AdaptiveQuantizationLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2AdaptiveQuantizationMedium);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2AdaptiveQuantizationHigh);
        }
        return @(AWSmediaconvertMpeg2AdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2AdaptiveQuantizationOff:
                return @"OFF";
            case AWSmediaconvertMpeg2AdaptiveQuantizationLow:
                return @"LOW";
            case AWSmediaconvertMpeg2AdaptiveQuantizationMedium:
                return @"MEDIUM";
            case AWSmediaconvertMpeg2AdaptiveQuantizationHigh:
                return @"HIGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2CodecLevelAuto);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2CodecLevelLow);
        }
        if ([value caseInsensitiveCompare:@"MAIN"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2CodecLevelMain);
        }
        if ([value caseInsensitiveCompare:@"HIGH1440"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2CodecLevelHigh1440);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2CodecLevelHigh);
        }
        return @(AWSmediaconvertMpeg2CodecLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2CodecLevelAuto:
                return @"AUTO";
            case AWSmediaconvertMpeg2CodecLevelLow:
                return @"LOW";
            case AWSmediaconvertMpeg2CodecLevelMain:
                return @"MAIN";
            case AWSmediaconvertMpeg2CodecLevelHigh1440:
                return @"HIGH1440";
            case AWSmediaconvertMpeg2CodecLevelHigh:
                return @"HIGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAIN"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2CodecProfileMain);
        }
        if ([value caseInsensitiveCompare:@"PROFILE_422"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2CodecProfileProfile422);
        }
        return @(AWSmediaconvertMpeg2CodecProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2CodecProfileMain:
                return @"MAIN";
            case AWSmediaconvertMpeg2CodecProfileProfile422:
                return @"PROFILE_422";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dynamicSubGopJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADAPTIVE"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2DynamicSubGopAdaptive);
        }
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2DynamicSubGopStatic);
        }
        return @(AWSmediaconvertMpeg2DynamicSubGopUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2DynamicSubGopAdaptive:
                return @"ADAPTIVE";
            case AWSmediaconvertMpeg2DynamicSubGopStatic:
                return @"STATIC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2FramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2FramerateControlSpecified);
        }
        return @(AWSmediaconvertMpeg2FramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2FramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSmediaconvertMpeg2FramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateConversionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUPLICATE_DROP"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2FramerateConversionAlgorithmDuplicateDrop);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2FramerateConversionAlgorithmInterpolate);
        }
        return @(AWSmediaconvertMpeg2FramerateConversionAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2FramerateConversionAlgorithmDuplicateDrop:
                return @"DUPLICATE_DROP";
            case AWSmediaconvertMpeg2FramerateConversionAlgorithmInterpolate:
                return @"INTERPOLATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopSizeUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAMES"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2GopSizeUnitsFrames);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2GopSizeUnitsSeconds);
        }
        return @(AWSmediaconvertMpeg2GopSizeUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2GopSizeUnitsFrames:
                return @"FRAMES";
            case AWSmediaconvertMpeg2GopSizeUnitsSeconds:
                return @"SECONDS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)interlaceModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2InterlaceModeProgressive);
        }
        if ([value caseInsensitiveCompare:@"TOP_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2InterlaceModeTopField);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2InterlaceModeBottomField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_TOP_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2InterlaceModeFollowTopField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2InterlaceModeFollowBottomField);
        }
        return @(AWSmediaconvertMpeg2InterlaceModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2InterlaceModeProgressive:
                return @"PROGRESSIVE";
            case AWSmediaconvertMpeg2InterlaceModeTopField:
                return @"TOP_FIELD";
            case AWSmediaconvertMpeg2InterlaceModeBottomField:
                return @"BOTTOM_FIELD";
            case AWSmediaconvertMpeg2InterlaceModeFollowTopField:
                return @"FOLLOW_TOP_FIELD";
            case AWSmediaconvertMpeg2InterlaceModeFollowBottomField:
                return @"FOLLOW_BOTTOM_FIELD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)intraDcPrecisionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2IntraDcPrecisionAuto);
        }
        if ([value caseInsensitiveCompare:@"INTRA_DC_PRECISION_8"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2IntraDcPrecisionIntraDcPrecision8);
        }
        if ([value caseInsensitiveCompare:@"INTRA_DC_PRECISION_9"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2IntraDcPrecisionIntraDcPrecision9);
        }
        if ([value caseInsensitiveCompare:@"INTRA_DC_PRECISION_10"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2IntraDcPrecisionIntraDcPrecision10);
        }
        if ([value caseInsensitiveCompare:@"INTRA_DC_PRECISION_11"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2IntraDcPrecisionIntraDcPrecision11);
        }
        return @(AWSmediaconvertMpeg2IntraDcPrecisionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2IntraDcPrecisionAuto:
                return @"AUTO";
            case AWSmediaconvertMpeg2IntraDcPrecisionIntraDcPrecision8:
                return @"INTRA_DC_PRECISION_8";
            case AWSmediaconvertMpeg2IntraDcPrecisionIntraDcPrecision9:
                return @"INTRA_DC_PRECISION_9";
            case AWSmediaconvertMpeg2IntraDcPrecisionIntraDcPrecision10:
                return @"INTRA_DC_PRECISION_10";
            case AWSmediaconvertMpeg2IntraDcPrecisionIntraDcPrecision11:
                return @"INTRA_DC_PRECISION_11";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2ParControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2ParControlSpecified);
        }
        return @(AWSmediaconvertMpeg2ParControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2ParControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSmediaconvertMpeg2ParControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qualityTuningLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_PASS"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2QualityTuningLevelSinglePass);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PASS"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2QualityTuningLevelMultiPass);
        }
        return @(AWSmediaconvertMpeg2QualityTuningLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2QualityTuningLevelSinglePass:
                return @"SINGLE_PASS";
            case AWSmediaconvertMpeg2QualityTuningLevelMultiPass:
                return @"MULTI_PASS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2RateControlModeVbr);
        }
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2RateControlModeCbr);
        }
        return @(AWSmediaconvertMpeg2RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2RateControlModeVbr:
                return @"VBR";
            case AWSmediaconvertMpeg2RateControlModeCbr:
                return @"CBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sceneChangeDetectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2SceneChangeDetectDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2SceneChangeDetectEnabled);
        }
        return @(AWSmediaconvertMpeg2SceneChangeDetectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2SceneChangeDetectDisabled:
                return @"DISABLED";
            case AWSmediaconvertMpeg2SceneChangeDetectEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)slowPalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2SlowPalDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2SlowPalEnabled);
        }
        return @(AWSmediaconvertMpeg2SlowPalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2SlowPalDisabled:
                return @"DISABLED";
            case AWSmediaconvertMpeg2SlowPalEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spatialAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2SpatialAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2SpatialAdaptiveQuantizationEnabled);
        }
        return @(AWSmediaconvertMpeg2SpatialAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2SpatialAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSmediaconvertMpeg2SpatialAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)syntaxJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2SyntaxDefault);
        }
        if ([value caseInsensitiveCompare:@"D_10"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2SyntaxD10);
        }
        return @(AWSmediaconvertMpeg2SyntaxUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2SyntaxDefault:
                return @"DEFAULT";
            case AWSmediaconvertMpeg2SyntaxD10:
                return @"D_10";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)telecineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2TelecineNone);
        }
        if ([value caseInsensitiveCompare:@"SOFT"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2TelecineSoft);
        }
        if ([value caseInsensitiveCompare:@"HARD"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2TelecineHard);
        }
        return @(AWSmediaconvertMpeg2TelecineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2TelecineNone:
                return @"NONE";
            case AWSmediaconvertMpeg2TelecineSoft:
                return @"SOFT";
            case AWSmediaconvertMpeg2TelecineHard:
                return @"HARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)temporalAdaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2TemporalAdaptiveQuantizationDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertMpeg2TemporalAdaptiveQuantizationEnabled);
        }
        return @(AWSmediaconvertMpeg2TemporalAdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMpeg2TemporalAdaptiveQuantizationDisabled:
                return @"DISABLED";
            case AWSmediaconvertMpeg2TemporalAdaptiveQuantizationEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertMsSmoothAdditionalManifest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestNameModifier" : @"ManifestNameModifier",
             @"selectedOutputs" : @"SelectedOutputs",
             };
}

@end

@implementation AWSmediaconvertMsSmoothEncryptionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spekeKeyProvider" : @"SpekeKeyProvider",
             };
}

+ (NSValueTransformer *)spekeKeyProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertSpekeKeyProvider class]];
}

@end

@implementation AWSmediaconvertMsSmoothGroupSettings

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertMsSmoothAdditionalManifest class]];
}

+ (NSValueTransformer *)audioDeduplicationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMBINE_DUPLICATE_STREAMS"] == NSOrderedSame) {
            return @(AWSmediaconvertMsSmoothAudioDeduplicationCombineDuplicateStreams);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertMsSmoothAudioDeduplicationNone);
        }
        return @(AWSmediaconvertMsSmoothAudioDeduplicationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMsSmoothAudioDeduplicationCombineDuplicateStreams:
                return @"COMBINE_DUPLICATE_STREAMS";
            case AWSmediaconvertMsSmoothAudioDeduplicationNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDestinationSettings class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertMsSmoothEncryptionSettings class]];
}

+ (NSValueTransformer *)manifestEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UTF8"] == NSOrderedSame) {
            return @(AWSmediaconvertMsSmoothManifestEncodingUtf8);
        }
        if ([value caseInsensitiveCompare:@"UTF16"] == NSOrderedSame) {
            return @(AWSmediaconvertMsSmoothManifestEncodingUtf16);
        }
        return @(AWSmediaconvertMsSmoothManifestEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMsSmoothManifestEncodingUtf8:
                return @"UTF8";
            case AWSmediaconvertMsSmoothManifestEncodingUtf16:
                return @"UTF16";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertMxfSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afdSignaling" : @"AfdSignaling",
             };
}

+ (NSValueTransformer *)afdSignalingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_COPY"] == NSOrderedSame) {
            return @(AWSmediaconvertMxfAfdSignalingNoCopy);
        }
        if ([value caseInsensitiveCompare:@"COPY_FROM_VIDEO"] == NSOrderedSame) {
            return @(AWSmediaconvertMxfAfdSignalingCopyFromVideo);
        }
        return @(AWSmediaconvertMxfAfdSignalingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertMxfAfdSignalingNoCopy:
                return @"NO_COPY";
            case AWSmediaconvertMxfAfdSignalingCopyFromVideo:
                return @"COPY_FROM_VIDEO";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertNielsenConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"breakoutCode" : @"BreakoutCode",
             @"distributorId" : @"DistributorId",
             };
}

@end

@implementation AWSmediaconvertNoiseReducer

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
            return @(AWSmediaconvertNoiseReducerFilterBilateral);
        }
        if ([value caseInsensitiveCompare:@"MEAN"] == NSOrderedSame) {
            return @(AWSmediaconvertNoiseReducerFilterMean);
        }
        if ([value caseInsensitiveCompare:@"GAUSSIAN"] == NSOrderedSame) {
            return @(AWSmediaconvertNoiseReducerFilterGaussian);
        }
        if ([value caseInsensitiveCompare:@"LANCZOS"] == NSOrderedSame) {
            return @(AWSmediaconvertNoiseReducerFilterLanczos);
        }
        if ([value caseInsensitiveCompare:@"SHARPEN"] == NSOrderedSame) {
            return @(AWSmediaconvertNoiseReducerFilterSharpen);
        }
        if ([value caseInsensitiveCompare:@"CONSERVE"] == NSOrderedSame) {
            return @(AWSmediaconvertNoiseReducerFilterConserve);
        }
        if ([value caseInsensitiveCompare:@"SPATIAL"] == NSOrderedSame) {
            return @(AWSmediaconvertNoiseReducerFilterSpatial);
        }
        if ([value caseInsensitiveCompare:@"TEMPORAL"] == NSOrderedSame) {
            return @(AWSmediaconvertNoiseReducerFilterTemporal);
        }
        return @(AWSmediaconvertNoiseReducerFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertNoiseReducerFilterBilateral:
                return @"BILATERAL";
            case AWSmediaconvertNoiseReducerFilterMean:
                return @"MEAN";
            case AWSmediaconvertNoiseReducerFilterGaussian:
                return @"GAUSSIAN";
            case AWSmediaconvertNoiseReducerFilterLanczos:
                return @"LANCZOS";
            case AWSmediaconvertNoiseReducerFilterSharpen:
                return @"SHARPEN";
            case AWSmediaconvertNoiseReducerFilterConserve:
                return @"CONSERVE";
            case AWSmediaconvertNoiseReducerFilterSpatial:
                return @"SPATIAL";
            case AWSmediaconvertNoiseReducerFilterTemporal:
                return @"TEMPORAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)filterSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertNoiseReducerFilterSettings class]];
}

+ (NSValueTransformer *)spatialFilterSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertNoiseReducerSpatialFilterSettings class]];
}

+ (NSValueTransformer *)temporalFilterSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertNoiseReducerTemporalFilterSettings class]];
}

@end

@implementation AWSmediaconvertNoiseReducerFilterSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"strength" : @"Strength",
             };
}

@end

@implementation AWSmediaconvertNoiseReducerSpatialFilterSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"postFilterSharpenStrength" : @"PostFilterSharpenStrength",
             @"speed" : @"Speed",
             @"strength" : @"Strength",
             };
}

@end

@implementation AWSmediaconvertNoiseReducerTemporalFilterSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aggressiveMode" : @"AggressiveMode",
             @"speed" : @"Speed",
             @"strength" : @"Strength",
             };
}

@end

@implementation AWSmediaconvertOutput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertAudioDescription class]];
}

+ (NSValueTransformer *)captionDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertCaptionDescription class]];
}

+ (NSValueTransformer *)containerSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertContainerSettings class]];
}

+ (NSValueTransformer *)outputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertOutputSettings class]];
}

+ (NSValueTransformer *)videoDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertVideoDescription class]];
}

@end

@implementation AWSmediaconvertOutputChannelMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputChannels" : @"InputChannels",
             };
}

@end

@implementation AWSmediaconvertOutputDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInMs" : @"DurationInMs",
             @"videoDetails" : @"VideoDetails",
             };
}

+ (NSValueTransformer *)videoDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertVideoDetail class]];
}

@end

@implementation AWSmediaconvertOutputGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customName" : @"CustomName",
             @"name" : @"Name",
             @"outputGroupSettings" : @"OutputGroupSettings",
             @"outputs" : @"Outputs",
             };
}

+ (NSValueTransformer *)outputGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertOutputGroupSettings class]];
}

+ (NSValueTransformer *)outputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertOutput class]];
}

@end

@implementation AWSmediaconvertOutputGroupDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputDetails" : @"OutputDetails",
             };
}

+ (NSValueTransformer *)outputDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertOutputDetail class]];
}

@end

@implementation AWSmediaconvertOutputGroupSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertCmafGroupSettings class]];
}

+ (NSValueTransformer *)dashIsoGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDashIsoGroupSettings class]];
}

+ (NSValueTransformer *)fileGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertFileGroupSettings class]];
}

+ (NSValueTransformer *)hlsGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertHlsGroupSettings class]];
}

+ (NSValueTransformer *)msSmoothGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertMsSmoothGroupSettings class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HLS_GROUP_SETTINGS"] == NSOrderedSame) {
            return @(AWSmediaconvertOutputGroupTypeHlsGroupSettings);
        }
        if ([value caseInsensitiveCompare:@"DASH_ISO_GROUP_SETTINGS"] == NSOrderedSame) {
            return @(AWSmediaconvertOutputGroupTypeDashIsoGroupSettings);
        }
        if ([value caseInsensitiveCompare:@"FILE_GROUP_SETTINGS"] == NSOrderedSame) {
            return @(AWSmediaconvertOutputGroupTypeFileGroupSettings);
        }
        if ([value caseInsensitiveCompare:@"MS_SMOOTH_GROUP_SETTINGS"] == NSOrderedSame) {
            return @(AWSmediaconvertOutputGroupTypeMsSmoothGroupSettings);
        }
        if ([value caseInsensitiveCompare:@"CMAF_GROUP_SETTINGS"] == NSOrderedSame) {
            return @(AWSmediaconvertOutputGroupTypeCmafGroupSettings);
        }
        return @(AWSmediaconvertOutputGroupTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertOutputGroupTypeHlsGroupSettings:
                return @"HLS_GROUP_SETTINGS";
            case AWSmediaconvertOutputGroupTypeDashIsoGroupSettings:
                return @"DASH_ISO_GROUP_SETTINGS";
            case AWSmediaconvertOutputGroupTypeFileGroupSettings:
                return @"FILE_GROUP_SETTINGS";
            case AWSmediaconvertOutputGroupTypeMsSmoothGroupSettings:
                return @"MS_SMOOTH_GROUP_SETTINGS";
            case AWSmediaconvertOutputGroupTypeCmafGroupSettings:
                return @"CMAF_GROUP_SETTINGS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hlsSettings" : @"HlsSettings",
             };
}

+ (NSValueTransformer *)hlsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertHlsSettings class]];
}

@end

@implementation AWSmediaconvertPreset

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertPresetSettings class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSmediaconvertTypesSystem);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSmediaconvertTypesCustom);
        }
        return @(AWSmediaconvertTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertTypesSystem:
                return @"SYSTEM";
            case AWSmediaconvertTypesCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertPresetSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioDescriptions" : @"AudioDescriptions",
             @"captionDescriptions" : @"CaptionDescriptions",
             @"containerSettings" : @"ContainerSettings",
             @"videoDescription" : @"VideoDescription",
             };
}

+ (NSValueTransformer *)audioDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertAudioDescription class]];
}

+ (NSValueTransformer *)captionDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertCaptionDescriptionPreset class]];
}

+ (NSValueTransformer *)containerSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertContainerSettings class]];
}

+ (NSValueTransformer *)videoDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertVideoDescription class]];
}

@end

@implementation AWSmediaconvertProresSettings

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
            return @(AWSmediaconvertProresCodecProfileAppleProres422);
        }
        if ([value caseInsensitiveCompare:@"APPLE_PRORES_422_HQ"] == NSOrderedSame) {
            return @(AWSmediaconvertProresCodecProfileAppleProres422Hq);
        }
        if ([value caseInsensitiveCompare:@"APPLE_PRORES_422_LT"] == NSOrderedSame) {
            return @(AWSmediaconvertProresCodecProfileAppleProres422Lt);
        }
        if ([value caseInsensitiveCompare:@"APPLE_PRORES_422_PROXY"] == NSOrderedSame) {
            return @(AWSmediaconvertProresCodecProfileAppleProres422Proxy);
        }
        return @(AWSmediaconvertProresCodecProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertProresCodecProfileAppleProres422:
                return @"APPLE_PRORES_422";
            case AWSmediaconvertProresCodecProfileAppleProres422Hq:
                return @"APPLE_PRORES_422_HQ";
            case AWSmediaconvertProresCodecProfileAppleProres422Lt:
                return @"APPLE_PRORES_422_LT";
            case AWSmediaconvertProresCodecProfileAppleProres422Proxy:
                return @"APPLE_PRORES_422_PROXY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSmediaconvertProresFramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSmediaconvertProresFramerateControlSpecified);
        }
        return @(AWSmediaconvertProresFramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertProresFramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSmediaconvertProresFramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateConversionAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUPLICATE_DROP"] == NSOrderedSame) {
            return @(AWSmediaconvertProresFramerateConversionAlgorithmDuplicateDrop);
        }
        if ([value caseInsensitiveCompare:@"INTERPOLATE"] == NSOrderedSame) {
            return @(AWSmediaconvertProresFramerateConversionAlgorithmInterpolate);
        }
        return @(AWSmediaconvertProresFramerateConversionAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertProresFramerateConversionAlgorithmDuplicateDrop:
                return @"DUPLICATE_DROP";
            case AWSmediaconvertProresFramerateConversionAlgorithmInterpolate:
                return @"INTERPOLATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)interlaceModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE"] == NSOrderedSame) {
            return @(AWSmediaconvertProresInterlaceModeProgressive);
        }
        if ([value caseInsensitiveCompare:@"TOP_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertProresInterlaceModeTopField);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertProresInterlaceModeBottomField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_TOP_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertProresInterlaceModeFollowTopField);
        }
        if ([value caseInsensitiveCompare:@"FOLLOW_BOTTOM_FIELD"] == NSOrderedSame) {
            return @(AWSmediaconvertProresInterlaceModeFollowBottomField);
        }
        return @(AWSmediaconvertProresInterlaceModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertProresInterlaceModeProgressive:
                return @"PROGRESSIVE";
            case AWSmediaconvertProresInterlaceModeTopField:
                return @"TOP_FIELD";
            case AWSmediaconvertProresInterlaceModeBottomField:
                return @"BOTTOM_FIELD";
            case AWSmediaconvertProresInterlaceModeFollowTopField:
                return @"FOLLOW_TOP_FIELD";
            case AWSmediaconvertProresInterlaceModeFollowBottomField:
                return @"FOLLOW_BOTTOM_FIELD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSmediaconvertProresParControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSmediaconvertProresParControlSpecified);
        }
        return @(AWSmediaconvertProresParControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertProresParControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSmediaconvertProresParControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)slowPalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertProresSlowPalDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertProresSlowPalEnabled);
        }
        return @(AWSmediaconvertProresSlowPalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertProresSlowPalDisabled:
                return @"DISABLED";
            case AWSmediaconvertProresSlowPalEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)telecineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertProresTelecineNone);
        }
        if ([value caseInsensitiveCompare:@"HARD"] == NSOrderedSame) {
            return @(AWSmediaconvertProresTelecineHard);
        }
        return @(AWSmediaconvertProresTelecineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertProresTelecineNone:
                return @"NONE";
            case AWSmediaconvertProresTelecineHard:
                return @"HARD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertQueue

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
            return @(AWSmediaconvertPricingPlanOnDemand);
        }
        if ([value caseInsensitiveCompare:@"RESERVED"] == NSOrderedSame) {
            return @(AWSmediaconvertPricingPlanReserved);
        }
        return @(AWSmediaconvertPricingPlanUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertPricingPlanOnDemand:
                return @"ON_DEMAND";
            case AWSmediaconvertPricingPlanReserved:
                return @"RESERVED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)reservationPlanJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertReservationPlan class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSmediaconvertQueueStatusActive);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSmediaconvertQueueStatusPaused);
        }
        return @(AWSmediaconvertQueueStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertQueueStatusActive:
                return @"ACTIVE";
            case AWSmediaconvertQueueStatusPaused:
                return @"PAUSED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSmediaconvertTypesSystem);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSmediaconvertTypesCustom);
        }
        return @(AWSmediaconvertTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertTypesSystem:
                return @"SYSTEM";
            case AWSmediaconvertTypesCustom:
                return @"CUSTOM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertQueueTransition

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

@implementation AWSmediaconvertRectangle

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"height" : @"Height",
             @"width" : @"Width",
             @"X" : @"X",
             @"Y" : @"Y",
             };
}

@end

@implementation AWSmediaconvertRemixSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelMapping" : @"ChannelMapping",
             @"channelsIn" : @"ChannelsIn",
             @"channelsOut" : @"ChannelsOut",
             };
}

+ (NSValueTransformer *)channelMappingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertChannelMapping class]];
}

@end

@implementation AWSmediaconvertReservationPlan

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
            return @(AWSmediaconvertCommitmentOneYear);
        }
        return @(AWSmediaconvertCommitmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCommitmentOneYear:
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
            return @(AWSmediaconvertRenewalTypeAutoRenew);
        }
        if ([value caseInsensitiveCompare:@"EXPIRE"] == NSOrderedSame) {
            return @(AWSmediaconvertRenewalTypeExpire);
        }
        return @(AWSmediaconvertRenewalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertRenewalTypeAutoRenew:
                return @"AUTO_RENEW";
            case AWSmediaconvertRenewalTypeExpire:
                return @"EXPIRE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSmediaconvertReservationPlanStatusActive);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSmediaconvertReservationPlanStatusExpired);
        }
        return @(AWSmediaconvertReservationPlanStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertReservationPlanStatusActive:
                return @"ACTIVE";
            case AWSmediaconvertReservationPlanStatusExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertReservationPlanSettings

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
            return @(AWSmediaconvertCommitmentOneYear);
        }
        return @(AWSmediaconvertCommitmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertCommitmentOneYear:
                return @"ONE_YEAR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)renewalTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO_RENEW"] == NSOrderedSame) {
            return @(AWSmediaconvertRenewalTypeAutoRenew);
        }
        if ([value caseInsensitiveCompare:@"EXPIRE"] == NSOrderedSame) {
            return @(AWSmediaconvertRenewalTypeExpire);
        }
        return @(AWSmediaconvertRenewalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertRenewalTypeAutoRenew:
                return @"AUTO_RENEW";
            case AWSmediaconvertRenewalTypeExpire:
                return @"EXPIRE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertResourceTags

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmediaconvertS3DestinationAccessControl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cannedAcl" : @"CannedAcl",
             };
}

+ (NSValueTransformer *)cannedAclJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC_READ"] == NSOrderedSame) {
            return @(AWSmediaconvertS3ObjectCannedAclPublicRead);
        }
        if ([value caseInsensitiveCompare:@"AUTHENTICATED_READ"] == NSOrderedSame) {
            return @(AWSmediaconvertS3ObjectCannedAclAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"BUCKET_OWNER_READ"] == NSOrderedSame) {
            return @(AWSmediaconvertS3ObjectCannedAclBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"BUCKET_OWNER_FULL_CONTROL"] == NSOrderedSame) {
            return @(AWSmediaconvertS3ObjectCannedAclBucketOwnerFullControl);
        }
        return @(AWSmediaconvertS3ObjectCannedAclUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertS3ObjectCannedAclPublicRead:
                return @"PUBLIC_READ";
            case AWSmediaconvertS3ObjectCannedAclAuthenticatedRead:
                return @"AUTHENTICATED_READ";
            case AWSmediaconvertS3ObjectCannedAclBucketOwnerRead:
                return @"BUCKET_OWNER_READ";
            case AWSmediaconvertS3ObjectCannedAclBucketOwnerFullControl:
                return @"BUCKET_OWNER_FULL_CONTROL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertS3DestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessControl" : @"AccessControl",
             @"encryption" : @"Encryption",
             };
}

+ (NSValueTransformer *)accessControlJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertS3DestinationAccessControl class]];
}

+ (NSValueTransformer *)encryptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertS3EncryptionSettings class]];
}

@end

@implementation AWSmediaconvertS3EncryptionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionType" : @"EncryptionType",
             @"kmsKeyArn" : @"KmsKeyArn",
             };
}

+ (NSValueTransformer *)encryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVER_SIDE_ENCRYPTION_S3"] == NSOrderedSame) {
            return @(AWSmediaconvertS3ServerSideEncryptionTypeServerSideEncryptionS3);
        }
        if ([value caseInsensitiveCompare:@"SERVER_SIDE_ENCRYPTION_KMS"] == NSOrderedSame) {
            return @(AWSmediaconvertS3ServerSideEncryptionTypeServerSideEncryptionKms);
        }
        return @(AWSmediaconvertS3ServerSideEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertS3ServerSideEncryptionTypeServerSideEncryptionS3:
                return @"SERVER_SIDE_ENCRYPTION_S3";
            case AWSmediaconvertS3ServerSideEncryptionTypeServerSideEncryptionKms:
                return @"SERVER_SIDE_ENCRYPTION_KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertSccDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"framerate" : @"Framerate",
             };
}

+ (NSValueTransformer *)framerateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAMERATE_23_97"] == NSOrderedSame) {
            return @(AWSmediaconvertSccDestinationFramerateFramerate2397);
        }
        if ([value caseInsensitiveCompare:@"FRAMERATE_24"] == NSOrderedSame) {
            return @(AWSmediaconvertSccDestinationFramerateFramerate24);
        }
        if ([value caseInsensitiveCompare:@"FRAMERATE_25"] == NSOrderedSame) {
            return @(AWSmediaconvertSccDestinationFramerateFramerate25);
        }
        if ([value caseInsensitiveCompare:@"FRAMERATE_29_97_DROPFRAME"] == NSOrderedSame) {
            return @(AWSmediaconvertSccDestinationFramerateFramerate2997Dropframe);
        }
        if ([value caseInsensitiveCompare:@"FRAMERATE_29_97_NON_DROPFRAME"] == NSOrderedSame) {
            return @(AWSmediaconvertSccDestinationFramerateFramerate2997NonDropframe);
        }
        return @(AWSmediaconvertSccDestinationFramerateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertSccDestinationFramerateFramerate2397:
                return @"FRAMERATE_23_97";
            case AWSmediaconvertSccDestinationFramerateFramerate24:
                return @"FRAMERATE_24";
            case AWSmediaconvertSccDestinationFramerateFramerate25:
                return @"FRAMERATE_25";
            case AWSmediaconvertSccDestinationFramerateFramerate2997Dropframe:
                return @"FRAMERATE_29_97_DROPFRAME";
            case AWSmediaconvertSccDestinationFramerateFramerate2997NonDropframe:
                return @"FRAMERATE_29_97_NON_DROPFRAME";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertSpekeKeyProvider

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             @"resourceId" : @"ResourceId",
             @"systemIds" : @"SystemIds",
             @"url" : @"Url",
             };
}

@end

@implementation AWSmediaconvertSpekeKeyProviderCmaf

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

@implementation AWSmediaconvertStaticKeyProvider

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyFormat" : @"KeyFormat",
             @"keyFormatVersions" : @"KeyFormatVersions",
             @"staticKeyValue" : @"StaticKeyValue",
             @"url" : @"Url",
             };
}

@end

@implementation AWSmediaconvertTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmediaconvertTagResourceResponse

@end

@implementation AWSmediaconvertTeletextDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageNumber" : @"PageNumber",
             @"pageTypes" : @"PageTypes",
             };
}

@end

@implementation AWSmediaconvertTeletextSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageNumber" : @"PageNumber",
             };
}

@end

@implementation AWSmediaconvertTimecodeBurnin

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
            return @(AWSmediaconvertTimecodeBurninPositionTopCenter);
        }
        if ([value caseInsensitiveCompare:@"TOP_LEFT"] == NSOrderedSame) {
            return @(AWSmediaconvertTimecodeBurninPositionTopLeft);
        }
        if ([value caseInsensitiveCompare:@"TOP_RIGHT"] == NSOrderedSame) {
            return @(AWSmediaconvertTimecodeBurninPositionTopRight);
        }
        if ([value caseInsensitiveCompare:@"MIDDLE_LEFT"] == NSOrderedSame) {
            return @(AWSmediaconvertTimecodeBurninPositionMiddleLeft);
        }
        if ([value caseInsensitiveCompare:@"MIDDLE_CENTER"] == NSOrderedSame) {
            return @(AWSmediaconvertTimecodeBurninPositionMiddleCenter);
        }
        if ([value caseInsensitiveCompare:@"MIDDLE_RIGHT"] == NSOrderedSame) {
            return @(AWSmediaconvertTimecodeBurninPositionMiddleRight);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_LEFT"] == NSOrderedSame) {
            return @(AWSmediaconvertTimecodeBurninPositionBottomLeft);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_CENTER"] == NSOrderedSame) {
            return @(AWSmediaconvertTimecodeBurninPositionBottomCenter);
        }
        if ([value caseInsensitiveCompare:@"BOTTOM_RIGHT"] == NSOrderedSame) {
            return @(AWSmediaconvertTimecodeBurninPositionBottomRight);
        }
        return @(AWSmediaconvertTimecodeBurninPositionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertTimecodeBurninPositionTopCenter:
                return @"TOP_CENTER";
            case AWSmediaconvertTimecodeBurninPositionTopLeft:
                return @"TOP_LEFT";
            case AWSmediaconvertTimecodeBurninPositionTopRight:
                return @"TOP_RIGHT";
            case AWSmediaconvertTimecodeBurninPositionMiddleLeft:
                return @"MIDDLE_LEFT";
            case AWSmediaconvertTimecodeBurninPositionMiddleCenter:
                return @"MIDDLE_CENTER";
            case AWSmediaconvertTimecodeBurninPositionMiddleRight:
                return @"MIDDLE_RIGHT";
            case AWSmediaconvertTimecodeBurninPositionBottomLeft:
                return @"BOTTOM_LEFT";
            case AWSmediaconvertTimecodeBurninPositionBottomCenter:
                return @"BOTTOM_CENTER";
            case AWSmediaconvertTimecodeBurninPositionBottomRight:
                return @"BOTTOM_RIGHT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertTimecodeConfig

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
            return @(AWSmediaconvertTimecodeSourceEmbedded);
        }
        if ([value caseInsensitiveCompare:@"ZEROBASED"] == NSOrderedSame) {
            return @(AWSmediaconvertTimecodeSourceZerobased);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIEDSTART"] == NSOrderedSame) {
            return @(AWSmediaconvertTimecodeSourceSpecifiedstart);
        }
        return @(AWSmediaconvertTimecodeSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertTimecodeSourceEmbedded:
                return @"EMBEDDED";
            case AWSmediaconvertTimecodeSourceZerobased:
                return @"ZEROBASED";
            case AWSmediaconvertTimecodeSourceSpecifiedstart:
                return @"SPECIFIEDSTART";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertTimedMetadataInsertion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"id3Insertions" : @"Id3Insertions",
             };
}

+ (NSValueTransformer *)id3InsertionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertId3Insertion class]];
}

@end

@implementation AWSmediaconvertTiming

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

@implementation AWSmediaconvertTrackSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"trackNumber" : @"TrackNumber",
             };
}

@end

@implementation AWSmediaconvertTtmlDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stylePassthrough" : @"StylePassthrough",
             };
}

+ (NSValueTransformer *)stylePassthroughJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertTtmlStylePassthroughEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertTtmlStylePassthroughDisabled);
        }
        return @(AWSmediaconvertTtmlStylePassthroughUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertTtmlStylePassthroughEnabled:
                return @"ENABLED";
            case AWSmediaconvertTtmlStylePassthroughDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSmediaconvertUntagResourceResponse

@end

@implementation AWSmediaconvertUpdateJobTemplateRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAccelerationSettings class]];
}

+ (NSValueTransformer *)hopDestinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmediaconvertHopDestination class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertJobTemplateSettings class]];
}

+ (NSValueTransformer *)statusUpdateIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECONDS_10"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds10);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_12"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds12);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_15"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds15);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_20"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds20);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_30"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds30);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_60"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds60);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_120"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds120);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_180"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds180);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_240"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds240);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_300"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds300);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_360"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds360);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_420"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds420);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_480"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds480);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_540"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds540);
        }
        if ([value caseInsensitiveCompare:@"SECONDS_600"] == NSOrderedSame) {
            return @(AWSmediaconvertStatusUpdateIntervalSeconds600);
        }
        return @(AWSmediaconvertStatusUpdateIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertStatusUpdateIntervalSeconds10:
                return @"SECONDS_10";
            case AWSmediaconvertStatusUpdateIntervalSeconds12:
                return @"SECONDS_12";
            case AWSmediaconvertStatusUpdateIntervalSeconds15:
                return @"SECONDS_15";
            case AWSmediaconvertStatusUpdateIntervalSeconds20:
                return @"SECONDS_20";
            case AWSmediaconvertStatusUpdateIntervalSeconds30:
                return @"SECONDS_30";
            case AWSmediaconvertStatusUpdateIntervalSeconds60:
                return @"SECONDS_60";
            case AWSmediaconvertStatusUpdateIntervalSeconds120:
                return @"SECONDS_120";
            case AWSmediaconvertStatusUpdateIntervalSeconds180:
                return @"SECONDS_180";
            case AWSmediaconvertStatusUpdateIntervalSeconds240:
                return @"SECONDS_240";
            case AWSmediaconvertStatusUpdateIntervalSeconds300:
                return @"SECONDS_300";
            case AWSmediaconvertStatusUpdateIntervalSeconds360:
                return @"SECONDS_360";
            case AWSmediaconvertStatusUpdateIntervalSeconds420:
                return @"SECONDS_420";
            case AWSmediaconvertStatusUpdateIntervalSeconds480:
                return @"SECONDS_480";
            case AWSmediaconvertStatusUpdateIntervalSeconds540:
                return @"SECONDS_540";
            case AWSmediaconvertStatusUpdateIntervalSeconds600:
                return @"SECONDS_600";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertUpdateJobTemplateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobTemplate" : @"JobTemplate",
             };
}

+ (NSValueTransformer *)jobTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertJobTemplate class]];
}

@end

@implementation AWSmediaconvertUpdatePresetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"category" : @"Category",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"settings" : @"Settings",
             };
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertPresetSettings class]];
}

@end

@implementation AWSmediaconvertUpdatePresetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"preset" : @"Preset",
             };
}

+ (NSValueTransformer *)presetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertPreset class]];
}

@end

@implementation AWSmediaconvertUpdateQueueRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"name" : @"Name",
             @"reservationPlanSettings" : @"ReservationPlanSettings",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)reservationPlanSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertReservationPlanSettings class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSmediaconvertQueueStatusActive);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSmediaconvertQueueStatusPaused);
        }
        return @(AWSmediaconvertQueueStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertQueueStatusActive:
                return @"ACTIVE";
            case AWSmediaconvertQueueStatusPaused:
                return @"PAUSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertUpdateQueueResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queue" : @"Queue",
             };
}

+ (NSValueTransformer *)queueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertQueue class]];
}

@end

@implementation AWSmediaconvertVideoCodecSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"av1Settings" : @"Av1Settings",
             @"codec" : @"Codec",
             @"frameCaptureSettings" : @"FrameCaptureSettings",
             @"h264Settings" : @"H264Settings",
             @"h265Settings" : @"H265Settings",
             @"mpeg2Settings" : @"Mpeg2Settings",
             @"proresSettings" : @"ProresSettings",
             };
}

+ (NSValueTransformer *)av1SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertAv1Settings class]];
}

+ (NSValueTransformer *)codecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAME_CAPTURE"] == NSOrderedSame) {
            return @(AWSmediaconvertVideoCodecFrameCapture);
        }
        if ([value caseInsensitiveCompare:@"AV1"] == NSOrderedSame) {
            return @(AWSmediaconvertVideoCodecAv1);
        }
        if ([value caseInsensitiveCompare:@"H_264"] == NSOrderedSame) {
            return @(AWSmediaconvertVideoCodecH264);
        }
        if ([value caseInsensitiveCompare:@"H_265"] == NSOrderedSame) {
            return @(AWSmediaconvertVideoCodecH265);
        }
        if ([value caseInsensitiveCompare:@"MPEG2"] == NSOrderedSame) {
            return @(AWSmediaconvertVideoCodecMpeg2);
        }
        if ([value caseInsensitiveCompare:@"PRORES"] == NSOrderedSame) {
            return @(AWSmediaconvertVideoCodecProres);
        }
        return @(AWSmediaconvertVideoCodecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertVideoCodecFrameCapture:
                return @"FRAME_CAPTURE";
            case AWSmediaconvertVideoCodecAv1:
                return @"AV1";
            case AWSmediaconvertVideoCodecH264:
                return @"H_264";
            case AWSmediaconvertVideoCodecH265:
                return @"H_265";
            case AWSmediaconvertVideoCodecMpeg2:
                return @"MPEG2";
            case AWSmediaconvertVideoCodecProres:
                return @"PRORES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)frameCaptureSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertFrameCaptureSettings class]];
}

+ (NSValueTransformer *)h264SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertH264Settings class]];
}

+ (NSValueTransformer *)h265SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertH265Settings class]];
}

+ (NSValueTransformer *)mpeg2SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertMpeg2Settings class]];
}

+ (NSValueTransformer *)proresSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertProresSettings class]];
}

@end

@implementation AWSmediaconvertVideoDescription

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
            return @(AWSmediaconvertAfdSignalingNone);
        }
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmediaconvertAfdSignalingAuto);
        }
        if ([value caseInsensitiveCompare:@"FIXED"] == NSOrderedSame) {
            return @(AWSmediaconvertAfdSignalingFixed);
        }
        return @(AWSmediaconvertAfdSignalingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAfdSignalingNone:
                return @"NONE";
            case AWSmediaconvertAfdSignalingAuto:
                return @"AUTO";
            case AWSmediaconvertAfdSignalingFixed:
                return @"FIXED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)antiAliasJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertAntiAliasDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertAntiAliasEnabled);
        }
        return @(AWSmediaconvertAntiAliasUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAntiAliasDisabled:
                return @"DISABLED";
            case AWSmediaconvertAntiAliasEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertVideoCodecSettings class]];
}

+ (NSValueTransformer *)colorMetadataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSmediaconvertColorMetadataIgnore);
        }
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSmediaconvertColorMetadataInsert);
        }
        return @(AWSmediaconvertColorMetadataUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertColorMetadataIgnore:
                return @"IGNORE";
            case AWSmediaconvertColorMetadataInsert:
                return @"INSERT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)cropJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertRectangle class]];
}

+ (NSValueTransformer *)dropFrameTimecodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertDropFrameTimecodeDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertDropFrameTimecodeEnabled);
        }
        return @(AWSmediaconvertDropFrameTimecodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertDropFrameTimecodeDisabled:
                return @"DISABLED";
            case AWSmediaconvertDropFrameTimecodeEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)positionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertRectangle class]];
}

+ (NSValueTransformer *)respondToAfdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmediaconvertRespondToAfdNone);
        }
        if ([value caseInsensitiveCompare:@"RESPOND"] == NSOrderedSame) {
            return @(AWSmediaconvertRespondToAfdRespond);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmediaconvertRespondToAfdPassthrough);
        }
        return @(AWSmediaconvertRespondToAfdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertRespondToAfdNone:
                return @"NONE";
            case AWSmediaconvertRespondToAfdRespond:
                return @"RESPOND";
            case AWSmediaconvertRespondToAfdPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scalingBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSmediaconvertScalingBehaviorDefault);
        }
        if ([value caseInsensitiveCompare:@"STRETCH_TO_OUTPUT"] == NSOrderedSame) {
            return @(AWSmediaconvertScalingBehaviorStretchToOutput);
        }
        return @(AWSmediaconvertScalingBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertScalingBehaviorDefault:
                return @"DEFAULT";
            case AWSmediaconvertScalingBehaviorStretchToOutput:
                return @"STRETCH_TO_OUTPUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timecodeInsertionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmediaconvertVideoTimecodeInsertionDisabled);
        }
        if ([value caseInsensitiveCompare:@"PIC_TIMING_SEI"] == NSOrderedSame) {
            return @(AWSmediaconvertVideoTimecodeInsertionPicTimingSei);
        }
        return @(AWSmediaconvertVideoTimecodeInsertionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertVideoTimecodeInsertionDisabled:
                return @"DISABLED";
            case AWSmediaconvertVideoTimecodeInsertionPicTimingSei:
                return @"PIC_TIMING_SEI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)videoPreprocessorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertVideoPreprocessor class]];
}

@end

@implementation AWSmediaconvertVideoDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"heightInPx" : @"HeightInPx",
             @"widthInPx" : @"WidthInPx",
             };
}

@end

@implementation AWSmediaconvertVideoPreprocessor

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertColorCorrector class]];
}

+ (NSValueTransformer *)deinterlacerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDeinterlacer class]];
}

+ (NSValueTransformer *)dolbyVisionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertDolbyVision class]];
}

+ (NSValueTransformer *)imageInserterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertImageInserter class]];
}

+ (NSValueTransformer *)noiseReducerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertNoiseReducer class]];
}

+ (NSValueTransformer *)timecodeBurninJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertTimecodeBurnin class]];
}

@end

@implementation AWSmediaconvertVideoSelector

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
            return @(AWSmediaconvertAlphaBehaviorDiscard);
        }
        if ([value caseInsensitiveCompare:@"REMAP_TO_LUMA"] == NSOrderedSame) {
            return @(AWSmediaconvertAlphaBehaviorRemapToLuma);
        }
        return @(AWSmediaconvertAlphaBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertAlphaBehaviorDiscard:
                return @"DISCARD";
            case AWSmediaconvertAlphaBehaviorRemapToLuma:
                return @"REMAP_TO_LUMA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorSpaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW"] == NSOrderedSame) {
            return @(AWSmediaconvertColorSpaceFollow);
        }
        if ([value caseInsensitiveCompare:@"REC_601"] == NSOrderedSame) {
            return @(AWSmediaconvertColorSpaceRec601);
        }
        if ([value caseInsensitiveCompare:@"REC_709"] == NSOrderedSame) {
            return @(AWSmediaconvertColorSpaceRec709);
        }
        if ([value caseInsensitiveCompare:@"HDR10"] == NSOrderedSame) {
            return @(AWSmediaconvertColorSpaceHdr10);
        }
        if ([value caseInsensitiveCompare:@"HLG_2020"] == NSOrderedSame) {
            return @(AWSmediaconvertColorSpaceHlg2020);
        }
        return @(AWSmediaconvertColorSpaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertColorSpaceFollow:
                return @"FOLLOW";
            case AWSmediaconvertColorSpaceRec601:
                return @"REC_601";
            case AWSmediaconvertColorSpaceRec709:
                return @"REC_709";
            case AWSmediaconvertColorSpaceHdr10:
                return @"HDR10";
            case AWSmediaconvertColorSpaceHlg2020:
                return @"HLG_2020";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorSpaceUsageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FORCE"] == NSOrderedSame) {
            return @(AWSmediaconvertColorSpaceUsageForce);
        }
        if ([value caseInsensitiveCompare:@"FALLBACK"] == NSOrderedSame) {
            return @(AWSmediaconvertColorSpaceUsageFallback);
        }
        return @(AWSmediaconvertColorSpaceUsageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertColorSpaceUsageForce:
                return @"FORCE";
            case AWSmediaconvertColorSpaceUsageFallback:
                return @"FALLBACK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hdr10MetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmediaconvertHdr10Metadata class]];
}

+ (NSValueTransformer *)rotateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEGREE_0"] == NSOrderedSame) {
            return @(AWSmediaconvertInputRotateDegree0);
        }
        if ([value caseInsensitiveCompare:@"DEGREES_90"] == NSOrderedSame) {
            return @(AWSmediaconvertInputRotateDegrees90);
        }
        if ([value caseInsensitiveCompare:@"DEGREES_180"] == NSOrderedSame) {
            return @(AWSmediaconvertInputRotateDegrees180);
        }
        if ([value caseInsensitiveCompare:@"DEGREES_270"] == NSOrderedSame) {
            return @(AWSmediaconvertInputRotateDegrees270);
        }
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmediaconvertInputRotateAuto);
        }
        return @(AWSmediaconvertInputRotateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertInputRotateDegree0:
                return @"DEGREE_0";
            case AWSmediaconvertInputRotateDegrees90:
                return @"DEGREES_90";
            case AWSmediaconvertInputRotateDegrees180:
                return @"DEGREES_180";
            case AWSmediaconvertInputRotateDegrees270:
                return @"DEGREES_270";
            case AWSmediaconvertInputRotateAuto:
                return @"AUTO";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmediaconvertWavSettings

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
            return @(AWSmediaconvertWavFormatRiff);
        }
        if ([value caseInsensitiveCompare:@"RF64"] == NSOrderedSame) {
            return @(AWSmediaconvertWavFormatRf64);
        }
        return @(AWSmediaconvertWavFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmediaconvertWavFormatRiff:
                return @"RIFF";
            case AWSmediaconvertWavFormatRf64:
                return @"RF64";
            default:
                return nil;
        }
    }];
}

@end
