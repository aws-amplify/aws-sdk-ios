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

#import "AWSComprehendModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSComprehendErrorDomain = @"com.amazonaws.AWSComprehendErrorDomain";

@implementation AWSComprehendBatchDetectDominantLanguageItemResult

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"textList" : @"TextList",
             };
}

@end

@implementation AWSComprehendBatchDetectDominantLanguageResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"index" : @"Index",
             };
}

@end

@implementation AWSComprehendClassifierEvaluationMetrics

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             @"text" : @"Text",
             };
}

@end

@implementation AWSComprehendClassifyDocumentResponse

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

@implementation AWSComprehendCreateDocumentClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"documentClassifierName" : @"DocumentClassifierName",
             @"inputDataConfig" : @"InputDataConfig",
             @"languageCode" : @"LanguageCode",
             @"mode" : @"Mode",
             @"outputDataConfig" : @"OutputDataConfig",
             @"tags" : @"Tags",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierArn" : @"DocumentClassifierArn",
             };
}

@end

@implementation AWSComprehendCreateEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSComprehendCreateEntityRecognizerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"languageCode" : @"LanguageCode",
             @"recognizerName" : @"RecognizerName",
             @"tags" : @"Tags",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             };
}

@end

@implementation AWSComprehendDeleteDocumentClassifierRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierArn" : @"DocumentClassifierArn",
             };
}

@end

@implementation AWSComprehendDeleteDocumentClassifierResponse

@end

@implementation AWSComprehendDeleteEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSComprehendDeleteEndpointResponse

@end

@implementation AWSComprehendDeleteEntityRecognizerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             };
}

@end

@implementation AWSComprehendDeleteEntityRecognizerResponse

@end

@implementation AWSComprehendDescribeDocumentClassificationJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeDocumentClassificationJobResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierArn" : @"DocumentClassifierArn",
             };
}

@end

@implementation AWSComprehendDescribeDocumentClassifierResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeDominantLanguageDetectionJobResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSComprehendDescribeEndpointResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeEntitiesDetectionJobResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             };
}

@end

@implementation AWSComprehendDescribeEntityRecognizerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityRecognizerProperties" : @"EntityRecognizerProperties",
             };
}

+ (NSValueTransformer *)entityRecognizerPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityRecognizerProperties class]];
}

@end

@implementation AWSComprehendDescribeKeyPhrasesDetectionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeKeyPhrasesDetectionJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPhrasesDetectionJobProperties" : @"KeyPhrasesDetectionJobProperties",
             };
}

+ (NSValueTransformer *)keyPhrasesDetectionJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendKeyPhrasesDetectionJobProperties class]];
}

@end

@implementation AWSComprehendDescribeSentimentDetectionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeSentimentDetectionJobResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendDescribeTopicsDetectionJobResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             };
}

@end

@implementation AWSComprehendDetectDominantLanguageResponse

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

@implementation AWSComprehendDetectEntitiesResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPhrases" : @"KeyPhrases",
             };
}

+ (NSValueTransformer *)keyPhrasesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSComprehendKeyPhrase class]];
}

@end

@implementation AWSComprehendDetectSentimentRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"score" : @"Score",
             };
}

@end

@implementation AWSComprehendDocumentClassificationJobFilter

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"documentClassifierArn" : @"DocumentClassifierArn",
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"labelDelimiter" : @"LabelDelimiter",
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSComprehendDocumentClassifierOutputDataConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSComprehendDocumentClassifierProperties

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
             @"outputDataConfig" : @"OutputDataConfig",
             @"status" : @"Status",
             @"submitTime" : @"SubmitTime",
             @"trainingEndTime" : @"TrainingEndTime",
             @"trainingStartTime" : @"TrainingStartTime",
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

@implementation AWSComprehendDocumentLabel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"score" : @"Score",
             };
}

@end

@implementation AWSComprehendDominantLanguage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"score" : @"Score",
             };
}

@end

@implementation AWSComprehendDominantLanguageDetectionJobFilter

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"currentInferenceUnits" : @"CurrentInferenceUnits",
             @"desiredInferenceUnits" : @"DesiredInferenceUnits",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             @"inputDataConfig" : @"InputDataConfig",
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

@implementation AWSComprehendEntityRecognizerAnnotations

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSComprehendEntityRecognizerDocuments

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSComprehendEntityRecognizerEntityList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSComprehendEntityRecognizerEvaluationMetrics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"f1Score" : @"F1Score",
             @"precision" : @"Precision",
             @"recall" : @"Recall",
             };
}

@end

@implementation AWSComprehendEntityRecognizerFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"annotations" : @"Annotations",
             @"documents" : @"Documents",
             @"entityList" : @"EntityList",
             @"entityTypes" : @"EntityTypes",
             };
}

+ (NSValueTransformer *)annotationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendEntityRecognizerAnnotations class]];
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"languageCode" : @"LanguageCode",
             @"message" : @"Message",
             @"recognizerMetadata" : @"RecognizerMetadata",
             @"status" : @"Status",
             @"submitTime" : @"SubmitTime",
             @"trainingEndTime" : @"TrainingEndTime",
             @"trainingStartTime" : @"TrainingStartTime",
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

@implementation AWSComprehendEntityTypesEvaluationMetrics

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"f1Score" : @"F1Score",
             @"precision" : @"Precision",
             @"recall" : @"Recall",
             };
}

@end

@implementation AWSComprehendEntityTypesListItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             };
}

@end

@implementation AWSComprehendInputDataConfig

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

@implementation AWSComprehendKeyPhrase

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
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

@implementation AWSComprehendListDocumentClassifiersRequest

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

@implementation AWSComprehendListEntityRecognizersRequest

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

@implementation AWSComprehendListKeyPhrasesDetectionJobsRequest

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

@implementation AWSComprehendListSentimentDetectionJobsRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSComprehendListTagsForResourceResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"kmsKeyId" : @"KmsKeyId",
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSComprehendPartOfSpeechTag

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

@implementation AWSComprehendSentimentDetectionJobFilter

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"documentClassifierArn" : @"DocumentClassifierArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"outputDataConfig" : @"OutputDataConfig",
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

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendStartDocumentClassificationJobResponse

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

@implementation AWSComprehendStartDominantLanguageDetectionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"outputDataConfig" : @"OutputDataConfig",
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

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendStartDominantLanguageDetectionJobResponse

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

@implementation AWSComprehendStartEntitiesDetectionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"languageCode" : @"LanguageCode",
             @"outputDataConfig" : @"OutputDataConfig",
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

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendStartEntitiesDetectionJobResponse

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

@implementation AWSComprehendStartKeyPhrasesDetectionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"languageCode" : @"LanguageCode",
             @"outputDataConfig" : @"OutputDataConfig",
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

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendStartKeyPhrasesDetectionJobResponse

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

@implementation AWSComprehendStartSentimentDetectionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"languageCode" : @"LanguageCode",
             @"outputDataConfig" : @"OutputDataConfig",
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

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendStartSentimentDetectionJobResponse

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

@implementation AWSComprehendStartTopicsDetectionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"numberOfTopics" : @"NumberOfTopics",
             @"outputDataConfig" : @"OutputDataConfig",
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

+ (NSValueTransformer *)vpcConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendVpcConfig class]];
}

@end

@implementation AWSComprehendStartTopicsDetectionJobResponse

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

@implementation AWSComprehendStopDominantLanguageDetectionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendStopDominantLanguageDetectionJobResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendStopEntitiesDetectionJobResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendStopKeyPhrasesDetectionJobResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSComprehendStopSentimentDetectionJobResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentClassifierArn" : @"DocumentClassifierArn",
             };
}

@end

@implementation AWSComprehendStopTrainingDocumentClassifierResponse

@end

@implementation AWSComprehendStopTrainingEntityRecognizerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityRecognizerArn" : @"EntityRecognizerArn",
             };
}

@end

@implementation AWSComprehendStopTrainingEntityRecognizerResponse

@end

@implementation AWSComprehendSyntaxToken

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSComprehendTagResourceRequest

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

@end

@implementation AWSComprehendTopicsDetectionJobFilter

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSComprehendUntagResourceResponse

@end

@implementation AWSComprehendUpdateEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"desiredInferenceUnits" : @"DesiredInferenceUnits",
             @"endpointArn" : @"EndpointArn",
             };
}

@end

@implementation AWSComprehendUpdateEndpointResponse

@end

@implementation AWSComprehendVpcConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnets" : @"Subnets",
             };
}

@end
