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

#import "AWSMedialiveModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSMedialiveErrorDomain = @"com.amazonaws.AWSMedialiveErrorDomain";

@implementation AWSMedialiveAacSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitrate" : @"Bitrate",
             @"codingMode" : @"CodingMode",
             @"inputType" : @"InputType",
             @"profile" : @"Profile",
             @"rateControlMode" : @"RateControlMode",
             @"rawFormat" : @"RawFormat",
             @"sampleRate" : @"SampleRate",
             @"spec" : @"Spec",
             @"vbrQuality" : @"VbrQuality",
             };
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AD_RECEIVER_MIX"] == NSOrderedSame) {
            return @(AWSMedialiveAacCodingModeAdReceiverMix);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_0"] == NSOrderedSame) {
            return @(AWSMedialiveAacCodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_1"] == NSOrderedSame) {
            return @(AWSMedialiveAacCodingModeCodingMode11);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSMedialiveAacCodingModeCodingMode20);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_5_1"] == NSOrderedSame) {
            return @(AWSMedialiveAacCodingModeCodingMode51);
        }
        return @(AWSMedialiveAacCodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAacCodingModeAdReceiverMix:
                return @"AD_RECEIVER_MIX";
            case AWSMedialiveAacCodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSMedialiveAacCodingModeCodingMode11:
                return @"CODING_MODE_1_1";
            case AWSMedialiveAacCodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            case AWSMedialiveAacCodingModeCodingMode51:
                return @"CODING_MODE_5_1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BROADCASTER_MIXED_AD"] == NSOrderedSame) {
            return @(AWSMedialiveAacInputTypeBroadcasterMixedAd);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSMedialiveAacInputTypeNormal);
        }
        return @(AWSMedialiveAacInputTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAacInputTypeBroadcasterMixedAd:
                return @"BROADCASTER_MIXED_AD";
            case AWSMedialiveAacInputTypeNormal:
                return @"NORMAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HEV1"] == NSOrderedSame) {
            return @(AWSMedialiveAacProfileHev1);
        }
        if ([value caseInsensitiveCompare:@"HEV2"] == NSOrderedSame) {
            return @(AWSMedialiveAacProfileHev2);
        }
        if ([value caseInsensitiveCompare:@"LC"] == NSOrderedSame) {
            return @(AWSMedialiveAacProfileLc);
        }
        return @(AWSMedialiveAacProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAacProfileHev1:
                return @"HEV1";
            case AWSMedialiveAacProfileHev2:
                return @"HEV2";
            case AWSMedialiveAacProfileLc:
                return @"LC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSMedialiveAacRateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSMedialiveAacRateControlModeVbr);
        }
        return @(AWSMedialiveAacRateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAacRateControlModeCbr:
                return @"CBR";
            case AWSMedialiveAacRateControlModeVbr:
                return @"VBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rawFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LATM_LOAS"] == NSOrderedSame) {
            return @(AWSMedialiveAacRawFormatLatmLoas);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveAacRawFormatNone);
        }
        return @(AWSMedialiveAacRawFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAacRawFormatLatmLoas:
                return @"LATM_LOAS";
            case AWSMedialiveAacRawFormatNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)specJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MPEG2"] == NSOrderedSame) {
            return @(AWSMedialiveAacSpecMpeg2);
        }
        if ([value caseInsensitiveCompare:@"MPEG4"] == NSOrderedSame) {
            return @(AWSMedialiveAacSpecMpeg4);
        }
        return @(AWSMedialiveAacSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAacSpecMpeg2:
                return @"MPEG2";
            case AWSMedialiveAacSpecMpeg4:
                return @"MPEG4";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vbrQualityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMedialiveAacVbrQualityHigh);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSMedialiveAacVbrQualityLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM_HIGH"] == NSOrderedSame) {
            return @(AWSMedialiveAacVbrQualityMediumHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM_LOW"] == NSOrderedSame) {
            return @(AWSMedialiveAacVbrQualityMediumLow);
        }
        return @(AWSMedialiveAacVbrQualityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAacVbrQualityHigh:
                return @"HIGH";
            case AWSMedialiveAacVbrQualityLow:
                return @"LOW";
            case AWSMedialiveAacVbrQualityMediumHigh:
                return @"MEDIUM_HIGH";
            case AWSMedialiveAacVbrQualityMediumLow:
                return @"MEDIUM_LOW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveAc3Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitrate" : @"Bitrate",
             @"bitstreamMode" : @"BitstreamMode",
             @"codingMode" : @"CodingMode",
             @"dialnorm" : @"Dialnorm",
             @"drcProfile" : @"DrcProfile",
             @"lfeFilter" : @"LfeFilter",
             @"metadataControl" : @"MetadataControl",
             };
}

+ (NSValueTransformer *)bitstreamModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMMENTARY"] == NSOrderedSame) {
            return @(AWSMedialiveAc3BitstreamModeCommentary);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE_MAIN"] == NSOrderedSame) {
            return @(AWSMedialiveAc3BitstreamModeCompleteMain);
        }
        if ([value caseInsensitiveCompare:@"DIALOGUE"] == NSOrderedSame) {
            return @(AWSMedialiveAc3BitstreamModeDialogue);
        }
        if ([value caseInsensitiveCompare:@"EMERGENCY"] == NSOrderedSame) {
            return @(AWSMedialiveAc3BitstreamModeEmergency);
        }
        if ([value caseInsensitiveCompare:@"HEARING_IMPAIRED"] == NSOrderedSame) {
            return @(AWSMedialiveAc3BitstreamModeHearingImpaired);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_AND_EFFECTS"] == NSOrderedSame) {
            return @(AWSMedialiveAc3BitstreamModeMusicAndEffects);
        }
        if ([value caseInsensitiveCompare:@"VISUALLY_IMPAIRED"] == NSOrderedSame) {
            return @(AWSMedialiveAc3BitstreamModeVisuallyImpaired);
        }
        if ([value caseInsensitiveCompare:@"VOICE_OVER"] == NSOrderedSame) {
            return @(AWSMedialiveAc3BitstreamModeVoiceOver);
        }
        return @(AWSMedialiveAc3BitstreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAc3BitstreamModeCommentary:
                return @"COMMENTARY";
            case AWSMedialiveAc3BitstreamModeCompleteMain:
                return @"COMPLETE_MAIN";
            case AWSMedialiveAc3BitstreamModeDialogue:
                return @"DIALOGUE";
            case AWSMedialiveAc3BitstreamModeEmergency:
                return @"EMERGENCY";
            case AWSMedialiveAc3BitstreamModeHearingImpaired:
                return @"HEARING_IMPAIRED";
            case AWSMedialiveAc3BitstreamModeMusicAndEffects:
                return @"MUSIC_AND_EFFECTS";
            case AWSMedialiveAc3BitstreamModeVisuallyImpaired:
                return @"VISUALLY_IMPAIRED";
            case AWSMedialiveAc3BitstreamModeVoiceOver:
                return @"VOICE_OVER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_0"] == NSOrderedSame) {
            return @(AWSMedialiveAc3CodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_1"] == NSOrderedSame) {
            return @(AWSMedialiveAc3CodingModeCodingMode11);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSMedialiveAc3CodingModeCodingMode20);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_3_2_LFE"] == NSOrderedSame) {
            return @(AWSMedialiveAc3CodingModeCodingMode32Lfe);
        }
        return @(AWSMedialiveAc3CodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAc3CodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSMedialiveAc3CodingModeCodingMode11:
                return @"CODING_MODE_1_1";
            case AWSMedialiveAc3CodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            case AWSMedialiveAc3CodingModeCodingMode32Lfe:
                return @"CODING_MODE_3_2_LFE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)drcProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveAc3DrcProfileFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveAc3DrcProfileNone);
        }
        return @(AWSMedialiveAc3DrcProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAc3DrcProfileFilmStandard:
                return @"FILM_STANDARD";
            case AWSMedialiveAc3DrcProfileNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lfeFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveAc3LfeFilterDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveAc3LfeFilterEnabled);
        }
        return @(AWSMedialiveAc3LfeFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAc3LfeFilterDisabled:
                return @"DISABLED";
            case AWSMedialiveAc3LfeFilterEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metadataControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSMedialiveAc3MetadataControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSMedialiveAc3MetadataControlUseConfigured);
        }
        return @(AWSMedialiveAc3MetadataControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAc3MetadataControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSMedialiveAc3MetadataControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveAccessDenied

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSMedialiveArchiveContainerSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"m2tsSettings" : @"M2tsSettings",
             };
}

+ (NSValueTransformer *)m2tsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveM2tsSettings class]];
}

@end

@implementation AWSMedialiveArchiveGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             @"rolloverInterval" : @"RolloverInterval",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveOutputLocationRef class]];
}

@end

@implementation AWSMedialiveArchiveOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containerSettings" : @"ContainerSettings",
             @"extension" : @"Extension",
             @"nameModifier" : @"NameModifier",
             };
}

+ (NSValueTransformer *)containerSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveArchiveContainerSettings class]];
}

@end

@implementation AWSMedialiveAribDestinationSettings

@end

@implementation AWSMedialiveAribSourceSettings

@end

@implementation AWSMedialiveAudioChannelMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputChannelLevels" : @"InputChannelLevels",
             @"outputChannel" : @"OutputChannel",
             };
}

+ (NSValueTransformer *)inputChannelLevelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputChannelLevel class]];
}

@end

@implementation AWSMedialiveAudioCodecSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aacSettings" : @"AacSettings",
             @"ac3Settings" : @"Ac3Settings",
             @"eac3Settings" : @"Eac3Settings",
             @"mp2Settings" : @"Mp2Settings",
             @"passThroughSettings" : @"PassThroughSettings",
             };
}

+ (NSValueTransformer *)aacSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAacSettings class]];
}

+ (NSValueTransformer *)ac3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAc3Settings class]];
}

+ (NSValueTransformer *)eac3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveEac3Settings class]];
}

+ (NSValueTransformer *)mp2SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMp2Settings class]];
}

+ (NSValueTransformer *)passThroughSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialivePassThroughSettings class]];
}

@end

@implementation AWSMedialiveAudioDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioNormalizationSettings" : @"AudioNormalizationSettings",
             @"audioSelectorName" : @"AudioSelectorName",
             @"audioType" : @"AudioType",
             @"audioTypeControl" : @"AudioTypeControl",
             @"codecSettings" : @"CodecSettings",
             @"languageCode" : @"LanguageCode",
             @"languageCodeControl" : @"LanguageCodeControl",
             @"name" : @"Name",
             @"remixSettings" : @"RemixSettings",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)audioNormalizationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAudioNormalizationSettings class]];
}

+ (NSValueTransformer *)audioTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CLEAN_EFFECTS"] == NSOrderedSame) {
            return @(AWSMedialiveAudioTypeCleanEffects);
        }
        if ([value caseInsensitiveCompare:@"HEARING_IMPAIRED"] == NSOrderedSame) {
            return @(AWSMedialiveAudioTypeHearingImpaired);
        }
        if ([value caseInsensitiveCompare:@"UNDEFINED"] == NSOrderedSame) {
            return @(AWSMedialiveAudioTypeUndefined);
        }
        if ([value caseInsensitiveCompare:@"VISUAL_IMPAIRED_COMMENTARY"] == NSOrderedSame) {
            return @(AWSMedialiveAudioTypeVisualImpairedCommentary);
        }
        return @(AWSMedialiveAudioTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAudioTypeCleanEffects:
                return @"CLEAN_EFFECTS";
            case AWSMedialiveAudioTypeHearingImpaired:
                return @"HEARING_IMPAIRED";
            case AWSMedialiveAudioTypeUndefined:
                return @"UNDEFINED";
            case AWSMedialiveAudioTypeVisualImpairedCommentary:
                return @"VISUAL_IMPAIRED_COMMENTARY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)audioTypeControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSMedialiveAudioDescriptionAudioTypeControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSMedialiveAudioDescriptionAudioTypeControlUseConfigured);
        }
        return @(AWSMedialiveAudioDescriptionAudioTypeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAudioDescriptionAudioTypeControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSMedialiveAudioDescriptionAudioTypeControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAudioCodecSettings class]];
}

+ (NSValueTransformer *)languageCodeControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSMedialiveAudioDescriptionLanguageCodeControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSMedialiveAudioDescriptionLanguageCodeControlUseConfigured);
        }
        return @(AWSMedialiveAudioDescriptionLanguageCodeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAudioDescriptionLanguageCodeControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSMedialiveAudioDescriptionLanguageCodeControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)remixSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveRemixSettings class]];
}

@end

@implementation AWSMedialiveAudioLanguageSelection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"languageSelectionPolicy" : @"LanguageSelectionPolicy",
             };
}

+ (NSValueTransformer *)languageSelectionPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LOOSE"] == NSOrderedSame) {
            return @(AWSMedialiveAudioLanguageSelectionPolicyLoose);
        }
        if ([value caseInsensitiveCompare:@"STRICT"] == NSOrderedSame) {
            return @(AWSMedialiveAudioLanguageSelectionPolicyStrict);
        }
        return @(AWSMedialiveAudioLanguageSelectionPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAudioLanguageSelectionPolicyLoose:
                return @"LOOSE";
            case AWSMedialiveAudioLanguageSelectionPolicyStrict:
                return @"STRICT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveAudioNormalizationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"algorithm" : @"Algorithm",
             @"algorithmControl" : @"AlgorithmControl",
             @"targetLkfs" : @"TargetLkfs",
             };
}

+ (NSValueTransformer *)algorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ITU_1770_1"] == NSOrderedSame) {
            return @(AWSMedialiveAudioNormalizationAlgorithmItu17701);
        }
        if ([value caseInsensitiveCompare:@"ITU_1770_2"] == NSOrderedSame) {
            return @(AWSMedialiveAudioNormalizationAlgorithmItu17702);
        }
        return @(AWSMedialiveAudioNormalizationAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAudioNormalizationAlgorithmItu17701:
                return @"ITU_1770_1";
            case AWSMedialiveAudioNormalizationAlgorithmItu17702:
                return @"ITU_1770_2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)algorithmControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CORRECT_AUDIO"] == NSOrderedSame) {
            return @(AWSMedialiveAudioNormalizationAlgorithmControlCorrectAudio);
        }
        return @(AWSMedialiveAudioNormalizationAlgorithmControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAudioNormalizationAlgorithmControlCorrectAudio:
                return @"CORRECT_AUDIO";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveAudioOnlyHlsSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioGroupId" : @"AudioGroupId",
             @"audioOnlyImage" : @"AudioOnlyImage",
             @"audioTrackType" : @"AudioTrackType",
             @"segmentType" : @"SegmentType",
             };
}

+ (NSValueTransformer *)audioOnlyImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputLocation class]];
}

+ (NSValueTransformer *)audioTrackTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALTERNATE_AUDIO_AUTO_SELECT"] == NSOrderedSame) {
            return @(AWSMedialiveAudioOnlyHlsTrackTypeAlternateAudioAutoSelect);
        }
        if ([value caseInsensitiveCompare:@"ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT"] == NSOrderedSame) {
            return @(AWSMedialiveAudioOnlyHlsTrackTypeAlternateAudioAutoSelectDefault);
        }
        if ([value caseInsensitiveCompare:@"ALTERNATE_AUDIO_NOT_AUTO_SELECT"] == NSOrderedSame) {
            return @(AWSMedialiveAudioOnlyHlsTrackTypeAlternateAudioNotAutoSelect);
        }
        if ([value caseInsensitiveCompare:@"AUDIO_ONLY_VARIANT_STREAM"] == NSOrderedSame) {
            return @(AWSMedialiveAudioOnlyHlsTrackTypeAudioOnlyVariantStream);
        }
        return @(AWSMedialiveAudioOnlyHlsTrackTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAudioOnlyHlsTrackTypeAlternateAudioAutoSelect:
                return @"ALTERNATE_AUDIO_AUTO_SELECT";
            case AWSMedialiveAudioOnlyHlsTrackTypeAlternateAudioAutoSelectDefault:
                return @"ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT";
            case AWSMedialiveAudioOnlyHlsTrackTypeAlternateAudioNotAutoSelect:
                return @"ALTERNATE_AUDIO_NOT_AUTO_SELECT";
            case AWSMedialiveAudioOnlyHlsTrackTypeAudioOnlyVariantStream:
                return @"AUDIO_ONLY_VARIANT_STREAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AAC"] == NSOrderedSame) {
            return @(AWSMedialiveAudioOnlyHlsSegmentTypeAac);
        }
        if ([value caseInsensitiveCompare:@"FMP4"] == NSOrderedSame) {
            return @(AWSMedialiveAudioOnlyHlsSegmentTypeFmp4);
        }
        return @(AWSMedialiveAudioOnlyHlsSegmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAudioOnlyHlsSegmentTypeAac:
                return @"AAC";
            case AWSMedialiveAudioOnlyHlsSegmentTypeFmp4:
                return @"FMP4";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveAudioPidSelection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pid" : @"Pid",
             };
}

@end

@implementation AWSMedialiveAudioSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"selectorSettings" : @"SelectorSettings",
             };
}

+ (NSValueTransformer *)selectorSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAudioSelectorSettings class]];
}

@end

@implementation AWSMedialiveAudioSelectorSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioLanguageSelection" : @"AudioLanguageSelection",
             @"audioPidSelection" : @"AudioPidSelection",
             @"audioTrackSelection" : @"AudioTrackSelection",
             };
}

+ (NSValueTransformer *)audioLanguageSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAudioLanguageSelection class]];
}

+ (NSValueTransformer *)audioPidSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAudioPidSelection class]];
}

+ (NSValueTransformer *)audioTrackSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAudioTrackSelection class]];
}

@end

@implementation AWSMedialiveAudioTrack

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"track" : @"Track",
             };
}

@end

@implementation AWSMedialiveAudioTrackSelection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tracks" : @"Tracks",
             };
}

+ (NSValueTransformer *)tracksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveAudioTrack class]];
}

@end

@implementation AWSMedialiveAutomaticInputFailoverSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputPreference" : @"InputPreference",
             @"secondaryInputId" : @"SecondaryInputId",
             };
}

+ (NSValueTransformer *)inputPreferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQUAL_INPUT_PREFERENCE"] == NSOrderedSame) {
            return @(AWSMedialiveInputPreferenceEqualInputPreference);
        }
        if ([value caseInsensitiveCompare:@"PRIMARY_INPUT_PREFERRED"] == NSOrderedSame) {
            return @(AWSMedialiveInputPreferencePrimaryInputPreferred);
        }
        return @(AWSMedialiveInputPreferenceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputPreferenceEqualInputPreference:
                return @"EQUAL_INPUT_PREFERENCE";
            case AWSMedialiveInputPreferencePrimaryInputPreferred:
                return @"PRIMARY_INPUT_PREFERRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveAvailBlanking

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availBlankingImage" : @"AvailBlankingImage",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)availBlankingImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputLocation class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveAvailBlankingStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveAvailBlankingStateEnabled);
        }
        return @(AWSMedialiveAvailBlankingStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAvailBlankingStateDisabled:
                return @"DISABLED";
            case AWSMedialiveAvailBlankingStateEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveAvailConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availSettings" : @"AvailSettings",
             };
}

+ (NSValueTransformer *)availSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAvailSettings class]];
}

@end

@implementation AWSMedialiveAvailSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scte35SpliceInsert" : @"Scte35SpliceInsert",
             @"scte35TimeSignalApos" : @"Scte35TimeSignalApos",
             };
}

+ (NSValueTransformer *)scte35SpliceInsertJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScte35SpliceInsert class]];
}

+ (NSValueTransformer *)scte35TimeSignalAposJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScte35TimeSignalApos class]];
}

@end

@implementation AWSMedialiveBatchScheduleActionCreateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleActions" : @"ScheduleActions",
             };
}

+ (NSValueTransformer *)scheduleActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveScheduleAction class]];
}

@end

@implementation AWSMedialiveBatchScheduleActionCreateResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleActions" : @"ScheduleActions",
             };
}

+ (NSValueTransformer *)scheduleActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveScheduleAction class]];
}

@end

@implementation AWSMedialiveBatchScheduleActionDeleteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionNames" : @"ActionNames",
             };
}

@end

@implementation AWSMedialiveBatchScheduleActionDeleteResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleActions" : @"ScheduleActions",
             };
}

+ (NSValueTransformer *)scheduleActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveScheduleAction class]];
}

@end

@implementation AWSMedialiveBatchUpdateScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             @"creates" : @"Creates",
             @"deletes" : @"Deletes",
             };
}

+ (NSValueTransformer *)createsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveBatchScheduleActionCreateRequest class]];
}

+ (NSValueTransformer *)deletesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveBatchScheduleActionDeleteRequest class]];
}

@end

@implementation AWSMedialiveBatchUpdateScheduleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creates" : @"Creates",
             @"deletes" : @"Deletes",
             };
}

+ (NSValueTransformer *)createsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveBatchScheduleActionCreateResult class]];
}

+ (NSValueTransformer *)deletesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveBatchScheduleActionDeleteResult class]];
}

@end

@implementation AWSMedialiveBatchUpdateScheduleResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creates" : @"Creates",
             @"deletes" : @"Deletes",
             };
}

+ (NSValueTransformer *)createsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveBatchScheduleActionCreateResult class]];
}

+ (NSValueTransformer *)deletesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveBatchScheduleActionDeleteResult class]];
}

@end

@implementation AWSMedialiveBlackoutSlate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blackoutSlateImage" : @"BlackoutSlateImage",
             @"networkEndBlackout" : @"NetworkEndBlackout",
             @"networkEndBlackoutImage" : @"NetworkEndBlackoutImage",
             @"networkId" : @"NetworkId",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)blackoutSlateImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputLocation class]];
}

+ (NSValueTransformer *)networkEndBlackoutJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveBlackoutSlateNetworkEndBlackoutDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveBlackoutSlateNetworkEndBlackoutEnabled);
        }
        return @(AWSMedialiveBlackoutSlateNetworkEndBlackoutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveBlackoutSlateNetworkEndBlackoutDisabled:
                return @"DISABLED";
            case AWSMedialiveBlackoutSlateNetworkEndBlackoutEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)networkEndBlackoutImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputLocation class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveBlackoutSlateStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveBlackoutSlateStateEnabled);
        }
        return @(AWSMedialiveBlackoutSlateStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveBlackoutSlateStateDisabled:
                return @"DISABLED";
            case AWSMedialiveBlackoutSlateStateEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveBurnInDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alignment" : @"Alignment",
             @"backgroundColor" : @"BackgroundColor",
             @"backgroundOpacity" : @"BackgroundOpacity",
             @"font" : @"Font",
             @"fontColor" : @"FontColor",
             @"fontOpacity" : @"FontOpacity",
             @"fontResolution" : @"FontResolution",
             @"fontSize" : @"FontSize",
             @"outlineColor" : @"OutlineColor",
             @"outlineSize" : @"OutlineSize",
             @"shadowColor" : @"ShadowColor",
             @"shadowOpacity" : @"ShadowOpacity",
             @"shadowXOffset" : @"ShadowXOffset",
             @"shadowYOffset" : @"ShadowYOffset",
             @"teletextGridControl" : @"TeletextGridControl",
             @"XPosition" : @"XPosition",
             @"YPosition" : @"YPosition",
             };
}

+ (NSValueTransformer *)alignmentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CENTERED"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInAlignmentCentered);
        }
        if ([value caseInsensitiveCompare:@"LEFT"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInAlignmentLeft);
        }
        if ([value caseInsensitiveCompare:@"SMART"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInAlignmentSmart);
        }
        return @(AWSMedialiveBurnInAlignmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveBurnInAlignmentCentered:
                return @"CENTERED";
            case AWSMedialiveBurnInAlignmentLeft:
                return @"LEFT";
            case AWSMedialiveBurnInAlignmentSmart:
                return @"SMART";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)backgroundColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInBackgroundColorBlack);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInBackgroundColorNone);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInBackgroundColorWhite);
        }
        return @(AWSMedialiveBurnInBackgroundColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveBurnInBackgroundColorBlack:
                return @"BLACK";
            case AWSMedialiveBurnInBackgroundColorNone:
                return @"NONE";
            case AWSMedialiveBurnInBackgroundColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fontJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputLocation class]];
}

+ (NSValueTransformer *)fontColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInFontColorBlack);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInFontColorBlue);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInFontColorGreen);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInFontColorRed);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInFontColorWhite);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInFontColorYellow);
        }
        return @(AWSMedialiveBurnInFontColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveBurnInFontColorBlack:
                return @"BLACK";
            case AWSMedialiveBurnInFontColorBlue:
                return @"BLUE";
            case AWSMedialiveBurnInFontColorGreen:
                return @"GREEN";
            case AWSMedialiveBurnInFontColorRed:
                return @"RED";
            case AWSMedialiveBurnInFontColorWhite:
                return @"WHITE";
            case AWSMedialiveBurnInFontColorYellow:
                return @"YELLOW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outlineColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInOutlineColorBlack);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInOutlineColorBlue);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInOutlineColorGreen);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInOutlineColorRed);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInOutlineColorWhite);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInOutlineColorYellow);
        }
        return @(AWSMedialiveBurnInOutlineColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveBurnInOutlineColorBlack:
                return @"BLACK";
            case AWSMedialiveBurnInOutlineColorBlue:
                return @"BLUE";
            case AWSMedialiveBurnInOutlineColorGreen:
                return @"GREEN";
            case AWSMedialiveBurnInOutlineColorRed:
                return @"RED";
            case AWSMedialiveBurnInOutlineColorWhite:
                return @"WHITE";
            case AWSMedialiveBurnInOutlineColorYellow:
                return @"YELLOW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)shadowColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInShadowColorBlack);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInShadowColorNone);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInShadowColorWhite);
        }
        return @(AWSMedialiveBurnInShadowColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveBurnInShadowColorBlack:
                return @"BLACK";
            case AWSMedialiveBurnInShadowColorNone:
                return @"NONE";
            case AWSMedialiveBurnInShadowColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)teletextGridControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIXED"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInTeletextGridControlFixed);
        }
        if ([value caseInsensitiveCompare:@"SCALED"] == NSOrderedSame) {
            return @(AWSMedialiveBurnInTeletextGridControlScaled);
        }
        return @(AWSMedialiveBurnInTeletextGridControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveBurnInTeletextGridControlFixed:
                return @"FIXED";
            case AWSMedialiveBurnInTeletextGridControlScaled:
                return @"SCALED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveCaptionDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captionSelectorName" : @"CaptionSelectorName",
             @"destinationSettings" : @"DestinationSettings",
             @"languageCode" : @"LanguageCode",
             @"languageDescription" : @"LanguageDescription",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)destinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveCaptionDestinationSettings class]];
}

@end

@implementation AWSMedialiveCaptionDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aribDestinationSettings" : @"AribDestinationSettings",
             @"burnInDestinationSettings" : @"BurnInDestinationSettings",
             @"dvbSubDestinationSettings" : @"DvbSubDestinationSettings",
             @"embeddedDestinationSettings" : @"EmbeddedDestinationSettings",
             @"embeddedPlusScte20DestinationSettings" : @"EmbeddedPlusScte20DestinationSettings",
             @"rtmpCaptionInfoDestinationSettings" : @"RtmpCaptionInfoDestinationSettings",
             @"scte20PlusEmbeddedDestinationSettings" : @"Scte20PlusEmbeddedDestinationSettings",
             @"scte27DestinationSettings" : @"Scte27DestinationSettings",
             @"smpteTtDestinationSettings" : @"SmpteTtDestinationSettings",
             @"teletextDestinationSettings" : @"TeletextDestinationSettings",
             @"ttmlDestinationSettings" : @"TtmlDestinationSettings",
             @"webvttDestinationSettings" : @"WebvttDestinationSettings",
             };
}

+ (NSValueTransformer *)aribDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAribDestinationSettings class]];
}

+ (NSValueTransformer *)burnInDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveBurnInDestinationSettings class]];
}

+ (NSValueTransformer *)dvbSubDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveDvbSubDestinationSettings class]];
}

+ (NSValueTransformer *)embeddedDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveEmbeddedDestinationSettings class]];
}

+ (NSValueTransformer *)embeddedPlusScte20DestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveEmbeddedPlusScte20DestinationSettings class]];
}

+ (NSValueTransformer *)rtmpCaptionInfoDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveRtmpCaptionInfoDestinationSettings class]];
}

+ (NSValueTransformer *)scte20PlusEmbeddedDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScte20PlusEmbeddedDestinationSettings class]];
}

+ (NSValueTransformer *)scte27DestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScte27DestinationSettings class]];
}

+ (NSValueTransformer *)smpteTtDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveSmpteTtDestinationSettings class]];
}

+ (NSValueTransformer *)teletextDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveTeletextDestinationSettings class]];
}

+ (NSValueTransformer *)ttmlDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveTtmlDestinationSettings class]];
}

+ (NSValueTransformer *)webvttDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveWebvttDestinationSettings class]];
}

@end

@implementation AWSMedialiveCaptionLanguageMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captionChannel" : @"CaptionChannel",
             @"languageCode" : @"LanguageCode",
             @"languageDescription" : @"LanguageDescription",
             };
}

@end

@implementation AWSMedialiveCaptionSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"name" : @"Name",
             @"selectorSettings" : @"SelectorSettings",
             };
}

+ (NSValueTransformer *)selectorSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveCaptionSelectorSettings class]];
}

@end

@implementation AWSMedialiveCaptionSelectorSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aribSourceSettings" : @"AribSourceSettings",
             @"dvbSubSourceSettings" : @"DvbSubSourceSettings",
             @"embeddedSourceSettings" : @"EmbeddedSourceSettings",
             @"scte20SourceSettings" : @"Scte20SourceSettings",
             @"scte27SourceSettings" : @"Scte27SourceSettings",
             @"teletextSourceSettings" : @"TeletextSourceSettings",
             };
}

+ (NSValueTransformer *)aribSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAribSourceSettings class]];
}

+ (NSValueTransformer *)dvbSubSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveDvbSubSourceSettings class]];
}

+ (NSValueTransformer *)embeddedSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveEmbeddedSourceSettings class]];
}

+ (NSValueTransformer *)scte20SourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScte20SourceSettings class]];
}

+ (NSValueTransformer *)scte27SourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScte27SourceSettings class]];
}

+ (NSValueTransformer *)teletextSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveTeletextSourceSettings class]];
}

@end

@implementation AWSMedialiveChannel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"channelClass" : @"ChannelClass",
             @"destinations" : @"Destinations",
             @"egressEndpoints" : @"EgressEndpoints",
             @"encoderSettings" : @"EncoderSettings",
             @"identifier" : @"Id",
             @"inputAttachments" : @"InputAttachments",
             @"inputSpecification" : @"InputSpecification",
             @"logLevel" : @"LogLevel",
             @"name" : @"Name",
             @"pipelineDetails" : @"PipelineDetails",
             @"pipelinesRunningCount" : @"PipelinesRunningCount",
             @"roleArn" : @"RoleArn",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)channelClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassSinglePipeline);
        }
        return @(AWSMedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSMedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputDestination class]];
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveChannelEgressEndpoint class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDisabled);
        }
        return @(AWSMedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveLogLevelError:
                return @"ERROR";
            case AWSMedialiveLogLevelWarning:
                return @"WARNING";
            case AWSMedialiveLogLevelInfo:
                return @"INFO";
            case AWSMedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSMedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pipelineDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialivePipelineDetail class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateUpdateFailed);
        }
        return @(AWSMedialiveChannelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelStateCreating:
                return @"CREATING";
            case AWSMedialiveChannelStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSMedialiveChannelStateIdle:
                return @"IDLE";
            case AWSMedialiveChannelStateStarting:
                return @"STARTING";
            case AWSMedialiveChannelStateRunning:
                return @"RUNNING";
            case AWSMedialiveChannelStateRecovering:
                return @"RECOVERING";
            case AWSMedialiveChannelStateStopping:
                return @"STOPPING";
            case AWSMedialiveChannelStateDeleting:
                return @"DELETING";
            case AWSMedialiveChannelStateDeleted:
                return @"DELETED";
            case AWSMedialiveChannelStateUpdating:
                return @"UPDATING";
            case AWSMedialiveChannelStateUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveChannelConfigurationValidationError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"validationErrors" : @"ValidationErrors",
             };
}

+ (NSValueTransformer *)validationErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveValidationError class]];
}

@end

@implementation AWSMedialiveChannelEgressEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceIp" : @"SourceIp",
             };
}

@end

@implementation AWSMedialiveChannelSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"channelClass" : @"ChannelClass",
             @"destinations" : @"Destinations",
             @"egressEndpoints" : @"EgressEndpoints",
             @"identifier" : @"Id",
             @"inputAttachments" : @"InputAttachments",
             @"inputSpecification" : @"InputSpecification",
             @"logLevel" : @"LogLevel",
             @"name" : @"Name",
             @"pipelinesRunningCount" : @"PipelinesRunningCount",
             @"roleArn" : @"RoleArn",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)channelClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassSinglePipeline);
        }
        return @(AWSMedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSMedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputDestination class]];
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveChannelEgressEndpoint class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDisabled);
        }
        return @(AWSMedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveLogLevelError:
                return @"ERROR";
            case AWSMedialiveLogLevelWarning:
                return @"WARNING";
            case AWSMedialiveLogLevelInfo:
                return @"INFO";
            case AWSMedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSMedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateUpdateFailed);
        }
        return @(AWSMedialiveChannelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelStateCreating:
                return @"CREATING";
            case AWSMedialiveChannelStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSMedialiveChannelStateIdle:
                return @"IDLE";
            case AWSMedialiveChannelStateStarting:
                return @"STARTING";
            case AWSMedialiveChannelStateRunning:
                return @"RUNNING";
            case AWSMedialiveChannelStateRecovering:
                return @"RECOVERING";
            case AWSMedialiveChannelStateStopping:
                return @"STOPPING";
            case AWSMedialiveChannelStateDeleting:
                return @"DELETING";
            case AWSMedialiveChannelStateDeleted:
                return @"DELETED";
            case AWSMedialiveChannelStateUpdating:
                return @"UPDATING";
            case AWSMedialiveChannelStateUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveColorSpacePassthroughSettings

@end

@implementation AWSMedialiveCreateChannel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelClass" : @"ChannelClass",
             @"destinations" : @"Destinations",
             @"encoderSettings" : @"EncoderSettings",
             @"inputAttachments" : @"InputAttachments",
             @"inputSpecification" : @"InputSpecification",
             @"logLevel" : @"LogLevel",
             @"name" : @"Name",
             @"requestId" : @"RequestId",
             @"reserved" : @"Reserved",
             @"roleArn" : @"RoleArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)channelClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassSinglePipeline);
        }
        return @(AWSMedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSMedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputDestination class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDisabled);
        }
        return @(AWSMedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveLogLevelError:
                return @"ERROR";
            case AWSMedialiveLogLevelWarning:
                return @"WARNING";
            case AWSMedialiveLogLevelInfo:
                return @"INFO";
            case AWSMedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSMedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveCreateChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelClass" : @"ChannelClass",
             @"destinations" : @"Destinations",
             @"encoderSettings" : @"EncoderSettings",
             @"inputAttachments" : @"InputAttachments",
             @"inputSpecification" : @"InputSpecification",
             @"logLevel" : @"LogLevel",
             @"name" : @"Name",
             @"requestId" : @"RequestId",
             @"reserved" : @"Reserved",
             @"roleArn" : @"RoleArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)channelClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassSinglePipeline);
        }
        return @(AWSMedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSMedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputDestination class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDisabled);
        }
        return @(AWSMedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveLogLevelError:
                return @"ERROR";
            case AWSMedialiveLogLevelWarning:
                return @"WARNING";
            case AWSMedialiveLogLevelInfo:
                return @"INFO";
            case AWSMedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSMedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveCreateChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveChannel class]];
}

@end

@implementation AWSMedialiveCreateChannelResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveChannel class]];
}

@end

@implementation AWSMedialiveCreateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"Destinations",
             @"inputDevices" : @"InputDevices",
             @"inputSecurityGroups" : @"InputSecurityGroups",
             @"mediaConnectFlows" : @"MediaConnectFlows",
             @"name" : @"Name",
             @"requestId" : @"RequestId",
             @"roleArn" : @"RoleArn",
             @"sources" : @"Sources",
             @"tags" : @"Tags",
             @"types" : @"Type",
             @"vpc" : @"Vpc",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDestinationRequest class]];
}

+ (NSValueTransformer *)inputDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDeviceSettings class]];
}

+ (NSValueTransformer *)mediaConnectFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMediaConnectFlowRequest class]];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputSourceRequest class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UDP_PUSH"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeUdpPush);
        }
        if ([value caseInsensitiveCompare:@"RTP_PUSH"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeRtpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PUSH"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeRtmpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PULL"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeRtmpPull);
        }
        if ([value caseInsensitiveCompare:@"URL_PULL"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeUrlPull);
        }
        if ([value caseInsensitiveCompare:@"MP4_FILE"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeMp4File);
        }
        if ([value caseInsensitiveCompare:@"MEDIACONNECT"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeMediaconnect);
        }
        if ([value caseInsensitiveCompare:@"INPUT_DEVICE"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeInputDevice);
        }
        return @(AWSMedialiveInputTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputTypeUdpPush:
                return @"UDP_PUSH";
            case AWSMedialiveInputTypeRtpPush:
                return @"RTP_PUSH";
            case AWSMedialiveInputTypeRtmpPush:
                return @"RTMP_PUSH";
            case AWSMedialiveInputTypeRtmpPull:
                return @"RTMP_PULL";
            case AWSMedialiveInputTypeUrlPull:
                return @"URL_PULL";
            case AWSMedialiveInputTypeMp4File:
                return @"MP4_FILE";
            case AWSMedialiveInputTypeMediaconnect:
                return @"MEDIACONNECT";
            case AWSMedialiveInputTypeInputDevice:
                return @"INPUT_DEVICE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputVpcRequest class]];
}

@end

@implementation AWSMedialiveCreateInputRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"Destinations",
             @"inputDevices" : @"InputDevices",
             @"inputSecurityGroups" : @"InputSecurityGroups",
             @"mediaConnectFlows" : @"MediaConnectFlows",
             @"name" : @"Name",
             @"requestId" : @"RequestId",
             @"roleArn" : @"RoleArn",
             @"sources" : @"Sources",
             @"tags" : @"Tags",
             @"types" : @"Type",
             @"vpc" : @"Vpc",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDestinationRequest class]];
}

+ (NSValueTransformer *)inputDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDeviceSettings class]];
}

+ (NSValueTransformer *)mediaConnectFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMediaConnectFlowRequest class]];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputSourceRequest class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UDP_PUSH"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeUdpPush);
        }
        if ([value caseInsensitiveCompare:@"RTP_PUSH"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeRtpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PUSH"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeRtmpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PULL"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeRtmpPull);
        }
        if ([value caseInsensitiveCompare:@"URL_PULL"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeUrlPull);
        }
        if ([value caseInsensitiveCompare:@"MP4_FILE"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeMp4File);
        }
        if ([value caseInsensitiveCompare:@"MEDIACONNECT"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeMediaconnect);
        }
        if ([value caseInsensitiveCompare:@"INPUT_DEVICE"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeInputDevice);
        }
        return @(AWSMedialiveInputTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputTypeUdpPush:
                return @"UDP_PUSH";
            case AWSMedialiveInputTypeRtpPush:
                return @"RTP_PUSH";
            case AWSMedialiveInputTypeRtmpPush:
                return @"RTMP_PUSH";
            case AWSMedialiveInputTypeRtmpPull:
                return @"RTMP_PULL";
            case AWSMedialiveInputTypeUrlPull:
                return @"URL_PULL";
            case AWSMedialiveInputTypeMp4File:
                return @"MP4_FILE";
            case AWSMedialiveInputTypeMediaconnect:
                return @"MEDIACONNECT";
            case AWSMedialiveInputTypeInputDevice:
                return @"INPUT_DEVICE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputVpcRequest class]];
}

@end

@implementation AWSMedialiveCreateInputResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInput class]];
}

@end

@implementation AWSMedialiveCreateInputResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInput class]];
}

@end

@implementation AWSMedialiveCreateInputSecurityGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             @"whitelistRules" : @"WhitelistRules",
             };
}

+ (NSValueTransformer *)whitelistRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputWhitelistRuleCidr class]];
}

@end

@implementation AWSMedialiveCreateInputSecurityGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroup" : @"SecurityGroup",
             };
}

+ (NSValueTransformer *)securityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSecurityGroup class]];
}

@end

@implementation AWSMedialiveCreateInputSecurityGroupResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroup" : @"SecurityGroup",
             };
}

+ (NSValueTransformer *)securityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSecurityGroup class]];
}

@end

@implementation AWSMedialiveCreateMultiplex

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"multiplexSettings" : @"MultiplexSettings",
             @"name" : @"Name",
             @"requestId" : @"RequestId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexSettings class]];
}

@end

@implementation AWSMedialiveCreateMultiplexProgram

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             @"programName" : @"ProgramName",
             @"requestId" : @"RequestId",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgramSettings class]];
}

@end

@implementation AWSMedialiveCreateMultiplexProgramRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             @"programName" : @"ProgramName",
             @"requestId" : @"RequestId",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgramSettings class]];
}

@end

@implementation AWSMedialiveCreateMultiplexProgramResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexProgram" : @"MultiplexProgram",
             };
}

+ (NSValueTransformer *)multiplexProgramJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgram class]];
}

@end

@implementation AWSMedialiveCreateMultiplexProgramResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexProgram" : @"MultiplexProgram",
             };
}

+ (NSValueTransformer *)multiplexProgramJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgram class]];
}

@end

@implementation AWSMedialiveCreateMultiplexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             @"multiplexSettings" : @"MultiplexSettings",
             @"name" : @"Name",
             @"requestId" : @"RequestId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexSettings class]];
}

@end

@implementation AWSMedialiveCreateMultiplexResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplex" : @"Multiplex",
             };
}

+ (NSValueTransformer *)multiplexJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplex class]];
}

@end

@implementation AWSMedialiveCreateMultiplexResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplex" : @"Multiplex",
             };
}

+ (NSValueTransformer *)multiplexJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplex class]];
}

@end

@implementation AWSMedialiveCreateTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSMedialiveDeleteChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             };
}

@end

@implementation AWSMedialiveDeleteChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"channelClass" : @"ChannelClass",
             @"destinations" : @"Destinations",
             @"egressEndpoints" : @"EgressEndpoints",
             @"encoderSettings" : @"EncoderSettings",
             @"identifier" : @"Id",
             @"inputAttachments" : @"InputAttachments",
             @"inputSpecification" : @"InputSpecification",
             @"logLevel" : @"LogLevel",
             @"name" : @"Name",
             @"pipelineDetails" : @"PipelineDetails",
             @"pipelinesRunningCount" : @"PipelinesRunningCount",
             @"roleArn" : @"RoleArn",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)channelClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassSinglePipeline);
        }
        return @(AWSMedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSMedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputDestination class]];
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveChannelEgressEndpoint class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDisabled);
        }
        return @(AWSMedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveLogLevelError:
                return @"ERROR";
            case AWSMedialiveLogLevelWarning:
                return @"WARNING";
            case AWSMedialiveLogLevelInfo:
                return @"INFO";
            case AWSMedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSMedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pipelineDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialivePipelineDetail class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateUpdateFailed);
        }
        return @(AWSMedialiveChannelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelStateCreating:
                return @"CREATING";
            case AWSMedialiveChannelStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSMedialiveChannelStateIdle:
                return @"IDLE";
            case AWSMedialiveChannelStateStarting:
                return @"STARTING";
            case AWSMedialiveChannelStateRunning:
                return @"RUNNING";
            case AWSMedialiveChannelStateRecovering:
                return @"RECOVERING";
            case AWSMedialiveChannelStateStopping:
                return @"STOPPING";
            case AWSMedialiveChannelStateDeleting:
                return @"DELETING";
            case AWSMedialiveChannelStateDeleted:
                return @"DELETED";
            case AWSMedialiveChannelStateUpdating:
                return @"UPDATING";
            case AWSMedialiveChannelStateUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveDeleteInputRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputId" : @"InputId",
             };
}

@end

@implementation AWSMedialiveDeleteInputResponse

@end

@implementation AWSMedialiveDeleteInputSecurityGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputSecurityGroupId" : @"InputSecurityGroupId",
             };
}

@end

@implementation AWSMedialiveDeleteInputSecurityGroupResponse

@end

@implementation AWSMedialiveDeleteMultiplexProgramRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             @"programName" : @"ProgramName",
             };
}

@end

@implementation AWSMedialiveDeleteMultiplexProgramResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             @"packetIdentifiersMap" : @"PacketIdentifiersMap",
             @"programName" : @"ProgramName",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgramSettings class]];
}

+ (NSValueTransformer *)packetIdentifiersMapJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgramPacketIdentifiersMap class]];
}

@end

@implementation AWSMedialiveDeleteMultiplexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             };
}

@end

@implementation AWSMedialiveDeleteMultiplexResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"availabilityZones" : @"AvailabilityZones",
             @"destinations" : @"Destinations",
             @"identifier" : @"Id",
             @"multiplexSettings" : @"MultiplexSettings",
             @"name" : @"Name",
             @"pipelinesRunningCount" : @"PipelinesRunningCount",
             @"programCount" : @"ProgramCount",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMultiplexOutputDestination class]];
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexSettings class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateDeleted);
        }
        return @(AWSMedialiveMultiplexStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveMultiplexStateCreating:
                return @"CREATING";
            case AWSMedialiveMultiplexStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSMedialiveMultiplexStateIdle:
                return @"IDLE";
            case AWSMedialiveMultiplexStateStarting:
                return @"STARTING";
            case AWSMedialiveMultiplexStateRunning:
                return @"RUNNING";
            case AWSMedialiveMultiplexStateRecovering:
                return @"RECOVERING";
            case AWSMedialiveMultiplexStateStopping:
                return @"STOPPING";
            case AWSMedialiveMultiplexStateDeleting:
                return @"DELETING";
            case AWSMedialiveMultiplexStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveDeleteReservationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservationId" : @"ReservationId",
             };
}

@end

@implementation AWSMedialiveDeleteReservationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"count" : @"Count",
             @"currencyCode" : @"CurrencyCode",
             @"duration" : @"Duration",
             @"durationUnits" : @"DurationUnits",
             @"end" : @"End",
             @"fixedPrice" : @"FixedPrice",
             @"name" : @"Name",
             @"offeringDescription" : @"OfferingDescription",
             @"offeringId" : @"OfferingId",
             @"offeringType" : @"OfferingType",
             @"region" : @"Region",
             @"reservationId" : @"ReservationId",
             @"resourceSpecification" : @"ResourceSpecification",
             @"start" : @"Start",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)durationUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MONTHS"] == NSOrderedSame) {
            return @(AWSMedialiveOfferingDurationUnitsMonths);
        }
        return @(AWSMedialiveOfferingDurationUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveOfferingDurationUnitsMonths:
                return @"MONTHS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSMedialiveOfferingTypeNoUpfront);
        }
        return @(AWSMedialiveOfferingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveOfferingTypeNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveReservationResourceSpecification class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSMedialiveReservationStateActive);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSMedialiveReservationStateExpired);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSMedialiveReservationStateCanceled);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveReservationStateDeleted);
        }
        return @(AWSMedialiveReservationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveReservationStateActive:
                return @"ACTIVE";
            case AWSMedialiveReservationStateExpired:
                return @"EXPIRED";
            case AWSMedialiveReservationStateCanceled:
                return @"CANCELED";
            case AWSMedialiveReservationStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveDeleteScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             };
}

@end

@implementation AWSMedialiveDeleteScheduleResponse

@end

@implementation AWSMedialiveDeleteTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSMedialiveDescribeChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             };
}

@end

@implementation AWSMedialiveDescribeChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"channelClass" : @"ChannelClass",
             @"destinations" : @"Destinations",
             @"egressEndpoints" : @"EgressEndpoints",
             @"encoderSettings" : @"EncoderSettings",
             @"identifier" : @"Id",
             @"inputAttachments" : @"InputAttachments",
             @"inputSpecification" : @"InputSpecification",
             @"logLevel" : @"LogLevel",
             @"name" : @"Name",
             @"pipelineDetails" : @"PipelineDetails",
             @"pipelinesRunningCount" : @"PipelinesRunningCount",
             @"roleArn" : @"RoleArn",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)channelClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassSinglePipeline);
        }
        return @(AWSMedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSMedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputDestination class]];
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveChannelEgressEndpoint class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDisabled);
        }
        return @(AWSMedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveLogLevelError:
                return @"ERROR";
            case AWSMedialiveLogLevelWarning:
                return @"WARNING";
            case AWSMedialiveLogLevelInfo:
                return @"INFO";
            case AWSMedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSMedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pipelineDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialivePipelineDetail class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateUpdateFailed);
        }
        return @(AWSMedialiveChannelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelStateCreating:
                return @"CREATING";
            case AWSMedialiveChannelStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSMedialiveChannelStateIdle:
                return @"IDLE";
            case AWSMedialiveChannelStateStarting:
                return @"STARTING";
            case AWSMedialiveChannelStateRunning:
                return @"RUNNING";
            case AWSMedialiveChannelStateRecovering:
                return @"RECOVERING";
            case AWSMedialiveChannelStateStopping:
                return @"STOPPING";
            case AWSMedialiveChannelStateDeleting:
                return @"DELETING";
            case AWSMedialiveChannelStateDeleted:
                return @"DELETED";
            case AWSMedialiveChannelStateUpdating:
                return @"UPDATING";
            case AWSMedialiveChannelStateUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveDescribeInputDeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputDeviceId" : @"InputDeviceId",
             };
}

@end

@implementation AWSMedialiveDescribeInputDeviceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"connectionState" : @"ConnectionState",
             @"deviceSettingsSyncState" : @"DeviceSettingsSyncState",
             @"hdDeviceSettings" : @"HdDeviceSettings",
             @"identifier" : @"Id",
             @"macAddress" : @"MacAddress",
             @"name" : @"Name",
             @"networkSettings" : @"NetworkSettings",
             @"serialNumber" : @"SerialNumber",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)connectionStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISCONNECTED"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConnectionStateDisconnected);
        }
        if ([value caseInsensitiveCompare:@"CONNECTED"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConnectionStateConnected);
        }
        return @(AWSMedialiveInputDeviceConnectionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceConnectionStateDisconnected:
                return @"DISCONNECTED";
            case AWSMedialiveInputDeviceConnectionStateConnected:
                return @"CONNECTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deviceSettingsSyncStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYNCED"] == NSOrderedSame) {
            return @(AWSMedialiveDeviceSettingsSyncStateSynced);
        }
        if ([value caseInsensitiveCompare:@"SYNCING"] == NSOrderedSame) {
            return @(AWSMedialiveDeviceSettingsSyncStateSyncing);
        }
        return @(AWSMedialiveDeviceSettingsSyncStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveDeviceSettingsSyncStateSynced:
                return @"SYNCED";
            case AWSMedialiveDeviceSettingsSyncStateSyncing:
                return @"SYNCING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hdDeviceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputDeviceHdSettings class]];
}

+ (NSValueTransformer *)networkSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputDeviceNetworkSettings class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HD"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceTypeHd);
        }
        return @(AWSMedialiveInputDeviceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceTypeHd:
                return @"HD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveDescribeInputRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputId" : @"InputId",
             };
}

@end

@implementation AWSMedialiveDescribeInputResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"attachedChannels" : @"AttachedChannels",
             @"destinations" : @"Destinations",
             @"identifier" : @"Id",
             @"inputClass" : @"InputClass",
             @"inputDevices" : @"InputDevices",
             @"inputSourceType" : @"InputSourceType",
             @"mediaConnectFlows" : @"MediaConnectFlows",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"securityGroups" : @"SecurityGroups",
             @"sources" : @"Sources",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDestination class]];
}

+ (NSValueTransformer *)inputClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveInputClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSMedialiveInputClassSinglePipeline);
        }
        return @(AWSMedialiveInputClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputClassStandard:
                return @"STANDARD";
            case AWSMedialiveInputClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDeviceSettings class]];
}

+ (NSValueTransformer *)inputSourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSMedialiveInputSourceTypeStatic);
        }
        if ([value caseInsensitiveCompare:@"DYNAMIC"] == NSOrderedSame) {
            return @(AWSMedialiveInputSourceTypeDynamic);
        }
        return @(AWSMedialiveInputSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputSourceTypeStatic:
                return @"STATIC";
            case AWSMedialiveInputSourceTypeDynamic:
                return @"DYNAMIC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mediaConnectFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMediaConnectFlow class]];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputSource class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveInputStateCreating);
        }
        if ([value caseInsensitiveCompare:@"DETACHED"] == NSOrderedSame) {
            return @(AWSMedialiveInputStateDetached);
        }
        if ([value caseInsensitiveCompare:@"ATTACHED"] == NSOrderedSame) {
            return @(AWSMedialiveInputStateAttached);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveInputStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveInputStateDeleted);
        }
        return @(AWSMedialiveInputStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputStateCreating:
                return @"CREATING";
            case AWSMedialiveInputStateDetached:
                return @"DETACHED";
            case AWSMedialiveInputStateAttached:
                return @"ATTACHED";
            case AWSMedialiveInputStateDeleting:
                return @"DELETING";
            case AWSMedialiveInputStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UDP_PUSH"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeUdpPush);
        }
        if ([value caseInsensitiveCompare:@"RTP_PUSH"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeRtpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PUSH"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeRtmpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PULL"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeRtmpPull);
        }
        if ([value caseInsensitiveCompare:@"URL_PULL"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeUrlPull);
        }
        if ([value caseInsensitiveCompare:@"MP4_FILE"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeMp4File);
        }
        if ([value caseInsensitiveCompare:@"MEDIACONNECT"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeMediaconnect);
        }
        if ([value caseInsensitiveCompare:@"INPUT_DEVICE"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeInputDevice);
        }
        return @(AWSMedialiveInputTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputTypeUdpPush:
                return @"UDP_PUSH";
            case AWSMedialiveInputTypeRtpPush:
                return @"RTP_PUSH";
            case AWSMedialiveInputTypeRtmpPush:
                return @"RTMP_PUSH";
            case AWSMedialiveInputTypeRtmpPull:
                return @"RTMP_PULL";
            case AWSMedialiveInputTypeUrlPull:
                return @"URL_PULL";
            case AWSMedialiveInputTypeMp4File:
                return @"MP4_FILE";
            case AWSMedialiveInputTypeMediaconnect:
                return @"MEDIACONNECT";
            case AWSMedialiveInputTypeInputDevice:
                return @"INPUT_DEVICE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveDescribeInputSecurityGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputSecurityGroupId" : @"InputSecurityGroupId",
             };
}

@end

@implementation AWSMedialiveDescribeInputSecurityGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"inputs" : @"Inputs",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"whitelistRules" : @"WhitelistRules",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveInputSecurityGroupStateIdle);
        }
        if ([value caseInsensitiveCompare:@"IN_USE"] == NSOrderedSame) {
            return @(AWSMedialiveInputSecurityGroupStateInUse);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSMedialiveInputSecurityGroupStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveInputSecurityGroupStateDeleted);
        }
        return @(AWSMedialiveInputSecurityGroupStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputSecurityGroupStateIdle:
                return @"IDLE";
            case AWSMedialiveInputSecurityGroupStateInUse:
                return @"IN_USE";
            case AWSMedialiveInputSecurityGroupStateUpdating:
                return @"UPDATING";
            case AWSMedialiveInputSecurityGroupStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)whitelistRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputWhitelistRule class]];
}

@end

@implementation AWSMedialiveDescribeMultiplexProgramRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             @"programName" : @"ProgramName",
             };
}

@end

@implementation AWSMedialiveDescribeMultiplexProgramResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             @"packetIdentifiersMap" : @"PacketIdentifiersMap",
             @"programName" : @"ProgramName",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgramSettings class]];
}

+ (NSValueTransformer *)packetIdentifiersMapJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgramPacketIdentifiersMap class]];
}

@end

@implementation AWSMedialiveDescribeMultiplexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             };
}

@end

@implementation AWSMedialiveDescribeMultiplexResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"availabilityZones" : @"AvailabilityZones",
             @"destinations" : @"Destinations",
             @"identifier" : @"Id",
             @"multiplexSettings" : @"MultiplexSettings",
             @"name" : @"Name",
             @"pipelinesRunningCount" : @"PipelinesRunningCount",
             @"programCount" : @"ProgramCount",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMultiplexOutputDestination class]];
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexSettings class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateDeleted);
        }
        return @(AWSMedialiveMultiplexStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveMultiplexStateCreating:
                return @"CREATING";
            case AWSMedialiveMultiplexStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSMedialiveMultiplexStateIdle:
                return @"IDLE";
            case AWSMedialiveMultiplexStateStarting:
                return @"STARTING";
            case AWSMedialiveMultiplexStateRunning:
                return @"RUNNING";
            case AWSMedialiveMultiplexStateRecovering:
                return @"RECOVERING";
            case AWSMedialiveMultiplexStateStopping:
                return @"STOPPING";
            case AWSMedialiveMultiplexStateDeleting:
                return @"DELETING";
            case AWSMedialiveMultiplexStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveDescribeOfferingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"offeringId" : @"OfferingId",
             };
}

@end

@implementation AWSMedialiveDescribeOfferingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"currencyCode" : @"CurrencyCode",
             @"duration" : @"Duration",
             @"durationUnits" : @"DurationUnits",
             @"fixedPrice" : @"FixedPrice",
             @"offeringDescription" : @"OfferingDescription",
             @"offeringId" : @"OfferingId",
             @"offeringType" : @"OfferingType",
             @"region" : @"Region",
             @"resourceSpecification" : @"ResourceSpecification",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)durationUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MONTHS"] == NSOrderedSame) {
            return @(AWSMedialiveOfferingDurationUnitsMonths);
        }
        return @(AWSMedialiveOfferingDurationUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveOfferingDurationUnitsMonths:
                return @"MONTHS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSMedialiveOfferingTypeNoUpfront);
        }
        return @(AWSMedialiveOfferingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveOfferingTypeNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveReservationResourceSpecification class]];
}

@end

@implementation AWSMedialiveDescribeReservationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservationId" : @"ReservationId",
             };
}

@end

@implementation AWSMedialiveDescribeReservationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"count" : @"Count",
             @"currencyCode" : @"CurrencyCode",
             @"duration" : @"Duration",
             @"durationUnits" : @"DurationUnits",
             @"end" : @"End",
             @"fixedPrice" : @"FixedPrice",
             @"name" : @"Name",
             @"offeringDescription" : @"OfferingDescription",
             @"offeringId" : @"OfferingId",
             @"offeringType" : @"OfferingType",
             @"region" : @"Region",
             @"reservationId" : @"ReservationId",
             @"resourceSpecification" : @"ResourceSpecification",
             @"start" : @"Start",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)durationUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MONTHS"] == NSOrderedSame) {
            return @(AWSMedialiveOfferingDurationUnitsMonths);
        }
        return @(AWSMedialiveOfferingDurationUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveOfferingDurationUnitsMonths:
                return @"MONTHS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSMedialiveOfferingTypeNoUpfront);
        }
        return @(AWSMedialiveOfferingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveOfferingTypeNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveReservationResourceSpecification class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSMedialiveReservationStateActive);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSMedialiveReservationStateExpired);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSMedialiveReservationStateCanceled);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveReservationStateDeleted);
        }
        return @(AWSMedialiveReservationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveReservationStateActive:
                return @"ACTIVE";
            case AWSMedialiveReservationStateExpired:
                return @"EXPIRED";
            case AWSMedialiveReservationStateCanceled:
                return @"CANCELED";
            case AWSMedialiveReservationStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveDescribeScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSMedialiveDescribeScheduleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scheduleActions" : @"ScheduleActions",
             };
}

+ (NSValueTransformer *)scheduleActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveScheduleAction class]];
}

@end

@implementation AWSMedialiveDvbNitSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkId" : @"NetworkId",
             @"networkName" : @"NetworkName",
             @"repInterval" : @"RepInterval",
             };
}

@end

@implementation AWSMedialiveDvbSdtSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"outputSdt" : @"OutputSdt",
             @"repInterval" : @"RepInterval",
             @"serviceName" : @"ServiceName",
             @"serviceProviderName" : @"ServiceProviderName",
             };
}

+ (NSValueTransformer *)outputSdtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SDT_FOLLOW"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSdtOutputSdtSdtFollow);
        }
        if ([value caseInsensitiveCompare:@"SDT_FOLLOW_IF_PRESENT"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSdtOutputSdtSdtFollowIfPresent);
        }
        if ([value caseInsensitiveCompare:@"SDT_MANUAL"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSdtOutputSdtSdtManual);
        }
        if ([value caseInsensitiveCompare:@"SDT_NONE"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSdtOutputSdtSdtNone);
        }
        return @(AWSMedialiveDvbSdtOutputSdtUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveDvbSdtOutputSdtSdtFollow:
                return @"SDT_FOLLOW";
            case AWSMedialiveDvbSdtOutputSdtSdtFollowIfPresent:
                return @"SDT_FOLLOW_IF_PRESENT";
            case AWSMedialiveDvbSdtOutputSdtSdtManual:
                return @"SDT_MANUAL";
            case AWSMedialiveDvbSdtOutputSdtSdtNone:
                return @"SDT_NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveDvbSubDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alignment" : @"Alignment",
             @"backgroundColor" : @"BackgroundColor",
             @"backgroundOpacity" : @"BackgroundOpacity",
             @"font" : @"Font",
             @"fontColor" : @"FontColor",
             @"fontOpacity" : @"FontOpacity",
             @"fontResolution" : @"FontResolution",
             @"fontSize" : @"FontSize",
             @"outlineColor" : @"OutlineColor",
             @"outlineSize" : @"OutlineSize",
             @"shadowColor" : @"ShadowColor",
             @"shadowOpacity" : @"ShadowOpacity",
             @"shadowXOffset" : @"ShadowXOffset",
             @"shadowYOffset" : @"ShadowYOffset",
             @"teletextGridControl" : @"TeletextGridControl",
             @"XPosition" : @"XPosition",
             @"YPosition" : @"YPosition",
             };
}

+ (NSValueTransformer *)alignmentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CENTERED"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationAlignmentCentered);
        }
        if ([value caseInsensitiveCompare:@"LEFT"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationAlignmentLeft);
        }
        if ([value caseInsensitiveCompare:@"SMART"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationAlignmentSmart);
        }
        return @(AWSMedialiveDvbSubDestinationAlignmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveDvbSubDestinationAlignmentCentered:
                return @"CENTERED";
            case AWSMedialiveDvbSubDestinationAlignmentLeft:
                return @"LEFT";
            case AWSMedialiveDvbSubDestinationAlignmentSmart:
                return @"SMART";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)backgroundColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationBackgroundColorBlack);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationBackgroundColorNone);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationBackgroundColorWhite);
        }
        return @(AWSMedialiveDvbSubDestinationBackgroundColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveDvbSubDestinationBackgroundColorBlack:
                return @"BLACK";
            case AWSMedialiveDvbSubDestinationBackgroundColorNone:
                return @"NONE";
            case AWSMedialiveDvbSubDestinationBackgroundColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fontJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputLocation class]];
}

+ (NSValueTransformer *)fontColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationFontColorBlack);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationFontColorBlue);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationFontColorGreen);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationFontColorRed);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationFontColorWhite);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationFontColorYellow);
        }
        return @(AWSMedialiveDvbSubDestinationFontColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveDvbSubDestinationFontColorBlack:
                return @"BLACK";
            case AWSMedialiveDvbSubDestinationFontColorBlue:
                return @"BLUE";
            case AWSMedialiveDvbSubDestinationFontColorGreen:
                return @"GREEN";
            case AWSMedialiveDvbSubDestinationFontColorRed:
                return @"RED";
            case AWSMedialiveDvbSubDestinationFontColorWhite:
                return @"WHITE";
            case AWSMedialiveDvbSubDestinationFontColorYellow:
                return @"YELLOW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outlineColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationOutlineColorBlack);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationOutlineColorBlue);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationOutlineColorGreen);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationOutlineColorRed);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationOutlineColorWhite);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationOutlineColorYellow);
        }
        return @(AWSMedialiveDvbSubDestinationOutlineColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveDvbSubDestinationOutlineColorBlack:
                return @"BLACK";
            case AWSMedialiveDvbSubDestinationOutlineColorBlue:
                return @"BLUE";
            case AWSMedialiveDvbSubDestinationOutlineColorGreen:
                return @"GREEN";
            case AWSMedialiveDvbSubDestinationOutlineColorRed:
                return @"RED";
            case AWSMedialiveDvbSubDestinationOutlineColorWhite:
                return @"WHITE";
            case AWSMedialiveDvbSubDestinationOutlineColorYellow:
                return @"YELLOW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)shadowColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationShadowColorBlack);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationShadowColorNone);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationShadowColorWhite);
        }
        return @(AWSMedialiveDvbSubDestinationShadowColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveDvbSubDestinationShadowColorBlack:
                return @"BLACK";
            case AWSMedialiveDvbSubDestinationShadowColorNone:
                return @"NONE";
            case AWSMedialiveDvbSubDestinationShadowColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)teletextGridControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIXED"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationTeletextGridControlFixed);
        }
        if ([value caseInsensitiveCompare:@"SCALED"] == NSOrderedSame) {
            return @(AWSMedialiveDvbSubDestinationTeletextGridControlScaled);
        }
        return @(AWSMedialiveDvbSubDestinationTeletextGridControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveDvbSubDestinationTeletextGridControlFixed:
                return @"FIXED";
            case AWSMedialiveDvbSubDestinationTeletextGridControlScaled:
                return @"SCALED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveDvbSubSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pid" : @"Pid",
             };
}

@end

@implementation AWSMedialiveDvbTdtSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repInterval" : @"RepInterval",
             };
}

@end

@implementation AWSMedialiveEac3Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attenuationControl" : @"AttenuationControl",
             @"bitrate" : @"Bitrate",
             @"bitstreamMode" : @"BitstreamMode",
             @"codingMode" : @"CodingMode",
             @"dcFilter" : @"DcFilter",
             @"dialnorm" : @"Dialnorm",
             @"drcLine" : @"DrcLine",
             @"drcRf" : @"DrcRf",
             @"lfeControl" : @"LfeControl",
             @"lfeFilter" : @"LfeFilter",
             @"loRoCenterMixLevel" : @"LoRoCenterMixLevel",
             @"loRoSurroundMixLevel" : @"LoRoSurroundMixLevel",
             @"ltRtCenterMixLevel" : @"LtRtCenterMixLevel",
             @"ltRtSurroundMixLevel" : @"LtRtSurroundMixLevel",
             @"metadataControl" : @"MetadataControl",
             @"passthroughControl" : @"PassthroughControl",
             @"phaseControl" : @"PhaseControl",
             @"stereoDownmix" : @"StereoDownmix",
             @"surroundExMode" : @"SurroundExMode",
             @"surroundMode" : @"SurroundMode",
             };
}

+ (NSValueTransformer *)attenuationControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ATTENUATE_3_DB"] == NSOrderedSame) {
            return @(AWSMedialiveEac3AttenuationControlAttenuate3Db);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveEac3AttenuationControlNone);
        }
        return @(AWSMedialiveEac3AttenuationControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3AttenuationControlAttenuate3Db:
                return @"ATTENUATE_3_DB";
            case AWSMedialiveEac3AttenuationControlNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bitstreamModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMMENTARY"] == NSOrderedSame) {
            return @(AWSMedialiveEac3BitstreamModeCommentary);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE_MAIN"] == NSOrderedSame) {
            return @(AWSMedialiveEac3BitstreamModeCompleteMain);
        }
        if ([value caseInsensitiveCompare:@"EMERGENCY"] == NSOrderedSame) {
            return @(AWSMedialiveEac3BitstreamModeEmergency);
        }
        if ([value caseInsensitiveCompare:@"HEARING_IMPAIRED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3BitstreamModeHearingImpaired);
        }
        if ([value caseInsensitiveCompare:@"VISUALLY_IMPAIRED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3BitstreamModeVisuallyImpaired);
        }
        return @(AWSMedialiveEac3BitstreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3BitstreamModeCommentary:
                return @"COMMENTARY";
            case AWSMedialiveEac3BitstreamModeCompleteMain:
                return @"COMPLETE_MAIN";
            case AWSMedialiveEac3BitstreamModeEmergency:
                return @"EMERGENCY";
            case AWSMedialiveEac3BitstreamModeHearingImpaired:
                return @"HEARING_IMPAIRED";
            case AWSMedialiveEac3BitstreamModeVisuallyImpaired:
                return @"VISUALLY_IMPAIRED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_0"] == NSOrderedSame) {
            return @(AWSMedialiveEac3CodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSMedialiveEac3CodingModeCodingMode20);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_3_2"] == NSOrderedSame) {
            return @(AWSMedialiveEac3CodingModeCodingMode32);
        }
        return @(AWSMedialiveEac3CodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3CodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSMedialiveEac3CodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            case AWSMedialiveEac3CodingModeCodingMode32:
                return @"CODING_MODE_3_2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dcFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DcFilterDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DcFilterEnabled);
        }
        return @(AWSMedialiveEac3DcFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3DcFilterDisabled:
                return @"DISABLED";
            case AWSMedialiveEac3DcFilterEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)drcLineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILM_LIGHT"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DrcLineFilmLight);
        }
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DrcLineFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_LIGHT"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DrcLineMusicLight);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DrcLineMusicStandard);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DrcLineNone);
        }
        if ([value caseInsensitiveCompare:@"SPEECH"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DrcLineSpeech);
        }
        return @(AWSMedialiveEac3DrcLineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3DrcLineFilmLight:
                return @"FILM_LIGHT";
            case AWSMedialiveEac3DrcLineFilmStandard:
                return @"FILM_STANDARD";
            case AWSMedialiveEac3DrcLineMusicLight:
                return @"MUSIC_LIGHT";
            case AWSMedialiveEac3DrcLineMusicStandard:
                return @"MUSIC_STANDARD";
            case AWSMedialiveEac3DrcLineNone:
                return @"NONE";
            case AWSMedialiveEac3DrcLineSpeech:
                return @"SPEECH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)drcRfJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILM_LIGHT"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DrcRfFilmLight);
        }
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DrcRfFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_LIGHT"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DrcRfMusicLight);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DrcRfMusicStandard);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DrcRfNone);
        }
        if ([value caseInsensitiveCompare:@"SPEECH"] == NSOrderedSame) {
            return @(AWSMedialiveEac3DrcRfSpeech);
        }
        return @(AWSMedialiveEac3DrcRfUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3DrcRfFilmLight:
                return @"FILM_LIGHT";
            case AWSMedialiveEac3DrcRfFilmStandard:
                return @"FILM_STANDARD";
            case AWSMedialiveEac3DrcRfMusicLight:
                return @"MUSIC_LIGHT";
            case AWSMedialiveEac3DrcRfMusicStandard:
                return @"MUSIC_STANDARD";
            case AWSMedialiveEac3DrcRfNone:
                return @"NONE";
            case AWSMedialiveEac3DrcRfSpeech:
                return @"SPEECH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lfeControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LFE"] == NSOrderedSame) {
            return @(AWSMedialiveEac3LfeControlLfe);
        }
        if ([value caseInsensitiveCompare:@"NO_LFE"] == NSOrderedSame) {
            return @(AWSMedialiveEac3LfeControlNoLfe);
        }
        return @(AWSMedialiveEac3LfeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3LfeControlLfe:
                return @"LFE";
            case AWSMedialiveEac3LfeControlNoLfe:
                return @"NO_LFE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lfeFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3LfeFilterDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3LfeFilterEnabled);
        }
        return @(AWSMedialiveEac3LfeFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3LfeFilterDisabled:
                return @"DISABLED";
            case AWSMedialiveEac3LfeFilterEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metadataControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSMedialiveEac3MetadataControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3MetadataControlUseConfigured);
        }
        return @(AWSMedialiveEac3MetadataControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3MetadataControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSMedialiveEac3MetadataControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)passthroughControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveEac3PassthroughControlNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"WHEN_POSSIBLE"] == NSOrderedSame) {
            return @(AWSMedialiveEac3PassthroughControlWhenPossible);
        }
        return @(AWSMedialiveEac3PassthroughControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3PassthroughControlNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSMedialiveEac3PassthroughControlWhenPossible:
                return @"WHEN_POSSIBLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)phaseControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_SHIFT"] == NSOrderedSame) {
            return @(AWSMedialiveEac3PhaseControlNoShift);
        }
        if ([value caseInsensitiveCompare:@"SHIFT_90_DEGREES"] == NSOrderedSame) {
            return @(AWSMedialiveEac3PhaseControlShift90Degrees);
        }
        return @(AWSMedialiveEac3PhaseControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3PhaseControlNoShift:
                return @"NO_SHIFT";
            case AWSMedialiveEac3PhaseControlShift90Degrees:
                return @"SHIFT_90_DEGREES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stereoDownmixJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DPL2"] == NSOrderedSame) {
            return @(AWSMedialiveEac3StereoDownmixDpl2);
        }
        if ([value caseInsensitiveCompare:@"LO_RO"] == NSOrderedSame) {
            return @(AWSMedialiveEac3StereoDownmixLoRo);
        }
        if ([value caseInsensitiveCompare:@"LT_RT"] == NSOrderedSame) {
            return @(AWSMedialiveEac3StereoDownmixLtRt);
        }
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3StereoDownmixNotIndicated);
        }
        return @(AWSMedialiveEac3StereoDownmixUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3StereoDownmixDpl2:
                return @"DPL2";
            case AWSMedialiveEac3StereoDownmixLoRo:
                return @"LO_RO";
            case AWSMedialiveEac3StereoDownmixLtRt:
                return @"LT_RT";
            case AWSMedialiveEac3StereoDownmixNotIndicated:
                return @"NOT_INDICATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)surroundExModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3SurroundExModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3SurroundExModeEnabled);
        }
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3SurroundExModeNotIndicated);
        }
        return @(AWSMedialiveEac3SurroundExModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3SurroundExModeDisabled:
                return @"DISABLED";
            case AWSMedialiveEac3SurroundExModeEnabled:
                return @"ENABLED";
            case AWSMedialiveEac3SurroundExModeNotIndicated:
                return @"NOT_INDICATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)surroundModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3SurroundModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3SurroundModeEnabled);
        }
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSMedialiveEac3SurroundModeNotIndicated);
        }
        return @(AWSMedialiveEac3SurroundModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEac3SurroundModeDisabled:
                return @"DISABLED";
            case AWSMedialiveEac3SurroundModeEnabled:
                return @"ENABLED";
            case AWSMedialiveEac3SurroundModeNotIndicated:
                return @"NOT_INDICATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveEmbeddedDestinationSettings

@end

@implementation AWSMedialiveEmbeddedPlusScte20DestinationSettings

@end

@implementation AWSMedialiveEmbeddedSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"convert608To708" : @"Convert608To708",
             @"scte20Detection" : @"Scte20Detection",
             @"source608ChannelNumber" : @"Source608ChannelNumber",
             @"source608TrackNumber" : @"Source608TrackNumber",
             };
}

+ (NSValueTransformer *)convert608To708JSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveEmbeddedConvert608To708Disabled);
        }
        if ([value caseInsensitiveCompare:@"UPCONVERT"] == NSOrderedSame) {
            return @(AWSMedialiveEmbeddedConvert608To708Upconvert);
        }
        return @(AWSMedialiveEmbeddedConvert608To708Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEmbeddedConvert608To708Disabled:
                return @"DISABLED";
            case AWSMedialiveEmbeddedConvert608To708Upconvert:
                return @"UPCONVERT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte20DetectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMedialiveEmbeddedScte20DetectionAuto);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSMedialiveEmbeddedScte20DetectionOff);
        }
        return @(AWSMedialiveEmbeddedScte20DetectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveEmbeddedScte20DetectionAuto:
                return @"AUTO";
            case AWSMedialiveEmbeddedScte20DetectionOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveEmpty

@end

@implementation AWSMedialiveEncoderSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioDescriptions" : @"AudioDescriptions",
             @"availBlanking" : @"AvailBlanking",
             @"availConfiguration" : @"AvailConfiguration",
             @"blackoutSlate" : @"BlackoutSlate",
             @"captionDescriptions" : @"CaptionDescriptions",
             @"featureActivations" : @"FeatureActivations",
             @"globalConfiguration" : @"GlobalConfiguration",
             @"nielsenConfiguration" : @"NielsenConfiguration",
             @"outputGroups" : @"OutputGroups",
             @"timecodeConfig" : @"TimecodeConfig",
             @"videoDescriptions" : @"VideoDescriptions",
             };
}

+ (NSValueTransformer *)audioDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveAudioDescription class]];
}

+ (NSValueTransformer *)availBlankingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAvailBlanking class]];
}

+ (NSValueTransformer *)availConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAvailConfiguration class]];
}

+ (NSValueTransformer *)blackoutSlateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveBlackoutSlate class]];
}

+ (NSValueTransformer *)captionDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveCaptionDescription class]];
}

+ (NSValueTransformer *)featureActivationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveFeatureActivations class]];
}

+ (NSValueTransformer *)globalConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveGlobalConfiguration class]];
}

+ (NSValueTransformer *)nielsenConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveNielsenConfiguration class]];
}

+ (NSValueTransformer *)outputGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputGroup class]];
}

+ (NSValueTransformer *)timecodeConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveTimecodeConfig class]];
}

+ (NSValueTransformer *)videoDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveVideoDescription class]];
}

@end

@implementation AWSMedialiveFeatureActivations

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputPrepareScheduleActions" : @"InputPrepareScheduleActions",
             };
}

+ (NSValueTransformer *)inputPrepareScheduleActionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveFeatureActivationsInputPrepareScheduleActionsDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveFeatureActivationsInputPrepareScheduleActionsEnabled);
        }
        return @(AWSMedialiveFeatureActivationsInputPrepareScheduleActionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveFeatureActivationsInputPrepareScheduleActionsDisabled:
                return @"DISABLED";
            case AWSMedialiveFeatureActivationsInputPrepareScheduleActionsEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveFecOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"columnDepth" : @"ColumnDepth",
             @"includeFec" : @"IncludeFec",
             @"rowLength" : @"RowLength",
             };
}

+ (NSValueTransformer *)includeFecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COLUMN"] == NSOrderedSame) {
            return @(AWSMedialiveFecOutputIncludeFecColumn);
        }
        if ([value caseInsensitiveCompare:@"COLUMN_AND_ROW"] == NSOrderedSame) {
            return @(AWSMedialiveFecOutputIncludeFecColumnAndRow);
        }
        return @(AWSMedialiveFecOutputIncludeFecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveFecOutputIncludeFecColumn:
                return @"COLUMN";
            case AWSMedialiveFecOutputIncludeFecColumnAndRow:
                return @"COLUMN_AND_ROW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveFixedModeScheduleActionStartSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"time" : @"Time",
             };
}

@end

@implementation AWSMedialiveFmp4HlsSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioRenditionSets" : @"AudioRenditionSets",
             @"nielsenId3Behavior" : @"NielsenId3Behavior",
             @"timedMetadataBehavior" : @"TimedMetadataBehavior",
             };
}

+ (NSValueTransformer *)nielsenId3BehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveFmp4NielsenId3BehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveFmp4NielsenId3BehaviorPassthrough);
        }
        return @(AWSMedialiveFmp4NielsenId3BehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveFmp4NielsenId3BehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSMedialiveFmp4NielsenId3BehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveFmp4TimedMetadataBehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveFmp4TimedMetadataBehaviorPassthrough);
        }
        return @(AWSMedialiveFmp4TimedMetadataBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveFmp4TimedMetadataBehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSMedialiveFmp4TimedMetadataBehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveFollowModeScheduleActionStartSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"followPoint" : @"FollowPoint",
             @"referenceActionName" : @"ReferenceActionName",
             };
}

+ (NSValueTransformer *)followPointJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"END"] == NSOrderedSame) {
            return @(AWSMedialiveFollowPointEnd);
        }
        if ([value caseInsensitiveCompare:@"START"] == NSOrderedSame) {
            return @(AWSMedialiveFollowPointStart);
        }
        return @(AWSMedialiveFollowPointUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveFollowPointEnd:
                return @"END";
            case AWSMedialiveFollowPointStart:
                return @"START";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveFrameCaptureGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveOutputLocationRef class]];
}

@end

@implementation AWSMedialiveFrameCaptureOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nameModifier" : @"NameModifier",
             };
}

@end

@implementation AWSMedialiveFrameCaptureSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captureInterval" : @"CaptureInterval",
             @"captureIntervalUnits" : @"CaptureIntervalUnits",
             };
}

+ (NSValueTransformer *)captureIntervalUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MILLISECONDS"] == NSOrderedSame) {
            return @(AWSMedialiveFrameCaptureIntervalUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSMedialiveFrameCaptureIntervalUnitSeconds);
        }
        return @(AWSMedialiveFrameCaptureIntervalUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveFrameCaptureIntervalUnitMilliseconds:
                return @"MILLISECONDS";
            case AWSMedialiveFrameCaptureIntervalUnitSeconds:
                return @"SECONDS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveGlobalConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initialAudioGain" : @"InitialAudioGain",
             @"inputEndAction" : @"InputEndAction",
             @"inputLossBehavior" : @"InputLossBehavior",
             @"outputLockingMode" : @"OutputLockingMode",
             @"outputTimingSource" : @"OutputTimingSource",
             @"supportLowFramerateInputs" : @"SupportLowFramerateInputs",
             };
}

+ (NSValueTransformer *)inputEndActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveGlobalConfigurationInputEndActionNone);
        }
        if ([value caseInsensitiveCompare:@"SWITCH_AND_LOOP_INPUTS"] == NSOrderedSame) {
            return @(AWSMedialiveGlobalConfigurationInputEndActionSwitchAndLoopInputs);
        }
        return @(AWSMedialiveGlobalConfigurationInputEndActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveGlobalConfigurationInputEndActionNone:
                return @"NONE";
            case AWSMedialiveGlobalConfigurationInputEndActionSwitchAndLoopInputs:
                return @"SWITCH_AND_LOOP_INPUTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputLossBehaviorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputLossBehavior class]];
}

+ (NSValueTransformer *)outputLockingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EPOCH_LOCKING"] == NSOrderedSame) {
            return @(AWSMedialiveGlobalConfigurationOutputLockingModeEpochLocking);
        }
        if ([value caseInsensitiveCompare:@"PIPELINE_LOCKING"] == NSOrderedSame) {
            return @(AWSMedialiveGlobalConfigurationOutputLockingModePipelineLocking);
        }
        return @(AWSMedialiveGlobalConfigurationOutputLockingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveGlobalConfigurationOutputLockingModeEpochLocking:
                return @"EPOCH_LOCKING";
            case AWSMedialiveGlobalConfigurationOutputLockingModePipelineLocking:
                return @"PIPELINE_LOCKING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputTimingSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INPUT_CLOCK"] == NSOrderedSame) {
            return @(AWSMedialiveGlobalConfigurationOutputTimingSourceInputClock);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM_CLOCK"] == NSOrderedSame) {
            return @(AWSMedialiveGlobalConfigurationOutputTimingSourceSystemClock);
        }
        return @(AWSMedialiveGlobalConfigurationOutputTimingSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveGlobalConfigurationOutputTimingSourceInputClock:
                return @"INPUT_CLOCK";
            case AWSMedialiveGlobalConfigurationOutputTimingSourceSystemClock:
                return @"SYSTEM_CLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)supportLowFramerateInputsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveGlobalConfigurationLowFramerateInputsDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveGlobalConfigurationLowFramerateInputsEnabled);
        }
        return @(AWSMedialiveGlobalConfigurationLowFramerateInputsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveGlobalConfigurationLowFramerateInputsDisabled:
                return @"DISABLED";
            case AWSMedialiveGlobalConfigurationLowFramerateInputsEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveH264ColorSpaceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"colorSpacePassthroughSettings" : @"ColorSpacePassthroughSettings",
             @"rec601Settings" : @"Rec601Settings",
             @"rec709Settings" : @"Rec709Settings",
             };
}

+ (NSValueTransformer *)colorSpacePassthroughSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveColorSpacePassthroughSettings class]];
}

+ (NSValueTransformer *)rec601SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveRec601Settings class]];
}

+ (NSValueTransformer *)rec709SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveRec709Settings class]];
}

@end

@implementation AWSMedialiveH264FilterSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"temporalFilterSettings" : @"TemporalFilterSettings",
             };
}

+ (NSValueTransformer *)temporalFilterSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveTemporalFilterSettings class]];
}

@end

@implementation AWSMedialiveH264Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adaptiveQuantization" : @"AdaptiveQuantization",
             @"afdSignaling" : @"AfdSignaling",
             @"bitrate" : @"Bitrate",
             @"bufFillPct" : @"BufFillPct",
             @"bufSize" : @"BufSize",
             @"colorMetadata" : @"ColorMetadata",
             @"colorSpaceSettings" : @"ColorSpaceSettings",
             @"entropyEncoding" : @"EntropyEncoding",
             @"filterSettings" : @"FilterSettings",
             @"fixedAfd" : @"FixedAfd",
             @"flickerAq" : @"FlickerAq",
             @"forceFieldPictures" : @"ForceFieldPictures",
             @"framerateControl" : @"FramerateControl",
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             @"gopBReference" : @"GopBReference",
             @"gopClosedCadence" : @"GopClosedCadence",
             @"gopNumBFrames" : @"GopNumBFrames",
             @"gopSize" : @"GopSize",
             @"gopSizeUnits" : @"GopSizeUnits",
             @"level" : @"Level",
             @"lookAheadRateControl" : @"LookAheadRateControl",
             @"maxBitrate" : @"MaxBitrate",
             @"minIInterval" : @"MinIInterval",
             @"numRefFrames" : @"NumRefFrames",
             @"parControl" : @"ParControl",
             @"parDenominator" : @"ParDenominator",
             @"parNumerator" : @"ParNumerator",
             @"profile" : @"Profile",
             @"qualityLevel" : @"QualityLevel",
             @"qvbrQualityLevel" : @"QvbrQualityLevel",
             @"rateControlMode" : @"RateControlMode",
             @"scanType" : @"ScanType",
             @"sceneChangeDetect" : @"SceneChangeDetect",
             @"slices" : @"Slices",
             @"softness" : @"Softness",
             @"spatialAq" : @"SpatialAq",
             @"subgopLength" : @"SubgopLength",
             @"syntax" : @"Syntax",
             @"temporalAq" : @"TemporalAq",
             @"timecodeInsertion" : @"TimecodeInsertion",
             };
}

+ (NSValueTransformer *)adaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMedialiveH264AdaptiveQuantizationHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGHER"] == NSOrderedSame) {
            return @(AWSMedialiveH264AdaptiveQuantizationHigher);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSMedialiveH264AdaptiveQuantizationLow);
        }
        if ([value caseInsensitiveCompare:@"MAX"] == NSOrderedSame) {
            return @(AWSMedialiveH264AdaptiveQuantizationMax);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSMedialiveH264AdaptiveQuantizationMedium);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSMedialiveH264AdaptiveQuantizationOff);
        }
        return @(AWSMedialiveH264AdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264AdaptiveQuantizationHigh:
                return @"HIGH";
            case AWSMedialiveH264AdaptiveQuantizationHigher:
                return @"HIGHER";
            case AWSMedialiveH264AdaptiveQuantizationLow:
                return @"LOW";
            case AWSMedialiveH264AdaptiveQuantizationMax:
                return @"MAX";
            case AWSMedialiveH264AdaptiveQuantizationMedium:
                return @"MEDIUM";
            case AWSMedialiveH264AdaptiveQuantizationOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)afdSignalingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMedialiveAfdSignalingAuto);
        }
        if ([value caseInsensitiveCompare:@"FIXED"] == NSOrderedSame) {
            return @(AWSMedialiveAfdSignalingFixed);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveAfdSignalingNone);
        }
        return @(AWSMedialiveAfdSignalingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAfdSignalingAuto:
                return @"AUTO";
            case AWSMedialiveAfdSignalingFixed:
                return @"FIXED";
            case AWSMedialiveAfdSignalingNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorMetadataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSMedialiveH264ColorMetadataIgnore);
        }
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSMedialiveH264ColorMetadataInsert);
        }
        return @(AWSMedialiveH264ColorMetadataUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264ColorMetadataIgnore:
                return @"IGNORE";
            case AWSMedialiveH264ColorMetadataInsert:
                return @"INSERT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorSpaceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveH264ColorSpaceSettings class]];
}

+ (NSValueTransformer *)entropyEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CABAC"] == NSOrderedSame) {
            return @(AWSMedialiveH264EntropyEncodingCabac);
        }
        if ([value caseInsensitiveCompare:@"CAVLC"] == NSOrderedSame) {
            return @(AWSMedialiveH264EntropyEncodingCavlc);
        }
        return @(AWSMedialiveH264EntropyEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264EntropyEncodingCabac:
                return @"CABAC";
            case AWSMedialiveH264EntropyEncodingCavlc:
                return @"CAVLC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)filterSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveH264FilterSettings class]];
}

+ (NSValueTransformer *)fixedAfdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AFD_0000"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd0000);
        }
        if ([value caseInsensitiveCompare:@"AFD_0010"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd0010);
        }
        if ([value caseInsensitiveCompare:@"AFD_0011"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd0011);
        }
        if ([value caseInsensitiveCompare:@"AFD_0100"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd0100);
        }
        if ([value caseInsensitiveCompare:@"AFD_1000"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1000);
        }
        if ([value caseInsensitiveCompare:@"AFD_1001"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1001);
        }
        if ([value caseInsensitiveCompare:@"AFD_1010"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1010);
        }
        if ([value caseInsensitiveCompare:@"AFD_1011"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1011);
        }
        if ([value caseInsensitiveCompare:@"AFD_1101"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1101);
        }
        if ([value caseInsensitiveCompare:@"AFD_1110"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1110);
        }
        if ([value caseInsensitiveCompare:@"AFD_1111"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1111);
        }
        return @(AWSMedialiveFixedAfdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveFixedAfdAfd0000:
                return @"AFD_0000";
            case AWSMedialiveFixedAfdAfd0010:
                return @"AFD_0010";
            case AWSMedialiveFixedAfdAfd0011:
                return @"AFD_0011";
            case AWSMedialiveFixedAfdAfd0100:
                return @"AFD_0100";
            case AWSMedialiveFixedAfdAfd1000:
                return @"AFD_1000";
            case AWSMedialiveFixedAfdAfd1001:
                return @"AFD_1001";
            case AWSMedialiveFixedAfdAfd1010:
                return @"AFD_1010";
            case AWSMedialiveFixedAfdAfd1011:
                return @"AFD_1011";
            case AWSMedialiveFixedAfdAfd1101:
                return @"AFD_1101";
            case AWSMedialiveFixedAfdAfd1110:
                return @"AFD_1110";
            case AWSMedialiveFixedAfdAfd1111:
                return @"AFD_1111";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)flickerAqJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH264FlickerAqDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH264FlickerAqEnabled);
        }
        return @(AWSMedialiveH264FlickerAqUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264FlickerAqDisabled:
                return @"DISABLED";
            case AWSMedialiveH264FlickerAqEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)forceFieldPicturesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH264ForceFieldPicturesDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH264ForceFieldPicturesEnabled);
        }
        return @(AWSMedialiveH264ForceFieldPicturesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264ForceFieldPicturesDisabled:
                return @"DISABLED";
            case AWSMedialiveH264ForceFieldPicturesEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMedialiveH264FramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMedialiveH264FramerateControlSpecified);
        }
        return @(AWSMedialiveH264FramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264FramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMedialiveH264FramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopBReferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH264GopBReferenceDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH264GopBReferenceEnabled);
        }
        return @(AWSMedialiveH264GopBReferenceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264GopBReferenceDisabled:
                return @"DISABLED";
            case AWSMedialiveH264GopBReferenceEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopSizeUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAMES"] == NSOrderedSame) {
            return @(AWSMedialiveH264GopSizeUnitsFrames);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSMedialiveH264GopSizeUnitsSeconds);
        }
        return @(AWSMedialiveH264GopSizeUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264GopSizeUnitsFrames:
                return @"FRAMES";
            case AWSMedialiveH264GopSizeUnitsSeconds:
                return @"SECONDS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)levelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"H264_LEVEL_1"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level1);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_1_1"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level11);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_1_2"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level12);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_1_3"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level13);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_2"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level2);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_2_1"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level21);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_2_2"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level22);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_3"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level3);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_3_1"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level31);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_3_2"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level32);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_4"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level4);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_4_1"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level41);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_4_2"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level42);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_5"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level5);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_5_1"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level51);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_5_2"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264Level52);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_AUTO"] == NSOrderedSame) {
            return @(AWSMedialiveH264LevelH264LevelAuto);
        }
        return @(AWSMedialiveH264LevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264LevelH264Level1:
                return @"H264_LEVEL_1";
            case AWSMedialiveH264LevelH264Level11:
                return @"H264_LEVEL_1_1";
            case AWSMedialiveH264LevelH264Level12:
                return @"H264_LEVEL_1_2";
            case AWSMedialiveH264LevelH264Level13:
                return @"H264_LEVEL_1_3";
            case AWSMedialiveH264LevelH264Level2:
                return @"H264_LEVEL_2";
            case AWSMedialiveH264LevelH264Level21:
                return @"H264_LEVEL_2_1";
            case AWSMedialiveH264LevelH264Level22:
                return @"H264_LEVEL_2_2";
            case AWSMedialiveH264LevelH264Level3:
                return @"H264_LEVEL_3";
            case AWSMedialiveH264LevelH264Level31:
                return @"H264_LEVEL_3_1";
            case AWSMedialiveH264LevelH264Level32:
                return @"H264_LEVEL_3_2";
            case AWSMedialiveH264LevelH264Level4:
                return @"H264_LEVEL_4";
            case AWSMedialiveH264LevelH264Level41:
                return @"H264_LEVEL_4_1";
            case AWSMedialiveH264LevelH264Level42:
                return @"H264_LEVEL_4_2";
            case AWSMedialiveH264LevelH264Level5:
                return @"H264_LEVEL_5";
            case AWSMedialiveH264LevelH264Level51:
                return @"H264_LEVEL_5_1";
            case AWSMedialiveH264LevelH264Level52:
                return @"H264_LEVEL_5_2";
            case AWSMedialiveH264LevelH264LevelAuto:
                return @"H264_LEVEL_AUTO";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lookAheadRateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMedialiveH264LookAheadRateControlHigh);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSMedialiveH264LookAheadRateControlLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSMedialiveH264LookAheadRateControlMedium);
        }
        return @(AWSMedialiveH264LookAheadRateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264LookAheadRateControlHigh:
                return @"HIGH";
            case AWSMedialiveH264LookAheadRateControlLow:
                return @"LOW";
            case AWSMedialiveH264LookAheadRateControlMedium:
                return @"MEDIUM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSMedialiveH264ParControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSMedialiveH264ParControlSpecified);
        }
        return @(AWSMedialiveH264ParControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264ParControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSMedialiveH264ParControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BASELINE"] == NSOrderedSame) {
            return @(AWSMedialiveH264ProfileBaseline);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMedialiveH264ProfileHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGH_10BIT"] == NSOrderedSame) {
            return @(AWSMedialiveH264ProfileHigh10bit);
        }
        if ([value caseInsensitiveCompare:@"HIGH_422"] == NSOrderedSame) {
            return @(AWSMedialiveH264ProfileHigh422);
        }
        if ([value caseInsensitiveCompare:@"HIGH_422_10BIT"] == NSOrderedSame) {
            return @(AWSMedialiveH264ProfileHigh42210bit);
        }
        if ([value caseInsensitiveCompare:@"MAIN"] == NSOrderedSame) {
            return @(AWSMedialiveH264ProfileMain);
        }
        return @(AWSMedialiveH264ProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264ProfileBaseline:
                return @"BASELINE";
            case AWSMedialiveH264ProfileHigh:
                return @"HIGH";
            case AWSMedialiveH264ProfileHigh10bit:
                return @"HIGH_10BIT";
            case AWSMedialiveH264ProfileHigh422:
                return @"HIGH_422";
            case AWSMedialiveH264ProfileHigh42210bit:
                return @"HIGH_422_10BIT";
            case AWSMedialiveH264ProfileMain:
                return @"MAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qualityLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENHANCED_QUALITY"] == NSOrderedSame) {
            return @(AWSMedialiveH264QualityLevelEnhancedQuality);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_QUALITY"] == NSOrderedSame) {
            return @(AWSMedialiveH264QualityLevelStandardQuality);
        }
        return @(AWSMedialiveH264QualityLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264QualityLevelEnhancedQuality:
                return @"ENHANCED_QUALITY";
            case AWSMedialiveH264QualityLevelStandardQuality:
                return @"STANDARD_QUALITY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSMedialiveH264RateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"MULTIPLEX"] == NSOrderedSame) {
            return @(AWSMedialiveH264RateControlModeMultiplex);
        }
        if ([value caseInsensitiveCompare:@"QVBR"] == NSOrderedSame) {
            return @(AWSMedialiveH264RateControlModeQvbr);
        }
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSMedialiveH264RateControlModeVbr);
        }
        return @(AWSMedialiveH264RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264RateControlModeCbr:
                return @"CBR";
            case AWSMedialiveH264RateControlModeMultiplex:
                return @"MULTIPLEX";
            case AWSMedialiveH264RateControlModeQvbr:
                return @"QVBR";
            case AWSMedialiveH264RateControlModeVbr:
                return @"VBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scanTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERLACED"] == NSOrderedSame) {
            return @(AWSMedialiveH264ScanTypeInterlaced);
        }
        if ([value caseInsensitiveCompare:@"PROGRESSIVE"] == NSOrderedSame) {
            return @(AWSMedialiveH264ScanTypeProgressive);
        }
        return @(AWSMedialiveH264ScanTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264ScanTypeInterlaced:
                return @"INTERLACED";
            case AWSMedialiveH264ScanTypeProgressive:
                return @"PROGRESSIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sceneChangeDetectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH264SceneChangeDetectDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH264SceneChangeDetectEnabled);
        }
        return @(AWSMedialiveH264SceneChangeDetectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264SceneChangeDetectDisabled:
                return @"DISABLED";
            case AWSMedialiveH264SceneChangeDetectEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spatialAqJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH264SpatialAqDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH264SpatialAqEnabled);
        }
        return @(AWSMedialiveH264SpatialAqUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264SpatialAqDisabled:
                return @"DISABLED";
            case AWSMedialiveH264SpatialAqEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)subgopLengthJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DYNAMIC"] == NSOrderedSame) {
            return @(AWSMedialiveH264SubGopLengthDynamic);
        }
        if ([value caseInsensitiveCompare:@"FIXED"] == NSOrderedSame) {
            return @(AWSMedialiveH264SubGopLengthFixed);
        }
        return @(AWSMedialiveH264SubGopLengthUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264SubGopLengthDynamic:
                return @"DYNAMIC";
            case AWSMedialiveH264SubGopLengthFixed:
                return @"FIXED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)syntaxJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSMedialiveH264SyntaxDefault);
        }
        if ([value caseInsensitiveCompare:@"RP2027"] == NSOrderedSame) {
            return @(AWSMedialiveH264SyntaxRp2027);
        }
        return @(AWSMedialiveH264SyntaxUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264SyntaxDefault:
                return @"DEFAULT";
            case AWSMedialiveH264SyntaxRp2027:
                return @"RP2027";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)temporalAqJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH264TemporalAqDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH264TemporalAqEnabled);
        }
        return @(AWSMedialiveH264TemporalAqUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264TemporalAqDisabled:
                return @"DISABLED";
            case AWSMedialiveH264TemporalAqEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timecodeInsertionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH264TimecodeInsertionBehaviorDisabled);
        }
        if ([value caseInsensitiveCompare:@"PIC_TIMING_SEI"] == NSOrderedSame) {
            return @(AWSMedialiveH264TimecodeInsertionBehaviorPicTimingSei);
        }
        return @(AWSMedialiveH264TimecodeInsertionBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH264TimecodeInsertionBehaviorDisabled:
                return @"DISABLED";
            case AWSMedialiveH264TimecodeInsertionBehaviorPicTimingSei:
                return @"PIC_TIMING_SEI";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveH265ColorSpaceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"colorSpacePassthroughSettings" : @"ColorSpacePassthroughSettings",
             @"hdr10Settings" : @"Hdr10Settings",
             @"rec601Settings" : @"Rec601Settings",
             @"rec709Settings" : @"Rec709Settings",
             };
}

+ (NSValueTransformer *)colorSpacePassthroughSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveColorSpacePassthroughSettings class]];
}

+ (NSValueTransformer *)hdr10SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveHdr10Settings class]];
}

+ (NSValueTransformer *)rec601SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveRec601Settings class]];
}

+ (NSValueTransformer *)rec709SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveRec709Settings class]];
}

@end

@implementation AWSMedialiveH265Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adaptiveQuantization" : @"AdaptiveQuantization",
             @"afdSignaling" : @"AfdSignaling",
             @"alternativeTransferFunction" : @"AlternativeTransferFunction",
             @"bitrate" : @"Bitrate",
             @"bufSize" : @"BufSize",
             @"colorMetadata" : @"ColorMetadata",
             @"colorSpaceSettings" : @"ColorSpaceSettings",
             @"fixedAfd" : @"FixedAfd",
             @"flickerAq" : @"FlickerAq",
             @"framerateDenominator" : @"FramerateDenominator",
             @"framerateNumerator" : @"FramerateNumerator",
             @"gopClosedCadence" : @"GopClosedCadence",
             @"gopSize" : @"GopSize",
             @"gopSizeUnits" : @"GopSizeUnits",
             @"level" : @"Level",
             @"lookAheadRateControl" : @"LookAheadRateControl",
             @"maxBitrate" : @"MaxBitrate",
             @"minIInterval" : @"MinIInterval",
             @"parDenominator" : @"ParDenominator",
             @"parNumerator" : @"ParNumerator",
             @"profile" : @"Profile",
             @"qvbrQualityLevel" : @"QvbrQualityLevel",
             @"rateControlMode" : @"RateControlMode",
             @"scanType" : @"ScanType",
             @"sceneChangeDetect" : @"SceneChangeDetect",
             @"slices" : @"Slices",
             @"tier" : @"Tier",
             @"timecodeInsertion" : @"TimecodeInsertion",
             };
}

+ (NSValueTransformer *)adaptiveQuantizationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMedialiveH265AdaptiveQuantizationHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGHER"] == NSOrderedSame) {
            return @(AWSMedialiveH265AdaptiveQuantizationHigher);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSMedialiveH265AdaptiveQuantizationLow);
        }
        if ([value caseInsensitiveCompare:@"MAX"] == NSOrderedSame) {
            return @(AWSMedialiveH265AdaptiveQuantizationMax);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSMedialiveH265AdaptiveQuantizationMedium);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSMedialiveH265AdaptiveQuantizationOff);
        }
        return @(AWSMedialiveH265AdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH265AdaptiveQuantizationHigh:
                return @"HIGH";
            case AWSMedialiveH265AdaptiveQuantizationHigher:
                return @"HIGHER";
            case AWSMedialiveH265AdaptiveQuantizationLow:
                return @"LOW";
            case AWSMedialiveH265AdaptiveQuantizationMax:
                return @"MAX";
            case AWSMedialiveH265AdaptiveQuantizationMedium:
                return @"MEDIUM";
            case AWSMedialiveH265AdaptiveQuantizationOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)afdSignalingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMedialiveAfdSignalingAuto);
        }
        if ([value caseInsensitiveCompare:@"FIXED"] == NSOrderedSame) {
            return @(AWSMedialiveAfdSignalingFixed);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveAfdSignalingNone);
        }
        return @(AWSMedialiveAfdSignalingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAfdSignalingAuto:
                return @"AUTO";
            case AWSMedialiveAfdSignalingFixed:
                return @"FIXED";
            case AWSMedialiveAfdSignalingNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)alternativeTransferFunctionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSMedialiveH265AlternativeTransferFunctionInsert);
        }
        if ([value caseInsensitiveCompare:@"OMIT"] == NSOrderedSame) {
            return @(AWSMedialiveH265AlternativeTransferFunctionOmit);
        }
        return @(AWSMedialiveH265AlternativeTransferFunctionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH265AlternativeTransferFunctionInsert:
                return @"INSERT";
            case AWSMedialiveH265AlternativeTransferFunctionOmit:
                return @"OMIT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorMetadataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSMedialiveH265ColorMetadataIgnore);
        }
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSMedialiveH265ColorMetadataInsert);
        }
        return @(AWSMedialiveH265ColorMetadataUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH265ColorMetadataIgnore:
                return @"IGNORE";
            case AWSMedialiveH265ColorMetadataInsert:
                return @"INSERT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorSpaceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveH265ColorSpaceSettings class]];
}

+ (NSValueTransformer *)fixedAfdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AFD_0000"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd0000);
        }
        if ([value caseInsensitiveCompare:@"AFD_0010"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd0010);
        }
        if ([value caseInsensitiveCompare:@"AFD_0011"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd0011);
        }
        if ([value caseInsensitiveCompare:@"AFD_0100"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd0100);
        }
        if ([value caseInsensitiveCompare:@"AFD_1000"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1000);
        }
        if ([value caseInsensitiveCompare:@"AFD_1001"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1001);
        }
        if ([value caseInsensitiveCompare:@"AFD_1010"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1010);
        }
        if ([value caseInsensitiveCompare:@"AFD_1011"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1011);
        }
        if ([value caseInsensitiveCompare:@"AFD_1101"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1101);
        }
        if ([value caseInsensitiveCompare:@"AFD_1110"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1110);
        }
        if ([value caseInsensitiveCompare:@"AFD_1111"] == NSOrderedSame) {
            return @(AWSMedialiveFixedAfdAfd1111);
        }
        return @(AWSMedialiveFixedAfdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveFixedAfdAfd0000:
                return @"AFD_0000";
            case AWSMedialiveFixedAfdAfd0010:
                return @"AFD_0010";
            case AWSMedialiveFixedAfdAfd0011:
                return @"AFD_0011";
            case AWSMedialiveFixedAfdAfd0100:
                return @"AFD_0100";
            case AWSMedialiveFixedAfdAfd1000:
                return @"AFD_1000";
            case AWSMedialiveFixedAfdAfd1001:
                return @"AFD_1001";
            case AWSMedialiveFixedAfdAfd1010:
                return @"AFD_1010";
            case AWSMedialiveFixedAfdAfd1011:
                return @"AFD_1011";
            case AWSMedialiveFixedAfdAfd1101:
                return @"AFD_1101";
            case AWSMedialiveFixedAfdAfd1110:
                return @"AFD_1110";
            case AWSMedialiveFixedAfdAfd1111:
                return @"AFD_1111";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)flickerAqJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH265FlickerAqDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH265FlickerAqEnabled);
        }
        return @(AWSMedialiveH265FlickerAqUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH265FlickerAqDisabled:
                return @"DISABLED";
            case AWSMedialiveH265FlickerAqEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopSizeUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAMES"] == NSOrderedSame) {
            return @(AWSMedialiveH265GopSizeUnitsFrames);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSMedialiveH265GopSizeUnitsSeconds);
        }
        return @(AWSMedialiveH265GopSizeUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH265GopSizeUnitsFrames:
                return @"FRAMES";
            case AWSMedialiveH265GopSizeUnitsSeconds:
                return @"SECONDS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)levelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"H265_LEVEL_1"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265Level1);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_2"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265Level2);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_2_1"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265Level21);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_3"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265Level3);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_3_1"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265Level31);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_4"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265Level4);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_4_1"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265Level41);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_5"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265Level5);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_5_1"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265Level51);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_5_2"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265Level52);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_6"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265Level6);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_6_1"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265Level61);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_6_2"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265Level62);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_AUTO"] == NSOrderedSame) {
            return @(AWSMedialiveH265LevelH265LevelAuto);
        }
        return @(AWSMedialiveH265LevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH265LevelH265Level1:
                return @"H265_LEVEL_1";
            case AWSMedialiveH265LevelH265Level2:
                return @"H265_LEVEL_2";
            case AWSMedialiveH265LevelH265Level21:
                return @"H265_LEVEL_2_1";
            case AWSMedialiveH265LevelH265Level3:
                return @"H265_LEVEL_3";
            case AWSMedialiveH265LevelH265Level31:
                return @"H265_LEVEL_3_1";
            case AWSMedialiveH265LevelH265Level4:
                return @"H265_LEVEL_4";
            case AWSMedialiveH265LevelH265Level41:
                return @"H265_LEVEL_4_1";
            case AWSMedialiveH265LevelH265Level5:
                return @"H265_LEVEL_5";
            case AWSMedialiveH265LevelH265Level51:
                return @"H265_LEVEL_5_1";
            case AWSMedialiveH265LevelH265Level52:
                return @"H265_LEVEL_5_2";
            case AWSMedialiveH265LevelH265Level6:
                return @"H265_LEVEL_6";
            case AWSMedialiveH265LevelH265Level61:
                return @"H265_LEVEL_6_1";
            case AWSMedialiveH265LevelH265Level62:
                return @"H265_LEVEL_6_2";
            case AWSMedialiveH265LevelH265LevelAuto:
                return @"H265_LEVEL_AUTO";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lookAheadRateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMedialiveH265LookAheadRateControlHigh);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSMedialiveH265LookAheadRateControlLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSMedialiveH265LookAheadRateControlMedium);
        }
        return @(AWSMedialiveH265LookAheadRateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH265LookAheadRateControlHigh:
                return @"HIGH";
            case AWSMedialiveH265LookAheadRateControlLow:
                return @"LOW";
            case AWSMedialiveH265LookAheadRateControlMedium:
                return @"MEDIUM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAIN"] == NSOrderedSame) {
            return @(AWSMedialiveH265ProfileMain);
        }
        if ([value caseInsensitiveCompare:@"MAIN_10BIT"] == NSOrderedSame) {
            return @(AWSMedialiveH265ProfileMain10bit);
        }
        return @(AWSMedialiveH265ProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH265ProfileMain:
                return @"MAIN";
            case AWSMedialiveH265ProfileMain10bit:
                return @"MAIN_10BIT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSMedialiveH265RateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"MULTIPLEX"] == NSOrderedSame) {
            return @(AWSMedialiveH265RateControlModeMultiplex);
        }
        if ([value caseInsensitiveCompare:@"QVBR"] == NSOrderedSame) {
            return @(AWSMedialiveH265RateControlModeQvbr);
        }
        return @(AWSMedialiveH265RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH265RateControlModeCbr:
                return @"CBR";
            case AWSMedialiveH265RateControlModeMultiplex:
                return @"MULTIPLEX";
            case AWSMedialiveH265RateControlModeQvbr:
                return @"QVBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scanTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE"] == NSOrderedSame) {
            return @(AWSMedialiveH265ScanTypeProgressive);
        }
        return @(AWSMedialiveH265ScanTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH265ScanTypeProgressive:
                return @"PROGRESSIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sceneChangeDetectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH265SceneChangeDetectDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH265SceneChangeDetectEnabled);
        }
        return @(AWSMedialiveH265SceneChangeDetectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH265SceneChangeDetectDisabled:
                return @"DISABLED";
            case AWSMedialiveH265SceneChangeDetectEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSMedialiveH265TierHigh);
        }
        if ([value caseInsensitiveCompare:@"MAIN"] == NSOrderedSame) {
            return @(AWSMedialiveH265TierMain);
        }
        return @(AWSMedialiveH265TierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH265TierHigh:
                return @"HIGH";
            case AWSMedialiveH265TierMain:
                return @"MAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timecodeInsertionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveH265TimecodeInsertionBehaviorDisabled);
        }
        if ([value caseInsensitiveCompare:@"PIC_TIMING_SEI"] == NSOrderedSame) {
            return @(AWSMedialiveH265TimecodeInsertionBehaviorPicTimingSei);
        }
        return @(AWSMedialiveH265TimecodeInsertionBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveH265TimecodeInsertionBehaviorDisabled:
                return @"DISABLED";
            case AWSMedialiveH265TimecodeInsertionBehaviorPicTimingSei:
                return @"PIC_TIMING_SEI";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveHdr10Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxCll" : @"MaxCll",
             @"maxFall" : @"MaxFall",
             };
}

@end

@implementation AWSMedialiveHlsAkamaiSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionRetryInterval" : @"ConnectionRetryInterval",
             @"filecacheDuration" : @"FilecacheDuration",
             @"httpTransferMode" : @"HttpTransferMode",
             @"numRetries" : @"NumRetries",
             @"restartDelay" : @"RestartDelay",
             @"salt" : @"Salt",
             @"token" : @"Token",
             };
}

+ (NSValueTransformer *)httpTransferModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHUNKED"] == NSOrderedSame) {
            return @(AWSMedialiveHlsAkamaiHttpTransferModeChunked);
        }
        if ([value caseInsensitiveCompare:@"NON_CHUNKED"] == NSOrderedSame) {
            return @(AWSMedialiveHlsAkamaiHttpTransferModeNonChunked);
        }
        return @(AWSMedialiveHlsAkamaiHttpTransferModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsAkamaiHttpTransferModeChunked:
                return @"CHUNKED";
            case AWSMedialiveHlsAkamaiHttpTransferModeNonChunked:
                return @"NON_CHUNKED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveHlsBasicPutSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionRetryInterval" : @"ConnectionRetryInterval",
             @"filecacheDuration" : @"FilecacheDuration",
             @"numRetries" : @"NumRetries",
             @"restartDelay" : @"RestartDelay",
             };
}

@end

@implementation AWSMedialiveHlsCdnSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hlsAkamaiSettings" : @"HlsAkamaiSettings",
             @"hlsBasicPutSettings" : @"HlsBasicPutSettings",
             @"hlsMediaStoreSettings" : @"HlsMediaStoreSettings",
             @"hlsWebdavSettings" : @"HlsWebdavSettings",
             };
}

+ (NSValueTransformer *)hlsAkamaiSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveHlsAkamaiSettings class]];
}

+ (NSValueTransformer *)hlsBasicPutSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveHlsBasicPutSettings class]];
}

+ (NSValueTransformer *)hlsMediaStoreSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveHlsMediaStoreSettings class]];
}

+ (NSValueTransformer *)hlsWebdavSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveHlsWebdavSettings class]];
}

@end

@implementation AWSMedialiveHlsGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adMarkers" : @"AdMarkers",
             @"baseUrlContent" : @"BaseUrlContent",
             @"baseUrlContent1" : @"BaseUrlContent1",
             @"baseUrlManifest" : @"BaseUrlManifest",
             @"baseUrlManifest1" : @"BaseUrlManifest1",
             @"captionLanguageMappings" : @"CaptionLanguageMappings",
             @"captionLanguageSetting" : @"CaptionLanguageSetting",
             @"clientCache" : @"ClientCache",
             @"codecSpecification" : @"CodecSpecification",
             @"constantIv" : @"ConstantIv",
             @"destination" : @"Destination",
             @"directoryStructure" : @"DirectoryStructure",
             @"encryptionType" : @"EncryptionType",
             @"hlsCdnSettings" : @"HlsCdnSettings",
             @"hlsId3SegmentTagging" : @"HlsId3SegmentTagging",
             @"IFrameOnlyPlaylists" : @"IFrameOnlyPlaylists",
             @"indexNSegments" : @"IndexNSegments",
             @"inputLossAction" : @"InputLossAction",
             @"ivInManifest" : @"IvInManifest",
             @"ivSource" : @"IvSource",
             @"keepSegments" : @"KeepSegments",
             @"keyFormat" : @"KeyFormat",
             @"keyFormatVersions" : @"KeyFormatVersions",
             @"keyProviderSettings" : @"KeyProviderSettings",
             @"manifestCompression" : @"ManifestCompression",
             @"manifestDurationFormat" : @"ManifestDurationFormat",
             @"minSegmentLength" : @"MinSegmentLength",
             @"mode" : @"Mode",
             @"outputSelection" : @"OutputSelection",
             @"programDateTime" : @"ProgramDateTime",
             @"programDateTimePeriod" : @"ProgramDateTimePeriod",
             @"redundantManifest" : @"RedundantManifest",
             @"segmentLength" : @"SegmentLength",
             @"segmentationMode" : @"SegmentationMode",
             @"segmentsPerSubdirectory" : @"SegmentsPerSubdirectory",
             @"streamInfResolution" : @"StreamInfResolution",
             @"timedMetadataId3Frame" : @"TimedMetadataId3Frame",
             @"timedMetadataId3Period" : @"TimedMetadataId3Period",
             @"timestampDeltaMilliseconds" : @"TimestampDeltaMilliseconds",
             @"tsFileMode" : @"TsFileMode",
             };
}

+ (NSValueTransformer *)captionLanguageMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveCaptionLanguageMapping class]];
}

+ (NSValueTransformer *)captionLanguageSettingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSMedialiveHlsCaptionLanguageSettingInsert);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveHlsCaptionLanguageSettingNone);
        }
        if ([value caseInsensitiveCompare:@"OMIT"] == NSOrderedSame) {
            return @(AWSMedialiveHlsCaptionLanguageSettingOmit);
        }
        return @(AWSMedialiveHlsCaptionLanguageSettingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsCaptionLanguageSettingInsert:
                return @"INSERT";
            case AWSMedialiveHlsCaptionLanguageSettingNone:
                return @"NONE";
            case AWSMedialiveHlsCaptionLanguageSettingOmit:
                return @"OMIT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)clientCacheJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveHlsClientCacheDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveHlsClientCacheEnabled);
        }
        return @(AWSMedialiveHlsClientCacheUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsClientCacheDisabled:
                return @"DISABLED";
            case AWSMedialiveHlsClientCacheEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecSpecificationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RFC_4281"] == NSOrderedSame) {
            return @(AWSMedialiveHlsCodecSpecificationRfc4281);
        }
        if ([value caseInsensitiveCompare:@"RFC_6381"] == NSOrderedSame) {
            return @(AWSMedialiveHlsCodecSpecificationRfc6381);
        }
        return @(AWSMedialiveHlsCodecSpecificationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsCodecSpecificationRfc4281:
                return @"RFC_4281";
            case AWSMedialiveHlsCodecSpecificationRfc6381:
                return @"RFC_6381";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveOutputLocationRef class]];
}

+ (NSValueTransformer *)directoryStructureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_DIRECTORY"] == NSOrderedSame) {
            return @(AWSMedialiveHlsDirectoryStructureSingleDirectory);
        }
        if ([value caseInsensitiveCompare:@"SUBDIRECTORY_PER_STREAM"] == NSOrderedSame) {
            return @(AWSMedialiveHlsDirectoryStructureSubdirectoryPerStream);
        }
        return @(AWSMedialiveHlsDirectoryStructureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsDirectoryStructureSingleDirectory:
                return @"SINGLE_DIRECTORY";
            case AWSMedialiveHlsDirectoryStructureSubdirectoryPerStream:
                return @"SUBDIRECTORY_PER_STREAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)encryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES128"] == NSOrderedSame) {
            return @(AWSMedialiveHlsEncryptionTypeAes128);
        }
        if ([value caseInsensitiveCompare:@"SAMPLE_AES"] == NSOrderedSame) {
            return @(AWSMedialiveHlsEncryptionTypeSampleAes);
        }
        return @(AWSMedialiveHlsEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsEncryptionTypeAes128:
                return @"AES128";
            case AWSMedialiveHlsEncryptionTypeSampleAes:
                return @"SAMPLE_AES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hlsCdnSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveHlsCdnSettings class]];
}

+ (NSValueTransformer *)hlsId3SegmentTaggingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveHlsId3SegmentTaggingStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveHlsId3SegmentTaggingStateEnabled);
        }
        return @(AWSMedialiveHlsId3SegmentTaggingStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsId3SegmentTaggingStateDisabled:
                return @"DISABLED";
            case AWSMedialiveHlsId3SegmentTaggingStateEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)IFrameOnlyPlaylistsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveIFrameOnlyPlaylistTypeDisabled);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveIFrameOnlyPlaylistTypeStandard);
        }
        return @(AWSMedialiveIFrameOnlyPlaylistTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveIFrameOnlyPlaylistTypeDisabled:
                return @"DISABLED";
            case AWSMedialiveIFrameOnlyPlaylistTypeStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputLossActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMIT_OUTPUT"] == NSOrderedSame) {
            return @(AWSMedialiveInputLossActionForHlsOutEmitOutput);
        }
        if ([value caseInsensitiveCompare:@"PAUSE_OUTPUT"] == NSOrderedSame) {
            return @(AWSMedialiveInputLossActionForHlsOutPauseOutput);
        }
        return @(AWSMedialiveInputLossActionForHlsOutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputLossActionForHlsOutEmitOutput:
                return @"EMIT_OUTPUT";
            case AWSMedialiveInputLossActionForHlsOutPauseOutput:
                return @"PAUSE_OUTPUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ivInManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMedialiveHlsIvInManifestExclude);
        }
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMedialiveHlsIvInManifestInclude);
        }
        return @(AWSMedialiveHlsIvInManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsIvInManifestExclude:
                return @"EXCLUDE";
            case AWSMedialiveHlsIvInManifestInclude:
                return @"INCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ivSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXPLICIT"] == NSOrderedSame) {
            return @(AWSMedialiveHlsIvSourceExplicit);
        }
        if ([value caseInsensitiveCompare:@"FOLLOWS_SEGMENT_NUMBER"] == NSOrderedSame) {
            return @(AWSMedialiveHlsIvSourceFollowsSegmentNumber);
        }
        return @(AWSMedialiveHlsIvSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsIvSourceExplicit:
                return @"EXPLICIT";
            case AWSMedialiveHlsIvSourceFollowsSegmentNumber:
                return @"FOLLOWS_SEGMENT_NUMBER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)keyProviderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveKeyProviderSettings class]];
}

+ (NSValueTransformer *)manifestCompressionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSMedialiveHlsManifestCompressionGzip);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveHlsManifestCompressionNone);
        }
        return @(AWSMedialiveHlsManifestCompressionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsManifestCompressionGzip:
                return @"GZIP";
            case AWSMedialiveHlsManifestCompressionNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)manifestDurationFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FLOATING_POINT"] == NSOrderedSame) {
            return @(AWSMedialiveHlsManifestDurationFormatFloatingPoint);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSMedialiveHlsManifestDurationFormatInteger);
        }
        return @(AWSMedialiveHlsManifestDurationFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsManifestDurationFormatFloatingPoint:
                return @"FLOATING_POINT";
            case AWSMedialiveHlsManifestDurationFormatInteger:
                return @"INTEGER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LIVE"] == NSOrderedSame) {
            return @(AWSMedialiveHlsModeLive);
        }
        if ([value caseInsensitiveCompare:@"VOD"] == NSOrderedSame) {
            return @(AWSMedialiveHlsModeVod);
        }
        return @(AWSMedialiveHlsModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsModeLive:
                return @"LIVE";
            case AWSMedialiveHlsModeVod:
                return @"VOD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputSelectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MANIFESTS_AND_SEGMENTS"] == NSOrderedSame) {
            return @(AWSMedialiveHlsOutputSelectionManifestsAndSegments);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTS_ONLY"] == NSOrderedSame) {
            return @(AWSMedialiveHlsOutputSelectionSegmentsOnly);
        }
        return @(AWSMedialiveHlsOutputSelectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsOutputSelectionManifestsAndSegments:
                return @"MANIFESTS_AND_SEGMENTS";
            case AWSMedialiveHlsOutputSelectionSegmentsOnly:
                return @"SEGMENTS_ONLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)programDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMedialiveHlsProgramDateTimeExclude);
        }
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMedialiveHlsProgramDateTimeInclude);
        }
        return @(AWSMedialiveHlsProgramDateTimeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsProgramDateTimeExclude:
                return @"EXCLUDE";
            case AWSMedialiveHlsProgramDateTimeInclude:
                return @"INCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)redundantManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveHlsRedundantManifestDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveHlsRedundantManifestEnabled);
        }
        return @(AWSMedialiveHlsRedundantManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsRedundantManifestDisabled:
                return @"DISABLED";
            case AWSMedialiveHlsRedundantManifestEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentationModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USE_INPUT_SEGMENTATION"] == NSOrderedSame) {
            return @(AWSMedialiveHlsSegmentationModeUseInputSegmentation);
        }
        if ([value caseInsensitiveCompare:@"USE_SEGMENT_DURATION"] == NSOrderedSame) {
            return @(AWSMedialiveHlsSegmentationModeUseSegmentDuration);
        }
        return @(AWSMedialiveHlsSegmentationModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsSegmentationModeUseInputSegmentation:
                return @"USE_INPUT_SEGMENTATION";
            case AWSMedialiveHlsSegmentationModeUseSegmentDuration:
                return @"USE_SEGMENT_DURATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)streamInfResolutionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMedialiveHlsStreamInfResolutionExclude);
        }
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMedialiveHlsStreamInfResolutionInclude);
        }
        return @(AWSMedialiveHlsStreamInfResolutionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsStreamInfResolutionExclude:
                return @"EXCLUDE";
            case AWSMedialiveHlsStreamInfResolutionInclude:
                return @"INCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataId3FrameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveHlsTimedMetadataId3FrameNone);
        }
        if ([value caseInsensitiveCompare:@"PRIV"] == NSOrderedSame) {
            return @(AWSMedialiveHlsTimedMetadataId3FramePriv);
        }
        if ([value caseInsensitiveCompare:@"TDRL"] == NSOrderedSame) {
            return @(AWSMedialiveHlsTimedMetadataId3FrameTdrl);
        }
        return @(AWSMedialiveHlsTimedMetadataId3FrameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsTimedMetadataId3FrameNone:
                return @"NONE";
            case AWSMedialiveHlsTimedMetadataId3FramePriv:
                return @"PRIV";
            case AWSMedialiveHlsTimedMetadataId3FrameTdrl:
                return @"TDRL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tsFileModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SEGMENTED_FILES"] == NSOrderedSame) {
            return @(AWSMedialiveHlsTsFileModeSegmentedFiles);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_FILE"] == NSOrderedSame) {
            return @(AWSMedialiveHlsTsFileModeSingleFile);
        }
        return @(AWSMedialiveHlsTsFileModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsTsFileModeSegmentedFiles:
                return @"SEGMENTED_FILES";
            case AWSMedialiveHlsTsFileModeSingleFile:
                return @"SINGLE_FILE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveHlsId3SegmentTaggingScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tag" : @"Tag",
             };
}

@end

@implementation AWSMedialiveHlsInputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bandwidth" : @"Bandwidth",
             @"bufferSegments" : @"BufferSegments",
             @"retries" : @"Retries",
             @"retryInterval" : @"RetryInterval",
             };
}

@end

@implementation AWSMedialiveHlsMediaStoreSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionRetryInterval" : @"ConnectionRetryInterval",
             @"filecacheDuration" : @"FilecacheDuration",
             @"mediaStoreStorageClass" : @"MediaStoreStorageClass",
             @"numRetries" : @"NumRetries",
             @"restartDelay" : @"RestartDelay",
             };
}

+ (NSValueTransformer *)mediaStoreStorageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TEMPORAL"] == NSOrderedSame) {
            return @(AWSMedialiveHlsMediaStoreStorageClassTemporal);
        }
        return @(AWSMedialiveHlsMediaStoreStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsMediaStoreStorageClassTemporal:
                return @"TEMPORAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveHlsOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"h265PackagingType" : @"H265PackagingType",
             @"hlsSettings" : @"HlsSettings",
             @"nameModifier" : @"NameModifier",
             @"segmentModifier" : @"SegmentModifier",
             };
}

+ (NSValueTransformer *)h265PackagingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HEV1"] == NSOrderedSame) {
            return @(AWSMedialiveHlsH265PackagingTypeHev1);
        }
        if ([value caseInsensitiveCompare:@"HVC1"] == NSOrderedSame) {
            return @(AWSMedialiveHlsH265PackagingTypeHvc1);
        }
        return @(AWSMedialiveHlsH265PackagingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsH265PackagingTypeHev1:
                return @"HEV1";
            case AWSMedialiveHlsH265PackagingTypeHvc1:
                return @"HVC1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hlsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveHlsSettings class]];
}

@end

@implementation AWSMedialiveHlsSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioOnlyHlsSettings" : @"AudioOnlyHlsSettings",
             @"fmp4HlsSettings" : @"Fmp4HlsSettings",
             @"standardHlsSettings" : @"StandardHlsSettings",
             };
}

+ (NSValueTransformer *)audioOnlyHlsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAudioOnlyHlsSettings class]];
}

+ (NSValueTransformer *)fmp4HlsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveFmp4HlsSettings class]];
}

+ (NSValueTransformer *)standardHlsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveStandardHlsSettings class]];
}

@end

@implementation AWSMedialiveHlsTimedMetadataScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"id3" : @"Id3",
             };
}

@end

@implementation AWSMedialiveHlsWebdavSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionRetryInterval" : @"ConnectionRetryInterval",
             @"filecacheDuration" : @"FilecacheDuration",
             @"httpTransferMode" : @"HttpTransferMode",
             @"numRetries" : @"NumRetries",
             @"restartDelay" : @"RestartDelay",
             };
}

+ (NSValueTransformer *)httpTransferModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHUNKED"] == NSOrderedSame) {
            return @(AWSMedialiveHlsWebdavHttpTransferModeChunked);
        }
        if ([value caseInsensitiveCompare:@"NON_CHUNKED"] == NSOrderedSame) {
            return @(AWSMedialiveHlsWebdavHttpTransferModeNonChunked);
        }
        return @(AWSMedialiveHlsWebdavHttpTransferModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveHlsWebdavHttpTransferModeChunked:
                return @"CHUNKED";
            case AWSMedialiveHlsWebdavHttpTransferModeNonChunked:
                return @"NON_CHUNKED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveImmediateModeScheduleActionStartSettings

@end

@implementation AWSMedialiveInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"attachedChannels" : @"AttachedChannels",
             @"destinations" : @"Destinations",
             @"identifier" : @"Id",
             @"inputClass" : @"InputClass",
             @"inputDevices" : @"InputDevices",
             @"inputSourceType" : @"InputSourceType",
             @"mediaConnectFlows" : @"MediaConnectFlows",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"securityGroups" : @"SecurityGroups",
             @"sources" : @"Sources",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDestination class]];
}

+ (NSValueTransformer *)inputClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveInputClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSMedialiveInputClassSinglePipeline);
        }
        return @(AWSMedialiveInputClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputClassStandard:
                return @"STANDARD";
            case AWSMedialiveInputClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDeviceSettings class]];
}

+ (NSValueTransformer *)inputSourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSMedialiveInputSourceTypeStatic);
        }
        if ([value caseInsensitiveCompare:@"DYNAMIC"] == NSOrderedSame) {
            return @(AWSMedialiveInputSourceTypeDynamic);
        }
        return @(AWSMedialiveInputSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputSourceTypeStatic:
                return @"STATIC";
            case AWSMedialiveInputSourceTypeDynamic:
                return @"DYNAMIC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mediaConnectFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMediaConnectFlow class]];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputSource class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveInputStateCreating);
        }
        if ([value caseInsensitiveCompare:@"DETACHED"] == NSOrderedSame) {
            return @(AWSMedialiveInputStateDetached);
        }
        if ([value caseInsensitiveCompare:@"ATTACHED"] == NSOrderedSame) {
            return @(AWSMedialiveInputStateAttached);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveInputStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveInputStateDeleted);
        }
        return @(AWSMedialiveInputStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputStateCreating:
                return @"CREATING";
            case AWSMedialiveInputStateDetached:
                return @"DETACHED";
            case AWSMedialiveInputStateAttached:
                return @"ATTACHED";
            case AWSMedialiveInputStateDeleting:
                return @"DELETING";
            case AWSMedialiveInputStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UDP_PUSH"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeUdpPush);
        }
        if ([value caseInsensitiveCompare:@"RTP_PUSH"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeRtpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PUSH"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeRtmpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PULL"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeRtmpPull);
        }
        if ([value caseInsensitiveCompare:@"URL_PULL"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeUrlPull);
        }
        if ([value caseInsensitiveCompare:@"MP4_FILE"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeMp4File);
        }
        if ([value caseInsensitiveCompare:@"MEDIACONNECT"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeMediaconnect);
        }
        if ([value caseInsensitiveCompare:@"INPUT_DEVICE"] == NSOrderedSame) {
            return @(AWSMedialiveInputTypeInputDevice);
        }
        return @(AWSMedialiveInputTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputTypeUdpPush:
                return @"UDP_PUSH";
            case AWSMedialiveInputTypeRtpPush:
                return @"RTP_PUSH";
            case AWSMedialiveInputTypeRtmpPush:
                return @"RTMP_PUSH";
            case AWSMedialiveInputTypeRtmpPull:
                return @"RTMP_PULL";
            case AWSMedialiveInputTypeUrlPull:
                return @"URL_PULL";
            case AWSMedialiveInputTypeMp4File:
                return @"MP4_FILE";
            case AWSMedialiveInputTypeMediaconnect:
                return @"MEDIACONNECT";
            case AWSMedialiveInputTypeInputDevice:
                return @"INPUT_DEVICE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveInputAttachment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automaticInputFailoverSettings" : @"AutomaticInputFailoverSettings",
             @"inputAttachmentName" : @"InputAttachmentName",
             @"inputId" : @"InputId",
             @"inputSettings" : @"InputSettings",
             };
}

+ (NSValueTransformer *)automaticInputFailoverSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveAutomaticInputFailoverSettings class]];
}

+ (NSValueTransformer *)inputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSettings class]];
}

@end

@implementation AWSMedialiveInputChannelLevel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gain" : @"Gain",
             @"inputChannel" : @"InputChannel",
             };
}

@end

@implementation AWSMedialiveInputClippingSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputTimecodeSource" : @"InputTimecodeSource",
             @"startTimecode" : @"StartTimecode",
             @"stopTimecode" : @"StopTimecode",
             };
}

+ (NSValueTransformer *)inputTimecodeSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ZEROBASED"] == NSOrderedSame) {
            return @(AWSMedialiveInputTimecodeSourceZerobased);
        }
        if ([value caseInsensitiveCompare:@"EMBEDDED"] == NSOrderedSame) {
            return @(AWSMedialiveInputTimecodeSourceEmbedded);
        }
        return @(AWSMedialiveInputTimecodeSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputTimecodeSourceZerobased:
                return @"ZEROBASED";
            case AWSMedialiveInputTimecodeSourceEmbedded:
                return @"EMBEDDED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startTimecodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveStartTimecode class]];
}

+ (NSValueTransformer *)stopTimecodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveStopTimecode class]];
}

@end

@implementation AWSMedialiveInputDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ip" : @"Ip",
             @"port" : @"Port",
             @"url" : @"Url",
             @"vpc" : @"Vpc",
             };
}

+ (NSValueTransformer *)vpcJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputDestinationVpc class]];
}

@end

@implementation AWSMedialiveInputDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSMedialiveInputDestinationVpc

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             };
}

@end

@implementation AWSMedialiveInputDevice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"connectionState" : @"ConnectionState",
             @"deviceSettingsSyncState" : @"DeviceSettingsSyncState",
             @"hdDeviceSettings" : @"HdDeviceSettings",
             @"identifier" : @"Id",
             @"macAddress" : @"MacAddress",
             @"name" : @"Name",
             @"networkSettings" : @"NetworkSettings",
             @"serialNumber" : @"SerialNumber",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)connectionStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISCONNECTED"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConnectionStateDisconnected);
        }
        if ([value caseInsensitiveCompare:@"CONNECTED"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConnectionStateConnected);
        }
        return @(AWSMedialiveInputDeviceConnectionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceConnectionStateDisconnected:
                return @"DISCONNECTED";
            case AWSMedialiveInputDeviceConnectionStateConnected:
                return @"CONNECTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deviceSettingsSyncStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYNCED"] == NSOrderedSame) {
            return @(AWSMedialiveDeviceSettingsSyncStateSynced);
        }
        if ([value caseInsensitiveCompare:@"SYNCING"] == NSOrderedSame) {
            return @(AWSMedialiveDeviceSettingsSyncStateSyncing);
        }
        return @(AWSMedialiveDeviceSettingsSyncStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveDeviceSettingsSyncStateSynced:
                return @"SYNCED";
            case AWSMedialiveDeviceSettingsSyncStateSyncing:
                return @"SYNCING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hdDeviceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputDeviceHdSettings class]];
}

+ (NSValueTransformer *)networkSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputDeviceNetworkSettings class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HD"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceTypeHd);
        }
        return @(AWSMedialiveInputDeviceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceTypeHd:
                return @"HD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveInputDeviceConfigurableSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configuredInput" : @"ConfiguredInput",
             @"maxBitrate" : @"MaxBitrate",
             };
}

+ (NSValueTransformer *)configuredInputJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConfiguredInputAuto);
        }
        if ([value caseInsensitiveCompare:@"HDMI"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConfiguredInputHdmi);
        }
        if ([value caseInsensitiveCompare:@"SDI"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConfiguredInputSdi);
        }
        return @(AWSMedialiveInputDeviceConfiguredInputUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceConfiguredInputAuto:
                return @"AUTO";
            case AWSMedialiveInputDeviceConfiguredInputHdmi:
                return @"HDMI";
            case AWSMedialiveInputDeviceConfiguredInputSdi:
                return @"SDI";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveInputDeviceConfigurationValidationError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"validationErrors" : @"ValidationErrors",
             };
}

+ (NSValueTransformer *)validationErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveValidationError class]];
}

@end

@implementation AWSMedialiveInputDeviceHdSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeInput" : @"ActiveInput",
             @"configuredInput" : @"ConfiguredInput",
             @"deviceState" : @"DeviceState",
             @"framerate" : @"Framerate",
             @"height" : @"Height",
             @"maxBitrate" : @"MaxBitrate",
             @"scanType" : @"ScanType",
             @"width" : @"Width",
             };
}

+ (NSValueTransformer *)activeInputJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HDMI"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceActiveInputHdmi);
        }
        if ([value caseInsensitiveCompare:@"SDI"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceActiveInputSdi);
        }
        return @(AWSMedialiveInputDeviceActiveInputUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceActiveInputHdmi:
                return @"HDMI";
            case AWSMedialiveInputDeviceActiveInputSdi:
                return @"SDI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)configuredInputJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConfiguredInputAuto);
        }
        if ([value caseInsensitiveCompare:@"HDMI"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConfiguredInputHdmi);
        }
        if ([value caseInsensitiveCompare:@"SDI"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConfiguredInputSdi);
        }
        return @(AWSMedialiveInputDeviceConfiguredInputUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceConfiguredInputAuto:
                return @"AUTO";
            case AWSMedialiveInputDeviceConfiguredInputHdmi:
                return @"HDMI";
            case AWSMedialiveInputDeviceConfiguredInputSdi:
                return @"SDI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deviceStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STREAMING"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceStateStreaming);
        }
        return @(AWSMedialiveInputDeviceStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceStateIdle:
                return @"IDLE";
            case AWSMedialiveInputDeviceStateStreaming:
                return @"STREAMING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scanTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERLACED"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceScanTypeInterlaced);
        }
        if ([value caseInsensitiveCompare:@"PROGRESSIVE"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceScanTypeProgressive);
        }
        return @(AWSMedialiveInputDeviceScanTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceScanTypeInterlaced:
                return @"INTERLACED";
            case AWSMedialiveInputDeviceScanTypeProgressive:
                return @"PROGRESSIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveInputDeviceNetworkSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dnsAddresses" : @"DnsAddresses",
             @"gateway" : @"Gateway",
             @"ipAddress" : @"IpAddress",
             @"ipScheme" : @"IpScheme",
             @"subnetMask" : @"SubnetMask",
             };
}

+ (NSValueTransformer *)ipSchemeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceIpSchemeStatic);
        }
        if ([value caseInsensitiveCompare:@"DHCP"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceIpSchemeDhcp);
        }
        return @(AWSMedialiveInputDeviceIpSchemeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceIpSchemeStatic:
                return @"STATIC";
            case AWSMedialiveInputDeviceIpSchemeDhcp:
                return @"DHCP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveInputDeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSMedialiveInputDeviceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSMedialiveInputDeviceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"connectionState" : @"ConnectionState",
             @"deviceSettingsSyncState" : @"DeviceSettingsSyncState",
             @"hdDeviceSettings" : @"HdDeviceSettings",
             @"identifier" : @"Id",
             @"macAddress" : @"MacAddress",
             @"name" : @"Name",
             @"networkSettings" : @"NetworkSettings",
             @"serialNumber" : @"SerialNumber",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)connectionStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISCONNECTED"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConnectionStateDisconnected);
        }
        if ([value caseInsensitiveCompare:@"CONNECTED"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConnectionStateConnected);
        }
        return @(AWSMedialiveInputDeviceConnectionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceConnectionStateDisconnected:
                return @"DISCONNECTED";
            case AWSMedialiveInputDeviceConnectionStateConnected:
                return @"CONNECTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deviceSettingsSyncStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYNCED"] == NSOrderedSame) {
            return @(AWSMedialiveDeviceSettingsSyncStateSynced);
        }
        if ([value caseInsensitiveCompare:@"SYNCING"] == NSOrderedSame) {
            return @(AWSMedialiveDeviceSettingsSyncStateSyncing);
        }
        return @(AWSMedialiveDeviceSettingsSyncStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveDeviceSettingsSyncStateSynced:
                return @"SYNCED";
            case AWSMedialiveDeviceSettingsSyncStateSyncing:
                return @"SYNCING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hdDeviceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputDeviceHdSettings class]];
}

+ (NSValueTransformer *)networkSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputDeviceNetworkSettings class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HD"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceTypeHd);
        }
        return @(AWSMedialiveInputDeviceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceTypeHd:
                return @"HD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveInputLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"passwordParam" : @"PasswordParam",
             @"uri" : @"Uri",
             @"username" : @"Username",
             };
}

@end

@implementation AWSMedialiveInputLossBehavior

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blackFrameMsec" : @"BlackFrameMsec",
             @"inputLossImageColor" : @"InputLossImageColor",
             @"inputLossImageSlate" : @"InputLossImageSlate",
             @"inputLossImageType" : @"InputLossImageType",
             @"repeatFrameMsec" : @"RepeatFrameMsec",
             };
}

+ (NSValueTransformer *)inputLossImageSlateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputLocation class]];
}

+ (NSValueTransformer *)inputLossImageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COLOR"] == NSOrderedSame) {
            return @(AWSMedialiveInputLossImageTypeColor);
        }
        if ([value caseInsensitiveCompare:@"SLATE"] == NSOrderedSame) {
            return @(AWSMedialiveInputLossImageTypeSlate);
        }
        return @(AWSMedialiveInputLossImageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputLossImageTypeColor:
                return @"COLOR";
            case AWSMedialiveInputLossImageTypeSlate:
                return @"SLATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveInputPrepareScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputAttachmentNameReference" : @"InputAttachmentNameReference",
             @"inputClippingSettings" : @"InputClippingSettings",
             @"urlPath" : @"UrlPath",
             };
}

+ (NSValueTransformer *)inputClippingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputClippingSettings class]];
}

@end

@implementation AWSMedialiveInputSecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"inputs" : @"Inputs",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"whitelistRules" : @"WhitelistRules",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveInputSecurityGroupStateIdle);
        }
        if ([value caseInsensitiveCompare:@"IN_USE"] == NSOrderedSame) {
            return @(AWSMedialiveInputSecurityGroupStateInUse);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSMedialiveInputSecurityGroupStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveInputSecurityGroupStateDeleted);
        }
        return @(AWSMedialiveInputSecurityGroupStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputSecurityGroupStateIdle:
                return @"IDLE";
            case AWSMedialiveInputSecurityGroupStateInUse:
                return @"IN_USE";
            case AWSMedialiveInputSecurityGroupStateUpdating:
                return @"UPDATING";
            case AWSMedialiveInputSecurityGroupStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)whitelistRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputWhitelistRule class]];
}

@end

@implementation AWSMedialiveInputSecurityGroupWhitelistRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             @"whitelistRules" : @"WhitelistRules",
             };
}

+ (NSValueTransformer *)whitelistRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputWhitelistRuleCidr class]];
}

@end

@implementation AWSMedialiveInputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioSelectors" : @"AudioSelectors",
             @"captionSelectors" : @"CaptionSelectors",
             @"deblockFilter" : @"DeblockFilter",
             @"denoiseFilter" : @"DenoiseFilter",
             @"filterStrength" : @"FilterStrength",
             @"inputFilter" : @"InputFilter",
             @"networkInputSettings" : @"NetworkInputSettings",
             @"smpte2038DataPreference" : @"Smpte2038DataPreference",
             @"sourceEndBehavior" : @"SourceEndBehavior",
             @"videoSelector" : @"VideoSelector",
             };
}

+ (NSValueTransformer *)audioSelectorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveAudioSelector class]];
}

+ (NSValueTransformer *)captionSelectorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveCaptionSelector class]];
}

+ (NSValueTransformer *)deblockFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeblockFilterDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeblockFilterEnabled);
        }
        return @(AWSMedialiveInputDeblockFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeblockFilterDisabled:
                return @"DISABLED";
            case AWSMedialiveInputDeblockFilterEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)denoiseFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveInputDenoiseFilterDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveInputDenoiseFilterEnabled);
        }
        return @(AWSMedialiveInputDenoiseFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDenoiseFilterDisabled:
                return @"DISABLED";
            case AWSMedialiveInputDenoiseFilterEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMedialiveInputFilterAuto);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveInputFilterDisabled);
        }
        if ([value caseInsensitiveCompare:@"FORCED"] == NSOrderedSame) {
            return @(AWSMedialiveInputFilterForced);
        }
        return @(AWSMedialiveInputFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputFilterAuto:
                return @"AUTO";
            case AWSMedialiveInputFilterDisabled:
                return @"DISABLED";
            case AWSMedialiveInputFilterForced:
                return @"FORCED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)networkInputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveNetworkInputSettings class]];
}

+ (NSValueTransformer *)smpte2038DataPreferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSMedialiveSmpte2038DataPreferenceIgnore);
        }
        if ([value caseInsensitiveCompare:@"PREFER"] == NSOrderedSame) {
            return @(AWSMedialiveSmpte2038DataPreferencePrefer);
        }
        return @(AWSMedialiveSmpte2038DataPreferenceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveSmpte2038DataPreferenceIgnore:
                return @"IGNORE";
            case AWSMedialiveSmpte2038DataPreferencePrefer:
                return @"PREFER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sourceEndBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTINUE"] == NSOrderedSame) {
            return @(AWSMedialiveInputSourceEndBehaviorContinue);
        }
        if ([value caseInsensitiveCompare:@"LOOP"] == NSOrderedSame) {
            return @(AWSMedialiveInputSourceEndBehaviorLoop);
        }
        return @(AWSMedialiveInputSourceEndBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputSourceEndBehaviorContinue:
                return @"CONTINUE";
            case AWSMedialiveInputSourceEndBehaviorLoop:
                return @"LOOP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)videoSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveVideoSelector class]];
}

@end

@implementation AWSMedialiveInputSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"passwordParam" : @"PasswordParam",
             @"url" : @"Url",
             @"username" : @"Username",
             };
}

@end

@implementation AWSMedialiveInputSourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"passwordParam" : @"PasswordParam",
             @"url" : @"Url",
             @"username" : @"Username",
             };
}

@end

@implementation AWSMedialiveInputSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codec" : @"Codec",
             @"maximumBitrate" : @"MaximumBitrate",
             @"resolution" : @"Resolution",
             };
}

+ (NSValueTransformer *)codecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MPEG2"] == NSOrderedSame) {
            return @(AWSMedialiveInputCodecMpeg2);
        }
        if ([value caseInsensitiveCompare:@"AVC"] == NSOrderedSame) {
            return @(AWSMedialiveInputCodecAvc);
        }
        if ([value caseInsensitiveCompare:@"HEVC"] == NSOrderedSame) {
            return @(AWSMedialiveInputCodecHevc);
        }
        return @(AWSMedialiveInputCodecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputCodecMpeg2:
                return @"MPEG2";
            case AWSMedialiveInputCodecAvc:
                return @"AVC";
            case AWSMedialiveInputCodecHevc:
                return @"HEVC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)maximumBitrateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_10_MBPS"] == NSOrderedSame) {
            return @(AWSMedialiveInputMaximumBitrateMax10Mbps);
        }
        if ([value caseInsensitiveCompare:@"MAX_20_MBPS"] == NSOrderedSame) {
            return @(AWSMedialiveInputMaximumBitrateMax20Mbps);
        }
        if ([value caseInsensitiveCompare:@"MAX_50_MBPS"] == NSOrderedSame) {
            return @(AWSMedialiveInputMaximumBitrateMax50Mbps);
        }
        return @(AWSMedialiveInputMaximumBitrateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputMaximumBitrateMax10Mbps:
                return @"MAX_10_MBPS";
            case AWSMedialiveInputMaximumBitrateMax20Mbps:
                return @"MAX_20_MBPS";
            case AWSMedialiveInputMaximumBitrateMax50Mbps:
                return @"MAX_50_MBPS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resolutionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SD"] == NSOrderedSame) {
            return @(AWSMedialiveInputResolutionSd);
        }
        if ([value caseInsensitiveCompare:@"HD"] == NSOrderedSame) {
            return @(AWSMedialiveInputResolutionHd);
        }
        if ([value caseInsensitiveCompare:@"UHD"] == NSOrderedSame) {
            return @(AWSMedialiveInputResolutionUhd);
        }
        return @(AWSMedialiveInputResolutionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputResolutionSd:
                return @"SD";
            case AWSMedialiveInputResolutionHd:
                return @"HD";
            case AWSMedialiveInputResolutionUhd:
                return @"UHD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveInputSwitchScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputAttachmentNameReference" : @"InputAttachmentNameReference",
             @"inputClippingSettings" : @"InputClippingSettings",
             @"urlPath" : @"UrlPath",
             };
}

+ (NSValueTransformer *)inputClippingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputClippingSettings class]];
}

@end

@implementation AWSMedialiveInputVpcRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSMedialiveInputWhitelistRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidr" : @"Cidr",
             };
}

@end

@implementation AWSMedialiveInputWhitelistRuleCidr

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidr" : @"Cidr",
             };
}

@end

@implementation AWSMedialiveInternalServiceError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSMedialiveInvalidRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSMedialiveKeyProviderSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"staticKeySettings" : @"StaticKeySettings",
             };
}

+ (NSValueTransformer *)staticKeySettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveStaticKeySettings class]];
}

@end

@implementation AWSMedialiveLimitExceeded

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSMedialiveListChannelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSMedialiveListChannelsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveChannelSummary class]];
}

@end

@implementation AWSMedialiveListChannelsResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveChannelSummary class]];
}

@end

@implementation AWSMedialiveListInputDevicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSMedialiveListInputDevicesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputDevices" : @"InputDevices",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)inputDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDeviceSummary class]];
}

@end

@implementation AWSMedialiveListInputDevicesResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputDevices" : @"InputDevices",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)inputDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDeviceSummary class]];
}

@end

@implementation AWSMedialiveListInputSecurityGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSMedialiveListInputSecurityGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputSecurityGroups" : @"InputSecurityGroups",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)inputSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputSecurityGroup class]];
}

@end

@implementation AWSMedialiveListInputSecurityGroupsResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputSecurityGroups" : @"InputSecurityGroups",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)inputSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputSecurityGroup class]];
}

@end

@implementation AWSMedialiveListInputsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSMedialiveListInputsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputs" : @"Inputs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)inputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInput class]];
}

@end

@implementation AWSMedialiveListInputsResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputs" : @"Inputs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)inputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInput class]];
}

@end

@implementation AWSMedialiveListMultiplexProgramsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"multiplexId" : @"MultiplexId",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSMedialiveListMultiplexProgramsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexPrograms" : @"MultiplexPrograms",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)multiplexProgramsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMultiplexProgramSummary class]];
}

@end

@implementation AWSMedialiveListMultiplexProgramsResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexPrograms" : @"MultiplexPrograms",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)multiplexProgramsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMultiplexProgramSummary class]];
}

@end

@implementation AWSMedialiveListMultiplexesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSMedialiveListMultiplexesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexes" : @"Multiplexes",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)multiplexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMultiplexSummary class]];
}

@end

@implementation AWSMedialiveListMultiplexesResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexes" : @"Multiplexes",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)multiplexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMultiplexSummary class]];
}

@end

@implementation AWSMedialiveListOfferingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelClass" : @"ChannelClass",
             @"channelConfiguration" : @"ChannelConfiguration",
             @"codec" : @"Codec",
             @"duration" : @"Duration",
             @"maxResults" : @"MaxResults",
             @"maximumBitrate" : @"MaximumBitrate",
             @"maximumFramerate" : @"MaximumFramerate",
             @"nextToken" : @"NextToken",
             @"resolution" : @"Resolution",
             @"resourceType" : @"ResourceType",
             @"specialFeature" : @"SpecialFeature",
             @"videoQuality" : @"VideoQuality",
             };
}

@end

@implementation AWSMedialiveListOfferingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"offerings" : @"Offerings",
             };
}

+ (NSValueTransformer *)offeringsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOffering class]];
}

@end

@implementation AWSMedialiveListOfferingsResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"offerings" : @"Offerings",
             };
}

+ (NSValueTransformer *)offeringsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOffering class]];
}

@end

@implementation AWSMedialiveListReservationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelClass" : @"ChannelClass",
             @"codec" : @"Codec",
             @"maxResults" : @"MaxResults",
             @"maximumBitrate" : @"MaximumBitrate",
             @"maximumFramerate" : @"MaximumFramerate",
             @"nextToken" : @"NextToken",
             @"resolution" : @"Resolution",
             @"resourceType" : @"ResourceType",
             @"specialFeature" : @"SpecialFeature",
             @"videoQuality" : @"VideoQuality",
             };
}

@end

@implementation AWSMedialiveListReservationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"reservations" : @"Reservations",
             };
}

+ (NSValueTransformer *)reservationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveReservation class]];
}

@end

@implementation AWSMedialiveListReservationsResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"reservations" : @"Reservations",
             };
}

+ (NSValueTransformer *)reservationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveReservation class]];
}

@end

@implementation AWSMedialiveListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSMedialiveListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSMedialiveM2tsSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"absentInputAudioBehavior" : @"AbsentInputAudioBehavior",
             @"arib" : @"Arib",
             @"aribCaptionsPid" : @"AribCaptionsPid",
             @"aribCaptionsPidControl" : @"AribCaptionsPidControl",
             @"audioBufferModel" : @"AudioBufferModel",
             @"audioFramesPerPes" : @"AudioFramesPerPes",
             @"audioPids" : @"AudioPids",
             @"audioStreamType" : @"AudioStreamType",
             @"bitrate" : @"Bitrate",
             @"bufferModel" : @"BufferModel",
             @"ccDescriptor" : @"CcDescriptor",
             @"dvbNitSettings" : @"DvbNitSettings",
             @"dvbSdtSettings" : @"DvbSdtSettings",
             @"dvbSubPids" : @"DvbSubPids",
             @"dvbTdtSettings" : @"DvbTdtSettings",
             @"dvbTeletextPid" : @"DvbTeletextPid",
             @"ebif" : @"Ebif",
             @"ebpAudioInterval" : @"EbpAudioInterval",
             @"ebpLookaheadMs" : @"EbpLookaheadMs",
             @"ebpPlacement" : @"EbpPlacement",
             @"ecmPid" : @"EcmPid",
             @"esRateInPes" : @"EsRateInPes",
             @"etvPlatformPid" : @"EtvPlatformPid",
             @"etvSignalPid" : @"EtvSignalPid",
             @"fragmentTime" : @"FragmentTime",
             @"klv" : @"Klv",
             @"klvDataPids" : @"KlvDataPids",
             @"nielsenId3Behavior" : @"NielsenId3Behavior",
             @"nullPacketBitrate" : @"NullPacketBitrate",
             @"patInterval" : @"PatInterval",
             @"pcrControl" : @"PcrControl",
             @"pcrPeriod" : @"PcrPeriod",
             @"pcrPid" : @"PcrPid",
             @"pmtInterval" : @"PmtInterval",
             @"pmtPid" : @"PmtPid",
             @"programNum" : @"ProgramNum",
             @"rateMode" : @"RateMode",
             @"scte27Pids" : @"Scte27Pids",
             @"scte35Control" : @"Scte35Control",
             @"scte35Pid" : @"Scte35Pid",
             @"segmentationMarkers" : @"SegmentationMarkers",
             @"segmentationStyle" : @"SegmentationStyle",
             @"segmentationTime" : @"SegmentationTime",
             @"timedMetadataBehavior" : @"TimedMetadataBehavior",
             @"timedMetadataPid" : @"TimedMetadataPid",
             @"transportStreamId" : @"TransportStreamId",
             @"videoPid" : @"VideoPid",
             };
}

+ (NSValueTransformer *)absentInputAudioBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DROP"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsAbsentInputAudioBehaviorDrop);
        }
        if ([value caseInsensitiveCompare:@"ENCODE_SILENCE"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsAbsentInputAudioBehaviorEncodeSilence);
        }
        return @(AWSMedialiveM2tsAbsentInputAudioBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsAbsentInputAudioBehaviorDrop:
                return @"DROP";
            case AWSMedialiveM2tsAbsentInputAudioBehaviorEncodeSilence:
                return @"ENCODE_SILENCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)aribJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsAribDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsAribEnabled);
        }
        return @(AWSMedialiveM2tsAribUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsAribDisabled:
                return @"DISABLED";
            case AWSMedialiveM2tsAribEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)aribCaptionsPidControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsAribCaptionsPidControlAuto);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsAribCaptionsPidControlUseConfigured);
        }
        return @(AWSMedialiveM2tsAribCaptionsPidControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsAribCaptionsPidControlAuto:
                return @"AUTO";
            case AWSMedialiveM2tsAribCaptionsPidControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)audioBufferModelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ATSC"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsAudioBufferModelAtsc);
        }
        if ([value caseInsensitiveCompare:@"DVB"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsAudioBufferModelDvb);
        }
        return @(AWSMedialiveM2tsAudioBufferModelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsAudioBufferModelAtsc:
                return @"ATSC";
            case AWSMedialiveM2tsAudioBufferModelDvb:
                return @"DVB";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)audioStreamTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ATSC"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsAudioStreamTypeAtsc);
        }
        if ([value caseInsensitiveCompare:@"DVB"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsAudioStreamTypeDvb);
        }
        return @(AWSMedialiveM2tsAudioStreamTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsAudioStreamTypeAtsc:
                return @"ATSC";
            case AWSMedialiveM2tsAudioStreamTypeDvb:
                return @"DVB";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bufferModelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MULTIPLEX"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsBufferModelMultiplex);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsBufferModelNone);
        }
        return @(AWSMedialiveM2tsBufferModelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsBufferModelMultiplex:
                return @"MULTIPLEX";
            case AWSMedialiveM2tsBufferModelNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ccDescriptorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsCcDescriptorDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsCcDescriptorEnabled);
        }
        return @(AWSMedialiveM2tsCcDescriptorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsCcDescriptorDisabled:
                return @"DISABLED";
            case AWSMedialiveM2tsCcDescriptorEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dvbNitSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveDvbNitSettings class]];
}

+ (NSValueTransformer *)dvbSdtSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveDvbSdtSettings class]];
}

+ (NSValueTransformer *)dvbTdtSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveDvbTdtSettings class]];
}

+ (NSValueTransformer *)ebifJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsEbifControlNone);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsEbifControlPassthrough);
        }
        return @(AWSMedialiveM2tsEbifControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsEbifControlNone:
                return @"NONE";
            case AWSMedialiveM2tsEbifControlPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ebpAudioIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VIDEO_AND_FIXED_INTERVALS"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsAudioIntervalVideoAndFixedIntervals);
        }
        if ([value caseInsensitiveCompare:@"VIDEO_INTERVAL"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsAudioIntervalVideoInterval);
        }
        return @(AWSMedialiveM2tsAudioIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsAudioIntervalVideoAndFixedIntervals:
                return @"VIDEO_AND_FIXED_INTERVALS";
            case AWSMedialiveM2tsAudioIntervalVideoInterval:
                return @"VIDEO_INTERVAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ebpPlacementJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VIDEO_AND_AUDIO_PIDS"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsEbpPlacementVideoAndAudioPids);
        }
        if ([value caseInsensitiveCompare:@"VIDEO_PID"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsEbpPlacementVideoPid);
        }
        return @(AWSMedialiveM2tsEbpPlacementUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsEbpPlacementVideoAndAudioPids:
                return @"VIDEO_AND_AUDIO_PIDS";
            case AWSMedialiveM2tsEbpPlacementVideoPid:
                return @"VIDEO_PID";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)esRateInPesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsEsRateInPesExclude);
        }
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsEsRateInPesInclude);
        }
        return @(AWSMedialiveM2tsEsRateInPesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsEsRateInPesExclude:
                return @"EXCLUDE";
            case AWSMedialiveM2tsEsRateInPesInclude:
                return @"INCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)klvJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsKlvNone);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsKlvPassthrough);
        }
        return @(AWSMedialiveM2tsKlvUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsKlvNone:
                return @"NONE";
            case AWSMedialiveM2tsKlvPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nielsenId3BehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsNielsenId3BehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsNielsenId3BehaviorPassthrough);
        }
        return @(AWSMedialiveM2tsNielsenId3BehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsNielsenId3BehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSMedialiveM2tsNielsenId3BehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pcrControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONFIGURED_PCR_PERIOD"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsPcrControlConfiguredPcrPeriod);
        }
        if ([value caseInsensitiveCompare:@"PCR_EVERY_PES_PACKET"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsPcrControlPcrEveryPesPacket);
        }
        return @(AWSMedialiveM2tsPcrControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsPcrControlConfiguredPcrPeriod:
                return @"CONFIGURED_PCR_PERIOD";
            case AWSMedialiveM2tsPcrControlPcrEveryPesPacket:
                return @"PCR_EVERY_PES_PACKET";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsRateModeCbr);
        }
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsRateModeVbr);
        }
        return @(AWSMedialiveM2tsRateModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsRateModeCbr:
                return @"CBR";
            case AWSMedialiveM2tsRateModeVbr:
                return @"VBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35ControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsScte35ControlNone);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsScte35ControlPassthrough);
        }
        return @(AWSMedialiveM2tsScte35ControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsScte35ControlNone:
                return @"NONE";
            case AWSMedialiveM2tsScte35ControlPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentationMarkersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EBP"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsSegmentationMarkersEbp);
        }
        if ([value caseInsensitiveCompare:@"EBP_LEGACY"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsSegmentationMarkersEbpLegacy);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsSegmentationMarkersNone);
        }
        if ([value caseInsensitiveCompare:@"PSI_SEGSTART"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsSegmentationMarkersPsiSegstart);
        }
        if ([value caseInsensitiveCompare:@"RAI_ADAPT"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsSegmentationMarkersRaiAdapt);
        }
        if ([value caseInsensitiveCompare:@"RAI_SEGSTART"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsSegmentationMarkersRaiSegstart);
        }
        return @(AWSMedialiveM2tsSegmentationMarkersUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsSegmentationMarkersEbp:
                return @"EBP";
            case AWSMedialiveM2tsSegmentationMarkersEbpLegacy:
                return @"EBP_LEGACY";
            case AWSMedialiveM2tsSegmentationMarkersNone:
                return @"NONE";
            case AWSMedialiveM2tsSegmentationMarkersPsiSegstart:
                return @"PSI_SEGSTART";
            case AWSMedialiveM2tsSegmentationMarkersRaiAdapt:
                return @"RAI_ADAPT";
            case AWSMedialiveM2tsSegmentationMarkersRaiSegstart:
                return @"RAI_SEGSTART";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentationStyleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAINTAIN_CADENCE"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsSegmentationStyleMaintainCadence);
        }
        if ([value caseInsensitiveCompare:@"RESET_CADENCE"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsSegmentationStyleResetCadence);
        }
        return @(AWSMedialiveM2tsSegmentationStyleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsSegmentationStyleMaintainCadence:
                return @"MAINTAIN_CADENCE";
            case AWSMedialiveM2tsSegmentationStyleResetCadence:
                return @"RESET_CADENCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsTimedMetadataBehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveM2tsTimedMetadataBehaviorPassthrough);
        }
        return @(AWSMedialiveM2tsTimedMetadataBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM2tsTimedMetadataBehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSMedialiveM2tsTimedMetadataBehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveM3u8Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioFramesPerPes" : @"AudioFramesPerPes",
             @"audioPids" : @"AudioPids",
             @"ecmPid" : @"EcmPid",
             @"nielsenId3Behavior" : @"NielsenId3Behavior",
             @"patInterval" : @"PatInterval",
             @"pcrControl" : @"PcrControl",
             @"pcrPeriod" : @"PcrPeriod",
             @"pcrPid" : @"PcrPid",
             @"pmtInterval" : @"PmtInterval",
             @"pmtPid" : @"PmtPid",
             @"programNum" : @"ProgramNum",
             @"scte35Behavior" : @"Scte35Behavior",
             @"scte35Pid" : @"Scte35Pid",
             @"timedMetadataBehavior" : @"TimedMetadataBehavior",
             @"timedMetadataPid" : @"TimedMetadataPid",
             @"transportStreamId" : @"TransportStreamId",
             @"videoPid" : @"VideoPid",
             };
}

+ (NSValueTransformer *)nielsenId3BehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveM3u8NielsenId3BehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveM3u8NielsenId3BehaviorPassthrough);
        }
        return @(AWSMedialiveM3u8NielsenId3BehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM3u8NielsenId3BehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSMedialiveM3u8NielsenId3BehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pcrControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONFIGURED_PCR_PERIOD"] == NSOrderedSame) {
            return @(AWSMedialiveM3u8PcrControlConfiguredPcrPeriod);
        }
        if ([value caseInsensitiveCompare:@"PCR_EVERY_PES_PACKET"] == NSOrderedSame) {
            return @(AWSMedialiveM3u8PcrControlPcrEveryPesPacket);
        }
        return @(AWSMedialiveM3u8PcrControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM3u8PcrControlConfiguredPcrPeriod:
                return @"CONFIGURED_PCR_PERIOD";
            case AWSMedialiveM3u8PcrControlPcrEveryPesPacket:
                return @"PCR_EVERY_PES_PACKET";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35BehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveM3u8Scte35BehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveM3u8Scte35BehaviorPassthrough);
        }
        return @(AWSMedialiveM3u8Scte35BehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM3u8Scte35BehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSMedialiveM3u8Scte35BehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveM3u8TimedMetadataBehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveM3u8TimedMetadataBehaviorPassthrough);
        }
        return @(AWSMedialiveM3u8TimedMetadataBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveM3u8TimedMetadataBehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSMedialiveM3u8TimedMetadataBehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveMediaConnectFlow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowArn" : @"FlowArn",
             };
}

@end

@implementation AWSMedialiveMediaConnectFlowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowArn" : @"FlowArn",
             };
}

@end

@implementation AWSMedialiveMediaPackageGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveOutputLocationRef class]];
}

@end

@implementation AWSMedialiveMediaPackageOutputDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             };
}

@end

@implementation AWSMedialiveMediaPackageOutputSettings

@end

@implementation AWSMedialiveMp2Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bitrate" : @"Bitrate",
             @"codingMode" : @"CodingMode",
             @"sampleRate" : @"SampleRate",
             };
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_0"] == NSOrderedSame) {
            return @(AWSMedialiveMp2CodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSMedialiveMp2CodingModeCodingMode20);
        }
        return @(AWSMedialiveMp2CodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveMp2CodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSMedialiveMp2CodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveMsSmoothGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acquisitionPointId" : @"AcquisitionPointId",
             @"audioOnlyTimecodeControl" : @"AudioOnlyTimecodeControl",
             @"certificateMode" : @"CertificateMode",
             @"connectionRetryInterval" : @"ConnectionRetryInterval",
             @"destination" : @"Destination",
             @"eventId" : @"EventId",
             @"eventIdMode" : @"EventIdMode",
             @"eventStopBehavior" : @"EventStopBehavior",
             @"filecacheDuration" : @"FilecacheDuration",
             @"fragmentLength" : @"FragmentLength",
             @"inputLossAction" : @"InputLossAction",
             @"numRetries" : @"NumRetries",
             @"restartDelay" : @"RestartDelay",
             @"segmentationMode" : @"SegmentationMode",
             @"sendDelayMs" : @"SendDelayMs",
             @"sparseTrackType" : @"SparseTrackType",
             @"streamManifestBehavior" : @"StreamManifestBehavior",
             @"timestampOffset" : @"TimestampOffset",
             @"timestampOffsetMode" : @"TimestampOffsetMode",
             };
}

+ (NSValueTransformer *)audioOnlyTimecodeControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupAudioOnlyTimecodeControlPassthrough);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED_CLOCK"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupAudioOnlyTimecodeControlUseConfiguredClock);
        }
        return @(AWSMedialiveSmoothGroupAudioOnlyTimecodeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveSmoothGroupAudioOnlyTimecodeControlPassthrough:
                return @"PASSTHROUGH";
            case AWSMedialiveSmoothGroupAudioOnlyTimecodeControlUseConfiguredClock:
                return @"USE_CONFIGURED_CLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)certificateModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SELF_SIGNED"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupCertificateModeSelfSigned);
        }
        if ([value caseInsensitiveCompare:@"VERIFY_AUTHENTICITY"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupCertificateModeVerifyAuthenticity);
        }
        return @(AWSMedialiveSmoothGroupCertificateModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveSmoothGroupCertificateModeSelfSigned:
                return @"SELF_SIGNED";
            case AWSMedialiveSmoothGroupCertificateModeVerifyAuthenticity:
                return @"VERIFY_AUTHENTICITY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveOutputLocationRef class]];
}

+ (NSValueTransformer *)eventIdModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_EVENT_ID"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupEventIdModeNoEventId);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupEventIdModeUseConfigured);
        }
        if ([value caseInsensitiveCompare:@"USE_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupEventIdModeUseTimestamp);
        }
        return @(AWSMedialiveSmoothGroupEventIdModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveSmoothGroupEventIdModeNoEventId:
                return @"NO_EVENT_ID";
            case AWSMedialiveSmoothGroupEventIdModeUseConfigured:
                return @"USE_CONFIGURED";
            case AWSMedialiveSmoothGroupEventIdModeUseTimestamp:
                return @"USE_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)eventStopBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupEventStopBehaviorNone);
        }
        if ([value caseInsensitiveCompare:@"SEND_EOS"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupEventStopBehaviorSendEos);
        }
        return @(AWSMedialiveSmoothGroupEventStopBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveSmoothGroupEventStopBehaviorNone:
                return @"NONE";
            case AWSMedialiveSmoothGroupEventStopBehaviorSendEos:
                return @"SEND_EOS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputLossActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMIT_OUTPUT"] == NSOrderedSame) {
            return @(AWSMedialiveInputLossActionForMsSmoothOutEmitOutput);
        }
        if ([value caseInsensitiveCompare:@"PAUSE_OUTPUT"] == NSOrderedSame) {
            return @(AWSMedialiveInputLossActionForMsSmoothOutPauseOutput);
        }
        return @(AWSMedialiveInputLossActionForMsSmoothOutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputLossActionForMsSmoothOutEmitOutput:
                return @"EMIT_OUTPUT";
            case AWSMedialiveInputLossActionForMsSmoothOutPauseOutput:
                return @"PAUSE_OUTPUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentationModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USE_INPUT_SEGMENTATION"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupSegmentationModeUseInputSegmentation);
        }
        if ([value caseInsensitiveCompare:@"USE_SEGMENT_DURATION"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupSegmentationModeUseSegmentDuration);
        }
        return @(AWSMedialiveSmoothGroupSegmentationModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveSmoothGroupSegmentationModeUseInputSegmentation:
                return @"USE_INPUT_SEGMENTATION";
            case AWSMedialiveSmoothGroupSegmentationModeUseSegmentDuration:
                return @"USE_SEGMENT_DURATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sparseTrackTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupSparseTrackTypeNone);
        }
        if ([value caseInsensitiveCompare:@"SCTE_35"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupSparseTrackTypeScte35);
        }
        if ([value caseInsensitiveCompare:@"SCTE_35_WITHOUT_SEGMENTATION"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupSparseTrackTypeScte35WithoutSegmentation);
        }
        return @(AWSMedialiveSmoothGroupSparseTrackTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveSmoothGroupSparseTrackTypeNone:
                return @"NONE";
            case AWSMedialiveSmoothGroupSparseTrackTypeScte35:
                return @"SCTE_35";
            case AWSMedialiveSmoothGroupSparseTrackTypeScte35WithoutSegmentation:
                return @"SCTE_35_WITHOUT_SEGMENTATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)streamManifestBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DO_NOT_SEND"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupStreamManifestBehaviorDoNotSend);
        }
        if ([value caseInsensitiveCompare:@"SEND"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupStreamManifestBehaviorSend);
        }
        return @(AWSMedialiveSmoothGroupStreamManifestBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveSmoothGroupStreamManifestBehaviorDoNotSend:
                return @"DO_NOT_SEND";
            case AWSMedialiveSmoothGroupStreamManifestBehaviorSend:
                return @"SEND";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampOffsetModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED_OFFSET"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupTimestampOffsetModeUseConfiguredOffset);
        }
        if ([value caseInsensitiveCompare:@"USE_EVENT_START_DATE"] == NSOrderedSame) {
            return @(AWSMedialiveSmoothGroupTimestampOffsetModeUseEventStartDate);
        }
        return @(AWSMedialiveSmoothGroupTimestampOffsetModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveSmoothGroupTimestampOffsetModeUseConfiguredOffset:
                return @"USE_CONFIGURED_OFFSET";
            case AWSMedialiveSmoothGroupTimestampOffsetModeUseEventStartDate:
                return @"USE_EVENT_START_DATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveMsSmoothOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"h265PackagingType" : @"H265PackagingType",
             @"nameModifier" : @"NameModifier",
             };
}

+ (NSValueTransformer *)h265PackagingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HEV1"] == NSOrderedSame) {
            return @(AWSMedialiveMsSmoothH265PackagingTypeHev1);
        }
        if ([value caseInsensitiveCompare:@"HVC1"] == NSOrderedSame) {
            return @(AWSMedialiveMsSmoothH265PackagingTypeHvc1);
        }
        return @(AWSMedialiveMsSmoothH265PackagingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveMsSmoothH265PackagingTypeHev1:
                return @"HEV1";
            case AWSMedialiveMsSmoothH265PackagingTypeHvc1:
                return @"HVC1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveMultiplex

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"availabilityZones" : @"AvailabilityZones",
             @"destinations" : @"Destinations",
             @"identifier" : @"Id",
             @"multiplexSettings" : @"MultiplexSettings",
             @"name" : @"Name",
             @"pipelinesRunningCount" : @"PipelinesRunningCount",
             @"programCount" : @"ProgramCount",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMultiplexOutputDestination class]];
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexSettings class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateDeleted);
        }
        return @(AWSMedialiveMultiplexStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveMultiplexStateCreating:
                return @"CREATING";
            case AWSMedialiveMultiplexStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSMedialiveMultiplexStateIdle:
                return @"IDLE";
            case AWSMedialiveMultiplexStateStarting:
                return @"STARTING";
            case AWSMedialiveMultiplexStateRunning:
                return @"RUNNING";
            case AWSMedialiveMultiplexStateRecovering:
                return @"RECOVERING";
            case AWSMedialiveMultiplexStateStopping:
                return @"STOPPING";
            case AWSMedialiveMultiplexStateDeleting:
                return @"DELETING";
            case AWSMedialiveMultiplexStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveMultiplexConfigurationValidationError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"validationErrors" : @"ValidationErrors",
             };
}

+ (NSValueTransformer *)validationErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveValidationError class]];
}

@end

@implementation AWSMedialiveMultiplexGroupSettings

@end

@implementation AWSMedialiveMultiplexMediaConnectOutputDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entitlementArn" : @"EntitlementArn",
             };
}

@end

@implementation AWSMedialiveMultiplexOutputDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mediaConnectSettings" : @"MediaConnectSettings",
             };
}

+ (NSValueTransformer *)mediaConnectSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexMediaConnectOutputDestinationSettings class]];
}

@end

@implementation AWSMedialiveMultiplexOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveOutputLocationRef class]];
}

@end

@implementation AWSMedialiveMultiplexProgram

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             @"packetIdentifiersMap" : @"PacketIdentifiersMap",
             @"programName" : @"ProgramName",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgramSettings class]];
}

+ (NSValueTransformer *)packetIdentifiersMapJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgramPacketIdentifiersMap class]];
}

@end

@implementation AWSMedialiveMultiplexProgramChannelDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             @"programName" : @"ProgramName",
             };
}

@end

@implementation AWSMedialiveMultiplexProgramPacketIdentifiersMap

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioPids" : @"AudioPids",
             @"dvbSubPids" : @"DvbSubPids",
             @"dvbTeletextPid" : @"DvbTeletextPid",
             @"etvPlatformPid" : @"EtvPlatformPid",
             @"etvSignalPid" : @"EtvSignalPid",
             @"klvDataPids" : @"KlvDataPids",
             @"pcrPid" : @"PcrPid",
             @"pmtPid" : @"PmtPid",
             @"privateMetadataPid" : @"PrivateMetadataPid",
             @"scte27Pids" : @"Scte27Pids",
             @"scte35Pid" : @"Scte35Pid",
             @"timedMetadataPid" : @"TimedMetadataPid",
             @"videoPid" : @"VideoPid",
             };
}

@end

@implementation AWSMedialiveMultiplexProgramServiceDescriptor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"providerName" : @"ProviderName",
             @"serviceName" : @"ServiceName",
             };
}

@end

@implementation AWSMedialiveMultiplexProgramSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"preferredChannelPipeline" : @"PreferredChannelPipeline",
             @"programNumber" : @"ProgramNumber",
             @"serviceDescriptor" : @"ServiceDescriptor",
             @"videoSettings" : @"VideoSettings",
             };
}

+ (NSValueTransformer *)preferredChannelPipelineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CURRENTLY_ACTIVE"] == NSOrderedSame) {
            return @(AWSMedialivePreferredChannelPipelineCurrentlyActive);
        }
        if ([value caseInsensitiveCompare:@"PIPELINE_0"] == NSOrderedSame) {
            return @(AWSMedialivePreferredChannelPipelinePipeline0);
        }
        if ([value caseInsensitiveCompare:@"PIPELINE_1"] == NSOrderedSame) {
            return @(AWSMedialivePreferredChannelPipelinePipeline1);
        }
        return @(AWSMedialivePreferredChannelPipelineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialivePreferredChannelPipelineCurrentlyActive:
                return @"CURRENTLY_ACTIVE";
            case AWSMedialivePreferredChannelPipelinePipeline0:
                return @"PIPELINE_0";
            case AWSMedialivePreferredChannelPipelinePipeline1:
                return @"PIPELINE_1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceDescriptorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgramServiceDescriptor class]];
}

+ (NSValueTransformer *)videoSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexVideoSettings class]];
}

@end

@implementation AWSMedialiveMultiplexProgramSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             @"programName" : @"ProgramName",
             };
}

@end

@implementation AWSMedialiveMultiplexSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximumVideoBufferDelayMilliseconds" : @"MaximumVideoBufferDelayMilliseconds",
             @"transportStreamBitrate" : @"TransportStreamBitrate",
             @"transportStreamId" : @"TransportStreamId",
             @"transportStreamReservedBitrate" : @"TransportStreamReservedBitrate",
             };
}

@end

@implementation AWSMedialiveMultiplexSettingsSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transportStreamBitrate" : @"TransportStreamBitrate",
             };
}

@end

@implementation AWSMedialiveMultiplexStatmuxVideoSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximumBitrate" : @"MaximumBitrate",
             @"minimumBitrate" : @"MinimumBitrate",
             };
}

@end

@implementation AWSMedialiveMultiplexSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"availabilityZones" : @"AvailabilityZones",
             @"identifier" : @"Id",
             @"multiplexSettings" : @"MultiplexSettings",
             @"name" : @"Name",
             @"pipelinesRunningCount" : @"PipelinesRunningCount",
             @"programCount" : @"ProgramCount",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexSettingsSummary class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateDeleted);
        }
        return @(AWSMedialiveMultiplexStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveMultiplexStateCreating:
                return @"CREATING";
            case AWSMedialiveMultiplexStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSMedialiveMultiplexStateIdle:
                return @"IDLE";
            case AWSMedialiveMultiplexStateStarting:
                return @"STARTING";
            case AWSMedialiveMultiplexStateRunning:
                return @"RUNNING";
            case AWSMedialiveMultiplexStateRecovering:
                return @"RECOVERING";
            case AWSMedialiveMultiplexStateStopping:
                return @"STOPPING";
            case AWSMedialiveMultiplexStateDeleting:
                return @"DELETING";
            case AWSMedialiveMultiplexStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveMultiplexVideoSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constantBitrate" : @"ConstantBitrate",
             @"statmuxSettings" : @"StatmuxSettings",
             };
}

+ (NSValueTransformer *)statmuxSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexStatmuxVideoSettings class]];
}

@end

@implementation AWSMedialiveNetworkInputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hlsInputSettings" : @"HlsInputSettings",
             @"serverValidation" : @"ServerValidation",
             };
}

+ (NSValueTransformer *)hlsInputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveHlsInputSettings class]];
}

+ (NSValueTransformer *)serverValidationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHECK_CRYPTOGRAPHY_AND_VALIDATE_NAME"] == NSOrderedSame) {
            return @(AWSMedialiveNetworkInputServerValidationCheckCryptographyAndValidateName);
        }
        if ([value caseInsensitiveCompare:@"CHECK_CRYPTOGRAPHY_ONLY"] == NSOrderedSame) {
            return @(AWSMedialiveNetworkInputServerValidationCheckCryptographyOnly);
        }
        return @(AWSMedialiveNetworkInputServerValidationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveNetworkInputServerValidationCheckCryptographyAndValidateName:
                return @"CHECK_CRYPTOGRAPHY_AND_VALIDATE_NAME";
            case AWSMedialiveNetworkInputServerValidationCheckCryptographyOnly:
                return @"CHECK_CRYPTOGRAPHY_ONLY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveNielsenConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributorId" : @"DistributorId",
             @"nielsenPcmToId3Tagging" : @"NielsenPcmToId3Tagging",
             };
}

+ (NSValueTransformer *)nielsenPcmToId3TaggingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveNielsenPcmToId3TaggingStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveNielsenPcmToId3TaggingStateEnabled);
        }
        return @(AWSMedialiveNielsenPcmToId3TaggingStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveNielsenPcmToId3TaggingStateDisabled:
                return @"DISABLED";
            case AWSMedialiveNielsenPcmToId3TaggingStateEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveOffering

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"currencyCode" : @"CurrencyCode",
             @"duration" : @"Duration",
             @"durationUnits" : @"DurationUnits",
             @"fixedPrice" : @"FixedPrice",
             @"offeringDescription" : @"OfferingDescription",
             @"offeringId" : @"OfferingId",
             @"offeringType" : @"OfferingType",
             @"region" : @"Region",
             @"resourceSpecification" : @"ResourceSpecification",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)durationUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MONTHS"] == NSOrderedSame) {
            return @(AWSMedialiveOfferingDurationUnitsMonths);
        }
        return @(AWSMedialiveOfferingDurationUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveOfferingDurationUnitsMonths:
                return @"MONTHS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSMedialiveOfferingTypeNoUpfront);
        }
        return @(AWSMedialiveOfferingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveOfferingTypeNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveReservationResourceSpecification class]];
}

@end

@implementation AWSMedialiveOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioDescriptionNames" : @"AudioDescriptionNames",
             @"captionDescriptionNames" : @"CaptionDescriptionNames",
             @"outputName" : @"OutputName",
             @"outputSettings" : @"OutputSettings",
             @"videoDescriptionName" : @"VideoDescriptionName",
             };
}

+ (NSValueTransformer *)outputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveOutputSettings class]];
}

@end

@implementation AWSMedialiveOutputDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"mediaPackageSettings" : @"MediaPackageSettings",
             @"multiplexSettings" : @"MultiplexSettings",
             @"settings" : @"Settings",
             };
}

+ (NSValueTransformer *)mediaPackageSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMediaPackageOutputDestinationSettings class]];
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgramChannelDestinationSettings class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputDestinationSettings class]];
}

@end

@implementation AWSMedialiveOutputDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"passwordParam" : @"PasswordParam",
             @"streamName" : @"StreamName",
             @"url" : @"Url",
             @"username" : @"Username",
             };
}

@end

@implementation AWSMedialiveOutputGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"outputGroupSettings" : @"OutputGroupSettings",
             @"outputs" : @"Outputs",
             };
}

+ (NSValueTransformer *)outputGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveOutputGroupSettings class]];
}

+ (NSValueTransformer *)outputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutput class]];
}

@end

@implementation AWSMedialiveOutputGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"archiveGroupSettings" : @"ArchiveGroupSettings",
             @"frameCaptureGroupSettings" : @"FrameCaptureGroupSettings",
             @"hlsGroupSettings" : @"HlsGroupSettings",
             @"mediaPackageGroupSettings" : @"MediaPackageGroupSettings",
             @"msSmoothGroupSettings" : @"MsSmoothGroupSettings",
             @"multiplexGroupSettings" : @"MultiplexGroupSettings",
             @"rtmpGroupSettings" : @"RtmpGroupSettings",
             @"udpGroupSettings" : @"UdpGroupSettings",
             };
}

+ (NSValueTransformer *)archiveGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveArchiveGroupSettings class]];
}

+ (NSValueTransformer *)frameCaptureGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveFrameCaptureGroupSettings class]];
}

+ (NSValueTransformer *)hlsGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveHlsGroupSettings class]];
}

+ (NSValueTransformer *)mediaPackageGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMediaPackageGroupSettings class]];
}

+ (NSValueTransformer *)msSmoothGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMsSmoothGroupSettings class]];
}

+ (NSValueTransformer *)multiplexGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexGroupSettings class]];
}

+ (NSValueTransformer *)rtmpGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveRtmpGroupSettings class]];
}

+ (NSValueTransformer *)udpGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveUdpGroupSettings class]];
}

@end

@implementation AWSMedialiveOutputLocationRef

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationRefId" : @"DestinationRefId",
             };
}

@end

@implementation AWSMedialiveOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"archiveOutputSettings" : @"ArchiveOutputSettings",
             @"frameCaptureOutputSettings" : @"FrameCaptureOutputSettings",
             @"hlsOutputSettings" : @"HlsOutputSettings",
             @"mediaPackageOutputSettings" : @"MediaPackageOutputSettings",
             @"msSmoothOutputSettings" : @"MsSmoothOutputSettings",
             @"multiplexOutputSettings" : @"MultiplexOutputSettings",
             @"rtmpOutputSettings" : @"RtmpOutputSettings",
             @"udpOutputSettings" : @"UdpOutputSettings",
             };
}

+ (NSValueTransformer *)archiveOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveArchiveOutputSettings class]];
}

+ (NSValueTransformer *)frameCaptureOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveFrameCaptureOutputSettings class]];
}

+ (NSValueTransformer *)hlsOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveHlsOutputSettings class]];
}

+ (NSValueTransformer *)mediaPackageOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMediaPackageOutputSettings class]];
}

+ (NSValueTransformer *)msSmoothOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMsSmoothOutputSettings class]];
}

+ (NSValueTransformer *)multiplexOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexOutputSettings class]];
}

+ (NSValueTransformer *)rtmpOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveRtmpOutputSettings class]];
}

+ (NSValueTransformer *)udpOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveUdpOutputSettings class]];
}

@end

@implementation AWSMedialivePassThroughSettings

@end

@implementation AWSMedialivePauseStateScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pipelines" : @"Pipelines",
             };
}

+ (NSValueTransformer *)pipelinesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialivePipelinePauseStateSettings class]];
}

@end

@implementation AWSMedialivePipelineDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeInputAttachmentName" : @"ActiveInputAttachmentName",
             @"activeInputSwitchActionName" : @"ActiveInputSwitchActionName",
             @"pipelineId" : @"PipelineId",
             };
}

@end

@implementation AWSMedialivePipelinePauseStateSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pipelineId" : @"PipelineId",
             };
}

+ (NSValueTransformer *)pipelineIdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PIPELINE_0"] == NSOrderedSame) {
            return @(AWSMedialivePipelineIdPipeline0);
        }
        if ([value caseInsensitiveCompare:@"PIPELINE_1"] == NSOrderedSame) {
            return @(AWSMedialivePipelineIdPipeline1);
        }
        return @(AWSMedialivePipelineIdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialivePipelineIdPipeline0:
                return @"PIPELINE_0";
            case AWSMedialivePipelineIdPipeline1:
                return @"PIPELINE_1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialivePurchaseOffering

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"name" : @"Name",
             @"requestId" : @"RequestId",
             @"start" : @"Start",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSMedialivePurchaseOfferingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"name" : @"Name",
             @"offeringId" : @"OfferingId",
             @"requestId" : @"RequestId",
             @"start" : @"Start",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSMedialivePurchaseOfferingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservation" : @"Reservation",
             };
}

+ (NSValueTransformer *)reservationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveReservation class]];
}

@end

@implementation AWSMedialivePurchaseOfferingResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservation" : @"Reservation",
             };
}

+ (NSValueTransformer *)reservationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveReservation class]];
}

@end

@implementation AWSMedialiveRec601Settings

@end

@implementation AWSMedialiveRec709Settings

@end

@implementation AWSMedialiveRemixSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelMappings" : @"ChannelMappings",
             @"channelsIn" : @"ChannelsIn",
             @"channelsOut" : @"ChannelsOut",
             };
}

+ (NSValueTransformer *)channelMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveAudioChannelMapping class]];
}

@end

@implementation AWSMedialiveReservation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"count" : @"Count",
             @"currencyCode" : @"CurrencyCode",
             @"duration" : @"Duration",
             @"durationUnits" : @"DurationUnits",
             @"end" : @"End",
             @"fixedPrice" : @"FixedPrice",
             @"name" : @"Name",
             @"offeringDescription" : @"OfferingDescription",
             @"offeringId" : @"OfferingId",
             @"offeringType" : @"OfferingType",
             @"region" : @"Region",
             @"reservationId" : @"ReservationId",
             @"resourceSpecification" : @"ResourceSpecification",
             @"start" : @"Start",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)durationUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MONTHS"] == NSOrderedSame) {
            return @(AWSMedialiveOfferingDurationUnitsMonths);
        }
        return @(AWSMedialiveOfferingDurationUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveOfferingDurationUnitsMonths:
                return @"MONTHS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSMedialiveOfferingTypeNoUpfront);
        }
        return @(AWSMedialiveOfferingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveOfferingTypeNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveReservationResourceSpecification class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSMedialiveReservationStateActive);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSMedialiveReservationStateExpired);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSMedialiveReservationStateCanceled);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveReservationStateDeleted);
        }
        return @(AWSMedialiveReservationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveReservationStateActive:
                return @"ACTIVE";
            case AWSMedialiveReservationStateExpired:
                return @"EXPIRED";
            case AWSMedialiveReservationStateCanceled:
                return @"CANCELED";
            case AWSMedialiveReservationStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveReservationResourceSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelClass" : @"ChannelClass",
             @"codec" : @"Codec",
             @"maximumBitrate" : @"MaximumBitrate",
             @"maximumFramerate" : @"MaximumFramerate",
             @"resolution" : @"Resolution",
             @"resourceType" : @"ResourceType",
             @"specialFeature" : @"SpecialFeature",
             @"videoQuality" : @"VideoQuality",
             };
}

+ (NSValueTransformer *)channelClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassSinglePipeline);
        }
        return @(AWSMedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSMedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MPEG2"] == NSOrderedSame) {
            return @(AWSMedialiveReservationCodecMpeg2);
        }
        if ([value caseInsensitiveCompare:@"AVC"] == NSOrderedSame) {
            return @(AWSMedialiveReservationCodecAvc);
        }
        if ([value caseInsensitiveCompare:@"HEVC"] == NSOrderedSame) {
            return @(AWSMedialiveReservationCodecHevc);
        }
        if ([value caseInsensitiveCompare:@"AUDIO"] == NSOrderedSame) {
            return @(AWSMedialiveReservationCodecAudio);
        }
        return @(AWSMedialiveReservationCodecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveReservationCodecMpeg2:
                return @"MPEG2";
            case AWSMedialiveReservationCodecAvc:
                return @"AVC";
            case AWSMedialiveReservationCodecHevc:
                return @"HEVC";
            case AWSMedialiveReservationCodecAudio:
                return @"AUDIO";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)maximumBitrateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_10_MBPS"] == NSOrderedSame) {
            return @(AWSMedialiveReservationMaximumBitrateMax10Mbps);
        }
        if ([value caseInsensitiveCompare:@"MAX_20_MBPS"] == NSOrderedSame) {
            return @(AWSMedialiveReservationMaximumBitrateMax20Mbps);
        }
        if ([value caseInsensitiveCompare:@"MAX_50_MBPS"] == NSOrderedSame) {
            return @(AWSMedialiveReservationMaximumBitrateMax50Mbps);
        }
        return @(AWSMedialiveReservationMaximumBitrateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveReservationMaximumBitrateMax10Mbps:
                return @"MAX_10_MBPS";
            case AWSMedialiveReservationMaximumBitrateMax20Mbps:
                return @"MAX_20_MBPS";
            case AWSMedialiveReservationMaximumBitrateMax50Mbps:
                return @"MAX_50_MBPS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)maximumFramerateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_30_FPS"] == NSOrderedSame) {
            return @(AWSMedialiveReservationMaximumFramerateMax30Fps);
        }
        if ([value caseInsensitiveCompare:@"MAX_60_FPS"] == NSOrderedSame) {
            return @(AWSMedialiveReservationMaximumFramerateMax60Fps);
        }
        return @(AWSMedialiveReservationMaximumFramerateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveReservationMaximumFramerateMax30Fps:
                return @"MAX_30_FPS";
            case AWSMedialiveReservationMaximumFramerateMax60Fps:
                return @"MAX_60_FPS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resolutionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SD"] == NSOrderedSame) {
            return @(AWSMedialiveReservationResolutionSd);
        }
        if ([value caseInsensitiveCompare:@"HD"] == NSOrderedSame) {
            return @(AWSMedialiveReservationResolutionHd);
        }
        if ([value caseInsensitiveCompare:@"FHD"] == NSOrderedSame) {
            return @(AWSMedialiveReservationResolutionFhd);
        }
        if ([value caseInsensitiveCompare:@"UHD"] == NSOrderedSame) {
            return @(AWSMedialiveReservationResolutionUhd);
        }
        return @(AWSMedialiveReservationResolutionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveReservationResolutionSd:
                return @"SD";
            case AWSMedialiveReservationResolutionHd:
                return @"HD";
            case AWSMedialiveReservationResolutionFhd:
                return @"FHD";
            case AWSMedialiveReservationResolutionUhd:
                return @"UHD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INPUT"] == NSOrderedSame) {
            return @(AWSMedialiveReservationResourceTypeInput);
        }
        if ([value caseInsensitiveCompare:@"OUTPUT"] == NSOrderedSame) {
            return @(AWSMedialiveReservationResourceTypeOutput);
        }
        if ([value caseInsensitiveCompare:@"MULTIPLEX"] == NSOrderedSame) {
            return @(AWSMedialiveReservationResourceTypeMultiplex);
        }
        if ([value caseInsensitiveCompare:@"CHANNEL"] == NSOrderedSame) {
            return @(AWSMedialiveReservationResourceTypeChannel);
        }
        return @(AWSMedialiveReservationResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveReservationResourceTypeInput:
                return @"INPUT";
            case AWSMedialiveReservationResourceTypeOutput:
                return @"OUTPUT";
            case AWSMedialiveReservationResourceTypeMultiplex:
                return @"MULTIPLEX";
            case AWSMedialiveReservationResourceTypeChannel:
                return @"CHANNEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)specialFeatureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADVANCED_AUDIO"] == NSOrderedSame) {
            return @(AWSMedialiveReservationSpecialFeatureAdvancedAudio);
        }
        if ([value caseInsensitiveCompare:@"AUDIO_NORMALIZATION"] == NSOrderedSame) {
            return @(AWSMedialiveReservationSpecialFeatureAudioNormalization);
        }
        return @(AWSMedialiveReservationSpecialFeatureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveReservationSpecialFeatureAdvancedAudio:
                return @"ADVANCED_AUDIO";
            case AWSMedialiveReservationSpecialFeatureAudioNormalization:
                return @"AUDIO_NORMALIZATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)videoQualityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveReservationVideoQualityStandard);
        }
        if ([value caseInsensitiveCompare:@"ENHANCED"] == NSOrderedSame) {
            return @(AWSMedialiveReservationVideoQualityEnhanced);
        }
        if ([value caseInsensitiveCompare:@"PREMIUM"] == NSOrderedSame) {
            return @(AWSMedialiveReservationVideoQualityPremium);
        }
        return @(AWSMedialiveReservationVideoQualityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveReservationVideoQualityStandard:
                return @"STANDARD";
            case AWSMedialiveReservationVideoQualityEnhanced:
                return @"ENHANCED";
            case AWSMedialiveReservationVideoQualityPremium:
                return @"PREMIUM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveResourceConflict

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSMedialiveResourceNotFound

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSMedialiveRtmpCaptionInfoDestinationSettings

@end

@implementation AWSMedialiveRtmpGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticationScheme" : @"AuthenticationScheme",
             @"cacheFullBehavior" : @"CacheFullBehavior",
             @"cacheLength" : @"CacheLength",
             @"captionData" : @"CaptionData",
             @"inputLossAction" : @"InputLossAction",
             @"restartDelay" : @"RestartDelay",
             };
}

+ (NSValueTransformer *)authenticationSchemeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AKAMAI"] == NSOrderedSame) {
            return @(AWSMedialiveAuthenticationSchemeAkamai);
        }
        if ([value caseInsensitiveCompare:@"COMMON"] == NSOrderedSame) {
            return @(AWSMedialiveAuthenticationSchemeCommon);
        }
        return @(AWSMedialiveAuthenticationSchemeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveAuthenticationSchemeAkamai:
                return @"AKAMAI";
            case AWSMedialiveAuthenticationSchemeCommon:
                return @"COMMON";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)cacheFullBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISCONNECT_IMMEDIATELY"] == NSOrderedSame) {
            return @(AWSMedialiveRtmpCacheFullBehaviorDisconnectImmediately);
        }
        if ([value caseInsensitiveCompare:@"WAIT_FOR_SERVER"] == NSOrderedSame) {
            return @(AWSMedialiveRtmpCacheFullBehaviorWaitForServer);
        }
        return @(AWSMedialiveRtmpCacheFullBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveRtmpCacheFullBehaviorDisconnectImmediately:
                return @"DISCONNECT_IMMEDIATELY";
            case AWSMedialiveRtmpCacheFullBehaviorWaitForServer:
                return @"WAIT_FOR_SERVER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)captionDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSMedialiveRtmpCaptionDataAll);
        }
        if ([value caseInsensitiveCompare:@"FIELD1_608"] == NSOrderedSame) {
            return @(AWSMedialiveRtmpCaptionDataField1608);
        }
        if ([value caseInsensitiveCompare:@"FIELD1_AND_FIELD2_608"] == NSOrderedSame) {
            return @(AWSMedialiveRtmpCaptionDataField1AndField2608);
        }
        return @(AWSMedialiveRtmpCaptionDataUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveRtmpCaptionDataAll:
                return @"ALL";
            case AWSMedialiveRtmpCaptionDataField1608:
                return @"FIELD1_608";
            case AWSMedialiveRtmpCaptionDataField1AndField2608:
                return @"FIELD1_AND_FIELD2_608";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputLossActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMIT_OUTPUT"] == NSOrderedSame) {
            return @(AWSMedialiveInputLossActionForRtmpOutEmitOutput);
        }
        if ([value caseInsensitiveCompare:@"PAUSE_OUTPUT"] == NSOrderedSame) {
            return @(AWSMedialiveInputLossActionForRtmpOutPauseOutput);
        }
        return @(AWSMedialiveInputLossActionForRtmpOutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputLossActionForRtmpOutEmitOutput:
                return @"EMIT_OUTPUT";
            case AWSMedialiveInputLossActionForRtmpOutPauseOutput:
                return @"PAUSE_OUTPUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveRtmpOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateMode" : @"CertificateMode",
             @"connectionRetryInterval" : @"ConnectionRetryInterval",
             @"destination" : @"Destination",
             @"numRetries" : @"NumRetries",
             };
}

+ (NSValueTransformer *)certificateModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SELF_SIGNED"] == NSOrderedSame) {
            return @(AWSMedialiveRtmpOutputCertificateModeSelfSigned);
        }
        if ([value caseInsensitiveCompare:@"VERIFY_AUTHENTICITY"] == NSOrderedSame) {
            return @(AWSMedialiveRtmpOutputCertificateModeVerifyAuthenticity);
        }
        return @(AWSMedialiveRtmpOutputCertificateModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveRtmpOutputCertificateModeSelfSigned:
                return @"SELF_SIGNED";
            case AWSMedialiveRtmpOutputCertificateModeVerifyAuthenticity:
                return @"VERIFY_AUTHENTICITY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveOutputLocationRef class]];
}

@end

@implementation AWSMedialiveScheduleAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionName" : @"ActionName",
             @"scheduleActionSettings" : @"ScheduleActionSettings",
             @"scheduleActionStartSettings" : @"ScheduleActionStartSettings",
             };
}

+ (NSValueTransformer *)scheduleActionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScheduleActionSettings class]];
}

+ (NSValueTransformer *)scheduleActionStartSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScheduleActionStartSettings class]];
}

@end

@implementation AWSMedialiveScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hlsId3SegmentTaggingSettings" : @"HlsId3SegmentTaggingSettings",
             @"hlsTimedMetadataSettings" : @"HlsTimedMetadataSettings",
             @"inputPrepareSettings" : @"InputPrepareSettings",
             @"inputSwitchSettings" : @"InputSwitchSettings",
             @"pauseStateSettings" : @"PauseStateSettings",
             @"scte35ReturnToNetworkSettings" : @"Scte35ReturnToNetworkSettings",
             @"scte35SpliceInsertSettings" : @"Scte35SpliceInsertSettings",
             @"scte35TimeSignalSettings" : @"Scte35TimeSignalSettings",
             @"staticImageActivateSettings" : @"StaticImageActivateSettings",
             @"staticImageDeactivateSettings" : @"StaticImageDeactivateSettings",
             };
}

+ (NSValueTransformer *)hlsId3SegmentTaggingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveHlsId3SegmentTaggingScheduleActionSettings class]];
}

+ (NSValueTransformer *)hlsTimedMetadataSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveHlsTimedMetadataScheduleActionSettings class]];
}

+ (NSValueTransformer *)inputPrepareSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputPrepareScheduleActionSettings class]];
}

+ (NSValueTransformer *)inputSwitchSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSwitchScheduleActionSettings class]];
}

+ (NSValueTransformer *)pauseStateSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialivePauseStateScheduleActionSettings class]];
}

+ (NSValueTransformer *)scte35ReturnToNetworkSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScte35ReturnToNetworkScheduleActionSettings class]];
}

+ (NSValueTransformer *)scte35SpliceInsertSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScte35SpliceInsertScheduleActionSettings class]];
}

+ (NSValueTransformer *)scte35TimeSignalSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScte35TimeSignalScheduleActionSettings class]];
}

+ (NSValueTransformer *)staticImageActivateSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveStaticImageActivateScheduleActionSettings class]];
}

+ (NSValueTransformer *)staticImageDeactivateSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveStaticImageDeactivateScheduleActionSettings class]];
}

@end

@implementation AWSMedialiveScheduleActionStartSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fixedModeScheduleActionStartSettings" : @"FixedModeScheduleActionStartSettings",
             @"followModeScheduleActionStartSettings" : @"FollowModeScheduleActionStartSettings",
             @"immediateModeScheduleActionStartSettings" : @"ImmediateModeScheduleActionStartSettings",
             };
}

+ (NSValueTransformer *)fixedModeScheduleActionStartSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveFixedModeScheduleActionStartSettings class]];
}

+ (NSValueTransformer *)followModeScheduleActionStartSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveFollowModeScheduleActionStartSettings class]];
}

+ (NSValueTransformer *)immediateModeScheduleActionStartSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveImmediateModeScheduleActionStartSettings class]];
}

@end

@implementation AWSMedialiveScheduleDeleteResultModel

@end

@implementation AWSMedialiveScheduleDescribeResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scheduleActions" : @"ScheduleActions",
             };
}

+ (NSValueTransformer *)scheduleActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveScheduleAction class]];
}

@end

@implementation AWSMedialiveScte20PlusEmbeddedDestinationSettings

@end

@implementation AWSMedialiveScte20SourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"convert608To708" : @"Convert608To708",
             @"source608ChannelNumber" : @"Source608ChannelNumber",
             };
}

+ (NSValueTransformer *)convert608To708JSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveScte20Convert608To708Disabled);
        }
        if ([value caseInsensitiveCompare:@"UPCONVERT"] == NSOrderedSame) {
            return @(AWSMedialiveScte20Convert608To708Upconvert);
        }
        return @(AWSMedialiveScte20Convert608To708Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveScte20Convert608To708Disabled:
                return @"DISABLED";
            case AWSMedialiveScte20Convert608To708Upconvert:
                return @"UPCONVERT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveScte27DestinationSettings

@end

@implementation AWSMedialiveScte27SourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pid" : @"Pid",
             };
}

@end

@implementation AWSMedialiveScte35DeliveryRestrictions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"archiveAllowedFlag" : @"ArchiveAllowedFlag",
             @"deviceRestrictions" : @"DeviceRestrictions",
             @"noRegionalBlackoutFlag" : @"NoRegionalBlackoutFlag",
             @"webDeliveryAllowedFlag" : @"WebDeliveryAllowedFlag",
             };
}

+ (NSValueTransformer *)archiveAllowedFlagJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ARCHIVE_NOT_ALLOWED"] == NSOrderedSame) {
            return @(AWSMedialiveScte35ArchiveAllowedFlagArchiveNotAllowed);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVE_ALLOWED"] == NSOrderedSame) {
            return @(AWSMedialiveScte35ArchiveAllowedFlagArchiveAllowed);
        }
        return @(AWSMedialiveScte35ArchiveAllowedFlagUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveScte35ArchiveAllowedFlagArchiveNotAllowed:
                return @"ARCHIVE_NOT_ALLOWED";
            case AWSMedialiveScte35ArchiveAllowedFlagArchiveAllowed:
                return @"ARCHIVE_ALLOWED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deviceRestrictionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveScte35DeviceRestrictionsNone);
        }
        if ([value caseInsensitiveCompare:@"RESTRICT_GROUP0"] == NSOrderedSame) {
            return @(AWSMedialiveScte35DeviceRestrictionsRestrictGroup0);
        }
        if ([value caseInsensitiveCompare:@"RESTRICT_GROUP1"] == NSOrderedSame) {
            return @(AWSMedialiveScte35DeviceRestrictionsRestrictGroup1);
        }
        if ([value caseInsensitiveCompare:@"RESTRICT_GROUP2"] == NSOrderedSame) {
            return @(AWSMedialiveScte35DeviceRestrictionsRestrictGroup2);
        }
        return @(AWSMedialiveScte35DeviceRestrictionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveScte35DeviceRestrictionsNone:
                return @"NONE";
            case AWSMedialiveScte35DeviceRestrictionsRestrictGroup0:
                return @"RESTRICT_GROUP0";
            case AWSMedialiveScte35DeviceRestrictionsRestrictGroup1:
                return @"RESTRICT_GROUP1";
            case AWSMedialiveScte35DeviceRestrictionsRestrictGroup2:
                return @"RESTRICT_GROUP2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)noRegionalBlackoutFlagJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REGIONAL_BLACKOUT"] == NSOrderedSame) {
            return @(AWSMedialiveScte35NoRegionalBlackoutFlagRegionalBlackout);
        }
        if ([value caseInsensitiveCompare:@"NO_REGIONAL_BLACKOUT"] == NSOrderedSame) {
            return @(AWSMedialiveScte35NoRegionalBlackoutFlagNoRegionalBlackout);
        }
        return @(AWSMedialiveScte35NoRegionalBlackoutFlagUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveScte35NoRegionalBlackoutFlagRegionalBlackout:
                return @"REGIONAL_BLACKOUT";
            case AWSMedialiveScte35NoRegionalBlackoutFlagNoRegionalBlackout:
                return @"NO_REGIONAL_BLACKOUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)webDeliveryAllowedFlagJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEB_DELIVERY_NOT_ALLOWED"] == NSOrderedSame) {
            return @(AWSMedialiveScte35WebDeliveryAllowedFlagWebDeliveryNotAllowed);
        }
        if ([value caseInsensitiveCompare:@"WEB_DELIVERY_ALLOWED"] == NSOrderedSame) {
            return @(AWSMedialiveScte35WebDeliveryAllowedFlagWebDeliveryAllowed);
        }
        return @(AWSMedialiveScte35WebDeliveryAllowedFlagUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveScte35WebDeliveryAllowedFlagWebDeliveryNotAllowed:
                return @"WEB_DELIVERY_NOT_ALLOWED";
            case AWSMedialiveScte35WebDeliveryAllowedFlagWebDeliveryAllowed:
                return @"WEB_DELIVERY_ALLOWED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveScte35Descriptor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scte35DescriptorSettings" : @"Scte35DescriptorSettings",
             };
}

+ (NSValueTransformer *)scte35DescriptorSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScte35DescriptorSettings class]];
}

@end

@implementation AWSMedialiveScte35DescriptorSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentationDescriptorScte35DescriptorSettings" : @"SegmentationDescriptorScte35DescriptorSettings",
             };
}

+ (NSValueTransformer *)segmentationDescriptorScte35DescriptorSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScte35SegmentationDescriptor class]];
}

@end

@implementation AWSMedialiveScte35ReturnToNetworkScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spliceEventId" : @"SpliceEventId",
             };
}

@end

@implementation AWSMedialiveScte35SegmentationDescriptor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryRestrictions" : @"DeliveryRestrictions",
             @"segmentNum" : @"SegmentNum",
             @"segmentationCancelIndicator" : @"SegmentationCancelIndicator",
             @"segmentationDuration" : @"SegmentationDuration",
             @"segmentationEventId" : @"SegmentationEventId",
             @"segmentationTypeId" : @"SegmentationTypeId",
             @"segmentationUpid" : @"SegmentationUpid",
             @"segmentationUpidType" : @"SegmentationUpidType",
             @"segmentsExpected" : @"SegmentsExpected",
             @"subSegmentNum" : @"SubSegmentNum",
             @"subSegmentsExpected" : @"SubSegmentsExpected",
             };
}

+ (NSValueTransformer *)deliveryRestrictionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveScte35DeliveryRestrictions class]];
}

+ (NSValueTransformer *)segmentationCancelIndicatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SEGMENTATION_EVENT_NOT_CANCELED"] == NSOrderedSame) {
            return @(AWSMedialiveScte35SegmentationCancelIndicatorSegmentationEventNotCanceled);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTATION_EVENT_CANCELED"] == NSOrderedSame) {
            return @(AWSMedialiveScte35SegmentationCancelIndicatorSegmentationEventCanceled);
        }
        return @(AWSMedialiveScte35SegmentationCancelIndicatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveScte35SegmentationCancelIndicatorSegmentationEventNotCanceled:
                return @"SEGMENTATION_EVENT_NOT_CANCELED";
            case AWSMedialiveScte35SegmentationCancelIndicatorSegmentationEventCanceled:
                return @"SEGMENTATION_EVENT_CANCELED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveScte35SpliceInsert

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adAvailOffset" : @"AdAvailOffset",
             @"noRegionalBlackoutFlag" : @"NoRegionalBlackoutFlag",
             @"webDeliveryAllowedFlag" : @"WebDeliveryAllowedFlag",
             };
}

+ (NSValueTransformer *)noRegionalBlackoutFlagJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW"] == NSOrderedSame) {
            return @(AWSMedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorFollow);
        }
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSMedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorIgnore);
        }
        return @(AWSMedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorFollow:
                return @"FOLLOW";
            case AWSMedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorIgnore:
                return @"IGNORE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)webDeliveryAllowedFlagJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW"] == NSOrderedSame) {
            return @(AWSMedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorFollow);
        }
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSMedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorIgnore);
        }
        return @(AWSMedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorFollow:
                return @"FOLLOW";
            case AWSMedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorIgnore:
                return @"IGNORE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveScte35SpliceInsertScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"spliceEventId" : @"SpliceEventId",
             };
}

@end

@implementation AWSMedialiveScte35TimeSignalApos

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adAvailOffset" : @"AdAvailOffset",
             @"noRegionalBlackoutFlag" : @"NoRegionalBlackoutFlag",
             @"webDeliveryAllowedFlag" : @"WebDeliveryAllowedFlag",
             };
}

+ (NSValueTransformer *)noRegionalBlackoutFlagJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW"] == NSOrderedSame) {
            return @(AWSMedialiveScte35AposNoRegionalBlackoutBehaviorFollow);
        }
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSMedialiveScte35AposNoRegionalBlackoutBehaviorIgnore);
        }
        return @(AWSMedialiveScte35AposNoRegionalBlackoutBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveScte35AposNoRegionalBlackoutBehaviorFollow:
                return @"FOLLOW";
            case AWSMedialiveScte35AposNoRegionalBlackoutBehaviorIgnore:
                return @"IGNORE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)webDeliveryAllowedFlagJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW"] == NSOrderedSame) {
            return @(AWSMedialiveScte35AposWebDeliveryAllowedBehaviorFollow);
        }
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSMedialiveScte35AposWebDeliveryAllowedBehaviorIgnore);
        }
        return @(AWSMedialiveScte35AposWebDeliveryAllowedBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveScte35AposWebDeliveryAllowedBehaviorFollow:
                return @"FOLLOW";
            case AWSMedialiveScte35AposWebDeliveryAllowedBehaviorIgnore:
                return @"IGNORE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveScte35TimeSignalScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scte35Descriptors" : @"Scte35Descriptors",
             };
}

+ (NSValueTransformer *)scte35DescriptorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveScte35Descriptor class]];
}

@end

@implementation AWSMedialiveSmpteTtDestinationSettings

@end

@implementation AWSMedialiveStandardHlsSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioRenditionSets" : @"AudioRenditionSets",
             @"m3u8Settings" : @"M3u8Settings",
             };
}

+ (NSValueTransformer *)m3u8SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveM3u8Settings class]];
}

@end

@implementation AWSMedialiveStartChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             };
}

@end

@implementation AWSMedialiveStartChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"channelClass" : @"ChannelClass",
             @"destinations" : @"Destinations",
             @"egressEndpoints" : @"EgressEndpoints",
             @"encoderSettings" : @"EncoderSettings",
             @"identifier" : @"Id",
             @"inputAttachments" : @"InputAttachments",
             @"inputSpecification" : @"InputSpecification",
             @"logLevel" : @"LogLevel",
             @"name" : @"Name",
             @"pipelineDetails" : @"PipelineDetails",
             @"pipelinesRunningCount" : @"PipelinesRunningCount",
             @"roleArn" : @"RoleArn",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)channelClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassSinglePipeline);
        }
        return @(AWSMedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSMedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputDestination class]];
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveChannelEgressEndpoint class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDisabled);
        }
        return @(AWSMedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveLogLevelError:
                return @"ERROR";
            case AWSMedialiveLogLevelWarning:
                return @"WARNING";
            case AWSMedialiveLogLevelInfo:
                return @"INFO";
            case AWSMedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSMedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pipelineDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialivePipelineDetail class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateUpdateFailed);
        }
        return @(AWSMedialiveChannelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelStateCreating:
                return @"CREATING";
            case AWSMedialiveChannelStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSMedialiveChannelStateIdle:
                return @"IDLE";
            case AWSMedialiveChannelStateStarting:
                return @"STARTING";
            case AWSMedialiveChannelStateRunning:
                return @"RUNNING";
            case AWSMedialiveChannelStateRecovering:
                return @"RECOVERING";
            case AWSMedialiveChannelStateStopping:
                return @"STOPPING";
            case AWSMedialiveChannelStateDeleting:
                return @"DELETING";
            case AWSMedialiveChannelStateDeleted:
                return @"DELETED";
            case AWSMedialiveChannelStateUpdating:
                return @"UPDATING";
            case AWSMedialiveChannelStateUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveStartMultiplexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             };
}

@end

@implementation AWSMedialiveStartMultiplexResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"availabilityZones" : @"AvailabilityZones",
             @"destinations" : @"Destinations",
             @"identifier" : @"Id",
             @"multiplexSettings" : @"MultiplexSettings",
             @"name" : @"Name",
             @"pipelinesRunningCount" : @"PipelinesRunningCount",
             @"programCount" : @"ProgramCount",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMultiplexOutputDestination class]];
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexSettings class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateDeleted);
        }
        return @(AWSMedialiveMultiplexStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveMultiplexStateCreating:
                return @"CREATING";
            case AWSMedialiveMultiplexStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSMedialiveMultiplexStateIdle:
                return @"IDLE";
            case AWSMedialiveMultiplexStateStarting:
                return @"STARTING";
            case AWSMedialiveMultiplexStateRunning:
                return @"RUNNING";
            case AWSMedialiveMultiplexStateRecovering:
                return @"RECOVERING";
            case AWSMedialiveMultiplexStateStopping:
                return @"STOPPING";
            case AWSMedialiveMultiplexStateDeleting:
                return @"DELETING";
            case AWSMedialiveMultiplexStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveStartTimecode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timecode" : @"Timecode",
             };
}

@end

@implementation AWSMedialiveStaticImageActivateScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"fadeIn" : @"FadeIn",
             @"fadeOut" : @"FadeOut",
             @"height" : @"Height",
             @"image" : @"Image",
             @"imageX" : @"ImageX",
             @"imageY" : @"ImageY",
             @"layer" : @"Layer",
             @"opacity" : @"Opacity",
             @"width" : @"Width",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputLocation class]];
}

@end

@implementation AWSMedialiveStaticImageDeactivateScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fadeOut" : @"FadeOut",
             @"layer" : @"Layer",
             };
}

@end

@implementation AWSMedialiveStaticKeySettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyProviderServer" : @"KeyProviderServer",
             @"staticKeyValue" : @"StaticKeyValue",
             };
}

+ (NSValueTransformer *)keyProviderServerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputLocation class]];
}

@end

@implementation AWSMedialiveStopChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             };
}

@end

@implementation AWSMedialiveStopChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"channelClass" : @"ChannelClass",
             @"destinations" : @"Destinations",
             @"egressEndpoints" : @"EgressEndpoints",
             @"encoderSettings" : @"EncoderSettings",
             @"identifier" : @"Id",
             @"inputAttachments" : @"InputAttachments",
             @"inputSpecification" : @"InputSpecification",
             @"logLevel" : @"LogLevel",
             @"name" : @"Name",
             @"pipelineDetails" : @"PipelineDetails",
             @"pipelinesRunningCount" : @"PipelinesRunningCount",
             @"roleArn" : @"RoleArn",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)channelClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassSinglePipeline);
        }
        return @(AWSMedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSMedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputDestination class]];
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveChannelEgressEndpoint class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDisabled);
        }
        return @(AWSMedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveLogLevelError:
                return @"ERROR";
            case AWSMedialiveLogLevelWarning:
                return @"WARNING";
            case AWSMedialiveLogLevelInfo:
                return @"INFO";
            case AWSMedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSMedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pipelineDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialivePipelineDetail class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveChannelStateUpdateFailed);
        }
        return @(AWSMedialiveChannelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelStateCreating:
                return @"CREATING";
            case AWSMedialiveChannelStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSMedialiveChannelStateIdle:
                return @"IDLE";
            case AWSMedialiveChannelStateStarting:
                return @"STARTING";
            case AWSMedialiveChannelStateRunning:
                return @"RUNNING";
            case AWSMedialiveChannelStateRecovering:
                return @"RECOVERING";
            case AWSMedialiveChannelStateStopping:
                return @"STOPPING";
            case AWSMedialiveChannelStateDeleting:
                return @"DELETING";
            case AWSMedialiveChannelStateDeleted:
                return @"DELETED";
            case AWSMedialiveChannelStateUpdating:
                return @"UPDATING";
            case AWSMedialiveChannelStateUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveStopMultiplexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             };
}

@end

@implementation AWSMedialiveStopMultiplexResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"availabilityZones" : @"AvailabilityZones",
             @"destinations" : @"Destinations",
             @"identifier" : @"Id",
             @"multiplexSettings" : @"MultiplexSettings",
             @"name" : @"Name",
             @"pipelinesRunningCount" : @"PipelinesRunningCount",
             @"programCount" : @"ProgramCount",
             @"state" : @"State",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMultiplexOutputDestination class]];
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexSettings class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSMedialiveMultiplexStateDeleted);
        }
        return @(AWSMedialiveMultiplexStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveMultiplexStateCreating:
                return @"CREATING";
            case AWSMedialiveMultiplexStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSMedialiveMultiplexStateIdle:
                return @"IDLE";
            case AWSMedialiveMultiplexStateStarting:
                return @"STARTING";
            case AWSMedialiveMultiplexStateRunning:
                return @"RUNNING";
            case AWSMedialiveMultiplexStateRecovering:
                return @"RECOVERING";
            case AWSMedialiveMultiplexStateStopping:
                return @"STOPPING";
            case AWSMedialiveMultiplexStateDeleting:
                return @"DELETING";
            case AWSMedialiveMultiplexStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveStopTimecode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastFrameClippingBehavior" : @"LastFrameClippingBehavior",
             @"timecode" : @"Timecode",
             };
}

+ (NSValueTransformer *)lastFrameClippingBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXCLUDE_LAST_FRAME"] == NSOrderedSame) {
            return @(AWSMedialiveLastFrameClippingBehaviorExcludeLastFrame);
        }
        if ([value caseInsensitiveCompare:@"INCLUDE_LAST_FRAME"] == NSOrderedSame) {
            return @(AWSMedialiveLastFrameClippingBehaviorIncludeLastFrame);
        }
        return @(AWSMedialiveLastFrameClippingBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveLastFrameClippingBehaviorExcludeLastFrame:
                return @"EXCLUDE_LAST_FRAME";
            case AWSMedialiveLastFrameClippingBehaviorIncludeLastFrame:
                return @"INCLUDE_LAST_FRAME";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveTagsModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSMedialiveTeletextDestinationSettings

@end

@implementation AWSMedialiveTeletextSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageNumber" : @"PageNumber",
             };
}

@end

@implementation AWSMedialiveTemporalFilterSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"postFilterSharpening" : @"PostFilterSharpening",
             @"strength" : @"Strength",
             };
}

+ (NSValueTransformer *)postFilterSharpeningJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterPostFilterSharpeningAuto);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterPostFilterSharpeningDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterPostFilterSharpeningEnabled);
        }
        return @(AWSMedialiveTemporalFilterPostFilterSharpeningUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveTemporalFilterPostFilterSharpeningAuto:
                return @"AUTO";
            case AWSMedialiveTemporalFilterPostFilterSharpeningDisabled:
                return @"DISABLED";
            case AWSMedialiveTemporalFilterPostFilterSharpeningEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)strengthJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthAuto);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_1"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength1);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_2"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength2);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_3"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength3);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_4"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength4);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_5"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength5);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_6"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength6);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_7"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength7);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_8"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength8);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_9"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength9);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_10"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength10);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_11"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength11);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_12"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength12);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_13"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength13);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_14"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength14);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_15"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength15);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_16"] == NSOrderedSame) {
            return @(AWSMedialiveTemporalFilterStrengthStrength16);
        }
        return @(AWSMedialiveTemporalFilterStrengthUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveTemporalFilterStrengthAuto:
                return @"AUTO";
            case AWSMedialiveTemporalFilterStrengthStrength1:
                return @"STRENGTH_1";
            case AWSMedialiveTemporalFilterStrengthStrength2:
                return @"STRENGTH_2";
            case AWSMedialiveTemporalFilterStrengthStrength3:
                return @"STRENGTH_3";
            case AWSMedialiveTemporalFilterStrengthStrength4:
                return @"STRENGTH_4";
            case AWSMedialiveTemporalFilterStrengthStrength5:
                return @"STRENGTH_5";
            case AWSMedialiveTemporalFilterStrengthStrength6:
                return @"STRENGTH_6";
            case AWSMedialiveTemporalFilterStrengthStrength7:
                return @"STRENGTH_7";
            case AWSMedialiveTemporalFilterStrengthStrength8:
                return @"STRENGTH_8";
            case AWSMedialiveTemporalFilterStrengthStrength9:
                return @"STRENGTH_9";
            case AWSMedialiveTemporalFilterStrengthStrength10:
                return @"STRENGTH_10";
            case AWSMedialiveTemporalFilterStrengthStrength11:
                return @"STRENGTH_11";
            case AWSMedialiveTemporalFilterStrengthStrength12:
                return @"STRENGTH_12";
            case AWSMedialiveTemporalFilterStrengthStrength13:
                return @"STRENGTH_13";
            case AWSMedialiveTemporalFilterStrengthStrength14:
                return @"STRENGTH_14";
            case AWSMedialiveTemporalFilterStrengthStrength15:
                return @"STRENGTH_15";
            case AWSMedialiveTemporalFilterStrengthStrength16:
                return @"STRENGTH_16";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveTimecodeConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"source" : @"Source",
             @"syncThreshold" : @"SyncThreshold",
             };
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMBEDDED"] == NSOrderedSame) {
            return @(AWSMedialiveTimecodeConfigSourceEmbedded);
        }
        if ([value caseInsensitiveCompare:@"SYSTEMCLOCK"] == NSOrderedSame) {
            return @(AWSMedialiveTimecodeConfigSourceSystemclock);
        }
        if ([value caseInsensitiveCompare:@"ZEROBASED"] == NSOrderedSame) {
            return @(AWSMedialiveTimecodeConfigSourceZerobased);
        }
        return @(AWSMedialiveTimecodeConfigSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveTimecodeConfigSourceEmbedded:
                return @"EMBEDDED";
            case AWSMedialiveTimecodeConfigSourceSystemclock:
                return @"SYSTEMCLOCK";
            case AWSMedialiveTimecodeConfigSourceZerobased:
                return @"ZEROBASED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveTtmlDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"styleControl" : @"StyleControl",
             };
}

+ (NSValueTransformer *)styleControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveTtmlDestinationStyleControlPassthrough);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSMedialiveTtmlDestinationStyleControlUseConfigured);
        }
        return @(AWSMedialiveTtmlDestinationStyleControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveTtmlDestinationStyleControlPassthrough:
                return @"PASSTHROUGH";
            case AWSMedialiveTtmlDestinationStyleControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveUdpContainerSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"m2tsSettings" : @"M2tsSettings",
             };
}

+ (NSValueTransformer *)m2tsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveM2tsSettings class]];
}

@end

@implementation AWSMedialiveUdpGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputLossAction" : @"InputLossAction",
             @"timedMetadataId3Frame" : @"TimedMetadataId3Frame",
             @"timedMetadataId3Period" : @"TimedMetadataId3Period",
             };
}

+ (NSValueTransformer *)inputLossActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DROP_PROGRAM"] == NSOrderedSame) {
            return @(AWSMedialiveInputLossActionForUdpOutDropProgram);
        }
        if ([value caseInsensitiveCompare:@"DROP_TS"] == NSOrderedSame) {
            return @(AWSMedialiveInputLossActionForUdpOutDropTs);
        }
        if ([value caseInsensitiveCompare:@"EMIT_PROGRAM"] == NSOrderedSame) {
            return @(AWSMedialiveInputLossActionForUdpOutEmitProgram);
        }
        return @(AWSMedialiveInputLossActionForUdpOutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputLossActionForUdpOutDropProgram:
                return @"DROP_PROGRAM";
            case AWSMedialiveInputLossActionForUdpOutDropTs:
                return @"DROP_TS";
            case AWSMedialiveInputLossActionForUdpOutEmitProgram:
                return @"EMIT_PROGRAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataId3FrameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveUdpTimedMetadataId3FrameNone);
        }
        if ([value caseInsensitiveCompare:@"PRIV"] == NSOrderedSame) {
            return @(AWSMedialiveUdpTimedMetadataId3FramePriv);
        }
        if ([value caseInsensitiveCompare:@"TDRL"] == NSOrderedSame) {
            return @(AWSMedialiveUdpTimedMetadataId3FrameTdrl);
        }
        return @(AWSMedialiveUdpTimedMetadataId3FrameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveUdpTimedMetadataId3FrameNone:
                return @"NONE";
            case AWSMedialiveUdpTimedMetadataId3FramePriv:
                return @"PRIV";
            case AWSMedialiveUdpTimedMetadataId3FrameTdrl:
                return @"TDRL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveUdpOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferMsec" : @"BufferMsec",
             @"containerSettings" : @"ContainerSettings",
             @"destination" : @"Destination",
             @"fecOutputSettings" : @"FecOutputSettings",
             };
}

+ (NSValueTransformer *)containerSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveUdpContainerSettings class]];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveOutputLocationRef class]];
}

+ (NSValueTransformer *)fecOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveFecOutputSettings class]];
}

@end

@implementation AWSMedialiveUpdateChannel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"Destinations",
             @"encoderSettings" : @"EncoderSettings",
             @"inputAttachments" : @"InputAttachments",
             @"inputSpecification" : @"InputSpecification",
             @"logLevel" : @"LogLevel",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputDestination class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDisabled);
        }
        return @(AWSMedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveLogLevelError:
                return @"ERROR";
            case AWSMedialiveLogLevelWarning:
                return @"WARNING";
            case AWSMedialiveLogLevelInfo:
                return @"INFO";
            case AWSMedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSMedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveUpdateChannelClass

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelClass" : @"ChannelClass",
             @"destinations" : @"Destinations",
             };
}

+ (NSValueTransformer *)channelClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassSinglePipeline);
        }
        return @(AWSMedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSMedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputDestination class]];
}

@end

@implementation AWSMedialiveUpdateChannelClassRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelClass" : @"ChannelClass",
             @"channelId" : @"ChannelId",
             @"destinations" : @"Destinations",
             };
}

+ (NSValueTransformer *)channelClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSMedialiveChannelClassSinglePipeline);
        }
        return @(AWSMedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSMedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputDestination class]];
}

@end

@implementation AWSMedialiveUpdateChannelClassResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveChannel class]];
}

@end

@implementation AWSMedialiveUpdateChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             @"destinations" : @"Destinations",
             @"encoderSettings" : @"EncoderSettings",
             @"inputAttachments" : @"InputAttachments",
             @"inputSpecification" : @"InputSpecification",
             @"logLevel" : @"LogLevel",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveOutputDestination class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSMedialiveLogLevelDisabled);
        }
        return @(AWSMedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveLogLevelError:
                return @"ERROR";
            case AWSMedialiveLogLevelWarning:
                return @"WARNING";
            case AWSMedialiveLogLevelInfo:
                return @"INFO";
            case AWSMedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSMedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveUpdateChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveChannel class]];
}

@end

@implementation AWSMedialiveUpdateChannelResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveChannel class]];
}

@end

@implementation AWSMedialiveUpdateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"Destinations",
             @"inputDevices" : @"InputDevices",
             @"inputSecurityGroups" : @"InputSecurityGroups",
             @"mediaConnectFlows" : @"MediaConnectFlows",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"sources" : @"Sources",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDestinationRequest class]];
}

+ (NSValueTransformer *)inputDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDeviceRequest class]];
}

+ (NSValueTransformer *)mediaConnectFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMediaConnectFlowRequest class]];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputSourceRequest class]];
}

@end

@implementation AWSMedialiveUpdateInputDevice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hdDeviceSettings" : @"HdDeviceSettings",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)hdDeviceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputDeviceConfigurableSettings class]];
}

@end

@implementation AWSMedialiveUpdateInputDeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hdDeviceSettings" : @"HdDeviceSettings",
             @"inputDeviceId" : @"InputDeviceId",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)hdDeviceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputDeviceConfigurableSettings class]];
}

@end

@implementation AWSMedialiveUpdateInputDeviceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"connectionState" : @"ConnectionState",
             @"deviceSettingsSyncState" : @"DeviceSettingsSyncState",
             @"hdDeviceSettings" : @"HdDeviceSettings",
             @"identifier" : @"Id",
             @"macAddress" : @"MacAddress",
             @"name" : @"Name",
             @"networkSettings" : @"NetworkSettings",
             @"serialNumber" : @"SerialNumber",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)connectionStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISCONNECTED"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConnectionStateDisconnected);
        }
        if ([value caseInsensitiveCompare:@"CONNECTED"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceConnectionStateConnected);
        }
        return @(AWSMedialiveInputDeviceConnectionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceConnectionStateDisconnected:
                return @"DISCONNECTED";
            case AWSMedialiveInputDeviceConnectionStateConnected:
                return @"CONNECTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deviceSettingsSyncStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYNCED"] == NSOrderedSame) {
            return @(AWSMedialiveDeviceSettingsSyncStateSynced);
        }
        if ([value caseInsensitiveCompare:@"SYNCING"] == NSOrderedSame) {
            return @(AWSMedialiveDeviceSettingsSyncStateSyncing);
        }
        return @(AWSMedialiveDeviceSettingsSyncStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveDeviceSettingsSyncStateSynced:
                return @"SYNCED";
            case AWSMedialiveDeviceSettingsSyncStateSyncing:
                return @"SYNCING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hdDeviceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputDeviceHdSettings class]];
}

+ (NSValueTransformer *)networkSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputDeviceNetworkSettings class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HD"] == NSOrderedSame) {
            return @(AWSMedialiveInputDeviceTypeHd);
        }
        return @(AWSMedialiveInputDeviceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveInputDeviceTypeHd:
                return @"HD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveUpdateInputRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"Destinations",
             @"inputDevices" : @"InputDevices",
             @"inputId" : @"InputId",
             @"inputSecurityGroups" : @"InputSecurityGroups",
             @"mediaConnectFlows" : @"MediaConnectFlows",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"sources" : @"Sources",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDestinationRequest class]];
}

+ (NSValueTransformer *)inputDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputDeviceRequest class]];
}

+ (NSValueTransformer *)mediaConnectFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveMediaConnectFlowRequest class]];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputSourceRequest class]];
}

@end

@implementation AWSMedialiveUpdateInputResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInput class]];
}

@end

@implementation AWSMedialiveUpdateInputResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInput class]];
}

@end

@implementation AWSMedialiveUpdateInputSecurityGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputSecurityGroupId" : @"InputSecurityGroupId",
             @"tags" : @"Tags",
             @"whitelistRules" : @"WhitelistRules",
             };
}

+ (NSValueTransformer *)whitelistRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMedialiveInputWhitelistRuleCidr class]];
}

@end

@implementation AWSMedialiveUpdateInputSecurityGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroup" : @"SecurityGroup",
             };
}

+ (NSValueTransformer *)securityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSecurityGroup class]];
}

@end

@implementation AWSMedialiveUpdateInputSecurityGroupResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroup" : @"SecurityGroup",
             };
}

+ (NSValueTransformer *)securityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveInputSecurityGroup class]];
}

@end

@implementation AWSMedialiveUpdateMultiplex

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexSettings" : @"MultiplexSettings",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexSettings class]];
}

@end

@implementation AWSMedialiveUpdateMultiplexProgram

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgramSettings class]];
}

@end

@implementation AWSMedialiveUpdateMultiplexProgramRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             @"programName" : @"ProgramName",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgramSettings class]];
}

@end

@implementation AWSMedialiveUpdateMultiplexProgramResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexProgram" : @"MultiplexProgram",
             };
}

+ (NSValueTransformer *)multiplexProgramJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgram class]];
}

@end

@implementation AWSMedialiveUpdateMultiplexProgramResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexProgram" : @"MultiplexProgram",
             };
}

+ (NSValueTransformer *)multiplexProgramJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexProgram class]];
}

@end

@implementation AWSMedialiveUpdateMultiplexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             @"multiplexSettings" : @"MultiplexSettings",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplexSettings class]];
}

@end

@implementation AWSMedialiveUpdateMultiplexResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplex" : @"Multiplex",
             };
}

+ (NSValueTransformer *)multiplexJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplex class]];
}

@end

@implementation AWSMedialiveUpdateMultiplexResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplex" : @"Multiplex",
             };
}

+ (NSValueTransformer *)multiplexJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveMultiplex class]];
}

@end

@implementation AWSMedialiveUpdateReservation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSMedialiveUpdateReservationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"reservationId" : @"ReservationId",
             };
}

@end

@implementation AWSMedialiveUpdateReservationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservation" : @"Reservation",
             };
}

+ (NSValueTransformer *)reservationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveReservation class]];
}

@end

@implementation AWSMedialiveUpdateReservationResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservation" : @"Reservation",
             };
}

+ (NSValueTransformer *)reservationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveReservation class]];
}

@end

@implementation AWSMedialiveValidationError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"elementPath" : @"ElementPath",
             @"errorMessage" : @"ErrorMessage",
             };
}

@end

@implementation AWSMedialiveVideoCodecSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"frameCaptureSettings" : @"FrameCaptureSettings",
             @"h264Settings" : @"H264Settings",
             @"h265Settings" : @"H265Settings",
             };
}

+ (NSValueTransformer *)frameCaptureSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveFrameCaptureSettings class]];
}

+ (NSValueTransformer *)h264SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveH264Settings class]];
}

+ (NSValueTransformer *)h265SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveH265Settings class]];
}

@end

@implementation AWSMedialiveVideoDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codecSettings" : @"CodecSettings",
             @"height" : @"Height",
             @"name" : @"Name",
             @"respondToAfd" : @"RespondToAfd",
             @"scalingBehavior" : @"ScalingBehavior",
             @"sharpness" : @"Sharpness",
             @"width" : @"Width",
             };
}

+ (NSValueTransformer *)codecSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveVideoCodecSettings class]];
}

+ (NSValueTransformer *)respondToAfdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSMedialiveVideoDescriptionRespondToAfdNone);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSMedialiveVideoDescriptionRespondToAfdPassthrough);
        }
        if ([value caseInsensitiveCompare:@"RESPOND"] == NSOrderedSame) {
            return @(AWSMedialiveVideoDescriptionRespondToAfdRespond);
        }
        return @(AWSMedialiveVideoDescriptionRespondToAfdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveVideoDescriptionRespondToAfdNone:
                return @"NONE";
            case AWSMedialiveVideoDescriptionRespondToAfdPassthrough:
                return @"PASSTHROUGH";
            case AWSMedialiveVideoDescriptionRespondToAfdRespond:
                return @"RESPOND";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scalingBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSMedialiveVideoDescriptionScalingBehaviorDefault);
        }
        if ([value caseInsensitiveCompare:@"STRETCH_TO_OUTPUT"] == NSOrderedSame) {
            return @(AWSMedialiveVideoDescriptionScalingBehaviorStretchToOutput);
        }
        return @(AWSMedialiveVideoDescriptionScalingBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveVideoDescriptionScalingBehaviorDefault:
                return @"DEFAULT";
            case AWSMedialiveVideoDescriptionScalingBehaviorStretchToOutput:
                return @"STRETCH_TO_OUTPUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMedialiveVideoSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"colorSpace" : @"ColorSpace",
             @"colorSpaceUsage" : @"ColorSpaceUsage",
             @"selectorSettings" : @"SelectorSettings",
             };
}

+ (NSValueTransformer *)colorSpaceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW"] == NSOrderedSame) {
            return @(AWSMedialiveVideoSelectorColorSpaceFollow);
        }
        if ([value caseInsensitiveCompare:@"REC_601"] == NSOrderedSame) {
            return @(AWSMedialiveVideoSelectorColorSpaceRec601);
        }
        if ([value caseInsensitiveCompare:@"REC_709"] == NSOrderedSame) {
            return @(AWSMedialiveVideoSelectorColorSpaceRec709);
        }
        return @(AWSMedialiveVideoSelectorColorSpaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveVideoSelectorColorSpaceFollow:
                return @"FOLLOW";
            case AWSMedialiveVideoSelectorColorSpaceRec601:
                return @"REC_601";
            case AWSMedialiveVideoSelectorColorSpaceRec709:
                return @"REC_709";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorSpaceUsageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FALLBACK"] == NSOrderedSame) {
            return @(AWSMedialiveVideoSelectorColorSpaceUsageFallback);
        }
        if ([value caseInsensitiveCompare:@"FORCE"] == NSOrderedSame) {
            return @(AWSMedialiveVideoSelectorColorSpaceUsageForce);
        }
        return @(AWSMedialiveVideoSelectorColorSpaceUsageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMedialiveVideoSelectorColorSpaceUsageFallback:
                return @"FALLBACK";
            case AWSMedialiveVideoSelectorColorSpaceUsageForce:
                return @"FORCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)selectorSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveVideoSelectorSettings class]];
}

@end

@implementation AWSMedialiveVideoSelectorPid

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pid" : @"Pid",
             };
}

@end

@implementation AWSMedialiveVideoSelectorProgramId

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"programId" : @"ProgramId",
             };
}

@end

@implementation AWSMedialiveVideoSelectorSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"videoSelectorPid" : @"VideoSelectorPid",
             @"videoSelectorProgramId" : @"VideoSelectorProgramId",
             };
}

+ (NSValueTransformer *)videoSelectorPidJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveVideoSelectorPid class]];
}

+ (NSValueTransformer *)videoSelectorProgramIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMedialiveVideoSelectorProgramId class]];
}

@end

@implementation AWSMedialiveWebvttDestinationSettings

@end
