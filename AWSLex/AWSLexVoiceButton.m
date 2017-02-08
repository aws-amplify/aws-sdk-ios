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
static NSString *ResourceBundle = @"AWSResources";
static NSString *BundleExtension = @"bundle";
static NSString *MicrophoneImageKey = @"Microphone";
static NSString *VoiceButtonUserAgent = @"LexVoiceButton";

@interface AWSLexVoiceButtonResponse()

@property (nonatomic, strong, readwrite) NSString * _Nullable intent;

@property (nonatomic, strong, readwrite) NSString * _Nullable outputText;

@property (nonatomic, strong, readwrite) NSDictionary * _Nullable slots;

@property (nonatomic, strong, readwrite) NSString * _Nullable elicitSlot;

@property (nonatomic, assign, readwrite) AWSLexDialogState dialogState;

@property (nonatomic, strong, readwrite) NSDictionary * _Nullable sessionAttributes;

@property (nonatomic, strong, readwrite) NSData * _Nullable audioStream;

@property (nonatomic, strong, readwrite) NSString * _Nullable audioContentType;

- (instancetype) initWithOutputText:(NSString *)outputText
                             intent:(NSString * _Nullable)intent
                  sessionAttributes:(NSDictionary * _Nullable)sessionAttributes
                       slotToElicit:(NSString * _Nullable)elicitSlot
                              slots:(NSDictionary * _Nullable)slots
                        dialogState:(AWSLexDialogState)dialogState
                        audioStream:(NSData * _Nullable)audioStream
                   audioContentType:(NSString * _Nullable)audioContentType;

@end

@implementation AWSLexVoiceButtonResponse

- (instancetype) initWithOutputText:(NSString *)outputText
                             intent:(NSString * _Nullable)intent
                  sessionAttributes:(NSDictionary * _Nullable)sessionAttributes
                       slotToElicit:(NSString * _Nullable)elicitSlot
                              slots:(NSDictionary * _Nullable)slots
                        dialogState:(AWSLexDialogState)dialogState
                        audioStream:(NSData * _Nullable)audioStream
                   audioContentType:(NSString * _Nullable)audioContentType{
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
@property (nonatomic, strong) UIImageView *microPhoneImage;
@property (nonatomic, strong) CAShapeLayer *backgroundLayer;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) AWSLexInteractionKit *interactionKit;

@end

@implementation AWSLexVoiceButton{
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

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]) {
        imageButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SIZE, SIZE)];
        NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
        NSURL *bundleUrl = [currentBundle URLForResource:ResourceBundle withExtension:BundleExtension];
        
        NSBundle *imageBundle = [NSBundle bundleWithURL:bundleUrl];
        
        UIImage *normalImage = [[UIImage imageNamed:MicrophoneImageKey inBundle:imageBundle compatibleWithTraitCollection:nil] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [imageButton setImage:normalImage forState:UIControlStateNormal];
        imageButton.imageView.tintColor = self.color;
        [imageButton addTarget:self action:@selector(startMonitoring:) forControlEvents:UIControlEventTouchDown];
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
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&audioSessionError];
    
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
    [self.rightShapeLayer setStrokeColor:[imageButton.tintColor CGColor]];
    [self.rightShapeLayer setFillColor:nil];
    [self.rightShapeLayer setLineWidth:LINE_WIDTH];
    [self.layer addSublayer:self.rightShapeLayer];
    
    self.leftShapeLayer = [CAShapeLayer layer];
    [self.leftShapeLayer setStrokeColor:[imageButton.tintColor CGColor]];
    [self.leftShapeLayer setFillColor:nil];
    [self.leftShapeLayer setLineWidth:LINE_WIDTH];
    [self.layer addSublayer:self.leftShapeLayer];
    
    CGFloat startAngle = M_PI_2;
    CGFloat endAngle = -M_PI_2;
    
    UIBezierPath *rightPath = [UIBezierPath bezierPath];
    [rightPath addArcWithCenter:imageButton.center radius:RADIUS startAngle:startAngle endAngle:endAngle clockwise:NO];
    
    UIBezierPath *leftPath = [UIBezierPath bezierPath];
    [leftPath addArcWithCenter:imageButton.center radius:RADIUS startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    [self.rightShapeLayer setPath:[rightPath CGPath]];
    [self.leftShapeLayer setPath:[leftPath CGPath]];
    
    [self.leftShapeLayer setStrokeEnd:0];
    [self.rightShapeLayer setStrokeEnd:0];
    
}

- (void)handleDisplayLink{
    [self.leftShapeLayer setStrokeEnd:self.voiceLevel];
    [self.rightShapeLayer setStrokeEnd:self.voiceLevel];
}

- (CAShapeLayer *)progressLayer {
    if (!_progressLayer) {
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.strokeColor = [imageButton.tintColor CGColor];
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

- (void)interactionKitOnRecordingStart:(AWSLexInteractionKit *)interactionKit{
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
        self.backgroundLayer.strokeColor = [self.errorColor CGColor];
        imageButton.imageView.tintColor = self.errorColor;
        //start a timer for a few secs to display error code to reset the error mode.
        [NSTimer scheduledTimerWithTimeInterval:1.5f
                                         target:self
                                       selector:@selector(resetError)
                                       userInfo:nil
                                        repeats:NO];
    });
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(voiceButton:onError:)]){
        [self.delegate voiceButton:self onError:error];
    }
}

- (void)resetError{
    self.backgroundLayer.strokeColor = [lightGrey CGColor];
    imageButton.imageView.tintColor = self.color;
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
                                                                                       audioContentType:switchModeInput.audioContentType];
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

- (void)interactionKitOnAudioPlaybackStarted:(AWSLexInteractionKit *)interactionKit{
    self.backgroundLayer.strokeColor = [imageButton.tintColor CGColor];
}

- (void)interactionKitOnAudioPlaybackFinished:(AWSLexInteractionKit *)interactionKit{
    self.backgroundLayer.strokeColor = [lightGrey CGColor];
}

#pragma mark -

@end
