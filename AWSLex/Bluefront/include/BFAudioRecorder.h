#import <AVFoundation/AVFoundation.h>
#import "BFAudioSource.h"
#import "BFEncoder.h"
#import "BFVADConfig.h"
#import "BFAudioEncoding.h"

/**
 * An implementation of the BFAudioSource interface that accesses the audio
 * recording threads and produces audio that is encoded. Can run voice
 * activity detection on the audio it records as well to propagate those
 * events.
 */
@interface BFAudioRecorder : BFAudioSource

@property (nonatomic, readonly, assign) BOOL isRecording;

/**
 * Initializes the audio recorder with an encoder, a voice activity detector
 * given the configuration and allows audio session to be defined to either allow or
 * disallow playback from phone speakers during recording.
 *
 * @param encoding the encoding to use for the audio, either Opus or 16-bit LPCM.
 * @param vadConfig the configuration of the voice activity detection used. Set to nil
 * for no voice activity detection to be run on the audio samples.
 * @param allowAudioPlayback if set to YES then this flag will not stop the sound coming
 * out of the speakers before recording. Useful for VoIP applications.
 */
- (id)initWithEncoding:(BFAudioEncoding)encoding
voiceActivityDetectorConfiguration:(BFVADConfig *)vadConfig
                allowAudioPlayback:(BOOL)allowAudioPlayback;

/**
 * Initializes the audio recorder with an encoder and a voice activity detector
 * given the configuration.
 *
 * @param encoding the encoding to use for the audio, either Opus or 16-bit LPCM.
 * @param vadConfig the configuration of the voice activity detection used. Set to nil
 * for no voice activity detection to be run on the audio samples.
 */
- (id)initWithEncoding:(BFAudioEncoding)encoding
voiceActivityDetectorConfiguration:(BFVADConfig *)vadConfig;

/**
 * Initializes the audio recorder with an encoder and no voice activity detection.
 *
 * @param encoding the encoding to use for the audio, either Opus or 16-bit LPCM.
 */
- (id)initWithEncoding:(BFAudioEncoding)encoding;

/**
 * Initializes the audio recorder with a 16-bit LPCM encoder.
 */
- (id)init;

@end
