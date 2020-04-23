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

#import "AWSstoragegatewayModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSstoragegatewayErrorDomain = @"com.amazonaws.AWSstoragegatewayErrorDomain";

@implementation AWSstoragegatewayActivateGatewayInput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayActivateGatewayOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayAddCacheInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskIds" : @"DiskIds",
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayAddCacheOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayAddTagsToResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayAddTagsToResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSstoragegatewayAddUploadBufferInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskIds" : @"DiskIds",
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayAddUploadBufferOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayAddWorkingStorageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskIds" : @"DiskIds",
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayAddWorkingStorageOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayAssignTapePoolInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"poolId" : @"PoolId",
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayAssignTapePoolOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayAttachVolumeInput

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

@implementation AWSstoragegatewayAttachVolumeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetARN" : @"TargetARN",
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSstoragegatewayAutomaticTapeCreationPolicyInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automaticTapeCreationRules" : @"AutomaticTapeCreationRules",
             @"gatewayARN" : @"GatewayARN",
             };
}

+ (NSValueTransformer *)automaticTapeCreationRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayAutomaticTapeCreationRule class]];
}

@end

@implementation AWSstoragegatewayAutomaticTapeCreationRule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"minimumNumTapes" : @"MinimumNumTapes",
             @"poolId" : @"PoolId",
             @"tapeBarcodePrefix" : @"TapeBarcodePrefix",
             @"tapeSizeInBytes" : @"TapeSizeInBytes",
             };
}

@end

@implementation AWSstoragegatewayCachediSCSIVolume

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSstoragegatewayVolumeiSCSIAttributes class]];
}

@end

@implementation AWSstoragegatewayCancelArchivalInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayCancelArchivalOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayCancelRetrievalInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayCancelRetrievalOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayChapInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initiatorName" : @"InitiatorName",
             @"secretToAuthenticateInitiator" : @"SecretToAuthenticateInitiator",
             @"secretToAuthenticateTarget" : @"SecretToAuthenticateTarget",
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSstoragegatewayCreateCachediSCSIVolumeInput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayCreateCachediSCSIVolumeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetARN" : @"TargetARN",
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSstoragegatewayCreateNFSFileShareInput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSstoragegatewayNFSFileShareDefaults class]];
}

+ (NSValueTransformer *)objectACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLBucketOwnerFullControl);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLAwsExecRead);
        }
        return @(AWSstoragegatewayObjectACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewayObjectACLPrivate:
                return @"private";
            case AWSstoragegatewayObjectACLPublicRead:
                return @"public-read";
            case AWSstoragegatewayObjectACLPublicReadWrite:
                return @"public-read-write";
            case AWSstoragegatewayObjectACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSstoragegatewayObjectACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSstoragegatewayObjectACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSstoragegatewayObjectACLAwsExecRead:
                return @"aws-exec-read";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayCreateNFSFileShareOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             };
}

@end

@implementation AWSstoragegatewayCreateSMBFileShareInput

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
            return @(AWSstoragegatewayObjectACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLBucketOwnerFullControl);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLAwsExecRead);
        }
        return @(AWSstoragegatewayObjectACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewayObjectACLPrivate:
                return @"private";
            case AWSstoragegatewayObjectACLPublicRead:
                return @"public-read";
            case AWSstoragegatewayObjectACLPublicReadWrite:
                return @"public-read-write";
            case AWSstoragegatewayObjectACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSstoragegatewayObjectACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSstoragegatewayObjectACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSstoragegatewayObjectACLAwsExecRead:
                return @"aws-exec-read";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayCreateSMBFileShareOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             };
}

@end

@implementation AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotDescription" : @"SnapshotDescription",
             @"tags" : @"Tags",
             @"volumeARN" : @"VolumeARN",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotId" : @"SnapshotId",
             @"volumeARN" : @"VolumeARN",
             @"volumeRecoveryPointTime" : @"VolumeRecoveryPointTime",
             };
}

@end

@implementation AWSstoragegatewayCreateSnapshotInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotDescription" : @"SnapshotDescription",
             @"tags" : @"Tags",
             @"volumeARN" : @"VolumeARN",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayCreateSnapshotOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotId" : @"SnapshotId",
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSstoragegatewayCreateStorediSCSIVolumeInput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayCreateStorediSCSIVolumeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetARN" : @"TargetARN",
             @"volumeARN" : @"VolumeARN",
             @"volumeSizeInBytes" : @"VolumeSizeInBytes",
             };
}

@end

@implementation AWSstoragegatewayCreateTapeWithBarcodeInput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayCreateTapeWithBarcodeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayCreateTapesInput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayCreateTapesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARNs" : @"TapeARNs",
             };
}

@end

@implementation AWSstoragegatewayDeleteAutomaticTapeCreationPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteAutomaticTapeCreationPolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteBandwidthRateLimitInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bandwidthType" : @"BandwidthType",
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteBandwidthRateLimitOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteChapCredentialsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initiatorName" : @"InitiatorName",
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteChapCredentialsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initiatorName" : @"InitiatorName",
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteFileShareInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             @"forceDelete" : @"ForceDelete",
             };
}

@end

@implementation AWSstoragegatewayDeleteFileShareOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteGatewayInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteGatewayOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteSnapshotScheduleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteSnapshotScheduleOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteTapeArchiveInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteTapeArchiveOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteTapeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteTapeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteVolumeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSstoragegatewayDeleteVolumeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSstoragegatewayDescribeAvailabilityMonitorTestInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDescribeAvailabilityMonitorTestOutput

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
            return @(AWSstoragegatewayAvailabilityMonitorTestStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSstoragegatewayAvailabilityMonitorTestStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSstoragegatewayAvailabilityMonitorTestStatusPending);
        }
        return @(AWSstoragegatewayAvailabilityMonitorTestStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewayAvailabilityMonitorTestStatusComplete:
                return @"COMPLETE";
            case AWSstoragegatewayAvailabilityMonitorTestStatusFailed:
                return @"FAILED";
            case AWSstoragegatewayAvailabilityMonitorTestStatusPending:
                return @"PENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSstoragegatewayDescribeBandwidthRateLimitInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDescribeBandwidthRateLimitOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"averageDownloadRateLimitInBitsPerSec" : @"AverageDownloadRateLimitInBitsPerSec",
             @"averageUploadRateLimitInBitsPerSec" : @"AverageUploadRateLimitInBitsPerSec",
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDescribeCacheInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDescribeCacheOutput

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

@implementation AWSstoragegatewayDescribeCachediSCSIVolumesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARNs" : @"VolumeARNs",
             };
}

@end

@implementation AWSstoragegatewayDescribeCachediSCSIVolumesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cachediSCSIVolumes" : @"CachediSCSIVolumes",
             };
}

+ (NSValueTransformer *)cachediSCSIVolumesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayCachediSCSIVolume class]];
}

@end

@implementation AWSstoragegatewayDescribeChapCredentialsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSstoragegatewayDescribeChapCredentialsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"chapCredentials" : @"ChapCredentials",
             };
}

+ (NSValueTransformer *)chapCredentialsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayChapInfo class]];
}

@end

@implementation AWSstoragegatewayDescribeGatewayInformationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDescribeGatewayInformationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogGroupARN" : @"CloudWatchLogGroupARN",
             @"ec2InstanceId" : @"Ec2InstanceId",
             @"ec2InstanceRegion" : @"Ec2InstanceRegion",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayNetworkInterface class]];
}

+ (NSValueTransformer *)hostEnvironmentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VMWARE"] == NSOrderedSame) {
            return @(AWSstoragegatewayHostEnvironmentVmware);
        }
        if ([value caseInsensitiveCompare:@"HYPER-V"] == NSOrderedSame) {
            return @(AWSstoragegatewayHostEnvironmentHyperV);
        }
        if ([value caseInsensitiveCompare:@"EC2"] == NSOrderedSame) {
            return @(AWSstoragegatewayHostEnvironmentEc2);
        }
        if ([value caseInsensitiveCompare:@"KVM"] == NSOrderedSame) {
            return @(AWSstoragegatewayHostEnvironmentKvm);
        }
        if ([value caseInsensitiveCompare:@"OTHER"] == NSOrderedSame) {
            return @(AWSstoragegatewayHostEnvironmentOther);
        }
        return @(AWSstoragegatewayHostEnvironmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewayHostEnvironmentVmware:
                return @"VMWARE";
            case AWSstoragegatewayHostEnvironmentHyperV:
                return @"HYPER-V";
            case AWSstoragegatewayHostEnvironmentEc2:
                return @"EC2";
            case AWSstoragegatewayHostEnvironmentKvm:
                return @"KVM";
            case AWSstoragegatewayHostEnvironmentOther:
                return @"OTHER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayDescribeMaintenanceStartTimeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDescribeMaintenanceStartTimeOutput

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

@implementation AWSstoragegatewayDescribeNFSFileSharesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARNList" : @"FileShareARNList",
             };
}

@end

@implementation AWSstoragegatewayDescribeNFSFileSharesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"NFSFileShareInfoList" : @"NFSFileShareInfoList",
             };
}

+ (NSValueTransformer *)NFSFileShareInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayNFSFileShareInfo class]];
}

@end

@implementation AWSstoragegatewayDescribeSMBFileSharesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARNList" : @"FileShareARNList",
             };
}

@end

@implementation AWSstoragegatewayDescribeSMBFileSharesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMBFileShareInfoList" : @"SMBFileShareInfoList",
             };
}

+ (NSValueTransformer *)SMBFileShareInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewaySMBFileShareInfo class]];
}

@end

@implementation AWSstoragegatewayDescribeSMBSettingsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDescribeSMBSettingsOutput

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
            return @(AWSstoragegatewayActiveDirectoryStatusAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"DETACHED"] == NSOrderedSame) {
            return @(AWSstoragegatewayActiveDirectoryStatusDetached);
        }
        if ([value caseInsensitiveCompare:@"JOINED"] == NSOrderedSame) {
            return @(AWSstoragegatewayActiveDirectoryStatusJoined);
        }
        if ([value caseInsensitiveCompare:@"JOINING"] == NSOrderedSame) {
            return @(AWSstoragegatewayActiveDirectoryStatusJoining);
        }
        if ([value caseInsensitiveCompare:@"NETWORK_ERROR"] == NSOrderedSame) {
            return @(AWSstoragegatewayActiveDirectoryStatusNetworkError);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSstoragegatewayActiveDirectoryStatusTimeout);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN_ERROR"] == NSOrderedSame) {
            return @(AWSstoragegatewayActiveDirectoryStatusUnknownError);
        }
        return @(AWSstoragegatewayActiveDirectoryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewayActiveDirectoryStatusAccessDenied:
                return @"ACCESS_DENIED";
            case AWSstoragegatewayActiveDirectoryStatusDetached:
                return @"DETACHED";
            case AWSstoragegatewayActiveDirectoryStatusJoined:
                return @"JOINED";
            case AWSstoragegatewayActiveDirectoryStatusJoining:
                return @"JOINING";
            case AWSstoragegatewayActiveDirectoryStatusNetworkError:
                return @"NETWORK_ERROR";
            case AWSstoragegatewayActiveDirectoryStatusTimeout:
                return @"TIMEOUT";
            case AWSstoragegatewayActiveDirectoryStatusUnknownError:
                return @"UNKNOWN_ERROR";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)SMBSecurityStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ClientSpecified"] == NSOrderedSame) {
            return @(AWSstoragegatewaySMBSecurityStrategyClientSpecified);
        }
        if ([value caseInsensitiveCompare:@"MandatorySigning"] == NSOrderedSame) {
            return @(AWSstoragegatewaySMBSecurityStrategyMandatorySigning);
        }
        if ([value caseInsensitiveCompare:@"MandatoryEncryption"] == NSOrderedSame) {
            return @(AWSstoragegatewaySMBSecurityStrategyMandatoryEncryption);
        }
        return @(AWSstoragegatewaySMBSecurityStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewaySMBSecurityStrategyClientSpecified:
                return @"ClientSpecified";
            case AWSstoragegatewaySMBSecurityStrategyMandatorySigning:
                return @"MandatorySigning";
            case AWSstoragegatewaySMBSecurityStrategyMandatoryEncryption:
                return @"MandatoryEncryption";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSstoragegatewayDescribeSnapshotScheduleInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSstoragegatewayDescribeSnapshotScheduleOutput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayDescribeStorediSCSIVolumesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARNs" : @"VolumeARNs",
             };
}

@end

@implementation AWSstoragegatewayDescribeStorediSCSIVolumesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"storediSCSIVolumes" : @"StorediSCSIVolumes",
             };
}

+ (NSValueTransformer *)storediSCSIVolumesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayStorediSCSIVolume class]];
}

@end

@implementation AWSstoragegatewayDescribeTapeArchivesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             @"tapeARNs" : @"TapeARNs",
             };
}

@end

@implementation AWSstoragegatewayDescribeTapeArchivesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"tapeArchives" : @"TapeArchives",
             };
}

+ (NSValueTransformer *)tapeArchivesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTapeArchive class]];
}

@end

@implementation AWSstoragegatewayDescribeTapeRecoveryPointsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSstoragegatewayDescribeTapeRecoveryPointsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"marker" : @"Marker",
             @"tapeRecoveryPointInfos" : @"TapeRecoveryPointInfos",
             };
}

+ (NSValueTransformer *)tapeRecoveryPointInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTapeRecoveryPointInfo class]];
}

@end

@implementation AWSstoragegatewayDescribeTapesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             @"tapeARNs" : @"TapeARNs",
             };
}

@end

@implementation AWSstoragegatewayDescribeTapesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"tapes" : @"Tapes",
             };
}

+ (NSValueTransformer *)tapesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTape class]];
}

@end

@implementation AWSstoragegatewayDescribeUploadBufferInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDescribeUploadBufferOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskIds" : @"DiskIds",
             @"gatewayARN" : @"GatewayARN",
             @"uploadBufferAllocatedInBytes" : @"UploadBufferAllocatedInBytes",
             @"uploadBufferUsedInBytes" : @"UploadBufferUsedInBytes",
             };
}

@end

@implementation AWSstoragegatewayDescribeVTLDevicesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             @"VTLDeviceARNs" : @"VTLDeviceARNs",
             };
}

@end

@implementation AWSstoragegatewayDescribeVTLDevicesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"marker" : @"Marker",
             @"VTLDevices" : @"VTLDevices",
             };
}

+ (NSValueTransformer *)VTLDevicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayVTLDevice class]];
}

@end

@implementation AWSstoragegatewayDescribeWorkingStorageInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDescribeWorkingStorageOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"diskIds" : @"DiskIds",
             @"gatewayARN" : @"GatewayARN",
             @"workingStorageAllocatedInBytes" : @"WorkingStorageAllocatedInBytes",
             @"workingStorageUsedInBytes" : @"WorkingStorageUsedInBytes",
             };
}

@end

@implementation AWSstoragegatewayDetachVolumeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"forceDetach" : @"ForceDetach",
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSstoragegatewayDetachVolumeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSstoragegatewayDeviceiSCSIAttributes

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"chapEnabled" : @"ChapEnabled",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"networkInterfacePort" : @"NetworkInterfacePort",
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSstoragegatewayDisableGatewayInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDisableGatewayOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayDisk

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

@implementation AWSstoragegatewayFileShareInfo

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
            return @(AWSstoragegatewayFileShareTypeNfs);
        }
        if ([value caseInsensitiveCompare:@"SMB"] == NSOrderedSame) {
            return @(AWSstoragegatewayFileShareTypeSmb);
        }
        return @(AWSstoragegatewayFileShareTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewayFileShareTypeNfs:
                return @"NFS";
            case AWSstoragegatewayFileShareTypeSmb:
                return @"SMB";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSstoragegatewayGatewayInfo

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

@implementation AWSstoragegatewayJoinDomainInput

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

@implementation AWSstoragegatewayJoinDomainOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeDirectoryStatus" : @"ActiveDirectoryStatus",
             @"gatewayARN" : @"GatewayARN",
             };
}

+ (NSValueTransformer *)activeDirectoryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCESS_DENIED"] == NSOrderedSame) {
            return @(AWSstoragegatewayActiveDirectoryStatusAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"DETACHED"] == NSOrderedSame) {
            return @(AWSstoragegatewayActiveDirectoryStatusDetached);
        }
        if ([value caseInsensitiveCompare:@"JOINED"] == NSOrderedSame) {
            return @(AWSstoragegatewayActiveDirectoryStatusJoined);
        }
        if ([value caseInsensitiveCompare:@"JOINING"] == NSOrderedSame) {
            return @(AWSstoragegatewayActiveDirectoryStatusJoining);
        }
        if ([value caseInsensitiveCompare:@"NETWORK_ERROR"] == NSOrderedSame) {
            return @(AWSstoragegatewayActiveDirectoryStatusNetworkError);
        }
        if ([value caseInsensitiveCompare:@"TIMEOUT"] == NSOrderedSame) {
            return @(AWSstoragegatewayActiveDirectoryStatusTimeout);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN_ERROR"] == NSOrderedSame) {
            return @(AWSstoragegatewayActiveDirectoryStatusUnknownError);
        }
        return @(AWSstoragegatewayActiveDirectoryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewayActiveDirectoryStatusAccessDenied:
                return @"ACCESS_DENIED";
            case AWSstoragegatewayActiveDirectoryStatusDetached:
                return @"DETACHED";
            case AWSstoragegatewayActiveDirectoryStatusJoined:
                return @"JOINED";
            case AWSstoragegatewayActiveDirectoryStatusJoining:
                return @"JOINING";
            case AWSstoragegatewayActiveDirectoryStatusNetworkError:
                return @"NETWORK_ERROR";
            case AWSstoragegatewayActiveDirectoryStatusTimeout:
                return @"TIMEOUT";
            case AWSstoragegatewayActiveDirectoryStatusUnknownError:
                return @"UNKNOWN_ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSstoragegatewayListAutomaticTapeCreationPoliciesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayListAutomaticTapeCreationPoliciesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automaticTapeCreationPolicyInfos" : @"AutomaticTapeCreationPolicyInfos",
             };
}

+ (NSValueTransformer *)automaticTapeCreationPolicyInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayAutomaticTapeCreationPolicyInfo class]];
}

@end

@implementation AWSstoragegatewayListFileSharesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSstoragegatewayListFileSharesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareInfoList" : @"FileShareInfoList",
             @"marker" : @"Marker",
             @"nextMarker" : @"NextMarker",
             };
}

+ (NSValueTransformer *)fileShareInfoListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayFileShareInfo class]];
}

@end

@implementation AWSstoragegatewayListGatewaysInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSstoragegatewayListGatewaysOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gateways" : @"Gateways",
             @"marker" : @"Marker",
             };
}

+ (NSValueTransformer *)gatewaysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayGatewayInfo class]];
}

@end

@implementation AWSstoragegatewayListLocalDisksInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayListLocalDisksOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disks" : @"Disks",
             @"gatewayARN" : @"GatewayARN",
             };
}

+ (NSValueTransformer *)disksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayDisk class]];
}

@end

@implementation AWSstoragegatewayListTagsForResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSstoragegatewayListTagsForResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayListTapesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             @"tapeARNs" : @"TapeARNs",
             };
}

@end

@implementation AWSstoragegatewayListTapesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"tapeInfos" : @"TapeInfos",
             };
}

+ (NSValueTransformer *)tapeInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTapeInfo class]];
}

@end

@implementation AWSstoragegatewayListVolumeInitiatorsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSstoragegatewayListVolumeInitiatorsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initiators" : @"Initiators",
             };
}

@end

@implementation AWSstoragegatewayListVolumeRecoveryPointsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayListVolumeRecoveryPointsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"volumeRecoveryPointInfos" : @"VolumeRecoveryPointInfos",
             };
}

+ (NSValueTransformer *)volumeRecoveryPointInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayVolumeRecoveryPointInfo class]];
}

@end

@implementation AWSstoragegatewayListVolumesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"limit" : @"Limit",
             @"marker" : @"Marker",
             };
}

@end

@implementation AWSstoragegatewayListVolumesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"marker" : @"Marker",
             @"volumeInfos" : @"VolumeInfos",
             };
}

+ (NSValueTransformer *)volumeInfosJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayVolumeInfo class]];
}

@end

@implementation AWSstoragegatewayNFSFileShareDefaults

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directoryMode" : @"DirectoryMode",
             @"fileMode" : @"FileMode",
             @"groupId" : @"GroupId",
             @"ownerId" : @"OwnerId",
             };
}

@end

@implementation AWSstoragegatewayNFSFileShareInfo

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSstoragegatewayNFSFileShareDefaults class]];
}

+ (NSValueTransformer *)objectACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLBucketOwnerFullControl);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLAwsExecRead);
        }
        return @(AWSstoragegatewayObjectACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewayObjectACLPrivate:
                return @"private";
            case AWSstoragegatewayObjectACLPublicRead:
                return @"public-read";
            case AWSstoragegatewayObjectACLPublicReadWrite:
                return @"public-read-write";
            case AWSstoragegatewayObjectACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSstoragegatewayObjectACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSstoragegatewayObjectACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSstoragegatewayObjectACLAwsExecRead:
                return @"aws-exec-read";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayNetworkInterface

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipv4Address" : @"Ipv4Address",
             @"ipv6Address" : @"Ipv6Address",
             @"macAddress" : @"MacAddress",
             };
}

@end

@implementation AWSstoragegatewayNotifyWhenUploadedInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             };
}

@end

@implementation AWSstoragegatewayNotifyWhenUploadedOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             @"notificationId" : @"NotificationId",
             };
}

@end

@implementation AWSstoragegatewayRefreshCacheInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             @"folderList" : @"FolderList",
             @"recursive" : @"Recursive",
             };
}

@end

@implementation AWSstoragegatewayRefreshCacheOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             @"notificationId" : @"NotificationId",
             };
}

@end

@implementation AWSstoragegatewayRemoveTagsFromResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSstoragegatewayRemoveTagsFromResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSstoragegatewayResetCacheInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayResetCacheOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayRetrieveTapeArchiveInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayRetrieveTapeArchiveOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayRetrieveTapeRecoveryPointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewayRetrieveTapeRecoveryPointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tapeARN" : @"TapeARN",
             };
}

@end

@implementation AWSstoragegatewaySMBFileShareInfo

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
            return @(AWSstoragegatewayObjectACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLBucketOwnerFullControl);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLAwsExecRead);
        }
        return @(AWSstoragegatewayObjectACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewayObjectACLPrivate:
                return @"private";
            case AWSstoragegatewayObjectACLPublicRead:
                return @"public-read";
            case AWSstoragegatewayObjectACLPublicReadWrite:
                return @"public-read-write";
            case AWSstoragegatewayObjectACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSstoragegatewayObjectACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSstoragegatewayObjectACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSstoragegatewayObjectACLAwsExecRead:
                return @"aws-exec-read";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewaySetLocalConsolePasswordInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"localConsolePassword" : @"LocalConsolePassword",
             };
}

@end

@implementation AWSstoragegatewaySetLocalConsolePasswordOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewaySetSMBGuestPasswordInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"password" : @"Password",
             };
}

@end

@implementation AWSstoragegatewaySetSMBGuestPasswordOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayShutdownGatewayInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayShutdownGatewayOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayStartAvailabilityMonitorTestInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayStartAvailabilityMonitorTestOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayStartGatewayInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayStartGatewayOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayStorageGatewayError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"errorCode",
             @"errorDetails" : @"errorDetails",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ActivationKeyExpired"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeActivationKeyExpired);
        }
        if ([value caseInsensitiveCompare:@"ActivationKeyInvalid"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeActivationKeyInvalid);
        }
        if ([value caseInsensitiveCompare:@"ActivationKeyNotFound"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeActivationKeyNotFound);
        }
        if ([value caseInsensitiveCompare:@"GatewayInternalError"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeGatewayInternalError);
        }
        if ([value caseInsensitiveCompare:@"GatewayNotConnected"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeGatewayNotConnected);
        }
        if ([value caseInsensitiveCompare:@"GatewayNotFound"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeGatewayNotFound);
        }
        if ([value caseInsensitiveCompare:@"GatewayProxyNetworkConnectionBusy"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeGatewayProxyNetworkConnectionBusy);
        }
        if ([value caseInsensitiveCompare:@"AuthenticationFailure"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeAuthenticationFailure);
        }
        if ([value caseInsensitiveCompare:@"BandwidthThrottleScheduleNotFound"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeBandwidthThrottleScheduleNotFound);
        }
        if ([value caseInsensitiveCompare:@"Blocked"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeBlocked);
        }
        if ([value caseInsensitiveCompare:@"CannotExportSnapshot"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeCannotExportSnapshot);
        }
        if ([value caseInsensitiveCompare:@"ChapCredentialNotFound"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeChapCredentialNotFound);
        }
        if ([value caseInsensitiveCompare:@"DiskAlreadyAllocated"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeDiskAlreadyAllocated);
        }
        if ([value caseInsensitiveCompare:@"DiskDoesNotExist"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeDiskDoesNotExist);
        }
        if ([value caseInsensitiveCompare:@"DiskSizeGreaterThanVolumeMaxSize"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeDiskSizeGreaterThanVolumeMaxSize);
        }
        if ([value caseInsensitiveCompare:@"DiskSizeLessThanVolumeSize"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeDiskSizeLessThanVolumeSize);
        }
        if ([value caseInsensitiveCompare:@"DiskSizeNotGigAligned"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeDiskSizeNotGigAligned);
        }
        if ([value caseInsensitiveCompare:@"DuplicateCertificateInfo"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeDuplicateCertificateInfo);
        }
        if ([value caseInsensitiveCompare:@"DuplicateSchedule"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeDuplicateSchedule);
        }
        if ([value caseInsensitiveCompare:@"EndpointNotFound"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeEndpointNotFound);
        }
        if ([value caseInsensitiveCompare:@"IAMNotSupported"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeIAMNotSupported);
        }
        if ([value caseInsensitiveCompare:@"InitiatorInvalid"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeInitiatorInvalid);
        }
        if ([value caseInsensitiveCompare:@"InitiatorNotFound"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeInitiatorNotFound);
        }
        if ([value caseInsensitiveCompare:@"InternalError"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeInternalError);
        }
        if ([value caseInsensitiveCompare:@"InvalidGateway"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeInvalidGateway);
        }
        if ([value caseInsensitiveCompare:@"InvalidEndpoint"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeInvalidEndpoint);
        }
        if ([value caseInsensitiveCompare:@"InvalidParameters"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeInvalidParameters);
        }
        if ([value caseInsensitiveCompare:@"InvalidSchedule"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeInvalidSchedule);
        }
        if ([value caseInsensitiveCompare:@"LocalStorageLimitExceeded"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeLocalStorageLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"LunAlreadyAllocated "] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeLunAlreadyAllocated);
        }
        if ([value caseInsensitiveCompare:@"LunInvalid"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeLunInvalid);
        }
        if ([value caseInsensitiveCompare:@"JoinDomainInProgress"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeJoinDomainInProgress);
        }
        if ([value caseInsensitiveCompare:@"MaximumContentLengthExceeded"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeMaximumContentLengthExceeded);
        }
        if ([value caseInsensitiveCompare:@"MaximumTapeCartridgeCountExceeded"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeMaximumTapeCartridgeCountExceeded);
        }
        if ([value caseInsensitiveCompare:@"MaximumVolumeCountExceeded"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeMaximumVolumeCountExceeded);
        }
        if ([value caseInsensitiveCompare:@"NetworkConfigurationChanged"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeNetworkConfigurationChanged);
        }
        if ([value caseInsensitiveCompare:@"NoDisksAvailable"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeNoDisksAvailable);
        }
        if ([value caseInsensitiveCompare:@"NotImplemented"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeNotImplemented);
        }
        if ([value caseInsensitiveCompare:@"NotSupported"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeNotSupported);
        }
        if ([value caseInsensitiveCompare:@"OperationAborted"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeOperationAborted);
        }
        if ([value caseInsensitiveCompare:@"OutdatedGateway"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeOutdatedGateway);
        }
        if ([value caseInsensitiveCompare:@"ParametersNotImplemented"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeParametersNotImplemented);
        }
        if ([value caseInsensitiveCompare:@"RegionInvalid"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeRegionInvalid);
        }
        if ([value caseInsensitiveCompare:@"RequestTimeout"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeRequestTimeout);
        }
        if ([value caseInsensitiveCompare:@"ServiceUnavailable"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeServiceUnavailable);
        }
        if ([value caseInsensitiveCompare:@"SnapshotDeleted"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeSnapshotDeleted);
        }
        if ([value caseInsensitiveCompare:@"SnapshotIdInvalid"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeSnapshotIdInvalid);
        }
        if ([value caseInsensitiveCompare:@"SnapshotInProgress"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeSnapshotInProgress);
        }
        if ([value caseInsensitiveCompare:@"SnapshotNotFound"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeSnapshotNotFound);
        }
        if ([value caseInsensitiveCompare:@"SnapshotScheduleNotFound"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeSnapshotScheduleNotFound);
        }
        if ([value caseInsensitiveCompare:@"StagingAreaFull"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeStagingAreaFull);
        }
        if ([value caseInsensitiveCompare:@"StorageFailure"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeStorageFailure);
        }
        if ([value caseInsensitiveCompare:@"TapeCartridgeNotFound"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeTapeCartridgeNotFound);
        }
        if ([value caseInsensitiveCompare:@"TargetAlreadyExists"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeTargetAlreadyExists);
        }
        if ([value caseInsensitiveCompare:@"TargetInvalid"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeTargetInvalid);
        }
        if ([value caseInsensitiveCompare:@"TargetNotFound"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeTargetNotFound);
        }
        if ([value caseInsensitiveCompare:@"UnauthorizedOperation"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeUnauthorizedOperation);
        }
        if ([value caseInsensitiveCompare:@"VolumeAlreadyExists"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeVolumeAlreadyExists);
        }
        if ([value caseInsensitiveCompare:@"VolumeIdInvalid"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeVolumeIdInvalid);
        }
        if ([value caseInsensitiveCompare:@"VolumeInUse"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeVolumeInUse);
        }
        if ([value caseInsensitiveCompare:@"VolumeNotFound"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeVolumeNotFound);
        }
        if ([value caseInsensitiveCompare:@"VolumeNotReady"] == NSOrderedSame) {
            return @(AWSstoragegatewayErrorCodeVolumeNotReady);
        }
        return @(AWSstoragegatewayErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewayErrorCodeActivationKeyExpired:
                return @"ActivationKeyExpired";
            case AWSstoragegatewayErrorCodeActivationKeyInvalid:
                return @"ActivationKeyInvalid";
            case AWSstoragegatewayErrorCodeActivationKeyNotFound:
                return @"ActivationKeyNotFound";
            case AWSstoragegatewayErrorCodeGatewayInternalError:
                return @"GatewayInternalError";
            case AWSstoragegatewayErrorCodeGatewayNotConnected:
                return @"GatewayNotConnected";
            case AWSstoragegatewayErrorCodeGatewayNotFound:
                return @"GatewayNotFound";
            case AWSstoragegatewayErrorCodeGatewayProxyNetworkConnectionBusy:
                return @"GatewayProxyNetworkConnectionBusy";
            case AWSstoragegatewayErrorCodeAuthenticationFailure:
                return @"AuthenticationFailure";
            case AWSstoragegatewayErrorCodeBandwidthThrottleScheduleNotFound:
                return @"BandwidthThrottleScheduleNotFound";
            case AWSstoragegatewayErrorCodeBlocked:
                return @"Blocked";
            case AWSstoragegatewayErrorCodeCannotExportSnapshot:
                return @"CannotExportSnapshot";
            case AWSstoragegatewayErrorCodeChapCredentialNotFound:
                return @"ChapCredentialNotFound";
            case AWSstoragegatewayErrorCodeDiskAlreadyAllocated:
                return @"DiskAlreadyAllocated";
            case AWSstoragegatewayErrorCodeDiskDoesNotExist:
                return @"DiskDoesNotExist";
            case AWSstoragegatewayErrorCodeDiskSizeGreaterThanVolumeMaxSize:
                return @"DiskSizeGreaterThanVolumeMaxSize";
            case AWSstoragegatewayErrorCodeDiskSizeLessThanVolumeSize:
                return @"DiskSizeLessThanVolumeSize";
            case AWSstoragegatewayErrorCodeDiskSizeNotGigAligned:
                return @"DiskSizeNotGigAligned";
            case AWSstoragegatewayErrorCodeDuplicateCertificateInfo:
                return @"DuplicateCertificateInfo";
            case AWSstoragegatewayErrorCodeDuplicateSchedule:
                return @"DuplicateSchedule";
            case AWSstoragegatewayErrorCodeEndpointNotFound:
                return @"EndpointNotFound";
            case AWSstoragegatewayErrorCodeIAMNotSupported:
                return @"IAMNotSupported";
            case AWSstoragegatewayErrorCodeInitiatorInvalid:
                return @"InitiatorInvalid";
            case AWSstoragegatewayErrorCodeInitiatorNotFound:
                return @"InitiatorNotFound";
            case AWSstoragegatewayErrorCodeInternalError:
                return @"InternalError";
            case AWSstoragegatewayErrorCodeInvalidGateway:
                return @"InvalidGateway";
            case AWSstoragegatewayErrorCodeInvalidEndpoint:
                return @"InvalidEndpoint";
            case AWSstoragegatewayErrorCodeInvalidParameters:
                return @"InvalidParameters";
            case AWSstoragegatewayErrorCodeInvalidSchedule:
                return @"InvalidSchedule";
            case AWSstoragegatewayErrorCodeLocalStorageLimitExceeded:
                return @"LocalStorageLimitExceeded";
            case AWSstoragegatewayErrorCodeLunAlreadyAllocated:
                return @"LunAlreadyAllocated ";
            case AWSstoragegatewayErrorCodeLunInvalid:
                return @"LunInvalid";
            case AWSstoragegatewayErrorCodeJoinDomainInProgress:
                return @"JoinDomainInProgress";
            case AWSstoragegatewayErrorCodeMaximumContentLengthExceeded:
                return @"MaximumContentLengthExceeded";
            case AWSstoragegatewayErrorCodeMaximumTapeCartridgeCountExceeded:
                return @"MaximumTapeCartridgeCountExceeded";
            case AWSstoragegatewayErrorCodeMaximumVolumeCountExceeded:
                return @"MaximumVolumeCountExceeded";
            case AWSstoragegatewayErrorCodeNetworkConfigurationChanged:
                return @"NetworkConfigurationChanged";
            case AWSstoragegatewayErrorCodeNoDisksAvailable:
                return @"NoDisksAvailable";
            case AWSstoragegatewayErrorCodeNotImplemented:
                return @"NotImplemented";
            case AWSstoragegatewayErrorCodeNotSupported:
                return @"NotSupported";
            case AWSstoragegatewayErrorCodeOperationAborted:
                return @"OperationAborted";
            case AWSstoragegatewayErrorCodeOutdatedGateway:
                return @"OutdatedGateway";
            case AWSstoragegatewayErrorCodeParametersNotImplemented:
                return @"ParametersNotImplemented";
            case AWSstoragegatewayErrorCodeRegionInvalid:
                return @"RegionInvalid";
            case AWSstoragegatewayErrorCodeRequestTimeout:
                return @"RequestTimeout";
            case AWSstoragegatewayErrorCodeServiceUnavailable:
                return @"ServiceUnavailable";
            case AWSstoragegatewayErrorCodeSnapshotDeleted:
                return @"SnapshotDeleted";
            case AWSstoragegatewayErrorCodeSnapshotIdInvalid:
                return @"SnapshotIdInvalid";
            case AWSstoragegatewayErrorCodeSnapshotInProgress:
                return @"SnapshotInProgress";
            case AWSstoragegatewayErrorCodeSnapshotNotFound:
                return @"SnapshotNotFound";
            case AWSstoragegatewayErrorCodeSnapshotScheduleNotFound:
                return @"SnapshotScheduleNotFound";
            case AWSstoragegatewayErrorCodeStagingAreaFull:
                return @"StagingAreaFull";
            case AWSstoragegatewayErrorCodeStorageFailure:
                return @"StorageFailure";
            case AWSstoragegatewayErrorCodeTapeCartridgeNotFound:
                return @"TapeCartridgeNotFound";
            case AWSstoragegatewayErrorCodeTargetAlreadyExists:
                return @"TargetAlreadyExists";
            case AWSstoragegatewayErrorCodeTargetInvalid:
                return @"TargetInvalid";
            case AWSstoragegatewayErrorCodeTargetNotFound:
                return @"TargetNotFound";
            case AWSstoragegatewayErrorCodeUnauthorizedOperation:
                return @"UnauthorizedOperation";
            case AWSstoragegatewayErrorCodeVolumeAlreadyExists:
                return @"VolumeAlreadyExists";
            case AWSstoragegatewayErrorCodeVolumeIdInvalid:
                return @"VolumeIdInvalid";
            case AWSstoragegatewayErrorCodeVolumeInUse:
                return @"VolumeInUse";
            case AWSstoragegatewayErrorCodeVolumeNotFound:
                return @"VolumeNotFound";
            case AWSstoragegatewayErrorCodeVolumeNotReady:
                return @"VolumeNotReady";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSstoragegatewayStorediSCSIVolume

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSstoragegatewayVolumeiSCSIAttributes class]];
}

@end

@implementation AWSstoragegatewayTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSstoragegatewayTape

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

@implementation AWSstoragegatewayTapeArchive

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

@implementation AWSstoragegatewayTapeInfo

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

@implementation AWSstoragegatewayTapeRecoveryPointInfo

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

@implementation AWSstoragegatewayUpdateAutomaticTapeCreationPolicyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"automaticTapeCreationRules" : @"AutomaticTapeCreationRules",
             @"gatewayARN" : @"GatewayARN",
             };
}

+ (NSValueTransformer *)automaticTapeCreationRulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayAutomaticTapeCreationRule class]];
}

@end

@implementation AWSstoragegatewayUpdateAutomaticTapeCreationPolicyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayUpdateBandwidthRateLimitInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"averageDownloadRateLimitInBitsPerSec" : @"AverageDownloadRateLimitInBitsPerSec",
             @"averageUploadRateLimitInBitsPerSec" : @"AverageUploadRateLimitInBitsPerSec",
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayUpdateBandwidthRateLimitOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayUpdateChapCredentialsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initiatorName" : @"InitiatorName",
             @"secretToAuthenticateInitiator" : @"SecretToAuthenticateInitiator",
             @"secretToAuthenticateTarget" : @"SecretToAuthenticateTarget",
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSstoragegatewayUpdateChapCredentialsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"initiatorName" : @"InitiatorName",
             @"targetARN" : @"TargetARN",
             };
}

@end

@implementation AWSstoragegatewayUpdateGatewayInformationInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogGroupARN" : @"CloudWatchLogGroupARN",
             @"gatewayARN" : @"GatewayARN",
             @"gatewayName" : @"GatewayName",
             @"gatewayTimezone" : @"GatewayTimezone",
             };
}

@end

@implementation AWSstoragegatewayUpdateGatewayInformationOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"gatewayName" : @"GatewayName",
             };
}

@end

@implementation AWSstoragegatewayUpdateGatewaySoftwareNowInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayUpdateGatewaySoftwareNowOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayUpdateMaintenanceStartTimeInput

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

@implementation AWSstoragegatewayUpdateMaintenanceStartTimeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayUpdateNFSFileShareInput

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSstoragegatewayNFSFileShareDefaults class]];
}

+ (NSValueTransformer *)objectACLJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLBucketOwnerFullControl);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLAwsExecRead);
        }
        return @(AWSstoragegatewayObjectACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewayObjectACLPrivate:
                return @"private";
            case AWSstoragegatewayObjectACLPublicRead:
                return @"public-read";
            case AWSstoragegatewayObjectACLPublicReadWrite:
                return @"public-read-write";
            case AWSstoragegatewayObjectACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSstoragegatewayObjectACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSstoragegatewayObjectACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSstoragegatewayObjectACLAwsExecRead:
                return @"aws-exec-read";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSstoragegatewayUpdateNFSFileShareOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             };
}

@end

@implementation AWSstoragegatewayUpdateSMBFileShareInput

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
            return @(AWSstoragegatewayObjectACLPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLBucketOwnerFullControl);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSstoragegatewayObjectACLAwsExecRead);
        }
        return @(AWSstoragegatewayObjectACLUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewayObjectACLPrivate:
                return @"private";
            case AWSstoragegatewayObjectACLPublicRead:
                return @"public-read";
            case AWSstoragegatewayObjectACLPublicReadWrite:
                return @"public-read-write";
            case AWSstoragegatewayObjectACLAuthenticatedRead:
                return @"authenticated-read";
            case AWSstoragegatewayObjectACLBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSstoragegatewayObjectACLBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            case AWSstoragegatewayObjectACLAwsExecRead:
                return @"aws-exec-read";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSstoragegatewayUpdateSMBFileShareOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fileShareARN" : @"FileShareARN",
             };
}

@end

@implementation AWSstoragegatewayUpdateSMBSecurityStrategyInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             @"SMBSecurityStrategy" : @"SMBSecurityStrategy",
             };
}

+ (NSValueTransformer *)SMBSecurityStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ClientSpecified"] == NSOrderedSame) {
            return @(AWSstoragegatewaySMBSecurityStrategyClientSpecified);
        }
        if ([value caseInsensitiveCompare:@"MandatorySigning"] == NSOrderedSame) {
            return @(AWSstoragegatewaySMBSecurityStrategyMandatorySigning);
        }
        if ([value caseInsensitiveCompare:@"MandatoryEncryption"] == NSOrderedSame) {
            return @(AWSstoragegatewaySMBSecurityStrategyMandatoryEncryption);
        }
        return @(AWSstoragegatewaySMBSecurityStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSstoragegatewaySMBSecurityStrategyClientSpecified:
                return @"ClientSpecified";
            case AWSstoragegatewaySMBSecurityStrategyMandatorySigning:
                return @"MandatorySigning";
            case AWSstoragegatewaySMBSecurityStrategyMandatoryEncryption:
                return @"MandatoryEncryption";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSstoragegatewayUpdateSMBSecurityStrategyOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayARN" : @"GatewayARN",
             };
}

@end

@implementation AWSstoragegatewayUpdateSnapshotScheduleInput

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSstoragegatewayTag class]];
}

@end

@implementation AWSstoragegatewayUpdateSnapshotScheduleOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             };
}

@end

@implementation AWSstoragegatewayUpdateVTLDeviceTypeInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceType" : @"DeviceType",
             @"VTLDeviceARN" : @"VTLDeviceARN",
             };
}

@end

@implementation AWSstoragegatewayUpdateVTLDeviceTypeOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"VTLDeviceARN" : @"VTLDeviceARN",
             };
}

@end

@implementation AWSstoragegatewayVTLDevice

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSstoragegatewayDeviceiSCSIAttributes class]];
}

@end

@implementation AWSstoragegatewayVolumeInfo

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

@implementation AWSstoragegatewayVolumeRecoveryPointInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumeARN" : @"VolumeARN",
             @"volumeRecoveryPointTime" : @"VolumeRecoveryPointTime",
             @"volumeSizeInBytes" : @"VolumeSizeInBytes",
             @"volumeUsageInBytes" : @"VolumeUsageInBytes",
             };
}

@end

@implementation AWSstoragegatewayVolumeiSCSIAttributes

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
