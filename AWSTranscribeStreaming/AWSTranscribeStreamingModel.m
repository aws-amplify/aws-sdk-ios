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

#import "AWSTranscribeStreamingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSTranscribeStreamingErrorDomain = @"com.amazonaws.AWSTranscribeStreamingErrorDomain";

@implementation AWSTranscribeStreamingAlternative

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioChunk" : @"AudioChunk",
             };
}

@end

@implementation AWSTranscribeStreamingAudioStream

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

+ (NSValueTransformer *)transcriptResultStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeStreamingTranscriptResultStream class]];
}

@end

@implementation AWSTranscribeStreamingTranscript

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"badRequestException" : @"BadRequestException",
             @"conflictException" : @"ConflictException",
             @"internalFailureException" : @"InternalFailureException",
             @"limitExceededException" : @"LimitExceededException",
             @"transcriptEvent" : @"TranscriptEvent",
             };
}

+ (NSValueTransformer *)transcriptEventJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeStreamingTranscriptEvent class]];
}

@end
