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

FOUNDATION_EXPORT NSString *const AWSTranscribeErrorDomain;

typedef NS_ENUM(NSInteger, AWSTranscribeErrorType) {
    AWSTranscribeErrorUnknown,
    AWSTranscribeErrorBadRequest,
    AWSTranscribeErrorConflict,
    AWSTranscribeErrorInternalFailure,
    AWSTranscribeErrorLimitExceeded,
    AWSTranscribeErrorNotFound,
};

typedef NS_ENUM(NSInteger, AWSTranscribeBaseModelName) {
    AWSTranscribeBaseModelNameUnknown,
    AWSTranscribeBaseModelNameNarrowBand,
    AWSTranscribeBaseModelNameWideBand,
};

typedef NS_ENUM(NSInteger, AWSTranscribeCLMLanguageCode) {
    AWSTranscribeCLMLanguageCodeUnknown,
    AWSTranscribeCLMLanguageCodeEnUS,
    AWSTranscribeCLMLanguageCodeHiIN,
    AWSTranscribeCLMLanguageCodeEsUS,
    AWSTranscribeCLMLanguageCodeEnGB,
    AWSTranscribeCLMLanguageCodeEnAU,
};

typedef NS_ENUM(NSInteger, AWSTranscribeCallAnalyticsJobStatus) {
    AWSTranscribeCallAnalyticsJobStatusUnknown,
    AWSTranscribeCallAnalyticsJobStatusQueued,
    AWSTranscribeCallAnalyticsJobStatusInProgress,
    AWSTranscribeCallAnalyticsJobStatusFailed,
    AWSTranscribeCallAnalyticsJobStatusCompleted,
};

typedef NS_ENUM(NSInteger, AWSTranscribeLanguageCode) {
    AWSTranscribeLanguageCodeUnknown,
    AWSTranscribeLanguageCodeAfZA,
    AWSTranscribeLanguageCodeArAE,
    AWSTranscribeLanguageCodeArSA,
    AWSTranscribeLanguageCodeCyGB,
    AWSTranscribeLanguageCodeDaDK,
    AWSTranscribeLanguageCodeDeCH,
    AWSTranscribeLanguageCodeDeDE,
    AWSTranscribeLanguageCodeEnAB,
    AWSTranscribeLanguageCodeEnAU,
    AWSTranscribeLanguageCodeEnGB,
    AWSTranscribeLanguageCodeEnIE,
    AWSTranscribeLanguageCodeEnIN,
    AWSTranscribeLanguageCodeEnUS,
    AWSTranscribeLanguageCodeEnWL,
    AWSTranscribeLanguageCodeEsES,
    AWSTranscribeLanguageCodeEsUS,
    AWSTranscribeLanguageCodeFaIR,
    AWSTranscribeLanguageCodeFrCA,
    AWSTranscribeLanguageCodeFrFR,
    AWSTranscribeLanguageCodeGaIE,
    AWSTranscribeLanguageCodeGdGB,
    AWSTranscribeLanguageCodeHeIL,
    AWSTranscribeLanguageCodeHiIN,
    AWSTranscribeLanguageCodeIdID,
    AWSTranscribeLanguageCodeItIT,
    AWSTranscribeLanguageCodeJaJP,
    AWSTranscribeLanguageCodeKoKR,
    AWSTranscribeLanguageCodeMsMY,
    AWSTranscribeLanguageCodeNlNL,
    AWSTranscribeLanguageCodePtBR,
    AWSTranscribeLanguageCodePtPT,
    AWSTranscribeLanguageCodeRuRU,
    AWSTranscribeLanguageCodeTaIN,
    AWSTranscribeLanguageCodeTeIN,
    AWSTranscribeLanguageCodeTrTR,
    AWSTranscribeLanguageCodeZhCN,
    AWSTranscribeLanguageCodeZhTW,
    AWSTranscribeLanguageCodeThTH,
    AWSTranscribeLanguageCodeEnZA,
    AWSTranscribeLanguageCodeEnNZ,
};

typedef NS_ENUM(NSInteger, AWSTranscribeMediaFormat) {
    AWSTranscribeMediaFormatUnknown,
    AWSTranscribeMediaFormatMp3,
    AWSTranscribeMediaFormatMp4,
    AWSTranscribeMediaFormatWav,
    AWSTranscribeMediaFormatFlac,
    AWSTranscribeMediaFormatOgg,
    AWSTranscribeMediaFormatAmr,
    AWSTranscribeMediaFormatWebm,
};

typedef NS_ENUM(NSInteger, AWSTranscribeMedicalContentIdentificationType) {
    AWSTranscribeMedicalContentIdentificationTypeUnknown,
    AWSTranscribeMedicalContentIdentificationTypePhi,
};

typedef NS_ENUM(NSInteger, AWSTranscribeModelStatus) {
    AWSTranscribeModelStatusUnknown,
    AWSTranscribeModelStatusInProgress,
    AWSTranscribeModelStatusFailed,
    AWSTranscribeModelStatusCompleted,
};

typedef NS_ENUM(NSInteger, AWSTranscribeOutputLocationType) {
    AWSTranscribeOutputLocationTypeUnknown,
    AWSTranscribeOutputLocationTypeCustomerBucket,
    AWSTranscribeOutputLocationTypeServiceBucket,
};

typedef NS_ENUM(NSInteger, AWSTranscribeParticipantRole) {
    AWSTranscribeParticipantRoleUnknown,
    AWSTranscribeParticipantRoleAgent,
    AWSTranscribeParticipantRoleCustomer,
};

typedef NS_ENUM(NSInteger, AWSTranscribePiiEntityType) {
    AWSTranscribePiiEntityTypeUnknown,
    AWSTranscribePiiEntityTypeBankAccountNumber,
    AWSTranscribePiiEntityTypeBankRouting,
    AWSTranscribePiiEntityTypeCreditDebitNumber,
    AWSTranscribePiiEntityTypeCreditDebitCvv,
    AWSTranscribePiiEntityTypeCreditDebitExpiry,
    AWSTranscribePiiEntityTypePin,
    AWSTranscribePiiEntityTypeEmail,
    AWSTranscribePiiEntityTypeAddress,
    AWSTranscribePiiEntityTypeName,
    AWSTranscribePiiEntityTypePhone,
    AWSTranscribePiiEntityTypeSsn,
    AWSTranscribePiiEntityTypeAll,
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

typedef NS_ENUM(NSInteger, AWSTranscribeSentimentValue) {
    AWSTranscribeSentimentValueUnknown,
    AWSTranscribeSentimentValuePositive,
    AWSTranscribeSentimentValueNegative,
    AWSTranscribeSentimentValueNeutral,
    AWSTranscribeSentimentValueMixed,
};

typedef NS_ENUM(NSInteger, AWSTranscribeSpecialty) {
    AWSTranscribeSpecialtyUnknown,
    AWSTranscribeSpecialtyPrimarycare,
};

typedef NS_ENUM(NSInteger, AWSTranscribeSubtitleFormat) {
    AWSTranscribeSubtitleFormatUnknown,
    AWSTranscribeSubtitleFormatVtt,
    AWSTranscribeSubtitleFormatSrt,
};

typedef NS_ENUM(NSInteger, AWSTranscribeTranscriptFilterType) {
    AWSTranscribeTranscriptFilterTypeUnknown,
    AWSTranscribeTranscriptFilterTypeExact,
};

typedef NS_ENUM(NSInteger, AWSTranscribeTranscriptionJobStatus) {
    AWSTranscribeTranscriptionJobStatusUnknown,
    AWSTranscribeTranscriptionJobStatusQueued,
    AWSTranscribeTranscriptionJobStatusInProgress,
    AWSTranscribeTranscriptionJobStatusFailed,
    AWSTranscribeTranscriptionJobStatusCompleted,
};

typedef NS_ENUM(NSInteger, AWSTranscribeTypes) {
    AWSTranscribeTypesUnknown,
    AWSTranscribeTypesConversation,
    AWSTranscribeTypesDictation,
};

typedef NS_ENUM(NSInteger, AWSTranscribeVocabularyFilterMethod) {
    AWSTranscribeVocabularyFilterMethodUnknown,
    AWSTranscribeVocabularyFilterMethodRemove,
    AWSTranscribeVocabularyFilterMethodMask,
    AWSTranscribeVocabularyFilterMethodTag,
};

typedef NS_ENUM(NSInteger, AWSTranscribeVocabularyState) {
    AWSTranscribeVocabularyStateUnknown,
    AWSTranscribeVocabularyStatePending,
    AWSTranscribeVocabularyStateReady,
    AWSTranscribeVocabularyStateFailed,
};

@class AWSTranscribeAbsoluteTimeRange;
@class AWSTranscribeCallAnalyticsJob;
@class AWSTranscribeCallAnalyticsJobSettings;
@class AWSTranscribeCallAnalyticsJobSummary;
@class AWSTranscribeCategoryProperties;
@class AWSTranscribeChannelDefinition;
@class AWSTranscribeContentRedaction;
@class AWSTranscribeCreateCallAnalyticsCategoryRequest;
@class AWSTranscribeCreateCallAnalyticsCategoryResponse;
@class AWSTranscribeCreateLanguageModelRequest;
@class AWSTranscribeCreateLanguageModelResponse;
@class AWSTranscribeCreateMedicalVocabularyRequest;
@class AWSTranscribeCreateMedicalVocabularyResponse;
@class AWSTranscribeCreateVocabularyFilterRequest;
@class AWSTranscribeCreateVocabularyFilterResponse;
@class AWSTranscribeCreateVocabularyRequest;
@class AWSTranscribeCreateVocabularyResponse;
@class AWSTranscribeDeleteCallAnalyticsCategoryRequest;
@class AWSTranscribeDeleteCallAnalyticsCategoryResponse;
@class AWSTranscribeDeleteCallAnalyticsJobRequest;
@class AWSTranscribeDeleteCallAnalyticsJobResponse;
@class AWSTranscribeDeleteLanguageModelRequest;
@class AWSTranscribeDeleteMedicalTranscriptionJobRequest;
@class AWSTranscribeDeleteMedicalVocabularyRequest;
@class AWSTranscribeDeleteTranscriptionJobRequest;
@class AWSTranscribeDeleteVocabularyFilterRequest;
@class AWSTranscribeDeleteVocabularyRequest;
@class AWSTranscribeDescribeLanguageModelRequest;
@class AWSTranscribeDescribeLanguageModelResponse;
@class AWSTranscribeGetCallAnalyticsCategoryRequest;
@class AWSTranscribeGetCallAnalyticsCategoryResponse;
@class AWSTranscribeGetCallAnalyticsJobRequest;
@class AWSTranscribeGetCallAnalyticsJobResponse;
@class AWSTranscribeGetMedicalTranscriptionJobRequest;
@class AWSTranscribeGetMedicalTranscriptionJobResponse;
@class AWSTranscribeGetMedicalVocabularyRequest;
@class AWSTranscribeGetMedicalVocabularyResponse;
@class AWSTranscribeGetTranscriptionJobRequest;
@class AWSTranscribeGetTranscriptionJobResponse;
@class AWSTranscribeGetVocabularyFilterRequest;
@class AWSTranscribeGetVocabularyFilterResponse;
@class AWSTranscribeGetVocabularyRequest;
@class AWSTranscribeGetVocabularyResponse;
@class AWSTranscribeInputDataConfig;
@class AWSTranscribeInterruptionFilter;
@class AWSTranscribeJobExecutionSettings;
@class AWSTranscribeLanguageIdSettings;
@class AWSTranscribeLanguageModel;
@class AWSTranscribeListCallAnalyticsCategoriesRequest;
@class AWSTranscribeListCallAnalyticsCategoriesResponse;
@class AWSTranscribeListCallAnalyticsJobsRequest;
@class AWSTranscribeListCallAnalyticsJobsResponse;
@class AWSTranscribeListLanguageModelsRequest;
@class AWSTranscribeListLanguageModelsResponse;
@class AWSTranscribeListMedicalTranscriptionJobsRequest;
@class AWSTranscribeListMedicalTranscriptionJobsResponse;
@class AWSTranscribeListMedicalVocabulariesRequest;
@class AWSTranscribeListMedicalVocabulariesResponse;
@class AWSTranscribeListTagsForResourceRequest;
@class AWSTranscribeListTagsForResourceResponse;
@class AWSTranscribeListTranscriptionJobsRequest;
@class AWSTranscribeListTranscriptionJobsResponse;
@class AWSTranscribeListVocabulariesRequest;
@class AWSTranscribeListVocabulariesResponse;
@class AWSTranscribeListVocabularyFiltersRequest;
@class AWSTranscribeListVocabularyFiltersResponse;
@class AWSTranscribeMedia;
@class AWSTranscribeMedicalTranscript;
@class AWSTranscribeMedicalTranscriptionJob;
@class AWSTranscribeMedicalTranscriptionJobSummary;
@class AWSTranscribeMedicalTranscriptionSetting;
@class AWSTranscribeModelSettings;
@class AWSTranscribeNonTalkTimeFilter;
@class AWSTranscribeRelativeTimeRange;
@class AWSTranscribeRule;
@class AWSTranscribeSentimentFilter;
@class AWSTranscribeSettings;
@class AWSTranscribeStartCallAnalyticsJobRequest;
@class AWSTranscribeStartCallAnalyticsJobResponse;
@class AWSTranscribeStartMedicalTranscriptionJobRequest;
@class AWSTranscribeStartMedicalTranscriptionJobResponse;
@class AWSTranscribeStartTranscriptionJobRequest;
@class AWSTranscribeStartTranscriptionJobResponse;
@class AWSTranscribeSubtitles;
@class AWSTranscribeSubtitlesOutput;
@class AWSTranscribeTag;
@class AWSTranscribeTagResourceRequest;
@class AWSTranscribeTagResourceResponse;
@class AWSTranscribeTranscript;
@class AWSTranscribeTranscriptFilter;
@class AWSTranscribeTranscriptionJob;
@class AWSTranscribeTranscriptionJobSummary;
@class AWSTranscribeUntagResourceRequest;
@class AWSTranscribeUntagResourceResponse;
@class AWSTranscribeUpdateCallAnalyticsCategoryRequest;
@class AWSTranscribeUpdateCallAnalyticsCategoryResponse;
@class AWSTranscribeUpdateMedicalVocabularyRequest;
@class AWSTranscribeUpdateMedicalVocabularyResponse;
@class AWSTranscribeUpdateVocabularyFilterRequest;
@class AWSTranscribeUpdateVocabularyFilterResponse;
@class AWSTranscribeUpdateVocabularyRequest;
@class AWSTranscribeUpdateVocabularyResponse;
@class AWSTranscribeVocabularyFilterInfo;
@class AWSTranscribeVocabularyInfo;

/**
 <p>A time range, set in seconds, between two points in the call.</p>
 */
@interface AWSTranscribeAbsoluteTimeRange : AWSModel


/**
 <p>A value that indicates the end of the time range in milliseconds. To set absolute time range, you must specify a start time and an end time. For example, if you specify the following values:</p><ul><li><p>StartTime - 10000</p></li><li><p>Endtime - 50000</p></li></ul><p>The time range is set between 10,000 milliseconds and 50,000 milliseconds into the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endTime;

/**
 <p>A time range from the beginning of the call to the value that you've specified. For example, if you specify <code>100000</code>, the time range is set to the first 100,000 milliseconds of the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable first;

/**
 <p>A time range from the value that you've specified to the end of the call. For example, if you specify <code>100000</code>, the time range is set to the last 100,000 milliseconds of the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable last;

/**
 <p>A value that indicates the beginning of the time range in seconds. To set absolute time range, you must specify a start time and an end time. For example, if you specify the following values:</p><ul><li><p>StartTime - 10000</p></li><li><p>Endtime - 50000</p></li></ul><p>The time range is set between 10,000 milliseconds and 50,000 milliseconds into the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startTime;

@end

/**
 <p>Describes an asynchronous analytics job that was created with the <code>StartAnalyticsJob</code> operation.</p>
 */
@interface AWSTranscribeCallAnalyticsJob : AWSModel


/**
 <p>The name of the call analytics job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callAnalyticsJobName;

/**
 <p>The status of the analytics job.</p>
 */
@property (nonatomic, assign) AWSTranscribeCallAnalyticsJobStatus callAnalyticsJobStatus;

/**
 <p>Shows numeric values to indicate the channel assigned to the agent's audio and the channel assigned to the customer's audio. </p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeChannelDefinition *> * _Nullable channelDefinitions;

/**
 <p>A timestamp that shows when the analytics job was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionTime;

/**
 <p>A timestamp that shows when the analytics job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>The Amazon Resource Number (ARN) that you use to access the analytics job. ARNs have the format <code>arn:partition:service:region:account-id:resource-type/resource-id</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>If the <code>AnalyticsJobStatus</code> is <code>FAILED</code>, this field contains information about why the job failed.</p><p>The <code>FailureReason</code> field can contain one of the following values:</p><ul><li><p><code>Unsupported media format</code>: The media format specified in the <code>MediaFormat</code> field of the request isn't valid. See the description of the <code>MediaFormat</code> field for a list of valid values.</p></li><li><p><code>The media format provided does not match the detected media format</code>: The media format of the audio file doesn't match the format specified in the <code>MediaFormat</code> field in the request. Check the media format of your media file and make sure the two values match.</p></li><li><p><code>Invalid sample rate for audio file</code>: The sample rate specified in the <code>MediaSampleRateHertz</code> of the request isn't valid. The sample rate must be between 8,000 and 48,000 Hertz.</p></li><li><p><code>The sample rate provided does not match the detected sample rate</code>: The sample rate in the audio file doesn't match the sample rate specified in the <code>MediaSampleRateHertz</code> field in the request. Check the sample rate of your media file and make sure that the two values match.</p></li><li><p><code>Invalid file size: file size too large</code>: The size of your audio file is larger than what Amazon Transcribe Medical can process. For more information, see <i>Guidelines and Quotas</i> in the Amazon Transcribe Medical Guide.</p></li><li><p><code>Invalid number of channels: number of channels too large</code>: Your audio contains more channels than Amazon Transcribe Medical is configured to process. To request additional channels, see Amazon Transcribe Medical Endpoints and Quotas in the <a href="https://docs.aws.amazon.com/general/latest/gr/Welcome.html">Amazon Web Services General Reference</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>A value between zero and one that Amazon Transcribe assigned to the language that it identified in the source audio. This value appears only when you don't provide a single language code. Larger values indicate that Amazon Transcribe has higher confidence in the language that it identified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifiedLanguageScore;

/**
 <p>If you know the language spoken between the customer and the agent, specify a language code for this field.</p><p>If you don't know the language, you can leave this field blank, and Amazon Transcribe will use machine learning to automatically identify the language. To improve the accuracy of language identification, you can provide an array containing the possible language codes for the language spoken in your audio. Refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported languages</a> for additional information.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>Describes the input media file in a transcription request.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedia * _Nullable media;

/**
 <p>The format of the input audio file. Note: for call analytics jobs, only the following media formats are supported: MP3, MP4, WAV, FLAC, OGG, and WebM.</p>
 */
@property (nonatomic, assign) AWSTranscribeMediaFormat mediaFormat;

/**
 <p>The sample rate, in Hertz, of the input audio.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mediaSampleRateHertz;

/**
 <p>Provides information about the settings used to run a transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeCallAnalyticsJobSettings * _Nullable settings;

/**
 <p>A timestamp that shows when the analytics job started processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>Identifies the location of a transcription.</p>
 */
@property (nonatomic, strong) AWSTranscribeTranscript * _Nullable transcript;

@end

/**
 <p>Provides optional settings for the <code>CallAnalyticsJob</code> operation. </p>
 */
@interface AWSTranscribeCallAnalyticsJobSettings : AWSModel


/**
 <p>Settings for content redaction within a transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeContentRedaction * _Nullable contentRedaction;

/**
 <p>The language identification settings associated with your call analytics job. These settings include <code>VocabularyName</code>, <code>VocabularyFilterName</code>, and <code>LanguageModelName</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSTranscribeLanguageIdSettings *> * _Nullable languageIdSettings;

/**
 <p>The structure used to describe a custom language model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable languageModelName;

/**
 <p>When you run a call analytics job, you can specify the language spoken in the audio, or you can have Amazon Transcribe identify the language for you.</p><p>To specify a language, specify an array with one language code. If you don't know the language, you can leave this field blank and Amazon Transcribe will use machine learning to identify the language for you. To improve the ability of Amazon Transcribe to correctly identify the language, you can provide an array of the languages that can be present in the audio. Refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported languages</a> for additional information.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable languageOptions;

/**
 <p>Set to mask to remove filtered text from the transcript and replace it with three asterisks ("***") as placeholder text. Set to <code>remove</code> to remove filtered text from the transcript without using placeholder text. Set to <code>tag</code> to mark the word in the transcription output that matches the vocabulary filter. When you set the filter method to <code>tag</code>, the words matching your vocabulary filter are not masked or removed.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyFilterMethod vocabularyFilterMethod;

/**
 <p>The name of the vocabulary filter to use when running a call analytics job. The filter that you specify must have the same language code as the analytics job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

/**
 <p>The name of a vocabulary to use when processing the call analytics job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 <p>Provides summary information about a call analytics job.</p>
 */
@interface AWSTranscribeCallAnalyticsJobSummary : AWSModel


/**
 <p>The name of the call analytics job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callAnalyticsJobName;

/**
 <p>The status of the call analytics job.</p>
 */
@property (nonatomic, assign) AWSTranscribeCallAnalyticsJobStatus callAnalyticsJobStatus;

/**
 <p>A timestamp that shows when the job was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionTime;

/**
 <p>A timestamp that shows when the call analytics job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If the <code>CallAnalyticsJobStatus</code> is <code>FAILED</code>, a description of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The language of the transcript in the source audio file.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>A timestamp that shows when the job began processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p>An object that contains the rules and additional information about a call analytics category.</p>
 */
@interface AWSTranscribeCategoryProperties : AWSModel


/**
 <p>The name of the call analytics category.</p>
 */
@property (nonatomic, strong) NSString * _Nullable categoryName;

/**
 <p>A timestamp that shows when the call analytics category was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>A timestamp that shows when the call analytics category was most recently updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdateTime;

/**
 <p>The rules used to create a call analytics category.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeRule *> * _Nullable rules;

@end

/**
 <p>For a call analytics job, an object that indicates the audio channel that belongs to the agent and the audio channel that belongs to the customer.</p>
 */
@interface AWSTranscribeChannelDefinition : AWSModel


/**
 <p>A value that indicates the audio channel.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable channelId;

/**
 <p>Indicates whether the person speaking on the audio channel is the agent or customer.</p>
 */
@property (nonatomic, assign) AWSTranscribeParticipantRole participantRole;

@end

/**
 <p>Settings for content redaction within a transcription job.</p>
 Required parameters: [RedactionType, RedactionOutput]
 */
@interface AWSTranscribeContentRedaction : AWSModel


/**
 <p>The types of personally identifiable information (PII) you want to redact in your transcript.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable piiEntityTypes;

/**
 <p>The output transcript file stored in either the default S3 bucket or in a bucket you specify.</p><p>When you choose <code>redacted</code> Amazon Transcribe outputs only the redacted transcript.</p><p>When you choose <code>redacted_and_unredacted</code> Amazon Transcribe outputs both the redacted and unredacted transcripts.</p>
 */
@property (nonatomic, assign) AWSTranscribeRedactionOutput redactionOutput;

/**
 <p>Request parameter that defines the entities to be redacted. The only accepted value is <code>PII</code>.</p>
 */
@property (nonatomic, assign) AWSTranscribeRedactionType redactionType;

@end

/**
 
 */
@interface AWSTranscribeCreateCallAnalyticsCategoryRequest : AWSRequest


/**
 <p>A unique name, chosen by you, for your call analytics category. For example, <code>sentiment-positive-last30seconds</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable categoryName;

/**
 <p>Rules make up a call analytics category. When creating a call analytics category, you must create between 1 and 20 rules for your category. For each rule, you specify a filter you want applied to the attributes of a call. For example, you can choose a sentiment filter that detects if a customer's sentiment was positive during the last 30 seconds of the call.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSTranscribeCreateCallAnalyticsCategoryResponse : AWSModel


/**
 <p>If your audio matches one of your categories, this field contains data on that category and its associated rules. This parameter shows which category is flagged (<code>CategoryName</code>) along with metadata for the rules that match your audio. Metadata includes the rule filter (such as <code>InterruptionFilter</code>, <code>NonTalkTimeFilter</code>, <code>SentimentFilter</code>, and <code>TranscriptFilter</code>) and where in your audio (<code>StartTime</code> and <code>EndTime</code>) the rule has a match.</p>
 */
@property (nonatomic, strong) AWSTranscribeCategoryProperties * _Nullable categoryProperties;

@end

/**
 
 */
@interface AWSTranscribeCreateLanguageModelRequest : AWSRequest


/**
 <p>The Amazon Transcribe standard language model, or base model, used to create your custom language model. Amazon Transcribe offers two options for base models: Wideband and Narrowband.</p><p>If the audio you want to transcribe has a sample rate of 16,000 Hz or greater, choose <code>WideBand</code>. To transcribe audio with a sample rate less than 16,000 Hz, choose <code>NarrowBand</code>.</p>
 */
@property (nonatomic, assign) AWSTranscribeBaseModelName baseModelName;

/**
 <p>Contains your data access role ARN (Amazon Resource Name) and the Amazon S3 locations of your training (<code>S3Uri</code>) and tuning (<code>TuningDataS3Uri</code>) data.</p>
 */
@property (nonatomic, strong) AWSTranscribeInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The language of your custom language model; note that the language code you select must match the language of your training and tuning data.</p>
 */
@property (nonatomic, assign) AWSTranscribeCLMLanguageCode languageCode;

/**
 <p>The name of your new custom language model.</p><p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a language model with the same name as a previous language model, you get a <code>ConflictException</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

/**
 <p>Optionally add tags, each in the form of a key:value pair, to your new language model. See also: .</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSTranscribeCreateLanguageModelResponse : AWSModel


/**
 <p>The Amazon Transcribe standard language model, or base model, you used when creating your custom language model.</p><p>If your audio has a sample rate of 16,000 Hz or greater, this value should be <code>WideBand</code>. If your audio has a sample rate of less than 16,000 Hz, this value should be <code>NarrowBand</code>.</p>
 */
@property (nonatomic, assign) AWSTranscribeBaseModelName baseModelName;

/**
 <p>Lists your data access role ARN (Amazon Resource Name) and the Amazon S3 locations your provided for your training (<code>S3Uri</code>) and tuning (<code>TuningDataS3Uri</code>) data.</p>
 */
@property (nonatomic, strong) AWSTranscribeInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The language code you selected for your custom language model.</p>
 */
@property (nonatomic, assign) AWSTranscribeCLMLanguageCode languageCode;

/**
 <p>The unique name you chose for your custom language model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

/**
 <p>The status of your custom language model. When the status shows as <code>COMPLETED</code>, your model is ready to use.</p>
 */
@property (nonatomic, assign) AWSTranscribeModelStatus modelStatus;

@end

/**
 
 */
@interface AWSTranscribeCreateMedicalVocabularyRequest : AWSRequest


/**
 <p>The language code that represents the language of the entries in your custom vocabulary. Note that U.S. English (<code>en-US</code>) is the only language supported with Amazon Transcribe Medical.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>Adds one or more tags, each in the form of a key:value pair, to a new medical vocabulary at the time you create the new vocabulary.</p><p>To learn more about using tags with Amazon Transcribe, refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging resources</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeTag *> * _Nullable tags;

/**
 <p>The Amazon S3 location (URI) of the text file that contains your custom vocabulary. The URI must be in the same Amazon Web Services Region as the resource that you're calling.</p><p>Here's an example URI path:</p><p><code>https://s3.us-east-1.amazonaws.com/my-s3-bucket/my-vocab-file.txt</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFileUri;

/**
 <p>The name of your new vocabulary.</p><p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a vocabulary with the same name as a previous vocabulary, you get a <code>ConflictException</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeCreateMedicalVocabularyResponse : AWSModel


/**
 <p>If the <code>VocabularyState</code> field is <code>FAILED</code>, <code>FailureReason</code> contains information about why the job failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The language code you selected for your medical vocabulary. Note that U.S. English (<code>en-US</code>) is the only language supported with Amazon Transcribe Medical.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time you created your custom medical vocabulary.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name you chose for your vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

/**
 <p>The processing state of your custom medical vocabulary. If the state is <code>READY</code>, you can use the vocabulary in a <code>StartMedicalTranscriptionJob</code> request.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyState vocabularyState;

@end

/**
 
 */
@interface AWSTranscribeCreateVocabularyFilterRequest : AWSRequest


/**
 <p>The language code of the words in the vocabulary filter. All words in the filter must be in the same language. The vocabulary filter can only be used with transcription jobs in the specified language.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>Adds one or more tags, each in the form of a key:value pair, to a new vocabulary filter at the time you create this new vocabulary filter.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeTag *> * _Nullable tags;

/**
 <p>The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character Sets for Custom Vocabularies</a>.</p><p>Your vocabulary filter file must be less than 50 KB in size.</p><p>Note that if you include <code>VocabularyFilterFileUri</code> in your request, you cannot use <code>Words</code>; you must choose one or the other.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterFileUri;

/**
 <p>The name of your new vocabulary filter.</p><p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a vocabulary filter with the same name as a previous vocabulary filter, you get a <code>ConflictException</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

/**
 <p>The words you want in your vocabulary filter. Only use characters specified in the <a href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character sets</a> for the language you're transcribing.</p><p>Note that if you include <code>Words</code> in your request, you cannot use <code>VocabularyFilterFileUri</code>; you must choose one or the other.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable words;

@end

/**
 
 */
@interface AWSTranscribeCreateVocabularyFilterResponse : AWSModel


/**
 <p>The language code associated with your vocabulary filter.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time the vocabulary filter was modified.</p>
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
 <p>The language code that represents the language of the entries in your custom vocabulary. Each vocabulary must contain terms in only one language. For a list of languages and their corresponding language codes, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported languages</a>.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>Use this flag to include a list of terms within your request.</p><p>Note that if you include <code>Phrases</code> in your request, you cannot use <code>VocabularyFileUri</code>; you must choose one or the other.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable phrases;

/**
 <p>Adds one or more tags, each in the form of a key:value pair, to a new custom vocabulary at the time you create this new vocabulary.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeTag *> * _Nullable tags;

/**
 <p>The S3 location of the text file that contains your custom vocabulary. The URI must be located in the same region as the API endpoint you're calling.</p><p>Here's an example URI path:</p><p><code>https://s3.us-east-1.amazonaws.com/my-s3-bucket/my-vocab-file.txt</code></p><p>Note that if you include <code>VocabularyFileUri</code> in your request, you cannot use the <code>Phrases</code> flag; you must choose one or the other.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFileUri;

/**
 <p>The name of your new vocabulary.</p><p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a vocabulary with the same name as a previous vocabulary, you get a <code>ConflictException</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeCreateVocabularyResponse : AWSModel


/**
 <p>If the <code>VocabularyState</code> field is <code>FAILED</code>, <code>FailureReason</code> contains information about why the job failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The language code you selected for your vocabulary.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time you created your custom vocabulary.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name you chose for your vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

/**
 <p>The processing state of your vocabulary. If the state is <code>READY</code>, you can use the vocabulary in a <code>StartTranscriptionJob</code> request.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyState vocabularyState;

@end

/**
 
 */
@interface AWSTranscribeDeleteCallAnalyticsCategoryRequest : AWSRequest


/**
 <p>The name of the call analytics category you want to delete. Category names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable categoryName;

@end

/**
 
 */
@interface AWSTranscribeDeleteCallAnalyticsCategoryResponse : AWSModel


@end

/**
 
 */
@interface AWSTranscribeDeleteCallAnalyticsJobRequest : AWSRequest


/**
 <p>The name of the call analytics job you want to delete. Job names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callAnalyticsJobName;

@end

/**
 
 */
@interface AWSTranscribeDeleteCallAnalyticsJobResponse : AWSModel


@end

/**
 
 */
@interface AWSTranscribeDeleteLanguageModelRequest : AWSRequest


/**
 <p>The name of the model you want to delete. Model names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

@end

/**
 
 */
@interface AWSTranscribeDeleteMedicalTranscriptionJobRequest : AWSRequest


/**
 <p>The name of the medical transcription job you want to delete. Job names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable medicalTranscriptionJobName;

@end

/**
 
 */
@interface AWSTranscribeDeleteMedicalVocabularyRequest : AWSRequest


/**
 <p>The name of the vocabulary that you want to delete. Vocabulary names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeDeleteTranscriptionJobRequest : AWSRequest


/**
 <p>The name of the transcription job you want to delete. Job names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcriptionJobName;

@end

/**
 
 */
@interface AWSTranscribeDeleteVocabularyFilterRequest : AWSRequest


/**
 <p>The name of the vocabulary filter you want to delete. Vocabulary filter names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

@end

/**
 
 */
@interface AWSTranscribeDeleteVocabularyRequest : AWSRequest


/**
 <p>The name of the vocabulary you want to delete. Vocabulary names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeDescribeLanguageModelRequest : AWSRequest


/**
 <p>The name of the custom language model you want described. Model names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

@end

/**
 
 */
@interface AWSTranscribeDescribeLanguageModelResponse : AWSModel


/**
 <p>The name of the custom language model you requested more information about.</p>
 */
@property (nonatomic, strong) AWSTranscribeLanguageModel * _Nullable languageModel;

@end

/**
 
 */
@interface AWSTranscribeGetCallAnalyticsCategoryRequest : AWSRequest


/**
 <p>The name of the category you want information about. Category names are case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable categoryName;

@end

/**
 
 */
@interface AWSTranscribeGetCallAnalyticsCategoryResponse : AWSModel


/**
 <p>Provides you with the rules associated with the category you specified in your <code>GetCallAnalyticsCategory</code> request.</p>
 */
@property (nonatomic, strong) AWSTranscribeCategoryProperties * _Nullable categoryProperties;

@end

/**
 
 */
@interface AWSTranscribeGetCallAnalyticsJobRequest : AWSRequest


/**
 <p>The name of the analytics job you want information about. This value is case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callAnalyticsJobName;

@end

/**
 
 */
@interface AWSTranscribeGetCallAnalyticsJobResponse : AWSModel


/**
 <p>An object that contains detailed information about your call analytics job. Returned fields include: <code>CallAnalyticsJobName</code>, <code>CallAnalyticsJobStatus</code>, <code>ChannelDefinitions</code>, <code>CompletionTime</code>, <code>CreationTime</code>, <code>DataAccessRoleArn</code>, <code>FailureReason</code>, <code>IdentifiedLanguageScore</code>, <code>LanguageCode</code>, <code>Media</code>, <code>MediaFormat</code>, <code>MediaSampleRateHertz</code>, <code>Settings</code>, <code>StartTime</code>, and <code>Transcript</code>.</p>
 */
@property (nonatomic, strong) AWSTranscribeCallAnalyticsJob * _Nullable callAnalyticsJob;

@end

/**
 
 */
@interface AWSTranscribeGetMedicalTranscriptionJobRequest : AWSRequest


/**
 <p>The name of the medical transcription job you want information about. This value is case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable medicalTranscriptionJobName;

@end

/**
 
 */
@interface AWSTranscribeGetMedicalTranscriptionJobResponse : AWSModel


/**
 <p>An object that contains detailed information about your medical transcription job. Returned fields include: <code>CompletionTime</code>, <code>ContentIdentificationType</code>, <code>CreationTime</code>, <code>FailureReason</code>, <code>LanguageCode</code>, <code>Media</code>, <code>MediaFormat</code>, <code>MediaSampleRateHertz</code>, <code>MedicalTranscriptionJobName</code>, <code>Settings</code>, <code>Specialty</code>, <code>StartTime</code>, <code>Tags</code>, <code>Transcript</code>, <code>TranscriptionJobStatus</code>, and <code>Type</code>.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedicalTranscriptionJob * _Nullable medicalTranscriptionJob;

@end

/**
 
 */
@interface AWSTranscribeGetMedicalVocabularyRequest : AWSRequest


/**
 <p>The name of the medical vocabulary you want information about. This value is case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeGetMedicalVocabularyResponse : AWSModel


/**
 <p>The S3 location where the vocabulary is stored; use this URI to view or download the vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable downloadUri;

/**
 <p>If your request returns a <code>VocabularyState</code> that is <code>FAILED</code>, the <code>FailureReason</code> field contains information about why the request failed.</p><p>For more information, refer to the <a href="https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html">Common Errors</a> section.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The valid language code for your vocabulary entries.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time that the vocabulary was last modified with a text file different from the one that was previously used.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the vocabulary returned by Amazon Transcribe Medical.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

/**
 <p>The processing state of the vocabulary. If the <code>VocabularyState</code> is <code>READY</code> then you can use it in the <code>StartMedicalTranscriptionJob</code> operation.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyState vocabularyState;

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
 <p>The name of the vocabulary to return information about. The name is case sensitive.</p>
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
 <p>The object that contains the Amazon S3 object location and access role required to train and tune your custom language model.</p>
 Required parameters: [S3Uri, DataAccessRoleArn]
 */
@interface AWSTranscribeInputDataConfig : AWSModel


/**
 <p>The Amazon Resource Name (ARN) that uniquely identifies the permissions you've given Amazon Transcribe to access your Amazon S3 buckets containing your media files or text data. ARNs have the format <code>arn:partition:service:region:account-id:resource-type/resource-id</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>The Amazon S3 prefix you specify to access the plain text files that you use to train your custom language model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Uri;

/**
 <p>The Amazon S3 prefix you specify to access the plain text files that you use to tune your custom language model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tuningDataS3Uri;

@end

/**
 <p>An object that enables you to configure your category to be applied to call analytics jobs where either the customer or agent was interrupted.</p>
 */
@interface AWSTranscribeInterruptionFilter : AWSModel


/**
 <p>An object you can use to specify a time range (in milliseconds) for when you'd want to find the interruption. For example, you could search for an interruption between the 30,000 millisecond mark and the 45,000 millisecond mark. You could also specify the time period as the first 15,000 milliseconds or the last 15,000 milliseconds.</p>
 */
@property (nonatomic, strong) AWSTranscribeAbsoluteTimeRange * _Nullable absoluteTimeRange;

/**
 <p>Set to <code>TRUE</code> to look for a time period where there was no interruption.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable negate;

/**
 <p>Indicates whether the caller or customer was interrupting.</p>
 */
@property (nonatomic, assign) AWSTranscribeParticipantRole participantRole;

/**
 <p>An object that allows percentages to specify the proportion of the call where there was a interruption. For example, you can specify the first half of the call. You can also specify the period of time between halfway through to three-quarters of the way through the call. Because the length of conversation can vary between calls, you can apply relative time ranges across all calls.</p>
 */
@property (nonatomic, strong) AWSTranscribeRelativeTimeRange * _Nullable relativeTimeRange;

/**
 <p>The duration of the interruption.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable threshold;

@end

/**
 <p>Provides information about when a transcription job should be executed.</p>
 */
@interface AWSTranscribeJobExecutionSettings : AWSModel


/**
 <p>Indicates whether a job should be queued by Amazon Transcribe when the concurrent execution limit is exceeded. When the <code>AllowDeferredExecution</code> field is true, jobs are queued and executed when the number of executing jobs falls below the concurrent execution limit. If the field is false, Amazon Transcribe returns a <code>LimitExceededException</code> exception.</p><p>Note that job queuing is enabled by default for call analytics jobs.</p><p>If you specify the <code>AllowDeferredExecution</code> field, you must specify the <code>DataAccessRoleArn</code> field.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowDeferredExecution;

/**
 <p>The Amazon Resource Name (ARN), in the form <code>arn:partition:service:region:account-id:resource-type/resource-id</code>, of a role that has access to the S3 bucket that contains the input files. Amazon Transcribe assumes this role to read queued media files. If you have specified an output S3 bucket for the transcription results, this role should have access to the output bucket as well.</p><p>If you specify the <code>AllowDeferredExecution</code> field, you must specify the <code>DataAccessRoleArn</code> field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

@end

/**
 <p>Language-specific settings that can be specified when language identification is enabled.</p>
 */
@interface AWSTranscribeLanguageIdSettings : AWSModel


/**
 <p>The name of the language model you want to use when transcribing your audio. The model you specify must have the same language codes as the transcription job; if the languages don't match, the language model isn't be applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable languageModelName;

/**
 <p>The name of the vocabulary filter you want to use when transcribing your audio. The filter you specify must have the same language codes as the transcription job; if the languages don't match, the vocabulary filter isn't be applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

/**
 <p>The name of the vocabulary you want to use when processing your transcription job. The vocabulary you specify must have the same language codes as the transcription job; if the languages don't match, the vocabulary isn't applied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 <p>The structure used to describe a custom language model.</p>
 */
@interface AWSTranscribeLanguageModel : AWSModel


/**
 <p>The Amazon Transcribe standard language model, or base model used to create the custom language model.</p>
 */
@property (nonatomic, assign) AWSTranscribeBaseModelName baseModelName;

/**
 <p>The time the custom language model was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The reason why the custom language model couldn't be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The data access role and Amazon S3 prefixes for the input files used to train the custom language model.</p>
 */
@property (nonatomic, strong) AWSTranscribeInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The language code you used to create your custom language model.</p>
 */
@property (nonatomic, assign) AWSTranscribeCLMLanguageCode languageCode;

/**
 <p>The most recent time the custom language model was modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the custom language model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

/**
 <p>The creation status of a custom language model. When the status is <code>COMPLETED</code> the model is ready for use.</p>
 */
@property (nonatomic, assign) AWSTranscribeModelStatus modelStatus;

/**
 <p>Whether the base model used for the custom language model is up to date. If this field is <code>false</code> then you are running the most up-to-date version of the base model in your custom language model.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable upgradeAvailability;

@end

/**
 
 */
@interface AWSTranscribeListCallAnalyticsCategoriesRequest : AWSRequest


/**
 <p>The maximum number of categories to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>When included, <code>NextToken</code>fetches the next set of categories if the result of the previous request was truncated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTranscribeListCallAnalyticsCategoriesResponse : AWSModel


/**
 <p>A list of objects containing information about analytics categories.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeCategoryProperties *> * _Nullable categories;

/**
 <p>The operation returns a page of jobs at a time. The maximum size of the list is set by the <code>MaxResults</code> parameter. If there are more categories in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the operation to return the next page of analytics categories.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTranscribeListCallAnalyticsJobsRequest : AWSRequest


/**
 <p>When specified, the jobs returned in the list are limited to jobs whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobNameContains;

/**
 <p> The maximum number of call analytics jobs to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If you receive a truncated result in the previous request of , include <code>NextToken</code> to fetch the next set of jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>When specified, returns only call analytics jobs with the specified status. Jobs are ordered by creation date, with the most recent jobs returned first. If you don't specify a status, Amazon Transcribe returns all analytics jobs ordered by creation date.</p>
 */
@property (nonatomic, assign) AWSTranscribeCallAnalyticsJobStatus status;

@end

/**
 
 */
@interface AWSTranscribeListCallAnalyticsJobsResponse : AWSModel


/**
 <p>A list of objects containing summary information for a transcription job.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeCallAnalyticsJobSummary *> * _Nullable callAnalyticsJobSummaries;

/**
 <p>The operation returns a page of jobs at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in your next request to the operation to return next page of jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>When specified, returns only call analytics jobs with that status. Jobs are ordered by creation date, with the most recent jobs returned first. If you don't specify a status, Amazon Transcribe returns all transcription jobs ordered by creation date.</p>
 */
@property (nonatomic, assign) AWSTranscribeCallAnalyticsJobStatus status;

@end

/**
 
 */
@interface AWSTranscribeListLanguageModelsRequest : AWSRequest


/**
 <p> The maximum number of language models to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>When specified, the custom language model names returned contain the substring you've specified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>When included, fetches the next set of jobs if the result of the previous request was truncated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>When specified, returns only custom language models with the specified status. Language models are ordered by creation date, with the newest models first. If you don't specify a status, Amazon Transcribe returns all custom language models ordered by date.</p>
 */
@property (nonatomic, assign) AWSTranscribeModelStatus statusEquals;

@end

/**
 
 */
@interface AWSTranscribeListLanguageModelsResponse : AWSModel


/**
 <p>A list of objects containing information about custom language models.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeLanguageModel *> * _Nullable models;

/**
 <p>The operation returns a page of jobs at a time. The maximum size of the list is set by the MaxResults parameter. If there are more language models in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the operation to return the next page of language models.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSTranscribeListMedicalTranscriptionJobsRequest : AWSRequest


/**
 <p>When specified, the jobs returned in the list are limited to jobs whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobNameContains;

/**
 <p> The maximum number of medical transcription jobs to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If you a receive a truncated result in the previous request of <code>ListMedicalTranscriptionJobs</code>, include <code>NextToken</code> to fetch the next set of jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>When specified, returns only medical transcription jobs with the specified status. Jobs are ordered by creation date, with the newest jobs returned first. If you don't specify a status, Amazon Transcribe Medical returns all transcription jobs ordered by creation date.</p>
 */
@property (nonatomic, assign) AWSTranscribeTranscriptionJobStatus status;

@end

/**
 
 */
@interface AWSTranscribeListMedicalTranscriptionJobsResponse : AWSModel


/**
 <p>A list of objects containing summary information for a transcription job.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeMedicalTranscriptionJobSummary *> * _Nullable medicalTranscriptionJobSummaries;

/**
 <p>The <code>ListMedicalTranscriptionJobs</code> operation returns a page of jobs at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If the number of jobs exceeds what can fit on a page, Amazon Transcribe Medical returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListMedicalTranscriptionJobs</code> operation to return in the next page of jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The requested status of the medical transcription jobs returned.</p>
 */
@property (nonatomic, assign) AWSTranscribeTranscriptionJobStatus status;

@end

/**
 
 */
@interface AWSTranscribeListMedicalVocabulariesRequest : AWSRequest


/**
 <p>The maximum number of vocabularies to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Returns vocabularies whose names contain the specified string. The search is not case sensitive. <code>ListMedicalVocabularies</code> returns both "<code>vocabularyname</code>" and "<code>VocabularyName</code>".</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>If the result of your previous request to <code>ListMedicalVocabularies</code> was truncated, include the <code>NextToken</code> to fetch the next set of vocabularies.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>When specified, returns only vocabularies with the <code>VocabularyState</code> equal to the specified vocabulary state. Use this field to see which vocabularies are ready for your medical transcription jobs.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyState stateEquals;

@end

/**
 
 */
@interface AWSTranscribeListMedicalVocabulariesResponse : AWSModel


/**
 <p>The <code>ListMedicalVocabularies</code> operation returns a page of vocabularies at a time. You set the maximum number of vocabularies to return on a page with the <code>MaxResults</code> parameter. If there are more jobs in the list will fit on a page, Amazon Transcribe Medical returns the <code>NextPage</code> token. To return the next page of vocabularies, include the token in the next request to the <code>ListMedicalVocabularies</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The requested vocabulary state.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyState status;

/**
 <p>A list of objects that describe the vocabularies that match your search criteria.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeVocabularyInfo *> * _Nullable vocabularies;

@end

/**
 
 */
@interface AWSTranscribeListTagsForResourceRequest : AWSRequest


/**
 <p>Lists all tags associated with a given Amazon Resource Name (ARN). ARNs have the format <code>arn:partition:service:region:account-id:resource-type/resource-id</code> (for example, <code>arn:aws:transcribe:us-east-1:account-id:transcription-job/your-job-name</code>). Valid values for <code>resource-type</code> are: <code>transcription-job</code>, <code>medical-transcription-job</code>, <code>vocabulary</code>, <code>medical-vocabulary</code>, <code>vocabulary-filter</code>, and <code>language-model</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSTranscribeListTagsForResourceResponse : AWSModel


/**
 <p>Lists all tags associated with the given Amazon Resource Name (ARN). </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>Lists all tags associated with the given transcription job, vocabulary, or resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSTranscribeListTranscriptionJobsRequest : AWSRequest


/**
 <p>When specified, the jobs returned in the list are limited to jobs whose name contains the specified string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobNameContains;

/**
 <p>The maximum number of jobs to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the result of the previous request to <code>ListTranscriptionJobs</code> is truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>When specified, returns only transcription jobs with the specified status. Jobs are ordered by creation date, with the newest jobs returned first. If you don’t specify a status, Amazon Transcribe returns all transcription jobs ordered by creation date.</p>
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
 <p>The maximum number of vocabularies to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>When specified, the vocabularies returned in the list are limited to vocabularies whose name contains the specified string. The search is not case sensitive, <code>ListVocabularies</code> returns both "vocabularyname" and "VocabularyName" in the response list.</p>
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
 <p>The <code>ListVocabularies</code> operation returns a page of vocabularies at a time. The maximum size of the page is set in the <code>MaxResults</code> parameter. If there are more jobs in the list than will fit on the page, Amazon Transcribe returns the <code>NextPage</code> token. To return in the next page of jobs, include the token in the next request to the <code>ListVocabularies</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The requested vocabulary state.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyState status;

/**
 <p>A list of objects that describe the vocabularies that match the search criteria in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeVocabularyInfo *> * _Nullable vocabularies;

@end

/**
 
 */
@interface AWSTranscribeListVocabularyFiltersRequest : AWSRequest


/**
 <p>The maximum number of filters to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>
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
 <p>The list of vocabulary filters. It contains at most <code>MaxResults</code> number of filters. If there are more filters, call the <code>ListVocabularyFilters</code> operation again with the <code>NextToken</code> parameter in the request set to the value of the <code>NextToken</code> field in the response.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeVocabularyFilterInfo *> * _Nullable vocabularyFilters;

@end

/**
 <p>Describes the input media file in a transcription request.</p>
 */
@interface AWSTranscribeMedia : AWSModel


/**
 <p>The S3 object location of the input media file. The URI must be in the same region as the API endpoint that you are calling. The general form is:</p><p><code>s3://DOC-EXAMPLE-BUCKET/keyprefix/objectkey</code></p><p>For example:</p><p><code>s3://DOC-EXAMPLE-BUCKET/example.flac</code></p><p><code>s3://DOC-EXAMPLE-BUCKET/mediafiles/example.flac</code></p><p>For more information about S3 object names, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaFileUri;

/**
 <p>The S3 object location for your redacted output media file. This is only supported for call analytics jobs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable redactedMediaFileUri;

@end

/**
 <p>Identifies the location of a medical transcript.</p>
 */
@interface AWSTranscribeMedicalTranscript : AWSModel


/**
 <p>The S3 object location of the medical transcript.</p><p>Use this URI to access the medical transcript. This URI points to the S3 bucket you created to store the medical transcript.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcriptFileUri;

@end

/**
 <p>The data structure that contains the information for a medical transcription job.</p>
 */
@interface AWSTranscribeMedicalTranscriptionJob : AWSModel


/**
 <p>A timestamp that shows when the job was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionTime;

/**
 <p>Shows the type of content that you've configured Amazon Transcribe Medical to identify in a transcription job. If the value is <code>PHI</code>, you've configured the job to identify personal health information (PHI) in the transcription output.</p>
 */
@property (nonatomic, assign) AWSTranscribeMedicalContentIdentificationType contentIdentificationType;

/**
 <p>A timestamp that shows when the job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p><p>The <code>FailureReason</code> field contains one of the following values:</p><ul><li><p><code>Unsupported media format</code>- The media format specified in the <code>MediaFormat</code> field of the request isn't valid. See the description of the <code>MediaFormat</code> field for a list of valid values.</p></li><li><p><code>The media format provided does not match the detected media format</code>- The media format of the audio file doesn't match the format specified in the <code>MediaFormat</code> field in the request. Check the media format of your media file and make sure the two values match.</p></li><li><p><code>Invalid sample rate for audio file</code>- The sample rate specified in the <code>MediaSampleRateHertz</code> of the request isn't valid. The sample rate must be between 8,000 and 48,000 Hertz.</p></li><li><p><code>The sample rate provided does not match the detected sample rate</code>- The sample rate in the audio file doesn't match the sample rate specified in the <code>MediaSampleRateHertz</code> field in the request. Check the sample rate of your media file and make sure that the two values match.</p></li><li><p><code>Invalid file size: file size too large</code>- The size of your audio file is larger than what Amazon Transcribe Medical can process. For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits">Guidelines and Quotas</a> in the <i>Amazon Transcribe Medical Guide</i>.</p></li><li><p><code>Invalid number of channels: number of channels too large</code>- Your audio contains more channels than Amazon Transcribe Medical is configured to process. To request additional channels, see <a href="https://docs.aws.amazon.com/general/latest/gr/transcribe-medical.html">Amazon Transcribe Medical Endpoints and Quotas</a> in the <i>Amazon Web Services General Reference</i>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The language code for the language spoken in the source audio file. US English (en-US) is the only supported language for medical transcriptions. Any other value you enter for language code results in a <code>BadRequestException</code> error.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>Describes the input media file in a transcription request.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedia * _Nullable media;

/**
 <p>The format of the input media file.</p>
 */
@property (nonatomic, assign) AWSTranscribeMediaFormat mediaFormat;

/**
 <p>The sample rate, in Hertz, of the source audio containing medical information.</p><p>If you don't specify the sample rate, Amazon Transcribe Medical determines it for you. If you choose to specify the sample rate, it must match the rate detected by Amazon Transcribe Medical.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mediaSampleRateHertz;

/**
 <p>The name for a given medical transcription job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable medicalTranscriptionJobName;

/**
 <p>Object that contains object.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedicalTranscriptionSetting * _Nullable settings;

/**
 <p>The medical specialty of any clinicians providing a dictation or having a conversation. Refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-medical-conversation.html">Transcribing a medical conversation</a>for a list of supported specialties.</p>
 */
@property (nonatomic, assign) AWSTranscribeSpecialty specialty;

/**
 <p>A timestamp that shows when the job started processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>A key:value pair assigned to a given medical transcription job.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeTag *> * _Nullable tags;

/**
 <p>An object that contains the <code>MedicalTranscript</code>. The <code>MedicalTranscript</code> contains the <code>TranscriptFileUri</code>.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedicalTranscript * _Nullable transcript;

/**
 <p>The completion status of a medical transcription job.</p>
 */
@property (nonatomic, assign) AWSTranscribeTranscriptionJobStatus transcriptionJobStatus;

/**
 <p>The type of speech in the transcription job. <code>CONVERSATION</code> is generally used for patient-physician dialogues. <code>DICTATION</code> is the setting for physicians speaking their notes after seeing a patient. For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/what-is-transcribe-med.html">What is Amazon Transcribe Medical?</a>.</p>
 */
@property (nonatomic, assign) AWSTranscribeTypes types;

@end

/**
 <p>Provides summary information about a transcription job.</p>
 */
@interface AWSTranscribeMedicalTranscriptionJobSummary : AWSModel


/**
 <p>A timestamp that shows when the job was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionTime;

/**
 <p>Shows the type of information you've configured Amazon Transcribe Medical to identify in a transcription job. If the value is <code>PHI</code>, you've configured the transcription job to identify personal health information (PHI).</p>
 */
@property (nonatomic, assign) AWSTranscribeMedicalContentIdentificationType contentIdentificationType;

/**
 <p>A timestamp that shows when the medical transcription job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, a description of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The language of the transcript in the source audio file.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The name of a medical transcription job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable medicalTranscriptionJobName;

/**
 <p>Indicates the location of the transcription job's output. This field must be the path of an S3 bucket; if you don't already have an S3 bucket, one is created based on the path you add.</p>
 */
@property (nonatomic, assign) AWSTranscribeOutputLocationType outputLocationType;

/**
 <p>The medical specialty of the transcription job. Refer to <a href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-medical-conversation.html">Transcribing a medical conversation</a>for a list of supported specialties.</p>
 */
@property (nonatomic, assign) AWSTranscribeSpecialty specialty;

/**
 <p>A timestamp that shows when the job began processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The status of the medical transcription job.</p>
 */
@property (nonatomic, assign) AWSTranscribeTranscriptionJobStatus transcriptionJobStatus;

/**
 <p>The speech of the clinician in the input audio.</p>
 */
@property (nonatomic, assign) AWSTranscribeTypes types;

@end

/**
 <p>Optional settings for the <a>StartMedicalTranscriptionJob</a> operation.</p>
 */
@interface AWSTranscribeMedicalTranscriptionSetting : AWSModel


/**
 <p>Instructs Amazon Transcribe Medical to process each audio channel separately and then merge the transcription output of each channel into a single transcription.</p><p>Amazon Transcribe Medical also produces a transcription of each item detected on an audio channel, including the start time and end time of the item and alternative transcriptions of item. The alternative transcriptions also come with confidence scores provided by Amazon Transcribe Medical.</p><p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable channelIdentification;

/**
 <p>The maximum number of alternatives that you tell the service to return. If you specify the <code>MaxAlternatives</code> field, you must set the <code>ShowAlternatives</code> field to true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAlternatives;

/**
 <p>The maximum number of speakers to identify in the input audio. If there are more speakers in the audio than this number, multiple speakers are identified as a single speaker. If you specify the <code>MaxSpeakerLabels</code> field, you must set the <code>ShowSpeakerLabels</code> field to true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSpeakerLabels;

/**
 <p>Determines whether alternative transcripts are generated along with the transcript that has the highest confidence. If you set <code>ShowAlternatives</code> field to true, you must also set the maximum number of alternatives to return in the <code>MaxAlternatives</code> field.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable showAlternatives;

/**
 <p>Determines whether the transcription job uses speaker recognition to identify different speakers in the input audio. Speaker recognition labels individual speakers in the audio file. If you set the <code>ShowSpeakerLabels</code> field to true, you must also set the maximum number of speaker labels in the <code>MaxSpeakerLabels</code> field.</p><p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable showSpeakerLabels;

/**
 <p>The name of the vocabulary to use when processing a medical transcription job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 <p>The object used to call your custom language model to your transcription job.</p>
 */
@interface AWSTranscribeModelSettings : AWSModel


/**
 <p>The name of your custom language model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable languageModelName;

@end

/**
 <p>An object that enables you to configure your category to be applied to call analytics jobs where either the customer or agent was interrupted.</p>
 */
@interface AWSTranscribeNonTalkTimeFilter : AWSModel


/**
 <p>An object you can use to specify a time range (in milliseconds) for when no one is talking. For example, you could specify a time period between the 30,000 millisecond mark and the 45,000 millisecond mark. You could also specify the time period as the first 15,000 milliseconds or the last 15,000 milliseconds.</p>
 */
@property (nonatomic, strong) AWSTranscribeAbsoluteTimeRange * _Nullable absoluteTimeRange;

/**
 <p>Set to <code>TRUE</code> to look for a time period when people were talking.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable negate;

/**
 <p>An object that allows percentages to specify the proportion of the call where there was silence. For example, you can specify the first half of the call. You can also specify the period of time between halfway through to three-quarters of the way through the call. Because the length of conversation can vary between calls, you can apply relative time ranges across all calls.</p>
 */
@property (nonatomic, strong) AWSTranscribeRelativeTimeRange * _Nullable relativeTimeRange;

/**
 <p>The duration of the period when neither the customer nor agent was talking.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable threshold;

@end

/**
 <p>An object that allows percentages to specify the proportion of the call where you would like to apply a filter. For example, you can specify the first half of the call. You can also specify the period of time between halfway through to three-quarters of the way through the call. Because the length of conversation can vary between calls, you can apply relative time ranges across all calls. </p>
 */
@interface AWSTranscribeRelativeTimeRange : AWSModel


/**
 <p>A value that indicates the percentage of the end of the time range. To set a relative time range, you must specify a start percentage and an end percentage. For example, if you specify the following values:</p><ul><li><p>StartPercentage - 10</p></li><li><p>EndPercentage - 50</p></li></ul><p>This looks at the time range starting from 10% of the way into the call to 50% of the way through the call. For a call that lasts 100,000 milliseconds, this example range would apply from the 10,000 millisecond mark to the 50,000 millisecond mark.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endPercentage;

/**
 <p>A range that takes the portion of the call up to the time in milliseconds set by the value that you've specified. For example, if you specify <code>120000</code>, the time range is set for the first 120,000 milliseconds of the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable first;

/**
 <p>A range that takes the portion of the call from the time in milliseconds set by the value that you've specified to the end of the call. For example, if you specify <code>120000</code>, the time range is set for the last 120,000 milliseconds of the call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable last;

/**
 <p>A value that indicates the percentage of the beginning of the time range. To set a relative time range, you must specify a start percentage and an end percentage. For example, if you specify the following values:</p><ul><li><p>StartPercentage - 10</p></li><li><p>EndPercentage - 50</p></li></ul><p>This looks at the time range starting from 10% of the way into the call to 50% of the way through the call. For a call that lasts 100,000 milliseconds, this example range would apply from the 10,000 millisecond mark to the 50,000 millisecond mark.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startPercentage;

@end

/**
 <p>A condition in the call between the customer and the agent that you want to filter for.</p>
 */
@interface AWSTranscribeRule : AWSModel


/**
 <p>A condition for a time period when either the customer or agent was interrupting the other person. </p>
 */
@property (nonatomic, strong) AWSTranscribeInterruptionFilter * _Nullable interruptionFilter;

/**
 <p>A condition for a time period when neither the customer nor the agent was talking.</p>
 */
@property (nonatomic, strong) AWSTranscribeNonTalkTimeFilter * _Nullable nonTalkTimeFilter;

/**
 <p>A condition that is applied to a particular customer sentiment.</p>
 */
@property (nonatomic, strong) AWSTranscribeSentimentFilter * _Nullable sentimentFilter;

/**
 <p>A condition that catches particular words or phrases based on a exact match. For example, if you set the phrase "I want to speak to the manager", only that exact phrase will be returned.</p>
 */
@property (nonatomic, strong) AWSTranscribeTranscriptFilter * _Nullable transcriptFilter;

@end

/**
 <p>An object that enables you to specify a particular customer or agent sentiment. If at least 50 percent of the conversation turns (the back-and-forth between two speakers) in a specified time period match the specified sentiment, Amazon Transcribe will consider the sentiment a match.</p>
 Required parameters: [Sentiments]
 */
@interface AWSTranscribeSentimentFilter : AWSModel


/**
 <p>The time range, measured in seconds, of the sentiment.</p>
 */
@property (nonatomic, strong) AWSTranscribeAbsoluteTimeRange * _Nullable absoluteTimeRange;

/**
 <p>Set to <code>TRUE</code> to look for sentiments that weren't specified in the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable negate;

/**
 <p>A value that determines whether the sentiment belongs to the customer or the agent.</p>
 */
@property (nonatomic, assign) AWSTranscribeParticipantRole participantRole;

/**
 <p>The time range, set in percentages, that correspond to proportion of the call.</p>
 */
@property (nonatomic, strong) AWSTranscribeRelativeTimeRange * _Nullable relativeTimeRange;

/**
 <p>An array that enables you to specify sentiments for the customer or agent. You can specify one or more values.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sentiments;

@end

/**
 <p>Provides optional settings for the <code>StartTranscriptionJob</code> operation.</p>
 */
@interface AWSTranscribeSettings : AWSModel


/**
 <p>Instructs Amazon Transcribe to process each audio channel separately and then merge the transcription output of each channel into a single transcription.</p><p>Amazon Transcribe also produces a transcription of each item detected on an audio channel, including the start time and end time of the item and alternative transcriptions of the item including the confidence that Amazon Transcribe has in the transcription.</p><p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable channelIdentification;

/**
 <p>The number of alternative transcriptions that the service should return. If you specify the <code>MaxAlternatives</code> field, you must set the <code>ShowAlternatives</code> field to true.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAlternatives;

/**
 <p>The maximum number of speakers to identify in the input audio. If there are more speakers in the audio than this number, multiple speakers are identified as a single speaker. If you specify the <code>MaxSpeakerLabels</code> field, you must set the <code>ShowSpeakerLabels</code> field to true.</p>
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
 <p>Set to <code>mask</code> to remove filtered text from the transcript and replace it with three asterisks ("***") as placeholder text. Set to <code>remove</code> to remove filtered text from the transcript without using placeholder text. Set to <code>tag</code> to mark the word in the transcription output that matches the vocabulary filter. When you set the filter method to <code>tag</code>, the words matching your vocabulary filter are not masked or removed.</p>
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
@interface AWSTranscribeStartCallAnalyticsJobRequest : AWSRequest


/**
 <p>The name of the call analytics job. You can't use the string "." or ".." by themselves as the job name. The name must also be unique within an Amazon Web Services account. If you try to create a call analytics job with the same name as a previous call analytics job, you get a <code>ConflictException</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callAnalyticsJobName;

/**
 <p>When you start a call analytics job, you must pass an array that maps the agent and the customer to specific audio channels. The values you can assign to a channel are 0 and 1. The agent and the customer must each have their own channel. You can't assign more than one channel to an agent or customer. </p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeChannelDefinition *> * _Nullable channelDefinitions;

/**
 <p>The Amazon Resource Name (ARN) of a role that has access to the S3 bucket that contains your input files. Amazon Transcribe assumes this role to read queued audio files. If you have specified an output S3 bucket for your transcription results, this role should have access to the output bucket as well.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

/**
 <p>Describes the input media file in a transcription request.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedia * _Nullable media;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon Web Services Key Management Service key used to encrypt the output of the call analytics job. The user calling the operation must have permission to use the specified KMS key.</p><p>You use either of the following to identify an Amazon Web Services KMS key in the current account:</p><ul><li><p>KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab"</p></li><li><p>KMS Key Alias: "alias/ExampleAlias"</p></li></ul><p> You can use either of the following to identify a KMS key in the current account or another account:</p><ul><li><p>Amazon Resource Name (ARN) of a KMS key in the current account or another account: "arn:aws:kms:region:account ID:key/1234abcd-12ab-34cd-56ef1234567890ab"</p></li><li><p>ARN of a KMS Key Alias: "arn:aws:kms:region:accountID:alias/ExampleAlias"</p></li></ul><p>If you don't specify an encryption key, the output of the call analytics job is encrypted with the default Amazon S3 key (SSE-S3).</p><p>If you specify a KMS key to encrypt your output, you must also specify an output location in the <code>OutputLocation</code> parameter. </p>
 */
@property (nonatomic, strong) NSString * _Nullable outputEncryptionKMSKeyId;

/**
 <p>The Amazon S3 location where the output of the call analytics job is stored. You can provide the following location types to store the output of call analytics job:</p><ul><li><p>s3://DOC-EXAMPLE-BUCKET1</p><p> If you specify a bucket, Amazon Transcribe saves the output of the analytics job as a JSON file at the root level of the bucket.</p></li><li><p>s3://DOC-EXAMPLE-BUCKET1/folder/</p><p>f you specify a path, Amazon Transcribe saves the output of the analytics job as s3://DOC-EXAMPLE-BUCKET1/folder/your-transcription-job-name.json.</p><p>If you specify a folder, you must provide a trailing slash.</p></li><li><p>s3://DOC-EXAMPLE-BUCKET1/folder/filename.json.</p><p> If you provide a path that has the filename specified, Amazon Transcribe saves the output of the analytics job as s3://DOC-EXAMPLEBUCKET1/folder/filename.json.</p></li></ul><p>You can specify an Amazon Web Services Key Management Service (KMS) key to encrypt the output of our analytics job using the <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side encryption of the analytics job output that is placed in your S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputLocation;

/**
 <p>A <code>Settings</code> object that provides optional settings for a call analytics job.</p>
 */
@property (nonatomic, strong) AWSTranscribeCallAnalyticsJobSettings * _Nullable settings;

@end

/**
 
 */
@interface AWSTranscribeStartCallAnalyticsJobResponse : AWSModel


/**
 <p>An object containing the details of the asynchronous call analytics job.</p>
 */
@property (nonatomic, strong) AWSTranscribeCallAnalyticsJob * _Nullable callAnalyticsJob;

@end

/**
 
 */
@interface AWSTranscribeStartMedicalTranscriptionJobRequest : AWSRequest


/**
 <p>You can configure Amazon Transcribe Medical to label content in the transcription output. If you specify <code>PHI</code>, Amazon Transcribe Medical labels the personal health information (PHI) that it identifies in the transcription output.</p>
 */
@property (nonatomic, assign) AWSTranscribeMedicalContentIdentificationType contentIdentificationType;

/**
 <p>A map of plain text, non-secret key:value pairs, known as encryption context pairs, that provide an added layer of security for your data.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable KMSEncryptionContext;

/**
 <p>The language code for the language spoken in the input media file. US English (en-US) is the valid value for medical transcription jobs. Any other value you enter for language code results in a <code>BadRequestException</code> error.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>Describes the input media file in a transcription request.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedia * _Nullable media;

/**
 <p>The audio format of the input media file.</p>
 */
@property (nonatomic, assign) AWSTranscribeMediaFormat mediaFormat;

/**
 <p>The sample rate, in Hertz, of the audio track in the input media file.</p><p>If you do not specify the media sample rate, Amazon Transcribe Medical determines the sample rate. If you specify the sample rate, it must match the rate detected by Amazon Transcribe Medical. In most cases, you should leave the <code>MediaSampleRateHertz</code> field blank and let Amazon Transcribe Medical determine the sample rate.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mediaSampleRateHertz;

/**
 <p>The name of the medical transcription job. You can't use the strings "<code>.</code>" or "<code>..</code>" by themselves as the job name. The name must also be unique within an Amazon Web Services account. If you try to create a medical transcription job with the same name as a previous medical transcription job, you get a <code>ConflictException</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable medicalTranscriptionJobName;

/**
 <p>The Amazon S3 location where the transcription is stored.</p><p>You must set <code>OutputBucketName</code> for Amazon Transcribe Medical to store the transcription results. Your transcript appears in the S3 location you specify. When you call the <a>GetMedicalTranscriptionJob</a>, the operation returns this location in the <code>TranscriptFileUri</code> field. The S3 bucket must have permissions that allow Amazon Transcribe Medical to put files in the bucket. For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user">Permissions Required for IAM User Roles</a>.</p><p>You can specify an Amazon Web Services Key Management Service (KMS) key to encrypt the output of your transcription using the <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a KMS key, Amazon Transcribe Medical uses the default Amazon S3 key for server-side encryption of transcripts that are placed in your S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputBucketName;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon Web Services Key Management Service (KMS) key used to encrypt the output of the transcription job. The user calling the <a>StartMedicalTranscriptionJob</a> operation must have permission to use the specified KMS key.</p><p>You use either of the following to identify a KMS key in the current account:</p><ul><li><p>KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab"</p></li><li><p>KMS Key Alias: "alias/ExampleAlias"</p></li></ul><p>You can use either of the following to identify a KMS key in the current account or another account:</p><ul><li><p>Amazon Resource Name (ARN) of a KMS key in the current account or another account: "arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab"</p></li><li><p>ARN of a KMS Key Alias: "arn:aws:kms:region:account ID:alias/ExampleAlias"</p></li></ul><p>If you don't specify an encryption key, the output of the medical transcription job is encrypted with the default Amazon S3 key (SSE-S3).</p><p>If you specify a KMS key to encrypt your output, you must also specify an output location in the <code>OutputBucketName</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputEncryptionKMSKeyId;

/**
 <p>You can specify a location in an Amazon S3 bucket to store the output of your medical transcription job.</p><p>If you don't specify an output key, Amazon Transcribe Medical stores the output of your transcription job in the Amazon S3 bucket you specified. By default, the object key is "your-transcription-job-name.json".</p><p>You can use output keys to specify the Amazon S3 prefix and file name of the transcription output. For example, specifying the Amazon S3 prefix, "folder1/folder2/", as an output key would lead to the output being stored as "folder1/folder2/your-transcription-job-name.json". If you specify "my-other-job-name.json" as the output key, the object key is changed to "my-other-job-name.json". You can use an output key to change both the prefix and the file name, for example "folder/my-other-job-name.json".</p><p>If you specify an output key, you must also specify an S3 bucket in the <code>OutputBucketName</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputKey;

/**
 <p>Optional settings for the medical transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedicalTranscriptionSetting * _Nullable settings;

/**
 <p>The medical specialty of any clinician speaking in the input media.</p>
 */
@property (nonatomic, assign) AWSTranscribeSpecialty specialty;

/**
 <p>Add tags to an Amazon Transcribe Medical transcription job.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeTag *> * _Nullable tags;

/**
 <p>The type of speech in the input audio. <code>CONVERSATION</code> refers to conversations between two or more speakers, e.g., a conversations between doctors and patients. <code>DICTATION</code> refers to single-speaker dictated speech, such as clinical notes.</p>
 */
@property (nonatomic, assign) AWSTranscribeTypes types;

@end

/**
 
 */
@interface AWSTranscribeStartMedicalTranscriptionJobResponse : AWSModel


/**
 <p>A batch job submitted to transcribe medical speech to text.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedicalTranscriptionJob * _Nullable medicalTranscriptionJob;

@end

/**
 
 */
@interface AWSTranscribeStartTranscriptionJobRequest : AWSRequest


/**
 <p>An object that contains the request parameters for content redaction.</p>
 */
@property (nonatomic, strong) AWSTranscribeContentRedaction * _Nullable contentRedaction;

/**
 <p>Set this field to <code>true</code> to enable automatic language identification. Automatic language identification is disabled by default. You receive a <code>BadRequestException</code> error if you enter a value for a <code>LanguageCode</code>.</p><p>You must include either <code>LanguageCode</code> or <code>IdentifyLanguage</code> in your request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifyLanguage;

/**
 <p>Provides information about how a transcription job is executed. Use this field to indicate that the job can be queued for deferred execution if the concurrency limit is reached and there are no slots available to immediately run the job.</p>
 */
@property (nonatomic, strong) AWSTranscribeJobExecutionSettings * _Nullable jobExecutionSettings;

/**
 <p>A map of plain text, non-secret key:value pairs, known as encryption context pairs, that provide an added layer of security for your data.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable KMSEncryptionContext;

/**
 <p>The language code for the language used in the input media file. You must include either <code>LanguageCode</code> or <code>IdentifyLanguage</code> in your request.</p><p>To transcribe speech in Modern Standard Arabic (ar-SA), your audio or video file must be encoded at a sample rate of 16,000 Hz or higher.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The language identification settings associated with your transcription job. These settings include <code>VocabularyName</code>, <code>VocabularyFilterName</code>, and <code>LanguageModelName</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSTranscribeLanguageIdSettings *> * _Nullable languageIdSettings;

/**
 <p>An object containing a list of languages that might be present in your collection of audio files. Automatic language identification chooses a language that best matches the source audio from that list.</p><p>To transcribe speech in Modern Standard Arabic (ar-SA), your audio or video file must be encoded at a sample rate of 16,000 Hz or higher.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable languageOptions;

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
 <p>Choose the custom language model you use for your transcription job in this parameter.</p>
 */
@property (nonatomic, strong) AWSTranscribeModelSettings * _Nullable modelSettings;

/**
 <p>The location where the transcription is stored.</p><p>If you set the <code>OutputBucketName</code>, Amazon Transcribe puts the transcript in the specified S3 bucket. When you call the <a>GetTranscriptionJob</a> operation, the operation returns this location in the <code>TranscriptFileUri</code> field. If you enable content redaction, the redacted transcript appears in <code>RedactedTranscriptFileUri</code>. If you enable content redaction and choose to output an unredacted transcript, that transcript's location still appears in the <code>TranscriptFileUri</code>. The S3 bucket must have permissions that allow Amazon Transcribe to put files in the bucket. For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user">Permissions Required for IAM User Roles</a>.</p><p>You can specify an Amazon Web Services Key Management Service (KMS) key to encrypt the output of your transcription using the <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side encryption of transcripts that are placed in your S3 bucket.</p><p>If you don't set the <code>OutputBucketName</code>, Amazon Transcribe generates a pre-signed URL, a shareable URL that provides secure access to your transcription, and returns it in the <code>TranscriptFileUri</code> field. Use this URL to download the transcription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputBucketName;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon Web Services Key Management Service (KMS) key used to encrypt the output of the transcription job. The user calling the <code>StartTranscriptionJob</code> operation must have permission to use the specified KMS key.</p><p>You can use either of the following to identify a KMS key in the current account:</p><ul><li><p>KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab"</p></li><li><p>KMS Key Alias: "alias/ExampleAlias"</p></li></ul><p>You can use either of the following to identify a KMS key in the current account or another account:</p><ul><li><p>Amazon Resource Name (ARN) of a KMS Key: "arn:aws:kms:region:account ID:key/1234abcd-12ab-34cd-56ef-1234567890ab"</p></li><li><p>ARN of a KMS Key Alias: "arn:aws:kms:region:account-ID:alias/ExampleAlias"</p></li></ul><p>If you don't specify an encryption key, the output of the transcription job is encrypted with the default Amazon S3 key (SSE-S3).</p><p>If you specify a KMS key to encrypt your output, you must also specify an output location in the <code>OutputBucketName</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputEncryptionKMSKeyId;

/**
 <p>You can specify a location in an Amazon S3 bucket to store the output of your transcription job.</p><p>If you don't specify an output key, Amazon Transcribe stores the output of your transcription job in the Amazon S3 bucket you specified. By default, the object key is "your-transcription-job-name.json".</p><p>You can use output keys to specify the Amazon S3 prefix and file name of the transcription output. For example, specifying the Amazon S3 prefix, "folder1/folder2/", as an output key would lead to the output being stored as "folder1/folder2/your-transcription-job-name.json". If you specify "my-other-job-name.json" as the output key, the object key is changed to "my-other-job-name.json". You can use an output key to change both the prefix and the file name, for example "folder/my-other-job-name.json".</p><p>If you specify an output key, you must also specify an S3 bucket in the <code>OutputBucketName</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputKey;

/**
 <p>A <code>Settings</code> object that provides optional settings for a transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeSettings * _Nullable settings;

/**
 <p>Add subtitles to your batch transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeSubtitles * _Nullable subtitles;

/**
 <p>Add tags to an Amazon Transcribe transcription job.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeTag *> * _Nullable tags;

/**
 <p>The name of the job. You can't use the strings "<code>.</code>" or "<code>..</code>" by themselves as the job name. The name must also be unique within an Amazon Web Services account. If you try to create a transcription job with the same name as a previous transcription job, you get a <code>ConflictException</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcriptionJobName;

@end

/**
 
 */
@interface AWSTranscribeStartTranscriptionJobResponse : AWSModel


/**
 <p>Provides information about your asynchronous transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeTranscriptionJob * _Nullable transcriptionJob;

@end

/**
 <p>Generate subtitles for your batch transcription job. Note that your subtitle files are placed in the same location as your transcription output.</p>
 */
@interface AWSTranscribeSubtitles : AWSModel


/**
 <p>Specify the output format for your subtitle file; if you select both <code>srt</code> and <code>vtt</code> formats, two output files are generated.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable formats;

/**
 <p>Defines the starting value that is assigned to the first subtitle segment.</p><p>The default start index for Amazon Transcribe is <code>0</code>, which differs from the more widely used standard of <code>1</code>. If you're uncertain which value to use, we recommend choosing <code>1</code>, as this may improve compatibility with other services.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable outputStartIndex;

@end

/**
 <p>The S3 location where your subtitle files are located. Note that your subtitle files are placed in the same location as your transcription output. Refer to <code>TranscriptFileUri</code> to download your files.</p>
 */
@interface AWSTranscribeSubtitlesOutput : AWSModel


/**
 <p>The format of your subtitle files. If your request specified both <code>srt</code> and <code>vtt</code> formats, both formats are shown.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable formats;

/**
 <p>Shows the output start index value for your subtitle files. If you did not specify a value in your request, the default value of <code>0</code> is used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable outputStartIndex;

/**
 <p>Contains the output location for your subtitle file. This location must be an S3 bucket.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subtitleFileUris;

@end

/**
 <p>A key:value pair that adds metadata to a resource used by Amazon Transcribe. For example, a tag with the key:value pair ‘Department’:’Sales’ might be added to a resource to indicate its use by your organization's sales department.</p>
 Required parameters: [Key, Value]
 */
@interface AWSTranscribeTag : AWSModel


/**
 <p>The first part of a key:value pair that forms a tag associated with a given resource. For example, in the tag ‘Department’:’Sales’, the key is 'Department'.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The second part of a key:value pair that forms a tag associated with a given resource. For example, in the tag ‘Department’:’Sales’, the value is 'Sales'.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSTranscribeTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the Amazon Transcribe resource you want to tag. ARNs have the format <code>arn:partition:service:region:account-id:resource-type/resource-id</code> (for example, <code>arn:aws:transcribe:us-east-1:account-id:transcription-job/your-job-name</code>). Valid values for <code>resource-type</code> are: <code>transcription-job</code>, <code>medical-transcription-job</code>, <code>vocabulary</code>, <code>medical-vocabulary</code>, <code>vocabulary-filter</code>, and <code>language-model</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags you are assigning to a given Amazon Transcribe resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSTranscribeTagResourceResponse : AWSModel


@end

/**
 <p>Identifies the location of a transcription.</p>
 */
@interface AWSTranscribeTranscript : AWSModel


/**
 <p>The S3 object location of the redacted transcript.</p><p>Use this URI to access the redacted transcript. If you specified an S3 bucket in the <code>OutputBucketName</code> field when you created the job, this is the URI of that bucket. If you chose to store the transcript in Amazon Transcribe, this is a shareable URL that provides secure access to that location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable redactedTranscriptFileUri;

/**
 <p>The S3 object location of the transcript.</p><p>Use this URI to access the transcript. If you specified an S3 bucket in the <code>OutputBucketName</code> field when you created the job, this is the URI of that bucket. If you chose to store the transcript in Amazon Transcribe, this is a shareable URL that provides secure access to that location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcriptFileUri;

@end

/**
 <p>Matches the output of the transcription to either the specific phrases that you specify, or the intent of the phrases that you specify.</p>
 Required parameters: [TranscriptFilterType, Targets]
 */
@interface AWSTranscribeTranscriptFilter : AWSModel


/**
 <p>A time range, set in seconds, between two points in the call.</p>
 */
@property (nonatomic, strong) AWSTranscribeAbsoluteTimeRange * _Nullable absoluteTimeRange;

/**
 <p>If <code>TRUE</code>, the rule that you specify is applied to everything except for the phrases that you specify.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable negate;

/**
 <p>Determines whether the customer or the agent is speaking the phrases that you've specified.</p>
 */
@property (nonatomic, assign) AWSTranscribeParticipantRole participantRole;

/**
 <p>An object that allows percentages to specify the proportion of the call where you would like to apply a filter. For example, you can specify the first half of the call. You can also specify the period of time between halfway through to three-quarters of the way through the call. Because the length of conversation can vary between calls, you can apply relative time ranges across all calls.</p>
 */
@property (nonatomic, strong) AWSTranscribeRelativeTimeRange * _Nullable relativeTimeRange;

/**
 <p>The phrases that you're specifying for the transcript filter to match.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targets;

/**
 <p>Matches the phrase to the transcription output in a word for word fashion. For example, if you specify the phrase "I want to speak to the manager." Amazon Transcribe attempts to match that specific phrase to the transcription.</p>
 */
@property (nonatomic, assign) AWSTranscribeTranscriptFilterType transcriptFilterType;

@end

/**
 <p>Describes an asynchronous transcription job that was created with the <code>StartTranscriptionJob</code> operation. </p>
 */
@interface AWSTranscribeTranscriptionJob : AWSModel


/**
 <p>A timestamp that shows when the job completed.</p>
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
 <p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p><p>The <code>FailureReason</code> field can contain one of the following values:</p><ul><li><p><code>Unsupported media format</code> - The media format specified in the <code>MediaFormat</code> field of the request isn't valid. See the description of the <code>MediaFormat</code> field for a list of valid values.</p></li><li><p><code>The media format provided does not match the detected media format</code> - The media format of the audio file doesn't match the format specified in the <code>MediaFormat</code> field in the request. Check the media format of your media file and make sure that the two values match.</p></li><li><p><code>Invalid sample rate for audio file</code> - The sample rate specified in the <code>MediaSampleRateHertz</code> of the request isn't valid. The sample rate must be between 8,000 and 48,000 Hertz.</p></li><li><p><code>The sample rate provided does not match the detected sample rate</code> - The sample rate in the audio file doesn't match the sample rate specified in the <code>MediaSampleRateHertz</code> field in the request. Check the sample rate of your media file and make sure that the two values match.</p></li><li><p><code>Invalid file size: file size too large</code> - The size of your audio file is larger than Amazon Transcribe can process. For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits">Limits</a> in the <i>Amazon Transcribe Developer Guide</i>.</p></li><li><p><code>Invalid number of channels: number of channels too large</code> - Your audio contains more channels than Amazon Transcribe is configured to process. To request additional channels, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits-amazon-transcribe">Amazon Transcribe Limits</a> in the <i>Amazon Web Services General Reference</i>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>A value between zero and one that Amazon Transcribe assigned to the language that it identified in the source audio. Larger values indicate that Amazon Transcribe has higher confidence in the language it identified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifiedLanguageScore;

/**
 <p>A value that shows if automatic language identification was enabled for a transcription job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifyLanguage;

/**
 <p>Provides information about how a transcription job is executed.</p>
 */
@property (nonatomic, strong) AWSTranscribeJobExecutionSettings * _Nullable jobExecutionSettings;

/**
 <p>The language code for the input speech.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>Language-specific settings that can be specified when language identification is enabled for your transcription job. These settings include <code>VocabularyName</code>, <code>VocabularyFilterName</code>, and <code>LanguageModelName</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSTranscribeLanguageIdSettings *> * _Nullable languageIdSettings;

/**
 <p>An object that shows the optional array of languages inputted for transcription jobs with automatic language identification enabled.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable languageOptions;

/**
 <p>An object that describes the input media for the transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedia * _Nullable media;

/**
 <p>The format of the input media file.</p>
 */
@property (nonatomic, assign) AWSTranscribeMediaFormat mediaFormat;

/**
 <p>The sample rate, in Hertz (Hz), of the audio track in the input media file.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mediaSampleRateHertz;

/**
 <p>An object containing the details of your custom language model.</p>
 */
@property (nonatomic, strong) AWSTranscribeModelSettings * _Nullable modelSettings;

/**
 <p>Optional settings for the transcription job. Use these settings to turn on speaker recognition, to set the maximum number of speakers that should be identified and to specify a custom vocabulary to use when processing the transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeSettings * _Nullable settings;

/**
 <p>A timestamp that shows when the job started processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>Generate subtitles for your batch transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeSubtitlesOutput * _Nullable subtitles;

/**
 <p>A key:value pair assigned to a given transcription job.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeTag *> * _Nullable tags;

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
 <p>A value between zero and one that Amazon Transcribe assigned to the language it identified in the source audio. A higher score indicates that Amazon Transcribe is more confident in the language it identified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifiedLanguageScore;

/**
 <p>Whether automatic language identification was enabled for a transcription job.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifyLanguage;

/**
 <p>The language code for the input speech.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The object used to call your custom language model to your transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeModelSettings * _Nullable modelSettings;

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
@interface AWSTranscribeUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the Amazon Transcribe resource you want to remove tags from. ARNs have the format <code>arn:partition:service:region:account-id:resource-type/resource-id</code> (for example, <code>arn:aws:transcribe:us-east-1:account-id:transcription-job/your-job-name</code>). Valid values for <code>resource-type</code> are: <code>transcription-job</code>, <code>medical-transcription-job</code>, <code>vocabulary</code>, <code>medical-vocabulary</code>, <code>vocabulary-filter</code>, and <code>language-model</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A list of tag keys you want to remove from a specified Amazon Transcribe resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSTranscribeUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSTranscribeUpdateCallAnalyticsCategoryRequest : AWSRequest


/**
 <p>The name of the analytics category to update. The name is case sensitive. If you try to update a call analytics category with the same name as a previous category you will receive a <code>ConflictException</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable categoryName;

/**
 <p>The rules used for the updated analytics category. The rules that you provide in this field replace the ones that are currently being used.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeRule *> * _Nullable rules;

@end

/**
 
 */
@interface AWSTranscribeUpdateCallAnalyticsCategoryResponse : AWSModel


/**
 <p>The attributes describing the analytics category. You can see information such as the rules that you've used to update the category and when the category was originally created.</p>
 */
@property (nonatomic, strong) AWSTranscribeCategoryProperties * _Nullable categoryProperties;

@end

/**
 
 */
@interface AWSTranscribeUpdateMedicalVocabularyRequest : AWSRequest


/**
 <p>The language code of the language used for the entries in the updated vocabulary. U.S. English (en-US) is the only valid language code in Amazon Transcribe Medical.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The location in Amazon S3 of the text file that contains your custom vocabulary. The URI must be in the same Amazon Web Services Region as the resource that you are calling. The following is the format for a URI:</p><p><code>https://s3.aws-region.amazonaws.com/bucket-name/keyprefix/objectkey</code></p><p>For example:</p><p><code>https://s3.us-east-1.amazonaws.com/DOC-EXAMPLE-BUCKET/vocab.txt</code></p><p>For more information about Amazon S3 object names, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p><p>For more information about custom vocabularies in Amazon Transcribe Medical, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-med.html">Medical Custom Vocabularies</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFileUri;

/**
 <p>The name of the vocabulary to update. The name is case sensitive. If you try to update a vocabulary with the same name as a vocabulary you've already made, you get a <code>ConflictException</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeUpdateMedicalVocabularyResponse : AWSModel


/**
 <p>The language code for the language of the text file used to update the custom vocabulary. US English (en-US) is the only language supported in Amazon Transcribe Medical.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time that the vocabulary was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the updated vocabulary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

/**
 <p>The processing state of the update to the vocabulary. When the <code>VocabularyState</code> field is <code>READY</code>, the vocabulary is ready to be used in a <code>StartMedicalTranscriptionJob</code> request.</p>
 */
@property (nonatomic, assign) AWSTranscribeVocabularyState vocabularyState;

@end

/**
 
 */
@interface AWSTranscribeUpdateVocabularyFilterRequest : AWSRequest


/**
 <p>The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character Sets for Custom Vocabularies</a>.</p><p>The specified file must be less than 50 KB of UTF-8 characters.</p><p>If you provide the location of a list of words in the <code>VocabularyFilterFileUri</code> parameter, you can't use the <code>Words</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterFileUri;

/**
 <p>The name of the vocabulary filter to update. If you try to update a vocabulary filter with the same name as another vocabulary filter, you get a <code>ConflictException</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterName;

/**
 <p>The words to use in the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character Sets for Custom Vocabularies</a>.</p><p>If you provide a list of words in the <code>Words</code> parameter, you can't use the <code>VocabularyFilterFileUri</code> parameter.</p>
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
 <p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported languages</a>.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>An array of strings containing the vocabulary entries.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable phrases;

/**
 <p>The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is:</p><p><code>https://s3.aws-region.amazonaws.com/bucket-name/keyprefix/objectkey</code></p><p>For example:</p><p><code>https://s3.us-east-1.amazonaws.com/DOC-EXAMPLE-BUCKET/vocab.txt</code></p><p>For more information about S3 object names, see <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p><p>For more information about custom vocabularies, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">Custom Vocabularies</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFileUri;

/**
 <p>The name of the vocabulary to update. The name is case sensitive. If you try to update a vocabulary with the same name as a previous vocabulary you will receive a <code>ConflictException</code> error.</p>
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
