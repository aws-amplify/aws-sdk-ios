/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AWSNetworking.h"
#import "AWSModel.h"

FOUNDATION_EXPORT NSString *const AWSEC2ErrorDomain;

typedef NS_ENUM(NSInteger, AWSEC2ErrorType) {
    AWSEC2ErrorUnknown,
    AWSEC2ErrorAuthFailure,
    AWSEC2ErrorSignatureDoesNotMatch,
};

typedef NS_ENUM(NSInteger, AWSEC2AccountAttributeName) {
    AWSEC2AccountAttributeNameUnknown,
    AWSEC2AccountAttributeNameSupportedPlatforms,
    AWSEC2AccountAttributeNameDefaultVPC,
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

typedef NS_ENUM(NSInteger, AWSEC2AvailabilityZoneState) {
    AWSEC2AvailabilityZoneStateUnknown,
    AWSEC2AvailabilityZoneStateAvailable,
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

typedef NS_ENUM(NSInteger, AWSEC2GatewayType) {
    AWSEC2GatewayTypeUnknown,
    AWSEC2GatewayTypeIpsec1,
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
};

typedef NS_ENUM(NSInteger, AWSEC2ImageState) {
    AWSEC2ImageStateUnknown,
    AWSEC2ImageStateAvailable,
    AWSEC2ImageStateDeregistered,
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
    AWSEC2InstanceTypeT2_micro,
    AWSEC2InstanceTypeT2_small,
    AWSEC2InstanceTypeT2_medium,
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
    AWSEC2InstanceTypeCC1_4xlarge,
    AWSEC2InstanceTypeCC2_8xlarge,
    AWSEC2InstanceTypeG2_2xlarge,
    AWSEC2InstanceTypeCG1_4xlarge,
    AWSEC2InstanceTypeR3_large,
    AWSEC2InstanceTypeR3_xlarge,
    AWSEC2InstanceTypeR3_2xlarge,
    AWSEC2InstanceTypeR3_4xlarge,
    AWSEC2InstanceTypeR3_8xlarge,
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
    AWSEC2MonitoringStateEnabled,
    AWSEC2MonitoringStatePending,
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

typedef NS_ENUM(NSInteger, AWSEC2OfferingTypeValues) {
    AWSEC2OfferingTypeValuesUnknown,
    AWSEC2OfferingTypeValuesHeavyUtilization,
    AWSEC2OfferingTypeValuesMediumUtilization,
    AWSEC2OfferingTypeValuesLightUtilization,
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

typedef NS_ENUM(NSInteger, AWSEC2StatusName) {
    AWSEC2StatusNameUnknown,
    AWSEC2StatusNameReachability,
};

typedef NS_ENUM(NSInteger, AWSEC2StatusType) {
    AWSEC2StatusTypeUnknown,
    AWSEC2StatusTypePassed,
    AWSEC2StatusTypeFailed,
    AWSEC2StatusTypeInsufficientData,
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
};

typedef NS_ENUM(NSInteger, AWSEC2VpcAttributeName) {
    AWSEC2VpcAttributeNameUnknown,
    AWSEC2VpcAttributeNameEnableDNSSupport,
    AWSEC2VpcAttributeNameEnableDNSHostnames,
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
@class AWSEC2Address;
@class AWSEC2AllocateAddressRequest;
@class AWSEC2AllocateAddressResult;
@class AWSEC2AssignPrivateIpAddressesRequest;
@class AWSEC2AssociateAddressRequest;
@class AWSEC2AssociateAddressResult;
@class AWSEC2AssociateDhcpOptionsRequest;
@class AWSEC2AssociateRouteTableRequest;
@class AWSEC2AssociateRouteTableResult;
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
@class AWSEC2CancelReservedInstancesListingRequest;
@class AWSEC2CancelReservedInstancesListingResult;
@class AWSEC2CancelSpotInstanceRequestsRequest;
@class AWSEC2CancelSpotInstanceRequestsResult;
@class AWSEC2CancelledSpotInstanceRequest;
@class AWSEC2ConfirmProductInstanceRequest;
@class AWSEC2ConfirmProductInstanceResult;
@class AWSEC2ConversionTask;
@class AWSEC2CreateCustomerGatewayRequest;
@class AWSEC2CreateCustomerGatewayResult;
@class AWSEC2CreateDhcpOptionsRequest;
@class AWSEC2CreateDhcpOptionsResult;
@class AWSEC2CreateImageRequest;
@class AWSEC2CreateImageResult;
@class AWSEC2CreateInstanceExportTaskRequest;
@class AWSEC2CreateInstanceExportTaskResult;
@class AWSEC2CreateInternetGatewayRequest;
@class AWSEC2CreateInternetGatewayResult;
@class AWSEC2CreateKeyPairRequest;
@class AWSEC2CreateNetworkAclEntryRequest;
@class AWSEC2CreateNetworkAclRequest;
@class AWSEC2CreateNetworkAclResult;
@class AWSEC2CreateNetworkInterfaceRequest;
@class AWSEC2CreateNetworkInterfaceResult;
@class AWSEC2CreatePlacementGroupRequest;
@class AWSEC2CreateReservedInstancesListingRequest;
@class AWSEC2CreateReservedInstancesListingResult;
@class AWSEC2CreateRouteRequest;
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
@class AWSEC2DeleteInternetGatewayRequest;
@class AWSEC2DeleteKeyPairRequest;
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
@class AWSEC2DescribeConversionTasksRequest;
@class AWSEC2DescribeConversionTasksResult;
@class AWSEC2DescribeCustomerGatewaysRequest;
@class AWSEC2DescribeCustomerGatewaysResult;
@class AWSEC2DescribeDhcpOptionsRequest;
@class AWSEC2DescribeDhcpOptionsResult;
@class AWSEC2DescribeExportTasksRequest;
@class AWSEC2DescribeExportTasksResult;
@class AWSEC2DescribeImageAttributeRequest;
@class AWSEC2DescribeImagesRequest;
@class AWSEC2DescribeImagesResult;
@class AWSEC2DescribeInstanceAttributeRequest;
@class AWSEC2DescribeInstanceStatusRequest;
@class AWSEC2DescribeInstanceStatusResult;
@class AWSEC2DescribeInstancesRequest;
@class AWSEC2DescribeInstancesResult;
@class AWSEC2DescribeInternetGatewaysRequest;
@class AWSEC2DescribeInternetGatewaysResult;
@class AWSEC2DescribeKeyPairsRequest;
@class AWSEC2DescribeKeyPairsResult;
@class AWSEC2DescribeNetworkAclsRequest;
@class AWSEC2DescribeNetworkAclsResult;
@class AWSEC2DescribeNetworkInterfaceAttributeRequest;
@class AWSEC2DescribeNetworkInterfaceAttributeResult;
@class AWSEC2DescribeNetworkInterfacesRequest;
@class AWSEC2DescribeNetworkInterfacesResult;
@class AWSEC2DescribePlacementGroupsRequest;
@class AWSEC2DescribePlacementGroupsResult;
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
@class AWSEC2DescribeSecurityGroupsRequest;
@class AWSEC2DescribeSecurityGroupsResult;
@class AWSEC2DescribeSnapshotAttributeRequest;
@class AWSEC2DescribeSnapshotAttributeResult;
@class AWSEC2DescribeSnapshotsRequest;
@class AWSEC2DescribeSnapshotsResult;
@class AWSEC2DescribeSpotDatafeedSubscriptionRequest;
@class AWSEC2DescribeSpotDatafeedSubscriptionResult;
@class AWSEC2DescribeSpotInstanceRequestsRequest;
@class AWSEC2DescribeSpotInstanceRequestsResult;
@class AWSEC2DescribeSpotPriceHistoryRequest;
@class AWSEC2DescribeSpotPriceHistoryResult;
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
@class AWSEC2DescribeVpcPeeringConnectionsRequest;
@class AWSEC2DescribeVpcPeeringConnectionsResult;
@class AWSEC2DescribeVpcsRequest;
@class AWSEC2DescribeVpcsResult;
@class AWSEC2DescribeVpnConnectionsRequest;
@class AWSEC2DescribeVpnConnectionsResult;
@class AWSEC2DescribeVpnGatewaysRequest;
@class AWSEC2DescribeVpnGatewaysResult;
@class AWSEC2DetachInternetGatewayRequest;
@class AWSEC2DetachNetworkInterfaceRequest;
@class AWSEC2DetachVolumeRequest;
@class AWSEC2DetachVpnGatewayRequest;
@class AWSEC2DhcpConfiguration;
@class AWSEC2DhcpOptions;
@class AWSEC2DisableVgwRoutePropagationRequest;
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
@class AWSEC2ExportTask;
@class AWSEC2ExportToS3Task;
@class AWSEC2ExportToS3TaskSpecification;
@class AWSEC2Filter;
@class AWSEC2GetConsoleOutputRequest;
@class AWSEC2GetConsoleOutputResult;
@class AWSEC2GetPasswordDataRequest;
@class AWSEC2GetPasswordDataResult;
@class AWSEC2GroupIdentifier;
@class AWSEC2IamInstanceProfile;
@class AWSEC2IamInstanceProfileSpecification;
@class AWSEC2IcmpTypeCode;
@class AWSEC2Image;
@class AWSEC2ImageAttribute;
@class AWSEC2ImportInstanceLaunchSpecification;
@class AWSEC2ImportInstanceRequest;
@class AWSEC2ImportInstanceResult;
@class AWSEC2ImportInstanceTaskDetails;
@class AWSEC2ImportInstanceVolumeDetailItem;
@class AWSEC2ImportKeyPairRequest;
@class AWSEC2ImportKeyPairResult;
@class AWSEC2ImportVolumeRequest;
@class AWSEC2ImportVolumeResult;
@class AWSEC2ImportVolumeTaskDetails;
@class AWSEC2Instance;
@class AWSEC2InstanceAttribute;
@class AWSEC2InstanceBlockDeviceMapping;
@class AWSEC2InstanceBlockDeviceMappingSpecification;
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
@class AWSEC2LatestDhcpConfiguration;
@class AWSEC2LaunchPermission;
@class AWSEC2LaunchPermissionModifications;
@class AWSEC2LaunchSpecification;
@class AWSEC2ModifyImageAttributeRequest;
@class AWSEC2ModifyInstanceAttributeRequest;
@class AWSEC2ModifyNetworkInterfaceAttributeRequest;
@class AWSEC2ModifyReservedInstancesRequest;
@class AWSEC2ModifyReservedInstancesResult;
@class AWSEC2ModifySnapshotAttributeRequest;
@class AWSEC2ModifySubnetAttributeRequest;
@class AWSEC2ModifyVolumeAttributeRequest;
@class AWSEC2ModifyVpcAttributeRequest;
@class AWSEC2MonitorInstancesRequest;
@class AWSEC2MonitorInstancesResult;
@class AWSEC2Monitoring;
@class AWSEC2NetworkAcl;
@class AWSEC2NetworkAclAssociation;
@class AWSEC2NetworkAclEntry;
@class AWSEC2NetworkInterface;
@class AWSEC2NetworkInterfaceAssociation;
@class AWSEC2NetworkInterfaceAttachment;
@class AWSEC2NetworkInterfaceAttachmentChanges;
@class AWSEC2NetworkInterfacePrivateIpAddress;
@class AWSEC2Placement;
@class AWSEC2PlacementGroup;
@class AWSEC2PortRange;
@class AWSEC2PriceSchedule;
@class AWSEC2PriceScheduleSpecification;
@class AWSEC2PricingDetail;
@class AWSEC2PrivateIpAddressSpecification;
@class AWSEC2ProductCode;
@class AWSEC2PropagatingVgw;
@class AWSEC2PurchaseReservedInstancesOfferingRequest;
@class AWSEC2PurchaseReservedInstancesOfferingResult;
@class AWSEC2RebootInstancesRequest;
@class AWSEC2RecurringCharge;
@class AWSEC2Region;
@class AWSEC2RegisterImageRequest;
@class AWSEC2RegisterImageResult;
@class AWSEC2RejectVpcPeeringConnectionRequest;
@class AWSEC2RejectVpcPeeringConnectionResult;
@class AWSEC2ReleaseAddressRequest;
@class AWSEC2ReplaceNetworkAclAssociationRequest;
@class AWSEC2ReplaceNetworkAclAssociationResult;
@class AWSEC2ReplaceNetworkAclEntryRequest;
@class AWSEC2ReplaceRouteRequest;
@class AWSEC2ReplaceRouteTableAssociationRequest;
@class AWSEC2ReplaceRouteTableAssociationResult;
@class AWSEC2ReplicateImageRequest;
@class AWSEC2ReplicateImageResult;
@class AWSEC2ReplicateSnapshotRequest;
@class AWSEC2ReplicateSnapshotResult;
@class AWSEC2ReportInstanceStatusRequest;
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
@class AWSEC2RevokeSecurityGroupEgressRequest;
@class AWSEC2RevokeSecurityGroupIngressRequest;
@class AWSEC2Route;
@class AWSEC2RouteTable;
@class AWSEC2RouteTableAssociation;
@class AWSEC2RunInstancesMonitoringEnabled;
@class AWSEC2RunInstancesRequest;
@class AWSEC2S3Storage;
@class AWSEC2SecurityGroup;
@class AWSEC2Snapshot;
@class AWSEC2SpotDatafeedSubscription;
@class AWSEC2SpotInstanceRequest;
@class AWSEC2SpotInstanceStateFault;
@class AWSEC2SpotInstanceStatus;
@class AWSEC2SpotPlacement;
@class AWSEC2SpotPrice;
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
@class AWSEC2VpcPeeringConnection;
@class AWSEC2VpcPeeringConnectionStateReason;
@class AWSEC2VpcPeeringConnectionVpcInfo;
@class AWSEC2VpnConnection;
@class AWSEC2VpnConnectionOptions;
@class AWSEC2VpnConnectionOptionsSpecification;
@class AWSEC2VpnGateway;
@class AWSEC2VpnStaticRoute;

@interface AWSEC2AcceptVpcPeeringConnectionRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString *vpcPeeringConnectionId;

@end

@interface AWSEC2AcceptVpcPeeringConnectionResult : AWSModel


/**
 * <p>Information about the VPC peering connection.</p>
 */
@property (nonatomic, strong) AWSEC2VpcPeeringConnection *vpcPeeringConnection;

@end

/**
 * <p>Describes an account attribute.</p>
 */
@interface AWSEC2AccountAttribute : AWSModel


/**
 * <p>The name of the account attribute.</p>
 */
@property (nonatomic, strong) NSString *attributeName;

/**
 * <p>One or more values for the account attribute.</p>
 */
@property (nonatomic, strong) NSArray *attributeValues;

@end

/**
 * <p>Describes a value of an account attribute.</p>
 */
@interface AWSEC2AccountAttributeValue : AWSModel


/**
 * <p>The value.</p>
 */
@property (nonatomic, strong) NSString *attributeValue;

@end

/**
 * <p>Describes an Elastic IP address.</p>
 */
@interface AWSEC2Address : AWSModel


/**
 * <p>The ID representing the allocation of the address for use with EC2-VPC.</p>
 */
@property (nonatomic, strong) NSString *allocationId;

/**
 * <p>The ID representing the association of the address with an instance in a VPC.</p>
 */
@property (nonatomic, strong) NSString *associationId;

/**
 * <p>Indicates whether this Elastic IP address is for use with instances in EC2-Classic (<code>standard</code>) or instances in a VPC (<code>vpc</code>).</p>
 */
@property (nonatomic, assign) AWSEC2DomainType domain;

/**
 * <p>The ID of the instance the address is associated with (if any).</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

/**
 * <p>The ID of the AWS account that owns the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceOwnerId;

/**
 * <p>The private IP address associated with the Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString *privateIpAddress;

/**
 * <p>The Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString *publicIp;

@end

@interface AWSEC2AllocateAddressRequest : AWSRequest


/**
 * <p>Set to <code>vpc</code> to allocate the address for use with instances in a VPC.</p><p>Default: The address is for use with instances in EC2-Classic.</p>
 */
@property (nonatomic, assign) AWSEC2DomainType domain;
@property (nonatomic, strong) NSNumber *dryRun;

@end

@interface AWSEC2AllocateAddressResult : AWSModel


/**
 * <p>[EC2-VPC] The ID that AWS assigns to represent the allocation of the Elastic IP address for use with instances in a VPC.</p>
 */
@property (nonatomic, strong) NSString *allocationId;

/**
 * <p>Indicates whether this Elastic IP address is for use with instances in EC2-Classic (<code>standard</code>) or instances in a VPC (<code>vpc</code>).</p>
 */
@property (nonatomic, assign) AWSEC2DomainType domain;

/**
 * <p>The Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString *publicIp;

@end

@interface AWSEC2AssignPrivateIpAddressesRequest : AWSRequest


/**
 * <p>Indicates whether to allow an IP address that is already assigned to another network interface or instance to be reassigned to the specified network interface.</p>
 */
@property (nonatomic, strong) NSNumber *allowReassignment;

/**
 * <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

/**
 * <p>One or more IP addresses to be assigned as a secondary private IP address to the network interface.</p><p>If you don't specify an IP address, Amazon EC2 automatically selects an IP address within the subnet range.</p>
 */
@property (nonatomic, strong) NSArray *privateIpAddresses;

/**
 * <p>The number of secondary IP addresses to assign to the network interface.</p>
 */
@property (nonatomic, strong) NSNumber *secondaryPrivateIpAddressCount;

@end

@interface AWSEC2AssociateAddressRequest : AWSRequest


/**
 * <p>[EC2-VPC] The allocation ID. This is required for EC2-VPC.</p>
 */
@property (nonatomic, strong) NSString *allocationId;

/**
 * <p>[EC2-VPC] Allows an Elastic IP address that is already associated with an instance or network interface to be re-associated with the specified instance or network interface. Otherwise, the operation fails.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber *allowReassociation;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the instance. The operation fails if you specify an instance ID unless exactly one network interface is attached.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>[EC2-VPC] The ID of the network interface. If the instance has more than one network interface, you must specify a network interface ID.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

/**
 * <p>[EC2-VPC] The primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address.</p>
 */
@property (nonatomic, strong) NSString *privateIpAddress;

/**
 * <p>The Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString *publicIp;

@end

@interface AWSEC2AssociateAddressResult : AWSModel


/**
 * <p>[EC2-VPC] The ID that represents the association of the Elastic IP address with an instance.</p>
 */
@property (nonatomic, strong) NSString *associationId;

@end

@interface AWSEC2AssociateDhcpOptionsRequest : AWSRequest


/**
 * <p>The ID of the DHCP options set, or <code>default</code> to associate no DHCP options with the VPC.</p>
 */
@property (nonatomic, strong) NSString *dhcpOptionsId;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

@interface AWSEC2AssociateRouteTableRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString *routeTableId;

/**
 * <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

@end

@interface AWSEC2AssociateRouteTableResult : AWSModel


/**
 * <p>The route table association ID (needed to disassociate the route table).</p>
 */
@property (nonatomic, strong) NSString *associationId;

@end

@interface AWSEC2AttachInternetGatewayRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the Internet gateway.</p>
 */
@property (nonatomic, strong) NSString *internetGatewayId;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

@interface AWSEC2AttachNetworkInterfaceRequest : AWSRequest


/**
 * <p>The index of the device for the network interface attachment.</p>
 */
@property (nonatomic, strong) NSNumber *deviceIndex;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

@end

@interface AWSEC2AttachNetworkInterfaceResult : AWSModel


/**
 * <p>The ID of the network interface attachment.</p>
 */
@property (nonatomic, strong) NSString *attachmentId;

@end

@interface AWSEC2AttachVolumeRequest : AWSRequest


/**
 * <p>The device name to expose to the instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>).</p>
 */
@property (nonatomic, strong) NSString *device;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The ID of the Amazon EBS volume. The volume and instance must be within the same Availability Zone.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

@end

@interface AWSEC2AttachVpnGatewayRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

/**
 * <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString *vpnGatewayId;

@end

@interface AWSEC2AttachVpnGatewayResult : AWSModel


/**
 * <p>Information about the attachment.</p>
 */
@property (nonatomic, strong) AWSEC2VpcAttachment *vpcAttachment;

@end

@interface AWSEC2AttributeBooleanValue : AWSModel

@property (nonatomic, strong) NSNumber *value;

@end

@interface AWSEC2AttributeValue : AWSModel

@property (nonatomic, strong) NSString *value;

@end

@interface AWSEC2AuthorizeSecurityGroupEgressRequest : AWSRequest


/**
 * <p>The CIDR IP address range. You can't specify this parameter when specifying a source security group.</p>
 */
@property (nonatomic, strong) NSString *cidrIp;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The start of port range for the TCP and UDP protocols, or an ICMP type number. For the ICMP type number, use <code>-1</code> to specify all ICMP types.</p>
 */
@property (nonatomic, strong) NSNumber *fromPort;

/**
 * <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString *groupId;

/**
 * <p></p>
 */
@property (nonatomic, strong) NSArray *ipPermissions;

/**
 * <p>The IP protocol name (<code>tcp</code>, <code>udp</code>, <code>icmp</code>) or number (see <a href="http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml">Protocol Numbers</a>). Use <code>-1</code> to specify all.</p>
 */
@property (nonatomic, strong) NSString *ipProtocol;

/**
 * <p>[EC2-Classic, default VPC] The name of the source security group. You can't specify a source security group and a CIDR IP address range.</p>
 */
@property (nonatomic, strong) NSString *sourceSecurityGroupName;

/**
 * <p>The ID of the source security group. You can't specify a source security group and a CIDR IP address range.</p>
 */
@property (nonatomic, strong) NSString *sourceSecurityGroupOwnerId;

/**
 * <p>The end of port range for the TCP and UDP protocols, or an ICMP code number. For the ICMP code number, use <code>-1</code> to specify all ICMP codes for the ICMP type.</p>
 */
@property (nonatomic, strong) NSNumber *toPort;

@end

@interface AWSEC2AuthorizeSecurityGroupIngressRequest : AWSRequest


/**
 * <p>The CIDR IP address range. You can't specify this parameter when specifying a source security group.</p>
 */
@property (nonatomic, strong) NSString *cidrIp;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The start of port range for the TCP and UDP protocols, or an ICMP type number. For the ICMP type number, use <code>-1</code> to specify all ICMP types.</p>
 */
@property (nonatomic, strong) NSNumber *fromPort;

/**
 * <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString *groupId;

/**
 * <p>[EC2-Classic, default VPC] The name of the security group.</p>
 */
@property (nonatomic, strong) NSString *groupName;

/**
 * <p></p>
 */
@property (nonatomic, strong) NSArray *ipPermissions;

/**
 * <p>The IP protocol name (<code>tcp</code>, <code>udp</code>, <code>icmp</code>) or number (see <a href="http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml">Protocol Numbers</a>). Use <code>-1</code> to specify all.</p>
 */
@property (nonatomic, strong) NSString *ipProtocol;

/**
 * <p>[EC2-Classic, default VPC] The name of the source security group. You can't specify a source security group and a CIDR IP address range.</p>
 */
@property (nonatomic, strong) NSString *sourceSecurityGroupName;

/**
 * <p>The ID of the source security group. You can't specify a source security group and a CIDR IP address range.</p>
 */
@property (nonatomic, strong) NSString *sourceSecurityGroupOwnerId;

/**
 * <p>The end of port range for the TCP and UDP protocols, or an ICMP code number. For the ICMP code number, use <code>-1</code> to specify all ICMP codes for the ICMP type.</p>
 */
@property (nonatomic, strong) NSNumber *toPort;

@end

/**
 * <p>Describes an Availability Zone.</p>
 */
@interface AWSEC2AvailabilityZone : AWSModel


/**
 * <p>Any messages about the Availability Zone.</p>
 */
@property (nonatomic, strong) NSArray *messages;

/**
 * <p>The name of the region.</p>
 */
@property (nonatomic, strong) NSString *regionName;

/**
 * <p>The state of the Availability Zone.</p>
 */
@property (nonatomic, assign) AWSEC2AvailabilityZoneState state;

/**
 * <p>The name of the Availability Zone.</p>
 */
@property (nonatomic, strong) NSString *zoneName;

@end

/**
 * <p>Describes a message about an Availability Zone.</p>
 */
@interface AWSEC2AvailabilityZoneMessage : AWSModel


/**
 * <p>The message about the Availability Zone.</p>
 */
@property (nonatomic, strong) NSString *message;

@end

@interface AWSEC2BlobAttributeValue : AWSModel

@property (nonatomic, strong) NSData *value;

@end

/**
 * <p>Describes a block device mapping.</p>
 */
@interface AWSEC2BlockDeviceMapping : AWSModel


/**
 * <p>The device name exposed to the instance (for example, <code>/dev/sdh</code>).</p>
 */
@property (nonatomic, strong) NSString *deviceName;

/**
 * <p>Parameters used to automatically set up Amazon EBS volumes when the instance is launched.</p>
 */
@property (nonatomic, strong) AWSEC2EbsBlockDevice *ebs;

/**
 * <p>Suppresses the specified device included in the block device mapping of the AMI.</p>
 */
@property (nonatomic, strong) NSString *noDevice;

/**
 * <p>The virtual device name.</p>
 */
@property (nonatomic, strong) NSString *virtualName;

@end

@interface AWSEC2BundleInstanceRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the instance to bundle.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The bucket in which to store the AMI. You can specify a bucket that you already own or a new bucket that Amazon EC2 creates on your behalf. If you specify a bucket that belongs to someone else, Amazon EC2 returns an error.</p>
 */
@property (nonatomic, strong) AWSEC2Storage *storage;

@end

@interface AWSEC2BundleInstanceResult : AWSModel


/**
 * <p>Information about the bundle task.</p>
 */
@property (nonatomic, strong) AWSEC2BundleTask *bundleTask;

@end

/**
 * <p>Describes a bundle task.</p>
 */
@interface AWSEC2BundleTask : AWSModel


/**
 * <p>The ID for this bundle task.</p>
 */
@property (nonatomic, strong) NSString *bundleId;

/**
 * <p>If the task fails, a description of the error.</p>
 */
@property (nonatomic, strong) AWSEC2BundleTaskError *bundleTaskError;

/**
 * <p>The ID of the instance associated with this bundle task.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The level of task completion, as a percent (for example, 20%).</p>
 */
@property (nonatomic, strong) NSString *progress;

/**
 * <p>The time this task started.</p>
 */
@property (nonatomic, strong) NSDate *startTime;

/**
 * <p>The state of the task.</p>
 */
@property (nonatomic, assign) AWSEC2BundleTaskState state;

/**
 * <p>The Amazon S3 storage locations.</p>
 */
@property (nonatomic, strong) AWSEC2Storage *storage;

/**
 * <p>The time of the most recent update for the task.</p>
 */
@property (nonatomic, strong) NSDate *updateTime;

@end

/**
 * <p>Describes an error for <a>BundleInstance</a>.</p>
 */
@interface AWSEC2BundleTaskError : AWSModel


/**
 * <p>The error code.</p>
 */
@property (nonatomic, strong) NSString *code;

/**
 * <p>The error message.</p>
 */
@property (nonatomic, strong) NSString *message;

@end

@interface AWSEC2CancelBundleTaskRequest : AWSRequest


/**
 * <p>The ID of the bundle task.</p>
 */
@property (nonatomic, strong) NSString *bundleId;
@property (nonatomic, strong) NSNumber *dryRun;

@end

@interface AWSEC2CancelBundleTaskResult : AWSModel


/**
 * <p>The bundle task.</p>
 */
@property (nonatomic, strong) AWSEC2BundleTask *bundleTask;

@end

@interface AWSEC2CancelConversionRequest : AWSRequest


/**
 * <p>The ID of the conversion task.</p>
 */
@property (nonatomic, strong) NSString *conversionTaskId;
@property (nonatomic, strong) NSNumber *dryRun;
@property (nonatomic, strong) NSString *reasonMessage;

@end

@interface AWSEC2CancelExportTaskRequest : AWSRequest


/**
 * <p>The ID of the export task. This is the ID returned by <code>CreateInstanceExportTask</code>.</p>
 */
@property (nonatomic, strong) NSString *exportTaskId;

@end

@interface AWSEC2CancelReservedInstancesListingRequest : AWSRequest


/**
 * <p>The ID of the Reserved Instance listing.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesListingId;

@end

@interface AWSEC2CancelReservedInstancesListingResult : AWSModel


/**
 * <p>The Reserved Instance listing.</p>
 */
@property (nonatomic, strong) NSArray *reservedInstancesListings;

@end

@interface AWSEC2CancelSpotInstanceRequestsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more Spot Instance request IDs.</p>
 */
@property (nonatomic, strong) NSArray *spotInstanceRequestIds;

@end

@interface AWSEC2CancelSpotInstanceRequestsResult : AWSModel


/**
 * <p>One or more Spot Instance requests.</p>
 */
@property (nonatomic, strong) NSArray *cancelledSpotInstanceRequests;

@end

/**
 * <p>Describes a request to cancel a Spot Instance.</p>
 */
@interface AWSEC2CancelledSpotInstanceRequest : AWSModel


/**
 * <p>The ID of the Spot Instance request.</p>
 */
@property (nonatomic, strong) NSString *spotInstanceRequestId;

/**
 * <p>The state of the Spot Instance request.</p>
 */
@property (nonatomic, assign) AWSEC2CancelSpotInstanceRequestState state;

@end

@interface AWSEC2ConfirmProductInstanceRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The product code. This must be an Amazon DevPay product code that you own.</p>
 */
@property (nonatomic, strong) NSString *productCode;

@end

@interface AWSEC2ConfirmProductInstanceResult : AWSModel


/**
 * <p>The AWS account ID of the instance owner. This is only present if the product code is attached to the instance.</p>
 */
@property (nonatomic, strong) NSString *ownerId;

@end

/**
 * <p>Describes a conversion task.</p>
 * Required parameters: [ConversionTaskId, State]
 */
@interface AWSEC2ConversionTask : AWSModel


/**
 * <p>The ID of the conversion task.</p>
 */
@property (nonatomic, strong) NSString *conversionTaskId;

/**
 * <p>The time when the task expires. If the upload isn't complete before the expiration time, we automatically cancel the task.</p>
 */
@property (nonatomic, strong) NSString *expirationTime;

/**
 * <p>If the task is for importing an instance, this contains information about the import instance task.</p>
 */
@property (nonatomic, strong) AWSEC2ImportInstanceTaskDetails *importInstance;

/**
 * <p>If the task is for importing a volume, this contains information about the import volume task.</p>
 */
@property (nonatomic, strong) AWSEC2ImportVolumeTaskDetails *importVolume;

/**
 * <p>The state of the conversion task.</p>
 */
@property (nonatomic, assign) AWSEC2ConversionTaskState state;

/**
 * <p>The status message related to the conversion task.</p>
 */
@property (nonatomic, strong) NSString *statusMessage;
@property (nonatomic, strong) NSArray *tags;

@end

@interface AWSEC2CreateCustomerGatewayRequest : AWSRequest


/**
 * <p>For devices that support BGP, the customer gateway's BGP ASN.</p><p>Default: 65000</p>
 */
@property (nonatomic, strong) NSNumber *bgpAsn;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The Internet-routable IP address for the customer gateway's outside interface. The address must be static.</p>
 */
@property (nonatomic, strong) NSString *publicIp;

/**
 * <p>The type of VPN connection that this customer gateway supports.</p>
 */
@property (nonatomic, assign) AWSEC2GatewayType type;

@end

@interface AWSEC2CreateCustomerGatewayResult : AWSModel


/**
 * <p>Information about the customer gateway.</p>
 */
@property (nonatomic, strong) AWSEC2CustomerGateway *customerGateway;

@end

@interface AWSEC2CreateDhcpOptionsRequest : AWSRequest


/**
 * <p>A DHCP configuration option.</p>
 */
@property (nonatomic, strong) NSArray *dhcpConfigurations;
@property (nonatomic, strong) NSNumber *dryRun;

@end

@interface AWSEC2CreateDhcpOptionsResult : AWSModel


/**
 * <p>A set of DHCP options.</p>
 */
@property (nonatomic, strong) AWSEC2DhcpOptions *dhcpOptions;

@end

@interface AWSEC2CreateImageRequest : AWSRequest


/**
 * <p>Information about one or more block device mappings.</p>
 */
@property (nonatomic, strong) NSArray *blockDeviceMappings;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>A name for the new image.</p><p>Constraints: 3-128 alphanumeric characters, parenthesis (()), periods (.), slashes (/), dashes (-), or underscores(_)</p>
 */
@property (nonatomic, strong) NSString *name;

/**
 * <p>By default, this parameter is set to <code>false</code>, which means Amazon EC2 attempts to shut down the instance cleanly before image creation and then reboots the instance. When the parameter is set to <code>true</code>, Amazon EC2 doesn't shut down the instance before creating the image. When this option is used, file system integrity on the created image can't be guaranteed.</p>
 */
@property (nonatomic, strong) NSNumber *noReboot;

@end

@interface AWSEC2CreateImageResult : AWSModel


/**
 * <p>The ID of the new AMI.</p>
 */
@property (nonatomic, strong) NSString *imageId;

@end

@interface AWSEC2CreateInstanceExportTaskRequest : AWSRequest

@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) AWSEC2ExportToS3TaskSpecification *exportToS3Task;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The target virtualization environment.</p>
 */
@property (nonatomic, assign) AWSEC2ExportEnvironment targetEnvironment;

@end

@interface AWSEC2CreateInstanceExportTaskResult : AWSModel


/**
 * <p>Describes an export task.</p>
 */
@property (nonatomic, strong) AWSEC2ExportTask *exportTask;

@end

@interface AWSEC2CreateInternetGatewayRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

@end

@interface AWSEC2CreateInternetGatewayResult : AWSModel


/**
 * <p>Information about the Internet gateway.</p>
 */
@property (nonatomic, strong) AWSEC2InternetGateway *internetGateway;

@end

@interface AWSEC2CreateKeyPairRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>A unique name for the key pair.</p>
 */
@property (nonatomic, strong) NSString *keyName;

@end

@interface AWSEC2CreateNetworkAclEntryRequest : AWSRequest


/**
 * <p>The network range to allow or deny, in CIDR notation.</p>
 */
@property (nonatomic, strong) NSString *cidrBlock;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>Indicates whether this is an egress rule (rule is applied to traffic leaving the subnet).</p>
 */
@property (nonatomic, strong) NSNumber *egress;

/**
 * <p>ICMP protocol: The ICMP type and code.</p>
 */
@property (nonatomic, strong) AWSEC2IcmpTypeCode *icmpTypeCode;

/**
 * <p>The ID of the ACL.</p>
 */
@property (nonatomic, strong) NSString *networkAclId;

/**
 * <p>TCP or UDP protocols: The range of ports the rule applies to.</p>
 */
@property (nonatomic, strong) AWSEC2PortRange *portRange;

/**
 * <p>The protocol. A value of -1 means all protocols.</p>
 */
@property (nonatomic, strong) NSString *protocol;

/**
 * <p>Indicates whether to allow or deny the traffic that matches the rule.</p>
 */
@property (nonatomic, assign) AWSEC2RuleAction ruleAction;

/**
 * <p>The rule number for the entry (for example, 100). ACL entries are processed in ascending order by rule number.</p><p>Constraints: Positive integer from 1 to 32766</p>
 */
@property (nonatomic, strong) NSNumber *ruleNumber;

@end

@interface AWSEC2CreateNetworkAclRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

@interface AWSEC2CreateNetworkAclResult : AWSModel


/**
 * <p>Information about the network ACL.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkAcl *networkAcl;

@end

@interface AWSEC2CreateNetworkInterfaceRequest : AWSRequest

@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The IDs of one or more security groups.</p>
 */
@property (nonatomic, strong) NSArray *groups;

/**
 * <p>The primary private IP address of the network interface. If you don't specify an IP address, Amazon EC2 selects one for you from the subnet range.</p>
 */
@property (nonatomic, strong) NSString *privateIpAddress;

/**
 * <p>One or more private IP addresses.</p>
 */
@property (nonatomic, strong) NSArray *privateIpAddresses;

/**
 * <p>The number of secondary private IP addresses to assign to a network interface. When you specify a number of secondary IP addresses, Amazon EC2 selects these IP addresses within the subnet range.</p><p>The number of IP addresses you can assign to a network interface varies by instance type. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI">Private IP Addresses Per ENI Per Instance Type</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber *secondaryPrivateIpAddressCount;

/**
 * <p>The ID of the subnet to associate with the network interface.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

@end

@interface AWSEC2CreateNetworkInterfaceResult : AWSModel


/**
 * <p>Information about the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkInterface *networkInterface;

@end

@interface AWSEC2CreatePlacementGroupRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>A name for the placement group.</p><p>Constraints: Up to 255 ASCII characters</p>
 */
@property (nonatomic, strong) NSString *groupName;

/**
 * <p>The placement strategy.</p>
 */
@property (nonatomic, assign) AWSEC2PlacementStrategy strategy;

@end

@interface AWSEC2CreateReservedInstancesListingRequest : AWSRequest


/**
 * <p>Unique, case-sensitive identifier you provide to ensure idempotency of your listings. This helps avoid duplicate listings. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">Ensuring Idempotency</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString *clientToken;

/**
 * <p>The number of instances that are a part of a Reserved Instance account to be listed in the Reserved Instance Marketplace. This number should be less than or equal to the instance count associated with the Reserved Instance ID specified in this call.</p>
 */
@property (nonatomic, strong) NSNumber *instanceCount;

/**
 * <p>A list specifying the price of the Reserved Instance for each month remaining in the Reserved Instance term.</p>
 */
@property (nonatomic, strong) NSArray *priceSchedules;

/**
 * <p>The ID of the active Reserved Instance.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesId;

@end

@interface AWSEC2CreateReservedInstancesListingResult : AWSModel


/**
 * <p>Information about the Reserved Instances listing.</p>
 */
@property (nonatomic, strong) NSArray *reservedInstancesListings;

@end

@interface AWSEC2CreateRouteRequest : AWSRequest


/**
 * <p>The CIDR address block used for the destination match. Routing decisions are based on the most specific match.</p>
 */
@property (nonatomic, strong) NSString *destinationCidrBlock;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of an Internet gateway attached to your VPC.</p>
 */
@property (nonatomic, strong) NSString *gatewayId;

/**
 * <p>The ID of a NAT instance in your VPC. The operation fails if you specify an instance ID unless exactly one network interface is attached.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The ID of a network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

/**
 * <p>The ID of the route table for the route.</p>
 */
@property (nonatomic, strong) NSString *routeTableId;

/**
 * <p>The ID of a VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString *vpcPeeringConnectionId;

@end

@interface AWSEC2CreateRouteTableRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

@interface AWSEC2CreateRouteTableResult : AWSModel


/**
 * <p>Information about the route table.</p>
 */
@property (nonatomic, strong) AWSEC2RouteTable *routeTable;

@end

@interface AWSEC2CreateSecurityGroupRequest : AWSRequest

@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The name of the security group.</p><p>Constraints: Up to 255 characters in length</p><p>Constraints for EC2-Classic: ASCII characters</p><p>Constraints for EC2-VPC: a-z, A-Z, 0-9, spaces, and ._-:/()#,@[]+=&amp;;{}!$*</p>
 */
@property (nonatomic, strong) NSString *groupName;

/**
 * <p>[EC2-VPC] The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

@interface AWSEC2CreateSecurityGroupResult : AWSModel


/**
 * <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString *groupId;

@end

@interface AWSEC2CreateSnapshotRequest : AWSRequest

@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the Amazon EBS volume.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

@end

@interface AWSEC2CreateSpotDatafeedSubscriptionRequest : AWSRequest


/**
 * <p>The Amazon S3 bucket in which to store the Spot Instance datafeed.</p><p>Constraints: Must be a valid bucket associated with your AWS account.</p>
 */
@property (nonatomic, strong) NSString *bucket;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>A prefix for the datafeed file names.</p>
 */
@property (nonatomic, strong) NSString *prefix;

@end

@interface AWSEC2CreateSpotDatafeedSubscriptionResult : AWSModel


/**
 * <p>The Spot Instance datafeed subscription.</p>
 */
@property (nonatomic, strong) AWSEC2SpotDatafeedSubscription *spotDatafeedSubscription;

@end

@interface AWSEC2CreateSubnetRequest : AWSRequest


/**
 * <p>The Availability Zone for the subnet.</p><p>Default: Amazon EC2 selects one for you (recommended).</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>The network range for the subnet, in CIDR notation. For example, <code>10.0.0.0/24</code>.</p>
 */
@property (nonatomic, strong) NSString *cidrBlock;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

@interface AWSEC2CreateSubnetResult : AWSModel


/**
 * <p>Information about the subnet.</p>
 */
@property (nonatomic, strong) AWSEC2Subnet *subnet;

@end

@interface AWSEC2CreateTagsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The IDs of one or more resources to tag. For example, ami-1a2b3c4d.</p>
 */
@property (nonatomic, strong) NSArray *resources;

/**
 * <p>One or more tags. The <code>value</code> parameter is required, but if you don't want the tag to have a value, specify the parameter with no value, and we set the value to an empty string. </p>
 */
@property (nonatomic, strong) NSArray *tags;

@end

@interface AWSEC2CreateVolumePermission : AWSModel


/**
 * <p>The specific group that is to be added or removed from a volume's list of create volume permissions.</p>
 */
@property (nonatomic, assign) AWSEC2PermissionGroup group;

/**
 * <p>The specific AWS account ID that is to be added or removed from a volume's list of create volume permissions.</p>
 */
@property (nonatomic, strong) NSString *userId;

@end

@interface AWSEC2CreateVolumePermissionModifications : AWSModel


/**
 * <p>Adds a specific AWS account ID or group to a volume's list of create volume permissions.</p>
 */
@property (nonatomic, strong) NSArray *add;

/**
 * <p>Removes a specific AWS account ID or group from a volume's list of create volume permissions.</p>
 */
@property (nonatomic, strong) NSArray *remove;

@end

@interface AWSEC2CreateVolumeRequest : AWSRequest


/**
 * <p>The Availability Zone in which to create the volume. Use <a>DescribeAvailabilityZones</a> to list the Availability Zones that are currently available to you.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>Specifies whether the volume should be encrypted.</p>
 */
@property (nonatomic, strong) NSNumber *encrypted;

/**
 * <p>The number of I/O operations per second (IOPS) that the volume supports. This parameter is not used with Magnetic or General Purpose (SSD) volumes, but is required when the volume type is <code>io1</code>.</p>
 */
@property (nonatomic, strong) NSNumber *iops;

/**
 * <p>The size of the volume, in GiBs.</p><p>Constraints: If the volume type is <code>io1</code>, the minimum size of the volume is 10 GiB.</p><p>Default: If you're creating the volume from a snapshot and don't specify a volume size, the default is the snapshot size.</p>
 */
@property (nonatomic, strong) NSNumber *size;

/**
 * <p>The snapshot from which to create the volume.</p>
 */
@property (nonatomic, strong) NSString *snapshotId;

/**
 * <p>The volume type. This can be <code>gp2</code> for General Purpose (SSD) volumes, <code>io1</code> for Provisioned IOPS (SSD) volumes, or <code>standard</code> for Magnetic volumes.</p><p>Default: <code>standard</code></p>
 */
@property (nonatomic, assign) AWSEC2VolumeType volumeType;

@end

@interface AWSEC2CreateVpcPeeringConnectionRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The AWS account ID of the owner of the peer VPC.</p><p>Default: Your AWS account ID</p>
 */
@property (nonatomic, strong) NSString *peerOwnerId;

/**
 * <p>The ID of the VPC with which you are creating the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString *peerVpcId;

/**
 * <p>The ID of the requester VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

@interface AWSEC2CreateVpcPeeringConnectionResult : AWSModel


/**
 * <p>Information about the VPC peering connection.</p>
 */
@property (nonatomic, strong) AWSEC2VpcPeeringConnection *vpcPeeringConnection;

@end

@interface AWSEC2CreateVpcRequest : AWSRequest


/**
 * <p>The network range for the VPC, in CIDR notation. For example, <code>10.0.0.0/16</code>.</p>
 */
@property (nonatomic, strong) NSString *cidrBlock;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The supported tenancy options for instances launched into the VPC. A value of <code>default</code> means that instances can be launched with any tenancy; a value of <code>dedicated</code> means all instances launched into the VPC are launched as dedicated tenancy instances regardless of the tenancy assigned to the instance at launch. Dedicated tenancy instances runs on single-tenant hardware.</p><p>Default: <code>default</code></p>
 */
@property (nonatomic, assign) AWSEC2Tenancy instanceTenancy;

@end

@interface AWSEC2CreateVpcResult : AWSModel


/**
 * <p>Information about the VPC.</p>
 */
@property (nonatomic, strong) AWSEC2Vpc *vpc;

@end

@interface AWSEC2CreateVpnConnectionRequest : AWSRequest


/**
 * <p>The ID of the customer gateway.</p>
 */
@property (nonatomic, strong) NSString *customerGatewayId;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>Indicates whether the VPN connection requires static routes. If you are creating a VPN connection for a device that does not support BGP, you must specify <code>true</code>.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) AWSEC2VpnConnectionOptionsSpecification *options;

/**
 * <p>The type of VPN connection.</p>
 */
@property (nonatomic, strong) NSString *type;

/**
 * <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString *vpnGatewayId;

@end

@interface AWSEC2CreateVpnConnectionResult : AWSModel


/**
 * <p>Information about the VPN connection.</p>
 */
@property (nonatomic, strong) AWSEC2VpnConnection *vpnConnection;

@end

@interface AWSEC2CreateVpnConnectionRouteRequest : AWSRequest


/**
 * <p>The CIDR block associated with the local subnet of the customer network.</p>
 */
@property (nonatomic, strong) NSString *destinationCidrBlock;

/**
 * <p>The ID of the VPN connection.</p>
 */
@property (nonatomic, strong) NSString *vpnConnectionId;

@end

@interface AWSEC2CreateVpnGatewayRequest : AWSRequest


/**
 * <p>The Availability Zone for the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The type of VPN connection this virtual private gateway supports.</p>
 */
@property (nonatomic, assign) AWSEC2GatewayType type;

@end

@interface AWSEC2CreateVpnGatewayResult : AWSModel


/**
 * <p>Information about the virtual private gateway.</p>
 */
@property (nonatomic, strong) AWSEC2VpnGateway *vpnGateway;

@end

/**
 * <p>Describes a customer gateway.</p>
 */
@interface AWSEC2CustomerGateway : AWSModel


/**
 * <p>The customer gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN).</p>
 */
@property (nonatomic, strong) NSString *bgpAsn;

/**
 * <p>The ID of the customer gateway.</p>
 */
@property (nonatomic, strong) NSString *customerGatewayId;

/**
 * <p>The Internet-routable IP address of the customer gateway's outside interface.</p>
 */
@property (nonatomic, strong) NSString *ipAddress;

/**
 * <p>The current state of the customer gateway.</p>
 */
@property (nonatomic, strong) NSString *state;

/**
 * <p>Any tags assigned to the customer gateway.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The type of VPN connection the customer gateway supports.</p>
 */
@property (nonatomic, strong) NSString *type;

@end

@interface AWSEC2DeleteCustomerGatewayRequest : AWSRequest


/**
 * <p>The ID of the customer gateway.</p>
 */
@property (nonatomic, strong) NSString *customerGatewayId;
@property (nonatomic, strong) NSNumber *dryRun;

@end

@interface AWSEC2DeleteDhcpOptionsRequest : AWSRequest


/**
 * <p>The ID of the DHCP options set.</p>
 */
@property (nonatomic, strong) NSString *dhcpOptionsId;
@property (nonatomic, strong) NSNumber *dryRun;

@end

@interface AWSEC2DeleteInternetGatewayRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the Internet gateway.</p>
 */
@property (nonatomic, strong) NSString *internetGatewayId;

@end

@interface AWSEC2DeleteKeyPairRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The name of the key pair.</p>
 */
@property (nonatomic, strong) NSString *keyName;

@end

@interface AWSEC2DeleteNetworkAclEntryRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>Indicates whether the rule is an egress rule.</p>
 */
@property (nonatomic, strong) NSNumber *egress;

/**
 * <p>The ID of the network ACL.</p>
 */
@property (nonatomic, strong) NSString *networkAclId;

/**
 * <p>The rule number of the entry to delete.</p>
 */
@property (nonatomic, strong) NSNumber *ruleNumber;

@end

@interface AWSEC2DeleteNetworkAclRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the network ACL.</p>
 */
@property (nonatomic, strong) NSString *networkAclId;

@end

@interface AWSEC2DeleteNetworkInterfaceRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

@end

@interface AWSEC2DeletePlacementGroupRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The name of the placement group.</p>
 */
@property (nonatomic, strong) NSString *groupName;

@end

@interface AWSEC2DeleteRouteRequest : AWSRequest


/**
 * <p>The CIDR range for the route. The value you specify must match the CIDR for the route exactly.</p>
 */
@property (nonatomic, strong) NSString *destinationCidrBlock;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString *routeTableId;

@end

@interface AWSEC2DeleteRouteTableRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString *routeTableId;

@end

@interface AWSEC2DeleteSecurityGroupRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString *groupId;

/**
 * <p>[EC2-Classic, default VPC] The name of the security group.</p>
 */
@property (nonatomic, strong) NSString *groupName;

@end

@interface AWSEC2DeleteSnapshotRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the Amazon EBS snapshot.</p>
 */
@property (nonatomic, strong) NSString *snapshotId;

@end

@interface AWSEC2DeleteSpotDatafeedSubscriptionRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

@end

@interface AWSEC2DeleteSubnetRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

@end

@interface AWSEC2DeleteTagsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the resource. For example, ami-1a2b3c4d. You can specify more than one resource ID.</p>
 */
@property (nonatomic, strong) NSArray *resources;

/**
 * <p>One or more tags to delete. If you omit the <code>value</code> parameter, we delete the tag regardless of its value. If you specify this parameter with an empty string as the value, we delete the key only if its value is an empty string.</p>
 */
@property (nonatomic, strong) NSArray *tags;

@end

@interface AWSEC2DeleteVolumeRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

@end

@interface AWSEC2DeleteVpcPeeringConnectionRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString *vpcPeeringConnectionId;

@end

@interface AWSEC2DeleteVpcPeeringConnectionResult : AWSModel

@property (nonatomic, strong) NSNumber *returned;

@end

@interface AWSEC2DeleteVpcRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

@interface AWSEC2DeleteVpnConnectionRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the VPN connection.</p>
 */
@property (nonatomic, strong) NSString *vpnConnectionId;

@end

@interface AWSEC2DeleteVpnConnectionRouteRequest : AWSRequest


/**
 * <p>The CIDR block associated with the local subnet of the customer network.</p>
 */
@property (nonatomic, strong) NSString *destinationCidrBlock;

/**
 * <p>The ID of the VPN connection.</p>
 */
@property (nonatomic, strong) NSString *vpnConnectionId;

@end

@interface AWSEC2DeleteVpnGatewayRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString *vpnGatewayId;

@end

@interface AWSEC2DeregisterImageRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString *imageId;

@end

@interface AWSEC2DescribeAccountAttributesRequest : AWSRequest


/**
 * <p>One or more account attribute names.</p>
 */
@property (nonatomic, strong) NSArray *attributeNames;
@property (nonatomic, strong) NSNumber *dryRun;

@end

@interface AWSEC2DescribeAccountAttributesResult : AWSModel


/**
 * <p>Information about one or more account attributes.</p>
 */
@property (nonatomic, strong) NSArray *accountAttributes;

@end

@interface AWSEC2DescribeAddressesRequest : AWSRequest


/**
 * <p>[EC2-VPC] One or more allocation IDs.</p><p>Default: Describes all your Elastic IP addresses.</p>
 */
@property (nonatomic, strong) NSArray *allocationIds;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>allocation-id</code> - [EC2-VPC] The allocation ID for the address.</p></li><li><p><code>association-id</code> - [EC2-VPC] The association ID for the address.</p></li><li><p><code>domain</code> - Indicates whether the address is for use in EC2-Classic (<code>standard</code>) or in a VPC (<code>vpc</code>).</p></li><li><p><code>instance-id</code> - The ID of the instance the address is associated with, if any.</p></li><li><p><code>network-interface-id</code> - [EC2-VPC] The ID of the network interface that the address is associated with, if any.</p></li><li><p><code>network-interface-owner-id</code> - The AWS account ID of the owner.</p></li><li><p><code>private-ip-address</code> - [EC2-VPC] The private IP address associated with the Elastic IP address.</p></li><li><p><code>public-ip</code> - The Elastic IP address.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>[EC2-Classic] One or more Elastic IP addresses.</p><p>Default: Describes all your Elastic IP addresses.</p>
 */
@property (nonatomic, strong) NSArray *publicIps;

@end

@interface AWSEC2DescribeAddressesResult : AWSModel


/**
 * <p>Information about one or more Elastic IP addresses.</p>
 */
@property (nonatomic, strong) NSArray *addresses;

@end

@interface AWSEC2DescribeAvailabilityZonesRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>message</code> - Information about the Availability Zone.</p></li><li><p><code>region-name</code> - The name of the region for the Availability Zone (for example, <code>us-east-1</code>).</p></li><li><p><code>state</code> - The state of the Availability Zone (<code>available</code> | <code>impaired</code> | <code>unavailable</code>).</p></li><li><p><code>zone-name</code> - The name of the Availability Zone (for example, <code>us-east-1a</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>The names of one or more Availability Zones.</p>
 */
@property (nonatomic, strong) NSArray *zoneNames;

@end

@interface AWSEC2DescribeAvailabilityZonesResult : AWSModel


/**
 * <p>Information about one or more Availability Zones.</p>
 */
@property (nonatomic, strong) NSArray *availabilityZones;

@end

@interface AWSEC2DescribeBundleTasksRequest : AWSRequest


/**
 * <p>One or more bundle task IDs.</p><p>Default: Describes all your bundle tasks.</p>
 */
@property (nonatomic, strong) NSArray *bundleIds;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>bundle-id</code> - The ID of the bundle task.</p></li><li><p><code>error-code</code> - If the task failed, the error code returned.</p></li><li><p><code>error-message</code> - If the task failed, the error message returned.</p></li><li><p><code>instance-id</code> - The ID of the instance.</p></li><li><p><code>progress</code> - The level of task completion, as a percentage (for example, 20%).</p></li><li><p><code>s3-bucket</code> - The Amazon S3 bucket to store the AMI.</p></li><li><p><code>s3-prefix</code> - The beginning of the AMI name.</p></li><li><p><code>start-time</code> - The time the task started (for example, 2013-09-15T17:15:20.000Z).</p></li><li><p><code>state</code> - The state of the task (<code>pending</code> | <code>waiting-for-shutdown</code> | <code>bundling</code> | <code>storing</code> | <code>cancelling</code> | <code>complete</code> | <code>failed</code>).</p></li><li><p><code>update-time</code> - The time of the most recent update for the task.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

@end

@interface AWSEC2DescribeBundleTasksResult : AWSModel


/**
 * <p>Information about one or more bundle tasks.</p>
 */
@property (nonatomic, strong) NSArray *bundleTasks;

@end

@interface AWSEC2DescribeConversionTasksRequest : AWSRequest


/**
 * <p>One or more conversion task IDs.</p>
 */
@property (nonatomic, strong) NSArray *conversionTaskIds;
@property (nonatomic, strong) NSNumber *dryRun;
@property (nonatomic, strong) NSArray *filters;

@end

@interface AWSEC2DescribeConversionTasksResult : AWSModel

@property (nonatomic, strong) NSArray *conversionTasks;

@end

@interface AWSEC2DescribeCustomerGatewaysRequest : AWSRequest


/**
 * <p>One or more customer gateway IDs.</p><p>Default: Describes all your customer gateways.</p>
 */
@property (nonatomic, strong) NSArray *customerGatewayIds;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>bgp-asn</code> - The customer gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN).</p></li><li><p><code>customer-gateway-id</code> - The ID of the customer gateway.</p></li><li><p><code>ip-address</code> - The IP address of the customer gateway's Internet-routable external interface.</p></li><li><p><code>state</code> - The state of the customer gateway (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p></li><li><p><code>type</code> - The type of customer gateway. Currently, the only supported type is <code>ipsec.1</code>.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

@end

@interface AWSEC2DescribeCustomerGatewaysResult : AWSModel


/**
 * <p>Information about one or more customer gateways.</p>
 */
@property (nonatomic, strong) NSArray *customerGateways;

@end

@interface AWSEC2DescribeDhcpOptionsRequest : AWSRequest


/**
 * <p>The IDs of one or more DHCP options sets.</p><p>Default: Describes all your DHCP options sets.</p>
 */
@property (nonatomic, strong) NSArray *dhcpOptionsIds;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>dhcp-options-id</code> - The ID of a set of DHCP options.</p></li><li><p><code>key</code> - The key for one of the options (for example, <code>domain-name</code>).</p></li><li><p><code>value</code> - The value for one of the options.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

@end

@interface AWSEC2DescribeDhcpOptionsResult : AWSModel


/**
 * <p>Information about one or more DHCP options sets.</p>
 */
@property (nonatomic, strong) NSArray *dhcpOptions;

@end

@interface AWSEC2DescribeExportTasksRequest : AWSRequest


/**
 * <p>One or more export task IDs.</p>
 */
@property (nonatomic, strong) NSArray *exportTaskIds;

@end

@interface AWSEC2DescribeExportTasksResult : AWSModel

@property (nonatomic, strong) NSArray *exportTasks;

@end

@interface AWSEC2DescribeImageAttributeRequest : AWSRequest


/**
 * <p>The AMI attribute.</p>
 */
@property (nonatomic, assign) AWSEC2ImageAttributeName attribute;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString *imageId;

@end

@interface AWSEC2DescribeImagesRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>Scopes the images by users with explicit launch permissions. Specify an AWS account ID, <code>self</code> (the sender of the request), or <code>all</code> (public AMIs).</p>
 */
@property (nonatomic, strong) NSArray *executableUsers;

/**
 * <p>One or more filters.</p><ul><li><p><code>architecture</code> - The image architecture (<code>i386</code> | <code>x86_64</code>).</p></li><li><p><code>block-device-mapping.delete-on-termination</code> - A Boolean value that indicates whether the Amazon EBS volume is deleted on instance termination.</p></li><li><p><code>block-device-mapping.device-name</code> - The device name for the Amazon EBS volume (for example, <code>/dev/sdh</code>).</p></li><li><p><code>block-device-mapping.snapshot-id</code> - The ID of the snapshot used for the Amazon EBS volume.</p></li><li><p><code>block-device-mapping.volume-size</code> - The volume size of the Amazon EBS volume, in GiB.</p></li><li><p><code>block-device-mapping.volume-type</code> - The volume type of the Amazon EBS volume (<code>gp2</code> | <code>standard</code> | <code>io1</code>).</p></li><li><p><code>description</code> - The description of the image (provided during image creation).</p></li><li><p><code>hypervisor</code> - The hypervisor type (<code>ovm</code> | <code>xen</code>).</p></li><li><p><code>image-id</code> - The ID of the image.</p></li><li><p><code>image-type</code> - The image type (<code>machine</code> | <code>kernel</code> | <code>ramdisk</code>).</p></li><li><p><code>is-public</code> - A Boolean that indicates whether the image is public.</p></li><li><p><code>kernel-id</code> - The kernel ID.</p></li><li><p><code>manifest-location</code> - The location of the image manifest.</p></li><li><p><code>name</code> - The name of the AMI (provided during image creation).</p></li><li><p><code>owner-alias</code> - The AWS account alias (for example, <code>amazon</code>).</p></li><li><p><code>owner-id</code> - The AWS account ID of the image owner.</p></li><li><p><code>platform</code> - The platform. To only list Windows-based AMIs, use <code>windows</code>.</p></li><li><p><code>product-code</code> - The product code.</p></li><li><p><code>product-code.type</code> - The type of the product code (<code>devpay</code> | <code>marketplace</code>).</p></li><li><p><code>ramdisk-id</code> - The RAM disk ID.</p></li><li><p><code>root-device-name</code> - The name of the root device volume (for example, <code>/dev/sda1</code>).</p></li><li><p><code>root-device-type</code> - The type of the root device volume (<code>ebs</code> | <code>instance-store</code>).</p></li><li><p><code>state</code> - The state of the image (<code>available</code> | <code>pending</code> | <code>failed</code>).</p></li><li><p><code>state-reason-code</code> - The reason code for the state change.</p></li><li><p><code>state-reason-message</code> - The message for the state change.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the tag-value filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>virtualization-type</code> - The virtualization type (<code>paravirtual</code> | <code>hvm</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more image IDs.</p><p>Default: Describes all images available to you.</p>
 */
@property (nonatomic, strong) NSArray *imageIds;

/**
 * <p>Filters the images by the owner. Specify an AWS account ID, <code>amazon</code> (owner is Amazon), <code>aws-marketplace</code> (owner is AWS Marketplace), <code>self</code> (owner is the sender of the request), or <code>all</code> (all owners).</p>
 */
@property (nonatomic, strong) NSArray *owners;

@end

@interface AWSEC2DescribeImagesResult : AWSModel


/**
 * <p>Information about one or more images.</p>
 */
@property (nonatomic, strong) NSArray *images;

@end

@interface AWSEC2DescribeInstanceAttributeRequest : AWSRequest


/**
 * <p>The instance attribute.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceAttributeName attribute;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

@end

@interface AWSEC2DescribeInstanceStatusRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>availability-zone</code> - The Availability Zone of the instance.</p></li><li><p><code>event.code</code> - The code identifying the type of event (<code>instance-reboot</code> | <code>system-reboot</code> | <code>system-maintenance</code> | <code>instance-retirement</code> | <code>instance-stop</code>).</p></li><li><p><code>event.description</code> - A description of the event.</p></li><li><p><code>event.not-after</code> - The latest end time for the scheduled event.</p></li><li><p><code>event.not-before</code> - The earliest start time for the scheduled event.</p></li><li><p><code>instance-state-code</code> - A code representing the state of the instance, as a 16-bit unsigned integer. The high byte is an opaque internal value and should be ignored. The low byte is set based on the state represented. The valid values are 0 (pending), 16 (running), 32 (shutting-down), 48 (terminated), 64 (stopping), and 80 (stopped).</p></li><li><p><code>instance-state-name</code> - The state of the instance (<code>pending</code> | <code>running</code> | <code>shutting-down</code> | <code>terminated</code> | <code>stopping</code> | <code>stopped</code>).</p></li><li><p><code>instance-status.reachability</code> - Filters on instance status where the name is <code>reachability</code> (<code>passed</code> | <code>failed</code> | <code>initializing</code> | <code>insufficient-data</code>).</p></li><li><p><code>instance-status.status</code> - The status of the instance (<code>ok</code> | <code>impaired</code> | <code>initializing</code> | <code>insufficient-data</code> | <code>not-applicable</code>).</p></li><li><p><code>system-status.reachability</code> - Filters on system status where the name is <code>reachability</code> (<code>passed</code> | <code>failed</code> | <code>initializing</code> | <code>insufficient-data</code>).</p></li><li><p><code>system-status.status</code> - The system status of the instance (<code>ok</code> | <code>impaired</code> | <code>initializing</code> | <code>insufficient-data</code> | <code>not-applicable</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>When <code>true</code>, includes the health status for all instances. When <code>false</code>, includes the health status for running instances only.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber *includeAllInstances;

/**
 * <p>One or more instance IDs.</p><p>Default: Describes all your instances.</p><p>Constraints: Maximum 100 explicitly specified instance IDs.</p>
 */
@property (nonatomic, strong) NSArray *instanceIds;

/**
 * <p>The maximum number of paginated instance items per response.</p><p>Default: 1000</p>
 */
@property (nonatomic, strong) NSNumber *maxResults;

/**
 * <p>The next paginated set of results to return.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSEC2DescribeInstanceStatusResult : AWSModel


/**
 * <p>One or more instance status descriptions.</p>
 */
@property (nonatomic, strong) NSArray *instanceStatuses;

/**
 * <p>The next paginated set of results to return.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSEC2DescribeInstancesRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>architecture</code> - The instance architecture (<code>i386</code> | <code>x86_64</code>).</p></li><li><p><code>availability-zone</code> - The Availability Zone of the instance.</p></li><li><p><code>block-device-mapping.attach-time</code> - The attach time for an Amazon EBS volume mapped to the instance.</p></li><li><p><code>block-device-mapping.delete-on-termination</code> - A Boolean that indicates whether the Amazon EBS volume is deleted on instance termination.</p></li><li><p><code>block-device-mapping.device-name</code> - The device name for the Amazon EBS volume (for example, <code>/dev/sdh</code>).</p></li><li><p><code>block-device-mapping.status</code> - The status for the Amazon EBS volume (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p></li><li><p><code>block-device-mapping.volume-id</code> - The volume ID of the Amazon EBS volume.</p></li><li><p><code>client-token</code> - The idempotency token you provided when you launched the instance.</p></li><li><p><code>dns-name</code> - The public DNS name of the instance.</p></li><li><p><code>group-id</code> - The ID of the security group for the instance. If the instance is in EC2-Classic or a default VPC, you can use <code>group-name</code> instead.</p></li><li><p><code>group-name</code> - The name of the security group for the instance. If the instance is in a nondefault VPC, you must use <code>group-id</code> instead.</p></li><li><p><code>hypervisor</code> - The hypervisor type of the instance (<code>ovm</code> | <code>xen</code>).</p></li><li><p><code>iam-instance-profile.arn</code> - The instance profile associated with the instance. Specified as an ARN.</p></li><li><p><code>image-id</code> - The ID of the image used to launch the instance.</p></li><li><p><code>instance-id</code> - The ID of the instance.</p></li><li><p><code>instance-lifecycle</code> - Indicates whether this is a Spot Instance (<code>spot</code>).</p></li><li><p><code>instance-state-code</code> - The state of the instance, as a 16-bit unsigned integer. The high byte is an opaque internal value and should be ignored. The low byte is set based on the state represented. The valid values are: 0 (pending), 16 (running), 32 (shutting-down), 48 (terminated), 64 (stopping), and 80 (stopped).</p></li><li><p><code>instance-state-name</code> - The state of the instance (<code>pending</code> | <code>running</code> | <code>shutting-down</code> | <code>terminated</code> | <code>stopping</code> | <code>stopped</code>).</p></li><li><p><code>instance-type</code> - The type of instance (for example, <code>m1.small</code>).</p></li><li><p><code>instance.group-id</code> - The ID of the security group for the instance. If the instance is in EC2-Classic or a default VPC, you can use <code>instance.group-name</code> instead.</p></li><li><p><code>instance.group-name</code> - The name of the security group for the instance. If the instance is in a nondefault VPC, you must use <code>instance.group-id</code> instead.</p></li><li><p><code>ip-address</code> - The public IP address of the instance.</p></li><li><p><code>kernel-id</code> - The kernel ID.</p></li><li><p><code>key-name</code> - The name of the key pair used when the instance was launched.</p></li><li><p><code>launch-index</code> - When launching multiple instances, this is the index for the instance in the launch group (for example, 0, 1, 2, and so on). </p></li><li><p><code>launch-time</code> - The time when the instance was launched.</p></li><li><p><code>monitoring-state</code> - Indicates whether monitoring is enabled for the instance (<code>disabled</code> | <code>enabled</code>).</p></li><li><p><code>owner-id</code> - The AWS account ID of the instance owner.</p></li><li><p><code>placement-group-name</code> - The name of the placement group for the instance.</p></li><li><p><code>platform</code> - The platform. Use <code>windows</code> if you have Windows instances; otherwise, leave blank.</p></li><li><p><code>private-dns-name</code> - The private DNS name of the instance.</p></li><li><p><code>private-ip-address</code> - The private IP address of the instance.</p></li><li><p><code>product-code</code> - The product code associated with the AMI used to launch the instance.</p></li><li><p><code>product-code.type</code> - The type of product code (<code>devpay</code> | <code>marketplace</code>).</p></li><li><p><code>ramdisk-id</code> - The RAM disk ID.</p></li><li><p><code>reason</code> - The reason for the current state of the instance (for example, shows "User Initiated [date]" when you stop or terminate the instance). Similar to the state-reason-code filter.</p></li><li><p><code>requester-id</code> - The ID of the entity that launched the instance on your behalf (for example, AWS Management Console, Auto Scaling, and so on).</p></li><li><p><code>reservation-id</code> - The ID of the instance's reservation. A reservation ID is created any time you launch an instance. A reservation ID has a one-to-one relationship with an instance launch request, but can be associated with more than one instance if you launch multiple instances using the same launch request. For example, if you launch one instance, you'll get one reservation ID. If you launch ten instances using the same launch request, you'll also get one reservation ID.</p></li><li><p><code>root-device-name</code> - The name of the root device for the instance (for example, <code>/dev/sda1</code>).</p></li><li><p><code>root-device-type</code> - The type of root device that the instance uses (<code>ebs</code> | <code>instance-store</code>).</p></li><li><p><code>source-dest-check</code> - Indicates whether the instance performs source/destination checking. A value of <code>true</code> means that checking is enabled, and <code>false</code> means checking is disabled. The value must be <code>false</code> for the instance to perform network address translation (NAT) in your VPC. </p></li><li><p><code>spot-instance-request-id</code> - The ID of the Spot Instance request.</p></li><li><p><code>state-reason-code</code> - The reason code for the state change.</p></li><li><p><code>state-reason-message</code> - A message that describes the state change.</p></li><li><p><code>subnet-id</code> - The ID of the subnet for the instance.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource, where <code>tag</code>:<i>key</i> is the tag's key. </p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>tenancy</code> - The tenancy of an instance (<code>dedicated</code> | <code>default</code>).</p></li><li><p><code>virtualization-type</code> - The virtualization type of the instance (<code>paravirtual</code> | <code>hvm</code>).</p></li><li><p><code>vpc-id</code> - The ID of the VPC that the instance is running in.</p></li><li><p><code>network-interface.description</code> - The description of the network interface.</p></li><li><p><code>network-interface.subnet-id</code> - The ID of the subnet for the network interface.</p></li><li><p><code>network-interface.vpc-id</code> - The ID of the VPC for the network interface.</p></li><li><p><code>network-interface.network-interface.id</code> - The ID of the network interface.</p></li><li><p><code>network-interface.owner-id</code> - The ID of the owner of the network interface.</p></li><li><p><code>network-interface.availability-zone</code> - The Availability Zone for the network interface.</p></li><li><p><code>network-interface.requester-id</code> - The requester ID for the network interface.</p></li><li><p><code>network-interface.requester-managed</code> - Indicates whether the network interface is being managed by AWS.</p></li><li><p><code>network-interface.status</code> - The status of the network interface (<code>available</code>) | <code>in-use</code>).</p></li><li><p><code>network-interface.mac-address</code> - The MAC address of the network interface.</p></li><li><p><code>network-interface-private-dns-name</code> - The private DNS name of the network interface.</p></li><li><p><code>network-interface.source-destination-check</code> - Whether the network interface performs source/destination checking. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. The value must be <code>false</code> for the network interface to perform network address translation (NAT) in your VPC.</p></li><li><p><code>network-interface.group-id</code> - The ID of a security group associated with the network interface.</p></li><li><p><code>network-interface.group-name</code> - The name of a security group associated with the network interface.</p></li><li><p><code>network-interface.attachment.attachment-id</code> - The ID of the interface attachment.</p></li><li><p><code>network-interface.attachment.instance-id</code> - The ID of the instance to which the network interface is attached.</p></li><li><p><code>network-interface.attachment.instance-owner-id</code> - The owner ID of the instance to which the network interface is attached.</p></li><li><p><code>network-interface.addresses.private-ip-address</code> - The private IP address associated with the network interface.</p></li><li><p><code>network-interface.attachment.device-index</code> - The device index to which the network interface is attached.</p></li><li><p><code>network-interface.attachment.status</code> - The status of the attachment (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p></li><li><p><code>network-interface.attachment.attach-time</code> - The time that the network interface was attached to an instance.</p></li><li><p><code>network-interface.attachment.delete-on-termination</code> - Specifies whether the attachment is deleted when an instance is terminated.</p></li><li><p><code>network-interface.addresses.primary</code> - Specifies whether the IP address of the network interface is the primary private IP address.</p></li><li><p><code>network-interface.addresses.association.public-ip</code> - The ID of the association of an Elastic IP address with a network interface.</p></li><li><p><code>network-interface.addresses.association.ip-owner-id</code> - The owner ID of the private IP address associated with the network interface.</p></li><li><p><code>association.public-ip</code> - The address of the Elastic IP address bound to the network interface.</p></li><li><p><code>association.ip-owner-id</code> - The owner of the Elastic IP address associated with the network interface.</p></li><li><p><code>association.allocation-id</code> - The allocation ID returned when you allocated the Elastic IP address for your network interface.</p></li><li><p><code>association.association-id</code> - The association ID returned when the network interface was associated with an IP address.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more instance IDs.</p><p>Default: Describes all your instances.</p>
 */
@property (nonatomic, strong) NSArray *instanceIds;

/**
 * <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results. If the value is greater than 1000, we return only 1000 items.</p>
 */
@property (nonatomic, strong) NSNumber *maxResults;

/**
 * <p>The token for the next set of items to return. (You received this token from a prior call.)</p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSEC2DescribeInstancesResult : AWSModel


/**
 * <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>One or more reservations.</p>
 */
@property (nonatomic, strong) NSArray *reservations;

@end

@interface AWSEC2DescribeInternetGatewaysRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>attachment.state</code> - The current state of the attachment between the gateway and the VPC. Present only if a VPC is attached.</p></li><li><p><code>attachment.vpc-id</code> - The ID of an attached VPC.</p></li><li><p><code>internet-gateway-id</code> - The ID of the Internet gateway.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more Internet gateway IDs.</p><p>Default: Describes all your Internet gateways.</p>
 */
@property (nonatomic, strong) NSArray *internetGatewayIds;

@end

@interface AWSEC2DescribeInternetGatewaysResult : AWSModel


/**
 * <p>Information about one or more Internet gateways.</p>
 */
@property (nonatomic, strong) NSArray *internetGateways;

@end

@interface AWSEC2DescribeKeyPairsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>fingerprint</code> - The fingerprint of the key pair.</p></li><li><p><code>key-name</code> - The name of the key pair.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more key pair names.</p><p>Default: Describes all your key pairs.</p>
 */
@property (nonatomic, strong) NSArray *keyNames;

@end

@interface AWSEC2DescribeKeyPairsResult : AWSModel


/**
 * <p>Information about one or more key pairs.</p>
 */
@property (nonatomic, strong) NSArray *keyPairs;

@end

@interface AWSEC2DescribeNetworkAclsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>association.association-id</code> - The ID of an association ID for the ACL.</p></li><li><p><code>association.network-acl-id</code> - The ID of the network ACL involved in the association.</p></li><li><p><code>association.subnet-id</code> - The ID of the subnet involved in the association.</p></li><li><p><code>default</code> - Indicates whether the ACL is the default network ACL for the VPC.</p></li><li><p><code>entry.cidr</code> - The CIDR range specified in the entry.</p></li><li><p><code>entry.egress</code> - Indicates whether the entry applies to egress traffic.</p></li><li><p><code>entry.icmp.code</code> - The ICMP code specified in the entry, if any.</p></li><li><p><code>entry.icmp.type</code> - The ICMP type specified in the entry, if any.</p></li><li><p><code>entry.port-range.from</code> - The start of the port range specified in the entry. </p></li><li><p><code>entry.port-range.to</code> - The end of the port range specified in the entry. </p></li><li><p><code>entry.protocol</code> - The protocol specified in the entry (<code>tcp</code> | <code>udp</code> | <code>icmp</code> or a protocol number).</p></li><li><p><code>entry.rule-action</code> - Allows or denies the matching traffic (<code>allow</code> | <code>deny</code>).</p></li><li><p><code>entry.rule-number</code> - The number of an entry (in other words, rule) in the ACL's set of entries.</p></li><li><p><code>network-acl-id</code> - The ID of the network ACL.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>vpc-id</code> - The ID of the VPC for the network ACL.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more network ACL IDs.</p><p>Default: Describes all your network ACLs.</p>
 */
@property (nonatomic, strong) NSArray *networkAclIds;

@end

@interface AWSEC2DescribeNetworkAclsResult : AWSModel


/**
 * <p>Information about one or more network ACLs.</p>
 */
@property (nonatomic, strong) NSArray *networkAcls;

@end

@interface AWSEC2DescribeNetworkInterfaceAttributeRequest : AWSRequest


/**
 * <p>The attribute of the network interface.</p>
 */
@property (nonatomic, assign) AWSEC2NetworkInterfaceAttribute attribute;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

@end

@interface AWSEC2DescribeNetworkInterfaceAttributeResult : AWSModel


/**
 * <p>The attachment (if any) of the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkInterfaceAttachment *attachment;
@property (nonatomic, strong) AWSEC2AttributeValue *detail;

/**
 * <p>The security groups associated with the network interface.</p>
 */
@property (nonatomic, strong) NSArray *groups;

/**
 * <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

/**
 * <p>Indicates whether source/destination checking is enabled.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *sourceDestCheck;

@end

@interface AWSEC2DescribeNetworkInterfacesRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>addresses.private-ip-address</code> - The private IP addresses associated with the network interface.</p></li><li><p><code>addresses.primary</code> - Whether the private IP address is the primary IP address associated with the network interface. </p></li><li><p><code>addresses.association.public-ip</code> - The association ID returned when the network interface was associated with the Elastic IP address.</p></li><li><p><code>addresses.association.owner-id</code> - The owner ID of the addresses associated with the network interface.</p></li><li><p><code>association.association-id</code> - The association ID returned when the network interface was associated with an IP address.</p></li><li><p><code>association.allocation-id</code> - The allocation ID returned when you allocated the Elastic IP address for your network interface.</p></li><li><p><code>association.ip-owner-id</code> - The owner of the Elastic IP address associated with the network interface.</p></li><li><p><code>association.public-ip</code> - The address of the Elastic IP address bound to the network interface.</p></li><li><p><code>association.public-dns-name</code> - The public DNS name for the network interface.</p></li><li><p><code>attachment.attachment-id</code> - The ID of the interface attachment.</p></li><li><p><code>attachment.instance-id</code> - The ID of the instance to which the network interface is attached.</p></li><li><p><code>attachment.instance-owner-id</code> - The owner ID of the instance to which the network interface is attached.</p></li><li><p><code>attachment.device-index</code> - The device index to which the network interface is attached.</p></li><li><p><code>attachment.status</code> - The status of the attachment (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p></li><li><p><code>attachment.attach.time</code> - The time that the network interface was attached to an instance.</p></li><li><p><code>attachment.delete-on-termination</code> - Indicates whether the attachment is deleted when an instance is terminated.</p></li><li><p><code>availability-zone</code> - The Availability Zone of the network interface.</p></li><li><p><code>description</code> - The description of the network interface.</p></li><li><p><code>group-id</code> - The ID of a security group associated with the network interface.</p></li><li><p><code>group-name</code> - The name of a security group associated with the network interface.</p></li><li><p><code>mac-address</code> - The MAC address of the network interface.</p></li><li><p><code>network-interface-id</code> - The ID of the network interface.</p></li><li><p><code>owner-id</code> - The AWS account ID of the network interface owner.</p></li><li><p><code>private-ip-address</code> - The private IP address or addresses of the network interface.</p></li><li><p><code>private-dns-name</code> - The private DNS name of the network interface.</p></li><li><p><code>requester-id</code> - The ID of the entity that launched the instance on your behalf (for example, AWS Management Console, Auto Scaling, and so on).</p></li><li><p><code>requester-managed</code> - Indicates whether the network interface is being managed by an AWS service (for example, AWS Management Console, Auto Scaling, and so on).</p></li><li><p><code>source-desk-check</code> - Indicates whether the network interface performs source/destination checking. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. The value must be <code>false</code> for the network interface to perform Network Address Translation (NAT) in your VPC. </p></li><li><p><code>status</code> - The status of the network interface. If the network interface is not attached to an instance, the status is <code>available</code>; if a network interface is attached to an instance the status is <code>in-use</code>.</p></li><li><p><code>subnet-id</code> - The ID of the subnet for the network interface.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>vpc-id</code> - The ID of the VPC for the network interface.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more network interface IDs.</p><p>Default: Describes all your network interfaces.</p>
 */
@property (nonatomic, strong) NSArray *networkInterfaceIds;

@end

@interface AWSEC2DescribeNetworkInterfacesResult : AWSModel


/**
 * <p>Information about one or more network interfaces.</p>
 */
@property (nonatomic, strong) NSArray *networkInterfaces;

@end

@interface AWSEC2DescribePlacementGroupsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>group-name</code> - The name of the placement group.</p></li><li><p><code>state</code> - The state of the placement group (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p></li><li><p><code>strategy</code> - The strategy of the placement group (<code>cluster</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more placement group names.</p><p>Default: Describes all your placement groups, or only those otherwise specified.</p>
 */
@property (nonatomic, strong) NSArray *groupNames;

@end

@interface AWSEC2DescribePlacementGroupsResult : AWSModel


/**
 * <p>One or more placement groups.</p>
 */
@property (nonatomic, strong) NSArray *placementGroups;

@end

@interface AWSEC2DescribeRegionsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>endpoint</code> - The endpoint of the region (for example, <code>ec2.us-east-1.amazonaws.com</code>).</p></li><li><p><code>region-name</code> - The name of the region (for example, <code>us-east-1</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>The names of one or more regions.</p>
 */
@property (nonatomic, strong) NSArray *regionNames;

@end

@interface AWSEC2DescribeRegionsResult : AWSModel


/**
 * <p>Information about one or more regions.</p>
 */
@property (nonatomic, strong) NSArray *regions;

@end

@interface AWSEC2DescribeReservedInstancesListingsRequest : AWSRequest


/**
 * <p>One or more filters.</p><ul><li><p><code>reserved-instances-id</code> - The ID of the Reserved Instances.</p></li><li><p><code>reserved-instances-listing-id</code> - The ID of the Reserved Instances listing.</p></li><li><p><code>status</code> - The status of the Reserved Instance listing (<code>pending</code> | <code>active</code> | <code>cancelled</code> | <code>closed</code>).</p></li><li><p><code>status-message</code> - The reason for the status.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more Reserved Instance IDs.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesId;

/**
 * <p>One or more Reserved Instance Listing IDs.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesListingId;

@end

@interface AWSEC2DescribeReservedInstancesListingsResult : AWSModel


/**
 * <p>Information about the Reserved Instance listing.</p>
 */
@property (nonatomic, strong) NSArray *reservedInstancesListings;

@end

@interface AWSEC2DescribeReservedInstancesModificationsRequest : AWSRequest


/**
 * <p>One or more filters.</p><ul><li><p><code>client-token</code> - The idempotency token for the modification request.</p></li><li><p><code>create-date</code> - The time when the modification request was created.</p></li><li><p><code>effective-date</code> - The time when the modification becomes effective.</p></li><li><p><code>modification-result.reserved-instances-id</code> - The ID for the Reserved Instances created as part of the modification request. This ID is only available when the status of the modification is <code>fulfilled</code>.</p></li><li><p><code>modification-result.target-configuration.availability-zone</code> - The Availability Zone for the new Reserved Instances.</p></li><li><p><code>modification-result.target-configuration.instance-count </code> - The number of new Reserved Instances.</p></li><li><p><code>modification-result.target-configuration.instance-type</code> - The instance type of the new Reserved Instances.</p></li><li><p><code>modification-result.target-configuration.platform</code> - The network platform of the new Reserved Instances (<code>EC2-Classic</code> | <code>EC2-VPC</code>).</p></li><li><p><code>reserved-instances-id</code> - The ID of the Reserved Instances modified.</p></li><li><p><code>reserved-instances-modification-id</code> - The ID of the modification request.</p></li><li><p><code>status</code> - The status of the Reserved Instances modification request (<code>processing</code> | <code>fulfilled</code> | <code>failed</code>).</p></li><li><p><code>status-message</code> - The reason for the status.</p></li><li><p><code>update-date</code> - The time when the modification request was last updated.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>The token for the next page of data.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>IDs for the submitted modification request.</p>
 */
@property (nonatomic, strong) NSArray *reservedInstancesModificationIds;

@end

@interface AWSEC2DescribeReservedInstancesModificationsResult : AWSModel


/**
 * <p>The token for the next page of data.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>The Reserved Instance modification information.</p>
 */
@property (nonatomic, strong) NSArray *reservedInstancesModifications;

@end

@interface AWSEC2DescribeReservedInstancesOfferingsRequest : AWSRequest


/**
 * <p>The Availability Zone in which the Reserved Instance can be used.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>availability-zone</code> - The Availability Zone where the Reserved Instance can be used.</p></li><li><p><code>duration</code> - The duration of the Reserved Instance (for example, one year or three years), in seconds.</p></li><li><p><code>fixed-price</code> - The purchase price of the Reserved Instance (for example, 9800.0).</p></li><li><p><code>instance-type</code> - The instance type on which the Reserved Instance can be used.</p></li><li><p><code>marketplace</code> - Set to <code>true</code> to show only Reserved Instance Marketplace offerings. When this filter is not used, which is the default behavior, all offerings from AWS and Reserved Instance Marketplace are listed.</p></li><li><p><code>product-description</code> - The description of the Reserved Instance (<code>Linux/UNIX</code> | <code>Linux/UNIX (Amazon VPC)</code> | <code>Windows</code> | <code>Windows (Amazon VPC)</code>).</p></li><li><p><code>reserved-instances-offering-id</code> - The Reserved Instances offering ID.</p></li><li><p><code>usage-price</code> - The usage price of the Reserved Instance, per hour (for example, 0.84).</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>Include Marketplace offerings in the response.</p>
 */
@property (nonatomic, strong) NSNumber *includeMarketplace;

/**
 * <p>The tenancy of the Reserved Instance offering. A Reserved Instance with <code>dedicated</code> tenancy runs on single-tenant hardware and can only be launched within a VPC.</p><p>Default: <code>default</code></p>
 */
@property (nonatomic, assign) AWSEC2Tenancy instanceTenancy;

/**
 * <p>The instance type on which the Reserved Instance can be used. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 * <p>The maximum duration (in seconds) to filter when searching for offerings.</p>
 */
@property (nonatomic, strong) NSNumber *maxDuration;

/**
 * <p>The maximum number of instances to filter when searching for offerings.</p>
 */
@property (nonatomic, strong) NSNumber *maxInstanceCount;

/**
 * <p>The maximum number of offerings to return.</p>
 */
@property (nonatomic, strong) NSNumber *maxResults;

/**
 * <p>The minimum duration (in seconds) to filter when searching for offerings.</p>
 */
@property (nonatomic, strong) NSNumber *minDuration;

/**
 * <p>The token to use when requesting the next paginated set of offerings.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>The Reserved Instance offering type.</p>
 */
@property (nonatomic, assign) AWSEC2OfferingTypeValues offeringType;

/**
 * <p>The Reserved Instance description. Instances that include <code>(Amazon VPC)</code> in the description are for use with Amazon VPC.</p>
 */
@property (nonatomic, assign) AWSEC2RIProductDescription productDescription;

/**
 * <p>One or more Reserved Instances offering IDs.</p>
 */
@property (nonatomic, strong) NSArray *reservedInstancesOfferingIds;

@end

@interface AWSEC2DescribeReservedInstancesOfferingsResult : AWSModel


/**
 * <p>The next paginated set of results to return.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>A list of Reserved Instances offerings.</p>
 */
@property (nonatomic, strong) NSArray *reservedInstancesOfferings;

@end

@interface AWSEC2DescribeReservedInstancesRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>availability-zone</code> - The Availability Zone where the Reserved Instance can be used.</p></li><li><p><code>duration</code> - The duration of the Reserved Instance (one year or three years), in seconds (<code>31536000</code> | <code>94608000</code>).</p></li><li><p><code>end</code> - The time when the Reserved Instance expires.</p></li><li><p><code>fixed-price</code> - The purchase price of the Reserved Instance (for example, 9800.0).</p></li><li><p><code>instance-type</code> - The instance type on which the Reserved Instance can be used.</p></li><li><p><code>product-description</code> - The product description of the Reserved Instance (<code>Linux/UNIX</code> | <code>Linux/UNIX (Amazon VPC)</code> | <code>Windows</code> | <code>Windows (Amazon VPC)</code>).</p></li><li><p><code>reserved-instances-id</code> - The ID of the Reserved Instance.</p></li><li><p><code>start</code> - The time at which the Reserved Instance purchase request was placed.</p></li><li><p><code>state</code> - The state of the Reserved Instance (<code>pending-payment</code> | <code>active</code> | <code>payment-failed</code> | <code>retired</code>).</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>usage-price</code> - The usage price of the Reserved Instance, per hour (for example, 0.84).</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>The Reserved Instance offering type.</p>
 */
@property (nonatomic, assign) AWSEC2OfferingTypeValues offeringType;

/**
 * <p>One or more Reserved Instance IDs.</p><p>Default: Describes all your Reserved Instances, or only those otherwise specified.</p>
 */
@property (nonatomic, strong) NSArray *reservedInstancesIds;

@end

@interface AWSEC2DescribeReservedInstancesResult : AWSModel


/**
 * <p>A list of Reserved Instances.</p>
 */
@property (nonatomic, strong) NSArray *reservedInstances;

@end

@interface AWSEC2DescribeRouteTablesRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>association.route-table-association-id</code> - The ID of an association ID for the route table.</p></li><li><p><code>association.route-table-id</code> - The ID of the route table involved in the association.</p></li><li><p><code>association.subnet-id</code> - The ID of the subnet involved in the association.</p></li><li><p><code>association.main</code> - Indicates whether the route table is the main route table for the VPC.</p></li><li><p><code>route-table-id</code> - The ID of the route table.</p></li><li><p><code>route.destination-cidr-block</code> - The CIDR range specified in a route in the table.</p></li><li><p><code>route.gateway-id</code> - The ID of a gateway specified in a route in the table.</p></li><li><p><code>route.instance-id</code> - The ID of an instance specified in a route in the table.</p></li><li><p><code>route.origin</code> - Describes how the route was created (<code>CreateRouteTable</code> | <code>CreateRoute</code> | <code>EnableVgwRoutePropagation</code>).</p></li><li><p><code>route.state</code> - The state of a route in the route table (<code>active</code> | <code>blackhole</code>). The blackhole state indicates that the route's target isn't available (for example, the specified gateway isn't attached to the VPC, the specified NAT instance has been terminated, and so on).</p></li><li><p><code>route.vpc-peering-connection-id</code> - The ID of a VPC peering connection specified in a route in the table.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>vpc-id</code> - The ID of the VPC for the route table.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more route table IDs.</p><p>Default: Describes all your route tables.</p>
 */
@property (nonatomic, strong) NSArray *routeTableIds;

@end

@interface AWSEC2DescribeRouteTablesResult : AWSModel


/**
 * <p>Information about one or more route tables.</p>
 */
@property (nonatomic, strong) NSArray *routeTables;

@end

@interface AWSEC2DescribeSecurityGroupsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>description</code> - The description of the security group.</p></li><li><p><code>group-id</code> - The ID of the security group.</p></li><li><p><code>group-name</code> - The name of the security group.</p></li><li><p><code>ip-permission.cidr</code> - A CIDR range that has been granted permission.</p></li><li><p><code>ip-permission.from-port</code> - The start of port range for the TCP and UDP protocols, or an ICMP type number.</p></li><li><p><code>ip-permission.group-id</code> - The ID of a security group that has been granted permission.</p></li><li><p><code>ip-permission.group-name</code> - The name of a security group that has been granted permission.</p></li><li><p><code>ip-permission.protocol</code> - The IP protocol for the permission (<code>tcp</code> | <code>udp</code> | <code>icmp</code> or a protocol number).</p></li><li><p><code>ip-permission.to-port</code> - The end of port range for the TCP and UDP protocols, or an ICMP code.</p></li><li><p><code>ip-permission.user-id</code> - The ID of an AWS account that has been granted permission.</p></li><li><p><code>owner-id</code> - The AWS account ID of the owner of the security group.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the security group.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the security group.</p></li><li><p><code>vpc-id</code> - The ID of the VPC specified when the security group was created.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more security group IDs.</p><p>Default: Describes all your security groups.</p>
 */
@property (nonatomic, strong) NSArray *groupIds;

/**
 * <p>[EC2-Classic, default VPC] One or more security group names.</p><p>Default: Describes all your security groups.</p>
 */
@property (nonatomic, strong) NSArray *groupNames;

@end

@interface AWSEC2DescribeSecurityGroupsResult : AWSModel


/**
 * <p>Information about one or more security groups.</p>
 */
@property (nonatomic, strong) NSArray *securityGroups;

@end

@interface AWSEC2DescribeSnapshotAttributeRequest : AWSRequest


/**
 * <p>The snapshot attribute you would like to view.</p>
 */
@property (nonatomic, assign) AWSEC2SnapshotAttributeName attribute;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the Amazon EBS snapshot.</p>
 */
@property (nonatomic, strong) NSString *snapshotId;

@end

@interface AWSEC2DescribeSnapshotAttributeResult : AWSModel


/**
 * <p>A list of permissions for creating volumes from the snapshot.</p>
 */
@property (nonatomic, strong) NSArray *createVolumePermissions;

/**
 * <p>A list of product codes.</p>
 */
@property (nonatomic, strong) NSArray *productCodes;

/**
 * <p>The ID of the Amazon EBS snapshot.</p>
 */
@property (nonatomic, strong) NSString *snapshotId;

@end

@interface AWSEC2DescribeSnapshotsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>description</code> - A description of the snapshot.</p></li><li><p><code>owner-alias</code> - The AWS account alias (for example, <code>amazon</code>) that owns the snapshot.</p></li><li><p><code>owner-id</code> - The ID of the AWS account that owns the snapshot.</p></li><li><p><code>progress</code> - The progress of the snapshot, as a percentage (for example, 80%).</p></li><li><p><code>snapshot-id</code> - The snapshot ID.</p></li><li><p><code>start-time</code> - The time stamp when the snapshot was initiated.</p></li><li><p><code>status</code> - The status of the snapshot (<code>pending</code> | <code>completed</code> | <code>error</code>).</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>volume-id</code> - The ID of the volume the snapshot is for.</p></li><li><p><code>volume-size</code> - The size of the volume, in GiB.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>Returns the snapshots owned by the specified owner. Multiple owners can be specified.</p>
 */
@property (nonatomic, strong) NSArray *ownerIds;

/**
 * <p>One or more AWS accounts IDs that can create volumes from the snapshot.</p>
 */
@property (nonatomic, strong) NSArray *restorableByUserIds;

/**
 * <p>One or more snapshot IDs.</p><p>Default: Describes snapshots for which you have launch permissions.</p>
 */
@property (nonatomic, strong) NSArray *snapshotIds;

@end

@interface AWSEC2DescribeSnapshotsResult : AWSModel

@property (nonatomic, strong) NSArray *snapshots;

@end

@interface AWSEC2DescribeSpotDatafeedSubscriptionRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

@end

@interface AWSEC2DescribeSpotDatafeedSubscriptionResult : AWSModel


/**
 * <p>The Spot Instance datafeed subscription.</p>
 */
@property (nonatomic, strong) AWSEC2SpotDatafeedSubscription *spotDatafeedSubscription;

@end

@interface AWSEC2DescribeSpotInstanceRequestsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>availability-zone-group</code> - The Availability Zone group.</p></li><li><p><code>create-time</code> - The time stamp when the Spot Instance request was created.</p></li><li><p><code>fault-code</code> - The fault code related to the request.</p></li><li><p><code>fault-message</code> - The fault message related to the request.</p></li><li><p><code>instance-id</code> - The ID of the instance that fulfilled the request.</p></li><li><p><code>launch-group</code> - The Spot Instance launch group.</p></li><li><p><code>launch.block-device-mapping.delete-on-termination</code> - Indicates whether the Amazon EBS volume is deleted on instance termination.</p></li><li><p><code>launch.block-device-mapping.device-name</code> - The device name for the Amazon EBS volume (for example, <code>/dev/sdh</code>).</p></li><li><p><code>launch.block-device-mapping.snapshot-id</code> - The ID of the snapshot used for the Amazon EBS volume.</p></li><li><p><code>launch.block-device-mapping.volume-size</code> - The size of the Amazon EBS volume, in GiB.</p></li><li><p><code>launch.block-device-mapping.volume-type</code> - The type of the Amazon EBS volume (<code>gp2</code> | <code>standard</code> | <code>io1</code>).</p></li><li><p><code>launch.group-id</code> - The security group for the instance.</p></li><li><p><code>launch.image-id</code> - The ID of the AMI.</p></li><li><p><code>launch.instance-type</code> - The type of instance (for example, <code>m1.small</code>).</p></li><li><p><code>launch.kernel-id</code> - The kernel ID.</p></li><li><p><code>launch.key-name</code> - The name of the key pair the instance launched with.</p></li><li><p><code>launch.monitoring-enabled</code> - Whether monitoring is enabled for the Spot Instance.</p></li><li><p><code>launch.ramdisk-id</code> - The RAM disk ID.</p></li><li><p><code>launch.network-interface.network-interface-id</code> - The ID of the network interface.</p></li><li><p><code>launch.network-interface.device-index</code> - The index of the device for the network interface attachment on the instance.</p></li><li><p><code>launch.network-interface.subnet-id</code> - The ID of the subnet for the instance.</p></li><li><p><code>launch.network-interface.description</code> - A description of the network interface.</p></li><li><p><code>launch.network-interface.private-ip-address</code> - The primary private IP address of the network interface.</p></li><li><p><code>launch.network-interface.delete-on-termination</code> - Indicates whether the network interface is deleted when the instance is terminated.</p></li><li><p><code>launch.network-interface.group-id</code> - The ID of the security group associated with the network interface.</p></li><li><p><code>launch.network-interface.group-name</code> - The name of the security group associated with the network interface.</p></li><li><p><code>launch.network-interface.addresses.primary</code> - Indicates whether the IP address is the primary private IP address.</p></li><li><p><code>product-description</code> - The product description associated with the instance (<code>Linux/UNIX</code> | <code>Windows</code>).</p></li><li><p><code>spot-instance-request-id</code> - The Spot Instance request ID.</p></li><li><p><code>spot-price</code> - The maximum hourly price for any Spot Instance launched to fulfill the request.</p></li><li><p><code>state</code> - The state of the Spot Instance request (<code>open</code> | <code>active</code> | <code>closed</code> | <code>cancelled</code> | <code>failed</code>).</p></li><li><p><code>status-code</code> - The short code describing the most recent evaluation of your Spot Instance request.</p></li><li><p><code>status-message</code> - The message explaining the status of the Spot Instance request.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>type</code> - The type of Spot Instance request (<code>one-time</code> | <code>persistent</code>).</p></li><li><p><code>launched-availability-zone</code> - The Availability Zone in which the bid is launched.</p></li><li><p><code>valid-from</code> - The start date of the request.</p></li><li><p><code>valid-until</code> - The end date of the request.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more Spot Instance request IDs.</p>
 */
@property (nonatomic, strong) NSArray *spotInstanceRequestIds;

@end

@interface AWSEC2DescribeSpotInstanceRequestsResult : AWSModel


/**
 * <p>One or more Spot Instance requests.</p>
 */
@property (nonatomic, strong) NSArray *spotInstanceRequests;

@end

@interface AWSEC2DescribeSpotPriceHistoryRequest : AWSRequest


/**
 * <p>The Availability Zone.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The end date and time of the Spot Price history data.</p>
 */
@property (nonatomic, strong) NSDate *endTime;

/**
 * <p>One or more filters.</p><ul><li><p><code>availability-zone</code> - The Availability Zone for which prices should be returned.</p></li><li><p><code>instance-type</code> - The type of instance (for example, <code>m1.small</code>).</p></li><li><p><code>product-description</code> - The product description for the Spot Price (<code>Linux/UNIX</code> | <code>SUSE Linux</code> | <code>Windows</code> | <code>Linux/UNIX (Amazon VPC)</code> | <code>SUSE Linux (Amazon VPC)</code> | <code>Windows (Amazon VPC)</code>).</p></li><li><p><code>spot-price</code> - The Spot Price. The value must match exactly (or use wildcards; greater than or less than comparison is not supported).</p></li><li><p><code>timestamp</code> - The timestamp of the Spot Price history (for example, 2010-08-16T05:06:11.000Z). You can use wildcards (* and ?). Greater than or less than comparison is not supported.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more instance types.</p>
 */
@property (nonatomic, strong) NSArray *instanceTypes;

/**
 * <p>The number of rows to return.</p>
 */
@property (nonatomic, strong) NSNumber *maxResults;

/**
 * <p>The next set of rows to return.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>One or more basic product descriptions.</p>
 */
@property (nonatomic, strong) NSArray *productDescriptions;

/**
 * <p>The start date and time of the Spot Price history data.</p>
 */
@property (nonatomic, strong) NSDate *startTime;

@end

@interface AWSEC2DescribeSpotPriceHistoryResult : AWSModel


/**
 * <p>The string marking the next set of results. This is empty if there are no more results.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>The historical Spot Prices.</p>
 */
@property (nonatomic, strong) NSArray *spotPriceHistory;

@end

@interface AWSEC2DescribeSubnetsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>availabilityZone</code> - The Availability Zone for the subnet. You can also use <code>availability-zone</code> as the filter name.</p></li><li><p><code>available-ip-address-count</code> - The number of IP addresses in the subnet that are available.</p></li><li><p><code>cidrBlock</code> - The CIDR block of the subnet. The CIDR block you specify must exactly match the subnet's CIDR block for information to be returned for the subnet. You can also use <code>cidr</code> or <code>cidr-block</code> as the filter names.</p></li><li><p><code>defaultForAz</code> - Indicates whether this is the default subnet for the Availability Zone. You can also use <code>default-for-az</code> as the filter name.</p></li><li><p><code>state</code> - The state of the subnet (<code>pending</code> | <code>available</code>).</p></li><li><p><code>subnet-id</code> - The ID of the subnet.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>vpc-id</code> - The ID of the VPC for the subnet.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more subnet IDs.</p><p>Default: Describes all your subnets.</p>
 */
@property (nonatomic, strong) NSArray *subnetIds;

@end

@interface AWSEC2DescribeSubnetsResult : AWSModel


/**
 * <p>Information about one or more subnets.</p>
 */
@property (nonatomic, strong) NSArray *subnets;

@end

@interface AWSEC2DescribeTagsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>key</code> - The tag key.</p></li><li><p><code>resource-id</code> - The resource ID.</p></li><li><p><code>resource-type</code> - The resource type (<code>customer-gateway</code> | <code>dhcp-options</code> | <code>image</code> | <code>instance</code> | <code>internet-gateway</code> | <code>network-acl</code> | <code>network-interface</code> | <code>reserved-instances</code> | <code>route-table</code> | <code>security-group</code> | <code>snapshot</code> | <code>spot-instances-request</code> | <code>subnet</code> | <code>volume</code> | <code>vpc</code> | <code>vpn-connection</code> | <code>vpn-gateway</code>).</p></li><li><p><code>value</code> - The tag value.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results. If the value is greater than 1000, we return only 1000 items.</p>
 */
@property (nonatomic, strong) NSNumber *maxResults;

/**
 * <p>The token for the next set of items to return. (You received this token from a prior call.)</p>
 */
@property (nonatomic, strong) NSString *nextToken;

@end

@interface AWSEC2DescribeTagsResult : AWSModel


/**
 * <p>The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>A list of tags.</p>
 */
@property (nonatomic, strong) NSArray *tags;

@end

@interface AWSEC2DescribeVolumeAttributeRequest : AWSRequest


/**
 * <p>The instance attribute.</p>
 */
@property (nonatomic, assign) AWSEC2VolumeAttributeName attribute;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

@end

@interface AWSEC2DescribeVolumeAttributeResult : AWSModel


/**
 * <p>The state of <code>autoEnableIO</code> attribute.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *autoEnableIO;

/**
 * <p>A list of product codes.</p>
 */
@property (nonatomic, strong) NSArray *productCodes;

/**
 * <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

@end

@interface AWSEC2DescribeVolumeStatusRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>action.code</code> - The action code for the event (for example, <code>enable-volume-io</code>).</p></li><li><p><code>action.description</code> - A description of the action.</p></li><li><p><code>action.event-id</code> - The event ID associated with the action.</p></li><li><p><code>availability-zone</code> - The Availability Zone of the instance.</p></li><li><p><code>event.description</code> - A description of the event.</p></li><li><p><code>event.event-id</code> - The event ID.</p></li><li><p><code>event.event-type</code> - The event type (for <code>io-enabled</code>: <code>passed</code> | <code>failed</code>; for <code>io-performance</code>: <code>io-performance:degraded</code> | <code>io-performance:severely-degraded</code> | <code>io-performance:stalled</code>).</p></li><li><p><code>event.not-after</code> - The latest end time for the event.</p></li><li><p><code>event.not-before</code> - The earliest start time for the event.</p></li><li><p><code>volume-status.details-name</code> - The cause for <code>volume-status.status</code> (<code>io-enabled</code> | <code>io-performance</code>).</p></li><li><p><code>volume-status.details-status</code> - The status of <code>volume-status.details-name</code> (for <code>io-enabled</code>: <code>passed</code> | <code>failed</code>; for <code>io-performance</code>: <code>normal</code> | <code>degraded</code> | <code>severely-degraded</code> | <code>stalled</code>).</p></li><li><p><code>volume-status.status</code> - The status of the volume (<code>ok</code> | <code>impaired</code> | <code>warning</code> | <code>insufficient-data</code>).</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>The maximum number of paginated volume items per response.</p>
 */
@property (nonatomic, strong) NSNumber *maxResults;

/**
 * <p>The next paginated set of results to return using the pagination token returned by a previous call.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>One or more volume IDs.</p><p>Default: Describes all your volumes.</p>
 */
@property (nonatomic, strong) NSArray *volumeIds;

@end

@interface AWSEC2DescribeVolumeStatusResult : AWSModel


/**
 * <p>The next paginated set of results to return.</p>
 */
@property (nonatomic, strong) NSString *nextToken;

/**
 * <p>A list of volumes.</p>
 */
@property (nonatomic, strong) NSArray *volumeStatuses;

@end

@interface AWSEC2DescribeVolumesRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>attachment.attach-time</code> - The time stamp when the attachment initiated.</p></li><li><p><code>attachment.delete-on-termination</code> - Whether the volume is deleted on instance termination.</p></li><li><p><code>attachment.device</code> - The device name that is exposed to the instance (for example, <code>/dev/sda1</code>).</p></li><li><p><code>attachment.instance-id</code> - The ID of the instance the volume is attached to.</p></li><li><p><code>attachment.status</code> - The attachment state (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p></li><li><p><code>availability-zone</code> - The Availability Zone in which the volume was created.</p></li><li><p><code>create-time</code> - The time stamp when the volume was created.</p></li><li><p><code>encrypted</code> - The encryption status of the volume.</p></li><li><p><code>size</code> - The size of the volume, in GiB.</p></li><li><p><code>snapshot-id</code> - The snapshot from which the volume was created.</p></li><li><p><code>status</code> - The status of the volume (<code>creating</code> | <code>available</code> | <code>in-use</code> | <code>deleting</code> | <code>deleted</code> | <code>error</code>).</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>volume-id</code> - The volume ID.</p></li><li><p><code>volume-type</code> - The Amazon EBS volume type. This can be <code>gp2</code> for General Purpose (SSD) volumes, <code>io1</code> for Provisioned IOPS (SSD) volumes, or <code>standard</code> for Magnetic volumes.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more volume IDs.</p>
 */
@property (nonatomic, strong) NSArray *volumeIds;

@end

@interface AWSEC2DescribeVolumesResult : AWSModel

@property (nonatomic, strong) NSArray *volumes;

@end

@interface AWSEC2DescribeVpcAttributeRequest : AWSRequest


/**
 * <p>The VPC attribute.</p>
 */
@property (nonatomic, assign) AWSEC2VpcAttributeName attribute;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

@interface AWSEC2DescribeVpcAttributeResult : AWSModel


/**
 * <p>Indicates whether the instances launched in the VPC get DNS hostnames. If this attribute is <code>true</code>, instances in the VPC get DNS hostnames; otherwise, they do not.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *enableDnsHostnames;

/**
 * <p>Indicates whether DNS resolution is enabled for the VPC. If this attribute is <code>true</code>, the Amazon DNS server resolves DNS hostnames for your instances to their corresponding IP addresses; otherwise, it does not.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *enableDnsSupport;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

@interface AWSEC2DescribeVpcPeeringConnectionsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>accepter-vpc-info.cidr-block</code> - The CIDR block of the peer VPC.</p></li><li><p><code>accepter-vpc-info.owner-id</code> - The AWS account ID of the owner of the peer VPC.</p></li><li><p><code>accepter-vpc-info.vpc-id</code> - The ID of the peer VPC.</p></li><li><p><code>expiration-time</code> - The expiration date and time for the VPC peering connection.</p></li><li><p><code>requester-vpc-info.cidr-block</code> - The CIDR block of the requester's VPC.</p></li><li><p><code>requester-vpc-info.owner-id</code> - The AWS account ID of the owner of the requester VPC.</p></li><li><p><code>requester-vpc-info.vpc-id</code> - The ID of the requester VPC.</p></li><li><p><code>status-code</code> - The status of the VPC peering connection (<code>pending-acceptance</code> | <code>failed</code> | <code>expired</code> | <code>provisioning</code> | <code>active</code> | <code>deleted</code> | <code>rejected</code>).</p></li><li><p><code>status-message</code> - A message that provides more information about the status of the VPC peering connection, if applicable.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>vpc-peering-connection-id</code> - The ID of the VPC peering connection.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more VPC peering connection IDs.</p><p>Default: Describes all your VPC peering connections.</p>
 */
@property (nonatomic, strong) NSArray *vpcPeeringConnectionIds;

@end

@interface AWSEC2DescribeVpcPeeringConnectionsResult : AWSModel


/**
 * <p>Information about the VPC peering connections</p>
 */
@property (nonatomic, strong) NSArray *vpcPeeringConnections;

@end

@interface AWSEC2DescribeVpcsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>cidr</code> - The CIDR block of the VPC. The CIDR block you specify must exactly match the VPC's CIDR block for information to be returned for the VPC.</p></li><li><p><code>dhcp-options-id</code> - The ID of a set of DHCP options.</p></li><li><p><code>isDefault</code> - Indicates whether the VPC is the default VPC.</p></li><li><p><code>state</code> - The state of the VPC (<code>pending</code> | <code>available</code>).</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>vpc-id</code> - The ID of the VPC.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more VPC IDs.</p><p>Default: Describes all your VPCs.</p>
 */
@property (nonatomic, strong) NSArray *vpcIds;

@end

@interface AWSEC2DescribeVpcsResult : AWSModel


/**
 * <p>Information about one or more VPCs.</p>
 */
@property (nonatomic, strong) NSArray *vpcs;

@end

@interface AWSEC2DescribeVpnConnectionsRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>customer-gateway-configuration</code> - The configuration information for the customer gateway.</p></li><li><p><code>customer-gateway-id</code> - The ID of a customer gateway associated with the VPN connection.</p></li><li><p><code>state</code> - The state of the VPN connection (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p></li><li><p><code>option.static-routes-only</code> - Indicates whether the connection has static routes only. Used for devices that do not support Border Gateway Protocol (BGP).</p></li><li><p><code>route.destination-cidr-block</code> - The destination CIDR block. This corresponds to the subnet used in a customer data center.</p></li><li><p><code>bgp-asn</code> - The BGP Autonomous System Number (ASN) associated with a BGP device.</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>type</code> - The type of VPN connection. Currently the only supported type is <code>ipsec.1</code>.</p></li><li><p><code>vpn-connection-id</code> - The ID of the VPN connection.</p></li><li><p><code>vpn-gateway-id</code> - The ID of a virtual private gateway associated with the VPN connection.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more VPN connection IDs.</p><p>Default: Describes your VPN connections.</p>
 */
@property (nonatomic, strong) NSArray *vpnConnectionIds;

@end

@interface AWSEC2DescribeVpnConnectionsResult : AWSModel


/**
 * <p>Information about one or more VPN connections.</p>
 */
@property (nonatomic, strong) NSArray *vpnConnections;

@end

@interface AWSEC2DescribeVpnGatewaysRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more filters.</p><ul><li><p><code>attachment.state</code> - The current state of the attachment between the gateway and the VPC (<code>attaching</code> | <code>attached</code> | <code>detaching</code> | <code>detached</code>).</p></li><li><p><code>attachment.vpc-id</code> - The ID of an attached VPC.</p></li><li><p><code>availability-zone</code> - The Availability Zone for the virtual private gateway.</p></li><li><p><code>state</code> - The state of the virtual private gateway (<code>pending</code> | <code>available</code> | <code>deleting</code> | <code>deleted</code>).</p></li><li><p><code>tag</code>:<i>key</i>=<i>value</i> - The key/value combination of a tag assigned to the resource.</p></li><li><p><code>tag-key</code> - The key of a tag assigned to the resource. This filter is independent of the <code>tag-value</code> filter. For example, if you use both the filter "tag-key=Purpose" and the filter "tag-value=X", you get any resources assigned both the tag key Purpose (regardless of what the tag's value is), and the tag value X (regardless of what the tag's key is). If you want to list only resources where Purpose is X, see the <code>tag</code>:<i>key</i>=<i>value</i> filter.</p></li><li><p><code>tag-value</code> - The value of a tag assigned to the resource. This filter is independent of the <code>tag-key</code> filter.</p></li><li><p><code>type</code> - The type of virtual private gateway. Currently the only supported type is <code>ipsec.1</code>.</p></li><li><p><code>vpn-gateway-id</code> - The ID of the virtual private gateway.</p></li></ul>
 */
@property (nonatomic, strong) NSArray *filters;

/**
 * <p>One or more virtual private gateway IDs.</p><p>Default: Describes all your virtual private gateways.</p>
 */
@property (nonatomic, strong) NSArray *vpnGatewayIds;

@end

@interface AWSEC2DescribeVpnGatewaysResult : AWSModel


/**
 * <p>Information about one or more virtual private gateways.</p>
 */
@property (nonatomic, strong) NSArray *vpnGateways;

@end

@interface AWSEC2DetachInternetGatewayRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the Internet gateway.</p>
 */
@property (nonatomic, strong) NSString *internetGatewayId;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

@interface AWSEC2DetachNetworkInterfaceRequest : AWSRequest


/**
 * <p>The ID of the attachment.</p>
 */
@property (nonatomic, strong) NSString *attachmentId;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>Specifies whether to force a detachment.</p>
 */
@property (nonatomic, strong) NSNumber *force;

@end

@interface AWSEC2DetachVolumeRequest : AWSRequest


/**
 * <p>The device name.</p>
 */
@property (nonatomic, strong) NSString *device;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>Forces detachment if the previous detachment attempt did not occur cleanly (for example, logging into an instance, unmounting the volume, and detaching normally). This option can lead to data loss or a corrupted file system. Use this option only as a last resort to detach a volume from a failed instance. The instance won't have an opportunity to flush file system caches or file system metadata. If you use this option, you must perform file system check and repair procedures.</p>
 */
@property (nonatomic, strong) NSNumber *force;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

@end

@interface AWSEC2DetachVpnGatewayRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

/**
 * <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString *vpnGatewayId;

@end

/**
 * <p>Describes a DHCP configuration option.</p>
 */
@interface AWSEC2DhcpConfiguration : AWSModel


/**
 * <p>The name of a DHCP option.</p>
 */
@property (nonatomic, strong) NSString *key;

/**
 * <p>One or more values for the DHCP option.</p>
 */
@property (nonatomic, strong) NSArray *values;

@end

/**
 * <p>Describes a set of DHCP options.</p>
 */
@interface AWSEC2DhcpOptions : AWSModel


/**
 * <p>One or more DHCP options in the set.</p>
 */
@property (nonatomic, strong) NSArray *dhcpConfigurations;

/**
 * <p>The ID of the set of DHCP options.</p>
 */
@property (nonatomic, strong) NSString *dhcpOptionsId;

/**
 * <p>Any tags assigned to the DHCP options set.</p>
 */
@property (nonatomic, strong) NSArray *tags;

@end

@interface AWSEC2DisableVgwRoutePropagationRequest : AWSRequest


/**
 * <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString *gatewayId;

/**
 * <p>The ID of the routing table.</p>
 */
@property (nonatomic, strong) NSString *routeTableId;

@end

@interface AWSEC2DisassociateAddressRequest : AWSRequest


/**
 * <p>[EC2-VPC] The association ID.</p>
 */
@property (nonatomic, strong) NSString *associationId;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>[EC2-Classic] The Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString *publicIp;

@end

@interface AWSEC2DisassociateRouteTableRequest : AWSRequest


/**
 * <p>The association ID representing the current association between the route table and subnet.</p>
 */
@property (nonatomic, strong) NSString *associationId;
@property (nonatomic, strong) NSNumber *dryRun;

@end

/**
 * <p>Describes a disk image.</p>
 */
@interface AWSEC2DiskImage : AWSModel

@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) AWSEC2DiskImageDetail *image;

/**
 * <p>Describes an Amazon EBS volume.</p>
 */
@property (nonatomic, strong) AWSEC2VolumeDetail *volume;

@end

@interface AWSEC2DiskImageDescription : AWSModel


/**
 * <p>The checksum computed for the disk image.</p>
 */
@property (nonatomic, strong) NSString *checksum;

/**
 * <p>The disk image format.</p>
 */
@property (nonatomic, assign) AWSEC2DiskImageFormat format;

/**
 * <p>A presigned URL for the import manifest stored in Amazon S3. For information about creating a presigned URL for an Amazon S3 object, read the "Query String Request Authentication Alternative" section of the <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html">Authenticating REST Requests</a> topic in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString *importManifestUrl;

/**
 * <p>The size of the disk image.</p>
 */
@property (nonatomic, strong) NSNumber *size;

@end

@interface AWSEC2DiskImageDetail : AWSModel

@property (nonatomic, strong) NSNumber *bytes;

/**
 * <p>The disk image format.</p>
 */
@property (nonatomic, assign) AWSEC2DiskImageFormat format;

/**
 * <p>A presigned URL for the import manifest stored in Amazon S3. For information about creating a presigned URL for an Amazon S3 object, read the "Query String Request Authentication Alternative" section of the <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html">Authenticating REST Requests</a> topic in the <i>Amazon Simple Storage Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString *importManifestUrl;

@end

@interface AWSEC2DiskImageVolumeDescription : AWSModel


/**
 * <p>The volume identifier.</p>
 */
@property (nonatomic, strong) NSString *id;

/**
 * <p>The size of the volume.</p>
 */
@property (nonatomic, strong) NSNumber *size;

@end

/**
 * <p>Describes an Amazon EBS block device.</p>
 */
@interface AWSEC2EbsBlockDevice : AWSModel


/**
 * <p>Indicates whether the Amazon EBS volume is deleted on instance termination.</p>
 */
@property (nonatomic, strong) NSNumber *deleteOnTermination;

/**
 * <p>Indicates whether the Amazon EBS volume is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber *encrypted;

/**
 * <p>The number of I/O operations per second (IOPS) that the volume supports.</p><p>Constraint: Range is 100 to 4000.</p><p>Condition: Required when the volume type is <code>io1</code>; not used with <code>standard</code> or <code>gp2</code> volumes.</p>
 */
@property (nonatomic, strong) NSNumber *iops;

/**
 * <p>The ID of the snapshot.</p>
 */
@property (nonatomic, strong) NSString *snapshotId;

/**
 * <p>The size of the volume, in GiB.</p><p>Constraints: If the volume type is <code>io1</code>, the minimum size of the volume is 10 GiB.</p><p>Default: If you're creating the volume from a snapshot and don't specify a volume size, the default is the snapshot size.</p>
 */
@property (nonatomic, strong) NSNumber *volumeSize;

/**
 * <p>The volume type. <code>gp2</code> for General Purpose (SSD) volumes, <code>io1</code> for Provisioned IOPS (SSD) volumes, and <code>standard</code> for Magnetic volumes.</p><p>Default: <code>standard</code></p>
 */
@property (nonatomic, assign) AWSEC2VolumeType volumeType;

@end

/**
 * <p>Describes a parameter used to set up an Amazon EBS volume in a block device mapping.</p>
 */
@interface AWSEC2EbsInstanceBlockDevice : AWSModel


/**
 * <p>The time stamp when the attachment initiated.</p>
 */
@property (nonatomic, strong) NSDate *attachTime;

/**
 * <p>Indicates whether the volume is deleted on instance termination.</p>
 */
@property (nonatomic, strong) NSNumber *deleteOnTermination;

/**
 * <p>The attachment state.</p>
 */
@property (nonatomic, assign) AWSEC2AttachmentStatus status;

/**
 * <p>The ID of the Amazon EBS volume.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

@end

@interface AWSEC2EbsInstanceBlockDeviceSpecification : AWSModel


/**
 * <p>Indicates whether the volume is deleted on instance termination.</p>
 */
@property (nonatomic, strong) NSNumber *deleteOnTermination;

/**
 * <p>The ID of the Amazon EBS volume.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

@end

@interface AWSEC2EnableVgwRoutePropagationRequest : AWSRequest


/**
 * <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString *gatewayId;

/**
 * <p>The ID of the routing table.</p>
 */
@property (nonatomic, strong) NSString *routeTableId;

@end

@interface AWSEC2EnableVolumeIORequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

@end

/**
 * <p>Describes an export task.</p>
 */
@interface AWSEC2ExportTask : AWSModel

@property (nonatomic, strong) NSString *detail;

/**
 * <p>The ID of the export task.</p>
 */
@property (nonatomic, strong) NSString *exportTaskId;
@property (nonatomic, strong) AWSEC2ExportToS3Task *exportToS3Task;

/**
 * <p>The instance being exported.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceExportDetails *instanceExportDetails;

/**
 * <p>The state of the conversion task.</p>
 */
@property (nonatomic, assign) AWSEC2ExportTaskState state;

/**
 * <p>The status message related to the export task.</p>
 */
@property (nonatomic, strong) NSString *statusMessage;

@end

@interface AWSEC2ExportToS3Task : AWSModel


/**
 * <p>The container format used to combine disk images with metadata (such as OVF). If absent, only the disk image is exported.</p>
 */
@property (nonatomic, assign) AWSEC2ContainerFormat containerFormat;

/**
 * <p>The format for the exported image.</p>
 */
@property (nonatomic, assign) AWSEC2DiskImageFormat diskImageFormat;

/**
 * <p>The Amazon S3 bucket for the destination image. The destination bucket must exist and grant WRITE and READ_ACL permissions to the AWS account <code>vm-import-export@amazon.com</code>.</p>
 */
@property (nonatomic, strong) NSString *s3Bucket;
@property (nonatomic, strong) NSString *s3Key;

@end

@interface AWSEC2ExportToS3TaskSpecification : AWSModel

@property (nonatomic, assign) AWSEC2ContainerFormat containerFormat;
@property (nonatomic, assign) AWSEC2DiskImageFormat diskImageFormat;
@property (nonatomic, strong) NSString *s3Bucket;

/**
 * <p>The image is written to a single object in the Amazon S3 bucket at the S3 key s3prefix + exportTaskId + '.' + diskImageFormat.</p>
 */
@property (nonatomic, strong) NSString *s3Prefix;

@end

@interface AWSEC2Filter : AWSModel


/**
 * <p>The name of the filter.</p>
 */
@property (nonatomic, strong) NSString *name;

/**
 * <p>One or more filter values.</p>
 */
@property (nonatomic, strong) NSArray *values;

@end

@interface AWSEC2GetConsoleOutputRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

@end

@interface AWSEC2GetConsoleOutputResult : AWSModel


/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The console output, Base64 encoded.</p>
 */
@property (nonatomic, strong) NSString *output;

/**
 * <p>The time the output was last updated.</p>
 */
@property (nonatomic, strong) NSDate *timestamp;

@end

@interface AWSEC2GetPasswordDataRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the Windows instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

@end

@interface AWSEC2GetPasswordDataResult : AWSModel


/**
 * <p>The ID of the Windows instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The password of the instance.</p>
 */
@property (nonatomic, strong) NSString *passwordData;

/**
 * <p>The time the data was last updated.</p>
 */
@property (nonatomic, strong) NSDate *timestamp;

@end

/**
 * <p>Describes a security group.</p>
 */
@interface AWSEC2GroupIdentifier : AWSModel


/**
 * <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString *groupId;

/**
 * <p>The name of the security group.</p>
 */
@property (nonatomic, strong) NSString *groupName;

@end

/**
 * <p>Describes an IAM instance profile.</p>
 */
@interface AWSEC2IamInstanceProfile : AWSModel


/**
 * <p>The Amazon Resource Name (ARN) of the instance profile.</p>
 */
@property (nonatomic, strong) NSString *arn;

/**
 * <p>The ID of the instance profile.</p>
 */
@property (nonatomic, strong) NSString *id;

@end

/**
 * <p>Describes an IAM instance profile.</p>
 */
@interface AWSEC2IamInstanceProfileSpecification : AWSModel


/**
 * <p>The Amazon Resource Name (ARN) of the instance profile.</p>
 */
@property (nonatomic, strong) NSString *arn;

/**
 * <p>The name of the instance profile.</p>
 */
@property (nonatomic, strong) NSString *name;

@end

/**
 * <p>Describes the ICMP type and code.</p>
 */
@interface AWSEC2IcmpTypeCode : AWSModel


/**
 * <p>The ICMP type. A value of -1 means all types.</p>
 */
@property (nonatomic, strong) NSNumber *code;

/**
 * <p>The ICMP code. A value of -1 means all codes for the specified ICMP type.</p>
 */
@property (nonatomic, strong) NSNumber *type;

@end

/**
 * <p>Describes an image.</p>
 */
@interface AWSEC2Image : AWSModel


/**
 * <p>The architecture of the image.</p>
 */
@property (nonatomic, assign) AWSEC2ArchitectureValues architecture;

/**
 * <p>Any block device mapping entries.</p>
 */
@property (nonatomic, strong) NSArray *blockDeviceMappings;
@property (nonatomic, strong) NSString *detail;

/**
 * <p>The hypervisor type of the image.</p>
 */
@property (nonatomic, assign) AWSEC2HypervisorType hypervisor;

/**
 * <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString *imageId;

/**
 * <p>The location of the AMI.</p>
 */
@property (nonatomic, strong) NSString *imageLocation;

/**
 * <p>The AWS account alias (for example, <code>amazon</code>, <code>self</code>) or the AWS account ID of the AMI owner.</p>
 */
@property (nonatomic, strong) NSString *imageOwnerAlias;

/**
 * <p>The type of image.</p>
 */
@property (nonatomic, assign) AWSEC2ImageTypeValues imageType;

/**
 * <p>The kernel associated with the image, if any. Only applicable for machine images.</p>
 */
@property (nonatomic, strong) NSString *kernelId;

/**
 * <p>The name of the AMI that was provided during image creation.</p>
 */
@property (nonatomic, strong) NSString *name;

/**
 * <p>The AWS account ID of the image owner.</p>
 */
@property (nonatomic, strong) NSString *ownerId;

/**
 * <p>The value is <code>Windows</code> for Windows AMIs; otherwise blank.</p>
 */
@property (nonatomic, assign) AWSEC2PlatformValues platform;

/**
 * <p>Any product codes associated with the AMI.</p>
 */
@property (nonatomic, strong) NSArray *productCodes;

/**
 * <p>Indicates whether the image has public launch permissions. The value is <code>true</code> if this image has public launch permissions or <code>false</code> if it has only implicit and explicit launch permissions.</p>
 */
@property (nonatomic, strong) NSNumber *public;

/**
 * <p>The RAM disk associated with the image, if any. Only applicable for machine images.</p>
 */
@property (nonatomic, strong) NSString *ramdiskId;

/**
 * <p>The device name of the root device (for example, <filename>/dev/sda1</filename> or <filename>xvda</filename>).</p>
 */
@property (nonatomic, strong) NSString *rootDeviceName;

/**
 * <p>The type of root device used by the AMI. The AMI can use an Amazon EBS volume or an instance store volume.</p>
 */
@property (nonatomic, assign) AWSEC2DeviceType rootDeviceType;

/**
 * <p>Specifies whether enhanced networking is enabled.</p>
 */
@property (nonatomic, strong) NSString *sriovNetSupport;

/**
 * <p>The current state of the AMI. If the state is <code>available</code>, the image is successfully registered and can be used to launch an instance.</p>
 */
@property (nonatomic, assign) AWSEC2ImageState state;

/**
 * <p>The reason for the state change.</p>
 */
@property (nonatomic, strong) AWSEC2StateReason *stateReason;

/**
 * <p>Any tags assigned to the image.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The type of virtualization of the AMI.</p>
 */
@property (nonatomic, assign) AWSEC2VirtualizationType virtualizationType;

@end

/**
 * <p>Describes an image attribute.</p>
 */
@interface AWSEC2ImageAttribute : AWSModel


/**
 * <p>One or more block device mapping entries.</p>
 */
@property (nonatomic, strong) NSArray *blockDeviceMappings;
@property (nonatomic, strong) AWSEC2AttributeValue *detail;

/**
 * <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString *imageId;

/**
 * <p>The kernel ID.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue *kernelId;

/**
 * <p>One or more launch permissions.</p>
 */
@property (nonatomic, strong) NSArray *launchPermissions;

/**
 * <p>One or more product codes.</p>
 */
@property (nonatomic, strong) NSArray *productCodes;

/**
 * <p>The RAM disk ID.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue *ramdiskId;
@property (nonatomic, strong) AWSEC2AttributeValue *sriovNetSupport;

@end

@interface AWSEC2ImportInstanceLaunchSpecification : AWSModel

@property (nonatomic, strong) NSString *additionalInfo;

/**
 * <p>The architecture of the instance.</p>
 */
@property (nonatomic, assign) AWSEC2ArchitectureValues architecture;

/**
 * <p>One or more security group names.</p>
 */
@property (nonatomic, strong) NSArray *groupNames;

/**
 * <p>Indicates whether an instance stops or terminates when you initiate shutdown from the instance (using the operating system command for system shutdown).</p>
 */
@property (nonatomic, assign) AWSEC2ShutdownBehavior instanceInitiatedShutdownBehavior;

/**
 * <p>The instance type. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;
@property (nonatomic, strong) NSNumber *monitoring;

/**
 * <p>Describes the placement for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2Placement *placement;

/**
 * <p>[EC2-VPC] Optionally, you can use this parameter to assign the instance a specific available IP address from the IP address range of the subnet.</p>
 */
@property (nonatomic, strong) NSString *privateIpAddress;

/**
 * <p>[EC2-VPC] The ID of the subnet to launch the instance into.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

/**
 * <p>User data to be made available to the instance.</p>
 */
@property (nonatomic, strong) NSString *userData;

@end

@interface AWSEC2ImportInstanceRequest : AWSRequest

@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSArray *diskImages;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p></p>
 */
@property (nonatomic, strong) AWSEC2ImportInstanceLaunchSpecification *launchSpecification;

/**
 * <p>The instance operating system.</p>
 */
@property (nonatomic, assign) AWSEC2PlatformValues platform;

@end

@interface AWSEC2ImportInstanceResult : AWSModel


/**
 * <p>Describes a conversion task.</p>
 */
@property (nonatomic, strong) AWSEC2ConversionTask *conversionTask;

@end

@interface AWSEC2ImportInstanceTaskDetails : AWSModel

@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The instance operating system.</p>
 */
@property (nonatomic, assign) AWSEC2PlatformValues platform;
@property (nonatomic, strong) NSArray *volumes;

@end

/**
 * <p>Describes an import volume task.</p>
 * Required parameters: [BytesConverted, AvailabilityZone, Image, Volume, Status]
 */
@interface AWSEC2ImportInstanceVolumeDetailItem : AWSModel


/**
 * <p>The Availability Zone where the resulting instance will reside.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>The number of bytes converted so far.</p>
 */
@property (nonatomic, strong) NSNumber *bytesConverted;
@property (nonatomic, strong) NSString *detail;

/**
 * <p>The image.</p>
 */
@property (nonatomic, strong) AWSEC2DiskImageDescription *image;

/**
 * <p>The status of the import of this particular disk image.</p>
 */
@property (nonatomic, strong) NSString *status;

/**
 * <p>The status information or errors related to the disk image.</p>
 */
@property (nonatomic, strong) NSString *statusMessage;

/**
 * <p>The volume.</p>
 */
@property (nonatomic, strong) AWSEC2DiskImageVolumeDescription *volume;

@end

@interface AWSEC2ImportKeyPairRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>A unique name for the key pair.</p>
 */
@property (nonatomic, strong) NSString *keyName;

/**
 * <p>The public key. You must base64 encode the public key material before sending it to AWS.</p>
 */
@property (nonatomic, strong) NSData *publicKeyMaterial;

@end

@interface AWSEC2ImportKeyPairResult : AWSModel


/**
 * <p>The MD5 public key fingerprint as specified in section 4 of RFC 4716.</p>
 */
@property (nonatomic, strong) NSString *keyFingerprint;

/**
 * <p>The key pair name you provided.</p>
 */
@property (nonatomic, strong) NSString *keyName;

@end

@interface AWSEC2ImportVolumeRequest : AWSRequest


/**
 * <p>The Availability Zone for the resulting Amazon EBS volume.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSNumber *dryRun;
@property (nonatomic, strong) AWSEC2DiskImageDetail *image;

/**
 * <p>Describes an Amazon EBS volume.</p>
 */
@property (nonatomic, strong) AWSEC2VolumeDetail *volume;

@end

@interface AWSEC2ImportVolumeResult : AWSModel


/**
 * <p>Describes a conversion task.</p>
 */
@property (nonatomic, strong) AWSEC2ConversionTask *conversionTask;

@end

/**
 * <p>Describes an import volume task.</p>
 * Required parameters: [BytesConverted, AvailabilityZone, Image, Volume]
 */
@interface AWSEC2ImportVolumeTaskDetails : AWSModel


/**
 * <p>The Availability Zone where the resulting volume will reside.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>The number of bytes converted so far.</p>
 */
@property (nonatomic, strong) NSNumber *bytesConverted;
@property (nonatomic, strong) NSString *detail;

/**
 * <p>The image.</p>
 */
@property (nonatomic, strong) AWSEC2DiskImageDescription *image;

/**
 * <p>The volume.</p>
 */
@property (nonatomic, strong) AWSEC2DiskImageVolumeDescription *volume;

@end

/**
 * <p>Describes an instance.</p>
 */
@interface AWSEC2Instance : AWSModel


/**
 * <p>The AMI launch index, which can be used to find this instance in the launch group.</p>
 */
@property (nonatomic, strong) NSNumber *amiLaunchIndex;

/**
 * <p>The architecture of the image.</p>
 */
@property (nonatomic, assign) AWSEC2ArchitectureValues architecture;

/**
 * <p>Any block device mapping entries for the instance.</p>
 */
@property (nonatomic, strong) NSArray *blockDeviceMappings;

/**
 * <p>The idempotency token you provided when you launched the instance.</p>
 */
@property (nonatomic, strong) NSString *clientToken;

/**
 * <p>Indicates whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p>
 */
@property (nonatomic, strong) NSNumber *ebsOptimized;

/**
 * <p>The hypervisor type of the instance.</p>
 */
@property (nonatomic, assign) AWSEC2HypervisorType hypervisor;

/**
 * <p>The IAM instance profile associated with the instance.</p>
 */
@property (nonatomic, strong) AWSEC2IamInstanceProfile *iamInstanceProfile;

/**
 * <p>The ID of the AMI used to launch the instance.</p>
 */
@property (nonatomic, strong) NSString *imageId;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>Indicates whether this is a Spot Instance.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceLifecycleType instanceLifecycle;

/**
 * <p>The instance type.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 * <p>The kernel associated with this instance.</p>
 */
@property (nonatomic, strong) NSString *kernelId;

/**
 * <p>The name of the key pair, if this instance was launched with an associated key pair.</p>
 */
@property (nonatomic, strong) NSString *keyName;

/**
 * <p>The time the instance was launched.</p>
 */
@property (nonatomic, strong) NSDate *launchTime;

/**
 * <p>The monitoring information for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2Monitoring *monitoring;

/**
 * <p>[EC2-VPC] One or more network interfaces for the instance.</p>
 */
@property (nonatomic, strong) NSArray *networkInterfaces;

/**
 * <p>The location where the instance launched.</p>
 */
@property (nonatomic, strong) AWSEC2Placement *placement;

/**
 * <p>The value is <code>Windows</code> for Windows instances; otherwise blank.</p>
 */
@property (nonatomic, assign) AWSEC2PlatformValues platform;

/**
 * <p>The private DNS name assigned to the instance. This DNS name can only be used inside the Amazon EC2 network. This name is not available until the instance enters the <code>running</code> state.</p>
 */
@property (nonatomic, strong) NSString *privateDnsName;

/**
 * <p>The private IP address assigned to the instance.</p>
 */
@property (nonatomic, strong) NSString *privateIpAddress;

/**
 * <p>The product codes attached to this instance.</p>
 */
@property (nonatomic, strong) NSArray *productCodes;

/**
 * <p>The public DNS name assigned to the instance. This name is not available until the instance enters the <code>running</code> state.</p>
 */
@property (nonatomic, strong) NSString *publicDnsName;

/**
 * <p>The public IP address assigned to the instance.</p>
 */
@property (nonatomic, strong) NSString *publicIpAddress;

/**
 * <p>The RAM disk associated with this instance.</p>
 */
@property (nonatomic, strong) NSString *ramdiskId;

/**
 * <p>The root device name (for example, <code>/dev/sda1</code>).</p>
 */
@property (nonatomic, strong) NSString *rootDeviceName;

/**
 * <p>The root device type used by the AMI. The AMI can use an Amazon EBS volume or an instance store volume.</p>
 */
@property (nonatomic, assign) AWSEC2DeviceType rootDeviceType;

/**
 * <p>One or more security groups for the instance.</p>
 */
@property (nonatomic, strong) NSArray *securityGroups;

/**
 * <p>Specifies whether to enable an instance launched in a VPC to perform NAT. This controls whether source/destination checking is enabled on the instance. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. The value must be <code>false</code> for the instance to perform NAT. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html">NAT Instances</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber *sourceDestCheck;

/**
 * <p>The ID of the Spot Instance request.</p>
 */
@property (nonatomic, strong) NSString *spotInstanceRequestId;

/**
 * <p>Specifies whether enhanced networking is enabled.</p>
 */
@property (nonatomic, strong) NSString *sriovNetSupport;

/**
 * <p>The current state of the instance.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceState *state;

/**
 * <p>The reason for the most recent state transition.</p>
 */
@property (nonatomic, strong) AWSEC2StateReason *stateReason;

/**
 * <p>The reason for the most recent state transition. This might be an empty string.</p>
 */
@property (nonatomic, strong) NSString *stateTransitionReason;

/**
 * <p>The ID of the subnet in which the instance is running.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

/**
 * <p>Any tags assigned to the instance.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The virtualization type of the instance.</p>
 */
@property (nonatomic, assign) AWSEC2VirtualizationType virtualizationType;

/**
 * <p>The ID of the VPC in which the instance is running.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

/**
 * <p>Describes an instance attribute.</p>
 */
@interface AWSEC2InstanceAttribute : AWSModel


/**
 * <p>The block device mapping of the instance.</p>
 */
@property (nonatomic, strong) NSArray *blockDeviceMappings;

/**
 * <p>If the value is <code>true</code>, you can't terminate the instance through the Amazon EC2 console, CLI, or API; otherwise, you can.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *disableApiTermination;

/**
 * <p>Indicates whether the instance is optimized for EBS I/O.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *ebsOptimized;
@property (nonatomic, strong) NSArray *groups;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>Indicates whether an instance stops or terminates when you initiate shutdown from the instance (using the operating system command for system shutdown).</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue *instanceInitiatedShutdownBehavior;

/**
 * <p>The instance type.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue *instanceType;

/**
 * <p>The kernel ID.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue *kernelId;

/**
 * <p>A list of product codes.</p>
 */
@property (nonatomic, strong) NSArray *productCodes;

/**
 * <p>The RAM disk ID.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue *ramdiskId;

/**
 * <p>The name of the root device (for example, <code>/dev/sda1</code>).</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue *rootDeviceName;

/**
 * <p>Indicates whether source/destination checking is enabled. A value of true means checking is enabled, and false means checking is disabled. This value must be false for a NAT instance to perform NAT.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *sourceDestCheck;
@property (nonatomic, strong) AWSEC2AttributeValue *sriovNetSupport;

/**
 * <p>The Base64-encoded MIME user data.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue *userData;

@end

/**
 * <p>Describes a block device mapping.</p>
 */
@interface AWSEC2InstanceBlockDeviceMapping : AWSModel


/**
 * <p>The device name exposed to the instance (for example, <filename>/dev/sdh</filename>).</p>
 */
@property (nonatomic, strong) NSString *deviceName;

/**
 * <p>Parameters used to automatically set up Amazon EBS volumes when the instance is launched.</p>
 */
@property (nonatomic, strong) AWSEC2EbsInstanceBlockDevice *ebs;

@end

/**
 * <p>Describes a block device mapping entry.</p>
 */
@interface AWSEC2InstanceBlockDeviceMappingSpecification : AWSModel


/**
 * <p>The device name exposed to the instance (for example, <filename>/dev/sdh</filename>).</p>
 */
@property (nonatomic, strong) NSString *deviceName;

/**
 * <p>Parameters used to automatically set up Amazon EBS volumes when the instance is launched.</p>
 */
@property (nonatomic, strong) AWSEC2EbsInstanceBlockDeviceSpecification *ebs;

/**
 * <p>suppress the specified device included in the block device mapping.</p>
 */
@property (nonatomic, strong) NSString *noDevice;

/**
 * <p>The virtual device name.</p>
 */
@property (nonatomic, strong) NSString *virtualName;

@end

/**
 * <p>Describes a Reserved Instance listing state.</p>
 */
@interface AWSEC2InstanceCount : AWSModel


/**
 * <p>he number of listed Reserved Instances in the state specified by the <code>state</code>.</p>
 */
@property (nonatomic, strong) NSNumber *instanceCount;

/**
 * <p>The states of the listed Reserved Instances.</p>
 */
@property (nonatomic, assign) AWSEC2ListingState state;

@end

/**
 * <p>Describes an instance export task.</p>
 */
@interface AWSEC2InstanceExportDetails : AWSModel


/**
 * <p>The ID of the resource being exported.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The target virtualization environment.</p>
 */
@property (nonatomic, assign) AWSEC2ExportEnvironment targetEnvironment;

@end

/**
 * <p>Describes the monitoring information of the instance.</p>
 */
@interface AWSEC2InstanceMonitoring : AWSModel


/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The monitoring information.</p>
 */
@property (nonatomic, strong) AWSEC2Monitoring *monitoring;

@end

/**
 * <p>Describes a network interface.</p>
 */
@interface AWSEC2InstanceNetworkInterface : AWSModel


/**
 * <p>The association information for an Elastic IP associated with the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceNetworkInterfaceAssociation *association;

/**
 * <p>The network interface attachment.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceNetworkInterfaceAttachment *attachment;
@property (nonatomic, strong) NSString *detail;

/**
 * <p>One or more security groups.</p>
 */
@property (nonatomic, strong) NSArray *groups;

/**
 * <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

/**
 * <p>The ID of the AWS account that created the network interface.</p>
 */
@property (nonatomic, strong) NSString *ownerId;

/**
 * <p>The private DNS name.</p>
 */
@property (nonatomic, strong) NSString *privateDnsName;

/**
 * <p>The IP address of the network interface within the subnet.</p>
 */
@property (nonatomic, strong) NSString *privateIpAddress;

/**
 * <p>The private IP addresses associated with the network interface.</p>
 */
@property (nonatomic, strong) NSArray *privateIpAddresses;

/**
 * <p>Indicates whether to validate network traffic to or from this network interface.</p>
 */
@property (nonatomic, strong) NSNumber *sourceDestCheck;

/**
 * <p>The status of the network interface.</p>
 */
@property (nonatomic, assign) AWSEC2NetworkInterfaceStatus status;

/**
 * <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

/**
 * <p>Describes association information for an Elastic IP address.</p>
 */
@interface AWSEC2InstanceNetworkInterfaceAssociation : AWSModel


/**
 * <p>The ID of the owner of the Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString *ipOwnerId;

/**
 * <p>The public DNS name.</p>
 */
@property (nonatomic, strong) NSString *publicDnsName;

/**
 * <p>The address of the Elastic IP address bound to the network interface.</p>
 */
@property (nonatomic, strong) NSString *publicIp;

@end

/**
 * <p>Describes a network interface attachment.</p>
 */
@interface AWSEC2InstanceNetworkInterfaceAttachment : AWSModel


/**
 * <p>The time stamp when the attachment initiated.</p>
 */
@property (nonatomic, strong) NSDate *attachTime;

/**
 * <p>The ID of the network interface attachment.</p>
 */
@property (nonatomic, strong) NSString *attachmentId;

/**
 * <p>Indicates whether the network interface is deleted when the instance is terminated.</p>
 */
@property (nonatomic, strong) NSNumber *deleteOnTermination;

/**
 * <p>The index of the device on the instance for the network interface attachment.</p>
 */
@property (nonatomic, strong) NSNumber *deviceIndex;

/**
 * <p>The attachment state.</p>
 */
@property (nonatomic, assign) AWSEC2AttachmentStatus status;

@end

/**
 * <p>Describes a network interface.</p>
 */
@interface AWSEC2InstanceNetworkInterfaceSpecification : AWSModel


/**
 * <p>Indicates whether to auto-assign a public IP address to an instance in a VPC. This public IP address can be assigned to the network interface for eth0 only when you launch the instance. You must create the network interface instead of using an existing network interface for eth0, and you must not specify more than one network interface.</p>
 */
@property (nonatomic, strong) NSNumber *associatePublicIpAddress;

/**
 * <p>If set to <code>true</code>, the interface is deleted when the instance is terminated.</p>
 */
@property (nonatomic, strong) NSNumber *deleteOnTermination;
@property (nonatomic, strong) NSString *detail;

/**
 * <p>The index of the device on the instance for the network interface attachment.</p>
 */
@property (nonatomic, strong) NSNumber *deviceIndex;

/**
 * <p>The IDs of the security groups for the network interface.</p>
 */
@property (nonatomic, strong) NSArray *groups;

/**
 * <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

/**
 * <p>The private IP address of the network interface.</p>
 */
@property (nonatomic, strong) NSString *privateIpAddress;

/**
 * <p>One or more private IP addresses to assign to the network interface.</p>
 */
@property (nonatomic, strong) NSArray *privateIpAddresses;

/**
 * <p>The number of secondary private IP addresses.</p>
 */
@property (nonatomic, strong) NSNumber *secondaryPrivateIpAddressCount;

/**
 * <p>The ID of the subnet associated with the network string.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

@end

/**
 * <p>Describes a private IP address.</p>
 */
@interface AWSEC2InstancePrivateIpAddress : AWSModel


/**
 * <p>The association information for an Elastic IP address for the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceNetworkInterfaceAssociation *association;

/**
 * <p>Indicates whether this IP address is the primary private IP address of the network interface.</p>
 */
@property (nonatomic, strong) NSNumber *primary;

/**
 * <p>The private DNS name.</p>
 */
@property (nonatomic, strong) NSString *privateDnsName;

/**
 * <p>The private IP address of the network interface.</p>
 */
@property (nonatomic, strong) NSString *privateIpAddress;

@end

/**
 * <p>Describes the current state of the instance.</p>
 */
@interface AWSEC2InstanceState : AWSModel


/**
 * <p>The low byte represents the state. The high byte is an opaque internal value and should be ignored.</p><ul><li><p><code>0</code> : <code>pending</code></p></li><li><p><code>16</code> : <code>running</code></p></li><li><p><code>32</code> : <code>shutting-down</code></p></li><li><p><code>48</code> : <code>terminated</code></p></li><li><p><code>64</code> : <code>stopping</code></p></li><li><p><code>80</code> : <code>stopped</code></p></li></ul>
 */
@property (nonatomic, strong) NSNumber *code;

/**
 * <p>The current state of the instance.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceStateName name;

@end

/**
 * <p>Describes an instance state change.</p>
 */
@interface AWSEC2InstanceStateChange : AWSModel


/**
 * <p>The current state of the instance.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceState *currentState;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The previous state of the instance.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceState *previousState;

@end

/**
 * <p>Describes the status of an instance.</p>
 */
@interface AWSEC2InstanceStatus : AWSModel


/**
 * <p>The Availability Zone of the instance.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>Extra information regarding events associated with the instance.</p>
 */
@property (nonatomic, strong) NSArray *events;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The intended state of the instance. <a>DescribeInstanceStatus</a> requires that an instance be in the <code>running</code> state.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceState *instanceState;

/**
 * <p>Reports impaired functionality that stems from issues internal to the instance, such as impaired reachability.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceStatusSummary *instanceStatus;

/**
 * <p>Reports impaired functionality that stems from issues related to the systems that support an instance, such as hardware failures and network connectivity problems.</p>
 */
@property (nonatomic, strong) AWSEC2InstanceStatusSummary *systemStatus;

@end

/**
 * <p>Describes the instance status.</p>
 */
@interface AWSEC2InstanceStatusDetails : AWSModel


/**
 * <p>The time when a status check failed. For an instance that was launched and impaired, this is the time when the instance was launched.</p>
 */
@property (nonatomic, strong) NSDate *impairedSince;

/**
 * <p>The type of instance status.</p>
 */
@property (nonatomic, assign) AWSEC2StatusName name;

/**
 * <p>The status.</p>
 */
@property (nonatomic, assign) AWSEC2StatusType status;

@end

/**
 * <p>Describes an instance event.</p>
 */
@interface AWSEC2InstanceStatusEvent : AWSModel


/**
 * <p>The associated code of the event.</p>
 */
@property (nonatomic, assign) AWSEC2EventCode code;
@property (nonatomic, strong) NSString *detail;

/**
 * <p>The latest scheduled end time for the event.</p>
 */
@property (nonatomic, strong) NSDate *notAfter;

/**
 * <p>The earliest scheduled start time for the event.</p>
 */
@property (nonatomic, strong) NSDate *notBefore;

@end

/**
 * <p>Describes the status of an instance.</p>
 */
@interface AWSEC2InstanceStatusSummary : AWSModel


/**
 * <p>The system instance health or application instance health.</p>
 */
@property (nonatomic, strong) NSArray *details;

/**
 * <p>The status.</p>
 */
@property (nonatomic, assign) AWSEC2SummaryStatus status;

@end

/**
 * <p>Describes an Internet gateway.</p>
 */
@interface AWSEC2InternetGateway : AWSModel


/**
 * <p>Any VPCs attached to the Internet gateway.</p>
 */
@property (nonatomic, strong) NSArray *attachments;

/**
 * <p>The ID of the Internet gateway.</p>
 */
@property (nonatomic, strong) NSString *internetGatewayId;

/**
 * <p>Any tags assigned to the Internet gateway.</p>
 */
@property (nonatomic, strong) NSArray *tags;

@end

/**
 * <p>Describes the attachment of a VPC to an Internet gateway.</p>
 */
@interface AWSEC2InternetGatewayAttachment : AWSModel


/**
 * <p>The current state of the attachment.</p>
 */
@property (nonatomic, assign) AWSEC2AttachmentStatus state;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

/**
 * <p>Describes a security group rule.</p>
 */
@interface AWSEC2IpPermission : AWSModel


/**
 * <p>The start of port range for the TCP and UDP protocols, or an ICMP type number. A value of <code>-1</code> indicates all ICMP types.</p>
 */
@property (nonatomic, strong) NSNumber *fromPort;

/**
 * <p>The protocol.</p><p>When you call <a>DescribeSecurityGroups</a>, the protocol value returned is the number. Exception: For TCP, UDP, and ICMP, the value returned is the name (for example, <code>tcp</code>, <code>udp</code>, or <code>icmp</code>). For a list of protocol numbers, see <a href="http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml">Protocol Numbers</a>.</p>
 */
@property (nonatomic, strong) NSString *ipProtocol;

/**
 * <p>One or more IP ranges.</p>
 */
@property (nonatomic, strong) NSArray *ipRanges;

/**
 * <p>The end of port range for the TCP and UDP protocols, or an ICMP code. A value of <code>-1</code> indicates all ICMP codes for the specified ICMP type.</p>
 */
@property (nonatomic, strong) NSNumber *toPort;

/**
 * <p>One or more security group and AWS account ID pairs.</p>
 */
@property (nonatomic, strong) NSArray *userIdGroupPairs;

@end

/**
 * <p>Describes an IP range.</p>
 */
@interface AWSEC2IpRange : AWSModel


/**
 * <p>The CIDR range. You can either specify a CIDR range or a source security group, not both.</p>
 */
@property (nonatomic, strong) NSString *cidrIp;

@end

/**
 * <p>Describes a key pair.</p>
 */
@interface AWSEC2KeyPair : AWSModel


/**
 * <p>The SHA-1 digest of the DER encoded private key.</p>
 */
@property (nonatomic, strong) NSString *keyFingerprint;

/**
 * <p>An unencrypted PEM encoded RSA private key.</p>
 */
@property (nonatomic, strong) NSString *keyMaterial;

/**
 * <p>The name of the key pair.</p>
 */
@property (nonatomic, strong) NSString *keyName;

@end

/**
 * <p>Describes a key pair.</p>
 */
@interface AWSEC2KeyPairInfo : AWSModel


/**
 * <p>If you used <a>CreateKeyPair</a> to create the key pair, this is the SHA-1 digest of the DER encoded private key. If you used <a>ImportKeyPair</a> to provide AWS the public key, this is the MD5 public key fingerprint as specified in section 4 of RFC4716.</p>
 */
@property (nonatomic, strong) NSString *keyFingerprint;

/**
 * <p>The name of the key pair.</p>
 */
@property (nonatomic, strong) NSString *keyName;

@end

@interface AWSEC2LatestDhcpConfiguration : AWSModel

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSArray *values;

@end

/**
 * <p>Describes a launch permission.</p>
 */
@interface AWSEC2LaunchPermission : AWSModel


/**
 * <p>The name of the group.</p>
 */
@property (nonatomic, assign) AWSEC2PermissionGroup group;

/**
 * <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString *userId;

@end

/**
 * <p>Describes a launch permission modification.</p>
 */
@interface AWSEC2LaunchPermissionModifications : AWSModel


/**
 * <p>The AWS account ID to add to the list of launch permissions for the AMI.</p>
 */
@property (nonatomic, strong) NSArray *add;

/**
 * <p>The AWS account ID to remove from the list of launch permissions for the AMI.</p>
 */
@property (nonatomic, strong) NSArray *remove;

@end

/**
 * <p>Describes the launch specification of a Spot Instance.</p>
 */
@interface AWSEC2LaunchSpecification : AWSModel


/**
 * <p></p>
 */
@property (nonatomic, strong) NSString *addressingType;

/**
 * <p>One or more block device mapping entries.</p>
 */
@property (nonatomic, strong) NSArray *blockDeviceMappings;

/**
 * <p>Indicates whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber *ebsOptimized;

/**
 * <p>The IAM instance profile.</p>
 */
@property (nonatomic, strong) AWSEC2IamInstanceProfileSpecification *iamInstanceProfile;

/**
 * <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString *imageId;

/**
 * <p>The instance type.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 * <p>The ID of the kernel.</p>
 */
@property (nonatomic, strong) NSString *kernelId;

/**
 * <p>The name of the key pair.</p>
 */
@property (nonatomic, strong) NSString *keyName;

/**
 * <p>Describes the monitoring for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2RunInstancesMonitoringEnabled *monitoring;

/**
 * <p>One or more network interfaces.</p>
 */
@property (nonatomic, strong) NSArray *networkInterfaces;

/**
 * <p>The placement information for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2SpotPlacement *placement;

/**
 * <p>The ID of the RAM disk.</p>
 */
@property (nonatomic, strong) NSString *ramdiskId;

/**
 * <p>One or more security groups.</p>
 */
@property (nonatomic, strong) NSArray *securityGroups;

/**
 * <p>The ID of the subnet in which to launch the Spot Instance.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

/**
 * <p>The Base64-encoded MIME user data to make available to the instances.</p>
 */
@property (nonatomic, strong) NSString *userData;

@end

@interface AWSEC2ModifyImageAttributeRequest : AWSRequest


/**
 * <p>The name of the attribute to modify.</p>
 */
@property (nonatomic, strong) NSString *attribute;
@property (nonatomic, strong) AWSEC2AttributeValue *detail;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString *imageId;

/**
 * <p></p>
 */
@property (nonatomic, strong) AWSEC2LaunchPermissionModifications *launchPermission;

/**
 * <p>The operation type.</p>
 */
@property (nonatomic, strong) NSString *operationType;

/**
 * <p>One or more product codes. After you add a product code to an AMI, it can't be removed. This is only valid when modifying the <code>productCodes</code> attribute.</p>
 */
@property (nonatomic, strong) NSArray *productCodes;

/**
 * <p>One or more user groups. This is only valid when modifying the <code>launchPermission</code> attribute.</p>
 */
@property (nonatomic, strong) NSArray *userGroups;

/**
 * <p>One or more AWS account IDs. This is only valid when modifying the <code>launchPermission</code> attribute.</p>
 */
@property (nonatomic, strong) NSArray *userIds;

/**
 * <p>The value of the attribute being modified. This is only valid when modifying the <code>description</code> attribute.</p>
 */
@property (nonatomic, strong) NSString *value;

@end

@interface AWSEC2ModifyInstanceAttributeRequest : AWSRequest


/**
 * <p>The name of the attribute.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceAttributeName attribute;

/**
 * <p>Modifies the <code>DeleteOnTermination</code> attribute for volumes that are currently attached. The volume must be owned by the caller. If no value is specified for <code>DeleteOnTermination</code>, the default is <code>true</code> and the volume is deleted when the instance is terminated.</p><p>To add instance store volumes to an Amazon EBS-backed instance, you must add them when you launch the instance. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html#Using_OverridingAMIBDM">Updating the Block Device Mapping when Launching an Instance</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray *blockDeviceMappings;

/**
 * <p>Specifies whether to disable the ability to terminate the instance using the Amazon EC2 console, CLI, and API.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *disableApiTermination;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>Specifies whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *ebsOptimized;

/**
 * <p>[EC2-VPC] Changes the security groups of the instance. You must specify at least one security group, even if it's just the default security group for the VPC. You must specify the security group ID, not the security group name.</p><p>For example, if you want the instance to be in sg-1a1a1a1a and sg-9b9b9b9b, specify <code>GroupId.1=sg-1a1a1a1a</code> and <code>GroupId.2=sg-9b9b9b9b</code>.</p>
 */
@property (nonatomic, strong) NSArray *groups;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>Specifies whether an instance stops or terminates when you initiate shutdown from the instance (using the operating system command for system shutdown).</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue *instanceInitiatedShutdownBehavior;

/**
 * <p>Changes the instance type to the specified value. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a>. If the instance type is not valid, the error returned is <code>InvalidInstanceAttributeValue</code>.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue *instanceType;

/**
 * <p>Changes the instance's kernel to the specified value.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue *kernel;

/**
 * <p>Changes the instance's RAM disk to the specified value.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue *ramdisk;

/**
 * <p>Specifies whether source/destination checking is enabled. A value of <code>true</code> means that checking is enabled, and <code>false</code> means checking is disabled. This value must be <code>false</code> for a NAT instance to perform NAT.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *sourceDestCheck;

/**
 * <p>Set to <code>simple</code> to enable enhanced networking for the instance.</p><p>There is no way to disable enhanced networking at this time.</p><p>This option is supported only for HVM instances. Specifying this option with a PV instance can make it unreachable.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeValue *sriovNetSupport;

/**
 * <p>Changes the instance's user data to the specified value.</p>
 */
@property (nonatomic, strong) AWSEC2BlobAttributeValue *userData;

/**
 * <p>A new value for the attribute. Use only with the <code>kernel</code>, <code>ramdisk</code>, <code>userData</code>, <code>disableApiTermination</code>, or <code>intanceInitiateShutdownBehavior</code> attribute.</p>
 */
@property (nonatomic, strong) NSString *value;

@end

@interface AWSEC2ModifyNetworkInterfaceAttributeRequest : AWSRequest


/**
 * <p>The ID of the interface attachment.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkInterfaceAttachmentChanges *attachment;
@property (nonatomic, strong) AWSEC2AttributeValue *detail;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>Changes the security groups for the network interface. The new set of groups you specify replaces the current set. You must specify at least one group, even if it's just the default security group in the VPC. You must specify the ID of the security group, not the name.</p>
 */
@property (nonatomic, strong) NSArray *groups;

/**
 * <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

/**
 * <p>Indicates whether source/destination checking is enabled. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. This value must be <code>false</code> for a NAT instance to perform NAT. For more information, see <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html">NAT Instances</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *sourceDestCheck;

@end

@interface AWSEC2ModifyReservedInstancesRequest : AWSRequest


/**
 * <p>A unique, case-sensitive token you provide to ensure idempotency of your modification request.</p>
 */
@property (nonatomic, strong) NSString *clientToken;

/**
 * <p>The IDs of the Reserved Instances to modify.</p>
 */
@property (nonatomic, strong) NSArray *reservedInstancesIds;

/**
 * <p>The configuration settings for the Reserved Instances to modify.</p>
 */
@property (nonatomic, strong) NSArray *targetConfigurations;

@end

@interface AWSEC2ModifyReservedInstancesResult : AWSModel


/**
 * <p>The ID for the modification.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesModificationId;

@end

@interface AWSEC2ModifySnapshotAttributeRequest : AWSRequest


/**
 * <p>The snapshot attribute to modify.</p>
 */
@property (nonatomic, assign) AWSEC2SnapshotAttributeName attribute;

/**
 * <p>A JSON representation of the snapshot attribute modification.</p>
 */
@property (nonatomic, strong) AWSEC2CreateVolumePermissionModifications *createVolumePermission;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The group to modify for the snapshot.</p>
 */
@property (nonatomic, strong) NSArray *groupNames;

/**
 * <p>The type of operation to perform to the attribute.</p>
 */
@property (nonatomic, strong) NSString *operationType;

/**
 * <p>The ID of the snapshot.</p>
 */
@property (nonatomic, strong) NSString *snapshotId;

/**
 * <p>The account ID to modify for the snapshot.</p>
 */
@property (nonatomic, strong) NSArray *userIds;

@end

@interface AWSEC2ModifySubnetAttributeRequest : AWSRequest

@property (nonatomic, strong) AWSEC2AttributeBooleanValue *mapPublicIpOnLaunch;

/**
 * <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

@end

@interface AWSEC2ModifyVolumeAttributeRequest : AWSRequest


/**
 * <p>Indicates whether the volume should be auto-enabled for I/O operations.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *autoEnableIO;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

@end

@interface AWSEC2ModifyVpcAttributeRequest : AWSRequest


/**
 * <p>Indicates whether the instances launched in the VPC get DNS hostnames. If this attribute is <code>true</code>, instances in the VPC get DNS hostnames; otherwise, they do not.</p><p>You can only set <code>enableDnsHostnames</code> to <code>true</code> if you also set the <code>EnableDnsSupport</code> attribute to <code>true</code>.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *enableDnsHostnames;

/**
 * <p>Indicates whether the DNS resolution is supported for the VPC. If this attribute is <code>false</code>, the Amazon provided DNS service in the VPC that resolves public DNS hostnames to IP addresses is not enabled. If this attribute is <code>true</code>, queries to the Amazon provided DNS server at the 169.254.169.253 IP address, or the reserved IP address at the base of the VPC network range "plus two" will succeed.</p>
 */
@property (nonatomic, strong) AWSEC2AttributeBooleanValue *enableDnsSupport;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

@interface AWSEC2MonitorInstancesRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray *instanceIds;

@end

@interface AWSEC2MonitorInstancesResult : AWSModel


/**
 * <p>Monitoring information for one or more instances.</p>
 */
@property (nonatomic, strong) NSArray *instanceMonitorings;

@end

/**
 * <p>Describes the monitoring for the instance.</p>
 */
@interface AWSEC2Monitoring : AWSModel


/**
 * <p>Indicates whether monitoring is enabled for the instance.</p>
 */
@property (nonatomic, assign) AWSEC2MonitoringState state;

@end

/**
 * <p>Describes a network ACL.</p>
 */
@interface AWSEC2NetworkAcl : AWSModel


/**
 * <p>Any associations between the network ACL and one or more subnets</p>
 */
@property (nonatomic, strong) NSArray *associations;

/**
 * <p>One or more entries (rules) in the network ACL.</p>
 */
@property (nonatomic, strong) NSArray *entries;

/**
 * <p>Indicates whether this is the default network ACL for the VPC.</p>
 */
@property (nonatomic, strong) NSNumber *isDefault;

/**
 * <p>The ID of the network ACL.</p>
 */
@property (nonatomic, strong) NSString *networkAclId;

/**
 * <p>Any tags assigned to the network ACL.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The ID of the VPC for the network ACL.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

/**
 * <p>Describes an association between a network ACL and a subnet.</p>
 */
@interface AWSEC2NetworkAclAssociation : AWSModel


/**
 * <p>The ID of the association between a network ACL and a subnet.</p>
 */
@property (nonatomic, strong) NSString *networkAclAssociationId;

/**
 * <p>The ID of the network ACL.</p>
 */
@property (nonatomic, strong) NSString *networkAclId;

/**
 * <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

@end

/**
 * <p>Describes an entry in a network ACL.</p>
 */
@interface AWSEC2NetworkAclEntry : AWSModel


/**
 * <p>The network range to allow or deny, in CIDR notation.</p>
 */
@property (nonatomic, strong) NSString *cidrBlock;

/**
 * <p>Indicates whether the rule is an egress rule (applied to traffic leaving the subnet).</p>
 */
@property (nonatomic, strong) NSNumber *egress;

/**
 * <p>ICMP protocol: The ICMP type and code.</p>
 */
@property (nonatomic, strong) AWSEC2IcmpTypeCode *icmpTypeCode;

/**
 * <p>TCP or UDP protocols: The range of ports the rule applies to.</p>
 */
@property (nonatomic, strong) AWSEC2PortRange *portRange;

/**
 * <p>The protocol. A value of <code>-1</code> means all protocols.</p>
 */
@property (nonatomic, strong) NSString *protocol;

/**
 * <p>Indicates whether to allow or deny the traffic that matches the rule.</p>
 */
@property (nonatomic, assign) AWSEC2RuleAction ruleAction;

/**
 * <p>The rule number for the entry. ACL entries are processed in ascending order by rule number.</p>
 */
@property (nonatomic, strong) NSNumber *ruleNumber;

@end

/**
 * <p>Describes a network interface.</p>
 */
@interface AWSEC2NetworkInterface : AWSModel


/**
 * <p>The association information for an Elastic IP associated with the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkInterfaceAssociation *association;

/**
 * <p>The network interface attachment.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkInterfaceAttachment *attachment;

/**
 * <p>The Availability Zone.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;
@property (nonatomic, strong) NSString *detail;

/**
 * <p>Any security groups for the network interface.</p>
 */
@property (nonatomic, strong) NSArray *groups;

/**
 * <p>The MAC address.</p>
 */
@property (nonatomic, strong) NSString *macAddress;

/**
 * <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

/**
 * <p>The AWS account ID of the owner of the network interface.</p>
 */
@property (nonatomic, strong) NSString *ownerId;

/**
 * <p>The private DNS name.</p>
 */
@property (nonatomic, strong) NSString *privateDnsName;

/**
 * <p>The IP address of the network interface within the subnet.</p>
 */
@property (nonatomic, strong) NSString *privateIpAddress;

/**
 * <p>The private IP addresses associated with the network interface.</p>
 */
@property (nonatomic, strong) NSArray *privateIpAddresses;

/**
 * <p>The ID of the entity that launched the instance on your behalf (for example, AWS Management Console or Auto Scaling).</p>
 */
@property (nonatomic, strong) NSString *requesterId;

/**
 * <p>Indicates whether the network interface is being managed by AWS.</p>
 */
@property (nonatomic, strong) NSNumber *requesterManaged;

/**
 * <p>Indicates whether traffic to or from the instance is validated.</p>
 */
@property (nonatomic, strong) NSNumber *sourceDestCheck;

/**
 * <p>The status of the network interface.</p>
 */
@property (nonatomic, assign) AWSEC2NetworkInterfaceStatus status;

/**
 * <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

/**
 * <p>Any tags assigned to the network interface.</p>
 */
@property (nonatomic, strong) NSArray *tagSet;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

/**
 * <p>Describes association information for an Elastic IP address.</p>
 */
@interface AWSEC2NetworkInterfaceAssociation : AWSModel


/**
 * <p>The allocation ID.</p>
 */
@property (nonatomic, strong) NSString *allocationId;

/**
 * <p>The association ID.</p>
 */
@property (nonatomic, strong) NSString *associationId;

/**
 * <p>The ID of the Elastic IP address owner.</p>
 */
@property (nonatomic, strong) NSString *ipOwnerId;

/**
 * <p>The public DNS name.</p>
 */
@property (nonatomic, strong) NSString *publicDnsName;

/**
 * <p>The address of the Elastic IP address bound to the network interface.</p>
 */
@property (nonatomic, strong) NSString *publicIp;

@end

/**
 * <p>Describes a network interface attachment.</p>
 */
@interface AWSEC2NetworkInterfaceAttachment : AWSModel


/**
 * <p>The timestamp indicating when the attachment initiated.</p>
 */
@property (nonatomic, strong) NSDate *attachTime;

/**
 * <p>The ID of the network interface attachment.</p>
 */
@property (nonatomic, strong) NSString *attachmentId;

/**
 * <p>Indicates whether the network interface is deleted when the instance is terminated.</p>
 */
@property (nonatomic, strong) NSNumber *deleteOnTermination;

/**
 * <p>The device index of the network interface attachment on the instance.</p>
 */
@property (nonatomic, strong) NSNumber *deviceIndex;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The AWS account ID of the owner of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceOwnerId;

/**
 * <p>The attachment state.</p>
 */
@property (nonatomic, assign) AWSEC2AttachmentStatus status;

@end

/**
 * <p>Describes an attachment change.</p>
 */
@interface AWSEC2NetworkInterfaceAttachmentChanges : AWSModel


/**
 * <p>The ID of the network interface attachment.</p>
 */
@property (nonatomic, strong) NSString *attachmentId;

/**
 * <p>Indicates whether the network interface is deleted when the instance is terminated.</p>
 */
@property (nonatomic, strong) NSNumber *deleteOnTermination;

@end

/**
 * <p>Describes the private IP address of a network interface.</p>
 */
@interface AWSEC2NetworkInterfacePrivateIpAddress : AWSModel


/**
 * <p>The association information for an Elastic IP address associated with the network interface.</p>
 */
@property (nonatomic, strong) AWSEC2NetworkInterfaceAssociation *association;

/**
 * <p>Indicates whether this IP address is the primary private IP address of the network interface.</p>
 */
@property (nonatomic, strong) NSNumber *primary;

/**
 * <p>The private DNS name.</p>
 */
@property (nonatomic, strong) NSString *privateDnsName;

/**
 * <p>The private IP address.</p>
 */
@property (nonatomic, strong) NSString *privateIpAddress;

@end

/**
 * <p>Describes the placement for the instance.</p>
 */
@interface AWSEC2Placement : AWSModel


/**
 * <p>The Availability Zone of the instance.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>The name of the placement group the instance is in (for cluster compute instances).</p>
 */
@property (nonatomic, strong) NSString *groupName;

/**
 * <p>The tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of <code>dedicated</code> runs on single-tenant hardware.</p>
 */
@property (nonatomic, assign) AWSEC2Tenancy tenancy;

@end

/**
 * <p>Describes a placement group.</p>
 */
@interface AWSEC2PlacementGroup : AWSModel


/**
 * <p>The name of the placement group.</p>
 */
@property (nonatomic, strong) NSString *groupName;

/**
 * <p>The state of the placement group.</p>
 */
@property (nonatomic, assign) AWSEC2PlacementGroupState state;

/**
 * <p>The placement strategy.</p>
 */
@property (nonatomic, assign) AWSEC2PlacementStrategy strategy;

@end

/**
 * <p>Describes a range of ports.</p>
 */
@interface AWSEC2PortRange : AWSModel


/**
 * <p>The first port in the range.</p>
 */
@property (nonatomic, strong) NSNumber *from;

/**
 * <p>The last port in the range.</p>
 */
@property (nonatomic, strong) NSNumber *to;

@end

/**
 * <p>Describes the price for a Reserved Instance.</p>
 */
@interface AWSEC2PriceSchedule : AWSModel


/**
 * <p>The current price schedule, as determined by the term remaining for the Reserved Instance in the listing.</p><p>A specific price schedule is always in effect, but only one price schedule can be active at any time. Take, for example, a Reserved Instance listing that has five months remaining in its term. When you specify price schedules for five months and two months, this means that schedule 1, covering the first three months of the remaining term, will be active during months 5, 4, and 3. Then schedule 2, covering the last two months of the term, will be active for months 2 and 1.</p>
 */
@property (nonatomic, strong) NSNumber *active;

/**
 * <p>The currency for transacting the Reserved Instance resale. At this time, the only supported currency is <code>USD</code>.</p>
 */
@property (nonatomic, assign) AWSEC2CurrencyCodeValues currencyCode;

/**
 * <p>The fixed price for the term.</p>
 */
@property (nonatomic, strong) NSNumber *price;

/**
 * <p>The number of months remaining in the reservation. For example, 2 is the second to the last month before the capacity reservation expires.</p>
 */
@property (nonatomic, strong) NSNumber *term;

@end

/**
 * <p>Describes the price for a Reserved Instance.</p>
 */
@interface AWSEC2PriceScheduleSpecification : AWSModel


/**
 * <p>The currency for transacting the Reserved Instance resale. At this time, the only supported currency is <code>USD</code>.</p>
 */
@property (nonatomic, assign) AWSEC2CurrencyCodeValues currencyCode;

/**
 * <p>The fixed price for the term.</p>
 */
@property (nonatomic, strong) NSNumber *price;

/**
 * <p>The number of months remaining in the reservation. For example, 2 is the second to the last month before the capacity reservation expires.</p>
 */
@property (nonatomic, strong) NSNumber *term;

@end

/**
 * <p>Describes a Reserved Instance offering.</p>
 */
@interface AWSEC2PricingDetail : AWSModel


/**
 * <p>The number of instances available for the price.</p>
 */
@property (nonatomic, strong) NSNumber *count;

/**
 * <p>The price per instance.</p>
 */
@property (nonatomic, strong) NSNumber *price;

@end

/**
 * <p>Describes a secondary private IP address for a network interface.</p>
 * Required parameters: [PrivateIpAddress]
 */
@interface AWSEC2PrivateIpAddressSpecification : AWSModel


/**
 * <p>Indicates whether the private IP address is the primary private IP address.</p>
 */
@property (nonatomic, strong) NSNumber *primary;

/**
 * <p>The private IP addresses.</p>
 */
@property (nonatomic, strong) NSString *privateIpAddress;

@end

/**
 * <p>Describes a product code.</p>
 */
@interface AWSEC2ProductCode : AWSModel


/**
 * <p>The product code.</p>
 */
@property (nonatomic, strong) NSString *productCodeId;

/**
 * <p>The type of product code.</p>
 */
@property (nonatomic, assign) AWSEC2ProductCodeValues productCodeType;

@end

/**
 * <p>Describes a virtual private gateway propagating route.</p>
 */
@interface AWSEC2PropagatingVgw : AWSModel


/**
 * <p>The ID of the virtual private gateway (VGW).</p>
 */
@property (nonatomic, strong) NSString *gatewayId;

@end

@interface AWSEC2PurchaseReservedInstancesOfferingRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The number of Reserved Instances to purchase.</p>
 */
@property (nonatomic, strong) NSNumber *instanceCount;

/**
 * <p>Specified for Reserved Instance Marketplace offerings to limit the total order and ensure that the Reserved Instances are not purchased at unexpected prices.</p>
 */
@property (nonatomic, strong) AWSEC2ReservedInstanceLimitPrice *limitPrice;

/**
 * <p>The ID of the Reserved Instance offering to purchase.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesOfferingId;

@end

@interface AWSEC2PurchaseReservedInstancesOfferingResult : AWSModel


/**
 * <p>The IDs of the purchased Reserved Instances.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesId;

@end

@interface AWSEC2RebootInstancesRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray *instanceIds;

@end

/**
 * <p>Describes a recurring charge.</p>
 */
@interface AWSEC2RecurringCharge : AWSModel


/**
 * <p>The amount of the recurring charge.</p>
 */
@property (nonatomic, strong) NSNumber *amount;

/**
 * <p>The frequency of the recurring charge.</p>
 */
@property (nonatomic, assign) AWSEC2RecurringChargeFrequency frequency;

@end

/**
 * <p>Describes a region.</p>
 */
@interface AWSEC2Region : AWSModel


/**
 * <p>The region service endpoint.</p>
 */
@property (nonatomic, strong) NSString *endpoint;

/**
 * <p>The name of the region.</p>
 */
@property (nonatomic, strong) NSString *regionName;

@end

@interface AWSEC2RegisterImageRequest : AWSRequest


/**
 * <p>The architecture of the AMI.</p><p>Default: For Amazon EBS-backed AMIs, <code>i386</code>. For instance store-backed AMIs, the architecture specified in the manifest file.</p>
 */
@property (nonatomic, assign) AWSEC2ArchitectureValues architecture;

/**
 * <p>One or more block device mapping entries.</p>
 */
@property (nonatomic, strong) NSArray *blockDeviceMappings;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The full path to your AMI manifest in Amazon S3 storage.</p>
 */
@property (nonatomic, strong) NSString *imageLocation;

/**
 * <p>The ID of the kernel.</p>
 */
@property (nonatomic, strong) NSString *kernelId;

/**
 * <p>A name for your AMI.</p><p>Constraints: 3-128 alphanumeric characters, parenthesis (()), commas (,), slashes (/), dashes (-), or underscores (_)</p>
 */
@property (nonatomic, strong) NSString *name;

/**
 * <p>The ID of the RAM disk.</p>
 */
@property (nonatomic, strong) NSString *ramdiskId;

/**
 * <p>The name of the root device (for example, <code>/dev/sda1</code>, or <code>xvda</code>).</p>
 */
@property (nonatomic, strong) NSString *rootDeviceName;

/**
 * <p>Set to <code>simple</code> to enable enhanced networking for the AMI and any instances that you launch from the AMI.</p><p>There is no way to disable enhanced networking at this time.</p><p>This option is supported only for HVM AMIs. Specifying this option with a PV AMI can make instances launched from the AMI unreachable.</p>
 */
@property (nonatomic, strong) NSString *sriovNetSupport;

/**
 * <p>The type of virtualization.</p><p>Default: <code>paravirtual</code></p>
 */
@property (nonatomic, strong) NSString *virtualizationType;

@end

@interface AWSEC2RegisterImageResult : AWSModel


/**
 * <p>The ID of the newly registered AMI.</p>
 */
@property (nonatomic, strong) NSString *imageId;

@end

@interface AWSEC2RejectVpcPeeringConnectionRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString *vpcPeeringConnectionId;

@end

@interface AWSEC2RejectVpcPeeringConnectionResult : AWSModel

@property (nonatomic, strong) NSNumber *returned;

@end

@interface AWSEC2ReleaseAddressRequest : AWSRequest


/**
 * <p>[EC2-VPC] The allocation ID.</p>
 */
@property (nonatomic, strong) NSString *allocationId;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>[EC2-Classic] The Elastic IP address.</p>
 */
@property (nonatomic, strong) NSString *publicIp;

@end

@interface AWSEC2ReplaceNetworkAclAssociationRequest : AWSRequest


/**
 * <p>The ID of the current association between the original network ACL and the subnet.</p>
 */
@property (nonatomic, strong) NSString *associationId;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the new ACL to associate with the subnet.</p>
 */
@property (nonatomic, strong) NSString *networkAclId;

@end

@interface AWSEC2ReplaceNetworkAclAssociationResult : AWSModel

@property (nonatomic, strong) NSString *latestAssociationId;

@end

@interface AWSEC2ReplaceNetworkAclEntryRequest : AWSRequest


/**
 * <p>The network range to allow or deny, in CIDR notation.</p>
 */
@property (nonatomic, strong) NSString *cidrBlock;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>Indicates whether to replace the egress rule.</p><p>Default: If no value is specified, we replace the ingress rule.</p>
 */
@property (nonatomic, strong) NSNumber *egress;

/**
 * <p>ICMP protocol: The ICMP type and code.</p>
 */
@property (nonatomic, strong) AWSEC2IcmpTypeCode *icmpTypeCode;

/**
 * <p>The ID of the ACL.</p>
 */
@property (nonatomic, strong) NSString *networkAclId;

/**
 * <p>TCP or UDP protocols: The range of ports the rule applies to.</p>
 */
@property (nonatomic, strong) AWSEC2PortRange *portRange;

/**
 * <p>The IP protocol. You can specify <code>all</code> or <code>-1</code> to mean all protocols.</p>
 */
@property (nonatomic, strong) NSString *protocol;

/**
 * <p>Indicates whether to allow or deny the traffic that matches the rule.</p>
 */
@property (nonatomic, assign) AWSEC2RuleAction ruleAction;

/**
 * <p>The rule number of the entry to replace.</p>
 */
@property (nonatomic, strong) NSNumber *ruleNumber;

@end

@interface AWSEC2ReplaceRouteRequest : AWSRequest


/**
 * <p>The CIDR address block used for the destination match. The value you provide must match the CIDR of an existing route in the table.</p>
 */
@property (nonatomic, strong) NSString *destinationCidrBlock;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of an Internet gateway attached to your VPC.</p>
 */
@property (nonatomic, strong) NSString *gatewayId;

/**
 * <p>The ID of a NAT instance in your VPC.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The ID of a network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

/**
 * <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString *routeTableId;

/**
 * <p>The ID of a VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString *vpcPeeringConnectionId;

@end

@interface AWSEC2ReplaceRouteTableAssociationRequest : AWSRequest


/**
 * <p>The association ID.</p>
 */
@property (nonatomic, strong) NSString *associationId;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the new route table to associate with the subnet.</p>
 */
@property (nonatomic, strong) NSString *routeTableId;

@end

@interface AWSEC2ReplaceRouteTableAssociationResult : AWSModel

@property (nonatomic, strong) NSString *latestAssociationId;

@end

@interface AWSEC2ReplicateImageRequest : AWSRequest


/**
 * <p>Unique, case-sensitive identifier you provide to ensure idempotency of the request. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How to Ensure Idempotency</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString *clientToken;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The name of the new AMI in the destination region.</p>
 */
@property (nonatomic, strong) NSString *name;

/**
 * <p>The ID of the AMI to copy.</p>
 */
@property (nonatomic, strong) NSString *sourceImageId;

/**
 * <p>The name of the region that contains the AMI to copy.</p>
 */
@property (nonatomic, strong) NSString *sourceRegion;

@end

@interface AWSEC2ReplicateImageResult : AWSModel


/**
 * <p>The ID of the new AMI.</p>
 */
@property (nonatomic, strong) NSString *imageId;

@end

@interface AWSEC2ReplicateSnapshotRequest : AWSRequest


/**
 * <p>The destination region of the snapshot copy operation. This parameter is required in the <code>PresignedUrl</code>.</p>
 */
@property (nonatomic, strong) NSString *destinationRegion;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The pre-signed URL that facilitates copying an encrypted snapshot. This parameter is only required when copying an encrypted snapshot with the Amazon EC2 Query API; it is available as an optional parameter in all other cases. The <code>PresignedUrl</code> should use the snapshot source endpoint, the <code>CopySnapshot</code> action, and include the <code>SourceRegion</code>, <code>SourceSnapshotId</code>, and <code>DestinationRegion</code> parameters. The <code>PresignedUrl</code> must be signed using AWS Signature Version 4. Because Amazon EBS snapshots are stored in Amazon S3, the signing algorithm for this parameter uses the same logic that is described in <a href="http://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html">Authenticating Requests by Using Query Parameters (AWS Signature Version 4)</a> in the <i>Amazon Simple Storage Service API Reference</i>. An invalid or improperly signed <code>PresignedUrl</code> will cause the copy operation to fail asynchronously, and the snapshot will move to an <code>error</code> state.</p>
 */
@property (nonatomic, strong) NSString *presignedUrl;

/**
 * <p>The ID of the region that contains the snapshot to be copied.</p>
 */
@property (nonatomic, strong) NSString *sourceRegion;

/**
 * <p>The ID of the Amazon EBS snapshot to copy.</p>
 */
@property (nonatomic, strong) NSString *sourceSnapshotId;

@end

@interface AWSEC2ReplicateSnapshotResult : AWSModel


/**
 * <p>The ID of the new snapshot.</p>
 */
@property (nonatomic, strong) NSString *snapshotId;

@end

@interface AWSEC2ReportInstanceStatusRequest : AWSRequest

@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The time at which the reported instance health state ended.</p>
 */
@property (nonatomic, strong) NSDate *endTime;

/**
 * <p>One or more instances.</p>
 */
@property (nonatomic, strong) NSArray *instances;

/**
 * <p>One or more reason codes that describes the health state of your instance.</p><ul><li><p><code>instance-stuck-in-state</code>: My instance is stuck in a state.</p></li><li><p><code>unresponsive</code>: My instance is unresponsive.</p></li><li><p><code>not-accepting-credentials</code>: My instance is not accepting my credentials.</p></li><li><p><code>password-not-available</code>: A password is not available for my instance.</p></li><li><p><code>performance-network</code>: My instance is experiencing performance problems which I believe are network related.</p></li><li><p><code>performance-instance-store</code>: My instance is experiencing performance problems which I believe are related to the instance stores.</p></li><li><p><code>performance-ebs-volume</code>: My instance is experiencing performance problems which I believe are related to an EBS volume.</p></li><li><p><code>performance-other</code>: My instance is experiencing performance problems.</p></li><li><p><code>other</code>: [explain using the description parameter]</p></li></ul>
 */
@property (nonatomic, strong) NSArray *reasonCodes;

/**
 * <p>The time at which the reported instance health state began.</p>
 */
@property (nonatomic, strong) NSDate *startTime;

/**
 * <p>The status of all instances listed.</p>
 */
@property (nonatomic, assign) AWSEC2ReportStatusType status;

@end

@interface AWSEC2RequestSpotInstancesRequest : AWSRequest


/**
 * <p>The user-specified name for a logical grouping of bids.</p><p>When you specify an Availability Zone group in a Spot Instance request, all Spot Instances in the request are launched in the same Availability Zone. Instance proximity is maintained with this parameter, but the choice of Availability Zone is not. The group applies only to bids for Spot Instances of the same instance type. Any additional Spot Instance requests that are specified with the same Availability Zone group name are launched in that same Availability Zone, as long as at least one instance from the group is still active.</p><p>If there is no active instance running in the Availability Zone group that you specify for a new Spot Instance request (all instances are terminated, the bid is expired, or the bid falls below current market), then Amazon EC2 launches the instance in any Availability Zone where the constraint can be met. Consequently, the subsequent set of Spot Instances could be placed in a different zone from the original request, even if you specified the same Availability Zone group.</p><p>Default: Instances are launched in any available Availability Zone.</p>
 */
@property (nonatomic, strong) NSString *availabilityZoneGroup;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The maximum number of Spot Instances to launch.</p><p>Default: 1</p>
 */
@property (nonatomic, strong) NSNumber *instanceCount;

/**
 * <p>The instance launch group. Launch groups are Spot Instances that launch together and terminate together.</p><p>Default: Instances are launched and terminated individually</p>
 */
@property (nonatomic, strong) NSString *launchGroup;

/**
 * <p>Describes the launch specification of a Spot Instance.</p>
 */
@property (nonatomic, strong) AWSEC2RequestSpotLaunchSpecification *launchSpecification;

/**
 * <p>The maximum hourly price for any Spot Instance launched to fulfill the request.</p>
 */
@property (nonatomic, strong) NSString *spotPrice;

/**
 * <p>The Spot Instance request type.</p><p>Default: <code>one-time</code></p>
 */
@property (nonatomic, assign) AWSEC2SpotInstanceType type;

/**
 * <p>The start date of the request. If this is a one-time request, the request becomes active at this date and time and remains active until all instances launch, the request expires, or the request is canceled. If the request is persistent, the request becomes active at this date and time and remains active until it expires or is canceled.</p><p>Default: The request is effective indefinitely.</p>
 */
@property (nonatomic, strong) NSDate *validFrom;

/**
 * <p>The end date of the request. If this is a one-time request, the request remains active until all instances launch, the request is canceled, or this date is reached. If the request is persistent, it remains active until it is canceled or this date and time is reached.</p><p>Default: The request is effective indefinitely.</p>
 */
@property (nonatomic, strong) NSDate *validUntil;

@end

@interface AWSEC2RequestSpotInstancesResult : AWSModel


/**
 * <p>Information about the Spot Instance request.</p>
 */
@property (nonatomic, strong) NSArray *spotInstanceRequests;

@end

/**
 * <p>Describes the launch specification of a Spot Instance.</p>
 */
@interface AWSEC2RequestSpotLaunchSpecification : AWSModel


/**
 * <p></p>
 */
@property (nonatomic, strong) NSString *addressingType;

/**
 * <p>One or more block device mapping entries.</p>
 */
@property (nonatomic, strong) NSArray *blockDeviceMappings;

/**
 * <p>Indicates whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS Optimized instance.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber *ebsOptimized;

/**
 * <p>The IAM instance profile.</p>
 */
@property (nonatomic, strong) AWSEC2IamInstanceProfileSpecification *iamInstanceProfile;

/**
 * <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString *imageId;

/**
 * <p>The instance type.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 * <p>The ID of the kernel.</p>
 */
@property (nonatomic, strong) NSString *kernelId;

/**
 * <p>The name of the key pair.</p>
 */
@property (nonatomic, strong) NSString *keyName;

/**
 * <p>Describes the monitoring for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2RunInstancesMonitoringEnabled *monitoring;

/**
 * <p>One or more network interfaces.</p>
 */
@property (nonatomic, strong) NSArray *networkInterfaces;

/**
 * <p>The placement information for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2SpotPlacement *placement;

/**
 * <p>The ID of the RAM disk.</p>
 */
@property (nonatomic, strong) NSString *ramdiskId;
@property (nonatomic, strong) NSArray *securityGroupIds;
@property (nonatomic, strong) NSArray *securityGroups;

/**
 * <p>The ID of the subnet in which to launch the Spot Instance.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

/**
 * <p>The Base64-encoded MIME user data to make available to the instances.</p>
 */
@property (nonatomic, strong) NSString *userData;

@end

/**
 * <p>Describes a reservation.</p>
 */
@interface AWSEC2Reservation : AWSModel


/**
 * <p>One or more security groups.</p>
 */
@property (nonatomic, strong) NSArray *groups;

/**
 * <p>One or more instances.</p>
 */
@property (nonatomic, strong) NSArray *instances;

/**
 * <p>The ID of the AWS account that owns the reservation.</p>
 */
@property (nonatomic, strong) NSString *ownerId;

/**
 * <p>The ID of the requester that launched the instances on your behalf (for example, AWS Management Console or Auto Scaling).</p>
 */
@property (nonatomic, strong) NSString *requesterId;

/**
 * <p>The ID of the reservation.</p>
 */
@property (nonatomic, strong) NSString *reservationId;

@end

/**
 * <p>Describes the limit price of a Reserved Instance offering.</p>
 */
@interface AWSEC2ReservedInstanceLimitPrice : AWSModel


/**
 * <p>Used for Reserved Instance Marketplace offerings. Specifies the limit price on the total order (instanceCount * price).</p>
 */
@property (nonatomic, strong) NSNumber *amount;

/**
 * <p>The currency in which the <code>limitPrice</code> amount is specified. At this time, the only supported currency is <code>USD</code>.</p>
 */
@property (nonatomic, assign) AWSEC2CurrencyCodeValues currencyCode;

@end

/**
 * <p>Describes a Reserved Instance.</p>
 */
@interface AWSEC2ReservedInstances : AWSModel


/**
 * <p>The Availability Zone in which the Reserved Instance can be used.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>The currency of the Reserved Instance. It's specified using ISO 4217 standard currency codes. At this time, the only supported currency is <code>USD</code>.</p>
 */
@property (nonatomic, assign) AWSEC2CurrencyCodeValues currencyCode;

/**
 * <p>The duration of the Reserved Instance, in seconds.</p>
 */
@property (nonatomic, strong) NSNumber *duration;

/**
 * <p>The time when the Reserved Instance expires.</p>
 */
@property (nonatomic, strong) NSDate *end;

/**
 * <p>The purchase price of the Reserved Instance.</p>
 */
@property (nonatomic, strong) NSNumber *fixedPrice;

/**
 * <p>The number of Reserved Instances purchased.</p>
 */
@property (nonatomic, strong) NSNumber *instanceCount;

/**
 * <p>The tenancy of the reserved instance.</p>
 */
@property (nonatomic, assign) AWSEC2Tenancy instanceTenancy;

/**
 * <p>The instance type on which the Reserved Instance can be used.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 * <p>The Reserved Instance offering type.</p>
 */
@property (nonatomic, assign) AWSEC2OfferingTypeValues offeringType;

/**
 * <p>The Reserved Instance description.</p>
 */
@property (nonatomic, assign) AWSEC2RIProductDescription productDescription;

/**
 * <p>The recurring charge tag assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray *recurringCharges;

/**
 * <p>The ID of the Reserved Instance.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesId;

/**
 * <p>The date and time the Reserved Instance started.</p>
 */
@property (nonatomic, strong) NSDate *start;

/**
 * <p>The state of the Reserved Instance purchase.</p>
 */
@property (nonatomic, assign) AWSEC2ReservedInstanceState state;

/**
 * <p>Any tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The usage price of the Reserved Instance, per hour.</p>
 */
@property (nonatomic, strong) NSNumber *usagePrice;

@end

/**
 * <p>Describes the configuration settings for the modified Reserved Instances.</p>
 */
@interface AWSEC2ReservedInstancesConfiguration : AWSModel


/**
 * <p>The Availability Zone for the modified Reserved Instances.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>The number of modified Reserved Instances.</p>
 */
@property (nonatomic, strong) NSNumber *instanceCount;

/**
 * <p>The instance type for the modified Reserved Instances.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 * <p>The network platform of the modified Reserved Instances, which is either EC2-Classic or EC2-VPC.</p>
 */
@property (nonatomic, strong) NSString *platform;

@end

/**
 * <p>Describes the ID of a Reserved Instance.</p>
 */
@interface AWSEC2ReservedInstancesId : AWSModel


/**
 * <p>The ID of the Reserved Instance.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesId;

@end

/**
 * <p>Describes a Reserved Instance listing.</p>
 */
@interface AWSEC2ReservedInstancesListing : AWSModel


/**
 * <p>The idempotency token you provided when you created the listing.</p>
 */
@property (nonatomic, strong) NSString *clientToken;

/**
 * <p>The time the listing was created.</p>
 */
@property (nonatomic, strong) NSDate *createDate;

/**
 * <p>The number of instances in this state.</p>
 */
@property (nonatomic, strong) NSArray *instanceCounts;

/**
 * <p>The price of the Reserved Instance listing.</p>
 */
@property (nonatomic, strong) NSArray *priceSchedules;

/**
 * <p>The ID of the Reserved Instance.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesId;

/**
 * <p>The ID of the Reserved Instance listing.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesListingId;

/**
 * <p>The status of the Reserved Instance listing.</p>
 */
@property (nonatomic, assign) AWSEC2ListingStatus status;

/**
 * <p>The reason for the current status of the Reserved Instance listing. The response can be blank.</p>
 */
@property (nonatomic, strong) NSString *statusMessage;

/**
 * <p>Any tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The last modified timestamp of the listing.</p>
 */
@property (nonatomic, strong) NSDate *updateDate;

@end

/**
 * <p>Describes a Reserved Instance modification.</p>
 */
@interface AWSEC2ReservedInstancesModification : AWSModel


/**
 * <p>A unique, case-sensitive key supplied by the client to ensure that the modification request is idempotent.</p>
 */
@property (nonatomic, strong) NSString *clientToken;

/**
 * <p>The time when the modification request was created.</p>
 */
@property (nonatomic, strong) NSDate *createDate;

/**
 * <p>The time for the modification to become effective.</p>
 */
@property (nonatomic, strong) NSDate *effectiveDate;

/**
 * <p>Contains target configurations along with their corresponding new Reserved Instance IDs.</p>
 */
@property (nonatomic, strong) NSArray *modificationResults;

/**
 * <p>The IDs of one or more Reserved Instances.</p>
 */
@property (nonatomic, strong) NSArray *reservedInstancesIds;

/**
 * <p>A unique ID for the Reserved Instance modification.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesModificationId;

/**
 * <p>The status of the Reserved Instances modification request.</p>
 */
@property (nonatomic, strong) NSString *status;

/**
 * <p>The reason for the status.</p>
 */
@property (nonatomic, strong) NSString *statusMessage;

/**
 * <p>The time when the modification request was last updated.</p>
 */
@property (nonatomic, strong) NSDate *updateDate;

@end

@interface AWSEC2ReservedInstancesModificationResult : AWSModel


/**
 * <p>The ID for the Reserved Instances that were created as part of the modification request. This field is only available when the modification is fulfilled.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesId;

/**
 * <p>The target Reserved Instances configurations supplied as part of the modification request.</p>
 */
@property (nonatomic, strong) AWSEC2ReservedInstancesConfiguration *targetConfiguration;

@end

/**
 * <p>Describes a Reserved Instance offering.</p>
 */
@interface AWSEC2ReservedInstancesOffering : AWSModel


/**
 * <p>The Availability Zone in which the Reserved Instance can be used.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>The currency of the Reserved Instance offering you are purchasing. It's specified using ISO 4217 standard currency codes. At this time, the only supported currency is <code>USD</code>.</p>
 */
@property (nonatomic, assign) AWSEC2CurrencyCodeValues currencyCode;

/**
 * <p>The duration of the Reserved Instance, in seconds.</p>
 */
@property (nonatomic, strong) NSNumber *duration;

/**
 * <p>The purchase price of the Reserved Instance.</p>
 */
@property (nonatomic, strong) NSNumber *fixedPrice;

/**
 * <p>The tenancy of the reserved instance.</p>
 */
@property (nonatomic, assign) AWSEC2Tenancy instanceTenancy;

/**
 * <p>The instance type on which the Reserved Instance can be used.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 * <p>Indicates whether the offering is available through the Reserved Instance Marketplace (resale) or AWS. If it's a Reserved Instance Marketplace offering, this is <code>true</code>.</p>
 */
@property (nonatomic, strong) NSNumber *marketplace;

/**
 * <p>The Reserved Instance offering type.</p>
 */
@property (nonatomic, assign) AWSEC2OfferingTypeValues offeringType;

/**
 * <p>The pricing details of the Reserved Instance offering.</p>
 */
@property (nonatomic, strong) NSArray *pricingDetails;

/**
 * <p>The Reserved Instance description.</p>
 */
@property (nonatomic, assign) AWSEC2RIProductDescription productDescription;

/**
 * <p>The recurring charge tag assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray *recurringCharges;

/**
 * <p>The ID of the Reserved Instance offering.</p>
 */
@property (nonatomic, strong) NSString *reservedInstancesOfferingId;

/**
 * <p>The usage price of the Reserved Instance, per hour.</p>
 */
@property (nonatomic, strong) NSNumber *usagePrice;

@end

@interface AWSEC2ResetImageAttributeRequest : AWSRequest


/**
 * <p>The attribute to reset (currently you can only reset the launch permission attribute).</p>
 */
@property (nonatomic, assign) AWSEC2ResetImageAttributeName attribute;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the AMI.</p>
 */
@property (nonatomic, strong) NSString *imageId;

@end

@interface AWSEC2ResetInstanceAttributeRequest : AWSRequest


/**
 * <p>The attribute to reset.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceAttributeName attribute;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

@end

@interface AWSEC2ResetNetworkInterfaceAttributeRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

/**
 * <p>Indicates whether source/destination checking is enabled. A value of <code>true</code> means checking is enabled, and <code>false</code> means checking is disabled. This value must be <code>false</code> for a NAT instance to perform NAT.</p>
 */
@property (nonatomic, strong) NSString *sourceDestCheck;

@end

@interface AWSEC2ResetSnapshotAttributeRequest : AWSRequest


/**
 * <p>The attribute to reset (currently only the attribute for permission to create volumes can be reset).</p>
 */
@property (nonatomic, assign) AWSEC2SnapshotAttributeName attribute;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The ID of the snapshot.</p>
 */
@property (nonatomic, strong) NSString *snapshotId;

@end

@interface AWSEC2RevokeSecurityGroupEgressRequest : AWSRequest


/**
 * <p>The CIDR IP address range. You can't specify this parameter when specifying a source security group.</p>
 */
@property (nonatomic, strong) NSString *cidrIp;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The start of port range for the TCP and UDP protocols, or an ICMP type number. For the ICMP type number, use <code>-1</code> to specify all ICMP types.</p>
 */
@property (nonatomic, strong) NSNumber *fromPort;

/**
 * <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString *groupId;

/**
 * <p></p>
 */
@property (nonatomic, strong) NSArray *ipPermissions;

/**
 * <p>The IP protocol name (<code>tcp</code>, <code>udp</code>, <code>icmp</code>) or number (see <a href="http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml">Protocol Numbers</a>). Use <code>-1</code> to specify all.</p>
 */
@property (nonatomic, strong) NSString *ipProtocol;

/**
 * <p>[EC2-Classic, default VPC] The name of the source security group. You can't specify a source security group and a CIDR IP address range.</p>
 */
@property (nonatomic, strong) NSString *sourceSecurityGroupName;

/**
 * <p>The ID of the source security group. You can't specify a source security group and a CIDR IP address range.</p>
 */
@property (nonatomic, strong) NSString *sourceSecurityGroupOwnerId;

/**
 * <p>The end of port range for the TCP and UDP protocols, or an ICMP code number. For the ICMP code number, use <code>-1</code> to specify all ICMP codes for the ICMP type.</p>
 */
@property (nonatomic, strong) NSNumber *toPort;

@end

@interface AWSEC2RevokeSecurityGroupIngressRequest : AWSRequest


/**
 * <p>The CIDR IP address range. You can't specify this parameter when specifying a source security group.</p>
 */
@property (nonatomic, strong) NSString *cidrIp;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>The start of port range for the TCP and UDP protocols, or an ICMP type number. For the ICMP type number, use <code>-1</code> to specify all ICMP types.</p>
 */
@property (nonatomic, strong) NSNumber *fromPort;

/**
 * <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString *groupId;

/**
 * <p>[EC2-Classic, default VPC] The name of the security group.</p>
 */
@property (nonatomic, strong) NSString *groupName;

/**
 * <p></p>
 */
@property (nonatomic, strong) NSArray *ipPermissions;

/**
 * <p>The IP protocol name (<code>tcp</code>, <code>udp</code>, <code>icmp</code>) or number (see <a href="http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml">Protocol Numbers</a>). Use <code>-1</code> to specify all.</p>
 */
@property (nonatomic, strong) NSString *ipProtocol;

/**
 * <p>[EC2-Classic, default VPC] The name of the source security group. You can't specify a source security group and a CIDR IP address range.</p>
 */
@property (nonatomic, strong) NSString *sourceSecurityGroupName;

/**
 * <p>The ID of the source security group. You can't specify a source security group and a CIDR IP address range.</p>
 */
@property (nonatomic, strong) NSString *sourceSecurityGroupOwnerId;

/**
 * <p>The end of port range for the TCP and UDP protocols, or an ICMP code number. For the ICMP code number, use <code>-1</code> to specify all ICMP codes for the ICMP type.</p>
 */
@property (nonatomic, strong) NSNumber *toPort;

@end

/**
 * <p>Describes a route in a route table.</p>
 */
@interface AWSEC2Route : AWSModel


/**
 * <p>The CIDR block used for the destination match.</p>
 */
@property (nonatomic, strong) NSString *destinationCidrBlock;

/**
 * <p>The ID of a gateway attached to your VPC.</p>
 */
@property (nonatomic, strong) NSString *gatewayId;

/**
 * <p>The ID of a NAT instance in your VPC.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The AWS account ID of the owner of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceOwnerId;

/**
 * <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

/**
 * <p>Describes how the route was created.</p><ul><li><code>CreateRouteTable</code> indicates that route was automatically created when the route table was created.</li><li><code>CreateRoute</code> indicates that the route was manually added to the route table.</li><li><code>EnableVgwRoutePropagation</code> indicates that the route was propagated by route propagation.</li></ul>
 */
@property (nonatomic, assign) AWSEC2RouteOrigin origin;

/**
 * <p>The state of the route. The <code>blackhole</code> state indicates that the route's target isn't available (for example, the specified gateway isn't attached to the VPC, or the specified NAT instance has been terminated).</p>
 */
@property (nonatomic, assign) AWSEC2RouteState state;

/**
 * <p>The ID of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString *vpcPeeringConnectionId;

@end

/**
 * <p>Describes a route table.</p>
 */
@interface AWSEC2RouteTable : AWSModel


/**
 * <p>The associations between the route table and one or more subnets.</p>
 */
@property (nonatomic, strong) NSArray *associations;

/**
 * <p>Any virtual private gateway (VGW) propagating routes.</p>
 */
@property (nonatomic, strong) NSArray *propagatingVgws;

/**
 * <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString *routeTableId;

/**
 * <p>The routes in the route table.</p>
 */
@property (nonatomic, strong) NSArray *routes;

/**
 * <p>Any tags assigned to the route table.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

/**
 * <p>Describes an association between a route table and a subnet.</p>
 */
@interface AWSEC2RouteTableAssociation : AWSModel


/**
 * <p>Indicates whether this is the main route table.</p>
 */
@property (nonatomic, strong) NSNumber *main;

/**
 * <p>The ID of the association between a route table and a subnet.</p>
 */
@property (nonatomic, strong) NSString *routeTableAssociationId;

/**
 * <p>The ID of the route table.</p>
 */
@property (nonatomic, strong) NSString *routeTableId;

/**
 * <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

@end

/**
 * <p>Describes the monitoring for the instance.</p>
 * Required parameters: [Enabled]
 */
@interface AWSEC2RunInstancesMonitoringEnabled : AWSModel


/**
 * <p>Indicates whether monitoring is enabled for the instance.</p>
 */
@property (nonatomic, strong) NSNumber *enabled;

@end

@interface AWSEC2RunInstancesRequest : AWSRequest


/**
 * <p>Reserved.</p>
 */
@property (nonatomic, strong) NSString *additionalInfo;

/**
 * <p>The block device mapping.</p>
 */
@property (nonatomic, strong) NSArray *blockDeviceMappings;

/**
 * <p>Unique, case-sensitive identifier you provide to ensure the idempotency of the request. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How to Ensure Idempotency</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Constraints: Maximum 64 ASCII characters</p>
 */
@property (nonatomic, strong) NSString *clientToken;

/**
 * <p>If you set this parameter to <code>true</code>, you can't terminate the instance using the Amazon EC2 console, CLI, or API; otherwise, you can. If you set this parameter to <code>true</code> and then later want to be able to terminate the instance, you must first change the value of the <code>disableApiTermination</code> attribute to <code>false</code> using <a>ModifyInstanceAttribute</a>. Alternatively, if you set <code>InstanceInitiatedShutdownBehavior</code> to <code>terminate</code>, you can terminate the instance by running the shutdown command from the instance.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber *disableApiTermination;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>Indicates whether the instance is optimized for EBS I/O. This optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal Amazon EBS I/O performance. This optimization isn't available with all instance types. Additional usage charges apply when using an EBS-optimized instance.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber *ebsOptimized;

/**
 * <p>The IAM instance profile.</p>
 */
@property (nonatomic, strong) AWSEC2IamInstanceProfileSpecification *iamInstanceProfile;

/**
 * <p>The ID of the AMI, which you can get by calling <a>DescribeImages</a>.</p>
 */
@property (nonatomic, strong) NSString *imageId;

/**
 * <p>Indicates whether an instance stops or terminates when you initiate shutdown from the instance (using the operating system command for system shutdown).</p><p>Default: <code>stop</code></p>
 */
@property (nonatomic, assign) AWSEC2ShutdownBehavior instanceInitiatedShutdownBehavior;

/**
 * <p>The instance type. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html">Instance Types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p><p>Default: <code>m1.small</code></p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 * <p>The ID of the kernel.</p><important><p>We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedkernels.html#pv-grub-a-new-amazon-kernel-image"> PV-GRUB: A New Amazon Kernel Image</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p></important>
 */
@property (nonatomic, strong) NSString *kernelId;

/**
 * <p>The name of the key pair. You can create a key pair using <a>CreateKeyPair</a> or <a>ImportKeyPair</a>.</p><important><p>If you launch an instance without specifying a key pair, you can't connect to the instance.</p></important>
 */
@property (nonatomic, strong) NSString *keyName;

/**
 * <p>The maximum number of instances to launch. If you specify more instances than Amazon EC2 can launch in the target Availability Zone, Amazon EC2 launches the largest possible number of instances above <code>MinCount</code>.</p><p>Constraints: Between 1 and the maximum number you're allowed for the specified instance type. For more information about the default limits, and how to request an increase, see <a href="http://aws.amazon.com/ec2/faqs/#How_many_instances_can_I_run_in_Amazon_EC2">How many instances can I run in Amazon EC2</a> in the Amazon EC2 General FAQ.</p>
 */
@property (nonatomic, strong) NSNumber *maxCount;

/**
 * <p>The minimum number of instances to launch. If you specify a minimum that is more instances than Amazon EC2 can launch in the target Availability Zone, Amazon EC2 launches no instances.</p><p>Constraints: Between 1 and the maximum number you're allowed for the specified instance type. For more information about the default limits, and how to request an increase, see <a href="http://aws.amazon.com/ec2/faqs/#How_many_instances_can_I_run_in_Amazon_EC2">How many instances can I run in Amazon EC2</a> in the Amazon EC2 General FAQ.</p>
 */
@property (nonatomic, strong) NSNumber *minCount;

/**
 * <p>The monitoring for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2RunInstancesMonitoringEnabled *monitoring;

/**
 * <p>One or more network interfaces.</p>
 */
@property (nonatomic, strong) NSArray *networkInterfaces;

/**
 * <p>The placement for the instance.</p>
 */
@property (nonatomic, strong) AWSEC2Placement *placement;

/**
 * <p>[EC2-VPC] The primary IP address. You must specify a value from the IP address range of the subnet.</p><p>Only one private IP address can be designated as primary. Therefore, you can't specify this parameter if <code>PrivateIpAddresses.n.Primary</code> is set to <code>true</code> and <code>PrivateIpAddresses.n.PrivateIpAddress</code> is set to an IP address. </p><p>Default: We select an IP address from the IP address range of the subnet.</p>
 */
@property (nonatomic, strong) NSString *privateIpAddress;

/**
 * <p>The ID of the RAM disk.</p>
 */
@property (nonatomic, strong) NSString *ramdiskId;

/**
 * <p>One or more security group IDs. You can create a security group using <a>CreateSecurityGroup</a>.</p><p>Default: Amazon EC2 uses the default security group.</p>
 */
@property (nonatomic, strong) NSArray *securityGroupIds;

/**
 * <p>[EC2-Classic, default VPC] One or more security group names. For a nondefault VPC, you must use security group IDs instead.</p><p>Default: Amazon EC2 uses the default security group.</p>
 */
@property (nonatomic, strong) NSArray *securityGroups;

/**
 * <p>[EC2-VPC] The ID of the subnet to launch the instance into.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

/**
 * <p>The Base64-encoded MIME user data for the instances.</p>
 */
@property (nonatomic, strong) NSString *userData;

@end

/**
 * <p>Describes the S3 bucket for an instance store-backed AMI.</p>
 */
@interface AWSEC2S3Storage : AWSModel


/**
 * <p>The access key ID of the owner of the bucket. Before you specify a value for your access key ID, review and follow the guidance in <a href="http://docs.aws.amazon.com/general/latest/gr/aws-access-keys-best-practices.html">Best Practices for Managing AWS Access Keys</a>.</p>
 */
@property (nonatomic, strong) NSString *AWSAccessKeyId;

/**
 * <p>The bucket in which to store the AMI. You can specify a bucket that you already own or a new bucket that Amazon EC2 creates on your behalf. If you specify a bucket that belongs to someone else, Amazon EC2 returns an error.</p>
 */
@property (nonatomic, strong) NSString *bucket;

/**
 * <p>The beginning of the file name of the AMI.</p>
 */
@property (nonatomic, strong) NSString *prefix;

/**
 * <p>A Base64-encoded Amazon S3 upload policy that gives Amazon EC2 permission to upload items into Amazon S3 on your behalf.</p>
 */
@property (nonatomic, strong) NSData *uploadPolicy;

/**
 * <p>The signature of the Base64 encoded JSON document.</p>
 */
@property (nonatomic, strong) NSString *uploadPolicySignature;

@end

/**
 * <p>Describes a security group</p>
 */
@interface AWSEC2SecurityGroup : AWSModel

@property (nonatomic, strong) NSString *detail;

/**
 * <p>The ID of the security group.</p>
 */
@property (nonatomic, strong) NSString *groupId;

/**
 * <p>The name of the security group.</p>
 */
@property (nonatomic, strong) NSString *groupName;

/**
 * <p>One or more inbound rules associated with the security group.</p>
 */
@property (nonatomic, strong) NSArray *ipPermissions;

/**
 * <p>[EC2-VPC] One or more outbound rules associated with the security group.</p>
 */
@property (nonatomic, strong) NSArray *ipPermissionsEgress;

/**
 * <p>The AWS account ID of the owner of the security group.</p>
 */
@property (nonatomic, strong) NSString *ownerId;

/**
 * <p>Any tags assigned to the security group.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>[EC2-VPC] The ID of the VPC for the security group.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

/**
 * <p>Describes a snapshot.</p>
 */
@interface AWSEC2Snapshot : AWSModel

@property (nonatomic, strong) NSString *detail;

/**
 * <p>Indicates whether the snapshot is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber *encrypted;

/**
 * <p>The AWS account alias (for example, <code>amazon</code>, <code>self</code>) or AWS account ID that owns the snapshot.</p>
 */
@property (nonatomic, strong) NSString *ownerAlias;

/**
 * <p>The AWS account ID of the Amazon EBS snapshot owner.</p>
 */
@property (nonatomic, strong) NSString *ownerId;

/**
 * <p>The progress of the snapshot, as a percentage.</p>
 */
@property (nonatomic, strong) NSString *progress;

/**
 * <p>The ID of the snapshot.</p>
 */
@property (nonatomic, strong) NSString *snapshotId;

/**
 * <p>The time stamp when the snapshot was initiated.</p>
 */
@property (nonatomic, strong) NSDate *startTime;

/**
 * <p>The snapshot state.</p>
 */
@property (nonatomic, assign) AWSEC2SnapshotState state;

/**
 * <p>Any tags assigned to the snapshot.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

/**
 * <p>The size of the volume, in GiB.</p>
 */
@property (nonatomic, strong) NSNumber *volumeSize;

@end

/**
 * <p>Describes the datafeed for a Spot Instance.</p>
 */
@interface AWSEC2SpotDatafeedSubscription : AWSModel


/**
 * <p>The Amazon S3 bucket where the Spot Instance datafeed is located.</p>
 */
@property (nonatomic, strong) NSString *bucket;

/**
 * <p>The fault codes for the Spot Instance request, if any.</p>
 */
@property (nonatomic, strong) AWSEC2SpotInstanceStateFault *fault;

/**
 * <p>The AWS account ID of the account.</p>
 */
@property (nonatomic, strong) NSString *ownerId;

/**
 * <p>The prefix that is prepended to datafeed files.</p>
 */
@property (nonatomic, strong) NSString *prefix;

/**
 * <p>The state of the Spot Instance datafeed subscription.</p>
 */
@property (nonatomic, assign) AWSEC2DatafeedSubscriptionState state;

@end

/**
 * <p>Describe a Spot Instance request.</p>
 */
@interface AWSEC2SpotInstanceRequest : AWSModel


/**
 * <p>The Availability Zone group. If you specify the same Availability Zone group for all Spot Instance requests, all Spot Instances are launched in the same Availability Zone.</p>
 */
@property (nonatomic, strong) NSString *availabilityZoneGroup;

/**
 * <p>The time stamp when the Spot Instance request was created.</p>
 */
@property (nonatomic, strong) NSDate *createTime;

/**
 * <p>The fault codes for the Spot Instance request, if any.</p>
 */
@property (nonatomic, strong) AWSEC2SpotInstanceStateFault *fault;

/**
 * <p>The instance ID, if an instance has been launched to fulfill the Spot Instance request.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The instance launch group. Launch groups are Spot Instances that launch together and terminate together.</p>
 */
@property (nonatomic, strong) NSString *launchGroup;

/**
 * <p>Additional information for launching instances.</p>
 */
@property (nonatomic, strong) AWSEC2LaunchSpecification *launchSpecification;

/**
 * <p>The Availability Zone in which the bid is launched.</p>
 */
@property (nonatomic, strong) NSString *launchedAvailabilityZone;

/**
 * <p>The product description associated with the Spot Instance.</p>
 */
@property (nonatomic, assign) AWSEC2RIProductDescription productDescription;

/**
 * <p>The ID of the Spot Instance request.</p>
 */
@property (nonatomic, strong) NSString *spotInstanceRequestId;

/**
 * <p>The maximum hourly price for any Spot Instance launched to fulfill the request.</p>
 */
@property (nonatomic, strong) NSString *spotPrice;

/**
 * <p>The state of the Spot Instance request. Spot bid status information can help you track your Spot Instance requests. For information, see <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances-bid-status.html">Tracking Spot Requests with Bid Status Codes</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSEC2SpotInstanceState state;

/**
 * <p>The status code and status message describing the Spot Instance request.</p>
 */
@property (nonatomic, strong) AWSEC2SpotInstanceStatus *status;

/**
 * <p>Any tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The Spot Instance request type.</p>
 */
@property (nonatomic, assign) AWSEC2SpotInstanceType type;

/**
 * <p>The start date of the request. If this is a one-time request, the request becomes active at this date and time and remains active until all instances launch, the request expires, or the request is canceled. If the request is persistent, the request becomes active at this date and time and remains active until it expires or is canceled.</p>
 */
@property (nonatomic, strong) NSDate *validFrom;

/**
 * <p>The end date of the request. If this is a one-time request, the request remains active until all instances launch, the request is canceled, or this date is reached. If the request is persistent, it remains active until it is canceled or this date is reached.</p>
 */
@property (nonatomic, strong) NSDate *validUntil;

@end

/**
 * <p>Describes a Spot Instance state change.</p>
 */
@interface AWSEC2SpotInstanceStateFault : AWSModel


/**
 * <p>The reason code for the Spot Instance state change.</p>
 */
@property (nonatomic, strong) NSString *code;

/**
 * <p>The message for the Spot Instance state change.</p>
 */
@property (nonatomic, strong) NSString *message;

@end

/**
 * <p>Describes a Spot Instance request.</p>
 */
@interface AWSEC2SpotInstanceStatus : AWSModel


/**
 * <p>The status code of the request.</p>
 */
@property (nonatomic, strong) NSString *code;

/**
 * <p>The description for the status code for the Spot request.</p>
 */
@property (nonatomic, strong) NSString *message;

/**
 * <p>The time of the most recent status update.</p>
 */
@property (nonatomic, strong) NSDate *updateTime;

@end

/**
 * <p>Describes Spot Instance placement.</p>
 */
@interface AWSEC2SpotPlacement : AWSModel


/**
 * <p>The Availability Zone.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>The Availability Zone group name.</p>
 */
@property (nonatomic, strong) NSString *groupName;

@end

/**
 * <p>Describes the Spot Price.</p>
 */
@interface AWSEC2SpotPrice : AWSModel


/**
 * <p>The Availability Zone.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>The instance type.</p>
 */
@property (nonatomic, assign) AWSEC2InstanceType instanceType;

/**
 * <p>A general description of the AMI.</p>
 */
@property (nonatomic, assign) AWSEC2RIProductDescription productDescription;

/**
 * <p>The maximum price you will pay to launch one or more Spot Instances.</p>
 */
@property (nonatomic, strong) NSString *spotPrice;

/**
 * <p>The date and time the request was created.</p>
 */
@property (nonatomic, strong) NSDate *timestamp;

@end

@interface AWSEC2StartInstancesRequest : AWSRequest


/**
 * <p>Reserved.</p>
 */
@property (nonatomic, strong) NSString *additionalInfo;
@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray *instanceIds;

@end

@interface AWSEC2StartInstancesResult : AWSModel


/**
 * <p>Information about one or more started instances.</p>
 */
@property (nonatomic, strong) NSArray *startingInstances;

@end

/**
 * <p>Describes a state change.</p>
 */
@interface AWSEC2StateReason : AWSModel


/**
 * <p>The reason code for the state change.</p>
 */
@property (nonatomic, strong) NSString *code;

/**
 * <p>The message for the state change.</p><ul><li><p><code>Server.SpotInstanceTermination</code>: A Spot Instance was terminated due to an increase in the market price.</p></li><li><p><code>Server.InternalError</code>: An internal error occurred during instance launch, resulting in termination.</p></li><li><p><code>Server.InsufficientInstanceCapacity</code>: There was insufficient instance capacity to satisfy the launch request.</p></li><li><p><code>Client.InternalError</code>: A client error caused the instance to terminate on launch.</p></li><li><p><code>Client.InstanceInitiatedShutdown</code>: The instance was shut down using the <code>shutdown -h</code> command from the instance.</p></li><li><p><code>Client.UserInitiatedShutdown</code>: The instance was shut down using the Amazon EC2 API.</p></li><li><p><code>Client.VolumeLimitExceeded</code>: The volume limit was exceeded.</p></li><li><p><code>Client.InvalidSnapshot.NotFound</code>: The specified snapshot was not found.</p></li></ul>
 */
@property (nonatomic, strong) NSString *message;

@end

@interface AWSEC2StopInstancesRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>Forces the instances to stop. The instances do not have an opportunity to flush file system caches or file system metadata. If you use this option, you must perform file system check and repair procedures. This option is not recommended for Windows instances.</p><p>Default: <code>false</code></p>
 */
@property (nonatomic, strong) NSNumber *force;

/**
 * <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray *instanceIds;

@end

@interface AWSEC2StopInstancesResult : AWSModel


/**
 * <p>Information about one or more stopped instances.</p>
 */
@property (nonatomic, strong) NSArray *stoppingInstances;

@end

/**
 * <p>Describes the storage location for an instance store-backed AMI.</p>
 */
@interface AWSEC2Storage : AWSModel


/**
 * <p>An Amazon S3 storage location.</p>
 */
@property (nonatomic, strong) AWSEC2S3Storage *s3;

@end

/**
 * <p>Describes a subnet.</p>
 */
@interface AWSEC2Subnet : AWSModel


/**
 * <p>The Availability Zone of the subnet.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>The number of unused IP addresses in the subnet. Note that the IP addresses for any stopped instances are considered unavailable.</p>
 */
@property (nonatomic, strong) NSNumber *availableIpAddressCount;

/**
 * <p>The CIDR block assigned to the subnet.</p>
 */
@property (nonatomic, strong) NSString *cidrBlock;

/**
 * <p>Indicates whether this is the default subnet for the Availability Zone.</p>
 */
@property (nonatomic, strong) NSNumber *defaultForAz;

/**
 * <p>Indicates whether instances launched in this subnet receive a public IP address.</p>
 */
@property (nonatomic, strong) NSNumber *mapPublicIpOnLaunch;

/**
 * <p>The current state of the subnet.</p>
 */
@property (nonatomic, assign) AWSEC2SubnetState state;

/**
 * <p>The ID of the subnet.</p>
 */
@property (nonatomic, strong) NSString *subnetId;

/**
 * <p>Any tags assigned to the subnet.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The ID of the VPC the subnet is in.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

/**
 * <p>Describes a tag.</p>
 */
@interface AWSEC2Tag : AWSModel


/**
 * <p>The key of the tag. </p><p>Constraints: Tag keys are case-sensitive and accept a maximum of 127 Unicode characters. May not begin with <code>aws:</code></p>
 */
@property (nonatomic, strong) NSString *key;

/**
 * <p>The value of the tag.</p><p>Constraints: Tag values are case-sensitive and accept a maximum of 255 Unicode characters.</p>
 */
@property (nonatomic, strong) NSString *value;

@end

/**
 * <p>Describes a tag.</p>
 */
@interface AWSEC2TagDescription : AWSModel


/**
 * <p>The key of the tag.</p>
 */
@property (nonatomic, strong) NSString *key;

/**
 * <p>The ID of the resource. For example, <code>ami-1a2b3c4d</code>.</p>
 */
@property (nonatomic, strong) NSString *resourceId;

/**
 * <p>The type of resource.</p>
 */
@property (nonatomic, assign) AWSEC2ResourceType resourceType;

/**
 * <p>The value of the tag.</p>
 */
@property (nonatomic, strong) NSString *value;

@end

@interface AWSEC2TerminateInstancesRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray *instanceIds;

@end

@interface AWSEC2TerminateInstancesResult : AWSModel


/**
 * <p>Information about one or more terminated instances.</p>
 */
@property (nonatomic, strong) NSArray *terminatingInstances;

@end

@interface AWSEC2UnassignPrivateIpAddressesRequest : AWSRequest


/**
 * <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString *networkInterfaceId;

/**
 * <p>The secondary private IP addresses to unassign from the network interface. You can specify this option multiple times to unassign more than one IP address.</p>
 */
@property (nonatomic, strong) NSArray *privateIpAddresses;

@end

@interface AWSEC2UnmonitorInstancesRequest : AWSRequest

@property (nonatomic, strong) NSNumber *dryRun;

/**
 * <p>One or more instance IDs.</p>
 */
@property (nonatomic, strong) NSArray *instanceIds;

@end

@interface AWSEC2UnmonitorInstancesResult : AWSModel


/**
 * <p>Monitoring information for one or more instances.</p>
 */
@property (nonatomic, strong) NSArray *instanceMonitorings;

@end

/**
 * <p>Describes a security group and AWS account ID pair for EC2-Classic.</p>
 */
@interface AWSEC2UserIdGroupPair : AWSModel


/**
 * <p>The name of the security group in the specified AWS account.</p>
 */
@property (nonatomic, strong) NSString *groupId;

/**
 * <p>The ID of the security group owned by the specified AWS account.</p>
 */
@property (nonatomic, strong) NSString *groupName;

/**
 * <p>The ID of an AWS account.</p>
 */
@property (nonatomic, strong) NSString *userId;

@end

/**
 * <p>Describes telemetry for a VPN tunnel.</p>
 */
@interface AWSEC2VgwTelemetry : AWSModel


/**
 * <p>The number of accepted routes.</p>
 */
@property (nonatomic, strong) NSNumber *acceptedRouteCount;

/**
 * <p>The date and time of the last change in status.</p>
 */
@property (nonatomic, strong) NSDate *lastStatusChange;

/**
 * <p>The Internet-routable IP address of the virtual private gateway's outside interface.</p>
 */
@property (nonatomic, strong) NSString *outsideIpAddress;

/**
 * <p>The status of the VPN tunnel.</p>
 */
@property (nonatomic, assign) AWSEC2TelemetryStatus status;

/**
 * <p>If an error occurs, a description of the error.</p>
 */
@property (nonatomic, strong) NSString *statusMessage;

@end

/**
 * <p>Describes a volume.</p>
 */
@interface AWSEC2Volume : AWSModel

@property (nonatomic, strong) NSArray *attachments;

/**
 * <p>The Availability Zone for the volume.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>The time stamp when volume creation was initiated.</p>
 */
@property (nonatomic, strong) NSDate *createTime;

/**
 * <p>Indicates whether the volume is encrypted.</p>
 */
@property (nonatomic, strong) NSNumber *encrypted;

/**
 * <p>The number of I/O operations per second (IOPS) that the volume supports.</p>
 */
@property (nonatomic, strong) NSNumber *iops;

/**
 * <p>The size of the volume, in GiBs.</p>
 */
@property (nonatomic, strong) NSNumber *size;

/**
 * <p>The snapshot from which the volume was created, if applicable.</p>
 */
@property (nonatomic, strong) NSString *snapshotId;

/**
 * <p>The volume state.</p>
 */
@property (nonatomic, assign) AWSEC2VolumeState state;

/**
 * <p>Any tags assigned to the volume.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

/**
 * <p>The volume type. This can be <code>gp2</code> for General Purpose (SSD) volumes, <code>io1</code> for Provisioned IOPS (SSD) volumes, or <code>standard</code> for Magnetic volumes.</p>
 */
@property (nonatomic, assign) AWSEC2VolumeType volumeType;

@end

/**
 * <p>Describes volume attachment details.</p>
 */
@interface AWSEC2VolumeAttachment : AWSModel


/**
 * <p>The time stamp when the attachment initiated.</p>
 */
@property (nonatomic, strong) NSDate *attachTime;

/**
 * <p>Indicates whether the Amazon EBS volume is deleted on instance termination.</p>
 */
@property (nonatomic, strong) NSNumber *deleteOnTermination;

/**
 * <p>The device name.</p>
 */
@property (nonatomic, strong) NSString *device;

/**
 * <p>The ID of the instance.</p>
 */
@property (nonatomic, strong) NSString *instanceId;

/**
 * <p>The attachment state of the volume.</p>
 */
@property (nonatomic, assign) AWSEC2VolumeAttachmentState state;

/**
 * <p>The ID of the volume.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

@end

/**
 * <p>Describes an Amazon EBS volume.</p>
 * Required parameters: [Size]
 */
@interface AWSEC2VolumeDetail : AWSModel


/**
 * <p>The size of the volume, in GiB.</p>
 */
@property (nonatomic, strong) NSNumber *size;

@end

/**
 * <p>Describes a volume status operation code.</p>
 */
@interface AWSEC2VolumeStatusAction : AWSModel


/**
 * <p>The code identifying the operation, for example, <code>enable-volume-io</code>.</p>
 */
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *detail;

/**
 * <p>The ID of the event associated with this operation.</p>
 */
@property (nonatomic, strong) NSString *eventId;

/**
 * <p>The event type associated with this operation.</p>
 */
@property (nonatomic, strong) NSString *eventType;

@end

/**
 * <p>Describes a volume status.</p>
 */
@interface AWSEC2VolumeStatusDetails : AWSModel


/**
 * <p>The name of the volume status.</p>
 */
@property (nonatomic, assign) AWSEC2VolumeStatusName name;

/**
 * <p>The intended status of the volume status.</p>
 */
@property (nonatomic, strong) NSString *status;

@end

/**
 * <p>Describes a volume status event.</p>
 */
@interface AWSEC2VolumeStatusEvent : AWSModel

@property (nonatomic, strong) NSString *detail;

/**
 * <p>The ID of this event.</p>
 */
@property (nonatomic, strong) NSString *eventId;

/**
 * <p>The type of this event.</p>
 */
@property (nonatomic, strong) NSString *eventType;

/**
 * <p>The latest end time of the event.</p>
 */
@property (nonatomic, strong) NSDate *notAfter;

/**
 * <p>The earliest start time of the event.</p>
 */
@property (nonatomic, strong) NSDate *notBefore;

@end

/**
 * <p>Describes the status of a volume.</p>
 */
@interface AWSEC2VolumeStatusInfo : AWSModel


/**
 * <p>The details of the volume status.</p>
 */
@property (nonatomic, strong) NSArray *details;

/**
 * <p>The status of the volume.</p>
 */
@property (nonatomic, assign) AWSEC2VolumeStatusInfoStatus status;

@end

/**
 * <p>Describes the volume status.</p>
 */
@interface AWSEC2VolumeStatusItem : AWSModel


/**
 * <p>The details of the operation.</p>
 */
@property (nonatomic, strong) NSArray *actions;

/**
 * <p>The Availability Zone of the volume.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>A list of events associated with the volume.</p>
 */
@property (nonatomic, strong) NSArray *events;

/**
 * <p>The volume ID.</p>
 */
@property (nonatomic, strong) NSString *volumeId;

/**
 * <p>The volume status.</p>
 */
@property (nonatomic, strong) AWSEC2VolumeStatusInfo *volumeStatus;

@end

/**
 * <p>Describes a VPC.</p>
 */
@interface AWSEC2Vpc : AWSModel


/**
 * <p>The CIDR block for the VPC.</p>
 */
@property (nonatomic, strong) NSString *cidrBlock;

/**
 * <p>The ID of the set of DHCP options you've associated with the VPC (or <code>default</code> if the default options are associated with the VPC).</p>
 */
@property (nonatomic, strong) NSString *dhcpOptionsId;

/**
 * <p>The allowed tenancy of instances launched into the VPC.</p>
 */
@property (nonatomic, assign) AWSEC2Tenancy instanceTenancy;

/**
 * <p>Indicates whether the VPC is the default VPC.</p>
 */
@property (nonatomic, strong) NSNumber *isDefault;

/**
 * <p>The current state of the VPC.</p>
 */
@property (nonatomic, assign) AWSEC2VpcState state;

/**
 * <p>Any tags assigned to the VPC.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

/**
 * <p>Describes an attachment between a virtual private gateway and a VPC.</p>
 */
@interface AWSEC2VpcAttachment : AWSModel


/**
 * <p>The current state of the attachment.</p>
 */
@property (nonatomic, assign) AWSEC2AttachmentStatus state;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

/**
 * <p>Describes a VPC peering connection.</p>
 */
@interface AWSEC2VpcPeeringConnection : AWSModel


/**
 * <p>The information of the peer VPC.</p>
 */
@property (nonatomic, strong) AWSEC2VpcPeeringConnectionVpcInfo *accepterVpcInfo;

/**
 * <p>The time that an unaccepted VPC peering connection will expire.</p>
 */
@property (nonatomic, strong) NSDate *expirationTime;

/**
 * <p>The information of the requester VPC.</p>
 */
@property (nonatomic, strong) AWSEC2VpcPeeringConnectionVpcInfo *requesterVpcInfo;

/**
 * <p>The status of the VPC peering connection.</p>
 */
@property (nonatomic, strong) AWSEC2VpcPeeringConnectionStateReason *status;

/**
 * <p>Any tags assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The ID of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString *vpcPeeringConnectionId;

@end

/**
 * <p>Describes the status of a VPC peering connection.</p>
 */
@interface AWSEC2VpcPeeringConnectionStateReason : AWSModel


/**
 * <p>The status of the VPC peering connection.</p>
 */
@property (nonatomic, strong) NSString *code;

/**
 * <p>A message that provides more information about the status, if applicable.</p>
 */
@property (nonatomic, strong) NSString *message;

@end

/**
 * <p>Describes a VPC in a VPC peering connection.</p>
 */
@interface AWSEC2VpcPeeringConnectionVpcInfo : AWSModel


/**
 * <p>The CIDR block for the VPC.</p>
 */
@property (nonatomic, strong) NSString *cidrBlock;

/**
 * <p>The AWS account ID of the VPC owner.</p>
 */
@property (nonatomic, strong) NSString *ownerId;

/**
 * <p>The ID of the VPC.</p>
 */
@property (nonatomic, strong) NSString *vpcId;

@end

/**
 * <p>Describes a VPN connection.</p>
 */
@interface AWSEC2VpnConnection : AWSModel


/**
 * <p>The configuration information for the VPN connection's customer gateway (in the native XML format). This element is always present in the <a>CreateVpnConnection</a> response; however, it's present in the <a>DescribeVpnConnections</a> response only if the VPN connection is in the <code>pending</code> or <code>available</code> state.</p>
 */
@property (nonatomic, strong) NSString *customerGatewayConfiguration;

/**
 * <p>The ID of the customer gateway at your end of the VPN connection.</p>
 */
@property (nonatomic, strong) NSString *customerGatewayId;

/**
 * <p>The VPN connection options.</p>
 */
@property (nonatomic, strong) AWSEC2VpnConnectionOptions *options;

/**
 * <p>The static routes associated with the VPN connection.</p>
 */
@property (nonatomic, strong) NSArray *routes;

/**
 * <p>The current state of the VPN connection.</p>
 */
@property (nonatomic, assign) AWSEC2VpnState state;

/**
 * <p>Any tags assigned to the VPN connection.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The type of VPN connection.</p>
 */
@property (nonatomic, assign) AWSEC2GatewayType type;

/**
 * <p>Information about the VPN tunnel.</p>
 */
@property (nonatomic, strong) NSArray *vgwTelemetry;

/**
 * <p>The ID of the VPN connection.</p>
 */
@property (nonatomic, strong) NSString *vpnConnectionId;

/**
 * <p>The ID of the virtual private gateway at the AWS side of the VPN connection.</p>
 */
@property (nonatomic, strong) NSString *vpnGatewayId;

@end

/**
 * <p>Describes VPN connection options.</p>
 */
@interface AWSEC2VpnConnectionOptions : AWSModel


/**
 * <p>Indicates whether the VPN connection uses static routes only. Static routes must be used for devices that don't support BGP.</p>
 */
@property (nonatomic, strong) NSNumber *staticRoutesOnly;

@end

/**
 * <p>Describes VPN connection options.</p>
 */
@interface AWSEC2VpnConnectionOptionsSpecification : AWSModel


/**
 * <p>Indicates whether the VPN connection uses static routes only. Static routes must be used for devices that don't support BGP.</p>
 */
@property (nonatomic, strong) NSNumber *staticRoutesOnly;

@end

/**
 * <p>Describes a virtual private gateway.</p>
 */
@interface AWSEC2VpnGateway : AWSModel


/**
 * <p>The Availability Zone where the virtual private gateway was created.</p>
 */
@property (nonatomic, strong) NSString *availabilityZone;

/**
 * <p>The current state of the virtual private gateway.</p>
 */
@property (nonatomic, assign) AWSEC2VpnState state;

/**
 * <p>Any tags assigned to the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSArray *tags;

/**
 * <p>The type of VPN connection the virtual private gateway supports.</p>
 */
@property (nonatomic, assign) AWSEC2GatewayType type;

/**
 * <p>Any VPCs attached to the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSArray *vpcAttachments;

/**
 * <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString *vpnGatewayId;

@end

/**
 * <p>Describes a static route for a VPN connection.</p>
 */
@interface AWSEC2VpnStaticRoute : AWSModel


/**
 * <p>The CIDR block associated with the local subnet of the customer data center.</p>
 */
@property (nonatomic, strong) NSString *destinationCidrBlock;

/**
 * <p>Indicates how the routes were provided.</p>
 */
@property (nonatomic, assign) AWSEC2VpnStaticRouteSource source;

/**
 * <p>The current state of the static route.</p>
 */
@property (nonatomic, assign) AWSEC2VpnState state;

@end
