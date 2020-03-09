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

#import "AWSTranscribeModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSTranscribeErrorDomain = @"com.amazonaws.AWSTranscribeErrorDomain";

@implementation AWSTranscribeContentRedaction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"redactionOutput" : @"RedactionOutput",
             @"redactionType" : @"RedactionType",
             };
}

+ (NSValueTransformer *)redactionOutputJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"redacted"] == NSOrderedSame) {
            return @(AWSTranscribeRedactionOutputRedacted);
        }
        if ([value caseInsensitiveCompare:@"redacted_and_unredacted"] == NSOrderedSame) {
            return @(AWSTranscribeRedactionOutputRedactedAndUnredacted);
        }
        return @(AWSTranscribeRedactionOutputUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeRedactionOutputRedacted:
                return @"redacted";
            case AWSTranscribeRedactionOutputRedactedAndUnredacted:
                return @"redacted_and_unredacted";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)redactionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PII"] == NSOrderedSame) {
            return @(AWSTranscribeRedactionTypePii);
        }
        return @(AWSTranscribeRedactionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeRedactionTypePii:
                return @"PII";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeCreateVocabularyFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"vocabularyFilterFileUri" : @"VocabularyFilterFileUri",
             @"vocabularyFilterName" : @"VocabularyFilterName",
             @"words" : @"Words",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeCreateVocabularyFilterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"vocabularyFilterName" : @"VocabularyFilterName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSTranscribeCreateVocabularyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"phrases" : @"Phrases",
             @"vocabularyFileUri" : @"VocabularyFileUri",
             @"vocabularyName" : @"VocabularyName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeCreateVocabularyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureReason" : @"FailureReason",
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"vocabularyName" : @"VocabularyName",
             @"vocabularyState" : @"VocabularyState",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vocabularyStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStatePending);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStateReady);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStateFailed);
        }
        return @(AWSTranscribeVocabularyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeVocabularyStatePending:
                return @"PENDING";
            case AWSTranscribeVocabularyStateReady:
                return @"READY";
            case AWSTranscribeVocabularyStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeDeleteTranscriptionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transcriptionJobName" : @"TranscriptionJobName",
             };
}

@end

@implementation AWSTranscribeDeleteVocabularyFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vocabularyFilterName" : @"VocabularyFilterName",
             };
}

@end

@implementation AWSTranscribeDeleteVocabularyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vocabularyName" : @"VocabularyName",
             };
}

@end

@implementation AWSTranscribeGetTranscriptionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transcriptionJobName" : @"TranscriptionJobName",
             };
}

@end

@implementation AWSTranscribeGetTranscriptionJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transcriptionJob" : @"TranscriptionJob",
             };
}

+ (NSValueTransformer *)transcriptionJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeTranscriptionJob class]];
}

@end

@implementation AWSTranscribeGetVocabularyFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vocabularyFilterName" : @"VocabularyFilterName",
             };
}

@end

@implementation AWSTranscribeGetVocabularyFilterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"downloadUri" : @"DownloadUri",
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"vocabularyFilterName" : @"VocabularyFilterName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSTranscribeGetVocabularyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vocabularyName" : @"VocabularyName",
             };
}

@end

@implementation AWSTranscribeGetVocabularyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"downloadUri" : @"DownloadUri",
             @"failureReason" : @"FailureReason",
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"vocabularyName" : @"VocabularyName",
             @"vocabularyState" : @"VocabularyState",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vocabularyStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStatePending);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStateReady);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStateFailed);
        }
        return @(AWSTranscribeVocabularyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeVocabularyStatePending:
                return @"PENDING";
            case AWSTranscribeVocabularyStateReady:
                return @"READY";
            case AWSTranscribeVocabularyStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeJobExecutionSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowDeferredExecution" : @"AllowDeferredExecution",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             };
}

@end

@implementation AWSTranscribeListTranscriptionJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobNameContains" : @"JobNameContains",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusCompleted);
        }
        return @(AWSTranscribeTranscriptionJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeTranscriptionJobStatusQueued:
                return @"QUEUED";
            case AWSTranscribeTranscriptionJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTranscribeTranscriptionJobStatusFailed:
                return @"FAILED";
            case AWSTranscribeTranscriptionJobStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeListTranscriptionJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"status" : @"Status",
             @"transcriptionJobSummaries" : @"TranscriptionJobSummaries",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusCompleted);
        }
        return @(AWSTranscribeTranscriptionJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeTranscriptionJobStatusQueued:
                return @"QUEUED";
            case AWSTranscribeTranscriptionJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTranscribeTranscriptionJobStatusFailed:
                return @"FAILED";
            case AWSTranscribeTranscriptionJobStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transcriptionJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeTranscriptionJobSummary class]];
}

@end

@implementation AWSTranscribeListVocabulariesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"stateEquals" : @"StateEquals",
             };
}

+ (NSValueTransformer *)stateEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStatePending);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStateReady);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStateFailed);
        }
        return @(AWSTranscribeVocabularyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeVocabularyStatePending:
                return @"PENDING";
            case AWSTranscribeVocabularyStateReady:
                return @"READY";
            case AWSTranscribeVocabularyStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeListVocabulariesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"status" : @"Status",
             @"vocabularies" : @"Vocabularies",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusCompleted);
        }
        return @(AWSTranscribeTranscriptionJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeTranscriptionJobStatusQueued:
                return @"QUEUED";
            case AWSTranscribeTranscriptionJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTranscribeTranscriptionJobStatusFailed:
                return @"FAILED";
            case AWSTranscribeTranscriptionJobStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vocabulariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeVocabularyInfo class]];
}

@end

@implementation AWSTranscribeListVocabularyFiltersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSTranscribeListVocabularyFiltersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"vocabularyFilters" : @"VocabularyFilters",
             };
}

+ (NSValueTransformer *)vocabularyFiltersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeVocabularyFilterInfo class]];
}

@end

@implementation AWSTranscribeMedia

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mediaFileUri" : @"MediaFileUri",
             };
}

@end

@implementation AWSTranscribeSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelIdentification" : @"ChannelIdentification",
             @"maxAlternatives" : @"MaxAlternatives",
             @"maxSpeakerLabels" : @"MaxSpeakerLabels",
             @"showAlternatives" : @"ShowAlternatives",
             @"showSpeakerLabels" : @"ShowSpeakerLabels",
             @"vocabularyFilterMethod" : @"VocabularyFilterMethod",
             @"vocabularyFilterName" : @"VocabularyFilterName",
             @"vocabularyName" : @"VocabularyName",
             };
}

+ (NSValueTransformer *)vocabularyFilterMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"remove"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyFilterMethodRemove);
        }
        if ([value caseInsensitiveCompare:@"mask"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyFilterMethodMask);
        }
        return @(AWSTranscribeVocabularyFilterMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeVocabularyFilterMethodRemove:
                return @"remove";
            case AWSTranscribeVocabularyFilterMethodMask:
                return @"mask";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeStartTranscriptionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentRedaction" : @"ContentRedaction",
             @"jobExecutionSettings" : @"JobExecutionSettings",
             @"languageCode" : @"LanguageCode",
             @"media" : @"Media",
             @"mediaFormat" : @"MediaFormat",
             @"mediaSampleRateHertz" : @"MediaSampleRateHertz",
             @"outputBucketName" : @"OutputBucketName",
             @"outputEncryptionKMSKeyId" : @"OutputEncryptionKMSKeyId",
             @"settings" : @"Settings",
             @"transcriptionJobName" : @"TranscriptionJobName",
             };
}

+ (NSValueTransformer *)contentRedactionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeContentRedaction class]];
}

+ (NSValueTransformer *)jobExecutionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeJobExecutionSettings class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mediaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeMedia class]];
}

+ (NSValueTransformer *)mediaFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"mp3"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatMp3);
        }
        if ([value caseInsensitiveCompare:@"mp4"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatMp4);
        }
        if ([value caseInsensitiveCompare:@"wav"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatWav);
        }
        if ([value caseInsensitiveCompare:@"flac"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatFlac);
        }
        return @(AWSTranscribeMediaFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeMediaFormatMp3:
                return @"mp3";
            case AWSTranscribeMediaFormatMp4:
                return @"mp4";
            case AWSTranscribeMediaFormatWav:
                return @"wav";
            case AWSTranscribeMediaFormatFlac:
                return @"flac";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeSettings class]];
}

@end

@implementation AWSTranscribeStartTranscriptionJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transcriptionJob" : @"TranscriptionJob",
             };
}

+ (NSValueTransformer *)transcriptionJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeTranscriptionJob class]];
}

@end

@implementation AWSTranscribeTranscript

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"redactedTranscriptFileUri" : @"RedactedTranscriptFileUri",
             @"transcriptFileUri" : @"TranscriptFileUri",
             };
}

@end

@implementation AWSTranscribeTranscriptionJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionTime" : @"CompletionTime",
             @"contentRedaction" : @"ContentRedaction",
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"jobExecutionSettings" : @"JobExecutionSettings",
             @"languageCode" : @"LanguageCode",
             @"media" : @"Media",
             @"mediaFormat" : @"MediaFormat",
             @"mediaSampleRateHertz" : @"MediaSampleRateHertz",
             @"settings" : @"Settings",
             @"startTime" : @"StartTime",
             @"transcript" : @"Transcript",
             @"transcriptionJobName" : @"TranscriptionJobName",
             @"transcriptionJobStatus" : @"TranscriptionJobStatus",
             };
}

+ (NSValueTransformer *)completionTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)contentRedactionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeContentRedaction class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)jobExecutionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeJobExecutionSettings class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mediaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeMedia class]];
}

+ (NSValueTransformer *)mediaFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"mp3"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatMp3);
        }
        if ([value caseInsensitiveCompare:@"mp4"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatMp4);
        }
        if ([value caseInsensitiveCompare:@"wav"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatWav);
        }
        if ([value caseInsensitiveCompare:@"flac"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatFlac);
        }
        return @(AWSTranscribeMediaFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeMediaFormatMp3:
                return @"mp3";
            case AWSTranscribeMediaFormatMp4:
                return @"mp4";
            case AWSTranscribeMediaFormatWav:
                return @"wav";
            case AWSTranscribeMediaFormatFlac:
                return @"flac";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeSettings class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)transcriptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeTranscript class]];
}

+ (NSValueTransformer *)transcriptionJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusCompleted);
        }
        return @(AWSTranscribeTranscriptionJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeTranscriptionJobStatusQueued:
                return @"QUEUED";
            case AWSTranscribeTranscriptionJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTranscribeTranscriptionJobStatusFailed:
                return @"FAILED";
            case AWSTranscribeTranscriptionJobStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeTranscriptionJobSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionTime" : @"CompletionTime",
             @"contentRedaction" : @"ContentRedaction",
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"languageCode" : @"LanguageCode",
             @"outputLocationType" : @"OutputLocationType",
             @"startTime" : @"StartTime",
             @"transcriptionJobName" : @"TranscriptionJobName",
             @"transcriptionJobStatus" : @"TranscriptionJobStatus",
             };
}

+ (NSValueTransformer *)completionTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)contentRedactionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeContentRedaction class]];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputLocationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CUSTOMER_BUCKET"] == NSOrderedSame) {
            return @(AWSTranscribeOutputLocationTypeCustomerBucket);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_BUCKET"] == NSOrderedSame) {
            return @(AWSTranscribeOutputLocationTypeServiceBucket);
        }
        return @(AWSTranscribeOutputLocationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeOutputLocationTypeCustomerBucket:
                return @"CUSTOMER_BUCKET";
            case AWSTranscribeOutputLocationTypeServiceBucket:
                return @"SERVICE_BUCKET";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)transcriptionJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"QUEUED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusQueued);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSTranscribeTranscriptionJobStatusCompleted);
        }
        return @(AWSTranscribeTranscriptionJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeTranscriptionJobStatusQueued:
                return @"QUEUED";
            case AWSTranscribeTranscriptionJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTranscribeTranscriptionJobStatusFailed:
                return @"FAILED";
            case AWSTranscribeTranscriptionJobStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeUpdateVocabularyFilterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vocabularyFilterFileUri" : @"VocabularyFilterFileUri",
             @"vocabularyFilterName" : @"VocabularyFilterName",
             @"words" : @"Words",
             };
}

@end

@implementation AWSTranscribeUpdateVocabularyFilterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"vocabularyFilterName" : @"VocabularyFilterName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSTranscribeUpdateVocabularyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"phrases" : @"Phrases",
             @"vocabularyFileUri" : @"VocabularyFileUri",
             @"vocabularyName" : @"VocabularyName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeUpdateVocabularyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"vocabularyName" : @"VocabularyName",
             @"vocabularyState" : @"VocabularyState",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vocabularyStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStatePending);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStateReady);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStateFailed);
        }
        return @(AWSTranscribeVocabularyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeVocabularyStatePending:
                return @"PENDING";
            case AWSTranscribeVocabularyStateReady:
                return @"READY";
            case AWSTranscribeVocabularyStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeVocabularyFilterInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"vocabularyFilterName" : @"VocabularyFilterName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSTranscribeVocabularyInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"vocabularyName" : @"VocabularyName",
             @"vocabularyState" : @"VocabularyState",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vocabularyStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStatePending);
        }
        if ([value caseInsensitiveCompare:@"READY"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStateReady);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranscribeVocabularyStateFailed);
        }
        return @(AWSTranscribeVocabularyStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeVocabularyStatePending:
                return @"PENDING";
            case AWSTranscribeVocabularyStateReady:
                return @"READY";
            case AWSTranscribeVocabularyStateFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end
