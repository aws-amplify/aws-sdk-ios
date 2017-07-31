//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSPollyModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSPollyErrorDomain = @"com.amazonaws.AWSPollyErrorDomain";

@implementation AWSPollyDeleteLexiconInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSPollyDeleteLexiconOutput

@end

@implementation AWSPollyDescribeVoicesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-GB-WLS"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnGBWLS);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"is-IS"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeIsIS);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"nb-NO"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeNbNO);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pl-PL"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodePlPL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ro-RO"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeRoRO);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"sv-SE"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeSvSE);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeTrTR);
        }
        return @(AWSPollyLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyLanguageCodeCyGB:
                return @"cy-GB";
            case AWSPollyLanguageCodeDaDK:
                return @"da-DK";
            case AWSPollyLanguageCodeDeDE:
                return @"de-DE";
            case AWSPollyLanguageCodeEnAU:
                return @"en-AU";
            case AWSPollyLanguageCodeEnGB:
                return @"en-GB";
            case AWSPollyLanguageCodeEnGBWLS:
                return @"en-GB-WLS";
            case AWSPollyLanguageCodeEnIN:
                return @"en-IN";
            case AWSPollyLanguageCodeEnUS:
                return @"en-US";
            case AWSPollyLanguageCodeEsES:
                return @"es-ES";
            case AWSPollyLanguageCodeEsUS:
                return @"es-US";
            case AWSPollyLanguageCodeFrCA:
                return @"fr-CA";
            case AWSPollyLanguageCodeFrFR:
                return @"fr-FR";
            case AWSPollyLanguageCodeIsIS:
                return @"is-IS";
            case AWSPollyLanguageCodeItIT:
                return @"it-IT";
            case AWSPollyLanguageCodeJaJP:
                return @"ja-JP";
            case AWSPollyLanguageCodeNbNO:
                return @"nb-NO";
            case AWSPollyLanguageCodeNlNL:
                return @"nl-NL";
            case AWSPollyLanguageCodePlPL:
                return @"pl-PL";
            case AWSPollyLanguageCodePtBR:
                return @"pt-BR";
            case AWSPollyLanguageCodePtPT:
                return @"pt-PT";
            case AWSPollyLanguageCodeRoRO:
                return @"ro-RO";
            case AWSPollyLanguageCodeRuRU:
                return @"ru-RU";
            case AWSPollyLanguageCodeSvSE:
                return @"sv-SE";
            case AWSPollyLanguageCodeTrTR:
                return @"tr-TR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPollyDescribeVoicesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"voices" : @"Voices",
             };
}

+ (NSValueTransformer *)voicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPollyVoice class]];
}

@end

@implementation AWSPollyGetLexiconInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSPollyGetLexiconOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lexicon" : @"Lexicon",
             @"lexiconAttributes" : @"LexiconAttributes",
             };
}

+ (NSValueTransformer *)lexiconJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPollyLexicon class]];
}

+ (NSValueTransformer *)lexiconAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPollyLexiconAttributes class]];
}

@end

@implementation AWSPollyLexicon

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"name" : @"Name",
             };
}

@end

@implementation AWSPollyLexiconAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alphabet" : @"Alphabet",
             @"languageCode" : @"LanguageCode",
             @"lastModified" : @"LastModified",
             @"lexemesCount" : @"LexemesCount",
             @"lexiconArn" : @"LexiconArn",
             @"size" : @"Size",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-GB-WLS"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnGBWLS);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"is-IS"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeIsIS);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"nb-NO"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeNbNO);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pl-PL"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodePlPL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ro-RO"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeRoRO);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"sv-SE"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeSvSE);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeTrTR);
        }
        return @(AWSPollyLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyLanguageCodeCyGB:
                return @"cy-GB";
            case AWSPollyLanguageCodeDaDK:
                return @"da-DK";
            case AWSPollyLanguageCodeDeDE:
                return @"de-DE";
            case AWSPollyLanguageCodeEnAU:
                return @"en-AU";
            case AWSPollyLanguageCodeEnGB:
                return @"en-GB";
            case AWSPollyLanguageCodeEnGBWLS:
                return @"en-GB-WLS";
            case AWSPollyLanguageCodeEnIN:
                return @"en-IN";
            case AWSPollyLanguageCodeEnUS:
                return @"en-US";
            case AWSPollyLanguageCodeEsES:
                return @"es-ES";
            case AWSPollyLanguageCodeEsUS:
                return @"es-US";
            case AWSPollyLanguageCodeFrCA:
                return @"fr-CA";
            case AWSPollyLanguageCodeFrFR:
                return @"fr-FR";
            case AWSPollyLanguageCodeIsIS:
                return @"is-IS";
            case AWSPollyLanguageCodeItIT:
                return @"it-IT";
            case AWSPollyLanguageCodeJaJP:
                return @"ja-JP";
            case AWSPollyLanguageCodeNbNO:
                return @"nb-NO";
            case AWSPollyLanguageCodeNlNL:
                return @"nl-NL";
            case AWSPollyLanguageCodePlPL:
                return @"pl-PL";
            case AWSPollyLanguageCodePtBR:
                return @"pt-BR";
            case AWSPollyLanguageCodePtPT:
                return @"pt-PT";
            case AWSPollyLanguageCodeRoRO:
                return @"ro-RO";
            case AWSPollyLanguageCodeRuRU:
                return @"ru-RU";
            case AWSPollyLanguageCodeSvSE:
                return @"sv-SE";
            case AWSPollyLanguageCodeTrTR:
                return @"tr-TR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPollyLexiconDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPollyLexiconAttributes class]];
}

@end

@implementation AWSPollyListLexiconsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSPollyListLexiconsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lexicons" : @"Lexicons",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)lexiconsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPollyLexiconDescription class]];
}

@end

@implementation AWSPollyPutLexiconInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"name" : @"Name",
             };
}

@end

@implementation AWSPollyPutLexiconOutput

@end

@implementation AWSPollySynthesizeSpeechInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lexiconNames" : @"LexiconNames",
             @"outputFormat" : @"OutputFormat",
             @"sampleRate" : @"SampleRate",
             @"speechMarkTypes" : @"SpeechMarkTypes",
             @"text" : @"Text",
             @"textType" : @"TextType",
             @"voiceId" : @"VoiceId",
             };
}

+ (NSValueTransformer *)outputFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"json"] == NSOrderedSame) {
            return @(AWSPollyOutputFormatJson);
        }
        if ([value caseInsensitiveCompare:@"mp3"] == NSOrderedSame) {
            return @(AWSPollyOutputFormatMp3);
        }
        if ([value caseInsensitiveCompare:@"ogg_vorbis"] == NSOrderedSame) {
            return @(AWSPollyOutputFormatOggVorbis);
        }
        if ([value caseInsensitiveCompare:@"pcm"] == NSOrderedSame) {
            return @(AWSPollyOutputFormatPcm);
        }
        return @(AWSPollyOutputFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyOutputFormatJson:
                return @"json";
            case AWSPollyOutputFormatMp3:
                return @"mp3";
            case AWSPollyOutputFormatOggVorbis:
                return @"ogg_vorbis";
            case AWSPollyOutputFormatPcm:
                return @"pcm";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)textTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ssml"] == NSOrderedSame) {
            return @(AWSPollyTextTypeSsml);
        }
        if ([value caseInsensitiveCompare:@"text"] == NSOrderedSame) {
            return @(AWSPollyTextTypeText);
        }
        return @(AWSPollyTextTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyTextTypeSsml:
                return @"ssml";
            case AWSPollyTextTypeText:
                return @"text";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)voiceIdJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Geraint"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGeraint);
        }
        if ([value caseInsensitiveCompare:@"Gwyneth"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGwyneth);
        }
        if ([value caseInsensitiveCompare:@"Mads"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMads);
        }
        if ([value caseInsensitiveCompare:@"Naja"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdNaja);
        }
        if ([value caseInsensitiveCompare:@"Hans"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdHans);
        }
        if ([value caseInsensitiveCompare:@"Marlene"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMarlene);
        }
        if ([value caseInsensitiveCompare:@"Nicole"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdNicole);
        }
        if ([value caseInsensitiveCompare:@"Russell"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRussell);
        }
        if ([value caseInsensitiveCompare:@"Amy"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAmy);
        }
        if ([value caseInsensitiveCompare:@"Brian"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdBrian);
        }
        if ([value caseInsensitiveCompare:@"Emma"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEmma);
        }
        if ([value caseInsensitiveCompare:@"Raveena"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRaveena);
        }
        if ([value caseInsensitiveCompare:@"Ivy"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdIvy);
        }
        if ([value caseInsensitiveCompare:@"Joanna"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJoanna);
        }
        if ([value caseInsensitiveCompare:@"Joey"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJoey);
        }
        if ([value caseInsensitiveCompare:@"Justin"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJustin);
        }
        if ([value caseInsensitiveCompare:@"Kendra"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKendra);
        }
        if ([value caseInsensitiveCompare:@"Kimberly"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKimberly);
        }
        if ([value caseInsensitiveCompare:@"Salli"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdSalli);
        }
        if ([value caseInsensitiveCompare:@"Conchita"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdConchita);
        }
        if ([value caseInsensitiveCompare:@"Enrique"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEnrique);
        }
        if ([value caseInsensitiveCompare:@"Miguel"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMiguel);
        }
        if ([value caseInsensitiveCompare:@"Penelope"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdPenelope);
        }
        if ([value caseInsensitiveCompare:@"Chantal"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdChantal);
        }
        if ([value caseInsensitiveCompare:@"Celine"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCeline);
        }
        if ([value caseInsensitiveCompare:@"Mathieu"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMathieu);
        }
        if ([value caseInsensitiveCompare:@"Dora"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdDora);
        }
        if ([value caseInsensitiveCompare:@"Karl"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKarl);
        }
        if ([value caseInsensitiveCompare:@"Carla"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCarla);
        }
        if ([value caseInsensitiveCompare:@"Giorgio"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGiorgio);
        }
        if ([value caseInsensitiveCompare:@"Mizuki"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMizuki);
        }
        if ([value caseInsensitiveCompare:@"Liv"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLiv);
        }
        if ([value caseInsensitiveCompare:@"Lotte"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLotte);
        }
        if ([value caseInsensitiveCompare:@"Ruben"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRuben);
        }
        if ([value caseInsensitiveCompare:@"Ewa"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEwa);
        }
        if ([value caseInsensitiveCompare:@"Jacek"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJacek);
        }
        if ([value caseInsensitiveCompare:@"Jan"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJan);
        }
        if ([value caseInsensitiveCompare:@"Maja"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMaja);
        }
        if ([value caseInsensitiveCompare:@"Ricardo"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRicardo);
        }
        if ([value caseInsensitiveCompare:@"Vitoria"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdVitoria);
        }
        if ([value caseInsensitiveCompare:@"Cristiano"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCristiano);
        }
        if ([value caseInsensitiveCompare:@"Ines"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdInes);
        }
        if ([value caseInsensitiveCompare:@"Carmen"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCarmen);
        }
        if ([value caseInsensitiveCompare:@"Maxim"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMaxim);
        }
        if ([value caseInsensitiveCompare:@"Tatyana"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdTatyana);
        }
        if ([value caseInsensitiveCompare:@"Astrid"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAstrid);
        }
        if ([value caseInsensitiveCompare:@"Filiz"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdFiliz);
        }
        if ([value caseInsensitiveCompare:@"Vicki"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdVicki);
        }
        return @(AWSPollyVoiceIdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyVoiceIdGeraint:
                return @"Geraint";
            case AWSPollyVoiceIdGwyneth:
                return @"Gwyneth";
            case AWSPollyVoiceIdMads:
                return @"Mads";
            case AWSPollyVoiceIdNaja:
                return @"Naja";
            case AWSPollyVoiceIdHans:
                return @"Hans";
            case AWSPollyVoiceIdMarlene:
                return @"Marlene";
            case AWSPollyVoiceIdNicole:
                return @"Nicole";
            case AWSPollyVoiceIdRussell:
                return @"Russell";
            case AWSPollyVoiceIdAmy:
                return @"Amy";
            case AWSPollyVoiceIdBrian:
                return @"Brian";
            case AWSPollyVoiceIdEmma:
                return @"Emma";
            case AWSPollyVoiceIdRaveena:
                return @"Raveena";
            case AWSPollyVoiceIdIvy:
                return @"Ivy";
            case AWSPollyVoiceIdJoanna:
                return @"Joanna";
            case AWSPollyVoiceIdJoey:
                return @"Joey";
            case AWSPollyVoiceIdJustin:
                return @"Justin";
            case AWSPollyVoiceIdKendra:
                return @"Kendra";
            case AWSPollyVoiceIdKimberly:
                return @"Kimberly";
            case AWSPollyVoiceIdSalli:
                return @"Salli";
            case AWSPollyVoiceIdConchita:
                return @"Conchita";
            case AWSPollyVoiceIdEnrique:
                return @"Enrique";
            case AWSPollyVoiceIdMiguel:
                return @"Miguel";
            case AWSPollyVoiceIdPenelope:
                return @"Penelope";
            case AWSPollyVoiceIdChantal:
                return @"Chantal";
            case AWSPollyVoiceIdCeline:
                return @"Celine";
            case AWSPollyVoiceIdMathieu:
                return @"Mathieu";
            case AWSPollyVoiceIdDora:
                return @"Dora";
            case AWSPollyVoiceIdKarl:
                return @"Karl";
            case AWSPollyVoiceIdCarla:
                return @"Carla";
            case AWSPollyVoiceIdGiorgio:
                return @"Giorgio";
            case AWSPollyVoiceIdMizuki:
                return @"Mizuki";
            case AWSPollyVoiceIdLiv:
                return @"Liv";
            case AWSPollyVoiceIdLotte:
                return @"Lotte";
            case AWSPollyVoiceIdRuben:
                return @"Ruben";
            case AWSPollyVoiceIdEwa:
                return @"Ewa";
            case AWSPollyVoiceIdJacek:
                return @"Jacek";
            case AWSPollyVoiceIdJan:
                return @"Jan";
            case AWSPollyVoiceIdMaja:
                return @"Maja";
            case AWSPollyVoiceIdRicardo:
                return @"Ricardo";
            case AWSPollyVoiceIdVitoria:
                return @"Vitoria";
            case AWSPollyVoiceIdCristiano:
                return @"Cristiano";
            case AWSPollyVoiceIdInes:
                return @"Ines";
            case AWSPollyVoiceIdCarmen:
                return @"Carmen";
            case AWSPollyVoiceIdMaxim:
                return @"Maxim";
            case AWSPollyVoiceIdTatyana:
                return @"Tatyana";
            case AWSPollyVoiceIdAstrid:
                return @"Astrid";
            case AWSPollyVoiceIdFiliz:
                return @"Filiz";
            case AWSPollyVoiceIdVicki:
                return @"Vicki";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPollySynthesizeSpeechOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioStream" : @"AudioStream",
             @"contentType" : @"ContentType",
             @"requestCharacters" : @"RequestCharacters",
             };
}

@end

@implementation AWSPollyVoice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gender" : @"Gender",
             @"identifier" : @"Id",
             @"languageCode" : @"LanguageCode",
             @"languageName" : @"LanguageName",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)genderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Female"] == NSOrderedSame) {
            return @(AWSPollyGenderFemale);
        }
        if ([value caseInsensitiveCompare:@"Male"] == NSOrderedSame) {
            return @(AWSPollyGenderMale);
        }
        return @(AWSPollyGenderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyGenderFemale:
                return @"Female";
            case AWSPollyGenderMale:
                return @"Male";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)identifierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Geraint"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGeraint);
        }
        if ([value caseInsensitiveCompare:@"Gwyneth"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGwyneth);
        }
        if ([value caseInsensitiveCompare:@"Mads"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMads);
        }
        if ([value caseInsensitiveCompare:@"Naja"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdNaja);
        }
        if ([value caseInsensitiveCompare:@"Hans"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdHans);
        }
        if ([value caseInsensitiveCompare:@"Marlene"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMarlene);
        }
        if ([value caseInsensitiveCompare:@"Nicole"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdNicole);
        }
        if ([value caseInsensitiveCompare:@"Russell"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRussell);
        }
        if ([value caseInsensitiveCompare:@"Amy"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAmy);
        }
        if ([value caseInsensitiveCompare:@"Brian"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdBrian);
        }
        if ([value caseInsensitiveCompare:@"Emma"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEmma);
        }
        if ([value caseInsensitiveCompare:@"Raveena"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRaveena);
        }
        if ([value caseInsensitiveCompare:@"Ivy"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdIvy);
        }
        if ([value caseInsensitiveCompare:@"Joanna"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJoanna);
        }
        if ([value caseInsensitiveCompare:@"Joey"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJoey);
        }
        if ([value caseInsensitiveCompare:@"Justin"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJustin);
        }
        if ([value caseInsensitiveCompare:@"Kendra"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKendra);
        }
        if ([value caseInsensitiveCompare:@"Kimberly"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKimberly);
        }
        if ([value caseInsensitiveCompare:@"Salli"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdSalli);
        }
        if ([value caseInsensitiveCompare:@"Conchita"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdConchita);
        }
        if ([value caseInsensitiveCompare:@"Enrique"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEnrique);
        }
        if ([value caseInsensitiveCompare:@"Miguel"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMiguel);
        }
        if ([value caseInsensitiveCompare:@"Penelope"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdPenelope);
        }
        if ([value caseInsensitiveCompare:@"Chantal"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdChantal);
        }
        if ([value caseInsensitiveCompare:@"Celine"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCeline);
        }
        if ([value caseInsensitiveCompare:@"Mathieu"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMathieu);
        }
        if ([value caseInsensitiveCompare:@"Dora"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdDora);
        }
        if ([value caseInsensitiveCompare:@"Karl"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKarl);
        }
        if ([value caseInsensitiveCompare:@"Carla"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCarla);
        }
        if ([value caseInsensitiveCompare:@"Giorgio"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGiorgio);
        }
        if ([value caseInsensitiveCompare:@"Mizuki"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMizuki);
        }
        if ([value caseInsensitiveCompare:@"Liv"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLiv);
        }
        if ([value caseInsensitiveCompare:@"Lotte"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLotte);
        }
        if ([value caseInsensitiveCompare:@"Ruben"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRuben);
        }
        if ([value caseInsensitiveCompare:@"Ewa"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEwa);
        }
        if ([value caseInsensitiveCompare:@"Jacek"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJacek);
        }
        if ([value caseInsensitiveCompare:@"Jan"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJan);
        }
        if ([value caseInsensitiveCompare:@"Maja"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMaja);
        }
        if ([value caseInsensitiveCompare:@"Ricardo"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRicardo);
        }
        if ([value caseInsensitiveCompare:@"Vitoria"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdVitoria);
        }
        if ([value caseInsensitiveCompare:@"Cristiano"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCristiano);
        }
        if ([value caseInsensitiveCompare:@"Ines"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdInes);
        }
        if ([value caseInsensitiveCompare:@"Carmen"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCarmen);
        }
        if ([value caseInsensitiveCompare:@"Maxim"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMaxim);
        }
        if ([value caseInsensitiveCompare:@"Tatyana"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdTatyana);
        }
        if ([value caseInsensitiveCompare:@"Astrid"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAstrid);
        }
        if ([value caseInsensitiveCompare:@"Filiz"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdFiliz);
        }
        if ([value caseInsensitiveCompare:@"Vicki"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdVicki);
        }
        return @(AWSPollyVoiceIdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyVoiceIdGeraint:
                return @"Geraint";
            case AWSPollyVoiceIdGwyneth:
                return @"Gwyneth";
            case AWSPollyVoiceIdMads:
                return @"Mads";
            case AWSPollyVoiceIdNaja:
                return @"Naja";
            case AWSPollyVoiceIdHans:
                return @"Hans";
            case AWSPollyVoiceIdMarlene:
                return @"Marlene";
            case AWSPollyVoiceIdNicole:
                return @"Nicole";
            case AWSPollyVoiceIdRussell:
                return @"Russell";
            case AWSPollyVoiceIdAmy:
                return @"Amy";
            case AWSPollyVoiceIdBrian:
                return @"Brian";
            case AWSPollyVoiceIdEmma:
                return @"Emma";
            case AWSPollyVoiceIdRaveena:
                return @"Raveena";
            case AWSPollyVoiceIdIvy:
                return @"Ivy";
            case AWSPollyVoiceIdJoanna:
                return @"Joanna";
            case AWSPollyVoiceIdJoey:
                return @"Joey";
            case AWSPollyVoiceIdJustin:
                return @"Justin";
            case AWSPollyVoiceIdKendra:
                return @"Kendra";
            case AWSPollyVoiceIdKimberly:
                return @"Kimberly";
            case AWSPollyVoiceIdSalli:
                return @"Salli";
            case AWSPollyVoiceIdConchita:
                return @"Conchita";
            case AWSPollyVoiceIdEnrique:
                return @"Enrique";
            case AWSPollyVoiceIdMiguel:
                return @"Miguel";
            case AWSPollyVoiceIdPenelope:
                return @"Penelope";
            case AWSPollyVoiceIdChantal:
                return @"Chantal";
            case AWSPollyVoiceIdCeline:
                return @"Celine";
            case AWSPollyVoiceIdMathieu:
                return @"Mathieu";
            case AWSPollyVoiceIdDora:
                return @"Dora";
            case AWSPollyVoiceIdKarl:
                return @"Karl";
            case AWSPollyVoiceIdCarla:
                return @"Carla";
            case AWSPollyVoiceIdGiorgio:
                return @"Giorgio";
            case AWSPollyVoiceIdMizuki:
                return @"Mizuki";
            case AWSPollyVoiceIdLiv:
                return @"Liv";
            case AWSPollyVoiceIdLotte:
                return @"Lotte";
            case AWSPollyVoiceIdRuben:
                return @"Ruben";
            case AWSPollyVoiceIdEwa:
                return @"Ewa";
            case AWSPollyVoiceIdJacek:
                return @"Jacek";
            case AWSPollyVoiceIdJan:
                return @"Jan";
            case AWSPollyVoiceIdMaja:
                return @"Maja";
            case AWSPollyVoiceIdRicardo:
                return @"Ricardo";
            case AWSPollyVoiceIdVitoria:
                return @"Vitoria";
            case AWSPollyVoiceIdCristiano:
                return @"Cristiano";
            case AWSPollyVoiceIdInes:
                return @"Ines";
            case AWSPollyVoiceIdCarmen:
                return @"Carmen";
            case AWSPollyVoiceIdMaxim:
                return @"Maxim";
            case AWSPollyVoiceIdTatyana:
                return @"Tatyana";
            case AWSPollyVoiceIdAstrid:
                return @"Astrid";
            case AWSPollyVoiceIdFiliz:
                return @"Filiz";
            case AWSPollyVoiceIdVicki:
                return @"Vicki";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-GB-WLS"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnGBWLS);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"is-IS"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeIsIS);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"nb-NO"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeNbNO);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pl-PL"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodePlPL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ro-RO"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeRoRO);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"sv-SE"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeSvSE);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeTrTR);
        }
        return @(AWSPollyLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyLanguageCodeCyGB:
                return @"cy-GB";
            case AWSPollyLanguageCodeDaDK:
                return @"da-DK";
            case AWSPollyLanguageCodeDeDE:
                return @"de-DE";
            case AWSPollyLanguageCodeEnAU:
                return @"en-AU";
            case AWSPollyLanguageCodeEnGB:
                return @"en-GB";
            case AWSPollyLanguageCodeEnGBWLS:
                return @"en-GB-WLS";
            case AWSPollyLanguageCodeEnIN:
                return @"en-IN";
            case AWSPollyLanguageCodeEnUS:
                return @"en-US";
            case AWSPollyLanguageCodeEsES:
                return @"es-ES";
            case AWSPollyLanguageCodeEsUS:
                return @"es-US";
            case AWSPollyLanguageCodeFrCA:
                return @"fr-CA";
            case AWSPollyLanguageCodeFrFR:
                return @"fr-FR";
            case AWSPollyLanguageCodeIsIS:
                return @"is-IS";
            case AWSPollyLanguageCodeItIT:
                return @"it-IT";
            case AWSPollyLanguageCodeJaJP:
                return @"ja-JP";
            case AWSPollyLanguageCodeNbNO:
                return @"nb-NO";
            case AWSPollyLanguageCodeNlNL:
                return @"nl-NL";
            case AWSPollyLanguageCodePlPL:
                return @"pl-PL";
            case AWSPollyLanguageCodePtBR:
                return @"pt-BR";
            case AWSPollyLanguageCodePtPT:
                return @"pt-PT";
            case AWSPollyLanguageCodeRoRO:
                return @"ro-RO";
            case AWSPollyLanguageCodeRuRU:
                return @"ru-RU";
            case AWSPollyLanguageCodeSvSE:
                return @"sv-SE";
            case AWSPollyLanguageCodeTrTR:
                return @"tr-TR";
            default:
                return nil;
        }
    }];
}

@end
