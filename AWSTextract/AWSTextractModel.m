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

#import "AWSTextractModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSTextractErrorDomain = @"com.amazonaws.AWSTextractErrorDomain";

@implementation AWSTextractAnalyzeDocumentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"document" : @"Document",
             @"featureTypes" : @"FeatureTypes",
             };
}

+ (NSValueTransformer *)documentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocument class]];
}

@end

@implementation AWSTextractAnalyzeDocumentResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blocks" : @"Blocks",
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

@implementation AWSTextractBlock

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

@end

@implementation AWSTextractBoundingBox

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blocks" : @"Blocks",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pages" : @"Pages",
             };
}

@end

@implementation AWSTextractGeometry

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSTextractGetDocumentAnalysisResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSTextractGetDocumentTextDetectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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

@implementation AWSTextractNotificationChannel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"SNSTopicArn" : @"SNSTopicArn",
             };
}

@end

@implementation AWSTextractPoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"X" : @"X",
             @"Y" : @"Y",
             };
}

@end

@implementation AWSTextractRelationship

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
        return @(AWSTextractRelationshipTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSTextractRelationshipTypeValue:
                return @"VALUE";
            case AWSTextractRelationshipTypeChild:
                return @"CHILD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSTextractS3Object

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

@end

@implementation AWSTextractStartDocumentAnalysisRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"documentLocation" : @"DocumentLocation",
             @"featureTypes" : @"FeatureTypes",
             @"jobTag" : @"JobTag",
             @"notificationChannel" : @"NotificationChannel",
             };
}

+ (NSValueTransformer *)documentLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentLocation class]];
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractNotificationChannel class]];
}

@end

@implementation AWSTextractStartDocumentAnalysisResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSTextractStartDocumentTextDetectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"documentLocation" : @"DocumentLocation",
             @"jobTag" : @"JobTag",
             @"notificationChannel" : @"NotificationChannel",
             };
}

+ (NSValueTransformer *)documentLocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractDocumentLocation class]];
}

+ (NSValueTransformer *)notificationChannelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSTextractNotificationChannel class]];
}

@end

@implementation AWSTextractStartDocumentTextDetectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSTextractWarning

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"pages" : @"Pages",
             };
}

@end
