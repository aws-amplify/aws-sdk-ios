#import "BFAudioSourceDelegate.h"
#import "BFVADConfig.h"
#import "BFAudioEncoding.h"

/**
 * A BFAudioSource is an abstract concept for representing an source of
 * audio such as a recorder, stream, etc.
 *
 * An audio source will support a specific content type of audio and will
 * callback on its delegate with the audio events on the internal delegate
 * queue.
 */
@interface BFAudioSource : NSObject

/**
 * The string representation of the content type of the audio being
 * produced.
 */
@property (nonatomic, readonly, copy) NSString *contentType;

/**
 * The audio encoding of the audio source to produce.
 */
@property (nonatomic, readonly, assign) BFAudioEncoding encoding;

/**
 * The voice activity detection configuration. Optional.
 */
@property (nonatomic, readonly, strong) BFVADConfig *vadConfig;

/**
 * The delegate for the callbacks from producing audio and processing
 * it.
 */
@property (nonatomic, readwrite, weak) NSObject<BFAudioSourceDelegate> *delegate;

/**
 * The serial queue on which the callbacks will be made. From a BFAudioSource
 * the only tasks on this queue will be the delegate callbacks.
 */
@property (nonatomic, readonly, strong) dispatch_queue_t delegateQueue;

#pragma mark - Public Constructors

/**
 * Initializes the audio source with an encoder and a voice activity detector
 * given the configuration.
 *
 * @param encoding the encoding to use for the audio, either Opus or 16-bit LPCM.
 * @param vadConfig the configuration of the voice activity detection used. Set to nil
 * for no voice activity detection to be run on the audio samples.
 */
- (id)initWithEncoding:(BFAudioEncoding)encoding
voiceActivityDetectorConfiguration:(BFVADConfig *)vadConfig;

/**
 * Initializes the audio source with an encoder and no voice activity detection.
 *
 * @param encoding the encoding to use for the audio, either Opus or 16-bit LPCM.
 */
- (id)initWithEncoding:(BFAudioEncoding)encoding;

#pragma mark - Public Methods

/**
 * Marks the BFAudioSource as started and starts any recording
 * processes required underneath.
 */
- (void)start;

/**
 * Marks the BFAudioSource as having stopped and stops any recording
 * processes required underneath.
 */
- (void)stop;

/**
 * Gives the length of a buffer given the audio encoding of the audio source
 * to use for streaming or reading from the |didProduceAudio| callback.
 */
- (NSUInteger)audioBufferSize;

@end