#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

/**
 * Encoder interface.
 */
@interface BFEncoder : NSObject

@property (nonatomic, readonly, copy) NSString *contentType;

/**
 * Encode the input data.
 *
 * @param inputData
 *          the input data to be encoded.
 * @return encoded data.
 */
- (NSData *)encode:(NSData *)inputData;

/**
 * Gets the correct buffer size for the duration of time in seconds.
 *
 * @param duration amount of audio seconds for the buffer.
 */
- (NSUInteger)bufferSizeForDuration:(NSTimeInterval)duration;

@end
