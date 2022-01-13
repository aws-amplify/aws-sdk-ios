#import <Foundation/Foundation.h>

/**
 * Decoder interface.
 */
@interface BFDecoder : NSObject

/**
 * Decode the input data.
 *
 * @param inputData
 *          the input data to be decoded.
 */
- (NSData *)decode:(NSData *)inputData;

@end
