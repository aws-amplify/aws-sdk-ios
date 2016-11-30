#import <Foundation/Foundation.h>

/*
 * Default VAD settings.
 */
static const NSUInteger DEFAULT_STARTPOINTING_THRESHOLD = 22;
static const NSUInteger DEFAULT_ENDPOINTING_THRESHOLD = 60;
static const float      DEFAULT_LRT_THRESHOLD = 1.6f;

/**
 * VAD configuration which will be used to configure the end pointer.
 */
@interface BFVADConfig : NSObject

@property (nonatomic, readonly, assign) NSUInteger startpointingThreshold;
@property (nonatomic, readonly, assign) NSUInteger endpointingThreshold;
@property (nonatomic, readonly, assign) float      lrtThreshold;

/**
 * Creates VAD configuration with the given number of startpoint/enpoint frames and the LRT
 * threshold.
 *
 * @param lrtThreshold
 *        The Likelyhood-ratio test threshold value, which will be used to clasify whether a frame
 *        of audio is a speech or not. (Can't be negative)
 * @param startpointingThreshold
 *        The number of speech frames which defines what is a active speech. (Must be positive)
 * @param endpointingThreshold
 *        The the number of non-speech frames which defines what a silence is. (Must be positive)
 */
- (id)initWithLrtThreshold:(float)lrtThreshold
              startpointingThreshold:(NSUInteger)startpointingThreshold
                endpointingThreshold:(NSUInteger)endpointingThreshold;
@end
