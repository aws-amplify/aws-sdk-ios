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

#import "AWSStoragegatewayModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSStoragegatewayErrorDomain = @"com.amazonaws.AWSStoragegatewayErrorDomain";

@implementation AWSStoragegatewayActivateGatewayInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activationKey" : @"ActivationKey",
             @"gatewayName" : @"GatewayName",
             @"gatewayRegion" : @"GatewayRegion",
             @"gatewayTimezone" : @"GatewayTimezone",
             @"gatewayType" : @"GatewayType",
             @"mediumChangerType" : @"MediumChangerType",
             @"tags" : @"Tags",
             @"tapeDriveType" : @"TapeDriveType",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayActivateGatewayOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayAddCacheInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskIds" : @"DiskIds",
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayAddCacheOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayAddTagsToResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayAddTagsToResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSStoragegatewayAddUploadBufferInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskIds" : @"DiskIds",
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayAddUploadBufferOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayAddWorkingStorageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskIds" : @"DiskIds",
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayAddWorkingStorageOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayAssignTapePoolInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"poolId" : @"PoolId",
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayAssignTapePoolOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayAttachVolumeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskId" : @"DiskId",
             @"gatewayARN" : @"GatewayARN",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"targetName" : @"TargetName",
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSStoragegatewayAttachVolumeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetARN" : @"TargetARN",
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSStoragegatewayAutomaticTapeCreationPolicyInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automaticTapeCreationRules" : @"AutomaticTapeCreationRules",
             @"gatewayARN" : @"GatewayARN",
             };
}

+ (NSValueTransformer *)automaticTapeCreationRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayAutomaticTapeCreationRule class]];
}

@end

@implementation AWSStoragegatewayAutomaticTapeCreationRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"minimumNumTapes" : @"MinimumNumTapes",
             @"poolId" : @"PoolId",
             @"tapeBarcodePrefix" : @"TapeBarcodePrefix",
             @"tapeSizeInBytes" : @"TapeSizeInBytes",
             };
}

@end

@implementation AWSStoragegatewayCachediSCSIVolume

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"CreatedDate",
             @"KMSKey" : @"KMSKey",
             @"sourceSnapshotId" : @"SourceSnapshotId",
             @"targetName" : @"TargetName",
             @"volumeARN" : @"VolumeARN",
             @"volumeAttachmentStatus" : @"VolumeAttachmentStatus",
             @"volumeId" : @"VolumeId",
             @"volumeProgress" : @"VolumeProgress",
             @"volumeSizeInBytes" : @"VolumeSizeInBytes",
             @"volumeStatus" : @"VolumeStatus",
             @"volumeType" : @"VolumeType",
             @"volumeUsedInBytes" : @"VolumeUsedInBytes",
             @"volumeiSCSIAttributes" : @"VolumeiSCSIAttributes",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)volumeiSCSIAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSStoragegatewayVolumeiSCSIAttributes class]];
}

@end

@implementation AWSStoragegatewayCancelArchivalInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayCancelArchivalOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayCancelRetrievalInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayCancelRetrievalOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayChapInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initiatorName" : @"InitiatorName",
             @"secretToAuthenticateInitiator" : @"SecretToAuthenticateInitiator",
             @"secretToAuthenticateTarget" : @"SecretToAuthenticateTarget",
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSStoragegatewayCreateCachediSCSIVolumeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"gatewayARN" : @"GatewayARN",
             @"KMSEncrypted" : @"KMSEncrypted",
             @"KMSKey" : @"KMSKey",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"snapshotId" : @"SnapshotId",
             @"sourceVolumeARN" : @"SourceVolumeARN",
             @"tags" : @"Tags",
             @"targetName" : @"TargetName",
             @"volumeSizeInBytes" : @"VolumeSizeInBytes",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayCreateCachediSCSIVolumeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetARN" : @"TargetARN",
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSStoragegatewayCreateNFSFileShareInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientList" : @"ClientList",
             @"clientToken" : @"ClientToken",
             @"defaultStorageClass" : @"DefaultStorageClass",
             @"gatewayARN" : @"GatewayARN",
             @"guessMIMETypeEnabled" : @"GuessMIMETypeEnabled",
             @"KMSEncrypted" : @"KMSEncrypted",
             @"KMSKey" : @"KMSKey",
             @"locationARN" : @"LocationARN",
             @"NFSFileShareDefaults" : @"NFSFileShareDefaults",
             @"objectACL" : @"ObjectACL",
             @"readOnly" : @"ReadOnly",
             @"requesterPays" : @"RequesterPays",
             @"role" : @"Role",
             @"squash" : @"Squash",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)NFSFileShareDefaultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSStoragegatewayNFSFileShareDefaults class]];
}

+ (NSValueTransformer *)objectACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLBucketOwnerFullControl);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLAwsExecRead);
        }
        return @(AWSStoragegatewayObjectACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewayObjectACLPrivate:
                return @"private";
            case AWSStoragegatewayObjectACLPublicRead:
                return @"public-read";
            case AWSStoragegatewayObjectACLPublicReadWrite:
                return @"public-read-write";
            case AWSStoragegatewayObjectACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSStoragegatewayObjectACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSStoragegatewayObjectACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSStoragegatewayObjectACLAwsExecRead:
                return @"aws-exec-read";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayCreateNFSFileShareOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             };
}

@end

@implementation AWSStoragegatewayCreateSMBFileShareInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminUserList" : @"AdminUserList",
             @"auditDestinationARN" : @"AuditDestinationARN",
             @"authentication" : @"Authentication",
             @"clientToken" : @"ClientToken",
             @"defaultStorageClass" : @"DefaultStorageClass",
             @"gatewayARN" : @"GatewayARN",
             @"guessMIMETypeEnabled" : @"GuessMIMETypeEnabled",
             @"invalidUserList" : @"InvalidUserList",
             @"KMSEncrypted" : @"KMSEncrypted",
             @"KMSKey" : @"KMSKey",
             @"locationARN" : @"LocationARN",
             @"objectACL" : @"ObjectACL",
             @"readOnly" : @"ReadOnly",
             @"requesterPays" : @"RequesterPays",
             @"role" : @"Role",
             @"SMBACLEnabled" : @"SMBACLEnabled",
             @"tags" : @"Tags",
             @"validUserList" : @"ValidUserList",
             };
}

+ (NSValueTransformer *)objectACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLBucketOwnerFullControl);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLAwsExecRead);
        }
        return @(AWSStoragegatewayObjectACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewayObjectACLPrivate:
                return @"private";
            case AWSStoragegatewayObjectACLPublicRead:
                return @"public-read";
            case AWSStoragegatewayObjectACLPublicReadWrite:
                return @"public-read-write";
            case AWSStoragegatewayObjectACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSStoragegatewayObjectACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSStoragegatewayObjectACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSStoragegatewayObjectACLAwsExecRead:
                return @"aws-exec-read";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayCreateSMBFileShareOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             };
}

@end

@implementation AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotDescription" : @"SnapshotDescription",
             @"tags" : @"Tags",
             @"volumeARN" : @"VolumeARN",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotId" : @"SnapshotId",
             @"volumeARN" : @"VolumeARN",
             @"volumeRecoveryPointTime" : @"VolumeRecoveryPointTime",
             };
}

@end

@implementation AWSStoragegatewayCreateSnapshotInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotDescription" : @"SnapshotDescription",
             @"tags" : @"Tags",
             @"volumeARN" : @"VolumeARN",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayCreateSnapshotOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotId" : @"SnapshotId",
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSStoragegatewayCreateStorediSCSIVolumeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskId" : @"DiskId",
             @"gatewayARN" : @"GatewayARN",
             @"KMSEncrypted" : @"KMSEncrypted",
             @"KMSKey" : @"KMSKey",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"preserveExistingData" : @"PreserveExistingData",
             @"snapshotId" : @"SnapshotId",
             @"tags" : @"Tags",
             @"targetName" : @"TargetName",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayCreateStorediSCSIVolumeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetARN" : @"TargetARN",
             @"volumeARN" : @"VolumeARN",
             @"volumeSizeInBytes" : @"VolumeSizeInBytes",
             };
}

@end

@implementation AWSStoragegatewayCreateTapeWithBarcodeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"KMSEncrypted" : @"KMSEncrypted",
             @"KMSKey" : @"KMSKey",
             @"poolId" : @"PoolId",
             @"tags" : @"Tags",
             @"tapeBarcode" : @"TapeBarcode",
             @"tapeSizeInBytes" : @"TapeSizeInBytes",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayCreateTapeWithBarcodeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayCreateTapesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"gatewayARN" : @"GatewayARN",
             @"KMSEncrypted" : @"KMSEncrypted",
             @"KMSKey" : @"KMSKey",
             @"numTapesToCreate" : @"NumTapesToCreate",
             @"poolId" : @"PoolId",
             @"tags" : @"Tags",
             @"tapeBarcodePrefix" : @"TapeBarcodePrefix",
             @"tapeSizeInBytes" : @"TapeSizeInBytes",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayCreateTapesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARNs" : @"TapeARNs",
             };
}

@end

@implementation AWSStoragegatewayDeleteAutomaticTapeCreationPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteBandwidthRateLimitInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bandwidthType" : @"BandwidthType",
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteBandwidthRateLimitOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteChapCredentialsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initiatorName" : @"InitiatorName",
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteChapCredentialsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initiatorName" : @"InitiatorName",
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteFileShareInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             @"forceDelete" : @"ForceDelete",
             };
}

@end

@implementation AWSStoragegatewayDeleteFileShareOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteGatewayInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteGatewayOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteSnapshotScheduleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteSnapshotScheduleOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteTapeArchiveInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteTapeArchiveOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteTapeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteTapeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteVolumeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSStoragegatewayDeleteVolumeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSStoragegatewayDescribeAvailabilityMonitorTestInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDescribeAvailabilityMonitorTestOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLETE"] == NSOrderedSame) {
            return @(AWSStoragegatewayAvailabilityMonitorTestStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSStoragegatewayAvailabilityMonitorTestStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSStoragegatewayAvailabilityMonitorTestStatusPending);
        }
        return @(AWSStoragegatewayAvailabilityMonitorTestStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewayAvailabilityMonitorTestStatusComplete:
                return @"COMPLETE";
            case AWSStoragegatewayAvailabilityMonitorTestStatusFailed:
                return @"FAILED";
            case AWSStoragegatewayAvailabilityMonitorTestStatusPending:
                return @"PENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSStoragegatewayDescribeBandwidthRateLimitInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDescribeBandwidthRateLimitOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"averageDownloadRateLimitInBitsPerSec" : @"AverageDownloadRateLimitInBitsPerSec",
             @"averageUploadRateLimitInBitsPerSec" : @"AverageUploadRateLimitInBitsPerSec",
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDescribeCacheInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDescribeCacheOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheAllocatedInBytes" : @"CacheAllocatedInBytes",
             @"cacheDirtyPercentage" : @"CacheDirtyPercentage",
             @"cacheHitPercentage" : @"CacheHitPercentage",
             @"cacheMissPercentage" : @"CacheMissPercentage",
             @"cacheUsedPercentage" : @"CacheUsedPercentage",
             @"diskIds" : @"DiskIds",
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDescribeCachediSCSIVolumesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARNs" : @"VolumeARNs",
             };
}

@end

@implementation AWSStoragegatewayDescribeCachediSCSIVolumesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cachediSCSIVolumes" : @"CachediSCSIVolumes",
             };
}

+ (NSValueTransformer *)cachediSCSIVolumesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayCachediSCSIVolume class]];
}

@end

@implementation AWSStoragegatewayDescribeChapCredentialsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSStoragegatewayDescribeChapCredentialsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"chapCredentials" : @"ChapCredentials",
             };
}

+ (NSValueTransformer *)chapCredentialsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayChapInfo class]];
}

@end

@implementation AWSStoragegatewayDescribeGatewayInformationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDescribeGatewayInformationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogGroupARN" : @"CloudWatchLogGroupARN",
             @"ec2InstanceId" : @"Ec2InstanceId",
             @"ec2InstanceRegion" : @"Ec2InstanceRegion",
             @"endpointType" : @"EndpointType",
             @"gatewayARN" : @"GatewayARN",
             @"gatewayId" : @"GatewayId",
             @"gatewayName" : @"GatewayName",
             @"gatewayNetworkInterfaces" : @"GatewayNetworkInterfaces",
             @"gatewayState" : @"GatewayState",
             @"gatewayTimezone" : @"GatewayTimezone",
             @"gatewayType" : @"GatewayType",
             @"hostEnvironment" : @"HostEnvironment",
             @"lastSoftwareUpdate" : @"LastSoftwareUpdate",
             @"nextUpdateAvailabilityDate" : @"NextUpdateAvailabilityDate",
             @"tags" : @"Tags",
             @"VPCEndpoint" : @"VPCEndpoint",
             };
}

+ (NSValueTransformer *)gatewayNetworkInterfacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayNetworkInterface class]];
}

+ (NSValueTransformer *)hostEnvironmentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VMWARE"] == NSOrderedSame) {
            return @(AWSStoragegatewayHostEnvironmentVmware);
        }
        if ([value caseInsensitiveCompare:@"HYPER-V"] == NSOrderedSame) {
            return @(AWSStoragegatewayHostEnvironmentHyperV);
        }
        if ([value caseInsensitiveCompare:@"EC2"] == NSOrderedSame) {
            return @(AWSStoragegatewayHostEnvironmentEc2);
        }
        if ([value caseInsensitiveCompare:@"KVM"] == NSOrderedSame) {
            return @(AWSStoragegatewayHostEnvironmentKvm);
        }
        if ([value caseInsensitiveCompare:@"OTHER"] == NSOrderedSame) {
            return @(AWSStoragegatewayHostEnvironmentOther);
        }
        return @(AWSStoragegatewayHostEnvironmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewayHostEnvironmentVmware:
                return @"VMWARE";
            case AWSStoragegatewayHostEnvironmentHyperV:
                return @"HYPER-V";
            case AWSStoragegatewayHostEnvironmentEc2:
                return @"EC2";
            case AWSStoragegatewayHostEnvironmentKvm:
                return @"KVM";
            case AWSStoragegatewayHostEnvironmentOther:
                return @"OTHER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayDescribeMaintenanceStartTimeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDescribeMaintenanceStartTimeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dayOfMonth" : @"DayOfMonth",
             @"dayOfWeek" : @"DayOfWeek",
             @"gatewayARN" : @"GatewayARN",
             @"hourOfDay" : @"HourOfDay",
             @"minuteOfHour" : @"MinuteOfHour",
             @"timezone" : @"Timezone",
             };
}

@end

@implementation AWSStoragegatewayDescribeNFSFileSharesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARNList" : @"FileShareARNList",
             };
}

@end

@implementation AWSStoragegatewayDescribeNFSFileSharesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"NFSFileShareInfoList" : @"NFSFileShareInfoList",
             };
}

+ (NSValueTransformer *)NFSFileShareInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayNFSFileShareInfo class]];
}

@end

@implementation AWSStoragegatewayDescribeSMBFileSharesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARNList" : @"FileShareARNList",
             };
}

@end

@implementation AWSStoragegatewayDescribeSMBFileSharesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMBFileShareInfoList" : @"SMBFileShareInfoList",
             };
}

+ (NSValueTransformer *)SMBFileShareInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewaySMBFileShareInfo class]];
}

@end

@implementation AWSStoragegatewayDescribeSMBSettingsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDescribeSMBSettingsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeDirectoryStatus" : @"ActiveDirectoryStatus",
             @"domainName" : @"DomainName",
             @"gatewayARN" : @"GatewayARN",
             @"SMBGuestPasswordSet" : @"SMBGuestPasswordSet",
             @"SMBSecurityStrategy" : @"SMBSecurityStrategy",
             };
}

+ (NSValueTransformer *)activeDirectoryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"DETACHED"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusDetached);
        }
        if ([value caseInsensitiveCompare:@"JOINED"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusJoined);
        }
        if ([value caseInsensitiveCompare:@"JOINING"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusJoining);
        }
        if ([value caseInsensitiveCompare:@"NETWORK_ERROR"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusNetworkError);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusTimeout);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN_ERROR"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusUnknownError);
        }
        return @(AWSStoragegatewayActiveDirectoryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewayActiveDirectoryStatusAccessDenied:
                return @"ACCESS_DENIED";
            case AWSStoragegatewayActiveDirectoryStatusDetached:
                return @"DETACHED";
            case AWSStoragegatewayActiveDirectoryStatusJoined:
                return @"JOINED";
            case AWSStoragegatewayActiveDirectoryStatusJoining:
                return @"JOINING";
            case AWSStoragegatewayActiveDirectoryStatusNetworkError:
                return @"NETWORK_ERROR";
            case AWSStoragegatewayActiveDirectoryStatusTimeout:
                return @"TIMEOUT";
            case AWSStoragegatewayActiveDirectoryStatusUnknownError:
                return @"UNKNOWN_ERROR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)SMBSecurityStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ClientSpecified"] == NSOrderedSame) {
            return @(AWSStoragegatewaySMBSecurityStrategyClientSpecified);
        }
        if ([value caseInsensitiveCompare:@"MandatorySigning"] == NSOrderedSame) {
            return @(AWSStoragegatewaySMBSecurityStrategyMandatorySigning);
        }
        if ([value caseInsensitiveCompare:@"MandatoryEncryption"] == NSOrderedSame) {
            return @(AWSStoragegatewaySMBSecurityStrategyMandatoryEncryption);
        }
        return @(AWSStoragegatewaySMBSecurityStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewaySMBSecurityStrategyClientSpecified:
                return @"ClientSpecified";
            case AWSStoragegatewaySMBSecurityStrategyMandatorySigning:
                return @"MandatorySigning";
            case AWSStoragegatewaySMBSecurityStrategyMandatoryEncryption:
                return @"MandatoryEncryption";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSStoragegatewayDescribeSnapshotScheduleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSStoragegatewayDescribeSnapshotScheduleOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"recurrenceInHours" : @"RecurrenceInHours",
             @"startAt" : @"StartAt",
             @"tags" : @"Tags",
             @"timezone" : @"Timezone",
             @"volumeARN" : @"VolumeARN",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayDescribeStorediSCSIVolumesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARNs" : @"VolumeARNs",
             };
}

@end

@implementation AWSStoragegatewayDescribeStorediSCSIVolumesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"storediSCSIVolumes" : @"StorediSCSIVolumes",
             };
}

+ (NSValueTransformer *)storediSCSIVolumesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayStorediSCSIVolume class]];
}

@end

@implementation AWSStoragegatewayDescribeTapeArchivesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             @"tapeARNs" : @"TapeARNs",
             };
}

@end

@implementation AWSStoragegatewayDescribeTapeArchivesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"tapeArchives" : @"TapeArchives",
             };
}

+ (NSValueTransformer *)tapeArchivesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTapeArchive class]];
}

@end

@implementation AWSStoragegatewayDescribeTapeRecoveryPointsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSStoragegatewayDescribeTapeRecoveryPointsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"marker" : @"Marker",
             @"tapeRecoveryPointInfos" : @"TapeRecoveryPointInfos",
             };
}

+ (NSValueTransformer *)tapeRecoveryPointInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTapeRecoveryPointInfo class]];
}

@end

@implementation AWSStoragegatewayDescribeTapesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             @"tapeARNs" : @"TapeARNs",
             };
}

@end

@implementation AWSStoragegatewayDescribeTapesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"tapes" : @"Tapes",
             };
}

+ (NSValueTransformer *)tapesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTape class]];
}

@end

@implementation AWSStoragegatewayDescribeUploadBufferInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDescribeUploadBufferOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskIds" : @"DiskIds",
             @"gatewayARN" : @"GatewayARN",
             @"uploadBufferAllocatedInBytes" : @"UploadBufferAllocatedInBytes",
             @"uploadBufferUsedInBytes" : @"UploadBufferUsedInBytes",
             };
}

@end

@implementation AWSStoragegatewayDescribeVTLDevicesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             @"VTLDeviceARNs" : @"VTLDeviceARNs",
             };
}

@end

@implementation AWSStoragegatewayDescribeVTLDevicesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"marker" : @"Marker",
             @"VTLDevices" : @"VTLDevices",
             };
}

+ (NSValueTransformer *)VTLDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayVTLDevice class]];
}

@end

@implementation AWSStoragegatewayDescribeWorkingStorageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDescribeWorkingStorageOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskIds" : @"DiskIds",
             @"gatewayARN" : @"GatewayARN",
             @"workingStorageAllocatedInBytes" : @"WorkingStorageAllocatedInBytes",
             @"workingStorageUsedInBytes" : @"WorkingStorageUsedInBytes",
             };
}

@end

@implementation AWSStoragegatewayDetachVolumeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"forceDetach" : @"ForceDetach",
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSStoragegatewayDetachVolumeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSStoragegatewayDeviceiSCSIAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"chapEnabled" : @"ChapEnabled",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"networkInterfacePort" : @"NetworkInterfacePort",
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSStoragegatewayDisableGatewayInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDisableGatewayOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayDisk

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskAllocationResource" : @"DiskAllocationResource",
             @"diskAllocationType" : @"DiskAllocationType",
             @"diskAttributeList" : @"DiskAttributeList",
             @"diskId" : @"DiskId",
             @"diskNode" : @"DiskNode",
             @"diskPath" : @"DiskPath",
             @"diskSizeInBytes" : @"DiskSizeInBytes",
             @"diskStatus" : @"DiskStatus",
             };
}

@end

@implementation AWSStoragegatewayFileShareInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             @"fileShareId" : @"FileShareId",
             @"fileShareStatus" : @"FileShareStatus",
             @"fileShareType" : @"FileShareType",
             @"gatewayARN" : @"GatewayARN",
             };
}

+ (NSValueTransformer *)fileShareTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NFS"] == NSOrderedSame) {
            return @(AWSStoragegatewayFileShareTypeNfs);
        }
        if ([value caseInsensitiveCompare:@"SMB"] == NSOrderedSame) {
            return @(AWSStoragegatewayFileShareTypeSmb);
        }
        return @(AWSStoragegatewayFileShareTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewayFileShareTypeNfs:
                return @"NFS";
            case AWSStoragegatewayFileShareTypeSmb:
                return @"SMB";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSStoragegatewayGatewayInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ec2InstanceId" : @"Ec2InstanceId",
             @"ec2InstanceRegion" : @"Ec2InstanceRegion",
             @"gatewayARN" : @"GatewayARN",
             @"gatewayId" : @"GatewayId",
             @"gatewayName" : @"GatewayName",
             @"gatewayOperationalState" : @"GatewayOperationalState",
             @"gatewayType" : @"GatewayType",
             };
}

@end

@implementation AWSStoragegatewayJoinDomainInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainControllers" : @"DomainControllers",
             @"domainName" : @"DomainName",
             @"gatewayARN" : @"GatewayARN",
             @"organizationalUnit" : @"OrganizationalUnit",
             @"password" : @"Password",
             @"timeoutInSeconds" : @"TimeoutInSeconds",
             @"userName" : @"UserName",
             };
}

@end

@implementation AWSStoragegatewayJoinDomainOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeDirectoryStatus" : @"ActiveDirectoryStatus",
             @"gatewayARN" : @"GatewayARN",
             };
}

+ (NSValueTransformer *)activeDirectoryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"DETACHED"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusDetached);
        }
        if ([value caseInsensitiveCompare:@"JOINED"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusJoined);
        }
        if ([value caseInsensitiveCompare:@"JOINING"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusJoining);
        }
        if ([value caseInsensitiveCompare:@"NETWORK_ERROR"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusNetworkError);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusTimeout);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN_ERROR"] == NSOrderedSame) {
            return @(AWSStoragegatewayActiveDirectoryStatusUnknownError);
        }
        return @(AWSStoragegatewayActiveDirectoryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewayActiveDirectoryStatusAccessDenied:
                return @"ACCESS_DENIED";
            case AWSStoragegatewayActiveDirectoryStatusDetached:
                return @"DETACHED";
            case AWSStoragegatewayActiveDirectoryStatusJoined:
                return @"JOINED";
            case AWSStoragegatewayActiveDirectoryStatusJoining:
                return @"JOINING";
            case AWSStoragegatewayActiveDirectoryStatusNetworkError:
                return @"NETWORK_ERROR";
            case AWSStoragegatewayActiveDirectoryStatusTimeout:
                return @"TIMEOUT";
            case AWSStoragegatewayActiveDirectoryStatusUnknownError:
                return @"UNKNOWN_ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSStoragegatewayListAutomaticTapeCreationPoliciesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automaticTapeCreationPolicyInfos" : @"AutomaticTapeCreationPolicyInfos",
             };
}

+ (NSValueTransformer *)automaticTapeCreationPolicyInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayAutomaticTapeCreationPolicyInfo class]];
}

@end

@implementation AWSStoragegatewayListFileSharesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSStoragegatewayListFileSharesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareInfoList" : @"FileShareInfoList",
             @"marker" : @"Marker",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)fileShareInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayFileShareInfo class]];
}

@end

@implementation AWSStoragegatewayListGatewaysInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSStoragegatewayListGatewaysOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gateways" : @"Gateways",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)gatewaysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayGatewayInfo class]];
}

@end

@implementation AWSStoragegatewayListLocalDisksInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayListLocalDisksOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disks" : @"Disks",
             @"gatewayARN" : @"GatewayARN",
             };
}

+ (NSValueTransformer *)disksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayDisk class]];
}

@end

@implementation AWSStoragegatewayListTagsForResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSStoragegatewayListTagsForResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayListTapesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             @"tapeARNs" : @"TapeARNs",
             };
}

@end

@implementation AWSStoragegatewayListTapesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"tapeInfos" : @"TapeInfos",
             };
}

+ (NSValueTransformer *)tapeInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTapeInfo class]];
}

@end

@implementation AWSStoragegatewayListVolumeInitiatorsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSStoragegatewayListVolumeInitiatorsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initiators" : @"Initiators",
             };
}

@end

@implementation AWSStoragegatewayListVolumeRecoveryPointsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayListVolumeRecoveryPointsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"volumeRecoveryPointInfos" : @"VolumeRecoveryPointInfos",
             };
}

+ (NSValueTransformer *)volumeRecoveryPointInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayVolumeRecoveryPointInfo class]];
}

@end

@implementation AWSStoragegatewayListVolumesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSStoragegatewayListVolumesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"marker" : @"Marker",
             @"volumeInfos" : @"VolumeInfos",
             };
}

+ (NSValueTransformer *)volumeInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayVolumeInfo class]];
}

@end

@implementation AWSStoragegatewayNFSFileShareDefaults

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directoryMode" : @"DirectoryMode",
             @"fileMode" : @"FileMode",
             @"groupId" : @"GroupId",
             @"ownerId" : @"OwnerId",
             };
}

@end

@implementation AWSStoragegatewayNFSFileShareInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientList" : @"ClientList",
             @"defaultStorageClass" : @"DefaultStorageClass",
             @"fileShareARN" : @"FileShareARN",
             @"fileShareId" : @"FileShareId",
             @"fileShareStatus" : @"FileShareStatus",
             @"gatewayARN" : @"GatewayARN",
             @"guessMIMETypeEnabled" : @"GuessMIMETypeEnabled",
             @"KMSEncrypted" : @"KMSEncrypted",
             @"KMSKey" : @"KMSKey",
             @"locationARN" : @"LocationARN",
             @"NFSFileShareDefaults" : @"NFSFileShareDefaults",
             @"objectACL" : @"ObjectACL",
             @"path" : @"Path",
             @"readOnly" : @"ReadOnly",
             @"requesterPays" : @"RequesterPays",
             @"role" : @"Role",
             @"squash" : @"Squash",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)NFSFileShareDefaultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSStoragegatewayNFSFileShareDefaults class]];
}

+ (NSValueTransformer *)objectACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLBucketOwnerFullControl);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLAwsExecRead);
        }
        return @(AWSStoragegatewayObjectACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewayObjectACLPrivate:
                return @"private";
            case AWSStoragegatewayObjectACLPublicRead:
                return @"public-read";
            case AWSStoragegatewayObjectACLPublicReadWrite:
                return @"public-read-write";
            case AWSStoragegatewayObjectACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSStoragegatewayObjectACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSStoragegatewayObjectACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSStoragegatewayObjectACLAwsExecRead:
                return @"aws-exec-read";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayNetworkInterface

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipv4Address" : @"Ipv4Address",
             @"ipv6Address" : @"Ipv6Address",
             @"macAddress" : @"MacAddress",
             };
}

@end

@implementation AWSStoragegatewayNotifyWhenUploadedInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             };
}

@end

@implementation AWSStoragegatewayNotifyWhenUploadedOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             @"notificationId" : @"NotificationId",
             };
}

@end

@implementation AWSStoragegatewayRefreshCacheInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             @"folderList" : @"FolderList",
             @"recursive" : @"Recursive",
             };
}

@end

@implementation AWSStoragegatewayRefreshCacheOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             @"notificationId" : @"NotificationId",
             };
}

@end

@implementation AWSStoragegatewayRemoveTagsFromResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSStoragegatewayRemoveTagsFromResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSStoragegatewayResetCacheInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayResetCacheOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayRetrieveTapeArchiveInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayRetrieveTapeArchiveOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayRetrieveTapeRecoveryPointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewayRetrieveTapeRecoveryPointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSStoragegatewaySMBFileShareInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminUserList" : @"AdminUserList",
             @"auditDestinationARN" : @"AuditDestinationARN",
             @"authentication" : @"Authentication",
             @"defaultStorageClass" : @"DefaultStorageClass",
             @"fileShareARN" : @"FileShareARN",
             @"fileShareId" : @"FileShareId",
             @"fileShareStatus" : @"FileShareStatus",
             @"gatewayARN" : @"GatewayARN",
             @"guessMIMETypeEnabled" : @"GuessMIMETypeEnabled",
             @"invalidUserList" : @"InvalidUserList",
             @"KMSEncrypted" : @"KMSEncrypted",
             @"KMSKey" : @"KMSKey",
             @"locationARN" : @"LocationARN",
             @"objectACL" : @"ObjectACL",
             @"path" : @"Path",
             @"readOnly" : @"ReadOnly",
             @"requesterPays" : @"RequesterPays",
             @"role" : @"Role",
             @"SMBACLEnabled" : @"SMBACLEnabled",
             @"tags" : @"Tags",
             @"validUserList" : @"ValidUserList",
             };
}

+ (NSValueTransformer *)objectACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLBucketOwnerFullControl);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLAwsExecRead);
        }
        return @(AWSStoragegatewayObjectACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewayObjectACLPrivate:
                return @"private";
            case AWSStoragegatewayObjectACLPublicRead:
                return @"public-read";
            case AWSStoragegatewayObjectACLPublicReadWrite:
                return @"public-read-write";
            case AWSStoragegatewayObjectACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSStoragegatewayObjectACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSStoragegatewayObjectACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSStoragegatewayObjectACLAwsExecRead:
                return @"aws-exec-read";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewaySetLocalConsolePasswordInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"localConsolePassword" : @"LocalConsolePassword",
             };
}

@end

@implementation AWSStoragegatewaySetLocalConsolePasswordOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewaySetSMBGuestPasswordInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"password" : @"Password",
             };
}

@end

@implementation AWSStoragegatewaySetSMBGuestPasswordOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayShutdownGatewayInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayShutdownGatewayOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayStartAvailabilityMonitorTestInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayStartAvailabilityMonitorTestOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayStartGatewayInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayStartGatewayOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayStorageGatewayError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"errorCode",
             @"errorDetails" : @"errorDetails",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ActivationKeyExpired"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeActivationKeyExpired);
        }
        if ([value caseInsensitiveCompare:@"ActivationKeyInvalid"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeActivationKeyInvalid);
        }
        if ([value caseInsensitiveCompare:@"ActivationKeyNotFound"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeActivationKeyNotFound);
        }
        if ([value caseInsensitiveCompare:@"GatewayInternalError"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeGatewayInternalError);
        }
        if ([value caseInsensitiveCompare:@"GatewayNotConnected"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeGatewayNotConnected);
        }
        if ([value caseInsensitiveCompare:@"GatewayNotFound"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeGatewayNotFound);
        }
        if ([value caseInsensitiveCompare:@"GatewayProxyNetworkConnectionBusy"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeGatewayProxyNetworkConnectionBusy);
        }
        if ([value caseInsensitiveCompare:@"AuthenticationFailure"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeAuthenticationFailure);
        }
        if ([value caseInsensitiveCompare:@"BandwidthThrottleScheduleNotFound"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeBandwidthThrottleScheduleNotFound);
        }
        if ([value caseInsensitiveCompare:@"Blocked"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeBlocked);
        }
        if ([value caseInsensitiveCompare:@"CannotExportSnapshot"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeCannotExportSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ChapCredentialNotFound"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeChapCredentialNotFound);
        }
        if ([value caseInsensitiveCompare:@"DiskAlreadyAllocated"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeDiskAlreadyAllocated);
        }
        if ([value caseInsensitiveCompare:@"DiskDoesNotExist"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeDiskDoesNotExist);
        }
        if ([value caseInsensitiveCompare:@"DiskSizeGreaterThanVolumeMaxSize"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeDiskSizeGreaterThanVolumeMaxSize);
        }
        if ([value caseInsensitiveCompare:@"DiskSizeLessThanVolumeSize"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeDiskSizeLessThanVolumeSize);
        }
        if ([value caseInsensitiveCompare:@"DiskSizeNotGigAligned"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeDiskSizeNotGigAligned);
        }
        if ([value caseInsensitiveCompare:@"DuplicateCertificateInfo"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeDuplicateCertificateInfo);
        }
        if ([value caseInsensitiveCompare:@"DuplicateSchedule"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeDuplicateSchedule);
        }
        if ([value caseInsensitiveCompare:@"EndpointNotFound"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeEndpointNotFound);
        }
        if ([value caseInsensitiveCompare:@"IAMNotSupported"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeIAMNotSupported);
        }
        if ([value caseInsensitiveCompare:@"InitiatorInvalid"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeInitiatorInvalid);
        }
        if ([value caseInsensitiveCompare:@"InitiatorNotFound"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeInitiatorNotFound);
        }
        if ([value caseInsensitiveCompare:@"InternalError"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"InvalidGateway"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeInvalidGateway);
        }
        if ([value caseInsensitiveCompare:@"InvalidEndpoint"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeInvalidEndpoint);
        }
        if ([value caseInsensitiveCompare:@"InvalidParameters"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeInvalidParameters);
        }
        if ([value caseInsensitiveCompare:@"InvalidSchedule"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeInvalidSchedule);
        }
        if ([value caseInsensitiveCompare:@"LocalStorageLimitExceeded"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeLocalStorageLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"LunAlreadyAllocated "] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeLunAlreadyAllocated);
        }
        if ([value caseInsensitiveCompare:@"LunInvalid"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeLunInvalid);
        }
        if ([value caseInsensitiveCompare:@"JoinDomainInProgress"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeJoinDomainInProgress);
        }
        if ([value caseInsensitiveCompare:@"MaximumContentLengthExceeded"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeMaximumContentLengthExceeded);
        }
        if ([value caseInsensitiveCompare:@"MaximumTapeCartridgeCountExceeded"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeMaximumTapeCartridgeCountExceeded);
        }
        if ([value caseInsensitiveCompare:@"MaximumVolumeCountExceeded"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeMaximumVolumeCountExceeded);
        }
        if ([value caseInsensitiveCompare:@"NetworkConfigurationChanged"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeNetworkConfigurationChanged);
        }
        if ([value caseInsensitiveCompare:@"NoDisksAvailable"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeNoDisksAvailable);
        }
        if ([value caseInsensitiveCompare:@"NotImplemented"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeNotImplemented);
        }
        if ([value caseInsensitiveCompare:@"NotSupported"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeNotSupported);
        }
        if ([value caseInsensitiveCompare:@"OperationAborted"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeOperationAborted);
        }
        if ([value caseInsensitiveCompare:@"OutdatedGateway"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeOutdatedGateway);
        }
        if ([value caseInsensitiveCompare:@"ParametersNotImplemented"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeParametersNotImplemented);
        }
        if ([value caseInsensitiveCompare:@"RegionInvalid"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeRegionInvalid);
        }
        if ([value caseInsensitiveCompare:@"RequestTimeout"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeRequestTimeout);
        }
        if ([value caseInsensitiveCompare:@"ServiceUnavailable"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeServiceUnavailable);
        }
        if ([value caseInsensitiveCompare:@"SnapshotDeleted"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeSnapshotDeleted);
        }
        if ([value caseInsensitiveCompare:@"SnapshotIdInvalid"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeSnapshotIdInvalid);
        }
        if ([value caseInsensitiveCompare:@"SnapshotInProgress"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeSnapshotInProgress);
        }
        if ([value caseInsensitiveCompare:@"SnapshotNotFound"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeSnapshotNotFound);
        }
        if ([value caseInsensitiveCompare:@"SnapshotScheduleNotFound"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeSnapshotScheduleNotFound);
        }
        if ([value caseInsensitiveCompare:@"StagingAreaFull"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeStagingAreaFull);
        }
        if ([value caseInsensitiveCompare:@"StorageFailure"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeStorageFailure);
        }
        if ([value caseInsensitiveCompare:@"TapeCartridgeNotFound"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeTapeCartridgeNotFound);
        }
        if ([value caseInsensitiveCompare:@"TargetAlreadyExists"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeTargetAlreadyExists);
        }
        if ([value caseInsensitiveCompare:@"TargetInvalid"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeTargetInvalid);
        }
        if ([value caseInsensitiveCompare:@"TargetNotFound"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeTargetNotFound);
        }
        if ([value caseInsensitiveCompare:@"UnauthorizedOperation"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeUnauthorizedOperation);
        }
        if ([value caseInsensitiveCompare:@"VolumeAlreadyExists"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeVolumeAlreadyExists);
        }
        if ([value caseInsensitiveCompare:@"VolumeIdInvalid"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeVolumeIdInvalid);
        }
        if ([value caseInsensitiveCompare:@"VolumeInUse"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeVolumeInUse);
        }
        if ([value caseInsensitiveCompare:@"VolumeNotFound"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeVolumeNotFound);
        }
        if ([value caseInsensitiveCompare:@"VolumeNotReady"] == NSOrderedSame) {
            return @(AWSStoragegatewayErrorCodeVolumeNotReady);
        }
        return @(AWSStoragegatewayErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewayErrorCodeActivationKeyExpired:
                return @"ActivationKeyExpired";
            case AWSStoragegatewayErrorCodeActivationKeyInvalid:
                return @"ActivationKeyInvalid";
            case AWSStoragegatewayErrorCodeActivationKeyNotFound:
                return @"ActivationKeyNotFound";
            case AWSStoragegatewayErrorCodeGatewayInternalError:
                return @"GatewayInternalError";
            case AWSStoragegatewayErrorCodeGatewayNotConnected:
                return @"GatewayNotConnected";
            case AWSStoragegatewayErrorCodeGatewayNotFound:
                return @"GatewayNotFound";
            case AWSStoragegatewayErrorCodeGatewayProxyNetworkConnectionBusy:
                return @"GatewayProxyNetworkConnectionBusy";
            case AWSStoragegatewayErrorCodeAuthenticationFailure:
                return @"AuthenticationFailure";
            case AWSStoragegatewayErrorCodeBandwidthThrottleScheduleNotFound:
                return @"BandwidthThrottleScheduleNotFound";
            case AWSStoragegatewayErrorCodeBlocked:
                return @"Blocked";
            case AWSStoragegatewayErrorCodeCannotExportSnapshot:
                return @"CannotExportSnapshot";
            case AWSStoragegatewayErrorCodeChapCredentialNotFound:
                return @"ChapCredentialNotFound";
            case AWSStoragegatewayErrorCodeDiskAlreadyAllocated:
                return @"DiskAlreadyAllocated";
            case AWSStoragegatewayErrorCodeDiskDoesNotExist:
                return @"DiskDoesNotExist";
            case AWSStoragegatewayErrorCodeDiskSizeGreaterThanVolumeMaxSize:
                return @"DiskSizeGreaterThanVolumeMaxSize";
            case AWSStoragegatewayErrorCodeDiskSizeLessThanVolumeSize:
                return @"DiskSizeLessThanVolumeSize";
            case AWSStoragegatewayErrorCodeDiskSizeNotGigAligned:
                return @"DiskSizeNotGigAligned";
            case AWSStoragegatewayErrorCodeDuplicateCertificateInfo:
                return @"DuplicateCertificateInfo";
            case AWSStoragegatewayErrorCodeDuplicateSchedule:
                return @"DuplicateSchedule";
            case AWSStoragegatewayErrorCodeEndpointNotFound:
                return @"EndpointNotFound";
            case AWSStoragegatewayErrorCodeIAMNotSupported:
                return @"IAMNotSupported";
            case AWSStoragegatewayErrorCodeInitiatorInvalid:
                return @"InitiatorInvalid";
            case AWSStoragegatewayErrorCodeInitiatorNotFound:
                return @"InitiatorNotFound";
            case AWSStoragegatewayErrorCodeInternalError:
                return @"InternalError";
            case AWSStoragegatewayErrorCodeInvalidGateway:
                return @"InvalidGateway";
            case AWSStoragegatewayErrorCodeInvalidEndpoint:
                return @"InvalidEndpoint";
            case AWSStoragegatewayErrorCodeInvalidParameters:
                return @"InvalidParameters";
            case AWSStoragegatewayErrorCodeInvalidSchedule:
                return @"InvalidSchedule";
            case AWSStoragegatewayErrorCodeLocalStorageLimitExceeded:
                return @"LocalStorageLimitExceeded";
            case AWSStoragegatewayErrorCodeLunAlreadyAllocated:
                return @"LunAlreadyAllocated ";
            case AWSStoragegatewayErrorCodeLunInvalid:
                return @"LunInvalid";
            case AWSStoragegatewayErrorCodeJoinDomainInProgress:
                return @"JoinDomainInProgress";
            case AWSStoragegatewayErrorCodeMaximumContentLengthExceeded:
                return @"MaximumContentLengthExceeded";
            case AWSStoragegatewayErrorCodeMaximumTapeCartridgeCountExceeded:
                return @"MaximumTapeCartridgeCountExceeded";
            case AWSStoragegatewayErrorCodeMaximumVolumeCountExceeded:
                return @"MaximumVolumeCountExceeded";
            case AWSStoragegatewayErrorCodeNetworkConfigurationChanged:
                return @"NetworkConfigurationChanged";
            case AWSStoragegatewayErrorCodeNoDisksAvailable:
                return @"NoDisksAvailable";
            case AWSStoragegatewayErrorCodeNotImplemented:
                return @"NotImplemented";
            case AWSStoragegatewayErrorCodeNotSupported:
                return @"NotSupported";
            case AWSStoragegatewayErrorCodeOperationAborted:
                return @"OperationAborted";
            case AWSStoragegatewayErrorCodeOutdatedGateway:
                return @"OutdatedGateway";
            case AWSStoragegatewayErrorCodeParametersNotImplemented:
                return @"ParametersNotImplemented";
            case AWSStoragegatewayErrorCodeRegionInvalid:
                return @"RegionInvalid";
            case AWSStoragegatewayErrorCodeRequestTimeout:
                return @"RequestTimeout";
            case AWSStoragegatewayErrorCodeServiceUnavailable:
                return @"ServiceUnavailable";
            case AWSStoragegatewayErrorCodeSnapshotDeleted:
                return @"SnapshotDeleted";
            case AWSStoragegatewayErrorCodeSnapshotIdInvalid:
                return @"SnapshotIdInvalid";
            case AWSStoragegatewayErrorCodeSnapshotInProgress:
                return @"SnapshotInProgress";
            case AWSStoragegatewayErrorCodeSnapshotNotFound:
                return @"SnapshotNotFound";
            case AWSStoragegatewayErrorCodeSnapshotScheduleNotFound:
                return @"SnapshotScheduleNotFound";
            case AWSStoragegatewayErrorCodeStagingAreaFull:
                return @"StagingAreaFull";
            case AWSStoragegatewayErrorCodeStorageFailure:
                return @"StorageFailure";
            case AWSStoragegatewayErrorCodeTapeCartridgeNotFound:
                return @"TapeCartridgeNotFound";
            case AWSStoragegatewayErrorCodeTargetAlreadyExists:
                return @"TargetAlreadyExists";
            case AWSStoragegatewayErrorCodeTargetInvalid:
                return @"TargetInvalid";
            case AWSStoragegatewayErrorCodeTargetNotFound:
                return @"TargetNotFound";
            case AWSStoragegatewayErrorCodeUnauthorizedOperation:
                return @"UnauthorizedOperation";
            case AWSStoragegatewayErrorCodeVolumeAlreadyExists:
                return @"VolumeAlreadyExists";
            case AWSStoragegatewayErrorCodeVolumeIdInvalid:
                return @"VolumeIdInvalid";
            case AWSStoragegatewayErrorCodeVolumeInUse:
                return @"VolumeInUse";
            case AWSStoragegatewayErrorCodeVolumeNotFound:
                return @"VolumeNotFound";
            case AWSStoragegatewayErrorCodeVolumeNotReady:
                return @"VolumeNotReady";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSStoragegatewayStorediSCSIVolume

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdDate" : @"CreatedDate",
             @"KMSKey" : @"KMSKey",
             @"preservedExistingData" : @"PreservedExistingData",
             @"sourceSnapshotId" : @"SourceSnapshotId",
             @"targetName" : @"TargetName",
             @"volumeARN" : @"VolumeARN",
             @"volumeAttachmentStatus" : @"VolumeAttachmentStatus",
             @"volumeDiskId" : @"VolumeDiskId",
             @"volumeId" : @"VolumeId",
             @"volumeProgress" : @"VolumeProgress",
             @"volumeSizeInBytes" : @"VolumeSizeInBytes",
             @"volumeStatus" : @"VolumeStatus",
             @"volumeType" : @"VolumeType",
             @"volumeUsedInBytes" : @"VolumeUsedInBytes",
             @"volumeiSCSIAttributes" : @"VolumeiSCSIAttributes",
             };
}

+ (NSValueTransformer *)createdDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)volumeiSCSIAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSStoragegatewayVolumeiSCSIAttributes class]];
}

@end

@implementation AWSStoragegatewayTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSStoragegatewayTape

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"KMSKey" : @"KMSKey",
             @"poolId" : @"PoolId",
             @"progress" : @"Progress",
             @"tapeARN" : @"TapeARN",
             @"tapeBarcode" : @"TapeBarcode",
             @"tapeCreatedDate" : @"TapeCreatedDate",
             @"tapeSizeInBytes" : @"TapeSizeInBytes",
             @"tapeStatus" : @"TapeStatus",
             @"tapeUsedInBytes" : @"TapeUsedInBytes",
             @"VTLDevice" : @"VTLDevice",
             };
}

+ (NSValueTransformer *)tapeCreatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSStoragegatewayTapeArchive

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"completionTime" : @"CompletionTime",
             @"KMSKey" : @"KMSKey",
             @"poolId" : @"PoolId",
             @"retrievedTo" : @"RetrievedTo",
             @"tapeARN" : @"TapeARN",
             @"tapeBarcode" : @"TapeBarcode",
             @"tapeCreatedDate" : @"TapeCreatedDate",
             @"tapeSizeInBytes" : @"TapeSizeInBytes",
             @"tapeStatus" : @"TapeStatus",
             @"tapeUsedInBytes" : @"TapeUsedInBytes",
             };
}

+ (NSValueTransformer *)completionTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)tapeCreatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSStoragegatewayTapeInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"poolId" : @"PoolId",
             @"tapeARN" : @"TapeARN",
             @"tapeBarcode" : @"TapeBarcode",
             @"tapeSizeInBytes" : @"TapeSizeInBytes",
             @"tapeStatus" : @"TapeStatus",
             };
}

@end

@implementation AWSStoragegatewayTapeRecoveryPointInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             @"tapeRecoveryPointTime" : @"TapeRecoveryPointTime",
             @"tapeSizeInBytes" : @"TapeSizeInBytes",
             @"tapeStatus" : @"TapeStatus",
             };
}

+ (NSValueTransformer *)tapeRecoveryPointTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSStoragegatewayUpdateAutomaticTapeCreationPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automaticTapeCreationRules" : @"AutomaticTapeCreationRules",
             @"gatewayARN" : @"GatewayARN",
             };
}

+ (NSValueTransformer *)automaticTapeCreationRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayAutomaticTapeCreationRule class]];
}

@end

@implementation AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayUpdateBandwidthRateLimitInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"averageDownloadRateLimitInBitsPerSec" : @"AverageDownloadRateLimitInBitsPerSec",
             @"averageUploadRateLimitInBitsPerSec" : @"AverageUploadRateLimitInBitsPerSec",
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayUpdateBandwidthRateLimitOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayUpdateChapCredentialsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initiatorName" : @"InitiatorName",
             @"secretToAuthenticateInitiator" : @"SecretToAuthenticateInitiator",
             @"secretToAuthenticateTarget" : @"SecretToAuthenticateTarget",
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSStoragegatewayUpdateChapCredentialsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initiatorName" : @"InitiatorName",
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSStoragegatewayUpdateGatewayInformationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogGroupARN" : @"CloudWatchLogGroupARN",
             @"gatewayARN" : @"GatewayARN",
             @"gatewayName" : @"GatewayName",
             @"gatewayTimezone" : @"GatewayTimezone",
             };
}

@end

@implementation AWSStoragegatewayUpdateGatewayInformationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"gatewayName" : @"GatewayName",
             };
}

@end

@implementation AWSStoragegatewayUpdateGatewaySoftwareNowInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayUpdateGatewaySoftwareNowOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayUpdateMaintenanceStartTimeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dayOfMonth" : @"DayOfMonth",
             @"dayOfWeek" : @"DayOfWeek",
             @"gatewayARN" : @"GatewayARN",
             @"hourOfDay" : @"HourOfDay",
             @"minuteOfHour" : @"MinuteOfHour",
             };
}

@end

@implementation AWSStoragegatewayUpdateMaintenanceStartTimeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayUpdateNFSFileShareInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientList" : @"ClientList",
             @"defaultStorageClass" : @"DefaultStorageClass",
             @"fileShareARN" : @"FileShareARN",
             @"guessMIMETypeEnabled" : @"GuessMIMETypeEnabled",
             @"KMSEncrypted" : @"KMSEncrypted",
             @"KMSKey" : @"KMSKey",
             @"NFSFileShareDefaults" : @"NFSFileShareDefaults",
             @"objectACL" : @"ObjectACL",
             @"readOnly" : @"ReadOnly",
             @"requesterPays" : @"RequesterPays",
             @"squash" : @"Squash",
             };
}

+ (NSValueTransformer *)NFSFileShareDefaultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSStoragegatewayNFSFileShareDefaults class]];
}

+ (NSValueTransformer *)objectACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLBucketOwnerFullControl);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLAwsExecRead);
        }
        return @(AWSStoragegatewayObjectACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewayObjectACLPrivate:
                return @"private";
            case AWSStoragegatewayObjectACLPublicRead:
                return @"public-read";
            case AWSStoragegatewayObjectACLPublicReadWrite:
                return @"public-read-write";
            case AWSStoragegatewayObjectACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSStoragegatewayObjectACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSStoragegatewayObjectACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSStoragegatewayObjectACLAwsExecRead:
                return @"aws-exec-read";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSStoragegatewayUpdateNFSFileShareOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             };
}

@end

@implementation AWSStoragegatewayUpdateSMBFileShareInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminUserList" : @"AdminUserList",
             @"auditDestinationARN" : @"AuditDestinationARN",
             @"defaultStorageClass" : @"DefaultStorageClass",
             @"fileShareARN" : @"FileShareARN",
             @"guessMIMETypeEnabled" : @"GuessMIMETypeEnabled",
             @"invalidUserList" : @"InvalidUserList",
             @"KMSEncrypted" : @"KMSEncrypted",
             @"KMSKey" : @"KMSKey",
             @"objectACL" : @"ObjectACL",
             @"readOnly" : @"ReadOnly",
             @"requesterPays" : @"RequesterPays",
             @"SMBACLEnabled" : @"SMBACLEnabled",
             @"validUserList" : @"ValidUserList",
             };
}

+ (NSValueTransformer *)objectACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLBucketOwnerFullControl);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSStoragegatewayObjectACLAwsExecRead);
        }
        return @(AWSStoragegatewayObjectACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewayObjectACLPrivate:
                return @"private";
            case AWSStoragegatewayObjectACLPublicRead:
                return @"public-read";
            case AWSStoragegatewayObjectACLPublicReadWrite:
                return @"public-read-write";
            case AWSStoragegatewayObjectACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSStoragegatewayObjectACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSStoragegatewayObjectACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSStoragegatewayObjectACLAwsExecRead:
                return @"aws-exec-read";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSStoragegatewayUpdateSMBFileShareOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             };
}

@end

@implementation AWSStoragegatewayUpdateSMBSecurityStrategyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"SMBSecurityStrategy" : @"SMBSecurityStrategy",
             };
}

+ (NSValueTransformer *)SMBSecurityStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ClientSpecified"] == NSOrderedSame) {
            return @(AWSStoragegatewaySMBSecurityStrategyClientSpecified);
        }
        if ([value caseInsensitiveCompare:@"MandatorySigning"] == NSOrderedSame) {
            return @(AWSStoragegatewaySMBSecurityStrategyMandatorySigning);
        }
        if ([value caseInsensitiveCompare:@"MandatoryEncryption"] == NSOrderedSame) {
            return @(AWSStoragegatewaySMBSecurityStrategyMandatoryEncryption);
        }
        return @(AWSStoragegatewaySMBSecurityStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSStoragegatewaySMBSecurityStrategyClientSpecified:
                return @"ClientSpecified";
            case AWSStoragegatewaySMBSecurityStrategyMandatorySigning:
                return @"MandatorySigning";
            case AWSStoragegatewaySMBSecurityStrategyMandatoryEncryption:
                return @"MandatoryEncryption";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSStoragegatewayUpdateSMBSecurityStrategyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSStoragegatewayUpdateSnapshotScheduleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"recurrenceInHours" : @"RecurrenceInHours",
             @"startAt" : @"StartAt",
             @"tags" : @"Tags",
             @"volumeARN" : @"VolumeARN",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSStoragegatewayTag class]];
}

@end

@implementation AWSStoragegatewayUpdateSnapshotScheduleOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSStoragegatewayUpdateVTLDeviceTypeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceType" : @"DeviceType",
             @"VTLDeviceARN" : @"VTLDeviceARN",
             };
}

@end

@implementation AWSStoragegatewayUpdateVTLDeviceTypeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"VTLDeviceARN" : @"VTLDeviceARN",
             };
}

@end

@implementation AWSStoragegatewayVTLDevice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceiSCSIAttributes" : @"DeviceiSCSIAttributes",
             @"VTLDeviceARN" : @"VTLDeviceARN",
             @"VTLDeviceProductIdentifier" : @"VTLDeviceProductIdentifier",
             @"VTLDeviceType" : @"VTLDeviceType",
             @"VTLDeviceVendor" : @"VTLDeviceVendor",
             };
}

+ (NSValueTransformer *)deviceiSCSIAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSStoragegatewayDeviceiSCSIAttributes class]];
}

@end

@implementation AWSStoragegatewayVolumeInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"gatewayId" : @"GatewayId",
             @"volumeARN" : @"VolumeARN",
             @"volumeAttachmentStatus" : @"VolumeAttachmentStatus",
             @"volumeId" : @"VolumeId",
             @"volumeSizeInBytes" : @"VolumeSizeInBytes",
             @"volumeType" : @"VolumeType",
             };
}

@end

@implementation AWSStoragegatewayVolumeRecoveryPointInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             @"volumeRecoveryPointTime" : @"VolumeRecoveryPointTime",
             @"volumeSizeInBytes" : @"VolumeSizeInBytes",
             @"volumeUsageInBytes" : @"VolumeUsageInBytes",
             };
}

@end

@implementation AWSStoragegatewayVolumeiSCSIAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"chapEnabled" : @"ChapEnabled",
             @"lunNumber" : @"LunNumber",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"networkInterfacePort" : @"NetworkInterfacePort",
             @"targetARN" : @"TargetARN",
             };
}

@end
