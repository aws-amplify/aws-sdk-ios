//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
