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

FOUNDATION_EXPORT NSString *const AWSTranslateErrorDomain;

typedef NS_ENUM(NSInteger, AWSTranslateErrorType) {
    AWSTranslateErrorUnknown,
    AWSTranslateErrorDetectedLanguageLowConfidence,
    AWSTranslateErrorInternalServer,
    AWSTranslateErrorInvalidFilter,
    AWSTranslateErrorInvalidParameterValue,
    AWSTranslateErrorInvalidRequest,
    AWSTranslateErrorLimitExceeded,
    AWSTranslateErrorResourceNotFound,
    AWSTranslateErrorServiceUnavailable,
    AWSTranslateErrorTextSizeLimitExceeded,
    AWSTranslateErrorTooManyRequests,
    AWSTranslateErrorUnsupportedLanguagePair,
};

typedef NS_ENUM(NSInteger, AWSTranslateEncryptionKeyType) {
    AWSTranslateEncryptionKeyTypeUnknown,
    AWSTranslateEncryptionKeyTypeKms,
};

typedef NS_ENUM(NSInteger, AWSTranslateJobStatus) {
    AWSTranslateJobStatusUnknown,
    AWSTranslateJobStatusSubmitted,
    AWSTranslateJobStatusInProgress,
    AWSTranslateJobStatusCompleted,
    AWSTranslateJobStatusCompletedWithError,
    AWSTranslateJobStatusFailed,
    AWSTranslateJobStatusStopRequested,
    AWSTranslateJobStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSTranslateMergeStrategy) {
    AWSTranslateMergeStrategyUnknown,
    AWSTranslateMergeStrategyOverwrite,
};

typedef NS_ENUM(NSInteger, AWSTranslateTerminologyDataFormat) {
    AWSTranslateTerminologyDataFormatUnknown,
    AWSTranslateTerminologyDataFormatCsv,
    AWSTranslateTerminologyDataFormatTmx,
};

@class AWSTranslateAppliedTerminology;
@class AWSTranslateDeleteTerminologyRequest;
@class AWSTranslateDescribeTextTranslationJobRequest;
@class AWSTranslateDescribeTextTranslationJobResponse;
@class AWSTranslateEncryptionKey;
@class AWSTranslateGetTerminologyRequest;
@class AWSTranslateGetTerminologyResponse;
@class AWSTranslateImportTerminologyRequest;
@class AWSTranslateImportTerminologyResponse;
@class AWSTranslateInputDataConfig;
@class AWSTranslateJobDetails;
@class AWSTranslateListTerminologiesRequest;
@class AWSTranslateListTerminologiesResponse;
@class AWSTranslateListTextTranslationJobsRequest;
@class AWSTranslateListTextTranslationJobsResponse;
@class AWSTranslateOutputDataConfig;
@class AWSTranslateStartTextTranslationJobRequest;
@class AWSTranslateStartTextTranslationJobResponse;
@class AWSTranslateStopTextTranslationJobRequest;
@class AWSTranslateStopTextTranslationJobResponse;
@class AWSTranslateTerm;
@class AWSTranslateTerminologyData;
@class AWSTranslateTerminologyDataLocation;
@class AWSTranslateTerminologyProperties;
@class AWSTranslateTextTranslationJobFilter;
@class AWSTranslateTextTranslationJobProperties;
@class AWSTranslateTranslateTextRequest;
@class AWSTranslateTranslateTextResponse;

/**
 <p>The custom terminology applied to the input text by Amazon Translate for the translated text response. This is optional in the response and will only be present if you specified terminology input in the request. Currently, only one terminology can be applied per TranslateText request.</p>
 */
@interface AWSTranslateAppliedTerminology : AWSModel


/**
 <p>The name of the custom terminology applied to the input text by Amazon Translate for the translated text response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The specific terms of the custom terminology applied to the input text by Amazon Translate for the translated text response. A maximum of 250 terms will be returned, and the specific terms applied will be the first 250 terms in the source text. </p>
 */
@property (nonatomic, strong) NSArray<AWSTranslateTerm *> * _Nullable terms;

@end

/**
 
 */
@interface AWSTranslateDeleteTerminologyRequest : AWSRequest


/**
 <p>The name of the custom terminology being deleted. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSTranslateDescribeTextTranslationJobRequest : AWSRequest


/**
 <p>The identifier that Amazon Translate generated for the job. The <a>StartTextTranslationJob</a> operation returns this identifier in its response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSTranslateDescribeTextTranslationJobResponse : AWSModel


/**
 <p>An object that contains the properties associated with an asynchronous batch translation job.</p>
 */
@property (nonatomic, strong) AWSTranslateTextTranslationJobProperties * _Nullable textTranslationJobProperties;

@end

/**
 <p>The encryption key used to encrypt the custom terminologies used by Amazon Translate.</p>
 Required parameters: [Type, Id]
 */
@interface AWSTranslateEncryptionKey : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the encryption key being used to encrypt the custom terminology.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The type of encryption key used by Amazon Translate to encrypt custom terminologies.</p>
 */
@property (nonatomic, assign) AWSTranslateEncryptionKeyType types;

@end

/**
 
 */
@interface AWSTranslateGetTerminologyRequest : AWSRequest


/**
 <p>The name of the custom terminology being retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The data format of the custom terminology being retrieved, either CSV or TMX.</p>
 */
@property (nonatomic, assign) AWSTranslateTerminologyDataFormat terminologyDataFormat;

@end

/**
 
 */
@interface AWSTranslateGetTerminologyResponse : AWSModel


/**
 <p>The data location of the custom terminology being retrieved. The custom terminology file is returned in a presigned url that has a 30 minute expiration.</p>
 */
@property (nonatomic, strong) AWSTranslateTerminologyDataLocation * _Nullable terminologyDataLocation;

/**
 <p>The properties of the custom terminology being retrieved.</p>
 */
@property (nonatomic, strong) AWSTranslateTerminologyProperties * _Nullable terminologyProperties;

@end

/**
 
 */
@interface AWSTranslateImportTerminologyRequest : AWSRequest


/**
 <p>The description of the custom terminology being imported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The encryption key for the custom terminology being imported.</p>
 */
@property (nonatomic, strong) AWSTranslateEncryptionKey * _Nullable encryptionKey;

/**
 <p>The merge strategy of the custom terminology being imported. Currently, only the OVERWRITE merge strategy is supported. In this case, the imported terminology will overwrite an existing terminology of the same name.</p>
 */
@property (nonatomic, assign) AWSTranslateMergeStrategy mergeStrategy;

/**
 <p>The name of the custom terminology being imported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The terminology data for the custom terminology being imported.</p>
 */
@property (nonatomic, strong) AWSTranslateTerminologyData * _Nullable terminologyData;

@end

/**
 
 */
@interface AWSTranslateImportTerminologyResponse : AWSModel


/**
 <p>The properties of the custom terminology being imported.</p>
 */
@property (nonatomic, strong) AWSTranslateTerminologyProperties * _Nullable terminologyProperties;

@end

/**
 <p>The input configuration properties for requesting a batch translation job.</p>
 Required parameters: [S3Uri, ContentType]
 */
@interface AWSTranslateInputDataConfig : AWSModel


/**
 <p>The multipurpose internet mail extension (MIME) type of the input files. Valid values are <code>text/plain</code> for plaintext files and <code>text/html</code> for HTML files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The URI of the AWS S3 folder that contains the input file. The folder must be in the same Region as the API endpoint you are calling.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>The number of documents successfully and unsuccessfully processed during a translation job.</p>
 */
@interface AWSTranslateJobDetails : AWSModel


/**
 <p>The number of documents that could not be processed during a translation job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable documentsWithErrorsCount;

/**
 <p>The number of documents used as input in a translation job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable inputDocumentsCount;

/**
 <p>The number of documents successfully processed during a translation job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable translatedDocumentsCount;

@end

/**
 
 */
@interface AWSTranslateListTerminologiesRequest : AWSRequest


/**
 <p>The maximum number of custom terminologies returned per list request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the result of the request to ListTerminologies was truncated, include the NextToken to fetch the next group of custom terminologies. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTranslateListTerminologiesResponse : AWSModel


/**
 <p> If the response to the ListTerminologies was truncated, the NextToken fetches the next group of custom terminologies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The properties list of the custom terminologies returned on the list request.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranslateTerminologyProperties *> * _Nullable terminologyPropertiesList;

@end

/**
 
 */
@interface AWSTranslateListTextTranslationJobsRequest : AWSRequest


/**
 <p>The parameters that specify which batch translation jobs to retrieve. Filters include job name, job status, and submission time. You can only set one filter at a time.</p>
 */
@property (nonatomic, strong) AWSTranslateTextTranslationJobFilter * _Nullable filter;

/**
 <p>The maximum number of results to return in each page. The default value is 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to request the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTranslateListTextTranslationJobsResponse : AWSModel


/**
 <p>The token to use to retreive the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list containing the properties of each job that is returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranslateTextTranslationJobProperties *> * _Nullable textTranslationJobPropertiesList;

@end

/**
 <p>The output configuration properties for a batch translation job.</p>
 Required parameters: [S3Uri]
 */
@interface AWSTranslateOutputDataConfig : AWSModel


/**
 <p>The URI of the S3 folder that contains a translation job's output file. The folder must be in the same Region as the API endpoint that you are calling.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 
 */
@interface AWSTranslateStartTextTranslationJobRequest : AWSRequest


/**
 <p>The client token of the EC2 instance calling the request. This token is auto-generated when using the Amazon Translate SDK. Otherwise, use the <a href="docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html">DescribeInstances</a> EC2 operation to retreive an instance's client token. For more information, see <a href="docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html#client-tokens">Client Tokens</a> in the EC2 User Guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of an AWS Identity Access and Management (IAM) role that grants Amazon Translate read access to your input data. For more nformation, see <a>identity-and-access-management</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Specifies the format and S3 location of the input documents for the translation job.</p>
 */
@property (nonatomic, strong) AWSTranslateInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The name of the batch translation job to be performed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Specifies the S3 folder to which your job output will be saved. </p>
 */
@property (nonatomic, strong) AWSTranslateOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The language code of the input language. For a list of language codes, see <a>what-is-languages</a>.</p><p>Amazon Translate does not automatically detect a source language during batch translation jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLanguageCode;

/**
 <p>The language code of the output language.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetLanguageCodes;

/**
 <p>The name of the terminology to use in the batch translation job. For a list of available terminologies, use the <a>ListTerminologies</a> operation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable terminologyNames;

@end

/**
 
 */
@interface AWSTranslateStartTextTranslationJobResponse : AWSModel


/**
 <p>The identifier generated for the job. To get the status of a job, use this ID with the <a>DescribeTextTranslationJob</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the job. Possible values include:</p><ul><li><p><code>SUBMITTED</code> - The job has been received and is queued for processing.</p></li><li><p><code>IN_PROGRESS</code> - Amazon Translate is processing the job.</p></li><li><p><code>COMPLETED</code> - The job was successfully completed and the output is available.</p></li><li><p><code>COMPLETED_WITH_ERRORS</code> - The job was completed with errors. The errors can be analyzed in the job's output.</p></li><li><p><code>FAILED</code> - The job did not complete. To get details, use the <a>DescribeTextTranslationJob</a> operation.</p></li><li><p><code>STOP_REQUESTED</code> - The user who started the job has requested that it be stopped.</p></li><li><p><code>STOPPED</code> - The job has been stopped.</p></li></ul>
 */
@property (nonatomic, assign) AWSTranslateJobStatus jobStatus;

@end

/**
 
 */
@interface AWSTranslateStopTextTranslationJobRequest : AWSRequest


/**
 <p>The job ID of the job to be stopped.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSTranslateStopTextTranslationJobResponse : AWSModel


/**
 <p>The job ID of the stopped batch translation job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The status of the designated job. Upon successful completion, the job's status will be <code>STOPPED</code>.</p>
 */
@property (nonatomic, assign) AWSTranslateJobStatus jobStatus;

@end

/**
 <p>The term being translated by the custom terminology.</p>
 */
@interface AWSTranslateTerm : AWSModel


/**
 <p>The source text of the term being translated by the custom terminology.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceText;

/**
 <p>The target text of the term being translated by the custom terminology.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetText;

@end

/**
 <p>The data associated with the custom terminology.</p>
 Required parameters: [File, Format]
 */
@interface AWSTranslateTerminologyData : AWSModel


/**
 <p>The file containing the custom terminology data. Your version of the AWS SDK performs a Base64-encoding on this field before sending a request to the AWS service. Users of the SDK should not perform Base64-encoding themselves.</p>
 */
@property (nonatomic, strong) NSData * _Nullable file;

/**
 <p>The data format of the custom terminology. Either CSV or TMX.</p>
 */
@property (nonatomic, assign) AWSTranslateTerminologyDataFormat format;

@end

/**
 <p>The location of the custom terminology data.</p>
 Required parameters: [RepositoryType, Location]
 */
@interface AWSTranslateTerminologyDataLocation : AWSModel


/**
 <p>The location of the custom terminology data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The repository type for the custom terminology data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryType;

@end

/**
 <p>The properties of the custom terminology.</p>
 */
@interface AWSTranslateTerminologyProperties : AWSModel


/**
 <p> The Amazon Resource Name (ARN) of the custom terminology. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The time at which the custom terminology was created, based on the timestamp.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description of the custom terminology properties.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The encryption key for the custom terminology.</p>
 */
@property (nonatomic, strong) AWSTranslateEncryptionKey * _Nullable encryptionKey;

/**
 <p>The time at which the custom terminology was last update, based on the timestamp.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The name of the custom terminology.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The size of the file used when importing a custom terminology.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeBytes;

/**
 <p>The language code for the source text of the translation request for which the custom terminology is being used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLanguageCode;

/**
 <p>The language codes for the target languages available with the custom terminology file. All possible target languages are returned in array.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetLanguageCodes;

/**
 <p>The number of terms included in the custom terminology.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable termCount;

@end

/**
 <p>Provides information for filtering a list of translation jobs. For more information, see <a>ListTextTranslationJobs</a>.</p>
 */
@interface AWSTranslateTextTranslationJobFilter : AWSModel


/**
 <p>Filters the list of jobs by name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>Filters the list of jobs based by job status.</p>
 */
@property (nonatomic, assign) AWSTranslateJobStatus jobStatus;

/**
 <p>Filters the list of jobs based on the time that the job was submitted for processing and returns only the jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submittedAfterTime;

/**
 <p>Filters the list of jobs based on the time that the job was submitted for processing and returns only the jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submittedBeforeTime;

@end

/**
 <p>Provides information about a translation job.</p>
 */
@interface AWSTranslateTextTranslationJobProperties : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of an AWS Identity Access and Management (IAM) role that granted Amazon Translate read access to the job's input data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The time at which the translation job ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The input configuration properties that were specified when the job was requested.</p>
 */
@property (nonatomic, strong) AWSTranslateInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The number of documents successfully and unsuccessfully processed during the translation job.</p>
 */
@property (nonatomic, strong) AWSTranslateJobDetails * _Nullable jobDetails;

/**
 <p>The ID of the translation job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The user-defined name of the translation job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The status of the translation job.</p>
 */
@property (nonatomic, assign) AWSTranslateJobStatus jobStatus;

/**
 <p>An explanation of any errors that may have occured during the translation job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The output configuration properties that were specified when the job was requested.</p>
 */
@property (nonatomic, strong) AWSTranslateOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>The language code of the language of the source text. The language must be a language supported by Amazon Translate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLanguageCode;

/**
 <p>The time at which the translation job was submitted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submittedTime;

/**
 <p>The language code of the language of the target text. The language must be a language supported by Amazon Translate.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetLanguageCodes;

/**
 <p>A list containing the names of the terminologies applied to a translation job. Only one terminology can be applied per <a>StartTextTranslationJob</a> request at this time.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable terminologyNames;

@end

/**
 
 */
@interface AWSTranslateTranslateTextRequest : AWSRequest


/**
 <p>The language code for the language of the source text. The language must be a language supported by Amazon Translate. For a list of language codes, see <a>what-is-languages</a>.</p><p>To have Amazon Translate determine the source language of your text, you can specify <code>auto</code> in the <code>SourceLanguageCode</code> field. If you specify <code>auto</code>, Amazon Translate will call <a href="https://docs.aws.amazon.com/comprehend/latest/dg/comprehend-general.html">Amazon Comprehend</a> to determine the source language.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLanguageCode;

/**
 <p>The language code requested for the language of the target text. The language must be a language supported by Amazon Translate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetLanguageCode;

/**
 <p>The name of the terminology list file to be used in the TranslateText request. You can use 1 terminology list at most in a <code>TranslateText</code> request. Terminology lists can contain a maximum of 256 terms.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable terminologyNames;

/**
 <p>The text to translate. The text string can be a maximum of 5,000 bytes long. Depending on your character set, this may be fewer than 5,000 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSTranslateTranslateTextResponse : AWSModel


/**
 <p>The names of the custom terminologies applied to the input text by Amazon Translate for the translated text response.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranslateAppliedTerminology *> * _Nullable appliedTerminologies;

/**
 <p>The language code for the language of the source text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLanguageCode;

/**
 <p>The language code for the language of the target text. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetLanguageCode;

/**
 <p>The translated text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable translatedText;

@end

NS_ASSUME_NONNULL_END
