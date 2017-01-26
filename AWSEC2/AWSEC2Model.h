//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

FOUNDATION_EXPORT NSString *const AWSEC2ErrorDomain;

typedef NS_ENUM(NSInteger, AWSEC2ErrorType) {
    AWSEC2ErrorUnknown,
};

typedef NS_ENUM(NSInteger, AWSEC2AccountAttributeName) {
    AWSEC2AccountAttributeNameUnknown,
    AWSEC2AccountAttributeNameSupportedPlatforms,
    AWSEC2AccountAttributeNameDefaultVPC,
};

typedef NS_ENUM(NSInteger, AWSEC2Affinity) {
    AWSEC2AffinityUnknown,
    AWSEC2AffinityDefault,
    AWSEC2AffinityHost,
};

typedef NS_ENUM(NSInteger, AWSEC2AllocationState) {
    AWSEC2AllocationStateUnknown,
    AWSEC2AllocationStateAvailable,
    AWSEC2AllocationStateUnderAssessment,
    AWSEC2AllocationStatePermanentFailure,
    AWSEC2AllocationStateReleased,
    AWSEC2AllocationStateReleasedPermanentFailure,
};

typedef NS_ENUM(NSInteger, AWSEC2AllocationStrategy) {
    AWSEC2AllocationStrategyUnknown,
    AWSEC2AllocationStrategyLowestPrice,
    AWSEC2AllocationStrategyDiversified,
};

typedef NS_ENUM(NSInteger, AWSEC2ArchitectureValues) {
    AWSEC2ArchitectureValuesUnknown,
    AWSEC2ArchitectureValuesI386,
    AWSEC2ArchitectureValuesX86_64,
};

typedef NS_ENUM(NSInteger, AWSEC2AttachmentStatus) {
    AWSEC2AttachmentStatusUnknown,
    AWSEC2AttachmentStatusAttaching,
    AWSEC2AttachmentStatusAttached,
    AWSEC2AttachmentStatusDetaching,
    AWSEC2AttachmentStatusDetached,
};

typedef NS_ENUM(NSInteger, AWSEC2AutoPlacement) {
    AWSEC2AutoPlacementUnknown,
    AWSEC2AutoPlacementOn,
    AWSEC2AutoPlacementOff,
};

typedef NS_ENUM(NSInteger, AWSEC2AvailabilityZoneState) {
    AWSEC2AvailabilityZoneStateUnknown,
    AWSEC2AvailabilityZoneStateAvailable,
    AWSEC2AvailabilityZoneStateInformation,
    AWSEC2AvailabilityZoneStateImpaired,
    AWSEC2AvailabilityZoneStateUnavailable,
};

typedef NS_ENUM(NSInteger, AWSEC2BatchState) {
    AWSEC2BatchStateUnknown,
    AWSEC2BatchStateSubmitted,
    AWSEC2BatchStateActive,
    AWSEC2BatchStateCancelled,
    AWSEC2BatchStateFailed,
    AWSEC2BatchStateCancelledRunning,
    AWSEC2BatchStateCancelledTerminating,
    AWSEC2BatchStateModifying,
};

typedef NS_ENUM(NSInteger, AWSEC2BundleTaskState) {
    AWSEC2BundleTaskStateUnknown,
    AWSEC2BundleTaskStatePending,
    AWSEC2BundleTaskStateWaitingForShutdown,
    AWSEC2BundleTaskStateBundling,
    AWSEC2BundleTaskStateStoring,
    AWSEC2BundleTaskStateCancelling,
    AWSEC2BundleTaskStateComplete,
    AWSEC2BundleTaskStateFailed,
};

typedef NS_ENUM(NSInteger, AWSEC2CancelBatchErrorCode) {
    AWSEC2CancelBatchErrorCodeUnknown,
    AWSEC2CancelBatchErrorCodeFleetRequestIdDoesNotExist,
    AWSEC2CancelBatchErrorCodeFleetRequestIdMalformed,
    AWSEC2CancelBatchErrorCodeFleetRequestNotInCancellableState,
    AWSEC2CancelBatchErrorCodeUnexpectedError,
};

typedef NS_ENUM(NSInteger, AWSEC2CancelSpotInstanceRequestState) {
    AWSEC2CancelSpotInstanceRequestStateUnknown,
    AWSEC2CancelSpotInstanceRequestStateActive,
    AWSEC2CancelSpotInstanceRequestStateOpen,
    AWSEC2CancelSpotInstanceRequestStateClosed,
    AWSEC2CancelSpotInstanceRequestStateCancelled,
    AWSEC2CancelSpotInstanceRequestStateCompleted,
};

typedef NS_ENUM(NSInteger, AWSEC2ContainerFormat) {
    AWSEC2ContainerFormatUnknown,
    AWSEC2ContainerFormatOVA,
};

typedef NS_ENUM(NSInteger, AWSEC2ConversionTaskState) {
    AWSEC2ConversionTaskStateUnknown,
    AWSEC2ConversionTaskStateActive,
    AWSEC2ConversionTaskStateCancelling,
    AWSEC2ConversionTaskStateCancelled,
    AWSEC2ConversionTaskStateCompleted,
};

typedef NS_ENUM(NSInteger, AWSEC2CurrencyCodeValues) {
    AWSEC2CurrencyCodeValuesUnknown,
    AWSEC2CurrencyCodeValuesUSD,
};

typedef NS_ENUM(NSInteger, AWSEC2DatafeedSubscriptionState) {
    AWSEC2DatafeedSubscriptionStateUnknown,
    AWSEC2DatafeedSubscriptionStateActive,
    AWSEC2DatafeedSubscriptionStateInactive,
};

typedef NS_ENUM(NSInteger, AWSEC2DeviceType) {
    AWSEC2DeviceTypeUnknown,
    AWSEC2DeviceTypeEBS,
    AWSEC2DeviceTypeInstanceStore,
};

typedef NS_ENUM(NSInteger, AWSEC2DiskImageFormat) {
    AWSEC2DiskImageFormatUnknown,
    AWSEC2DiskImageFormatVMDK,
    AWSEC2DiskImageFormatRAW,
    AWSEC2DiskImageFormatVHD,
};

typedef NS_ENUM(NSInteger, AWSEC2DomainType) {
    AWSEC2DomainTypeUnknown,
    AWSEC2DomainTypeVPC,
    AWSEC2DomainTypeStandard,
};

typedef NS_ENUM(NSInteger, AWSEC2EventCode) {
    AWSEC2EventCodeUnknown,
    AWSEC2EventCodeInstanceReboot,
    AWSEC2EventCodeSystemReboot,
    AWSEC2EventCodeSystemMaintenance,
    AWSEC2EventCodeInstanceRetirement,
    AWSEC2EventCodeInstanceStop,
};

typedef NS_ENUM(NSInteger, AWSEC2EventType) {
    AWSEC2EventTypeUnknown,
    AWSEC2EventTypeInstanceChange,
    AWSEC2EventTypeFleetRequestChange,
    AWSEC2EventTypeError,
};

typedef NS_ENUM(NSInteger, AWSEC2ExcessCapacityTerminationPolicy) {
    AWSEC2ExcessCapacityTerminationPolicyUnknown,
    AWSEC2ExcessCapacityTerminationPolicyNoTermination,
    AWSEC2ExcessCapacityTerminationPolicyDefault,
};

typedef NS_ENUM(NSInteger, AWSEC2ExportEnvironment) {
    AWSEC2ExportEnvironmentUnknown,
    AWSEC2ExportEnvironmentCitrix,
    AWSEC2ExportEnvironmentVMware,
    AWSEC2ExportEnvironmentMicrosoft,
};

typedef NS_ENUM(NSInteger, AWSEC2ExportTaskState) {
    AWSEC2ExportTaskStateUnknown,
    AWSEC2ExportTaskStateActive,
    AWSEC2ExportTaskStateCancelling,
    AWSEC2ExportTaskStateCancelled,
    AWSEC2ExportTaskStateCompleted,
};

typedef NS_ENUM(NSInteger, AWSEC2FlowLogsResourceType) {
    AWSEC2FlowLogsResourceTypeUnknown,
    AWSEC2FlowLogsResourceTypeVpc,
    AWSEC2FlowLogsResourceTypeSubnet,
    AWSEC2FlowLogsResourceTypeNetworkInterface,
};

typedef NS_ENUM(NSInteger, AWSEC2GatewayType) {
    AWSEC2GatewayTypeUnknown,
    AWSEC2GatewayTypeIpsec1,
};

typedef NS_ENUM(NSInteger, AWSEC2HostTenancy) {
    AWSEC2HostTenancyUnknown,
    AWSEC2HostTenancyDedicated,
    AWSEC2HostTenancyHost,
};

typedef NS_ENUM(NSInteger, AWSEC2HypervisorType) {
    AWSEC2HypervisorTypeUnknown,
    AWSEC2HypervisorTypeOvm,
    AWSEC2HypervisorTypeXen,
};

typedef NS_ENUM(NSInteger, AWSEC2ImageAttributeName) {
    AWSEC2ImageAttributeNameUnknown,
    AWSEC2ImageAttributeNameDescription,
    AWSEC2ImageAttributeNameKernel,
    AWSEC2ImageAttributeNameRAMDisk,
    AWSEC2ImageAttributeNameLaunchPermission,
    AWSEC2ImageAttributeNameProductCodes,
    AWSEC2ImageAttributeNameBlockDeviceMapping,
    AWSEC2ImageAttributeNameSriovNetSupport,
};

typedef NS_ENUM(NSInteger, AWSEC2ImageState) {
    AWSEC2ImageStateUnknown,
    AWSEC2ImageStatePending,
    AWSEC2ImageStateAvailable,
    AWSEC2ImageStateInvalid,
    AWSEC2ImageStateDeregistered,
    AWSEC2ImageStateTransient,
    AWSEC2ImageStateFailed,
    AWSEC2ImageStateError,
};

typedef NS_ENUM(NSInteger, AWSEC2ImageTypeValues) {
    AWSEC2ImageTypeValuesUnknown,
    AWSEC2ImageTypeValuesMachine,
    AWSEC2ImageTypeValuesKernel,
    AWSEC2ImageTypeValuesRAMDisk,
};

typedef NS_ENUM(NSInteger, AWSEC2InstanceAttributeName) {
    AWSEC2InstanceAttributeNameUnknown,
    AWSEC2InstanceAttributeNameInstanceType,
    AWSEC2InstanceAttributeNameKernel,
    AWSEC2InstanceAttributeNameRAMDisk,
    AWSEC2InstanceAttributeNameUserData,
    AWSEC2InstanceAttributeNameDisableApiTermination,
    AWSEC2InstanceAttributeNameInstanceInitiatedShutdownBehavior,
    AWSEC2InstanceAttributeNameRootDeviceName,
    AWSEC2InstanceAttributeNameBlockDeviceMapping,
    AWSEC2InstanceAttributeNameProductCodes,
    AWSEC2InstanceAttributeNameSourceDestCheck,
    AWSEC2InstanceAttributeNameGroupSet,
    AWSEC2InstanceAttributeNameEBSOptimized,
    AWSEC2InstanceAttributeNameSriovNetSupport,
};

typedef NS_ENUM(NSInteger, AWSEC2InstanceLifecycleType) {
    AWSEC2InstanceLifecycleTypeUnknown,
    AWSEC2InstanceLifecycleTypeSpot,
    AWSEC2InstanceLifecycleTypeScheduled,
};

typedef NS_ENUM(NSInteger, AWSEC2InstanceStateName) {
    AWSEC2InstanceStateNameUnknown,
    AWSEC2InstanceStateNamePending,
    AWSEC2InstanceStateNameRunning,
    AWSEC2InstanceStateNameShuttingDown,
    AWSEC2InstanceStateNameTerminated,
    AWSEC2InstanceStateNameStopping,
    AWSEC2InstanceStateNameStopped,
};

typedef NS_ENUM(NSInteger, AWSEC2InstanceType) {
    AWSEC2InstanceTypeUnknown,
    AWSEC2InstanceTypeT1_micro,
    AWSEC2InstanceTypeM1_small,
    AWSEC2InstanceTypeM1_medium,
    AWSEC2InstanceTypeM1_large,
    AWSEC2InstanceTypeM1_xlarge,
    AWSEC2InstanceTypeM3_medium,
    AWSEC2InstanceTypeM3_large,
    AWSEC2InstanceTypeM3_xlarge,
    AWSEC2InstanceTypeM3_2xlarge,
    AWSEC2InstanceTypeM4_large,
    AWSEC2InstanceTypeM4_xlarge,
    AWSEC2InstanceTypeM4_2xlarge,
    AWSEC2InstanceTypeM4_4xlarge,
    AWSEC2InstanceTypeM4_10xlarge,
    AWSEC2InstanceTypeT2_nano,
    AWSEC2InstanceTypeT2_micro,
    AWSEC2InstanceTypeT2_small,
    AWSEC2InstanceTypeT2_medium,
    AWSEC2InstanceTypeT2_large,
    AWSEC2InstanceTypeM2_xlarge,
    AWSEC2InstanceTypeM2_2xlarge,
    AWSEC2InstanceTypeM2_4xlarge,
    AWSEC2InstanceTypeCR1_8xlarge,
    AWSEC2InstanceTypeI2_xlarge,
    AWSEC2InstanceTypeI2_2xlarge,
    AWSEC2InstanceTypeI2_4xlarge,
    AWSEC2InstanceTypeI2_8xlarge,
    AWSEC2InstanceTypeHI1_4xlarge,
    AWSEC2InstanceTypeHS1_8xlarge,
    AWSEC2InstanceTypeC1_medium,
    AWSEC2InstanceTypeC1_xlarge,
    AWSEC2InstanceTypeC3_large,
    AWSEC2InstanceTypeC3_xlarge,
    AWSEC2InstanceTypeC3_2xlarge,
    AWSEC2InstanceTypeC3_4xlarge,
    AWSEC2InstanceTypeC3_8xlarge,
    AWSEC2InstanceTypeC4_large,
    AWSEC2InstanceTypeC4_xlarge,
    AWSEC2InstanceTypeC4_2xlarge,
    AWSEC2InstanceTypeC4_4xlarge,
    AWSEC2InstanceTypeC4_8xlarge,
    AWSEC2InstanceTypeCC1_4xlarge,
    AWSEC2InstanceTypeCC2_8xlarge,
    AWSEC2InstanceTypeG2_2xlarge,
    AWSEC2InstanceTypeG2_8xlarge,
    AWSEC2InstanceTypeCG1_4xlarge,
    AWSEC2InstanceTypeR3_large,
    AWSEC2InstanceTypeR3_xlarge,
    AWSEC2InstanceTypeR3_2xlarge,
    AWSEC2InstanceTypeR3_4xlarge,
    AWSEC2InstanceTypeR3_8xlarge,
    AWSEC2InstanceTypeD2_xlarge,
    AWSEC2InstanceTypeD2_2xlarge,
    AWSEC2InstanceTypeD2_4xlarge,
    AWSEC2InstanceTypeD2_8xlarge,
};

typedef NS_ENUM(NSInteger, AWSEC2ListingState) {
    AWSEC2ListingStateUnknown,
    AWSEC2ListingStateAvailable,
    AWSEC2ListingStateSold,
    AWSEC2ListingStateCancelled,
    AWSEC2ListingStatePending,
};

typedef NS_ENUM(NSInteger, AWSEC2ListingStatus) {
    AWSEC2ListingStatusUnknown,
    AWSEC2ListingStatusActive,
    AWSEC2ListingStatusPending,
    AWSEC2ListingStatusCancelled,
    AWSEC2ListingStatusClosed,
};

typedef NS_ENUM(NSInteger, AWSEC2MonitoringState) {
    AWSEC2MonitoringStateUnknown,
    AWSEC2MonitoringStateDisabled,
    AWSEC2MonitoringStateDisabling,
    AWSEC2MonitoringStateEnabled,
    AWSEC2MonitoringStatePending,
};

typedef NS_ENUM(NSInteger, AWSEC2MoveStatus) {
    AWSEC2MoveStatusUnknown,
    AWSEC2MoveStatusMovingToVpc,
    AWSEC2MoveStatusRestoringToClassic,
};

typedef NS_ENUM(NSInteger, AWSEC2NatGatewayState) {
    AWSEC2NatGatewayStateUnknown,
    AWSEC2NatGatewayStatePending,
    AWSEC2NatGatewayStateFailed,
    AWSEC2NatGatewayStateAvailable,
    AWSEC2NatGatewayStateDeleting,
    AWSEC2NatGatewayStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSEC2NetworkInterfaceAttribute) {
    AWSEC2NetworkInterfaceAttributeUnknown,
    AWSEC2NetworkInterfaceAttributeDescription,
    AWSEC2NetworkInterfaceAttributeGroupSet,
    AWSEC2NetworkInterfaceAttributeSourceDestCheck,
    AWSEC2NetworkInterfaceAttributeAttachment,
};

typedef NS_ENUM(NSInteger, AWSEC2NetworkInterfaceStatus) {
    AWSEC2NetworkInterfaceStatusUnknown,
    AWSEC2NetworkInterfaceStatusAvailable,
    AWSEC2NetworkInterfaceStatusAttaching,
    AWSEC2NetworkInterfaceStatusInUse,
    AWSEC2NetworkInterfaceStatusDetaching,
};

typedef NS_ENUM(NSInteger, AWSEC2NetworkInterfaceType) {
    AWSEC2NetworkInterfaceTypeUnknown,
    AWSEC2NetworkInterfaceTypeInterface,
    AWSEC2NetworkInterfaceTypeNatGateway,
};

typedef NS_ENUM(NSInteger, AWSEC2OfferingTypeValues) {
    AWSEC2OfferingTypeValuesUnknown,
    AWSEC2OfferingTypeValuesHeavyUtilization,
    AWSEC2OfferingTypeValuesMediumUtilization,
    AWSEC2OfferingTypeValuesLightUtilization,
    AWSEC2OfferingTypeValuesNoUpfront,
    AWSEC2OfferingTypeValuesPartialUpfront,
    AWSEC2OfferingTypeValuesAllUpfront,
};

typedef NS_ENUM(NSInteger, AWSEC2OperationType) {
    AWSEC2OperationTypeUnknown,
    AWSEC2OperationTypeAdd,
    AWSEC2OperationTypeRemove,
};

typedef NS_ENUM(NSInteger, AWSEC2PermissionGroup) {
    AWSEC2PermissionGroupUnknown,
    AWSEC2PermissionGroupAll,
};

typedef NS_ENUM(NSInteger, AWSEC2PlacementGroupState) {
    AWSEC2PlacementGroupStateUnknown,
    AWSEC2PlacementGroupStatePending,
    AWSEC2PlacementGroupStateAvailable,
    AWSEC2PlacementGroupStateDeleting,
    AWSEC2PlacementGroupStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSEC2PlacementStrategy) {
    AWSEC2PlacementStrategyUnknown,
    AWSEC2PlacementStrategyCluster,
};

typedef NS_ENUM(NSInteger, AWSEC2PlatformValues) {
    AWSEC2PlatformValuesUnknown,
    AWSEC2PlatformValuesWindows,
};

typedef NS_ENUM(NSInteger, AWSEC2ProductCodeValues) {
    AWSEC2ProductCodeValuesUnknown,
    AWSEC2ProductCodeValuesDevpay,
    AWSEC2ProductCodeValuesMarketplace,
};

typedef NS_ENUM(NSInteger, AWSEC2RIProductDescription) {
    AWSEC2RIProductDescriptionUnknown,
    AWSEC2RIProductDescriptionLinuxUNIX,
    AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC,
    AWSEC2RIProductDescriptionWindows,
    AWSEC2RIProductDescriptionWindowsAmazonVPC,
};

typedef NS_ENUM(NSInteger, AWSEC2RecurringChargeFrequency) {
    AWSEC2RecurringChargeFrequencyUnknown,
    AWSEC2RecurringChargeFrequencyHourly,
};

typedef NS_ENUM(NSInteger, AWSEC2ReportInstanceReasonCodes) {
    AWSEC2ReportInstanceReasonCodesUnknown,
    AWSEC2ReportInstanceReasonCodesInstanceStuckInState,
    AWSEC2ReportInstanceReasonCodesUnresponsive,
    AWSEC2ReportInstanceReasonCodesNotAcceptingCredentials,
    AWSEC2ReportInstanceReasonCodesPasswordNotAvailable,
    AWSEC2ReportInstanceReasonCodesPerformanceNetwork,
    AWSEC2ReportInstanceReasonCodesPerformanceInstanceStore,
    AWSEC2ReportInstanceReasonCodesPerformanceEBSVolume,
    AWSEC2ReportInstanceReasonCodesPerformanceOther,
    AWSEC2ReportInstanceReasonCodesOther,
};

typedef NS_ENUM(NSInteger, AWSEC2ReportStatusType) {
    AWSEC2ReportStatusTypeUnknown,
    AWSEC2ReportStatusTypeOK,
    AWSEC2ReportStatusTypeImpaired,
};

typedef NS_ENUM(NSInteger, AWSEC2ReservedInstanceState) {
    AWSEC2ReservedInstanceStateUnknown,
    AWSEC2ReservedInstanceStatePaymentPending,
    AWSEC2ReservedInstanceStateActive,
    AWSEC2ReservedInstanceStatePaymentFailed,
    AWSEC2ReservedInstanceStateRetired,
};

typedef NS_ENUM(NSInteger, AWSEC2ResetImageAttributeName) {
    AWSEC2ResetImageAttributeNameUnknown,
    AWSEC2ResetImageAttributeNameLaunchPermission,
};

typedef NS_ENUM(NSInteger, AWSEC2ResourceType) {
    AWSEC2ResourceTypeUnknown,
    AWSEC2ResourceTypeCustomerGateway,
    AWSEC2ResourceTypeDHCPOptions,
    AWSEC2ResourceTypeImage,
    AWSEC2ResourceTypeInstance,
    AWSEC2ResourceTypeInternetGateway,
    AWSEC2ResourceTypeNetworkACL,
    AWSEC2ResourceTypeNetworkInterface,
    AWSEC2ResourceTypeReservedInstances,
    AWSEC2ResourceTypeRouteTable,
    AWSEC2ResourceTypeSnapshot,
    AWSEC2ResourceTypeSpotInstancesRequest,
    AWSEC2ResourceTypeSubnet,
    AWSEC2ResourceTypeSecurityGroup,
    AWSEC2ResourceTypeVolume,
    AWSEC2ResourceTypeVPC,
    AWSEC2ResourceTypeVpnConnection,
    AWSEC2ResourceTypeVpnGateway,
};

typedef NS_ENUM(NSInteger, AWSEC2RouteOrigin) {
    AWSEC2RouteOriginUnknown,
    AWSEC2RouteOriginCreateRouteTable,
    AWSEC2RouteOriginCreateRoute,
    AWSEC2RouteOriginEnableVgwRoutePropagation,
};

typedef NS_ENUM(NSInteger, AWSEC2RouteState) {
    AWSEC2RouteStateUnknown,
    AWSEC2RouteStateActive,
    AWSEC2RouteStateBlackhole,
};

typedef NS_ENUM(NSInteger, AWSEC2RuleAction) {
    AWSEC2RuleActionUnknown,
    AWSEC2RuleActionAllow,
    AWSEC2RuleActionDeny,
};

typedef NS_ENUM(NSInteger, AWSEC2ShutdownBehavior) {
    AWSEC2ShutdownBehaviorUnknown,
    AWSEC2ShutdownBehaviorStop,
    AWSEC2ShutdownBehaviorTerminate,
};

typedef NS_ENUM(NSInteger, AWSEC2SnapshotAttributeName) {
    AWSEC2SnapshotAttributeNameUnknown,
    AWSEC2SnapshotAttributeNameProductCodes,
    AWSEC2SnapshotAttributeNameCreateVolumePermission,
};

typedef NS_ENUM(NSInteger, AWSEC2SnapshotState) {
    AWSEC2SnapshotStateUnknown,
    AWSEC2SnapshotStatePending,
    AWSEC2SnapshotStateCompleted,
    AWSEC2SnapshotStateError,
};

typedef NS_ENUM(NSInteger, AWSEC2SpotInstanceState) {
    AWSEC2SpotInstanceStateUnknown,
    AWSEC2SpotInstanceStateOpen,
    AWSEC2SpotInstanceStateActive,
    AWSEC2SpotInstanceStateClosed,
    AWSEC2SpotInstanceStateCancelled,
    AWSEC2SpotInstanceStateFailed,
};

typedef NS_ENUM(NSInteger, AWSEC2SpotInstanceType) {
    AWSEC2SpotInstanceTypeUnknown,
    AWSEC2SpotInstanceTypeOneTime,
    AWSEC2SpotInstanceTypePersistent,
};

typedef NS_ENUM(NSInteger, AWSEC2State) {
    AWSEC2StateUnknown,
    AWSEC2StatePending,
    AWSEC2StateAvailable,
    AWSEC2StateDeleting,
    AWSEC2StateDeleted,
};

typedef NS_ENUM(NSInteger, AWSEC2Status) {
    AWSEC2StatusUnknown,
    AWSEC2StatusMoveInProgress,
    AWSEC2StatusInVpc,
    AWSEC2StatusInClassic,
};

typedef NS_ENUM(NSInteger, AWSEC2StatusName) {
    AWSEC2StatusNameUnknown,
    AWSEC2StatusNameReachability,
};

typedef NS_ENUM(NSInteger, AWSEC2StatusType) {
    AWSEC2StatusTypeUnknown,
    AWSEC2StatusTypePassed,
    AWSEC2StatusTypeFailed,
    AWSEC2StatusTypeInsufficientData,
    AWSEC2StatusTypeInitializing,
};

typedef NS_ENUM(NSInteger, AWSEC2SubnetState) {
    AWSEC2SubnetStateUnknown,
    AWSEC2SubnetStatePending,
    AWSEC2SubnetStateAvailable,
};

typedef NS_ENUM(NSInteger, AWSEC2SummaryStatus) {
    AWSEC2SummaryStatusUnknown,
    AWSEC2SummaryStatusOK,
    AWSEC2SummaryStatusImpaired,
    AWSEC2SummaryStatusInsufficientData,
    AWSEC2SummaryStatusNotApplicable,
    AWSEC2SummaryStatusInitializing,
};

typedef NS_ENUM(NSInteger, AWSEC2TelemetryStatus) {
    AWSEC2TelemetryStatusUnknown,
    AWSEC2TelemetryStatusUp,
    AWSEC2TelemetryStatusDown,
};

typedef NS_ENUM(NSInteger, AWSEC2Tenancy) {
    AWSEC2TenancyUnknown,
    AWSEC2TenancyDefault,
    AWSEC2TenancyDedicated,
    AWSEC2TenancyHost,
};

typedef NS_ENUM(NSInteger, AWSEC2TrafficType) {
    AWSEC2TrafficTypeUnknown,
    AWSEC2TrafficTypeAccept,
    AWSEC2TrafficTypeReject,
    AWSEC2TrafficTypeAll,
};

typedef NS_ENUM(NSInteger, AWSEC2VirtualizationType) {
    AWSEC2VirtualizationTypeUnknown,
    AWSEC2VirtualizationTypeHVM,
    AWSEC2VirtualizationTypeParavirtual,
};

typedef NS_ENUM(NSInteger, AWSEC2VolumeAttachmentState) {
    AWSEC2VolumeAttachmentStateUnknown,
    AWSEC2VolumeAttachmentStateAttaching,
    AWSEC2VolumeAttachmentStateAttached,
    AWSEC2VolumeAttachmentStateDetaching,
    AWSEC2VolumeAttachmentStateDetached,
};

typedef NS_ENUM(NSInteger, AWSEC2VolumeAttributeName) {
    AWSEC2VolumeAttributeNameUnknown,
    AWSEC2VolumeAttributeNameAutoEnableIO,
    AWSEC2VolumeAttributeNameProductCodes,
};

typedef NS_ENUM(NSInteger, AWSEC2VolumeState) {
    AWSEC2VolumeStateUnknown,
    AWSEC2VolumeStateCreating,
    AWSEC2VolumeStateAvailable,
    AWSEC2VolumeStateInUse,
    AWSEC2VolumeStateDeleting,
    AWSEC2VolumeStateDeleted,
    AWSEC2VolumeStateError,
};

typedef NS_ENUM(NSInteger, AWSEC2VolumeStatusInfoStatus) {
    AWSEC2VolumeStatusInfoStatusUnknown,
    AWSEC2VolumeStatusInfoStatusOK,
    AWSEC2VolumeStatusInfoStatusImpaired,
    AWSEC2VolumeStatusInfoStatusInsufficientData,
};

typedef NS_ENUM(NSInteger, AWSEC2VolumeStatusName) {
    AWSEC2VolumeStatusNameUnknown,
    AWSEC2VolumeStatusNameIoEnabled,
    AWSEC2VolumeStatusNameIoPerformance,
};

typedef NS_ENUM(NSInteger, AWSEC2VolumeType) {
    AWSEC2VolumeTypeUnknown,
    AWSEC2VolumeTypeStandard,
    AWSEC2VolumeTypeIO1,
    AWSEC2VolumeTypeGp2,
    AWSEC2VolumeTypeSc1,
    AWSEC2VolumeTypeSt1,
};

typedef NS_ENUM(NSInteger, AWSEC2VpcAttributeName) {
    AWSEC2VpcAttributeNameUnknown,
    AWSEC2VpcAttributeNameEnableDNSSupport,
    AWSEC2VpcAttributeNameEnableDNSHostnames,
};

typedef NS_ENUM(NSInteger, AWSEC2VpcPeeringConnectionStateReasonCode) {
    AWSEC2VpcPeeringConnectionStateReasonCodeUnknown,
    AWSEC2VpcPeeringConnectionStateReasonCodeInitiatingRequest,
    AWSEC2VpcPeeringConnectionStateReasonCodePendingAcceptance,
    AWSEC2VpcPeeringConnectionStateReasonCodeActive,
    AWSEC2VpcPeeringConnectionStateReasonCodeDeleted,
    AWSEC2VpcPeeringConnectionStateReasonCodeRejected,
    AWSEC2VpcPeeringConnectionStateReasonCodeFailed,
    AWSEC2VpcPeeringConnectionStateReasonCodeExpired,
    AWSEC2VpcPeeringConnectionStateReasonCodeProvisioning,
    AWSEC2VpcPeeringConnectionStateReasonCodeDeleting,
};

typedef NS_ENUM(NSInteger, AWSEC2VpcState) {
    AWSEC2VpcStateUnknown,
    AWSEC2VpcStatePending,
    AWSEC2VpcStateAvailable,
};

typedef NS_ENUM(NSInteger, AWSEC2VpnState) {
    AWSEC2VpnStateUnknown,
    AWSEC2VpnStatePending,
    AWSEC2VpnStateAvailable,
    AWSEC2VpnStateDeleting,
    AWSEC2VpnStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSEC2VpnStaticRouteSource) {
    AWSEC2VpnStaticRouteSourceUnknown,
    AWSEC2VpnStaticRouteSourceStatic,
};

@class AWSEC2AcceptVpcPeeringConnectionRequest;
@class AWSEC2AcceptVpcPeeringConnectionResult;
@class AWSEC2AccountAttribute;
@class AWSEC2AccountAttributeValue;
@class AWSEC2ActiveInstance;
@class AWSEC2Address;
@class AWSEC2AllocateAddressRequest;
@class AWSEC2AllocateAddressResult;
@class AWSEC2AllocateHostsRequest;
@class AWSEC2AllocateHostsResult;
@class AWSEC2AssignPrivateIpAddressesRequest;
@class AWSEC2AssociateAddressRequest;
@class AWSEC2AssociateAddressResult;
@class AWSEC2AssociateDhcpOptionsRequest;
@class AWSEC2AssociateRouteTableRequest;
@class AWSEC2AssociateRouteTableResult;
@class AWSEC2AttachClassicLinkVpcRequest;
@class AWSEC2AttachClassicLinkVpcResult;
@class AWSEC2AttachInternetGatewayRequest;
@class AWSEC2AttachNetworkInterfaceRequest;
@class AWSEC2AttachNetworkInterfaceResult;
@class AWSEC2AttachVolumeRequest;
@class AWSEC2AttachVpnGatewayRequest;
@class AWSEC2AttachVpnGatewayResult;
@class AWSEC2AttributeBooleanValue;
@class AWSEC2AttributeValue;
@class AWSEC2AuthorizeSecurityGroupEgressRequest;
@class AWSEC2AuthorizeSecurityGroupIngressRequest;
@class AWSEC2AvailabilityZone;
@class AWSEC2AvailabilityZoneMessage;
@class AWSEC2AvailableCapacity;
@class AWSEC2BlobAttributeValue;
@class AWSEC2BlockDeviceMapping;
@class AWSEC2BundleInstanceRequest;
@class AWSEC2BundleInstanceResult;
@class AWSEC2BundleTask;
@class AWSEC2BundleTaskError;
@class AWSEC2CancelBundleTaskRequest;
@class AWSEC2CancelBundleTaskResult;
@class AWSEC2CancelConversionRequest;
@class AWSEC2CancelExportTaskRequest;
@class AWSEC2CancelImportTaskRequest;
@class AWSEC2CancelImportTaskResult;
@class AWSEC2CancelReservedInstancesListingRequest;
@class AWSEC2CancelReservedInstancesListingResult;
@class AWSEC2CancelSpotFleetRequestsError;
@class AWSEC2CancelSpotFleetRequestsErrorItem;
@class AWSEC2CancelSpotFleetRequestsRequest;
@class AWSEC2CancelSpotFleetRequestsResponse;
@class AWSEC2CancelSpotFleetRequestsSuccessItem;
@class AWSEC2CancelSpotInstanceRequestsRequest;
@class AWSEC2CancelSpotInstanceRequestsResult;
@class AWSEC2CancelledSpotInstanceRequest;
@class AWSEC2ClassicLinkDnsSupport;
@class AWSEC2ClassicLinkInstance;
@class AWSEC2ClientData;
@class AWSEC2ConfirmProductInstanceRequest;
@class AWSEC2ConfirmProductInstanceResult;
@class AWSEC2ConversionTask;
@class AWSEC2ReplicateImageRequest;
@class AWSEC2ReplicateImageResult;
@class AWSEC2ReplicateSnapshotRequest;
@class AWSEC2ReplicateSnapshotResult;
@class AWSEC2CreateCustomerGatewayRequest;
@class AWSEC2CreateCustomerGatewayResult;
@class AWSEC2CreateDhcpOptionsRequest;
@class AWSEC2CreateDhcpOptionsResult;
@class AWSEC2CreateFlowLogsRequest;
@class AWSEC2CreateFlowLogsResult;
@class AWSEC2CreateImageRequest;
@class AWSEC2CreateImageResult;
@class AWSEC2CreateInstanceExportTaskRequest;
@class AWSEC2CreateInstanceExportTaskResult;
@class AWSEC2CreateInternetGatewayRequest;
@class AWSEC2CreateInternetGatewayResult;
@class AWSEC2CreateKeyPairRequest;
@class AWSEC2CreateNatGatewayRequest;
@class AWSEC2CreateNatGatewayResult;
@class AWSEC2CreateNetworkAclEntryRequest;
@class AWSEC2CreateNetworkAclRequest;
@class AWSEC2CreateNetworkAclResult;
@class AWSEC2CreateNetworkInterfaceRequest;
@class AWSEC2CreateNetworkInterfaceResult;
@class AWSEC2CreatePlacementGroupRequest;
@class AWSEC2CreateReservedInstancesListingRequest;
@class AWSEC2CreateReservedInstancesListingResult;
@class AWSEC2CreateRouteRequest;
@class AWSEC2CreateRouteResult;
@class AWSEC2CreateRouteTableRequest;
@class AWSEC2CreateRouteTableResult;
@class AWSEC2CreateSecurityGroupRequest;
@class AWSEC2CreateSecurityGroupResult;
@class AWSEC2CreateSnapshotRequest;
@class AWSEC2CreateSpotDatafeedSubscriptionRequest;
@class AWSEC2CreateSpotDatafeedSubscriptionResult;
@class AWSEC2CreateSubnetRequest;
@class AWSEC2CreateSubnetResult;
@class AWSEC2CreateTagsRequest;
@class AWSEC2CreateVolumePermission;
@class AWSEC2CreateVolumePermissionModifications;
@class AWSEC2CreateVolumeRequest;
@class AWSEC2CreateVpcEndpointRequest;
@class AWSEC2CreateVpcEndpointResult;
@class AWSEC2CreateVpcPeeringConnectionRequest;
@class AWSEC2CreateVpcPeeringConnectionResult;
@class AWSEC2CreateVpcRequest;
@class AWSEC2CreateVpcResult;
@class AWSEC2CreateVpnConnectionRequest;
@class AWSEC2CreateVpnConnectionResult;
@class AWSEC2CreateVpnConnectionRouteRequest;
@class AWSEC2CreateVpnGatewayRequest;
@class AWSEC2CreateVpnGatewayResult;
@class AWSEC2CustomerGateway;
@class AWSEC2DeleteCustomerGatewayRequest;
@class AWSEC2DeleteDhcpOptionsRequest;
@class AWSEC2DeleteFlowLogsRequest;
@class AWSEC2DeleteFlowLogsResult;
@class AWSEC2DeleteInternetGatewayRequest;
@class AWSEC2DeleteKeyPairRequest;
@class AWSEC2DeleteNatGatewayRequest;
@class AWSEC2DeleteNatGatewayResult;
@class AWSEC2DeleteNetworkAclEntryRequest;
@class AWSEC2DeleteNetworkAclRequest;
@class AWSEC2DeleteNetworkInterfaceRequest;
@class AWSEC2DeletePlacementGroupRequest;
@class AWSEC2DeleteRouteRequest;
@class AWSEC2DeleteRouteTableRequest;
@class AWSEC2DeleteSecurityGroupRequest;
@class AWSEC2DeleteSnapshotRequest;
@class AWSEC2DeleteSpotDatafeedSubscriptionRequest;
@class AWSEC2DeleteSubnetRequest;
@class AWSEC2DeleteTagsRequest;
@class AWSEC2DeleteVolumeRequest;
@class AWSEC2DeleteVpcEndpointsRequest;
@class AWSEC2DeleteVpcEndpointsResult;
@class AWSEC2DeleteVpcPeeringConnectionRequest;
@class AWSEC2DeleteVpcPeeringConnectionResult;
@class AWSEC2DeleteVpcRequest;
@class AWSEC2DeleteVpnConnectionRequest;
@class AWSEC2DeleteVpnConnectionRouteRequest;
@class AWSEC2DeleteVpnGatewayRequest;
@class AWSEC2DeregisterImageRequest;
@class AWSEC2DescribeAccountAttributesRequest;
@class AWSEC2DescribeAccountAttributesResult;
@class AWSEC2DescribeAddressesRequest;
@class AWSEC2DescribeAddressesResult;
@class AWSEC2DescribeAvailabilityZonesRequest;
@class AWSEC2DescribeAvailabilityZonesResult;
@class AWSEC2DescribeBundleTasksRequest;
@class AWSEC2DescribeBundleTasksResult;
@class AWSEC2DescribeClassicLinkInstancesRequest;
@class AWSEC2DescribeClassicLinkInstancesResult;
@class AWSEC2DescribeConversionTasksRequest;
@class AWSEC2DescribeConversionTasksResult;
@class AWSEC2DescribeCustomerGatewaysRequest;
@class AWSEC2DescribeCustomerGatewaysResult;
@class AWSEC2DescribeDhcpOptionsRequest;
@class AWSEC2DescribeDhcpOptionsResult;
@class AWSEC2DescribeExportTasksRequest;
@class AWSEC2DescribeExportTasksResult;
@class AWSEC2DescribeFlowLogsRequest;
@class AWSEC2DescribeFlowLogsResult;
@class AWSEC2DescribeHostsRequest;
@class AWSEC2DescribeHostsResult;
@class AWSEC2DescribeIdFormatRequest;
@class AWSEC2DescribeIdFormatResult;
@class AWSEC2DescribeImageAttributeRequest;
@class AWSEC2DescribeImagesRequest;
@class AWSEC2DescribeImagesResult;
@class AWSEC2DescribeImportImageTasksRequest;
@class AWSEC2DescribeImportImageTasksResult;
@class AWSEC2DescribeImportSnapshotTasksRequest;
@class AWSEC2DescribeImportSnapshotTasksResult;
@class AWSEC2DescribeInstanceAttributeRequest;
@class AWSEC2DescribeInstanceStatusRequest;
@class AWSEC2DescribeInstanceStatusResult;
@class AWSEC2DescribeInstancesRequest;
@class AWSEC2DescribeInstancesResult;
@class AWSEC2DescribeInternetGatewaysRequest;
@class AWSEC2DescribeInternetGatewaysResult;
@class AWSEC2DescribeKeyPairsRequest;
@class AWSEC2DescribeKeyPairsResult;
@class AWSEC2DescribeMovingAddressesRequest;
@class AWSEC2DescribeMovingAddressesResult;
@class AWSEC2DescribeNatGatewaysRequest;
@class AWSEC2DescribeNatGatewaysResult;
@class AWSEC2DescribeNetworkAclsRequest;
@class AWSEC2DescribeNetworkAclsResult;
@class AWSEC2DescribeNetworkInterfaceAttributeRequest;
@class AWSEC2DescribeNetworkInterfaceAttributeResult;
@class AWSEC2DescribeNetworkInterfacesRequest;
@class AWSEC2DescribeNetworkInterfacesResult;
@class AWSEC2DescribePlacementGroupsRequest;
@class AWSEC2DescribePlacementGroupsResult;
@class AWSEC2DescribePrefixListsRequest;
@class AWSEC2DescribePrefixListsResult;
@class AWSEC2DescribeRegionsRequest;
@class AWSEC2DescribeRegionsResult;
@class AWSEC2DescribeReservedInstancesListingsRequest;
@class AWSEC2DescribeReservedInstancesListingsResult;
@class AWSEC2DescribeReservedInstancesModificationsRequest;
@class AWSEC2DescribeReservedInstancesModificationsResult;
@class AWSEC2DescribeReservedInstancesOfferingsRequest;
@class AWSEC2DescribeReservedInstancesOfferingsResult;
@class AWSEC2DescribeReservedInstancesRequest;
@class AWSEC2DescribeReservedInstancesResult;
@class AWSEC2DescribeRouteTablesRequest;
@class AWSEC2DescribeRouteTablesResult;
@class AWSEC2DescribeScheduledInstanceAvailabilityRequest;
@class AWSEC2DescribeScheduledInstanceAvailabilityResult;
@class AWSEC2DescribeScheduledInstancesRequest;
@class AWSEC2DescribeScheduledInstancesResult;
@class AWSEC2DescribeSecurityGroupReferencesRequest;
@class AWSEC2DescribeSecurityGroupReferencesResult;
@class AWSEC2DescribeSecurityGroupsRequest;
@class AWSEC2DescribeSecurityGroupsResult;
@class AWSEC2DescribeSnapshotAttributeRequest;
@class AWSEC2DescribeSnapshotAttributeResult;
@class AWSEC2DescribeSnapshotsRequest;
@class AWSEC2DescribeSnapshotsResult;
@class AWSEC2DescribeSpotDatafeedSubscriptionRequest;
@class AWSEC2DescribeSpotDatafeedSubscriptionResult;
@class AWSEC2DescribeSpotFleetInstancesRequest;
@class AWSEC2DescribeSpotFleetInstancesResponse;
@class AWSEC2DescribeSpotFleetRequestHistoryRequest;
@class AWSEC2DescribeSpotFleetRequestHistoryResponse;
@class AWSEC2DescribeSpotFleetRequestsRequest;
@class AWSEC2DescribeSpotFleetRequestsResponse;
@class AWSEC2DescribeSpotInstanceRequestsRequest;
@class AWSEC2DescribeSpotInstanceRequestsResult;
@class AWSEC2DescribeSpotPriceHistoryRequest;
@class AWSEC2DescribeSpotPriceHistoryResult;
@class AWSEC2DescribeStaleSecurityGroupsRequest;
@class AWSEC2DescribeStaleSecurityGroupsResult;
@class AWSEC2DescribeSubnetsRequest;
@class AWSEC2DescribeSubnetsResult;
@class AWSEC2DescribeTagsRequest;
@class AWSEC2DescribeTagsResult;
@class AWSEC2DescribeVolumeAttributeRequest;
@class AWSEC2DescribeVolumeAttributeResult;
@class AWSEC2DescribeVolumeStatusRequest;
@class AWSEC2DescribeVolumeStatusResult;
@class AWSEC2DescribeVolumesRequest;
@class AWSEC2DescribeVolumesResult;
@class AWSEC2DescribeVpcAttributeRequest;
@class AWSEC2DescribeVpcAttributeResult;
@class AWSEC2DescribeVpcClassicLinkDnsSupportRequest;
@class AWSEC2DescribeVpcClassicLinkDnsSupportResult;
@class AWSEC2DescribeVpcClassicLinkRequest;
@class AWSEC2DescribeVpcClassicLinkResult;
@class AWSEC2DescribeVpcEndpointServicesRequest;
@class AWSEC2DescribeVpcEndpointServicesResult;
@class AWSEC2DescribeVpcEndpointsRequest;
@class AWSEC2DescribeVpcEndpointsResult;
@class AWSEC2DescribeVpcPeeringConnectionsRequest;
@class AWSEC2DescribeVpcPeeringConnectionsResult;
@class AWSEC2DescribeVpcsRequest;
@class AWSEC2DescribeVpcsResult;
@class AWSEC2DescribeVpnConnectionsRequest;
@class AWSEC2DescribeVpnConnectionsResult;
@class AWSEC2DescribeVpnGatewaysRequest;
@class AWSEC2DescribeVpnGatewaysResult;
@class AWSEC2DetachClassicLinkVpcRequest;
@class AWSEC2DetachClassicLinkVpcResult;
@class AWSEC2DetachInternetGatewayRequest;
@class AWSEC2DetachNetworkInterfaceRequest;
@class AWSEC2DetachVolumeRequest;
@class AWSEC2DetachVpnGatewayRequest;
@class AWSEC2DhcpConfiguration;
@class AWSEC2DhcpOptions;
@class AWSEC2DisableVgwRoutePropagationRequest;
@class AWSEC2DisableVpcClassicLinkDnsSupportRequest;
@class AWSEC2DisableVpcClassicLinkDnsSupportResult;
@class AWSEC2DisableVpcClassicLinkRequest;
@class AWSEC2DisableVpcClassicLinkResult;
@class AWSEC2DisassociateAddressRequest;
@class AWSEC2DisassociateRouteTableRequest;
@class AWSEC2DiskImage;
@class AWSEC2DiskImageDescription;
@class AWSEC2DiskImageDetail;
@class AWSEC2DiskImageVolumeDescription;
@class AWSEC2EbsBlockDevice;
@class AWSEC2EbsInstanceBlockDevice;
@class AWSEC2EbsInstanceBlockDeviceSpecification;
@class AWSEC2EnableVgwRoutePropagationRequest;
@class AWSEC2EnableVolumeIORequest;
@class AWSEC2EnableVpcClassicLinkDnsSupportRequest;
@class AWSEC2EnableVpcClassicLinkDnsSupportResult;
@class AWSEC2EnableVpcClassicLinkRequest;
@class AWSEC2EnableVpcClassicLinkResult;
@class AWSEC2EventInformation;
@class AWSEC2ExportTask;
@class AWSEC2ExportToS3Task;
@class AWSEC2ExportToS3TaskSpecification;
@class AWSEC2Filter;
@class AWSEC2FlowLog;
@class AWSEC2GetConsoleOutputRequest;
@class AWSEC2GetConsoleOutputResult;
@class AWSEC2GetPasswordDataRequest;
@class AWSEC2GetPasswordDataResult;
@class AWSEC2GroupIdentifier;
@class AWSEC2HistoryRecord;
@class AWSEC2Host;
@class AWSEC2HostInstance;
@class AWSEC2HostProperties;
@class AWSEC2IamInstanceProfile;
@class AWSEC2IamInstanceProfileSpecification;
@class AWSEC2IcmpTypeCode;
@class AWSEC2IdFormat;
@class AWSEC2Image;
@class AWSEC2ImageAttribute;
@class AWSEC2ImageDiskContainer;
@class AWSEC2ImportImageRequest;
@class AWSEC2ImportImageResult;
@class AWSEC2ImportImageTask;
@class AWSEC2ImportInstanceLaunchSpecification;
@class AWSEC2ImportInstanceRequest;
@class AWSEC2ImportInstanceResult;
@class AWSEC2ImportInstanceTaskDetails;
@class AWSEC2ImportInstanceVolumeDetailItem;
@class AWSEC2ImportKeyPairRequest;
@class AWSEC2ImportKeyPairResult;
@class AWSEC2ImportSnapshotRequest;
@class AWSEC2ImportSnapshotResult;
@class AWSEC2ImportSnapshotTask;
@class AWSEC2ImportVolumeRequest;
@class AWSEC2ImportVolumeResult;
@class AWSEC2ImportVolumeTaskDetails;
@class AWSEC2Instance;
@class AWSEC2InstanceAttribute;
@class AWSEC2InstanceBlockDeviceMapping;
@class AWSEC2InstanceBlockDeviceMappingSpecification;
@class AWSEC2InstanceCapacity;
@class AWSEC2InstanceCount;
@class AWSEC2InstanceExportDetails;
@class AWSEC2InstanceMonitoring;
@class AWSEC2InstanceNetworkInterface;
@class AWSEC2InstanceNetworkInterfaceAssociation;
@class AWSEC2InstanceNetworkInterfaceAttachment;
@class AWSEC2InstanceNetworkInterfaceSpecification;
@class AWSEC2InstancePrivateIpAddress;
@class AWSEC2InstanceState;
@class AWSEC2InstanceStateChange;
@class AWSEC2InstanceStatus;
@class AWSEC2InstanceStatusDetails;
@class AWSEC2InstanceStatusEvent;
@class AWSEC2InstanceStatusSummary;
@class AWSEC2InternetGateway;
@class AWSEC2InternetGatewayAttachment;
@class AWSEC2IpPermission;
@class AWSEC2IpRange;
@class AWSEC2KeyPair;
@class AWSEC2KeyPairInfo;
@class AWSEC2LaunchPermission;
@class AWSEC2LaunchPermissionModifications;
@class AWSEC2LaunchSpecification;
@class AWSEC2ModifyHostsRequest;
@class AWSEC2ModifyHostsResult;
@class AWSEC2ModifyIdFormatRequest;
@class AWSEC2ModifyImageAttributeRequest;
@class AWSEC2ModifyInstanceAttributeRequest;
@class AWSEC2ModifyInstancePlacementRequest;
@class AWSEC2ModifyInstancePlacementResult;
@class AWSEC2ModifyNetworkInterfaceAttributeRequest;
@class AWSEC2ModifyReservedInstancesRequest;
@class AWSEC2ModifyReservedInstancesResult;
@class AWSEC2ModifySnapshotAttributeRequest;
@class AWSEC2ModifySpotFleetRequestRequest;
@class AWSEC2ModifySpotFleetRequestResponse;
@class AWSEC2ModifySubnetAttributeRequest;
@class AWSEC2ModifyVolumeAttributeRequest;
@class AWSEC2ModifyVpcAttributeRequest;
@class AWSEC2ModifyVpcEndpointRequest;
@class AWSEC2ModifyVpcEndpointResult;
@class AWSEC2ModifyVpcPeeringConnectionOptionsRequest;
@class AWSEC2ModifyVpcPeeringConnectionOptionsResult;
@class AWSEC2MonitorInstancesRequest;
@class AWSEC2MonitorInstancesResult;
@class AWSEC2Monitoring;
@class AWSEC2MoveAddressToVpcRequest;
@class AWSEC2MoveAddressToVpcResult;
@class AWSEC2MovingAddressStatus;
@class AWSEC2NatGateway;
@class AWSEC2NatGatewayAddress;
@class AWSEC2NetworkAcl;
@class AWSEC2NetworkAclAssociation;
@class AWSEC2NetworkAclEntry;
@class AWSEC2NetworkInterface;
@class AWSEC2NetworkInterfaceAssociation;
@class AWSEC2NetworkInterfaceAttachment;
@class AWSEC2NetworkInterfaceAttachmentChanges;
@class AWSEC2NetworkInterfacePrivateIpAddress;
@class AWSEC2LatestDhcpConfiguration;
@class AWSEC2PeeringConnectionOptions;
@class AWSEC2PeeringConnectionOptionsRequest;
@class AWSEC2Placement;
@class AWSEC2PlacementGroup;
@class AWSEC2PortRange;
@class AWSEC2PrefixList;
@class AWSEC2PrefixListId;
@class AWSEC2PriceSchedule;
@class AWSEC2PriceScheduleSpecification;
@class AWSEC2PricingDetail;
@class AWSEC2PrivateIpAddressSpecification;
@class AWSEC2ProductCode;
@class AWSEC2PropagatingVgw;
@class AWSEC2PurchaseRequest;
@class AWSEC2PurchaseReservedInstancesOfferingRequest;
@class AWSEC2PurchaseReservedInstancesOfferingResult;
@class AWSEC2PurchaseScheduledInstancesRequest;
@class AWSEC2PurchaseScheduledInstancesResult;
@class AWSEC2RebootInstancesRequest;
@class AWSEC2RecurringCharge;
@class AWSEC2Region;
@class AWSEC2RegisterImageRequest;
@class AWSEC2RegisterImageResult;
@class AWSEC2RejectVpcPeeringConnectionRequest;
@class AWSEC2RejectVpcPeeringConnectionResult;
@class AWSEC2ReleaseAddressRequest;
@class AWSEC2ReleaseHostsRequest;
@class AWSEC2ReleaseHostsResult;
@class AWSEC2ReplaceNetworkAclAssociationRequest;
@class AWSEC2ReplaceNetworkAclAssociationResult;
@class AWSEC2ReplaceNetworkAclEntryRequest;
@class AWSEC2ReplaceRouteRequest;
@class AWSEC2ReplaceRouteTableAssociationRequest;
@class AWSEC2ReplaceRouteTableAssociationResult;
@class AWSEC2ReportInstanceStatusRequest;
@class AWSEC2RequestSpotFleetRequest;
@class AWSEC2RequestSpotFleetResponse;
@class AWSEC2RequestSpotInstancesRequest;
@class AWSEC2RequestSpotInstancesResult;
@class AWSEC2RequestSpotLaunchSpecification;
@class AWSEC2Reservation;
@class AWSEC2ReservedInstanceLimitPrice;
@class AWSEC2ReservedInstances;
@class AWSEC2ReservedInstancesConfiguration;
@class AWSEC2ReservedInstancesId;
@class AWSEC2ReservedInstancesListing;
@class AWSEC2ReservedInstancesModification;
@class AWSEC2ReservedInstancesModificationResult;
@class AWSEC2ReservedInstancesOffering;
@class AWSEC2ResetImageAttributeRequest;
@class AWSEC2ResetInstanceAttributeRequest;
@class AWSEC2ResetNetworkInterfaceAttributeRequest;
@class AWSEC2ResetSnapshotAttributeRequest;
@class AWSEC2RestoreAddressToClassicRequest;
@class AWSEC2RestoreAddressToClassicResult;
@class AWSEC2RevokeSecurityGroupEgressRequest;
@class AWSEC2RevokeSecurityGroupIngressRequest;
@class AWSEC2Route;
@class AWSEC2RouteTable;
@class AWSEC2RouteTableAssociation;
@class AWSEC2RunInstancesMonitoringEnabled;
@class AWSEC2RunInstancesRequest;
@class AWSEC2RunScheduledInstancesRequest;
@class AWSEC2RunScheduledInstancesResult;
@class AWSEC2S3Storage;
@class AWSEC2ScheduledInstance;
@class AWSEC2ScheduledInstanceAvailability;
@class AWSEC2ScheduledInstanceRecurrence;
@class AWSEC2ScheduledInstanceRecurrenceRequest;
@class AWSEC2ScheduledInstancesBlockDeviceMapping;
@class AWSEC2ScheduledInstancesEbs;
@class AWSEC2ScheduledInstancesIamInstanceProfile;
@class AWSEC2ScheduledInstancesLaunchSpecification;
@class AWSEC2ScheduledInstancesMonitoring;
@class AWSEC2ScheduledInstancesNetworkInterface;
@class AWSEC2ScheduledInstancesPlacement;
@class AWSEC2ScheduledInstancesPrivateIpAddressConfig;
@class AWSEC2SecurityGroup;
@class AWSEC2SecurityGroupReference;
@class AWSEC2SlotDateTimeRangeRequest;
@class AWSEC2SlotStartTimeRangeRequest;
@class AWSEC2Snapshot;
@class AWSEC2SnapshotDetail;
@class AWSEC2SnapshotDiskContainer;
@class AWSEC2SnapshotTaskDetail;
@class AWSEC2SpotDatafeedSubscription;
@class AWSEC2SpotFleetLaunchSpecification;
@class AWSEC2SpotFleetMonitoring;
@class AWSEC2SpotFleetRequestConfig;
@class AWSEC2SpotFleetRequestConfigData;
@class AWSEC2SpotInstanceRequest;
@class AWSEC2SpotInstanceStateFault;
@class AWSEC2SpotInstanceStatus;
@class AWSEC2SpotPlacement;
@class AWSEC2SpotPrice;
@class AWSEC2StaleIpPermission;
@class AWSEC2StaleSecurityGroup;
@class AWSEC2StartInstancesRequest;
@class AWSEC2StartInstancesResult;
@class AWSEC2StateReason;
@class AWSEC2StopInstancesRequest;
@class AWSEC2StopInstancesResult;
@class AWSEC2Storage;
@class AWSEC2Subnet;
@class AWSEC2Tag;
@class AWSEC2TagDescription;
@class AWSEC2TerminateInstancesRequest;
@class AWSEC2TerminateInstancesResult;
@class AWSEC2UnassignPrivateIpAddressesRequest;
@class AWSEC2UnmonitorInstancesRequest;
@class AWSEC2UnmonitorInstancesResult;
@class AWSEC2UnsuccessfulItem;
@class AWSEC2UnsuccessfulItemError;
@class AWSEC2UserBucket;
@class AWSEC2UserBucketDetails;
@class AWSEC2UserData;
@class AWSEC2UserIdGroupPair;
@class AWSEC2VgwTelemetry;
@class AWSEC2Volume;
@class AWSEC2VolumeAttachment;
@class AWSEC2VolumeDetail;
@class AWSEC2VolumeStatusAction;
@class AWSEC2VolumeStatusDetails;
@class AWSEC2VolumeStatusEvent;
@class AWSEC2VolumeStatusInfo;
@class AWSEC2VolumeStatusItem;
@class AWSEC2Vpc;
@class AWSEC2VpcAttachment;
@class AWSEC2VpcClassicLink;
@class AWSEC2VpcEndpoint;
@class AWSEC2VpcPeeringConnection;
@class AWSEC2VpcPeeringConnectionOptionsDescription;
@class AWSEC2VpcPeeringConnectionStateReason;
@class AWSEC2VpcPeeringConnectionVpcInfo;
@class AWSEC2VpnConnection;
@class AWSEC2VpnConnectionOptions;
@class AWSEC2VpnConnectionOptionsSpecification;
@class AWSEC2VpnGateway;
@class AWSEC2VpnStaticRoute;

/**
 <p>Contains the parameters for AcceptVpcPeeringConnection.</p>
 */
@interface AWSEC2AcceptVpcPeeringConnectionRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcPeeringConnectionId;

@end

/**
 <p>Contains the output of AcceptVpcPeeringConnection.</p>
 */
@interface AWSEC2AcceptVpcPeeringConnectionResult : AWSModel


/**
 <p>Information about the VPC peering connection.</p>
 */
@property (nonatomic, strong) AWSEC2VpcPeeringConnection * _Nullable vpcPeeringConnection;

@end

/**
 <p>Describes an account attribute.</p>
 */
@interface AWSEC2AccountAttribute : AWSModel


/**
 <p>The name of the account attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>One or more values for the account attribute.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2AccountAttributeValue *> * _Nullable attributeValues;

@end

/**
 <p>Describes a value of an account attribute.</p>
 */
@interface AWSEC2AccountAttributeValue : AWSModel


/**
 <p>The value of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

@end

/**
 <p>Describes a running instance in a Spot fleet.</p>
 */
@interface AWSEC2ActiveInstance : AWSModel


/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The instance type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The ID of the Spot instance request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotInstanceRequestId;

@end

/**
 <p>Describes an Elastic IP address.</p>
 */
@interface AWSEC2Address : AWSModel


/**
 <p>The ID representing the allocation of the address for use with EC2-VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allocationId;

/**
 <p>The ID representing the association of the address with an instance in a VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>Indicates whether this Elastic IP address is for use with instances in EC2-Classic (<code>standard</code>) or instances in a VPC (<code>vpc</code>).</p>
 */
@property (nonatomic, assign) AWSEC2DomainType domain;

/**
 <p>The ID of the instance that the address is associated with (if any).</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The ID of the AWS account that owns the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceOwnerId;

/**
 <p>The private IP address associated with the Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

/**
 <p>The Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

@end

/**
 <p>Contains the parameters for AllocateAddress.</p>
 */
@interface AWSEC2AllocateAddressRequest : AWSRequest


/**
 <p>Set to <code>vpc</code> to allocate the address for use with instances in a VPC.</p><p>Default: The address is for use with instances in EC2-Classic.</p>
 */
@property (nonatomic, assign) AWSEC2DomainType domain;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

@end

/**
 <p>Contains the output of AllocateAddress.</p>
 */
@interface AWSEC2AllocateAddressResult : AWSModel


/**
 <p>[EC2-VPC] The ID that AWS assigns to represent the allocation of the Elastic IP address for use with instances in a VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allocationId;

/**
 <p>Indicates whether this Elastic IP address is for use with instances in EC2-Classic (<code>standard</code>) or instances in a VPC (<code>vpc</code>).</p>
 */
@property (nonatomic, assign) AWSEC2DomainType domain;

/**
 <p>The Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

@end

/**
 <p>Contains the parameters for AllocateHosts.</p>
 Required parameters: [InstanceType, Quantity, AvailabilityZone]
 */
@interface AWSEC2AllocateHostsRequest : AWSRequest


/**
 <p>This is enabled by default. This property allows instances to be automatically placed onto available Dedicated hosts, when you are launching instances without specifying a host ID.</p><p>Default: Enabled</p>
 */
@property (nonatomic, assign) AWSEC2AutoPlacement autoPlacement;

/**
 <p>The Availability Zone for the Dedicated hosts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How to Ensure Idempotency</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Specify the instance type that you want your Dedicated hosts to be configured for. When you specify the instance type, that is the only instance type that you can launch onto that host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The number of Dedicated hosts you want to allocate to your account with these parameters.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

@end

/**
 <p>Contains the output of AllocateHosts.</p>
 */
@interface AWSEC2AllocateHostsResult : AWSModel


/**
 <p>The ID of the allocated Dedicated host. This is used when you want to launch an instance onto a specific host.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable hostIds;

@end

/**
 <p>Contains the parameters for AssignPrivateIpAddresses.</p>
 Required parameters: [NetworkInterfaceId]
 */
@interface AWSEC2AssignPrivateIpAddressesRequest : AWSRequest


/**
 <p>Indicates whether to allow an IP address that is already assigned to another network interface or instance to be reassigned to the specified network interface.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowReassignment;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>One or more IP addresses to be assigned as a secondary private IP address to the network interface. You can't specify this parameter when also specifying a number of secondary IP addresses.</p><p>If you don't specify an IP address, Amazon EC2 automatically selects an IP address within the subnet range.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable privateIpAddresses;

/**
 <p>The number of secondary IP addresses to assign to the network interface. You can't specify this parameter when also specifying private IP addresses.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable secondaryPrivateIpAddressCount;

@end

/**
 <p>Contains the parameters for AssociateAddress.</p>
 */
@interface AWSEC2AssociateAddressRequest : AWSRequest


/**
 <p>[EC2-VPC] The allocation ID. This is required for EC2-VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allocationId;

/**
 <p>[EC2-VPC] For a VPC in an EC2-Classic account, specify true to allow an Elastic IP address that is already associated with an instance or network interface to be reassociated with the specified instance or network interface. Otherwise, the operation fails. In a VPC in an EC2-VPC-only account, reassociation is automatic, therefore you can specify false to ensure the operation fails if the Elastic IP address is already associated with another resource.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowReassociation;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the instance. This is required for EC2-Classic. For EC2-VPC, you can specify either the instance ID or the network interface ID, but not both. The operation fails if you specify an instance ID unless exactly one network interface is attached. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>[EC2-VPC] The ID of the network interface. If the instance has more than one network interface, you must specify a network interface ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>[EC2-VPC] The primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

/**
 <p>The Elastic IP address. This is required for EC2-Classic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

@end

/**
 <p>Contains the output of AssociateAddress.</p>
 */
@interface AWSEC2AssociateAddressResult : AWSModel


/**
 <p>[EC2-VPC] The ID that represents the association of the Elastic IP address with an instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

@end

/**
 <p>Contains the parameters for AssociateDhcpOptions.</p>
 Required parameters: [DhcpOptionsId, VpcId]
 */
@interface AWSEC2AssociateDhcpOptionsRequest : AWSRequest


/**
 <p>The ID of the DHCP options set, or <code>default</code> to associate no DHCP options with the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dhcpOptionsId;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the parameters for AssociateRouteTable.</p>
 Required parameters: [SubnetId, RouteTableId]
 */
@interface AWSEC2AssociateRouteTableRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeTableId;

/**
 <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>Contains the output of AssociateRouteTable.</p>
 */
@interface AWSEC2AssociateRouteTableResult : AWSModel


/**
 <p>The route table association ID (needed to disassociate the route table).</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

@end

/**
 <p>Contains the parameters for AttachClassicLinkVpc.</p>
 Required parameters: [InstanceId, VpcId, Groups]
 */
@interface AWSEC2AttachClassicLinkVpcRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of one or more of the VPC's security groups. You cannot specify security groups from a different VPC.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groups;

/**
 <p>The ID of an EC2-Classic instance to link to the ClassicLink-enabled VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The ID of a ClassicLink-enabled VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output of AttachClassicLinkVpc.</p>
 */
@interface AWSEC2AttachClassicLinkVpcResult : AWSModel


/**
 <p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returned;

@end

/**
 <p>Contains the parameters for AttachInternetGateway.</p>
 Required parameters: [InternetGatewayId, VpcId]
 */
@interface AWSEC2AttachInternetGatewayRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the Internet gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable internetGatewayId;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the parameters for AttachNetworkInterface.</p>
 Required parameters: [NetworkInterfaceId, InstanceId, DeviceIndex]
 */
@interface AWSEC2AttachNetworkInterfaceRequest : AWSRequest


/**
 <p>The index of the device for the network interface attachment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deviceIndex;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

@end

/**
 <p>Contains the output of AttachNetworkInterface.</p>
 */
@interface AWSEC2AttachNetworkInterfaceResult : AWSModel


/**
 <p>The ID of the network interface attachment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentId;

@end

/**
 <p>Contains the parameters for AttachVolume.</p>
 Required parameters: [VolumeId, InstanceId, Device]
 */
@interface AWSEC2AttachVolumeRequest : AWSRequest


/**
 <p>The device name to expose to the instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable device;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The ID of the EBS volume. The volume and instance must be within the same Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

@end

/**
 <p>Contains the parameters for AttachVpnGateway.</p>
 Required parameters: [VpnGatewayId, VpcId]
 */
@interface AWSEC2AttachVpnGatewayRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

/**
 <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnGatewayId;

@end

/**
 <p>Contains the output of AttachVpnGateway.</p>
 */
@interface AWSEC2AttachVpnGatewayResult : AWSModel


/**
 <p>Information about the attachment.</p>
 */
@property (nonatomic, strong) AWSEC2VpcAttachment * _Nullable vpcAttachment;

@end

/**
 <p>The value to use when a resource attribute accepts a Boolean value.</p>
 */
@interface AWSEC2AttributeBooleanValue : AWSModel


/**
 <p>Valid values are <code>true</code> or <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable value;

@end

/**
 <p>The value to use for a resource attribute.</p>
 */
@interface AWSEC2AttributeValue : AWSModel


/**
 <p>Valid values are case-sensitive and vary by action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Contains the parameters for AuthorizeSecurityGroupEgress.</p>
 Required parameters: [GroupId]
 */
@interface AWSEC2AuthorizeSecurityGroupEgressRequest : AWSRequest


/**
 <p>The CIDR IP address range. We recommend that you specify the CIDR range in a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrIp;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The start of port range for the TCP and UDP protocols, or an ICMP type number. We recommend that you specify the port range in a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fromPort;

/**
 <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>A set of IP permissions. You can't specify a destination security group and a CIDR IP address range.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2IpPermission *> * _Nullable ipPermissions;

/**
 <p>The IP protocol name or number. We recommend that you specify the protocol in a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipProtocol;

/**
 <p>The name of a destination security group. To authorize outbound access to a destination security group, we recommend that you use a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSecurityGroupName;

/**
 <p>The AWS account number for a destination security group. To authorize outbound access to a destination security group, we recommend that you use a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSecurityGroupOwnerId;

/**
 <p>The end of port range for the TCP and UDP protocols, or an ICMP type number. We recommend that you specify the port range in a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable toPort;

@end

/**
 <p>Contains the parameters for AuthorizeSecurityGroupIngress.</p>
 */
@interface AWSEC2AuthorizeSecurityGroupIngressRequest : AWSRequest


/**
 <p>The CIDR IP address range. You can't specify this parameter when specifying a source security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrIp;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The start of port range for the TCP and UDP protocols, or an ICMP type number. For the ICMP type number, use <code>-1</code> to specify all ICMP types.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fromPort;

/**
 <p>The ID of the security group. Required for a nondefault VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>[EC2-Classic, default VPC] The name of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>A set of IP permissions. Can be used to specify multiple rules in a single command. </p>
 */
@property (nonatomic, strong) NSArray<AWSEC2IpPermission *> * _Nullable ipPermissions;

/**
 <p>The IP protocol name (<code>tcp</code>, <code>udp</code>, <code>icmp</code>) or number (see <a href="http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml">Protocol Numbers</a>). (VPC only) Use <code>-1</code> to specify all.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipProtocol;

/**
 <p>[EC2-Classic, default VPC] The name of the source security group. You can't specify this parameter in combination with the following parameters: the CIDR IP address range, the start of the port range, the IP protocol, and the end of the port range. Creates rules that grant full ICMP, UDP, and TCP access. To create a rule with a specific IP protocol and port range, use a set of IP permissions instead. For EC2-VPC, the source security group must be in the same VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSecurityGroupName;

/**
 <p>[EC2-Classic] The AWS account number for the source security group, if the source security group is in a different account. You can't specify this parameter in combination with the following parameters: the CIDR IP address range, the IP protocol, the start of the port range, and the end of the port range. Creates rules that grant full ICMP, UDP, and TCP access. To create a rule with a specific IP protocol and port range, use a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSecurityGroupOwnerId;

/**
 <p>The end of port range for the TCP and UDP protocols, or an ICMP code number. For the ICMP code number, use <code>-1</code> to specify all ICMP codes for the ICMP type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable toPort;

@end

/**
 <p>Describes an Availability Zone.</p>
 */
@interface AWSEC2AvailabilityZone : AWSModel


/**
 <p>Any messages about the Availability Zone.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2AvailabilityZoneMessage *> * _Nullable messages;

/**
 <p>The name of the region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regionName;

/**
 <p>The state of the Availability Zone.</p>
 */
@property (nonatomic, assign) AWSEC2AvailabilityZoneState state;

/**
 <p>The name of the Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable zoneName;

@end

/**
 <p>Describes a message about an Availability Zone.</p>
 */
@interface AWSEC2AvailabilityZoneMessage : AWSModel


/**
 <p>The message about the Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>The capacity information for instances launched onto the Dedicated host.</p>
 */
@interface AWSEC2AvailableCapacity : AWSModel


/**
 <p>The total number of instances that the Dedicated host supports.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceCapacity *> * _Nullable availableInstanceCapacity;

/**
 <p>The number of vCPUs available on the Dedicated host.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable availableVCpus;

@end

/**
 
 */
@interface AWSEC2BlobAttributeValue : AWSModel


/**
 
 */
@property (nonatomic, strong) NSData * _Nullable value;

@end

/**
 <p>Describes a block device mapping.</p>
 */
@interface AWSEC2BlockDeviceMapping : AWSModel


/**
 <p>The device name exposed to the instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>Parameters used to automatically set up EBS volumes when the instance is launched.</p>
 */
@property (nonatomic, strong) AWSEC2EbsBlockDevice * _Nullable ebs;

/**
 <p>Suppresses the specified device included in the block device mapping of the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable noDevice;

/**
 <p>The virtual device name (<code>ephemeral</code>N). Instance store volumes are numbered starting from 0. An instance type with 2 available instance store volumes can specify mappings for <code>ephemeral0</code> and <code>ephemeral1</code>.The number of available instance store volumes depends on the instance type. After you connect to the instance, you must mount the volume.</p><p>Constraints: For M3 instances, you must specify instance store volumes in the block device mapping for the instance. When you launch an M3 instance, we ignore any instance store volumes specified in the block device mapping for the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualName;

@end

/**
 <p>Contains the parameters for BundleInstance.</p>
 Required parameters: [InstanceId, Storage]
 */
@interface AWSEC2BundleInstanceRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the instance to bundle.</p><p>Type: String</p><p>Default: None</p><p>Required: Yes</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The bucket in which to store the AMI. You can specify a bucket that you already own or a new bucket that Amazon EC2 creates on your behalf. If you specify a bucket that belongs to someone else, Amazon EC2 returns an error.</p>
 */
@property (nonatomic, strong) AWSEC2Storage * _Nullable storage;

@end

/**
 <p>Contains the output of BundleInstance.</p>
 */
@interface AWSEC2BundleInstanceResult : AWSModel


/**
 <p>Information about the bundle task.</p>
 */
@property (nonatomic, strong) AWSEC2BundleTask * _Nullable bundleTask;

@end

/**
 <p>Describes a bundle task.</p>
 */
@interface AWSEC2BundleTask : AWSModel


/**
 <p>The ID of the bundle task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 <p>If the task fails, a description of the error.</p>
 */
@property (nonatomic, strong) AWSEC2BundleTaskError * _Nullable bundleTaskError;

/**
 <p>The ID of the instance associated with this bundle task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The level of task completion, as a percent (for example, 20%).</p>
 */
@property (nonatomic, strong) NSString * _Nullable progress;

/**
 <p>The time this task started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The state of the task.</p>
 */
@property (nonatomic, assign) AWSEC2BundleTaskState state;

/**
 <p>The Amazon S3 storage locations.</p>
 */
@property (nonatomic, strong) AWSEC2Storage * _Nullable storage;

/**
 <p>The time of the most recent update for the task.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p>Describes an error for <a>BundleInstance</a>.</p>
 */
@interface AWSEC2BundleTaskError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Contains the parameters for CancelBundleTask.</p>
 Required parameters: [BundleId]
 */
@interface AWSEC2CancelBundleTaskRequest : AWSRequest


/**
 <p>The ID of the bundle task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bundleId;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

@end

/**
 <p>Contains the output of CancelBundleTask.</p>
 */
@interface AWSEC2CancelBundleTaskResult : AWSModel


/**
 <p>Information about the bundle task.</p>
 */
@property (nonatomic, strong) AWSEC2BundleTask * _Nullable bundleTask;

@end

/**
 <p>Contains the parameters for CancelConversionTask.</p>
 Required parameters: [ConversionTaskId]
 */
@interface AWSEC2CancelConversionRequest : AWSRequest


/**
 <p>The ID of the conversion task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conversionTaskId;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The reason for canceling the conversion task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reasonMessage;

@end

/**
 <p>Contains the parameters for CancelExportTask.</p>
 Required parameters: [ExportTaskId]
 */
@interface AWSEC2CancelExportTaskRequest : AWSRequest


/**
 <p>The ID of the export task. This is the ID returned by <code>CreateInstanceExportTask</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exportTaskId;

@end

/**
 <p>Contains the parameters for CancelImportTask.</p>
 */
@interface AWSEC2CancelImportTaskRequest : AWSRequest


/**
 <p>The reason for canceling the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cancelReason;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the import image or import snapshot task to be canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importTaskId;

@end

/**
 <p>Contains the output for CancelImportTask.</p>
 */
@interface AWSEC2CancelImportTaskResult : AWSModel


/**
 <p>The ID of the task being canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importTaskId;

/**
 <p>The current state of the task being canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable previousState;

/**
 <p>The current state of the task being canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

@end

/**
 <p>Contains the parameters for CancelReservedInstancesListing.</p>
 Required parameters: [ReservedInstancesListingId]
 */
@interface AWSEC2CancelReservedInstancesListingRequest : AWSRequest


/**
 <p>The ID of the Reserved Instance listing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesListingId;

@end

/**
 <p>Contains the output of CancelReservedInstancesListing.</p>
 */
@interface AWSEC2CancelReservedInstancesListingResult : AWSModel


/**
 <p>The Reserved Instance listing.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ReservedInstancesListing *> * _Nullable reservedInstancesListings;

@end

/**
 <p>Describes a Spot fleet error.</p>
 Required parameters: [Code, Message]
 */
@interface AWSEC2CancelSpotFleetRequestsError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, assign) AWSEC2CancelBatchErrorCode code;

/**
 <p>The description for the error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Describes a Spot fleet request that was not successfully canceled.</p>
 Required parameters: [SpotFleetRequestId, Error]
 */
@interface AWSEC2CancelSpotFleetRequestsErrorItem : AWSModel


/**
 <p>The error.</p>
 */
@property (nonatomic, strong) AWSEC2CancelSpotFleetRequestsError * _Nullable error;

/**
 <p>The ID of the Spot fleet request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotFleetRequestId;

@end

/**
 <p>Contains the parameters for CancelSpotFleetRequests.</p>
 Required parameters: [SpotFleetRequestIds, TerminateInstances]
 */
@interface AWSEC2CancelSpotFleetRequestsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The IDs of the Spot fleet requests.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable spotFleetRequestIds;

/**
 <p>Indicates whether to terminate instances for a Spot fleet request if it is canceled successfully.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable terminateInstances;

@end

/**
 <p>Contains the output of CancelSpotFleetRequests.</p>
 */
@interface AWSEC2CancelSpotFleetRequestsResponse : AWSModel


/**
 <p>Information about the Spot fleet requests that are successfully canceled.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2CancelSpotFleetRequestsSuccessItem *> * _Nullable successfulFleetRequests;

/**
 <p>Information about the Spot fleet requests that are not successfully canceled.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2CancelSpotFleetRequestsErrorItem *> * _Nullable unsuccessfulFleetRequests;

@end

/**
 <p>Describes a Spot fleet request that was successfully canceled.</p>
 Required parameters: [SpotFleetRequestId, CurrentSpotFleetRequestState, PreviousSpotFleetRequestState]
 */
@interface AWSEC2CancelSpotFleetRequestsSuccessItem : AWSModel


/**
 <p>The current state of the Spot fleet request.</p>
 */
@property (nonatomic, assign) AWSEC2BatchState currentSpotFleetRequestState;

/**
 <p>The previous state of the Spot fleet request.</p>
 */
@property (nonatomic, assign) AWSEC2BatchState previousSpotFleetRequestState;

/**
 <p>The ID of the Spot fleet request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotFleetRequestId;

@end

/**
 <p>Contains the parameters for CancelSpotInstanceRequests.</p>
 Required parameters: [SpotInstanceRequestIds]
 */
@interface AWSEC2CancelSpotInstanceRequestsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more Spot instance request IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable spotInstanceRequestIds;

@end

/**
 <p>Contains the output of CancelSpotInstanceRequests.</p>
 */
@interface AWSEC2CancelSpotInstanceRequestsResult : AWSModel


/**
 <p>One or more Spot instance requests.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2CancelledSpotInstanceRequest *> * _Nullable cancelledSpotInstanceRequests;

@end

/**
 <p>Describes a request to cancel a Spot instance.</p>
 */
@interface AWSEC2CancelledSpotInstanceRequest : AWSModel


/**
 <p>The ID of the Spot instance request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotInstanceRequestId;

/**
 <p>The state of the Spot instance request.</p>
 */
@property (nonatomic, assign) AWSEC2CancelSpotInstanceRequestState state;

@end

/**
 <p>Describes the ClassicLink DNS support status of a VPC.</p>
 */
@interface AWSEC2ClassicLinkDnsSupport : AWSModel


/**
 <p>Indicates whether ClassicLink DNS support is enabled for the VPC.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable classicLinkDnsSupported;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes a linked EC2-Classic instance.</p>
 */
@interface AWSEC2ClassicLinkInstance : AWSModel


/**
 <p>A list of security groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2GroupIdentifier *> * _Nullable groups;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Any tags assigned to the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes the client-specific data.</p>
 */
@interface AWSEC2ClientData : AWSModel


/**
 <p>A user-defined comment about the disk upload.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comment;

/**
 <p>The time that the disk upload ends.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable uploadEnd;

/**
 <p>The size of the uploaded disk image, in GiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable uploadSize;

/**
 <p>The time that the disk upload starts.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable uploadStart;

@end

/**
 <p>Contains the parameters for ConfirmProductInstance.</p>
 Required parameters: [ProductCode, InstanceId]
 */
@interface AWSEC2ConfirmProductInstanceRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The product code. This must be a product code that you own.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productCode;

@end

/**
 <p>Contains the output of ConfirmProductInstance.</p>
 */
@interface AWSEC2ConfirmProductInstanceResult : AWSModel


/**
 <p>The AWS account ID of the instance owner. This is only present if the product code is attached to the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>The return value of the request. Returns <code>true</code> if the specified product code is owned by the requester and associated with the specified instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returned;

@end

/**
 <p>Describes a conversion task.</p>
 Required parameters: [ConversionTaskId, State]
 */
@interface AWSEC2ConversionTask : AWSModel


/**
 <p>The ID of the conversion task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable conversionTaskId;

/**
 <p>The time when the task expires. If the upload isn't complete before the expiration time, we automatically cancel the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expirationTime;

/**
 <p>If the task is for importing an instance, this contains information about the import instance task.</p>
 */
@property (nonatomic, strong) AWSEC2ImportInstanceTaskDetails * _Nullable importInstance;

/**
 <p>If the task is for importing a volume, this contains information about the import volume task.</p>
 */
@property (nonatomic, strong) AWSEC2ImportVolumeTaskDetails * _Nullable importVolume;

/**
 <p>The state of the conversion task.</p>
 */
@property (nonatomic, assign) AWSEC2ConversionTaskState state;

/**
 <p>The status message related to the conversion task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>Any tags assigned to the task.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

@end

/**
 <p>Contains the parameters for CopyImage.</p>
 Required parameters: [SourceRegion, SourceImageId, Name]
 */
@interface AWSEC2ReplicateImageRequest : AWSRequest


/**
 <p>Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How to Ensure Idempotency</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A description for the new AMI in the destination region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Specifies whether the destination snapshots of the copied image should be encrypted. The default CMK for EBS is used unless a non-default AWS Key Management Service (AWS KMS) CMK is specified with <code>KmsKeyId</code>. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The full ARN of the AWS Key Management Service (AWS KMS) CMK to use when encrypting the snapshots of an image during a copy operation. This parameter is only required if you want to use a non-default CMK; if this parameter is not specified, the default CMK for EBS is used. The ARN contains the <code>arn:aws:kms</code> namespace, followed by the region of the CMK, the AWS account ID of the CMK owner, the <code>key</code> namespace, and then the CMK ID. For example, arn:aws:kms:<i>us-east-1</i>:<i>012345678910</i>:key/<i>abcd1234-a123-456a-a12b-a123b4cd56ef</i>. The specified CMK must exist in the region that the snapshot is being copied to. If a <code>KmsKeyId</code> is specified, the <code>Encrypted</code> flag must also be set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The name of the new AMI in the destination region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID of the AMI to copy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceImageId;

/**
 <p>The name of the region that contains the AMI to copy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceRegion;

@end

/**
 <p>Contains the output of CopyImage.</p>
 */
@interface AWSEC2ReplicateImageResult : AWSModel


/**
 <p>The ID of the new AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

@end

/**
 <p>Contains the parameters for CopySnapshot.</p>
 Required parameters: [SourceRegion, SourceSnapshotId]
 */
@interface AWSEC2ReplicateSnapshotRequest : AWSRequest


/**
 <p>A description for the EBS snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The destination region to use in the <code>PresignedUrl</code> parameter of a snapshot copy operation. This parameter is only valid for specifying the destination region in a <code>PresignedUrl</code> parameter, where it is required.</p><note><p><code>CopySnapshot</code> sends the snapshot copy to the regional endpoint that you send the HTTP request to, such as <code>ec2.us-east-1.amazonaws.com</code> (in the AWS CLI, this is specified with the <code>--region</code> parameter or the default region in your AWS configuration file).</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable destinationRegion;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Specifies whether the destination snapshot should be encrypted. There is no way to create an unencrypted snapshot copy from an encrypted snapshot; however, you can encrypt a copy of an unencrypted snapshot with this flag. The default CMK for EBS is used unless a non-default AWS Key Management Service (AWS KMS) CMK is specified with <code>KmsKeyId</code>. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The full ARN of the AWS Key Management Service (AWS KMS) CMK to use when creating the snapshot copy. This parameter is only required if you want to use a non-default CMK; if this parameter is not specified, the default CMK for EBS is used. The ARN contains the <code>arn:aws:kms</code> namespace, followed by the region of the CMK, the AWS account ID of the CMK owner, the <code>key</code> namespace, and then the CMK ID. For example, arn:aws:kms:<i>us-east-1</i>:<i>012345678910</i>:key/<i>abcd1234-a123-456a-a12b-a123b4cd56ef</i>. The specified CMK must exist in the region that the snapshot is being copied to. If a <code>KmsKeyId</code> is specified, the <code>Encrypted</code> flag must also be set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The pre-signed URL that facilitates copying an encrypted snapshot. This parameter is only required when copying an encrypted snapshot with the Amazon EC2 Query API; it is available as an optional parameter in all other cases. The <code>PresignedUrl</code> should use the snapshot source endpoint, the <code>CopySnapshot</code> action, and include the <code>SourceRegion</code>, <code>SourceSnapshotId</code>, and <code>DestinationRegion</code> parameters. The <code>PresignedUrl</code> must be signed using AWS Signature Version 4. Because EBS snapshots are stored in Amazon S3, the signing algorithm for this parameter uses the same logic that is described in <a href="http://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html">Authenticating Requests by Using Query Parameters (AWS Signature Version 4)</a> in the <i>Amazon Simple Storage Service API Reference</i>. An invalid or improperly signed <code>PresignedUrl</code> will cause the copy operation to fail asynchronously, and the snapshot will move to an <code>error</code> state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable presignedUrl;

/**
 <p>The ID of the region that contains the snapshot to be copied.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceRegion;

/**
 <p>The ID of the EBS snapshot to copy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSnapshotId;

@end

/**
 <p>Contains the output of CopySnapshot.</p>
 */
@interface AWSEC2ReplicateSnapshotResult : AWSModel


/**
 <p>The ID of the new snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

@end

/**
 <p>Contains the parameters for CreateCustomerGateway.</p>
 Required parameters: [Type, PublicIp, BgpAsn]
 */
@interface AWSEC2CreateCustomerGatewayRequest : AWSRequest


/**
 <p>For devices that support BGP, the customer gateway's BGP ASN.</p><p>Default: 65000</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bgpAsn;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The Internet-routable IP address for the customer gateway's outside interface. The address must be static.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

/**
 <p>The type of VPN connection that this customer gateway supports (<code>ipsec.1</code>).</p>
 */
@property (nonatomic, assign) AWSEC2GatewayType types;

@end

/**
 <p>Contains the output of CreateCustomerGateway.</p>
 */
@interface AWSEC2CreateCustomerGatewayResult : AWSModel


/**
 <p>Information about the customer gateway.</p>
 */
@property (nonatomic, strong) AWSEC2CustomerGateway * _Nullable customerGateway;

@end

/**
 <p>Contains the parameters for CreateDhcpOptions.</p>
 Required parameters: [DhcpConfigurations]
 */
@interface AWSEC2CreateDhcpOptionsRequest : AWSRequest


/**
 <p>A DHCP configuration option.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2LatestDhcpConfiguration *> * _Nullable dhcpConfigurations;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

@end

/**
 <p>Contains the output of CreateDhcpOptions.</p>
 */
@interface AWSEC2CreateDhcpOptionsResult : AWSModel


/**
 <p>A set of DHCP options.</p>
 */
@property (nonatomic, strong) AWSEC2DhcpOptions * _Nullable dhcpOptions;

@end

/**
 <p>Contains the parameters for CreateFlowLogs.</p>
 Required parameters: [ResourceIds, ResourceType, TrafficType, LogGroupName, DeliverLogsPermissionArn]
 */
@interface AWSEC2CreateFlowLogsRequest : AWSRequest


/**
 <p>Unique, case-sensitive identifier you provide to ensure the idempotency of the request. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How to Ensure Idempotency</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliverLogsPermissionArn;

/**
 <p>The name of the CloudWatch log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>One or more subnet, network interface, or VPC IDs.</p><p>Constraints: Maximum of 1000 resources</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceIds;

/**
 <p>The type of resource on which to create the flow log.</p>
 */
@property (nonatomic, assign) AWSEC2FlowLogsResourceType resourceType;

/**
 <p>The type of traffic to log.</p>
 */
@property (nonatomic, assign) AWSEC2TrafficType trafficType;

@end

/**
 <p>Contains the output of CreateFlowLogs.</p>
 */
@interface AWSEC2CreateFlowLogsResult : AWSModel


/**
 <p>Unique, case-sensitive identifier you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The IDs of the flow logs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable flowLogIds;

/**
 <p>Information about the flow logs that could not be created successfully.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2UnsuccessfulItem *> * _Nullable unsuccessful;

@end

/**
 <p>Contains the parameters for CreateImage.</p>
 Required parameters: [InstanceId, Name]
 */
@interface AWSEC2CreateImageRequest : AWSRequest


/**
 <p>Information about one or more block device mappings.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2BlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>A description for the new image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>A name for the new image.</p><p>Constraints: 3-128 alphanumeric characters, parentheses (()), square brackets ([]), spaces ( ), periods (.), slashes (/), dashes (-), single quotes ('), at-signs (@), or underscores(_)</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>By default, Amazon EC2 attempts to shut down and reboot the instance before creating the image. If the 'No Reboot' option is set, Amazon EC2 doesn't shut down the instance before creating the image. When this option is used, file system integrity on the created image can't be guaranteed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable noReboot;

@end

/**
 <p>Contains the output of CreateImage.</p>
 */
@interface AWSEC2CreateImageResult : AWSModel


/**
 <p>The ID of the new AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

@end

/**
 <p>Contains the parameters for CreateInstanceExportTask.</p>
 Required parameters: [InstanceId]
 */
@interface AWSEC2CreateInstanceExportTaskRequest : AWSRequest


/**
 <p>A description for the conversion task or the resource being exported. The maximum length is 255 bytes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The format and location for an instance export task.</p>
 */
@property (nonatomic, strong) AWSEC2ExportToS3TaskSpecification * _Nullable exportToS3Task;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The target virtualization environment.</p>
 */
@property (nonatomic, assign) AWSEC2ExportEnvironment targetEnvironment;

@end

/**
 <p>Contains the output for CreateInstanceExportTask.</p>
 */
@interface AWSEC2CreateInstanceExportTaskResult : AWSModel


/**
 <p>Information about the instance export task.</p>
 */
@property (nonatomic, strong) AWSEC2ExportTask * _Nullable exportTask;

@end

/**
 <p>Contains the parameters for CreateInternetGateway.</p>
 */
@interface AWSEC2CreateInternetGatewayRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

@end

/**
 <p>Contains the output of CreateInternetGateway.</p>
 */
@interface AWSEC2CreateInternetGatewayResult : AWSModel


/**
 <p>Information about the Internet gateway.</p>
 */
@property (nonatomic, strong) AWSEC2InternetGateway * _Nullable internetGateway;

@end

/**
 <p>Contains the parameters for CreateKeyPair.</p>
 Required parameters: [KeyName]
 */
@interface AWSEC2CreateKeyPairRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>A unique name for the key pair.</p><p>Constraints: Up to 255 ASCII characters</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

@end

/**
 <p>Contains the parameters for CreateNatGateway.</p>
 Required parameters: [SubnetId, AllocationId]
 */
@interface AWSEC2CreateNatGatewayRequest : AWSRequest


/**
 <p>The allocation ID of an Elastic IP address to associate with the NAT gateway. If the Elastic IP address is associated with another resource, you must first disassociate it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allocationId;

/**
 <p>Unique, case-sensitive identifier you provide to ensure the idempotency of the request. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">How to Ensure Idempotency</a>.</p><p>Constraint: Maximum 64 ASCII characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The subnet in which to create the NAT gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>Contains the output of CreateNatGateway.</p>
 */
@interface AWSEC2CreateNatGatewayResult : AWSModel


/**
 <p>Unique, case-sensitive identifier to ensure the idempotency of the request. Only returned if a client token was provided in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Information about the NAT gateway.</p>
 */
@property (nonatomic, strong) AWSEC2NatGateway * _Nullable natGateway;

@end

/**
 <p>Contains the parameters for CreateNetworkAclEntry.</p>
 Required parameters: [NetworkAclId, RuleNumber, Protocol, RuleAction, Egress, CidrBlock]
 */
@interface AWSEC2CreateNetworkAclEntryRequest : AWSRequest


/**
 <p>The network range to allow or deny, in CIDR notation (for example <code>172.16.0.0/24</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrBlock;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Indicates whether this is an egress rule (rule is applied to traffic leaving the subnet).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable egress;

/**
 <p>ICMP protocol: The ICMP type and code. Required if specifying ICMP for the protocol.</p>
 */
@property (nonatomic, strong) AWSEC2IcmpTypeCode * _Nullable icmpTypeCode;

/**
 <p>The ID of the network ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkAclId;

/**
 <p>TCP or UDP protocols: The range of ports the rule applies to.</p>
 */
@property (nonatomic, strong) AWSEC2PortRange * _Nullable portRange;

/**
 <p>The protocol. A value of -1 means all protocols.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

/**
 <p>Indicates whether to allow or deny the traffic that matches the rule.</p>
 */
@property (nonatomic, assign) AWSEC2RuleAction ruleAction;

/**
 <p>The rule number for the entry (for example, 100). ACL entries are processed in ascending order by rule number.</p><p>Constraints: Positive integer from 1 to 32766</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleNumber;

@end

/**
 <p>Contains the parameters for CreateNetworkAcl.</p>
 Required parameters: [VpcId]
 */
@interface AWSEC2CreateNetworkAclRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output of CreateNetworkAcl.</p>
 */
@interface AWSEC2CreateNetworkAclResult : AWSModel


/**
 <p>Information about the network ACL.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkAcl * _Nullable networkAcl;

@end

/**
 <p>Contains the parameters for CreateNetworkInterface.</p>
 Required parameters: [SubnetId]
 */
@interface AWSEC2CreateNetworkInterfaceRequest : AWSRequest


/**
 <p>A description for the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The IDs of one or more security groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groups;

/**
 <p>The primary private IP address of the network interface. If you don't specify an IP address, Amazon EC2 selects one for you from the subnet range. If you specify an IP address, you cannot indicate any IP addresses specified in <code>privateIpAddresses</code> as primary (only one IP address can be designated as primary).</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

/**
 <p>One or more private IP addresses.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2PrivateIpAddressSpecification *> * _Nullable privateIpAddresses;

/**
 <p>The number of secondary private IP addresses to assign to a network interface. When you specify a number of secondary IP addresses, Amazon EC2 selects these IP addresses within the subnet range. You can't specify this option and specify more than one private IP address using <code>privateIpAddresses</code>.</p><p>The number of IP addresses you can assign to a network interface varies by instance type. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI">Private IP Addresses Per ENI Per Instance Type</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable secondaryPrivateIpAddressCount;

/**
 <p>The ID of the subnet to associate with the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>Contains the output of CreateNetworkInterface.</p>
 */
@interface AWSEC2CreateNetworkInterfaceResult : AWSModel


/**
 <p>Information about the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkInterface * _Nullable networkInterface;

@end

/**
 <p>Contains the parameters for CreatePlacementGroup.</p>
 Required parameters: [GroupName, Strategy]
 */
@interface AWSEC2CreatePlacementGroupRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>A name for the placement group.</p><p>Constraints: Up to 255 ASCII characters</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The placement strategy.</p>
 */
@property (nonatomic, assign) AWSEC2PlacementStrategy strategy;

@end

/**
 <p>Contains the parameters for CreateReservedInstancesListing.</p>
 Required parameters: [ReservedInstancesId, InstanceCount, PriceSchedules, ClientToken]
 */
@interface AWSEC2CreateReservedInstancesListingRequest : AWSRequest


/**
 <p>Unique, case-sensitive identifier you provide to ensure idempotency of your listings. This helps avoid duplicate listings. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring Idempotency</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The number of instances that are a part of a Reserved Instance account to be listed in the Reserved Instance Marketplace. This number should be less than or equal to the instance count associated with the Reserved Instance ID specified in this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>A list specifying the price of the Reserved Instance for each month remaining in the Reserved Instance term.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2PriceScheduleSpecification *> * _Nullable priceSchedules;

/**
 <p>The ID of the active Reserved Instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesId;

@end

/**
 <p>Contains the output of CreateReservedInstancesListing.</p>
 */
@interface AWSEC2CreateReservedInstancesListingResult : AWSModel


/**
 <p>Information about the Reserved Instance listing.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ReservedInstancesListing *> * _Nullable reservedInstancesListings;

@end

/**
 <p>Contains the parameters for CreateRoute.</p>
 Required parameters: [RouteTableId, DestinationCidrBlock]
 */
@interface AWSEC2CreateRouteRequest : AWSRequest


/**
 <p>The CIDR address block used for the destination match. Routing decisions are based on the most specific match.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCidrBlock;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of an Internet gateway or virtual private gateway attached to your VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

/**
 <p>The ID of a NAT instance in your VPC. The operation fails if you specify an instance ID unless exactly one network interface is attached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The ID of a NAT gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable natGatewayId;

/**
 <p>The ID of a network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The ID of the route table for the route.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeTableId;

/**
 <p>The ID of a VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcPeeringConnectionId;

@end

/**
 <p>Contains the output of CreateRoute.</p>
 */
@interface AWSEC2CreateRouteResult : AWSModel


/**
 <p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returned;

@end

/**
 <p>Contains the parameters for CreateRouteTable.</p>
 Required parameters: [VpcId]
 */
@interface AWSEC2CreateRouteTableRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output of CreateRouteTable.</p>
 */
@interface AWSEC2CreateRouteTableResult : AWSModel


/**
 <p>Information about the route table.</p>
 */
@property (nonatomic, strong) AWSEC2RouteTable * _Nullable routeTable;

@end

/**
 <p>Contains the parameters for CreateSecurityGroup.</p>
 Required parameters: [GroupName, Description]
 */
@interface AWSEC2CreateSecurityGroupRequest : AWSRequest


/**
 <p>A description for the security group. This is informational only.</p><p>Constraints: Up to 255 characters in length</p><p>Constraints for EC2-Classic: ASCII characters</p><p>Constraints for EC2-VPC: a-z, A-Z, 0-9, spaces, and ._-:/()#,@[]+=<![CDATA[&amp;]]>;{}!$*</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The name of the security group.</p><p>Constraints: Up to 255 characters in length</p><p>Constraints for EC2-Classic: ASCII characters</p><p>Constraints for EC2-VPC: a-z, A-Z, 0-9, spaces, and ._-:/()#,@[]+=<![CDATA[&amp;]]>;{}!$*</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>[EC2-VPC] The ID of the VPC. Required for EC2-VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output of CreateSecurityGroup.</p>
 */
@interface AWSEC2CreateSecurityGroupResult : AWSModel


/**
 <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

@end

/**
 <p>Contains the parameters for CreateSnapshot.</p>
 Required parameters: [VolumeId]
 */
@interface AWSEC2CreateSnapshotRequest : AWSRequest


/**
 <p>A description for the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the EBS volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

@end

/**
 <p>Contains the parameters for CreateSpotDatafeedSubscription.</p>
 Required parameters: [Bucket]
 */
@interface AWSEC2CreateSpotDatafeedSubscriptionRequest : AWSRequest


/**
 <p>The Amazon S3 bucket in which to store the Spot instance data feed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>A prefix for the data feed file names.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 <p>Contains the output of CreateSpotDatafeedSubscription.</p>
 */
@interface AWSEC2CreateSpotDatafeedSubscriptionResult : AWSModel


/**
 <p>The Spot instance data feed subscription.</p>
 */
@property (nonatomic, strong) AWSEC2SpotDatafeedSubscription * _Nullable spotDatafeedSubscription;

@end

/**
 <p>Contains the parameters for CreateSubnet.</p>
 Required parameters: [VpcId, CidrBlock]
 */
@interface AWSEC2CreateSubnetRequest : AWSRequest


/**
 <p>The Availability Zone for the subnet.</p><p>Default: AWS selects one for you. If you create more than one subnet in your VPC, we may not necessarily select a different zone for each subnet. </p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The network range for the subnet, in CIDR notation. For example, <code>10.0.0.0/24</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrBlock;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output of CreateSubnet.</p>
 */
@interface AWSEC2CreateSubnetResult : AWSModel


/**
 <p>Information about the subnet.</p>
 */
@property (nonatomic, strong) AWSEC2Subnet * _Nullable subnet;

@end

/**
 <p>Contains the parameters for CreateTags.</p>
 Required parameters: [Resources, Tags]
 */
@interface AWSEC2CreateTagsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The IDs of one or more resources to tag. For example, ami-1a2b3c4d.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resources;

/**
 <p>One or more tags. The <code>value</code> parameter is required, but if you don't want the tag to have a value, specify the parameter with no value, and we set the value to an empty string. </p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

@end

/**
 <p>Describes the user or group to be added or removed from the permissions for a volume.</p>
 */
@interface AWSEC2CreateVolumePermission : AWSModel


/**
 <p>The specific group that is to be added or removed from a volume's list of create volume permissions.</p>
 */
@property (nonatomic, assign) AWSEC2PermissionGroup group;

/**
 <p>The specific AWS account ID that is to be added or removed from a volume's list of create volume permissions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 <p>Describes modifications to the permissions for a volume.</p>
 */
@interface AWSEC2CreateVolumePermissionModifications : AWSModel


/**
 <p>Adds a specific AWS account ID or group to a volume's list of create volume permissions.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2CreateVolumePermission *> * _Nullable add;

/**
 <p>Removes a specific AWS account ID or group from a volume's list of create volume permissions.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2CreateVolumePermission *> * _Nullable remove;

@end

/**
 <p>Contains the parameters for CreateVolume.</p>
 Required parameters: [AvailabilityZone]
 */
@interface AWSEC2CreateVolumeRequest : AWSRequest


/**
 <p>The Availability Zone in which to create the volume. Use <a>DescribeAvailabilityZones</a> to list the Availability Zones that are currently available to you.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Specifies whether the volume should be encrypted. Encrypted Amazon EBS volumes may only be attached to instances that support Amazon EBS encryption. Volumes that are created from encrypted snapshots are automatically encrypted. There is no way to create an encrypted volume from an unencrypted snapshot or vice versa. If your AMI uses encrypted volumes, you can only launch it on supported instance types. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html">Amazon EBS Encryption</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>Only valid for Provisioned IOPS SSD volumes. The number of I/O operations per second (IOPS) to provision for the volume, with a maximum ratio of 30 IOPS/GiB.</p><p>Constraint: Range is 100 to 20000 for Provisioned IOPS SSD volumes </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>The full ARN of the AWS Key Management Service (AWS KMS) customer master key (CMK) to use when creating the encrypted volume. This parameter is only required if you want to use a non-default CMK; if this parameter is not specified, the default CMK for EBS is used. The ARN contains the <code>arn:aws:kms</code> namespace, followed by the region of the CMK, the AWS account ID of the CMK owner, the <code>key</code> namespace, and then the CMK ID. For example, arn:aws:kms:<i>us-east-1</i>:<i>012345678910</i>:key/<i>abcd1234-a123-456a-a12b-a123b4cd56ef</i>. If a <code>KmsKeyId</code> is specified, the <code>Encrypted</code> flag must also be set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The size of the volume, in GiBs.</p><p>Constraints: 1-16384 for <code>gp2</code>, 4-16384 for <code>io1</code>, 500-16384 for <code>st1</code>, 500-16384 for <code>sc1</code>, and 1-1024 for <code>standard</code>. If you specify a snapshot, the volume size must be equal to or larger than the snapshot size.</p><p>Default: If you're creating the volume from a snapshot and don't specify a volume size, the default is the snapshot size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

/**
 <p>The snapshot from which to create the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>The volume type. This can be <code>gp2</code> for General Purpose SSD, <code>io1</code> for Provisioned IOPS SSD, <code>st1</code> for Throughput Optimized HDD, <code>sc1</code> for Cold HDD, or <code>standard</code> for Magnetic volumes.</p><p>Default: <code>standard</code></p>
 */
@property (nonatomic, assign) AWSEC2VolumeType volumeType;

@end

/**
 <p>Contains the parameters for CreateVpcEndpoint.</p>
 Required parameters: [VpcId, ServiceName]
 */
@interface AWSEC2CreateVpcEndpointRequest : AWSRequest


/**
 <p>Unique, case-sensitive identifier you provide to ensure the idempotency of the request. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">How to Ensure Idempotency</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>A policy to attach to the endpoint that controls access to the service. The policy must be in valid JSON format. If this parameter is not specified, we attach a default policy that allows full access to the service. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>One or more route table IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable routeTableIds;

/**
 <p>The AWS service name, in the form <code>com.amazonaws.<i>region</i>.<i>service</i></code>. To get a list of available services, use the <a>DescribeVpcEndpointServices</a> request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

/**
 <p>The ID of the VPC in which the endpoint will be used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output of CreateVpcEndpoint.</p>
 */
@interface AWSEC2CreateVpcEndpointResult : AWSModel


/**
 <p>Unique, case-sensitive identifier you provide to ensure the idempotency of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Information about the endpoint.</p>
 */
@property (nonatomic, strong) AWSEC2VpcEndpoint * _Nullable vpcEndpoint;

@end

/**
 <p>Contains the parameters for CreateVpcPeeringConnection.</p>
 */
@interface AWSEC2CreateVpcPeeringConnectionRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The AWS account ID of the owner of the peer VPC.</p><p>Default: Your AWS account ID</p>
 */
@property (nonatomic, strong) NSString * _Nullable peerOwnerId;

/**
 <p>The ID of the VPC with which you are creating the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable peerVpcId;

/**
 <p>The ID of the requester VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output of CreateVpcPeeringConnection.</p>
 */
@interface AWSEC2CreateVpcPeeringConnectionResult : AWSModel


/**
 <p>Information about the VPC peering connection.</p>
 */
@property (nonatomic, strong) AWSEC2VpcPeeringConnection * _Nullable vpcPeeringConnection;

@end

/**
 <p>Contains the parameters for CreateVpc.</p>
 Required parameters: [CidrBlock]
 */
@interface AWSEC2CreateVpcRequest : AWSRequest


/**
 <p>The network range for the VPC, in CIDR notation. For example, <code>10.0.0.0/16</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrBlock;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The tenancy options for instances launched into the VPC. For <code>default</code>, instances are launched with shared tenancy by default. You can launch instances with any tenancy into a shared tenancy VPC. For <code>dedicated</code>, instances are launched as dedicated tenancy instances by default. You can only launch instances with a tenancy of <code>dedicated</code> or <code>host</code> into a dedicated tenancy VPC. </p><p><b>Important:</b> The <code>host</code> value cannot be used with this parameter. Use the <code>default</code> or <code>dedicated</code> values only.</p><p>Default: <code>default</code></p>
 */
@property (nonatomic, assign) AWSEC2Tenancy instanceTenancy;

@end

/**
 <p>Contains the output of CreateVpc.</p>
 */
@interface AWSEC2CreateVpcResult : AWSModel


/**
 <p>Information about the VPC.</p>
 */
@property (nonatomic, strong) AWSEC2Vpc * _Nullable vpc;

@end

/**
 <p>Contains the parameters for CreateVpnConnection.</p>
 Required parameters: [Type, CustomerGatewayId, VpnGatewayId]
 */
@interface AWSEC2CreateVpnConnectionRequest : AWSRequest


/**
 <p>The ID of the customer gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerGatewayId;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Indicates whether the VPN connection requires static routes. If you are creating a VPN connection for a device that does not support BGP, you must specify <code>true</code>.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) AWSEC2VpnConnectionOptionsSpecification * _Nullable options;

/**
 <p>The type of VPN connection (<code>ipsec.1</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnGatewayId;

@end

/**
 <p>Contains the output of CreateVpnConnection.</p>
 */
@interface AWSEC2CreateVpnConnectionResult : AWSModel


/**
 <p>Information about the VPN connection.</p>
 */
@property (nonatomic, strong) AWSEC2VpnConnection * _Nullable vpnConnection;

@end

/**
 <p>Contains the parameters for CreateVpnConnectionRoute.</p>
 Required parameters: [VpnConnectionId, DestinationCidrBlock]
 */
@interface AWSEC2CreateVpnConnectionRouteRequest : AWSRequest


/**
 <p>The CIDR block associated with the local subnet of the customer network.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCidrBlock;

/**
 <p>The ID of the VPN connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnConnectionId;

@end

/**
 <p>Contains the parameters for CreateVpnGateway.</p>
 Required parameters: [Type]
 */
@interface AWSEC2CreateVpnGatewayRequest : AWSRequest


/**
 <p>The Availability Zone for the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The type of VPN connection this virtual private gateway supports.</p>
 */
@property (nonatomic, assign) AWSEC2GatewayType types;

@end

/**
 <p>Contains the output of CreateVpnGateway.</p>
 */
@interface AWSEC2CreateVpnGatewayResult : AWSModel


/**
 <p>Information about the virtual private gateway.</p>
 */
@property (nonatomic, strong) AWSEC2VpnGateway * _Nullable vpnGateway;

@end

/**
 <p>Describes a customer gateway.</p>
 */
@interface AWSEC2CustomerGateway : AWSModel


/**
 <p>The customer gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable bgpAsn;

/**
 <p>The ID of the customer gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerGatewayId;

/**
 <p>The Internet-routable IP address of the customer gateway's outside interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddress;

/**
 <p>The current state of the customer gateway (<code>pending | available | deleting | deleted</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>Any tags assigned to the customer gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The type of VPN connection the customer gateway supports (<code>ipsec.1</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Contains the parameters for DeleteCustomerGateway.</p>
 Required parameters: [CustomerGatewayId]
 */
@interface AWSEC2DeleteCustomerGatewayRequest : AWSRequest


/**
 <p>The ID of the customer gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerGatewayId;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

@end

/**
 <p>Contains the parameters for DeleteDhcpOptions.</p>
 Required parameters: [DhcpOptionsId]
 */
@interface AWSEC2DeleteDhcpOptionsRequest : AWSRequest


/**
 <p>The ID of the DHCP options set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dhcpOptionsId;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

@end

/**
 <p>Contains the parameters for DeleteFlowLogs.</p>
 Required parameters: [FlowLogIds]
 */
@interface AWSEC2DeleteFlowLogsRequest : AWSRequest


/**
 <p>One or more flow log IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable flowLogIds;

@end

/**
 <p>Contains the output of DeleteFlowLogs.</p>
 */
@interface AWSEC2DeleteFlowLogsResult : AWSModel


/**
 <p>Information about the flow logs that could not be deleted successfully.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2UnsuccessfulItem *> * _Nullable unsuccessful;

@end

/**
 <p>Contains the parameters for DeleteInternetGateway.</p>
 Required parameters: [InternetGatewayId]
 */
@interface AWSEC2DeleteInternetGatewayRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the Internet gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable internetGatewayId;

@end

/**
 <p>Contains the parameters for DeleteKeyPair.</p>
 Required parameters: [KeyName]
 */
@interface AWSEC2DeleteKeyPairRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The name of the key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

@end

/**
 <p>Contains the parameters for DeleteNatGateway.</p>
 Required parameters: [NatGatewayId]
 */
@interface AWSEC2DeleteNatGatewayRequest : AWSRequest


/**
 <p>The ID of the NAT gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable natGatewayId;

@end

/**
 <p>Contains the output of DeleteNatGateway.</p>
 */
@interface AWSEC2DeleteNatGatewayResult : AWSModel


/**
 <p>The ID of the NAT gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable natGatewayId;

@end

/**
 <p>Contains the parameters for DeleteNetworkAclEntry.</p>
 Required parameters: [NetworkAclId, RuleNumber, Egress]
 */
@interface AWSEC2DeleteNetworkAclEntryRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Indicates whether the rule is an egress rule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable egress;

/**
 <p>The ID of the network ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkAclId;

/**
 <p>The rule number of the entry to delete.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleNumber;

@end

/**
 <p>Contains the parameters for DeleteNetworkAcl.</p>
 Required parameters: [NetworkAclId]
 */
@interface AWSEC2DeleteNetworkAclRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the network ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkAclId;

@end

/**
 <p>Contains the parameters for DeleteNetworkInterface.</p>
 Required parameters: [NetworkInterfaceId]
 */
@interface AWSEC2DeleteNetworkInterfaceRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

@end

/**
 <p>Contains the parameters for DeletePlacementGroup.</p>
 Required parameters: [GroupName]
 */
@interface AWSEC2DeletePlacementGroupRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The name of the placement group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

@end

/**
 <p>Contains the parameters for DeleteRoute.</p>
 Required parameters: [RouteTableId, DestinationCidrBlock]
 */
@interface AWSEC2DeleteRouteRequest : AWSRequest


/**
 <p>The CIDR range for the route. The value you specify must match the CIDR for the route exactly.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCidrBlock;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeTableId;

@end

/**
 <p>Contains the parameters for DeleteRouteTable.</p>
 Required parameters: [RouteTableId]
 */
@interface AWSEC2DeleteRouteTableRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeTableId;

@end

/**
 <p>Contains the parameters for DeleteSecurityGroup.</p>
 */
@interface AWSEC2DeleteSecurityGroupRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the security group. Required for a nondefault VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>[EC2-Classic, default VPC] The name of the security group. You can specify either the security group name or the security group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

@end

/**
 <p>Contains the parameters for DeleteSnapshot.</p>
 Required parameters: [SnapshotId]
 */
@interface AWSEC2DeleteSnapshotRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the EBS snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

@end

/**
 <p>Contains the parameters for DeleteSpotDatafeedSubscription.</p>
 */
@interface AWSEC2DeleteSpotDatafeedSubscriptionRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

@end

/**
 <p>Contains the parameters for DeleteSubnet.</p>
 Required parameters: [SubnetId]
 */
@interface AWSEC2DeleteSubnetRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>Contains the parameters for DeleteTags.</p>
 Required parameters: [Resources]
 */
@interface AWSEC2DeleteTagsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the resource. For example, ami-1a2b3c4d. You can specify more than one resource ID.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resources;

/**
 <p>One or more tags to delete. If you omit the <code>value</code> parameter, we delete the tag regardless of its value. If you specify this parameter with an empty string as the value, we delete the key only if its value is an empty string.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

@end

/**
 <p>Contains the parameters for DeleteVolume.</p>
 Required parameters: [VolumeId]
 */
@interface AWSEC2DeleteVolumeRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

@end

/**
 <p>Contains the parameters for DeleteVpcEndpoints.</p>
 Required parameters: [VpcEndpointIds]
 */
@interface AWSEC2DeleteVpcEndpointsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more endpoint IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcEndpointIds;

@end

/**
 <p>Contains the output of DeleteVpcEndpoints.</p>
 */
@interface AWSEC2DeleteVpcEndpointsResult : AWSModel


/**
 <p>Information about the endpoints that were not successfully deleted.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2UnsuccessfulItem *> * _Nullable unsuccessful;

@end

/**
 <p>Contains the parameters for DeleteVpcPeeringConnection.</p>
 Required parameters: [VpcPeeringConnectionId]
 */
@interface AWSEC2DeleteVpcPeeringConnectionRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcPeeringConnectionId;

@end

/**
 <p>Contains the output of DeleteVpcPeeringConnection.</p>
 */
@interface AWSEC2DeleteVpcPeeringConnectionResult : AWSModel


/**
 <p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returned;

@end

/**
 <p>Contains the parameters for DeleteVpc.</p>
 Required parameters: [VpcId]
 */
@interface AWSEC2DeleteVpcRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the parameters for DeleteVpnConnection.</p>
 Required parameters: [VpnConnectionId]
 */
@interface AWSEC2DeleteVpnConnectionRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPN connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnConnectionId;

@end

/**
 <p>Contains the parameters for DeleteVpnConnectionRoute.</p>
 Required parameters: [VpnConnectionId, DestinationCidrBlock]
 */
@interface AWSEC2DeleteVpnConnectionRouteRequest : AWSRequest


/**
 <p>The CIDR block associated with the local subnet of the customer network.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCidrBlock;

/**
 <p>The ID of the VPN connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnConnectionId;

@end

/**
 <p>Contains the parameters for DeleteVpnGateway.</p>
 Required parameters: [VpnGatewayId]
 */
@interface AWSEC2DeleteVpnGatewayRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnGatewayId;

@end

/**
 <p>Contains the parameters for DeregisterImage.</p>
 Required parameters: [ImageId]
 */
@interface AWSEC2DeregisterImageRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

@end

/**
 <p>Contains the parameters for DescribeAccountAttributes.</p>
 */
@interface AWSEC2DescribeAccountAttributesRequest : AWSRequest


/**
 <p>One or more account attribute names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributeNames;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

@end

/**
 <p>Contains the output of DescribeAccountAttributes.</p>
 */
@interface AWSEC2DescribeAccountAttributesResult : AWSModel


/**
 <p>Information about one or more account attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2AccountAttribute *> * _Nullable accountAttributes;

@end

/**
 <p>Contains the parameters for DescribeAddresses.</p>
 */
@interface AWSEC2DescribeAddressesRequest : AWSRequest


/**
 <p>[EC2-VPC] One or more allocation IDs.</p><p>Default: Describes all your Elastic IP addresses.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allocationIds;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters. Filter names and values are case-sensitive.</p><ul><li><p><code>allocation-id</code> - [EC2-VPC] The allocation ID for the address.</p></li><li><p><code>association-id</code> - [EC2-VPC] The association ID for the address.</p></li><li><p><code>domain</code> - Indicates whether the address is for use in EC2-Classic (<code>standard</code>) or in a VPC (<code>vpc</code>).</p></li><li><p><code>instance-id</code> - The ID of the instance the address is associated with, if any.</p></li><li><p><code>network-interface-id</code> - [EC2-VPC] The ID of the network interface that the address is associated with, if any.</p></li><li><p><code>network-interface-owner-id</code> - The AWS account ID of the owner.</p></li><li><p><code>private-ip-address</code> - [EC2-VPC] The private IP address associated with the Elastic IP address.</p></li><li><p><code>public-ip</code> - The Elastic IP address.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>[EC2-Classic] One or more Elastic IP addresses.</p><p>Default: Describes all your Elastic IP addresses.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable publicIps;

@end

/**
 <p>Contains the output of DescribeAddresses.</p>
 */
@interface AWSEC2DescribeAddressesResult : AWSModel


/**
 <p>Information about one or more Elastic IP addresses.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Address *> * _Nullable addresses;

@end

/**
 <p>Contains the parameters for DescribeAvailabilityZones.</p>
 */
@interface AWSEC2DescribeAvailabilityZonesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>message</code> - Information about the Availability Zone.</p></li><li><p><code>region-name</code> - The name of the region for the Availability Zone (for example, <code>us-east-1</code>).</p></li><li><p><code>state</code> - The state of the Availability Zone (<code>available</code> | <code>information</code> | <code>impaired</code> | <code>unavailable</code>).</p></li><li><p><code>zone-name</code> - The name of the Availability Zone (for example, <code>us-east-1a</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>The names of one or more Availability Zones.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable zoneNames;

@end

/**
 <p>Contains the output of DescribeAvailabiltyZones.</p>
 */
@interface AWSEC2DescribeAvailabilityZonesResult : AWSModel


/**
 <p>Information about one or more Availability Zones.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2AvailabilityZone *> * _Nullable availabilityZones;

@end

/**
 <p>Contains the parameters for DescribeBundleTasks.</p>
 */
@interface AWSEC2DescribeBundleTasksRequest : AWSRequest


/**
 <p>One or more bundle task IDs.</p><p>Default: Describes all your bundle tasks.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable bundleIds;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>bundle-id</code> - The ID of the bundle task.</p></li><li><p><code>error-code</code> - If the task failed, the error code returned.</p></li><li><p><code>error-message</code> - If the task failed, the error message returned.</p></li><li><p><code>instance-id</code> - The ID of the instance.</p></li><li><p><code>progress</code> - The level of task completion, as a percentage (for example, 20%).</p></li><li><p><code>s3-bucket</code> - The Amazon S3 bucket to store the AMI.</p></li><li><p><code>s3-prefix</code> - The beginning of the AMI name.</p></li><li><p><code>start-time</code> - The time the task started (for example, 2013-09-15T17:15:20.000Z).</p></li><li><p><code>state</code> - The state of the task (<code>pending</code> | <code>waiting-for-shutdown</code> | <code>bundling</code> | <code>storing</code> | <code>cancelling</code> | <code>complete</code> | <code>failed</code>).</p></li><li><p><code>update-time</code> - The time of the most recent update for the task.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

@end

/**
 <p>Contains the output of DescribeBundleTasks.</p>
 */
@interface AWSEC2DescribeBundleTasksResult : AWSModel


/**
 <p>Information about one or more bundle tasks.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2BundleTask *> * _Nullable bundleTasks;

@end

/**
 <p>Contains the parameters for DescribeClassicLinkInstances.</p>
 */
@interface AWSEC2DescribeClassicLinkInstancesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>group-id</code> - The ID of a VPC security group that's associated with the instance.</p></li><li><p><code>instance-id</code> - The ID of the instance.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>vpc-id</code> - The ID of the VPC that the instance is linked to.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more instance IDs. Must be instances linked to a VPC through ClassicLink.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>The maximum number of results to return for the request in a single page. The remaining results of the initial request can be seen by sending another request with the returned <code>NextToken</code> value. This value can be between 5 and 1000; if <code>MaxResults</code> is given a value larger than 1000, only 1000 results are returned. You cannot specify this parameter and the instance IDs parameter in the same request.</p><p>Constraint: If the value is greater than 1000, we return only 1000 items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeClassicLinkInstances.</p>
 */
@interface AWSEC2DescribeClassicLinkInstancesResult : AWSModel


/**
 <p>Information about one or more linked EC2-Classic instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ClassicLinkInstance *> * _Nullable instances;

/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the parameters for DescribeConversionTasks.</p>
 */
@interface AWSEC2DescribeConversionTasksRequest : AWSRequest


/**
 <p>One or more conversion task IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable conversionTaskIds;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

@end

/**
 <p>Contains the output for DescribeConversionTasks.</p>
 */
@interface AWSEC2DescribeConversionTasksResult : AWSModel


/**
 <p>Information about the conversion tasks.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ConversionTask *> * _Nullable conversionTasks;

@end

/**
 <p>Contains the parameters for DescribeCustomerGateways.</p>
 */
@interface AWSEC2DescribeCustomerGatewaysRequest : AWSRequest


/**
 <p>One or more customer gateway IDs.</p><p>Default: Describes all your customer gateways.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable customerGatewayIds;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>bgp-asn</code> - The customer gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN).</p></li><li><p><code>customer-gateway-id</code> - The ID of the customer gateway.</p></li><li><p><code>ip-address</code> - The IP address of the customer gateway's Internet-routable external interface.</p></li><li><p><code>state</code> - The state of the customer gateway (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p></li><li><p><code>type</code> - The type of customer gateway. Currently, the only supported type is <code>ipsec.1</code>.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

@end

/**
 <p>Contains the output of DescribeCustomerGateways.</p>
 */
@interface AWSEC2DescribeCustomerGatewaysResult : AWSModel


/**
 <p>Information about one or more customer gateways.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2CustomerGateway *> * _Nullable customerGateways;

@end

/**
 <p>Contains the parameters for DescribeDhcpOptions.</p>
 */
@interface AWSEC2DescribeDhcpOptionsRequest : AWSRequest


/**
 <p>The IDs of one or more DHCP options sets.</p><p>Default: Describes all your DHCP options sets.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable dhcpOptionsIds;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>dhcp-options-id</code> - The ID of a set of DHCP options.</p></li><li><p><code>key</code> - The key for one of the options (for example, <code>domain-name</code>).</p></li><li><p><code>value</code> - The value for one of the options.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

@end

/**
 <p>Contains the output of DescribeDhcpOptions.</p>
 */
@interface AWSEC2DescribeDhcpOptionsResult : AWSModel


/**
 <p>Information about one or more DHCP options sets.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2DhcpOptions *> * _Nullable dhcpOptions;

@end

/**
 <p>Contains the parameters for DescribeExportTasks.</p>
 */
@interface AWSEC2DescribeExportTasksRequest : AWSRequest


/**
 <p>One or more export task IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable exportTaskIds;

@end

/**
 <p>Contains the output for DescribeExportTasks.</p>
 */
@interface AWSEC2DescribeExportTasksResult : AWSModel


/**
 <p>Information about the export tasks.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ExportTask *> * _Nullable exportTasks;

@end

/**
 <p>Contains the parameters for DescribeFlowLogs.</p>
 */
@interface AWSEC2DescribeFlowLogsRequest : AWSRequest


/**
 <p>One or more filters.</p><ul><li><p><code>deliver-log-status</code> - The status of the logs delivery (<code>SUCCESS</code> | <code>FAILED</code>).</p></li><li><p><code>flow-log-id</code> - The ID of the flow log.</p></li><li><p><code>log-group-name</code> - The name of the log group.</p></li><li><p><code>resource-id</code> - The ID of the VPC, subnet, or network interface.</p></li><li><p><code>traffic-type</code> - The type of traffic (<code>ACCEPT</code> | <code>REJECT</code> | <code>ALL</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filter;

/**
 <p>One or more flow log IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable flowLogIds;

/**
 <p>The maximum number of results to return for the request in a single page. The remaining results can be seen by sending another request with the returned <code>NextToken</code> value. This value can be between 5 and 1000; if <code>MaxResults</code> is given a value larger than 1000, only 1000 results are returned. You cannot specify this parameter and the flow log IDs parameter in the same request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeFlowLogs.</p>
 */
@interface AWSEC2DescribeFlowLogsResult : AWSModel


/**
 <p>Information about the flow logs.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2FlowLog *> * _Nullable flowLogs;

/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the parameters for DescribeHosts.</p>
 */
@interface AWSEC2DescribeHostsRequest : AWSRequest


/**
 <p>One or more filters.</p><ul><li><p><code>instance-type</code> - The instance type size that the Dedicated host is configured to support.</p></li><li><p><code>auto-placement</code> - Whether auto-placement is enabled or disabled (<code>on</code> | <code>off</code>).</p></li><li><p><code>host-reservation-id</code> - The ID of the reservation associated with this host.</p></li><li><p><code>client-token</code> - The idempotency token you provided when you launched the instance</p></li><li><p><code>state</code>- The allocation state of the Dedicated host (<code>available</code> | <code>under-assessment</code> | <code>permanent-failure</code> | <code>released</code> | <code>released-permanent-failure</code>).</p></li><li><p><code>availability-zone</code> - The Availability Zone of the host.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filter;

/**
 <p>The IDs of the Dedicated hosts. The IDs are used for targeted instance launches.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable hostIds;

/**
 <p>The maximum number of results to return for the request in a single page. The remaining results can be seen by sending another request with the returned <code>nextToken</code> value. This value can be between 5 and 500; if <code>maxResults</code> is given a larger value than 500, you will receive an error. You cannot specify this parameter and the host IDs parameter in the same request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeHosts.</p>
 */
@interface AWSEC2DescribeHostsResult : AWSModel


/**
 <p>Information about the Dedicated hosts.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Host *> * _Nullable hosts;

/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the parameters for DescribeIdFormat.</p>
 */
@interface AWSEC2DescribeIdFormatRequest : AWSRequest


/**
 <p>The type of resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

@end

/**
 <p>Contains the output of DescribeIdFormat.</p>
 */
@interface AWSEC2DescribeIdFormatResult : AWSModel


/**
 <p>Information about the ID format for the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2IdFormat *> * _Nullable statuses;

@end

/**
 <p>Contains the parameters for DescribeImageAttribute.</p>
 Required parameters: [ImageId, Attribute]
 */
@interface AWSEC2DescribeImageAttributeRequest : AWSRequest


/**
 <p>The AMI attribute.</p><p><b>Note</b>: Depending on your account privileges, the <code>blockDeviceMapping</code> attribute may return a <code>Client.AuthFailure</code> error. If this happens, use <a>DescribeImages</a> to get information about the block device mapping for the AMI.</p>
 */
@property (nonatomic, assign) AWSEC2ImageAttributeName attribute;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

@end

/**
 <p>Contains the parameters for DescribeImages.</p>
 */
@interface AWSEC2DescribeImagesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Scopes the images by users with explicit launch permissions. Specify an AWS account ID, <code>self</code> (the sender of the request), or <code>all</code> (public AMIs).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable executableUsers;

/**
 <p>One or more filters.</p><ul><li><p><code>architecture</code> - The image architecture (<code>i386</code> | <code>x86_64</code>).</p></li><li><p><code>block-device-mapping.delete-on-termination</code> - A Boolean value that indicates whether the Amazon EBS volume is deleted on instance termination.</p></li><li><p><code>block-device-mapping.device-name</code> - The device name for the EBS volume (for example, <code>/dev/sdh</code>).</p></li><li><p><code>block-device-mapping.snapshot-id</code> - The ID of the snapshot used for the EBS volume.</p></li><li><p><code>block-device-mapping.volume-size</code> - The volume size of the EBS volume, in GiB.</p></li><li><p><code>block-device-mapping.volume-type</code> - The volume type of the EBS volume (<code>gp2</code> | <code>io1</code> | <code>st1 </code>| <code>sc1</code> | <code>standard</code>).</p></li><li><p><code>description</code> - The description of the image (provided during image creation).</p></li><li><p><code>hypervisor</code> - The hypervisor type (<code>ovm</code> | <code>xen</code>).</p></li><li><p><code>image-id</code> - The ID of the image.</p></li><li><p><code>image-type</code> - The image type (<code>machine</code> | <code>kernel</code> | <code>ramdisk</code>).</p></li><li><p><code>is-public</code> - A Boolean that indicates whether the image is public.</p></li><li><p><code>kernel-id</code> - The kernel ID.</p></li><li><p><code>manifest-location</code> - The location of the image manifest.</p></li><li><p><code>name</code> - The name of the AMI (provided during image creation).</p></li><li><p><code>owner-alias</code> - The AWS account alias (for example, <code>amazon</code>).</p></li><li><p><code>owner-id</code> - The AWS account ID of the image owner.</p></li><li><p><code>platform</code> - The platform. To only list Windows-based AMIs, use <code>windows</code>.</p></li><li><p><code>product-code</code> - The product code.</p></li><li><p><code>product-code.type</code> - The type of the product code (<code>devpay</code> | <code>marketplace</code>).</p></li><li><p><code>ramdisk-id</code> - The RAM disk ID.</p></li><li><p><code>root-device-name</code> - The name of the root device volume (for example, <code>/dev/sda1</code>).</p></li><li><p><code>root-device-type</code> - The type of the root device volume (<code>ebs</code> | <code>instance-store</code>).</p></li><li><p><code>state</code> - The state of the image (<code>available</code> | <code>pending</code> | <code>failed</code>).</p></li><li><p><code>state-reason-code</code> - The reason code for the state change.</p></li><li><p><code>state-reason-message</code> - The message for the state change.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the tag-value filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>virtualization-type</code> - The virtualization type (<code>paravirtual</code> | <code>hvm</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more image IDs.</p><p>Default: Describes all images available to you.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable imageIds;

/**
 <p>Filters the images by the owner. Specify an AWS account ID, <code>amazon</code> (owner is Amazon), <code>aws-marketplace</code> (owner is AWS Marketplace), <code>self</code> (owner is the sender of the request). Omitting this option returns all images for which you have launch permissions, regardless of ownership.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable owners;

@end

/**
 <p>Contains the output of DescribeImages.</p>
 */
@interface AWSEC2DescribeImagesResult : AWSModel


/**
 <p>Information about one or more images.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Image *> * _Nullable images;

@end

/**
 <p>Contains the parameters for DescribeImportImageTasks.</p>
 */
@interface AWSEC2DescribeImportImageTasksRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Filter tasks using the <code>task-state</code> filter and one of the following values: active, completed, deleting, deleted.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>A list of import image task IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable importTaskIds;

/**
 <p>The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token that indicates the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output for DescribeImportImageTasks.</p>
 */
@interface AWSEC2DescribeImportImageTasksResult : AWSModel


/**
 <p>A list of zero or more import image tasks that are currently active or were completed or canceled in the previous 7 days.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ImportImageTask *> * _Nullable importImageTasks;

/**
 <p>The token to use to get the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the parameters for DescribeImportSnapshotTasks.</p>
 */
@interface AWSEC2DescribeImportSnapshotTasksRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>A list of import snapshot task IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable importTaskIds;

/**
 <p>The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token that indicates the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output for DescribeImportSnapshotTasks.</p>
 */
@interface AWSEC2DescribeImportSnapshotTasksResult : AWSModel


/**
 <p>A list of zero or more import snapshot tasks that are currently active or were completed or canceled in the previous 7 days.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ImportSnapshotTask *> * _Nullable importSnapshotTasks;

/**
 <p>The token to use to get the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the parameters for DescribeInstanceAttribute.</p>
 Required parameters: [InstanceId, Attribute]
 */
@interface AWSEC2DescribeInstanceAttributeRequest : AWSRequest


/**
 <p>The instance attribute.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceAttributeName attribute;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 <p>Contains the parameters for DescribeInstanceStatus.</p>
 */
@interface AWSEC2DescribeInstanceStatusRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>availability-zone</code> - The Availability Zone of the instance.</p></li><li><p><code>event.code</code> - The code for the scheduled event (<code>instance-reboot</code> | <code>system-reboot</code> | <code>system-maintenance</code> | <code>instance-retirement</code> | <code>instance-stop</code>).</p></li><li><p><code>event.description</code> - A description of the event.</p></li><li><p><code>event.not-after</code> - The latest end time for the scheduled event (for example, <code>2014-09-15T17:15:20.000Z</code>).</p></li><li><p><code>event.not-before</code> - The earliest start time for the scheduled event (for example, <code>2014-09-15T17:15:20.000Z</code>).</p></li><li><p><code>instance-state-code</code> - The code for the instance state, as a 16-bit unsigned integer. The high byte is an opaque internal value and should be ignored. The low byte is set based on the state represented. The valid values are 0 (pending), 16 (running), 32 (shutting-down), 48 (terminated), 64 (stopping), and 80 (stopped).</p></li><li><p><code>instance-state-name</code> - The state of the instance (<code>pending</code> | <code>running</code> | <code>shutting-down</code> | <code>terminated</code> | <code>stopping</code> | <code>stopped</code>).</p></li><li><p><code>instance-status.reachability</code> - Filters on instance status where the name is <code>reachability</code> (<code>passed</code> | <code>failed</code> | <code>initializing</code> | <code>insufficient-data</code>).</p></li><li><p><code>instance-status.status</code> - The status of the instance (<code>ok</code> | <code>impaired</code> | <code>initializing</code> | <code>insufficient-data</code> | <code>not-applicable</code>).</p></li><li><p><code>system-status.reachability</code> - Filters on system status where the name is <code>reachability</code> (<code>passed</code> | <code>failed</code> | <code>initializing</code> | <code>insufficient-data</code>).</p></li><li><p><code>system-status.status</code> - The system status of the instance (<code>ok</code> | <code>impaired</code> | <code>initializing</code> | <code>insufficient-data</code> | <code>not-applicable</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>When <code>true</code>, includes the health status for all instances. When <code>false</code>, includes the health status for running instances only.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeAllInstances;

/**
 <p>One or more instance IDs.</p><p>Default: Describes all your instances.</p><p>Constraints: Maximum 100 explicitly specified instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value. This value can be between 5 and 1000. You cannot specify this parameter and the instance IDs parameter in the same call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeInstanceStatus.</p>
 */
@interface AWSEC2DescribeInstanceStatusResult : AWSModel


/**
 <p>One or more instance status descriptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceStatus *> * _Nullable instanceStatuses;

/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the parameters for DescribeInstances.</p>
 */
@interface AWSEC2DescribeInstancesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>affinity</code> - The affinity setting for an instance running on a Dedicated host (<code>default</code> | <code>host</code>).</p></li><li><p><code>architecture</code> - The instance architecture (<code>i386</code> | <code>x86_64</code>).</p></li><li><p><code>availability-zone</code> - The Availability Zone of the instance.</p></li><li><p><code>block-device-mapping.attach-time</code> - The attach time for an EBS volume mapped to the instance, for example, <code>2010-09-15T17:15:20.000Z</code>.</p></li><li><p><code>block-device-mapping.delete-on-termination</code> - A Boolean that indicates whether the EBS volume is deleted on instance termination.</p></li><li><p><code>block-device-mapping.device-name</code> - The device name for the EBS volume (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p></li><li><p><code>block-device-mapping.status</code> - The status for the EBS volume (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p></li><li><p><code>block-device-mapping.volume-id</code> - The volume ID of the EBS volume.</p></li><li><p><code>client-token</code> - The idempotency token you provided when you launched the instance.</p></li><li><p><code>dns-name</code> - The public DNS name of the instance.</p></li><li><p><code>group-id</code> - The ID of the security group for the instance. EC2-Classic only.</p></li><li><p><code>group-name</code> - The name of the security group for the instance. EC2-Classic only.</p></li><li><p><code>host-Id</code> - The ID of the Dedicated host on which the instance is running, if applicable.</p></li><li><p><code>hypervisor</code> - The hypervisor type of the instance (<code>ovm</code> | <code>xen</code>).</p></li><li><p><code>iam-instance-profile.arn</code> - The instance profile associated with the instance. Specified as an ARN.</p></li><li><p><code>image-id</code> - The ID of the image used to launch the instance.</p></li><li><p><code>instance-id</code> - The ID of the instance.</p></li><li><p><code>instance-lifecycle</code> - Indicates whether this is a Spot Instance or a Scheduled Instance (<code>spot</code> | <code>scheduled</code>).</p></li><li><p><code>instance-state-code</code> - The state of the instance, as a 16-bit unsigned integer. The high byte is an opaque internal value and should be ignored. The low byte is set based on the state represented. The valid values are: 0 (pending), 16 (running), 32 (shutting-down), 48 (terminated), 64 (stopping), and 80 (stopped).</p></li><li><p><code>instance-state-name</code> - The state of the instance (<code>pending</code> | <code>running</code> | <code>shutting-down</code> | <code>terminated</code> | <code>stopping</code> | <code>stopped</code>).</p></li><li><p><code>instance-type</code> - The type of instance (for example, <code>t2.micro</code>).</p></li><li><p><code>instance.group-id</code> - The ID of the security group for the instance. </p></li><li><p><code>instance.group-name</code> - The name of the security group for the instance. </p></li><li><p><code>ip-address</code> - The public IP address of the instance.</p></li><li><p><code>kernel-id</code> - The kernel ID.</p></li><li><p><code>key-name</code> - The name of the key pair used when the instance was launched.</p></li><li><p><code>launch-index</code> - When launching multiple instances, this is the index for the instance in the launch group (for example, 0, 1, 2, and so on). </p></li><li><p><code>launch-time</code> - The time when the instance was launched.</p></li><li><p><code>monitoring-state</code> - Indicates whether monitoring is enabled for the instance (<code>disabled</code> | <code>enabled</code>).</p></li><li><p><code>owner-id</code> - The AWS account ID of the instance owner.</p></li><li><p><code>placement-group-name</code> - The name of the placement group for the instance.</p></li><li><p><code>platform</code> - The platform. Use <code>windows</code> if you have Windows instances; otherwise, leave blank.</p></li><li><p><code>private-dns-name</code> - The private DNS name of the instance.</p></li><li><p><code>private-ip-address</code> - The private IP address of the instance.</p></li><li><p><code>product-code</code> - The product code associated with the AMI used to launch the instance.</p></li><li><p><code>product-code.type</code> - The type of product code (<code>devpay</code> | <code>marketplace</code>).</p></li><li><p><code>ramdisk-id</code> - The RAM disk ID.</p></li><li><p><code>reason</code> - The reason for the current state of the instance (for example, shows "User Initiated [date]" when you stop or terminate the instance). Similar to the state-reason-code filter.</p></li><li><p><code>requester-id</code> - The ID of the entity that launched the instance on your behalf (for example, AWS Management Console, Auto Scaling, and so on).</p></li><li><p><code>reservation-id</code> - The ID of the instance's reservation. A reservation ID is created any time you launch an instance. A reservation ID has a one-to-one relationship with an instance launch request, but can be associated with more than one instance if you launch multiple instances using the same launch request. For example, if you launch one instance, you'll get one reservation ID. If you launch ten instances using the same launch request, you'll also get one reservation ID.</p></li><li><p><code>root-device-name</code> - The name of the root device for the instance (for example, <code>/dev/sda1</code> or <code>/dev/xvda</code>).</p></li><li><p><code>root-device-type</code> - The type of root device that the instance uses (<code>ebs</code> | <code>instance-store</code>).</p></li><li><p><code>source-dest-check</code> - Indicates whether the instance performs source/destination checking. A value of <code>true</code> means that checking is enabled, and <code>false</code> means checking is disabled. The value must be <code>false</code> for the instance to perform network address translation (NAT) in your VPC. </p></li><li><p><code>spot-instance-request-id</code> - The ID of the Spot instance request.</p></li><li><p><code>state-reason-code</code> - The reason code for the state change.</p></li><li><p><code>state-reason-message</code> - A message that describes the state change.</p></li><li><p><code>subnet-id</code> - The ID of the subnet for the instance.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource, where <code>tag</code>:<i>key</i> is the tag's key. </p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>tenancy</code> - The tenancy of an instance (<code>dedicated</code> | <code>default</code> | <code>host</code>).</p></li><li><p><code>virtualization-type</code> - The virtualization type of the instance (<code>paravirtual</code> | <code>hvm</code>).</p></li><li><p><code>vpc-id</code> - The ID of the VPC that the instance is running in.</p></li><li><p><code>network-interface.description</code> - The description of the network interface.</p></li><li><p><code>network-interface.subnet-id</code> - The ID of the subnet for the network interface.</p></li><li><p><code>network-interface.vpc-id</code> - The ID of the VPC for the network interface.</p></li><li><p><code>network-interface.network-interface-id</code> - The ID of the network interface.</p></li><li><p><code>network-interface.owner-id</code> - The ID of the owner of the network interface.</p></li><li><p><code>network-interface.availability-zone</code> - The Availability Zone for the network interface.</p></li><li><p><code>network-interface.requester-id</code> - The requester ID for the network interface.</p></li><li><p><code>network-interface.requester-managed</code> - Indicates whether the network interface is being managed by AWS.</p></li><li><p><code>network-interface.status</code> - The status of the network interface (<code>available</code>) | <code>in-use</code>).</p></li><li><p><code>network-interface.mac-address</code> - The MAC address of the network interface.</p></li><li><p><code>network-interface.private-dns-name</code> - The private DNS name of the network interface.</p></li><li><p><code>network-interface.source-dest-check</code> - Whether the network interface performs source/destination checking. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. The value must be <code>false</code> for the network interface to perform network address translation (NAT) in your VPC.</p></li><li><p><code>network-interface.group-id</code> - The ID of a security group associated with the network interface.</p></li><li><p><code>network-interface.group-name</code> - The name of a security group associated with the network interface.</p></li><li><p><code>network-interface.attachment.attachment-id</code> - The ID of the interface attachment.</p></li><li><p><code>network-interface.attachment.instance-id</code> - The ID of the instance to which the network interface is attached.</p></li><li><p><code>network-interface.attachment.instance-owner-id</code> - The owner ID of the instance to which the network interface is attached.</p></li><li><p><code>network-interface.addresses.private-ip-address</code> - The private IP address associated with the network interface.</p></li><li><p><code>network-interface.attachment.device-index</code> - The device index to which the network interface is attached.</p></li><li><p><code>network-interface.attachment.status</code> - The status of the attachment (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p></li><li><p><code>network-interface.attachment.attach-time</code> - The time that the network interface was attached to an instance.</p></li><li><p><code>network-interface.attachment.delete-on-termination</code> - Specifies whether the attachment is deleted when an instance is terminated.</p></li><li><p><code>network-interface.addresses.primary</code> - Specifies whether the IP address of the network interface is the primary private IP address.</p></li><li><p><code>network-interface.addresses.association.public-ip</code> - The ID of the association of an Elastic IP address with a network interface.</p></li><li><p><code>network-interface.addresses.association.ip-owner-id</code> - The owner ID of the private IP address associated with the network interface.</p></li><li><p><code>association.public-ip</code> - The address of the Elastic IP address bound to the network interface.</p></li><li><p><code>association.ip-owner-id</code> - The owner of the Elastic IP address associated with the network interface.</p></li><li><p><code>association.allocation-id</code> - The allocation ID returned when you allocated the Elastic IP address for your network interface.</p></li><li><p><code>association.association-id</code> - The association ID returned when the network interface was associated with an IP address.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more instance IDs.</p><p>Default: Describes all your instances.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

/**
 <p>The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value. This value can be between 5 and 1000. You cannot specify this parameter and the instance IDs parameter in the same call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to request the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeInstances.</p>
 */
@interface AWSEC2DescribeInstancesResult : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Zero or more reservations.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Reservation *> * _Nullable reservations;

@end

/**
 <p>Contains the parameters for DescribeInternetGateways.</p>
 */
@interface AWSEC2DescribeInternetGatewaysRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>attachment.state</code> - The current state of the attachment between the gateway and the VPC (<code>available</code>). Present only if a VPC is attached.</p></li><li><p><code>attachment.vpc-id</code> - The ID of an attached VPC.</p></li><li><p><code>internet-gateway-id</code> - The ID of the Internet gateway.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more Internet gateway IDs.</p><p>Default: Describes all your Internet gateways.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable internetGatewayIds;

@end

/**
 <p>Contains the output of DescribeInternetGateways.</p>
 */
@interface AWSEC2DescribeInternetGatewaysResult : AWSModel


/**
 <p>Information about one or more Internet gateways.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InternetGateway *> * _Nullable internetGateways;

@end

/**
 <p>Contains the parameters for DescribeKeyPairs.</p>
 */
@interface AWSEC2DescribeKeyPairsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>fingerprint</code> - The fingerprint of the key pair.</p></li><li><p><code>key-name</code> - The name of the key pair.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more key pair names.</p><p>Default: Describes all your key pairs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable keyNames;

@end

/**
 <p>Contains the output of DescribeKeyPairs.</p>
 */
@interface AWSEC2DescribeKeyPairsResult : AWSModel


/**
 <p>Information about one or more key pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2KeyPairInfo *> * _Nullable keyPairs;

@end

/**
 <p>Contains the parameters for DescribeMovingAddresses.</p>
 */
@interface AWSEC2DescribeMovingAddressesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>moving-status</code> - The status of the Elastic IP address (<code>MovingToVpc</code> | <code>RestoringToClassic</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>The maximum number of results to return for the request in a single page. The remaining results of the initial request can be seen by sending another request with the returned <code>NextToken</code> value. This value can be between 5 and 1000; if <code>MaxResults</code> is given a value outside of this range, an error is returned.</p><p>Default: If no value is provided, the default is 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to use to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>One or more Elastic IP addresses.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable publicIps;

@end

/**
 <p>Contains the output of DescribeMovingAddresses.</p>
 */
@interface AWSEC2DescribeMovingAddressesResult : AWSModel


/**
 <p>The status for each Elastic IP address.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2MovingAddressStatus *> * _Nullable movingAddressStatuses;

/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the parameters for DescribeNatGateways.</p>
 */
@interface AWSEC2DescribeNatGatewaysRequest : AWSRequest


/**
 <p>One or more filters.</p><ul><li><p><code>nat-gateway-id</code> - The ID of the NAT gateway.</p></li><li><p><code>state</code> - The state of the NAT gateway (<code>pending</code> | <code>failed</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p></li><li><p><code>subnet-id</code> - The ID of the subnet in which the NAT gateway resides.</p></li><li><p><code>vpc-id</code> - The ID of the VPC in which the NAT gateway resides.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filter;

/**
 <p>The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results.</p><p>Constraint: If the value specified is greater than 1000, we return only 1000 items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>One or more NAT gateway IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable natGatewayIds;

/**
 <p>The token to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeNatGateways.</p>
 */
@interface AWSEC2DescribeNatGatewaysResult : AWSModel


/**
 <p>Information about the NAT gateways.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2NatGateway *> * _Nullable natGateways;

/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the parameters for DescribeNetworkAcls.</p>
 */
@interface AWSEC2DescribeNetworkAclsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>association.association-id</code> - The ID of an association ID for the ACL.</p></li><li><p><code>association.network-acl-id</code> - The ID of the network ACL involved in the association.</p></li><li><p><code>association.subnet-id</code> - The ID of the subnet involved in the association.</p></li><li><p><code>default</code> - Indicates whether the ACL is the default network ACL for the VPC.</p></li><li><p><code>entry.cidr</code> - The CIDR range specified in the entry.</p></li><li><p><code>entry.egress</code> - Indicates whether the entry applies to egress traffic.</p></li><li><p><code>entry.icmp.code</code> - The ICMP code specified in the entry, if any.</p></li><li><p><code>entry.icmp.type</code> - The ICMP type specified in the entry, if any.</p></li><li><p><code>entry.port-range.from</code> - The start of the port range specified in the entry. </p></li><li><p><code>entry.port-range.to</code> - The end of the port range specified in the entry. </p></li><li><p><code>entry.protocol</code> - The protocol specified in the entry (<code>tcp</code> | <code>udp</code> | <code>icmp</code> or a protocol number).</p></li><li><p><code>entry.rule-action</code> - Allows or denies the matching traffic (<code>allow</code> | <code>deny</code>).</p></li><li><p><code>entry.rule-number</code> - The number of an entry (in other words, rule) in the ACL's set of entries.</p></li><li><p><code>network-acl-id</code> - The ID of the network ACL.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>vpc-id</code> - The ID of the VPC for the network ACL.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more network ACL IDs.</p><p>Default: Describes all your network ACLs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable networkAclIds;

@end

/**
 <p>Contains the output of DescribeNetworkAcls.</p>
 */
@interface AWSEC2DescribeNetworkAclsResult : AWSModel


/**
 <p>Information about one or more network ACLs.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2NetworkAcl *> * _Nullable networkAcls;

@end

/**
 <p>Contains the parameters for DescribeNetworkInterfaceAttribute.</p>
 Required parameters: [NetworkInterfaceId]
 */
@interface AWSEC2DescribeNetworkInterfaceAttributeRequest : AWSRequest


/**
 <p>The attribute of the network interface.</p>
 */
@property (nonatomic, assign) AWSEC2NetworkInterfaceAttribute attribute;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

@end

/**
 <p>Contains the output of DescribeNetworkInterfaceAttribute.</p>
 */
@interface AWSEC2DescribeNetworkInterfaceAttributeResult : AWSModel


/**
 <p>The attachment (if any) of the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkInterfaceAttachment * _Nullable attachment;

/**
 <p>The description of the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable detail;

/**
 <p>The security groups associated with the network interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2GroupIdentifier *> * _Nullable groups;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>Indicates whether source/destination checking is enabled.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable sourceDestCheck;

@end

/**
 <p>Contains the parameters for DescribeNetworkInterfaces.</p>
 */
@interface AWSEC2DescribeNetworkInterfacesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>addresses.private-ip-address</code> - The private IP addresses associated with the network interface.</p></li><li><p><code>addresses.primary</code> - Whether the private IP address is the primary IP address associated with the network interface. </p></li><li><p><code>addresses.association.public-ip</code> - The association ID returned when the network interface was associated with the Elastic IP address.</p></li><li><p><code>addresses.association.owner-id</code> - The owner ID of the addresses associated with the network interface.</p></li><li><p><code>association.association-id</code> - The association ID returned when the network interface was associated with an IP address.</p></li><li><p><code>association.allocation-id</code> - The allocation ID returned when you allocated the Elastic IP address for your network interface.</p></li><li><p><code>association.ip-owner-id</code> - The owner of the Elastic IP address associated with the network interface.</p></li><li><p><code>association.public-ip</code> - The address of the Elastic IP address bound to the network interface.</p></li><li><p><code>association.public-dns-name</code> - The public DNS name for the network interface.</p></li><li><p><code>attachment.attachment-id</code> - The ID of the interface attachment.</p></li><li><p><code>attachment.attach.time</code> - The time that the network interface was attached to an instance.</p></li><li><p><code>attachment.delete-on-termination</code> - Indicates whether the attachment is deleted when an instance is terminated.</p></li><li><p><code>attachment.device-index</code> - The device index to which the network interface is attached.</p></li><li><p><code>attachment.instance-id</code> - The ID of the instance to which the network interface is attached.</p></li><li><p><code>attachment.instance-owner-id</code> - The owner ID of the instance to which the network interface is attached.</p></li><li><p><code>attachment.nat-gateway-id</code> - The ID of the NAT gateway to which the network interface is attached.</p></li><li><p><code>attachment.status</code> - The status of the attachment (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p></li><li><p><code>availability-zone</code> - The Availability Zone of the network interface.</p></li><li><p><code>description</code> - The description of the network interface.</p></li><li><p><code>group-id</code> - The ID of a security group associated with the network interface.</p></li><li><p><code>group-name</code> - The name of a security group associated with the network interface.</p></li><li><p><code>mac-address</code> - The MAC address of the network interface.</p></li><li><p><code>network-interface-id</code> - The ID of the network interface.</p></li><li><p><code>owner-id</code> - The AWS account ID of the network interface owner.</p></li><li><p><code>private-ip-address</code> - The private IP address or addresses of the network interface.</p></li><li><p><code>private-dns-name</code> - The private DNS name of the network interface.</p></li><li><p><code>requester-id</code> - The ID of the entity that launched the instance on your behalf (for example, AWS Management Console, Auto Scaling, and so on).</p></li><li><p><code>requester-managed</code> - Indicates whether the network interface is being managed by an AWS service (for example, AWS Management Console, Auto Scaling, and so on).</p></li><li><p><code>source-desk-check</code> - Indicates whether the network interface performs source/destination checking. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. The value must be <code>false</code> for the network interface to perform network address translation (NAT) in your VPC. </p></li><li><p><code>status</code> - The status of the network interface. If the network interface is not attached to an instance, the status is <code>available</code>; if a network interface is attached to an instance the status is <code>in-use</code>.</p></li><li><p><code>subnet-id</code> - The ID of the subnet for the network interface.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>vpc-id</code> - The ID of the VPC for the network interface.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more network interface IDs.</p><p>Default: Describes all your network interfaces.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable networkInterfaceIds;

@end

/**
 <p>Contains the output of DescribeNetworkInterfaces.</p>
 */
@interface AWSEC2DescribeNetworkInterfacesResult : AWSModel


/**
 <p>Information about one or more network interfaces.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2NetworkInterface *> * _Nullable networkInterfaces;

@end

/**
 <p>Contains the parameters for DescribePlacementGroups.</p>
 */
@interface AWSEC2DescribePlacementGroupsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>group-name</code> - The name of the placement group.</p></li><li><p><code>state</code> - The state of the placement group (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p></li><li><p><code>strategy</code> - The strategy of the placement group (<code>cluster</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more placement group names.</p><p>Default: Describes all your placement groups, or only those otherwise specified.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupNames;

@end

/**
 <p>Contains the output of DescribePlacementGroups.</p>
 */
@interface AWSEC2DescribePlacementGroupsResult : AWSModel


/**
 <p>One or more placement groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2PlacementGroup *> * _Nullable placementGroups;

@end

/**
 <p>Contains the parameters for DescribePrefixLists.</p>
 */
@interface AWSEC2DescribePrefixListsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>prefix-list-id</code>: The ID of a prefix list.</p></li><li><p><code>prefix-list-name</code>: The name of a prefix list.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results.</p><p>Constraint: If the value specified is greater than 1000, we return only 1000 items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a prior call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>One or more prefix list IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable prefixListIds;

@end

/**
 <p>Contains the output of DescribePrefixLists.</p>
 */
@interface AWSEC2DescribePrefixListsResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>All available prefix lists.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2PrefixList *> * _Nullable prefixLists;

@end

/**
 <p>Contains the parameters for DescribeRegions.</p>
 */
@interface AWSEC2DescribeRegionsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>endpoint</code> - The endpoint of the region (for example, <code>ec2.us-east-1.amazonaws.com</code>).</p></li><li><p><code>region-name</code> - The name of the region (for example, <code>us-east-1</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>The names of one or more regions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable regionNames;

@end

/**
 <p>Contains the output of DescribeRegions.</p>
 */
@interface AWSEC2DescribeRegionsResult : AWSModel


/**
 <p>Information about one or more regions.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Region *> * _Nullable regions;

@end

/**
 <p>Contains the parameters for DescribeReservedInstancesListings.</p>
 */
@interface AWSEC2DescribeReservedInstancesListingsRequest : AWSRequest


/**
 <p>One or more filters.</p><ul><li><p><code>reserved-instances-id</code> - The ID of the Reserved Instances.</p></li><li><p><code>reserved-instances-listing-id</code> - The ID of the Reserved Instances listing.</p></li><li><p><code>status</code> - The status of the Reserved Instance listing (<code>pending</code> | <code>active</code> | <code>cancelled</code> | <code>closed</code>).</p></li><li><p><code>status-message</code> - The reason for the status.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more Reserved Instance IDs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesId;

/**
 <p>One or more Reserved Instance listing IDs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesListingId;

@end

/**
 <p>Contains the output of DescribeReservedInstancesListings.</p>
 */
@interface AWSEC2DescribeReservedInstancesListingsResult : AWSModel


/**
 <p>Information about the Reserved Instance listing.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ReservedInstancesListing *> * _Nullable reservedInstancesListings;

@end

/**
 <p>Contains the parameters for DescribeReservedInstancesModifications.</p>
 */
@interface AWSEC2DescribeReservedInstancesModificationsRequest : AWSRequest


/**
 <p>One or more filters.</p><ul><li><p><code>client-token</code> - The idempotency token for the modification request.</p></li><li><p><code>create-date</code> - The time when the modification request was created.</p></li><li><p><code>effective-date</code> - The time when the modification becomes effective.</p></li><li><p><code>modification-result.reserved-instances-id</code> - The ID for the Reserved Instances created as part of the modification request. This ID is only available when the status of the modification is <code>fulfilled</code>.</p></li><li><p><code>modification-result.target-configuration.availability-zone</code> - The Availability Zone for the new Reserved Instances.</p></li><li><p><code>modification-result.target-configuration.instance-count </code> - The number of new Reserved Instances.</p></li><li><p><code>modification-result.target-configuration.instance-type</code> - The instance type of the new Reserved Instances.</p></li><li><p><code>modification-result.target-configuration.platform</code> - The network platform of the new Reserved Instances (<code>EC2-Classic</code> | <code>EC2-VPC</code>).</p></li><li><p><code>reserved-instances-id</code> - The ID of the Reserved Instances modified.</p></li><li><p><code>reserved-instances-modification-id</code> - The ID of the modification request.</p></li><li><p><code>status</code> - The status of the Reserved Instances modification request (<code>processing</code> | <code>fulfilled</code> | <code>failed</code>).</p></li><li><p><code>status-message</code> - The reason for the status.</p></li><li><p><code>update-date</code> - The time when the modification request was last updated.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>The token to retrieve the next page of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>IDs for the submitted modification request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reservedInstancesModificationIds;

@end

/**
 <p>Contains the output of DescribeReservedInstancesModifications.</p>
 */
@interface AWSEC2DescribeReservedInstancesModificationsResult : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Reserved Instance modification information.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ReservedInstancesModification *> * _Nullable reservedInstancesModifications;

@end

/**
 <p>Contains the parameters for DescribeReservedInstancesOfferings.</p>
 */
@interface AWSEC2DescribeReservedInstancesOfferingsRequest : AWSRequest


/**
 <p>The Availability Zone in which the Reserved Instance can be used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>availability-zone</code> - The Availability Zone where the Reserved Instance can be used.</p></li><li><p><code>duration</code> - The duration of the Reserved Instance (for example, one year or three years), in seconds (<code>31536000</code> | <code>94608000</code>).</p></li><li><p><code>fixed-price</code> - The purchase price of the Reserved Instance (for example, 9800.0).</p></li><li><p><code>instance-type</code> - The instance type that is covered by the reservation.</p></li><li><p><code>marketplace</code> - Set to <code>true</code> to show only Reserved Instance Marketplace offerings. When this filter is not used, which is the default behavior, all offerings from both AWS and the Reserved Instance Marketplace are listed.</p></li><li><p><code>product-description</code> - The Reserved Instance product platform description. Instances that include <code>(Amazon VPC)</code> in the product platform description will only be displayed to EC2-Classic account holders and are for use with Amazon VPC. (<code>Linux/UNIX</code> | <code>Linux/UNIX (Amazon VPC)</code> | <code>SUSE Linux</code> | <code>SUSE Linux (Amazon VPC)</code> | <code>Red Hat Enterprise Linux</code> | <code>Red Hat Enterprise Linux (Amazon VPC)</code> | <code>Windows</code> | <code>Windows (Amazon VPC)</code> | <code>Windows with SQL Server Standard</code> | <code>Windows with SQL Server Standard (Amazon VPC)</code> | <code>Windows with SQL Server Web</code> | <code> Windows with SQL Server Web (Amazon VPC)</code> | <code>Windows with SQL Server Enterprise</code> | <code>Windows with SQL Server Enterprise (Amazon VPC)</code>) </p></li><li><p><code>reserved-instances-offering-id</code> - The Reserved Instances offering ID.</p></li><li><p><code>usage-price</code> - The usage price of the Reserved Instance, per hour (for example, 0.84).</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>Include Reserved Instance Marketplace offerings in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeMarketplace;

/**
 <p>The tenancy of the instances covered by the reservation. A Reserved Instance with a tenancy of <code>dedicated</code> is applied to instances that run in a VPC on single-tenant hardware (i.e., Dedicated Instances).</p><p>Default: <code>default</code></p>
 */
@property (nonatomic, assign) AWSEC2Tenancy instanceTenancy;

/**
 <p>The instance type that the reservation will cover (for example, <code>m1.small</code>). For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 <p>The maximum duration (in seconds) to filter when searching for offerings.</p><p>Default: 94608000 (3 years)</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxDuration;

/**
 <p>The maximum number of instances to filter when searching for offerings.</p><p>Default: 20</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxInstanceCount;

/**
 <p>The maximum number of results to return for the request in a single page. The remaining results of the initial request can be seen by sending another request with the returned <code>NextToken</code> value. The maximum is 100.</p><p>Default: 100</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The minimum duration (in seconds) to filter when searching for offerings.</p><p>Default: 2592000 (1 month)</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minDuration;

/**
 <p>The token to retrieve the next page of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The Reserved Instance offering type. If you are using tools that predate the 2011-11-01 API version, you only have access to the <code>Medium Utilization</code> Reserved Instance offering type. </p>
 */
@property (nonatomic, assign) AWSEC2OfferingTypeValues offeringType;

/**
 <p>The Reserved Instance product platform description. Instances that include <code>(Amazon VPC)</code> in the description are for use with Amazon VPC.</p>
 */
@property (nonatomic, assign) AWSEC2RIProductDescription productDescription;

/**
 <p>One or more Reserved Instances offering IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reservedInstancesOfferingIds;

@end

/**
 <p>Contains the output of DescribeReservedInstancesOfferings.</p>
 */
@interface AWSEC2DescribeReservedInstancesOfferingsResult : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of Reserved Instances offerings.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ReservedInstancesOffering *> * _Nullable reservedInstancesOfferings;

@end

/**
 <p>Contains the parameters for DescribeReservedInstances.</p>
 */
@interface AWSEC2DescribeReservedInstancesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>availability-zone</code> - The Availability Zone where the Reserved Instance can be used.</p></li><li><p><code>duration</code> - The duration of the Reserved Instance (one year or three years), in seconds (<code>31536000</code> | <code>94608000</code>).</p></li><li><p><code>end</code> - The time when the Reserved Instance expires (for example, 2015-08-07T11:54:42.000Z).</p></li><li><p><code>fixed-price</code> - The purchase price of the Reserved Instance (for example, 9800.0).</p></li><li><p><code>instance-type</code> - The instance type that is covered by the reservation.</p></li><li><p><code>product-description</code> - The Reserved Instance product platform description. Instances that include <code>(Amazon VPC)</code> in the product platform description will only be displayed to EC2-Classic account holders and are for use with Amazon VPC (<code>Linux/UNIX</code> | <code>Linux/UNIX (Amazon VPC)</code> | <code>SUSE Linux</code> | <code>SUSE Linux (Amazon VPC)</code> | <code>Red Hat Enterprise Linux</code> | <code>Red Hat Enterprise Linux (Amazon VPC)</code> | <code>Windows</code> | <code>Windows (Amazon VPC)</code> | <code>Windows with SQL Server Standard</code> | <code>Windows with SQL Server Standard (Amazon VPC)</code> | <code>Windows with SQL Server Web</code> | <code>Windows with SQL Server Web (Amazon VPC)</code> | <code>Windows with SQL Server Enterprise</code> | <code>Windows with SQL Server Enterprise (Amazon VPC)</code>).</p></li><li><p><code>reserved-instances-id</code> - The ID of the Reserved Instance.</p></li><li><p><code>start</code> - The time at which the Reserved Instance purchase request was placed (for example, 2014-08-07T11:54:42.000Z).</p></li><li><p><code>state</code> - The state of the Reserved Instance (<code>payment-pending</code> | <code>active</code> | <code>payment-failed</code> | <code>retired</code>).</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>usage-price</code> - The usage price of the Reserved Instance, per hour (for example, 0.84).</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>The Reserved Instance offering type. If you are using tools that predate the 2011-11-01 API version, you only have access to the <code>Medium Utilization</code> Reserved Instance offering type. </p>
 */
@property (nonatomic, assign) AWSEC2OfferingTypeValues offeringType;

/**
 <p>One or more Reserved Instance IDs.</p><p>Default: Describes all your Reserved Instances, or only those otherwise specified.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reservedInstancesIds;

@end

/**
 <p>Contains the output for DescribeReservedInstances.</p>
 */
@interface AWSEC2DescribeReservedInstancesResult : AWSModel


/**
 <p>A list of Reserved Instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ReservedInstances *> * _Nullable reservedInstances;

@end

/**
 <p>Contains the parameters for DescribeRouteTables.</p>
 */
@interface AWSEC2DescribeRouteTablesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>association.route-table-association-id</code> - The ID of an association ID for the route table.</p></li><li><p><code>association.route-table-id</code> - The ID of the route table involved in the association.</p></li><li><p><code>association.subnet-id</code> - The ID of the subnet involved in the association.</p></li><li><p><code>association.main</code> - Indicates whether the route table is the main route table for the VPC (<code>true</code> | <code>false</code>).</p></li><li><p><code>route-table-id</code> - The ID of the route table.</p></li><li><p><code>route.destination-cidr-block</code> - The CIDR range specified in a route in the table.</p></li><li><p><code>route.destination-prefix-list-id</code> - The ID (prefix) of the AWS service specified in a route in the table.</p></li><li><p><code>route.gateway-id</code> - The ID of a gateway specified in a route in the table.</p></li><li><p><code>route.instance-id</code> - The ID of an instance specified in a route in the table.</p></li><li><p><code>route.nat-gateway-id</code> - The ID of a NAT gateway.</p></li><li><p><code>route.origin</code> - Describes how the route was created. <code>CreateRouteTable</code> indicates that the route was automatically created when the route table was created; <code>CreateRoute</code> indicates that the route was manually added to the route table; <code>EnableVgwRoutePropagation</code> indicates that the route was propagated by route propagation.</p></li><li><p><code>route.state</code> - The state of a route in the route table (<code>active</code> | <code>blackhole</code>). The blackhole state indicates that the route's target isn't available (for example, the specified gateway isn't attached to the VPC, the specified NAT instance has been terminated, and so on).</p></li><li><p><code>route.vpc-peering-connection-id</code> - The ID of a VPC peering connection specified in a route in the table.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>vpc-id</code> - The ID of the VPC for the route table.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more route table IDs.</p><p>Default: Describes all your route tables.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable routeTableIds;

@end

/**
 <p>Contains the output of DescribeRouteTables.</p>
 */
@interface AWSEC2DescribeRouteTablesResult : AWSModel


/**
 <p>Information about one or more route tables. </p>
 */
@property (nonatomic, strong) NSArray<AWSEC2RouteTable *> * _Nullable routeTables;

@end

/**
 <p>Contains the parameters for DescribeScheduledInstanceAvailability.</p>
 Required parameters: [Recurrence, FirstSlotStartTimeRange]
 */
@interface AWSEC2DescribeScheduledInstanceAvailabilityRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>availability-zone</code> - The Availability Zone (for example, <code>us-west-2a</code>).</p></li><li><p><code>instance-type</code> - The instance type (for example, <code>c4.large</code>).</p></li><li><p><code>network-platform</code> - The network platform (<code>EC2-Classic</code> or <code>EC2-VPC</code>).</p></li><li><p><code>platform</code> - The platform (<code>Linux/UNIX</code> or <code>Windows</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>The time period for the first schedule to start.</p>
 */
@property (nonatomic, strong) AWSEC2SlotDateTimeRangeRequest * _Nullable firstSlotStartTimeRange;

/**
 <p>The maximum number of results to return in a single call. This value can be between 5 and 300. The default value is 300. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The maximum available duration, in hours. This value must be greater than <code>MinSlotDurationInHours</code> and less than 1,720.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSlotDurationInHours;

/**
 <p>The minimum available duration, in hours. The minimum required duration is 1,200 hours per year. For example, the minimum daily schedule is 4 hours, the minimum weekly schedule is 24 hours, and the minimum monthly schedule is 100 hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minSlotDurationInHours;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The schedule recurrence.</p>
 */
@property (nonatomic, strong) AWSEC2ScheduledInstanceRecurrenceRequest * _Nullable recurrence;

@end

/**
 <p>Contains the output of DescribeScheduledInstanceAvailability.</p>
 */
@interface AWSEC2DescribeScheduledInstanceAvailabilityResult : AWSModel


/**
 <p>The token required to retrieve the next set of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the available Scheduled Instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ScheduledInstanceAvailability *> * _Nullable scheduledInstanceAvailabilitySet;

@end

/**
 <p>Contains the parameters for DescribeScheduledInstances.</p>
 */
@interface AWSEC2DescribeScheduledInstancesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>availability-zone</code> - The Availability Zone (for example, <code>us-west-2a</code>).</p></li><li><p><code>instance-type</code> - The instance type (for example, <code>c4.large</code>).</p></li><li><p><code>network-platform</code> - The network platform (<code>EC2-Classic</code> or <code>EC2-VPC</code>).</p></li><li><p><code>platform</code> - The platform (<code>Linux/UNIX</code> or <code>Windows</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>The maximum number of results to return in a single call. This value can be between 5 and 300. The default value is 100. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>One or more Scheduled Instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scheduledInstanceIds;

/**
 <p>The time period for the first schedule to start.</p>
 */
@property (nonatomic, strong) AWSEC2SlotStartTimeRangeRequest * _Nullable slotStartTimeRange;

@end

/**
 <p>Contains the output of DescribeScheduledInstances.</p>
 */
@interface AWSEC2DescribeScheduledInstancesResult : AWSModel


/**
 <p>The token required to retrieve the next set of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the Scheduled Instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ScheduledInstance *> * _Nullable scheduledInstanceSet;

@end

/**
 
 */
@interface AWSEC2DescribeSecurityGroupReferencesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the operation, without actually making the request, and provides an error response. If you have the required permissions, the error response is DryRunOperation. Otherwise, it is UnauthorizedOperation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more security group IDs in your account.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupId;

@end

/**
 
 */
@interface AWSEC2DescribeSecurityGroupReferencesResult : AWSModel


/**
 <p>Information about the VPCs with the referencing security groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2SecurityGroupReference *> * _Nullable securityGroupReferenceSet;

@end

/**
 <p>Contains the parameters for DescribeSecurityGroups.</p>
 */
@interface AWSEC2DescribeSecurityGroupsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters. If using multiple filters for rules, the results include security groups for which any combination of rules - not necessarily a single rule - match all filters.</p><ul><li><p><code>description</code> - The description of the security group.</p></li><li><p><code>egress.ip-permission.prefix-list-id</code> - The ID (prefix) of the AWS service to which the security group allows access.</p></li><li><p><code>group-id</code> - The ID of the security group. </p></li><li><p><code>group-name</code> - The name of the security group.</p></li><li><p><code>ip-permission.cidr</code> - A CIDR range that has been granted permission.</p></li><li><p><code>ip-permission.from-port</code> - The start of port range for the TCP and UDP protocols, or an ICMP type number.</p></li><li><p><code>ip-permission.group-id</code> - The ID of a security group that has been granted permission.</p></li><li><p><code>ip-permission.group-name</code> - The name of a security group that has been granted permission.</p></li><li><p><code>ip-permission.protocol</code> - The IP protocol for the permission (<code>tcp</code> | <code>udp</code> | <code>icmp</code> or a protocol number).</p></li><li><p><code>ip-permission.to-port</code> - The end of port range for the TCP and UDP protocols, or an ICMP code.</p></li><li><p><code>ip-permission.user-id</code> - The ID of an AWS account that has been granted permission.</p></li><li><p><code>owner-id</code> - The AWS account ID of the owner of the security group.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the security group.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the security group.</p></li><li><p><code>vpc-id</code> - The ID of the VPC specified when the security group was created.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more security group IDs. Required for security groups in a nondefault VPC.</p><p>Default: Describes all your security groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupIds;

/**
 <p>[EC2-Classic and default VPC only] One or more security group names. You can specify either the security group name or the security group ID. For security groups in a nondefault VPC, use the <code>group-name</code> filter to describe security groups by name.</p><p>Default: Describes all your security groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupNames;

@end

/**
 <p>Contains the output of DescribeSecurityGroups.</p>
 */
@interface AWSEC2DescribeSecurityGroupsResult : AWSModel


/**
 <p>Information about one or more security groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2SecurityGroup *> * _Nullable securityGroups;

@end

/**
 <p>Contains the parameters for DescribeSnapshotAttribute.</p>
 Required parameters: [SnapshotId, Attribute]
 */
@interface AWSEC2DescribeSnapshotAttributeRequest : AWSRequest


/**
 <p>The snapshot attribute you would like to view.</p>
 */
@property (nonatomic, assign) AWSEC2SnapshotAttributeName attribute;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the EBS snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

@end

/**
 <p>Contains the output of DescribeSnapshotAttribute.</p>
 */
@interface AWSEC2DescribeSnapshotAttributeResult : AWSModel


/**
 <p>A list of permissions for creating volumes from the snapshot.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2CreateVolumePermission *> * _Nullable createVolumePermissions;

/**
 <p>A list of product codes.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ProductCode *> * _Nullable productCodes;

/**
 <p>The ID of the EBS snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

@end

/**
 <p>Contains the parameters for DescribeSnapshots.</p>
 */
@interface AWSEC2DescribeSnapshotsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>description</code> - A description of the snapshot.</p></li><li><p><code>owner-alias</code> - The AWS account alias (for example, <code>amazon</code>) that owns the snapshot.</p></li><li><p><code>owner-id</code> - The ID of the AWS account that owns the snapshot.</p></li><li><p><code>progress</code> - The progress of the snapshot, as a percentage (for example, 80%).</p></li><li><p><code>snapshot-id</code> - The snapshot ID.</p></li><li><p><code>start-time</code> - The time stamp when the snapshot was initiated.</p></li><li><p><code>status</code> - The status of the snapshot (<code>pending</code> | <code>completed</code> | <code>error</code>).</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>volume-id</code> - The ID of the volume the snapshot is for.</p></li><li><p><code>volume-size</code> - The size of the volume, in GiB.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>The maximum number of snapshot results returned by <code>DescribeSnapshots</code> in paginated output. When this parameter is used, <code>DescribeSnapshots</code> only returns <code>MaxResults</code> results in a single page along with a <code>NextToken</code> response element. The remaining results of the initial request can be seen by sending another <code>DescribeSnapshots</code> request with the returned <code>NextToken</code> value. This value can be between 5 and 1000; if <code>MaxResults</code> is given a value larger than 1000, only 1000 results are returned. If this parameter is not used, then <code>DescribeSnapshots</code> returns all results. You cannot specify this parameter and the snapshot IDs parameter in the same request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The <code>NextToken</code> value returned from a previous paginated <code>DescribeSnapshots</code> request where <code>MaxResults</code> was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the <code>NextToken</code> value. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Returns the snapshots owned by the specified owner. Multiple owners can be specified.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ownerIds;

/**
 <p>One or more AWS accounts IDs that can create volumes from the snapshot.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable restorableByUserIds;

/**
 <p>One or more snapshot IDs.</p><p>Default: Describes snapshots for which you have launch permissions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable snapshotIds;

@end

/**
 <p>Contains the output of DescribeSnapshots.</p>
 */
@interface AWSEC2DescribeSnapshotsResult : AWSModel


/**
 <p>The <code>NextToken</code> value to include in a future <code>DescribeSnapshots</code> request. When the results of a <code>DescribeSnapshots</code> request exceed <code>MaxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the snapshots.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Snapshot *> * _Nullable snapshots;

@end

/**
 <p>Contains the parameters for DescribeSpotDatafeedSubscription.</p>
 */
@interface AWSEC2DescribeSpotDatafeedSubscriptionRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

@end

/**
 <p>Contains the output of DescribeSpotDatafeedSubscription.</p>
 */
@interface AWSEC2DescribeSpotDatafeedSubscriptionResult : AWSModel


/**
 <p>The Spot instance data feed subscription.</p>
 */
@property (nonatomic, strong) AWSEC2SpotDatafeedSubscription * _Nullable spotDatafeedSubscription;

@end

/**
 <p>Contains the parameters for DescribeSpotFleetInstances.</p>
 Required parameters: [SpotFleetRequestId]
 */
@interface AWSEC2DescribeSpotFleetInstancesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The maximum number of results to return in a single call. Specify a value between 1 and 1000. The default value is 1000. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the Spot fleet request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotFleetRequestId;

@end

/**
 <p>Contains the output of DescribeSpotFleetInstances.</p>
 Required parameters: [SpotFleetRequestId, ActiveInstances]
 */
@interface AWSEC2DescribeSpotFleetInstancesResponse : AWSModel


/**
 <p>The running instances. Note that this list is refreshed periodically and might be out of date.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ActiveInstance *> * _Nullable activeInstances;

/**
 <p>The token required to retrieve the next set of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the Spot fleet request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotFleetRequestId;

@end

/**
 <p>Contains the parameters for DescribeSpotFleetRequestHistory.</p>
 Required parameters: [SpotFleetRequestId, StartTime]
 */
@interface AWSEC2DescribeSpotFleetRequestHistoryRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The type of events to describe. By default, all events are described.</p>
 */
@property (nonatomic, assign) AWSEC2EventType eventType;

/**
 <p>The maximum number of results to return in a single call. Specify a value between 1 and 1000. The default value is 1000. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the Spot fleet request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotFleetRequestId;

/**
 <p>The starting date and time for the events, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p>Contains the output of DescribeSpotFleetRequestHistory.</p>
 Required parameters: [SpotFleetRequestId, StartTime, LastEvaluatedTime, HistoryRecords]
 */
@interface AWSEC2DescribeSpotFleetRequestHistoryResponse : AWSModel


/**
 <p>Information about the events in the history of the Spot fleet request.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2HistoryRecord *> * _Nullable historyRecords;

/**
 <p>The last date and time for the events, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z). All records up to this time were retrieved.</p><p>If <code>nextToken</code> indicates that there are more results, this value is not present.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastEvaluatedTime;

/**
 <p>The token required to retrieve the next set of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the Spot fleet request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotFleetRequestId;

/**
 <p>The starting date and time for the events, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p>Contains the parameters for DescribeSpotFleetRequests.</p>
 */
@interface AWSEC2DescribeSpotFleetRequestsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The maximum number of results to return in a single call. Specify a value between 1 and 1000. The default value is 1000. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The IDs of the Spot fleet requests.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable spotFleetRequestIds;

@end

/**
 <p>Contains the output of DescribeSpotFleetRequests.</p>
 Required parameters: [SpotFleetRequestConfigs]
 */
@interface AWSEC2DescribeSpotFleetRequestsResponse : AWSModel


/**
 <p>The token required to retrieve the next set of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the configuration of your Spot fleet.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2SpotFleetRequestConfig *> * _Nullable spotFleetRequestConfigs;

@end

/**
 <p>Contains the parameters for DescribeSpotInstanceRequests.</p>
 */
@interface AWSEC2DescribeSpotInstanceRequestsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>availability-zone-group</code> - The Availability Zone group.</p></li><li><p><code>create-time</code> - The time stamp when the Spot instance request was created.</p></li><li><p><code>fault-code</code> - The fault code related to the request.</p></li><li><p><code>fault-message</code> - The fault message related to the request.</p></li><li><p><code>instance-id</code> - The ID of the instance that fulfilled the request.</p></li><li><p><code>launch-group</code> - The Spot instance launch group.</p></li><li><p><code>launch.block-device-mapping.delete-on-termination</code> - Indicates whether the Amazon EBS volume is deleted on instance termination.</p></li><li><p><code>launch.block-device-mapping.device-name</code> - The device name for the Amazon EBS volume (for example, <code>/dev/sdh</code>).</p></li><li><p><code>launch.block-device-mapping.snapshot-id</code> - The ID of the snapshot used for the Amazon EBS volume.</p></li><li><p><code>launch.block-device-mapping.volume-size</code> - The size of the Amazon EBS volume, in GiB.</p></li><li><p><code>launch.block-device-mapping.volume-type</code> - The type of the Amazon EBS volume: <code>gp2</code> for General Purpose SSD, <code>io1</code> for Provisioned IOPS SSD, <code>st1</code> for Throughput Optimized HDD, <code>sc1</code>for Cold HDD, or <code>standard</code> for Magnetic.</p></li><li><p><code>launch.group-id</code> - The security group for the instance.</p></li><li><p><code>launch.image-id</code> - The ID of the AMI.</p></li><li><p><code>launch.instance-type</code> - The type of instance (for example, <code>m3.medium</code>).</p></li><li><p><code>launch.kernel-id</code> - The kernel ID.</p></li><li><p><code>launch.key-name</code> - The name of the key pair the instance launched with.</p></li><li><p><code>launch.monitoring-enabled</code> - Whether monitoring is enabled for the Spot instance.</p></li><li><p><code>launch.ramdisk-id</code> - The RAM disk ID.</p></li><li><p><code>network-interface.network-interface-id</code> - The ID of the network interface.</p></li><li><p><code>network-interface.device-index</code> - The index of the device for the network interface attachment on the instance.</p></li><li><p><code>network-interface.subnet-id</code> - The ID of the subnet for the instance.</p></li><li><p><code>network-interface.description</code> - A description of the network interface.</p></li><li><p><code>network-interface.private-ip-address</code> - The primary private IP address of the network interface.</p></li><li><p><code>network-interface.delete-on-termination</code> - Indicates whether the network interface is deleted when the instance is terminated.</p></li><li><p><code>network-interface.group-id</code> - The ID of the security group associated with the network interface.</p></li><li><p><code>network-interface.group-name</code> - The name of the security group associated with the network interface.</p></li><li><p><code>network-interface.addresses.primary</code> - Indicates whether the IP address is the primary private IP address.</p></li><li><p><code>product-description</code> - The product description associated with the instance (<code>Linux/UNIX</code> | <code>Windows</code>).</p></li><li><p><code>spot-instance-request-id</code> - The Spot instance request ID.</p></li><li><p><code>spot-price</code> - The maximum hourly price for any Spot instance launched to fulfill the request.</p></li><li><p><code>state</code> - The state of the Spot instance request (<code>open</code> | <code>active</code> | <code>closed</code> | <code>cancelled</code> | <code>failed</code>). Spot bid status information can help you track your Amazon EC2 Spot instance requests. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-bid-status.html">Spot Bid Status</a> in the Amazon Elastic Compute Cloud User Guide.</p></li><li><p><code>status-code</code> - The short code describing the most recent evaluation of your Spot instance request.</p></li><li><p><code>status-message</code> - The message explaining the status of the Spot instance request.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>type</code> - The type of Spot instance request (<code>one-time</code> | <code>persistent</code>).</p></li><li><p><code>launched-availability-zone</code> - The Availability Zone in which the bid is launched.</p></li><li><p><code>valid-from</code> - The start date of the request.</p></li><li><p><code>valid-until</code> - The end date of the request.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more Spot instance request IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable spotInstanceRequestIds;

@end

/**
 <p>Contains the output of DescribeSpotInstanceRequests.</p>
 */
@interface AWSEC2DescribeSpotInstanceRequestsResult : AWSModel


/**
 <p>One or more Spot instance requests.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2SpotInstanceRequest *> * _Nullable spotInstanceRequests;

@end

/**
 <p>Contains the parameters for DescribeSpotPriceHistory.</p>
 */
@interface AWSEC2DescribeSpotPriceHistoryRequest : AWSRequest


/**
 <p>Filters the results by the specified Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The date and time, up to the current date, from which to stop retrieving the price history data, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>One or more filters.</p><ul><li><p><code>availability-zone</code> - The Availability Zone for which prices should be returned.</p></li><li><p><code>instance-type</code> - The type of instance (for example, <code>m3.medium</code>).</p></li><li><p><code>product-description</code> - The product description for the Spot price (<code>Linux/UNIX</code> | <code>SUSE Linux</code> | <code>Windows</code> | <code>Linux/UNIX (Amazon VPC)</code> | <code>SUSE Linux (Amazon VPC)</code> | <code>Windows (Amazon VPC)</code>).</p></li><li><p><code>spot-price</code> - The Spot price. The value must match exactly (or use wildcards; greater than or less than comparison is not supported).</p></li><li><p><code>timestamp</code> - The timestamp of the Spot price history, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z). You can use wildcards (* and ?). Greater than or less than comparison is not supported.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>Filters the results by the specified instance types.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceTypes;

/**
 <p>The maximum number of results to return in a single call. Specify a value between 1 and 1000. The default value is 1000. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Filters the results by the specified basic product descriptions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable productDescriptions;

/**
 <p>The date and time, up to the past 90 days, from which to start retrieving the price history data, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 <p>Contains the output of DescribeSpotPriceHistory.</p>
 */
@interface AWSEC2DescribeSpotPriceHistoryResult : AWSModel


/**
 <p>The token required to retrieve the next set of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The historical Spot prices.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2SpotPrice *> * _Nullable spotPriceHistory;

@end

/**
 
 */
@interface AWSEC2DescribeStaleSecurityGroupsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the operation, without actually making the request, and provides an error response. If you have the required permissions, the error response is DryRunOperation. Otherwise, it is UnauthorizedOperation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a prior call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 
 */
@interface AWSEC2DescribeStaleSecurityGroupsResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the stale security groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2StaleSecurityGroup *> * _Nullable staleSecurityGroupSet;

@end

/**
 <p>Contains the parameters for DescribeSubnets.</p>
 */
@interface AWSEC2DescribeSubnetsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>availabilityZone</code> - The Availability Zone for the subnet. You can also use <code>availability-zone</code> as the filter name.</p></li><li><p><code>available-ip-address-count</code> - The number of IP addresses in the subnet that are available.</p></li><li><p><code>cidrBlock</code> - The CIDR block of the subnet. The CIDR block you specify must exactly match the subnet's CIDR block for information to be returned for the subnet. You can also use <code>cidr</code> or <code>cidr-block</code> as the filter names.</p></li><li><p><code>defaultForAz</code> - Indicates whether this is the default subnet for the Availability Zone. You can also use <code>default-for-az</code> as the filter name.</p></li><li><p><code>state</code> - The state of the subnet (<code>pending</code> | <code>available</code>).</p></li><li><p><code>subnet-id</code> - The ID of the subnet.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>vpc-id</code> - The ID of the VPC for the subnet.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more subnet IDs.</p><p>Default: Describes all your subnets.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

@end

/**
 <p>Contains the output of DescribeSubnets.</p>
 */
@interface AWSEC2DescribeSubnetsResult : AWSModel


/**
 <p>Information about one or more subnets.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Subnet *> * _Nullable subnets;

@end

/**
 <p>Contains the parameters for DescribeTags.</p>
 */
@interface AWSEC2DescribeTagsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>key</code> - The tag key.</p></li><li><p><code>resource-id</code> - The resource ID.</p></li><li><p><code>resource-type</code> - The resource type (<code>customer-gateway</code> | <code>dhcp-options</code> | <code>image</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-interface</code> | <code>reserved-instances</code> | <code>route-table</code> | <code>security-group</code> | <code>snapshot</code> | <code>spot-instances-request</code> | <code>subnet</code> | <code>volume</code> | <code>vpc</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>).</p></li><li><p><code>value</code> - The tag value.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>The maximum number of results to return in a single call. This value can be between 5 and 1000. To retrieve the remaining results, make another call with the returned <code>NextToken</code> value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token to retrieve the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeTags.</p>
 */
@interface AWSEC2DescribeTagsResult : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return..</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2TagDescription *> * _Nullable tags;

@end

/**
 <p>Contains the parameters for DescribeVolumeAttribute.</p>
 Required parameters: [VolumeId]
 */
@interface AWSEC2DescribeVolumeAttributeRequest : AWSRequest


/**
 <p>The instance attribute.</p>
 */
@property (nonatomic, assign) AWSEC2VolumeAttributeName attribute;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

@end

/**
 <p>Contains the output of DescribeVolumeAttribute.</p>
 */
@interface AWSEC2DescribeVolumeAttributeResult : AWSModel


/**
 <p>The state of <code>autoEnableIO</code> attribute.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable autoEnableIO;

/**
 <p>A list of product codes.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ProductCode *> * _Nullable productCodes;

/**
 <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

@end

/**
 <p>Contains the parameters for DescribeVolumeStatus.</p>
 */
@interface AWSEC2DescribeVolumeStatusRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>action.code</code> - The action code for the event (for example, <code>enable-volume-io</code>).</p></li><li><p><code>action.description</code> - A description of the action.</p></li><li><p><code>action.event-id</code> - The event ID associated with the action.</p></li><li><p><code>availability-zone</code> - The Availability Zone of the instance.</p></li><li><p><code>event.description</code> - A description of the event.</p></li><li><p><code>event.event-id</code> - The event ID.</p></li><li><p><code>event.event-type</code> - The event type (for <code>io-enabled</code>: <code>passed</code> | <code>failed</code>; for <code>io-performance</code>: <code>io-performance:degraded</code> | <code>io-performance:severely-degraded</code> | <code>io-performance:stalled</code>).</p></li><li><p><code>event.not-after</code> - The latest end time for the event.</p></li><li><p><code>event.not-before</code> - The earliest start time for the event.</p></li><li><p><code>volume-status.details-name</code> - The cause for <code>volume-status.status</code> (<code>io-enabled</code> | <code>io-performance</code>).</p></li><li><p><code>volume-status.details-status</code> - The status of <code>volume-status.details-name</code> (for <code>io-enabled</code>: <code>passed</code> | <code>failed</code>; for <code>io-performance</code>: <code>normal</code> | <code>degraded</code> | <code>severely-degraded</code> | <code>stalled</code>).</p></li><li><p><code>volume-status.status</code> - The status of the volume (<code>ok</code> | <code>impaired</code> | <code>warning</code> | <code>insufficient-data</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>The maximum number of volume results returned by <code>DescribeVolumeStatus</code> in paginated output. When this parameter is used, the request only returns <code>MaxResults</code> results in a single page along with a <code>NextToken</code> response element. The remaining results of the initial request can be seen by sending another request with the returned <code>NextToken</code> value. This value can be between 5 and 1000; if <code>MaxResults</code> is given a value larger than 1000, only 1000 results are returned. If this parameter is not used, then <code>DescribeVolumeStatus</code> returns all results. You cannot specify this parameter and the volume IDs parameter in the same request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The <code>NextToken</code> value to include in a future <code>DescribeVolumeStatus</code> request. When the results of the request exceed <code>MaxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>One or more volume IDs.</p><p>Default: Describes all your volumes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable volumeIds;

@end

/**
 <p>Contains the output of DescribeVolumeStatus.</p>
 */
@interface AWSEC2DescribeVolumeStatusResult : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of volumes.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2VolumeStatusItem *> * _Nullable volumeStatuses;

@end

/**
 <p>Contains the parameters for DescribeVolumes.</p>
 */
@interface AWSEC2DescribeVolumesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>attachment.attach-time</code> - The time stamp when the attachment initiated.</p></li><li><p><code>attachment.delete-on-termination</code> - Whether the volume is deleted on instance termination.</p></li><li><p><code>attachment.device</code> - The device name that is exposed to the instance (for example, <code>/dev/sda1</code>).</p></li><li><p><code>attachment.instance-id</code> - The ID of the instance the volume is attached to.</p></li><li><p><code>attachment.status</code> - The attachment state (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p></li><li><p><code>availability-zone</code> - The Availability Zone in which the volume was created.</p></li><li><p><code>create-time</code> - The time stamp when the volume was created.</p></li><li><p><code>encrypted</code> - The encryption status of the volume.</p></li><li><p><code>size</code> - The size of the volume, in GiB.</p></li><li><p><code>snapshot-id</code> - The snapshot from which the volume was created.</p></li><li><p><code>status</code> - The status of the volume (<code>creating</code> | <code>available</code> | <code>in-use</code> | <code>deleting</code> | <code>deleted</code> | <code>error</code>).</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>volume-id</code> - The volume ID.</p></li><li><p><code>volume-type</code> - The Amazon EBS volume type. This can be <code>gp2</code> for General Purpose SSD, <code>io1</code> for Provisioned IOPS SSD, <code>st1</code> for Throughput Optimized HDD, <code>sc1</code> for Cold HDD, or <code>standard</code> for Magnetic volumes.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>The maximum number of volume results returned by <code>DescribeVolumes</code> in paginated output. When this parameter is used, <code>DescribeVolumes</code> only returns <code>MaxResults</code> results in a single page along with a <code>NextToken</code> response element. The remaining results of the initial request can be seen by sending another <code>DescribeVolumes</code> request with the returned <code>NextToken</code> value. This value can be between 5 and 1000; if <code>MaxResults</code> is given a value larger than 1000, only 1000 results are returned. If this parameter is not used, then <code>DescribeVolumes</code> returns all results. You cannot specify this parameter and the volume IDs parameter in the same request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The <code>NextToken</code> value returned from a previous paginated <code>DescribeVolumes</code> request where <code>MaxResults</code> was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the <code>NextToken</code> value. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>One or more volume IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable volumeIds;

@end

/**
 <p>Contains the output of DescribeVolumes.</p>
 */
@interface AWSEC2DescribeVolumesResult : AWSModel


/**
 <p>The <code>NextToken</code> value to include in a future <code>DescribeVolumes</code> request. When the results of a <code>DescribeVolumes</code> request exceed <code>MaxResults</code>, this value can be used to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the volumes.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Volume *> * _Nullable volumes;

@end

/**
 <p>Contains the parameters for DescribeVpcAttribute.</p>
 Required parameters: [VpcId, Attribute]
 */
@interface AWSEC2DescribeVpcAttributeRequest : AWSRequest


/**
 <p>The VPC attribute.</p>
 */
@property (nonatomic, assign) AWSEC2VpcAttributeName attribute;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output of DescribeVpcAttribute.</p>
 */
@interface AWSEC2DescribeVpcAttributeResult : AWSModel


/**
 <p>Indicates whether the instances launched in the VPC get DNS hostnames. If this attribute is <code>true</code>, instances in the VPC get DNS hostnames; otherwise, they do not.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable enableDnsHostnames;

/**
 <p>Indicates whether DNS resolution is enabled for the VPC. If this attribute is <code>true</code>, the Amazon DNS server resolves DNS hostnames for your instances to their corresponding IP addresses; otherwise, it does not.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable enableDnsSupport;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the parameters for DescribeVpcClassicLinkDnsSupport.</p>
 */
@interface AWSEC2DescribeVpcClassicLinkDnsSupportRequest : AWSRequest


/**
 <p>The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a prior call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>One or more VPC IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcIds;

@end

/**
 <p>Contains the output of DescribeVpcClassicLinkDnsSupport.</p>
 */
@interface AWSEC2DescribeVpcClassicLinkDnsSupportResult : AWSModel


/**
 <p>The token to use when requesting the next set of items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the ClassicLink DNS support status of the VPCs.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ClassicLinkDnsSupport *> * _Nullable vpcs;

@end

/**
 <p>Contains the parameters for DescribeVpcClassicLink.</p>
 */
@interface AWSEC2DescribeVpcClassicLinkRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>is-classic-link-enabled</code> - Whether the VPC is enabled for ClassicLink (<code>true</code> | <code>false</code>).</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more VPCs for which you want to describe the ClassicLink status.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcIds;

@end

/**
 <p>Contains the output of DescribeVpcClassicLink.</p>
 */
@interface AWSEC2DescribeVpcClassicLinkResult : AWSModel


/**
 <p>The ClassicLink status of one or more VPCs.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2VpcClassicLink *> * _Nullable vpcs;

@end

/**
 <p>Contains the parameters for DescribeVpcEndpointServices.</p>
 */
@interface AWSEC2DescribeVpcEndpointServicesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results.</p><p>Constraint: If the value is greater than 1000, we return only 1000 items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a prior call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the output of DescribeVpcEndpointServices.</p>
 */
@interface AWSEC2DescribeVpcEndpointServicesResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of supported AWS services.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable serviceNames;

@end

/**
 <p>Contains the parameters for DescribeVpcEndpoints.</p>
 */
@interface AWSEC2DescribeVpcEndpointsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>service-name</code>: The name of the AWS service.</p></li><li><p><code>vpc-id</code>: The ID of the VPC in which the endpoint resides.</p></li><li><p><code>vpc-endpoint-id</code>: The ID of the endpoint.</p></li><li><p><code>vpc-endpoint-state</code>: The state of the endpoint. (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>The maximum number of items to return for this request. The request returns a token that you can specify in a subsequent call to get the next set of results.</p><p>Constraint: If the value is greater than 1000, we return only 1000 items.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of items to return. (You received this token from a prior call.)</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>One or more endpoint IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcEndpointIds;

@end

/**
 <p>Contains the output of DescribeVpcEndpoints.</p>
 */
@interface AWSEC2DescribeVpcEndpointsResult : AWSModel


/**
 <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the endpoints.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2VpcEndpoint *> * _Nullable vpcEndpoints;

@end

/**
 <p>Contains the parameters for DescribeVpcPeeringConnections.</p>
 */
@interface AWSEC2DescribeVpcPeeringConnectionsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>accepter-vpc-info.cidr-block</code> - The CIDR block of the peer VPC.</p></li><li><p><code>accepter-vpc-info.owner-id</code> - The AWS account ID of the owner of the peer VPC.</p></li><li><p><code>accepter-vpc-info.vpc-id</code> - The ID of the peer VPC.</p></li><li><p><code>expiration-time</code> - The expiration date and time for the VPC peering connection.</p></li><li><p><code>requester-vpc-info.cidr-block</code> - The CIDR block of the requester&apos;s VPC.</p></li><li><p><code>requester-vpc-info.owner-id</code> - The AWS account ID of the owner of the requester VPC.</p></li><li><p><code>requester-vpc-info.vpc-id</code> - The ID of the requester VPC.</p></li><li><p><code>status-code</code> - The status of the VPC peering connection (<code>pending-acceptance</code> | <code>failed</code> | <code>expired</code> | <code>provisioning</code> | <code>active</code> | <code>deleted</code> | <code>rejected</code>).</p></li><li><p><code>status-message</code> - A message that provides more information about the status of the VPC peering connection, if applicable.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>vpc-peering-connection-id</code> - The ID of the VPC peering connection.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more VPC peering connection IDs.</p><p>Default: Describes all your VPC peering connections.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcPeeringConnectionIds;

@end

/**
 <p>Contains the output of DescribeVpcPeeringConnections.</p>
 */
@interface AWSEC2DescribeVpcPeeringConnectionsResult : AWSModel


/**
 <p>Information about the VPC peering connections.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2VpcPeeringConnection *> * _Nullable vpcPeeringConnections;

@end

/**
 <p>Contains the parameters for DescribeVpcs.</p>
 */
@interface AWSEC2DescribeVpcsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>cidr</code> - The CIDR block of the VPC. The CIDR block you specify must exactly match the VPC's CIDR block for information to be returned for the VPC. Must contain the slash followed by one or two digits (for example, <code>/28</code>).</p></li><li><p><code>dhcp-options-id</code> - The ID of a set of DHCP options.</p></li><li><p><code>isDefault</code> - Indicates whether the VPC is the default VPC.</p></li><li><p><code>state</code> - The state of the VPC (<code>pending</code> | <code>available</code>).</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>vpc-id</code> - The ID of the VPC.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more VPC IDs.</p><p>Default: Describes all your VPCs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpcIds;

@end

/**
 <p>Contains the output of DescribeVpcs.</p>
 */
@interface AWSEC2DescribeVpcsResult : AWSModel


/**
 <p>Information about one or more VPCs.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Vpc *> * _Nullable vpcs;

@end

/**
 <p>Contains the parameters for DescribeVpnConnections.</p>
 */
@interface AWSEC2DescribeVpnConnectionsRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>customer-gateway-configuration</code> - The configuration information for the customer gateway.</p></li><li><p><code>customer-gateway-id</code> - The ID of a customer gateway associated with the VPN connection.</p></li><li><p><code>state</code> - The state of the VPN connection (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p></li><li><p><code>option.static-routes-only</code> - Indicates whether the connection has static routes only. Used for devices that do not support Border Gateway Protocol (BGP).</p></li><li><p><code>route.destination-cidr-block</code> - The destination CIDR block. This corresponds to the subnet used in a customer data center.</p></li><li><p><code>bgp-asn</code> - The BGP Autonomous System Number (ASN) associated with a BGP device.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>type</code> - The type of VPN connection. Currently the only supported type is <code>ipsec.1</code>.</p></li><li><p><code>vpn-connection-id</code> - The ID of the VPN connection.</p></li><li><p><code>vpn-gateway-id</code> - The ID of a virtual private gateway associated with the VPN connection.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more VPN connection IDs.</p><p>Default: Describes your VPN connections.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpnConnectionIds;

@end

/**
 <p>Contains the output of DescribeVpnConnections.</p>
 */
@interface AWSEC2DescribeVpnConnectionsResult : AWSModel


/**
 <p>Information about one or more VPN connections.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2VpnConnection *> * _Nullable vpnConnections;

@end

/**
 <p>Contains the parameters for DescribeVpnGateways.</p>
 */
@interface AWSEC2DescribeVpnGatewaysRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more filters.</p><ul><li><p><code>attachment.state</code> - The current state of the attachment between the gateway and the VPC (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p></li><li><p><code>attachment.vpc-id</code> - The ID of an attached VPC.</p></li><li><p><code>availability-zone</code> - The Availability Zone for the virtual private gateway (if applicable).</p></li><li><p><code>state</code> - The state of the virtual private gateway (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>type</code> - The type of virtual private gateway. Currently the only supported type is <code>ipsec.1</code>.</p></li><li><p><code>vpn-gateway-id</code> - The ID of the virtual private gateway.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSEC2Filter *> * _Nullable filters;

/**
 <p>One or more virtual private gateway IDs.</p><p>Default: Describes all your virtual private gateways.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable vpnGatewayIds;

@end

/**
 <p>Contains the output of DescribeVpnGateways.</p>
 */
@interface AWSEC2DescribeVpnGatewaysResult : AWSModel


/**
 <p>Information about one or more virtual private gateways.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2VpnGateway *> * _Nullable vpnGateways;

@end

/**
 <p>Contains the parameters for DetachClassicLinkVpc.</p>
 Required parameters: [InstanceId, VpcId]
 */
@interface AWSEC2DetachClassicLinkVpcRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the instance to unlink from the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p> The ID of the VPC to which the instance is linked.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output of DetachClassicLinkVpc.</p>
 */
@interface AWSEC2DetachClassicLinkVpcResult : AWSModel


/**
 <p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returned;

@end

/**
 <p>Contains the parameters for DetachInternetGateway.</p>
 Required parameters: [InternetGatewayId, VpcId]
 */
@interface AWSEC2DetachInternetGatewayRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the Internet gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable internetGatewayId;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the parameters for DetachNetworkInterface.</p>
 Required parameters: [AttachmentId]
 */
@interface AWSEC2DetachNetworkInterfaceRequest : AWSRequest


/**
 <p>The ID of the attachment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentId;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Specifies whether to force a detachment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

@end

/**
 <p>Contains the parameters for DetachVolume.</p>
 Required parameters: [VolumeId]
 */
@interface AWSEC2DetachVolumeRequest : AWSRequest


/**
 <p>The device name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable device;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Forces detachment if the previous detachment attempt did not occur cleanly (for example, logging into an instance, unmounting the volume, and detaching normally). This option can lead to data loss or a corrupted file system. Use this option only as a last resort to detach a volume from a failed instance. The instance won't have an opportunity to flush file system caches or file system metadata. If you use this option, you must perform file system check and repair procedures.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

@end

/**
 <p>Contains the parameters for DetachVpnGateway.</p>
 Required parameters: [VpnGatewayId, VpcId]
 */
@interface AWSEC2DetachVpnGatewayRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

/**
 <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnGatewayId;

@end

/**
 <p>Describes a DHCP configuration option.</p>
 */
@interface AWSEC2DhcpConfiguration : AWSModel


/**
 <p>The name of a DHCP option.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>One or more values for the DHCP option.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2AttributeValue *> * _Nullable values;

@end

/**
 <p>Describes a set of DHCP options.</p>
 */
@interface AWSEC2DhcpOptions : AWSModel


/**
 <p>One or more DHCP options in the set.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2DhcpConfiguration *> * _Nullable dhcpConfigurations;

/**
 <p>The ID of the set of DHCP options.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dhcpOptionsId;

/**
 <p>Any tags assigned to the DHCP options set.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

@end

/**
 <p>Contains the parameters for DisableVgwRoutePropagation.</p>
 Required parameters: [RouteTableId, GatewayId]
 */
@interface AWSEC2DisableVgwRoutePropagationRequest : AWSRequest


/**
 <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

/**
 <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeTableId;

@end

/**
 <p>Contains the parameters for DisableVpcClassicLinkDnsSupport.</p>
 */
@interface AWSEC2DisableVpcClassicLinkDnsSupportRequest : AWSRequest


/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output of DisableVpcClassicLinkDnsSupport.</p>
 */
@interface AWSEC2DisableVpcClassicLinkDnsSupportResult : AWSModel


/**
 <p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returned;

@end

/**
 <p>Contains the parameters for DisableVpcClassicLink.</p>
 Required parameters: [VpcId]
 */
@interface AWSEC2DisableVpcClassicLinkRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output of DisableVpcClassicLink.</p>
 */
@interface AWSEC2DisableVpcClassicLinkResult : AWSModel


/**
 <p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returned;

@end

/**
 <p>Contains the parameters for DisassociateAddress.</p>
 */
@interface AWSEC2DisassociateAddressRequest : AWSRequest


/**
 <p>[EC2-VPC] The association ID. Required for EC2-VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>[EC2-Classic] The Elastic IP address. Required for EC2-Classic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

@end

/**
 <p>Contains the parameters for DisassociateRouteTable.</p>
 Required parameters: [AssociationId]
 */
@interface AWSEC2DisassociateRouteTableRequest : AWSRequest


/**
 <p>The association ID representing the current association between the route table and subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

@end

/**
 <p>Describes a disk image.</p>
 */
@interface AWSEC2DiskImage : AWSModel


/**
 <p>A description of the disk image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Information about the disk image.</p>
 */
@property (nonatomic, strong) AWSEC2DiskImageDetail * _Nullable image;

/**
 <p>Information about the volume.</p>
 */
@property (nonatomic, strong) AWSEC2VolumeDetail * _Nullable volume;

@end

/**
 <p>Describes a disk image.</p>
 Required parameters: [Format, Size, ImportManifestUrl]
 */
@interface AWSEC2DiskImageDescription : AWSModel


/**
 <p>The checksum computed for the disk image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>The disk image format.</p>
 */
@property (nonatomic, assign) AWSEC2DiskImageFormat format;

/**
 <p>A presigned URL for the import manifest stored in Amazon S3. For information about creating a presigned URL for an Amazon S3 object, read the "Query String Request Authentication Alternative" section of the <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html">Authenticating REST Requests</a> topic in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>For information about the import manifest referenced by this API action, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importManifestUrl;

/**
 <p>The size of the disk image, in GiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

@end

/**
 <p>Describes a disk image.</p>
 Required parameters: [Format, Bytes, ImportManifestUrl]
 */
@interface AWSEC2DiskImageDetail : AWSModel


/**
 <p>The size of the disk image, in GiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytes;

/**
 <p>The disk image format.</p>
 */
@property (nonatomic, assign) AWSEC2DiskImageFormat format;

/**
 <p>A presigned URL for the import manifest stored in Amazon S3 and presented here as an Amazon S3 presigned URL. For information about creating a presigned URL for an Amazon S3 object, read the "Query String Request Authentication Alternative" section of the <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html">Authenticating REST Requests</a> topic in the <i>Amazon Simple Storage Service Developer Guide</i>.</p><p>For information about the import manifest referenced by this API action, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html">VM Import Manifest</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importManifestUrl;

@end

/**
 <p>Describes a disk image volume.</p>
 Required parameters: [Id]
 */
@interface AWSEC2DiskImageVolumeDescription : AWSModel


/**
 <p>The volume identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The size of the volume, in GiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

@end

/**
 <p>Describes a block device for an EBS volume.</p>
 */
@interface AWSEC2EbsBlockDevice : AWSModel


/**
 <p>Indicates whether the EBS volume is deleted on instance termination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

/**
 <p>Indicates whether the EBS volume is encrypted. Encrypted Amazon EBS volumes may only be attached to instances that support Amazon EBS encryption.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The number of I/O operations per second (IOPS) that the volume supports. For io1, this represents the number of IOPS that are provisioned for the volume. For <code>gp2</code>, this represents the baseline performance of the volume and the rate at which the volume accumulates I/O credits for bursting. For more information on General Purpose SSD baseline performance, I/O credits, and bursting, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html">Amazon EBS Volume Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Constraint: Range is 100-20000 IOPS for io1 volumes and 100-10000 IOPS for <code>gp2</code> volumes.</p><p>Condition: This parameter is required for requests to create <code><code>io1</code></code> volumes; it is not used in requests to create <code>gp2</code>, <code>st1</code>, <code>sc1</code>, or <code>standard</code> volumes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>The ID of the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>The size of the volume, in GiB.</p><p>Constraints: 1-16384 for General Purpose SSD (<code>gp2</code>), 4-16384 for Provisioned IOPS SSD (<code>io1</code>), 500-16384 for Throughput Optimized HDD (<code>st1</code>), 500-16384 for Cold HDD (<code>sc1</code>), and 1-1024 for Magnetic (<code>standard</code>) volumes. If you specify a snapshot, the volume size must be equal to or larger than the snapshot size.</p><p>Default: If you're creating the volume from a snapshot and don't specify a volume size, the default is the snapshot size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSize;

/**
 <p>The volume type: <code>gp2</code>, <code>io1</code>, <code>st1</code>, <code>sc1</code>, or <code>standard</code>.</p><p>Default: <code>standard</code></p>
 */
@property (nonatomic, assign) AWSEC2VolumeType volumeType;

@end

/**
 <p>Describes a parameter used to set up an EBS volume in a block device mapping.</p>
 */
@interface AWSEC2EbsInstanceBlockDevice : AWSModel


/**
 <p>The time stamp when the attachment initiated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable attachTime;

/**
 <p>Indicates whether the volume is deleted on instance termination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

/**
 <p>The attachment state.</p>
 */
@property (nonatomic, assign) AWSEC2AttachmentStatus status;

/**
 <p>The ID of the EBS volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

@end

/**
 <p>Describes information used to set up an EBS volume specified in a block device mapping.</p>
 */
@interface AWSEC2EbsInstanceBlockDeviceSpecification : AWSModel


/**
 <p>Indicates whether the volume is deleted on instance termination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

/**
 <p>The ID of the EBS volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

@end

/**
 <p>Contains the parameters for EnableVgwRoutePropagation.</p>
 Required parameters: [RouteTableId, GatewayId]
 */
@interface AWSEC2EnableVgwRoutePropagationRequest : AWSRequest


/**
 <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

/**
 <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeTableId;

@end

/**
 <p>Contains the parameters for EnableVolumeIO.</p>
 Required parameters: [VolumeId]
 */
@interface AWSEC2EnableVolumeIORequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

@end

/**
 <p>Contains the parameters for EnableVpcClassicLinkDnsSupport.</p>
 */
@interface AWSEC2EnableVpcClassicLinkDnsSupportRequest : AWSRequest


/**
 <p>The ID of the VPC. </p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output of EnableVpcClassicLinkDnsSupport.</p>
 */
@interface AWSEC2EnableVpcClassicLinkDnsSupportResult : AWSModel


/**
 <p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returned;

@end

/**
 <p>Contains the parameters for EnableVpcClassicLink.</p>
 Required parameters: [VpcId]
 */
@interface AWSEC2EnableVpcClassicLinkRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the output of EnableVpcClassicLink.</p>
 */
@interface AWSEC2EnableVpcClassicLinkResult : AWSModel


/**
 <p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returned;

@end

/**
 <p>Describes a Spot fleet event.</p>
 */
@interface AWSEC2EventInformation : AWSModel


/**
 <p>The description of the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventDescription;

/**
 <p>The event.</p><p>The following are the <code>error</code> events.</p><ul><li><p><code>iamFleetRoleInvalid</code> - The Spot fleet did not have the required permissions either to launch or terminate an instance.</p></li><li><p><code>launchSpecTemporarilyBlacklisted</code> - The configuration is not valid and several attempts to launch instances have failed. For more information, see the description of the event.</p></li><li><p><code>spotFleetRequestConfigurationInvalid</code> - The configuration is not valid. For more information, see the description of the event.</p></li><li><p><code>spotInstanceCountLimitExceeded</code> - You've reached the limit on the number of Spot instances that you can launch.</p></li></ul><p>The following are the <code>fleetRequestChange</code> events.</p><ul><li><p><code>active</code> - The Spot fleet has been validated and Amazon EC2 is attempting to maintain the target number of running Spot instances.</p></li><li><p><code>cancelled</code> - The Spot fleet is canceled and has no running Spot instances. The Spot fleet will be deleted two days after its instances were terminated.</p></li><li><p><code>cancelled_running</code> - The Spot fleet is canceled and will not launch additional Spot instances, but its existing Spot instances continue to run until they are interrupted or terminated.</p></li><li><p><code>cancelled_terminating</code> - The Spot fleet is canceled and its Spot instances are terminating.</p></li><li><p><code>expired</code> - The Spot fleet request has expired. A subsequent event indicates that the instances were terminated, if the request was created with <code>TerminateInstancesWithExpiration</code> set.</p></li><li><p><code>modify_in_progress</code> - A request to modify the Spot fleet request was accepted and is in progress.</p></li><li><p><code>modify_successful</code> - The Spot fleet request was modified.</p></li><li><p><code>price_update</code> - The bid price for a launch configuration was adjusted because it was too high. This change is permanent.</p></li><li><p><code>submitted</code> - The Spot fleet request is being evaluated and Amazon EC2 is preparing to launch the target number of Spot instances.</p></li></ul><p>The following are the <code>instanceChange</code> events.</p><ul><li><p><code>launched</code> - A bid was fulfilled and a new instance was launched.</p></li><li><p><code>terminated</code> - An instance was terminated by the user.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable eventSubType;

/**
 <p>The ID of the instance. This information is available only for <code>instanceChange</code> events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 <p>Describes an instance export task.</p>
 */
@interface AWSEC2ExportTask : AWSModel


/**
 <p>A description of the resource being exported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the export task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable exportTaskId;

/**
 <p>Information about the export task.</p>
 */
@property (nonatomic, strong) AWSEC2ExportToS3Task * _Nullable exportToS3Task;

/**
 <p>Information about the instance to export.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceExportDetails * _Nullable instanceExportDetails;

/**
 <p>The state of the export task.</p>
 */
@property (nonatomic, assign) AWSEC2ExportTaskState state;

/**
 <p>The status message related to the export task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 <p>Describes the format and location for an instance export task.</p>
 */
@interface AWSEC2ExportToS3Task : AWSModel


/**
 <p>The container format used to combine disk images with metadata (such as OVF). If absent, only the disk image is exported.</p>
 */
@property (nonatomic, assign) AWSEC2ContainerFormat containerFormat;

/**
 <p>The format for the exported image.</p>
 */
@property (nonatomic, assign) AWSEC2DiskImageFormat diskImageFormat;

/**
 <p>The S3 bucket for the destination image. The destination bucket must exist and grant WRITE and READ_ACP permissions to the AWS account <code>vm-import-export@amazon.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The encryption key for your S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

@end

/**
 <p>Describes an instance export task.</p>
 */
@interface AWSEC2ExportToS3TaskSpecification : AWSModel


/**
 <p>The container format used to combine disk images with metadata (such as OVF). If absent, only the disk image is exported.</p>
 */
@property (nonatomic, assign) AWSEC2ContainerFormat containerFormat;

/**
 <p>The format for the exported image.</p>
 */
@property (nonatomic, assign) AWSEC2DiskImageFormat diskImageFormat;

/**
 <p>The S3 bucket for the destination image. The destination bucket must exist and grant WRITE and READ_ACP permissions to the AWS account <code>vm-import-export@amazon.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The image is written to a single object in the S3 bucket at the S3 key s3prefix + exportTaskId + '.' + diskImageFormat.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Prefix;

@end

/**
 <p>A filter name and value pair that is used to return a more specific list of results. Filters can be used to match a set of resources by various criteria, such as tags, attributes, or IDs.</p>
 */
@interface AWSEC2Filter : AWSModel


/**
 <p>The name of the filter. Filter names are case-sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>One or more filter values. Filter values are case-sensitive.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Describes a flow log.</p>
 */
@interface AWSEC2FlowLog : AWSModel


/**
 <p>The date and time the flow log was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTime;

/**
 <p>Information about the error that occurred. <code>Rate limited</code> indicates that CloudWatch logs throttling has been applied for one or more network interfaces, or that you've reached the limit on the number of CloudWatch Logs log groups that you can create. <code>Access error</code> indicates that the IAM role associated with the flow log does not have sufficient permissions to publish to CloudWatch Logs. <code>Unknown error</code> indicates an internal error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliverLogsErrorMessage;

/**
 <p>The ARN of the IAM role that posts logs to CloudWatch Logs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliverLogsPermissionArn;

/**
 <p>The status of the logs delivery (<code>SUCCESS</code> | <code>FAILED</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliverLogsStatus;

/**
 <p>The flow log ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowLogId;

/**
 <p>The status of the flow log (<code>ACTIVE</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable flowLogStatus;

/**
 <p>The name of the flow log group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupName;

/**
 <p>The ID of the resource on which the flow log was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The type of traffic captured for the flow log.</p>
 */
@property (nonatomic, assign) AWSEC2TrafficType trafficType;

@end

/**
 <p>Contains the parameters for GetConsoleOutput.</p>
 Required parameters: [InstanceId]
 */
@interface AWSEC2GetConsoleOutputRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 <p>Contains the output of GetConsoleOutput.</p>
 */
@interface AWSEC2GetConsoleOutputResult : AWSModel


/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The console output, Base64 encoded. If using a command line tool, the tools decode the output for you. </p>
 */
@property (nonatomic, strong) NSString * _Nullable output;

/**
 <p>The time the output was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 <p>Contains the parameters for GetPasswordData.</p>
 Required parameters: [InstanceId]
 */
@interface AWSEC2GetPasswordDataRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the Windows instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 <p>Contains the output of GetPasswordData.</p>
 */
@interface AWSEC2GetPasswordDataResult : AWSModel


/**
 <p>The ID of the Windows instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The password of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable passwordData;

/**
 <p>The time the data was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 <p>Describes a security group.</p>
 */
@interface AWSEC2GroupIdentifier : AWSModel


/**
 <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The name of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

@end

/**
 <p>Describes an event in the history of the Spot fleet request.</p>
 Required parameters: [Timestamp, EventType, EventInformation]
 */
@interface AWSEC2HistoryRecord : AWSModel


/**
 <p>Information about the event.</p>
 */
@property (nonatomic, strong) AWSEC2EventInformation * _Nullable eventInformation;

/**
 <p>The event type.</p><ul><li><p><code>error</code> - Indicates an error with the Spot fleet request.</p></li><li><p><code>fleetRequestChange</code> - Indicates a change in the status or configuration of the Spot fleet request.</p></li><li><p><code>instanceChange</code> - Indicates that an instance was launched or terminated.</p></li></ul>
 */
@property (nonatomic, assign) AWSEC2EventType eventType;

/**
 <p>The date and time of the event, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 <p>Describes the properties of the Dedicated host.</p>
 */
@interface AWSEC2Host : AWSModel


/**
 <p>Whether auto-placement is on or off.</p>
 */
@property (nonatomic, assign) AWSEC2AutoPlacement autoPlacement;

/**
 <p>The Availability Zone of the Dedicated host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The number of new instances that can be launched onto the Dedicated host.</p>
 */
@property (nonatomic, strong) AWSEC2AvailableCapacity * _Nullable availableCapacity;

/**
 <p>Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How to Ensure Idempotency</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The ID of the Dedicated host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostId;

/**
 <p>The hardware specifications of the Dedicated host.</p>
 */
@property (nonatomic, strong) AWSEC2HostProperties * _Nullable hostProperties;

/**
 <p>The reservation ID of the Dedicated host. This returns a <code>null</code> response if the Dedicated host doesn't have an associated reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostReservationId;

/**
 <p>The IDs and instance type that are currently running on the Dedicated host.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2HostInstance *> * _Nullable instances;

/**
 <p>The Dedicated host's state.</p>
 */
@property (nonatomic, assign) AWSEC2AllocationState state;

@end

/**
 <p>Describes an instance running on a Dedicated host.</p>
 */
@interface AWSEC2HostInstance : AWSModel


/**
 <p>the IDs of instances that are running on the Dedicated host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The instance type size (for example, m3.medium) of the running instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

@end

/**
 <p>Describes properties of a Dedicated host.</p>
 */
@interface AWSEC2HostProperties : AWSModel


/**
 <p>The number of cores on the Dedicated host.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cores;

/**
 <p>The instance type size that the Dedicated host supports (for example, m3.medium).</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The number of sockets on the Dedicated host.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sockets;

/**
 <p>The number of vCPUs on the Dedicated host.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalVCpus;

@end

/**
 <p>Describes an IAM instance profile.</p>
 */
@interface AWSEC2IamInstanceProfile : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the instance profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The ID of the instance profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Describes an IAM instance profile.</p>
 */
@interface AWSEC2IamInstanceProfileSpecification : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the instance profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The name of the instance profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Describes the ICMP type and code.</p>
 */
@interface AWSEC2IcmpTypeCode : AWSModel


/**
 <p>The ICMP type. A value of -1 means all types.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable code;

/**
 <p>The ICMP code. A value of -1 means all codes for the specified ICMP type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable types;

@end

/**
 <p>Describes the ID format for a resource.</p>
 */
@interface AWSEC2IdFormat : AWSModel


/**
 <p>The date in UTC at which you are permanently switched over to using longer IDs. If a deadline is not yet available for this resource type, this field is not returned.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deadline;

/**
 <p>The type of resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

/**
 <p>Indicates whether longer IDs (17-character IDs) are enabled for the resource.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useLongIds;

@end

/**
 <p>Describes an image.</p>
 */
@interface AWSEC2Image : AWSModel


/**
 <p>The architecture of the image.</p>
 */
@property (nonatomic, assign) AWSEC2ArchitectureValues architecture;

/**
 <p>Any block device mapping entries.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2BlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>The date and time the image was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable creationDate;

/**
 <p>The description of the AMI that was provided during image creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The hypervisor type of the image.</p>
 */
@property (nonatomic, assign) AWSEC2HypervisorType hypervisor;

/**
 <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The location of the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageLocation;

/**
 <p>The AWS account alias (for example, <code>amazon</code>, <code>self</code>) or the AWS account ID of the AMI owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageOwnerAlias;

/**
 <p>The type of image.</p>
 */
@property (nonatomic, assign) AWSEC2ImageTypeValues imageType;

/**
 <p>The kernel associated with the image, if any. Only applicable for machine images.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kernelId;

/**
 <p>The name of the AMI that was provided during image creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The AWS account ID of the image owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>The value is <code>Windows</code> for Windows AMIs; otherwise blank.</p>
 */
@property (nonatomic, assign) AWSEC2PlatformValues platform;

/**
 <p>Any product codes associated with the AMI.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ProductCode *> * _Nullable productCodes;

/**
 <p>Indicates whether the image has public launch permissions. The value is <code>true</code> if this image has public launch permissions or <code>false</code> if it has only implicit and explicit launch permissions.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable public;

/**
 <p>The RAM disk associated with the image, if any. Only applicable for machine images.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ramdiskId;

/**
 <p>The device name of the root device (for example, <code>/dev/sda1</code> or <code>/dev/xvda</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable rootDeviceName;

/**
 <p>The type of root device used by the AMI. The AMI can use an EBS volume or an instance store volume.</p>
 */
@property (nonatomic, assign) AWSEC2DeviceType rootDeviceType;

/**
 <p>Specifies whether enhanced networking is enabled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sriovNetSupport;

/**
 <p>The current state of the AMI. If the state is <code>available</code>, the image is successfully registered and can be used to launch an instance.</p>
 */
@property (nonatomic, assign) AWSEC2ImageState state;

/**
 <p>The reason for the state change.</p>
 */
@property (nonatomic, strong) AWSEC2StateReason * _Nullable stateReason;

/**
 <p>Any tags assigned to the image.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The type of virtualization of the AMI.</p>
 */
@property (nonatomic, assign) AWSEC2VirtualizationType virtualizationType;

@end

/**
 <p>Describes an image attribute.</p>
 */
@interface AWSEC2ImageAttribute : AWSModel


/**
 <p>One or more block device mapping entries.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2BlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>A description for the AMI.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable detail;

/**
 <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The kernel ID.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable kernelId;

/**
 <p>One or more launch permissions.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2LaunchPermission *> * _Nullable launchPermissions;

/**
 <p>One or more product codes.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ProductCode *> * _Nullable productCodes;

/**
 <p>The RAM disk ID.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable ramdiskId;

/**
 <p>The value to use for a resource attribute.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable sriovNetSupport;

@end

/**
 <p>Describes the disk container object for an import image task.</p>
 */
@interface AWSEC2ImageDiskContainer : AWSModel


/**
 <p>The description of the disk image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The block device mapping for the disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>The format of the disk image being imported.</p><p>Valid values: <code>RAW</code> | <code>VHD</code> | <code>VMDK</code> | <code>OVA</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable format;

/**
 <p>The ID of the EBS snapshot to be used for importing the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>The URL to the Amazon S3-based disk image being imported. The URL can either be a https URL (https://..) or an Amazon S3 URL (s3://..)</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

/**
 <p>The S3 bucket for the disk image.</p>
 */
@property (nonatomic, strong) AWSEC2UserBucket * _Nullable userBucket;

@end

/**
 <p>Contains the parameters for ImportImage.</p>
 */
@interface AWSEC2ImportImageRequest : AWSRequest


/**
 <p>The architecture of the virtual machine.</p><p>Valid values: <code>i386</code> | <code>x86_64</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable architecture;

/**
 <p>The client-specific data.</p>
 */
@property (nonatomic, strong) AWSEC2ClientData * _Nullable clientData;

/**
 <p>The token to enable idempotency for VM import requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A description string for the import image task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Information about the disk containers.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ImageDiskContainer *> * _Nullable diskContainers;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The target hypervisor platform.</p><p>Valid values: <code>xen</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable hypervisor;

/**
 <p>The license type to be used for the Amazon Machine Image (AMI) after importing.</p><p><b>Note:</b> You may only use BYOL if you have existing licenses with rights to use these licenses in a third party cloud like AWS. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/VMImportPrerequisites.html">VM Import/Export Prerequisites</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Valid values: <code>AWS</code> | <code>BYOL</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseType;

/**
 <p>The operating system of the virtual machine.</p><p>Valid values: <code>Windows</code> | <code>Linux</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The name of the role to use when not using the default role, 'vmimport'.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 <p>Contains the output for ImportImage.</p>
 */
@interface AWSEC2ImportImageResult : AWSModel


/**
 <p>The architecture of the virtual machine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable architecture;

/**
 <p>A description of the import task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The target hypervisor of the import task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hypervisor;

/**
 <p>The ID of the Amazon Machine Image (AMI) created by the import task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The task ID of the import image task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importTaskId;

/**
 <p>The license type of the virtual machine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseType;

/**
 <p>The operating system of the virtual machine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The progress of the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable progress;

/**
 <p>Information about the snapshots.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2SnapshotDetail *> * _Nullable snapshotDetails;

/**
 <p>A brief status of the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>A detailed status message of the import task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 <p>Describes an import image task.</p>
 */
@interface AWSEC2ImportImageTask : AWSModel


/**
 <p>The architecture of the virtual machine.</p><p>Valid values: <code>i386</code> | <code>x86_64</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable architecture;

/**
 <p>A description of the import task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The target hypervisor for the import task.</p><p>Valid values: <code>xen</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable hypervisor;

/**
 <p>The ID of the Amazon Machine Image (AMI) of the imported virtual machine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The ID of the import image task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importTaskId;

/**
 <p>The license type of the virtual machine.</p>
 */
@property (nonatomic, strong) NSString * _Nullable licenseType;

/**
 <p>The description string for the import image task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The percentage of progress of the import image task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable progress;

/**
 <p>Information about the snapshots.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2SnapshotDetail *> * _Nullable snapshotDetails;

/**
 <p>A brief status for the import image task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>A descriptive status message for the import image task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 <p>Describes the launch specification for VM import.</p>
 */
@interface AWSEC2ImportInstanceLaunchSpecification : AWSModel


/**
 <p>Reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable additionalInfo;

/**
 <p>The architecture of the instance.</p>
 */
@property (nonatomic, assign) AWSEC2ArchitectureValues architecture;

/**
 <p>One or more security group IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupIds;

/**
 <p>One or more security group names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupNames;

/**
 <p>Indicates whether an instance stops or terminates when you initiate shutdown from the instance (using the operating system command for system shutdown).</p>
 */
@property (nonatomic, assign) AWSEC2ShutdownBehavior instanceInitiatedShutdownBehavior;

/**
 <p>The instance type. For more information about the instance types that you can import, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/VMImportPrerequisites.html">Before You Get Started</a> in the Amazon Elastic Compute Cloud User Guide.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 <p>Indicates whether monitoring is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable monitoring;

/**
 <p>The placement information for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2Placement * _Nullable placement;

/**
 <p>[EC2-VPC] An available IP address from the IP address range of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

/**
 <p>[EC2-VPC] The ID of the subnet in which to launch the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The Base64-encoded MIME user data to be made available to the instance.</p>
 */
@property (nonatomic, strong) AWSEC2UserData * _Nullable userData;

@end

/**
 <p>Contains the parameters for ImportInstance.</p>
 Required parameters: [Platform]
 */
@interface AWSEC2ImportInstanceRequest : AWSRequest


/**
 <p>A description for the instance being imported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The disk image.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2DiskImage *> * _Nullable diskImages;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The launch specification.</p>
 */
@property (nonatomic, strong) AWSEC2ImportInstanceLaunchSpecification * _Nullable launchSpecification;

/**
 <p>The instance operating system.</p>
 */
@property (nonatomic, assign) AWSEC2PlatformValues platform;

@end

/**
 <p>Contains the output for ImportInstance.</p>
 */
@interface AWSEC2ImportInstanceResult : AWSModel


/**
 <p>Information about the conversion task.</p>
 */
@property (nonatomic, strong) AWSEC2ConversionTask * _Nullable conversionTask;

@end

/**
 <p>Describes an import instance task.</p>
 Required parameters: [Volumes]
 */
@interface AWSEC2ImportInstanceTaskDetails : AWSModel


/**
 <p>A description of the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The instance operating system.</p>
 */
@property (nonatomic, assign) AWSEC2PlatformValues platform;

/**
 <p>One or more volumes.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ImportInstanceVolumeDetailItem *> * _Nullable volumes;

@end

/**
 <p>Describes an import volume task.</p>
 Required parameters: [BytesConverted, AvailabilityZone, Image, Volume, Status]
 */
@interface AWSEC2ImportInstanceVolumeDetailItem : AWSModel


/**
 <p>The Availability Zone where the resulting instance will reside.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The number of bytes converted so far.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesConverted;

/**
 <p>A description of the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The image.</p>
 */
@property (nonatomic, strong) AWSEC2DiskImageDescription * _Nullable image;

/**
 <p>The status of the import of this particular disk image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The status information or errors related to the disk image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>The volume.</p>
 */
@property (nonatomic, strong) AWSEC2DiskImageVolumeDescription * _Nullable volume;

@end

/**
 <p>Contains the parameters for ImportKeyPair.</p>
 Required parameters: [KeyName, PublicKeyMaterial]
 */
@interface AWSEC2ImportKeyPairRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>A unique name for the key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>The public key. For API calls, the text must be base64-encoded. For command line tools, base64 encoding is performed for you.</p>
 */
@property (nonatomic, strong) NSData * _Nullable publicKeyMaterial;

@end

/**
 <p>Contains the output of ImportKeyPair.</p>
 */
@interface AWSEC2ImportKeyPairResult : AWSModel


/**
 <p>The MD5 public key fingerprint as specified in section 4 of RFC 4716.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyFingerprint;

/**
 <p>The key pair name you provided.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

@end

/**
 <p>Contains the parameters for ImportSnapshot.</p>
 */
@interface AWSEC2ImportSnapshotRequest : AWSRequest


/**
 <p>The client-specific data.</p>
 */
@property (nonatomic, strong) AWSEC2ClientData * _Nullable clientData;

/**
 <p>Token to enable idempotency for VM import requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The description string for the import snapshot task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Information about the disk container.</p>
 */
@property (nonatomic, strong) AWSEC2SnapshotDiskContainer * _Nullable diskContainer;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The name of the role to use when not using the default role, 'vmimport'.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 <p>Contains the output for ImportSnapshot.</p>
 */
@interface AWSEC2ImportSnapshotResult : AWSModel


/**
 <p>A description of the import snapshot task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the import snapshot task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importTaskId;

/**
 <p>Information about the import snapshot task.</p>
 */
@property (nonatomic, strong) AWSEC2SnapshotTaskDetail * _Nullable snapshotTaskDetail;

@end

/**
 <p>Describes an import snapshot task.</p>
 */
@interface AWSEC2ImportSnapshotTask : AWSModel


/**
 <p>A description of the import snapshot task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the import snapshot task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importTaskId;

/**
 <p>Describes an import snapshot task.</p>
 */
@property (nonatomic, strong) AWSEC2SnapshotTaskDetail * _Nullable snapshotTaskDetail;

@end

/**
 <p>Contains the parameters for ImportVolume.</p>
 Required parameters: [AvailabilityZone, Image, Volume]
 */
@interface AWSEC2ImportVolumeRequest : AWSRequest


/**
 <p>The Availability Zone for the resulting EBS volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>A description of the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The disk image.</p>
 */
@property (nonatomic, strong) AWSEC2DiskImageDetail * _Nullable image;

/**
 <p>The volume size.</p>
 */
@property (nonatomic, strong) AWSEC2VolumeDetail * _Nullable volume;

@end

/**
 <p>Contains the output for ImportVolume.</p>
 */
@interface AWSEC2ImportVolumeResult : AWSModel


/**
 <p>Information about the conversion task.</p>
 */
@property (nonatomic, strong) AWSEC2ConversionTask * _Nullable conversionTask;

@end

/**
 <p>Describes an import volume task.</p>
 Required parameters: [BytesConverted, AvailabilityZone, Image, Volume]
 */
@interface AWSEC2ImportVolumeTaskDetails : AWSModel


/**
 <p>The Availability Zone where the resulting volume will reside.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The number of bytes converted so far.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable bytesConverted;

/**
 <p>The description you provided when starting the import volume task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The image.</p>
 */
@property (nonatomic, strong) AWSEC2DiskImageDescription * _Nullable image;

/**
 <p>The volume.</p>
 */
@property (nonatomic, strong) AWSEC2DiskImageVolumeDescription * _Nullable volume;

@end

/**
 <p>Describes an instance.</p>
 */
@interface AWSEC2Instance : AWSModel


/**
 <p>The AMI launch index, which can be used to find this instance in the launch group.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable amiLaunchIndex;

/**
 <p>The architecture of the image.</p>
 */
@property (nonatomic, assign) AWSEC2ArchitectureValues architecture;

/**
 <p>Any block device mapping entries for the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceBlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>The idempotency token you provided when you launched the instance, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Indicates whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsOptimized;

/**
 <p>The hypervisor type of the instance.</p>
 */
@property (nonatomic, assign) AWSEC2HypervisorType hypervisor;

/**
 <p>The IAM instance profile associated with the instance, if applicable.</p>
 */
@property (nonatomic, strong) AWSEC2IamInstanceProfile * _Nullable iamInstanceProfile;

/**
 <p>The ID of the AMI used to launch the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Indicates whether this is a Spot instance or a Scheduled Instance.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceLifecycleType instanceLifecycle;

/**
 <p>The instance type.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 <p>The kernel associated with this instance, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kernelId;

/**
 <p>The name of the key pair, if this instance was launched with an associated key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>The time the instance was launched.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable launchTime;

/**
 <p>The monitoring information for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2Monitoring * _Nullable monitoring;

/**
 <p>[EC2-VPC] One or more network interfaces for the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceNetworkInterface *> * _Nullable networkInterfaces;

/**
 <p>The location where the instance launched, if applicable.</p>
 */
@property (nonatomic, strong) AWSEC2Placement * _Nullable placement;

/**
 <p>The value is <code>Windows</code> for Windows instances; otherwise blank.</p>
 */
@property (nonatomic, assign) AWSEC2PlatformValues platform;

/**
 <p>The private DNS name assigned to the instance. This DNS name can only be used inside the Amazon EC2 network. This name is not available until the instance enters the <code>running</code> state. For EC2-VPC, this name is only available if you've enabled DNS hostnames for your VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateDnsName;

/**
 <p>The private IP address assigned to the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

/**
 <p>The product codes attached to this instance, if applicable.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ProductCode *> * _Nullable productCodes;

/**
 <p>The public DNS name assigned to the instance. This name is not available until the instance enters the <code>running</code> state. For EC2-VPC, this name is only available if you've enabled DNS hostnames for your VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicDnsName;

/**
 <p>The public IP address assigned to the instance, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIpAddress;

/**
 <p>The RAM disk associated with this instance, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ramdiskId;

/**
 <p>The root device name (for example, <code>/dev/sda1</code> or <code>/dev/xvda</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable rootDeviceName;

/**
 <p>The root device type used by the AMI. The AMI can use an EBS volume or an instance store volume.</p>
 */
@property (nonatomic, assign) AWSEC2DeviceType rootDeviceType;

/**
 <p>One or more security groups for the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2GroupIdentifier *> * _Nullable securityGroups;

/**
 <p>Specifies whether to enable an instance launched in a VPC to perform NAT. This controls whether source/destination checking is enabled on the instance. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. The value must be <code>false</code> for the instance to perform NAT. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html">NAT Instances</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sourceDestCheck;

/**
 <p>If the request is a Spot instance request, the ID of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotInstanceRequestId;

/**
 <p>Specifies whether enhanced networking is enabled. </p>
 */
@property (nonatomic, strong) NSString * _Nullable sriovNetSupport;

/**
 <p>The current state of the instance.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceState * _Nullable state;

/**
 <p>The reason for the most recent state transition.</p>
 */
@property (nonatomic, strong) AWSEC2StateReason * _Nullable stateReason;

/**
 <p>The reason for the most recent state transition. This might be an empty string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateTransitionReason;

/**
 <p>[EC2-VPC] The ID of the subnet in which the instance is running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>Any tags assigned to the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The virtualization type of the instance.</p>
 */
@property (nonatomic, assign) AWSEC2VirtualizationType virtualizationType;

/**
 <p>[EC2-VPC] The ID of the VPC in which the instance is running.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes an instance attribute.</p>
 */
@interface AWSEC2InstanceAttribute : AWSModel


/**
 <p>The block device mapping of the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceBlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>If the value is <code>true</code>, you can't terminate the instance through the Amazon EC2 console, CLI, or API; otherwise, you can.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable disableApiTermination;

/**
 <p>Indicates whether the instance is optimized for EBS I/O.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable ebsOptimized;

/**
 <p>The security groups associated with the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2GroupIdentifier *> * _Nullable groups;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Indicates whether an instance stops or terminates when you initiate shutdown from the instance (using the operating system command for system shutdown).</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable instanceInitiatedShutdownBehavior;

/**
 <p>The instance type.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable instanceType;

/**
 <p>The kernel ID.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable kernelId;

/**
 <p>A list of product codes.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ProductCode *> * _Nullable productCodes;

/**
 <p>The RAM disk ID.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable ramdiskId;

/**
 <p>The name of the root device (for example, <code>/dev/sda1</code> or <code>/dev/xvda</code>).</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable rootDeviceName;

/**
 <p>Indicates whether source/destination checking is enabled. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. This value must be <code>false</code> for a NAT instance to perform NAT.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable sourceDestCheck;

/**
 <p>The value to use for a resource attribute.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable sriovNetSupport;

/**
 <p>The Base64-encoded MIME user data.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable userData;

@end

/**
 <p>Describes a block device mapping.</p>
 */
@interface AWSEC2InstanceBlockDeviceMapping : AWSModel


/**
 <p>The device name exposed to the instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>Parameters used to automatically set up EBS volumes when the instance is launched.</p>
 */
@property (nonatomic, strong) AWSEC2EbsInstanceBlockDevice * _Nullable ebs;

@end

/**
 <p>Describes a block device mapping entry.</p>
 */
@interface AWSEC2InstanceBlockDeviceMappingSpecification : AWSModel


/**
 <p>The device name exposed to the instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>Parameters used to automatically set up EBS volumes when the instance is launched.</p>
 */
@property (nonatomic, strong) AWSEC2EbsInstanceBlockDeviceSpecification * _Nullable ebs;

/**
 <p>suppress the specified device included in the block device mapping.</p>
 */
@property (nonatomic, strong) NSString * _Nullable noDevice;

/**
 <p>The virtual device name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualName;

@end

/**
 <p>Information about the instance type that the Dedicated host supports.</p>
 */
@interface AWSEC2InstanceCapacity : AWSModel


/**
 <p>The number of instances that can still be launched onto the Dedicated host.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable availableCapacity;

/**
 <p>The instance type size supported by the Dedicated host.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The total number of instances that can be launched onto the Dedicated host.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalCapacity;

@end

/**
 <p>Describes a Reserved Instance listing state.</p>
 */
@interface AWSEC2InstanceCount : AWSModel


/**
 <p>The number of listed Reserved Instances in the state specified by the <code>state</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>The states of the listed Reserved Instances.</p>
 */
@property (nonatomic, assign) AWSEC2ListingState state;

@end

/**
 <p>Describes an instance to export.</p>
 */
@interface AWSEC2InstanceExportDetails : AWSModel


/**
 <p>The ID of the resource being exported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The target virtualization environment.</p>
 */
@property (nonatomic, assign) AWSEC2ExportEnvironment targetEnvironment;

@end

/**
 <p>Describes the monitoring information of the instance.</p>
 */
@interface AWSEC2InstanceMonitoring : AWSModel


/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The monitoring information.</p>
 */
@property (nonatomic, strong) AWSEC2Monitoring * _Nullable monitoring;

@end

/**
 <p>Describes a network interface.</p>
 */
@interface AWSEC2InstanceNetworkInterface : AWSModel


/**
 <p>The association information for an Elastic IP associated with the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceNetworkInterfaceAssociation * _Nullable association;

/**
 <p>The network interface attachment.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceNetworkInterfaceAttachment * _Nullable attachment;

/**
 <p>The description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>One or more security groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2GroupIdentifier *> * _Nullable groups;

/**
 <p>The MAC address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable macAddress;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The ID of the AWS account that created the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>The private DNS name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateDnsName;

/**
 <p>The IP address of the network interface within the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

/**
 <p>The private IP addresses associated with the network interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstancePrivateIpAddress *> * _Nullable privateIpAddresses;

/**
 <p>Indicates whether to validate network traffic to or from this network interface.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sourceDestCheck;

/**
 <p>The status of the network interface.</p>
 */
@property (nonatomic, assign) AWSEC2NetworkInterfaceStatus status;

/**
 <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes association information for an Elastic IP address.</p>
 */
@interface AWSEC2InstanceNetworkInterfaceAssociation : AWSModel


/**
 <p>The ID of the owner of the Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipOwnerId;

/**
 <p>The public DNS name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicDnsName;

/**
 <p>The public IP address or Elastic IP address bound to the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

@end

/**
 <p>Describes a network interface attachment.</p>
 */
@interface AWSEC2InstanceNetworkInterfaceAttachment : AWSModel


/**
 <p>The time stamp when the attachment initiated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable attachTime;

/**
 <p>The ID of the network interface attachment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentId;

/**
 <p>Indicates whether the network interface is deleted when the instance is terminated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

/**
 <p>The index of the device on the instance for the network interface attachment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deviceIndex;

/**
 <p>The attachment state.</p>
 */
@property (nonatomic, assign) AWSEC2AttachmentStatus status;

@end

/**
 <p>Describes a network interface.</p>
 */
@interface AWSEC2InstanceNetworkInterfaceSpecification : AWSModel


/**
 <p>Indicates whether to assign a public IP address to an instance you launch in a VPC. The public IP address can only be assigned to a network interface for eth0, and can only be assigned to a new network interface, not an existing one. You cannot specify more than one network interface in the request. If launching into a default subnet, the default value is <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable associatePublicIpAddress;

/**
 <p>If set to <code>true</code>, the interface is deleted when the instance is terminated. You can specify <code>true</code> only if creating a new network interface when launching an instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

/**
 <p>The description of the network interface. Applies only if creating a network interface when launching an instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The index of the device on the instance for the network interface attachment. If you are specifying a network interface in a <a>RunInstances</a> request, you must provide the device index.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deviceIndex;

/**
 <p>The IDs of the security groups for the network interface. Applies only if creating a network interface when launching an instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groups;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The private IP address of the network interface. Applies only if creating a network interface when launching an instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

/**
 <p>One or more private IP addresses to assign to the network interface. Only one private IP address can be designated as primary.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2PrivateIpAddressSpecification *> * _Nullable privateIpAddresses;

/**
 <p>The number of secondary private IP addresses. You can't specify this option and specify more than one private IP address using the private IP addresses option.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable secondaryPrivateIpAddressCount;

/**
 <p>The ID of the subnet associated with the network string. Applies only if creating a network interface when launching an instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>Describes a private IP address.</p>
 */
@interface AWSEC2InstancePrivateIpAddress : AWSModel


/**
 <p>The association information for an Elastic IP address for the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceNetworkInterfaceAssociation * _Nullable association;

/**
 <p>Indicates whether this IP address is the primary private IP address of the network interface.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable primary;

/**
 <p>The private DNS name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateDnsName;

/**
 <p>The private IP address of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

@end

/**
 <p>Describes the current state of the instance.</p>
 */
@interface AWSEC2InstanceState : AWSModel


/**
 <p>The low byte represents the state. The high byte is an opaque internal value and should be ignored.</p><ul><li><p><code>0</code> : <code>pending</code></p></li><li><p><code>16</code> : <code>running</code></p></li><li><p><code>32</code> : <code>shutting-down</code></p></li><li><p><code>48</code> : <code>terminated</code></p></li><li><p><code>64</code> : <code>stopping</code></p></li><li><p><code>80</code> : <code>stopped</code></p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable code;

/**
 <p>The current state of the instance.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceStateName name;

@end

/**
 <p>Describes an instance state change.</p>
 */
@interface AWSEC2InstanceStateChange : AWSModel


/**
 <p>The current state of the instance.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceState * _Nullable currentState;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The previous state of the instance.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceState * _Nullable previousState;

@end

/**
 <p>Describes the status of an instance.</p>
 */
@interface AWSEC2InstanceStatus : AWSModel


/**
 <p>The Availability Zone of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>Any scheduled events associated with the instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceStatusEvent *> * _Nullable events;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The intended state of the instance. <a>DescribeInstanceStatus</a> requires that an instance be in the <code>running</code> state.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceState * _Nullable instanceState;

/**
 <p>Reports impaired functionality that stems from issues internal to the instance, such as impaired reachability.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceStatusSummary * _Nullable instanceStatus;

/**
 <p>Reports impaired functionality that stems from issues related to the systems that support an instance, such as hardware failures and network connectivity problems.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceStatusSummary * _Nullable systemStatus;

@end

/**
 <p>Describes the instance status.</p>
 */
@interface AWSEC2InstanceStatusDetails : AWSModel


/**
 <p>The time when a status check failed. For an instance that was launched and impaired, this is the time when the instance was launched.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable impairedSince;

/**
 <p>The type of instance status.</p>
 */
@property (nonatomic, assign) AWSEC2StatusName name;

/**
 <p>The status.</p>
 */
@property (nonatomic, assign) AWSEC2StatusType status;

@end

/**
 <p>Describes a scheduled event for an instance.</p>
 */
@interface AWSEC2InstanceStatusEvent : AWSModel


/**
 <p>The event code.</p>
 */
@property (nonatomic, assign) AWSEC2EventCode code;

/**
 <p>A description of the event.</p><p>After a scheduled event is completed, it can still be described for up to a week. If the event has been completed, this description starts with the following text: [Completed].</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The latest scheduled end time for the event.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable notAfter;

/**
 <p>The earliest scheduled start time for the event.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable notBefore;

@end

/**
 <p>Describes the status of an instance.</p>
 */
@interface AWSEC2InstanceStatusSummary : AWSModel


/**
 <p>The system instance health or application instance health.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceStatusDetails *> * _Nullable details;

/**
 <p>The status.</p>
 */
@property (nonatomic, assign) AWSEC2SummaryStatus status;

@end

/**
 <p>Describes an Internet gateway.</p>
 */
@interface AWSEC2InternetGateway : AWSModel


/**
 <p>Any VPCs attached to the Internet gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InternetGatewayAttachment *> * _Nullable attachments;

/**
 <p>The ID of the Internet gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable internetGatewayId;

/**
 <p>Any tags assigned to the Internet gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

@end

/**
 <p>Describes the attachment of a VPC to an Internet gateway.</p>
 */
@interface AWSEC2InternetGatewayAttachment : AWSModel


/**
 <p>The current state of the attachment.</p>
 */
@property (nonatomic, assign) AWSEC2AttachmentStatus state;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes a security group rule.</p>
 */
@interface AWSEC2IpPermission : AWSModel


/**
 <p>The start of port range for the TCP and UDP protocols, or an ICMP type number. A value of <code>-1</code> indicates all ICMP types.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fromPort;

/**
 <p>The IP protocol name (for <code>tcp</code>, <code>udp</code>, and <code>icmp</code>) or number (see <a href="http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml">Protocol Numbers</a>). </p><p>[EC2-VPC only] When you authorize or revoke security group rules, you can use <code>-1</code> to specify all.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipProtocol;

/**
 <p>One or more IP ranges.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2IpRange *> * _Nullable ipRanges;

/**
 <p>(Valid for <a>AuthorizeSecurityGroupEgress</a>, <a>RevokeSecurityGroupEgress</a> and <a>DescribeSecurityGroups</a> only) One or more prefix list IDs for an AWS service. In an <a>AuthorizeSecurityGroupEgress</a> request, this is the AWS service that you want to access through a VPC endpoint from instances associated with the security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2PrefixListId *> * _Nullable prefixListIds;

/**
 <p>The end of port range for the TCP and UDP protocols, or an ICMP code. A value of <code>-1</code> indicates all ICMP codes for the specified ICMP type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable toPort;

/**
 <p>One or more security group and AWS account ID pairs.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2UserIdGroupPair *> * _Nullable userIdGroupPairs;

@end

/**
 <p>Describes an IP range.</p>
 */
@interface AWSEC2IpRange : AWSModel


/**
 <p>The CIDR range. You can either specify a CIDR range or a source security group, not both.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrIp;

@end

/**
 <p>Describes a key pair.</p>
 */
@interface AWSEC2KeyPair : AWSModel


/**
 <p>The SHA-1 digest of the DER encoded private key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyFingerprint;

/**
 <p>An unencrypted PEM encoded RSA private key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyMaterial;

/**
 <p>The name of the key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

@end

/**
 <p>Describes a key pair.</p>
 */
@interface AWSEC2KeyPairInfo : AWSModel


/**
 <p>If you used <a>CreateKeyPair</a> to create the key pair, this is the SHA-1 digest of the DER encoded private key. If you used <a>ImportKeyPair</a> to provide AWS the public key, this is the MD5 public key fingerprint as specified in section 4 of RFC4716.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyFingerprint;

/**
 <p>The name of the key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

@end

/**
 <p>Describes a launch permission.</p>
 */
@interface AWSEC2LaunchPermission : AWSModel


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, assign) AWSEC2PermissionGroup group;

/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 <p>Describes a launch permission modification.</p>
 */
@interface AWSEC2LaunchPermissionModifications : AWSModel


/**
 <p>The AWS account ID to add to the list of launch permissions for the AMI.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2LaunchPermission *> * _Nullable add;

/**
 <p>The AWS account ID to remove from the list of launch permissions for the AMI.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2LaunchPermission *> * _Nullable remove;

@end

/**
 <p>Describes the launch specification for an instance.</p>
 */
@interface AWSEC2LaunchSpecification : AWSModel


/**
 <p>Deprecated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressingType;

/**
 <p>One or more block device mapping entries.</p><p>Although you can specify encrypted EBS volumes in this block device mapping for your Spot Instances, these volumes are not encrypted.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2BlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>Indicates whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsOptimized;

/**
 <p>The IAM instance profile.</p>
 */
@property (nonatomic, strong) AWSEC2IamInstanceProfileSpecification * _Nullable iamInstanceProfile;

/**
 <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The instance type.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 <p>The ID of the kernel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kernelId;

/**
 <p>The name of the key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>Describes the monitoring for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2RunInstancesMonitoringEnabled * _Nullable monitoring;

/**
 <p>One or more network interfaces.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceNetworkInterfaceSpecification *> * _Nullable networkInterfaces;

/**
 <p>The placement information for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2SpotPlacement * _Nullable placement;

/**
 <p>The ID of the RAM disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ramdiskId;

/**
 <p>One or more security groups. When requesting instances in a VPC, you must specify the IDs of the security groups. When requesting instances in EC2-Classic, you can specify the names or the IDs of the security groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2GroupIdentifier *> * _Nullable securityGroups;

/**
 <p>The ID of the subnet in which to launch the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The Base64-encoded MIME user data to make available to the instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userData;

@end

/**
 <p>Contains the parameters for ModifyHosts.</p>
 Required parameters: [HostIds, AutoPlacement]
 */
@interface AWSEC2ModifyHostsRequest : AWSRequest


/**
 <p>Specify whether to enable or disable auto-placement.</p>
 */
@property (nonatomic, assign) AWSEC2AutoPlacement autoPlacement;

/**
 <p>The host IDs of the Dedicated hosts you want to modify.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable hostIds;

@end

/**
 <p>Contains the output of ModifyHosts.</p>
 */
@interface AWSEC2ModifyHostsResult : AWSModel


/**
 <p>The IDs of the Dedicated hosts that were successfully modified.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable successful;

/**
 <p>The IDs of the Dedicated hosts that could not be modified. Check whether the setting you requested can be used.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2UnsuccessfulItem *> * _Nullable unsuccessful;

@end

/**
 <p>Contains the parameters of ModifyIdFormat.</p>
 Required parameters: [Resource, UseLongIds]
 */
@interface AWSEC2ModifyIdFormatRequest : AWSRequest


/**
 <p>The type of resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resource;

/**
 <p>Indicate whether the resource should use longer IDs (17-character IDs).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useLongIds;

@end

/**
 <p>Contains the parameters for ModifyImageAttribute.</p>
 Required parameters: [ImageId]
 */
@interface AWSEC2ModifyImageAttributeRequest : AWSRequest


/**
 <p>The name of the attribute to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attribute;

/**
 <p>A description for the AMI.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable detail;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>A launch permission modification.</p>
 */
@property (nonatomic, strong) AWSEC2LaunchPermissionModifications * _Nullable launchPermission;

/**
 <p>The operation type.</p>
 */
@property (nonatomic, assign) AWSEC2OperationType operationType;

/**
 <p>One or more product codes. After you add a product code to an AMI, it can't be removed. This is only valid when modifying the <code>productCodes</code> attribute.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable productCodes;

/**
 <p>One or more user groups. This is only valid when modifying the <code>launchPermission</code> attribute.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userGroups;

/**
 <p>One or more AWS account IDs. This is only valid when modifying the <code>launchPermission</code> attribute.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userIds;

/**
 <p>The value of the attribute being modified. This is only valid when modifying the <code>description</code> attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Contains the parameters for ModifyInstanceAttribute.</p>
 Required parameters: [InstanceId]
 */
@interface AWSEC2ModifyInstanceAttributeRequest : AWSRequest


/**
 <p>The name of the attribute.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceAttributeName attribute;

/**
 <p>Modifies the <code>DeleteOnTermination</code> attribute for volumes that are currently attached. The volume must be owned by the caller. If no value is specified for <code>DeleteOnTermination</code>, the default is <code>true</code> and the volume is deleted when the instance is terminated.</p><p>To add instance store volumes to an Amazon EBS-backed instance, you must add them when you launch the instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html#Using_OverridingAMIBDM">Updating the Block Device Mapping when Launching an Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceBlockDeviceMappingSpecification *> * _Nullable blockDeviceMappings;

/**
 <p>If the value is <code>true</code>, you can't terminate the instance using the Amazon EC2 console, CLI, or API; otherwise, you can. You cannot use this paramater for Spot Instances.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable disableApiTermination;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Specifies whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable ebsOptimized;

/**
 <p>[EC2-VPC] Changes the security groups of the instance. You must specify at least one security group, even if it's just the default security group for the VPC. You must specify the security group ID, not the security group name.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groups;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>Specifies whether an instance stops or terminates when you initiate shutdown from the instance (using the operating system command for system shutdown).</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable instanceInitiatedShutdownBehavior;

/**
 <p>Changes the instance type to the specified value. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a>. If the instance type is not valid, the error returned is <code>InvalidInstanceAttributeValue</code>.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable instanceType;

/**
 <p>Changes the instance's kernel to the specified value. We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedKernels.html">PV-GRUB</a>.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable kernel;

/**
 <p>Changes the instance's RAM disk to the specified value. We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedKernels.html">PV-GRUB</a>.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable ramdisk;

/**
 <p>Specifies whether source/destination checking is enabled. A value of <code>true</code> means that checking is enabled, and <code>false</code> means checking is disabled. This value must be <code>false</code> for a NAT instance to perform NAT.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable sourceDestCheck;

/**
 <p>Set to <code>simple</code> to enable enhanced networking for the instance.</p><p>There is no way to disable enhanced networking at this time.</p><p>This option is supported only for HVM instances. Specifying this option with a PV instance can make it unreachable.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable sriovNetSupport;

/**
 <p>Changes the instance's user data to the specified base64-encoded value. For command line tools, base64 encoding is performed for you.</p>
 */
@property (nonatomic, strong) AWSEC2BlobAttributeValue * _Nullable userData;

/**
 <p>A new value for the attribute. Use only with the <code>kernel</code>, <code>ramdisk</code>, <code>userData</code>, <code>disableApiTermination</code>, or <code>instanceInitiatedShutdownBehavior</code> attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Contains the parameters for ModifyInstancePlacement.</p>
 Required parameters: [InstanceId]
 */
@interface AWSEC2ModifyInstancePlacementRequest : AWSRequest


/**
 <p>The new affinity setting for the instance.</p>
 */
@property (nonatomic, assign) AWSEC2Affinity affinity;

/**
 <p>The ID of the Dedicated host that the instance will have affinity with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostId;

/**
 <p>The ID of the instance that you are modifying.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The tenancy of the instance that you are modifying.</p>
 */
@property (nonatomic, assign) AWSEC2HostTenancy tenancy;

@end

/**
 <p>Contains the output of ModifyInstancePlacement.</p>
 */
@interface AWSEC2ModifyInstancePlacementResult : AWSModel


/**
 <p>Is <code>true</code> if the request succeeds, and an error otherwise.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returned;

@end

/**
 <p>Contains the parameters for ModifyNetworkInterfaceAttribute.</p>
 Required parameters: [NetworkInterfaceId]
 */
@interface AWSEC2ModifyNetworkInterfaceAttributeRequest : AWSRequest


/**
 <p>Information about the interface attachment. If modifying the 'delete on termination' attribute, you must specify the ID of the interface attachment.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkInterfaceAttachmentChanges * _Nullable attachment;

/**
 <p>A description for the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue * _Nullable detail;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Changes the security groups for the network interface. The new set of groups you specify replaces the current set. You must specify at least one group, even if it's just the default security group in the VPC. You must specify the ID of the security group, not the name.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groups;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>Indicates whether source/destination checking is enabled. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. This value must be <code>false</code> for a NAT instance to perform NAT. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html">NAT Instances</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable sourceDestCheck;

@end

/**
 <p>Contains the parameters for ModifyReservedInstances.</p>
 Required parameters: [ReservedInstancesIds, TargetConfigurations]
 */
@interface AWSEC2ModifyReservedInstancesRequest : AWSRequest


/**
 <p>A unique, case-sensitive token you provide to ensure idempotency of your modification request. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring Idempotency</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The IDs of the Reserved Instances to modify.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reservedInstancesIds;

/**
 <p>The configuration settings for the Reserved Instances to modify.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ReservedInstancesConfiguration *> * _Nullable targetConfigurations;

@end

/**
 <p>Contains the output of ModifyReservedInstances.</p>
 */
@interface AWSEC2ModifyReservedInstancesResult : AWSModel


/**
 <p>The ID for the modification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesModificationId;

@end

/**
 <p>Contains the parameters for ModifySnapshotAttribute.</p>
 Required parameters: [SnapshotId]
 */
@interface AWSEC2ModifySnapshotAttributeRequest : AWSRequest


/**
 <p>The snapshot attribute to modify.</p><note><p>Only volume creation permissions may be modified at the customer level.</p></note>
 */
@property (nonatomic, assign) AWSEC2SnapshotAttributeName attribute;

/**
 <p>A JSON representation of the snapshot attribute modification.</p>
 */
@property (nonatomic, strong) AWSEC2CreateVolumePermissionModifications * _Nullable createVolumePermission;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The group to modify for the snapshot.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupNames;

/**
 <p>The type of operation to perform to the attribute.</p>
 */
@property (nonatomic, assign) AWSEC2OperationType operationType;

/**
 <p>The ID of the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>The account ID to modify for the snapshot.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userIds;

@end

/**
 <p>Contains the parameters for ModifySpotFleetRequest.</p>
 Required parameters: [SpotFleetRequestId]
 */
@interface AWSEC2ModifySpotFleetRequestRequest : AWSRequest


/**
 <p>Indicates whether running Spot instances should be terminated if the target capacity of the Spot fleet request is decreased below the current size of the Spot fleet.</p>
 */
@property (nonatomic, assign) AWSEC2ExcessCapacityTerminationPolicy excessCapacityTerminationPolicy;

/**
 <p>The ID of the Spot fleet request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotFleetRequestId;

/**
 <p>The size of the fleet.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetCapacity;

@end

/**
 <p>Contains the output of ModifySpotFleetRequest.</p>
 */
@interface AWSEC2ModifySpotFleetRequestResponse : AWSModel


/**
 <p>Is <code>true</code> if the request succeeds, and an error otherwise.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returned;

@end

/**
 <p>Contains the parameters for ModifySubnetAttribute.</p>
 Required parameters: [SubnetId]
 */
@interface AWSEC2ModifySubnetAttributeRequest : AWSRequest


/**
 <p>Specify <code>true</code> to indicate that instances launched into the specified subnet should be assigned public IP address.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable mapPublicIpOnLaunch;

/**
 <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>Contains the parameters for ModifyVolumeAttribute.</p>
 Required parameters: [VolumeId]
 */
@interface AWSEC2ModifyVolumeAttributeRequest : AWSRequest


/**
 <p>Indicates whether the volume should be auto-enabled for I/O operations.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable autoEnableIO;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

@end

/**
 <p>Contains the parameters for ModifyVpcAttribute.</p>
 Required parameters: [VpcId]
 */
@interface AWSEC2ModifyVpcAttributeRequest : AWSRequest


/**
 <p>Indicates whether the instances launched in the VPC get DNS hostnames. If enabled, instances in the VPC get DNS hostnames; otherwise, they do not.</p><p>You cannot modify the DNS resolution and DNS hostnames attributes in the same request. Use separate requests for each attribute. You can only enable DNS hostnames if you've enabled DNS support.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable enableDnsHostnames;

/**
 <p>Indicates whether the DNS resolution is supported for the VPC. If enabled, queries to the Amazon provided DNS server at the 169.254.169.253 IP address, or the reserved IP address at the base of the VPC network range "plus two" will succeed. If disabled, the Amazon provided DNS service in the VPC that resolves public DNS hostnames to IP addresses is not enabled. </p><p>You cannot modify the DNS resolution and DNS hostnames attributes in the same request. Use separate requests for each attribute.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue * _Nullable enableDnsSupport;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the parameters for ModifyVpcEndpoint.</p>
 Required parameters: [VpcEndpointId]
 */
@interface AWSEC2ModifyVpcEndpointRequest : AWSRequest


/**
 <p>One or more route tables IDs to associate with the endpoint.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable addRouteTableIds;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>A policy document to attach to the endpoint. The policy must be in valid JSON format. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>One or more route table IDs to disassociate from the endpoint.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable removeRouteTableIds;

/**
 <p>Specify <code>true</code> to reset the policy document to the default policy. The default policy allows access to the service.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable resetPolicy;

/**
 <p>The ID of the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcEndpointId;

@end

/**
 <p>Contains the output of ModifyVpcEndpoint.</p>
 */
@interface AWSEC2ModifyVpcEndpointResult : AWSModel


/**
 <p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returned;

@end

/**
 
 */
@interface AWSEC2ModifyVpcPeeringConnectionOptionsRequest : AWSRequest


/**
 <p>The VPC peering connection options for the accepter VPC.</p>
 */
@property (nonatomic, strong) AWSEC2PeeringConnectionOptionsRequest * _Nullable accepterPeeringConnectionOptions;

/**
 <p>Checks whether you have the required permissions for the operation, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The VPC peering connection options for the requester VPC.</p>
 */
@property (nonatomic, strong) AWSEC2PeeringConnectionOptionsRequest * _Nullable requesterPeeringConnectionOptions;

/**
 <p>The ID of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcPeeringConnectionId;

@end

/**
 
 */
@interface AWSEC2ModifyVpcPeeringConnectionOptionsResult : AWSModel


/**
 <p>Information about the VPC peering connection options for the accepter VPC.</p>
 */
@property (nonatomic, strong) AWSEC2PeeringConnectionOptions * _Nullable accepterPeeringConnectionOptions;

/**
 <p>Information about the VPC peering connection options for the requester VPC.</p>
 */
@property (nonatomic, strong) AWSEC2PeeringConnectionOptions * _Nullable requesterPeeringConnectionOptions;

@end

/**
 <p>Contains the parameters for MonitorInstances.</p>
 Required parameters: [InstanceIds]
 */
@interface AWSEC2MonitorInstancesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

@end

/**
 <p>Contains the output of MonitorInstances.</p>
 */
@interface AWSEC2MonitorInstancesResult : AWSModel


/**
 <p>Monitoring information for one or more instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceMonitoring *> * _Nullable instanceMonitorings;

@end

/**
 <p>Describes the monitoring for the instance.</p>
 */
@interface AWSEC2Monitoring : AWSModel


/**
 <p>Indicates whether monitoring is enabled for the instance.</p>
 */
@property (nonatomic, assign) AWSEC2MonitoringState state;

@end

/**
 <p>Contains the parameters for MoveAddressToVpc.</p>
 Required parameters: [PublicIp]
 */
@interface AWSEC2MoveAddressToVpcRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

@end

/**
 <p>Contains the output of MoveAddressToVpc.</p>
 */
@interface AWSEC2MoveAddressToVpcResult : AWSModel


/**
 <p>The allocation ID for the Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allocationId;

/**
 <p>The status of the move of the IP address.</p>
 */
@property (nonatomic, assign) AWSEC2Status status;

@end

/**
 <p>Describes the status of a moving Elastic IP address.</p>
 */
@interface AWSEC2MovingAddressStatus : AWSModel


/**
 <p>The status of the Elastic IP address that's being moved to the EC2-VPC platform, or restored to the EC2-Classic platform.</p>
 */
@property (nonatomic, assign) AWSEC2MoveStatus moveStatus;

/**
 <p>The Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

@end

/**
 <p>Describes a NAT gateway.</p>
 */
@interface AWSEC2NatGateway : AWSModel


/**
 <p>The date and time the NAT gateway was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The date and time the NAT gateway was deleted, if applicable.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deleteTime;

/**
 <p>If the NAT gateway could not be created, specifies the error code for the failure. (<code>InsufficientFreeAddressesInSubnet</code> | <code>Gateway.NotAttached</code> | <code>InvalidAllocationID.NotFound</code> | <code>Resource.AlreadyAssociated</code> | <code>InternalError</code> | <code>InvalidSubnetID.NotFound</code>)</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureCode;

/**
 <p>If the NAT gateway could not be created, specifies the error message for the failure, that corresponds to the error code. </p><ul><li><p>For InsufficientFreeAddressesInSubnet: "Subnet has insufficient free addresses to create this NAT gateway"</p></li><li><p>For Gateway.NotAttached: "Network vpc-xxxxxxxx has no Internet gateway attached"</p></li><li><p>For InvalidAllocationID.NotFound: "Elastic IP address eipalloc-xxxxxxxx could not be associated with this NAT gateway"</p></li><li><p>For Resource.AlreadyAssociated: "Elastic IP address eipalloc-xxxxxxxx is already associated"</p></li><li><p>For InternalError: "Network interface eni-xxxxxxxx, created and used internally by this NAT gateway is in an invalid state. Please try again."</p></li><li><p>For InvalidSubnetID.NotFound: "The specified subnet subnet-xxxxxxxx does not exist or could not be found."</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable failureMessage;

/**
 <p>Information about the IP addresses and network interface associated with the NAT gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2NatGatewayAddress *> * _Nullable natGatewayAddresses;

/**
 <p>The ID of the NAT gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable natGatewayId;

/**
 <p>The state of the NAT gateway.</p>
 */
@property (nonatomic, assign) AWSEC2NatGatewayState state;

/**
 <p>The ID of the subnet in which the NAT gateway is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The ID of the VPC in which the NAT gateway is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes the IP addresses and network interface associated with a NAT gateway.</p>
 */
@interface AWSEC2NatGatewayAddress : AWSModel


/**
 <p>The allocation ID of the Elastic IP address that's associated with the NAT gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allocationId;

/**
 <p>The ID of the network interface associated with the NAT gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The private IP address associated with the Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIp;

/**
 <p>The Elastic IP address associated with the NAT gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

@end

/**
 <p>Describes a network ACL.</p>
 */
@interface AWSEC2NetworkAcl : AWSModel


/**
 <p>Any associations between the network ACL and one or more subnets</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2NetworkAclAssociation *> * _Nullable associations;

/**
 <p>One or more entries (rules) in the network ACL.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2NetworkAclEntry *> * _Nullable entries;

/**
 <p>Indicates whether this is the default network ACL for the VPC.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefault;

/**
 <p>The ID of the network ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkAclId;

/**
 <p>Any tags assigned to the network ACL.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The ID of the VPC for the network ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes an association between a network ACL and a subnet.</p>
 */
@interface AWSEC2NetworkAclAssociation : AWSModel


/**
 <p>The ID of the association between a network ACL and a subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkAclAssociationId;

/**
 <p>The ID of the network ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkAclId;

/**
 <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>Describes an entry in a network ACL.</p>
 */
@interface AWSEC2NetworkAclEntry : AWSModel


/**
 <p>The network range to allow or deny, in CIDR notation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrBlock;

/**
 <p>Indicates whether the rule is an egress rule (applied to traffic leaving the subnet).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable egress;

/**
 <p>ICMP protocol: The ICMP type and code.</p>
 */
@property (nonatomic, strong) AWSEC2IcmpTypeCode * _Nullable icmpTypeCode;

/**
 <p>TCP or UDP protocols: The range of ports the rule applies to.</p>
 */
@property (nonatomic, strong) AWSEC2PortRange * _Nullable portRange;

/**
 <p>The protocol. A value of <code>-1</code> means all protocols.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

/**
 <p>Indicates whether to allow or deny the traffic that matches the rule.</p>
 */
@property (nonatomic, assign) AWSEC2RuleAction ruleAction;

/**
 <p>The rule number for the entry. ACL entries are processed in ascending order by rule number.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleNumber;

@end

/**
 <p>Describes a network interface.</p>
 */
@interface AWSEC2NetworkInterface : AWSModel


/**
 <p>The association information for an Elastic IP associated with the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkInterfaceAssociation * _Nullable association;

/**
 <p>The network interface attachment.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkInterfaceAttachment * _Nullable attachment;

/**
 <p>The Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>A description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Any security groups for the network interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2GroupIdentifier *> * _Nullable groups;

/**
 <p>The type of interface. </p>
 */
@property (nonatomic, assign) AWSEC2NetworkInterfaceType interfaceType;

/**
 <p>The MAC address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable macAddress;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The AWS account ID of the owner of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>The private DNS name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateDnsName;

/**
 <p>The IP address of the network interface within the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

/**
 <p>The private IP addresses associated with the network interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2NetworkInterfacePrivateIpAddress *> * _Nullable privateIpAddresses;

/**
 <p>The ID of the entity that launched the instance on your behalf (for example, AWS Management Console or Auto Scaling).</p>
 */
@property (nonatomic, strong) NSString * _Nullable requesterId;

/**
 <p>Indicates whether the network interface is being managed by AWS.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requesterManaged;

/**
 <p>Indicates whether traffic to or from the instance is validated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable sourceDestCheck;

/**
 <p>The status of the network interface.</p>
 */
@property (nonatomic, assign) AWSEC2NetworkInterfaceStatus status;

/**
 <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>Any tags assigned to the network interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tagSet;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes association information for an Elastic IP address.</p>
 */
@interface AWSEC2NetworkInterfaceAssociation : AWSModel


/**
 <p>The allocation ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allocationId;

/**
 <p>The association ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The ID of the Elastic IP address owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipOwnerId;

/**
 <p>The public DNS name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicDnsName;

/**
 <p>The address of the Elastic IP address bound to the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

@end

/**
 <p>Describes a network interface attachment.</p>
 */
@interface AWSEC2NetworkInterfaceAttachment : AWSModel


/**
 <p>The timestamp indicating when the attachment initiated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable attachTime;

/**
 <p>The ID of the network interface attachment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentId;

/**
 <p>Indicates whether the network interface is deleted when the instance is terminated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

/**
 <p>The device index of the network interface attachment on the instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deviceIndex;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The AWS account ID of the owner of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceOwnerId;

/**
 <p>The attachment state.</p>
 */
@property (nonatomic, assign) AWSEC2AttachmentStatus status;

@end

/**
 <p>Describes an attachment change.</p>
 */
@interface AWSEC2NetworkInterfaceAttachmentChanges : AWSModel


/**
 <p>The ID of the network interface attachment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentId;

/**
 <p>Indicates whether the network interface is deleted when the instance is terminated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

@end

/**
 <p>Describes the private IP address of a network interface.</p>
 */
@interface AWSEC2NetworkInterfacePrivateIpAddress : AWSModel


/**
 <p>The association information for an Elastic IP address associated with the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkInterfaceAssociation * _Nullable association;

/**
 <p>Indicates whether this IP address is the primary private IP address of the network interface.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable primary;

/**
 <p>The private DNS name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateDnsName;

/**
 <p>The private IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

@end

/**
 
 */
@interface AWSEC2LatestDhcpConfiguration : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p>Describes the VPC peering connection options.</p>
 */
@interface AWSEC2PeeringConnectionOptions : AWSModel


/**
 <p>If true, enables outbound communication from an EC2-Classic instance that's linked to a local VPC via ClassicLink to instances in a peer VPC.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowEgressFromLocalClassicLinkToRemoteVpc;

/**
 <p>If true, enables outbound communication from instances in a local VPC to an EC2-Classic instance that's linked to a peer VPC via ClassicLink.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowEgressFromLocalVpcToRemoteClassicLink;

@end

/**
 <p>The VPC peering connection options.</p>
 Required parameters: [AllowEgressFromLocalClassicLinkToRemoteVpc, AllowEgressFromLocalVpcToRemoteClassicLink]
 */
@interface AWSEC2PeeringConnectionOptionsRequest : AWSModel


/**
 <p>If true, enables outbound communication from an EC2-Classic instance that's linked to a local VPC via ClassicLink to instances in a peer VPC.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowEgressFromLocalClassicLinkToRemoteVpc;

/**
 <p>If true, enables outbound communication from instances in a local VPC to an EC2-Classic instance that's linked to a peer VPC via ClassicLink.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowEgressFromLocalVpcToRemoteClassicLink;

@end

/**
 <p>Describes the placement for the instance.</p>
 */
@interface AWSEC2Placement : AWSModel


/**
 <p>The affinity setting for the instance on the Dedicated host. This parameter is not supported for the <a>ImportInstance</a> command.</p>
 */
@property (nonatomic, strong) NSString * _Nullable affinity;

/**
 <p>The Availability Zone of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The name of the placement group the instance is in (for cluster compute instances).</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The ID of the Dedicted host on which the instance resides. This parameter is not support for the <a>ImportInstance</a> command.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hostId;

/**
 <p>The tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of <code>dedicated</code> runs on single-tenant hardware. The <code>host</code> tenancy is not supported for the <a>ImportInstance</a> command.</p>
 */
@property (nonatomic, assign) AWSEC2Tenancy tenancy;

@end

/**
 <p>Describes a placement group.</p>
 */
@interface AWSEC2PlacementGroup : AWSModel


/**
 <p>The name of the placement group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The state of the placement group.</p>
 */
@property (nonatomic, assign) AWSEC2PlacementGroupState state;

/**
 <p>The placement strategy.</p>
 */
@property (nonatomic, assign) AWSEC2PlacementStrategy strategy;

@end

/**
 <p>Describes a range of ports.</p>
 */
@interface AWSEC2PortRange : AWSModel


/**
 <p>The first port in the range.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable from;

/**
 <p>The last port in the range.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable to;

@end

/**
 <p>Describes prefixes for AWS services. </p>
 */
@interface AWSEC2PrefixList : AWSModel


/**
 <p>The IP address range of the AWS service.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable cidrs;

/**
 <p>The ID of the prefix. </p>
 */
@property (nonatomic, strong) NSString * _Nullable prefixListId;

/**
 <p>The name of the prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefixListName;

@end

/**
 <p>The ID of the prefix.</p>
 */
@interface AWSEC2PrefixListId : AWSModel


/**
 <p>The ID of the prefix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefixListId;

@end

/**
 <p>Describes the price for a Reserved Instance.</p>
 */
@interface AWSEC2PriceSchedule : AWSModel


/**
 <p>The current price schedule, as determined by the term remaining for the Reserved Instance in the listing.</p><p>A specific price schedule is always in effect, but only one price schedule can be active at any time. Take, for example, a Reserved Instance listing that has five months remaining in its term. When you specify price schedules for five months and two months, this means that schedule 1, covering the first three months of the remaining term, will be active during months 5, 4, and 3. Then schedule 2, covering the last two months of the term, will be active for months 2 and 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable active;

/**
 <p>The currency for transacting the Reserved Instance resale. At this time, the only supported currency is <code>USD</code>.</p>
 */
@property (nonatomic, assign) AWSEC2CurrencyCodeValues currencyCode;

/**
 <p>The fixed price for the term.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable price;

/**
 <p>The number of months remaining in the reservation. For example, 2 is the second to the last month before the capacity reservation expires.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable term;

@end

/**
 <p>Describes the price for a Reserved Instance.</p>
 */
@interface AWSEC2PriceScheduleSpecification : AWSModel


/**
 <p>The currency for transacting the Reserved Instance resale. At this time, the only supported currency is <code>USD</code>.</p>
 */
@property (nonatomic, assign) AWSEC2CurrencyCodeValues currencyCode;

/**
 <p>The fixed price for the term.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable price;

/**
 <p>The number of months remaining in the reservation. For example, 2 is the second to the last month before the capacity reservation expires.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable term;

@end

/**
 <p>Describes a Reserved Instance offering.</p>
 */
@interface AWSEC2PricingDetail : AWSModel


/**
 <p>The number of reservations available for the price.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The price per instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable price;

@end

/**
 <p>Describes a secondary private IP address for a network interface.</p>
 Required parameters: [PrivateIpAddress]
 */
@interface AWSEC2PrivateIpAddressSpecification : AWSModel


/**
 <p>Indicates whether the private IP address is the primary private IP address. Only one IP address can be designated as primary.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable primary;

/**
 <p>The private IP addresses.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

@end

/**
 <p>Describes a product code.</p>
 */
@interface AWSEC2ProductCode : AWSModel


/**
 <p>The product code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productCodeId;

/**
 <p>The type of product code.</p>
 */
@property (nonatomic, assign) AWSEC2ProductCodeValues productCodeType;

@end

/**
 <p>Describes a virtual private gateway propagating route.</p>
 */
@interface AWSEC2PropagatingVgw : AWSModel


/**
 <p>The ID of the virtual private gateway (VGW).</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

@end

/**
 <p>Describes a request to purchase Scheduled Instances.</p>
 Required parameters: [PurchaseToken, InstanceCount]
 */
@interface AWSEC2PurchaseRequest : AWSModel


/**
 <p>The number of instances.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>The purchase token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable purchaseToken;

@end

/**
 <p>Contains the parameters for PurchaseReservedInstancesOffering.</p>
 Required parameters: [ReservedInstancesOfferingId, InstanceCount]
 */
@interface AWSEC2PurchaseReservedInstancesOfferingRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The number of Reserved Instances to purchase.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>Specified for Reserved Instance Marketplace offerings to limit the total order and ensure that the Reserved Instances are not purchased at unexpected prices.</p>
 */
@property (nonatomic, strong) AWSEC2ReservedInstanceLimitPrice * _Nullable limitPrice;

/**
 <p>The ID of the Reserved Instance offering to purchase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesOfferingId;

@end

/**
 <p>Contains the output of PurchaseReservedInstancesOffering.</p>
 */
@interface AWSEC2PurchaseReservedInstancesOfferingResult : AWSModel


/**
 <p>The IDs of the purchased Reserved Instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesId;

@end

/**
 <p>Contains the parameters for PurchaseScheduledInstances.</p>
 Required parameters: [PurchaseRequests]
 */
@interface AWSEC2PurchaseScheduledInstancesRequest : AWSRequest


/**
 <p>Unique, case-sensitive identifier that ensures the idempotency of the request. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring Idempotency</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more purchase requests.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2PurchaseRequest *> * _Nullable purchaseRequests;

@end

/**
 <p>Contains the output of PurchaseScheduledInstances.</p>
 */
@interface AWSEC2PurchaseScheduledInstancesResult : AWSModel


/**
 <p>Information about the Scheduled Instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ScheduledInstance *> * _Nullable scheduledInstanceSet;

@end

/**
 <p>Contains the parameters for RebootInstances.</p>
 Required parameters: [InstanceIds]
 */
@interface AWSEC2RebootInstancesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

@end

/**
 <p>Describes a recurring charge.</p>
 */
@interface AWSEC2RecurringCharge : AWSModel


/**
 <p>The amount of the recurring charge.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable amount;

/**
 <p>The frequency of the recurring charge.</p>
 */
@property (nonatomic, assign) AWSEC2RecurringChargeFrequency frequency;

@end

/**
 <p>Describes a region.</p>
 */
@interface AWSEC2Region : AWSModel


/**
 <p>The region service endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The name of the region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regionName;

@end

/**
 <p>Contains the parameters for RegisterImage.</p>
 Required parameters: [Name]
 */
@interface AWSEC2RegisterImageRequest : AWSRequest


/**
 <p>The architecture of the AMI.</p><p>Default: For Amazon EBS-backed AMIs, <code>i386</code>. For instance store-backed AMIs, the architecture specified in the manifest file.</p>
 */
@property (nonatomic, assign) AWSEC2ArchitectureValues architecture;

/**
 <p>One or more block device mapping entries.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2BlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>A description for your AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The full path to your AMI manifest in Amazon S3 storage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageLocation;

/**
 <p>The ID of the kernel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kernelId;

/**
 <p>A name for your AMI.</p><p>Constraints: 3-128 alphanumeric characters, parentheses (()), square brackets ([]), spaces ( ), periods (.), slashes (/), dashes (-), single quotes ('), at-signs (@), or underscores(_)</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID of the RAM disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ramdiskId;

/**
 <p>The name of the root device (for example, <code>/dev/sda1</code>, or <code>/dev/xvda</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable rootDeviceName;

/**
 <p>Set to <code>simple</code> to enable enhanced networking for the AMI and any instances that you launch from the AMI.</p><p>There is no way to disable enhanced networking at this time.</p><p>This option is supported only for HVM AMIs. Specifying this option with a PV AMI can make instances launched from the AMI unreachable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sriovNetSupport;

/**
 <p>The type of virtualization.</p><p>Default: <code>paravirtual</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualizationType;

@end

/**
 <p>Contains the output of RegisterImage.</p>
 */
@interface AWSEC2RegisterImageResult : AWSModel


/**
 <p>The ID of the newly registered AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

@end

/**
 <p>Contains the parameters for RejectVpcPeeringConnection.</p>
 Required parameters: [VpcPeeringConnectionId]
 */
@interface AWSEC2RejectVpcPeeringConnectionRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcPeeringConnectionId;

@end

/**
 <p>Contains the output of RejectVpcPeeringConnection.</p>
 */
@interface AWSEC2RejectVpcPeeringConnectionResult : AWSModel


/**
 <p>Returns <code>true</code> if the request succeeds; otherwise, it returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable returned;

@end

/**
 <p>Contains the parameters for ReleaseAddress.</p>
 */
@interface AWSEC2ReleaseAddressRequest : AWSRequest


/**
 <p>[EC2-VPC] The allocation ID. Required for EC2-VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable allocationId;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>[EC2-Classic] The Elastic IP address. Required for EC2-Classic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

@end

/**
 <p>Contains the parameters for ReleaseHosts.</p>
 Required parameters: [HostIds]
 */
@interface AWSEC2ReleaseHostsRequest : AWSRequest


/**
 <p>The IDs of the Dedicated hosts you want to release.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable hostIds;

@end

/**
 <p>Contains the output of ReleaseHosts.</p>
 */
@interface AWSEC2ReleaseHostsResult : AWSModel


/**
 <p>The IDs of the Dedicated hosts that were successfully released.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable successful;

/**
 <p>The IDs of the Dedicated hosts that could not be released, including an error message.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2UnsuccessfulItem *> * _Nullable unsuccessful;

@end

/**
 <p>Contains the parameters for ReplaceNetworkAclAssociation.</p>
 Required parameters: [AssociationId, NetworkAclId]
 */
@interface AWSEC2ReplaceNetworkAclAssociationRequest : AWSRequest


/**
 <p>The ID of the current association between the original network ACL and the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the new network ACL to associate with the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkAclId;

@end

/**
 <p>Contains the output of ReplaceNetworkAclAssociation.</p>
 */
@interface AWSEC2ReplaceNetworkAclAssociationResult : AWSModel


/**
 <p>The ID of the new association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestAssociationId;

@end

/**
 <p>Contains the parameters for ReplaceNetworkAclEntry.</p>
 Required parameters: [NetworkAclId, RuleNumber, Protocol, RuleAction, Egress, CidrBlock]
 */
@interface AWSEC2ReplaceNetworkAclEntryRequest : AWSRequest


/**
 <p>The network range to allow or deny, in CIDR notation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrBlock;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Indicates whether to replace the egress rule.</p><p>Default: If no value is specified, we replace the ingress rule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable egress;

/**
 <p>ICMP protocol: The ICMP type and code. Required if specifying 1 (ICMP) for the protocol.</p>
 */
@property (nonatomic, strong) AWSEC2IcmpTypeCode * _Nullable icmpTypeCode;

/**
 <p>The ID of the ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkAclId;

/**
 <p>TCP or UDP protocols: The range of ports the rule applies to. Required if specifying 6 (TCP) or 17 (UDP) for the protocol.</p>
 */
@property (nonatomic, strong) AWSEC2PortRange * _Nullable portRange;

/**
 <p>The IP protocol. You can specify <code>all</code> or <code>-1</code> to mean all protocols.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

/**
 <p>Indicates whether to allow or deny the traffic that matches the rule.</p>
 */
@property (nonatomic, assign) AWSEC2RuleAction ruleAction;

/**
 <p>The rule number of the entry to replace.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleNumber;

@end

/**
 <p>Contains the parameters for ReplaceRoute.</p>
 Required parameters: [RouteTableId, DestinationCidrBlock]
 */
@interface AWSEC2ReplaceRouteRequest : AWSRequest


/**
 <p>The CIDR address block used for the destination match. The value you provide must match the CIDR of an existing route in the table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCidrBlock;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of an Internet gateway or virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

/**
 <p>The ID of a NAT instance in your VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The ID of a NAT gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable natGatewayId;

/**
 <p>The ID of a network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeTableId;

/**
 <p>The ID of a VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcPeeringConnectionId;

@end

/**
 <p>Contains the parameters for ReplaceRouteTableAssociation.</p>
 Required parameters: [AssociationId, RouteTableId]
 */
@interface AWSEC2ReplaceRouteTableAssociationRequest : AWSRequest


/**
 <p>The association ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the new route table to associate with the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeTableId;

@end

/**
 <p>Contains the output of ReplaceRouteTableAssociation.</p>
 */
@interface AWSEC2ReplaceRouteTableAssociationResult : AWSModel


/**
 <p>The ID of the new association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestAssociationId;

@end

/**
 <p>Contains the parameters for ReportInstanceStatus.</p>
 Required parameters: [Instances, Status, ReasonCodes]
 */
@interface AWSEC2ReportInstanceStatusRequest : AWSRequest


/**
 <p>Descriptive text about the health state of your instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The time at which the reported instance health state ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>One or more instances.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instances;

/**
 <p>One or more reason codes that describes the health state of your instance.</p><ul><li><p><code>instance-stuck-in-state</code>: My instance is stuck in a state.</p></li><li><p><code>unresponsive</code>: My instance is unresponsive.</p></li><li><p><code>not-accepting-credentials</code>: My instance is not accepting my credentials.</p></li><li><p><code>password-not-available</code>: A password is not available for my instance.</p></li><li><p><code>performance-network</code>: My instance is experiencing performance problems which I believe are network related.</p></li><li><p><code>performance-instance-store</code>: My instance is experiencing performance problems which I believe are related to the instance stores.</p></li><li><p><code>performance-ebs-volume</code>: My instance is experiencing performance problems which I believe are related to an EBS volume.</p></li><li><p><code>performance-other</code>: My instance is experiencing performance problems.</p></li><li><p><code>other</code>: [explain using the description parameter]</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable reasonCodes;

/**
 <p>The time at which the reported instance health state began.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The status of all instances listed.</p>
 */
@property (nonatomic, assign) AWSEC2ReportStatusType status;

@end

/**
 <p>Contains the parameters for RequestSpotFleet.</p>
 Required parameters: [SpotFleetRequestConfig]
 */
@interface AWSEC2RequestSpotFleetRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The configuration for the Spot fleet request.</p>
 */
@property (nonatomic, strong) AWSEC2SpotFleetRequestConfigData * _Nullable spotFleetRequestConfig;

@end

/**
 <p>Contains the output of RequestSpotFleet.</p>
 Required parameters: [SpotFleetRequestId]
 */
@interface AWSEC2RequestSpotFleetResponse : AWSModel


/**
 <p>The ID of the Spot fleet request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotFleetRequestId;

@end

/**
 <p>Contains the parameters for RequestSpotInstances.</p>
 Required parameters: [SpotPrice]
 */
@interface AWSEC2RequestSpotInstancesRequest : AWSRequest


/**
 <p>The user-specified name for a logical grouping of bids.</p><p>When you specify an Availability Zone group in a Spot Instance request, all Spot instances in the request are launched in the same Availability Zone. Instance proximity is maintained with this parameter, but the choice of Availability Zone is not. The group applies only to bids for Spot Instances of the same instance type. Any additional Spot instance requests that are specified with the same Availability Zone group name are launched in that same Availability Zone, as long as at least one instance from the group is still active.</p><p>If there is no active instance running in the Availability Zone group that you specify for a new Spot instance request (all instances are terminated, the bid is expired, or the bid falls below current market), then Amazon EC2 launches the instance in any Availability Zone where the constraint can be met. Consequently, the subsequent set of Spot instances could be placed in a different zone from the original request, even if you specified the same Availability Zone group.</p><p>Default: Instances are launched in any available Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZoneGroup;

/**
 <p>The required duration for the Spot instances (also known as Spot blocks), in minutes. This value must be a multiple of 60 (60, 120, 180, 240, 300, or 360).</p><p>The duration period starts as soon as your Spot instance receives its instance ID. At the end of the duration period, Amazon EC2 marks the Spot instance for termination and provides a Spot instance termination notice, which gives the instance a two-minute warning before it terminates.</p><p>Note that you can't specify an Availability Zone group or a launch group if you specify a duration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable blockDurationMinutes;

/**
 <p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How to Ensure Idempotency</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The maximum number of Spot instances to launch.</p><p>Default: 1</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>The instance launch group. Launch groups are Spot instances that launch together and terminate together.</p><p>Default: Instances are launched and terminated individually</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchGroup;

/**
 <p>Describes the launch specification for an instance.</p>
 */
@property (nonatomic, strong) AWSEC2RequestSpotLaunchSpecification * _Nullable launchSpecification;

/**
 <p>The maximum hourly price (bid) for any Spot instance launched to fulfill the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotPrice;

/**
 <p>The Spot instance request type.</p><p>Default: <code>one-time</code></p>
 */
@property (nonatomic, assign) AWSEC2SpotInstanceType types;

/**
 <p>The start date of the request. If this is a one-time request, the request becomes active at this date and time and remains active until all instances launch, the request expires, or the request is canceled. If the request is persistent, the request becomes active at this date and time and remains active until it expires or is canceled.</p><p>Default: The request is effective indefinitely.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validFrom;

/**
 <p>The end date of the request. If this is a one-time request, the request remains active until all instances launch, the request is canceled, or this date is reached. If the request is persistent, it remains active until it is canceled or this date and time is reached.</p><p>Default: The request is effective indefinitely.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validUntil;

@end

/**
 <p>Contains the output of RequestSpotInstances.</p>
 */
@interface AWSEC2RequestSpotInstancesResult : AWSModel


/**
 <p>One or more Spot instance requests.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2SpotInstanceRequest *> * _Nullable spotInstanceRequests;

@end

/**
 <p>Describes the launch specification for an instance.</p>
 */
@interface AWSEC2RequestSpotLaunchSpecification : AWSModel


/**
 <p>Deprecated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressingType;

/**
 <p>One or more block device mapping entries.</p><p>Although you can specify encrypted EBS volumes in this block device mapping for your Spot Instances, these volumes are not encrypted.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2BlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>Indicates whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsOptimized;

/**
 <p>The IAM instance profile.</p>
 */
@property (nonatomic, strong) AWSEC2IamInstanceProfileSpecification * _Nullable iamInstanceProfile;

/**
 <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The instance type.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 <p>The ID of the kernel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kernelId;

/**
 <p>The name of the key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>Describes the monitoring for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2RunInstancesMonitoringEnabled * _Nullable monitoring;

/**
 <p>One or more network interfaces.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceNetworkInterfaceSpecification *> * _Nullable networkInterfaces;

/**
 <p>The placement information for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2SpotPlacement * _Nullable placement;

/**
 <p>The ID of the RAM disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ramdiskId;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>The ID of the subnet in which to launch the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The Base64-encoded MIME user data to make available to the instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userData;

@end

/**
 <p>Describes a reservation.</p>
 */
@interface AWSEC2Reservation : AWSModel


/**
 <p>[EC2-Classic only] One or more security groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2GroupIdentifier *> * _Nullable groups;

/**
 <p>One or more instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Instance *> * _Nullable instances;

/**
 <p>The ID of the AWS account that owns the reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>The ID of the requester that launched the instances on your behalf (for example, AWS Management Console or Auto Scaling).</p>
 */
@property (nonatomic, strong) NSString * _Nullable requesterId;

/**
 <p>The ID of the reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservationId;

@end

/**
 <p>Describes the limit price of a Reserved Instance offering.</p>
 */
@interface AWSEC2ReservedInstanceLimitPrice : AWSModel


/**
 <p>Used for Reserved Instance Marketplace offerings. Specifies the limit price on the total order (instanceCount * price).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable amount;

/**
 <p>The currency in which the <code>limitPrice</code> amount is specified. At this time, the only supported currency is <code>USD</code>.</p>
 */
@property (nonatomic, assign) AWSEC2CurrencyCodeValues currencyCode;

@end

/**
 <p>Describes a Reserved Instance.</p>
 */
@interface AWSEC2ReservedInstances : AWSModel


/**
 <p>The Availability Zone in which the Reserved Instance can be used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The currency of the Reserved Instance. It's specified using ISO 4217 standard currency codes. At this time, the only supported currency is <code>USD</code>.</p>
 */
@property (nonatomic, assign) AWSEC2CurrencyCodeValues currencyCode;

/**
 <p>The duration of the Reserved Instance, in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The time when the Reserved Instance expires.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable end;

/**
 <p>The purchase price of the Reserved Instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 <p>The number of reservations purchased.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>The tenancy of the instance.</p>
 */
@property (nonatomic, assign) AWSEC2Tenancy instanceTenancy;

/**
 <p>The instance type on which the Reserved Instance can be used.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 <p>The Reserved Instance offering type.</p>
 */
@property (nonatomic, assign) AWSEC2OfferingTypeValues offeringType;

/**
 <p>The Reserved Instance product platform description.</p>
 */
@property (nonatomic, assign) AWSEC2RIProductDescription productDescription;

/**
 <p>The recurring charge tag assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2RecurringCharge *> * _Nullable recurringCharges;

/**
 <p>The ID of the Reserved Instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesId;

/**
 <p>The date and time the Reserved Instance started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable start;

/**
 <p>The state of the Reserved Instance purchase.</p>
 */
@property (nonatomic, assign) AWSEC2ReservedInstanceState state;

/**
 <p>Any tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The usage price of the Reserved Instance, per hour.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 <p>Describes the configuration settings for the modified Reserved Instances.</p>
 */
@interface AWSEC2ReservedInstancesConfiguration : AWSModel


/**
 <p>The Availability Zone for the modified Reserved Instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The number of modified Reserved Instances.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>The instance type for the modified Reserved Instances.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 <p>The network platform of the modified Reserved Instances, which is either EC2-Classic or EC2-VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

@end

/**
 <p>Describes the ID of a Reserved Instance.</p>
 */
@interface AWSEC2ReservedInstancesId : AWSModel


/**
 <p>The ID of the Reserved Instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesId;

@end

/**
 <p>Describes a Reserved Instance listing.</p>
 */
@interface AWSEC2ReservedInstancesListing : AWSModel


/**
 <p>A unique, case-sensitive key supplied by the client to ensure that the request is idempotent. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring Idempotency</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The time the listing was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The number of instances in this state.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceCount *> * _Nullable instanceCounts;

/**
 <p>The price of the Reserved Instance listing.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2PriceSchedule *> * _Nullable priceSchedules;

/**
 <p>The ID of the Reserved Instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesId;

/**
 <p>The ID of the Reserved Instance listing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesListingId;

/**
 <p>The status of the Reserved Instance listing.</p>
 */
@property (nonatomic, assign) AWSEC2ListingStatus status;

/**
 <p>The reason for the current status of the Reserved Instance listing. The response can be blank.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>Any tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The last modified timestamp of the listing.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateDate;

@end

/**
 <p>Describes a Reserved Instance modification.</p>
 */
@interface AWSEC2ReservedInstancesModification : AWSModel


/**
 <p>A unique, case-sensitive key supplied by the client to ensure that the request is idempotent. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring Idempotency</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The time when the modification request was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The time for the modification to become effective.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable effectiveDate;

/**
 <p>Contains target configurations along with their corresponding new Reserved Instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ReservedInstancesModificationResult *> * _Nullable modificationResults;

/**
 <p>The IDs of one or more Reserved Instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ReservedInstancesId *> * _Nullable reservedInstancesIds;

/**
 <p>A unique ID for the Reserved Instance modification.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesModificationId;

/**
 <p>The status of the Reserved Instances modification request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The reason for the status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>The time when the modification request was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateDate;

@end

/**
 <p>Describes the modification request/s.</p>
 */
@interface AWSEC2ReservedInstancesModificationResult : AWSModel


/**
 <p>The ID for the Reserved Instances that were created as part of the modification request. This field is only available when the modification is fulfilled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesId;

/**
 <p>The target Reserved Instances configurations supplied as part of the modification request.</p>
 */
@property (nonatomic, strong) AWSEC2ReservedInstancesConfiguration * _Nullable targetConfiguration;

@end

/**
 <p>Describes a Reserved Instance offering.</p>
 */
@interface AWSEC2ReservedInstancesOffering : AWSModel


/**
 <p>The Availability Zone in which the Reserved Instance can be used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The currency of the Reserved Instance offering you are purchasing. It's specified using ISO 4217 standard currency codes. At this time, the only supported currency is <code>USD</code>.</p>
 */
@property (nonatomic, assign) AWSEC2CurrencyCodeValues currencyCode;

/**
 <p>The duration of the Reserved Instance, in seconds.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The purchase price of the Reserved Instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 <p>The tenancy of the instance.</p>
 */
@property (nonatomic, assign) AWSEC2Tenancy instanceTenancy;

/**
 <p>The instance type on which the Reserved Instance can be used.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 <p>Indicates whether the offering is available through the Reserved Instance Marketplace (resale) or AWS. If it's a Reserved Instance Marketplace offering, this is <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable marketplace;

/**
 <p>The Reserved Instance offering type.</p>
 */
@property (nonatomic, assign) AWSEC2OfferingTypeValues offeringType;

/**
 <p>The pricing details of the Reserved Instance offering.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2PricingDetail *> * _Nullable pricingDetails;

/**
 <p>The Reserved Instance product platform description.</p>
 */
@property (nonatomic, assign) AWSEC2RIProductDescription productDescription;

/**
 <p>The recurring charge tag assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2RecurringCharge *> * _Nullable recurringCharges;

/**
 <p>The ID of the Reserved Instance offering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedInstancesOfferingId;

/**
 <p>The usage price of the Reserved Instance, per hour.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 <p>Contains the parameters for ResetImageAttribute.</p>
 Required parameters: [ImageId, Attribute]
 */
@interface AWSEC2ResetImageAttributeRequest : AWSRequest


/**
 <p>The attribute to reset (currently you can only reset the launch permission attribute).</p>
 */
@property (nonatomic, assign) AWSEC2ResetImageAttributeName attribute;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

@end

/**
 <p>Contains the parameters for ResetInstanceAttribute.</p>
 Required parameters: [InstanceId, Attribute]
 */
@interface AWSEC2ResetInstanceAttributeRequest : AWSRequest


/**
 <p>The attribute to reset.</p><important><p>You can only reset the following attributes: <code>kernel</code> | <code>ramdisk</code> | <code>sourceDestCheck</code>. To change an instance attribute, use <a>ModifyInstanceAttribute</a>.</p></important>
 */
@property (nonatomic, assign) AWSEC2InstanceAttributeName attribute;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

@end

/**
 <p>Contains the parameters for ResetNetworkInterfaceAttribute.</p>
 Required parameters: [NetworkInterfaceId]
 */
@interface AWSEC2ResetNetworkInterfaceAttributeRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The source/destination checking attribute. Resets the value to <code>true</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceDestCheck;

@end

/**
 <p>Contains the parameters for ResetSnapshotAttribute.</p>
 Required parameters: [SnapshotId, Attribute]
 */
@interface AWSEC2ResetSnapshotAttributeRequest : AWSRequest


/**
 <p>The attribute to reset. Currently, only the attribute for permission to create volumes can be reset.</p>
 */
@property (nonatomic, assign) AWSEC2SnapshotAttributeName attribute;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The ID of the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

@end

/**
 <p>Contains the parameters for RestoreAddressToClassic.</p>
 Required parameters: [PublicIp]
 */
@interface AWSEC2RestoreAddressToClassicRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

@end

/**
 <p>Contains the output of RestoreAddressToClassic.</p>
 */
@interface AWSEC2RestoreAddressToClassicResult : AWSModel


/**
 <p>The Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

/**
 <p>The move status for the IP address.</p>
 */
@property (nonatomic, assign) AWSEC2Status status;

@end

/**
 <p>Contains the parameters for RevokeSecurityGroupEgress.</p>
 Required parameters: [GroupId]
 */
@interface AWSEC2RevokeSecurityGroupEgressRequest : AWSRequest


/**
 <p>The CIDR IP address range. We recommend that you specify the CIDR range in a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrIp;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The start of port range for the TCP and UDP protocols, or an ICMP type number. We recommend that you specify the port range in a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fromPort;

/**
 <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>A set of IP permissions. You can't specify a destination security group and a CIDR IP address range.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2IpPermission *> * _Nullable ipPermissions;

/**
 <p>The IP protocol name or number. We recommend that you specify the protocol in a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipProtocol;

/**
 <p>The name of a destination security group. To revoke outbound access to a destination security group, we recommend that you use a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSecurityGroupName;

/**
 <p>The AWS account number for a destination security group. To revoke outbound access to a destination security group, we recommend that you use a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSecurityGroupOwnerId;

/**
 <p>The end of port range for the TCP and UDP protocols, or an ICMP type number. We recommend that you specify the port range in a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable toPort;

@end

/**
 <p>Contains the parameters for RevokeSecurityGroupIngress.</p>
 */
@interface AWSEC2RevokeSecurityGroupIngressRequest : AWSRequest


/**
 <p>The CIDR IP address range. You can't specify this parameter when specifying a source security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrIp;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The start of port range for the TCP and UDP protocols, or an ICMP type number. For the ICMP type number, use <code>-1</code> to specify all ICMP types.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fromPort;

/**
 <p>The ID of the security group. Required for a security group in a nondefault VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>[EC2-Classic, default VPC] The name of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>A set of IP permissions. You can't specify a source security group and a CIDR IP address range.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2IpPermission *> * _Nullable ipPermissions;

/**
 <p>The IP protocol name (<code>tcp</code>, <code>udp</code>, <code>icmp</code>) or number (see <a href="http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml">Protocol Numbers</a>). Use <code>-1</code> to specify all.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipProtocol;

/**
 <p>[EC2-Classic, default VPC] The name of the source security group. You can't specify this parameter in combination with the following parameters: the CIDR IP address range, the start of the port range, the IP protocol, and the end of the port range. For EC2-VPC, the source security group must be in the same VPC. To revoke a specific rule for an IP protocol and port range, use a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSecurityGroupName;

/**
 <p>[EC2-Classic] The AWS account ID of the source security group, if the source security group is in a different account. You can't specify this parameter in combination with the following parameters: the CIDR IP address range, the IP protocol, the start of the port range, and the end of the port range. To revoke a specific rule for an IP protocol and port range, use a set of IP permissions instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceSecurityGroupOwnerId;

/**
 <p>The end of port range for the TCP and UDP protocols, or an ICMP code number. For the ICMP code number, use <code>-1</code> to specify all ICMP codes for the ICMP type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable toPort;

@end

/**
 <p>Describes a route in a route table.</p>
 */
@interface AWSEC2Route : AWSModel


/**
 <p>The CIDR block used for the destination match.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCidrBlock;

/**
 <p>The prefix of the AWS service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationPrefixListId;

/**
 <p>The ID of a gateway attached to your VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

/**
 <p>The ID of a NAT instance in your VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The AWS account ID of the owner of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceOwnerId;

/**
 <p>The ID of a NAT gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable natGatewayId;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>Describes how the route was created.</p><ul><li><p><code>CreateRouteTable</code> - The route was automatically created when the route table was created.</p></li><li><p><code>CreateRoute</code> - The route was manually added to the route table.</p></li><li><p><code>EnableVgwRoutePropagation</code> - The route was propagated by route propagation.</p></li></ul>
 */
@property (nonatomic, assign) AWSEC2RouteOrigin origin;

/**
 <p>The state of the route. The <code>blackhole</code> state indicates that the route's target isn't available (for example, the specified gateway isn't attached to the VPC, or the specified NAT instance has been terminated).</p>
 */
@property (nonatomic, assign) AWSEC2RouteState state;

/**
 <p>The ID of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcPeeringConnectionId;

@end

/**
 <p>Describes a route table.</p>
 */
@interface AWSEC2RouteTable : AWSModel


/**
 <p>The associations between the route table and one or more subnets.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2RouteTableAssociation *> * _Nullable associations;

/**
 <p>Any virtual private gateway (VGW) propagating routes.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2PropagatingVgw *> * _Nullable propagatingVgws;

/**
 <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeTableId;

/**
 <p>The routes in the route table.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Route *> * _Nullable routes;

/**
 <p>Any tags assigned to the route table.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes an association between a route table and a subnet.</p>
 */
@interface AWSEC2RouteTableAssociation : AWSModel


/**
 <p>Indicates whether this is the main route table.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable main;

/**
 <p>The ID of the association between a route table and a subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeTableAssociationId;

/**
 <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable routeTableId;

/**
 <p>The ID of the subnet. A subnet ID is not returned for an implicit association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>Describes the monitoring for the instance.</p>
 Required parameters: [Enabled]
 */
@interface AWSEC2RunInstancesMonitoringEnabled : AWSModel


/**
 <p>Indicates whether monitoring is enabled for the instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Contains the parameters for RunInstances.</p>
 Required parameters: [ImageId, MinCount, MaxCount]
 */
@interface AWSEC2RunInstancesRequest : AWSRequest


/**
 <p>Reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable additionalInfo;

/**
 <p>The block device mapping.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2BlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>Unique, case-sensitive identifier you provide to ensure the idempotency of the request. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring Idempotency</a>.</p><p>Constraints: Maximum 64 ASCII characters</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>If you set this parameter to <code>true</code>, you can't terminate the instance using the Amazon EC2 console, CLI, or API; otherwise, you can. If you set this parameter to <code>true</code> and then later want to be able to terminate the instance, you must first change the value of the <code>disableApiTermination</code> attribute to <code>false</code> using <a>ModifyInstanceAttribute</a>. Alternatively, if you set <code>InstanceInitiatedShutdownBehavior</code> to <code>terminate</code>, you can terminate the instance by running the shutdown command from the instance.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableApiTermination;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Indicates whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS-optimized instance.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsOptimized;

/**
 <p>The IAM instance profile.</p>
 */
@property (nonatomic, strong) AWSEC2IamInstanceProfileSpecification * _Nullable iamInstanceProfile;

/**
 <p>The ID of the AMI, which you can get by calling <a>DescribeImages</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>Indicates whether an instance stops or terminates when you initiate shutdown from the instance (using the operating system command for system shutdown).</p><p>Default: <code>stop</code></p>
 */
@property (nonatomic, assign) AWSEC2ShutdownBehavior instanceInitiatedShutdownBehavior;

/**
 <p>The instance type. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Default: <code>m1.small</code></p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 <p>The ID of the kernel.</p><important><p>We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedkernels.html"> PV-GRUB</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable kernelId;

/**
 <p>The name of the key pair. You can create a key pair using <a>CreateKeyPair</a> or <a>ImportKeyPair</a>.</p><important><p>If you do not specify a key pair, you can't connect to the instance unless you choose an AMI that is configured to allow users another way to log in.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>The maximum number of instances to launch. If you specify more instances than Amazon EC2 can launch in the target Availability Zone, Amazon EC2 launches the largest possible number of instances above <code>MinCount</code>.</p><p>Constraints: Between 1 and the maximum number you're allowed for the specified instance type. For more information about the default limits, and how to request an increase, see <a href="http://aws.amazon.com/ec2/faqs/#How_many_instances_can_I_run_in_Amazon_EC2">How many instances can I run in Amazon EC2</a> in the Amazon EC2 FAQ.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxCount;

/**
 <p>The minimum number of instances to launch. If you specify a minimum that is more instances than Amazon EC2 can launch in the target Availability Zone, Amazon EC2 launches no instances.</p><p>Constraints: Between 1 and the maximum number you're allowed for the specified instance type. For more information about the default limits, and how to request an increase, see <a href="http://aws.amazon.com/ec2/faqs/#How_many_instances_can_I_run_in_Amazon_EC2">How many instances can I run in Amazon EC2</a> in the Amazon EC2 General FAQ.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minCount;

/**
 <p>The monitoring for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2RunInstancesMonitoringEnabled * _Nullable monitoring;

/**
 <p>One or more network interfaces.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceNetworkInterfaceSpecification *> * _Nullable networkInterfaces;

/**
 <p>The placement for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2Placement * _Nullable placement;

/**
 <p>[EC2-VPC] The primary IP address. You must specify a value from the IP address range of the subnet.</p><p>Only one private IP address can be designated as primary. Therefore, you can't specify this parameter if <code>PrivateIpAddresses.n.Primary</code> is set to <code>true</code> and <code>PrivateIpAddresses.n.PrivateIpAddress</code> is set to an IP address. </p><p>Default: We select an IP address from the IP address range of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

/**
 <p>The ID of the RAM disk.</p><important><p>We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedkernels.html"> PV-GRUB</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable ramdiskId;

/**
 <p>One or more security group IDs. You can create a security group using <a>CreateSecurityGroup</a>.</p><p>Default: Amazon EC2 uses the default security group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>[EC2-Classic, default VPC] One or more security group names. For a nondefault VPC, you must use security group IDs instead.</p><p>Default: Amazon EC2 uses the default security group.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroups;

/**
 <p>[EC2-VPC] The ID of the subnet to launch the instance into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>Data to configure the instance, or a script to run during instance launch. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html">Running Commands on Your Linux Instance at Launch</a> (Linux) and <a href="http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-metadata.html#instancedata-add-user-data">Adding User Data</a> (Windows). For API calls, the text must be base64-encoded. For command line tools, the encoding is performed for you, and you can load the text from a file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userData;

@end

/**
 <p>Contains the parameters for RunScheduledInstances.</p>
 Required parameters: [ScheduledInstanceId, LaunchSpecification]
 */
@interface AWSEC2RunScheduledInstancesRequest : AWSRequest


/**
 <p>Unique, case-sensitive identifier that ensures the idempotency of the request. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring Idempotency</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>The number of instances.</p><p>Default: 1</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>The launch specification.</p>
 */
@property (nonatomic, strong) AWSEC2ScheduledInstancesLaunchSpecification * _Nullable launchSpecification;

/**
 <p>The Scheduled Instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledInstanceId;

@end

/**
 <p>Contains the output of RunScheduledInstances.</p>
 */
@interface AWSEC2RunScheduledInstancesResult : AWSModel


/**
 <p>The IDs of the newly launched instances.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIdSet;

@end

/**
 <p>Describes the storage parameters for S3 and S3 buckets for an instance store-backed AMI.</p>
 */
@interface AWSEC2S3Storage : AWSModel


/**
 <p>The access key ID of the owner of the bucket. Before you specify a value for your access key ID, review and follow the guidance in <a href="http://docs.aws.amazon.com/general/latest/gr/aws-access-keys-best-practices.html">Best Practices for Managing AWS Access Keys</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable AWSAccessKeyId;

/**
 <p>The bucket in which to store the AMI. You can specify a bucket that you already own or a new bucket that Amazon EC2 creates on your behalf. If you specify a bucket that belongs to someone else, Amazon EC2 returns an error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The beginning of the file name of the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>A base64-encoded Amazon S3 upload policy that gives Amazon EC2 permission to upload items into Amazon S3 on your behalf. For command line tools, base64 encoding is performed for you.</p>
 */
@property (nonatomic, strong) NSData * _Nullable uploadPolicy;

/**
 <p>The signature of the Base64 encoded JSON document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uploadPolicySignature;

@end

/**
 <p>Describes a Scheduled Instance.</p>
 */
@interface AWSEC2ScheduledInstance : AWSModel


/**
 <p>The Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The date when the Scheduled Instance was purchased.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The hourly price for a single instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hourlyPrice;

/**
 <p>The number of instances.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>The instance type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The network platform (<code>EC2-Classic</code> or <code>EC2-VPC</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkPlatform;

/**
 <p>The time for the next schedule to start.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable nextSlotStartTime;

/**
 <p>The platform (<code>Linux/UNIX</code> or <code>Windows</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The time that the previous schedule ended or will end.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable previousSlotEndTime;

/**
 <p>The schedule recurrence.</p>
 */
@property (nonatomic, strong) AWSEC2ScheduledInstanceRecurrence * _Nullable recurrence;

/**
 <p>The Scheduled Instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scheduledInstanceId;

/**
 <p>The number of hours in the schedule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable slotDurationInHours;

/**
 <p>The end date for the Scheduled Instance.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable termEndDate;

/**
 <p>The start date for the Scheduled Instance.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable termStartDate;

/**
 <p>The total number of hours for a single instance for the entire term.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalScheduledInstanceHours;

@end

/**
 <p>Describes a schedule that is available for your Scheduled Instances.</p>
 */
@interface AWSEC2ScheduledInstanceAvailability : AWSModel


/**
 <p>The Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The number of available instances.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable availableInstanceCount;

/**
 <p>The time period for the first schedule to start.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable firstSlotStartTime;

/**
 <p>The hourly price for a single instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hourlyPrice;

/**
 <p>The instance type. You can specify one of the C3, C4, M4, or R3 instance types.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The maximum term. The only possible value is 365 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxTermDurationInDays;

/**
 <p>The minimum term. The only possible value is 365 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minTermDurationInDays;

/**
 <p>The network platform (<code>EC2-Classic</code> or <code>EC2-VPC</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkPlatform;

/**
 <p>The platform (<code>Linux/UNIX</code> or <code>Windows</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The purchase token. This token expires in two hours.</p>
 */
@property (nonatomic, strong) NSString * _Nullable purchaseToken;

/**
 <p>The schedule recurrence.</p>
 */
@property (nonatomic, strong) AWSEC2ScheduledInstanceRecurrence * _Nullable recurrence;

/**
 <p>The number of hours in the schedule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable slotDurationInHours;

/**
 <p>The total number of hours for a single instance for the entire term.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalScheduledInstanceHours;

@end

/**
 <p>Describes the recurring schedule for a Scheduled Instance.</p>
 */
@interface AWSEC2ScheduledInstanceRecurrence : AWSModel


/**
 <p>The frequency (<code>Daily</code>, <code>Weekly</code>, or <code>Monthly</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable frequency;

/**
 <p>The interval quantity. The interval unit depends on the value of <code>frequency</code>. For example, every 2 weeks or every 2 months.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable interval;

/**
 <p>The days. For a monthly schedule, this is one or more days of the month (1-31). For a weekly schedule, this is one or more days of the week (1-7, where 1 is Sunday).</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable occurrenceDaySet;

/**
 <p>Indicates whether the occurrence is relative to the end of the specified week or month.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable occurrenceRelativeToEnd;

/**
 <p>The unit for <code>occurrenceDaySet</code> (<code>DayOfWeek</code> or <code>DayOfMonth</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable occurrenceUnit;

@end

/**
 <p>Describes the recurring schedule for a Scheduled Instance.</p>
 */
@interface AWSEC2ScheduledInstanceRecurrenceRequest : AWSModel


/**
 <p>The frequency (<code>Daily</code>, <code>Weekly</code>, or <code>Monthly</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable frequency;

/**
 <p>The interval quantity. The interval unit depends on the value of <code>Frequency</code>. For example, every 2 weeks or every 2 months.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable interval;

/**
 <p>The days. For a monthly schedule, this is one or more days of the month (1-31). For a weekly schedule, this is one or more days of the week (1-7, where 1 is Sunday). You can't specify this value with a daily schedule. If the occurrence is relative to the end of the month, you can specify only a single day.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable occurrenceDays;

/**
 <p>Indicates whether the occurrence is relative to the end of the specified week or month. You can't specify this value with a daily schedule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable occurrenceRelativeToEnd;

/**
 <p>The unit for <code>OccurrenceDays</code> (<code>DayOfWeek</code> or <code>DayOfMonth</code>). This value is required for a monthly schedule. You can't specify <code>DayOfWeek</code> with a weekly schedule. You can't specify this value with a daily schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable occurrenceUnit;

@end

/**
 <p>Describes a block device mapping for a Scheduled Instance.</p>
 */
@interface AWSEC2ScheduledInstancesBlockDeviceMapping : AWSModel


/**
 <p>The device name exposed to the instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>Parameters used to set up EBS volumes automatically when the instance is launched.</p>
 */
@property (nonatomic, strong) AWSEC2ScheduledInstancesEbs * _Nullable ebs;

/**
 <p>Suppresses the specified device included in the block device mapping of the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable noDevice;

/**
 <p>The virtual device name (<code>ephemeral</code>N). Instance store volumes are numbered starting from 0. An instance type with two available instance store volumes can specify mappings for <code>ephemeral0</code> and <code>ephemeral1</code>.The number of available instance store volumes depends on the instance type. After you connect to the instance, you must mount the volume.</p><p>Constraints: For M3 instances, you must specify instance store volumes in the block device mapping for the instance. When you launch an M3 instance, we ignore any instance store volumes specified in the block device mapping for the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualName;

@end

/**
 <p>Describes an EBS volume for a Scheduled Instance.</p>
 */
@interface AWSEC2ScheduledInstancesEbs : AWSModel


/**
 <p>Indicates whether the volume is deleted on instance termination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

/**
 <p>Indicates whether the volume is encrypted. You can attached encrypted volumes only to instances that support them.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The number of I/O operations per second (IOPS) that the volume supports. For io1 volumes, this represents the number of IOPS that are provisioned for the volume. For <code>gp2</code> volumes, this represents the baseline performance of the volume and the rate at which the volume accumulates I/O credits for bursting. For more information about <code>gp2</code> baseline performance, I/O credits, and bursting, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html">Amazon EBS Volume Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Constraint: Range is 100-20000 IOPS for <code>io1</code> volumes and 100-10000 IOPS for <code>gp2</code> volumes.</p><p>Condition: This parameter is required for requests to create <code>io1</code>volumes; it is not used in requests to create <code>gp2</code>, <code>st1</code>, <code>sc1</code>, or <code>standard</code> volumes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>The ID of the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>The size of the volume, in GiB.</p><p>Default: If you're creating the volume from a snapshot and don't specify a volume size, the default is the snapshot size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSize;

/**
 <p>The volume type. <code>gp2</code> for General Purpose SSD, <code>io1</code> for Provisioned IOPS SSD, Throughput Optimized HDD for <code>st1</code>, Cold HDD for <code>sc1</code>, or <code>standard</code> for Magnetic.</p><p>Default: <code>standard</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeType;

@end

/**
 <p>Describes an IAM instance profile for a Scheduled Instance.</p>
 */
@interface AWSEC2ScheduledInstancesIamInstanceProfile : AWSModel


/**
 <p>The Amazon Resource Name (ARN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Describes the launch specification for a Scheduled Instance.</p><p>If you are launching the Scheduled Instance in EC2-VPC, you must specify the ID of the subnet. You can specify the subnet using either <code>SubnetId</code> or <code>NetworkInterface</code>.</p>
 Required parameters: [ImageId]
 */
@interface AWSEC2ScheduledInstancesLaunchSpecification : AWSModel


/**
 <p>One or more block device mapping entries.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ScheduledInstancesBlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>Indicates whether the instances are optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS-optimized instance.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsOptimized;

/**
 <p>The IAM instance profile.</p>
 */
@property (nonatomic, strong) AWSEC2ScheduledInstancesIamInstanceProfile * _Nullable iamInstanceProfile;

/**
 <p>The ID of the Amazon Machine Image (AMI).</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The instance type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The ID of the kernel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kernelId;

/**
 <p>The name of the key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>Enable or disable monitoring for the instances.</p>
 */
@property (nonatomic, strong) AWSEC2ScheduledInstancesMonitoring * _Nullable monitoring;

/**
 <p>One or more network interfaces.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ScheduledInstancesNetworkInterface *> * _Nullable networkInterfaces;

/**
 <p>The placement information.</p>
 */
@property (nonatomic, strong) AWSEC2ScheduledInstancesPlacement * _Nullable placement;

/**
 <p>The ID of the RAM disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ramdiskId;

/**
 <p>The IDs of one or more security groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The ID of the subnet in which to launch the instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The base64-encoded MIME user data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userData;

@end

/**
 <p>Describes whether monitoring is enabled for a Scheduled Instance.</p>
 */
@interface AWSEC2ScheduledInstancesMonitoring : AWSModel


/**
 <p>Indicates whether monitoring is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Describes a network interface for a Scheduled Instance.</p>
 */
@interface AWSEC2ScheduledInstancesNetworkInterface : AWSModel


/**
 <p>Indicates whether to assign a public IP address to instances launched in a VPC. The public IP address can only be assigned to a network interface for eth0, and can only be assigned to a new network interface, not an existing one. You cannot specify more than one network interface in the request. If launching into a default subnet, the default value is <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable associatePublicIpAddress;

/**
 <p>Indicates whether to delete the interface when the instance is terminated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

/**
 <p>The description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The index of the device for the network interface attachment.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deviceIndex;

/**
 <p>The IDs of one or more security groups.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groups;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The IP address of the network interface within the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

/**
 <p>The private IP addresses.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2ScheduledInstancesPrivateIpAddressConfig *> * _Nullable privateIpAddressConfigs;

/**
 <p>The number of secondary private IP addresses.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable secondaryPrivateIpAddressCount;

/**
 <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

@end

/**
 <p>Describes the placement for a Scheduled Instance.</p>
 */
@interface AWSEC2ScheduledInstancesPlacement : AWSModel


/**
 <p>The Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The name of the placement group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

@end

/**
 <p>Describes a private IP address for a Scheduled Instance.</p>
 */
@interface AWSEC2ScheduledInstancesPrivateIpAddressConfig : AWSModel


/**
 <p>Indicates whether this is a primary IP address. Otherwise, this is a secondary IP address.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable primary;

/**
 <p>The IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

@end

/**
 <p>Describes a security group</p>
 */
@interface AWSEC2SecurityGroup : AWSModel


/**
 <p>A description of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The name of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>One or more inbound rules associated with the security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2IpPermission *> * _Nullable ipPermissions;

/**
 <p>[EC2-VPC] One or more outbound rules associated with the security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2IpPermission *> * _Nullable ipPermissionsEgress;

/**
 <p>The AWS account ID of the owner of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>Any tags assigned to the security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>[EC2-VPC] The ID of the VPC for the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes a VPC with a security group that references your security group.</p>
 Required parameters: [GroupId, ReferencingVpcId]
 */
@interface AWSEC2SecurityGroupReference : AWSModel


/**
 <p>The ID of your security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The ID of the VPC with the referencing security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable referencingVpcId;

/**
 <p>The ID of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcPeeringConnectionId;

@end

/**
 <p>Describes the time period for a Scheduled Instance to start its first schedule. The time period must span less than one day.</p>
 Required parameters: [EarliestTime, LatestTime]
 */
@interface AWSEC2SlotDateTimeRangeRequest : AWSModel


/**
 <p>The earliest date and time, in UTC, for the Scheduled Instance to start.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable earliestTime;

/**
 <p>The latest date and time, in UTC, for the Scheduled Instance to start. This value must be later than or equal to the earliest date and at most three months in the future.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable latestTime;

@end

/**
 <p>Describes the time period for a Scheduled Instance to start its first schedule.</p>
 */
@interface AWSEC2SlotStartTimeRangeRequest : AWSModel


/**
 <p>The earliest date and time, in UTC, for the Scheduled Instance to start.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable earliestTime;

/**
 <p>The latest date and time, in UTC, for the Scheduled Instance to start.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable latestTime;

@end

/**
 <p>Describes a snapshot.</p>
 */
@interface AWSEC2Snapshot : AWSModel


/**
 <p>The data encryption key identifier for the snapshot. This value is a unique identifier that corresponds to the data encryption key that was used to encrypt the original volume or snapshot copy. Because data encryption keys are inherited by volumes created from snapshots, and vice versa, if snapshots share the same data encryption key identifier, then they belong to the same volume/snapshot lineage. This parameter is only returned by the <a>DescribeSnapshots</a> API operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataEncryptionKeyId;

/**
 <p>The description for the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Indicates whether the snapshot is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The full ARN of the AWS Key Management Service (AWS KMS) customer master key (CMK) that was used to protect the volume encryption key for the parent volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The AWS account alias (for example, <code>amazon</code>, <code>self</code>) or AWS account ID that owns the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAlias;

/**
 <p>The AWS account ID of the EBS snapshot owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>The progress of the snapshot, as a percentage.</p>
 */
@property (nonatomic, strong) NSString * _Nullable progress;

/**
 <p>The ID of the snapshot. Each snapshot receives a unique identifier when it is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>The time stamp when the snapshot was initiated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The snapshot state.</p>
 */
@property (nonatomic, assign) AWSEC2SnapshotState state;

/**
 <p>Encrypted Amazon EBS snapshots are copied asynchronously. If a snapshot copy operation fails (for example, if the proper AWS Key Management Service (AWS KMS) permissions are not obtained) this field displays error state details to help you diagnose why the error occurred. This parameter is only returned by the <a>DescribeSnapshots</a> API operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateMessage;

/**
 <p>Any tags assigned to the snapshot.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The ID of the volume that was used to create the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

/**
 <p>The size of the volume, in GiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSize;

@end

/**
 <p>Describes the snapshot created from the imported disk.</p>
 */
@interface AWSEC2SnapshotDetail : AWSModel


/**
 <p>A description for the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The block device mapping for the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>The size of the disk in the snapshot, in GiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable diskImageSize;

/**
 <p>The format of the disk image from which the snapshot is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable format;

/**
 <p>The percentage of progress for the task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable progress;

/**
 <p>The snapshot ID of the disk being imported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>A brief status of the snapshot creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>A detailed status message for the snapshot creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>The URL used to access the disk image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

/**
 <p>The S3 bucket for the disk image.</p>
 */
@property (nonatomic, strong) AWSEC2UserBucketDetails * _Nullable userBucket;

@end

/**
 <p>The disk container object for the import snapshot request.</p>
 */
@interface AWSEC2SnapshotDiskContainer : AWSModel


/**
 <p>The description of the disk image being imported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The format of the disk image being imported.</p><p>Valid values: <code>RAW</code> | <code>VHD</code> | <code>VMDK</code> | <code>OVA</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable format;

/**
 <p>The URL to the Amazon S3-based disk image being imported. It can either be a https URL (https://..) or an Amazon S3 URL (s3://..).</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

/**
 <p>The S3 bucket for the disk image.</p>
 */
@property (nonatomic, strong) AWSEC2UserBucket * _Nullable userBucket;

@end

/**
 <p>Details about the import snapshot task.</p>
 */
@interface AWSEC2SnapshotTaskDetail : AWSModel


/**
 <p>The description of the snapshot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The size of the disk in the snapshot, in GiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable diskImageSize;

/**
 <p>The format of the disk image from which the snapshot is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable format;

/**
 <p>The percentage of completion for the import snapshot task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable progress;

/**
 <p>The snapshot ID of the disk being imported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>A brief status for the import snapshot task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>A detailed status message for the import snapshot task.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>The URL of the disk image from which the snapshot is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

/**
 <p>The S3 bucket for the disk image.</p>
 */
@property (nonatomic, strong) AWSEC2UserBucketDetails * _Nullable userBucket;

@end

/**
 <p>Describes the data feed for a Spot instance.</p>
 */
@interface AWSEC2SpotDatafeedSubscription : AWSModel


/**
 <p>The Amazon S3 bucket where the Spot instance data feed is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucket;

/**
 <p>The fault codes for the Spot instance request, if any.</p>
 */
@property (nonatomic, strong) AWSEC2SpotInstanceStateFault * _Nullable fault;

/**
 <p>The AWS account ID of the account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>The prefix that is prepended to data feed files.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

/**
 <p>The state of the Spot instance data feed subscription.</p>
 */
@property (nonatomic, assign) AWSEC2DatafeedSubscriptionState state;

@end

/**
 <p>Describes the launch specification for one or more Spot instances.</p>
 */
@interface AWSEC2SpotFleetLaunchSpecification : AWSModel


/**
 <p>Deprecated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressingType;

/**
 <p>One or more block device mapping entries.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2BlockDeviceMapping *> * _Nullable blockDeviceMappings;

/**
 <p>Indicates whether the instances are optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ebsOptimized;

/**
 <p>The IAM instance profile.</p>
 */
@property (nonatomic, strong) AWSEC2IamInstanceProfileSpecification * _Nullable iamInstanceProfile;

/**
 <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The instance type.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 <p>The ID of the kernel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kernelId;

/**
 <p>The name of the key pair.</p>
 */
@property (nonatomic, strong) NSString * _Nullable keyName;

/**
 <p>Enable or disable monitoring for the instances.</p>
 */
@property (nonatomic, strong) AWSEC2SpotFleetMonitoring * _Nullable monitoring;

/**
 <p>One or more network interfaces.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceNetworkInterfaceSpecification *> * _Nullable networkInterfaces;

/**
 <p>The placement information.</p>
 */
@property (nonatomic, strong) AWSEC2SpotPlacement * _Nullable placement;

/**
 <p>The ID of the RAM disk.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ramdiskId;

/**
 <p>One or more security groups. When requesting instances in a VPC, you must specify the IDs of the security groups. When requesting instances in EC2-Classic, you can specify the names or the IDs of the security groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2GroupIdentifier *> * _Nullable securityGroups;

/**
 <p>The bid price per unit hour for the specified instance type. If this value is not specified, the default is the Spot bid price specified for the fleet. To determine the bid price per unit hour, divide the Spot bid price by the value of <code>WeightedCapacity</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotPrice;

/**
 <p>The ID of the subnet in which to launch the instances. To specify multiple subnets, separate them using commas; for example, "subnet-a61dafcf, subnet-65ea5f08".</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The Base64-encoded MIME user data to make available to the instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userData;

/**
 <p>The number of units provided by the specified instance type. These are the same units that you chose to set the target capacity in terms (instances or a performance characteristic such as vCPUs, memory, or I/O).</p><p>If the target capacity divided by this value is not a whole number, we round the number of instances to the next whole number. If this value is not specified, the default is 1.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable weightedCapacity;

@end

/**
 <p>Describes whether monitoring is enabled.</p>
 */
@interface AWSEC2SpotFleetMonitoring : AWSModel


/**
 <p>Enables monitoring for the instance.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Describes a Spot fleet request.</p>
 Required parameters: [SpotFleetRequestId, SpotFleetRequestState, SpotFleetRequestConfig, CreateTime]
 */
@interface AWSEC2SpotFleetRequestConfig : AWSModel


/**
 <p>The creation date and time of the request.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>Information about the configuration of the Spot fleet request.</p>
 */
@property (nonatomic, strong) AWSEC2SpotFleetRequestConfigData * _Nullable spotFleetRequestConfig;

/**
 <p>The ID of the Spot fleet request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotFleetRequestId;

/**
 <p>The state of the Spot fleet request.</p>
 */
@property (nonatomic, assign) AWSEC2BatchState spotFleetRequestState;

@end

/**
 <p>Describes the configuration of a Spot fleet request.</p>
 Required parameters: [SpotPrice, TargetCapacity, IamFleetRole, LaunchSpecifications]
 */
@interface AWSEC2SpotFleetRequestConfigData : AWSModel


/**
 <p>Indicates how to allocate the target capacity across the Spot pools specified by the Spot fleet request. The default is <code>lowestPrice</code>.</p>
 */
@property (nonatomic, assign) AWSEC2AllocationStrategy allocationStrategy;

/**
 <p>A unique, case-sensitive identifier you provide to ensure idempotency of your listings. This helps avoid duplicate listings. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring Idempotency</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>Indicates whether running Spot instances should be terminated if the target capacity of the Spot fleet request is decreased below the current size of the Spot fleet.</p>
 */
@property (nonatomic, assign) AWSEC2ExcessCapacityTerminationPolicy excessCapacityTerminationPolicy;

/**
 <p>Grants the Spot fleet permission to terminate Spot instances on your behalf when you cancel its Spot fleet request using <a>CancelSpotFleetRequests</a> or when the Spot fleet request expires, if you set <code>terminateInstancesWithExpiration</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamFleetRole;

/**
 <p>Information about the launch specifications for the Spot fleet request.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2SpotFleetLaunchSpecification *> * _Nullable launchSpecifications;

/**
 <p>The bid price per unit hour.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotPrice;

/**
 <p>The number of units to request. You can choose to set the target capacity in terms of instances or a performance characteristic that is important to your application workload, such as vCPUs, memory, or I/O.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable targetCapacity;

/**
 <p>Indicates whether running Spot instances should be terminated when the Spot fleet request expires.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable terminateInstancesWithExpiration;

/**
 <p>The start date and time of the request, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z). The default is to start fulfilling the request immediately.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validFrom;

/**
 <p>The end date and time of the request, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z). At this point, no new Spot instance requests are placed or enabled to fulfill the request.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validUntil;

@end

/**
 <p>Describes a Spot instance request.</p>
 */
@interface AWSEC2SpotInstanceRequest : AWSModel


/**
 <p>If you specified a duration and your Spot instance request was fulfilled, this is the fixed hourly price in effect for the Spot instance while it runs.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actualBlockHourlyPrice;

/**
 <p>The Availability Zone group. If you specify the same Availability Zone group for all Spot instance requests, all Spot instances are launched in the same Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZoneGroup;

/**
 <p>The duration for the Spot instance, in minutes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable blockDurationMinutes;

/**
 <p>The date and time when the Spot instance request was created, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The fault codes for the Spot instance request, if any.</p>
 */
@property (nonatomic, strong) AWSEC2SpotInstanceStateFault * _Nullable fault;

/**
 <p>The instance ID, if an instance has been launched to fulfill the Spot instance request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The instance launch group. Launch groups are Spot instances that launch together and terminate together.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchGroup;

/**
 <p>Additional information for launching instances.</p>
 */
@property (nonatomic, strong) AWSEC2LaunchSpecification * _Nullable launchSpecification;

/**
 <p>The Availability Zone in which the bid is launched.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchedAvailabilityZone;

/**
 <p>The product description associated with the Spot instance.</p>
 */
@property (nonatomic, assign) AWSEC2RIProductDescription productDescription;

/**
 <p>The ID of the Spot instance request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotInstanceRequestId;

/**
 <p>The maximum hourly price (bid) for the Spot instance launched to fulfill the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotPrice;

/**
 <p>The state of the Spot instance request. Spot bid status information can help you track your Spot instance requests. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-bid-status.html">Spot Bid Status</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSEC2SpotInstanceState state;

/**
 <p>The status code and status message describing the Spot instance request.</p>
 */
@property (nonatomic, strong) AWSEC2SpotInstanceStatus * _Nullable status;

/**
 <p>Any tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The Spot instance request type.</p>
 */
@property (nonatomic, assign) AWSEC2SpotInstanceType types;

/**
 <p>The start date of the request, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z). The request becomes active at this date and time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validFrom;

/**
 <p>The end date of the request, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z). If this is a one-time request, it remains active until all instances launch, the request is canceled, or this date is reached. If the request is persistent, it remains active until it is canceled or this date is reached.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validUntil;

@end

/**
 <p>Describes a Spot instance state change.</p>
 */
@interface AWSEC2SpotInstanceStateFault : AWSModel


/**
 <p>The reason code for the Spot instance state change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The message for the Spot instance state change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Describes the status of a Spot instance request.</p>
 */
@interface AWSEC2SpotInstanceStatus : AWSModel


/**
 <p>The status code. For a list of status codes, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-bid-status.html#spot-instance-bid-status-understand">Spot Bid Status Codes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The description for the status code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The date and time of the most recent status update, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p>Describes Spot instance placement.</p>
 */
@interface AWSEC2SpotPlacement : AWSModel


/**
 <p>The Availability Zone.</p><p>[Spot fleet only] To specify multiple Availability Zones, separate them using commas; for example, "us-west-2a, us-west-2b".</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The name of the placement group (for cluster instances).</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

@end

/**
 <p>Describes the maximum hourly price (bid) for any Spot instance launched to fulfill the request.</p>
 */
@interface AWSEC2SpotPrice : AWSModel


/**
 <p>The Availability Zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The instance type.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 <p>A general description of the AMI.</p>
 */
@property (nonatomic, assign) AWSEC2RIProductDescription productDescription;

/**
 <p>The maximum price (bid) that you are willing to pay for a Spot instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable spotPrice;

/**
 <p>The date and time the request was created, in UTC format (for example, <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>HH</i>:<i>MM</i>:<i>SS</i>Z).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 <p>Describes a stale rule in a security group.</p>
 */
@interface AWSEC2StaleIpPermission : AWSModel


/**
 <p>The start of the port range for the TCP and UDP protocols, or an ICMP type number. A value of <code>-1</code> indicates all ICMP types. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fromPort;

/**
 <p>The IP protocol name (for <code>tcp</code>, <code>udp</code>, and <code>icmp</code>) or number (see <a href="http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml">Protocol Numbers)</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipProtocol;

/**
 <p>One or more IP ranges. Not applicable for stale security group rules.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ipRanges;

/**
 <p>One or more prefix list IDs for an AWS service. Not applicable for stale security group rules.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable prefixListIds;

/**
 <p>The end of the port range for the TCP and UDP protocols, or an ICMP type number. A value of <code>-1</code> indicates all ICMP types. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable toPort;

/**
 <p>One or more security group pairs. Returns the ID of the referenced security group and VPC, and the ID and status of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2UserIdGroupPair *> * _Nullable userIdGroupPairs;

@end

/**
 <p>Describes a stale security group (a security group that contains stale rules).</p>
 Required parameters: [GroupId]
 */
@interface AWSEC2StaleSecurityGroup : AWSModel


/**
 <p>The description of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The name of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>Information about the stale inbound rules in the security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2StaleIpPermission *> * _Nullable staleIpPermissions;

/**
 <p>Information about the stale outbound rules in the security group.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2StaleIpPermission *> * _Nullable staleIpPermissionsEgress;

/**
 <p>The ID of the VPC for the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains the parameters for StartInstances.</p>
 Required parameters: [InstanceIds]
 */
@interface AWSEC2StartInstancesRequest : AWSRequest


/**
 <p>Reserved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable additionalInfo;

/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

@end

/**
 <p>Contains the output of StartInstances.</p>
 */
@interface AWSEC2StartInstancesResult : AWSModel


/**
 <p>Information about one or more started instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceStateChange *> * _Nullable startingInstances;

@end

/**
 <p>Describes a state change.</p>
 */
@interface AWSEC2StateReason : AWSModel


/**
 <p>The reason code for the state change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The message for the state change.</p><ul><li><p><code>Server.SpotInstanceTermination</code>: A Spot instance was terminated due to an increase in the market price.</p></li><li><p><code>Server.InternalError</code>: An internal error occurred during instance launch, resulting in termination.</p></li><li><p><code>Server.InsufficientInstanceCapacity</code>: There was insufficient instance capacity to satisfy the launch request.</p></li><li><p><code>Client.InternalError</code>: A client error caused the instance to terminate on launch.</p></li><li><p><code>Client.InstanceInitiatedShutdown</code>: The instance was shut down using the <code>shutdown -h</code> command from the instance.</p></li><li><p><code>Client.UserInitiatedShutdown</code>: The instance was shut down using the Amazon EC2 API.</p></li><li><p><code>Client.VolumeLimitExceeded</code>: The limit on the number of EBS volumes or total storage was exceeded. Decrease usage or request an increase in your limits.</p></li><li><p><code>Client.InvalidSnapshot.NotFound</code>: The specified snapshot was not found.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Contains the parameters for StopInstances.</p>
 Required parameters: [InstanceIds]
 */
@interface AWSEC2StopInstancesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Forces the instances to stop. The instances do not have an opportunity to flush file system caches or file system metadata. If you use this option, you must perform file system check and repair procedures. This option is not recommended for Windows instances.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable force;

/**
 <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

@end

/**
 <p>Contains the output of StopInstances.</p>
 */
@interface AWSEC2StopInstancesResult : AWSModel


/**
 <p>Information about one or more stopped instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceStateChange *> * _Nullable stoppingInstances;

@end

/**
 <p>Describes the storage location for an instance store-backed AMI.</p>
 */
@interface AWSEC2Storage : AWSModel


/**
 <p>An Amazon S3 storage location.</p>
 */
@property (nonatomic, strong) AWSEC2S3Storage * _Nullable s3;

@end

/**
 <p>Describes a subnet.</p>
 */
@interface AWSEC2Subnet : AWSModel


/**
 <p>The Availability Zone of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The number of unused IP addresses in the subnet. Note that the IP addresses for any stopped instances are considered unavailable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable availableIpAddressCount;

/**
 <p>The CIDR block assigned to the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrBlock;

/**
 <p>Indicates whether this is the default subnet for the Availability Zone.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable defaultForAz;

/**
 <p>Indicates whether instances launched in this subnet receive a public IP address.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mapPublicIpOnLaunch;

/**
 <p>The current state of the subnet.</p>
 */
@property (nonatomic, assign) AWSEC2SubnetState state;

/**
 <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>Any tags assigned to the subnet.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The ID of the VPC the subnet is in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes a tag.</p>
 */
@interface AWSEC2Tag : AWSModel


/**
 <p>The key of the tag. </p><p>Constraints: Tag keys are case-sensitive and accept a maximum of 127 Unicode characters. May not begin with <code>aws:</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of the tag.</p><p>Constraints: Tag values are case-sensitive and accept a maximum of 255 Unicode characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Describes a tag.</p>
 */
@interface AWSEC2TagDescription : AWSModel


/**
 <p>The tag key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The ID of the resource. For example, <code>ami-1a2b3c4d</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The resource type.</p>
 */
@property (nonatomic, assign) AWSEC2ResourceType resourceType;

/**
 <p>The tag value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Contains the parameters for TerminateInstances.</p>
 Required parameters: [InstanceIds]
 */
@interface AWSEC2TerminateInstancesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

@end

/**
 <p>Contains the output of TerminateInstances.</p>
 */
@interface AWSEC2TerminateInstancesResult : AWSModel


/**
 <p>Information about one or more terminated instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceStateChange *> * _Nullable terminatingInstances;

@end

/**
 <p>Contains the parameters for UnassignPrivateIpAddresses.</p>
 Required parameters: [NetworkInterfaceId, PrivateIpAddresses]
 */
@interface AWSEC2UnassignPrivateIpAddressesRequest : AWSRequest


/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The secondary private IP addresses to unassign from the network interface. You can specify this option multiple times to unassign more than one IP address.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable privateIpAddresses;

@end

/**
 <p>Contains the parameters for UnmonitorInstances.</p>
 Required parameters: [InstanceIds]
 */
@interface AWSEC2UnmonitorInstancesRequest : AWSRequest


/**
 <p>Checks whether you have the required permissions for the action, without actually making the request, and provides an error response. If you have the required permissions, the error response is <code>DryRunOperation</code>. Otherwise, it is <code>UnauthorizedOperation</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable instanceIds;

@end

/**
 <p>Contains the output of UnmonitorInstances.</p>
 */
@interface AWSEC2UnmonitorInstancesResult : AWSModel


/**
 <p>Monitoring information for one or more instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2InstanceMonitoring *> * _Nullable instanceMonitorings;

@end

/**
 <p>Information about items that were not successfully processed in a batch call.</p>
 Required parameters: [Error]
 */
@interface AWSEC2UnsuccessfulItem : AWSModel


/**
 <p>Information about the error.</p>
 */
@property (nonatomic, strong) AWSEC2UnsuccessfulItemError * _Nullable error;

/**
 <p>The ID of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

@end

/**
 <p>Information about the error that occurred. For more information about errors, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/APIReference/errors-overview.html">Error Codes</a>.</p>
 Required parameters: [Code, Message]
 */
@interface AWSEC2UnsuccessfulItemError : AWSModel


/**
 <p>The error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The error message accompanying the error code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Describes the S3 bucket for the disk image.</p>
 */
@interface AWSEC2UserBucket : AWSModel


/**
 <p>The name of the S3 bucket where the disk image is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The file name of the disk image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

@end

/**
 <p>Describes the S3 bucket for the disk image.</p>
 */
@interface AWSEC2UserBucketDetails : AWSModel


/**
 <p>The S3 bucket from which the disk image was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The file name of the disk image.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

@end

/**
 <p>Describes the user data to be made available to an instance.</p>
 */
@interface AWSEC2UserData : AWSModel


/**
 <p>The Base64-encoded MIME user data for the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable data;

@end

/**
 <p>Describes a security group and AWS account ID pair. </p>
 */
@interface AWSEC2UserIdGroupPair : AWSModel


/**
 <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The name of the security group. In a request, use this parameter for a security group in EC2-Classic or a default VPC only. For a security group in a nondefault VPC, use the security group ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The status of a VPC peering connection, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable peeringStatus;

/**
 <p>The ID of an AWS account. For a referenced security group in another VPC, the account ID of the referenced security group is returned.</p><p>[EC2-Classic] Required when adding or removing rules that reference a security group in another AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

/**
 <p>The ID of the VPC for the referenced security group, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

/**
 <p>The ID of the VPC peering connection, if applicable. </p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcPeeringConnectionId;

@end

/**
 <p>Describes telemetry for a VPN tunnel.</p>
 */
@interface AWSEC2VgwTelemetry : AWSModel


/**
 <p>The number of accepted routes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable acceptedRouteCount;

/**
 <p>The date and time of the last change in status.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastStatusChange;

/**
 <p>The Internet-routable IP address of the virtual private gateway's outside interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outsideIpAddress;

/**
 <p>The status of the VPN tunnel.</p>
 */
@property (nonatomic, assign) AWSEC2TelemetryStatus status;

/**
 <p>If an error occurs, a description of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

@end

/**
 <p>Describes a volume.</p>
 */
@interface AWSEC2Volume : AWSModel


/**
 <p>Information about the volume attachments.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2VolumeAttachment *> * _Nullable attachments;

/**
 <p>The Availability Zone for the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The time stamp when volume creation was initiated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>Indicates whether the volume will be encrypted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The number of I/O operations per second (IOPS) that the volume supports. For Provisioned IOPS SSD volumes, this represents the number of IOPS that are provisioned for the volume. For General Purpose SSD volumes, this represents the baseline performance of the volume and the rate at which the volume accumulates I/O credits for bursting. For more information on General Purpose SSD baseline performance, I/O credits, and bursting, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html">Amazon EBS Volume Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Constraint: Range is 100-20000 IOPS for io1 volumes and 100-10000 IOPS for <code>gp2</code> volumes.</p><p>Condition: This parameter is required for requests to create <code>io1</code> volumes; it is not used in requests to create <code>gp2</code>, <code>st1</code>, <code>sc1</code>, or <code>standard</code> volumes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p>The full ARN of the AWS Key Management Service (AWS KMS) customer master key (CMK) that was used to protect the volume encryption key for the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The size of the volume, in GiBs.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

/**
 <p>The snapshot from which the volume was created, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snapshotId;

/**
 <p>The volume state.</p>
 */
@property (nonatomic, assign) AWSEC2VolumeState state;

/**
 <p>Any tags assigned to the volume.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

/**
 <p>The volume type. This can be <code>gp2</code> for General Purpose SSD, <code>io1</code> for Provisioned IOPS SSD, <code>st1</code> for Throughput Optimized HDD, <code>sc1</code> for Cold HDD, or <code>standard</code> for Magnetic volumes.</p>
 */
@property (nonatomic, assign) AWSEC2VolumeType volumeType;

@end

/**
 <p>Describes volume attachment details.</p>
 */
@interface AWSEC2VolumeAttachment : AWSModel


/**
 <p>The time stamp when the attachment initiated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable attachTime;

/**
 <p>Indicates whether the EBS volume is deleted on instance termination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleteOnTermination;

/**
 <p>The device name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable device;

/**
 <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The attachment state of the volume.</p>
 */
@property (nonatomic, assign) AWSEC2VolumeAttachmentState state;

/**
 <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

@end

/**
 <p>Describes an EBS volume.</p>
 Required parameters: [Size]
 */
@interface AWSEC2VolumeDetail : AWSModel


/**
 <p>The size of the volume, in GiB.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

@end

/**
 <p>Describes a volume status operation code.</p>
 */
@interface AWSEC2VolumeStatusAction : AWSModel


/**
 <p>The code identifying the operation, for example, <code>enable-volume-io</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>A description of the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the event associated with this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 <p>The event type associated with this operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventType;

@end

/**
 <p>Describes a volume status.</p>
 */
@interface AWSEC2VolumeStatusDetails : AWSModel


/**
 <p>The name of the volume status.</p>
 */
@property (nonatomic, assign) AWSEC2VolumeStatusName name;

/**
 <p>The intended status of the volume status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Describes a volume status event.</p>
 */
@interface AWSEC2VolumeStatusEvent : AWSModel


/**
 <p>A description of the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of this event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 <p>The type of this event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventType;

/**
 <p>The latest end time of the event.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable notAfter;

/**
 <p>The earliest start time of the event.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable notBefore;

@end

/**
 <p>Describes the status of a volume.</p>
 */
@interface AWSEC2VolumeStatusInfo : AWSModel


/**
 <p>The details of the volume status.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2VolumeStatusDetails *> * _Nullable details;

/**
 <p>The status of the volume.</p>
 */
@property (nonatomic, assign) AWSEC2VolumeStatusInfoStatus status;

@end

/**
 <p>Describes the volume status.</p>
 */
@interface AWSEC2VolumeStatusItem : AWSModel


/**
 <p>The details of the operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2VolumeStatusAction *> * _Nullable actions;

/**
 <p>The Availability Zone of the volume.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>A list of events associated with the volume.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2VolumeStatusEvent *> * _Nullable events;

/**
 <p>The volume ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable volumeId;

/**
 <p>The volume status.</p>
 */
@property (nonatomic, strong) AWSEC2VolumeStatusInfo * _Nullable volumeStatus;

@end

/**
 <p>Describes a VPC.</p>
 */
@interface AWSEC2Vpc : AWSModel


/**
 <p>The CIDR block for the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrBlock;

/**
 <p>The ID of the set of DHCP options you've associated with the VPC (or <code>default</code> if the default options are associated with the VPC).</p>
 */
@property (nonatomic, strong) NSString * _Nullable dhcpOptionsId;

/**
 <p>The allowed tenancy of instances launched into the VPC.</p>
 */
@property (nonatomic, assign) AWSEC2Tenancy instanceTenancy;

/**
 <p>Indicates whether the VPC is the default VPC.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefault;

/**
 <p>The current state of the VPC.</p>
 */
@property (nonatomic, assign) AWSEC2VpcState state;

/**
 <p>Any tags assigned to the VPC.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes an attachment between a virtual private gateway and a VPC.</p>
 */
@interface AWSEC2VpcAttachment : AWSModel


/**
 <p>The current state of the attachment.</p>
 */
@property (nonatomic, assign) AWSEC2AttachmentStatus state;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes whether a VPC is enabled for ClassicLink.</p>
 */
@interface AWSEC2VpcClassicLink : AWSModel


/**
 <p>Indicates whether the VPC is enabled for ClassicLink.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable classicLinkEnabled;

/**
 <p>Any tags assigned to the VPC.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes a VPC endpoint.</p>
 */
@interface AWSEC2VpcEndpoint : AWSModel


/**
 <p>The date and time the VPC endpoint was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationTimestamp;

/**
 <p>The policy document associated with the endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>One or more route tables associated with the endpoint.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable routeTableIds;

/**
 <p>The name of the AWS service to which the endpoint is associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

/**
 <p>The state of the VPC endpoint.</p>
 */
@property (nonatomic, assign) AWSEC2State state;

/**
 <p>The ID of the VPC endpoint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcEndpointId;

/**
 <p>The ID of the VPC to which the endpoint is associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes a VPC peering connection.</p>
 */
@interface AWSEC2VpcPeeringConnection : AWSModel


/**
 <p>Information about the accepter VPC. CIDR block information is not returned when creating a VPC peering connection, or when describing a VPC peering connection that's in the <code>initiating-request</code> or <code>pending-acceptance</code> state.</p>
 */
@property (nonatomic, strong) AWSEC2VpcPeeringConnectionVpcInfo * _Nullable accepterVpcInfo;

/**
 <p>The time that an unaccepted VPC peering connection will expire.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expirationTime;

/**
 <p>Information about the requester VPC.</p>
 */
@property (nonatomic, strong) AWSEC2VpcPeeringConnectionVpcInfo * _Nullable requesterVpcInfo;

/**
 <p>The status of the VPC peering connection.</p>
 */
@property (nonatomic, strong) AWSEC2VpcPeeringConnectionStateReason * _Nullable status;

/**
 <p>Any tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The ID of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcPeeringConnectionId;

@end

/**
 <p>Describes the VPC peering connection options.</p>
 */
@interface AWSEC2VpcPeeringConnectionOptionsDescription : AWSModel


/**
 <p>Indicates whether a local ClassicLink connection can communicate with the peer VPC over the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowEgressFromLocalClassicLinkToRemoteVpc;

/**
 <p>Indicates whether a local VPC can communicate with a ClassicLink connection in the peer VPC over the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowEgressFromLocalVpcToRemoteClassicLink;

@end

/**
 <p>Describes the status of a VPC peering connection.</p>
 */
@interface AWSEC2VpcPeeringConnectionStateReason : AWSModel


/**
 <p>The status of the VPC peering connection.</p>
 */
@property (nonatomic, assign) AWSEC2VpcPeeringConnectionStateReasonCode code;

/**
 <p>A message that provides more information about the status, if applicable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Describes a VPC in a VPC peering connection.</p>
 */
@interface AWSEC2VpcPeeringConnectionVpcInfo : AWSModel


/**
 <p>The CIDR block for the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidrBlock;

/**
 <p>The AWS account ID of the VPC owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 <p>Information about the VPC peering connection options for the accepter or requester VPC.</p>
 */
@property (nonatomic, strong) AWSEC2VpcPeeringConnectionOptionsDescription * _Nullable peeringOptions;

/**
 <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Describes a VPN connection.</p>
 */
@interface AWSEC2VpnConnection : AWSModel


/**
 <p>The configuration information for the VPN connection's customer gateway (in the native XML format). This element is always present in the <a>CreateVpnConnection</a> response; however, it's present in the <a>DescribeVpnConnections</a> response only if the VPN connection is in the <code>pending</code> or <code>available</code> state.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerGatewayConfiguration;

/**
 <p>The ID of the customer gateway at your end of the VPN connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerGatewayId;

/**
 <p>The VPN connection options.</p>
 */
@property (nonatomic, strong) AWSEC2VpnConnectionOptions * _Nullable options;

/**
 <p>The static routes associated with the VPN connection.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2VpnStaticRoute *> * _Nullable routes;

/**
 <p>The current state of the VPN connection.</p>
 */
@property (nonatomic, assign) AWSEC2VpnState state;

/**
 <p>Any tags assigned to the VPN connection.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The type of VPN connection.</p>
 */
@property (nonatomic, assign) AWSEC2GatewayType types;

/**
 <p>Information about the VPN tunnel.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2VgwTelemetry *> * _Nullable vgwTelemetry;

/**
 <p>The ID of the VPN connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnConnectionId;

/**
 <p>The ID of the virtual private gateway at the AWS side of the VPN connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnGatewayId;

@end

/**
 <p>Describes VPN connection options.</p>
 */
@interface AWSEC2VpnConnectionOptions : AWSModel


/**
 <p>Indicates whether the VPN connection uses static routes only. Static routes must be used for devices that don't support BGP.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable staticRoutesOnly;

@end

/**
 <p>Describes VPN connection options.</p>
 */
@interface AWSEC2VpnConnectionOptionsSpecification : AWSModel


/**
 <p>Indicates whether the VPN connection uses static routes only. Static routes must be used for devices that don't support BGP.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable staticRoutesOnly;

@end

/**
 <p>Describes a virtual private gateway.</p>
 */
@interface AWSEC2VpnGateway : AWSModel


/**
 <p>The Availability Zone where the virtual private gateway was created, if applicable. This field may be empty or not returned. </p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The current state of the virtual private gateway.</p>
 */
@property (nonatomic, assign) AWSEC2VpnState state;

/**
 <p>Any tags assigned to the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2Tag *> * _Nullable tags;

/**
 <p>The type of VPN connection the virtual private gateway supports.</p>
 */
@property (nonatomic, assign) AWSEC2GatewayType types;

/**
 <p>Any VPCs attached to the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSEC2VpcAttachment *> * _Nullable vpcAttachments;

/**
 <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpnGatewayId;

@end

/**
 <p>Describes a static route for a VPN connection.</p>
 */
@interface AWSEC2VpnStaticRoute : AWSModel


/**
 <p>The CIDR block associated with the local subnet of the customer data center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationCidrBlock;

/**
 <p>Indicates how the routes were provided.</p>
 */
@property (nonatomic, assign) AWSEC2VpnStaticRouteSource source;

/**
 <p>The current state of the static route.</p>
 */
@property (nonatomic, assign) AWSEC2VpnState state;

@end

NS_ASSUME_NONNULL_END
