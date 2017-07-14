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


#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSLexModel.h"
#import "AWSLexService.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSLexContentTypeText;
FOUNDATION_EXPORT NSString *const AWSLexAcceptMPEG;
FOUNDATION_EXPORT NSString *const AWSLexAcceptVorbid;
FOUNDATION_EXPORT NSString *const AWSLexAcceptPCM;
FOUNDATION_EXPORT NSString *const AWSLexAcceptText;
FOUNDATION_EXPORT NSString *const AWSInteractionKitSDKVersion;
FOUNDATION_EXPORT NSString *const AWSInternalLexInteractionKit;
FOUNDATION_EXPORT NSString *const AWSLexInteractionKitErrorDomain;

@class AWSLexInteractionKit;
@class AWSLexSwitchModeResponse;
@class AWSLexSwitchModeInput;

typedef NS_ENUM(NSInteger, AWSLexInteractionKitErrorCode) {
    AWSLexInteractionKitErrorCodeUnknown,
    AWSLexInteractionKitErrorCodeAudioRecording,
    AWSLexInteractionKitErrorCodeAudioStreaming,
    AWSLexInteractionKitErrorCodeMaxSpeechTimeout,
    AWSLexInteractionKitErrorCodeNoSpeechTimeout,
    AWSLexInteractionKitErrorCodeDialogFailed,
    AWSLexInteractionKitErrorCodeRequestInProgress
};

typedef NS_ENUM(NSInteger, AWSLexInteractionMode) {
    AWSLexInteractionModeBreak,
    AWSLexInteractionModeText,
    AWSLexInteractionModeTextToSpeech,
    AWSLexInteractionModeSpeech,
    AWSLexInteractionModeSpeechToText
};

typedef NS_ENUM(NSInteger, AWSLexSpeechEncoding) {
    AWSLexSpeechEncodingOpus,
    AWSLexSpeechEncodingLPCM
};

@protocol AWSLexMicrophoneDelegate <NSObject>

@optional
/*
 * Send to delegate when the microphone has started recording.
 */
- (void)interactionKitOnRecordingStart:(AWSLexInteractionKit *)interactionKit;

/*
 * Sent to delegate when the microphone recording ends.
 */
- (void)interactionKitOnRecordingEnd:(AWSLexInteractionKit *)interactionKit audioStream:(NSData *)audioStream contentType:(NSString *)contentType;

/*
 * Sent to delegate when the micorphone is ready for recording.
 */
- (void)interactionKitReadyForRecording:(AWSLexInteractionKit *)interactionKit;

/*
 * Sent to delegate when the micorphone audio input sound level changes.
 */
- (void)interactionKit:(AWSLexInteractionKit *)interactionKit onSoundLevelChanged:(double )soundLevel;

@end

@protocol AWSLexInteractionDelegate <NSObject>

@required

/*
 * Sent to delegate when an error occured from service.
 */
- (void)interactionKit:(AWSLexInteractionKit *)interactionKit
               onError:(NSError *)error;

@optional

/*
 * Sent to delegate when the all the required slots are filled, and the the fullfillment is client side.
 */
- (void)interactionKit:(AWSLexInteractionKit *)interactionKit onDialogReadyForFulfillmentForIntent:(NSString *)intentName slots:(NSDictionary *)slots;

/*
 * Sent to delegate incase you want to switch modes between text and voice input.
 */
- (void)interactionKit:(AWSLexInteractionKit *)interactionKit
       switchModeInput:(AWSLexSwitchModeInput *)switchModeInput
      completionSource:(AWSTaskCompletionSource<AWSLexSwitchModeResponse *> * _Nullable)completionSource;

/*
 * Sent to delegate when the Switch mode requires a user to input a text. You should set the completion source result to the string that you get from the user. This ensures that the session attribute information is carried over from the previous request to the next one.
 */
- (void)interactionKitContinueWithText:(AWSLexInteractionKit *)interactionKit
                      completionSource:(AWSTaskCompletionSource<NSString *> *)completionSource;

@end

@protocol AWSLexAudioPlayerDelegate <NSObject>

@optional

/*
 * Sent to delegate when the Audio playback starts.
 */
- (void)interactionKitOnAudioPlaybackStarted:(AWSLexInteractionKit *)interactionKit;

/*
 * Sent to delegate when the Audio playback finished.
 */
- (void)interactionKitOnAudioPlaybackFinished:(AWSLexInteractionKit *)interactionKit;

@end

/*
 *
 */
@interface AWSLexInteractionKitConfig : NSObject<NSCopying>

/*
 * The bot name.
 */
@property (nonatomic, strong) NSString *botName;

/*
 * The bot alias.
 */
@property (nonatomic, strong) NSString *botAlias;

/*
 * Optional user id, The service will use cognito identity id by default.
 */
@property (nonatomic, strong, nullable) NSString *userId;

/*
 * Global session attributes are attributes that are applied for every call made to the lex service.
 */
@property (nonatomic, readonly) NSDictionary<NSString *, NSString *> *globalSessionAttributes;

/*
 * The time interval before which the microphone timesout.
 */
@property (nonatomic, assign) NSTimeInterval noSpeechTimeoutInterval;

/*
 * The max time interval for a speech input.
 */
@property (nonatomic, assign) NSTimeInterval maxSpeechTimeoutInterval;

/*
 * The number of speech frames which defines what is a active speech.
 */
@property (nonatomic, assign) NSUInteger startpointingThreshold;

/*
 * The number of non-speech frames which defines what a silence is.
 */
@property (nonatomic, assign) NSUInteger endpointingThreshold;

/*
 * The Likelyhood-ratio test threshold value, which will be used to classify whether a frame of audio is a speech or not.
 */
@property (nonatomic, assign) float      lrtThreshold;

/*
 * Automatically start playing when a speech response is recieved. Defaults to true.
 */
@property (nonatomic, assign) BOOL       autoPlayback;

/*
 * Speech encoding format. Defaults to Opus.
 */
@property (nonatomic, assign) AWSLexSpeechEncoding encoding;

/*
 * Set sessionAttribute globally.
 */
-(void)setGlobalSessionAttribute:(NSString *)value forKey:(NSString *)key;

/*
 * remove a global session attribute
 */
-(void)removeGlobalSessionAttribute:(NSString *)key;

/*
 * Clear all global session attributes.
 */
-(void)clearAllGlobalSessionAttributes;

/*
 * returns interaction config with default values.
 */
+(instancetype)defaultInteractionKitConfigWithBotName:(NSString *)botName
                                             botAlias:(NSString *)botAlias;

@end


@interface AWSLexInteractionKit : NSObject

/*
 * The Tnteraction Kit config.
 */
@property (nonatomic, strong) AWSLexInteractionKitConfig *interactionKitConfig;

@property (nonatomic, weak) id<AWSLexInteractionDelegate> interactionDelegate;

@property (nonatomic, weak) id<AWSLexMicrophoneDelegate> microphoneDelegate;

@property (nonatomic, weak) id<AWSLexAudioPlayerDelegate> audioPlayerDelegate;

/**
 Returns the singleton interactionKit client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.
 
 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*
 
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.default().defaultServiceConfiguration = configuration
 
         return true
      }
 
 *Objective-C*
 
      -(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1 identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:credentialsProvider];
         [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
 
         return YES;
      }
 
 Then call the following to get the default service client:
 
 *Swift*
 
      let interactionKit = AWSLexInteractionKit.default()
 
 *Objective-C*
 
      AWSLexInteractionKit *interactionKit = [AWSLexInteractionKit defaultInteractionKit];
 
 @return The default interactionKit client.
 */
+ (instancetype)defaultInteractionKit;


/**
 Creates a InteractionKit client with the given service configuration and registers it for the key.
 
 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*
 
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSLexInteractionKit.register(with: configuration!, forKey: "USWest2InteractionKit")
 
         return true
      }
 
 *Objective-C*
 
      - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1 identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2 credentialsProvider:credentialsProvider];
 
         [AWSLexInteractionKit registerInteractionKitWithServiceConfiguration:configuration forKey:@"USWest2InteractionKit"];
 
         return YES;
      }
 
 Then call the following to get the service client:
 
 *Swift*
 
      let interactionKit = AWSLexInteractionKit(forKey: "USWest2InteractionKit")
 
 *Objective-C*
 
      AWSLexInteractionKit *interactionKit = [AWSLexInteractionKit interactionKitForKey:@"USWest2InteractionKit"];
 
 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.
 
 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerInteractionKitWithServiceConfiguration:(AWSServiceConfiguration *)configuration
                           interactionKitConfiguration:(AWSLexInteractionKitConfig *)config
                                                forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerLexWithConfiguration:forKey:` before invoking this method.
 
 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*
 
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSLexInteractionKit.register(with: configuration!, forKey: "USWest2InteractionKit")
 
         return true
      }
 
 *Objective-C*
 
      - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1 identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2 credentialsProvider:credentialsProvider];
         [AWSLexInteractionKit registerInteractionKitWithServiceConfiguration:configuration forKey:@"USWest2InteractionKit"];
 
         return YES;
      }
 
 Then call the following to get the service client:
 
 *Swift*
 
      let interactionKit = AWSLexInteractionKit(forKey: "USWest2InteractionKit")
 
 *Objective-C*
 
      AWSLexInteractionKit *interactionKit = [AWSLexInteractionKit interactionKitForKey:@"USWest2InteractionKit"];
 
 @param key A string to identify the service client.
 
 @return An instance of the service client.
 */
+ (instancetype)interactionKitForKey:(NSString *)key;

/**
 Removes the interaction kit associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeInteractionKitForKey:(NSString *)key;

/**
 Accepts a text input and responds back with a text output
 
 @param inputText The text input
 */
- (void)textInTextOut:(NSString *)inputText;

/**
 Accets a text input and an optional sessionAttribute dictionary and responds back with a text output.
 
 @param inputText The text input
 @param sessionAttributes Optional Session attributes dictionary
 */
- (void)textInTextOut:(NSString *)inputText sessionAttributes:(NSDictionary<NSString *, NSString *> * _Nullable)sessionAttributes;

/**
 Accepts a text input and responds back with an audio response. the playback will begin automatically unless you have set autoplayback to false in the InteractionKitConfig.
 
 @param inputText The text input
 */
- (void)textInAudioOut:(NSString *)inputText;

/**
 Accepts a text input and an optional sessionAttribute dictionary and responds back with an audio response. The playback will begin automatically unless you have set autoplayback to false in the InteractionKitConfig.
 
 @param inputText The text input
 @param sessionAttributes Optional Session attributes dictionary
 */
- (void)textInAudioOut:(NSString *)inputText sessionAttributes:(NSDictionary<NSString *, NSString *> * _Nullable)sessionAttributes;

/**
 Starts the microphone and listens to audio from the phone microphone and responds back with an audio response.The playback will begin automatically unless you have set autoplayback to false in the InteractionKitConfig.
 */
- (void)audioInAudioOut;

/**
 Starts the microphone and listens to audio from the phone microphone and responds back with an audio response.The playback will begin automatically unless you have set autoplayback to false in the InteractionKitConfig.
 
 @param sessionAttributes Optional Session attributes dictionary
 */
- (void)audioInAudioOutWithSessionAttributes:(NSDictionary<NSString *, NSString *> * _Nullable)sessionAttributes;

/**
 Starts the microphone and listens to audio from the phone microphone and responds back with a text response.
 */
- (void)audioInTextOut;

/**
 Starts the microphone and listens to audio from the phone microphone and responds back with a text response.
 
 @param sessionAttributes Optional Session attributes dictionary
 */
- (void)audioInTextOutWithSessionAttributes:(NSDictionary<NSString *, NSString *> * _Nullable)sessionAttributes;

/**
 Cancels ongoing http call and stops listening to Microphone if Audio input was requested.
 */
- (void)cancel;

@end

@interface AWSLexSwitchModeInput : NSObject

/**
 Name of the intent being ellicited.
 */
@property (nonatomic, strong, readonly) NSString * _Nullable intent;

/**
 Text response.
 */
@property (nonatomic, strong, readonly) NSString * _Nullable outputText;

/**
 The slots which are currently filled in an ongoing dialog
 */
@property (nonatomic, strong, readonly) NSDictionary * _Nullable slots;

/**
 The slot which is being ellicited for an intent.
 */
@property (nonatomic, strong, readonly) NSString * _Nullable elicitSlot;

/**
 The current dialog state.
 */
@property (nonatomic, assign, readonly) AWSLexDialogState dialogState;

/**
 The session attributes returned from the service.
 */
@property (nonatomic, strong, readonly) NSDictionary * _Nullable sessionAttributes;

/**
 The audio stream . This may be null incase of a text response.
 */
@property (nonatomic, strong, readonly) NSData * _Nullable audioStream;

/**
 The format for the audio stream. This may be null if the audion stream is null.
 */
@property (nonatomic, strong, readonly) NSString * _Nullable audioContentType;

/**
 Transcript of the voice input to the operation.
 */
@property (nonatomic, strong, readonly) NSString * _Nullable inputTranscript;


@end

/**
 A response class returned back to the InteractionKit, In the course that user decides to switch modes of input between 2 requests, or set additional session attributes in the subsequant request.
 */
@interface AWSLexSwitchModeResponse : NSObject

/*
 The interaction mode.
 */
@property (nonatomic, assign) AWSLexInteractionMode interactionMode;

/*
 The session attributes.
 */
@property (nonatomic, strong) NSDictionary * _Nullable sessionAttributes;

@end

#pragma mark - AVAudioSession

/**
 Wrapper to AVAudioSession class.
 It auto-detects output source(Internal speaker or microphone) at runtime by listening to
 AVAudioSessionRouteChangeNotification.
 */
@interface AWSLexAudioSession : NSObject

+ (instancetype)sharedInstance;

/**
 Set AVAudioSession category to AVAudioSessionCategoryPlayAndRecord
 */
- (void)setPlayAndRecordCategory:(NSError **)outError;

/**
 Override output audio port to AVAudioSessionPortOverrideSpeaker if headset is not detected.
 */
- (void)overrideOutputAudioPort:(NSError **)outError;


/**
 Request record permission to AVAudioSession.
 */
- (void)requestRecordPermission:(PermissionBlock)response;

/**
 Start observing for AVAudioSessionRouteChangeNotification if not already started.
 */
- (void)startObservingAudioSessionRouteChangeNotification;

/**
 Remove observing for AVAudioSessionRouteChangeNotification.
 */
- (void)endObservingAudioSessionRouteChangeNotification;

@end


#pragma mark - AWSLexAudioPlayer


/**
 Wrapper to AVAudioPLayer class.
 */
@interface AWSLexAudioPlayer : NSObject

/**
 Set it to handle error.
 */
@property (nonatomic) void (^errorBlock)(NSError *error);

/**
 Set it to handle successful audio play.
 */
@property (nonatomic) void (^completionBlock)(void);

/**
 Set it to handle when audio has been prepared to play.
 */
@property (nonatomic) void (^preparedBlock)(void);

- (instancetype)initWithData:(NSData *)audioData;

/**
 Start playing sound.
 
 When audio is prepared to play, preparedBlock will get called if it is set.
 Once audio is successfully played audio, completionBlock will get called if it is set.
 Otherwise errorBlock is get called.
 */
- (void)start;

@end

NS_ASSUME_NONNULL_END
