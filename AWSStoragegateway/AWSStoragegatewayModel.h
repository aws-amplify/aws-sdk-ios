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

FOUNDATION_EXPORT NSString *const AWSStoragegatewayErrorDomain;

typedef NS_ENUM(NSInteger, AWSStoragegatewayErrorType) {
    AWSStoragegatewayErrorUnknown,
    AWSStoragegatewayErrorInternalServer,
    AWSStoragegatewayErrorInvalidGatewayRequest,
    AWSStoragegatewayErrorServiceUnavailable,
};

typedef NS_ENUM(NSInteger, AWSStoragegatewayActiveDirectoryStatus) {
    AWSStoragegatewayActiveDirectoryStatusUnknown,
    AWSStoragegatewayActiveDirectoryStatusAccessDenied,
    AWSStoragegatewayActiveDirectoryStatusDetached,
    AWSStoragegatewayActiveDirectoryStatusJoined,
    AWSStoragegatewayActiveDirectoryStatusJoining,
    AWSStoragegatewayActiveDirectoryStatusNetworkError,
    AWSStoragegatewayActiveDirectoryStatusTimeout,
    AWSStoragegatewayActiveDirectoryStatusUnknownError,
};

typedef NS_ENUM(NSInteger, AWSStoragegatewayAvailabilityMonitorTestStatus) {
    AWSStoragegatewayAvailabilityMonitorTestStatusUnknown,
    AWSStoragegatewayAvailabilityMonitorTestStatusComplete,
    AWSStoragegatewayAvailabilityMonitorTestStatusFailed,
    AWSStoragegatewayAvailabilityMonitorTestStatusPending,
};

typedef NS_ENUM(NSInteger, AWSStoragegatewayErrorCode) {
    AWSStoragegatewayErrorCodeUnknown,
    AWSStoragegatewayErrorCodeActivationKeyExpired,
    AWSStoragegatewayErrorCodeActivationKeyInvalid,
    AWSStoragegatewayErrorCodeActivationKeyNotFound,
    AWSStoragegatewayErrorCodeGatewayInternalError,
    AWSStoragegatewayErrorCodeGatewayNotConnected,
    AWSStoragegatewayErrorCodeGatewayNotFound,
    AWSStoragegatewayErrorCodeGatewayProxyNetworkConnectionBusy,
    AWSStoragegatewayErrorCodeAuthenticationFailure,
    AWSStoragegatewayErrorCodeBandwidthThrottleScheduleNotFound,
    AWSStoragegatewayErrorCodeBlocked,
    AWSStoragegatewayErrorCodeCannotExportSnapshot,
    AWSStoragegatewayErrorCodeChapCredentialNotFound,
    AWSStoragegatewayErrorCodeDiskAlreadyAllocated,
    AWSStoragegatewayErrorCodeDiskDoesNotExist,
    AWSStoragegatewayErrorCodeDiskSizeGreaterThanVolumeMaxSize,
    AWSStoragegatewayErrorCodeDiskSizeLessThanVolumeSize,
    AWSStoragegatewayErrorCodeDiskSizeNotGigAligned,
    AWSStoragegatewayErrorCodeDuplicateCertificateInfo,
    AWSStoragegatewayErrorCodeDuplicateSchedule,
    AWSStoragegatewayErrorCodeEndpointNotFound,
    AWSStoragegatewayErrorCodeIAMNotSupported,
    AWSStoragegatewayErrorCodeInitiatorInvalid,
    AWSStoragegatewayErrorCodeInitiatorNotFound,
    AWSStoragegatewayErrorCodeInternalError,
    AWSStoragegatewayErrorCodeInvalidGateway,
    AWSStoragegatewayErrorCodeInvalidEndpoint,
    AWSStoragegatewayErrorCodeInvalidParameters,
    AWSStoragegatewayErrorCodeInvalidSchedule,
    AWSStoragegatewayErrorCodeLocalStorageLimitExceeded,
    AWSStoragegatewayErrorCodeLunAlreadyAllocated,
    AWSStoragegatewayErrorCodeLunInvalid,
    AWSStoragegatewayErrorCodeJoinDomainInProgress,
    AWSStoragegatewayErrorCodeMaximumContentLengthExceeded,
    AWSStoragegatewayErrorCodeMaximumTapeCartridgeCountExceeded,
    AWSStoragegatewayErrorCodeMaximumVolumeCountExceeded,
    AWSStoragegatewayErrorCodeNetworkConfigurationChanged,
    AWSStoragegatewayErrorCodeNoDisksAvailable,
    AWSStoragegatewayErrorCodeNotImplemented,
    AWSStoragegatewayErrorCodeNotSupported,
    AWSStoragegatewayErrorCodeOperationAborted,
    AWSStoragegatewayErrorCodeOutdatedGateway,
    AWSStoragegatewayErrorCodeParametersNotImplemented,
    AWSStoragegatewayErrorCodeRegionInvalid,
    AWSStoragegatewayErrorCodeRequestTimeout,
    AWSStoragegatewayErrorCodeServiceUnavailable,
    AWSStoragegatewayErrorCodeSnapshotDeleted,
    AWSStoragegatewayErrorCodeSnapshotIdInvalid,
    AWSStoragegatewayErrorCodeSnapshotInProgress,
    AWSStoragegatewayErrorCodeSnapshotNotFound,
    AWSStoragegatewayErrorCodeSnapshotScheduleNotFound,
    AWSStoragegatewayErrorCodeStagingAreaFull,
    AWSStoragegatewayErrorCodeStorageFailure,
    AWSStoragegatewayErrorCodeTapeCartridgeNotFound,
    AWSStoragegatewayErrorCodeTargetAlreadyExists,
    AWSStoragegatewayErrorCodeTargetInvalid,
    AWSStoragegatewayErrorCodeTargetNotFound,
    AWSStoragegatewayErrorCodeUnauthorizedOperation,
    AWSStoragegatewayErrorCodeVolumeAlreadyExists,
    AWSStoragegatewayErrorCodeVolumeIdInvalid,
    AWSStoragegatewayErrorCodeVolumeInUse,
    AWSStoragegatewayErrorCodeVolumeNotFound,
    AWSStoragegatewayErrorCodeVolumeNotReady,
};

typedef NS_ENUM(NSInteger, AWSStoragegatewayFileShareType) {
    AWSStoragegatewayFileShareTypeUnknown,
    AWSStoragegatewayFileShareTypeNfs,
    AWSStoragegatewayFileShareTypeSmb,
};

typedef NS_ENUM(NSInteger, AWSStoragegatewayHostEnvironment) {
    AWSStoragegatewayHostEnvironmentUnknown,
    AWSStoragegatewayHostEnvironmentVmware,
    AWSStoragegatewayHostEnvironmentHyperV,
    AWSStoragegatewayHostEnvironmentEc2,
    AWSStoragegatewayHostEnvironmentKvm,
    AWSStoragegatewayHostEnvironmentOther,
};

typedef NS_ENUM(NSInteger, AWSStoragegatewayObjectACL) {
    AWSStoragegatewayObjectACLUnknown,
    AWSStoragegatewayObjectACLPrivate,
    AWSStoragegatewayObjectACLPublicRead,
    AWSStoragegatewayObjectACLPublicReadWrite,
    AWSStoragegatewayObjectACLAuthenticatedRead,
    AWSStoragegatewayObjectACLBucketOwnerRead,
    AWSStoragegatewayObjectACLBucketOwnerFullControl,
    AWSStoragegatewayObjectACLAwsExecRead,
};

typedef NS_ENUM(NSInteger, AWSStoragegatewaySMBSecurityStrategy) {
    AWSStoragegatewaySMBSecurityStrategyUnknown,
    AWSStoragegatewaySMBSecurityStrategyClientSpecified,
    AWSStoragegatewaySMBSecurityStrategyMandatorySigning,
    AWSStoragegatewaySMBSecurityStrategyMandatoryEncryption,
};

@class AWSStoragegatewayActivateGatewayInput;
@class AWSStoragegatewayActivateGatewayOutput;
@class AWSStoragegatewayAddCacheInput;
@class AWSStoragegatewayAddCacheOutput;
@class AWSStoragegatewayAddTagsToResourceInput;
@class AWSStoragegatewayAddTagsToResourceOutput;
@class AWSStoragegatewayAddUploadBufferInput;
@class AWSStoragegatewayAddUploadBufferOutput;
@class AWSStoragegatewayAddWorkingStorageInput;
@class AWSStoragegatewayAddWorkingStorageOutput;
@class AWSStoragegatewayAssignTapePoolInput;
@class AWSStoragegatewayAssignTapePoolOutput;
@class AWSStoragegatewayAttachVolumeInput;
@class AWSStoragegatewayAttachVolumeOutput;
@class AWSStoragegatewayAutomaticTapeCreationPolicyInfo;
@class AWSStoragegatewayAutomaticTapeCreationRule;
@class AWSStoragegatewayCachediSCSIVolume;
@class AWSStoragegatewayCancelArchivalInput;
@class AWSStoragegatewayCancelArchivalOutput;
@class AWSStoragegatewayCancelRetrievalInput;
@class AWSStoragegatewayCancelRetrievalOutput;
@class AWSStoragegatewayChapInfo;
@class AWSStoragegatewayCreateCachediSCSIVolumeInput;
@class AWSStoragegatewayCreateCachediSCSIVolumeOutput;
@class AWSStoragegatewayCreateNFSFileShareInput;
@class AWSStoragegatewayCreateNFSFileShareOutput;
@class AWSStoragegatewayCreateSMBFileShareInput;
@class AWSStoragegatewayCreateSMBFileShareOutput;
@class AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointInput;
@class AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput;
@class AWSStoragegatewayCreateSnapshotInput;
@class AWSStoragegatewayCreateSnapshotOutput;
@class AWSStoragegatewayCreateStorediSCSIVolumeInput;
@class AWSStoragegatewayCreateStorediSCSIVolumeOutput;
@class AWSStoragegatewayCreateTapeWithBarcodeInput;
@class AWSStoragegatewayCreateTapeWithBarcodeOutput;
@class AWSStoragegatewayCreateTapesInput;
@class AWSStoragegatewayCreateTapesOutput;
@class AWSStoragegatewayDeleteAutomaticTapeCreationPolicyInput;
@class AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput;
@class AWSStoragegatewayDeleteBandwidthRateLimitInput;
@class AWSStoragegatewayDeleteBandwidthRateLimitOutput;
@class AWSStoragegatewayDeleteChapCredentialsInput;
@class AWSStoragegatewayDeleteChapCredentialsOutput;
@class AWSStoragegatewayDeleteFileShareInput;
@class AWSStoragegatewayDeleteFileShareOutput;
@class AWSStoragegatewayDeleteGatewayInput;
@class AWSStoragegatewayDeleteGatewayOutput;
@class AWSStoragegatewayDeleteSnapshotScheduleInput;
@class AWSStoragegatewayDeleteSnapshotScheduleOutput;
@class AWSStoragegatewayDeleteTapeArchiveInput;
@class AWSStoragegatewayDeleteTapeArchiveOutput;
@class AWSStoragegatewayDeleteTapeInput;
@class AWSStoragegatewayDeleteTapeOutput;
@class AWSStoragegatewayDeleteVolumeInput;
@class AWSStoragegatewayDeleteVolumeOutput;
@class AWSStoragegatewayDescribeAvailabilityMonitorTestInput;
@class AWSStoragegatewayDescribeAvailabilityMonitorTestOutput;
@class AWSStoragegatewayDescribeBandwidthRateLimitInput;
@class AWSStoragegatewayDescribeBandwidthRateLimitOutput;
@class AWSStoragegatewayDescribeCacheInput;
@class AWSStoragegatewayDescribeCacheOutput;
@class AWSStoragegatewayDescribeCachediSCSIVolumesInput;
@class AWSStoragegatewayDescribeCachediSCSIVolumesOutput;
@class AWSStoragegatewayDescribeChapCredentialsInput;
@class AWSStoragegatewayDescribeChapCredentialsOutput;
@class AWSStoragegatewayDescribeGatewayInformationInput;
@class AWSStoragegatewayDescribeGatewayInformationOutput;
@class AWSStoragegatewayDescribeMaintenanceStartTimeInput;
@class AWSStoragegatewayDescribeMaintenanceStartTimeOutput;
@class AWSStoragegatewayDescribeNFSFileSharesInput;
@class AWSStoragegatewayDescribeNFSFileSharesOutput;
@class AWSStoragegatewayDescribeSMBFileSharesInput;
@class AWSStoragegatewayDescribeSMBFileSharesOutput;
@class AWSStoragegatewayDescribeSMBSettingsInput;
@class AWSStoragegatewayDescribeSMBSettingsOutput;
@class AWSStoragegatewayDescribeSnapshotScheduleInput;
@class AWSStoragegatewayDescribeSnapshotScheduleOutput;
@class AWSStoragegatewayDescribeStorediSCSIVolumesInput;
@class AWSStoragegatewayDescribeStorediSCSIVolumesOutput;
@class AWSStoragegatewayDescribeTapeArchivesInput;
@class AWSStoragegatewayDescribeTapeArchivesOutput;
@class AWSStoragegatewayDescribeTapeRecoveryPointsInput;
@class AWSStoragegatewayDescribeTapeRecoveryPointsOutput;
@class AWSStoragegatewayDescribeTapesInput;
@class AWSStoragegatewayDescribeTapesOutput;
@class AWSStoragegatewayDescribeUploadBufferInput;
@class AWSStoragegatewayDescribeUploadBufferOutput;
@class AWSStoragegatewayDescribeVTLDevicesInput;
@class AWSStoragegatewayDescribeVTLDevicesOutput;
@class AWSStoragegatewayDescribeWorkingStorageInput;
@class AWSStoragegatewayDescribeWorkingStorageOutput;
@class AWSStoragegatewayDetachVolumeInput;
@class AWSStoragegatewayDetachVolumeOutput;
@class AWSStoragegatewayDeviceiSCSIAttributes;
@class AWSStoragegatewayDisableGatewayInput;
@class AWSStoragegatewayDisableGatewayOutput;
@class AWSStoragegatewayDisk;
@class AWSStoragegatewayFileShareInfo;
@class AWSStoragegatewayGatewayInfo;
@class AWSStoragegatewayJoinDomainInput;
@class AWSStoragegatewayJoinDomainOutput;
@class AWSStoragegatewayListAutomaticTapeCreationPoliciesInput;
@class AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput;
@class AWSStoragegatewayListFileSharesInput;
@class AWSStoragegatewayListFileSharesOutput;
@class AWSStoragegatewayListGatewaysInput;
@class AWSStoragegatewayListGatewaysOutput;
@class AWSStoragegatewayListLocalDisksInput;
@class AWSStoragegatewayListLocalDisksOutput;
@class AWSStoragegatewayListTagsForResourceInput;
@class AWSStoragegatewayListTagsForResourceOutput;
@class AWSStoragegatewayListTapesInput;
@class AWSStoragegatewayListTapesOutput;
@class AWSStoragegatewayListVolumeInitiatorsInput;
@class AWSStoragegatewayListVolumeInitiatorsOutput;
@class AWSStoragegatewayListVolumeRecoveryPointsInput;
@class AWSStoragegatewayListVolumeRecoveryPointsOutput;
@class AWSStoragegatewayListVolumesInput;
@class AWSStoragegatewayListVolumesOutput;
@class AWSStoragegatewayNFSFileShareDefaults;
@class AWSStoragegatewayNFSFileShareInfo;
@class AWSStoragegatewayNetworkInterface;
@class AWSStoragegatewayNotifyWhenUploadedInput;
@class AWSStoragegatewayNotifyWhenUploadedOutput;
@class AWSStoragegatewayRefreshCacheInput;
@class AWSStoragegatewayRefreshCacheOutput;
@class AWSStoragegatewayRemoveTagsFromResourceInput;
@class AWSStoragegatewayRemoveTagsFromResourceOutput;
@class AWSStoragegatewayResetCacheInput;
@class AWSStoragegatewayResetCacheOutput;
@class AWSStoragegatewayRetrieveTapeArchiveInput;
@class AWSStoragegatewayRetrieveTapeArchiveOutput;
@class AWSStoragegatewayRetrieveTapeRecoveryPointInput;
@class AWSStoragegatewayRetrieveTapeRecoveryPointOutput;
@class AWSStoragegatewaySMBFileShareInfo;
@class AWSStoragegatewaySetLocalConsolePasswordInput;
@class AWSStoragegatewaySetLocalConsolePasswordOutput;
@class AWSStoragegatewaySetSMBGuestPasswordInput;
@class AWSStoragegatewaySetSMBGuestPasswordOutput;
@class AWSStoragegatewayShutdownGatewayInput;
@class AWSStoragegatewayShutdownGatewayOutput;
@class AWSStoragegatewayStartAvailabilityMonitorTestInput;
@class AWSStoragegatewayStartAvailabilityMonitorTestOutput;
@class AWSStoragegatewayStartGatewayInput;
@class AWSStoragegatewayStartGatewayOutput;
@class AWSStoragegatewayStorageGatewayError;
@class AWSStoragegatewayStorediSCSIVolume;
@class AWSStoragegatewayTag;
@class AWSStoragegatewayTape;
@class AWSStoragegatewayTapeArchive;
@class AWSStoragegatewayTapeInfo;
@class AWSStoragegatewayTapeRecoveryPointInfo;
@class AWSStoragegatewayUpdateAutomaticTapeCreationPolicyInput;
@class AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput;
@class AWSStoragegatewayUpdateBandwidthRateLimitInput;
@class AWSStoragegatewayUpdateBandwidthRateLimitOutput;
@class AWSStoragegatewayUpdateChapCredentialsInput;
@class AWSStoragegatewayUpdateChapCredentialsOutput;
@class AWSStoragegatewayUpdateGatewayInformationInput;
@class AWSStoragegatewayUpdateGatewayInformationOutput;
@class AWSStoragegatewayUpdateGatewaySoftwareNowInput;
@class AWSStoragegatewayUpdateGatewaySoftwareNowOutput;
@class AWSStoragegatewayUpdateMaintenanceStartTimeInput;
@class AWSStoragegatewayUpdateMaintenanceStartTimeOutput;
@class AWSStoragegatewayUpdateNFSFileShareInput;
@class AWSStoragegatewayUpdateNFSFileShareOutput;
@class AWSStoragegatewayUpdateSMBFileShareInput;
@class AWSStoragegatewayUpdateSMBFileShareOutput;
@class AWSStoragegatewayUpdateSMBSecurityStrategyInput;
@class AWSStoragegatewayUpdateSMBSecurityStrategyOutput;
@class AWSStoragegatewayUpdateSnapshotScheduleInput;
@class AWSStoragegatewayUpdateSnapshotScheduleOutput;
@class AWSStoragegatewayUpdateVTLDeviceTypeInput;
@class AWSStoragegatewayUpdateVTLDeviceTypeOutput;
@class AWSStoragegatewayVTLDevice;
@class AWSStoragegatewayVolumeInfo;
@class AWSStoragegatewayVolumeRecoveryPointInfo;
@class AWSStoragegatewayVolumeiSCSIAttributes;

/**
 <p>A JSON object containing one or more of the following fields:</p><ul><li><p><a>ActivateGatewayInput$ActivationKey</a></p></li><li><p><a>ActivateGatewayInput$GatewayName</a></p></li><li><p><a>ActivateGatewayInput$GatewayRegion</a></p></li><li><p><a>ActivateGatewayInput$GatewayTimezone</a></p></li><li><p><a>ActivateGatewayInput$GatewayType</a></p></li><li><p><a>ActivateGatewayInput$MediumChangerType</a></p></li><li><p><a>ActivateGatewayInput$TapeDriveType</a></p></li></ul>
 Required parameters: [ActivationKey, GatewayName, GatewayTimezone, GatewayRegion]
 */
@interface AWSStoragegatewayActivateGatewayInput : AWSRequest


/**
 <p>Your gateway activation key. You can obtain the activation key by sending an HTTP GET request with redirects enabled to the gateway IP address (port 80). The redirect URL returned in the response provides you the activation key for your gateway in the query string parameter <code>activationKey</code>. It may also include other activation-related parameters, however, these are merely defaults -- the arguments you pass to the <code>ActivateGateway</code> API call determine the actual configuration of your gateway.</p><p>For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/get-activation-key.html">Getting activation key</a> in the <i>AWS Storage Gateway User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable activationKey;

/**
 <p>The name you configured for your gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayName;

/**
 <p>A value that indicates the AWS Region where you want to store your data. The gateway AWS Region specified must be the same AWS Region as the AWS Region in your <code>Host</code> header in the request. For more information about available AWS Regions and endpoints for AWS Storage Gateway, see <a href="https://docs.aws.amazon.com/general/latest/gr/sg.html">AWS Storage Gateway endpoints and quotas</a> in the <i>AWS General Reference</i>.</p><p>Valid Values: See <a href="https://docs.aws.amazon.com/general/latest/gr/sg.html">AWS Storage Gateway endpoints and quotas</a> in the <i>AWS General Reference</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayRegion;

/**
 <p>A value that indicates the time zone you want to set for the gateway. The time zone is of the format "GMT-hr:mm" or "GMT+hr:mm". For example, GMT-4:00 indicates the time is 4 hours behind GMT. GMT+2:00 indicates the time is 2 hours ahead of GMT. The time zone is used, for example, for scheduling snapshots and your gateway's maintenance schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayTimezone;

/**
 <p>A value that defines the type of gateway to activate. The type specified is critical to all later functions of the gateway and cannot be changed after activation. The default value is <code>CACHED</code>.</p><p>Valid Values: <code>STORED</code> | <code>CACHED</code> | <code>VTL</code> | <code>FILE_S3</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayType;

/**
 <p>The value that indicates the type of medium changer to use for tape gateway. This field is optional.</p><p>Valid Values: <code>STK-L700</code> | <code>AWS-Gateway-VTL</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable mediumChangerType;

/**
 <p>A list of up to 50 tags that you can assign to the gateway. Each tag is a key-value pair.</p><note><p>Valid characters for key and value are letters, spaces, and numbers that can be represented in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256 characters.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

/**
 <p>The value that indicates the type of tape drive to use for tape gateway. This field is optional.</p><p>Valid Values: <code>IBM-ULT3580-TD5</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeDriveType;

@end

/**
 <p>AWS Storage Gateway returns the Amazon Resource Name (ARN) of the activated gateway. It is a string made of information such as your account, gateway name, and AWS Region. This ARN is used to reference the gateway in other API operations as well as resource-based authorization.</p><note><p>For gateways activated prior to September 02, 2015, the gateway ARN contains the gateway name rather than the gateway ID. Changing the name of the gateway has no effect on the gateway ARN.</p></note>
 */
@interface AWSStoragegatewayActivateGatewayOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayAddCacheInput : AWSRequest


/**
 <p>An array of strings that identify disks that are to be configured as working storage. Each string has a minimum length of 1 and maximum length of 300. You can get the disk IDs from the <a>ListLocalDisks</a> API.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable diskIds;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayAddCacheOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>AddTagsToResourceInput</p>
 Required parameters: [ResourceARN, Tags]
 */
@interface AWSStoragegatewayAddTagsToResourceInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource you want to add tags to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>The key-value pair that represents the tag you want to add to the resource. The value can be an empty string.</p><note><p>Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

@end

/**
 <p>AddTagsToResourceOutput</p>
 */
@interface AWSStoragegatewayAddTagsToResourceOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource you want to add tags to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

@end

/**
 
 */
@interface AWSStoragegatewayAddUploadBufferInput : AWSRequest


/**
 <p>An array of strings that identify disks that are to be configured as working storage. Each string has a minimum length of 1 and maximum length of 300. You can get the disk IDs from the <a>ListLocalDisks</a> API.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable diskIds;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayAddUploadBufferOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing one or more of the following fields:</p><ul><li><p><a>AddWorkingStorageInput$DiskIds</a></p></li></ul>
 Required parameters: [GatewayARN, DiskIds]
 */
@interface AWSStoragegatewayAddWorkingStorageInput : AWSRequest


/**
 <p>An array of strings that identify disks that are to be configured as working storage. Each string has a minimum length of 1 and maximum length of 300. You can get the disk IDs from the <a>ListLocalDisks</a> API.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable diskIds;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway for which working storage was configured.</p>
 */
@interface AWSStoragegatewayAddWorkingStorageOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayAssignTapePoolInput : AWSRequest


/**
 <p>The ID of the pool that you want to add your tape to for archiving. The tape in this pool is archived in the S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the storage class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.</p><p>Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable poolId;

/**
 <p>The unique Amazon Resource Name (ARN) of the virtual tape that you want to add to the tape pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 
 */
@interface AWSStoragegatewayAssignTapePoolOutput : AWSModel


/**
 <p>The unique Amazon Resource Names (ARN) of the virtual tape that was added to the tape pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>AttachVolumeInput</p>
 Required parameters: [GatewayARN, VolumeARN, NetworkInterfaceId]
 */
@interface AWSStoragegatewayAttachVolumeInput : AWSRequest


/**
 <p>The unique device ID or other distinguishing data that identifies the local disk used to create the volume. This value is only required when you are attaching a stored volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskId;

/**
 <p>The Amazon Resource Name (ARN) of the gateway that you want to attach the volume to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The network interface of the gateway on which to expose the iSCSI target. Only IPv4 addresses are accepted. Use <a>DescribeGatewayInformation</a> to get a list of the network interfaces available on a gateway.</p><p>Valid Values: A valid IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The name of the iSCSI target used by an initiator to connect to a volume and used as a suffix for the target ARN. For example, specifying <code>TargetName</code> as <i>myvolume</i> results in the target ARN of <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume</code>. The target name must be unique across all volumes on a gateway.</p><p>If you don't specify a value, Storage Gateway uses the value that was previously used for this volume as the new target name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetName;

/**
 <p>The Amazon Resource Name (ARN) of the volume to attach to the specified gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 <p>AttachVolumeOutput</p>
 */
@interface AWSStoragegatewayAttachVolumeOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the volume target, which includes the iSCSI name for the initiator that was used to connect to the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetARN;

/**
 <p>The Amazon Resource Name (ARN) of the volume that was attached to the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 <p>Information about the gateway's automatic tape creation policies, including the automatic tape creation rules and the gateway that is using the policies.</p>
 */
@interface AWSStoragegatewayAutomaticTapeCreationPolicyInfo : AWSModel


/**
 <p>An automatic tape creation policy consists of a list of automatic tape creation rules. This returns the rules that determine when and how to automatically create new tapes.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayAutomaticTapeCreationRule *> * _Nullable automaticTapeCreationRules;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>An automatic tape creation policy consists of automatic tape creation rules where each rule defines when and how to create new tapes.</p>
 Required parameters: [TapeBarcodePrefix, PoolId, TapeSizeInBytes, MinimumNumTapes]
 */
@interface AWSStoragegatewayAutomaticTapeCreationRule : AWSModel


/**
 <p>The minimum number of available virtual tapes that the gateway maintains at all times. If the number of tapes on the gateway goes below this value, the gateway creates as many new tapes as are needed to have <code>MinimumNumTapes</code> on the gateway.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimumNumTapes;

/**
 <p>The ID of the pool that you want to add your tape to for archiving. The tape in this pool is archived in the Amazon S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the storage class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.</p><p>Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable poolId;

/**
 <p>A prefix that you append to the barcode of the virtual tape that you are creating. This prefix makes the barcode unique.</p><note><p>The prefix must be 1-4 characters in length and must be one of the uppercase letters from A to Z.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable tapeBarcodePrefix;

/**
 <p>The size, in bytes, of the virtual tape capacity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tapeSizeInBytes;

@end

/**
 <p>Describes an iSCSI cached volume.</p>
 */
@interface AWSStoragegatewayCachediSCSIVolume : AWSModel


/**
 <p>The date the volume was created. Volumes created prior to March 28, 2017 don’t have this time stamp.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>If the cached volume was created from a snapshot, this field contains the snapshot ID used, e.g. snap-78e22663. Otherwise, this field is not included.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSnapshotId;

/**
 <p>The name of the iSCSI target used by an initiator to connect to a volume and used as a suffix for the target ARN. For example, specifying <code>TargetName</code> as <i>myvolume</i> results in the target ARN of <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume</code>. The target name must be unique across all volumes on a gateway.</p><p>If you don't specify a value, Storage Gateway uses the value that was previously used for this volume as the new target name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetName;

/**
 <p>The Amazon Resource Name (ARN) of the storage volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

/**
 <p>A value that indicates whether a storage volume is attached to or detached from a gateway. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#attach-detach-volume">Moving your volumes to a different gateway</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeAttachmentStatus;

/**
 <p>The unique identifier of the volume, e.g. vol-AE4B946D.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

/**
 <p>Represents the percentage complete if the volume is restoring or bootstrapping that represents the percent of data transferred. This field does not appear in the response if the cached volume is not restoring or bootstrapping.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeProgress;

/**
 <p>The size, in bytes, of the volume capacity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeInBytes;

/**
 <p>One of the VolumeStatus values that indicates the state of the storage volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeStatus;

/**
 <p>One of the VolumeType enumeration values that describes the type of the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeType;

/**
 <p>The size of the data stored on the volume in bytes. This value is calculated based on the number of blocks that are touched, instead of the actual amount of data written. This value can be useful for sequential write patterns but less accurate for random write patterns. <code>VolumeUsedInBytes</code> is different from the compressed size of the volume, which is the value that is used to calculate your bill.</p><note><p>This value is not available for volumes created prior to May 13, 2015, until you store data on the volume.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeUsedInBytes;

/**
 <p>An <a>VolumeiSCSIAttributes</a> object that represents a collection of iSCSI attributes for one stored volume.</p>
 */
@property (nonatomic, strong) AWSStoragegatewayVolumeiSCSIAttributes * _Nullable volumeiSCSIAttributes;

@end

/**
 <p>CancelArchivalInput</p>
 Required parameters: [GatewayARN, TapeARN]
 */
@interface AWSStoragegatewayCancelArchivalInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The Amazon Resource Name (ARN) of the virtual tape you want to cancel archiving for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>CancelArchivalOutput</p>
 */
@interface AWSStoragegatewayCancelArchivalOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the virtual tape for which archiving was canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>CancelRetrievalInput</p>
 Required parameters: [GatewayARN, TapeARN]
 */
@interface AWSStoragegatewayCancelRetrievalInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The Amazon Resource Name (ARN) of the virtual tape you want to cancel retrieval for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>CancelRetrievalOutput</p>
 */
@interface AWSStoragegatewayCancelRetrievalOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the virtual tape for which retrieval was canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>Describes Challenge-Handshake Authentication Protocol (CHAP) information that supports authentication between your gateway and iSCSI initiators.</p>
 */
@interface AWSStoragegatewayChapInfo : AWSModel


/**
 <p>The iSCSI initiator that connects to the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initiatorName;

/**
 <p>The secret key that the initiator (for example, the Windows client) must provide to participate in mutual CHAP with the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretToAuthenticateInitiator;

/**
 <p>The secret key that the target must provide to participate in mutual CHAP with the initiator (e.g. Windows client).</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretToAuthenticateTarget;

/**
 <p>The Amazon Resource Name (ARN) of the volume.</p><p>Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetARN;

@end

/**
 
 */
@interface AWSStoragegatewayCreateCachediSCSIVolumeInput : AWSRequest


/**
 <p>A unique identifier that you use to retry a request. If you retry a request, use the same <code>ClientToken</code> you specified in the initial request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>Set to <code>true</code> to use Amazon S3 server-side encryption with your own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3. Optional.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable KMSEncrypted;

/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The network interface of the gateway on which to expose the iSCSI target. Only IPv4 addresses are accepted. Use <a>DescribeGatewayInformation</a> to get a list of the network interfaces available on a gateway.</p><p>Valid Values: A valid IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The snapshot ID (e.g. "snap-1122aabb") of the snapshot to restore as the new cached volume. Specify this field if you want to create the iSCSI storage volume from a snapshot; otherwise, do not include this field. To list snapshots for your account use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html">DescribeSnapshots</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>The ARN for an existing volume. Specifying this ARN makes the new volume into an exact copy of the specified existing volume's latest recovery point. The <code>VolumeSizeInBytes</code> value for this new volume must be equal to or larger than the size of the existing volume, in bytes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceVolumeARN;

/**
 <p>A list of up to 50 tags that you can assign to a cached volume. Each tag is a key-value pair.</p><note><p>Valid characters for key and value are letters, spaces, and numbers that you can represent in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256 characters.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

/**
 <p>The name of the iSCSI target used by an initiator to connect to a volume and used as a suffix for the target ARN. For example, specifying <code>TargetName</code> as <i>myvolume</i> results in the target ARN of <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume</code>. The target name must be unique across all volumes on a gateway.</p><p>If you don't specify a value, Storage Gateway uses the value that was previously used for this volume as the new target name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetName;

/**
 <p>The size of the volume in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeInBytes;

@end

/**
 
 */
@interface AWSStoragegatewayCreateCachediSCSIVolumeOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the volume target, which includes the iSCSI name that initiators can use to connect to the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetARN;

/**
 <p>The Amazon Resource Name (ARN) of the configured volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 <p>CreateNFSFileShareInput</p>
 Required parameters: [ClientToken, GatewayARN, Role, LocationARN]
 */
@interface AWSStoragegatewayCreateNFSFileShareInput : AWSRequest


/**
 <p>The list of clients that are allowed to access the file gateway. The list must contain either valid IP addresses or valid CIDR blocks.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable clientList;

/**
 <p>A unique string value that you supply that is used by file gateway to ensure idempotent file share creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The default storage class for objects put into an Amazon S3 bucket by the file gateway. The default value is <code>S3_INTELLIGENT_TIERING</code>. Optional.</p><p>Valid Values: <code>S3_STANDARD</code> | <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> | <code>S3_ONEZONE_IA</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultStorageClass;

/**
 <p>The Amazon Resource Name (ARN) of the file gateway on which you want to create a file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set this value to <code>true</code> to enable MIME type guessing, otherwise set to <code>false</code>. The default value is <code>true</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable guessMIMETypeEnabled;

/**
 <p>Set to <code>true</code> to use Amazon S3 server-side encryption with your own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3. Optional.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable KMSEncrypted;

/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The ARN of the backed storage used for storing file data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locationARN;

/**
 <p>File share default values. Optional.</p>
 */
@property (nonatomic, strong) AWSStoragegatewayNFSFileShareDefaults * _Nullable NFSFileShareDefaults;

/**
 <p>A value that sets the access control list (ACL) permission for objects in the S3 bucket that a file gateway puts objects into. The default value is <code>private</code>.</p>
 */
@property (nonatomic, assign) AWSStoragegatewayObjectACL objectACL;

/**
 <p>A value that sets the write status of a file share. Set this value to <code>true</code> to set the write status to read-only, otherwise set to <code>false</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readOnly;

/**
 <p>A value that sets who pays the cost of the request and the cost associated with data download from the S3 bucket. If this value is set to <code>true</code>, the requester pays the costs; otherwise, the S3 bucket owner pays. However, the S3 bucket owner always pays the cost of storing data.</p><note><p><code>RequesterPays</code> is a configuration for the S3 bucket that backs the file share, so make sure that the configuration on the file share is the same as the S3 bucket configuration.</p></note><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requesterPays;

/**
 <p>The ARN of the AWS Identity and Access Management (IAM) role that a file gateway assumes when it accesses the underlying storage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>A value that maps a user to anonymous user.</p><p>Valid values are the following:</p><ul><li><p><code>RootSquash</code>: Only root is mapped to anonymous user.</p></li><li><p><code>NoSquash</code>: No one is mapped to anonymous user.</p></li><li><p><code>AllSquash</code>: Everyone is mapped to anonymous user.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable squash;

/**
 <p>A list of up to 50 tags that can be assigned to the NFS file share. Each tag is a key-value pair.</p><note><p>Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

@end

/**
 <p>CreateNFSFileShareOutput</p>
 */
@interface AWSStoragegatewayCreateNFSFileShareOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the newly created file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

@end

/**
 <p>CreateSMBFileShareInput</p>
 Required parameters: [ClientToken, GatewayARN, Role, LocationARN]
 */
@interface AWSStoragegatewayCreateSMBFileShareInput : AWSRequest


/**
 <p>A list of users in the Active Directory that will be granted administrator privileges on the file share. These users can do all file operations as the super-user.</p><important><p>Use this option very carefully, because any user in this list can do anything they like on the file share, regardless of file permissions.</p></important>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable adminUserList;

/**
 <p>The Amazon Resource Name (ARN) of the storage used for the audit logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable auditDestinationARN;

/**
 <p>The authentication method that users use to access the file share. The default is <code>ActiveDirectory</code>.</p><p>Valid Values: <code>ActiveDirectory</code> | <code>GuestAccess</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable authentication;

/**
 <p>A unique string value that you supply that is used by file gateway to ensure idempotent file share creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The default storage class for objects put into an Amazon S3 bucket by the file gateway. The default value is <code>S3_INTELLIGENT_TIERING</code>. Optional.</p><p>Valid Values: <code>S3_STANDARD</code> | <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> | <code>S3_ONEZONE_IA</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultStorageClass;

/**
 <p>The ARN of the file gateway on which you want to create a file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set this value to <code>true</code> to enable MIME type guessing, otherwise set to <code>false</code>. The default value is <code>true</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable guessMIMETypeEnabled;

/**
 <p>A list of users or groups in the Active Directory that are not allowed to access the file share. A group must be prefixed with the @ character. For example, <code>@group1</code>. Can only be set if Authentication is set to <code>ActiveDirectory</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable invalidUserList;

/**
 <p>Set to <code>true</code> to use Amazon S3 server-side encryption with your own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3. Optional.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable KMSEncrypted;

/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The ARN of the backed storage used for storing file data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locationARN;

/**
 <p>A value that sets the access control list (ACL) permission for objects in the S3 bucket that a file gateway puts objects into. The default value is <code>private</code>.</p>
 */
@property (nonatomic, assign) AWSStoragegatewayObjectACL objectACL;

/**
 <p>A value that sets the write status of a file share. Set this value to <code>true</code> to set the write status to read-only, otherwise set to <code>false</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readOnly;

/**
 <p>A value that sets who pays the cost of the request and the cost associated with data download from the S3 bucket. If this value is set to <code>true</code>, the requester pays the costs; otherwise, the S3 bucket owner pays. However, the S3 bucket owner always pays the cost of storing data.</p><note><p><code>RequesterPays</code> is a configuration for the S3 bucket that backs the file share, so make sure that the configuration on the file share is the same as the S3 bucket configuration.</p></note><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requesterPays;

/**
 <p>The ARN of the AWS Identity and Access Management (IAM) role that a file gateway assumes when it accesses the underlying storage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>Set this value to <code>true</code> to enable access control list (ACL) on the SMB file share. Set it to <code>false</code> to map file and directory permissions to the POSIX permissions.</p><p>For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/smb-acl.html">Using Microsoft Windows ACLs to control access to an SMB file share</a> in the <i>AWS Storage Gateway User Guide</i>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable SMBACLEnabled;

/**
 <p>A list of up to 50 tags that can be assigned to the NFS file share. Each tag is a key-value pair.</p><note><p>Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

/**
 <p>A list of users or groups in the Active Directory that are allowed to access the file share. A group must be prefixed with the @ character. For example, <code>@group1</code>. Can only be set if Authentication is set to <code>ActiveDirectory</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable validUserList;

@end

/**
 <p>CreateSMBFileShareOutput</p>
 */
@interface AWSStoragegatewayCreateSMBFileShareOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the newly created file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

@end

/**
 
 */
@interface AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointInput : AWSRequest


/**
 <p>Textual description of the snapshot that appears in the Amazon EC2 console, Elastic Block Store snapshots panel in the <b>Description</b> field, and in the AWS Storage Gateway snapshot <b>Details</b> pane, <b>Description</b> field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotDescription;

/**
 <p>A list of up to 50 tags that can be assigned to a snapshot. Each tag is a key-value pair.</p><note><p>Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

/**
 <p>The Amazon Resource Name (ARN) of the iSCSI volume target. Use the <a>DescribeStorediSCSIVolumes</a> operation to return to retrieve the TargetARN for specified VolumeARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 
 */
@interface AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput : AWSModel


/**
 <p>The ID of the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>The Amazon Resource Name (ARN) of the iSCSI volume target. Use the <a>DescribeStorediSCSIVolumes</a> operation to return to retrieve the TargetARN for specified VolumeARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

/**
 <p>The time the volume was created from the recovery point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeRecoveryPointTime;

@end

/**
 <p>A JSON object containing one or more of the following fields:</p><ul><li><p><a>CreateSnapshotInput$SnapshotDescription</a></p></li><li><p><a>CreateSnapshotInput$VolumeARN</a></p></li></ul>
 Required parameters: [VolumeARN, SnapshotDescription]
 */
@interface AWSStoragegatewayCreateSnapshotInput : AWSRequest


/**
 <p>Textual description of the snapshot that appears in the Amazon EC2 console, Elastic Block Store snapshots panel in the <b>Description</b> field, and in the AWS Storage Gateway snapshot <b>Details</b> pane, <b>Description</b> field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotDescription;

/**
 <p>A list of up to 50 tags that can be assigned to a snapshot. Each tag is a key-value pair.</p><note><p>Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

/**
 <p>The Amazon Resource Name (ARN) of the volume. Use the <a>ListVolumes</a> operation to return a list of gateway volumes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 <p>A JSON object containing the following fields:</p>
 */
@interface AWSStoragegatewayCreateSnapshotOutput : AWSModel


/**
 <p>The snapshot ID that is used to refer to the snapshot in future operations such as describing snapshots (Amazon Elastic Compute Cloud API <code>DescribeSnapshots</code>) or creating a volume from a snapshot (<a>CreateStorediSCSIVolume</a>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>The Amazon Resource Name (ARN) of the volume of which the snapshot was taken.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 <p>A JSON object containing one or more of the following fields:</p><ul><li><p><a>CreateStorediSCSIVolumeInput$DiskId</a></p></li><li><p><a>CreateStorediSCSIVolumeInput$NetworkInterfaceId</a></p></li><li><p><a>CreateStorediSCSIVolumeInput$PreserveExistingData</a></p></li><li><p><a>CreateStorediSCSIVolumeInput$SnapshotId</a></p></li><li><p><a>CreateStorediSCSIVolumeInput$TargetName</a></p></li></ul>
 Required parameters: [GatewayARN, DiskId, PreserveExistingData, TargetName, NetworkInterfaceId]
 */
@interface AWSStoragegatewayCreateStorediSCSIVolumeInput : AWSRequest


/**
 <p>The unique identifier for the gateway local disk that is configured as a stored volume. Use <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/API_ListLocalDisks.html">ListLocalDisks</a> to list disk IDs for a gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskId;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>Set to <code>true</code> to use Amazon S3 server-side encryption with your own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3. Optional.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable KMSEncrypted;

/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The network interface of the gateway on which to expose the iSCSI target. Only IPv4 addresses are accepted. Use <a>DescribeGatewayInformation</a> to get a list of the network interfaces available on a gateway.</p><p>Valid Values: A valid IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>Set to true <code>true</code> if you want to preserve the data on the local disk. Otherwise, set to <code>false</code> to create an empty volume.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable preserveExistingData;

/**
 <p>The snapshot ID (e.g. "snap-1122aabb") of the snapshot to restore as the new stored volume. Specify this field if you want to create the iSCSI storage volume from a snapshot; otherwise, do not include this field. To list snapshots for your account use <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html">DescribeSnapshots</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>A list of up to 50 tags that can be assigned to a stored volume. Each tag is a key-value pair.</p><note><p>Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

/**
 <p>The name of the iSCSI target used by an initiator to connect to a volume and used as a suffix for the target ARN. For example, specifying <code>TargetName</code> as <i>myvolume</i> results in the target ARN of <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume</code>. The target name must be unique across all volumes on a gateway.</p><p>If you don't specify a value, Storage Gateway uses the value that was previously used for this volume as the new target name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetName;

@end

/**
 <p>A JSON object containing the following fields:</p>
 */
@interface AWSStoragegatewayCreateStorediSCSIVolumeOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the volume target, which includes the iSCSI name that initiators can use to connect to the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetARN;

/**
 <p>The Amazon Resource Name (ARN) of the configured volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

/**
 <p>The size of the volume in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeInBytes;

@end

/**
 <p>CreateTapeWithBarcodeInput</p>
 Required parameters: [GatewayARN, TapeSizeInBytes, TapeBarcode]
 */
@interface AWSStoragegatewayCreateTapeWithBarcodeInput : AWSRequest


/**
 <p>The unique Amazon Resource Name (ARN) that represents the gateway to associate the virtual tape with. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>Set to <code>true</code> to use Amazon S3 server-side encryption with your own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3. Optional.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable KMSEncrypted;

/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The ID of the pool that you want to add your tape to for archiving. The tape in this pool is archived in the S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the storage class (S3 Glacier or S3 Deep Archive) that corresponds to the pool.</p><p>Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable poolId;

/**
 <p>A list of up to 50 tags that can be assigned to a virtual tape that has a barcode. Each tag is a key-value pair.</p><note><p>Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

/**
 <p>The barcode that you want to assign to the tape.</p><note><p>Barcodes cannot be reused. This includes barcodes used for tapes that have been deleted.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable tapeBarcode;

/**
 <p>The size, in bytes, of the virtual tape that you want to create.</p><note><p>The size must be aligned by gigabyte (1024*1024*1024 bytes).</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable tapeSizeInBytes;

@end

/**
 <p>CreateTapeOutput</p>
 */
@interface AWSStoragegatewayCreateTapeWithBarcodeOutput : AWSModel


/**
 <p>A unique Amazon Resource Name (ARN) that represents the virtual tape that was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>CreateTapesInput</p>
 Required parameters: [GatewayARN, TapeSizeInBytes, ClientToken, NumTapesToCreate, TapeBarcodePrefix]
 */
@interface AWSStoragegatewayCreateTapesInput : AWSRequest


/**
 <p>A unique identifier that you use to retry a request. If you retry a request, use the same <code>ClientToken</code> you specified in the initial request.</p><note><p>Using the same <code>ClientToken</code> prevents creating the tape multiple times.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The unique Amazon Resource Name (ARN) that represents the gateway to associate the virtual tapes with. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>Set to <code>true</code> to use Amazon S3 server-side encryption with your own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3. Optional.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable KMSEncrypted;

/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The number of virtual tapes that you want to create.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numTapesToCreate;

/**
 <p>The ID of the pool that you want to add your tape to for archiving. The tape in this pool is archived in the S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the storage class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.</p><p>Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable poolId;

/**
 <p>A list of up to 50 tags that can be assigned to a virtual tape. Each tag is a key-value pair.</p><note><p>Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

/**
 <p>A prefix that you append to the barcode of the virtual tape you are creating. This prefix makes the barcode unique.</p><note><p>The prefix must be 1 to 4 characters in length and must be one of the uppercase letters from A to Z.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable tapeBarcodePrefix;

/**
 <p>The size, in bytes, of the virtual tapes that you want to create.</p><note><p>The size must be aligned by gigabyte (1024*1024*1024 bytes).</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable tapeSizeInBytes;

@end

/**
 <p>CreateTapeOutput</p>
 */
@interface AWSStoragegatewayCreateTapesOutput : AWSModel


/**
 <p>A list of unique Amazon Resource Names (ARNs) that represents the virtual tapes that were created.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tapeARNs;

@end

/**
 
 */
@interface AWSStoragegatewayDeleteAutomaticTapeCreationPolicyInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the following fields:</p><ul><li><p><a>DeleteBandwidthRateLimitInput$BandwidthType</a></p></li></ul>
 Required parameters: [GatewayARN, BandwidthType]
 */
@interface AWSStoragegatewayDeleteBandwidthRateLimitInput : AWSRequest


/**
 <p>One of the BandwidthType values that indicates the gateway bandwidth rate limit to delete.</p><p>Valid Values: <code>Upload</code> | <code>Download</code> | <code>All</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable bandwidthType;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway whose bandwidth rate information was deleted.</p>
 */
@interface AWSStoragegatewayDeleteBandwidthRateLimitOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing one or more of the following fields:</p><ul><li><p><a>DeleteChapCredentialsInput$InitiatorName</a></p></li><li><p><a>DeleteChapCredentialsInput$TargetARN</a></p></li></ul>
 Required parameters: [TargetARN, InitiatorName]
 */
@interface AWSStoragegatewayDeleteChapCredentialsInput : AWSRequest


/**
 <p>The iSCSI initiator that connects to the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initiatorName;

/**
 <p>The Amazon Resource Name (ARN) of the iSCSI volume target. Use the <a>DescribeStorediSCSIVolumes</a> operation to return to retrieve the TargetARN for specified VolumeARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetARN;

@end

/**
 <p>A JSON object containing the following fields:</p>
 */
@interface AWSStoragegatewayDeleteChapCredentialsOutput : AWSModel


/**
 <p>The iSCSI initiator that connects to the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initiatorName;

/**
 <p>The Amazon Resource Name (ARN) of the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetARN;

@end

/**
 <p>DeleteFileShareInput</p>
 Required parameters: [FileShareARN]
 */
@interface AWSStoragegatewayDeleteFileShareInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the file share to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

/**
 <p>If this value is set to <code>true</code>, the operation deletes a file share immediately and aborts all data uploads to AWS. Otherwise, the file share is not deleted until all data is uploaded to AWS. This process aborts the data upload process, and the file share enters the <code>FORCE_DELETING</code> status.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceDelete;

@end

/**
 <p>DeleteFileShareOutput</p>
 */
@interface AWSStoragegatewayDeleteFileShareOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the deleted file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

@end

/**
 <p>A JSON object containing the ID of the gateway to delete.</p>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayDeleteGatewayInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the ID of the deleted gateway.</p>
 */
@interface AWSStoragegatewayDeleteGatewayOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayDeleteSnapshotScheduleInput : AWSRequest


/**
 <p>The volume which snapshot schedule to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 
 */
@interface AWSStoragegatewayDeleteSnapshotScheduleOutput : AWSModel


/**
 <p>The volume which snapshot schedule was deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 <p>DeleteTapeArchiveInput</p>
 Required parameters: [TapeARN]
 */
@interface AWSStoragegatewayDeleteTapeArchiveInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the virtual tape to delete from the virtual tape shelf (VTS).</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>DeleteTapeArchiveOutput</p>
 */
@interface AWSStoragegatewayDeleteTapeArchiveOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the virtual tape that was deleted from the virtual tape shelf (VTS).</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>DeleteTapeInput</p>
 Required parameters: [GatewayARN, TapeARN]
 */
@interface AWSStoragegatewayDeleteTapeInput : AWSRequest


/**
 <p>The unique Amazon Resource Name (ARN) of the gateway that the virtual tape to delete is associated with. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The Amazon Resource Name (ARN) of the virtual tape to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>DeleteTapeOutput</p>
 */
@interface AWSStoragegatewayDeleteTapeOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the deleted virtual tape.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>A JSON object containing the <a>DeleteVolumeInput$VolumeARN</a> to delete.</p>
 Required parameters: [VolumeARN]
 */
@interface AWSStoragegatewayDeleteVolumeInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the volume. Use the <a>ListVolumes</a> operation to return a list of gateway volumes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the storage volume that was deleted.</p>
 */
@interface AWSStoragegatewayDeleteVolumeOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the storage volume that was deleted. It is the same ARN you provided in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 
 */
@interface AWSStoragegatewayDescribeAvailabilityMonitorTestInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayDescribeAvailabilityMonitorTestOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The time the High Availability monitoring test was started. If a test hasn't been performed, the value of this field is null.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The status of the High Availability monitoring test. If a test hasn't been performed, the value of this field is null.</p>
 */
@property (nonatomic, assign) AWSStoragegatewayAvailabilityMonitorTestStatus status;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway.</p>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayDescribeBandwidthRateLimitInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the following fields:</p>
 */
@interface AWSStoragegatewayDescribeBandwidthRateLimitOutput : AWSModel


/**
 <p>The average download bandwidth rate limit in bits per second. This field does not appear in the response if the download rate limit is not set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable averageDownloadRateLimitInBitsPerSec;

/**
 <p>The average upload bandwidth rate limit in bits per second. This field does not appear in the response if the upload rate limit is not set.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable averageUploadRateLimitInBitsPerSec;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayDescribeCacheInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayDescribeCacheOutput : AWSModel


/**
 <p>The amount of cache in bytes allocated to a gateway.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cacheAllocatedInBytes;

/**
 <p>The file share's contribution to the overall percentage of the gateway's cache that has not been persisted to AWS. The sample is taken at the end of the reporting period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cacheDirtyPercentage;

/**
 <p>Percent of application read operations from the file shares that are served from cache. The sample is taken at the end of the reporting period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cacheHitPercentage;

/**
 <p>Percent of application read operations from the file shares that are not served from cache. The sample is taken at the end of the reporting period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cacheMissPercentage;

/**
 <p>Percent use of the gateway's cache storage. This metric applies only to the gateway-cached volume setup. The sample is taken at the end of the reporting period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cacheUsedPercentage;

/**
 <p>An array of strings that identify disks that are to be configured as working storage. Each string has a minimum length of 1 and maximum length of 300. You can get the disk IDs from the <a>ListLocalDisks</a> API.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable diskIds;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayDescribeCachediSCSIVolumesInput : AWSRequest


/**
 <p>An array of strings where each string represents the Amazon Resource Name (ARN) of a cached volume. All of the specified cached volumes must be from the same gateway. Use <a>ListVolumes</a> to get volume ARNs for a gateway.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable volumeARNs;

@end

/**
 <p>A JSON object containing the following fields:</p>
 */
@interface AWSStoragegatewayDescribeCachediSCSIVolumesOutput : AWSModel


/**
 <p>An array of objects where each object contains metadata about one cached volume.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayCachediSCSIVolume *> * _Nullable cachediSCSIVolumes;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the iSCSI volume target.</p>
 Required parameters: [TargetARN]
 */
@interface AWSStoragegatewayDescribeChapCredentialsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the iSCSI volume target. Use the <a>DescribeStorediSCSIVolumes</a> operation to return to retrieve the TargetARN for specified VolumeARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetARN;

@end

/**
 <p>A JSON object containing the following fields:</p>
 */
@interface AWSStoragegatewayDescribeChapCredentialsOutput : AWSModel


/**
 <p>An array of <a>ChapInfo</a> objects that represent CHAP credentials. Each object in the array contains CHAP credential information for one target-initiator pair. If no CHAP credentials are set, an empty array is returned. CHAP credential information is provided in a JSON object with the following fields:</p><ul><li><p><b>InitiatorName</b>: The iSCSI initiator that connects to the target.</p></li><li><p><b>SecretToAuthenticateInitiator</b>: The secret key that the initiator (for example, the Windows client) must provide to participate in mutual CHAP with the target.</p></li><li><p><b>SecretToAuthenticateTarget</b>: The secret key that the target must provide to participate in mutual CHAP with the initiator (e.g. Windows client).</p></li><li><p><b>TargetARN</b>: The Amazon Resource Name (ARN) of the storage volume.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayChapInfo *> * _Nullable chapCredentials;

@end

/**
 <p>A JSON object containing the ID of the gateway.</p>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayDescribeGatewayInformationInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the following fields:</p>
 */
@interface AWSStoragegatewayDescribeGatewayInformationOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Amazon CloudWatch Log Group that is used to monitor events in the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudWatchLogGroupARN;

/**
 <p>The ID of the Amazon EC2 instance that was used to launch the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ec2InstanceId;

/**
 <p>The AWS Region where the Amazon EC2 instance is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ec2InstanceRegion;

/**
 <p>The type of endpoint for your gateway.</p><p>Valid Values: <code>STANDARD</code> | <code>FIPS</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointType;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The unique identifier assigned to your gateway during activation. This ID becomes part of the gateway Amazon Resource Name (ARN), which you use as input for other operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

/**
 <p>The name you configured for your gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayName;

/**
 <p>A <a>NetworkInterface</a> array that contains descriptions of the gateway network interfaces.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayNetworkInterface *> * _Nullable gatewayNetworkInterfaces;

/**
 <p>A value that indicates the operating state of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayState;

/**
 <p>A value that indicates the time zone configured for the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayTimezone;

/**
 <p>The type of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayType;

/**
 <p>The type of hypervisor environment used by the host.</p>
 */
@property (nonatomic, assign) AWSStoragegatewayHostEnvironment hostEnvironment;

/**
 <p>The date on which the last software update was applied to the gateway. If the gateway has never been updated, this field does not return a value in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastSoftwareUpdate;

/**
 <p>The date on which an update to the gateway is available. This date is in the time zone of the gateway. If the gateway is not available for an update this field is not returned in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextUpdateAvailabilityDate;

/**
 <p>A list of up to 50 tags assigned to the gateway, sorted alphabetically by key name. Each tag is a key-value pair. For a gateway with more than 10 tags assigned, you can view all tags using the <code>ListTagsForResource</code> API operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

/**
 <p>The configuration settings for the virtual private cloud (VPC) endpoint for your gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VPCEndpoint;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway.</p>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayDescribeMaintenanceStartTimeInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the following fields:</p><ul><li><p><a>DescribeMaintenanceStartTimeOutput$DayOfMonth</a></p></li><li><p><a>DescribeMaintenanceStartTimeOutput$DayOfWeek</a></p></li><li><p><a>DescribeMaintenanceStartTimeOutput$HourOfDay</a></p></li><li><p><a>DescribeMaintenanceStartTimeOutput$MinuteOfHour</a></p></li><li><p><a>DescribeMaintenanceStartTimeOutput$Timezone</a></p></li></ul>
 */
@interface AWSStoragegatewayDescribeMaintenanceStartTimeOutput : AWSModel


/**
 <p>The day of the month component of the maintenance start time represented as an ordinal number from 1 to 28, where 1 represents the first day of the month and 28 represents the last day of the month.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dayOfMonth;

/**
 <p>An ordinal number between 0 and 6 that represents the day of the week, where 0 represents Sunday and 6 represents Saturday. The day of week is in the time zone of the gateway.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dayOfWeek;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The hour component of the maintenance start time represented as <i>hh</i>, where <i>hh</i> is the hour (0 to 23). The hour of the day is in the time zone of the gateway.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hourOfDay;

/**
 <p>The minute component of the maintenance start time represented as <i>mm</i>, where <i>mm</i> is the minute (0 to 59). The minute of the hour is in the time zone of the gateway.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minuteOfHour;

/**
 <p>A value that indicates the time zone that is set for the gateway. The start time and day of week specified should be in the time zone of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

@end

/**
 <p>DescribeNFSFileSharesInput</p>
 Required parameters: [FileShareARNList]
 */
@interface AWSStoragegatewayDescribeNFSFileSharesInput : AWSRequest


/**
 <p>An array containing the Amazon Resource Name (ARN) of each file share to be described.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable fileShareARNList;

@end

/**
 <p>DescribeNFSFileSharesOutput</p>
 */
@interface AWSStoragegatewayDescribeNFSFileSharesOutput : AWSModel


/**
 <p>An array containing a description for each requested file share.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayNFSFileShareInfo *> * _Nullable NFSFileShareInfoList;

@end

/**
 <p>DescribeSMBFileSharesInput</p>
 Required parameters: [FileShareARNList]
 */
@interface AWSStoragegatewayDescribeSMBFileSharesInput : AWSRequest


/**
 <p>An array containing the Amazon Resource Name (ARN) of each file share to be described.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable fileShareARNList;

@end

/**
 <p>DescribeSMBFileSharesOutput</p>
 */
@interface AWSStoragegatewayDescribeSMBFileSharesOutput : AWSModel


/**
 <p>An array containing a description for each requested file share.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewaySMBFileShareInfo *> * _Nullable SMBFileShareInfoList;

@end

/**
 
 */
@interface AWSStoragegatewayDescribeSMBSettingsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayDescribeSMBSettingsOutput : AWSModel


/**
 <p>Indicates the status of a gateway that is a member of the Active Directory domain.</p><ul><li><p><code>ACCESS_DENIED</code>: Indicates that the <code>JoinDomain</code> operation failed due to an authentication error.</p></li><li><p><code>DETACHED</code>: Indicates that gateway is not joined to a domain.</p></li><li><p><code>JOINED</code>: Indicates that the gateway has successfully joined a domain.</p></li><li><p><code>JOINING</code>: Indicates that a <code>JoinDomain</code> operation is in progress.</p></li><li><p><code>NETWORK_ERROR</code>: Indicates that <code>JoinDomain</code> operation failed due to a network or connectivity error.</p></li><li><p><code>TIMEOUT</code>: Indicates that the <code>JoinDomain</code> operation failed because the operation didn't complete within the allotted time.</p></li><li><p><code>UNKNOWN_ERROR</code>: Indicates that the <code>JoinDomain</code> operation failed due to another type of error.</p></li></ul>
 */
@property (nonatomic, assign) AWSStoragegatewayActiveDirectoryStatus activeDirectoryStatus;

/**
 <p>The name of the domain that the gateway is joined to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>This value is <code>true</code> if a password for the guest user <code>smbguest</code> is set, otherwise <code>false</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable SMBGuestPasswordSet;

/**
 <p>The type of security strategy that was specified for file gateway.</p><ul><li><p><code>ClientSpecified</code>: If you use this option, requests are established based on what is negotiated by the client. This option is recommended when you want to maximize compatibility across different clients in your environment.</p></li><li><p><code>MandatorySigning</code>: If you use this option, file gateway only allows connections from SMBv2 or SMBv3 clients that have signing enabled. This option works with SMB clients on Microsoft Windows Vista, Windows Server 2008 or newer.</p></li><li><p><code>MandatoryEncryption</code>: If you use this option, file gateway only allows connections from SMBv3 clients that have encryption enabled. This option is highly recommended for environments that handle sensitive data. This option works with SMB clients on Microsoft Windows 8, Windows Server 2012 or newer.</p></li></ul>
 */
@property (nonatomic, assign) AWSStoragegatewaySMBSecurityStrategy SMBSecurityStrategy;

@end

/**
 <p>A JSON object containing the <a>DescribeSnapshotScheduleInput$VolumeARN</a> of the volume.</p>
 Required parameters: [VolumeARN]
 */
@interface AWSStoragegatewayDescribeSnapshotScheduleInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the volume. Use the <a>ListVolumes</a> operation to return a list of gateway volumes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 
 */
@interface AWSStoragegatewayDescribeSnapshotScheduleOutput : AWSModel


/**
 <p>The snapshot description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The number of hours between snapshots.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recurrenceInHours;

/**
 <p>The hour of the day at which the snapshot schedule begins represented as <i>hh</i>, where <i>hh</i> is the hour (0 to 23). The hour of the day is in the time zone of the gateway.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startAt;

/**
 <p>A list of up to 50 tags assigned to the snapshot schedule, sorted alphabetically by key name. Each tag is a key-value pair. For a gateway with more than 10 tags assigned, you can view all tags using the <code>ListTagsForResource</code> API operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

/**
 <p>A value that indicates the time zone of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

/**
 <p>The Amazon Resource Name (ARN) of the volume that was specified in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 <p>A JSON object containing a list of <a>DescribeStorediSCSIVolumesInput$VolumeARNs</a>.</p>
 Required parameters: [VolumeARNs]
 */
@interface AWSStoragegatewayDescribeStorediSCSIVolumesInput : AWSRequest


/**
 <p>An array of strings where each string represents the Amazon Resource Name (ARN) of a stored volume. All of the specified stored volumes must be from the same gateway. Use <a>ListVolumes</a> to get volume ARNs for a gateway.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable volumeARNs;

@end

/**
 
 */
@interface AWSStoragegatewayDescribeStorediSCSIVolumesOutput : AWSModel


/**
 <p>Describes a single unit of output from <a>DescribeStorediSCSIVolumes</a>. The following fields are returned:</p><ul><li><p><code>ChapEnabled</code>: Indicates whether mutual CHAP is enabled for the iSCSI target.</p></li><li><p><code>LunNumber</code>: The logical disk number.</p></li><li><p><code>NetworkInterfaceId</code>: The network interface ID of the stored volume that initiator use to map the stored volume as an iSCSI target.</p></li><li><p><code>NetworkInterfacePort</code>: The port used to communicate with iSCSI targets.</p></li><li><p><code>PreservedExistingData</code>: Indicates when the stored volume was created, existing data on the underlying local disk was preserved.</p></li><li><p><code>SourceSnapshotId</code>: If the stored volume was created from a snapshot, this field contains the snapshot ID used, e.g. <code>snap-1122aabb</code>. Otherwise, this field is not included.</p></li><li><p><code>StorediSCSIVolumes</code>: An array of StorediSCSIVolume objects where each object contains metadata about one stored volume.</p></li><li><p><code>TargetARN</code>: The Amazon Resource Name (ARN) of the volume target.</p></li><li><p><code>VolumeARN</code>: The Amazon Resource Name (ARN) of the stored volume.</p></li><li><p><code>VolumeDiskId</code>: The disk ID of the local disk that was specified in the <a>CreateStorediSCSIVolume</a> operation.</p></li><li><p><code>VolumeId</code>: The unique identifier of the storage volume, e.g. <code>vol-1122AABB</code>.</p></li><li><p><code>VolumeiSCSIAttributes</code>: An <a>VolumeiSCSIAttributes</a> object that represents a collection of iSCSI attributes for one stored volume.</p></li><li><p><code>VolumeProgress</code>: Represents the percentage complete if the volume is restoring or bootstrapping that represents the percent of data transferred. This field does not appear in the response if the stored volume is not restoring or bootstrapping.</p></li><li><p><code>VolumeSizeInBytes</code>: The size of the volume in bytes.</p></li><li><p><code>VolumeStatus</code>: One of the <code>VolumeStatus</code> values that indicates the state of the volume.</p></li><li><p><code>VolumeType</code>: One of the enumeration values describing the type of the volume. Currently, only <code>STORED</code> volumes are supported.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayStorediSCSIVolume *> * _Nullable storediSCSIVolumes;

@end

/**
 <p>DescribeTapeArchivesInput</p>
 */
@interface AWSStoragegatewayDescribeTapeArchivesInput : AWSRequest


/**
 <p>Specifies that the number of virtual tapes described be limited to the specified number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>An opaque string that indicates the position at which to begin describing virtual tapes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Specifies one or more unique Amazon Resource Names (ARNs) that represent the virtual tapes you want to describe.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tapeARNs;

@end

/**
 <p>DescribeTapeArchivesOutput</p>
 */
@interface AWSStoragegatewayDescribeTapeArchivesOutput : AWSModel


/**
 <p>An opaque string that indicates the position at which the virtual tapes that were fetched for description ended. Use this marker in your next request to fetch the next set of virtual tapes in the virtual tape shelf (VTS). If there are no more virtual tapes to describe, this field does not appear in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An array of virtual tape objects in the virtual tape shelf (VTS). The description includes of the Amazon Resource Name (ARN) of the virtual tapes. The information returned includes the Amazon Resource Names (ARNs) of the tapes, size of the tapes, status of the tapes, progress of the description, and tape barcode.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTapeArchive *> * _Nullable tapeArchives;

@end

/**
 <p>DescribeTapeRecoveryPointsInput</p>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayDescribeTapeRecoveryPointsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>Specifies that the number of virtual tape recovery points that are described be limited to the specified number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>An opaque string that indicates the position at which to begin describing the virtual tape recovery points.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>DescribeTapeRecoveryPointsOutput</p>
 */
@interface AWSStoragegatewayDescribeTapeRecoveryPointsOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>An opaque string that indicates the position at which the virtual tape recovery points that were listed for description ended.</p><p>Use this marker in your next request to list the next set of virtual tape recovery points in the list. If there are no more recovery points to describe, this field does not appear in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An array of TapeRecoveryPointInfos that are available for the specified gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTapeRecoveryPointInfo *> * _Nullable tapeRecoveryPointInfos;

@end

/**
 <p>DescribeTapesInput</p>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayDescribeTapesInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>Specifies that the number of virtual tapes described be limited to the specified number.</p><note><p>Amazon Web Services may impose its own limit, if this field is not set.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>A marker value, obtained in a previous call to <code>DescribeTapes</code>. This marker indicates which page of results to retrieve.</p><p>If not specified, the first page of results is retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Specifies one or more unique Amazon Resource Names (ARNs) that represent the virtual tapes you want to describe. If this parameter is not specified, Tape gateway returns a description of all virtual tapes associated with the specified gateway.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tapeARNs;

@end

/**
 <p>DescribeTapesOutput</p>
 */
@interface AWSStoragegatewayDescribeTapesOutput : AWSModel


/**
 <p>An opaque string which can be used as part of a subsequent DescribeTapes call to retrieve the next page of results.</p><p>If a response does not contain a marker, then there are no more results to be retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An array of virtual tape descriptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTape *> * _Nullable tapes;

@end

/**
 
 */
@interface AWSStoragegatewayDescribeUploadBufferInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayDescribeUploadBufferOutput : AWSModel


/**
 <p>An array of the gateway's local disk IDs that are configured as working storage. Each local disk ID is specified as a string (minimum length of 1 and maximum length of 300). If no local disks are configured as working storage, then the DiskIds array is empty.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable diskIds;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The total number of bytes allocated in the gateway's as upload buffer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable uploadBufferAllocatedInBytes;

/**
 <p>The total number of bytes being used in the gateway's upload buffer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable uploadBufferUsedInBytes;

@end

/**
 <p>DescribeVTLDevicesInput</p>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayDescribeVTLDevicesInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>Specifies that the number of VTL devices described be limited to the specified number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>An opaque string that indicates the position at which to begin describing the VTL devices.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An array of strings, where each string represents the Amazon Resource Name (ARN) of a VTL device.</p><note><p>All of the specified VTL devices must be from the same gateway. If no VTL devices are specified, the result will contain all devices on the specified gateway.</p></note>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable VTLDeviceARNs;

@end

/**
 <p>DescribeVTLDevicesOutput</p>
 */
@interface AWSStoragegatewayDescribeVTLDevicesOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>An opaque string that indicates the position at which the VTL devices that were fetched for description ended. Use the marker in your next request to fetch the next set of VTL devices in the list. If there are no more VTL devices to describe, this field does not appear in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An array of VTL device objects composed of the Amazon Resource Name (ARN) of the VTL devices.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayVTLDevice *> * _Nullable VTLDevices;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway.</p>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayDescribeWorkingStorageInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the following fields:</p>
 */
@interface AWSStoragegatewayDescribeWorkingStorageOutput : AWSModel


/**
 <p>An array of the gateway's local disk IDs that are configured as working storage. Each local disk ID is specified as a string (minimum length of 1 and maximum length of 300). If no local disks are configured as working storage, then the DiskIds array is empty.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable diskIds;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The total working storage in bytes allocated for the gateway. If no working storage is configured for the gateway, this field returns 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable workingStorageAllocatedInBytes;

/**
 <p>The total working storage in bytes in use by the gateway. If no working storage is configured for the gateway, this field returns 0.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable workingStorageUsedInBytes;

@end

/**
 <p>AttachVolumeInput</p>
 Required parameters: [VolumeARN]
 */
@interface AWSStoragegatewayDetachVolumeInput : AWSRequest


/**
 <p>Set to <code>true</code> to forcibly remove the iSCSI connection of the target volume and detach the volume. The default is <code>false</code>. If this value is set to <code>false</code>, you must manually disconnect the iSCSI connection from the target volume.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceDetach;

/**
 <p>The Amazon Resource Name (ARN) of the volume to detach from the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 <p>AttachVolumeOutput</p>
 */
@interface AWSStoragegatewayDetachVolumeOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the volume that was detached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 <p>Lists iSCSI information about a VTL device.</p>
 */
@interface AWSStoragegatewayDeviceiSCSIAttributes : AWSModel


/**
 <p>Indicates whether mutual CHAP is enabled for the iSCSI target.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable chapEnabled;

/**
 <p>The network interface identifier of the VTL device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The port used to communicate with iSCSI VTL device targets.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable networkInterfacePort;

/**
 <p>Specifies the unique Amazon Resource Name (ARN) that encodes the iSCSI qualified name(iqn) of a tape drive or media changer target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetARN;

@end

/**
 <p>DisableGatewayInput</p>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayDisableGatewayInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>DisableGatewayOutput</p>
 */
@interface AWSStoragegatewayDisableGatewayOutput : AWSModel


/**
 <p>The unique Amazon Resource Name (ARN) of the disabled gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>Represents a gateway's local disk.</p>
 */
@interface AWSStoragegatewayDisk : AWSModel


/**
 <p>The iSCSI qualified name (IQN) that is defined for a disk. This field is not included in the response if the local disk is not defined as an iSCSI target. The format of this field is <i>targetIqn::LUNNumber::region-volumeId</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskAllocationResource;

/**
 <p>One of the <code>DiskAllocationType</code> enumeration values that identifies how a local disk is used.</p><p>Valid Values: <code>UPLOAD_BUFFER</code> | <code>CACHE_STORAGE</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable diskAllocationType;

/**
 <p>A list of values that represents attributes of a local disk.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable diskAttributeList;

/**
 <p>The unique device ID or other distinguishing data that identifies a local disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskId;

/**
 <p>The device node of a local disk as assigned by the virtualization environment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskNode;

/**
 <p>The path of a local disk in the gateway virtual machine (VM).</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskPath;

/**
 <p>The local disk size in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable diskSizeInBytes;

/**
 <p>A value that represents the status of a local disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskStatus;

@end

/**
 <p>Describes a file share.</p>
 */
@interface AWSStoragegatewayFileShareInfo : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

/**
 <p>The ID of the file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareId;

/**
 <p>The status of the file share.</p><p>Valid Values: <code>CREATING</code> | <code>UPDATING</code> | <code>AVAILABLE</code> | <code>DELETING</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareStatus;

/**
 <p>The type of the file share.</p>
 */
@property (nonatomic, assign) AWSStoragegatewayFileShareType fileShareType;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>Describes a gateway object.</p>
 */
@interface AWSStoragegatewayGatewayInfo : AWSModel


/**
 <p>The ID of the Amazon EC2 instance that was used to launch the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ec2InstanceId;

/**
 <p>The AWS Region where the Amazon EC2 instance is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ec2InstanceRegion;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The unique identifier assigned to your gateway during activation. This ID becomes part of the gateway Amazon Resource Name (ARN), which you use as input for other operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

/**
 <p>The name of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayName;

/**
 <p>The state of the gateway.</p><p>Valid Values: <code>DISABLED</code> | <code>ACTIVE</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayOperationalState;

/**
 <p>The type of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayType;

@end

/**
 <p>JoinDomainInput</p>
 Required parameters: [GatewayARN, DomainName, UserName, Password]
 */
@interface AWSStoragegatewayJoinDomainInput : AWSRequest


/**
 <p>List of IPv4 addresses, NetBIOS names, or host names of your domain server. If you need to specify the port number include it after the colon (“:”). For example, <code>mydc.mydomain.com:389</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable domainControllers;

/**
 <p>The name of the domain that you want the gateway to join.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <code>ListGateways</code> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The organizational unit (OU) is a container in an Active Directory that can hold users, groups, computers, and other OUs and this parameter specifies the OU that the gateway will join within the AD domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationalUnit;

/**
 <p>Sets the password of the user who has permission to add the gateway to the Active Directory domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>Specifies the time in seconds, in which the <code>JoinDomain</code> operation must complete. The default is 20 seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable timeoutInSeconds;

/**
 <p>Sets the user name of user who has permission to add the gateway to the Active Directory domain. The domain user account should be enabled to join computers to the domain. For example, you can use the domain administrator account or an account with delegated permissions to join computers to the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>JoinDomainOutput</p>
 */
@interface AWSStoragegatewayJoinDomainOutput : AWSModel


/**
 <p>Indicates the status of the gateway as a member of the Active Directory domain.</p><ul><li><p><code>ACCESS_DENIED</code>: Indicates that the <code>JoinDomain</code> operation failed due to an authentication error.</p></li><li><p><code>DETACHED</code>: Indicates that gateway is not joined to a domain.</p></li><li><p><code>JOINED</code>: Indicates that the gateway has successfully joined a domain.</p></li><li><p><code>JOINING</code>: Indicates that a <code>JoinDomain</code> operation is in progress.</p></li><li><p><code>NETWORK_ERROR</code>: Indicates that <code>JoinDomain</code> operation failed due to a network or connectivity error.</p></li><li><p><code>TIMEOUT</code>: Indicates that the <code>JoinDomain</code> operation failed because the operation didn't complete within the allotted time.</p></li><li><p><code>UNKNOWN_ERROR</code>: Indicates that the <code>JoinDomain</code> operation failed due to another type of error.</p></li></ul>
 */
@property (nonatomic, assign) AWSStoragegatewayActiveDirectoryStatus activeDirectoryStatus;

/**
 <p>The unique Amazon Resource Name (ARN) of the gateway that joined the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayListAutomaticTapeCreationPoliciesInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput : AWSModel


/**
 <p>Gets a listing of information about the gateway's automatic tape creation policies, including the automatic tape creation rules and the gateway that is using the policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayAutomaticTapeCreationPolicyInfo *> * _Nullable automaticTapeCreationPolicyInfos;

@end

/**
 <p>ListFileShareInput</p>
 */
@interface AWSStoragegatewayListFileSharesInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway whose file shares you want to list. If this field is not present, all file shares under your account are listed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The maximum number of file shares to return in the response. The value must be an integer with a value greater than zero. Optional.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>Opaque pagination token returned from a previous ListFileShares operation. If present, <code>Marker</code> specifies where to continue the list from after a previous call to ListFileShares. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>ListFileShareOutput</p>
 */
@interface AWSStoragegatewayListFileSharesOutput : AWSModel


/**
 <p>An array of information about the file gateway's file shares.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayFileShareInfo *> * _Nullable fileShareInfoList;

/**
 <p>If the request includes <code>Marker</code>, the response returns that value in this field.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>If a value is present, there are more file shares to return. In a subsequent request, use <code>NextMarker</code> as the value for <code>Marker</code> to retrieve the next set of file shares.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>A JSON object containing zero or more of the following fields:</p><ul><li><p><a>ListGatewaysInput$Limit</a></p></li><li><p><a>ListGatewaysInput$Marker</a></p></li></ul>
 */
@interface AWSStoragegatewayListGatewaysInput : AWSRequest


/**
 <p>Specifies that the list of gateways returned be limited to the specified number of items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>An opaque string that indicates the position at which to begin the returned list of gateways.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSStoragegatewayListGatewaysOutput : AWSModel


/**
 <p>An array of <a>GatewayInfo</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayGatewayInfo *> * _Nullable gateways;

/**
 <p>Use the marker in your next request to fetch the next set of gateways in the list. If there are no more gateways to list, this field does not appear in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway.</p>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayListLocalDisksInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayListLocalDisksOutput : AWSModel


/**
 <p>A JSON object containing the following fields:</p><ul><li><p><a>ListLocalDisksOutput$Disks</a></p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayDisk *> * _Nullable disks;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>ListTagsForResourceInput</p>
 Required parameters: [ResourceARN]
 */
@interface AWSStoragegatewayListTagsForResourceInput : AWSRequest


/**
 <p>Specifies that the list of tags returned be limited to the specified number of items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>An opaque string that indicates the position at which to begin returning the list of tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The Amazon Resource Name (ARN) of the resource for which you want to list tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

@end

/**
 <p>ListTagsForResourceOutput</p>
 */
@interface AWSStoragegatewayListTagsForResourceOutput : AWSModel


/**
 <p>An opaque string that indicates the position at which to stop returning the list of tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>he Amazon Resource Name (ARN) of the resource for which you want to list tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>An array that contains the tags for the specified resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

@end

/**
 <p>A JSON object that contains one or more of the following fields:</p><ul><li><p><a>ListTapesInput$Limit</a></p></li><li><p><a>ListTapesInput$Marker</a></p></li><li><p><a>ListTapesInput$TapeARNs</a></p></li></ul>
 */
@interface AWSStoragegatewayListTapesInput : AWSRequest


/**
 <p>An optional number limit for the tapes in the list returned by this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>A string that indicates the position at which to begin the returned list of tapes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The Amazon Resource Name (ARN) of each of the tapes you want to list. If you don't specify a tape ARN, the response lists all tapes in both your VTL and VTS.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tapeARNs;

@end

/**
 <p>A JSON object containing the following fields:</p><ul><li><p><a>ListTapesOutput$Marker</a></p></li><li><p><a>ListTapesOutput$VolumeInfos</a></p></li></ul>
 */
@interface AWSStoragegatewayListTapesOutput : AWSModel


/**
 <p>A string that indicates the position at which to begin returning the next list of tapes. Use the marker in your next request to continue pagination of tapes. If there are no more tapes to list, this element does not appear in the response body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An array of <a>TapeInfo</a> objects, where each object describes a single tape. If there are no tapes in the tape library or VTS, then the <code>TapeInfos</code> is an empty array.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTapeInfo *> * _Nullable tapeInfos;

@end

/**
 <p>ListVolumeInitiatorsInput</p>
 Required parameters: [VolumeARN]
 */
@interface AWSStoragegatewayListVolumeInitiatorsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the volume. Use the <a>ListVolumes</a> operation to return a list of gateway volumes for the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 <p>ListVolumeInitiatorsOutput</p>
 */
@interface AWSStoragegatewayListVolumeInitiatorsOutput : AWSModel


/**
 <p>The host names and port numbers of all iSCSI initiators that are connected to the gateway.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable initiators;

@end

/**
 
 */
@interface AWSStoragegatewayListVolumeRecoveryPointsInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayListVolumeRecoveryPointsOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>An array of <a>VolumeRecoveryPointInfo</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayVolumeRecoveryPointInfo *> * _Nullable volumeRecoveryPointInfos;

@end

/**
 <p>A JSON object that contains one or more of the following fields:</p><ul><li><p><a>ListVolumesInput$Limit</a></p></li><li><p><a>ListVolumesInput$Marker</a></p></li></ul>
 */
@interface AWSStoragegatewayListVolumesInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>Specifies that the list of volumes returned be limited to the specified number of items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>A string that indicates the position at which to begin the returned list of volumes. Obtain the marker from the response of a previous List iSCSI Volumes request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 <p>A JSON object containing the following fields:</p><ul><li><p><a>ListVolumesOutput$Marker</a></p></li><li><p><a>ListVolumesOutput$VolumeInfos</a></p></li></ul>
 */
@interface AWSStoragegatewayListVolumesOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>Use the marker in your next request to continue pagination of iSCSI volumes. If there are no more volumes to list, this field does not appear in the response body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>An array of <a>VolumeInfo</a> objects, where each object describes an iSCSI volume. If no volumes are defined for the gateway, then <code>VolumeInfos</code> is an empty array "[]".</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayVolumeInfo *> * _Nullable volumeInfos;

@end

/**
 <p>Describes Network File System (NFS) file share default values. Files and folders stored as Amazon S3 objects in S3 buckets don't, by default, have Unix file permissions assigned to them. Upon discovery in an S3 bucket by Storage Gateway, the S3 objects that represent files and folders are assigned these default Unix permissions. This operation is only supported for file gateways.</p>
 */
@interface AWSStoragegatewayNFSFileShareDefaults : AWSModel


/**
 <p>The Unix directory mode in the form "nnnn". For example, <code>0666</code> represents the default access mode for all directories inside the file share. The default value is <code>0777</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directoryMode;

/**
 <p>The Unix file mode in the form "nnnn". For example, <code>0666</code> represents the default file mode inside the file share. The default value is <code>0666</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileMode;

/**
 <p>The default group ID for the file share (unless the files have another group ID specified). The default value is <code>nfsnobody</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable groupId;

/**
 <p>The default owner ID for files in the file share (unless the files have another owner ID specified). The default value is <code>nfsnobody</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ownerId;

@end

/**
 <p>The Unix file permissions and ownership information assigned, by default, to native S3 objects when file gateway discovers them in S3 buckets. This operation is only supported in file gateways.</p>
 */
@interface AWSStoragegatewayNFSFileShareInfo : AWSModel


/**
 <p>The list of clients that are allowed to access the file gateway. The list must contain either valid IP addresses or valid CIDR blocks.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable clientList;

/**
 <p>The default storage class for objects put into an Amazon S3 bucket by the file gateway. The default value is <code>S3_INTELLIGENT_TIERING</code>. Optional.</p><p>Valid Values: <code>S3_STANDARD</code> | <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> | <code>S3_ONEZONE_IA</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultStorageClass;

/**
 <p>The Amazon Resource Name (ARN) of the file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

/**
 <p>The ID of the file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareId;

/**
 <p>The status of the file share.</p><p>Valid Values: <code>CREATING</code> | <code>UPDATING</code> | <code>AVAILABLE</code> | <code>DELETING</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareStatus;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set this value to <code>true</code> to enable MIME type guessing, otherwise set to <code>false</code>. The default value is <code>true</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable guessMIMETypeEnabled;

/**
 <p>Set to <code>true</code> to use Amazon S3 server-side encryption with your own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3. Optional.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable KMSEncrypted;

/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The ARN of the backend storage used for storing file data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locationARN;

/**
 <p>Describes Network File System (NFS) file share default values. Files and folders stored as Amazon S3 objects in S3 buckets don't, by default, have Unix file permissions assigned to them. Upon discovery in an S3 bucket by Storage Gateway, the S3 objects that represent files and folders are assigned these default Unix permissions. This operation is only supported for file gateways.</p>
 */
@property (nonatomic, strong) AWSStoragegatewayNFSFileShareDefaults * _Nullable NFSFileShareDefaults;

/**
 <p>A value that sets the access control list (ACL) permission for objects in the S3 bucket that a file gateway puts objects into. The default value is <code>private</code>.</p>
 */
@property (nonatomic, assign) AWSStoragegatewayObjectACL objectACL;

/**
 <p>The file share path used by the NFS client to identify the mount point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>A value that sets the write status of a file share. Set this value to <code>true</code> to set the write status to read-only, otherwise set to <code>false</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readOnly;

/**
 <p>A value that sets who pays the cost of the request and the cost associated with data download from the S3 bucket. If this value is set to <code>true</code>, the requester pays the costs; otherwise, the S3 bucket owner pays. However, the S3 bucket owner always pays the cost of storing data.</p><note><p><code>RequesterPays</code> is a configuration for the S3 bucket that backs the file share, so make sure that the configuration on the file share is the same as the S3 bucket configuration.</p></note><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requesterPays;

/**
 <p>The ARN of the IAM role that file gateway assumes when it accesses the underlying storage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>The user mapped to anonymous user. Valid options are the following:</p><ul><li><p><code>RootSquash</code>: Only root is mapped to anonymous user.</p></li><li><p><code>NoSquash</code>: No one is mapped to anonymous user.</p></li><li><p><code>AllSquash</code>: Everyone is mapped to anonymous user.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable squash;

/**
 <p>A list of up to 50 tags assigned to the NFS file share, sorted alphabetically by key name. Each tag is a key-value pair. For a gateway with more than 10 tags assigned, you can view all tags using the <code>ListTagsForResource</code> API operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

@end

/**
 <p>Describes a gateway's network interface.</p>
 */
@interface AWSStoragegatewayNetworkInterface : AWSModel


/**
 <p>The Internet Protocol version 4 (IPv4) address of the interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipv4Address;

/**
 <p>The Internet Protocol version 6 (IPv6) address of the interface. <i>Currently not supported</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipv6Address;

/**
 <p>The Media Access Control (MAC) address of the interface.</p><note><p>This is currently unsupported and will not be returned in output.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable macAddress;

@end

/**
 
 */
@interface AWSStoragegatewayNotifyWhenUploadedInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

@end

/**
 
 */
@interface AWSStoragegatewayNotifyWhenUploadedOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

/**
 <p>The randomly generated ID of the notification that was sent. This ID is in UUID format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationId;

@end

/**
 <p>RefreshCacheInput</p>
 Required parameters: [FileShareARN]
 */
@interface AWSStoragegatewayRefreshCacheInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the file share you want to refresh.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

/**
 <p>A comma-separated list of the paths of folders to refresh in the cache. The default is [<code>"/"</code>]. The default refreshes objects and folders at the root of the Amazon S3 bucket. If <code>Recursive</code> is set to <code>true</code>, the entire S3 bucket that the file share has access to is refreshed.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable folderList;

/**
 <p>A value that specifies whether to recursively refresh folders in the cache. The refresh includes folders that were in the cache the last time the gateway listed the folder's contents. If this value set to <code>true</code>, each folder that is listed in <code>FolderList</code> is recursively updated. Otherwise, subfolders listed in <code>FolderList</code> are not refreshed. Only objects that are in folders listed directly under <code>FolderList</code> are found and used for the update. The default is <code>true</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recursive;

@end

/**
 <p>RefreshCacheOutput</p>
 */
@interface AWSStoragegatewayRefreshCacheOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

/**
 <p>The randomly generated ID of the notification that was sent. This ID is in UUID format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notificationId;

@end

/**
 <p>RemoveTagsFromResourceInput</p>
 Required parameters: [ResourceARN, TagKeys]
 */
@interface AWSStoragegatewayRemoveTagsFromResourceInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource you want to remove the tags from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p>The keys of the tags you want to remove from the specified resource. A tag is composed of a key-value pair.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p>RemoveTagsFromResourceOutput</p>
 */
@interface AWSStoragegatewayRemoveTagsFromResourceOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource that the tags were removed from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

@end

/**
 
 */
@interface AWSStoragegatewayResetCacheInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayResetCacheOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>RetrieveTapeArchiveInput</p>
 Required parameters: [TapeARN, GatewayARN]
 */
@interface AWSStoragegatewayRetrieveTapeArchiveInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway you want to retrieve the virtual tape to. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p><p>You retrieve archived virtual tapes to only one gateway and the gateway must be a tape gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The Amazon Resource Name (ARN) of the virtual tape you want to retrieve from the virtual tape shelf (VTS).</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>RetrieveTapeArchiveOutput</p>
 */
@interface AWSStoragegatewayRetrieveTapeArchiveOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the retrieved virtual tape.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>RetrieveTapeRecoveryPointInput</p>
 Required parameters: [TapeARN, GatewayARN]
 */
@interface AWSStoragegatewayRetrieveTapeRecoveryPointInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The Amazon Resource Name (ARN) of the virtual tape for which you want to retrieve the recovery point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>RetrieveTapeRecoveryPointOutput</p>
 */
@interface AWSStoragegatewayRetrieveTapeRecoveryPointOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the virtual tape for which the recovery point was retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

@end

/**
 <p>The Windows file permissions and ownership information assigned, by default, to native S3 objects when file gateway discovers them in S3 buckets. This operation is only supported for file gateways.</p>
 */
@interface AWSStoragegatewaySMBFileShareInfo : AWSModel


/**
 <p>A list of users or groups in the Active Directory that have administrator rights to the file share. A group must be prefixed with the @ character. For example <code>@group1</code>. Can only be set if Authentication is set to <code>ActiveDirectory</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable adminUserList;

/**
 <p>The Amazon Resource Name (ARN) of the storage used for the audit logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable auditDestinationARN;

/**
 <p>The authentication method of the file share. The default is <code>ActiveDirectory</code>.</p><p>Valid Values: <code>ActiveDirectory</code> | <code>GuestAccess</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable authentication;

/**
 <p>The default storage class for objects put into an Amazon S3 bucket by the file gateway. The default value is <code>S3_INTELLIGENT_TIERING</code>. Optional.</p><p>Valid Values: <code>S3_STANDARD</code> | <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> | <code>S3_ONEZONE_IA</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultStorageClass;

/**
 <p>The Amazon Resource Name (ARN) of the file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

/**
 <p>The ID of the file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareId;

/**
 <p>The status of the file share.</p><p>Valid Values: <code>CREATING</code> | <code>UPDATING</code> | <code>AVAILABLE</code> | <code>DELETING</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareStatus;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set this value to <code>true</code> to enable MIME type guessing, otherwise set to <code>false</code>. The default value is <code>true</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable guessMIMETypeEnabled;

/**
 <p>A list of users or groups in the Active Directory that are not allowed to access the file share. A group must be prefixed with the @ character. For example <code>@group1</code>. Can only be set if Authentication is set to <code>ActiveDirectory</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable invalidUserList;

/**
 <p>Set to <code>true</code> to use Amazon S3 server-side encryption with your own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3. Optional.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable KMSEncrypted;

/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The ARN of the backend storage used for storing file data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locationARN;

/**
 <p>A value that sets the access control list (ACL) permission for objects in the S3 bucket that a file gateway puts objects into. The default value is <code>private</code>.</p>
 */
@property (nonatomic, assign) AWSStoragegatewayObjectACL objectACL;

/**
 <p>The file share path used by the SMB client to identify the mount point.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>A value that sets the write status of a file share. Set this value to <code>true</code> to set the write status to read-only, otherwise set to <code>false</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readOnly;

/**
 <p>A value that sets who pays the cost of the request and the cost associated with data download from the S3 bucket. If this value is set to <code>true</code>, the requester pays the costs; otherwise, the S3 bucket owner pays. However, the S3 bucket owner always pays the cost of storing data.</p><note><p><code>RequesterPays</code> is a configuration for the S3 bucket that backs the file share, so make sure that the configuration on the file share is the same as the S3 bucket configuration.</p></note><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requesterPays;

/**
 <p>The ARN of the IAM role that file gateway assumes when it accesses the underlying storage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

/**
 <p>If this value is set to <code>true</code>, it indicates that access control list (ACL) is enabled on the SMB file share. If it is set to <code>false</code>, it indicates that file and directory permissions are mapped to the POSIX permission.</p><p>For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/smb-acl.html">Using Microsoft Windows ACLs to control access to an SMB file share</a> in the <i>AWS Storage Gateway User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable SMBACLEnabled;

/**
 <p>A list of up to 50 tags assigned to the SMB file share, sorted alphabetically by key name. Each tag is a key-value pair. For a gateway with more than 10 tags assigned, you can view all tags using the <code>ListTagsForResource</code> API operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

/**
 <p>A list of users or groups in the Active Directory that are allowed to access the file share. A group must be prefixed with the @ character. For example, <code>@group1</code>. Can only be set if Authentication is set to <code>ActiveDirectory</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable validUserList;

@end

/**
 <p>SetLocalConsolePasswordInput</p>
 Required parameters: [GatewayARN, LocalConsolePassword]
 */
@interface AWSStoragegatewaySetLocalConsolePasswordInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The password you want to set for your VM local console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable localConsolePassword;

@end

/**
 
 */
@interface AWSStoragegatewaySetLocalConsolePasswordOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>SetSMBGuestPasswordInput</p>
 Required parameters: [GatewayARN, Password]
 */
@interface AWSStoragegatewaySetSMBGuestPasswordInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the file gateway the SMB file share is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The password that you want to set for your SMB server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

@end

/**
 
 */
@interface AWSStoragegatewaySetSMBGuestPasswordOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway to shut down.</p>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayShutdownGatewayInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway that was shut down.</p>
 */
@interface AWSStoragegatewayShutdownGatewayOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayStartAvailabilityMonitorTestInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayStartAvailabilityMonitorTestOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway to start.</p>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayStartGatewayInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway that was restarted.</p>
 */
@interface AWSStoragegatewayStartGatewayOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>Provides additional information about an error that was returned by the service. See the <code>errorCode</code> and <code>errorDetails</code> members for more information about the error.</p>
 */
@interface AWSStoragegatewayStorageGatewayError : AWSModel


/**
 <p>Additional information about the error.</p>
 */
@property (nonatomic, assign) AWSStoragegatewayErrorCode errorCode;

/**
 <p>Human-readable text that provides detail about the error that occurred.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable errorDetails;

@end

/**
 <p>Describes an iSCSI stored volume.</p>
 */
@interface AWSStoragegatewayStorediSCSIVolume : AWSModel


/**
 <p>The date the volume was created. Volumes created prior to March 28, 2017 don’t have this time stamp.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>Indicates if when the stored volume was created, existing data on the underlying local disk was preserved.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable preservedExistingData;

/**
 <p>If the stored volume was created from a snapshot, this field contains the snapshot ID used, e.g. snap-78e22663. Otherwise, this field is not included.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSnapshotId;

/**
 <p>The name of the iSCSI target used by an initiator to connect to a volume and used as a suffix for the target ARN. For example, specifying <code>TargetName</code> as <i>myvolume</i> results in the target ARN of <code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume</code>. The target name must be unique across all volumes on a gateway.</p><p>If you don't specify a value, Storage Gateway uses the value that was previously used for this volume as the new target name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetName;

/**
 <p>The Amazon Resource Name (ARN) of the storage volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

/**
 <p>A value that indicates whether a storage volume is attached to, detached from, or is in the process of detaching from a gateway. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#attach-detach-volume">Moving your volumes to a different gateway</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeAttachmentStatus;

/**
 <p>The ID of the local disk that was specified in the <a>CreateStorediSCSIVolume</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeDiskId;

/**
 <p>The unique identifier of the volume, e.g. vol-AE4B946D.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

/**
 <p>Represents the percentage complete if the volume is restoring or bootstrapping that represents the percent of data transferred. This field does not appear in the response if the stored volume is not restoring or bootstrapping.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeProgress;

/**
 <p>The size of the volume in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeInBytes;

/**
 <p>One of the VolumeStatus values that indicates the state of the storage volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeStatus;

/**
 <p>One of the VolumeType enumeration values describing the type of the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeType;

/**
 <p>The size of the data stored on the volume in bytes. This value is calculated based on the number of blocks that are touched, instead of the actual amount of data written. This value can be useful for sequential write patterns but less accurate for random write patterns. <code>VolumeUsedInBytes</code> is different from the compressed size of the volume, which is the value that is used to calculate your bill.</p><note><p>This value is not available for volumes created prior to May 13, 2015, until you store data on the volume.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeUsedInBytes;

/**
 <p>An <a>VolumeiSCSIAttributes</a> object that represents a collection of iSCSI attributes for one stored volume.</p>
 */
@property (nonatomic, strong) AWSStoragegatewayVolumeiSCSIAttributes * _Nullable volumeiSCSIAttributes;

@end

/**
 <p>A key-value pair that helps you manage, filter, and search for your resource. Allowed characters: letters, white space, and numbers, representable in UTF-8, and the following characters: + - = . _ : /.</p>
 Required parameters: [Key, Value]
 */
@interface AWSStoragegatewayTag : AWSModel


/**
 <p>Tag key. The key can't start with aws:.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Value of the tag key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Describes a virtual tape object.</p>
 */
@interface AWSStoragegatewayTape : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The ID of the pool that contains tapes that will be archived. The tapes in this pool are archived in the S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the storage class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.</p><p>Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable poolId;

/**
 <p>For archiving virtual tapes, indicates how much data remains to be uploaded before archiving is complete.</p><p>Range: 0 (not started) to 100 (complete).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable progress;

/**
 <p>The Amazon Resource Name (ARN) of the virtual tape.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

/**
 <p>The barcode that identifies a specific virtual tape.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeBarcode;

/**
 <p>The date the virtual tape was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable tapeCreatedDate;

/**
 <p>The size, in bytes, of the virtual tape capacity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tapeSizeInBytes;

/**
 <p>The current state of the virtual tape.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeStatus;

/**
 <p>The size, in bytes, of data stored on the virtual tape.</p><note><p>This value is not available for tapes created prior to May 13, 2015.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable tapeUsedInBytes;

/**
 <p>The virtual tape library (VTL) device that the virtual tape is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VTLDevice;

@end

/**
 <p>Represents a virtual tape that is archived in the virtual tape shelf (VTS).</p>
 */
@interface AWSStoragegatewayTapeArchive : AWSModel


/**
 <p>The time that the archiving of the virtual tape was completed.</p><p>The default time stamp format is in the ISO8601 extended YYYY-MM-DD'T'HH:MM:SS'Z' format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionTime;

/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The ID of the pool that was used to archive the tape. The tapes in this pool are archived in the S3 storage class that is associated with the pool.</p><p>Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable poolId;

/**
 <p>The Amazon Resource Name (ARN) of the tape gateway that the virtual tape is being retrieved to.</p><p>The virtual tape is retrieved from the virtual tape shelf (VTS).</p>
 */
@property (nonatomic, strong) NSString * _Nullable retrievedTo;

/**
 <p>The Amazon Resource Name (ARN) of an archived virtual tape.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

/**
 <p>The barcode that identifies the archived virtual tape.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeBarcode;

/**
 <p>The date the virtual tape was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable tapeCreatedDate;

/**
 <p>The size, in bytes, of the archived virtual tape.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tapeSizeInBytes;

/**
 <p>The current state of the archived virtual tape.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeStatus;

/**
 <p>The size, in bytes, of data stored on the virtual tape.</p><note><p>This value is not available for tapes created prior to May 13, 2015.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable tapeUsedInBytes;

@end

/**
 <p>Describes a virtual tape.</p>
 */
@interface AWSStoragegatewayTapeInfo : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The ID of the pool that you want to add your tape to for archiving. The tape in this pool is archived in the S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the storage class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.</p><p>Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable poolId;

/**
 <p>The Amazon Resource Name (ARN) of a virtual tape.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

/**
 <p>The barcode that identifies a specific virtual tape.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeBarcode;

/**
 <p>The size, in bytes, of a virtual tape.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tapeSizeInBytes;

/**
 <p>The status of the tape.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeStatus;

@end

/**
 <p>Describes a recovery point.</p>
 */
@interface AWSStoragegatewayTapeRecoveryPointInfo : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the virtual tape.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeARN;

/**
 <p>The time when the point-in-time view of the virtual tape was replicated for later recovery.</p><p>The default time stamp format of the tape recovery point time is in the ISO8601 extended YYYY-MM-DD'T'HH:MM:SS'Z' format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable tapeRecoveryPointTime;

/**
 <p>The size, in bytes, of the virtual tapes to recover.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable tapeSizeInBytes;

/**
 <p>The status of the virtual tapes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tapeStatus;

@end

/**
 
 */
@interface AWSStoragegatewayUpdateAutomaticTapeCreationPolicyInput : AWSRequest


/**
 <p>An automatic tape creation policy consists of a list of automatic tape creation rules. The rules determine when and how to automatically create new tapes.</p>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayAutomaticTapeCreationRule *> * _Nullable automaticTapeCreationRules;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 
 */
@interface AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing one or more of the following fields:</p><ul><li><p><a>UpdateBandwidthRateLimitInput$AverageDownloadRateLimitInBitsPerSec</a></p></li><li><p><a>UpdateBandwidthRateLimitInput$AverageUploadRateLimitInBitsPerSec</a></p></li></ul>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayUpdateBandwidthRateLimitInput : AWSRequest


/**
 <p>The average download bandwidth rate limit in bits per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable averageDownloadRateLimitInBitsPerSec;

/**
 <p>The average upload bandwidth rate limit in bits per second.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable averageUploadRateLimitInBitsPerSec;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway whose throttle information was updated.</p>
 */
@interface AWSStoragegatewayUpdateBandwidthRateLimitOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing one or more of the following fields:</p><ul><li><p><a>UpdateChapCredentialsInput$InitiatorName</a></p></li><li><p><a>UpdateChapCredentialsInput$SecretToAuthenticateInitiator</a></p></li><li><p><a>UpdateChapCredentialsInput$SecretToAuthenticateTarget</a></p></li><li><p><a>UpdateChapCredentialsInput$TargetARN</a></p></li></ul>
 Required parameters: [TargetARN, SecretToAuthenticateInitiator, InitiatorName]
 */
@interface AWSStoragegatewayUpdateChapCredentialsInput : AWSRequest


/**
 <p>The iSCSI initiator that connects to the target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initiatorName;

/**
 <p>The secret key that the initiator (for example, the Windows client) must provide to participate in mutual CHAP with the target.</p><note><p>The secret key must be between 12 and 16 bytes when encoded in UTF-8.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretToAuthenticateInitiator;

/**
 <p>The secret key that the target must provide to participate in mutual CHAP with the initiator (e.g. Windows client).</p><p>Byte constraints: Minimum bytes of 12. Maximum bytes of 16.</p><note><p>The secret key must be between 12 and 16 bytes when encoded in UTF-8.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretToAuthenticateTarget;

/**
 <p>The Amazon Resource Name (ARN) of the iSCSI volume target. Use the <a>DescribeStorediSCSIVolumes</a> operation to return the TargetARN for specified VolumeARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetARN;

@end

/**
 <p>A JSON object containing the following fields:</p>
 */
@interface AWSStoragegatewayUpdateChapCredentialsOutput : AWSModel


/**
 <p>The iSCSI initiator that connects to the target. This is the same initiator name specified in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initiatorName;

/**
 <p>The Amazon Resource Name (ARN) of the target. This is the same target specified in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetARN;

@end

/**
 
 */
@interface AWSStoragegatewayUpdateGatewayInformationInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that you want to use to monitor and log events in the gateway.</p><p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html">What is Amazon CloudWatch logs?</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudWatchLogGroupARN;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The name you configured for your gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayName;

/**
 <p>A value that indicates the time zone of the gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayTimezone;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway that was updated.</p>
 */
@interface AWSStoragegatewayUpdateGatewayInformationOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The name you configured for your gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayName;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway to update.</p>
 Required parameters: [GatewayARN]
 */
@interface AWSStoragegatewayUpdateGatewaySoftwareNowInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway that was updated.</p>
 */
@interface AWSStoragegatewayUpdateGatewaySoftwareNowOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing the following fields:</p><ul><li><p><a>UpdateMaintenanceStartTimeInput$DayOfMonth</a></p></li><li><p><a>UpdateMaintenanceStartTimeInput$DayOfWeek</a></p></li><li><p><a>UpdateMaintenanceStartTimeInput$HourOfDay</a></p></li><li><p><a>UpdateMaintenanceStartTimeInput$MinuteOfHour</a></p></li></ul>
 Required parameters: [GatewayARN, HourOfDay, MinuteOfHour]
 */
@interface AWSStoragegatewayUpdateMaintenanceStartTimeInput : AWSRequest


/**
 <p>The day of the month component of the maintenance start time represented as an ordinal number from 1 to 28, where 1 represents the first day of the month and 28 represents the last day of the month.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dayOfMonth;

/**
 <p>The day of the week component of the maintenance start time week represented as an ordinal number from 0 to 6, where 0 represents Sunday and 6 Saturday.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dayOfWeek;

/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The hour component of the maintenance start time represented as <i>hh</i>, where <i>hh</i> is the hour (00 to 23). The hour of the day is in the time zone of the gateway.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hourOfDay;

/**
 <p>The minute component of the maintenance start time represented as <i>mm</i>, where <i>mm</i> is the minute (00 to 59). The minute of the hour is in the time zone of the gateway.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minuteOfHour;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the gateway whose maintenance start time is updated.</p>
 */
@interface AWSStoragegatewayUpdateMaintenanceStartTimeOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>UpdateNFSFileShareInput</p>
 Required parameters: [FileShareARN]
 */
@interface AWSStoragegatewayUpdateNFSFileShareInput : AWSRequest


/**
 <p>The list of clients that are allowed to access the file gateway. The list must contain either valid IP addresses or valid CIDR blocks.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable clientList;

/**
 <p>The default storage class for objects put into an Amazon S3 bucket by the file gateway. The default value is <code>S3_INTELLIGENT_TIERING</code>. Optional.</p><p>Valid Values: <code>S3_STANDARD</code> | <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> | <code>S3_ONEZONE_IA</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultStorageClass;

/**
 <p>The Amazon Resource Name (ARN) of the file share to be updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

/**
 <p>A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set this value to <code>true</code> to enable MIME type guessing, otherwise set to <code>false</code>. The default value is <code>true</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable guessMIMETypeEnabled;

/**
 <p>Set to <code>true</code> to use Amazon S3 server-side encryption with your own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3. Optional.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable KMSEncrypted;

/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>The default values for the file share. Optional.</p>
 */
@property (nonatomic, strong) AWSStoragegatewayNFSFileShareDefaults * _Nullable NFSFileShareDefaults;

/**
 <p>A value that sets the access control list (ACL) permission for objects in the S3 bucket that a file gateway puts objects into. The default value is <code>private</code>.</p>
 */
@property (nonatomic, assign) AWSStoragegatewayObjectACL objectACL;

/**
 <p>A value that sets the write status of a file share. Set this value to <code>true</code> to set the write status to read-only, otherwise set to <code>false</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readOnly;

/**
 <p>A value that sets who pays the cost of the request and the cost associated with data download from the S3 bucket. If this value is set to <code>true</code>, the requester pays the costs; otherwise, the S3 bucket owner pays. However, the S3 bucket owner always pays the cost of storing data.</p><note><p><code>RequesterPays</code> is a configuration for the S3 bucket that backs the file share, so make sure that the configuration on the file share is the same as the S3 bucket configuration.</p></note><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requesterPays;

/**
 <p>The user mapped to anonymous user.</p><p>Valid values are the following:</p><ul><li><p><code>RootSquash</code>: Only root is mapped to anonymous user.</p></li><li><p><code>NoSquash</code>: No one is mapped to anonymous user.</p></li><li><p><code>AllSquash</code>: Everyone is mapped to anonymous user.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable squash;

@end

/**
 <p>UpdateNFSFileShareOutput</p>
 */
@interface AWSStoragegatewayUpdateNFSFileShareOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the updated file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

@end

/**
 <p>UpdateSMBFileShareInput</p>
 Required parameters: [FileShareARN]
 */
@interface AWSStoragegatewayUpdateSMBFileShareInput : AWSRequest


/**
 <p>A list of users in the Active Directory that have administrator rights to the file share. A group must be prefixed with the @ character. For example, <code>@group1</code>. Can only be set if Authentication is set to <code>ActiveDirectory</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable adminUserList;

/**
 <p>The Amazon Resource Name (ARN) of the storage used for the audit logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable auditDestinationARN;

/**
 <p>The default storage class for objects put into an Amazon S3 bucket by the file gateway. The default value is <code>S3_INTELLIGENT_TIERING</code>. Optional.</p><p>Valid Values: <code>S3_STANDARD</code> | <code>S3_INTELLIGENT_TIERING</code> | <code>S3_STANDARD_IA</code> | <code>S3_ONEZONE_IA</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultStorageClass;

/**
 <p>The Amazon Resource Name (ARN) of the SMB file share that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

/**
 <p>A value that enables guessing of the MIME type for uploaded objects based on file extensions. Set this value to <code>true</code> to enable MIME type guessing, otherwise set to <code>false</code>. The default value is <code>true</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable guessMIMETypeEnabled;

/**
 <p>A list of users or groups in the Active Directory that are not allowed to access the file share. A group must be prefixed with the @ character. For example <code>@group1</code>. Can only be set if Authentication is set to <code>ActiveDirectory</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable invalidUserList;

/**
 <p>Set to <code>true</code> to use Amazon S3 server-side encryption with your own AWS KMS key, or <code>false</code> to use a key managed by Amazon S3. Optional.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable KMSEncrypted;

/**
 <p>The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value can only be set when <code>KMSEncrypted</code> is <code>true</code>. Optional.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKey;

/**
 <p>A value that sets the access control list (ACL) permission for objects in the S3 bucket that a file gateway puts objects into. The default value is <code>private</code>.</p>
 */
@property (nonatomic, assign) AWSStoragegatewayObjectACL objectACL;

/**
 <p>A value that sets the write status of a file share. Set this value to <code>true</code> to set write status to read-only, otherwise set to <code>false</code>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable readOnly;

/**
 <p>A value that sets who pays the cost of the request and the cost associated with data download from the S3 bucket. If this value is set to <code>true</code>, the requester pays the costs; otherwise, the S3 bucket owner pays. However, the S3 bucket owner always pays the cost of storing data.</p><note><p><code>RequesterPays</code> is a configuration for the S3 bucket that backs the file share, so make sure that the configuration on the file share is the same as the S3 bucket configuration.</p></note><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requesterPays;

/**
 <p>Set this value to <code>true</code> to enable access control list (ACL) on the SMB file share. Set it to <code>false</code> to map file and directory permissions to the POSIX permissions.</p><p>For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/smb-acl.html">Using Microsoft Windows ACLs to control access to an SMB file share</a> in the <i>AWS Storage Gateway User Guide</i>.</p><p>Valid Values: <code>true</code> | <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable SMBACLEnabled;

/**
 <p>A list of users or groups in the Active Directory that are allowed to access the file share. A group must be prefixed with the @ character. For example, <code>@group1</code>. Can only be set if Authentication is set to <code>ActiveDirectory</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable validUserList;

@end

/**
 <p>UpdateSMBFileShareOutput</p>
 */
@interface AWSStoragegatewayUpdateSMBFileShareOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the updated SMB file share.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileShareARN;

@end

/**
 
 */
@interface AWSStoragegatewayUpdateSMBSecurityStrategyInput : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>Specifies the type of security strategy.</p><p>ClientSpecified: if you use this option, requests are established based on what is negotiated by the client. This option is recommended when you want to maximize compatibility across different clients in your environment.</p><p>MandatorySigning: if you use this option, file gateway only allows connections from SMBv2 or SMBv3 clients that have signing enabled. This option works with SMB clients on Microsoft Windows Vista, Windows Server 2008 or newer.</p><p>MandatoryEncryption: if you use this option, file gateway only allows connections from SMBv3 clients that have encryption enabled. This option is highly recommended for environments that handle sensitive data. This option works with SMB clients on Microsoft Windows 8, Windows Server 2012 or newer.</p>
 */
@property (nonatomic, assign) AWSStoragegatewaySMBSecurityStrategy SMBSecurityStrategy;

@end

/**
 
 */
@interface AWSStoragegatewayUpdateSMBSecurityStrategyOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

@end

/**
 <p>A JSON object containing one or more of the following fields:</p><ul><li><p><a>UpdateSnapshotScheduleInput$Description</a></p></li><li><p><a>UpdateSnapshotScheduleInput$RecurrenceInHours</a></p></li><li><p><a>UpdateSnapshotScheduleInput$StartAt</a></p></li><li><p><a>UpdateSnapshotScheduleInput$VolumeARN</a></p></li></ul>
 Required parameters: [VolumeARN, StartAt, RecurrenceInHours]
 */
@interface AWSStoragegatewayUpdateSnapshotScheduleInput : AWSRequest


/**
 <p>Optional description of the snapshot that overwrites the existing description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Frequency of snapshots. Specify the number of hours between snapshots.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recurrenceInHours;

/**
 <p>The hour of the day at which the snapshot schedule begins represented as <i>hh</i>, where <i>hh</i> is the hour (0 to 23). The hour of the day is in the time zone of the gateway.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable startAt;

/**
 <p>A list of up to 50 tags that can be assigned to a snapshot. Each tag is a key-value pair.</p><note><p>Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @. The maximum length of a tag's key is 128 characters, and the maximum length for a tag's value is 256.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSStoragegatewayTag *> * _Nullable tags;

/**
 <p>The Amazon Resource Name (ARN) of the volume. Use the <a>ListVolumes</a> operation to return a list of gateway volumes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 <p>A JSON object containing the Amazon Resource Name (ARN) of the updated storage volume.</p>
 */
@interface AWSStoragegatewayUpdateSnapshotScheduleOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the volume. Use the <a>ListVolumes</a> operation to return a list of gateway volumes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

@end

/**
 
 */
@interface AWSStoragegatewayUpdateVTLDeviceTypeInput : AWSRequest


/**
 <p>The type of medium changer you want to select.</p><p>Valid Values: <code>STK-L700</code> | <code>AWS-Gateway-VTL</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceType;

/**
 <p>The Amazon Resource Name (ARN) of the medium changer you want to select.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VTLDeviceARN;

@end

/**
 <p>UpdateVTLDeviceTypeOutput</p>
 */
@interface AWSStoragegatewayUpdateVTLDeviceTypeOutput : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the medium changer you have selected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VTLDeviceARN;

@end

/**
 <p>Represents a device object associated with a tape gateway.</p>
 */
@interface AWSStoragegatewayVTLDevice : AWSModel


/**
 <p>A list of iSCSI information about a VTL device.</p>
 */
@property (nonatomic, strong) AWSStoragegatewayDeviceiSCSIAttributes * _Nullable deviceiSCSIAttributes;

/**
 <p>Specifies the unique Amazon Resource Name (ARN) of the device (tape drive or media changer).</p>
 */
@property (nonatomic, strong) NSString * _Nullable VTLDeviceARN;

/**
 <p>Specifies the model number of device that the VTL device emulates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VTLDeviceProductIdentifier;

/**
 <p>Specifies the type of device that the VTL device emulates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VTLDeviceType;

/**
 <p>Specifies the vendor of the device that the VTL device object emulates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VTLDeviceVendor;

@end

/**
 <p>Describes a storage volume object.</p>
 */
@interface AWSStoragegatewayVolumeInfo : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the gateway. Use the <a>ListGateways</a> operation to return a list of gateways for your account and AWS Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayARN;

/**
 <p>The unique identifier assigned to your gateway during activation. This ID becomes part of the gateway Amazon Resource Name (ARN), which you use as input for other operations.</p><p>Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

/**
 <p>The Amazon Resource Name (ARN) for the storage volume. For example, the following is a valid ARN:</p><p><code>arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/volume/vol-1122AABB</code></p><p>Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

/**
 <p>One of the VolumeStatus values that indicates the state of the storage volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeAttachmentStatus;

/**
 <p>The unique identifier assigned to the volume. This ID becomes part of the volume Amazon Resource Name (ARN), which you use as input for other operations.</p><p>Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

/**
 <p>The size of the volume in bytes.</p><p>Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens (-).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeInBytes;

/**
 <p>One of the VolumeType enumeration values describing the type of the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeType;

@end

/**
 <p>Describes a storage volume recovery point object.</p>
 */
@interface AWSStoragegatewayVolumeRecoveryPointInfo : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the volume target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeARN;

/**
 <p>The time the recovery point was taken.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeRecoveryPointTime;

/**
 <p>The size of the volume in bytes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSizeInBytes;

/**
 <p>The size of the data stored on the volume in bytes.</p><note><p>This value is not available for volumes created prior to May 13, 2015, until you store data on the volume.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeUsageInBytes;

@end

/**
 <p>Lists iSCSI information about a volume.</p>
 */
@interface AWSStoragegatewayVolumeiSCSIAttributes : AWSModel


/**
 <p>Indicates whether mutual CHAP is enabled for the iSCSI target.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable chapEnabled;

/**
 <p>The logical disk number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lunNumber;

/**
 <p>The network interface identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The port used to communicate with iSCSI targets.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable networkInterfacePort;

/**
 <p>The Amazon Resource Name (ARN) of the volume target.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetARN;

@end

NS_ASSUME_NONNULL_END
