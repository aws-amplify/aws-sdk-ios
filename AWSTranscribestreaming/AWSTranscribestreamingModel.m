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

#import "AWSTranscribestreamingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSTranscribestreamingErrorDomain = @"com.amazonaws.AWSTranscribestreamingErrorDomain";

@implementation AWSTranscribestreamingAlternative

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"transcript" : @"Transcript",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribestreamingItem class]];
}

@end

@implementation AWSTranscribestreamingAudioEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioChunk" : @"AudioChunk",
             };
}

@end

@implementation AWSTranscribestreamingAudioStream

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioEvent" : @"AudioEvent",
             };
}

+ (NSValueTransformer *)audioEventJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribestreamingAudioEvent class]];
}

@end

@implementation AWSTranscribestreamingItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"endTime" : @"EndTime",
             @"startTime" : @"StartTime",
             @"types" : @"Type",
             @"vocabularyFilterMatch" : @"VocabularyFilterMatch",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pronunciation"] == NSOrderedSame) {
            return @(AWSTranscribestreamingItemTypePronunciation);
        }
        if ([value caseInsensitiveCompare:@"punctuation"] == NSOrderedSame) {
            return @(AWSTranscribestreamingItemTypePunctuation);
        }
        return @(AWSTranscribestreamingItemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribestreamingItemTypePronunciation:
                return @"pronunciation";
            case AWSTranscribestreamingItemTypePunctuation:
                return @"punctuation";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribestreamingResult

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribestreamingAlternative class]];
}

@end

@implementation AWSTranscribestreamingStartStreamTranscriptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioStream" : @"AudioStream",
             @"languageCode" : @"LanguageCode",
             @"mediaEncoding" : @"MediaEncoding",
             @"mediaSampleRateHertz" : @"MediaSampleRateHertz",
             @"sessionId" : @"SessionId",
             @"vocabularyFilterMethod" : @"VocabularyFilterMethod",
             @"vocabularyFilterName" : @"VocabularyFilterName",
             @"vocabularyName" : @"VocabularyName",
             };
}

+ (NSValueTransformer *)audioStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribestreamingAudioStream class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribestreamingLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribestreamingLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribestreamingLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribestreamingLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribestreamingLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribestreamingLanguageCodeEnAU);
        }
        return @(AWSTranscribestreamingLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribestreamingLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribestreamingLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribestreamingLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribestreamingLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribestreamingLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribestreamingLanguageCodeEnAU:
                return @"en-AU";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mediaEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pcm"] == NSOrderedSame) {
            return @(AWSTranscribestreamingMediaEncodingPcm);
        }
        return @(AWSTranscribestreamingMediaEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribestreamingMediaEncodingPcm:
                return @"pcm";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vocabularyFilterMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"remove"] == NSOrderedSame) {
            return @(AWSTranscribestreamingVocabularyFilterMethodRemove);
        }
        if ([value caseInsensitiveCompare:@"mask"] == NSOrderedSame) {
            return @(AWSTranscribestreamingVocabularyFilterMethodMask);
        }
        if ([value caseInsensitiveCompare:@"tag"] == NSOrderedSame) {
            return @(AWSTranscribestreamingVocabularyFilterMethodTag);
        }
        return @(AWSTranscribestreamingVocabularyFilterMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribestreamingVocabularyFilterMethodRemove:
                return @"remove";
            case AWSTranscribestreamingVocabularyFilterMethodMask:
                return @"mask";
            case AWSTranscribestreamingVocabularyFilterMethodTag:
                return @"tag";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribestreamingStartStreamTranscriptionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"mediaEncoding" : @"MediaEncoding",
             @"mediaSampleRateHertz" : @"MediaSampleRateHertz",
             @"requestId" : @"RequestId",
             @"sessionId" : @"SessionId",
             @"transcriptResultStream" : @"TranscriptResultStream",
             @"vocabularyFilterMethod" : @"VocabularyFilterMethod",
             @"vocabularyFilterName" : @"VocabularyFilterName",
             @"vocabularyName" : @"VocabularyName",
             };
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWSTranscribestreamingLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWSTranscribestreamingLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWSTranscribestreamingLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWSTranscribestreamingLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWSTranscribestreamingLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWSTranscribestreamingLanguageCodeEnAU);
        }
        return @(AWSTranscribestreamingLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribestreamingLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribestreamingLanguageCodeEnGB:
                return @"en-GB";
            case AWSTranscribestreamingLanguageCodeEsUS:
                return @"es-US";
            case AWSTranscribestreamingLanguageCodeFrCA:
                return @"fr-CA";
            case AWSTranscribestreamingLanguageCodeFrFR:
                return @"fr-FR";
            case AWSTranscribestreamingLanguageCodeEnAU:
                return @"en-AU";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mediaEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pcm"] == NSOrderedSame) {
            return @(AWSTranscribestreamingMediaEncodingPcm);
        }
        return @(AWSTranscribestreamingMediaEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribestreamingMediaEncodingPcm:
                return @"pcm";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transcriptResultStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribestreamingTranscriptResultStream class]];
}

+ (NSValueTransformer *)vocabularyFilterMethodJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"remove"] == NSOrderedSame) {
            return @(AWSTranscribestreamingVocabularyFilterMethodRemove);
        }
        if ([value caseInsensitiveCompare:@"mask"] == NSOrderedSame) {
            return @(AWSTranscribestreamingVocabularyFilterMethodMask);
        }
        if ([value caseInsensitiveCompare:@"tag"] == NSOrderedSame) {
            return @(AWSTranscribestreamingVocabularyFilterMethodTag);
        }
        return @(AWSTranscribestreamingVocabularyFilterMethodUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribestreamingVocabularyFilterMethodRemove:
                return @"remove";
            case AWSTranscribestreamingVocabularyFilterMethodMask:
                return @"mask";
            case AWSTranscribestreamingVocabularyFilterMethodTag:
                return @"tag";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranscribestreamingTranscript

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranscribestreamingResult class]];
}

@end

@implementation AWSTranscribestreamingTranscriptEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transcript" : @"Transcript",
             };
}

+ (NSValueTransformer *)transcriptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribestreamingTranscript class]];
}

@end

@implementation AWSTranscribestreamingTranscriptResultStream

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribestreamingTranscriptEvent class]];
}

@end
