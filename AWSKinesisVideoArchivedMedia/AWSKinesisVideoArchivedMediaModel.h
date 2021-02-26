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
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSKinesisVideoArchivedMediaErrorDomain;

typedef NS_ENUM(NSInteger, AWSKinesisVideoArchivedMediaErrorType) {
    AWSKinesisVideoArchivedMediaErrorUnknown,
    AWSKinesisVideoArchivedMediaErrorClientLimitExceeded,
    AWSKinesisVideoArchivedMediaErrorInvalidArgument,
    AWSKinesisVideoArchivedMediaErrorInvalidCodecPrivateData,
    AWSKinesisVideoArchivedMediaErrorMissingCodecPrivateData,
    AWSKinesisVideoArchivedMediaErrorNoDataRetention,
    AWSKinesisVideoArchivedMediaErrorNotAuthorized,
    AWSKinesisVideoArchivedMediaErrorResourceNotFound,
    AWSKinesisVideoArchivedMediaErrorUnsupportedStreamMediaType,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoArchivedMediaDiscontinuityMode) {
    AWSKinesisVideoArchivedMediaDiscontinuityModeUnknown,
    AWSKinesisVideoArchivedMediaDiscontinuityModeAlways,
    AWSKinesisVideoArchivedMediaDiscontinuityModeNever,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoArchivedMediaFragmentSelectorType) {
    AWSKinesisVideoArchivedMediaFragmentSelectorTypeUnknown,
    AWSKinesisVideoArchivedMediaFragmentSelectorTypeProducerTimestamp,
    AWSKinesisVideoArchivedMediaFragmentSelectorTypeServerTimestamp,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoArchivedMediaHLSFragmentSelectorType) {
    AWSKinesisVideoArchivedMediaHLSFragmentSelectorTypeUnknown,
    AWSKinesisVideoArchivedMediaHLSFragmentSelectorTypeProducerTimestamp,
    AWSKinesisVideoArchivedMediaHLSFragmentSelectorTypeServerTimestamp,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoArchivedMediaPlaybackMode) {
    AWSKinesisVideoArchivedMediaPlaybackModeUnknown,
    AWSKinesisVideoArchivedMediaPlaybackModeLive,
    AWSKinesisVideoArchivedMediaPlaybackModeOnDemand,
};

@class AWSKinesisVideoArchivedMediaFragment;
@class AWSKinesisVideoArchivedMediaFragmentSelector;
@class AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput;
@class AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput;
@class AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput;
@class AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput;
@class AWSKinesisVideoArchivedMediaHLSFragmentSelector;
@class AWSKinesisVideoArchivedMediaHLSTimestampRange;
@class AWSKinesisVideoArchivedMediaListFragmentsInput;
@class AWSKinesisVideoArchivedMediaListFragmentsOutput;
@class AWSKinesisVideoArchivedMediaTimestampRange;

/**
 <p>Represents a segment of video or other time-delimited data.</p>
 */
@interface AWSKinesisVideoArchivedMediaFragment : AWSModel


/**
 <p>The playback duration or other time value associated with the fragment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fragmentLengthInMilliseconds;

/**
 <p>The index value of the fragment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fragmentNumber;

/**
 <p>The total fragment size, including information about the fragment and contained media data.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fragmentSizeInBytes;

/**
 <p>The time stamp from the producer corresponding to the fragment.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable producerTimestamp;

/**
 <p>The time stamp from the AWS server corresponding to the fragment.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable serverTimestamp;

@end

/**
 <p>Describes the time stamp range and time stamp origin of a range of fragments.</p>
 Required parameters: [FragmentSelectorType, TimestampRange]
 */
@interface AWSKinesisVideoArchivedMediaFragmentSelector : AWSModel


/**
 <p>The origin of the time stamps to use (Server or Producer).</p>
 */
@property (nonatomic, assign) AWSKinesisVideoArchivedMediaFragmentSelectorType fragmentSelectorType;

/**
 <p>The range of time stamps to return.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoArchivedMediaTimestampRange * _Nullable timestampRange;

@end

/**
 
 */
@interface AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput : AWSRequest


/**
 
 */
@property (nonatomic, assign) AWSKinesisVideoArchivedMediaDiscontinuityMode discontinuityMode;

/**
 <p>The time in seconds until the requested session expires. This value can be between 300 (5 minutes) and 43200 (12 hours).</p><p>When a session expires, no new calls to <code>GetHLSMasterPlaylist</code>, <code>GetHLSMediaPlaylist</code>, <code>GetMP4InitFragment</code>, or <code>GetMP4MediaFragment</code> can be made for that session.</p><p>The default is 3600 (one hour).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expires;

/**
 <p>The time range of the requested fragment, and the source of the time stamp.</p><p>This parameter is required if <code>PlaybackMode</code> is <code>ON_DEMAND</code>. This parameter is optional if <code>PlaybackMode</code> is <code>LIVE</code>. If <code>PlaybackMode</code> is <code>LIVE</code>, the <code>FragmentSelectorType</code> can be set, but the <code>TimestampRange</code> should not be set.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoArchivedMediaHLSFragmentSelector * _Nullable HLSFragmentSelector;

/**
 <p>The maximum number of fragments that Kinesis Video Streams will return.</p><p>When the <code>PlaybackMode</code> is <code>LIVE</code>, the most recent fragments are returned up to this value. When the <code>PlaybackMode</code> is <code>ON_DEMAND</code>, the oldest fragments are returned, up to this maximum number.</p><p>When there are more fragments available in a live HLS media playlist, video players often buffer content before starting playback. Increasing the buffer size increases the playback latency, but it decreases the likelihood that rebuffering will occur during playback. We recommend that a live HLS media playlist have a minimum of 3 fragments and a maximum of 10 fragments.</p><p>The default is 5 fragments if <code>PlaybackMode</code> is <code>LIVE</code>, and 1000 if <code>PlaybackMode</code> is <code>ON_DEMAND</code>. </p><p>The maximum value of 1000 fragments corresponds to more than 16 minutes of video on streams with one-second fragments, and more than 2 1/2 hours of video on streams with ten-second fragments.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxMediaPlaylistFragmentResults;

/**
 <p>Whether to retrieve live or archived, on-demand data.</p><p>Features of the two types of session include the following:</p><ul><li><p><b><code>LIVE</code></b>: For sessions of this type, the HLS media playlist is continually updated with the latest fragments as they become available. We recommend that the media player retrieve a new playlist on a one-second interval. When this type of session is played in a media player, the user interface typically displays a "live" notification, with no scrubber control for choosing the position in the playback window to display.</p><note><p>In <code>LIVE</code> mode, the newest available fragments are included in an HLS media playlist, even if there is a gap between fragments (that is, if a fragment is missing). A gap like this might cause a media player to halt or cause a jump in playback. In this mode, fragments are not added to the HLS media playlist if they are older than the newest fragment in the playlist. If the missing fragment becomes available after a subsequent fragment is added to the playlist, the older fragment is not added, and the gap is not filled.</p></note></li><li><p><b><code>ON_DEMAND</code></b>: For sessions of this type, the HLS media playlist contains all the fragments for the session, up to the number that is specified in <code>MaxMediaPlaylistFragmentResults</code>. The playlist must be retrieved only once for each session. When this type of session is played in a media player, the user interface typically displays a scrubber control for choosing the position in the playback window to display.</p><note><p>The duration of the fragments in the HLS media playlists is typically reported as short by one frame (for example, 33 milliseconds for a 30 FPS fragment). This might cause the media player to report a shorter total duration until the media player decodes the fragments.</p></note></li></ul><p>In both playback modes, if there are multiple fragments with the same start time stamp, the fragment that has the larger fragment number (that is, the newer fragment) is included in the HLS media playlist. The other fragments are not included. Fragments that have different time stamps but have overlapping durations are still included in the HLS media playlist. This can lead to unexpected behavior in the media player.</p><p>The default is <code>LIVE</code>.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoArchivedMediaPlaybackMode playbackMode;

/**
 <p>The Amazon Resource Name (ARN) of the stream for which to retrieve the HLS master playlist URL.</p><p>You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream for which to retrieve the HLS master playlist URL.</p><p>You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLOutput : AWSModel


/**
 <p>The URL (containing the session token) that a media player can use to retrieve the HLS master playlist.</p>
 */
@property (nonatomic, strong) NSString * _Nullable HLSStreamingSessionURL;

@end

/**
 
 */
@interface AWSKinesisVideoArchivedMediaGetMediaForFragmentListInput : AWSRequest


/**
 <p>A list of the numbers of fragments for which to retrieve media. You retrieve these values with <a>ListFragments</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable fragments;

/**
 <p>The name of the stream from which to retrieve fragment media.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoArchivedMediaGetMediaForFragmentListOutput : AWSModel


/**
 <p>The content type of the requested media.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

/**
 <p>The payload that Kinesis Video Streams returns is a sequence of chunks from the specified stream. For information about the chunks, see <a href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_dataplane_PutMedia.html">PutMedia</a>. The chunks that Kinesis Video Streams returns in the <code>GetMediaForFragmentList</code> call also include the following additional Matroska (MKV) tags: </p><ul><li><p>AWS_KINESISVIDEO_FRAGMENT_NUMBER - Fragment number returned in the chunk.</p></li><li><p>AWS_KINESISVIDEO_SERVER_SIDE_TIMESTAMP - Server-side time stamp of the fragment.</p></li><li><p>AWS_KINESISVIDEO_PRODUCER_SIDE_TIMESTAMP - Producer-side time stamp of the fragment.</p></li></ul><p>The following tags will be included if an exception occurs:</p><ul><li><p>AWS_KINESISVIDEO_FRAGMENT_NUMBER - The number of the fragment that threw the exception</p></li><li><p>AWS_KINESISVIDEO_EXCEPTION_ERROR_CODE - The integer code of the exception</p></li><li><p>AWS_KINESISVIDEO_EXCEPTION_MESSAGE - A text description of the exception</p></li></ul>
 */
@property (nonatomic, strong) NSData * _Nullable payload;

@end

/**
 <p>Contains the range of time stamps for the requested media, and the source of the time stamps.</p>
 */
@interface AWSKinesisVideoArchivedMediaHLSFragmentSelector : AWSModel


/**
 <p>The source of the time stamps for the requested media.</p><p>The default is <code>PRODUCER_TIMESTAMP</code>.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoArchivedMediaHLSFragmentSelectorType fragmentSelectorType;

/**
 <p>The start and end of the time stamp range for the requested media.</p><p>This value should not be present if <code>PlaybackType</code> is <code>LIVE</code>.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoArchivedMediaHLSTimestampRange * _Nullable timestampRange;

@end

/**
 <p>The start and end of the time stamp range for the requested media.</p><p>This value should not be present if <code>PlaybackType</code> is <code>LIVE</code>.</p><note><p>The values in the <code>HLSTimestampRange</code> are inclusive. Fragments that begin before the start time but continue past it, or fragments that begin before the end time but continue past it, are included in the session.</p></note>
 */
@interface AWSKinesisVideoArchivedMediaHLSTimestampRange : AWSModel


/**
 <p>The end of the time stamp range for the requested media. This value must be within three hours of the specified <code>StartTimestamp</code>, and it must be later than the <code>StartTimestamp</code> value.</p><p>If <code>FragmentSelectorType</code> for the request is <code>SERVER_TIMESTAMP</code>, this value must be in the past.</p><p>If the <code>HLSTimestampRange</code> value is specified, the <code>EndTimestamp</code> value is required.</p><note><p>This value is inclusive. The <code>EndTimestamp</code> is compared to the (starting) time stamp of the fragment. Fragments that start before the <code>EndTimestamp</code> value and continue past it are included in the session.</p></note>
 */
@property (nonatomic, strong) NSDate * _Nullable endTimestamp;

/**
 <p>The start of the time stamp range for the requested media.</p><p>If the <code>HLSTimestampRange</code> value is specified, the <code>StartTimestamp</code> value is required.</p><note><p>This value is inclusive. Fragments that start before the <code>StartingTimestamp</code> and continue past it are included in the session.</p></note>
 */
@property (nonatomic, strong) NSDate * _Nullable startTimestamp;

@end

/**
 
 */
@interface AWSKinesisVideoArchivedMediaListFragmentsInput : AWSRequest


/**
 <p>Describes the time stamp range and time stamp origin for the range of fragments to return.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoArchivedMediaFragmentSelector * _Nullable fragmentSelector;

/**
 <p>The total number of fragments to return. If the total number of fragments available is more than the value specified in <code>max-results</code>, then a <a>ListFragmentsOutput$NextToken</a> is provided in the output that you can use to resume pagination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to specify where to start paginating. This is the <a>ListFragmentsOutput$NextToken</a> from a previously truncated response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the stream from which to retrieve a fragment list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoArchivedMediaListFragmentsOutput : AWSModel


/**
 <p>A list of fragment numbers that correspond to the time stamp range provided.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisVideoArchivedMediaFragment *> * _Nullable fragments;

/**
 <p>If the returned list is truncated, the operation returns this token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The range of time stamps for which to return fragments.</p>
 Required parameters: [StartTimestamp, EndTimestamp]
 */
@interface AWSKinesisVideoArchivedMediaTimestampRange : AWSModel


/**
 <p>The ending time stamp in the range of time stamps for which to return fragments.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTimestamp;

/**
 <p>The starting time stamp in the range of time stamps for which to return fragments.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTimestamp;

@end

NS_ASSUME_NONNULL_END
