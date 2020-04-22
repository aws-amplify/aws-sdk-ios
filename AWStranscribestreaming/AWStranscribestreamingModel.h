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

FOUNDATION_EXPORT NSString *const AWStranscribestreamingErrorDomain;

typedef NS_ENUM(NSInteger, AWStranscribestreamingErrorType) {
    AWStranscribestreamingErrorUnknown,
    AWStranscribestreamingErrorBadRequest,
    AWStranscribestreamingErrorConflict,
    AWStranscribestreamingErrorInternalFailure,
    AWStranscribestreamingErrorLimitExceeded,
    AWStranscribestreamingErrorServiceUnavailable,
};

typedef NS_ENUM(NSInteger, AWStranscribestreamingItemType) {
    AWStranscribestreamingItemTypeUnknown,
    AWStranscribestreamingItemTypePronunciation,
    AWStranscribestreamingItemTypePunctuation,
};

typedef NS_ENUM(NSInteger, AWStranscribestreamingLanguageCode) {
    AWStranscribestreamingLanguageCodeUnknown,
    AWStranscribestreamingLanguageCodeEnUS,
    AWStranscribestreamingLanguageCodeEnGB,
    AWStranscribestreamingLanguageCodeEsUS,
    AWStranscribestreamingLanguageCodeFrCA,
    AWStranscribestreamingLanguageCodeFrFR,
    AWStranscribestreamingLanguageCodeEnAU,
};

typedef NS_ENUM(NSInteger, AWStranscribestreamingMediaEncoding) {
    AWStranscribestreamingMediaEncodingUnknown,
    AWStranscribestreamingMediaEncodingPcm,
};

@class AWStranscribestreamingAlternative;
@class AWStranscribestreamingAudioEvent;
@class AWStranscribestreamingAudioStream;
@class AWStranscribestreamingItem;
@class AWStranscribestreamingResult;
@class AWStranscribestreamingStartStreamTranscriptionRequest;
@class AWStranscribestreamingStartStreamTranscriptionResponse;
@class AWStranscribestreamingTranscript;
@class AWStranscribestreamingTranscriptEvent;
@class AWStranscribestreamingTranscriptResultStream;

/**
 <p>A list of possible transcriptions for the audio.</p>
 */
@interface AWStranscribestreamingAlternative : AWSModel


/**
 <p>One or more alternative interpretations of the input audio. </p>
 */
@property (nonatomic, strong) NSArray<AWStranscribestreamingItem *> * _Nullable items;

/**
 <p>The text that was transcribed from the audio.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transcript;

@end

/**
 <p>Provides a wrapper for the audio chunks that you are sending.</p>
 */
@interface AWStranscribestreamingAudioEvent : AWSModel


/**
 <p>An audio blob that contains the next part of the audio that you want to transcribe.</p>
 */
@property (nonatomic, strong) NSData * _Nullable audioChunk;

@end

/**
 <p>Represents the audio stream from your application to Amazon Transcribe.</p>
 */
@interface AWStranscribestreamingAudioStream : AWSModel


/**
 <p>A blob of audio from your application. You audio stream consists of one or more audio events.</p>
 */
@property (nonatomic, strong) AWStranscribestreamingAudioEvent * _Nullable audioEvent;

@end

/**
 <p>A word or phrase transcribed from the input audio.</p>
 */
@interface AWStranscribestreamingItem : AWSModel


/**
 <p>The word or punctuation that was recognized in the input audio.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The offset from the beginning of the audio stream to the end of the audio that resulted in the item.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endTime;

/**
 <p>The offset from the beginning of the audio stream to the beginning of the audio that resulted in the item.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startTime;

/**
 <p>The type of the item. <code>PRONUNCIATION</code> indicates that the item is a word that was recognized in the input audio. <code>PUNCTUATION</code> indicates that the item was interpreted as a pause in the input audio.</p>
 */
@property (nonatomic, assign) AWStranscribestreamingItemType types;

@end

/**
 <p>The result of transcribing a portion of the input audio stream. </p>
 */
@interface AWStranscribestreamingResult : AWSModel


/**
 <p>A list of possible transcriptions for the audio. Each alternative typically contains one <code>item</code> that contains the result of the transcription.</p>
 */
@property (nonatomic, strong) NSArray<AWStranscribestreamingAlternative *> * _Nullable alternatives;

/**
 <p>The offset in seconds from the beginning of the audio stream to the end of the result.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable endTime;

/**
 <p>Amazon Transcribe divides the incoming audio stream into segments at natural points in the audio. Transcription results are returned based on these segments. </p><p>The <code>IsPartial</code> field is <code>true</code> to indicate that Amazon Transcribe has additional transcription data to send, <code>false</code> to indicate that this is the last transcription result for the segment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isPartial;

/**
 <p>A unique identifier for the result. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resultId;

/**
 <p>The offset in seconds from the beginning of the audio stream to the beginning of the result.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startTime;

@end

/**
 
 */
@interface AWStranscribestreamingStartStreamTranscriptionRequest : AWSRequest


/**
 <p>PCM-encoded stream of audio blobs. The audio stream is encoded as an HTTP2 data frame.</p>
 */
@property (nonatomic, strong) AWStranscribestreamingAudioStream * _Nullable audioStream;

/**
 <p>Indicates the source language used in the input audio stream.</p>
 */
@property (nonatomic, assign) AWStranscribestreamingLanguageCode languageCode;

/**
 <p>The encoding used for the input audio. </p>
 */
@property (nonatomic, assign) AWStranscribestreamingMediaEncoding mediaEncoding;

/**
 <p>The sample rate, in Hertz, of the input audio. We suggest that you use 8000 Hz for low quality audio and 16000 Hz for high quality audio.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mediaSampleRateHertz;

/**
 <p>A identifier for the transcription session. Use this parameter when you want to retry a session. If you don't provide a session ID, Amazon Transcribe will generate one for you and return it in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

/**
 <p>The name of the vocabulary to use when processing the transcription job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 
 */
@interface AWStranscribestreamingStartStreamTranscriptionResponse : AWSModel


/**
 <p>The language code for the input audio stream.</p>
 */
@property (nonatomic, assign) AWStranscribestreamingLanguageCode languageCode;

/**
 <p>The encoding used for the input audio stream.</p>
 */
@property (nonatomic, assign) AWStranscribestreamingMediaEncoding mediaEncoding;

/**
 <p>The sample rate for the input audio stream. Use 8000 Hz for low quality audio and 16000 Hz for high quality audio.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mediaSampleRateHertz;

/**
 <p>An identifier for the streaming transcription.</p>
 */
@property (nonatomic, strong) NSString * _Nullable requestId;

/**
 <p>An identifier for a specific transcription session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionId;

/**
 <p>Represents the stream of transcription events from Amazon Transcribe to your application.</p>
 */
@property (nonatomic, strong) AWStranscribestreamingTranscriptResultStream * _Nullable transcriptResultStream;

/**
 <p>The name of the vocabulary used when processing the job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vocabularyName;

@end

/**
 <p>The transcription in a <a>TranscriptEvent</a>.</p>
 */
@interface AWStranscribestreamingTranscript : AWSModel


/**
 <p><a>Result</a> objects that contain the results of transcribing a portion of the input audio stream. The array can be empty.</p>
 */
@property (nonatomic, strong) NSArray<AWStranscribestreamingResult *> * _Nullable results;

@end

/**
 <p>Represents a set of transcription results from the server to the client. It contains one or more segments of the transcription.</p>
 */
@interface AWStranscribestreamingTranscriptEvent : AWSModel


/**
 <p>The transcription of the audio stream. The transcription is composed of all of the items in the results list.</p>
 */
@property (nonatomic, strong) AWStranscribestreamingTranscript * _Nullable transcript;

@end

/**
 <p>Represents the transcription result stream from Amazon Transcribe to your application.</p>
 */
@interface AWStranscribestreamingTranscriptResultStream : AWSModel


/**
 <p>A client error occurred when the stream was created. Check the parameters of the request and try your request again.</p>
 */
@property (nonatomic, strong)  _Nullable badRequestException;

/**
 <p>A new stream started with the same session ID. The current stream has been terminated.</p>
 */
@property (nonatomic, strong)  _Nullable conflictException;

/**
 <p>A problem occurred while processing the audio. Amazon Transcribe terminated processing.</p>
 */
@property (nonatomic, strong)  _Nullable internalFailureException;

/**
 <p>Your client has exceeded one of the Amazon Transcribe limits, typically the limit on audio length. Break your audio stream into smaller chunks and try your request again.</p>
 */
@property (nonatomic, strong)  _Nullable limitExceededException;

/**
 <p>Service is currently unavailable. Try your request later.</p>
 */
@property (nonatomic, strong)  _Nullable serviceUnavailableException;

/**
 <p>A portion of the transcription of the audio stream. Events are sent periodically from Amazon Transcribe to your application. The event can be a partial transcription of a section of the audio stream, or it can be the entire transcription of that portion of the audio stream. </p>
 */
@property (nonatomic, strong) AWStranscribestreamingTranscriptEvent * _Nullable transcriptEvent;

@end

NS_ASSUME_NONNULL_END
