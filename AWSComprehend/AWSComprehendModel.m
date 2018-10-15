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

@implementation AWSComprehendBatchItemError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"index" : @"Index",
             };
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
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
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
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
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
        return @(AWSComprehendLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSComprehendLanguageCodeEn:
                return @"en";
            case AWSComprehendLanguageCodeEs:
                return @"es";
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

@implementation AWSComprehendDominantLanguage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"languageCode" : @"LanguageCode",
             @"score" : @"Score",
             };
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
             @"s3Uri" : @"S3Uri",
             };
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

@implementation AWSComprehendStartTopicsDetectionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"numberOfTopics" : @"NumberOfTopics",
             @"outputDataConfig" : @"OutputDataConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendInputDataConfig class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSComprehendOutputDataConfig class]];
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
            default:
                return nil;
        }
    }];
}

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
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"message" : @"Message",
             @"numberOfTopics" : @"NumberOfTopics",
             @"outputDataConfig" : @"OutputDataConfig",
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
