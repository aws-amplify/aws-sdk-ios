/**
 * Collection of error codes, used to classify different type of errors within the audio
 * source library.
 */
typedef NS_ENUM (NSInteger, BFAudioSourceErrorCode)
{
    /**
     * Indicates a failure starting the audio source.
     */
    BFErrorCodeAudioSourceStartFailure     = 1001,
    
    /**
     * Indicates a failure producing audio from the audio source.
     */
    BFErrorCodeAudioSourceProducingFailure = 1002,
    
    /**
     * Indicates a failure stopping the audio source.
     */
    BFErrorCodeAudioSourceStopFailure      = 1003
};