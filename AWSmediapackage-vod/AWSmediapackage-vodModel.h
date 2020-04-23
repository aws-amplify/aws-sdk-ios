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

FOUNDATION_EXPORT NSString *const AWSmediapackage-vodErrorDomain;

typedef NS_ENUM(NSInteger, AWSmediapackage-vodErrorType) {
    AWSmediapackage-vodErrorUnknown,
    AWSmediapackage-vodErrorForbidden,
    AWSmediapackage-vodErrorInternalServerError,
    AWSmediapackage-vodErrorNotFound,
    AWSmediapackage-vodErrorServiceUnavailable,
    AWSmediapackage-vodErrorTooManyRequests,
    AWSmediapackage-vodErrorUnprocessableEntity,
};

typedef NS_ENUM(NSInteger, AWSmediapackage-vodAdMarkers) {
    AWSmediapackage-vodAdMarkersUnknown,
    AWSmediapackage-vodAdMarkersNone,
    AWSmediapackage-vodAdMarkersScte35Enhanced,
    AWSmediapackage-vodAdMarkersPassthrough,
};

typedef NS_ENUM(NSInteger, AWSmediapackage-vodEncryptionMethod) {
    AWSmediapackage-vodEncryptionMethodUnknown,
    AWSmediapackage-vodEncryptionMethodAes128,
    AWSmediapackage-vodEncryptionMethodSampleAes,
};

typedef NS_ENUM(NSInteger, AWSmediapackage-vodManifestLayout) {
    AWSmediapackage-vodManifestLayoutUnknown,
    AWSmediapackage-vodManifestLayoutFull,
    AWSmediapackage-vodManifestLayoutCompact,
};

typedef NS_ENUM(NSInteger, AWSmediapackage-vodProfile) {
    AWSmediapackage-vodProfileUnknown,
    AWSmediapackage-vodProfileNone,
    AWSmediapackage-vodProfileHbbtv15,
};

typedef NS_ENUM(NSInteger, AWSmediapackage-vodSegmentTemplateFormat) {
    AWSmediapackage-vodSegmentTemplateFormatUnknown,
    AWSmediapackage-vodSegmentTemplateFormatNumberWithTimeline,
    AWSmediapackage-vodSegmentTemplateFormatTimeWithTimeline,
    AWSmediapackage-vodSegmentTemplateFormatNumberWithDuration,
};

typedef NS_ENUM(NSInteger, AWSmediapackage-vodStreamOrder) {
    AWSmediapackage-vodStreamOrderUnknown,
    AWSmediapackage-vodStreamOrderOriginal,
    AWSmediapackage-vodStreamOrderVideoBitrateAscending,
    AWSmediapackage-vodStreamOrderVideoBitrateDescending,
};

typedef NS_ENUM(NSInteger, AWSmediapackage-vod__PeriodTriggersElement) {
    AWSmediapackage-vod__PeriodTriggersElementUnknown,
    AWSmediapackage-vod__PeriodTriggersElementAds,
};

@class AWSmediapackage-vodAsset;
@class AWSmediapackage-vodAssetCreateParameters;
@class AWSmediapackage-vodAssetList;
@class AWSmediapackage-vodAssetShallow;
@class AWSmediapackage-vodCmafEncryption;
@class AWSmediapackage-vodCmafPackage;
@class AWSmediapackage-vodCreateAssetRequest;
@class AWSmediapackage-vodCreateAssetResponse;
@class AWSmediapackage-vodCreatePackagingConfigurationRequest;
@class AWSmediapackage-vodCreatePackagingConfigurationResponse;
@class AWSmediapackage-vodCreatePackagingGroupRequest;
@class AWSmediapackage-vodCreatePackagingGroupResponse;
@class AWSmediapackage-vodDashEncryption;
@class AWSmediapackage-vodDashManifest;
@class AWSmediapackage-vodDashPackage;
@class AWSmediapackage-vodDeleteAssetRequest;
@class AWSmediapackage-vodDeleteAssetResponse;
@class AWSmediapackage-vodDeletePackagingConfigurationRequest;
@class AWSmediapackage-vodDeletePackagingConfigurationResponse;
@class AWSmediapackage-vodDeletePackagingGroupRequest;
@class AWSmediapackage-vodDeletePackagingGroupResponse;
@class AWSmediapackage-vodDescribeAssetRequest;
@class AWSmediapackage-vodDescribeAssetResponse;
@class AWSmediapackage-vodDescribePackagingConfigurationRequest;
@class AWSmediapackage-vodDescribePackagingConfigurationResponse;
@class AWSmediapackage-vodDescribePackagingGroupRequest;
@class AWSmediapackage-vodDescribePackagingGroupResponse;
@class AWSmediapackage-vodEgressEndpoint;
@class AWSmediapackage-vodHlsEncryption;
@class AWSmediapackage-vodHlsManifest;
@class AWSmediapackage-vodHlsPackage;
@class AWSmediapackage-vodListAssetsRequest;
@class AWSmediapackage-vodListAssetsResponse;
@class AWSmediapackage-vodListPackagingConfigurationsRequest;
@class AWSmediapackage-vodListPackagingConfigurationsResponse;
@class AWSmediapackage-vodListPackagingGroupsRequest;
@class AWSmediapackage-vodListPackagingGroupsResponse;
@class AWSmediapackage-vodListTagsForResourceRequest;
@class AWSmediapackage-vodListTagsForResourceResponse;
@class AWSmediapackage-vodMssEncryption;
@class AWSmediapackage-vodMssManifest;
@class AWSmediapackage-vodMssPackage;
@class AWSmediapackage-vodPackagingConfiguration;
@class AWSmediapackage-vodPackagingConfigurationCreateParameters;
@class AWSmediapackage-vodPackagingConfigurationList;
@class AWSmediapackage-vodPackagingGroup;
@class AWSmediapackage-vodPackagingGroupCreateParameters;
@class AWSmediapackage-vodPackagingGroupList;
@class AWSmediapackage-vodSpekeKeyProvider;
@class AWSmediapackage-vodStreamSelection;
@class AWSmediapackage-vodTagResourceRequest;
@class AWSmediapackage-vodTagsModel;
@class AWSmediapackage-vodUntagResourceRequest;

/**
 A MediaPackage VOD Asset resource.
 */
@interface AWSmediapackage-vodAsset : AWSModel


/**
 The ARN of the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The time the Asset was initially submitted for Ingest.
 */
@property (nonatomic, strong) NSString * _Nullable createdAt;

/**
 The list of egress endpoints available for the Asset.
 */
@property (nonatomic, strong) NSArray<AWSmediapackage-vodEgressEndpoint *> * _Nullable egressEndpoints;

/**
 The unique identifier for the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The ID of the PackagingGroup for the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable packagingGroupId;

/**
 The resource ID to include in SPEKE key requests.
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 ARN of the source object in S3.
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 The IAM role_arn used to access the source S3 bucket.
 */
@property (nonatomic, strong) NSString * _Nullable sourceRoleArn;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Parameters used to create a MediaPackage VOD Asset.
 Required parameters: [SourceArn, Id, PackagingGroupId, SourceRoleArn]
 */
@interface AWSmediapackage-vodAssetCreateParameters : AWSModel


/**
 The unique identifier for the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The ID of the PackagingGroup for the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable packagingGroupId;

/**
 The resource ID to include in SPEKE key requests.
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 ARN of the source object in S3.
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 The IAM role ARN used to access the source S3 bucket.
 */
@property (nonatomic, strong) NSString * _Nullable sourceRoleArn;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 A collection of MediaPackage VOD Asset resources.
 */
@interface AWSmediapackage-vodAssetList : AWSModel


/**
 A list of MediaPackage VOD Asset resources.
 */
@property (nonatomic, strong) NSArray<AWSmediapackage-vodAssetShallow *> * _Nullable assets;

/**
 A token that can be used to resume pagination from the end of the collection.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 A MediaPackage VOD Asset resource.
 */
@interface AWSmediapackage-vodAssetShallow : AWSModel


/**
 The ARN of the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The time the Asset was initially submitted for Ingest.
 */
@property (nonatomic, strong) NSString * _Nullable createdAt;

/**
 The unique identifier for the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The ID of the PackagingGroup for the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable packagingGroupId;

/**
 The resource ID to include in SPEKE key requests.
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 ARN of the source object in S3.
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 The IAM role ARN used to access the source S3 bucket.
 */
@property (nonatomic, strong) NSString * _Nullable sourceRoleArn;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 A CMAF encryption configuration.
 Required parameters: [SpekeKeyProvider]
 */
@interface AWSmediapackage-vodCmafEncryption : AWSModel


/**
 A configuration for accessing an external Secure Packager and Encoder Key Exchange (SPEKE) service that will provide encryption keys.
 */
@property (nonatomic, strong) AWSmediapackage-vodSpekeKeyProvider * _Nullable spekeKeyProvider;

@end

/**
 A CMAF packaging configuration.
 Required parameters: [HlsManifests]
 */
@interface AWSmediapackage-vodCmafPackage : AWSModel


/**
 A CMAF encryption configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodCmafEncryption * _Nullable encryption;

/**
 A list of HLS manifest configurations.
 */
@property (nonatomic, strong) NSArray<AWSmediapackage-vodHlsManifest *> * _Nullable hlsManifests;

/**
 Duration (in seconds) of each fragment. Actual fragments will be rounded to the nearest multiple of the source fragment duration. 
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentDurationSeconds;

@end

/**
 A new MediaPackage VOD Asset configuration.
 Required parameters: [SourceArn, Id, PackagingGroupId, SourceRoleArn]
 */
@interface AWSmediapackage-vodCreateAssetRequest : AWSRequest


/**
 The unique identifier for the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The ID of the PackagingGroup for the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable packagingGroupId;

/**
 The resource ID to include in SPEKE key requests.
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 ARN of the source object in S3.
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 The IAM role ARN used to access the source S3 bucket.
 */
@property (nonatomic, strong) NSString * _Nullable sourceRoleArn;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSmediapackage-vodCreateAssetResponse : AWSModel


/**
 The ARN of the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The time the Asset was initially submitted for Ingest.
 */
@property (nonatomic, strong) NSString * _Nullable createdAt;

/**
 The list of egress endpoints available for the Asset.
 */
@property (nonatomic, strong) NSArray<AWSmediapackage-vodEgressEndpoint *> * _Nullable egressEndpoints;

/**
 The unique identifier for the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The ID of the PackagingGroup for the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable packagingGroupId;

/**
 The resource ID to include in SPEKE key requests.
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 ARN of the source object in S3.
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 The IAM role_arn used to access the source S3 bucket.
 */
@property (nonatomic, strong) NSString * _Nullable sourceRoleArn;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 A new MediaPackage VOD PackagingConfiguration resource configuration.
 Required parameters: [Id, PackagingGroupId]
 */
@interface AWSmediapackage-vodCreatePackagingConfigurationRequest : AWSRequest


/**
 A CMAF packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodCmafPackage * _Nullable cmafPackage;

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodDashPackage * _Nullable dashPackage;

/**
 An HTTP Live Streaming (HLS) packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodHlsPackage * _Nullable hlsPackage;

/**
 The ID of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
 */
@property (nonatomic, strong) AWSmediapackage-vodMssPackage * _Nullable mssPackage;

/**
 The ID of a PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable packagingGroupId;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSmediapackage-vodCreatePackagingConfigurationResponse : AWSModel


/**
 The ARN of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A CMAF packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodCmafPackage * _Nullable cmafPackage;

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodDashPackage * _Nullable dashPackage;

/**
 An HTTP Live Streaming (HLS) packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodHlsPackage * _Nullable hlsPackage;

/**
 The ID of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
 */
@property (nonatomic, strong) AWSmediapackage-vodMssPackage * _Nullable mssPackage;

/**
 The ID of a PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable packagingGroupId;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 A new MediaPackage VOD PackagingGroup resource configuration.
 Required parameters: [Id]
 */
@interface AWSmediapackage-vodCreatePackagingGroupRequest : AWSRequest


/**
 The ID of the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSmediapackage-vodCreatePackagingGroupResponse : AWSModel


/**
 The ARN of the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The fully qualified domain name for Assets in the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 The ID of the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) encryption configuration.
 Required parameters: [SpekeKeyProvider]
 */
@interface AWSmediapackage-vodDashEncryption : AWSModel


/**
 A configuration for accessing an external Secure Packager and Encoder Key Exchange (SPEKE) service that will provide encryption keys.
 */
@property (nonatomic, strong) AWSmediapackage-vodSpekeKeyProvider * _Nullable spekeKeyProvider;

@end

/**
 A DASH manifest configuration.
 */
@interface AWSmediapackage-vodDashManifest : AWSModel


/**
 Determines the position of some tags in the Media Presentation Description (MPD).When set to FULL, elements like SegmentTemplate and ContentProtection are included in each Representation.When set to COMPACT, duplicate elements are combined and presented at the AdaptationSet level.
 */
@property (nonatomic, assign) AWSmediapackage-vodManifestLayout manifestLayout;

/**
 An optional string to include in the name of the manifest.
 */
@property (nonatomic, strong) NSString * _Nullable manifestName;

/**
 Minimum duration (in seconds) that a player will buffer media before starting the presentation.
 */
@property (nonatomic, strong) NSNumber * _Nullable minBufferTimeSeconds;

/**
 The Dynamic Adaptive Streaming over HTTP (DASH) profile type.When set to "HBBTV_1_5", HbbTV 1.5 compliant output is enabled.
 */
@property (nonatomic, assign) AWSmediapackage-vodProfile profile;

/**
 A StreamSelection configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodStreamSelection * _Nullable streamSelection;

@end

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
 Required parameters: [DashManifests]
 */
@interface AWSmediapackage-vodDashPackage : AWSModel


/**
 A list of DASH manifest configurations.
 */
@property (nonatomic, strong) NSArray<AWSmediapackage-vodDashManifest *> * _Nullable dashManifests;

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) encryption configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodDashEncryption * _Nullable encryption;

/**
 A list of triggers that controls when the outgoing Dynamic Adaptive Streaming over HTTP (DASH) Media Presentation Description (MPD) will be partitioned into multiple periods. If empty, the content will not be partitioned into more than one period. If the list contains "ADS", new periods will be created where the Asset contains SCTE-35 ad markers. 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable periodTriggers;

/**
 Duration (in seconds) of each segment. Actual segments will be rounded to the nearest multiple of the source segment duration. 
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentDurationSeconds;

/**
 Determines the type of SegmentTemplate included in the Media Presentation Description (MPD).When set to NUMBER_WITH_TIMELINE, a full timeline is presented in each SegmentTemplate, with $Number$ media URLs.When set to TIME_WITH_TIMELINE, a full timeline is presented in each SegmentTemplate, with $Time$ media URLs. When set to NUMBER_WITH_DURATION, only a duration is included in each SegmentTemplate, with $Number$ media URLs.
 */
@property (nonatomic, assign) AWSmediapackage-vodSegmentTemplateFormat segmentTemplateFormat;

@end

/**
 
 */
@interface AWSmediapackage-vodDeleteAssetRequest : AWSRequest


/**
 The ID of the MediaPackage VOD Asset resource to delete.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSmediapackage-vodDeleteAssetResponse : AWSModel


@end

/**
 
 */
@interface AWSmediapackage-vodDeletePackagingConfigurationRequest : AWSRequest


/**
 The ID of the MediaPackage VOD PackagingConfiguration resource to delete.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSmediapackage-vodDeletePackagingConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSmediapackage-vodDeletePackagingGroupRequest : AWSRequest


/**
 The ID of the MediaPackage VOD PackagingGroup resource to delete.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSmediapackage-vodDeletePackagingGroupResponse : AWSModel


@end

/**
 
 */
@interface AWSmediapackage-vodDescribeAssetRequest : AWSRequest


/**
 The ID of an MediaPackage VOD Asset resource.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSmediapackage-vodDescribeAssetResponse : AWSModel


/**
 The ARN of the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The time the Asset was initially submitted for Ingest.
 */
@property (nonatomic, strong) NSString * _Nullable createdAt;

/**
 The list of egress endpoints available for the Asset.
 */
@property (nonatomic, strong) NSArray<AWSmediapackage-vodEgressEndpoint *> * _Nullable egressEndpoints;

/**
 The unique identifier for the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 The ID of the PackagingGroup for the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable packagingGroupId;

/**
 The resource ID to include in SPEKE key requests.
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 ARN of the source object in S3.
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

/**
 The IAM role_arn used to access the source S3 bucket.
 */
@property (nonatomic, strong) NSString * _Nullable sourceRoleArn;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSmediapackage-vodDescribePackagingConfigurationRequest : AWSRequest


/**
 The ID of a MediaPackage VOD PackagingConfiguration resource.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSmediapackage-vodDescribePackagingConfigurationResponse : AWSModel


/**
 The ARN of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A CMAF packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodCmafPackage * _Nullable cmafPackage;

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodDashPackage * _Nullable dashPackage;

/**
 An HTTP Live Streaming (HLS) packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodHlsPackage * _Nullable hlsPackage;

/**
 The ID of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
 */
@property (nonatomic, strong) AWSmediapackage-vodMssPackage * _Nullable mssPackage;

/**
 The ID of a PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable packagingGroupId;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSmediapackage-vodDescribePackagingGroupRequest : AWSRequest


/**
 The ID of a MediaPackage VOD PackagingGroup resource.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSmediapackage-vodDescribePackagingGroupResponse : AWSModel


/**
 The ARN of the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The fully qualified domain name for Assets in the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 The ID of the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 The endpoint URL used to access an Asset using one PackagingConfiguration.
 */
@interface AWSmediapackage-vodEgressEndpoint : AWSModel


/**
 The ID of the PackagingConfiguration being applied to the Asset.
 */
@property (nonatomic, strong) NSString * _Nullable packagingConfigurationId;

/**
 The URL of the parent manifest for the repackaged Asset.
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 An HTTP Live Streaming (HLS) encryption configuration.
 Required parameters: [SpekeKeyProvider]
 */
@interface AWSmediapackage-vodHlsEncryption : AWSModel


/**
 A constant initialization vector for encryption (optional). When not specified the initialization vector will be periodically rotated. 
 */
@property (nonatomic, strong) NSString * _Nullable constantInitializationVector;

/**
 The encryption method to use.
 */
@property (nonatomic, assign) AWSmediapackage-vodEncryptionMethod encryptionMethod;

/**
 A configuration for accessing an external Secure Packager and Encoder Key Exchange (SPEKE) service that will provide encryption keys.
 */
@property (nonatomic, strong) AWSmediapackage-vodSpekeKeyProvider * _Nullable spekeKeyProvider;

@end

/**
 An HTTP Live Streaming (HLS) manifest configuration.
 */
@interface AWSmediapackage-vodHlsManifest : AWSModel


/**
 This setting controls how ad markers are included in the packaged OriginEndpoint. "NONE" will omit all SCTE-35 ad markers from the output. "PASSTHROUGH" causes the manifest to contain a copy of the SCTE-35 ad markers (comments) taken directly from the input HTTP Live Streaming (HLS) manifest. "SCTE35_ENHANCED" generates ad markers and blackout tags based on SCTE-35 messages in the input source. 
 */
@property (nonatomic, assign) AWSmediapackage-vodAdMarkers adMarkers;

/**
 When enabled, an I-Frame only stream will be included in the output.
 */
@property (nonatomic, strong) NSNumber * _Nullable includeIframeOnlyStream;

/**
 An optional string to include in the name of the manifest.
 */
@property (nonatomic, strong) NSString * _Nullable manifestName;

/**
 The interval (in seconds) between each EXT-X-PROGRAM-DATE-TIME tag inserted into manifests. Additionally, when an interval is specified ID3Timed Metadata messages will be generated every 5 seconds using the ingest time of the content. If the interval is not specified, or set to 0, then no EXT-X-PROGRAM-DATE-TIME tags will be inserted into manifests and no ID3Timed Metadata messages will be generated. Note that irrespective of this parameter, if any ID3 Timed Metadata is found in HTTP Live Streaming (HLS) input, it will be passed through to HLS output. 
 */
@property (nonatomic, strong) NSNumber * _Nullable programDateTimeIntervalSeconds;

/**
 When enabled, the EXT-X-KEY tag will be repeated in output manifests.
 */
@property (nonatomic, strong) NSNumber * _Nullable repeatExtXKey;

/**
 A StreamSelection configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodStreamSelection * _Nullable streamSelection;

@end

/**
 An HTTP Live Streaming (HLS) packaging configuration.
 Required parameters: [HlsManifests]
 */
@interface AWSmediapackage-vodHlsPackage : AWSModel


/**
 An HTTP Live Streaming (HLS) encryption configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodHlsEncryption * _Nullable encryption;

/**
 A list of HLS manifest configurations.
 */
@property (nonatomic, strong) NSArray<AWSmediapackage-vodHlsManifest *> * _Nullable hlsManifests;

/**
 Duration (in seconds) of each fragment. Actual fragments will be rounded to the nearest multiple of the source fragment duration. 
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentDurationSeconds;

/**
 When enabled, audio streams will be placed in rendition groups in the output.
 */
@property (nonatomic, strong) NSNumber * _Nullable useAudioRenditionGroup;

@end

/**
 
 */
@interface AWSmediapackage-vodListAssetsRequest : AWSRequest


/**
 Upper bound on number of records to return.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 A token used to resume pagination from the end of a previous request.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 Returns Assets associated with the specified PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable packagingGroupId;

@end

/**
 
 */
@interface AWSmediapackage-vodListAssetsResponse : AWSModel


/**
 A list of MediaPackage VOD Asset resources.
 */
@property (nonatomic, strong) NSArray<AWSmediapackage-vodAssetShallow *> * _Nullable assets;

/**
 A token that can be used to resume pagination from the end of the collection.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSmediapackage-vodListPackagingConfigurationsRequest : AWSRequest


/**
 Upper bound on number of records to return.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 A token used to resume pagination from the end of a previous request.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 Returns MediaPackage VOD PackagingConfigurations associated with the specified PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable packagingGroupId;

@end

/**
 
 */
@interface AWSmediapackage-vodListPackagingConfigurationsResponse : AWSModel


/**
 A token that can be used to resume pagination from the end of the collection.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 A list of MediaPackage VOD PackagingConfiguration resources.
 */
@property (nonatomic, strong) NSArray<AWSmediapackage-vodPackagingConfiguration *> * _Nullable packagingConfigurations;

@end

/**
 
 */
@interface AWSmediapackage-vodListPackagingGroupsRequest : AWSRequest


/**
 Upper bound on number of records to return.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 A token used to resume pagination from the end of a previous request.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSmediapackage-vodListPackagingGroupsResponse : AWSModel


/**
 A token that can be used to resume pagination from the end of the collection.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 A list of MediaPackage VOD PackagingGroup resources.
 */
@property (nonatomic, strong) NSArray<AWSmediapackage-vodPackagingGroup *> * _Nullable packagingGroups;

@end

/**
 
 */
@interface AWSmediapackage-vodListTagsForResourceRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSmediapackage-vodListTagsForResourceResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 A Microsoft Smooth Streaming (MSS) encryption configuration.
 Required parameters: [SpekeKeyProvider]
 */
@interface AWSmediapackage-vodMssEncryption : AWSModel


/**
 A configuration for accessing an external Secure Packager and Encoder Key Exchange (SPEKE) service that will provide encryption keys.
 */
@property (nonatomic, strong) AWSmediapackage-vodSpekeKeyProvider * _Nullable spekeKeyProvider;

@end

/**
 A Microsoft Smooth Streaming (MSS) manifest configuration.
 */
@interface AWSmediapackage-vodMssManifest : AWSModel


/**
 An optional string to include in the name of the manifest.
 */
@property (nonatomic, strong) NSString * _Nullable manifestName;

/**
 A StreamSelection configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodStreamSelection * _Nullable streamSelection;

@end

/**
 A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
 Required parameters: [MssManifests]
 */
@interface AWSmediapackage-vodMssPackage : AWSModel


/**
 A Microsoft Smooth Streaming (MSS) encryption configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodMssEncryption * _Nullable encryption;

/**
 A list of MSS manifest configurations.
 */
@property (nonatomic, strong) NSArray<AWSmediapackage-vodMssManifest *> * _Nullable mssManifests;

/**
 The duration (in seconds) of each segment.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentDurationSeconds;

@end

/**
 A MediaPackage VOD PackagingConfiguration resource.
 */
@interface AWSmediapackage-vodPackagingConfiguration : AWSModel


/**
 The ARN of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A CMAF packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodCmafPackage * _Nullable cmafPackage;

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodDashPackage * _Nullable dashPackage;

/**
 An HTTP Live Streaming (HLS) packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodHlsPackage * _Nullable hlsPackage;

/**
 The ID of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
 */
@property (nonatomic, strong) AWSmediapackage-vodMssPackage * _Nullable mssPackage;

/**
 The ID of a PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable packagingGroupId;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Parameters used to create a new MediaPackage VOD PackagingConfiguration resource.
 Required parameters: [Id, PackagingGroupId]
 */
@interface AWSmediapackage-vodPackagingConfigurationCreateParameters : AWSModel


/**
 A CMAF packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodCmafPackage * _Nullable cmafPackage;

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodDashPackage * _Nullable dashPackage;

/**
 An HTTP Live Streaming (HLS) packaging configuration.
 */
@property (nonatomic, strong) AWSmediapackage-vodHlsPackage * _Nullable hlsPackage;

/**
 The ID of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
 */
@property (nonatomic, strong) AWSmediapackage-vodMssPackage * _Nullable mssPackage;

/**
 The ID of a PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable packagingGroupId;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 A collection of MediaPackage VOD PackagingConfiguration resources.
 */
@interface AWSmediapackage-vodPackagingConfigurationList : AWSModel


/**
 A token that can be used to resume pagination from the end of the collection.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 A list of MediaPackage VOD PackagingConfiguration resources.
 */
@property (nonatomic, strong) NSArray<AWSmediapackage-vodPackagingConfiguration *> * _Nullable packagingConfigurations;

@end

/**
 A MediaPackage VOD PackagingGroup resource.
 */
@interface AWSmediapackage-vodPackagingGroup : AWSModel


/**
 The ARN of the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 The fully qualified domain name for Assets in the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 The ID of the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 Parameters used to create a new MediaPackage VOD PackagingGroup resource.
 Required parameters: [Id]
 */
@interface AWSmediapackage-vodPackagingGroupCreateParameters : AWSModel


/**
 The ID of the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 A collection of MediaPackage VOD PackagingGroup resources.
 */
@interface AWSmediapackage-vodPackagingGroupList : AWSModel


/**
 A token that can be used to resume pagination from the end of the collection.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 A list of MediaPackage VOD PackagingGroup resources.
 */
@property (nonatomic, strong) NSArray<AWSmediapackage-vodPackagingGroup *> * _Nullable packagingGroups;

@end

/**
 A configuration for accessing an external Secure Packager and Encoder Key Exchange (SPEKE) service that will provide encryption keys.
 Required parameters: [SystemIds, Url, RoleArn]
 */
@interface AWSmediapackage-vodSpekeKeyProvider : AWSModel


/**
 An Amazon Resource Name (ARN) of an IAM role that AWS Elemental MediaPackage will assume when accessing the key provider service. 
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 The system IDs to include in key requests.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable systemIds;

/**
 The URL of the external key provider service.
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 A StreamSelection configuration.
 */
@interface AWSmediapackage-vodStreamSelection : AWSModel


/**
 The maximum video bitrate (bps) to include in output.
 */
@property (nonatomic, strong) NSNumber * _Nullable maxVideoBitsPerSecond;

/**
 The minimum video bitrate (bps) to include in output.
 */
@property (nonatomic, strong) NSNumber * _Nullable minVideoBitsPerSecond;

/**
 A directive that determines the order of streams in the output.
 */
@property (nonatomic, assign) AWSmediapackage-vodStreamOrder streamOrder;

@end

/**
 
 */
@interface AWSmediapackage-vodTagResourceRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSmediapackage-vodTagsModel : AWSModel


/**
 
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSmediapackage-vodUntagResourceRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 The key(s) of tag to be deleted
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

NS_ASSUME_NONNULL_END
