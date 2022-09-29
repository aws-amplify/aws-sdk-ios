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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSTranslateErrorDomain;

typedef NS_ENUM(NSInteger, AWSTranslateErrorType) {
    AWSTranslateErrorUnknown,
    AWSTranslateErrorConcurrentModification,
    AWSTranslateErrorConflict,
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
    AWSTranslateErrorTooManyTags,
    AWSTranslateErrorUnsupportedDisplayLanguageCode,
    AWSTranslateErrorUnsupportedLanguagePair,
};

typedef NS_ENUM(NSInteger, AWSTranslateDirectionality) {
    AWSTranslateDirectionalityUnknown,
    AWSTranslateDirectionalityUni,
    AWSTranslateDirectionalityMulti,
};

typedef NS_ENUM(NSInteger, AWSTranslateDisplayLanguageCode) {
    AWSTranslateDisplayLanguageCodeUnknown,
    AWSTranslateDisplayLanguageCodeDe,
    AWSTranslateDisplayLanguageCodeEn,
    AWSTranslateDisplayLanguageCodeEs,
    AWSTranslateDisplayLanguageCodeFr,
    AWSTranslateDisplayLanguageCodeIt,
    AWSTranslateDisplayLanguageCodeJa,
    AWSTranslateDisplayLanguageCodeKo,
    AWSTranslateDisplayLanguageCodePt,
    AWSTranslateDisplayLanguageCodeZh,
    AWSTranslateDisplayLanguageCodeZhTW,
};

typedef NS_ENUM(NSInteger, AWSTranslateEncryptionKeyType) {
    AWSTranslateEncryptionKeyTypeUnknown,
    AWSTranslateEncryptionKeyTypeKms,
};

typedef NS_ENUM(NSInteger, AWSTranslateFormality) {
    AWSTranslateFormalityUnknown,
    AWSTranslateFormalityFormal,
    AWSTranslateFormalityInformal,
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

typedef NS_ENUM(NSInteger, AWSTranslateParallelDataFormat) {
    AWSTranslateParallelDataFormatUnknown,
    AWSTranslateParallelDataFormatTsv,
    AWSTranslateParallelDataFormatCsv,
    AWSTranslateParallelDataFormatTmx,
};

typedef NS_ENUM(NSInteger, AWSTranslateParallelDataStatus) {
    AWSTranslateParallelDataStatusUnknown,
    AWSTranslateParallelDataStatusCreating,
    AWSTranslateParallelDataStatusUpdating,
    AWSTranslateParallelDataStatusActive,
    AWSTranslateParallelDataStatusDeleting,
    AWSTranslateParallelDataStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSTranslateProfanity) {
    AWSTranslateProfanityUnknown,
    AWSTranslateProfanityMask,
};

typedef NS_ENUM(NSInteger, AWSTranslateTerminologyDataFormat) {
    AWSTranslateTerminologyDataFormatUnknown,
    AWSTranslateTerminologyDataFormatCsv,
    AWSTranslateTerminologyDataFormatTmx,
    AWSTranslateTerminologyDataFormatTsv,
};

@class AWSTranslateAppliedTerminology;
@class AWSTranslateCreateParallelDataRequest;
@class AWSTranslateCreateParallelDataResponse;
@class AWSTranslateDeleteParallelDataRequest;
@class AWSTranslateDeleteParallelDataResponse;
@class AWSTranslateDeleteTerminologyRequest;
@class AWSTranslateDescribeTextTranslationJobRequest;
@class AWSTranslateDescribeTextTranslationJobResponse;
@class AWSTranslateEncryptionKey;
@class AWSTranslateGetParallelDataRequest;
@class AWSTranslateGetParallelDataResponse;
@class AWSTranslateGetTerminologyRequest;
@class AWSTranslateGetTerminologyResponse;
@class AWSTranslateImportTerminologyRequest;
@class AWSTranslateImportTerminologyResponse;
@class AWSTranslateInputDataConfig;
@class AWSTranslateJobDetails;
@class AWSTranslateLanguage;
@class AWSTranslateListLanguagesRequest;
@class AWSTranslateListLanguagesResponse;
@class AWSTranslateListParallelDataRequest;
@class AWSTranslateListParallelDataResponse;
@class AWSTranslateListTagsForResourceRequest;
@class AWSTranslateListTagsForResourceResponse;
@class AWSTranslateListTerminologiesRequest;
@class AWSTranslateListTerminologiesResponse;
@class AWSTranslateListTextTranslationJobsRequest;
@class AWSTranslateListTextTranslationJobsResponse;
@class AWSTranslateOutputDataConfig;
@class AWSTranslateParallelDataConfig;
@class AWSTranslateParallelDataDataLocation;
@class AWSTranslateParallelDataProperties;
@class AWSTranslateStartTextTranslationJobRequest;
@class AWSTranslateStartTextTranslationJobResponse;
@class AWSTranslateStopTextTranslationJobRequest;
@class AWSTranslateStopTextTranslationJobResponse;
@class AWSTranslateTag;
@class AWSTranslateTagResourceRequest;
@class AWSTranslateTagResourceResponse;
@class AWSTranslateTerm;
@class AWSTranslateTerminologyData;
@class AWSTranslateTerminologyDataLocation;
@class AWSTranslateTerminologyProperties;
@class AWSTranslateTextTranslationJobFilter;
@class AWSTranslateTextTranslationJobProperties;
@class AWSTranslateTranslateTextRequest;
@class AWSTranslateTranslateTextResponse;
@class AWSTranslateTranslationSettings;
@class AWSTranslateUntagResourceRequest;
@class AWSTranslateUntagResourceResponse;
@class AWSTranslateUpdateParallelDataRequest;
@class AWSTranslateUpdateParallelDataResponse;

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
@interface AWSTranslateCreateParallelDataRequest : AWSRequest


/**
 <p>A unique identifier for the request. This token is automatically generated when you use Amazon Translate through an AWS SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A custom description for the parallel data resource in Amazon Translate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The encryption key used to encrypt this object.</p>
 */
@property (nonatomic, strong) AWSTranslateEncryptionKey * _Nullable encryptionKey;

/**
 <p>A custom name for the parallel data resource in Amazon Translate. You must assign a name that is unique in the account and region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies the format and S3 location of the parallel data input file.</p>
 */
@property (nonatomic, strong) AWSTranslateParallelDataConfig * _Nullable parallelDataConfig;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSTranslateTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSTranslateCreateParallelDataResponse : AWSModel


/**
 <p>The custom name that you assigned to the parallel data resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the parallel data resource. When the resource is ready for you to use, the status is <code>ACTIVE</code>.</p>
 */
@property (nonatomic, assign) AWSTranslateParallelDataStatus status;

@end

/**
 
 */
@interface AWSTranslateDeleteParallelDataRequest : AWSRequest


/**
 <p>The name of the parallel data resource that is being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSTranslateDeleteParallelDataResponse : AWSModel


/**
 <p>The name of the parallel data resource that is being deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the parallel data deletion.</p>
 */
@property (nonatomic, assign) AWSTranslateParallelDataStatus status;

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
 <p>The encryption key used to encrypt this object.</p>
 Required parameters: [Type, Id]
 */
@interface AWSTranslateEncryptionKey : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the encryption key being used to encrypt this object.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The type of encryption key used by Amazon Translate to encrypt this object.</p>
 */
@property (nonatomic, assign) AWSTranslateEncryptionKeyType types;

@end

/**
 
 */
@interface AWSTranslateGetParallelDataRequest : AWSRequest


/**
 <p>The name of the parallel data resource that is being retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSTranslateGetParallelDataResponse : AWSModel


/**
 <p>The Amazon S3 location of a file that provides any errors or warnings that were produced by your input file. This file was created when Amazon Translate attempted to create a parallel data resource. The location is returned as a presigned URL to that has a 30-minute expiration.</p>
 */
@property (nonatomic, strong) AWSTranslateParallelDataDataLocation * _Nullable auxiliaryDataLocation;

/**
 <p>The Amazon S3 location of the most recent parallel data input file that was successfully imported into Amazon Translate. The location is returned as a presigned URL that has a 30-minute expiration.</p><important><p>Amazon Translate doesn't scan all input files for the risk of CSV injection attacks. </p><p>CSV injection occurs when a .csv or .tsv file is altered so that a record contains malicious code. The record begins with a special character, such as =, +, -, or @. When the file is opened in a spreadsheet program, the program might interpret the record as a formula and run the code within it.</p><p>Before you download an input file from Amazon S3, ensure that you recognize the file and trust its creator.</p></important>
 */
@property (nonatomic, strong) AWSTranslateParallelDataDataLocation * _Nullable dataLocation;

/**
 <p>The Amazon S3 location of a file that provides any errors or warnings that were produced by your input file. This file was created when Amazon Translate attempted to update a parallel data resource. The location is returned as a presigned URL to that has a 30-minute expiration.</p>
 */
@property (nonatomic, strong) AWSTranslateParallelDataDataLocation * _Nullable latestUpdateAttemptAuxiliaryDataLocation;

/**
 <p>The properties of the parallel data resource that is being retrieved.</p>
 */
@property (nonatomic, strong) AWSTranslateParallelDataProperties * _Nullable parallelDataProperties;

@end

/**
 
 */
@interface AWSTranslateGetTerminologyRequest : AWSRequest


/**
 <p>The name of the custom terminology being retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The data format of the custom terminology being retrieved.</p><p>If you don't specify this parameter, Amazon Translate returns a file with the same format as the file that was imported to create the terminology. </p><p>If you specify this parameter when you retrieve a multi-directional terminology resource, you must specify the same format as the input file that was imported to create it. Otherwise, Amazon Translate throws an error.</p>
 */
@property (nonatomic, assign) AWSTranslateTerminologyDataFormat terminologyDataFormat;

@end

/**
 
 */
@interface AWSTranslateGetTerminologyResponse : AWSModel


/**
 <p>The Amazon S3 location of a file that provides any errors or warnings that were produced by your input file. This file was created when Amazon Translate attempted to create a terminology resource. The location is returned as a presigned URL to that has a 30-minute expiration.</p>
 */
@property (nonatomic, strong) AWSTranslateTerminologyDataLocation * _Nullable auxiliaryDataLocation;

/**
 <p>The Amazon S3 location of the most recent custom terminology input file that was successfully imported into Amazon Translate. The location is returned as a presigned URL that has a 30-minute expiration.</p><important><p>Amazon Translate doesn't scan all input files for the risk of CSV injection attacks. </p><p>CSV injection occurs when a .csv or .tsv file is altered so that a record contains malicious code. The record begins with a special character, such as =, +, -, or @. When the file is opened in a spreadsheet program, the program might interpret the record as a formula and run the code within it.</p><p>Before you download an input file from Amazon S3, ensure that you recognize the file and trust its creator.</p></important>
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
 
 */
@property (nonatomic, strong) NSArray<AWSTranslateTag *> * _Nullable tags;

/**
 <p>The terminology data for the custom terminology being imported.</p>
 */
@property (nonatomic, strong) AWSTranslateTerminologyData * _Nullable terminologyData;

@end

/**
 
 */
@interface AWSTranslateImportTerminologyResponse : AWSModel


/**
 <p>The Amazon S3 location of a file that provides any errors or warnings that were produced by your input file. This file was created when Amazon Translate attempted to create a terminology resource. The location is returned as a presigned URL to that has a 30 minute expiration.</p>
 */
@property (nonatomic, strong) AWSTranslateTerminologyDataLocation * _Nullable auxiliaryDataLocation;

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
 <p>Describes the format of the data that you submit to Amazon Translate as input. You can specify one of the following multipurpose internet mail extension (MIME) types:</p><ul><li><p><code>text/html</code>: The input data consists of one or more HTML files. Amazon Translate translates only the text that resides in the <code>html</code> element in each file.</p></li><li><p><code>text/plain</code>: The input data consists of one or more unformatted text files. Amazon Translate translates every character in this type of input.</p></li><li><p><code>application/vnd.openxmlformats-officedocument.wordprocessingml.document</code>: The input data consists of one or more Word documents (.docx).</p></li><li><p><code>application/vnd.openxmlformats-officedocument.presentationml.presentation</code>: The input data consists of one or more PowerPoint Presentation files (.pptx).</p></li><li><p><code>application/vnd.openxmlformats-officedocument.spreadsheetml.sheet</code>: The input data consists of one or more Excel Workbook files (.xlsx).</p></li><li><p><code>application/x-xliff+xml</code>: The input data consists of one or more XML Localization Interchange File Format (XLIFF) files (.xlf). Amazon Translate supports only XLIFF version 1.2.</p></li></ul><important><p>If you structure your input data as HTML, ensure that you set this parameter to <code>text/html</code>. By doing so, you cut costs by limiting the translation to the contents of the <code>html</code> element in each file. Otherwise, if you set this parameter to <code>text/plain</code>, your costs will cover the translation of every character.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The URI of the AWS S3 folder that contains the input files. Amazon Translate translates all the files in the folder. The folder must be in the same Region as the API endpoint you are calling.</p><note><p>The URI can also point to a single input document, or it can provide the prefix for a collection of input documents. For example. if you use the URI <code>S3://bucketName/prefix</code> and the prefix is a single file, Amazon Translate uses that files as input. If more than one file begins with the prefix, Amazon Translate uses all of them as input.</p></note>
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
 <p>A supported language.</p>
 Required parameters: [LanguageName, LanguageCode]
 */
@interface AWSTranslateLanguage : AWSModel


/**
 <p>Language code for the supported language.</p>
 */
@property (nonatomic, strong) NSString * _Nullable languageCode;

/**
 <p>Language name of the supported language.</p>
 */
@property (nonatomic, strong) NSString * _Nullable languageName;

@end

/**
 
 */
@interface AWSTranslateListLanguagesRequest : AWSRequest


/**
 <p>The language code for the language to use to display the language names in the response. The language code is <code>en</code> by default. </p>
 */
@property (nonatomic, assign) AWSTranslateDisplayLanguageCode displayLanguageCode;

/**
 <p>The maximum number of results to return in each response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Include the NextToken value to fetch the next group of supported languages. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTranslateListLanguagesResponse : AWSModel


/**
 <p>The language code passed in with the request.</p>
 */
@property (nonatomic, assign) AWSTranslateDisplayLanguageCode displayLanguageCode;

/**
 <p>The list of supported languages.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranslateLanguage *> * _Nullable languages;

/**
 <p> If the response does not include all remaining results, use the NextToken in the next request to fetch the next group of supported languages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTranslateListParallelDataRequest : AWSRequest


/**
 <p>The maximum number of parallel data resources returned for each request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A string that specifies the next page of results to return in a paginated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTranslateListParallelDataResponse : AWSModel


/**
 <p>The string to use in a subsequent request to get the next page of results in a paginated response. This value is null if there are no additional pages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The properties of the parallel data resources returned by this request.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranslateParallelDataProperties *> * _Nullable parallelDataPropertiesList;

@end

/**
 
 */
@interface AWSTranslateListTagsForResourceRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSTranslateListTagsForResourceResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSTranslateTag *> * _Nullable tags;

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
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
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
 <p>The encryption key used to encrypt this object.</p>
 */
@property (nonatomic, strong) AWSTranslateEncryptionKey * _Nullable encryptionKey;

/**
 <p>The URI of the S3 folder that contains a translation job's output file. The folder must be in the same Region as the API endpoint that you are calling.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>Specifies the format and S3 location of the parallel data input file.</p>
 Required parameters: [S3Uri, Format]
 */
@interface AWSTranslateParallelDataConfig : AWSModel


/**
 <p>The format of the parallel data input file.</p>
 */
@property (nonatomic, assign) AWSTranslateParallelDataFormat format;

/**
 <p>The URI of the Amazon S3 folder that contains the parallel data input file. The folder must be in the same Region as the API endpoint you are calling.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

@end

/**
 <p>The location of the most recent parallel data input file that was successfully imported into Amazon Translate.</p>
 Required parameters: [RepositoryType, Location]
 */
@interface AWSTranslateParallelDataDataLocation : AWSModel


/**
 <p>The Amazon S3 location of the parallel data input file. The location is returned as a presigned URL to that has a 30-minute expiration.</p><important><p>Amazon Translate doesn't scan all input files for the risk of CSV injection attacks. </p><p>CSV injection occurs when a .csv or .tsv file is altered so that a record contains malicious code. The record begins with a special character, such as =, +, -, or @. When the file is opened in a spreadsheet program, the program might interpret the record as a formula and run the code within it.</p><p>Before you download an input file from Amazon S3, ensure that you recognize the file and trust its creator.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>Describes the repository that contains the parallel data input file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable repositoryType;

@end

/**
 <p>The properties of a parallel data resource.</p>
 */
@interface AWSTranslateParallelDataProperties : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the parallel data resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The time at which the parallel data resource was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description assigned to the parallel data resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The encryption key used to encrypt this object.</p>
 */
@property (nonatomic, strong) AWSTranslateEncryptionKey * _Nullable encryptionKey;

/**
 <p>The number of records unsuccessfully imported from the parallel data input file.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedRecordCount;

/**
 <p>The number of UTF-8 characters that Amazon Translate imported from the parallel data input file. This number includes only the characters in your translation examples. It does not include characters that are used to format your file. For example, if you provided a Translation Memory Exchange (.tmx) file, this number does not include the tags.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable importedDataSize;

/**
 <p>The number of records successfully imported from the parallel data input file.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable importedRecordCount;

/**
 <p>The time at which the parallel data resource was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>The time that the most recent update was attempted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable latestUpdateAttemptAt;

/**
 <p>The status of the most recent update attempt for the parallel data resource.</p>
 */
@property (nonatomic, assign) AWSTranslateParallelDataStatus latestUpdateAttemptStatus;

/**
 <p>Additional information from Amazon Translate about the parallel data resource. </p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The custom name assigned to the parallel data resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies the format and S3 location of the parallel data input file.</p>
 */
@property (nonatomic, strong) AWSTranslateParallelDataConfig * _Nullable parallelDataConfig;

/**
 <p>The number of items in the input file that Amazon Translate skipped when you created or updated the parallel data resource. For example, Amazon Translate skips empty records, empty target texts, and empty lines.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable skippedRecordCount;

/**
 <p>The source language of the translations in the parallel data file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLanguageCode;

/**
 <p>The status of the parallel data resource. When the parallel data is ready for you to use, the status is <code>ACTIVE</code>.</p>
 */
@property (nonatomic, assign) AWSTranslateParallelDataStatus status;

/**
 <p>The language codes for the target languages available in the parallel data file. All possible target languages are returned as an array.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetLanguageCodes;

@end

/**
 
 */
@interface AWSTranslateStartTextTranslationJobRequest : AWSRequest


/**
 <p>A unique identifier for the request. This token is generated for you when using the Amazon Translate SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of an AWS Identity Access and Management (IAM) role that grants Amazon Translate read access to your input data. For more information, see <a>identity-and-access-management</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Specifies the format and location of the input documents for the translation job.</p>
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
 <p>The name of a parallel data resource to add to the translation job. This resource consists of examples that show how you want segments of text to be translated. When you add parallel data to a translation job, you create an <i>Active Custom Translation</i> job. </p><p>This parameter accepts only one parallel data resource.</p><note><p>Active Custom Translation jobs are priced at a higher rate than other jobs that don't use parallel data. For more information, see <a href="http://aws.amazon.com/translate/pricing/">Amazon Translate pricing</a>.</p></note><p>For a list of available parallel data resources, use the <a>ListParallelData</a> operation.</p><p>For more information, see <a>customizing-translations-parallel-data</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable parallelDataNames;

/**
 <p>Settings to configure your translation output, including the option to mask profane words and phrases. <code>StartTextTranslationJob</code> does not support the formality setting.</p>
 */
@property (nonatomic, strong) AWSTranslateTranslationSettings * _Nullable settings;

/**
 <p>The language code of the input language. For a list of language codes, see <a>what-is-languages</a>.</p><p>Amazon Translate does not automatically detect a source language during batch translation jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLanguageCode;

/**
 <p>The language code of the output language.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetLanguageCodes;

/**
 <p>The name of a custom terminology resource to add to the translation job. This resource lists examples source terms and the desired translation for each term.</p><p>This parameter accepts only one custom terminology resource.</p><p>For a list of available custom terminology resources, use the <a>ListTerminologies</a> operation.</p><p>For more information, see <a>how-custom-terminology</a>.</p>
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
 <p>The status of the job. Possible values include:</p><ul><li><p><code>SUBMITTED</code> - The job has been received and is queued for processing.</p></li><li><p><code>IN_PROGRESS</code> - Amazon Translate is processing the job.</p></li><li><p><code>COMPLETED</code> - The job was successfully completed and the output is available.</p></li><li><p><code>COMPLETED_WITH_ERROR</code> - The job was completed with errors. The errors can be analyzed in the job's output.</p></li><li><p><code>FAILED</code> - The job did not complete. To get details, use the <a>DescribeTextTranslationJob</a> operation.</p></li><li><p><code>STOP_REQUESTED</code> - The user who started the job has requested that it be stopped.</p></li><li><p><code>STOPPED</code> - The job has been stopped.</p></li></ul>
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
 
 */
@interface AWSTranslateTag : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSTranslateTagResourceRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSTranslateTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSTranslateTagResourceResponse : AWSModel


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
 <p>The data associated with the custom terminology. For information about the custom terminology file, see <a href="https://docs.aws.amazon.com/translate/latest/dg/creating-custom-terminology.html"> Creating a Custom Terminology</a>.</p>
 Required parameters: [File, Format]
 */
@interface AWSTranslateTerminologyData : AWSModel


/**
 <p>The directionality of your terminology resource indicates whether it has one source language (uni-directional) or multiple (multi-directional).</p><dl><dt>UNI</dt><dd><p>The terminology resource has one source language (for example, the first column in a CSV file), and all of its other languages are target languages. </p></dd><dt>MULTI</dt><dd><p>Any language in the terminology resource can be the source language or a target language. A single multi-directional terminology resource can be used for jobs that translate different language pairs. For example, if the terminology contains English and Spanish terms, it can be used for jobs that translate English to Spanish and Spanish to English.</p></dd></dl><p>When you create a custom terminology resource without specifying the directionality, it behaves as uni-directional terminology, although this parameter will have a null value.</p>
 */
@property (nonatomic, assign) AWSTranslateDirectionality directionality;

/**
 <p>The file containing the custom terminology data. Your version of the AWS SDK performs a Base64-encoding on this field before sending a request to the AWS service. Users of the SDK should not perform Base64-encoding themselves.</p>
 */
@property (nonatomic, strong) NSData * _Nullable file;

/**
 <p>The data format of the custom terminology.</p>
 */
@property (nonatomic, assign) AWSTranslateTerminologyDataFormat format;

@end

/**
 <p>The location of the custom terminology data.</p>
 Required parameters: [RepositoryType, Location]
 */
@interface AWSTranslateTerminologyDataLocation : AWSModel


/**
 <p>The Amazon S3 location of the most recent custom terminology input file that was successfully imported into Amazon Translate. The location is returned as a presigned URL that has a 30-minute expiration .</p><important><p>Amazon Translate doesn't scan all input files for the risk of CSV injection attacks. </p><p>CSV injection occurs when a .csv or .tsv file is altered so that a record contains malicious code. The record begins with a special character, such as =, +, -, or @. When the file is opened in a spreadsheet program, the program might interpret the record as a formula and run the code within it.</p><p>Before you download an input file from Amazon S3, ensure that you recognize the file and trust its creator.</p></important>
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
 <p>The directionality of your terminology resource indicates whether it has one source language (uni-directional) or multiple (multi-directional). </p><dl><dt>UNI</dt><dd><p>The terminology resource has one source language (the first column in a CSV file), and all of its other languages are target languages.</p></dd><dt>MULTI</dt><dd><p>Any language in the terminology resource can be the source language.</p></dd></dl>
 */
@property (nonatomic, assign) AWSTranslateDirectionality directionality;

/**
 <p>The encryption key for the custom terminology.</p>
 */
@property (nonatomic, strong) AWSTranslateEncryptionKey * _Nullable encryptionKey;

/**
 <p>The format of the custom terminology input file.</p>
 */
@property (nonatomic, assign) AWSTranslateTerminologyDataFormat format;

/**
 <p>The time at which the custom terminology was last update, based on the timestamp.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedAt;

/**
 <p>Additional information from Amazon Translate about the terminology resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The name of the custom terminology.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The size of the file used when importing a custom terminology.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeBytes;

/**
 <p>The number of terms in the input file that Amazon Translate skipped when you created or updated the terminology resource.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable skippedTermCount;

/**
 <p>The language code for the source text of the translation request for which the custom terminology is being used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceLanguageCode;

/**
 <p>The language codes for the target languages available with the custom terminology resource. All possible target languages are returned in array.</p>
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
 <p>An explanation of any errors that may have occurred during the translation job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The output configuration properties that were specified when the job was requested.</p>
 */
@property (nonatomic, strong) AWSTranslateOutputDataConfig * _Nullable outputDataConfig;

/**
 <p>A list containing the names of the parallel data resources applied to the translation job.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable parallelDataNames;

/**
 <p>Settings that configure the translation output.</p>
 */
@property (nonatomic, strong) AWSTranslateTranslationSettings * _Nullable settings;

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
 <p>Settings to configure your translation output, including the option to set the formality level of the output text and the option to mask profane words and phrases.</p>
 */
@property (nonatomic, strong) AWSTranslateTranslationSettings * _Nullable settings;

/**
 <p>The language code for the language of the source text. The language must be a language supported by Amazon Translate. For a list of language codes, see <a>what-is-languages</a>.</p><p>To have Amazon Translate determine the source language of your text, you can specify <code>auto</code> in the <code>SourceLanguageCode</code> field. If you specify <code>auto</code>, Amazon Translate will call <a href="https://docs.aws.amazon.com/comprehend/latest/dg/comprehend-general.html">Amazon Comprehend</a> to determine the source language.</p><note><p>If you specify <code>auto</code>, you must send the <code>TranslateText</code> request in a region that supports Amazon Comprehend. Otherwise, the request returns an error indicating that autodetect is not supported. </p></note>
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
 <p>Settings that configure the translation output.</p>
 */
@property (nonatomic, strong) AWSTranslateTranslationSettings * _Nullable appliedSettings;

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

/**
 <p>Settings that configure the translation output.</p>
 */
@interface AWSTranslateTranslationSettings : AWSModel


/**
 <p>You can optionally specify the desired level of formality for real-time translations to supported target languages. The formality setting controls the level of formal language usage (also known as <a href="https://en.wikipedia.org/wiki/Register_(sociolinguistics)">register</a>) in the translation output. You can set the value to informal or formal. If you don't specify a value for formality, or if the target language doesn't support formality, the translation will ignore the formality setting.</p><p>Note that asynchronous translation jobs don't support formality. If you provide a value for formality, the <code>StartTextTranslationJob</code> API throws an exception (InvalidRequestException).</p><p>For target languages that support formality, see <a href="https://docs.aws.amazon.com/translate/latest/dg/what-is.html">Supported Languages and Language Codes in the Amazon Translate Developer Guide</a>.</p>
 */
@property (nonatomic, assign) AWSTranslateFormality formality;

/**
 <p>Enable the profanity setting if you want Amazon Translate to mask profane words and phrases in your translation output.</p><p>To mask profane words and phrases, Amazon Translate replaces them with the grawlix string “?$#@$“. This 5-character sequence is used for each profane word or phrase, regardless of the length or number of words.</p><p>Amazon Translate doesn't detect profanity in all of its supported languages. For languages that support profanity detection, see <a href="https://docs.aws.amazon.com/translate/latest/dg/what-is.html">Supported Languages and Language Codes in the Amazon Translate Developer Guide</a>.</p>
 */
@property (nonatomic, assign) AWSTranslateProfanity profanity;

@end

/**
 
 */
@interface AWSTranslateUntagResourceRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSTranslateUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSTranslateUpdateParallelDataRequest : AWSRequest


/**
 <p>A unique identifier for the request. This token is automatically generated when you use Amazon Translate through an AWS SDK.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A custom description for the parallel data resource in Amazon Translate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the parallel data resource being updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies the format and S3 location of the parallel data input file.</p>
 */
@property (nonatomic, strong) AWSTranslateParallelDataConfig * _Nullable parallelDataConfig;

@end

/**
 
 */
@interface AWSTranslateUpdateParallelDataResponse : AWSModel


/**
 <p>The time that the most recent update was attempted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable latestUpdateAttemptAt;

/**
 <p>The status of the parallel data update attempt. When the updated parallel data resource is ready for you to use, the status is <code>ACTIVE</code>.</p>
 */
@property (nonatomic, assign) AWSTranslateParallelDataStatus latestUpdateAttemptStatus;

/**
 <p>The name of the parallel data resource being updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the parallel data resource that you are attempting to update. Your update request is accepted only if this status is either <code>ACTIVE</code> or <code>FAILED</code>.</p>
 */
@property (nonatomic, assign) AWSTranslateParallelDataStatus status;

@end

NS_ASSUME_NONNULL_END
