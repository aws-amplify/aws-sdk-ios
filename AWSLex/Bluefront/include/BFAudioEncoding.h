#import <AVFoundation/AVFoundation.h>

/**
 * Enumeration of the supported audio encodings by BFAudioSource's in this project.
 */
typedef NS_ENUM (NSInteger, BFAudioEncoding)
{
    /**
     * Indicates to use the BFOpusEncoder for encoding the audio as
     * Opus compressed.
     */
    BFOpusAudioEncoding   = 1,
    
    /**
     * Indicates to use the BFLPCM16Encoder for encoding the audio
     * in 16-bit LPCM format.
     */
    BFLPCM16AudioEncoding = 2
};