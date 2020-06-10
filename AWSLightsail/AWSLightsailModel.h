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

FOUNDATION_EXPORT NSString *const AWSLightsailErrorDomain;

typedef NS_ENUM(NSInteger, AWSLightsailErrorType) {
    AWSLightsailErrorUnknown,
    AWSLightsailErrorAccessDenied,
    AWSLightsailErrorAccountSetupInProgress,
    AWSLightsailErrorInvalidInput,
    AWSLightsailErrorNotFound,
    AWSLightsailErrorOperationFailure,
    AWSLightsailErrorService,
    AWSLightsailErrorUnauthenticated,
};

typedef NS_ENUM(NSInteger, AWSLightsailAccessDirection) {
    AWSLightsailAccessDirectionUnknown,
    AWSLightsailAccessDirectionInbound,
    AWSLightsailAccessDirectionOutbound,
};

typedef NS_ENUM(NSInteger, AWSLightsailAddOnType) {
    AWSLightsailAddOnTypeUnknown,
    AWSLightsailAddOnTypeAutoSnapshot,
};

typedef NS_ENUM(NSInteger, AWSLightsailAlarmState) {
    AWSLightsailAlarmStateUnknown,
    AWSLightsailAlarmStateOK,
    AWSLightsailAlarmStateAlarm,
    AWSLightsailAlarmStateInsufficientData,
};

typedef NS_ENUM(NSInteger, AWSLightsailAutoSnapshotStatus) {
    AWSLightsailAutoSnapshotStatusUnknown,
    AWSLightsailAutoSnapshotStatusSuccess,
    AWSLightsailAutoSnapshotStatusFailed,
    AWSLightsailAutoSnapshotStatusInProgress,
    AWSLightsailAutoSnapshotStatusNotFound,
};

typedef NS_ENUM(NSInteger, AWSLightsailBlueprintType) {
    AWSLightsailBlueprintTypeUnknown,
    AWSLightsailBlueprintTypeOs,
    AWSLightsailBlueprintTypeApp,
};

typedef NS_ENUM(NSInteger, AWSLightsailCloudFormationStackRecordSourceType) {
    AWSLightsailCloudFormationStackRecordSourceTypeUnknown,
    AWSLightsailCloudFormationStackRecordSourceTypeExportSnapshotRecord,
};

typedef NS_ENUM(NSInteger, AWSLightsailComparisonOperator) {
    AWSLightsailComparisonOperatorUnknown,
    AWSLightsailComparisonOperatorGreaterThanOrEqualToThreshold,
    AWSLightsailComparisonOperatorGreaterThanThreshold,
    AWSLightsailComparisonOperatorLessThanThreshold,
    AWSLightsailComparisonOperatorLessThanOrEqualToThreshold,
};

typedef NS_ENUM(NSInteger, AWSLightsailContactMethodStatus) {
    AWSLightsailContactMethodStatusUnknown,
    AWSLightsailContactMethodStatusPendingVerification,
    AWSLightsailContactMethodStatusValid,
    AWSLightsailContactMethodStatusInvalid,
};

typedef NS_ENUM(NSInteger, AWSLightsailContactMethodVerificationProtocol) {
    AWSLightsailContactMethodVerificationProtocolUnknown,
    AWSLightsailContactMethodVerificationProtocolEmail,
};

typedef NS_ENUM(NSInteger, AWSLightsailContactProtocol) {
    AWSLightsailContactProtocolUnknown,
    AWSLightsailContactProtocolEmail,
    AWSLightsailContactProtocolSms,
};

typedef NS_ENUM(NSInteger, AWSLightsailDiskSnapshotState) {
    AWSLightsailDiskSnapshotStateUnknown,
    AWSLightsailDiskSnapshotStatePending,
    AWSLightsailDiskSnapshotStateCompleted,
    AWSLightsailDiskSnapshotStateError,
};

typedef NS_ENUM(NSInteger, AWSLightsailDiskState) {
    AWSLightsailDiskStateUnknown,
    AWSLightsailDiskStatePending,
    AWSLightsailDiskStateError,
    AWSLightsailDiskStateAvailable,
    AWSLightsailDiskStateInUse,
};

typedef NS_ENUM(NSInteger, AWSLightsailExportSnapshotRecordSourceType) {
    AWSLightsailExportSnapshotRecordSourceTypeUnknown,
    AWSLightsailExportSnapshotRecordSourceTypeInstanceSnapshot,
    AWSLightsailExportSnapshotRecordSourceTypeDiskSnapshot,
};

typedef NS_ENUM(NSInteger, AWSLightsailInstanceAccessProtocol) {
    AWSLightsailInstanceAccessProtocolUnknown,
    AWSLightsailInstanceAccessProtocolSsh,
    AWSLightsailInstanceAccessProtocolRdp,
};

typedef NS_ENUM(NSInteger, AWSLightsailInstanceHealthReason) {
    AWSLightsailInstanceHealthReasonUnknown,
    AWSLightsailInstanceHealthReasonLbRegistrationInProgress,
    AWSLightsailInstanceHealthReasonLbInitialHealthChecking,
    AWSLightsailInstanceHealthReasonLbInternalError,
    AWSLightsailInstanceHealthReasonInstanceResponseCodeMismatch,
    AWSLightsailInstanceHealthReasonInstanceTimeout,
    AWSLightsailInstanceHealthReasonInstanceFailedHealthChecks,
    AWSLightsailInstanceHealthReasonInstanceNotRegistered,
    AWSLightsailInstanceHealthReasonInstanceNotInUse,
    AWSLightsailInstanceHealthReasonInstanceDeregistrationInProgress,
    AWSLightsailInstanceHealthReasonInstanceInvalidState,
    AWSLightsailInstanceHealthReasonInstanceIpUnusable,
};

typedef NS_ENUM(NSInteger, AWSLightsailInstanceHealthState) {
    AWSLightsailInstanceHealthStateUnknown,
    AWSLightsailInstanceHealthStateInitial,
    AWSLightsailInstanceHealthStateHealthy,
    AWSLightsailInstanceHealthStateUnhealthy,
    AWSLightsailInstanceHealthStateUnused,
    AWSLightsailInstanceHealthStateDraining,
    AWSLightsailInstanceHealthStateUnavailable,
};

typedef NS_ENUM(NSInteger, AWSLightsailInstanceMetricName) {
    AWSLightsailInstanceMetricNameUnknown,
    AWSLightsailInstanceMetricNameCPUUtilization,
    AWSLightsailInstanceMetricNameNetworkIn,
    AWSLightsailInstanceMetricNameNetworkOut,
    AWSLightsailInstanceMetricNameStatusCheckFailed,
    AWSLightsailInstanceMetricNameStatusCheckFailedInstance,
    AWSLightsailInstanceMetricNameStatusCheckFailedSystem,
    AWSLightsailInstanceMetricNameBurstCapacityTime,
    AWSLightsailInstanceMetricNameBurstCapacityPercentage,
};

typedef NS_ENUM(NSInteger, AWSLightsailInstancePlatform) {
    AWSLightsailInstancePlatformUnknown,
    AWSLightsailInstancePlatformLinuxUnix,
    AWSLightsailInstancePlatformWindows,
};

typedef NS_ENUM(NSInteger, AWSLightsailInstanceSnapshotState) {
    AWSLightsailInstanceSnapshotStateUnknown,
    AWSLightsailInstanceSnapshotStatePending,
    AWSLightsailInstanceSnapshotStateError,
    AWSLightsailInstanceSnapshotStateAvailable,
};

typedef NS_ENUM(NSInteger, AWSLightsailLoadBalancerAttributeName) {
    AWSLightsailLoadBalancerAttributeNameUnknown,
    AWSLightsailLoadBalancerAttributeNameHealthCheckPath,
    AWSLightsailLoadBalancerAttributeNameSessionStickinessEnabled,
    AWSLightsailLoadBalancerAttributeNameSessionStickinessLBCookieDurationSeconds,
};

typedef NS_ENUM(NSInteger, AWSLightsailLoadBalancerMetricName) {
    AWSLightsailLoadBalancerMetricNameUnknown,
    AWSLightsailLoadBalancerMetricNameClientTLSNegotiationErrorCount,
    AWSLightsailLoadBalancerMetricNameHealthyHostCount,
    AWSLightsailLoadBalancerMetricNameUnhealthyHostCount,
    AWSLightsailLoadBalancerMetricNameHTTPCodeLB4XXCount,
    AWSLightsailLoadBalancerMetricNameHTTPCodeLB5XXCount,
    AWSLightsailLoadBalancerMetricNameHTTPCodeInstance2XXCount,
    AWSLightsailLoadBalancerMetricNameHTTPCodeInstance3XXCount,
    AWSLightsailLoadBalancerMetricNameHTTPCodeInstance4XXCount,
    AWSLightsailLoadBalancerMetricNameHTTPCodeInstance5XXCount,
    AWSLightsailLoadBalancerMetricNameInstanceResponseTime,
    AWSLightsailLoadBalancerMetricNameRejectedConnectionCount,
    AWSLightsailLoadBalancerMetricNameRequestCount,
};

typedef NS_ENUM(NSInteger, AWSLightsailLoadBalancerProtocol) {
    AWSLightsailLoadBalancerProtocolUnknown,
    AWSLightsailLoadBalancerProtocolHttpHttps,
    AWSLightsailLoadBalancerProtocolHttp,
};

typedef NS_ENUM(NSInteger, AWSLightsailLoadBalancerState) {
    AWSLightsailLoadBalancerStateUnknown,
    AWSLightsailLoadBalancerStateActive,
    AWSLightsailLoadBalancerStateProvisioning,
    AWSLightsailLoadBalancerStateActiveImpaired,
    AWSLightsailLoadBalancerStateFailed,
};

typedef NS_ENUM(NSInteger, AWSLightsailLoadBalancerTlsCertificateDomainStatus) {
    AWSLightsailLoadBalancerTlsCertificateDomainStatusUnknown,
    AWSLightsailLoadBalancerTlsCertificateDomainStatusPendingValidation,
    AWSLightsailLoadBalancerTlsCertificateDomainStatusFailed,
    AWSLightsailLoadBalancerTlsCertificateDomainStatusSuccess,
};

typedef NS_ENUM(NSInteger, AWSLightsailLoadBalancerTlsCertificateFailureReason) {
    AWSLightsailLoadBalancerTlsCertificateFailureReasonUnknown,
    AWSLightsailLoadBalancerTlsCertificateFailureReasonNoAvailableContacts,
    AWSLightsailLoadBalancerTlsCertificateFailureReasonAdditionalVerificationRequired,
    AWSLightsailLoadBalancerTlsCertificateFailureReasonDomainNotAllowed,
    AWSLightsailLoadBalancerTlsCertificateFailureReasonInvalidPublicDomain,
    AWSLightsailLoadBalancerTlsCertificateFailureReasonOther,
};

typedef NS_ENUM(NSInteger, AWSLightsailLoadBalancerTlsCertificateRenewalStatus) {
    AWSLightsailLoadBalancerTlsCertificateRenewalStatusUnknown,
    AWSLightsailLoadBalancerTlsCertificateRenewalStatusPendingAutoRenewal,
    AWSLightsailLoadBalancerTlsCertificateRenewalStatusPendingValidation,
    AWSLightsailLoadBalancerTlsCertificateRenewalStatusSuccess,
    AWSLightsailLoadBalancerTlsCertificateRenewalStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSLightsailLoadBalancerTlsCertificateRevocationReason) {
    AWSLightsailLoadBalancerTlsCertificateRevocationReasonUnknown,
    AWSLightsailLoadBalancerTlsCertificateRevocationReasonUnspecified,
    AWSLightsailLoadBalancerTlsCertificateRevocationReasonKeyCompromise,
    AWSLightsailLoadBalancerTlsCertificateRevocationReasonCaCompromise,
    AWSLightsailLoadBalancerTlsCertificateRevocationReasonAffiliationChanged,
    AWSLightsailLoadBalancerTlsCertificateRevocationReasonSuperceded,
    AWSLightsailLoadBalancerTlsCertificateRevocationReasonCessationOfOperation,
    AWSLightsailLoadBalancerTlsCertificateRevocationReasonCertificateHold,
    AWSLightsailLoadBalancerTlsCertificateRevocationReasonRemoveFromCrl,
    AWSLightsailLoadBalancerTlsCertificateRevocationReasonPrivilegeWithdrawn,
    AWSLightsailLoadBalancerTlsCertificateRevocationReasonAACompromise,
};

typedef NS_ENUM(NSInteger, AWSLightsailLoadBalancerTlsCertificateStatus) {
    AWSLightsailLoadBalancerTlsCertificateStatusUnknown,
    AWSLightsailLoadBalancerTlsCertificateStatusPendingValidation,
    AWSLightsailLoadBalancerTlsCertificateStatusIssued,
    AWSLightsailLoadBalancerTlsCertificateStatusInactive,
    AWSLightsailLoadBalancerTlsCertificateStatusExpired,
    AWSLightsailLoadBalancerTlsCertificateStatusValidationTimedOut,
    AWSLightsailLoadBalancerTlsCertificateStatusRevoked,
    AWSLightsailLoadBalancerTlsCertificateStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSLightsailMetricName) {
    AWSLightsailMetricNameUnknown,
    AWSLightsailMetricNameCPUUtilization,
    AWSLightsailMetricNameNetworkIn,
    AWSLightsailMetricNameNetworkOut,
    AWSLightsailMetricNameStatusCheckFailed,
    AWSLightsailMetricNameStatusCheckFailedInstance,
    AWSLightsailMetricNameStatusCheckFailedSystem,
    AWSLightsailMetricNameClientTLSNegotiationErrorCount,
    AWSLightsailMetricNameHealthyHostCount,
    AWSLightsailMetricNameUnhealthyHostCount,
    AWSLightsailMetricNameHTTPCodeLB4XXCount,
    AWSLightsailMetricNameHTTPCodeLB5XXCount,
    AWSLightsailMetricNameHTTPCodeInstance2XXCount,
    AWSLightsailMetricNameHTTPCodeInstance3XXCount,
    AWSLightsailMetricNameHTTPCodeInstance4XXCount,
    AWSLightsailMetricNameHTTPCodeInstance5XXCount,
    AWSLightsailMetricNameInstanceResponseTime,
    AWSLightsailMetricNameRejectedConnectionCount,
    AWSLightsailMetricNameRequestCount,
    AWSLightsailMetricNameDatabaseConnections,
    AWSLightsailMetricNameDiskQueueDepth,
    AWSLightsailMetricNameFreeStorageSpace,
    AWSLightsailMetricNameNetworkReceiveThroughput,
    AWSLightsailMetricNameNetworkTransmitThroughput,
    AWSLightsailMetricNameBurstCapacityTime,
    AWSLightsailMetricNameBurstCapacityPercentage,
};

typedef NS_ENUM(NSInteger, AWSLightsailMetricStatistic) {
    AWSLightsailMetricStatisticUnknown,
    AWSLightsailMetricStatisticMinimum,
    AWSLightsailMetricStatisticMaximum,
    AWSLightsailMetricStatisticSum,
    AWSLightsailMetricStatisticAverage,
    AWSLightsailMetricStatisticSampleCount,
};

typedef NS_ENUM(NSInteger, AWSLightsailMetricUnit) {
    AWSLightsailMetricUnitUnknown,
    AWSLightsailMetricUnitSeconds,
    AWSLightsailMetricUnitMicroseconds,
    AWSLightsailMetricUnitMilliseconds,
    AWSLightsailMetricUnitBytes,
    AWSLightsailMetricUnitKilobytes,
    AWSLightsailMetricUnitMegabytes,
    AWSLightsailMetricUnitGigabytes,
    AWSLightsailMetricUnitTerabytes,
    AWSLightsailMetricUnitBits,
    AWSLightsailMetricUnitKilobits,
    AWSLightsailMetricUnitMegabits,
    AWSLightsailMetricUnitGigabits,
    AWSLightsailMetricUnitTerabits,
    AWSLightsailMetricUnitPercent,
    AWSLightsailMetricUnitCount,
    AWSLightsailMetricUnitBytesSecond,
    AWSLightsailMetricUnitKilobytesSecond,
    AWSLightsailMetricUnitMegabytesSecond,
    AWSLightsailMetricUnitGigabytesSecond,
    AWSLightsailMetricUnitTerabytesSecond,
    AWSLightsailMetricUnitBitsSecond,
    AWSLightsailMetricUnitKilobitsSecond,
    AWSLightsailMetricUnitMegabitsSecond,
    AWSLightsailMetricUnitGigabitsSecond,
    AWSLightsailMetricUnitTerabitsSecond,
    AWSLightsailMetricUnitCountSecond,
    AWSLightsailMetricUnitNone,
};

typedef NS_ENUM(NSInteger, AWSLightsailNetworkProtocol) {
    AWSLightsailNetworkProtocolUnknown,
    AWSLightsailNetworkProtocolTcp,
    AWSLightsailNetworkProtocolAll,
    AWSLightsailNetworkProtocolUdp,
    AWSLightsailNetworkProtocolIcmp,
};

typedef NS_ENUM(NSInteger, AWSLightsailOperationStatus) {
    AWSLightsailOperationStatusUnknown,
    AWSLightsailOperationStatusNotStarted,
    AWSLightsailOperationStatusStarted,
    AWSLightsailOperationStatusFailed,
    AWSLightsailOperationStatusCompleted,
    AWSLightsailOperationStatusSucceeded,
};

typedef NS_ENUM(NSInteger, AWSLightsailOperationType) {
    AWSLightsailOperationTypeUnknown,
    AWSLightsailOperationTypeDeleteKnownHostKeys,
    AWSLightsailOperationTypeDeleteInstance,
    AWSLightsailOperationTypeCreateInstance,
    AWSLightsailOperationTypeStopInstance,
    AWSLightsailOperationTypeStartInstance,
    AWSLightsailOperationTypeRebootInstance,
    AWSLightsailOperationTypeOpenInstancePublicPorts,
    AWSLightsailOperationTypePutInstancePublicPorts,
    AWSLightsailOperationTypeCloseInstancePublicPorts,
    AWSLightsailOperationTypeAllocateStaticIp,
    AWSLightsailOperationTypeReleaseStaticIp,
    AWSLightsailOperationTypeAttachStaticIp,
    AWSLightsailOperationTypeDetachStaticIp,
    AWSLightsailOperationTypeUpdateDomainEntry,
    AWSLightsailOperationTypeDeleteDomainEntry,
    AWSLightsailOperationTypeCreateDomain,
    AWSLightsailOperationTypeDeleteDomain,
    AWSLightsailOperationTypeCreateInstanceSnapshot,
    AWSLightsailOperationTypeDeleteInstanceSnapshot,
    AWSLightsailOperationTypeCreateInstancesFromSnapshot,
    AWSLightsailOperationTypeCreateLoadBalancer,
    AWSLightsailOperationTypeDeleteLoadBalancer,
    AWSLightsailOperationTypeAttachInstancesToLoadBalancer,
    AWSLightsailOperationTypeDetachInstancesFromLoadBalancer,
    AWSLightsailOperationTypeUpdateLoadBalancerAttribute,
    AWSLightsailOperationTypeCreateLoadBalancerTlsCertificate,
    AWSLightsailOperationTypeDeleteLoadBalancerTlsCertificate,
    AWSLightsailOperationTypeAttachLoadBalancerTlsCertificate,
    AWSLightsailOperationTypeCreateDisk,
    AWSLightsailOperationTypeDeleteDisk,
    AWSLightsailOperationTypeAttachDisk,
    AWSLightsailOperationTypeDetachDisk,
    AWSLightsailOperationTypeCreateDiskSnapshot,
    AWSLightsailOperationTypeDeleteDiskSnapshot,
    AWSLightsailOperationTypeCreateDiskFromSnapshot,
    AWSLightsailOperationTypeCreateRelationalDatabase,
    AWSLightsailOperationTypeUpdateRelationalDatabase,
    AWSLightsailOperationTypeDeleteRelationalDatabase,
    AWSLightsailOperationTypeCreateRelationalDatabaseFromSnapshot,
    AWSLightsailOperationTypeCreateRelationalDatabaseSnapshot,
    AWSLightsailOperationTypeDeleteRelationalDatabaseSnapshot,
    AWSLightsailOperationTypeUpdateRelationalDatabaseParameters,
    AWSLightsailOperationTypeStartRelationalDatabase,
    AWSLightsailOperationTypeRebootRelationalDatabase,
    AWSLightsailOperationTypeStopRelationalDatabase,
    AWSLightsailOperationTypeEnableAddOn,
    AWSLightsailOperationTypeDisableAddOn,
    AWSLightsailOperationTypePutAlarm,
    AWSLightsailOperationTypeGetAlarms,
    AWSLightsailOperationTypeDeleteAlarm,
    AWSLightsailOperationTypeTestAlarm,
    AWSLightsailOperationTypeCreateContactMethod,
    AWSLightsailOperationTypeGetContactMethods,
    AWSLightsailOperationTypeSendContactMethodVerification,
    AWSLightsailOperationTypeDeleteContactMethod,
};

typedef NS_ENUM(NSInteger, AWSLightsailPortAccessType) {
    AWSLightsailPortAccessTypeUnknown,
    AWSLightsailPortAccessTypePublic,
    AWSLightsailPortAccessTypePrivate,
};

typedef NS_ENUM(NSInteger, AWSLightsailPortInfoSourceType) {
    AWSLightsailPortInfoSourceTypeUnknown,
    AWSLightsailPortInfoSourceTypeDefault,
    AWSLightsailPortInfoSourceTypeInstance,
    AWSLightsailPortInfoSourceTypeNone,
    AWSLightsailPortInfoSourceTypeClosed,
};

typedef NS_ENUM(NSInteger, AWSLightsailPortState) {
    AWSLightsailPortStateUnknown,
    AWSLightsailPortStateOpen,
    AWSLightsailPortStateClosed,
};

typedef NS_ENUM(NSInteger, AWSLightsailRecordState) {
    AWSLightsailRecordStateUnknown,
    AWSLightsailRecordStateStarted,
    AWSLightsailRecordStateSucceeded,
    AWSLightsailRecordStateFailed,
};

typedef NS_ENUM(NSInteger, AWSLightsailRegionName) {
    AWSLightsailRegionNameUnknown,
    AWSLightsailRegionNameUsEast1,
    AWSLightsailRegionNameUsEast2,
    AWSLightsailRegionNameUsWest1,
    AWSLightsailRegionNameUsWest2,
    AWSLightsailRegionNameEuWest1,
    AWSLightsailRegionNameEuWest2,
    AWSLightsailRegionNameEuWest3,
    AWSLightsailRegionNameEuCentral1,
    AWSLightsailRegionNameCaCentral1,
    AWSLightsailRegionNameApSouth1,
    AWSLightsailRegionNameApSoutheast1,
    AWSLightsailRegionNameApSoutheast2,
    AWSLightsailRegionNameApNortheast1,
    AWSLightsailRegionNameApNortheast2,
};

typedef NS_ENUM(NSInteger, AWSLightsailRelationalDatabaseEngine) {
    AWSLightsailRelationalDatabaseEngineUnknown,
    AWSLightsailRelationalDatabaseEngineMysql,
};

typedef NS_ENUM(NSInteger, AWSLightsailRelationalDatabaseMetricName) {
    AWSLightsailRelationalDatabaseMetricNameUnknown,
    AWSLightsailRelationalDatabaseMetricNameCPUUtilization,
    AWSLightsailRelationalDatabaseMetricNameDatabaseConnections,
    AWSLightsailRelationalDatabaseMetricNameDiskQueueDepth,
    AWSLightsailRelationalDatabaseMetricNameFreeStorageSpace,
    AWSLightsailRelationalDatabaseMetricNameNetworkReceiveThroughput,
    AWSLightsailRelationalDatabaseMetricNameNetworkTransmitThroughput,
};

typedef NS_ENUM(NSInteger, AWSLightsailRelationalDatabasePasswordVersion) {
    AWSLightsailRelationalDatabasePasswordVersionUnknown,
    AWSLightsailRelationalDatabasePasswordVersionCurrent,
    AWSLightsailRelationalDatabasePasswordVersionPrevious,
    AWSLightsailRelationalDatabasePasswordVersionPending,
};

typedef NS_ENUM(NSInteger, AWSLightsailResourceType) {
    AWSLightsailResourceTypeUnknown,
    AWSLightsailResourceTypeInstance,
    AWSLightsailResourceTypeStaticIp,
    AWSLightsailResourceTypeKeyPair,
    AWSLightsailResourceTypeInstanceSnapshot,
    AWSLightsailResourceTypeDomain,
    AWSLightsailResourceTypePeeredVpc,
    AWSLightsailResourceTypeLoadBalancer,
    AWSLightsailResourceTypeLoadBalancerTlsCertificate,
    AWSLightsailResourceTypeDisk,
    AWSLightsailResourceTypeDiskSnapshot,
    AWSLightsailResourceTypeRelationalDatabase,
    AWSLightsailResourceTypeRelationalDatabaseSnapshot,
    AWSLightsailResourceTypeExportSnapshotRecord,
    AWSLightsailResourceTypeCloudFormationStackRecord,
    AWSLightsailResourceTypeAlarm,
    AWSLightsailResourceTypeContactMethod,
};

typedef NS_ENUM(NSInteger, AWSLightsailTreatMissingData) {
    AWSLightsailTreatMissingDataUnknown,
    AWSLightsailTreatMissingDataBreaching,
    AWSLightsailTreatMissingDataNotBreaching,
    AWSLightsailTreatMissingDataIgnore,
    AWSLightsailTreatMissingDataMissing,
};

@class AWSLightsailAddOn;
@class AWSLightsailAddOnRequest;
@class AWSLightsailAlarm;
@class AWSLightsailAllocateStaticIpRequest;
@class AWSLightsailAllocateStaticIpResult;
@class AWSLightsailAttachDiskRequest;
@class AWSLightsailAttachDiskResult;
@class AWSLightsailAttachInstancesToLoadBalancerRequest;
@class AWSLightsailAttachInstancesToLoadBalancerResult;
@class AWSLightsailAttachLoadBalancerTlsCertificateRequest;
@class AWSLightsailAttachLoadBalancerTlsCertificateResult;
@class AWSLightsailAttachStaticIpRequest;
@class AWSLightsailAttachStaticIpResult;
@class AWSLightsailAttachedDisk;
@class AWSLightsailAutoSnapshotAddOnRequest;
@class AWSLightsailAutoSnapshotDetails;
@class AWSLightsailAvailabilityZone;
@class AWSLightsailBlueprint;
@class AWSLightsailBundle;
@class AWSLightsailCloseInstancePublicPortsRequest;
@class AWSLightsailCloseInstancePublicPortsResult;
@class AWSLightsailCloudFormationStackRecord;
@class AWSLightsailCloudFormationStackRecordSourceInfo;
@class AWSLightsailContactMethod;
@class AWSLightsailReplicateSnapshotRequest;
@class AWSLightsailReplicateSnapshotResult;
@class AWSLightsailCreateCloudFormationStackRequest;
@class AWSLightsailCreateCloudFormationStackResult;
@class AWSLightsailCreateContactMethodRequest;
@class AWSLightsailCreateContactMethodResult;
@class AWSLightsailCreateDiskFromSnapshotRequest;
@class AWSLightsailCreateDiskFromSnapshotResult;
@class AWSLightsailCreateDiskRequest;
@class AWSLightsailCreateDiskResult;
@class AWSLightsailCreateDiskSnapshotRequest;
@class AWSLightsailCreateDiskSnapshotResult;
@class AWSLightsailCreateDomainEntryRequest;
@class AWSLightsailCreateDomainEntryResult;
@class AWSLightsailCreateDomainRequest;
@class AWSLightsailCreateDomainResult;
@class AWSLightsailCreateInstanceSnapshotRequest;
@class AWSLightsailCreateInstanceSnapshotResult;
@class AWSLightsailCreateInstancesFromSnapshotRequest;
@class AWSLightsailCreateInstancesFromSnapshotResult;
@class AWSLightsailCreateInstancesRequest;
@class AWSLightsailCreateInstancesResult;
@class AWSLightsailCreateKeyPairRequest;
@class AWSLightsailCreateKeyPairResult;
@class AWSLightsailCreateLoadBalancerRequest;
@class AWSLightsailCreateLoadBalancerResult;
@class AWSLightsailCreateLoadBalancerTlsCertificateRequest;
@class AWSLightsailCreateLoadBalancerTlsCertificateResult;
@class AWSLightsailCreateRelationalDatabaseFromSnapshotRequest;
@class AWSLightsailCreateRelationalDatabaseFromSnapshotResult;
@class AWSLightsailCreateRelationalDatabaseRequest;
@class AWSLightsailCreateRelationalDatabaseResult;
@class AWSLightsailCreateRelationalDatabaseSnapshotRequest;
@class AWSLightsailCreateRelationalDatabaseSnapshotResult;
@class AWSLightsailDeleteAlarmRequest;
@class AWSLightsailDeleteAlarmResult;
@class AWSLightsailDeleteAutoSnapshotRequest;
@class AWSLightsailDeleteAutoSnapshotResult;
@class AWSLightsailDeleteContactMethodRequest;
@class AWSLightsailDeleteContactMethodResult;
@class AWSLightsailDeleteDiskRequest;
@class AWSLightsailDeleteDiskResult;
@class AWSLightsailDeleteDiskSnapshotRequest;
@class AWSLightsailDeleteDiskSnapshotResult;
@class AWSLightsailDeleteDomainEntryRequest;
@class AWSLightsailDeleteDomainEntryResult;
@class AWSLightsailDeleteDomainRequest;
@class AWSLightsailDeleteDomainResult;
@class AWSLightsailDeleteInstanceRequest;
@class AWSLightsailDeleteInstanceResult;
@class AWSLightsailDeleteInstanceSnapshotRequest;
@class AWSLightsailDeleteInstanceSnapshotResult;
@class AWSLightsailDeleteKeyPairRequest;
@class AWSLightsailDeleteKeyPairResult;
@class AWSLightsailDeleteKnownHostKeysRequest;
@class AWSLightsailDeleteKnownHostKeysResult;
@class AWSLightsailDeleteLoadBalancerRequest;
@class AWSLightsailDeleteLoadBalancerResult;
@class AWSLightsailDeleteLoadBalancerTlsCertificateRequest;
@class AWSLightsailDeleteLoadBalancerTlsCertificateResult;
@class AWSLightsailDeleteRelationalDatabaseRequest;
@class AWSLightsailDeleteRelationalDatabaseResult;
@class AWSLightsailDeleteRelationalDatabaseSnapshotRequest;
@class AWSLightsailDeleteRelationalDatabaseSnapshotResult;
@class AWSLightsailDestinationInfo;
@class AWSLightsailDetachDiskRequest;
@class AWSLightsailDetachDiskResult;
@class AWSLightsailDetachInstancesFromLoadBalancerRequest;
@class AWSLightsailDetachInstancesFromLoadBalancerResult;
@class AWSLightsailDetachStaticIpRequest;
@class AWSLightsailDetachStaticIpResult;
@class AWSLightsailDisableAddOnRequest;
@class AWSLightsailDisableAddOnResult;
@class AWSLightsailDisk;
@class AWSLightsailDiskInfo;
@class AWSLightsailDiskMap;
@class AWSLightsailDiskSnapshot;
@class AWSLightsailDiskSnapshotInfo;
@class AWSLightsailDomain;
@class AWSLightsailDomainEntry;
@class AWSLightsailDownloadDefaultKeyPairRequest;
@class AWSLightsailDownloadDefaultKeyPairResult;
@class AWSLightsailEnableAddOnRequest;
@class AWSLightsailEnableAddOnResult;
@class AWSLightsailExportSnapshotRecord;
@class AWSLightsailExportSnapshotRecordSourceInfo;
@class AWSLightsailExportSnapshotRequest;
@class AWSLightsailExportSnapshotResult;
@class AWSLightsailGetActiveNamesRequest;
@class AWSLightsailGetActiveNamesResult;
@class AWSLightsailGetAlarmsRequest;
@class AWSLightsailGetAlarmsResult;
@class AWSLightsailGetAutoSnapshotsRequest;
@class AWSLightsailGetAutoSnapshotsResult;
@class AWSLightsailGetBlueprintsRequest;
@class AWSLightsailGetBlueprintsResult;
@class AWSLightsailGetBundlesRequest;
@class AWSLightsailGetBundlesResult;
@class AWSLightsailGetCloudFormationStackRecordsRequest;
@class AWSLightsailGetCloudFormationStackRecordsResult;
@class AWSLightsailGetContactMethodsRequest;
@class AWSLightsailGetContactMethodsResult;
@class AWSLightsailGetDiskRequest;
@class AWSLightsailGetDiskResult;
@class AWSLightsailGetDiskSnapshotRequest;
@class AWSLightsailGetDiskSnapshotResult;
@class AWSLightsailGetDiskSnapshotsRequest;
@class AWSLightsailGetDiskSnapshotsResult;
@class AWSLightsailGetDisksRequest;
@class AWSLightsailGetDisksResult;
@class AWSLightsailGetDomainRequest;
@class AWSLightsailGetDomainResult;
@class AWSLightsailGetDomainsRequest;
@class AWSLightsailGetDomainsResult;
@class AWSLightsailGetExportSnapshotRecordsRequest;
@class AWSLightsailGetExportSnapshotRecordsResult;
@class AWSLightsailGetInstanceAccessDetailsRequest;
@class AWSLightsailGetInstanceAccessDetailsResult;
@class AWSLightsailGetInstanceMetricDataRequest;
@class AWSLightsailGetInstanceMetricDataResult;
@class AWSLightsailGetInstancePortStatesRequest;
@class AWSLightsailGetInstancePortStatesResult;
@class AWSLightsailGetInstanceRequest;
@class AWSLightsailGetInstanceResult;
@class AWSLightsailGetInstanceSnapshotRequest;
@class AWSLightsailGetInstanceSnapshotResult;
@class AWSLightsailGetInstanceSnapshotsRequest;
@class AWSLightsailGetInstanceSnapshotsResult;
@class AWSLightsailGetInstanceStateRequest;
@class AWSLightsailGetInstanceStateResult;
@class AWSLightsailGetInstancesRequest;
@class AWSLightsailGetInstancesResult;
@class AWSLightsailGetKeyPairRequest;
@class AWSLightsailGetKeyPairResult;
@class AWSLightsailGetKeyPairsRequest;
@class AWSLightsailGetKeyPairsResult;
@class AWSLightsailGetLoadBalancerMetricDataRequest;
@class AWSLightsailGetLoadBalancerMetricDataResult;
@class AWSLightsailGetLoadBalancerRequest;
@class AWSLightsailGetLoadBalancerResult;
@class AWSLightsailGetLoadBalancerTlsCertificatesRequest;
@class AWSLightsailGetLoadBalancerTlsCertificatesResult;
@class AWSLightsailGetLoadBalancersRequest;
@class AWSLightsailGetLoadBalancersResult;
@class AWSLightsailGetOperationRequest;
@class AWSLightsailGetOperationResult;
@class AWSLightsailGetOperationsForResourceRequest;
@class AWSLightsailGetOperationsForResourceResult;
@class AWSLightsailGetOperationsRequest;
@class AWSLightsailGetOperationsResult;
@class AWSLightsailGetRegionsRequest;
@class AWSLightsailGetRegionsResult;
@class AWSLightsailGetRelationalDatabaseBlueprintsRequest;
@class AWSLightsailGetRelationalDatabaseBlueprintsResult;
@class AWSLightsailGetRelationalDatabaseBundlesRequest;
@class AWSLightsailGetRelationalDatabaseBundlesResult;
@class AWSLightsailGetRelationalDatabaseEventsRequest;
@class AWSLightsailGetRelationalDatabaseEventsResult;
@class AWSLightsailGetRelationalDatabaseLogEventsRequest;
@class AWSLightsailGetRelationalDatabaseLogEventsResult;
@class AWSLightsailGetRelationalDatabaseLogStreamsRequest;
@class AWSLightsailGetRelationalDatabaseLogStreamsResult;
@class AWSLightsailGetRelationalDatabaseMasterUserPasswordRequest;
@class AWSLightsailGetRelationalDatabaseMasterUserPasswordResult;
@class AWSLightsailGetRelationalDatabaseMetricDataRequest;
@class AWSLightsailGetRelationalDatabaseMetricDataResult;
@class AWSLightsailGetRelationalDatabaseParametersRequest;
@class AWSLightsailGetRelationalDatabaseParametersResult;
@class AWSLightsailGetRelationalDatabaseRequest;
@class AWSLightsailGetRelationalDatabaseResult;
@class AWSLightsailGetRelationalDatabaseSnapshotRequest;
@class AWSLightsailGetRelationalDatabaseSnapshotResult;
@class AWSLightsailGetRelationalDatabaseSnapshotsRequest;
@class AWSLightsailGetRelationalDatabaseSnapshotsResult;
@class AWSLightsailGetRelationalDatabasesRequest;
@class AWSLightsailGetRelationalDatabasesResult;
@class AWSLightsailGetStaticIpRequest;
@class AWSLightsailGetStaticIpResult;
@class AWSLightsailGetStaticIpsRequest;
@class AWSLightsailGetStaticIpsResult;
@class AWSLightsailHostKeyAttributes;
@class AWSLightsailImportKeyPairRequest;
@class AWSLightsailImportKeyPairResult;
@class AWSLightsailInstance;
@class AWSLightsailInstanceAccessDetails;
@class AWSLightsailInstanceEntry;
@class AWSLightsailInstanceHardware;
@class AWSLightsailInstanceHealthSummary;
@class AWSLightsailInstanceNetworking;
@class AWSLightsailInstancePortInfo;
@class AWSLightsailInstancePortState;
@class AWSLightsailInstanceSnapshot;
@class AWSLightsailInstanceSnapshotInfo;
@class AWSLightsailInstanceState;
@class AWSLightsailIsVpcPeeredRequest;
@class AWSLightsailIsVpcPeeredResult;
@class AWSLightsailKeyPair;
@class AWSLightsailLoadBalancer;
@class AWSLightsailLoadBalancerTlsCertificate;
@class AWSLightsailLoadBalancerTlsCertificateDomainValidationOption;
@class AWSLightsailLoadBalancerTlsCertificateDomainValidationRecord;
@class AWSLightsailLoadBalancerTlsCertificateRenewalSummary;
@class AWSLightsailLoadBalancerTlsCertificateSummary;
@class AWSLightsailLogEvent;
@class AWSLightsailMetricDatapoint;
@class AWSLightsailMonitoredResourceInfo;
@class AWSLightsailMonthlyTransfer;
@class AWSLightsailOpenInstancePublicPortsRequest;
@class AWSLightsailOpenInstancePublicPortsResult;
@class AWSLightsailOperation;
@class AWSLightsailPasswordData;
@class AWSLightsailPeerVpcRequest;
@class AWSLightsailPeerVpcResult;
@class AWSLightsailPendingMaintenanceAction;
@class AWSLightsailPendingModifiedRelationalDatabaseValues;
@class AWSLightsailPortInfo;
@class AWSLightsailPutAlarmRequest;
@class AWSLightsailPutAlarmResult;
@class AWSLightsailPutInstancePublicPortsRequest;
@class AWSLightsailPutInstancePublicPortsResult;
@class AWSLightsailRebootInstanceRequest;
@class AWSLightsailRebootInstanceResult;
@class AWSLightsailRebootRelationalDatabaseRequest;
@class AWSLightsailRebootRelationalDatabaseResult;
@class AWSLightsailRegion;
@class AWSLightsailRelationalDatabase;
@class AWSLightsailRelationalDatabaseBlueprint;
@class AWSLightsailRelationalDatabaseBundle;
@class AWSLightsailRelationalDatabaseEndpoint;
@class AWSLightsailRelationalDatabaseEvent;
@class AWSLightsailRelationalDatabaseHardware;
@class AWSLightsailRelationalDatabaseParameter;
@class AWSLightsailRelationalDatabaseSnapshot;
@class AWSLightsailReleaseStaticIpRequest;
@class AWSLightsailReleaseStaticIpResult;
@class AWSLightsailResourceLocation;
@class AWSLightsailSendContactMethodVerificationRequest;
@class AWSLightsailSendContactMethodVerificationResult;
@class AWSLightsailStartInstanceRequest;
@class AWSLightsailStartInstanceResult;
@class AWSLightsailStartRelationalDatabaseRequest;
@class AWSLightsailStartRelationalDatabaseResult;
@class AWSLightsailStaticIp;
@class AWSLightsailStopInstanceRequest;
@class AWSLightsailStopInstanceResult;
@class AWSLightsailStopRelationalDatabaseRequest;
@class AWSLightsailStopRelationalDatabaseResult;
@class AWSLightsailTag;
@class AWSLightsailTagResourceRequest;
@class AWSLightsailTagResourceResult;
@class AWSLightsailTestAlarmRequest;
@class AWSLightsailTestAlarmResult;
@class AWSLightsailUnpeerVpcRequest;
@class AWSLightsailUnpeerVpcResult;
@class AWSLightsailUntagResourceRequest;
@class AWSLightsailUntagResourceResult;
@class AWSLightsailUpdateDomainEntryRequest;
@class AWSLightsailUpdateDomainEntryResult;
@class AWSLightsailUpdateLoadBalancerAttributeRequest;
@class AWSLightsailUpdateLoadBalancerAttributeResult;
@class AWSLightsailUpdateRelationalDatabaseParametersRequest;
@class AWSLightsailUpdateRelationalDatabaseParametersResult;
@class AWSLightsailUpdateRelationalDatabaseRequest;
@class AWSLightsailUpdateRelationalDatabaseResult;

/**
 <p>Describes an add-on that is enabled for an Amazon Lightsail resource.</p>
 */
@interface AWSLightsailAddOn : AWSModel


/**
 <p>The name of the add-on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The next daily time an automatic snapshot will be created.</p><p>The time shown is in <code>HH:00</code> format, and in Coordinated Universal Time (UTC).</p><p>The snapshot is automatically created between the time shown and up to 45 minutes after.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextSnapshotTimeOfDay;

/**
 <p>The daily time when an automatic snapshot is created.</p><p>The time shown is in <code>HH:00</code> format, and in Coordinated Universal Time (UTC).</p><p>The snapshot is automatically created between the time shown and up to 45 minutes after.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotTimeOfDay;

/**
 <p>The status of the add-on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Describes a request to enable, modify, or disable an add-on for an Amazon Lightsail resource.</p><note><p>An additional cost may be associated with enabling add-ons. For more information, see the <a href="https://aws.amazon.com/lightsail/pricing/">Lightsail pricing page</a>.</p></note>
 Required parameters: [addOnType]
 */
@interface AWSLightsailAddOnRequest : AWSModel


/**
 <p>The add-on type.</p>
 */
@property (nonatomic, assign) AWSLightsailAddOnType addOnType;

/**
 <p>An object that represents additional parameters when enabling or modifying the automatic snapshot add-on.</p>
 */
@property (nonatomic, strong) AWSLightsailAutoSnapshotAddOnRequest * _Nullable autoSnapshotAddOnRequest;

@end

/**
 <p>Describes an alarm.</p><p>An alarm is a way to monitor your Amazon Lightsail resource metrics. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms in Amazon Lightsail</a>.</p>
 */
@interface AWSLightsailAlarm : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The arithmetic operation used when comparing the specified statistic and threshold.</p>
 */
@property (nonatomic, assign) AWSLightsailComparisonOperator comparisonOperator;

/**
 <p>The contact protocols for the alarm, such as <code>Email</code>, <code>SMS</code> (text messaging), or both.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable contactProtocols;

/**
 <p>The timestamp when the alarm was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The number of data points that must not within the specified threshold to trigger the alarm.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable datapointsToAlarm;

/**
 <p>The number of periods over which data is compared to the specified threshold.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationPeriods;

/**
 <p>An object that lists information about the location of the alarm.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The name of the metric associated with the alarm.</p>
 */
@property (nonatomic, assign) AWSLightsailMetricName metricName;

/**
 <p>An object that lists information about the resource monitored by the alarm.</p>
 */
@property (nonatomic, strong) AWSLightsailMonitoredResourceInfo * _Nullable monitoredResourceInfo;

/**
 <p>The name of the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Indicates whether the alarm is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable notificationEnabled;

/**
 <p>The alarm states that trigger a notification.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notificationTriggers;

/**
 <p>The period, in seconds, over which the statistic is applied.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The Lightsail resource type (e.g., <code>Alarm</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>The current state of the alarm.</p><p>An alarm has the following possible states:</p><ul><li><p><code>ALARM</code> - The metric is outside of the defined threshold.</p></li><li><p><code>INSUFFICIENT_DATA</code> - The alarm has just started, the metric is not available, or not enough data is available for the metric to determine the alarm state.</p></li><li><p><code>OK</code> - The metric is within the defined threshold.</p></li></ul>
 */
@property (nonatomic, assign) AWSLightsailAlarmState state;

/**
 <p>The statistic for the metric associated with the alarm.</p><p>The following statistics are available:</p><ul><li><p><code>Minimum</code> - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.</p></li><li><p><code>Maximum</code> - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.</p></li><li><p><code>Sum</code> - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.</p></li><li><p><code>Average</code> - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.</p></li><li><p><code>SampleCount</code> - The count, or number, of data points used for the statistical calculation.</p></li></ul>
 */
@property (nonatomic, assign) AWSLightsailMetricStatistic statistic;

/**
 <p>The support code. Include this code in your email to support when you have questions about your Lightsail alarm. This code enables our support team to look up your Lightsail information more easily.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportCode;

/**
 <p>The value against which the specified statistic is compared.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable threshold;

/**
 <p>Specifies how the alarm handles missing data points.</p><p>An alarm can treat missing data in the following ways:</p><ul><li><p><code>breaching</code> - Assume the missing data is not within the threshold. Missing data counts towards the number of times the metric is not within the threshold.</p></li><li><p><code>notBreaching</code> - Assume the missing data is within the threshold. Missing data does not count towards the number of times the metric is not within the threshold.</p></li><li><p><code>ignore</code> - Ignore the missing data. Maintains the current alarm state.</p></li><li><p><code>missing</code> - Missing data is treated as missing.</p></li></ul>
 */
@property (nonatomic, assign) AWSLightsailTreatMissingData treatMissingData;

/**
 <p>The unit of the metric associated with the alarm.</p>
 */
@property (nonatomic, assign) AWSLightsailMetricUnit unit;

@end

/**
 
 */
@interface AWSLightsailAllocateStaticIpRequest : AWSRequest


/**
 <p>The name of the static IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable staticIpName;

@end

/**
 
 */
@interface AWSLightsailAllocateStaticIpResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailAttachDiskRequest : AWSRequest


/**
 <p>The unique Lightsail disk name (e.g., <code>my-disk</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskName;

/**
 <p>The disk path to expose to the instance (e.g., <code>/dev/xvdf</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskPath;

/**
 <p>The name of the Lightsail instance where you want to utilize the storage disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

@end

/**
 
 */
@interface AWSLightsailAttachDiskResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailAttachInstancesToLoadBalancerRequest : AWSRequest


/**
 <p>An array of strings representing the instance name(s) you want to attach to your load balancer.</p><p>An instance must be <code>running</code> before you can attach it to your load balancer.</p><p>There are no additional limits on the number of instances you can attach to your load balancer, aside from the limit of Lightsail instances you can create in your account (20).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceNames;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSLightsailAttachInstancesToLoadBalancerResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailAttachLoadBalancerTlsCertificateRequest : AWSRequest


/**
 <p>The name of your SSL/TLS certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateName;

/**
 <p>The name of the load balancer to which you want to associate the SSL/TLS certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSLightsailAttachLoadBalancerTlsCertificateResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p><p>These SSL/TLS certificates are only usable by Lightsail load balancers. You can't get the certificate and use it for another purpose.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailAttachStaticIpRequest : AWSRequest


/**
 <p>The instance name to which you want to attach the static IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

/**
 <p>The name of the static IP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable staticIpName;

@end

/**
 
 */
@interface AWSLightsailAttachStaticIpResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 <p>Describes a block storage disk that is attached to an instance, and is included in an automatic snapshot.</p>
 */
@interface AWSLightsailAttachedDisk : AWSModel


/**
 <p>The path of the disk (e.g., <code>/dev/xvdf</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The size of the disk in GB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInGb;

@end

/**
 <p>Describes a request to enable or modify the automatic snapshot add-on for an Amazon Lightsail instance or disk.</p><p>When you modify the automatic snapshot time for a resource, it is typically effective immediately except under the following conditions:</p><ul><li><p>If an automatic snapshot has been created for the current day, and you change the snapshot time to a later time of day, then the new snapshot time will be effective the following day. This ensures that two snapshots are not created for the current day.</p></li><li><p>If an automatic snapshot has not yet been created for the current day, and you change the snapshot time to an earlier time of day, then the new snapshot time will be effective the following day and a snapshot is automatically created at the previously set time for the current day. This ensures that a snapshot is created for the current day.</p></li><li><p>If an automatic snapshot has not yet been created for the current day, and you change the snapshot time to a time that is within 30 minutes from your current time, then the new snapshot time will be effective the following day and a snapshot is automatically created at the previously set time for the current day. This ensures that a snapshot is created for the current day, because 30 minutes is required between your current time and the new snapshot time that you specify.</p></li><li><p>If an automatic snapshot is scheduled to be created within 30 minutes from your current time and you change the snapshot time, then the new snapshot time will be effective the following day and a snapshot is automatically created at the previously set time for the current day. This ensures that a snapshot is created for the current day, because 30 minutes is required between your current time and the new snapshot time that you specify.</p></li></ul>
 */
@interface AWSLightsailAutoSnapshotAddOnRequest : AWSModel


/**
 <p>The daily time when an automatic snapshot will be created.</p><p>Constraints:</p><ul><li><p>Must be in <code>HH:00</code> format, and in an hourly increment.</p></li><li><p>Specified in Coordinated Universal Time (UTC).</p></li><li><p>The snapshot will be automatically created between the time specified and up to 45 minutes after.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotTimeOfDay;

@end

/**
 <p>Describes an automatic snapshot.</p>
 */
@interface AWSLightsailAutoSnapshotDetails : AWSModel


/**
 <p>The timestamp when the automatic snapshot was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The date of the automatic snapshot in <code>YYYY-MM-DD</code> format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable date;

/**
 <p>An array of objects that describe the block storage disks attached to the instance when the automatic snapshot was created.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailAttachedDisk *> * _Nullable fromAttachedDisks;

/**
 <p>The status of the automatic snapshot.</p>
 */
@property (nonatomic, assign) AWSLightsailAutoSnapshotStatus status;

@end

/**
 <p>Describes an Availability Zone.</p>
 */
@interface AWSLightsailAvailabilityZone : AWSModel


/**
 <p>The state of the Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>The name of the Availability Zone. The format is <code>us-east-2a</code> (case-sensitive).</p>
 */
@property (nonatomic, strong) NSString * _Nullable zoneName;

@end

/**
 <p>Describes a blueprint (a virtual private server image).</p>
 */
@interface AWSLightsailBlueprint : AWSModel


/**
 <p>The ID for the virtual private server image (e.g., <code>app_wordpress_4_4</code> or <code>app_lamp_7_0</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable blueprintId;

/**
 <p>The description of the blueprint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The group name of the blueprint (e.g., <code>amazon-linux</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable group;

/**
 <p>A Boolean value indicating whether the blueprint is active. Inactive blueprints are listed to support customers with existing instances but are not necessarily available for launch of new instances. Blueprints are marked inactive when they become outdated due to operating system updates or new application releases.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isActive;

/**
 <p>The end-user license agreement URL for the image or blueprint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseUrl;

/**
 <p>The minimum bundle power required to run this blueprint. For example, you need a bundle with a power value of 500 or more to create an instance that uses a blueprint with a minimum power value of 500. <code>0</code> indicates that the blueprint runs on all instance sizes. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minPower;

/**
 <p>The friendly name of the blueprint (e.g., <code>Amazon Linux</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The operating system platform (either Linux/Unix-based or Windows Server-based) of the blueprint.</p>
 */
@property (nonatomic, assign) AWSLightsailInstancePlatform platform;

/**
 <p>The product URL to learn more about the image or blueprint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productUrl;

/**
 <p>The type of the blueprint (e.g., <code>os</code> or <code>app</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailBlueprintType types;

/**
 <p>The version number of the operating system, application, or stack (e.g., <code>2016.03.0</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The version code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionCode;

@end

/**
 <p>Describes a bundle, which is a set of specs describing your virtual private server (or <i>instance</i>).</p>
 */
@interface AWSLightsailBundle : AWSModel


/**
 <p>The bundle ID (e.g., <code>micro_1_0</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 <p>The number of vCPUs included in the bundle (e.g., <code>2</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cpuCount;

/**
 <p>The size of the SSD (e.g., <code>30</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable diskSizeInGb;

/**
 <p>The Amazon EC2 instance type (e.g., <code>t2.micro</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>A Boolean value indicating whether the bundle is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isActive;

/**
 <p>A friendly name for the bundle (e.g., <code>Micro</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A numeric value that represents the power of the bundle (e.g., <code>500</code>). You can use the bundle's power value in conjunction with a blueprint's minimum power value to determine whether the blueprint will run on the bundle. For example, you need a bundle with a power value of 500 or more to create an instance that uses a blueprint with a minimum power value of 500.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable power;

/**
 <p>The price in US dollars (e.g., <code>5.0</code>) of the bundle.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable price;

/**
 <p>The amount of RAM in GB (e.g., <code>2.0</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ramSizeInGb;

/**
 <p>The operating system platform (Linux/Unix-based or Windows Server-based) that the bundle supports. You can only launch a <code>WINDOWS</code> bundle on a blueprint that supports the <code>WINDOWS</code> platform. <code>LINUX_UNIX</code> blueprints require a <code>LINUX_UNIX</code> bundle.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedPlatforms;

/**
 <p>The data transfer rate per month in GB (e.g., <code>2000</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable transferPerMonthInGb;

@end

/**
 
 */
@interface AWSLightsailCloseInstancePublicPortsRequest : AWSRequest


/**
 <p>The name of the instance for which to close ports.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

/**
 <p>An object to describe the ports to close for the specified instance.</p>
 */
@property (nonatomic, strong) AWSLightsailPortInfo * _Nullable portInfo;

@end

/**
 
 */
@interface AWSLightsailCloseInstancePublicPortsResult : AWSModel


/**
 <p>An object that describes the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) AWSLightsailOperation * _Nullable operation;

@end

/**
 <p>Describes a CloudFormation stack record created as a result of the <code>create cloud formation stack</code> operation.</p><p>A CloudFormation stack record provides information about the AWS CloudFormation stack used to create a new Amazon Elastic Compute Cloud instance from an exported Lightsail instance snapshot.</p>
 */
@interface AWSLightsailCloudFormationStackRecord : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the CloudFormation stack record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date when the CloudFormation stack record was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>A list of objects describing the destination service, which is AWS CloudFormation, and the Amazon Resource Name (ARN) of the AWS CloudFormation stack.</p>
 */
@property (nonatomic, strong) AWSLightsailDestinationInfo * _Nullable destinationInfo;

/**
 <p>A list of objects describing the Availability Zone and AWS Region of the CloudFormation stack record.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The name of the CloudFormation stack record. It starts with <code>CloudFormationStackRecord</code> followed by a GUID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Lightsail resource type (e.g., <code>CloudFormationStackRecord</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>A list of objects describing the source of the CloudFormation stack record.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailCloudFormationStackRecordSourceInfo *> * _Nullable sourceInfo;

/**
 <p>The current state of the CloudFormation stack record.</p>
 */
@property (nonatomic, assign) AWSLightsailRecordState state;

@end

/**
 <p>Describes the source of a CloudFormation stack record (i.e., the export snapshot record).</p>
 */
@interface AWSLightsailCloudFormationStackRecordSourceInfo : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the export snapshot record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The name of the record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Lightsail resource type (e.g., <code>ExportSnapshotRecord</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailCloudFormationStackRecordSourceType resourceType;

@end

/**
 <p>Describes a contact method.</p><p>A contact method is a way to send you notifications. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p>
 */
@interface AWSLightsailContactMethod : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the contact method.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The destination of the contact method, such as an email address or a mobile phone number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactEndpoint;

/**
 <p>The timestamp when the contact method was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>Describes the resource location.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The name of the contact method.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The protocol of the contact method, such as email or SMS (text messaging).</p>
 */
@property (nonatomic, assign) AWSLightsailContactProtocol protocols;

/**
 <p>The Lightsail resource type (e.g., <code>ContactMethod</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>The current status of the contact method.</p><p>A contact method has the following possible status:</p><ul><li><p><code>PendingVerification</code> - The contact method has not yet been verified, and the verification has not yet expired.</p></li><li><p><code>Valid</code> - The contact method has been verified.</p></li><li><p><code>InValid</code> - An attempt was made to verify the contact method, but the verification has expired.</p></li></ul>
 */
@property (nonatomic, assign) AWSLightsailContactMethodStatus status;

/**
 <p>The support code. Include this code in your email to support when you have questions about your Lightsail contact method. This code enables our support team to look up your Lightsail information more easily.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportCode;

@end

/**
 
 */
@interface AWSLightsailReplicateSnapshotRequest : AWSRequest


/**
 <p>The date of the source automatic snapshot to copy. Use the <code>get auto snapshots</code> operation to identify the dates of the available automatic snapshots.</p><p>Constraints:</p><ul><li><p>Must be specified in <code>YYYY-MM-DD</code> format.</p></li><li><p>This parameter cannot be defined together with the <code>use latest restorable auto snapshot</code> parameter. The <code>restore date</code> and <code>use latest restorable auto snapshot</code> parameters are mutually exclusive.</p></li><li><p>Define this parameter only when copying an automatic snapshot as a manual snapshot. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots">Lightsail Dev Guide</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable restoreDate;

/**
 <p>The AWS Region where the source manual or automatic snapshot is located.</p>
 */
@property (nonatomic, assign) AWSLightsailRegionName sourceRegion;

/**
 <p>The name of the source instance or disk from which the source automatic snapshot was created.</p><p>Constraint:</p><ul><li><p>Define this parameter only when copying an automatic snapshot as a manual snapshot. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots">Lightsail Dev Guide</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceResourceName;

/**
 <p>The name of the source manual snapshot to copy.</p><p>Constraint:</p><ul><li><p>Define this parameter only when copying a manual snapshot as another manual snapshot.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSnapshotName;

/**
 <p>The name of the new manual snapshot to be created as a copy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetSnapshotName;

/**
 <p>A Boolean value to indicate whether to use the latest available automatic snapshot of the specified source instance or disk.</p><p>Constraints:</p><ul><li><p>This parameter cannot be defined together with the <code>restore date</code> parameter. The <code>use latest restorable auto snapshot</code> and <code>restore date</code> parameters are mutually exclusive.</p></li><li><p>Define this parameter only when copying an automatic snapshot as a manual snapshot. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots">Lightsail Dev Guide</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable useLatestRestorableAutoSnapshot;

@end

/**
 
 */
@interface AWSLightsailReplicateSnapshotResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailCreateCloudFormationStackRequest : AWSRequest


/**
 <p>An array of parameters that will be used to create the new Amazon EC2 instance. You can only pass one instance entry at a time in this array. You will get an invalid parameter error if you pass more than one instance entry in this array.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailInstanceEntry *> * _Nullable instances;

@end

/**
 
 */
@interface AWSLightsailCreateCloudFormationStackResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailCreateContactMethodRequest : AWSRequest


/**
 <p>The destination of the contact method, such as an email address or a mobile phone number.</p><p>Use the E.164 format when specifying a mobile phone number. E.164 is a standard for the phone number structure used for international telecommunication. Phone numbers that follow this format can have a maximum of 15 digits, and they are prefixed with the plus character (+) and the country code. For example, a U.S. phone number in E.164 format would be specified as +1XXX5550100. For more information, see <a href="https://en.wikipedia.org/wiki/E.164">E.164</a> on <i>Wikipedia</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contactEndpoint;

/**
 <p>The protocol of the contact method, such as <code>Email</code> or <code>SMS</code> (text messaging).</p><p>The <code>SMS</code> protocol is supported only in the following AWS Regions.</p><ul><li><p>US East (N. Virginia) (<code>us-east-1</code>)</p></li><li><p>US West (Oregon) (<code>us-west-2</code>)</p></li><li><p>Europe (Ireland) (<code>eu-west-1</code>)</p></li><li><p>Asia Pacific (Tokyo) (<code>ap-northeast-1</code>)</p></li><li><p>Asia Pacific (Singapore) (<code>ap-southeast-1</code>)</p></li><li><p>Asia Pacific (Sydney) (<code>ap-southeast-2</code>)</p></li></ul><p>For a list of countries/regions where SMS text messages can be sent, and the latest AWS Regions where SMS text messaging is supported, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-supported-regions-countries.html">Supported Regions and Countries</a> in the <i>Amazon SNS Developer Guide</i>.</p><p>For more information about notifications in Amazon Lightsail, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications in Amazon Lightsail</a>.</p>
 */
@property (nonatomic, assign) AWSLightsailContactProtocol protocols;

@end

/**
 
 */
@interface AWSLightsailCreateContactMethodResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailCreateDiskFromSnapshotRequest : AWSRequest


/**
 <p>An array of objects that represent the add-ons to enable for the new disk.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailAddOnRequest *> * _Nullable addOns;

/**
 <p>The Availability Zone where you want to create the disk (e.g., <code>us-east-2a</code>). Choose the same Availability Zone as the Lightsail instance where you want to create the disk.</p><p>Use the GetRegions operation to list the Availability Zones where Lightsail is currently available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The unique Lightsail disk name (e.g., <code>my-disk</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskName;

/**
 <p>The name of the disk snapshot (e.g., <code>my-snapshot</code>) from which to create the new storage disk.</p><p>Constraint:</p><ul><li><p>This parameter cannot be defined together with the <code>source disk name</code> parameter. The <code>disk snapshot name</code> and <code>source disk name</code> parameters are mutually exclusive.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable diskSnapshotName;

/**
 <p>The date of the automatic snapshot to use for the new disk. Use the <code>get auto snapshots</code> operation to identify the dates of the available automatic snapshots.</p><p>Constraints:</p><ul><li><p>Must be specified in <code>YYYY-MM-DD</code> format.</p></li><li><p>This parameter cannot be defined together with the <code>use latest restorable auto snapshot</code> parameter. The <code>restore date</code> and <code>use latest restorable auto snapshot</code> parameters are mutually exclusive.</p></li><li><p>Define this parameter only when creating a new disk from an automatic snapshot. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable restoreDate;

/**
 <p>The size of the disk in GB (e.g., <code>32</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInGb;

/**
 <p>The name of the source disk from which the source automatic snapshot was created.</p><p>Constraints:</p><ul><li><p>This parameter cannot be defined together with the <code>disk snapshot name</code> parameter. The <code>source disk name</code> and <code>disk snapshot name</code> parameters are mutually exclusive.</p></li><li><p>Define this parameter only when creating a new disk from an automatic snapshot. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDiskName;

/**
 <p>The tag keys and optional values to add to the resource during create.</p><p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

/**
 <p>A Boolean value to indicate whether to use the latest available automatic snapshot.</p><p>Constraints:</p><ul><li><p>This parameter cannot be defined together with the <code>restore date</code> parameter. The <code>use latest restorable auto snapshot</code> and <code>restore date</code> parameters are mutually exclusive.</p></li><li><p>Define this parameter only when creating a new disk from an automatic snapshot. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable useLatestRestorableAutoSnapshot;

@end

/**
 
 */
@interface AWSLightsailCreateDiskFromSnapshotResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailCreateDiskRequest : AWSRequest


/**
 <p>An array of objects that represent the add-ons to enable for the new disk.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailAddOnRequest *> * _Nullable addOns;

/**
 <p>The Availability Zone where you want to create the disk (e.g., <code>us-east-2a</code>). Use the same Availability Zone as the Lightsail instance to which you want to attach the disk.</p><p>Use the <code>get regions</code> operation to list the Availability Zones where Lightsail is currently available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The unique Lightsail disk name (e.g., <code>my-disk</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskName;

/**
 <p>The size of the disk in GB (e.g., <code>32</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInGb;

/**
 <p>The tag keys and optional values to add to the resource during create.</p><p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLightsailCreateDiskResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailCreateDiskSnapshotRequest : AWSRequest


/**
 <p>The unique name of the source disk (e.g., <code>Disk-Virginia-1</code>).</p><note><p>This parameter cannot be defined together with the <code>instance name</code> parameter. The <code>disk name</code> and <code>instance name</code> parameters are mutually exclusive.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable diskName;

/**
 <p>The name of the destination disk snapshot (e.g., <code>my-disk-snapshot</code>) based on the source disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskSnapshotName;

/**
 <p>The unique name of the source instance (e.g., <code>Amazon_Linux-512MB-Virginia-1</code>). When this is defined, a snapshot of the instance's system volume is created.</p><note><p>This parameter cannot be defined together with the <code>disk name</code> parameter. The <code>instance name</code> and <code>disk name</code> parameters are mutually exclusive.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

/**
 <p>The tag keys and optional values to add to the resource during create.</p><p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLightsailCreateDiskSnapshotResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailCreateDomainEntryRequest : AWSRequest


/**
 <p>An array of key-value pairs containing information about the domain entry request.</p>
 */
@property (nonatomic, strong) AWSLightsailDomainEntry * _Nullable domainEntry;

/**
 <p>The domain name (e.g., <code>example.com</code>) for which you want to create the domain entry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSLightsailCreateDomainEntryResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) AWSLightsailOperation * _Nullable operation;

@end

/**
 
 */
@interface AWSLightsailCreateDomainRequest : AWSRequest


/**
 <p>The domain name to manage (e.g., <code>example.com</code>).</p><note><p>You cannot register a new domain name using Lightsail. You must register a domain name using Amazon Route 53 or another domain name registrar. If you have already registered your domain, you can enter its name in this parameter to manage the DNS records for that domain.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The tag keys and optional values to add to the resource during create.</p><p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLightsailCreateDomainResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) AWSLightsailOperation * _Nullable operation;

@end

/**
 
 */
@interface AWSLightsailCreateInstanceSnapshotRequest : AWSRequest


/**
 <p>The Lightsail instance on which to base your snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

/**
 <p>The name for your new snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceSnapshotName;

/**
 <p>The tag keys and optional values to add to the resource during create.</p><p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLightsailCreateInstanceSnapshotResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailCreateInstancesFromSnapshotRequest : AWSRequest


/**
 <p>An array of objects representing the add-ons to enable for the new instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailAddOnRequest *> * _Nullable addOns;

/**
 <p>An object containing information about one or more disk mappings.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<AWSLightsailDiskMap *> *> * _Nullable attachedDiskMapping;

/**
 <p>The Availability Zone where you want to create your instances. Use the following formatting: <code>us-east-2a</code> (case sensitive). You can get a list of Availability Zones by using the <a href="http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html">get regions</a> operation. Be sure to add the <code>include Availability Zones</code> parameter to your request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The bundle of specification information for your virtual private server (or <i>instance</i>), including the pricing plan (e.g., <code>micro_1_0</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 <p>The names for your new instances.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceNames;

/**
 <p>The name of the instance snapshot on which you are basing your new instances. Use the get instance snapshots operation to return information about your existing snapshots.</p><p>Constraint:</p><ul><li><p>This parameter cannot be defined together with the <code>source instance name</code> parameter. The <code>instance snapshot name</code> and <code>source instance name</code> parameters are mutually exclusive.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable instanceSnapshotName;

/**
 <p>The name for your key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPairName;

/**
 <p>The date of the automatic snapshot to use for the new instance. Use the <code>get auto snapshots</code> operation to identify the dates of the available automatic snapshots.</p><p>Constraints:</p><ul><li><p>Must be specified in <code>YYYY-MM-DD</code> format.</p></li><li><p>This parameter cannot be defined together with the <code>use latest restorable auto snapshot</code> parameter. The <code>restore date</code> and <code>use latest restorable auto snapshot</code> parameters are mutually exclusive.</p></li><li><p>Define this parameter only when creating a new instance from an automatic snapshot. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable restoreDate;

/**
 <p>The name of the source instance from which the source automatic snapshot was created.</p><p>Constraints:</p><ul><li><p>This parameter cannot be defined together with the <code>instance snapshot name</code> parameter. The <code>source instance name</code> and <code>instance snapshot name</code> parameters are mutually exclusive.</p></li><li><p>Define this parameter only when creating a new instance from an automatic snapshot. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceInstanceName;

/**
 <p>The tag keys and optional values to add to the resource during create.</p><p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

/**
 <p>A Boolean value to indicate whether to use the latest available automatic snapshot.</p><p>Constraints:</p><ul><li><p>This parameter cannot be defined together with the <code>restore date</code> parameter. The <code>use latest restorable auto snapshot</code> and <code>restore date</code> parameters are mutually exclusive.</p></li><li><p>Define this parameter only when creating a new instance from an automatic snapshot. For more information, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail Dev Guide</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable useLatestRestorableAutoSnapshot;

/**
 <p>You can create a launch script that configures a server with additional user data. For example, <code>apt-get -y update</code>.</p><note><p>Depending on the machine image you choose, the command to get software on your instance varies. Amazon Linux and CentOS use <code>yum</code>, Debian and Ubuntu use <code>apt-get</code>, and FreeBSD uses <code>pkg</code>. For a complete list, see the <a href="https://lightsail.aws.amazon.com/ls/docs/getting-started/article/compare-options-choose-lightsail-instance-image">Dev Guide</a>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable userData;

@end

/**
 
 */
@interface AWSLightsailCreateInstancesFromSnapshotResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailCreateInstancesRequest : AWSRequest


/**
 <p>An array of objects representing the add-ons to enable for the new instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailAddOnRequest *> * _Nullable addOns;

/**
 <p>The Availability Zone in which to create your instance. Use the following format: <code>us-east-2a</code> (case sensitive). You can get a list of Availability Zones by using the <a href="http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html">get regions</a> operation. Be sure to add the <code>include Availability Zones</code> parameter to your request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The ID for a virtual private server image (e.g., <code>app_wordpress_4_4</code> or <code>app_lamp_7_0</code>). Use the <code>get blueprints</code> operation to return a list of available images (or <i>blueprints</i>).</p><note><p>Use active blueprints when creating new instances. Inactive blueprints are listed to support customers with existing instances and are not necessarily available to create new instances. Blueprints are marked inactive when they become outdated due to operating system updates or new application releases.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable blueprintId;

/**
 <p>The bundle of specification information for your virtual private server (or <i>instance</i>), including the pricing plan (e.g., <code>micro_1_0</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 <p>(Deprecated) The name for your custom image.</p><note><p>In releases prior to June 12, 2017, this parameter was ignored by the API. It is now deprecated.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable customImageName;

/**
 <p>The names to use for your new Lightsail instances. Separate multiple values using quotation marks and commas, for example: <code>["MyFirstInstance","MySecondInstance"]</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceNames;

/**
 <p>The name of your key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPairName;

/**
 <p>The tag keys and optional values to add to the resource during create.</p><p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

/**
 <p>A launch script you can create that configures a server with additional user data. For example, you might want to run <code>apt-get -y update</code>.</p><note><p>Depending on the machine image you choose, the command to get software on your instance varies. Amazon Linux and CentOS use <code>yum</code>, Debian and Ubuntu use <code>apt-get</code>, and FreeBSD uses <code>pkg</code>. For a complete list, see the <a href="https://lightsail.aws.amazon.com/ls/docs/getting-started/article/compare-options-choose-lightsail-instance-image">Dev Guide</a>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable userData;

@end

/**
 
 */
@interface AWSLightsailCreateInstancesResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailCreateKeyPairRequest : AWSRequest


/**
 <p>The name for your new key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPairName;

/**
 <p>The tag keys and optional values to add to the resource during create.</p><p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLightsailCreateKeyPairResult : AWSModel


/**
 <p>An array of key-value pairs containing information about the new key pair you just created.</p>
 */
@property (nonatomic, strong) AWSLightsailKeyPair * _Nullable keyPair;

/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) AWSLightsailOperation * _Nullable operation;

/**
 <p>A base64-encoded RSA private key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateKeyBase64;

/**
 <p>A base64-encoded public key of the <code>ssh-rsa</code> type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicKeyBase64;

@end

/**
 
 */
@interface AWSLightsailCreateLoadBalancerRequest : AWSRequest


/**
 <p>The optional alternative domains and subdomains to use with your SSL/TLS certificate (e.g., <code>www.example.com</code>, <code>example.com</code>, <code>m.example.com</code>, <code>blog.example.com</code>).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable certificateAlternativeNames;

/**
 <p>The domain name with which your certificate is associated (e.g., <code>example.com</code>).</p><p>If you specify <code>certificateDomainName</code>, then <code>certificateName</code> is required (and vice-versa).</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateDomainName;

/**
 <p>The name of the SSL/TLS certificate.</p><p>If you specify <code>certificateName</code>, then <code>certificateDomainName</code> is required (and vice-versa).</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateName;

/**
 <p>The path you provided to perform the load balancer health check. If you didn't specify a health check path, Lightsail uses the root path of your website (e.g., <code>"/"</code>).</p><p>You may want to specify a custom health check path other than the root of your application if your home page loads slowly or has a lot of media or scripting on it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckPath;

/**
 <p>The instance port where you're creating your load balancer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancePort;

/**
 <p>The name of your load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The tag keys and optional values to add to the resource during create.</p><p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLightsailCreateLoadBalancerResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailCreateLoadBalancerTlsCertificateRequest : AWSRequest


/**
 <p>An array of strings listing alternative domains and subdomains for your SSL/TLS certificate. Lightsail will de-dupe the names for you. You can have a maximum of 9 alternative names (in addition to the 1 primary domain). We do not support wildcards (e.g., <code>*.example.com</code>).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable certificateAlternativeNames;

/**
 <p>The domain name (e.g., <code>example.com</code>) for your SSL/TLS certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateDomainName;

/**
 <p>The SSL/TLS certificate name.</p><p>You can have up to 10 certificates in your account at one time. Each Lightsail load balancer can have up to 2 certificates associated with it at one time. There is also an overall limit to the number of certificates that can be issue in a 365-day period. For more information, see <a href="http://docs.aws.amazon.com/acm/latest/userguide/acm-limits.html">Limits</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateName;

/**
 <p>The load balancer name where you want to create the SSL/TLS certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The tag keys and optional values to add to the resource during create.</p><p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLightsailCreateLoadBalancerTlsCertificateResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailCreateRelationalDatabaseFromSnapshotRequest : AWSRequest


/**
 <p>The Availability Zone in which to create your new database. Use the <code>us-east-2a</code> case-sensitive format.</p><p>You can get a list of Availability Zones by using the <code>get regions</code> operation. Be sure to add the <code>include relational database Availability Zones</code> parameter to your request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>Specifies the accessibility options for your new database. A value of <code>true</code> specifies a database that is available to resources outside of your Lightsail account. A value of <code>false</code> specifies a database that is available only to your Lightsail resources in the same region as your database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>The bundle ID for your new database. A bundle describes the performance specifications for your database.</p><p>You can get a list of database bundle IDs by using the <code>get relational database bundles</code> operation.</p><p>When creating a new database from a snapshot, you cannot choose a bundle that is smaller than the bundle of the source database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseBundleId;

/**
 <p>The name to use for your new database.</p><p>Constraints:</p><ul><li><p>Must contain from 2 to 255 alphanumeric characters, or hyphens.</p></li><li><p>The first and last character must be a letter or number.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

/**
 <p>The name of the database snapshot from which to create your new database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseSnapshotName;

/**
 <p>The date and time to restore your database from.</p><p>Constraints:</p><ul><li><p>Must be before the latest restorable time for the database.</p></li><li><p>Cannot be specified if the <code>use latest restorable time</code> parameter is <code>true</code>.</p></li><li><p>Specified in Coordinated Universal Time (UTC).</p></li><li><p>Specified in the Unix time format.</p><p>For example, if you wish to use a restore time of October 1, 2018, at 8 PM UTC, then you input <code>1538424000</code> as the restore time.</p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable restoreTime;

/**
 <p>The name of the source database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceRelationalDatabaseName;

/**
 <p>The tag keys and optional values to add to the resource during create.</p><p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

/**
 <p>Specifies whether your database is restored from the latest backup time. A value of <code>true</code> restores from the latest backup time. </p><p>Default: <code>false</code></p><p>Constraints: Cannot be specified if the <code>restore time</code> parameter is provided.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useLatestRestorableTime;

@end

/**
 
 */
@interface AWSLightsailCreateRelationalDatabaseFromSnapshotResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailCreateRelationalDatabaseRequest : AWSRequest


/**
 <p>The Availability Zone in which to create your new database. Use the <code>us-east-2a</code> case-sensitive format.</p><p>You can get a list of Availability Zones by using the <code>get regions</code> operation. Be sure to add the <code>include relational database Availability Zones</code> parameter to your request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The name of the master database created when the Lightsail database resource is created.</p><p>Constraints:</p><ul><li><p>Must contain from 1 to 64 alphanumeric characters.</p></li><li><p>Cannot be a word reserved by the specified database engine</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable masterDatabaseName;

/**
 <p>The password for the master user of your new database. The password can include any printable ASCII character except "/", """, or "@".</p><p>Constraints: Must contain 8 to 41 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

/**
 <p>The master user name for your new database.</p><p>Constraints:</p><ul><li><p>Master user name is required.</p></li><li><p>Must contain from 1 to 16 alphanumeric characters.</p></li><li><p>The first character must be a letter.</p></li><li><p>Cannot be a reserved word for the database engine you choose.</p><p>For more information about reserved words in MySQL 5.6 or 5.7, see the Keywords and Reserved Words articles for <a href="https://dev.mysql.com/doc/refman/5.6/en/keywords.html">MySQL 5.6</a> or <a href="https://dev.mysql.com/doc/refman/5.7/en/keywords.html">MySQL 5.7</a> respectively.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>The daily time range during which automated backups are created for your new database if automated backups are enabled.</p><p>The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region. For more information about the preferred backup window time blocks for each region, see the <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow">Working With Backups</a> guide in the Amazon Relational Database Service (Amazon RDS) documentation.</p><p>Constraints:</p><ul><li><p>Must be in the <code>hh24:mi-hh24:mi</code> format.</p><p>Example: <code>16:00-16:30</code></p></li><li><p>Specified in Coordinated Universal Time (UTC).</p></li><li><p>Must not conflict with the preferred maintenance window.</p></li><li><p>Must be at least 30 minutes.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p>The weekly time range during which system maintenance can occur on your new database.</p><p>The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week.</p><p>Constraints:</p><ul><li><p>Must be in the <code>ddd:hh24:mi-ddd:hh24:mi</code> format.</p></li><li><p>Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.</p></li><li><p>Must be at least 30 minutes.</p></li><li><p>Specified in Coordinated Universal Time (UTC).</p></li><li><p>Example: <code>Tue:17:00-Tue:17:30</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>Specifies the accessibility options for your new database. A value of <code>true</code> specifies a database that is available to resources outside of your Lightsail account. A value of <code>false</code> specifies a database that is available only to your Lightsail resources in the same region as your database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>The blueprint ID for your new database. A blueprint describes the major engine version of a database.</p><p>You can get a list of database blueprints IDs by using the <code>get relational database blueprints</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseBlueprintId;

/**
 <p>The bundle ID for your new database. A bundle describes the performance specifications for your database.</p><p>You can get a list of database bundle IDs by using the <code>get relational database bundles</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseBundleId;

/**
 <p>The name to use for your new database.</p><p>Constraints:</p><ul><li><p>Must contain from 2 to 255 alphanumeric characters, or hyphens.</p></li><li><p>The first and last character must be a letter or number.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

/**
 <p>The tag keys and optional values to add to the resource during create.</p><p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLightsailCreateRelationalDatabaseResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailCreateRelationalDatabaseSnapshotRequest : AWSRequest


/**
 <p>The name of the database on which to base your new snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

/**
 <p>The name for your new database snapshot.</p><p>Constraints:</p><ul><li><p>Must contain from 2 to 255 alphanumeric characters, or hyphens.</p></li><li><p>The first and last character must be a letter or number.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseSnapshotName;

/**
 <p>The tag keys and optional values to add to the resource during create.</p><p>To tag a resource after it has been created, see the <code>tag resource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLightsailCreateRelationalDatabaseSnapshotResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDeleteAlarmRequest : AWSRequest


/**
 <p>The name of the alarm to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

@end

/**
 
 */
@interface AWSLightsailDeleteAlarmResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDeleteAutoSnapshotRequest : AWSRequest


/**
 <p>The date of the automatic snapshot to delete in <code>YYYY-MM-DD</code> format. Use the <code>get auto snapshots</code> operation to get the available automatic snapshots for a resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable date;

/**
 <p>The name of the source instance or disk from which to delete the automatic snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

@end

/**
 
 */
@interface AWSLightsailDeleteAutoSnapshotResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDeleteContactMethodRequest : AWSRequest


/**
 <p>The protocol that will be deleted, such as <code>Email</code> or <code>SMS</code> (text messaging).</p><note><p>To delete an <code>Email</code> and an <code>SMS</code> contact method if you added both, you must run separate <code>DeleteContactMethod</code> actions to delete each protocol.</p></note>
 */
@property (nonatomic, assign) AWSLightsailContactProtocol protocols;

@end

/**
 
 */
@interface AWSLightsailDeleteContactMethodResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDeleteDiskRequest : AWSRequest


/**
 <p>The unique name of the disk you want to delete (e.g., <code>my-disk</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskName;

/**
 <p>A Boolean value to indicate whether to delete the enabled add-ons for the disk.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceDeleteAddOns;

@end

/**
 
 */
@interface AWSLightsailDeleteDiskResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDeleteDiskSnapshotRequest : AWSRequest


/**
 <p>The name of the disk snapshot you want to delete (e.g., <code>my-disk-snapshot</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskSnapshotName;

@end

/**
 
 */
@interface AWSLightsailDeleteDiskSnapshotResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDeleteDomainEntryRequest : AWSRequest


/**
 <p>An array of key-value pairs containing information about your domain entries.</p>
 */
@property (nonatomic, strong) AWSLightsailDomainEntry * _Nullable domainEntry;

/**
 <p>The name of the domain entry to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSLightsailDeleteDomainEntryResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) AWSLightsailOperation * _Nullable operation;

@end

/**
 
 */
@interface AWSLightsailDeleteDomainRequest : AWSRequest


/**
 <p>The specific domain name to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSLightsailDeleteDomainResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) AWSLightsailOperation * _Nullable operation;

@end

/**
 
 */
@interface AWSLightsailDeleteInstanceRequest : AWSRequest


/**
 <p>A Boolean value to indicate whether to delete the enabled add-ons for the disk.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceDeleteAddOns;

/**
 <p>The name of the instance to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

@end

/**
 
 */
@interface AWSLightsailDeleteInstanceResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDeleteInstanceSnapshotRequest : AWSRequest


/**
 <p>The name of the snapshot to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceSnapshotName;

@end

/**
 
 */
@interface AWSLightsailDeleteInstanceSnapshotResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDeleteKeyPairRequest : AWSRequest


/**
 <p>The name of the key pair to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPairName;

@end

/**
 
 */
@interface AWSLightsailDeleteKeyPairResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) AWSLightsailOperation * _Nullable operation;

@end

/**
 
 */
@interface AWSLightsailDeleteKnownHostKeysRequest : AWSRequest


/**
 <p>The name of the instance for which you want to reset the host key or certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

@end

/**
 
 */
@interface AWSLightsailDeleteKnownHostKeysResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDeleteLoadBalancerRequest : AWSRequest


/**
 <p>The name of the load balancer you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSLightsailDeleteLoadBalancerResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDeleteLoadBalancerTlsCertificateRequest : AWSRequest


/**
 <p>The SSL/TLS certificate name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateName;

/**
 <p>When <code>true</code>, forces the deletion of an SSL/TLS certificate.</p><p>There can be two certificates associated with a Lightsail load balancer: the primary and the backup. The <code>force</code> parameter is required when the primary SSL/TLS certificate is in use by an instance attached to the load balancer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The load balancer name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSLightsailDeleteLoadBalancerTlsCertificateResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDeleteRelationalDatabaseRequest : AWSRequest


/**
 <p>The name of the database snapshot created if <code>skip final snapshot</code> is <code>false</code>, which is the default value for that parameter.</p><note><p>Specifying this parameter and also specifying the <code>skip final snapshot</code> parameter to <code>true</code> results in an error.</p></note><p>Constraints:</p><ul><li><p>Must contain from 2 to 255 alphanumeric characters, or hyphens.</p></li><li><p>The first and last character must be a letter or number.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable finalRelationalDatabaseSnapshotName;

/**
 <p>The name of the database that you are deleting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

/**
 <p>Determines whether a final database snapshot is created before your database is deleted. If <code>true</code> is specified, no database snapshot is created. If <code>false</code> is specified, a database snapshot is created before your database is deleted.</p><p>You must specify the <code>final relational database snapshot name</code> parameter if the <code>skip final snapshot</code> parameter is <code>false</code>.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable skipFinalSnapshot;

@end

/**
 
 */
@interface AWSLightsailDeleteRelationalDatabaseResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDeleteRelationalDatabaseSnapshotRequest : AWSRequest


/**
 <p>The name of the database snapshot that you are deleting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseSnapshotName;

@end

/**
 
 */
@interface AWSLightsailDeleteRelationalDatabaseSnapshotResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 <p>Describes the destination of a record.</p>
 */
@interface AWSLightsailDestinationInfo : AWSModel


/**
 <p>The ID of the resource created at the destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The destination service of the record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable service;

@end

/**
 
 */
@interface AWSLightsailDetachDiskRequest : AWSRequest


/**
 <p>The unique name of the disk you want to detach from your instance (e.g., <code>my-disk</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskName;

@end

/**
 
 */
@interface AWSLightsailDetachDiskResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDetachInstancesFromLoadBalancerRequest : AWSRequest


/**
 <p>An array of strings containing the names of the instances you want to detach from the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceNames;

/**
 <p>The name of the Lightsail load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSLightsailDetachInstancesFromLoadBalancerResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDetachStaticIpRequest : AWSRequest


/**
 <p>The name of the static IP to detach from the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable staticIpName;

@end

/**
 
 */
@interface AWSLightsailDetachStaticIpResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailDisableAddOnRequest : AWSRequest


/**
 <p>The add-on type to disable.</p>
 */
@property (nonatomic, assign) AWSLightsailAddOnType addOnType;

/**
 <p>The name of the source resource for which to disable the add-on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

@end

/**
 
 */
@interface AWSLightsailDisableAddOnResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 <p>Describes a system disk or a block storage disk.</p>
 */
@interface AWSLightsailDisk : AWSModel


/**
 <p>An array of objects representing the add-ons enabled on the disk.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailAddOn *> * _Nullable addOns;

/**
 <p>The Amazon Resource Name (ARN) of the disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The resources to which the disk is attached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachedTo;

/**
 <p>(Deprecated) The attachment state of the disk.</p><note><p>In releases prior to November 14, 2017, this parameter returned <code>attached</code> for system disks in the API response. It is now deprecated, but still included in the response. Use <code>isAttached</code> instead.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentState;

/**
 <p>The date when the disk was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>(Deprecated) The number of GB in use by the disk.</p><note><p>In releases prior to November 14, 2017, this parameter was not included in the API response. It is now deprecated.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable gbInUse;

/**
 <p>The input/output operations per second (IOPS) of the disk.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>A Boolean value indicating whether the disk is attached.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isAttached;

/**
 <p>A Boolean value indicating whether this disk is a system disk (has an operating system loaded on it).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isSystemDisk;

/**
 <p>The AWS Region and Availability Zone where the disk is located.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The unique name of the disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The disk path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The Lightsail resource type (e.g., <code>Disk</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>The size of the disk in GB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInGb;

/**
 <p>Describes the status of the disk.</p>
 */
@property (nonatomic, assign) AWSLightsailDiskState state;

/**
 <p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportCode;

/**
 <p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail Dev Guide</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 <p>Describes a disk.</p>
 */
@interface AWSLightsailDiskInfo : AWSModel


/**
 <p>A Boolean value indicating whether this disk is a system disk (has an operating system loaded on it).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isSystemDisk;

/**
 <p>The disk name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The disk path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The size of the disk in GB (e.g., <code>32</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInGb;

@end

/**
 <p>Describes a block storage disk mapping.</p>
 */
@interface AWSLightsailDiskMap : AWSModel


/**
 <p>The new disk name (e.g., <code>my-new-disk</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestDiskName;

/**
 <p>The original disk path exposed to the instance (for example, <code>/dev/sdh</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable originalDiskPath;

@end

/**
 <p>Describes a block storage disk snapshot.</p>
 */
@interface AWSLightsailDiskSnapshot : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the disk snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date when the disk snapshot was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The Amazon Resource Name (ARN) of the source disk from which the disk snapshot was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromDiskArn;

/**
 <p>The unique name of the source disk from which the disk snapshot was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromDiskName;

/**
 <p>The Amazon Resource Name (ARN) of the source instance from which the disk (system volume) snapshot was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromInstanceArn;

/**
 <p>The unique name of the source instance from which the disk (system volume) snapshot was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromInstanceName;

/**
 <p>A Boolean value indicating whether the snapshot was created from an automatic snapshot.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isFromAutoSnapshot;

/**
 <p>The AWS Region and Availability Zone where the disk snapshot was created.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The name of the disk snapshot (e.g., <code>my-disk-snapshot</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The progress of the disk snapshot operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable progress;

/**
 <p>The Lightsail resource type (e.g., <code>DiskSnapshot</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>The size of the disk in GB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInGb;

/**
 <p>The status of the disk snapshot operation.</p>
 */
@property (nonatomic, assign) AWSLightsailDiskSnapshotState state;

/**
 <p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportCode;

/**
 <p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail Dev Guide</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 <p>Describes a disk snapshot.</p>
 */
@interface AWSLightsailDiskSnapshotInfo : AWSModel


/**
 <p>The size of the disk in GB (e.g., <code>32</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInGb;

@end

/**
 <p>Describes a domain where you are storing recordsets in Lightsail.</p>
 */
@interface AWSLightsailDomain : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the domain recordset (e.g., <code>arn:aws:lightsail:global:123456789101:Domain/824cede0-abc7-4f84-8dbc-12345EXAMPLE</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date when the domain recordset was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>An array of key-value pairs containing information about the domain entries.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailDomainEntry *> * _Nullable domainEntries;

/**
 <p>The AWS Region and Availability Zones where the domain recordset was created.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The name of the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The resource type. </p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportCode;

/**
 <p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail Dev Guide</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 <p>Describes a domain recordset entry.</p>
 */
@interface AWSLightsailDomainEntry : AWSModel


/**
 <p>The ID of the domain recordset entry.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>When <code>true</code>, specifies whether the domain entry is an alias used by the Lightsail load balancer. You can include an alias (A type) record in your request, which points to a load balancer DNS name and routes traffic to your load balancer</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isAlias;

/**
 <p>The name of the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>(Deprecated) The options for the domain entry.</p><note><p>In releases prior to November 29, 2017, this parameter was not included in the API response. It is now deprecated.</p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable options;

/**
 <p>The target AWS name server (e.g., <code>ns-111.awsdns-22.com.</code>).</p><p>For Lightsail load balancers, the value looks like <code>ab1234c56789c6b86aba6fb203d443bc-123456789.us-east-2.elb.amazonaws.com</code>. Be sure to also set <code>isAlias</code> to <code>true</code> when setting up an A record for a load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable target;

/**
 <p>The type of domain entry, such as address (A), canonical name (CNAME), mail exchanger (MX), name server (NS), start of authority (SOA), service locator (SRV), or text (TXT).</p><p>The following domain entry types can be used:</p><ul><li><p><code>A</code></p></li><li><p><code>CNAME</code></p></li><li><p><code>MX</code></p></li><li><p><code>NS</code></p></li><li><p><code>SOA</code></p></li><li><p><code>SRV</code></p></li><li><p><code>TXT</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 
 */
@interface AWSLightsailDownloadDefaultKeyPairRequest : AWSRequest


@end

/**
 
 */
@interface AWSLightsailDownloadDefaultKeyPairResult : AWSModel


/**
 <p>A base64-encoded RSA private key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateKeyBase64;

/**
 <p>A base64-encoded public key of the <code>ssh-rsa</code> type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicKeyBase64;

@end

/**
 
 */
@interface AWSLightsailEnableAddOnRequest : AWSRequest


/**
 <p>An array of strings representing the add-on to enable or modify.</p>
 */
@property (nonatomic, strong) AWSLightsailAddOnRequest * _Nullable addOnRequest;

/**
 <p>The name of the source resource for which to enable or modify the add-on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

@end

/**
 
 */
@interface AWSLightsailEnableAddOnResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 <p>Describes an export snapshot record.</p>
 */
@interface AWSLightsailExportSnapshotRecord : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the export snapshot record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date when the export snapshot record was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>A list of objects describing the destination of the export snapshot record.</p>
 */
@property (nonatomic, strong) AWSLightsailDestinationInfo * _Nullable destinationInfo;

/**
 <p>The AWS Region and Availability Zone where the export snapshot record is located.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The export snapshot record name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Lightsail resource type (e.g., <code>ExportSnapshotRecord</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>A list of objects describing the source of the export snapshot record.</p>
 */
@property (nonatomic, strong) AWSLightsailExportSnapshotRecordSourceInfo * _Nullable sourceInfo;

/**
 <p>The state of the export snapshot record.</p>
 */
@property (nonatomic, assign) AWSLightsailRecordState state;

@end

/**
 <p>Describes the source of an export snapshot record.</p>
 */
@interface AWSLightsailExportSnapshotRecordSourceInfo : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the source instance or disk snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date when the source instance or disk snapshot was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>A list of objects describing a disk snapshot.</p>
 */
@property (nonatomic, strong) AWSLightsailDiskSnapshotInfo * _Nullable diskSnapshotInfo;

/**
 <p>The Amazon Resource Name (ARN) of the snapshot's source instance or disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromResourceArn;

/**
 <p>The name of the snapshot's source instance or disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromResourceName;

/**
 <p>A list of objects describing an instance snapshot.</p>
 */
@property (nonatomic, strong) AWSLightsailInstanceSnapshotInfo * _Nullable instanceSnapshotInfo;

/**
 <p>The name of the source instance or disk snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Lightsail resource type (e.g., <code>InstanceSnapshot</code> or <code>DiskSnapshot</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailExportSnapshotRecordSourceType resourceType;

@end

/**
 
 */
@interface AWSLightsailExportSnapshotRequest : AWSRequest


/**
 <p>The name of the instance or disk snapshot to be exported to Amazon EC2.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSnapshotName;

@end

/**
 
 */
@interface AWSLightsailExportSnapshotResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailGetActiveNamesRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetActiveNames</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetActiveNamesResult : AWSModel


/**
 <p>The list of active names returned by the get active names request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable activeNames;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetActiveNames</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetAlarmsRequest : AWSRequest


/**
 <p>The name of the alarm.</p><p>Specify an alarm name to return information about a specific alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p>The name of the Lightsail resource being monitored by the alarm.</p><p>Specify a monitored resource name to return information about all alarms for a specific resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoredResourceName;

/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetAlarms</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetAlarmsResult : AWSModel


/**
 <p>An array of objects that describe the alarms.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailAlarm *> * _Nullable alarms;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetAlarms</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetAutoSnapshotsRequest : AWSRequest


/**
 <p>The name of the source instance or disk from which to get automatic snapshot information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

@end

/**
 
 */
@interface AWSLightsailGetAutoSnapshotsResult : AWSModel


/**
 <p>An array of objects that describe the automatic snapshots that are available for the specified source instance or disk.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailAutoSnapshotDetails *> * _Nullable autoSnapshots;

/**
 <p>The name of the source instance or disk for the automatic snapshots.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

/**
 <p>The resource type (e.g., <code>Instance</code> or <code>Disk</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

@end

/**
 
 */
@interface AWSLightsailGetBlueprintsRequest : AWSRequest


/**
 <p>A Boolean value indicating whether to include inactive results in your request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeInactive;

/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetBlueprints</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetBlueprintsResult : AWSModel


/**
 <p>An array of key-value pairs that contains information about the available blueprints.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailBlueprint *> * _Nullable blueprints;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetBlueprints</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetBundlesRequest : AWSRequest


/**
 <p>A Boolean value that indicates whether to include inactive bundle results in your request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeInactive;

/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetBundles</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetBundlesResult : AWSModel


/**
 <p>An array of key-value pairs that contains information about the available bundles.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailBundle *> * _Nullable bundles;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetBundles</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetCloudFormationStackRecordsRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetClouFormationStackRecords</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetCloudFormationStackRecordsResult : AWSModel


/**
 <p>A list of objects describing the CloudFormation stack records.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailCloudFormationStackRecord *> * _Nullable cloudFormationStackRecords;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetCloudFormationStackRecords</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetContactMethodsRequest : AWSRequest


/**
 <p>The protocols used to send notifications, such as <code>Email</code>, or <code>SMS</code> (text messaging).</p><p>Specify a protocol in your request to return information about a specific contact method protocol.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable protocols;

@end

/**
 
 */
@interface AWSLightsailGetContactMethodsResult : AWSModel


/**
 <p>An array of objects that describe the contact methods.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailContactMethod *> * _Nullable contactMethods;

@end

/**
 
 */
@interface AWSLightsailGetDiskRequest : AWSRequest


/**
 <p>The name of the disk (e.g., <code>my-disk</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskName;

@end

/**
 
 */
@interface AWSLightsailGetDiskResult : AWSModel


/**
 <p>An object containing information about the disk.</p>
 */
@property (nonatomic, strong) AWSLightsailDisk * _Nullable disk;

@end

/**
 
 */
@interface AWSLightsailGetDiskSnapshotRequest : AWSRequest


/**
 <p>The name of the disk snapshot (e.g., <code>my-disk-snapshot</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable diskSnapshotName;

@end

/**
 
 */
@interface AWSLightsailGetDiskSnapshotResult : AWSModel


/**
 <p>An object containing information about the disk snapshot.</p>
 */
@property (nonatomic, strong) AWSLightsailDiskSnapshot * _Nullable diskSnapshot;

@end

/**
 
 */
@interface AWSLightsailGetDiskSnapshotsRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetDiskSnapshots</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetDiskSnapshotsResult : AWSModel


/**
 <p>An array of objects containing information about all block storage disk snapshots.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailDiskSnapshot *> * _Nullable diskSnapshots;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetDiskSnapshots</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetDisksRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetDisks</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetDisksResult : AWSModel


/**
 <p>An array of objects containing information about all block storage disks.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailDisk *> * _Nullable disks;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetDisks</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetDomainRequest : AWSRequest


/**
 <p>The domain name for which your want to return information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSLightsailGetDomainResult : AWSModel


/**
 <p>An array of key-value pairs containing information about your get domain request.</p>
 */
@property (nonatomic, strong) AWSLightsailDomain * _Nullable domain;

@end

/**
 
 */
@interface AWSLightsailGetDomainsRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetDomains</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetDomainsResult : AWSModel


/**
 <p>An array of key-value pairs containing information about each of the domain entries in the user's account.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailDomain *> * _Nullable domains;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetDomains</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetExportSnapshotRecordsRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetExportSnapshotRecords</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetExportSnapshotRecordsResult : AWSModel


/**
 <p>A list of objects describing the export snapshot records.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailExportSnapshotRecord *> * _Nullable exportSnapshotRecords;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetExportSnapshotRecords</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetInstanceAccessDetailsRequest : AWSRequest


/**
 <p>The name of the instance to access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

/**
 <p>The protocol to use to connect to your instance. Defaults to <code>ssh</code>.</p>
 */
@property (nonatomic, assign) AWSLightsailInstanceAccessProtocol protocols;

@end

/**
 
 */
@interface AWSLightsailGetInstanceAccessDetailsResult : AWSModel


/**
 <p>An array of key-value pairs containing information about a get instance access request.</p>
 */
@property (nonatomic, strong) AWSLightsailInstanceAccessDetails * _Nullable accessDetails;

@end

/**
 
 */
@interface AWSLightsailGetInstanceMetricDataRequest : AWSRequest


/**
 <p>The end time of the time period.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The name of the instance for which you want to get metrics data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

/**
 <p>The metric for which you want to return information.</p><p>Valid instance metric names are listed below, along with the most useful <code>statistics</code> to include in your request, and the published <code>unit</code> value.</p><ul><li><p><b><code>BurstCapacityPercentage</code></b> - The percentage of CPU performance available for your instance to burst above its baseline. Your instance continuously accrues and consumes burst capacity. Burst capacity stops accruing when your instance's <code>BurstCapacityPercentage</code> reaches 100%. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity">Viewing instance burst capacity in Amazon Lightsail</a>.</p><p><code>Statistics</code>: The most useful statistics are <code>Maximum</code> and <code>Average</code>.</p><p><code>Unit</code>: The published unit is <code>Percent</code>.</p></li><li><p><b><code>BurstCapacityTime</code></b> - The available amount of time for your instance to burst at 100% CPU utilization. Your instance continuously accrues and consumes burst capacity. Burst capacity time stops accruing when your instance's <code>BurstCapacityPercentage</code> metric reaches 100%.</p><p>Burst capacity time is consumed at the full rate only when your instance operates at 100% CPU utilization. For example, if your instance operates at 50% CPU utilization in the burstable zone for a 5-minute period, then it consumes CPU burst capacity minutes at a 50% rate in that period. Your instance consumed 2 minutes and 30 seconds of CPU burst capacity minutes in the 5-minute period. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity">Viewing instance burst capacity in Amazon Lightsail</a>.</p><p><code>Statistics</code>: The most useful statistics are <code>Maximum</code> and <code>Average</code>.</p><p><code>Unit</code>: The published unit is <code>Seconds</code>.</p></li><li><p><b><code>CPUUtilization</code></b> - The percentage of allocated compute units that are currently in use on the instance. This metric identifies the processing power to run the applications on the instance. Tools in your operating system can show a lower percentage than Lightsail when the instance is not allocated a full processor core.</p><p><code>Statistics</code>: The most useful statistics are <code>Maximum</code> and <code>Average</code>.</p><p><code>Unit</code>: The published unit is <code>Percent</code>.</p></li><li><p><b><code>NetworkIn</code></b> - The number of bytes received on all network interfaces by the instance. This metric identifies the volume of incoming network traffic to the instance. The number reported is the number of bytes received during the period. Because this metric is reported in 5-minute intervals, divide the reported number by 300 to find Bytes/second.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p><p><code>Unit</code>: The published unit is <code>Bytes</code>.</p></li><li><p><b><code>NetworkOut</code></b> - The number of bytes sent out on all network interfaces by the instance. This metric identifies the volume of outgoing network traffic from the instance. The number reported is the number of bytes sent during the period. Because this metric is reported in 5-minute intervals, divide the reported number by 300 to find Bytes/second.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p><p><code>Unit</code>: The published unit is <code>Bytes</code>.</p></li><li><p><b><code>StatusCheckFailed</code></b> - Reports whether the instance passed or failed both the instance status check and the system status check. This metric can be either 0 (passed) or 1 (failed). This metric data is available in 1-minute (60 seconds) granularity.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>StatusCheckFailed_Instance</code></b> - Reports whether the instance passed or failed the instance status check. This metric can be either 0 (passed) or 1 (failed). This metric data is available in 1-minute (60 seconds) granularity.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>StatusCheckFailed_System</code></b> - Reports whether the instance passed or failed the system status check. This metric can be either 0 (passed) or 1 (failed). This metric data is available in 1-minute (60 seconds) granularity.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li></ul>
 */
@property (nonatomic, assign) AWSLightsailInstanceMetricName metricName;

/**
 <p>The granularity, in seconds, of the returned data points.</p><p>The <code>StatusCheckFailed</code>, <code>StatusCheckFailed_Instance</code>, and <code>StatusCheckFailed_System</code> instance metric data is available in 1-minute (60 seconds) granularity. All other instance metric data is available in 5-minute (300 seconds) granularity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The start time of the time period.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The statistic for the metric.</p><p>The following statistics are available:</p><ul><li><p><code>Minimum</code> - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.</p></li><li><p><code>Maximum</code> - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.</p></li><li><p><code>Sum</code> - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.</p></li><li><p><code>Average</code> - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.</p></li><li><p><code>SampleCount</code> - The count, or number, of data points used for the statistical calculation.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable statistics;

/**
 <p>The unit for the metric data request. Valid units depend on the metric data being requested. For the valid units to specify with each available metric, see the <code>metricName</code> parameter.</p>
 */
@property (nonatomic, assign) AWSLightsailMetricUnit unit;

@end

/**
 
 */
@interface AWSLightsailGetInstanceMetricDataResult : AWSModel


/**
 <p>An array of objects that describe the metric data returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailMetricDatapoint *> * _Nullable metricData;

/**
 <p>The name of the metric returned.</p>
 */
@property (nonatomic, assign) AWSLightsailInstanceMetricName metricName;

@end

/**
 
 */
@interface AWSLightsailGetInstancePortStatesRequest : AWSRequest


/**
 <p>The name of the instance for which to return firewall port states.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

@end

/**
 
 */
@interface AWSLightsailGetInstancePortStatesResult : AWSModel


/**
 <p>An array of objects that describe the firewall port states for the specified instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailInstancePortState *> * _Nullable portStates;

@end

/**
 
 */
@interface AWSLightsailGetInstanceRequest : AWSRequest


/**
 <p>The name of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

@end

/**
 
 */
@interface AWSLightsailGetInstanceResult : AWSModel


/**
 <p>An array of key-value pairs containing information about the specified instance.</p>
 */
@property (nonatomic, strong) AWSLightsailInstance * _Nullable instance;

@end

/**
 
 */
@interface AWSLightsailGetInstanceSnapshotRequest : AWSRequest


/**
 <p>The name of the snapshot for which you are requesting information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceSnapshotName;

@end

/**
 
 */
@interface AWSLightsailGetInstanceSnapshotResult : AWSModel


/**
 <p>An array of key-value pairs containing information about the results of your get instance snapshot request.</p>
 */
@property (nonatomic, strong) AWSLightsailInstanceSnapshot * _Nullable instanceSnapshot;

@end

/**
 
 */
@interface AWSLightsailGetInstanceSnapshotsRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetInstanceSnapshots</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetInstanceSnapshotsResult : AWSModel


/**
 <p>An array of key-value pairs containing information about the results of your get instance snapshots request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailInstanceSnapshot *> * _Nullable instanceSnapshots;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetInstanceSnapshots</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetInstanceStateRequest : AWSRequest


/**
 <p>The name of the instance to get state information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

@end

/**
 
 */
@interface AWSLightsailGetInstanceStateResult : AWSModel


/**
 <p>The state of the instance.</p>
 */
@property (nonatomic, strong) AWSLightsailInstanceState * _Nullable state;

@end

/**
 
 */
@interface AWSLightsailGetInstancesRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetInstances</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetInstancesResult : AWSModel


/**
 <p>An array of key-value pairs containing information about your instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailInstance *> * _Nullable instances;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetInstances</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetKeyPairRequest : AWSRequest


/**
 <p>The name of the key pair for which you are requesting information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPairName;

@end

/**
 
 */
@interface AWSLightsailGetKeyPairResult : AWSModel


/**
 <p>An array of key-value pairs containing information about the key pair.</p>
 */
@property (nonatomic, strong) AWSLightsailKeyPair * _Nullable keyPair;

@end

/**
 
 */
@interface AWSLightsailGetKeyPairsRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetKeyPairs</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetKeyPairsResult : AWSModel


/**
 <p>An array of key-value pairs containing information about the key pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailKeyPair *> * _Nullable keyPairs;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetKeyPairs</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetLoadBalancerMetricDataRequest : AWSRequest


/**
 <p>The end time of the period.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The metric for which you want to return information.</p><p>Valid load balancer metric names are listed below, along with the most useful <code>statistics</code> to include in your request, and the published <code>unit</code> value.</p><ul><li><p><b><code>ClientTLSNegotiationErrorCount</code></b> - The number of TLS connections initiated by the client that did not establish a session with the load balancer due to a TLS error generated by the load balancer. Possible causes include a mismatch of ciphers or protocols.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>HealthyHostCount</code></b> - The number of target instances that are considered healthy.</p><p><code>Statistics</code>: The most useful statistic are <code>Average</code>, <code>Minimum</code>, and <code>Maximum</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>HTTPCode_Instance_2XX_Count</code></b> - The number of HTTP 2XX response codes generated by the target instances. This does not include any response codes generated by the load balancer.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>HTTPCode_Instance_3XX_Count</code></b> - The number of HTTP 3XX response codes generated by the target instances. This does not include any response codes generated by the load balancer.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>HTTPCode_Instance_4XX_Count</code></b> - The number of HTTP 4XX response codes generated by the target instances. This does not include any response codes generated by the load balancer.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>HTTPCode_Instance_5XX_Count</code></b> - The number of HTTP 5XX response codes generated by the target instances. This does not include any response codes generated by the load balancer.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>HTTPCode_LB_4XX_Count</code></b> - The number of HTTP 4XX client error codes that originated from the load balancer. Client errors are generated when requests are malformed or incomplete. These requests were not received by the target instance. This count does not include response codes generated by the target instances.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>HTTPCode_LB_5XX_Count</code></b> - The number of HTTP 5XX server error codes that originated from the load balancer. This does not include any response codes generated by the target instance. This metric is reported if there are no healthy instances attached to the load balancer, or if the request rate exceeds the capacity of the instances (spillover) or the load balancer.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>InstanceResponseTime</code></b> - The time elapsed, in seconds, after the request leaves the load balancer until a response from the target instance is received.</p><p><code>Statistics</code>: The most useful statistic is <code>Average</code>.</p><p><code>Unit</code>: The published unit is <code>Seconds</code>.</p></li><li><p><b><code>RejectedConnectionCount</code></b> - The number of connections that were rejected because the load balancer had reached its maximum number of connections.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>RequestCount</code></b> - The number of requests processed over IPv4. This count includes only the requests with a response generated by a target instance of the load balancer.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>. Note that <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code> all return <code>1</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>UnhealthyHostCount</code></b> - The number of target instances that are considered unhealthy.</p><p><code>Statistics</code>: The most useful statistic are <code>Average</code>, <code>Minimum</code>, and <code>Maximum</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li></ul>
 */
@property (nonatomic, assign) AWSLightsailLoadBalancerMetricName metricName;

/**
 <p>The granularity, in seconds, of the returned data points.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The start time of the period.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The statistic for the metric.</p><p>The following statistics are available:</p><ul><li><p><code>Minimum</code> - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.</p></li><li><p><code>Maximum</code> - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.</p></li><li><p><code>Sum</code> - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.</p></li><li><p><code>Average</code> - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.</p></li><li><p><code>SampleCount</code> - The count, or number, of data points used for the statistical calculation.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable statistics;

/**
 <p>The unit for the metric data request. Valid units depend on the metric data being requested. For the valid units with each available metric, see the <code>metricName</code> parameter.</p>
 */
@property (nonatomic, assign) AWSLightsailMetricUnit unit;

@end

/**
 
 */
@interface AWSLightsailGetLoadBalancerMetricDataResult : AWSModel


/**
 <p>An array of objects that describe the metric data returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailMetricDatapoint *> * _Nullable metricData;

/**
 <p>The name of the metric returned.</p>
 */
@property (nonatomic, assign) AWSLightsailLoadBalancerMetricName metricName;

@end

/**
 
 */
@interface AWSLightsailGetLoadBalancerRequest : AWSRequest


/**
 <p>The name of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSLightsailGetLoadBalancerResult : AWSModel


/**
 <p>An object containing information about your load balancer.</p>
 */
@property (nonatomic, strong) AWSLightsailLoadBalancer * _Nullable loadBalancer;

@end

/**
 
 */
@interface AWSLightsailGetLoadBalancerTlsCertificatesRequest : AWSRequest


/**
 <p>The name of the load balancer you associated with your SSL/TLS certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSLightsailGetLoadBalancerTlsCertificatesResult : AWSModel


/**
 <p>An array of LoadBalancerTlsCertificate objects describing your SSL/TLS certificates.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailLoadBalancerTlsCertificate *> * _Nullable tlsCertificates;

@end

/**
 
 */
@interface AWSLightsailGetLoadBalancersRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetLoadBalancers</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetLoadBalancersResult : AWSModel


/**
 <p>An array of LoadBalancer objects describing your load balancers.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailLoadBalancer *> * _Nullable loadBalancers;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetLoadBalancers</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetOperationRequest : AWSRequest


/**
 <p>A GUID used to identify the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 
 */
@interface AWSLightsailGetOperationResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) AWSLightsailOperation * _Nullable operation;

@end

/**
 
 */
@interface AWSLightsailGetOperationsForResourceRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetOperationsForResource</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The name of the resource for which you are requesting information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

@end

/**
 
 */
@interface AWSLightsailGetOperationsForResourceResult : AWSModel


/**
 <p>(Deprecated) Returns the number of pages of results that remain.</p><note><p>In releases prior to June 12, 2017, this parameter returned <code>null</code> by the API. It is now deprecated, and the API returns the <code>next page token</code> parameter instead.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageCount;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetOperationsForResource</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailGetOperationsRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetOperations</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetOperationsResult : AWSModel


/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetOperations</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailGetRegionsRequest : AWSRequest


/**
 <p>A Boolean value indicating whether to also include Availability Zones in your get regions request. Availability Zones are indicated with a letter: e.g., <code>us-east-2a</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeAvailabilityZones;

/**
 <p>&gt;A Boolean value indicating whether to also include Availability Zones for databases in your get regions request. Availability Zones are indicated with a letter (e.g., <code>us-east-2a</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeRelationalDatabaseAvailabilityZones;

@end

/**
 
 */
@interface AWSLightsailGetRegionsResult : AWSModel


/**
 <p>An array of key-value pairs containing information about your get regions request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailRegion *> * _Nullable regions;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseBlueprintsRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetRelationalDatabaseBlueprints</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseBlueprintsResult : AWSModel


/**
 <p>An object describing the result of your get relational database blueprints request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailRelationalDatabaseBlueprint *> * _Nullable blueprints;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetRelationalDatabaseBlueprints</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseBundlesRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetRelationalDatabaseBundles</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseBundlesResult : AWSModel


/**
 <p>An object describing the result of your get relational database bundles request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailRelationalDatabaseBundle *> * _Nullable bundles;

/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetRelationalDatabaseBundles</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseEventsRequest : AWSRequest


/**
 <p>The number of minutes in the past from which to retrieve events. For example, to get all events from the past 2 hours, enter 120.</p><p>Default: <code>60</code></p><p>The minimum is 1 and the maximum is 14 days (20160 minutes).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInMinutes;

/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetRelationalDatabaseEvents</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The name of the database from which to get events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseEventsResult : AWSModel


/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetRelationalDatabaseEvents</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>An object describing the result of your get relational database events request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailRelationalDatabaseEvent *> * _Nullable relationalDatabaseEvents;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseLogEventsRequest : AWSRequest


/**
 <p>The end of the time interval from which to get log events.</p><p>Constraints:</p><ul><li><p>Specified in Coordinated Universal Time (UTC).</p></li><li><p>Specified in the Unix time format.</p><p>For example, if you wish to use an end time of October 1, 2018, at 8 PM UTC, then you input <code>1538424000</code> as the end time.</p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The name of the log stream.</p><p>Use the <code>get relational database log streams</code> operation to get a list of available log streams.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logStreamName;

/**
 <p>The token to advance to the next or previous page of results from your request.</p><p>To get a page token, perform an initial <code>GetRelationalDatabaseLogEvents</code> request. If your results are paginated, the response will return a next forward token and/or next backward token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The name of your database for which to get log events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

/**
 <p>Parameter to specify if the log should start from head or tail. If <code>true</code> is specified, the log event starts from the head of the log. If <code>false</code> is specified, the log event starts from the tail of the log.</p><note><p>For PostgreSQL, the default value of <code>false</code> is the only option available.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable startFromHead;

/**
 <p>The start of the time interval from which to get log events.</p><p>Constraints:</p><ul><li><p>Specified in Coordinated Universal Time (UTC).</p></li><li><p>Specified in the Unix time format.</p><p>For example, if you wish to use a start time of October 1, 2018, at 8 PM UTC, then you input <code>1538424000</code> as the start time.</p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseLogEventsResult : AWSModel


/**
 <p>A token used for advancing to the previous page of results from your get relational database log events request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextBackwardToken;

/**
 <p>A token used for advancing to the next page of results from your get relational database log events request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextForwardToken;

/**
 <p>An object describing the result of your get relational database log events request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailLogEvent *> * _Nullable resourceLogEvents;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseLogStreamsRequest : AWSRequest


/**
 <p>The name of your database for which to get log streams.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseLogStreamsResult : AWSModel


/**
 <p>An object describing the result of your get relational database log streams request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logStreams;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseMasterUserPasswordRequest : AWSRequest


/**
 <p>The password version to return.</p><p>Specifying <code>CURRENT</code> or <code>PREVIOUS</code> returns the current or previous passwords respectively. Specifying <code>PENDING</code> returns the newest version of the password that will rotate to <code>CURRENT</code>. After the <code>PENDING</code> password rotates to <code>CURRENT</code>, the <code>PENDING</code> password is no longer available.</p><p>Default: <code>CURRENT</code></p>
 */
@property (nonatomic, assign) AWSLightsailRelationalDatabasePasswordVersion passwordVersion;

/**
 <p>The name of your database for which to get the master user password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseMasterUserPasswordResult : AWSModel


/**
 <p>The timestamp when the specified version of the master user password was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The master user password for the <code>password version</code> specified.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseMetricDataRequest : AWSRequest


/**
 <p>The end of the time interval from which to get metric data.</p><p>Constraints:</p><ul><li><p>Specified in Coordinated Universal Time (UTC).</p></li><li><p>Specified in the Unix time format.</p><p>For example, if you wish to use an end time of October 1, 2018, at 8 PM UTC, then you input <code>1538424000</code> as the end time.</p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The metric for which you want to return information.</p><p>Valid relational database metric names are listed below, along with the most useful <code>statistics</code> to include in your request, and the published <code>unit</code> value. All relational database metric data is available in 1-minute (60 seconds) granularity.</p><ul><li><p><b><code>CPUUtilization</code></b> - The percentage of CPU utilization currently in use on the database.</p><p><code>Statistics</code>: The most useful statistics are <code>Maximum</code> and <code>Average</code>.</p><p><code>Unit</code>: The published unit is <code>Percent</code>.</p></li><li><p><b><code>DatabaseConnections</code></b> - The number of database connections in use.</p><p><code>Statistics</code>: The most useful statistics are <code>Maximum</code> and <code>Sum</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>DiskQueueDepth</code></b> - The number of outstanding IOs (read/write requests) that are waiting to access the disk.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p><p><code>Unit</code>: The published unit is <code>Count</code>.</p></li><li><p><b><code>FreeStorageSpace</code></b> - The amount of available storage space.</p><p><code>Statistics</code>: The most useful statistic is <code>Sum</code>.</p><p><code>Unit</code>: The published unit is <code>Bytes</code>.</p></li><li><p><b><code>NetworkReceiveThroughput</code></b> - The incoming (Receive) network traffic on the database, including both customer database traffic and AWS traffic used for monitoring and replication.</p><p><code>Statistics</code>: The most useful statistic is <code>Average</code>.</p><p><code>Unit</code>: The published unit is <code>Bytes/Second</code>.</p></li><li><p><b><code>NetworkTransmitThroughput</code></b> - The outgoing (Transmit) network traffic on the database, including both customer database traffic and AWS traffic used for monitoring and replication.</p><p><code>Statistics</code>: The most useful statistic is <code>Average</code>.</p><p><code>Unit</code>: The published unit is <code>Bytes/Second</code>.</p></li></ul>
 */
@property (nonatomic, assign) AWSLightsailRelationalDatabaseMetricName metricName;

/**
 <p>The granularity, in seconds, of the returned data points.</p><p>All relational database metric data is available in 1-minute (60 seconds) granularity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable period;

/**
 <p>The name of your database from which to get metric data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

/**
 <p>The start of the time interval from which to get metric data.</p><p>Constraints:</p><ul><li><p>Specified in Coordinated Universal Time (UTC).</p></li><li><p>Specified in the Unix time format.</p><p>For example, if you wish to use a start time of October 1, 2018, at 8 PM UTC, then you input <code>1538424000</code> as the start time.</p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The statistic for the metric.</p><p>The following statistics are available:</p><ul><li><p><code>Minimum</code> - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.</p></li><li><p><code>Maximum</code> - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.</p></li><li><p><code>Sum</code> - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.</p></li><li><p><code>Average</code> - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.</p></li><li><p><code>SampleCount</code> - The count, or number, of data points used for the statistical calculation.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable statistics;

/**
 <p>The unit for the metric data request. Valid units depend on the metric data being requested. For the valid units with each available metric, see the <code>metricName</code> parameter.</p>
 */
@property (nonatomic, assign) AWSLightsailMetricUnit unit;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseMetricDataResult : AWSModel


/**
 <p>An array of objects that describe the metric data returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailMetricDatapoint *> * _Nullable metricData;

/**
 <p>The name of the metric returned.</p>
 */
@property (nonatomic, assign) AWSLightsailRelationalDatabaseMetricName metricName;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseParametersRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetRelationalDatabaseParameters</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The name of your database for which to get parameters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseParametersResult : AWSModel


/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetRelationalDatabaseParameters</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>An object describing the result of your get relational database parameters request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailRelationalDatabaseParameter *> * _Nullable parameters;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseRequest : AWSRequest


/**
 <p>The name of the database that you are looking up.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseResult : AWSModel


/**
 <p>An object describing the specified database.</p>
 */
@property (nonatomic, strong) AWSLightsailRelationalDatabase * _Nullable relationalDatabase;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseSnapshotRequest : AWSRequest


/**
 <p>The name of the database snapshot for which to get information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseSnapshotName;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseSnapshotResult : AWSModel


/**
 <p>An object describing the specified database snapshot.</p>
 */
@property (nonatomic, strong) AWSLightsailRelationalDatabaseSnapshot * _Nullable relationalDatabaseSnapshot;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseSnapshotsRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetRelationalDatabaseSnapshots</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabaseSnapshotsResult : AWSModel


/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetRelationalDatabaseSnapshots</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>An object describing the result of your get relational database snapshots request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailRelationalDatabaseSnapshot *> * _Nullable relationalDatabaseSnapshots;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabasesRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetRelationalDatabases</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetRelationalDatabasesResult : AWSModel


/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetRelationalDatabases</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>An object describing the result of your get relational databases request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailRelationalDatabase *> * _Nullable relationalDatabases;

@end

/**
 
 */
@interface AWSLightsailGetStaticIpRequest : AWSRequest


/**
 <p>The name of the static IP in Lightsail.</p>
 */
@property (nonatomic, strong) NSString * _Nullable staticIpName;

@end

/**
 
 */
@interface AWSLightsailGetStaticIpResult : AWSModel


/**
 <p>An array of key-value pairs containing information about the requested static IP.</p>
 */
@property (nonatomic, strong) AWSLightsailStaticIp * _Nullable staticIp;

@end

/**
 
 */
@interface AWSLightsailGetStaticIpsRequest : AWSRequest


/**
 <p>The token to advance to the next page of results from your request.</p><p>To get a page token, perform an initial <code>GetStaticIps</code> request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSLightsailGetStaticIpsResult : AWSModel


/**
 <p>The token to advance to the next page of resutls from your request.</p><p>A next page token is not returned if there are no more results to display.</p><p>To get the next page of results, perform another <code>GetStaticIps</code> request and specify the next page token using the <code>pageToken</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>An array of key-value pairs containing information about your get static IPs request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailStaticIp *> * _Nullable staticIps;

@end

/**
 <p>Describes the public SSH host keys or the RDP certificate.</p>
 */
@interface AWSLightsailHostKeyAttributes : AWSModel


/**
 <p>The SSH host key algorithm or the RDP certificate format.</p><p>For SSH host keys, the algorithm may be <code>ssh-rsa</code>, <code>ecdsa-sha2-nistp256</code>, <code>ssh-ed25519</code>, etc. For RDP certificates, the algorithm is always <code>x509-cert</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable algorithm;

/**
 <p>The SHA-1 fingerprint of the returned SSH host key or RDP certificate.</p><ul><li><p>Example of an SHA-1 SSH fingerprint:</p><p><code>SHA1:1CHH6FaAaXjtFOsR/t83vf91SR0</code></p></li><li><p>Example of an SHA-1 RDP fingerprint:</p><p><code>af:34:51:fe:09:f0:e0:da:b8:4e:56:ca:60:c2:10:ff:38:06:db:45</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable fingerprintSHA1;

/**
 <p>The SHA-256 fingerprint of the returned SSH host key or RDP certificate.</p><ul><li><p>Example of an SHA-256 SSH fingerprint:</p><p><code>SHA256:KTsMnRBh1IhD17HpdfsbzeGA4jOijm5tyXsMjKVbB8o</code></p></li><li><p>Example of an SHA-256 RDP fingerprint:</p><p><code>03:9b:36:9f:4b:de:4e:61:70:fc:7c:c9:78:e7:d2:1a:1c:25:a8:0c:91:f6:7c:e4:d6:a0:85:c8:b4:53:99:68</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable fingerprintSHA256;

/**
 <p>The returned RDP certificate is not valid after this point in time.</p><p>This value is listed only for RDP certificates.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable notValidAfter;

/**
 <p>The returned RDP certificate is valid after this point in time.</p><p>This value is listed only for RDP certificates.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable notValidBefore;

/**
 <p>The public SSH host key or the RDP certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicKey;

/**
 <p>The time that the SSH host key or RDP certificate was recorded by Lightsail.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable witnessedAt;

@end

/**
 
 */
@interface AWSLightsailImportKeyPairRequest : AWSRequest


/**
 <p>The name of the key pair for which you want to import the public key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPairName;

/**
 <p>A base64-encoded public key of the <code>ssh-rsa</code> type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicKeyBase64;

@end

/**
 
 */
@interface AWSLightsailImportKeyPairResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) AWSLightsailOperation * _Nullable operation;

@end

/**
 <p>Describes an instance (a virtual private server).</p>
 */
@interface AWSLightsailInstance : AWSModel


/**
 <p>An array of objects representing the add-ons enabled on the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailAddOn *> * _Nullable addOns;

/**
 <p>The Amazon Resource Name (ARN) of the instance (e.g., <code>arn:aws:lightsail:us-east-2:123456789101:Instance/244ad76f-8aad-4741-809f-12345EXAMPLE</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The blueprint ID (e.g., <code>os_amlinux_2016_03</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable blueprintId;

/**
 <p>The friendly name of the blueprint (e.g., <code>Amazon Linux</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable blueprintName;

/**
 <p>The bundle for the instance (e.g., <code>micro_1_0</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 <p>The timestamp when the instance was created (e.g., <code>1479734909.17</code>).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The size of the vCPU and the amount of RAM for the instance.</p>
 */
@property (nonatomic, strong) AWSLightsailInstanceHardware * _Nullable hardware;

/**
 <p>The IPv6 address of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipv6Address;

/**
 <p>A Boolean value indicating whether this instance has a static IP assigned to it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isStaticIp;

/**
 <p>The region name and Availability Zone where the instance is located.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The name the user gave the instance (e.g., <code>Amazon_Linux-1GB-Ohio-1</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Information about the public ports and monthly data transfer rates for the instance.</p>
 */
@property (nonatomic, strong) AWSLightsailInstanceNetworking * _Nullable networking;

/**
 <p>The private IP address of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

/**
 <p>The public IP address of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIpAddress;

/**
 <p>The type of resource (usually <code>Instance</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>The name of the SSH key being used to connect to the instance (e.g., <code>LightsailDefaultKeyPair</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable sshKeyName;

/**
 <p>The status code and the state (e.g., <code>running</code>) for the instance.</p>
 */
@property (nonatomic, strong) AWSLightsailInstanceState * _Nullable state;

/**
 <p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportCode;

/**
 <p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail Dev Guide</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

/**
 <p>The user name for connecting to the instance (e.g., <code>ec2-user</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>The parameters for gaining temporary access to one of your Amazon Lightsail instances.</p>
 */
@interface AWSLightsailInstanceAccessDetails : AWSModel


/**
 <p>For SSH access, the public key to use when accessing your instance For OpenSSH clients (e.g., command line SSH), you should save this value to <code>tempkey-cert.pub</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certKey;

/**
 <p>For SSH access, the date on which the temporary keys expire.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expiresAt;

/**
 <p>Describes the public SSH host keys or the RDP certificate.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailHostKeyAttributes *> * _Nullable hostKeys;

/**
 <p>The name of this Amazon Lightsail instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

/**
 <p>The public IP address of the Amazon Lightsail instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddress;

/**
 <p>For RDP access, the password for your Amazon Lightsail instance. Password will be an empty string if the password for your new instance is not ready yet. When you create an instance, it can take up to 15 minutes for the instance to be ready.</p><note><p>If you create an instance using any key pair other than the default (<code>LightsailDefaultKeyPair</code>), <code>password</code> will always be an empty string.</p><p>If you change the Administrator password on the instance, Lightsail will continue to return the original password value. When accessing the instance using RDP, you need to manually enter the Administrator password after changing it from the default.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>For a Windows Server-based instance, an object with the data you can use to retrieve your password. This is only needed if <code>password</code> is empty and the instance is not new (and therefore the password is not ready yet). When you create an instance, it can take up to 15 minutes for the instance to be ready.</p>
 */
@property (nonatomic, strong) AWSLightsailPasswordData * _Nullable passwordData;

/**
 <p>For SSH access, the temporary private key. For OpenSSH clients (e.g., command line SSH), you should save this value to <code>tempkey</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

/**
 <p>The protocol for these Amazon Lightsail instance access details.</p>
 */
@property (nonatomic, assign) AWSLightsailInstanceAccessProtocol protocols;

/**
 <p>The user name to use when logging in to the Amazon Lightsail instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Describes the Amazon Elastic Compute Cloud instance and related resources to be created using the <code>create cloud formation stack</code> operation.</p>
 Required parameters: [sourceName, instanceType, portInfoSource, availabilityZone]
 */
@interface AWSLightsailInstanceEntry : AWSModel


/**
 <p>The Availability Zone for the new Amazon EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The instance type (e.g., <code>t2.micro</code>) to use for the new Amazon EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The port configuration to use for the new Amazon EC2 instance.</p><p>The following configuration options are available:</p><ul><li><p><code>DEFAULT</code> - Use the default firewall settings from the Lightsail instance blueprint.</p></li><li><p><code>INSTANCE</code> - Use the configured firewall settings from the source Lightsail instance.</p></li><li><p><code>NONE</code> - Use the default Amazon EC2 security group.</p></li><li><p><code>CLOSED</code> - All ports closed.</p></li></ul><note><p>If you configured <code>lightsail-connect</code> as a <code>cidrListAliases</code> on your instance, or if you chose to allow the Lightsail browser-based SSH or RDP clients to connect to your instance, that configuration is not carried over to your new Amazon EC2 instance.</p></note>
 */
@property (nonatomic, assign) AWSLightsailPortInfoSourceType portInfoSource;

/**
 <p>The name of the export snapshot record, which contains the exported Lightsail instance snapshot that will be used as the source of the new Amazon EC2 instance.</p><p>Use the <code>get export snapshot records</code> operation to get a list of export snapshot records that you can use to create a CloudFormation stack.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceName;

/**
 <p>A launch script you can create that configures a server with additional user data. For example, you might want to run <code>apt-get -y update</code>.</p><note><p>Depending on the machine image you choose, the command to get software on your instance varies. Amazon Linux and CentOS use <code>yum</code>, Debian and Ubuntu use <code>apt-get</code>, and FreeBSD uses <code>pkg</code>.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable userData;

@end

/**
 <p>Describes the hardware for the instance.</p>
 */
@interface AWSLightsailInstanceHardware : AWSModel


/**
 <p>The number of vCPUs the instance has.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cpuCount;

/**
 <p>The disks attached to the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailDisk *> * _Nullable disks;

/**
 <p>The amount of RAM in GB on the instance (e.g., <code>1.0</code>).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ramSizeInGb;

@end

/**
 <p>Describes information about the health of the instance.</p>
 */
@interface AWSLightsailInstanceHealthSummary : AWSModel


/**
 <p>Describes the overall instance health. Valid values are below.</p>
 */
@property (nonatomic, assign) AWSLightsailInstanceHealthState instanceHealth;

/**
 <p>More information about the instance health. If the <code>instanceHealth</code> is <code>healthy</code>, then an <code>instanceHealthReason</code> value is not provided.</p><p>If <b><code>instanceHealth</code></b> is <code>initial</code>, the <b><code>instanceHealthReason</code></b> value can be one of the following:</p><ul><li><p><b><code>Lb.RegistrationInProgress</code></b> - The target instance is in the process of being registered with the load balancer.</p></li><li><p><b><code>Lb.InitialHealthChecking</code></b> - The Lightsail load balancer is still sending the target instance the minimum number of health checks required to determine its health status.</p></li></ul><p>If <b><code>instanceHealth</code></b> is <code>unhealthy</code>, the <b><code>instanceHealthReason</code></b> value can be one of the following:</p><ul><li><p><b><code>Instance.ResponseCodeMismatch</code></b> - The health checks did not return an expected HTTP code.</p></li><li><p><b><code>Instance.Timeout</code></b> - The health check requests timed out.</p></li><li><p><b><code>Instance.FailedHealthChecks</code></b> - The health checks failed because the connection to the target instance timed out, the target instance response was malformed, or the target instance failed the health check for an unknown reason.</p></li><li><p><b><code>Lb.InternalError</code></b> - The health checks failed due to an internal error.</p></li></ul><p>If <b><code>instanceHealth</code></b> is <code>unused</code>, the <b><code>instanceHealthReason</code></b> value can be one of the following:</p><ul><li><p><b><code>Instance.NotRegistered</code></b> - The target instance is not registered with the target group.</p></li><li><p><b><code>Instance.NotInUse</code></b> - The target group is not used by any load balancer, or the target instance is in an Availability Zone that is not enabled for its load balancer.</p></li><li><p><b><code>Instance.IpUnusable</code></b> - The target IP address is reserved for use by a Lightsail load balancer.</p></li><li><p><b><code>Instance.InvalidState</code></b> - The target is in the stopped or terminated state.</p></li></ul><p>If <b><code>instanceHealth</code></b> is <code>draining</code>, the <b><code>instanceHealthReason</code></b> value can be one of the following:</p><ul><li><p><b><code>Instance.DeregistrationInProgress</code></b> - The target instance is in the process of being deregistered and the deregistration delay period has not expired.</p></li></ul>
 */
@property (nonatomic, assign) AWSLightsailInstanceHealthReason instanceHealthReason;

/**
 <p>The name of the Lightsail instance for which you are requesting health check data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

@end

/**
 <p>Describes monthly data transfer rates and port information for an instance.</p>
 */
@interface AWSLightsailInstanceNetworking : AWSModel


/**
 <p>The amount of data in GB allocated for monthly data transfers.</p>
 */
@property (nonatomic, strong) AWSLightsailMonthlyTransfer * _Nullable monthlyTransfer;

/**
 <p>An array of key-value pairs containing information about the ports on the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailInstancePortInfo *> * _Nullable ports;

@end

/**
 <p>Describes information about ports for an Amazon Lightsail instance.</p>
 */
@interface AWSLightsailInstancePortInfo : AWSModel


/**
 <p>The access direction (<code>inbound</code> or <code>outbound</code>).</p><note><p>Lightsail currently supports only <code>inbound</code> access direction.</p></note>
 */
@property (nonatomic, assign) AWSLightsailAccessDirection accessDirection;

/**
 <p>The location from which access is allowed. For example, <code>Anywhere (0.0.0.0/0)</code>, or <code>Custom</code> if a specific IP address or range of IP addresses is allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessFrom;

/**
 <p>The type of access (<code>Public</code> or <code>Private</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailPortAccessType accessType;

/**
 <p>An alias that defines access for a preconfigured range of IP addresses.</p><p>The only alias currently supported is <code>lightsail-connect</code>, which allows IP addresses of the browser-based RDP/SSH client in the Lightsail console to connect to your instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cidrListAliases;

/**
 <p>The IP address, or range of IP addresses in CIDR notation, that are allowed to connect to an instance through the ports, and the protocol. Lightsail supports IPv4 addresses.</p><p>For more information about CIDR block notation, see <a href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless Inter-Domain Routing</a> on <i>Wikipedia</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cidrs;

/**
 <p>The common name of the port information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable commonName;

/**
 <p>The first port in a range of open ports on an instance.</p><p>Allowed ports:</p><ul><li><p>TCP and UDP - <code>0</code> to <code>65535</code></p></li><li><p>ICMP - The ICMP type. For example, specify <code>8</code> as the <code>fromPort</code> (ICMP type), and <code>-1</code> as the <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information, see <a href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control Messages</a> on <i>Wikipedia</i>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable fromPort;

/**
 <p>The IP protocol name.</p><p>The name can be one of the following:</p><ul><li><p><code>tcp</code> - Transmission Control Protocol (TCP) provides reliable, ordered, and error-checked delivery of streamed data between applications running on hosts communicating by an IP network. If you have an application that doesn't require reliable data stream service, use UDP instead.</p></li><li><p><code>all</code> - All transport layer protocol types. For more general information, see <a href="https://en.wikipedia.org/wiki/Transport_layer">Transport layer</a> on <i>Wikipedia</i>.</p></li><li><p><code>udp</code> - With User Datagram Protocol (UDP), computer applications can send messages (or datagrams) to other hosts on an Internet Protocol (IP) network. Prior communications are not required to set up transmission channels or data paths. Applications that don't require reliable data stream service can use UDP, which provides a connectionless datagram service that emphasizes reduced latency over reliability. If you do require reliable data stream service, use TCP instead.</p></li><li><p><code>icmp</code> - Internet Control Message Protocol (ICMP) is used to send error messages and operational information indicating success or failure when communicating with an instance. For example, an error is indicated when an instance could not be reached. When you specify <code>icmp</code> as the <code>protocol</code>, you must specify the ICMP type using the <code>fromPort</code> parameter, and ICMP code using the <code>toPort</code> parameter.</p></li></ul>
 */
@property (nonatomic, assign) AWSLightsailNetworkProtocol protocols;

/**
 <p>The last port in a range of open ports on an instance.</p><p>Allowed ports:</p><ul><li><p>TCP and UDP - <code>0</code> to <code>65535</code></p></li><li><p>ICMP - The ICMP code. For example, specify <code>8</code> as the <code>fromPort</code> (ICMP type), and <code>-1</code> as the <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information, see <a href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control Messages</a> on <i>Wikipedia</i>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable toPort;

@end

/**
 <p>Describes open ports on an instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.</p>
 */
@interface AWSLightsailInstancePortState : AWSModel


/**
 <p>An alias that defines access for a preconfigured range of IP addresses.</p><p>The only alias currently supported is <code>lightsail-connect</code>, which allows IP addresses of the browser-based RDP/SSH client in the Lightsail console to connect to your instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cidrListAliases;

/**
 <p>The IP address, or range of IP addresses in CIDR notation, that are allowed to connect to an instance through the ports, and the protocol. Lightsail supports IPv4 addresses.</p><p>For more information about CIDR block notation, see <a href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless Inter-Domain Routing</a> on <i>Wikipedia</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cidrs;

/**
 <p>The first port in a range of open ports on an instance.</p><p>Allowed ports:</p><ul><li><p>TCP and UDP - <code>0</code> to <code>65535</code></p></li><li><p>ICMP - The ICMP type. For example, specify <code>8</code> as the <code>fromPort</code> (ICMP type), and <code>-1</code> as the <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information, see <a href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control Messages</a> on <i>Wikipedia</i>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable fromPort;

/**
 <p>The IP protocol name.</p><p>The name can be one of the following:</p><ul><li><p><code>tcp</code> - Transmission Control Protocol (TCP) provides reliable, ordered, and error-checked delivery of streamed data between applications running on hosts communicating by an IP network. If you have an application that doesn't require reliable data stream service, use UDP instead.</p></li><li><p><code>all</code> - All transport layer protocol types. For more general information, see <a href="https://en.wikipedia.org/wiki/Transport_layer">Transport layer</a> on <i>Wikipedia</i>.</p></li><li><p><code>udp</code> - With User Datagram Protocol (UDP), computer applications can send messages (or datagrams) to other hosts on an Internet Protocol (IP) network. Prior communications are not required to set up transmission channels or data paths. Applications that don't require reliable data stream service can use UDP, which provides a connectionless datagram service that emphasizes reduced latency over reliability. If you do require reliable data stream service, use TCP instead.</p></li><li><p><code>icmp</code> - Internet Control Message Protocol (ICMP) is used to send error messages and operational information indicating success or failure when communicating with an instance. For example, an error is indicated when an instance could not be reached. When you specify <code>icmp</code> as the <code>protocol</code>, you must specify the ICMP type using the <code>fromPort</code> parameter, and ICMP code using the <code>toPort</code> parameter.</p></li></ul>
 */
@property (nonatomic, assign) AWSLightsailNetworkProtocol protocols;

/**
 <p>Specifies whether the instance port is <code>open</code> or <code>closed</code>.</p><note><p>The port state for Lightsail instances is always <code>open</code>.</p></note>
 */
@property (nonatomic, assign) AWSLightsailPortState state;

/**
 <p>The last port in a range of open ports on an instance.</p><p>Allowed ports:</p><ul><li><p>TCP and UDP - <code>0</code> to <code>65535</code></p></li><li><p>ICMP - The ICMP code. For example, specify <code>8</code> as the <code>fromPort</code> (ICMP type), and <code>-1</code> as the <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information, see <a href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control Messages</a> on <i>Wikipedia</i>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable toPort;

@end

/**
 <p>Describes an instance snapshot.</p>
 */
@interface AWSLightsailInstanceSnapshot : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the snapshot (e.g., <code>arn:aws:lightsail:us-east-2:123456789101:InstanceSnapshot/d23b5706-3322-4d83-81e5-12345EXAMPLE</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The timestamp when the snapshot was created (e.g., <code>1479907467.024</code>).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>An array of disk objects containing information about all block storage disks.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailDisk *> * _Nullable fromAttachedDisks;

/**
 <p>The blueprint ID from which you created the snapshot (e.g., <code>os_debian_8_3</code>). A blueprint is a virtual private server (or <i>instance</i>) image used to create instances quickly.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromBlueprintId;

/**
 <p>The bundle ID from which you created the snapshot (e.g., <code>micro_1_0</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromBundleId;

/**
 <p>The Amazon Resource Name (ARN) of the instance from which the snapshot was created (e.g., <code>arn:aws:lightsail:us-east-2:123456789101:Instance/64b8404c-ccb1-430b-8daf-12345EXAMPLE</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromInstanceArn;

/**
 <p>The instance from which the snapshot was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromInstanceName;

/**
 <p>A Boolean value indicating whether the snapshot was created from an automatic snapshot.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isFromAutoSnapshot;

/**
 <p>The region name and Availability Zone where you created the snapshot.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The name of the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The progress of the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable progress;

/**
 <p>The type of resource (usually <code>InstanceSnapshot</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>The size in GB of the SSD.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInGb;

/**
 <p>The state the snapshot is in.</p>
 */
@property (nonatomic, assign) AWSLightsailInstanceSnapshotState state;

/**
 <p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportCode;

/**
 <p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail Dev Guide</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 <p>Describes an instance snapshot.</p>
 */
@interface AWSLightsailInstanceSnapshotInfo : AWSModel


/**
 <p>The blueprint ID from which the source instance (e.g., <code>os_debian_8_3</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromBlueprintId;

/**
 <p>The bundle ID from which the source instance was created (e.g., <code>micro_1_0</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromBundleId;

/**
 <p>A list of objects describing the disks that were attached to the source instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailDiskInfo *> * _Nullable fromDiskInfo;

@end

/**
 <p>Describes the virtual private server (or <i>instance</i>) status.</p>
 */
@interface AWSLightsailInstanceState : AWSModel


/**
 <p>The status code for the instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable code;

/**
 <p>The state of the instance (e.g., <code>running</code> or <code>pending</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLightsailIsVpcPeeredRequest : AWSRequest


@end

/**
 
 */
@interface AWSLightsailIsVpcPeeredResult : AWSModel


/**
 <p>Returns <code>true</code> if the Lightsail VPC is peered; otherwise, <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isPeered;

@end

/**
 <p>Describes the SSH key pair.</p>
 */
@interface AWSLightsailKeyPair : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the key pair (e.g., <code>arn:aws:lightsail:us-east-2:123456789101:KeyPair/05859e3d-331d-48ba-9034-12345EXAMPLE</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The timestamp when the key pair was created (e.g., <code>1479816991.349</code>).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The RSA fingerprint of the key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fingerprint;

/**
 <p>The region name and Availability Zone where the key pair was created.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The friendly name of the SSH key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The resource type (usually <code>KeyPair</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportCode;

/**
 <p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail Dev Guide</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 <p>Describes the Lightsail load balancer.</p>
 */
@interface AWSLightsailLoadBalancer : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>A string to string map of the configuration options for your load balancer. Valid values are listed below.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable configurationOptions;

/**
 <p>The date when your load balancer was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The DNS name of your Lightsail load balancer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dnsName;

/**
 <p>The path you specified to perform your health checks. If no path is specified, the load balancer tries to make a request to the default (root) page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable healthCheckPath;

/**
 <p>An array of InstanceHealthSummary objects describing the health of the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailInstanceHealthSummary *> * _Nullable instanceHealthSummary;

/**
 <p>The port where the load balancer will direct traffic to your Lightsail instances. For HTTP traffic, it's port 80. For HTTPS traffic, it's port 443.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instancePort;

/**
 <p>The AWS Region where your load balancer was created (e.g., <code>us-east-2a</code>). Lightsail automatically creates your load balancer across Availability Zones.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The name of the load balancer (e.g., <code>my-load-balancer</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The protocol you have enabled for your load balancer. Valid values are below.</p><p>You can't just have <code>HTTP_HTTPS</code>, but you can have just <code>HTTP</code>.</p>
 */
@property (nonatomic, assign) AWSLightsailLoadBalancerProtocol protocols;

/**
 <p>An array of public port settings for your load balancer. For HTTP, use port 80. For HTTPS, use port 443.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable publicPorts;

/**
 <p>The resource type (e.g., <code>LoadBalancer</code>.</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>The status of your load balancer. Valid values are below.</p>
 */
@property (nonatomic, assign) AWSLightsailLoadBalancerState state;

/**
 <p>The support code. Include this code in your email to support when you have questions about your Lightsail load balancer. This code enables our support team to look up your Lightsail information more easily.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportCode;

/**
 <p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail Dev Guide</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

/**
 <p>An array of LoadBalancerTlsCertificateSummary objects that provide additional information about the SSL/TLS certificates. For example, if <code>true</code>, the certificate is attached to the load balancer.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailLoadBalancerTlsCertificateSummary *> * _Nullable tlsCertificateSummaries;

@end

/**
 <p>Describes a load balancer SSL/TLS certificate.</p><p>TLS is just an updated, more secure version of Secure Socket Layer (SSL).</p>
 */
@interface AWSLightsailLoadBalancerTlsCertificate : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the SSL/TLS certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The time when you created your SSL/TLS certificate.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The domain name for your SSL/TLS certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>An array of LoadBalancerTlsCertificateDomainValidationRecord objects describing the records.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailLoadBalancerTlsCertificateDomainValidationRecord *> * _Nullable domainValidationRecords;

/**
 <p>The reason for the SSL/TLS certificate validation failure.</p>
 */
@property (nonatomic, assign) AWSLightsailLoadBalancerTlsCertificateFailureReason failureReason;

/**
 <p>When <code>true</code>, the SSL/TLS certificate is attached to the Lightsail load balancer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isAttached;

/**
 <p>The time when the SSL/TLS certificate was issued.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable issuedAt;

/**
 <p>The issuer of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable issuer;

/**
 <p>The algorithm that was used to generate the key pair (the public and private key).</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyAlgorithm;

/**
 <p>The load balancer name where your SSL/TLS certificate is attached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

/**
 <p>The AWS Region and Availability Zone where you created your certificate.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The name of the SSL/TLS certificate (e.g., <code>my-certificate</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The timestamp when the SSL/TLS certificate expires.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable notAfter;

/**
 <p>The timestamp when the SSL/TLS certificate is first valid.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable notBefore;

/**
 <p>An object containing information about the status of Lightsail's managed renewal for the certificate.</p>
 */
@property (nonatomic, strong) AWSLightsailLoadBalancerTlsCertificateRenewalSummary * _Nullable renewalSummary;

/**
 <p>The resource type (e.g., <code>LoadBalancerTlsCertificate</code>).</p><ul><li><p><b><code>Instance</code></b> - A Lightsail instance (a virtual private server)</p></li><li><p><b><code>StaticIp</code></b> - A static IP address</p></li><li><p><b><code>KeyPair</code></b> - The key pair used to connect to a Lightsail instance</p></li><li><p><b><code>InstanceSnapshot</code></b> - A Lightsail instance snapshot</p></li><li><p><b><code>Domain</code></b> - A DNS zone</p></li><li><p><b><code>PeeredVpc</code></b> - A peered VPC</p></li><li><p><b><code>LoadBalancer</code></b> - A Lightsail load balancer</p></li><li><p><b><code>LoadBalancerTlsCertificate</code></b> - An SSL/TLS certificate associated with a Lightsail load balancer</p></li><li><p><b><code>Disk</code></b> - A Lightsail block storage disk</p></li><li><p><b><code>DiskSnapshot</code></b> - A block storage disk snapshot</p></li></ul>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>The reason the certificate was revoked. Valid values are below.</p>
 */
@property (nonatomic, assign) AWSLightsailLoadBalancerTlsCertificateRevocationReason revocationReason;

/**
 <p>The timestamp when the SSL/TLS certificate was revoked.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable revokedAt;

/**
 <p>The serial number of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serial;

/**
 <p>The algorithm that was used to sign the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signatureAlgorithm;

/**
 <p>The validation status of the SSL/TLS certificate. Valid values are below.</p>
 */
@property (nonatomic, assign) AWSLightsailLoadBalancerTlsCertificateStatus status;

/**
 <p>The name of the entity that is associated with the public key contained in the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subject;

/**
 <p>One or more domains or subdomains included in the certificate. This list contains the domain names that are bound to the public key that is contained in the certificate. The subject alternative names include the canonical domain name (CNAME) of the certificate and additional domain names that can be used to connect to the website, such as <code>example.com</code>, <code>www.example.com</code>, or <code>m.example.com</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subjectAlternativeNames;

/**
 <p>The support code. Include this code in your email to support when you have questions about your Lightsail load balancer or SSL/TLS certificate. This code enables our support team to look up your Lightsail information more easily.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportCode;

/**
 <p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail Dev Guide</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 <p>Contains information about the domain names on an SSL/TLS certificate that you will use to validate domain ownership.</p>
 */
@interface AWSLightsailLoadBalancerTlsCertificateDomainValidationOption : AWSModel


/**
 <p>The fully qualified domain name in the certificate request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The status of the domain validation. Valid values are listed below.</p>
 */
@property (nonatomic, assign) AWSLightsailLoadBalancerTlsCertificateDomainStatus validationStatus;

@end

/**
 <p>Describes the validation record of each domain name in the SSL/TLS certificate.</p>
 */
@interface AWSLightsailLoadBalancerTlsCertificateDomainValidationRecord : AWSModel


/**
 <p>The domain name against which your SSL/TLS certificate was validated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>A fully qualified domain name in the certificate. For example, <code>example.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of validation record. For example, <code>CNAME</code> for domain validation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The validation status. Valid values are listed below.</p>
 */
@property (nonatomic, assign) AWSLightsailLoadBalancerTlsCertificateDomainStatus validationStatus;

/**
 <p>The value for that type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Contains information about the status of Lightsail's managed renewal for the certificate.</p>
 */
@interface AWSLightsailLoadBalancerTlsCertificateRenewalSummary : AWSModel


/**
 <p>Contains information about the validation of each domain name in the certificate, as it pertains to Lightsail's managed renewal. This is different from the initial validation that occurs as a result of the RequestCertificate request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailLoadBalancerTlsCertificateDomainValidationOption *> * _Nullable domainValidationOptions;

/**
 <p>The status of Lightsail's managed renewal of the certificate. Valid values are listed below.</p>
 */
@property (nonatomic, assign) AWSLightsailLoadBalancerTlsCertificateRenewalStatus renewalStatus;

@end

/**
 <p>Provides a summary of SSL/TLS certificate metadata.</p>
 */
@interface AWSLightsailLoadBalancerTlsCertificateSummary : AWSModel


/**
 <p>When <code>true</code>, the SSL/TLS certificate is attached to the Lightsail load balancer.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isAttached;

/**
 <p>The name of the SSL/TLS certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Describes a database log event.</p>
 */
@interface AWSLightsailLogEvent : AWSModel


/**
 <p>The timestamp when the database log event was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The message of the database log event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Describes the metric data point.</p>
 */
@interface AWSLightsailMetricDatapoint : AWSModel


/**
 <p>The average.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable average;

/**
 <p>The maximum.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximum;

/**
 <p>The minimum.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimum;

/**
 <p>The sample count.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sampleCount;

/**
 <p>The sum.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sum;

/**
 <p>The timestamp (e.g., <code>1479816991.349</code>).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 <p>The unit. </p>
 */
@property (nonatomic, assign) AWSLightsailMetricUnit unit;

@end

/**
 <p>Describes resource being monitored by an alarm.</p><p>An alarm is a way to monitor your Amazon Lightsail resource metrics. For more information, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms in Amazon Lightsail</a>.</p>
 */
@interface AWSLightsailMonitoredResourceInfo : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource being monitored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The name of the Lightsail resource being monitored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Lightsail resource type of the resource being monitored.</p><p>Instances, load balancers, and relational databases are the only Lightsail resources that can currently be monitored by alarms.</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

@end

/**
 <p>Describes the monthly data transfer in and out of your virtual private server (or <i>instance</i>).</p>
 */
@interface AWSLightsailMonthlyTransfer : AWSModel


/**
 <p>The amount allocated per month (in GB).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable gbPerMonthAllocated;

@end

/**
 
 */
@interface AWSLightsailOpenInstancePublicPortsRequest : AWSRequest


/**
 <p>The name of the instance for which to open ports.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

/**
 <p>An object to describe the ports to open for the specified instance.</p>
 */
@property (nonatomic, strong) AWSLightsailPortInfo * _Nullable portInfo;

@end

/**
 
 */
@interface AWSLightsailOpenInstancePublicPortsResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) AWSLightsailOperation * _Nullable operation;

@end

/**
 <p>Describes the API operation.</p>
 */
@interface AWSLightsailOperation : AWSModel


/**
 <p>The timestamp when the operation was initialized (e.g., <code>1479816991.349</code>).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The error details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorDetails;

/**
 <p>The ID of the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A Boolean value indicating whether the operation is terminal.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTerminal;

/**
 <p>The AWS Region and Availability Zone.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>Details about the operation (e.g., <code>Debian-1GB-Ohio-1</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationDetails;

/**
 <p>The type of operation. </p>
 */
@property (nonatomic, assign) AWSLightsailOperationType operationType;

/**
 <p>The resource name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

/**
 <p>The resource type. </p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>The status of the operation. </p>
 */
@property (nonatomic, assign) AWSLightsailOperationStatus status;

/**
 <p>The timestamp when the status was changed (e.g., <code>1479816991.349</code>).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable statusChangedAt;

@end

/**
 <p>The password data for the Windows Server-based instance, including the ciphertext and the key pair name.</p>
 */
@interface AWSLightsailPasswordData : AWSModel


/**
 <p>The encrypted password. Ciphertext will be an empty string if access to your new instance is not ready yet. When you create an instance, it can take up to 15 minutes for the instance to be ready.</p><note><p>If you use the default key pair (<code>LightsailDefaultKeyPair</code>), the decrypted password will be available in the password field.</p><p>If you are using a custom key pair, you need to use your own means of decryption.</p><p>If you change the Administrator password on the instance, Lightsail will continue to return the original ciphertext value. When accessing the instance using RDP, you need to manually enter the Administrator password after changing it from the default.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable ciphertext;

/**
 <p>The name of the key pair that you used when creating your instance. If no key pair name was specified when creating the instance, Lightsail uses the default key pair (<code>LightsailDefaultKeyPair</code>).</p><p>If you are using a custom key pair, you need to use your own means of decrypting your password using the <code>ciphertext</code>. Lightsail creates the ciphertext by encrypting your password with the public key part of this key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyPairName;

@end

/**
 
 */
@interface AWSLightsailPeerVpcRequest : AWSRequest


@end

/**
 
 */
@interface AWSLightsailPeerVpcResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) AWSLightsailOperation * _Nullable operation;

@end

/**
 <p>Describes a pending database maintenance action.</p>
 */
@interface AWSLightsailPendingMaintenanceAction : AWSModel


/**
 <p>The type of pending database maintenance action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable action;

/**
 <p>The effective date of the pending database maintenance action.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable currentApplyDate;

/**
 <p>Additional detail about the pending database maintenance action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p>Describes a pending database value modification.</p>
 */
@interface AWSLightsailPendingModifiedRelationalDatabaseValues : AWSModel


/**
 <p>A Boolean value indicating whether automated backup retention is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionEnabled;

/**
 <p>The database engine version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The password for the master user of the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

@end

/**
 <p>Describes ports to open on an instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.</p>
 */
@interface AWSLightsailPortInfo : AWSModel


/**
 <p>An alias that defines access for a preconfigured range of IP addresses.</p><p>The only alias currently supported is <code>lightsail-connect</code>, which allows IP addresses of the browser-based RDP/SSH client in the Lightsail console to connect to your instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cidrListAliases;

/**
 <p>The IP address, or range of IP addresses in CIDR notation, that are allowed to connect to an instance through the ports, and the protocol. Lightsail supports IPv4 addresses.</p><p>Examples:</p><ul><li><p>To allow the IP address <code>192.0.2.44</code>, specify <code>192.0.2.44</code> or <code>192.0.2.44/32</code>. </p></li><li><p>To allow the IP addresses <code>192.0.2.0</code> to <code>192.0.2.255</code>, specify <code>192.0.2.0/24</code>.</p></li></ul><p>For more information about CIDR block notation, see <a href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless Inter-Domain Routing</a> on <i>Wikipedia</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cidrs;

/**
 <p>The first port in a range of open ports on an instance.</p><p>Allowed ports:</p><ul><li><p>TCP and UDP - <code>0</code> to <code>65535</code></p></li><li><p>ICMP - The ICMP type. For example, specify <code>8</code> as the <code>fromPort</code> (ICMP type), and <code>-1</code> as the <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information, see <a href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control Messages</a> on <i>Wikipedia</i>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable fromPort;

/**
 <p>The IP protocol name.</p><p>The name can be one of the following:</p><ul><li><p><code>tcp</code> - Transmission Control Protocol (TCP) provides reliable, ordered, and error-checked delivery of streamed data between applications running on hosts communicating by an IP network. If you have an application that doesn't require reliable data stream service, use UDP instead.</p></li><li><p><code>all</code> - All transport layer protocol types. For more general information, see <a href="https://en.wikipedia.org/wiki/Transport_layer">Transport layer</a> on <i>Wikipedia</i>.</p></li><li><p><code>udp</code> - With User Datagram Protocol (UDP), computer applications can send messages (or datagrams) to other hosts on an Internet Protocol (IP) network. Prior communications are not required to set up transmission channels or data paths. Applications that don't require reliable data stream service can use UDP, which provides a connectionless datagram service that emphasizes reduced latency over reliability. If you do require reliable data stream service, use TCP instead.</p></li><li><p><code>icmp</code> - Internet Control Message Protocol (ICMP) is used to send error messages and operational information indicating success or failure when communicating with an instance. For example, an error is indicated when an instance could not be reached. When you specify <code>icmp</code> as the <code>protocol</code>, you must specify the ICMP type using the <code>fromPort</code> parameter, and ICMP code using the <code>toPort</code> parameter.</p></li></ul>
 */
@property (nonatomic, assign) AWSLightsailNetworkProtocol protocols;

/**
 <p>The last port in a range of open ports on an instance.</p><p>Allowed ports:</p><ul><li><p>TCP and UDP - <code>0</code> to <code>65535</code></p></li><li><p>ICMP - The ICMP code. For example, specify <code>8</code> as the <code>fromPort</code> (ICMP type), and <code>-1</code> as the <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information, see <a href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control Messages</a> on <i>Wikipedia</i>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable toPort;

@end

/**
 
 */
@interface AWSLightsailPutAlarmRequest : AWSRequest


/**
 <p>The name for the alarm. Specify the name of an existing alarm to update, and overwrite the previous configuration of the alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p>The arithmetic operation to use when comparing the specified statistic to the threshold. The specified statistic value is used as the first operand.</p>
 */
@property (nonatomic, assign) AWSLightsailComparisonOperator comparisonOperator;

/**
 <p>The contact protocols to use for the alarm, such as <code>Email</code>, <code>SMS</code> (text messaging), or both.</p><p>A notification is sent via the specified contact protocol if notifications are enabled for the alarm, and when the alarm is triggered.</p><p>A notification is not sent if a contact protocol is not specified, if the specified contact protocol is not configured in the AWS Region, or if notifications are not enabled for the alarm using the <code>notificationEnabled</code> paramater.</p><p>Use the <code>CreateContactMethod</code> action to configure a contact protocol in an AWS Region.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable contactProtocols;

/**
 <p>The number of data points that must be not within the specified threshold to trigger the alarm. If you are setting an "M out of N" alarm, this value (<code>datapointsToAlarm</code>) is the M.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable datapointsToAlarm;

/**
 <p>The number of most recent periods over which data is compared to the specified threshold. If you are setting an "M out of N" alarm, this value (<code>evaluationPeriods</code>) is the N.</p><p>If you are setting an alarm that requires that a number of consecutive data points be breaching to trigger the alarm, this value specifies the rolling period of time in which data points are evaluated.</p><p>Each evaluation period is five minutes long. For example, specify an evaluation period of 24 to evaluate a metric over a rolling period of two hours.</p><p>You can specify a minimum valuation period of 1 (5 minutes), and a maximum evaluation period of 288 (24 hours).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable evaluationPeriods;

/**
 <p>The name of the metric to associate with the alarm.</p><p>You can configure up to two alarms per metric.</p><p>The following metrics are available for each resource type:</p><ul><li><p><b>Instances</b>: <code>BurstCapacityPercentage</code>, <code>BurstCapacityTime</code>, <code>CPUUtilization</code>, <code>NetworkIn</code>, <code>NetworkOut</code>, <code>StatusCheckFailed</code>, <code>StatusCheckFailed_Instance</code>, and <code>StatusCheckFailed_System</code>.</p></li><li><p><b>Load balancers</b>: <code>ClientTLSNegotiationErrorCount</code>, <code>HealthyHostCount</code>, <code>UnhealthyHostCount</code>, <code>HTTPCode_LB_4XX_Count</code>, <code>HTTPCode_LB_5XX_Count</code>, <code>HTTPCode_Instance_2XX_Count</code>, <code>HTTPCode_Instance_3XX_Count</code>, <code>HTTPCode_Instance_4XX_Count</code>, <code>HTTPCode_Instance_5XX_Count</code>, <code>InstanceResponseTime</code>, <code>RejectedConnectionCount</code>, and <code>RequestCount</code>.</p></li><li><p><b>Relational databases</b>: <code>CPUUtilization</code>, <code>DatabaseConnections</code>, <code>DiskQueueDepth</code>, <code>FreeStorageSpace</code>, <code>NetworkReceiveThroughput</code>, and <code>NetworkTransmitThroughput</code>.</p></li></ul><p>For more information about these metrics, see <a href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-resource-health-metrics#available-metrics">Metrics available in Lightsail</a>.</p>
 */
@property (nonatomic, assign) AWSLightsailMetricName metricName;

/**
 <p>The name of the Lightsail resource that will be monitored.</p><p>Instances, load balancers, and relational databases are the only Lightsail resources that can currently be monitored by alarms.</p>
 */
@property (nonatomic, strong) NSString * _Nullable monitoredResourceName;

/**
 <p>Indicates whether the alarm is enabled.</p><p>Notifications are enabled by default if you don't specify this parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable notificationEnabled;

/**
 <p>The alarm states that trigger a notification.</p><p>An alarm has the following possible states:</p><ul><li><p><code>ALARM</code> - The metric is outside of the defined threshold.</p></li><li><p><code>INSUFFICIENT_DATA</code> - The alarm has just started, the metric is not available, or not enough data is available for the metric to determine the alarm state.</p></li><li><p><code>OK</code> - The metric is within the defined threshold.</p></li></ul><p>When you specify a notification trigger, the <code>ALARM</code> state must be specified. The <code>INSUFFICIENT_DATA</code> and <code>OK</code> states can be specified in addition to the <code>ALARM</code> state.</p><ul><li><p>If you specify <code>OK</code> as an alarm trigger, a notification is sent when the alarm switches from an <code>ALARM</code> or <code>INSUFFICIENT_DATA</code> alarm state to an <code>OK</code> state. This can be thought of as an <i>all clear</i> alarm notification.</p></li><li><p>If you specify <code>INSUFFICIENT_DATA</code> as the alarm trigger, a notification is sent when the alarm switches from an <code>OK</code> or <code>ALARM</code> alarm state to an <code>INSUFFICIENT_DATA</code> state.</p></li></ul><p>The notification trigger defaults to <code>ALARM</code> if you don't specify this parameter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notificationTriggers;

/**
 <p>The value against which the specified statistic is compared.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable threshold;

/**
 <p>Sets how this alarm will handle missing data points.</p><p>An alarm can treat missing data in the following ways:</p><ul><li><p><code>breaching</code> - Assume the missing data is not within the threshold. Missing data counts towards the number of times the metric is not within the threshold.</p></li><li><p><code>notBreaching</code> - Assume the missing data is within the threshold. Missing data does not count towards the number of times the metric is not within the threshold.</p></li><li><p><code>ignore</code> - Ignore the missing data. Maintains the current alarm state.</p></li><li><p><code>missing</code> - Missing data is treated as missing.</p></li></ul><p>If <code>treatMissingData</code> is not specified, the default behavior of <code>missing</code> is used.</p>
 */
@property (nonatomic, assign) AWSLightsailTreatMissingData treatMissingData;

@end

/**
 
 */
@interface AWSLightsailPutAlarmResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailPutInstancePublicPortsRequest : AWSRequest


/**
 <p>The name of the instance for which to open ports.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

/**
 <p>An array of objects to describe the ports to open for the specified instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailPortInfo *> * _Nullable portInfos;

@end

/**
 
 */
@interface AWSLightsailPutInstancePublicPortsResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) AWSLightsailOperation * _Nullable operation;

@end

/**
 
 */
@interface AWSLightsailRebootInstanceRequest : AWSRequest


/**
 <p>The name of the instance to reboot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

@end

/**
 
 */
@interface AWSLightsailRebootInstanceResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailRebootRelationalDatabaseRequest : AWSRequest


/**
 <p>The name of your database to reboot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

@end

/**
 
 */
@interface AWSLightsailRebootRelationalDatabaseResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 <p>Describes the AWS Region.</p>
 */
@interface AWSLightsailRegion : AWSModel


/**
 <p>The Availability Zones. Follows the format <code>us-east-2a</code> (case-sensitive).</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailAvailabilityZone *> * _Nullable availabilityZones;

/**
 <p>The continent code (e.g., <code>NA</code>, meaning North America).</p>
 */
@property (nonatomic, strong) NSString * _Nullable continentCode;

/**
 <p>The description of the AWS Region (e.g., <code>This region is recommended to serve users in the eastern United States and eastern Canada</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The display name (e.g., <code>Ohio</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The region name (e.g., <code>us-east-2</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailRegionName name;

/**
 <p>The Availability Zones for databases. Follows the format <code>us-east-2a</code> (case-sensitive).</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailAvailabilityZone *> * _Nullable relationalDatabaseAvailabilityZones;

@end

/**
 <p>Describes a database.</p>
 */
@interface AWSLightsailRelationalDatabase : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>A Boolean value indicating whether automated backup retention is enabled for the database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable backupRetentionEnabled;

/**
 <p>The certificate associated with the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificateIdentifier;

/**
 <p>The timestamp when the database was created. Formatted in Unix time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The database software (for example, <code>MySQL</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The database engine version (for example, <code>5.7.23</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>Describes the hardware of the database.</p>
 */
@property (nonatomic, strong) AWSLightsailRelationalDatabaseHardware * _Nullable hardware;

/**
 <p>The latest point in time to which the database can be restored. Formatted in Unix time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable latestRestorableTime;

/**
 <p>The Region name and Availability Zone where the database is located.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The name of the master database created when the Lightsail database resource is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterDatabaseName;

/**
 <p>The master endpoint for the database.</p>
 */
@property (nonatomic, strong) AWSLightsailRelationalDatabaseEndpoint * _Nullable masterEndpoint;

/**
 <p>The master user name of the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUsername;

/**
 <p>The unique name of the database resource in Lightsail.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of parameter updates for the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterApplyStatus;

/**
 <p>Describes the pending maintenance actions for the database.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailPendingMaintenanceAction *> * _Nullable pendingMaintenanceActions;

/**
 <p>Describes pending database value modifications.</p>
 */
@property (nonatomic, strong) AWSLightsailPendingModifiedRelationalDatabaseValues * _Nullable pendingModifiedValues;

/**
 <p>The daily time range during which automated backups are created for the database (for example, <code>16:00-16:30</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p>The weekly time range during which system maintenance can occur on the database.</p><p>In the format <code>ddd:hh24:mi-ddd:hh24:mi</code>. For example, <code>Tue:17:00-Tue:17:30</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>A Boolean value indicating whether the database is publicly accessible.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>The blueprint ID for the database. A blueprint describes the major engine version of a database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseBlueprintId;

/**
 <p>The bundle ID for the database. A bundle describes the performance specifications for your database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseBundleId;

/**
 <p>The Lightsail resource type for the database (for example, <code>RelationalDatabase</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>Describes the secondary Availability Zone of a high availability database.</p><p>The secondary database is used for failover support of a high availability database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secondaryAvailabilityZone;

/**
 <p>Describes the current state of the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>The support code for the database. Include this code in your email to support when you have questions about a database in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportCode;

/**
 <p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail Dev Guide</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 <p>Describes a database image, or blueprint. A blueprint describes the major engine version of a database.</p>
 */
@interface AWSLightsailRelationalDatabaseBlueprint : AWSModel


/**
 <p>The ID for the database blueprint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable blueprintId;

/**
 <p>The database software of the database blueprint (for example, <code>MySQL</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailRelationalDatabaseEngine engine;

/**
 <p>The description of the database engine for the database blueprint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineDescription;

/**
 <p>The database engine version for the database blueprint (for example, <code>5.7.23</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The description of the database engine version for the database blueprint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersionDescription;

/**
 <p>A Boolean value indicating whether the engine version is the default for the database blueprint.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isEngineDefault;

@end

/**
 <p>Describes a database bundle. A bundle describes the performance specifications of the database.</p>
 */
@interface AWSLightsailRelationalDatabaseBundle : AWSModel


/**
 <p>The ID for the database bundle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 <p>The number of virtual CPUs (vCPUs) for the database bundle.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cpuCount;

/**
 <p>The size of the disk for the database bundle.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable diskSizeInGb;

/**
 <p>A Boolean value indicating whether the database bundle is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isActive;

/**
 <p>A Boolean value indicating whether the database bundle is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isEncrypted;

/**
 <p>The name for the database bundle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The cost of the database bundle in US currency.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable price;

/**
 <p>The amount of RAM in GB (for example, <code>2.0</code>) for the database bundle.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ramSizeInGb;

/**
 <p>The data transfer rate per month in GB for the database bundle.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable transferPerMonthInGb;

@end

/**
 <p>Describes an endpoint for a database.</p>
 */
@interface AWSLightsailRelationalDatabaseEndpoint : AWSModel


/**
 <p>Specifies the DNS address of the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable address;

/**
 <p>Specifies the port that the database is listening on.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

@end

/**
 <p>Describes an event for a database.</p>
 */
@interface AWSLightsailRelationalDatabaseEvent : AWSModel


/**
 <p>The timestamp when the database event was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The category that the database event belongs to.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventCategories;

/**
 <p>The message of the database event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The database that the database event relates to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

@end

/**
 <p>Describes the hardware of a database.</p>
 */
@interface AWSLightsailRelationalDatabaseHardware : AWSModel


/**
 <p>The number of vCPUs for the database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cpuCount;

/**
 <p>The size of the disk for the database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable diskSizeInGb;

/**
 <p>The amount of RAM in GB for the database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ramSizeInGb;

@end

/**
 <p>Describes the parameters of a database.</p>
 */
@interface AWSLightsailRelationalDatabaseParameter : AWSModel


/**
 <p>Specifies the valid range of values for the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allowedValues;

/**
 <p>Indicates when parameter updates are applied.</p><p>Can be <code>immediate</code> or <code>pending-reboot</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applyMethod;

/**
 <p>Specifies the engine-specific parameter type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applyType;

/**
 <p>Specifies the valid data type for the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataType;

/**
 <p>Provides a description of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A Boolean value indicating whether the parameter can be modified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isModifiable;

/**
 <p>Specifies the name of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterName;

/**
 <p>Specifies the value of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterValue;

@end

/**
 <p>Describes a database snapshot.</p>
 */
@interface AWSLightsailRelationalDatabaseSnapshot : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the database snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The timestamp when the database snapshot was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The software of the database snapshot (for example, <code>MySQL</code>)</p>
 */
@property (nonatomic, strong) NSString * _Nullable engine;

/**
 <p>The database engine version for the database snapshot (for example, <code>5.7.23</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable engineVersion;

/**
 <p>The Amazon Resource Name (ARN) of the database from which the database snapshot was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromRelationalDatabaseArn;

/**
 <p>The blueprint ID of the database from which the database snapshot was created. A blueprint describes the major engine version of a database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromRelationalDatabaseBlueprintId;

/**
 <p>The bundle ID of the database from which the database snapshot was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromRelationalDatabaseBundleId;

/**
 <p>The name of the source database from which the database snapshot was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fromRelationalDatabaseName;

/**
 <p>The Region name and Availability Zone where the database snapshot is located.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The name of the database snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The Lightsail resource type.</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>The size of the disk in GB (for example, <code>32</code>) for the database snapshot.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sizeInGb;

/**
 <p>The state of the database snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>The support code for the database snapshot. Include this code in your email to support when you have questions about a database snapshot in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportCode;

/**
 <p>The tag keys and optional values for the resource. For more information about tags in Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail Dev Guide</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLightsailReleaseStaticIpRequest : AWSRequest


/**
 <p>The name of the static IP to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable staticIpName;

@end

/**
 
 */
@interface AWSLightsailReleaseStaticIpResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 <p>Describes the resource location.</p>
 */
@interface AWSLightsailResourceLocation : AWSModel


/**
 <p>The Availability Zone. Follows the format <code>us-east-2a</code> (case-sensitive).</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The AWS Region name.</p>
 */
@property (nonatomic, assign) AWSLightsailRegionName regionName;

@end

/**
 
 */
@interface AWSLightsailSendContactMethodVerificationRequest : AWSRequest


/**
 <p>The protocol to verify, such as <code>Email</code> or <code>SMS</code> (text messaging).</p>
 */
@property (nonatomic, assign) AWSLightsailContactMethodVerificationProtocol protocols;

@end

/**
 
 */
@interface AWSLightsailSendContactMethodVerificationResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailStartInstanceRequest : AWSRequest


/**
 <p>The name of the instance (a virtual private server) to start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

@end

/**
 
 */
@interface AWSLightsailStartInstanceResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailStartRelationalDatabaseRequest : AWSRequest


/**
 <p>The name of your database to start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

@end

/**
 
 */
@interface AWSLightsailStartRelationalDatabaseResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 <p>Describes the static IP.</p>
 */
@interface AWSLightsailStaticIp : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the static IP (e.g., <code>arn:aws:lightsail:us-east-2:123456789101:StaticIp/9cbb4a9e-f8e3-4dfe-b57e-12345EXAMPLE</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The instance where the static IP is attached (e.g., <code>Amazon_Linux-1GB-Ohio-1</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachedTo;

/**
 <p>The timestamp when the static IP was created (e.g., <code>1479735304.222</code>).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The static IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddress;

/**
 <p>A Boolean value indicating whether the static IP is attached.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isAttached;

/**
 <p>The region and Availability Zone where the static IP was created.</p>
 */
@property (nonatomic, strong) AWSLightsailResourceLocation * _Nullable location;

/**
 <p>The name of the static IP (e.g., <code>StaticIP-Ohio-EXAMPLE</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The resource type (usually <code>StaticIp</code>).</p>
 */
@property (nonatomic, assign) AWSLightsailResourceType resourceType;

/**
 <p>The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportCode;

@end

/**
 
 */
@interface AWSLightsailStopInstanceRequest : AWSRequest


/**
 <p>When set to <code>True</code>, forces a Lightsail instance that is stuck in a <code>stopping</code> state to stop.</p><important><p>Only use the <code>force</code> parameter if your instance is stuck in the <code>stopping</code> state. In any other state, your instance should stop normally without adding this parameter to your API request.</p></important>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The name of the instance (a virtual private server) to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceName;

@end

/**
 
 */
@interface AWSLightsailStopInstanceResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailStopRelationalDatabaseRequest : AWSRequest


/**
 <p>The name of your database to stop.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

/**
 <p>The name of your new database snapshot to be created before stopping your database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseSnapshotName;

@end

/**
 
 */
@interface AWSLightsailStopRelationalDatabaseResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 <p>Describes a tag key and optional value assigned to an Amazon Lightsail resource.</p><p>For more information about tags in Lightsail, see the <a href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail Dev Guide</a>.</p>
 */
@interface AWSLightsailTag : AWSModel


/**
 <p>The key of the tag.</p><p>Constraints: Tag keys accept a maximum of 128 letters, numbers, spaces in UTF-8, or the following characters: + - = . _ : / @</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the tag.</p><p>Constraints: Tag values accept a maximum of 256 letters, numbers, spaces in UTF-8, or the following characters: + - = . _ : / @</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSLightsailTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource to which you want to add a tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The name of the resource to which you are adding tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

/**
 <p>The tag key and optional value.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLightsailTagResourceResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailTestAlarmRequest : AWSRequest


/**
 <p>The name of the alarm to test.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p>The alarm state to test.</p><p>An alarm has the following possible states that can be tested:</p><ul><li><p><code>ALARM</code> - The metric is outside of the defined threshold.</p></li><li><p><code>INSUFFICIENT_DATA</code> - The alarm has just started, the metric is not available, or not enough data is available for the metric to determine the alarm state.</p></li><li><p><code>OK</code> - The metric is within the defined threshold.</p></li></ul>
 */
@property (nonatomic, assign) AWSLightsailAlarmState state;

@end

/**
 
 */
@interface AWSLightsailTestAlarmResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailUnpeerVpcRequest : AWSRequest


@end

/**
 
 */
@interface AWSLightsailUnpeerVpcResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) AWSLightsailOperation * _Nullable operation;

@end

/**
 
 */
@interface AWSLightsailUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource from which you want to remove a tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The name of the resource from which you are removing a tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceName;

/**
 <p>The tag keys to delete from the specified resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSLightsailUntagResourceResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailUpdateDomainEntryRequest : AWSRequest


/**
 <p>An array of key-value pairs containing information about the domain entry.</p>
 */
@property (nonatomic, strong) AWSLightsailDomainEntry * _Nullable domainEntry;

/**
 <p>The name of the domain recordset to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSLightsailUpdateDomainEntryResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailUpdateLoadBalancerAttributeRequest : AWSRequest


/**
 <p>The name of the attribute you want to update. Valid values are below.</p>
 */
@property (nonatomic, assign) AWSLightsailLoadBalancerAttributeName attributeName;

/**
 <p>The value that you want to specify for the attribute name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

/**
 <p>The name of the load balancer that you want to modify (e.g., <code>my-load-balancer</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable loadBalancerName;

@end

/**
 
 */
@interface AWSLightsailUpdateLoadBalancerAttributeResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailUpdateRelationalDatabaseParametersRequest : AWSRequest


/**
 <p>The database parameters to update.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailRelationalDatabaseParameter *> * _Nullable parameters;

/**
 <p>The name of your database for which to update parameters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

@end

/**
 
 */
@interface AWSLightsailUpdateRelationalDatabaseParametersResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

/**
 
 */
@interface AWSLightsailUpdateRelationalDatabaseRequest : AWSRequest


/**
 <p>When <code>true</code>, applies changes immediately. When <code>false</code>, applies changes during the preferred maintenance window. Some changes may cause an outage.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable applyImmediately;

/**
 <p>Indicates the certificate that needs to be associated with the database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificateIdentifier;

/**
 <p>When <code>true</code>, disables automated backup retention for your database.</p><p>Disabling backup retention deletes all automated database backups. Before disabling this, you may want to create a snapshot of your database using the <code>create relational database snapshot</code> operation.</p><p>Updates are applied during the next maintenance window because this can result in an outage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableBackupRetention;

/**
 <p>When <code>true</code>, enables automated backup retention for your database.</p><p>Updates are applied during the next maintenance window because this can result in an outage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableBackupRetention;

/**
 <p>The password for the master user of your database. The password can include any printable ASCII character except "/", """, or "@".</p><p>Constraints: Must contain 8 to 41 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

/**
 <p>The daily time range during which automated backups are created for your database if automated backups are enabled.</p><p>Constraints:</p><ul><li><p>Must be in the <code>hh24:mi-hh24:mi</code> format.</p><p>Example: <code>16:00-16:30</code></p></li><li><p>Specified in Coordinated Universal Time (UTC).</p></li><li><p>Must not conflict with the preferred maintenance window.</p></li><li><p>Must be at least 30 minutes.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable preferredBackupWindow;

/**
 <p>The weekly time range during which system maintenance can occur on your database.</p><p>The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week.</p><p>Constraints:</p><ul><li><p>Must be in the <code>ddd:hh24:mi-ddd:hh24:mi</code> format.</p></li><li><p>Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.</p></li><li><p>Must be at least 30 minutes.</p></li><li><p>Specified in Coordinated Universal Time (UTC).</p></li><li><p>Example: <code>Tue:17:00-Tue:17:30</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMaintenanceWindow;

/**
 <p>Specifies the accessibility options for your database. A value of <code>true</code> specifies a database that is available to resources outside of your Lightsail account. A value of <code>false</code> specifies a database that is available only to your Lightsail resources in the same region as your database.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publiclyAccessible;

/**
 <p>The name of your database to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationalDatabaseName;

/**
 <p>When <code>true</code>, the master user password is changed to a new strong password generated by Lightsail.</p><p>Use the <code>get relational database master user password</code> operation to get the new password.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rotateMasterUserPassword;

@end

/**
 
 */
@interface AWSLightsailUpdateRelationalDatabaseResult : AWSModel


/**
 <p>An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSLightsailOperation *> * _Nullable operations;

@end

NS_ASSUME_NONNULL_END
