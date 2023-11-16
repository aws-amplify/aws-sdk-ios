//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSTextractModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSTextractErrorDomain = @"com.amazonaws.AWSTextractErrorDomain";

@implementation AWSTextractAdapter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             @"pages" : @"Pages",
             @"version" : @"Version",
             };
}

@end

@implementation AWSTextractAdapterOverview

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             @"adapterName" : @"AdapterName",
             @"creationTime" : @"CreationTime",
             @"featureTypes" : @"FeatureTypes",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSTextractAdapterVersionDatasetConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestS3Object" : @"ManifestS3Object",
             };
}

+ (NSValueTransformer *)manifestS3ObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractS3Object class]];
}

@end

@implementation AWSTextractAdapterVersionEvaluationMetric

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterVersion" : @"AdapterVersion",
             @"baseline" : @"Baseline",
             @"featureType" : @"FeatureType",
             };
}

+ (NSValueTransformer *)adapterVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractEvaluationMetric class]];
}

+ (NSValueTransformer *)baselineJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractEvaluationMetric class]];
}

+ (NSValueTransformer *)featureTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TABLES"] == NSOrderedSame) {
            return @(AWSTextractFeatureTypeTables);
        }
        if ([value caseInsensitiveCompare:@"FORMS"] == NSOrderedSame) {
            return @(AWSTextractFeatureTypeForms);
        }
        if ([value caseInsensitiveCompare:@"QUERIES"] == NSOrderedSame) {
            return @(AWSTextractFeatureTypeQueries);
        }
        if ([value caseInsensitiveCompare:@"SIGNATURES"] == NSOrderedSame) {
            return @(AWSTextractFeatureTypeSignatures);
        }
        if ([value caseInsensitiveCompare:@"LAYOUT"] == NSOrderedSame) {
            return @(AWSTextractFeatureTypeLayout);
        }
        return @(AWSTextractFeatureTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractFeatureTypeTables:
                return @"TABLES";
            case AWSTextractFeatureTypeForms:
                return @"FORMS";
            case AWSTextractFeatureTypeQueries:
                return @"QUERIES";
            case AWSTextractFeatureTypeSignatures:
                return @"SIGNATURES";
            case AWSTextractFeatureTypeLayout:
                return @"LAYOUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTextractAdapterVersionOverview

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             @"adapterVersion" : @"AdapterVersion",
             @"creationTime" : @"CreationTime",
             @"featureTypes" : @"FeatureTypes",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSTextractAdapterVersionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"AT_RISK"] == NSOrderedSame) {
            return @(AWSTextractAdapterVersionStatusAtRisk);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSTextractAdapterVersionStatusDeprecated);
        }
        if ([value caseInsensitiveCompare:@"CREATION_ERROR"] == NSOrderedSame) {
            return @(AWSTextractAdapterVersionStatusCreationError);
        }
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTextractAdapterVersionStatusCreationInProgress);
        }
        return @(AWSTextractAdapterVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractAdapterVersionStatusActive:
                return @"ACTIVE";
            case AWSTextractAdapterVersionStatusAtRisk:
                return @"AT_RISK";
            case AWSTextractAdapterVersionStatusDeprecated:
                return @"DEPRECATED";
            case AWSTextractAdapterVersionStatusCreationError:
                return @"CREATION_ERROR";
            case AWSTextractAdapterVersionStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTextractAdaptersConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapters" : @"Adapters",
             };
}

+ (NSValueTransformer *)adaptersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractAdapter class]];
}

@end

@implementation AWSTextractAnalyzeDocumentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adaptersConfig" : @"AdaptersConfig",
             @"document" : @"Document",
             @"featureTypes" : @"FeatureTypes",
             @"humanLoopConfig" : @"HumanLoopConfig",
             @"queriesConfig" : @"QueriesConfig",
             };
}

+ (NSValueTransformer *)adaptersConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractAdaptersConfig class]];
}

+ (NSValueTransformer *)documentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocument class]];
}

+ (NSValueTransformer *)humanLoopConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractHumanLoopConfig class]];
}

+ (NSValueTransformer *)queriesConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractQueriesConfig class]];
}

@end

@implementation AWSTextractAnalyzeDocumentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzeDocumentModelVersion" : @"AnalyzeDocumentModelVersion",
             @"blocks" : @"Blocks",
             @"documentMetadata" : @"DocumentMetadata",
             @"humanLoopActivationOutput" : @"HumanLoopActivationOutput",
             };
}

+ (NSValueTransformer *)blocksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractBlock class]];
}

+ (NSValueTransformer *)documentMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentMetadata class]];
}

+ (NSValueTransformer *)humanLoopActivationOutputJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractHumanLoopActivationOutput class]];
}

@end

@implementation AWSTextractAnalyzeExpenseRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"document" : @"Document",
             };
}

+ (NSValueTransformer *)documentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocument class]];
}

@end

@implementation AWSTextractAnalyzeExpenseResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentMetadata" : @"DocumentMetadata",
             @"expenseDocuments" : @"ExpenseDocuments",
             };
}

+ (NSValueTransformer *)documentMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentMetadata class]];
}

+ (NSValueTransformer *)expenseDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractExpenseDocument class]];
}

@end

@implementation AWSTextractAnalyzeIDDetections

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"normalizedValue" : @"NormalizedValue",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)normalizedValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractNormalizedValue class]];
}

@end

@implementation AWSTextractAnalyzeIDRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentPages" : @"DocumentPages",
             };
}

+ (NSValueTransformer *)documentPagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractDocument class]];
}

@end

@implementation AWSTextractAnalyzeIDResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzeIDModelVersion" : @"AnalyzeIDModelVersion",
             @"documentMetadata" : @"DocumentMetadata",
             @"identityDocuments" : @"IdentityDocuments",
             };
}

+ (NSValueTransformer *)documentMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentMetadata class]];
}

+ (NSValueTransformer *)identityDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractIdentityDocument class]];
}

@end

@implementation AWSTextractBlock

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockType" : @"BlockType",
             @"columnIndex" : @"ColumnIndex",
             @"columnSpan" : @"ColumnSpan",
             @"confidence" : @"Confidence",
             @"entityTypes" : @"EntityTypes",
             @"geometry" : @"Geometry",
             @"identifier" : @"Id",
             @"page" : @"Page",
             @"query" : @"Query",
             @"relationships" : @"Relationships",
             @"rowIndex" : @"RowIndex",
             @"rowSpan" : @"RowSpan",
             @"selectionStatus" : @"SelectionStatus",
             @"text" : @"Text",
             @"textType" : @"TextType",
             };
}

+ (NSValueTransformer *)blockTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"KEY_VALUE_SET"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeKeyValueSet);
        }
        if ([value caseInsensitiveCompare:@"PAGE"] == NSOrderedSame) {
            return @(AWSTextractBlockTypePage);
        }
        if ([value caseInsensitiveCompare:@"LINE"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeLine);
        }
        if ([value caseInsensitiveCompare:@"WORD"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeWord);
        }
        if ([value caseInsensitiveCompare:@"TABLE"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeTable);
        }
        if ([value caseInsensitiveCompare:@"CELL"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeCell);
        }
        if ([value caseInsensitiveCompare:@"SELECTION_ELEMENT"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeSelectionElement);
        }
        if ([value caseInsensitiveCompare:@"MERGED_CELL"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeMergedCell);
        }
        if ([value caseInsensitiveCompare:@"TITLE"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeTitle);
        }
        if ([value caseInsensitiveCompare:@"QUERY"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeQuery);
        }
        if ([value caseInsensitiveCompare:@"QUERY_RESULT"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeQueryResult);
        }
        if ([value caseInsensitiveCompare:@"SIGNATURE"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeSignature);
        }
        if ([value caseInsensitiveCompare:@"TABLE_TITLE"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeTableTitle);
        }
        if ([value caseInsensitiveCompare:@"TABLE_FOOTER"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeTableFooter);
        }
        if ([value caseInsensitiveCompare:@"LAYOUT_TEXT"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeLayoutText);
        }
        if ([value caseInsensitiveCompare:@"LAYOUT_TITLE"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeLayoutTitle);
        }
        if ([value caseInsensitiveCompare:@"LAYOUT_HEADER"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeLayoutHeader);
        }
        if ([value caseInsensitiveCompare:@"LAYOUT_FOOTER"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeLayoutFooter);
        }
        if ([value caseInsensitiveCompare:@"LAYOUT_SECTION_HEADER"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeLayoutSectionHeader);
        }
        if ([value caseInsensitiveCompare:@"LAYOUT_PAGE_NUMBER"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeLayoutPageNumber);
        }
        if ([value caseInsensitiveCompare:@"LAYOUT_LIST"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeLayoutList);
        }
        if ([value caseInsensitiveCompare:@"LAYOUT_FIGURE"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeLayoutFigure);
        }
        if ([value caseInsensitiveCompare:@"LAYOUT_TABLE"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeLayoutTable);
        }
        if ([value caseInsensitiveCompare:@"LAYOUT_KEY_VALUE"] == NSOrderedSame) {
            return @(AWSTextractBlockTypeLayoutKeyValue);
        }
        return @(AWSTextractBlockTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractBlockTypeKeyValueSet:
                return @"KEY_VALUE_SET";
            case AWSTextractBlockTypePage:
                return @"PAGE";
            case AWSTextractBlockTypeLine:
                return @"LINE";
            case AWSTextractBlockTypeWord:
                return @"WORD";
            case AWSTextractBlockTypeTable:
                return @"TABLE";
            case AWSTextractBlockTypeCell:
                return @"CELL";
            case AWSTextractBlockTypeSelectionElement:
                return @"SELECTION_ELEMENT";
            case AWSTextractBlockTypeMergedCell:
                return @"MERGED_CELL";
            case AWSTextractBlockTypeTitle:
                return @"TITLE";
            case AWSTextractBlockTypeQuery:
                return @"QUERY";
            case AWSTextractBlockTypeQueryResult:
                return @"QUERY_RESULT";
            case AWSTextractBlockTypeSignature:
                return @"SIGNATURE";
            case AWSTextractBlockTypeTableTitle:
                return @"TABLE_TITLE";
            case AWSTextractBlockTypeTableFooter:
                return @"TABLE_FOOTER";
            case AWSTextractBlockTypeLayoutText:
                return @"LAYOUT_TEXT";
            case AWSTextractBlockTypeLayoutTitle:
                return @"LAYOUT_TITLE";
            case AWSTextractBlockTypeLayoutHeader:
                return @"LAYOUT_HEADER";
            case AWSTextractBlockTypeLayoutFooter:
                return @"LAYOUT_FOOTER";
            case AWSTextractBlockTypeLayoutSectionHeader:
                return @"LAYOUT_SECTION_HEADER";
            case AWSTextractBlockTypeLayoutPageNumber:
                return @"LAYOUT_PAGE_NUMBER";
            case AWSTextractBlockTypeLayoutList:
                return @"LAYOUT_LIST";
            case AWSTextractBlockTypeLayoutFigure:
                return @"LAYOUT_FIGURE";
            case AWSTextractBlockTypeLayoutTable:
                return @"LAYOUT_TABLE";
            case AWSTextractBlockTypeLayoutKeyValue:
                return @"LAYOUT_KEY_VALUE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractGeometry class]];
}

+ (NSValueTransformer *)queryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractQuery class]];
}

+ (NSValueTransformer *)relationshipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractRelationship class]];
}

+ (NSValueTransformer *)selectionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SELECTED"] == NSOrderedSame) {
            return @(AWSTextractSelectionStatusSelected);
        }
        if ([value caseInsensitiveCompare:@"NOT_SELECTED"] == NSOrderedSame) {
            return @(AWSTextractSelectionStatusNotSelected);
        }
        return @(AWSTextractSelectionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractSelectionStatusSelected:
                return @"SELECTED";
            case AWSTextractSelectionStatusNotSelected:
                return @"NOT_SELECTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)textTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HANDWRITING"] == NSOrderedSame) {
            return @(AWSTextractTextTypeHandwriting);
        }
        if ([value caseInsensitiveCompare:@"PRINTED"] == NSOrderedSame) {
            return @(AWSTextractTextTypePrinted);
        }
        return @(AWSTextractTextTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractTextTypeHandwriting:
                return @"HANDWRITING";
            case AWSTextractTextTypePrinted:
                return @"PRINTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTextractBoundingBox

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"height" : @"Height",
             @"left" : @"Left",
             @"top" : @"Top",
             @"width" : @"Width",
             };
}

@end

@implementation AWSTextractCreateAdapterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterName" : @"AdapterName",
             @"autoUpdate" : @"AutoUpdate",
             @"clientRequestToken" : @"ClientRequestToken",
             @"detail" : @"Description",
             @"featureTypes" : @"FeatureTypes",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)autoUpdateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSTextractAutoUpdateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSTextractAutoUpdateDisabled);
        }
        return @(AWSTextractAutoUpdateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractAutoUpdateEnabled:
                return @"ENABLED";
            case AWSTextractAutoUpdateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTextractCreateAdapterResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             };
}

@end

@implementation AWSTextractCreateAdapterVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             @"clientRequestToken" : @"ClientRequestToken",
             @"datasetConfig" : @"DatasetConfig",
             @"KMSKeyId" : @"KMSKeyId",
             @"outputConfig" : @"OutputConfig",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)datasetConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractAdapterVersionDatasetConfig class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractOutputConfig class]];
}

@end

@implementation AWSTextractCreateAdapterVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             @"adapterVersion" : @"AdapterVersion",
             };
}

@end

@implementation AWSTextractDeleteAdapterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             };
}

@end

@implementation AWSTextractDeleteAdapterResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSTextractDeleteAdapterVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             @"adapterVersion" : @"AdapterVersion",
             };
}

@end

@implementation AWSTextractDeleteAdapterVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSTextractDetectDocumentTextRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"document" : @"Document",
             };
}

+ (NSValueTransformer *)documentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocument class]];
}

@end

@implementation AWSTextractDetectDocumentTextResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blocks" : @"Blocks",
             @"detectDocumentTextModelVersion" : @"DetectDocumentTextModelVersion",
             @"documentMetadata" : @"DocumentMetadata",
             };
}

+ (NSValueTransformer *)blocksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractBlock class]];
}

+ (NSValueTransformer *)documentMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentMetadata class]];
}

@end

@implementation AWSTextractDetectedSignature

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"page" : @"Page",
             };
}

@end

@implementation AWSTextractDocument

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytes" : @"Bytes",
             @"s3Object" : @"S3Object",
             };
}

+ (NSValueTransformer *)s3ObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractS3Object class]];
}

@end

@implementation AWSTextractDocumentGroup

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detectedSignatures" : @"DetectedSignatures",
             @"splitDocuments" : @"SplitDocuments",
             @"types" : @"Type",
             @"undetectedSignatures" : @"UndetectedSignatures",
             };
}

+ (NSValueTransformer *)detectedSignaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractDetectedSignature class]];
}

+ (NSValueTransformer *)splitDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractSplitDocument class]];
}

+ (NSValueTransformer *)undetectedSignaturesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractUndetectedSignature class]];
}

@end

@implementation AWSTextractDocumentLocation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Object" : @"S3Object",
             };
}

+ (NSValueTransformer *)s3ObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractS3Object class]];
}

@end

@implementation AWSTextractDocumentMetadata

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pages" : @"Pages",
             };
}

@end

@implementation AWSTextractEvaluationMetric

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

@implementation AWSTextractExpenseCurrency

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"confidence" : @"Confidence",
             };
}

@end

@implementation AWSTextractExpenseDetection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"geometry" : @"Geometry",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractGeometry class]];
}

@end

@implementation AWSTextractExpenseDocument

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blocks" : @"Blocks",
             @"expenseIndex" : @"ExpenseIndex",
             @"lineItemGroups" : @"LineItemGroups",
             @"summaryFields" : @"SummaryFields",
             };
}

+ (NSValueTransformer *)blocksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractBlock class]];
}

+ (NSValueTransformer *)lineItemGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractLineItemGroup class]];
}

+ (NSValueTransformer *)summaryFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractExpenseField class]];
}

@end

@implementation AWSTextractExpenseField

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currency" : @"Currency",
             @"groupProperties" : @"GroupProperties",
             @"labelDetection" : @"LabelDetection",
             @"pageNumber" : @"PageNumber",
             @"types" : @"Type",
             @"valueDetection" : @"ValueDetection",
             };
}

+ (NSValueTransformer *)currencyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractExpenseCurrency class]];
}

+ (NSValueTransformer *)groupPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractExpenseGroupProperty class]];
}

+ (NSValueTransformer *)labelDetectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractExpenseDetection class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractExpenseType class]];
}

+ (NSValueTransformer *)valueDetectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractExpenseDetection class]];
}

@end

@implementation AWSTextractExpenseGroupProperty

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"types" : @"Types",
             };
}

@end

@implementation AWSTextractExpenseType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"text" : @"Text",
             };
}

@end

@implementation AWSTextractExtraction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expenseDocument" : @"ExpenseDocument",
             @"identityDocument" : @"IdentityDocument",
             @"lendingDocument" : @"LendingDocument",
             };
}

+ (NSValueTransformer *)expenseDocumentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractExpenseDocument class]];
}

+ (NSValueTransformer *)identityDocumentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractIdentityDocument class]];
}

+ (NSValueTransformer *)lendingDocumentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractLendingDocument class]];
}

@end

@implementation AWSTextractGeometry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"boundingBox" : @"BoundingBox",
             @"polygon" : @"Polygon",
             };
}

+ (NSValueTransformer *)boundingBoxJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractBoundingBox class]];
}

+ (NSValueTransformer *)polygonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractPoint class]];
}

@end

@implementation AWSTextractGetAdapterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             };
}

@end

@implementation AWSTextractGetAdapterResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             @"adapterName" : @"AdapterName",
             @"autoUpdate" : @"AutoUpdate",
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"featureTypes" : @"FeatureTypes",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)autoUpdateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSTextractAutoUpdateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSTextractAutoUpdateDisabled);
        }
        return @(AWSTextractAutoUpdateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractAutoUpdateEnabled:
                return @"ENABLED";
            case AWSTextractAutoUpdateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSTextractGetAdapterVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             @"adapterVersion" : @"AdapterVersion",
             };
}

@end

@implementation AWSTextractGetAdapterVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             @"adapterVersion" : @"AdapterVersion",
             @"creationTime" : @"CreationTime",
             @"datasetConfig" : @"DatasetConfig",
             @"evaluationMetrics" : @"EvaluationMetrics",
             @"featureTypes" : @"FeatureTypes",
             @"KMSKeyId" : @"KMSKeyId",
             @"outputConfig" : @"OutputConfig",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)datasetConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractAdapterVersionDatasetConfig class]];
}

+ (NSValueTransformer *)evaluationMetricsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractAdapterVersionEvaluationMetric class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractOutputConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSTextractAdapterVersionStatusActive);
        }
        if ([value caseInsensitiveCompare:@"AT_RISK"] == NSOrderedSame) {
            return @(AWSTextractAdapterVersionStatusAtRisk);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSTextractAdapterVersionStatusDeprecated);
        }
        if ([value caseInsensitiveCompare:@"CREATION_ERROR"] == NSOrderedSame) {
            return @(AWSTextractAdapterVersionStatusCreationError);
        }
        if ([value caseInsensitiveCompare:@"CREATION_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTextractAdapterVersionStatusCreationInProgress);
        }
        return @(AWSTextractAdapterVersionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractAdapterVersionStatusActive:
                return @"ACTIVE";
            case AWSTextractAdapterVersionStatusAtRisk:
                return @"AT_RISK";
            case AWSTextractAdapterVersionStatusDeprecated:
                return @"DEPRECATED";
            case AWSTextractAdapterVersionStatusCreationError:
                return @"CREATION_ERROR";
            case AWSTextractAdapterVersionStatusCreationInProgress:
                return @"CREATION_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTextractGetDocumentAnalysisRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSTextractGetDocumentAnalysisResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzeDocumentModelVersion" : @"AnalyzeDocumentModelVersion",
             @"blocks" : @"Blocks",
             @"documentMetadata" : @"DocumentMetadata",
             @"jobStatus" : @"JobStatus",
             @"nextToken" : @"NextToken",
             @"statusMessage" : @"StatusMessage",
             @"warnings" : @"Warnings",
             };
}

+ (NSValueTransformer *)blocksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractBlock class]];
}

+ (NSValueTransformer *)documentMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentMetadata class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTextractJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSTextractJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTextractJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_SUCCESS"] == NSOrderedSame) {
            return @(AWSTextractJobStatusPartialSuccess);
        }
        return @(AWSTextractJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTextractJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSTextractJobStatusFailed:
                return @"FAILED";
            case AWSTextractJobStatusPartialSuccess:
                return @"PARTIAL_SUCCESS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)warningsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractWarning class]];
}

@end

@implementation AWSTextractGetDocumentTextDetectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSTextractGetDocumentTextDetectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blocks" : @"Blocks",
             @"detectDocumentTextModelVersion" : @"DetectDocumentTextModelVersion",
             @"documentMetadata" : @"DocumentMetadata",
             @"jobStatus" : @"JobStatus",
             @"nextToken" : @"NextToken",
             @"statusMessage" : @"StatusMessage",
             @"warnings" : @"Warnings",
             };
}

+ (NSValueTransformer *)blocksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractBlock class]];
}

+ (NSValueTransformer *)documentMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentMetadata class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTextractJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSTextractJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTextractJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_SUCCESS"] == NSOrderedSame) {
            return @(AWSTextractJobStatusPartialSuccess);
        }
        return @(AWSTextractJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTextractJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSTextractJobStatusFailed:
                return @"FAILED";
            case AWSTextractJobStatusPartialSuccess:
                return @"PARTIAL_SUCCESS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)warningsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractWarning class]];
}

@end

@implementation AWSTextractGetExpenseAnalysisRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSTextractGetExpenseAnalysisResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzeExpenseModelVersion" : @"AnalyzeExpenseModelVersion",
             @"documentMetadata" : @"DocumentMetadata",
             @"expenseDocuments" : @"ExpenseDocuments",
             @"jobStatus" : @"JobStatus",
             @"nextToken" : @"NextToken",
             @"statusMessage" : @"StatusMessage",
             @"warnings" : @"Warnings",
             };
}

+ (NSValueTransformer *)documentMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentMetadata class]];
}

+ (NSValueTransformer *)expenseDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractExpenseDocument class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTextractJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSTextractJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTextractJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_SUCCESS"] == NSOrderedSame) {
            return @(AWSTextractJobStatusPartialSuccess);
        }
        return @(AWSTextractJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTextractJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSTextractJobStatusFailed:
                return @"FAILED";
            case AWSTextractJobStatusPartialSuccess:
                return @"PARTIAL_SUCCESS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)warningsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractWarning class]];
}

@end

@implementation AWSTextractGetLendingAnalysisRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSTextractGetLendingAnalysisResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzeLendingModelVersion" : @"AnalyzeLendingModelVersion",
             @"documentMetadata" : @"DocumentMetadata",
             @"jobStatus" : @"JobStatus",
             @"nextToken" : @"NextToken",
             @"results" : @"Results",
             @"statusMessage" : @"StatusMessage",
             @"warnings" : @"Warnings",
             };
}

+ (NSValueTransformer *)documentMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentMetadata class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTextractJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSTextractJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTextractJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_SUCCESS"] == NSOrderedSame) {
            return @(AWSTextractJobStatusPartialSuccess);
        }
        return @(AWSTextractJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTextractJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSTextractJobStatusFailed:
                return @"FAILED";
            case AWSTextractJobStatusPartialSuccess:
                return @"PARTIAL_SUCCESS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractLendingResult class]];
}

+ (NSValueTransformer *)warningsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractWarning class]];
}

@end

@implementation AWSTextractGetLendingAnalysisSummaryRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSTextractGetLendingAnalysisSummaryResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyzeLendingModelVersion" : @"AnalyzeLendingModelVersion",
             @"documentMetadata" : @"DocumentMetadata",
             @"jobStatus" : @"JobStatus",
             @"statusMessage" : @"StatusMessage",
             @"summary" : @"Summary",
             @"warnings" : @"Warnings",
             };
}

+ (NSValueTransformer *)documentMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentMetadata class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSTextractJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSTextractJobStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSTextractJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_SUCCESS"] == NSOrderedSame) {
            return @(AWSTextractJobStatusPartialSuccess);
        }
        return @(AWSTextractJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSTextractJobStatusSucceeded:
                return @"SUCCEEDED";
            case AWSTextractJobStatusFailed:
                return @"FAILED";
            case AWSTextractJobStatusPartialSuccess:
                return @"PARTIAL_SUCCESS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)summaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractLendingSummary class]];
}

+ (NSValueTransformer *)warningsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractWarning class]];
}

@end

@implementation AWSTextractHumanLoopActivationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"humanLoopActivationConditionsEvaluationResults" : @"HumanLoopActivationConditionsEvaluationResults",
             @"humanLoopActivationReasons" : @"HumanLoopActivationReasons",
             @"humanLoopArn" : @"HumanLoopArn",
             };
}

@end

@implementation AWSTextractHumanLoopConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAttributes" : @"DataAttributes",
             @"flowDefinitionArn" : @"FlowDefinitionArn",
             @"humanLoopName" : @"HumanLoopName",
             };
}

+ (NSValueTransformer *)dataAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractHumanLoopDataAttributes class]];
}

@end

@implementation AWSTextractHumanLoopDataAttributes

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"contentClassifiers" : @"ContentClassifiers",
             };
}

@end

@implementation AWSTextractIdentityDocument

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blocks" : @"Blocks",
             @"documentIndex" : @"DocumentIndex",
             @"identityDocumentFields" : @"IdentityDocumentFields",
             };
}

+ (NSValueTransformer *)blocksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractBlock class]];
}

+ (NSValueTransformer *)identityDocumentFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractIdentityDocumentField class]];
}

@end

@implementation AWSTextractIdentityDocumentField

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"valueDetection" : @"ValueDetection",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractAnalyzeIDDetections class]];
}

+ (NSValueTransformer *)valueDetectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractAnalyzeIDDetections class]];
}

@end

@implementation AWSTextractLendingDetection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"geometry" : @"Geometry",
             @"selectionStatus" : @"SelectionStatus",
             @"text" : @"Text",
             };
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractGeometry class]];
}

+ (NSValueTransformer *)selectionStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SELECTED"] == NSOrderedSame) {
            return @(AWSTextractSelectionStatusSelected);
        }
        if ([value caseInsensitiveCompare:@"NOT_SELECTED"] == NSOrderedSame) {
            return @(AWSTextractSelectionStatusNotSelected);
        }
        return @(AWSTextractSelectionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractSelectionStatusSelected:
                return @"SELECTED";
            case AWSTextractSelectionStatusNotSelected:
                return @"NOT_SELECTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTextractLendingDocument

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lendingFields" : @"LendingFields",
             @"signatureDetections" : @"SignatureDetections",
             };
}

+ (NSValueTransformer *)lendingFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractLendingField class]];
}

+ (NSValueTransformer *)signatureDetectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractSignatureDetection class]];
}

@end

@implementation AWSTextractLendingField

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyDetection" : @"KeyDetection",
             @"types" : @"Type",
             @"valueDetections" : @"ValueDetections",
             };
}

+ (NSValueTransformer *)keyDetectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractLendingDetection class]];
}

+ (NSValueTransformer *)valueDetectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractLendingDetection class]];
}

@end

@implementation AWSTextractLendingResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"extractions" : @"Extractions",
             @"page" : @"Page",
             @"pageClassification" : @"PageClassification",
             };
}

+ (NSValueTransformer *)extractionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractExtraction class]];
}

+ (NSValueTransformer *)pageClassificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractPageClassification class]];
}

@end

@implementation AWSTextractLendingSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"documentGroups" : @"DocumentGroups",
             @"undetectedDocumentTypes" : @"UndetectedDocumentTypes",
             };
}

+ (NSValueTransformer *)documentGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractDocumentGroup class]];
}

@end

@implementation AWSTextractLineItemFields

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lineItemExpenseFields" : @"LineItemExpenseFields",
             };
}

+ (NSValueTransformer *)lineItemExpenseFieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractExpenseField class]];
}

@end

@implementation AWSTextractLineItemGroup

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lineItemGroupIndex" : @"LineItemGroupIndex",
             @"lineItems" : @"LineItems",
             };
}

+ (NSValueTransformer *)lineItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractLineItemFields class]];
}

@end

@implementation AWSTextractListAdapterVersionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             @"afterCreationTime" : @"AfterCreationTime",
             @"beforeCreationTime" : @"BeforeCreationTime",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)afterCreationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)beforeCreationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSTextractListAdapterVersionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterVersions" : @"AdapterVersions",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)adapterVersionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractAdapterVersionOverview class]];
}

@end

@implementation AWSTextractListAdaptersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"afterCreationTime" : @"AfterCreationTime",
             @"beforeCreationTime" : @"BeforeCreationTime",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)afterCreationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)beforeCreationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSTextractListAdaptersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapters" : @"Adapters",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)adaptersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractAdapterOverview class]];
}

@end

@implementation AWSTextractListTagsForResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSTextractListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSTextractNormalizedValue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"value" : @"Value",
             @"valueType" : @"ValueType",
             };
}

+ (NSValueTransformer *)valueTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DATE"] == NSOrderedSame) {
            return @(AWSTextractValueTypeDate);
        }
        return @(AWSTextractValueTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractValueTypeDate:
                return @"DATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTextractNotificationChannel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"SNSTopicArn" : @"SNSTopicArn",
             };
}

@end

@implementation AWSTextractOutputConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3Prefix" : @"S3Prefix",
             };
}

@end

@implementation AWSTextractPageClassification

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageNumber" : @"PageNumber",
             @"pageType" : @"PageType",
             };
}

+ (NSValueTransformer *)pageNumberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractPrediction class]];
}

+ (NSValueTransformer *)pageTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractPrediction class]];
}

@end

@implementation AWSTextractPoint

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"X" : @"X",
             @"Y" : @"Y",
             };
}

@end

@implementation AWSTextractPrediction

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"value" : @"Value",
             };
}

@end

@implementation AWSTextractQueriesConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"queries" : @"Queries",
             };
}

+ (NSValueTransformer *)queriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSTextractQuery class]];
}

@end

@implementation AWSTextractQuery

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alias" : @"Alias",
             @"pages" : @"Pages",
             @"text" : @"Text",
             };
}

@end

@implementation AWSTextractRelationship

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ids" : @"Ids",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VALUE"] == NSOrderedSame) {
            return @(AWSTextractRelationshipTypeValue);
        }
        if ([value caseInsensitiveCompare:@"CHILD"] == NSOrderedSame) {
            return @(AWSTextractRelationshipTypeChild);
        }
        if ([value caseInsensitiveCompare:@"COMPLEX_FEATURES"] == NSOrderedSame) {
            return @(AWSTextractRelationshipTypeComplexFeatures);
        }
        if ([value caseInsensitiveCompare:@"MERGED_CELL"] == NSOrderedSame) {
            return @(AWSTextractRelationshipTypeMergedCell);
        }
        if ([value caseInsensitiveCompare:@"TITLE"] == NSOrderedSame) {
            return @(AWSTextractRelationshipTypeTitle);
        }
        if ([value caseInsensitiveCompare:@"ANSWER"] == NSOrderedSame) {
            return @(AWSTextractRelationshipTypeAnswer);
        }
        if ([value caseInsensitiveCompare:@"TABLE"] == NSOrderedSame) {
            return @(AWSTextractRelationshipTypeTable);
        }
        if ([value caseInsensitiveCompare:@"TABLE_TITLE"] == NSOrderedSame) {
            return @(AWSTextractRelationshipTypeTableTitle);
        }
        if ([value caseInsensitiveCompare:@"TABLE_FOOTER"] == NSOrderedSame) {
            return @(AWSTextractRelationshipTypeTableFooter);
        }
        return @(AWSTextractRelationshipTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractRelationshipTypeValue:
                return @"VALUE";
            case AWSTextractRelationshipTypeChild:
                return @"CHILD";
            case AWSTextractRelationshipTypeComplexFeatures:
                return @"COMPLEX_FEATURES";
            case AWSTextractRelationshipTypeMergedCell:
                return @"MERGED_CELL";
            case AWSTextractRelationshipTypeTitle:
                return @"TITLE";
            case AWSTextractRelationshipTypeAnswer:
                return @"ANSWER";
            case AWSTextractRelationshipTypeTable:
                return @"TABLE";
            case AWSTextractRelationshipTypeTableTitle:
                return @"TABLE_TITLE";
            case AWSTextractRelationshipTypeTableFooter:
                return @"TABLE_FOOTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTextractS3Object

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

@end

@implementation AWSTextractSignatureDetection

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confidence" : @"Confidence",
             @"geometry" : @"Geometry",
             };
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractGeometry class]];
}

@end

@implementation AWSTextractSplitDocument

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"index" : @"Index",
             @"pages" : @"Pages",
             };
}

@end

@implementation AWSTextractStartDocumentAnalysisRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adaptersConfig" : @"AdaptersConfig",
             @"clientRequestToken" : @"ClientRequestToken",
             @"documentLocation" : @"DocumentLocation",
             @"featureTypes" : @"FeatureTypes",
             @"jobTag" : @"JobTag",
             @"KMSKeyId" : @"KMSKeyId",
             @"notificationChannel" : @"NotificationChannel",
             @"outputConfig" : @"OutputConfig",
             @"queriesConfig" : @"QueriesConfig",
             };
}

+ (NSValueTransformer *)adaptersConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractAdaptersConfig class]];
}

+ (NSValueTransformer *)documentLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentLocation class]];
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractNotificationChannel class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractOutputConfig class]];
}

+ (NSValueTransformer *)queriesConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractQueriesConfig class]];
}

@end

@implementation AWSTextractStartDocumentAnalysisResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSTextractStartDocumentTextDetectionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"documentLocation" : @"DocumentLocation",
             @"jobTag" : @"JobTag",
             @"KMSKeyId" : @"KMSKeyId",
             @"notificationChannel" : @"NotificationChannel",
             @"outputConfig" : @"OutputConfig",
             };
}

+ (NSValueTransformer *)documentLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentLocation class]];
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractNotificationChannel class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractOutputConfig class]];
}

@end

@implementation AWSTextractStartDocumentTextDetectionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSTextractStartExpenseAnalysisRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"documentLocation" : @"DocumentLocation",
             @"jobTag" : @"JobTag",
             @"KMSKeyId" : @"KMSKeyId",
             @"notificationChannel" : @"NotificationChannel",
             @"outputConfig" : @"OutputConfig",
             };
}

+ (NSValueTransformer *)documentLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentLocation class]];
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractNotificationChannel class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractOutputConfig class]];
}

@end

@implementation AWSTextractStartExpenseAnalysisResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSTextractStartLendingAnalysisRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"documentLocation" : @"DocumentLocation",
             @"jobTag" : @"JobTag",
             @"KMSKeyId" : @"KMSKeyId",
             @"notificationChannel" : @"NotificationChannel",
             @"outputConfig" : @"OutputConfig",
             };
}

+ (NSValueTransformer *)documentLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentLocation class]];
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractNotificationChannel class]];
}

+ (NSValueTransformer *)outputConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractOutputConfig class]];
}

@end

@implementation AWSTextractStartLendingAnalysisResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSTextractTagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSTextractTagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSTextractUndetectedSignature

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"page" : @"Page",
             };
}

@end

@implementation AWSTextractUntagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSTextractUntagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSTextractUpdateAdapterRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             @"adapterName" : @"AdapterName",
             @"autoUpdate" : @"AutoUpdate",
             @"detail" : @"Description",
             };
}

+ (NSValueTransformer *)autoUpdateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSTextractAutoUpdateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSTextractAutoUpdateDisabled);
        }
        return @(AWSTextractAutoUpdateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractAutoUpdateEnabled:
                return @"ENABLED";
            case AWSTextractAutoUpdateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTextractUpdateAdapterResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adapterId" : @"AdapterId",
             @"adapterName" : @"AdapterName",
             @"autoUpdate" : @"AutoUpdate",
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"featureTypes" : @"FeatureTypes",
             };
}

+ (NSValueTransformer *)autoUpdateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSTextractAutoUpdateEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSTextractAutoUpdateDisabled);
        }
        return @(AWSTextractAutoUpdateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractAutoUpdateEnabled:
                return @"ENABLED";
            case AWSTextractAutoUpdateDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSTextractWarning

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"pages" : @"Pages",
             };
}

@end
