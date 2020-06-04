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

FOUNDATION_EXPORT NSString *const AWSMediapackagevodErrorDomain;

typedef NS_ENUM(NSInteger, AWSMediapackagevodErrorType) {
    AWSMediapackagevodErrorUnknown,
    AWSMediapackagevodErrorForbidden,
    AWSMediapackagevodErrorInternalServerError,
    AWSMediapackagevodErrorNotFound,
    AWSMediapackagevodErrorServiceUnavailable,
    AWSMediapackagevodErrorTooManyRequests,
    AWSMediapackagevodErrorUnprocessableEntity,
};

typedef NS_ENUM(NSInteger, AWSMediapackagevodAdMarkers) {
    AWSMediapackagevodAdMarkersUnknown,
    AWSMediapackagevodAdMarkersNone,
    AWSMediapackagevodAdMarkersScte35Enhanced,
    AWSMediapackagevodAdMarkersPassthrough,
};

typedef NS_ENUM(NSInteger, AWSMediapackagevodEncryptionMethod) {
    AWSMediapackagevodEncryptionMethodUnknown,
    AWSMediapackagevodEncryptionMethodAes128,
    AWSMediapackagevodEncryptionMethodSampleAes,
};

typedef NS_ENUM(NSInteger, AWSMediapackagevodManifestLayout) {
    AWSMediapackagevodManifestLayoutUnknown,
    AWSMediapackagevodManifestLayoutFull,
    AWSMediapackagevodManifestLayoutCompact,
};

typedef NS_ENUM(NSInteger, AWSMediapackagevodProfile) {
    AWSMediapackagevodProfileUnknown,
    AWSMediapackagevodProfileNone,
    AWSMediapackagevodProfileHbbtv15,
};

typedef NS_ENUM(NSInteger, AWSMediapackagevodSegmentTemplateFormat) {
    AWSMediapackagevodSegmentTemplateFormatUnknown,
    AWSMediapackagevodSegmentTemplateFormatNumberWithTimeline,
    AWSMediapackagevodSegmentTemplateFormatTimeWithTimeline,
    AWSMediapackagevodSegmentTemplateFormatNumberWithDuration,
};

typedef NS_ENUM(NSInteger, AWSMediapackagevodStreamOrder) {
    AWSMediapackagevodStreamOrderUnknown,
    AWSMediapackagevodStreamOrderOriginal,
    AWSMediapackagevodStreamOrderVideoBitrateAscending,
    AWSMediapackagevodStreamOrderVideoBitrateDescending,
};

typedef NS_ENUM(NSInteger, AWSMediapackagevod__PeriodTriggersElement) {
    AWSMediapackagevod__PeriodTriggersElementUnknown,
    AWSMediapackagevod__PeriodTriggersElementAds,
};

@class AWSMediapackagevodAsset;
@class AWSMediapackagevodAssetCreateParameters;
@class AWSMediapackagevodAssetList;
@class AWSMediapackagevodAssetShallow;
@class AWSMediapackagevodAuthorization;
@class AWSMediapackagevodCmafEncryption;
@class AWSMediapackagevodCmafPackage;
@class AWSMediapackagevodCreateAssetRequest;
@class AWSMediapackagevodCreateAssetResponse;
@class AWSMediapackagevodCreatePackagingConfigurationRequest;
@class AWSMediapackagevodCreatePackagingConfigurationResponse;
@class AWSMediapackagevodCreatePackagingGroupRequest;
@class AWSMediapackagevodCreatePackagingGroupResponse;
@class AWSMediapackagevodDashEncryption;
@class AWSMediapackagevodDashManifest;
@class AWSMediapackagevodDashPackage;
@class AWSMediapackagevodDeleteAssetRequest;
@class AWSMediapackagevodDeleteAssetResponse;
@class AWSMediapackagevodDeletePackagingConfigurationRequest;
@class AWSMediapackagevodDeletePackagingConfigurationResponse;
@class AWSMediapackagevodDeletePackagingGroupRequest;
@class AWSMediapackagevodDeletePackagingGroupResponse;
@class AWSMediapackagevodDescribeAssetRequest;
@class AWSMediapackagevodDescribeAssetResponse;
@class AWSMediapackagevodDescribePackagingConfigurationRequest;
@class AWSMediapackagevodDescribePackagingConfigurationResponse;
@class AWSMediapackagevodDescribePackagingGroupRequest;
@class AWSMediapackagevodDescribePackagingGroupResponse;
@class AWSMediapackagevodEgressEndpoint;
@class AWSMediapackagevodHlsEncryption;
@class AWSMediapackagevodHlsManifest;
@class AWSMediapackagevodHlsPackage;
@class AWSMediapackagevodListAssetsRequest;
@class AWSMediapackagevodListAssetsResponse;
@class AWSMediapackagevodListPackagingConfigurationsRequest;
@class AWSMediapackagevodListPackagingConfigurationsResponse;
@class AWSMediapackagevodListPackagingGroupsRequest;
@class AWSMediapackagevodListPackagingGroupsResponse;
@class AWSMediapackagevodListTagsForResourceRequest;
@class AWSMediapackagevodListTagsForResourceResponse;
@class AWSMediapackagevodMssEncryption;
@class AWSMediapackagevodMssManifest;
@class AWSMediapackagevodMssPackage;
@class AWSMediapackagevodPackagingConfiguration;
@class AWSMediapackagevodPackagingConfigurationCreateParameters;
@class AWSMediapackagevodPackagingConfigurationList;
@class AWSMediapackagevodPackagingGroup;
@class AWSMediapackagevodPackagingGroupCreateParameters;
@class AWSMediapackagevodPackagingGroupList;
@class AWSMediapackagevodPackagingGroupUpdateParameters;
@class AWSMediapackagevodSpekeKeyProvider;
@class AWSMediapackagevodStreamSelection;
@class AWSMediapackagevodTagResourceRequest;
@class AWSMediapackagevodTagsModel;
@class AWSMediapackagevodUntagResourceRequest;
@class AWSMediapackagevodUpdatePackagingGroupRequest;
@class AWSMediapackagevodUpdatePackagingGroupResponse;

/**
 A MediaPackage VOD Asset resource.
 */
@interface AWSMediapackagevodAsset : AWSModel


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
@property (nonatomic, strong) NSArray<AWSMediapackagevodEgressEndpoint *> * _Nullable egressEndpoints;

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
@interface AWSMediapackagevodAssetCreateParameters : AWSModel


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
@interface AWSMediapackagevodAssetList : AWSModel


/**
 A list of MediaPackage VOD Asset resources.
 */
@property (nonatomic, strong) NSArray<AWSMediapackagevodAssetShallow *> * _Nullable assets;

/**
 A token that can be used to resume pagination from the end of the collection.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 A MediaPackage VOD Asset resource.
 */
@interface AWSMediapackagevodAssetShallow : AWSModel


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
 CDN Authorization credentials
 Required parameters: [SecretsRoleArn, CdnIdentifierSecret]
 */
@interface AWSMediapackagevodAuthorization : AWSModel


/**
 The Amazon Resource Name (ARN) for the secret in AWS Secrets Manager that is used for CDN authorization.
 */
@property (nonatomic, strong) NSString * _Nullable cdnIdentifierSecret;

/**
 The Amazon Resource Name (ARN) for the IAM role that allows MediaPackage to communicate with AWS Secrets Manager.
 */
@property (nonatomic, strong) NSString * _Nullable secretsRoleArn;

@end

/**
 A CMAF encryption configuration.
 Required parameters: [SpekeKeyProvider]
 */
@interface AWSMediapackagevodCmafEncryption : AWSModel


/**
 A configuration for accessing an external Secure Packager and Encoder Key Exchange (SPEKE) service that will provide encryption keys.
 */
@property (nonatomic, strong) AWSMediapackagevodSpekeKeyProvider * _Nullable spekeKeyProvider;

@end

/**
 A CMAF packaging configuration.
 Required parameters: [HlsManifests]
 */
@interface AWSMediapackagevodCmafPackage : AWSModel


/**
 A CMAF encryption configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodCmafEncryption * _Nullable encryption;

/**
 A list of HLS manifest configurations.
 */
@property (nonatomic, strong) NSArray<AWSMediapackagevodHlsManifest *> * _Nullable hlsManifests;

/**
 Duration (in seconds) of each fragment. Actual fragments will be rounded to the nearest multiple of the source fragment duration. 
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentDurationSeconds;

@end

/**
 A new MediaPackage VOD Asset configuration.
 Required parameters: [SourceArn, Id, PackagingGroupId, SourceRoleArn]
 */
@interface AWSMediapackagevodCreateAssetRequest : AWSRequest


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
@interface AWSMediapackagevodCreateAssetResponse : AWSModel


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
@property (nonatomic, strong) NSArray<AWSMediapackagevodEgressEndpoint *> * _Nullable egressEndpoints;

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
@interface AWSMediapackagevodCreatePackagingConfigurationRequest : AWSRequest


/**
 A CMAF packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodCmafPackage * _Nullable cmafPackage;

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodDashPackage * _Nullable dashPackage;

/**
 An HTTP Live Streaming (HLS) packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodHlsPackage * _Nullable hlsPackage;

/**
 The ID of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
 */
@property (nonatomic, strong) AWSMediapackagevodMssPackage * _Nullable mssPackage;

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
@interface AWSMediapackagevodCreatePackagingConfigurationResponse : AWSModel


/**
 The ARN of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A CMAF packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodCmafPackage * _Nullable cmafPackage;

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodDashPackage * _Nullable dashPackage;

/**
 An HTTP Live Streaming (HLS) packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodHlsPackage * _Nullable hlsPackage;

/**
 The ID of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
 */
@property (nonatomic, strong) AWSMediapackagevodMssPackage * _Nullable mssPackage;

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
@interface AWSMediapackagevodCreatePackagingGroupRequest : AWSRequest


/**
 CDN Authorization credentials
 */
@property (nonatomic, strong) AWSMediapackagevodAuthorization * _Nullable authorization;

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
@interface AWSMediapackagevodCreatePackagingGroupResponse : AWSModel


/**
 The ARN of the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 CDN Authorization credentials
 */
@property (nonatomic, strong) AWSMediapackagevodAuthorization * _Nullable authorization;

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
@interface AWSMediapackagevodDashEncryption : AWSModel


/**
 A configuration for accessing an external Secure Packager and Encoder Key Exchange (SPEKE) service that will provide encryption keys.
 */
@property (nonatomic, strong) AWSMediapackagevodSpekeKeyProvider * _Nullable spekeKeyProvider;

@end

/**
 A DASH manifest configuration.
 */
@interface AWSMediapackagevodDashManifest : AWSModel


/**
 Determines the position of some tags in the Media Presentation Description (MPD).When set to FULL, elements like SegmentTemplate and ContentProtection are included in each Representation.When set to COMPACT, duplicate elements are combined and presented at the AdaptationSet level.
 */
@property (nonatomic, assign) AWSMediapackagevodManifestLayout manifestLayout;

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
@property (nonatomic, assign) AWSMediapackagevodProfile profile;

/**
 A StreamSelection configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodStreamSelection * _Nullable streamSelection;

@end

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
 Required parameters: [DashManifests]
 */
@interface AWSMediapackagevodDashPackage : AWSModel


/**
 A list of DASH manifest configurations.
 */
@property (nonatomic, strong) NSArray<AWSMediapackagevodDashManifest *> * _Nullable dashManifests;

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) encryption configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodDashEncryption * _Nullable encryption;

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
@property (nonatomic, assign) AWSMediapackagevodSegmentTemplateFormat segmentTemplateFormat;

@end

/**
 
 */
@interface AWSMediapackagevodDeleteAssetRequest : AWSRequest


/**
 The ID of the MediaPackage VOD Asset resource to delete.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSMediapackagevodDeleteAssetResponse : AWSModel


@end

/**
 
 */
@interface AWSMediapackagevodDeletePackagingConfigurationRequest : AWSRequest


/**
 The ID of the MediaPackage VOD PackagingConfiguration resource to delete.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSMediapackagevodDeletePackagingConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSMediapackagevodDeletePackagingGroupRequest : AWSRequest


/**
 The ID of the MediaPackage VOD PackagingGroup resource to delete.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSMediapackagevodDeletePackagingGroupResponse : AWSModel


@end

/**
 
 */
@interface AWSMediapackagevodDescribeAssetRequest : AWSRequest


/**
 The ID of an MediaPackage VOD Asset resource.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSMediapackagevodDescribeAssetResponse : AWSModel


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
@property (nonatomic, strong) NSArray<AWSMediapackagevodEgressEndpoint *> * _Nullable egressEndpoints;

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
@interface AWSMediapackagevodDescribePackagingConfigurationRequest : AWSRequest


/**
 The ID of a MediaPackage VOD PackagingConfiguration resource.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSMediapackagevodDescribePackagingConfigurationResponse : AWSModel


/**
 The ARN of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A CMAF packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodCmafPackage * _Nullable cmafPackage;

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodDashPackage * _Nullable dashPackage;

/**
 An HTTP Live Streaming (HLS) packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodHlsPackage * _Nullable hlsPackage;

/**
 The ID of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
 */
@property (nonatomic, strong) AWSMediapackagevodMssPackage * _Nullable mssPackage;

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
@interface AWSMediapackagevodDescribePackagingGroupRequest : AWSRequest


/**
 The ID of a MediaPackage VOD PackagingGroup resource.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSMediapackagevodDescribePackagingGroupResponse : AWSModel


/**
 The ARN of the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 CDN Authorization credentials
 */
@property (nonatomic, strong) AWSMediapackagevodAuthorization * _Nullable authorization;

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
@interface AWSMediapackagevodEgressEndpoint : AWSModel


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
@interface AWSMediapackagevodHlsEncryption : AWSModel


/**
 A constant initialization vector for encryption (optional). When not specified the initialization vector will be periodically rotated. 
 */
@property (nonatomic, strong) NSString * _Nullable constantInitializationVector;

/**
 The encryption method to use.
 */
@property (nonatomic, assign) AWSMediapackagevodEncryptionMethod encryptionMethod;

/**
 A configuration for accessing an external Secure Packager and Encoder Key Exchange (SPEKE) service that will provide encryption keys.
 */
@property (nonatomic, strong) AWSMediapackagevodSpekeKeyProvider * _Nullable spekeKeyProvider;

@end

/**
 An HTTP Live Streaming (HLS) manifest configuration.
 */
@interface AWSMediapackagevodHlsManifest : AWSModel


/**
 This setting controls how ad markers are included in the packaged OriginEndpoint. "NONE" will omit all SCTE-35 ad markers from the output. "PASSTHROUGH" causes the manifest to contain a copy of the SCTE-35 ad markers (comments) taken directly from the input HTTP Live Streaming (HLS) manifest. "SCTE35_ENHANCED" generates ad markers and blackout tags based on SCTE-35 messages in the input source. 
 */
@property (nonatomic, assign) AWSMediapackagevodAdMarkers adMarkers;

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
@property (nonatomic, strong) AWSMediapackagevodStreamSelection * _Nullable streamSelection;

@end

/**
 An HTTP Live Streaming (HLS) packaging configuration.
 Required parameters: [HlsManifests]
 */
@interface AWSMediapackagevodHlsPackage : AWSModel


/**
 An HTTP Live Streaming (HLS) encryption configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodHlsEncryption * _Nullable encryption;

/**
 A list of HLS manifest configurations.
 */
@property (nonatomic, strong) NSArray<AWSMediapackagevodHlsManifest *> * _Nullable hlsManifests;

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
@interface AWSMediapackagevodListAssetsRequest : AWSRequest


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
@interface AWSMediapackagevodListAssetsResponse : AWSModel


/**
 A list of MediaPackage VOD Asset resources.
 */
@property (nonatomic, strong) NSArray<AWSMediapackagevodAssetShallow *> * _Nullable assets;

/**
 A token that can be used to resume pagination from the end of the collection.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSMediapackagevodListPackagingConfigurationsRequest : AWSRequest


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
@interface AWSMediapackagevodListPackagingConfigurationsResponse : AWSModel


/**
 A token that can be used to resume pagination from the end of the collection.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 A list of MediaPackage VOD PackagingConfiguration resources.
 */
@property (nonatomic, strong) NSArray<AWSMediapackagevodPackagingConfiguration *> * _Nullable packagingConfigurations;

@end

/**
 
 */
@interface AWSMediapackagevodListPackagingGroupsRequest : AWSRequest


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
@interface AWSMediapackagevodListPackagingGroupsResponse : AWSModel


/**
 A token that can be used to resume pagination from the end of the collection.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 A list of MediaPackage VOD PackagingGroup resources.
 */
@property (nonatomic, strong) NSArray<AWSMediapackagevodPackagingGroup *> * _Nullable packagingGroups;

@end

/**
 
 */
@interface AWSMediapackagevodListTagsForResourceRequest : AWSRequest


/**
 The Amazon Resource Name (ARN) for the resource. You can get this from the response to any request to the resource.
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSMediapackagevodListTagsForResourceResponse : AWSModel


/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 A Microsoft Smooth Streaming (MSS) encryption configuration.
 Required parameters: [SpekeKeyProvider]
 */
@interface AWSMediapackagevodMssEncryption : AWSModel


/**
 A configuration for accessing an external Secure Packager and Encoder Key Exchange (SPEKE) service that will provide encryption keys.
 */
@property (nonatomic, strong) AWSMediapackagevodSpekeKeyProvider * _Nullable spekeKeyProvider;

@end

/**
 A Microsoft Smooth Streaming (MSS) manifest configuration.
 */
@interface AWSMediapackagevodMssManifest : AWSModel


/**
 An optional string to include in the name of the manifest.
 */
@property (nonatomic, strong) NSString * _Nullable manifestName;

/**
 A StreamSelection configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodStreamSelection * _Nullable streamSelection;

@end

/**
 A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
 Required parameters: [MssManifests]
 */
@interface AWSMediapackagevodMssPackage : AWSModel


/**
 A Microsoft Smooth Streaming (MSS) encryption configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodMssEncryption * _Nullable encryption;

/**
 A list of MSS manifest configurations.
 */
@property (nonatomic, strong) NSArray<AWSMediapackagevodMssManifest *> * _Nullable mssManifests;

/**
 The duration (in seconds) of each segment.
 */
@property (nonatomic, strong) NSNumber * _Nullable segmentDurationSeconds;

@end

/**
 A MediaPackage VOD PackagingConfiguration resource.
 */
@interface AWSMediapackagevodPackagingConfiguration : AWSModel


/**
 The ARN of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 A CMAF packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodCmafPackage * _Nullable cmafPackage;

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodDashPackage * _Nullable dashPackage;

/**
 An HTTP Live Streaming (HLS) packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodHlsPackage * _Nullable hlsPackage;

/**
 The ID of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
 */
@property (nonatomic, strong) AWSMediapackagevodMssPackage * _Nullable mssPackage;

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
@interface AWSMediapackagevodPackagingConfigurationCreateParameters : AWSModel


/**
 A CMAF packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodCmafPackage * _Nullable cmafPackage;

/**
 A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodDashPackage * _Nullable dashPackage;

/**
 An HTTP Live Streaming (HLS) packaging configuration.
 */
@property (nonatomic, strong) AWSMediapackagevodHlsPackage * _Nullable hlsPackage;

/**
 The ID of the PackagingConfiguration.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
 */
@property (nonatomic, strong) AWSMediapackagevodMssPackage * _Nullable mssPackage;

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
@interface AWSMediapackagevodPackagingConfigurationList : AWSModel


/**
 A token that can be used to resume pagination from the end of the collection.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 A list of MediaPackage VOD PackagingConfiguration resources.
 */
@property (nonatomic, strong) NSArray<AWSMediapackagevodPackagingConfiguration *> * _Nullable packagingConfigurations;

@end

/**
 A MediaPackage VOD PackagingGroup resource.
 */
@interface AWSMediapackagevodPackagingGroup : AWSModel


/**
 The ARN of the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 CDN Authorization credentials
 */
@property (nonatomic, strong) AWSMediapackagevodAuthorization * _Nullable authorization;

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
@interface AWSMediapackagevodPackagingGroupCreateParameters : AWSModel


/**
 CDN Authorization credentials
 */
@property (nonatomic, strong) AWSMediapackagevodAuthorization * _Nullable authorization;

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
@interface AWSMediapackagevodPackagingGroupList : AWSModel


/**
 A token that can be used to resume pagination from the end of the collection.
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 A list of MediaPackage VOD PackagingGroup resources.
 */
@property (nonatomic, strong) NSArray<AWSMediapackagevodPackagingGroup *> * _Nullable packagingGroups;

@end

/**
 Parameters used to update a MediaPackage packaging group.
 */
@interface AWSMediapackagevodPackagingGroupUpdateParameters : AWSModel


/**
 CDN Authorization credentials
 */
@property (nonatomic, strong) AWSMediapackagevodAuthorization * _Nullable authorization;

@end

/**
 A configuration for accessing an external Secure Packager and Encoder Key Exchange (SPEKE) service that will provide encryption keys.
 Required parameters: [SystemIds, Url, RoleArn]
 */
@interface AWSMediapackagevodSpekeKeyProvider : AWSModel


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
@interface AWSMediapackagevodStreamSelection : AWSModel


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
@property (nonatomic, assign) AWSMediapackagevodStreamOrder streamOrder;

@end

/**
 
 */
@interface AWSMediapackagevodTagResourceRequest : AWSRequest


/**
 The Amazon Resource Name (ARN) for the resource. You can get this from the response to any request to the resource.
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSMediapackagevodTagsModel : AWSModel


/**
 A collection of tags associated with a resource
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSMediapackagevodUntagResourceRequest : AWSRequest


/**
 The Amazon Resource Name (ARN) for the resource. You can get this from the response to any request to the resource.
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 A comma-separated list of the tag keys to remove from the resource.
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 A MediaPackage VOD PackagingGroup resource configuration.
 Required parameters: [Id]
 */
@interface AWSMediapackagevodUpdatePackagingGroupRequest : AWSRequest


/**
 CDN Authorization credentials
 */
@property (nonatomic, strong) AWSMediapackagevodAuthorization * _Nullable authorization;

/**
 The ID of a MediaPackage VOD PackagingGroup resource.
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSMediapackagevodUpdatePackagingGroupResponse : AWSModel


/**
 The ARN of the PackagingGroup.
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 CDN Authorization credentials
 */
@property (nonatomic, strong) AWSMediapackagevodAuthorization * _Nullable authorization;

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

NS_ASSUME_NONNULL_END
