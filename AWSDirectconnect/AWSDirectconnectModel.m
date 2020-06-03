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

#import "AWSDirectconnectModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSDirectconnectErrorDomain = @"com.amazonaws.AWSDirectconnectErrorDomain";

@implementation AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatedGatewayOwnerAccount" : @"associatedGatewayOwnerAccount",
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"overrideAllowedPrefixesToDirectConnectGateway" : @"overrideAllowedPrefixesToDirectConnectGateway",
             @"proposalId" : @"proposalId",
             };
}

+ (NSValueTransformer *)overrideAllowedPrefixesToDirectConnectGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectRouteFilterPrefix class]];
}

@end

@implementation AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayAssociation" : @"directConnectGatewayAssociation",
             };
}

+ (NSValueTransformer *)directConnectGatewayAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectDirectConnectGatewayAssociation class]];
}

@end

@implementation AWSDirectconnectAllocateConnectionOnInterconnectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bandwidth" : @"bandwidth",
             @"connectionName" : @"connectionName",
             @"interconnectId" : @"interconnectId",
             @"ownerAccount" : @"ownerAccount",
             @"vlan" : @"vlan",
             };
}

@end

@implementation AWSDirectconnectAllocateHostedConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bandwidth" : @"bandwidth",
             @"connectionId" : @"connectionId",
             @"connectionName" : @"connectionName",
             @"ownerAccount" : @"ownerAccount",
             @"tags" : @"tags",
             @"vlan" : @"vlan",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectAllocatePrivateVirtualInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             @"latestPrivateVirtualInterfaceAllocation" : @"newPrivateVirtualInterfaceAllocation",
             @"ownerAccount" : @"ownerAccount",
             };
}

+ (NSValueTransformer *)latestPrivateVirtualInterfaceAllocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectLatestPrivateVirtualInterfaceAllocation class]];
}

@end

@implementation AWSDirectconnectAllocatePublicVirtualInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             @"latestPublicVirtualInterfaceAllocation" : @"newPublicVirtualInterfaceAllocation",
             @"ownerAccount" : @"ownerAccount",
             };
}

+ (NSValueTransformer *)latestPublicVirtualInterfaceAllocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectLatestPublicVirtualInterfaceAllocation class]];
}

@end

@implementation AWSDirectconnectAllocateTransitVirtualInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             @"latestTransitVirtualInterfaceAllocation" : @"newTransitVirtualInterfaceAllocation",
             @"ownerAccount" : @"ownerAccount",
             };
}

+ (NSValueTransformer *)latestTransitVirtualInterfaceAllocationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectLatestTransitVirtualInterfaceAllocation class]];
}

@end

@implementation AWSDirectconnectAllocateTransitVirtualInterfaceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterface" : @"virtualInterface",
             };
}

+ (NSValueTransformer *)virtualInterfaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectVirtualInterface class]];
}

@end

@implementation AWSDirectconnectAssociateConnectionWithLagRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             @"lagId" : @"lagId",
             };
}

@end

@implementation AWSDirectconnectAssociateHostedConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             @"parentConnectionId" : @"parentConnectionId",
             };
}

@end

@implementation AWSDirectconnectAssociateVirtualInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

@end

@implementation AWSDirectconnectAssociatedGateway

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"id",
             @"ownerAccount" : @"ownerAccount",
             @"region" : @"region",
             @"types" : @"type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"virtualPrivateGateway"] == NSOrderedSame) {
            return @(AWSDirectconnectGatewayTypeVirtualPrivateGateway);
        }
        if ([value caseInsensitiveCompare:@"transitGateway"] == NSOrderedSame) {
            return @(AWSDirectconnectGatewayTypeTransitGateway);
        }
        return @(AWSDirectconnectGatewayTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectGatewayTypeVirtualPrivateGateway:
                return @"virtualPrivateGateway";
            case AWSDirectconnectGatewayTypeTransitGateway:
                return @"transitGateway";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectBGPPeer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressFamily" : @"addressFamily",
             @"amazonAddress" : @"amazonAddress",
             @"asn" : @"asn",
             @"authKey" : @"authKey",
             @"awsDeviceV2" : @"awsDeviceV2",
             @"bgpPeerId" : @"bgpPeerId",
             @"bgpPeerState" : @"bgpPeerState",
             @"bgpStatus" : @"bgpStatus",
             @"customerAddress" : @"customerAddress",
             };
}

+ (NSValueTransformer *)addressFamilyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv4);
        }
        if ([value caseInsensitiveCompare:@"ipv6"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv6);
        }
        return @(AWSDirectconnectAddressFamilyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectAddressFamilyIpv4:
                return @"ipv4";
            case AWSDirectconnectAddressFamilyIpv6:
                return @"ipv6";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bgpPeerStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"verifying"] == NSOrderedSame) {
            return @(AWSDirectconnectBGPPeerStateVerifying);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSDirectconnectBGPPeerStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSDirectconnectBGPPeerStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSDirectconnectBGPPeerStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSDirectconnectBGPPeerStateDeleted);
        }
        return @(AWSDirectconnectBGPPeerStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectBGPPeerStateVerifying:
                return @"verifying";
            case AWSDirectconnectBGPPeerStatePending:
                return @"pending";
            case AWSDirectconnectBGPPeerStateAvailable:
                return @"available";
            case AWSDirectconnectBGPPeerStateDeleting:
                return @"deleting";
            case AWSDirectconnectBGPPeerStateDeleted:
                return @"deleted";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bgpStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"up"] == NSOrderedSame) {
            return @(AWSDirectconnectBGPStatusUp);
        }
        if ([value caseInsensitiveCompare:@"down"] == NSOrderedSame) {
            return @(AWSDirectconnectBGPStatusDown);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectBGPStatusUnknown);
        }
        return @(AWSDirectconnectBGPStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectBGPStatusUp:
                return @"up";
            case AWSDirectconnectBGPStatusDown:
                return @"down";
            case AWSDirectconnectBGPStatusUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectConfirmConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             };
}

@end

@implementation AWSDirectconnectConfirmConnectionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionState" : @"connectionState",
             };
}

+ (NSValueTransformer *)connectionStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ordering"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateOrdering);
        }
        if ([value caseInsensitiveCompare:@"requested"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateRequested);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"down"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateDown);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"rejected"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateRejected);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateUnknown);
        }
        return @(AWSDirectconnectConnectionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectConnectionStateOrdering:
                return @"ordering";
            case AWSDirectconnectConnectionStateRequested:
                return @"requested";
            case AWSDirectconnectConnectionStatePending:
                return @"pending";
            case AWSDirectconnectConnectionStateAvailable:
                return @"available";
            case AWSDirectconnectConnectionStateDown:
                return @"down";
            case AWSDirectconnectConnectionStateDeleting:
                return @"deleting";
            case AWSDirectconnectConnectionStateDeleted:
                return @"deleted";
            case AWSDirectconnectConnectionStateRejected:
                return @"rejected";
            case AWSDirectconnectConnectionStateUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectConfirmPrivateVirtualInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"virtualGatewayId" : @"virtualGatewayId",
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

@end

@implementation AWSDirectconnectConfirmPrivateVirtualInterfaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterfaceState" : @"virtualInterfaceState",
             };
}

+ (NSValueTransformer *)virtualInterfaceStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"confirming"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateConfirming);
        }
        if ([value caseInsensitiveCompare:@"verifying"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateVerifying);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"down"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDown);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"rejected"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateRejected);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateUnknown);
        }
        return @(AWSDirectconnectVirtualInterfaceStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectVirtualInterfaceStateConfirming:
                return @"confirming";
            case AWSDirectconnectVirtualInterfaceStateVerifying:
                return @"verifying";
            case AWSDirectconnectVirtualInterfaceStatePending:
                return @"pending";
            case AWSDirectconnectVirtualInterfaceStateAvailable:
                return @"available";
            case AWSDirectconnectVirtualInterfaceStateDown:
                return @"down";
            case AWSDirectconnectVirtualInterfaceStateDeleting:
                return @"deleting";
            case AWSDirectconnectVirtualInterfaceStateDeleted:
                return @"deleted";
            case AWSDirectconnectVirtualInterfaceStateRejected:
                return @"rejected";
            case AWSDirectconnectVirtualInterfaceStateUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectConfirmPublicVirtualInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

@end

@implementation AWSDirectconnectConfirmPublicVirtualInterfaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterfaceState" : @"virtualInterfaceState",
             };
}

+ (NSValueTransformer *)virtualInterfaceStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"confirming"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateConfirming);
        }
        if ([value caseInsensitiveCompare:@"verifying"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateVerifying);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"down"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDown);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"rejected"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateRejected);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateUnknown);
        }
        return @(AWSDirectconnectVirtualInterfaceStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectVirtualInterfaceStateConfirming:
                return @"confirming";
            case AWSDirectconnectVirtualInterfaceStateVerifying:
                return @"verifying";
            case AWSDirectconnectVirtualInterfaceStatePending:
                return @"pending";
            case AWSDirectconnectVirtualInterfaceStateAvailable:
                return @"available";
            case AWSDirectconnectVirtualInterfaceStateDown:
                return @"down";
            case AWSDirectconnectVirtualInterfaceStateDeleting:
                return @"deleting";
            case AWSDirectconnectVirtualInterfaceStateDeleted:
                return @"deleted";
            case AWSDirectconnectVirtualInterfaceStateRejected:
                return @"rejected";
            case AWSDirectconnectVirtualInterfaceStateUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectConfirmTransitVirtualInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

@end

@implementation AWSDirectconnectConfirmTransitVirtualInterfaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterfaceState" : @"virtualInterfaceState",
             };
}

+ (NSValueTransformer *)virtualInterfaceStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"confirming"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateConfirming);
        }
        if ([value caseInsensitiveCompare:@"verifying"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateVerifying);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"down"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDown);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"rejected"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateRejected);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateUnknown);
        }
        return @(AWSDirectconnectVirtualInterfaceStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectVirtualInterfaceStateConfirming:
                return @"confirming";
            case AWSDirectconnectVirtualInterfaceStateVerifying:
                return @"verifying";
            case AWSDirectconnectVirtualInterfaceStatePending:
                return @"pending";
            case AWSDirectconnectVirtualInterfaceStateAvailable:
                return @"available";
            case AWSDirectconnectVirtualInterfaceStateDown:
                return @"down";
            case AWSDirectconnectVirtualInterfaceStateDeleting:
                return @"deleting";
            case AWSDirectconnectVirtualInterfaceStateDeleted:
                return @"deleted";
            case AWSDirectconnectVirtualInterfaceStateRejected:
                return @"rejected";
            case AWSDirectconnectVirtualInterfaceStateUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectConnection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsDevice" : @"awsDevice",
             @"awsDeviceV2" : @"awsDeviceV2",
             @"bandwidth" : @"bandwidth",
             @"connectionId" : @"connectionId",
             @"connectionName" : @"connectionName",
             @"connectionState" : @"connectionState",
             @"hasLogicalRedundancy" : @"hasLogicalRedundancy",
             @"jumboFrameCapable" : @"jumboFrameCapable",
             @"lagId" : @"lagId",
             @"loaIssueTime" : @"loaIssueTime",
             @"location" : @"location",
             @"ownerAccount" : @"ownerAccount",
             @"partnerName" : @"partnerName",
             @"providerName" : @"providerName",
             @"region" : @"region",
             @"tags" : @"tags",
             @"vlan" : @"vlan",
             };
}

+ (NSValueTransformer *)connectionStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ordering"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateOrdering);
        }
        if ([value caseInsensitiveCompare:@"requested"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateRequested);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"down"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateDown);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"rejected"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateRejected);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectConnectionStateUnknown);
        }
        return @(AWSDirectconnectConnectionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectConnectionStateOrdering:
                return @"ordering";
            case AWSDirectconnectConnectionStateRequested:
                return @"requested";
            case AWSDirectconnectConnectionStatePending:
                return @"pending";
            case AWSDirectconnectConnectionStateAvailable:
                return @"available";
            case AWSDirectconnectConnectionStateDown:
                return @"down";
            case AWSDirectconnectConnectionStateDeleting:
                return @"deleting";
            case AWSDirectconnectConnectionStateDeleted:
                return @"deleted";
            case AWSDirectconnectConnectionStateRejected:
                return @"rejected";
            case AWSDirectconnectConnectionStateUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)hasLogicalRedundancyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectHasLogicalRedundancyUnknown);
        }
        if ([value caseInsensitiveCompare:@"yes"] == NSOrderedSame) {
            return @(AWSDirectconnectHasLogicalRedundancyYes);
        }
        if ([value caseInsensitiveCompare:@"no"] == NSOrderedSame) {
            return @(AWSDirectconnectHasLogicalRedundancyNo);
        }
        return @(AWSDirectconnectHasLogicalRedundancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectHasLogicalRedundancyUnknown:
                return @"unknown";
            case AWSDirectconnectHasLogicalRedundancyYes:
                return @"yes";
            case AWSDirectconnectHasLogicalRedundancyNo:
                return @"no";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)loaIssueTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectConnections

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connections" : @"connections",
             };
}

+ (NSValueTransformer *)connectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectConnection class]];
}

@end

@implementation AWSDirectconnectCreateBGPPeerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestBGPPeer" : @"newBGPPeer",
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

+ (NSValueTransformer *)latestBGPPeerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectLatestBGPPeer class]];
}

@end

@implementation AWSDirectconnectCreateBGPPeerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterface" : @"virtualInterface",
             };
}

+ (NSValueTransformer *)virtualInterfaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectVirtualInterface class]];
}

@end

@implementation AWSDirectconnectCreateConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bandwidth" : @"bandwidth",
             @"connectionName" : @"connectionName",
             @"lagId" : @"lagId",
             @"location" : @"location",
             @"providerName" : @"providerName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectCreateDirectConnectGatewayAssociationProposalRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addAllowedPrefixesToDirectConnectGateway" : @"addAllowedPrefixesToDirectConnectGateway",
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"directConnectGatewayOwnerAccount" : @"directConnectGatewayOwnerAccount",
             @"gatewayId" : @"gatewayId",
             @"removeAllowedPrefixesToDirectConnectGateway" : @"removeAllowedPrefixesToDirectConnectGateway",
             };
}

+ (NSValueTransformer *)addAllowedPrefixesToDirectConnectGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectRouteFilterPrefix class]];
}

+ (NSValueTransformer *)removeAllowedPrefixesToDirectConnectGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectRouteFilterPrefix class]];
}

@end

@implementation AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayAssociationProposal" : @"directConnectGatewayAssociationProposal",
             };
}

+ (NSValueTransformer *)directConnectGatewayAssociationProposalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectDirectConnectGatewayAssociationProposal class]];
}

@end

@implementation AWSDirectconnectCreateDirectConnectGatewayAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addAllowedPrefixesToDirectConnectGateway" : @"addAllowedPrefixesToDirectConnectGateway",
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"gatewayId" : @"gatewayId",
             @"virtualGatewayId" : @"virtualGatewayId",
             };
}

+ (NSValueTransformer *)addAllowedPrefixesToDirectConnectGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectRouteFilterPrefix class]];
}

@end

@implementation AWSDirectconnectCreateDirectConnectGatewayAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayAssociation" : @"directConnectGatewayAssociation",
             };
}

+ (NSValueTransformer *)directConnectGatewayAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectDirectConnectGatewayAssociation class]];
}

@end

@implementation AWSDirectconnectCreateDirectConnectGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amazonSideAsn" : @"amazonSideAsn",
             @"directConnectGatewayName" : @"directConnectGatewayName",
             };
}

@end

@implementation AWSDirectconnectCreateDirectConnectGatewayResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGateway" : @"directConnectGateway",
             };
}

+ (NSValueTransformer *)directConnectGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectDirectConnectGateway class]];
}

@end

@implementation AWSDirectconnectCreateInterconnectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bandwidth" : @"bandwidth",
             @"interconnectName" : @"interconnectName",
             @"lagId" : @"lagId",
             @"location" : @"location",
             @"providerName" : @"providerName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectCreateLagRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"childConnectionTags" : @"childConnectionTags",
             @"connectionId" : @"connectionId",
             @"connectionsBandwidth" : @"connectionsBandwidth",
             @"lagName" : @"lagName",
             @"location" : @"location",
             @"numberOfConnections" : @"numberOfConnections",
             @"providerName" : @"providerName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)childConnectionTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectCreatePrivateVirtualInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             @"latestPrivateVirtualInterface" : @"newPrivateVirtualInterface",
             };
}

+ (NSValueTransformer *)latestPrivateVirtualInterfaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectLatestPrivateVirtualInterface class]];
}

@end

@implementation AWSDirectconnectCreatePublicVirtualInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             @"latestPublicVirtualInterface" : @"newPublicVirtualInterface",
             };
}

+ (NSValueTransformer *)latestPublicVirtualInterfaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectLatestPublicVirtualInterface class]];
}

@end

@implementation AWSDirectconnectCreateTransitVirtualInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             @"latestTransitVirtualInterface" : @"newTransitVirtualInterface",
             };
}

+ (NSValueTransformer *)latestTransitVirtualInterfaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectLatestTransitVirtualInterface class]];
}

@end

@implementation AWSDirectconnectCreateTransitVirtualInterfaceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterface" : @"virtualInterface",
             };
}

+ (NSValueTransformer *)virtualInterfaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectVirtualInterface class]];
}

@end

@implementation AWSDirectconnectDeleteBGPPeerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"asn" : @"asn",
             @"bgpPeerId" : @"bgpPeerId",
             @"customerAddress" : @"customerAddress",
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

@end

@implementation AWSDirectconnectDeleteBGPPeerResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterface" : @"virtualInterface",
             };
}

+ (NSValueTransformer *)virtualInterfaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectVirtualInterface class]];
}

@end

@implementation AWSDirectconnectDeleteConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             };
}

@end

@implementation AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"proposalId" : @"proposalId",
             };
}

@end

@implementation AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayAssociationProposal" : @"directConnectGatewayAssociationProposal",
             };
}

+ (NSValueTransformer *)directConnectGatewayAssociationProposalJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectDirectConnectGatewayAssociationProposal class]];
}

@end

@implementation AWSDirectconnectDeleteDirectConnectGatewayAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"associationId",
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"virtualGatewayId" : @"virtualGatewayId",
             };
}

@end

@implementation AWSDirectconnectDeleteDirectConnectGatewayAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayAssociation" : @"directConnectGatewayAssociation",
             };
}

+ (NSValueTransformer *)directConnectGatewayAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectDirectConnectGatewayAssociation class]];
}

@end

@implementation AWSDirectconnectDeleteDirectConnectGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayId" : @"directConnectGatewayId",
             };
}

@end

@implementation AWSDirectconnectDeleteDirectConnectGatewayResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGateway" : @"directConnectGateway",
             };
}

+ (NSValueTransformer *)directConnectGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectDirectConnectGateway class]];
}

@end

@implementation AWSDirectconnectDeleteInterconnectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"interconnectId" : @"interconnectId",
             };
}

@end

@implementation AWSDirectconnectDeleteInterconnectResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"interconnectState" : @"interconnectState",
             };
}

+ (NSValueTransformer *)interconnectStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requested"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStateRequested);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"down"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStateDown);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStateUnknown);
        }
        return @(AWSDirectconnectInterconnectStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectInterconnectStateRequested:
                return @"requested";
            case AWSDirectconnectInterconnectStatePending:
                return @"pending";
            case AWSDirectconnectInterconnectStateAvailable:
                return @"available";
            case AWSDirectconnectInterconnectStateDown:
                return @"down";
            case AWSDirectconnectInterconnectStateDeleting:
                return @"deleting";
            case AWSDirectconnectInterconnectStateDeleted:
                return @"deleted";
            case AWSDirectconnectInterconnectStateUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectDeleteLagRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lagId" : @"lagId",
             };
}

@end

@implementation AWSDirectconnectDeleteVirtualInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

@end

@implementation AWSDirectconnectDeleteVirtualInterfaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterfaceState" : @"virtualInterfaceState",
             };
}

+ (NSValueTransformer *)virtualInterfaceStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"confirming"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateConfirming);
        }
        if ([value caseInsensitiveCompare:@"verifying"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateVerifying);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"down"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDown);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"rejected"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateRejected);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateUnknown);
        }
        return @(AWSDirectconnectVirtualInterfaceStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectVirtualInterfaceStateConfirming:
                return @"confirming";
            case AWSDirectconnectVirtualInterfaceStateVerifying:
                return @"verifying";
            case AWSDirectconnectVirtualInterfaceStatePending:
                return @"pending";
            case AWSDirectconnectVirtualInterfaceStateAvailable:
                return @"available";
            case AWSDirectconnectVirtualInterfaceStateDown:
                return @"down";
            case AWSDirectconnectVirtualInterfaceStateDeleting:
                return @"deleting";
            case AWSDirectconnectVirtualInterfaceStateDeleted:
                return @"deleted";
            case AWSDirectconnectVirtualInterfaceStateRejected:
                return @"rejected";
            case AWSDirectconnectVirtualInterfaceStateUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectDescribeConnectionLoaRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             @"loaContentType" : @"loaContentType",
             @"providerName" : @"providerName",
             };
}

+ (NSValueTransformer *)loaContentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"application/pdf"] == NSOrderedSame) {
            return @(AWSDirectconnectLoaContentTypeApplicationPdf);
        }
        return @(AWSDirectconnectLoaContentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectLoaContentTypeApplicationPdf:
                return @"application/pdf";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectDescribeConnectionLoaResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loa" : @"loa",
             };
}

+ (NSValueTransformer *)loaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectLoa class]];
}

@end

@implementation AWSDirectconnectDescribeConnectionsOnInterconnectRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"interconnectId" : @"interconnectId",
             };
}

@end

@implementation AWSDirectconnectDescribeConnectionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             };
}

@end

@implementation AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatedGatewayId" : @"associatedGatewayId",
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"proposalId" : @"proposalId",
             };
}

@end

@implementation AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayAssociationProposals" : @"directConnectGatewayAssociationProposals",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)directConnectGatewayAssociationProposalsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectDirectConnectGatewayAssociationProposal class]];
}

@end

@implementation AWSDirectconnectDescribeDirectConnectGatewayAssociationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatedGatewayId" : @"associatedGatewayId",
             @"associationId" : @"associationId",
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"virtualGatewayId" : @"virtualGatewayId",
             };
}

@end

@implementation AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayAssociations" : @"directConnectGatewayAssociations",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)directConnectGatewayAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectDirectConnectGatewayAssociation class]];
}

@end

@implementation AWSDirectconnectDescribeDirectConnectGatewayAttachmentsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

@end

@implementation AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayAttachments" : @"directConnectGatewayAttachments",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)directConnectGatewayAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectDirectConnectGatewayAttachment class]];
}

@end

@implementation AWSDirectconnectDescribeDirectConnectGatewaysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

@end

@implementation AWSDirectconnectDescribeDirectConnectGatewaysResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGateways" : @"directConnectGateways",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)directConnectGatewaysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectDirectConnectGateway class]];
}

@end

@implementation AWSDirectconnectDescribeHostedConnectionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             };
}

@end

@implementation AWSDirectconnectDescribeInterconnectLoaRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"interconnectId" : @"interconnectId",
             @"loaContentType" : @"loaContentType",
             @"providerName" : @"providerName",
             };
}

+ (NSValueTransformer *)loaContentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"application/pdf"] == NSOrderedSame) {
            return @(AWSDirectconnectLoaContentTypeApplicationPdf);
        }
        return @(AWSDirectconnectLoaContentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectLoaContentTypeApplicationPdf:
                return @"application/pdf";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectDescribeInterconnectLoaResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loa" : @"loa",
             };
}

+ (NSValueTransformer *)loaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectLoa class]];
}

@end

@implementation AWSDirectconnectDescribeInterconnectsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"interconnectId" : @"interconnectId",
             };
}

@end

@implementation AWSDirectconnectDescribeLagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lagId" : @"lagId",
             };
}

@end

@implementation AWSDirectconnectDescribeLoaRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             @"loaContentType" : @"loaContentType",
             @"providerName" : @"providerName",
             };
}

+ (NSValueTransformer *)loaContentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"application/pdf"] == NSOrderedSame) {
            return @(AWSDirectconnectLoaContentTypeApplicationPdf);
        }
        return @(AWSDirectconnectLoaContentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectLoaContentTypeApplicationPdf:
                return @"application/pdf";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectDescribeTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArns" : @"resourceArns",
             };
}

@end

@implementation AWSDirectconnectDescribeTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceTags" : @"resourceTags",
             };
}

+ (NSValueTransformer *)resourceTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectResourceTag class]];
}

@end

@implementation AWSDirectconnectDescribeVirtualInterfacesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

@end

@implementation AWSDirectconnectDirectConnectGateway

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amazonSideAsn" : @"amazonSideAsn",
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"directConnectGatewayName" : @"directConnectGatewayName",
             @"directConnectGatewayState" : @"directConnectGatewayState",
             @"ownerAccount" : @"ownerAccount",
             @"stateChangeError" : @"stateChangeError",
             };
}

+ (NSValueTransformer *)directConnectGatewayStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayStateDeleted);
        }
        return @(AWSDirectconnectDirectConnectGatewayStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectDirectConnectGatewayStatePending:
                return @"pending";
            case AWSDirectconnectDirectConnectGatewayStateAvailable:
                return @"available";
            case AWSDirectconnectDirectConnectGatewayStateDeleting:
                return @"deleting";
            case AWSDirectconnectDirectConnectGatewayStateDeleted:
                return @"deleted";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectDirectConnectGatewayAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedPrefixesToDirectConnectGateway" : @"allowedPrefixesToDirectConnectGateway",
             @"associatedGateway" : @"associatedGateway",
             @"associationId" : @"associationId",
             @"associationState" : @"associationState",
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"directConnectGatewayOwnerAccount" : @"directConnectGatewayOwnerAccount",
             @"stateChangeError" : @"stateChangeError",
             @"virtualGatewayId" : @"virtualGatewayId",
             @"virtualGatewayOwnerAccount" : @"virtualGatewayOwnerAccount",
             @"virtualGatewayRegion" : @"virtualGatewayRegion",
             };
}

+ (NSValueTransformer *)allowedPrefixesToDirectConnectGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectRouteFilterPrefix class]];
}

+ (NSValueTransformer *)associatedGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectAssociatedGateway class]];
}

+ (NSValueTransformer *)associationStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"associating"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAssociationStateAssociating);
        }
        if ([value caseInsensitiveCompare:@"associated"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAssociationStateAssociated);
        }
        if ([value caseInsensitiveCompare:@"disassociating"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAssociationStateDisassociating);
        }
        if ([value caseInsensitiveCompare:@"disassociated"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAssociationStateDisassociated);
        }
        if ([value caseInsensitiveCompare:@"updating"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAssociationStateUpdating);
        }
        return @(AWSDirectconnectDirectConnectGatewayAssociationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectDirectConnectGatewayAssociationStateAssociating:
                return @"associating";
            case AWSDirectconnectDirectConnectGatewayAssociationStateAssociated:
                return @"associated";
            case AWSDirectconnectDirectConnectGatewayAssociationStateDisassociating:
                return @"disassociating";
            case AWSDirectconnectDirectConnectGatewayAssociationStateDisassociated:
                return @"disassociated";
            case AWSDirectconnectDirectConnectGatewayAssociationStateUpdating:
                return @"updating";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectDirectConnectGatewayAssociationProposal

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatedGateway" : @"associatedGateway",
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"directConnectGatewayOwnerAccount" : @"directConnectGatewayOwnerAccount",
             @"existingAllowedPrefixesToDirectConnectGateway" : @"existingAllowedPrefixesToDirectConnectGateway",
             @"proposalId" : @"proposalId",
             @"proposalState" : @"proposalState",
             @"requestedAllowedPrefixesToDirectConnectGateway" : @"requestedAllowedPrefixesToDirectConnectGateway",
             };
}

+ (NSValueTransformer *)associatedGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectAssociatedGateway class]];
}

+ (NSValueTransformer *)existingAllowedPrefixesToDirectConnectGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectRouteFilterPrefix class]];
}

+ (NSValueTransformer *)proposalStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requested"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAssociationProposalStateRequested);
        }
        if ([value caseInsensitiveCompare:@"accepted"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAssociationProposalStateAccepted);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAssociationProposalStateDeleted);
        }
        return @(AWSDirectconnectDirectConnectGatewayAssociationProposalStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectDirectConnectGatewayAssociationProposalStateRequested:
                return @"requested";
            case AWSDirectconnectDirectConnectGatewayAssociationProposalStateAccepted:
                return @"accepted";
            case AWSDirectconnectDirectConnectGatewayAssociationProposalStateDeleted:
                return @"deleted";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requestedAllowedPrefixesToDirectConnectGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectRouteFilterPrefix class]];
}

@end

@implementation AWSDirectconnectDirectConnectGatewayAttachment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentState" : @"attachmentState",
             @"attachmentType" : @"attachmentType",
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"stateChangeError" : @"stateChangeError",
             @"virtualInterfaceId" : @"virtualInterfaceId",
             @"virtualInterfaceOwnerAccount" : @"virtualInterfaceOwnerAccount",
             @"virtualInterfaceRegion" : @"virtualInterfaceRegion",
             };
}

+ (NSValueTransformer *)attachmentStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"attaching"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAttachmentStateAttaching);
        }
        if ([value caseInsensitiveCompare:@"attached"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAttachmentStateAttached);
        }
        if ([value caseInsensitiveCompare:@"detaching"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAttachmentStateDetaching);
        }
        if ([value caseInsensitiveCompare:@"detached"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAttachmentStateDetached);
        }
        return @(AWSDirectconnectDirectConnectGatewayAttachmentStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectDirectConnectGatewayAttachmentStateAttaching:
                return @"attaching";
            case AWSDirectconnectDirectConnectGatewayAttachmentStateAttached:
                return @"attached";
            case AWSDirectconnectDirectConnectGatewayAttachmentStateDetaching:
                return @"detaching";
            case AWSDirectconnectDirectConnectGatewayAttachmentStateDetached:
                return @"detached";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)attachmentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TransitVirtualInterface"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAttachmentTypeTransitVirtualInterface);
        }
        if ([value caseInsensitiveCompare:@"PrivateVirtualInterface"] == NSOrderedSame) {
            return @(AWSDirectconnectDirectConnectGatewayAttachmentTypePrivateVirtualInterface);
        }
        return @(AWSDirectconnectDirectConnectGatewayAttachmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectDirectConnectGatewayAttachmentTypeTransitVirtualInterface:
                return @"TransitVirtualInterface";
            case AWSDirectconnectDirectConnectGatewayAttachmentTypePrivateVirtualInterface:
                return @"PrivateVirtualInterface";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectDisassociateConnectionFromLagRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectionId" : @"connectionId",
             @"lagId" : @"lagId",
             };
}

@end

@implementation AWSDirectconnectInterconnect

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsDevice" : @"awsDevice",
             @"awsDeviceV2" : @"awsDeviceV2",
             @"bandwidth" : @"bandwidth",
             @"hasLogicalRedundancy" : @"hasLogicalRedundancy",
             @"interconnectId" : @"interconnectId",
             @"interconnectName" : @"interconnectName",
             @"interconnectState" : @"interconnectState",
             @"jumboFrameCapable" : @"jumboFrameCapable",
             @"lagId" : @"lagId",
             @"loaIssueTime" : @"loaIssueTime",
             @"location" : @"location",
             @"providerName" : @"providerName",
             @"region" : @"region",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)hasLogicalRedundancyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectHasLogicalRedundancyUnknown);
        }
        if ([value caseInsensitiveCompare:@"yes"] == NSOrderedSame) {
            return @(AWSDirectconnectHasLogicalRedundancyYes);
        }
        if ([value caseInsensitiveCompare:@"no"] == NSOrderedSame) {
            return @(AWSDirectconnectHasLogicalRedundancyNo);
        }
        return @(AWSDirectconnectHasLogicalRedundancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectHasLogicalRedundancyUnknown:
                return @"unknown";
            case AWSDirectconnectHasLogicalRedundancyYes:
                return @"yes";
            case AWSDirectconnectHasLogicalRedundancyNo:
                return @"no";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)interconnectStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requested"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStateRequested);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"down"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStateDown);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectInterconnectStateUnknown);
        }
        return @(AWSDirectconnectInterconnectStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectInterconnectStateRequested:
                return @"requested";
            case AWSDirectconnectInterconnectStatePending:
                return @"pending";
            case AWSDirectconnectInterconnectStateAvailable:
                return @"available";
            case AWSDirectconnectInterconnectStateDown:
                return @"down";
            case AWSDirectconnectInterconnectStateDeleting:
                return @"deleting";
            case AWSDirectconnectInterconnectStateDeleted:
                return @"deleted";
            case AWSDirectconnectInterconnectStateUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)loaIssueTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectInterconnects

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"interconnects" : @"interconnects",
             };
}

+ (NSValueTransformer *)interconnectsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectInterconnect class]];
}

@end

@implementation AWSDirectconnectLag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowsHostedConnections" : @"allowsHostedConnections",
             @"awsDevice" : @"awsDevice",
             @"awsDeviceV2" : @"awsDeviceV2",
             @"connections" : @"connections",
             @"connectionsBandwidth" : @"connectionsBandwidth",
             @"hasLogicalRedundancy" : @"hasLogicalRedundancy",
             @"jumboFrameCapable" : @"jumboFrameCapable",
             @"lagId" : @"lagId",
             @"lagName" : @"lagName",
             @"lagState" : @"lagState",
             @"location" : @"location",
             @"minimumLinks" : @"minimumLinks",
             @"numberOfConnections" : @"numberOfConnections",
             @"ownerAccount" : @"ownerAccount",
             @"providerName" : @"providerName",
             @"region" : @"region",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)connectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectConnection class]];
}

+ (NSValueTransformer *)hasLogicalRedundancyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectHasLogicalRedundancyUnknown);
        }
        if ([value caseInsensitiveCompare:@"yes"] == NSOrderedSame) {
            return @(AWSDirectconnectHasLogicalRedundancyYes);
        }
        if ([value caseInsensitiveCompare:@"no"] == NSOrderedSame) {
            return @(AWSDirectconnectHasLogicalRedundancyNo);
        }
        return @(AWSDirectconnectHasLogicalRedundancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectHasLogicalRedundancyUnknown:
                return @"unknown";
            case AWSDirectconnectHasLogicalRedundancyYes:
                return @"yes";
            case AWSDirectconnectHasLogicalRedundancyNo:
                return @"no";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lagStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"requested"] == NSOrderedSame) {
            return @(AWSDirectconnectLagStateRequested);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSDirectconnectLagStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSDirectconnectLagStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"down"] == NSOrderedSame) {
            return @(AWSDirectconnectLagStateDown);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSDirectconnectLagStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSDirectconnectLagStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectLagStateUnknown);
        }
        return @(AWSDirectconnectLagStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectLagStateRequested:
                return @"requested";
            case AWSDirectconnectLagStatePending:
                return @"pending";
            case AWSDirectconnectLagStateAvailable:
                return @"available";
            case AWSDirectconnectLagStateDown:
                return @"down";
            case AWSDirectconnectLagStateDeleting:
                return @"deleting";
            case AWSDirectconnectLagStateDeleted:
                return @"deleted";
            case AWSDirectconnectLagStateUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectLags

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lags" : @"lags",
             };
}

+ (NSValueTransformer *)lagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectLag class]];
}

@end

@implementation AWSDirectconnectListVirtualInterfaceTestHistoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bgpPeers" : @"bgpPeers",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             @"status" : @"status",
             @"testId" : @"testId",
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

@end

@implementation AWSDirectconnectListVirtualInterfaceTestHistoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"virtualInterfaceTestHistory" : @"virtualInterfaceTestHistory",
             };
}

+ (NSValueTransformer *)virtualInterfaceTestHistoryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectVirtualInterfaceTestHistory class]];
}

@end

@implementation AWSDirectconnectLoa

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loaContent" : @"loaContent",
             @"loaContentType" : @"loaContentType",
             };
}

+ (NSValueTransformer *)loaContentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"application/pdf"] == NSOrderedSame) {
            return @(AWSDirectconnectLoaContentTypeApplicationPdf);
        }
        return @(AWSDirectconnectLoaContentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectLoaContentTypeApplicationPdf:
                return @"application/pdf";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availablePortSpeeds" : @"availablePortSpeeds",
             @"availableProviders" : @"availableProviders",
             @"locationCode" : @"locationCode",
             @"locationName" : @"locationName",
             @"region" : @"region",
             };
}

@end

@implementation AWSDirectconnectLocations

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"locations" : @"locations",
             };
}

+ (NSValueTransformer *)locationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectLocation class]];
}

@end

@implementation AWSDirectconnectLatestBGPPeer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressFamily" : @"addressFamily",
             @"amazonAddress" : @"amazonAddress",
             @"asn" : @"asn",
             @"authKey" : @"authKey",
             @"customerAddress" : @"customerAddress",
             };
}

+ (NSValueTransformer *)addressFamilyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv4);
        }
        if ([value caseInsensitiveCompare:@"ipv6"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv6);
        }
        return @(AWSDirectconnectAddressFamilyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectAddressFamilyIpv4:
                return @"ipv4";
            case AWSDirectconnectAddressFamilyIpv6:
                return @"ipv6";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectLatestPrivateVirtualInterface

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressFamily" : @"addressFamily",
             @"amazonAddress" : @"amazonAddress",
             @"asn" : @"asn",
             @"authKey" : @"authKey",
             @"customerAddress" : @"customerAddress",
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"mtu" : @"mtu",
             @"tags" : @"tags",
             @"virtualGatewayId" : @"virtualGatewayId",
             @"virtualInterfaceName" : @"virtualInterfaceName",
             @"vlan" : @"vlan",
             };
}

+ (NSValueTransformer *)addressFamilyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv4);
        }
        if ([value caseInsensitiveCompare:@"ipv6"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv6);
        }
        return @(AWSDirectconnectAddressFamilyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectAddressFamilyIpv4:
                return @"ipv4";
            case AWSDirectconnectAddressFamilyIpv6:
                return @"ipv6";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectLatestPrivateVirtualInterfaceAllocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressFamily" : @"addressFamily",
             @"amazonAddress" : @"amazonAddress",
             @"asn" : @"asn",
             @"authKey" : @"authKey",
             @"customerAddress" : @"customerAddress",
             @"mtu" : @"mtu",
             @"tags" : @"tags",
             @"virtualInterfaceName" : @"virtualInterfaceName",
             @"vlan" : @"vlan",
             };
}

+ (NSValueTransformer *)addressFamilyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv4);
        }
        if ([value caseInsensitiveCompare:@"ipv6"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv6);
        }
        return @(AWSDirectconnectAddressFamilyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectAddressFamilyIpv4:
                return @"ipv4";
            case AWSDirectconnectAddressFamilyIpv6:
                return @"ipv6";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectLatestPublicVirtualInterface

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressFamily" : @"addressFamily",
             @"amazonAddress" : @"amazonAddress",
             @"asn" : @"asn",
             @"authKey" : @"authKey",
             @"customerAddress" : @"customerAddress",
             @"routeFilterPrefixes" : @"routeFilterPrefixes",
             @"tags" : @"tags",
             @"virtualInterfaceName" : @"virtualInterfaceName",
             @"vlan" : @"vlan",
             };
}

+ (NSValueTransformer *)addressFamilyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv4);
        }
        if ([value caseInsensitiveCompare:@"ipv6"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv6);
        }
        return @(AWSDirectconnectAddressFamilyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectAddressFamilyIpv4:
                return @"ipv4";
            case AWSDirectconnectAddressFamilyIpv6:
                return @"ipv6";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)routeFilterPrefixesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectRouteFilterPrefix class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectLatestPublicVirtualInterfaceAllocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressFamily" : @"addressFamily",
             @"amazonAddress" : @"amazonAddress",
             @"asn" : @"asn",
             @"authKey" : @"authKey",
             @"customerAddress" : @"customerAddress",
             @"routeFilterPrefixes" : @"routeFilterPrefixes",
             @"tags" : @"tags",
             @"virtualInterfaceName" : @"virtualInterfaceName",
             @"vlan" : @"vlan",
             };
}

+ (NSValueTransformer *)addressFamilyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv4);
        }
        if ([value caseInsensitiveCompare:@"ipv6"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv6);
        }
        return @(AWSDirectconnectAddressFamilyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectAddressFamilyIpv4:
                return @"ipv4";
            case AWSDirectconnectAddressFamilyIpv6:
                return @"ipv6";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)routeFilterPrefixesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectRouteFilterPrefix class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectLatestTransitVirtualInterface

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressFamily" : @"addressFamily",
             @"amazonAddress" : @"amazonAddress",
             @"asn" : @"asn",
             @"authKey" : @"authKey",
             @"customerAddress" : @"customerAddress",
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"mtu" : @"mtu",
             @"tags" : @"tags",
             @"virtualInterfaceName" : @"virtualInterfaceName",
             @"vlan" : @"vlan",
             };
}

+ (NSValueTransformer *)addressFamilyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv4);
        }
        if ([value caseInsensitiveCompare:@"ipv6"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv6);
        }
        return @(AWSDirectconnectAddressFamilyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectAddressFamilyIpv4:
                return @"ipv4";
            case AWSDirectconnectAddressFamilyIpv6:
                return @"ipv6";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectLatestTransitVirtualInterfaceAllocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressFamily" : @"addressFamily",
             @"amazonAddress" : @"amazonAddress",
             @"asn" : @"asn",
             @"authKey" : @"authKey",
             @"customerAddress" : @"customerAddress",
             @"mtu" : @"mtu",
             @"tags" : @"tags",
             @"virtualInterfaceName" : @"virtualInterfaceName",
             @"vlan" : @"vlan",
             };
}

+ (NSValueTransformer *)addressFamilyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv4);
        }
        if ([value caseInsensitiveCompare:@"ipv6"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv6);
        }
        return @(AWSDirectconnectAddressFamilyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectAddressFamilyIpv4:
                return @"ipv4";
            case AWSDirectconnectAddressFamilyIpv6:
                return @"ipv6";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectResourceTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectRouteFilterPrefix

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidr" : @"cidr",
             };
}

@end

@implementation AWSDirectconnectStartBgpFailoverTestRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bgpPeers" : @"bgpPeers",
             @"testDurationInMinutes" : @"testDurationInMinutes",
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

@end

@implementation AWSDirectconnectStartBgpFailoverTestResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterfaceTest" : @"virtualInterfaceTest",
             };
}

+ (NSValueTransformer *)virtualInterfaceTestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectVirtualInterfaceTestHistory class]];
}

@end

@implementation AWSDirectconnectStopBgpFailoverTestRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

@end

@implementation AWSDirectconnectStopBgpFailoverTestResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterfaceTest" : @"virtualInterfaceTest",
             };
}

+ (NSValueTransformer *)virtualInterfaceTestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectVirtualInterfaceTestHistory class]];
}

@end

@implementation AWSDirectconnectTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

@end

@implementation AWSDirectconnectTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

@end

@implementation AWSDirectconnectTagResourceResponse

@end

@implementation AWSDirectconnectUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSDirectconnectUntagResourceResponse

@end

@implementation AWSDirectconnectUpdateDirectConnectGatewayAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addAllowedPrefixesToDirectConnectGateway" : @"addAllowedPrefixesToDirectConnectGateway",
             @"associationId" : @"associationId",
             @"removeAllowedPrefixesToDirectConnectGateway" : @"removeAllowedPrefixesToDirectConnectGateway",
             };
}

+ (NSValueTransformer *)addAllowedPrefixesToDirectConnectGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectRouteFilterPrefix class]];
}

+ (NSValueTransformer *)removeAllowedPrefixesToDirectConnectGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectRouteFilterPrefix class]];
}

@end

@implementation AWSDirectconnectUpdateDirectConnectGatewayAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"directConnectGatewayAssociation" : @"directConnectGatewayAssociation",
             };
}

+ (NSValueTransformer *)directConnectGatewayAssociationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSDirectconnectDirectConnectGatewayAssociation class]];
}

@end

@implementation AWSDirectconnectUpdateLagRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lagId" : @"lagId",
             @"lagName" : @"lagName",
             @"minimumLinks" : @"minimumLinks",
             };
}

@end

@implementation AWSDirectconnectUpdateVirtualInterfaceAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mtu" : @"mtu",
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

@end

@implementation AWSDirectconnectVirtualGateway

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualGatewayId" : @"virtualGatewayId",
             @"virtualGatewayState" : @"virtualGatewayState",
             };
}

@end

@implementation AWSDirectconnectVirtualGateways

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualGateways" : @"virtualGateways",
             };
}

+ (NSValueTransformer *)virtualGatewaysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectVirtualGateway class]];
}

@end

@implementation AWSDirectconnectVirtualInterface

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressFamily" : @"addressFamily",
             @"amazonAddress" : @"amazonAddress",
             @"amazonSideAsn" : @"amazonSideAsn",
             @"asn" : @"asn",
             @"authKey" : @"authKey",
             @"awsDeviceV2" : @"awsDeviceV2",
             @"bgpPeers" : @"bgpPeers",
             @"connectionId" : @"connectionId",
             @"customerAddress" : @"customerAddress",
             @"customerRouterConfig" : @"customerRouterConfig",
             @"directConnectGatewayId" : @"directConnectGatewayId",
             @"jumboFrameCapable" : @"jumboFrameCapable",
             @"location" : @"location",
             @"mtu" : @"mtu",
             @"ownerAccount" : @"ownerAccount",
             @"region" : @"region",
             @"routeFilterPrefixes" : @"routeFilterPrefixes",
             @"tags" : @"tags",
             @"virtualGatewayId" : @"virtualGatewayId",
             @"virtualInterfaceId" : @"virtualInterfaceId",
             @"virtualInterfaceName" : @"virtualInterfaceName",
             @"virtualInterfaceState" : @"virtualInterfaceState",
             @"virtualInterfaceType" : @"virtualInterfaceType",
             @"vlan" : @"vlan",
             };
}

+ (NSValueTransformer *)addressFamilyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipv4"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv4);
        }
        if ([value caseInsensitiveCompare:@"ipv6"] == NSOrderedSame) {
            return @(AWSDirectconnectAddressFamilyIpv6);
        }
        return @(AWSDirectconnectAddressFamilyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectAddressFamilyIpv4:
                return @"ipv4";
            case AWSDirectconnectAddressFamilyIpv6:
                return @"ipv6";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)bgpPeersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectBGPPeer class]];
}

+ (NSValueTransformer *)routeFilterPrefixesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectRouteFilterPrefix class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectTag class]];
}

+ (NSValueTransformer *)virtualInterfaceStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"confirming"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateConfirming);
        }
        if ([value caseInsensitiveCompare:@"verifying"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateVerifying);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"down"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDown);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"rejected"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateRejected);
        }
        if ([value caseInsensitiveCompare:@"unknown"] == NSOrderedSame) {
            return @(AWSDirectconnectVirtualInterfaceStateUnknown);
        }
        return @(AWSDirectconnectVirtualInterfaceStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSDirectconnectVirtualInterfaceStateConfirming:
                return @"confirming";
            case AWSDirectconnectVirtualInterfaceStateVerifying:
                return @"verifying";
            case AWSDirectconnectVirtualInterfaceStatePending:
                return @"pending";
            case AWSDirectconnectVirtualInterfaceStateAvailable:
                return @"available";
            case AWSDirectconnectVirtualInterfaceStateDown:
                return @"down";
            case AWSDirectconnectVirtualInterfaceStateDeleting:
                return @"deleting";
            case AWSDirectconnectVirtualInterfaceStateDeleted:
                return @"deleted";
            case AWSDirectconnectVirtualInterfaceStateRejected:
                return @"rejected";
            case AWSDirectconnectVirtualInterfaceStateUnknown:
                return @"unknown";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSDirectconnectVirtualInterfaceTestHistory

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bgpPeers" : @"bgpPeers",
             @"endTime" : @"endTime",
             @"ownerAccount" : @"ownerAccount",
             @"startTime" : @"startTime",
             @"status" : @"status",
             @"testDurationInMinutes" : @"testDurationInMinutes",
             @"testId" : @"testId",
             @"virtualInterfaceId" : @"virtualInterfaceId",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSDirectconnectVirtualInterfaces

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"virtualInterfaces" : @"virtualInterfaces",
             };
}

+ (NSValueTransformer *)virtualInterfacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSDirectconnectVirtualInterface class]];
}

@end
