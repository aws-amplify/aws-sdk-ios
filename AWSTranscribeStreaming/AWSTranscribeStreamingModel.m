//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSTranscribeStreamingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSTranscribeStreamingErrorDomain = @"com.amazonaws.AWSTranscribeStreamingErrorDomain";

@implementation AWSTranscribeStreamingAlternative

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"transcript" : @"Transcript",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeStreamingItem class]];
}

@end

@implementation AWSTranscribeStreamingAudioEvent

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioChunk" : @"AudioChunk",
             };
}

@end

@implementation AWSTranscribeStreamingAudioStream

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioEvent" : @"AudioEvent",
             };
}

+ (NSValueTransformer *)audioEventJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeStreamingAudioEvent class]];
}

@end

@implementation AWSTranscribeStreamingItem

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"endTime" : @"EndTime",
             @"startTime" : @"StartTime",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRONUNCIATION"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingItemTypePronunciation);
        }
        if ([value caseInsensitiveCompare:@"PUNCTUATION"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingItemTypePunctuation);
        }
        return @(AWSTranscribeStreamingItemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeStreamingItemTypePronunciation:
                return @"PRONUNCIATION";
            case AWSTranscribeStreamingItemTypePunctuation:
                return @"PUNCTUATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeStreamingResult

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alternatives" : @"Alternatives",
             @"endTime" : @"EndTime",
             @"isPartial" : @"IsPartial",
             @"resultId" : @"ResultId",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)alternativesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeStreamingAlternative class]];
}

@end

@implementation AWSTranscribeStreamingStartStreamTranscriptionRequest

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioStream" : @"AudioStream",
             @"languageCode" : @"LanguageCode",
             @"mediaEncoding" : @"MediaEncoding",
             @"mediaSampleRateHertz" : @"MediaSampleRateHertz",
             @"sessionId" : @"SessionId",
             @"vocabularyName" : @"VocabularyName",
             };
}

+ (NSValueTransformer *)audioStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeStreamingAudioStream class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"th-TH"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeThTH);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ca-ES"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeCaES);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"zh-HK"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeZhHK);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"no-NO"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeNoNO);
        }
        if ([value caseInsensitiveCompare:@"sv-SE"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeSvSE);
        }
        if ([value caseInsensitiveCompare:@"pl-PL"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodePlPL);
        }
        if ([value caseInsensitiveCompare:@"fi-FI"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeFiFI);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeZhTW);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-NZ"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnNZ);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnZA);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"eu-ES"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEuES);
        }
        if ([value caseInsensitiveCompare:@"hr-HR"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeHrHR);
        }
        if ([value caseInsensitiveCompare:@"cs-CZ"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeCsCZ);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"gl-ES"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeGlES);
        }
        if ([value caseInsensitiveCompare:@"el-GR"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeElGR);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"lv-LV"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeLvLV);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ro-RO"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeRoRO);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"sr-RS"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeSrRS);
        }
        if ([value caseInsensitiveCompare:@"sk-SK"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeSkSK);
        }
        if ([value caseInsensitiveCompare:@"so-SO"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeSoSO);
        }
        if ([value caseInsensitiveCompare:@"tl-PH"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeTlPH);
        }
        if ([value caseInsensitiveCompare:@"uk-UA"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeUkUA);
        }
        if ([value caseInsensitiveCompare:@"vi-VN"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeViVN);
        }
        if ([value caseInsensitiveCompare:@"zu-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeZuZA);
        }
        return @(AWSTranscribeStreamingLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeStreamingLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeStreamingLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeStreamingLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeStreamingLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeStreamingLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeStreamingLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeStreamingLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeStreamingLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeStreamingLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeStreamingLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeStreamingLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeStreamingLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeStreamingLanguageCodeThTH:
                return @"th-TH";
            case AWSTranscribeStreamingLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeStreamingLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeStreamingLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeStreamingLanguageCodeCaES:
                return @"ca-ES";
            case AWSTranscribeStreamingLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeStreamingLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeStreamingLanguageCodeZhHK:
                return @"zh-HK";
            case AWSTranscribeStreamingLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeStreamingLanguageCodeNoNO:
                return @"no-NO";
            case AWSTranscribeStreamingLanguageCodeSvSE:
                return @"sv-SE";
            case AWSTranscribeStreamingLanguageCodePlPL:
                return @"pl-PL";
            case AWSTranscribeStreamingLanguageCodeFiFI:
                return @"fi-FI";
            case AWSTranscribeStreamingLanguageCodeZhTW:
                return @"zh-TW";
            case AWSTranscribeStreamingLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeStreamingLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeStreamingLanguageCodeEnNZ:
                return @"en-NZ";
            case AWSTranscribeStreamingLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeStreamingLanguageCodeEnZA:
                return @"en-ZA";
            case AWSTranscribeStreamingLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeStreamingLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeStreamingLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeStreamingLanguageCodeEuES:
                return @"eu-ES";
            case AWSTranscribeStreamingLanguageCodeHrHR:
                return @"hr-HR";
            case AWSTranscribeStreamingLanguageCodeCsCZ:
                return @"cs-CZ";
            case AWSTranscribeStreamingLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeStreamingLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeStreamingLanguageCodeGlES:
                return @"gl-ES";
            case AWSTranscribeStreamingLanguageCodeElGR:
                return @"el-GR";
            case AWSTranscribeStreamingLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeStreamingLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeStreamingLanguageCodeLvLV:
                return @"lv-LV";
            case AWSTranscribeStreamingLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeStreamingLanguageCodeRoRO:
                return @"ro-RO";
            case AWSTranscribeStreamingLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeStreamingLanguageCodeSrRS:
                return @"sr-RS";
            case AWSTranscribeStreamingLanguageCodeSkSK:
                return @"sk-SK";
            case AWSTranscribeStreamingLanguageCodeSoSO:
                return @"so-SO";
            case AWSTranscribeStreamingLanguageCodeTlPH:
                return @"tl-PH";
            case AWSTranscribeStreamingLanguageCodeUkUA:
                return @"uk-UA";
            case AWSTranscribeStreamingLanguageCodeViVN:
                return @"vi-VN";
            case AWSTranscribeStreamingLanguageCodeZuZA:
                return @"zu-ZA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mediaEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pcm"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingMediaEncodingPcm);
        }
        return @(AWSTranscribeStreamingMediaEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeStreamingMediaEncodingPcm:
                return @"pcm";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeStreamingStartStreamTranscriptionResponse

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"mediaEncoding" : @"MediaEncoding",
             @"mediaSampleRateHertz" : @"MediaSampleRateHertz",
             @"requestId" : @"RequestId",
             @"sessionId" : @"SessionId",
             @"transcriptResultStream" : @"TranscriptResultStream",
             @"vocabularyName" : @"VocabularyName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"th-TH"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeThTH);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ca-ES"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeCaES);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"zh-HK"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeZhHK);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"no-NO"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeNoNO);
        }
        if ([value caseInsensitiveCompare:@"sv-SE"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeSvSE);
        }
        if ([value caseInsensitiveCompare:@"pl-PL"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodePlPL);
        }
        if ([value caseInsensitiveCompare:@"fi-FI"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeFiFI);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeZhTW);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-NZ"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnNZ);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnZA);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"eu-ES"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeEuES);
        }
        if ([value caseInsensitiveCompare:@"hr-HR"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeHrHR);
        }
        if ([value caseInsensitiveCompare:@"cs-CZ"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeCsCZ);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"gl-ES"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeGlES);
        }
        if ([value caseInsensitiveCompare:@"el-GR"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeElGR);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"lv-LV"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeLvLV);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ro-RO"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeRoRO);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"sr-RS"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeSrRS);
        }
        if ([value caseInsensitiveCompare:@"sk-SK"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeSkSK);
        }
        if ([value caseInsensitiveCompare:@"so-SO"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeSoSO);
        }
        if ([value caseInsensitiveCompare:@"tl-PH"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeTlPH);
        }
        if ([value caseInsensitiveCompare:@"uk-UA"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeUkUA);
        }
        if ([value caseInsensitiveCompare:@"vi-VN"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeViVN);
        }
        if ([value caseInsensitiveCompare:@"zu-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeStreamingLanguageCodeZuZA);
        }
        return @(AWSTranscribeStreamingLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeStreamingLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeStreamingLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeStreamingLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeStreamingLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeStreamingLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeStreamingLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeStreamingLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeStreamingLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeStreamingLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeStreamingLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeStreamingLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeStreamingLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeStreamingLanguageCodeThTH:
                return @"th-TH";
            case AWSTranscribeStreamingLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeStreamingLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeStreamingLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeStreamingLanguageCodeCaES:
                return @"ca-ES";
            case AWSTranscribeStreamingLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeStreamingLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeStreamingLanguageCodeZhHK:
                return @"zh-HK";
            case AWSTranscribeStreamingLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeStreamingLanguageCodeNoNO:
                return @"no-NO";
            case AWSTranscribeStreamingLanguageCodeSvSE:
                return @"sv-SE";
            case AWSTranscribeStreamingLanguageCodePlPL:
                return @"pl-PL";
            case AWSTranscribeStreamingLanguageCodeFiFI:
                return @"fi-FI";
            case AWSTranscribeStreamingLanguageCodeZhTW:
                return @"zh-TW";
            case AWSTranscribeStreamingLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeStreamingLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeStreamingLanguageCodeEnNZ:
                return @"en-NZ";
            case AWSTranscribeStreamingLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeStreamingLanguageCodeEnZA:
                return @"en-ZA";
            case AWSTranscribeStreamingLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeStreamingLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeStreamingLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeStreamingLanguageCodeEuES:
                return @"eu-ES";
            case AWSTranscribeStreamingLanguageCodeHrHR:
                return @"hr-HR";
            case AWSTranscribeStreamingLanguageCodeCsCZ:
                return @"cs-CZ";
            case AWSTranscribeStreamingLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeStreamingLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeStreamingLanguageCodeGlES:
                return @"gl-ES";
            case AWSTranscribeStreamingLanguageCodeElGR:
                return @"el-GR";
            case AWSTranscribeStreamingLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeStreamingLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeStreamingLanguageCodeLvLV:
                return @"lv-LV";
            case AWSTranscribeStreamingLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeStreamingLanguageCodeRoRO:
                return @"ro-RO";
            case AWSTranscribeStreamingLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeStreamingLanguageCodeSrRS:
                return @"sr-RS";
            case AWSTranscribeStreamingLanguageCodeSkSK:
                return @"sk-SK";
            case AWSTranscribeStreamingLanguageCodeSoSO:
                return @"so-SO";
            case AWSTranscribeStreamingLanguageCodeTlPH:
                return @"tl-PH";
            case AWSTranscribeStreamingLanguageCodeUkUA:
                return @"uk-UA";
            case AWSTranscribeStreamingLanguageCodeViVN:
                return @"vi-VN";
            case AWSTranscribeStreamingLanguageCodeZuZA:
                return @"zu-ZA";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transcriptResultStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeStreamingTranscriptResultStream class]];
}

@end

@implementation AWSTranscribeStreamingTranscript

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeStreamingResult class]];
}

@end

@implementation AWSTranscribeStreamingTranscriptEvent

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transcript" : @"Transcript",
             };
}

+ (NSValueTransformer *)transcriptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeStreamingTranscript class]];
}

@end

@implementation AWSTranscribeStreamingTranscriptResultStream

+ (BOOL) supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"badRequestException" : @"BadRequestException",
             @"conflictException" : @"ConflictException",
             @"internalFailureException" : @"InternalFailureException",
             @"limitExceededException" : @"LimitExceededException",
             @"serviceUnavailableException" : @"ServiceUnavailableException",
             @"transcriptEvent" : @"TranscriptEvent",
             };
}

+ (NSValueTransformer *)transcriptEventJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeStreamingTranscriptEvent class]];
}

@end
