//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSKinesisVideoArchivedMediaModel.h"
#import "AWSKinesisVideoArchivedMediaResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSKinesisVideoArchivedMedia
FOUNDATION_EXPORT NSString *const AWSKinesisVideoArchivedMediaSDKVersion;

/**
 <p/>
 */
@interface AWSKinesisVideoArchivedMedia : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let KinesisVideoArchivedMedia = AWSKinesisVideoArchivedMedia.default()

 *Objective-C*

     AWSKinesisVideoArchivedMedia *KinesisVideoArchivedMedia = [AWSKinesisVideoArchivedMedia defaultKinesisVideoArchivedMedia];

 @return The default service client.
 */
+ (instancetype)defaultKinesisVideoArchivedMedia;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSKinesisVideoArchivedMedia.register(with: configuration!, forKey: "USWest2KinesisVideoArchivedMedia")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKinesisVideoArchivedMedia registerKinesisVideoArchivedMediaWithConfiguration:configuration forKey:@"USWest2KinesisVideoArchivedMedia"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let KinesisVideoArchivedMedia = AWSKinesisVideoArchivedMedia(forKey: "USWest2KinesisVideoArchivedMedia")

 *Objective-C*

     AWSKinesisVideoArchivedMedia *KinesisVideoArchivedMedia = [AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:@"USWest2KinesisVideoArchivedMedia"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerKinesisVideoArchivedMediaWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerKinesisVideoArchivedMediaWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSKinesisVideoArchivedMedia.register(with: configuration!, forKey: "USWest2KinesisVideoArchivedMedia")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSKinesisVideoArchivedMedia registerKinesisVideoArchivedMediaWithConfiguration:configuration forKey:@"USWest2KinesisVideoArchivedMedia"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let KinesisVideoArchivedMedia = AWSKinesisVideoArchivedMedia(forKey: "USWest2KinesisVideoArchivedMedia")

 *Objective-C*

     AWSKinesisVideoArchivedMedia *KinesisVideoArchivedMedia = [AWSKinesisVideoArchivedMedia KinesisVideoArchivedMediaForKey:@"USWest2KinesisVideoArchivedMedia"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)KinesisVideoArchivedMediaForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeKinesisVideoArchivedMediaForKey:(NSString *)key;

/**
 <p>Retrieves an HTTP Live Streaming (HLS) URL for the stream. The URL can then be opened in a browser or media player to view the stream contents.</p><p>You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p><p>An Amazon Kinesis video stream has the following requirements for providing data through HLS:</p><ul><li><p>The media type must be <code>video/h264</code>.</p></li><li><p>Data retention must be greater than 0.</p></li><li><p>The fragments must contain codec private data in the AVC (Advanced Video Coding) for H.264 format (<a href="https://www.iso.org/standard/55980.html">MPEG-4 specification ISO/IEC 14496-15</a>). For information about adapting stream data to a given format, see <a href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/latest/dg/producer-reference-nal.html">NAL Adaptation Flags</a>.</p></li></ul><p>Kinesis Video Streams HLS sessions contain fragments in the fragmented MPEG-4 form (also called fMP4 or CMAF), rather than the MPEG-2 form (also called TS chunks, which the HLS specification also supports). For more information about HLS fragment types, see the <a href="https://tools.ietf.org/html/draft-pantos-http-live-streaming-23">HLS specification</a>.</p><p>The following procedure shows how to use HLS with Kinesis Video Streams:</p><ol><li><p>Get an endpoint using <a href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_GetDataEndpoint.html">GetDataEndpoint</a>, specifying <code>GET_HLS_STREAMING_SESSION_URL</code> for the <code>APIName</code> parameter.</p></li><li><p>Retrieve the HLS URL using <code>GetHLSStreamingSessionURL</code>. Kinesis Video Streams creates an HLS streaming session to be used for accessing content in a stream using the HLS protocol. <code>GetHLSStreamingSessionURL</code> returns an authenticated URL (that includes an encrypted session token) for the session's HLS <i>master playlist</i> (the root resource needed for streaming with HLS).</p><note><p>Don't share or store this token where an unauthorized entity could access it. The token provides access to the content of the stream. Safeguard the token with the same measures that you would use with your AWS credentials.</p></note><p>The media that is made available through the playlist consists only of the requested stream, time range, and format. No other media data (such as frames outside the requested window or alternate bit rates) is made available.</p></li><li><p>Provide the URL (containing the encrypted session token) for the HLS master playlist to a media player that supports the HLS protocol. Kinesis Video Streams makes the HLS media playlist, initialization fragment, and media fragments available through the master playlist URL. The initialization fragment contains the codec private data for the stream, and other data needed to set up the video decoder and renderer. The media fragments contain H.264-encoded video frames and time stamps.</p></li><li><p>The media player receives the authenticated URL and requests stream metadata and media data normally. When the media player requests data, it calls the following actions:</p><ul><li><p><b>GetHLSMasterPlaylist:</b> Retrieves an HLS master playlist, which contains a URL for the <code>GetHLSMediaPlaylist</code> action, and additional metadata for the media player, including estimated bit rate and resolution.</p></li><li><p><b>GetHLSMediaPlaylist:</b> Retrieves an HLS media playlist, which contains a URL to access the MP4 intitialization fragment with the <code>GetMP4InitFragment</code> action, and URLs to access the MP4 media fragments with the <code>GetMP4MediaFragment</code> actions. The HLS media playlist also contains metadata about the stream that the player needs to play it, such as whether the <code>PlaybackMode</code> is <code>LIVE</code> or <code>ON_DEMAND</code>. The HLS media playlist is typically static for sessions with a <code>PlaybackType</code> of <code>ON_DEMAND</code>. The HLS media playlist is continually updated with new fragments for sessions with a <code>PlaybackType</code> of <code>LIVE</code>.</p></li><li><p><b>GetMP4InitFragment:</b> Retrieves the MP4 initialization fragment. The media player typically loads the initialization fragment before loading any media fragments. This fragment contains the "<code>fytp</code>" and "<code>moov</code>" MP4 atoms, and the child atoms that are needed to initialize the media player decoder.</p><p>The initialization fragment does not correspond to a fragment in a Kinesis video stream. It contains only the codec private data for the stream, which the media player needs to decode video frames.</p></li><li><p><b>GetMP4MediaFragment:</b> Retrieves MP4 media fragments. These fragments contain the "<code>moof</code>" and "<code>mdat</code>" MP4 atoms and their child atoms, containing the encoded fragment's video frames and their time stamps.</p><note><p>After the first media fragment is made available in a streaming session, any fragments that don't contain the same codec private data are excluded in the HLS media playlist. Therefore, the codec private data does not change between fragments in a session.</p></note></li></ul></li></ol><note><p>The following restrictions apply to HLS sessions:</p><ul><li><p>A streaming session URL should not be shared between players. The service might throttle a session if multiple media players are sharing it. For connection limits, see <a href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/limits.html">Kinesis Video Streams Limits</a>.</p></li><li><p>A Kinesis video stream can have a maximum of five active HLS streaming sessions. If a new session is created when the maximum number of sessions is already active, the oldest (earliest created) session is closed. The number of active <code>GetMedia</code> connections on a Kinesis video stream does not count against this limit, and the number of active HLS sessions does not count against the active <code>GetMedia</code> connection limit.</p></li></ul></note><p>You can monitor the amount of data that the media player consumes by monitoring the <code>GetMP4MediaFragment.OutgoingBytes</code> Amazon CloudWatch metric. For information about using CloudWatch to monitor Kinesis Video Streams, see <a href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/monitoring.html">Monitoring Kinesis Video Streams</a>. For pricing information, see <a href="https://aws.amazon.com/kinesis/video-streams/pricing/">Amazon Kinesis Video Streams Pricing</a> and <a href="https://aws.amazon.com/pricing/">AWS Pricing</a>. Charges for both HLS sessions and outgoing AWS data apply.</p><p>For more information about HLS, see <a href="https://developer.apple.com/streaming/">HTTP Live Streaming</a> on the <a href="https://developer.apple.com">Apple Developer site</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetHLSStreamingSessionURL service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoArchivedMediaErrorDomain` domain and the following error code: `AWSKinesisVideoArchivedMediaErrorResourceNotFound`, `AWSKinesisVideoArchivedMediaErrorInvalidArgument`, `AWSKinesisVideoArchivedMediaErrorClientLimitExceeded`, `AWSKinesisVideoArchivedMediaErrorNotAuthorized`, `AWSKinesisVideoArchivedMediaErrorUnsupportedStreamMediaType`, `AWSKinesisVideoArchivedMediaErrorNoDataRetention`, `AWSKinesisVideoArchivedMediaErrorMissingCodecPrivateData`, `AWSKinesisVideoArchivedMediaErrorInvalidCodecPrivateData`.
 
 @see AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput
 @see AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput
 */
- (AWSTask<AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput *> *)getHLSStreamingSessionURL:(AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput *)request;

/**
 <p>Retrieves an HTTP Live Streaming (HLS) URL for the stream. The URL can then be opened in a browser or media player to view the stream contents.</p><p>You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p><p>An Amazon Kinesis video stream has the following requirements for providing data through HLS:</p><ul><li><p>The media type must be <code>video/h264</code>.</p></li><li><p>Data retention must be greater than 0.</p></li><li><p>The fragments must contain codec private data in the AVC (Advanced Video Coding) for H.264 format (<a href="https://www.iso.org/standard/55980.html">MPEG-4 specification ISO/IEC 14496-15</a>). For information about adapting stream data to a given format, see <a href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/latest/dg/producer-reference-nal.html">NAL Adaptation Flags</a>.</p></li></ul><p>Kinesis Video Streams HLS sessions contain fragments in the fragmented MPEG-4 form (also called fMP4 or CMAF), rather than the MPEG-2 form (also called TS chunks, which the HLS specification also supports). For more information about HLS fragment types, see the <a href="https://tools.ietf.org/html/draft-pantos-http-live-streaming-23">HLS specification</a>.</p><p>The following procedure shows how to use HLS with Kinesis Video Streams:</p><ol><li><p>Get an endpoint using <a href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_GetDataEndpoint.html">GetDataEndpoint</a>, specifying <code>GET_HLS_STREAMING_SESSION_URL</code> for the <code>APIName</code> parameter.</p></li><li><p>Retrieve the HLS URL using <code>GetHLSStreamingSessionURL</code>. Kinesis Video Streams creates an HLS streaming session to be used for accessing content in a stream using the HLS protocol. <code>GetHLSStreamingSessionURL</code> returns an authenticated URL (that includes an encrypted session token) for the session's HLS <i>master playlist</i> (the root resource needed for streaming with HLS).</p><note><p>Don't share or store this token where an unauthorized entity could access it. The token provides access to the content of the stream. Safeguard the token with the same measures that you would use with your AWS credentials.</p></note><p>The media that is made available through the playlist consists only of the requested stream, time range, and format. No other media data (such as frames outside the requested window or alternate bit rates) is made available.</p></li><li><p>Provide the URL (containing the encrypted session token) for the HLS master playlist to a media player that supports the HLS protocol. Kinesis Video Streams makes the HLS media playlist, initialization fragment, and media fragments available through the master playlist URL. The initialization fragment contains the codec private data for the stream, and other data needed to set up the video decoder and renderer. The media fragments contain H.264-encoded video frames and time stamps.</p></li><li><p>The media player receives the authenticated URL and requests stream metadata and media data normally. When the media player requests data, it calls the following actions:</p><ul><li><p><b>GetHLSMasterPlaylist:</b> Retrieves an HLS master playlist, which contains a URL for the <code>GetHLSMediaPlaylist</code> action, and additional metadata for the media player, including estimated bit rate and resolution.</p></li><li><p><b>GetHLSMediaPlaylist:</b> Retrieves an HLS media playlist, which contains a URL to access the MP4 intitialization fragment with the <code>GetMP4InitFragment</code> action, and URLs to access the MP4 media fragments with the <code>GetMP4MediaFragment</code> actions. The HLS media playlist also contains metadata about the stream that the player needs to play it, such as whether the <code>PlaybackMode</code> is <code>LIVE</code> or <code>ON_DEMAND</code>. The HLS media playlist is typically static for sessions with a <code>PlaybackType</code> of <code>ON_DEMAND</code>. The HLS media playlist is continually updated with new fragments for sessions with a <code>PlaybackType</code> of <code>LIVE</code>.</p></li><li><p><b>GetMP4InitFragment:</b> Retrieves the MP4 initialization fragment. The media player typically loads the initialization fragment before loading any media fragments. This fragment contains the "<code>fytp</code>" and "<code>moov</code>" MP4 atoms, and the child atoms that are needed to initialize the media player decoder.</p><p>The initialization fragment does not correspond to a fragment in a Kinesis video stream. It contains only the codec private data for the stream, which the media player needs to decode video frames.</p></li><li><p><b>GetMP4MediaFragment:</b> Retrieves MP4 media fragments. These fragments contain the "<code>moof</code>" and "<code>mdat</code>" MP4 atoms and their child atoms, containing the encoded fragment's video frames and their time stamps.</p><note><p>After the first media fragment is made available in a streaming session, any fragments that don't contain the same codec private data are excluded in the HLS media playlist. Therefore, the codec private data does not change between fragments in a session.</p></note></li></ul></li></ol><note><p>The following restrictions apply to HLS sessions:</p><ul><li><p>A streaming session URL should not be shared between players. The service might throttle a session if multiple media players are sharing it. For connection limits, see <a href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/limits.html">Kinesis Video Streams Limits</a>.</p></li><li><p>A Kinesis video stream can have a maximum of five active HLS streaming sessions. If a new session is created when the maximum number of sessions is already active, the oldest (earliest created) session is closed. The number of active <code>GetMedia</code> connections on a Kinesis video stream does not count against this limit, and the number of active HLS sessions does not count against the active <code>GetMedia</code> connection limit.</p></li></ul></note><p>You can monitor the amount of data that the media player consumes by monitoring the <code>GetMP4MediaFragment.OutgoingBytes</code> Amazon CloudWatch metric. For information about using CloudWatch to monitor Kinesis Video Streams, see <a href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/monitoring.html">Monitoring Kinesis Video Streams</a>. For pricing information, see <a href="https://aws.amazon.com/kinesis/video-streams/pricing/">Amazon Kinesis Video Streams Pricing</a> and <a href="https://aws.amazon.com/pricing/">AWS Pricing</a>. Charges for both HLS sessions and outgoing AWS data apply.</p><p>For more information about HLS, see <a href="https://developer.apple.com/streaming/">HTTP Live Streaming</a> on the <a href="https://developer.apple.com">Apple Developer site</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetHLSStreamingSessionURL service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoArchivedMediaErrorDomain` domain and the following error code: `AWSKinesisVideoArchivedMediaErrorResourceNotFound`, `AWSKinesisVideoArchivedMediaErrorInvalidArgument`, `AWSKinesisVideoArchivedMediaErrorClientLimitExceeded`, `AWSKinesisVideoArchivedMediaErrorNotAuthorized`, `AWSKinesisVideoArchivedMediaErrorUnsupportedStreamMediaType`, `AWSKinesisVideoArchivedMediaErrorNoDataRetention`, `AWSKinesisVideoArchivedMediaErrorMissingCodecPrivateData`, `AWSKinesisVideoArchivedMediaErrorInvalidCodecPrivateData`.
 
 @see AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput
 @see AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput
 */
- (void)getHLSStreamingSessionURL:(AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets media for a list of fragments (specified by fragment number) from the archived data in an Amazon Kinesis video stream.</p><p>The following limits apply when using the <code>GetMediaForFragmentList</code> API:</p><ul><li><p>A client can call <code>GetMediaForFragmentList</code> up to five times per second per stream. </p></li><li><p>Kinesis Video Streams sends media data at a rate of up to 25 megabytes per second (or 200 megabits per second) during a <code>GetMediaForFragmentList</code> session. </p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetMediaForFragmentList service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoArchivedMediaErrorDomain` domain and the following error code: `AWSKinesisVideoArchivedMediaErrorResourceNotFound`, `AWSKinesisVideoArchivedMediaErrorInvalidArgument`, `AWSKinesisVideoArchivedMediaErrorClientLimitExceeded`, `AWSKinesisVideoArchivedMediaErrorNotAuthorized`.
 
 @see AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput
 @see AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput
 */
- (AWSTask<AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput *> *)getMediaForFragmentList:(AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput *)request;

/**
 <p>Gets media for a list of fragments (specified by fragment number) from the archived data in an Amazon Kinesis video stream.</p><p>The following limits apply when using the <code>GetMediaForFragmentList</code> API:</p><ul><li><p>A client can call <code>GetMediaForFragmentList</code> up to five times per second per stream. </p></li><li><p>Kinesis Video Streams sends media data at a rate of up to 25 megabytes per second (or 200 megabits per second) during a <code>GetMediaForFragmentList</code> session. </p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetMediaForFragmentList service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoArchivedMediaErrorDomain` domain and the following error code: `AWSKinesisVideoArchivedMediaErrorResourceNotFound`, `AWSKinesisVideoArchivedMediaErrorInvalidArgument`, `AWSKinesisVideoArchivedMediaErrorClientLimitExceeded`, `AWSKinesisVideoArchivedMediaErrorNotAuthorized`.
 
 @see AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput
 @see AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput
 */
- (void)getMediaForFragmentList:(AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of <a>Fragment</a> objects from the specified stream and start location within the archived data.</p>
 
 @param request A container for the necessary parameters to execute the ListFragments service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSKinesisVideoArchivedMediaListFragmentsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSKinesisVideoArchivedMediaErrorDomain` domain and the following error code: `AWSKinesisVideoArchivedMediaErrorResourceNotFound`, `AWSKinesisVideoArchivedMediaErrorInvalidArgument`, `AWSKinesisVideoArchivedMediaErrorClientLimitExceeded`, `AWSKinesisVideoArchivedMediaErrorNotAuthorized`.
 
 @see AWSKinesisVideoArchivedMediaListFragmentsInput
 @see AWSKinesisVideoArchivedMediaListFragmentsOutput
 */
- (AWSTask<AWSKinesisVideoArchivedMediaListFragmentsOutput *> *)listFragments:(AWSKinesisVideoArchivedMediaListFragmentsInput *)request;

/**
 <p>Returns a list of <a>Fragment</a> objects from the specified stream and start location within the archived data.</p>
 
 @param request A container for the necessary parameters to execute the ListFragments service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSKinesisVideoArchivedMediaErrorDomain` domain and the following error code: `AWSKinesisVideoArchivedMediaErrorResourceNotFound`, `AWSKinesisVideoArchivedMediaErrorInvalidArgument`, `AWSKinesisVideoArchivedMediaErrorClientLimitExceeded`, `AWSKinesisVideoArchivedMediaErrorNotAuthorized`.
 
 @see AWSKinesisVideoArchivedMediaListFragmentsInput
 @see AWSKinesisVideoArchivedMediaListFragmentsOutput
 */
- (void)listFragments:(AWSKinesisVideoArchivedMediaListFragmentsInput *)request completionHandler:(void (^ _Nullable)(AWSKinesisVideoArchivedMediaListFragmentsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
