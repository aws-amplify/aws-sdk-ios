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

FOUNDATION_EXPORT NSString *const AWSTranscribeErrorDomain;

typedef NS_ENUM(NSInteger, AWSTranscribeErrorType) {
    AWSTranscribeErrorUnknown,
    AWSTranscribeErrorBadRequest,
    AWSTranscribeErrorConflict,
    AWSTranscribeErrorInternalFailure,
    AWSTranscribeErrorLimitExceeded,
    AWSTranscribeErrorNotFound,
};

typedef NS_ENUM(NSInteger, AWSTranscribeLanguageCode) {
    AWSTranscribeLanguageCodeUnknown,
    AWSTranscribeLanguageCodeEnUS,
    AWSTranscribeLanguageCodeEsUS,
    AWSTranscribeLanguageCodeEnAU,
    AWSTranscribeLanguageCodeFrCA,
    AWSTranscribeLanguageCodeEnGB,
    AWSTranscribeLanguageCodeDeDE,
    AWSTranscribeLanguageCodePtBR,
    AWSTranscribeLanguageCodeFrFR,
    AWSTranscribeLanguageCodeItIT,
    AWSTranscribeLanguageCodeKoKR,
    AWSTranscribeLanguageCodeEsES,
    AWSTranscribeLanguageCodeEnIN,
    AWSTranscribeLanguageCodeHiIN,
    AWSTranscribeLanguageCodeArSA,
    AWSTranscribeLanguageCodeRuRU,
    AWSTranscribeLanguageCodeZhCN,
    AWSTranscribeLanguageCodeNlNL,
    AWSTranscribeLanguageCodeIdID,
    AWSTranscribeLanguageCodeTaIN,
    AWSTranscribeLanguageCodeFaIR,
    AWSTranscribeLanguageCodeEnIE,
    AWSTranscribeLanguageCodeEnAB,
    AWSTranscribeLanguageCodeEnWL,
    AWSTranscribeLanguageCodePtPT,
    AWSTranscribeLanguageCodeTeIN,
    AWSTranscribeLanguageCodeTrTR,
    AWSTranscribeLanguageCodeDeCH,
    AWSTranscribeLanguageCodeHeIL,
    AWSTranscribeLanguageCodeMsMY,
    AWSTranscribeLanguageCodeJaJP,
    AWSTranscribeLanguageCodeArAE,
};

typedef NS_ENUM(NSInteger, AWSTranscribeMediaFormat) {
    AWSTranscribeMediaFormatUnknown,
    AWSTranscribeMediaFormatMp3,
    AWSTranscribeMediaFormatMp4,
    AWSTranscribeMediaFormatWav,
    AWSTranscribeMediaFormatFlac,
};

typedef NS_ENUM(NSInteger, AWSTranscribeOutputLocationType) {
    AWSTranscribeOutputLocationTypeUnknown,
    AWSTranscribeOutputLocationTypeCustomerBucket,
    AWSTranscribeOutputLocationTypeServiceBucket,
};

typedef NS_ENUM(NSInteger, AWSTranscribeRedactionOutput) {
    AWSTranscribeRedactionOutputUnknown,
    AWSTranscribeRedactionOutputRedacted,
    AWSTranscribeRedactionOutputRedactedAndUnredacted,
};

typedef NS_ENUM(NSInteger, AWSTranscribeRedactionType) {
    AWSTranscribeRedactionTypeUnknown,
    AWSTranscribeRedactionTypePii,
};

typedef NS_ENUM(NSInteger, AWSTranscribeTranscriptionJobStatus) {
    AWSTranscribeTranscriptionJobStatusUnknown,
    AWSTranscribeTranscriptionJobStatusQueued,
    AWSTranscribeTranscriptionJobStatusInProgress,
    AWSTranscribeTranscriptionJobStatusFailed,
    AWSTranscribeTranscriptionJobStatusCompleted,
};

typedef NS_ENUM(NSInteger, AWSTranscribeVocabularyFilterMethod) {
    AWSTranscribeVocabularyFilterMethodUnknown,
    AWSTranscribeVocabularyFilterMethodRemove,
    AWSTranscribeVocabularyFilterMethodMask,
};

typedef NS_ENUM(NSInteger, AWSTranscribeVocabularyState) {
    AWSTranscribeVocabularyStateUnknown,
    AWSTranscribeVocabularyStatePending,
    AWSTranscribeVocabularyStateReady,
    AWSTranscribeVocabularyStateFailed,
};

@class AWSTranscribeContentRedaction;
@class AWSTranscribeCreateVocabularyFilterRequest;
@class AWSTranscribeCreateVocabularyFilterResponse;
@class AWSTranscribeCreateVocabularyRequest;
@class AWSTranscribeCreateVocabularyResponse;
@class AWSTranscribeDeleteTranscriptionJobRequest;
@class AWSTranscribeDeleteVocabularyFilterRequest;
@class AWSTranscribeDeleteVocabularyRequest;
@class AWSTranscribeGetTranscriptionJobRequest;
@class AWSTranscribeGetTranscriptionJobResponse;
@class AWSTranscribeGetVocabularyFilterRequest;
@class AWSTranscribeGetVocabularyFilterResponse;
@class AWSTranscribeGetVocabularyRequest;
@class AWSTranscribeGetVocabularyResponse;
@class AWSTranscribeJobExecutionSettings;
@class AWSTranscribeListTranscriptionJobsRequest;
@class AWSTranscribeListTranscriptionJobsResponse;
@class AWSTranscribeListVocabulariesRequest;
@class AWSTranscribeListVocabulariesResponse;
@class AWSTranscribeListVocabularyFiltersRequest;
@class AWSTranscribeListVocabularyFiltersResponse;
@class AWSTranscribeMedia;
@class AWSTranscribeSettings;
@class AWSTranscribeStartTranscriptionJobRequest;
@class AWSTranscribeStartTranscriptionJobResponse;
@class AWSTranscribeTranscript;
@class AWSTranscribeTranscriptionJob;
@class AWSTranscribeTranscriptionJobSummary;
@class AWSTranscribeUpdateVocabularyFilterRequest;
@class AWSTranscribeUpdateVocabularyFilterResponse;
@class AWSTranscribeUpdateVocabularyRequest;
@class AWSTranscribeUpdateVocabularyResponse;
@class AWSTranscribeVocabularyFilterInfo;
@class AWSTranscribeVocabularyInfo;

/**
 <p>Settings for content redaction within a transcription job.</p><p>You can redact transcripts in US English (en-us). For more information see: <a href="https://docs.aws.amazon.com/transcribe/latest/dg/content-redaction.html">Automatic Content Redaction</a></p>
 Required parameters: [RedactionType, RedactionOutput]
 */
@interface AWSTranscribeContentRedaction : AWSModel


/**
 <p>Request parameter where you choose whether to output only the redacted transcript or generate an additional unredacted transcript.</p><p>When you choose <code>redacted</code> Amazon Transcribe outputs a JSON file with only the redacted transcript and related information.</p><p>When you choose <code>redacted_and_unredacted</code> Amazon Transcribe outputs a JSON file with the unredacted transcript and related information in addition to the JSON file with the redacted transcript.</p>
 */
@property (nonatomic, assign) AWSTranscribeRedactionOutput redactionOutput;

/**
 <p>Request parameter that defines the entities to be redacted. The only accepted value is <code>PII</code>.</p>
 */
@property (nonatomic, assign) AWSTranscribeRedactionType redactionType;

@end

/**
 
 */
@interface AWSTranscribeCreateVocabularyFilterRequest : AWSRequest


/**
 <p>The language code of the words in the vocabulary filter. All words in the filter must be in the same language. The vocabulary filter can only be used with transcription jobs in the specified language.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character Sets for Custom Vocabularies</a>.</p><p>The specified file must be less than 50 KB of UTF-8 characters.</p><p>If you provide the location of a list of words in the <code>VocabularyFilterFileUri</code> parameter, you can't use the <code>Words</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterFileUri;

/**
 <p>The vocabulary filter name. The name must be unique within the account that contains it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

/**
 <p>The words to use in the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character Sets for Custom Vocabularies</a>.</p><p>If you provide a list of words in the <code>Words</code> parameter, you can't use the <code>VocabularyFilterFileUri</code> parameter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable words;

@end

/**
 
 */
@interface AWSTranscribeCreateVocabularyFilterResponse : AWSModel


/**
 <p>The language code of the words in the collection.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time that the vocabulary filter was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the vocabulary filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

@end

/**
 
 */
@interface AWSTranscribeCreateVocabularyRequest : AWSRequest


/**
 <p>The language code of the vocabulary entries.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>An array of strings that contains the vocabulary entries. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable phrases;

/**
 <p>The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is </p><p><code> https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code></p><p>For example:</p><p><code>https://s3.us-east-1.amazonaws.com/examplebucket/vocab.txt</code></p><p>For more information about S3 object names, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p><p>For more information about custom vocabularies, see <a href="http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary">Custom Vocabularies</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFileUri;

/**
 <p>The name of the vocabulary. The name must be unique within an AWS account. The name is case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeCreateVocabularyResponse : AWSModel


/**
 <p>If the <code>VocabularyState</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The language code of the vocabulary entries.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time that the vocabulary was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

/**
 <p>The processing state of the vocabulary. When the <code>VocabularyState</code> field contains <code>READY</code> the vocabulary is ready to be used in a <code>StartTranscriptionJob</code> request.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyState vocabularyState;

@end

/**
 
 */
@interface AWSTranscribeDeleteTranscriptionJobRequest : AWSRequest


/**
 <p>The name of the transcription job to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcriptionJobName;

@end

/**
 
 */
@interface AWSTranscribeDeleteVocabularyFilterRequest : AWSRequest


/**
 <p>The name of the vocabulary filter to remove.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

@end

/**
 
 */
@interface AWSTranscribeDeleteVocabularyRequest : AWSRequest


/**
 <p>The name of the vocabulary to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeGetTranscriptionJobRequest : AWSRequest


/**
 <p>The name of the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcriptionJobName;

@end

/**
 
 */
@interface AWSTranscribeGetTranscriptionJobResponse : AWSModel


/**
 <p>An object that contains the results of the transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeTranscriptionJob * _Nullable transcriptionJob;

@end

/**
 
 */
@interface AWSTranscribeGetVocabularyFilterRequest : AWSRequest


/**
 <p>The name of the vocabulary filter for which to return information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

@end

/**
 
 */
@interface AWSTranscribeGetVocabularyFilterResponse : AWSModel


/**
 <p>The URI of the list of words in the vocabulary filter. You can use this URI to get the list of words.</p>
 */
@property (nonatomic, strong) NSString * _Nullable downloadUri;

/**
 <p>The language code of the words in the vocabulary filter.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time that the contents of the vocabulary filter were updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the vocabulary filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

@end

/**
 
 */
@interface AWSTranscribeGetVocabularyRequest : AWSRequest


/**
 <p>The name of the vocabulary to return information about. The name is case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeGetVocabularyResponse : AWSModel


/**
 <p>The S3 location where the vocabulary is stored. Use this URI to get the contents of the vocabulary. The URI is available for a limited time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable downloadUri;

/**
 <p>If the <code>VocabularyState</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The language code of the vocabulary entries.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time that the vocabulary was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the vocabulary to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

/**
 <p>The processing state of the vocabulary.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyState vocabularyState;

@end

/**
 <p>Provides information about when a transcription job should be executed.</p>
 */
@interface AWSTranscribeJobExecutionSettings : AWSModel


/**
 <p>Indicates whether a job should be queued by Amazon Transcribe when the concurrent execution limit is exceeded. When the <code>AllowDeferredExecution</code> field is true, jobs are queued and will be executed when the number of executing jobs falls below the concurrent execution limit. If the field is false, Amazon Transcribe returns a <code>LimitExceededException</code> exception.</p><p>If you specify the <code>AllowDeferredExecution</code> field, you must specify the <code>DataAccessRoleArn</code> field.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowDeferredExecution;

/**
 <p>The Amazon Resource Name (ARN) of a role that has access to the S3 bucket that contains the input files. Amazon Transcribe will assume this role to read queued media files. If you have specified an output S3 bucket for the transcription results, this role should have access to the output bucket as well.</p><p>If you specify the <code>AllowDeferredExecution</code> field, you must specify the <code>DataAccessRoleArn</code> field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

@end

/**
 
 */
@interface AWSTranscribeListTranscriptionJobsRequest : AWSRequest


/**
 <p>When specified, the jobs returned in the list are limited to jobs whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobNameContains;

/**
 <p>The maximum number of jobs to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the result of the previous request to <code>ListTranscriptionJobs</code> was truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>When specified, returns only transcription jobs with the specified status. Jobs are ordered by creation date, with the newest jobs returned first. If you don’t specify a status, Amazon Transcribe returns all transcription jobs ordered by creation date. </p>
 */
@property (nonatomic, assign) AWSTranscribeTranscriptionJobStatus status;

@end

/**
 
 */
@interface AWSTranscribeListTranscriptionJobsResponse : AWSModel


/**
 <p>The <code>ListTranscriptionJobs</code> operation returns a page of jobs at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListTranscriptionJobs</code> operation to return in the next page of jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The requested status of the jobs returned.</p>
 */
@property (nonatomic, assign) AWSTranscribeTranscriptionJobStatus status;

/**
 <p>A list of objects containing summary information for a transcription job.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeTranscriptionJobSummary *> * _Nullable transcriptionJobSummaries;

@end

/**
 
 */
@interface AWSTranscribeListVocabulariesRequest : AWSRequest


/**
 <p>The maximum number of vocabularies to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>When specified, the vocabularies returned in the list are limited to vocabularies whose name contains the specified string. The search is case-insensitive, <code>ListVocabularies</code> will return both "vocabularyname" and "VocabularyName" in the response list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of the previous request to <code>ListVocabularies</code> was truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>When specified, only returns vocabularies with the <code>VocabularyState</code> field equal to the specified state.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyState stateEquals;

@end

/**
 
 */
@interface AWSTranscribeListVocabulariesResponse : AWSModel


/**
 <p>The <code>ListVocabularies</code> operation returns a page of vocabularies at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListVocabularies</code> operation to return in the next page of jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The requested vocabulary state.</p>
 */
@property (nonatomic, assign) AWSTranscribeTranscriptionJobStatus status;

/**
 <p>A list of objects that describe the vocabularies that match the search criteria in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeVocabularyInfo *> * _Nullable vocabularies;

@end

/**
 
 */
@interface AWSTranscribeListVocabularyFiltersRequest : AWSRequest


/**
 <p>The maximum number of filters to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Filters the response so that it only contains vocabulary filters whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of the previous request to <code>ListVocabularyFilters</code> was truncated, include the <code>NextToken</code> to fetch the next set of collections.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTranscribeListVocabularyFiltersResponse : AWSModel


/**
 <p>The <code>ListVocabularyFilters</code> operation returns a page of collections at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListVocabularyFilters</code> operation to return in the next page of jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of vocabulary filters. It will contain at most <code>MaxResults</code> number of filters. If there are more filters, call the <code>ListVocabularyFilters</code> operation again with the <code>NextToken</code> parameter in the request set to the value of the <code>NextToken</code> field in the response.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeVocabularyFilterInfo *> * _Nullable vocabularyFilters;

@end

/**
 <p>Describes the input media file in a transcription request.</p>
 */
@interface AWSTranscribeMedia : AWSModel


/**
 <p>The S3 object location of the input media file. The URI must be in the same region as the API endpoint that you are calling. The general form is:</p><p><code> s3://&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code></p><p>For example:</p><p><code>s3://examplebucket/example.mp4</code></p><p><code>s3://examplebucket/mediadocs/example.mp4</code></p><p>For more information about S3 object names, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaFileUri;

@end

/**
 <p>Provides optional settings for the <code>StartTranscriptionJob</code> operation.</p>
 */
@interface AWSTranscribeSettings : AWSModel


/**
 <p>Instructs Amazon Transcribe to process each audio channel separately and then merge the transcription output of each channel into a single transcription. </p><p>Amazon Transcribe also produces a transcription of each item detected on an audio channel, including the start time and end time of the item and alternative transcriptions of the item including the confidence that Amazon Transcribe has in the transcription.</p><p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable channelIdentification;

/**
 <p>The number of alternative transcriptions that the service should return. If you specify the <code>MaxAlternatives</code> field, you must set the <code>ShowAlternatives</code> field to true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAlternatives;

/**
 <p>The maximum number of speakers to identify in the input audio. If there are more speakers in the audio than this number, multiple speakers will be identified as a single speaker. If you specify the <code>MaxSpeakerLabels</code> field, you must set the <code>ShowSpeakerLabels</code> field to true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSpeakerLabels;

/**
 <p>Determines whether the transcription contains alternative transcriptions. If you set the <code>ShowAlternatives</code> field to true, you must also set the maximum number of alternatives to return in the <code>MaxAlternatives</code> field.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable showAlternatives;

/**
 <p>Determines whether the transcription job uses speaker recognition to identify different speakers in the input audio. Speaker recognition labels individual speakers in the audio file. If you set the <code>ShowSpeakerLabels</code> field to true, you must also set the maximum number of speaker labels <code>MaxSpeakerLabels</code> field.</p><p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable showSpeakerLabels;

/**
 <p>Set to <code>mask</code> to remove filtered text from the transcript and replace it with three asterisks ("***") as placeholder text. Set to <code>remove</code> to remove filtered text from the transcript without using placeholder text.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyFilterMethod vocabularyFilterMethod;

/**
 <p>The name of the vocabulary filter to use when transcribing the audio. The filter that you specify must have the same language code as the transcription job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

/**
 <p>The name of a vocabulary to use when processing the transcription job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeStartTranscriptionJobRequest : AWSRequest


/**
 <p>An object that contains the request parameters for content redaction.</p>
 */
@property (nonatomic, strong) AWSTranscribeContentRedaction * _Nullable contentRedaction;

/**
 <p>Provides information about how a transcription job is executed. Use this field to indicate that the job can be queued for deferred execution if the concurrency limit is reached and there are no slots available to immediately run the job.</p>
 */
@property (nonatomic, strong) AWSTranscribeJobExecutionSettings * _Nullable jobExecutionSettings;

/**
 <p>The language code for the language used in the input media file.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>An object that describes the input media for a transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedia * _Nullable media;

/**
 <p>The format of the input media file.</p>
 */
@property (nonatomic, assign) AWSTranscribeMediaFormat mediaFormat;

/**
 <p>The sample rate, in Hertz, of the audio track in the input media file. </p><p>If you do not specify the media sample rate, Amazon Transcribe determines the sample rate. If you specify the sample rate, it must match the sample rate detected by Amazon Transcribe. In most cases, you should leave the <code>MediaSampleRateHertz</code> field blank and let Amazon Transcribe determine the sample rate.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mediaSampleRateHertz;

/**
 <p>The location where the transcription is stored.</p><p>If you set the <code>OutputBucketName</code>, Amazon Transcribe puts the transcript in the specified S3 bucket. When you call the <a>GetTranscriptionJob</a> operation, the operation returns this location in the <code>TranscriptFileUri</code> field. If you enable content redaction, the redacted transcript appears in <code>RedactedTranscriptFileUri</code>. If you enable content redaction and choose to output an unredacted transcript, that transcript's location still appears in the <code>TranscriptFileUri</code>. The S3 bucket must have permissions that allow Amazon Transcribe to put files in the bucket. For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user">Permissions Required for IAM User Roles</a>.</p><p>You can specify an AWS Key Management Service (KMS) key to encrypt the output of your transcription using the <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side encryption of transcripts that are placed in your S3 bucket.</p><p>If you don't set the <code>OutputBucketName</code>, Amazon Transcribe generates a pre-signed URL, a shareable URL that provides secure access to your transcription, and returns it in the <code>TranscriptFileUri</code> field. Use this URL to download the transcription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputBucketName;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key used to encrypt the output of the transcription job. The user calling the <code>StartTranscriptionJob</code> operation must have permission to use the specified KMS key.</p><p>You can use either of the following to identify a KMS key in the current account:</p><ul><li><p>KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab"</p></li><li><p>KMS Key Alias: "alias/ExampleAlias"</p></li></ul><p>You can use either of the following to identify a KMS key in the current account or another account:</p><ul><li><p>Amazon Resource Name (ARN) of a KMS Key: "arn:aws:kms:region:account ID:key/1234abcd-12ab-34cd-56ef-1234567890ab"</p></li><li><p>ARN of a KMS Key Alias: "arn:aws:kms:region:account ID:alias/ExampleAlias"</p></li></ul><p>If you don't specify an encryption key, the output of the transcription job is encrypted with the default Amazon S3 key (SSE-S3). </p><p>If you specify a KMS key to encrypt your output, you must also specify an output location in the <code>OutputBucketName</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputEncryptionKMSKeyId;

/**
 <p>A <code>Settings</code> object that provides optional settings for a transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeSettings * _Nullable settings;

/**
 <p>The name of the job. Note that you can't use the strings "." or ".." by themselves as the job name. The name must also be unique within an AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcriptionJobName;

@end

/**
 
 */
@interface AWSTranscribeStartTranscriptionJobResponse : AWSModel


/**
 <p>An object containing details of the asynchronous transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeTranscriptionJob * _Nullable transcriptionJob;

@end

/**
 <p>Identifies the location of a transcription.</p>
 */
@interface AWSTranscribeTranscript : AWSModel


/**
 <p>The S3 object location of the redacted transcript.</p><p>Use this URI to access the redacated transcript. If you specified an S3 bucket in the <code>OutputBucketName</code> field when you created the job, this is the URI of that bucket. If you chose to store the transcript in Amazon Transcribe, this is a shareable URL that provides secure access to that location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable redactedTranscriptFileUri;

/**
 <p>The S3 object location of the the transcript.</p><p>Use this URI to access the transcript. If you specified an S3 bucket in the <code>OutputBucketName</code> field when you created the job, this is the URI of that bucket. If you chose to store the transcript in Amazon Transcribe, this is a shareable URL that provides secure access to that location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcriptFileUri;

@end

/**
 <p>Describes an asynchronous transcription job that was created with the <code>StartTranscriptionJob</code> operation. </p>
 */
@interface AWSTranscribeTranscriptionJob : AWSModel


/**
 <p>A timestamp that shows when the job was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionTime;

/**
 <p>An object that describes content redaction settings for the transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeContentRedaction * _Nullable contentRedaction;

/**
 <p>A timestamp that shows when the job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p><p>The <code>FailureReason</code> field can contain one of the following values:</p><ul><li><p><code>Unsupported media format</code> - The media format specified in the <code>MediaFormat</code> field of the request isn't valid. See the description of the <code>MediaFormat</code> field for a list of valid values.</p></li><li><p><code>The media format provided does not match the detected media format</code> - The media format of the audio file doesn't match the format specified in the <code>MediaFormat</code> field in the request. Check the media format of your media file and make sure that the two values match.</p></li><li><p><code>Invalid sample rate for audio file</code> - The sample rate specified in the <code>MediaSampleRateHertz</code> of the request isn't valid. The sample rate must be between 8000 and 48000 Hertz.</p></li><li><p><code>The sample rate provided does not match the detected sample rate</code> - The sample rate in the audio file doesn't match the sample rate specified in the <code>MediaSampleRateHertz</code> field in the request. Check the sample rate of your media file and make sure that the two values match.</p></li><li><p><code>Invalid file size: file size too large</code> - The size of your audio file is larger than Amazon Transcribe can process. For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits">Limits</a> in the <i>Amazon Transcribe Developer Guide</i>.</p></li><li><p><code>Invalid number of channels: number of channels too large</code> - Your audio contains more channels than Amazon Transcribe is configured to process. To request additional channels, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits-amazon-transcribe">Amazon Transcribe Limits</a> in the <i>Amazon Web Services General Reference</i>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>Provides information about how a transcription job is executed.</p>
 */
@property (nonatomic, strong) AWSTranscribeJobExecutionSettings * _Nullable jobExecutionSettings;

/**
 <p>The language code for the input speech.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>An object that describes the input media for the transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedia * _Nullable media;

/**
 <p>The format of the input media file.</p>
 */
@property (nonatomic, assign) AWSTranscribeMediaFormat mediaFormat;

/**
 <p>The sample rate, in Hertz, of the audio track in the input media file. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mediaSampleRateHertz;

/**
 <p>Optional settings for the transcription job. Use these settings to turn on speaker recognition, to set the maximum number of speakers that should be identified and to specify a custom vocabulary to use when processing the transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeSettings * _Nullable settings;

/**
 <p>A timestamp that shows with the job was started processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>An object that describes the output of the transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeTranscript * _Nullable transcript;

/**
 <p>The name of the transcription job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcriptionJobName;

/**
 <p>The status of the transcription job.</p>
 */
@property (nonatomic, assign) AWSTranscribeTranscriptionJobStatus transcriptionJobStatus;

@end

/**
 <p>Provides a summary of information about a transcription job.</p>
 */
@interface AWSTranscribeTranscriptionJobSummary : AWSModel


/**
 <p>A timestamp that shows when the job was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionTime;

/**
 <p>The content redaction settings of the transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeContentRedaction * _Nullable contentRedaction;

/**
 <p>A timestamp that shows when the job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, a description of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The language code for the input speech.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>Indicates the location of the output of the transcription job.</p><p>If the value is <code>CUSTOMER_BUCKET</code> then the location is the S3 bucket specified in the <code>outputBucketName</code> field when the transcription job was started with the <code>StartTranscriptionJob</code> operation.</p><p>If the value is <code>SERVICE_BUCKET</code> then the output is stored by Amazon Transcribe and can be retrieved using the URI in the <code>GetTranscriptionJob</code> response's <code>TranscriptFileUri</code> field.</p>
 */
@property (nonatomic, assign) AWSTranscribeOutputLocationType outputLocationType;

/**
 <p>A timestamp that shows when the job started processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The name of the transcription job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcriptionJobName;

/**
 <p>The status of the transcription job. When the status is <code>COMPLETED</code>, use the <code>GetTranscriptionJob</code> operation to get the results of the transcription.</p>
 */
@property (nonatomic, assign) AWSTranscribeTranscriptionJobStatus transcriptionJobStatus;

@end

/**
 
 */
@interface AWSTranscribeUpdateVocabularyFilterRequest : AWSRequest


/**
 <p>The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character Sets for Custom Vocabularies</a>.</p><p>The specified file must be less than 50 KB of UTF-8 characters.</p><p>If you provide the location of a list of words in the <code>VocabularyFilterFileUri</code> parameter, you can't use the <code>Words</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterFileUri;

/**
 <p>The name of the vocabulary filter to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

/**
 <p>The words to use in the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character Sets for Custom Vocabularies</a>.</p><p>If you provide a list of words in the <code>Words</code> parameter, you can't use the <code>VocabularyFilterFileUri</code> parameter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable words;

@end

/**
 
 */
@interface AWSTranscribeUpdateVocabularyFilterResponse : AWSModel


/**
 <p>The language code of the words in the vocabulary filter.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time that the vocabulary filter was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the updated vocabulary filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

@end

/**
 
 */
@interface AWSTranscribeUpdateVocabularyRequest : AWSRequest


/**
 <p>The language code of the vocabulary entries.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>An array of strings containing the vocabulary entries.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable phrases;

/**
 <p>The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is </p><p><code> https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code></p><p>For example:</p><p><code>https://s3.us-east-1.amazonaws.com/examplebucket/vocab.txt</code></p><p>For more information about S3 object names, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p><p>For more information about custom vocabularies, see <a href="http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary">Custom Vocabularies</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFileUri;

/**
 <p>The name of the vocabulary to update. The name is case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeUpdateVocabularyResponse : AWSModel


/**
 <p>The language code of the vocabulary entries.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time that the vocabulary was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the vocabulary that was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

/**
 <p>The processing state of the vocabulary. When the <code>VocabularyState</code> field contains <code>READY</code> the vocabulary is ready to be used in a <code>StartTranscriptionJob</code> request.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyState vocabularyState;

@end

/**
 <p>Provides information about a vocabulary filter.</p>
 */
@interface AWSTranscribeVocabularyFilterInfo : AWSModel


/**
 <p>The language code of the words in the vocabulary filter.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time that the vocabulary was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the vocabulary filter. The name must be unique in the account that holds the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

@end

/**
 <p>Provides information about a custom vocabulary. </p>
 */
@interface AWSTranscribeVocabularyInfo : AWSModel


/**
 <p>The language code of the vocabulary entries.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time that the vocabulary was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

/**
 <p>The processing state of the vocabulary. If the state is <code>READY</code> you can use the vocabulary in a <code>StartTranscriptionJob</code> request.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyState vocabularyState;

@end

NS_ASSUME_NONNULL_END
