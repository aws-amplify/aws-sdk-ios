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

FOUNDATION_EXPORT NSString *const AWSDirectconnectErrorDomain;

typedef NS_ENUM(NSInteger, AWSDirectconnectErrorType) {
    AWSDirectconnectErrorUnknown,
    AWSDirectconnectErrorDirectConnectClient,
    AWSDirectconnectErrorDirectConnectServer,
    AWSDirectconnectErrorDuplicateTagKeys,
    AWSDirectconnectErrorTooManyTags,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectAddressFamily) {
    AWSDirectconnectAddressFamilyUnknown,
    AWSDirectconnectAddressFamilyIpv4,
    AWSDirectconnectAddressFamilyIpv6,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectBGPPeerState) {
    AWSDirectconnectBGPPeerStateUnknown,
    AWSDirectconnectBGPPeerStateVerifying,
    AWSDirectconnectBGPPeerStatePending,
    AWSDirectconnectBGPPeerStateAvailable,
    AWSDirectconnectBGPPeerStateDeleting,
    AWSDirectconnectBGPPeerStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectBGPStatus) {
    AWSDirectconnectBGPStatusUnknown,
    AWSDirectconnectBGPStatusUp,
    AWSDirectconnectBGPStatusDown,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectConnectionState) {
    AWSDirectconnectConnectionStateUnknown,
    AWSDirectconnectConnectionStateOrdering,
    AWSDirectconnectConnectionStateRequested,
    AWSDirectconnectConnectionStatePending,
    AWSDirectconnectConnectionStateAvailable,
    AWSDirectconnectConnectionStateDown,
    AWSDirectconnectConnectionStateDeleting,
    AWSDirectconnectConnectionStateDeleted,
    AWSDirectconnectConnectionStateRejected,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectDirectConnectGatewayAssociationProposalState) {
    AWSDirectconnectDirectConnectGatewayAssociationProposalStateUnknown,
    AWSDirectconnectDirectConnectGatewayAssociationProposalStateRequested,
    AWSDirectconnectDirectConnectGatewayAssociationProposalStateAccepted,
    AWSDirectconnectDirectConnectGatewayAssociationProposalStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectDirectConnectGatewayAssociationState) {
    AWSDirectconnectDirectConnectGatewayAssociationStateUnknown,
    AWSDirectconnectDirectConnectGatewayAssociationStateAssociating,
    AWSDirectconnectDirectConnectGatewayAssociationStateAssociated,
    AWSDirectconnectDirectConnectGatewayAssociationStateDisassociating,
    AWSDirectconnectDirectConnectGatewayAssociationStateDisassociated,
    AWSDirectconnectDirectConnectGatewayAssociationStateUpdating,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectDirectConnectGatewayAttachmentState) {
    AWSDirectconnectDirectConnectGatewayAttachmentStateUnknown,
    AWSDirectconnectDirectConnectGatewayAttachmentStateAttaching,
    AWSDirectconnectDirectConnectGatewayAttachmentStateAttached,
    AWSDirectconnectDirectConnectGatewayAttachmentStateDetaching,
    AWSDirectconnectDirectConnectGatewayAttachmentStateDetached,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectDirectConnectGatewayAttachmentType) {
    AWSDirectconnectDirectConnectGatewayAttachmentTypeUnknown,
    AWSDirectconnectDirectConnectGatewayAttachmentTypeTransitVirtualInterface,
    AWSDirectconnectDirectConnectGatewayAttachmentTypePrivateVirtualInterface,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectDirectConnectGatewayState) {
    AWSDirectconnectDirectConnectGatewayStateUnknown,
    AWSDirectconnectDirectConnectGatewayStatePending,
    AWSDirectconnectDirectConnectGatewayStateAvailable,
    AWSDirectconnectDirectConnectGatewayStateDeleting,
    AWSDirectconnectDirectConnectGatewayStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectGatewayType) {
    AWSDirectconnectGatewayTypeUnknown,
    AWSDirectconnectGatewayTypeVirtualPrivateGateway,
    AWSDirectconnectGatewayTypeTransitGateway,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectHasLogicalRedundancy) {
    AWSDirectconnectHasLogicalRedundancyUnknown,
    AWSDirectconnectHasLogicalRedundancyYes,
    AWSDirectconnectHasLogicalRedundancyNo,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectInterconnectState) {
    AWSDirectconnectInterconnectStateUnknown,
    AWSDirectconnectInterconnectStateRequested,
    AWSDirectconnectInterconnectStatePending,
    AWSDirectconnectInterconnectStateAvailable,
    AWSDirectconnectInterconnectStateDown,
    AWSDirectconnectInterconnectStateDeleting,
    AWSDirectconnectInterconnectStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectLagState) {
    AWSDirectconnectLagStateUnknown,
    AWSDirectconnectLagStateRequested,
    AWSDirectconnectLagStatePending,
    AWSDirectconnectLagStateAvailable,
    AWSDirectconnectLagStateDown,
    AWSDirectconnectLagStateDeleting,
    AWSDirectconnectLagStateDeleted,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectLoaContentType) {
    AWSDirectconnectLoaContentTypeUnknown,
    AWSDirectconnectLoaContentTypeApplicationPdf,
};

typedef NS_ENUM(NSInteger, AWSDirectconnectVirtualInterfaceState) {
    AWSDirectconnectVirtualInterfaceStateUnknown,
    AWSDirectconnectVirtualInterfaceStateConfirming,
    AWSDirectconnectVirtualInterfaceStateVerifying,
    AWSDirectconnectVirtualInterfaceStatePending,
    AWSDirectconnectVirtualInterfaceStateAvailable,
    AWSDirectconnectVirtualInterfaceStateDown,
    AWSDirectconnectVirtualInterfaceStateDeleting,
    AWSDirectconnectVirtualInterfaceStateDeleted,
    AWSDirectconnectVirtualInterfaceStateRejected,
};

@class AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalRequest;
@class AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult;
@class AWSDirectconnectAllocateConnectionOnInterconnectRequest;
@class AWSDirectconnectAllocateHostedConnectionRequest;
@class AWSDirectconnectAllocatePrivateVirtualInterfaceRequest;
@class AWSDirectconnectAllocatePublicVirtualInterfaceRequest;
@class AWSDirectconnectAllocateTransitVirtualInterfaceRequest;
@class AWSDirectconnectAllocateTransitVirtualInterfaceResult;
@class AWSDirectconnectAssociateConnectionWithLagRequest;
@class AWSDirectconnectAssociateHostedConnectionRequest;
@class AWSDirectconnectAssociateVirtualInterfaceRequest;
@class AWSDirectconnectAssociatedGateway;
@class AWSDirectconnectBGPPeer;
@class AWSDirectconnectConfirmConnectionRequest;
@class AWSDirectconnectConfirmConnectionResponse;
@class AWSDirectconnectConfirmPrivateVirtualInterfaceRequest;
@class AWSDirectconnectConfirmPrivateVirtualInterfaceResponse;
@class AWSDirectconnectConfirmPublicVirtualInterfaceRequest;
@class AWSDirectconnectConfirmPublicVirtualInterfaceResponse;
@class AWSDirectconnectConfirmTransitVirtualInterfaceRequest;
@class AWSDirectconnectConfirmTransitVirtualInterfaceResponse;
@class AWSDirectconnectConnection;
@class AWSDirectconnectConnections;
@class AWSDirectconnectCreateBGPPeerRequest;
@class AWSDirectconnectCreateBGPPeerResponse;
@class AWSDirectconnectCreateConnectionRequest;
@class AWSDirectconnectCreateDirectConnectGatewayAssociationProposalRequest;
@class AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult;
@class AWSDirectconnectCreateDirectConnectGatewayAssociationRequest;
@class AWSDirectconnectCreateDirectConnectGatewayAssociationResult;
@class AWSDirectconnectCreateDirectConnectGatewayRequest;
@class AWSDirectconnectCreateDirectConnectGatewayResult;
@class AWSDirectconnectCreateInterconnectRequest;
@class AWSDirectconnectCreateLagRequest;
@class AWSDirectconnectCreatePrivateVirtualInterfaceRequest;
@class AWSDirectconnectCreatePublicVirtualInterfaceRequest;
@class AWSDirectconnectCreateTransitVirtualInterfaceRequest;
@class AWSDirectconnectCreateTransitVirtualInterfaceResult;
@class AWSDirectconnectDeleteBGPPeerRequest;
@class AWSDirectconnectDeleteBGPPeerResponse;
@class AWSDirectconnectDeleteConnectionRequest;
@class AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalRequest;
@class AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult;
@class AWSDirectconnectDeleteDirectConnectGatewayAssociationRequest;
@class AWSDirectconnectDeleteDirectConnectGatewayAssociationResult;
@class AWSDirectconnectDeleteDirectConnectGatewayRequest;
@class AWSDirectconnectDeleteDirectConnectGatewayResult;
@class AWSDirectconnectDeleteInterconnectRequest;
@class AWSDirectconnectDeleteInterconnectResponse;
@class AWSDirectconnectDeleteLagRequest;
@class AWSDirectconnectDeleteVirtualInterfaceRequest;
@class AWSDirectconnectDeleteVirtualInterfaceResponse;
@class AWSDirectconnectDescribeConnectionLoaRequest;
@class AWSDirectconnectDescribeConnectionLoaResponse;
@class AWSDirectconnectDescribeConnectionsOnInterconnectRequest;
@class AWSDirectconnectDescribeConnectionsRequest;
@class AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsRequest;
@class AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult;
@class AWSDirectconnectDescribeDirectConnectGatewayAssociationsRequest;
@class AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult;
@class AWSDirectconnectDescribeDirectConnectGatewayAttachmentsRequest;
@class AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult;
@class AWSDirectconnectDescribeDirectConnectGatewaysRequest;
@class AWSDirectconnectDescribeDirectConnectGatewaysResult;
@class AWSDirectconnectDescribeHostedConnectionsRequest;
@class AWSDirectconnectDescribeInterconnectLoaRequest;
@class AWSDirectconnectDescribeInterconnectLoaResponse;
@class AWSDirectconnectDescribeInterconnectsRequest;
@class AWSDirectconnectDescribeLagsRequest;
@class AWSDirectconnectDescribeLoaRequest;
@class AWSDirectconnectDescribeTagsRequest;
@class AWSDirectconnectDescribeTagsResponse;
@class AWSDirectconnectDescribeVirtualInterfacesRequest;
@class AWSDirectconnectDirectConnectGateway;
@class AWSDirectconnectDirectConnectGatewayAssociation;
@class AWSDirectconnectDirectConnectGatewayAssociationProposal;
@class AWSDirectconnectDirectConnectGatewayAttachment;
@class AWSDirectconnectDisassociateConnectionFromLagRequest;
@class AWSDirectconnectInterconnect;
@class AWSDirectconnectInterconnects;
@class AWSDirectconnectLag;
@class AWSDirectconnectLags;
@class AWSDirectconnectListVirtualInterfaceTestHistoryRequest;
@class AWSDirectconnectListVirtualInterfaceTestHistoryResponse;
@class AWSDirectconnectLoa;
@class AWSDirectconnectLocation;
@class AWSDirectconnectLocations;
@class AWSDirectconnectLatestBGPPeer;
@class AWSDirectconnectLatestPrivateVirtualInterface;
@class AWSDirectconnectLatestPrivateVirtualInterfaceAllocation;
@class AWSDirectconnectLatestPublicVirtualInterface;
@class AWSDirectconnectLatestPublicVirtualInterfaceAllocation;
@class AWSDirectconnectLatestTransitVirtualInterface;
@class AWSDirectconnectLatestTransitVirtualInterfaceAllocation;
@class AWSDirectconnectResourceTag;
@class AWSDirectconnectRouteFilterPrefix;
@class AWSDirectconnectStartBgpFailoverTestRequest;
@class AWSDirectconnectStartBgpFailoverTestResponse;
@class AWSDirectconnectStopBgpFailoverTestRequest;
@class AWSDirectconnectStopBgpFailoverTestResponse;
@class AWSDirectconnectTag;
@class AWSDirectconnectTagResourceRequest;
@class AWSDirectconnectTagResourceResponse;
@class AWSDirectconnectUntagResourceRequest;
@class AWSDirectconnectUntagResourceResponse;
@class AWSDirectconnectUpdateDirectConnectGatewayAssociationRequest;
@class AWSDirectconnectUpdateDirectConnectGatewayAssociationResult;
@class AWSDirectconnectUpdateLagRequest;
@class AWSDirectconnectUpdateVirtualInterfaceAttributesRequest;
@class AWSDirectconnectVirtualGateway;
@class AWSDirectconnectVirtualGateways;
@class AWSDirectconnectVirtualInterface;
@class AWSDirectconnectVirtualInterfaceTestHistory;
@class AWSDirectconnectVirtualInterfaces;

/**
 
 */
@interface AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalRequest : AWSRequest


/**
 <p>The ID of the AWS account that owns the virtual private gateway or transit gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associatedGatewayOwnerAccount;

/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>Overrides the Amazon VPC prefixes advertised to the Direct Connect gateway.</p><p>For information about how to set the prefixes, see <a href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/multi-account-associate-vgw.html#allowed-prefixes">Allowed Prefixes</a> in the <i>AWS Direct Connect User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectRouteFilterPrefix *> * _Nullable overrideAllowedPrefixesToDirectConnectGateway;

/**
 <p>The ID of the request proposal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable proposalId;

@end

/**
 
 */
@interface AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult : AWSModel


/**
 <p>Information about an association between a Direct Connect gateway and a virtual private gateway or transit gateway.</p>
 */
@property (nonatomic, strong) AWSDirectconnectDirectConnectGatewayAssociation * _Nullable directConnectGatewayAssociation;

@end

/**
 
 */
@interface AWSDirectconnectAllocateConnectionOnInterconnectRequest : AWSRequest


/**
 <p>The bandwidth of the connection. The possible values are 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, and 10Gbps. Note that only those AWS Direct Connect Partners who have met specific requirements are allowed to create a 1Gbps, 2Gbps, 5Gbps or 10Gbps hosted connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bandwidth;

/**
 <p>The name of the provisioned connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionName;

/**
 <p>The ID of the interconnect on which the connection will be provisioned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable interconnectId;

/**
 <p>The ID of the AWS account of the customer for whom the connection will be provisioned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

/**
 <p>The dedicated VLAN provisioned to the connection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable vlan;

@end

/**
 
 */
@interface AWSDirectconnectAllocateHostedConnectionRequest : AWSRequest


/**
 <p>The bandwidth of the connection. The possible values are 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, and 10Gbps. Note that only those AWS Direct Connect Partners who have met specific requirements are allowed to create a 1Gbps, 2Gbps, 5Gbps or 10Gbps hosted connection. </p>
 */
@property (nonatomic, strong) NSString * _Nullable bandwidth;

/**
 <p>The ID of the interconnect or LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The name of the hosted connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionName;

/**
 <p>The ID of the AWS account ID of the customer for the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

/**
 <p>The tags associated with the connection.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

/**
 <p>The dedicated VLAN provisioned to the hosted connection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable vlan;

@end

/**
 
 */
@interface AWSDirectconnectAllocatePrivateVirtualInterfaceRequest : AWSRequest


/**
 <p>The ID of the connection on which the private virtual interface is provisioned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>Information about the private virtual interface.</p>
 */
@property (nonatomic, strong) AWSDirectconnectLatestPrivateVirtualInterfaceAllocation * _Nullable latestPrivateVirtualInterfaceAllocation;

/**
 <p>The ID of the AWS account that owns the virtual private interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

@end

/**
 
 */
@interface AWSDirectconnectAllocatePublicVirtualInterfaceRequest : AWSRequest


/**
 <p>The ID of the connection on which the public virtual interface is provisioned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>Information about the public virtual interface.</p>
 */
@property (nonatomic, strong) AWSDirectconnectLatestPublicVirtualInterfaceAllocation * _Nullable latestPublicVirtualInterfaceAllocation;

/**
 <p>The ID of the AWS account that owns the public virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

@end

/**
 
 */
@interface AWSDirectconnectAllocateTransitVirtualInterfaceRequest : AWSRequest


/**
 <p>The ID of the connection on which the transit virtual interface is provisioned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>Information about the transit virtual interface.</p>
 */
@property (nonatomic, strong) AWSDirectconnectLatestTransitVirtualInterfaceAllocation * _Nullable latestTransitVirtualInterfaceAllocation;

/**
 <p>The ID of the AWS account that owns the transit virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

@end

/**
 
 */
@interface AWSDirectconnectAllocateTransitVirtualInterfaceResult : AWSModel


/**
 <p>Information about a virtual interface.</p>
 */
@property (nonatomic, strong) AWSDirectconnectVirtualInterface * _Nullable virtualInterface;

@end

/**
 
 */
@interface AWSDirectconnectAssociateConnectionWithLagRequest : AWSRequest


/**
 <p>The ID of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The ID of the LAG with which to associate the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lagId;

@end

/**
 
 */
@interface AWSDirectconnectAssociateHostedConnectionRequest : AWSRequest


/**
 <p>The ID of the hosted connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The ID of the interconnect or the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentConnectionId;

@end

/**
 
 */
@interface AWSDirectconnectAssociateVirtualInterfaceRequest : AWSRequest


/**
 <p>The ID of the LAG or connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The ID of the virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 <p>Information about the associated gateway.</p>
 */
@interface AWSDirectconnectAssociatedGateway : AWSModel


/**
 <p>The ID of the associated gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The ID of the AWS account that owns the associated virtual private gateway or transit gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

/**
 <p>The Region where the associated gateway is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The type of associated gateway.</p>
 */
@property (nonatomic, assign) AWSDirectconnectGatewayType types;

@end

/**
 <p>Information about a BGP peer.</p>
 */
@interface AWSDirectconnectBGPPeer : AWSModel


/**
 <p>The address family for the BGP peer.</p>
 */
@property (nonatomic, assign) AWSDirectconnectAddressFamily addressFamily;

/**
 <p>The IP address assigned to the Amazon interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amazonAddress;

/**
 <p>The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable asn;

/**
 <p>The authentication key for BGP configuration. This string has a minimum length of 6 characters and and a maximun lenth of 80 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authKey;

/**
 <p>The Direct Connect endpoint on which the BGP peer terminates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsDeviceV2;

/**
 <p>The ID of the BGP peer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bgpPeerId;

/**
 <p>The state of the BGP peer. The following are the possible values:</p><ul><li><p><code>verifying</code>: The BGP peering addresses or ASN require validation before the BGP peer can be created. This state applies only to public virtual interfaces.</p></li><li><p><code>pending</code>: The BGP peer is created, and remains in this state until it is ready to be established.</p></li><li><p><code>available</code>: The BGP peer is ready to be established.</p></li><li><p><code>deleting</code>: The BGP peer is being deleted.</p></li><li><p><code>deleted</code>: The BGP peer is deleted and cannot be established.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectBGPPeerState bgpPeerState;

/**
 <p>The status of the BGP peer. The following are the possible values:</p><ul><li><p><code>up</code>: The BGP peer is established. This state does not indicate the state of the routing function. Ensure that you are receiving routes over the BGP session.</p></li><li><p><code>down</code>: The BGP peer is down.</p></li><li><p><code>unknown</code>: The BGP peer status is not available.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectBGPStatus bgpStatus;

/**
 <p>The IP address assigned to the customer interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAddress;

@end

/**
 
 */
@interface AWSDirectconnectConfirmConnectionRequest : AWSRequest


/**
 <p>The ID of the hosted connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

@end

/**
 
 */
@interface AWSDirectconnectConfirmConnectionResponse : AWSModel


/**
 <p>The state of the connection. The following are the possible values:</p><ul><li><p><code>ordering</code>: The initial state of a hosted connection provisioned on an interconnect. The connection stays in the ordering state until the owner of the hosted connection confirms or declines the connection order.</p></li><li><p><code>requested</code>: The initial state of a standard connection. The connection stays in the requested state until the Letter of Authorization (LOA) is sent to the customer.</p></li><li><p><code>pending</code>: The connection has been approved and is being initialized.</p></li><li><p><code>available</code>: The network link is up and the connection is ready for use.</p></li><li><p><code>down</code>: The network link is down.</p></li><li><p><code>deleting</code>: The connection is being deleted.</p></li><li><p><code>deleted</code>: The connection has been deleted.</p></li><li><p><code>rejected</code>: A hosted connection in the <code>ordering</code> state enters the <code>rejected</code> state if it is deleted by the customer.</p></li><li><p><code>unknown</code>: The state of the connection is not available.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectConnectionState connectionState;

@end

/**
 
 */
@interface AWSDirectconnectConfirmPrivateVirtualInterfaceRequest : AWSRequest


/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualGatewayId;

/**
 <p>The ID of the virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 
 */
@interface AWSDirectconnectConfirmPrivateVirtualInterfaceResponse : AWSModel


/**
 <p>The state of the virtual interface. The following are the possible values:</p><ul><li><p><code>confirming</code>: The creation of the virtual interface is pending confirmation from the virtual interface owner. If the owner of the virtual interface is different from the owner of the connection on which it is provisioned, then the virtual interface will remain in this state until it is confirmed by the virtual interface owner.</p></li><li><p><code>verifying</code>: This state only applies to public virtual interfaces. Each public virtual interface needs validation before the virtual interface can be created.</p></li><li><p><code>pending</code>: A virtual interface is in this state from the time that it is created until the virtual interface is ready to forward traffic.</p></li><li><p><code>available</code>: A virtual interface that is able to forward traffic.</p></li><li><p><code>down</code>: A virtual interface that is BGP down.</p></li><li><p><code>deleting</code>: A virtual interface is in this state immediately after calling <a>DeleteVirtualInterface</a> until it can no longer forward traffic.</p></li><li><p><code>deleted</code>: A virtual interface that cannot forward traffic.</p></li><li><p><code>rejected</code>: The virtual interface owner has declined creation of the virtual interface. If a virtual interface in the <code>Confirming</code> state is deleted by the virtual interface owner, the virtual interface enters the <code>Rejected</code> state.</p></li><li><p><code>unknown</code>: The state of the virtual interface is not available.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectVirtualInterfaceState virtualInterfaceState;

@end

/**
 
 */
@interface AWSDirectconnectConfirmPublicVirtualInterfaceRequest : AWSRequest


/**
 <p>The ID of the virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 
 */
@interface AWSDirectconnectConfirmPublicVirtualInterfaceResponse : AWSModel


/**
 <p>The state of the virtual interface. The following are the possible values:</p><ul><li><p><code>confirming</code>: The creation of the virtual interface is pending confirmation from the virtual interface owner. If the owner of the virtual interface is different from the owner of the connection on which it is provisioned, then the virtual interface will remain in this state until it is confirmed by the virtual interface owner.</p></li><li><p><code>verifying</code>: This state only applies to public virtual interfaces. Each public virtual interface needs validation before the virtual interface can be created.</p></li><li><p><code>pending</code>: A virtual interface is in this state from the time that it is created until the virtual interface is ready to forward traffic.</p></li><li><p><code>available</code>: A virtual interface that is able to forward traffic.</p></li><li><p><code>down</code>: A virtual interface that is BGP down.</p></li><li><p><code>deleting</code>: A virtual interface is in this state immediately after calling <a>DeleteVirtualInterface</a> until it can no longer forward traffic.</p></li><li><p><code>deleted</code>: A virtual interface that cannot forward traffic.</p></li><li><p><code>rejected</code>: The virtual interface owner has declined creation of the virtual interface. If a virtual interface in the <code>Confirming</code> state is deleted by the virtual interface owner, the virtual interface enters the <code>Rejected</code> state.</p></li><li><p><code>unknown</code>: The state of the virtual interface is not available.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectVirtualInterfaceState virtualInterfaceState;

@end

/**
 
 */
@interface AWSDirectconnectConfirmTransitVirtualInterfaceRequest : AWSRequest


/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The ID of the virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 
 */
@interface AWSDirectconnectConfirmTransitVirtualInterfaceResponse : AWSModel


/**
 <p>The state of the virtual interface. The following are the possible values:</p><ul><li><p><code>confirming</code>: The creation of the virtual interface is pending confirmation from the virtual interface owner. If the owner of the virtual interface is different from the owner of the connection on which it is provisioned, then the virtual interface will remain in this state until it is confirmed by the virtual interface owner.</p></li><li><p><code>verifying</code>: This state only applies to public virtual interfaces. Each public virtual interface needs validation before the virtual interface can be created.</p></li><li><p><code>pending</code>: A virtual interface is in this state from the time that it is created until the virtual interface is ready to forward traffic.</p></li><li><p><code>available</code>: A virtual interface that is able to forward traffic.</p></li><li><p><code>down</code>: A virtual interface that is BGP down.</p></li><li><p><code>deleting</code>: A virtual interface is in this state immediately after calling <a>DeleteVirtualInterface</a> until it can no longer forward traffic.</p></li><li><p><code>deleted</code>: A virtual interface that cannot forward traffic.</p></li><li><p><code>rejected</code>: The virtual interface owner has declined creation of the virtual interface. If a virtual interface in the <code>Confirming</code> state is deleted by the virtual interface owner, the virtual interface enters the <code>Rejected</code> state.</p></li><li><p><code>unknown</code>: The state of the virtual interface is not available.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectVirtualInterfaceState virtualInterfaceState;

@end

/**
 <p>Information about an AWS Direct Connect connection.</p>
 */
@interface AWSDirectconnectConnection : AWSModel


/**
 <p>The Direct Connect endpoint on which the physical connection terminates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsDevice;

/**
 <p>The Direct Connect endpoint on which the physical connection terminates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsDeviceV2;

/**
 <p>The bandwidth of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bandwidth;

/**
 <p>The ID of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The name of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionName;

/**
 <p>The state of the connection. The following are the possible values:</p><ul><li><p><code>ordering</code>: The initial state of a hosted connection provisioned on an interconnect. The connection stays in the ordering state until the owner of the hosted connection confirms or declines the connection order.</p></li><li><p><code>requested</code>: The initial state of a standard connection. The connection stays in the requested state until the Letter of Authorization (LOA) is sent to the customer.</p></li><li><p><code>pending</code>: The connection has been approved and is being initialized.</p></li><li><p><code>available</code>: The network link is up and the connection is ready for use.</p></li><li><p><code>down</code>: The network link is down.</p></li><li><p><code>deleting</code>: The connection is being deleted.</p></li><li><p><code>deleted</code>: The connection has been deleted.</p></li><li><p><code>rejected</code>: A hosted connection in the <code>ordering</code> state enters the <code>rejected</code> state if it is deleted by the customer.</p></li><li><p><code>unknown</code>: The state of the connection is not available.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectConnectionState connectionState;

/**
 <p>Indicates whether the connection supports a secondary BGP peer in the same address family (IPv4/IPv6).</p>
 */
@property (nonatomic, assign) AWSDirectconnectHasLogicalRedundancy hasLogicalRedundancy;

/**
 <p>Indicates whether jumbo frames (9001 MTU) are supported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable jumboFrameCapable;

/**
 <p>The ID of the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lagId;

/**
 <p>The time of the most recent call to <a>DescribeLoa</a> for this connection.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable loaIssueTime;

/**
 <p>The location of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The ID of the AWS account that owns the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

/**
 <p>The name of the AWS Direct Connect service provider associated with the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable partnerName;

/**
 <p>The name of the service provider associated with the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The AWS Region where the connection is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The tags associated with the connection.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

/**
 <p>The ID of the VLAN.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable vlan;

@end

/**
 
 */
@interface AWSDirectconnectConnections : AWSModel


/**
 <p>The connections.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectConnection *> * _Nullable connections;

@end

/**
 
 */
@interface AWSDirectconnectCreateBGPPeerRequest : AWSRequest


/**
 <p>Information about the BGP peer.</p>
 */
@property (nonatomic, strong) AWSDirectconnectLatestBGPPeer * _Nullable latestBGPPeer;

/**
 <p>The ID of the virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 
 */
@interface AWSDirectconnectCreateBGPPeerResponse : AWSModel


/**
 <p>The virtual interface.</p>
 */
@property (nonatomic, strong) AWSDirectconnectVirtualInterface * _Nullable virtualInterface;

@end

/**
 
 */
@interface AWSDirectconnectCreateConnectionRequest : AWSRequest


/**
 <p>The bandwidth of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bandwidth;

/**
 <p>The name of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionName;

/**
 <p>The ID of the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lagId;

/**
 <p>The location of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The name of the service provider associated with the requested connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The tags to associate with the lag.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSDirectconnectCreateDirectConnectGatewayAssociationProposalRequest : AWSRequest


/**
 <p>The Amazon VPC prefixes to advertise to the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectRouteFilterPrefix *> * _Nullable addAllowedPrefixesToDirectConnectGateway;

/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The ID of the AWS account that owns the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayOwnerAccount;

/**
 <p>The ID of the virtual private gateway or transit gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

/**
 <p>The Amazon VPC prefixes to no longer advertise to the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectRouteFilterPrefix *> * _Nullable removeAllowedPrefixesToDirectConnectGateway;

@end

/**
 
 */
@interface AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult : AWSModel


/**
 <p>Information about the Direct Connect gateway proposal.</p>
 */
@property (nonatomic, strong) AWSDirectconnectDirectConnectGatewayAssociationProposal * _Nullable directConnectGatewayAssociationProposal;

@end

/**
 
 */
@interface AWSDirectconnectCreateDirectConnectGatewayAssociationRequest : AWSRequest


/**
 <p>The Amazon VPC prefixes to advertise to the Direct Connect gateway</p><p>This parameter is required when you create an association to a transit gateway.</p><p>For information about how to set the prefixes, see <a href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/multi-account-associate-vgw.html#allowed-prefixes">Allowed Prefixes</a> in the <i>AWS Direct Connect User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectRouteFilterPrefix *> * _Nullable addAllowedPrefixesToDirectConnectGateway;

/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The ID of the virtual private gateway or transit gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable gatewayId;

/**
 <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualGatewayId;

@end

/**
 
 */
@interface AWSDirectconnectCreateDirectConnectGatewayAssociationResult : AWSModel


/**
 <p>The association to be created.</p>
 */
@property (nonatomic, strong) AWSDirectconnectDirectConnectGatewayAssociation * _Nullable directConnectGatewayAssociation;

@end

/**
 
 */
@interface AWSDirectconnectCreateDirectConnectGatewayRequest : AWSRequest


/**
 <p>The autonomous system number (ASN) for Border Gateway Protocol (BGP) to be configured on the Amazon side of the connection. The ASN must be in the private range of 64,512 to 65,534 or 4,200,000,000 to 4,294,967,294. The default is 64512.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable amazonSideAsn;

/**
 <p>The name of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayName;

@end

/**
 
 */
@interface AWSDirectconnectCreateDirectConnectGatewayResult : AWSModel


/**
 <p>The Direct Connect gateway.</p>
 */
@property (nonatomic, strong) AWSDirectconnectDirectConnectGateway * _Nullable directConnectGateway;

@end

/**
 
 */
@interface AWSDirectconnectCreateInterconnectRequest : AWSRequest


/**
 <p>The port bandwidth, in Gbps. The possible values are 1 and 10.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bandwidth;

/**
 <p>The name of the interconnect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable interconnectName;

/**
 <p>The ID of the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lagId;

/**
 <p>The location of the interconnect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The name of the service provider associated with the interconnect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The tags to associate with the interconnect.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSDirectconnectCreateLagRequest : AWSRequest


/**
 <p>The tags to associate with the automtically created LAGs.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable childConnectionTags;

/**
 <p>The ID of an existing connection to migrate to the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The bandwidth of the individual physical connections bundled by the LAG. The possible values are 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, and 10Gbps. </p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionsBandwidth;

/**
 <p>The name of the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lagName;

/**
 <p>The location for the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The number of physical connections initially provisioned and bundled by the LAG.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfConnections;

/**
 <p>The name of the service provider associated with the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The tags to associate with the LAG.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSDirectconnectCreatePrivateVirtualInterfaceRequest : AWSRequest


/**
 <p>The ID of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>Information about the private virtual interface.</p>
 */
@property (nonatomic, strong) AWSDirectconnectLatestPrivateVirtualInterface * _Nullable latestPrivateVirtualInterface;

@end

/**
 
 */
@interface AWSDirectconnectCreatePublicVirtualInterfaceRequest : AWSRequest


/**
 <p>The ID of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>Information about the public virtual interface.</p>
 */
@property (nonatomic, strong) AWSDirectconnectLatestPublicVirtualInterface * _Nullable latestPublicVirtualInterface;

@end

/**
 
 */
@interface AWSDirectconnectCreateTransitVirtualInterfaceRequest : AWSRequest


/**
 <p>The ID of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>Information about the transit virtual interface.</p>
 */
@property (nonatomic, strong) AWSDirectconnectLatestTransitVirtualInterface * _Nullable latestTransitVirtualInterface;

@end

/**
 
 */
@interface AWSDirectconnectCreateTransitVirtualInterfaceResult : AWSModel


/**
 <p>Information about a virtual interface.</p>
 */
@property (nonatomic, strong) AWSDirectconnectVirtualInterface * _Nullable virtualInterface;

@end

/**
 
 */
@interface AWSDirectconnectDeleteBGPPeerRequest : AWSRequest


/**
 <p>The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable asn;

/**
 <p>The ID of the BGP peer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bgpPeerId;

/**
 <p>The IP address assigned to the customer interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAddress;

/**
 <p>The ID of the virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 
 */
@interface AWSDirectconnectDeleteBGPPeerResponse : AWSModel


/**
 <p>The virtual interface.</p>
 */
@property (nonatomic, strong) AWSDirectconnectVirtualInterface * _Nullable virtualInterface;

@end

/**
 
 */
@interface AWSDirectconnectDeleteConnectionRequest : AWSRequest


/**
 <p>The ID of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

@end

/**
 
 */
@interface AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalRequest : AWSRequest


/**
 <p>The ID of the proposal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable proposalId;

@end

/**
 
 */
@interface AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult : AWSModel


/**
 <p>The ID of the associated gateway.</p>
 */
@property (nonatomic, strong) AWSDirectconnectDirectConnectGatewayAssociationProposal * _Nullable directConnectGatewayAssociationProposal;

@end

/**
 
 */
@interface AWSDirectconnectDeleteDirectConnectGatewayAssociationRequest : AWSRequest


/**
 <p>The ID of the Direct Connect gateway association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualGatewayId;

@end

/**
 
 */
@interface AWSDirectconnectDeleteDirectConnectGatewayAssociationResult : AWSModel


/**
 <p>Information about the deleted association.</p>
 */
@property (nonatomic, strong) AWSDirectconnectDirectConnectGatewayAssociation * _Nullable directConnectGatewayAssociation;

@end

/**
 
 */
@interface AWSDirectconnectDeleteDirectConnectGatewayRequest : AWSRequest


/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

@end

/**
 
 */
@interface AWSDirectconnectDeleteDirectConnectGatewayResult : AWSModel


/**
 <p>The Direct Connect gateway.</p>
 */
@property (nonatomic, strong) AWSDirectconnectDirectConnectGateway * _Nullable directConnectGateway;

@end

/**
 
 */
@interface AWSDirectconnectDeleteInterconnectRequest : AWSRequest


/**
 <p>The ID of the interconnect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable interconnectId;

@end

/**
 
 */
@interface AWSDirectconnectDeleteInterconnectResponse : AWSModel


/**
 <p>The state of the interconnect. The following are the possible values:</p><ul><li><p><code>requested</code>: The initial state of an interconnect. The interconnect stays in the requested state until the Letter of Authorization (LOA) is sent to the customer.</p></li><li><p><code>pending</code>: The interconnect is approved, and is being initialized.</p></li><li><p><code>available</code>: The network link is up, and the interconnect is ready for use.</p></li><li><p><code>down</code>: The network link is down.</p></li><li><p><code>deleting</code>: The interconnect is being deleted.</p></li><li><p><code>deleted</code>: The interconnect is deleted.</p></li><li><p><code>unknown</code>: The state of the interconnect is not available.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectInterconnectState interconnectState;

@end

/**
 
 */
@interface AWSDirectconnectDeleteLagRequest : AWSRequest


/**
 <p>The ID of the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lagId;

@end

/**
 
 */
@interface AWSDirectconnectDeleteVirtualInterfaceRequest : AWSRequest


/**
 <p>The ID of the virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 
 */
@interface AWSDirectconnectDeleteVirtualInterfaceResponse : AWSModel


/**
 <p>The state of the virtual interface. The following are the possible values:</p><ul><li><p><code>confirming</code>: The creation of the virtual interface is pending confirmation from the virtual interface owner. If the owner of the virtual interface is different from the owner of the connection on which it is provisioned, then the virtual interface will remain in this state until it is confirmed by the virtual interface owner.</p></li><li><p><code>verifying</code>: This state only applies to public virtual interfaces. Each public virtual interface needs validation before the virtual interface can be created.</p></li><li><p><code>pending</code>: A virtual interface is in this state from the time that it is created until the virtual interface is ready to forward traffic.</p></li><li><p><code>available</code>: A virtual interface that is able to forward traffic.</p></li><li><p><code>down</code>: A virtual interface that is BGP down.</p></li><li><p><code>deleting</code>: A virtual interface is in this state immediately after calling <a>DeleteVirtualInterface</a> until it can no longer forward traffic.</p></li><li><p><code>deleted</code>: A virtual interface that cannot forward traffic.</p></li><li><p><code>rejected</code>: The virtual interface owner has declined creation of the virtual interface. If a virtual interface in the <code>Confirming</code> state is deleted by the virtual interface owner, the virtual interface enters the <code>Rejected</code> state.</p></li><li><p><code>unknown</code>: The state of the virtual interface is not available.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectVirtualInterfaceState virtualInterfaceState;

@end

/**
 
 */
@interface AWSDirectconnectDescribeConnectionLoaRequest : AWSRequest


/**
 <p>The ID of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The standard media type for the LOA-CFA document. The only supported value is application/pdf.</p>
 */
@property (nonatomic, assign) AWSDirectconnectLoaContentType loaContentType;

/**
 <p>The name of the APN partner or service provider who establishes connectivity on your behalf. If you specify this parameter, the LOA-CFA lists the provider name alongside your company name as the requester of the cross connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

@end

/**
 
 */
@interface AWSDirectconnectDescribeConnectionLoaResponse : AWSModel


/**
 <p>The Letter of Authorization - Connecting Facility Assignment (LOA-CFA).</p>
 */
@property (nonatomic, strong) AWSDirectconnectLoa * _Nullable loa;

@end

/**
 
 */
@interface AWSDirectconnectDescribeConnectionsOnInterconnectRequest : AWSRequest


/**
 <p>The ID of the interconnect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable interconnectId;

@end

/**
 
 */
@interface AWSDirectconnectDescribeConnectionsRequest : AWSRequest


/**
 <p>The ID of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

@end

/**
 
 */
@interface AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsRequest : AWSRequest


/**
 <p>The ID of the associated gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associatedGatewayId;

/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p><p>If <code>MaxResults</code> is given a value larger than 100, only 100 results are returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the proposal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable proposalId;

@end

/**
 
 */
@interface AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult : AWSModel


/**
 <p>Describes the Direct Connect gateway association proposals.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectDirectConnectGatewayAssociationProposal *> * _Nullable directConnectGatewayAssociationProposals;

/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSDirectconnectDescribeDirectConnectGatewayAssociationsRequest : AWSRequest


/**
 <p>The ID of the associated gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associatedGatewayId;

/**
 <p>The ID of the Direct Connect gateway association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p><p>If <code>MaxResults</code> is given a value larger than 100, only 100 results are returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token provided in the previous call to retrieve the next page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualGatewayId;

@end

/**
 
 */
@interface AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult : AWSModel


/**
 <p>Information about the associations.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectDirectConnectGatewayAssociation *> * _Nullable directConnectGatewayAssociations;

/**
 <p>The token to retrieve the next page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSDirectconnectDescribeDirectConnectGatewayAttachmentsRequest : AWSRequest


/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p><p>If <code>MaxResults</code> is given a value larger than 100, only 100 results are returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token provided in the previous call to retrieve the next page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 
 */
@interface AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult : AWSModel


/**
 <p>The attachments.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectDirectConnectGatewayAttachment *> * _Nullable directConnectGatewayAttachments;

/**
 <p>The token to retrieve the next page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSDirectconnectDescribeDirectConnectGatewaysRequest : AWSRequest


/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p><p>If <code>MaxResults</code> is given a value larger than 100, only 100 results are returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token provided in the previous call to retrieve the next page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSDirectconnectDescribeDirectConnectGatewaysResult : AWSModel


/**
 <p>The Direct Connect gateways.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectDirectConnectGateway *> * _Nullable directConnectGateways;

/**
 <p>The token to retrieve the next page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSDirectconnectDescribeHostedConnectionsRequest : AWSRequest


/**
 <p>The ID of the interconnect or LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

@end

/**
 
 */
@interface AWSDirectconnectDescribeInterconnectLoaRequest : AWSRequest


/**
 <p>The ID of the interconnect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable interconnectId;

/**
 <p>The standard media type for the LOA-CFA document. The only supported value is application/pdf.</p>
 */
@property (nonatomic, assign) AWSDirectconnectLoaContentType loaContentType;

/**
 <p>The name of the service provider who establishes connectivity on your behalf. If you supply this parameter, the LOA-CFA lists the provider name alongside your company name as the requester of the cross connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

@end

/**
 
 */
@interface AWSDirectconnectDescribeInterconnectLoaResponse : AWSModel


/**
 <p>The Letter of Authorization - Connecting Facility Assignment (LOA-CFA).</p>
 */
@property (nonatomic, strong) AWSDirectconnectLoa * _Nullable loa;

@end

/**
 
 */
@interface AWSDirectconnectDescribeInterconnectsRequest : AWSRequest


/**
 <p>The ID of the interconnect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable interconnectId;

@end

/**
 
 */
@interface AWSDirectconnectDescribeLagsRequest : AWSRequest


/**
 <p>The ID of the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lagId;

@end

/**
 
 */
@interface AWSDirectconnectDescribeLoaRequest : AWSRequest


/**
 <p>The ID of a connection, LAG, or interconnect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The standard media type for the LOA-CFA document. The only supported value is application/pdf.</p>
 */
@property (nonatomic, assign) AWSDirectconnectLoaContentType loaContentType;

/**
 <p>The name of the service provider who establishes connectivity on your behalf. If you specify this parameter, the LOA-CFA lists the provider name alongside your company name as the requester of the cross connect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

@end

/**
 
 */
@interface AWSDirectconnectDescribeTagsRequest : AWSRequest


/**
 <p>The Amazon Resource Names (ARNs) of the resources.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceArns;

@end

/**
 
 */
@interface AWSDirectconnectDescribeTagsResponse : AWSModel


/**
 <p>Information about the tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectResourceTag *> * _Nullable resourceTags;

@end

/**
 
 */
@interface AWSDirectconnectDescribeVirtualInterfacesRequest : AWSRequest


/**
 <p>The ID of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The ID of the virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 <p>Information about a Direct Connect gateway, which enables you to connect virtual interfaces and virtual private gateway or transit gateways.</p>
 */
@interface AWSDirectconnectDirectConnectGateway : AWSModel


/**
 <p>The autonomous system number (ASN) for the Amazon side of the connection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable amazonSideAsn;

/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The name of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayName;

/**
 <p>The state of the Direct Connect gateway. The following are the possible values:</p><ul><li><p><code>pending</code>: The initial state after calling <a>CreateDirectConnectGateway</a>.</p></li><li><p><code>available</code>: The Direct Connect gateway is ready for use.</p></li><li><p><code>deleting</code>: The initial state after calling <a>DeleteDirectConnectGateway</a>.</p></li><li><p><code>deleted</code>: The Direct Connect gateway is deleted and cannot pass traffic.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectDirectConnectGatewayState directConnectGatewayState;

/**
 <p>The ID of the AWS account that owns the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

/**
 <p>The error message if the state of an object failed to advance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateChangeError;

@end

/**
 <p>Information about an association between a Direct Connect gateway and a virtual private gateway or transit gateway.</p>
 */
@interface AWSDirectconnectDirectConnectGatewayAssociation : AWSModel


/**
 <p>The Amazon VPC prefixes to advertise to the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectRouteFilterPrefix *> * _Nullable allowedPrefixesToDirectConnectGateway;

/**
 <p>Information about the associated gateway.</p>
 */
@property (nonatomic, strong) AWSDirectconnectAssociatedGateway * _Nullable associatedGateway;

/**
 <p>The ID of the Direct Connect gateway association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The state of the association. The following are the possible values:</p><ul><li><p><code>associating</code>: The initial state after calling <a>CreateDirectConnectGatewayAssociation</a>.</p></li><li><p><code>associated</code>: The Direct Connect gateway and virtual private gateway or transit gateway are successfully associated and ready to pass traffic.</p></li><li><p><code>disassociating</code>: The initial state after calling <a>DeleteDirectConnectGatewayAssociation</a>.</p></li><li><p><code>disassociated</code>: The virtual private gateway or transit gateway is disassociated from the Direct Connect gateway. Traffic flow between the Direct Connect gateway and virtual private gateway or transit gateway is stopped.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectDirectConnectGatewayAssociationState associationState;

/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The ID of the AWS account that owns the associated gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayOwnerAccount;

/**
 <p>The error message if the state of an object failed to advance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateChangeError;

/**
 <p>The ID of the virtual private gateway. Applies only to private virtual interfaces.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualGatewayId;

/**
 <p>The ID of the AWS account that owns the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualGatewayOwnerAccount;

/**
 <p>The AWS Region where the virtual private gateway is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualGatewayRegion;

@end

/**
 <p>Information about the proposal request to attach a virtual private gateway to a Direct Connect gateway. </p>
 */
@interface AWSDirectconnectDirectConnectGatewayAssociationProposal : AWSModel


/**
 <p>Information about the associated gateway.</p>
 */
@property (nonatomic, strong) AWSDirectconnectAssociatedGateway * _Nullable associatedGateway;

/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The ID of the AWS account that owns the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayOwnerAccount;

/**
 <p>The existing Amazon VPC prefixes advertised to the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectRouteFilterPrefix *> * _Nullable existingAllowedPrefixesToDirectConnectGateway;

/**
 <p>The ID of the association proposal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable proposalId;

/**
 <p>The state of the proposal. The following are possible values:</p><ul><li><p><code>accepted</code>: The proposal has been accepted. The Direct Connect gateway association is available to use in this state.</p></li><li><p><code>deleted</code>: The proposal has been deleted by the owner that made the proposal. The Direct Connect gateway association cannot be used in this state.</p></li><li><p><code>requested</code>: The proposal has been requested. The Direct Connect gateway association cannot be used in this state.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectDirectConnectGatewayAssociationProposalState proposalState;

/**
 <p>The Amazon VPC prefixes to advertise to the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectRouteFilterPrefix *> * _Nullable requestedAllowedPrefixesToDirectConnectGateway;

@end

/**
 <p>Information about an attachment between a Direct Connect gateway and a virtual interface.</p>
 */
@interface AWSDirectconnectDirectConnectGatewayAttachment : AWSModel


/**
 <p>The state of the attachment. The following are the possible values:</p><ul><li><p><code>attaching</code>: The initial state after a virtual interface is created using the Direct Connect gateway.</p></li><li><p><code>attached</code>: The Direct Connect gateway and virtual interface are attached and ready to pass traffic.</p></li><li><p><code>detaching</code>: The initial state after calling <a>DeleteVirtualInterface</a>.</p></li><li><p><code>detached</code>: The virtual interface is detached from the Direct Connect gateway. Traffic flow between the Direct Connect gateway and virtual interface is stopped.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectDirectConnectGatewayAttachmentState attachmentState;

/**
 <p>The type of attachment.</p>
 */
@property (nonatomic, assign) AWSDirectconnectDirectConnectGatewayAttachmentType attachmentType;

/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The error message if the state of an object failed to advance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateChangeError;

/**
 <p>The ID of the virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

/**
 <p>The ID of the AWS account that owns the virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceOwnerAccount;

/**
 <p>The AWS Region where the virtual interface is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceRegion;

@end

/**
 
 */
@interface AWSDirectconnectDisassociateConnectionFromLagRequest : AWSRequest


/**
 <p>The ID of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The ID of the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lagId;

@end

/**
 <p>Information about an interconnect.</p>
 */
@interface AWSDirectconnectInterconnect : AWSModel


/**
 <p>The Direct Connect endpoint on which the physical connection terminates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsDevice;

/**
 <p>The Direct Connect endpoint on which the physical connection terminates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsDeviceV2;

/**
 <p>The bandwidth of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bandwidth;

/**
 <p>Indicates whether the interconnect supports a secondary BGP in the same address family (IPv4/IPv6).</p>
 */
@property (nonatomic, assign) AWSDirectconnectHasLogicalRedundancy hasLogicalRedundancy;

/**
 <p>The ID of the interconnect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable interconnectId;

/**
 <p>The name of the interconnect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable interconnectName;

/**
 <p>The state of the interconnect. The following are the possible values:</p><ul><li><p><code>requested</code>: The initial state of an interconnect. The interconnect stays in the requested state until the Letter of Authorization (LOA) is sent to the customer.</p></li><li><p><code>pending</code>: The interconnect is approved, and is being initialized.</p></li><li><p><code>available</code>: The network link is up, and the interconnect is ready for use.</p></li><li><p><code>down</code>: The network link is down.</p></li><li><p><code>deleting</code>: The interconnect is being deleted.</p></li><li><p><code>deleted</code>: The interconnect is deleted.</p></li><li><p><code>unknown</code>: The state of the interconnect is not available.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectInterconnectState interconnectState;

/**
 <p>Indicates whether jumbo frames (9001 MTU) are supported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable jumboFrameCapable;

/**
 <p>The ID of the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lagId;

/**
 <p>The time of the most recent call to <a>DescribeLoa</a> for this connection.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable loaIssueTime;

/**
 <p>The location of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The name of the service provider associated with the interconnect.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The AWS Region where the connection is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The tags associated with the interconnect.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSDirectconnectInterconnects : AWSModel


/**
 <p>The interconnects.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectInterconnect *> * _Nullable interconnects;

@end

/**
 <p>Information about a link aggregation group (LAG).</p>
 */
@interface AWSDirectconnectLag : AWSModel


/**
 <p>Indicates whether the LAG can host other connections.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowsHostedConnections;

/**
 <p>The AWS Direct Connect endpoint that hosts the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsDevice;

/**
 <p>The AWS Direct Connect endpoint that hosts the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsDeviceV2;

/**
 <p>The connections bundled by the LAG.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectConnection *> * _Nullable connections;

/**
 <p>The individual bandwidth of the physical connections bundled by the LAG. The possible values are 1Gbps and 10Gbps. </p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionsBandwidth;

/**
 <p>Indicates whether the LAG supports a secondary BGP peer in the same address family (IPv4/IPv6).</p>
 */
@property (nonatomic, assign) AWSDirectconnectHasLogicalRedundancy hasLogicalRedundancy;

/**
 <p>Indicates whether jumbo frames (9001 MTU) are supported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable jumboFrameCapable;

/**
 <p>The ID of the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lagId;

/**
 <p>The name of the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lagName;

/**
 <p>The state of the LAG. The following are the possible values:</p><ul><li><p><code>requested</code>: The initial state of a LAG. The LAG stays in the requested state until the Letter of Authorization (LOA) is available.</p></li><li><p><code>pending</code>: The LAG has been approved and is being initialized.</p></li><li><p><code>available</code>: The network link is established and the LAG is ready for use.</p></li><li><p><code>down</code>: The network link is down.</p></li><li><p><code>deleting</code>: The LAG is being deleted.</p></li><li><p><code>deleted</code>: The LAG is deleted.</p></li><li><p><code>unknown</code>: The state of the LAG is not available.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectLagState lagState;

/**
 <p>The location of the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The minimum number of physical connections that must be operational for the LAG itself to be operational.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimumLinks;

/**
 <p>The number of physical connections bundled by the LAG, up to a maximum of 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfConnections;

/**
 <p>The ID of the AWS account that owns the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

/**
 <p>The name of the service provider associated with the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The AWS Region where the connection is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The tags associated with the LAG.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSDirectconnectLags : AWSModel


/**
 <p>The LAGs.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectLag *> * _Nullable lags;

@end

/**
 
 */
@interface AWSDirectconnectListVirtualInterfaceTestHistoryRequest : AWSRequest


/**
 <p>The BGP peers that were placed in the DOWN state during the virtual interface failover test.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable bgpPeers;

/**
 <p>The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned <code>nextToken</code> value.</p><p>If <code>MaxResults</code> is given a value larger than 100, only 100 results are returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The status of the virtual interface failover test.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The ID of the virtual interface failover test.</p>
 */
@property (nonatomic, strong) NSString * _Nullable testId;

/**
 <p>The ID of the virtual interface that was tested.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 
 */
@interface AWSDirectconnectListVirtualInterfaceTestHistoryResponse : AWSModel


/**
 <p>The token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the tested virtual interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectVirtualInterfaceTestHistory *> * _Nullable virtualInterfaceTestHistory;

@end

/**
 <p>Information about a Letter of Authorization - Connecting Facility Assignment (LOA-CFA) for a connection.</p>
 */
@interface AWSDirectconnectLoa : AWSModel


/**
 <p>The binary contents of the LOA-CFA document.</p>
 */
@property (nonatomic, strong) NSData * _Nullable loaContent;

/**
 <p>The standard media type for the LOA-CFA document. The only supported value is application/pdf.</p>
 */
@property (nonatomic, assign) AWSDirectconnectLoaContentType loaContentType;

@end

/**
 <p>Information about an AWS Direct Connect location.</p>
 */
@interface AWSDirectconnectLocation : AWSModel


/**
 <p>The available port speeds for the location.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availablePortSpeeds;

/**
 <p>The name of the service provider for the location.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availableProviders;

/**
 <p>The code for the location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locationCode;

/**
 <p>The name of the location. This includes the name of the colocation partner and the physical site of the building.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locationName;

/**
 <p>The AWS Region for the location.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

@end

/**
 
 */
@interface AWSDirectconnectLocations : AWSModel


/**
 <p>The locations.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectLocation *> * _Nullable locations;

@end

/**
 <p>Information about a new BGP peer.</p>
 */
@interface AWSDirectconnectLatestBGPPeer : AWSModel


/**
 <p>The address family for the BGP peer.</p>
 */
@property (nonatomic, assign) AWSDirectconnectAddressFamily addressFamily;

/**
 <p>The IP address assigned to the Amazon interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amazonAddress;

/**
 <p>The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable asn;

/**
 <p>The authentication key for BGP configuration. This string has a minimum length of 6 characters and and a maximun lenth of 80 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authKey;

/**
 <p>The IP address assigned to the customer interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAddress;

@end

/**
 <p>Information about a private virtual interface.</p>
 Required parameters: [virtualInterfaceName, vlan, asn]
 */
@interface AWSDirectconnectLatestPrivateVirtualInterface : AWSModel


/**
 <p>The address family for the BGP peer.</p>
 */
@property (nonatomic, assign) AWSDirectconnectAddressFamily addressFamily;

/**
 <p>The IP address assigned to the Amazon interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amazonAddress;

/**
 <p>The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.</p><p>The valid values are 1-2147483647.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable asn;

/**
 <p>The authentication key for BGP configuration. This string has a minimum length of 6 characters and and a maximun lenth of 80 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authKey;

/**
 <p>The IP address assigned to the customer interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAddress;

/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 9001. The default value is 1500.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mtu;

/**
 <p>The tags associated with the private virtual interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

/**
 <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualGatewayId;

/**
 <p>The name of the virtual interface assigned by the customer network. The name has a maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceName;

/**
 <p>The ID of the VLAN.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable vlan;

@end

/**
 <p>Information about a private virtual interface to be provisioned on a connection.</p>
 Required parameters: [virtualInterfaceName, vlan, asn]
 */
@interface AWSDirectconnectLatestPrivateVirtualInterfaceAllocation : AWSModel


/**
 <p>The address family for the BGP peer.</p>
 */
@property (nonatomic, assign) AWSDirectconnectAddressFamily addressFamily;

/**
 <p>The IP address assigned to the Amazon interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amazonAddress;

/**
 <p>The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.</p><p>The valid values are 1-2147483647.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable asn;

/**
 <p>The authentication key for BGP configuration. This string has a minimum length of 6 characters and and a maximun lenth of 80 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authKey;

/**
 <p>The IP address assigned to the customer interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAddress;

/**
 <p>The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 9001. The default value is 1500.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mtu;

/**
 <p>The tags associated with the private virtual interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

/**
 <p>The name of the virtual interface assigned by the customer network. The name has a maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceName;

/**
 <p>The ID of the VLAN.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable vlan;

@end

/**
 <p>Information about a public virtual interface.</p>
 Required parameters: [virtualInterfaceName, vlan, asn]
 */
@interface AWSDirectconnectLatestPublicVirtualInterface : AWSModel


/**
 <p>The address family for the BGP peer.</p>
 */
@property (nonatomic, assign) AWSDirectconnectAddressFamily addressFamily;

/**
 <p>The IP address assigned to the Amazon interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amazonAddress;

/**
 <p>The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.</p><p>The valid values are 1-2147483647.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable asn;

/**
 <p>The authentication key for BGP configuration. This string has a minimum length of 6 characters and and a maximun lenth of 80 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authKey;

/**
 <p>The IP address assigned to the customer interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAddress;

/**
 <p>The routes to be advertised to the AWS network in this Region. Applies to public virtual interfaces.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectRouteFilterPrefix *> * _Nullable routeFilterPrefixes;

/**
 <p>The tags associated with the public virtual interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

/**
 <p>The name of the virtual interface assigned by the customer network. The name has a maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceName;

/**
 <p>The ID of the VLAN.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable vlan;

@end

/**
 <p>Information about a public virtual interface to be provisioned on a connection.</p>
 Required parameters: [virtualInterfaceName, vlan, asn]
 */
@interface AWSDirectconnectLatestPublicVirtualInterfaceAllocation : AWSModel


/**
 <p>The address family for the BGP peer.</p>
 */
@property (nonatomic, assign) AWSDirectconnectAddressFamily addressFamily;

/**
 <p>The IP address assigned to the Amazon interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amazonAddress;

/**
 <p>The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.</p><p>The valid values are 1-2147483647.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable asn;

/**
 <p>The authentication key for BGP configuration. This string has a minimum length of 6 characters and and a maximun lenth of 80 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authKey;

/**
 <p>The IP address assigned to the customer interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAddress;

/**
 <p>The routes to be advertised to the AWS network in this Region. Applies to public virtual interfaces.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectRouteFilterPrefix *> * _Nullable routeFilterPrefixes;

/**
 <p>The tags associated with the public virtual interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

/**
 <p>The name of the virtual interface assigned by the customer network. The name has a maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceName;

/**
 <p>The ID of the VLAN.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable vlan;

@end

/**
 <p>Information about a transit virtual interface.</p>
 */
@interface AWSDirectconnectLatestTransitVirtualInterface : AWSModel


/**
 <p>The address family for the BGP peer.</p>
 */
@property (nonatomic, assign) AWSDirectconnectAddressFamily addressFamily;

/**
 <p>The IP address assigned to the Amazon interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amazonAddress;

/**
 <p>The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.</p><p>The valid values are 1-2147483647.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable asn;

/**
 <p>The authentication key for BGP configuration. This string has a minimum length of 6 characters and and a maximun lenth of 80 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authKey;

/**
 <p>The IP address assigned to the customer interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAddress;

/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 9001. The default value is 1500.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mtu;

/**
 <p>The tags associated with the transitive virtual interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

/**
 <p>The name of the virtual interface assigned by the customer network. The name has a maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceName;

/**
 <p>The ID of the VLAN.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable vlan;

@end

/**
 <p>Information about a transit virtual interface to be provisioned on a connection.</p>
 */
@interface AWSDirectconnectLatestTransitVirtualInterfaceAllocation : AWSModel


/**
 <p>The address family for the BGP peer.</p>
 */
@property (nonatomic, assign) AWSDirectconnectAddressFamily addressFamily;

/**
 <p>The IP address assigned to the Amazon interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amazonAddress;

/**
 <p>The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.</p><p>The valid values are 1-2147483647.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable asn;

/**
 <p>The authentication key for BGP configuration. This string has a minimum length of 6 characters and and a maximun lenth of 80 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authKey;

/**
 <p>The IP address assigned to the customer interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAddress;

/**
 <p>The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 9001. The default value is 1500. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mtu;

/**
 <p>The tags associated with the transitive virtual interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

/**
 <p>The name of the virtual interface assigned by the customer network. The name has a maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceName;

/**
 <p>The ID of the VLAN.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable vlan;

@end

/**
 <p>Information about a tag associated with an AWS Direct Connect resource.</p>
 */
@interface AWSDirectconnectResourceTag : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

@end

/**
 <p>Information about a route filter prefix that a customer can advertise through Border Gateway Protocol (BGP) over a public virtual interface.</p>
 */
@interface AWSDirectconnectRouteFilterPrefix : AWSModel


/**
 <p>The CIDR block for the advertised route. Separate multiple routes using commas. An IPv6 CIDR must use /64 or shorter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cidr;

@end

/**
 
 */
@interface AWSDirectconnectStartBgpFailoverTestRequest : AWSRequest


/**
 <p>The BGP peers to place in the DOWN state.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable bgpPeers;

/**
 <p>The time in minutes that the virtual interface failover test will last.</p><p>Maximum value: 180 minutes (3 hours).</p><p>Default: 180 minutes (3 hours).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable testDurationInMinutes;

/**
 <p>The ID of the virtual interface you want to test.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 
 */
@interface AWSDirectconnectStartBgpFailoverTestResponse : AWSModel


/**
 <p>Information about the virtual interface failover test.</p>
 */
@property (nonatomic, strong) AWSDirectconnectVirtualInterfaceTestHistory * _Nullable virtualInterfaceTest;

@end

/**
 
 */
@interface AWSDirectconnectStopBgpFailoverTestRequest : AWSRequest


/**
 <p>The ID of the virtual interface you no longer want to test.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 
 */
@interface AWSDirectconnectStopBgpFailoverTestResponse : AWSModel


/**
 <p>Information about the virtual interface failover test.</p>
 */
@property (nonatomic, strong) AWSDirectconnectVirtualInterfaceTestHistory * _Nullable virtualInterfaceTest;

@end

/**
 <p>Information about a tag.</p>
 Required parameters: [key]
 */
@interface AWSDirectconnectTag : AWSModel


/**
 <p>The key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSDirectconnectTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags to add.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSDirectconnectTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSDirectconnectUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tag keys of the tags to remove.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSDirectconnectUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSDirectconnectUpdateDirectConnectGatewayAssociationRequest : AWSRequest


/**
 <p>The Amazon VPC prefixes to advertise to the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectRouteFilterPrefix *> * _Nullable addAllowedPrefixesToDirectConnectGateway;

/**
 <p>The ID of the Direct Connect gateway association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable associationId;

/**
 <p>The Amazon VPC prefixes to no longer advertise to the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectRouteFilterPrefix *> * _Nullable removeAllowedPrefixesToDirectConnectGateway;

@end

/**
 
 */
@interface AWSDirectconnectUpdateDirectConnectGatewayAssociationResult : AWSModel


/**
 <p>Information about an association between a Direct Connect gateway and a virtual private gateway or transit gateway.</p>
 */
@property (nonatomic, strong) AWSDirectconnectDirectConnectGatewayAssociation * _Nullable directConnectGatewayAssociation;

@end

/**
 
 */
@interface AWSDirectconnectUpdateLagRequest : AWSRequest


/**
 <p>The ID of the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lagId;

/**
 <p>The name of the LAG.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lagName;

/**
 <p>The minimum number of physical connections that must be operational for the LAG itself to be operational.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimumLinks;

@end

/**
 
 */
@interface AWSDirectconnectUpdateVirtualInterfaceAttributesRequest : AWSRequest


/**
 <p>The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 9001. The default value is 1500.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mtu;

/**
 <p>The ID of the virtual private interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 <p>Information about a virtual private gateway for a private virtual interface.</p>
 */
@interface AWSDirectconnectVirtualGateway : AWSModel


/**
 <p>The ID of the virtual private gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualGatewayId;

/**
 <p>The state of the virtual private gateway. The following are the possible values:</p><ul><li><p><code>pending</code>: Initial state after creating the virtual private gateway.</p></li><li><p><code>available</code>: Ready for use by a private virtual interface.</p></li><li><p><code>deleting</code>: Initial state after deleting the virtual private gateway.</p></li><li><p><code>deleted</code>: The virtual private gateway is deleted. The private virtual interface is unable to send traffic over this gateway.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable virtualGatewayState;

@end

/**
 
 */
@interface AWSDirectconnectVirtualGateways : AWSModel


/**
 <p>The virtual private gateways.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectVirtualGateway *> * _Nullable virtualGateways;

@end

/**
 <p>Information about a virtual interface.</p>
 */
@interface AWSDirectconnectVirtualInterface : AWSModel


/**
 <p>The address family for the BGP peer.</p>
 */
@property (nonatomic, assign) AWSDirectconnectAddressFamily addressFamily;

/**
 <p>The IP address assigned to the Amazon interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable amazonAddress;

/**
 <p>The autonomous system number (ASN) for the Amazon side of the connection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable amazonSideAsn;

/**
 <p>The autonomous system (AS) number for Border Gateway Protocol (BGP) configuration.</p><p>The valid values are 1-2147483647.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable asn;

/**
 <p>The authentication key for BGP configuration. This string has a minimum length of 6 characters and and a maximun lenth of 80 characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authKey;

/**
 <p>The Direct Connect endpoint on which the virtual interface terminates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsDeviceV2;

/**
 <p>The BGP peers configured on this virtual interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectBGPPeer *> * _Nullable bgpPeers;

/**
 <p>The ID of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionId;

/**
 <p>The IP address assigned to the customer interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerAddress;

/**
 <p>The customer router configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerRouterConfig;

/**
 <p>The ID of the Direct Connect gateway.</p>
 */
@property (nonatomic, strong) NSString * _Nullable directConnectGatewayId;

/**
 <p>Indicates whether jumbo frames (9001 MTU) are supported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable jumboFrameCapable;

/**
 <p>The location of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The maximum transmission unit (MTU), in bytes. The supported values are 1500 and 9001. The default value is 1500.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable mtu;

/**
 <p>The ID of the AWS account that owns the virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

/**
 <p>The AWS Region where the virtual interface is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The routes to be advertised to the AWS network in this Region. Applies to public virtual interfaces.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectRouteFilterPrefix *> * _Nullable routeFilterPrefixes;

/**
 <p>The tags associated with the virtual interface.</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectTag *> * _Nullable tags;

/**
 <p>The ID of the virtual private gateway. Applies only to private virtual interfaces.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualGatewayId;

/**
 <p>The ID of the virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

/**
 <p>The name of the virtual interface assigned by the customer network. The name has a maximum of 100 characters. The following are valid characters: a-z, 0-9 and a hyphen (-).</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceName;

/**
 <p>The state of the virtual interface. The following are the possible values:</p><ul><li><p><code>confirming</code>: The creation of the virtual interface is pending confirmation from the virtual interface owner. If the owner of the virtual interface is different from the owner of the connection on which it is provisioned, then the virtual interface will remain in this state until it is confirmed by the virtual interface owner.</p></li><li><p><code>verifying</code>: This state only applies to public virtual interfaces. Each public virtual interface needs validation before the virtual interface can be created.</p></li><li><p><code>pending</code>: A virtual interface is in this state from the time that it is created until the virtual interface is ready to forward traffic.</p></li><li><p><code>available</code>: A virtual interface that is able to forward traffic.</p></li><li><p><code>down</code>: A virtual interface that is BGP down.</p></li><li><p><code>deleting</code>: A virtual interface is in this state immediately after calling <a>DeleteVirtualInterface</a> until it can no longer forward traffic.</p></li><li><p><code>deleted</code>: A virtual interface that cannot forward traffic.</p></li><li><p><code>rejected</code>: The virtual interface owner has declined creation of the virtual interface. If a virtual interface in the <code>Confirming</code> state is deleted by the virtual interface owner, the virtual interface enters the <code>Rejected</code> state.</p></li><li><p><code>unknown</code>: The state of the virtual interface is not available.</p></li></ul>
 */
@property (nonatomic, assign) AWSDirectconnectVirtualInterfaceState virtualInterfaceState;

/**
 <p>The type of virtual interface. The possible values are <code>private</code> and <code>public</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceType;

/**
 <p>The ID of the VLAN.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable vlan;

@end

/**
 <p>Information about the virtual interface failover test.</p>
 */
@interface AWSDirectconnectVirtualInterfaceTestHistory : AWSModel


/**
 <p>The BGP peers that were put in the DOWN state as part of the virtual interface failover test.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable bgpPeers;

/**
 <p>The time that the virtual interface moves out of the DOWN state.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The owner ID of the tested virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownerAccount;

/**
 <p>The time that the virtual interface moves to the DOWN state.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The status of the virtual interface failover test.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The time that the virtual interface failover test ran in minutes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable testDurationInMinutes;

/**
 <p>The ID of the virtual interface failover test.</p>
 */
@property (nonatomic, strong) NSString * _Nullable testId;

/**
 <p>The ID of the tested virtual interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualInterfaceId;

@end

/**
 
 */
@interface AWSDirectconnectVirtualInterfaces : AWSModel


/**
 <p>The virtual interfaces</p>
 */
@property (nonatomic, strong) NSArray<AWSDirectconnectVirtualInterface *> * _Nullable virtualInterfaces;

@end

NS_ASSUME_NONNULL_END
