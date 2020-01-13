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

#import "AWSTranslateModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSTranslateErrorDomain = @"com.amazonaws.AWSTranslateErrorDomain";

@implementation AWSTranslateAppliedTerminology

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"terms" : @"Terms",
             };
}

+ (NSValueTransformer *)termsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranslateTerm class]];
}

@end

@implementation AWSTranslateDeleteTerminologyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSTranslateDescribeTextTranslationJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSTranslateDescribeTextTranslationJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"textTranslationJobProperties" : @"TextTranslationJobProperties",
             };
}

+ (NSValueTransformer *)textTranslationJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTextTranslationJobProperties class]];
}

@end

@implementation AWSTranslateEncryptionKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSTranslateEncryptionKeyTypeKms);
        }
        return @(AWSTranslateEncryptionKeyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateEncryptionKeyTypeKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranslateGetTerminologyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"terminologyDataFormat" : @"TerminologyDataFormat",
             };
}

+ (NSValueTransformer *)terminologyDataFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSTranslateTerminologyDataFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"TMX"] == NSOrderedSame) {
            return @(AWSTranslateTerminologyDataFormatTmx);
        }
        return @(AWSTranslateTerminologyDataFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateTerminologyDataFormatCsv:
                return @"CSV";
            case AWSTranslateTerminologyDataFormatTmx:
                return @"TMX";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranslateGetTerminologyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"terminologyDataLocation" : @"TerminologyDataLocation",
             @"terminologyProperties" : @"TerminologyProperties",
             };
}

+ (NSValueTransformer *)terminologyDataLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTerminologyDataLocation class]];
}

+ (NSValueTransformer *)terminologyPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTerminologyProperties class]];
}

@end

@implementation AWSTranslateImportTerminologyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"encryptionKey" : @"EncryptionKey",
             @"mergeStrategy" : @"MergeStrategy",
             @"name" : @"Name",
             @"terminologyData" : @"TerminologyData",
             };
}

+ (NSValueTransformer *)encryptionKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateEncryptionKey class]];
}

+ (NSValueTransformer *)mergeStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OVERWRITE"] == NSOrderedSame) {
            return @(AWSTranslateMergeStrategyOverwrite);
        }
        return @(AWSTranslateMergeStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateMergeStrategyOverwrite:
                return @"OVERWRITE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)terminologyDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTerminologyData class]];
}

@end

@implementation AWSTranslateImportTerminologyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"terminologyProperties" : @"TerminologyProperties",
             };
}

+ (NSValueTransformer *)terminologyPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTerminologyProperties class]];
}

@end

@implementation AWSTranslateInputDataConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSTranslateJobDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentsWithErrorsCount" : @"DocumentsWithErrorsCount",
             @"inputDocumentsCount" : @"InputDocumentsCount",
             @"translatedDocumentsCount" : @"TranslatedDocumentsCount",
             };
}

@end

@implementation AWSTranslateListTerminologiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSTranslateListTerminologiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"terminologyPropertiesList" : @"TerminologyPropertiesList",
             };
}

+ (NSValueTransformer *)terminologyPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranslateTerminologyProperties class]];
}

@end

@implementation AWSTranslateListTextTranslationJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTextTranslationJobFilter class]];
}

@end

@implementation AWSTranslateListTextTranslationJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"textTranslationJobPropertiesList" : @"TextTranslationJobPropertiesList",
             };
}

+ (NSValueTransformer *)textTranslationJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranslateTextTranslationJobProperties class]];
}

@end

@implementation AWSTranslateOutputDataConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSTranslateStartTextTranslationJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"outputDataConfig" : @"OutputDataConfig",
             @"sourceLanguageCode" : @"SourceLanguageCode",
             @"targetLanguageCodes" : @"TargetLanguageCodes",
             @"terminologyNames" : @"TerminologyNames",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateInputDataConfig class]];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateOutputDataConfig class]];
}

@end

@implementation AWSTranslateStartTextTranslationJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED_WITH_ERROR"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusCompletedWithError);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusStopped);
        }
        return @(AWSTranslateJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSTranslateJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTranslateJobStatusCompleted:
                return @"COMPLETED";
            case AWSTranslateJobStatusCompletedWithError:
                return @"COMPLETED_WITH_ERROR";
            case AWSTranslateJobStatusFailed:
                return @"FAILED";
            case AWSTranslateJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSTranslateJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranslateStopTextTranslationJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSTranslateStopTextTranslationJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"jobStatus" : @"JobStatus",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED_WITH_ERROR"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusCompletedWithError);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusStopped);
        }
        return @(AWSTranslateJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSTranslateJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTranslateJobStatusCompleted:
                return @"COMPLETED";
            case AWSTranslateJobStatusCompletedWithError:
                return @"COMPLETED_WITH_ERROR";
            case AWSTranslateJobStatusFailed:
                return @"FAILED";
            case AWSTranslateJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSTranslateJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranslateTerm

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceText" : @"SourceText",
             @"targetText" : @"TargetText",
             };
}

@end

@implementation AWSTranslateTerminologyData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"file" : @"File",
             @"format" : @"Format",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSTranslateTerminologyDataFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"TMX"] == NSOrderedSame) {
            return @(AWSTranslateTerminologyDataFormatTmx);
        }
        return @(AWSTranslateTerminologyDataFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateTerminologyDataFormatCsv:
                return @"CSV";
            case AWSTranslateTerminologyDataFormatTmx:
                return @"TMX";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranslateTerminologyDataLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"repositoryType" : @"RepositoryType",
             };
}

@end

@implementation AWSTranslateTerminologyProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"encryptionKey" : @"EncryptionKey",
             @"lastUpdatedAt" : @"LastUpdatedAt",
             @"name" : @"Name",
             @"sizeBytes" : @"SizeBytes",
             @"sourceLanguageCode" : @"SourceLanguageCode",
             @"targetLanguageCodes" : @"TargetLanguageCodes",
             @"termCount" : @"TermCount",
             };
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)encryptionKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateEncryptionKey class]];
}

+ (NSValueTransformer *)lastUpdatedAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSTranslateTextTranslationJobFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"submittedAfterTime" : @"SubmittedAfterTime",
             @"submittedBeforeTime" : @"SubmittedBeforeTime",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED_WITH_ERROR"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusCompletedWithError);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusStopped);
        }
        return @(AWSTranslateJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSTranslateJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTranslateJobStatusCompleted:
                return @"COMPLETED";
            case AWSTranslateJobStatusCompletedWithError:
                return @"COMPLETED_WITH_ERROR";
            case AWSTranslateJobStatusFailed:
                return @"FAILED";
            case AWSTranslateJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSTranslateJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submittedAfterTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submittedBeforeTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSTranslateTextTranslationJobProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobDetails" : @"JobDetails",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"message" : @"Message",
             @"outputDataConfig" : @"OutputDataConfig",
             @"sourceLanguageCode" : @"SourceLanguageCode",
             @"submittedTime" : @"SubmittedTime",
             @"targetLanguageCodes" : @"TargetLanguageCodes",
             @"terminologyNames" : @"TerminologyNames",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateInputDataConfig class]];
}

+ (NSValueTransformer *)jobDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateJobDetails class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED_WITH_ERROR"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusCompletedWithError);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSTranslateJobStatusStopped);
        }
        return @(AWSTranslateJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSTranslateJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTranslateJobStatusCompleted:
                return @"COMPLETED";
            case AWSTranslateJobStatusCompletedWithError:
                return @"COMPLETED_WITH_ERROR";
            case AWSTranslateJobStatusFailed:
                return @"FAILED";
            case AWSTranslateJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSTranslateJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateOutputDataConfig class]];
}

+ (NSValueTransformer *)submittedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSTranslateTranslateTextRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceLanguageCode" : @"SourceLanguageCode",
             @"targetLanguageCode" : @"TargetLanguageCode",
             @"terminologyNames" : @"TerminologyNames",
             @"text" : @"Text",
             };
}

@end

@implementation AWSTranslateTranslateTextResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appliedTerminologies" : @"AppliedTerminologies",
             @"sourceLanguageCode" : @"SourceLanguageCode",
             @"targetLanguageCode" : @"TargetLanguageCode",
             @"translatedText" : @"TranslatedText",
             };
}

+ (NSValueTransformer *)appliedTerminologiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranslateAppliedTerminology class]];
}

@end
