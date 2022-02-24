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

#import "AWSTextractModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSTextractErrorDomain = @"com.amazonaws.AWSTextractErrorDomain";

@implementation AWSTextractAnalyzeDocumentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"document" : @"Document",
             @"featureTypes" : @"FeatureTypes",
             @"humanLoopConfig" : @"HumanLoopConfig",
             };
}

+ (NSValueTransformer *)documentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocument class]];
}

+ (NSValueTransformer *)humanLoopConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractHumanLoopConfig class]];
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)geometryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractGeometry class]];
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
             @"expenseIndex" : @"ExpenseIndex",
             @"lineItemGroups" : @"LineItemGroups",
             @"summaryFields" : @"SummaryFields",
             };
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
             @"labelDetection" : @"LabelDetection",
             @"pageNumber" : @"PageNumber",
             @"types" : @"Type",
             @"valueDetection" : @"ValueDetection",
             };
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
             @"documentIndex" : @"DocumentIndex",
             @"identityDocumentFields" : @"IdentityDocumentFields",
             };
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

@implementation AWSTextractStartDocumentAnalysisRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"documentLocation" : @"DocumentLocation",
             @"featureTypes" : @"FeatureTypes",
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
