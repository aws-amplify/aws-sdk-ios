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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSTranscribeCreateLanguageModelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baseModelName" : @"BaseModelName",
             @"inputDataConfig" : @"InputDataConfig",
             @"languageCode" : @"LanguageCode",
             @"modelName" : @"ModelName",
             };
}

+ (NSValueTransformer *)baseModelNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NarrowBand"] == NSOrderedSame) {
            return @(AWSTranscribeBaseModelNameNarrowBand);
        }
        if ([value caseInsensitiveCompare:@"WideBand"] == NSOrderedSame) {
            return @(AWSTranscribeBaseModelNameWideBand);
        }
        return @(AWSTranscribeBaseModelNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeBaseModelNameNarrowBand:
                return @"NarrowBand";
            case AWSTranscribeBaseModelNameWideBand:
                return @"WideBand";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeCLMLanguageCodeEnUS);
        }
        return @(AWSTranscribeCLMLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeCLMLanguageCodeEnUS:
                return @"en-US";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeCreateLanguageModelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baseModelName" : @"BaseModelName",
             @"inputDataConfig" : @"InputDataConfig",
             @"languageCode" : @"LanguageCode",
             @"modelName" : @"ModelName",
             @"modelStatus" : @"ModelStatus",
             };
}

+ (NSValueTransformer *)baseModelNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NarrowBand"] == NSOrderedSame) {
            return @(AWSTranscribeBaseModelNameNarrowBand);
        }
        if ([value caseInsensitiveCompare:@"WideBand"] == NSOrderedSame) {
            return @(AWSTranscribeBaseModelNameWideBand);
        }
        return @(AWSTranscribeBaseModelNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeBaseModelNameNarrowBand:
                return @"NarrowBand";
            case AWSTranscribeBaseModelNameWideBand:
                return @"WideBand";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeCLMLanguageCodeEnUS);
        }
        return @(AWSTranscribeCLMLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeCLMLanguageCodeEnUS:
                return @"en-US";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modelStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTranscribeModelStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranscribeModelStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSTranscribeModelStatusCompleted);
        }
        return @(AWSTranscribeModelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeModelStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTranscribeModelStatusFailed:
                return @"FAILED";
            case AWSTranscribeModelStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeCreateMedicalVocabularyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"vocabularyFileUri" : @"VocabularyFileUri",
             @"vocabularyName" : @"VocabularyName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeCreateMedicalVocabularyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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

@implementation AWSTranscribeCreateVocabularyFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeCreateVocabularyFilterResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"vocabularyFilterName" : @"VocabularyFilterName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeCreateVocabularyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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

@implementation AWSTranscribeDeleteLanguageModelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelName" : @"ModelName",
             };
}

@end

@implementation AWSTranscribeDeleteMedicalTranscriptionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"medicalTranscriptionJobName" : @"MedicalTranscriptionJobName",
             };
}

@end

@implementation AWSTranscribeDeleteMedicalVocabularyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vocabularyName" : @"VocabularyName",
             };
}

@end

@implementation AWSTranscribeDeleteTranscriptionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transcriptionJobName" : @"TranscriptionJobName",
             };
}

@end

@implementation AWSTranscribeDeleteVocabularyFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vocabularyFilterName" : @"VocabularyFilterName",
             };
}

@end

@implementation AWSTranscribeDeleteVocabularyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vocabularyName" : @"VocabularyName",
             };
}

@end

@implementation AWSTranscribeDescribeLanguageModelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelName" : @"ModelName",
             };
}

@end

@implementation AWSTranscribeDescribeLanguageModelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageModel" : @"LanguageModel",
             };
}

+ (NSValueTransformer *)languageModelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeLanguageModel class]];
}

@end

@implementation AWSTranscribeGetMedicalTranscriptionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"medicalTranscriptionJobName" : @"MedicalTranscriptionJobName",
             };
}

@end

@implementation AWSTranscribeGetMedicalTranscriptionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"medicalTranscriptionJob" : @"MedicalTranscriptionJob",
             };
}

+ (NSValueTransformer *)medicalTranscriptionJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeMedicalTranscriptionJob class]];
}

@end

@implementation AWSTranscribeGetMedicalVocabularyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vocabularyName" : @"VocabularyName",
             };
}

@end

@implementation AWSTranscribeGetMedicalVocabularyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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

@implementation AWSTranscribeGetTranscriptionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transcriptionJobName" : @"TranscriptionJobName",
             };
}

@end

@implementation AWSTranscribeGetTranscriptionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vocabularyFilterName" : @"VocabularyFilterName",
             };
}

@end

@implementation AWSTranscribeGetVocabularyFilterResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vocabularyName" : @"VocabularyName",
             };
}

@end

@implementation AWSTranscribeGetVocabularyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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

@implementation AWSTranscribeInputDataConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"s3Uri" : @"S3Uri",
             @"tuningDataS3Uri" : @"TuningDataS3Uri",
             };
}

@end

@implementation AWSTranscribeJobExecutionSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowDeferredExecution" : @"AllowDeferredExecution",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             };
}

@end

@implementation AWSTranscribeLanguageModel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baseModelName" : @"BaseModelName",
             @"createTime" : @"CreateTime",
             @"failureReason" : @"FailureReason",
             @"inputDataConfig" : @"InputDataConfig",
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"modelName" : @"ModelName",
             @"modelStatus" : @"ModelStatus",
             @"upgradeAvailability" : @"UpgradeAvailability",
             };
}

+ (NSValueTransformer *)baseModelNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NarrowBand"] == NSOrderedSame) {
            return @(AWSTranscribeBaseModelNameNarrowBand);
        }
        if ([value caseInsensitiveCompare:@"WideBand"] == NSOrderedSame) {
            return @(AWSTranscribeBaseModelNameWideBand);
        }
        return @(AWSTranscribeBaseModelNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeBaseModelNameNarrowBand:
                return @"NarrowBand";
            case AWSTranscribeBaseModelNameWideBand:
                return @"WideBand";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeCLMLanguageCodeEnUS);
        }
        return @(AWSTranscribeCLMLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeCLMLanguageCodeEnUS:
                return @"en-US";
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

+ (NSValueTransformer *)modelStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTranscribeModelStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranscribeModelStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSTranscribeModelStatusCompleted);
        }
        return @(AWSTranscribeModelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeModelStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTranscribeModelStatusFailed:
                return @"FAILED";
            case AWSTranscribeModelStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeListLanguageModelsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             @"statusEquals" : @"StatusEquals",
             };
}

+ (NSValueTransformer *)statusEqualsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTranscribeModelStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranscribeModelStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSTranscribeModelStatusCompleted);
        }
        return @(AWSTranscribeModelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeModelStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTranscribeModelStatusFailed:
                return @"FAILED";
            case AWSTranscribeModelStatusCompleted:
                return @"COMPLETED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeListLanguageModelsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"models" : @"Models",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)modelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeLanguageModel class]];
}

@end

@implementation AWSTranscribeListMedicalTranscriptionJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSTranscribeListMedicalTranscriptionJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"medicalTranscriptionJobSummaries" : @"MedicalTranscriptionJobSummaries",
             @"nextToken" : @"NextToken",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)medicalTranscriptionJobSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeMedicalTranscriptionJobSummary class]];
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

@implementation AWSTranscribeListMedicalVocabulariesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSTranscribeListMedicalVocabulariesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"status" : @"Status",
             @"vocabularies" : @"Vocabularies",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
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

+ (NSValueTransformer *)vocabulariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeVocabularyInfo class]];
}

@end

@implementation AWSTranscribeListTranscriptionJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"status" : @"Status",
             @"vocabularies" : @"Vocabularies",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
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

+ (NSValueTransformer *)vocabulariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribeVocabularyInfo class]];
}

@end

@implementation AWSTranscribeListVocabularyFiltersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nameContains" : @"NameContains",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSTranscribeListVocabularyFiltersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mediaFileUri" : @"MediaFileUri",
             };
}

@end

@implementation AWSTranscribeMedicalTranscript

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transcriptFileUri" : @"TranscriptFileUri",
             };
}

@end

@implementation AWSTranscribeMedicalTranscriptionJob

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionTime" : @"CompletionTime",
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"languageCode" : @"LanguageCode",
             @"media" : @"Media",
             @"mediaFormat" : @"MediaFormat",
             @"mediaSampleRateHertz" : @"MediaSampleRateHertz",
             @"medicalTranscriptionJobName" : @"MedicalTranscriptionJobName",
             @"settings" : @"Settings",
             @"specialty" : @"Specialty",
             @"startTime" : @"StartTime",
             @"transcript" : @"Transcript",
             @"transcriptionJobStatus" : @"TranscriptionJobStatus",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)completionTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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
        if ([value caseInsensitiveCompare:@"ogg"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatOgg);
        }
        if ([value caseInsensitiveCompare:@"amr"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatAmr);
        }
        if ([value caseInsensitiveCompare:@"webm"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatWebm);
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
            case AWSTranscribeMediaFormatOgg:
                return @"ogg";
            case AWSTranscribeMediaFormatAmr:
                return @"amr";
            case AWSTranscribeMediaFormatWebm:
                return @"webm";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeMedicalTranscriptionSetting class]];
}

+ (NSValueTransformer *)specialtyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRIMARYCARE"] == NSOrderedSame) {
            return @(AWSTranscribeSpecialtyPrimarycare);
        }
        return @(AWSTranscribeSpecialtyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeSpecialtyPrimarycare:
                return @"PRIMARYCARE";
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

+ (NSValueTransformer *)transcriptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeMedicalTranscript class]];
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

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERSATION"] == NSOrderedSame) {
            return @(AWSTranscribeTypesConversation);
        }
        if ([value caseInsensitiveCompare:@"DICTATION"] == NSOrderedSame) {
            return @(AWSTranscribeTypesDictation);
        }
        return @(AWSTranscribeTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeTypesConversation:
                return @"CONVERSATION";
            case AWSTranscribeTypesDictation:
                return @"DICTATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeMedicalTranscriptionJobSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionTime" : @"CompletionTime",
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"languageCode" : @"LanguageCode",
             @"medicalTranscriptionJobName" : @"MedicalTranscriptionJobName",
             @"outputLocationType" : @"OutputLocationType",
             @"specialty" : @"Specialty",
             @"startTime" : @"StartTime",
             @"transcriptionJobStatus" : @"TranscriptionJobStatus",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)completionTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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

+ (NSValueTransformer *)specialtyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRIMARYCARE"] == NSOrderedSame) {
            return @(AWSTranscribeSpecialtyPrimarycare);
        }
        return @(AWSTranscribeSpecialtyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeSpecialtyPrimarycare:
                return @"PRIMARYCARE";
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

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERSATION"] == NSOrderedSame) {
            return @(AWSTranscribeTypesConversation);
        }
        if ([value caseInsensitiveCompare:@"DICTATION"] == NSOrderedSame) {
            return @(AWSTranscribeTypesDictation);
        }
        return @(AWSTranscribeTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeTypesConversation:
                return @"CONVERSATION";
            case AWSTranscribeTypesDictation:
                return @"DICTATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeMedicalTranscriptionSetting

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelIdentification" : @"ChannelIdentification",
             @"maxAlternatives" : @"MaxAlternatives",
             @"maxSpeakerLabels" : @"MaxSpeakerLabels",
             @"showAlternatives" : @"ShowAlternatives",
             @"showSpeakerLabels" : @"ShowSpeakerLabels",
             @"vocabularyName" : @"VocabularyName",
             };
}

@end

@implementation AWSTranscribeModelSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageModelName" : @"LanguageModelName",
             };
}

@end

@implementation AWSTranscribeSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSTranscribeStartMedicalTranscriptionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"media" : @"Media",
             @"mediaFormat" : @"MediaFormat",
             @"mediaSampleRateHertz" : @"MediaSampleRateHertz",
             @"medicalTranscriptionJobName" : @"MedicalTranscriptionJobName",
             @"outputBucketName" : @"OutputBucketName",
             @"outputEncryptionKMSKeyId" : @"OutputEncryptionKMSKeyId",
             @"outputKey" : @"OutputKey",
             @"settings" : @"Settings",
             @"specialty" : @"Specialty",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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
        if ([value caseInsensitiveCompare:@"ogg"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatOgg);
        }
        if ([value caseInsensitiveCompare:@"amr"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatAmr);
        }
        if ([value caseInsensitiveCompare:@"webm"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatWebm);
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
            case AWSTranscribeMediaFormatOgg:
                return @"ogg";
            case AWSTranscribeMediaFormatAmr:
                return @"amr";
            case AWSTranscribeMediaFormatWebm:
                return @"webm";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeMedicalTranscriptionSetting class]];
}

+ (NSValueTransformer *)specialtyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PRIMARYCARE"] == NSOrderedSame) {
            return @(AWSTranscribeSpecialtyPrimarycare);
        }
        return @(AWSTranscribeSpecialtyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeSpecialtyPrimarycare:
                return @"PRIMARYCARE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONVERSATION"] == NSOrderedSame) {
            return @(AWSTranscribeTypesConversation);
        }
        if ([value caseInsensitiveCompare:@"DICTATION"] == NSOrderedSame) {
            return @(AWSTranscribeTypesDictation);
        }
        return @(AWSTranscribeTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeTypesConversation:
                return @"CONVERSATION";
            case AWSTranscribeTypesDictation:
                return @"DICTATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeStartMedicalTranscriptionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"medicalTranscriptionJob" : @"MedicalTranscriptionJob",
             };
}

+ (NSValueTransformer *)medicalTranscriptionJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeMedicalTranscriptionJob class]];
}

@end

@implementation AWSTranscribeStartTranscriptionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentRedaction" : @"ContentRedaction",
             @"identifyLanguage" : @"IdentifyLanguage",
             @"jobExecutionSettings" : @"JobExecutionSettings",
             @"languageCode" : @"LanguageCode",
             @"languageOptions" : @"LanguageOptions",
             @"media" : @"Media",
             @"mediaFormat" : @"MediaFormat",
             @"mediaSampleRateHertz" : @"MediaSampleRateHertz",
             @"modelSettings" : @"ModelSettings",
             @"outputBucketName" : @"OutputBucketName",
             @"outputEncryptionKMSKeyId" : @"OutputEncryptionKMSKeyId",
             @"outputKey" : @"OutputKey",
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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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
        if ([value caseInsensitiveCompare:@"ogg"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatOgg);
        }
        if ([value caseInsensitiveCompare:@"amr"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatAmr);
        }
        if ([value caseInsensitiveCompare:@"webm"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatWebm);
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
            case AWSTranscribeMediaFormatOgg:
                return @"ogg";
            case AWSTranscribeMediaFormatAmr:
                return @"amr";
            case AWSTranscribeMediaFormatWebm:
                return @"webm";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modelSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeModelSettings class]];
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeSettings class]];
}

@end

@implementation AWSTranscribeStartTranscriptionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"redactedTranscriptFileUri" : @"RedactedTranscriptFileUri",
             @"transcriptFileUri" : @"TranscriptFileUri",
             };
}

@end

@implementation AWSTranscribeTranscriptionJob

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionTime" : @"CompletionTime",
             @"contentRedaction" : @"ContentRedaction",
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"identifiedLanguageScore" : @"IdentifiedLanguageScore",
             @"identifyLanguage" : @"IdentifyLanguage",
             @"jobExecutionSettings" : @"JobExecutionSettings",
             @"languageCode" : @"LanguageCode",
             @"languageOptions" : @"LanguageOptions",
             @"media" : @"Media",
             @"mediaFormat" : @"MediaFormat",
             @"mediaSampleRateHertz" : @"MediaSampleRateHertz",
             @"modelSettings" : @"ModelSettings",
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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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
        if ([value caseInsensitiveCompare:@"ogg"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatOgg);
        }
        if ([value caseInsensitiveCompare:@"amr"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatAmr);
        }
        if ([value caseInsensitiveCompare:@"webm"] == NSOrderedSame) {
            return @(AWSTranscribeMediaFormatWebm);
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
            case AWSTranscribeMediaFormatOgg:
                return @"ogg";
            case AWSTranscribeMediaFormatAmr:
                return @"amr";
            case AWSTranscribeMediaFormatWebm:
                return @"webm";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modelSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeModelSettings class]];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionTime" : @"CompletionTime",
             @"contentRedaction" : @"ContentRedaction",
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"identifiedLanguageScore" : @"IdentifiedLanguageScore",
             @"identifyLanguage" : @"IdentifyLanguage",
             @"languageCode" : @"LanguageCode",
             @"modelSettings" : @"ModelSettings",
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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modelSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeModelSettings class]];
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

@implementation AWSTranscribeUpdateMedicalVocabularyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"vocabularyFileUri" : @"VocabularyFileUri",
             @"vocabularyName" : @"VocabularyName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeUpdateMedicalVocabularyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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

@implementation AWSTranscribeUpdateVocabularyFilterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vocabularyFilterFileUri" : @"VocabularyFilterFileUri",
             @"vocabularyFilterName" : @"VocabularyFilterName",
             @"words" : @"Words",
             };
}

@end

@implementation AWSTranscribeUpdateVocabularyFilterResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"vocabularyFilterName" : @"VocabularyFilterName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribeUpdateVocabularyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"vocabularyFilterName" : @"VocabularyFilterName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"af-ZA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeAfZA);
        }
        if ([value caseInsensitiveCompare:@"ar-AE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArAE);
        }
        if ([value caseInsensitiveCompare:@"ar-SA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeArSA);
        }
        if ([value caseInsensitiveCompare:@"cy-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeCyGB);
        }
        if ([value caseInsensitiveCompare:@"da-DK"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDaDK);
        }
        if ([value caseInsensitiveCompare:@"de-CH"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeCH);
        }
        if ([value caseInsensitiveCompare:@"de-DE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeDeDE);
        }
        if ([value caseInsensitiveCompare:@"en-AB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAB);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnAU);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"en-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIE);
        }
        if ([value caseInsensitiveCompare:@"en-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnIN);
        }
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-WL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEnWL);
        }
        if ([value caseInsensitiveCompare:@"es-ES"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsES);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fa-IR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFaIR);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"ga-IE"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGaIE);
        }
        if ([value caseInsensitiveCompare:@"gd-GB"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeGdGB);
        }
        if ([value caseInsensitiveCompare:@"he-IL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHeIL);
        }
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"id-ID"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeIdID);
        }
        if ([value caseInsensitiveCompare:@"it-IT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeItIT);
        }
        if ([value caseInsensitiveCompare:@"ja-JP"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeJaJP);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeKoKR);
        }
        if ([value caseInsensitiveCompare:@"ms-MY"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeMsMY);
        }
        if ([value caseInsensitiveCompare:@"nl-NL"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeNlNL);
        }
        if ([value caseInsensitiveCompare:@"pt-BR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtBR);
        }
        if ([value caseInsensitiveCompare:@"pt-PT"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodePtPT);
        }
        if ([value caseInsensitiveCompare:@"ru-RU"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeRuRU);
        }
        if ([value caseInsensitiveCompare:@"ta-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTaIN);
        }
        if ([value caseInsensitiveCompare:@"te-IN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTeIN);
        }
        if ([value caseInsensitiveCompare:@"tr-TR"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeTrTR);
        }
        if ([value caseInsensitiveCompare:@"zh-CN"] == NSOrderedSame) {
            return @(AWSTranscribeLanguageCodeZhCN);
        }
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeAfZA:
                return @"af-ZA";
            case AWSTranscribeLanguageCodeArAE:
                return @"ar-AE";
            case AWSTranscribeLanguageCodeArSA:
                return @"ar-SA";
            case AWSTranscribeLanguageCodeCyGB:
                return @"cy-GB";
            case AWSTranscribeLanguageCodeDaDK:
                return @"da-DK";
            case AWSTranscribeLanguageCodeDeCH:
                return @"de-CH";
            case AWSTranscribeLanguageCodeDeDE:
                return @"de-DE";
            case AWSTranscribeLanguageCodeEnAB:
                return @"en-AB";
            case AWSTranscribeLanguageCodeEnAU:
                return @"en-AU";
            case AWSTranscribeLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribeLanguageCodeEnIE:
                return @"en-IE";
            case AWSTranscribeLanguageCodeEnIN:
                return @"en-IN";
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEnWL:
                return @"en-WL";
            case AWSTranscribeLanguageCodeEsES:
                return @"es-ES";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribeLanguageCodeFaIR:
                return @"fa-IR";
            case AWSTranscribeLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribeLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribeLanguageCodeGaIE:
                return @"ga-IE";
            case AWSTranscribeLanguageCodeGdGB:
                return @"gd-GB";
            case AWSTranscribeLanguageCodeHeIL:
                return @"he-IL";
            case AWSTranscribeLanguageCodeHiIN:
                return @"hi-IN";
            case AWSTranscribeLanguageCodeIdID:
                return @"id-ID";
            case AWSTranscribeLanguageCodeItIT:
                return @"it-IT";
            case AWSTranscribeLanguageCodeJaJP:
                return @"ja-JP";
            case AWSTranscribeLanguageCodeKoKR:
                return @"ko-KR";
            case AWSTranscribeLanguageCodeMsMY:
                return @"ms-MY";
            case AWSTranscribeLanguageCodeNlNL:
                return @"nl-NL";
            case AWSTranscribeLanguageCodePtBR:
                return @"pt-BR";
            case AWSTranscribeLanguageCodePtPT:
                return @"pt-PT";
            case AWSTranscribeLanguageCodeRuRU:
                return @"ru-RU";
            case AWSTranscribeLanguageCodeTaIN:
                return @"ta-IN";
            case AWSTranscribeLanguageCodeTeIN:
                return @"te-IN";
            case AWSTranscribeLanguageCodeTrTR:
                return @"tr-TR";
            case AWSTranscribeLanguageCodeZhCN:
                return @"zh-CN";
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
