//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    AWSKinesisVideoErrorAccessDenied,
    AWSKinesisVideoErrorAccountChannelLimitExceeded,
    AWSKinesisVideoErrorAccountStreamLimitExceeded,
    AWSKinesisVideoErrorClientLimitExceeded,
    AWSKinesisVideoErrorDeviceStreamLimitExceeded,
    AWSKinesisVideoErrorInvalidArgument,
    AWSKinesisVideoErrorInvalidDevice,
    AWSKinesisVideoErrorInvalidResourceFormat,
    AWSKinesisVideoErrorNoDataRetention,
    AWSKinesisVideoErrorNotAuthorized,
    AWSKinesisVideoErrorResourceInUse,
    AWSKinesisVideoErrorResourceNotFound,
    AWSKinesisVideoErrorStreamEdgeConfigurationNotFound,
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
    AWSKinesisVideoAPINameGetDashStreamingSessionUrl,
    AWSKinesisVideoAPINameGetClip,
    AWSKinesisVideoAPINameGetImages,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoChannelProtocol) {
    AWSKinesisVideoChannelProtocolUnknown,
    AWSKinesisVideoChannelProtocolWss,
    AWSKinesisVideoChannelProtocolHttps,
    AWSKinesisVideoChannelProtocolWebrtc,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoChannelRole) {
    AWSKinesisVideoChannelRoleUnknown,
    AWSKinesisVideoChannelRoleMaster,
    AWSKinesisVideoChannelRoleViewer,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoChannelType) {
    AWSKinesisVideoChannelTypeUnknown,
    AWSKinesisVideoChannelTypeSingleMaster,
    AWSKinesisVideoChannelTypeFullMesh,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoComparisonOperator) {
    AWSKinesisVideoComparisonOperatorUnknown,
    AWSKinesisVideoComparisonOperatorBeginsWith,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoConfigurationStatus) {
    AWSKinesisVideoConfigurationStatusUnknown,
    AWSKinesisVideoConfigurationStatusEnabled,
    AWSKinesisVideoConfigurationStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoFormat) {
    AWSKinesisVideoFormatUnknown,
    AWSKinesisVideoFormatJpeg,
    AWSKinesisVideoFormatPng,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoFormatConfigKey) {
    AWSKinesisVideoFormatConfigKeyUnknown,
    AWSKinesisVideoFormatConfigKeyJPEGQuality,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoImageSelectorType) {
    AWSKinesisVideoImageSelectorTypeUnknown,
    AWSKinesisVideoImageSelectorTypeServerTimestamp,
    AWSKinesisVideoImageSelectorTypeProducerTimestamp,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoMediaStorageConfigurationStatus) {
    AWSKinesisVideoMediaStorageConfigurationStatusUnknown,
    AWSKinesisVideoMediaStorageConfigurationStatusEnabled,
    AWSKinesisVideoMediaStorageConfigurationStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoMediaUriType) {
    AWSKinesisVideoMediaUriTypeUnknown,
    AWSKinesisVideoMediaUriTypeRtspUri,
    AWSKinesisVideoMediaUriTypeFileUri,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoRecorderStatus) {
    AWSKinesisVideoRecorderStatusUnknown,
    AWSKinesisVideoRecorderStatusSuccess,
    AWSKinesisVideoRecorderStatusUserError,
    AWSKinesisVideoRecorderStatusSystemError,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoStatus) {
    AWSKinesisVideoStatusUnknown,
    AWSKinesisVideoStatusCreating,
    AWSKinesisVideoStatusActive,
    AWSKinesisVideoStatusUpdating,
    AWSKinesisVideoStatusDeleting,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoStrategyOnFullSize) {
    AWSKinesisVideoStrategyOnFullSizeUnknown,
    AWSKinesisVideoStrategyOnFullSizeDeleteOldestMedia,
    AWSKinesisVideoStrategyOnFullSizeDenyNewMedia,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoSyncStatus) {
    AWSKinesisVideoSyncStatusUnknown,
    AWSKinesisVideoSyncStatusSyncing,
    AWSKinesisVideoSyncStatusAcknowledged,
    AWSKinesisVideoSyncStatusInSync,
    AWSKinesisVideoSyncStatusSyncFailed,
    AWSKinesisVideoSyncStatusDeleting,
    AWSKinesisVideoSyncStatusDeleteFailed,
    AWSKinesisVideoSyncStatusDeletingAcknowledged,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoUpdateDataRetentionOperation) {
    AWSKinesisVideoUpdateDataRetentionOperationUnknown,
    AWSKinesisVideoUpdateDataRetentionOperationIncreaseDataRetention,
    AWSKinesisVideoUpdateDataRetentionOperationDecreaseDataRetention,
};

typedef NS_ENUM(NSInteger, AWSKinesisVideoUploaderStatus) {
    AWSKinesisVideoUploaderStatusUnknown,
    AWSKinesisVideoUploaderStatusSuccess,
    AWSKinesisVideoUploaderStatusUserError,
    AWSKinesisVideoUploaderStatusSystemError,
};

@class AWSKinesisVideoChannelInfo;
@class AWSKinesisVideoChannelNameCondition;
@class AWSKinesisVideoCreateSignalingChannelInput;
@class AWSKinesisVideoCreateSignalingChannelOutput;
@class AWSKinesisVideoCreateStreamInput;
@class AWSKinesisVideoCreateStreamOutput;
@class AWSKinesisVideoDeleteEdgeConfigurationInput;
@class AWSKinesisVideoDeleteEdgeConfigurationOutput;
@class AWSKinesisVideoDeleteSignalingChannelInput;
@class AWSKinesisVideoDeleteSignalingChannelOutput;
@class AWSKinesisVideoDeleteStreamInput;
@class AWSKinesisVideoDeleteStreamOutput;
@class AWSKinesisVideoDeletionConfig;
@class AWSKinesisVideoDescribeEdgeConfigurationInput;
@class AWSKinesisVideoDescribeEdgeConfigurationOutput;
@class AWSKinesisVideoDescribeImageGenerationConfigurationInput;
@class AWSKinesisVideoDescribeImageGenerationConfigurationOutput;
@class AWSKinesisVideoDescribeMappedResourceConfigurationInput;
@class AWSKinesisVideoDescribeMappedResourceConfigurationOutput;
@class AWSKinesisVideoDescribeMediaStorageConfigurationInput;
@class AWSKinesisVideoDescribeMediaStorageConfigurationOutput;
@class AWSKinesisVideoDescribeNotificationConfigurationInput;
@class AWSKinesisVideoDescribeNotificationConfigurationOutput;
@class AWSKinesisVideoDescribeSignalingChannelInput;
@class AWSKinesisVideoDescribeSignalingChannelOutput;
@class AWSKinesisVideoDescribeStreamInput;
@class AWSKinesisVideoDescribeStreamOutput;
@class AWSKinesisVideoEdgeAgentStatus;
@class AWSKinesisVideoEdgeConfig;
@class AWSKinesisVideoGetDataEndpointInput;
@class AWSKinesisVideoGetDataEndpointOutput;
@class AWSKinesisVideoGetSignalingChannelEndpointInput;
@class AWSKinesisVideoGetSignalingChannelEndpointOutput;
@class AWSKinesisVideoImageGenerationConfiguration;
@class AWSKinesisVideoImageGenerationDestinationConfig;
@class AWSKinesisVideoLastRecorderStatus;
@class AWSKinesisVideoLastUploaderStatus;
@class AWSKinesisVideoListEdgeAgentConfigurationsEdgeConfig;
@class AWSKinesisVideoListEdgeAgentConfigurationsInput;
@class AWSKinesisVideoListEdgeAgentConfigurationsOutput;
@class AWSKinesisVideoListSignalingChannelsInput;
@class AWSKinesisVideoListSignalingChannelsOutput;
@class AWSKinesisVideoListStreamsInput;
@class AWSKinesisVideoListStreamsOutput;
@class AWSKinesisVideoListTagsForResourceInput;
@class AWSKinesisVideoListTagsForResourceOutput;
@class AWSKinesisVideoListTagsForStreamInput;
@class AWSKinesisVideoListTagsForStreamOutput;
@class AWSKinesisVideoLocalSizeConfig;
@class AWSKinesisVideoMappedResourceConfigurationListItem;
@class AWSKinesisVideoMediaSourceConfig;
@class AWSKinesisVideoMediaStorageConfiguration;
@class AWSKinesisVideoNotificationConfiguration;
@class AWSKinesisVideoNotificationDestinationConfig;
@class AWSKinesisVideoRecorderConfig;
@class AWSKinesisVideoResourceEndpointListItem;
@class AWSKinesisVideoScheduleConfig;
@class AWSKinesisVideoSingleMasterChannelEndpointConfiguration;
@class AWSKinesisVideoSingleMasterConfiguration;
@class AWSKinesisVideoStartEdgeConfigurationUpdateInput;
@class AWSKinesisVideoStartEdgeConfigurationUpdateOutput;
@class AWSKinesisVideoStreamInfo;
@class AWSKinesisVideoStreamNameCondition;
@class AWSKinesisVideoTag;
@class AWSKinesisVideoTagResourceInput;
@class AWSKinesisVideoTagResourceOutput;
@class AWSKinesisVideoTagStreamInput;
@class AWSKinesisVideoTagStreamOutput;
@class AWSKinesisVideoUntagResourceInput;
@class AWSKinesisVideoUntagResourceOutput;
@class AWSKinesisVideoUntagStreamInput;
@class AWSKinesisVideoUntagStreamOutput;
@class AWSKinesisVideoUpdateDataRetentionInput;
@class AWSKinesisVideoUpdateDataRetentionOutput;
@class AWSKinesisVideoUpdateImageGenerationConfigurationInput;
@class AWSKinesisVideoUpdateImageGenerationConfigurationOutput;
@class AWSKinesisVideoUpdateMediaStorageConfigurationInput;
@class AWSKinesisVideoUpdateMediaStorageConfigurationOutput;
@class AWSKinesisVideoUpdateNotificationConfigurationInput;
@class AWSKinesisVideoUpdateNotificationConfigurationOutput;
@class AWSKinesisVideoUpdateSignalingChannelInput;
@class AWSKinesisVideoUpdateSignalingChannelOutput;
@class AWSKinesisVideoUpdateStreamInput;
@class AWSKinesisVideoUpdateStreamOutput;
@class AWSKinesisVideoUploaderConfig;

/**
 <p>A structure that encapsulates a signaling channel's metadata and properties.</p>
 */
@interface AWSKinesisVideoChannelInfo : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the signaling channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelARN;

/**
 <p>The name of the signaling channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelName;

/**
 <p>Current status of the signaling channel.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoStatus channelStatus;

/**
 <p>The type of the signaling channel.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoChannelType channelType;

/**
 <p>The time at which the signaling channel was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>A structure that contains the configuration for the <code>SINGLE_MASTER</code> channel type.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoSingleMasterConfiguration * _Nullable singleMasterConfiguration;

/**
 <p>The current version of the signaling channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>An optional input parameter for the <code>ListSignalingChannels</code> API. When this parameter is specified while invoking <code>ListSignalingChannels</code>, the API returns only the channels that satisfy a condition specified in <code>ChannelNameCondition</code>.</p>
 */
@interface AWSKinesisVideoChannelNameCondition : AWSModel


/**
 <p>A comparison operator. Currently, you can only specify the <code>BEGINS_WITH</code> operator, which finds signaling channels whose names begin with a given prefix.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoComparisonOperator comparisonOperator;

/**
 <p>A value to compare.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comparisonValue;

@end

/**
 
 */
@interface AWSKinesisVideoCreateSignalingChannelInput : AWSRequest


/**
 <p>A name for the signaling channel that you are creating. It must be unique for each Amazon Web Services account and Amazon Web Services Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelName;

/**
 <p>A type of the signaling channel that you are creating. Currently, <code>SINGLE_MASTER</code> is the only supported channel type. </p>
 */
@property (nonatomic, assign) AWSKinesisVideoChannelType channelType;

/**
 <p>A structure containing the configuration for the <code>SINGLE_MASTER</code> channel type. </p>
 */
@property (nonatomic, strong) AWSKinesisVideoSingleMasterConfiguration * _Nullable singleMasterConfiguration;

/**
 <p>A set of tags (key-value pairs) that you want to associate with this channel.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisVideoTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKinesisVideoCreateSignalingChannelOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the created channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelARN;

@end

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
 <p>The ID of the Key Management Service (KMS) key that you want Kinesis Video Streams to use to encrypt stream data.</p><p>If no key ID is specified, the default, Kinesis Video-managed key (<code>Amazon Web Services/kinesisvideo</code>) is used.</p><p> For more information, see <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters">DescribeKey</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The media type of the stream. Consumers of the stream can use this information when processing the stream. For more information about media types, see <a href="http://www.iana.org/assignments/media-types/media-types.xhtml">Media Types</a>. If you choose to specify the <code>MediaType</code>, see <a href="https://tools.ietf.org/html/rfc6838#section-4.2">Naming Requirements</a> for guidelines.</p><p>Example valid values include "video/h264" and "video/h264,audio/aac".</p><p>This parameter is optional; the default value is <code>null</code> (or empty in JSON).</p>
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
@interface AWSKinesisVideoDeleteEdgeConfigurationInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the stream. Specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream from which to delete the edge configuration. Specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoDeleteEdgeConfigurationOutput : AWSModel


@end

/**
 
 */
@interface AWSKinesisVideoDeleteSignalingChannelInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the signaling channel that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelARN;

/**
 <p>The current version of the signaling channel that you want to delete. You can obtain the current version by invoking the <code>DescribeSignalingChannel</code> or <code>ListSignalingChannels</code> API operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

@end

/**
 
 */
@interface AWSKinesisVideoDeleteSignalingChannelOutput : AWSModel


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
 <p>The configuration details required to delete the connection of the stream from the Edge Agent.</p>
 */
@interface AWSKinesisVideoDeletionConfig : AWSModel


/**
 <p>The <code>boolean</code> value used to indicate whether or not you want to mark the media for deletion, once it has been uploaded to the Kinesis Video Stream cloud. The media files can be deleted if any of the deletion configuration values are set to <code>true</code>, such as when the limit for the <code>EdgeRetentionInHours</code>, or the <code>MaxLocalMediaSizeInMB</code>, has been reached. </p><p>Since the default value is set to <code>true</code>, configure the uploader schedule such that the media files are not being deleted before they are initially uploaded to the Amazon Web Services cloud.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteAfterUpload;

/**
 <p>The number of hours that you want to retain the data in the stream on the Edge Agent. The default value of the retention time is 720 hours, which translates to 30 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable edgeRetentionInHours;

/**
 <p>The value of the local size required in order to delete the edge configuration.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoLocalSizeConfig * _Nullable localSizeConfig;

@end

/**
 
 */
@interface AWSKinesisVideoDescribeEdgeConfigurationInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the stream. Specify either the <code>StreamName</code>or the <code>StreamARN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream whose edge configuration you want to update. Specify either the <code>StreamName</code> or the <code>StreamARN</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoDescribeEdgeConfigurationOutput : AWSModel


/**
 <p>The timestamp at which a stream’s edge configuration was first created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>An object that contains the latest status details for an edge agent's recorder and uploader jobs. Use this information to determine the current health of an edge agent.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoEdgeAgentStatus * _Nullable edgeAgentStatus;

/**
 <p>A description of the stream's edge configuration that will be used to sync with the Edge Agent IoT Greengrass component. The Edge Agent component will run on an IoT Hub Device setup at your premise.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoEdgeConfig * _Nullable edgeConfig;

/**
 <p>A description of the generated failure status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failedStatusDetails;

/**
 <p>The timestamp at which a stream’s edge configuration was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The Amazon Resource Name (ARN) of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream from which the edge configuration was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>The latest status of the edge configuration update.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoSyncStatus syncStatus;

@end

/**
 
 */
@interface AWSKinesisVideoDescribeImageGenerationConfigurationInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the Kinesis video stream from which to retrieve the image generation configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream from which to retrieve the image generation configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoDescribeImageGenerationConfigurationOutput : AWSModel


/**
 <p>The structure that contains the information required for the Kinesis video stream (KVS) images delivery. If this structure is null, the configuration will be deleted from the stream.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoImageGenerationConfiguration * _Nullable imageGenerationConfiguration;

@end

/**
 
 */
@interface AWSKinesisVideoDescribeMappedResourceConfigurationInput : AWSRequest


/**
 <p>The maximum number of results to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to provide in your next request, to get another batch of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

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
@interface AWSKinesisVideoDescribeMappedResourceConfigurationOutput : AWSModel


/**
 <p>A structure that encapsulates, or contains, the media storage configuration properties.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisVideoMappedResourceConfigurationListItem *> * _Nullable mappedResourceConfigurationList;

/**
 <p>The token that was used in the <code>NextToken</code>request to fetch the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKinesisVideoDescribeMediaStorageConfigurationInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelARN;

/**
 <p>The name of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelName;

@end

/**
 
 */
@interface AWSKinesisVideoDescribeMediaStorageConfigurationOutput : AWSModel


/**
 <p>A structure that encapsulates, or contains, the media storage configuration properties.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoMediaStorageConfiguration * _Nullable mediaStorageConfiguration;

@end

/**
 
 */
@interface AWSKinesisVideoDescribeNotificationConfigurationInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the Kinesis video stream from where you want to retrieve the notification configuration. You must specify either the <code>StreamName</code> or the StreamARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream from which to retrieve the notification configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoDescribeNotificationConfigurationOutput : AWSModel


/**
 <p>The structure that contains the information required for notifications. If the structure is null, the configuration will be deleted from the stream.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoNotificationConfiguration * _Nullable notificationConfiguration;

@end

/**
 
 */
@interface AWSKinesisVideoDescribeSignalingChannelInput : AWSRequest


/**
 <p>The ARN of the signaling channel that you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelARN;

/**
 <p>The name of the signaling channel that you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelName;

@end

/**
 
 */
@interface AWSKinesisVideoDescribeSignalingChannelOutput : AWSModel


/**
 <p>A structure that encapsulates the specified signaling channel's metadata and properties.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoChannelInfo * _Nullable channelInfo;

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
 <p>An object that contains the latest status details for an edge agent's recorder and uploader jobs. Use this information to determine the current health of an edge agent.</p>
 */
@interface AWSKinesisVideoEdgeAgentStatus : AWSModel


/**
 <p>The latest status of a stream’s edge recording job.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoLastRecorderStatus * _Nullable lastRecorderStatus;

/**
 <p>The latest status of a stream’s edge to cloud uploader job.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoLastUploaderStatus * _Nullable lastUploaderStatus;

@end

/**
 <p>A description of the stream's edge configuration that will be used to sync with the Edge Agent IoT Greengrass component. The Edge Agent component will run on an IoT Hub Device setup at your premise.</p>
 Required parameters: [HubDeviceArn, RecorderConfig]
 */
@interface AWSKinesisVideoEdgeConfig : AWSModel


/**
 <p>The deletion configuration is made up of the retention time (<code>EdgeRetentionInHours</code>) and local size configuration (<code>LocalSizeConfig</code>) details that are used to make the deletion.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoDeletionConfig * _Nullable deletionConfig;

/**
 <p>The "<b>Internet of Things (IoT) Thing</b>" Arn of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hubDeviceArn;

/**
 <p>The recorder configuration consists of the local <code>MediaSourceConfig</code> details, that are used as credentials to access the local media files streamed on the camera. </p>
 */
@property (nonatomic, strong) AWSKinesisVideoRecorderConfig * _Nullable recorderConfig;

/**
 <p>The uploader configuration contains the <code>ScheduleExpression</code> details that are used to schedule upload jobs for the recorded media files from the Edge Agent to a Kinesis Video Stream.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoUploaderConfig * _Nullable uploaderConfig;

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
@interface AWSKinesisVideoGetSignalingChannelEndpointInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the signalling channel for which you want to get an endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelARN;

/**
 <p>A structure containing the endpoint configuration for the <code>SINGLE_MASTER</code> channel type.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoSingleMasterChannelEndpointConfiguration * _Nullable singleMasterChannelEndpointConfiguration;

@end

/**
 
 */
@interface AWSKinesisVideoGetSignalingChannelEndpointOutput : AWSModel


/**
 <p>A list of endpoints for the specified signaling channel.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisVideoResourceEndpointListItem *> * _Nullable resourceEndpointList;

@end

/**
 <p>The structure that contains the information required for the KVS images delivery. If null, the configuration will be deleted from the stream.</p>
 Required parameters: [Status, ImageSelectorType, DestinationConfig, SamplingInterval, Format]
 */
@interface AWSKinesisVideoImageGenerationConfiguration : AWSModel


/**
 <p>The structure that contains the information required to deliver images to a customer.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoImageGenerationDestinationConfig * _Nullable destinationConfig;

/**
 <p>The accepted image format.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoFormat format;

/**
 <p>The list of a key-value pair structure that contains extra parameters that can be applied when the image is generated. The <code>FormatConfig</code> key is the <code>JPEGQuality</code>, which indicates the JPEG quality key to be used to generate the image. The <code>FormatConfig</code> value accepts ints from 1 to 100. If the value is 1, the image will be generated with less quality and the best compression. If the value is 100, the image will be generated with the best quality and less compression. If no value is provided, the default value of the <code>JPEGQuality</code> key will be set to 80.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable formatConfig;

/**
 <p>The height of the output image that is used in conjunction with the <code>WidthPixels</code> parameter. When both <code>HeightPixels</code> and <code>WidthPixels</code> parameters are provided, the image will be stretched to fit the specified aspect ratio. If only the <code>HeightPixels</code> parameter is provided, its original aspect ratio will be used to calculate the <code>WidthPixels</code> ratio. If neither parameter is provided, the original image size will be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable heightPixels;

/**
 <p>The origin of the Server or Producer timestamps to use to generate the images.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoImageSelectorType imageSelectorType;

/**
 <p>The time interval in milliseconds (ms) at which the images need to be generated from the stream. The minimum value that can be provided is 200 ms. If the timestamp range is less than the sampling interval, the Image from the <code>StartTimestamp</code> will be returned if available. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable samplingInterval;

/**
 <p>Indicates whether the <code>ContinuousImageGenerationConfigurations</code> API is enabled or disabled.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoConfigurationStatus status;

/**
 <p>The width of the output image that is used in conjunction with the <code>HeightPixels</code> parameter. When both <code>WidthPixels</code> and <code>HeightPixels</code> parameters are provided, the image will be stretched to fit the specified aspect ratio. If only the <code>WidthPixels</code> parameter is provided, its original aspect ratio will be used to calculate the <code>HeightPixels</code> ratio. If neither parameter is provided, the original image size will be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable widthPixels;

@end

/**
 <p>The structure that contains the information required to deliver images to a customer.</p>
 Required parameters: [Uri, DestinationRegion]
 */
@interface AWSKinesisVideoImageGenerationDestinationConfig : AWSModel


/**
 <p>The Amazon Web Services Region of the S3 bucket where images will be delivered. This <code>DestinationRegion</code> must match the Region where the stream is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationRegion;

/**
 <p>The Uniform Resource Identifier (URI) that identifies where the images will be delivered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uri;

@end

/**
 <p>The latest status of a stream's edge recording job.</p>
 */
@interface AWSKinesisVideoLastRecorderStatus : AWSModel


/**
 <p>A description of a recorder job’s latest status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobStatusDetails;

/**
 <p>The timestamp at which the recorder job was last executed and media stored to local disk.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastCollectedTime;

/**
 <p>The timestamp at which the recorder status was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The status of the latest recorder job.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoRecorderStatus recorderStatus;

@end

/**
 <p>The latest status of a stream’s edge to cloud uploader job.</p>
 */
@interface AWSKinesisVideoLastUploaderStatus : AWSModel


/**
 <p>A description of an uploader job’s latest status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobStatusDetails;

/**
 <p>The timestamp at which the uploader job was last executed and media collected to the cloud.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastCollectedTime;

/**
 <p>The timestamp at which the uploader status was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The status of the latest uploader job.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoUploaderStatus uploaderStatus;

@end

/**
 <p>A description of a single stream's edge configuration.</p>
 */
@interface AWSKinesisVideoListEdgeAgentConfigurationsEdgeConfig : AWSModel


/**
 <p>The timestamp when the stream first created the edge config.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>A description of the stream's edge configuration that will be used to sync with the Edge Agent IoT Greengrass component. The Edge Agent component will run on an IoT Hub Device setup at your premise.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoEdgeConfig * _Nullable edgeConfig;

/**
 <p>A description of the generated failure status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failedStatusDetails;

/**
 <p>The timestamp when the stream last updated the edge config.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The Amazon Resource Name (ARN) of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p>The current sync status of the stream's edge configuration.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoSyncStatus syncStatus;

@end

/**
 
 */
@interface AWSKinesisVideoListEdgeAgentConfigurationsInput : AWSRequest


/**
 <p>The "Internet of Things (IoT) Thing" Arn of the edge agent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hubDeviceArn;

/**
 <p>The maximum number of edge configurations to return in the response. The default is 5.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If you specify this parameter, when the result of a <code>ListEdgeAgentConfigurations</code> operation is truncated, the call returns the <code>NextToken</code> in the response. To get another batch of edge configurations, provide this token in your next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKinesisVideoListEdgeAgentConfigurationsOutput : AWSModel


/**
 <p>A description of a single stream's edge configuration.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisVideoListEdgeAgentConfigurationsEdgeConfig *> * _Nullable edgeConfigs;

/**
 <p>If the response is truncated, the call returns this element with a given token. To get the next batch of edge configurations, use this token in your next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKinesisVideoListSignalingChannelsInput : AWSRequest


/**
 <p>Optional: Returns only the channels that satisfy a specific condition.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoChannelNameCondition * _Nullable channelNameCondition;

/**
 <p>The maximum number of channels to return in the response. The default is 500.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If you specify this parameter, when the result of a <code>ListSignalingChannels</code> operation is truncated, the call returns the <code>NextToken</code> in the response. To get another batch of channels, provide this token in your next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSKinesisVideoListSignalingChannelsOutput : AWSModel


/**
 <p>An array of <code>ChannelInfo</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisVideoChannelInfo *> * _Nullable channelInfoList;

/**
 <p>If the response is truncated, the call returns this element with a token. To get the next batch of streams, use this token in your next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

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
@interface AWSKinesisVideoListTagsForResourceInput : AWSRequest


/**
 <p>If you specify this parameter and the result of a <code>ListTagsForResource</code> call is truncated, the response includes a token that you can use in the next request to fetch the next batch of tags. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Amazon Resource Name (ARN) of the signaling channel for which you want to list tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

@end

/**
 
 */
@interface AWSKinesisVideoListTagsForResourceOutput : AWSModel


/**
 <p>If you specify this parameter and the result of a <code>ListTagsForResource</code> call is truncated, the response includes a token that you can use in the next request to fetch the next set of tags. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A map of tag keys and values associated with the specified signaling channel.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

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
 <p>The configuration details that include the maximum size of the media (<code>MaxLocalMediaSizeInMB</code>) that you want to store for a stream on the Edge Agent, as well as the strategy that should be used (<code>StrategyOnFullSize</code>) when a stream's maximum size has been reached.</p>
 */
@interface AWSKinesisVideoLocalSizeConfig : AWSModel


/**
 <p>The overall maximum size of the media that you want to store for a stream on the Edge Agent. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxLocalMediaSizeInMB;

/**
 <p>The strategy to perform when a stream’s <code>MaxLocalMediaSizeInMB</code> limit is reached.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoStrategyOnFullSize strategyOnFullSize;

@end

/**
 <p>A structure that encapsulates, or contains, the media storage configuration properties.</p>
 */
@interface AWSKinesisVideoMappedResourceConfigurationListItem : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Kinesis Video Stream resource, associated with the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The type of the associated resource for the kinesis video stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>The configuration details that consist of the credentials required (<code>MediaUriSecretArn</code> and <code>MediaUriType</code>) to access the media files that are streamed to the camera.</p>
 Required parameters: [MediaUriSecretArn, MediaUriType]
 */
@interface AWSKinesisVideoMediaSourceConfig : AWSModel


/**
 <p>The Amazon Web Services Secrets Manager ARN for the username and password of the camera, or a local media file location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mediaUriSecretArn;

/**
 <p>The Uniform Resource Identifier (URI) type. The <code>FILE_URI</code> value can be used to stream local media files.</p><note><p>Preview only supports the <code>RTSP_URI</code> media source URI format .</p></note>
 */
@property (nonatomic, assign) AWSKinesisVideoMediaUriType mediaUriType;

@end

/**
 <p>A structure that encapsulates, or contains, the media storage configuration properties.</p><ul><li><p>If <code>StorageStatus</code> is enabled, the data will be stored in the <code>StreamARN</code> provided. In order for WebRTC Ingestion to work, the stream must have data retention enabled.</p></li><li><p>If <code>StorageStatus</code> is disabled, no data will be stored, and the <code>StreamARN</code> parameter will not be needed. </p></li></ul>
 Required parameters: [Status]
 */
@interface AWSKinesisVideoMediaStorageConfiguration : AWSModel


/**
 <p>The status of the media storage configuration.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoMediaStorageConfigurationStatus status;

/**
 <p>The Amazon Resource Name (ARN) of the stream. </p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

@end

/**
 <p>The structure that contains the notification information for the KVS images delivery. If this parameter is null, the configuration will be deleted from the stream.</p>
 Required parameters: [Status, DestinationConfig]
 */
@interface AWSKinesisVideoNotificationConfiguration : AWSModel


/**
 <p>The destination information required to deliver a notification to a customer.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoNotificationDestinationConfig * _Nullable destinationConfig;

/**
 <p>Indicates if a notification configuration is enabled or disabled.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoConfigurationStatus status;

@end

/**
 <p>The structure that contains the information required to deliver a notification to a customer.</p>
 Required parameters: [Uri]
 */
@interface AWSKinesisVideoNotificationDestinationConfig : AWSModel


/**
 <p>The Uniform Resource Identifier (URI) that identifies where the images will be delivered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uri;

@end

/**
 <p>The recorder configuration consists of the local <code>MediaSourceConfig</code> details that are used as credentials to accesss the local media files streamed on the camera. </p>
 Required parameters: [MediaSourceConfig]
 */
@interface AWSKinesisVideoRecorderConfig : AWSModel


/**
 <p>The configuration details that consist of the credentials required (<code>MediaUriSecretArn</code> and <code>MediaUriType</code>) to access the media files streamed to the camera. </p>
 */
@property (nonatomic, strong) AWSKinesisVideoMediaSourceConfig * _Nullable mediaSourceConfig;

/**
 <p>The configuration that consists of the <code>ScheduleExpression</code> and the <code>DurationInMinutes</code> details that specify the scheduling to record from a camera, or local media file, onto the Edge Agent. If the <code>ScheduleExpression</code> attribute is not provided, then the Edge Agent will always be set to recording mode.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoScheduleConfig * _Nullable scheduleConfig;

@end

/**
 <p>An object that describes the endpoint of the signaling channel returned by the <code>GetSignalingChannelEndpoint</code> API.</p><p>The media server endpoint will correspond to the <code>WEBRTC</code> Protocol.</p>
 */
@interface AWSKinesisVideoResourceEndpointListItem : AWSModel


/**
 <p>The protocol of the signaling channel returned by the <code>GetSignalingChannelEndpoint</code> API.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoChannelProtocol protocols;

/**
 <p>The endpoint of the signaling channel returned by the <code>GetSignalingChannelEndpoint</code> API.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceEndpoint;

@end

/**
 <p>This API enables you to specify the duration that the camera, or local media file, should record onto the Edge Agent. The <code>ScheduleConfig</code> consists of the <code>ScheduleExpression</code> and the <code>DurationInMinutes</code> attributes. </p><p>If the <code>ScheduleConfig</code> is not provided in the <code>RecorderConfig</code>, then the Edge Agent will always be set to recording mode.</p><p>If the <code>ScheduleConfig</code> is not provided in the <code>UploaderConfig</code>, then the Edge Agent will upload at regular intervals (every 1 hour).</p>
 Required parameters: [ScheduleExpression, DurationInSeconds]
 */
@interface AWSKinesisVideoScheduleConfig : AWSModel


/**
 <p>The total duration to record the media. If the <code>ScheduleExpression</code> attribute is provided, then the <code>DurationInSeconds</code> attribute should also be specified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInSeconds;

/**
 <p>The Quartz cron expression that takes care of scheduling jobs to record from the camera, or local media file, onto the Edge Agent. If the <code>ScheduleExpression</code> is not provided for the <code>RecorderConfig</code>, then the Edge Agent will always be set to recording mode.</p><p>For more information about Quartz, refer to the <a href="http://www.quartz-scheduler.org/documentation/quartz-2.3.0/tutorials/crontrigger.html"><i>Cron Trigger Tutorial</i></a> page to understand the valid expressions and its use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduleExpression;

@end

/**
 <p>An object that contains the endpoint configuration for the <code>SINGLE_MASTER</code> channel type. </p>
 */
@interface AWSKinesisVideoSingleMasterChannelEndpointConfiguration : AWSModel


/**
 <p>This property is used to determine the nature of communication over this <code>SINGLE_MASTER</code> signaling channel. If <code>WSS</code> is specified, this API returns a websocket endpoint. If <code>HTTPS</code> is specified, this API returns an <code>HTTPS</code> endpoint.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable protocols;

/**
 <p>This property is used to determine messaging permissions in this <code>SINGLE_MASTER</code> signaling channel. If <code>MASTER</code> is specified, this API returns an endpoint that a client can use to receive offers from and send answers to any of the viewers on this signaling channel. If <code>VIEWER</code> is specified, this API returns an endpoint that a client can use only to send offers to another <code>MASTER</code> client on this signaling channel. </p>
 */
@property (nonatomic, assign) AWSKinesisVideoChannelRole role;

@end

/**
 <p>A structure that contains the configuration for the <code>SINGLE_MASTER</code> channel type.</p>
 */
@interface AWSKinesisVideoSingleMasterConfiguration : AWSModel


/**
 <p>The period of time a signaling channel retains undelivered messages before they are discarded.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable messageTtlSeconds;

@end

/**
 
 */
@interface AWSKinesisVideoStartEdgeConfigurationUpdateInput : AWSRequest


/**
 <p>The edge configuration details required to invoke the update process.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoEdgeConfig * _Nullable edgeConfig;

/**
 <p> The Amazon Resource Name (ARN) of the stream. Specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream whose edge configuration you want to update. Specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoStartEdgeConfigurationUpdateOutput : AWSModel


/**
 <p>The timestamp at which a stream’s edge configuration was first created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>A description of the stream's edge configuration that will be used to sync with the Edge Agent IoT Greengrass component. The Edge Agent component will run on an IoT Hub Device setup at your premise.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoEdgeConfig * _Nullable edgeConfig;

/**
 <p>A description of the generated failure status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failedStatusDetails;

/**
 <p>The timestamp at which a stream’s edge configuration was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The Amazon Resource Name (ARN) of the stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream from which the edge configuration was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

/**
 <p> The current sync status of the stream's edge configuration. When you invoke this API, the sync status will be set to the <code>SYNCING</code> state. Use the <code>DescribeEdgeConfiguration</code> API to get the latest status of the edge configuration.</p>
 */
@property (nonatomic, assign) AWSKinesisVideoSyncStatus syncStatus;

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
 <p>The ID of the Key Management Service (KMS) key that Kinesis Video Streams uses to encrypt data on the stream.</p>
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
 <p>A key and value pair that is associated with the specified signaling channel.</p>
 Required parameters: [Key, Value]
 */
@interface AWSKinesisVideoTag : AWSModel


/**
 <p>The key of the tag that is associated with the specified signaling channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the tag that is associated with the specified signaling channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSKinesisVideoTagResourceInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the signaling channel to which you want to add tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>A list of tags to associate with the specified signaling channel. Each tag is a key-value pair.</p>
 */
@property (nonatomic, strong) NSArray<AWSKinesisVideoTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSKinesisVideoTagResourceOutput : AWSModel


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
@interface AWSKinesisVideoUntagResourceInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the signaling channel from which you want to remove tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>A list of the keys of the tags that you want to remove.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeyList;

@end

/**
 
 */
@interface AWSKinesisVideoUntagResourceOutput : AWSModel


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
 <p>The number of hours to adjust the current retention by. The value you specify is added to or subtracted from the current value, depending on the <code>operation</code>.</p><p>The minimum value for data retention is 0 and the maximum value is 87600 (ten years).</p>
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
@interface AWSKinesisVideoUpdateImageGenerationConfigurationInput : AWSRequest


/**
 <p>The structure that contains the information required for the KVS images delivery. If the structure is null, the configuration will be deleted from the stream.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoImageGenerationConfiguration * _Nullable imageGenerationConfiguration;

/**
 <p>The Amazon Resource Name (ARN) of the Kinesis video stream from where you want to update the image generation configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream from which to update the image generation configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoUpdateImageGenerationConfigurationOutput : AWSModel


@end

/**
 
 */
@interface AWSKinesisVideoUpdateMediaStorageConfigurationInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelARN;

/**
 <p>A structure that encapsulates, or contains, the media storage configuration properties.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoMediaStorageConfiguration * _Nullable mediaStorageConfiguration;

@end

/**
 
 */
@interface AWSKinesisVideoUpdateMediaStorageConfigurationOutput : AWSModel


@end

/**
 
 */
@interface AWSKinesisVideoUpdateNotificationConfigurationInput : AWSRequest


/**
 <p>The structure containing the information required for notifications. If the structure is null, the configuration will be deleted from the stream.</p>
 */
@property (nonatomic, strong) AWSKinesisVideoNotificationConfiguration * _Nullable notificationConfiguration;

/**
 <p>The Amazon Resource Name (ARN) of the Kinesis video stream from where you want to update the notification configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamARN;

/**
 <p>The name of the stream from which to update the notification configuration. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 
 */
@interface AWSKinesisVideoUpdateNotificationConfigurationOutput : AWSModel


@end

/**
 
 */
@interface AWSKinesisVideoUpdateSignalingChannelInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the signaling channel that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable channelARN;

/**
 <p>The current version of the signaling channel that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

/**
 <p>The structure containing the configuration for the <code>SINGLE_MASTER</code> type of the signaling channel that you want to update. </p>
 */
@property (nonatomic, strong) AWSKinesisVideoSingleMasterConfiguration * _Nullable singleMasterConfiguration;

@end

/**
 
 */
@interface AWSKinesisVideoUpdateSignalingChannelOutput : AWSModel


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

/**
 <p>The configuration that consists of the <code>ScheduleExpression</code> and the <code>DurationInMinutes</code> details that specify the scheduling to record from a camera, or local media file, onto the Edge Agent. If the <code>ScheduleConfig</code> is not provided in the <code>UploaderConfig</code>, then the Edge Agent will upload at regular intervals (every 1 hour). </p>
 Required parameters: [ScheduleConfig]
 */
@interface AWSKinesisVideoUploaderConfig : AWSModel


/**
 <p>The configuration that consists of the <code>ScheduleExpression</code> and the <code>DurationInMinutes</code> details that specify the scheduling to record from a camera, or local media file, onto the Edge Agent. If the <code>ScheduleConfig</code> is not provided in this <code>UploaderConfig</code>, then the Edge Agent will upload at regular intervals (every 1 hour).</p>
 */
@property (nonatomic, strong) AWSKinesisVideoScheduleConfig * _Nullable scheduleConfig;

@end

NS_ASSUME_NONNULL_END
