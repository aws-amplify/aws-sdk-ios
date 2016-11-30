#import <AVFoundation/AVFoundation.h>
#import "BFEncoder.h"

/**
 * Opus implementation of the encoder.
 */
@interface BFOpusEncoder : BFEncoder

/**
 * Customized initializer.
 *
 * @param audioFormat
 *          format of the audio data.
 * @param frameDuration
 *          duration of an audio frame in seconds (Must be positive).
 * @param bitrate
 *          the encode bitrate (Must be positive).
 * @param complexity
 *          encode complexity (Must be within range of [0, 10]).
 */
- (id)initWithAudioFormat:(AudioStreamBasicDescription)audioFormat
       inputFrameDuration:(NSTimeInterval)frameDuration
            outputBitrate:(NSUInteger)bitrate
               complexity:(NSUInteger)complexity;

@end
