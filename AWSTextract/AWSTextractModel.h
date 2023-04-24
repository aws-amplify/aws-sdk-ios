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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSTextractErrorDomain;

typedef NS_ENUM(NSInteger, AWSTextractErrorType) {
    AWSTextractErrorUnknown,
    AWSTextractErrorAccessDenied,
    AWSTextractErrorBadDocument,
    AWSTextractErrorDocumentTooLarge,
    AWSTextractErrorHumanLoopQuotaExceeded,
    AWSTextractErrorIdempotentParameterMismatch,
    AWSTextractErrorInternalServer,
    AWSTextractErrorInvalidJobId,
    AWSTextractErrorInvalidKMSKey,
    AWSTextractErrorInvalidParameter,
    AWSTextractErrorInvalidS3Object,
    AWSTextractErrorLimitExceeded,
    AWSTextractErrorProvisionedThroughputExceeded,
    AWSTextractErrorThrottling,
    AWSTextractErrorUnsupportedDocument,
};

typedef NS_ENUM(NSInteger, AWSTextractBlockType) {
    AWSTextractBlockTypeUnknown,
    AWSTextractBlockTypeKeyValueSet,
    AWSTextractBlockTypePage,
    AWSTextractBlockTypeLine,
    AWSTextractBlockTypeWord,
    AWSTextractBlockTypeTable,
    AWSTextractBlockTypeCell,
    AWSTextractBlockTypeSelectionElement,
    AWSTextractBlockTypeMergedCell,
    AWSTextractBlockTypeTitle,
    AWSTextractBlockTypeQuery,
    AWSTextractBlockTypeQueryResult,
    AWSTextractBlockTypeSignature,
    AWSTextractBlockTypeTableTitle,
    AWSTextractBlockTypeTableFooter,
};

typedef NS_ENUM(NSInteger, AWSTextractContentClassifier) {
    AWSTextractContentClassifierUnknown,
    AWSTextractContentClassifierFreeOfPersonallyIdentifiableInformation,
    AWSTextractContentClassifierFreeOfAdultContent,
};

typedef NS_ENUM(NSInteger, AWSTextractEntityType) {
    AWSTextractEntityTypeUnknown,
    AWSTextractEntityTypeKey,
    AWSTextractEntityTypeValue,
    AWSTextractEntityTypeColumnHeader,
    AWSTextractEntityTypeTableTitle,
    AWSTextractEntityTypeTableFooter,
    AWSTextractEntityTypeTableSectionTitle,
    AWSTextractEntityTypeTableSummary,
    AWSTextractEntityTypeStructuredTable,
    AWSTextractEntityTypeSemiStructuredTable,
};

typedef NS_ENUM(NSInteger, AWSTextractFeatureType) {
    AWSTextractFeatureTypeUnknown,
    AWSTextractFeatureTypeTables,
    AWSTextractFeatureTypeForms,
    AWSTextractFeatureTypeQueries,
    AWSTextractFeatureTypeSignatures,
};

typedef NS_ENUM(NSInteger, AWSTextractJobStatus) {
    AWSTextractJobStatusUnknown,
    AWSTextractJobStatusInProgress,
    AWSTextractJobStatusSucceeded,
    AWSTextractJobStatusFailed,
    AWSTextractJobStatusPartialSuccess,
};

typedef NS_ENUM(NSInteger, AWSTextractRelationshipType) {
    AWSTextractRelationshipTypeUnknown,
    AWSTextractRelationshipTypeValue,
    AWSTextractRelationshipTypeChild,
    AWSTextractRelationshipTypeComplexFeatures,
    AWSTextractRelationshipTypeMergedCell,
    AWSTextractRelationshipTypeTitle,
    AWSTextractRelationshipTypeAnswer,
    AWSTextractRelationshipTypeTable,
    AWSTextractRelationshipTypeTableTitle,
    AWSTextractRelationshipTypeTableFooter,
};

typedef NS_ENUM(NSInteger, AWSTextractSelectionStatus) {
    AWSTextractSelectionStatusUnknown,
    AWSTextractSelectionStatusSelected,
    AWSTextractSelectionStatusNotSelected,
};

typedef NS_ENUM(NSInteger, AWSTextractTextType) {
    AWSTextractTextTypeUnknown,
    AWSTextractTextTypeHandwriting,
    AWSTextractTextTypePrinted,
};

typedef NS_ENUM(NSInteger, AWSTextractValueType) {
    AWSTextractValueTypeUnknown,
    AWSTextractValueTypeDate,
};

@class AWSTextractAnalyzeDocumentRequest;
@class AWSTextractAnalyzeDocumentResponse;
@class AWSTextractAnalyzeExpenseRequest;
@class AWSTextractAnalyzeExpenseResponse;
@class AWSTextractAnalyzeIDDetections;
@class AWSTextractAnalyzeIDRequest;
@class AWSTextractAnalyzeIDResponse;
@class AWSTextractBlock;
@class AWSTextractBoundingBox;
@class AWSTextractDetectDocumentTextRequest;
@class AWSTextractDetectDocumentTextResponse;
@class AWSTextractDetectedSignature;
@class AWSTextractDocument;
@class AWSTextractDocumentGroup;
@class AWSTextractDocumentLocation;
@class AWSTextractDocumentMetadata;
@class AWSTextractExpenseCurrency;
@class AWSTextractExpenseDetection;
@class AWSTextractExpenseDocument;
@class AWSTextractExpenseField;
@class AWSTextractExpenseGroupProperty;
@class AWSTextractExpenseType;
@class AWSTextractExtraction;
@class AWSTextractGeometry;
@class AWSTextractGetDocumentAnalysisRequest;
@class AWSTextractGetDocumentAnalysisResponse;
@class AWSTextractGetDocumentTextDetectionRequest;
@class AWSTextractGetDocumentTextDetectionResponse;
@class AWSTextractGetExpenseAnalysisRequest;
@class AWSTextractGetExpenseAnalysisResponse;
@class AWSTextractGetLendingAnalysisRequest;
@class AWSTextractGetLendingAnalysisResponse;
@class AWSTextractGetLendingAnalysisSummaryRequest;
@class AWSTextractGetLendingAnalysisSummaryResponse;
@class AWSTextractHumanLoopActivationOutput;
@class AWSTextractHumanLoopConfig;
@class AWSTextractHumanLoopDataAttributes;
@class AWSTextractIdentityDocument;
@class AWSTextractIdentityDocumentField;
@class AWSTextractLendingDetection;
@class AWSTextractLendingDocument;
@class AWSTextractLendingField;
@class AWSTextractLendingResult;
@class AWSTextractLendingSummary;
@class AWSTextractLineItemFields;
@class AWSTextractLineItemGroup;
@class AWSTextractNormalizedValue;
@class AWSTextractNotificationChannel;
@class AWSTextractOutputConfig;
@class AWSTextractPageClassification;
@class AWSTextractPoint;
@class AWSTextractPrediction;
@class AWSTextractQueriesConfig;
@class AWSTextractQuery;
@class AWSTextractRelationship;
@class AWSTextractS3Object;
@class AWSTextractSignatureDetection;
@class AWSTextractSplitDocument;
@class AWSTextractStartDocumentAnalysisRequest;
@class AWSTextractStartDocumentAnalysisResponse;
@class AWSTextractStartDocumentTextDetectionRequest;
@class AWSTextractStartDocumentTextDetectionResponse;
@class AWSTextractStartExpenseAnalysisRequest;
@class AWSTextractStartExpenseAnalysisResponse;
@class AWSTextractStartLendingAnalysisRequest;
@class AWSTextractStartLendingAnalysisResponse;
@class AWSTextractUndetectedSignature;
@class AWSTextractWarning;

/**
 
 */
@interface AWSTextractAnalyzeDocumentRequest : AWSRequest


/**
 <p>The input document as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI to call Amazon Textract operations, you can't pass image bytes. The document must be an image in JPEG, PNG, PDF, or TIFF format.</p><p>If you're using an AWS SDK to call Amazon Textract, you might not need to base64-encode image bytes that are passed using the <code>Bytes</code> field. </p>
 */
@property (nonatomic, strong) AWSTextractDocument * _Nullable document;

/**
 <p>A list of the types of analysis to perform. Add TABLES to the list to return information about the tables that are detected in the input document. Add FORMS to return detected form data. Add SIGNATURES to return the locations of detected signatures. To perform both forms and table analysis, add TABLES and FORMS to <code>FeatureTypes</code>. To detect signatures within form data and table data, add SIGNATURES to either TABLES or FORMS. All lines and words detected in the document are included in the response (including text that isn't related to the value of <code>FeatureTypes</code>). </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable featureTypes;

/**
 <p>Sets the configuration for the human in the loop workflow for analyzing documents.</p>
 */
@property (nonatomic, strong) AWSTextractHumanLoopConfig * _Nullable humanLoopConfig;

/**
 <p>Contains Queries and the alias for those Queries, as determined by the input. </p>
 */
@property (nonatomic, strong) AWSTextractQueriesConfig * _Nullable queriesConfig;

@end

/**
 
 */
@interface AWSTextractAnalyzeDocumentResponse : AWSModel


/**
 <p>The version of the model used to analyze the document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzeDocumentModelVersion;

/**
 <p>The items that are detected and analyzed by <code>AnalyzeDocument</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractBlock *> * _Nullable blocks;

/**
 <p>Metadata about the analyzed document. An example is the number of pages.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentMetadata * _Nullable documentMetadata;

/**
 <p>Shows the results of the human in the loop evaluation.</p>
 */
@property (nonatomic, strong) AWSTextractHumanLoopActivationOutput * _Nullable humanLoopActivationOutput;

@end

/**
 
 */
@interface AWSTextractAnalyzeExpenseRequest : AWSRequest


/**
 <p>The input document, either as bytes or as an S3 object.</p><p>You pass image bytes to an Amazon Textract API operation by using the <code>Bytes</code> property. For example, you would use the <code>Bytes</code> property to pass a document loaded from a local file system. Image bytes passed by using the <code>Bytes</code> property must be base64 encoded. Your code might not need to encode document file bytes if you're using an AWS SDK to call Amazon Textract API operations. </p><p>You pass images stored in an S3 bucket to an Amazon Textract API operation by using the <code>S3Object</code> property. Documents stored in an S3 bucket don't need to be base64 encoded.</p><p>The AWS Region for the S3 bucket that contains the S3 object must match the AWS Region that you use for Amazon Textract operations.</p><p>If you use the AWS CLI to call Amazon Textract operations, passing image bytes using the Bytes property isn't supported. You must first upload the document to an Amazon S3 bucket, and then call the operation using the S3Object property.</p><p>For Amazon Textract to process an S3 object, the user must have permission to access the S3 object. </p>
 */
@property (nonatomic, strong) AWSTextractDocument * _Nullable document;

@end

/**
 
 */
@interface AWSTextractAnalyzeExpenseResponse : AWSModel


/**
 <p>Information about the input document.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentMetadata * _Nullable documentMetadata;

/**
 <p>The expenses detected by Amazon Textract.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractExpenseDocument *> * _Nullable expenseDocuments;

@end

/**
 <p>Used to contain the information detected by an AnalyzeID operation.</p>
 Required parameters: [Text]
 */
@interface AWSTextractAnalyzeIDDetections : AWSModel


/**
 <p>The confidence score of the detected text.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Only returned for dates, returns the type of value detected and the date written in a more machine readable way.</p>
 */
@property (nonatomic, strong) AWSTextractNormalizedValue * _Nullable normalizedValue;

/**
 <p>Text of either the normalized field or value associated with it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSTextractAnalyzeIDRequest : AWSRequest


/**
 <p>The document being passed to AnalyzeID.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractDocument *> * _Nullable documentPages;

@end

/**
 
 */
@interface AWSTextractAnalyzeIDResponse : AWSModel


/**
 <p>The version of the AnalyzeIdentity API being used to process documents.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzeIDModelVersion;

/**
 <p>Information about the input document.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentMetadata * _Nullable documentMetadata;

/**
 <p>The list of documents processed by AnalyzeID. Includes a number denoting their place in the list and the response structure for the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractIdentityDocument *> * _Nullable identityDocuments;

@end

/**
 <p>A <code>Block</code> represents items that are recognized in a document within a group of pixels close to each other. The information returned in a <code>Block</code> object depends on the type of operation. In text detection for documents (for example <a>DetectDocumentText</a>), you get information about the detected words and lines of text. In text analysis (for example <a>AnalyzeDocument</a>), you can also get information about the fields, tables, and selection elements that are detected in the document.</p><p>An array of <code>Block</code> objects is returned by both synchronous and asynchronous operations. In synchronous operations, such as <a>DetectDocumentText</a>, the array of <code>Block</code> objects is the entire set of results. In asynchronous operations, such as <a>GetDocumentAnalysis</a>, the array is returned over one or more responses.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works.html">How Amazon Textract Works</a>.</p>
 */
@interface AWSTextractBlock : AWSModel


/**
 <p>The type of text item that's recognized. In operations for text detection, the following types are returned:</p><ul><li><p><i>PAGE</i> - Contains a list of the LINE <code>Block</code> objects that are detected on a document page.</p></li><li><p><i>WORD</i> - A word detected on a document page. A word is one or more ISO basic Latin script characters that aren't separated by spaces.</p></li><li><p><i>LINE</i> - A string of tab-delimited, contiguous words that are detected on a document page.</p></li></ul><p>In text analysis operations, the following types are returned:</p><ul><li><p><i>PAGE</i> - Contains a list of child <code>Block</code> objects that are detected on a document page.</p></li><li><p><i>KEY_VALUE_SET</i> - Stores the KEY and VALUE <code>Block</code> objects for linked text that's detected on a document page. Use the <code>EntityType</code> field to determine if a KEY_VALUE_SET object is a KEY <code>Block</code> object or a VALUE <code>Block</code> object. </p></li><li><p><i>WORD</i> - A word that's detected on a document page. A word is one or more ISO basic Latin script characters that aren't separated by spaces.</p></li><li><p><i>LINE</i> - A string of tab-delimited, contiguous words that are detected on a document page.</p></li><li><p><i>TABLE</i> - A table that's detected on a document page. A table is grid-based information with two or more rows or columns, with a cell span of one row and one column each. </p></li><li><p><i>TABLE_TITLE</i> - The title of a table. A title is typically a line of text above or below a table, or embedded as the first row of a table. </p></li><li><p><i>TABLE_FOOTER</i> - The footer associated with a table. A footer is typically a line or lines of text below a table or embedded as the last row of a table. </p></li><li><p><i>CELL</i> - A cell within a detected table. The cell is the parent of the block that contains the text in the cell.</p></li><li><p><i>MERGED_CELL</i> - A cell in a table whose content spans more than one row or column. The <code>Relationships</code> array for this cell contain data from individual cells.</p></li><li><p><i>SELECTION_ELEMENT</i> - A selection element such as an option button (radio button) or a check box that's detected on a document page. Use the value of <code>SelectionStatus</code> to determine the status of the selection element.</p></li><li><p><i>SIGNATURE</i> - The location and confidene score of a signature detected on a document page. Can be returned as part of a Key-Value pair or a detected cell.</p></li><li><p><i>QUERY</i> - A question asked during the call of AnalyzeDocument. Contains an alias and an ID that attaches it to its answer.</p></li><li><p><i>QUERY_RESULT</i> - A response to a question asked during the call of analyze document. Comes with an alias and ID for ease of locating in a response. Also contains location and confidence score.</p></li></ul>
 */
@property (nonatomic, assign) AWSTextractBlockType blockType;

/**
 <p>The column in which a table cell appears. The first column position is 1. <code>ColumnIndex</code> isn't returned by <code>DetectDocumentText</code> and <code>GetDocumentTextDetection</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable columnIndex;

/**
 <p>The number of columns that a table cell spans. <code>ColumnSpan</code> isn't returned by <code>DetectDocumentText</code> and <code>GetDocumentTextDetection</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable columnSpan;

/**
 <p>The confidence score that Amazon Textract has in the accuracy of the recognized text and the accuracy of the geometry points around the recognized text.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The type of entity. </p><p>The following entity types can be returned by FORMS analysis:</p><ul><li><p><i>KEY</i> - An identifier for a field on the document.</p></li><li><p><i>VALUE</i> - The field text.</p></li></ul><p>The following entity types can be returned by TABLES analysis:</p><ul><li><p><i>COLUMN_HEADER</i> - Identifies a cell that is a header of a column. </p></li><li><p><i>TABLE_TITLE</i> - Identifies a cell that is a title within the table. </p></li><li><p><i>TABLE_SECTION_TITLE</i> - Identifies a cell that is a title of a section within a table. A section title is a cell that typically spans an entire row above a section. </p></li><li><p><i>TABLE_FOOTER</i> - Identifies a cell that is a footer of a table. </p></li><li><p><i>TABLE_SUMMARY</i> - Identifies a summary cell of a table. A summary cell can be a row of a table or an additional, smaller table that contains summary information for another table. </p></li><li><p><i>STRUCTURED_TABLE </i> - Identifies a table with column headers where the content of each row corresponds to the headers. </p></li><li><p><i>SEMI_STRUCTURED_TABLE</i> - Identifies a non-structured table. </p></li></ul><p><code>EntityTypes</code> isn't returned by <code>DetectDocumentText</code> and <code>GetDocumentTextDetection</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable entityTypes;

/**
 <p>The location of the recognized text on the image. It includes an axis-aligned, coarse bounding box that surrounds the text, and a finer-grain polygon for more accurate spatial information. </p>
 */
@property (nonatomic, strong) AWSTextractGeometry * _Nullable geometry;

/**
 <p>The identifier for the recognized text. The identifier is only unique for a single operation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The page on which a block was detected. <code>Page</code> is returned by synchronous and asynchronous operations. Page values greater than 1 are only returned for multipage documents that are in PDF or TIFF format. A scanned image (JPEG/PNG) provided to an asynchronous operation, even if it contains multiple document pages, is considered a single-page document. This means that for scanned images the value of <code>Page</code> is always 1. Synchronous operations will also return a <code>Page</code> value of 1 because every input document is considered to be a single-page document.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable page;

/**
 <p/>
 */
@property (nonatomic, strong) AWSTextractQuery * _Nullable query;

/**
 <p>A list of relationship objects that describe how blocks are related to each other. For example, a LINE block object contains a CHILD relationship type with the WORD blocks that make up the line of text. There aren't Relationship objects in the list for relationships that don't exist, such as when the current block has no child blocks.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractRelationship *> * _Nullable relationships;

/**
 <p>The row in which a table cell is located. The first row position is 1. <code>RowIndex</code> isn't returned by <code>DetectDocumentText</code> and <code>GetDocumentTextDetection</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rowIndex;

/**
 <p>The number of rows that a table cell spans. <code>RowSpan</code> isn't returned by <code>DetectDocumentText</code> and <code>GetDocumentTextDetection</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rowSpan;

/**
 <p>The selection status of a selection element, such as an option button or check box. </p>
 */
@property (nonatomic, assign) AWSTextractSelectionStatus selectionStatus;

/**
 <p>The word or line of text that's recognized by Amazon Textract. </p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>The kind of text that Amazon Textract has detected. Can check for handwritten text and printed text.</p>
 */
@property (nonatomic, assign) AWSTextractTextType textType;

@end

/**
 <p>The bounding box around the detected page, text, key-value pair, table, table cell, or selection element on a document page. The <code>left</code> (x-coordinate) and <code>top</code> (y-coordinate) are coordinates that represent the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p><p>The <code>top</code> and <code>left</code> values returned are ratios of the overall document page size. For example, if the input image is 700 x 200 pixels, and the top-left coordinate of the bounding box is 350 x 50 pixels, the API returns a <code>left</code> value of 0.5 (350/700) and a <code>top</code> value of 0.25 (50/200).</p><p>The <code>width</code> and <code>height</code> values represent the dimensions of the bounding box as a ratio of the overall document page dimension. For example, if the document page size is 700 x 200 pixels, and the bounding box width is 70 pixels, the width returned is 0.1. </p>
 */
@interface AWSTextractBoundingBox : AWSModel


/**
 <p>The height of the bounding box as a ratio of the overall document page height.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable height;

/**
 <p>The left coordinate of the bounding box as a ratio of overall document page width.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable left;

/**
 <p>The top coordinate of the bounding box as a ratio of overall document page height.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable top;

/**
 <p>The width of the bounding box as a ratio of the overall document page width.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable width;

@end

/**
 
 */
@interface AWSTextractDetectDocumentTextRequest : AWSRequest


/**
 <p>The input document as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI to call Amazon Textract operations, you can't pass image bytes. The document must be an image in JPEG or PNG format.</p><p>If you're using an AWS SDK to call Amazon Textract, you might not need to base64-encode image bytes that are passed using the <code>Bytes</code> field. </p>
 */
@property (nonatomic, strong) AWSTextractDocument * _Nullable document;

@end

/**
 
 */
@interface AWSTextractDetectDocumentTextResponse : AWSModel


/**
 <p>An array of <code>Block</code> objects that contain the text that's detected in the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractBlock *> * _Nullable blocks;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable detectDocumentTextModelVersion;

/**
 <p>Metadata about the document. It contains the number of pages that are detected in the document.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentMetadata * _Nullable documentMetadata;

@end

/**
 <p>A structure that holds information regarding a detected signature on a page.</p>
 */
@interface AWSTextractDetectedSignature : AWSModel


/**
 <p>The page a detected signature was found on.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable page;

@end

/**
 <p>The input document, either as bytes or as an S3 object.</p><p>You pass image bytes to an Amazon Textract API operation by using the <code>Bytes</code> property. For example, you would use the <code>Bytes</code> property to pass a document loaded from a local file system. Image bytes passed by using the <code>Bytes</code> property must be base64 encoded. Your code might not need to encode document file bytes if you're using an AWS SDK to call Amazon Textract API operations. </p><p>You pass images stored in an S3 bucket to an Amazon Textract API operation by using the <code>S3Object</code> property. Documents stored in an S3 bucket don't need to be base64 encoded.</p><p>The AWS Region for the S3 bucket that contains the S3 object must match the AWS Region that you use for Amazon Textract operations.</p><p>If you use the AWS CLI to call Amazon Textract operations, passing image bytes using the Bytes property isn't supported. You must first upload the document to an Amazon S3 bucket, and then call the operation using the S3Object property.</p><p>For Amazon Textract to process an S3 object, the user must have permission to access the S3 object. </p>
 */
@interface AWSTextractDocument : AWSModel


/**
 <p>A blob of base64-encoded document bytes. The maximum size of a document that's provided in a blob of bytes is 5 MB. The document bytes must be in PNG or JPEG format.</p><p>If you're using an AWS SDK to call Amazon Textract, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. </p>
 */
@property (nonatomic, strong) NSData * _Nullable bytes;

/**
 <p>Identifies an S3 object as the document source. The maximum size of a document that's stored in an S3 bucket is 5 MB.</p>
 */
@property (nonatomic, strong) AWSTextractS3Object * _Nullable s3Object;

@end

/**
 <p>Summary information about documents grouped by the same document type.</p>
 */
@interface AWSTextractDocumentGroup : AWSModel


/**
 <p>A list of the detected signatures found in a document group.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractDetectedSignature *> * _Nullable detectedSignatures;

/**
 <p>An array that contains information about the pages of a document, defined by logical boundary.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractSplitDocument *> * _Nullable splitDocuments;

/**
 <p>The type of document that Amazon Textract has detected. See <a href="https://docs.aws.amazon.com/textract/latest/dg/lending-response-objects.html">Analyze Lending Response Objects</a> for a list of all types returned by Textract.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>A list of any expected signatures not found in a document group.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractUndetectedSignature *> * _Nullable undetectedSignatures;

@end

/**
 <p>The Amazon S3 bucket that contains the document to be processed. It's used by asynchronous operations.</p><p>The input document can be an image file in JPEG or PNG format. It can also be a file in PDF format.</p>
 */
@interface AWSTextractDocumentLocation : AWSModel


/**
 <p>The Amazon S3 bucket that contains the input document.</p>
 */
@property (nonatomic, strong) AWSTextractS3Object * _Nullable s3Object;

@end

/**
 <p>Information about the input document.</p>
 */
@interface AWSTextractDocumentMetadata : AWSModel


/**
 <p>The number of pages that are detected in the document.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pages;

@end

/**
 <p>Returns the kind of currency detected.</p>
 */
@interface AWSTextractExpenseCurrency : AWSModel


/**
 <p>Currency code for detected currency. the current supported codes are:</p><ul><li><p>USD</p></li><li><p>EUR</p></li><li><p>GBP</p></li><li><p>CAD</p></li><li><p>INR</p></li><li><p>JPY</p></li><li><p>CHF</p></li><li><p>AUD</p></li><li><p>CNY</p></li><li><p>BZR</p></li><li><p>SEK</p></li><li><p>HKD</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>Percentage confideence in the detected currency.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

@end

/**
 <p>An object used to store information about the Value or Label detected by Amazon Textract.</p>
 */
@interface AWSTextractExpenseDetection : AWSModel


/**
 <p>The confidence in detection, as a percentage</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Information about where the following items are located on a document page: detected page, text, key-value pairs, tables, table cells, and selection elements.</p>
 */
@property (nonatomic, strong) AWSTextractGeometry * _Nullable geometry;

/**
 <p>The word or line of text recognized by Amazon Textract</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 <p>The structure holding all the information returned by AnalyzeExpense</p>
 */
@interface AWSTextractExpenseDocument : AWSModel


/**
 <p>This is a block object, the same as reported when DetectDocumentText is run on a document. It provides word level recognition of text.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractBlock *> * _Nullable blocks;

/**
 <p>Denotes which invoice or receipt in the document the information is coming from. First document will be 1, the second 2, and so on.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expenseIndex;

/**
 <p>Information detected on each table of a document, seperated into <code>LineItems</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractLineItemGroup *> * _Nullable lineItemGroups;

/**
 <p>Any information found outside of a table by Amazon Textract.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractExpenseField *> * _Nullable summaryFields;

@end

/**
 <p>Breakdown of detected information, seperated into the catagories Type, LabelDetection, and ValueDetection</p>
 */
@interface AWSTextractExpenseField : AWSModel


/**
 <p>Shows the kind of currency, both the code and confidence associated with any monatary value detected.</p>
 */
@property (nonatomic, strong) AWSTextractExpenseCurrency * _Nullable currency;

/**
 <p>Shows which group a response object belongs to, such as whether an address line belongs to the vendor's address or the recipent's address.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractExpenseGroupProperty *> * _Nullable groupProperties;

/**
 <p>The explicitly stated label of a detected element.</p>
 */
@property (nonatomic, strong) AWSTextractExpenseDetection * _Nullable labelDetection;

/**
 <p>The page number the value was detected on.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageNumber;

/**
 <p>The implied label of a detected element. Present alongside LabelDetection for explicit elements.</p>
 */
@property (nonatomic, strong) AWSTextractExpenseType * _Nullable types;

/**
 <p>The value of a detected element. Present in explicit and implicit elements.</p>
 */
@property (nonatomic, strong) AWSTextractExpenseDetection * _Nullable valueDetection;

@end

/**
 <p>Shows the group that a certain key belongs to. This helps differentiate between names and addresses for different organizations, that can be hard to determine via JSON response.</p>
 */
@interface AWSTextractExpenseGroupProperty : AWSModel


/**
 <p>Provides a group Id number, which will be the same for each in the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Informs you on whether the expense group is a name or an address.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable types;

@end

/**
 <p>An object used to store information about the Type detected by Amazon Textract.</p>
 */
@interface AWSTextractExpenseType : AWSModel


/**
 <p>The confidence of accuracy, as a percentage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The word or line of text detected by Amazon Textract.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 <p>Contains information extracted by an analysis operation after using StartLendingAnalysis.</p>
 */
@interface AWSTextractExtraction : AWSModel


/**
 <p>The structure holding all the information returned by AnalyzeExpense</p>
 */
@property (nonatomic, strong) AWSTextractExpenseDocument * _Nullable expenseDocument;

/**
 <p>The structure that lists each document processed in an AnalyzeID operation.</p>
 */
@property (nonatomic, strong) AWSTextractIdentityDocument * _Nullable identityDocument;

/**
 <p>Holds the structured data returned by AnalyzeDocument for lending documents.</p>
 */
@property (nonatomic, strong) AWSTextractLendingDocument * _Nullable lendingDocument;

@end

/**
 <p>Information about where the following items are located on a document page: detected page, text, key-value pairs, tables, table cells, and selection elements.</p>
 */
@interface AWSTextractGeometry : AWSModel


/**
 <p>An axis-aligned coarse representation of the location of the recognized item on the document page.</p>
 */
@property (nonatomic, strong) AWSTextractBoundingBox * _Nullable boundingBox;

/**
 <p>Within the bounding box, a fine-grained polygon around the recognized item.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractPoint *> * _Nullable polygon;

@end

/**
 
 */
@interface AWSTextractGetDocumentAnalysisRequest : AWSRequest


/**
 <p>A unique identifier for the text-detection job. The <code>JobId</code> is returned from <code>StartDocumentAnalysis</code>. A <code>JobId</code> value is only valid for 7 days.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The maximum number of results to return per paginated call. The largest value that you can specify is 1,000. If you specify a value greater than 1,000, a maximum of 1,000 results is returned. The default value is 1,000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there are more blocks to retrieve), Amazon Textract returns a pagination token in the response. You can use this pagination token to retrieve the next set of blocks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTextractGetDocumentAnalysisResponse : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable analyzeDocumentModelVersion;

/**
 <p>The results of the text-analysis operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractBlock *> * _Nullable blocks;

/**
 <p>Information about a document that Amazon Textract processed. <code>DocumentMetadata</code> is returned in every page of paginated responses from an Amazon Textract video operation.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentMetadata * _Nullable documentMetadata;

/**
 <p>The current status of the text detection job.</p>
 */
@property (nonatomic, assign) AWSTextractJobStatus jobStatus;

/**
 <p>If the response is truncated, Amazon Textract returns this token. You can use this token in the subsequent request to retrieve the next set of text detection results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Returns if the detection job could not be completed. Contains explanation for what error occured.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>A list of warnings that occurred during the document-analysis operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractWarning *> * _Nullable warnings;

@end

/**
 
 */
@interface AWSTextractGetDocumentTextDetectionRequest : AWSRequest


/**
 <p>A unique identifier for the text detection job. The <code>JobId</code> is returned from <code>StartDocumentTextDetection</code>. A <code>JobId</code> value is only valid for 7 days.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The maximum number of results to return per paginated call. The largest value you can specify is 1,000. If you specify a value greater than 1,000, a maximum of 1,000 results is returned. The default value is 1,000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there are more blocks to retrieve), Amazon Textract returns a pagination token in the response. You can use this pagination token to retrieve the next set of blocks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTextractGetDocumentTextDetectionResponse : AWSModel


/**
 <p>The results of the text-detection operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractBlock *> * _Nullable blocks;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable detectDocumentTextModelVersion;

/**
 <p>Information about a document that Amazon Textract processed. <code>DocumentMetadata</code> is returned in every page of paginated responses from an Amazon Textract video operation.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentMetadata * _Nullable documentMetadata;

/**
 <p>The current status of the text detection job.</p>
 */
@property (nonatomic, assign) AWSTextractJobStatus jobStatus;

/**
 <p>If the response is truncated, Amazon Textract returns this token. You can use this token in the subsequent request to retrieve the next set of text-detection results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Returns if the detection job could not be completed. Contains explanation for what error occured. </p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>A list of warnings that occurred during the text-detection operation for the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractWarning *> * _Nullable warnings;

@end

/**
 
 */
@interface AWSTextractGetExpenseAnalysisRequest : AWSRequest


/**
 <p>A unique identifier for the text detection job. The <code>JobId</code> is returned from <code>StartExpenseAnalysis</code>. A <code>JobId</code> value is only valid for 7 days.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The maximum number of results to return per paginated call. The largest value you can specify is 20. If you specify a value greater than 20, a maximum of 20 results is returned. The default value is 20.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete (because there are more blocks to retrieve), Amazon Textract returns a pagination token in the response. You can use this pagination token to retrieve the next set of blocks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTextractGetExpenseAnalysisResponse : AWSModel


/**
 <p>The current model version of AnalyzeExpense.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzeExpenseModelVersion;

/**
 <p>Information about a document that Amazon Textract processed. <code>DocumentMetadata</code> is returned in every page of paginated responses from an Amazon Textract operation.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentMetadata * _Nullable documentMetadata;

/**
 <p>The expenses detected by Amazon Textract.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractExpenseDocument *> * _Nullable expenseDocuments;

/**
 <p>The current status of the text detection job.</p>
 */
@property (nonatomic, assign) AWSTextractJobStatus jobStatus;

/**
 <p>If the response is truncated, Amazon Textract returns this token. You can use this token in the subsequent request to retrieve the next set of text-detection results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Returns if the detection job could not be completed. Contains explanation for what error occured. </p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>A list of warnings that occurred during the text-detection operation for the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractWarning *> * _Nullable warnings;

@end

/**
 
 */
@interface AWSTextractGetLendingAnalysisRequest : AWSRequest


/**
 <p>A unique identifier for the lending or text-detection job. The <code>JobId</code> is returned from <code>StartLendingAnalysis</code>. A <code>JobId</code> value is only valid for 7 days.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The maximum number of results to return per paginated call. The largest value that you can specify is 30. If you specify a value greater than 30, a maximum of 30 results is returned. The default value is 30.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the previous response was incomplete, Amazon Textract returns a pagination token in the response. You can use this pagination token to retrieve the next set of lending results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTextractGetLendingAnalysisResponse : AWSModel


/**
 <p> The current model version of the Analyze Lending API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzeLendingModelVersion;

/**
 <p>Information about the input document.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentMetadata * _Nullable documentMetadata;

/**
 <p> The current status of the lending analysis job.</p>
 */
@property (nonatomic, assign) AWSTextractJobStatus jobStatus;

/**
 <p>If the response is truncated, Amazon Textract returns this token. You can use this token in the subsequent request to retrieve the next set of lending results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> Holds the information returned by one of AmazonTextract's document analysis operations for the pinstripe.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractLendingResult *> * _Nullable results;

/**
 <p> Returns if the lending analysis job could not be completed. Contains explanation for what error occurred. </p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p> A list of warnings that occurred during the lending analysis operation. </p>
 */
@property (nonatomic, strong) NSArray<AWSTextractWarning *> * _Nullable warnings;

@end

/**
 
 */
@interface AWSTextractGetLendingAnalysisSummaryRequest : AWSRequest


/**
 <p> A unique identifier for the lending or text-detection job. The <code>JobId</code> is returned from StartLendingAnalysis. A <code>JobId</code> value is only valid for 7 days.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSTextractGetLendingAnalysisSummaryResponse : AWSModel


/**
 <p>The current model version of the Analyze Lending API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyzeLendingModelVersion;

/**
 <p>Information about the input document.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentMetadata * _Nullable documentMetadata;

/**
 <p> The current status of the lending analysis job. </p>
 */
@property (nonatomic, assign) AWSTextractJobStatus jobStatus;

/**
 <p>Returns if the lending analysis could not be completed. Contains explanation for what error occurred.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p> Contains summary information for documents grouped by type.</p>
 */
@property (nonatomic, strong) AWSTextractLendingSummary * _Nullable summary;

/**
 <p>A list of warnings that occurred during the lending analysis operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractWarning *> * _Nullable warnings;

@end

/**
 <p>Shows the results of the human in the loop evaluation. If there is no HumanLoopArn, the input did not trigger human review.</p>
 */
@interface AWSTextractHumanLoopActivationOutput : AWSModel


/**
 <p>Shows the result of condition evaluations, including those conditions which activated a human review.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopActivationConditionsEvaluationResults;

/**
 <p>Shows if and why human review was needed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable humanLoopActivationReasons;

/**
 <p>The Amazon Resource Name (ARN) of the HumanLoop created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopArn;

@end

/**
 <p>Sets up the human review workflow the document will be sent to if one of the conditions is met. You can also set certain attributes of the image before review. </p>
 Required parameters: [HumanLoopName, FlowDefinitionArn]
 */
@interface AWSTextractHumanLoopConfig : AWSModel


/**
 <p>Sets attributes of the input data.</p>
 */
@property (nonatomic, strong) AWSTextractHumanLoopDataAttributes * _Nullable dataAttributes;

/**
 <p>The Amazon Resource Name (ARN) of the flow definition.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowDefinitionArn;

/**
 <p>The name of the human workflow used for this image. This should be kept unique within a region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable humanLoopName;

@end

/**
 <p>Allows you to set attributes of the image. Currently, you can declare an image as free of personally identifiable information and adult content. </p>
 */
@interface AWSTextractHumanLoopDataAttributes : AWSModel


/**
 <p>Sets whether the input image is free of personally identifiable information or adult content.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable contentClassifiers;

@end

/**
 <p>The structure that lists each document processed in an AnalyzeID operation.</p>
 */
@interface AWSTextractIdentityDocument : AWSModel


/**
 <p>Individual word recognition, as returned by document detection.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractBlock *> * _Nullable blocks;

/**
 <p>Denotes the placement of a document in the IdentityDocument list. The first document is marked 1, the second 2 and so on.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable documentIndex;

/**
 <p>The structure used to record information extracted from identity documents. Contains both normalized field and value of the extracted text.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractIdentityDocumentField *> * _Nullable identityDocumentFields;

@end

/**
 <p>Structure containing both the normalized type of the extracted information and the text associated with it. These are extracted as Type and Value respectively.</p>
 */
@interface AWSTextractIdentityDocumentField : AWSModel


/**
 <p>Used to contain the information detected by an AnalyzeID operation.</p>
 */
@property (nonatomic, strong) AWSTextractAnalyzeIDDetections * _Nullable types;

/**
 <p>Used to contain the information detected by an AnalyzeID operation.</p>
 */
@property (nonatomic, strong) AWSTextractAnalyzeIDDetections * _Nullable valueDetection;

@end

/**
 <p>The results extracted for a lending document.</p>
 */
@interface AWSTextractLendingDetection : AWSModel


/**
 <p>The confidence level for the text of a detected value in a lending document.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Information about where the following items are located on a document page: detected page, text, key-value pairs, tables, table cells, and selection elements.</p>
 */
@property (nonatomic, strong) AWSTextractGeometry * _Nullable geometry;

/**
 <p>The selection status of a selection element, such as an option button or check box.</p>
 */
@property (nonatomic, assign) AWSTextractSelectionStatus selectionStatus;

/**
 <p>The text extracted for a detected value in a lending document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 <p>Holds the structured data returned by AnalyzeDocument for lending documents.</p>
 */
@interface AWSTextractLendingDocument : AWSModel


/**
 <p>An array of LendingField objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractLendingField *> * _Nullable lendingFields;

/**
 <p>A list of signatures detected in a lending document.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractSignatureDetection *> * _Nullable signatureDetections;

@end

/**
 <p>Holds the normalized key-value pairs returned by AnalyzeDocument, including the document type, detected text, and geometry.</p>
 */
@interface AWSTextractLendingField : AWSModel


/**
 <p>The results extracted for a lending document.</p>
 */
@property (nonatomic, strong) AWSTextractLendingDetection * _Nullable keyDetection;

/**
 <p>The type of the lending document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>An array of LendingDetection objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractLendingDetection *> * _Nullable valueDetections;

@end

/**
 <p>Contains the detections for each page analyzed through the Analyze Lending API.</p>
 */
@interface AWSTextractLendingResult : AWSModel


/**
 <p>An array of Extraction to hold structured data. e.g. normalized key value pairs instead of raw OCR detections .</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractExtraction *> * _Nullable extractions;

/**
 <p>The page number for a page, with regard to whole submission.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable page;

/**
 <p>The classifier result for a given page.</p>
 */
@property (nonatomic, strong) AWSTextractPageClassification * _Nullable pageClassification;

@end

/**
 <p>Contains information regarding DocumentGroups and UndetectedDocumentTypes.</p>
 */
@interface AWSTextractLendingSummary : AWSModel


/**
 <p>Contains an array of all DocumentGroup objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractDocumentGroup *> * _Nullable documentGroups;

/**
 <p>UndetectedDocumentTypes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable undetectedDocumentTypes;

@end

/**
 <p>A structure that holds information about the different lines found in a document's tables.</p>
 */
@interface AWSTextractLineItemFields : AWSModel


/**
 <p>ExpenseFields used to show information from detected lines on a table.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractExpenseField *> * _Nullable lineItemExpenseFields;

@end

/**
 <p>A grouping of tables which contain LineItems, with each table identified by the table's <code>LineItemGroupIndex</code>.</p>
 */
@interface AWSTextractLineItemGroup : AWSModel


/**
 <p>The number used to identify a specific table in a document. The first table encountered will have a LineItemGroupIndex of 1, the second 2, etc.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lineItemGroupIndex;

/**
 <p>The breakdown of information on a particular line of a table. </p>
 */
@property (nonatomic, strong) NSArray<AWSTextractLineItemFields *> * _Nullable lineItems;

@end

/**
 <p>Contains information relating to dates in a document, including the type of value, and the value.</p>
 */
@interface AWSTextractNormalizedValue : AWSModel


/**
 <p>The value of the date, written as Year-Month-DayTHour:Minute:Second.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

/**
 <p>The normalized type of the value detected. In this case, DATE.</p>
 */
@property (nonatomic, assign) AWSTextractValueType valueType;

@end

/**
 <p>The Amazon Simple Notification Service (Amazon SNS) topic to which Amazon Textract publishes the completion status of an asynchronous document operation. </p>
 Required parameters: [SNSTopicArn, RoleArn]
 */
@interface AWSTextractNotificationChannel : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of an IAM role that gives Amazon Textract publishing permissions to the Amazon SNS topic. </p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The Amazon SNS topic that Amazon Textract posts the completion status to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SNSTopicArn;

@end

/**
 <p>Sets whether or not your output will go to a user created bucket. Used to set the name of the bucket, and the prefix on the output file.</p><p><code>OutputConfig</code> is an optional parameter which lets you adjust where your output will be placed. By default, Amazon Textract will store the results internally and can only be accessed by the Get API operations. With <code>OutputConfig</code> enabled, you can set the name of the bucket the output will be sent to the file prefix of the results where you can download your results. Additionally, you can set the <code>KMSKeyID</code> parameter to a customer master key (CMK) to encrypt your output. Without this parameter set Amazon Textract will encrypt server-side using the AWS managed CMK for Amazon S3.</p><p>Decryption of Customer Content is necessary for processing of the documents by Amazon Textract. If your account is opted out under an AI services opt out policy then all unencrypted Customer Content is immediately and permanently deleted after the Customer Content has been processed by the service. No copy of of the output is retained by Amazon Textract. For information about how to opt out, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html"> Managing AI services opt-out policy. </a></p><p>For more information on data privacy, see the <a href="https://aws.amazon.com/compliance/data-privacy-faq/">Data Privacy FAQ</a>.</p>
 Required parameters: [S3Bucket]
 */
@interface AWSTextractOutputConfig : AWSModel


/**
 <p>The name of the bucket your output will go to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The prefix of the object key that the output will be saved to. When not enabled, the prefix will be “textract_output".</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Prefix;

@end

/**
 <p>The class assigned to a Page object detected in an input document. Contains information regarding the predicted type/class of a document's page and the page number that the Page object was detected on.</p>
 Required parameters: [PageType, PageNumber]
 */
@interface AWSTextractPageClassification : AWSModel


/**
 <p> The page number the value was detected on, relative to Amazon Textract's starting position.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractPrediction *> * _Nullable pageNumber;

/**
 <p>The class, or document type, assigned to a detected Page object. The class, or document type, assigned to a detected Page object.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractPrediction *> * _Nullable pageType;

@end

/**
 <p>The X and Y coordinates of a point on a document page. The X and Y values that are returned are ratios of the overall document page size. For example, if the input document is 700 x 200 and the operation returns X=0.5 and Y=0.25, then the point is at the (350,50) pixel coordinate on the document page.</p><p>An array of <code>Point</code> objects, <code>Polygon</code>, is returned by <a>DetectDocumentText</a>. <code>Polygon</code> represents a fine-grained polygon around detected text. For more information, see Geometry in the Amazon Textract Developer Guide. </p>
 */
@interface AWSTextractPoint : AWSModel


/**
 <p>The value of the X coordinate for a point on a <code>Polygon</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable X;

/**
 <p>The value of the Y coordinate for a point on a <code>Polygon</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable Y;

@end

/**
 <p>Contains information regarding predicted values returned by Amazon Textract operations, including the predicted value and the confidence in the predicted value.</p>
 */
@interface AWSTextractPrediction : AWSModel


/**
 <p>Amazon Textract's confidence in its predicted value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The predicted value of a detected object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p/>
 Required parameters: [Queries]
 */
@interface AWSTextractQueriesConfig : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSTextractQuery *> * _Nullable queries;

@end

/**
 <p>Each query contains the question you want to ask in the Text and the alias you want to associate.</p>
 Required parameters: [Text]
 */
@interface AWSTextractQuery : AWSModel


/**
 <p>Alias attached to the query, for ease of location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alias;

/**
 <p>Pages is a parameter that the user inputs to specify which pages to apply a query to. The following is a list of rules for using this parameter.</p><ul><li><p>If a page is not specified, it is set to <code>["1"]</code> by default.</p></li><li><p>The following characters are allowed in the parameter's string: <code>0 1 2 3 4 5 6 7 8 9 - *</code>. No whitespace is allowed.</p></li><li><p>When using * to indicate all pages, it must be the only element in the list.</p></li><li><p>You can use page intervals, such as <code>[“1-3”, “1-1”, “4-*”]</code>. Where <code>*</code> indicates last page of document.</p></li><li><p>Specified pages must be greater than 0 and less than or equal to the number of pages in the document.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable pages;

/**
 <p>Question that Amazon Textract will apply to the document. An example would be "What is the customer's SSN?"</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 <p>Information about how blocks are related to each other. A <code>Block</code> object contains 0 or more <code>Relation</code> objects in a list, <code>Relationships</code>. For more information, see <a>Block</a>.</p><p>The <code>Type</code> element provides the type of the relationship for all blocks in the <code>IDs</code> array. </p>
 */
@interface AWSTextractRelationship : AWSModel


/**
 <p>An array of IDs for related blocks. You can get the type of the relationship from the <code>Type</code> element.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ids;

/**
 <p>The type of relationship between the blocks in the IDs array and the current block. The following list describes the relationship types that can be returned. </p><ul><li><p><i>VALUE</i> - A list that contains the ID of the VALUE block that's associated with the KEY of a key-value pair.</p></li><li><p><i>CHILD</i> - A list of IDs that identify blocks found within the current block object. For example, WORD blocks have a CHILD relationship to the LINE block type.</p></li><li><p><i>MERGED_CELL</i> - A list of IDs that identify each of the MERGED_CELL block types in a table.</p></li><li><p><i>ANSWER</i> - A list that contains the ID of the QUERY_RESULT block that’s associated with the corresponding QUERY block. </p></li><li><p><i>TABLE</i> - A list of IDs that identify associated TABLE block types. </p></li><li><p><i>TABLE_TITLE</i> - A list that contains the ID for the TABLE_TITLE block type in a table. </p></li><li><p><i>TABLE_FOOTER</i> - A list of IDs that identify the TABLE_FOOTER block types in a table. </p></li></ul>
 */
@property (nonatomic, assign) AWSTextractRelationshipType types;

@end

/**
 <p>The S3 bucket name and file name that identifies the document.</p><p>The AWS Region for the S3 bucket that contains the document must match the Region that you use for Amazon Textract operations.</p><p>For Amazon Textract to process a file in an S3 bucket, the user must have permission to access the S3 bucket and file. </p>
 */
@interface AWSTextractS3Object : AWSModel


/**
 <p>The name of the S3 bucket. Note that the # character is not valid in the file name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The file name of the input document. Synchronous operations can use image files that are in JPEG or PNG format. Asynchronous operations also support PDF and TIFF format files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>If the bucket has versioning enabled, you can specify the object version. </p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Information regarding a detected signature on a page.</p>
 */
@interface AWSTextractSignatureDetection : AWSModel


/**
 <p>The confidence, from 0 to 100, in the predicted values for a detected signature.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>Information about where the following items are located on a document page: detected page, text, key-value pairs, tables, table cells, and selection elements.</p>
 */
@property (nonatomic, strong) AWSTextractGeometry * _Nullable geometry;

@end

/**
 <p>Contains information about the pages of a document, defined by logical boundary.</p>
 */
@interface AWSTextractSplitDocument : AWSModel


/**
 <p>The index for a given document in a DocumentGroup of a specific Type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

/**
 <p>An array of page numbers for a for a given document, ordered by logical boundary.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable pages;

@end

/**
 
 */
@interface AWSTextractStartDocumentAnalysisRequest : AWSRequest


/**
 <p>The idempotent token that you use to identify the start request. If you use the same token with multiple <code>StartDocumentAnalysis</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidentally started more than once. For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/api-async.html">Calling Amazon Textract Asynchronous Operations</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The location of the document to be processed.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentLocation * _Nullable documentLocation;

/**
 <p>A list of the types of analysis to perform. Add TABLES to the list to return information about the tables that are detected in the input document. Add FORMS to return detected form data. To perform both types of analysis, add TABLES and FORMS to <code>FeatureTypes</code>. All lines and words detected in the document are included in the response (including text that isn't related to the value of <code>FeatureTypes</code>). </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable featureTypes;

/**
 <p>An identifier that you specify that's included in the completion notification published to the Amazon SNS topic. For example, you can use <code>JobTag</code> to identify the type of document that the completion notification corresponds to (such as a tax form or a receipt).</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>The KMS key used to encrypt the inference results. This can be in either Key ID or Key Alias format. When a KMS key is provided, the KMS key will be used for server-side encryption of the objects in the customer bucket. When this parameter is not enabled, the result will be encrypted server side,using SSE-S3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKeyId;

/**
 <p>The Amazon SNS topic ARN that you want Amazon Textract to publish the completion status of the operation to. </p>
 */
@property (nonatomic, strong) AWSTextractNotificationChannel * _Nullable notificationChannel;

/**
 <p>Sets if the output will go to a customer defined bucket. By default, Amazon Textract will save the results internally to be accessed by the GetDocumentAnalysis operation.</p>
 */
@property (nonatomic, strong) AWSTextractOutputConfig * _Nullable outputConfig;

/**
 <p/>
 */
@property (nonatomic, strong) AWSTextractQueriesConfig * _Nullable queriesConfig;

@end

/**
 
 */
@interface AWSTextractStartDocumentAnalysisResponse : AWSModel


/**
 <p>The identifier for the document text detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetDocumentAnalysis</code>. A <code>JobId</code> value is only valid for 7 days.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSTextractStartDocumentTextDetectionRequest : AWSRequest


/**
 <p>The idempotent token that's used to identify the start request. If you use the same token with multiple <code>StartDocumentTextDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidentally started more than once. For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/api-async.html">Calling Amazon Textract Asynchronous Operations</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The location of the document to be processed.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentLocation * _Nullable documentLocation;

/**
 <p>An identifier that you specify that's included in the completion notification published to the Amazon SNS topic. For example, you can use <code>JobTag</code> to identify the type of document that the completion notification corresponds to (such as a tax form or a receipt).</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>The KMS key used to encrypt the inference results. This can be in either Key ID or Key Alias format. When a KMS key is provided, the KMS key will be used for server-side encryption of the objects in the customer bucket. When this parameter is not enabled, the result will be encrypted server side,using SSE-S3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKeyId;

/**
 <p>The Amazon SNS topic ARN that you want Amazon Textract to publish the completion status of the operation to. </p>
 */
@property (nonatomic, strong) AWSTextractNotificationChannel * _Nullable notificationChannel;

/**
 <p>Sets if the output will go to a customer defined bucket. By default Amazon Textract will save the results internally to be accessed with the GetDocumentTextDetection operation.</p>
 */
@property (nonatomic, strong) AWSTextractOutputConfig * _Nullable outputConfig;

@end

/**
 
 */
@interface AWSTextractStartDocumentTextDetectionResponse : AWSModel


/**
 <p>The identifier of the text detection job for the document. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetDocumentTextDetection</code>. A <code>JobId</code> value is only valid for 7 days.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSTextractStartExpenseAnalysisRequest : AWSRequest


/**
 <p>The idempotent token that's used to identify the start request. If you use the same token with multiple <code>StartDocumentTextDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidentally started more than once. For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/api-async.html">Calling Amazon Textract Asynchronous Operations</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The location of the document to be processed.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentLocation * _Nullable documentLocation;

/**
 <p>An identifier you specify that's included in the completion notification published to the Amazon SNS topic. For example, you can use <code>JobTag</code> to identify the type of document that the completion notification corresponds to (such as a tax form or a receipt).</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>The KMS key used to encrypt the inference results. This can be in either Key ID or Key Alias format. When a KMS key is provided, the KMS key will be used for server-side encryption of the objects in the customer bucket. When this parameter is not enabled, the result will be encrypted server side,using SSE-S3.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKeyId;

/**
 <p>The Amazon SNS topic ARN that you want Amazon Textract to publish the completion status of the operation to. </p>
 */
@property (nonatomic, strong) AWSTextractNotificationChannel * _Nullable notificationChannel;

/**
 <p>Sets if the output will go to a customer defined bucket. By default, Amazon Textract will save the results internally to be accessed by the <code>GetExpenseAnalysis</code> operation.</p>
 */
@property (nonatomic, strong) AWSTextractOutputConfig * _Nullable outputConfig;

@end

/**
 
 */
@interface AWSTextractStartExpenseAnalysisResponse : AWSModel


/**
 <p>A unique identifier for the text detection job. The <code>JobId</code> is returned from <code>StartExpenseAnalysis</code>. A <code>JobId</code> value is only valid for 7 days.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSTextractStartLendingAnalysisRequest : AWSRequest


/**
 <p>The idempotent token that you use to identify the start request. If you use the same token with multiple <code>StartLendingAnalysis</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidentally started more than once. For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/api-sync.html">Calling Amazon Textract Asynchronous Operations</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon S3 bucket that contains the document to be processed. It's used by asynchronous operations.</p><p>The input document can be an image file in JPEG or PNG format. It can also be a file in PDF format.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentLocation * _Nullable documentLocation;

/**
 <p>An identifier that you specify to be included in the completion notification published to the Amazon SNS topic. For example, you can use <code>JobTag</code> to identify the type of document that the completion notification corresponds to (such as a tax form or a receipt).</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>The KMS key used to encrypt the inference results. This can be in either Key ID or Key Alias format. When a KMS key is provided, the KMS key will be used for server-side encryption of the objects in the customer bucket. When this parameter is not enabled, the result will be encrypted server side, using SSE-S3. </p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKeyId;

/**
 <p>The Amazon Simple Notification Service (Amazon SNS) topic to which Amazon Textract publishes the completion status of an asynchronous document operation. </p>
 */
@property (nonatomic, strong) AWSTextractNotificationChannel * _Nullable notificationChannel;

/**
 <p>Sets whether or not your output will go to a user created bucket. Used to set the name of the bucket, and the prefix on the output file.</p><p><code>OutputConfig</code> is an optional parameter which lets you adjust where your output will be placed. By default, Amazon Textract will store the results internally and can only be accessed by the Get API operations. With <code>OutputConfig</code> enabled, you can set the name of the bucket the output will be sent to the file prefix of the results where you can download your results. Additionally, you can set the <code>KMSKeyID</code> parameter to a customer master key (CMK) to encrypt your output. Without this parameter set Amazon Textract will encrypt server-side using the AWS managed CMK for Amazon S3.</p><p>Decryption of Customer Content is necessary for processing of the documents by Amazon Textract. If your account is opted out under an AI services opt out policy then all unencrypted Customer Content is immediately and permanently deleted after the Customer Content has been processed by the service. No copy of of the output is retained by Amazon Textract. For information about how to opt out, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html"> Managing AI services opt-out policy. </a></p><p>For more information on data privacy, see the <a href="https://aws.amazon.com/compliance/data-privacy-faq/">Data Privacy FAQ</a>.</p>
 */
@property (nonatomic, strong) AWSTextractOutputConfig * _Nullable outputConfig;

@end

/**
 
 */
@interface AWSTextractStartLendingAnalysisResponse : AWSModel


/**
 <p>A unique identifier for the lending or text-detection job. The <code>JobId</code> is returned from <code>StartLendingAnalysis</code>. A <code>JobId</code> value is only valid for 7 days.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 <p>A structure containing information about an undetected signature on a page where it was expected but not found.</p>
 */
@interface AWSTextractUndetectedSignature : AWSModel


/**
 <p>The page where a signature was expected but not found.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable page;

@end

/**
 <p>A warning about an issue that occurred during asynchronous text analysis (<a>StartDocumentAnalysis</a>) or asynchronous document text detection (<a>StartDocumentTextDetection</a>). </p>
 */
@interface AWSTextractWarning : AWSModel


/**
 <p>The error code for the warning.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>A list of the pages that the warning applies to.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable pages;

@end

NS_ASSUME_NONNULL_END
