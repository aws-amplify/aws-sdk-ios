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


#import "AWSLexVoiceButton.h"
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>

#define LINE_WIDTH 3
#define RADIUS 25
#define SIZE 55

NSString *const AWSLexVoiceButtonErrorDomain = @"com.amazonaws.AWSLexVoiceButtonErrorDomain";
NSString *const AWSLexVoiceButtonKey = @"AWSLexVoiceButton";

static NSString *ProgressAnimationKey = @"progressanimation.rotation";
static NSString *MicrophoneImageKey = @"Microphone";
static NSString *LexSpeakImageKey = @"LexSpeak";
static NSString *VoiceButtonUserAgent = @"LexVoiceButton";
static NSString *ImageButtonTintColorUserInfoKey = @"imageButton.imageView.tintColor";
static NSString *BackgroundLayerStrokeColorUserInfoKey = @"backgroundLayer.strokeColor";


@implementation UIColor (AWSLexVoiceButton)

+ (UIColor *)colorWithHexValue:(NSInteger)hexValue {
    float red = ((hexValue & 0xFF0000) >> 16) / 255.0f;
    float green = ((hexValue & 0xFF00) >> 8) / 255.0f;
    float blue = (hexValue & 0xFF) / 255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end

@implementation UIView (AWSLexVoiceButton)

/**
 Simple Push transition from bottom to top.
 */
- (void)pushTransition:(CFTimeInterval)duration {
    CATransition *animation = [CATransition new];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromTop;
    animation.duration = duration;
    [self.layer addAnimation:animation forKey:kCATransitionPush];
}

@end

@interface AWSLexVoiceButtonResponse()

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

@implementation AWSLexVoiceButtonResponse

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


@interface AWSLexInteractionKit()

@property (nonatomic, readonly) AWSServiceConfiguration *configuration;

@end

@interface AWSLexVoiceButton()<AWSLexInteractionDelegate, AWSLexMicrophoneDelegate, AWSLexAudioPlayerDelegate>

@property (nonatomic, assign) double voiceLevel;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) CADisplayLink *progressLink;
@property (nonatomic, strong) CAShapeLayer *rightShapeLayer;
@property (nonatomic, strong) CAShapeLayer *leftShapeLayer;
@property (nonatomic, strong) UIImage *microphoneImage;
@property (nonatomic, strong) UIImage *listenImage;
@property (nonatomic, strong) CAShapeLayer *backgroundLayer;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) AWSLexInteractionKit *interactionKit;
@property (nonatomic, strong) UIColor *defaultMicImageColor;
@property (nonatomic, strong) UIColor *defaultLexImageColor;

@end

@implementation AWSLexVoiceButton {
    BOOL isListening;
    BOOL canListen;
    BOOL isAnimating;
    UITapGestureRecognizer *onTouch;
    UIButton *imageButton;
    CAMediaTimingFunction *timingFunction;
    CGPoint center;
    UIColor *lightGrey;
    BOOL errorFired;
}

@synthesize microphoneImageColor=_microphoneImageColor;

# pragma mark - Properties

- (UIColor *)defaultMicImageColor {
    if (!_defaultMicImageColor) {
        _defaultMicImageColor = [UIColor colorWithHexValue:0x329ad6];
    }
    return _defaultMicImageColor;
}

- (UIColor *)defaultLexImageColor {
    if (!_defaultLexImageColor) {
        _defaultLexImageColor = [UIColor colorWithHexValue:0x4383c4];
    }
    return _defaultLexImageColor;
}

- (void)setMicrophoneImageColor:(UIColor *)microphoneImageColor {
    _microphoneImageColor = microphoneImageColor;
    if (imageButton.imageView.image == self.microphoneImage) {
        imageButton.imageView.tintColor = _microphoneImageColor;
    }
}

- (UIColor *)microphoneImageColor {
    if (_microphoneImageColor == nil) {
        return self.defaultMicImageColor;
    }
    return _microphoneImageColor;
}

- (UIColor *)lexImageColor {
    if (_lexImageColor == nil) {
        return self.defaultLexImageColor;
    }
    return _lexImageColor;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]) {
        imageButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SIZE, SIZE)];
        NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
        
        // Use microphone image when the user speaks.
        UIImage *temp = [UIImage imageNamed:MicrophoneImageKey inBundle:currentBundle compatibleWithTraitCollection:nil];
        self.microphoneImage =  [temp imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [self setButtonImage:self.microphoneImage imageTintColor:self.microphoneImageColor animated:NO];
        [imageButton addTarget:self action:@selector(startMonitoring:) forControlEvents:UIControlEventTouchDown];
        
        imageButton.imageView.tintColor = self.microphoneImageColor;
        
        // Use listen image when Lex speaks.
        temp = [UIImage imageNamed:LexSpeakImageKey inBundle:currentBundle compatibleWithTraitCollection:nil];
        self.listenImage =  [temp imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        lightGrey = [UIColor colorWithWhite:0 alpha:0.2];
        [self addShapeLayer];
        [self addSubview:imageButton];
        self.layer.cornerRadius = RADIUS + 2;
        self.clipsToBounds = YES;
        timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        self.errorColor = [UIColor redColor];
    }
    return self;
}

//if the view is removed (view will disappear),
//then we cancel the request and reset everything
- (void)willMoveToSuperview:(UIView *)newSuperview{
    if(!newSuperview) {
        isListening = NO;
        [self stopProgress];
        [self stopDisplay];
        [self removeDelegates];
        [self.interactionKit cancel];
    } else {
        [self setDelegates];
    }
}

- (void)setDelegates{
    self.interactionKit.audioPlayerDelegate = self;
    self.interactionKit.microphoneDelegate = self;
    self.interactionKit.interactionDelegate = self;
}

- (void) removeDelegates {
    self.interactionKit.audioPlayerDelegate = nil;
    self.interactionKit.microphoneDelegate = nil;
    self.interactionKit.interactionDelegate = nil;
}

- (CGSize)intrinsicContentSize{
    return CGSizeMake(SIZE, SIZE);
}

- (void)layoutSubviews{
    self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, SIZE, SIZE);
    [super layoutSubviews];
}

- (void)startMonitoring:(id)sender{
    if(!self.interactionKit){
        self.interactionKit = [AWSLexInteractionKit interactionKitForKey:AWSLexVoiceButtonKey];
        if(!self.interactionKit){
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:[NSString stringWithFormat:@"Cannot find interactionKit with key %@", AWSLexVoiceButtonKey ]
                                         userInfo:nil];
        }
        [self.interactionKit.configuration addUserAgentProductToken:VoiceButtonUserAgent];
        [self setDelegates];
    }
    
    NSError *audioSessionError;
    AWSLexAudioSession *session = [AWSLexAudioSession sharedInstance];
    [session setPlayAndRecordCategory:&audioSessionError];
    
    if(audioSessionError){
        [self handleError:audioSessionError];
        return;
    }
    
    [session requestRecordPermission:^(BOOL granted) {
        canListen = granted;
        if(granted) {
            [self startListening];
        } else {
            NSError *permissionDeniedError = [[NSError alloc]initWithDomain:AWSLexVoiceButtonErrorDomain code:AWSLexVoiceButtonErrorCodeAudioRecordingPermisionDenied userInfo:nil];
            [self handleError:permissionDeniedError];
        }
    }];
}

- (void)handleError:(NSError *)error{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.delegate voiceButton:self onError:error];
    });
}

- (void)startListening{
    if(!isListening && canListen){
        [self.interactionKit audioInAudioOut];
    }
}

- (void)startDisplay{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

-(void)stopDisplay{
    [self.leftShapeLayer setStrokeEnd:0];
    [self.rightShapeLayer setStrokeEnd:0];
    [self.displayLink invalidate];
    self.displayLink = nil;
}

/**
 Set image and tintClor for imageButton.
 */
- (void)setButtonImage:(UIImage *)image imageTintColor:(UIColor *)color animated:(BOOL)animated {
    if (self.animateOnImageSwitching && animated) {
        // Use 0.25 seconds for animation to provide a clear visual indication in order to help the user
        // to avoid talking too early.
        [imageButton pushTransition:0.25];
    }
    [imageButton setImage:image forState:UIControlStateNormal];
    imageButton.imageView.tintColor = color;
}

- (void)addShapeLayer{
    self.backgroundLayer = [CAShapeLayer layer];
    [self.backgroundLayer setStrokeColor:[lightGrey CGColor]];
    [self.backgroundLayer setFillColor:nil];
    [self.backgroundLayer setLineWidth:LINE_WIDTH];
    UIBezierPath *backgroundPath = [UIBezierPath bezierPath];
    [backgroundPath addArcWithCenter:imageButton.center radius:RADIUS startAngle:0 endAngle:2*M_PI clockwise:YES];
    [self.backgroundLayer setPath:[backgroundPath CGPath]];
    [self.backgroundLayer setStrokeEnd:1];
    [self.layer addSublayer:self.backgroundLayer];
    center = imageButton.center;
    
    self.rightShapeLayer = [CAShapeLayer layer];
    self.leftShapeLayer = [CAShapeLayer layer];
    CGFloat startAngle = M_PI_2;
    CGFloat endAngle = -M_PI_2;
    
    for (CAShapeLayer *shapeLayer in @[self.rightShapeLayer, self.leftShapeLayer]) {
        [shapeLayer setStrokeColor:[imageButton.imageView.tintColor CGColor]];
        [shapeLayer setFillColor:nil];
        [shapeLayer setLineWidth:LINE_WIDTH];
        [self.layer addSublayer:shapeLayer];
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        [bezierPath addArcWithCenter:imageButton.center radius:RADIUS
                          startAngle:startAngle
                            endAngle:endAngle
                           clockwise:shapeLayer == self.leftShapeLayer];
        
        [shapeLayer setPath:[bezierPath CGPath]];
        [shapeLayer setStrokeEnd:0];
    }
}

- (void)handleDisplayLink{
    [self.leftShapeLayer setStrokeEnd:self.voiceLevel];
    [self.rightShapeLayer setStrokeEnd:self.voiceLevel];
}

- (CAShapeLayer *)progressLayer {
    if (!_progressLayer) {
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.strokeColor = self.microphoneImageColor.CGColor;
        _progressLayer.fillColor = nil;
        _progressLayer.lineWidth = LINE_WIDTH;
        _progressLayer.hidden = YES;
        
        UIBezierPath *circlePath = [UIBezierPath bezierPath];
        [circlePath addArcWithCenter:imageButton.center radius:RADIUS startAngle:-M_PI_4 endAngle:3 * M_PI_2 clockwise:YES];
        _progressLayer.path = circlePath.CGPath;
        _progressLayer.frame = imageButton.frame;
        [self.layer addSublayer:_progressLayer];
    }
    return _progressLayer;
}

- (void)startProgress{
    if(!isAnimating){
        isAnimating = YES;
        CABasicAnimation *rotationAnimation = [CABasicAnimation
                                               animationWithKeyPath:@"transform.rotation.z"];
        [rotationAnimation setFromValue:0];
        [rotationAnimation setToValue:@(2*M_PI)];
        [rotationAnimation setDuration:1.0f];
        [rotationAnimation setRepeatCount:INFINITY];
        [self.progressLayer addAnimation:rotationAnimation forKey:ProgressAnimationKey];
        self.progressLayer.hidden = NO;
        self.backgroundLayer.hidden = YES;
        self.leftShapeLayer.hidden = YES;
        self.rightShapeLayer.hidden = YES;
    }
}

- (void)stopProgress{
    if (isAnimating) {
        [_progressLayer removeAnimationForKey:ProgressAnimationKey];
        _progressLayer.hidden = YES;
        isAnimating = NO;
        self.backgroundLayer.hidden = NO;
        self.leftShapeLayer.hidden = NO;
        self.rightShapeLayer.hidden = NO;
        self.voiceLevel = 0;
        [_progressLayer removeFromSuperlayer];
        _progressLayer = nil;
    }
}

#pragma mark - AWSLexMicrophoneDelegate

- (void)interactionKit:(AWSLexInteractionKit *)interactionKit onSoundLevelChanged:(double)soundLevel{
    self.voiceLevel = soundLevel;
}

- (void)interactionKitOnRecordingStart:(AWSLexInteractionKit *)interactionKit {
    // Voice recording is about to start.
    self.progressLayer.strokeColor = [self.microphoneImageColor CGColor];
    [self.rightShapeLayer setStrokeColor:[imageButton.imageView.tintColor CGColor]];
    [self.leftShapeLayer setStrokeColor:[imageButton.imageView.tintColor CGColor]];
    isListening = YES;
    [self startDisplay];
}

#pragma mark -

#pragma mark - AWSLexInteractionKitDelegate

- (void)interactionKitOnRecordingEnd:(AWSLexInteractionKit *)interactionKit audioStream:(nonnull NSData *)audioStream contentType:(nonnull NSString *)contentType{
    isListening = NO;
    [self stopDisplay];
    [self startProgress];
}

- (void)interactionKit:(AWSLexInteractionKit *)interactionKit onError:(NSError *)error{
    dispatch_async(dispatch_get_main_queue(), ^{
        isAnimating = YES;//fake animation so that next step succeeds
        isListening = NO;
        [self stopProgress];
        
        NSDictionary *userInfo;
        // If AWSLexInteractionKitErrorCodeDialogFailed is encountered, audio would be playing.
        // for the rest of errors, we would want to use microphone color.
        if ([error.domain isEqualToString:AWSLexInteractionKitErrorDomain]
            && error.code == AWSLexInteractionKitErrorCodeDialogFailed) {
            userInfo = @{
                ImageButtonTintColorUserInfoKey: imageButton.imageView.tintColor,
                BackgroundLayerStrokeColorUserInfoKey: [UIColor colorWithCGColor:self.backgroundLayer.strokeColor]
            };
        } else {
            userInfo = @{
                ImageButtonTintColorUserInfoKey: self.microphoneImageColor,
                BackgroundLayerStrokeColorUserInfoKey: lightGrey
            };
        }
        
        self.backgroundLayer.strokeColor = [self.errorColor CGColor];
        imageButton.imageView.tintColor = self.errorColor;
        //start a timer for a few secs to display error code to reset the error mode.
        [NSTimer scheduledTimerWithTimeInterval:1.5f
                                         target:self
                                       selector:@selector(resetError:)
                                       userInfo:userInfo
                                        repeats:NO];
    });
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(voiceButton:onError:)]){
        [self.delegate voiceButton:self onError:error];
    }
}

- (void)resetError:(NSTimer *)timer {
    NSDictionary *userInfo = timer.userInfo;
    self.backgroundLayer.strokeColor = ((UIColor *)userInfo[BackgroundLayerStrokeColorUserInfoKey]).CGColor;
    imageButton.imageView.tintColor = (UIColor *)userInfo[ImageButtonTintColorUserInfoKey];
}

- (void)interactionKit:(AWSLexInteractionKit *)interactionKit
       switchModeInput:(AWSLexSwitchModeInput *)switchModeInput
      completionSource:(AWSTaskCompletionSource<AWSLexSwitchModeResponse *> *)completionSource{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self stopProgress];
        
        if(self.delegate && [self.delegate respondsToSelector:@selector(voiceButton:onResponse:)]){
            AWSLexVoiceButtonResponse *response = [[AWSLexVoiceButtonResponse alloc] initWithOutputText:switchModeInput.outputText
                                                                                                 intent:switchModeInput.intent
                                                                                      sessionAttributes:switchModeInput.sessionAttributes
                                                                                           slotToElicit:switchModeInput.elicitSlot
                                                                                                  slots:switchModeInput.slots
                                                                                            dialogState:switchModeInput.dialogState
                                                                                            audioStream:switchModeInput.audioStream
                                                                                       audioContentType:switchModeInput.audioContentType
                                                                                        inputTranscript:switchModeInput.inputTranscript];
            [self.delegate voiceButton:self onResponse:response];
        }
    });
    
    AWSLexSwitchModeResponse *switchModeResponse = [AWSLexSwitchModeResponse new];
    [switchModeResponse setInteractionMode:AWSLexInteractionModeSpeech];
    [switchModeResponse setSessionAttributes:switchModeResponse.sessionAttributes];
    [completionSource setResult:switchModeResponse];
}

- (void)interactionKit:(AWSLexInteractionKit *)interactionKit onDialogReadyForFulfillmentForIntent:(nonnull NSString *)intentName slots:(nonnull NSDictionary *)slots{
    if(self.delegate && [self.delegate respondsToSelector:@selector(voiceButtononReadyToFullFill:withSlots:)]){
        [self.delegate voiceButtononReadyToFullFill:self withSlots:slots];
    }
}

#pragma mark -

#pragma mark - AWSLexAudioPlaybackDelegate

- (void)interactionKitOnAudioPlaybackStarted:(AWSLexInteractionKit *)interactionKit {
    // Lex is about to talk. Switch listen image in order to provide clear visual indication that you need to listen.
    [self setButtonImage:self.listenImage imageTintColor:self.lexImageColor animated:YES];
    // When Lex speaks, backgroundLayer is used so we need to change its color instead of progressLayer.
    self.backgroundLayer.strokeColor = [imageButton.imageView.tintColor CGColor];
}

- (void)interactionKitOnAudioPlaybackFinished:(AWSLexInteractionKit *)interactionKit {
    // Lex finished talking. Switch to microphone image.
    [self setButtonImage:self.microphoneImage imageTintColor:self.microphoneImageColor animated:YES];
    self.backgroundLayer.strokeColor = [lightGrey CGColor];
}

#pragma mark -

@end
