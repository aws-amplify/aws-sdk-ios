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

FOUNDATION_EXPORT NSString *const AWSPollyErrorDomain;

typedef NS_ENUM(NSInteger, AWSPollyErrorType) {
    AWSPollyErrorUnknown,
    AWSPollyErrorInvalidLexicon,
    AWSPollyErrorInvalidNextToken,
    AWSPollyErrorInvalidSampleRate,
    AWSPollyErrorInvalidSsml,
    AWSPollyErrorLexiconNotFound,
    AWSPollyErrorLexiconSizeExceeded,
    AWSPollyErrorMarksNotSupportedForFormat,
    AWSPollyErrorMaxLexemeLengthExceeded,
    AWSPollyErrorMaxLexiconsNumberExceeded,
    AWSPollyErrorServiceFailure,
    AWSPollyErrorSsmlMarksNotSupportedForTextType,
    AWSPollyErrorTextLengthExceeded,
    AWSPollyErrorUnsupportedPlsAlphabet,
    AWSPollyErrorUnsupportedPlsLanguage,
};

typedef NS_ENUM(NSInteger, AWSPollyGender) {
    AWSPollyGenderUnknown,
    AWSPollyGenderFemale,
    AWSPollyGenderMale,
};

typedef NS_ENUM(NSInteger, AWSPollyLanguageCode) {
    AWSPollyLanguageCodeUnknown,
    AWSPollyLanguageCodeCyGB,
    AWSPollyLanguageCodeDaDK,
    AWSPollyLanguageCodeDeDE,
    AWSPollyLanguageCodeEnAU,
    AWSPollyLanguageCodeEnGB,
    AWSPollyLanguageCodeEnGBWLS,
    AWSPollyLanguageCodeEnIN,
    AWSPollyLanguageCodeEnUS,
    AWSPollyLanguageCodeEsES,
    AWSPollyLanguageCodeEsUS,
    AWSPollyLanguageCodeFrCA,
    AWSPollyLanguageCodeFrFR,
    AWSPollyLanguageCodeIsIS,
    AWSPollyLanguageCodeItIT,
    AWSPollyLanguageCodeKoKR,
    AWSPollyLanguageCodeJaJP,
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

typedef NS_ENUM(NSInteger, AWSPollyTextType) {
    AWSPollyTextTypeUnknown,
    AWSPollyTextTypeSsml,
    AWSPollyTextTypeText,
};

typedef NS_ENUM(NSInteger, AWSPollyVoiceId) {
    AWSPollyVoiceIdUnknown,
    AWSPollyVoiceIdGeraint,
    AWSPollyVoiceIdGwyneth,
    AWSPollyVoiceIdMads,
    AWSPollyVoiceIdNaja,
    AWSPollyVoiceIdHans,
    AWSPollyVoiceIdMarlene,
    AWSPollyVoiceIdNicole,
    AWSPollyVoiceIdRussell,
    AWSPollyVoiceIdAmy,
    AWSPollyVoiceIdBrian,
    AWSPollyVoiceIdEmma,
    AWSPollyVoiceIdRaveena,
    AWSPollyVoiceIdIvy,
    AWSPollyVoiceIdJoanna,
    AWSPollyVoiceIdJoey,
    AWSPollyVoiceIdJustin,
    AWSPollyVoiceIdKendra,
    AWSPollyVoiceIdKimberly,
    AWSPollyVoiceIdMatthew,
    AWSPollyVoiceIdSalli,
    AWSPollyVoiceIdConchita,
    AWSPollyVoiceIdEnrique,
    AWSPollyVoiceIdMiguel,
    AWSPollyVoiceIdPenelope,
    AWSPollyVoiceIdChantal,
    AWSPollyVoiceIdCeline,
    AWSPollyVoiceIdMathieu,
    AWSPollyVoiceIdDora,
    AWSPollyVoiceIdKarl,
    AWSPollyVoiceIdCarla,
    AWSPollyVoiceIdGiorgio,
    AWSPollyVoiceIdMizuki,
    AWSPollyVoiceIdLiv,
    AWSPollyVoiceIdLotte,
    AWSPollyVoiceIdRuben,
    AWSPollyVoiceIdEwa,
    AWSPollyVoiceIdJacek,
    AWSPollyVoiceIdJan,
    AWSPollyVoiceIdMaja,
    AWSPollyVoiceIdRicardo,
    AWSPollyVoiceIdVitoria,
    AWSPollyVoiceIdCristiano,
    AWSPollyVoiceIdInes,
    AWSPollyVoiceIdCarmen,
    AWSPollyVoiceIdMaxim,
    AWSPollyVoiceIdTatyana,
    AWSPollyVoiceIdAstrid,
    AWSPollyVoiceIdFiliz,
    AWSPollyVoiceIdVicki,
    AWSPollyVoiceIdTakumi,
    AWSPollyVoiceIdSeoyeon,
    AWSPollyVoiceIdAditi,
};

@class AWSPollyDeleteLexiconInput;
@class AWSPollyDeleteLexiconOutput;
@class AWSPollyDescribeVoicesInput;
@class AWSPollyDescribeVoicesOutput;
@class AWSPollyGetLexiconInput;
@class AWSPollyGetLexiconOutput;
@class AWSPollyLexicon;
@class AWSPollyLexiconAttributes;
@class AWSPollyLexiconDescription;
@class AWSPollyListLexiconsInput;
@class AWSPollyListLexiconsOutput;
@class AWSPollyPutLexiconInput;
@class AWSPollyPutLexiconOutput;
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
 <p>Contains metadata describing the lexicon such as the number of lexemes, language code, and so on. For more information, see <a href="http://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing Lexicons</a>.</p>
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
@interface AWSPollySynthesizeSpeechInput : AWSRequest


/**
 <p>List of one or more pronunciation lexicon names you want the service to apply during synthesis. Lexicons are applied only if the language of the lexicon is the same as the language of the voice. For information about storing lexicons, see <a href="http://docs.aws.amazon.com/polly/latest/dg/API_PutLexicon.html">PutLexicon</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable lexiconNames;

/**
 <p> The format in which the returned output will be encoded. For audio stream, this will be mp3, ogg_vorbis, or pcm. For speech marks, this will be json. </p>
 */
@property (nonatomic, assign) AWSPollyOutputFormat outputFormat;

/**
 <p> The audio frequency specified in Hz. </p><p>The valid values for <code>mp3</code> and <code>ogg_vorbis</code> are "8000", "16000", and "22050". The default value is "22050". </p><p> Valid values for <code>pcm</code> are "8000" and "16000" The default value is "16000". </p>
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
 <p> Specifies whether the input text is plain text or SSML. The default value is plain text. For more information, see <a href="http://docs.aws.amazon.com/polly/latest/dg/ssml.html">Using SSML</a>.</p>
 */
@property (nonatomic, assign) AWSPollyTextType textType;

/**
 <p> Voice ID to use for the synthesis. You can get a list of available voice IDs by calling the <a href="http://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html">DescribeVoices</a> operation. </p>
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

@end

NS_ASSUME_NONNULL_END
