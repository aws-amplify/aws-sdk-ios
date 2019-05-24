//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

FOUNDATION_EXPORT NSString *const AWSKinesisVideoErrorDomain;

typedef NS_ENUM(NSInteger, AWSKinesisVideoErrorType) {
    AWSKinesisVideoErrorUnknown,
    AWSKinesisVideoErrorAccountStreamLimitExceeded,
    AWSKinesisVideoErrorClientLimitExceeded,
    AWSKinesisVideoErrorDeviceStreamLimitExceeded,
    AWSKinesisVideoErrorInvalidArgument,
    AWSKinesisVideoErrorInvalidDevice,
    AWSKinesisVideoErrorInvalidResourceFormat,
    AWSKinesisVideoErrorNotAuthorized,
    AWSKinesisVideoErrorResourceInUse,
    AWSKinesisVideoErrorResourceNotFound,
    AWSKinesisVideoErrorTagsPerResourceExceededLimit,
    AWSKinesisVideoErrorVersionMismatch,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoAPIName) {
    AWSKinesisVideoAPINameUnknown,
    AWSKinesisVideoAPINamePutMedia,
    AWSKinesisVideoAPINameGetMedia,
    AWSKinesisVideoAPINameListFragments,
    AWSKinesisVideoAPINameGetMediaForFragmentList,
    AWSKinesisVideoAPINameGetHlsStreamingSessionUrl,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoComparisonOperator) {
    AWSKinesisVideoComparisonOperatorUnknown,
    AWSKinesisVideoComparisonOperatorBeginsWith,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoStatus) {
    AWSKinesisVideoStatusUnknown,
    AWSKinesisVideoStatusCreating,
    AWSKinesisVideoStatusActive,
    AWSKinesisVideoStatusUpdating,
    AWSKinesisVideoStatusDeleting,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoUpdateDataRetentionOperation) {
    AWSKinesisVideoUpdateDataRetentionOperationUnknown,
    AWSKinesisVideoUpdateDataRetentionOperationIncreaseDataRetention,
    AWSKinesisVideoUpdateDataRetentionOperationDecreaseDataRetention,
};

@class AWSKinesisVideoCreateStreamInput;
@class AWSKinesisVideoCreateStreamOutput;
@class AWSKinesisVideoDeleteStreamInput;
@class AWSKinesisVideoDeleteStreamOutput;
@class AWSKinesisVideoDescribeStreamInput;
@class AWSKinesisVideoDescribeStreamOutput;
@class AWSKinesisVideoGetDataEndpointInput;
@class AWSKinesisVideoGetDataEndpointOutput;
@class AWSKinesisVideoListStreamsInput;
@class AWSKinesisVideoListStreamsOutput;
@class AWSKinesisVideoListTagsForStreamInput;
@class AWSKinesisVideoListTagsForStreamOutput;
@class AWSKinesisVideoStreamInfo;
@class AWSKinesisVideoStreamNameCondition;
@class AWSKinesisVideoTagStreamInput;
@class AWSKinesisVideoTagStreamOutput;
@class AWSKinesisVideoUntagStreamInput;
@class AWSKinesisVideoUntagStreamOutput;
@class AWSKinesisVideoUpdateDataRetentionInput;
@class AWSKinesisVideoUpdateDataRetentionOutput;
@class AWSKinesisVideoUpdateStreamInput;
@class AWSKinesisVideoUpdateStreamOutput;

/**
 
 */
@interface AWSKinesisVideoCreateStreamInput : AWSRequest


/**
 <p>The number of hours that you want to retain the data in the stream. Kinesis Video Streams retains the data in a data store that is associated with the stream.</p><p>The default value is 0, indicating that the stream does not persist data.</p><p>When the <code>DataRetentionInHours</code> value is 0, consumers can still consume the fragments that remain in the service host buffer, which has a retention time limit of 5 minutes and a retention memory limit of 200 MB. Fragments are removed from the buffer when either limit is reached.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dataRetentionInHours;

/**
 <p>The name of the device that is writing to the stream. </p><note><p>In the current implementation, Kinesis Video Streams does not use this name.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>The ID of the AWS Key Management Service (AWS KMS) key that you want Kinesis Video Streams to use to encrypt stream data.</p><p>If no key ID is specified, the default, Kinesis Video-managed key (<code>aws/kinesisvideo</code>) is used.</p><p> For more information, see <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters">DescribeKey</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The media type of the stream. Consumers of the stream can use this information when processing the stream. For more information about media types, see <a href="http://www.iana.org/assignments/media-types/media-types.xhtml">Media Types</a>. If you choose to specify the <code>MediaType</code>, see <a href="https://tools.ietf.org/html/rfc6838#section-4.2">Naming Requirements</a> for guidelines.</p><p>This parameter is optional; the default value is <code>null</code> (or empty in JSON).</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaType;

/**
 <p>A name for the stream that you are creating.</p><p>The stream name is an identifier for the stream, and must be unique for each account and region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>A list of tags to associate with the specified stream. Each tag is a key-value pair (the value is optional).</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKinesisVideoCreateStreamOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

@end

/**
 
 */
@interface AWSKinesisVideoDeleteStreamInput : AWSRequest


/**
 <p>Optional: The version of the stream that you want to delete. </p><p>Specify the version as a safeguard to ensure that your are deleting the correct stream. To get the stream version, use the <code>DescribeStream</code> API.</p><p>If not specified, only the <code>CreationTime</code> is checked before deleting the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

/**
 <p>The Amazon Resource Name (ARN) of the stream that you want to delete. </p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

@end

/**
 
 */
@interface AWSKinesisVideoDeleteStreamOutput : AWSModel


@end

/**
 
 */
@interface AWSKinesisVideoDescribeStreamInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoDescribeStreamOutput : AWSModel


/**
 <p>An object that describes the stream.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoStreamInfo * _Nullable streamInfo;

@end

/**
 
 */
@interface AWSKinesisVideoGetDataEndpointInput : AWSRequest


/**
 <p>The name of the API action for which to get an endpoint.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoAPIName APIName;

/**
 <p>The Amazon Resource Name (ARN) of the stream that you want to get the endpoint for. You must specify either this parameter or a <code>StreamName</code> in the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream that you want to get the endpoint for. You must specify either this parameter or a <code>StreamARN</code> in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoGetDataEndpointOutput : AWSModel


/**
 <p>The endpoint value. To read data from the stream or to write data to it, specify this endpoint in your application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataEndpoint;

@end

/**
 
 */
@interface AWSKinesisVideoListStreamsInput : AWSRequest


/**
 <p>The maximum number of streams to return in the response. The default is 10,000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If you specify this parameter, when the result of a <code>ListStreams</code> operation is truncated, the call returns the <code>NextToken</code> in the response. To get another batch of streams, provide this token in your next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Optional: Returns only streams that satisfy a specific condition. Currently, you can specify only the prefix of a stream name as a condition. </p>
 */
@property (nonatomic, strong) AWSKinesisVideoStreamNameCondition * _Nullable streamNameCondition;

@end

/**
 
 */
@interface AWSKinesisVideoListStreamsOutput : AWSModel


/**
 <p>If the response is truncated, the call returns this element with a token. To get the next batch of streams, use this token in your next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of <code>StreamInfo</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisVideoStreamInfo *> * _Nullable streamInfoList;

@end

/**
 
 */
@interface AWSKinesisVideoListTagsForStreamInput : AWSRequest


/**
 <p>If you specify this parameter and the result of a <code>ListTagsForStream</code> call is truncated, the response includes a token that you can use in the next request to fetch the next batch of tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Name (ARN) of the stream that you want to list tags for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream that you want to list tags for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoListTagsForStreamOutput : AWSModel


/**
 <p>If you specify this parameter and the result of a <code>ListTags</code> call is truncated, the response includes a token that you can use in the next request to fetch the next set of tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A map of tag keys and values associated with the specified stream.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>An object describing a Kinesis video stream.</p>
 */
@interface AWSKinesisVideoStreamInfo : AWSModel


/**
 <p>A time stamp that indicates when the stream was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>How long the stream retains data, in hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dataRetentionInHours;

/**
 <p>The name of the device that is associated with the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>The ID of the AWS Key Management Service (AWS KMS) key that Kinesis Video Streams uses to encrypt data on the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The <code>MediaType</code> of the stream. </p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaType;

/**
 <p>The status of the stream.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoStatus status;

/**
 <p>The Amazon Resource Name (ARN) of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>The version of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Specifies the condition that streams must satisfy to be returned when you list streams (see the <code>ListStreams</code> API). A condition has a comparison operation and a value. Currently, you can specify only the <code>BEGINS_WITH</code> operator, which finds streams whose names start with a given prefix. </p>
 */
@interface AWSKinesisVideoStreamNameCondition : AWSModel


/**
 <p>A comparison operator. Currently, you can specify only the <code>BEGINS_WITH</code> operator, which finds streams whose names start with a given prefix.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoComparisonOperator comparisonOperator;

/**
 <p>A value to compare.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comparisonValue;

@end

/**
 
 */
@interface AWSKinesisVideoTagStreamInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource that you want to add the tag or tags to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream that you want to add the tag or tags to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>A list of tags to associate with the specified stream. Each tag is a key-value pair (the value is optional).</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKinesisVideoTagStreamOutput : AWSModel


@end

/**
 
 */
@interface AWSKinesisVideoUntagStreamInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the stream that you want to remove tags from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream that you want to remove tags from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>A list of the keys of the tags that you want to remove.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeyList;

@end

/**
 
 */
@interface AWSKinesisVideoUntagStreamOutput : AWSModel


@end

/**
 
 */
@interface AWSKinesisVideoUpdateDataRetentionInput : AWSRequest


/**
 <p>The version of the stream whose retention period you want to change. To get the version, call either the <code>DescribeStream</code> or the <code>ListStreams</code> API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

/**
 <p>The retention period, in hours. The value you specify replaces the current value. The maximum value for this parameter is 87600 (ten years).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dataRetentionChangeInHours;

/**
 <p>Indicates whether you want to increase or decrease the retention period.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoUpdateDataRetentionOperation operation;

/**
 <p>The Amazon Resource Name (ARN) of the stream whose retention period you want to change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream whose retention period you want to change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoUpdateDataRetentionOutput : AWSModel


@end

/**
 
 */
@interface AWSKinesisVideoUpdateStreamInput : AWSRequest


/**
 <p>The version of the stream whose metadata you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

/**
 <p>The name of the device that is writing to the stream. </p><note><p> In the current implementation, Kinesis Video Streams does not use this name. </p></note>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>The stream's media type. Use <code>MediaType</code> to specify the type of content that the stream contains to the consumers of the stream. For more information about media types, see <a href="http://www.iana.org/assignments/media-types/media-types.xhtml">Media Types</a>. If you choose to specify the <code>MediaType</code>, see <a href="https://tools.ietf.org/html/rfc6838#section-4.2">Naming Requirements</a>.</p><p>To play video on the console, you must specify the correct video type. For example, if the video in the stream is H.264, specify <code>video/h264</code> as the <code>MediaType</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaType;

/**
 <p>The ARN of the stream whose metadata you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream whose metadata you want to update.</p><p>The stream name is an identifier for the stream, and must be unique for each account and region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoUpdateStreamOutput : AWSModel


@end

NS_ASSUME_NONNULL_END
