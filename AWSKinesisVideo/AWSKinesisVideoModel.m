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

#import "AWSKinesisVideoModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSKinesisVideoErrorDomain = @"com.amazonaws.AWSKinesisVideoErrorDomain";

@implementation AWSKinesisVideoChannelInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelARN" : @"ChannelARN",
             @"channelName" : @"ChannelName",
             @"channelStatus" : @"ChannelStatus",
             @"channelType" : @"ChannelType",
             @"creationTime" : @"CreationTime",
             @"singleMasterConfiguration" : @"SingleMasterConfiguration",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)channelStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKinesisVideoStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKinesisVideoStatusActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSKinesisVideoStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKinesisVideoStatusDeleting);
        }
        return @(AWSKinesisVideoStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoStatusCreating:
                return @"CREATING";
            case AWSKinesisVideoStatusActive:
                return @"ACTIVE";
            case AWSKinesisVideoStatusUpdating:
                return @"UPDATING";
            case AWSKinesisVideoStatusDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_MASTER"] == NSOrderedSame) {
            return @(AWSKinesisVideoChannelTypeSingleMaster);
        }
        if ([value caseInsensitiveCompare:@"FULL_MESH"] == NSOrderedSame) {
            return @(AWSKinesisVideoChannelTypeFullMesh);
        }
        return @(AWSKinesisVideoChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoChannelTypeSingleMaster:
                return @"SINGLE_MASTER";
            case AWSKinesisVideoChannelTypeFullMesh:
                return @"FULL_MESH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)singleMasterConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoSingleMasterConfiguration class]];
}

@end

@implementation AWSKinesisVideoChannelNameCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparisonOperator" : @"ComparisonOperator",
             @"comparisonValue" : @"ComparisonValue",
             };
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BEGINS_WITH"] == NSOrderedSame) {
            return @(AWSKinesisVideoComparisonOperatorBeginsWith);
        }
        return @(AWSKinesisVideoComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoComparisonOperatorBeginsWith:
                return @"BEGINS_WITH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoCreateSignalingChannelInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelName" : @"ChannelName",
             @"channelType" : @"ChannelType",
             @"singleMasterConfiguration" : @"SingleMasterConfiguration",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_MASTER"] == NSOrderedSame) {
            return @(AWSKinesisVideoChannelTypeSingleMaster);
        }
        if ([value caseInsensitiveCompare:@"FULL_MESH"] == NSOrderedSame) {
            return @(AWSKinesisVideoChannelTypeFullMesh);
        }
        return @(AWSKinesisVideoChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoChannelTypeSingleMaster:
                return @"SINGLE_MASTER";
            case AWSKinesisVideoChannelTypeFullMesh:
                return @"FULL_MESH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)singleMasterConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoSingleMasterConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisVideoTag class]];
}

@end

@implementation AWSKinesisVideoCreateSignalingChannelOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelARN" : @"ChannelARN",
             };
}

@end

@implementation AWSKinesisVideoCreateStreamInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataRetentionInHours" : @"DataRetentionInHours",
             @"deviceName" : @"DeviceName",
             @"kmsKeyId" : @"KmsKeyId",
             @"mediaType" : @"MediaType",
             @"streamName" : @"StreamName",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSKinesisVideoCreateStreamOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamARN" : @"StreamARN",
             };
}

@end

@implementation AWSKinesisVideoDeleteEdgeConfigurationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisVideoDeleteEdgeConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisVideoDeleteSignalingChannelInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelARN" : @"ChannelARN",
             @"currentVersion" : @"CurrentVersion",
             };
}

@end

@implementation AWSKinesisVideoDeleteSignalingChannelOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisVideoDeleteStreamInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentVersion" : @"CurrentVersion",
             @"streamARN" : @"StreamARN",
             };
}

@end

@implementation AWSKinesisVideoDeleteStreamOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisVideoDeletionConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteAfterUpload" : @"DeleteAfterUpload",
             @"edgeRetentionInHours" : @"EdgeRetentionInHours",
             @"localSizeConfig" : @"LocalSizeConfig",
             };
}

+ (NSValueTransformer *)localSizeConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoLocalSizeConfig class]];
}

@end

@implementation AWSKinesisVideoDescribeEdgeConfigurationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisVideoDescribeEdgeConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"edgeAgentStatus" : @"EdgeAgentStatus",
             @"edgeConfig" : @"EdgeConfig",
             @"failedStatusDetails" : @"FailedStatusDetails",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             @"syncStatus" : @"SyncStatus",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)edgeAgentStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoEdgeAgentStatus class]];
}

+ (NSValueTransformer *)edgeConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoEdgeConfig class]];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)syncStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYNCING"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusSyncing);
        }
        if ([value caseInsensitiveCompare:@"ACKNOWLEDGED"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusAcknowledged);
        }
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"SYNC_FAILED"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusSyncFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETE_FAILED"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusDeleteFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING_ACKNOWLEDGED"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusDeletingAcknowledged);
        }
        return @(AWSKinesisVideoSyncStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoSyncStatusSyncing:
                return @"SYNCING";
            case AWSKinesisVideoSyncStatusAcknowledged:
                return @"ACKNOWLEDGED";
            case AWSKinesisVideoSyncStatusInSync:
                return @"IN_SYNC";
            case AWSKinesisVideoSyncStatusSyncFailed:
                return @"SYNC_FAILED";
            case AWSKinesisVideoSyncStatusDeleting:
                return @"DELETING";
            case AWSKinesisVideoSyncStatusDeleteFailed:
                return @"DELETE_FAILED";
            case AWSKinesisVideoSyncStatusDeletingAcknowledged:
                return @"DELETING_ACKNOWLEDGED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoDescribeImageGenerationConfigurationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisVideoDescribeImageGenerationConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageGenerationConfiguration" : @"ImageGenerationConfiguration",
             };
}

+ (NSValueTransformer *)imageGenerationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoImageGenerationConfiguration class]];
}

@end

@implementation AWSKinesisVideoDescribeMappedResourceConfigurationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisVideoDescribeMappedResourceConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mappedResourceConfigurationList" : @"MappedResourceConfigurationList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)mappedResourceConfigurationListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisVideoMappedResourceConfigurationListItem class]];
}

@end

@implementation AWSKinesisVideoDescribeMediaStorageConfigurationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelARN" : @"ChannelARN",
             @"channelName" : @"ChannelName",
             };
}

@end

@implementation AWSKinesisVideoDescribeMediaStorageConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mediaStorageConfiguration" : @"MediaStorageConfiguration",
             };
}

+ (NSValueTransformer *)mediaStorageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoMediaStorageConfiguration class]];
}

@end

@implementation AWSKinesisVideoDescribeNotificationConfigurationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisVideoDescribeNotificationConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notificationConfiguration" : @"NotificationConfiguration",
             };
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoNotificationConfiguration class]];
}

@end

@implementation AWSKinesisVideoDescribeSignalingChannelInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelARN" : @"ChannelARN",
             @"channelName" : @"ChannelName",
             };
}

@end

@implementation AWSKinesisVideoDescribeSignalingChannelOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelInfo" : @"ChannelInfo",
             };
}

+ (NSValueTransformer *)channelInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoChannelInfo class]];
}

@end

@implementation AWSKinesisVideoDescribeStreamInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisVideoDescribeStreamOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamInfo" : @"StreamInfo",
             };
}

+ (NSValueTransformer *)streamInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoStreamInfo class]];
}

@end

@implementation AWSKinesisVideoEdgeAgentStatus

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lastRecorderStatus" : @"LastRecorderStatus",
             @"lastUploaderStatus" : @"LastUploaderStatus",
             };
}

+ (NSValueTransformer *)lastRecorderStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoLastRecorderStatus class]];
}

+ (NSValueTransformer *)lastUploaderStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoLastUploaderStatus class]];
}

@end

@implementation AWSKinesisVideoEdgeConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deletionConfig" : @"DeletionConfig",
             @"hubDeviceArn" : @"HubDeviceArn",
             @"recorderConfig" : @"RecorderConfig",
             @"uploaderConfig" : @"UploaderConfig",
             };
}

+ (NSValueTransformer *)deletionConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoDeletionConfig class]];
}

+ (NSValueTransformer *)recorderConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoRecorderConfig class]];
}

+ (NSValueTransformer *)uploaderConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoUploaderConfig class]];
}

@end

@implementation AWSKinesisVideoGetDataEndpointInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APIName" : @"APIName",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)APINameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUT_MEDIA"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINamePutMedia);
        }
        if ([value caseInsensitiveCompare:@"GET_MEDIA"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINameGetMedia);
        }
        if ([value caseInsensitiveCompare:@"LIST_FRAGMENTS"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINameListFragments);
        }
        if ([value caseInsensitiveCompare:@"GET_MEDIA_FOR_FRAGMENT_LIST"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINameGetMediaForFragmentList);
        }
        if ([value caseInsensitiveCompare:@"GET_HLS_STREAMING_SESSION_URL"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINameGetHlsStreamingSessionUrl);
        }
        if ([value caseInsensitiveCompare:@"GET_DASH_STREAMING_SESSION_URL"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINameGetDashStreamingSessionUrl);
        }
        if ([value caseInsensitiveCompare:@"GET_CLIP"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINameGetClip);
        }
        if ([value caseInsensitiveCompare:@"GET_IMAGES"] == NSOrderedSame) {
            return @(AWSKinesisVideoAPINameGetImages);
        }
        return @(AWSKinesisVideoAPINameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoAPINamePutMedia:
                return @"PUT_MEDIA";
            case AWSKinesisVideoAPINameGetMedia:
                return @"GET_MEDIA";
            case AWSKinesisVideoAPINameListFragments:
                return @"LIST_FRAGMENTS";
            case AWSKinesisVideoAPINameGetMediaForFragmentList:
                return @"GET_MEDIA_FOR_FRAGMENT_LIST";
            case AWSKinesisVideoAPINameGetHlsStreamingSessionUrl:
                return @"GET_HLS_STREAMING_SESSION_URL";
            case AWSKinesisVideoAPINameGetDashStreamingSessionUrl:
                return @"GET_DASH_STREAMING_SESSION_URL";
            case AWSKinesisVideoAPINameGetClip:
                return @"GET_CLIP";
            case AWSKinesisVideoAPINameGetImages:
                return @"GET_IMAGES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoGetDataEndpointOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataEndpoint" : @"DataEndpoint",
             };
}

@end

@implementation AWSKinesisVideoGetSignalingChannelEndpointInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelARN" : @"ChannelARN",
             @"singleMasterChannelEndpointConfiguration" : @"SingleMasterChannelEndpointConfiguration",
             };
}

+ (NSValueTransformer *)singleMasterChannelEndpointConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoSingleMasterChannelEndpointConfiguration class]];
}

@end

@implementation AWSKinesisVideoGetSignalingChannelEndpointOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceEndpointList" : @"ResourceEndpointList",
             };
}

+ (NSValueTransformer *)resourceEndpointListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisVideoResourceEndpointListItem class]];
}

@end

@implementation AWSKinesisVideoImageGenerationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationConfig" : @"DestinationConfig",
             @"format" : @"Format",
             @"formatConfig" : @"FormatConfig",
             @"heightPixels" : @"HeightPixels",
             @"imageSelectorType" : @"ImageSelectorType",
             @"samplingInterval" : @"SamplingInterval",
             @"status" : @"Status",
             @"widthPixels" : @"WidthPixels",
             };
}

+ (NSValueTransformer *)destinationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoImageGenerationDestinationConfig class]];
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"JPEG"] == NSOrderedSame) {
            return @(AWSKinesisVideoFormatJpeg);
        }
        if ([value caseInsensitiveCompare:@"PNG"] == NSOrderedSame) {
            return @(AWSKinesisVideoFormatPng);
        }
        return @(AWSKinesisVideoFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoFormatJpeg:
                return @"JPEG";
            case AWSKinesisVideoFormatPng:
                return @"PNG";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)imageSelectorTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SERVER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSKinesisVideoImageSelectorTypeServerTimestamp);
        }
        if ([value caseInsensitiveCompare:@"PRODUCER_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSKinesisVideoImageSelectorTypeProducerTimestamp);
        }
        return @(AWSKinesisVideoImageSelectorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoImageSelectorTypeServerTimestamp:
                return @"SERVER_TIMESTAMP";
            case AWSKinesisVideoImageSelectorTypeProducerTimestamp:
                return @"PRODUCER_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSKinesisVideoConfigurationStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSKinesisVideoConfigurationStatusDisabled);
        }
        return @(AWSKinesisVideoConfigurationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoConfigurationStatusEnabled:
                return @"ENABLED";
            case AWSKinesisVideoConfigurationStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoImageGenerationDestinationConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationRegion" : @"DestinationRegion",
             @"uri" : @"Uri",
             };
}

@end

@implementation AWSKinesisVideoLastRecorderStatus

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobStatusDetails" : @"JobStatusDetails",
             @"lastCollectedTime" : @"LastCollectedTime",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"recorderStatus" : @"RecorderStatus",
             };
}

+ (NSValueTransformer *)lastCollectedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)recorderStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSKinesisVideoRecorderStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"USER_ERROR"] == NSOrderedSame) {
            return @(AWSKinesisVideoRecorderStatusUserError);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM_ERROR"] == NSOrderedSame) {
            return @(AWSKinesisVideoRecorderStatusSystemError);
        }
        return @(AWSKinesisVideoRecorderStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoRecorderStatusSuccess:
                return @"SUCCESS";
            case AWSKinesisVideoRecorderStatusUserError:
                return @"USER_ERROR";
            case AWSKinesisVideoRecorderStatusSystemError:
                return @"SYSTEM_ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoLastUploaderStatus

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobStatusDetails" : @"JobStatusDetails",
             @"lastCollectedTime" : @"LastCollectedTime",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"uploaderStatus" : @"UploaderStatus",
             };
}

+ (NSValueTransformer *)lastCollectedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)uploaderStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSKinesisVideoUploaderStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"USER_ERROR"] == NSOrderedSame) {
            return @(AWSKinesisVideoUploaderStatusUserError);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM_ERROR"] == NSOrderedSame) {
            return @(AWSKinesisVideoUploaderStatusSystemError);
        }
        return @(AWSKinesisVideoUploaderStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoUploaderStatusSuccess:
                return @"SUCCESS";
            case AWSKinesisVideoUploaderStatusUserError:
                return @"USER_ERROR";
            case AWSKinesisVideoUploaderStatusSystemError:
                return @"SYSTEM_ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoListEdgeAgentConfigurationsEdgeConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"edgeConfig" : @"EdgeConfig",
             @"failedStatusDetails" : @"FailedStatusDetails",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             @"syncStatus" : @"SyncStatus",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)edgeConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoEdgeConfig class]];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)syncStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYNCING"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusSyncing);
        }
        if ([value caseInsensitiveCompare:@"ACKNOWLEDGED"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusAcknowledged);
        }
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"SYNC_FAILED"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusSyncFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETE_FAILED"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusDeleteFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING_ACKNOWLEDGED"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusDeletingAcknowledged);
        }
        return @(AWSKinesisVideoSyncStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoSyncStatusSyncing:
                return @"SYNCING";
            case AWSKinesisVideoSyncStatusAcknowledged:
                return @"ACKNOWLEDGED";
            case AWSKinesisVideoSyncStatusInSync:
                return @"IN_SYNC";
            case AWSKinesisVideoSyncStatusSyncFailed:
                return @"SYNC_FAILED";
            case AWSKinesisVideoSyncStatusDeleting:
                return @"DELETING";
            case AWSKinesisVideoSyncStatusDeleteFailed:
                return @"DELETE_FAILED";
            case AWSKinesisVideoSyncStatusDeletingAcknowledged:
                return @"DELETING_ACKNOWLEDGED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoListEdgeAgentConfigurationsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hubDeviceArn" : @"HubDeviceArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSKinesisVideoListEdgeAgentConfigurationsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"edgeConfigs" : @"EdgeConfigs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)edgeConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisVideoListEdgeAgentConfigurationsEdgeConfig class]];
}

@end

@implementation AWSKinesisVideoListSignalingChannelsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelNameCondition" : @"ChannelNameCondition",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelNameConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoChannelNameCondition class]];
}

@end

@implementation AWSKinesisVideoListSignalingChannelsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelInfoList" : @"ChannelInfoList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisVideoChannelInfo class]];
}

@end

@implementation AWSKinesisVideoListStreamsInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"streamNameCondition" : @"StreamNameCondition",
             };
}

+ (NSValueTransformer *)streamNameConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoStreamNameCondition class]];
}

@end

@implementation AWSKinesisVideoListStreamsOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"streamInfoList" : @"StreamInfoList",
             };
}

+ (NSValueTransformer *)streamInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisVideoStreamInfo class]];
}

@end

@implementation AWSKinesisVideoListTagsForResourceInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSKinesisVideoListTagsForResourceOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSKinesisVideoListTagsForStreamInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisVideoListTagsForStreamOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSKinesisVideoLocalSizeConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxLocalMediaSizeInMB" : @"MaxLocalMediaSizeInMB",
             @"strategyOnFullSize" : @"StrategyOnFullSize",
             };
}

+ (NSValueTransformer *)strategyOnFullSizeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DELETE_OLDEST_MEDIA"] == NSOrderedSame) {
            return @(AWSKinesisVideoStrategyOnFullSizeDeleteOldestMedia);
        }
        if ([value caseInsensitiveCompare:@"DENY_NEW_MEDIA"] == NSOrderedSame) {
            return @(AWSKinesisVideoStrategyOnFullSizeDenyNewMedia);
        }
        return @(AWSKinesisVideoStrategyOnFullSizeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoStrategyOnFullSizeDeleteOldestMedia:
                return @"DELETE_OLDEST_MEDIA";
            case AWSKinesisVideoStrategyOnFullSizeDenyNewMedia:
                return @"DENY_NEW_MEDIA";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoMappedResourceConfigurationListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"types" : @"Type",
             };
}

@end

@implementation AWSKinesisVideoMediaSourceConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mediaUriSecretArn" : @"MediaUriSecretArn",
             @"mediaUriType" : @"MediaUriType",
             };
}

+ (NSValueTransformer *)mediaUriTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RTSP_URI"] == NSOrderedSame) {
            return @(AWSKinesisVideoMediaUriTypeRtspUri);
        }
        if ([value caseInsensitiveCompare:@"FILE_URI"] == NSOrderedSame) {
            return @(AWSKinesisVideoMediaUriTypeFileUri);
        }
        return @(AWSKinesisVideoMediaUriTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoMediaUriTypeRtspUri:
                return @"RTSP_URI";
            case AWSKinesisVideoMediaUriTypeFileUri:
                return @"FILE_URI";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoMediaStorageConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"streamARN" : @"StreamARN",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSKinesisVideoMediaStorageConfigurationStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSKinesisVideoMediaStorageConfigurationStatusDisabled);
        }
        return @(AWSKinesisVideoMediaStorageConfigurationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoMediaStorageConfigurationStatusEnabled:
                return @"ENABLED";
            case AWSKinesisVideoMediaStorageConfigurationStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoNotificationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationConfig" : @"DestinationConfig",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)destinationConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoNotificationDestinationConfig class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSKinesisVideoConfigurationStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSKinesisVideoConfigurationStatusDisabled);
        }
        return @(AWSKinesisVideoConfigurationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoConfigurationStatusEnabled:
                return @"ENABLED";
            case AWSKinesisVideoConfigurationStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoNotificationDestinationConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"uri" : @"Uri",
             };
}

@end

@implementation AWSKinesisVideoRecorderConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mediaSourceConfig" : @"MediaSourceConfig",
             @"scheduleConfig" : @"ScheduleConfig",
             };
}

+ (NSValueTransformer *)mediaSourceConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoMediaSourceConfig class]];
}

+ (NSValueTransformer *)scheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoScheduleConfig class]];
}

@end

@implementation AWSKinesisVideoResourceEndpointListItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"protocols" : @"Protocol",
             @"resourceEndpoint" : @"ResourceEndpoint",
             };
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"WSS"] == NSOrderedSame) {
            return @(AWSKinesisVideoChannelProtocolWss);
        }
        if ([value caseInsensitiveCompare:@"HTTPS"] == NSOrderedSame) {
            return @(AWSKinesisVideoChannelProtocolHttps);
        }
        if ([value caseInsensitiveCompare:@"WEBRTC"] == NSOrderedSame) {
            return @(AWSKinesisVideoChannelProtocolWebrtc);
        }
        return @(AWSKinesisVideoChannelProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoChannelProtocolWss:
                return @"WSS";
            case AWSKinesisVideoChannelProtocolHttps:
                return @"HTTPS";
            case AWSKinesisVideoChannelProtocolWebrtc:
                return @"WEBRTC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoScheduleConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"durationInSeconds" : @"DurationInSeconds",
             @"scheduleExpression" : @"ScheduleExpression",
             };
}

@end

@implementation AWSKinesisVideoSingleMasterChannelEndpointConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"protocols" : @"Protocols",
             @"role" : @"Role",
             };
}

+ (NSValueTransformer *)roleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MASTER"] == NSOrderedSame) {
            return @(AWSKinesisVideoChannelRoleMaster);
        }
        if ([value caseInsensitiveCompare:@"VIEWER"] == NSOrderedSame) {
            return @(AWSKinesisVideoChannelRoleViewer);
        }
        return @(AWSKinesisVideoChannelRoleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoChannelRoleMaster:
                return @"MASTER";
            case AWSKinesisVideoChannelRoleViewer:
                return @"VIEWER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoSingleMasterConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageTtlSeconds" : @"MessageTtlSeconds",
             };
}

@end

@implementation AWSKinesisVideoStartEdgeConfigurationUpdateInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"edgeConfig" : @"EdgeConfig",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)edgeConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoEdgeConfig class]];
}

@end

@implementation AWSKinesisVideoStartEdgeConfigurationUpdateOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"edgeConfig" : @"EdgeConfig",
             @"failedStatusDetails" : @"FailedStatusDetails",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             @"syncStatus" : @"SyncStatus",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)edgeConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoEdgeConfig class]];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)syncStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYNCING"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusSyncing);
        }
        if ([value caseInsensitiveCompare:@"ACKNOWLEDGED"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusAcknowledged);
        }
        if ([value caseInsensitiveCompare:@"IN_SYNC"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusInSync);
        }
        if ([value caseInsensitiveCompare:@"SYNC_FAILED"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusSyncFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETE_FAILED"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusDeleteFailed);
        }
        if ([value caseInsensitiveCompare:@"DELETING_ACKNOWLEDGED"] == NSOrderedSame) {
            return @(AWSKinesisVideoSyncStatusDeletingAcknowledged);
        }
        return @(AWSKinesisVideoSyncStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoSyncStatusSyncing:
                return @"SYNCING";
            case AWSKinesisVideoSyncStatusAcknowledged:
                return @"ACKNOWLEDGED";
            case AWSKinesisVideoSyncStatusInSync:
                return @"IN_SYNC";
            case AWSKinesisVideoSyncStatusSyncFailed:
                return @"SYNC_FAILED";
            case AWSKinesisVideoSyncStatusDeleting:
                return @"DELETING";
            case AWSKinesisVideoSyncStatusDeleteFailed:
                return @"DELETE_FAILED";
            case AWSKinesisVideoSyncStatusDeletingAcknowledged:
                return @"DELETING_ACKNOWLEDGED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoStreamInfo

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"dataRetentionInHours" : @"DataRetentionInHours",
             @"deviceName" : @"DeviceName",
             @"kmsKeyId" : @"KmsKeyId",
             @"mediaType" : @"MediaType",
             @"status" : @"Status",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSKinesisVideoStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSKinesisVideoStatusActive);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSKinesisVideoStatusUpdating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSKinesisVideoStatusDeleting);
        }
        return @(AWSKinesisVideoStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoStatusCreating:
                return @"CREATING";
            case AWSKinesisVideoStatusActive:
                return @"ACTIVE";
            case AWSKinesisVideoStatusUpdating:
                return @"UPDATING";
            case AWSKinesisVideoStatusDeleting:
                return @"DELETING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoStreamNameCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparisonOperator" : @"ComparisonOperator",
             @"comparisonValue" : @"ComparisonValue",
             };
}

+ (NSValueTransformer *)comparisonOperatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BEGINS_WITH"] == NSOrderedSame) {
            return @(AWSKinesisVideoComparisonOperatorBeginsWith);
        }
        return @(AWSKinesisVideoComparisonOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoComparisonOperatorBeginsWith:
                return @"BEGINS_WITH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoTag

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSKinesisVideoTagResourceInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisVideoTag class]];
}

@end

@implementation AWSKinesisVideoTagResourceOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisVideoTagStreamInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSKinesisVideoTagStreamOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisVideoUntagResourceInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagKeyList" : @"TagKeyList",
             };
}

@end

@implementation AWSKinesisVideoUntagResourceOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisVideoUntagStreamInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             @"tagKeyList" : @"TagKeyList",
             };
}

@end

@implementation AWSKinesisVideoUntagStreamOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisVideoUpdateDataRetentionInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentVersion" : @"CurrentVersion",
             @"dataRetentionChangeInHours" : @"DataRetentionChangeInHours",
             @"operation" : @"Operation",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCREASE_DATA_RETENTION"] == NSOrderedSame) {
            return @(AWSKinesisVideoUpdateDataRetentionOperationIncreaseDataRetention);
        }
        if ([value caseInsensitiveCompare:@"DECREASE_DATA_RETENTION"] == NSOrderedSame) {
            return @(AWSKinesisVideoUpdateDataRetentionOperationDecreaseDataRetention);
        }
        return @(AWSKinesisVideoUpdateDataRetentionOperationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoUpdateDataRetentionOperationIncreaseDataRetention:
                return @"INCREASE_DATA_RETENTION";
            case AWSKinesisVideoUpdateDataRetentionOperationDecreaseDataRetention:
                return @"DECREASE_DATA_RETENTION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoUpdateDataRetentionOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisVideoUpdateImageGenerationConfigurationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageGenerationConfiguration" : @"ImageGenerationConfiguration",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)imageGenerationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoImageGenerationConfiguration class]];
}

@end

@implementation AWSKinesisVideoUpdateImageGenerationConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisVideoUpdateMediaStorageConfigurationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelARN" : @"ChannelARN",
             @"mediaStorageConfiguration" : @"MediaStorageConfiguration",
             };
}

+ (NSValueTransformer *)mediaStorageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoMediaStorageConfiguration class]];
}

@end

@implementation AWSKinesisVideoUpdateMediaStorageConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisVideoUpdateNotificationConfigurationInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"notificationConfiguration" : @"NotificationConfiguration",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

+ (NSValueTransformer *)notificationConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoNotificationConfiguration class]];
}

@end

@implementation AWSKinesisVideoUpdateNotificationConfigurationOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisVideoUpdateSignalingChannelInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelARN" : @"ChannelARN",
             @"currentVersion" : @"CurrentVersion",
             @"singleMasterConfiguration" : @"SingleMasterConfiguration",
             };
}

+ (NSValueTransformer *)singleMasterConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoSingleMasterConfiguration class]];
}

@end

@implementation AWSKinesisVideoUpdateSignalingChannelOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisVideoUpdateStreamInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentVersion" : @"CurrentVersion",
             @"deviceName" : @"DeviceName",
             @"mediaType" : @"MediaType",
             @"streamARN" : @"StreamARN",
             @"streamName" : @"StreamName",
             };
}

@end

@implementation AWSKinesisVideoUpdateStreamOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSKinesisVideoUploaderConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduleConfig" : @"ScheduleConfig",
             };
}

+ (NSValueTransformer *)scheduleConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSKinesisVideoScheduleConfig class]];
}

@end
