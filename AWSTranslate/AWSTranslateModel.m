//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSTranslateCreateParallelDataRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"detail" : @"Description",
             @"encryptionKey" : @"EncryptionKey",
             @"name" : @"Name",
             @"parallelDataConfig" : @"ParallelDataConfig",
             };
}

+ (NSValueTransformer *)encryptionKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateEncryptionKey class]];
}

+ (NSValueTransformer *)parallelDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateParallelDataConfig class]];
}

@end

@implementation AWSTranslateCreateParallelDataResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusFailed);
        }
        return @(AWSTranslateParallelDataStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateParallelDataStatusCreating:
                return @"CREATING";
            case AWSTranslateParallelDataStatusUpdating:
                return @"UPDATING";
            case AWSTranslateParallelDataStatusActive:
                return @"ACTIVE";
            case AWSTranslateParallelDataStatusDeleting:
                return @"DELETING";
            case AWSTranslateParallelDataStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranslateDeleteParallelDataRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSTranslateDeleteParallelDataResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusFailed);
        }
        return @(AWSTranslateParallelDataStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateParallelDataStatusCreating:
                return @"CREATING";
            case AWSTranslateParallelDataStatusUpdating:
                return @"UPDATING";
            case AWSTranslateParallelDataStatusActive:
                return @"ACTIVE";
            case AWSTranslateParallelDataStatusDeleting:
                return @"DELETING";
            case AWSTranslateParallelDataStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranslateDeleteTerminologyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSTranslateDescribeTextTranslationJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSTranslateDescribeTextTranslationJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSTranslateGetParallelDataRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSTranslateGetParallelDataResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auxiliaryDataLocation" : @"AuxiliaryDataLocation",
             @"dataLocation" : @"DataLocation",
             @"latestUpdateAttemptAuxiliaryDataLocation" : @"LatestUpdateAttemptAuxiliaryDataLocation",
             @"parallelDataProperties" : @"ParallelDataProperties",
             };
}

+ (NSValueTransformer *)auxiliaryDataLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateParallelDataDataLocation class]];
}

+ (NSValueTransformer *)dataLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateParallelDataDataLocation class]];
}

+ (NSValueTransformer *)latestUpdateAttemptAuxiliaryDataLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateParallelDataDataLocation class]];
}

+ (NSValueTransformer *)parallelDataPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateParallelDataProperties class]];
}

@end

@implementation AWSTranslateGetTerminologyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"TSV"] == NSOrderedSame) {
            return @(AWSTranslateTerminologyDataFormatTsv);
        }
        return @(AWSTranslateTerminologyDataFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateTerminologyDataFormatCsv:
                return @"CSV";
            case AWSTranslateTerminologyDataFormatTmx:
                return @"TMX";
            case AWSTranslateTerminologyDataFormatTsv:
                return @"TSV";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranslateGetTerminologyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auxiliaryDataLocation" : @"AuxiliaryDataLocation",
             @"terminologyDataLocation" : @"TerminologyDataLocation",
             @"terminologyProperties" : @"TerminologyProperties",
             };
}

+ (NSValueTransformer *)auxiliaryDataLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTerminologyDataLocation class]];
}

+ (NSValueTransformer *)terminologyDataLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTerminologyDataLocation class]];
}

+ (NSValueTransformer *)terminologyPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTerminologyProperties class]];
}

@end

@implementation AWSTranslateImportTerminologyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auxiliaryDataLocation" : @"AuxiliaryDataLocation",
             @"terminologyProperties" : @"TerminologyProperties",
             };
}

+ (NSValueTransformer *)auxiliaryDataLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTerminologyDataLocation class]];
}

+ (NSValueTransformer *)terminologyPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTerminologyProperties class]];
}

@end

@implementation AWSTranslateInputDataConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentType" : @"ContentType",
             @"s3Uri" : @"S3Uri",
             };
}

@end

@implementation AWSTranslateJobDetails

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentsWithErrorsCount" : @"DocumentsWithErrorsCount",
             @"inputDocumentsCount" : @"InputDocumentsCount",
             @"translatedDocumentsCount" : @"TranslatedDocumentsCount",
             };
}

@end

@implementation AWSTranslateListParallelDataRequest

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

@implementation AWSTranslateListParallelDataResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"parallelDataPropertiesList" : @"ParallelDataPropertiesList",
             };
}

+ (NSValueTransformer *)parallelDataPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranslateParallelDataProperties class]];
}

@end

@implementation AWSTranslateListTerminologiesRequest

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

@implementation AWSTranslateListTerminologiesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTextTranslationJobFilter class]];
}

@end

@implementation AWSTranslateListTextTranslationJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encryptionKey" : @"EncryptionKey",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)encryptionKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateEncryptionKey class]];
}

@end

@implementation AWSTranslateParallelDataConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"format" : @"Format",
             @"s3Uri" : @"S3Uri",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TSV"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataFormatTsv);
        }
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"TMX"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataFormatTmx);
        }
        return @(AWSTranslateParallelDataFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateParallelDataFormatTsv:
                return @"TSV";
            case AWSTranslateParallelDataFormatCsv:
                return @"CSV";
            case AWSTranslateParallelDataFormatTmx:
                return @"TMX";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranslateParallelDataDataLocation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"repositoryType" : @"RepositoryType",
             };
}

@end

@implementation AWSTranslateParallelDataProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"encryptionKey" : @"EncryptionKey",
             @"failedRecordCount" : @"FailedRecordCount",
             @"importedDataSize" : @"ImportedDataSize",
             @"importedRecordCount" : @"ImportedRecordCount",
             @"lastUpdatedAt" : @"LastUpdatedAt",
             @"latestUpdateAttemptAt" : @"LatestUpdateAttemptAt",
             @"latestUpdateAttemptStatus" : @"LatestUpdateAttemptStatus",
             @"message" : @"Message",
             @"name" : @"Name",
             @"parallelDataConfig" : @"ParallelDataConfig",
             @"skippedRecordCount" : @"SkippedRecordCount",
             @"sourceLanguageCode" : @"SourceLanguageCode",
             @"status" : @"Status",
             @"targetLanguageCodes" : @"TargetLanguageCodes",
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

+ (NSValueTransformer *)latestUpdateAttemptAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)latestUpdateAttemptStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusFailed);
        }
        return @(AWSTranslateParallelDataStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateParallelDataStatusCreating:
                return @"CREATING";
            case AWSTranslateParallelDataStatusUpdating:
                return @"UPDATING";
            case AWSTranslateParallelDataStatusActive:
                return @"ACTIVE";
            case AWSTranslateParallelDataStatusDeleting:
                return @"DELETING";
            case AWSTranslateParallelDataStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)parallelDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateParallelDataConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusFailed);
        }
        return @(AWSTranslateParallelDataStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateParallelDataStatusCreating:
                return @"CREATING";
            case AWSTranslateParallelDataStatusUpdating:
                return @"UPDATING";
            case AWSTranslateParallelDataStatusActive:
                return @"ACTIVE";
            case AWSTranslateParallelDataStatusDeleting:
                return @"DELETING";
            case AWSTranslateParallelDataStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranslateStartTextTranslationJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"outputDataConfig" : @"OutputDataConfig",
             @"parallelDataNames" : @"ParallelDataNames",
             @"settings" : @"Settings",
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

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTranslationSettings class]];
}

@end

@implementation AWSTranslateStartTextTranslationJobResponse

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSTranslateStopTextTranslationJobResponse

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sourceText" : @"SourceText",
             @"targetText" : @"TargetText",
             };
}

@end

@implementation AWSTranslateTerminologyData

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directionality" : @"Directionality",
             @"file" : @"File",
             @"format" : @"Format",
             };
}

+ (NSValueTransformer *)directionalityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNI"] == NSOrderedSame) {
            return @(AWSTranslateDirectionalityUni);
        }
        if ([value caseInsensitiveCompare:@"MULTI"] == NSOrderedSame) {
            return @(AWSTranslateDirectionalityMulti);
        }
        return @(AWSTranslateDirectionalityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateDirectionalityUni:
                return @"UNI";
            case AWSTranslateDirectionalityMulti:
                return @"MULTI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSTranslateTerminologyDataFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"TMX"] == NSOrderedSame) {
            return @(AWSTranslateTerminologyDataFormatTmx);
        }
        if ([value caseInsensitiveCompare:@"TSV"] == NSOrderedSame) {
            return @(AWSTranslateTerminologyDataFormatTsv);
        }
        return @(AWSTranslateTerminologyDataFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateTerminologyDataFormatCsv:
                return @"CSV";
            case AWSTranslateTerminologyDataFormatTmx:
                return @"TMX";
            case AWSTranslateTerminologyDataFormatTsv:
                return @"TSV";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranslateTerminologyDataLocation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"repositoryType" : @"RepositoryType",
             };
}

@end

@implementation AWSTranslateTerminologyProperties

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdAt" : @"CreatedAt",
             @"detail" : @"Description",
             @"directionality" : @"Directionality",
             @"encryptionKey" : @"EncryptionKey",
             @"format" : @"Format",
             @"lastUpdatedAt" : @"LastUpdatedAt",
             @"message" : @"Message",
             @"name" : @"Name",
             @"sizeBytes" : @"SizeBytes",
             @"skippedTermCount" : @"SkippedTermCount",
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

+ (NSValueTransformer *)directionalityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNI"] == NSOrderedSame) {
            return @(AWSTranslateDirectionalityUni);
        }
        if ([value caseInsensitiveCompare:@"MULTI"] == NSOrderedSame) {
            return @(AWSTranslateDirectionalityMulti);
        }
        return @(AWSTranslateDirectionalityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateDirectionalityUni:
                return @"UNI";
            case AWSTranslateDirectionalityMulti:
                return @"MULTI";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)encryptionKeyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateEncryptionKey class]];
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSTranslateTerminologyDataFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"TMX"] == NSOrderedSame) {
            return @(AWSTranslateTerminologyDataFormatTmx);
        }
        if ([value caseInsensitiveCompare:@"TSV"] == NSOrderedSame) {
            return @(AWSTranslateTerminologyDataFormatTsv);
        }
        return @(AWSTranslateTerminologyDataFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateTerminologyDataFormatCsv:
                return @"CSV";
            case AWSTranslateTerminologyDataFormatTmx:
                return @"TMX";
            case AWSTranslateTerminologyDataFormatTsv:
                return @"TSV";
            default:
                return nil;
        }
    }];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
             @"parallelDataNames" : @"ParallelDataNames",
             @"settings" : @"Settings",
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

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTranslationSettings class]];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"settings" : @"Settings",
             @"sourceLanguageCode" : @"SourceLanguageCode",
             @"targetLanguageCode" : @"TargetLanguageCode",
             @"terminologyNames" : @"TerminologyNames",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)settingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTranslationSettings class]];
}

@end

@implementation AWSTranslateTranslateTextResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appliedSettings" : @"AppliedSettings",
             @"appliedTerminologies" : @"AppliedTerminologies",
             @"sourceLanguageCode" : @"SourceLanguageCode",
             @"targetLanguageCode" : @"TargetLanguageCode",
             @"translatedText" : @"TranslatedText",
             };
}

+ (NSValueTransformer *)appliedSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateTranslationSettings class]];
}

+ (NSValueTransformer *)appliedTerminologiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTranslateAppliedTerminology class]];
}

@end

@implementation AWSTranslateTranslationSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"formality" : @"Formality",
             @"profanity" : @"Profanity",
             };
}

+ (NSValueTransformer *)formalityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FORMAL"] == NSOrderedSame) {
            return @(AWSTranslateFormalityFormal);
        }
        if ([value caseInsensitiveCompare:@"INFORMAL"] == NSOrderedSame) {
            return @(AWSTranslateFormalityInformal);
        }
        return @(AWSTranslateFormalityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateFormalityFormal:
                return @"FORMAL";
            case AWSTranslateFormalityInformal:
                return @"INFORMAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)profanityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MASK"] == NSOrderedSame) {
            return @(AWSTranslateProfanityMask);
        }
        return @(AWSTranslateProfanityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateProfanityMask:
                return @"MASK";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTranslateUpdateParallelDataRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"parallelDataConfig" : @"ParallelDataConfig",
             };
}

+ (NSValueTransformer *)parallelDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTranslateParallelDataConfig class]];
}

@end

@implementation AWSTranslateUpdateParallelDataResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestUpdateAttemptAt" : @"LatestUpdateAttemptAt",
             @"latestUpdateAttemptStatus" : @"LatestUpdateAttemptStatus",
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)latestUpdateAttemptAtJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)latestUpdateAttemptStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusFailed);
        }
        return @(AWSTranslateParallelDataStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateParallelDataStatusCreating:
                return @"CREATING";
            case AWSTranslateParallelDataStatusUpdating:
                return @"UPDATING";
            case AWSTranslateParallelDataStatusActive:
                return @"ACTIVE";
            case AWSTranslateParallelDataStatusDeleting:
                return @"DELETING";
            case AWSTranslateParallelDataStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTranslateParallelDataStatusFailed);
        }
        return @(AWSTranslateParallelDataStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTranslateParallelDataStatusCreating:
                return @"CREATING";
            case AWSTranslateParallelDataStatusUpdating:
                return @"UPDATING";
            case AWSTranslateParallelDataStatusActive:
                return @"ACTIVE";
            case AWSTranslateParallelDataStatusDeleting:
                return @"DELETING";
            case AWSTranslateParallelDataStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end
