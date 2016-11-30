#import "BFEncoder.h"

/**
 * LPCM16 implementation of encoder.
 */
@interface BFLPCM16Encoder : BFEncoder

/**
 * Creates a LPCM 16-bit encoder with default sample rate of 16000Hz and
 * default channels of 1.
 */
- (id)init;

/**
 * Customized initializer.
 *
 * @param sampleRate
 *          the audio sample rate.
 * @param channels
 *          the number of channels.
 */
- (id)initWithSampleRate:(NSUInteger)sampleRate channels:(NSUInteger)channels;

/**
 * Creates the audio format to represent LPCM-16 for the given sample rate and
 * number of channels.
 *
 * @param sampleRate the sample rate in Hz
 * @param channels number of audio channels
 */
+ (AudioStreamBasicDescription)createAudioFormatFromSampleRate:(NSUInteger)sampleRate
                                                      channels:(NSUInteger)channels;

@end
