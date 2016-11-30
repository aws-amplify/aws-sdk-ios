/**
 * Delegate for BFAudioSource for events that can occur on an the audio. Maintains a
 * pattern of callbacks being called on the callbackQueue that should be overridden.
 */
@protocol BFAudioSourceDelegate <NSObject>

/**
 * Callback to handle the READY event, which indicates the audio source has
 * been succesfully set up.
 */
- (void)didReady;

/**
 * Callback to handle the SOURCE_START event, which indicates that the audio source
 * has been told to start.
 */
- (void)didStart;

/**
 * Callback to handle the SOURCE_END event, which indicates that the audio source
 * has been told to end.
 *
 * NOTE: This does not indicate that all of the audio has been processed. If you
 * wish to have something occur at the end of the audio source add an async task
 * to your serial callback queue in this callback, which will be the last task
 * processed on it.
 */
- (void)didEnd;

/**
 * Callback to handle the PRODUCE_AUDIO event, which indicates audio data has been
 * made available from the source.
 *
 * @param audioData audio data as bytes.
 */
- (void)didProduceAudio:(NSData *)audioData;

/**
 * Callback to handle SOUND_LEVEL_CHANGE event, which indicate it has detected the
 * sound level has changed.
 *
 * @param level sound level. (RMS)
 */
- (void)didDetectSoundLevelChange:(double)level;

/**
 * Callback to handle the HAVE_ERROR event, which indicates an error occurred during
 * one of the recording processes.
 *
 * @param error occured in the audio source.
 */
- (void)didHaveError:(NSError *)error;

/**
 * Callback to handle the detection of a START_OF_SPEECH event from a voice activity
 * detector.
 */
- (void)didDetectStartOfSpeech;

/**
 * Callback to handle the detection of an END_OF_SPEECH event from the voice activity
 * detector.
 */
- (void)didDetectEndOfSpeech;

@end