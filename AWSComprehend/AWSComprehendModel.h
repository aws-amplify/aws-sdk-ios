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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSComprehendErrorDomain;

typedef NS_ENUM(NSInteger, AWSComprehendErrorType) {
    AWSComprehendErrorUnknown,
    AWSComprehendErrorBatchSizeLimitExceeded,
    AWSComprehendErrorInternalServer,
    AWSComprehendErrorInvalidFilter,
    AWSComprehendErrorInvalidRequest,
    AWSComprehendErrorJobNotFound,
    AWSComprehendErrorTextSizeLimitExceeded,
    AWSComprehendErrorTooManyRequests,
    AWSComprehendErrorUnsupportedLanguage,
};

typedef NS_ENUM(NSInteger, AWSComprehendEntityType) {
    AWSComprehendEntityTypeUnknown,
    AWSComprehendEntityTypePerson,
    AWSComprehendEntityTypeLocation,
    AWSComprehendEntityTypeOrganization,
    AWSComprehendEntityTypeCommercialItem,
    AWSComprehendEntityTypeEvent,
    AWSComprehendEntityTypeDate,
    AWSComprehendEntityTypeQuantity,
    AWSComprehendEntityTypeTitle,
    AWSComprehendEntityTypeOther,
};

typedef NS_ENUM(NSInteger, AWSComprehendInputFormat) {
    AWSComprehendInputFormatUnknown,
    AWSComprehendInputFormatOneDocPerFile,
    AWSComprehendInputFormatOneDocPerLine,
};

typedef NS_ENUM(NSInteger, AWSComprehendJobStatus) {
    AWSComprehendJobStatusUnknown,
    AWSComprehendJobStatusSubmitted,
    AWSComprehendJobStatusInProgress,
    AWSComprehendJobStatusCompleted,
    AWSComprehendJobStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSComprehendLanguageCode) {
    AWSComprehendLanguageCodeUnknown,
    AWSComprehendLanguageCodeEn,
    AWSComprehendLanguageCodeEs,
};

typedef NS_ENUM(NSInteger, AWSComprehendSentimentType) {
    AWSComprehendSentimentTypeUnknown,
    AWSComprehendSentimentTypePositive,
    AWSComprehendSentimentTypeNegative,
    AWSComprehendSentimentTypeNeutral,
    AWSComprehendSentimentTypeMixed,
};

@class AWSComprehendBatchDetectDominantLanguageItemResult;
@class AWSComprehendBatchDetectDominantLanguageRequest;
@class AWSComprehendBatchDetectDominantLanguageResponse;
@class AWSComprehendBatchDetectEntitiesItemResult;
@class AWSComprehendBatchDetectEntitiesRequest;
@class AWSComprehendBatchDetectEntitiesResponse;
@class AWSComprehendBatchDetectKeyPhrasesItemResult;
@class AWSComprehendBatchDetectKeyPhrasesRequest;
@class AWSComprehendBatchDetectKeyPhrasesResponse;
@class AWSComprehendBatchDetectSentimentItemResult;
@class AWSComprehendBatchDetectSentimentRequest;
@class AWSComprehendBatchDetectSentimentResponse;
@class AWSComprehendBatchItemError;
@class AWSComprehendDescribeTopicsDetectionJobRequest;
@class AWSComprehendDescribeTopicsDetectionJobResponse;
@class AWSComprehendDetectDominantLanguageRequest;
@class AWSComprehendDetectDominantLanguageResponse;
@class AWSComprehendDetectEntitiesRequest;
@class AWSComprehendDetectEntitiesResponse;
@class AWSComprehendDetectKeyPhrasesRequest;
@class AWSComprehendDetectKeyPhrasesResponse;
@class AWSComprehendDetectSentimentRequest;
@class AWSComprehendDetectSentimentResponse;
@class AWSComprehendDominantLanguage;
@class AWSComprehendEntity;
@class AWSComprehendInputDataConfig;
@class AWSComprehendKeyPhrase;
@class AWSComprehendListTopicsDetectionJobsRequest;
@class AWSComprehendListTopicsDetectionJobsResponse;
@class AWSComprehendOutputDataConfig;
@class AWSComprehendSentimentScore;
@class AWSComprehendStartTopicsDetectionJobRequest;
@class AWSComprehendStartTopicsDetectionJobResponse;
@class AWSComprehendTopicsDetectionJobFilter;
@class AWSComprehendTopicsDetectionJobProperties;

/**
 <p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>
 */
@interface AWSComprehendBatchDetectDominantLanguageItemResult : AWSModel


/**
 <p>The zero-based index of the document in the input list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

/**
 <p>One or more <a>DominantLanguage</a> objects describing the dominant languages in the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendDominantLanguage *> * _Nullable languages;

@end

/**
 
 */
@interface AWSComprehendBatchDetectDominantLanguageRequest : AWSRequest


/**
 <p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document should contain at least 20 characters and must contain fewer than 5,000 bytes of UTF-8 encoded characters.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable textList;

@end

/**
 
 */
@interface AWSComprehendBatchDetectDominantLanguageResponse : AWSModel


/**
 <p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchItemError *> * _Nullable errorList;

/**
 <p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchDetectDominantLanguageItemResult *> * _Nullable resultList;

@end

/**
 <p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>
 */
@interface AWSComprehendBatchDetectEntitiesItemResult : AWSModel


/**
 <p>One or more <a>Entity</a> objects, one for each entity detected in the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendEntity *> * _Nullable entities;

/**
 <p>The zero-based index of the document in the input list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

@end

/**
 
 */
@interface AWSComprehendBatchDetectEntitiesRequest : AWSRequest


/**
 <p>The language of the input documents. All documents must be in the same language.</p>
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 <p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer than 5,000 bytes of UTF-8 encoded characters.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable textList;

@end

/**
 
 */
@interface AWSComprehendBatchDetectEntitiesResponse : AWSModel


/**
 <p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchItemError *> * _Nullable errorList;

/**
 <p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchDetectEntitiesItemResult *> * _Nullable resultList;

@end

/**
 <p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>
 */
@interface AWSComprehendBatchDetectKeyPhrasesItemResult : AWSModel


/**
 <p>The zero-based index of the document in the input list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

/**
 <p>One or more <a>KeyPhrase</a> objects, one for each key phrase detected in the document.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendKeyPhrase *> * _Nullable keyPhrases;

@end

/**
 
 */
@interface AWSComprehendBatchDetectKeyPhrasesRequest : AWSRequest


/**
 <p>The language of the input documents. All documents must be in the same language.</p>
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 <p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable textList;

@end

/**
 
 */
@interface AWSComprehendBatchDetectKeyPhrasesResponse : AWSModel


/**
 <p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchItemError *> * _Nullable errorList;

/**
 <p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchDetectKeyPhrasesItemResult *> * _Nullable resultList;

@end

/**
 <p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>
 */
@interface AWSComprehendBatchDetectSentimentItemResult : AWSModel


/**
 <p>The zero-based index of the document in the input list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

/**
 <p>The sentiment detected in the document.</p>
 */
@property (nonatomic, assign) AWSComprehendSentimentType sentiment;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of its sentiment detection.</p>
 */
@property (nonatomic, strong) AWSComprehendSentimentScore * _Nullable sentimentScore;

@end

/**
 
 */
@interface AWSComprehendBatchDetectSentimentRequest : AWSRequest


/**
 <p>The language of the input documents. All documents must be in the same language.</p>
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 <p>A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable textList;

@end

/**
 
 */
@interface AWSComprehendBatchDetectSentimentResponse : AWSModel


/**
 <p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchItemError *> * _Nullable errorList;

/**
 <p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendBatchDetectSentimentItemResult *> * _Nullable resultList;

@end

/**
 <p>Describes an error that occurred while processing a document in a batch. The operation returns on <code>BatchItemError</code> object for each document that contained an error.</p>
 */
@interface AWSComprehendBatchItemError : AWSModel


/**
 <p>The numeric error code of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>A text description of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The zero-based index of the document in the input list.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable index;

@end

/**
 
 */
@interface AWSComprehendDescribeTopicsDetectionJobRequest : AWSRequest


/**
 <p>The identifier assigned by the user to the detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSComprehendDescribeTopicsDetectionJobResponse : AWSModel


/**
 <p>The list of properties for the requested job.</p>
 */
@property (nonatomic, strong) AWSComprehendTopicsDetectionJobProperties * _Nullable topicsDetectionJobProperties;

@end

/**
 
 */
@interface AWSComprehendDetectDominantLanguageRequest : AWSRequest


/**
 <p>A UTF-8 text string. Each string should contain at least 20 characters and must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendDetectDominantLanguageResponse : AWSModel


/**
 <p>The languages that Amazon Comprehend detected in the input text. For each language, the response returns the RFC 5646 language code and the level of confidence that Amazon Comprehend has in the accuracy of its inference. For more information about RFC 5646, see <a href="https://tools.ietf.org/html/rfc5646">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendDominantLanguage *> * _Nullable languages;

@end

/**
 
 */
@interface AWSComprehendDetectEntitiesRequest : AWSRequest


/**
 <p>The RFC 5646 language code of the input text. If the request does not specify the language code, the service detects the dominant language. If you specify a language code that the service does not support, it returns <code>UnsupportedLanguageException</code> exception. For more information about RFC 5646, see <a href="https://tools.ietf.org/html/rfc5646">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site. </p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendDetectEntitiesResponse : AWSModel


/**
 <p>A collection of entities identified in the input text. For each entity, the response provides the entity text, entity type, where the entity text begins and ends, and the level of confidence that Amazon Comprehend has in the detection. For a list of entity types, see <a>how-entities</a>. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendEntity *> * _Nullable entities;

@end

/**
 
 */
@interface AWSComprehendDetectKeyPhrasesRequest : AWSRequest


/**
 <p>The RFC 5646 language code for the input text. If you don't specify a language code, Amazon Comprehend detects the dominant language. If you specify the code for a language that Amazon Comprehend does not support, it returns and <code>UnsupportedLanguageException</code>. For more information about RFC 5646, see <a href="https://tools.ietf.org/html/rfc5646">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendDetectKeyPhrasesResponse : AWSModel


/**
 <p>A collection of key phrases that Amazon Comprehend identified in the input text. For each key phrase, the response provides the text of the key phrase, where the key phrase begins and ends, and the level of confidence that Amazon Comprehend has in the accuracy of the detection. </p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendKeyPhrase *> * _Nullable keyPhrases;

@end

/**
 
 */
@interface AWSComprehendDetectSentimentRequest : AWSRequest


/**
 <p>The RFC 5646 language code for the input text. If you don't specify a language code, Amazon Comprehend detects the dominant language. If you specify the code for a language that Amazon Comprehend does not support, it returns and <code>UnsupportedLanguageException</code>. For more information about RFC 5646, see <a href="https://tools.ietf.org/html/rfc5646">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site.</p>
 */
@property (nonatomic, assign) AWSComprehendLanguageCode languageCode;

/**
 <p>A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendDetectSentimentResponse : AWSModel


/**
 <p>The inferred sentiment that Amazon Comprehend has the highest level of confidence in.</p>
 */
@property (nonatomic, assign) AWSComprehendSentimentType sentiment;

/**
 <p>An object that lists the sentiments, and their corresponding confidence levels.</p>
 */
@property (nonatomic, strong) AWSComprehendSentimentScore * _Nullable sentimentScore;

@end

/**
 <p>Returns the code for the dominant language in the input text and the level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>
 */
@interface AWSComprehendDominantLanguage : AWSModel


/**
 <p>The RFC 5646 language code for the dominant language. </p>
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

@end

/**
 <p>Provides information about an entity. </p><p></p>
 */
@interface AWSComprehendEntity : AWSModel


/**
 <p>A character offset in the input text that shows where the entity begins (the first character is at position 0). The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>A character offset in the input text that shows where the entity ends. The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p>The text of the entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>The entity's type.</p>
 */
@property (nonatomic, assign) AWSComprehendEntityType types;

@end

/**
 <p>The input properties for a topic detection job.</p>
 Required parameters: [S3Uri]
 */
@interface AWSComprehendInputDataConfig : AWSModel


/**
 <p>Specifies how the text in an input file should be processed:</p><ul><li><p><code>ONE_DOC_PER_FILE</code> - Each file is considered a separate document. Use this option when you are processing large documents, such as newspaper articles or scientific papers.</p></li><li><p><code>ONE_DOC_PER_LINE</code> - Each line in a file is considered a separate document. Use this option when you are processing many short documents, such as text messages.</p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendInputFormat inputFormat;

/**
 <p>The Amazon S3 URI for the input data. The URI must be in same region as the API endpoint that you are calling. The URI can point to a single input file or it can provide the prefix for a collection of data files. </p><p>For example, if you use the URI <code>S3://bucketName/prefix</code>, if the prefix is a single file, Amazon Comprehend uses that file as input. If more than one file begins with the prefix, Amazon Comprehend uses all of them as input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Describes a key noun phrase.</p>
 */
@interface AWSComprehendKeyPhrase : AWSModel


/**
 <p>A character offset in the input text that shows where the key phrase begins (the first character is at position 0). The offset returns the position of each UTF-8 code point in the string. A <i>code point</i> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable beginOffset;

/**
 <p>A character offset in the input text where the key phrase ends. The offset returns the position of each UTF-8 code point in the string. A <code>code point</code> is the abstract character from a particular graphical representation. For example, a multi-byte UTF-8 character maps to a single code point.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endOffset;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

/**
 <p>The text of a key noun phrase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSComprehendListTopicsDetectionJobsRequest : AWSRequest


/**
 <p>Filters the jobs that are returned. Jobs can be filtered on their name, status, or the date and time that they were submitted. You can set only one filter at a time.</p>
 */
@property (nonatomic, strong) AWSComprehendTopicsDetectionJobFilter * _Nullable filter;

/**
 <p>The maximum number of results to return in each page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSComprehendListTopicsDetectionJobsResponse : AWSModel


/**
 <p>Identifies the next page of results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list containing the properties of each job that is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSComprehendTopicsDetectionJobProperties *> * _Nullable topicsDetectionJobPropertiesList;

@end

/**
 <p>Provides configuration parameters for the output of topic detection jobs.</p><p/>
 Required parameters: [S3Uri]
 */
@interface AWSComprehendOutputDataConfig : AWSModel


/**
 <p>The Amazon S3 URI where you want to write the output data. The URI must be in the same region as the API endpoint that you are calling. </p><p>The service creates an output file called <code>output.tar.gz</code>. It is a compressed archive that contains two files, <code>topic-terms.csv</code> that lists the terms associated with each topic, and <code>doc-topics.csv</code> that lists the documents associated with each topic. For more information, see <a>topic-modeling</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Describes the level of confidence that Amazon Comprehend has in the accuracy of its detection of sentiments.</p>
 */
@interface AWSComprehendSentimentScore : AWSModel


/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>MIXED</code> sentiment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mixed;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>NEGATIVE</code> sentiment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable negative;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>NEUTRAL</code> sentiment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable neutral;

/**
 <p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>POSITIVE</code> sentiment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable positive;

@end

/**
 
 */
@interface AWSComprehendStartTopicsDetectionJobRequest : AWSRequest


/**
 <p>A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. </p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Specifies the format and location of the input data for the job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The number of topics to detect.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfTopics;

/**
 <p>Specifies where to send the output files.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

@end

/**
 
 */
@interface AWSComprehendStartTopicsDetectionJobResponse : AWSModel


/**
 <p>The identifier generated for the job. To get the status of the job, use this identifier with the <code>DescribeTopicDetectionJob</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the job: </p><ul><li><p>SUBMITTED - The job has been received and is queued for processing.</p></li><li><p>IN_PROGRESS - Amazon Comprehend is processing the job.</p></li><li><p>COMPLETED - The job was successfully completed and the output is available.</p></li><li><p>FAILED - The job did not complete. To get details, use the <code>DescribeTopicDetectionJob</code> operation.</p></li></ul>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

@end

/**
 <p>Provides information for filtering topic detection jobs. For more information, see .</p>
 */
@interface AWSComprehendTopicsDetectionJobFilter : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Filters the list of topic detection jobs based on job status. Returns only jobs with the specified status.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

/**
 <p>Filters the list of jobs based on the time that the job was submitted for processing. Only returns jobs submitted after the specified time. Jobs are returned in ascending order, oldest to newest.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTimeAfter;

/**
 <p>Filters the list of jobs based on the time that the job was submitted for processing. Only returns jobs submitted before the specified time. Jobs are returned in descending order, newest to oldest.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTimeBefore;

@end

/**
 <p>Provides information about a topic detection job.</p>
 */
@interface AWSComprehendTopicsDetectionJobProperties : AWSModel


/**
 <p>The time that the topic detection job was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input data configuration supplied when you created the topic detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The identifier assigned to the topic detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The name of the topic detection job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The current status of the topic detection job. If the status is <code>Failed</code>, the reason for the failure is shown in the <code>Message</code> field.</p>
 */
@property (nonatomic, assign) AWSComprehendJobStatus jobStatus;

/**
 <p>A description for the status of a job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The number of topics to detect supplied when you created the topic detection job. The default is 10. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfTopics;

/**
 <p>The output data configuration supplied when you created the topic detection job.</p>
 */
@property (nonatomic, strong) AWSComprehendOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The time that the topic detection job was submitted for processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submitTime;

@end

NS_ASSUME_NONNULL_END
