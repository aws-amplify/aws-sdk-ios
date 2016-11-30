#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "BFDecoder.h"

/**
 * Opus implementation of the decoder.
 */
@interface BFOpusDecoder : BFDecoder

/**
 * Customized initializer.
 *
 * @param audioFormat
 *          format of the audio data.
 * @param frameDuration
 *          duration of each audio frame.
 * @param bitrate
 *          bitrate of the input audio data.
 */
- (id)initWithAudioFormat:(AudioStreamBasicDescription)audioFormat
                 inputFrameDuration:(NSTimeInterval)frameDuration
                       inputBitrate:(NSUInteger)bitrate;
@end
