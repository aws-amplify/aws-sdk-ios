/**
 * Delegate for the callbacks from the BFVoiceActivityDetector. These callbacks
 * are synchronous and callback on the queue that called them immediately.
 */
@protocol BFVoiceActivityDetectorDelegate

/**
 * Called if a START_OF_SPEECH state is entered when processing
 * samples in the BFVoiceActivityDetector.
 */
- (void)didHaveStartOfSpeech;

/**
 * Called if a END_OF_SPEECH state is entered when processing
 * samples in the BFVoiceActivityDetector.
 */
- (void)didHaveEndOfSpeech;

@end