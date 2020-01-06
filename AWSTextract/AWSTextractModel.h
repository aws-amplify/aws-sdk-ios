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
    AWSTextractErrorIdempotentParameterMismatch,
    AWSTextractErrorInternalServer,
    AWSTextractErrorInvalidJobId,
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
};

typedef NS_ENUM(NSInteger, AWSTextractEntityType) {
    AWSTextractEntityTypeUnknown,
    AWSTextractEntityTypeKey,
    AWSTextractEntityTypeValue,
};

typedef NS_ENUM(NSInteger, AWSTextractFeatureType) {
    AWSTextractFeatureTypeUnknown,
    AWSTextractFeatureTypeTables,
    AWSTextractFeatureTypeForms,
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
};

typedef NS_ENUM(NSInteger, AWSTextractSelectionStatus) {
    AWSTextractSelectionStatusUnknown,
    AWSTextractSelectionStatusSelected,
    AWSTextractSelectionStatusNotSelected,
};

@class AWSTextractAnalyzeDocumentRequest;
@class AWSTextractAnalyzeDocumentResponse;
@class AWSTextractBlock;
@class AWSTextractBoundingBox;
@class AWSTextractDetectDocumentTextRequest;
@class AWSTextractDetectDocumentTextResponse;
@class AWSTextractDocument;
@class AWSTextractDocumentLocation;
@class AWSTextractDocumentMetadata;
@class AWSTextractGeometry;
@class AWSTextractGetDocumentAnalysisRequest;
@class AWSTextractGetDocumentAnalysisResponse;
@class AWSTextractGetDocumentTextDetectionRequest;
@class AWSTextractGetDocumentTextDetectionResponse;
@class AWSTextractNotificationChannel;
@class AWSTextractPoint;
@class AWSTextractRelationship;
@class AWSTextractS3Object;
@class AWSTextractStartDocumentAnalysisRequest;
@class AWSTextractStartDocumentAnalysisResponse;
@class AWSTextractStartDocumentTextDetectionRequest;
@class AWSTextractStartDocumentTextDetectionResponse;
@class AWSTextractWarning;

/**
 
 */
@interface AWSTextractAnalyzeDocumentRequest : AWSRequest


/**
 <p>The input document as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI to call Amazon Textract operations, you can't pass image bytes. The document must be an image in JPG or PNG format.</p><p>If you are using an AWS SDK to call Amazon Textract, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. </p>
 */
@property (nonatomic, strong) AWSTextractDocument * _Nullable document;

/**
 <p>A list of the types of analysis to perform. Add TABLES to the list to return information about the tables detected in the input document. Add FORMS to return detected fields and the associated text. To perform both types of analysis, add TABLES and FORMS to <code>FeatureTypes</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable featureTypes;

@end

/**
 
 */
@interface AWSTextractAnalyzeDocumentResponse : AWSModel


/**
 <p>The text that's detected and analyzed by <code>AnalyzeDocument</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractBlock *> * _Nullable blocks;

/**
 <p>Metadata about the analyzed document. An example is the number of pages.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentMetadata * _Nullable documentMetadata;

@end

/**
 <p>A <code>Block</code> represents items that are recognized in a document within a group of pixels close to each other. The information returned in a <code>Block</code> depends on the type of operation. In document-text detection (for example <a>DetectDocumentText</a>), you get information about the detected words and lines of text. In text analysis (for example <a>AnalyzeDocument</a>), you can also get information about the fields, tables and selection elements that are detected in the document.</p><p>An array of <code>Block</code> objects is returned by both synchronous and asynchronous operations. In synchronous operations, such as <a>DetectDocumentText</a>, the array of <code>Block</code> objects is the entire set of results. In asynchronous operations, such as <a>GetDocumentAnalysis</a>, the array is returned over one or more responses.</p><p>For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works.html">How Amazon Textract Works</a>.</p>
 */
@interface AWSTextractBlock : AWSModel


/**
 <p>The type of text that's recognized in a block. In text-detection operations, the following types are returned:</p><ul><li><p><i>PAGE</i> - Contains a list of the LINE Block objects that are detected on a document page.</p></li><li><p><i>WORD</i> - A word detected on a document page. A word is one or more ISO basic Latin script characters that aren't separated by spaces.</p></li><li><p><i>LINE</i> - A string of tab-delimited, contiguous words that's detected on a document page.</p></li></ul><p>In text analysis operations, the following types are returned:</p><ul><li><p><i>PAGE</i> - Contains a list of child Block objects that are detected on a document page.</p></li><li><p><i>KEY_VALUE_SET</i> - Stores the KEY and VALUE Block objects for a field that's detected on a document page. Use the <code>EntityType</code> field to determine if a KEY_VALUE_SET object is a KEY Block object or a VALUE Block object. </p></li><li><p><i>WORD</i> - A word detected on a document page. A word is one or more ISO basic Latin script characters that aren't separated by spaces that's detected on a document page.</p></li><li><p><i>LINE</i> - A string of tab-delimited, contiguous words that's detected on a document page.</p></li><li><p><i>TABLE</i> - A table that's detected on a document page. A table is any grid-based information with 2 or more rows or columns with a cell span of 1 row and 1 column each. </p></li><li><p><i>CELL</i> - A cell within a detected table. The cell is the parent of the block that contains the text in the cell.</p></li><li><p><i>SELECTION_ELEMENT</i> - A selectable element such as a radio button or checkbox that's detected on a document page. Use the value of <code>SelectionStatus</code> to determine the status of the selection element.</p></li></ul>
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
 <p>The confidence that Amazon Textract has in the accuracy of the recognized text and the accuracy of the geometry points around the recognized text.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The type of entity. The following can be returned:</p><ul><li><p><i>KEY</i> - An identifier for a field on the document.</p></li><li><p><i>VALUE</i> - The field text.</p></li></ul><p><code>EntityTypes</code> isn't returned by <code>DetectDocumentText</code> and <code>GetDocumentTextDetection</code>.</p>
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
 <p>The page in which a block was detected. <code>Page</code> is returned by asynchronous operations. Page values greater than 1 are only returned for multi-page documents that are in PDF format. A scanned image (JPG/PNG), even if it contains multiple document pages, is always considered to be a single-page document and the value of <code>Page</code> is always 1. Synchronous operations don't return <code>Page</code> as every input document is considered to be a single-page document.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable page;

/**
 <p>A list of child blocks of the current block. For example a LINE object has child blocks for each WORD block that's part of the line of text. There aren't Relationship objects in the list for relationships that don't exist, such as when the current block has no child blocks. The list size can be the following:</p><ul><li><p>0 - The block has no child blocks.</p></li><li><p>1 - The block has child blocks.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSTextractRelationship *> * _Nullable relationships;

/**
 <p>The row in which a table cell is located. The first row position is 1. <code>RowIndex</code> isn't returned by <code>DetectDocumentText</code> and <code>GetDocumentTextDetection</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rowIndex;

/**
 <p>The number of rows that a table spans. <code>RowSpan</code> isn't returned by <code>DetectDocumentText</code> and <code>GetDocumentTextDetection</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rowSpan;

/**
 <p>The selection status of a selectable element such as a radio button or checkbox. </p>
 */
@property (nonatomic, assign) AWSTextractSelectionStatus selectionStatus;

/**
 <p>The word or line of text that's recognized by Amazon Textract. </p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 <p>The bounding box around the recognized text, key, value, table or table cell on a document page. The <code>left</code> (x-coordinate) and <code>top</code> (y-coordinate) are coordinates that represent the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p><p>The <code>top</code> and <code>left</code> values returned are ratios of the overall document page size. For example, if the input image is 700 x 200 pixels, and the top-left coordinate of the bounding box is 350 x 50 pixels, the API returns a <code>left</code> value of 0.5 (350/700) and a <code>top</code> value of 0.25 (50/200).</p><p>The <code>width</code> and <code>height</code> values represent the dimensions of the bounding box as a ratio of the overall document page dimension. For example, if the document page size is 700 x 200 pixels, and the bounding box width is 70 pixels, the width returned is 0.1. </p>
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
 <p>The input document as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI to call Amazon Textract operations, you can't pass image bytes. The document must be an image in JPG or PNG format.</p><p>If you are using an AWS SDK to call Amazon Textract, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. </p>
 */
@property (nonatomic, strong) AWSTextractDocument * _Nullable document;

@end

/**
 
 */
@interface AWSTextractDetectDocumentTextResponse : AWSModel


/**
 <p>An array of Block objects containing the text detected in the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractBlock *> * _Nullable blocks;

/**
 <p>Metadata about the document. Contains the number of pages that are detected in the document.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentMetadata * _Nullable documentMetadata;

@end

/**
 <p>The input document, either as bytes or as an S3 object.</p><p>You pass image bytes to an Amazon Textract API operation by using the <code>Bytes</code> property. For example, you would use the <code>Bytes</code> property to pass a document loaded from a local file system. Image bytes passed by using the <code>Bytes</code> property must be base64 encoded. Your code might not need to encode document file bytes if you're using an AWS SDK to call Amazon Textract API operations. </p><p>You pass images stored in an S3 bucket to an Amazon Textract API operation by using the <code>S3Object</code> property. Documents stored in an S3 bucket don't need to be base64 encoded.</p><p>The AWS Region for the S3 bucket that contains the S3 object must match the AWS Region that you use for Amazon Textract operations.</p><p>If you use the AWS CLI to call Amazon Textract operations, passing image bytes using the Bytes property isn't supported. You must first upload the document to an Amazon S3 bucket, and then call the operation using the S3Object property.</p><p>For Amazon Textract to process an S3 object, the user must have permission to access the S3 object. </p>
 */
@interface AWSTextractDocument : AWSModel


/**
 <p>A blob of base-64 encoded documents bytes. The maximum size of a document that's provided in a blob of bytes is 5 MB. The document bytes must be in PNG or JPG format.</p><p>If you are using an AWS SDK to call Amazon Textract, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. </p>
 */
@property (nonatomic, strong) NSData * _Nullable bytes;

/**
 <p>Identifies an S3 object as the document source. The maximum size of a document stored in an S3 bucket is 5 MB.</p>
 */
@property (nonatomic, strong) AWSTextractS3Object * _Nullable s3Object;

@end

/**
 <p>The Amazon S3 bucket that contains the document to be processed. It's used by asynchronous operations such as <a>StartDocumentTextDetection</a>.</p><p>The input document can be an image file in JPG or PNG format. It can also be a file in PDF format.</p>
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
 <p>The number of pages detected in the document.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pages;

@end

/**
 <p>Information about where a recognized text, key, value, table, or table cell is located on a document page.</p>
 */
@interface AWSTextractGeometry : AWSModel


/**
 <p>An axis-aligned coarse representation of the location of the recognized text on the document page.</p>
 */
@property (nonatomic, strong) AWSTextractBoundingBox * _Nullable boundingBox;

/**
 <p>Within the bounding box, a fine-grained polygon around the recognized text.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractPoint *> * _Nullable polygon;

@end

/**
 
 */
@interface AWSTextractGetDocumentAnalysisRequest : AWSRequest


/**
 <p>A unique identifier for the text-detection job. The <code>JobId</code> is returned from <code>StartDocumentAnalysis</code>.</p>
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
 <p>The results of the text analysis operation.</p>
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
 <p>The current status of an asynchronous document analysis operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>A list of warnings that occurred during the document analysis operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractWarning *> * _Nullable warnings;

@end

/**
 
 */
@interface AWSTextractGetDocumentTextDetectionRequest : AWSRequest


/**
 <p>A unique identifier for the text detection job. The <code>JobId</code> is returned from <code>StartDocumentTextDetection</code>.</p>
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
 <p>The current status of an asynchronous document text-detection operation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>A list of warnings that occurred during the document text-detection operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSTextractWarning *> * _Nullable warnings;

@end

/**
 <p>The Amazon Simple Notification Service (Amazon SNS) topic to which Amazon Textract publishes the completion status of an asynchronous document operation, such as <a>StartDocumentTextDetection</a>. </p>
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
 <p>The X and Y coordinates of a point on a document page. The X and Y values returned are ratios of the overall document page size. For example, if the input document is 700 x 200 and the operation returns X=0.5 and Y=0.25, then the point is at the (350,50) pixel coordinate on the document page.</p><p>An array of <code>Point</code> objects, <code>Polygon</code>, is returned by <a>DetectDocumentText</a>. <code>Polygon</code> represents a fine-grained polygon around detected text. For more information, see Geometry in the Amazon Textract Developer Guide. </p>
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
 <p>Information about how blocks are related to each other. A <code>Block</code> object contains 0 or more <code>Relation</code> objects in a list, <code>Relationships</code>. For more information, see <a>Block</a>.</p><p>The <code>Type</code> element provides the type of the relationship for all blocks in the <code>IDs</code> array. </p>
 */
@interface AWSTextractRelationship : AWSModel


/**
 <p>An array of IDs for related blocks. You can get the type of the relationship from the <code>Type</code> element.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ids;

/**
 <p>The type of relationship that the blocks in the IDs array have with the current block. The relationship can be <code>VALUE</code> or <code>CHILD</code>.</p>
 */
@property (nonatomic, assign) AWSTextractRelationshipType types;

@end

/**
 <p>The S3 bucket name and file name that identifies the document.</p><p>The AWS Region for the S3 bucket that contains the document must match the Region that you use for Amazon Textract operations.</p><p>For Amazon Textract to process a file in an S3 bucket, the user must have permission to access the S3 bucket and file. </p>
 */
@interface AWSTextractS3Object : AWSModel


/**
 <p>The name of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The file name of the input document. It must be an image file (.JPG or .PNG format). Asynchronous operations also support PDF files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>If the bucket has versioning enabled, you can specify the object version. </p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSTextractStartDocumentAnalysisRequest : AWSRequest


/**
 <p>The idempotent token that you use to identify the start request. If you use the same token with multiple <code>StartDocumentAnalysis</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidentally started more than once. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The location of the document to be processed.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentLocation * _Nullable documentLocation;

/**
 <p>A list of the types of analysis to perform. Add TABLES to the list to return information about the tables that are detected in the input document. Add FORMS to return detected fields and the associated text. To perform both types of analysis, add TABLES and FORMS to <code>FeatureTypes</code>. All selectable elements (<code>SELECTION_ELEMENT</code>) that are detected are returned, whatever the value of <code>FeatureTypes</code>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable featureTypes;

/**
 <p>An identifier you specify that's included in the completion notification that's published to the Amazon SNS topic. For example, you can use <code>JobTag</code> to identify the type of document, such as a tax form or a receipt, that the completion notification corresponds to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>The Amazon SNS topic ARN that you want Amazon Textract to publish the completion status of the operation to. </p>
 */
@property (nonatomic, strong) AWSTextractNotificationChannel * _Nullable notificationChannel;

@end

/**
 
 */
@interface AWSTextractStartDocumentAnalysisResponse : AWSModel


/**
 <p>The identifier for the document text detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetDocumentAnalysis</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSTextractStartDocumentTextDetectionRequest : AWSRequest


/**
 <p>The idempotent token that's used to identify the start request. If you use the same token with multiple <code>StartDocumentTextDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidentally started more than once. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The location of the document to be processed.</p>
 */
@property (nonatomic, strong) AWSTextractDocumentLocation * _Nullable documentLocation;

/**
 <p>An identifier you specify that's included in the completion notification that's published to the Amazon SNS topic. For example, you can use <code>JobTag</code> to identify the type of document, such as a tax form or a receipt, that the completion notification corresponds to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobTag;

/**
 <p>The Amazon SNS topic ARN that you want Amazon Textract to publish the completion status of the operation to. </p>
 */
@property (nonatomic, strong) AWSTextractNotificationChannel * _Nullable notificationChannel;

@end

/**
 
 */
@interface AWSTextractStartDocumentTextDetectionResponse : AWSModel


/**
 <p>The identifier for the document text-detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetDocumentTextDetection</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 <p>A warning about an issue that occurred during asynchronous text analysis (<a>StartDocumentAnalysis</a>) or asynchronous document-text detection (<a>StartDocumentTextDetection</a>). </p>
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
