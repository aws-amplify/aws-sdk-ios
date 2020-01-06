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

FOUNDATION_EXPORT NSString *const AWSPollyErrorDomain;

typedef NS_ENUM(NSInteger, AWSPollyErrorType) {
    AWSPollyErrorUnknown,
    AWSPollyErrorEngineNotSupported,
    AWSPollyErrorInvalidLexicon,
    AWSPollyErrorInvalidNextToken,
    AWSPollyErrorInvalidS3Bucket,
    AWSPollyErrorInvalidS3Key,
    AWSPollyErrorInvalidSampleRate,
    AWSPollyErrorInvalidSnsTopicArn,
    AWSPollyErrorInvalidSsml,
    AWSPollyErrorInvalidTaskId,
    AWSPollyErrorLanguageNotSupported,
    AWSPollyErrorLexiconNotFound,
    AWSPollyErrorLexiconSizeExceeded,
    AWSPollyErrorMarksNotSupportedForFormat,
    AWSPollyErrorMaxLexemeLengthExceeded,
    AWSPollyErrorMaxLexiconsNumberExceeded,
    AWSPollyErrorServiceFailure,
    AWSPollyErrorSsmlMarksNotSupportedForTextType,
    AWSPollyErrorSynthesisTaskNotFound,
    AWSPollyErrorTextLengthExceeded,
    AWSPollyErrorUnsupportedPlsAlphabet,
    AWSPollyErrorUnsupportedPlsLanguage,
};

typedef NS_ENUM(NSInteger, AWSPollyEngine) {
    AWSPollyEngineUnknown,
    AWSPollyEngineStandard,
    AWSPollyEngineNeural,
};

typedef NS_ENUM(NSInteger, AWSPollyGender) {
    AWSPollyGenderUnknown,
    AWSPollyGenderFemale,
    AWSPollyGenderMale,
};

typedef NS_ENUM(NSInteger, AWSPollyLanguageCode) {
    AWSPollyLanguageCodeUnknown,
    AWSPollyLanguageCodeArb,
    AWSPollyLanguageCodeCmnCN,
    AWSPollyLanguageCodeCyGB,
    AWSPollyLanguageCodeDaDK,
    AWSPollyLanguageCodeDeDE,
    AWSPollyLanguageCodeEnAU,
    AWSPollyLanguageCodeEnGB,
    AWSPollyLanguageCodeEnGBWLS,
    AWSPollyLanguageCodeEnIN,
    AWSPollyLanguageCodeEnUS,
    AWSPollyLanguageCodeEsES,
    AWSPollyLanguageCodeEsMX,
    AWSPollyLanguageCodeEsUS,
    AWSPollyLanguageCodeFrCA,
    AWSPollyLanguageCodeFrFR,
    AWSPollyLanguageCodeIsIS,
    AWSPollyLanguageCodeItIT,
    AWSPollyLanguageCodeJaJP,
    AWSPollyLanguageCodeHiIN,
    AWSPollyLanguageCodeKoKR,
    AWSPollyLanguageCodeNbNO,
    AWSPollyLanguageCodeNlNL,
    AWSPollyLanguageCodePlPL,
    AWSPollyLanguageCodePtBR,
    AWSPollyLanguageCodePtPT,
    AWSPollyLanguageCodeRoRO,
    AWSPollyLanguageCodeRuRU,
    AWSPollyLanguageCodeSvSE,
    AWSPollyLanguageCodeTrTR,
};

typedef NS_ENUM(NSInteger, AWSPollyOutputFormat) {
    AWSPollyOutputFormatUnknown,
    AWSPollyOutputFormatJson,
    AWSPollyOutputFormatMp3,
    AWSPollyOutputFormatOggVorbis,
    AWSPollyOutputFormatPcm,
};

typedef NS_ENUM(NSInteger, AWSPollySpeechMarkType) {
    AWSPollySpeechMarkTypeUnknown,
    AWSPollySpeechMarkTypeSentence,
    AWSPollySpeechMarkTypeSsml,
    AWSPollySpeechMarkTypeViseme,
    AWSPollySpeechMarkTypeWord,
};

typedef NS_ENUM(NSInteger, AWSPollyTaskStatus) {
    AWSPollyTaskStatusUnknown,
    AWSPollyTaskStatusScheduled,
    AWSPollyTaskStatusInProgress,
    AWSPollyTaskStatusCompleted,
    AWSPollyTaskStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSPollyTextType) {
    AWSPollyTextTypeUnknown,
    AWSPollyTextTypeSsml,
    AWSPollyTextTypeText,
};

typedef NS_ENUM(NSInteger, AWSPollyVoiceId) {
    AWSPollyVoiceIdUnknown,
    AWSPollyVoiceIdAditi,
    AWSPollyVoiceIdAmy,
    AWSPollyVoiceIdAstrid,
    AWSPollyVoiceIdBianca,
    AWSPollyVoiceIdBrian,
    AWSPollyVoiceIdCamila,
    AWSPollyVoiceIdCarla,
    AWSPollyVoiceIdCarmen,
    AWSPollyVoiceIdCeline,
    AWSPollyVoiceIdChantal,
    AWSPollyVoiceIdConchita,
    AWSPollyVoiceIdCristiano,
    AWSPollyVoiceIdDora,
    AWSPollyVoiceIdEmma,
    AWSPollyVoiceIdEnrique,
    AWSPollyVoiceIdEwa,
    AWSPollyVoiceIdFiliz,
    AWSPollyVoiceIdGeraint,
    AWSPollyVoiceIdGiorgio,
    AWSPollyVoiceIdGwyneth,
    AWSPollyVoiceIdHans,
    AWSPollyVoiceIdInes,
    AWSPollyVoiceIdIvy,
    AWSPollyVoiceIdJacek,
    AWSPollyVoiceIdJan,
    AWSPollyVoiceIdJoanna,
    AWSPollyVoiceIdJoey,
    AWSPollyVoiceIdJustin,
    AWSPollyVoiceIdKarl,
    AWSPollyVoiceIdKendra,
    AWSPollyVoiceIdKimberly,
    AWSPollyVoiceIdLea,
    AWSPollyVoiceIdLiv,
    AWSPollyVoiceIdLotte,
    AWSPollyVoiceIdLucia,
    AWSPollyVoiceIdLupe,
    AWSPollyVoiceIdMads,
    AWSPollyVoiceIdMaja,
    AWSPollyVoiceIdMarlene,
    AWSPollyVoiceIdMathieu,
    AWSPollyVoiceIdMatthew,
    AWSPollyVoiceIdMaxim,
    AWSPollyVoiceIdMia,
    AWSPollyVoiceIdMiguel,
    AWSPollyVoiceIdMizuki,
    AWSPollyVoiceIdNaja,
    AWSPollyVoiceIdNicole,
    AWSPollyVoiceIdPenelope,
    AWSPollyVoiceIdRaveena,
    AWSPollyVoiceIdRicardo,
    AWSPollyVoiceIdRuben,
    AWSPollyVoiceIdRussell,
    AWSPollyVoiceIdSalli,
    AWSPollyVoiceIdSeoyeon,
    AWSPollyVoiceIdTakumi,
    AWSPollyVoiceIdTatyana,
    AWSPollyVoiceIdVicki,
    AWSPollyVoiceIdVitoria,
    AWSPollyVoiceIdZeina,
    AWSPollyVoiceIdZhiyu,
};

@class AWSPollyDeleteLexiconInput;
@class AWSPollyDeleteLexiconOutput;
@class AWSPollyDescribeVoicesInput;
@class AWSPollyDescribeVoicesOutput;
@class AWSPollyGetLexiconInput;
@class AWSPollyGetLexiconOutput;
@class AWSPollyGetSpeechSynthesisTaskInput;
@class AWSPollyGetSpeechSynthesisTaskOutput;
@class AWSPollyLexicon;
@class AWSPollyLexiconAttributes;
@class AWSPollyLexiconDescription;
@class AWSPollyListLexiconsInput;
@class AWSPollyListLexiconsOutput;
@class AWSPollyListSpeechSynthesisTasksInput;
@class AWSPollyListSpeechSynthesisTasksOutput;
@class AWSPollyPutLexiconInput;
@class AWSPollyPutLexiconOutput;
@class AWSPollyStartSpeechSynthesisTaskInput;
@class AWSPollyStartSpeechSynthesisTaskOutput;
@class AWSPollySynthesisTask;
@class AWSPollySynthesizeSpeechInput;
@class AWSPollySynthesizeSpeechOutput;
@class AWSPollyVoice;

/**
 
 */
@interface AWSPollyDeleteLexiconInput : AWSRequest


/**
 <p>The name of the lexicon to delete. Must be an existing lexicon in the region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSPollyDeleteLexiconOutput : AWSModel


@end

/**
 
 */
@interface AWSPollyDescribeVoicesInput : AWSRequest


/**
 <p>Specifies the engine (<code>standard</code> or <code>neural</code>) used by Amazon Polly when processing input text for speech synthesis. </p>
 */
@property (nonatomic, assign) AWSPollyEngine engine;

/**
 <p>Boolean value indicating whether to return any bilingual voices that use the specified language as an additional language. For instance, if you request all languages that use US English (es-US), and there is an Italian voice that speaks both Italian (it-IT) and US English, that voice will be included if you specify <code>yes</code> but not if you specify <code>no</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeAdditionalLanguageCodes;

/**
 <p> The language identification tag (ISO 639 code for the language name-ISO 3166 country code) for filtering the list of voices returned. If you don't specify this optional parameter, all available voices are returned. </p>
 */
@property (nonatomic, assign) AWSPollyLanguageCode languageCode;

/**
 <p>An opaque pagination token returned from the previous <code>DescribeVoices</code> operation. If present, this indicates where to continue the listing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPollyDescribeVoicesOutput : AWSModel


/**
 <p>The pagination token to use in the next request to continue the listing of voices. <code>NextToken</code> is returned only if the response is truncated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of voices with their properties.</p>
 */
@property (nonatomic, strong) NSArray<AWSPollyVoice *> * _Nullable voices;

@end

/**
 
 */
@interface AWSPollyGetLexiconInput : AWSRequest


/**
 <p>Name of the lexicon.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSPollyGetLexiconOutput : AWSModel


/**
 <p>Lexicon object that provides name and the string content of the lexicon. </p>
 */
@property (nonatomic, strong) AWSPollyLexicon * _Nullable lexicon;

/**
 <p>Metadata of the lexicon, including phonetic alphabetic used, language code, lexicon ARN, number of lexemes defined in the lexicon, and size of lexicon in bytes.</p>
 */
@property (nonatomic, strong) AWSPollyLexiconAttributes * _Nullable lexiconAttributes;

@end

/**
 
 */
@interface AWSPollyGetSpeechSynthesisTaskInput : AWSRequest


/**
 <p>The Amazon Polly generated identifier for a speech synthesis task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

@end

/**
 
 */
@interface AWSPollyGetSpeechSynthesisTaskOutput : AWSModel


/**
 <p>SynthesisTask object that provides information from the requested task, including output format, creation time, task status, and so on.</p>
 */
@property (nonatomic, strong) AWSPollySynthesisTask * _Nullable synthesisTask;

@end

/**
 <p>Provides lexicon name and lexicon content in string format. For more information, see <a href="https://www.w3.org/TR/pronunciation-lexicon/">Pronunciation Lexicon Specification (PLS) Version 1.0</a>.</p>
 */
@interface AWSPollyLexicon : AWSModel


/**
 <p>Lexicon content in string format. The content of a lexicon must be in PLS format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>Name of the lexicon.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Contains metadata describing the lexicon such as the number of lexemes, language code, and so on. For more information, see <a href="https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing Lexicons</a>.</p>
 */
@interface AWSPollyLexiconAttributes : AWSModel


/**
 <p>Phonetic alphabet used in the lexicon. Valid values are <code>ipa</code> and <code>x-sampa</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alphabet;

/**
 <p>Language code that the lexicon applies to. A lexicon with a language code such as "en" would be applied to all English languages (en-GB, en-US, en-AUS, en-WLS, and so on.</p>
 */
@property (nonatomic, assign) AWSPollyLanguageCode languageCode;

/**
 <p>Date lexicon was last modified (a timestamp value).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModified;

/**
 <p>Number of lexemes in the lexicon.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lexemesCount;

/**
 <p>Amazon Resource Name (ARN) of the lexicon.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lexiconArn;

/**
 <p>Total size of the lexicon, in characters.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

@end

/**
 <p>Describes the content of the lexicon.</p>
 */
@interface AWSPollyLexiconDescription : AWSModel


/**
 <p>Provides lexicon metadata.</p>
 */
@property (nonatomic, strong) AWSPollyLexiconAttributes * _Nullable attributes;

/**
 <p>Name of the lexicon.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSPollyListLexiconsInput : AWSRequest


/**
 <p>An opaque pagination token returned from previous <code>ListLexicons</code> operation. If present, indicates where to continue the list of lexicons.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPollyListLexiconsOutput : AWSModel


/**
 <p>A list of lexicon names and attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSPollyLexiconDescription *> * _Nullable lexicons;

/**
 <p>The pagination token to use in the next request to continue the listing of lexicons. <code>NextToken</code> is returned only if the response is truncated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSPollyListSpeechSynthesisTasksInput : AWSRequest


/**
 <p>Maximum number of speech synthesis tasks returned in a List operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token to use in the next request to continue the listing of speech synthesis tasks. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Status of the speech synthesis tasks returned in a List operation</p>
 */
@property (nonatomic, assign) AWSPollyTaskStatus status;

@end

/**
 
 */
@interface AWSPollyListSpeechSynthesisTasksOutput : AWSModel


/**
 <p>An opaque pagination token returned from the previous List operation in this request. If present, this indicates where to continue the listing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>List of SynthesisTask objects that provides information from the specified task in the list request, including output format, creation time, task status, and so on.</p>
 */
@property (nonatomic, strong) NSArray<AWSPollySynthesisTask *> * _Nullable synthesisTasks;

@end

/**
 
 */
@interface AWSPollyPutLexiconInput : AWSRequest


/**
 <p>Content of the PLS lexicon as string data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>Name of the lexicon. The name must follow the regular express format [0-9A-Za-z]{1,20}. That is, the name is a case-sensitive alphanumeric string up to 20 characters long. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSPollyPutLexiconOutput : AWSModel


@end

/**
 
 */
@interface AWSPollyStartSpeechSynthesisTaskInput : AWSRequest


/**
 <p>Specifies the engine (<code>standard</code> or <code>neural</code>) for Amazon Polly to use when processing input text for speech synthesis. Using a voice that is not supported for the engine selected will result in an error.</p>
 */
@property (nonatomic, assign) AWSPollyEngine engine;

/**
 <p>Optional language code for the Speech Synthesis request. This is only necessary if using a bilingual voice, such as Aditi, which can be used for either Indian English (en-IN) or Hindi (hi-IN). </p><p>If a bilingual voice is used and no language code is specified, Amazon Polly will use the default language of the bilingual voice. The default language for any voice is the one returned by the <a href="https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html">DescribeVoices</a> operation for the <code>LanguageCode</code> parameter. For example, if no language code is specified, Aditi will use Indian English rather than Hindi.</p>
 */
@property (nonatomic, assign) AWSPollyLanguageCode languageCode;

/**
 <p>List of one or more pronunciation lexicon names you want the service to apply during synthesis. Lexicons are applied only if the language of the lexicon is the same as the language of the voice. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable lexiconNames;

/**
 <p>The format in which the returned output will be encoded. For audio stream, this will be mp3, ogg_vorbis, or pcm. For speech marks, this will be json. </p>
 */
@property (nonatomic, assign) AWSPollyOutputFormat outputFormat;

/**
 <p>Amazon S3 bucket name to which the output file will be saved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3BucketName;

/**
 <p>The Amazon S3 key prefix for the output speech file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputS3KeyPrefix;

/**
 <p>The audio frequency specified in Hz.</p><p>The valid values for mp3 and ogg_vorbis are "8000", "16000", "22050", and "24000". The default value for standard voices is "22050". The default value for neural voices is "24000".</p><p>Valid values for pcm are "8000" and "16000" The default value is "16000". </p>
 */
@property (nonatomic, strong) NSString * _Nullable sampleRate;

/**
 <p>ARN for the SNS topic optionally used for providing status notification for a speech synthesis task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>The type of speech marks returned for the input text.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable speechMarkTypes;

/**
 <p>The input text to synthesize. If you specify ssml as the TextType, follow the SSML format for the input text. </p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p>Specifies whether the input text is plain text or SSML. The default value is plain text. </p>
 */
@property (nonatomic, assign) AWSPollyTextType textType;

/**
 <p>Voice ID to use for the synthesis. </p>
 */
@property (nonatomic, assign) AWSPollyVoiceId voiceId;

@end

/**
 
 */
@interface AWSPollyStartSpeechSynthesisTaskOutput : AWSModel


/**
 <p>SynthesisTask object that provides information and attributes about a newly submitted speech synthesis task.</p>
 */
@property (nonatomic, strong) AWSPollySynthesisTask * _Nullable synthesisTask;

@end

/**
 <p>SynthesisTask object that provides information about a speech synthesis task.</p>
 */
@interface AWSPollySynthesisTask : AWSModel


/**
 <p>Timestamp for the time the synthesis task was started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Specifies the engine (<code>standard</code> or <code>neural</code>) for Amazon Polly to use when processing input text for speech synthesis. Using a voice that is not supported for the engine selected will result in an error.</p>
 */
@property (nonatomic, assign) AWSPollyEngine engine;

/**
 <p>Optional language code for a synthesis task. This is only necessary if using a bilingual voice, such as Aditi, which can be used for either Indian English (en-IN) or Hindi (hi-IN). </p><p>If a bilingual voice is used and no language code is specified, Amazon Polly will use the default language of the bilingual voice. The default language for any voice is the one returned by the <a href="https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html">DescribeVoices</a> operation for the <code>LanguageCode</code> parameter. For example, if no language code is specified, Aditi will use Indian English rather than Hindi.</p>
 */
@property (nonatomic, assign) AWSPollyLanguageCode languageCode;

/**
 <p>List of one or more pronunciation lexicon names you want the service to apply during synthesis. Lexicons are applied only if the language of the lexicon is the same as the language of the voice. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable lexiconNames;

/**
 <p>The format in which the returned output will be encoded. For audio stream, this will be mp3, ogg_vorbis, or pcm. For speech marks, this will be json. </p>
 */
@property (nonatomic, assign) AWSPollyOutputFormat outputFormat;

/**
 <p>Pathway for the output speech file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputUri;

/**
 <p>Number of billable characters synthesized.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requestCharacters;

/**
 <p>The audio frequency specified in Hz.</p><p>The valid values for mp3 and ogg_vorbis are "8000", "16000", "22050", and "24000". The default value for standard voices is "22050". The default value for neural voices is "24000".</p><p>Valid values for pcm are "8000" and "16000" The default value is "16000". </p>
 */
@property (nonatomic, strong) NSString * _Nullable sampleRate;

/**
 <p>ARN for the SNS topic optionally used for providing status notification for a speech synthesis task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsTopicArn;

/**
 <p>The type of speech marks returned for the input text.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable speechMarkTypes;

/**
 <p>The Amazon Polly generated identifier for a speech synthesis task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskId;

/**
 <p>Current status of the individual speech synthesis task.</p>
 */
@property (nonatomic, assign) AWSPollyTaskStatus taskStatus;

/**
 <p>Reason for the current status of a specific speech synthesis task, including errors if the task has failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable taskStatusReason;

/**
 <p>Specifies whether the input text is plain text or SSML. The default value is plain text. </p>
 */
@property (nonatomic, assign) AWSPollyTextType textType;

/**
 <p>Voice ID to use for the synthesis. </p>
 */
@property (nonatomic, assign) AWSPollyVoiceId voiceId;

@end

/**
 
 */
@interface AWSPollySynthesizeSpeechInput : AWSRequest


/**
 <p>Specifies the engine (<code>standard</code> or <code>neural</code>) for Amazon Polly to use when processing input text for speech synthesis. Using a voice that is not supported for the engine selected will result in an error.</p>
 */
@property (nonatomic, assign) AWSPollyEngine engine;

/**
 <p>Optional language code for the Synthesize Speech request. This is only necessary if using a bilingual voice, such as Aditi, which can be used for either Indian English (en-IN) or Hindi (hi-IN). </p><p>If a bilingual voice is used and no language code is specified, Amazon Polly will use the default language of the bilingual voice. The default language for any voice is the one returned by the <a href="https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html">DescribeVoices</a> operation for the <code>LanguageCode</code> parameter. For example, if no language code is specified, Aditi will use Indian English rather than Hindi.</p>
 */
@property (nonatomic, assign) AWSPollyLanguageCode languageCode;

/**
 <p>List of one or more pronunciation lexicon names you want the service to apply during synthesis. Lexicons are applied only if the language of the lexicon is the same as the language of the voice. For information about storing lexicons, see <a href="https://docs.aws.amazon.com/polly/latest/dg/API_PutLexicon.html">PutLexicon</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable lexiconNames;

/**
 <p> The format in which the returned output will be encoded. For audio stream, this will be mp3, ogg_vorbis, or pcm. For speech marks, this will be json. </p><p>When pcm is used, the content returned is audio/pcm in a signed 16-bit, 1 channel (mono), little-endian format. </p>
 */
@property (nonatomic, assign) AWSPollyOutputFormat outputFormat;

/**
 <p>The audio frequency specified in Hz.</p><p>The valid values for mp3 and ogg_vorbis are "8000", "16000", "22050", and "24000". The default value for standard voices is "22050". The default value for neural voices is "24000".</p><p>Valid values for pcm are "8000" and "16000" The default value is "16000". </p>
 */
@property (nonatomic, strong) NSString * _Nullable sampleRate;

/**
 <p>The type of speech marks returned for the input text.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable speechMarkTypes;

/**
 <p> Input text to synthesize. If you specify <code>ssml</code> as the <code>TextType</code>, follow the SSML format for the input text. </p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

/**
 <p> Specifies whether the input text is plain text or SSML. The default value is plain text. For more information, see <a href="https://docs.aws.amazon.com/polly/latest/dg/ssml.html">Using SSML</a>.</p>
 */
@property (nonatomic, assign) AWSPollyTextType textType;

/**
 <p> Voice ID to use for the synthesis. You can get a list of available voice IDs by calling the <a href="https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html">DescribeVoices</a> operation. </p>
 */
@property (nonatomic, assign) AWSPollyVoiceId voiceId;

@end

/**
 
 */
@interface AWSPollySynthesizeSpeechOutput : AWSModel


/**
 <p> Stream containing the synthesized speech. </p>
 */
@property (nonatomic, strong) NSData * _Nullable audioStream;

/**
 <p> Specifies the type audio stream. This should reflect the <code>OutputFormat</code> parameter in your request. </p><ul><li><p> If you request <code>mp3</code> as the <code>OutputFormat</code>, the <code>ContentType</code> returned is audio/mpeg. </p></li><li><p> If you request <code>ogg_vorbis</code> as the <code>OutputFormat</code>, the <code>ContentType</code> returned is audio/ogg. </p></li><li><p> If you request <code>pcm</code> as the <code>OutputFormat</code>, the <code>ContentType</code> returned is audio/pcm in a signed 16-bit, 1 channel (mono), little-endian format. </p></li><li><p>If you request <code>json</code> as the <code>OutputFormat</code>, the <code>ContentType</code> returned is audio/json.</p></li></ul><p></p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>Number of characters synthesized.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requestCharacters;

@end

/**
 <p>Description of the voice.</p>
 */
@interface AWSPollyVoice : AWSModel


/**
 <p>Additional codes for languages available for the specified voice in addition to its default language. </p><p>For example, the default language for Aditi is Indian English (en-IN) because it was first used for that language. Since Aditi is bilingual and fluent in both Indian English and Hindi, this parameter would show the code <code>hi-IN</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable additionalLanguageCodes;

/**
 <p>Gender of the voice.</p>
 */
@property (nonatomic, assign) AWSPollyGender gender;

/**
 <p>Amazon Polly assigned voice ID. This is the ID that you specify when calling the <code>SynthesizeSpeech</code> operation.</p>
 */
@property (nonatomic, assign) AWSPollyVoiceId identifier;

/**
 <p>Language code of the voice.</p>
 */
@property (nonatomic, assign) AWSPollyLanguageCode languageCode;

/**
 <p>Human readable name of the language in English.</p>
 */
@property (nonatomic, strong) NSString * _Nullable languageName;

/**
 <p>Name of the voice (for example, Salli, Kendra, etc.). This provides a human readable voice name that you might display in your application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies which engines (<code>standard</code> or <code>neural</code>) that are supported by a given voice.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedEngines;

@end

NS_ASSUME_NONNULL_END
