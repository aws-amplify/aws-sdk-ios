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

typedef NS_ENUM(NSInteger, AWSTranscribeBaseModelName) {
    AWSTranscribeBaseModelNameUnknown,
    AWSTranscribeBaseModelNameNarrowBand,
    AWSTranscribeBaseModelNameWideBand,
};

typedef NS_ENUM(NSInteger, AWSTranscribeCLMLanguageCode) {
    AWSTranscribeCLMLanguageCodeUnknown,
    AWSTranscribeCLMLanguageCodeEnUS,
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

typedef NS_ENUM(NSInteger, AWSTranscribeRedactionOutput) {
    AWSTranscribeRedactionOutputUnknown,
    AWSTranscribeRedactionOutputRedacted,
    AWSTranscribeRedactionOutputRedactedAndUnredacted,
};

typedef NS_ENUM(NSInteger, AWSTranscribeRedactionType) {
    AWSTranscribeRedactionTypeUnknown,
    AWSTranscribeRedactionTypePii,
};

typedef NS_ENUM(NSInteger, AWSTranscribeSpecialty) {
    AWSTranscribeSpecialtyUnknown,
    AWSTranscribeSpecialtyPrimarycare,
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
};

typedef NS_ENUM(NSInteger, AWSTranscribeVocabularyState) {
    AWSTranscribeVocabularyStateUnknown,
    AWSTranscribeVocabularyStatePending,
    AWSTranscribeVocabularyStateReady,
    AWSTranscribeVocabularyStateFailed,
};

@class AWSTranscribeContentRedaction;
@class AWSTranscribeCreateLanguageModelRequest;
@class AWSTranscribeCreateLanguageModelResponse;
@class AWSTranscribeCreateMedicalVocabularyRequest;
@class AWSTranscribeCreateMedicalVocabularyResponse;
@class AWSTranscribeCreateVocabularyFilterRequest;
@class AWSTranscribeCreateVocabularyFilterResponse;
@class AWSTranscribeCreateVocabularyRequest;
@class AWSTranscribeCreateVocabularyResponse;
@class AWSTranscribeDeleteLanguageModelRequest;
@class AWSTranscribeDeleteMedicalTranscriptionJobRequest;
@class AWSTranscribeDeleteMedicalVocabularyRequest;
@class AWSTranscribeDeleteTranscriptionJobRequest;
@class AWSTranscribeDeleteVocabularyFilterRequest;
@class AWSTranscribeDeleteVocabularyRequest;
@class AWSTranscribeDescribeLanguageModelRequest;
@class AWSTranscribeDescribeLanguageModelResponse;
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
@class AWSTranscribeJobExecutionSettings;
@class AWSTranscribeLanguageModel;
@class AWSTranscribeListLanguageModelsRequest;
@class AWSTranscribeListLanguageModelsResponse;
@class AWSTranscribeListMedicalTranscriptionJobsRequest;
@class AWSTranscribeListMedicalTranscriptionJobsResponse;
@class AWSTranscribeListMedicalVocabulariesRequest;
@class AWSTranscribeListMedicalVocabulariesResponse;
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
@class AWSTranscribeSettings;
@class AWSTranscribeStartMedicalTranscriptionJobRequest;
@class AWSTranscribeStartMedicalTranscriptionJobResponse;
@class AWSTranscribeStartTranscriptionJobRequest;
@class AWSTranscribeStartTranscriptionJobResponse;
@class AWSTranscribeTranscript;
@class AWSTranscribeTranscriptionJob;
@class AWSTranscribeTranscriptionJobSummary;
@class AWSTranscribeUpdateMedicalVocabularyRequest;
@class AWSTranscribeUpdateMedicalVocabularyResponse;
@class AWSTranscribeUpdateVocabularyFilterRequest;
@class AWSTranscribeUpdateVocabularyFilterResponse;
@class AWSTranscribeUpdateVocabularyRequest;
@class AWSTranscribeUpdateVocabularyResponse;
@class AWSTranscribeVocabularyFilterInfo;
@class AWSTranscribeVocabularyInfo;

/**
 <p>Settings for content redaction within a transcription job.</p>
 Required parameters: [RedactionType, RedactionOutput]
 */
@interface AWSTranscribeContentRedaction : AWSModel


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
@interface AWSTranscribeCreateLanguageModelRequest : AWSRequest


/**
 <p>The Amazon Transcribe standard language model, or base model used to create your custom language model.</p><p>If you want to use your custom language model to transcribe audio with a sample rate of 16 kHz or greater, choose <code>Wideband</code>.</p><p>If you want to use your custom language model to transcribe audio with a sample rate that is less than 16 kHz, choose <code>Narrowband</code>.</p>
 */
@property (nonatomic, assign) AWSTranscribeBaseModelName baseModelName;

/**
 <p>Contains the data access role and the Amazon S3 prefixes to read the required input files to create a custom language model.</p>
 */
@property (nonatomic, strong) AWSTranscribeInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The language of the input text you're using to train your custom language model.</p>
 */
@property (nonatomic, assign) AWSTranscribeCLMLanguageCode languageCode;

/**
 <p>The name you choose for your custom language model when you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

@end

/**
 
 */
@interface AWSTranscribeCreateLanguageModelResponse : AWSModel


/**
 <p>The Amazon Transcribe standard language model, or base model you've used to create a custom language model.</p>
 */
@property (nonatomic, assign) AWSTranscribeBaseModelName baseModelName;

/**
 <p>The data access role and Amazon S3 prefixes you've chosen to create your custom language model.</p>
 */
@property (nonatomic, strong) AWSTranscribeInputDataConfig * _Nullable inputDataConfig;

/**
 <p>The language code of the text you've used to create a custom language model.</p>
 */
@property (nonatomic, assign) AWSTranscribeCLMLanguageCode languageCode;

/**
 <p>The name you've chosen for your custom language model.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

/**
 <p>The status of the custom language model. When the status is <code>COMPLETED</code> the model is ready to use.</p>
 */
@property (nonatomic, assign) AWSTranscribeModelStatus modelStatus;

@end

/**
 
 */
@interface AWSTranscribeCreateMedicalVocabularyRequest : AWSRequest


/**
 <p>The language code for the language used for the entries in your custom vocabulary. The language code of your custom vocabulary must match the language code of your transcription job. US English (en-US) is the only language code available for Amazon Transcribe Medical.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The location in Amazon S3 of the text file you use to define your custom vocabulary. The URI must be in the same AWS Region as the resource that you're calling. Enter information about your <code>VocabularyFileUri</code> in the following format:</p><p><code> https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code></p><p>The following is an example URI for a vocabulary file that is stored in Amazon S3:</p><p><code>https://s3.us-east-1.amazonaws.com/AWSDOC-EXAMPLE-BUCKET/vocab.txt</code></p><p>For more information about Amazon S3 object names, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p><p>For more information about custom vocabularies, see <a href="http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary-med">Medical Custom Vocabularies</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFileUri;

/**
 <p>The name of the custom vocabulary. This case-sensitive name must be unique within an AWS account. If you try to create a vocabulary with the same name as a previous vocabulary, you get a <code>ConflictException</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeCreateMedicalVocabularyResponse : AWSModel


/**
 <p>If the <code>VocabularyState</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The language code for the entries in your custom vocabulary. US English (en-US) is the only valid language code for Amazon Transcribe Medical.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The date and time that you created the vocabulary.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedTime;

/**
 <p>The name of the vocabulary. The name must be unique within an AWS account and is case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

/**
 <p>The processing state of your custom vocabulary in Amazon Transcribe Medical. If the state is <code>READY</code>, you can use the vocabulary in a <code>StartMedicalTranscriptionJob</code> request.</p>
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
 <p>The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character Sets for Custom Vocabularies</a>.</p><p>The specified file must be less than 50 KB of UTF-8 characters.</p><p>If you provide the location of a list of words in the <code>VocabularyFilterFileUri</code> parameter, you can't use the <code>Words</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterFileUri;

/**
 <p>The vocabulary filter name. The name must be unique within the account that contains it. If you try to create a vocabulary filter with the same name as another vocabulary filter, you get a <code>ConflictException</code> error.</p>
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
 <p>The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is </p><p>For more information about S3 object names, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p><p>For more information about custom vocabularies, see <a href="http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary">Custom Vocabularies</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFileUri;

/**
 <p>The name of the vocabulary. The name must be unique within an AWS account. The name is case sensitive. If you try to create a vocabulary with the same name as a previous vocabulary you will receive a <code>ConflictException</code> error.</p>
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
@interface AWSTranscribeDeleteLanguageModelRequest : AWSRequest


/**
 <p>The name of the model you're choosing to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable modelName;

@end

/**
 
 */
@interface AWSTranscribeDeleteMedicalTranscriptionJobRequest : AWSRequest


/**
 <p>The name you provide to the <code>DeleteMedicalTranscriptionJob</code> object to delete a transcription job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable medicalTranscriptionJobName;

@end

/**
 
 */
@interface AWSTranscribeDeleteMedicalVocabularyRequest : AWSRequest


/**
 <p>The name of the vocabulary that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

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
@interface AWSTranscribeDescribeLanguageModelRequest : AWSRequest


/**
 <p>The name of the custom language model you submit to get more information.</p>
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
@interface AWSTranscribeGetMedicalTranscriptionJobRequest : AWSRequest


/**
 <p>The name of the medical transcription job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable medicalTranscriptionJobName;

@end

/**
 
 */
@interface AWSTranscribeGetMedicalTranscriptionJobResponse : AWSModel


/**
 <p>An object that contains the results of the medical transcription job.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedicalTranscriptionJob * _Nullable medicalTranscriptionJob;

@end

/**
 
 */
@interface AWSTranscribeGetMedicalVocabularyRequest : AWSRequest


/**
 <p>The name of the vocabulary that you want information about. The value is case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWSTranscribeGetMedicalVocabularyResponse : AWSModel


/**
 <p>The location in Amazon S3 where the vocabulary is stored. Use this URI to get the contents of the vocabulary. You can download your vocabulary from the URI for a limited time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable downloadUri;

/**
 <p>If the <code>VocabularyState</code> is <code>FAILED</code>, this field contains information about why the job failed.</p>
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
 <p>The processing state of the vocabulary. If the <code>VocabularyState</code> is <code>READY</code> then you can use it in the <code>StartMedicalTranscriptionJob</code> operation. </p>
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
 <p>The Amazon Resource Name (ARN) that uniquely identifies the permissions you've given Amazon Transcribe to access your Amazon S3 buckets containing your media files or text data.</p>
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
 <p>Provides information about when a transcription job should be executed.</p>
 */
@interface AWSTranscribeJobExecutionSettings : AWSModel


/**
 <p>Indicates whether a job should be queued by Amazon Transcribe when the concurrent execution limit is exceeded. When the <code>AllowDeferredExecution</code> field is true, jobs are queued and executed when the number of executing jobs falls below the concurrent execution limit. If the field is false, Amazon Transcribe returns a <code>LimitExceededException</code> exception.</p><p>If you specify the <code>AllowDeferredExecution</code> field, you must specify the <code>DataAccessRoleArn</code> field.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowDeferredExecution;

/**
 <p>The Amazon Resource Name (ARN) of a role that has access to the S3 bucket that contains the input files. Amazon Transcribe assumes this role to read queued media files. If you have specified an output S3 bucket for the transcription results, this role should have access to the output bucket as well.</p><p>If you specify the <code>AllowDeferredExecution</code> field, you must specify the <code>DataAccessRoleArn</code> field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataAccessRoleArn;

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
 <p>Whether the base model used for the custom language model is up to date. If this field is <code>true</code> then you are running the most up-to-date version of the base model in your custom language model.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable upgradeAvailability;

@end

/**
 
 */
@interface AWSTranscribeListLanguageModelsRequest : AWSRequest


/**
 <p>The maximum number of language models to return in the response. If there are fewer results in the list, the response contains only the actual results.</p>
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
 <p>The maximum number of medical transcription jobs to return in the response. IF there are fewer results in the list, this response contains only the actual results.</p>
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
 <p>The maximum number of vocabularies to return in the response.</p>
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
 <p>The <code>ListMedicalVocabularies</code> operation returns a page of vocabularies at a time. You set the maximum number of vocabularies to return on a page with the <code>MaxResults</code> parameter. If there are more jobs in the list will fit on a page, Amazon Transcribe Medical returns the <code>NextPage</code> token. To return the next page of vocabularies, include the token in the next request to the <code>ListMedicalVocabularies</code> operation .</p>
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
 <p>The list of vocabulary filters. It contains at most <code>MaxResults</code> number of filters. If there are more filters, call the <code>ListVocabularyFilters</code> operation again with the <code>NextToken</code> parameter in the request set to the value of the <code>NextToken</code> field in the response.</p>
 */
@property (nonatomic, strong) NSArray<AWSTranscribeVocabularyFilterInfo *> * _Nullable vocabularyFilters;

@end

/**
 <p>Describes the input media file in a transcription request.</p>
 */
@interface AWSTranscribeMedia : AWSModel


/**
 <p>The S3 object location of the input media file. The URI must be in the same region as the API endpoint that you are calling. The general form is:</p><p>For example:</p><p>For more information about S3 object names, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaFileUri;

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
 <p>A timestamp that shows when the job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p><p>The <code>FailureReason</code> field contains one of the following values:</p><ul><li><p><code>Unsupported media format</code>- The media format specified in the <code>MediaFormat</code> field of the request isn't valid. See the description of the <code>MediaFormat</code> field for a list of valid values.</p></li><li><p><code>The media format provided does not match the detected media format</code>- The media format of the audio file doesn't match the format specified in the <code>MediaFormat</code> field in the request. Check the media format of your media file and make sure the two values match.</p></li><li><p><code>Invalid sample rate for audio file</code>- The sample rate specified in the <code>MediaSampleRateHertz</code> of the request isn't valid. The sample rate must be between 8000 and 48000 Hertz.</p></li><li><p><code>The sample rate provided does not match the detected sample rate</code>- The sample rate in the audio file doesn't match the sample rate specified in the <code>MediaSampleRateHertz</code> field in the request. Check the sample rate of your media file and make sure that the two values match.</p></li><li><p><code>Invalid file size: file size too large</code>- The size of your audio file is larger than what Amazon Transcribe Medical can process. For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits">Guidelines and Quotas</a> in the <i>Amazon Transcribe Medical Guide</i></p></li><li><p><code>Invalid number of channels: number of channels too large</code>- Your audio contains more channels than Amazon Transcribe Medical is configured to process. To request additional channels, see <a href="https://docs.aws.amazon.com/general/latest/gr/transcribe-medical.html">Amazon Transcribe Medical Endpoints and Quotas</a> in the <i>Amazon Web Services General Reference</i></p></li></ul>
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
 <p>The sample rate, in Hertz, of the source audio containing medical information.</p><p>If you don't specify the sample rate, Amazon Transcribe Medical determines it for you. If you choose to specify the sample rate, it must match the rate detected by Amazon Transcribe Medical. In most cases, you should leave the <code>MediaSampleHertz</code> blank and let Amazon Transcribe Medical determine the sample rate.</p>
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
 <p>The medical specialty of any clinicians providing a dictation or having a conversation. <code>PRIMARYCARE</code> is the only available setting for this object. This specialty enables you to generate transcriptions for the following medical fields:</p><ul><li><p>Family Medicine</p></li></ul>
 */
@property (nonatomic, assign) AWSTranscribeSpecialty specialty;

/**
 <p>A timestamp that shows when the job started processing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>An object that contains the <code>MedicalTranscript</code>. The <code>MedicalTranscript</code> contains the <code>TranscriptFileUri</code>.</p>
 */
@property (nonatomic, strong) AWSTranscribeMedicalTranscript * _Nullable transcript;

/**
 <p>The completion status of a medical transcription job.</p>
 */
@property (nonatomic, assign) AWSTranscribeTranscriptionJobStatus transcriptionJobStatus;

/**
 <p>The type of speech in the transcription job. <code>CONVERSATION</code> is generally used for patient-physician dialogues. <code>DICTATION</code> is the setting for physicians speaking their notes after seeing a patient. For more information, see <a>how-it-works-med</a></p>
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
 <p>Indicates the location of the transcription job's output.</p><p>The <code>CUSTOMER_BUCKET</code> is the S3 location provided in the <code>OutputBucketName</code> field when the </p>
 */
@property (nonatomic, assign) AWSTranscribeOutputLocationType outputLocationType;

/**
 <p>The medical specialty of the transcription job. <code>Primary care</code> is the only valid value.</p>
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
 <p>Instructs Amazon Transcribe Medical to process each audio channel separately and then merge the transcription output of each channel into a single transcription.</p><p>Amazon Transcribe Medical also produces a transcription of each item detected on an audio channel, including the start time and end time of the item and alternative transcriptions of item. The alternative transcriptions also come with confidence scores provided by Amazon Transcribe Medical.</p><p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code></p>
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
@interface AWSTranscribeStartMedicalTranscriptionJobRequest : AWSRequest


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
 <p>The name of the medical transcription job. You can't use the strings "<code>.</code>" or "<code>..</code>" by themselves as the job name. The name must also be unique within an AWS account. If you try to create a medical transcription job with the same name as a previous medical transcription job, you get a <code>ConflictException</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable medicalTranscriptionJobName;

/**
 <p>The Amazon S3 location where the transcription is stored.</p><p>You must set <code>OutputBucketName</code> for Amazon Transcribe Medical to store the transcription results. Your transcript appears in the S3 location you specify. When you call the <a>GetMedicalTranscriptionJob</a>, the operation returns this location in the <code>TranscriptFileUri</code> field. The S3 bucket must have permissions that allow Amazon Transcribe Medical to put files in the bucket. For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user">Permissions Required for IAM User Roles</a>.</p><p>You can specify an AWS Key Management Service (KMS) key to encrypt the output of your transcription using the <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a KMS key, Amazon Transcribe Medical uses the default Amazon S3 key for server-side encryption of transcripts that are placed in your S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputBucketName;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key used to encrypt the output of the transcription job. The user calling the <a>StartMedicalTranscriptionJob</a> operation must have permission to use the specified KMS key.</p><p>You use either of the following to identify a KMS key in the current account:</p><ul><li><p>KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab"</p></li><li><p>KMS Key Alias: "alias/ExampleAlias"</p></li></ul><p>You can use either of the following to identify a KMS key in the current account or another account:</p><ul><li><p>Amazon Resource Name (ARN) of a KMS key in the current account or another account: "arn:aws:kms:region:account ID:key/1234abcd-12ab-34cd-56ef-1234567890ab"</p></li><li><p>ARN of a KMS Key Alias: "arn:aws:kms:region:account ID:alias/ExampleAlias"</p></li></ul><p>If you don't specify an encryption key, the output of the medical transcription job is encrypted with the default Amazon S3 key (SSE-S3).</p><p>If you specify a KMS key to encrypt your output, you must also specify an output location in the <code>OutputBucketName</code> parameter.</p>
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
 <p>The type of speech in the input audio. <code>CONVERSATION</code> refers to conversations between two or more speakers, e.g., a conversations between doctors and patients. <code>DICTATION</code> refers to single-speaker dictated speech, e.g., for clinical notes.</p>
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
 <p>Set this field to <code>true</code> to enable automatic language identification. Automatic language identification is disabled by default. You receive a <code>BadRequestException</code> error if you enter a value for a <code>LanguageCode</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable identifyLanguage;

/**
 <p>Provides information about how a transcription job is executed. Use this field to indicate that the job can be queued for deferred execution if the concurrency limit is reached and there are no slots available to immediately run the job.</p>
 */
@property (nonatomic, strong) AWSTranscribeJobExecutionSettings * _Nullable jobExecutionSettings;

/**
 <p>The language code for the language used in the input media file.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>An object containing a list of languages that might be present in your collection of audio files. Automatic language identification chooses a language that best matches the source audio from that list.</p>
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
 <p>The location where the transcription is stored.</p><p>If you set the <code>OutputBucketName</code>, Amazon Transcribe puts the transcript in the specified S3 bucket. When you call the <a>GetTranscriptionJob</a> operation, the operation returns this location in the <code>TranscriptFileUri</code> field. If you enable content redaction, the redacted transcript appears in <code>RedactedTranscriptFileUri</code>. If you enable content redaction and choose to output an unredacted transcript, that transcript's location still appears in the <code>TranscriptFileUri</code>. The S3 bucket must have permissions that allow Amazon Transcribe to put files in the bucket. For more information, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user">Permissions Required for IAM User Roles</a>.</p><p>You can specify an AWS Key Management Service (KMS) key to encrypt the output of your transcription using the <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side encryption of transcripts that are placed in your S3 bucket.</p><p>If you don't set the <code>OutputBucketName</code>, Amazon Transcribe generates a pre-signed URL, a shareable URL that provides secure access to your transcription, and returns it in the <code>TranscriptFileUri</code> field. Use this URL to download the transcription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputBucketName;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key used to encrypt the output of the transcription job. The user calling the <code>StartTranscriptionJob</code> operation must have permission to use the specified KMS key.</p><p>You can use either of the following to identify a KMS key in the current account:</p><ul><li><p>KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab"</p></li><li><p>KMS Key Alias: "alias/ExampleAlias"</p></li></ul><p>You can use either of the following to identify a KMS key in the current account or another account:</p><ul><li><p>Amazon Resource Name (ARN) of a KMS Key: "arn:aws:kms:region:account ID:key/1234abcd-12ab-34cd-56ef-1234567890ab"</p></li><li><p>ARN of a KMS Key Alias: "arn:aws:kms:region:account ID:alias/ExampleAlias"</p></li></ul><p>If you don't specify an encryption key, the output of the transcription job is encrypted with the default Amazon S3 key (SSE-S3). </p><p>If you specify a KMS key to encrypt your output, you must also specify an output location in the <code>OutputBucketName</code> parameter.</p>
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
 <p>The name of the job. You can't use the strings "<code>.</code>" or "<code>..</code>" by themselves as the job name. The name must also be unique within an AWS account. If you try to create a transcription job with the same name as a previous transcription job, you get a <code>ConflictException</code> error.</p>
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
 <p>The S3 object location of the redacted transcript.</p><p>Use this URI to access the redacted transcript. If you specified an S3 bucket in the <code>OutputBucketName</code> field when you created the job, this is the URI of that bucket. If you chose to store the transcript in Amazon Transcribe, this is a shareable URL that provides secure access to that location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable redactedTranscriptFileUri;

/**
 <p>The S3 object location of the transcript.</p><p>Use this URI to access the transcript. If you specified an S3 bucket in the <code>OutputBucketName</code> field when you created the job, this is the URI of that bucket. If you chose to store the transcript in Amazon Transcribe, this is a shareable URL that provides secure access to that location.</p>
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
 <p>The sample rate, in Hertz, of the audio track in the input media file. </p>
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
@interface AWSTranscribeUpdateMedicalVocabularyRequest : AWSRequest


/**
 <p>The language code of the language used for the entries in the updated vocabulary. US English (en-US) is the only valid language code in Amazon Transcribe Medical.</p>
 */
@property (nonatomic, assign) AWSTranscribeLanguageCode languageCode;

/**
 <p>The location in Amazon S3 of the text file that contains the you use for your custom vocabulary. The URI must be in the same AWS Region as the resource that you are calling. The following is the format for a URI:</p><p><code> https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code></p><p>For example:</p><p><code>https://s3.us-east-1.amazonaws.com/AWSDOC-EXAMPLE-BUCKET/vocab.txt</code></p><p>For more information about Amazon S3 object names, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p><p>For more information about custom vocabularies in Amazon Transcribe Medical, see <a href="http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary">Medical Custom Vocabularies</a>.</p>
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
 <p>The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character Sets for Custom Vocabularies</a>.</p><p>The specified file must be less than 50 KB of UTF-8 characters.</p><p>If you provide the location of a list of words in the <code>VocabularyFilterFileUri</code> parameter, you can't use the <code>Words</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyFilterFileUri;

/**
 <p>The name of the vocabulary filter to update. If you try to update a vocabulary filter with the same name as another vocabulary filter, you get a <code>ConflictException</code> error.</p>
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
 <p>The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is </p><p>For example:</p><p>For more information about S3 object names, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p><p>For more information about custom vocabularies, see <a href="http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary">Custom Vocabularies</a>.</p>
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
