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

#import "AWSComprehendModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSComprehendErrorDomain = @"com.amazonaws.AWSComprehendErrorDomain";

@implementation AWSComprehendAugmentedManifestsListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"annotationDataS3Uri" : @"AnnotationDataS3Uri",
             @"attributeNames" : @"AttributeNames",
             @"documentType" : @"DocumentType",
             @"s3Uri" : @"S3Uri",
             @"sourceDocumentsS3Uri" : @"SourceDocumentsS3Uri",
             @"split" : @"Split",
             };
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PLAIN_TEXT_DOCUMENT"] == NSOrderedSame) {
            return @(AWSComprehendAugmentedManifestsDocumentTypeFormatPlainTextDocument);
        }
        if ([value caseInsensitiveCompare:@"SEMI_STRUCTURED_DOCUMENT"] == NSOrderedSame) {
            return @(AWSComprehendAugmentedManifestsDocumentTypeFormatSemiStructuredDocument);
        }
        return @(AWSComprehendAugmentedManifestsDocumentTypeFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendAugmentedManifestsDocumentTypeFormatPlainTextDocument:
                return @"PLAIN_TEXT_DOCUMENT";
            case AWSComprehendAugmentedManifestsDocumentTypeFormatSemiStructuredDocument:
                return @"SEMI_STRUCTURED_DOCUMENT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)splitJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRAIN"] == NSOrderedSame) {
            return @(AWSComprehendSplitTrain);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSComprehendSplitTest);
        }
        return @(AWSComprehendSplitUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendSplitTrain:
                return @"TRAIN";
            case AWSComprehendSplitTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendBatchDetectDominantLanguageItemResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"index" : @"Index",
             @"languages" : @"Languages",
             };
}

+ (NSValueTransformer *)languagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDominantLanguage class]];
}

@end

@implementation AWSComprehendBatchDetectDominantLanguageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"textList" : @"TextList",
             };
}

@end

@implementation AWSComprehendBatchDetectDominantLanguageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorList" : @"ErrorList",
             @"resultList" : @"ResultList",
             };
}

+ (NSValueTransformer *)errorListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBatchItemError class]];
}

+ (NSValueTransformer *)resultListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBatchDetectDominantLanguageItemResult class]];
}

@end

@implementation AWSComprehendBatchDetectEntitiesItemResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             @"index" : @"Index",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendEntity class]];
}

@end

@implementation AWSComprehendBatchDetectEntitiesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"textList" : @"TextList",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendBatchDetectEntitiesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorList" : @"ErrorList",
             @"resultList" : @"ResultList",
             };
}

+ (NSValueTransformer *)errorListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBatchItemError class]];
}

+ (NSValueTransformer *)resultListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBatchDetectEntitiesItemResult class]];
}

@end

@implementation AWSComprehendBatchDetectKeyPhrasesItemResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"index" : @"Index",
             @"keyPhrases" : @"KeyPhrases",
             };
}

+ (NSValueTransformer *)keyPhrasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendKeyPhrase class]];
}

@end

@implementation AWSComprehendBatchDetectKeyPhrasesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"textList" : @"TextList",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendBatchDetectKeyPhrasesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorList" : @"ErrorList",
             @"resultList" : @"ResultList",
             };
}

+ (NSValueTransformer *)errorListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBatchItemError class]];
}

+ (NSValueTransformer *)resultListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBatchDetectKeyPhrasesItemResult class]];
}

@end

@implementation AWSComprehendBatchDetectSentimentItemResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"index" : @"Index",
             @"sentiment" : @"Sentiment",
             @"sentimentScore" : @"SentimentScore",
             };
}

+ (NSValueTransformer *)sentimentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"POSITIVE"] == NSOrderedSame) {
            return @(AWSComprehendSentimentTypePositive);
        }
        if ([value caseInsensitiveCompare:@"NEGATIVE"] == NSOrderedSame) {
            return @(AWSComprehendSentimentTypeNegative);
        }
        if ([value caseInsensitiveCompare:@"NEUTRAL"] == NSOrderedSame) {
            return @(AWSComprehendSentimentTypeNeutral);
        }
        if ([value caseInsensitiveCompare:@"MIXED"] == NSOrderedSame) {
            return @(AWSComprehendSentimentTypeMixed);
        }
        return @(AWSComprehendSentimentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendSentimentTypePositive:
                return @"POSITIVE";
            case AWSComprehendSentimentTypeNegative:
                return @"NEGATIVE";
            case AWSComprehendSentimentTypeNeutral:
                return @"NEUTRAL";
            case AWSComprehendSentimentTypeMixed:
                return @"MIXED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sentimentScoreJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendSentimentScore class]];
}

@end

@implementation AWSComprehendBatchDetectSentimentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"textList" : @"TextList",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendBatchDetectSentimentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorList" : @"ErrorList",
             @"resultList" : @"ResultList",
             };
}

+ (NSValueTransformer *)errorListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBatchItemError class]];
}

+ (NSValueTransformer *)resultListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBatchDetectSentimentItemResult class]];
}

@end

@implementation AWSComprehendBatchDetectSyntaxItemResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"index" : @"Index",
             @"syntaxTokens" : @"SyntaxTokens",
             };
}

+ (NSValueTransformer *)syntaxTokensJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendSyntaxToken class]];
}

@end

@implementation AWSComprehendBatchDetectSyntaxRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"textList" : @"TextList",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendSyntaxLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendSyntaxLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendSyntaxLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendSyntaxLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendSyntaxLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendSyntaxLanguageCodePt);
        }
        return @(AWSComprehendSyntaxLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendSyntaxLanguageCodeEn:
                return @"en";
            case AWSComprehendSyntaxLanguageCodeEs:
                return @"es";
            case AWSComprehendSyntaxLanguageCodeFr:
                return @"fr";
            case AWSComprehendSyntaxLanguageCodeDe:
                return @"de";
            case AWSComprehendSyntaxLanguageCodeIt:
                return @"it";
            case AWSComprehendSyntaxLanguageCodePt:
                return @"pt";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendBatchDetectSyntaxResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorList" : @"ErrorList",
             @"resultList" : @"ResultList",
             };
}

+ (NSValueTransformer *)errorListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBatchItemError class]];
}

+ (NSValueTransformer *)resultListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBatchDetectSyntaxItemResult class]];
}

@end

@implementation AWSComprehendBatchDetectTargetedSentimentItemResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             @"index" : @"Index",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTargetedSentimentEntity class]];
}

@end

@implementation AWSComprehendBatchDetectTargetedSentimentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"textList" : @"TextList",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendBatchDetectTargetedSentimentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorList" : @"ErrorList",
             @"resultList" : @"ResultList",
             };
}

+ (NSValueTransformer *)errorListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBatchItemError class]];
}

+ (NSValueTransformer *)resultListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBatchDetectTargetedSentimentItemResult class]];
}

@end

@implementation AWSComprehendBatchItemError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"index" : @"Index",
             };
}

@end

@implementation AWSComprehendBlock

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockType" : @"BlockType",
             @"geometry" : @"Geometry",
             @"identifier" : @"Id",
             @"page" : @"Page",
             @"relationships" : @"Relationships",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)blockTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LINE"] == NSOrderedSame) {
            return @(AWSComprehendBlockTypeLine);
        }
        if ([value caseInsensitiveCompare:@"WORD"] == NSOrderedSame) {
            return @(AWSComprehendBlockTypeWord);
        }
        return @(AWSComprehendBlockTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendBlockTypeLine:
                return @"LINE";
            case AWSComprehendBlockTypeWord:
                return @"WORD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendGeometry class]];
}

+ (NSValueTransformer *)relationshipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendRelationshipsListItem class]];
}

@end

@implementation AWSComprehendBlockReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"beginOffset" : @"BeginOffset",
             @"blockId" : @"BlockId",
             @"childBlocks" : @"ChildBlocks",
             @"endOffset" : @"EndOffset",
             };
}

+ (NSValueTransformer *)childBlocksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendChildBlock class]];
}

@end

@implementation AWSComprehendBoundingBox

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"height" : @"Height",
             @"left" : @"Left",
             @"top" : @"Top",
             @"width" : @"Width",
             };
}

@end

@implementation AWSComprehendChildBlock

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"beginOffset" : @"BeginOffset",
             @"childBlockId" : @"ChildBlockId",
             @"endOffset" : @"EndOffset",
             };
}

@end

@implementation AWSComprehendClassifierEvaluationMetrics

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accuracy" : @"Accuracy",
             @"f1Score" : @"F1Score",
             @"hammingLoss" : @"HammingLoss",
             @"microF1Score" : @"MicroF1Score",
             @"microPrecision" : @"MicroPrecision",
             @"microRecall" : @"MicroRecall",
             @"precision" : @"Precision",
             @"recall" : @"Recall",
             };
}

@end

@implementation AWSComprehendClassifierMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evaluationMetrics" : @"EvaluationMetrics",
             @"numberOfLabels" : @"NumberOfLabels",
             @"numberOfTestDocuments" : @"NumberOfTestDocuments",
             @"numberOfTrainedDocuments" : @"NumberOfTrainedDocuments",
             };
}

+ (NSValueTransformer *)evaluationMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendClassifierEvaluationMetrics class]];
}

@end

@implementation AWSComprehendClassifyDocumentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytes" : @"Bytes",
             @"documentReaderConfig" : @"DocumentReaderConfig",
             @"endpointArn" : @"EndpointArn",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)documentReaderConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentReaderConfig class]];
}

@end

@implementation AWSComprehendClassifyDocumentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classes" : @"Classes",
             @"documentMetadata" : @"DocumentMetadata",
             @"documentType" : @"DocumentType",
             @"errors" : @"Errors",
             @"labels" : @"Labels",
             @"warnings" : @"Warnings",
             };
}

+ (NSValueTransformer *)classesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDocumentClass class]];
}

+ (NSValueTransformer *)documentMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentMetadata class]];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDocumentTypeListItem class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendErrorsListItem class]];
}

+ (NSValueTransformer *)labelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDocumentLabel class]];
}

+ (NSValueTransformer *)warningsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendWarningsListItem class]];
}

@end

@implementation AWSComprehendContainsPiiEntitiesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendContainsPiiEntitiesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labels" : @"Labels",
             };
}

+ (NSValueTransformer *)labelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendEntityLabel class]];
}

@end

@implementation AWSComprehendCreateDatasetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"datasetName" : @"DatasetName",
             @"datasetType" : @"DatasetType",
             @"detail" : @"Description",
             @"flywheelArn" : @"FlywheelArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)datasetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRAIN"] == NSOrderedSame) {
            return @(AWSComprehendDatasetTypeTrain);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSComprehendDatasetTypeTest);
        }
        return @(AWSComprehendDatasetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDatasetTypeTrain:
                return @"TRAIN";
            case AWSComprehendDatasetTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDatasetInputDataConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

@end

@implementation AWSComprehendCreateDatasetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetArn" : @"DatasetArn",
             };
}

@end

@implementation AWSComprehendCreateDocumentClassifierRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"documentClassifierName" : @"DocumentClassifierName",
             @"inputDataConfig" : @"InputDataConfig",
             @"languageCode" : @"LanguageCode",
             @"mode" : @"Mode",
             @"modelKmsKeyId" : @"ModelKmsKeyId",
             @"modelPolicy" : @"ModelPolicy",
             @"outputDataConfig" : @"OutputDataConfig",
             @"tags" : @"Tags",
             @"versionName" : @"VersionName",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentClassifierInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MULTI_CLASS"] == NSOrderedSame) {
            return @(AWSComprehendDocumentClassifierModeMultiClass);
        }
        if ([value caseInsensitiveCompare:@"MULTI_LABEL"] == NSOrderedSame) {
            return @(AWSComprehendDocumentClassifierModeMultiLabel);
        }
        return @(AWSComprehendDocumentClassifierModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDocumentClassifierModeMultiClass:
                return @"MULTI_CLASS";
            case AWSComprehendDocumentClassifierModeMultiLabel:
                return @"MULTI_LABEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentClassifierOutputDataConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendCreateDocumentClassifierResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierArn" : @"DocumentClassifierArn",
             };
}

@end

@implementation AWSComprehendCreateEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"desiredInferenceUnits" : @"DesiredInferenceUnits",
             @"endpointName" : @"EndpointName",
             @"flywheelArn" : @"FlywheelArn",
             @"modelArn" : @"ModelArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

@end

@implementation AWSComprehendCreateEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             @"modelArn" : @"ModelArn",
             };
}

@end

@implementation AWSComprehendCreateEntityRecognizerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"languageCode" : @"LanguageCode",
             @"modelKmsKeyId" : @"ModelKmsKeyId",
             @"modelPolicy" : @"ModelPolicy",
             @"recognizerName" : @"RecognizerName",
             @"tags" : @"Tags",
             @"versionName" : @"VersionName",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityRecognizerInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendCreateEntityRecognizerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             };
}

@end

@implementation AWSComprehendCreateFlywheelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeModelArn" : @"ActiveModelArn",
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"dataLakeS3Uri" : @"DataLakeS3Uri",
             @"dataSecurityConfig" : @"DataSecurityConfig",
             @"flywheelName" : @"FlywheelName",
             @"modelType" : @"ModelType",
             @"tags" : @"Tags",
             @"taskConfig" : @"TaskConfig",
             };
}

+ (NSValueTransformer *)dataSecurityConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDataSecurityConfig class]];
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DOCUMENT_CLASSIFIER"] == NSOrderedSame) {
            return @(AWSComprehendModelTypeDocumentClassifier);
        }
        if ([value caseInsensitiveCompare:@"ENTITY_RECOGNIZER"] == NSOrderedSame) {
            return @(AWSComprehendModelTypeEntityRecognizer);
        }
        return @(AWSComprehendModelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendModelTypeDocumentClassifier:
                return @"DOCUMENT_CLASSIFIER";
            case AWSComprehendModelTypeEntityRecognizer:
                return @"ENTITY_RECOGNIZER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

+ (NSValueTransformer *)taskConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendTaskConfig class]];
}

@end

@implementation AWSComprehendCreateFlywheelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeModelArn" : @"ActiveModelArn",
             @"flywheelArn" : @"FlywheelArn",
             };
}

@end

@implementation AWSComprehendDataSecurityConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataLakeKmsKeyId" : @"DataLakeKmsKeyId",
             @"modelKmsKeyId" : @"ModelKmsKeyId",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendDatasetAugmentedManifestsListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"annotationDataS3Uri" : @"AnnotationDataS3Uri",
             @"attributeNames" : @"AttributeNames",
             @"documentType" : @"DocumentType",
             @"s3Uri" : @"S3Uri",
             @"sourceDocumentsS3Uri" : @"SourceDocumentsS3Uri",
             };
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PLAIN_TEXT_DOCUMENT"] == NSOrderedSame) {
            return @(AWSComprehendAugmentedManifestsDocumentTypeFormatPlainTextDocument);
        }
        if ([value caseInsensitiveCompare:@"SEMI_STRUCTURED_DOCUMENT"] == NSOrderedSame) {
            return @(AWSComprehendAugmentedManifestsDocumentTypeFormatSemiStructuredDocument);
        }
        return @(AWSComprehendAugmentedManifestsDocumentTypeFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendAugmentedManifestsDocumentTypeFormatPlainTextDocument:
                return @"PLAIN_TEXT_DOCUMENT";
            case AWSComprehendAugmentedManifestsDocumentTypeFormatSemiStructuredDocument:
                return @"SEMI_STRUCTURED_DOCUMENT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDatasetDocumentClassifierInputDataConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelDelimiter" : @"LabelDelimiter",
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSComprehendDatasetEntityRecognizerAnnotations

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSComprehendDatasetEntityRecognizerDocuments

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputFormat" : @"InputFormat",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)inputFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_DOC_PER_FILE"] == NSOrderedSame) {
            return @(AWSComprehendInputFormatOneDocPerFile);
        }
        if ([value caseInsensitiveCompare:@"ONE_DOC_PER_LINE"] == NSOrderedSame) {
            return @(AWSComprehendInputFormatOneDocPerLine);
        }
        return @(AWSComprehendInputFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendInputFormatOneDocPerFile:
                return @"ONE_DOC_PER_FILE";
            case AWSComprehendInputFormatOneDocPerLine:
                return @"ONE_DOC_PER_LINE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDatasetEntityRecognizerEntityList

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSComprehendDatasetEntityRecognizerInputDataConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"annotations" : @"Annotations",
             @"documents" : @"Documents",
             @"entityList" : @"EntityList",
             };
}

+ (NSValueTransformer *)annotationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDatasetEntityRecognizerAnnotations class]];
}

+ (NSValueTransformer *)documentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDatasetEntityRecognizerDocuments class]];
}

+ (NSValueTransformer *)entityListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDatasetEntityRecognizerEntityList class]];
}

@end

@implementation AWSComprehendDatasetFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"datasetType" : @"DatasetType",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)datasetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRAIN"] == NSOrderedSame) {
            return @(AWSComprehendDatasetTypeTrain);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSComprehendDatasetTypeTest);
        }
        return @(AWSComprehendDatasetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDatasetTypeTrain:
                return @"TRAIN";
            case AWSComprehendDatasetTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSComprehendDatasetStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendDatasetStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendDatasetStatusFailed);
        }
        return @(AWSComprehendDatasetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDatasetStatusCreating:
                return @"CREATING";
            case AWSComprehendDatasetStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendDatasetStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDatasetInputDataConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"augmentedManifests" : @"AugmentedManifests",
             @"dataFormat" : @"DataFormat",
             @"documentClassifierInputDataConfig" : @"DocumentClassifierInputDataConfig",
             @"entityRecognizerInputDataConfig" : @"EntityRecognizerInputDataConfig",
             };
}

+ (NSValueTransformer *)augmentedManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDatasetAugmentedManifestsListItem class]];
}

+ (NSValueTransformer *)dataFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPREHEND_CSV"] == NSOrderedSame) {
            return @(AWSComprehendDatasetDataFormatComprehendCsv);
        }
        if ([value caseInsensitiveCompare:@"AUGMENTED_MANIFEST"] == NSOrderedSame) {
            return @(AWSComprehendDatasetDataFormatAugmentedManifest);
        }
        return @(AWSComprehendDatasetDataFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDatasetDataFormatComprehendCsv:
                return @"COMPREHEND_CSV";
            case AWSComprehendDatasetDataFormatAugmentedManifest:
                return @"AUGMENTED_MANIFEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentClassifierInputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDatasetDocumentClassifierInputDataConfig class]];
}

+ (NSValueTransformer *)entityRecognizerInputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDatasetEntityRecognizerInputDataConfig class]];
}

@end

@implementation AWSComprehendDatasetProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"datasetArn" : @"DatasetArn",
             @"datasetName" : @"DatasetName",
             @"datasetS3Uri" : @"DatasetS3Uri",
             @"datasetType" : @"DatasetType",
             @"detail" : @"Description",
             @"endTime" : @"EndTime",
             @"message" : @"Message",
             @"numberOfDocuments" : @"NumberOfDocuments",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)datasetTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRAIN"] == NSOrderedSame) {
            return @(AWSComprehendDatasetTypeTrain);
        }
        if ([value caseInsensitiveCompare:@"TEST"] == NSOrderedSame) {
            return @(AWSComprehendDatasetTypeTest);
        }
        return @(AWSComprehendDatasetTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDatasetTypeTrain:
                return @"TRAIN";
            case AWSComprehendDatasetTypeTest:
                return @"TEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSComprehendDatasetStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendDatasetStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendDatasetStatusFailed);
        }
        return @(AWSComprehendDatasetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDatasetStatusCreating:
                return @"CREATING";
            case AWSComprehendDatasetStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendDatasetStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDeleteDocumentClassifierRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierArn" : @"DocumentClassifierArn",
             };
}

@end

@implementation AWSComprehendDeleteDocumentClassifierResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSComprehendDeleteEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSComprehendDeleteEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSComprehendDeleteEntityRecognizerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             };
}

@end

@implementation AWSComprehendDeleteEntityRecognizerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSComprehendDeleteFlywheelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flywheelArn" : @"FlywheelArn",
             };
}

@end

@implementation AWSComprehendDeleteFlywheelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSComprehendDeleteResourcePolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyRevisionId" : @"PolicyRevisionId",
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSComprehendDeleteResourcePolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSComprehendDescribeDatasetRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetArn" : @"DatasetArn",
             };
}

@end

@implementation AWSComprehendDescribeDatasetResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetProperties" : @"DatasetProperties",
             };
}

+ (NSValueTransformer *)datasetPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDatasetProperties class]];
}

@end

@implementation AWSComprehendDescribeDocumentClassificationJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeDocumentClassificationJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassificationJobProperties" : @"DocumentClassificationJobProperties",
             };
}

+ (NSValueTransformer *)documentClassificationJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentClassificationJobProperties class]];
}

@end

@implementation AWSComprehendDescribeDocumentClassifierRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierArn" : @"DocumentClassifierArn",
             };
}

@end

@implementation AWSComprehendDescribeDocumentClassifierResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierProperties" : @"DocumentClassifierProperties",
             };
}

+ (NSValueTransformer *)documentClassifierPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentClassifierProperties class]];
}

@end

@implementation AWSComprehendDescribeDominantLanguageDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeDominantLanguageDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dominantLanguageDetectionJobProperties" : @"DominantLanguageDetectionJobProperties",
             };
}

+ (NSValueTransformer *)dominantLanguageDetectionJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDominantLanguageDetectionJobProperties class]];
}

@end

@implementation AWSComprehendDescribeEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSComprehendDescribeEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointProperties" : @"EndpointProperties",
             };
}

+ (NSValueTransformer *)endpointPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEndpointProperties class]];
}

@end

@implementation AWSComprehendDescribeEntitiesDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeEntitiesDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entitiesDetectionJobProperties" : @"EntitiesDetectionJobProperties",
             };
}

+ (NSValueTransformer *)entitiesDetectionJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntitiesDetectionJobProperties class]];
}

@end

@implementation AWSComprehendDescribeEntityRecognizerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             };
}

@end

@implementation AWSComprehendDescribeEntityRecognizerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityRecognizerProperties" : @"EntityRecognizerProperties",
             };
}

+ (NSValueTransformer *)entityRecognizerPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityRecognizerProperties class]];
}

@end

@implementation AWSComprehendDescribeEventsDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeEventsDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventsDetectionJobProperties" : @"EventsDetectionJobProperties",
             };
}

+ (NSValueTransformer *)eventsDetectionJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEventsDetectionJobProperties class]];
}

@end

@implementation AWSComprehendDescribeFlywheelIterationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flywheelArn" : @"FlywheelArn",
             @"flywheelIterationId" : @"FlywheelIterationId",
             };
}

@end

@implementation AWSComprehendDescribeFlywheelIterationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flywheelIterationProperties" : @"FlywheelIterationProperties",
             };
}

+ (NSValueTransformer *)flywheelIterationPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendFlywheelIterationProperties class]];
}

@end

@implementation AWSComprehendDescribeFlywheelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flywheelArn" : @"FlywheelArn",
             };
}

@end

@implementation AWSComprehendDescribeFlywheelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flywheelProperties" : @"FlywheelProperties",
             };
}

+ (NSValueTransformer *)flywheelPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendFlywheelProperties class]];
}

@end

@implementation AWSComprehendDescribeKeyPhrasesDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeKeyPhrasesDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPhrasesDetectionJobProperties" : @"KeyPhrasesDetectionJobProperties",
             };
}

+ (NSValueTransformer *)keyPhrasesDetectionJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendKeyPhrasesDetectionJobProperties class]];
}

@end

@implementation AWSComprehendDescribePiiEntitiesDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribePiiEntitiesDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"piiEntitiesDetectionJobProperties" : @"PiiEntitiesDetectionJobProperties",
             };
}

+ (NSValueTransformer *)piiEntitiesDetectionJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendPiiEntitiesDetectionJobProperties class]];
}

@end

@implementation AWSComprehendDescribeResourcePolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSComprehendDescribeResourcePolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"policyRevisionId" : @"PolicyRevisionId",
             @"resourcePolicy" : @"ResourcePolicy",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
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

@implementation AWSComprehendDescribeSentimentDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeSentimentDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sentimentDetectionJobProperties" : @"SentimentDetectionJobProperties",
             };
}

+ (NSValueTransformer *)sentimentDetectionJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendSentimentDetectionJobProperties class]];
}

@end

@implementation AWSComprehendDescribeTargetedSentimentDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeTargetedSentimentDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetedSentimentDetectionJobProperties" : @"TargetedSentimentDetectionJobProperties",
             };
}

+ (NSValueTransformer *)targetedSentimentDetectionJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendTargetedSentimentDetectionJobProperties class]];
}

@end

@implementation AWSComprehendDescribeTopicsDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeTopicsDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"topicsDetectionJobProperties" : @"TopicsDetectionJobProperties",
             };
}

+ (NSValueTransformer *)topicsDetectionJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendTopicsDetectionJobProperties class]];
}

@end

@implementation AWSComprehendDetectDominantLanguageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             };
}

@end

@implementation AWSComprehendDetectDominantLanguageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languages" : @"Languages",
             };
}

+ (NSValueTransformer *)languagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDominantLanguage class]];
}

@end

@implementation AWSComprehendDetectEntitiesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytes" : @"Bytes",
             @"documentReaderConfig" : @"DocumentReaderConfig",
             @"endpointArn" : @"EndpointArn",
             @"languageCode" : @"LanguageCode",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)documentReaderConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentReaderConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDetectEntitiesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blocks" : @"Blocks",
             @"documentMetadata" : @"DocumentMetadata",
             @"documentType" : @"DocumentType",
             @"entities" : @"Entities",
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)blocksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBlock class]];
}

+ (NSValueTransformer *)documentMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentMetadata class]];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDocumentTypeListItem class]];
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendEntity class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendErrorsListItem class]];
}

@end

@implementation AWSComprehendDetectKeyPhrasesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDetectKeyPhrasesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPhrases" : @"KeyPhrases",
             };
}

+ (NSValueTransformer *)keyPhrasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendKeyPhrase class]];
}

@end

@implementation AWSComprehendDetectPiiEntitiesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDetectPiiEntitiesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendPiiEntity class]];
}

@end

@implementation AWSComprehendDetectSentimentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDetectSentimentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sentiment" : @"Sentiment",
             @"sentimentScore" : @"SentimentScore",
             };
}

+ (NSValueTransformer *)sentimentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"POSITIVE"] == NSOrderedSame) {
            return @(AWSComprehendSentimentTypePositive);
        }
        if ([value caseInsensitiveCompare:@"NEGATIVE"] == NSOrderedSame) {
            return @(AWSComprehendSentimentTypeNegative);
        }
        if ([value caseInsensitiveCompare:@"NEUTRAL"] == NSOrderedSame) {
            return @(AWSComprehendSentimentTypeNeutral);
        }
        if ([value caseInsensitiveCompare:@"MIXED"] == NSOrderedSame) {
            return @(AWSComprehendSentimentTypeMixed);
        }
        return @(AWSComprehendSentimentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendSentimentTypePositive:
                return @"POSITIVE";
            case AWSComprehendSentimentTypeNegative:
                return @"NEGATIVE";
            case AWSComprehendSentimentTypeNeutral:
                return @"NEUTRAL";
            case AWSComprehendSentimentTypeMixed:
                return @"MIXED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sentimentScoreJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendSentimentScore class]];
}

@end

@implementation AWSComprehendDetectSyntaxRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendSyntaxLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendSyntaxLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendSyntaxLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendSyntaxLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendSyntaxLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendSyntaxLanguageCodePt);
        }
        return @(AWSComprehendSyntaxLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendSyntaxLanguageCodeEn:
                return @"en";
            case AWSComprehendSyntaxLanguageCodeEs:
                return @"es";
            case AWSComprehendSyntaxLanguageCodeFr:
                return @"fr";
            case AWSComprehendSyntaxLanguageCodeDe:
                return @"de";
            case AWSComprehendSyntaxLanguageCodeIt:
                return @"it";
            case AWSComprehendSyntaxLanguageCodePt:
                return @"pt";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDetectSyntaxResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"syntaxTokens" : @"SyntaxTokens",
             };
}

+ (NSValueTransformer *)syntaxTokensJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendSyntaxToken class]];
}

@end

@implementation AWSComprehendDetectTargetedSentimentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDetectTargetedSentimentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTargetedSentimentEntity class]];
}

@end

@implementation AWSComprehendDetectToxicContentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"textSegments" : @"TextSegments",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)textSegmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTextSegment class]];
}

@end

@implementation AWSComprehendDetectToxicContentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resultList" : @"ResultList",
             };
}

+ (NSValueTransformer *)resultListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendToxicLabels class]];
}

@end

@implementation AWSComprehendDocumentClass

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"page" : @"Page",
             @"score" : @"Score",
             };
}

@end

@implementation AWSComprehendDocumentClassificationConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labels" : @"Labels",
             @"mode" : @"Mode",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MULTI_CLASS"] == NSOrderedSame) {
            return @(AWSComprehendDocumentClassifierModeMultiClass);
        }
        if ([value caseInsensitiveCompare:@"MULTI_LABEL"] == NSOrderedSame) {
            return @(AWSComprehendDocumentClassifierModeMultiLabel);
        }
        return @(AWSComprehendDocumentClassifierModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDocumentClassifierModeMultiClass:
                return @"MULTI_CLASS";
            case AWSComprehendDocumentClassifierModeMultiLabel:
                return @"MULTI_LABEL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDocumentClassificationJobFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"submitTimeAfter" : @"SubmitTimeAfter",
             @"submitTimeBefore" : @"SubmitTimeBefore",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submitTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendDocumentClassificationJobProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"documentClassifierArn" : @"DocumentClassifierArn",
             @"endTime" : @"EndTime",
             @"flywheelArn" : @"FlywheelArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"message" : @"Message",
             @"outputDataConfig" : @"OutputDataConfig",
             @"submitTime" : @"SubmitTime",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)submitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendDocumentClassifierDocuments

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             @"testS3Uri" : @"TestS3Uri",
             };
}

@end

@implementation AWSComprehendDocumentClassifierFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierName" : @"DocumentClassifierName",
             @"status" : @"Status",
             @"submitTimeAfter" : @"SubmitTimeAfter",
             @"submitTimeBefore" : @"SubmitTimeBefore",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"TRAINING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"IN_ERROR"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusInError);
        }
        if ([value caseInsensitiveCompare:@"TRAINED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTrained);
        }
        if ([value caseInsensitiveCompare:@"TRAINED_WITH_WARNING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTrainedWithWarning);
        }
        return @(AWSComprehendModelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendModelStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendModelStatusTraining:
                return @"TRAINING";
            case AWSComprehendModelStatusDeleting:
                return @"DELETING";
            case AWSComprehendModelStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendModelStatusStopped:
                return @"STOPPED";
            case AWSComprehendModelStatusInError:
                return @"IN_ERROR";
            case AWSComprehendModelStatusTrained:
                return @"TRAINED";
            case AWSComprehendModelStatusTrainedWithWarning:
                return @"TRAINED_WITH_WARNING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submitTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendDocumentClassifierInputDataConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"augmentedManifests" : @"AugmentedManifests",
             @"dataFormat" : @"DataFormat",
             @"documentReaderConfig" : @"DocumentReaderConfig",
             @"documentType" : @"DocumentType",
             @"documents" : @"Documents",
             @"labelDelimiter" : @"LabelDelimiter",
             @"s3Uri" : @"S3Uri",
             @"testS3Uri" : @"TestS3Uri",
             };
}

+ (NSValueTransformer *)augmentedManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendAugmentedManifestsListItem class]];
}

+ (NSValueTransformer *)dataFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPREHEND_CSV"] == NSOrderedSame) {
            return @(AWSComprehendDocumentClassifierDataFormatComprehendCsv);
        }
        if ([value caseInsensitiveCompare:@"AUGMENTED_MANIFEST"] == NSOrderedSame) {
            return @(AWSComprehendDocumentClassifierDataFormatAugmentedManifest);
        }
        return @(AWSComprehendDocumentClassifierDataFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDocumentClassifierDataFormatComprehendCsv:
                return @"COMPREHEND_CSV";
            case AWSComprehendDocumentClassifierDataFormatAugmentedManifest:
                return @"AUGMENTED_MANIFEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentReaderConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentReaderConfig class]];
}

+ (NSValueTransformer *)documentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PLAIN_TEXT_DOCUMENT"] == NSOrderedSame) {
            return @(AWSComprehendDocumentClassifierDocumentTypeFormatPlainTextDocument);
        }
        if ([value caseInsensitiveCompare:@"SEMI_STRUCTURED_DOCUMENT"] == NSOrderedSame) {
            return @(AWSComprehendDocumentClassifierDocumentTypeFormatSemiStructuredDocument);
        }
        return @(AWSComprehendDocumentClassifierDocumentTypeFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDocumentClassifierDocumentTypeFormatPlainTextDocument:
                return @"PLAIN_TEXT_DOCUMENT";
            case AWSComprehendDocumentClassifierDocumentTypeFormatSemiStructuredDocument:
                return @"SEMI_STRUCTURED_DOCUMENT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentClassifierDocuments class]];
}

@end

@implementation AWSComprehendDocumentClassifierOutputDataConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flywheelStatsS3Prefix" : @"FlywheelStatsS3Prefix",
             @"kmsKeyId" : @"KmsKeyId",
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSComprehendDocumentClassifierProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classifierMetadata" : @"ClassifierMetadata",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"documentClassifierArn" : @"DocumentClassifierArn",
             @"endTime" : @"EndTime",
             @"flywheelArn" : @"FlywheelArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"languageCode" : @"LanguageCode",
             @"message" : @"Message",
             @"mode" : @"Mode",
             @"modelKmsKeyId" : @"ModelKmsKeyId",
             @"outputDataConfig" : @"OutputDataConfig",
             @"sourceModelArn" : @"SourceModelArn",
             @"status" : @"Status",
             @"submitTime" : @"SubmitTime",
             @"trainingEndTime" : @"TrainingEndTime",
             @"trainingStartTime" : @"TrainingStartTime",
             @"versionName" : @"VersionName",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)classifierMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendClassifierMetadata class]];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentClassifierInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MULTI_CLASS"] == NSOrderedSame) {
            return @(AWSComprehendDocumentClassifierModeMultiClass);
        }
        if ([value caseInsensitiveCompare:@"MULTI_LABEL"] == NSOrderedSame) {
            return @(AWSComprehendDocumentClassifierModeMultiLabel);
        }
        return @(AWSComprehendDocumentClassifierModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDocumentClassifierModeMultiClass:
                return @"MULTI_CLASS";
            case AWSComprehendDocumentClassifierModeMultiLabel:
                return @"MULTI_LABEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentClassifierOutputDataConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"TRAINING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"IN_ERROR"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusInError);
        }
        if ([value caseInsensitiveCompare:@"TRAINED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTrained);
        }
        if ([value caseInsensitiveCompare:@"TRAINED_WITH_WARNING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTrainedWithWarning);
        }
        return @(AWSComprehendModelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendModelStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendModelStatusTraining:
                return @"TRAINING";
            case AWSComprehendModelStatusDeleting:
                return @"DELETING";
            case AWSComprehendModelStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendModelStatusStopped:
                return @"STOPPED";
            case AWSComprehendModelStatusInError:
                return @"IN_ERROR";
            case AWSComprehendModelStatusTrained:
                return @"TRAINED";
            case AWSComprehendModelStatusTrainedWithWarning:
                return @"TRAINED_WITH_WARNING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)trainingEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)trainingStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendDocumentClassifierSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierName" : @"DocumentClassifierName",
             @"latestVersionCreatedAt" : @"LatestVersionCreatedAt",
             @"latestVersionName" : @"LatestVersionName",
             @"latestVersionStatus" : @"LatestVersionStatus",
             @"numberOfVersions" : @"NumberOfVersions",
             };
}

+ (NSValueTransformer *)latestVersionCreatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)latestVersionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"TRAINING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"IN_ERROR"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusInError);
        }
        if ([value caseInsensitiveCompare:@"TRAINED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTrained);
        }
        if ([value caseInsensitiveCompare:@"TRAINED_WITH_WARNING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTrainedWithWarning);
        }
        return @(AWSComprehendModelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendModelStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendModelStatusTraining:
                return @"TRAINING";
            case AWSComprehendModelStatusDeleting:
                return @"DELETING";
            case AWSComprehendModelStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendModelStatusStopped:
                return @"STOPPED";
            case AWSComprehendModelStatusInError:
                return @"IN_ERROR";
            case AWSComprehendModelStatusTrained:
                return @"TRAINED";
            case AWSComprehendModelStatusTrainedWithWarning:
                return @"TRAINED_WITH_WARNING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDocumentLabel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"page" : @"Page",
             @"score" : @"Score",
             };
}

@end

@implementation AWSComprehendDocumentMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"extractedCharacters" : @"ExtractedCharacters",
             @"pages" : @"Pages",
             };
}

+ (NSValueTransformer *)extractedCharactersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendExtractedCharactersListItem class]];
}

@end

@implementation AWSComprehendDocumentReaderConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentReadAction" : @"DocumentReadAction",
             @"documentReadMode" : @"DocumentReadMode",
             @"featureTypes" : @"FeatureTypes",
             };
}

+ (NSValueTransformer *)documentReadActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TEXTRACT_DETECT_DOCUMENT_TEXT"] == NSOrderedSame) {
            return @(AWSComprehendDocumentReadActionTextractDetectDocumentText);
        }
        if ([value caseInsensitiveCompare:@"TEXTRACT_ANALYZE_DOCUMENT"] == NSOrderedSame) {
            return @(AWSComprehendDocumentReadActionTextractAnalyzeDocument);
        }
        return @(AWSComprehendDocumentReadActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDocumentReadActionTextractDetectDocumentText:
                return @"TEXTRACT_DETECT_DOCUMENT_TEXT";
            case AWSComprehendDocumentReadActionTextractAnalyzeDocument:
                return @"TEXTRACT_ANALYZE_DOCUMENT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentReadModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVICE_DEFAULT"] == NSOrderedSame) {
            return @(AWSComprehendDocumentReadModeServiceDefault);
        }
        if ([value caseInsensitiveCompare:@"FORCE_DOCUMENT_READ_ACTION"] == NSOrderedSame) {
            return @(AWSComprehendDocumentReadModeForceDocumentReadAction);
        }
        return @(AWSComprehendDocumentReadModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDocumentReadModeServiceDefault:
                return @"SERVICE_DEFAULT";
            case AWSComprehendDocumentReadModeForceDocumentReadAction:
                return @"FORCE_DOCUMENT_READ_ACTION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDocumentTypeListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"page" : @"Page",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NATIVE_PDF"] == NSOrderedSame) {
            return @(AWSComprehendDocumentTypeNativePdf);
        }
        if ([value caseInsensitiveCompare:@"SCANNED_PDF"] == NSOrderedSame) {
            return @(AWSComprehendDocumentTypeScannedPdf);
        }
        if ([value caseInsensitiveCompare:@"MS_WORD"] == NSOrderedSame) {
            return @(AWSComprehendDocumentTypeMsWord);
        }
        if ([value caseInsensitiveCompare:@"IMAGE"] == NSOrderedSame) {
            return @(AWSComprehendDocumentTypeImage);
        }
        if ([value caseInsensitiveCompare:@"PLAIN_TEXT"] == NSOrderedSame) {
            return @(AWSComprehendDocumentTypePlainText);
        }
        if ([value caseInsensitiveCompare:@"TEXTRACT_DETECT_DOCUMENT_TEXT_JSON"] == NSOrderedSame) {
            return @(AWSComprehendDocumentTypeTextractDetectDocumentTextJson);
        }
        if ([value caseInsensitiveCompare:@"TEXTRACT_ANALYZE_DOCUMENT_JSON"] == NSOrderedSame) {
            return @(AWSComprehendDocumentTypeTextractAnalyzeDocumentJson);
        }
        return @(AWSComprehendDocumentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendDocumentTypeNativePdf:
                return @"NATIVE_PDF";
            case AWSComprehendDocumentTypeScannedPdf:
                return @"SCANNED_PDF";
            case AWSComprehendDocumentTypeMsWord:
                return @"MS_WORD";
            case AWSComprehendDocumentTypeImage:
                return @"IMAGE";
            case AWSComprehendDocumentTypePlainText:
                return @"PLAIN_TEXT";
            case AWSComprehendDocumentTypeTextractDetectDocumentTextJson:
                return @"TEXTRACT_DETECT_DOCUMENT_TEXT_JSON";
            case AWSComprehendDocumentTypeTextractAnalyzeDocumentJson:
                return @"TEXTRACT_ANALYZE_DOCUMENT_JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendDominantLanguage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"score" : @"Score",
             };
}

@end

@implementation AWSComprehendDominantLanguageDetectionJobFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"submitTimeAfter" : @"SubmitTimeAfter",
             @"submitTimeBefore" : @"SubmitTimeBefore",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submitTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendDominantLanguageDetectionJobProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"message" : @"Message",
             @"outputDataConfig" : @"OutputDataConfig",
             @"submitTime" : @"SubmitTime",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)submitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendEndpointFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"modelArn" : @"ModelArn",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSComprehendEndpointStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSComprehendEndpointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendEndpointStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"IN_SERVICE"] == NSOrderedSame) {
            return @(AWSComprehendEndpointStatusInService);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSComprehendEndpointStatusUpdating);
        }
        return @(AWSComprehendEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendEndpointStatusCreating:
                return @"CREATING";
            case AWSComprehendEndpointStatusDeleting:
                return @"DELETING";
            case AWSComprehendEndpointStatusFailed:
                return @"FAILED";
            case AWSComprehendEndpointStatusInService:
                return @"IN_SERVICE";
            case AWSComprehendEndpointStatusUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendEndpointProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"currentInferenceUnits" : @"CurrentInferenceUnits",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"desiredDataAccessRoleArn" : @"DesiredDataAccessRoleArn",
             @"desiredInferenceUnits" : @"DesiredInferenceUnits",
             @"desiredModelArn" : @"DesiredModelArn",
             @"endpointArn" : @"EndpointArn",
             @"flywheelArn" : @"FlywheelArn",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"message" : @"Message",
             @"modelArn" : @"ModelArn",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSComprehendEndpointStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSComprehendEndpointStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendEndpointStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"IN_SERVICE"] == NSOrderedSame) {
            return @(AWSComprehendEndpointStatusInService);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSComprehendEndpointStatusUpdating);
        }
        return @(AWSComprehendEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendEndpointStatusCreating:
                return @"CREATING";
            case AWSComprehendEndpointStatusDeleting:
                return @"DELETING";
            case AWSComprehendEndpointStatusFailed:
                return @"FAILED";
            case AWSComprehendEndpointStatusInService:
                return @"IN_SERVICE";
            case AWSComprehendEndpointStatusUpdating:
                return @"UPDATING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendEntitiesDetectionJobFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"submitTimeAfter" : @"SubmitTimeAfter",
             @"submitTimeBefore" : @"SubmitTimeBefore",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submitTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendEntitiesDetectionJobProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             @"flywheelArn" : @"FlywheelArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"languageCode" : @"LanguageCode",
             @"message" : @"Message",
             @"outputDataConfig" : @"OutputDataConfig",
             @"submitTime" : @"SubmitTime",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)submitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendEntity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"beginOffset" : @"BeginOffset",
             @"blockReferences" : @"BlockReferences",
             @"endOffset" : @"EndOffset",
             @"score" : @"Score",
             @"text" : @"Text",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)blockReferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendBlockReference class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PERSON"] == NSOrderedSame) {
            return @(AWSComprehendEntityTypePerson);
        }
        if ([value caseInsensitiveCompare:@"LOCATION"] == NSOrderedSame) {
            return @(AWSComprehendEntityTypeLocation);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATION"] == NSOrderedSame) {
            return @(AWSComprehendEntityTypeOrganization);
        }
        if ([value caseInsensitiveCompare:@"COMMERCIAL_ITEM"] == NSOrderedSame) {
            return @(AWSComprehendEntityTypeCommercialItem);
        }
        if ([value caseInsensitiveCompare:@"EVENT"] == NSOrderedSame) {
            return @(AWSComprehendEntityTypeEvent);
        }
        if ([value caseInsensitiveCompare:@"DATE"] == NSOrderedSame) {
            return @(AWSComprehendEntityTypeDate);
        }
        if ([value caseInsensitiveCompare:@"QUANTITY"] == NSOrderedSame) {
            return @(AWSComprehendEntityTypeQuantity);
        }
        if ([value caseInsensitiveCompare:@"TITLE"] == NSOrderedSame) {
            return @(AWSComprehendEntityTypeTitle);
        }
        if ([value caseInsensitiveCompare:@"OTHER"] == NSOrderedSame) {
            return @(AWSComprehendEntityTypeOther);
        }
        return @(AWSComprehendEntityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendEntityTypePerson:
                return @"PERSON";
            case AWSComprehendEntityTypeLocation:
                return @"LOCATION";
            case AWSComprehendEntityTypeOrganization:
                return @"ORGANIZATION";
            case AWSComprehendEntityTypeCommercialItem:
                return @"COMMERCIAL_ITEM";
            case AWSComprehendEntityTypeEvent:
                return @"EVENT";
            case AWSComprehendEntityTypeDate:
                return @"DATE";
            case AWSComprehendEntityTypeQuantity:
                return @"QUANTITY";
            case AWSComprehendEntityTypeTitle:
                return @"TITLE";
            case AWSComprehendEntityTypeOther:
                return @"OTHER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendEntityLabel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"score" : @"Score",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BANK_ACCOUNT_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeBankAccountNumber);
        }
        if ([value caseInsensitiveCompare:@"BANK_ROUTING"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeBankRouting);
        }
        if ([value caseInsensitiveCompare:@"CREDIT_DEBIT_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeCreditDebitNumber);
        }
        if ([value caseInsensitiveCompare:@"CREDIT_DEBIT_CVV"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeCreditDebitCvv);
        }
        if ([value caseInsensitiveCompare:@"CREDIT_DEBIT_EXPIRY"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeCreditDebitExpiry);
        }
        if ([value caseInsensitiveCompare:@"PIN"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypePin);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"ADDRESS"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeAddress);
        }
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeName);
        }
        if ([value caseInsensitiveCompare:@"PHONE"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypePhone);
        }
        if ([value caseInsensitiveCompare:@"SSN"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeSsn);
        }
        if ([value caseInsensitiveCompare:@"DATE_TIME"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeDateTime);
        }
        if ([value caseInsensitiveCompare:@"PASSPORT_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypePassportNumber);
        }
        if ([value caseInsensitiveCompare:@"DRIVER_ID"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeDriverId);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeUrl);
        }
        if ([value caseInsensitiveCompare:@"AGE"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeAge);
        }
        if ([value caseInsensitiveCompare:@"USERNAME"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeUsername);
        }
        if ([value caseInsensitiveCompare:@"PASSWORD"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypePassword);
        }
        if ([value caseInsensitiveCompare:@"AWS_ACCESS_KEY"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeAwsAccessKey);
        }
        if ([value caseInsensitiveCompare:@"AWS_SECRET_KEY"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeAwsSecretKey);
        }
        if ([value caseInsensitiveCompare:@"IP_ADDRESS"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeIpAddress);
        }
        if ([value caseInsensitiveCompare:@"MAC_ADDRESS"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeMacAddress);
        }
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeAll);
        }
        if ([value caseInsensitiveCompare:@"LICENSE_PLATE"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeLicensePlate);
        }
        if ([value caseInsensitiveCompare:@"VEHICLE_IDENTIFICATION_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeVehicleIdentificationNumber);
        }
        if ([value caseInsensitiveCompare:@"UK_NATIONAL_INSURANCE_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeUkNationalInsuranceNumber);
        }
        if ([value caseInsensitiveCompare:@"CA_SOCIAL_INSURANCE_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeCaSocialInsuranceNumber);
        }
        if ([value caseInsensitiveCompare:@"US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeUsIndividualTaxIdentificationNumber);
        }
        if ([value caseInsensitiveCompare:@"UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeUkUniqueTaxpayerReferenceNumber);
        }
        if ([value caseInsensitiveCompare:@"IN_PERMANENT_ACCOUNT_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeInPermanentAccountNumber);
        }
        if ([value caseInsensitiveCompare:@"IN_NREGA"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeInNrega);
        }
        if ([value caseInsensitiveCompare:@"INTERNATIONAL_BANK_ACCOUNT_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeInternationalBankAccountNumber);
        }
        if ([value caseInsensitiveCompare:@"SWIFT_CODE"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeSwiftCode);
        }
        if ([value caseInsensitiveCompare:@"UK_NATIONAL_HEALTH_SERVICE_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeUkNationalHealthServiceNumber);
        }
        if ([value caseInsensitiveCompare:@"CA_HEALTH_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeCaHealthNumber);
        }
        if ([value caseInsensitiveCompare:@"IN_AADHAAR"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeInAadhaar);
        }
        if ([value caseInsensitiveCompare:@"IN_VOTER_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeInVoterNumber);
        }
        return @(AWSComprehendPiiEntityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendPiiEntityTypeBankAccountNumber:
                return @"BANK_ACCOUNT_NUMBER";
            case AWSComprehendPiiEntityTypeBankRouting:
                return @"BANK_ROUTING";
            case AWSComprehendPiiEntityTypeCreditDebitNumber:
                return @"CREDIT_DEBIT_NUMBER";
            case AWSComprehendPiiEntityTypeCreditDebitCvv:
                return @"CREDIT_DEBIT_CVV";
            case AWSComprehendPiiEntityTypeCreditDebitExpiry:
                return @"CREDIT_DEBIT_EXPIRY";
            case AWSComprehendPiiEntityTypePin:
                return @"PIN";
            case AWSComprehendPiiEntityTypeEmail:
                return @"EMAIL";
            case AWSComprehendPiiEntityTypeAddress:
                return @"ADDRESS";
            case AWSComprehendPiiEntityTypeName:
                return @"NAME";
            case AWSComprehendPiiEntityTypePhone:
                return @"PHONE";
            case AWSComprehendPiiEntityTypeSsn:
                return @"SSN";
            case AWSComprehendPiiEntityTypeDateTime:
                return @"DATE_TIME";
            case AWSComprehendPiiEntityTypePassportNumber:
                return @"PASSPORT_NUMBER";
            case AWSComprehendPiiEntityTypeDriverId:
                return @"DRIVER_ID";
            case AWSComprehendPiiEntityTypeUrl:
                return @"URL";
            case AWSComprehendPiiEntityTypeAge:
                return @"AGE";
            case AWSComprehendPiiEntityTypeUsername:
                return @"USERNAME";
            case AWSComprehendPiiEntityTypePassword:
                return @"PASSWORD";
            case AWSComprehendPiiEntityTypeAwsAccessKey:
                return @"AWS_ACCESS_KEY";
            case AWSComprehendPiiEntityTypeAwsSecretKey:
                return @"AWS_SECRET_KEY";
            case AWSComprehendPiiEntityTypeIpAddress:
                return @"IP_ADDRESS";
            case AWSComprehendPiiEntityTypeMacAddress:
                return @"MAC_ADDRESS";
            case AWSComprehendPiiEntityTypeAll:
                return @"ALL";
            case AWSComprehendPiiEntityTypeLicensePlate:
                return @"LICENSE_PLATE";
            case AWSComprehendPiiEntityTypeVehicleIdentificationNumber:
                return @"VEHICLE_IDENTIFICATION_NUMBER";
            case AWSComprehendPiiEntityTypeUkNationalInsuranceNumber:
                return @"UK_NATIONAL_INSURANCE_NUMBER";
            case AWSComprehendPiiEntityTypeCaSocialInsuranceNumber:
                return @"CA_SOCIAL_INSURANCE_NUMBER";
            case AWSComprehendPiiEntityTypeUsIndividualTaxIdentificationNumber:
                return @"US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER";
            case AWSComprehendPiiEntityTypeUkUniqueTaxpayerReferenceNumber:
                return @"UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER";
            case AWSComprehendPiiEntityTypeInPermanentAccountNumber:
                return @"IN_PERMANENT_ACCOUNT_NUMBER";
            case AWSComprehendPiiEntityTypeInNrega:
                return @"IN_NREGA";
            case AWSComprehendPiiEntityTypeInternationalBankAccountNumber:
                return @"INTERNATIONAL_BANK_ACCOUNT_NUMBER";
            case AWSComprehendPiiEntityTypeSwiftCode:
                return @"SWIFT_CODE";
            case AWSComprehendPiiEntityTypeUkNationalHealthServiceNumber:
                return @"UK_NATIONAL_HEALTH_SERVICE_NUMBER";
            case AWSComprehendPiiEntityTypeCaHealthNumber:
                return @"CA_HEALTH_NUMBER";
            case AWSComprehendPiiEntityTypeInAadhaar:
                return @"IN_AADHAAR";
            case AWSComprehendPiiEntityTypeInVoterNumber:
                return @"IN_VOTER_NUMBER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendEntityRecognitionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityTypes" : @"EntityTypes",
             };
}

+ (NSValueTransformer *)entityTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendEntityTypesListItem class]];
}

@end

@implementation AWSComprehendEntityRecognizerAnnotations

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             @"testS3Uri" : @"TestS3Uri",
             };
}

@end

@implementation AWSComprehendEntityRecognizerDocuments

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inputFormat" : @"InputFormat",
             @"s3Uri" : @"S3Uri",
             @"testS3Uri" : @"TestS3Uri",
             };
}

+ (NSValueTransformer *)inputFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_DOC_PER_FILE"] == NSOrderedSame) {
            return @(AWSComprehendInputFormatOneDocPerFile);
        }
        if ([value caseInsensitiveCompare:@"ONE_DOC_PER_LINE"] == NSOrderedSame) {
            return @(AWSComprehendInputFormatOneDocPerLine);
        }
        return @(AWSComprehendInputFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendInputFormatOneDocPerFile:
                return @"ONE_DOC_PER_FILE";
            case AWSComprehendInputFormatOneDocPerLine:
                return @"ONE_DOC_PER_LINE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendEntityRecognizerEntityList

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSComprehendEntityRecognizerEvaluationMetrics

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"f1Score" : @"F1Score",
             @"precision" : @"Precision",
             @"recall" : @"Recall",
             };
}

@end

@implementation AWSComprehendEntityRecognizerFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recognizerName" : @"RecognizerName",
             @"status" : @"Status",
             @"submitTimeAfter" : @"SubmitTimeAfter",
             @"submitTimeBefore" : @"SubmitTimeBefore",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"TRAINING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"IN_ERROR"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusInError);
        }
        if ([value caseInsensitiveCompare:@"TRAINED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTrained);
        }
        if ([value caseInsensitiveCompare:@"TRAINED_WITH_WARNING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTrainedWithWarning);
        }
        return @(AWSComprehendModelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendModelStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendModelStatusTraining:
                return @"TRAINING";
            case AWSComprehendModelStatusDeleting:
                return @"DELETING";
            case AWSComprehendModelStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendModelStatusStopped:
                return @"STOPPED";
            case AWSComprehendModelStatusInError:
                return @"IN_ERROR";
            case AWSComprehendModelStatusTrained:
                return @"TRAINED";
            case AWSComprehendModelStatusTrainedWithWarning:
                return @"TRAINED_WITH_WARNING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submitTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendEntityRecognizerInputDataConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"annotations" : @"Annotations",
             @"augmentedManifests" : @"AugmentedManifests",
             @"dataFormat" : @"DataFormat",
             @"documents" : @"Documents",
             @"entityList" : @"EntityList",
             @"entityTypes" : @"EntityTypes",
             };
}

+ (NSValueTransformer *)annotationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityRecognizerAnnotations class]];
}

+ (NSValueTransformer *)augmentedManifestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendAugmentedManifestsListItem class]];
}

+ (NSValueTransformer *)dataFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPREHEND_CSV"] == NSOrderedSame) {
            return @(AWSComprehendEntityRecognizerDataFormatComprehendCsv);
        }
        if ([value caseInsensitiveCompare:@"AUGMENTED_MANIFEST"] == NSOrderedSame) {
            return @(AWSComprehendEntityRecognizerDataFormatAugmentedManifest);
        }
        return @(AWSComprehendEntityRecognizerDataFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendEntityRecognizerDataFormatComprehendCsv:
                return @"COMPREHEND_CSV";
            case AWSComprehendEntityRecognizerDataFormatAugmentedManifest:
                return @"AUGMENTED_MANIFEST";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)documentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityRecognizerDocuments class]];
}

+ (NSValueTransformer *)entityListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityRecognizerEntityList class]];
}

+ (NSValueTransformer *)entityTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendEntityTypesListItem class]];
}

@end

@implementation AWSComprehendEntityRecognizerMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityTypes" : @"EntityTypes",
             @"evaluationMetrics" : @"EvaluationMetrics",
             @"numberOfTestDocuments" : @"NumberOfTestDocuments",
             @"numberOfTrainedDocuments" : @"NumberOfTrainedDocuments",
             };
}

+ (NSValueTransformer *)entityTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendEntityRecognizerMetadataEntityTypesListItem class]];
}

+ (NSValueTransformer *)evaluationMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityRecognizerEvaluationMetrics class]];
}

@end

@implementation AWSComprehendEntityRecognizerMetadataEntityTypesListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"evaluationMetrics" : @"EvaluationMetrics",
             @"numberOfTrainMentions" : @"NumberOfTrainMentions",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)evaluationMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityTypesEvaluationMetrics class]];
}

@end

@implementation AWSComprehendEntityRecognizerOutputDataConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flywheelStatsS3Prefix" : @"FlywheelStatsS3Prefix",
             };
}

@end

@implementation AWSComprehendEntityRecognizerProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             @"flywheelArn" : @"FlywheelArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"languageCode" : @"LanguageCode",
             @"message" : @"Message",
             @"modelKmsKeyId" : @"ModelKmsKeyId",
             @"outputDataConfig" : @"OutputDataConfig",
             @"recognizerMetadata" : @"RecognizerMetadata",
             @"sourceModelArn" : @"SourceModelArn",
             @"status" : @"Status",
             @"submitTime" : @"SubmitTime",
             @"trainingEndTime" : @"TrainingEndTime",
             @"trainingStartTime" : @"TrainingStartTime",
             @"versionName" : @"VersionName",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityRecognizerInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityRecognizerOutputDataConfig class]];
}

+ (NSValueTransformer *)recognizerMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityRecognizerMetadata class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"TRAINING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"IN_ERROR"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusInError);
        }
        if ([value caseInsensitiveCompare:@"TRAINED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTrained);
        }
        if ([value caseInsensitiveCompare:@"TRAINED_WITH_WARNING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTrainedWithWarning);
        }
        return @(AWSComprehendModelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendModelStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendModelStatusTraining:
                return @"TRAINING";
            case AWSComprehendModelStatusDeleting:
                return @"DELETING";
            case AWSComprehendModelStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendModelStatusStopped:
                return @"STOPPED";
            case AWSComprehendModelStatusInError:
                return @"IN_ERROR";
            case AWSComprehendModelStatusTrained:
                return @"TRAINED";
            case AWSComprehendModelStatusTrainedWithWarning:
                return @"TRAINED_WITH_WARNING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)trainingEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)trainingStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendEntityRecognizerSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestVersionCreatedAt" : @"LatestVersionCreatedAt",
             @"latestVersionName" : @"LatestVersionName",
             @"latestVersionStatus" : @"LatestVersionStatus",
             @"numberOfVersions" : @"NumberOfVersions",
             @"recognizerName" : @"RecognizerName",
             };
}

+ (NSValueTransformer *)latestVersionCreatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)latestVersionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"TRAINING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusStopped);
        }
        if ([value caseInsensitiveCompare:@"IN_ERROR"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusInError);
        }
        if ([value caseInsensitiveCompare:@"TRAINED"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTrained);
        }
        if ([value caseInsensitiveCompare:@"TRAINED_WITH_WARNING"] == NSOrderedSame) {
            return @(AWSComprehendModelStatusTrainedWithWarning);
        }
        return @(AWSComprehendModelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendModelStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendModelStatusTraining:
                return @"TRAINING";
            case AWSComprehendModelStatusDeleting:
                return @"DELETING";
            case AWSComprehendModelStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendModelStatusStopped:
                return @"STOPPED";
            case AWSComprehendModelStatusInError:
                return @"IN_ERROR";
            case AWSComprehendModelStatusTrained:
                return @"TRAINED";
            case AWSComprehendModelStatusTrainedWithWarning:
                return @"TRAINED_WITH_WARNING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendEntityTypesEvaluationMetrics

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"f1Score" : @"F1Score",
             @"precision" : @"Precision",
             @"recall" : @"Recall",
             };
}

@end

@implementation AWSComprehendEntityTypesListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

@end

@implementation AWSComprehendErrorsListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"page" : @"Page",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TEXTRACT_BAD_PAGE"] == NSOrderedSame) {
            return @(AWSComprehendPageBasedErrorCodeTextractBadPage);
        }
        if ([value caseInsensitiveCompare:@"TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED"] == NSOrderedSame) {
            return @(AWSComprehendPageBasedErrorCodeTextractProvisionedThroughputExceeded);
        }
        if ([value caseInsensitiveCompare:@"PAGE_CHARACTERS_EXCEEDED"] == NSOrderedSame) {
            return @(AWSComprehendPageBasedErrorCodePageCharactersExceeded);
        }
        if ([value caseInsensitiveCompare:@"PAGE_SIZE_EXCEEDED"] == NSOrderedSame) {
            return @(AWSComprehendPageBasedErrorCodePageSizeExceeded);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_SERVER_ERROR"] == NSOrderedSame) {
            return @(AWSComprehendPageBasedErrorCodeInternalServerError);
        }
        return @(AWSComprehendPageBasedErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendPageBasedErrorCodeTextractBadPage:
                return @"TEXTRACT_BAD_PAGE";
            case AWSComprehendPageBasedErrorCodeTextractProvisionedThroughputExceeded:
                return @"TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED";
            case AWSComprehendPageBasedErrorCodePageCharactersExceeded:
                return @"PAGE_CHARACTERS_EXCEEDED";
            case AWSComprehendPageBasedErrorCodePageSizeExceeded:
                return @"PAGE_SIZE_EXCEEDED";
            case AWSComprehendPageBasedErrorCodeInternalServerError:
                return @"INTERNAL_SERVER_ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendEventsDetectionJobFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"submitTimeAfter" : @"SubmitTimeAfter",
             @"submitTimeBefore" : @"SubmitTimeBefore",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submitTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendEventsDetectionJobProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"languageCode" : @"LanguageCode",
             @"message" : @"Message",
             @"outputDataConfig" : @"OutputDataConfig",
             @"submitTime" : @"SubmitTime",
             @"targetEventTypes" : @"TargetEventTypes",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)submitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendExtractedCharactersListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"page" : @"Page",
             };
}

@end

@implementation AWSComprehendFlywheelFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusFailed);
        }
        return @(AWSComprehendFlywheelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendFlywheelStatusCreating:
                return @"CREATING";
            case AWSComprehendFlywheelStatusActive:
                return @"ACTIVE";
            case AWSComprehendFlywheelStatusUpdating:
                return @"UPDATING";
            case AWSComprehendFlywheelStatusDeleting:
                return @"DELETING";
            case AWSComprehendFlywheelStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendFlywheelIterationFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimeAfter" : @"CreationTimeAfter",
             @"creationTimeBefore" : @"CreationTimeBefore",
             };
}

+ (NSValueTransformer *)creationTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendFlywheelIterationProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"endTime" : @"EndTime",
             @"evaluatedModelArn" : @"EvaluatedModelArn",
             @"evaluatedModelMetrics" : @"EvaluatedModelMetrics",
             @"evaluationManifestS3Prefix" : @"EvaluationManifestS3Prefix",
             @"flywheelArn" : @"FlywheelArn",
             @"flywheelIterationId" : @"FlywheelIterationId",
             @"message" : @"Message",
             @"status" : @"Status",
             @"trainedModelArn" : @"TrainedModelArn",
             @"trainedModelMetrics" : @"TrainedModelMetrics",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)evaluatedModelMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendFlywheelModelEvaluationMetrics class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRAINING"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelIterationStatusTraining);
        }
        if ([value caseInsensitiveCompare:@"EVALUATING"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelIterationStatusEvaluating);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelIterationStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelIterationStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelIterationStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelIterationStatusStopped);
        }
        return @(AWSComprehendFlywheelIterationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendFlywheelIterationStatusTraining:
                return @"TRAINING";
            case AWSComprehendFlywheelIterationStatusEvaluating:
                return @"EVALUATING";
            case AWSComprehendFlywheelIterationStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendFlywheelIterationStatusFailed:
                return @"FAILED";
            case AWSComprehendFlywheelIterationStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendFlywheelIterationStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trainedModelMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendFlywheelModelEvaluationMetrics class]];
}

@end

@implementation AWSComprehendFlywheelModelEvaluationMetrics

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"averageAccuracy" : @"AverageAccuracy",
             @"averageF1Score" : @"AverageF1Score",
             @"averagePrecision" : @"AveragePrecision",
             @"averageRecall" : @"AverageRecall",
             };
}

@end

@implementation AWSComprehendFlywheelProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeModelArn" : @"ActiveModelArn",
             @"creationTime" : @"CreationTime",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"dataLakeS3Uri" : @"DataLakeS3Uri",
             @"dataSecurityConfig" : @"DataSecurityConfig",
             @"flywheelArn" : @"FlywheelArn",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"latestFlywheelIteration" : @"LatestFlywheelIteration",
             @"message" : @"Message",
             @"modelType" : @"ModelType",
             @"status" : @"Status",
             @"taskConfig" : @"TaskConfig",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dataSecurityConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDataSecurityConfig class]];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DOCUMENT_CLASSIFIER"] == NSOrderedSame) {
            return @(AWSComprehendModelTypeDocumentClassifier);
        }
        if ([value caseInsensitiveCompare:@"ENTITY_RECOGNIZER"] == NSOrderedSame) {
            return @(AWSComprehendModelTypeEntityRecognizer);
        }
        return @(AWSComprehendModelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendModelTypeDocumentClassifier:
                return @"DOCUMENT_CLASSIFIER";
            case AWSComprehendModelTypeEntityRecognizer:
                return @"ENTITY_RECOGNIZER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusFailed);
        }
        return @(AWSComprehendFlywheelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendFlywheelStatusCreating:
                return @"CREATING";
            case AWSComprehendFlywheelStatusActive:
                return @"ACTIVE";
            case AWSComprehendFlywheelStatusUpdating:
                return @"UPDATING";
            case AWSComprehendFlywheelStatusDeleting:
                return @"DELETING";
            case AWSComprehendFlywheelStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taskConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendTaskConfig class]];
}

@end

@implementation AWSComprehendFlywheelSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeModelArn" : @"ActiveModelArn",
             @"creationTime" : @"CreationTime",
             @"dataLakeS3Uri" : @"DataLakeS3Uri",
             @"flywheelArn" : @"FlywheelArn",
             @"lastModifiedTime" : @"LastModifiedTime",
             @"latestFlywheelIteration" : @"LatestFlywheelIteration",
             @"message" : @"Message",
             @"modelType" : @"ModelType",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DOCUMENT_CLASSIFIER"] == NSOrderedSame) {
            return @(AWSComprehendModelTypeDocumentClassifier);
        }
        if ([value caseInsensitiveCompare:@"ENTITY_RECOGNIZER"] == NSOrderedSame) {
            return @(AWSComprehendModelTypeEntityRecognizer);
        }
        return @(AWSComprehendModelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendModelTypeDocumentClassifier:
                return @"DOCUMENT_CLASSIFIER";
            case AWSComprehendModelTypeEntityRecognizer:
                return @"ENTITY_RECOGNIZER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendFlywheelStatusFailed);
        }
        return @(AWSComprehendFlywheelStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendFlywheelStatusCreating:
                return @"CREATING";
            case AWSComprehendFlywheelStatusActive:
                return @"ACTIVE";
            case AWSComprehendFlywheelStatusUpdating:
                return @"UPDATING";
            case AWSComprehendFlywheelStatusDeleting:
                return @"DELETING";
            case AWSComprehendFlywheelStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendGeometry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"polygon" : @"Polygon",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendBoundingBox class]];
}

+ (NSValueTransformer *)polygonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendPoint class]];
}

@end

@implementation AWSComprehendImportModelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"modelKmsKeyId" : @"ModelKmsKeyId",
             @"modelName" : @"ModelName",
             @"sourceModelArn" : @"SourceModelArn",
             @"tags" : @"Tags",
             @"versionName" : @"VersionName",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

@end

@implementation AWSComprehendImportModelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelArn" : @"ModelArn",
             };
}

@end

@implementation AWSComprehendInputDataConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentReaderConfig" : @"DocumentReaderConfig",
             @"inputFormat" : @"InputFormat",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)documentReaderConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentReaderConfig class]];
}

+ (NSValueTransformer *)inputFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONE_DOC_PER_FILE"] == NSOrderedSame) {
            return @(AWSComprehendInputFormatOneDocPerFile);
        }
        if ([value caseInsensitiveCompare:@"ONE_DOC_PER_LINE"] == NSOrderedSame) {
            return @(AWSComprehendInputFormatOneDocPerLine);
        }
        return @(AWSComprehendInputFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendInputFormatOneDocPerFile:
                return @"ONE_DOC_PER_FILE";
            case AWSComprehendInputFormatOneDocPerLine:
                return @"ONE_DOC_PER_LINE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendInvalidRequestDetail

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reason" : @"Reason",
             };
}

+ (NSValueTransformer *)reasonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DOCUMENT_SIZE_EXCEEDED"] == NSOrderedSame) {
            return @(AWSComprehendInvalidRequestDetailReasonDocumentSizeExceeded);
        }
        if ([value caseInsensitiveCompare:@"UNSUPPORTED_DOC_TYPE"] == NSOrderedSame) {
            return @(AWSComprehendInvalidRequestDetailReasonUnsupportedDocType);
        }
        if ([value caseInsensitiveCompare:@"PAGE_LIMIT_EXCEEDED"] == NSOrderedSame) {
            return @(AWSComprehendInvalidRequestDetailReasonPageLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"TEXTRACT_ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSComprehendInvalidRequestDetailReasonTextractAccessDenied);
        }
        return @(AWSComprehendInvalidRequestDetailReasonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendInvalidRequestDetailReasonDocumentSizeExceeded:
                return @"DOCUMENT_SIZE_EXCEEDED";
            case AWSComprehendInvalidRequestDetailReasonUnsupportedDocType:
                return @"UNSUPPORTED_DOC_TYPE";
            case AWSComprehendInvalidRequestDetailReasonPageLimitExceeded:
                return @"PAGE_LIMIT_EXCEEDED";
            case AWSComprehendInvalidRequestDetailReasonTextractAccessDenied:
                return @"TEXTRACT_ACCESS_DENIED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendKeyPhrase

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"beginOffset" : @"BeginOffset",
             @"endOffset" : @"EndOffset",
             @"score" : @"Score",
             @"text" : @"Text",
             };
}

@end

@implementation AWSComprehendKeyPhrasesDetectionJobFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"submitTimeAfter" : @"SubmitTimeAfter",
             @"submitTimeBefore" : @"SubmitTimeBefore",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submitTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendKeyPhrasesDetectionJobProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"languageCode" : @"LanguageCode",
             @"message" : @"Message",
             @"outputDataConfig" : @"OutputDataConfig",
             @"submitTime" : @"SubmitTime",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)submitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendListDatasetsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"flywheelArn" : @"FlywheelArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDatasetFilter class]];
}

@end

@implementation AWSComprehendListDatasetsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"datasetPropertiesList" : @"DatasetPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)datasetPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDatasetProperties class]];
}

@end

@implementation AWSComprehendListDocumentClassificationJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentClassificationJobFilter class]];
}

@end

@implementation AWSComprehendListDocumentClassificationJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassificationJobPropertiesList" : @"DocumentClassificationJobPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)documentClassificationJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDocumentClassificationJobProperties class]];
}

@end

@implementation AWSComprehendListDocumentClassifierSummariesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSComprehendListDocumentClassifierSummariesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierSummariesList" : @"DocumentClassifierSummariesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)documentClassifierSummariesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDocumentClassifierSummary class]];
}

@end

@implementation AWSComprehendListDocumentClassifiersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentClassifierFilter class]];
}

@end

@implementation AWSComprehendListDocumentClassifiersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierPropertiesList" : @"DocumentClassifierPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)documentClassifierPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDocumentClassifierProperties class]];
}

@end

@implementation AWSComprehendListDominantLanguageDetectionJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDominantLanguageDetectionJobFilter class]];
}

@end

@implementation AWSComprehendListDominantLanguageDetectionJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dominantLanguageDetectionJobPropertiesList" : @"DominantLanguageDetectionJobPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)dominantLanguageDetectionJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDominantLanguageDetectionJobProperties class]];
}

@end

@implementation AWSComprehendListEndpointsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEndpointFilter class]];
}

@end

@implementation AWSComprehendListEndpointsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointPropertiesList" : @"EndpointPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)endpointPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendEndpointProperties class]];
}

@end

@implementation AWSComprehendListEntitiesDetectionJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntitiesDetectionJobFilter class]];
}

@end

@implementation AWSComprehendListEntitiesDetectionJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entitiesDetectionJobPropertiesList" : @"EntitiesDetectionJobPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entitiesDetectionJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendEntitiesDetectionJobProperties class]];
}

@end

@implementation AWSComprehendListEntityRecognizerSummariesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSComprehendListEntityRecognizerSummariesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityRecognizerSummariesList" : @"EntityRecognizerSummariesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entityRecognizerSummariesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendEntityRecognizerSummary class]];
}

@end

@implementation AWSComprehendListEntityRecognizersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityRecognizerFilter class]];
}

@end

@implementation AWSComprehendListEntityRecognizersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityRecognizerPropertiesList" : @"EntityRecognizerPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)entityRecognizerPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendEntityRecognizerProperties class]];
}

@end

@implementation AWSComprehendListEventsDetectionJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEventsDetectionJobFilter class]];
}

@end

@implementation AWSComprehendListEventsDetectionJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventsDetectionJobPropertiesList" : @"EventsDetectionJobPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)eventsDetectionJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendEventsDetectionJobProperties class]];
}

@end

@implementation AWSComprehendListFlywheelIterationHistoryRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"flywheelArn" : @"FlywheelArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendFlywheelIterationFilter class]];
}

@end

@implementation AWSComprehendListFlywheelIterationHistoryResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flywheelIterationPropertiesList" : @"FlywheelIterationPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)flywheelIterationPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendFlywheelIterationProperties class]];
}

@end

@implementation AWSComprehendListFlywheelsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendFlywheelFilter class]];
}

@end

@implementation AWSComprehendListFlywheelsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flywheelSummaryList" : @"FlywheelSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)flywheelSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendFlywheelSummary class]];
}

@end

@implementation AWSComprehendListKeyPhrasesDetectionJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendKeyPhrasesDetectionJobFilter class]];
}

@end

@implementation AWSComprehendListKeyPhrasesDetectionJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPhrasesDetectionJobPropertiesList" : @"KeyPhrasesDetectionJobPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)keyPhrasesDetectionJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendKeyPhrasesDetectionJobProperties class]];
}

@end

@implementation AWSComprehendListPiiEntitiesDetectionJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendPiiEntitiesDetectionJobFilter class]];
}

@end

@implementation AWSComprehendListPiiEntitiesDetectionJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"piiEntitiesDetectionJobPropertiesList" : @"PiiEntitiesDetectionJobPropertiesList",
             };
}

+ (NSValueTransformer *)piiEntitiesDetectionJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendPiiEntitiesDetectionJobProperties class]];
}

@end

@implementation AWSComprehendListSentimentDetectionJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendSentimentDetectionJobFilter class]];
}

@end

@implementation AWSComprehendListSentimentDetectionJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"sentimentDetectionJobPropertiesList" : @"SentimentDetectionJobPropertiesList",
             };
}

+ (NSValueTransformer *)sentimentDetectionJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendSentimentDetectionJobProperties class]];
}

@end

@implementation AWSComprehendListTagsForResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSComprehendListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

@end

@implementation AWSComprehendListTargetedSentimentDetectionJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendTargetedSentimentDetectionJobFilter class]];
}

@end

@implementation AWSComprehendListTargetedSentimentDetectionJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"targetedSentimentDetectionJobPropertiesList" : @"TargetedSentimentDetectionJobPropertiesList",
             };
}

+ (NSValueTransformer *)targetedSentimentDetectionJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTargetedSentimentDetectionJobProperties class]];
}

@end

@implementation AWSComprehendListTopicsDetectionJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendTopicsDetectionJobFilter class]];
}

@end

@implementation AWSComprehendListTopicsDetectionJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"topicsDetectionJobPropertiesList" : @"TopicsDetectionJobPropertiesList",
             };
}

+ (NSValueTransformer *)topicsDetectionJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTopicsDetectionJobProperties class]];
}

@end

@implementation AWSComprehendMentionSentiment

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sentiment" : @"Sentiment",
             @"sentimentScore" : @"SentimentScore",
             };
}

+ (NSValueTransformer *)sentimentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"POSITIVE"] == NSOrderedSame) {
            return @(AWSComprehendSentimentTypePositive);
        }
        if ([value caseInsensitiveCompare:@"NEGATIVE"] == NSOrderedSame) {
            return @(AWSComprehendSentimentTypeNegative);
        }
        if ([value caseInsensitiveCompare:@"NEUTRAL"] == NSOrderedSame) {
            return @(AWSComprehendSentimentTypeNeutral);
        }
        if ([value caseInsensitiveCompare:@"MIXED"] == NSOrderedSame) {
            return @(AWSComprehendSentimentTypeMixed);
        }
        return @(AWSComprehendSentimentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendSentimentTypePositive:
                return @"POSITIVE";
            case AWSComprehendSentimentTypeNegative:
                return @"NEGATIVE";
            case AWSComprehendSentimentTypeNeutral:
                return @"NEUTRAL";
            case AWSComprehendSentimentTypeMixed:
                return @"MIXED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sentimentScoreJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendSentimentScore class]];
}

@end

@implementation AWSComprehendOutputDataConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSComprehendPartOfSpeechTag

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"score" : @"Score",
             @"tag" : @"Tag",
             };
}

+ (NSValueTransformer *)tagJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADJ"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeAdj);
        }
        if ([value caseInsensitiveCompare:@"ADP"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeAdp);
        }
        if ([value caseInsensitiveCompare:@"ADV"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeAdv);
        }
        if ([value caseInsensitiveCompare:@"AUX"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeAux);
        }
        if ([value caseInsensitiveCompare:@"CONJ"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeConj);
        }
        if ([value caseInsensitiveCompare:@"CCONJ"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeCconj);
        }
        if ([value caseInsensitiveCompare:@"DET"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeDet);
        }
        if ([value caseInsensitiveCompare:@"INTJ"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeIntj);
        }
        if ([value caseInsensitiveCompare:@"NOUN"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeNoun);
        }
        if ([value caseInsensitiveCompare:@"NUM"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeNum);
        }
        if ([value caseInsensitiveCompare:@"O"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeO);
        }
        if ([value caseInsensitiveCompare:@"PART"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypePart);
        }
        if ([value caseInsensitiveCompare:@"PRON"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypePron);
        }
        if ([value caseInsensitiveCompare:@"PROPN"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypePropn);
        }
        if ([value caseInsensitiveCompare:@"PUNCT"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypePunct);
        }
        if ([value caseInsensitiveCompare:@"SCONJ"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeSconj);
        }
        if ([value caseInsensitiveCompare:@"SYM"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeSym);
        }
        if ([value caseInsensitiveCompare:@"VERB"] == NSOrderedSame) {
            return @(AWSComprehendPartOfSpeechTagTypeVerb);
        }
        return @(AWSComprehendPartOfSpeechTagTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendPartOfSpeechTagTypeAdj:
                return @"ADJ";
            case AWSComprehendPartOfSpeechTagTypeAdp:
                return @"ADP";
            case AWSComprehendPartOfSpeechTagTypeAdv:
                return @"ADV";
            case AWSComprehendPartOfSpeechTagTypeAux:
                return @"AUX";
            case AWSComprehendPartOfSpeechTagTypeConj:
                return @"CONJ";
            case AWSComprehendPartOfSpeechTagTypeCconj:
                return @"CCONJ";
            case AWSComprehendPartOfSpeechTagTypeDet:
                return @"DET";
            case AWSComprehendPartOfSpeechTagTypeIntj:
                return @"INTJ";
            case AWSComprehendPartOfSpeechTagTypeNoun:
                return @"NOUN";
            case AWSComprehendPartOfSpeechTagTypeNum:
                return @"NUM";
            case AWSComprehendPartOfSpeechTagTypeO:
                return @"O";
            case AWSComprehendPartOfSpeechTagTypePart:
                return @"PART";
            case AWSComprehendPartOfSpeechTagTypePron:
                return @"PRON";
            case AWSComprehendPartOfSpeechTagTypePropn:
                return @"PROPN";
            case AWSComprehendPartOfSpeechTagTypePunct:
                return @"PUNCT";
            case AWSComprehendPartOfSpeechTagTypeSconj:
                return @"SCONJ";
            case AWSComprehendPartOfSpeechTagTypeSym:
                return @"SYM";
            case AWSComprehendPartOfSpeechTagTypeVerb:
                return @"VERB";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendPiiEntitiesDetectionJobFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"submitTimeAfter" : @"SubmitTimeAfter",
             @"submitTimeBefore" : @"SubmitTimeBefore",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submitTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendPiiEntitiesDetectionJobProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"languageCode" : @"LanguageCode",
             @"message" : @"Message",
             @"mode" : @"Mode",
             @"outputDataConfig" : @"OutputDataConfig",
             @"redactionConfig" : @"RedactionConfig",
             @"submitTime" : @"SubmitTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLY_REDACTION"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntitiesDetectionModeOnlyRedaction);
        }
        if ([value caseInsensitiveCompare:@"ONLY_OFFSETS"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntitiesDetectionModeOnlyOffsets);
        }
        return @(AWSComprehendPiiEntitiesDetectionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendPiiEntitiesDetectionModeOnlyRedaction:
                return @"ONLY_REDACTION";
            case AWSComprehendPiiEntitiesDetectionModeOnlyOffsets:
                return @"ONLY_OFFSETS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendPiiOutputDataConfig class]];
}

+ (NSValueTransformer *)redactionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendRedactionConfig class]];
}

+ (NSValueTransformer *)submitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendPiiEntity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"beginOffset" : @"BeginOffset",
             @"endOffset" : @"EndOffset",
             @"score" : @"Score",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BANK_ACCOUNT_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeBankAccountNumber);
        }
        if ([value caseInsensitiveCompare:@"BANK_ROUTING"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeBankRouting);
        }
        if ([value caseInsensitiveCompare:@"CREDIT_DEBIT_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeCreditDebitNumber);
        }
        if ([value caseInsensitiveCompare:@"CREDIT_DEBIT_CVV"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeCreditDebitCvv);
        }
        if ([value caseInsensitiveCompare:@"CREDIT_DEBIT_EXPIRY"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeCreditDebitExpiry);
        }
        if ([value caseInsensitiveCompare:@"PIN"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypePin);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"ADDRESS"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeAddress);
        }
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeName);
        }
        if ([value caseInsensitiveCompare:@"PHONE"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypePhone);
        }
        if ([value caseInsensitiveCompare:@"SSN"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeSsn);
        }
        if ([value caseInsensitiveCompare:@"DATE_TIME"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeDateTime);
        }
        if ([value caseInsensitiveCompare:@"PASSPORT_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypePassportNumber);
        }
        if ([value caseInsensitiveCompare:@"DRIVER_ID"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeDriverId);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeUrl);
        }
        if ([value caseInsensitiveCompare:@"AGE"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeAge);
        }
        if ([value caseInsensitiveCompare:@"USERNAME"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeUsername);
        }
        if ([value caseInsensitiveCompare:@"PASSWORD"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypePassword);
        }
        if ([value caseInsensitiveCompare:@"AWS_ACCESS_KEY"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeAwsAccessKey);
        }
        if ([value caseInsensitiveCompare:@"AWS_SECRET_KEY"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeAwsSecretKey);
        }
        if ([value caseInsensitiveCompare:@"IP_ADDRESS"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeIpAddress);
        }
        if ([value caseInsensitiveCompare:@"MAC_ADDRESS"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeMacAddress);
        }
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeAll);
        }
        if ([value caseInsensitiveCompare:@"LICENSE_PLATE"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeLicensePlate);
        }
        if ([value caseInsensitiveCompare:@"VEHICLE_IDENTIFICATION_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeVehicleIdentificationNumber);
        }
        if ([value caseInsensitiveCompare:@"UK_NATIONAL_INSURANCE_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeUkNationalInsuranceNumber);
        }
        if ([value caseInsensitiveCompare:@"CA_SOCIAL_INSURANCE_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeCaSocialInsuranceNumber);
        }
        if ([value caseInsensitiveCompare:@"US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeUsIndividualTaxIdentificationNumber);
        }
        if ([value caseInsensitiveCompare:@"UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeUkUniqueTaxpayerReferenceNumber);
        }
        if ([value caseInsensitiveCompare:@"IN_PERMANENT_ACCOUNT_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeInPermanentAccountNumber);
        }
        if ([value caseInsensitiveCompare:@"IN_NREGA"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeInNrega);
        }
        if ([value caseInsensitiveCompare:@"INTERNATIONAL_BANK_ACCOUNT_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeInternationalBankAccountNumber);
        }
        if ([value caseInsensitiveCompare:@"SWIFT_CODE"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeSwiftCode);
        }
        if ([value caseInsensitiveCompare:@"UK_NATIONAL_HEALTH_SERVICE_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeUkNationalHealthServiceNumber);
        }
        if ([value caseInsensitiveCompare:@"CA_HEALTH_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeCaHealthNumber);
        }
        if ([value caseInsensitiveCompare:@"IN_AADHAAR"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeInAadhaar);
        }
        if ([value caseInsensitiveCompare:@"IN_VOTER_NUMBER"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntityTypeInVoterNumber);
        }
        return @(AWSComprehendPiiEntityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendPiiEntityTypeBankAccountNumber:
                return @"BANK_ACCOUNT_NUMBER";
            case AWSComprehendPiiEntityTypeBankRouting:
                return @"BANK_ROUTING";
            case AWSComprehendPiiEntityTypeCreditDebitNumber:
                return @"CREDIT_DEBIT_NUMBER";
            case AWSComprehendPiiEntityTypeCreditDebitCvv:
                return @"CREDIT_DEBIT_CVV";
            case AWSComprehendPiiEntityTypeCreditDebitExpiry:
                return @"CREDIT_DEBIT_EXPIRY";
            case AWSComprehendPiiEntityTypePin:
                return @"PIN";
            case AWSComprehendPiiEntityTypeEmail:
                return @"EMAIL";
            case AWSComprehendPiiEntityTypeAddress:
                return @"ADDRESS";
            case AWSComprehendPiiEntityTypeName:
                return @"NAME";
            case AWSComprehendPiiEntityTypePhone:
                return @"PHONE";
            case AWSComprehendPiiEntityTypeSsn:
                return @"SSN";
            case AWSComprehendPiiEntityTypeDateTime:
                return @"DATE_TIME";
            case AWSComprehendPiiEntityTypePassportNumber:
                return @"PASSPORT_NUMBER";
            case AWSComprehendPiiEntityTypeDriverId:
                return @"DRIVER_ID";
            case AWSComprehendPiiEntityTypeUrl:
                return @"URL";
            case AWSComprehendPiiEntityTypeAge:
                return @"AGE";
            case AWSComprehendPiiEntityTypeUsername:
                return @"USERNAME";
            case AWSComprehendPiiEntityTypePassword:
                return @"PASSWORD";
            case AWSComprehendPiiEntityTypeAwsAccessKey:
                return @"AWS_ACCESS_KEY";
            case AWSComprehendPiiEntityTypeAwsSecretKey:
                return @"AWS_SECRET_KEY";
            case AWSComprehendPiiEntityTypeIpAddress:
                return @"IP_ADDRESS";
            case AWSComprehendPiiEntityTypeMacAddress:
                return @"MAC_ADDRESS";
            case AWSComprehendPiiEntityTypeAll:
                return @"ALL";
            case AWSComprehendPiiEntityTypeLicensePlate:
                return @"LICENSE_PLATE";
            case AWSComprehendPiiEntityTypeVehicleIdentificationNumber:
                return @"VEHICLE_IDENTIFICATION_NUMBER";
            case AWSComprehendPiiEntityTypeUkNationalInsuranceNumber:
                return @"UK_NATIONAL_INSURANCE_NUMBER";
            case AWSComprehendPiiEntityTypeCaSocialInsuranceNumber:
                return @"CA_SOCIAL_INSURANCE_NUMBER";
            case AWSComprehendPiiEntityTypeUsIndividualTaxIdentificationNumber:
                return @"US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER";
            case AWSComprehendPiiEntityTypeUkUniqueTaxpayerReferenceNumber:
                return @"UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER";
            case AWSComprehendPiiEntityTypeInPermanentAccountNumber:
                return @"IN_PERMANENT_ACCOUNT_NUMBER";
            case AWSComprehendPiiEntityTypeInNrega:
                return @"IN_NREGA";
            case AWSComprehendPiiEntityTypeInternationalBankAccountNumber:
                return @"INTERNATIONAL_BANK_ACCOUNT_NUMBER";
            case AWSComprehendPiiEntityTypeSwiftCode:
                return @"SWIFT_CODE";
            case AWSComprehendPiiEntityTypeUkNationalHealthServiceNumber:
                return @"UK_NATIONAL_HEALTH_SERVICE_NUMBER";
            case AWSComprehendPiiEntityTypeCaHealthNumber:
                return @"CA_HEALTH_NUMBER";
            case AWSComprehendPiiEntityTypeInAadhaar:
                return @"IN_AADHAAR";
            case AWSComprehendPiiEntityTypeInVoterNumber:
                return @"IN_VOTER_NUMBER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendPiiOutputDataConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSComprehendPoint

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"X" : @"X",
             @"Y" : @"Y",
             };
}

@end

@implementation AWSComprehendPutResourcePolicyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyRevisionId" : @"PolicyRevisionId",
             @"resourceArn" : @"ResourceArn",
             @"resourcePolicy" : @"ResourcePolicy",
             };
}

@end

@implementation AWSComprehendPutResourcePolicyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyRevisionId" : @"PolicyRevisionId",
             };
}

@end

@implementation AWSComprehendRedactionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maskCharacter" : @"MaskCharacter",
             @"maskMode" : @"MaskMode",
             @"piiEntityTypes" : @"PiiEntityTypes",
             };
}

+ (NSValueTransformer *)maskModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MASK"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntitiesDetectionMaskModeMask);
        }
        if ([value caseInsensitiveCompare:@"REPLACE_WITH_PII_ENTITY_TYPE"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntitiesDetectionMaskModeReplaceWithPiiEntityType);
        }
        return @(AWSComprehendPiiEntitiesDetectionMaskModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendPiiEntitiesDetectionMaskModeMask:
                return @"MASK";
            case AWSComprehendPiiEntitiesDetectionMaskModeReplaceWithPiiEntityType:
                return @"REPLACE_WITH_PII_ENTITY_TYPE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendRelationshipsListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ids" : @"Ids",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CHILD"] == NSOrderedSame) {
            return @(AWSComprehendRelationshipTypeChild);
        }
        return @(AWSComprehendRelationshipTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendRelationshipTypeChild:
                return @"CHILD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendSentimentDetectionJobFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"submitTimeAfter" : @"SubmitTimeAfter",
             @"submitTimeBefore" : @"SubmitTimeBefore",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submitTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendSentimentDetectionJobProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"languageCode" : @"LanguageCode",
             @"message" : @"Message",
             @"outputDataConfig" : @"OutputDataConfig",
             @"submitTime" : @"SubmitTime",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)submitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendSentimentScore

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mixed" : @"Mixed",
             @"negative" : @"Negative",
             @"neutral" : @"Neutral",
             @"positive" : @"Positive",
             };
}

@end

@implementation AWSComprehendStartDocumentClassificationJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"documentClassifierArn" : @"DocumentClassifierArn",
             @"flywheelArn" : @"FlywheelArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"outputDataConfig" : @"OutputDataConfig",
             @"tags" : @"Tags",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendStartDocumentClassificationJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierArn" : @"DocumentClassifierArn",
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStartDominantLanguageDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"outputDataConfig" : @"OutputDataConfig",
             @"tags" : @"Tags",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendStartDominantLanguageDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStartEntitiesDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             @"flywheelArn" : @"FlywheelArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"languageCode" : @"LanguageCode",
             @"outputDataConfig" : @"OutputDataConfig",
             @"tags" : @"Tags",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendStartEntitiesDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStartEventsDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"languageCode" : @"LanguageCode",
             @"outputDataConfig" : @"OutputDataConfig",
             @"tags" : @"Tags",
             @"targetEventTypes" : @"TargetEventTypes",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

@end

@implementation AWSComprehendStartEventsDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStartFlywheelIterationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"flywheelArn" : @"FlywheelArn",
             };
}

@end

@implementation AWSComprehendStartFlywheelIterationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flywheelArn" : @"FlywheelArn",
             @"flywheelIterationId" : @"FlywheelIterationId",
             };
}

@end

@implementation AWSComprehendStartKeyPhrasesDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"languageCode" : @"LanguageCode",
             @"outputDataConfig" : @"OutputDataConfig",
             @"tags" : @"Tags",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendStartKeyPhrasesDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStartPiiEntitiesDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"languageCode" : @"LanguageCode",
             @"mode" : @"Mode",
             @"outputDataConfig" : @"OutputDataConfig",
             @"redactionConfig" : @"RedactionConfig",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONLY_REDACTION"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntitiesDetectionModeOnlyRedaction);
        }
        if ([value caseInsensitiveCompare:@"ONLY_OFFSETS"] == NSOrderedSame) {
            return @(AWSComprehendPiiEntitiesDetectionModeOnlyOffsets);
        }
        return @(AWSComprehendPiiEntitiesDetectionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendPiiEntitiesDetectionModeOnlyRedaction:
                return @"ONLY_REDACTION";
            case AWSComprehendPiiEntitiesDetectionModeOnlyOffsets:
                return @"ONLY_OFFSETS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)redactionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendRedactionConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

@end

@implementation AWSComprehendStartPiiEntitiesDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStartSentimentDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"languageCode" : @"LanguageCode",
             @"outputDataConfig" : @"OutputDataConfig",
             @"tags" : @"Tags",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendStartSentimentDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStartTargetedSentimentDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"languageCode" : @"LanguageCode",
             @"outputDataConfig" : @"OutputDataConfig",
             @"tags" : @"Tags",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendStartTargetedSentimentDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStartTopicsDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"numberOfTopics" : @"NumberOfTopics",
             @"outputDataConfig" : @"OutputDataConfig",
             @"tags" : @"Tags",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendStartTopicsDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStopDominantLanguageDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendStopDominantLanguageDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStopEntitiesDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendStopEntitiesDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStopEventsDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendStopEventsDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStopKeyPhrasesDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendStopKeyPhrasesDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStopPiiEntitiesDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendStopPiiEntitiesDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStopSentimentDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendStopSentimentDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStopTargetedSentimentDetectionJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendStopTargetedSentimentDetectionJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendStopTrainingDocumentClassifierRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierArn" : @"DocumentClassifierArn",
             };
}

@end

@implementation AWSComprehendStopTrainingDocumentClassifierResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSComprehendStopTrainingEntityRecognizerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             };
}

@end

@implementation AWSComprehendStopTrainingEntityRecognizerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSComprehendSyntaxToken

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"beginOffset" : @"BeginOffset",
             @"endOffset" : @"EndOffset",
             @"partOfSpeech" : @"PartOfSpeech",
             @"text" : @"Text",
             @"tokenId" : @"TokenId",
             };
}

+ (NSValueTransformer *)partOfSpeechJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendPartOfSpeechTag class]];
}

@end

@implementation AWSComprehendTag

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSComprehendTagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTag class]];
}

@end

@implementation AWSComprehendTagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSComprehendTargetedSentimentDetectionJobFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"submitTimeAfter" : @"SubmitTimeAfter",
             @"submitTimeBefore" : @"SubmitTimeBefore",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submitTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendTargetedSentimentDetectionJobProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"languageCode" : @"LanguageCode",
             @"message" : @"Message",
             @"outputDataConfig" : @"OutputDataConfig",
             @"submitTime" : @"SubmitTime",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)submitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendTargetedSentimentEntity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"descriptiveMentionIndex" : @"DescriptiveMentionIndex",
             @"mentions" : @"Mentions",
             };
}

+ (NSValueTransformer *)mentionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendTargetedSentimentMention class]];
}

@end

@implementation AWSComprehendTargetedSentimentMention

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"beginOffset" : @"BeginOffset",
             @"endOffset" : @"EndOffset",
             @"groupScore" : @"GroupScore",
             @"mentionSentiment" : @"MentionSentiment",
             @"score" : @"Score",
             @"text" : @"Text",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)mentionSentimentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendMentionSentiment class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PERSON"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypePerson);
        }
        if ([value caseInsensitiveCompare:@"LOCATION"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeLocation);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATION"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeOrganization);
        }
        if ([value caseInsensitiveCompare:@"FACILITY"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeFacility);
        }
        if ([value caseInsensitiveCompare:@"BRAND"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeBrand);
        }
        if ([value caseInsensitiveCompare:@"COMMERCIAL_ITEM"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeCommercialItem);
        }
        if ([value caseInsensitiveCompare:@"MOVIE"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeMovie);
        }
        if ([value caseInsensitiveCompare:@"MUSIC"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeMusic);
        }
        if ([value caseInsensitiveCompare:@"BOOK"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeBook);
        }
        if ([value caseInsensitiveCompare:@"SOFTWARE"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeSoftware);
        }
        if ([value caseInsensitiveCompare:@"GAME"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeGame);
        }
        if ([value caseInsensitiveCompare:@"PERSONAL_TITLE"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypePersonalTitle);
        }
        if ([value caseInsensitiveCompare:@"EVENT"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeEvent);
        }
        if ([value caseInsensitiveCompare:@"DATE"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeDate);
        }
        if ([value caseInsensitiveCompare:@"QUANTITY"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeQuantity);
        }
        if ([value caseInsensitiveCompare:@"ATTRIBUTE"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeAttribute);
        }
        if ([value caseInsensitiveCompare:@"OTHER"] == NSOrderedSame) {
            return @(AWSComprehendTargetedSentimentEntityTypeOther);
        }
        return @(AWSComprehendTargetedSentimentEntityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendTargetedSentimentEntityTypePerson:
                return @"PERSON";
            case AWSComprehendTargetedSentimentEntityTypeLocation:
                return @"LOCATION";
            case AWSComprehendTargetedSentimentEntityTypeOrganization:
                return @"ORGANIZATION";
            case AWSComprehendTargetedSentimentEntityTypeFacility:
                return @"FACILITY";
            case AWSComprehendTargetedSentimentEntityTypeBrand:
                return @"BRAND";
            case AWSComprehendTargetedSentimentEntityTypeCommercialItem:
                return @"COMMERCIAL_ITEM";
            case AWSComprehendTargetedSentimentEntityTypeMovie:
                return @"MOVIE";
            case AWSComprehendTargetedSentimentEntityTypeMusic:
                return @"MUSIC";
            case AWSComprehendTargetedSentimentEntityTypeBook:
                return @"BOOK";
            case AWSComprehendTargetedSentimentEntityTypeSoftware:
                return @"SOFTWARE";
            case AWSComprehendTargetedSentimentEntityTypeGame:
                return @"GAME";
            case AWSComprehendTargetedSentimentEntityTypePersonalTitle:
                return @"PERSONAL_TITLE";
            case AWSComprehendTargetedSentimentEntityTypeEvent:
                return @"EVENT";
            case AWSComprehendTargetedSentimentEntityTypeDate:
                return @"DATE";
            case AWSComprehendTargetedSentimentEntityTypeQuantity:
                return @"QUANTITY";
            case AWSComprehendTargetedSentimentEntityTypeAttribute:
                return @"ATTRIBUTE";
            case AWSComprehendTargetedSentimentEntityTypeOther:
                return @"OTHER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendTaskConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassificationConfig" : @"DocumentClassificationConfig",
             @"entityRecognitionConfig" : @"EntityRecognitionConfig",
             @"languageCode" : @"LanguageCode",
             };
}

+ (NSValueTransformer *)documentClassificationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendDocumentClassificationConfig class]];
}

+ (NSValueTransformer *)entityRecognitionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityRecognitionConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEn);
        }
        if ([value caseInsensitiveCompare:@"es"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeEs);
        }
        if ([value caseInsensitiveCompare:@"fr"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeFr);
        }
        if ([value caseInsensitiveCompare:@"de"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeDe);
        }
        if ([value caseInsensitiveCompare:@"it"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeIt);
        }
        if ([value caseInsensitiveCompare:@"pt"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodePt);
        }
        if ([value caseInsensitiveCompare:@"ar"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeAr);
        }
        if ([value caseInsensitiveCompare:@"hi"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeHi);
        }
        if ([value caseInsensitiveCompare:@"ja"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeJa);
        }
        if ([value caseInsensitiveCompare:@"ko"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeKo);
        }
        if ([value caseInsensitiveCompare:@"zh"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZh);
        }
        if ([value caseInsensitiveCompare:@"zh-TW"] == NSOrderedSame) {
            return @(AWSComprehendLanguageCodeZhTW);
        }
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
            case AWSComprehendLanguageCodeFr:
                return @"fr";
            case AWSComprehendLanguageCodeDe:
                return @"de";
            case AWSComprehendLanguageCodeIt:
                return @"it";
            case AWSComprehendLanguageCodePt:
                return @"pt";
            case AWSComprehendLanguageCodeAr:
                return @"ar";
            case AWSComprehendLanguageCodeHi:
                return @"hi";
            case AWSComprehendLanguageCodeJa:
                return @"ja";
            case AWSComprehendLanguageCodeKo:
                return @"ko";
            case AWSComprehendLanguageCodeZh:
                return @"zh";
            case AWSComprehendLanguageCodeZhTW:
                return @"zh-TW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendTextSegment

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             };
}

@end

@implementation AWSComprehendTopicsDetectionJobFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"submitTimeAfter" : @"SubmitTimeAfter",
             @"submitTimeBefore" : @"SubmitTimeBefore",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submitTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSComprehendTopicsDetectionJobProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"message" : @"Message",
             @"numberOfTopics" : @"NumberOfTopics",
             @"outputDataConfig" : @"OutputDataConfig",
             @"submitTime" : @"SubmitTime",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSComprehendJobStatusStopped);
        }
        return @(AWSComprehendJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSComprehendJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSComprehendJobStatusCompleted:
                return @"COMPLETED";
            case AWSComprehendJobStatusFailed:
                return @"FAILED";
            case AWSComprehendJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSComprehendJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
}

+ (NSValueTransformer *)submitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendToxicContent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"score" : @"Score",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"GRAPHIC"] == NSOrderedSame) {
            return @(AWSComprehendToxicContentTypeGraphic);
        }
        if ([value caseInsensitiveCompare:@"HARASSMENT_OR_ABUSE"] == NSOrderedSame) {
            return @(AWSComprehendToxicContentTypeHarassmentOrAbuse);
        }
        if ([value caseInsensitiveCompare:@"HATE_SPEECH"] == NSOrderedSame) {
            return @(AWSComprehendToxicContentTypeHateSpeech);
        }
        if ([value caseInsensitiveCompare:@"INSULT"] == NSOrderedSame) {
            return @(AWSComprehendToxicContentTypeInsult);
        }
        if ([value caseInsensitiveCompare:@"PROFANITY"] == NSOrderedSame) {
            return @(AWSComprehendToxicContentTypeProfanity);
        }
        if ([value caseInsensitiveCompare:@"SEXUAL"] == NSOrderedSame) {
            return @(AWSComprehendToxicContentTypeSexual);
        }
        if ([value caseInsensitiveCompare:@"VIOLENCE_OR_THREAT"] == NSOrderedSame) {
            return @(AWSComprehendToxicContentTypeViolenceOrThreat);
        }
        return @(AWSComprehendToxicContentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendToxicContentTypeGraphic:
                return @"GRAPHIC";
            case AWSComprehendToxicContentTypeHarassmentOrAbuse:
                return @"HARASSMENT_OR_ABUSE";
            case AWSComprehendToxicContentTypeHateSpeech:
                return @"HATE_SPEECH";
            case AWSComprehendToxicContentTypeInsult:
                return @"INSULT";
            case AWSComprehendToxicContentTypeProfanity:
                return @"PROFANITY";
            case AWSComprehendToxicContentTypeSexual:
                return @"SEXUAL";
            case AWSComprehendToxicContentTypeViolenceOrThreat:
                return @"VIOLENCE_OR_THREAT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSComprehendToxicLabels

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labels" : @"Labels",
             @"toxicity" : @"Toxicity",
             };
}

+ (NSValueTransformer *)labelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendToxicContent class]];
}

@end

@implementation AWSComprehendUntagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSComprehendUntagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSComprehendUpdateDataSecurityConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"modelKmsKeyId" : @"ModelKmsKeyId",
             @"volumeKmsKeyId" : @"VolumeKmsKeyId",
             @"vpcConfig" : @"VpcConfig",
             };
}

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendUpdateEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"desiredDataAccessRoleArn" : @"DesiredDataAccessRoleArn",
             @"desiredInferenceUnits" : @"DesiredInferenceUnits",
             @"desiredModelArn" : @"DesiredModelArn",
             @"endpointArn" : @"EndpointArn",
             @"flywheelArn" : @"FlywheelArn",
             };
}

@end

@implementation AWSComprehendUpdateEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"desiredModelArn" : @"DesiredModelArn",
             };
}

@end

@implementation AWSComprehendUpdateFlywheelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeModelArn" : @"ActiveModelArn",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"dataSecurityConfig" : @"DataSecurityConfig",
             @"flywheelArn" : @"FlywheelArn",
             };
}

+ (NSValueTransformer *)dataSecurityConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendUpdateDataSecurityConfig class]];
}

@end

@implementation AWSComprehendUpdateFlywheelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flywheelProperties" : @"FlywheelProperties",
             };
}

+ (NSValueTransformer *)flywheelPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendFlywheelProperties class]];
}

@end

@implementation AWSComprehendVpcConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnets" : @"Subnets",
             };
}

@end

@implementation AWSComprehendWarningsListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"page" : @"Page",
             @"warnCode" : @"WarnCode",
             @"warnMessage" : @"WarnMessage",
             };
}

+ (NSValueTransformer *)warnCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INFERENCING_PLAINTEXT_WITH_NATIVE_TRAINED_MODEL"] == NSOrderedSame) {
            return @(AWSComprehendPageBasedWarningCodeInferencingPlaintextWithNativeTrainedModel);
        }
        if ([value caseInsensitiveCompare:@"INFERENCING_NATIVE_DOCUMENT_WITH_PLAINTEXT_TRAINED_MODEL"] == NSOrderedSame) {
            return @(AWSComprehendPageBasedWarningCodeInferencingNativeDocumentWithPlaintextTrainedModel);
        }
        return @(AWSComprehendPageBasedWarningCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendPageBasedWarningCodeInferencingPlaintextWithNativeTrainedModel:
                return @"INFERENCING_PLAINTEXT_WITH_NATIVE_TRAINED_MODEL";
            case AWSComprehendPageBasedWarningCodeInferencingNativeDocumentWithPlaintextTrainedModel:
                return @"INFERENCING_NATIVE_DOCUMENT_WITH_PLAINTEXT_TRAINED_MODEL";
            default:
                return nil;
        }
    }];
}

@end
