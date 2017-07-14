//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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


#import "AWSLexInteractionKit.h"
#import "BFAudioSource.h"
#import "BFAudioRecorder.h"
#import "AWSLex.h"
#import "AWSLexRequestRetryHandler.h"
#import <AVFoundation/AVFoundation.h>

NSString *const AWSInfoInteractionKit = @"LexInteractionKit";
NSString *const AWSInteractionKitSDKVersion = @"2.5.9";
NSString *const AWSInternalLexInteractionKit = @"LexInteractionKitClient";
NSString *const AWSLexInteractionKitUserAgent = @"interactionkit";
NSString *const AWSLexInteractionKitErrorDomain = @"com.amazonaws.AWSLexInteractionKitErrorDomain";

NSString *const AWSLexContentTypeText = @"text/plain; charset=utf-8";
NSString *const AWSLexAcceptMPEG = @"audio/mpeg";
NSString *const AWSLexAcceptVorbid = @"audio/ogg";
NSString *const AWSLexAcceptPCM = @"audio/pcm";
NSString *const AWSLexAcceptText = @"text/plain; charset=utf-8";

NSString *const AWSLexInteractionKitConfigBotName = @"BotName";
NSString *const AWSLexInteractionKitConfigBotAlias = @"BotAlias";

/** 
 Constant synchronized lock string object used by releaseAudioSource method.
 Note that this should not used in any other place.
 */
NSString *const AWSLexInteractionKitReleaseAudioSourceLockObject = @"AWSLexInteractionKit.releaseAudioSource";


const NSUInteger DefaultInteractionKitStartingPointThreshold = 9;
const NSUInteger DefaultInteractionKitEndpointThreshold = 80;
const float      DefaultInteractionKitLrtThreshold = 1.8f;

typedef NS_ENUM(NSInteger, AWSLexSpeechState) {
    AWSLexSpeechStateUninitialized,
    AWSLexSpeechStateStarted,
    AWSLexSpeechStateEnded
};

@interface BFAudioSource()

@property (nonatomic, readwrite, copy) NSString *contentType;

@end

@interface AWSLexSwitchModeInput()

@property (nonatomic, strong, readwrite) NSString * _Nullable intent;

@property (nonatomic, strong, readwrite) NSString * _Nullable outputText;

@property (nonatomic, strong, readwrite) NSDictionary * _Nullable slots;

@property (nonatomic, strong, readwrite) NSString * _Nullable elicitSlot;

@property (nonatomic, assign, readwrite) AWSLexDialogState dialogState;

@property (nonatomic, strong, readwrite) NSDictionary * _Nullable sessionAttributes;

@property (nonatomic, strong, readwrite) NSData * _Nullable audioStream;

@property (nonatomic, strong, readwrite) NSString * _Nullable audioContentType;

@property (nonatomic, strong, readwrite) NSString * _Nullable inputTranscript;

- (instancetype) initWithOutputText:(NSString *)outputText
                             intent:(NSString * _Nullable)intent
                  sessionAttributes:(NSDictionary * _Nullable)sessionAttributes
                       slotToElicit:(NSString * _Nullable)elicitSlot
                              slots:(NSDictionary * _Nullable)slots
                        dialogState:(AWSLexDialogState)dialogState
                        audioStream:(NSData * _Nullable)audioStream
                   audioContentType:(NSString * _Nullable)audioContentType
                    inputTranscript:(NSString * _Nullable)inputTranscript;

@end

@implementation AWSLexSwitchModeInput

- (instancetype) initWithOutputText:(NSString *)outputText
                             intent:(NSString * _Nullable)intent
                  sessionAttributes:(NSDictionary * _Nullable)sessionAttributes
                       slotToElicit:(NSString * _Nullable)elicitSlot
                              slots:(NSDictionary * _Nullable)slots
                        dialogState:(AWSLexDialogState)dialogState
                        audioStream:(NSData * _Nullable)audioStream
                   audioContentType:(NSString * _Nullable)audioContentType
                    inputTranscript:(NSString * _Nullable)inputTranscript{
    self = [super init];
    if(self) {
        _intent = intent;
        _slots = slots;
        _sessionAttributes = sessionAttributes;
        _outputText = outputText;
        _elicitSlot = elicitSlot;
        _dialogState = dialogState;
        _audioStream = [audioStream copy];
        _audioContentType = audioContentType;
        _inputTranscript = inputTranscript;
    }
    return self;
}


@end

@implementation AWSLexSwitchModeResponse

@end

@interface AWSLexInteractionKitConfig()

@property (nonatomic, readwrite) NSDictionary *globalSessionAttributes;

@end

@implementation AWSLexInteractionKitConfig


static NSMutableDictionary<NSString *, NSString *> *globalSessionAttributes;
const NSUInteger NoSpeechTimeoutInterval = 5;
//Deepsense runtime service has a timeout of 15 secs.
const NSUInteger MaxSpeechTimeoutInterval = 15;

-(instancetype)init{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultConfigWithApplicationName:applicationAlias:` or `- initWithApplicationName:applicationAlias:` instead."
                                 userInfo:nil];
}

-(instancetype)privateInit{
    return [super init];
}

-(instancetype)initWithBotName:(NSString *)botName
                      botAlias:(NSString *)botAlias{
    if(self = [super init]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            globalSessionAttributes = [NSMutableDictionary new];
        });
        _botName = botName;
        _botAlias = botAlias;
    }
    return self;
}

-(void)setGlobalSessionAttribute:(NSString *)value forKey:(NSString *)key{
    @synchronized (self) {
        [globalSessionAttributes setValue:value forKey:key];
    }
}

-(void)removeGlobalSessionAttribute:(NSString *)key{
    @synchronized (self) {
        [globalSessionAttributes removeObjectForKey:key];
    }
}

-(void)clearAllGlobalSessionAttributes{
    @synchronized (self) {
        [globalSessionAttributes removeAllObjects];
    }
}

+(instancetype)defaultInteractionKitConfigWithBotName:(NSString *)botName
                                             botAlias:(NSString *)botAlias
{
    AWSLexInteractionKitConfig *config = [[AWSLexInteractionKitConfig alloc] initWithBotName:botName botAlias:botAlias];
    config.startpointingThreshold = DefaultInteractionKitStartingPointThreshold;
    config.endpointingThreshold = DefaultInteractionKitEndpointThreshold;
    config.lrtThreshold = DefaultInteractionKitLrtThreshold;
    config.encoding = AWSLexSpeechEncodingOpus;
    config.noSpeechTimeoutInterval = NoSpeechTimeoutInterval;
    config.maxSpeechTimeoutInterval = MaxSpeechTimeoutInterval;
    config.autoPlayback = YES;
    return config;
}

-(id)copyWithZone:(NSZone *)zone {
    AWSLexInteractionKitConfig *configuration = [[AWSLexInteractionKitConfig allocWithZone:zone] privateInit];
    configuration.botAlias = self.botAlias;
    configuration.botName = self.botName;
    configuration.globalSessionAttributes = [globalSessionAttributes copy];
    configuration.encoding = _encoding;
    configuration.endpointingThreshold = _endpointingThreshold;
    configuration.startpointingThreshold = _startpointingThreshold;
    configuration.lrtThreshold = _lrtThreshold;
    configuration.noSpeechTimeoutInterval = _noSpeechTimeoutInterval;
    configuration.maxSpeechTimeoutInterval = _maxSpeechTimeoutInterval;
    configuration.autoPlayback = _autoPlayback;
    return configuration;
}

@end

@interface AWSLex()

@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSLexInteractionKit()<BFAudioSourceDelegate, NSStreamDelegate, AWSLexRequestRetryHandlerDelegate>

// the AWS Service configuration
@property (nonatomic, readonly) AWSServiceConfiguration *configuration;

@property (nonatomic, strong) AWSLex *serviceClient;

@property (nonatomic, strong) NSDictionary *sessionAttributes;

@property (nonatomic) BOOL resumeListening;
@property (nonatomic) AWSLexInteractionMode currentState;

@end

@implementation AWSLexInteractionKit{
    AWSLexAudioPlayer *audioPlayer;
    NSUInteger numOfBytesSent;
    BOOL isStreaming;
    NSDate *recordingStartDate;
    AWSLexSpeechState speechState;
    BOOL isListening;
    BFAudioSource *audioSource;
    BFVADConfig *vadConfig;
    
    // the processed audio to be sent over http
    NSMutableData *consumerAudioBuffer;
    NSInputStream *consumerStream;
    //the processed audio buffer
    NSMutableData *producerAudioBuffer;
    NSOutputStream *producerStream;
    
    dispatch_queue_t interactionDelegateQueue;
    
    NSDictionary *sessionAttributesForSpeechInput;
    
    //this is used for storing a reference to the text for retry scenarios
    NSString *textInput;
    AWSLexPostContentRequest *postRequest;
    
    BOOL isStartpointed;
    BOOL isEndpointed;
    NSDate *audioStartpointedTime;
    BOOL isErrored;
}

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultInteractionKit` or `+ InteractionKitForKey:` instead."
                                 userInfo:nil];
    return nil;
}

+ (instancetype)defaultInteractionKit{
    static AWSLexInteractionKit *_defaultInteractionKit;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSLexInteractionKitConfig *interactionKitConfig = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoInteractionKit];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            NSString *botName = [serviceInfo.infoDictionary objectForKey:AWSLexInteractionKitConfigBotName];
            NSString *botAlias = [serviceInfo.infoDictionary objectForKey:AWSLexInteractionKitConfigBotAlias];
            interactionKitConfig = [AWSLexInteractionKitConfig defaultInteractionKitConfigWithBotName:botName botAlias:botAlias];
        }
        
        if (!serviceConfiguration && !interactionKitConfig) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }
        _defaultInteractionKit = [[AWSLexInteractionKit alloc] initWithServiceConfiguration:serviceConfiguration interactionKitConfig:interactionKitConfig];
    });
    
    return _defaultInteractionKit;
}

+ (void)registerInteractionKitWithServiceConfiguration:(AWSServiceConfiguration *)configuration
                           interactionKitConfiguration:(AWSLexInteractionKitConfig *)config
                                                forKey:(NSString *)key{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSLexInteractionKit alloc] initWithServiceConfiguration:configuration interactionKitConfig:config]
                        forKey:key];
}

+ (instancetype)interactionKitForKey:(NSString *)key{
    return [_serviceClients objectForKey:key];
}

+ (void)removeInteractionKitForKey:(NSString *)key{
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)initWithServiceConfiguration:(AWSServiceConfiguration *)serviceConfiguration
                        interactionKitConfig:(AWSLexInteractionKitConfig *)interactionConfig
{
    if (self = [super init]) {
        _configuration = [serviceConfiguration copy];
        [_configuration addUserAgentProductToken:AWSLexInteractionKitUserAgent];
        
        _interactionKitConfig  = [interactionConfig copy];
        
        vadConfig = [[BFVADConfig alloc] initWithLrtThreshold:_interactionKitConfig.lrtThreshold startpointingThreshold:_interactionKitConfig.startpointingThreshold endpointingThreshold:_interactionKitConfig.endpointingThreshold];
        
        [AWSLex registerLexWithConfiguration:_configuration forKey:AWSInternalLexInteractionKit];
        _serviceClient = [AWSLex LexForKey:AWSInternalLexInteractionKit];
        
        AWSLexRequestRetryHandler *retryHandler = (AWSLexRequestRetryHandler *)_serviceClient.configuration.retryHandler;
        retryHandler.delegate = self;
        
        interactionDelegateQueue = dispatch_queue_create("com.amazonaws.lex.InteractionDelegateQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)interactionKitConfig:(AWSLexInteractionKitConfig *)interactionConfig{
    if(interactionConfig){
        _interactionKitConfig  = [interactionConfig copy];
        
        vadConfig = [[BFVADConfig alloc] initWithLrtThreshold:_interactionKitConfig.lrtThreshold startpointingThreshold:_interactionKitConfig.startpointingThreshold endpointingThreshold:_interactionKitConfig.endpointingThreshold];
    }
}

- (BFAudioEncoding) blueFrontAudioEncoding:(AWSLexSpeechEncoding)speechEncoding {
    switch (speechEncoding) {
        case AWSLexSpeechEncodingLPCM:
            return BFLPCM16AudioEncoding;
        case AWSLexSpeechEncodingOpus:
            return BFOpusAudioEncoding;
    }
}

#pragma mark - public api implementation

- (void)cancel {
    @synchronized (self) {
        [self resetStates];
        [self releaseAudioSource];
        
        if(postRequest) {
            [postRequest cancel];
        }
    }
}

- (void)textInTextOut:(NSString *)inputText{
    [self textInTextOut:inputText sessionAttributes:nil];
}

- (void)textInTextOut:(NSString *)inputText sessionAttributes:(NSDictionary<NSString *, NSString *> *)sessionAttributes{
    self.currentState = AWSLexInteractionModeText;
    
    textInput = inputText;
    
    AWSLexPostContentRequest *request = [AWSLexPostContentRequest new];
    
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] initWithDictionary:self.interactionKitConfig.globalSessionAttributes];
    [attributes addEntriesFromDictionary:sessionAttributes];
    [attributes addEntriesFromDictionary:self.sessionAttributes];
    
    [request setSessionAttributes:attributes];
    [request setAccept:AWSLexAcceptText];
    [request setContentType:AWSLexContentTypeText];
    [request setInputStream:[[NSInputStream alloc] initWithData:[inputText dataUsingEncoding:NSUTF8StringEncoding]]];
    [self startConversation:request];
}

- (void)textInAudioOut:(NSString *)inputText{
    return [self textInAudioOut:inputText sessionAttributes:nil];
}

- (void)textInAudioOut:(NSString *)inputText sessionAttributes:(NSDictionary<NSString *, NSString *> * _Nullable)sessionAttributes{
    self.currentState = AWSLexInteractionModeTextToSpeech;
    
    AWSLexPostContentRequest *request = [AWSLexPostContentRequest new];
    
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] initWithDictionary:self.interactionKitConfig.globalSessionAttributes];
    [attributes addEntriesFromDictionary:sessionAttributes];
    [attributes addEntriesFromDictionary:self.sessionAttributes];
    
    [request setSessionAttributes:attributes];
    [request setAccept:AWSLexAcceptMPEG];
    [request setContentType:AWSLexContentTypeText];
    [request setInputStream:[[NSInputStream alloc] initWithData:[inputText dataUsingEncoding:NSUTF8StringEncoding]]];
    [self startConversation:request];
}

- (void)audioInAudioOut{
    [self audioInAudioOutWithSessionAttributes:nil];
}

- (void)audioInAudioOutWithSessionAttributes:(NSDictionary<NSString *, NSString *> * _Nullable)sessionAttributes{
    sessionAttributesForSpeechInput = sessionAttributes;
    [self setupAndStartListeningForMode:AWSLexInteractionModeSpeech];
}

- (void)audioInTextOut{
    [self audioInTextOutWithSessionAttributes:nil];
}

- (void)audioInTextOutWithSessionAttributes:(NSDictionary<NSString *, NSString *> * _Nullable)sessionAttributes{
    sessionAttributesForSpeechInput = sessionAttributes;
    [self setupAndStartListeningForMode:AWSLexInteractionModeSpeechToText];
}

#pragma mark - BFAudioSourceDelegate Methods

- (void)didReady{
    __weak AWSLexInteractionKit *weakSelf = self;
    [self dispatchBlockOnMainQueue:^{
        if(self.microphoneDelegate && [self.microphoneDelegate respondsToSelector:@selector(interactionKitReadyForRecording:)]) {
            [weakSelf.microphoneDelegate interactionKitReadyForRecording:weakSelf];
        }
    }];
}

- (void)didStart{
    recordingStartDate = [NSDate date];
    AWSDDLogVerbose(@"recording started at %@", recordingStartDate);
    __weak AWSLexInteractionKit *weakSelf = self;
    [self dispatchBlockOnMainQueue:^{
        if(weakSelf.microphoneDelegate && [weakSelf.microphoneDelegate respondsToSelector:@selector(interactionKitOnRecordingStart:)]) {
            [weakSelf.microphoneDelegate interactionKitOnRecordingStart:weakSelf];
        }
    }];
}

//to handle end of speech from the cancel call.
//TODO: should we trigger end of speech from client as a error
//or should it be handled as a endpoint? Currently triggers an error
- (void)didEnd{
    [self handleEndOfSpeech];
}

- (void)didProduceAudio:(NSData *)audioData{
    if(isListening) {
        switch (speechState) {
            case AWSLexSpeechStateUninitialized:{
                NSTimeInterval noSpeechTimout = [[NSDate date] timeIntervalSinceDate:recordingStartDate];
                if (noSpeechTimout > self.interactionKitConfig.noSpeechTimeoutInterval) {
                    AWSDDLogVerbose(@"no speech for interval %f", noSpeechTimout);
                    [self handleNoSpeechTimeout];
                } else {
                    // Add beginning of audio. Without this, voice will not be recognized due to missing audio stream.
                    // For example, "Three"  would become "e" or "d"
                    [self streamAudio:audioData];
                }
                isEndpointed = NO;
                audioStartpointedTime = nil;
                break;
            }
            case AWSLexSpeechStateStarted:{
                [self streamAudio:audioData];
                if (isStartpointed){
                    // If already startpointed and max speech timeout.
                    NSTimeInterval speechTime = [[NSDate date]
                                                 timeIntervalSinceDate:audioStartpointedTime];
                    if (speechTime > self.interactionKitConfig.maxSpeechTimeoutInterval &&
                        !isEndpointed)
                    {
                        [self handleMaxSpeechTimeout];
                        isListening = NO;
                        isStreaming = NO;
                        isStartpointed = NO;
                    }
                } else {
                    // If not startpointed yet, now switch to start pointed state.
                    isStartpointed = YES;
                    audioStartpointedTime = [NSDate date];
                }
                break;
            }
            case AWSLexSpeechStateEnded:{
                isEndpointed = YES;
                [self stopListening];
                break;
            }
            default:
                break;
        }
    }
}

- (void)didDetectSoundLevelChange:(double)level{
    __weak AWSLexInteractionKit *weakSelf = self;
    [self dispatchBlockOnMainQueue:^{
        if(self.microphoneDelegate && [self.microphoneDelegate respondsToSelector:@selector(interactionKit:onSoundLevelChanged:)]) {
            [weakSelf.microphoneDelegate interactionKit:weakSelf onSoundLevelChanged:level];
        }
    }];
}

- (void)didHaveError:(NSError *)error{
    AWSDDLogVerbose(@"Voice detection errored %@", error);
    [self handleError:error];
}

- (void)didDetectStartOfSpeech{
    AWSDDLogVerbose(@"AWSLexSpeechStateStarted",nil);
    speechState = AWSLexSpeechStateStarted;
}

//to handle end of speech form vad
- (void)didDetectEndOfSpeech{
    AWSDDLogVerbose(@"AWSLexSpeechStateEnded",nil);
    [self handleEndOfSpeech];
}

#pragma mark - private methods

/**
 Safely stop and release audioSource.
 */
- (void)releaseAudioSource {
    @synchronized (AWSLexInteractionKitReleaseAudioSourceLockObject) {
        if (audioSource) {
            // we will reset the delegate to nil,
            // so that the end event doesnt fire when we cann stop.
            audioSource.delegate = nil;
            [audioSource stop];
            audioSource = nil;
        }
    }
}

- (void)resetStates{
    isListening = NO;
    isStreaming = NO;
    self.resumeListening = NO;
    isEndpointed = NO;
    isStartpointed = NO;
    audioStartpointedTime = nil;
    isErrored = NO;
    speechState = AWSLexSpeechStateUninitialized;
}

- (void)handleEndOfSpeech{
    AWSDDLogVerbose(@"AWSLexSpeechStateEnded",nil);
    speechState = AWSLexSpeechStateEnded;
    __weak AWSLexInteractionKit *weakSelf = self;
    [self dispatchBlockOnMainQueue:^{
        if(weakSelf.microphoneDelegate && [weakSelf.microphoneDelegate respondsToSelector:@selector(interactionKitOnRecordingEnd:audioStream:contentType:)]) {
            //TODO: need to decode the audio to something thats understandable by the audio player.
            [weakSelf.microphoneDelegate interactionKitOnRecordingEnd:weakSelf audioStream:[producerAudioBuffer copy] contentType:[audioSource contentType]];
        }
    }];
}

- (void)closeStreams{
    @synchronized (self) {
        AWSDDLogVerbose(@"closing streams", nil);
        [producerStream close];
        [consumerStream close];
    }
}

-(void)handleNoSpeechTimeout{
    NSError *noSpeechError = [NSError errorWithDomain:AWSLexInteractionKitErrorDomain code:AWSLexInteractionKitErrorCodeNoSpeechTimeout userInfo:nil];
    [self handleError:noSpeechError];
}

- (void)handleMaxSpeechTimeout{
    NSError *maxSpeechError = [NSError errorWithDomain:AWSLexInteractionKitErrorDomain code:AWSLexInteractionKitErrorCodeMaxSpeechTimeout userInfo:nil];
    [self handleError:maxSpeechError];
}

- (void)setupAndStartListeningForMode:(AWSLexInteractionMode )interactionMode{
    self.currentState = interactionMode;
    if(!isListening && !isStreaming) {
        speechState = AWSLexSpeechStateUninitialized;
        AWSDDLogVerbose(@"Start Listening",nil);
        
        //setup all resources.
        audioSource = [[BFAudioRecorder alloc] initWithEncoding:[self blueFrontAudioEncoding:self.interactionKitConfig.encoding] voiceActivityDetectorConfiguration:vadConfig];
        audioSource.delegate = self;
        
        if(!audioSource) {
            NSError *error = [[NSError alloc] initWithDomain:AWSLexInteractionKitErrorDomain code:AWSLexInteractionKitErrorCodeAudioRecording userInfo:nil];
            [self handleError:error];
        }
        
        isListening = YES;
        NSInputStream *cStream;//consumer stream
        NSOutputStream *pStream;//producer stream
        
        [NSStream getBoundStreamsWithBufferSize:[audioSource audioBufferSize]
                                    inputStream:&cStream
                                   outputStream:&pStream];
        
        consumerStream = cStream;
        producerStream = pStream;
        
        producerAudioBuffer = [NSMutableData new];
        consumerAudioBuffer = [NSMutableData new];
        
        producerStream.delegate = self;
        
        AWSDDLogVerbose(@"finished creating consumer and producer streams %@  %@", consumerStream, producerStream);
        [producerStream scheduleInRunLoop:[NSRunLoop currentRunLoop]
                                  forMode:NSDefaultRunLoopMode];
        [producerStream open];
        
        numOfBytesSent = 0;
        
        [audioSource start];
        
        AWSDDLogVerbose(@"Started Listening to Audio Source");
    }
}

- (void)stopListening{
    if (isListening) {
        AWSDDLogVerbose(@"Stop Listening",nil);
        isListening = NO;
        [producerStream close];
        producerStream.delegate = nil;
        
        [self releaseAudioSource];
    }
}

- (void)streamAudio:(NSData *)audio{
    [producerAudioBuffer appendBytes:audio.bytes length:audio.length];
    if(producerAudioBuffer.length > numOfBytesSent && [producerStream hasSpaceAvailable]) {
        NSRange range = NSMakeRange(numOfBytesSent, producerAudioBuffer.length - numOfBytesSent);
        UInt8 chunkBuffer[range.length];
        [producerAudioBuffer getBytes:chunkBuffer range:range];
        NSInteger result = [producerStream write:chunkBuffer maxLength:range.length];
        AWSDDLogVerbose(@"wrote %ld to producer stream", (long)result);
        if (result >= 0) {
            numOfBytesSent += result;
            //start streaming only after we get an actual audio
            [self startStreaming];
        }else{
            NSError *audioError = [NSError errorWithDomain:AWSLexInteractionKitErrorDomain code:AWSLexInteractionKitErrorCodeAudioStreaming userInfo:nil];
            [self handleError:audioError];
        }
    }
}

- (void)startStreaming{
    if(!isStreaming) {
        isStreaming = YES;
        
        AWSLexPostContentRequest *request = [AWSLexPostContentRequest new];
        
        NSMutableDictionary *attributes = [[NSMutableDictionary alloc] initWithDictionary:self.interactionKitConfig.globalSessionAttributes];
        [attributes addEntriesFromDictionary:sessionAttributesForSpeechInput];
        [attributes addEntriesFromDictionary:self.sessionAttributes];
        [request setSessionAttributes:attributes];
        
        if (self.currentState == AWSLexInteractionModeSpeechToText){
            [request setAccept:AWSLexAcceptText];
        } else {
            [request setAccept:AWSLexAcceptMPEG];
        }
        [request setInputStream:consumerStream];
        [request setContentType:[audioSource contentType]];
        
        [self startConversation:request];
    }
}


#pragma mark -

#pragma mark NSStreamDelegate

- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode{
    AWSDDLogVerbose(@"stream event %lu", (unsigned long)eventCode);
    switch (eventCode)
    {
        case NSStreamEventErrorOccurred:{
            NSError *streamError = [NSError errorWithDomain:AWSLexInteractionKitErrorDomain code:AWSLexInteractionKitErrorCodeAudioStreaming userInfo:nil];
            [self handleError:streamError];
            break;
        }
        default:
            break;
    }
}

#pragma mark -


#pragma mark CommonCode

- (void)startConversation:(AWSLexPostContentRequest *)request{
    postRequest = request;
    AWSTask *requestTask = [AWSTask taskWithResult:nil];
    
    id<AWSCredentialsProvider> credentialProvider = [self.configuration credentialsProvider];
    
    //we will prioritize the user id set in the config if not default to cognito identity id.
    if(self.interactionKitConfig.userId && self.interactionKitConfig.userId.length > 0) {
        [request setUserId:self.interactionKitConfig.userId];
    }else if([credentialProvider isKindOfClass:[AWSCognitoCredentialsProvider class]]) {
        requestTask = [[((AWSCognitoCredentialsProvider *)credentialProvider) getIdentityId] continueWithBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
            [request setUserId:task.result];
            return task;
        }];
    }else{
        //userId is null and provider is not cognito, throw
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"`userId` not set in config"
                                     userInfo:nil];
    }
    
    [request setBotName:self.interactionKitConfig.botName];
    [request setBotAlias:self.interactionKitConfig.botAlias];
    
    __weak AWSLexInteractionKit *weakSelf = self;
    
    [[requestTask continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if(task.error) {
            [self handleError:task.error];
            return nil;
        }else{
            return [_serviceClient postContent:request];
        }
    }] continueWithBlock:^id _Nullable(AWSTask<AWSLexPostContentResponse *> * _Nonnull task) {
        isStreaming = NO;
        self.resumeListening = NO;
        
        [self releaseAudioSource];
        
        postRequest = nil;
        
        if(task.error){
            [self handleError:task.error];
            return nil;
        }
        
        __typeof__(self) strongSelf = weakSelf;
        AWSLexPostContentResponse *response = task.result;
        
        if(response.audioStream) {
            [strongSelf enqueuePlayback:response.audioStream];
        }
        
        //replace the previous session attribute
        strongSelf.sessionAttributes = response.sessionAttributes;
        
        AWSLexSwitchModeInput *input = [[AWSLexSwitchModeInput alloc] initWithOutputText:response.message
                                                                                  intent:response.intentName
                                                                       sessionAttributes:response.sessionAttributes
                                                                            slotToElicit:response.slotToElicit
                                                                                   slots:response.slots
                                                                             dialogState:response.dialogState
                                                                             audioStream:response.audioStream
                                                                        audioContentType:response.contentType
                                                                         inputTranscript:response.inputTranscript];
        
        if(response.dialogState == AWSLexDialogStateFailed) {
            //send the response in the userInfo since the callback is not called.
            //So that the user can take some action (e.g. log it for furthur analysis etc)
            NSError *dialogFailedError = [NSError errorWithDomain:AWSLexInteractionKitErrorDomain code:AWSLexInteractionKitErrorCodeDialogFailed userInfo:nil];
            [strongSelf.interactionDelegate interactionKit:strongSelf
                                           switchModeInput:input
                                          completionSource:nil];
            [strongSelf handleError:dialogFailedError];
            return nil;
        }else if(response.dialogState == AWSLexDialogStateReadyForFulfillment) {
            //this should be dispatched async
            [strongSelf.interactionDelegate interactionKit:strongSelf
                                           switchModeInput:input
                                          completionSource:nil];
            [strongSelf dispatchBlockOnInteractionDelegateQueue:^{
                if(strongSelf.interactionDelegate && [strongSelf.interactionDelegate respondsToSelector:@selector(interactionKit:onDialogReadyForFulfillmentForIntent:slots:)]) {
                    [strongSelf.interactionDelegate interactionKit:strongSelf onDialogReadyForFulfillmentForIntent:response.intentName slots:response.slots];
                }
            }];
            return nil;
        }else if (response.dialogState == AWSLexDialogStateFulfilled) {
            //dialog state is fullfilled. So we exit the loop
            [strongSelf.interactionDelegate interactionKit:strongSelf
                                           switchModeInput:input
                                          completionSource:nil];
            return nil;
        }
        
        //if dialog is ellicitation or confirmation, we start the switchmode process.
        if(response.dialogState == AWSLexDialogStateElicitSlot
           || response.dialogState == AWSLexDialogStateElicitIntent
           || response.dialogState == AWSLexDialogStateConfirmIntent) {
            
            //switch mode completion process.
            AWSTaskCompletionSource<AWSLexSwitchModeResponse *> *switchModeCompletionSource = [AWSTaskCompletionSource taskCompletionSource];
            
            if(strongSelf.interactionDelegate && [strongSelf.interactionDelegate respondsToSelector:@selector(interactionKit:switchModeInput:completionSource:)]) {
                
                [strongSelf.interactionDelegate interactionKit:strongSelf
                                               switchModeInput:input
                                              completionSource:switchModeCompletionSource];
                
                //once the switch mode completion is returned by user.
                return [switchModeCompletionSource.task continueWithSuccessBlock:^id _Nullable(AWSTask<AWSLexSwitchModeResponse *> * _Nonnull task) {
                    
                    AWSLexSwitchModeResponse *switchModeResponse = (AWSLexSwitchModeResponse *)task.result;
                    
                    //if the user wants to break, we return.
                    if(switchModeResponse.interactionMode == AWSLexInteractionModeBreak)
                        return nil;
                    
                    if(switchModeResponse.interactionMode == AWSLexInteractionModeText
                       || switchModeResponse.interactionMode == AWSLexInteractionModeTextToSpeech) {
                        
                        AWSTaskCompletionSource<NSString *> *switchModeCompletionSource = [AWSTaskCompletionSource taskCompletionSource];
                        
                        [strongSelf.interactionDelegate interactionKitContinueWithText:strongSelf
                                                                      completionSource:switchModeCompletionSource];
                        
                        return [switchModeCompletionSource.task continueWithSuccessBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
                            
                            if(switchModeResponse.interactionMode == AWSLexInteractionModeText) {
                                [strongSelf textInTextOut:task.result sessionAttributes:switchModeResponse.sessionAttributes];
                            }else{
                                [strongSelf textInAudioOut:task.result sessionAttributes:switchModeResponse.sessionAttributes];
                            }
                            
                            return nil;
                        }];
                    } else {
                        self.resumeListening = YES;
                        self.currentState = switchModeResponse.interactionMode;
                    }
                    
                    return nil;
                }];
            }
        }
        return nil;
    }];
}

- (void)dispatchBlockOnMainQueue:(void (^)())block{
    dispatch_async(dispatch_get_main_queue(), block);
}

- (void)dispatchBlockOnInteractionDelegateQueue:(void (^)())block{
    dispatch_async(interactionDelegateQueue, block);
}

- (void)handleError:(NSError *)error{
    //Poor mans dedupe to handle a scenario
    //when you cancel any request it raised
    //Cancelled error from the http stack.
    if(!isErrored) {
        isErrored = YES;
        [self closeStreams];
        [self resetStates];
        
        //cancel any pending request
        if(postRequest)
            [postRequest cancel];
        
        //stop the audio source
        [self releaseAudioSource];
        
        [self dispatchBlockOnInteractionDelegateQueue:^{
            if(self.interactionDelegate && [self.interactionDelegate respondsToSelector:@selector(interactionKit:onError:)]) {
                [self.interactionDelegate interactionKit:self onError:error];
            }
        }];
        
        isErrored = NO;
    }
}

- (void)enqueuePlayback:(NSData *)audioData{
    if(self.interactionKitConfig.autoPlayback) {
        NSError *audioPlaybackError;
        AWSLexAudioSession *session = [AWSLexAudioSession sharedInstance];
        // It would be little complicated to determine when to stop observing the notification.
        // To simplify thing, we will start and end observing only during audio is enqueued for now. 
        [session startObservingAudioSessionRouteChangeNotification];
        [session setPlayAndRecordCategory:&audioPlaybackError];
        
        if(audioPlaybackError) {
            AWSDDLogError(@"error processing audio , %@", audioPlaybackError);
            [self handleError:audioPlaybackError];
            return;
        }
        
        [session overrideOutputAudioPort:&audioPlaybackError];
        
        if(audioPlaybackError) {
            AWSDDLogError(@"error processing audio , %@", audioPlaybackError);
            [self handleError:audioPlaybackError];
            return;
        }
        
        // Using AVAudioPlayer wrapper to centralize all the sound related logic.
        audioPlayer = [[AWSLexAudioPlayer alloc] initWithData:audioData];
        __typeof__(self) __weak weakSelf = self;
        audioPlayer.errorBlock = ^(NSError *error) {
            AWSDDLogError(@"error processing audio , %@", error);
            [[AWSLexAudioSession sharedInstance] endObservingAudioSessionRouteChangeNotification];
            [weakSelf handleError:error];
        };
        audioPlayer.completionBlock = ^{
            [[AWSLexAudioSession sharedInstance] endObservingAudioSessionRouteChangeNotification];
            if(weakSelf.audioPlayerDelegate
               && [weakSelf.audioPlayerDelegate respondsToSelector:@selector(interactionKitOnAudioPlaybackFinished:)]) {
                [weakSelf.audioPlayerDelegate interactionKitOnAudioPlaybackFinished:weakSelf];
            }
            if (weakSelf.resumeListening) {
                [weakSelf setupAndStartListeningForMode:weakSelf.currentState];
            }
        };
        audioPlayer.preparedBlock = ^{
            if (weakSelf.audioPlayerDelegate &&
                [weakSelf.audioPlayerDelegate respondsToSelector:@selector(interactionKitOnAudioPlaybackStarted:)]) {
                [weakSelf.audioPlayerDelegate interactionKitOnAudioPlaybackStarted:weakSelf];
            }
        };
        
        [self dispatchBlockOnMainQueue:^{
            [audioPlayer start];
        }];
    }
}

#pragma mark - Retry Handler

- (NSInputStream *)resetInputStream{
    //iOS doesn't allow seeking for non file based streams.
    //So resetting the consumer stream to a new input stream.
    if (self.currentState == AWSLexInteractionModeSpeech) {
        consumerStream = [[NSInputStream alloc] initWithData:producerAudioBuffer];
        return consumerStream;
    }else{
        return [[NSInputStream alloc] initWithData:[textInput dataUsingEncoding:NSUTF8StringEncoding]];
    }
}

#pragma mark -

@end

#pragma mark - AWSLexAudioSession

@interface AWSLexAudioSession ()

@property (nonatomic) BOOL observingRouteChangeNotification;

@end

@implementation AWSLexAudioSession

+ (instancetype)sharedInstance {
    static AWSLexAudioSession *shared;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        shared = [AWSLexAudioSession new];
    });
    return shared;
}

- (void)setPlayAndRecordCategory:(NSError **)outError {
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:outError];
}

- (void)overrideOutputAudioPort:(NSError **)outError {
    AVAudioSession *session = [AVAudioSession sharedInstance];
    AVAudioSessionPortOverride portOverride = AVAudioSessionPortOverrideSpeaker;
    
    for (AVAudioSessionPortDescription *portDesc in session.currentRoute.outputs) {
        // Use Headphone if detected.
        if ([portDesc.portType isEqualToString:AVAudioSessionPortHeadphones]) {
            portOverride = AVAudioSessionPortOverrideNone;
            break;
        }
    }
    [session overrideOutputAudioPort:portOverride error:outError];
}

- (void)requestRecordPermission:(PermissionBlock)response {
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session requestRecordPermission:response];
}

- (void)startObservingAudioSessionRouteChangeNotification {
    @synchronized (self) {
        if (!self.observingRouteChangeNotification) {
            self.observingRouteChangeNotification = YES;
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(routeDidChange:)
                                                         name:AVAudioSessionRouteChangeNotification
                                                       object:nil];
        }
    }
}

- (void)endObservingAudioSessionRouteChangeNotification {
    @synchronized (self) {
        if (self.observingRouteChangeNotification) {
            [[NSNotificationCenter defaultCenter] removeObserver:self];
            self.observingRouteChangeNotification = NO;
        }
    }
}

#pragma mark - AVAudioSessionRouteChangeNotification handler

- (void)routeDidChange:(NSNotification *)not {
    [self overrideOutputAudioPort:nil];
}

@end


#pragma mark - AWSLexAudioPlayer


@interface AWSLexAudioPlayer()<AVAudioPlayerDelegate>

@property (nonatomic) AVAudioPlayer *audioPlayer;
@property (nonatomic) NSData *audioData;

@end

@implementation AWSLexAudioPlayer

- (void)dealloc {
    self.audioPlayer.delegate = nil;
}

- (instancetype)initWithData:(NSData *)audioData
{
    self = [super init];
    if (self) {
        self.audioData = audioData;
    }
    return self;
}

- (void)start {
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:self.audioData error:&error];
    // Release the audioData ASAP.
    self.audioData = nil;
    
    if (error) {
        if (self.errorBlock) {
            self.errorBlock(error);
        }
    } else {
        self.audioPlayer.delegate = self;
        [self.audioPlayer prepareToPlay];
        if (self.preparedBlock) {
            self.preparedBlock();
        }
        [self.audioPlayer play];
        [self.audioPlayer setVolume:1.0f];
    }
}


#pragma mark - AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    if (flag) {
        if (self.completionBlock) {
            self.completionBlock();
        }
    } else {
        AWSDDLogVerbose(@"audio player finished unsuccessfully", nil);
        if (self.errorBlock) {
            self.errorBlock([NSError errorWithDomain:AWSLexInteractionKitErrorDomain
                                                code:AWSLexInteractionKitErrorCodeAudioStreaming
                                            userInfo:nil]);
        }
    }
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error {
    if (self.errorBlock) {
        self.errorBlock(error);
    }
}

@end
