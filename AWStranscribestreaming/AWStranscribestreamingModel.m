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

#import "AWStranscribestreamingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWStranscribestreamingErrorDomain = @"com.amazonaws.AWStranscribestreamingErrorDomain";

@implementation AWStranscribestreamingAlternative

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"transcript" : @"Transcript",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStranscribestreamingItem class]];
}

@end

@implementation AWStranscribestreamingAudioEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioChunk" : @"AudioChunk",
             };
}

@end

@implementation AWStranscribestreamingAudioStream

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioEvent" : @"AudioEvent",
             };
}

+ (NSValueTransformer *)audioEventJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWStranscribestreamingAudioEvent class]];
}

@end

@implementation AWStranscribestreamingItem

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
        if ([value caseInsensitiveCompare:@"pronunciation"] == NSOrderedSame) {
            return @(AWStranscribestreamingItemTypePronunciation);
        }
        if ([value caseInsensitiveCompare:@"punctuation"] == NSOrderedSame) {
            return @(AWStranscribestreamingItemTypePunctuation);
        }
        return @(AWStranscribestreamingItemTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStranscribestreamingItemTypePronunciation:
                return @"pronunciation";
            case AWStranscribestreamingItemTypePunctuation:
                return @"punctuation";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWStranscribestreamingResult

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStranscribestreamingAlternative class]];
}

@end

@implementation AWStranscribestreamingStartStreamTranscriptionRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWStranscribestreamingAudioStream class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en-US"] == NSOrderedSame) {
            return @(AWStranscribestreamingLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWStranscribestreamingLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWStranscribestreamingLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWStranscribestreamingLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWStranscribestreamingLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWStranscribestreamingLanguageCodeEnAU);
        }
        return @(AWStranscribestreamingLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStranscribestreamingLanguageCodeEnUS:
                return @"en-US";
            case AWStranscribestreamingLanguageCodeEnGB:
                return @"en-GB";
            case AWStranscribestreamingLanguageCodeEsUS:
                return @"es-US";
            case AWStranscribestreamingLanguageCodeFrCA:
                return @"fr-CA";
            case AWStranscribestreamingLanguageCodeFrFR:
                return @"fr-FR";
            case AWStranscribestreamingLanguageCodeEnAU:
                return @"en-AU";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mediaEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pcm"] == NSOrderedSame) {
            return @(AWStranscribestreamingMediaEncodingPcm);
        }
        return @(AWStranscribestreamingMediaEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStranscribestreamingMediaEncodingPcm:
                return @"pcm";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWStranscribestreamingStartStreamTranscriptionResponse

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
            return @(AWStranscribestreamingLanguageCodeEnUS);
        }
        if ([value caseInsensitiveCompare:@"en-GB"] == NSOrderedSame) {
            return @(AWStranscribestreamingLanguageCodeEnGB);
        }
        if ([value caseInsensitiveCompare:@"es-US"] == NSOrderedSame) {
            return @(AWStranscribestreamingLanguageCodeEsUS);
        }
        if ([value caseInsensitiveCompare:@"fr-CA"] == NSOrderedSame) {
            return @(AWStranscribestreamingLanguageCodeFrCA);
        }
        if ([value caseInsensitiveCompare:@"fr-FR"] == NSOrderedSame) {
            return @(AWStranscribestreamingLanguageCodeFrFR);
        }
        if ([value caseInsensitiveCompare:@"en-AU"] == NSOrderedSame) {
            return @(AWStranscribestreamingLanguageCodeEnAU);
        }
        return @(AWStranscribestreamingLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStranscribestreamingLanguageCodeEnUS:
                return @"en-US";
            case AWStranscribestreamingLanguageCodeEnGB:
                return @"en-GB";
            case AWStranscribestreamingLanguageCodeEsUS:
                return @"es-US";
            case AWStranscribestreamingLanguageCodeFrCA:
                return @"fr-CA";
            case AWStranscribestreamingLanguageCodeFrFR:
                return @"fr-FR";
            case AWStranscribestreamingLanguageCodeEnAU:
                return @"en-AU";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)mediaEncodingJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pcm"] == NSOrderedSame) {
            return @(AWStranscribestreamingMediaEncodingPcm);
        }
        return @(AWStranscribestreamingMediaEncodingUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWStranscribestreamingMediaEncodingPcm:
                return @"pcm";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)transcriptResultStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWStranscribestreamingTranscriptResultStream class]];
}

@end

@implementation AWStranscribestreamingTranscript

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWStranscribestreamingResult class]];
}

@end

@implementation AWStranscribestreamingTranscriptEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transcript" : @"Transcript",
             };
}

+ (NSValueTransformer *)transcriptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWStranscribestreamingTranscript class]];
}

@end

@implementation AWStranscribestreamingTranscriptResultStream

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWStranscribestreamingTranscriptEvent class]];
}

@end
