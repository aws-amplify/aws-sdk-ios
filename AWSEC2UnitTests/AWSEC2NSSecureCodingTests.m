//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSEC2Model.h"

@interface AWSEC2NSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSEC2AcceleratorCount API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceleratorCountRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceleratorTotalMemoryMiB API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceleratorTotalMemoryMiBRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptAddressTransferRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptAddressTransferResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptReservedInstancesExchangeQuoteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptReservedInstancesExchangeQuoteResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptTransitGatewayMulticastDomainAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptTransitGatewayMulticastDomainAssociationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptTransitGatewayPeeringAttachmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptTransitGatewayPeeringAttachmentResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptTransitGatewayVpcAttachmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptTransitGatewayVpcAttachmentResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptVpcEndpointConnectionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptVpcEndpointConnectionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptVpcPeeringConnectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AcceptVpcPeeringConnectionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AccessScopeAnalysisFinding API_AVAILABLE(ios(11));
- (void) test_AWSEC2AccessScopePath API_AVAILABLE(ios(11));
- (void) test_AWSEC2AccessScopePathRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AccountAttribute API_AVAILABLE(ios(11));
- (void) test_AWSEC2AccountAttributeValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2ActiveInstance API_AVAILABLE(ios(11));
- (void) test_AWSEC2AddIpamOperatingRegion API_AVAILABLE(ios(11));
- (void) test_AWSEC2AddPrefixListEntry API_AVAILABLE(ios(11));
- (void) test_AWSEC2AddedPrincipal API_AVAILABLE(ios(11));
- (void) test_AWSEC2AdditionalDetail API_AVAILABLE(ios(11));
- (void) test_AWSEC2Address API_AVAILABLE(ios(11));
- (void) test_AWSEC2AddressAttribute API_AVAILABLE(ios(11));
- (void) test_AWSEC2AddressTransfer API_AVAILABLE(ios(11));
- (void) test_AWSEC2AdvertiseByoipCidrRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AdvertiseByoipCidrResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AllocateAddressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AllocateAddressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AllocateHostsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AllocateHostsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AllocateIpamPoolCidrRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AllocateIpamPoolCidrResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AllowedPrincipal API_AVAILABLE(ios(11));
- (void) test_AWSEC2AlternatePathHint API_AVAILABLE(ios(11));
- (void) test_AWSEC2AnalysisAclRule API_AVAILABLE(ios(11));
- (void) test_AWSEC2AnalysisComponent API_AVAILABLE(ios(11));
- (void) test_AWSEC2AnalysisLoadBalancerListener API_AVAILABLE(ios(11));
- (void) test_AWSEC2AnalysisLoadBalancerTarget API_AVAILABLE(ios(11));
- (void) test_AWSEC2AnalysisPacketHeader API_AVAILABLE(ios(11));
- (void) test_AWSEC2AnalysisRouteTableRoute API_AVAILABLE(ios(11));
- (void) test_AWSEC2AnalysisSecurityGroupRule API_AVAILABLE(ios(11));
- (void) test_AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssignIpv6AddressesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssignIpv6AddressesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssignPrivateIpAddressesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssignPrivateIpAddressesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssignPrivateNatGatewayAddressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssignPrivateNatGatewayAddressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssignedPrivateIpAddress API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateAddressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateAddressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateClientVpnTargetNetworkRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateClientVpnTargetNetworkResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateDhcpOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateEnclaveCertificateIamRoleRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateEnclaveCertificateIamRoleResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateIamInstanceProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateIamInstanceProfileResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateInstanceEventWindowRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateInstanceEventWindowResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateIpamResourceDiscoveryRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateIpamResourceDiscoveryResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateNatGatewayAddressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateNatGatewayAddressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateRouteTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateRouteTableResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateSubnetCidrBlockRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateSubnetCidrBlockResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateTransitGatewayMulticastDomainRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateTransitGatewayMulticastDomainResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateTransitGatewayPolicyTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateTransitGatewayPolicyTableResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateTransitGatewayRouteTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateTransitGatewayRouteTableResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateTrunkInterfaceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateTrunkInterfaceResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateVpcCidrBlockRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociateVpcCidrBlockResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociatedRole API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociatedTargetNetwork API_AVAILABLE(ios(11));
- (void) test_AWSEC2AssociationStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2AthenaIntegration API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttachClassicLinkVpcRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttachClassicLinkVpcResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttachInternetGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttachNetworkInterfaceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttachNetworkInterfaceResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttachVerifiedAccessTrustProviderRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttachVerifiedAccessTrustProviderResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttachVolumeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttachVpnGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttachVpnGatewayResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttachmentEnaSrdSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttachmentEnaSrdUdpSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttributeBooleanValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2AttributeValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2AuthorizationRule API_AVAILABLE(ios(11));
- (void) test_AWSEC2AuthorizeClientVpnIngressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AuthorizeClientVpnIngressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AuthorizeSecurityGroupEgressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AuthorizeSecurityGroupEgressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AuthorizeSecurityGroupIngressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2AuthorizeSecurityGroupIngressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2AvailabilityZone API_AVAILABLE(ios(11));
- (void) test_AWSEC2AvailabilityZoneMessage API_AVAILABLE(ios(11));
- (void) test_AWSEC2AvailableCapacity API_AVAILABLE(ios(11));
- (void) test_AWSEC2BaselineEbsBandwidthMbps API_AVAILABLE(ios(11));
- (void) test_AWSEC2BaselineEbsBandwidthMbpsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2BlobAttributeValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2BlockDeviceMapping API_AVAILABLE(ios(11));
- (void) test_AWSEC2BundleInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2BundleInstanceResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2BundleTask API_AVAILABLE(ios(11));
- (void) test_AWSEC2BundleTaskError API_AVAILABLE(ios(11));
- (void) test_AWSEC2ByoipCidr API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelBundleTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelBundleTaskResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelCapacityReservationFleetError API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelCapacityReservationFleetsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelCapacityReservationFleetsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelCapacityReservationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelCapacityReservationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelConversionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelExportTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelImageLaunchPermissionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelImageLaunchPermissionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelImportTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelImportTaskResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelReservedInstancesListingRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelReservedInstancesListingResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelSpotFleetRequestsError API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelSpotFleetRequestsErrorItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelSpotFleetRequestsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelSpotFleetRequestsResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelSpotFleetRequestsSuccessItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelSpotInstanceRequestsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelSpotInstanceRequestsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CancelledSpotInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CapacityAllocation API_AVAILABLE(ios(11));
- (void) test_AWSEC2CapacityReservation API_AVAILABLE(ios(11));
- (void) test_AWSEC2CapacityReservationFleet API_AVAILABLE(ios(11));
- (void) test_AWSEC2CapacityReservationFleetCancellationState API_AVAILABLE(ios(11));
- (void) test_AWSEC2CapacityReservationGroup API_AVAILABLE(ios(11));
- (void) test_AWSEC2CapacityReservationOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2CapacityReservationOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CapacityReservationSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2CapacityReservationSpecificationResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2CapacityReservationTarget API_AVAILABLE(ios(11));
- (void) test_AWSEC2CapacityReservationTargetResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2CarrierGateway API_AVAILABLE(ios(11));
- (void) test_AWSEC2CertificateAuthentication API_AVAILABLE(ios(11));
- (void) test_AWSEC2CertificateAuthenticationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CidrAuthorizationContext API_AVAILABLE(ios(11));
- (void) test_AWSEC2CidrBlock API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClassicLinkDnsSupport API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClassicLinkInstance API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClassicLoadBalancer API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClassicLoadBalancersConfig API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientCertificateRevocationListStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientConnectOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientConnectResponseOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientData API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientLoginBannerOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientLoginBannerResponseOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientVpnAuthentication API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientVpnAuthenticationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientVpnAuthorizationRuleStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientVpnConnection API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientVpnConnectionStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientVpnEndpoint API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientVpnEndpointAttributeStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientVpnEndpointStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientVpnRoute API_AVAILABLE(ios(11));
- (void) test_AWSEC2ClientVpnRouteStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2CloudWatchLogOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2CloudWatchLogOptionsSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2CoipAddressUsage API_AVAILABLE(ios(11));
- (void) test_AWSEC2CoipCidr API_AVAILABLE(ios(11));
- (void) test_AWSEC2CoipPool API_AVAILABLE(ios(11));
- (void) test_AWSEC2ConfirmProductInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ConfirmProductInstanceResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ConnectionLogOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2ConnectionLogResponseOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2ConnectionNotification API_AVAILABLE(ios(11));
- (void) test_AWSEC2ConversionTask API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplicateFpgaImageRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplicateFpgaImageResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplicateImageRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplicateImageResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplicateSnapshotRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplicateSnapshotResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CpuOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2CpuOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateCapacityReservationFleetRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateCapacityReservationFleetResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateCapacityReservationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateCapacityReservationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateCarrierGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateCarrierGatewayResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateClientVpnEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateClientVpnEndpointResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateClientVpnRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateClientVpnRouteResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateCoipCidrRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateCoipCidrResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateCoipPoolRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateCoipPoolResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateCustomerGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateCustomerGatewayResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateDefaultSubnetRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateDefaultSubnetResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateDefaultVpcRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateDefaultVpcResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateDhcpOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateDhcpOptionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateEgressOnlyInternetGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateEgressOnlyInternetGatewayResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateFleetError API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateFleetInstance API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateFleetRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateFleetResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateFlowLogsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateFlowLogsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateFpgaImageRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateFpgaImageResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateImageRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateImageResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateInstanceEventWindowRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateInstanceEventWindowResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateInstanceExportTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateInstanceExportTaskResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateInternetGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateInternetGatewayResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateIpamPoolRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateIpamPoolResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateIpamRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateIpamResourceDiscoveryRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateIpamResourceDiscoveryResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateIpamResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateIpamScopeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateIpamScopeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateKeyPairRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateLaunchTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateLaunchTemplateResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateLaunchTemplateVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateLaunchTemplateVersionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateLocalGatewayRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateLocalGatewayRouteResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateLocalGatewayRouteTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateLocalGatewayRouteTableResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateLocalGatewayRouteTableVirtualInterfaceGroupAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateLocalGatewayRouteTableVirtualInterfaceGroupAssociationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateLocalGatewayRouteTableVpcAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateManagedPrefixListRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateManagedPrefixListResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateNatGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateNatGatewayResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateNetworkAclEntryRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateNetworkAclRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateNetworkAclResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateNetworkInsightsAccessScopeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateNetworkInsightsAccessScopeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateNetworkInsightsPathRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateNetworkInsightsPathResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateNetworkInterfacePermissionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateNetworkInterfacePermissionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateNetworkInterfaceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateNetworkInterfaceResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreatePlacementGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreatePlacementGroupResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreatePublicIpv4PoolRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreatePublicIpv4PoolResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateReplaceRootVolumeTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateReplaceRootVolumeTaskResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateReservedInstancesListingRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateReservedInstancesListingResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateRestoreImageTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateRestoreImageTaskResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateRouteResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateRouteTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateRouteTableResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateSecurityGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateSecurityGroupResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateSnapshotRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateSnapshotsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateSnapshotsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateSpotDatafeedSubscriptionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateSpotDatafeedSubscriptionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateStoreImageTaskRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateStoreImageTaskResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateSubnetCidrReservationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateSubnetCidrReservationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateSubnetRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateSubnetResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTagsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTrafficMirrorFilterRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTrafficMirrorFilterResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTrafficMirrorFilterRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTrafficMirrorFilterRuleResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTrafficMirrorSessionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTrafficMirrorSessionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTrafficMirrorTargetRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTrafficMirrorTargetResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayConnectPeerRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayConnectPeerResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayConnectRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayConnectRequestOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayConnectResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayMulticastDomainRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayMulticastDomainRequestOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayMulticastDomainResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayPeeringAttachmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayPeeringAttachmentRequestOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayPeeringAttachmentResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayPolicyTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayPolicyTableResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayPrefixListReferenceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayPrefixListReferenceResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayRouteResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayRouteTableAnnouncementRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayRouteTableAnnouncementResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayRouteTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayRouteTableResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayVpcAttachmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayVpcAttachmentRequestOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateTransitGatewayVpcAttachmentResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVerifiedAccessEndpointEniOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVerifiedAccessEndpointLoadBalancerOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVerifiedAccessEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVerifiedAccessEndpointResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVerifiedAccessGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVerifiedAccessGroupResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVerifiedAccessInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVerifiedAccessInstanceResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVerifiedAccessTrustProviderDeviceOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVerifiedAccessTrustProviderOidcOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVerifiedAccessTrustProviderRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVerifiedAccessTrustProviderResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVolumePermission API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVolumePermissionModifications API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVolumeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpcEndpointConnectionNotificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpcEndpointConnectionNotificationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpcEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpcEndpointResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpcEndpointServiceConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpcEndpointServiceConfigurationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpcPeeringConnectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpcPeeringConnectionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpcRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpcResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpnConnectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpnConnectionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpnConnectionRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpnGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreateVpnGatewayResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreditSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2CreditSpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2CustomerGateway API_AVAILABLE(ios(11));
- (void) test_AWSEC2DataQuery API_AVAILABLE(ios(11));
- (void) test_AWSEC2DataResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteCarrierGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteCarrierGatewayResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteClientVpnEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteClientVpnEndpointResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteClientVpnRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteClientVpnRouteResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteCoipCidrRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteCoipCidrResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteCoipPoolRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteCoipPoolResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteCustomerGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteDhcpOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteEgressOnlyInternetGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteEgressOnlyInternetGatewayResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteFleetError API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteFleetErrorItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteFleetSuccessItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteFleetsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteFleetsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteFlowLogsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteFlowLogsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteFpgaImageRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteFpgaImageResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteInstanceEventWindowRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteInstanceEventWindowResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteInternetGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteIpamPoolRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteIpamPoolResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteIpamRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteIpamResourceDiscoveryRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteIpamResourceDiscoveryResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteIpamResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteIpamScopeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteIpamScopeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteKeyPairRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLaunchTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLaunchTemplateResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLaunchTemplateVersionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLaunchTemplateVersionsResponseErrorItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLaunchTemplateVersionsResponseSuccessItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLaunchTemplateVersionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLocalGatewayRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLocalGatewayRouteResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLocalGatewayRouteTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLocalGatewayRouteTableResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLocalGatewayRouteTableVirtualInterfaceGroupAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLocalGatewayRouteTableVirtualInterfaceGroupAssociationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLocalGatewayRouteTableVpcAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteManagedPrefixListRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteManagedPrefixListResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNatGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNatGatewayResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNetworkAclEntryRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNetworkAclRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNetworkInsightsAccessScopeAnalysisRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNetworkInsightsAccessScopeAnalysisResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNetworkInsightsAccessScopeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNetworkInsightsAccessScopeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNetworkInsightsAnalysisRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNetworkInsightsAnalysisResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNetworkInsightsPathRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNetworkInsightsPathResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNetworkInterfacePermissionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNetworkInterfacePermissionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteNetworkInterfaceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeletePlacementGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeletePublicIpv4PoolRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeletePublicIpv4PoolResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteQueuedReservedInstancesError API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteQueuedReservedInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteQueuedReservedInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteRouteTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteSecurityGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteSnapshotRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteSpotDatafeedSubscriptionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteSubnetCidrReservationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteSubnetCidrReservationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteSubnetRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTagsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTrafficMirrorFilterRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTrafficMirrorFilterResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTrafficMirrorFilterRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTrafficMirrorFilterRuleResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTrafficMirrorSessionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTrafficMirrorSessionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTrafficMirrorTargetRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTrafficMirrorTargetResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayConnectPeerRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayConnectPeerResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayConnectRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayConnectResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayMulticastDomainRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayMulticastDomainResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayPeeringAttachmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayPeeringAttachmentResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayPolicyTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayPolicyTableResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayPrefixListReferenceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayPrefixListReferenceResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayRouteResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayRouteTableAnnouncementRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayRouteTableAnnouncementResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayRouteTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayRouteTableResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayVpcAttachmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteTransitGatewayVpcAttachmentResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVerifiedAccessEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVerifiedAccessEndpointResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVerifiedAccessGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVerifiedAccessGroupResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVerifiedAccessInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVerifiedAccessInstanceResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVerifiedAccessTrustProviderRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVerifiedAccessTrustProviderResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVolumeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVpcEndpointConnectionNotificationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVpcEndpointConnectionNotificationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVpcEndpointServiceConfigurationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVpcEndpointServiceConfigurationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVpcEndpointsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVpcEndpointsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVpcPeeringConnectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVpcPeeringConnectionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVpcRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVpnConnectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVpnConnectionRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeleteVpnGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeprovisionByoipCidrRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeprovisionByoipCidrResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeprovisionIpamPoolCidrRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeprovisionIpamPoolCidrResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeprovisionPublicIpv4PoolCidrRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeprovisionPublicIpv4PoolCidrResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeregisterImageRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeregisterInstanceEventNotificationAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeregisterInstanceEventNotificationAttributesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeregisterInstanceTagAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeregisterTransitGatewayMulticastGroupMembersRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeregisterTransitGatewayMulticastGroupSourcesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAccountAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAccountAttributesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAddressTransfersRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAddressTransfersResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAddressesAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAddressesAttributeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAddressesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAddressesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAggregateIdFormatRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAggregateIdFormatResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAvailabilityZonesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAvailabilityZonesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAwsNetworkPerformanceMetricSubscriptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeAwsNetworkPerformanceMetricSubscriptionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeBundleTasksRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeBundleTasksResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeByoipCidrsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeByoipCidrsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeCapacityReservationFleetsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeCapacityReservationFleetsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeCapacityReservationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeCapacityReservationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeCarrierGatewaysRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeCarrierGatewaysResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeClassicLinkInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeClassicLinkInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeClientVpnAuthorizationRulesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeClientVpnAuthorizationRulesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeClientVpnConnectionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeClientVpnConnectionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeClientVpnEndpointsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeClientVpnEndpointsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeClientVpnRoutesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeClientVpnRoutesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeClientVpnTargetNetworksRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeClientVpnTargetNetworksResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeCoipPoolsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeCoipPoolsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeConversionTasksRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeConversionTasksResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeCustomerGatewaysRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeCustomerGatewaysResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeDhcpOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeDhcpOptionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeEgressOnlyInternetGatewaysRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeEgressOnlyInternetGatewaysResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeElasticGpusRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeElasticGpusResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeExportImageTasksRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeExportImageTasksResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeExportTasksRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeExportTasksResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFastLaunchImagesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFastLaunchImagesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFastLaunchImagesSuccessItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFastSnapshotRestoreSuccessItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFastSnapshotRestoresRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFastSnapshotRestoresResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFleetError API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFleetHistoryRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFleetHistoryResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFleetInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFleetInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFleetsInstances API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFleetsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFleetsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFlowLogsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFlowLogsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFpgaImageAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFpgaImageAttributeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFpgaImagesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeFpgaImagesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeHostReservationOfferingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeHostReservationOfferingsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeHostReservationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeHostReservationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeHostsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeHostsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIamInstanceProfileAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIamInstanceProfileAssociationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIdFormatRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIdFormatResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIdentityIdFormatRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIdentityIdFormatResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeImageAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeImagesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeImagesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeImportImageTasksRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeImportImageTasksResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeImportSnapshotTasksRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeImportSnapshotTasksResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstanceAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstanceCreditSpecificationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstanceCreditSpecificationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstanceEventNotificationAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstanceEventNotificationAttributesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstanceEventWindowsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstanceEventWindowsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstanceStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstanceStatusResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstanceTypeOfferingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstanceTypeOfferingsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstanceTypesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstanceTypesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInternetGatewaysRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeInternetGatewaysResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIpamPoolsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIpamPoolsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIpamResourceDiscoveriesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIpamResourceDiscoveriesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIpamResourceDiscoveryAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIpamResourceDiscoveryAssociationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIpamScopesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIpamScopesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIpamsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIpamsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIpv6PoolsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeIpv6PoolsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeKeyPairsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeKeyPairsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLaunchTemplateVersionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLaunchTemplateVersionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLaunchTemplatesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLaunchTemplatesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLocalGatewayRouteTablesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLocalGatewayRouteTablesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLocalGatewayVirtualInterfacesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLocalGatewayVirtualInterfacesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLocalGatewaysRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeLocalGatewaysResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeManagedPrefixListsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeManagedPrefixListsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeMovingAddressesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeMovingAddressesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNatGatewaysRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNatGatewaysResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkAclsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkAclsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInsightsAccessScopeAnalysesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInsightsAccessScopeAnalysesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInsightsAccessScopesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInsightsAccessScopesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInsightsAnalysesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInsightsAnalysesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInsightsPathsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInsightsPathsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInterfaceAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInterfaceAttributeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInterfacePermissionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInterfacePermissionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInterfacesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeNetworkInterfacesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribePlacementGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribePlacementGroupsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribePrefixListsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribePrefixListsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribePrincipalIdFormatRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribePrincipalIdFormatResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribePublicIpv4PoolsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribePublicIpv4PoolsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeRegionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeRegionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeReplaceRootVolumeTasksRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeReplaceRootVolumeTasksResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeReservedInstancesListingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeReservedInstancesListingsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeReservedInstancesModificationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeReservedInstancesModificationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeReservedInstancesOfferingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeReservedInstancesOfferingsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeReservedInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeReservedInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeRouteTablesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeRouteTablesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeScheduledInstanceAvailabilityRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeScheduledInstanceAvailabilityResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeScheduledInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeScheduledInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSecurityGroupReferencesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSecurityGroupReferencesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSecurityGroupRulesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSecurityGroupRulesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSecurityGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSecurityGroupsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSnapshotAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSnapshotAttributeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSnapshotTierStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSnapshotTierStatusResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSnapshotsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSnapshotsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSpotDatafeedSubscriptionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSpotDatafeedSubscriptionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSpotFleetInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSpotFleetInstancesResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSpotFleetRequestHistoryRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSpotFleetRequestHistoryResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSpotFleetRequestsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSpotFleetRequestsResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSpotInstanceRequestsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSpotInstanceRequestsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSpotPriceHistoryRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSpotPriceHistoryResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeStaleSecurityGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeStaleSecurityGroupsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeStoreImageTasksRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeStoreImageTasksResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSubnetsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeSubnetsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTagsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTagsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTrafficMirrorFiltersRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTrafficMirrorFiltersResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTrafficMirrorSessionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTrafficMirrorSessionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTrafficMirrorTargetsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTrafficMirrorTargetsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayAttachmentsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayAttachmentsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayConnectPeersRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayConnectPeersResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayConnectsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayConnectsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayMulticastDomainsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayMulticastDomainsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayPeeringAttachmentsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayPeeringAttachmentsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayPolicyTablesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayPolicyTablesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayRouteTableAnnouncementsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayRouteTableAnnouncementsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayRouteTablesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayRouteTablesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayVpcAttachmentsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewayVpcAttachmentsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewaysRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTransitGatewaysResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTrunkInterfaceAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeTrunkInterfaceAssociationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVerifiedAccessEndpointsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVerifiedAccessEndpointsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVerifiedAccessGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVerifiedAccessGroupsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVerifiedAccessInstanceLoggingConfigurationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVerifiedAccessInstanceLoggingConfigurationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVerifiedAccessInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVerifiedAccessInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVerifiedAccessTrustProvidersRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVerifiedAccessTrustProvidersResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVolumeAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVolumeAttributeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVolumeStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVolumeStatusResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVolumesModificationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVolumesModificationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVolumesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVolumesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcAttributeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcClassicLinkDnsSupportRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcClassicLinkDnsSupportResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcClassicLinkRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcClassicLinkResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcEndpointConnectionNotificationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcEndpointConnectionNotificationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcEndpointConnectionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcEndpointConnectionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcEndpointServiceConfigurationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcEndpointServiceConfigurationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcEndpointServicePermissionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcEndpointServicePermissionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcEndpointServicesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcEndpointServicesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcEndpointsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcEndpointsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcPeeringConnectionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcPeeringConnectionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpcsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpnConnectionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpnConnectionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpnGatewaysRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DescribeVpnGatewaysResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DestinationOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DestinationOptionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2DetachClassicLinkVpcRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DetachClassicLinkVpcResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DetachInternetGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DetachNetworkInterfaceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DetachVerifiedAccessTrustProviderRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DetachVerifiedAccessTrustProviderResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DetachVolumeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DetachVpnGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DeviceOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2DhcpConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSEC2DhcpOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2DirectoryServiceAuthentication API_AVAILABLE(ios(11));
- (void) test_AWSEC2DirectoryServiceAuthenticationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableAddressTransferRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableAddressTransferResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableAwsNetworkPerformanceMetricSubscriptionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableAwsNetworkPerformanceMetricSubscriptionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableEbsEncryptionByDefaultRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableEbsEncryptionByDefaultResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableFastLaunchRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableFastLaunchResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableFastSnapshotRestoreErrorItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableFastSnapshotRestoreStateError API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableFastSnapshotRestoreStateErrorItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableFastSnapshotRestoreSuccessItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableFastSnapshotRestoresRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableFastSnapshotRestoresResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableImageDeprecationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableImageDeprecationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableIpamOrganizationAdminAccountRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableIpamOrganizationAdminAccountResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableSerialConsoleAccessRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableSerialConsoleAccessResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableTransitGatewayRouteTablePropagationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableTransitGatewayRouteTablePropagationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableVgwRoutePropagationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableVpcClassicLinkDnsSupportRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableVpcClassicLinkDnsSupportResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableVpcClassicLinkRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisableVpcClassicLinkResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateAddressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateClientVpnTargetNetworkRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateClientVpnTargetNetworkResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateEnclaveCertificateIamRoleRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateEnclaveCertificateIamRoleResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateIamInstanceProfileRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateIamInstanceProfileResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateInstanceEventWindowRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateInstanceEventWindowResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateIpamResourceDiscoveryRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateIpamResourceDiscoveryResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateNatGatewayAddressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateNatGatewayAddressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateRouteTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateSubnetCidrBlockRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateSubnetCidrBlockResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateTransitGatewayMulticastDomainRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateTransitGatewayMulticastDomainResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateTransitGatewayPolicyTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateTransitGatewayPolicyTableResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateTransitGatewayRouteTableRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateTransitGatewayRouteTableResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateTrunkInterfaceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateTrunkInterfaceResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateVpcCidrBlockRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2DisassociateVpcCidrBlockResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2DiskImage API_AVAILABLE(ios(11));
- (void) test_AWSEC2DiskImageDescription API_AVAILABLE(ios(11));
- (void) test_AWSEC2DiskImageDetail API_AVAILABLE(ios(11));
- (void) test_AWSEC2DiskImageVolumeDescription API_AVAILABLE(ios(11));
- (void) test_AWSEC2DiskInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2DnsEntry API_AVAILABLE(ios(11));
- (void) test_AWSEC2DnsOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2DnsOptionsSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2DnsServersOptionsModifyStructure API_AVAILABLE(ios(11));
- (void) test_AWSEC2EbsBlockDevice API_AVAILABLE(ios(11));
- (void) test_AWSEC2EbsInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2EbsInstanceBlockDevice API_AVAILABLE(ios(11));
- (void) test_AWSEC2EbsInstanceBlockDeviceSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2EbsOptimizedInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2EfaInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2EgressOnlyInternetGateway API_AVAILABLE(ios(11));
- (void) test_AWSEC2ElasticGpuAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2ElasticGpuHealth API_AVAILABLE(ios(11));
- (void) test_AWSEC2ElasticGpuSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2ElasticGpuSpecificationResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2ElasticGpus API_AVAILABLE(ios(11));
- (void) test_AWSEC2ElasticInferenceAccelerator API_AVAILABLE(ios(11));
- (void) test_AWSEC2ElasticInferenceAcceleratorAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnaSrdSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnaSrdUdpSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableAddressTransferRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableAddressTransferResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableAwsNetworkPerformanceMetricSubscriptionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableAwsNetworkPerformanceMetricSubscriptionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableEbsEncryptionByDefaultRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableEbsEncryptionByDefaultResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableFastLaunchRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableFastLaunchResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableFastSnapshotRestoreErrorItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableFastSnapshotRestoreStateError API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableFastSnapshotRestoreStateErrorItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableFastSnapshotRestoreSuccessItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableFastSnapshotRestoresRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableFastSnapshotRestoresResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableImageDeprecationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableImageDeprecationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableIpamOrganizationAdminAccountRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableIpamOrganizationAdminAccountResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableReachabilityAnalyzerOrganizationSharingRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableReachabilityAnalyzerOrganizationSharingResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableSerialConsoleAccessRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableSerialConsoleAccessResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableTransitGatewayRouteTablePropagationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableTransitGatewayRouteTablePropagationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableVgwRoutePropagationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableVolumeIORequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableVpcClassicLinkDnsSupportRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableVpcClassicLinkDnsSupportResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableVpcClassicLinkRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnableVpcClassicLinkResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnclaveOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2EnclaveOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2EventInformation API_AVAILABLE(ios(11));
- (void) test_AWSEC2Explanation API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportClientVpnClientCertificateRevocationListRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportClientVpnClientCertificateRevocationListResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportClientVpnClientConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportClientVpnClientConfigurationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportImageRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportImageResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportImageTask API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportTask API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportTaskS3Location API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportTaskS3LocationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportToS3Task API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportToS3TaskSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportTransitGatewayRoutesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ExportTransitGatewayRoutesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2FailedCapacityReservationFleetCancellationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2FailedQueuedPurchaseDeletion API_AVAILABLE(ios(11));
- (void) test_AWSEC2FastLaunchLaunchTemplateSpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2FastLaunchLaunchTemplateSpecificationResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2FastLaunchSnapshotConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2FastLaunchSnapshotConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2FederatedAuthentication API_AVAILABLE(ios(11));
- (void) test_AWSEC2FederatedAuthenticationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2Filter API_AVAILABLE(ios(11));
- (void) test_AWSEC2FilterPortRange API_AVAILABLE(ios(11));
- (void) test_AWSEC2FirewallStatefulRule API_AVAILABLE(ios(11));
- (void) test_AWSEC2FirewallStatelessRule API_AVAILABLE(ios(11));
- (void) test_AWSEC2FleetCapacityReservation API_AVAILABLE(ios(11));
- (void) test_AWSEC2FleetData API_AVAILABLE(ios(11));
- (void) test_AWSEC2FleetLaunchTemplateConfig API_AVAILABLE(ios(11));
- (void) test_AWSEC2FleetLaunchTemplateConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2FleetLaunchTemplateOverrides API_AVAILABLE(ios(11));
- (void) test_AWSEC2FleetLaunchTemplateOverridesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2FleetLaunchTemplateSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2FleetLaunchTemplateSpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2FleetSpotCapacityRebalance API_AVAILABLE(ios(11));
- (void) test_AWSEC2FleetSpotCapacityRebalanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2FleetSpotMaintenanceStrategies API_AVAILABLE(ios(11));
- (void) test_AWSEC2FleetSpotMaintenanceStrategiesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2FlowLog API_AVAILABLE(ios(11));
- (void) test_AWSEC2FpgaDeviceInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2FpgaDeviceMemoryInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2FpgaImage API_AVAILABLE(ios(11));
- (void) test_AWSEC2FpgaImageAttribute API_AVAILABLE(ios(11));
- (void) test_AWSEC2FpgaImageState API_AVAILABLE(ios(11));
- (void) test_AWSEC2FpgaInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetAssociatedEnclaveCertificateIamRolesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetAssociatedEnclaveCertificateIamRolesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetAssociatedIpv6PoolCidrsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetAssociatedIpv6PoolCidrsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetAwsNetworkPerformanceDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetAwsNetworkPerformanceDataResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetCapacityReservationUsageRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetCapacityReservationUsageResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetCoipPoolUsageRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetCoipPoolUsageResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetConsoleOutputRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetConsoleOutputResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetConsoleScreenshotRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetConsoleScreenshotResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetDefaultCreditSpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetDefaultCreditSpecificationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetEbsDefaultKmsKeyIdRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetEbsDefaultKmsKeyIdResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetEbsEncryptionByDefaultRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetEbsEncryptionByDefaultResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetFlowLogsIntegrationTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetFlowLogsIntegrationTemplateResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetGroupsForCapacityReservationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetGroupsForCapacityReservationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetHostReservationPurchasePreviewRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetHostReservationPurchasePreviewResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetInstanceTypesFromInstanceRequirementsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetInstanceTypesFromInstanceRequirementsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetInstanceUefiDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetInstanceUefiDataResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetIpamAddressHistoryRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetIpamAddressHistoryResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetIpamDiscoveredAccountsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetIpamDiscoveredAccountsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetIpamDiscoveredResourceCidrsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetIpamDiscoveredResourceCidrsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetIpamPoolAllocationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetIpamPoolAllocationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetIpamPoolCidrsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetIpamPoolCidrsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetIpamResourceCidrsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetIpamResourceCidrsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetLaunchTemplateDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetLaunchTemplateDataResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetManagedPrefixListAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetManagedPrefixListAssociationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetManagedPrefixListEntriesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetManagedPrefixListEntriesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetNetworkInsightsAccessScopeAnalysisFindingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetNetworkInsightsAccessScopeAnalysisFindingsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetNetworkInsightsAccessScopeContentRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetNetworkInsightsAccessScopeContentResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetPasswordDataRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetPasswordDataResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetReservedInstancesExchangeQuoteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetReservedInstancesExchangeQuoteResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetSerialConsoleAccessStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetSerialConsoleAccessStatusResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetSpotPlacementScoresRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetSpotPlacementScoresResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetSubnetCidrReservationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetSubnetCidrReservationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayAttachmentPropagationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayAttachmentPropagationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayMulticastDomainAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayMulticastDomainAssociationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayPolicyTableAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayPolicyTableAssociationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayPolicyTableEntriesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayPolicyTableEntriesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayPrefixListReferencesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayPrefixListReferencesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayRouteTableAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayRouteTableAssociationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayRouteTablePropagationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetTransitGatewayRouteTablePropagationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetVerifiedAccessEndpointPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetVerifiedAccessEndpointPolicyResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetVerifiedAccessGroupPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetVerifiedAccessGroupPolicyResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetVpnConnectionDeviceSampleConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetVpnConnectionDeviceSampleConfigurationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetVpnConnectionDeviceTypesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetVpnConnectionDeviceTypesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetVpnTunnelReplacementStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2GetVpnTunnelReplacementStatusResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2GpuDeviceInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2GpuDeviceMemoryInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2GpuInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2GroupIdentifier API_AVAILABLE(ios(11));
- (void) test_AWSEC2HibernationOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2HibernationOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2HistoryRecord API_AVAILABLE(ios(11));
- (void) test_AWSEC2HistoryRecordEntry API_AVAILABLE(ios(11));
- (void) test_AWSEC2Host API_AVAILABLE(ios(11));
- (void) test_AWSEC2HostInstance API_AVAILABLE(ios(11));
- (void) test_AWSEC2HostOffering API_AVAILABLE(ios(11));
- (void) test_AWSEC2HostProperties API_AVAILABLE(ios(11));
- (void) test_AWSEC2HostReservation API_AVAILABLE(ios(11));
- (void) test_AWSEC2IKEVersionsListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2IKEVersionsRequestListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2IamInstanceProfile API_AVAILABLE(ios(11));
- (void) test_AWSEC2IamInstanceProfileAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2IamInstanceProfileSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2IcmpTypeCode API_AVAILABLE(ios(11));
- (void) test_AWSEC2IdFormat API_AVAILABLE(ios(11));
- (void) test_AWSEC2Image API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImageAttribute API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImageDiskContainer API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImageRecycleBinInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportClientVpnClientCertificateRevocationListRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportClientVpnClientCertificateRevocationListResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportImageLicenseConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportImageLicenseConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportImageRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportImageResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportImageTask API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportInstanceLaunchSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportInstanceResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportInstanceTaskDetails API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportInstanceVolumeDetailItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportKeyPairRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportKeyPairResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportSnapshotRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportSnapshotResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportSnapshotTask API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportVolumeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportVolumeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ImportVolumeTaskDetails API_AVAILABLE(ios(11));
- (void) test_AWSEC2InferenceAcceleratorInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2InferenceDeviceInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2Instance API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceAttribute API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceBlockDeviceMapping API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceBlockDeviceMappingSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceCapacity API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceCount API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceCreditSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceCreditSpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceEventWindow API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceEventWindowAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceEventWindowAssociationTarget API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceEventWindowDisassociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceEventWindowStateChange API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceEventWindowTimeRange API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceEventWindowTimeRangeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceExportDetails API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceFamilyCreditSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceIpv4Prefix API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceIpv6Address API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceIpv6AddressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceIpv6Prefix API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceMaintenanceOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceMaintenanceOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceMarketOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceMetadataOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceMetadataOptionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceMonitoring API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceNetworkInterface API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceNetworkInterfaceAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceNetworkInterfaceAttachment API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceNetworkInterfaceSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstancePrivateIpAddress API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceRequirements API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceRequirementsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceRequirementsWithMetadataRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceState API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceStateChange API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceStatusDetails API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceStatusEvent API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceStatusSummary API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceStorageInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceTagNotificationAttribute API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceTypeInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceTypeInfoFromInstanceRequirements API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceTypeOffering API_AVAILABLE(ios(11));
- (void) test_AWSEC2InstanceUsage API_AVAILABLE(ios(11));
- (void) test_AWSEC2IntegrateServices API_AVAILABLE(ios(11));
- (void) test_AWSEC2InternetGateway API_AVAILABLE(ios(11));
- (void) test_AWSEC2InternetGatewayAttachment API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpPermission API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpRange API_AVAILABLE(ios(11));
- (void) test_AWSEC2Ipam API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamAddressHistoryRecord API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamCidrAuthorizationContext API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamDiscoveredAccount API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamDiscoveredResourceCidr API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamDiscoveryFailureReason API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamOperatingRegion API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamPool API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamPoolAllocation API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamPoolCidr API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamPoolCidrFailureReason API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamResourceCidr API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamResourceDiscovery API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamResourceDiscoveryAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamResourceTag API_AVAILABLE(ios(11));
- (void) test_AWSEC2IpamScope API_AVAILABLE(ios(11));
- (void) test_AWSEC2Ipv4PrefixSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2Ipv4PrefixSpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2Ipv4PrefixSpecificationResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2Ipv6CidrAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2Ipv6CidrBlock API_AVAILABLE(ios(11));
- (void) test_AWSEC2Ipv6Pool API_AVAILABLE(ios(11));
- (void) test_AWSEC2Ipv6PrefixSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2Ipv6PrefixSpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2Ipv6PrefixSpecificationResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2Ipv6Range API_AVAILABLE(ios(11));
- (void) test_AWSEC2KeyPair API_AVAILABLE(ios(11));
- (void) test_AWSEC2KeyPairInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2LastError API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchPermission API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchPermissionModifications API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplate API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateAndOverridesResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateBlockDeviceMapping API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateBlockDeviceMappingRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateCapacityReservationSpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateCapacityReservationSpecificationResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateConfig API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateCpuOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateCpuOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateEbsBlockDevice API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateEbsBlockDeviceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateElasticInferenceAccelerator API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateElasticInferenceAcceleratorResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateEnclaveOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateEnclaveOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateHibernationOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateHibernationOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateIamInstanceProfileSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateIamInstanceProfileSpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateInstanceMaintenanceOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateInstanceMaintenanceOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateInstanceMarketOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateInstanceMarketOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateInstanceMetadataOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateInstanceMetadataOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateInstanceNetworkInterfaceSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateInstanceNetworkInterfaceSpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateLicenseConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateLicenseConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateOverrides API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplatePlacement API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplatePlacementRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplatePrivateDnsNameOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplatePrivateDnsNameOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateSpotMarketOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateSpotMarketOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateTagSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateTagSpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplateVersion API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplatesMonitoring API_AVAILABLE(ios(11));
- (void) test_AWSEC2LaunchTemplatesMonitoringRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LicenseConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSEC2LicenseConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ListImagesInRecycleBinRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ListImagesInRecycleBinResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ListSnapshotsInRecycleBinRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ListSnapshotsInRecycleBinResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2LoadBalancersConfig API_AVAILABLE(ios(11));
- (void) test_AWSEC2LoadPermission API_AVAILABLE(ios(11));
- (void) test_AWSEC2LoadPermissionModifications API_AVAILABLE(ios(11));
- (void) test_AWSEC2LoadPermissionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2LocalGateway API_AVAILABLE(ios(11));
- (void) test_AWSEC2LocalGatewayRoute API_AVAILABLE(ios(11));
- (void) test_AWSEC2LocalGatewayRouteTable API_AVAILABLE(ios(11));
- (void) test_AWSEC2LocalGatewayRouteTableVirtualInterfaceGroupAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2LocalGatewayRouteTableVpcAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2LocalGatewayVirtualInterface API_AVAILABLE(ios(11));
- (void) test_AWSEC2LocalGatewayVirtualInterfaceGroup API_AVAILABLE(ios(11));
- (void) test_AWSEC2MaintenanceDetails API_AVAILABLE(ios(11));
- (void) test_AWSEC2ManagedPrefixList API_AVAILABLE(ios(11));
- (void) test_AWSEC2MemoryGiBPerVCpu API_AVAILABLE(ios(11));
- (void) test_AWSEC2MemoryGiBPerVCpuRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2MemoryInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2MemoryMiB API_AVAILABLE(ios(11));
- (void) test_AWSEC2MemoryMiBRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2MetricPoint API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyAddressAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyAddressAttributeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyAvailabilityZoneGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyAvailabilityZoneGroupResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyCapacityReservationFleetRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyCapacityReservationFleetResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyCapacityReservationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyCapacityReservationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyClientVpnEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyClientVpnEndpointResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyDefaultCreditSpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyDefaultCreditSpecificationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyEbsDefaultKmsKeyIdRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyEbsDefaultKmsKeyIdResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyFleetRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyFleetResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyFpgaImageAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyFpgaImageAttributeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyHostsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyHostsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyIdFormatRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyIdentityIdFormatRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyImageAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstanceAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstanceCapacityReservationAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstanceCapacityReservationAttributesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstanceCreditSpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstanceCreditSpecificationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstanceEventStartTimeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstanceEventStartTimeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstanceEventWindowRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstanceEventWindowResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstanceMaintenanceOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstanceMaintenanceOptionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstanceMetadataOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstanceMetadataOptionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstancePlacementRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyInstancePlacementResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyIpamPoolRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyIpamPoolResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyIpamRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyIpamResourceCidrRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyIpamResourceCidrResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyIpamResourceDiscoveryRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyIpamResourceDiscoveryResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyIpamResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyIpamScopeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyIpamScopeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyLaunchTemplateRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyLaunchTemplateResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyLocalGatewayRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyLocalGatewayRouteResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyManagedPrefixListRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyManagedPrefixListResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyNetworkInterfaceAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyPrivateDnsNameOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyPrivateDnsNameOptionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyReservedInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyReservedInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifySecurityGroupRulesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifySecurityGroupRulesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifySnapshotAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifySnapshotTierRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifySnapshotTierResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifySpotFleetRequestRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifySpotFleetRequestResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifySubnetAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTrafficMirrorFilterNetworkServicesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTrafficMirrorFilterRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTrafficMirrorFilterRuleResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTrafficMirrorSessionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTrafficMirrorSessionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTransitGatewayOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTransitGatewayPrefixListReferenceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTransitGatewayPrefixListReferenceResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTransitGatewayRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTransitGatewayResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTransitGatewayVpcAttachmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTransitGatewayVpcAttachmentRequestOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyTransitGatewayVpcAttachmentResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessEndpointEniOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessEndpointLoadBalancerOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessEndpointPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessEndpointPolicyResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessEndpointResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessGroupPolicyRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessGroupPolicyResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessGroupResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessInstanceLoggingConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessInstanceLoggingConfigurationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessInstanceResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessTrustProviderOidcOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessTrustProviderRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVerifiedAccessTrustProviderResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVolumeAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVolumeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVolumeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcEndpointConnectionNotificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcEndpointConnectionNotificationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcEndpointRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcEndpointResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcEndpointServiceConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcEndpointServiceConfigurationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcEndpointServicePayerResponsibilityRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcEndpointServicePayerResponsibilityResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcEndpointServicePermissionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcEndpointServicePermissionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcPeeringConnectionOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcPeeringConnectionOptionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcTenancyRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpcTenancyResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpnConnectionOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpnConnectionOptionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpnConnectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpnConnectionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpnTunnelCertificateRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpnTunnelCertificateResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpnTunnelOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpnTunnelOptionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ModifyVpnTunnelOptionsSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2MonitorInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2MonitorInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2Monitoring API_AVAILABLE(ios(11));
- (void) test_AWSEC2MoveAddressToVpcRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2MoveAddressToVpcResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2MoveByoipCidrToIpamRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2MoveByoipCidrToIpamResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2MovingAddressStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2NatGateway API_AVAILABLE(ios(11));
- (void) test_AWSEC2NatGatewayAddress API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkAcl API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkAclAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkAclEntry API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkBandwidthGbps API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkBandwidthGbpsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkCardInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInsightsAccessScope API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInsightsAccessScopeAnalysis API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInsightsAccessScopeContent API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInsightsAnalysis API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInsightsPath API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInterface API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInterfaceAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInterfaceAttachment API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInterfaceAttachmentChanges API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInterfaceCount API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInterfaceCountRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInterfaceIpv6Address API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInterfacePermission API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInterfacePermissionState API_AVAILABLE(ios(11));
- (void) test_AWSEC2NetworkInterfacePrivateIpAddress API_AVAILABLE(ios(11));
- (void) test_AWSEC2LatestDhcpConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSEC2OidcOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2OnDemandOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2OnDemandOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2PacketHeaderStatement API_AVAILABLE(ios(11));
- (void) test_AWSEC2PacketHeaderStatementRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2PathComponent API_AVAILABLE(ios(11));
- (void) test_AWSEC2PathFilter API_AVAILABLE(ios(11));
- (void) test_AWSEC2PathRequestFilter API_AVAILABLE(ios(11));
- (void) test_AWSEC2PathStatement API_AVAILABLE(ios(11));
- (void) test_AWSEC2PathStatementRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2PciId API_AVAILABLE(ios(11));
- (void) test_AWSEC2PeeringAttachmentStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2PeeringConnectionOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2PeeringConnectionOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2PeeringTgwInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2Phase1DHGroupNumbersListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2Phase1DHGroupNumbersRequestListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2Phase1EncryptionAlgorithmsListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2Phase1EncryptionAlgorithmsRequestListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2Phase1IntegrityAlgorithmsListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2Phase1IntegrityAlgorithmsRequestListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2Phase2DHGroupNumbersListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2Phase2DHGroupNumbersRequestListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2Phase2EncryptionAlgorithmsListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2Phase2EncryptionAlgorithmsRequestListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2Phase2IntegrityAlgorithmsListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2Phase2IntegrityAlgorithmsRequestListValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2Placement API_AVAILABLE(ios(11));
- (void) test_AWSEC2PlacementGroup API_AVAILABLE(ios(11));
- (void) test_AWSEC2PlacementGroupInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2PlacementResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2PoolCidrBlock API_AVAILABLE(ios(11));
- (void) test_AWSEC2PortRange API_AVAILABLE(ios(11));
- (void) test_AWSEC2PrefixList API_AVAILABLE(ios(11));
- (void) test_AWSEC2PrefixListAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2PrefixListEntry API_AVAILABLE(ios(11));
- (void) test_AWSEC2PrefixListId API_AVAILABLE(ios(11));
- (void) test_AWSEC2PriceSchedule API_AVAILABLE(ios(11));
- (void) test_AWSEC2PriceScheduleSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2PricingDetail API_AVAILABLE(ios(11));
- (void) test_AWSEC2PrincipalIdFormat API_AVAILABLE(ios(11));
- (void) test_AWSEC2PrivateDnsDetails API_AVAILABLE(ios(11));
- (void) test_AWSEC2PrivateDnsNameConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSEC2PrivateDnsNameOptionsOnLaunch API_AVAILABLE(ios(11));
- (void) test_AWSEC2PrivateDnsNameOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2PrivateDnsNameOptionsResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2PrivateIpAddressSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2ProcessorInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2ProductCode API_AVAILABLE(ios(11));
- (void) test_AWSEC2PropagatingVgw API_AVAILABLE(ios(11));
- (void) test_AWSEC2ProvisionByoipCidrRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ProvisionByoipCidrResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ProvisionIpamPoolCidrRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ProvisionIpamPoolCidrResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ProvisionPublicIpv4PoolCidrRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ProvisionPublicIpv4PoolCidrResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ProvisionedBandwidth API_AVAILABLE(ios(11));
- (void) test_AWSEC2PtrUpdateStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2PublicIpv4Pool API_AVAILABLE(ios(11));
- (void) test_AWSEC2PublicIpv4PoolRange API_AVAILABLE(ios(11));
- (void) test_AWSEC2Purchase API_AVAILABLE(ios(11));
- (void) test_AWSEC2PurchaseHostReservationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2PurchaseHostReservationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2PurchaseRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2PurchaseReservedInstancesOfferingRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2PurchaseReservedInstancesOfferingResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2PurchaseScheduledInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2PurchaseScheduledInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RebootInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RecurringCharge API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReferencedSecurityGroup API_AVAILABLE(ios(11));
- (void) test_AWSEC2Region API_AVAILABLE(ios(11));
- (void) test_AWSEC2RegisterImageRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RegisterImageResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RegisterInstanceEventNotificationAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RegisterInstanceEventNotificationAttributesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RegisterInstanceTagAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RegisterTransitGatewayMulticastGroupMembersRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RegisterTransitGatewayMulticastGroupMembersResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RegisterTransitGatewayMulticastGroupSourcesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RejectTransitGatewayMulticastDomainAssociationsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RejectTransitGatewayMulticastDomainAssociationsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RejectTransitGatewayPeeringAttachmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RejectTransitGatewayPeeringAttachmentResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RejectTransitGatewayVpcAttachmentRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RejectTransitGatewayVpcAttachmentResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RejectVpcEndpointConnectionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RejectVpcEndpointConnectionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RejectVpcPeeringConnectionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RejectVpcPeeringConnectionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReleaseAddressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReleaseHostsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReleaseHostsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReleaseIpamPoolAllocationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReleaseIpamPoolAllocationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RemoveIpamOperatingRegion API_AVAILABLE(ios(11));
- (void) test_AWSEC2RemovePrefixListEntry API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplaceIamInstanceProfileAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplaceIamInstanceProfileAssociationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplaceNetworkAclAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplaceNetworkAclAssociationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplaceNetworkAclEntryRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplaceRootVolumeTask API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplaceRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplaceRouteTableAssociationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplaceRouteTableAssociationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplaceTransitGatewayRouteRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplaceTransitGatewayRouteResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplaceVpnTunnelRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReplaceVpnTunnelResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReportInstanceStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RequestFilterPortRange API_AVAILABLE(ios(11));
- (void) test_AWSEC2RequestIpamResourceTag API_AVAILABLE(ios(11));
- (void) test_AWSEC2RequestLaunchTemplateData API_AVAILABLE(ios(11));
- (void) test_AWSEC2RequestSpotFleetRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RequestSpotFleetResponse API_AVAILABLE(ios(11));
- (void) test_AWSEC2RequestSpotInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RequestSpotInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RequestSpotLaunchSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2Reservation API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReservationFleetInstanceSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReservationValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReservedInstanceLimitPrice API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReservedInstanceReservationValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReservedInstances API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReservedInstancesConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReservedInstancesId API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReservedInstancesListing API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReservedInstancesModification API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReservedInstancesModificationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ReservedInstancesOffering API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResetAddressAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResetAddressAttributeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResetEbsDefaultKmsKeyIdRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResetEbsDefaultKmsKeyIdResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResetFpgaImageAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResetFpgaImageAttributeResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResetImageAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResetInstanceAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResetNetworkInterfaceAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResetSnapshotAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResourceStatement API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResourceStatementRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResponseError API_AVAILABLE(ios(11));
- (void) test_AWSEC2ResponseLaunchTemplateData API_AVAILABLE(ios(11));
- (void) test_AWSEC2RestoreAddressToClassicRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RestoreAddressToClassicResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RestoreImageFromRecycleBinRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RestoreImageFromRecycleBinResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RestoreManagedPrefixListVersionRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RestoreManagedPrefixListVersionResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RestoreSnapshotFromRecycleBinRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RestoreSnapshotFromRecycleBinResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RestoreSnapshotTierRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RestoreSnapshotTierResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RevokeClientVpnIngressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RevokeClientVpnIngressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RevokeSecurityGroupEgressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RevokeSecurityGroupEgressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2RevokeSecurityGroupIngressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RevokeSecurityGroupIngressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2Route API_AVAILABLE(ios(11));
- (void) test_AWSEC2RouteTable API_AVAILABLE(ios(11));
- (void) test_AWSEC2RouteTableAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2RouteTableAssociationState API_AVAILABLE(ios(11));
- (void) test_AWSEC2RuleGroupRuleOptionsPair API_AVAILABLE(ios(11));
- (void) test_AWSEC2RuleGroupTypePair API_AVAILABLE(ios(11));
- (void) test_AWSEC2RuleOption API_AVAILABLE(ios(11));
- (void) test_AWSEC2RunInstancesMonitoringEnabled API_AVAILABLE(ios(11));
- (void) test_AWSEC2RunInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RunScheduledInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2RunScheduledInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2S3ObjectTag API_AVAILABLE(ios(11));
- (void) test_AWSEC2S3Storage API_AVAILABLE(ios(11));
- (void) test_AWSEC2ScheduledInstance API_AVAILABLE(ios(11));
- (void) test_AWSEC2ScheduledInstanceAvailability API_AVAILABLE(ios(11));
- (void) test_AWSEC2ScheduledInstanceRecurrence API_AVAILABLE(ios(11));
- (void) test_AWSEC2ScheduledInstanceRecurrenceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ScheduledInstancesBlockDeviceMapping API_AVAILABLE(ios(11));
- (void) test_AWSEC2ScheduledInstancesEbs API_AVAILABLE(ios(11));
- (void) test_AWSEC2ScheduledInstancesIamInstanceProfile API_AVAILABLE(ios(11));
- (void) test_AWSEC2ScheduledInstancesIpv6Address API_AVAILABLE(ios(11));
- (void) test_AWSEC2ScheduledInstancesLaunchSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2ScheduledInstancesMonitoring API_AVAILABLE(ios(11));
- (void) test_AWSEC2ScheduledInstancesNetworkInterface API_AVAILABLE(ios(11));
- (void) test_AWSEC2ScheduledInstancesPlacement API_AVAILABLE(ios(11));
- (void) test_AWSEC2ScheduledInstancesPrivateIpAddressConfig API_AVAILABLE(ios(11));
- (void) test_AWSEC2SearchLocalGatewayRoutesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2SearchLocalGatewayRoutesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2SearchTransitGatewayMulticastGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2SearchTransitGatewayMulticastGroupsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2SearchTransitGatewayRoutesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2SearchTransitGatewayRoutesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2SecurityGroup API_AVAILABLE(ios(11));
- (void) test_AWSEC2SecurityGroupIdentifier API_AVAILABLE(ios(11));
- (void) test_AWSEC2SecurityGroupReference API_AVAILABLE(ios(11));
- (void) test_AWSEC2SecurityGroupRule API_AVAILABLE(ios(11));
- (void) test_AWSEC2SecurityGroupRuleDescription API_AVAILABLE(ios(11));
- (void) test_AWSEC2SecurityGroupRuleRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2SecurityGroupRuleUpdate API_AVAILABLE(ios(11));
- (void) test_AWSEC2SendDiagnosticInterruptRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2ServiceConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSEC2ServiceDetail API_AVAILABLE(ios(11));
- (void) test_AWSEC2ServiceTypeDetail API_AVAILABLE(ios(11));
- (void) test_AWSEC2SlotDateTimeRangeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2SlotStartTimeRangeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2Snapshot API_AVAILABLE(ios(11));
- (void) test_AWSEC2SnapshotDetail API_AVAILABLE(ios(11));
- (void) test_AWSEC2SnapshotDiskContainer API_AVAILABLE(ios(11));
- (void) test_AWSEC2SnapshotInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2SnapshotRecycleBinInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2SnapshotTaskDetail API_AVAILABLE(ios(11));
- (void) test_AWSEC2SnapshotTierStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotCapacityRebalance API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotDatafeedSubscription API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotFleetLaunchSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotFleetMonitoring API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotFleetRequestConfig API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotFleetRequestConfigData API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotFleetTagSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotInstanceRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotInstanceStateFault API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotInstanceStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotMaintenanceStrategies API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotMarketOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotOptionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotPlacement API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotPlacementScore API_AVAILABLE(ios(11));
- (void) test_AWSEC2SpotPrice API_AVAILABLE(ios(11));
- (void) test_AWSEC2StaleIpPermission API_AVAILABLE(ios(11));
- (void) test_AWSEC2StaleSecurityGroup API_AVAILABLE(ios(11));
- (void) test_AWSEC2StartInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2StartInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2StartNetworkInsightsAccessScopeAnalysisRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2StartNetworkInsightsAccessScopeAnalysisResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2StartNetworkInsightsAnalysisRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2StartNetworkInsightsAnalysisResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2StartVpcEndpointServicePrivateDnsVerificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2StateReason API_AVAILABLE(ios(11));
- (void) test_AWSEC2StopInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2StopInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2Storage API_AVAILABLE(ios(11));
- (void) test_AWSEC2StorageLocation API_AVAILABLE(ios(11));
- (void) test_AWSEC2StoreImageTaskResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2Subnet API_AVAILABLE(ios(11));
- (void) test_AWSEC2SubnetAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2SubnetCidrBlockState API_AVAILABLE(ios(11));
- (void) test_AWSEC2SubnetCidrReservation API_AVAILABLE(ios(11));
- (void) test_AWSEC2SubnetIpv6CidrBlockAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2Subscription API_AVAILABLE(ios(11));
- (void) test_AWSEC2SuccessfulInstanceCreditSpecificationItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2SuccessfulQueuedPurchaseDeletion API_AVAILABLE(ios(11));
- (void) test_AWSEC2Tag API_AVAILABLE(ios(11));
- (void) test_AWSEC2TagDescription API_AVAILABLE(ios(11));
- (void) test_AWSEC2TagSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2TargetCapacitySpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2TargetCapacitySpecificationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2TargetConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSEC2TargetConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2TargetGroup API_AVAILABLE(ios(11));
- (void) test_AWSEC2TargetGroupsConfig API_AVAILABLE(ios(11));
- (void) test_AWSEC2TargetNetwork API_AVAILABLE(ios(11));
- (void) test_AWSEC2TargetReservationValue API_AVAILABLE(ios(11));
- (void) test_AWSEC2TerminateClientVpnConnectionsRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2TerminateClientVpnConnectionsResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2TerminateConnectionStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2TerminateInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2TerminateInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2ThroughResourcesStatement API_AVAILABLE(ios(11));
- (void) test_AWSEC2ThroughResourcesStatementRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2TotalLocalStorageGB API_AVAILABLE(ios(11));
- (void) test_AWSEC2TotalLocalStorageGBRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2TrafficMirrorFilter API_AVAILABLE(ios(11));
- (void) test_AWSEC2TrafficMirrorFilterRule API_AVAILABLE(ios(11));
- (void) test_AWSEC2TrafficMirrorPortRange API_AVAILABLE(ios(11));
- (void) test_AWSEC2TrafficMirrorPortRangeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2TrafficMirrorSession API_AVAILABLE(ios(11));
- (void) test_AWSEC2TrafficMirrorTarget API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGateway API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayAttachment API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayAttachmentAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayAttachmentBgpConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayAttachmentPropagation API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayConnect API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayConnectOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayConnectPeer API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayConnectPeerConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayConnectRequestBgpOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayMulticastDeregisteredGroupMembers API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayMulticastDeregisteredGroupSources API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayMulticastDomain API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayMulticastDomainAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayMulticastDomainAssociations API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayMulticastDomainOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayMulticastGroup API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayMulticastRegisteredGroupMembers API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayMulticastRegisteredGroupSources API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayPeeringAttachment API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayPeeringAttachmentOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayPolicyRule API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayPolicyRuleMetaData API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayPolicyTable API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayPolicyTableAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayPolicyTableEntry API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayPrefixListAttachment API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayPrefixListReference API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayPropagation API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayRequestOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayRoute API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayRouteAttachment API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayRouteTable API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayRouteTableAnnouncement API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayRouteTableAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayRouteTablePropagation API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayRouteTableRoute API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayVpcAttachment API_AVAILABLE(ios(11));
- (void) test_AWSEC2TransitGatewayVpcAttachmentOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2TrunkInterfaceAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2TunnelOption API_AVAILABLE(ios(11));
- (void) test_AWSEC2UnassignIpv6AddressesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2UnassignIpv6AddressesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2UnassignPrivateIpAddressesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2UnassignPrivateNatGatewayAddressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2UnassignPrivateNatGatewayAddressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2UnmonitorInstancesRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2UnmonitorInstancesResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2UnsuccessfulInstanceCreditSpecificationItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2UnsuccessfulInstanceCreditSpecificationItemError API_AVAILABLE(ios(11));
- (void) test_AWSEC2UnsuccessfulItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2UnsuccessfulItemError API_AVAILABLE(ios(11));
- (void) test_AWSEC2UpdateSecurityGroupRuleDescriptionsEgressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2UpdateSecurityGroupRuleDescriptionsIngressRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult API_AVAILABLE(ios(11));
- (void) test_AWSEC2UserBucket API_AVAILABLE(ios(11));
- (void) test_AWSEC2UserBucketDetails API_AVAILABLE(ios(11));
- (void) test_AWSEC2UserData API_AVAILABLE(ios(11));
- (void) test_AWSEC2UserIdGroupPair API_AVAILABLE(ios(11));
- (void) test_AWSEC2VCpuCountRange API_AVAILABLE(ios(11));
- (void) test_AWSEC2VCpuCountRangeRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2VCpuInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2ValidationError API_AVAILABLE(ios(11));
- (void) test_AWSEC2ValidationWarning API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessEndpoint API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessEndpointEniOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessEndpointLoadBalancerOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessEndpointStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessGroup API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessInstance API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessInstanceLoggingConfiguration API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessLogCloudWatchLogsDestination API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessLogCloudWatchLogsDestinationOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessLogDeliveryStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessLogKinesisDataFirehoseDestination API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessLogKinesisDataFirehoseDestinationOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessLogOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessLogS3Destination API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessLogS3DestinationOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessLogs API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessTrustProvider API_AVAILABLE(ios(11));
- (void) test_AWSEC2VerifiedAccessTrustProviderCondensed API_AVAILABLE(ios(11));
- (void) test_AWSEC2VgwTelemetry API_AVAILABLE(ios(11));
- (void) test_AWSEC2Volume API_AVAILABLE(ios(11));
- (void) test_AWSEC2VolumeAttachment API_AVAILABLE(ios(11));
- (void) test_AWSEC2VolumeDetail API_AVAILABLE(ios(11));
- (void) test_AWSEC2VolumeModification API_AVAILABLE(ios(11));
- (void) test_AWSEC2VolumeStatusAction API_AVAILABLE(ios(11));
- (void) test_AWSEC2VolumeStatusAttachmentStatus API_AVAILABLE(ios(11));
- (void) test_AWSEC2VolumeStatusDetails API_AVAILABLE(ios(11));
- (void) test_AWSEC2VolumeStatusEvent API_AVAILABLE(ios(11));
- (void) test_AWSEC2VolumeStatusInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2VolumeStatusItem API_AVAILABLE(ios(11));
- (void) test_AWSEC2Vpc API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpcAttachment API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpcCidrBlockAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpcCidrBlockState API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpcClassicLink API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpcEndpoint API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpcEndpointConnection API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpcIpv6CidrBlockAssociation API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpcPeeringConnection API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpcPeeringConnectionOptionsDescription API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpcPeeringConnectionStateReason API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpcPeeringConnectionVpcInfo API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpnConnection API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpnConnectionDeviceType API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpnConnectionOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpnConnectionOptionsSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpnGateway API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpnStaticRoute API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpnTunnelLogOptions API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpnTunnelLogOptionsSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2VpnTunnelOptionsSpecification API_AVAILABLE(ios(11));
- (void) test_AWSEC2WithdrawByoipCidrRequest API_AVAILABLE(ios(11));
- (void) test_AWSEC2WithdrawByoipCidrResult API_AVAILABLE(ios(11));

@end

@implementation AWSEC2NSSecureCodingTests

- (void) test_AWSEC2AcceleratorCount {
    [self validateSecureCodingForClass:[AWSEC2AcceleratorCount class]];
}

- (void) test_AWSEC2AcceleratorCountRequest {
    [self validateSecureCodingForClass:[AWSEC2AcceleratorCountRequest class]];
}

- (void) test_AWSEC2AcceleratorTotalMemoryMiB {
    [self validateSecureCodingForClass:[AWSEC2AcceleratorTotalMemoryMiB class]];
}

- (void) test_AWSEC2AcceleratorTotalMemoryMiBRequest {
    [self validateSecureCodingForClass:[AWSEC2AcceleratorTotalMemoryMiBRequest class]];
}

- (void) test_AWSEC2AcceptAddressTransferRequest {
    [self validateSecureCodingForClass:[AWSEC2AcceptAddressTransferRequest class]];
}

- (void) test_AWSEC2AcceptAddressTransferResult {
    [self validateSecureCodingForClass:[AWSEC2AcceptAddressTransferResult class]];
}

- (void) test_AWSEC2AcceptReservedInstancesExchangeQuoteRequest {
    [self validateSecureCodingForClass:[AWSEC2AcceptReservedInstancesExchangeQuoteRequest class]];
}

- (void) test_AWSEC2AcceptReservedInstancesExchangeQuoteResult {
    [self validateSecureCodingForClass:[AWSEC2AcceptReservedInstancesExchangeQuoteResult class]];
}

- (void) test_AWSEC2AcceptTransitGatewayMulticastDomainAssociationsRequest {
    [self validateSecureCodingForClass:[AWSEC2AcceptTransitGatewayMulticastDomainAssociationsRequest class]];
}

- (void) test_AWSEC2AcceptTransitGatewayMulticastDomainAssociationsResult {
    [self validateSecureCodingForClass:[AWSEC2AcceptTransitGatewayMulticastDomainAssociationsResult class]];
}

- (void) test_AWSEC2AcceptTransitGatewayPeeringAttachmentRequest {
    [self validateSecureCodingForClass:[AWSEC2AcceptTransitGatewayPeeringAttachmentRequest class]];
}

- (void) test_AWSEC2AcceptTransitGatewayPeeringAttachmentResult {
    [self validateSecureCodingForClass:[AWSEC2AcceptTransitGatewayPeeringAttachmentResult class]];
}

- (void) test_AWSEC2AcceptTransitGatewayVpcAttachmentRequest {
    [self validateSecureCodingForClass:[AWSEC2AcceptTransitGatewayVpcAttachmentRequest class]];
}

- (void) test_AWSEC2AcceptTransitGatewayVpcAttachmentResult {
    [self validateSecureCodingForClass:[AWSEC2AcceptTransitGatewayVpcAttachmentResult class]];
}

- (void) test_AWSEC2AcceptVpcEndpointConnectionsRequest {
    [self validateSecureCodingForClass:[AWSEC2AcceptVpcEndpointConnectionsRequest class]];
}

- (void) test_AWSEC2AcceptVpcEndpointConnectionsResult {
    [self validateSecureCodingForClass:[AWSEC2AcceptVpcEndpointConnectionsResult class]];
}

- (void) test_AWSEC2AcceptVpcPeeringConnectionRequest {
    [self validateSecureCodingForClass:[AWSEC2AcceptVpcPeeringConnectionRequest class]];
}

- (void) test_AWSEC2AcceptVpcPeeringConnectionResult {
    [self validateSecureCodingForClass:[AWSEC2AcceptVpcPeeringConnectionResult class]];
}

- (void) test_AWSEC2AccessScopeAnalysisFinding {
    [self validateSecureCodingForClass:[AWSEC2AccessScopeAnalysisFinding class]];
}

- (void) test_AWSEC2AccessScopePath {
    [self validateSecureCodingForClass:[AWSEC2AccessScopePath class]];
}

- (void) test_AWSEC2AccessScopePathRequest {
    [self validateSecureCodingForClass:[AWSEC2AccessScopePathRequest class]];
}

- (void) test_AWSEC2AccountAttribute {
    [self validateSecureCodingForClass:[AWSEC2AccountAttribute class]];
}

- (void) test_AWSEC2AccountAttributeValue {
    [self validateSecureCodingForClass:[AWSEC2AccountAttributeValue class]];
}

- (void) test_AWSEC2ActiveInstance {
    [self validateSecureCodingForClass:[AWSEC2ActiveInstance class]];
}

- (void) test_AWSEC2AddIpamOperatingRegion {
    [self validateSecureCodingForClass:[AWSEC2AddIpamOperatingRegion class]];
}

- (void) test_AWSEC2AddPrefixListEntry {
    [self validateSecureCodingForClass:[AWSEC2AddPrefixListEntry class]];
}

- (void) test_AWSEC2AddedPrincipal {
    [self validateSecureCodingForClass:[AWSEC2AddedPrincipal class]];
}

- (void) test_AWSEC2AdditionalDetail {
    [self validateSecureCodingForClass:[AWSEC2AdditionalDetail class]];
}

- (void) test_AWSEC2Address {
    [self validateSecureCodingForClass:[AWSEC2Address class]];
}

- (void) test_AWSEC2AddressAttribute {
    [self validateSecureCodingForClass:[AWSEC2AddressAttribute class]];
}

- (void) test_AWSEC2AddressTransfer {
    [self validateSecureCodingForClass:[AWSEC2AddressTransfer class]];
}

- (void) test_AWSEC2AdvertiseByoipCidrRequest {
    [self validateSecureCodingForClass:[AWSEC2AdvertiseByoipCidrRequest class]];
}

- (void) test_AWSEC2AdvertiseByoipCidrResult {
    [self validateSecureCodingForClass:[AWSEC2AdvertiseByoipCidrResult class]];
}

- (void) test_AWSEC2AllocateAddressRequest {
    [self validateSecureCodingForClass:[AWSEC2AllocateAddressRequest class]];
}

- (void) test_AWSEC2AllocateAddressResult {
    [self validateSecureCodingForClass:[AWSEC2AllocateAddressResult class]];
}

- (void) test_AWSEC2AllocateHostsRequest {
    [self validateSecureCodingForClass:[AWSEC2AllocateHostsRequest class]];
}

- (void) test_AWSEC2AllocateHostsResult {
    [self validateSecureCodingForClass:[AWSEC2AllocateHostsResult class]];
}

- (void) test_AWSEC2AllocateIpamPoolCidrRequest {
    [self validateSecureCodingForClass:[AWSEC2AllocateIpamPoolCidrRequest class]];
}

- (void) test_AWSEC2AllocateIpamPoolCidrResult {
    [self validateSecureCodingForClass:[AWSEC2AllocateIpamPoolCidrResult class]];
}

- (void) test_AWSEC2AllowedPrincipal {
    [self validateSecureCodingForClass:[AWSEC2AllowedPrincipal class]];
}

- (void) test_AWSEC2AlternatePathHint {
    [self validateSecureCodingForClass:[AWSEC2AlternatePathHint class]];
}

- (void) test_AWSEC2AnalysisAclRule {
    [self validateSecureCodingForClass:[AWSEC2AnalysisAclRule class]];
}

- (void) test_AWSEC2AnalysisComponent {
    [self validateSecureCodingForClass:[AWSEC2AnalysisComponent class]];
}

- (void) test_AWSEC2AnalysisLoadBalancerListener {
    [self validateSecureCodingForClass:[AWSEC2AnalysisLoadBalancerListener class]];
}

- (void) test_AWSEC2AnalysisLoadBalancerTarget {
    [self validateSecureCodingForClass:[AWSEC2AnalysisLoadBalancerTarget class]];
}

- (void) test_AWSEC2AnalysisPacketHeader {
    [self validateSecureCodingForClass:[AWSEC2AnalysisPacketHeader class]];
}

- (void) test_AWSEC2AnalysisRouteTableRoute {
    [self validateSecureCodingForClass:[AWSEC2AnalysisRouteTableRoute class]];
}

- (void) test_AWSEC2AnalysisSecurityGroupRule {
    [self validateSecureCodingForClass:[AWSEC2AnalysisSecurityGroupRule class]];
}

- (void) test_AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkRequest {
    [self validateSecureCodingForClass:[AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkRequest class]];
}

- (void) test_AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult {
    [self validateSecureCodingForClass:[AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult class]];
}

- (void) test_AWSEC2AssignIpv6AddressesRequest {
    [self validateSecureCodingForClass:[AWSEC2AssignIpv6AddressesRequest class]];
}

- (void) test_AWSEC2AssignIpv6AddressesResult {
    [self validateSecureCodingForClass:[AWSEC2AssignIpv6AddressesResult class]];
}

- (void) test_AWSEC2AssignPrivateIpAddressesRequest {
    [self validateSecureCodingForClass:[AWSEC2AssignPrivateIpAddressesRequest class]];
}

- (void) test_AWSEC2AssignPrivateIpAddressesResult {
    [self validateSecureCodingForClass:[AWSEC2AssignPrivateIpAddressesResult class]];
}

- (void) test_AWSEC2AssignPrivateNatGatewayAddressRequest {
    [self validateSecureCodingForClass:[AWSEC2AssignPrivateNatGatewayAddressRequest class]];
}

- (void) test_AWSEC2AssignPrivateNatGatewayAddressResult {
    [self validateSecureCodingForClass:[AWSEC2AssignPrivateNatGatewayAddressResult class]];
}

- (void) test_AWSEC2AssignedPrivateIpAddress {
    [self validateSecureCodingForClass:[AWSEC2AssignedPrivateIpAddress class]];
}

- (void) test_AWSEC2AssociateAddressRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateAddressRequest class]];
}

- (void) test_AWSEC2AssociateAddressResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateAddressResult class]];
}

- (void) test_AWSEC2AssociateClientVpnTargetNetworkRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateClientVpnTargetNetworkRequest class]];
}

- (void) test_AWSEC2AssociateClientVpnTargetNetworkResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateClientVpnTargetNetworkResult class]];
}

- (void) test_AWSEC2AssociateDhcpOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateDhcpOptionsRequest class]];
}

- (void) test_AWSEC2AssociateEnclaveCertificateIamRoleRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateEnclaveCertificateIamRoleRequest class]];
}

- (void) test_AWSEC2AssociateEnclaveCertificateIamRoleResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateEnclaveCertificateIamRoleResult class]];
}

- (void) test_AWSEC2AssociateIamInstanceProfileRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateIamInstanceProfileRequest class]];
}

- (void) test_AWSEC2AssociateIamInstanceProfileResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateIamInstanceProfileResult class]];
}

- (void) test_AWSEC2AssociateInstanceEventWindowRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateInstanceEventWindowRequest class]];
}

- (void) test_AWSEC2AssociateInstanceEventWindowResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateInstanceEventWindowResult class]];
}

- (void) test_AWSEC2AssociateIpamResourceDiscoveryRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateIpamResourceDiscoveryRequest class]];
}

- (void) test_AWSEC2AssociateIpamResourceDiscoveryResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateIpamResourceDiscoveryResult class]];
}

- (void) test_AWSEC2AssociateNatGatewayAddressRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateNatGatewayAddressRequest class]];
}

- (void) test_AWSEC2AssociateNatGatewayAddressResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateNatGatewayAddressResult class]];
}

- (void) test_AWSEC2AssociateRouteTableRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateRouteTableRequest class]];
}

- (void) test_AWSEC2AssociateRouteTableResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateRouteTableResult class]];
}

- (void) test_AWSEC2AssociateSubnetCidrBlockRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateSubnetCidrBlockRequest class]];
}

- (void) test_AWSEC2AssociateSubnetCidrBlockResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateSubnetCidrBlockResult class]];
}

- (void) test_AWSEC2AssociateTransitGatewayMulticastDomainRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateTransitGatewayMulticastDomainRequest class]];
}

- (void) test_AWSEC2AssociateTransitGatewayMulticastDomainResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateTransitGatewayMulticastDomainResult class]];
}

- (void) test_AWSEC2AssociateTransitGatewayPolicyTableRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateTransitGatewayPolicyTableRequest class]];
}

- (void) test_AWSEC2AssociateTransitGatewayPolicyTableResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateTransitGatewayPolicyTableResult class]];
}

- (void) test_AWSEC2AssociateTransitGatewayRouteTableRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateTransitGatewayRouteTableRequest class]];
}

- (void) test_AWSEC2AssociateTransitGatewayRouteTableResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateTransitGatewayRouteTableResult class]];
}

- (void) test_AWSEC2AssociateTrunkInterfaceRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateTrunkInterfaceRequest class]];
}

- (void) test_AWSEC2AssociateTrunkInterfaceResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateTrunkInterfaceResult class]];
}

- (void) test_AWSEC2AssociateVpcCidrBlockRequest {
    [self validateSecureCodingForClass:[AWSEC2AssociateVpcCidrBlockRequest class]];
}

- (void) test_AWSEC2AssociateVpcCidrBlockResult {
    [self validateSecureCodingForClass:[AWSEC2AssociateVpcCidrBlockResult class]];
}

- (void) test_AWSEC2AssociatedRole {
    [self validateSecureCodingForClass:[AWSEC2AssociatedRole class]];
}

- (void) test_AWSEC2AssociatedTargetNetwork {
    [self validateSecureCodingForClass:[AWSEC2AssociatedTargetNetwork class]];
}

- (void) test_AWSEC2AssociationStatus {
    [self validateSecureCodingForClass:[AWSEC2AssociationStatus class]];
}

- (void) test_AWSEC2AthenaIntegration {
    [self validateSecureCodingForClass:[AWSEC2AthenaIntegration class]];
}

- (void) test_AWSEC2AttachClassicLinkVpcRequest {
    [self validateSecureCodingForClass:[AWSEC2AttachClassicLinkVpcRequest class]];
}

- (void) test_AWSEC2AttachClassicLinkVpcResult {
    [self validateSecureCodingForClass:[AWSEC2AttachClassicLinkVpcResult class]];
}

- (void) test_AWSEC2AttachInternetGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2AttachInternetGatewayRequest class]];
}

- (void) test_AWSEC2AttachNetworkInterfaceRequest {
    [self validateSecureCodingForClass:[AWSEC2AttachNetworkInterfaceRequest class]];
}

- (void) test_AWSEC2AttachNetworkInterfaceResult {
    [self validateSecureCodingForClass:[AWSEC2AttachNetworkInterfaceResult class]];
}

- (void) test_AWSEC2AttachVerifiedAccessTrustProviderRequest {
    [self validateSecureCodingForClass:[AWSEC2AttachVerifiedAccessTrustProviderRequest class]];
}

- (void) test_AWSEC2AttachVerifiedAccessTrustProviderResult {
    [self validateSecureCodingForClass:[AWSEC2AttachVerifiedAccessTrustProviderResult class]];
}

- (void) test_AWSEC2AttachVolumeRequest {
    [self validateSecureCodingForClass:[AWSEC2AttachVolumeRequest class]];
}

- (void) test_AWSEC2AttachVpnGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2AttachVpnGatewayRequest class]];
}

- (void) test_AWSEC2AttachVpnGatewayResult {
    [self validateSecureCodingForClass:[AWSEC2AttachVpnGatewayResult class]];
}

- (void) test_AWSEC2AttachmentEnaSrdSpecification {
    [self validateSecureCodingForClass:[AWSEC2AttachmentEnaSrdSpecification class]];
}

- (void) test_AWSEC2AttachmentEnaSrdUdpSpecification {
    [self validateSecureCodingForClass:[AWSEC2AttachmentEnaSrdUdpSpecification class]];
}

- (void) test_AWSEC2AttributeBooleanValue {
    [self validateSecureCodingForClass:[AWSEC2AttributeBooleanValue class]];
}

- (void) test_AWSEC2AttributeValue {
    [self validateSecureCodingForClass:[AWSEC2AttributeValue class]];
}

- (void) test_AWSEC2AuthorizationRule {
    [self validateSecureCodingForClass:[AWSEC2AuthorizationRule class]];
}

- (void) test_AWSEC2AuthorizeClientVpnIngressRequest {
    [self validateSecureCodingForClass:[AWSEC2AuthorizeClientVpnIngressRequest class]];
}

- (void) test_AWSEC2AuthorizeClientVpnIngressResult {
    [self validateSecureCodingForClass:[AWSEC2AuthorizeClientVpnIngressResult class]];
}

- (void) test_AWSEC2AuthorizeSecurityGroupEgressRequest {
    [self validateSecureCodingForClass:[AWSEC2AuthorizeSecurityGroupEgressRequest class]];
}

- (void) test_AWSEC2AuthorizeSecurityGroupEgressResult {
    [self validateSecureCodingForClass:[AWSEC2AuthorizeSecurityGroupEgressResult class]];
}

- (void) test_AWSEC2AuthorizeSecurityGroupIngressRequest {
    [self validateSecureCodingForClass:[AWSEC2AuthorizeSecurityGroupIngressRequest class]];
}

- (void) test_AWSEC2AuthorizeSecurityGroupIngressResult {
    [self validateSecureCodingForClass:[AWSEC2AuthorizeSecurityGroupIngressResult class]];
}

- (void) test_AWSEC2AvailabilityZone {
    [self validateSecureCodingForClass:[AWSEC2AvailabilityZone class]];
}

- (void) test_AWSEC2AvailabilityZoneMessage {
    [self validateSecureCodingForClass:[AWSEC2AvailabilityZoneMessage class]];
}

- (void) test_AWSEC2AvailableCapacity {
    [self validateSecureCodingForClass:[AWSEC2AvailableCapacity class]];
}

- (void) test_AWSEC2BaselineEbsBandwidthMbps {
    [self validateSecureCodingForClass:[AWSEC2BaselineEbsBandwidthMbps class]];
}

- (void) test_AWSEC2BaselineEbsBandwidthMbpsRequest {
    [self validateSecureCodingForClass:[AWSEC2BaselineEbsBandwidthMbpsRequest class]];
}

- (void) test_AWSEC2BlobAttributeValue {
    [self validateSecureCodingForClass:[AWSEC2BlobAttributeValue class]];
}

- (void) test_AWSEC2BlockDeviceMapping {
    [self validateSecureCodingForClass:[AWSEC2BlockDeviceMapping class]];
}

- (void) test_AWSEC2BundleInstanceRequest {
    [self validateSecureCodingForClass:[AWSEC2BundleInstanceRequest class]];
}

- (void) test_AWSEC2BundleInstanceResult {
    [self validateSecureCodingForClass:[AWSEC2BundleInstanceResult class]];
}

- (void) test_AWSEC2BundleTask {
    [self validateSecureCodingForClass:[AWSEC2BundleTask class]];
}

- (void) test_AWSEC2BundleTaskError {
    [self validateSecureCodingForClass:[AWSEC2BundleTaskError class]];
}

- (void) test_AWSEC2ByoipCidr {
    [self validateSecureCodingForClass:[AWSEC2ByoipCidr class]];
}

- (void) test_AWSEC2CancelBundleTaskRequest {
    [self validateSecureCodingForClass:[AWSEC2CancelBundleTaskRequest class]];
}

- (void) test_AWSEC2CancelBundleTaskResult {
    [self validateSecureCodingForClass:[AWSEC2CancelBundleTaskResult class]];
}

- (void) test_AWSEC2CancelCapacityReservationFleetError {
    [self validateSecureCodingForClass:[AWSEC2CancelCapacityReservationFleetError class]];
}

- (void) test_AWSEC2CancelCapacityReservationFleetsRequest {
    [self validateSecureCodingForClass:[AWSEC2CancelCapacityReservationFleetsRequest class]];
}

- (void) test_AWSEC2CancelCapacityReservationFleetsResult {
    [self validateSecureCodingForClass:[AWSEC2CancelCapacityReservationFleetsResult class]];
}

- (void) test_AWSEC2CancelCapacityReservationRequest {
    [self validateSecureCodingForClass:[AWSEC2CancelCapacityReservationRequest class]];
}

- (void) test_AWSEC2CancelCapacityReservationResult {
    [self validateSecureCodingForClass:[AWSEC2CancelCapacityReservationResult class]];
}

- (void) test_AWSEC2CancelConversionRequest {
    [self validateSecureCodingForClass:[AWSEC2CancelConversionRequest class]];
}

- (void) test_AWSEC2CancelExportTaskRequest {
    [self validateSecureCodingForClass:[AWSEC2CancelExportTaskRequest class]];
}

- (void) test_AWSEC2CancelImageLaunchPermissionRequest {
    [self validateSecureCodingForClass:[AWSEC2CancelImageLaunchPermissionRequest class]];
}

- (void) test_AWSEC2CancelImageLaunchPermissionResult {
    [self validateSecureCodingForClass:[AWSEC2CancelImageLaunchPermissionResult class]];
}

- (void) test_AWSEC2CancelImportTaskRequest {
    [self validateSecureCodingForClass:[AWSEC2CancelImportTaskRequest class]];
}

- (void) test_AWSEC2CancelImportTaskResult {
    [self validateSecureCodingForClass:[AWSEC2CancelImportTaskResult class]];
}

- (void) test_AWSEC2CancelReservedInstancesListingRequest {
    [self validateSecureCodingForClass:[AWSEC2CancelReservedInstancesListingRequest class]];
}

- (void) test_AWSEC2CancelReservedInstancesListingResult {
    [self validateSecureCodingForClass:[AWSEC2CancelReservedInstancesListingResult class]];
}

- (void) test_AWSEC2CancelSpotFleetRequestsError {
    [self validateSecureCodingForClass:[AWSEC2CancelSpotFleetRequestsError class]];
}

- (void) test_AWSEC2CancelSpotFleetRequestsErrorItem {
    [self validateSecureCodingForClass:[AWSEC2CancelSpotFleetRequestsErrorItem class]];
}

- (void) test_AWSEC2CancelSpotFleetRequestsRequest {
    [self validateSecureCodingForClass:[AWSEC2CancelSpotFleetRequestsRequest class]];
}

- (void) test_AWSEC2CancelSpotFleetRequestsResponse {
    [self validateSecureCodingForClass:[AWSEC2CancelSpotFleetRequestsResponse class]];
}

- (void) test_AWSEC2CancelSpotFleetRequestsSuccessItem {
    [self validateSecureCodingForClass:[AWSEC2CancelSpotFleetRequestsSuccessItem class]];
}

- (void) test_AWSEC2CancelSpotInstanceRequestsRequest {
    [self validateSecureCodingForClass:[AWSEC2CancelSpotInstanceRequestsRequest class]];
}

- (void) test_AWSEC2CancelSpotInstanceRequestsResult {
    [self validateSecureCodingForClass:[AWSEC2CancelSpotInstanceRequestsResult class]];
}

- (void) test_AWSEC2CancelledSpotInstanceRequest {
    [self validateSecureCodingForClass:[AWSEC2CancelledSpotInstanceRequest class]];
}

- (void) test_AWSEC2CapacityAllocation {
    [self validateSecureCodingForClass:[AWSEC2CapacityAllocation class]];
}

- (void) test_AWSEC2CapacityReservation {
    [self validateSecureCodingForClass:[AWSEC2CapacityReservation class]];
}

- (void) test_AWSEC2CapacityReservationFleet {
    [self validateSecureCodingForClass:[AWSEC2CapacityReservationFleet class]];
}

- (void) test_AWSEC2CapacityReservationFleetCancellationState {
    [self validateSecureCodingForClass:[AWSEC2CapacityReservationFleetCancellationState class]];
}

- (void) test_AWSEC2CapacityReservationGroup {
    [self validateSecureCodingForClass:[AWSEC2CapacityReservationGroup class]];
}

- (void) test_AWSEC2CapacityReservationOptions {
    [self validateSecureCodingForClass:[AWSEC2CapacityReservationOptions class]];
}

- (void) test_AWSEC2CapacityReservationOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2CapacityReservationOptionsRequest class]];
}

- (void) test_AWSEC2CapacityReservationSpecification {
    [self validateSecureCodingForClass:[AWSEC2CapacityReservationSpecification class]];
}

- (void) test_AWSEC2CapacityReservationSpecificationResponse {
    [self validateSecureCodingForClass:[AWSEC2CapacityReservationSpecificationResponse class]];
}

- (void) test_AWSEC2CapacityReservationTarget {
    [self validateSecureCodingForClass:[AWSEC2CapacityReservationTarget class]];
}

- (void) test_AWSEC2CapacityReservationTargetResponse {
    [self validateSecureCodingForClass:[AWSEC2CapacityReservationTargetResponse class]];
}

- (void) test_AWSEC2CarrierGateway {
    [self validateSecureCodingForClass:[AWSEC2CarrierGateway class]];
}

- (void) test_AWSEC2CertificateAuthentication {
    [self validateSecureCodingForClass:[AWSEC2CertificateAuthentication class]];
}

- (void) test_AWSEC2CertificateAuthenticationRequest {
    [self validateSecureCodingForClass:[AWSEC2CertificateAuthenticationRequest class]];
}

- (void) test_AWSEC2CidrAuthorizationContext {
    [self validateSecureCodingForClass:[AWSEC2CidrAuthorizationContext class]];
}

- (void) test_AWSEC2CidrBlock {
    [self validateSecureCodingForClass:[AWSEC2CidrBlock class]];
}

- (void) test_AWSEC2ClassicLinkDnsSupport {
    [self validateSecureCodingForClass:[AWSEC2ClassicLinkDnsSupport class]];
}

- (void) test_AWSEC2ClassicLinkInstance {
    [self validateSecureCodingForClass:[AWSEC2ClassicLinkInstance class]];
}

- (void) test_AWSEC2ClassicLoadBalancer {
    [self validateSecureCodingForClass:[AWSEC2ClassicLoadBalancer class]];
}

- (void) test_AWSEC2ClassicLoadBalancersConfig {
    [self validateSecureCodingForClass:[AWSEC2ClassicLoadBalancersConfig class]];
}

- (void) test_AWSEC2ClientCertificateRevocationListStatus {
    [self validateSecureCodingForClass:[AWSEC2ClientCertificateRevocationListStatus class]];
}

- (void) test_AWSEC2ClientConnectOptions {
    [self validateSecureCodingForClass:[AWSEC2ClientConnectOptions class]];
}

- (void) test_AWSEC2ClientConnectResponseOptions {
    [self validateSecureCodingForClass:[AWSEC2ClientConnectResponseOptions class]];
}

- (void) test_AWSEC2ClientData {
    [self validateSecureCodingForClass:[AWSEC2ClientData class]];
}

- (void) test_AWSEC2ClientLoginBannerOptions {
    [self validateSecureCodingForClass:[AWSEC2ClientLoginBannerOptions class]];
}

- (void) test_AWSEC2ClientLoginBannerResponseOptions {
    [self validateSecureCodingForClass:[AWSEC2ClientLoginBannerResponseOptions class]];
}

- (void) test_AWSEC2ClientVpnAuthentication {
    [self validateSecureCodingForClass:[AWSEC2ClientVpnAuthentication class]];
}

- (void) test_AWSEC2ClientVpnAuthenticationRequest {
    [self validateSecureCodingForClass:[AWSEC2ClientVpnAuthenticationRequest class]];
}

- (void) test_AWSEC2ClientVpnAuthorizationRuleStatus {
    [self validateSecureCodingForClass:[AWSEC2ClientVpnAuthorizationRuleStatus class]];
}

- (void) test_AWSEC2ClientVpnConnection {
    [self validateSecureCodingForClass:[AWSEC2ClientVpnConnection class]];
}

- (void) test_AWSEC2ClientVpnConnectionStatus {
    [self validateSecureCodingForClass:[AWSEC2ClientVpnConnectionStatus class]];
}

- (void) test_AWSEC2ClientVpnEndpoint {
    [self validateSecureCodingForClass:[AWSEC2ClientVpnEndpoint class]];
}

- (void) test_AWSEC2ClientVpnEndpointAttributeStatus {
    [self validateSecureCodingForClass:[AWSEC2ClientVpnEndpointAttributeStatus class]];
}

- (void) test_AWSEC2ClientVpnEndpointStatus {
    [self validateSecureCodingForClass:[AWSEC2ClientVpnEndpointStatus class]];
}

- (void) test_AWSEC2ClientVpnRoute {
    [self validateSecureCodingForClass:[AWSEC2ClientVpnRoute class]];
}

- (void) test_AWSEC2ClientVpnRouteStatus {
    [self validateSecureCodingForClass:[AWSEC2ClientVpnRouteStatus class]];
}

- (void) test_AWSEC2CloudWatchLogOptions {
    [self validateSecureCodingForClass:[AWSEC2CloudWatchLogOptions class]];
}

- (void) test_AWSEC2CloudWatchLogOptionsSpecification {
    [self validateSecureCodingForClass:[AWSEC2CloudWatchLogOptionsSpecification class]];
}

- (void) test_AWSEC2CoipAddressUsage {
    [self validateSecureCodingForClass:[AWSEC2CoipAddressUsage class]];
}

- (void) test_AWSEC2CoipCidr {
    [self validateSecureCodingForClass:[AWSEC2CoipCidr class]];
}

- (void) test_AWSEC2CoipPool {
    [self validateSecureCodingForClass:[AWSEC2CoipPool class]];
}

- (void) test_AWSEC2ConfirmProductInstanceRequest {
    [self validateSecureCodingForClass:[AWSEC2ConfirmProductInstanceRequest class]];
}

- (void) test_AWSEC2ConfirmProductInstanceResult {
    [self validateSecureCodingForClass:[AWSEC2ConfirmProductInstanceResult class]];
}

- (void) test_AWSEC2ConnectionLogOptions {
    [self validateSecureCodingForClass:[AWSEC2ConnectionLogOptions class]];
}

- (void) test_AWSEC2ConnectionLogResponseOptions {
    [self validateSecureCodingForClass:[AWSEC2ConnectionLogResponseOptions class]];
}

- (void) test_AWSEC2ConnectionNotification {
    [self validateSecureCodingForClass:[AWSEC2ConnectionNotification class]];
}

- (void) test_AWSEC2ConversionTask {
    [self validateSecureCodingForClass:[AWSEC2ConversionTask class]];
}

- (void) test_AWSEC2ReplicateFpgaImageRequest {
    [self validateSecureCodingForClass:[AWSEC2ReplicateFpgaImageRequest class]];
}

- (void) test_AWSEC2ReplicateFpgaImageResult {
    [self validateSecureCodingForClass:[AWSEC2ReplicateFpgaImageResult class]];
}

- (void) test_AWSEC2ReplicateImageRequest {
    [self validateSecureCodingForClass:[AWSEC2ReplicateImageRequest class]];
}

- (void) test_AWSEC2ReplicateImageResult {
    [self validateSecureCodingForClass:[AWSEC2ReplicateImageResult class]];
}

- (void) test_AWSEC2ReplicateSnapshotRequest {
    [self validateSecureCodingForClass:[AWSEC2ReplicateSnapshotRequest class]];
}

- (void) test_AWSEC2ReplicateSnapshotResult {
    [self validateSecureCodingForClass:[AWSEC2ReplicateSnapshotResult class]];
}

- (void) test_AWSEC2CpuOptions {
    [self validateSecureCodingForClass:[AWSEC2CpuOptions class]];
}

- (void) test_AWSEC2CpuOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2CpuOptionsRequest class]];
}

- (void) test_AWSEC2CreateCapacityReservationFleetRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateCapacityReservationFleetRequest class]];
}

- (void) test_AWSEC2CreateCapacityReservationFleetResult {
    [self validateSecureCodingForClass:[AWSEC2CreateCapacityReservationFleetResult class]];
}

- (void) test_AWSEC2CreateCapacityReservationRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateCapacityReservationRequest class]];
}

- (void) test_AWSEC2CreateCapacityReservationResult {
    [self validateSecureCodingForClass:[AWSEC2CreateCapacityReservationResult class]];
}

- (void) test_AWSEC2CreateCarrierGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateCarrierGatewayRequest class]];
}

- (void) test_AWSEC2CreateCarrierGatewayResult {
    [self validateSecureCodingForClass:[AWSEC2CreateCarrierGatewayResult class]];
}

- (void) test_AWSEC2CreateClientVpnEndpointRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateClientVpnEndpointRequest class]];
}

- (void) test_AWSEC2CreateClientVpnEndpointResult {
    [self validateSecureCodingForClass:[AWSEC2CreateClientVpnEndpointResult class]];
}

- (void) test_AWSEC2CreateClientVpnRouteRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateClientVpnRouteRequest class]];
}

- (void) test_AWSEC2CreateClientVpnRouteResult {
    [self validateSecureCodingForClass:[AWSEC2CreateClientVpnRouteResult class]];
}

- (void) test_AWSEC2CreateCoipCidrRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateCoipCidrRequest class]];
}

- (void) test_AWSEC2CreateCoipCidrResult {
    [self validateSecureCodingForClass:[AWSEC2CreateCoipCidrResult class]];
}

- (void) test_AWSEC2CreateCoipPoolRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateCoipPoolRequest class]];
}

- (void) test_AWSEC2CreateCoipPoolResult {
    [self validateSecureCodingForClass:[AWSEC2CreateCoipPoolResult class]];
}

- (void) test_AWSEC2CreateCustomerGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateCustomerGatewayRequest class]];
}

- (void) test_AWSEC2CreateCustomerGatewayResult {
    [self validateSecureCodingForClass:[AWSEC2CreateCustomerGatewayResult class]];
}

- (void) test_AWSEC2CreateDefaultSubnetRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateDefaultSubnetRequest class]];
}

- (void) test_AWSEC2CreateDefaultSubnetResult {
    [self validateSecureCodingForClass:[AWSEC2CreateDefaultSubnetResult class]];
}

- (void) test_AWSEC2CreateDefaultVpcRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateDefaultVpcRequest class]];
}

- (void) test_AWSEC2CreateDefaultVpcResult {
    [self validateSecureCodingForClass:[AWSEC2CreateDefaultVpcResult class]];
}

- (void) test_AWSEC2CreateDhcpOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateDhcpOptionsRequest class]];
}

- (void) test_AWSEC2CreateDhcpOptionsResult {
    [self validateSecureCodingForClass:[AWSEC2CreateDhcpOptionsResult class]];
}

- (void) test_AWSEC2CreateEgressOnlyInternetGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateEgressOnlyInternetGatewayRequest class]];
}

- (void) test_AWSEC2CreateEgressOnlyInternetGatewayResult {
    [self validateSecureCodingForClass:[AWSEC2CreateEgressOnlyInternetGatewayResult class]];
}

- (void) test_AWSEC2CreateFleetError {
    [self validateSecureCodingForClass:[AWSEC2CreateFleetError class]];
}

- (void) test_AWSEC2CreateFleetInstance {
    [self validateSecureCodingForClass:[AWSEC2CreateFleetInstance class]];
}

- (void) test_AWSEC2CreateFleetRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateFleetRequest class]];
}

- (void) test_AWSEC2CreateFleetResult {
    [self validateSecureCodingForClass:[AWSEC2CreateFleetResult class]];
}

- (void) test_AWSEC2CreateFlowLogsRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateFlowLogsRequest class]];
}

- (void) test_AWSEC2CreateFlowLogsResult {
    [self validateSecureCodingForClass:[AWSEC2CreateFlowLogsResult class]];
}

- (void) test_AWSEC2CreateFpgaImageRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateFpgaImageRequest class]];
}

- (void) test_AWSEC2CreateFpgaImageResult {
    [self validateSecureCodingForClass:[AWSEC2CreateFpgaImageResult class]];
}

- (void) test_AWSEC2CreateImageRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateImageRequest class]];
}

- (void) test_AWSEC2CreateImageResult {
    [self validateSecureCodingForClass:[AWSEC2CreateImageResult class]];
}

- (void) test_AWSEC2CreateInstanceEventWindowRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateInstanceEventWindowRequest class]];
}

- (void) test_AWSEC2CreateInstanceEventWindowResult {
    [self validateSecureCodingForClass:[AWSEC2CreateInstanceEventWindowResult class]];
}

- (void) test_AWSEC2CreateInstanceExportTaskRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateInstanceExportTaskRequest class]];
}

- (void) test_AWSEC2CreateInstanceExportTaskResult {
    [self validateSecureCodingForClass:[AWSEC2CreateInstanceExportTaskResult class]];
}

- (void) test_AWSEC2CreateInternetGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateInternetGatewayRequest class]];
}

- (void) test_AWSEC2CreateInternetGatewayResult {
    [self validateSecureCodingForClass:[AWSEC2CreateInternetGatewayResult class]];
}

- (void) test_AWSEC2CreateIpamPoolRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateIpamPoolRequest class]];
}

- (void) test_AWSEC2CreateIpamPoolResult {
    [self validateSecureCodingForClass:[AWSEC2CreateIpamPoolResult class]];
}

- (void) test_AWSEC2CreateIpamRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateIpamRequest class]];
}

- (void) test_AWSEC2CreateIpamResourceDiscoveryRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateIpamResourceDiscoveryRequest class]];
}

- (void) test_AWSEC2CreateIpamResourceDiscoveryResult {
    [self validateSecureCodingForClass:[AWSEC2CreateIpamResourceDiscoveryResult class]];
}

- (void) test_AWSEC2CreateIpamResult {
    [self validateSecureCodingForClass:[AWSEC2CreateIpamResult class]];
}

- (void) test_AWSEC2CreateIpamScopeRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateIpamScopeRequest class]];
}

- (void) test_AWSEC2CreateIpamScopeResult {
    [self validateSecureCodingForClass:[AWSEC2CreateIpamScopeResult class]];
}

- (void) test_AWSEC2CreateKeyPairRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateKeyPairRequest class]];
}

- (void) test_AWSEC2CreateLaunchTemplateRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateLaunchTemplateRequest class]];
}

- (void) test_AWSEC2CreateLaunchTemplateResult {
    [self validateSecureCodingForClass:[AWSEC2CreateLaunchTemplateResult class]];
}

- (void) test_AWSEC2CreateLaunchTemplateVersionRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateLaunchTemplateVersionRequest class]];
}

- (void) test_AWSEC2CreateLaunchTemplateVersionResult {
    [self validateSecureCodingForClass:[AWSEC2CreateLaunchTemplateVersionResult class]];
}

- (void) test_AWSEC2CreateLocalGatewayRouteRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateLocalGatewayRouteRequest class]];
}

- (void) test_AWSEC2CreateLocalGatewayRouteResult {
    [self validateSecureCodingForClass:[AWSEC2CreateLocalGatewayRouteResult class]];
}

- (void) test_AWSEC2CreateLocalGatewayRouteTableRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateLocalGatewayRouteTableRequest class]];
}

- (void) test_AWSEC2CreateLocalGatewayRouteTableResult {
    [self validateSecureCodingForClass:[AWSEC2CreateLocalGatewayRouteTableResult class]];
}

- (void) test_AWSEC2CreateLocalGatewayRouteTableVirtualInterfaceGroupAssociationRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateLocalGatewayRouteTableVirtualInterfaceGroupAssociationRequest class]];
}

- (void) test_AWSEC2CreateLocalGatewayRouteTableVirtualInterfaceGroupAssociationResult {
    [self validateSecureCodingForClass:[AWSEC2CreateLocalGatewayRouteTableVirtualInterfaceGroupAssociationResult class]];
}

- (void) test_AWSEC2CreateLocalGatewayRouteTableVpcAssociationRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateLocalGatewayRouteTableVpcAssociationRequest class]];
}

- (void) test_AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult {
    [self validateSecureCodingForClass:[AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult class]];
}

- (void) test_AWSEC2CreateManagedPrefixListRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateManagedPrefixListRequest class]];
}

- (void) test_AWSEC2CreateManagedPrefixListResult {
    [self validateSecureCodingForClass:[AWSEC2CreateManagedPrefixListResult class]];
}

- (void) test_AWSEC2CreateNatGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateNatGatewayRequest class]];
}

- (void) test_AWSEC2CreateNatGatewayResult {
    [self validateSecureCodingForClass:[AWSEC2CreateNatGatewayResult class]];
}

- (void) test_AWSEC2CreateNetworkAclEntryRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateNetworkAclEntryRequest class]];
}

- (void) test_AWSEC2CreateNetworkAclRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateNetworkAclRequest class]];
}

- (void) test_AWSEC2CreateNetworkAclResult {
    [self validateSecureCodingForClass:[AWSEC2CreateNetworkAclResult class]];
}

- (void) test_AWSEC2CreateNetworkInsightsAccessScopeRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateNetworkInsightsAccessScopeRequest class]];
}

- (void) test_AWSEC2CreateNetworkInsightsAccessScopeResult {
    [self validateSecureCodingForClass:[AWSEC2CreateNetworkInsightsAccessScopeResult class]];
}

- (void) test_AWSEC2CreateNetworkInsightsPathRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateNetworkInsightsPathRequest class]];
}

- (void) test_AWSEC2CreateNetworkInsightsPathResult {
    [self validateSecureCodingForClass:[AWSEC2CreateNetworkInsightsPathResult class]];
}

- (void) test_AWSEC2CreateNetworkInterfacePermissionRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateNetworkInterfacePermissionRequest class]];
}

- (void) test_AWSEC2CreateNetworkInterfacePermissionResult {
    [self validateSecureCodingForClass:[AWSEC2CreateNetworkInterfacePermissionResult class]];
}

- (void) test_AWSEC2CreateNetworkInterfaceRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateNetworkInterfaceRequest class]];
}

- (void) test_AWSEC2CreateNetworkInterfaceResult {
    [self validateSecureCodingForClass:[AWSEC2CreateNetworkInterfaceResult class]];
}

- (void) test_AWSEC2CreatePlacementGroupRequest {
    [self validateSecureCodingForClass:[AWSEC2CreatePlacementGroupRequest class]];
}

- (void) test_AWSEC2CreatePlacementGroupResult {
    [self validateSecureCodingForClass:[AWSEC2CreatePlacementGroupResult class]];
}

- (void) test_AWSEC2CreatePublicIpv4PoolRequest {
    [self validateSecureCodingForClass:[AWSEC2CreatePublicIpv4PoolRequest class]];
}

- (void) test_AWSEC2CreatePublicIpv4PoolResult {
    [self validateSecureCodingForClass:[AWSEC2CreatePublicIpv4PoolResult class]];
}

- (void) test_AWSEC2CreateReplaceRootVolumeTaskRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateReplaceRootVolumeTaskRequest class]];
}

- (void) test_AWSEC2CreateReplaceRootVolumeTaskResult {
    [self validateSecureCodingForClass:[AWSEC2CreateReplaceRootVolumeTaskResult class]];
}

- (void) test_AWSEC2CreateReservedInstancesListingRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateReservedInstancesListingRequest class]];
}

- (void) test_AWSEC2CreateReservedInstancesListingResult {
    [self validateSecureCodingForClass:[AWSEC2CreateReservedInstancesListingResult class]];
}

- (void) test_AWSEC2CreateRestoreImageTaskRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateRestoreImageTaskRequest class]];
}

- (void) test_AWSEC2CreateRestoreImageTaskResult {
    [self validateSecureCodingForClass:[AWSEC2CreateRestoreImageTaskResult class]];
}

- (void) test_AWSEC2CreateRouteRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateRouteRequest class]];
}

- (void) test_AWSEC2CreateRouteResult {
    [self validateSecureCodingForClass:[AWSEC2CreateRouteResult class]];
}

- (void) test_AWSEC2CreateRouteTableRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateRouteTableRequest class]];
}

- (void) test_AWSEC2CreateRouteTableResult {
    [self validateSecureCodingForClass:[AWSEC2CreateRouteTableResult class]];
}

- (void) test_AWSEC2CreateSecurityGroupRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateSecurityGroupRequest class]];
}

- (void) test_AWSEC2CreateSecurityGroupResult {
    [self validateSecureCodingForClass:[AWSEC2CreateSecurityGroupResult class]];
}

- (void) test_AWSEC2CreateSnapshotRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateSnapshotRequest class]];
}

- (void) test_AWSEC2CreateSnapshotsRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateSnapshotsRequest class]];
}

- (void) test_AWSEC2CreateSnapshotsResult {
    [self validateSecureCodingForClass:[AWSEC2CreateSnapshotsResult class]];
}

- (void) test_AWSEC2CreateSpotDatafeedSubscriptionRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateSpotDatafeedSubscriptionRequest class]];
}

- (void) test_AWSEC2CreateSpotDatafeedSubscriptionResult {
    [self validateSecureCodingForClass:[AWSEC2CreateSpotDatafeedSubscriptionResult class]];
}

- (void) test_AWSEC2CreateStoreImageTaskRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateStoreImageTaskRequest class]];
}

- (void) test_AWSEC2CreateStoreImageTaskResult {
    [self validateSecureCodingForClass:[AWSEC2CreateStoreImageTaskResult class]];
}

- (void) test_AWSEC2CreateSubnetCidrReservationRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateSubnetCidrReservationRequest class]];
}

- (void) test_AWSEC2CreateSubnetCidrReservationResult {
    [self validateSecureCodingForClass:[AWSEC2CreateSubnetCidrReservationResult class]];
}

- (void) test_AWSEC2CreateSubnetRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateSubnetRequest class]];
}

- (void) test_AWSEC2CreateSubnetResult {
    [self validateSecureCodingForClass:[AWSEC2CreateSubnetResult class]];
}

- (void) test_AWSEC2CreateTagsRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTagsRequest class]];
}

- (void) test_AWSEC2CreateTrafficMirrorFilterRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTrafficMirrorFilterRequest class]];
}

- (void) test_AWSEC2CreateTrafficMirrorFilterResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTrafficMirrorFilterResult class]];
}

- (void) test_AWSEC2CreateTrafficMirrorFilterRuleRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTrafficMirrorFilterRuleRequest class]];
}

- (void) test_AWSEC2CreateTrafficMirrorFilterRuleResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTrafficMirrorFilterRuleResult class]];
}

- (void) test_AWSEC2CreateTrafficMirrorSessionRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTrafficMirrorSessionRequest class]];
}

- (void) test_AWSEC2CreateTrafficMirrorSessionResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTrafficMirrorSessionResult class]];
}

- (void) test_AWSEC2CreateTrafficMirrorTargetRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTrafficMirrorTargetRequest class]];
}

- (void) test_AWSEC2CreateTrafficMirrorTargetResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTrafficMirrorTargetResult class]];
}

- (void) test_AWSEC2CreateTransitGatewayConnectPeerRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayConnectPeerRequest class]];
}

- (void) test_AWSEC2CreateTransitGatewayConnectPeerResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayConnectPeerResult class]];
}

- (void) test_AWSEC2CreateTransitGatewayConnectRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayConnectRequest class]];
}

- (void) test_AWSEC2CreateTransitGatewayConnectRequestOptions {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayConnectRequestOptions class]];
}

- (void) test_AWSEC2CreateTransitGatewayConnectResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayConnectResult class]];
}

- (void) test_AWSEC2CreateTransitGatewayMulticastDomainRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayMulticastDomainRequest class]];
}

- (void) test_AWSEC2CreateTransitGatewayMulticastDomainRequestOptions {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayMulticastDomainRequestOptions class]];
}

- (void) test_AWSEC2CreateTransitGatewayMulticastDomainResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayMulticastDomainResult class]];
}

- (void) test_AWSEC2CreateTransitGatewayPeeringAttachmentRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayPeeringAttachmentRequest class]];
}

- (void) test_AWSEC2CreateTransitGatewayPeeringAttachmentRequestOptions {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayPeeringAttachmentRequestOptions class]];
}

- (void) test_AWSEC2CreateTransitGatewayPeeringAttachmentResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayPeeringAttachmentResult class]];
}

- (void) test_AWSEC2CreateTransitGatewayPolicyTableRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayPolicyTableRequest class]];
}

- (void) test_AWSEC2CreateTransitGatewayPolicyTableResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayPolicyTableResult class]];
}

- (void) test_AWSEC2CreateTransitGatewayPrefixListReferenceRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayPrefixListReferenceRequest class]];
}

- (void) test_AWSEC2CreateTransitGatewayPrefixListReferenceResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayPrefixListReferenceResult class]];
}

- (void) test_AWSEC2CreateTransitGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayRequest class]];
}

- (void) test_AWSEC2CreateTransitGatewayResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayResult class]];
}

- (void) test_AWSEC2CreateTransitGatewayRouteRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayRouteRequest class]];
}

- (void) test_AWSEC2CreateTransitGatewayRouteResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayRouteResult class]];
}

- (void) test_AWSEC2CreateTransitGatewayRouteTableAnnouncementRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayRouteTableAnnouncementRequest class]];
}

- (void) test_AWSEC2CreateTransitGatewayRouteTableAnnouncementResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayRouteTableAnnouncementResult class]];
}

- (void) test_AWSEC2CreateTransitGatewayRouteTableRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayRouteTableRequest class]];
}

- (void) test_AWSEC2CreateTransitGatewayRouteTableResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayRouteTableResult class]];
}

- (void) test_AWSEC2CreateTransitGatewayVpcAttachmentRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayVpcAttachmentRequest class]];
}

- (void) test_AWSEC2CreateTransitGatewayVpcAttachmentRequestOptions {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayVpcAttachmentRequestOptions class]];
}

- (void) test_AWSEC2CreateTransitGatewayVpcAttachmentResult {
    [self validateSecureCodingForClass:[AWSEC2CreateTransitGatewayVpcAttachmentResult class]];
}

- (void) test_AWSEC2CreateVerifiedAccessEndpointEniOptions {
    [self validateSecureCodingForClass:[AWSEC2CreateVerifiedAccessEndpointEniOptions class]];
}

- (void) test_AWSEC2CreateVerifiedAccessEndpointLoadBalancerOptions {
    [self validateSecureCodingForClass:[AWSEC2CreateVerifiedAccessEndpointLoadBalancerOptions class]];
}

- (void) test_AWSEC2CreateVerifiedAccessEndpointRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateVerifiedAccessEndpointRequest class]];
}

- (void) test_AWSEC2CreateVerifiedAccessEndpointResult {
    [self validateSecureCodingForClass:[AWSEC2CreateVerifiedAccessEndpointResult class]];
}

- (void) test_AWSEC2CreateVerifiedAccessGroupRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateVerifiedAccessGroupRequest class]];
}

- (void) test_AWSEC2CreateVerifiedAccessGroupResult {
    [self validateSecureCodingForClass:[AWSEC2CreateVerifiedAccessGroupResult class]];
}

- (void) test_AWSEC2CreateVerifiedAccessInstanceRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateVerifiedAccessInstanceRequest class]];
}

- (void) test_AWSEC2CreateVerifiedAccessInstanceResult {
    [self validateSecureCodingForClass:[AWSEC2CreateVerifiedAccessInstanceResult class]];
}

- (void) test_AWSEC2CreateVerifiedAccessTrustProviderDeviceOptions {
    [self validateSecureCodingForClass:[AWSEC2CreateVerifiedAccessTrustProviderDeviceOptions class]];
}

- (void) test_AWSEC2CreateVerifiedAccessTrustProviderOidcOptions {
    [self validateSecureCodingForClass:[AWSEC2CreateVerifiedAccessTrustProviderOidcOptions class]];
}

- (void) test_AWSEC2CreateVerifiedAccessTrustProviderRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateVerifiedAccessTrustProviderRequest class]];
}

- (void) test_AWSEC2CreateVerifiedAccessTrustProviderResult {
    [self validateSecureCodingForClass:[AWSEC2CreateVerifiedAccessTrustProviderResult class]];
}

- (void) test_AWSEC2CreateVolumePermission {
    [self validateSecureCodingForClass:[AWSEC2CreateVolumePermission class]];
}

- (void) test_AWSEC2CreateVolumePermissionModifications {
    [self validateSecureCodingForClass:[AWSEC2CreateVolumePermissionModifications class]];
}

- (void) test_AWSEC2CreateVolumeRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateVolumeRequest class]];
}

- (void) test_AWSEC2CreateVpcEndpointConnectionNotificationRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateVpcEndpointConnectionNotificationRequest class]];
}

- (void) test_AWSEC2CreateVpcEndpointConnectionNotificationResult {
    [self validateSecureCodingForClass:[AWSEC2CreateVpcEndpointConnectionNotificationResult class]];
}

- (void) test_AWSEC2CreateVpcEndpointRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateVpcEndpointRequest class]];
}

- (void) test_AWSEC2CreateVpcEndpointResult {
    [self validateSecureCodingForClass:[AWSEC2CreateVpcEndpointResult class]];
}

- (void) test_AWSEC2CreateVpcEndpointServiceConfigurationRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateVpcEndpointServiceConfigurationRequest class]];
}

- (void) test_AWSEC2CreateVpcEndpointServiceConfigurationResult {
    [self validateSecureCodingForClass:[AWSEC2CreateVpcEndpointServiceConfigurationResult class]];
}

- (void) test_AWSEC2CreateVpcPeeringConnectionRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateVpcPeeringConnectionRequest class]];
}

- (void) test_AWSEC2CreateVpcPeeringConnectionResult {
    [self validateSecureCodingForClass:[AWSEC2CreateVpcPeeringConnectionResult class]];
}

- (void) test_AWSEC2CreateVpcRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateVpcRequest class]];
}

- (void) test_AWSEC2CreateVpcResult {
    [self validateSecureCodingForClass:[AWSEC2CreateVpcResult class]];
}

- (void) test_AWSEC2CreateVpnConnectionRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateVpnConnectionRequest class]];
}

- (void) test_AWSEC2CreateVpnConnectionResult {
    [self validateSecureCodingForClass:[AWSEC2CreateVpnConnectionResult class]];
}

- (void) test_AWSEC2CreateVpnConnectionRouteRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateVpnConnectionRouteRequest class]];
}

- (void) test_AWSEC2CreateVpnGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2CreateVpnGatewayRequest class]];
}

- (void) test_AWSEC2CreateVpnGatewayResult {
    [self validateSecureCodingForClass:[AWSEC2CreateVpnGatewayResult class]];
}

- (void) test_AWSEC2CreditSpecification {
    [self validateSecureCodingForClass:[AWSEC2CreditSpecification class]];
}

- (void) test_AWSEC2CreditSpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2CreditSpecificationRequest class]];
}

- (void) test_AWSEC2CustomerGateway {
    [self validateSecureCodingForClass:[AWSEC2CustomerGateway class]];
}

- (void) test_AWSEC2DataQuery {
    [self validateSecureCodingForClass:[AWSEC2DataQuery class]];
}

- (void) test_AWSEC2DataResponse {
    [self validateSecureCodingForClass:[AWSEC2DataResponse class]];
}

- (void) test_AWSEC2DeleteCarrierGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteCarrierGatewayRequest class]];
}

- (void) test_AWSEC2DeleteCarrierGatewayResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteCarrierGatewayResult class]];
}

- (void) test_AWSEC2DeleteClientVpnEndpointRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteClientVpnEndpointRequest class]];
}

- (void) test_AWSEC2DeleteClientVpnEndpointResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteClientVpnEndpointResult class]];
}

- (void) test_AWSEC2DeleteClientVpnRouteRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteClientVpnRouteRequest class]];
}

- (void) test_AWSEC2DeleteClientVpnRouteResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteClientVpnRouteResult class]];
}

- (void) test_AWSEC2DeleteCoipCidrRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteCoipCidrRequest class]];
}

- (void) test_AWSEC2DeleteCoipCidrResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteCoipCidrResult class]];
}

- (void) test_AWSEC2DeleteCoipPoolRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteCoipPoolRequest class]];
}

- (void) test_AWSEC2DeleteCoipPoolResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteCoipPoolResult class]];
}

- (void) test_AWSEC2DeleteCustomerGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteCustomerGatewayRequest class]];
}

- (void) test_AWSEC2DeleteDhcpOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteDhcpOptionsRequest class]];
}

- (void) test_AWSEC2DeleteEgressOnlyInternetGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteEgressOnlyInternetGatewayRequest class]];
}

- (void) test_AWSEC2DeleteEgressOnlyInternetGatewayResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteEgressOnlyInternetGatewayResult class]];
}

- (void) test_AWSEC2DeleteFleetError {
    [self validateSecureCodingForClass:[AWSEC2DeleteFleetError class]];
}

- (void) test_AWSEC2DeleteFleetErrorItem {
    [self validateSecureCodingForClass:[AWSEC2DeleteFleetErrorItem class]];
}

- (void) test_AWSEC2DeleteFleetSuccessItem {
    [self validateSecureCodingForClass:[AWSEC2DeleteFleetSuccessItem class]];
}

- (void) test_AWSEC2DeleteFleetsRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteFleetsRequest class]];
}

- (void) test_AWSEC2DeleteFleetsResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteFleetsResult class]];
}

- (void) test_AWSEC2DeleteFlowLogsRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteFlowLogsRequest class]];
}

- (void) test_AWSEC2DeleteFlowLogsResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteFlowLogsResult class]];
}

- (void) test_AWSEC2DeleteFpgaImageRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteFpgaImageRequest class]];
}

- (void) test_AWSEC2DeleteFpgaImageResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteFpgaImageResult class]];
}

- (void) test_AWSEC2DeleteInstanceEventWindowRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteInstanceEventWindowRequest class]];
}

- (void) test_AWSEC2DeleteInstanceEventWindowResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteInstanceEventWindowResult class]];
}

- (void) test_AWSEC2DeleteInternetGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteInternetGatewayRequest class]];
}

- (void) test_AWSEC2DeleteIpamPoolRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteIpamPoolRequest class]];
}

- (void) test_AWSEC2DeleteIpamPoolResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteIpamPoolResult class]];
}

- (void) test_AWSEC2DeleteIpamRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteIpamRequest class]];
}

- (void) test_AWSEC2DeleteIpamResourceDiscoveryRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteIpamResourceDiscoveryRequest class]];
}

- (void) test_AWSEC2DeleteIpamResourceDiscoveryResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteIpamResourceDiscoveryResult class]];
}

- (void) test_AWSEC2DeleteIpamResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteIpamResult class]];
}

- (void) test_AWSEC2DeleteIpamScopeRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteIpamScopeRequest class]];
}

- (void) test_AWSEC2DeleteIpamScopeResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteIpamScopeResult class]];
}

- (void) test_AWSEC2DeleteKeyPairRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteKeyPairRequest class]];
}

- (void) test_AWSEC2DeleteLaunchTemplateRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteLaunchTemplateRequest class]];
}

- (void) test_AWSEC2DeleteLaunchTemplateResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteLaunchTemplateResult class]];
}

- (void) test_AWSEC2DeleteLaunchTemplateVersionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteLaunchTemplateVersionsRequest class]];
}

- (void) test_AWSEC2DeleteLaunchTemplateVersionsResponseErrorItem {
    [self validateSecureCodingForClass:[AWSEC2DeleteLaunchTemplateVersionsResponseErrorItem class]];
}

- (void) test_AWSEC2DeleteLaunchTemplateVersionsResponseSuccessItem {
    [self validateSecureCodingForClass:[AWSEC2DeleteLaunchTemplateVersionsResponseSuccessItem class]];
}

- (void) test_AWSEC2DeleteLaunchTemplateVersionsResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteLaunchTemplateVersionsResult class]];
}

- (void) test_AWSEC2DeleteLocalGatewayRouteRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteLocalGatewayRouteRequest class]];
}

- (void) test_AWSEC2DeleteLocalGatewayRouteResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteLocalGatewayRouteResult class]];
}

- (void) test_AWSEC2DeleteLocalGatewayRouteTableRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteLocalGatewayRouteTableRequest class]];
}

- (void) test_AWSEC2DeleteLocalGatewayRouteTableResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteLocalGatewayRouteTableResult class]];
}

- (void) test_AWSEC2DeleteLocalGatewayRouteTableVirtualInterfaceGroupAssociationRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteLocalGatewayRouteTableVirtualInterfaceGroupAssociationRequest class]];
}

- (void) test_AWSEC2DeleteLocalGatewayRouteTableVirtualInterfaceGroupAssociationResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteLocalGatewayRouteTableVirtualInterfaceGroupAssociationResult class]];
}

- (void) test_AWSEC2DeleteLocalGatewayRouteTableVpcAssociationRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteLocalGatewayRouteTableVpcAssociationRequest class]];
}

- (void) test_AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult class]];
}

- (void) test_AWSEC2DeleteManagedPrefixListRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteManagedPrefixListRequest class]];
}

- (void) test_AWSEC2DeleteManagedPrefixListResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteManagedPrefixListResult class]];
}

- (void) test_AWSEC2DeleteNatGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteNatGatewayRequest class]];
}

- (void) test_AWSEC2DeleteNatGatewayResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteNatGatewayResult class]];
}

- (void) test_AWSEC2DeleteNetworkAclEntryRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteNetworkAclEntryRequest class]];
}

- (void) test_AWSEC2DeleteNetworkAclRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteNetworkAclRequest class]];
}

- (void) test_AWSEC2DeleteNetworkInsightsAccessScopeAnalysisRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteNetworkInsightsAccessScopeAnalysisRequest class]];
}

- (void) test_AWSEC2DeleteNetworkInsightsAccessScopeAnalysisResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteNetworkInsightsAccessScopeAnalysisResult class]];
}

- (void) test_AWSEC2DeleteNetworkInsightsAccessScopeRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteNetworkInsightsAccessScopeRequest class]];
}

- (void) test_AWSEC2DeleteNetworkInsightsAccessScopeResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteNetworkInsightsAccessScopeResult class]];
}

- (void) test_AWSEC2DeleteNetworkInsightsAnalysisRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteNetworkInsightsAnalysisRequest class]];
}

- (void) test_AWSEC2DeleteNetworkInsightsAnalysisResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteNetworkInsightsAnalysisResult class]];
}

- (void) test_AWSEC2DeleteNetworkInsightsPathRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteNetworkInsightsPathRequest class]];
}

- (void) test_AWSEC2DeleteNetworkInsightsPathResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteNetworkInsightsPathResult class]];
}

- (void) test_AWSEC2DeleteNetworkInterfacePermissionRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteNetworkInterfacePermissionRequest class]];
}

- (void) test_AWSEC2DeleteNetworkInterfacePermissionResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteNetworkInterfacePermissionResult class]];
}

- (void) test_AWSEC2DeleteNetworkInterfaceRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteNetworkInterfaceRequest class]];
}

- (void) test_AWSEC2DeletePlacementGroupRequest {
    [self validateSecureCodingForClass:[AWSEC2DeletePlacementGroupRequest class]];
}

- (void) test_AWSEC2DeletePublicIpv4PoolRequest {
    [self validateSecureCodingForClass:[AWSEC2DeletePublicIpv4PoolRequest class]];
}

- (void) test_AWSEC2DeletePublicIpv4PoolResult {
    [self validateSecureCodingForClass:[AWSEC2DeletePublicIpv4PoolResult class]];
}

- (void) test_AWSEC2DeleteQueuedReservedInstancesError {
    [self validateSecureCodingForClass:[AWSEC2DeleteQueuedReservedInstancesError class]];
}

- (void) test_AWSEC2DeleteQueuedReservedInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteQueuedReservedInstancesRequest class]];
}

- (void) test_AWSEC2DeleteQueuedReservedInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteQueuedReservedInstancesResult class]];
}

- (void) test_AWSEC2DeleteRouteRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteRouteRequest class]];
}

- (void) test_AWSEC2DeleteRouteTableRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteRouteTableRequest class]];
}

- (void) test_AWSEC2DeleteSecurityGroupRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteSecurityGroupRequest class]];
}

- (void) test_AWSEC2DeleteSnapshotRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteSnapshotRequest class]];
}

- (void) test_AWSEC2DeleteSpotDatafeedSubscriptionRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteSpotDatafeedSubscriptionRequest class]];
}

- (void) test_AWSEC2DeleteSubnetCidrReservationRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteSubnetCidrReservationRequest class]];
}

- (void) test_AWSEC2DeleteSubnetCidrReservationResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteSubnetCidrReservationResult class]];
}

- (void) test_AWSEC2DeleteSubnetRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteSubnetRequest class]];
}

- (void) test_AWSEC2DeleteTagsRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTagsRequest class]];
}

- (void) test_AWSEC2DeleteTrafficMirrorFilterRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTrafficMirrorFilterRequest class]];
}

- (void) test_AWSEC2DeleteTrafficMirrorFilterResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTrafficMirrorFilterResult class]];
}

- (void) test_AWSEC2DeleteTrafficMirrorFilterRuleRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTrafficMirrorFilterRuleRequest class]];
}

- (void) test_AWSEC2DeleteTrafficMirrorFilterRuleResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTrafficMirrorFilterRuleResult class]];
}

- (void) test_AWSEC2DeleteTrafficMirrorSessionRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTrafficMirrorSessionRequest class]];
}

- (void) test_AWSEC2DeleteTrafficMirrorSessionResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTrafficMirrorSessionResult class]];
}

- (void) test_AWSEC2DeleteTrafficMirrorTargetRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTrafficMirrorTargetRequest class]];
}

- (void) test_AWSEC2DeleteTrafficMirrorTargetResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTrafficMirrorTargetResult class]];
}

- (void) test_AWSEC2DeleteTransitGatewayConnectPeerRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayConnectPeerRequest class]];
}

- (void) test_AWSEC2DeleteTransitGatewayConnectPeerResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayConnectPeerResult class]];
}

- (void) test_AWSEC2DeleteTransitGatewayConnectRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayConnectRequest class]];
}

- (void) test_AWSEC2DeleteTransitGatewayConnectResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayConnectResult class]];
}

- (void) test_AWSEC2DeleteTransitGatewayMulticastDomainRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayMulticastDomainRequest class]];
}

- (void) test_AWSEC2DeleteTransitGatewayMulticastDomainResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayMulticastDomainResult class]];
}

- (void) test_AWSEC2DeleteTransitGatewayPeeringAttachmentRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayPeeringAttachmentRequest class]];
}

- (void) test_AWSEC2DeleteTransitGatewayPeeringAttachmentResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayPeeringAttachmentResult class]];
}

- (void) test_AWSEC2DeleteTransitGatewayPolicyTableRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayPolicyTableRequest class]];
}

- (void) test_AWSEC2DeleteTransitGatewayPolicyTableResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayPolicyTableResult class]];
}

- (void) test_AWSEC2DeleteTransitGatewayPrefixListReferenceRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayPrefixListReferenceRequest class]];
}

- (void) test_AWSEC2DeleteTransitGatewayPrefixListReferenceResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayPrefixListReferenceResult class]];
}

- (void) test_AWSEC2DeleteTransitGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayRequest class]];
}

- (void) test_AWSEC2DeleteTransitGatewayResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayResult class]];
}

- (void) test_AWSEC2DeleteTransitGatewayRouteRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayRouteRequest class]];
}

- (void) test_AWSEC2DeleteTransitGatewayRouteResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayRouteResult class]];
}

- (void) test_AWSEC2DeleteTransitGatewayRouteTableAnnouncementRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayRouteTableAnnouncementRequest class]];
}

- (void) test_AWSEC2DeleteTransitGatewayRouteTableAnnouncementResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayRouteTableAnnouncementResult class]];
}

- (void) test_AWSEC2DeleteTransitGatewayRouteTableRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayRouteTableRequest class]];
}

- (void) test_AWSEC2DeleteTransitGatewayRouteTableResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayRouteTableResult class]];
}

- (void) test_AWSEC2DeleteTransitGatewayVpcAttachmentRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayVpcAttachmentRequest class]];
}

- (void) test_AWSEC2DeleteTransitGatewayVpcAttachmentResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteTransitGatewayVpcAttachmentResult class]];
}

- (void) test_AWSEC2DeleteVerifiedAccessEndpointRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteVerifiedAccessEndpointRequest class]];
}

- (void) test_AWSEC2DeleteVerifiedAccessEndpointResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteVerifiedAccessEndpointResult class]];
}

- (void) test_AWSEC2DeleteVerifiedAccessGroupRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteVerifiedAccessGroupRequest class]];
}

- (void) test_AWSEC2DeleteVerifiedAccessGroupResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteVerifiedAccessGroupResult class]];
}

- (void) test_AWSEC2DeleteVerifiedAccessInstanceRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteVerifiedAccessInstanceRequest class]];
}

- (void) test_AWSEC2DeleteVerifiedAccessInstanceResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteVerifiedAccessInstanceResult class]];
}

- (void) test_AWSEC2DeleteVerifiedAccessTrustProviderRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteVerifiedAccessTrustProviderRequest class]];
}

- (void) test_AWSEC2DeleteVerifiedAccessTrustProviderResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteVerifiedAccessTrustProviderResult class]];
}

- (void) test_AWSEC2DeleteVolumeRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteVolumeRequest class]];
}

- (void) test_AWSEC2DeleteVpcEndpointConnectionNotificationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteVpcEndpointConnectionNotificationsRequest class]];
}

- (void) test_AWSEC2DeleteVpcEndpointConnectionNotificationsResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteVpcEndpointConnectionNotificationsResult class]];
}

- (void) test_AWSEC2DeleteVpcEndpointServiceConfigurationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteVpcEndpointServiceConfigurationsRequest class]];
}

- (void) test_AWSEC2DeleteVpcEndpointServiceConfigurationsResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteVpcEndpointServiceConfigurationsResult class]];
}

- (void) test_AWSEC2DeleteVpcEndpointsRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteVpcEndpointsRequest class]];
}

- (void) test_AWSEC2DeleteVpcEndpointsResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteVpcEndpointsResult class]];
}

- (void) test_AWSEC2DeleteVpcPeeringConnectionRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteVpcPeeringConnectionRequest class]];
}

- (void) test_AWSEC2DeleteVpcPeeringConnectionResult {
    [self validateSecureCodingForClass:[AWSEC2DeleteVpcPeeringConnectionResult class]];
}

- (void) test_AWSEC2DeleteVpcRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteVpcRequest class]];
}

- (void) test_AWSEC2DeleteVpnConnectionRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteVpnConnectionRequest class]];
}

- (void) test_AWSEC2DeleteVpnConnectionRouteRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteVpnConnectionRouteRequest class]];
}

- (void) test_AWSEC2DeleteVpnGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2DeleteVpnGatewayRequest class]];
}

- (void) test_AWSEC2DeprovisionByoipCidrRequest {
    [self validateSecureCodingForClass:[AWSEC2DeprovisionByoipCidrRequest class]];
}

- (void) test_AWSEC2DeprovisionByoipCidrResult {
    [self validateSecureCodingForClass:[AWSEC2DeprovisionByoipCidrResult class]];
}

- (void) test_AWSEC2DeprovisionIpamPoolCidrRequest {
    [self validateSecureCodingForClass:[AWSEC2DeprovisionIpamPoolCidrRequest class]];
}

- (void) test_AWSEC2DeprovisionIpamPoolCidrResult {
    [self validateSecureCodingForClass:[AWSEC2DeprovisionIpamPoolCidrResult class]];
}

- (void) test_AWSEC2DeprovisionPublicIpv4PoolCidrRequest {
    [self validateSecureCodingForClass:[AWSEC2DeprovisionPublicIpv4PoolCidrRequest class]];
}

- (void) test_AWSEC2DeprovisionPublicIpv4PoolCidrResult {
    [self validateSecureCodingForClass:[AWSEC2DeprovisionPublicIpv4PoolCidrResult class]];
}

- (void) test_AWSEC2DeregisterImageRequest {
    [self validateSecureCodingForClass:[AWSEC2DeregisterImageRequest class]];
}

- (void) test_AWSEC2DeregisterInstanceEventNotificationAttributesRequest {
    [self validateSecureCodingForClass:[AWSEC2DeregisterInstanceEventNotificationAttributesRequest class]];
}

- (void) test_AWSEC2DeregisterInstanceEventNotificationAttributesResult {
    [self validateSecureCodingForClass:[AWSEC2DeregisterInstanceEventNotificationAttributesResult class]];
}

- (void) test_AWSEC2DeregisterInstanceTagAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2DeregisterInstanceTagAttributeRequest class]];
}

- (void) test_AWSEC2DeregisterTransitGatewayMulticastGroupMembersRequest {
    [self validateSecureCodingForClass:[AWSEC2DeregisterTransitGatewayMulticastGroupMembersRequest class]];
}

- (void) test_AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult {
    [self validateSecureCodingForClass:[AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult class]];
}

- (void) test_AWSEC2DeregisterTransitGatewayMulticastGroupSourcesRequest {
    [self validateSecureCodingForClass:[AWSEC2DeregisterTransitGatewayMulticastGroupSourcesRequest class]];
}

- (void) test_AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult {
    [self validateSecureCodingForClass:[AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult class]];
}

- (void) test_AWSEC2DescribeAccountAttributesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeAccountAttributesRequest class]];
}

- (void) test_AWSEC2DescribeAccountAttributesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeAccountAttributesResult class]];
}

- (void) test_AWSEC2DescribeAddressTransfersRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeAddressTransfersRequest class]];
}

- (void) test_AWSEC2DescribeAddressTransfersResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeAddressTransfersResult class]];
}

- (void) test_AWSEC2DescribeAddressesAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeAddressesAttributeRequest class]];
}

- (void) test_AWSEC2DescribeAddressesAttributeResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeAddressesAttributeResult class]];
}

- (void) test_AWSEC2DescribeAddressesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeAddressesRequest class]];
}

- (void) test_AWSEC2DescribeAddressesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeAddressesResult class]];
}

- (void) test_AWSEC2DescribeAggregateIdFormatRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeAggregateIdFormatRequest class]];
}

- (void) test_AWSEC2DescribeAggregateIdFormatResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeAggregateIdFormatResult class]];
}

- (void) test_AWSEC2DescribeAvailabilityZonesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeAvailabilityZonesRequest class]];
}

- (void) test_AWSEC2DescribeAvailabilityZonesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeAvailabilityZonesResult class]];
}

- (void) test_AWSEC2DescribeAwsNetworkPerformanceMetricSubscriptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeAwsNetworkPerformanceMetricSubscriptionsRequest class]];
}

- (void) test_AWSEC2DescribeAwsNetworkPerformanceMetricSubscriptionsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeAwsNetworkPerformanceMetricSubscriptionsResult class]];
}

- (void) test_AWSEC2DescribeBundleTasksRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeBundleTasksRequest class]];
}

- (void) test_AWSEC2DescribeBundleTasksResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeBundleTasksResult class]];
}

- (void) test_AWSEC2DescribeByoipCidrsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeByoipCidrsRequest class]];
}

- (void) test_AWSEC2DescribeByoipCidrsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeByoipCidrsResult class]];
}

- (void) test_AWSEC2DescribeCapacityReservationFleetsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeCapacityReservationFleetsRequest class]];
}

- (void) test_AWSEC2DescribeCapacityReservationFleetsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeCapacityReservationFleetsResult class]];
}

- (void) test_AWSEC2DescribeCapacityReservationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeCapacityReservationsRequest class]];
}

- (void) test_AWSEC2DescribeCapacityReservationsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeCapacityReservationsResult class]];
}

- (void) test_AWSEC2DescribeCarrierGatewaysRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeCarrierGatewaysRequest class]];
}

- (void) test_AWSEC2DescribeCarrierGatewaysResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeCarrierGatewaysResult class]];
}

- (void) test_AWSEC2DescribeClassicLinkInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeClassicLinkInstancesRequest class]];
}

- (void) test_AWSEC2DescribeClassicLinkInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeClassicLinkInstancesResult class]];
}

- (void) test_AWSEC2DescribeClientVpnAuthorizationRulesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeClientVpnAuthorizationRulesRequest class]];
}

- (void) test_AWSEC2DescribeClientVpnAuthorizationRulesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeClientVpnAuthorizationRulesResult class]];
}

- (void) test_AWSEC2DescribeClientVpnConnectionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeClientVpnConnectionsRequest class]];
}

- (void) test_AWSEC2DescribeClientVpnConnectionsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeClientVpnConnectionsResult class]];
}

- (void) test_AWSEC2DescribeClientVpnEndpointsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeClientVpnEndpointsRequest class]];
}

- (void) test_AWSEC2DescribeClientVpnEndpointsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeClientVpnEndpointsResult class]];
}

- (void) test_AWSEC2DescribeClientVpnRoutesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeClientVpnRoutesRequest class]];
}

- (void) test_AWSEC2DescribeClientVpnRoutesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeClientVpnRoutesResult class]];
}

- (void) test_AWSEC2DescribeClientVpnTargetNetworksRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeClientVpnTargetNetworksRequest class]];
}

- (void) test_AWSEC2DescribeClientVpnTargetNetworksResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeClientVpnTargetNetworksResult class]];
}

- (void) test_AWSEC2DescribeCoipPoolsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeCoipPoolsRequest class]];
}

- (void) test_AWSEC2DescribeCoipPoolsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeCoipPoolsResult class]];
}

- (void) test_AWSEC2DescribeConversionTasksRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeConversionTasksRequest class]];
}

- (void) test_AWSEC2DescribeConversionTasksResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeConversionTasksResult class]];
}

- (void) test_AWSEC2DescribeCustomerGatewaysRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeCustomerGatewaysRequest class]];
}

- (void) test_AWSEC2DescribeCustomerGatewaysResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeCustomerGatewaysResult class]];
}

- (void) test_AWSEC2DescribeDhcpOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeDhcpOptionsRequest class]];
}

- (void) test_AWSEC2DescribeDhcpOptionsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeDhcpOptionsResult class]];
}

- (void) test_AWSEC2DescribeEgressOnlyInternetGatewaysRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeEgressOnlyInternetGatewaysRequest class]];
}

- (void) test_AWSEC2DescribeEgressOnlyInternetGatewaysResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeEgressOnlyInternetGatewaysResult class]];
}

- (void) test_AWSEC2DescribeElasticGpusRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeElasticGpusRequest class]];
}

- (void) test_AWSEC2DescribeElasticGpusResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeElasticGpusResult class]];
}

- (void) test_AWSEC2DescribeExportImageTasksRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeExportImageTasksRequest class]];
}

- (void) test_AWSEC2DescribeExportImageTasksResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeExportImageTasksResult class]];
}

- (void) test_AWSEC2DescribeExportTasksRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeExportTasksRequest class]];
}

- (void) test_AWSEC2DescribeExportTasksResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeExportTasksResult class]];
}

- (void) test_AWSEC2DescribeFastLaunchImagesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeFastLaunchImagesRequest class]];
}

- (void) test_AWSEC2DescribeFastLaunchImagesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeFastLaunchImagesResult class]];
}

- (void) test_AWSEC2DescribeFastLaunchImagesSuccessItem {
    [self validateSecureCodingForClass:[AWSEC2DescribeFastLaunchImagesSuccessItem class]];
}

- (void) test_AWSEC2DescribeFastSnapshotRestoreSuccessItem {
    [self validateSecureCodingForClass:[AWSEC2DescribeFastSnapshotRestoreSuccessItem class]];
}

- (void) test_AWSEC2DescribeFastSnapshotRestoresRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeFastSnapshotRestoresRequest class]];
}

- (void) test_AWSEC2DescribeFastSnapshotRestoresResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeFastSnapshotRestoresResult class]];
}

- (void) test_AWSEC2DescribeFleetError {
    [self validateSecureCodingForClass:[AWSEC2DescribeFleetError class]];
}

- (void) test_AWSEC2DescribeFleetHistoryRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeFleetHistoryRequest class]];
}

- (void) test_AWSEC2DescribeFleetHistoryResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeFleetHistoryResult class]];
}

- (void) test_AWSEC2DescribeFleetInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeFleetInstancesRequest class]];
}

- (void) test_AWSEC2DescribeFleetInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeFleetInstancesResult class]];
}

- (void) test_AWSEC2DescribeFleetsInstances {
    [self validateSecureCodingForClass:[AWSEC2DescribeFleetsInstances class]];
}

- (void) test_AWSEC2DescribeFleetsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeFleetsRequest class]];
}

- (void) test_AWSEC2DescribeFleetsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeFleetsResult class]];
}

- (void) test_AWSEC2DescribeFlowLogsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeFlowLogsRequest class]];
}

- (void) test_AWSEC2DescribeFlowLogsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeFlowLogsResult class]];
}

- (void) test_AWSEC2DescribeFpgaImageAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeFpgaImageAttributeRequest class]];
}

- (void) test_AWSEC2DescribeFpgaImageAttributeResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeFpgaImageAttributeResult class]];
}

- (void) test_AWSEC2DescribeFpgaImagesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeFpgaImagesRequest class]];
}

- (void) test_AWSEC2DescribeFpgaImagesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeFpgaImagesResult class]];
}

- (void) test_AWSEC2DescribeHostReservationOfferingsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeHostReservationOfferingsRequest class]];
}

- (void) test_AWSEC2DescribeHostReservationOfferingsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeHostReservationOfferingsResult class]];
}

- (void) test_AWSEC2DescribeHostReservationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeHostReservationsRequest class]];
}

- (void) test_AWSEC2DescribeHostReservationsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeHostReservationsResult class]];
}

- (void) test_AWSEC2DescribeHostsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeHostsRequest class]];
}

- (void) test_AWSEC2DescribeHostsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeHostsResult class]];
}

- (void) test_AWSEC2DescribeIamInstanceProfileAssociationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeIamInstanceProfileAssociationsRequest class]];
}

- (void) test_AWSEC2DescribeIamInstanceProfileAssociationsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeIamInstanceProfileAssociationsResult class]];
}

- (void) test_AWSEC2DescribeIdFormatRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeIdFormatRequest class]];
}

- (void) test_AWSEC2DescribeIdFormatResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeIdFormatResult class]];
}

- (void) test_AWSEC2DescribeIdentityIdFormatRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeIdentityIdFormatRequest class]];
}

- (void) test_AWSEC2DescribeIdentityIdFormatResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeIdentityIdFormatResult class]];
}

- (void) test_AWSEC2DescribeImageAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeImageAttributeRequest class]];
}

- (void) test_AWSEC2DescribeImagesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeImagesRequest class]];
}

- (void) test_AWSEC2DescribeImagesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeImagesResult class]];
}

- (void) test_AWSEC2DescribeImportImageTasksRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeImportImageTasksRequest class]];
}

- (void) test_AWSEC2DescribeImportImageTasksResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeImportImageTasksResult class]];
}

- (void) test_AWSEC2DescribeImportSnapshotTasksRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeImportSnapshotTasksRequest class]];
}

- (void) test_AWSEC2DescribeImportSnapshotTasksResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeImportSnapshotTasksResult class]];
}

- (void) test_AWSEC2DescribeInstanceAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstanceAttributeRequest class]];
}

- (void) test_AWSEC2DescribeInstanceCreditSpecificationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstanceCreditSpecificationsRequest class]];
}

- (void) test_AWSEC2DescribeInstanceCreditSpecificationsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstanceCreditSpecificationsResult class]];
}

- (void) test_AWSEC2DescribeInstanceEventNotificationAttributesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstanceEventNotificationAttributesRequest class]];
}

- (void) test_AWSEC2DescribeInstanceEventNotificationAttributesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstanceEventNotificationAttributesResult class]];
}

- (void) test_AWSEC2DescribeInstanceEventWindowsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstanceEventWindowsRequest class]];
}

- (void) test_AWSEC2DescribeInstanceEventWindowsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstanceEventWindowsResult class]];
}

- (void) test_AWSEC2DescribeInstanceStatusRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstanceStatusRequest class]];
}

- (void) test_AWSEC2DescribeInstanceStatusResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstanceStatusResult class]];
}

- (void) test_AWSEC2DescribeInstanceTypeOfferingsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstanceTypeOfferingsRequest class]];
}

- (void) test_AWSEC2DescribeInstanceTypeOfferingsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstanceTypeOfferingsResult class]];
}

- (void) test_AWSEC2DescribeInstanceTypesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstanceTypesRequest class]];
}

- (void) test_AWSEC2DescribeInstanceTypesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstanceTypesResult class]];
}

- (void) test_AWSEC2DescribeInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstancesRequest class]];
}

- (void) test_AWSEC2DescribeInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeInstancesResult class]];
}

- (void) test_AWSEC2DescribeInternetGatewaysRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeInternetGatewaysRequest class]];
}

- (void) test_AWSEC2DescribeInternetGatewaysResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeInternetGatewaysResult class]];
}

- (void) test_AWSEC2DescribeIpamPoolsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeIpamPoolsRequest class]];
}

- (void) test_AWSEC2DescribeIpamPoolsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeIpamPoolsResult class]];
}

- (void) test_AWSEC2DescribeIpamResourceDiscoveriesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeIpamResourceDiscoveriesRequest class]];
}

- (void) test_AWSEC2DescribeIpamResourceDiscoveriesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeIpamResourceDiscoveriesResult class]];
}

- (void) test_AWSEC2DescribeIpamResourceDiscoveryAssociationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeIpamResourceDiscoveryAssociationsRequest class]];
}

- (void) test_AWSEC2DescribeIpamResourceDiscoveryAssociationsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeIpamResourceDiscoveryAssociationsResult class]];
}

- (void) test_AWSEC2DescribeIpamScopesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeIpamScopesRequest class]];
}

- (void) test_AWSEC2DescribeIpamScopesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeIpamScopesResult class]];
}

- (void) test_AWSEC2DescribeIpamsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeIpamsRequest class]];
}

- (void) test_AWSEC2DescribeIpamsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeIpamsResult class]];
}

- (void) test_AWSEC2DescribeIpv6PoolsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeIpv6PoolsRequest class]];
}

- (void) test_AWSEC2DescribeIpv6PoolsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeIpv6PoolsResult class]];
}

- (void) test_AWSEC2DescribeKeyPairsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeKeyPairsRequest class]];
}

- (void) test_AWSEC2DescribeKeyPairsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeKeyPairsResult class]];
}

- (void) test_AWSEC2DescribeLaunchTemplateVersionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeLaunchTemplateVersionsRequest class]];
}

- (void) test_AWSEC2DescribeLaunchTemplateVersionsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeLaunchTemplateVersionsResult class]];
}

- (void) test_AWSEC2DescribeLaunchTemplatesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeLaunchTemplatesRequest class]];
}

- (void) test_AWSEC2DescribeLaunchTemplatesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeLaunchTemplatesResult class]];
}

- (void) test_AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsRequest class]];
}

- (void) test_AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult class]];
}

- (void) test_AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsRequest class]];
}

- (void) test_AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult class]];
}

- (void) test_AWSEC2DescribeLocalGatewayRouteTablesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeLocalGatewayRouteTablesRequest class]];
}

- (void) test_AWSEC2DescribeLocalGatewayRouteTablesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeLocalGatewayRouteTablesResult class]];
}

- (void) test_AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsRequest class]];
}

- (void) test_AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult class]];
}

- (void) test_AWSEC2DescribeLocalGatewayVirtualInterfacesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeLocalGatewayVirtualInterfacesRequest class]];
}

- (void) test_AWSEC2DescribeLocalGatewayVirtualInterfacesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeLocalGatewayVirtualInterfacesResult class]];
}

- (void) test_AWSEC2DescribeLocalGatewaysRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeLocalGatewaysRequest class]];
}

- (void) test_AWSEC2DescribeLocalGatewaysResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeLocalGatewaysResult class]];
}

- (void) test_AWSEC2DescribeManagedPrefixListsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeManagedPrefixListsRequest class]];
}

- (void) test_AWSEC2DescribeManagedPrefixListsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeManagedPrefixListsResult class]];
}

- (void) test_AWSEC2DescribeMovingAddressesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeMovingAddressesRequest class]];
}

- (void) test_AWSEC2DescribeMovingAddressesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeMovingAddressesResult class]];
}

- (void) test_AWSEC2DescribeNatGatewaysRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeNatGatewaysRequest class]];
}

- (void) test_AWSEC2DescribeNatGatewaysResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeNatGatewaysResult class]];
}

- (void) test_AWSEC2DescribeNetworkAclsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkAclsRequest class]];
}

- (void) test_AWSEC2DescribeNetworkAclsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkAclsResult class]];
}

- (void) test_AWSEC2DescribeNetworkInsightsAccessScopeAnalysesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInsightsAccessScopeAnalysesRequest class]];
}

- (void) test_AWSEC2DescribeNetworkInsightsAccessScopeAnalysesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInsightsAccessScopeAnalysesResult class]];
}

- (void) test_AWSEC2DescribeNetworkInsightsAccessScopesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInsightsAccessScopesRequest class]];
}

- (void) test_AWSEC2DescribeNetworkInsightsAccessScopesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInsightsAccessScopesResult class]];
}

- (void) test_AWSEC2DescribeNetworkInsightsAnalysesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInsightsAnalysesRequest class]];
}

- (void) test_AWSEC2DescribeNetworkInsightsAnalysesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInsightsAnalysesResult class]];
}

- (void) test_AWSEC2DescribeNetworkInsightsPathsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInsightsPathsRequest class]];
}

- (void) test_AWSEC2DescribeNetworkInsightsPathsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInsightsPathsResult class]];
}

- (void) test_AWSEC2DescribeNetworkInterfaceAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInterfaceAttributeRequest class]];
}

- (void) test_AWSEC2DescribeNetworkInterfaceAttributeResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInterfaceAttributeResult class]];
}

- (void) test_AWSEC2DescribeNetworkInterfacePermissionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInterfacePermissionsRequest class]];
}

- (void) test_AWSEC2DescribeNetworkInterfacePermissionsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInterfacePermissionsResult class]];
}

- (void) test_AWSEC2DescribeNetworkInterfacesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInterfacesRequest class]];
}

- (void) test_AWSEC2DescribeNetworkInterfacesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeNetworkInterfacesResult class]];
}

- (void) test_AWSEC2DescribePlacementGroupsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribePlacementGroupsRequest class]];
}

- (void) test_AWSEC2DescribePlacementGroupsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribePlacementGroupsResult class]];
}

- (void) test_AWSEC2DescribePrefixListsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribePrefixListsRequest class]];
}

- (void) test_AWSEC2DescribePrefixListsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribePrefixListsResult class]];
}

- (void) test_AWSEC2DescribePrincipalIdFormatRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribePrincipalIdFormatRequest class]];
}

- (void) test_AWSEC2DescribePrincipalIdFormatResult {
    [self validateSecureCodingForClass:[AWSEC2DescribePrincipalIdFormatResult class]];
}

- (void) test_AWSEC2DescribePublicIpv4PoolsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribePublicIpv4PoolsRequest class]];
}

- (void) test_AWSEC2DescribePublicIpv4PoolsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribePublicIpv4PoolsResult class]];
}

- (void) test_AWSEC2DescribeRegionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeRegionsRequest class]];
}

- (void) test_AWSEC2DescribeRegionsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeRegionsResult class]];
}

- (void) test_AWSEC2DescribeReplaceRootVolumeTasksRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeReplaceRootVolumeTasksRequest class]];
}

- (void) test_AWSEC2DescribeReplaceRootVolumeTasksResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeReplaceRootVolumeTasksResult class]];
}

- (void) test_AWSEC2DescribeReservedInstancesListingsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeReservedInstancesListingsRequest class]];
}

- (void) test_AWSEC2DescribeReservedInstancesListingsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeReservedInstancesListingsResult class]];
}

- (void) test_AWSEC2DescribeReservedInstancesModificationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeReservedInstancesModificationsRequest class]];
}

- (void) test_AWSEC2DescribeReservedInstancesModificationsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeReservedInstancesModificationsResult class]];
}

- (void) test_AWSEC2DescribeReservedInstancesOfferingsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeReservedInstancesOfferingsRequest class]];
}

- (void) test_AWSEC2DescribeReservedInstancesOfferingsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeReservedInstancesOfferingsResult class]];
}

- (void) test_AWSEC2DescribeReservedInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeReservedInstancesRequest class]];
}

- (void) test_AWSEC2DescribeReservedInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeReservedInstancesResult class]];
}

- (void) test_AWSEC2DescribeRouteTablesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeRouteTablesRequest class]];
}

- (void) test_AWSEC2DescribeRouteTablesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeRouteTablesResult class]];
}

- (void) test_AWSEC2DescribeScheduledInstanceAvailabilityRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeScheduledInstanceAvailabilityRequest class]];
}

- (void) test_AWSEC2DescribeScheduledInstanceAvailabilityResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeScheduledInstanceAvailabilityResult class]];
}

- (void) test_AWSEC2DescribeScheduledInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeScheduledInstancesRequest class]];
}

- (void) test_AWSEC2DescribeScheduledInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeScheduledInstancesResult class]];
}

- (void) test_AWSEC2DescribeSecurityGroupReferencesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeSecurityGroupReferencesRequest class]];
}

- (void) test_AWSEC2DescribeSecurityGroupReferencesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeSecurityGroupReferencesResult class]];
}

- (void) test_AWSEC2DescribeSecurityGroupRulesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeSecurityGroupRulesRequest class]];
}

- (void) test_AWSEC2DescribeSecurityGroupRulesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeSecurityGroupRulesResult class]];
}

- (void) test_AWSEC2DescribeSecurityGroupsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeSecurityGroupsRequest class]];
}

- (void) test_AWSEC2DescribeSecurityGroupsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeSecurityGroupsResult class]];
}

- (void) test_AWSEC2DescribeSnapshotAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeSnapshotAttributeRequest class]];
}

- (void) test_AWSEC2DescribeSnapshotAttributeResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeSnapshotAttributeResult class]];
}

- (void) test_AWSEC2DescribeSnapshotTierStatusRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeSnapshotTierStatusRequest class]];
}

- (void) test_AWSEC2DescribeSnapshotTierStatusResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeSnapshotTierStatusResult class]];
}

- (void) test_AWSEC2DescribeSnapshotsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeSnapshotsRequest class]];
}

- (void) test_AWSEC2DescribeSnapshotsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeSnapshotsResult class]];
}

- (void) test_AWSEC2DescribeSpotDatafeedSubscriptionRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeSpotDatafeedSubscriptionRequest class]];
}

- (void) test_AWSEC2DescribeSpotDatafeedSubscriptionResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeSpotDatafeedSubscriptionResult class]];
}

- (void) test_AWSEC2DescribeSpotFleetInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeSpotFleetInstancesRequest class]];
}

- (void) test_AWSEC2DescribeSpotFleetInstancesResponse {
    [self validateSecureCodingForClass:[AWSEC2DescribeSpotFleetInstancesResponse class]];
}

- (void) test_AWSEC2DescribeSpotFleetRequestHistoryRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeSpotFleetRequestHistoryRequest class]];
}

- (void) test_AWSEC2DescribeSpotFleetRequestHistoryResponse {
    [self validateSecureCodingForClass:[AWSEC2DescribeSpotFleetRequestHistoryResponse class]];
}

- (void) test_AWSEC2DescribeSpotFleetRequestsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeSpotFleetRequestsRequest class]];
}

- (void) test_AWSEC2DescribeSpotFleetRequestsResponse {
    [self validateSecureCodingForClass:[AWSEC2DescribeSpotFleetRequestsResponse class]];
}

- (void) test_AWSEC2DescribeSpotInstanceRequestsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeSpotInstanceRequestsRequest class]];
}

- (void) test_AWSEC2DescribeSpotInstanceRequestsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeSpotInstanceRequestsResult class]];
}

- (void) test_AWSEC2DescribeSpotPriceHistoryRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeSpotPriceHistoryRequest class]];
}

- (void) test_AWSEC2DescribeSpotPriceHistoryResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeSpotPriceHistoryResult class]];
}

- (void) test_AWSEC2DescribeStaleSecurityGroupsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeStaleSecurityGroupsRequest class]];
}

- (void) test_AWSEC2DescribeStaleSecurityGroupsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeStaleSecurityGroupsResult class]];
}

- (void) test_AWSEC2DescribeStoreImageTasksRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeStoreImageTasksRequest class]];
}

- (void) test_AWSEC2DescribeStoreImageTasksResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeStoreImageTasksResult class]];
}

- (void) test_AWSEC2DescribeSubnetsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeSubnetsRequest class]];
}

- (void) test_AWSEC2DescribeSubnetsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeSubnetsResult class]];
}

- (void) test_AWSEC2DescribeTagsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTagsRequest class]];
}

- (void) test_AWSEC2DescribeTagsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTagsResult class]];
}

- (void) test_AWSEC2DescribeTrafficMirrorFiltersRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTrafficMirrorFiltersRequest class]];
}

- (void) test_AWSEC2DescribeTrafficMirrorFiltersResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTrafficMirrorFiltersResult class]];
}

- (void) test_AWSEC2DescribeTrafficMirrorSessionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTrafficMirrorSessionsRequest class]];
}

- (void) test_AWSEC2DescribeTrafficMirrorSessionsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTrafficMirrorSessionsResult class]];
}

- (void) test_AWSEC2DescribeTrafficMirrorTargetsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTrafficMirrorTargetsRequest class]];
}

- (void) test_AWSEC2DescribeTrafficMirrorTargetsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTrafficMirrorTargetsResult class]];
}

- (void) test_AWSEC2DescribeTransitGatewayAttachmentsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayAttachmentsRequest class]];
}

- (void) test_AWSEC2DescribeTransitGatewayAttachmentsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayAttachmentsResult class]];
}

- (void) test_AWSEC2DescribeTransitGatewayConnectPeersRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayConnectPeersRequest class]];
}

- (void) test_AWSEC2DescribeTransitGatewayConnectPeersResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayConnectPeersResult class]];
}

- (void) test_AWSEC2DescribeTransitGatewayConnectsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayConnectsRequest class]];
}

- (void) test_AWSEC2DescribeTransitGatewayConnectsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayConnectsResult class]];
}

- (void) test_AWSEC2DescribeTransitGatewayMulticastDomainsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayMulticastDomainsRequest class]];
}

- (void) test_AWSEC2DescribeTransitGatewayMulticastDomainsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayMulticastDomainsResult class]];
}

- (void) test_AWSEC2DescribeTransitGatewayPeeringAttachmentsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayPeeringAttachmentsRequest class]];
}

- (void) test_AWSEC2DescribeTransitGatewayPeeringAttachmentsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayPeeringAttachmentsResult class]];
}

- (void) test_AWSEC2DescribeTransitGatewayPolicyTablesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayPolicyTablesRequest class]];
}

- (void) test_AWSEC2DescribeTransitGatewayPolicyTablesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayPolicyTablesResult class]];
}

- (void) test_AWSEC2DescribeTransitGatewayRouteTableAnnouncementsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayRouteTableAnnouncementsRequest class]];
}

- (void) test_AWSEC2DescribeTransitGatewayRouteTableAnnouncementsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayRouteTableAnnouncementsResult class]];
}

- (void) test_AWSEC2DescribeTransitGatewayRouteTablesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayRouteTablesRequest class]];
}

- (void) test_AWSEC2DescribeTransitGatewayRouteTablesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayRouteTablesResult class]];
}

- (void) test_AWSEC2DescribeTransitGatewayVpcAttachmentsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayVpcAttachmentsRequest class]];
}

- (void) test_AWSEC2DescribeTransitGatewayVpcAttachmentsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewayVpcAttachmentsResult class]];
}

- (void) test_AWSEC2DescribeTransitGatewaysRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewaysRequest class]];
}

- (void) test_AWSEC2DescribeTransitGatewaysResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTransitGatewaysResult class]];
}

- (void) test_AWSEC2DescribeTrunkInterfaceAssociationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeTrunkInterfaceAssociationsRequest class]];
}

- (void) test_AWSEC2DescribeTrunkInterfaceAssociationsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeTrunkInterfaceAssociationsResult class]];
}

- (void) test_AWSEC2DescribeVerifiedAccessEndpointsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVerifiedAccessEndpointsRequest class]];
}

- (void) test_AWSEC2DescribeVerifiedAccessEndpointsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVerifiedAccessEndpointsResult class]];
}

- (void) test_AWSEC2DescribeVerifiedAccessGroupsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVerifiedAccessGroupsRequest class]];
}

- (void) test_AWSEC2DescribeVerifiedAccessGroupsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVerifiedAccessGroupsResult class]];
}

- (void) test_AWSEC2DescribeVerifiedAccessInstanceLoggingConfigurationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVerifiedAccessInstanceLoggingConfigurationsRequest class]];
}

- (void) test_AWSEC2DescribeVerifiedAccessInstanceLoggingConfigurationsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVerifiedAccessInstanceLoggingConfigurationsResult class]];
}

- (void) test_AWSEC2DescribeVerifiedAccessInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVerifiedAccessInstancesRequest class]];
}

- (void) test_AWSEC2DescribeVerifiedAccessInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVerifiedAccessInstancesResult class]];
}

- (void) test_AWSEC2DescribeVerifiedAccessTrustProvidersRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVerifiedAccessTrustProvidersRequest class]];
}

- (void) test_AWSEC2DescribeVerifiedAccessTrustProvidersResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVerifiedAccessTrustProvidersResult class]];
}

- (void) test_AWSEC2DescribeVolumeAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVolumeAttributeRequest class]];
}

- (void) test_AWSEC2DescribeVolumeAttributeResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVolumeAttributeResult class]];
}

- (void) test_AWSEC2DescribeVolumeStatusRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVolumeStatusRequest class]];
}

- (void) test_AWSEC2DescribeVolumeStatusResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVolumeStatusResult class]];
}

- (void) test_AWSEC2DescribeVolumesModificationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVolumesModificationsRequest class]];
}

- (void) test_AWSEC2DescribeVolumesModificationsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVolumesModificationsResult class]];
}

- (void) test_AWSEC2DescribeVolumesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVolumesRequest class]];
}

- (void) test_AWSEC2DescribeVolumesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVolumesResult class]];
}

- (void) test_AWSEC2DescribeVpcAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcAttributeRequest class]];
}

- (void) test_AWSEC2DescribeVpcAttributeResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcAttributeResult class]];
}

- (void) test_AWSEC2DescribeVpcClassicLinkDnsSupportRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcClassicLinkDnsSupportRequest class]];
}

- (void) test_AWSEC2DescribeVpcClassicLinkDnsSupportResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcClassicLinkDnsSupportResult class]];
}

- (void) test_AWSEC2DescribeVpcClassicLinkRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcClassicLinkRequest class]];
}

- (void) test_AWSEC2DescribeVpcClassicLinkResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcClassicLinkResult class]];
}

- (void) test_AWSEC2DescribeVpcEndpointConnectionNotificationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcEndpointConnectionNotificationsRequest class]];
}

- (void) test_AWSEC2DescribeVpcEndpointConnectionNotificationsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcEndpointConnectionNotificationsResult class]];
}

- (void) test_AWSEC2DescribeVpcEndpointConnectionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcEndpointConnectionsRequest class]];
}

- (void) test_AWSEC2DescribeVpcEndpointConnectionsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcEndpointConnectionsResult class]];
}

- (void) test_AWSEC2DescribeVpcEndpointServiceConfigurationsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcEndpointServiceConfigurationsRequest class]];
}

- (void) test_AWSEC2DescribeVpcEndpointServiceConfigurationsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcEndpointServiceConfigurationsResult class]];
}

- (void) test_AWSEC2DescribeVpcEndpointServicePermissionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcEndpointServicePermissionsRequest class]];
}

- (void) test_AWSEC2DescribeVpcEndpointServicePermissionsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcEndpointServicePermissionsResult class]];
}

- (void) test_AWSEC2DescribeVpcEndpointServicesRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcEndpointServicesRequest class]];
}

- (void) test_AWSEC2DescribeVpcEndpointServicesResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcEndpointServicesResult class]];
}

- (void) test_AWSEC2DescribeVpcEndpointsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcEndpointsRequest class]];
}

- (void) test_AWSEC2DescribeVpcEndpointsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcEndpointsResult class]];
}

- (void) test_AWSEC2DescribeVpcPeeringConnectionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcPeeringConnectionsRequest class]];
}

- (void) test_AWSEC2DescribeVpcPeeringConnectionsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcPeeringConnectionsResult class]];
}

- (void) test_AWSEC2DescribeVpcsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcsRequest class]];
}

- (void) test_AWSEC2DescribeVpcsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpcsResult class]];
}

- (void) test_AWSEC2DescribeVpnConnectionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpnConnectionsRequest class]];
}

- (void) test_AWSEC2DescribeVpnConnectionsResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpnConnectionsResult class]];
}

- (void) test_AWSEC2DescribeVpnGatewaysRequest {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpnGatewaysRequest class]];
}

- (void) test_AWSEC2DescribeVpnGatewaysResult {
    [self validateSecureCodingForClass:[AWSEC2DescribeVpnGatewaysResult class]];
}

- (void) test_AWSEC2DestinationOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2DestinationOptionsRequest class]];
}

- (void) test_AWSEC2DestinationOptionsResponse {
    [self validateSecureCodingForClass:[AWSEC2DestinationOptionsResponse class]];
}

- (void) test_AWSEC2DetachClassicLinkVpcRequest {
    [self validateSecureCodingForClass:[AWSEC2DetachClassicLinkVpcRequest class]];
}

- (void) test_AWSEC2DetachClassicLinkVpcResult {
    [self validateSecureCodingForClass:[AWSEC2DetachClassicLinkVpcResult class]];
}

- (void) test_AWSEC2DetachInternetGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2DetachInternetGatewayRequest class]];
}

- (void) test_AWSEC2DetachNetworkInterfaceRequest {
    [self validateSecureCodingForClass:[AWSEC2DetachNetworkInterfaceRequest class]];
}

- (void) test_AWSEC2DetachVerifiedAccessTrustProviderRequest {
    [self validateSecureCodingForClass:[AWSEC2DetachVerifiedAccessTrustProviderRequest class]];
}

- (void) test_AWSEC2DetachVerifiedAccessTrustProviderResult {
    [self validateSecureCodingForClass:[AWSEC2DetachVerifiedAccessTrustProviderResult class]];
}

- (void) test_AWSEC2DetachVolumeRequest {
    [self validateSecureCodingForClass:[AWSEC2DetachVolumeRequest class]];
}

- (void) test_AWSEC2DetachVpnGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2DetachVpnGatewayRequest class]];
}

- (void) test_AWSEC2DeviceOptions {
    [self validateSecureCodingForClass:[AWSEC2DeviceOptions class]];
}

- (void) test_AWSEC2DhcpConfiguration {
    [self validateSecureCodingForClass:[AWSEC2DhcpConfiguration class]];
}

- (void) test_AWSEC2DhcpOptions {
    [self validateSecureCodingForClass:[AWSEC2DhcpOptions class]];
}

- (void) test_AWSEC2DirectoryServiceAuthentication {
    [self validateSecureCodingForClass:[AWSEC2DirectoryServiceAuthentication class]];
}

- (void) test_AWSEC2DirectoryServiceAuthenticationRequest {
    [self validateSecureCodingForClass:[AWSEC2DirectoryServiceAuthenticationRequest class]];
}

- (void) test_AWSEC2DisableAddressTransferRequest {
    [self validateSecureCodingForClass:[AWSEC2DisableAddressTransferRequest class]];
}

- (void) test_AWSEC2DisableAddressTransferResult {
    [self validateSecureCodingForClass:[AWSEC2DisableAddressTransferResult class]];
}

- (void) test_AWSEC2DisableAwsNetworkPerformanceMetricSubscriptionRequest {
    [self validateSecureCodingForClass:[AWSEC2DisableAwsNetworkPerformanceMetricSubscriptionRequest class]];
}

- (void) test_AWSEC2DisableAwsNetworkPerformanceMetricSubscriptionResult {
    [self validateSecureCodingForClass:[AWSEC2DisableAwsNetworkPerformanceMetricSubscriptionResult class]];
}

- (void) test_AWSEC2DisableEbsEncryptionByDefaultRequest {
    [self validateSecureCodingForClass:[AWSEC2DisableEbsEncryptionByDefaultRequest class]];
}

- (void) test_AWSEC2DisableEbsEncryptionByDefaultResult {
    [self validateSecureCodingForClass:[AWSEC2DisableEbsEncryptionByDefaultResult class]];
}

- (void) test_AWSEC2DisableFastLaunchRequest {
    [self validateSecureCodingForClass:[AWSEC2DisableFastLaunchRequest class]];
}

- (void) test_AWSEC2DisableFastLaunchResult {
    [self validateSecureCodingForClass:[AWSEC2DisableFastLaunchResult class]];
}

- (void) test_AWSEC2DisableFastSnapshotRestoreErrorItem {
    [self validateSecureCodingForClass:[AWSEC2DisableFastSnapshotRestoreErrorItem class]];
}

- (void) test_AWSEC2DisableFastSnapshotRestoreStateError {
    [self validateSecureCodingForClass:[AWSEC2DisableFastSnapshotRestoreStateError class]];
}

- (void) test_AWSEC2DisableFastSnapshotRestoreStateErrorItem {
    [self validateSecureCodingForClass:[AWSEC2DisableFastSnapshotRestoreStateErrorItem class]];
}

- (void) test_AWSEC2DisableFastSnapshotRestoreSuccessItem {
    [self validateSecureCodingForClass:[AWSEC2DisableFastSnapshotRestoreSuccessItem class]];
}

- (void) test_AWSEC2DisableFastSnapshotRestoresRequest {
    [self validateSecureCodingForClass:[AWSEC2DisableFastSnapshotRestoresRequest class]];
}

- (void) test_AWSEC2DisableFastSnapshotRestoresResult {
    [self validateSecureCodingForClass:[AWSEC2DisableFastSnapshotRestoresResult class]];
}

- (void) test_AWSEC2DisableImageDeprecationRequest {
    [self validateSecureCodingForClass:[AWSEC2DisableImageDeprecationRequest class]];
}

- (void) test_AWSEC2DisableImageDeprecationResult {
    [self validateSecureCodingForClass:[AWSEC2DisableImageDeprecationResult class]];
}

- (void) test_AWSEC2DisableIpamOrganizationAdminAccountRequest {
    [self validateSecureCodingForClass:[AWSEC2DisableIpamOrganizationAdminAccountRequest class]];
}

- (void) test_AWSEC2DisableIpamOrganizationAdminAccountResult {
    [self validateSecureCodingForClass:[AWSEC2DisableIpamOrganizationAdminAccountResult class]];
}

- (void) test_AWSEC2DisableSerialConsoleAccessRequest {
    [self validateSecureCodingForClass:[AWSEC2DisableSerialConsoleAccessRequest class]];
}

- (void) test_AWSEC2DisableSerialConsoleAccessResult {
    [self validateSecureCodingForClass:[AWSEC2DisableSerialConsoleAccessResult class]];
}

- (void) test_AWSEC2DisableTransitGatewayRouteTablePropagationRequest {
    [self validateSecureCodingForClass:[AWSEC2DisableTransitGatewayRouteTablePropagationRequest class]];
}

- (void) test_AWSEC2DisableTransitGatewayRouteTablePropagationResult {
    [self validateSecureCodingForClass:[AWSEC2DisableTransitGatewayRouteTablePropagationResult class]];
}

- (void) test_AWSEC2DisableVgwRoutePropagationRequest {
    [self validateSecureCodingForClass:[AWSEC2DisableVgwRoutePropagationRequest class]];
}

- (void) test_AWSEC2DisableVpcClassicLinkDnsSupportRequest {
    [self validateSecureCodingForClass:[AWSEC2DisableVpcClassicLinkDnsSupportRequest class]];
}

- (void) test_AWSEC2DisableVpcClassicLinkDnsSupportResult {
    [self validateSecureCodingForClass:[AWSEC2DisableVpcClassicLinkDnsSupportResult class]];
}

- (void) test_AWSEC2DisableVpcClassicLinkRequest {
    [self validateSecureCodingForClass:[AWSEC2DisableVpcClassicLinkRequest class]];
}

- (void) test_AWSEC2DisableVpcClassicLinkResult {
    [self validateSecureCodingForClass:[AWSEC2DisableVpcClassicLinkResult class]];
}

- (void) test_AWSEC2DisassociateAddressRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateAddressRequest class]];
}

- (void) test_AWSEC2DisassociateClientVpnTargetNetworkRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateClientVpnTargetNetworkRequest class]];
}

- (void) test_AWSEC2DisassociateClientVpnTargetNetworkResult {
    [self validateSecureCodingForClass:[AWSEC2DisassociateClientVpnTargetNetworkResult class]];
}

- (void) test_AWSEC2DisassociateEnclaveCertificateIamRoleRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateEnclaveCertificateIamRoleRequest class]];
}

- (void) test_AWSEC2DisassociateEnclaveCertificateIamRoleResult {
    [self validateSecureCodingForClass:[AWSEC2DisassociateEnclaveCertificateIamRoleResult class]];
}

- (void) test_AWSEC2DisassociateIamInstanceProfileRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateIamInstanceProfileRequest class]];
}

- (void) test_AWSEC2DisassociateIamInstanceProfileResult {
    [self validateSecureCodingForClass:[AWSEC2DisassociateIamInstanceProfileResult class]];
}

- (void) test_AWSEC2DisassociateInstanceEventWindowRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateInstanceEventWindowRequest class]];
}

- (void) test_AWSEC2DisassociateInstanceEventWindowResult {
    [self validateSecureCodingForClass:[AWSEC2DisassociateInstanceEventWindowResult class]];
}

- (void) test_AWSEC2DisassociateIpamResourceDiscoveryRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateIpamResourceDiscoveryRequest class]];
}

- (void) test_AWSEC2DisassociateIpamResourceDiscoveryResult {
    [self validateSecureCodingForClass:[AWSEC2DisassociateIpamResourceDiscoveryResult class]];
}

- (void) test_AWSEC2DisassociateNatGatewayAddressRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateNatGatewayAddressRequest class]];
}

- (void) test_AWSEC2DisassociateNatGatewayAddressResult {
    [self validateSecureCodingForClass:[AWSEC2DisassociateNatGatewayAddressResult class]];
}

- (void) test_AWSEC2DisassociateRouteTableRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateRouteTableRequest class]];
}

- (void) test_AWSEC2DisassociateSubnetCidrBlockRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateSubnetCidrBlockRequest class]];
}

- (void) test_AWSEC2DisassociateSubnetCidrBlockResult {
    [self validateSecureCodingForClass:[AWSEC2DisassociateSubnetCidrBlockResult class]];
}

- (void) test_AWSEC2DisassociateTransitGatewayMulticastDomainRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateTransitGatewayMulticastDomainRequest class]];
}

- (void) test_AWSEC2DisassociateTransitGatewayMulticastDomainResult {
    [self validateSecureCodingForClass:[AWSEC2DisassociateTransitGatewayMulticastDomainResult class]];
}

- (void) test_AWSEC2DisassociateTransitGatewayPolicyTableRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateTransitGatewayPolicyTableRequest class]];
}

- (void) test_AWSEC2DisassociateTransitGatewayPolicyTableResult {
    [self validateSecureCodingForClass:[AWSEC2DisassociateTransitGatewayPolicyTableResult class]];
}

- (void) test_AWSEC2DisassociateTransitGatewayRouteTableRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateTransitGatewayRouteTableRequest class]];
}

- (void) test_AWSEC2DisassociateTransitGatewayRouteTableResult {
    [self validateSecureCodingForClass:[AWSEC2DisassociateTransitGatewayRouteTableResult class]];
}

- (void) test_AWSEC2DisassociateTrunkInterfaceRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateTrunkInterfaceRequest class]];
}

- (void) test_AWSEC2DisassociateTrunkInterfaceResult {
    [self validateSecureCodingForClass:[AWSEC2DisassociateTrunkInterfaceResult class]];
}

- (void) test_AWSEC2DisassociateVpcCidrBlockRequest {
    [self validateSecureCodingForClass:[AWSEC2DisassociateVpcCidrBlockRequest class]];
}

- (void) test_AWSEC2DisassociateVpcCidrBlockResult {
    [self validateSecureCodingForClass:[AWSEC2DisassociateVpcCidrBlockResult class]];
}

- (void) test_AWSEC2DiskImage {
    [self validateSecureCodingForClass:[AWSEC2DiskImage class]];
}

- (void) test_AWSEC2DiskImageDescription {
    [self validateSecureCodingForClass:[AWSEC2DiskImageDescription class]];
}

- (void) test_AWSEC2DiskImageDetail {
    [self validateSecureCodingForClass:[AWSEC2DiskImageDetail class]];
}

- (void) test_AWSEC2DiskImageVolumeDescription {
    [self validateSecureCodingForClass:[AWSEC2DiskImageVolumeDescription class]];
}

- (void) test_AWSEC2DiskInfo {
    [self validateSecureCodingForClass:[AWSEC2DiskInfo class]];
}

- (void) test_AWSEC2DnsEntry {
    [self validateSecureCodingForClass:[AWSEC2DnsEntry class]];
}

- (void) test_AWSEC2DnsOptions {
    [self validateSecureCodingForClass:[AWSEC2DnsOptions class]];
}

- (void) test_AWSEC2DnsOptionsSpecification {
    [self validateSecureCodingForClass:[AWSEC2DnsOptionsSpecification class]];
}

- (void) test_AWSEC2DnsServersOptionsModifyStructure {
    [self validateSecureCodingForClass:[AWSEC2DnsServersOptionsModifyStructure class]];
}

- (void) test_AWSEC2EbsBlockDevice {
    [self validateSecureCodingForClass:[AWSEC2EbsBlockDevice class]];
}

- (void) test_AWSEC2EbsInfo {
    [self validateSecureCodingForClass:[AWSEC2EbsInfo class]];
}

- (void) test_AWSEC2EbsInstanceBlockDevice {
    [self validateSecureCodingForClass:[AWSEC2EbsInstanceBlockDevice class]];
}

- (void) test_AWSEC2EbsInstanceBlockDeviceSpecification {
    [self validateSecureCodingForClass:[AWSEC2EbsInstanceBlockDeviceSpecification class]];
}

- (void) test_AWSEC2EbsOptimizedInfo {
    [self validateSecureCodingForClass:[AWSEC2EbsOptimizedInfo class]];
}

- (void) test_AWSEC2EfaInfo {
    [self validateSecureCodingForClass:[AWSEC2EfaInfo class]];
}

- (void) test_AWSEC2EgressOnlyInternetGateway {
    [self validateSecureCodingForClass:[AWSEC2EgressOnlyInternetGateway class]];
}

- (void) test_AWSEC2ElasticGpuAssociation {
    [self validateSecureCodingForClass:[AWSEC2ElasticGpuAssociation class]];
}

- (void) test_AWSEC2ElasticGpuHealth {
    [self validateSecureCodingForClass:[AWSEC2ElasticGpuHealth class]];
}

- (void) test_AWSEC2ElasticGpuSpecification {
    [self validateSecureCodingForClass:[AWSEC2ElasticGpuSpecification class]];
}

- (void) test_AWSEC2ElasticGpuSpecificationResponse {
    [self validateSecureCodingForClass:[AWSEC2ElasticGpuSpecificationResponse class]];
}

- (void) test_AWSEC2ElasticGpus {
    [self validateSecureCodingForClass:[AWSEC2ElasticGpus class]];
}

- (void) test_AWSEC2ElasticInferenceAccelerator {
    [self validateSecureCodingForClass:[AWSEC2ElasticInferenceAccelerator class]];
}

- (void) test_AWSEC2ElasticInferenceAcceleratorAssociation {
    [self validateSecureCodingForClass:[AWSEC2ElasticInferenceAcceleratorAssociation class]];
}

- (void) test_AWSEC2EnaSrdSpecification {
    [self validateSecureCodingForClass:[AWSEC2EnaSrdSpecification class]];
}

- (void) test_AWSEC2EnaSrdUdpSpecification {
    [self validateSecureCodingForClass:[AWSEC2EnaSrdUdpSpecification class]];
}

- (void) test_AWSEC2EnableAddressTransferRequest {
    [self validateSecureCodingForClass:[AWSEC2EnableAddressTransferRequest class]];
}

- (void) test_AWSEC2EnableAddressTransferResult {
    [self validateSecureCodingForClass:[AWSEC2EnableAddressTransferResult class]];
}

- (void) test_AWSEC2EnableAwsNetworkPerformanceMetricSubscriptionRequest {
    [self validateSecureCodingForClass:[AWSEC2EnableAwsNetworkPerformanceMetricSubscriptionRequest class]];
}

- (void) test_AWSEC2EnableAwsNetworkPerformanceMetricSubscriptionResult {
    [self validateSecureCodingForClass:[AWSEC2EnableAwsNetworkPerformanceMetricSubscriptionResult class]];
}

- (void) test_AWSEC2EnableEbsEncryptionByDefaultRequest {
    [self validateSecureCodingForClass:[AWSEC2EnableEbsEncryptionByDefaultRequest class]];
}

- (void) test_AWSEC2EnableEbsEncryptionByDefaultResult {
    [self validateSecureCodingForClass:[AWSEC2EnableEbsEncryptionByDefaultResult class]];
}

- (void) test_AWSEC2EnableFastLaunchRequest {
    [self validateSecureCodingForClass:[AWSEC2EnableFastLaunchRequest class]];
}

- (void) test_AWSEC2EnableFastLaunchResult {
    [self validateSecureCodingForClass:[AWSEC2EnableFastLaunchResult class]];
}

- (void) test_AWSEC2EnableFastSnapshotRestoreErrorItem {
    [self validateSecureCodingForClass:[AWSEC2EnableFastSnapshotRestoreErrorItem class]];
}

- (void) test_AWSEC2EnableFastSnapshotRestoreStateError {
    [self validateSecureCodingForClass:[AWSEC2EnableFastSnapshotRestoreStateError class]];
}

- (void) test_AWSEC2EnableFastSnapshotRestoreStateErrorItem {
    [self validateSecureCodingForClass:[AWSEC2EnableFastSnapshotRestoreStateErrorItem class]];
}

- (void) test_AWSEC2EnableFastSnapshotRestoreSuccessItem {
    [self validateSecureCodingForClass:[AWSEC2EnableFastSnapshotRestoreSuccessItem class]];
}

- (void) test_AWSEC2EnableFastSnapshotRestoresRequest {
    [self validateSecureCodingForClass:[AWSEC2EnableFastSnapshotRestoresRequest class]];
}

- (void) test_AWSEC2EnableFastSnapshotRestoresResult {
    [self validateSecureCodingForClass:[AWSEC2EnableFastSnapshotRestoresResult class]];
}

- (void) test_AWSEC2EnableImageDeprecationRequest {
    [self validateSecureCodingForClass:[AWSEC2EnableImageDeprecationRequest class]];
}

- (void) test_AWSEC2EnableImageDeprecationResult {
    [self validateSecureCodingForClass:[AWSEC2EnableImageDeprecationResult class]];
}

- (void) test_AWSEC2EnableIpamOrganizationAdminAccountRequest {
    [self validateSecureCodingForClass:[AWSEC2EnableIpamOrganizationAdminAccountRequest class]];
}

- (void) test_AWSEC2EnableIpamOrganizationAdminAccountResult {
    [self validateSecureCodingForClass:[AWSEC2EnableIpamOrganizationAdminAccountResult class]];
}

- (void) test_AWSEC2EnableReachabilityAnalyzerOrganizationSharingRequest {
    [self validateSecureCodingForClass:[AWSEC2EnableReachabilityAnalyzerOrganizationSharingRequest class]];
}

- (void) test_AWSEC2EnableReachabilityAnalyzerOrganizationSharingResult {
    [self validateSecureCodingForClass:[AWSEC2EnableReachabilityAnalyzerOrganizationSharingResult class]];
}

- (void) test_AWSEC2EnableSerialConsoleAccessRequest {
    [self validateSecureCodingForClass:[AWSEC2EnableSerialConsoleAccessRequest class]];
}

- (void) test_AWSEC2EnableSerialConsoleAccessResult {
    [self validateSecureCodingForClass:[AWSEC2EnableSerialConsoleAccessResult class]];
}

- (void) test_AWSEC2EnableTransitGatewayRouteTablePropagationRequest {
    [self validateSecureCodingForClass:[AWSEC2EnableTransitGatewayRouteTablePropagationRequest class]];
}

- (void) test_AWSEC2EnableTransitGatewayRouteTablePropagationResult {
    [self validateSecureCodingForClass:[AWSEC2EnableTransitGatewayRouteTablePropagationResult class]];
}

- (void) test_AWSEC2EnableVgwRoutePropagationRequest {
    [self validateSecureCodingForClass:[AWSEC2EnableVgwRoutePropagationRequest class]];
}

- (void) test_AWSEC2EnableVolumeIORequest {
    [self validateSecureCodingForClass:[AWSEC2EnableVolumeIORequest class]];
}

- (void) test_AWSEC2EnableVpcClassicLinkDnsSupportRequest {
    [self validateSecureCodingForClass:[AWSEC2EnableVpcClassicLinkDnsSupportRequest class]];
}

- (void) test_AWSEC2EnableVpcClassicLinkDnsSupportResult {
    [self validateSecureCodingForClass:[AWSEC2EnableVpcClassicLinkDnsSupportResult class]];
}

- (void) test_AWSEC2EnableVpcClassicLinkRequest {
    [self validateSecureCodingForClass:[AWSEC2EnableVpcClassicLinkRequest class]];
}

- (void) test_AWSEC2EnableVpcClassicLinkResult {
    [self validateSecureCodingForClass:[AWSEC2EnableVpcClassicLinkResult class]];
}

- (void) test_AWSEC2EnclaveOptions {
    [self validateSecureCodingForClass:[AWSEC2EnclaveOptions class]];
}

- (void) test_AWSEC2EnclaveOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2EnclaveOptionsRequest class]];
}

- (void) test_AWSEC2EventInformation {
    [self validateSecureCodingForClass:[AWSEC2EventInformation class]];
}

- (void) test_AWSEC2Explanation {
    [self validateSecureCodingForClass:[AWSEC2Explanation class]];
}

- (void) test_AWSEC2ExportClientVpnClientCertificateRevocationListRequest {
    [self validateSecureCodingForClass:[AWSEC2ExportClientVpnClientCertificateRevocationListRequest class]];
}

- (void) test_AWSEC2ExportClientVpnClientCertificateRevocationListResult {
    [self validateSecureCodingForClass:[AWSEC2ExportClientVpnClientCertificateRevocationListResult class]];
}

- (void) test_AWSEC2ExportClientVpnClientConfigurationRequest {
    [self validateSecureCodingForClass:[AWSEC2ExportClientVpnClientConfigurationRequest class]];
}

- (void) test_AWSEC2ExportClientVpnClientConfigurationResult {
    [self validateSecureCodingForClass:[AWSEC2ExportClientVpnClientConfigurationResult class]];
}

- (void) test_AWSEC2ExportImageRequest {
    [self validateSecureCodingForClass:[AWSEC2ExportImageRequest class]];
}

- (void) test_AWSEC2ExportImageResult {
    [self validateSecureCodingForClass:[AWSEC2ExportImageResult class]];
}

- (void) test_AWSEC2ExportImageTask {
    [self validateSecureCodingForClass:[AWSEC2ExportImageTask class]];
}

- (void) test_AWSEC2ExportTask {
    [self validateSecureCodingForClass:[AWSEC2ExportTask class]];
}

- (void) test_AWSEC2ExportTaskS3Location {
    [self validateSecureCodingForClass:[AWSEC2ExportTaskS3Location class]];
}

- (void) test_AWSEC2ExportTaskS3LocationRequest {
    [self validateSecureCodingForClass:[AWSEC2ExportTaskS3LocationRequest class]];
}

- (void) test_AWSEC2ExportToS3Task {
    [self validateSecureCodingForClass:[AWSEC2ExportToS3Task class]];
}

- (void) test_AWSEC2ExportToS3TaskSpecification {
    [self validateSecureCodingForClass:[AWSEC2ExportToS3TaskSpecification class]];
}

- (void) test_AWSEC2ExportTransitGatewayRoutesRequest {
    [self validateSecureCodingForClass:[AWSEC2ExportTransitGatewayRoutesRequest class]];
}

- (void) test_AWSEC2ExportTransitGatewayRoutesResult {
    [self validateSecureCodingForClass:[AWSEC2ExportTransitGatewayRoutesResult class]];
}

- (void) test_AWSEC2FailedCapacityReservationFleetCancellationResult {
    [self validateSecureCodingForClass:[AWSEC2FailedCapacityReservationFleetCancellationResult class]];
}

- (void) test_AWSEC2FailedQueuedPurchaseDeletion {
    [self validateSecureCodingForClass:[AWSEC2FailedQueuedPurchaseDeletion class]];
}

- (void) test_AWSEC2FastLaunchLaunchTemplateSpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2FastLaunchLaunchTemplateSpecificationRequest class]];
}

- (void) test_AWSEC2FastLaunchLaunchTemplateSpecificationResponse {
    [self validateSecureCodingForClass:[AWSEC2FastLaunchLaunchTemplateSpecificationResponse class]];
}

- (void) test_AWSEC2FastLaunchSnapshotConfigurationRequest {
    [self validateSecureCodingForClass:[AWSEC2FastLaunchSnapshotConfigurationRequest class]];
}

- (void) test_AWSEC2FastLaunchSnapshotConfigurationResponse {
    [self validateSecureCodingForClass:[AWSEC2FastLaunchSnapshotConfigurationResponse class]];
}

- (void) test_AWSEC2FederatedAuthentication {
    [self validateSecureCodingForClass:[AWSEC2FederatedAuthentication class]];
}

- (void) test_AWSEC2FederatedAuthenticationRequest {
    [self validateSecureCodingForClass:[AWSEC2FederatedAuthenticationRequest class]];
}

- (void) test_AWSEC2Filter {
    [self validateSecureCodingForClass:[AWSEC2Filter class]];
}

- (void) test_AWSEC2FilterPortRange {
    [self validateSecureCodingForClass:[AWSEC2FilterPortRange class]];
}

- (void) test_AWSEC2FirewallStatefulRule {
    [self validateSecureCodingForClass:[AWSEC2FirewallStatefulRule class]];
}

- (void) test_AWSEC2FirewallStatelessRule {
    [self validateSecureCodingForClass:[AWSEC2FirewallStatelessRule class]];
}

- (void) test_AWSEC2FleetCapacityReservation {
    [self validateSecureCodingForClass:[AWSEC2FleetCapacityReservation class]];
}

- (void) test_AWSEC2FleetData {
    [self validateSecureCodingForClass:[AWSEC2FleetData class]];
}

- (void) test_AWSEC2FleetLaunchTemplateConfig {
    [self validateSecureCodingForClass:[AWSEC2FleetLaunchTemplateConfig class]];
}

- (void) test_AWSEC2FleetLaunchTemplateConfigRequest {
    [self validateSecureCodingForClass:[AWSEC2FleetLaunchTemplateConfigRequest class]];
}

- (void) test_AWSEC2FleetLaunchTemplateOverrides {
    [self validateSecureCodingForClass:[AWSEC2FleetLaunchTemplateOverrides class]];
}

- (void) test_AWSEC2FleetLaunchTemplateOverridesRequest {
    [self validateSecureCodingForClass:[AWSEC2FleetLaunchTemplateOverridesRequest class]];
}

- (void) test_AWSEC2FleetLaunchTemplateSpecification {
    [self validateSecureCodingForClass:[AWSEC2FleetLaunchTemplateSpecification class]];
}

- (void) test_AWSEC2FleetLaunchTemplateSpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2FleetLaunchTemplateSpecificationRequest class]];
}

- (void) test_AWSEC2FleetSpotCapacityRebalance {
    [self validateSecureCodingForClass:[AWSEC2FleetSpotCapacityRebalance class]];
}

- (void) test_AWSEC2FleetSpotCapacityRebalanceRequest {
    [self validateSecureCodingForClass:[AWSEC2FleetSpotCapacityRebalanceRequest class]];
}

- (void) test_AWSEC2FleetSpotMaintenanceStrategies {
    [self validateSecureCodingForClass:[AWSEC2FleetSpotMaintenanceStrategies class]];
}

- (void) test_AWSEC2FleetSpotMaintenanceStrategiesRequest {
    [self validateSecureCodingForClass:[AWSEC2FleetSpotMaintenanceStrategiesRequest class]];
}

- (void) test_AWSEC2FlowLog {
    [self validateSecureCodingForClass:[AWSEC2FlowLog class]];
}

- (void) test_AWSEC2FpgaDeviceInfo {
    [self validateSecureCodingForClass:[AWSEC2FpgaDeviceInfo class]];
}

- (void) test_AWSEC2FpgaDeviceMemoryInfo {
    [self validateSecureCodingForClass:[AWSEC2FpgaDeviceMemoryInfo class]];
}

- (void) test_AWSEC2FpgaImage {
    [self validateSecureCodingForClass:[AWSEC2FpgaImage class]];
}

- (void) test_AWSEC2FpgaImageAttribute {
    [self validateSecureCodingForClass:[AWSEC2FpgaImageAttribute class]];
}

- (void) test_AWSEC2FpgaImageState {
    [self validateSecureCodingForClass:[AWSEC2FpgaImageState class]];
}

- (void) test_AWSEC2FpgaInfo {
    [self validateSecureCodingForClass:[AWSEC2FpgaInfo class]];
}

- (void) test_AWSEC2GetAssociatedEnclaveCertificateIamRolesRequest {
    [self validateSecureCodingForClass:[AWSEC2GetAssociatedEnclaveCertificateIamRolesRequest class]];
}

- (void) test_AWSEC2GetAssociatedEnclaveCertificateIamRolesResult {
    [self validateSecureCodingForClass:[AWSEC2GetAssociatedEnclaveCertificateIamRolesResult class]];
}

- (void) test_AWSEC2GetAssociatedIpv6PoolCidrsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetAssociatedIpv6PoolCidrsRequest class]];
}

- (void) test_AWSEC2GetAssociatedIpv6PoolCidrsResult {
    [self validateSecureCodingForClass:[AWSEC2GetAssociatedIpv6PoolCidrsResult class]];
}

- (void) test_AWSEC2GetAwsNetworkPerformanceDataRequest {
    [self validateSecureCodingForClass:[AWSEC2GetAwsNetworkPerformanceDataRequest class]];
}

- (void) test_AWSEC2GetAwsNetworkPerformanceDataResult {
    [self validateSecureCodingForClass:[AWSEC2GetAwsNetworkPerformanceDataResult class]];
}

- (void) test_AWSEC2GetCapacityReservationUsageRequest {
    [self validateSecureCodingForClass:[AWSEC2GetCapacityReservationUsageRequest class]];
}

- (void) test_AWSEC2GetCapacityReservationUsageResult {
    [self validateSecureCodingForClass:[AWSEC2GetCapacityReservationUsageResult class]];
}

- (void) test_AWSEC2GetCoipPoolUsageRequest {
    [self validateSecureCodingForClass:[AWSEC2GetCoipPoolUsageRequest class]];
}

- (void) test_AWSEC2GetCoipPoolUsageResult {
    [self validateSecureCodingForClass:[AWSEC2GetCoipPoolUsageResult class]];
}

- (void) test_AWSEC2GetConsoleOutputRequest {
    [self validateSecureCodingForClass:[AWSEC2GetConsoleOutputRequest class]];
}

- (void) test_AWSEC2GetConsoleOutputResult {
    [self validateSecureCodingForClass:[AWSEC2GetConsoleOutputResult class]];
}

- (void) test_AWSEC2GetConsoleScreenshotRequest {
    [self validateSecureCodingForClass:[AWSEC2GetConsoleScreenshotRequest class]];
}

- (void) test_AWSEC2GetConsoleScreenshotResult {
    [self validateSecureCodingForClass:[AWSEC2GetConsoleScreenshotResult class]];
}

- (void) test_AWSEC2GetDefaultCreditSpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2GetDefaultCreditSpecificationRequest class]];
}

- (void) test_AWSEC2GetDefaultCreditSpecificationResult {
    [self validateSecureCodingForClass:[AWSEC2GetDefaultCreditSpecificationResult class]];
}

- (void) test_AWSEC2GetEbsDefaultKmsKeyIdRequest {
    [self validateSecureCodingForClass:[AWSEC2GetEbsDefaultKmsKeyIdRequest class]];
}

- (void) test_AWSEC2GetEbsDefaultKmsKeyIdResult {
    [self validateSecureCodingForClass:[AWSEC2GetEbsDefaultKmsKeyIdResult class]];
}

- (void) test_AWSEC2GetEbsEncryptionByDefaultRequest {
    [self validateSecureCodingForClass:[AWSEC2GetEbsEncryptionByDefaultRequest class]];
}

- (void) test_AWSEC2GetEbsEncryptionByDefaultResult {
    [self validateSecureCodingForClass:[AWSEC2GetEbsEncryptionByDefaultResult class]];
}

- (void) test_AWSEC2GetFlowLogsIntegrationTemplateRequest {
    [self validateSecureCodingForClass:[AWSEC2GetFlowLogsIntegrationTemplateRequest class]];
}

- (void) test_AWSEC2GetFlowLogsIntegrationTemplateResult {
    [self validateSecureCodingForClass:[AWSEC2GetFlowLogsIntegrationTemplateResult class]];
}

- (void) test_AWSEC2GetGroupsForCapacityReservationRequest {
    [self validateSecureCodingForClass:[AWSEC2GetGroupsForCapacityReservationRequest class]];
}

- (void) test_AWSEC2GetGroupsForCapacityReservationResult {
    [self validateSecureCodingForClass:[AWSEC2GetGroupsForCapacityReservationResult class]];
}

- (void) test_AWSEC2GetHostReservationPurchasePreviewRequest {
    [self validateSecureCodingForClass:[AWSEC2GetHostReservationPurchasePreviewRequest class]];
}

- (void) test_AWSEC2GetHostReservationPurchasePreviewResult {
    [self validateSecureCodingForClass:[AWSEC2GetHostReservationPurchasePreviewResult class]];
}

- (void) test_AWSEC2GetInstanceTypesFromInstanceRequirementsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetInstanceTypesFromInstanceRequirementsRequest class]];
}

- (void) test_AWSEC2GetInstanceTypesFromInstanceRequirementsResult {
    [self validateSecureCodingForClass:[AWSEC2GetInstanceTypesFromInstanceRequirementsResult class]];
}

- (void) test_AWSEC2GetInstanceUefiDataRequest {
    [self validateSecureCodingForClass:[AWSEC2GetInstanceUefiDataRequest class]];
}

- (void) test_AWSEC2GetInstanceUefiDataResult {
    [self validateSecureCodingForClass:[AWSEC2GetInstanceUefiDataResult class]];
}

- (void) test_AWSEC2GetIpamAddressHistoryRequest {
    [self validateSecureCodingForClass:[AWSEC2GetIpamAddressHistoryRequest class]];
}

- (void) test_AWSEC2GetIpamAddressHistoryResult {
    [self validateSecureCodingForClass:[AWSEC2GetIpamAddressHistoryResult class]];
}

- (void) test_AWSEC2GetIpamDiscoveredAccountsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetIpamDiscoveredAccountsRequest class]];
}

- (void) test_AWSEC2GetIpamDiscoveredAccountsResult {
    [self validateSecureCodingForClass:[AWSEC2GetIpamDiscoveredAccountsResult class]];
}

- (void) test_AWSEC2GetIpamDiscoveredResourceCidrsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetIpamDiscoveredResourceCidrsRequest class]];
}

- (void) test_AWSEC2GetIpamDiscoveredResourceCidrsResult {
    [self validateSecureCodingForClass:[AWSEC2GetIpamDiscoveredResourceCidrsResult class]];
}

- (void) test_AWSEC2GetIpamPoolAllocationsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetIpamPoolAllocationsRequest class]];
}

- (void) test_AWSEC2GetIpamPoolAllocationsResult {
    [self validateSecureCodingForClass:[AWSEC2GetIpamPoolAllocationsResult class]];
}

- (void) test_AWSEC2GetIpamPoolCidrsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetIpamPoolCidrsRequest class]];
}

- (void) test_AWSEC2GetIpamPoolCidrsResult {
    [self validateSecureCodingForClass:[AWSEC2GetIpamPoolCidrsResult class]];
}

- (void) test_AWSEC2GetIpamResourceCidrsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetIpamResourceCidrsRequest class]];
}

- (void) test_AWSEC2GetIpamResourceCidrsResult {
    [self validateSecureCodingForClass:[AWSEC2GetIpamResourceCidrsResult class]];
}

- (void) test_AWSEC2GetLaunchTemplateDataRequest {
    [self validateSecureCodingForClass:[AWSEC2GetLaunchTemplateDataRequest class]];
}

- (void) test_AWSEC2GetLaunchTemplateDataResult {
    [self validateSecureCodingForClass:[AWSEC2GetLaunchTemplateDataResult class]];
}

- (void) test_AWSEC2GetManagedPrefixListAssociationsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetManagedPrefixListAssociationsRequest class]];
}

- (void) test_AWSEC2GetManagedPrefixListAssociationsResult {
    [self validateSecureCodingForClass:[AWSEC2GetManagedPrefixListAssociationsResult class]];
}

- (void) test_AWSEC2GetManagedPrefixListEntriesRequest {
    [self validateSecureCodingForClass:[AWSEC2GetManagedPrefixListEntriesRequest class]];
}

- (void) test_AWSEC2GetManagedPrefixListEntriesResult {
    [self validateSecureCodingForClass:[AWSEC2GetManagedPrefixListEntriesResult class]];
}

- (void) test_AWSEC2GetNetworkInsightsAccessScopeAnalysisFindingsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetNetworkInsightsAccessScopeAnalysisFindingsRequest class]];
}

- (void) test_AWSEC2GetNetworkInsightsAccessScopeAnalysisFindingsResult {
    [self validateSecureCodingForClass:[AWSEC2GetNetworkInsightsAccessScopeAnalysisFindingsResult class]];
}

- (void) test_AWSEC2GetNetworkInsightsAccessScopeContentRequest {
    [self validateSecureCodingForClass:[AWSEC2GetNetworkInsightsAccessScopeContentRequest class]];
}

- (void) test_AWSEC2GetNetworkInsightsAccessScopeContentResult {
    [self validateSecureCodingForClass:[AWSEC2GetNetworkInsightsAccessScopeContentResult class]];
}

- (void) test_AWSEC2GetPasswordDataRequest {
    [self validateSecureCodingForClass:[AWSEC2GetPasswordDataRequest class]];
}

- (void) test_AWSEC2GetPasswordDataResult {
    [self validateSecureCodingForClass:[AWSEC2GetPasswordDataResult class]];
}

- (void) test_AWSEC2GetReservedInstancesExchangeQuoteRequest {
    [self validateSecureCodingForClass:[AWSEC2GetReservedInstancesExchangeQuoteRequest class]];
}

- (void) test_AWSEC2GetReservedInstancesExchangeQuoteResult {
    [self validateSecureCodingForClass:[AWSEC2GetReservedInstancesExchangeQuoteResult class]];
}

- (void) test_AWSEC2GetSerialConsoleAccessStatusRequest {
    [self validateSecureCodingForClass:[AWSEC2GetSerialConsoleAccessStatusRequest class]];
}

- (void) test_AWSEC2GetSerialConsoleAccessStatusResult {
    [self validateSecureCodingForClass:[AWSEC2GetSerialConsoleAccessStatusResult class]];
}

- (void) test_AWSEC2GetSpotPlacementScoresRequest {
    [self validateSecureCodingForClass:[AWSEC2GetSpotPlacementScoresRequest class]];
}

- (void) test_AWSEC2GetSpotPlacementScoresResult {
    [self validateSecureCodingForClass:[AWSEC2GetSpotPlacementScoresResult class]];
}

- (void) test_AWSEC2GetSubnetCidrReservationsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetSubnetCidrReservationsRequest class]];
}

- (void) test_AWSEC2GetSubnetCidrReservationsResult {
    [self validateSecureCodingForClass:[AWSEC2GetSubnetCidrReservationsResult class]];
}

- (void) test_AWSEC2GetTransitGatewayAttachmentPropagationsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayAttachmentPropagationsRequest class]];
}

- (void) test_AWSEC2GetTransitGatewayAttachmentPropagationsResult {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayAttachmentPropagationsResult class]];
}

- (void) test_AWSEC2GetTransitGatewayMulticastDomainAssociationsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayMulticastDomainAssociationsRequest class]];
}

- (void) test_AWSEC2GetTransitGatewayMulticastDomainAssociationsResult {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayMulticastDomainAssociationsResult class]];
}

- (void) test_AWSEC2GetTransitGatewayPolicyTableAssociationsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayPolicyTableAssociationsRequest class]];
}

- (void) test_AWSEC2GetTransitGatewayPolicyTableAssociationsResult {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayPolicyTableAssociationsResult class]];
}

- (void) test_AWSEC2GetTransitGatewayPolicyTableEntriesRequest {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayPolicyTableEntriesRequest class]];
}

- (void) test_AWSEC2GetTransitGatewayPolicyTableEntriesResult {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayPolicyTableEntriesResult class]];
}

- (void) test_AWSEC2GetTransitGatewayPrefixListReferencesRequest {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayPrefixListReferencesRequest class]];
}

- (void) test_AWSEC2GetTransitGatewayPrefixListReferencesResult {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayPrefixListReferencesResult class]];
}

- (void) test_AWSEC2GetTransitGatewayRouteTableAssociationsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayRouteTableAssociationsRequest class]];
}

- (void) test_AWSEC2GetTransitGatewayRouteTableAssociationsResult {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayRouteTableAssociationsResult class]];
}

- (void) test_AWSEC2GetTransitGatewayRouteTablePropagationsRequest {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayRouteTablePropagationsRequest class]];
}

- (void) test_AWSEC2GetTransitGatewayRouteTablePropagationsResult {
    [self validateSecureCodingForClass:[AWSEC2GetTransitGatewayRouteTablePropagationsResult class]];
}

- (void) test_AWSEC2GetVerifiedAccessEndpointPolicyRequest {
    [self validateSecureCodingForClass:[AWSEC2GetVerifiedAccessEndpointPolicyRequest class]];
}

- (void) test_AWSEC2GetVerifiedAccessEndpointPolicyResult {
    [self validateSecureCodingForClass:[AWSEC2GetVerifiedAccessEndpointPolicyResult class]];
}

- (void) test_AWSEC2GetVerifiedAccessGroupPolicyRequest {
    [self validateSecureCodingForClass:[AWSEC2GetVerifiedAccessGroupPolicyRequest class]];
}

- (void) test_AWSEC2GetVerifiedAccessGroupPolicyResult {
    [self validateSecureCodingForClass:[AWSEC2GetVerifiedAccessGroupPolicyResult class]];
}

- (void) test_AWSEC2GetVpnConnectionDeviceSampleConfigurationRequest {
    [self validateSecureCodingForClass:[AWSEC2GetVpnConnectionDeviceSampleConfigurationRequest class]];
}

- (void) test_AWSEC2GetVpnConnectionDeviceSampleConfigurationResult {
    [self validateSecureCodingForClass:[AWSEC2GetVpnConnectionDeviceSampleConfigurationResult class]];
}

- (void) test_AWSEC2GetVpnConnectionDeviceTypesRequest {
    [self validateSecureCodingForClass:[AWSEC2GetVpnConnectionDeviceTypesRequest class]];
}

- (void) test_AWSEC2GetVpnConnectionDeviceTypesResult {
    [self validateSecureCodingForClass:[AWSEC2GetVpnConnectionDeviceTypesResult class]];
}

- (void) test_AWSEC2GetVpnTunnelReplacementStatusRequest {
    [self validateSecureCodingForClass:[AWSEC2GetVpnTunnelReplacementStatusRequest class]];
}

- (void) test_AWSEC2GetVpnTunnelReplacementStatusResult {
    [self validateSecureCodingForClass:[AWSEC2GetVpnTunnelReplacementStatusResult class]];
}

- (void) test_AWSEC2GpuDeviceInfo {
    [self validateSecureCodingForClass:[AWSEC2GpuDeviceInfo class]];
}

- (void) test_AWSEC2GpuDeviceMemoryInfo {
    [self validateSecureCodingForClass:[AWSEC2GpuDeviceMemoryInfo class]];
}

- (void) test_AWSEC2GpuInfo {
    [self validateSecureCodingForClass:[AWSEC2GpuInfo class]];
}

- (void) test_AWSEC2GroupIdentifier {
    [self validateSecureCodingForClass:[AWSEC2GroupIdentifier class]];
}

- (void) test_AWSEC2HibernationOptions {
    [self validateSecureCodingForClass:[AWSEC2HibernationOptions class]];
}

- (void) test_AWSEC2HibernationOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2HibernationOptionsRequest class]];
}

- (void) test_AWSEC2HistoryRecord {
    [self validateSecureCodingForClass:[AWSEC2HistoryRecord class]];
}

- (void) test_AWSEC2HistoryRecordEntry {
    [self validateSecureCodingForClass:[AWSEC2HistoryRecordEntry class]];
}

- (void) test_AWSEC2Host {
    [self validateSecureCodingForClass:[AWSEC2Host class]];
}

- (void) test_AWSEC2HostInstance {
    [self validateSecureCodingForClass:[AWSEC2HostInstance class]];
}

- (void) test_AWSEC2HostOffering {
    [self validateSecureCodingForClass:[AWSEC2HostOffering class]];
}

- (void) test_AWSEC2HostProperties {
    [self validateSecureCodingForClass:[AWSEC2HostProperties class]];
}

- (void) test_AWSEC2HostReservation {
    [self validateSecureCodingForClass:[AWSEC2HostReservation class]];
}

- (void) test_AWSEC2IKEVersionsListValue {
    [self validateSecureCodingForClass:[AWSEC2IKEVersionsListValue class]];
}

- (void) test_AWSEC2IKEVersionsRequestListValue {
    [self validateSecureCodingForClass:[AWSEC2IKEVersionsRequestListValue class]];
}

- (void) test_AWSEC2IamInstanceProfile {
    [self validateSecureCodingForClass:[AWSEC2IamInstanceProfile class]];
}

- (void) test_AWSEC2IamInstanceProfileAssociation {
    [self validateSecureCodingForClass:[AWSEC2IamInstanceProfileAssociation class]];
}

- (void) test_AWSEC2IamInstanceProfileSpecification {
    [self validateSecureCodingForClass:[AWSEC2IamInstanceProfileSpecification class]];
}

- (void) test_AWSEC2IcmpTypeCode {
    [self validateSecureCodingForClass:[AWSEC2IcmpTypeCode class]];
}

- (void) test_AWSEC2IdFormat {
    [self validateSecureCodingForClass:[AWSEC2IdFormat class]];
}

- (void) test_AWSEC2Image {
    [self validateSecureCodingForClass:[AWSEC2Image class]];
}

- (void) test_AWSEC2ImageAttribute {
    [self validateSecureCodingForClass:[AWSEC2ImageAttribute class]];
}

- (void) test_AWSEC2ImageDiskContainer {
    [self validateSecureCodingForClass:[AWSEC2ImageDiskContainer class]];
}

- (void) test_AWSEC2ImageRecycleBinInfo {
    [self validateSecureCodingForClass:[AWSEC2ImageRecycleBinInfo class]];
}

- (void) test_AWSEC2ImportClientVpnClientCertificateRevocationListRequest {
    [self validateSecureCodingForClass:[AWSEC2ImportClientVpnClientCertificateRevocationListRequest class]];
}

- (void) test_AWSEC2ImportClientVpnClientCertificateRevocationListResult {
    [self validateSecureCodingForClass:[AWSEC2ImportClientVpnClientCertificateRevocationListResult class]];
}

- (void) test_AWSEC2ImportImageLicenseConfigurationRequest {
    [self validateSecureCodingForClass:[AWSEC2ImportImageLicenseConfigurationRequest class]];
}

- (void) test_AWSEC2ImportImageLicenseConfigurationResponse {
    [self validateSecureCodingForClass:[AWSEC2ImportImageLicenseConfigurationResponse class]];
}

- (void) test_AWSEC2ImportImageRequest {
    [self validateSecureCodingForClass:[AWSEC2ImportImageRequest class]];
}

- (void) test_AWSEC2ImportImageResult {
    [self validateSecureCodingForClass:[AWSEC2ImportImageResult class]];
}

- (void) test_AWSEC2ImportImageTask {
    [self validateSecureCodingForClass:[AWSEC2ImportImageTask class]];
}

- (void) test_AWSEC2ImportInstanceLaunchSpecification {
    [self validateSecureCodingForClass:[AWSEC2ImportInstanceLaunchSpecification class]];
}

- (void) test_AWSEC2ImportInstanceRequest {
    [self validateSecureCodingForClass:[AWSEC2ImportInstanceRequest class]];
}

- (void) test_AWSEC2ImportInstanceResult {
    [self validateSecureCodingForClass:[AWSEC2ImportInstanceResult class]];
}

- (void) test_AWSEC2ImportInstanceTaskDetails {
    [self validateSecureCodingForClass:[AWSEC2ImportInstanceTaskDetails class]];
}

- (void) test_AWSEC2ImportInstanceVolumeDetailItem {
    [self validateSecureCodingForClass:[AWSEC2ImportInstanceVolumeDetailItem class]];
}

- (void) test_AWSEC2ImportKeyPairRequest {
    [self validateSecureCodingForClass:[AWSEC2ImportKeyPairRequest class]];
}

- (void) test_AWSEC2ImportKeyPairResult {
    [self validateSecureCodingForClass:[AWSEC2ImportKeyPairResult class]];
}

- (void) test_AWSEC2ImportSnapshotRequest {
    [self validateSecureCodingForClass:[AWSEC2ImportSnapshotRequest class]];
}

- (void) test_AWSEC2ImportSnapshotResult {
    [self validateSecureCodingForClass:[AWSEC2ImportSnapshotResult class]];
}

- (void) test_AWSEC2ImportSnapshotTask {
    [self validateSecureCodingForClass:[AWSEC2ImportSnapshotTask class]];
}

- (void) test_AWSEC2ImportVolumeRequest {
    [self validateSecureCodingForClass:[AWSEC2ImportVolumeRequest class]];
}

- (void) test_AWSEC2ImportVolumeResult {
    [self validateSecureCodingForClass:[AWSEC2ImportVolumeResult class]];
}

- (void) test_AWSEC2ImportVolumeTaskDetails {
    [self validateSecureCodingForClass:[AWSEC2ImportVolumeTaskDetails class]];
}

- (void) test_AWSEC2InferenceAcceleratorInfo {
    [self validateSecureCodingForClass:[AWSEC2InferenceAcceleratorInfo class]];
}

- (void) test_AWSEC2InferenceDeviceInfo {
    [self validateSecureCodingForClass:[AWSEC2InferenceDeviceInfo class]];
}

- (void) test_AWSEC2Instance {
    [self validateSecureCodingForClass:[AWSEC2Instance class]];
}

- (void) test_AWSEC2InstanceAttribute {
    [self validateSecureCodingForClass:[AWSEC2InstanceAttribute class]];
}

- (void) test_AWSEC2InstanceBlockDeviceMapping {
    [self validateSecureCodingForClass:[AWSEC2InstanceBlockDeviceMapping class]];
}

- (void) test_AWSEC2InstanceBlockDeviceMappingSpecification {
    [self validateSecureCodingForClass:[AWSEC2InstanceBlockDeviceMappingSpecification class]];
}

- (void) test_AWSEC2InstanceCapacity {
    [self validateSecureCodingForClass:[AWSEC2InstanceCapacity class]];
}

- (void) test_AWSEC2InstanceCount {
    [self validateSecureCodingForClass:[AWSEC2InstanceCount class]];
}

- (void) test_AWSEC2InstanceCreditSpecification {
    [self validateSecureCodingForClass:[AWSEC2InstanceCreditSpecification class]];
}

- (void) test_AWSEC2InstanceCreditSpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2InstanceCreditSpecificationRequest class]];
}

- (void) test_AWSEC2InstanceEventWindow {
    [self validateSecureCodingForClass:[AWSEC2InstanceEventWindow class]];
}

- (void) test_AWSEC2InstanceEventWindowAssociationRequest {
    [self validateSecureCodingForClass:[AWSEC2InstanceEventWindowAssociationRequest class]];
}

- (void) test_AWSEC2InstanceEventWindowAssociationTarget {
    [self validateSecureCodingForClass:[AWSEC2InstanceEventWindowAssociationTarget class]];
}

- (void) test_AWSEC2InstanceEventWindowDisassociationRequest {
    [self validateSecureCodingForClass:[AWSEC2InstanceEventWindowDisassociationRequest class]];
}

- (void) test_AWSEC2InstanceEventWindowStateChange {
    [self validateSecureCodingForClass:[AWSEC2InstanceEventWindowStateChange class]];
}

- (void) test_AWSEC2InstanceEventWindowTimeRange {
    [self validateSecureCodingForClass:[AWSEC2InstanceEventWindowTimeRange class]];
}

- (void) test_AWSEC2InstanceEventWindowTimeRangeRequest {
    [self validateSecureCodingForClass:[AWSEC2InstanceEventWindowTimeRangeRequest class]];
}

- (void) test_AWSEC2InstanceExportDetails {
    [self validateSecureCodingForClass:[AWSEC2InstanceExportDetails class]];
}

- (void) test_AWSEC2InstanceFamilyCreditSpecification {
    [self validateSecureCodingForClass:[AWSEC2InstanceFamilyCreditSpecification class]];
}

- (void) test_AWSEC2InstanceIpv4Prefix {
    [self validateSecureCodingForClass:[AWSEC2InstanceIpv4Prefix class]];
}

- (void) test_AWSEC2InstanceIpv6Address {
    [self validateSecureCodingForClass:[AWSEC2InstanceIpv6Address class]];
}

- (void) test_AWSEC2InstanceIpv6AddressRequest {
    [self validateSecureCodingForClass:[AWSEC2InstanceIpv6AddressRequest class]];
}

- (void) test_AWSEC2InstanceIpv6Prefix {
    [self validateSecureCodingForClass:[AWSEC2InstanceIpv6Prefix class]];
}

- (void) test_AWSEC2InstanceMaintenanceOptions {
    [self validateSecureCodingForClass:[AWSEC2InstanceMaintenanceOptions class]];
}

- (void) test_AWSEC2InstanceMaintenanceOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2InstanceMaintenanceOptionsRequest class]];
}

- (void) test_AWSEC2InstanceMarketOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2InstanceMarketOptionsRequest class]];
}

- (void) test_AWSEC2InstanceMetadataOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2InstanceMetadataOptionsRequest class]];
}

- (void) test_AWSEC2InstanceMetadataOptionsResponse {
    [self validateSecureCodingForClass:[AWSEC2InstanceMetadataOptionsResponse class]];
}

- (void) test_AWSEC2InstanceMonitoring {
    [self validateSecureCodingForClass:[AWSEC2InstanceMonitoring class]];
}

- (void) test_AWSEC2InstanceNetworkInterface {
    [self validateSecureCodingForClass:[AWSEC2InstanceNetworkInterface class]];
}

- (void) test_AWSEC2InstanceNetworkInterfaceAssociation {
    [self validateSecureCodingForClass:[AWSEC2InstanceNetworkInterfaceAssociation class]];
}

- (void) test_AWSEC2InstanceNetworkInterfaceAttachment {
    [self validateSecureCodingForClass:[AWSEC2InstanceNetworkInterfaceAttachment class]];
}

- (void) test_AWSEC2InstanceNetworkInterfaceSpecification {
    [self validateSecureCodingForClass:[AWSEC2InstanceNetworkInterfaceSpecification class]];
}

- (void) test_AWSEC2InstancePrivateIpAddress {
    [self validateSecureCodingForClass:[AWSEC2InstancePrivateIpAddress class]];
}

- (void) test_AWSEC2InstanceRequirements {
    [self validateSecureCodingForClass:[AWSEC2InstanceRequirements class]];
}

- (void) test_AWSEC2InstanceRequirementsRequest {
    [self validateSecureCodingForClass:[AWSEC2InstanceRequirementsRequest class]];
}

- (void) test_AWSEC2InstanceRequirementsWithMetadataRequest {
    [self validateSecureCodingForClass:[AWSEC2InstanceRequirementsWithMetadataRequest class]];
}

- (void) test_AWSEC2InstanceSpecification {
    [self validateSecureCodingForClass:[AWSEC2InstanceSpecification class]];
}

- (void) test_AWSEC2InstanceState {
    [self validateSecureCodingForClass:[AWSEC2InstanceState class]];
}

- (void) test_AWSEC2InstanceStateChange {
    [self validateSecureCodingForClass:[AWSEC2InstanceStateChange class]];
}

- (void) test_AWSEC2InstanceStatus {
    [self validateSecureCodingForClass:[AWSEC2InstanceStatus class]];
}

- (void) test_AWSEC2InstanceStatusDetails {
    [self validateSecureCodingForClass:[AWSEC2InstanceStatusDetails class]];
}

- (void) test_AWSEC2InstanceStatusEvent {
    [self validateSecureCodingForClass:[AWSEC2InstanceStatusEvent class]];
}

- (void) test_AWSEC2InstanceStatusSummary {
    [self validateSecureCodingForClass:[AWSEC2InstanceStatusSummary class]];
}

- (void) test_AWSEC2InstanceStorageInfo {
    [self validateSecureCodingForClass:[AWSEC2InstanceStorageInfo class]];
}

- (void) test_AWSEC2InstanceTagNotificationAttribute {
    [self validateSecureCodingForClass:[AWSEC2InstanceTagNotificationAttribute class]];
}

- (void) test_AWSEC2InstanceTypeInfo {
    [self validateSecureCodingForClass:[AWSEC2InstanceTypeInfo class]];
}

- (void) test_AWSEC2InstanceTypeInfoFromInstanceRequirements {
    [self validateSecureCodingForClass:[AWSEC2InstanceTypeInfoFromInstanceRequirements class]];
}

- (void) test_AWSEC2InstanceTypeOffering {
    [self validateSecureCodingForClass:[AWSEC2InstanceTypeOffering class]];
}

- (void) test_AWSEC2InstanceUsage {
    [self validateSecureCodingForClass:[AWSEC2InstanceUsage class]];
}

- (void) test_AWSEC2IntegrateServices {
    [self validateSecureCodingForClass:[AWSEC2IntegrateServices class]];
}

- (void) test_AWSEC2InternetGateway {
    [self validateSecureCodingForClass:[AWSEC2InternetGateway class]];
}

- (void) test_AWSEC2InternetGatewayAttachment {
    [self validateSecureCodingForClass:[AWSEC2InternetGatewayAttachment class]];
}

- (void) test_AWSEC2IpPermission {
    [self validateSecureCodingForClass:[AWSEC2IpPermission class]];
}

- (void) test_AWSEC2IpRange {
    [self validateSecureCodingForClass:[AWSEC2IpRange class]];
}

- (void) test_AWSEC2Ipam {
    [self validateSecureCodingForClass:[AWSEC2Ipam class]];
}

- (void) test_AWSEC2IpamAddressHistoryRecord {
    [self validateSecureCodingForClass:[AWSEC2IpamAddressHistoryRecord class]];
}

- (void) test_AWSEC2IpamCidrAuthorizationContext {
    [self validateSecureCodingForClass:[AWSEC2IpamCidrAuthorizationContext class]];
}

- (void) test_AWSEC2IpamDiscoveredAccount {
    [self validateSecureCodingForClass:[AWSEC2IpamDiscoveredAccount class]];
}

- (void) test_AWSEC2IpamDiscoveredResourceCidr {
    [self validateSecureCodingForClass:[AWSEC2IpamDiscoveredResourceCidr class]];
}

- (void) test_AWSEC2IpamDiscoveryFailureReason {
    [self validateSecureCodingForClass:[AWSEC2IpamDiscoveryFailureReason class]];
}

- (void) test_AWSEC2IpamOperatingRegion {
    [self validateSecureCodingForClass:[AWSEC2IpamOperatingRegion class]];
}

- (void) test_AWSEC2IpamPool {
    [self validateSecureCodingForClass:[AWSEC2IpamPool class]];
}

- (void) test_AWSEC2IpamPoolAllocation {
    [self validateSecureCodingForClass:[AWSEC2IpamPoolAllocation class]];
}

- (void) test_AWSEC2IpamPoolCidr {
    [self validateSecureCodingForClass:[AWSEC2IpamPoolCidr class]];
}

- (void) test_AWSEC2IpamPoolCidrFailureReason {
    [self validateSecureCodingForClass:[AWSEC2IpamPoolCidrFailureReason class]];
}

- (void) test_AWSEC2IpamResourceCidr {
    [self validateSecureCodingForClass:[AWSEC2IpamResourceCidr class]];
}

- (void) test_AWSEC2IpamResourceDiscovery {
    [self validateSecureCodingForClass:[AWSEC2IpamResourceDiscovery class]];
}

- (void) test_AWSEC2IpamResourceDiscoveryAssociation {
    [self validateSecureCodingForClass:[AWSEC2IpamResourceDiscoveryAssociation class]];
}

- (void) test_AWSEC2IpamResourceTag {
    [self validateSecureCodingForClass:[AWSEC2IpamResourceTag class]];
}

- (void) test_AWSEC2IpamScope {
    [self validateSecureCodingForClass:[AWSEC2IpamScope class]];
}

- (void) test_AWSEC2Ipv4PrefixSpecification {
    [self validateSecureCodingForClass:[AWSEC2Ipv4PrefixSpecification class]];
}

- (void) test_AWSEC2Ipv4PrefixSpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2Ipv4PrefixSpecificationRequest class]];
}

- (void) test_AWSEC2Ipv4PrefixSpecificationResponse {
    [self validateSecureCodingForClass:[AWSEC2Ipv4PrefixSpecificationResponse class]];
}

- (void) test_AWSEC2Ipv6CidrAssociation {
    [self validateSecureCodingForClass:[AWSEC2Ipv6CidrAssociation class]];
}

- (void) test_AWSEC2Ipv6CidrBlock {
    [self validateSecureCodingForClass:[AWSEC2Ipv6CidrBlock class]];
}

- (void) test_AWSEC2Ipv6Pool {
    [self validateSecureCodingForClass:[AWSEC2Ipv6Pool class]];
}

- (void) test_AWSEC2Ipv6PrefixSpecification {
    [self validateSecureCodingForClass:[AWSEC2Ipv6PrefixSpecification class]];
}

- (void) test_AWSEC2Ipv6PrefixSpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2Ipv6PrefixSpecificationRequest class]];
}

- (void) test_AWSEC2Ipv6PrefixSpecificationResponse {
    [self validateSecureCodingForClass:[AWSEC2Ipv6PrefixSpecificationResponse class]];
}

- (void) test_AWSEC2Ipv6Range {
    [self validateSecureCodingForClass:[AWSEC2Ipv6Range class]];
}

- (void) test_AWSEC2KeyPair {
    [self validateSecureCodingForClass:[AWSEC2KeyPair class]];
}

- (void) test_AWSEC2KeyPairInfo {
    [self validateSecureCodingForClass:[AWSEC2KeyPairInfo class]];
}

- (void) test_AWSEC2LastError {
    [self validateSecureCodingForClass:[AWSEC2LastError class]];
}

- (void) test_AWSEC2LaunchPermission {
    [self validateSecureCodingForClass:[AWSEC2LaunchPermission class]];
}

- (void) test_AWSEC2LaunchPermissionModifications {
    [self validateSecureCodingForClass:[AWSEC2LaunchPermissionModifications class]];
}

- (void) test_AWSEC2LaunchSpecification {
    [self validateSecureCodingForClass:[AWSEC2LaunchSpecification class]];
}

- (void) test_AWSEC2LaunchTemplate {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplate class]];
}

- (void) test_AWSEC2LaunchTemplateAndOverridesResponse {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateAndOverridesResponse class]];
}

- (void) test_AWSEC2LaunchTemplateBlockDeviceMapping {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateBlockDeviceMapping class]];
}

- (void) test_AWSEC2LaunchTemplateBlockDeviceMappingRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateBlockDeviceMappingRequest class]];
}

- (void) test_AWSEC2LaunchTemplateCapacityReservationSpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateCapacityReservationSpecificationRequest class]];
}

- (void) test_AWSEC2LaunchTemplateCapacityReservationSpecificationResponse {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateCapacityReservationSpecificationResponse class]];
}

- (void) test_AWSEC2LaunchTemplateConfig {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateConfig class]];
}

- (void) test_AWSEC2LaunchTemplateCpuOptions {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateCpuOptions class]];
}

- (void) test_AWSEC2LaunchTemplateCpuOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateCpuOptionsRequest class]];
}

- (void) test_AWSEC2LaunchTemplateEbsBlockDevice {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateEbsBlockDevice class]];
}

- (void) test_AWSEC2LaunchTemplateEbsBlockDeviceRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateEbsBlockDeviceRequest class]];
}

- (void) test_AWSEC2LaunchTemplateElasticInferenceAccelerator {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateElasticInferenceAccelerator class]];
}

- (void) test_AWSEC2LaunchTemplateElasticInferenceAcceleratorResponse {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateElasticInferenceAcceleratorResponse class]];
}

- (void) test_AWSEC2LaunchTemplateEnclaveOptions {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateEnclaveOptions class]];
}

- (void) test_AWSEC2LaunchTemplateEnclaveOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateEnclaveOptionsRequest class]];
}

- (void) test_AWSEC2LaunchTemplateHibernationOptions {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateHibernationOptions class]];
}

- (void) test_AWSEC2LaunchTemplateHibernationOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateHibernationOptionsRequest class]];
}

- (void) test_AWSEC2LaunchTemplateIamInstanceProfileSpecification {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateIamInstanceProfileSpecification class]];
}

- (void) test_AWSEC2LaunchTemplateIamInstanceProfileSpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateIamInstanceProfileSpecificationRequest class]];
}

- (void) test_AWSEC2LaunchTemplateInstanceMaintenanceOptions {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateInstanceMaintenanceOptions class]];
}

- (void) test_AWSEC2LaunchTemplateInstanceMaintenanceOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateInstanceMaintenanceOptionsRequest class]];
}

- (void) test_AWSEC2LaunchTemplateInstanceMarketOptions {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateInstanceMarketOptions class]];
}

- (void) test_AWSEC2LaunchTemplateInstanceMarketOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateInstanceMarketOptionsRequest class]];
}

- (void) test_AWSEC2LaunchTemplateInstanceMetadataOptions {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateInstanceMetadataOptions class]];
}

- (void) test_AWSEC2LaunchTemplateInstanceMetadataOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateInstanceMetadataOptionsRequest class]];
}

- (void) test_AWSEC2LaunchTemplateInstanceNetworkInterfaceSpecification {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateInstanceNetworkInterfaceSpecification class]];
}

- (void) test_AWSEC2LaunchTemplateInstanceNetworkInterfaceSpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateInstanceNetworkInterfaceSpecificationRequest class]];
}

- (void) test_AWSEC2LaunchTemplateLicenseConfiguration {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateLicenseConfiguration class]];
}

- (void) test_AWSEC2LaunchTemplateLicenseConfigurationRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateLicenseConfigurationRequest class]];
}

- (void) test_AWSEC2LaunchTemplateOverrides {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateOverrides class]];
}

- (void) test_AWSEC2LaunchTemplatePlacement {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplatePlacement class]];
}

- (void) test_AWSEC2LaunchTemplatePlacementRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplatePlacementRequest class]];
}

- (void) test_AWSEC2LaunchTemplatePrivateDnsNameOptions {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplatePrivateDnsNameOptions class]];
}

- (void) test_AWSEC2LaunchTemplatePrivateDnsNameOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplatePrivateDnsNameOptionsRequest class]];
}

- (void) test_AWSEC2LaunchTemplateSpecification {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateSpecification class]];
}

- (void) test_AWSEC2LaunchTemplateSpotMarketOptions {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateSpotMarketOptions class]];
}

- (void) test_AWSEC2LaunchTemplateSpotMarketOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateSpotMarketOptionsRequest class]];
}

- (void) test_AWSEC2LaunchTemplateTagSpecification {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateTagSpecification class]];
}

- (void) test_AWSEC2LaunchTemplateTagSpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateTagSpecificationRequest class]];
}

- (void) test_AWSEC2LaunchTemplateVersion {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplateVersion class]];
}

- (void) test_AWSEC2LaunchTemplatesMonitoring {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplatesMonitoring class]];
}

- (void) test_AWSEC2LaunchTemplatesMonitoringRequest {
    [self validateSecureCodingForClass:[AWSEC2LaunchTemplatesMonitoringRequest class]];
}

- (void) test_AWSEC2LicenseConfiguration {
    [self validateSecureCodingForClass:[AWSEC2LicenseConfiguration class]];
}

- (void) test_AWSEC2LicenseConfigurationRequest {
    [self validateSecureCodingForClass:[AWSEC2LicenseConfigurationRequest class]];
}

- (void) test_AWSEC2ListImagesInRecycleBinRequest {
    [self validateSecureCodingForClass:[AWSEC2ListImagesInRecycleBinRequest class]];
}

- (void) test_AWSEC2ListImagesInRecycleBinResult {
    [self validateSecureCodingForClass:[AWSEC2ListImagesInRecycleBinResult class]];
}

- (void) test_AWSEC2ListSnapshotsInRecycleBinRequest {
    [self validateSecureCodingForClass:[AWSEC2ListSnapshotsInRecycleBinRequest class]];
}

- (void) test_AWSEC2ListSnapshotsInRecycleBinResult {
    [self validateSecureCodingForClass:[AWSEC2ListSnapshotsInRecycleBinResult class]];
}

- (void) test_AWSEC2LoadBalancersConfig {
    [self validateSecureCodingForClass:[AWSEC2LoadBalancersConfig class]];
}

- (void) test_AWSEC2LoadPermission {
    [self validateSecureCodingForClass:[AWSEC2LoadPermission class]];
}

- (void) test_AWSEC2LoadPermissionModifications {
    [self validateSecureCodingForClass:[AWSEC2LoadPermissionModifications class]];
}

- (void) test_AWSEC2LoadPermissionRequest {
    [self validateSecureCodingForClass:[AWSEC2LoadPermissionRequest class]];
}

- (void) test_AWSEC2LocalGateway {
    [self validateSecureCodingForClass:[AWSEC2LocalGateway class]];
}

- (void) test_AWSEC2LocalGatewayRoute {
    [self validateSecureCodingForClass:[AWSEC2LocalGatewayRoute class]];
}

- (void) test_AWSEC2LocalGatewayRouteTable {
    [self validateSecureCodingForClass:[AWSEC2LocalGatewayRouteTable class]];
}

- (void) test_AWSEC2LocalGatewayRouteTableVirtualInterfaceGroupAssociation {
    [self validateSecureCodingForClass:[AWSEC2LocalGatewayRouteTableVirtualInterfaceGroupAssociation class]];
}

- (void) test_AWSEC2LocalGatewayRouteTableVpcAssociation {
    [self validateSecureCodingForClass:[AWSEC2LocalGatewayRouteTableVpcAssociation class]];
}

- (void) test_AWSEC2LocalGatewayVirtualInterface {
    [self validateSecureCodingForClass:[AWSEC2LocalGatewayVirtualInterface class]];
}

- (void) test_AWSEC2LocalGatewayVirtualInterfaceGroup {
    [self validateSecureCodingForClass:[AWSEC2LocalGatewayVirtualInterfaceGroup class]];
}

- (void) test_AWSEC2MaintenanceDetails {
    [self validateSecureCodingForClass:[AWSEC2MaintenanceDetails class]];
}

- (void) test_AWSEC2ManagedPrefixList {
    [self validateSecureCodingForClass:[AWSEC2ManagedPrefixList class]];
}

- (void) test_AWSEC2MemoryGiBPerVCpu {
    [self validateSecureCodingForClass:[AWSEC2MemoryGiBPerVCpu class]];
}

- (void) test_AWSEC2MemoryGiBPerVCpuRequest {
    [self validateSecureCodingForClass:[AWSEC2MemoryGiBPerVCpuRequest class]];
}

- (void) test_AWSEC2MemoryInfo {
    [self validateSecureCodingForClass:[AWSEC2MemoryInfo class]];
}

- (void) test_AWSEC2MemoryMiB {
    [self validateSecureCodingForClass:[AWSEC2MemoryMiB class]];
}

- (void) test_AWSEC2MemoryMiBRequest {
    [self validateSecureCodingForClass:[AWSEC2MemoryMiBRequest class]];
}

- (void) test_AWSEC2MetricPoint {
    [self validateSecureCodingForClass:[AWSEC2MetricPoint class]];
}

- (void) test_AWSEC2ModifyAddressAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyAddressAttributeRequest class]];
}

- (void) test_AWSEC2ModifyAddressAttributeResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyAddressAttributeResult class]];
}

- (void) test_AWSEC2ModifyAvailabilityZoneGroupRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyAvailabilityZoneGroupRequest class]];
}

- (void) test_AWSEC2ModifyAvailabilityZoneGroupResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyAvailabilityZoneGroupResult class]];
}

- (void) test_AWSEC2ModifyCapacityReservationFleetRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyCapacityReservationFleetRequest class]];
}

- (void) test_AWSEC2ModifyCapacityReservationFleetResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyCapacityReservationFleetResult class]];
}

- (void) test_AWSEC2ModifyCapacityReservationRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyCapacityReservationRequest class]];
}

- (void) test_AWSEC2ModifyCapacityReservationResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyCapacityReservationResult class]];
}

- (void) test_AWSEC2ModifyClientVpnEndpointRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyClientVpnEndpointRequest class]];
}

- (void) test_AWSEC2ModifyClientVpnEndpointResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyClientVpnEndpointResult class]];
}

- (void) test_AWSEC2ModifyDefaultCreditSpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyDefaultCreditSpecificationRequest class]];
}

- (void) test_AWSEC2ModifyDefaultCreditSpecificationResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyDefaultCreditSpecificationResult class]];
}

- (void) test_AWSEC2ModifyEbsDefaultKmsKeyIdRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyEbsDefaultKmsKeyIdRequest class]];
}

- (void) test_AWSEC2ModifyEbsDefaultKmsKeyIdResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyEbsDefaultKmsKeyIdResult class]];
}

- (void) test_AWSEC2ModifyFleetRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyFleetRequest class]];
}

- (void) test_AWSEC2ModifyFleetResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyFleetResult class]];
}

- (void) test_AWSEC2ModifyFpgaImageAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyFpgaImageAttributeRequest class]];
}

- (void) test_AWSEC2ModifyFpgaImageAttributeResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyFpgaImageAttributeResult class]];
}

- (void) test_AWSEC2ModifyHostsRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyHostsRequest class]];
}

- (void) test_AWSEC2ModifyHostsResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyHostsResult class]];
}

- (void) test_AWSEC2ModifyIdFormatRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyIdFormatRequest class]];
}

- (void) test_AWSEC2ModifyIdentityIdFormatRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyIdentityIdFormatRequest class]];
}

- (void) test_AWSEC2ModifyImageAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyImageAttributeRequest class]];
}

- (void) test_AWSEC2ModifyInstanceAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstanceAttributeRequest class]];
}

- (void) test_AWSEC2ModifyInstanceCapacityReservationAttributesRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstanceCapacityReservationAttributesRequest class]];
}

- (void) test_AWSEC2ModifyInstanceCapacityReservationAttributesResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstanceCapacityReservationAttributesResult class]];
}

- (void) test_AWSEC2ModifyInstanceCreditSpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstanceCreditSpecificationRequest class]];
}

- (void) test_AWSEC2ModifyInstanceCreditSpecificationResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstanceCreditSpecificationResult class]];
}

- (void) test_AWSEC2ModifyInstanceEventStartTimeRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstanceEventStartTimeRequest class]];
}

- (void) test_AWSEC2ModifyInstanceEventStartTimeResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstanceEventStartTimeResult class]];
}

- (void) test_AWSEC2ModifyInstanceEventWindowRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstanceEventWindowRequest class]];
}

- (void) test_AWSEC2ModifyInstanceEventWindowResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstanceEventWindowResult class]];
}

- (void) test_AWSEC2ModifyInstanceMaintenanceOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstanceMaintenanceOptionsRequest class]];
}

- (void) test_AWSEC2ModifyInstanceMaintenanceOptionsResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstanceMaintenanceOptionsResult class]];
}

- (void) test_AWSEC2ModifyInstanceMetadataOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstanceMetadataOptionsRequest class]];
}

- (void) test_AWSEC2ModifyInstanceMetadataOptionsResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstanceMetadataOptionsResult class]];
}

- (void) test_AWSEC2ModifyInstancePlacementRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstancePlacementRequest class]];
}

- (void) test_AWSEC2ModifyInstancePlacementResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyInstancePlacementResult class]];
}

- (void) test_AWSEC2ModifyIpamPoolRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyIpamPoolRequest class]];
}

- (void) test_AWSEC2ModifyIpamPoolResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyIpamPoolResult class]];
}

- (void) test_AWSEC2ModifyIpamRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyIpamRequest class]];
}

- (void) test_AWSEC2ModifyIpamResourceCidrRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyIpamResourceCidrRequest class]];
}

- (void) test_AWSEC2ModifyIpamResourceCidrResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyIpamResourceCidrResult class]];
}

- (void) test_AWSEC2ModifyIpamResourceDiscoveryRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyIpamResourceDiscoveryRequest class]];
}

- (void) test_AWSEC2ModifyIpamResourceDiscoveryResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyIpamResourceDiscoveryResult class]];
}

- (void) test_AWSEC2ModifyIpamResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyIpamResult class]];
}

- (void) test_AWSEC2ModifyIpamScopeRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyIpamScopeRequest class]];
}

- (void) test_AWSEC2ModifyIpamScopeResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyIpamScopeResult class]];
}

- (void) test_AWSEC2ModifyLaunchTemplateRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyLaunchTemplateRequest class]];
}

- (void) test_AWSEC2ModifyLaunchTemplateResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyLaunchTemplateResult class]];
}

- (void) test_AWSEC2ModifyLocalGatewayRouteRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyLocalGatewayRouteRequest class]];
}

- (void) test_AWSEC2ModifyLocalGatewayRouteResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyLocalGatewayRouteResult class]];
}

- (void) test_AWSEC2ModifyManagedPrefixListRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyManagedPrefixListRequest class]];
}

- (void) test_AWSEC2ModifyManagedPrefixListResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyManagedPrefixListResult class]];
}

- (void) test_AWSEC2ModifyNetworkInterfaceAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyNetworkInterfaceAttributeRequest class]];
}

- (void) test_AWSEC2ModifyPrivateDnsNameOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyPrivateDnsNameOptionsRequest class]];
}

- (void) test_AWSEC2ModifyPrivateDnsNameOptionsResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyPrivateDnsNameOptionsResult class]];
}

- (void) test_AWSEC2ModifyReservedInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyReservedInstancesRequest class]];
}

- (void) test_AWSEC2ModifyReservedInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyReservedInstancesResult class]];
}

- (void) test_AWSEC2ModifySecurityGroupRulesRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifySecurityGroupRulesRequest class]];
}

- (void) test_AWSEC2ModifySecurityGroupRulesResult {
    [self validateSecureCodingForClass:[AWSEC2ModifySecurityGroupRulesResult class]];
}

- (void) test_AWSEC2ModifySnapshotAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifySnapshotAttributeRequest class]];
}

- (void) test_AWSEC2ModifySnapshotTierRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifySnapshotTierRequest class]];
}

- (void) test_AWSEC2ModifySnapshotTierResult {
    [self validateSecureCodingForClass:[AWSEC2ModifySnapshotTierResult class]];
}

- (void) test_AWSEC2ModifySpotFleetRequestRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifySpotFleetRequestRequest class]];
}

- (void) test_AWSEC2ModifySpotFleetRequestResponse {
    [self validateSecureCodingForClass:[AWSEC2ModifySpotFleetRequestResponse class]];
}

- (void) test_AWSEC2ModifySubnetAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifySubnetAttributeRequest class]];
}

- (void) test_AWSEC2ModifyTrafficMirrorFilterNetworkServicesRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyTrafficMirrorFilterNetworkServicesRequest class]];
}

- (void) test_AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult class]];
}

- (void) test_AWSEC2ModifyTrafficMirrorFilterRuleRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyTrafficMirrorFilterRuleRequest class]];
}

- (void) test_AWSEC2ModifyTrafficMirrorFilterRuleResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyTrafficMirrorFilterRuleResult class]];
}

- (void) test_AWSEC2ModifyTrafficMirrorSessionRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyTrafficMirrorSessionRequest class]];
}

- (void) test_AWSEC2ModifyTrafficMirrorSessionResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyTrafficMirrorSessionResult class]];
}

- (void) test_AWSEC2ModifyTransitGatewayOptions {
    [self validateSecureCodingForClass:[AWSEC2ModifyTransitGatewayOptions class]];
}

- (void) test_AWSEC2ModifyTransitGatewayPrefixListReferenceRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyTransitGatewayPrefixListReferenceRequest class]];
}

- (void) test_AWSEC2ModifyTransitGatewayPrefixListReferenceResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyTransitGatewayPrefixListReferenceResult class]];
}

- (void) test_AWSEC2ModifyTransitGatewayRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyTransitGatewayRequest class]];
}

- (void) test_AWSEC2ModifyTransitGatewayResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyTransitGatewayResult class]];
}

- (void) test_AWSEC2ModifyTransitGatewayVpcAttachmentRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyTransitGatewayVpcAttachmentRequest class]];
}

- (void) test_AWSEC2ModifyTransitGatewayVpcAttachmentRequestOptions {
    [self validateSecureCodingForClass:[AWSEC2ModifyTransitGatewayVpcAttachmentRequestOptions class]];
}

- (void) test_AWSEC2ModifyTransitGatewayVpcAttachmentResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyTransitGatewayVpcAttachmentResult class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessEndpointEniOptions {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessEndpointEniOptions class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessEndpointLoadBalancerOptions {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessEndpointLoadBalancerOptions class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessEndpointPolicyRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessEndpointPolicyRequest class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessEndpointPolicyResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessEndpointPolicyResult class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessEndpointRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessEndpointRequest class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessEndpointResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessEndpointResult class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessGroupPolicyRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessGroupPolicyRequest class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessGroupPolicyResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessGroupPolicyResult class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessGroupRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessGroupRequest class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessGroupResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessGroupResult class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessInstanceLoggingConfigurationRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessInstanceLoggingConfigurationRequest class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessInstanceLoggingConfigurationResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessInstanceLoggingConfigurationResult class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessInstanceRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessInstanceRequest class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessInstanceResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessInstanceResult class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessTrustProviderOidcOptions {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessTrustProviderOidcOptions class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessTrustProviderRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessTrustProviderRequest class]];
}

- (void) test_AWSEC2ModifyVerifiedAccessTrustProviderResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVerifiedAccessTrustProviderResult class]];
}

- (void) test_AWSEC2ModifyVolumeAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVolumeAttributeRequest class]];
}

- (void) test_AWSEC2ModifyVolumeRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVolumeRequest class]];
}

- (void) test_AWSEC2ModifyVolumeResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVolumeResult class]];
}

- (void) test_AWSEC2ModifyVpcAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcAttributeRequest class]];
}

- (void) test_AWSEC2ModifyVpcEndpointConnectionNotificationRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcEndpointConnectionNotificationRequest class]];
}

- (void) test_AWSEC2ModifyVpcEndpointConnectionNotificationResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcEndpointConnectionNotificationResult class]];
}

- (void) test_AWSEC2ModifyVpcEndpointRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcEndpointRequest class]];
}

- (void) test_AWSEC2ModifyVpcEndpointResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcEndpointResult class]];
}

- (void) test_AWSEC2ModifyVpcEndpointServiceConfigurationRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcEndpointServiceConfigurationRequest class]];
}

- (void) test_AWSEC2ModifyVpcEndpointServiceConfigurationResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcEndpointServiceConfigurationResult class]];
}

- (void) test_AWSEC2ModifyVpcEndpointServicePayerResponsibilityRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcEndpointServicePayerResponsibilityRequest class]];
}

- (void) test_AWSEC2ModifyVpcEndpointServicePayerResponsibilityResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcEndpointServicePayerResponsibilityResult class]];
}

- (void) test_AWSEC2ModifyVpcEndpointServicePermissionsRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcEndpointServicePermissionsRequest class]];
}

- (void) test_AWSEC2ModifyVpcEndpointServicePermissionsResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcEndpointServicePermissionsResult class]];
}

- (void) test_AWSEC2ModifyVpcPeeringConnectionOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcPeeringConnectionOptionsRequest class]];
}

- (void) test_AWSEC2ModifyVpcPeeringConnectionOptionsResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcPeeringConnectionOptionsResult class]];
}

- (void) test_AWSEC2ModifyVpcTenancyRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcTenancyRequest class]];
}

- (void) test_AWSEC2ModifyVpcTenancyResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpcTenancyResult class]];
}

- (void) test_AWSEC2ModifyVpnConnectionOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpnConnectionOptionsRequest class]];
}

- (void) test_AWSEC2ModifyVpnConnectionOptionsResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpnConnectionOptionsResult class]];
}

- (void) test_AWSEC2ModifyVpnConnectionRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpnConnectionRequest class]];
}

- (void) test_AWSEC2ModifyVpnConnectionResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpnConnectionResult class]];
}

- (void) test_AWSEC2ModifyVpnTunnelCertificateRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpnTunnelCertificateRequest class]];
}

- (void) test_AWSEC2ModifyVpnTunnelCertificateResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpnTunnelCertificateResult class]];
}

- (void) test_AWSEC2ModifyVpnTunnelOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpnTunnelOptionsRequest class]];
}

- (void) test_AWSEC2ModifyVpnTunnelOptionsResult {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpnTunnelOptionsResult class]];
}

- (void) test_AWSEC2ModifyVpnTunnelOptionsSpecification {
    [self validateSecureCodingForClass:[AWSEC2ModifyVpnTunnelOptionsSpecification class]];
}

- (void) test_AWSEC2MonitorInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2MonitorInstancesRequest class]];
}

- (void) test_AWSEC2MonitorInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2MonitorInstancesResult class]];
}

- (void) test_AWSEC2Monitoring {
    [self validateSecureCodingForClass:[AWSEC2Monitoring class]];
}

- (void) test_AWSEC2MoveAddressToVpcRequest {
    [self validateSecureCodingForClass:[AWSEC2MoveAddressToVpcRequest class]];
}

- (void) test_AWSEC2MoveAddressToVpcResult {
    [self validateSecureCodingForClass:[AWSEC2MoveAddressToVpcResult class]];
}

- (void) test_AWSEC2MoveByoipCidrToIpamRequest {
    [self validateSecureCodingForClass:[AWSEC2MoveByoipCidrToIpamRequest class]];
}

- (void) test_AWSEC2MoveByoipCidrToIpamResult {
    [self validateSecureCodingForClass:[AWSEC2MoveByoipCidrToIpamResult class]];
}

- (void) test_AWSEC2MovingAddressStatus {
    [self validateSecureCodingForClass:[AWSEC2MovingAddressStatus class]];
}

- (void) test_AWSEC2NatGateway {
    [self validateSecureCodingForClass:[AWSEC2NatGateway class]];
}

- (void) test_AWSEC2NatGatewayAddress {
    [self validateSecureCodingForClass:[AWSEC2NatGatewayAddress class]];
}

- (void) test_AWSEC2NetworkAcl {
    [self validateSecureCodingForClass:[AWSEC2NetworkAcl class]];
}

- (void) test_AWSEC2NetworkAclAssociation {
    [self validateSecureCodingForClass:[AWSEC2NetworkAclAssociation class]];
}

- (void) test_AWSEC2NetworkAclEntry {
    [self validateSecureCodingForClass:[AWSEC2NetworkAclEntry class]];
}

- (void) test_AWSEC2NetworkBandwidthGbps {
    [self validateSecureCodingForClass:[AWSEC2NetworkBandwidthGbps class]];
}

- (void) test_AWSEC2NetworkBandwidthGbpsRequest {
    [self validateSecureCodingForClass:[AWSEC2NetworkBandwidthGbpsRequest class]];
}

- (void) test_AWSEC2NetworkCardInfo {
    [self validateSecureCodingForClass:[AWSEC2NetworkCardInfo class]];
}

- (void) test_AWSEC2NetworkInfo {
    [self validateSecureCodingForClass:[AWSEC2NetworkInfo class]];
}

- (void) test_AWSEC2NetworkInsightsAccessScope {
    [self validateSecureCodingForClass:[AWSEC2NetworkInsightsAccessScope class]];
}

- (void) test_AWSEC2NetworkInsightsAccessScopeAnalysis {
    [self validateSecureCodingForClass:[AWSEC2NetworkInsightsAccessScopeAnalysis class]];
}

- (void) test_AWSEC2NetworkInsightsAccessScopeContent {
    [self validateSecureCodingForClass:[AWSEC2NetworkInsightsAccessScopeContent class]];
}

- (void) test_AWSEC2NetworkInsightsAnalysis {
    [self validateSecureCodingForClass:[AWSEC2NetworkInsightsAnalysis class]];
}

- (void) test_AWSEC2NetworkInsightsPath {
    [self validateSecureCodingForClass:[AWSEC2NetworkInsightsPath class]];
}

- (void) test_AWSEC2NetworkInterface {
    [self validateSecureCodingForClass:[AWSEC2NetworkInterface class]];
}

- (void) test_AWSEC2NetworkInterfaceAssociation {
    [self validateSecureCodingForClass:[AWSEC2NetworkInterfaceAssociation class]];
}

- (void) test_AWSEC2NetworkInterfaceAttachment {
    [self validateSecureCodingForClass:[AWSEC2NetworkInterfaceAttachment class]];
}

- (void) test_AWSEC2NetworkInterfaceAttachmentChanges {
    [self validateSecureCodingForClass:[AWSEC2NetworkInterfaceAttachmentChanges class]];
}

- (void) test_AWSEC2NetworkInterfaceCount {
    [self validateSecureCodingForClass:[AWSEC2NetworkInterfaceCount class]];
}

- (void) test_AWSEC2NetworkInterfaceCountRequest {
    [self validateSecureCodingForClass:[AWSEC2NetworkInterfaceCountRequest class]];
}

- (void) test_AWSEC2NetworkInterfaceIpv6Address {
    [self validateSecureCodingForClass:[AWSEC2NetworkInterfaceIpv6Address class]];
}

- (void) test_AWSEC2NetworkInterfacePermission {
    [self validateSecureCodingForClass:[AWSEC2NetworkInterfacePermission class]];
}

- (void) test_AWSEC2NetworkInterfacePermissionState {
    [self validateSecureCodingForClass:[AWSEC2NetworkInterfacePermissionState class]];
}

- (void) test_AWSEC2NetworkInterfacePrivateIpAddress {
    [self validateSecureCodingForClass:[AWSEC2NetworkInterfacePrivateIpAddress class]];
}

- (void) test_AWSEC2LatestDhcpConfiguration {
    [self validateSecureCodingForClass:[AWSEC2LatestDhcpConfiguration class]];
}

- (void) test_AWSEC2OidcOptions {
    [self validateSecureCodingForClass:[AWSEC2OidcOptions class]];
}

- (void) test_AWSEC2OnDemandOptions {
    [self validateSecureCodingForClass:[AWSEC2OnDemandOptions class]];
}

- (void) test_AWSEC2OnDemandOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2OnDemandOptionsRequest class]];
}

- (void) test_AWSEC2PacketHeaderStatement {
    [self validateSecureCodingForClass:[AWSEC2PacketHeaderStatement class]];
}

- (void) test_AWSEC2PacketHeaderStatementRequest {
    [self validateSecureCodingForClass:[AWSEC2PacketHeaderStatementRequest class]];
}

- (void) test_AWSEC2PathComponent {
    [self validateSecureCodingForClass:[AWSEC2PathComponent class]];
}

- (void) test_AWSEC2PathFilter {
    [self validateSecureCodingForClass:[AWSEC2PathFilter class]];
}

- (void) test_AWSEC2PathRequestFilter {
    [self validateSecureCodingForClass:[AWSEC2PathRequestFilter class]];
}

- (void) test_AWSEC2PathStatement {
    [self validateSecureCodingForClass:[AWSEC2PathStatement class]];
}

- (void) test_AWSEC2PathStatementRequest {
    [self validateSecureCodingForClass:[AWSEC2PathStatementRequest class]];
}

- (void) test_AWSEC2PciId {
    [self validateSecureCodingForClass:[AWSEC2PciId class]];
}

- (void) test_AWSEC2PeeringAttachmentStatus {
    [self validateSecureCodingForClass:[AWSEC2PeeringAttachmentStatus class]];
}

- (void) test_AWSEC2PeeringConnectionOptions {
    [self validateSecureCodingForClass:[AWSEC2PeeringConnectionOptions class]];
}

- (void) test_AWSEC2PeeringConnectionOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2PeeringConnectionOptionsRequest class]];
}

- (void) test_AWSEC2PeeringTgwInfo {
    [self validateSecureCodingForClass:[AWSEC2PeeringTgwInfo class]];
}

- (void) test_AWSEC2Phase1DHGroupNumbersListValue {
    [self validateSecureCodingForClass:[AWSEC2Phase1DHGroupNumbersListValue class]];
}

- (void) test_AWSEC2Phase1DHGroupNumbersRequestListValue {
    [self validateSecureCodingForClass:[AWSEC2Phase1DHGroupNumbersRequestListValue class]];
}

- (void) test_AWSEC2Phase1EncryptionAlgorithmsListValue {
    [self validateSecureCodingForClass:[AWSEC2Phase1EncryptionAlgorithmsListValue class]];
}

- (void) test_AWSEC2Phase1EncryptionAlgorithmsRequestListValue {
    [self validateSecureCodingForClass:[AWSEC2Phase1EncryptionAlgorithmsRequestListValue class]];
}

- (void) test_AWSEC2Phase1IntegrityAlgorithmsListValue {
    [self validateSecureCodingForClass:[AWSEC2Phase1IntegrityAlgorithmsListValue class]];
}

- (void) test_AWSEC2Phase1IntegrityAlgorithmsRequestListValue {
    [self validateSecureCodingForClass:[AWSEC2Phase1IntegrityAlgorithmsRequestListValue class]];
}

- (void) test_AWSEC2Phase2DHGroupNumbersListValue {
    [self validateSecureCodingForClass:[AWSEC2Phase2DHGroupNumbersListValue class]];
}

- (void) test_AWSEC2Phase2DHGroupNumbersRequestListValue {
    [self validateSecureCodingForClass:[AWSEC2Phase2DHGroupNumbersRequestListValue class]];
}

- (void) test_AWSEC2Phase2EncryptionAlgorithmsListValue {
    [self validateSecureCodingForClass:[AWSEC2Phase2EncryptionAlgorithmsListValue class]];
}

- (void) test_AWSEC2Phase2EncryptionAlgorithmsRequestListValue {
    [self validateSecureCodingForClass:[AWSEC2Phase2EncryptionAlgorithmsRequestListValue class]];
}

- (void) test_AWSEC2Phase2IntegrityAlgorithmsListValue {
    [self validateSecureCodingForClass:[AWSEC2Phase2IntegrityAlgorithmsListValue class]];
}

- (void) test_AWSEC2Phase2IntegrityAlgorithmsRequestListValue {
    [self validateSecureCodingForClass:[AWSEC2Phase2IntegrityAlgorithmsRequestListValue class]];
}

- (void) test_AWSEC2Placement {
    [self validateSecureCodingForClass:[AWSEC2Placement class]];
}

- (void) test_AWSEC2PlacementGroup {
    [self validateSecureCodingForClass:[AWSEC2PlacementGroup class]];
}

- (void) test_AWSEC2PlacementGroupInfo {
    [self validateSecureCodingForClass:[AWSEC2PlacementGroupInfo class]];
}

- (void) test_AWSEC2PlacementResponse {
    [self validateSecureCodingForClass:[AWSEC2PlacementResponse class]];
}

- (void) test_AWSEC2PoolCidrBlock {
    [self validateSecureCodingForClass:[AWSEC2PoolCidrBlock class]];
}

- (void) test_AWSEC2PortRange {
    [self validateSecureCodingForClass:[AWSEC2PortRange class]];
}

- (void) test_AWSEC2PrefixList {
    [self validateSecureCodingForClass:[AWSEC2PrefixList class]];
}

- (void) test_AWSEC2PrefixListAssociation {
    [self validateSecureCodingForClass:[AWSEC2PrefixListAssociation class]];
}

- (void) test_AWSEC2PrefixListEntry {
    [self validateSecureCodingForClass:[AWSEC2PrefixListEntry class]];
}

- (void) test_AWSEC2PrefixListId {
    [self validateSecureCodingForClass:[AWSEC2PrefixListId class]];
}

- (void) test_AWSEC2PriceSchedule {
    [self validateSecureCodingForClass:[AWSEC2PriceSchedule class]];
}

- (void) test_AWSEC2PriceScheduleSpecification {
    [self validateSecureCodingForClass:[AWSEC2PriceScheduleSpecification class]];
}

- (void) test_AWSEC2PricingDetail {
    [self validateSecureCodingForClass:[AWSEC2PricingDetail class]];
}

- (void) test_AWSEC2PrincipalIdFormat {
    [self validateSecureCodingForClass:[AWSEC2PrincipalIdFormat class]];
}

- (void) test_AWSEC2PrivateDnsDetails {
    [self validateSecureCodingForClass:[AWSEC2PrivateDnsDetails class]];
}

- (void) test_AWSEC2PrivateDnsNameConfiguration {
    [self validateSecureCodingForClass:[AWSEC2PrivateDnsNameConfiguration class]];
}

- (void) test_AWSEC2PrivateDnsNameOptionsOnLaunch {
    [self validateSecureCodingForClass:[AWSEC2PrivateDnsNameOptionsOnLaunch class]];
}

- (void) test_AWSEC2PrivateDnsNameOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2PrivateDnsNameOptionsRequest class]];
}

- (void) test_AWSEC2PrivateDnsNameOptionsResponse {
    [self validateSecureCodingForClass:[AWSEC2PrivateDnsNameOptionsResponse class]];
}

- (void) test_AWSEC2PrivateIpAddressSpecification {
    [self validateSecureCodingForClass:[AWSEC2PrivateIpAddressSpecification class]];
}

- (void) test_AWSEC2ProcessorInfo {
    [self validateSecureCodingForClass:[AWSEC2ProcessorInfo class]];
}

- (void) test_AWSEC2ProductCode {
    [self validateSecureCodingForClass:[AWSEC2ProductCode class]];
}

- (void) test_AWSEC2PropagatingVgw {
    [self validateSecureCodingForClass:[AWSEC2PropagatingVgw class]];
}

- (void) test_AWSEC2ProvisionByoipCidrRequest {
    [self validateSecureCodingForClass:[AWSEC2ProvisionByoipCidrRequest class]];
}

- (void) test_AWSEC2ProvisionByoipCidrResult {
    [self validateSecureCodingForClass:[AWSEC2ProvisionByoipCidrResult class]];
}

- (void) test_AWSEC2ProvisionIpamPoolCidrRequest {
    [self validateSecureCodingForClass:[AWSEC2ProvisionIpamPoolCidrRequest class]];
}

- (void) test_AWSEC2ProvisionIpamPoolCidrResult {
    [self validateSecureCodingForClass:[AWSEC2ProvisionIpamPoolCidrResult class]];
}

- (void) test_AWSEC2ProvisionPublicIpv4PoolCidrRequest {
    [self validateSecureCodingForClass:[AWSEC2ProvisionPublicIpv4PoolCidrRequest class]];
}

- (void) test_AWSEC2ProvisionPublicIpv4PoolCidrResult {
    [self validateSecureCodingForClass:[AWSEC2ProvisionPublicIpv4PoolCidrResult class]];
}

- (void) test_AWSEC2ProvisionedBandwidth {
    [self validateSecureCodingForClass:[AWSEC2ProvisionedBandwidth class]];
}

- (void) test_AWSEC2PtrUpdateStatus {
    [self validateSecureCodingForClass:[AWSEC2PtrUpdateStatus class]];
}

- (void) test_AWSEC2PublicIpv4Pool {
    [self validateSecureCodingForClass:[AWSEC2PublicIpv4Pool class]];
}

- (void) test_AWSEC2PublicIpv4PoolRange {
    [self validateSecureCodingForClass:[AWSEC2PublicIpv4PoolRange class]];
}

- (void) test_AWSEC2Purchase {
    [self validateSecureCodingForClass:[AWSEC2Purchase class]];
}

- (void) test_AWSEC2PurchaseHostReservationRequest {
    [self validateSecureCodingForClass:[AWSEC2PurchaseHostReservationRequest class]];
}

- (void) test_AWSEC2PurchaseHostReservationResult {
    [self validateSecureCodingForClass:[AWSEC2PurchaseHostReservationResult class]];
}

- (void) test_AWSEC2PurchaseRequest {
    [self validateSecureCodingForClass:[AWSEC2PurchaseRequest class]];
}

- (void) test_AWSEC2PurchaseReservedInstancesOfferingRequest {
    [self validateSecureCodingForClass:[AWSEC2PurchaseReservedInstancesOfferingRequest class]];
}

- (void) test_AWSEC2PurchaseReservedInstancesOfferingResult {
    [self validateSecureCodingForClass:[AWSEC2PurchaseReservedInstancesOfferingResult class]];
}

- (void) test_AWSEC2PurchaseScheduledInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2PurchaseScheduledInstancesRequest class]];
}

- (void) test_AWSEC2PurchaseScheduledInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2PurchaseScheduledInstancesResult class]];
}

- (void) test_AWSEC2RebootInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2RebootInstancesRequest class]];
}

- (void) test_AWSEC2RecurringCharge {
    [self validateSecureCodingForClass:[AWSEC2RecurringCharge class]];
}

- (void) test_AWSEC2ReferencedSecurityGroup {
    [self validateSecureCodingForClass:[AWSEC2ReferencedSecurityGroup class]];
}

- (void) test_AWSEC2Region {
    [self validateSecureCodingForClass:[AWSEC2Region class]];
}

- (void) test_AWSEC2RegisterImageRequest {
    [self validateSecureCodingForClass:[AWSEC2RegisterImageRequest class]];
}

- (void) test_AWSEC2RegisterImageResult {
    [self validateSecureCodingForClass:[AWSEC2RegisterImageResult class]];
}

- (void) test_AWSEC2RegisterInstanceEventNotificationAttributesRequest {
    [self validateSecureCodingForClass:[AWSEC2RegisterInstanceEventNotificationAttributesRequest class]];
}

- (void) test_AWSEC2RegisterInstanceEventNotificationAttributesResult {
    [self validateSecureCodingForClass:[AWSEC2RegisterInstanceEventNotificationAttributesResult class]];
}

- (void) test_AWSEC2RegisterInstanceTagAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2RegisterInstanceTagAttributeRequest class]];
}

- (void) test_AWSEC2RegisterTransitGatewayMulticastGroupMembersRequest {
    [self validateSecureCodingForClass:[AWSEC2RegisterTransitGatewayMulticastGroupMembersRequest class]];
}

- (void) test_AWSEC2RegisterTransitGatewayMulticastGroupMembersResult {
    [self validateSecureCodingForClass:[AWSEC2RegisterTransitGatewayMulticastGroupMembersResult class]];
}

- (void) test_AWSEC2RegisterTransitGatewayMulticastGroupSourcesRequest {
    [self validateSecureCodingForClass:[AWSEC2RegisterTransitGatewayMulticastGroupSourcesRequest class]];
}

- (void) test_AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult {
    [self validateSecureCodingForClass:[AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult class]];
}

- (void) test_AWSEC2RejectTransitGatewayMulticastDomainAssociationsRequest {
    [self validateSecureCodingForClass:[AWSEC2RejectTransitGatewayMulticastDomainAssociationsRequest class]];
}

- (void) test_AWSEC2RejectTransitGatewayMulticastDomainAssociationsResult {
    [self validateSecureCodingForClass:[AWSEC2RejectTransitGatewayMulticastDomainAssociationsResult class]];
}

- (void) test_AWSEC2RejectTransitGatewayPeeringAttachmentRequest {
    [self validateSecureCodingForClass:[AWSEC2RejectTransitGatewayPeeringAttachmentRequest class]];
}

- (void) test_AWSEC2RejectTransitGatewayPeeringAttachmentResult {
    [self validateSecureCodingForClass:[AWSEC2RejectTransitGatewayPeeringAttachmentResult class]];
}

- (void) test_AWSEC2RejectTransitGatewayVpcAttachmentRequest {
    [self validateSecureCodingForClass:[AWSEC2RejectTransitGatewayVpcAttachmentRequest class]];
}

- (void) test_AWSEC2RejectTransitGatewayVpcAttachmentResult {
    [self validateSecureCodingForClass:[AWSEC2RejectTransitGatewayVpcAttachmentResult class]];
}

- (void) test_AWSEC2RejectVpcEndpointConnectionsRequest {
    [self validateSecureCodingForClass:[AWSEC2RejectVpcEndpointConnectionsRequest class]];
}

- (void) test_AWSEC2RejectVpcEndpointConnectionsResult {
    [self validateSecureCodingForClass:[AWSEC2RejectVpcEndpointConnectionsResult class]];
}

- (void) test_AWSEC2RejectVpcPeeringConnectionRequest {
    [self validateSecureCodingForClass:[AWSEC2RejectVpcPeeringConnectionRequest class]];
}

- (void) test_AWSEC2RejectVpcPeeringConnectionResult {
    [self validateSecureCodingForClass:[AWSEC2RejectVpcPeeringConnectionResult class]];
}

- (void) test_AWSEC2ReleaseAddressRequest {
    [self validateSecureCodingForClass:[AWSEC2ReleaseAddressRequest class]];
}

- (void) test_AWSEC2ReleaseHostsRequest {
    [self validateSecureCodingForClass:[AWSEC2ReleaseHostsRequest class]];
}

- (void) test_AWSEC2ReleaseHostsResult {
    [self validateSecureCodingForClass:[AWSEC2ReleaseHostsResult class]];
}

- (void) test_AWSEC2ReleaseIpamPoolAllocationRequest {
    [self validateSecureCodingForClass:[AWSEC2ReleaseIpamPoolAllocationRequest class]];
}

- (void) test_AWSEC2ReleaseIpamPoolAllocationResult {
    [self validateSecureCodingForClass:[AWSEC2ReleaseIpamPoolAllocationResult class]];
}

- (void) test_AWSEC2RemoveIpamOperatingRegion {
    [self validateSecureCodingForClass:[AWSEC2RemoveIpamOperatingRegion class]];
}

- (void) test_AWSEC2RemovePrefixListEntry {
    [self validateSecureCodingForClass:[AWSEC2RemovePrefixListEntry class]];
}

- (void) test_AWSEC2ReplaceIamInstanceProfileAssociationRequest {
    [self validateSecureCodingForClass:[AWSEC2ReplaceIamInstanceProfileAssociationRequest class]];
}

- (void) test_AWSEC2ReplaceIamInstanceProfileAssociationResult {
    [self validateSecureCodingForClass:[AWSEC2ReplaceIamInstanceProfileAssociationResult class]];
}

- (void) test_AWSEC2ReplaceNetworkAclAssociationRequest {
    [self validateSecureCodingForClass:[AWSEC2ReplaceNetworkAclAssociationRequest class]];
}

- (void) test_AWSEC2ReplaceNetworkAclAssociationResult {
    [self validateSecureCodingForClass:[AWSEC2ReplaceNetworkAclAssociationResult class]];
}

- (void) test_AWSEC2ReplaceNetworkAclEntryRequest {
    [self validateSecureCodingForClass:[AWSEC2ReplaceNetworkAclEntryRequest class]];
}

- (void) test_AWSEC2ReplaceRootVolumeTask {
    [self validateSecureCodingForClass:[AWSEC2ReplaceRootVolumeTask class]];
}

- (void) test_AWSEC2ReplaceRouteRequest {
    [self validateSecureCodingForClass:[AWSEC2ReplaceRouteRequest class]];
}

- (void) test_AWSEC2ReplaceRouteTableAssociationRequest {
    [self validateSecureCodingForClass:[AWSEC2ReplaceRouteTableAssociationRequest class]];
}

- (void) test_AWSEC2ReplaceRouteTableAssociationResult {
    [self validateSecureCodingForClass:[AWSEC2ReplaceRouteTableAssociationResult class]];
}

- (void) test_AWSEC2ReplaceTransitGatewayRouteRequest {
    [self validateSecureCodingForClass:[AWSEC2ReplaceTransitGatewayRouteRequest class]];
}

- (void) test_AWSEC2ReplaceTransitGatewayRouteResult {
    [self validateSecureCodingForClass:[AWSEC2ReplaceTransitGatewayRouteResult class]];
}

- (void) test_AWSEC2ReplaceVpnTunnelRequest {
    [self validateSecureCodingForClass:[AWSEC2ReplaceVpnTunnelRequest class]];
}

- (void) test_AWSEC2ReplaceVpnTunnelResult {
    [self validateSecureCodingForClass:[AWSEC2ReplaceVpnTunnelResult class]];
}

- (void) test_AWSEC2ReportInstanceStatusRequest {
    [self validateSecureCodingForClass:[AWSEC2ReportInstanceStatusRequest class]];
}

- (void) test_AWSEC2RequestFilterPortRange {
    [self validateSecureCodingForClass:[AWSEC2RequestFilterPortRange class]];
}

- (void) test_AWSEC2RequestIpamResourceTag {
    [self validateSecureCodingForClass:[AWSEC2RequestIpamResourceTag class]];
}

- (void) test_AWSEC2RequestLaunchTemplateData {
    [self validateSecureCodingForClass:[AWSEC2RequestLaunchTemplateData class]];
}

- (void) test_AWSEC2RequestSpotFleetRequest {
    [self validateSecureCodingForClass:[AWSEC2RequestSpotFleetRequest class]];
}

- (void) test_AWSEC2RequestSpotFleetResponse {
    [self validateSecureCodingForClass:[AWSEC2RequestSpotFleetResponse class]];
}

- (void) test_AWSEC2RequestSpotInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2RequestSpotInstancesRequest class]];
}

- (void) test_AWSEC2RequestSpotInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2RequestSpotInstancesResult class]];
}

- (void) test_AWSEC2RequestSpotLaunchSpecification {
    [self validateSecureCodingForClass:[AWSEC2RequestSpotLaunchSpecification class]];
}

- (void) test_AWSEC2Reservation {
    [self validateSecureCodingForClass:[AWSEC2Reservation class]];
}

- (void) test_AWSEC2ReservationFleetInstanceSpecification {
    [self validateSecureCodingForClass:[AWSEC2ReservationFleetInstanceSpecification class]];
}

- (void) test_AWSEC2ReservationValue {
    [self validateSecureCodingForClass:[AWSEC2ReservationValue class]];
}

- (void) test_AWSEC2ReservedInstanceLimitPrice {
    [self validateSecureCodingForClass:[AWSEC2ReservedInstanceLimitPrice class]];
}

- (void) test_AWSEC2ReservedInstanceReservationValue {
    [self validateSecureCodingForClass:[AWSEC2ReservedInstanceReservationValue class]];
}

- (void) test_AWSEC2ReservedInstances {
    [self validateSecureCodingForClass:[AWSEC2ReservedInstances class]];
}

- (void) test_AWSEC2ReservedInstancesConfiguration {
    [self validateSecureCodingForClass:[AWSEC2ReservedInstancesConfiguration class]];
}

- (void) test_AWSEC2ReservedInstancesId {
    [self validateSecureCodingForClass:[AWSEC2ReservedInstancesId class]];
}

- (void) test_AWSEC2ReservedInstancesListing {
    [self validateSecureCodingForClass:[AWSEC2ReservedInstancesListing class]];
}

- (void) test_AWSEC2ReservedInstancesModification {
    [self validateSecureCodingForClass:[AWSEC2ReservedInstancesModification class]];
}

- (void) test_AWSEC2ReservedInstancesModificationResult {
    [self validateSecureCodingForClass:[AWSEC2ReservedInstancesModificationResult class]];
}

- (void) test_AWSEC2ReservedInstancesOffering {
    [self validateSecureCodingForClass:[AWSEC2ReservedInstancesOffering class]];
}

- (void) test_AWSEC2ResetAddressAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ResetAddressAttributeRequest class]];
}

- (void) test_AWSEC2ResetAddressAttributeResult {
    [self validateSecureCodingForClass:[AWSEC2ResetAddressAttributeResult class]];
}

- (void) test_AWSEC2ResetEbsDefaultKmsKeyIdRequest {
    [self validateSecureCodingForClass:[AWSEC2ResetEbsDefaultKmsKeyIdRequest class]];
}

- (void) test_AWSEC2ResetEbsDefaultKmsKeyIdResult {
    [self validateSecureCodingForClass:[AWSEC2ResetEbsDefaultKmsKeyIdResult class]];
}

- (void) test_AWSEC2ResetFpgaImageAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ResetFpgaImageAttributeRequest class]];
}

- (void) test_AWSEC2ResetFpgaImageAttributeResult {
    [self validateSecureCodingForClass:[AWSEC2ResetFpgaImageAttributeResult class]];
}

- (void) test_AWSEC2ResetImageAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ResetImageAttributeRequest class]];
}

- (void) test_AWSEC2ResetInstanceAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ResetInstanceAttributeRequest class]];
}

- (void) test_AWSEC2ResetNetworkInterfaceAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ResetNetworkInterfaceAttributeRequest class]];
}

- (void) test_AWSEC2ResetSnapshotAttributeRequest {
    [self validateSecureCodingForClass:[AWSEC2ResetSnapshotAttributeRequest class]];
}

- (void) test_AWSEC2ResourceStatement {
    [self validateSecureCodingForClass:[AWSEC2ResourceStatement class]];
}

- (void) test_AWSEC2ResourceStatementRequest {
    [self validateSecureCodingForClass:[AWSEC2ResourceStatementRequest class]];
}

- (void) test_AWSEC2ResponseError {
    [self validateSecureCodingForClass:[AWSEC2ResponseError class]];
}

- (void) test_AWSEC2ResponseLaunchTemplateData {
    [self validateSecureCodingForClass:[AWSEC2ResponseLaunchTemplateData class]];
}

- (void) test_AWSEC2RestoreAddressToClassicRequest {
    [self validateSecureCodingForClass:[AWSEC2RestoreAddressToClassicRequest class]];
}

- (void) test_AWSEC2RestoreAddressToClassicResult {
    [self validateSecureCodingForClass:[AWSEC2RestoreAddressToClassicResult class]];
}

- (void) test_AWSEC2RestoreImageFromRecycleBinRequest {
    [self validateSecureCodingForClass:[AWSEC2RestoreImageFromRecycleBinRequest class]];
}

- (void) test_AWSEC2RestoreImageFromRecycleBinResult {
    [self validateSecureCodingForClass:[AWSEC2RestoreImageFromRecycleBinResult class]];
}

- (void) test_AWSEC2RestoreManagedPrefixListVersionRequest {
    [self validateSecureCodingForClass:[AWSEC2RestoreManagedPrefixListVersionRequest class]];
}

- (void) test_AWSEC2RestoreManagedPrefixListVersionResult {
    [self validateSecureCodingForClass:[AWSEC2RestoreManagedPrefixListVersionResult class]];
}

- (void) test_AWSEC2RestoreSnapshotFromRecycleBinRequest {
    [self validateSecureCodingForClass:[AWSEC2RestoreSnapshotFromRecycleBinRequest class]];
}

- (void) test_AWSEC2RestoreSnapshotFromRecycleBinResult {
    [self validateSecureCodingForClass:[AWSEC2RestoreSnapshotFromRecycleBinResult class]];
}

- (void) test_AWSEC2RestoreSnapshotTierRequest {
    [self validateSecureCodingForClass:[AWSEC2RestoreSnapshotTierRequest class]];
}

- (void) test_AWSEC2RestoreSnapshotTierResult {
    [self validateSecureCodingForClass:[AWSEC2RestoreSnapshotTierResult class]];
}

- (void) test_AWSEC2RevokeClientVpnIngressRequest {
    [self validateSecureCodingForClass:[AWSEC2RevokeClientVpnIngressRequest class]];
}

- (void) test_AWSEC2RevokeClientVpnIngressResult {
    [self validateSecureCodingForClass:[AWSEC2RevokeClientVpnIngressResult class]];
}

- (void) test_AWSEC2RevokeSecurityGroupEgressRequest {
    [self validateSecureCodingForClass:[AWSEC2RevokeSecurityGroupEgressRequest class]];
}

- (void) test_AWSEC2RevokeSecurityGroupEgressResult {
    [self validateSecureCodingForClass:[AWSEC2RevokeSecurityGroupEgressResult class]];
}

- (void) test_AWSEC2RevokeSecurityGroupIngressRequest {
    [self validateSecureCodingForClass:[AWSEC2RevokeSecurityGroupIngressRequest class]];
}

- (void) test_AWSEC2RevokeSecurityGroupIngressResult {
    [self validateSecureCodingForClass:[AWSEC2RevokeSecurityGroupIngressResult class]];
}

- (void) test_AWSEC2Route {
    [self validateSecureCodingForClass:[AWSEC2Route class]];
}

- (void) test_AWSEC2RouteTable {
    [self validateSecureCodingForClass:[AWSEC2RouteTable class]];
}

- (void) test_AWSEC2RouteTableAssociation {
    [self validateSecureCodingForClass:[AWSEC2RouteTableAssociation class]];
}

- (void) test_AWSEC2RouteTableAssociationState {
    [self validateSecureCodingForClass:[AWSEC2RouteTableAssociationState class]];
}

- (void) test_AWSEC2RuleGroupRuleOptionsPair {
    [self validateSecureCodingForClass:[AWSEC2RuleGroupRuleOptionsPair class]];
}

- (void) test_AWSEC2RuleGroupTypePair {
    [self validateSecureCodingForClass:[AWSEC2RuleGroupTypePair class]];
}

- (void) test_AWSEC2RuleOption {
    [self validateSecureCodingForClass:[AWSEC2RuleOption class]];
}

- (void) test_AWSEC2RunInstancesMonitoringEnabled {
    [self validateSecureCodingForClass:[AWSEC2RunInstancesMonitoringEnabled class]];
}

- (void) test_AWSEC2RunInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2RunInstancesRequest class]];
}

- (void) test_AWSEC2RunScheduledInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2RunScheduledInstancesRequest class]];
}

- (void) test_AWSEC2RunScheduledInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2RunScheduledInstancesResult class]];
}

- (void) test_AWSEC2S3ObjectTag {
    [self validateSecureCodingForClass:[AWSEC2S3ObjectTag class]];
}

- (void) test_AWSEC2S3Storage {
    [self validateSecureCodingForClass:[AWSEC2S3Storage class]];
}

- (void) test_AWSEC2ScheduledInstance {
    [self validateSecureCodingForClass:[AWSEC2ScheduledInstance class]];
}

- (void) test_AWSEC2ScheduledInstanceAvailability {
    [self validateSecureCodingForClass:[AWSEC2ScheduledInstanceAvailability class]];
}

- (void) test_AWSEC2ScheduledInstanceRecurrence {
    [self validateSecureCodingForClass:[AWSEC2ScheduledInstanceRecurrence class]];
}

- (void) test_AWSEC2ScheduledInstanceRecurrenceRequest {
    [self validateSecureCodingForClass:[AWSEC2ScheduledInstanceRecurrenceRequest class]];
}

- (void) test_AWSEC2ScheduledInstancesBlockDeviceMapping {
    [self validateSecureCodingForClass:[AWSEC2ScheduledInstancesBlockDeviceMapping class]];
}

- (void) test_AWSEC2ScheduledInstancesEbs {
    [self validateSecureCodingForClass:[AWSEC2ScheduledInstancesEbs class]];
}

- (void) test_AWSEC2ScheduledInstancesIamInstanceProfile {
    [self validateSecureCodingForClass:[AWSEC2ScheduledInstancesIamInstanceProfile class]];
}

- (void) test_AWSEC2ScheduledInstancesIpv6Address {
    [self validateSecureCodingForClass:[AWSEC2ScheduledInstancesIpv6Address class]];
}

- (void) test_AWSEC2ScheduledInstancesLaunchSpecification {
    [self validateSecureCodingForClass:[AWSEC2ScheduledInstancesLaunchSpecification class]];
}

- (void) test_AWSEC2ScheduledInstancesMonitoring {
    [self validateSecureCodingForClass:[AWSEC2ScheduledInstancesMonitoring class]];
}

- (void) test_AWSEC2ScheduledInstancesNetworkInterface {
    [self validateSecureCodingForClass:[AWSEC2ScheduledInstancesNetworkInterface class]];
}

- (void) test_AWSEC2ScheduledInstancesPlacement {
    [self validateSecureCodingForClass:[AWSEC2ScheduledInstancesPlacement class]];
}

- (void) test_AWSEC2ScheduledInstancesPrivateIpAddressConfig {
    [self validateSecureCodingForClass:[AWSEC2ScheduledInstancesPrivateIpAddressConfig class]];
}

- (void) test_AWSEC2SearchLocalGatewayRoutesRequest {
    [self validateSecureCodingForClass:[AWSEC2SearchLocalGatewayRoutesRequest class]];
}

- (void) test_AWSEC2SearchLocalGatewayRoutesResult {
    [self validateSecureCodingForClass:[AWSEC2SearchLocalGatewayRoutesResult class]];
}

- (void) test_AWSEC2SearchTransitGatewayMulticastGroupsRequest {
    [self validateSecureCodingForClass:[AWSEC2SearchTransitGatewayMulticastGroupsRequest class]];
}

- (void) test_AWSEC2SearchTransitGatewayMulticastGroupsResult {
    [self validateSecureCodingForClass:[AWSEC2SearchTransitGatewayMulticastGroupsResult class]];
}

- (void) test_AWSEC2SearchTransitGatewayRoutesRequest {
    [self validateSecureCodingForClass:[AWSEC2SearchTransitGatewayRoutesRequest class]];
}

- (void) test_AWSEC2SearchTransitGatewayRoutesResult {
    [self validateSecureCodingForClass:[AWSEC2SearchTransitGatewayRoutesResult class]];
}

- (void) test_AWSEC2SecurityGroup {
    [self validateSecureCodingForClass:[AWSEC2SecurityGroup class]];
}

- (void) test_AWSEC2SecurityGroupIdentifier {
    [self validateSecureCodingForClass:[AWSEC2SecurityGroupIdentifier class]];
}

- (void) test_AWSEC2SecurityGroupReference {
    [self validateSecureCodingForClass:[AWSEC2SecurityGroupReference class]];
}

- (void) test_AWSEC2SecurityGroupRule {
    [self validateSecureCodingForClass:[AWSEC2SecurityGroupRule class]];
}

- (void) test_AWSEC2SecurityGroupRuleDescription {
    [self validateSecureCodingForClass:[AWSEC2SecurityGroupRuleDescription class]];
}

- (void) test_AWSEC2SecurityGroupRuleRequest {
    [self validateSecureCodingForClass:[AWSEC2SecurityGroupRuleRequest class]];
}

- (void) test_AWSEC2SecurityGroupRuleUpdate {
    [self validateSecureCodingForClass:[AWSEC2SecurityGroupRuleUpdate class]];
}

- (void) test_AWSEC2SendDiagnosticInterruptRequest {
    [self validateSecureCodingForClass:[AWSEC2SendDiagnosticInterruptRequest class]];
}

- (void) test_AWSEC2ServiceConfiguration {
    [self validateSecureCodingForClass:[AWSEC2ServiceConfiguration class]];
}

- (void) test_AWSEC2ServiceDetail {
    [self validateSecureCodingForClass:[AWSEC2ServiceDetail class]];
}

- (void) test_AWSEC2ServiceTypeDetail {
    [self validateSecureCodingForClass:[AWSEC2ServiceTypeDetail class]];
}

- (void) test_AWSEC2SlotDateTimeRangeRequest {
    [self validateSecureCodingForClass:[AWSEC2SlotDateTimeRangeRequest class]];
}

- (void) test_AWSEC2SlotStartTimeRangeRequest {
    [self validateSecureCodingForClass:[AWSEC2SlotStartTimeRangeRequest class]];
}

- (void) test_AWSEC2Snapshot {
    [self validateSecureCodingForClass:[AWSEC2Snapshot class]];
}

- (void) test_AWSEC2SnapshotDetail {
    [self validateSecureCodingForClass:[AWSEC2SnapshotDetail class]];
}

- (void) test_AWSEC2SnapshotDiskContainer {
    [self validateSecureCodingForClass:[AWSEC2SnapshotDiskContainer class]];
}

- (void) test_AWSEC2SnapshotInfo {
    [self validateSecureCodingForClass:[AWSEC2SnapshotInfo class]];
}

- (void) test_AWSEC2SnapshotRecycleBinInfo {
    [self validateSecureCodingForClass:[AWSEC2SnapshotRecycleBinInfo class]];
}

- (void) test_AWSEC2SnapshotTaskDetail {
    [self validateSecureCodingForClass:[AWSEC2SnapshotTaskDetail class]];
}

- (void) test_AWSEC2SnapshotTierStatus {
    [self validateSecureCodingForClass:[AWSEC2SnapshotTierStatus class]];
}

- (void) test_AWSEC2SpotCapacityRebalance {
    [self validateSecureCodingForClass:[AWSEC2SpotCapacityRebalance class]];
}

- (void) test_AWSEC2SpotDatafeedSubscription {
    [self validateSecureCodingForClass:[AWSEC2SpotDatafeedSubscription class]];
}

- (void) test_AWSEC2SpotFleetLaunchSpecification {
    [self validateSecureCodingForClass:[AWSEC2SpotFleetLaunchSpecification class]];
}

- (void) test_AWSEC2SpotFleetMonitoring {
    [self validateSecureCodingForClass:[AWSEC2SpotFleetMonitoring class]];
}

- (void) test_AWSEC2SpotFleetRequestConfig {
    [self validateSecureCodingForClass:[AWSEC2SpotFleetRequestConfig class]];
}

- (void) test_AWSEC2SpotFleetRequestConfigData {
    [self validateSecureCodingForClass:[AWSEC2SpotFleetRequestConfigData class]];
}

- (void) test_AWSEC2SpotFleetTagSpecification {
    [self validateSecureCodingForClass:[AWSEC2SpotFleetTagSpecification class]];
}

- (void) test_AWSEC2SpotInstanceRequest {
    [self validateSecureCodingForClass:[AWSEC2SpotInstanceRequest class]];
}

- (void) test_AWSEC2SpotInstanceStateFault {
    [self validateSecureCodingForClass:[AWSEC2SpotInstanceStateFault class]];
}

- (void) test_AWSEC2SpotInstanceStatus {
    [self validateSecureCodingForClass:[AWSEC2SpotInstanceStatus class]];
}

- (void) test_AWSEC2SpotMaintenanceStrategies {
    [self validateSecureCodingForClass:[AWSEC2SpotMaintenanceStrategies class]];
}

- (void) test_AWSEC2SpotMarketOptions {
    [self validateSecureCodingForClass:[AWSEC2SpotMarketOptions class]];
}

- (void) test_AWSEC2SpotOptions {
    [self validateSecureCodingForClass:[AWSEC2SpotOptions class]];
}

- (void) test_AWSEC2SpotOptionsRequest {
    [self validateSecureCodingForClass:[AWSEC2SpotOptionsRequest class]];
}

- (void) test_AWSEC2SpotPlacement {
    [self validateSecureCodingForClass:[AWSEC2SpotPlacement class]];
}

- (void) test_AWSEC2SpotPlacementScore {
    [self validateSecureCodingForClass:[AWSEC2SpotPlacementScore class]];
}

- (void) test_AWSEC2SpotPrice {
    [self validateSecureCodingForClass:[AWSEC2SpotPrice class]];
}

- (void) test_AWSEC2StaleIpPermission {
    [self validateSecureCodingForClass:[AWSEC2StaleIpPermission class]];
}

- (void) test_AWSEC2StaleSecurityGroup {
    [self validateSecureCodingForClass:[AWSEC2StaleSecurityGroup class]];
}

- (void) test_AWSEC2StartInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2StartInstancesRequest class]];
}

- (void) test_AWSEC2StartInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2StartInstancesResult class]];
}

- (void) test_AWSEC2StartNetworkInsightsAccessScopeAnalysisRequest {
    [self validateSecureCodingForClass:[AWSEC2StartNetworkInsightsAccessScopeAnalysisRequest class]];
}

- (void) test_AWSEC2StartNetworkInsightsAccessScopeAnalysisResult {
    [self validateSecureCodingForClass:[AWSEC2StartNetworkInsightsAccessScopeAnalysisResult class]];
}

- (void) test_AWSEC2StartNetworkInsightsAnalysisRequest {
    [self validateSecureCodingForClass:[AWSEC2StartNetworkInsightsAnalysisRequest class]];
}

- (void) test_AWSEC2StartNetworkInsightsAnalysisResult {
    [self validateSecureCodingForClass:[AWSEC2StartNetworkInsightsAnalysisResult class]];
}

- (void) test_AWSEC2StartVpcEndpointServicePrivateDnsVerificationRequest {
    [self validateSecureCodingForClass:[AWSEC2StartVpcEndpointServicePrivateDnsVerificationRequest class]];
}

- (void) test_AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult {
    [self validateSecureCodingForClass:[AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult class]];
}

- (void) test_AWSEC2StateReason {
    [self validateSecureCodingForClass:[AWSEC2StateReason class]];
}

- (void) test_AWSEC2StopInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2StopInstancesRequest class]];
}

- (void) test_AWSEC2StopInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2StopInstancesResult class]];
}

- (void) test_AWSEC2Storage {
    [self validateSecureCodingForClass:[AWSEC2Storage class]];
}

- (void) test_AWSEC2StorageLocation {
    [self validateSecureCodingForClass:[AWSEC2StorageLocation class]];
}

- (void) test_AWSEC2StoreImageTaskResult {
    [self validateSecureCodingForClass:[AWSEC2StoreImageTaskResult class]];
}

- (void) test_AWSEC2Subnet {
    [self validateSecureCodingForClass:[AWSEC2Subnet class]];
}

- (void) test_AWSEC2SubnetAssociation {
    [self validateSecureCodingForClass:[AWSEC2SubnetAssociation class]];
}

- (void) test_AWSEC2SubnetCidrBlockState {
    [self validateSecureCodingForClass:[AWSEC2SubnetCidrBlockState class]];
}

- (void) test_AWSEC2SubnetCidrReservation {
    [self validateSecureCodingForClass:[AWSEC2SubnetCidrReservation class]];
}

- (void) test_AWSEC2SubnetIpv6CidrBlockAssociation {
    [self validateSecureCodingForClass:[AWSEC2SubnetIpv6CidrBlockAssociation class]];
}

- (void) test_AWSEC2Subscription {
    [self validateSecureCodingForClass:[AWSEC2Subscription class]];
}

- (void) test_AWSEC2SuccessfulInstanceCreditSpecificationItem {
    [self validateSecureCodingForClass:[AWSEC2SuccessfulInstanceCreditSpecificationItem class]];
}

- (void) test_AWSEC2SuccessfulQueuedPurchaseDeletion {
    [self validateSecureCodingForClass:[AWSEC2SuccessfulQueuedPurchaseDeletion class]];
}

- (void) test_AWSEC2Tag {
    [self validateSecureCodingForClass:[AWSEC2Tag class]];
}

- (void) test_AWSEC2TagDescription {
    [self validateSecureCodingForClass:[AWSEC2TagDescription class]];
}

- (void) test_AWSEC2TagSpecification {
    [self validateSecureCodingForClass:[AWSEC2TagSpecification class]];
}

- (void) test_AWSEC2TargetCapacitySpecification {
    [self validateSecureCodingForClass:[AWSEC2TargetCapacitySpecification class]];
}

- (void) test_AWSEC2TargetCapacitySpecificationRequest {
    [self validateSecureCodingForClass:[AWSEC2TargetCapacitySpecificationRequest class]];
}

- (void) test_AWSEC2TargetConfiguration {
    [self validateSecureCodingForClass:[AWSEC2TargetConfiguration class]];
}

- (void) test_AWSEC2TargetConfigurationRequest {
    [self validateSecureCodingForClass:[AWSEC2TargetConfigurationRequest class]];
}

- (void) test_AWSEC2TargetGroup {
    [self validateSecureCodingForClass:[AWSEC2TargetGroup class]];
}

- (void) test_AWSEC2TargetGroupsConfig {
    [self validateSecureCodingForClass:[AWSEC2TargetGroupsConfig class]];
}

- (void) test_AWSEC2TargetNetwork {
    [self validateSecureCodingForClass:[AWSEC2TargetNetwork class]];
}

- (void) test_AWSEC2TargetReservationValue {
    [self validateSecureCodingForClass:[AWSEC2TargetReservationValue class]];
}

- (void) test_AWSEC2TerminateClientVpnConnectionsRequest {
    [self validateSecureCodingForClass:[AWSEC2TerminateClientVpnConnectionsRequest class]];
}

- (void) test_AWSEC2TerminateClientVpnConnectionsResult {
    [self validateSecureCodingForClass:[AWSEC2TerminateClientVpnConnectionsResult class]];
}

- (void) test_AWSEC2TerminateConnectionStatus {
    [self validateSecureCodingForClass:[AWSEC2TerminateConnectionStatus class]];
}

- (void) test_AWSEC2TerminateInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2TerminateInstancesRequest class]];
}

- (void) test_AWSEC2TerminateInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2TerminateInstancesResult class]];
}

- (void) test_AWSEC2ThroughResourcesStatement {
    [self validateSecureCodingForClass:[AWSEC2ThroughResourcesStatement class]];
}

- (void) test_AWSEC2ThroughResourcesStatementRequest {
    [self validateSecureCodingForClass:[AWSEC2ThroughResourcesStatementRequest class]];
}

- (void) test_AWSEC2TotalLocalStorageGB {
    [self validateSecureCodingForClass:[AWSEC2TotalLocalStorageGB class]];
}

- (void) test_AWSEC2TotalLocalStorageGBRequest {
    [self validateSecureCodingForClass:[AWSEC2TotalLocalStorageGBRequest class]];
}

- (void) test_AWSEC2TrafficMirrorFilter {
    [self validateSecureCodingForClass:[AWSEC2TrafficMirrorFilter class]];
}

- (void) test_AWSEC2TrafficMirrorFilterRule {
    [self validateSecureCodingForClass:[AWSEC2TrafficMirrorFilterRule class]];
}

- (void) test_AWSEC2TrafficMirrorPortRange {
    [self validateSecureCodingForClass:[AWSEC2TrafficMirrorPortRange class]];
}

- (void) test_AWSEC2TrafficMirrorPortRangeRequest {
    [self validateSecureCodingForClass:[AWSEC2TrafficMirrorPortRangeRequest class]];
}

- (void) test_AWSEC2TrafficMirrorSession {
    [self validateSecureCodingForClass:[AWSEC2TrafficMirrorSession class]];
}

- (void) test_AWSEC2TrafficMirrorTarget {
    [self validateSecureCodingForClass:[AWSEC2TrafficMirrorTarget class]];
}

- (void) test_AWSEC2TransitGateway {
    [self validateSecureCodingForClass:[AWSEC2TransitGateway class]];
}

- (void) test_AWSEC2TransitGatewayAssociation {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayAssociation class]];
}

- (void) test_AWSEC2TransitGatewayAttachment {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayAttachment class]];
}

- (void) test_AWSEC2TransitGatewayAttachmentAssociation {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayAttachmentAssociation class]];
}

- (void) test_AWSEC2TransitGatewayAttachmentBgpConfiguration {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayAttachmentBgpConfiguration class]];
}

- (void) test_AWSEC2TransitGatewayAttachmentPropagation {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayAttachmentPropagation class]];
}

- (void) test_AWSEC2TransitGatewayConnect {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayConnect class]];
}

- (void) test_AWSEC2TransitGatewayConnectOptions {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayConnectOptions class]];
}

- (void) test_AWSEC2TransitGatewayConnectPeer {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayConnectPeer class]];
}

- (void) test_AWSEC2TransitGatewayConnectPeerConfiguration {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayConnectPeerConfiguration class]];
}

- (void) test_AWSEC2TransitGatewayConnectRequestBgpOptions {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayConnectRequestBgpOptions class]];
}

- (void) test_AWSEC2TransitGatewayMulticastDeregisteredGroupMembers {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayMulticastDeregisteredGroupMembers class]];
}

- (void) test_AWSEC2TransitGatewayMulticastDeregisteredGroupSources {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayMulticastDeregisteredGroupSources class]];
}

- (void) test_AWSEC2TransitGatewayMulticastDomain {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayMulticastDomain class]];
}

- (void) test_AWSEC2TransitGatewayMulticastDomainAssociation {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayMulticastDomainAssociation class]];
}

- (void) test_AWSEC2TransitGatewayMulticastDomainAssociations {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayMulticastDomainAssociations class]];
}

- (void) test_AWSEC2TransitGatewayMulticastDomainOptions {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayMulticastDomainOptions class]];
}

- (void) test_AWSEC2TransitGatewayMulticastGroup {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayMulticastGroup class]];
}

- (void) test_AWSEC2TransitGatewayMulticastRegisteredGroupMembers {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayMulticastRegisteredGroupMembers class]];
}

- (void) test_AWSEC2TransitGatewayMulticastRegisteredGroupSources {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayMulticastRegisteredGroupSources class]];
}

- (void) test_AWSEC2TransitGatewayOptions {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayOptions class]];
}

- (void) test_AWSEC2TransitGatewayPeeringAttachment {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayPeeringAttachment class]];
}

- (void) test_AWSEC2TransitGatewayPeeringAttachmentOptions {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayPeeringAttachmentOptions class]];
}

- (void) test_AWSEC2TransitGatewayPolicyRule {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayPolicyRule class]];
}

- (void) test_AWSEC2TransitGatewayPolicyRuleMetaData {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayPolicyRuleMetaData class]];
}

- (void) test_AWSEC2TransitGatewayPolicyTable {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayPolicyTable class]];
}

- (void) test_AWSEC2TransitGatewayPolicyTableAssociation {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayPolicyTableAssociation class]];
}

- (void) test_AWSEC2TransitGatewayPolicyTableEntry {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayPolicyTableEntry class]];
}

- (void) test_AWSEC2TransitGatewayPrefixListAttachment {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayPrefixListAttachment class]];
}

- (void) test_AWSEC2TransitGatewayPrefixListReference {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayPrefixListReference class]];
}

- (void) test_AWSEC2TransitGatewayPropagation {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayPropagation class]];
}

- (void) test_AWSEC2TransitGatewayRequestOptions {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayRequestOptions class]];
}

- (void) test_AWSEC2TransitGatewayRoute {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayRoute class]];
}

- (void) test_AWSEC2TransitGatewayRouteAttachment {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayRouteAttachment class]];
}

- (void) test_AWSEC2TransitGatewayRouteTable {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayRouteTable class]];
}

- (void) test_AWSEC2TransitGatewayRouteTableAnnouncement {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayRouteTableAnnouncement class]];
}

- (void) test_AWSEC2TransitGatewayRouteTableAssociation {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayRouteTableAssociation class]];
}

- (void) test_AWSEC2TransitGatewayRouteTablePropagation {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayRouteTablePropagation class]];
}

- (void) test_AWSEC2TransitGatewayRouteTableRoute {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayRouteTableRoute class]];
}

- (void) test_AWSEC2TransitGatewayVpcAttachment {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayVpcAttachment class]];
}

- (void) test_AWSEC2TransitGatewayVpcAttachmentOptions {
    [self validateSecureCodingForClass:[AWSEC2TransitGatewayVpcAttachmentOptions class]];
}

- (void) test_AWSEC2TrunkInterfaceAssociation {
    [self validateSecureCodingForClass:[AWSEC2TrunkInterfaceAssociation class]];
}

- (void) test_AWSEC2TunnelOption {
    [self validateSecureCodingForClass:[AWSEC2TunnelOption class]];
}

- (void) test_AWSEC2UnassignIpv6AddressesRequest {
    [self validateSecureCodingForClass:[AWSEC2UnassignIpv6AddressesRequest class]];
}

- (void) test_AWSEC2UnassignIpv6AddressesResult {
    [self validateSecureCodingForClass:[AWSEC2UnassignIpv6AddressesResult class]];
}

- (void) test_AWSEC2UnassignPrivateIpAddressesRequest {
    [self validateSecureCodingForClass:[AWSEC2UnassignPrivateIpAddressesRequest class]];
}

- (void) test_AWSEC2UnassignPrivateNatGatewayAddressRequest {
    [self validateSecureCodingForClass:[AWSEC2UnassignPrivateNatGatewayAddressRequest class]];
}

- (void) test_AWSEC2UnassignPrivateNatGatewayAddressResult {
    [self validateSecureCodingForClass:[AWSEC2UnassignPrivateNatGatewayAddressResult class]];
}

- (void) test_AWSEC2UnmonitorInstancesRequest {
    [self validateSecureCodingForClass:[AWSEC2UnmonitorInstancesRequest class]];
}

- (void) test_AWSEC2UnmonitorInstancesResult {
    [self validateSecureCodingForClass:[AWSEC2UnmonitorInstancesResult class]];
}

- (void) test_AWSEC2UnsuccessfulInstanceCreditSpecificationItem {
    [self validateSecureCodingForClass:[AWSEC2UnsuccessfulInstanceCreditSpecificationItem class]];
}

- (void) test_AWSEC2UnsuccessfulInstanceCreditSpecificationItemError {
    [self validateSecureCodingForClass:[AWSEC2UnsuccessfulInstanceCreditSpecificationItemError class]];
}

- (void) test_AWSEC2UnsuccessfulItem {
    [self validateSecureCodingForClass:[AWSEC2UnsuccessfulItem class]];
}

- (void) test_AWSEC2UnsuccessfulItemError {
    [self validateSecureCodingForClass:[AWSEC2UnsuccessfulItemError class]];
}

- (void) test_AWSEC2UpdateSecurityGroupRuleDescriptionsEgressRequest {
    [self validateSecureCodingForClass:[AWSEC2UpdateSecurityGroupRuleDescriptionsEgressRequest class]];
}

- (void) test_AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult {
    [self validateSecureCodingForClass:[AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult class]];
}

- (void) test_AWSEC2UpdateSecurityGroupRuleDescriptionsIngressRequest {
    [self validateSecureCodingForClass:[AWSEC2UpdateSecurityGroupRuleDescriptionsIngressRequest class]];
}

- (void) test_AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult {
    [self validateSecureCodingForClass:[AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult class]];
}

- (void) test_AWSEC2UserBucket {
    [self validateSecureCodingForClass:[AWSEC2UserBucket class]];
}

- (void) test_AWSEC2UserBucketDetails {
    [self validateSecureCodingForClass:[AWSEC2UserBucketDetails class]];
}

- (void) test_AWSEC2UserData {
    [self validateSecureCodingForClass:[AWSEC2UserData class]];
}

- (void) test_AWSEC2UserIdGroupPair {
    [self validateSecureCodingForClass:[AWSEC2UserIdGroupPair class]];
}

- (void) test_AWSEC2VCpuCountRange {
    [self validateSecureCodingForClass:[AWSEC2VCpuCountRange class]];
}

- (void) test_AWSEC2VCpuCountRangeRequest {
    [self validateSecureCodingForClass:[AWSEC2VCpuCountRangeRequest class]];
}

- (void) test_AWSEC2VCpuInfo {
    [self validateSecureCodingForClass:[AWSEC2VCpuInfo class]];
}

- (void) test_AWSEC2ValidationError {
    [self validateSecureCodingForClass:[AWSEC2ValidationError class]];
}

- (void) test_AWSEC2ValidationWarning {
    [self validateSecureCodingForClass:[AWSEC2ValidationWarning class]];
}

- (void) test_AWSEC2VerifiedAccessEndpoint {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessEndpoint class]];
}

- (void) test_AWSEC2VerifiedAccessEndpointEniOptions {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessEndpointEniOptions class]];
}

- (void) test_AWSEC2VerifiedAccessEndpointLoadBalancerOptions {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessEndpointLoadBalancerOptions class]];
}

- (void) test_AWSEC2VerifiedAccessEndpointStatus {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessEndpointStatus class]];
}

- (void) test_AWSEC2VerifiedAccessGroup {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessGroup class]];
}

- (void) test_AWSEC2VerifiedAccessInstance {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessInstance class]];
}

- (void) test_AWSEC2VerifiedAccessInstanceLoggingConfiguration {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessInstanceLoggingConfiguration class]];
}

- (void) test_AWSEC2VerifiedAccessLogCloudWatchLogsDestination {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessLogCloudWatchLogsDestination class]];
}

- (void) test_AWSEC2VerifiedAccessLogCloudWatchLogsDestinationOptions {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessLogCloudWatchLogsDestinationOptions class]];
}

- (void) test_AWSEC2VerifiedAccessLogDeliveryStatus {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessLogDeliveryStatus class]];
}

- (void) test_AWSEC2VerifiedAccessLogKinesisDataFirehoseDestination {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessLogKinesisDataFirehoseDestination class]];
}

- (void) test_AWSEC2VerifiedAccessLogKinesisDataFirehoseDestinationOptions {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessLogKinesisDataFirehoseDestinationOptions class]];
}

- (void) test_AWSEC2VerifiedAccessLogOptions {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessLogOptions class]];
}

- (void) test_AWSEC2VerifiedAccessLogS3Destination {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessLogS3Destination class]];
}

- (void) test_AWSEC2VerifiedAccessLogS3DestinationOptions {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessLogS3DestinationOptions class]];
}

- (void) test_AWSEC2VerifiedAccessLogs {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessLogs class]];
}

- (void) test_AWSEC2VerifiedAccessTrustProvider {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessTrustProvider class]];
}

- (void) test_AWSEC2VerifiedAccessTrustProviderCondensed {
    [self validateSecureCodingForClass:[AWSEC2VerifiedAccessTrustProviderCondensed class]];
}

- (void) test_AWSEC2VgwTelemetry {
    [self validateSecureCodingForClass:[AWSEC2VgwTelemetry class]];
}

- (void) test_AWSEC2Volume {
    [self validateSecureCodingForClass:[AWSEC2Volume class]];
}

- (void) test_AWSEC2VolumeAttachment {
    [self validateSecureCodingForClass:[AWSEC2VolumeAttachment class]];
}

- (void) test_AWSEC2VolumeDetail {
    [self validateSecureCodingForClass:[AWSEC2VolumeDetail class]];
}

- (void) test_AWSEC2VolumeModification {
    [self validateSecureCodingForClass:[AWSEC2VolumeModification class]];
}

- (void) test_AWSEC2VolumeStatusAction {
    [self validateSecureCodingForClass:[AWSEC2VolumeStatusAction class]];
}

- (void) test_AWSEC2VolumeStatusAttachmentStatus {
    [self validateSecureCodingForClass:[AWSEC2VolumeStatusAttachmentStatus class]];
}

- (void) test_AWSEC2VolumeStatusDetails {
    [self validateSecureCodingForClass:[AWSEC2VolumeStatusDetails class]];
}

- (void) test_AWSEC2VolumeStatusEvent {
    [self validateSecureCodingForClass:[AWSEC2VolumeStatusEvent class]];
}

- (void) test_AWSEC2VolumeStatusInfo {
    [self validateSecureCodingForClass:[AWSEC2VolumeStatusInfo class]];
}

- (void) test_AWSEC2VolumeStatusItem {
    [self validateSecureCodingForClass:[AWSEC2VolumeStatusItem class]];
}

- (void) test_AWSEC2Vpc {
    [self validateSecureCodingForClass:[AWSEC2Vpc class]];
}

- (void) test_AWSEC2VpcAttachment {
    [self validateSecureCodingForClass:[AWSEC2VpcAttachment class]];
}

- (void) test_AWSEC2VpcCidrBlockAssociation {
    [self validateSecureCodingForClass:[AWSEC2VpcCidrBlockAssociation class]];
}

- (void) test_AWSEC2VpcCidrBlockState {
    [self validateSecureCodingForClass:[AWSEC2VpcCidrBlockState class]];
}

- (void) test_AWSEC2VpcClassicLink {
    [self validateSecureCodingForClass:[AWSEC2VpcClassicLink class]];
}

- (void) test_AWSEC2VpcEndpoint {
    [self validateSecureCodingForClass:[AWSEC2VpcEndpoint class]];
}

- (void) test_AWSEC2VpcEndpointConnection {
    [self validateSecureCodingForClass:[AWSEC2VpcEndpointConnection class]];
}

- (void) test_AWSEC2VpcIpv6CidrBlockAssociation {
    [self validateSecureCodingForClass:[AWSEC2VpcIpv6CidrBlockAssociation class]];
}

- (void) test_AWSEC2VpcPeeringConnection {
    [self validateSecureCodingForClass:[AWSEC2VpcPeeringConnection class]];
}

- (void) test_AWSEC2VpcPeeringConnectionOptionsDescription {
    [self validateSecureCodingForClass:[AWSEC2VpcPeeringConnectionOptionsDescription class]];
}

- (void) test_AWSEC2VpcPeeringConnectionStateReason {
    [self validateSecureCodingForClass:[AWSEC2VpcPeeringConnectionStateReason class]];
}

- (void) test_AWSEC2VpcPeeringConnectionVpcInfo {
    [self validateSecureCodingForClass:[AWSEC2VpcPeeringConnectionVpcInfo class]];
}

- (void) test_AWSEC2VpnConnection {
    [self validateSecureCodingForClass:[AWSEC2VpnConnection class]];
}

- (void) test_AWSEC2VpnConnectionDeviceType {
    [self validateSecureCodingForClass:[AWSEC2VpnConnectionDeviceType class]];
}

- (void) test_AWSEC2VpnConnectionOptions {
    [self validateSecureCodingForClass:[AWSEC2VpnConnectionOptions class]];
}

- (void) test_AWSEC2VpnConnectionOptionsSpecification {
    [self validateSecureCodingForClass:[AWSEC2VpnConnectionOptionsSpecification class]];
}

- (void) test_AWSEC2VpnGateway {
    [self validateSecureCodingForClass:[AWSEC2VpnGateway class]];
}

- (void) test_AWSEC2VpnStaticRoute {
    [self validateSecureCodingForClass:[AWSEC2VpnStaticRoute class]];
}

- (void) test_AWSEC2VpnTunnelLogOptions {
    [self validateSecureCodingForClass:[AWSEC2VpnTunnelLogOptions class]];
}

- (void) test_AWSEC2VpnTunnelLogOptionsSpecification {
    [self validateSecureCodingForClass:[AWSEC2VpnTunnelLogOptionsSpecification class]];
}

- (void) test_AWSEC2VpnTunnelOptionsSpecification {
    [self validateSecureCodingForClass:[AWSEC2VpnTunnelOptionsSpecification class]];
}

- (void) test_AWSEC2WithdrawByoipCidrRequest {
    [self validateSecureCodingForClass:[AWSEC2WithdrawByoipCidrRequest class]];
}

- (void) test_AWSEC2WithdrawByoipCidrResult {
    [self validateSecureCodingForClass:[AWSEC2WithdrawByoipCidrResult class]];
}

@end

