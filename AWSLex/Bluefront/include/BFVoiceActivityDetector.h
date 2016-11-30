#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "BFVADConfig.h"
#import "BFVoiceActivityDetectorDelegate.h"

/**
 * The VAD endpointer used for silence detection.
 */
@interface BFVoiceActivityDetector : NSObject

/**
 * The delegate to receive the callbacks of the BFVoiceActivityDetector.
 */
@property (nonatomic, readwrite, weak) NSObject<BFVoiceActivityDetectorDelegate> *delegate;

/**
 * Customized initializer.
 *
 * @param vadConfig VAD configuration.
 * @param audioStreamFormat audio stream format used.
 */
- (id)initWithVADConfig:(BFVADConfig *)vadConfig
                audioStreamFormat:(AudioStreamBasicDescription)audioStreamFormat;

/**
 * Process a chuck of audio samples, and classify speech or non-speech for each frame (10ms).
 * The delegate of this class will receive callbacks when the state changes synchronously.
 *
 * @param samples
 *          the audio samples.
 * @param length
 *          the length of the audio samples.
 */
- (void)processSamples:(const void *)samples withLength:(NSUInteger)length;

@end
