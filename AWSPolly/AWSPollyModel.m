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
             @"engine" : @"Engine",
             @"includeAdditionalLanguageCodes" : @"IncludeAdditionalLanguageCodes",
             @"languageCode" : @"LanguageCode",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)engineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"standard"] == NSOrderedSame) {
            return @(AWSPollyEngineStandard);
        }
        if ([value caseInsensitiveCompare:@"neural"] == NSOrderedSame) {
            return @(AWSPollyEngineNeural);
        }
        return @(AWSPollyEngineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyEngineStandard:
                return @"standard";
            case AWSPollyEngineNeural:
                return @"neural";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"arb"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeArb);
        }
        if ([value caseInsensitiveCompare:@"cmn-CN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeCmnCN);
        }
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
        if ([value caseInsensitiveCompare:@"es-MX"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEsMX);
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
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeKoKR);
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
            case AWSPollyLanguageCodeArb:
                return @"arb";
            case AWSPollyLanguageCodeCmnCN:
                return @"cmn-CN";
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
            case AWSPollyLanguageCodeEsMX:
                return @"es-MX";
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
            case AWSPollyLanguageCodeHiIN:
                return @"hi-IN";
            case AWSPollyLanguageCodeKoKR:
                return @"ko-KR";
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

@implementation AWSPollyGetSpeechSynthesisTaskInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"taskId" : @"TaskId",
             };
}

@end

@implementation AWSPollyGetSpeechSynthesisTaskOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"synthesisTask" : @"SynthesisTask",
             };
}

+ (NSValueTransformer *)synthesisTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPollySynthesisTask class]];
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
        if ([value caseInsensitiveCompare:@"arb"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeArb);
        }
        if ([value caseInsensitiveCompare:@"cmn-CN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeCmnCN);
        }
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
        if ([value caseInsensitiveCompare:@"es-MX"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEsMX);
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
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeKoKR);
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
            case AWSPollyLanguageCodeArb:
                return @"arb";
            case AWSPollyLanguageCodeCmnCN:
                return @"cmn-CN";
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
            case AWSPollyLanguageCodeEsMX:
                return @"es-MX";
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
            case AWSPollyLanguageCodeHiIN:
                return @"hi-IN";
            case AWSPollyLanguageCodeKoKR:
                return @"ko-KR";
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

@implementation AWSPollyListSpeechSynthesisTasksInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"scheduled"] == NSOrderedSame) {
            return @(AWSPollyTaskStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"inProgress"] == NSOrderedSame) {
            return @(AWSPollyTaskStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"completed"] == NSOrderedSame) {
            return @(AWSPollyTaskStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSPollyTaskStatusFailed);
        }
        return @(AWSPollyTaskStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyTaskStatusScheduled:
                return @"scheduled";
            case AWSPollyTaskStatusInProgress:
                return @"inProgress";
            case AWSPollyTaskStatusCompleted:
                return @"completed";
            case AWSPollyTaskStatusFailed:
                return @"failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPollyListSpeechSynthesisTasksOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"synthesisTasks" : @"SynthesisTasks",
             };
}

+ (NSValueTransformer *)synthesisTasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPollySynthesisTask class]];
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

@implementation AWSPollyStartSpeechSynthesisTaskInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engine" : @"Engine",
             @"languageCode" : @"LanguageCode",
             @"lexiconNames" : @"LexiconNames",
             @"outputFormat" : @"OutputFormat",
             @"outputS3BucketName" : @"OutputS3BucketName",
             @"outputS3KeyPrefix" : @"OutputS3KeyPrefix",
             @"sampleRate" : @"SampleRate",
             @"snsTopicArn" : @"SnsTopicArn",
             @"speechMarkTypes" : @"SpeechMarkTypes",
             @"text" : @"Text",
             @"textType" : @"TextType",
             @"voiceId" : @"VoiceId",
             };
}

+ (NSValueTransformer *)engineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"standard"] == NSOrderedSame) {
            return @(AWSPollyEngineStandard);
        }
        if ([value caseInsensitiveCompare:@"neural"] == NSOrderedSame) {
            return @(AWSPollyEngineNeural);
        }
        return @(AWSPollyEngineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyEngineStandard:
                return @"standard";
            case AWSPollyEngineNeural:
                return @"neural";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"arb"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeArb);
        }
        if ([value caseInsensitiveCompare:@"cmn-CN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeCmnCN);
        }
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
        if ([value caseInsensitiveCompare:@"es-MX"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEsMX);
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
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeKoKR);
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
            case AWSPollyLanguageCodeArb:
                return @"arb";
            case AWSPollyLanguageCodeCmnCN:
                return @"cmn-CN";
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
            case AWSPollyLanguageCodeEsMX:
                return @"es-MX";
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
            case AWSPollyLanguageCodeHiIN:
                return @"hi-IN";
            case AWSPollyLanguageCodeKoKR:
                return @"ko-KR";
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
        if ([value caseInsensitiveCompare:@"Aditi"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAditi);
        }
        if ([value caseInsensitiveCompare:@"Amy"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAmy);
        }
        if ([value caseInsensitiveCompare:@"Astrid"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAstrid);
        }
        if ([value caseInsensitiveCompare:@"Bianca"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdBianca);
        }
        if ([value caseInsensitiveCompare:@"Brian"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdBrian);
        }
        if ([value caseInsensitiveCompare:@"Camila"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCamila);
        }
        if ([value caseInsensitiveCompare:@"Carla"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCarla);
        }
        if ([value caseInsensitiveCompare:@"Carmen"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCarmen);
        }
        if ([value caseInsensitiveCompare:@"Celine"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCeline);
        }
        if ([value caseInsensitiveCompare:@"Chantal"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdChantal);
        }
        if ([value caseInsensitiveCompare:@"Conchita"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdConchita);
        }
        if ([value caseInsensitiveCompare:@"Cristiano"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCristiano);
        }
        if ([value caseInsensitiveCompare:@"Dora"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdDora);
        }
        if ([value caseInsensitiveCompare:@"Emma"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEmma);
        }
        if ([value caseInsensitiveCompare:@"Enrique"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEnrique);
        }
        if ([value caseInsensitiveCompare:@"Ewa"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEwa);
        }
        if ([value caseInsensitiveCompare:@"Filiz"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdFiliz);
        }
        if ([value caseInsensitiveCompare:@"Geraint"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGeraint);
        }
        if ([value caseInsensitiveCompare:@"Giorgio"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGiorgio);
        }
        if ([value caseInsensitiveCompare:@"Gwyneth"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGwyneth);
        }
        if ([value caseInsensitiveCompare:@"Hans"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdHans);
        }
        if ([value caseInsensitiveCompare:@"Ines"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdInes);
        }
        if ([value caseInsensitiveCompare:@"Ivy"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdIvy);
        }
        if ([value caseInsensitiveCompare:@"Jacek"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJacek);
        }
        if ([value caseInsensitiveCompare:@"Jan"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJan);
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
        if ([value caseInsensitiveCompare:@"Karl"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKarl);
        }
        if ([value caseInsensitiveCompare:@"Kendra"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKendra);
        }
        if ([value caseInsensitiveCompare:@"Kimberly"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKimberly);
        }
        if ([value caseInsensitiveCompare:@"Lea"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLea);
        }
        if ([value caseInsensitiveCompare:@"Liv"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLiv);
        }
        if ([value caseInsensitiveCompare:@"Lotte"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLotte);
        }
        if ([value caseInsensitiveCompare:@"Lucia"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLucia);
        }
        if ([value caseInsensitiveCompare:@"Lupe"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLupe);
        }
        if ([value caseInsensitiveCompare:@"Mads"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMads);
        }
        if ([value caseInsensitiveCompare:@"Maja"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMaja);
        }
        if ([value caseInsensitiveCompare:@"Marlene"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMarlene);
        }
        if ([value caseInsensitiveCompare:@"Mathieu"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMathieu);
        }
        if ([value caseInsensitiveCompare:@"Matthew"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMatthew);
        }
        if ([value caseInsensitiveCompare:@"Maxim"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMaxim);
        }
        if ([value caseInsensitiveCompare:@"Mia"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMia);
        }
        if ([value caseInsensitiveCompare:@"Miguel"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMiguel);
        }
        if ([value caseInsensitiveCompare:@"Mizuki"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMizuki);
        }
        if ([value caseInsensitiveCompare:@"Naja"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdNaja);
        }
        if ([value caseInsensitiveCompare:@"Nicole"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdNicole);
        }
        if ([value caseInsensitiveCompare:@"Penelope"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdPenelope);
        }
        if ([value caseInsensitiveCompare:@"Raveena"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRaveena);
        }
        if ([value caseInsensitiveCompare:@"Ricardo"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRicardo);
        }
        if ([value caseInsensitiveCompare:@"Ruben"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRuben);
        }
        if ([value caseInsensitiveCompare:@"Russell"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRussell);
        }
        if ([value caseInsensitiveCompare:@"Salli"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdSalli);
        }
        if ([value caseInsensitiveCompare:@"Seoyeon"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdSeoyeon);
        }
        if ([value caseInsensitiveCompare:@"Takumi"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdTakumi);
        }
        if ([value caseInsensitiveCompare:@"Tatyana"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdTatyana);
        }
        if ([value caseInsensitiveCompare:@"Vicki"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdVicki);
        }
        if ([value caseInsensitiveCompare:@"Vitoria"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdVitoria);
        }
        if ([value caseInsensitiveCompare:@"Zeina"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdZeina);
        }
        if ([value caseInsensitiveCompare:@"Zhiyu"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdZhiyu);
        }
        return @(AWSPollyVoiceIdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyVoiceIdAditi:
                return @"Aditi";
            case AWSPollyVoiceIdAmy:
                return @"Amy";
            case AWSPollyVoiceIdAstrid:
                return @"Astrid";
            case AWSPollyVoiceIdBianca:
                return @"Bianca";
            case AWSPollyVoiceIdBrian:
                return @"Brian";
            case AWSPollyVoiceIdCamila:
                return @"Camila";
            case AWSPollyVoiceIdCarla:
                return @"Carla";
            case AWSPollyVoiceIdCarmen:
                return @"Carmen";
            case AWSPollyVoiceIdCeline:
                return @"Celine";
            case AWSPollyVoiceIdChantal:
                return @"Chantal";
            case AWSPollyVoiceIdConchita:
                return @"Conchita";
            case AWSPollyVoiceIdCristiano:
                return @"Cristiano";
            case AWSPollyVoiceIdDora:
                return @"Dora";
            case AWSPollyVoiceIdEmma:
                return @"Emma";
            case AWSPollyVoiceIdEnrique:
                return @"Enrique";
            case AWSPollyVoiceIdEwa:
                return @"Ewa";
            case AWSPollyVoiceIdFiliz:
                return @"Filiz";
            case AWSPollyVoiceIdGeraint:
                return @"Geraint";
            case AWSPollyVoiceIdGiorgio:
                return @"Giorgio";
            case AWSPollyVoiceIdGwyneth:
                return @"Gwyneth";
            case AWSPollyVoiceIdHans:
                return @"Hans";
            case AWSPollyVoiceIdInes:
                return @"Ines";
            case AWSPollyVoiceIdIvy:
                return @"Ivy";
            case AWSPollyVoiceIdJacek:
                return @"Jacek";
            case AWSPollyVoiceIdJan:
                return @"Jan";
            case AWSPollyVoiceIdJoanna:
                return @"Joanna";
            case AWSPollyVoiceIdJoey:
                return @"Joey";
            case AWSPollyVoiceIdJustin:
                return @"Justin";
            case AWSPollyVoiceIdKarl:
                return @"Karl";
            case AWSPollyVoiceIdKendra:
                return @"Kendra";
            case AWSPollyVoiceIdKimberly:
                return @"Kimberly";
            case AWSPollyVoiceIdLea:
                return @"Lea";
            case AWSPollyVoiceIdLiv:
                return @"Liv";
            case AWSPollyVoiceIdLotte:
                return @"Lotte";
            case AWSPollyVoiceIdLucia:
                return @"Lucia";
            case AWSPollyVoiceIdLupe:
                return @"Lupe";
            case AWSPollyVoiceIdMads:
                return @"Mads";
            case AWSPollyVoiceIdMaja:
                return @"Maja";
            case AWSPollyVoiceIdMarlene:
                return @"Marlene";
            case AWSPollyVoiceIdMathieu:
                return @"Mathieu";
            case AWSPollyVoiceIdMatthew:
                return @"Matthew";
            case AWSPollyVoiceIdMaxim:
                return @"Maxim";
            case AWSPollyVoiceIdMia:
                return @"Mia";
            case AWSPollyVoiceIdMiguel:
                return @"Miguel";
            case AWSPollyVoiceIdMizuki:
                return @"Mizuki";
            case AWSPollyVoiceIdNaja:
                return @"Naja";
            case AWSPollyVoiceIdNicole:
                return @"Nicole";
            case AWSPollyVoiceIdPenelope:
                return @"Penelope";
            case AWSPollyVoiceIdRaveena:
                return @"Raveena";
            case AWSPollyVoiceIdRicardo:
                return @"Ricardo";
            case AWSPollyVoiceIdRuben:
                return @"Ruben";
            case AWSPollyVoiceIdRussell:
                return @"Russell";
            case AWSPollyVoiceIdSalli:
                return @"Salli";
            case AWSPollyVoiceIdSeoyeon:
                return @"Seoyeon";
            case AWSPollyVoiceIdTakumi:
                return @"Takumi";
            case AWSPollyVoiceIdTatyana:
                return @"Tatyana";
            case AWSPollyVoiceIdVicki:
                return @"Vicki";
            case AWSPollyVoiceIdVitoria:
                return @"Vitoria";
            case AWSPollyVoiceIdZeina:
                return @"Zeina";
            case AWSPollyVoiceIdZhiyu:
                return @"Zhiyu";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPollyStartSpeechSynthesisTaskOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"synthesisTask" : @"SynthesisTask",
             };
}

+ (NSValueTransformer *)synthesisTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPollySynthesisTask class]];
}

@end

@implementation AWSPollySynthesisTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"engine" : @"Engine",
             @"languageCode" : @"LanguageCode",
             @"lexiconNames" : @"LexiconNames",
             @"outputFormat" : @"OutputFormat",
             @"outputUri" : @"OutputUri",
             @"requestCharacters" : @"RequestCharacters",
             @"sampleRate" : @"SampleRate",
             @"snsTopicArn" : @"SnsTopicArn",
             @"speechMarkTypes" : @"SpeechMarkTypes",
             @"taskId" : @"TaskId",
             @"taskStatus" : @"TaskStatus",
             @"taskStatusReason" : @"TaskStatusReason",
             @"textType" : @"TextType",
             @"voiceId" : @"VoiceId",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)engineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"standard"] == NSOrderedSame) {
            return @(AWSPollyEngineStandard);
        }
        if ([value caseInsensitiveCompare:@"neural"] == NSOrderedSame) {
            return @(AWSPollyEngineNeural);
        }
        return @(AWSPollyEngineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyEngineStandard:
                return @"standard";
            case AWSPollyEngineNeural:
                return @"neural";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"arb"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeArb);
        }
        if ([value caseInsensitiveCompare:@"cmn-CN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeCmnCN);
        }
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
        if ([value caseInsensitiveCompare:@"es-MX"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEsMX);
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
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeKoKR);
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
            case AWSPollyLanguageCodeArb:
                return @"arb";
            case AWSPollyLanguageCodeCmnCN:
                return @"cmn-CN";
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
            case AWSPollyLanguageCodeEsMX:
                return @"es-MX";
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
            case AWSPollyLanguageCodeHiIN:
                return @"hi-IN";
            case AWSPollyLanguageCodeKoKR:
                return @"ko-KR";
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

+ (NSValueTransformer *)taskStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"scheduled"] == NSOrderedSame) {
            return @(AWSPollyTaskStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"inProgress"] == NSOrderedSame) {
            return @(AWSPollyTaskStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"completed"] == NSOrderedSame) {
            return @(AWSPollyTaskStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSPollyTaskStatusFailed);
        }
        return @(AWSPollyTaskStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyTaskStatusScheduled:
                return @"scheduled";
            case AWSPollyTaskStatusInProgress:
                return @"inProgress";
            case AWSPollyTaskStatusCompleted:
                return @"completed";
            case AWSPollyTaskStatusFailed:
                return @"failed";
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
        if ([value caseInsensitiveCompare:@"Aditi"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAditi);
        }
        if ([value caseInsensitiveCompare:@"Amy"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAmy);
        }
        if ([value caseInsensitiveCompare:@"Astrid"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAstrid);
        }
        if ([value caseInsensitiveCompare:@"Bianca"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdBianca);
        }
        if ([value caseInsensitiveCompare:@"Brian"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdBrian);
        }
        if ([value caseInsensitiveCompare:@"Camila"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCamila);
        }
        if ([value caseInsensitiveCompare:@"Carla"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCarla);
        }
        if ([value caseInsensitiveCompare:@"Carmen"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCarmen);
        }
        if ([value caseInsensitiveCompare:@"Celine"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCeline);
        }
        if ([value caseInsensitiveCompare:@"Chantal"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdChantal);
        }
        if ([value caseInsensitiveCompare:@"Conchita"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdConchita);
        }
        if ([value caseInsensitiveCompare:@"Cristiano"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCristiano);
        }
        if ([value caseInsensitiveCompare:@"Dora"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdDora);
        }
        if ([value caseInsensitiveCompare:@"Emma"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEmma);
        }
        if ([value caseInsensitiveCompare:@"Enrique"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEnrique);
        }
        if ([value caseInsensitiveCompare:@"Ewa"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEwa);
        }
        if ([value caseInsensitiveCompare:@"Filiz"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdFiliz);
        }
        if ([value caseInsensitiveCompare:@"Geraint"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGeraint);
        }
        if ([value caseInsensitiveCompare:@"Giorgio"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGiorgio);
        }
        if ([value caseInsensitiveCompare:@"Gwyneth"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGwyneth);
        }
        if ([value caseInsensitiveCompare:@"Hans"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdHans);
        }
        if ([value caseInsensitiveCompare:@"Ines"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdInes);
        }
        if ([value caseInsensitiveCompare:@"Ivy"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdIvy);
        }
        if ([value caseInsensitiveCompare:@"Jacek"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJacek);
        }
        if ([value caseInsensitiveCompare:@"Jan"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJan);
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
        if ([value caseInsensitiveCompare:@"Karl"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKarl);
        }
        if ([value caseInsensitiveCompare:@"Kendra"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKendra);
        }
        if ([value caseInsensitiveCompare:@"Kimberly"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKimberly);
        }
        if ([value caseInsensitiveCompare:@"Lea"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLea);
        }
        if ([value caseInsensitiveCompare:@"Liv"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLiv);
        }
        if ([value caseInsensitiveCompare:@"Lotte"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLotte);
        }
        if ([value caseInsensitiveCompare:@"Lucia"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLucia);
        }
        if ([value caseInsensitiveCompare:@"Lupe"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLupe);
        }
        if ([value caseInsensitiveCompare:@"Mads"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMads);
        }
        if ([value caseInsensitiveCompare:@"Maja"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMaja);
        }
        if ([value caseInsensitiveCompare:@"Marlene"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMarlene);
        }
        if ([value caseInsensitiveCompare:@"Mathieu"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMathieu);
        }
        if ([value caseInsensitiveCompare:@"Matthew"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMatthew);
        }
        if ([value caseInsensitiveCompare:@"Maxim"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMaxim);
        }
        if ([value caseInsensitiveCompare:@"Mia"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMia);
        }
        if ([value caseInsensitiveCompare:@"Miguel"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMiguel);
        }
        if ([value caseInsensitiveCompare:@"Mizuki"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMizuki);
        }
        if ([value caseInsensitiveCompare:@"Naja"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdNaja);
        }
        if ([value caseInsensitiveCompare:@"Nicole"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdNicole);
        }
        if ([value caseInsensitiveCompare:@"Penelope"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdPenelope);
        }
        if ([value caseInsensitiveCompare:@"Raveena"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRaveena);
        }
        if ([value caseInsensitiveCompare:@"Ricardo"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRicardo);
        }
        if ([value caseInsensitiveCompare:@"Ruben"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRuben);
        }
        if ([value caseInsensitiveCompare:@"Russell"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRussell);
        }
        if ([value caseInsensitiveCompare:@"Salli"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdSalli);
        }
        if ([value caseInsensitiveCompare:@"Seoyeon"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdSeoyeon);
        }
        if ([value caseInsensitiveCompare:@"Takumi"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdTakumi);
        }
        if ([value caseInsensitiveCompare:@"Tatyana"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdTatyana);
        }
        if ([value caseInsensitiveCompare:@"Vicki"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdVicki);
        }
        if ([value caseInsensitiveCompare:@"Vitoria"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdVitoria);
        }
        if ([value caseInsensitiveCompare:@"Zeina"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdZeina);
        }
        if ([value caseInsensitiveCompare:@"Zhiyu"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdZhiyu);
        }
        return @(AWSPollyVoiceIdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyVoiceIdAditi:
                return @"Aditi";
            case AWSPollyVoiceIdAmy:
                return @"Amy";
            case AWSPollyVoiceIdAstrid:
                return @"Astrid";
            case AWSPollyVoiceIdBianca:
                return @"Bianca";
            case AWSPollyVoiceIdBrian:
                return @"Brian";
            case AWSPollyVoiceIdCamila:
                return @"Camila";
            case AWSPollyVoiceIdCarla:
                return @"Carla";
            case AWSPollyVoiceIdCarmen:
                return @"Carmen";
            case AWSPollyVoiceIdCeline:
                return @"Celine";
            case AWSPollyVoiceIdChantal:
                return @"Chantal";
            case AWSPollyVoiceIdConchita:
                return @"Conchita";
            case AWSPollyVoiceIdCristiano:
                return @"Cristiano";
            case AWSPollyVoiceIdDora:
                return @"Dora";
            case AWSPollyVoiceIdEmma:
                return @"Emma";
            case AWSPollyVoiceIdEnrique:
                return @"Enrique";
            case AWSPollyVoiceIdEwa:
                return @"Ewa";
            case AWSPollyVoiceIdFiliz:
                return @"Filiz";
            case AWSPollyVoiceIdGeraint:
                return @"Geraint";
            case AWSPollyVoiceIdGiorgio:
                return @"Giorgio";
            case AWSPollyVoiceIdGwyneth:
                return @"Gwyneth";
            case AWSPollyVoiceIdHans:
                return @"Hans";
            case AWSPollyVoiceIdInes:
                return @"Ines";
            case AWSPollyVoiceIdIvy:
                return @"Ivy";
            case AWSPollyVoiceIdJacek:
                return @"Jacek";
            case AWSPollyVoiceIdJan:
                return @"Jan";
            case AWSPollyVoiceIdJoanna:
                return @"Joanna";
            case AWSPollyVoiceIdJoey:
                return @"Joey";
            case AWSPollyVoiceIdJustin:
                return @"Justin";
            case AWSPollyVoiceIdKarl:
                return @"Karl";
            case AWSPollyVoiceIdKendra:
                return @"Kendra";
            case AWSPollyVoiceIdKimberly:
                return @"Kimberly";
            case AWSPollyVoiceIdLea:
                return @"Lea";
            case AWSPollyVoiceIdLiv:
                return @"Liv";
            case AWSPollyVoiceIdLotte:
                return @"Lotte";
            case AWSPollyVoiceIdLucia:
                return @"Lucia";
            case AWSPollyVoiceIdLupe:
                return @"Lupe";
            case AWSPollyVoiceIdMads:
                return @"Mads";
            case AWSPollyVoiceIdMaja:
                return @"Maja";
            case AWSPollyVoiceIdMarlene:
                return @"Marlene";
            case AWSPollyVoiceIdMathieu:
                return @"Mathieu";
            case AWSPollyVoiceIdMatthew:
                return @"Matthew";
            case AWSPollyVoiceIdMaxim:
                return @"Maxim";
            case AWSPollyVoiceIdMia:
                return @"Mia";
            case AWSPollyVoiceIdMiguel:
                return @"Miguel";
            case AWSPollyVoiceIdMizuki:
                return @"Mizuki";
            case AWSPollyVoiceIdNaja:
                return @"Naja";
            case AWSPollyVoiceIdNicole:
                return @"Nicole";
            case AWSPollyVoiceIdPenelope:
                return @"Penelope";
            case AWSPollyVoiceIdRaveena:
                return @"Raveena";
            case AWSPollyVoiceIdRicardo:
                return @"Ricardo";
            case AWSPollyVoiceIdRuben:
                return @"Ruben";
            case AWSPollyVoiceIdRussell:
                return @"Russell";
            case AWSPollyVoiceIdSalli:
                return @"Salli";
            case AWSPollyVoiceIdSeoyeon:
                return @"Seoyeon";
            case AWSPollyVoiceIdTakumi:
                return @"Takumi";
            case AWSPollyVoiceIdTatyana:
                return @"Tatyana";
            case AWSPollyVoiceIdVicki:
                return @"Vicki";
            case AWSPollyVoiceIdVitoria:
                return @"Vitoria";
            case AWSPollyVoiceIdZeina:
                return @"Zeina";
            case AWSPollyVoiceIdZhiyu:
                return @"Zhiyu";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPollySynthesizeSpeechInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"engine" : @"Engine",
             @"languageCode" : @"LanguageCode",
             @"lexiconNames" : @"LexiconNames",
             @"outputFormat" : @"OutputFormat",
             @"sampleRate" : @"SampleRate",
             @"speechMarkTypes" : @"SpeechMarkTypes",
             @"text" : @"Text",
             @"textType" : @"TextType",
             @"voiceId" : @"VoiceId",
             };
}

+ (NSValueTransformer *)engineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"standard"] == NSOrderedSame) {
            return @(AWSPollyEngineStandard);
        }
        if ([value caseInsensitiveCompare:@"neural"] == NSOrderedSame) {
            return @(AWSPollyEngineNeural);
        }
        return @(AWSPollyEngineUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyEngineStandard:
                return @"standard";
            case AWSPollyEngineNeural:
                return @"neural";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"arb"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeArb);
        }
        if ([value caseInsensitiveCompare:@"cmn-CN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeCmnCN);
        }
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
        if ([value caseInsensitiveCompare:@"es-MX"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEsMX);
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
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeKoKR);
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
            case AWSPollyLanguageCodeArb:
                return @"arb";
            case AWSPollyLanguageCodeCmnCN:
                return @"cmn-CN";
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
            case AWSPollyLanguageCodeEsMX:
                return @"es-MX";
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
            case AWSPollyLanguageCodeHiIN:
                return @"hi-IN";
            case AWSPollyLanguageCodeKoKR:
                return @"ko-KR";
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
        if ([value caseInsensitiveCompare:@"Aditi"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAditi);
        }
        if ([value caseInsensitiveCompare:@"Amy"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAmy);
        }
        if ([value caseInsensitiveCompare:@"Astrid"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAstrid);
        }
        if ([value caseInsensitiveCompare:@"Bianca"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdBianca);
        }
        if ([value caseInsensitiveCompare:@"Brian"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdBrian);
        }
        if ([value caseInsensitiveCompare:@"Camila"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCamila);
        }
        if ([value caseInsensitiveCompare:@"Carla"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCarla);
        }
        if ([value caseInsensitiveCompare:@"Carmen"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCarmen);
        }
        if ([value caseInsensitiveCompare:@"Celine"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCeline);
        }
        if ([value caseInsensitiveCompare:@"Chantal"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdChantal);
        }
        if ([value caseInsensitiveCompare:@"Conchita"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdConchita);
        }
        if ([value caseInsensitiveCompare:@"Cristiano"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCristiano);
        }
        if ([value caseInsensitiveCompare:@"Dora"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdDora);
        }
        if ([value caseInsensitiveCompare:@"Emma"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEmma);
        }
        if ([value caseInsensitiveCompare:@"Enrique"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEnrique);
        }
        if ([value caseInsensitiveCompare:@"Ewa"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEwa);
        }
        if ([value caseInsensitiveCompare:@"Filiz"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdFiliz);
        }
        if ([value caseInsensitiveCompare:@"Geraint"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGeraint);
        }
        if ([value caseInsensitiveCompare:@"Giorgio"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGiorgio);
        }
        if ([value caseInsensitiveCompare:@"Gwyneth"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGwyneth);
        }
        if ([value caseInsensitiveCompare:@"Hans"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdHans);
        }
        if ([value caseInsensitiveCompare:@"Ines"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdInes);
        }
        if ([value caseInsensitiveCompare:@"Ivy"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdIvy);
        }
        if ([value caseInsensitiveCompare:@"Jacek"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJacek);
        }
        if ([value caseInsensitiveCompare:@"Jan"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJan);
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
        if ([value caseInsensitiveCompare:@"Karl"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKarl);
        }
        if ([value caseInsensitiveCompare:@"Kendra"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKendra);
        }
        if ([value caseInsensitiveCompare:@"Kimberly"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKimberly);
        }
        if ([value caseInsensitiveCompare:@"Lea"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLea);
        }
        if ([value caseInsensitiveCompare:@"Liv"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLiv);
        }
        if ([value caseInsensitiveCompare:@"Lotte"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLotte);
        }
        if ([value caseInsensitiveCompare:@"Lucia"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLucia);
        }
        if ([value caseInsensitiveCompare:@"Lupe"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLupe);
        }
        if ([value caseInsensitiveCompare:@"Mads"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMads);
        }
        if ([value caseInsensitiveCompare:@"Maja"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMaja);
        }
        if ([value caseInsensitiveCompare:@"Marlene"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMarlene);
        }
        if ([value caseInsensitiveCompare:@"Mathieu"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMathieu);
        }
        if ([value caseInsensitiveCompare:@"Matthew"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMatthew);
        }
        if ([value caseInsensitiveCompare:@"Maxim"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMaxim);
        }
        if ([value caseInsensitiveCompare:@"Mia"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMia);
        }
        if ([value caseInsensitiveCompare:@"Miguel"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMiguel);
        }
        if ([value caseInsensitiveCompare:@"Mizuki"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMizuki);
        }
        if ([value caseInsensitiveCompare:@"Naja"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdNaja);
        }
        if ([value caseInsensitiveCompare:@"Nicole"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdNicole);
        }
        if ([value caseInsensitiveCompare:@"Penelope"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdPenelope);
        }
        if ([value caseInsensitiveCompare:@"Raveena"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRaveena);
        }
        if ([value caseInsensitiveCompare:@"Ricardo"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRicardo);
        }
        if ([value caseInsensitiveCompare:@"Ruben"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRuben);
        }
        if ([value caseInsensitiveCompare:@"Russell"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRussell);
        }
        if ([value caseInsensitiveCompare:@"Salli"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdSalli);
        }
        if ([value caseInsensitiveCompare:@"Seoyeon"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdSeoyeon);
        }
        if ([value caseInsensitiveCompare:@"Takumi"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdTakumi);
        }
        if ([value caseInsensitiveCompare:@"Tatyana"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdTatyana);
        }
        if ([value caseInsensitiveCompare:@"Vicki"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdVicki);
        }
        if ([value caseInsensitiveCompare:@"Vitoria"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdVitoria);
        }
        if ([value caseInsensitiveCompare:@"Zeina"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdZeina);
        }
        if ([value caseInsensitiveCompare:@"Zhiyu"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdZhiyu);
        }
        return @(AWSPollyVoiceIdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyVoiceIdAditi:
                return @"Aditi";
            case AWSPollyVoiceIdAmy:
                return @"Amy";
            case AWSPollyVoiceIdAstrid:
                return @"Astrid";
            case AWSPollyVoiceIdBianca:
                return @"Bianca";
            case AWSPollyVoiceIdBrian:
                return @"Brian";
            case AWSPollyVoiceIdCamila:
                return @"Camila";
            case AWSPollyVoiceIdCarla:
                return @"Carla";
            case AWSPollyVoiceIdCarmen:
                return @"Carmen";
            case AWSPollyVoiceIdCeline:
                return @"Celine";
            case AWSPollyVoiceIdChantal:
                return @"Chantal";
            case AWSPollyVoiceIdConchita:
                return @"Conchita";
            case AWSPollyVoiceIdCristiano:
                return @"Cristiano";
            case AWSPollyVoiceIdDora:
                return @"Dora";
            case AWSPollyVoiceIdEmma:
                return @"Emma";
            case AWSPollyVoiceIdEnrique:
                return @"Enrique";
            case AWSPollyVoiceIdEwa:
                return @"Ewa";
            case AWSPollyVoiceIdFiliz:
                return @"Filiz";
            case AWSPollyVoiceIdGeraint:
                return @"Geraint";
            case AWSPollyVoiceIdGiorgio:
                return @"Giorgio";
            case AWSPollyVoiceIdGwyneth:
                return @"Gwyneth";
            case AWSPollyVoiceIdHans:
                return @"Hans";
            case AWSPollyVoiceIdInes:
                return @"Ines";
            case AWSPollyVoiceIdIvy:
                return @"Ivy";
            case AWSPollyVoiceIdJacek:
                return @"Jacek";
            case AWSPollyVoiceIdJan:
                return @"Jan";
            case AWSPollyVoiceIdJoanna:
                return @"Joanna";
            case AWSPollyVoiceIdJoey:
                return @"Joey";
            case AWSPollyVoiceIdJustin:
                return @"Justin";
            case AWSPollyVoiceIdKarl:
                return @"Karl";
            case AWSPollyVoiceIdKendra:
                return @"Kendra";
            case AWSPollyVoiceIdKimberly:
                return @"Kimberly";
            case AWSPollyVoiceIdLea:
                return @"Lea";
            case AWSPollyVoiceIdLiv:
                return @"Liv";
            case AWSPollyVoiceIdLotte:
                return @"Lotte";
            case AWSPollyVoiceIdLucia:
                return @"Lucia";
            case AWSPollyVoiceIdLupe:
                return @"Lupe";
            case AWSPollyVoiceIdMads:
                return @"Mads";
            case AWSPollyVoiceIdMaja:
                return @"Maja";
            case AWSPollyVoiceIdMarlene:
                return @"Marlene";
            case AWSPollyVoiceIdMathieu:
                return @"Mathieu";
            case AWSPollyVoiceIdMatthew:
                return @"Matthew";
            case AWSPollyVoiceIdMaxim:
                return @"Maxim";
            case AWSPollyVoiceIdMia:
                return @"Mia";
            case AWSPollyVoiceIdMiguel:
                return @"Miguel";
            case AWSPollyVoiceIdMizuki:
                return @"Mizuki";
            case AWSPollyVoiceIdNaja:
                return @"Naja";
            case AWSPollyVoiceIdNicole:
                return @"Nicole";
            case AWSPollyVoiceIdPenelope:
                return @"Penelope";
            case AWSPollyVoiceIdRaveena:
                return @"Raveena";
            case AWSPollyVoiceIdRicardo:
                return @"Ricardo";
            case AWSPollyVoiceIdRuben:
                return @"Ruben";
            case AWSPollyVoiceIdRussell:
                return @"Russell";
            case AWSPollyVoiceIdSalli:
                return @"Salli";
            case AWSPollyVoiceIdSeoyeon:
                return @"Seoyeon";
            case AWSPollyVoiceIdTakumi:
                return @"Takumi";
            case AWSPollyVoiceIdTatyana:
                return @"Tatyana";
            case AWSPollyVoiceIdVicki:
                return @"Vicki";
            case AWSPollyVoiceIdVitoria:
                return @"Vitoria";
            case AWSPollyVoiceIdZeina:
                return @"Zeina";
            case AWSPollyVoiceIdZhiyu:
                return @"Zhiyu";
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
             @"additionalLanguageCodes" : @"AdditionalLanguageCodes",
             @"gender" : @"Gender",
             @"identifier" : @"Id",
             @"languageCode" : @"LanguageCode",
             @"languageName" : @"LanguageName",
             @"name" : @"Name",
             @"supportedEngines" : @"SupportedEngines",
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
        if ([value caseInsensitiveCompare:@"Aditi"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAditi);
        }
        if ([value caseInsensitiveCompare:@"Amy"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAmy);
        }
        if ([value caseInsensitiveCompare:@"Astrid"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdAstrid);
        }
        if ([value caseInsensitiveCompare:@"Bianca"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdBianca);
        }
        if ([value caseInsensitiveCompare:@"Brian"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdBrian);
        }
        if ([value caseInsensitiveCompare:@"Camila"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCamila);
        }
        if ([value caseInsensitiveCompare:@"Carla"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCarla);
        }
        if ([value caseInsensitiveCompare:@"Carmen"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCarmen);
        }
        if ([value caseInsensitiveCompare:@"Celine"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCeline);
        }
        if ([value caseInsensitiveCompare:@"Chantal"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdChantal);
        }
        if ([value caseInsensitiveCompare:@"Conchita"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdConchita);
        }
        if ([value caseInsensitiveCompare:@"Cristiano"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdCristiano);
        }
        if ([value caseInsensitiveCompare:@"Dora"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdDora);
        }
        if ([value caseInsensitiveCompare:@"Emma"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEmma);
        }
        if ([value caseInsensitiveCompare:@"Enrique"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEnrique);
        }
        if ([value caseInsensitiveCompare:@"Ewa"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdEwa);
        }
        if ([value caseInsensitiveCompare:@"Filiz"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdFiliz);
        }
        if ([value caseInsensitiveCompare:@"Geraint"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGeraint);
        }
        if ([value caseInsensitiveCompare:@"Giorgio"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGiorgio);
        }
        if ([value caseInsensitiveCompare:@"Gwyneth"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdGwyneth);
        }
        if ([value caseInsensitiveCompare:@"Hans"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdHans);
        }
        if ([value caseInsensitiveCompare:@"Ines"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdInes);
        }
        if ([value caseInsensitiveCompare:@"Ivy"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdIvy);
        }
        if ([value caseInsensitiveCompare:@"Jacek"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJacek);
        }
        if ([value caseInsensitiveCompare:@"Jan"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdJan);
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
        if ([value caseInsensitiveCompare:@"Karl"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKarl);
        }
        if ([value caseInsensitiveCompare:@"Kendra"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKendra);
        }
        if ([value caseInsensitiveCompare:@"Kimberly"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdKimberly);
        }
        if ([value caseInsensitiveCompare:@"Lea"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLea);
        }
        if ([value caseInsensitiveCompare:@"Liv"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLiv);
        }
        if ([value caseInsensitiveCompare:@"Lotte"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLotte);
        }
        if ([value caseInsensitiveCompare:@"Lucia"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLucia);
        }
        if ([value caseInsensitiveCompare:@"Lupe"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdLupe);
        }
        if ([value caseInsensitiveCompare:@"Mads"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMads);
        }
        if ([value caseInsensitiveCompare:@"Maja"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMaja);
        }
        if ([value caseInsensitiveCompare:@"Marlene"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMarlene);
        }
        if ([value caseInsensitiveCompare:@"Mathieu"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMathieu);
        }
        if ([value caseInsensitiveCompare:@"Matthew"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMatthew);
        }
        if ([value caseInsensitiveCompare:@"Maxim"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMaxim);
        }
        if ([value caseInsensitiveCompare:@"Mia"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMia);
        }
        if ([value caseInsensitiveCompare:@"Miguel"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMiguel);
        }
        if ([value caseInsensitiveCompare:@"Mizuki"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdMizuki);
        }
        if ([value caseInsensitiveCompare:@"Naja"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdNaja);
        }
        if ([value caseInsensitiveCompare:@"Nicole"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdNicole);
        }
        if ([value caseInsensitiveCompare:@"Penelope"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdPenelope);
        }
        if ([value caseInsensitiveCompare:@"Raveena"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRaveena);
        }
        if ([value caseInsensitiveCompare:@"Ricardo"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRicardo);
        }
        if ([value caseInsensitiveCompare:@"Ruben"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRuben);
        }
        if ([value caseInsensitiveCompare:@"Russell"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdRussell);
        }
        if ([value caseInsensitiveCompare:@"Salli"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdSalli);
        }
        if ([value caseInsensitiveCompare:@"Seoyeon"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdSeoyeon);
        }
        if ([value caseInsensitiveCompare:@"Takumi"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdTakumi);
        }
        if ([value caseInsensitiveCompare:@"Tatyana"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdTatyana);
        }
        if ([value caseInsensitiveCompare:@"Vicki"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdVicki);
        }
        if ([value caseInsensitiveCompare:@"Vitoria"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdVitoria);
        }
        if ([value caseInsensitiveCompare:@"Zeina"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdZeina);
        }
        if ([value caseInsensitiveCompare:@"Zhiyu"] == NSOrderedSame) {
            return @(AWSPollyVoiceIdZhiyu);
        }
        return @(AWSPollyVoiceIdUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPollyVoiceIdAditi:
                return @"Aditi";
            case AWSPollyVoiceIdAmy:
                return @"Amy";
            case AWSPollyVoiceIdAstrid:
                return @"Astrid";
            case AWSPollyVoiceIdBianca:
                return @"Bianca";
            case AWSPollyVoiceIdBrian:
                return @"Brian";
            case AWSPollyVoiceIdCamila:
                return @"Camila";
            case AWSPollyVoiceIdCarla:
                return @"Carla";
            case AWSPollyVoiceIdCarmen:
                return @"Carmen";
            case AWSPollyVoiceIdCeline:
                return @"Celine";
            case AWSPollyVoiceIdChantal:
                return @"Chantal";
            case AWSPollyVoiceIdConchita:
                return @"Conchita";
            case AWSPollyVoiceIdCristiano:
                return @"Cristiano";
            case AWSPollyVoiceIdDora:
                return @"Dora";
            case AWSPollyVoiceIdEmma:
                return @"Emma";
            case AWSPollyVoiceIdEnrique:
                return @"Enrique";
            case AWSPollyVoiceIdEwa:
                return @"Ewa";
            case AWSPollyVoiceIdFiliz:
                return @"Filiz";
            case AWSPollyVoiceIdGeraint:
                return @"Geraint";
            case AWSPollyVoiceIdGiorgio:
                return @"Giorgio";
            case AWSPollyVoiceIdGwyneth:
                return @"Gwyneth";
            case AWSPollyVoiceIdHans:
                return @"Hans";
            case AWSPollyVoiceIdInes:
                return @"Ines";
            case AWSPollyVoiceIdIvy:
                return @"Ivy";
            case AWSPollyVoiceIdJacek:
                return @"Jacek";
            case AWSPollyVoiceIdJan:
                return @"Jan";
            case AWSPollyVoiceIdJoanna:
                return @"Joanna";
            case AWSPollyVoiceIdJoey:
                return @"Joey";
            case AWSPollyVoiceIdJustin:
                return @"Justin";
            case AWSPollyVoiceIdKarl:
                return @"Karl";
            case AWSPollyVoiceIdKendra:
                return @"Kendra";
            case AWSPollyVoiceIdKimberly:
                return @"Kimberly";
            case AWSPollyVoiceIdLea:
                return @"Lea";
            case AWSPollyVoiceIdLiv:
                return @"Liv";
            case AWSPollyVoiceIdLotte:
                return @"Lotte";
            case AWSPollyVoiceIdLucia:
                return @"Lucia";
            case AWSPollyVoiceIdLupe:
                return @"Lupe";
            case AWSPollyVoiceIdMads:
                return @"Mads";
            case AWSPollyVoiceIdMaja:
                return @"Maja";
            case AWSPollyVoiceIdMarlene:
                return @"Marlene";
            case AWSPollyVoiceIdMathieu:
                return @"Mathieu";
            case AWSPollyVoiceIdMatthew:
                return @"Matthew";
            case AWSPollyVoiceIdMaxim:
                return @"Maxim";
            case AWSPollyVoiceIdMia:
                return @"Mia";
            case AWSPollyVoiceIdMiguel:
                return @"Miguel";
            case AWSPollyVoiceIdMizuki:
                return @"Mizuki";
            case AWSPollyVoiceIdNaja:
                return @"Naja";
            case AWSPollyVoiceIdNicole:
                return @"Nicole";
            case AWSPollyVoiceIdPenelope:
                return @"Penelope";
            case AWSPollyVoiceIdRaveena:
                return @"Raveena";
            case AWSPollyVoiceIdRicardo:
                return @"Ricardo";
            case AWSPollyVoiceIdRuben:
                return @"Ruben";
            case AWSPollyVoiceIdRussell:
                return @"Russell";
            case AWSPollyVoiceIdSalli:
                return @"Salli";
            case AWSPollyVoiceIdSeoyeon:
                return @"Seoyeon";
            case AWSPollyVoiceIdTakumi:
                return @"Takumi";
            case AWSPollyVoiceIdTatyana:
                return @"Tatyana";
            case AWSPollyVoiceIdVicki:
                return @"Vicki";
            case AWSPollyVoiceIdVitoria:
                return @"Vitoria";
            case AWSPollyVoiceIdZeina:
                return @"Zeina";
            case AWSPollyVoiceIdZhiyu:
                return @"Zhiyu";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"arb"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeArb);
        }
        if ([value caseInsensitiveCompare:@"cmn-CN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeCmnCN);
        }
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
        if ([value caseInsensitiveCompare:@"es-MX"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeEsMX);
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
        if ([value caseInsensitiveCompare:@"hi-IN"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeHiIN);
        }
        if ([value caseInsensitiveCompare:@"ko-KR"] == NSOrderedSame) {
            return @(AWSPollyLanguageCodeKoKR);
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
            case AWSPollyLanguageCodeArb:
                return @"arb";
            case AWSPollyLanguageCodeCmnCN:
                return @"cmn-CN";
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
            case AWSPollyLanguageCodeEsMX:
                return @"es-MX";
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
            case AWSPollyLanguageCodeHiIN:
                return @"hi-IN";
            case AWSPollyLanguageCodeKoKR:
                return @"ko-KR";
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
