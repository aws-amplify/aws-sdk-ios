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

#import <UIKit/UIKit.h>
#import "AWSLexInteractionKit.h"

NS_ASSUME_NONNULL_BEGIN

@class AWSLexVoiceButton;

FOUNDATION_EXPORT NSString *const AWSLexVoiceButtonErrorDomain;
FOUNDATION_EXPORT NSString *const AWSLexVoiceButtonKey;

typedef NS_ENUM(NSInteger, AWSLexVoiceButtonErrorCode) {
    AWSLexVoiceButtonErrorCodeUnknown,
    AWSLexVoiceButtonErrorCodeAudioRecordingPermisionDenied
};

@interface AWSLexVoiceButtonResponse : NSObject

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

@protocol AWSLexVoiceButtonDelegate <NSObject>

@required
/*
 * On error response.
 */
- (void)voiceButton:(AWSLexVoiceButton *)button onError:(NSError *)error;

@optional

/*
 * Response per service call.
 */
- (void)voiceButton:(AWSLexVoiceButton *)button onResponse:(AWSLexVoiceButtonResponse *)response;

/*
 * If the dialog fullfillment is on the client side, this method would be invoked with the filled slots.
 */
- (void)voiceButtononReadyToFullFill:(AWSLexVoiceButton *)button withSlots:(NSDictionary *)slots;

@end

@interface AWSLexVoiceButton : UIView

@property (nonatomic, weak) id<AWSLexVoiceButtonDelegate> delegate;

/**
 Enable push transition animation when image switch between microphone and listen image. Default is NO.
 */
@property (nonatomic) BOOL animateOnImageSwitching;

/**
 Set color for microphone image. Default is nil.
 */
@property (nonatomic, strong) UIColor *microphoneImageColor;
/**
 Set color for inactive microphone image. Default is light grey.
 */
@property (nonatomic, strong) UIColor *lexImageColor;
@property (nonatomic, strong) UIColor *errorColor;

@end

NS_ASSUME_NONNULL_END
