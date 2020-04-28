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

#import "AWSmedialiveModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSmedialiveErrorDomain = @"com.amazonaws.AWSmedialiveErrorDomain";

@implementation AWSmedialiveAacSettings

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
            return @(AWSmedialiveAacCodingModeAdReceiverMix);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_0"] == NSOrderedSame) {
            return @(AWSmedialiveAacCodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_1"] == NSOrderedSame) {
            return @(AWSmedialiveAacCodingModeCodingMode11);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSmedialiveAacCodingModeCodingMode20);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_5_1"] == NSOrderedSame) {
            return @(AWSmedialiveAacCodingModeCodingMode51);
        }
        return @(AWSmedialiveAacCodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAacCodingModeAdReceiverMix:
                return @"AD_RECEIVER_MIX";
            case AWSmedialiveAacCodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSmedialiveAacCodingModeCodingMode11:
                return @"CODING_MODE_1_1";
            case AWSmedialiveAacCodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            case AWSmedialiveAacCodingModeCodingMode51:
                return @"CODING_MODE_5_1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BROADCASTER_MIXED_AD"] == NSOrderedSame) {
            return @(AWSmedialiveAacInputTypeBroadcasterMixedAd);
        }
        if ([value caseInsensitiveCompare:@"NORMAL"] == NSOrderedSame) {
            return @(AWSmedialiveAacInputTypeNormal);
        }
        return @(AWSmedialiveAacInputTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAacInputTypeBroadcasterMixedAd:
                return @"BROADCASTER_MIXED_AD";
            case AWSmedialiveAacInputTypeNormal:
                return @"NORMAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HEV1"] == NSOrderedSame) {
            return @(AWSmedialiveAacProfileHev1);
        }
        if ([value caseInsensitiveCompare:@"HEV2"] == NSOrderedSame) {
            return @(AWSmedialiveAacProfileHev2);
        }
        if ([value caseInsensitiveCompare:@"LC"] == NSOrderedSame) {
            return @(AWSmedialiveAacProfileLc);
        }
        return @(AWSmedialiveAacProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAacProfileHev1:
                return @"HEV1";
            case AWSmedialiveAacProfileHev2:
                return @"HEV2";
            case AWSmedialiveAacProfileLc:
                return @"LC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSmedialiveAacRateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSmedialiveAacRateControlModeVbr);
        }
        return @(AWSmedialiveAacRateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAacRateControlModeCbr:
                return @"CBR";
            case AWSmedialiveAacRateControlModeVbr:
                return @"VBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rawFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LATM_LOAS"] == NSOrderedSame) {
            return @(AWSmedialiveAacRawFormatLatmLoas);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveAacRawFormatNone);
        }
        return @(AWSmedialiveAacRawFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAacRawFormatLatmLoas:
                return @"LATM_LOAS";
            case AWSmedialiveAacRawFormatNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)specJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MPEG2"] == NSOrderedSame) {
            return @(AWSmedialiveAacSpecMpeg2);
        }
        if ([value caseInsensitiveCompare:@"MPEG4"] == NSOrderedSame) {
            return @(AWSmedialiveAacSpecMpeg4);
        }
        return @(AWSmedialiveAacSpecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAacSpecMpeg2:
                return @"MPEG2";
            case AWSmedialiveAacSpecMpeg4:
                return @"MPEG4";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vbrQualityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSmedialiveAacVbrQualityHigh);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSmedialiveAacVbrQualityLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM_HIGH"] == NSOrderedSame) {
            return @(AWSmedialiveAacVbrQualityMediumHigh);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM_LOW"] == NSOrderedSame) {
            return @(AWSmedialiveAacVbrQualityMediumLow);
        }
        return @(AWSmedialiveAacVbrQualityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAacVbrQualityHigh:
                return @"HIGH";
            case AWSmedialiveAacVbrQualityLow:
                return @"LOW";
            case AWSmedialiveAacVbrQualityMediumHigh:
                return @"MEDIUM_HIGH";
            case AWSmedialiveAacVbrQualityMediumLow:
                return @"MEDIUM_LOW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveAc3Settings

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
            return @(AWSmedialiveAc3BitstreamModeCommentary);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE_MAIN"] == NSOrderedSame) {
            return @(AWSmedialiveAc3BitstreamModeCompleteMain);
        }
        if ([value caseInsensitiveCompare:@"DIALOGUE"] == NSOrderedSame) {
            return @(AWSmedialiveAc3BitstreamModeDialogue);
        }
        if ([value caseInsensitiveCompare:@"EMERGENCY"] == NSOrderedSame) {
            return @(AWSmedialiveAc3BitstreamModeEmergency);
        }
        if ([value caseInsensitiveCompare:@"HEARING_IMPAIRED"] == NSOrderedSame) {
            return @(AWSmedialiveAc3BitstreamModeHearingImpaired);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_AND_EFFECTS"] == NSOrderedSame) {
            return @(AWSmedialiveAc3BitstreamModeMusicAndEffects);
        }
        if ([value caseInsensitiveCompare:@"VISUALLY_IMPAIRED"] == NSOrderedSame) {
            return @(AWSmedialiveAc3BitstreamModeVisuallyImpaired);
        }
        if ([value caseInsensitiveCompare:@"VOICE_OVER"] == NSOrderedSame) {
            return @(AWSmedialiveAc3BitstreamModeVoiceOver);
        }
        return @(AWSmedialiveAc3BitstreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAc3BitstreamModeCommentary:
                return @"COMMENTARY";
            case AWSmedialiveAc3BitstreamModeCompleteMain:
                return @"COMPLETE_MAIN";
            case AWSmedialiveAc3BitstreamModeDialogue:
                return @"DIALOGUE";
            case AWSmedialiveAc3BitstreamModeEmergency:
                return @"EMERGENCY";
            case AWSmedialiveAc3BitstreamModeHearingImpaired:
                return @"HEARING_IMPAIRED";
            case AWSmedialiveAc3BitstreamModeMusicAndEffects:
                return @"MUSIC_AND_EFFECTS";
            case AWSmedialiveAc3BitstreamModeVisuallyImpaired:
                return @"VISUALLY_IMPAIRED";
            case AWSmedialiveAc3BitstreamModeVoiceOver:
                return @"VOICE_OVER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_0"] == NSOrderedSame) {
            return @(AWSmedialiveAc3CodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_1"] == NSOrderedSame) {
            return @(AWSmedialiveAc3CodingModeCodingMode11);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSmedialiveAc3CodingModeCodingMode20);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_3_2_LFE"] == NSOrderedSame) {
            return @(AWSmedialiveAc3CodingModeCodingMode32Lfe);
        }
        return @(AWSmedialiveAc3CodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAc3CodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSmedialiveAc3CodingModeCodingMode11:
                return @"CODING_MODE_1_1";
            case AWSmedialiveAc3CodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            case AWSmedialiveAc3CodingModeCodingMode32Lfe:
                return @"CODING_MODE_3_2_LFE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)drcProfileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSmedialiveAc3DrcProfileFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveAc3DrcProfileNone);
        }
        return @(AWSmedialiveAc3DrcProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAc3DrcProfileFilmStandard:
                return @"FILM_STANDARD";
            case AWSmedialiveAc3DrcProfileNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lfeFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveAc3LfeFilterDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveAc3LfeFilterEnabled);
        }
        return @(AWSmedialiveAc3LfeFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAc3LfeFilterDisabled:
                return @"DISABLED";
            case AWSmedialiveAc3LfeFilterEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metadataControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSmedialiveAc3MetadataControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSmedialiveAc3MetadataControlUseConfigured);
        }
        return @(AWSmedialiveAc3MetadataControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAc3MetadataControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSmedialiveAc3MetadataControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveAccessDenied

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSmedialiveArchiveContainerSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"m2tsSettings" : @"M2tsSettings",
             };
}

+ (NSValueTransformer *)m2tsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveM2tsSettings class]];
}

@end

@implementation AWSmedialiveArchiveGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             @"rolloverInterval" : @"RolloverInterval",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveOutputLocationRef class]];
}

@end

@implementation AWSmedialiveArchiveOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containerSettings" : @"ContainerSettings",
             @"extension" : @"Extension",
             @"nameModifier" : @"NameModifier",
             };
}

+ (NSValueTransformer *)containerSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveArchiveContainerSettings class]];
}

@end

@implementation AWSmedialiveAribDestinationSettings

@end

@implementation AWSmedialiveAribSourceSettings

@end

@implementation AWSmedialiveAudioChannelMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputChannelLevels" : @"InputChannelLevels",
             @"outputChannel" : @"OutputChannel",
             };
}

+ (NSValueTransformer *)inputChannelLevelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputChannelLevel class]];
}

@end

@implementation AWSmedialiveAudioCodecSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAacSettings class]];
}

+ (NSValueTransformer *)ac3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAc3Settings class]];
}

+ (NSValueTransformer *)eac3SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveEac3Settings class]];
}

+ (NSValueTransformer *)mp2SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMp2Settings class]];
}

+ (NSValueTransformer *)passThroughSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialivePassThroughSettings class]];
}

@end

@implementation AWSmedialiveAudioDescription

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAudioNormalizationSettings class]];
}

+ (NSValueTransformer *)audioTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CLEAN_EFFECTS"] == NSOrderedSame) {
            return @(AWSmedialiveAudioTypeCleanEffects);
        }
        if ([value caseInsensitiveCompare:@"HEARING_IMPAIRED"] == NSOrderedSame) {
            return @(AWSmedialiveAudioTypeHearingImpaired);
        }
        if ([value caseInsensitiveCompare:@"UNDEFINED"] == NSOrderedSame) {
            return @(AWSmedialiveAudioTypeUndefined);
        }
        if ([value caseInsensitiveCompare:@"VISUAL_IMPAIRED_COMMENTARY"] == NSOrderedSame) {
            return @(AWSmedialiveAudioTypeVisualImpairedCommentary);
        }
        return @(AWSmedialiveAudioTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAudioTypeCleanEffects:
                return @"CLEAN_EFFECTS";
            case AWSmedialiveAudioTypeHearingImpaired:
                return @"HEARING_IMPAIRED";
            case AWSmedialiveAudioTypeUndefined:
                return @"UNDEFINED";
            case AWSmedialiveAudioTypeVisualImpairedCommentary:
                return @"VISUAL_IMPAIRED_COMMENTARY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)audioTypeControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSmedialiveAudioDescriptionAudioTypeControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSmedialiveAudioDescriptionAudioTypeControlUseConfigured);
        }
        return @(AWSmedialiveAudioDescriptionAudioTypeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAudioDescriptionAudioTypeControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSmedialiveAudioDescriptionAudioTypeControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAudioCodecSettings class]];
}

+ (NSValueTransformer *)languageCodeControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSmedialiveAudioDescriptionLanguageCodeControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSmedialiveAudioDescriptionLanguageCodeControlUseConfigured);
        }
        return @(AWSmedialiveAudioDescriptionLanguageCodeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAudioDescriptionLanguageCodeControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSmedialiveAudioDescriptionLanguageCodeControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)remixSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveRemixSettings class]];
}

@end

@implementation AWSmedialiveAudioLanguageSelection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"languageSelectionPolicy" : @"LanguageSelectionPolicy",
             };
}

+ (NSValueTransformer *)languageSelectionPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LOOSE"] == NSOrderedSame) {
            return @(AWSmedialiveAudioLanguageSelectionPolicyLoose);
        }
        if ([value caseInsensitiveCompare:@"STRICT"] == NSOrderedSame) {
            return @(AWSmedialiveAudioLanguageSelectionPolicyStrict);
        }
        return @(AWSmedialiveAudioLanguageSelectionPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAudioLanguageSelectionPolicyLoose:
                return @"LOOSE";
            case AWSmedialiveAudioLanguageSelectionPolicyStrict:
                return @"STRICT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveAudioNormalizationSettings

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
            return @(AWSmedialiveAudioNormalizationAlgorithmItu17701);
        }
        if ([value caseInsensitiveCompare:@"ITU_1770_2"] == NSOrderedSame) {
            return @(AWSmedialiveAudioNormalizationAlgorithmItu17702);
        }
        return @(AWSmedialiveAudioNormalizationAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAudioNormalizationAlgorithmItu17701:
                return @"ITU_1770_1";
            case AWSmedialiveAudioNormalizationAlgorithmItu17702:
                return @"ITU_1770_2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)algorithmControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CORRECT_AUDIO"] == NSOrderedSame) {
            return @(AWSmedialiveAudioNormalizationAlgorithmControlCorrectAudio);
        }
        return @(AWSmedialiveAudioNormalizationAlgorithmControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAudioNormalizationAlgorithmControlCorrectAudio:
                return @"CORRECT_AUDIO";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveAudioOnlyHlsSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioGroupId" : @"AudioGroupId",
             @"audioOnlyImage" : @"AudioOnlyImage",
             @"audioTrackType" : @"AudioTrackType",
             @"segmentType" : @"SegmentType",
             };
}

+ (NSValueTransformer *)audioOnlyImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputLocation class]];
}

+ (NSValueTransformer *)audioTrackTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALTERNATE_AUDIO_AUTO_SELECT"] == NSOrderedSame) {
            return @(AWSmedialiveAudioOnlyHlsTrackTypeAlternateAudioAutoSelect);
        }
        if ([value caseInsensitiveCompare:@"ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT"] == NSOrderedSame) {
            return @(AWSmedialiveAudioOnlyHlsTrackTypeAlternateAudioAutoSelectDefault);
        }
        if ([value caseInsensitiveCompare:@"ALTERNATE_AUDIO_NOT_AUTO_SELECT"] == NSOrderedSame) {
            return @(AWSmedialiveAudioOnlyHlsTrackTypeAlternateAudioNotAutoSelect);
        }
        if ([value caseInsensitiveCompare:@"AUDIO_ONLY_VARIANT_STREAM"] == NSOrderedSame) {
            return @(AWSmedialiveAudioOnlyHlsTrackTypeAudioOnlyVariantStream);
        }
        return @(AWSmedialiveAudioOnlyHlsTrackTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAudioOnlyHlsTrackTypeAlternateAudioAutoSelect:
                return @"ALTERNATE_AUDIO_AUTO_SELECT";
            case AWSmedialiveAudioOnlyHlsTrackTypeAlternateAudioAutoSelectDefault:
                return @"ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT";
            case AWSmedialiveAudioOnlyHlsTrackTypeAlternateAudioNotAutoSelect:
                return @"ALTERNATE_AUDIO_NOT_AUTO_SELECT";
            case AWSmedialiveAudioOnlyHlsTrackTypeAudioOnlyVariantStream:
                return @"AUDIO_ONLY_VARIANT_STREAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AAC"] == NSOrderedSame) {
            return @(AWSmedialiveAudioOnlyHlsSegmentTypeAac);
        }
        if ([value caseInsensitiveCompare:@"FMP4"] == NSOrderedSame) {
            return @(AWSmedialiveAudioOnlyHlsSegmentTypeFmp4);
        }
        return @(AWSmedialiveAudioOnlyHlsSegmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAudioOnlyHlsSegmentTypeAac:
                return @"AAC";
            case AWSmedialiveAudioOnlyHlsSegmentTypeFmp4:
                return @"FMP4";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveAudioPidSelection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pid" : @"Pid",
             };
}

@end

@implementation AWSmedialiveAudioSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"selectorSettings" : @"SelectorSettings",
             };
}

+ (NSValueTransformer *)selectorSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAudioSelectorSettings class]];
}

@end

@implementation AWSmedialiveAudioSelectorSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioLanguageSelection" : @"AudioLanguageSelection",
             @"audioPidSelection" : @"AudioPidSelection",
             @"audioTrackSelection" : @"AudioTrackSelection",
             };
}

+ (NSValueTransformer *)audioLanguageSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAudioLanguageSelection class]];
}

+ (NSValueTransformer *)audioPidSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAudioPidSelection class]];
}

+ (NSValueTransformer *)audioTrackSelectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAudioTrackSelection class]];
}

@end

@implementation AWSmedialiveAudioTrack

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"track" : @"Track",
             };
}

@end

@implementation AWSmedialiveAudioTrackSelection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tracks" : @"Tracks",
             };
}

+ (NSValueTransformer *)tracksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveAudioTrack class]];
}

@end

@implementation AWSmedialiveAutomaticInputFailoverSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputPreference" : @"InputPreference",
             @"secondaryInputId" : @"SecondaryInputId",
             };
}

+ (NSValueTransformer *)inputPreferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQUAL_INPUT_PREFERENCE"] == NSOrderedSame) {
            return @(AWSmedialiveInputPreferenceEqualInputPreference);
        }
        if ([value caseInsensitiveCompare:@"PRIMARY_INPUT_PREFERRED"] == NSOrderedSame) {
            return @(AWSmedialiveInputPreferencePrimaryInputPreferred);
        }
        return @(AWSmedialiveInputPreferenceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputPreferenceEqualInputPreference:
                return @"EQUAL_INPUT_PREFERENCE";
            case AWSmedialiveInputPreferencePrimaryInputPreferred:
                return @"PRIMARY_INPUT_PREFERRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveAvailBlanking

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availBlankingImage" : @"AvailBlankingImage",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)availBlankingImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputLocation class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveAvailBlankingStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveAvailBlankingStateEnabled);
        }
        return @(AWSmedialiveAvailBlankingStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAvailBlankingStateDisabled:
                return @"DISABLED";
            case AWSmedialiveAvailBlankingStateEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveAvailConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availSettings" : @"AvailSettings",
             };
}

+ (NSValueTransformer *)availSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAvailSettings class]];
}

@end

@implementation AWSmedialiveAvailSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scte35SpliceInsert" : @"Scte35SpliceInsert",
             @"scte35TimeSignalApos" : @"Scte35TimeSignalApos",
             };
}

+ (NSValueTransformer *)scte35SpliceInsertJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScte35SpliceInsert class]];
}

+ (NSValueTransformer *)scte35TimeSignalAposJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScte35TimeSignalApos class]];
}

@end

@implementation AWSmedialiveBatchScheduleActionCreateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleActions" : @"ScheduleActions",
             };
}

+ (NSValueTransformer *)scheduleActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveScheduleAction class]];
}

@end

@implementation AWSmedialiveBatchScheduleActionCreateResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleActions" : @"ScheduleActions",
             };
}

+ (NSValueTransformer *)scheduleActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveScheduleAction class]];
}

@end

@implementation AWSmedialiveBatchScheduleActionDeleteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionNames" : @"ActionNames",
             };
}

@end

@implementation AWSmedialiveBatchScheduleActionDeleteResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleActions" : @"ScheduleActions",
             };
}

+ (NSValueTransformer *)scheduleActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveScheduleAction class]];
}

@end

@implementation AWSmedialiveBatchUpdateScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             @"creates" : @"Creates",
             @"deletes" : @"Deletes",
             };
}

+ (NSValueTransformer *)createsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveBatchScheduleActionCreateRequest class]];
}

+ (NSValueTransformer *)deletesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveBatchScheduleActionDeleteRequest class]];
}

@end

@implementation AWSmedialiveBatchUpdateScheduleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creates" : @"Creates",
             @"deletes" : @"Deletes",
             };
}

+ (NSValueTransformer *)createsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveBatchScheduleActionCreateResult class]];
}

+ (NSValueTransformer *)deletesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveBatchScheduleActionDeleteResult class]];
}

@end

@implementation AWSmedialiveBatchUpdateScheduleResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creates" : @"Creates",
             @"deletes" : @"Deletes",
             };
}

+ (NSValueTransformer *)createsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveBatchScheduleActionCreateResult class]];
}

+ (NSValueTransformer *)deletesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveBatchScheduleActionDeleteResult class]];
}

@end

@implementation AWSmedialiveBlackoutSlate

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputLocation class]];
}

+ (NSValueTransformer *)networkEndBlackoutJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveBlackoutSlateNetworkEndBlackoutDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveBlackoutSlateNetworkEndBlackoutEnabled);
        }
        return @(AWSmedialiveBlackoutSlateNetworkEndBlackoutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveBlackoutSlateNetworkEndBlackoutDisabled:
                return @"DISABLED";
            case AWSmedialiveBlackoutSlateNetworkEndBlackoutEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)networkEndBlackoutImageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputLocation class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveBlackoutSlateStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveBlackoutSlateStateEnabled);
        }
        return @(AWSmedialiveBlackoutSlateStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveBlackoutSlateStateDisabled:
                return @"DISABLED";
            case AWSmedialiveBlackoutSlateStateEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveBurnInDestinationSettings

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
            return @(AWSmedialiveBurnInAlignmentCentered);
        }
        if ([value caseInsensitiveCompare:@"LEFT"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInAlignmentLeft);
        }
        if ([value caseInsensitiveCompare:@"SMART"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInAlignmentSmart);
        }
        return @(AWSmedialiveBurnInAlignmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveBurnInAlignmentCentered:
                return @"CENTERED";
            case AWSmedialiveBurnInAlignmentLeft:
                return @"LEFT";
            case AWSmedialiveBurnInAlignmentSmart:
                return @"SMART";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)backgroundColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInBackgroundColorBlack);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInBackgroundColorNone);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInBackgroundColorWhite);
        }
        return @(AWSmedialiveBurnInBackgroundColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveBurnInBackgroundColorBlack:
                return @"BLACK";
            case AWSmedialiveBurnInBackgroundColorNone:
                return @"NONE";
            case AWSmedialiveBurnInBackgroundColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fontJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputLocation class]];
}

+ (NSValueTransformer *)fontColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInFontColorBlack);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInFontColorBlue);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInFontColorGreen);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInFontColorRed);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInFontColorWhite);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInFontColorYellow);
        }
        return @(AWSmedialiveBurnInFontColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveBurnInFontColorBlack:
                return @"BLACK";
            case AWSmedialiveBurnInFontColorBlue:
                return @"BLUE";
            case AWSmedialiveBurnInFontColorGreen:
                return @"GREEN";
            case AWSmedialiveBurnInFontColorRed:
                return @"RED";
            case AWSmedialiveBurnInFontColorWhite:
                return @"WHITE";
            case AWSmedialiveBurnInFontColorYellow:
                return @"YELLOW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outlineColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInOutlineColorBlack);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInOutlineColorBlue);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInOutlineColorGreen);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInOutlineColorRed);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInOutlineColorWhite);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInOutlineColorYellow);
        }
        return @(AWSmedialiveBurnInOutlineColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveBurnInOutlineColorBlack:
                return @"BLACK";
            case AWSmedialiveBurnInOutlineColorBlue:
                return @"BLUE";
            case AWSmedialiveBurnInOutlineColorGreen:
                return @"GREEN";
            case AWSmedialiveBurnInOutlineColorRed:
                return @"RED";
            case AWSmedialiveBurnInOutlineColorWhite:
                return @"WHITE";
            case AWSmedialiveBurnInOutlineColorYellow:
                return @"YELLOW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)shadowColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInShadowColorBlack);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInShadowColorNone);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInShadowColorWhite);
        }
        return @(AWSmedialiveBurnInShadowColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveBurnInShadowColorBlack:
                return @"BLACK";
            case AWSmedialiveBurnInShadowColorNone:
                return @"NONE";
            case AWSmedialiveBurnInShadowColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)teletextGridControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIXED"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInTeletextGridControlFixed);
        }
        if ([value caseInsensitiveCompare:@"SCALED"] == NSOrderedSame) {
            return @(AWSmedialiveBurnInTeletextGridControlScaled);
        }
        return @(AWSmedialiveBurnInTeletextGridControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveBurnInTeletextGridControlFixed:
                return @"FIXED";
            case AWSmedialiveBurnInTeletextGridControlScaled:
                return @"SCALED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveCaptionDescription

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveCaptionDestinationSettings class]];
}

@end

@implementation AWSmedialiveCaptionDestinationSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAribDestinationSettings class]];
}

+ (NSValueTransformer *)burnInDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveBurnInDestinationSettings class]];
}

+ (NSValueTransformer *)dvbSubDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveDvbSubDestinationSettings class]];
}

+ (NSValueTransformer *)embeddedDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveEmbeddedDestinationSettings class]];
}

+ (NSValueTransformer *)embeddedPlusScte20DestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveEmbeddedPlusScte20DestinationSettings class]];
}

+ (NSValueTransformer *)rtmpCaptionInfoDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveRtmpCaptionInfoDestinationSettings class]];
}

+ (NSValueTransformer *)scte20PlusEmbeddedDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScte20PlusEmbeddedDestinationSettings class]];
}

+ (NSValueTransformer *)scte27DestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScte27DestinationSettings class]];
}

+ (NSValueTransformer *)smpteTtDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveSmpteTtDestinationSettings class]];
}

+ (NSValueTransformer *)teletextDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveTeletextDestinationSettings class]];
}

+ (NSValueTransformer *)ttmlDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveTtmlDestinationSettings class]];
}

+ (NSValueTransformer *)webvttDestinationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveWebvttDestinationSettings class]];
}

@end

@implementation AWSmedialiveCaptionLanguageMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captionChannel" : @"CaptionChannel",
             @"languageCode" : @"LanguageCode",
             @"languageDescription" : @"LanguageDescription",
             };
}

@end

@implementation AWSmedialiveCaptionSelector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"name" : @"Name",
             @"selectorSettings" : @"SelectorSettings",
             };
}

+ (NSValueTransformer *)selectorSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveCaptionSelectorSettings class]];
}

@end

@implementation AWSmedialiveCaptionSelectorSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAribSourceSettings class]];
}

+ (NSValueTransformer *)dvbSubSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveDvbSubSourceSettings class]];
}

+ (NSValueTransformer *)embeddedSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveEmbeddedSourceSettings class]];
}

+ (NSValueTransformer *)scte20SourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScte20SourceSettings class]];
}

+ (NSValueTransformer *)scte27SourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScte27SourceSettings class]];
}

+ (NSValueTransformer *)teletextSourceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveTeletextSourceSettings class]];
}

@end

@implementation AWSmedialiveChannel

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
            return @(AWSmedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelClassSinglePipeline);
        }
        return @(AWSmedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSmedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputDestination class]];
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveChannelEgressEndpoint class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDisabled);
        }
        return @(AWSmedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveLogLevelError:
                return @"ERROR";
            case AWSmedialiveLogLevelWarning:
                return @"WARNING";
            case AWSmedialiveLogLevelInfo:
                return @"INFO";
            case AWSmedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSmedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pipelineDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialivePipelineDetail class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateUpdateFailed);
        }
        return @(AWSmedialiveChannelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelStateCreating:
                return @"CREATING";
            case AWSmedialiveChannelStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSmedialiveChannelStateIdle:
                return @"IDLE";
            case AWSmedialiveChannelStateStarting:
                return @"STARTING";
            case AWSmedialiveChannelStateRunning:
                return @"RUNNING";
            case AWSmedialiveChannelStateRecovering:
                return @"RECOVERING";
            case AWSmedialiveChannelStateStopping:
                return @"STOPPING";
            case AWSmedialiveChannelStateDeleting:
                return @"DELETING";
            case AWSmedialiveChannelStateDeleted:
                return @"DELETED";
            case AWSmedialiveChannelStateUpdating:
                return @"UPDATING";
            case AWSmedialiveChannelStateUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveChannelConfigurationValidationError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"validationErrors" : @"ValidationErrors",
             };
}

+ (NSValueTransformer *)validationErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveValidationError class]];
}

@end

@implementation AWSmedialiveChannelEgressEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceIp" : @"SourceIp",
             };
}

@end

@implementation AWSmedialiveChannelSummary

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
            return @(AWSmedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelClassSinglePipeline);
        }
        return @(AWSmedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSmedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputDestination class]];
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveChannelEgressEndpoint class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDisabled);
        }
        return @(AWSmedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveLogLevelError:
                return @"ERROR";
            case AWSmedialiveLogLevelWarning:
                return @"WARNING";
            case AWSmedialiveLogLevelInfo:
                return @"INFO";
            case AWSmedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSmedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateUpdateFailed);
        }
        return @(AWSmedialiveChannelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelStateCreating:
                return @"CREATING";
            case AWSmedialiveChannelStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSmedialiveChannelStateIdle:
                return @"IDLE";
            case AWSmedialiveChannelStateStarting:
                return @"STARTING";
            case AWSmedialiveChannelStateRunning:
                return @"RUNNING";
            case AWSmedialiveChannelStateRecovering:
                return @"RECOVERING";
            case AWSmedialiveChannelStateStopping:
                return @"STOPPING";
            case AWSmedialiveChannelStateDeleting:
                return @"DELETING";
            case AWSmedialiveChannelStateDeleted:
                return @"DELETED";
            case AWSmedialiveChannelStateUpdating:
                return @"UPDATING";
            case AWSmedialiveChannelStateUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveColorSpacePassthroughSettings

@end

@implementation AWSmedialiveCreateChannel

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
            return @(AWSmedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelClassSinglePipeline);
        }
        return @(AWSmedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSmedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputDestination class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDisabled);
        }
        return @(AWSmedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveLogLevelError:
                return @"ERROR";
            case AWSmedialiveLogLevelWarning:
                return @"WARNING";
            case AWSmedialiveLogLevelInfo:
                return @"INFO";
            case AWSmedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSmedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveCreateChannelRequest

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
            return @(AWSmedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelClassSinglePipeline);
        }
        return @(AWSmedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSmedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputDestination class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDisabled);
        }
        return @(AWSmedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveLogLevelError:
                return @"ERROR";
            case AWSmedialiveLogLevelWarning:
                return @"WARNING";
            case AWSmedialiveLogLevelInfo:
                return @"INFO";
            case AWSmedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSmedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveCreateChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveChannel class]];
}

@end

@implementation AWSmedialiveCreateChannelResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveChannel class]];
}

@end

@implementation AWSmedialiveCreateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"Destinations",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputDestinationRequest class]];
}

+ (NSValueTransformer *)mediaConnectFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMediaConnectFlowRequest class]];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputSourceRequest class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UDP_PUSH"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeUdpPush);
        }
        if ([value caseInsensitiveCompare:@"RTP_PUSH"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeRtpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PUSH"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeRtmpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PULL"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeRtmpPull);
        }
        if ([value caseInsensitiveCompare:@"URL_PULL"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeUrlPull);
        }
        if ([value caseInsensitiveCompare:@"MP4_FILE"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeMp4File);
        }
        if ([value caseInsensitiveCompare:@"MEDIACONNECT"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeMediaconnect);
        }
        return @(AWSmedialiveInputTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputTypeUdpPush:
                return @"UDP_PUSH";
            case AWSmedialiveInputTypeRtpPush:
                return @"RTP_PUSH";
            case AWSmedialiveInputTypeRtmpPush:
                return @"RTMP_PUSH";
            case AWSmedialiveInputTypeRtmpPull:
                return @"RTMP_PULL";
            case AWSmedialiveInputTypeUrlPull:
                return @"URL_PULL";
            case AWSmedialiveInputTypeMp4File:
                return @"MP4_FILE";
            case AWSmedialiveInputTypeMediaconnect:
                return @"MEDIACONNECT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputVpcRequest class]];
}

@end

@implementation AWSmedialiveCreateInputRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"Destinations",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputDestinationRequest class]];
}

+ (NSValueTransformer *)mediaConnectFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMediaConnectFlowRequest class]];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputSourceRequest class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UDP_PUSH"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeUdpPush);
        }
        if ([value caseInsensitiveCompare:@"RTP_PUSH"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeRtpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PUSH"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeRtmpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PULL"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeRtmpPull);
        }
        if ([value caseInsensitiveCompare:@"URL_PULL"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeUrlPull);
        }
        if ([value caseInsensitiveCompare:@"MP4_FILE"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeMp4File);
        }
        if ([value caseInsensitiveCompare:@"MEDIACONNECT"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeMediaconnect);
        }
        return @(AWSmedialiveInputTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputTypeUdpPush:
                return @"UDP_PUSH";
            case AWSmedialiveInputTypeRtpPush:
                return @"RTP_PUSH";
            case AWSmedialiveInputTypeRtmpPush:
                return @"RTMP_PUSH";
            case AWSmedialiveInputTypeRtmpPull:
                return @"RTMP_PULL";
            case AWSmedialiveInputTypeUrlPull:
                return @"URL_PULL";
            case AWSmedialiveInputTypeMp4File:
                return @"MP4_FILE";
            case AWSmedialiveInputTypeMediaconnect:
                return @"MEDIACONNECT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputVpcRequest class]];
}

@end

@implementation AWSmedialiveCreateInputResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInput class]];
}

@end

@implementation AWSmedialiveCreateInputResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInput class]];
}

@end

@implementation AWSmedialiveCreateInputSecurityGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             @"whitelistRules" : @"WhitelistRules",
             };
}

+ (NSValueTransformer *)whitelistRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputWhitelistRuleCidr class]];
}

@end

@implementation AWSmedialiveCreateInputSecurityGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroup" : @"SecurityGroup",
             };
}

+ (NSValueTransformer *)securityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSecurityGroup class]];
}

@end

@implementation AWSmedialiveCreateInputSecurityGroupResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroup" : @"SecurityGroup",
             };
}

+ (NSValueTransformer *)securityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSecurityGroup class]];
}

@end

@implementation AWSmedialiveCreateMultiplex

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexSettings class]];
}

@end

@implementation AWSmedialiveCreateMultiplexProgram

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             @"programName" : @"ProgramName",
             @"requestId" : @"RequestId",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgramSettings class]];
}

@end

@implementation AWSmedialiveCreateMultiplexProgramRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             @"programName" : @"ProgramName",
             @"requestId" : @"RequestId",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgramSettings class]];
}

@end

@implementation AWSmedialiveCreateMultiplexProgramResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexProgram" : @"MultiplexProgram",
             };
}

+ (NSValueTransformer *)multiplexProgramJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgram class]];
}

@end

@implementation AWSmedialiveCreateMultiplexProgramResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexProgram" : @"MultiplexProgram",
             };
}

+ (NSValueTransformer *)multiplexProgramJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgram class]];
}

@end

@implementation AWSmedialiveCreateMultiplexRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexSettings class]];
}

@end

@implementation AWSmedialiveCreateMultiplexResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplex" : @"Multiplex",
             };
}

+ (NSValueTransformer *)multiplexJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplex class]];
}

@end

@implementation AWSmedialiveCreateMultiplexResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplex" : @"Multiplex",
             };
}

+ (NSValueTransformer *)multiplexJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplex class]];
}

@end

@implementation AWSmedialiveCreateTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmedialiveDeleteChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             };
}

@end

@implementation AWSmedialiveDeleteChannelResponse

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
            return @(AWSmedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelClassSinglePipeline);
        }
        return @(AWSmedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSmedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputDestination class]];
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveChannelEgressEndpoint class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDisabled);
        }
        return @(AWSmedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveLogLevelError:
                return @"ERROR";
            case AWSmedialiveLogLevelWarning:
                return @"WARNING";
            case AWSmedialiveLogLevelInfo:
                return @"INFO";
            case AWSmedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSmedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pipelineDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialivePipelineDetail class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateUpdateFailed);
        }
        return @(AWSmedialiveChannelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelStateCreating:
                return @"CREATING";
            case AWSmedialiveChannelStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSmedialiveChannelStateIdle:
                return @"IDLE";
            case AWSmedialiveChannelStateStarting:
                return @"STARTING";
            case AWSmedialiveChannelStateRunning:
                return @"RUNNING";
            case AWSmedialiveChannelStateRecovering:
                return @"RECOVERING";
            case AWSmedialiveChannelStateStopping:
                return @"STOPPING";
            case AWSmedialiveChannelStateDeleting:
                return @"DELETING";
            case AWSmedialiveChannelStateDeleted:
                return @"DELETED";
            case AWSmedialiveChannelStateUpdating:
                return @"UPDATING";
            case AWSmedialiveChannelStateUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveDeleteInputRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputId" : @"InputId",
             };
}

@end

@implementation AWSmedialiveDeleteInputResponse

@end

@implementation AWSmedialiveDeleteInputSecurityGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputSecurityGroupId" : @"InputSecurityGroupId",
             };
}

@end

@implementation AWSmedialiveDeleteInputSecurityGroupResponse

@end

@implementation AWSmedialiveDeleteMultiplexProgramRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             @"programName" : @"ProgramName",
             };
}

@end

@implementation AWSmedialiveDeleteMultiplexProgramResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             @"packetIdentifiersMap" : @"PacketIdentifiersMap",
             @"programName" : @"ProgramName",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgramSettings class]];
}

+ (NSValueTransformer *)packetIdentifiersMapJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgramPacketIdentifiersMap class]];
}

@end

@implementation AWSmedialiveDeleteMultiplexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             };
}

@end

@implementation AWSmedialiveDeleteMultiplexResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMultiplexOutputDestination class]];
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexSettings class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateDeleted);
        }
        return @(AWSmedialiveMultiplexStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveMultiplexStateCreating:
                return @"CREATING";
            case AWSmedialiveMultiplexStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSmedialiveMultiplexStateIdle:
                return @"IDLE";
            case AWSmedialiveMultiplexStateStarting:
                return @"STARTING";
            case AWSmedialiveMultiplexStateRunning:
                return @"RUNNING";
            case AWSmedialiveMultiplexStateRecovering:
                return @"RECOVERING";
            case AWSmedialiveMultiplexStateStopping:
                return @"STOPPING";
            case AWSmedialiveMultiplexStateDeleting:
                return @"DELETING";
            case AWSmedialiveMultiplexStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveDeleteReservationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservationId" : @"ReservationId",
             };
}

@end

@implementation AWSmedialiveDeleteReservationResponse

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
            return @(AWSmedialiveOfferingDurationUnitsMonths);
        }
        return @(AWSmedialiveOfferingDurationUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveOfferingDurationUnitsMonths:
                return @"MONTHS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSmedialiveOfferingTypeNoUpfront);
        }
        return @(AWSmedialiveOfferingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveOfferingTypeNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveReservationResourceSpecification class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSmedialiveReservationStateActive);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSmedialiveReservationStateExpired);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSmedialiveReservationStateCanceled);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveReservationStateDeleted);
        }
        return @(AWSmedialiveReservationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveReservationStateActive:
                return @"ACTIVE";
            case AWSmedialiveReservationStateExpired:
                return @"EXPIRED";
            case AWSmedialiveReservationStateCanceled:
                return @"CANCELED";
            case AWSmedialiveReservationStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveDeleteScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             };
}

@end

@implementation AWSmedialiveDeleteScheduleResponse

@end

@implementation AWSmedialiveDeleteTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSmedialiveDescribeChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             };
}

@end

@implementation AWSmedialiveDescribeChannelResponse

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
            return @(AWSmedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelClassSinglePipeline);
        }
        return @(AWSmedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSmedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputDestination class]];
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveChannelEgressEndpoint class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDisabled);
        }
        return @(AWSmedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveLogLevelError:
                return @"ERROR";
            case AWSmedialiveLogLevelWarning:
                return @"WARNING";
            case AWSmedialiveLogLevelInfo:
                return @"INFO";
            case AWSmedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSmedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pipelineDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialivePipelineDetail class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateUpdateFailed);
        }
        return @(AWSmedialiveChannelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelStateCreating:
                return @"CREATING";
            case AWSmedialiveChannelStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSmedialiveChannelStateIdle:
                return @"IDLE";
            case AWSmedialiveChannelStateStarting:
                return @"STARTING";
            case AWSmedialiveChannelStateRunning:
                return @"RUNNING";
            case AWSmedialiveChannelStateRecovering:
                return @"RECOVERING";
            case AWSmedialiveChannelStateStopping:
                return @"STOPPING";
            case AWSmedialiveChannelStateDeleting:
                return @"DELETING";
            case AWSmedialiveChannelStateDeleted:
                return @"DELETED";
            case AWSmedialiveChannelStateUpdating:
                return @"UPDATING";
            case AWSmedialiveChannelStateUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveDescribeInputRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputId" : @"InputId",
             };
}

@end

@implementation AWSmedialiveDescribeInputResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"attachedChannels" : @"AttachedChannels",
             @"destinations" : @"Destinations",
             @"identifier" : @"Id",
             @"inputClass" : @"InputClass",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputDestination class]];
}

+ (NSValueTransformer *)inputClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSmedialiveInputClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSmedialiveInputClassSinglePipeline);
        }
        return @(AWSmedialiveInputClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputClassStandard:
                return @"STANDARD";
            case AWSmedialiveInputClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputSourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSmedialiveInputSourceTypeStatic);
        }
        if ([value caseInsensitiveCompare:@"DYNAMIC"] == NSOrderedSame) {
            return @(AWSmedialiveInputSourceTypeDynamic);
        }
        return @(AWSmedialiveInputSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputSourceTypeStatic:
                return @"STATIC";
            case AWSmedialiveInputSourceTypeDynamic:
                return @"DYNAMIC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mediaConnectFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMediaConnectFlow class]];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputSource class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveInputStateCreating);
        }
        if ([value caseInsensitiveCompare:@"DETACHED"] == NSOrderedSame) {
            return @(AWSmedialiveInputStateDetached);
        }
        if ([value caseInsensitiveCompare:@"ATTACHED"] == NSOrderedSame) {
            return @(AWSmedialiveInputStateAttached);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveInputStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveInputStateDeleted);
        }
        return @(AWSmedialiveInputStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputStateCreating:
                return @"CREATING";
            case AWSmedialiveInputStateDetached:
                return @"DETACHED";
            case AWSmedialiveInputStateAttached:
                return @"ATTACHED";
            case AWSmedialiveInputStateDeleting:
                return @"DELETING";
            case AWSmedialiveInputStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UDP_PUSH"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeUdpPush);
        }
        if ([value caseInsensitiveCompare:@"RTP_PUSH"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeRtpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PUSH"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeRtmpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PULL"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeRtmpPull);
        }
        if ([value caseInsensitiveCompare:@"URL_PULL"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeUrlPull);
        }
        if ([value caseInsensitiveCompare:@"MP4_FILE"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeMp4File);
        }
        if ([value caseInsensitiveCompare:@"MEDIACONNECT"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeMediaconnect);
        }
        return @(AWSmedialiveInputTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputTypeUdpPush:
                return @"UDP_PUSH";
            case AWSmedialiveInputTypeRtpPush:
                return @"RTP_PUSH";
            case AWSmedialiveInputTypeRtmpPush:
                return @"RTMP_PUSH";
            case AWSmedialiveInputTypeRtmpPull:
                return @"RTMP_PULL";
            case AWSmedialiveInputTypeUrlPull:
                return @"URL_PULL";
            case AWSmedialiveInputTypeMp4File:
                return @"MP4_FILE";
            case AWSmedialiveInputTypeMediaconnect:
                return @"MEDIACONNECT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveDescribeInputSecurityGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputSecurityGroupId" : @"InputSecurityGroupId",
             };
}

@end

@implementation AWSmedialiveDescribeInputSecurityGroupResponse

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
            return @(AWSmedialiveInputSecurityGroupStateIdle);
        }
        if ([value caseInsensitiveCompare:@"IN_USE"] == NSOrderedSame) {
            return @(AWSmedialiveInputSecurityGroupStateInUse);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSmedialiveInputSecurityGroupStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveInputSecurityGroupStateDeleted);
        }
        return @(AWSmedialiveInputSecurityGroupStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputSecurityGroupStateIdle:
                return @"IDLE";
            case AWSmedialiveInputSecurityGroupStateInUse:
                return @"IN_USE";
            case AWSmedialiveInputSecurityGroupStateUpdating:
                return @"UPDATING";
            case AWSmedialiveInputSecurityGroupStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)whitelistRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputWhitelistRule class]];
}

@end

@implementation AWSmedialiveDescribeMultiplexProgramRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             @"programName" : @"ProgramName",
             };
}

@end

@implementation AWSmedialiveDescribeMultiplexProgramResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             @"packetIdentifiersMap" : @"PacketIdentifiersMap",
             @"programName" : @"ProgramName",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgramSettings class]];
}

+ (NSValueTransformer *)packetIdentifiersMapJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgramPacketIdentifiersMap class]];
}

@end

@implementation AWSmedialiveDescribeMultiplexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             };
}

@end

@implementation AWSmedialiveDescribeMultiplexResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMultiplexOutputDestination class]];
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexSettings class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateDeleted);
        }
        return @(AWSmedialiveMultiplexStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveMultiplexStateCreating:
                return @"CREATING";
            case AWSmedialiveMultiplexStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSmedialiveMultiplexStateIdle:
                return @"IDLE";
            case AWSmedialiveMultiplexStateStarting:
                return @"STARTING";
            case AWSmedialiveMultiplexStateRunning:
                return @"RUNNING";
            case AWSmedialiveMultiplexStateRecovering:
                return @"RECOVERING";
            case AWSmedialiveMultiplexStateStopping:
                return @"STOPPING";
            case AWSmedialiveMultiplexStateDeleting:
                return @"DELETING";
            case AWSmedialiveMultiplexStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveDescribeOfferingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"offeringId" : @"OfferingId",
             };
}

@end

@implementation AWSmedialiveDescribeOfferingResponse

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
            return @(AWSmedialiveOfferingDurationUnitsMonths);
        }
        return @(AWSmedialiveOfferingDurationUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveOfferingDurationUnitsMonths:
                return @"MONTHS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSmedialiveOfferingTypeNoUpfront);
        }
        return @(AWSmedialiveOfferingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveOfferingTypeNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveReservationResourceSpecification class]];
}

@end

@implementation AWSmedialiveDescribeReservationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservationId" : @"ReservationId",
             };
}

@end

@implementation AWSmedialiveDescribeReservationResponse

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
            return @(AWSmedialiveOfferingDurationUnitsMonths);
        }
        return @(AWSmedialiveOfferingDurationUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveOfferingDurationUnitsMonths:
                return @"MONTHS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSmedialiveOfferingTypeNoUpfront);
        }
        return @(AWSmedialiveOfferingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveOfferingTypeNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveReservationResourceSpecification class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSmedialiveReservationStateActive);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSmedialiveReservationStateExpired);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSmedialiveReservationStateCanceled);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveReservationStateDeleted);
        }
        return @(AWSmedialiveReservationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveReservationStateActive:
                return @"ACTIVE";
            case AWSmedialiveReservationStateExpired:
                return @"EXPIRED";
            case AWSmedialiveReservationStateCanceled:
                return @"CANCELED";
            case AWSmedialiveReservationStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveDescribeScheduleRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSmedialiveDescribeScheduleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scheduleActions" : @"ScheduleActions",
             };
}

+ (NSValueTransformer *)scheduleActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveScheduleAction class]];
}

@end

@implementation AWSmedialiveDvbNitSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkId" : @"NetworkId",
             @"networkName" : @"NetworkName",
             @"repInterval" : @"RepInterval",
             };
}

@end

@implementation AWSmedialiveDvbSdtSettings

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
            return @(AWSmedialiveDvbSdtOutputSdtSdtFollow);
        }
        if ([value caseInsensitiveCompare:@"SDT_FOLLOW_IF_PRESENT"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSdtOutputSdtSdtFollowIfPresent);
        }
        if ([value caseInsensitiveCompare:@"SDT_MANUAL"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSdtOutputSdtSdtManual);
        }
        if ([value caseInsensitiveCompare:@"SDT_NONE"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSdtOutputSdtSdtNone);
        }
        return @(AWSmedialiveDvbSdtOutputSdtUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveDvbSdtOutputSdtSdtFollow:
                return @"SDT_FOLLOW";
            case AWSmedialiveDvbSdtOutputSdtSdtFollowIfPresent:
                return @"SDT_FOLLOW_IF_PRESENT";
            case AWSmedialiveDvbSdtOutputSdtSdtManual:
                return @"SDT_MANUAL";
            case AWSmedialiveDvbSdtOutputSdtSdtNone:
                return @"SDT_NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveDvbSubDestinationSettings

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
            return @(AWSmedialiveDvbSubDestinationAlignmentCentered);
        }
        if ([value caseInsensitiveCompare:@"LEFT"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationAlignmentLeft);
        }
        if ([value caseInsensitiveCompare:@"SMART"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationAlignmentSmart);
        }
        return @(AWSmedialiveDvbSubDestinationAlignmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveDvbSubDestinationAlignmentCentered:
                return @"CENTERED";
            case AWSmedialiveDvbSubDestinationAlignmentLeft:
                return @"LEFT";
            case AWSmedialiveDvbSubDestinationAlignmentSmart:
                return @"SMART";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)backgroundColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationBackgroundColorBlack);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationBackgroundColorNone);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationBackgroundColorWhite);
        }
        return @(AWSmedialiveDvbSubDestinationBackgroundColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveDvbSubDestinationBackgroundColorBlack:
                return @"BLACK";
            case AWSmedialiveDvbSubDestinationBackgroundColorNone:
                return @"NONE";
            case AWSmedialiveDvbSubDestinationBackgroundColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)fontJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputLocation class]];
}

+ (NSValueTransformer *)fontColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationFontColorBlack);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationFontColorBlue);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationFontColorGreen);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationFontColorRed);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationFontColorWhite);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationFontColorYellow);
        }
        return @(AWSmedialiveDvbSubDestinationFontColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveDvbSubDestinationFontColorBlack:
                return @"BLACK";
            case AWSmedialiveDvbSubDestinationFontColorBlue:
                return @"BLUE";
            case AWSmedialiveDvbSubDestinationFontColorGreen:
                return @"GREEN";
            case AWSmedialiveDvbSubDestinationFontColorRed:
                return @"RED";
            case AWSmedialiveDvbSubDestinationFontColorWhite:
                return @"WHITE";
            case AWSmedialiveDvbSubDestinationFontColorYellow:
                return @"YELLOW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outlineColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationOutlineColorBlack);
        }
        if ([value caseInsensitiveCompare:@"BLUE"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationOutlineColorBlue);
        }
        if ([value caseInsensitiveCompare:@"GREEN"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationOutlineColorGreen);
        }
        if ([value caseInsensitiveCompare:@"RED"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationOutlineColorRed);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationOutlineColorWhite);
        }
        if ([value caseInsensitiveCompare:@"YELLOW"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationOutlineColorYellow);
        }
        return @(AWSmedialiveDvbSubDestinationOutlineColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveDvbSubDestinationOutlineColorBlack:
                return @"BLACK";
            case AWSmedialiveDvbSubDestinationOutlineColorBlue:
                return @"BLUE";
            case AWSmedialiveDvbSubDestinationOutlineColorGreen:
                return @"GREEN";
            case AWSmedialiveDvbSubDestinationOutlineColorRed:
                return @"RED";
            case AWSmedialiveDvbSubDestinationOutlineColorWhite:
                return @"WHITE";
            case AWSmedialiveDvbSubDestinationOutlineColorYellow:
                return @"YELLOW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)shadowColorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLACK"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationShadowColorBlack);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationShadowColorNone);
        }
        if ([value caseInsensitiveCompare:@"WHITE"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationShadowColorWhite);
        }
        return @(AWSmedialiveDvbSubDestinationShadowColorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveDvbSubDestinationShadowColorBlack:
                return @"BLACK";
            case AWSmedialiveDvbSubDestinationShadowColorNone:
                return @"NONE";
            case AWSmedialiveDvbSubDestinationShadowColorWhite:
                return @"WHITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)teletextGridControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FIXED"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationTeletextGridControlFixed);
        }
        if ([value caseInsensitiveCompare:@"SCALED"] == NSOrderedSame) {
            return @(AWSmedialiveDvbSubDestinationTeletextGridControlScaled);
        }
        return @(AWSmedialiveDvbSubDestinationTeletextGridControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveDvbSubDestinationTeletextGridControlFixed:
                return @"FIXED";
            case AWSmedialiveDvbSubDestinationTeletextGridControlScaled:
                return @"SCALED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveDvbSubSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pid" : @"Pid",
             };
}

@end

@implementation AWSmedialiveDvbTdtSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"repInterval" : @"RepInterval",
             };
}

@end

@implementation AWSmedialiveEac3Settings

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
            return @(AWSmedialiveEac3AttenuationControlAttenuate3Db);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveEac3AttenuationControlNone);
        }
        return @(AWSmedialiveEac3AttenuationControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3AttenuationControlAttenuate3Db:
                return @"ATTENUATE_3_DB";
            case AWSmedialiveEac3AttenuationControlNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bitstreamModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMMENTARY"] == NSOrderedSame) {
            return @(AWSmedialiveEac3BitstreamModeCommentary);
        }
        if ([value caseInsensitiveCompare:@"COMPLETE_MAIN"] == NSOrderedSame) {
            return @(AWSmedialiveEac3BitstreamModeCompleteMain);
        }
        if ([value caseInsensitiveCompare:@"EMERGENCY"] == NSOrderedSame) {
            return @(AWSmedialiveEac3BitstreamModeEmergency);
        }
        if ([value caseInsensitiveCompare:@"HEARING_IMPAIRED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3BitstreamModeHearingImpaired);
        }
        if ([value caseInsensitiveCompare:@"VISUALLY_IMPAIRED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3BitstreamModeVisuallyImpaired);
        }
        return @(AWSmedialiveEac3BitstreamModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3BitstreamModeCommentary:
                return @"COMMENTARY";
            case AWSmedialiveEac3BitstreamModeCompleteMain:
                return @"COMPLETE_MAIN";
            case AWSmedialiveEac3BitstreamModeEmergency:
                return @"EMERGENCY";
            case AWSmedialiveEac3BitstreamModeHearingImpaired:
                return @"HEARING_IMPAIRED";
            case AWSmedialiveEac3BitstreamModeVisuallyImpaired:
                return @"VISUALLY_IMPAIRED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CODING_MODE_1_0"] == NSOrderedSame) {
            return @(AWSmedialiveEac3CodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSmedialiveEac3CodingModeCodingMode20);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_3_2"] == NSOrderedSame) {
            return @(AWSmedialiveEac3CodingModeCodingMode32);
        }
        return @(AWSmedialiveEac3CodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3CodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSmedialiveEac3CodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            case AWSmedialiveEac3CodingModeCodingMode32:
                return @"CODING_MODE_3_2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dcFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DcFilterDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DcFilterEnabled);
        }
        return @(AWSmedialiveEac3DcFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3DcFilterDisabled:
                return @"DISABLED";
            case AWSmedialiveEac3DcFilterEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)drcLineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILM_LIGHT"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DrcLineFilmLight);
        }
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DrcLineFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_LIGHT"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DrcLineMusicLight);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_STANDARD"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DrcLineMusicStandard);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DrcLineNone);
        }
        if ([value caseInsensitiveCompare:@"SPEECH"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DrcLineSpeech);
        }
        return @(AWSmedialiveEac3DrcLineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3DrcLineFilmLight:
                return @"FILM_LIGHT";
            case AWSmedialiveEac3DrcLineFilmStandard:
                return @"FILM_STANDARD";
            case AWSmedialiveEac3DrcLineMusicLight:
                return @"MUSIC_LIGHT";
            case AWSmedialiveEac3DrcLineMusicStandard:
                return @"MUSIC_STANDARD";
            case AWSmedialiveEac3DrcLineNone:
                return @"NONE";
            case AWSmedialiveEac3DrcLineSpeech:
                return @"SPEECH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)drcRfJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FILM_LIGHT"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DrcRfFilmLight);
        }
        if ([value caseInsensitiveCompare:@"FILM_STANDARD"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DrcRfFilmStandard);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_LIGHT"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DrcRfMusicLight);
        }
        if ([value caseInsensitiveCompare:@"MUSIC_STANDARD"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DrcRfMusicStandard);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DrcRfNone);
        }
        if ([value caseInsensitiveCompare:@"SPEECH"] == NSOrderedSame) {
            return @(AWSmedialiveEac3DrcRfSpeech);
        }
        return @(AWSmedialiveEac3DrcRfUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3DrcRfFilmLight:
                return @"FILM_LIGHT";
            case AWSmedialiveEac3DrcRfFilmStandard:
                return @"FILM_STANDARD";
            case AWSmedialiveEac3DrcRfMusicLight:
                return @"MUSIC_LIGHT";
            case AWSmedialiveEac3DrcRfMusicStandard:
                return @"MUSIC_STANDARD";
            case AWSmedialiveEac3DrcRfNone:
                return @"NONE";
            case AWSmedialiveEac3DrcRfSpeech:
                return @"SPEECH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lfeControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LFE"] == NSOrderedSame) {
            return @(AWSmedialiveEac3LfeControlLfe);
        }
        if ([value caseInsensitiveCompare:@"NO_LFE"] == NSOrderedSame) {
            return @(AWSmedialiveEac3LfeControlNoLfe);
        }
        return @(AWSmedialiveEac3LfeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3LfeControlLfe:
                return @"LFE";
            case AWSmedialiveEac3LfeControlNoLfe:
                return @"NO_LFE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lfeFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3LfeFilterDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3LfeFilterEnabled);
        }
        return @(AWSmedialiveEac3LfeFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3LfeFilterDisabled:
                return @"DISABLED";
            case AWSmedialiveEac3LfeFilterEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metadataControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW_INPUT"] == NSOrderedSame) {
            return @(AWSmedialiveEac3MetadataControlFollowInput);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3MetadataControlUseConfigured);
        }
        return @(AWSmedialiveEac3MetadataControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3MetadataControlFollowInput:
                return @"FOLLOW_INPUT";
            case AWSmedialiveEac3MetadataControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)passthroughControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveEac3PassthroughControlNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"WHEN_POSSIBLE"] == NSOrderedSame) {
            return @(AWSmedialiveEac3PassthroughControlWhenPossible);
        }
        return @(AWSmedialiveEac3PassthroughControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3PassthroughControlNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSmedialiveEac3PassthroughControlWhenPossible:
                return @"WHEN_POSSIBLE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)phaseControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_SHIFT"] == NSOrderedSame) {
            return @(AWSmedialiveEac3PhaseControlNoShift);
        }
        if ([value caseInsensitiveCompare:@"SHIFT_90_DEGREES"] == NSOrderedSame) {
            return @(AWSmedialiveEac3PhaseControlShift90Degrees);
        }
        return @(AWSmedialiveEac3PhaseControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3PhaseControlNoShift:
                return @"NO_SHIFT";
            case AWSmedialiveEac3PhaseControlShift90Degrees:
                return @"SHIFT_90_DEGREES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stereoDownmixJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DPL2"] == NSOrderedSame) {
            return @(AWSmedialiveEac3StereoDownmixDpl2);
        }
        if ([value caseInsensitiveCompare:@"LO_RO"] == NSOrderedSame) {
            return @(AWSmedialiveEac3StereoDownmixLoRo);
        }
        if ([value caseInsensitiveCompare:@"LT_RT"] == NSOrderedSame) {
            return @(AWSmedialiveEac3StereoDownmixLtRt);
        }
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3StereoDownmixNotIndicated);
        }
        return @(AWSmedialiveEac3StereoDownmixUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3StereoDownmixDpl2:
                return @"DPL2";
            case AWSmedialiveEac3StereoDownmixLoRo:
                return @"LO_RO";
            case AWSmedialiveEac3StereoDownmixLtRt:
                return @"LT_RT";
            case AWSmedialiveEac3StereoDownmixNotIndicated:
                return @"NOT_INDICATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)surroundExModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3SurroundExModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3SurroundExModeEnabled);
        }
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3SurroundExModeNotIndicated);
        }
        return @(AWSmedialiveEac3SurroundExModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3SurroundExModeDisabled:
                return @"DISABLED";
            case AWSmedialiveEac3SurroundExModeEnabled:
                return @"ENABLED";
            case AWSmedialiveEac3SurroundExModeNotIndicated:
                return @"NOT_INDICATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)surroundModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3SurroundModeDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3SurroundModeEnabled);
        }
        if ([value caseInsensitiveCompare:@"NOT_INDICATED"] == NSOrderedSame) {
            return @(AWSmedialiveEac3SurroundModeNotIndicated);
        }
        return @(AWSmedialiveEac3SurroundModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEac3SurroundModeDisabled:
                return @"DISABLED";
            case AWSmedialiveEac3SurroundModeEnabled:
                return @"ENABLED";
            case AWSmedialiveEac3SurroundModeNotIndicated:
                return @"NOT_INDICATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveEmbeddedDestinationSettings

@end

@implementation AWSmedialiveEmbeddedPlusScte20DestinationSettings

@end

@implementation AWSmedialiveEmbeddedSourceSettings

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
            return @(AWSmedialiveEmbeddedConvert608To708Disabled);
        }
        if ([value caseInsensitiveCompare:@"UPCONVERT"] == NSOrderedSame) {
            return @(AWSmedialiveEmbeddedConvert608To708Upconvert);
        }
        return @(AWSmedialiveEmbeddedConvert608To708Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEmbeddedConvert608To708Disabled:
                return @"DISABLED";
            case AWSmedialiveEmbeddedConvert608To708Upconvert:
                return @"UPCONVERT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte20DetectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmedialiveEmbeddedScte20DetectionAuto);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSmedialiveEmbeddedScte20DetectionOff);
        }
        return @(AWSmedialiveEmbeddedScte20DetectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveEmbeddedScte20DetectionAuto:
                return @"AUTO";
            case AWSmedialiveEmbeddedScte20DetectionOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveEmpty

@end

@implementation AWSmedialiveEncoderSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioDescriptions" : @"AudioDescriptions",
             @"availBlanking" : @"AvailBlanking",
             @"availConfiguration" : @"AvailConfiguration",
             @"blackoutSlate" : @"BlackoutSlate",
             @"captionDescriptions" : @"CaptionDescriptions",
             @"globalConfiguration" : @"GlobalConfiguration",
             @"nielsenConfiguration" : @"NielsenConfiguration",
             @"outputGroups" : @"OutputGroups",
             @"timecodeConfig" : @"TimecodeConfig",
             @"videoDescriptions" : @"VideoDescriptions",
             };
}

+ (NSValueTransformer *)audioDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveAudioDescription class]];
}

+ (NSValueTransformer *)availBlankingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAvailBlanking class]];
}

+ (NSValueTransformer *)availConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAvailConfiguration class]];
}

+ (NSValueTransformer *)blackoutSlateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveBlackoutSlate class]];
}

+ (NSValueTransformer *)captionDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveCaptionDescription class]];
}

+ (NSValueTransformer *)globalConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveGlobalConfiguration class]];
}

+ (NSValueTransformer *)nielsenConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveNielsenConfiguration class]];
}

+ (NSValueTransformer *)outputGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputGroup class]];
}

+ (NSValueTransformer *)timecodeConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveTimecodeConfig class]];
}

+ (NSValueTransformer *)videoDescriptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveVideoDescription class]];
}

@end

@implementation AWSmedialiveFecOutputSettings

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
            return @(AWSmedialiveFecOutputIncludeFecColumn);
        }
        if ([value caseInsensitiveCompare:@"COLUMN_AND_ROW"] == NSOrderedSame) {
            return @(AWSmedialiveFecOutputIncludeFecColumnAndRow);
        }
        return @(AWSmedialiveFecOutputIncludeFecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveFecOutputIncludeFecColumn:
                return @"COLUMN";
            case AWSmedialiveFecOutputIncludeFecColumnAndRow:
                return @"COLUMN_AND_ROW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveFixedModeScheduleActionStartSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"time" : @"Time",
             };
}

@end

@implementation AWSmedialiveFmp4HlsSettings

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
            return @(AWSmedialiveFmp4NielsenId3BehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveFmp4NielsenId3BehaviorPassthrough);
        }
        return @(AWSmedialiveFmp4NielsenId3BehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveFmp4NielsenId3BehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSmedialiveFmp4NielsenId3BehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveFmp4TimedMetadataBehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveFmp4TimedMetadataBehaviorPassthrough);
        }
        return @(AWSmedialiveFmp4TimedMetadataBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveFmp4TimedMetadataBehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSmedialiveFmp4TimedMetadataBehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveFollowModeScheduleActionStartSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"followPoint" : @"FollowPoint",
             @"referenceActionName" : @"ReferenceActionName",
             };
}

+ (NSValueTransformer *)followPointJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"END"] == NSOrderedSame) {
            return @(AWSmedialiveFollowPointEnd);
        }
        if ([value caseInsensitiveCompare:@"START"] == NSOrderedSame) {
            return @(AWSmedialiveFollowPointStart);
        }
        return @(AWSmedialiveFollowPointUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveFollowPointEnd:
                return @"END";
            case AWSmedialiveFollowPointStart:
                return @"START";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveFrameCaptureGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveOutputLocationRef class]];
}

@end

@implementation AWSmedialiveFrameCaptureOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nameModifier" : @"NameModifier",
             };
}

@end

@implementation AWSmedialiveFrameCaptureSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"captureInterval" : @"CaptureInterval",
             @"captureIntervalUnits" : @"CaptureIntervalUnits",
             };
}

+ (NSValueTransformer *)captureIntervalUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MILLISECONDS"] == NSOrderedSame) {
            return @(AWSmedialiveFrameCaptureIntervalUnitMilliseconds);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSmedialiveFrameCaptureIntervalUnitSeconds);
        }
        return @(AWSmedialiveFrameCaptureIntervalUnitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveFrameCaptureIntervalUnitMilliseconds:
                return @"MILLISECONDS";
            case AWSmedialiveFrameCaptureIntervalUnitSeconds:
                return @"SECONDS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveGlobalConfiguration

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
            return @(AWSmedialiveGlobalConfigurationInputEndActionNone);
        }
        if ([value caseInsensitiveCompare:@"SWITCH_AND_LOOP_INPUTS"] == NSOrderedSame) {
            return @(AWSmedialiveGlobalConfigurationInputEndActionSwitchAndLoopInputs);
        }
        return @(AWSmedialiveGlobalConfigurationInputEndActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveGlobalConfigurationInputEndActionNone:
                return @"NONE";
            case AWSmedialiveGlobalConfigurationInputEndActionSwitchAndLoopInputs:
                return @"SWITCH_AND_LOOP_INPUTS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputLossBehaviorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputLossBehavior class]];
}

+ (NSValueTransformer *)outputLockingModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EPOCH_LOCKING"] == NSOrderedSame) {
            return @(AWSmedialiveGlobalConfigurationOutputLockingModeEpochLocking);
        }
        if ([value caseInsensitiveCompare:@"PIPELINE_LOCKING"] == NSOrderedSame) {
            return @(AWSmedialiveGlobalConfigurationOutputLockingModePipelineLocking);
        }
        return @(AWSmedialiveGlobalConfigurationOutputLockingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveGlobalConfigurationOutputLockingModeEpochLocking:
                return @"EPOCH_LOCKING";
            case AWSmedialiveGlobalConfigurationOutputLockingModePipelineLocking:
                return @"PIPELINE_LOCKING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputTimingSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INPUT_CLOCK"] == NSOrderedSame) {
            return @(AWSmedialiveGlobalConfigurationOutputTimingSourceInputClock);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM_CLOCK"] == NSOrderedSame) {
            return @(AWSmedialiveGlobalConfigurationOutputTimingSourceSystemClock);
        }
        return @(AWSmedialiveGlobalConfigurationOutputTimingSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveGlobalConfigurationOutputTimingSourceInputClock:
                return @"INPUT_CLOCK";
            case AWSmedialiveGlobalConfigurationOutputTimingSourceSystemClock:
                return @"SYSTEM_CLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)supportLowFramerateInputsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveGlobalConfigurationLowFramerateInputsDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveGlobalConfigurationLowFramerateInputsEnabled);
        }
        return @(AWSmedialiveGlobalConfigurationLowFramerateInputsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveGlobalConfigurationLowFramerateInputsDisabled:
                return @"DISABLED";
            case AWSmedialiveGlobalConfigurationLowFramerateInputsEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveH264ColorSpaceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"colorSpacePassthroughSettings" : @"ColorSpacePassthroughSettings",
             @"rec601Settings" : @"Rec601Settings",
             @"rec709Settings" : @"Rec709Settings",
             };
}

+ (NSValueTransformer *)colorSpacePassthroughSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveColorSpacePassthroughSettings class]];
}

+ (NSValueTransformer *)rec601SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveRec601Settings class]];
}

+ (NSValueTransformer *)rec709SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveRec709Settings class]];
}

@end

@implementation AWSmedialiveH264FilterSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"temporalFilterSettings" : @"TemporalFilterSettings",
             };
}

+ (NSValueTransformer *)temporalFilterSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveTemporalFilterSettings class]];
}

@end

@implementation AWSmedialiveH264Settings

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
            return @(AWSmedialiveH264AdaptiveQuantizationHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGHER"] == NSOrderedSame) {
            return @(AWSmedialiveH264AdaptiveQuantizationHigher);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSmedialiveH264AdaptiveQuantizationLow);
        }
        if ([value caseInsensitiveCompare:@"MAX"] == NSOrderedSame) {
            return @(AWSmedialiveH264AdaptiveQuantizationMax);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSmedialiveH264AdaptiveQuantizationMedium);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSmedialiveH264AdaptiveQuantizationOff);
        }
        return @(AWSmedialiveH264AdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264AdaptiveQuantizationHigh:
                return @"HIGH";
            case AWSmedialiveH264AdaptiveQuantizationHigher:
                return @"HIGHER";
            case AWSmedialiveH264AdaptiveQuantizationLow:
                return @"LOW";
            case AWSmedialiveH264AdaptiveQuantizationMax:
                return @"MAX";
            case AWSmedialiveH264AdaptiveQuantizationMedium:
                return @"MEDIUM";
            case AWSmedialiveH264AdaptiveQuantizationOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)afdSignalingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmedialiveAfdSignalingAuto);
        }
        if ([value caseInsensitiveCompare:@"FIXED"] == NSOrderedSame) {
            return @(AWSmedialiveAfdSignalingFixed);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveAfdSignalingNone);
        }
        return @(AWSmedialiveAfdSignalingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAfdSignalingAuto:
                return @"AUTO";
            case AWSmedialiveAfdSignalingFixed:
                return @"FIXED";
            case AWSmedialiveAfdSignalingNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorMetadataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSmedialiveH264ColorMetadataIgnore);
        }
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSmedialiveH264ColorMetadataInsert);
        }
        return @(AWSmedialiveH264ColorMetadataUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264ColorMetadataIgnore:
                return @"IGNORE";
            case AWSmedialiveH264ColorMetadataInsert:
                return @"INSERT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorSpaceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveH264ColorSpaceSettings class]];
}

+ (NSValueTransformer *)entropyEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CABAC"] == NSOrderedSame) {
            return @(AWSmedialiveH264EntropyEncodingCabac);
        }
        if ([value caseInsensitiveCompare:@"CAVLC"] == NSOrderedSame) {
            return @(AWSmedialiveH264EntropyEncodingCavlc);
        }
        return @(AWSmedialiveH264EntropyEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264EntropyEncodingCabac:
                return @"CABAC";
            case AWSmedialiveH264EntropyEncodingCavlc:
                return @"CAVLC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)filterSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveH264FilterSettings class]];
}

+ (NSValueTransformer *)fixedAfdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AFD_0000"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd0000);
        }
        if ([value caseInsensitiveCompare:@"AFD_0010"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd0010);
        }
        if ([value caseInsensitiveCompare:@"AFD_0011"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd0011);
        }
        if ([value caseInsensitiveCompare:@"AFD_0100"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd0100);
        }
        if ([value caseInsensitiveCompare:@"AFD_1000"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1000);
        }
        if ([value caseInsensitiveCompare:@"AFD_1001"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1001);
        }
        if ([value caseInsensitiveCompare:@"AFD_1010"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1010);
        }
        if ([value caseInsensitiveCompare:@"AFD_1011"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1011);
        }
        if ([value caseInsensitiveCompare:@"AFD_1101"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1101);
        }
        if ([value caseInsensitiveCompare:@"AFD_1110"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1110);
        }
        if ([value caseInsensitiveCompare:@"AFD_1111"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1111);
        }
        return @(AWSmedialiveFixedAfdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveFixedAfdAfd0000:
                return @"AFD_0000";
            case AWSmedialiveFixedAfdAfd0010:
                return @"AFD_0010";
            case AWSmedialiveFixedAfdAfd0011:
                return @"AFD_0011";
            case AWSmedialiveFixedAfdAfd0100:
                return @"AFD_0100";
            case AWSmedialiveFixedAfdAfd1000:
                return @"AFD_1000";
            case AWSmedialiveFixedAfdAfd1001:
                return @"AFD_1001";
            case AWSmedialiveFixedAfdAfd1010:
                return @"AFD_1010";
            case AWSmedialiveFixedAfdAfd1011:
                return @"AFD_1011";
            case AWSmedialiveFixedAfdAfd1101:
                return @"AFD_1101";
            case AWSmedialiveFixedAfdAfd1110:
                return @"AFD_1110";
            case AWSmedialiveFixedAfdAfd1111:
                return @"AFD_1111";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)flickerAqJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH264FlickerAqDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH264FlickerAqEnabled);
        }
        return @(AWSmedialiveH264FlickerAqUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264FlickerAqDisabled:
                return @"DISABLED";
            case AWSmedialiveH264FlickerAqEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)forceFieldPicturesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH264ForceFieldPicturesDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH264ForceFieldPicturesEnabled);
        }
        return @(AWSmedialiveH264ForceFieldPicturesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264ForceFieldPicturesDisabled:
                return @"DISABLED";
            case AWSmedialiveH264ForceFieldPicturesEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)framerateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSmedialiveH264FramerateControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSmedialiveH264FramerateControlSpecified);
        }
        return @(AWSmedialiveH264FramerateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264FramerateControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSmedialiveH264FramerateControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopBReferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH264GopBReferenceDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH264GopBReferenceEnabled);
        }
        return @(AWSmedialiveH264GopBReferenceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264GopBReferenceDisabled:
                return @"DISABLED";
            case AWSmedialiveH264GopBReferenceEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopSizeUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAMES"] == NSOrderedSame) {
            return @(AWSmedialiveH264GopSizeUnitsFrames);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSmedialiveH264GopSizeUnitsSeconds);
        }
        return @(AWSmedialiveH264GopSizeUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264GopSizeUnitsFrames:
                return @"FRAMES";
            case AWSmedialiveH264GopSizeUnitsSeconds:
                return @"SECONDS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)levelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"H264_LEVEL_1"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level1);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_1_1"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level11);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_1_2"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level12);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_1_3"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level13);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_2"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level2);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_2_1"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level21);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_2_2"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level22);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_3"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level3);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_3_1"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level31);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_3_2"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level32);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_4"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level4);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_4_1"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level41);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_4_2"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level42);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_5"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level5);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_5_1"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level51);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_5_2"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264Level52);
        }
        if ([value caseInsensitiveCompare:@"H264_LEVEL_AUTO"] == NSOrderedSame) {
            return @(AWSmedialiveH264LevelH264LevelAuto);
        }
        return @(AWSmedialiveH264LevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264LevelH264Level1:
                return @"H264_LEVEL_1";
            case AWSmedialiveH264LevelH264Level11:
                return @"H264_LEVEL_1_1";
            case AWSmedialiveH264LevelH264Level12:
                return @"H264_LEVEL_1_2";
            case AWSmedialiveH264LevelH264Level13:
                return @"H264_LEVEL_1_3";
            case AWSmedialiveH264LevelH264Level2:
                return @"H264_LEVEL_2";
            case AWSmedialiveH264LevelH264Level21:
                return @"H264_LEVEL_2_1";
            case AWSmedialiveH264LevelH264Level22:
                return @"H264_LEVEL_2_2";
            case AWSmedialiveH264LevelH264Level3:
                return @"H264_LEVEL_3";
            case AWSmedialiveH264LevelH264Level31:
                return @"H264_LEVEL_3_1";
            case AWSmedialiveH264LevelH264Level32:
                return @"H264_LEVEL_3_2";
            case AWSmedialiveH264LevelH264Level4:
                return @"H264_LEVEL_4";
            case AWSmedialiveH264LevelH264Level41:
                return @"H264_LEVEL_4_1";
            case AWSmedialiveH264LevelH264Level42:
                return @"H264_LEVEL_4_2";
            case AWSmedialiveH264LevelH264Level5:
                return @"H264_LEVEL_5";
            case AWSmedialiveH264LevelH264Level51:
                return @"H264_LEVEL_5_1";
            case AWSmedialiveH264LevelH264Level52:
                return @"H264_LEVEL_5_2";
            case AWSmedialiveH264LevelH264LevelAuto:
                return @"H264_LEVEL_AUTO";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lookAheadRateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSmedialiveH264LookAheadRateControlHigh);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSmedialiveH264LookAheadRateControlLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSmedialiveH264LookAheadRateControlMedium);
        }
        return @(AWSmedialiveH264LookAheadRateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264LookAheadRateControlHigh:
                return @"HIGH";
            case AWSmedialiveH264LookAheadRateControlLow:
                return @"LOW";
            case AWSmedialiveH264LookAheadRateControlMedium:
                return @"MEDIUM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INITIALIZE_FROM_SOURCE"] == NSOrderedSame) {
            return @(AWSmedialiveH264ParControlInitializeFromSource);
        }
        if ([value caseInsensitiveCompare:@"SPECIFIED"] == NSOrderedSame) {
            return @(AWSmedialiveH264ParControlSpecified);
        }
        return @(AWSmedialiveH264ParControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264ParControlInitializeFromSource:
                return @"INITIALIZE_FROM_SOURCE";
            case AWSmedialiveH264ParControlSpecified:
                return @"SPECIFIED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BASELINE"] == NSOrderedSame) {
            return @(AWSmedialiveH264ProfileBaseline);
        }
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSmedialiveH264ProfileHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGH_10BIT"] == NSOrderedSame) {
            return @(AWSmedialiveH264ProfileHigh10bit);
        }
        if ([value caseInsensitiveCompare:@"HIGH_422"] == NSOrderedSame) {
            return @(AWSmedialiveH264ProfileHigh422);
        }
        if ([value caseInsensitiveCompare:@"HIGH_422_10BIT"] == NSOrderedSame) {
            return @(AWSmedialiveH264ProfileHigh42210bit);
        }
        if ([value caseInsensitiveCompare:@"MAIN"] == NSOrderedSame) {
            return @(AWSmedialiveH264ProfileMain);
        }
        return @(AWSmedialiveH264ProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264ProfileBaseline:
                return @"BASELINE";
            case AWSmedialiveH264ProfileHigh:
                return @"HIGH";
            case AWSmedialiveH264ProfileHigh10bit:
                return @"HIGH_10BIT";
            case AWSmedialiveH264ProfileHigh422:
                return @"HIGH_422";
            case AWSmedialiveH264ProfileHigh42210bit:
                return @"HIGH_422_10BIT";
            case AWSmedialiveH264ProfileMain:
                return @"MAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)qualityLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENHANCED_QUALITY"] == NSOrderedSame) {
            return @(AWSmedialiveH264QualityLevelEnhancedQuality);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_QUALITY"] == NSOrderedSame) {
            return @(AWSmedialiveH264QualityLevelStandardQuality);
        }
        return @(AWSmedialiveH264QualityLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264QualityLevelEnhancedQuality:
                return @"ENHANCED_QUALITY";
            case AWSmedialiveH264QualityLevelStandardQuality:
                return @"STANDARD_QUALITY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSmedialiveH264RateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"MULTIPLEX"] == NSOrderedSame) {
            return @(AWSmedialiveH264RateControlModeMultiplex);
        }
        if ([value caseInsensitiveCompare:@"QVBR"] == NSOrderedSame) {
            return @(AWSmedialiveH264RateControlModeQvbr);
        }
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSmedialiveH264RateControlModeVbr);
        }
        return @(AWSmedialiveH264RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264RateControlModeCbr:
                return @"CBR";
            case AWSmedialiveH264RateControlModeMultiplex:
                return @"MULTIPLEX";
            case AWSmedialiveH264RateControlModeQvbr:
                return @"QVBR";
            case AWSmedialiveH264RateControlModeVbr:
                return @"VBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scanTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INTERLACED"] == NSOrderedSame) {
            return @(AWSmedialiveH264ScanTypeInterlaced);
        }
        if ([value caseInsensitiveCompare:@"PROGRESSIVE"] == NSOrderedSame) {
            return @(AWSmedialiveH264ScanTypeProgressive);
        }
        return @(AWSmedialiveH264ScanTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264ScanTypeInterlaced:
                return @"INTERLACED";
            case AWSmedialiveH264ScanTypeProgressive:
                return @"PROGRESSIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sceneChangeDetectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH264SceneChangeDetectDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH264SceneChangeDetectEnabled);
        }
        return @(AWSmedialiveH264SceneChangeDetectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264SceneChangeDetectDisabled:
                return @"DISABLED";
            case AWSmedialiveH264SceneChangeDetectEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)spatialAqJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH264SpatialAqDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH264SpatialAqEnabled);
        }
        return @(AWSmedialiveH264SpatialAqUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264SpatialAqDisabled:
                return @"DISABLED";
            case AWSmedialiveH264SpatialAqEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)subgopLengthJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DYNAMIC"] == NSOrderedSame) {
            return @(AWSmedialiveH264SubGopLengthDynamic);
        }
        if ([value caseInsensitiveCompare:@"FIXED"] == NSOrderedSame) {
            return @(AWSmedialiveH264SubGopLengthFixed);
        }
        return @(AWSmedialiveH264SubGopLengthUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264SubGopLengthDynamic:
                return @"DYNAMIC";
            case AWSmedialiveH264SubGopLengthFixed:
                return @"FIXED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)syntaxJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSmedialiveH264SyntaxDefault);
        }
        if ([value caseInsensitiveCompare:@"RP2027"] == NSOrderedSame) {
            return @(AWSmedialiveH264SyntaxRp2027);
        }
        return @(AWSmedialiveH264SyntaxUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264SyntaxDefault:
                return @"DEFAULT";
            case AWSmedialiveH264SyntaxRp2027:
                return @"RP2027";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)temporalAqJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH264TemporalAqDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH264TemporalAqEnabled);
        }
        return @(AWSmedialiveH264TemporalAqUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264TemporalAqDisabled:
                return @"DISABLED";
            case AWSmedialiveH264TemporalAqEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timecodeInsertionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH264TimecodeInsertionBehaviorDisabled);
        }
        if ([value caseInsensitiveCompare:@"PIC_TIMING_SEI"] == NSOrderedSame) {
            return @(AWSmedialiveH264TimecodeInsertionBehaviorPicTimingSei);
        }
        return @(AWSmedialiveH264TimecodeInsertionBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH264TimecodeInsertionBehaviorDisabled:
                return @"DISABLED";
            case AWSmedialiveH264TimecodeInsertionBehaviorPicTimingSei:
                return @"PIC_TIMING_SEI";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveH265ColorSpaceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"colorSpacePassthroughSettings" : @"ColorSpacePassthroughSettings",
             @"hdr10Settings" : @"Hdr10Settings",
             @"rec601Settings" : @"Rec601Settings",
             @"rec709Settings" : @"Rec709Settings",
             };
}

+ (NSValueTransformer *)colorSpacePassthroughSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveColorSpacePassthroughSettings class]];
}

+ (NSValueTransformer *)hdr10SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveHdr10Settings class]];
}

+ (NSValueTransformer *)rec601SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveRec601Settings class]];
}

+ (NSValueTransformer *)rec709SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveRec709Settings class]];
}

@end

@implementation AWSmedialiveH265Settings

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
            return @(AWSmedialiveH265AdaptiveQuantizationHigh);
        }
        if ([value caseInsensitiveCompare:@"HIGHER"] == NSOrderedSame) {
            return @(AWSmedialiveH265AdaptiveQuantizationHigher);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSmedialiveH265AdaptiveQuantizationLow);
        }
        if ([value caseInsensitiveCompare:@"MAX"] == NSOrderedSame) {
            return @(AWSmedialiveH265AdaptiveQuantizationMax);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSmedialiveH265AdaptiveQuantizationMedium);
        }
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSmedialiveH265AdaptiveQuantizationOff);
        }
        return @(AWSmedialiveH265AdaptiveQuantizationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH265AdaptiveQuantizationHigh:
                return @"HIGH";
            case AWSmedialiveH265AdaptiveQuantizationHigher:
                return @"HIGHER";
            case AWSmedialiveH265AdaptiveQuantizationLow:
                return @"LOW";
            case AWSmedialiveH265AdaptiveQuantizationMax:
                return @"MAX";
            case AWSmedialiveH265AdaptiveQuantizationMedium:
                return @"MEDIUM";
            case AWSmedialiveH265AdaptiveQuantizationOff:
                return @"OFF";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)afdSignalingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmedialiveAfdSignalingAuto);
        }
        if ([value caseInsensitiveCompare:@"FIXED"] == NSOrderedSame) {
            return @(AWSmedialiveAfdSignalingFixed);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveAfdSignalingNone);
        }
        return @(AWSmedialiveAfdSignalingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAfdSignalingAuto:
                return @"AUTO";
            case AWSmedialiveAfdSignalingFixed:
                return @"FIXED";
            case AWSmedialiveAfdSignalingNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)alternativeTransferFunctionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSmedialiveH265AlternativeTransferFunctionInsert);
        }
        if ([value caseInsensitiveCompare:@"OMIT"] == NSOrderedSame) {
            return @(AWSmedialiveH265AlternativeTransferFunctionOmit);
        }
        return @(AWSmedialiveH265AlternativeTransferFunctionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH265AlternativeTransferFunctionInsert:
                return @"INSERT";
            case AWSmedialiveH265AlternativeTransferFunctionOmit:
                return @"OMIT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorMetadataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSmedialiveH265ColorMetadataIgnore);
        }
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSmedialiveH265ColorMetadataInsert);
        }
        return @(AWSmedialiveH265ColorMetadataUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH265ColorMetadataIgnore:
                return @"IGNORE";
            case AWSmedialiveH265ColorMetadataInsert:
                return @"INSERT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorSpaceSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveH265ColorSpaceSettings class]];
}

+ (NSValueTransformer *)fixedAfdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AFD_0000"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd0000);
        }
        if ([value caseInsensitiveCompare:@"AFD_0010"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd0010);
        }
        if ([value caseInsensitiveCompare:@"AFD_0011"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd0011);
        }
        if ([value caseInsensitiveCompare:@"AFD_0100"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd0100);
        }
        if ([value caseInsensitiveCompare:@"AFD_1000"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1000);
        }
        if ([value caseInsensitiveCompare:@"AFD_1001"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1001);
        }
        if ([value caseInsensitiveCompare:@"AFD_1010"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1010);
        }
        if ([value caseInsensitiveCompare:@"AFD_1011"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1011);
        }
        if ([value caseInsensitiveCompare:@"AFD_1101"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1101);
        }
        if ([value caseInsensitiveCompare:@"AFD_1110"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1110);
        }
        if ([value caseInsensitiveCompare:@"AFD_1111"] == NSOrderedSame) {
            return @(AWSmedialiveFixedAfdAfd1111);
        }
        return @(AWSmedialiveFixedAfdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveFixedAfdAfd0000:
                return @"AFD_0000";
            case AWSmedialiveFixedAfdAfd0010:
                return @"AFD_0010";
            case AWSmedialiveFixedAfdAfd0011:
                return @"AFD_0011";
            case AWSmedialiveFixedAfdAfd0100:
                return @"AFD_0100";
            case AWSmedialiveFixedAfdAfd1000:
                return @"AFD_1000";
            case AWSmedialiveFixedAfdAfd1001:
                return @"AFD_1001";
            case AWSmedialiveFixedAfdAfd1010:
                return @"AFD_1010";
            case AWSmedialiveFixedAfdAfd1011:
                return @"AFD_1011";
            case AWSmedialiveFixedAfdAfd1101:
                return @"AFD_1101";
            case AWSmedialiveFixedAfdAfd1110:
                return @"AFD_1110";
            case AWSmedialiveFixedAfdAfd1111:
                return @"AFD_1111";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)flickerAqJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH265FlickerAqDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH265FlickerAqEnabled);
        }
        return @(AWSmedialiveH265FlickerAqUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH265FlickerAqDisabled:
                return @"DISABLED";
            case AWSmedialiveH265FlickerAqEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)gopSizeUnitsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FRAMES"] == NSOrderedSame) {
            return @(AWSmedialiveH265GopSizeUnitsFrames);
        }
        if ([value caseInsensitiveCompare:@"SECONDS"] == NSOrderedSame) {
            return @(AWSmedialiveH265GopSizeUnitsSeconds);
        }
        return @(AWSmedialiveH265GopSizeUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH265GopSizeUnitsFrames:
                return @"FRAMES";
            case AWSmedialiveH265GopSizeUnitsSeconds:
                return @"SECONDS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)levelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"H265_LEVEL_1"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265Level1);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_2"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265Level2);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_2_1"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265Level21);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_3"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265Level3);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_3_1"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265Level31);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_4"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265Level4);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_4_1"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265Level41);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_5"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265Level5);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_5_1"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265Level51);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_5_2"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265Level52);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_6"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265Level6);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_6_1"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265Level61);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_6_2"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265Level62);
        }
        if ([value caseInsensitiveCompare:@"H265_LEVEL_AUTO"] == NSOrderedSame) {
            return @(AWSmedialiveH265LevelH265LevelAuto);
        }
        return @(AWSmedialiveH265LevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH265LevelH265Level1:
                return @"H265_LEVEL_1";
            case AWSmedialiveH265LevelH265Level2:
                return @"H265_LEVEL_2";
            case AWSmedialiveH265LevelH265Level21:
                return @"H265_LEVEL_2_1";
            case AWSmedialiveH265LevelH265Level3:
                return @"H265_LEVEL_3";
            case AWSmedialiveH265LevelH265Level31:
                return @"H265_LEVEL_3_1";
            case AWSmedialiveH265LevelH265Level4:
                return @"H265_LEVEL_4";
            case AWSmedialiveH265LevelH265Level41:
                return @"H265_LEVEL_4_1";
            case AWSmedialiveH265LevelH265Level5:
                return @"H265_LEVEL_5";
            case AWSmedialiveH265LevelH265Level51:
                return @"H265_LEVEL_5_1";
            case AWSmedialiveH265LevelH265Level52:
                return @"H265_LEVEL_5_2";
            case AWSmedialiveH265LevelH265Level6:
                return @"H265_LEVEL_6";
            case AWSmedialiveH265LevelH265Level61:
                return @"H265_LEVEL_6_1";
            case AWSmedialiveH265LevelH265Level62:
                return @"H265_LEVEL_6_2";
            case AWSmedialiveH265LevelH265LevelAuto:
                return @"H265_LEVEL_AUTO";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lookAheadRateControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSmedialiveH265LookAheadRateControlHigh);
        }
        if ([value caseInsensitiveCompare:@"LOW"] == NSOrderedSame) {
            return @(AWSmedialiveH265LookAheadRateControlLow);
        }
        if ([value caseInsensitiveCompare:@"MEDIUM"] == NSOrderedSame) {
            return @(AWSmedialiveH265LookAheadRateControlMedium);
        }
        return @(AWSmedialiveH265LookAheadRateControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH265LookAheadRateControlHigh:
                return @"HIGH";
            case AWSmedialiveH265LookAheadRateControlLow:
                return @"LOW";
            case AWSmedialiveH265LookAheadRateControlMedium:
                return @"MEDIUM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAIN"] == NSOrderedSame) {
            return @(AWSmedialiveH265ProfileMain);
        }
        if ([value caseInsensitiveCompare:@"MAIN_10BIT"] == NSOrderedSame) {
            return @(AWSmedialiveH265ProfileMain10bit);
        }
        return @(AWSmedialiveH265ProfileUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH265ProfileMain:
                return @"MAIN";
            case AWSmedialiveH265ProfileMain10bit:
                return @"MAIN_10BIT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateControlModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSmedialiveH265RateControlModeCbr);
        }
        if ([value caseInsensitiveCompare:@"MULTIPLEX"] == NSOrderedSame) {
            return @(AWSmedialiveH265RateControlModeMultiplex);
        }
        if ([value caseInsensitiveCompare:@"QVBR"] == NSOrderedSame) {
            return @(AWSmedialiveH265RateControlModeQvbr);
        }
        return @(AWSmedialiveH265RateControlModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH265RateControlModeCbr:
                return @"CBR";
            case AWSmedialiveH265RateControlModeMultiplex:
                return @"MULTIPLEX";
            case AWSmedialiveH265RateControlModeQvbr:
                return @"QVBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scanTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROGRESSIVE"] == NSOrderedSame) {
            return @(AWSmedialiveH265ScanTypeProgressive);
        }
        return @(AWSmedialiveH265ScanTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH265ScanTypeProgressive:
                return @"PROGRESSIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sceneChangeDetectJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH265SceneChangeDetectDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH265SceneChangeDetectEnabled);
        }
        return @(AWSmedialiveH265SceneChangeDetectUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH265SceneChangeDetectDisabled:
                return @"DISABLED";
            case AWSmedialiveH265SceneChangeDetectEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HIGH"] == NSOrderedSame) {
            return @(AWSmedialiveH265TierHigh);
        }
        if ([value caseInsensitiveCompare:@"MAIN"] == NSOrderedSame) {
            return @(AWSmedialiveH265TierMain);
        }
        return @(AWSmedialiveH265TierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH265TierHigh:
                return @"HIGH";
            case AWSmedialiveH265TierMain:
                return @"MAIN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timecodeInsertionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveH265TimecodeInsertionBehaviorDisabled);
        }
        if ([value caseInsensitiveCompare:@"PIC_TIMING_SEI"] == NSOrderedSame) {
            return @(AWSmedialiveH265TimecodeInsertionBehaviorPicTimingSei);
        }
        return @(AWSmedialiveH265TimecodeInsertionBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveH265TimecodeInsertionBehaviorDisabled:
                return @"DISABLED";
            case AWSmedialiveH265TimecodeInsertionBehaviorPicTimingSei:
                return @"PIC_TIMING_SEI";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveHdr10Settings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxCll" : @"MaxCll",
             @"maxFall" : @"MaxFall",
             };
}

@end

@implementation AWSmedialiveHlsAkamaiSettings

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
            return @(AWSmedialiveHlsAkamaiHttpTransferModeChunked);
        }
        if ([value caseInsensitiveCompare:@"NON_CHUNKED"] == NSOrderedSame) {
            return @(AWSmedialiveHlsAkamaiHttpTransferModeNonChunked);
        }
        return @(AWSmedialiveHlsAkamaiHttpTransferModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsAkamaiHttpTransferModeChunked:
                return @"CHUNKED";
            case AWSmedialiveHlsAkamaiHttpTransferModeNonChunked:
                return @"NON_CHUNKED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveHlsBasicPutSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionRetryInterval" : @"ConnectionRetryInterval",
             @"filecacheDuration" : @"FilecacheDuration",
             @"numRetries" : @"NumRetries",
             @"restartDelay" : @"RestartDelay",
             };
}

@end

@implementation AWSmedialiveHlsCdnSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hlsAkamaiSettings" : @"HlsAkamaiSettings",
             @"hlsBasicPutSettings" : @"HlsBasicPutSettings",
             @"hlsMediaStoreSettings" : @"HlsMediaStoreSettings",
             @"hlsWebdavSettings" : @"HlsWebdavSettings",
             };
}

+ (NSValueTransformer *)hlsAkamaiSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveHlsAkamaiSettings class]];
}

+ (NSValueTransformer *)hlsBasicPutSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveHlsBasicPutSettings class]];
}

+ (NSValueTransformer *)hlsMediaStoreSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveHlsMediaStoreSettings class]];
}

+ (NSValueTransformer *)hlsWebdavSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveHlsWebdavSettings class]];
}

@end

@implementation AWSmedialiveHlsGroupSettings

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveCaptionLanguageMapping class]];
}

+ (NSValueTransformer *)captionLanguageSettingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INSERT"] == NSOrderedSame) {
            return @(AWSmedialiveHlsCaptionLanguageSettingInsert);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveHlsCaptionLanguageSettingNone);
        }
        if ([value caseInsensitiveCompare:@"OMIT"] == NSOrderedSame) {
            return @(AWSmedialiveHlsCaptionLanguageSettingOmit);
        }
        return @(AWSmedialiveHlsCaptionLanguageSettingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsCaptionLanguageSettingInsert:
                return @"INSERT";
            case AWSmedialiveHlsCaptionLanguageSettingNone:
                return @"NONE";
            case AWSmedialiveHlsCaptionLanguageSettingOmit:
                return @"OMIT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)clientCacheJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveHlsClientCacheDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveHlsClientCacheEnabled);
        }
        return @(AWSmedialiveHlsClientCacheUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsClientCacheDisabled:
                return @"DISABLED";
            case AWSmedialiveHlsClientCacheEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecSpecificationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RFC_4281"] == NSOrderedSame) {
            return @(AWSmedialiveHlsCodecSpecificationRfc4281);
        }
        if ([value caseInsensitiveCompare:@"RFC_6381"] == NSOrderedSame) {
            return @(AWSmedialiveHlsCodecSpecificationRfc6381);
        }
        return @(AWSmedialiveHlsCodecSpecificationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsCodecSpecificationRfc4281:
                return @"RFC_4281";
            case AWSmedialiveHlsCodecSpecificationRfc6381:
                return @"RFC_6381";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveOutputLocationRef class]];
}

+ (NSValueTransformer *)directoryStructureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_DIRECTORY"] == NSOrderedSame) {
            return @(AWSmedialiveHlsDirectoryStructureSingleDirectory);
        }
        if ([value caseInsensitiveCompare:@"SUBDIRECTORY_PER_STREAM"] == NSOrderedSame) {
            return @(AWSmedialiveHlsDirectoryStructureSubdirectoryPerStream);
        }
        return @(AWSmedialiveHlsDirectoryStructureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsDirectoryStructureSingleDirectory:
                return @"SINGLE_DIRECTORY";
            case AWSmedialiveHlsDirectoryStructureSubdirectoryPerStream:
                return @"SUBDIRECTORY_PER_STREAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)encryptionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES128"] == NSOrderedSame) {
            return @(AWSmedialiveHlsEncryptionTypeAes128);
        }
        if ([value caseInsensitiveCompare:@"SAMPLE_AES"] == NSOrderedSame) {
            return @(AWSmedialiveHlsEncryptionTypeSampleAes);
        }
        return @(AWSmedialiveHlsEncryptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsEncryptionTypeAes128:
                return @"AES128";
            case AWSmedialiveHlsEncryptionTypeSampleAes:
                return @"SAMPLE_AES";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hlsCdnSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveHlsCdnSettings class]];
}

+ (NSValueTransformer *)hlsId3SegmentTaggingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveHlsId3SegmentTaggingStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveHlsId3SegmentTaggingStateEnabled);
        }
        return @(AWSmedialiveHlsId3SegmentTaggingStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsId3SegmentTaggingStateDisabled:
                return @"DISABLED";
            case AWSmedialiveHlsId3SegmentTaggingStateEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)IFrameOnlyPlaylistsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveIFrameOnlyPlaylistTypeDisabled);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSmedialiveIFrameOnlyPlaylistTypeStandard);
        }
        return @(AWSmedialiveIFrameOnlyPlaylistTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveIFrameOnlyPlaylistTypeDisabled:
                return @"DISABLED";
            case AWSmedialiveIFrameOnlyPlaylistTypeStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputLossActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMIT_OUTPUT"] == NSOrderedSame) {
            return @(AWSmedialiveInputLossActionForHlsOutEmitOutput);
        }
        if ([value caseInsensitiveCompare:@"PAUSE_OUTPUT"] == NSOrderedSame) {
            return @(AWSmedialiveInputLossActionForHlsOutPauseOutput);
        }
        return @(AWSmedialiveInputLossActionForHlsOutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputLossActionForHlsOutEmitOutput:
                return @"EMIT_OUTPUT";
            case AWSmedialiveInputLossActionForHlsOutPauseOutput:
                return @"PAUSE_OUTPUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ivInManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmedialiveHlsIvInManifestExclude);
        }
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSmedialiveHlsIvInManifestInclude);
        }
        return @(AWSmedialiveHlsIvInManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsIvInManifestExclude:
                return @"EXCLUDE";
            case AWSmedialiveHlsIvInManifestInclude:
                return @"INCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ivSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXPLICIT"] == NSOrderedSame) {
            return @(AWSmedialiveHlsIvSourceExplicit);
        }
        if ([value caseInsensitiveCompare:@"FOLLOWS_SEGMENT_NUMBER"] == NSOrderedSame) {
            return @(AWSmedialiveHlsIvSourceFollowsSegmentNumber);
        }
        return @(AWSmedialiveHlsIvSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsIvSourceExplicit:
                return @"EXPLICIT";
            case AWSmedialiveHlsIvSourceFollowsSegmentNumber:
                return @"FOLLOWS_SEGMENT_NUMBER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)keyProviderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveKeyProviderSettings class]];
}

+ (NSValueTransformer *)manifestCompressionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GZIP"] == NSOrderedSame) {
            return @(AWSmedialiveHlsManifestCompressionGzip);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveHlsManifestCompressionNone);
        }
        return @(AWSmedialiveHlsManifestCompressionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsManifestCompressionGzip:
                return @"GZIP";
            case AWSmedialiveHlsManifestCompressionNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)manifestDurationFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FLOATING_POINT"] == NSOrderedSame) {
            return @(AWSmedialiveHlsManifestDurationFormatFloatingPoint);
        }
        if ([value caseInsensitiveCompare:@"INTEGER"] == NSOrderedSame) {
            return @(AWSmedialiveHlsManifestDurationFormatInteger);
        }
        return @(AWSmedialiveHlsManifestDurationFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsManifestDurationFormatFloatingPoint:
                return @"FLOATING_POINT";
            case AWSmedialiveHlsManifestDurationFormatInteger:
                return @"INTEGER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LIVE"] == NSOrderedSame) {
            return @(AWSmedialiveHlsModeLive);
        }
        if ([value caseInsensitiveCompare:@"VOD"] == NSOrderedSame) {
            return @(AWSmedialiveHlsModeVod);
        }
        return @(AWSmedialiveHlsModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsModeLive:
                return @"LIVE";
            case AWSmedialiveHlsModeVod:
                return @"VOD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputSelectionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MANIFESTS_AND_SEGMENTS"] == NSOrderedSame) {
            return @(AWSmedialiveHlsOutputSelectionManifestsAndSegments);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTS_ONLY"] == NSOrderedSame) {
            return @(AWSmedialiveHlsOutputSelectionSegmentsOnly);
        }
        return @(AWSmedialiveHlsOutputSelectionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsOutputSelectionManifestsAndSegments:
                return @"MANIFESTS_AND_SEGMENTS";
            case AWSmedialiveHlsOutputSelectionSegmentsOnly:
                return @"SEGMENTS_ONLY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)programDateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmedialiveHlsProgramDateTimeExclude);
        }
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSmedialiveHlsProgramDateTimeInclude);
        }
        return @(AWSmedialiveHlsProgramDateTimeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsProgramDateTimeExclude:
                return @"EXCLUDE";
            case AWSmedialiveHlsProgramDateTimeInclude:
                return @"INCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)redundantManifestJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveHlsRedundantManifestDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveHlsRedundantManifestEnabled);
        }
        return @(AWSmedialiveHlsRedundantManifestUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsRedundantManifestDisabled:
                return @"DISABLED";
            case AWSmedialiveHlsRedundantManifestEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentationModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USE_INPUT_SEGMENTATION"] == NSOrderedSame) {
            return @(AWSmedialiveHlsSegmentationModeUseInputSegmentation);
        }
        if ([value caseInsensitiveCompare:@"USE_SEGMENT_DURATION"] == NSOrderedSame) {
            return @(AWSmedialiveHlsSegmentationModeUseSegmentDuration);
        }
        return @(AWSmedialiveHlsSegmentationModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsSegmentationModeUseInputSegmentation:
                return @"USE_INPUT_SEGMENTATION";
            case AWSmedialiveHlsSegmentationModeUseSegmentDuration:
                return @"USE_SEGMENT_DURATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)streamInfResolutionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmedialiveHlsStreamInfResolutionExclude);
        }
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSmedialiveHlsStreamInfResolutionInclude);
        }
        return @(AWSmedialiveHlsStreamInfResolutionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsStreamInfResolutionExclude:
                return @"EXCLUDE";
            case AWSmedialiveHlsStreamInfResolutionInclude:
                return @"INCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataId3FrameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveHlsTimedMetadataId3FrameNone);
        }
        if ([value caseInsensitiveCompare:@"PRIV"] == NSOrderedSame) {
            return @(AWSmedialiveHlsTimedMetadataId3FramePriv);
        }
        if ([value caseInsensitiveCompare:@"TDRL"] == NSOrderedSame) {
            return @(AWSmedialiveHlsTimedMetadataId3FrameTdrl);
        }
        return @(AWSmedialiveHlsTimedMetadataId3FrameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsTimedMetadataId3FrameNone:
                return @"NONE";
            case AWSmedialiveHlsTimedMetadataId3FramePriv:
                return @"PRIV";
            case AWSmedialiveHlsTimedMetadataId3FrameTdrl:
                return @"TDRL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tsFileModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SEGMENTED_FILES"] == NSOrderedSame) {
            return @(AWSmedialiveHlsTsFileModeSegmentedFiles);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_FILE"] == NSOrderedSame) {
            return @(AWSmedialiveHlsTsFileModeSingleFile);
        }
        return @(AWSmedialiveHlsTsFileModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsTsFileModeSegmentedFiles:
                return @"SEGMENTED_FILES";
            case AWSmedialiveHlsTsFileModeSingleFile:
                return @"SINGLE_FILE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveHlsId3SegmentTaggingScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tag" : @"Tag",
             };
}

@end

@implementation AWSmedialiveHlsInputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bandwidth" : @"Bandwidth",
             @"bufferSegments" : @"BufferSegments",
             @"retries" : @"Retries",
             @"retryInterval" : @"RetryInterval",
             };
}

@end

@implementation AWSmedialiveHlsMediaStoreSettings

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
            return @(AWSmedialiveHlsMediaStoreStorageClassTemporal);
        }
        return @(AWSmedialiveHlsMediaStoreStorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsMediaStoreStorageClassTemporal:
                return @"TEMPORAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveHlsOutputSettings

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
            return @(AWSmedialiveHlsH265PackagingTypeHev1);
        }
        if ([value caseInsensitiveCompare:@"HVC1"] == NSOrderedSame) {
            return @(AWSmedialiveHlsH265PackagingTypeHvc1);
        }
        return @(AWSmedialiveHlsH265PackagingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsH265PackagingTypeHev1:
                return @"HEV1";
            case AWSmedialiveHlsH265PackagingTypeHvc1:
                return @"HVC1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hlsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveHlsSettings class]];
}

@end

@implementation AWSmedialiveHlsSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioOnlyHlsSettings" : @"AudioOnlyHlsSettings",
             @"fmp4HlsSettings" : @"Fmp4HlsSettings",
             @"standardHlsSettings" : @"StandardHlsSettings",
             };
}

+ (NSValueTransformer *)audioOnlyHlsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAudioOnlyHlsSettings class]];
}

+ (NSValueTransformer *)fmp4HlsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveFmp4HlsSettings class]];
}

+ (NSValueTransformer *)standardHlsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveStandardHlsSettings class]];
}

@end

@implementation AWSmedialiveHlsTimedMetadataScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"id3" : @"Id3",
             };
}

@end

@implementation AWSmedialiveHlsWebdavSettings

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
            return @(AWSmedialiveHlsWebdavHttpTransferModeChunked);
        }
        if ([value caseInsensitiveCompare:@"NON_CHUNKED"] == NSOrderedSame) {
            return @(AWSmedialiveHlsWebdavHttpTransferModeNonChunked);
        }
        return @(AWSmedialiveHlsWebdavHttpTransferModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveHlsWebdavHttpTransferModeChunked:
                return @"CHUNKED";
            case AWSmedialiveHlsWebdavHttpTransferModeNonChunked:
                return @"NON_CHUNKED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveImmediateModeScheduleActionStartSettings

@end

@implementation AWSmedialiveInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"attachedChannels" : @"AttachedChannels",
             @"destinations" : @"Destinations",
             @"identifier" : @"Id",
             @"inputClass" : @"InputClass",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputDestination class]];
}

+ (NSValueTransformer *)inputClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSmedialiveInputClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSmedialiveInputClassSinglePipeline);
        }
        return @(AWSmedialiveInputClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputClassStandard:
                return @"STANDARD";
            case AWSmedialiveInputClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputSourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSmedialiveInputSourceTypeStatic);
        }
        if ([value caseInsensitiveCompare:@"DYNAMIC"] == NSOrderedSame) {
            return @(AWSmedialiveInputSourceTypeDynamic);
        }
        return @(AWSmedialiveInputSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputSourceTypeStatic:
                return @"STATIC";
            case AWSmedialiveInputSourceTypeDynamic:
                return @"DYNAMIC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mediaConnectFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMediaConnectFlow class]];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputSource class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveInputStateCreating);
        }
        if ([value caseInsensitiveCompare:@"DETACHED"] == NSOrderedSame) {
            return @(AWSmedialiveInputStateDetached);
        }
        if ([value caseInsensitiveCompare:@"ATTACHED"] == NSOrderedSame) {
            return @(AWSmedialiveInputStateAttached);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveInputStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveInputStateDeleted);
        }
        return @(AWSmedialiveInputStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputStateCreating:
                return @"CREATING";
            case AWSmedialiveInputStateDetached:
                return @"DETACHED";
            case AWSmedialiveInputStateAttached:
                return @"ATTACHED";
            case AWSmedialiveInputStateDeleting:
                return @"DELETING";
            case AWSmedialiveInputStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UDP_PUSH"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeUdpPush);
        }
        if ([value caseInsensitiveCompare:@"RTP_PUSH"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeRtpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PUSH"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeRtmpPush);
        }
        if ([value caseInsensitiveCompare:@"RTMP_PULL"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeRtmpPull);
        }
        if ([value caseInsensitiveCompare:@"URL_PULL"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeUrlPull);
        }
        if ([value caseInsensitiveCompare:@"MP4_FILE"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeMp4File);
        }
        if ([value caseInsensitiveCompare:@"MEDIACONNECT"] == NSOrderedSame) {
            return @(AWSmedialiveInputTypeMediaconnect);
        }
        return @(AWSmedialiveInputTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputTypeUdpPush:
                return @"UDP_PUSH";
            case AWSmedialiveInputTypeRtpPush:
                return @"RTP_PUSH";
            case AWSmedialiveInputTypeRtmpPush:
                return @"RTMP_PUSH";
            case AWSmedialiveInputTypeRtmpPull:
                return @"RTMP_PULL";
            case AWSmedialiveInputTypeUrlPull:
                return @"URL_PULL";
            case AWSmedialiveInputTypeMp4File:
                return @"MP4_FILE";
            case AWSmedialiveInputTypeMediaconnect:
                return @"MEDIACONNECT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveInputAttachment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automaticInputFailoverSettings" : @"AutomaticInputFailoverSettings",
             @"inputAttachmentName" : @"InputAttachmentName",
             @"inputId" : @"InputId",
             @"inputSettings" : @"InputSettings",
             };
}

+ (NSValueTransformer *)automaticInputFailoverSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveAutomaticInputFailoverSettings class]];
}

+ (NSValueTransformer *)inputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSettings class]];
}

@end

@implementation AWSmedialiveInputChannelLevel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gain" : @"Gain",
             @"inputChannel" : @"InputChannel",
             };
}

@end

@implementation AWSmedialiveInputClippingSettings

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
            return @(AWSmedialiveInputTimecodeSourceZerobased);
        }
        if ([value caseInsensitiveCompare:@"EMBEDDED"] == NSOrderedSame) {
            return @(AWSmedialiveInputTimecodeSourceEmbedded);
        }
        return @(AWSmedialiveInputTimecodeSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputTimecodeSourceZerobased:
                return @"ZEROBASED";
            case AWSmedialiveInputTimecodeSourceEmbedded:
                return @"EMBEDDED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startTimecodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveStartTimecode class]];
}

+ (NSValueTransformer *)stopTimecodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveStopTimecode class]];
}

@end

@implementation AWSmedialiveInputDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ip" : @"Ip",
             @"port" : @"Port",
             @"url" : @"Url",
             @"vpc" : @"Vpc",
             };
}

+ (NSValueTransformer *)vpcJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputDestinationVpc class]];
}

@end

@implementation AWSmedialiveInputDestinationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSmedialiveInputDestinationVpc

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             };
}

@end

@implementation AWSmedialiveInputLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"passwordParam" : @"PasswordParam",
             @"uri" : @"Uri",
             @"username" : @"Username",
             };
}

@end

@implementation AWSmedialiveInputLossBehavior

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputLocation class]];
}

+ (NSValueTransformer *)inputLossImageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COLOR"] == NSOrderedSame) {
            return @(AWSmedialiveInputLossImageTypeColor);
        }
        if ([value caseInsensitiveCompare:@"SLATE"] == NSOrderedSame) {
            return @(AWSmedialiveInputLossImageTypeSlate);
        }
        return @(AWSmedialiveInputLossImageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputLossImageTypeColor:
                return @"COLOR";
            case AWSmedialiveInputLossImageTypeSlate:
                return @"SLATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveInputSecurityGroup

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
            return @(AWSmedialiveInputSecurityGroupStateIdle);
        }
        if ([value caseInsensitiveCompare:@"IN_USE"] == NSOrderedSame) {
            return @(AWSmedialiveInputSecurityGroupStateInUse);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSmedialiveInputSecurityGroupStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveInputSecurityGroupStateDeleted);
        }
        return @(AWSmedialiveInputSecurityGroupStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputSecurityGroupStateIdle:
                return @"IDLE";
            case AWSmedialiveInputSecurityGroupStateInUse:
                return @"IN_USE";
            case AWSmedialiveInputSecurityGroupStateUpdating:
                return @"UPDATING";
            case AWSmedialiveInputSecurityGroupStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)whitelistRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputWhitelistRule class]];
}

@end

@implementation AWSmedialiveInputSecurityGroupWhitelistRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             @"whitelistRules" : @"WhitelistRules",
             };
}

+ (NSValueTransformer *)whitelistRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputWhitelistRuleCidr class]];
}

@end

@implementation AWSmedialiveInputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioSelectors" : @"AudioSelectors",
             @"captionSelectors" : @"CaptionSelectors",
             @"deblockFilter" : @"DeblockFilter",
             @"denoiseFilter" : @"DenoiseFilter",
             @"filterStrength" : @"FilterStrength",
             @"inputFilter" : @"InputFilter",
             @"networkInputSettings" : @"NetworkInputSettings",
             @"sourceEndBehavior" : @"SourceEndBehavior",
             @"videoSelector" : @"VideoSelector",
             };
}

+ (NSValueTransformer *)audioSelectorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveAudioSelector class]];
}

+ (NSValueTransformer *)captionSelectorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveCaptionSelector class]];
}

+ (NSValueTransformer *)deblockFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveInputDeblockFilterDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveInputDeblockFilterEnabled);
        }
        return @(AWSmedialiveInputDeblockFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputDeblockFilterDisabled:
                return @"DISABLED";
            case AWSmedialiveInputDeblockFilterEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)denoiseFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveInputDenoiseFilterDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveInputDenoiseFilterEnabled);
        }
        return @(AWSmedialiveInputDenoiseFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputDenoiseFilterDisabled:
                return @"DISABLED";
            case AWSmedialiveInputDenoiseFilterEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputFilterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmedialiveInputFilterAuto);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveInputFilterDisabled);
        }
        if ([value caseInsensitiveCompare:@"FORCED"] == NSOrderedSame) {
            return @(AWSmedialiveInputFilterForced);
        }
        return @(AWSmedialiveInputFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputFilterAuto:
                return @"AUTO";
            case AWSmedialiveInputFilterDisabled:
                return @"DISABLED";
            case AWSmedialiveInputFilterForced:
                return @"FORCED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)networkInputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveNetworkInputSettings class]];
}

+ (NSValueTransformer *)sourceEndBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTINUE"] == NSOrderedSame) {
            return @(AWSmedialiveInputSourceEndBehaviorContinue);
        }
        if ([value caseInsensitiveCompare:@"LOOP"] == NSOrderedSame) {
            return @(AWSmedialiveInputSourceEndBehaviorLoop);
        }
        return @(AWSmedialiveInputSourceEndBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputSourceEndBehaviorContinue:
                return @"CONTINUE";
            case AWSmedialiveInputSourceEndBehaviorLoop:
                return @"LOOP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)videoSelectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveVideoSelector class]];
}

@end

@implementation AWSmedialiveInputSource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"passwordParam" : @"PasswordParam",
             @"url" : @"Url",
             @"username" : @"Username",
             };
}

@end

@implementation AWSmedialiveInputSourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"passwordParam" : @"PasswordParam",
             @"url" : @"Url",
             @"username" : @"Username",
             };
}

@end

@implementation AWSmedialiveInputSpecification

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
            return @(AWSmedialiveInputCodecMpeg2);
        }
        if ([value caseInsensitiveCompare:@"AVC"] == NSOrderedSame) {
            return @(AWSmedialiveInputCodecAvc);
        }
        if ([value caseInsensitiveCompare:@"HEVC"] == NSOrderedSame) {
            return @(AWSmedialiveInputCodecHevc);
        }
        return @(AWSmedialiveInputCodecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputCodecMpeg2:
                return @"MPEG2";
            case AWSmedialiveInputCodecAvc:
                return @"AVC";
            case AWSmedialiveInputCodecHevc:
                return @"HEVC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)maximumBitrateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_10_MBPS"] == NSOrderedSame) {
            return @(AWSmedialiveInputMaximumBitrateMax10Mbps);
        }
        if ([value caseInsensitiveCompare:@"MAX_20_MBPS"] == NSOrderedSame) {
            return @(AWSmedialiveInputMaximumBitrateMax20Mbps);
        }
        if ([value caseInsensitiveCompare:@"MAX_50_MBPS"] == NSOrderedSame) {
            return @(AWSmedialiveInputMaximumBitrateMax50Mbps);
        }
        return @(AWSmedialiveInputMaximumBitrateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputMaximumBitrateMax10Mbps:
                return @"MAX_10_MBPS";
            case AWSmedialiveInputMaximumBitrateMax20Mbps:
                return @"MAX_20_MBPS";
            case AWSmedialiveInputMaximumBitrateMax50Mbps:
                return @"MAX_50_MBPS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resolutionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SD"] == NSOrderedSame) {
            return @(AWSmedialiveInputResolutionSd);
        }
        if ([value caseInsensitiveCompare:@"HD"] == NSOrderedSame) {
            return @(AWSmedialiveInputResolutionHd);
        }
        if ([value caseInsensitiveCompare:@"UHD"] == NSOrderedSame) {
            return @(AWSmedialiveInputResolutionUhd);
        }
        return @(AWSmedialiveInputResolutionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputResolutionSd:
                return @"SD";
            case AWSmedialiveInputResolutionHd:
                return @"HD";
            case AWSmedialiveInputResolutionUhd:
                return @"UHD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveInputSwitchScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputAttachmentNameReference" : @"InputAttachmentNameReference",
             @"inputClippingSettings" : @"InputClippingSettings",
             @"urlPath" : @"UrlPath",
             };
}

+ (NSValueTransformer *)inputClippingSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputClippingSettings class]];
}

@end

@implementation AWSmedialiveInputVpcRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             };
}

@end

@implementation AWSmedialiveInputWhitelistRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidr" : @"Cidr",
             };
}

@end

@implementation AWSmedialiveInputWhitelistRuleCidr

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidr" : @"Cidr",
             };
}

@end

@implementation AWSmedialiveInternalServiceError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSmedialiveInvalidRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSmedialiveKeyProviderSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"staticKeySettings" : @"StaticKeySettings",
             };
}

+ (NSValueTransformer *)staticKeySettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveStaticKeySettings class]];
}

@end

@implementation AWSmedialiveLimitExceeded

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSmedialiveListChannelsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSmedialiveListChannelsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveChannelSummary class]];
}

@end

@implementation AWSmedialiveListChannelsResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveChannelSummary class]];
}

@end

@implementation AWSmedialiveListInputSecurityGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSmedialiveListInputSecurityGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputSecurityGroups" : @"InputSecurityGroups",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)inputSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputSecurityGroup class]];
}

@end

@implementation AWSmedialiveListInputSecurityGroupsResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputSecurityGroups" : @"InputSecurityGroups",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)inputSecurityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputSecurityGroup class]];
}

@end

@implementation AWSmedialiveListInputsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSmedialiveListInputsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputs" : @"Inputs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)inputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInput class]];
}

@end

@implementation AWSmedialiveListInputsResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputs" : @"Inputs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)inputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInput class]];
}

@end

@implementation AWSmedialiveListMultiplexProgramsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"multiplexId" : @"MultiplexId",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSmedialiveListMultiplexProgramsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexPrograms" : @"MultiplexPrograms",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)multiplexProgramsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMultiplexProgramSummary class]];
}

@end

@implementation AWSmedialiveListMultiplexProgramsResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexPrograms" : @"MultiplexPrograms",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)multiplexProgramsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMultiplexProgramSummary class]];
}

@end

@implementation AWSmedialiveListMultiplexesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSmedialiveListMultiplexesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexes" : @"Multiplexes",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)multiplexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMultiplexSummary class]];
}

@end

@implementation AWSmedialiveListMultiplexesResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexes" : @"Multiplexes",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)multiplexesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMultiplexSummary class]];
}

@end

@implementation AWSmedialiveListOfferingsRequest

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

@implementation AWSmedialiveListOfferingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"offerings" : @"Offerings",
             };
}

+ (NSValueTransformer *)offeringsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOffering class]];
}

@end

@implementation AWSmedialiveListOfferingsResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"offerings" : @"Offerings",
             };
}

+ (NSValueTransformer *)offeringsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOffering class]];
}

@end

@implementation AWSmedialiveListReservationsRequest

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

@implementation AWSmedialiveListReservationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"reservations" : @"Reservations",
             };
}

+ (NSValueTransformer *)reservationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveReservation class]];
}

@end

@implementation AWSmedialiveListReservationsResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"reservations" : @"Reservations",
             };
}

+ (NSValueTransformer *)reservationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveReservation class]];
}

@end

@implementation AWSmedialiveListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSmedialiveListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmedialiveM2tsSettings

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
            return @(AWSmedialiveM2tsAbsentInputAudioBehaviorDrop);
        }
        if ([value caseInsensitiveCompare:@"ENCODE_SILENCE"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsAbsentInputAudioBehaviorEncodeSilence);
        }
        return @(AWSmedialiveM2tsAbsentInputAudioBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsAbsentInputAudioBehaviorDrop:
                return @"DROP";
            case AWSmedialiveM2tsAbsentInputAudioBehaviorEncodeSilence:
                return @"ENCODE_SILENCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)aribJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsAribDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsAribEnabled);
        }
        return @(AWSmedialiveM2tsAribUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsAribDisabled:
                return @"DISABLED";
            case AWSmedialiveM2tsAribEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)aribCaptionsPidControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsAribCaptionsPidControlAuto);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsAribCaptionsPidControlUseConfigured);
        }
        return @(AWSmedialiveM2tsAribCaptionsPidControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsAribCaptionsPidControlAuto:
                return @"AUTO";
            case AWSmedialiveM2tsAribCaptionsPidControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)audioBufferModelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ATSC"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsAudioBufferModelAtsc);
        }
        if ([value caseInsensitiveCompare:@"DVB"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsAudioBufferModelDvb);
        }
        return @(AWSmedialiveM2tsAudioBufferModelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsAudioBufferModelAtsc:
                return @"ATSC";
            case AWSmedialiveM2tsAudioBufferModelDvb:
                return @"DVB";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)audioStreamTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ATSC"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsAudioStreamTypeAtsc);
        }
        if ([value caseInsensitiveCompare:@"DVB"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsAudioStreamTypeDvb);
        }
        return @(AWSmedialiveM2tsAudioStreamTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsAudioStreamTypeAtsc:
                return @"ATSC";
            case AWSmedialiveM2tsAudioStreamTypeDvb:
                return @"DVB";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bufferModelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MULTIPLEX"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsBufferModelMultiplex);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsBufferModelNone);
        }
        return @(AWSmedialiveM2tsBufferModelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsBufferModelMultiplex:
                return @"MULTIPLEX";
            case AWSmedialiveM2tsBufferModelNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ccDescriptorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsCcDescriptorDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsCcDescriptorEnabled);
        }
        return @(AWSmedialiveM2tsCcDescriptorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsCcDescriptorDisabled:
                return @"DISABLED";
            case AWSmedialiveM2tsCcDescriptorEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)dvbNitSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveDvbNitSettings class]];
}

+ (NSValueTransformer *)dvbSdtSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveDvbSdtSettings class]];
}

+ (NSValueTransformer *)dvbTdtSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveDvbTdtSettings class]];
}

+ (NSValueTransformer *)ebifJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsEbifControlNone);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsEbifControlPassthrough);
        }
        return @(AWSmedialiveM2tsEbifControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsEbifControlNone:
                return @"NONE";
            case AWSmedialiveM2tsEbifControlPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ebpAudioIntervalJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VIDEO_AND_FIXED_INTERVALS"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsAudioIntervalVideoAndFixedIntervals);
        }
        if ([value caseInsensitiveCompare:@"VIDEO_INTERVAL"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsAudioIntervalVideoInterval);
        }
        return @(AWSmedialiveM2tsAudioIntervalUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsAudioIntervalVideoAndFixedIntervals:
                return @"VIDEO_AND_FIXED_INTERVALS";
            case AWSmedialiveM2tsAudioIntervalVideoInterval:
                return @"VIDEO_INTERVAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ebpPlacementJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VIDEO_AND_AUDIO_PIDS"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsEbpPlacementVideoAndAudioPids);
        }
        if ([value caseInsensitiveCompare:@"VIDEO_PID"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsEbpPlacementVideoPid);
        }
        return @(AWSmedialiveM2tsEbpPlacementUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsEbpPlacementVideoAndAudioPids:
                return @"VIDEO_AND_AUDIO_PIDS";
            case AWSmedialiveM2tsEbpPlacementVideoPid:
                return @"VIDEO_PID";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)esRateInPesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXCLUDE"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsEsRateInPesExclude);
        }
        if ([value caseInsensitiveCompare:@"INCLUDE"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsEsRateInPesInclude);
        }
        return @(AWSmedialiveM2tsEsRateInPesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsEsRateInPesExclude:
                return @"EXCLUDE";
            case AWSmedialiveM2tsEsRateInPesInclude:
                return @"INCLUDE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)klvJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsKlvNone);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsKlvPassthrough);
        }
        return @(AWSmedialiveM2tsKlvUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsKlvNone:
                return @"NONE";
            case AWSmedialiveM2tsKlvPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nielsenId3BehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsNielsenId3BehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsNielsenId3BehaviorPassthrough);
        }
        return @(AWSmedialiveM2tsNielsenId3BehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsNielsenId3BehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSmedialiveM2tsNielsenId3BehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pcrControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONFIGURED_PCR_PERIOD"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsPcrControlConfiguredPcrPeriod);
        }
        if ([value caseInsensitiveCompare:@"PCR_EVERY_PES_PACKET"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsPcrControlPcrEveryPesPacket);
        }
        return @(AWSmedialiveM2tsPcrControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsPcrControlConfiguredPcrPeriod:
                return @"CONFIGURED_PCR_PERIOD";
            case AWSmedialiveM2tsPcrControlPcrEveryPesPacket:
                return @"PCR_EVERY_PES_PACKET";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rateModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CBR"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsRateModeCbr);
        }
        if ([value caseInsensitiveCompare:@"VBR"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsRateModeVbr);
        }
        return @(AWSmedialiveM2tsRateModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsRateModeCbr:
                return @"CBR";
            case AWSmedialiveM2tsRateModeVbr:
                return @"VBR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35ControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsScte35ControlNone);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsScte35ControlPassthrough);
        }
        return @(AWSmedialiveM2tsScte35ControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsScte35ControlNone:
                return @"NONE";
            case AWSmedialiveM2tsScte35ControlPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentationMarkersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EBP"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsSegmentationMarkersEbp);
        }
        if ([value caseInsensitiveCompare:@"EBP_LEGACY"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsSegmentationMarkersEbpLegacy);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsSegmentationMarkersNone);
        }
        if ([value caseInsensitiveCompare:@"PSI_SEGSTART"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsSegmentationMarkersPsiSegstart);
        }
        if ([value caseInsensitiveCompare:@"RAI_ADAPT"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsSegmentationMarkersRaiAdapt);
        }
        if ([value caseInsensitiveCompare:@"RAI_SEGSTART"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsSegmentationMarkersRaiSegstart);
        }
        return @(AWSmedialiveM2tsSegmentationMarkersUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsSegmentationMarkersEbp:
                return @"EBP";
            case AWSmedialiveM2tsSegmentationMarkersEbpLegacy:
                return @"EBP_LEGACY";
            case AWSmedialiveM2tsSegmentationMarkersNone:
                return @"NONE";
            case AWSmedialiveM2tsSegmentationMarkersPsiSegstart:
                return @"PSI_SEGSTART";
            case AWSmedialiveM2tsSegmentationMarkersRaiAdapt:
                return @"RAI_ADAPT";
            case AWSmedialiveM2tsSegmentationMarkersRaiSegstart:
                return @"RAI_SEGSTART";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentationStyleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAINTAIN_CADENCE"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsSegmentationStyleMaintainCadence);
        }
        if ([value caseInsensitiveCompare:@"RESET_CADENCE"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsSegmentationStyleResetCadence);
        }
        return @(AWSmedialiveM2tsSegmentationStyleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsSegmentationStyleMaintainCadence:
                return @"MAINTAIN_CADENCE";
            case AWSmedialiveM2tsSegmentationStyleResetCadence:
                return @"RESET_CADENCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsTimedMetadataBehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveM2tsTimedMetadataBehaviorPassthrough);
        }
        return @(AWSmedialiveM2tsTimedMetadataBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM2tsTimedMetadataBehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSmedialiveM2tsTimedMetadataBehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveM3u8Settings

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
            return @(AWSmedialiveM3u8NielsenId3BehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveM3u8NielsenId3BehaviorPassthrough);
        }
        return @(AWSmedialiveM3u8NielsenId3BehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM3u8NielsenId3BehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSmedialiveM3u8NielsenId3BehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pcrControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONFIGURED_PCR_PERIOD"] == NSOrderedSame) {
            return @(AWSmedialiveM3u8PcrControlConfiguredPcrPeriod);
        }
        if ([value caseInsensitiveCompare:@"PCR_EVERY_PES_PACKET"] == NSOrderedSame) {
            return @(AWSmedialiveM3u8PcrControlPcrEveryPesPacket);
        }
        return @(AWSmedialiveM3u8PcrControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM3u8PcrControlConfiguredPcrPeriod:
                return @"CONFIGURED_PCR_PERIOD";
            case AWSmedialiveM3u8PcrControlPcrEveryPesPacket:
                return @"PCR_EVERY_PES_PACKET";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scte35BehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveM3u8Scte35BehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveM3u8Scte35BehaviorPassthrough);
        }
        return @(AWSmedialiveM3u8Scte35BehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM3u8Scte35BehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSmedialiveM3u8Scte35BehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveM3u8TimedMetadataBehaviorNoPassthrough);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveM3u8TimedMetadataBehaviorPassthrough);
        }
        return @(AWSmedialiveM3u8TimedMetadataBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveM3u8TimedMetadataBehaviorNoPassthrough:
                return @"NO_PASSTHROUGH";
            case AWSmedialiveM3u8TimedMetadataBehaviorPassthrough:
                return @"PASSTHROUGH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveMediaConnectFlow

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowArn" : @"FlowArn",
             };
}

@end

@implementation AWSmedialiveMediaConnectFlowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowArn" : @"FlowArn",
             };
}

@end

@implementation AWSmedialiveMediaPackageGroupSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveOutputLocationRef class]];
}

@end

@implementation AWSmedialiveMediaPackageOutputDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             };
}

@end

@implementation AWSmedialiveMediaPackageOutputSettings

@end

@implementation AWSmedialiveMp2Settings

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
            return @(AWSmedialiveMp2CodingModeCodingMode10);
        }
        if ([value caseInsensitiveCompare:@"CODING_MODE_2_0"] == NSOrderedSame) {
            return @(AWSmedialiveMp2CodingModeCodingMode20);
        }
        return @(AWSmedialiveMp2CodingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveMp2CodingModeCodingMode10:
                return @"CODING_MODE_1_0";
            case AWSmedialiveMp2CodingModeCodingMode20:
                return @"CODING_MODE_2_0";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveMsSmoothGroupSettings

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
            return @(AWSmedialiveSmoothGroupAudioOnlyTimecodeControlPassthrough);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED_CLOCK"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupAudioOnlyTimecodeControlUseConfiguredClock);
        }
        return @(AWSmedialiveSmoothGroupAudioOnlyTimecodeControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveSmoothGroupAudioOnlyTimecodeControlPassthrough:
                return @"PASSTHROUGH";
            case AWSmedialiveSmoothGroupAudioOnlyTimecodeControlUseConfiguredClock:
                return @"USE_CONFIGURED_CLOCK";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)certificateModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SELF_SIGNED"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupCertificateModeSelfSigned);
        }
        if ([value caseInsensitiveCompare:@"VERIFY_AUTHENTICITY"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupCertificateModeVerifyAuthenticity);
        }
        return @(AWSmedialiveSmoothGroupCertificateModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveSmoothGroupCertificateModeSelfSigned:
                return @"SELF_SIGNED";
            case AWSmedialiveSmoothGroupCertificateModeVerifyAuthenticity:
                return @"VERIFY_AUTHENTICITY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveOutputLocationRef class]];
}

+ (NSValueTransformer *)eventIdModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_EVENT_ID"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupEventIdModeNoEventId);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupEventIdModeUseConfigured);
        }
        if ([value caseInsensitiveCompare:@"USE_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupEventIdModeUseTimestamp);
        }
        return @(AWSmedialiveSmoothGroupEventIdModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveSmoothGroupEventIdModeNoEventId:
                return @"NO_EVENT_ID";
            case AWSmedialiveSmoothGroupEventIdModeUseConfigured:
                return @"USE_CONFIGURED";
            case AWSmedialiveSmoothGroupEventIdModeUseTimestamp:
                return @"USE_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)eventStopBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupEventStopBehaviorNone);
        }
        if ([value caseInsensitiveCompare:@"SEND_EOS"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupEventStopBehaviorSendEos);
        }
        return @(AWSmedialiveSmoothGroupEventStopBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveSmoothGroupEventStopBehaviorNone:
                return @"NONE";
            case AWSmedialiveSmoothGroupEventStopBehaviorSendEos:
                return @"SEND_EOS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputLossActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMIT_OUTPUT"] == NSOrderedSame) {
            return @(AWSmedialiveInputLossActionForMsSmoothOutEmitOutput);
        }
        if ([value caseInsensitiveCompare:@"PAUSE_OUTPUT"] == NSOrderedSame) {
            return @(AWSmedialiveInputLossActionForMsSmoothOutPauseOutput);
        }
        return @(AWSmedialiveInputLossActionForMsSmoothOutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputLossActionForMsSmoothOutEmitOutput:
                return @"EMIT_OUTPUT";
            case AWSmedialiveInputLossActionForMsSmoothOutPauseOutput:
                return @"PAUSE_OUTPUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)segmentationModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USE_INPUT_SEGMENTATION"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupSegmentationModeUseInputSegmentation);
        }
        if ([value caseInsensitiveCompare:@"USE_SEGMENT_DURATION"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupSegmentationModeUseSegmentDuration);
        }
        return @(AWSmedialiveSmoothGroupSegmentationModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveSmoothGroupSegmentationModeUseInputSegmentation:
                return @"USE_INPUT_SEGMENTATION";
            case AWSmedialiveSmoothGroupSegmentationModeUseSegmentDuration:
                return @"USE_SEGMENT_DURATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sparseTrackTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupSparseTrackTypeNone);
        }
        if ([value caseInsensitiveCompare:@"SCTE_35"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupSparseTrackTypeScte35);
        }
        if ([value caseInsensitiveCompare:@"SCTE_35_WITHOUT_SEGMENTATION"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupSparseTrackTypeScte35WithoutSegmentation);
        }
        return @(AWSmedialiveSmoothGroupSparseTrackTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveSmoothGroupSparseTrackTypeNone:
                return @"NONE";
            case AWSmedialiveSmoothGroupSparseTrackTypeScte35:
                return @"SCTE_35";
            case AWSmedialiveSmoothGroupSparseTrackTypeScte35WithoutSegmentation:
                return @"SCTE_35_WITHOUT_SEGMENTATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)streamManifestBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DO_NOT_SEND"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupStreamManifestBehaviorDoNotSend);
        }
        if ([value caseInsensitiveCompare:@"SEND"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupStreamManifestBehaviorSend);
        }
        return @(AWSmedialiveSmoothGroupStreamManifestBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveSmoothGroupStreamManifestBehaviorDoNotSend:
                return @"DO_NOT_SEND";
            case AWSmedialiveSmoothGroupStreamManifestBehaviorSend:
                return @"SEND";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampOffsetModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED_OFFSET"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupTimestampOffsetModeUseConfiguredOffset);
        }
        if ([value caseInsensitiveCompare:@"USE_EVENT_START_DATE"] == NSOrderedSame) {
            return @(AWSmedialiveSmoothGroupTimestampOffsetModeUseEventStartDate);
        }
        return @(AWSmedialiveSmoothGroupTimestampOffsetModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveSmoothGroupTimestampOffsetModeUseConfiguredOffset:
                return @"USE_CONFIGURED_OFFSET";
            case AWSmedialiveSmoothGroupTimestampOffsetModeUseEventStartDate:
                return @"USE_EVENT_START_DATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveMsSmoothOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"h265PackagingType" : @"H265PackagingType",
             @"nameModifier" : @"NameModifier",
             };
}

+ (NSValueTransformer *)h265PackagingTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HEV1"] == NSOrderedSame) {
            return @(AWSmedialiveMsSmoothH265PackagingTypeHev1);
        }
        if ([value caseInsensitiveCompare:@"HVC1"] == NSOrderedSame) {
            return @(AWSmedialiveMsSmoothH265PackagingTypeHvc1);
        }
        return @(AWSmedialiveMsSmoothH265PackagingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveMsSmoothH265PackagingTypeHev1:
                return @"HEV1";
            case AWSmedialiveMsSmoothH265PackagingTypeHvc1:
                return @"HVC1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveMultiplex

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMultiplexOutputDestination class]];
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexSettings class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateDeleted);
        }
        return @(AWSmedialiveMultiplexStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveMultiplexStateCreating:
                return @"CREATING";
            case AWSmedialiveMultiplexStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSmedialiveMultiplexStateIdle:
                return @"IDLE";
            case AWSmedialiveMultiplexStateStarting:
                return @"STARTING";
            case AWSmedialiveMultiplexStateRunning:
                return @"RUNNING";
            case AWSmedialiveMultiplexStateRecovering:
                return @"RECOVERING";
            case AWSmedialiveMultiplexStateStopping:
                return @"STOPPING";
            case AWSmedialiveMultiplexStateDeleting:
                return @"DELETING";
            case AWSmedialiveMultiplexStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveMultiplexConfigurationValidationError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"validationErrors" : @"ValidationErrors",
             };
}

+ (NSValueTransformer *)validationErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMultiplexValidationError class]];
}

@end

@implementation AWSmedialiveMultiplexGroupSettings

@end

@implementation AWSmedialiveMultiplexMediaConnectOutputDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entitlementArn" : @"EntitlementArn",
             };
}

@end

@implementation AWSmedialiveMultiplexOutputDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mediaConnectSettings" : @"MediaConnectSettings",
             };
}

+ (NSValueTransformer *)mediaConnectSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexMediaConnectOutputDestinationSettings class]];
}

@end

@implementation AWSmedialiveMultiplexOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destination" : @"Destination",
             };
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveOutputLocationRef class]];
}

@end

@implementation AWSmedialiveMultiplexProgram

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             @"packetIdentifiersMap" : @"PacketIdentifiersMap",
             @"programName" : @"ProgramName",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgramSettings class]];
}

+ (NSValueTransformer *)packetIdentifiersMapJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgramPacketIdentifiersMap class]];
}

@end

@implementation AWSmedialiveMultiplexProgramChannelDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             @"programName" : @"ProgramName",
             };
}

@end

@implementation AWSmedialiveMultiplexProgramPacketIdentifiersMap

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

@implementation AWSmedialiveMultiplexProgramServiceDescriptor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"providerName" : @"ProviderName",
             @"serviceName" : @"ServiceName",
             };
}

@end

@implementation AWSmedialiveMultiplexProgramSettings

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
            return @(AWSmedialivePreferredChannelPipelineCurrentlyActive);
        }
        if ([value caseInsensitiveCompare:@"PIPELINE_0"] == NSOrderedSame) {
            return @(AWSmedialivePreferredChannelPipelinePipeline0);
        }
        if ([value caseInsensitiveCompare:@"PIPELINE_1"] == NSOrderedSame) {
            return @(AWSmedialivePreferredChannelPipelinePipeline1);
        }
        return @(AWSmedialivePreferredChannelPipelineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialivePreferredChannelPipelineCurrentlyActive:
                return @"CURRENTLY_ACTIVE";
            case AWSmedialivePreferredChannelPipelinePipeline0:
                return @"PIPELINE_0";
            case AWSmedialivePreferredChannelPipelinePipeline1:
                return @"PIPELINE_1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)serviceDescriptorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgramServiceDescriptor class]];
}

+ (NSValueTransformer *)videoSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexVideoSettings class]];
}

@end

@implementation AWSmedialiveMultiplexProgramSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             @"programName" : @"ProgramName",
             };
}

@end

@implementation AWSmedialiveMultiplexSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximumVideoBufferDelayMilliseconds" : @"MaximumVideoBufferDelayMilliseconds",
             @"transportStreamBitrate" : @"TransportStreamBitrate",
             @"transportStreamId" : @"TransportStreamId",
             @"transportStreamReservedBitrate" : @"TransportStreamReservedBitrate",
             };
}

@end

@implementation AWSmedialiveMultiplexSettingsSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transportStreamBitrate" : @"TransportStreamBitrate",
             };
}

@end

@implementation AWSmedialiveMultiplexStatmuxVideoSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximumBitrate" : @"MaximumBitrate",
             @"minimumBitrate" : @"MinimumBitrate",
             };
}

@end

@implementation AWSmedialiveMultiplexSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexSettingsSummary class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateDeleted);
        }
        return @(AWSmedialiveMultiplexStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveMultiplexStateCreating:
                return @"CREATING";
            case AWSmedialiveMultiplexStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSmedialiveMultiplexStateIdle:
                return @"IDLE";
            case AWSmedialiveMultiplexStateStarting:
                return @"STARTING";
            case AWSmedialiveMultiplexStateRunning:
                return @"RUNNING";
            case AWSmedialiveMultiplexStateRecovering:
                return @"RECOVERING";
            case AWSmedialiveMultiplexStateStopping:
                return @"STOPPING";
            case AWSmedialiveMultiplexStateDeleting:
                return @"DELETING";
            case AWSmedialiveMultiplexStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveMultiplexValidationError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"elementPath" : @"ElementPath",
             @"errorMessage" : @"ErrorMessage",
             };
}

@end

@implementation AWSmedialiveMultiplexVideoSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constantBitrate" : @"ConstantBitrate",
             @"statmuxSettings" : @"StatmuxSettings",
             };
}

+ (NSValueTransformer *)statmuxSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexStatmuxVideoSettings class]];
}

@end

@implementation AWSmedialiveNetworkInputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hlsInputSettings" : @"HlsInputSettings",
             @"serverValidation" : @"ServerValidation",
             };
}

+ (NSValueTransformer *)hlsInputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveHlsInputSettings class]];
}

+ (NSValueTransformer *)serverValidationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHECK_CRYPTOGRAPHY_AND_VALIDATE_NAME"] == NSOrderedSame) {
            return @(AWSmedialiveNetworkInputServerValidationCheckCryptographyAndValidateName);
        }
        if ([value caseInsensitiveCompare:@"CHECK_CRYPTOGRAPHY_ONLY"] == NSOrderedSame) {
            return @(AWSmedialiveNetworkInputServerValidationCheckCryptographyOnly);
        }
        return @(AWSmedialiveNetworkInputServerValidationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveNetworkInputServerValidationCheckCryptographyAndValidateName:
                return @"CHECK_CRYPTOGRAPHY_AND_VALIDATE_NAME";
            case AWSmedialiveNetworkInputServerValidationCheckCryptographyOnly:
                return @"CHECK_CRYPTOGRAPHY_ONLY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveNielsenConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributorId" : @"DistributorId",
             @"nielsenPcmToId3Tagging" : @"NielsenPcmToId3Tagging",
             };
}

+ (NSValueTransformer *)nielsenPcmToId3TaggingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveNielsenPcmToId3TaggingStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveNielsenPcmToId3TaggingStateEnabled);
        }
        return @(AWSmedialiveNielsenPcmToId3TaggingStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveNielsenPcmToId3TaggingStateDisabled:
                return @"DISABLED";
            case AWSmedialiveNielsenPcmToId3TaggingStateEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveOffering

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
            return @(AWSmedialiveOfferingDurationUnitsMonths);
        }
        return @(AWSmedialiveOfferingDurationUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveOfferingDurationUnitsMonths:
                return @"MONTHS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSmedialiveOfferingTypeNoUpfront);
        }
        return @(AWSmedialiveOfferingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveOfferingTypeNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveReservationResourceSpecification class]];
}

@end

@implementation AWSmedialiveOutput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveOutputSettings class]];
}

@end

@implementation AWSmedialiveOutputDestination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"mediaPackageSettings" : @"MediaPackageSettings",
             @"multiplexSettings" : @"MultiplexSettings",
             @"settings" : @"Settings",
             };
}

+ (NSValueTransformer *)mediaPackageSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMediaPackageOutputDestinationSettings class]];
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgramChannelDestinationSettings class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputDestinationSettings class]];
}

@end

@implementation AWSmedialiveOutputDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"passwordParam" : @"PasswordParam",
             @"streamName" : @"StreamName",
             @"url" : @"Url",
             @"username" : @"Username",
             };
}

@end

@implementation AWSmedialiveOutputGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"outputGroupSettings" : @"OutputGroupSettings",
             @"outputs" : @"Outputs",
             };
}

+ (NSValueTransformer *)outputGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveOutputGroupSettings class]];
}

+ (NSValueTransformer *)outputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutput class]];
}

@end

@implementation AWSmedialiveOutputGroupSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveArchiveGroupSettings class]];
}

+ (NSValueTransformer *)frameCaptureGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveFrameCaptureGroupSettings class]];
}

+ (NSValueTransformer *)hlsGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveHlsGroupSettings class]];
}

+ (NSValueTransformer *)mediaPackageGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMediaPackageGroupSettings class]];
}

+ (NSValueTransformer *)msSmoothGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMsSmoothGroupSettings class]];
}

+ (NSValueTransformer *)multiplexGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexGroupSettings class]];
}

+ (NSValueTransformer *)rtmpGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveRtmpGroupSettings class]];
}

+ (NSValueTransformer *)udpGroupSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveUdpGroupSettings class]];
}

@end

@implementation AWSmedialiveOutputLocationRef

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationRefId" : @"DestinationRefId",
             };
}

@end

@implementation AWSmedialiveOutputSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveArchiveOutputSettings class]];
}

+ (NSValueTransformer *)frameCaptureOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveFrameCaptureOutputSettings class]];
}

+ (NSValueTransformer *)hlsOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveHlsOutputSettings class]];
}

+ (NSValueTransformer *)mediaPackageOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMediaPackageOutputSettings class]];
}

+ (NSValueTransformer *)msSmoothOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMsSmoothOutputSettings class]];
}

+ (NSValueTransformer *)multiplexOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexOutputSettings class]];
}

+ (NSValueTransformer *)rtmpOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveRtmpOutputSettings class]];
}

+ (NSValueTransformer *)udpOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveUdpOutputSettings class]];
}

@end

@implementation AWSmedialivePassThroughSettings

@end

@implementation AWSmedialivePauseStateScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pipelines" : @"Pipelines",
             };
}

+ (NSValueTransformer *)pipelinesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialivePipelinePauseStateSettings class]];
}

@end

@implementation AWSmedialivePipelineDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeInputAttachmentName" : @"ActiveInputAttachmentName",
             @"activeInputSwitchActionName" : @"ActiveInputSwitchActionName",
             @"pipelineId" : @"PipelineId",
             };
}

@end

@implementation AWSmedialivePipelinePauseStateSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pipelineId" : @"PipelineId",
             };
}

+ (NSValueTransformer *)pipelineIdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PIPELINE_0"] == NSOrderedSame) {
            return @(AWSmedialivePipelineIdPipeline0);
        }
        if ([value caseInsensitiveCompare:@"PIPELINE_1"] == NSOrderedSame) {
            return @(AWSmedialivePipelineIdPipeline1);
        }
        return @(AWSmedialivePipelineIdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialivePipelineIdPipeline0:
                return @"PIPELINE_0";
            case AWSmedialivePipelineIdPipeline1:
                return @"PIPELINE_1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialivePurchaseOffering

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

@implementation AWSmedialivePurchaseOfferingRequest

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

@implementation AWSmedialivePurchaseOfferingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservation" : @"Reservation",
             };
}

+ (NSValueTransformer *)reservationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveReservation class]];
}

@end

@implementation AWSmedialivePurchaseOfferingResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservation" : @"Reservation",
             };
}

+ (NSValueTransformer *)reservationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveReservation class]];
}

@end

@implementation AWSmedialiveRec601Settings

@end

@implementation AWSmedialiveRec709Settings

@end

@implementation AWSmedialiveRemixSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelMappings" : @"ChannelMappings",
             @"channelsIn" : @"ChannelsIn",
             @"channelsOut" : @"ChannelsOut",
             };
}

+ (NSValueTransformer *)channelMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveAudioChannelMapping class]];
}

@end

@implementation AWSmedialiveReservation

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
            return @(AWSmedialiveOfferingDurationUnitsMonths);
        }
        return @(AWSmedialiveOfferingDurationUnitsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveOfferingDurationUnitsMonths:
                return @"MONTHS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NO_UPFRONT"] == NSOrderedSame) {
            return @(AWSmedialiveOfferingTypeNoUpfront);
        }
        return @(AWSmedialiveOfferingTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveOfferingTypeNoUpfront:
                return @"NO_UPFRONT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveReservationResourceSpecification class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSmedialiveReservationStateActive);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSmedialiveReservationStateExpired);
        }
        if ([value caseInsensitiveCompare:@"CANCELED"] == NSOrderedSame) {
            return @(AWSmedialiveReservationStateCanceled);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveReservationStateDeleted);
        }
        return @(AWSmedialiveReservationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveReservationStateActive:
                return @"ACTIVE";
            case AWSmedialiveReservationStateExpired:
                return @"EXPIRED";
            case AWSmedialiveReservationStateCanceled:
                return @"CANCELED";
            case AWSmedialiveReservationStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveReservationResourceSpecification

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
            return @(AWSmedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelClassSinglePipeline);
        }
        return @(AWSmedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSmedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)codecJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MPEG2"] == NSOrderedSame) {
            return @(AWSmedialiveReservationCodecMpeg2);
        }
        if ([value caseInsensitiveCompare:@"AVC"] == NSOrderedSame) {
            return @(AWSmedialiveReservationCodecAvc);
        }
        if ([value caseInsensitiveCompare:@"HEVC"] == NSOrderedSame) {
            return @(AWSmedialiveReservationCodecHevc);
        }
        if ([value caseInsensitiveCompare:@"AUDIO"] == NSOrderedSame) {
            return @(AWSmedialiveReservationCodecAudio);
        }
        return @(AWSmedialiveReservationCodecUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveReservationCodecMpeg2:
                return @"MPEG2";
            case AWSmedialiveReservationCodecAvc:
                return @"AVC";
            case AWSmedialiveReservationCodecHevc:
                return @"HEVC";
            case AWSmedialiveReservationCodecAudio:
                return @"AUDIO";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)maximumBitrateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_10_MBPS"] == NSOrderedSame) {
            return @(AWSmedialiveReservationMaximumBitrateMax10Mbps);
        }
        if ([value caseInsensitiveCompare:@"MAX_20_MBPS"] == NSOrderedSame) {
            return @(AWSmedialiveReservationMaximumBitrateMax20Mbps);
        }
        if ([value caseInsensitiveCompare:@"MAX_50_MBPS"] == NSOrderedSame) {
            return @(AWSmedialiveReservationMaximumBitrateMax50Mbps);
        }
        return @(AWSmedialiveReservationMaximumBitrateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveReservationMaximumBitrateMax10Mbps:
                return @"MAX_10_MBPS";
            case AWSmedialiveReservationMaximumBitrateMax20Mbps:
                return @"MAX_20_MBPS";
            case AWSmedialiveReservationMaximumBitrateMax50Mbps:
                return @"MAX_50_MBPS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)maximumFramerateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MAX_30_FPS"] == NSOrderedSame) {
            return @(AWSmedialiveReservationMaximumFramerateMax30Fps);
        }
        if ([value caseInsensitiveCompare:@"MAX_60_FPS"] == NSOrderedSame) {
            return @(AWSmedialiveReservationMaximumFramerateMax60Fps);
        }
        return @(AWSmedialiveReservationMaximumFramerateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveReservationMaximumFramerateMax30Fps:
                return @"MAX_30_FPS";
            case AWSmedialiveReservationMaximumFramerateMax60Fps:
                return @"MAX_60_FPS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resolutionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SD"] == NSOrderedSame) {
            return @(AWSmedialiveReservationResolutionSd);
        }
        if ([value caseInsensitiveCompare:@"HD"] == NSOrderedSame) {
            return @(AWSmedialiveReservationResolutionHd);
        }
        if ([value caseInsensitiveCompare:@"FHD"] == NSOrderedSame) {
            return @(AWSmedialiveReservationResolutionFhd);
        }
        if ([value caseInsensitiveCompare:@"UHD"] == NSOrderedSame) {
            return @(AWSmedialiveReservationResolutionUhd);
        }
        return @(AWSmedialiveReservationResolutionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveReservationResolutionSd:
                return @"SD";
            case AWSmedialiveReservationResolutionHd:
                return @"HD";
            case AWSmedialiveReservationResolutionFhd:
                return @"FHD";
            case AWSmedialiveReservationResolutionUhd:
                return @"UHD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INPUT"] == NSOrderedSame) {
            return @(AWSmedialiveReservationResourceTypeInput);
        }
        if ([value caseInsensitiveCompare:@"OUTPUT"] == NSOrderedSame) {
            return @(AWSmedialiveReservationResourceTypeOutput);
        }
        if ([value caseInsensitiveCompare:@"MULTIPLEX"] == NSOrderedSame) {
            return @(AWSmedialiveReservationResourceTypeMultiplex);
        }
        if ([value caseInsensitiveCompare:@"CHANNEL"] == NSOrderedSame) {
            return @(AWSmedialiveReservationResourceTypeChannel);
        }
        return @(AWSmedialiveReservationResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveReservationResourceTypeInput:
                return @"INPUT";
            case AWSmedialiveReservationResourceTypeOutput:
                return @"OUTPUT";
            case AWSmedialiveReservationResourceTypeMultiplex:
                return @"MULTIPLEX";
            case AWSmedialiveReservationResourceTypeChannel:
                return @"CHANNEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)specialFeatureJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADVANCED_AUDIO"] == NSOrderedSame) {
            return @(AWSmedialiveReservationSpecialFeatureAdvancedAudio);
        }
        if ([value caseInsensitiveCompare:@"AUDIO_NORMALIZATION"] == NSOrderedSame) {
            return @(AWSmedialiveReservationSpecialFeatureAudioNormalization);
        }
        return @(AWSmedialiveReservationSpecialFeatureUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveReservationSpecialFeatureAdvancedAudio:
                return @"ADVANCED_AUDIO";
            case AWSmedialiveReservationSpecialFeatureAudioNormalization:
                return @"AUDIO_NORMALIZATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)videoQualityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSmedialiveReservationVideoQualityStandard);
        }
        if ([value caseInsensitiveCompare:@"ENHANCED"] == NSOrderedSame) {
            return @(AWSmedialiveReservationVideoQualityEnhanced);
        }
        if ([value caseInsensitiveCompare:@"PREMIUM"] == NSOrderedSame) {
            return @(AWSmedialiveReservationVideoQualityPremium);
        }
        return @(AWSmedialiveReservationVideoQualityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveReservationVideoQualityStandard:
                return @"STANDARD";
            case AWSmedialiveReservationVideoQualityEnhanced:
                return @"ENHANCED";
            case AWSmedialiveReservationVideoQualityPremium:
                return @"PREMIUM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveResourceConflict

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSmedialiveResourceNotFound

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSmedialiveRtmpCaptionInfoDestinationSettings

@end

@implementation AWSmedialiveRtmpGroupSettings

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
            return @(AWSmedialiveAuthenticationSchemeAkamai);
        }
        if ([value caseInsensitiveCompare:@"COMMON"] == NSOrderedSame) {
            return @(AWSmedialiveAuthenticationSchemeCommon);
        }
        return @(AWSmedialiveAuthenticationSchemeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveAuthenticationSchemeAkamai:
                return @"AKAMAI";
            case AWSmedialiveAuthenticationSchemeCommon:
                return @"COMMON";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)cacheFullBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISCONNECT_IMMEDIATELY"] == NSOrderedSame) {
            return @(AWSmedialiveRtmpCacheFullBehaviorDisconnectImmediately);
        }
        if ([value caseInsensitiveCompare:@"WAIT_FOR_SERVER"] == NSOrderedSame) {
            return @(AWSmedialiveRtmpCacheFullBehaviorWaitForServer);
        }
        return @(AWSmedialiveRtmpCacheFullBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveRtmpCacheFullBehaviorDisconnectImmediately:
                return @"DISCONNECT_IMMEDIATELY";
            case AWSmedialiveRtmpCacheFullBehaviorWaitForServer:
                return @"WAIT_FOR_SERVER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)captionDataJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSmedialiveRtmpCaptionDataAll);
        }
        if ([value caseInsensitiveCompare:@"FIELD1_608"] == NSOrderedSame) {
            return @(AWSmedialiveRtmpCaptionDataField1608);
        }
        if ([value caseInsensitiveCompare:@"FIELD1_AND_FIELD2_608"] == NSOrderedSame) {
            return @(AWSmedialiveRtmpCaptionDataField1AndField2608);
        }
        return @(AWSmedialiveRtmpCaptionDataUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveRtmpCaptionDataAll:
                return @"ALL";
            case AWSmedialiveRtmpCaptionDataField1608:
                return @"FIELD1_608";
            case AWSmedialiveRtmpCaptionDataField1AndField2608:
                return @"FIELD1_AND_FIELD2_608";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputLossActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMIT_OUTPUT"] == NSOrderedSame) {
            return @(AWSmedialiveInputLossActionForRtmpOutEmitOutput);
        }
        if ([value caseInsensitiveCompare:@"PAUSE_OUTPUT"] == NSOrderedSame) {
            return @(AWSmedialiveInputLossActionForRtmpOutPauseOutput);
        }
        return @(AWSmedialiveInputLossActionForRtmpOutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputLossActionForRtmpOutEmitOutput:
                return @"EMIT_OUTPUT";
            case AWSmedialiveInputLossActionForRtmpOutPauseOutput:
                return @"PAUSE_OUTPUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveRtmpOutputSettings

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
            return @(AWSmedialiveRtmpOutputCertificateModeSelfSigned);
        }
        if ([value caseInsensitiveCompare:@"VERIFY_AUTHENTICITY"] == NSOrderedSame) {
            return @(AWSmedialiveRtmpOutputCertificateModeVerifyAuthenticity);
        }
        return @(AWSmedialiveRtmpOutputCertificateModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveRtmpOutputCertificateModeSelfSigned:
                return @"SELF_SIGNED";
            case AWSmedialiveRtmpOutputCertificateModeVerifyAuthenticity:
                return @"VERIFY_AUTHENTICITY";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveOutputLocationRef class]];
}

@end

@implementation AWSmedialiveScheduleAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actionName" : @"ActionName",
             @"scheduleActionSettings" : @"ScheduleActionSettings",
             @"scheduleActionStartSettings" : @"ScheduleActionStartSettings",
             };
}

+ (NSValueTransformer *)scheduleActionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScheduleActionSettings class]];
}

+ (NSValueTransformer *)scheduleActionStartSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScheduleActionStartSettings class]];
}

@end

@implementation AWSmedialiveScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hlsId3SegmentTaggingSettings" : @"HlsId3SegmentTaggingSettings",
             @"hlsTimedMetadataSettings" : @"HlsTimedMetadataSettings",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveHlsId3SegmentTaggingScheduleActionSettings class]];
}

+ (NSValueTransformer *)hlsTimedMetadataSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveHlsTimedMetadataScheduleActionSettings class]];
}

+ (NSValueTransformer *)inputSwitchSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSwitchScheduleActionSettings class]];
}

+ (NSValueTransformer *)pauseStateSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialivePauseStateScheduleActionSettings class]];
}

+ (NSValueTransformer *)scte35ReturnToNetworkSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScte35ReturnToNetworkScheduleActionSettings class]];
}

+ (NSValueTransformer *)scte35SpliceInsertSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScte35SpliceInsertScheduleActionSettings class]];
}

+ (NSValueTransformer *)scte35TimeSignalSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScte35TimeSignalScheduleActionSettings class]];
}

+ (NSValueTransformer *)staticImageActivateSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveStaticImageActivateScheduleActionSettings class]];
}

+ (NSValueTransformer *)staticImageDeactivateSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveStaticImageDeactivateScheduleActionSettings class]];
}

@end

@implementation AWSmedialiveScheduleActionStartSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fixedModeScheduleActionStartSettings" : @"FixedModeScheduleActionStartSettings",
             @"followModeScheduleActionStartSettings" : @"FollowModeScheduleActionStartSettings",
             @"immediateModeScheduleActionStartSettings" : @"ImmediateModeScheduleActionStartSettings",
             };
}

+ (NSValueTransformer *)fixedModeScheduleActionStartSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveFixedModeScheduleActionStartSettings class]];
}

+ (NSValueTransformer *)followModeScheduleActionStartSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveFollowModeScheduleActionStartSettings class]];
}

+ (NSValueTransformer *)immediateModeScheduleActionStartSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveImmediateModeScheduleActionStartSettings class]];
}

@end

@implementation AWSmedialiveScheduleDeleteResultModel

@end

@implementation AWSmedialiveScheduleDescribeResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scheduleActions" : @"ScheduleActions",
             };
}

+ (NSValueTransformer *)scheduleActionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveScheduleAction class]];
}

@end

@implementation AWSmedialiveScte20PlusEmbeddedDestinationSettings

@end

@implementation AWSmedialiveScte20SourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"convert608To708" : @"Convert608To708",
             @"source608ChannelNumber" : @"Source608ChannelNumber",
             };
}

+ (NSValueTransformer *)convert608To708JSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveScte20Convert608To708Disabled);
        }
        if ([value caseInsensitiveCompare:@"UPCONVERT"] == NSOrderedSame) {
            return @(AWSmedialiveScte20Convert608To708Upconvert);
        }
        return @(AWSmedialiveScte20Convert608To708Unknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveScte20Convert608To708Disabled:
                return @"DISABLED";
            case AWSmedialiveScte20Convert608To708Upconvert:
                return @"UPCONVERT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveScte27DestinationSettings

@end

@implementation AWSmedialiveScte27SourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pid" : @"Pid",
             };
}

@end

@implementation AWSmedialiveScte35DeliveryRestrictions

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
            return @(AWSmedialiveScte35ArchiveAllowedFlagArchiveNotAllowed);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVE_ALLOWED"] == NSOrderedSame) {
            return @(AWSmedialiveScte35ArchiveAllowedFlagArchiveAllowed);
        }
        return @(AWSmedialiveScte35ArchiveAllowedFlagUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveScte35ArchiveAllowedFlagArchiveNotAllowed:
                return @"ARCHIVE_NOT_ALLOWED";
            case AWSmedialiveScte35ArchiveAllowedFlagArchiveAllowed:
                return @"ARCHIVE_ALLOWED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)deviceRestrictionsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveScte35DeviceRestrictionsNone);
        }
        if ([value caseInsensitiveCompare:@"RESTRICT_GROUP0"] == NSOrderedSame) {
            return @(AWSmedialiveScte35DeviceRestrictionsRestrictGroup0);
        }
        if ([value caseInsensitiveCompare:@"RESTRICT_GROUP1"] == NSOrderedSame) {
            return @(AWSmedialiveScte35DeviceRestrictionsRestrictGroup1);
        }
        if ([value caseInsensitiveCompare:@"RESTRICT_GROUP2"] == NSOrderedSame) {
            return @(AWSmedialiveScte35DeviceRestrictionsRestrictGroup2);
        }
        return @(AWSmedialiveScte35DeviceRestrictionsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveScte35DeviceRestrictionsNone:
                return @"NONE";
            case AWSmedialiveScte35DeviceRestrictionsRestrictGroup0:
                return @"RESTRICT_GROUP0";
            case AWSmedialiveScte35DeviceRestrictionsRestrictGroup1:
                return @"RESTRICT_GROUP1";
            case AWSmedialiveScte35DeviceRestrictionsRestrictGroup2:
                return @"RESTRICT_GROUP2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)noRegionalBlackoutFlagJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REGIONAL_BLACKOUT"] == NSOrderedSame) {
            return @(AWSmedialiveScte35NoRegionalBlackoutFlagRegionalBlackout);
        }
        if ([value caseInsensitiveCompare:@"NO_REGIONAL_BLACKOUT"] == NSOrderedSame) {
            return @(AWSmedialiveScte35NoRegionalBlackoutFlagNoRegionalBlackout);
        }
        return @(AWSmedialiveScte35NoRegionalBlackoutFlagUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveScte35NoRegionalBlackoutFlagRegionalBlackout:
                return @"REGIONAL_BLACKOUT";
            case AWSmedialiveScte35NoRegionalBlackoutFlagNoRegionalBlackout:
                return @"NO_REGIONAL_BLACKOUT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)webDeliveryAllowedFlagJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WEB_DELIVERY_NOT_ALLOWED"] == NSOrderedSame) {
            return @(AWSmedialiveScte35WebDeliveryAllowedFlagWebDeliveryNotAllowed);
        }
        if ([value caseInsensitiveCompare:@"WEB_DELIVERY_ALLOWED"] == NSOrderedSame) {
            return @(AWSmedialiveScte35WebDeliveryAllowedFlagWebDeliveryAllowed);
        }
        return @(AWSmedialiveScte35WebDeliveryAllowedFlagUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveScte35WebDeliveryAllowedFlagWebDeliveryNotAllowed:
                return @"WEB_DELIVERY_NOT_ALLOWED";
            case AWSmedialiveScte35WebDeliveryAllowedFlagWebDeliveryAllowed:
                return @"WEB_DELIVERY_ALLOWED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveScte35Descriptor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scte35DescriptorSettings" : @"Scte35DescriptorSettings",
             };
}

+ (NSValueTransformer *)scte35DescriptorSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScte35DescriptorSettings class]];
}

@end

@implementation AWSmedialiveScte35DescriptorSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentationDescriptorScte35DescriptorSettings" : @"SegmentationDescriptorScte35DescriptorSettings",
             };
}

+ (NSValueTransformer *)segmentationDescriptorScte35DescriptorSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScte35SegmentationDescriptor class]];
}

@end

@implementation AWSmedialiveScte35ReturnToNetworkScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spliceEventId" : @"SpliceEventId",
             };
}

@end

@implementation AWSmedialiveScte35SegmentationDescriptor

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveScte35DeliveryRestrictions class]];
}

+ (NSValueTransformer *)segmentationCancelIndicatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SEGMENTATION_EVENT_NOT_CANCELED"] == NSOrderedSame) {
            return @(AWSmedialiveScte35SegmentationCancelIndicatorSegmentationEventNotCanceled);
        }
        if ([value caseInsensitiveCompare:@"SEGMENTATION_EVENT_CANCELED"] == NSOrderedSame) {
            return @(AWSmedialiveScte35SegmentationCancelIndicatorSegmentationEventCanceled);
        }
        return @(AWSmedialiveScte35SegmentationCancelIndicatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveScte35SegmentationCancelIndicatorSegmentationEventNotCanceled:
                return @"SEGMENTATION_EVENT_NOT_CANCELED";
            case AWSmedialiveScte35SegmentationCancelIndicatorSegmentationEventCanceled:
                return @"SEGMENTATION_EVENT_CANCELED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveScte35SpliceInsert

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
            return @(AWSmedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorFollow);
        }
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSmedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorIgnore);
        }
        return @(AWSmedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorFollow:
                return @"FOLLOW";
            case AWSmedialiveScte35SpliceInsertNoRegionalBlackoutBehaviorIgnore:
                return @"IGNORE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)webDeliveryAllowedFlagJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW"] == NSOrderedSame) {
            return @(AWSmedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorFollow);
        }
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSmedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorIgnore);
        }
        return @(AWSmedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorFollow:
                return @"FOLLOW";
            case AWSmedialiveScte35SpliceInsertWebDeliveryAllowedBehaviorIgnore:
                return @"IGNORE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveScte35SpliceInsertScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"spliceEventId" : @"SpliceEventId",
             };
}

@end

@implementation AWSmedialiveScte35TimeSignalApos

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
            return @(AWSmedialiveScte35AposNoRegionalBlackoutBehaviorFollow);
        }
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSmedialiveScte35AposNoRegionalBlackoutBehaviorIgnore);
        }
        return @(AWSmedialiveScte35AposNoRegionalBlackoutBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveScte35AposNoRegionalBlackoutBehaviorFollow:
                return @"FOLLOW";
            case AWSmedialiveScte35AposNoRegionalBlackoutBehaviorIgnore:
                return @"IGNORE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)webDeliveryAllowedFlagJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FOLLOW"] == NSOrderedSame) {
            return @(AWSmedialiveScte35AposWebDeliveryAllowedBehaviorFollow);
        }
        if ([value caseInsensitiveCompare:@"IGNORE"] == NSOrderedSame) {
            return @(AWSmedialiveScte35AposWebDeliveryAllowedBehaviorIgnore);
        }
        return @(AWSmedialiveScte35AposWebDeliveryAllowedBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveScte35AposWebDeliveryAllowedBehaviorFollow:
                return @"FOLLOW";
            case AWSmedialiveScte35AposWebDeliveryAllowedBehaviorIgnore:
                return @"IGNORE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveScte35TimeSignalScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scte35Descriptors" : @"Scte35Descriptors",
             };
}

+ (NSValueTransformer *)scte35DescriptorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveScte35Descriptor class]];
}

@end

@implementation AWSmedialiveSmpteTtDestinationSettings

@end

@implementation AWSmedialiveStandardHlsSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioRenditionSets" : @"AudioRenditionSets",
             @"m3u8Settings" : @"M3u8Settings",
             };
}

+ (NSValueTransformer *)m3u8SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveM3u8Settings class]];
}

@end

@implementation AWSmedialiveStartChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             };
}

@end

@implementation AWSmedialiveStartChannelResponse

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
            return @(AWSmedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelClassSinglePipeline);
        }
        return @(AWSmedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSmedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputDestination class]];
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveChannelEgressEndpoint class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDisabled);
        }
        return @(AWSmedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveLogLevelError:
                return @"ERROR";
            case AWSmedialiveLogLevelWarning:
                return @"WARNING";
            case AWSmedialiveLogLevelInfo:
                return @"INFO";
            case AWSmedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSmedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pipelineDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialivePipelineDetail class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateUpdateFailed);
        }
        return @(AWSmedialiveChannelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelStateCreating:
                return @"CREATING";
            case AWSmedialiveChannelStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSmedialiveChannelStateIdle:
                return @"IDLE";
            case AWSmedialiveChannelStateStarting:
                return @"STARTING";
            case AWSmedialiveChannelStateRunning:
                return @"RUNNING";
            case AWSmedialiveChannelStateRecovering:
                return @"RECOVERING";
            case AWSmedialiveChannelStateStopping:
                return @"STOPPING";
            case AWSmedialiveChannelStateDeleting:
                return @"DELETING";
            case AWSmedialiveChannelStateDeleted:
                return @"DELETED";
            case AWSmedialiveChannelStateUpdating:
                return @"UPDATING";
            case AWSmedialiveChannelStateUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveStartMultiplexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             };
}

@end

@implementation AWSmedialiveStartMultiplexResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMultiplexOutputDestination class]];
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexSettings class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateDeleted);
        }
        return @(AWSmedialiveMultiplexStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveMultiplexStateCreating:
                return @"CREATING";
            case AWSmedialiveMultiplexStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSmedialiveMultiplexStateIdle:
                return @"IDLE";
            case AWSmedialiveMultiplexStateStarting:
                return @"STARTING";
            case AWSmedialiveMultiplexStateRunning:
                return @"RUNNING";
            case AWSmedialiveMultiplexStateRecovering:
                return @"RECOVERING";
            case AWSmedialiveMultiplexStateStopping:
                return @"STOPPING";
            case AWSmedialiveMultiplexStateDeleting:
                return @"DELETING";
            case AWSmedialiveMultiplexStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveStartTimecode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timecode" : @"Timecode",
             };
}

@end

@implementation AWSmedialiveStaticImageActivateScheduleActionSettings

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputLocation class]];
}

@end

@implementation AWSmedialiveStaticImageDeactivateScheduleActionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fadeOut" : @"FadeOut",
             @"layer" : @"Layer",
             };
}

@end

@implementation AWSmedialiveStaticKeySettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyProviderServer" : @"KeyProviderServer",
             @"staticKeyValue" : @"StaticKeyValue",
             };
}

+ (NSValueTransformer *)keyProviderServerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputLocation class]];
}

@end

@implementation AWSmedialiveStopChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelId" : @"ChannelId",
             };
}

@end

@implementation AWSmedialiveStopChannelResponse

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
            return @(AWSmedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelClassSinglePipeline);
        }
        return @(AWSmedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSmedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputDestination class]];
}

+ (NSValueTransformer *)egressEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveChannelEgressEndpoint class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDisabled);
        }
        return @(AWSmedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveLogLevelError:
                return @"ERROR";
            case AWSmedialiveLogLevelWarning:
                return @"WARNING";
            case AWSmedialiveLogLevelInfo:
                return @"INFO";
            case AWSmedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSmedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pipelineDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialivePipelineDetail class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateUpdating);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveChannelStateUpdateFailed);
        }
        return @(AWSmedialiveChannelStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelStateCreating:
                return @"CREATING";
            case AWSmedialiveChannelStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSmedialiveChannelStateIdle:
                return @"IDLE";
            case AWSmedialiveChannelStateStarting:
                return @"STARTING";
            case AWSmedialiveChannelStateRunning:
                return @"RUNNING";
            case AWSmedialiveChannelStateRecovering:
                return @"RECOVERING";
            case AWSmedialiveChannelStateStopping:
                return @"STOPPING";
            case AWSmedialiveChannelStateDeleting:
                return @"DELETING";
            case AWSmedialiveChannelStateDeleted:
                return @"DELETED";
            case AWSmedialiveChannelStateUpdating:
                return @"UPDATING";
            case AWSmedialiveChannelStateUpdateFailed:
                return @"UPDATE_FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveStopMultiplexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             };
}

@end

@implementation AWSmedialiveStopMultiplexResponse

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMultiplexOutputDestination class]];
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexSettings class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateCreating);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"IDLE"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateIdle);
        }
        if ([value caseInsensitiveCompare:@"STARTING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateStarting);
        }
        if ([value caseInsensitiveCompare:@"RUNNING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateRunning);
        }
        if ([value caseInsensitiveCompare:@"RECOVERING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateRecovering);
        }
        if ([value caseInsensitiveCompare:@"STOPPING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateStopping);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSmedialiveMultiplexStateDeleted);
        }
        return @(AWSmedialiveMultiplexStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveMultiplexStateCreating:
                return @"CREATING";
            case AWSmedialiveMultiplexStateCreateFailed:
                return @"CREATE_FAILED";
            case AWSmedialiveMultiplexStateIdle:
                return @"IDLE";
            case AWSmedialiveMultiplexStateStarting:
                return @"STARTING";
            case AWSmedialiveMultiplexStateRunning:
                return @"RUNNING";
            case AWSmedialiveMultiplexStateRecovering:
                return @"RECOVERING";
            case AWSmedialiveMultiplexStateStopping:
                return @"STOPPING";
            case AWSmedialiveMultiplexStateDeleting:
                return @"DELETING";
            case AWSmedialiveMultiplexStateDeleted:
                return @"DELETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveStopTimecode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastFrameClippingBehavior" : @"LastFrameClippingBehavior",
             @"timecode" : @"Timecode",
             };
}

+ (NSValueTransformer *)lastFrameClippingBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EXCLUDE_LAST_FRAME"] == NSOrderedSame) {
            return @(AWSmedialiveLastFrameClippingBehaviorExcludeLastFrame);
        }
        if ([value caseInsensitiveCompare:@"INCLUDE_LAST_FRAME"] == NSOrderedSame) {
            return @(AWSmedialiveLastFrameClippingBehaviorIncludeLastFrame);
        }
        return @(AWSmedialiveLastFrameClippingBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveLastFrameClippingBehaviorExcludeLastFrame:
                return @"EXCLUDE_LAST_FRAME";
            case AWSmedialiveLastFrameClippingBehaviorIncludeLastFrame:
                return @"INCLUDE_LAST_FRAME";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveTagsModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSmedialiveTeletextDestinationSettings

@end

@implementation AWSmedialiveTeletextSourceSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageNumber" : @"PageNumber",
             };
}

@end

@implementation AWSmedialiveTemporalFilterSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"postFilterSharpening" : @"PostFilterSharpening",
             @"strength" : @"Strength",
             };
}

+ (NSValueTransformer *)postFilterSharpeningJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterPostFilterSharpeningAuto);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterPostFilterSharpeningDisabled);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterPostFilterSharpeningEnabled);
        }
        return @(AWSmedialiveTemporalFilterPostFilterSharpeningUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveTemporalFilterPostFilterSharpeningAuto:
                return @"AUTO";
            case AWSmedialiveTemporalFilterPostFilterSharpeningDisabled:
                return @"DISABLED";
            case AWSmedialiveTemporalFilterPostFilterSharpeningEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)strengthJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AUTO"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthAuto);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_1"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength1);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_10"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength10);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_11"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength11);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_12"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength12);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_13"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength13);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_14"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength14);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_15"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength15);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_16"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength16);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_2"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength2);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_3"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength3);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_4"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength4);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_5"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength5);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_6"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength6);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_7"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength7);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_8"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength8);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH_9"] == NSOrderedSame) {
            return @(AWSmedialiveTemporalFilterStrengthStrength9);
        }
        return @(AWSmedialiveTemporalFilterStrengthUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveTemporalFilterStrengthAuto:
                return @"AUTO";
            case AWSmedialiveTemporalFilterStrengthStrength1:
                return @"STRENGTH_1";
            case AWSmedialiveTemporalFilterStrengthStrength10:
                return @"STRENGTH_10";
            case AWSmedialiveTemporalFilterStrengthStrength11:
                return @"STRENGTH_11";
            case AWSmedialiveTemporalFilterStrengthStrength12:
                return @"STRENGTH_12";
            case AWSmedialiveTemporalFilterStrengthStrength13:
                return @"STRENGTH_13";
            case AWSmedialiveTemporalFilterStrengthStrength14:
                return @"STRENGTH_14";
            case AWSmedialiveTemporalFilterStrengthStrength15:
                return @"STRENGTH_15";
            case AWSmedialiveTemporalFilterStrengthStrength16:
                return @"STRENGTH_16";
            case AWSmedialiveTemporalFilterStrengthStrength2:
                return @"STRENGTH_2";
            case AWSmedialiveTemporalFilterStrengthStrength3:
                return @"STRENGTH_3";
            case AWSmedialiveTemporalFilterStrengthStrength4:
                return @"STRENGTH_4";
            case AWSmedialiveTemporalFilterStrengthStrength5:
                return @"STRENGTH_5";
            case AWSmedialiveTemporalFilterStrengthStrength6:
                return @"STRENGTH_6";
            case AWSmedialiveTemporalFilterStrengthStrength7:
                return @"STRENGTH_7";
            case AWSmedialiveTemporalFilterStrengthStrength8:
                return @"STRENGTH_8";
            case AWSmedialiveTemporalFilterStrengthStrength9:
                return @"STRENGTH_9";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveTimecodeConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"source" : @"Source",
             @"syncThreshold" : @"SyncThreshold",
             };
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMBEDDED"] == NSOrderedSame) {
            return @(AWSmedialiveTimecodeConfigSourceEmbedded);
        }
        if ([value caseInsensitiveCompare:@"SYSTEMCLOCK"] == NSOrderedSame) {
            return @(AWSmedialiveTimecodeConfigSourceSystemclock);
        }
        if ([value caseInsensitiveCompare:@"ZEROBASED"] == NSOrderedSame) {
            return @(AWSmedialiveTimecodeConfigSourceZerobased);
        }
        return @(AWSmedialiveTimecodeConfigSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveTimecodeConfigSourceEmbedded:
                return @"EMBEDDED";
            case AWSmedialiveTimecodeConfigSourceSystemclock:
                return @"SYSTEMCLOCK";
            case AWSmedialiveTimecodeConfigSourceZerobased:
                return @"ZEROBASED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveTtmlDestinationSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"styleControl" : @"StyleControl",
             };
}

+ (NSValueTransformer *)styleControlJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveTtmlDestinationStyleControlPassthrough);
        }
        if ([value caseInsensitiveCompare:@"USE_CONFIGURED"] == NSOrderedSame) {
            return @(AWSmedialiveTtmlDestinationStyleControlUseConfigured);
        }
        return @(AWSmedialiveTtmlDestinationStyleControlUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveTtmlDestinationStyleControlPassthrough:
                return @"PASSTHROUGH";
            case AWSmedialiveTtmlDestinationStyleControlUseConfigured:
                return @"USE_CONFIGURED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveUdpContainerSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"m2tsSettings" : @"M2tsSettings",
             };
}

+ (NSValueTransformer *)m2tsSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveM2tsSettings class]];
}

@end

@implementation AWSmedialiveUdpGroupSettings

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
            return @(AWSmedialiveInputLossActionForUdpOutDropProgram);
        }
        if ([value caseInsensitiveCompare:@"DROP_TS"] == NSOrderedSame) {
            return @(AWSmedialiveInputLossActionForUdpOutDropTs);
        }
        if ([value caseInsensitiveCompare:@"EMIT_PROGRAM"] == NSOrderedSame) {
            return @(AWSmedialiveInputLossActionForUdpOutEmitProgram);
        }
        return @(AWSmedialiveInputLossActionForUdpOutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveInputLossActionForUdpOutDropProgram:
                return @"DROP_PROGRAM";
            case AWSmedialiveInputLossActionForUdpOutDropTs:
                return @"DROP_TS";
            case AWSmedialiveInputLossActionForUdpOutEmitProgram:
                return @"EMIT_PROGRAM";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timedMetadataId3FrameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveUdpTimedMetadataId3FrameNone);
        }
        if ([value caseInsensitiveCompare:@"PRIV"] == NSOrderedSame) {
            return @(AWSmedialiveUdpTimedMetadataId3FramePriv);
        }
        if ([value caseInsensitiveCompare:@"TDRL"] == NSOrderedSame) {
            return @(AWSmedialiveUdpTimedMetadataId3FrameTdrl);
        }
        return @(AWSmedialiveUdpTimedMetadataId3FrameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveUdpTimedMetadataId3FrameNone:
                return @"NONE";
            case AWSmedialiveUdpTimedMetadataId3FramePriv:
                return @"PRIV";
            case AWSmedialiveUdpTimedMetadataId3FrameTdrl:
                return @"TDRL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveUdpOutputSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bufferMsec" : @"BufferMsec",
             @"containerSettings" : @"ContainerSettings",
             @"destination" : @"Destination",
             @"fecOutputSettings" : @"FecOutputSettings",
             };
}

+ (NSValueTransformer *)containerSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveUdpContainerSettings class]];
}

+ (NSValueTransformer *)destinationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveOutputLocationRef class]];
}

+ (NSValueTransformer *)fecOutputSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveFecOutputSettings class]];
}

@end

@implementation AWSmedialiveUpdateChannel

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputDestination class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDisabled);
        }
        return @(AWSmedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveLogLevelError:
                return @"ERROR";
            case AWSmedialiveLogLevelWarning:
                return @"WARNING";
            case AWSmedialiveLogLevelInfo:
                return @"INFO";
            case AWSmedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSmedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveUpdateChannelClass

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelClass" : @"ChannelClass",
             @"destinations" : @"Destinations",
             };
}

+ (NSValueTransformer *)channelClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSmedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelClassSinglePipeline);
        }
        return @(AWSmedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSmedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputDestination class]];
}

@end

@implementation AWSmedialiveUpdateChannelClassRequest

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
            return @(AWSmedialiveChannelClassStandard);
        }
        if ([value caseInsensitiveCompare:@"SINGLE_PIPELINE"] == NSOrderedSame) {
            return @(AWSmedialiveChannelClassSinglePipeline);
        }
        return @(AWSmedialiveChannelClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveChannelClassStandard:
                return @"STANDARD";
            case AWSmedialiveChannelClassSinglePipeline:
                return @"SINGLE_PIPELINE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputDestination class]];
}

@end

@implementation AWSmedialiveUpdateChannelClassResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveChannel class]];
}

@end

@implementation AWSmedialiveUpdateChannelRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveOutputDestination class]];
}

+ (NSValueTransformer *)encoderSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveEncoderSettings class]];
}

+ (NSValueTransformer *)inputAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputAttachment class]];
}

+ (NSValueTransformer *)inputSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSpecification class]];
}

+ (NSValueTransformer *)logLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelError);
        }
        if ([value caseInsensitiveCompare:@"WARNING"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelWarning);
        }
        if ([value caseInsensitiveCompare:@"INFO"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelInfo);
        }
        if ([value caseInsensitiveCompare:@"DEBUG"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDebug);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSmedialiveLogLevelDisabled);
        }
        return @(AWSmedialiveLogLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveLogLevelError:
                return @"ERROR";
            case AWSmedialiveLogLevelWarning:
                return @"WARNING";
            case AWSmedialiveLogLevelInfo:
                return @"INFO";
            case AWSmedialiveLogLevelDebug:
                return @"DEBUG";
            case AWSmedialiveLogLevelDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveUpdateChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveChannel class]];
}

@end

@implementation AWSmedialiveUpdateChannelResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveChannel class]];
}

@end

@implementation AWSmedialiveUpdateInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"Destinations",
             @"inputSecurityGroups" : @"InputSecurityGroups",
             @"mediaConnectFlows" : @"MediaConnectFlows",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"sources" : @"Sources",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputDestinationRequest class]];
}

+ (NSValueTransformer *)mediaConnectFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMediaConnectFlowRequest class]];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputSourceRequest class]];
}

@end

@implementation AWSmedialiveUpdateInputRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinations" : @"Destinations",
             @"inputId" : @"InputId",
             @"inputSecurityGroups" : @"InputSecurityGroups",
             @"mediaConnectFlows" : @"MediaConnectFlows",
             @"name" : @"Name",
             @"roleArn" : @"RoleArn",
             @"sources" : @"Sources",
             };
}

+ (NSValueTransformer *)destinationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputDestinationRequest class]];
}

+ (NSValueTransformer *)mediaConnectFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveMediaConnectFlowRequest class]];
}

+ (NSValueTransformer *)sourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputSourceRequest class]];
}

@end

@implementation AWSmedialiveUpdateInputResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInput class]];
}

@end

@implementation AWSmedialiveUpdateInputResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"input" : @"Input",
             };
}

+ (NSValueTransformer *)inputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInput class]];
}

@end

@implementation AWSmedialiveUpdateInputSecurityGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputSecurityGroupId" : @"InputSecurityGroupId",
             @"tags" : @"Tags",
             @"whitelistRules" : @"WhitelistRules",
             };
}

+ (NSValueTransformer *)whitelistRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSmedialiveInputWhitelistRuleCidr class]];
}

@end

@implementation AWSmedialiveUpdateInputSecurityGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroup" : @"SecurityGroup",
             };
}

+ (NSValueTransformer *)securityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSecurityGroup class]];
}

@end

@implementation AWSmedialiveUpdateInputSecurityGroupResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroup" : @"SecurityGroup",
             };
}

+ (NSValueTransformer *)securityGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveInputSecurityGroup class]];
}

@end

@implementation AWSmedialiveUpdateMultiplex

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexSettings" : @"MultiplexSettings",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexSettings class]];
}

@end

@implementation AWSmedialiveUpdateMultiplexProgram

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgramSettings class]];
}

@end

@implementation AWSmedialiveUpdateMultiplexProgramRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             @"multiplexProgramSettings" : @"MultiplexProgramSettings",
             @"programName" : @"ProgramName",
             };
}

+ (NSValueTransformer *)multiplexProgramSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgramSettings class]];
}

@end

@implementation AWSmedialiveUpdateMultiplexProgramResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexProgram" : @"MultiplexProgram",
             };
}

+ (NSValueTransformer *)multiplexProgramJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgram class]];
}

@end

@implementation AWSmedialiveUpdateMultiplexProgramResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexProgram" : @"MultiplexProgram",
             };
}

+ (NSValueTransformer *)multiplexProgramJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexProgram class]];
}

@end

@implementation AWSmedialiveUpdateMultiplexRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplexId" : @"MultiplexId",
             @"multiplexSettings" : @"MultiplexSettings",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)multiplexSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplexSettings class]];
}

@end

@implementation AWSmedialiveUpdateMultiplexResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplex" : @"Multiplex",
             };
}

+ (NSValueTransformer *)multiplexJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplex class]];
}

@end

@implementation AWSmedialiveUpdateMultiplexResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"multiplex" : @"Multiplex",
             };
}

+ (NSValueTransformer *)multiplexJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveMultiplex class]];
}

@end

@implementation AWSmedialiveUpdateReservation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSmedialiveUpdateReservationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"reservationId" : @"ReservationId",
             };
}

@end

@implementation AWSmedialiveUpdateReservationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservation" : @"Reservation",
             };
}

+ (NSValueTransformer *)reservationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveReservation class]];
}

@end

@implementation AWSmedialiveUpdateReservationResultModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservation" : @"Reservation",
             };
}

+ (NSValueTransformer *)reservationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveReservation class]];
}

@end

@implementation AWSmedialiveValidationError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"elementPath" : @"ElementPath",
             @"errorMessage" : @"ErrorMessage",
             };
}

@end

@implementation AWSmedialiveVideoCodecSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"frameCaptureSettings" : @"FrameCaptureSettings",
             @"h264Settings" : @"H264Settings",
             @"h265Settings" : @"H265Settings",
             };
}

+ (NSValueTransformer *)frameCaptureSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveFrameCaptureSettings class]];
}

+ (NSValueTransformer *)h264SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveH264Settings class]];
}

+ (NSValueTransformer *)h265SettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveH265Settings class]];
}

@end

@implementation AWSmedialiveVideoDescription

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveVideoCodecSettings class]];
}

+ (NSValueTransformer *)respondToAfdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSmedialiveVideoDescriptionRespondToAfdNone);
        }
        if ([value caseInsensitiveCompare:@"PASSTHROUGH"] == NSOrderedSame) {
            return @(AWSmedialiveVideoDescriptionRespondToAfdPassthrough);
        }
        if ([value caseInsensitiveCompare:@"RESPOND"] == NSOrderedSame) {
            return @(AWSmedialiveVideoDescriptionRespondToAfdRespond);
        }
        return @(AWSmedialiveVideoDescriptionRespondToAfdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveVideoDescriptionRespondToAfdNone:
                return @"NONE";
            case AWSmedialiveVideoDescriptionRespondToAfdPassthrough:
                return @"PASSTHROUGH";
            case AWSmedialiveVideoDescriptionRespondToAfdRespond:
                return @"RESPOND";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)scalingBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSmedialiveVideoDescriptionScalingBehaviorDefault);
        }
        if ([value caseInsensitiveCompare:@"STRETCH_TO_OUTPUT"] == NSOrderedSame) {
            return @(AWSmedialiveVideoDescriptionScalingBehaviorStretchToOutput);
        }
        return @(AWSmedialiveVideoDescriptionScalingBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveVideoDescriptionScalingBehaviorDefault:
                return @"DEFAULT";
            case AWSmedialiveVideoDescriptionScalingBehaviorStretchToOutput:
                return @"STRETCH_TO_OUTPUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSmedialiveVideoSelector

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
            return @(AWSmedialiveVideoSelectorColorSpaceFollow);
        }
        if ([value caseInsensitiveCompare:@"REC_601"] == NSOrderedSame) {
            return @(AWSmedialiveVideoSelectorColorSpaceRec601);
        }
        if ([value caseInsensitiveCompare:@"REC_709"] == NSOrderedSame) {
            return @(AWSmedialiveVideoSelectorColorSpaceRec709);
        }
        return @(AWSmedialiveVideoSelectorColorSpaceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveVideoSelectorColorSpaceFollow:
                return @"FOLLOW";
            case AWSmedialiveVideoSelectorColorSpaceRec601:
                return @"REC_601";
            case AWSmedialiveVideoSelectorColorSpaceRec709:
                return @"REC_709";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)colorSpaceUsageJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FALLBACK"] == NSOrderedSame) {
            return @(AWSmedialiveVideoSelectorColorSpaceUsageFallback);
        }
        if ([value caseInsensitiveCompare:@"FORCE"] == NSOrderedSame) {
            return @(AWSmedialiveVideoSelectorColorSpaceUsageForce);
        }
        return @(AWSmedialiveVideoSelectorColorSpaceUsageUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSmedialiveVideoSelectorColorSpaceUsageFallback:
                return @"FALLBACK";
            case AWSmedialiveVideoSelectorColorSpaceUsageForce:
                return @"FORCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)selectorSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveVideoSelectorSettings class]];
}

@end

@implementation AWSmedialiveVideoSelectorPid

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pid" : @"Pid",
             };
}

@end

@implementation AWSmedialiveVideoSelectorProgramId

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"programId" : @"ProgramId",
             };
}

@end

@implementation AWSmedialiveVideoSelectorSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"videoSelectorPid" : @"VideoSelectorPid",
             @"videoSelectorProgramId" : @"VideoSelectorProgramId",
             };
}

+ (NSValueTransformer *)videoSelectorPidJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveVideoSelectorPid class]];
}

+ (NSValueTransformer *)videoSelectorProgramIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSmedialiveVideoSelectorProgramId class]];
}

@end

@implementation AWSmedialiveWebvttDestinationSettings

@end
