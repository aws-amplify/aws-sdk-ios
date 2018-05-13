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
};

typedef NS_ENUM(NSInteger, AWSTranscribeMediaFormat) {
    AWSTranscribeMediaFormatUnknown,
    AWSTranscribeMediaFormatMp3,
    AWSTranscribeMediaFormatMp4,
    AWSTranscribeMediaFormatWav,
    AWSTranscribeMediaFormatFlac,
};

typedef NS_ENUM(NSInteger, AWSTranscribeTranscriptionJobStatus) {
    AWSTranscribeTranscriptionJobStatusUnknown,
    AWSTranscribeTranscriptionJobStatusInProgress,
    AWSTranscribeTranscriptionJobStatusFailed,
    AWSTranscribeTranscriptionJobStatusCompleted,
};

typedef NS_ENUM(NSInteger, AWSTranscribeVocabularyState) {
    AWSTranscribeVocabularyStateUnknown,
    AWSTranscribeVocabularyStatePending,
    AWSTranscribeVocabularyStateReady,
    AWSTranscribeVocabularyStateFailed,
};

@class AWSTranscribeCreateVocabularyRequest;
@class AWSTranscribeCreateVocabularyResponse;
@class AWSTranscribeDeleteVocabularyRequest;
@class AWSTranscribeGetTranscriptionJobRequest;
@class AWSTranscribeGetTranscriptionJobResponse;
@class AWSTranscribeGetVocabularyRequest;
@class AWSTranscribeGetVocabularyResponse;
@class AWSTranscribeListTranscriptionJobsRequest;
@class AWSTranscribeListTranscriptionJobsResponse;
@class AWSTranscribeListVocabulariesRequest;
@class AWSTranscribeListVocabulariesResponse;
@class AWSTranscribeMedia;
@class AWSTranscribeSettings;
@class AWSTranscribeStartTranscriptionJobRequest;
@class AWSTranscribeStartTranscriptionJobResponse;
@class AWSTranscribeTranscript;
@class AWSTranscribeTranscriptionJob;
@class AWSTranscribeTranscriptionJobSummary;
@class AWSTranscribeUpdateVocabularyRequest;
@class AWSTranscribeUpdateVocabularyResponse;
@class AWSTranscribeVocabularyInfo;

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
 <p>When specified, returns only transcription jobs with the specified status.</p>
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
 <p>Describes the input media file in a transcription request.</p>
 */
@interface AWSTranscribeMedia : AWSModel


/**
 <p>The S3 location of the input media file. The URI must be in the same region as the API endpoint that you are calling. The general form is:</p><p><code> https://&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code></p><p>For example:</p><p><code>https://s3-us-east-1.amazonaws.com/examplebucket/example.mp4</code></p><p><code>https://s3-us-east-1.amazonaws.com/examplebucket/mediadocs/example.mp4</code></p><p>For more information about S3 object names, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaFileUri;

@end

/**
 <p>Provides optional settings for the <code>StartTranscriptionJob</code> operation.</p>
 */
@interface AWSTranscribeSettings : AWSModel


/**
 <p>The maximum number of speakers to identify in the input audio. If there are more speakers in the audio than this number, multiple speakers will be identified as a single speaker. If you specify the <code>MaxSpeakerLabels</code> field, you must set the <code>ShowSpeakerLabels</code> field to true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSpeakerLabels;

/**
 <p>Determines whether the transcription job should use speaker recognition to identify different speakers in the input audio. If you set the <code>ShowSpeakerLabels</code> field to true, you must also set the maximum number of speaker labels <code>MaxSpeakerLabels</code> field.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable showSpeakerLabels;

/**
 <p>The name of a vocabulary to use when processing the transcription job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeStartTranscriptionJobRequest : AWSRequest


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
 <p>The sample rate, in Hertz, of the audio track in the input media file. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mediaSampleRateHertz;

/**
 <p>A <code>Settings</code> object that provides optional settings for a transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeSettings * _Nullable settings;

/**
 <p>The name of the job. The name must be unique within an AWS account.</p>
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
 <p>Describes the output of a transcription job.</p>
 */
@interface AWSTranscribeTranscript : AWSModel


/**
 <p>The S3 location where the transcription result is stored. Use this URI to access the results of the transcription job. </p>
 */
@property (nonatomic, strong) NSString * _Nullable transcriptFileUri;

@end

/**
 <p>Describes an asynchronous transcription job that was created with the <code>StartTranscriptionJob</code> operation.</p>
 */
@interface AWSTranscribeTranscriptionJob : AWSModel


/**
 <p>Timestamp of the date and time that the job completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionTime;

/**
 <p>Timestamp of the date and time that the job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The language code for the input speech.</p>
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
 <p>The sample rate, in Hertz, of the audio track in the input media file. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mediaSampleRateHertz;

/**
 <p>Optional settings for the transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeSettings * _Nullable settings;

/**
 <p>An object that describes the output of the transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeTranscript * _Nullable transcript;

/**
 <p>A name to identify the transcription job.</p>
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
 <p>Timestamp of the date and time that the job completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionTime;

/**
 <p>Timestamp of the date and time that the job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains a description of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The language code for the input speech.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The name assigned to the transcription job when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcriptionJobName;

/**
 <p>The status of the transcription job. When the status is <code>COMPLETED</code>, use the <code>GetTranscriptionJob</code> operation to get the results of the transcription.</p>
 */
@property (nonatomic, assign) AWSTranscribeTranscriptionJobStatus transcriptionJobStatus;

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
 <p>Provides information about a custom vocabulary.</p>
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
