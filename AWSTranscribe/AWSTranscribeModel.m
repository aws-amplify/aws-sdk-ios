//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@implementation AWSTranscribeCreateVocabularyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"phrases" : @"Phrases",
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
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
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
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
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
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
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
             @"maxSpeakerLabels" : @"MaxSpeakerLabels",
             @"showSpeakerLabels" : @"ShowSpeakerLabels",
             @"vocabularyName" : @"VocabularyName",
             };
}

@end

@implementation AWSTranscribeStartTranscriptionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"media" : @"Media",
             @"mediaFormat" : @"MediaFormat",
             @"mediaSampleRateHertz" : @"MediaSampleRateHertz",
             @"outputBucketName" : @"OutputBucketName",
             @"settings" : @"Settings",
             @"transcriptionJobName" : @"TranscriptionJobName",
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
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
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
             @"transcriptFileUri" : @"TranscriptFileUri",
             };
}

@end

@implementation AWSTranscribeTranscriptionJob

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionTime" : @"CompletionTime",
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"languageCode" : @"LanguageCode",
             @"media" : @"Media",
             @"mediaFormat" : @"MediaFormat",
             @"mediaSampleRateHertz" : @"MediaSampleRateHertz",
             @"settings" : @"Settings",
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
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
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

+ (NSValueTransformer *)transcriptJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranscribeTranscript class]];
}

+ (NSValueTransformer *)transcriptionJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
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
             @"creationTime" : @"CreationTime",
             @"failureReason" : @"FailureReason",
             @"languageCode" : @"LanguageCode",
             @"outputLocationType" : @"OutputLocationType",
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
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
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

+ (NSValueTransformer *)transcriptionJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
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

@implementation AWSTranscribeUpdateVocabularyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"phrases" : @"Phrases",
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
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
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
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
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
        return @(AWSTranscribeLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranscribeLanguageCodeEnUS:
                return @"en-US";
            case AWSTranscribeLanguageCodeEsUS:
                return @"es-US";
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
