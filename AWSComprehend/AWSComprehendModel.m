//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
             @"endpointArn" : @"EndpointArn",
             @"text" : @"Text",
             };
}

@end

@implementation AWSComprehendClassifyDocumentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classes" : @"Classes",
             @"labels" : @"Labels",
             };
}

+ (NSValueTransformer *)classesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDocumentClass class]];
}

+ (NSValueTransformer *)labelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendDocumentLabel class]];
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
             @"endpointArn" : @"EndpointArn",
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

@implementation AWSComprehendDetectEntitiesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendEntity class]];
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

@implementation AWSComprehendDocumentClass

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"score" : @"Score",
             };
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

@end

@implementation AWSComprehendDocumentClassifierOutputDataConfig

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
             @"inputDataConfig" : @"InputDataConfig",
             @"languageCode" : @"LanguageCode",
             @"message" : @"Message",
             @"mode" : @"Mode",
             @"modelKmsKeyId" : @"ModelKmsKeyId",
             @"outputDataConfig" : @"OutputDataConfig",
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
             @"score" : @"Score",
             };
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
             @"endOffset" : @"EndOffset",
             @"score" : @"Score",
             @"text" : @"Text",
             @"types" : @"Type",
             };
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
            default:
                return nil;
        }
    }];
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

@implementation AWSComprehendEntityRecognizerProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"languageCode" : @"LanguageCode",
             @"message" : @"Message",
             @"modelKmsKeyId" : @"ModelKmsKeyId",
             @"recognizerMetadata" : @"RecognizerMetadata",
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
             };
}

@end

@implementation AWSComprehendUpdateEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
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
