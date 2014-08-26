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

#import "AWSEC2Model.h"
#import "AWSCategory.h"

NSString *const AWSEC2ErrorDomain = @"com.amazonaws.AWSEC2ErrorDomain";

@implementation AWSEC2AcceptVpcPeeringConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"vpcPeeringConnectionId" : @"VpcPeeringConnectionId",
             };
}

@end

@implementation AWSEC2AcceptVpcPeeringConnectionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcPeeringConnection" : @"VpcPeeringConnection",
             };
}

+ (NSValueTransformer *)vpcPeeringConnectionJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcPeeringConnection class]];
}

@end

@implementation AWSEC2AccountAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"attributeValues" : @"AttributeValues",
             };
}

+ (NSValueTransformer *)attributeValuesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2AccountAttributeValue class]];
}

@end

@implementation AWSEC2AccountAttributeValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeValue" : @"AttributeValue",
             };
}

@end

@implementation AWSEC2Address

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationId" : @"AllocationId",
             @"associationId" : @"AssociationId",
             @"domain" : @"Domain",
             @"instanceId" : @"InstanceId",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"networkInterfaceOwnerId" : @"NetworkInterfaceOwnerId",
             @"privateIpAddress" : @"PrivateIpAddress",
             @"publicIp" : @"PublicIp",
             };
}

+ (NSValueTransformer *)domainJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"vpc"]) {
            return @(AWSEC2DomainTypeVPC);
        }
        if ([value isEqualToString:@"standard"]) {
            return @(AWSEC2DomainTypeStandard);
        }
        return @(AWSEC2DomainTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DomainTypeVPC:
                return @"vpc";
            case AWSEC2DomainTypeStandard:
                return @"standard";
            case AWSEC2DomainTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2AllocateAddressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             @"dryRun" : @"DryRun",
             };
}

+ (NSValueTransformer *)domainJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"vpc"]) {
            return @(AWSEC2DomainTypeVPC);
        }
        if ([value isEqualToString:@"standard"]) {
            return @(AWSEC2DomainTypeStandard);
        }
        return @(AWSEC2DomainTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DomainTypeVPC:
                return @"vpc";
            case AWSEC2DomainTypeStandard:
                return @"standard";
            case AWSEC2DomainTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2AllocateAddressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationId" : @"AllocationId",
             @"domain" : @"Domain",
             @"publicIp" : @"PublicIp",
             };
}

+ (NSValueTransformer *)domainJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"vpc"]) {
            return @(AWSEC2DomainTypeVPC);
        }
        if ([value isEqualToString:@"standard"]) {
            return @(AWSEC2DomainTypeStandard);
        }
        return @(AWSEC2DomainTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DomainTypeVPC:
                return @"vpc";
            case AWSEC2DomainTypeStandard:
                return @"standard";
            case AWSEC2DomainTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2AssignPrivateIpAddressesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowReassignment" : @"AllowReassignment",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"privateIpAddresses" : @"PrivateIpAddresses",
             @"secondaryPrivateIpAddressCount" : @"SecondaryPrivateIpAddressCount",
             };
}

@end

@implementation AWSEC2AssociateAddressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationId" : @"AllocationId",
             @"allowReassociation" : @"AllowReassociation",
             @"dryRun" : @"DryRun",
             @"instanceId" : @"InstanceId",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"privateIpAddress" : @"PrivateIpAddress",
             @"publicIp" : @"PublicIp",
             };
}

@end

@implementation AWSEC2AssociateAddressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             };
}

@end

@implementation AWSEC2AssociateDhcpOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dhcpOptionsId" : @"DhcpOptionsId",
             @"dryRun" : @"DryRun",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2AssociateRouteTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"routeTableId" : @"RouteTableId",
             @"subnetId" : @"SubnetId",
             };
}

@end

@implementation AWSEC2AssociateRouteTableResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             };
}

@end

@implementation AWSEC2AttachInternetGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"internetGatewayId" : @"InternetGatewayId",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2AttachNetworkInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceIndex" : @"DeviceIndex",
             @"dryRun" : @"DryRun",
             @"instanceId" : @"InstanceId",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             };
}

@end

@implementation AWSEC2AttachNetworkInterfaceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentId" : @"AttachmentId",
             };
}

@end

@implementation AWSEC2AttachVolumeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"device" : @"Device",
             @"dryRun" : @"DryRun",
             @"instanceId" : @"InstanceId",
             @"volumeId" : @"VolumeId",
             };
}

@end

@implementation AWSEC2AttachVpnGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"vpcId" : @"VpcId",
             @"vpnGatewayId" : @"VpnGatewayId",
             };
}

@end

@implementation AWSEC2AttachVpnGatewayResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcAttachment" : @"VpcAttachment",
             };
}

+ (NSValueTransformer *)vpcAttachmentJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcAttachment class]];
}

@end

@implementation AWSEC2AttributeBooleanValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"value" : @"Value",
             };
}

@end

@implementation AWSEC2AttributeValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"value" : @"Value",
             };
}

@end

@implementation AWSEC2AuthorizeSecurityGroupEgressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrIp" : @"CidrIp",
             @"dryRun" : @"DryRun",
             @"fromPort" : @"FromPort",
             @"groupId" : @"GroupId",
             @"ipPermissions" : @"IpPermissions",
             @"ipProtocol" : @"IpProtocol",
             @"sourceSecurityGroupName" : @"SourceSecurityGroupName",
             @"sourceSecurityGroupOwnerId" : @"SourceSecurityGroupOwnerId",
             @"toPort" : @"ToPort",
             };
}

+ (NSValueTransformer *)ipPermissionsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2IpPermission class]];
}

@end

@implementation AWSEC2AuthorizeSecurityGroupIngressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrIp" : @"CidrIp",
             @"dryRun" : @"DryRun",
             @"fromPort" : @"FromPort",
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             @"ipPermissions" : @"IpPermissions",
             @"ipProtocol" : @"IpProtocol",
             @"sourceSecurityGroupName" : @"SourceSecurityGroupName",
             @"sourceSecurityGroupOwnerId" : @"SourceSecurityGroupOwnerId",
             @"toPort" : @"ToPort",
             };
}

+ (NSValueTransformer *)ipPermissionsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2IpPermission class]];
}

@end

@implementation AWSEC2AvailabilityZone

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messages" : @"Messages",
             @"regionName" : @"RegionName",
             @"state" : @"State",
             @"zoneName" : @"ZoneName",
             };
}

+ (NSValueTransformer *)messagesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2AvailabilityZoneMessage class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"available"]) {
            return @(AWSEC2AvailabilityZoneStateAvailable);
        }
        return @(AWSEC2AvailabilityZoneStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2AvailabilityZoneStateAvailable:
                return @"available";
            case AWSEC2AvailabilityZoneStateUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2AvailabilityZoneMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             };
}

@end

@implementation AWSEC2BlobAttributeValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"value" : @"Value",
             };
}

@end

@implementation AWSEC2BlockDeviceMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceName" : @"DeviceName",
             @"ebs" : @"Ebs",
             @"noDevice" : @"NoDevice",
             @"virtualName" : @"VirtualName",
             };
}

+ (NSValueTransformer *)ebsJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2EbsBlockDevice class]];
}

@end

@implementation AWSEC2BundleInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"instanceId" : @"InstanceId",
             @"storage" : @"Storage",
             };
}

+ (NSValueTransformer *)storageJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Storage class]];
}

@end

@implementation AWSEC2BundleInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleTask" : @"BundleTask",
             };
}

+ (NSValueTransformer *)bundleTaskJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2BundleTask class]];
}

@end

@implementation AWSEC2BundleTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleId" : @"BundleId",
             @"bundleTaskError" : @"BundleTaskError",
             @"instanceId" : @"InstanceId",
             @"progress" : @"Progress",
             @"startTime" : @"StartTime",
             @"state" : @"State",
             @"storage" : @"Storage",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)bundleTaskErrorJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2BundleTaskError class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"pending"]) {
            return @(AWSEC2BundleTaskStatePending);
        }
        if ([value isEqualToString:@"waiting-for-shutdown"]) {
            return @(AWSEC2BundleTaskStateWaitingForShutdown);
        }
        if ([value isEqualToString:@"bundling"]) {
            return @(AWSEC2BundleTaskStateBundling);
        }
        if ([value isEqualToString:@"storing"]) {
            return @(AWSEC2BundleTaskStateStoring);
        }
        if ([value isEqualToString:@"cancelling"]) {
            return @(AWSEC2BundleTaskStateCancelling);
        }
        if ([value isEqualToString:@"complete"]) {
            return @(AWSEC2BundleTaskStateComplete);
        }
        if ([value isEqualToString:@"failed"]) {
            return @(AWSEC2BundleTaskStateFailed);
        }
        return @(AWSEC2BundleTaskStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2BundleTaskStatePending:
                return @"pending";
            case AWSEC2BundleTaskStateWaitingForShutdown:
                return @"waiting-for-shutdown";
            case AWSEC2BundleTaskStateBundling:
                return @"bundling";
            case AWSEC2BundleTaskStateStoring:
                return @"storing";
            case AWSEC2BundleTaskStateCancelling:
                return @"cancelling";
            case AWSEC2BundleTaskStateComplete:
                return @"complete";
            case AWSEC2BundleTaskStateFailed:
                return @"failed";
            case AWSEC2BundleTaskStateUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Storage class]];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2BundleTaskError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

@end

@implementation AWSEC2CancelBundleTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleId" : @"BundleId",
             @"dryRun" : @"DryRun",
             };
}

@end

@implementation AWSEC2CancelBundleTaskResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleTask" : @"BundleTask",
             };
}

+ (NSValueTransformer *)bundleTaskJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2BundleTask class]];
}

@end

@implementation AWSEC2CancelConversionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conversionTaskId" : @"ConversionTaskId",
             @"dryRun" : @"DryRun",
             @"reasonMessage" : @"ReasonMessage",
             };
}

@end

@implementation AWSEC2CancelExportTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportTaskId" : @"ExportTaskId",
             };
}

@end

@implementation AWSEC2CancelReservedInstancesListingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedInstancesListingId" : @"ReservedInstancesListingId",
             };
}

@end

@implementation AWSEC2CancelReservedInstancesListingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedInstancesListings" : @"ReservedInstancesListings",
             };
}

+ (NSValueTransformer *)reservedInstancesListingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesListing class]];
}

@end

@implementation AWSEC2CancelSpotInstanceRequestsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"spotInstanceRequestIds" : @"SpotInstanceRequestIds",
             };
}

@end

@implementation AWSEC2CancelSpotInstanceRequestsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cancelledSpotInstanceRequests" : @"CancelledSpotInstanceRequests",
             };
}

+ (NSValueTransformer *)cancelledSpotInstanceRequestsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2CancelledSpotInstanceRequest class]];
}

@end

@implementation AWSEC2CancelledSpotInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spotInstanceRequestId" : @"SpotInstanceRequestId",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"active"]) {
            return @(AWSEC2CancelSpotInstanceRequestStateActive);
        }
        if ([value isEqualToString:@"open"]) {
            return @(AWSEC2CancelSpotInstanceRequestStateOpen);
        }
        if ([value isEqualToString:@"closed"]) {
            return @(AWSEC2CancelSpotInstanceRequestStateClosed);
        }
        if ([value isEqualToString:@"cancelled"]) {
            return @(AWSEC2CancelSpotInstanceRequestStateCancelled);
        }
        if ([value isEqualToString:@"completed"]) {
            return @(AWSEC2CancelSpotInstanceRequestStateCompleted);
        }
        return @(AWSEC2CancelSpotInstanceRequestStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2CancelSpotInstanceRequestStateActive:
                return @"active";
            case AWSEC2CancelSpotInstanceRequestStateOpen:
                return @"open";
            case AWSEC2CancelSpotInstanceRequestStateClosed:
                return @"closed";
            case AWSEC2CancelSpotInstanceRequestStateCancelled:
                return @"cancelled";
            case AWSEC2CancelSpotInstanceRequestStateCompleted:
                return @"completed";
            case AWSEC2CancelSpotInstanceRequestStateUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ConfirmProductInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"instanceId" : @"InstanceId",
             @"productCode" : @"ProductCode",
             };
}

@end

@implementation AWSEC2ConfirmProductInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ownerId" : @"OwnerId",
             };
}

@end

@implementation AWSEC2ConversionTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conversionTaskId" : @"ConversionTaskId",
             @"expirationTime" : @"ExpirationTime",
             @"importInstance" : @"ImportInstance",
             @"importVolume" : @"ImportVolume",
             @"state" : @"State",
             @"statusMessage" : @"StatusMessage",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)importInstanceJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ImportInstanceTaskDetails class]];
}

+ (NSValueTransformer *)importVolumeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ImportVolumeTaskDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"active"]) {
            return @(AWSEC2ConversionTaskStateActive);
        }
        if ([value isEqualToString:@"cancelling"]) {
            return @(AWSEC2ConversionTaskStateCancelling);
        }
        if ([value isEqualToString:@"cancelled"]) {
            return @(AWSEC2ConversionTaskStateCancelled);
        }
        if ([value isEqualToString:@"completed"]) {
            return @(AWSEC2ConversionTaskStateCompleted);
        }
        return @(AWSEC2ConversionTaskStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ConversionTaskStateActive:
                return @"active";
            case AWSEC2ConversionTaskStateCancelling:
                return @"cancelling";
            case AWSEC2ConversionTaskStateCancelled:
                return @"cancelled";
            case AWSEC2ConversionTaskStateCompleted:
                return @"completed";
            case AWSEC2ConversionTaskStateUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2CreateCustomerGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bgpAsn" : @"BgpAsn",
             @"dryRun" : @"DryRun",
             @"publicIp" : @"PublicIp",
             @"type" : @"Type",
             };
}

+ (NSValueTransformer *)typeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ipsec.1"]) {
            return @(AWSEC2GatewayTypeIpsec1);
        }
        return @(AWSEC2GatewayTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2GatewayTypeIpsec1:
                return @"ipsec.1";
            case AWSEC2GatewayTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2CreateCustomerGatewayResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerGateway" : @"CustomerGateway",
             };
}

+ (NSValueTransformer *)customerGatewayJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2CustomerGateway class]];
}

@end

@implementation AWSEC2CreateDhcpOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dhcpConfigurations" : @"DhcpConfigurations",
             @"dryRun" : @"DryRun",
             };
}

+ (NSValueTransformer *)dhcpConfigurationsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2LatestDhcpConfiguration class]];
}

@end

@implementation AWSEC2CreateDhcpOptionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dhcpOptions" : @"DhcpOptions",
             };
}

+ (NSValueTransformer *)dhcpOptionsJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DhcpOptions class]];
}

@end

@implementation AWSEC2CreateImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockDeviceMappings" : @"BlockDeviceMappings",
             @"detail" : @"Description",
             @"dryRun" : @"DryRun",
             @"instanceId" : @"InstanceId",
             @"name" : @"Name",
             @"noReboot" : @"NoReboot",
             };
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
}

@end

@implementation AWSEC2CreateImageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"ImageId",
             };
}

@end

@implementation AWSEC2CreateInstanceExportTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"exportToS3Task" : @"ExportToS3Task",
             @"instanceId" : @"InstanceId",
             @"targetEnvironment" : @"TargetEnvironment",
             };
}

+ (NSValueTransformer *)exportToS3TaskJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ExportToS3TaskSpecification class]];
}

+ (NSValueTransformer *)targetEnvironmentJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"citrix"]) {
            return @(AWSEC2ExportEnvironmentCitrix);
        }
        if ([value isEqualToString:@"vmware"]) {
            return @(AWSEC2ExportEnvironmentVMware);
        }
        if ([value isEqualToString:@"microsoft"]) {
            return @(AWSEC2ExportEnvironmentMicrosoft);
        }
        return @(AWSEC2ExportEnvironmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ExportEnvironmentCitrix:
                return @"citrix";
            case AWSEC2ExportEnvironmentVMware:
                return @"vmware";
            case AWSEC2ExportEnvironmentMicrosoft:
                return @"microsoft";
            case AWSEC2ExportEnvironmentUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2CreateInstanceExportTaskResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportTask" : @"ExportTask",
             };
}

+ (NSValueTransformer *)exportTaskJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ExportTask class]];
}

@end

@implementation AWSEC2CreateInternetGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             };
}

@end

@implementation AWSEC2CreateInternetGatewayResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"internetGateway" : @"InternetGateway",
             };
}

+ (NSValueTransformer *)internetGatewayJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InternetGateway class]];
}

@end

@implementation AWSEC2CreateKeyPairRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"keyName" : @"KeyName",
             };
}

@end

@implementation AWSEC2CreateNetworkAclEntryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrBlock" : @"CidrBlock",
             @"dryRun" : @"DryRun",
             @"egress" : @"Egress",
             @"icmpTypeCode" : @"IcmpTypeCode",
             @"networkAclId" : @"NetworkAclId",
             @"portRange" : @"PortRange",
             @"protocol" : @"Protocol",
             @"ruleAction" : @"RuleAction",
             @"ruleNumber" : @"RuleNumber",
             };
}

+ (NSValueTransformer *)icmpTypeCodeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IcmpTypeCode class]];
}

+ (NSValueTransformer *)portRangeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2PortRange class]];
}

+ (NSValueTransformer *)ruleActionJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"allow"]) {
            return @(AWSEC2RuleActionAllow);
        }
        if ([value isEqualToString:@"deny"]) {
            return @(AWSEC2RuleActionDeny);
        }
        return @(AWSEC2RuleActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RuleActionAllow:
                return @"allow";
            case AWSEC2RuleActionDeny:
                return @"deny";
            case AWSEC2RuleActionUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2CreateNetworkAclRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2CreateNetworkAclResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkAcl" : @"NetworkAcl",
             };
}

+ (NSValueTransformer *)networkAclJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkAcl class]];
}

@end

@implementation AWSEC2CreateNetworkInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"dryRun" : @"DryRun",
             @"groups" : @"Groups",
             @"privateIpAddress" : @"PrivateIpAddress",
             @"privateIpAddresses" : @"PrivateIpAddresses",
             @"secondaryPrivateIpAddressCount" : @"SecondaryPrivateIpAddressCount",
             @"subnetId" : @"SubnetId",
             };
}

+ (NSValueTransformer *)privateIpAddressesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2PrivateIpAddressSpecification class]];
}

@end

@implementation AWSEC2CreateNetworkInterfaceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkInterface" : @"NetworkInterface",
             };
}

+ (NSValueTransformer *)networkInterfaceJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkInterface class]];
}

@end

@implementation AWSEC2CreatePlacementGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"groupName" : @"GroupName",
             @"strategy" : @"Strategy",
             };
}

+ (NSValueTransformer *)strategyJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"cluster"]) {
            return @(AWSEC2PlacementStrategyCluster);
        }
        return @(AWSEC2PlacementStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PlacementStrategyCluster:
                return @"cluster";
            case AWSEC2PlacementStrategyUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2CreateReservedInstancesListingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"instanceCount" : @"InstanceCount",
             @"priceSchedules" : @"PriceSchedules",
             @"reservedInstancesId" : @"ReservedInstancesId",
             };
}

+ (NSValueTransformer *)priceSchedulesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2PriceScheduleSpecification class]];
}

@end

@implementation AWSEC2CreateReservedInstancesListingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedInstancesListings" : @"ReservedInstancesListings",
             };
}

+ (NSValueTransformer *)reservedInstancesListingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesListing class]];
}

@end

@implementation AWSEC2CreateRouteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCidrBlock" : @"DestinationCidrBlock",
             @"dryRun" : @"DryRun",
             @"gatewayId" : @"GatewayId",
             @"instanceId" : @"InstanceId",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"routeTableId" : @"RouteTableId",
             @"vpcPeeringConnectionId" : @"VpcPeeringConnectionId",
             };
}

@end

@implementation AWSEC2CreateRouteTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2CreateRouteTableResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"routeTable" : @"RouteTable",
             };
}

+ (NSValueTransformer *)routeTableJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2RouteTable class]];
}

@end

@implementation AWSEC2CreateSecurityGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"dryRun" : @"DryRun",
             @"groupName" : @"GroupName",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2CreateSecurityGroupResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             };
}

@end

@implementation AWSEC2CreateSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"dryRun" : @"DryRun",
             @"volumeId" : @"VolumeId",
             };
}

@end

@implementation AWSEC2CreateSpotDatafeedSubscriptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"dryRun" : @"DryRun",
             @"prefix" : @"Prefix",
             };
}

@end

@implementation AWSEC2CreateSpotDatafeedSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spotDatafeedSubscription" : @"SpotDatafeedSubscription",
             };
}

+ (NSValueTransformer *)spotDatafeedSubscriptionJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotDatafeedSubscription class]];
}

@end

@implementation AWSEC2CreateSubnetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"cidrBlock" : @"CidrBlock",
             @"dryRun" : @"DryRun",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2CreateSubnetResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnet" : @"Subnet",
             };
}

+ (NSValueTransformer *)subnetJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Subnet class]];
}

@end

@implementation AWSEC2CreateTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"resources" : @"Resources",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2CreateVolumePermission

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"group" : @"Group",
             @"userId" : @"UserId",
             };
}

+ (NSValueTransformer *)groupJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"all"]) {
            return @(AWSEC2PermissionGroupAll);
        }
        return @(AWSEC2PermissionGroupUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PermissionGroupAll:
                return @"all";
            case AWSEC2PermissionGroupUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2CreateVolumePermissionModifications

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"add" : @"Add",
             @"remove" : @"Remove",
             };
}

+ (NSValueTransformer *)addJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2CreateVolumePermission class]];
}

+ (NSValueTransformer *)removeJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2CreateVolumePermission class]];
}

@end

@implementation AWSEC2CreateVolumeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"dryRun" : @"DryRun",
             @"encrypted" : @"Encrypted",
             @"iops" : @"Iops",
             @"size" : @"Size",
             @"snapshotId" : @"SnapshotId",
             @"volumeType" : @"VolumeType",
             };
}

+ (NSValueTransformer *)volumeTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"standard"]) {
            return @(AWSEC2VolumeTypeStandard);
        }
        if ([value isEqualToString:@"io1"]) {
            return @(AWSEC2VolumeTypeIO1);
        }
        if ([value isEqualToString:@"gp2"]) {
            return @(AWSEC2VolumeTypeGp2);
        }
        return @(AWSEC2VolumeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VolumeTypeStandard:
                return @"standard";
            case AWSEC2VolumeTypeIO1:
                return @"io1";
            case AWSEC2VolumeTypeGp2:
                return @"gp2";
            case AWSEC2VolumeTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2CreateVpcPeeringConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"peerOwnerId" : @"PeerOwnerId",
             @"peerVpcId" : @"PeerVpcId",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2CreateVpcPeeringConnectionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcPeeringConnection" : @"VpcPeeringConnection",
             };
}

+ (NSValueTransformer *)vpcPeeringConnectionJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcPeeringConnection class]];
}

@end

@implementation AWSEC2CreateVpcRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrBlock" : @"CidrBlock",
             @"dryRun" : @"DryRun",
             @"instanceTenancy" : @"InstanceTenancy",
             };
}

+ (NSValueTransformer *)instanceTenancyJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"default"]) {
            return @(AWSEC2TenancyDefault);
        }
        if ([value isEqualToString:@"dedicated"]) {
            return @(AWSEC2TenancyDedicated);
        }
        return @(AWSEC2TenancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TenancyDefault:
                return @"default";
            case AWSEC2TenancyDedicated:
                return @"dedicated";
            case AWSEC2TenancyUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2CreateVpcResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpc" : @"Vpc",
             };
}

+ (NSValueTransformer *)vpcJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Vpc class]];
}

@end

@implementation AWSEC2CreateVpnConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerGatewayId" : @"CustomerGatewayId",
             @"dryRun" : @"DryRun",
             @"options" : @"Options",
             @"type" : @"Type",
             @"vpnGatewayId" : @"VpnGatewayId",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpnConnectionOptionsSpecification class]];
}

@end

@implementation AWSEC2CreateVpnConnectionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpnConnection" : @"VpnConnection",
             };
}

+ (NSValueTransformer *)vpnConnectionJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpnConnection class]];
}

@end

@implementation AWSEC2CreateVpnConnectionRouteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCidrBlock" : @"DestinationCidrBlock",
             @"vpnConnectionId" : @"VpnConnectionId",
             };
}

@end

@implementation AWSEC2CreateVpnGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"dryRun" : @"DryRun",
             @"type" : @"Type",
             };
}

+ (NSValueTransformer *)typeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ipsec.1"]) {
            return @(AWSEC2GatewayTypeIpsec1);
        }
        return @(AWSEC2GatewayTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2GatewayTypeIpsec1:
                return @"ipsec.1";
            case AWSEC2GatewayTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2CreateVpnGatewayResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpnGateway" : @"VpnGateway",
             };
}

+ (NSValueTransformer *)vpnGatewayJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpnGateway class]];
}

@end

@implementation AWSEC2CustomerGateway

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bgpAsn" : @"BgpAsn",
             @"customerGatewayId" : @"CustomerGatewayId",
             @"ipAddress" : @"IpAddress",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"type" : @"Type",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2DeleteCustomerGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerGatewayId" : @"CustomerGatewayId",
             @"dryRun" : @"DryRun",
             };
}

@end

@implementation AWSEC2DeleteDhcpOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dhcpOptionsId" : @"DhcpOptionsId",
             @"dryRun" : @"DryRun",
             };
}

@end

@implementation AWSEC2DeleteInternetGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"internetGatewayId" : @"InternetGatewayId",
             };
}

@end

@implementation AWSEC2DeleteKeyPairRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"keyName" : @"KeyName",
             };
}

@end

@implementation AWSEC2DeleteNetworkAclEntryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"egress" : @"Egress",
             @"networkAclId" : @"NetworkAclId",
             @"ruleNumber" : @"RuleNumber",
             };
}

@end

@implementation AWSEC2DeleteNetworkAclRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"networkAclId" : @"NetworkAclId",
             };
}

@end

@implementation AWSEC2DeleteNetworkInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             };
}

@end

@implementation AWSEC2DeletePlacementGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"groupName" : @"GroupName",
             };
}

@end

@implementation AWSEC2DeleteRouteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCidrBlock" : @"DestinationCidrBlock",
             @"dryRun" : @"DryRun",
             @"routeTableId" : @"RouteTableId",
             };
}

@end

@implementation AWSEC2DeleteRouteTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"routeTableId" : @"RouteTableId",
             };
}

@end

@implementation AWSEC2DeleteSecurityGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             };
}

@end

@implementation AWSEC2DeleteSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"snapshotId" : @"SnapshotId",
             };
}

@end

@implementation AWSEC2DeleteSpotDatafeedSubscriptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             };
}

@end

@implementation AWSEC2DeleteSubnetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"subnetId" : @"SubnetId",
             };
}

@end

@implementation AWSEC2DeleteTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"resources" : @"Resources",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2DeleteVolumeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"volumeId" : @"VolumeId",
             };
}

@end

@implementation AWSEC2DeleteVpcPeeringConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"vpcPeeringConnectionId" : @"VpcPeeringConnectionId",
             };
}

@end

@implementation AWSEC2DeleteVpcPeeringConnectionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returned" : @"Return",
             };
}

@end

@implementation AWSEC2DeleteVpcRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2DeleteVpnConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"vpnConnectionId" : @"VpnConnectionId",
             };
}

@end

@implementation AWSEC2DeleteVpnConnectionRouteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCidrBlock" : @"DestinationCidrBlock",
             @"vpnConnectionId" : @"VpnConnectionId",
             };
}

@end

@implementation AWSEC2DeleteVpnGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"vpnGatewayId" : @"VpnGatewayId",
             };
}

@end

@implementation AWSEC2DeregisterImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"imageId" : @"ImageId",
             };
}

@end

@implementation AWSEC2DescribeAccountAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeNames" : @"AttributeNames",
             @"dryRun" : @"DryRun",
             };
}

@end

@implementation AWSEC2DescribeAccountAttributesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountAttributes" : @"AccountAttributes",
             };
}

+ (NSValueTransformer *)accountAttributesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2AccountAttribute class]];
}

@end

@implementation AWSEC2DescribeAddressesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationIds" : @"AllocationIds",
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"publicIps" : @"PublicIps",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeAddressesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addresses" : @"Addresses",
             };
}

+ (NSValueTransformer *)addressesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Address class]];
}

@end

@implementation AWSEC2DescribeAvailabilityZonesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"zoneNames" : @"ZoneNames",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeAvailabilityZonesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             };
}

+ (NSValueTransformer *)availabilityZonesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2AvailabilityZone class]];
}

@end

@implementation AWSEC2DescribeBundleTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleIds" : @"BundleIds",
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeBundleTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleTasks" : @"BundleTasks",
             };
}

+ (NSValueTransformer *)bundleTasksJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2BundleTask class]];
}

@end

@implementation AWSEC2DescribeConversionTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conversionTaskIds" : @"ConversionTaskIds",
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeConversionTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conversionTasks" : @"ConversionTasks",
             };
}

+ (NSValueTransformer *)conversionTasksJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ConversionTask class]];
}

@end

@implementation AWSEC2DescribeCustomerGatewaysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerGatewayIds" : @"CustomerGatewayIds",
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeCustomerGatewaysResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerGateways" : @"CustomerGateways",
             };
}

+ (NSValueTransformer *)customerGatewaysJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2CustomerGateway class]];
}

@end

@implementation AWSEC2DescribeDhcpOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dhcpOptionsIds" : @"DhcpOptionsIds",
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeDhcpOptionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dhcpOptions" : @"DhcpOptions",
             };
}

+ (NSValueTransformer *)dhcpOptionsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2DhcpOptions class]];
}

@end

@implementation AWSEC2DescribeExportTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportTaskIds" : @"ExportTaskIds",
             };
}

@end

@implementation AWSEC2DescribeExportTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportTasks" : @"ExportTasks",
             };
}

+ (NSValueTransformer *)exportTasksJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ExportTask class]];
}

@end

@implementation AWSEC2DescribeImageAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"dryRun" : @"DryRun",
             @"imageId" : @"ImageId",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"description"]) {
            return @(AWSEC2ImageAttributeNameDescription);
        }
        if ([value isEqualToString:@"kernel"]) {
            return @(AWSEC2ImageAttributeNameKernel);
        }
        if ([value isEqualToString:@"ramdisk"]) {
            return @(AWSEC2ImageAttributeNameRAMDisk);
        }
        if ([value isEqualToString:@"launchPermission"]) {
            return @(AWSEC2ImageAttributeNameLaunchPermission);
        }
        if ([value isEqualToString:@"productCodes"]) {
            return @(AWSEC2ImageAttributeNameProductCodes);
        }
        if ([value isEqualToString:@"blockDeviceMapping"]) {
            return @(AWSEC2ImageAttributeNameBlockDeviceMapping);
        }
        return @(AWSEC2ImageAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ImageAttributeNameDescription:
                return @"description";
            case AWSEC2ImageAttributeNameKernel:
                return @"kernel";
            case AWSEC2ImageAttributeNameRAMDisk:
                return @"ramdisk";
            case AWSEC2ImageAttributeNameLaunchPermission:
                return @"launchPermission";
            case AWSEC2ImageAttributeNameProductCodes:
                return @"productCodes";
            case AWSEC2ImageAttributeNameBlockDeviceMapping:
                return @"blockDeviceMapping";
            case AWSEC2ImageAttributeNameUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2DescribeImagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"executableUsers" : @"ExecutableUsers",
             @"filters" : @"Filters",
             @"imageIds" : @"ImageIds",
             @"owners" : @"Owners",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeImagesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"images" : @"Images",
             };
}

+ (NSValueTransformer *)imagesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Image class]];
}

@end

@implementation AWSEC2DescribeInstanceAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"dryRun" : @"DryRun",
             @"instanceId" : @"InstanceId",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"instanceType"]) {
            return @(AWSEC2InstanceAttributeNameInstanceType);
        }
        if ([value isEqualToString:@"kernel"]) {
            return @(AWSEC2InstanceAttributeNameKernel);
        }
        if ([value isEqualToString:@"ramdisk"]) {
            return @(AWSEC2InstanceAttributeNameRAMDisk);
        }
        if ([value isEqualToString:@"userData"]) {
            return @(AWSEC2InstanceAttributeNameUserData);
        }
        if ([value isEqualToString:@"disableApiTermination"]) {
            return @(AWSEC2InstanceAttributeNameDisableApiTermination);
        }
        if ([value isEqualToString:@"instanceInitiatedShutdownBehavior"]) {
            return @(AWSEC2InstanceAttributeNameInstanceInitiatedShutdownBehavior);
        }
        if ([value isEqualToString:@"rootDeviceName"]) {
            return @(AWSEC2InstanceAttributeNameRootDeviceName);
        }
        if ([value isEqualToString:@"blockDeviceMapping"]) {
            return @(AWSEC2InstanceAttributeNameBlockDeviceMapping);
        }
        if ([value isEqualToString:@"productCodes"]) {
            return @(AWSEC2InstanceAttributeNameProductCodes);
        }
        if ([value isEqualToString:@"sourceDestCheck"]) {
            return @(AWSEC2InstanceAttributeNameSourceDestCheck);
        }
        if ([value isEqualToString:@"groupSet"]) {
            return @(AWSEC2InstanceAttributeNameGroupSet);
        }
        if ([value isEqualToString:@"ebsOptimized"]) {
            return @(AWSEC2InstanceAttributeNameEBSOptimized);
        }
        if ([value isEqualToString:@"sriovNetSupport"]) {
            return @(AWSEC2InstanceAttributeNameSriovNetSupport);
        }
        return @(AWSEC2InstanceAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceAttributeNameInstanceType:
                return @"instanceType";
            case AWSEC2InstanceAttributeNameKernel:
                return @"kernel";
            case AWSEC2InstanceAttributeNameRAMDisk:
                return @"ramdisk";
            case AWSEC2InstanceAttributeNameUserData:
                return @"userData";
            case AWSEC2InstanceAttributeNameDisableApiTermination:
                return @"disableApiTermination";
            case AWSEC2InstanceAttributeNameInstanceInitiatedShutdownBehavior:
                return @"instanceInitiatedShutdownBehavior";
            case AWSEC2InstanceAttributeNameRootDeviceName:
                return @"rootDeviceName";
            case AWSEC2InstanceAttributeNameBlockDeviceMapping:
                return @"blockDeviceMapping";
            case AWSEC2InstanceAttributeNameProductCodes:
                return @"productCodes";
            case AWSEC2InstanceAttributeNameSourceDestCheck:
                return @"sourceDestCheck";
            case AWSEC2InstanceAttributeNameGroupSet:
                return @"groupSet";
            case AWSEC2InstanceAttributeNameEBSOptimized:
                return @"ebsOptimized";
            case AWSEC2InstanceAttributeNameSriovNetSupport:
                return @"sriovNetSupport";
            case AWSEC2InstanceAttributeNameUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2DescribeInstanceStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"includeAllInstances" : @"IncludeAllInstances",
             @"instanceIds" : @"InstanceIds",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeInstanceStatusResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceStatuses" : @"InstanceStatuses",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instanceStatusesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceStatus class]];
}

@end

@implementation AWSEC2DescribeInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"instanceIds" : @"InstanceIds",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"reservations" : @"Reservations",
             };
}

+ (NSValueTransformer *)reservationsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Reservation class]];
}

@end

@implementation AWSEC2DescribeInternetGatewaysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"internetGatewayIds" : @"InternetGatewayIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeInternetGatewaysResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"internetGateways" : @"InternetGateways",
             };
}

+ (NSValueTransformer *)internetGatewaysJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InternetGateway class]];
}

@end

@implementation AWSEC2DescribeKeyPairsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"keyNames" : @"KeyNames",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeKeyPairsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPairs" : @"KeyPairs",
             };
}

+ (NSValueTransformer *)keyPairsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2KeyPairInfo class]];
}

@end

@implementation AWSEC2DescribeNetworkAclsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"networkAclIds" : @"NetworkAclIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeNetworkAclsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkAcls" : @"NetworkAcls",
             };
}

+ (NSValueTransformer *)networkAclsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2NetworkAcl class]];
}

@end

@implementation AWSEC2DescribeNetworkInterfaceAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"dryRun" : @"DryRun",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"description"]) {
            return @(AWSEC2NetworkInterfaceAttributeDescription);
        }
        if ([value isEqualToString:@"groupSet"]) {
            return @(AWSEC2NetworkInterfaceAttributeGroupSet);
        }
        if ([value isEqualToString:@"sourceDestCheck"]) {
            return @(AWSEC2NetworkInterfaceAttributeSourceDestCheck);
        }
        if ([value isEqualToString:@"attachment"]) {
            return @(AWSEC2NetworkInterfaceAttributeAttachment);
        }
        return @(AWSEC2NetworkInterfaceAttributeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2NetworkInterfaceAttributeDescription:
                return @"description";
            case AWSEC2NetworkInterfaceAttributeGroupSet:
                return @"groupSet";
            case AWSEC2NetworkInterfaceAttributeSourceDestCheck:
                return @"sourceDestCheck";
            case AWSEC2NetworkInterfaceAttributeAttachment:
                return @"attachment";
            case AWSEC2NetworkInterfaceAttributeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2DescribeNetworkInterfaceAttributeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachment" : @"Attachment",
             @"detail" : @"Description",
             @"groups" : @"Groups",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"sourceDestCheck" : @"SourceDestCheck",
             };
}

+ (NSValueTransformer *)attachmentJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkInterfaceAttachment class]];
}

+ (NSValueTransformer *)detailJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)groupsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

+ (NSValueTransformer *)sourceDestCheckJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

@end

@implementation AWSEC2DescribeNetworkInterfacesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"networkInterfaceIds" : @"NetworkInterfaceIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeNetworkInterfacesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkInterfaces" : @"NetworkInterfaces",
             };
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2NetworkInterface class]];
}

@end

@implementation AWSEC2DescribePlacementGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"groupNames" : @"GroupNames",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribePlacementGroupsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"placementGroups" : @"PlacementGroups",
             };
}

+ (NSValueTransformer *)placementGroupsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2PlacementGroup class]];
}

@end

@implementation AWSEC2DescribeRegionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"regionNames" : @"RegionNames",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeRegionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regions" : @"Regions",
             };
}

+ (NSValueTransformer *)regionsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Region class]];
}

@end

@implementation AWSEC2DescribeReservedInstancesListingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"reservedInstancesId" : @"ReservedInstancesId",
             @"reservedInstancesListingId" : @"ReservedInstancesListingId",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeReservedInstancesListingsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedInstancesListings" : @"ReservedInstancesListings",
             };
}

+ (NSValueTransformer *)reservedInstancesListingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesListing class]];
}

@end

@implementation AWSEC2DescribeReservedInstancesModificationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"nextToken" : @"NextToken",
             @"reservedInstancesModificationIds" : @"ReservedInstancesModificationIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeReservedInstancesModificationsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"reservedInstancesModifications" : @"ReservedInstancesModifications",
             };
}

+ (NSValueTransformer *)reservedInstancesModificationsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesModification class]];
}

@end

@implementation AWSEC2DescribeReservedInstancesOfferingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"includeMarketplace" : @"IncludeMarketplace",
             @"instanceTenancy" : @"InstanceTenancy",
             @"instanceType" : @"InstanceType",
             @"maxDuration" : @"MaxDuration",
             @"maxInstanceCount" : @"MaxInstanceCount",
             @"maxResults" : @"MaxResults",
             @"minDuration" : @"MinDuration",
             @"nextToken" : @"NextToken",
             @"offeringType" : @"OfferingType",
             @"productDescription" : @"ProductDescription",
             @"reservedInstancesOfferingIds" : @"ReservedInstancesOfferingIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

+ (NSValueTransformer *)instanceTenancyJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"default"]) {
            return @(AWSEC2TenancyDefault);
        }
        if ([value isEqualToString:@"dedicated"]) {
            return @(AWSEC2TenancyDedicated);
        }
        return @(AWSEC2TenancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TenancyDefault:
                return @"default";
            case AWSEC2TenancyDedicated:
                return @"dedicated";
            case AWSEC2TenancyUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"t1.micro"]) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value isEqualToString:@"m1.small"]) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value isEqualToString:@"m1.medium"]) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value isEqualToString:@"m1.large"]) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value isEqualToString:@"m1.xlarge"]) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value isEqualToString:@"m3.medium"]) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value isEqualToString:@"m3.large"]) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value isEqualToString:@"m3.xlarge"]) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value isEqualToString:@"m3.2xlarge"]) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value isEqualToString:@"t2.micro"]) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value isEqualToString:@"t2.small"]) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value isEqualToString:@"t2.medium"]) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value isEqualToString:@"m2.xlarge"]) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value isEqualToString:@"m2.2xlarge"]) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value isEqualToString:@"m2.4xlarge"]) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value isEqualToString:@"cr1.8xlarge"]) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value isEqualToString:@"i2.xlarge"]) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value isEqualToString:@"i2.2xlarge"]) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value isEqualToString:@"i2.4xlarge"]) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value isEqualToString:@"i2.8xlarge"]) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value isEqualToString:@"hi1.4xlarge"]) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value isEqualToString:@"hs1.8xlarge"]) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value isEqualToString:@"c1.medium"]) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value isEqualToString:@"c1.xlarge"]) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value isEqualToString:@"c3.large"]) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value isEqualToString:@"c3.xlarge"]) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value isEqualToString:@"c3.2xlarge"]) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value isEqualToString:@"c3.4xlarge"]) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value isEqualToString:@"c3.8xlarge"]) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value isEqualToString:@"cc1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value isEqualToString:@"cc2.8xlarge"]) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value isEqualToString:@"g2.2xlarge"]) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value isEqualToString:@"cg1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value isEqualToString:@"r3.large"]) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value isEqualToString:@"r3.xlarge"]) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value isEqualToString:@"r3.2xlarge"]) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value isEqualToString:@"r3.4xlarge"]) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value isEqualToString:@"r3.8xlarge"]) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        return @(AWSEC2InstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceTypeT1_micro:
                return @"t1.micro";
            case AWSEC2InstanceTypeM1_small:
                return @"m1.small";
            case AWSEC2InstanceTypeM1_medium:
                return @"m1.medium";
            case AWSEC2InstanceTypeM1_large:
                return @"m1.large";
            case AWSEC2InstanceTypeM1_xlarge:
                return @"m1.xlarge";
            case AWSEC2InstanceTypeM3_medium:
                return @"m3.medium";
            case AWSEC2InstanceTypeM3_large:
                return @"m3.large";
            case AWSEC2InstanceTypeM3_xlarge:
                return @"m3.xlarge";
            case AWSEC2InstanceTypeM3_2xlarge:
                return @"m3.2xlarge";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeM2_xlarge:
                return @"m2.xlarge";
            case AWSEC2InstanceTypeM2_2xlarge:
                return @"m2.2xlarge";
            case AWSEC2InstanceTypeM2_4xlarge:
                return @"m2.4xlarge";
            case AWSEC2InstanceTypeCR1_8xlarge:
                return @"cr1.8xlarge";
            case AWSEC2InstanceTypeI2_xlarge:
                return @"i2.xlarge";
            case AWSEC2InstanceTypeI2_2xlarge:
                return @"i2.2xlarge";
            case AWSEC2InstanceTypeI2_4xlarge:
                return @"i2.4xlarge";
            case AWSEC2InstanceTypeI2_8xlarge:
                return @"i2.8xlarge";
            case AWSEC2InstanceTypeHI1_4xlarge:
                return @"hi1.4xlarge";
            case AWSEC2InstanceTypeHS1_8xlarge:
                return @"hs1.8xlarge";
            case AWSEC2InstanceTypeC1_medium:
                return @"c1.medium";
            case AWSEC2InstanceTypeC1_xlarge:
                return @"c1.xlarge";
            case AWSEC2InstanceTypeC3_large:
                return @"c3.large";
            case AWSEC2InstanceTypeC3_xlarge:
                return @"c3.xlarge";
            case AWSEC2InstanceTypeC3_2xlarge:
                return @"c3.2xlarge";
            case AWSEC2InstanceTypeC3_4xlarge:
                return @"c3.4xlarge";
            case AWSEC2InstanceTypeC3_8xlarge:
                return @"c3.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeCG1_4xlarge:
                return @"cg1.4xlarge";
            case AWSEC2InstanceTypeR3_large:
                return @"r3.large";
            case AWSEC2InstanceTypeR3_xlarge:
                return @"r3.xlarge";
            case AWSEC2InstanceTypeR3_2xlarge:
                return @"r3.2xlarge";
            case AWSEC2InstanceTypeR3_4xlarge:
                return @"r3.4xlarge";
            case AWSEC2InstanceTypeR3_8xlarge:
                return @"r3.8xlarge";
            case AWSEC2InstanceTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Heavy Utilization"]) {
            return @(AWSEC2OfferingTypeValuesHeavyUtilization);
        }
        if ([value isEqualToString:@"Medium Utilization"]) {
            return @(AWSEC2OfferingTypeValuesMediumUtilization);
        }
        if ([value isEqualToString:@"Light Utilization"]) {
            return @(AWSEC2OfferingTypeValuesLightUtilization);
        }
        return @(AWSEC2OfferingTypeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2OfferingTypeValuesHeavyUtilization:
                return @"Heavy Utilization";
            case AWSEC2OfferingTypeValuesMediumUtilization:
                return @"Medium Utilization";
            case AWSEC2OfferingTypeValuesLightUtilization:
                return @"Light Utilization";
            case AWSEC2OfferingTypeValuesUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)productDescriptionJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Linux/UNIX"]) {
            return @(AWSEC2RIProductDescriptionLinuxUNIX);
        }
        if ([value isEqualToString:@"Linux/UNIX (Amazon VPC)"]) {
            return @(AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC);
        }
        if ([value isEqualToString:@"Windows"]) {
            return @(AWSEC2RIProductDescriptionWindows);
        }
        if ([value isEqualToString:@"Windows (Amazon VPC)"]) {
            return @(AWSEC2RIProductDescriptionWindowsAmazonVPC);
        }
        return @(AWSEC2RIProductDescriptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RIProductDescriptionLinuxUNIX:
                return @"Linux/UNIX";
            case AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC:
                return @"Linux/UNIX (Amazon VPC)";
            case AWSEC2RIProductDescriptionWindows:
                return @"Windows";
            case AWSEC2RIProductDescriptionWindowsAmazonVPC:
                return @"Windows (Amazon VPC)";
            case AWSEC2RIProductDescriptionUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2DescribeReservedInstancesOfferingsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"reservedInstancesOfferings" : @"ReservedInstancesOfferings",
             };
}

+ (NSValueTransformer *)reservedInstancesOfferingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesOffering class]];
}

@end

@implementation AWSEC2DescribeReservedInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"offeringType" : @"OfferingType",
             @"reservedInstancesIds" : @"ReservedInstancesIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Heavy Utilization"]) {
            return @(AWSEC2OfferingTypeValuesHeavyUtilization);
        }
        if ([value isEqualToString:@"Medium Utilization"]) {
            return @(AWSEC2OfferingTypeValuesMediumUtilization);
        }
        if ([value isEqualToString:@"Light Utilization"]) {
            return @(AWSEC2OfferingTypeValuesLightUtilization);
        }
        return @(AWSEC2OfferingTypeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2OfferingTypeValuesHeavyUtilization:
                return @"Heavy Utilization";
            case AWSEC2OfferingTypeValuesMediumUtilization:
                return @"Medium Utilization";
            case AWSEC2OfferingTypeValuesLightUtilization:
                return @"Light Utilization";
            case AWSEC2OfferingTypeValuesUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2DescribeReservedInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedInstances" : @"ReservedInstances",
             };
}

+ (NSValueTransformer *)reservedInstancesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstances class]];
}

@end

@implementation AWSEC2DescribeRouteTablesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"routeTableIds" : @"RouteTableIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeRouteTablesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"routeTables" : @"RouteTables",
             };
}

+ (NSValueTransformer *)routeTablesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2RouteTable class]];
}

@end

@implementation AWSEC2DescribeSecurityGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"groupIds" : @"GroupIds",
             @"groupNames" : @"GroupNames",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeSecurityGroupsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroups" : @"SecurityGroups",
             };
}

+ (NSValueTransformer *)securityGroupsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2SecurityGroup class]];
}

@end

@implementation AWSEC2DescribeSnapshotAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"dryRun" : @"DryRun",
             @"snapshotId" : @"SnapshotId",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"productCodes"]) {
            return @(AWSEC2SnapshotAttributeNameProductCodes);
        }
        if ([value isEqualToString:@"createVolumePermission"]) {
            return @(AWSEC2SnapshotAttributeNameCreateVolumePermission);
        }
        return @(AWSEC2SnapshotAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SnapshotAttributeNameProductCodes:
                return @"productCodes";
            case AWSEC2SnapshotAttributeNameCreateVolumePermission:
                return @"createVolumePermission";
            case AWSEC2SnapshotAttributeNameUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2DescribeSnapshotAttributeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createVolumePermissions" : @"CreateVolumePermissions",
             @"productCodes" : @"ProductCodes",
             @"snapshotId" : @"SnapshotId",
             };
}

+ (NSValueTransformer *)createVolumePermissionsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2CreateVolumePermission class]];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ProductCode class]];
}

@end

@implementation AWSEC2DescribeSnapshotsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"ownerIds" : @"OwnerIds",
             @"restorableByUserIds" : @"RestorableByUserIds",
             @"snapshotIds" : @"SnapshotIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeSnapshotsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshots" : @"Snapshots",
             };
}

+ (NSValueTransformer *)snapshotsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Snapshot class]];
}

@end

@implementation AWSEC2DescribeSpotDatafeedSubscriptionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             };
}

@end

@implementation AWSEC2DescribeSpotDatafeedSubscriptionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spotDatafeedSubscription" : @"SpotDatafeedSubscription",
             };
}

+ (NSValueTransformer *)spotDatafeedSubscriptionJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotDatafeedSubscription class]];
}

@end

@implementation AWSEC2DescribeSpotInstanceRequestsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"spotInstanceRequestIds" : @"SpotInstanceRequestIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeSpotInstanceRequestsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spotInstanceRequests" : @"SpotInstanceRequests",
             };
}

+ (NSValueTransformer *)spotInstanceRequestsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2SpotInstanceRequest class]];
}

@end

@implementation AWSEC2DescribeSpotPriceHistoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"dryRun" : @"DryRun",
             @"endTime" : @"EndTime",
             @"filters" : @"Filters",
             @"instanceTypes" : @"InstanceTypes",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"productDescriptions" : @"ProductDescriptions",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2DescribeSpotPriceHistoryResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"spotPriceHistory" : @"SpotPriceHistory",
             };
}

+ (NSValueTransformer *)spotPriceHistoryJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2SpotPrice class]];
}

@end

@implementation AWSEC2DescribeSubnetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"subnetIds" : @"SubnetIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeSubnetsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnets" : @"Subnets",
             };
}

+ (NSValueTransformer *)subnetsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Subnet class]];
}

@end

@implementation AWSEC2DescribeTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeTagsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2TagDescription class]];
}

@end

@implementation AWSEC2DescribeVolumeAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"dryRun" : @"DryRun",
             @"volumeId" : @"VolumeId",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"autoEnableIO"]) {
            return @(AWSEC2VolumeAttributeNameAutoEnableIO);
        }
        if ([value isEqualToString:@"productCodes"]) {
            return @(AWSEC2VolumeAttributeNameProductCodes);
        }
        return @(AWSEC2VolumeAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VolumeAttributeNameAutoEnableIO:
                return @"autoEnableIO";
            case AWSEC2VolumeAttributeNameProductCodes:
                return @"productCodes";
            case AWSEC2VolumeAttributeNameUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2DescribeVolumeAttributeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoEnableIO" : @"AutoEnableIO",
             @"productCodes" : @"ProductCodes",
             @"volumeId" : @"VolumeId",
             };
}

+ (NSValueTransformer *)autoEnableIOJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ProductCode class]];
}

@end

@implementation AWSEC2DescribeVolumeStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"volumeIds" : @"VolumeIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeVolumeStatusResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"volumeStatuses" : @"VolumeStatuses",
             };
}

+ (NSValueTransformer *)volumeStatusesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2VolumeStatusItem class]];
}

@end

@implementation AWSEC2DescribeVolumesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"volumeIds" : @"VolumeIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeVolumesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"volumes" : @"Volumes",
             };
}

+ (NSValueTransformer *)volumesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Volume class]];
}

@end

@implementation AWSEC2DescribeVpcAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"dryRun" : @"DryRun",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"enableDnsSupport"]) {
            return @(AWSEC2VpcAttributeNameEnableDNSSupport);
        }
        if ([value isEqualToString:@"enableDnsHostnames"]) {
            return @(AWSEC2VpcAttributeNameEnableDNSHostnames);
        }
        return @(AWSEC2VpcAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VpcAttributeNameEnableDNSSupport:
                return @"enableDnsSupport";
            case AWSEC2VpcAttributeNameEnableDNSHostnames:
                return @"enableDnsHostnames";
            case AWSEC2VpcAttributeNameUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2DescribeVpcAttributeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableDnsHostnames" : @"EnableDnsHostnames",
             @"enableDnsSupport" : @"EnableDnsSupport",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)enableDnsHostnamesJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)enableDnsSupportJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

@end

@implementation AWSEC2DescribeVpcPeeringConnectionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"vpcPeeringConnectionIds" : @"VpcPeeringConnectionIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeVpcPeeringConnectionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcPeeringConnections" : @"VpcPeeringConnections",
             };
}

+ (NSValueTransformer *)vpcPeeringConnectionsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2VpcPeeringConnection class]];
}

@end

@implementation AWSEC2DescribeVpcsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"vpcIds" : @"VpcIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeVpcsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcs" : @"Vpcs",
             };
}

+ (NSValueTransformer *)vpcsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Vpc class]];
}

@end

@implementation AWSEC2DescribeVpnConnectionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"vpnConnectionIds" : @"VpnConnectionIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeVpnConnectionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpnConnections" : @"VpnConnections",
             };
}

+ (NSValueTransformer *)vpnConnectionsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2VpnConnection class]];
}

@end

@implementation AWSEC2DescribeVpnGatewaysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"vpnGatewayIds" : @"VpnGatewayIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeVpnGatewaysResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpnGateways" : @"VpnGateways",
             };
}

+ (NSValueTransformer *)vpnGatewaysJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2VpnGateway class]];
}

@end

@implementation AWSEC2DetachInternetGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"internetGatewayId" : @"InternetGatewayId",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2DetachNetworkInterfaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentId" : @"AttachmentId",
             @"dryRun" : @"DryRun",
             @"force" : @"Force",
             };
}

@end

@implementation AWSEC2DetachVolumeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"device" : @"Device",
             @"dryRun" : @"DryRun",
             @"force" : @"Force",
             @"instanceId" : @"InstanceId",
             @"volumeId" : @"VolumeId",
             };
}

@end

@implementation AWSEC2DetachVpnGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"vpcId" : @"VpcId",
             @"vpnGatewayId" : @"VpnGatewayId",
             };
}

@end

@implementation AWSEC2DhcpConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)valuesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

@end

@implementation AWSEC2DhcpOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dhcpConfigurations" : @"DhcpConfigurations",
             @"dhcpOptionsId" : @"DhcpOptionsId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)dhcpConfigurationsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2DhcpConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2DisableVgwRoutePropagationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayId" : @"GatewayId",
             @"routeTableId" : @"RouteTableId",
             };
}

@end

@implementation AWSEC2DisassociateAddressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"dryRun" : @"DryRun",
             @"publicIp" : @"PublicIp",
             };
}

@end

@implementation AWSEC2DisassociateRouteTableRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"dryRun" : @"DryRun",
             };
}

@end

@implementation AWSEC2DiskImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"image" : @"Image",
             @"volume" : @"Volume",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DiskImageDetail class]];
}

+ (NSValueTransformer *)volumeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VolumeDetail class]];
}

@end

@implementation AWSEC2DiskImageDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"checksum" : @"Checksum",
             @"format" : @"Format",
             @"importManifestUrl" : @"ImportManifestUrl",
             @"size" : @"Size",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"VMDK"]) {
            return @(AWSEC2DiskImageFormatVMDK);
        }
        if ([value isEqualToString:@"RAW"]) {
            return @(AWSEC2DiskImageFormatRAW);
        }
        if ([value isEqualToString:@"VHD"]) {
            return @(AWSEC2DiskImageFormatVHD);
        }
        return @(AWSEC2DiskImageFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DiskImageFormatVMDK:
                return @"VMDK";
            case AWSEC2DiskImageFormatRAW:
                return @"RAW";
            case AWSEC2DiskImageFormatVHD:
                return @"VHD";
            case AWSEC2DiskImageFormatUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2DiskImageDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytes" : @"Bytes",
             @"format" : @"Format",
             @"importManifestUrl" : @"ImportManifestUrl",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"VMDK"]) {
            return @(AWSEC2DiskImageFormatVMDK);
        }
        if ([value isEqualToString:@"RAW"]) {
            return @(AWSEC2DiskImageFormatRAW);
        }
        if ([value isEqualToString:@"VHD"]) {
            return @(AWSEC2DiskImageFormatVHD);
        }
        return @(AWSEC2DiskImageFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DiskImageFormatVMDK:
                return @"VMDK";
            case AWSEC2DiskImageFormatRAW:
                return @"RAW";
            case AWSEC2DiskImageFormatVHD:
                return @"VHD";
            case AWSEC2DiskImageFormatUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2DiskImageVolumeDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"id" : @"Id",
             @"size" : @"Size",
             };
}

@end

@implementation AWSEC2EbsBlockDevice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteOnTermination" : @"DeleteOnTermination",
             @"encrypted" : @"Encrypted",
             @"iops" : @"Iops",
             @"snapshotId" : @"SnapshotId",
             @"volumeSize" : @"VolumeSize",
             @"volumeType" : @"VolumeType",
             };
}

+ (NSValueTransformer *)volumeTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"standard"]) {
            return @(AWSEC2VolumeTypeStandard);
        }
        if ([value isEqualToString:@"io1"]) {
            return @(AWSEC2VolumeTypeIO1);
        }
        if ([value isEqualToString:@"gp2"]) {
            return @(AWSEC2VolumeTypeGp2);
        }
        return @(AWSEC2VolumeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VolumeTypeStandard:
                return @"standard";
            case AWSEC2VolumeTypeIO1:
                return @"io1";
            case AWSEC2VolumeTypeGp2:
                return @"gp2";
            case AWSEC2VolumeTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2EbsInstanceBlockDevice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachTime" : @"AttachTime",
             @"deleteOnTermination" : @"DeleteOnTermination",
             @"status" : @"Status",
             @"volumeId" : @"VolumeId",
             };
}

+ (NSValueTransformer *)attachTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"attaching"]) {
            return @(AWSEC2AttachmentStatusAttaching);
        }
        if ([value isEqualToString:@"attached"]) {
            return @(AWSEC2AttachmentStatusAttached);
        }
        if ([value isEqualToString:@"detaching"]) {
            return @(AWSEC2AttachmentStatusDetaching);
        }
        if ([value isEqualToString:@"detached"]) {
            return @(AWSEC2AttachmentStatusDetached);
        }
        return @(AWSEC2AttachmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2AttachmentStatusAttaching:
                return @"attaching";
            case AWSEC2AttachmentStatusAttached:
                return @"attached";
            case AWSEC2AttachmentStatusDetaching:
                return @"detaching";
            case AWSEC2AttachmentStatusDetached:
                return @"detached";
            case AWSEC2AttachmentStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2EbsInstanceBlockDeviceSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deleteOnTermination" : @"DeleteOnTermination",
             @"volumeId" : @"VolumeId",
             };
}

@end

@implementation AWSEC2EnableVgwRoutePropagationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayId" : @"GatewayId",
             @"routeTableId" : @"RouteTableId",
             };
}

@end

@implementation AWSEC2EnableVolumeIORequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"volumeId" : @"VolumeId",
             };
}

@end

@implementation AWSEC2ExportTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"exportTaskId" : @"ExportTaskId",
             @"exportToS3Task" : @"ExportToS3Task",
             @"instanceExportDetails" : @"InstanceExportDetails",
             @"state" : @"State",
             @"statusMessage" : @"StatusMessage",
             };
}

+ (NSValueTransformer *)exportToS3TaskJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ExportToS3Task class]];
}

+ (NSValueTransformer *)instanceExportDetailsJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceExportDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"active"]) {
            return @(AWSEC2ExportTaskStateActive);
        }
        if ([value isEqualToString:@"cancelling"]) {
            return @(AWSEC2ExportTaskStateCancelling);
        }
        if ([value isEqualToString:@"cancelled"]) {
            return @(AWSEC2ExportTaskStateCancelled);
        }
        if ([value isEqualToString:@"completed"]) {
            return @(AWSEC2ExportTaskStateCompleted);
        }
        return @(AWSEC2ExportTaskStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ExportTaskStateActive:
                return @"active";
            case AWSEC2ExportTaskStateCancelling:
                return @"cancelling";
            case AWSEC2ExportTaskStateCancelled:
                return @"cancelled";
            case AWSEC2ExportTaskStateCompleted:
                return @"completed";
            case AWSEC2ExportTaskStateUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ExportToS3Task

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containerFormat" : @"ContainerFormat",
             @"diskImageFormat" : @"DiskImageFormat",
             @"s3Bucket" : @"S3Bucket",
             @"s3Key" : @"S3Key",
             };
}

+ (NSValueTransformer *)containerFormatJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ova"]) {
            return @(AWSEC2ContainerFormatOVA);
        }
        return @(AWSEC2ContainerFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ContainerFormatOVA:
                return @"ova";
            case AWSEC2ContainerFormatUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)diskImageFormatJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"VMDK"]) {
            return @(AWSEC2DiskImageFormatVMDK);
        }
        if ([value isEqualToString:@"RAW"]) {
            return @(AWSEC2DiskImageFormatRAW);
        }
        if ([value isEqualToString:@"VHD"]) {
            return @(AWSEC2DiskImageFormatVHD);
        }
        return @(AWSEC2DiskImageFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DiskImageFormatVMDK:
                return @"VMDK";
            case AWSEC2DiskImageFormatRAW:
                return @"RAW";
            case AWSEC2DiskImageFormatVHD:
                return @"VHD";
            case AWSEC2DiskImageFormatUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ExportToS3TaskSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"containerFormat" : @"ContainerFormat",
             @"diskImageFormat" : @"DiskImageFormat",
             @"s3Bucket" : @"S3Bucket",
             @"s3Prefix" : @"S3Prefix",
             };
}

+ (NSValueTransformer *)containerFormatJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ova"]) {
            return @(AWSEC2ContainerFormatOVA);
        }
        return @(AWSEC2ContainerFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ContainerFormatOVA:
                return @"ova";
            case AWSEC2ContainerFormatUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)diskImageFormatJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"VMDK"]) {
            return @(AWSEC2DiskImageFormatVMDK);
        }
        if ([value isEqualToString:@"RAW"]) {
            return @(AWSEC2DiskImageFormatRAW);
        }
        if ([value isEqualToString:@"VHD"]) {
            return @(AWSEC2DiskImageFormatVHD);
        }
        return @(AWSEC2DiskImageFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DiskImageFormatVMDK:
                return @"VMDK";
            case AWSEC2DiskImageFormatRAW:
                return @"RAW";
            case AWSEC2DiskImageFormatVHD:
                return @"VHD";
            case AWSEC2DiskImageFormatUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2Filter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

@end

@implementation AWSEC2GetConsoleOutputRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSEC2GetConsoleOutputResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"output" : @"Output",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2GetPasswordDataRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"instanceId" : @"InstanceId",
             };
}

@end

@implementation AWSEC2GetPasswordDataResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"passwordData" : @"PasswordData",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2GroupIdentifier

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             };
}

@end

@implementation AWSEC2IamInstanceProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"id" : @"Id",
             };
}

@end

@implementation AWSEC2IamInstanceProfileSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"name" : @"Name",
             };
}

@end

@implementation AWSEC2IcmpTypeCode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"type" : @"Type",
             };
}

@end

@implementation AWSEC2Image

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"architecture" : @"Architecture",
             @"blockDeviceMappings" : @"BlockDeviceMappings",
             @"detail" : @"Description",
             @"hypervisor" : @"Hypervisor",
             @"imageId" : @"ImageId",
             @"imageLocation" : @"ImageLocation",
             @"imageOwnerAlias" : @"ImageOwnerAlias",
             @"imageType" : @"ImageType",
             @"kernelId" : @"KernelId",
             @"name" : @"Name",
             @"ownerId" : @"OwnerId",
             @"platform" : @"Platform",
             @"productCodes" : @"ProductCodes",
             @"public" : @"Public",
             @"ramdiskId" : @"RamdiskId",
             @"rootDeviceName" : @"RootDeviceName",
             @"rootDeviceType" : @"RootDeviceType",
             @"sriovNetSupport" : @"SriovNetSupport",
             @"state" : @"State",
             @"stateReason" : @"StateReason",
             @"tags" : @"Tags",
             @"virtualizationType" : @"VirtualizationType",
             };
}

+ (NSValueTransformer *)architectureJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"i386"]) {
            return @(AWSEC2ArchitectureValuesI386);
        }
        if ([value isEqualToString:@"x86_64"]) {
            return @(AWSEC2ArchitectureValuesX86_64);
        }
        return @(AWSEC2ArchitectureValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ArchitectureValuesI386:
                return @"i386";
            case AWSEC2ArchitectureValuesX86_64:
                return @"x86_64";
            case AWSEC2ArchitectureValuesUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
}

+ (NSValueTransformer *)hypervisorJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ovm"]) {
            return @(AWSEC2HypervisorTypeOvm);
        }
        if ([value isEqualToString:@"xen"]) {
            return @(AWSEC2HypervisorTypeXen);
        }
        return @(AWSEC2HypervisorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2HypervisorTypeOvm:
                return @"ovm";
            case AWSEC2HypervisorTypeXen:
                return @"xen";
            case AWSEC2HypervisorTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)imageTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"machine"]) {
            return @(AWSEC2ImageTypeValuesMachine);
        }
        if ([value isEqualToString:@"kernel"]) {
            return @(AWSEC2ImageTypeValuesKernel);
        }
        if ([value isEqualToString:@"ramdisk"]) {
            return @(AWSEC2ImageTypeValuesRAMDisk);
        }
        return @(AWSEC2ImageTypeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ImageTypeValuesMachine:
                return @"machine";
            case AWSEC2ImageTypeValuesKernel:
                return @"kernel";
            case AWSEC2ImageTypeValuesRAMDisk:
                return @"ramdisk";
            case AWSEC2ImageTypeValuesUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Windows"]) {
            return @(AWSEC2PlatformValuesWindows);
        }
        return @(AWSEC2PlatformValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PlatformValuesWindows:
                return @"Windows";
            case AWSEC2PlatformValuesUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ProductCode class]];
}

+ (NSValueTransformer *)rootDeviceTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ebs"]) {
            return @(AWSEC2DeviceTypeEBS);
        }
        if ([value isEqualToString:@"instance-store"]) {
            return @(AWSEC2DeviceTypeInstanceStore);
        }
        return @(AWSEC2DeviceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DeviceTypeEBS:
                return @"ebs";
            case AWSEC2DeviceTypeInstanceStore:
                return @"instance-store";
            case AWSEC2DeviceTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"available"]) {
            return @(AWSEC2ImageStateAvailable);
        }
        if ([value isEqualToString:@"deregistered"]) {
            return @(AWSEC2ImageStateDeregistered);
        }
        return @(AWSEC2ImageStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ImageStateAvailable:
                return @"available";
            case AWSEC2ImageStateDeregistered:
                return @"deregistered";
            case AWSEC2ImageStateUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateReasonJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2StateReason class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)virtualizationTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"hvm"]) {
            return @(AWSEC2VirtualizationTypeHVM);
        }
        if ([value isEqualToString:@"paravirtual"]) {
            return @(AWSEC2VirtualizationTypeParavirtual);
        }
        return @(AWSEC2VirtualizationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VirtualizationTypeHVM:
                return @"hvm";
            case AWSEC2VirtualizationTypeParavirtual:
                return @"paravirtual";
            case AWSEC2VirtualizationTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ImageAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockDeviceMappings" : @"BlockDeviceMappings",
             @"detail" : @"Description",
             @"imageId" : @"ImageId",
             @"kernelId" : @"KernelId",
             @"launchPermissions" : @"LaunchPermissions",
             @"productCodes" : @"ProductCodes",
             @"ramdiskId" : @"RamdiskId",
             @"sriovNetSupport" : @"SriovNetSupport",
             };
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
}

+ (NSValueTransformer *)detailJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)kernelIdJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)launchPermissionsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2LaunchPermission class]];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ProductCode class]];
}

+ (NSValueTransformer *)ramdiskIdJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)sriovNetSupportJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

@end

@implementation AWSEC2ImportInstanceLaunchSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalInfo" : @"AdditionalInfo",
             @"architecture" : @"Architecture",
             @"groupNames" : @"GroupNames",
             @"instanceInitiatedShutdownBehavior" : @"InstanceInitiatedShutdownBehavior",
             @"instanceType" : @"InstanceType",
             @"monitoring" : @"Monitoring",
             @"placement" : @"Placement",
             @"privateIpAddress" : @"PrivateIpAddress",
             @"subnetId" : @"SubnetId",
             @"userData" : @"UserData",
             };
}

+ (NSValueTransformer *)architectureJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"i386"]) {
            return @(AWSEC2ArchitectureValuesI386);
        }
        if ([value isEqualToString:@"x86_64"]) {
            return @(AWSEC2ArchitectureValuesX86_64);
        }
        return @(AWSEC2ArchitectureValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ArchitectureValuesI386:
                return @"i386";
            case AWSEC2ArchitectureValuesX86_64:
                return @"x86_64";
            case AWSEC2ArchitectureValuesUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceInitiatedShutdownBehaviorJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"stop"]) {
            return @(AWSEC2ShutdownBehaviorStop);
        }
        if ([value isEqualToString:@"terminate"]) {
            return @(AWSEC2ShutdownBehaviorTerminate);
        }
        return @(AWSEC2ShutdownBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ShutdownBehaviorStop:
                return @"stop";
            case AWSEC2ShutdownBehaviorTerminate:
                return @"terminate";
            case AWSEC2ShutdownBehaviorUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"t1.micro"]) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value isEqualToString:@"m1.small"]) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value isEqualToString:@"m1.medium"]) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value isEqualToString:@"m1.large"]) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value isEqualToString:@"m1.xlarge"]) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value isEqualToString:@"m3.medium"]) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value isEqualToString:@"m3.large"]) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value isEqualToString:@"m3.xlarge"]) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value isEqualToString:@"m3.2xlarge"]) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value isEqualToString:@"t2.micro"]) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value isEqualToString:@"t2.small"]) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value isEqualToString:@"t2.medium"]) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value isEqualToString:@"m2.xlarge"]) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value isEqualToString:@"m2.2xlarge"]) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value isEqualToString:@"m2.4xlarge"]) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value isEqualToString:@"cr1.8xlarge"]) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value isEqualToString:@"i2.xlarge"]) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value isEqualToString:@"i2.2xlarge"]) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value isEqualToString:@"i2.4xlarge"]) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value isEqualToString:@"i2.8xlarge"]) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value isEqualToString:@"hi1.4xlarge"]) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value isEqualToString:@"hs1.8xlarge"]) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value isEqualToString:@"c1.medium"]) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value isEqualToString:@"c1.xlarge"]) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value isEqualToString:@"c3.large"]) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value isEqualToString:@"c3.xlarge"]) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value isEqualToString:@"c3.2xlarge"]) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value isEqualToString:@"c3.4xlarge"]) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value isEqualToString:@"c3.8xlarge"]) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value isEqualToString:@"cc1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value isEqualToString:@"cc2.8xlarge"]) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value isEqualToString:@"g2.2xlarge"]) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value isEqualToString:@"cg1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value isEqualToString:@"r3.large"]) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value isEqualToString:@"r3.xlarge"]) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value isEqualToString:@"r3.2xlarge"]) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value isEqualToString:@"r3.4xlarge"]) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value isEqualToString:@"r3.8xlarge"]) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        return @(AWSEC2InstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceTypeT1_micro:
                return @"t1.micro";
            case AWSEC2InstanceTypeM1_small:
                return @"m1.small";
            case AWSEC2InstanceTypeM1_medium:
                return @"m1.medium";
            case AWSEC2InstanceTypeM1_large:
                return @"m1.large";
            case AWSEC2InstanceTypeM1_xlarge:
                return @"m1.xlarge";
            case AWSEC2InstanceTypeM3_medium:
                return @"m3.medium";
            case AWSEC2InstanceTypeM3_large:
                return @"m3.large";
            case AWSEC2InstanceTypeM3_xlarge:
                return @"m3.xlarge";
            case AWSEC2InstanceTypeM3_2xlarge:
                return @"m3.2xlarge";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeM2_xlarge:
                return @"m2.xlarge";
            case AWSEC2InstanceTypeM2_2xlarge:
                return @"m2.2xlarge";
            case AWSEC2InstanceTypeM2_4xlarge:
                return @"m2.4xlarge";
            case AWSEC2InstanceTypeCR1_8xlarge:
                return @"cr1.8xlarge";
            case AWSEC2InstanceTypeI2_xlarge:
                return @"i2.xlarge";
            case AWSEC2InstanceTypeI2_2xlarge:
                return @"i2.2xlarge";
            case AWSEC2InstanceTypeI2_4xlarge:
                return @"i2.4xlarge";
            case AWSEC2InstanceTypeI2_8xlarge:
                return @"i2.8xlarge";
            case AWSEC2InstanceTypeHI1_4xlarge:
                return @"hi1.4xlarge";
            case AWSEC2InstanceTypeHS1_8xlarge:
                return @"hs1.8xlarge";
            case AWSEC2InstanceTypeC1_medium:
                return @"c1.medium";
            case AWSEC2InstanceTypeC1_xlarge:
                return @"c1.xlarge";
            case AWSEC2InstanceTypeC3_large:
                return @"c3.large";
            case AWSEC2InstanceTypeC3_xlarge:
                return @"c3.xlarge";
            case AWSEC2InstanceTypeC3_2xlarge:
                return @"c3.2xlarge";
            case AWSEC2InstanceTypeC3_4xlarge:
                return @"c3.4xlarge";
            case AWSEC2InstanceTypeC3_8xlarge:
                return @"c3.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeCG1_4xlarge:
                return @"cg1.4xlarge";
            case AWSEC2InstanceTypeR3_large:
                return @"r3.large";
            case AWSEC2InstanceTypeR3_xlarge:
                return @"r3.xlarge";
            case AWSEC2InstanceTypeR3_2xlarge:
                return @"r3.2xlarge";
            case AWSEC2InstanceTypeR3_4xlarge:
                return @"r3.4xlarge";
            case AWSEC2InstanceTypeR3_8xlarge:
                return @"r3.8xlarge";
            case AWSEC2InstanceTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)placementJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Placement class]];
}

@end

@implementation AWSEC2ImportInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"diskImages" : @"DiskImages",
             @"dryRun" : @"DryRun",
             @"launchSpecification" : @"LaunchSpecification",
             @"platform" : @"Platform",
             };
}

+ (NSValueTransformer *)diskImagesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2DiskImage class]];
}

+ (NSValueTransformer *)launchSpecificationJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ImportInstanceLaunchSpecification class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Windows"]) {
            return @(AWSEC2PlatformValuesWindows);
        }
        return @(AWSEC2PlatformValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PlatformValuesWindows:
                return @"Windows";
            case AWSEC2PlatformValuesUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ImportInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conversionTask" : @"ConversionTask",
             };
}

+ (NSValueTransformer *)conversionTaskJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ConversionTask class]];
}

@end

@implementation AWSEC2ImportInstanceTaskDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"instanceId" : @"InstanceId",
             @"platform" : @"Platform",
             @"volumes" : @"Volumes",
             };
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Windows"]) {
            return @(AWSEC2PlatformValuesWindows);
        }
        return @(AWSEC2PlatformValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PlatformValuesWindows:
                return @"Windows";
            case AWSEC2PlatformValuesUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)volumesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ImportInstanceVolumeDetailItem class]];
}

@end

@implementation AWSEC2ImportInstanceVolumeDetailItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"bytesConverted" : @"BytesConverted",
             @"detail" : @"Description",
             @"image" : @"Image",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"volume" : @"Volume",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DiskImageDescription class]];
}

+ (NSValueTransformer *)volumeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DiskImageVolumeDescription class]];
}

@end

@implementation AWSEC2ImportKeyPairRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"keyName" : @"KeyName",
             @"publicKeyMaterial" : @"PublicKeyMaterial",
             };
}

@end

@implementation AWSEC2ImportKeyPairResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyFingerprint" : @"KeyFingerprint",
             @"keyName" : @"KeyName",
             };
}

@end

@implementation AWSEC2ImportVolumeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"detail" : @"Description",
             @"dryRun" : @"DryRun",
             @"image" : @"Image",
             @"volume" : @"Volume",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DiskImageDetail class]];
}

+ (NSValueTransformer *)volumeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VolumeDetail class]];
}

@end

@implementation AWSEC2ImportVolumeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conversionTask" : @"ConversionTask",
             };
}

+ (NSValueTransformer *)conversionTaskJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ConversionTask class]];
}

@end

@implementation AWSEC2ImportVolumeTaskDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"bytesConverted" : @"BytesConverted",
             @"detail" : @"Description",
             @"image" : @"Image",
             @"volume" : @"Volume",
             };
}

+ (NSValueTransformer *)imageJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DiskImageDescription class]];
}

+ (NSValueTransformer *)volumeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DiskImageVolumeDescription class]];
}

@end

@implementation AWSEC2Instance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amiLaunchIndex" : @"AmiLaunchIndex",
             @"architecture" : @"Architecture",
             @"blockDeviceMappings" : @"BlockDeviceMappings",
             @"clientToken" : @"ClientToken",
             @"ebsOptimized" : @"EbsOptimized",
             @"hypervisor" : @"Hypervisor",
             @"iamInstanceProfile" : @"IamInstanceProfile",
             @"imageId" : @"ImageId",
             @"instanceId" : @"InstanceId",
             @"instanceLifecycle" : @"InstanceLifecycle",
             @"instanceType" : @"InstanceType",
             @"kernelId" : @"KernelId",
             @"keyName" : @"KeyName",
             @"launchTime" : @"LaunchTime",
             @"monitoring" : @"Monitoring",
             @"networkInterfaces" : @"NetworkInterfaces",
             @"placement" : @"Placement",
             @"platform" : @"Platform",
             @"privateDnsName" : @"PrivateDnsName",
             @"privateIpAddress" : @"PrivateIpAddress",
             @"productCodes" : @"ProductCodes",
             @"publicDnsName" : @"PublicDnsName",
             @"publicIpAddress" : @"PublicIpAddress",
             @"ramdiskId" : @"RamdiskId",
             @"rootDeviceName" : @"RootDeviceName",
             @"rootDeviceType" : @"RootDeviceType",
             @"securityGroups" : @"SecurityGroups",
             @"sourceDestCheck" : @"SourceDestCheck",
             @"spotInstanceRequestId" : @"SpotInstanceRequestId",
             @"sriovNetSupport" : @"SriovNetSupport",
             @"state" : @"State",
             @"stateReason" : @"StateReason",
             @"stateTransitionReason" : @"StateTransitionReason",
             @"subnetId" : @"SubnetId",
             @"tags" : @"Tags",
             @"virtualizationType" : @"VirtualizationType",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)architectureJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"i386"]) {
            return @(AWSEC2ArchitectureValuesI386);
        }
        if ([value isEqualToString:@"x86_64"]) {
            return @(AWSEC2ArchitectureValuesX86_64);
        }
        return @(AWSEC2ArchitectureValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ArchitectureValuesI386:
                return @"i386";
            case AWSEC2ArchitectureValuesX86_64:
                return @"x86_64";
            case AWSEC2ArchitectureValuesUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceBlockDeviceMapping class]];
}

+ (NSValueTransformer *)hypervisorJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ovm"]) {
            return @(AWSEC2HypervisorTypeOvm);
        }
        if ([value isEqualToString:@"xen"]) {
            return @(AWSEC2HypervisorTypeXen);
        }
        return @(AWSEC2HypervisorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2HypervisorTypeOvm:
                return @"ovm";
            case AWSEC2HypervisorTypeXen:
                return @"xen";
            case AWSEC2HypervisorTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)iamInstanceProfileJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IamInstanceProfile class]];
}

+ (NSValueTransformer *)instanceLifecycleJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"spot"]) {
            return @(AWSEC2InstanceLifecycleTypeSpot);
        }
        return @(AWSEC2InstanceLifecycleTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceLifecycleTypeSpot:
                return @"spot";
            case AWSEC2InstanceLifecycleTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"t1.micro"]) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value isEqualToString:@"m1.small"]) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value isEqualToString:@"m1.medium"]) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value isEqualToString:@"m1.large"]) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value isEqualToString:@"m1.xlarge"]) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value isEqualToString:@"m3.medium"]) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value isEqualToString:@"m3.large"]) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value isEqualToString:@"m3.xlarge"]) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value isEqualToString:@"m3.2xlarge"]) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value isEqualToString:@"t2.micro"]) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value isEqualToString:@"t2.small"]) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value isEqualToString:@"t2.medium"]) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value isEqualToString:@"m2.xlarge"]) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value isEqualToString:@"m2.2xlarge"]) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value isEqualToString:@"m2.4xlarge"]) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value isEqualToString:@"cr1.8xlarge"]) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value isEqualToString:@"i2.xlarge"]) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value isEqualToString:@"i2.2xlarge"]) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value isEqualToString:@"i2.4xlarge"]) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value isEqualToString:@"i2.8xlarge"]) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value isEqualToString:@"hi1.4xlarge"]) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value isEqualToString:@"hs1.8xlarge"]) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value isEqualToString:@"c1.medium"]) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value isEqualToString:@"c1.xlarge"]) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value isEqualToString:@"c3.large"]) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value isEqualToString:@"c3.xlarge"]) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value isEqualToString:@"c3.2xlarge"]) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value isEqualToString:@"c3.4xlarge"]) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value isEqualToString:@"c3.8xlarge"]) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value isEqualToString:@"cc1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value isEqualToString:@"cc2.8xlarge"]) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value isEqualToString:@"g2.2xlarge"]) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value isEqualToString:@"cg1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value isEqualToString:@"r3.large"]) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value isEqualToString:@"r3.xlarge"]) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value isEqualToString:@"r3.2xlarge"]) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value isEqualToString:@"r3.4xlarge"]) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value isEqualToString:@"r3.8xlarge"]) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        return @(AWSEC2InstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceTypeT1_micro:
                return @"t1.micro";
            case AWSEC2InstanceTypeM1_small:
                return @"m1.small";
            case AWSEC2InstanceTypeM1_medium:
                return @"m1.medium";
            case AWSEC2InstanceTypeM1_large:
                return @"m1.large";
            case AWSEC2InstanceTypeM1_xlarge:
                return @"m1.xlarge";
            case AWSEC2InstanceTypeM3_medium:
                return @"m3.medium";
            case AWSEC2InstanceTypeM3_large:
                return @"m3.large";
            case AWSEC2InstanceTypeM3_xlarge:
                return @"m3.xlarge";
            case AWSEC2InstanceTypeM3_2xlarge:
                return @"m3.2xlarge";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeM2_xlarge:
                return @"m2.xlarge";
            case AWSEC2InstanceTypeM2_2xlarge:
                return @"m2.2xlarge";
            case AWSEC2InstanceTypeM2_4xlarge:
                return @"m2.4xlarge";
            case AWSEC2InstanceTypeCR1_8xlarge:
                return @"cr1.8xlarge";
            case AWSEC2InstanceTypeI2_xlarge:
                return @"i2.xlarge";
            case AWSEC2InstanceTypeI2_2xlarge:
                return @"i2.2xlarge";
            case AWSEC2InstanceTypeI2_4xlarge:
                return @"i2.4xlarge";
            case AWSEC2InstanceTypeI2_8xlarge:
                return @"i2.8xlarge";
            case AWSEC2InstanceTypeHI1_4xlarge:
                return @"hi1.4xlarge";
            case AWSEC2InstanceTypeHS1_8xlarge:
                return @"hs1.8xlarge";
            case AWSEC2InstanceTypeC1_medium:
                return @"c1.medium";
            case AWSEC2InstanceTypeC1_xlarge:
                return @"c1.xlarge";
            case AWSEC2InstanceTypeC3_large:
                return @"c3.large";
            case AWSEC2InstanceTypeC3_xlarge:
                return @"c3.xlarge";
            case AWSEC2InstanceTypeC3_2xlarge:
                return @"c3.2xlarge";
            case AWSEC2InstanceTypeC3_4xlarge:
                return @"c3.4xlarge";
            case AWSEC2InstanceTypeC3_8xlarge:
                return @"c3.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeCG1_4xlarge:
                return @"cg1.4xlarge";
            case AWSEC2InstanceTypeR3_large:
                return @"r3.large";
            case AWSEC2InstanceTypeR3_xlarge:
                return @"r3.xlarge";
            case AWSEC2InstanceTypeR3_2xlarge:
                return @"r3.2xlarge";
            case AWSEC2InstanceTypeR3_4xlarge:
                return @"r3.4xlarge";
            case AWSEC2InstanceTypeR3_8xlarge:
                return @"r3.8xlarge";
            case AWSEC2InstanceTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)launchTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)monitoringJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Monitoring class]];
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceNetworkInterface class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Placement class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Windows"]) {
            return @(AWSEC2PlatformValuesWindows);
        }
        return @(AWSEC2PlatformValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PlatformValuesWindows:
                return @"Windows";
            case AWSEC2PlatformValuesUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ProductCode class]];
}

+ (NSValueTransformer *)rootDeviceTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ebs"]) {
            return @(AWSEC2DeviceTypeEBS);
        }
        if ([value isEqualToString:@"instance-store"]) {
            return @(AWSEC2DeviceTypeInstanceStore);
        }
        return @(AWSEC2DeviceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DeviceTypeEBS:
                return @"ebs";
            case AWSEC2DeviceTypeInstanceStore:
                return @"instance-store";
            case AWSEC2DeviceTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)securityGroupsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceState class]];
}

+ (NSValueTransformer *)stateReasonJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2StateReason class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)virtualizationTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"hvm"]) {
            return @(AWSEC2VirtualizationTypeHVM);
        }
        if ([value isEqualToString:@"paravirtual"]) {
            return @(AWSEC2VirtualizationTypeParavirtual);
        }
        return @(AWSEC2VirtualizationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VirtualizationTypeHVM:
                return @"hvm";
            case AWSEC2VirtualizationTypeParavirtual:
                return @"paravirtual";
            case AWSEC2VirtualizationTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2InstanceAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockDeviceMappings" : @"BlockDeviceMappings",
             @"disableApiTermination" : @"DisableApiTermination",
             @"ebsOptimized" : @"EbsOptimized",
             @"groups" : @"Groups",
             @"instanceId" : @"InstanceId",
             @"instanceInitiatedShutdownBehavior" : @"InstanceInitiatedShutdownBehavior",
             @"instanceType" : @"InstanceType",
             @"kernelId" : @"KernelId",
             @"productCodes" : @"ProductCodes",
             @"ramdiskId" : @"RamdiskId",
             @"rootDeviceName" : @"RootDeviceName",
             @"sourceDestCheck" : @"SourceDestCheck",
             @"sriovNetSupport" : @"SriovNetSupport",
             @"userData" : @"UserData",
             };
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceBlockDeviceMapping class]];
}

+ (NSValueTransformer *)disableApiTerminationJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)ebsOptimizedJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)groupsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

+ (NSValueTransformer *)instanceInitiatedShutdownBehaviorJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)kernelIdJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ProductCode class]];
}

+ (NSValueTransformer *)ramdiskIdJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)rootDeviceNameJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)sourceDestCheckJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)sriovNetSupportJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)userDataJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

@end

@implementation AWSEC2InstanceBlockDeviceMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceName" : @"DeviceName",
             @"ebs" : @"Ebs",
             };
}

+ (NSValueTransformer *)ebsJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2EbsInstanceBlockDevice class]];
}

@end

@implementation AWSEC2InstanceBlockDeviceMappingSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceName" : @"DeviceName",
             @"ebs" : @"Ebs",
             @"noDevice" : @"NoDevice",
             @"virtualName" : @"VirtualName",
             };
}

+ (NSValueTransformer *)ebsJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2EbsInstanceBlockDeviceSpecification class]];
}

@end

@implementation AWSEC2InstanceCount

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceCount" : @"InstanceCount",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"available"]) {
            return @(AWSEC2ListingStateAvailable);
        }
        if ([value isEqualToString:@"sold"]) {
            return @(AWSEC2ListingStateSold);
        }
        if ([value isEqualToString:@"cancelled"]) {
            return @(AWSEC2ListingStateCancelled);
        }
        if ([value isEqualToString:@"pending"]) {
            return @(AWSEC2ListingStatePending);
        }
        return @(AWSEC2ListingStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ListingStateAvailable:
                return @"available";
            case AWSEC2ListingStateSold:
                return @"sold";
            case AWSEC2ListingStateCancelled:
                return @"cancelled";
            case AWSEC2ListingStatePending:
                return @"pending";
            case AWSEC2ListingStateUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2InstanceExportDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"targetEnvironment" : @"TargetEnvironment",
             };
}

+ (NSValueTransformer *)targetEnvironmentJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"citrix"]) {
            return @(AWSEC2ExportEnvironmentCitrix);
        }
        if ([value isEqualToString:@"vmware"]) {
            return @(AWSEC2ExportEnvironmentVMware);
        }
        if ([value isEqualToString:@"microsoft"]) {
            return @(AWSEC2ExportEnvironmentMicrosoft);
        }
        return @(AWSEC2ExportEnvironmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ExportEnvironmentCitrix:
                return @"citrix";
            case AWSEC2ExportEnvironmentVMware:
                return @"vmware";
            case AWSEC2ExportEnvironmentMicrosoft:
                return @"microsoft";
            case AWSEC2ExportEnvironmentUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2InstanceMonitoring

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"monitoring" : @"Monitoring",
             };
}

+ (NSValueTransformer *)monitoringJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Monitoring class]];
}

@end

@implementation AWSEC2InstanceNetworkInterface

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"association" : @"Association",
             @"attachment" : @"Attachment",
             @"detail" : @"Description",
             @"groups" : @"Groups",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"ownerId" : @"OwnerId",
             @"privateDnsName" : @"PrivateDnsName",
             @"privateIpAddress" : @"PrivateIpAddress",
             @"privateIpAddresses" : @"PrivateIpAddresses",
             @"sourceDestCheck" : @"SourceDestCheck",
             @"status" : @"Status",
             @"subnetId" : @"SubnetId",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)associationJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceNetworkInterfaceAssociation class]];
}

+ (NSValueTransformer *)attachmentJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceNetworkInterfaceAttachment class]];
}

+ (NSValueTransformer *)groupsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

+ (NSValueTransformer *)privateIpAddressesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstancePrivateIpAddress class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"available"]) {
            return @(AWSEC2NetworkInterfaceStatusAvailable);
        }
        if ([value isEqualToString:@"attaching"]) {
            return @(AWSEC2NetworkInterfaceStatusAttaching);
        }
        if ([value isEqualToString:@"in-use"]) {
            return @(AWSEC2NetworkInterfaceStatusInUse);
        }
        if ([value isEqualToString:@"detaching"]) {
            return @(AWSEC2NetworkInterfaceStatusDetaching);
        }
        return @(AWSEC2NetworkInterfaceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2NetworkInterfaceStatusAvailable:
                return @"available";
            case AWSEC2NetworkInterfaceStatusAttaching:
                return @"attaching";
            case AWSEC2NetworkInterfaceStatusInUse:
                return @"in-use";
            case AWSEC2NetworkInterfaceStatusDetaching:
                return @"detaching";
            case AWSEC2NetworkInterfaceStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2InstanceNetworkInterfaceAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ipOwnerId" : @"IpOwnerId",
             @"publicDnsName" : @"PublicDnsName",
             @"publicIp" : @"PublicIp",
             };
}

@end

@implementation AWSEC2InstanceNetworkInterfaceAttachment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachTime" : @"AttachTime",
             @"attachmentId" : @"AttachmentId",
             @"deleteOnTermination" : @"DeleteOnTermination",
             @"deviceIndex" : @"DeviceIndex",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)attachTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"attaching"]) {
            return @(AWSEC2AttachmentStatusAttaching);
        }
        if ([value isEqualToString:@"attached"]) {
            return @(AWSEC2AttachmentStatusAttached);
        }
        if ([value isEqualToString:@"detaching"]) {
            return @(AWSEC2AttachmentStatusDetaching);
        }
        if ([value isEqualToString:@"detached"]) {
            return @(AWSEC2AttachmentStatusDetached);
        }
        return @(AWSEC2AttachmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2AttachmentStatusAttaching:
                return @"attaching";
            case AWSEC2AttachmentStatusAttached:
                return @"attached";
            case AWSEC2AttachmentStatusDetaching:
                return @"detaching";
            case AWSEC2AttachmentStatusDetached:
                return @"detached";
            case AWSEC2AttachmentStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2InstanceNetworkInterfaceSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatePublicIpAddress" : @"AssociatePublicIpAddress",
             @"deleteOnTermination" : @"DeleteOnTermination",
             @"detail" : @"Description",
             @"deviceIndex" : @"DeviceIndex",
             @"groups" : @"Groups",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"privateIpAddress" : @"PrivateIpAddress",
             @"privateIpAddresses" : @"PrivateIpAddresses",
             @"secondaryPrivateIpAddressCount" : @"SecondaryPrivateIpAddressCount",
             @"subnetId" : @"SubnetId",
             };
}

+ (NSValueTransformer *)privateIpAddressesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2PrivateIpAddressSpecification class]];
}

@end

@implementation AWSEC2InstancePrivateIpAddress

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"association" : @"Association",
             @"primary" : @"Primary",
             @"privateDnsName" : @"PrivateDnsName",
             @"privateIpAddress" : @"PrivateIpAddress",
             };
}

+ (NSValueTransformer *)associationJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceNetworkInterfaceAssociation class]];
}

@end

@implementation AWSEC2InstanceState

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"pending"]) {
            return @(AWSEC2InstanceStateNamePending);
        }
        if ([value isEqualToString:@"running"]) {
            return @(AWSEC2InstanceStateNameRunning);
        }
        if ([value isEqualToString:@"shutting-down"]) {
            return @(AWSEC2InstanceStateNameShuttingDown);
        }
        if ([value isEqualToString:@"terminated"]) {
            return @(AWSEC2InstanceStateNameTerminated);
        }
        if ([value isEqualToString:@"stopping"]) {
            return @(AWSEC2InstanceStateNameStopping);
        }
        if ([value isEqualToString:@"stopped"]) {
            return @(AWSEC2InstanceStateNameStopped);
        }
        return @(AWSEC2InstanceStateNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceStateNamePending:
                return @"pending";
            case AWSEC2InstanceStateNameRunning:
                return @"running";
            case AWSEC2InstanceStateNameShuttingDown:
                return @"shutting-down";
            case AWSEC2InstanceStateNameTerminated:
                return @"terminated";
            case AWSEC2InstanceStateNameStopping:
                return @"stopping";
            case AWSEC2InstanceStateNameStopped:
                return @"stopped";
            case AWSEC2InstanceStateNameUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2InstanceStateChange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentState" : @"CurrentState",
             @"instanceId" : @"InstanceId",
             @"previousState" : @"PreviousState",
             };
}

+ (NSValueTransformer *)currentStateJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceState class]];
}

+ (NSValueTransformer *)previousStateJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceState class]];
}

@end

@implementation AWSEC2InstanceStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"events" : @"Events",
             @"instanceId" : @"InstanceId",
             @"instanceState" : @"InstanceState",
             @"instanceStatus" : @"InstanceStatus",
             @"systemStatus" : @"SystemStatus",
             };
}

+ (NSValueTransformer *)eventsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceStatusEvent class]];
}

+ (NSValueTransformer *)instanceStateJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceState class]];
}

+ (NSValueTransformer *)instanceStatusJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceStatusSummary class]];
}

+ (NSValueTransformer *)systemStatusJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceStatusSummary class]];
}

@end

@implementation AWSEC2InstanceStatusDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"impairedSince" : @"ImpairedSince",
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)impairedSinceJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"reachability"]) {
            return @(AWSEC2StatusNameReachability);
        }
        return @(AWSEC2StatusNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2StatusNameReachability:
                return @"reachability";
            case AWSEC2StatusNameUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"passed"]) {
            return @(AWSEC2StatusTypePassed);
        }
        if ([value isEqualToString:@"failed"]) {
            return @(AWSEC2StatusTypeFailed);
        }
        if ([value isEqualToString:@"insufficient-data"]) {
            return @(AWSEC2StatusTypeInsufficientData);
        }
        return @(AWSEC2StatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2StatusTypePassed:
                return @"passed";
            case AWSEC2StatusTypeFailed:
                return @"failed";
            case AWSEC2StatusTypeInsufficientData:
                return @"insufficient-data";
            case AWSEC2StatusTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2InstanceStatusEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"detail" : @"Description",
             @"notAfter" : @"NotAfter",
             @"notBefore" : @"NotBefore",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"instance-reboot"]) {
            return @(AWSEC2EventCodeInstanceReboot);
        }
        if ([value isEqualToString:@"system-reboot"]) {
            return @(AWSEC2EventCodeSystemReboot);
        }
        if ([value isEqualToString:@"system-maintenance"]) {
            return @(AWSEC2EventCodeSystemMaintenance);
        }
        if ([value isEqualToString:@"instance-retirement"]) {
            return @(AWSEC2EventCodeInstanceRetirement);
        }
        if ([value isEqualToString:@"instance-stop"]) {
            return @(AWSEC2EventCodeInstanceStop);
        }
        return @(AWSEC2EventCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2EventCodeInstanceReboot:
                return @"instance-reboot";
            case AWSEC2EventCodeSystemReboot:
                return @"system-reboot";
            case AWSEC2EventCodeSystemMaintenance:
                return @"system-maintenance";
            case AWSEC2EventCodeInstanceRetirement:
                return @"instance-retirement";
            case AWSEC2EventCodeInstanceStop:
                return @"instance-stop";
            case AWSEC2EventCodeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notAfterJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)notBeforeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2InstanceStatusSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)detailsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceStatusDetails class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ok"]) {
            return @(AWSEC2SummaryStatusOK);
        }
        if ([value isEqualToString:@"impaired"]) {
            return @(AWSEC2SummaryStatusImpaired);
        }
        if ([value isEqualToString:@"insufficient-data"]) {
            return @(AWSEC2SummaryStatusInsufficientData);
        }
        if ([value isEqualToString:@"not-applicable"]) {
            return @(AWSEC2SummaryStatusNotApplicable);
        }
        return @(AWSEC2SummaryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SummaryStatusOK:
                return @"ok";
            case AWSEC2SummaryStatusImpaired:
                return @"impaired";
            case AWSEC2SummaryStatusInsufficientData:
                return @"insufficient-data";
            case AWSEC2SummaryStatusNotApplicable:
                return @"not-applicable";
            case AWSEC2SummaryStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2InternetGateway

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachments" : @"Attachments",
             @"internetGatewayId" : @"InternetGatewayId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)attachmentsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InternetGatewayAttachment class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2InternetGatewayAttachment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"attaching"]) {
            return @(AWSEC2AttachmentStatusAttaching);
        }
        if ([value isEqualToString:@"attached"]) {
            return @(AWSEC2AttachmentStatusAttached);
        }
        if ([value isEqualToString:@"detaching"]) {
            return @(AWSEC2AttachmentStatusDetaching);
        }
        if ([value isEqualToString:@"detached"]) {
            return @(AWSEC2AttachmentStatusDetached);
        }
        return @(AWSEC2AttachmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2AttachmentStatusAttaching:
                return @"attaching";
            case AWSEC2AttachmentStatusAttached:
                return @"attached";
            case AWSEC2AttachmentStatusDetaching:
                return @"detaching";
            case AWSEC2AttachmentStatusDetached:
                return @"detached";
            case AWSEC2AttachmentStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2IpPermission

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fromPort" : @"FromPort",
             @"ipProtocol" : @"IpProtocol",
             @"ipRanges" : @"IpRanges",
             @"toPort" : @"ToPort",
             @"userIdGroupPairs" : @"UserIdGroupPairs",
             };
}

+ (NSValueTransformer *)ipRangesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2IpRange class]];
}

+ (NSValueTransformer *)userIdGroupPairsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2UserIdGroupPair class]];
}

@end

@implementation AWSEC2IpRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrIp" : @"CidrIp",
             };
}

@end

@implementation AWSEC2KeyPair

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyFingerprint" : @"KeyFingerprint",
             @"keyMaterial" : @"KeyMaterial",
             @"keyName" : @"KeyName",
             };
}

@end

@implementation AWSEC2KeyPairInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyFingerprint" : @"KeyFingerprint",
             @"keyName" : @"KeyName",
             };
}

@end

@implementation AWSEC2LatestDhcpConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSEC2LaunchPermission

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"group" : @"Group",
             @"userId" : @"UserId",
             };
}

+ (NSValueTransformer *)groupJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"all"]) {
            return @(AWSEC2PermissionGroupAll);
        }
        return @(AWSEC2PermissionGroupUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PermissionGroupAll:
                return @"all";
            case AWSEC2PermissionGroupUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2LaunchPermissionModifications

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"add" : @"Add",
             @"remove" : @"Remove",
             };
}

+ (NSValueTransformer *)addJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2LaunchPermission class]];
}

+ (NSValueTransformer *)removeJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2LaunchPermission class]];
}

@end

@implementation AWSEC2LaunchSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressingType" : @"AddressingType",
             @"blockDeviceMappings" : @"BlockDeviceMappings",
             @"ebsOptimized" : @"EbsOptimized",
             @"iamInstanceProfile" : @"IamInstanceProfile",
             @"imageId" : @"ImageId",
             @"instanceType" : @"InstanceType",
             @"kernelId" : @"KernelId",
             @"keyName" : @"KeyName",
             @"monitoring" : @"Monitoring",
             @"networkInterfaces" : @"NetworkInterfaces",
             @"placement" : @"Placement",
             @"ramdiskId" : @"RamdiskId",
             @"securityGroups" : @"SecurityGroups",
             @"subnetId" : @"SubnetId",
             @"userData" : @"UserData",
             };
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
}

+ (NSValueTransformer *)iamInstanceProfileJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IamInstanceProfileSpecification class]];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"t1.micro"]) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value isEqualToString:@"m1.small"]) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value isEqualToString:@"m1.medium"]) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value isEqualToString:@"m1.large"]) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value isEqualToString:@"m1.xlarge"]) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value isEqualToString:@"m3.medium"]) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value isEqualToString:@"m3.large"]) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value isEqualToString:@"m3.xlarge"]) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value isEqualToString:@"m3.2xlarge"]) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value isEqualToString:@"t2.micro"]) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value isEqualToString:@"t2.small"]) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value isEqualToString:@"t2.medium"]) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value isEqualToString:@"m2.xlarge"]) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value isEqualToString:@"m2.2xlarge"]) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value isEqualToString:@"m2.4xlarge"]) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value isEqualToString:@"cr1.8xlarge"]) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value isEqualToString:@"i2.xlarge"]) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value isEqualToString:@"i2.2xlarge"]) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value isEqualToString:@"i2.4xlarge"]) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value isEqualToString:@"i2.8xlarge"]) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value isEqualToString:@"hi1.4xlarge"]) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value isEqualToString:@"hs1.8xlarge"]) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value isEqualToString:@"c1.medium"]) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value isEqualToString:@"c1.xlarge"]) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value isEqualToString:@"c3.large"]) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value isEqualToString:@"c3.xlarge"]) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value isEqualToString:@"c3.2xlarge"]) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value isEqualToString:@"c3.4xlarge"]) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value isEqualToString:@"c3.8xlarge"]) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value isEqualToString:@"cc1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value isEqualToString:@"cc2.8xlarge"]) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value isEqualToString:@"g2.2xlarge"]) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value isEqualToString:@"cg1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value isEqualToString:@"r3.large"]) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value isEqualToString:@"r3.xlarge"]) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value isEqualToString:@"r3.2xlarge"]) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value isEqualToString:@"r3.4xlarge"]) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value isEqualToString:@"r3.8xlarge"]) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        return @(AWSEC2InstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceTypeT1_micro:
                return @"t1.micro";
            case AWSEC2InstanceTypeM1_small:
                return @"m1.small";
            case AWSEC2InstanceTypeM1_medium:
                return @"m1.medium";
            case AWSEC2InstanceTypeM1_large:
                return @"m1.large";
            case AWSEC2InstanceTypeM1_xlarge:
                return @"m1.xlarge";
            case AWSEC2InstanceTypeM3_medium:
                return @"m3.medium";
            case AWSEC2InstanceTypeM3_large:
                return @"m3.large";
            case AWSEC2InstanceTypeM3_xlarge:
                return @"m3.xlarge";
            case AWSEC2InstanceTypeM3_2xlarge:
                return @"m3.2xlarge";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeM2_xlarge:
                return @"m2.xlarge";
            case AWSEC2InstanceTypeM2_2xlarge:
                return @"m2.2xlarge";
            case AWSEC2InstanceTypeM2_4xlarge:
                return @"m2.4xlarge";
            case AWSEC2InstanceTypeCR1_8xlarge:
                return @"cr1.8xlarge";
            case AWSEC2InstanceTypeI2_xlarge:
                return @"i2.xlarge";
            case AWSEC2InstanceTypeI2_2xlarge:
                return @"i2.2xlarge";
            case AWSEC2InstanceTypeI2_4xlarge:
                return @"i2.4xlarge";
            case AWSEC2InstanceTypeI2_8xlarge:
                return @"i2.8xlarge";
            case AWSEC2InstanceTypeHI1_4xlarge:
                return @"hi1.4xlarge";
            case AWSEC2InstanceTypeHS1_8xlarge:
                return @"hs1.8xlarge";
            case AWSEC2InstanceTypeC1_medium:
                return @"c1.medium";
            case AWSEC2InstanceTypeC1_xlarge:
                return @"c1.xlarge";
            case AWSEC2InstanceTypeC3_large:
                return @"c3.large";
            case AWSEC2InstanceTypeC3_xlarge:
                return @"c3.xlarge";
            case AWSEC2InstanceTypeC3_2xlarge:
                return @"c3.2xlarge";
            case AWSEC2InstanceTypeC3_4xlarge:
                return @"c3.4xlarge";
            case AWSEC2InstanceTypeC3_8xlarge:
                return @"c3.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeCG1_4xlarge:
                return @"cg1.4xlarge";
            case AWSEC2InstanceTypeR3_large:
                return @"r3.large";
            case AWSEC2InstanceTypeR3_xlarge:
                return @"r3.xlarge";
            case AWSEC2InstanceTypeR3_2xlarge:
                return @"r3.2xlarge";
            case AWSEC2InstanceTypeR3_4xlarge:
                return @"r3.4xlarge";
            case AWSEC2InstanceTypeR3_8xlarge:
                return @"r3.8xlarge";
            case AWSEC2InstanceTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)monitoringJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2RunInstancesMonitoringEnabled class]];
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceNetworkInterfaceSpecification class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotPlacement class]];
}

+ (NSValueTransformer *)securityGroupsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

@end

@implementation AWSEC2ModifyImageAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"detail" : @"Description",
             @"dryRun" : @"DryRun",
             @"imageId" : @"ImageId",
             @"launchPermission" : @"LaunchPermission",
             @"operationType" : @"OperationType",
             @"productCodes" : @"ProductCodes",
             @"userGroups" : @"UserGroups",
             @"userIds" : @"UserIds",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)detailJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)launchPermissionJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2LaunchPermissionModifications class]];
}

@end

@implementation AWSEC2ModifyInstanceAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"blockDeviceMappings" : @"BlockDeviceMappings",
             @"disableApiTermination" : @"DisableApiTermination",
             @"dryRun" : @"DryRun",
             @"ebsOptimized" : @"EbsOptimized",
             @"groups" : @"Groups",
             @"instanceId" : @"InstanceId",
             @"instanceInitiatedShutdownBehavior" : @"InstanceInitiatedShutdownBehavior",
             @"instanceType" : @"InstanceType",
             @"kernel" : @"Kernel",
             @"ramdisk" : @"Ramdisk",
             @"sourceDestCheck" : @"SourceDestCheck",
             @"sriovNetSupport" : @"SriovNetSupport",
             @"userData" : @"UserData",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"instanceType"]) {
            return @(AWSEC2InstanceAttributeNameInstanceType);
        }
        if ([value isEqualToString:@"kernel"]) {
            return @(AWSEC2InstanceAttributeNameKernel);
        }
        if ([value isEqualToString:@"ramdisk"]) {
            return @(AWSEC2InstanceAttributeNameRAMDisk);
        }
        if ([value isEqualToString:@"userData"]) {
            return @(AWSEC2InstanceAttributeNameUserData);
        }
        if ([value isEqualToString:@"disableApiTermination"]) {
            return @(AWSEC2InstanceAttributeNameDisableApiTermination);
        }
        if ([value isEqualToString:@"instanceInitiatedShutdownBehavior"]) {
            return @(AWSEC2InstanceAttributeNameInstanceInitiatedShutdownBehavior);
        }
        if ([value isEqualToString:@"rootDeviceName"]) {
            return @(AWSEC2InstanceAttributeNameRootDeviceName);
        }
        if ([value isEqualToString:@"blockDeviceMapping"]) {
            return @(AWSEC2InstanceAttributeNameBlockDeviceMapping);
        }
        if ([value isEqualToString:@"productCodes"]) {
            return @(AWSEC2InstanceAttributeNameProductCodes);
        }
        if ([value isEqualToString:@"sourceDestCheck"]) {
            return @(AWSEC2InstanceAttributeNameSourceDestCheck);
        }
        if ([value isEqualToString:@"groupSet"]) {
            return @(AWSEC2InstanceAttributeNameGroupSet);
        }
        if ([value isEqualToString:@"ebsOptimized"]) {
            return @(AWSEC2InstanceAttributeNameEBSOptimized);
        }
        if ([value isEqualToString:@"sriovNetSupport"]) {
            return @(AWSEC2InstanceAttributeNameSriovNetSupport);
        }
        return @(AWSEC2InstanceAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceAttributeNameInstanceType:
                return @"instanceType";
            case AWSEC2InstanceAttributeNameKernel:
                return @"kernel";
            case AWSEC2InstanceAttributeNameRAMDisk:
                return @"ramdisk";
            case AWSEC2InstanceAttributeNameUserData:
                return @"userData";
            case AWSEC2InstanceAttributeNameDisableApiTermination:
                return @"disableApiTermination";
            case AWSEC2InstanceAttributeNameInstanceInitiatedShutdownBehavior:
                return @"instanceInitiatedShutdownBehavior";
            case AWSEC2InstanceAttributeNameRootDeviceName:
                return @"rootDeviceName";
            case AWSEC2InstanceAttributeNameBlockDeviceMapping:
                return @"blockDeviceMapping";
            case AWSEC2InstanceAttributeNameProductCodes:
                return @"productCodes";
            case AWSEC2InstanceAttributeNameSourceDestCheck:
                return @"sourceDestCheck";
            case AWSEC2InstanceAttributeNameGroupSet:
                return @"groupSet";
            case AWSEC2InstanceAttributeNameEBSOptimized:
                return @"ebsOptimized";
            case AWSEC2InstanceAttributeNameSriovNetSupport:
                return @"sriovNetSupport";
            case AWSEC2InstanceAttributeNameUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceBlockDeviceMappingSpecification class]];
}

+ (NSValueTransformer *)disableApiTerminationJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)ebsOptimizedJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)instanceInitiatedShutdownBehaviorJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)kernelJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)ramdiskJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)sourceDestCheckJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)sriovNetSupportJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)userDataJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2BlobAttributeValue class]];
}

@end

@implementation AWSEC2ModifyNetworkInterfaceAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachment" : @"Attachment",
             @"detail" : @"Description",
             @"dryRun" : @"DryRun",
             @"groups" : @"Groups",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"sourceDestCheck" : @"SourceDestCheck",
             };
}

+ (NSValueTransformer *)attachmentJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkInterfaceAttachmentChanges class]];
}

+ (NSValueTransformer *)detailJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)sourceDestCheckJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

@end

@implementation AWSEC2ModifyReservedInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"reservedInstancesIds" : @"ReservedInstancesIds",
             @"targetConfigurations" : @"TargetConfigurations",
             };
}

+ (NSValueTransformer *)targetConfigurationsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesConfiguration class]];
}

@end

@implementation AWSEC2ModifyReservedInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedInstancesModificationId" : @"ReservedInstancesModificationId",
             };
}

@end

@implementation AWSEC2ModifySnapshotAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"createVolumePermission" : @"CreateVolumePermission",
             @"dryRun" : @"DryRun",
             @"groupNames" : @"GroupNames",
             @"operationType" : @"OperationType",
             @"snapshotId" : @"SnapshotId",
             @"userIds" : @"UserIds",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"productCodes"]) {
            return @(AWSEC2SnapshotAttributeNameProductCodes);
        }
        if ([value isEqualToString:@"createVolumePermission"]) {
            return @(AWSEC2SnapshotAttributeNameCreateVolumePermission);
        }
        return @(AWSEC2SnapshotAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SnapshotAttributeNameProductCodes:
                return @"productCodes";
            case AWSEC2SnapshotAttributeNameCreateVolumePermission:
                return @"createVolumePermission";
            case AWSEC2SnapshotAttributeNameUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createVolumePermissionJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2CreateVolumePermissionModifications class]];
}

@end

@implementation AWSEC2ModifySubnetAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mapPublicIpOnLaunch" : @"MapPublicIpOnLaunch",
             @"subnetId" : @"SubnetId",
             };
}

+ (NSValueTransformer *)mapPublicIpOnLaunchJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

@end

@implementation AWSEC2ModifyVolumeAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoEnableIO" : @"AutoEnableIO",
             @"dryRun" : @"DryRun",
             @"volumeId" : @"VolumeId",
             };
}

+ (NSValueTransformer *)autoEnableIOJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

@end

@implementation AWSEC2ModifyVpcAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableDnsHostnames" : @"EnableDnsHostnames",
             @"enableDnsSupport" : @"EnableDnsSupport",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)enableDnsHostnamesJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)enableDnsSupportJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

@end

@implementation AWSEC2MonitorInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"instanceIds" : @"InstanceIds",
             };
}

@end

@implementation AWSEC2MonitorInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceMonitorings" : @"InstanceMonitorings",
             };
}

+ (NSValueTransformer *)instanceMonitoringsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceMonitoring class]];
}

@end

@implementation AWSEC2Monitoring

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"disabled"]) {
            return @(AWSEC2MonitoringStateDisabled);
        }
        if ([value isEqualToString:@"enabled"]) {
            return @(AWSEC2MonitoringStateEnabled);
        }
        if ([value isEqualToString:@"pending"]) {
            return @(AWSEC2MonitoringStatePending);
        }
        return @(AWSEC2MonitoringStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2MonitoringStateDisabled:
                return @"disabled";
            case AWSEC2MonitoringStateEnabled:
                return @"enabled";
            case AWSEC2MonitoringStatePending:
                return @"pending";
            case AWSEC2MonitoringStateUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2NetworkAcl

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associations" : @"Associations",
             @"entries" : @"Entries",
             @"isDefault" : @"IsDefault",
             @"networkAclId" : @"NetworkAclId",
             @"tags" : @"Tags",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)associationsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2NetworkAclAssociation class]];
}

+ (NSValueTransformer *)entriesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2NetworkAclEntry class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2NetworkAclAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkAclAssociationId" : @"NetworkAclAssociationId",
             @"networkAclId" : @"NetworkAclId",
             @"subnetId" : @"SubnetId",
             };
}

@end

@implementation AWSEC2NetworkAclEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrBlock" : @"CidrBlock",
             @"egress" : @"Egress",
             @"icmpTypeCode" : @"IcmpTypeCode",
             @"portRange" : @"PortRange",
             @"protocol" : @"Protocol",
             @"ruleAction" : @"RuleAction",
             @"ruleNumber" : @"RuleNumber",
             };
}

+ (NSValueTransformer *)icmpTypeCodeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IcmpTypeCode class]];
}

+ (NSValueTransformer *)portRangeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2PortRange class]];
}

+ (NSValueTransformer *)ruleActionJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"allow"]) {
            return @(AWSEC2RuleActionAllow);
        }
        if ([value isEqualToString:@"deny"]) {
            return @(AWSEC2RuleActionDeny);
        }
        return @(AWSEC2RuleActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RuleActionAllow:
                return @"allow";
            case AWSEC2RuleActionDeny:
                return @"deny";
            case AWSEC2RuleActionUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2NetworkInterface

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"association" : @"Association",
             @"attachment" : @"Attachment",
             @"availabilityZone" : @"AvailabilityZone",
             @"detail" : @"Description",
             @"groups" : @"Groups",
             @"macAddress" : @"MacAddress",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"ownerId" : @"OwnerId",
             @"privateDnsName" : @"PrivateDnsName",
             @"privateIpAddress" : @"PrivateIpAddress",
             @"privateIpAddresses" : @"PrivateIpAddresses",
             @"requesterId" : @"RequesterId",
             @"requesterManaged" : @"RequesterManaged",
             @"sourceDestCheck" : @"SourceDestCheck",
             @"status" : @"Status",
             @"subnetId" : @"SubnetId",
             @"tagSet" : @"TagSet",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)associationJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkInterfaceAssociation class]];
}

+ (NSValueTransformer *)attachmentJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkInterfaceAttachment class]];
}

+ (NSValueTransformer *)groupsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

+ (NSValueTransformer *)privateIpAddressesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2NetworkInterfacePrivateIpAddress class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"available"]) {
            return @(AWSEC2NetworkInterfaceStatusAvailable);
        }
        if ([value isEqualToString:@"attaching"]) {
            return @(AWSEC2NetworkInterfaceStatusAttaching);
        }
        if ([value isEqualToString:@"in-use"]) {
            return @(AWSEC2NetworkInterfaceStatusInUse);
        }
        if ([value isEqualToString:@"detaching"]) {
            return @(AWSEC2NetworkInterfaceStatusDetaching);
        }
        return @(AWSEC2NetworkInterfaceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2NetworkInterfaceStatusAvailable:
                return @"available";
            case AWSEC2NetworkInterfaceStatusAttaching:
                return @"attaching";
            case AWSEC2NetworkInterfaceStatusInUse:
                return @"in-use";
            case AWSEC2NetworkInterfaceStatusDetaching:
                return @"detaching";
            case AWSEC2NetworkInterfaceStatusUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagSetJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2NetworkInterfaceAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationId" : @"AllocationId",
             @"associationId" : @"AssociationId",
             @"ipOwnerId" : @"IpOwnerId",
             @"publicDnsName" : @"PublicDnsName",
             @"publicIp" : @"PublicIp",
             };
}

@end

@implementation AWSEC2NetworkInterfaceAttachment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachTime" : @"AttachTime",
             @"attachmentId" : @"AttachmentId",
             @"deleteOnTermination" : @"DeleteOnTermination",
             @"deviceIndex" : @"DeviceIndex",
             @"instanceId" : @"InstanceId",
             @"instanceOwnerId" : @"InstanceOwnerId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)attachTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"attaching"]) {
            return @(AWSEC2AttachmentStatusAttaching);
        }
        if ([value isEqualToString:@"attached"]) {
            return @(AWSEC2AttachmentStatusAttached);
        }
        if ([value isEqualToString:@"detaching"]) {
            return @(AWSEC2AttachmentStatusDetaching);
        }
        if ([value isEqualToString:@"detached"]) {
            return @(AWSEC2AttachmentStatusDetached);
        }
        return @(AWSEC2AttachmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2AttachmentStatusAttaching:
                return @"attaching";
            case AWSEC2AttachmentStatusAttached:
                return @"attached";
            case AWSEC2AttachmentStatusDetaching:
                return @"detaching";
            case AWSEC2AttachmentStatusDetached:
                return @"detached";
            case AWSEC2AttachmentStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2NetworkInterfaceAttachmentChanges

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachmentId" : @"AttachmentId",
             @"deleteOnTermination" : @"DeleteOnTermination",
             };
}

@end

@implementation AWSEC2NetworkInterfacePrivateIpAddress

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"association" : @"Association",
             @"primary" : @"Primary",
             @"privateDnsName" : @"PrivateDnsName",
             @"privateIpAddress" : @"PrivateIpAddress",
             };
}

+ (NSValueTransformer *)associationJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkInterfaceAssociation class]];
}

@end

@implementation AWSEC2Placement

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"groupName" : @"GroupName",
             @"tenancy" : @"Tenancy",
             };
}

+ (NSValueTransformer *)tenancyJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"default"]) {
            return @(AWSEC2TenancyDefault);
        }
        if ([value isEqualToString:@"dedicated"]) {
            return @(AWSEC2TenancyDedicated);
        }
        return @(AWSEC2TenancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TenancyDefault:
                return @"default";
            case AWSEC2TenancyDedicated:
                return @"dedicated";
            case AWSEC2TenancyUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2PlacementGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"state" : @"State",
             @"strategy" : @"Strategy",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"pending"]) {
            return @(AWSEC2PlacementGroupStatePending);
        }
        if ([value isEqualToString:@"available"]) {
            return @(AWSEC2PlacementGroupStateAvailable);
        }
        if ([value isEqualToString:@"deleting"]) {
            return @(AWSEC2PlacementGroupStateDeleting);
        }
        if ([value isEqualToString:@"deleted"]) {
            return @(AWSEC2PlacementGroupStateDeleted);
        }
        return @(AWSEC2PlacementGroupStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PlacementGroupStatePending:
                return @"pending";
            case AWSEC2PlacementGroupStateAvailable:
                return @"available";
            case AWSEC2PlacementGroupStateDeleting:
                return @"deleting";
            case AWSEC2PlacementGroupStateDeleted:
                return @"deleted";
            case AWSEC2PlacementGroupStateUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)strategyJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"cluster"]) {
            return @(AWSEC2PlacementStrategyCluster);
        }
        return @(AWSEC2PlacementStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PlacementStrategyCluster:
                return @"cluster";
            case AWSEC2PlacementStrategyUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2PortRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"from" : @"From",
             @"to" : @"To",
             };
}

@end

@implementation AWSEC2PriceSchedule

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"active" : @"Active",
             @"currencyCode" : @"CurrencyCode",
             @"price" : @"Price",
             @"term" : @"Term",
             };
}

+ (NSValueTransformer *)currencyCodeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"USD"]) {
            return @(AWSEC2CurrencyCodeValuesUSD);
        }
        return @(AWSEC2CurrencyCodeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2CurrencyCodeValuesUSD:
                return @"USD";
            case AWSEC2CurrencyCodeValuesUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2PriceScheduleSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currencyCode" : @"CurrencyCode",
             @"price" : @"Price",
             @"term" : @"Term",
             };
}

+ (NSValueTransformer *)currencyCodeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"USD"]) {
            return @(AWSEC2CurrencyCodeValuesUSD);
        }
        return @(AWSEC2CurrencyCodeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2CurrencyCodeValuesUSD:
                return @"USD";
            case AWSEC2CurrencyCodeValuesUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2PricingDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"count" : @"Count",
             @"price" : @"Price",
             };
}

@end

@implementation AWSEC2PrivateIpAddressSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"primary" : @"Primary",
             @"privateIpAddress" : @"PrivateIpAddress",
             };
}

@end

@implementation AWSEC2ProductCode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productCodeId" : @"ProductCodeId",
             @"productCodeType" : @"ProductCodeType",
             };
}

+ (NSValueTransformer *)productCodeTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"devpay"]) {
            return @(AWSEC2ProductCodeValuesDevpay);
        }
        if ([value isEqualToString:@"marketplace"]) {
            return @(AWSEC2ProductCodeValuesMarketplace);
        }
        return @(AWSEC2ProductCodeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ProductCodeValuesDevpay:
                return @"devpay";
            case AWSEC2ProductCodeValuesMarketplace:
                return @"marketplace";
            case AWSEC2ProductCodeValuesUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2PropagatingVgw

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"gatewayId" : @"GatewayId",
             };
}

@end

@implementation AWSEC2PurchaseReservedInstancesOfferingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"instanceCount" : @"InstanceCount",
             @"limitPrice" : @"LimitPrice",
             @"reservedInstancesOfferingId" : @"ReservedInstancesOfferingId",
             };
}

+ (NSValueTransformer *)limitPriceJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ReservedInstanceLimitPrice class]];
}

@end

@implementation AWSEC2PurchaseReservedInstancesOfferingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedInstancesId" : @"ReservedInstancesId",
             };
}

@end

@implementation AWSEC2RebootInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"instanceIds" : @"InstanceIds",
             };
}

@end

@implementation AWSEC2RecurringCharge

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amount" : @"Amount",
             @"frequency" : @"Frequency",
             };
}

+ (NSValueTransformer *)frequencyJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Hourly"]) {
            return @(AWSEC2RecurringChargeFrequencyHourly);
        }
        return @(AWSEC2RecurringChargeFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RecurringChargeFrequencyHourly:
                return @"Hourly";
            case AWSEC2RecurringChargeFrequencyUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2Region

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             @"regionName" : @"RegionName",
             };
}

@end

@implementation AWSEC2RegisterImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"architecture" : @"Architecture",
             @"blockDeviceMappings" : @"BlockDeviceMappings",
             @"detail" : @"Description",
             @"dryRun" : @"DryRun",
             @"imageLocation" : @"ImageLocation",
             @"kernelId" : @"KernelId",
             @"name" : @"Name",
             @"ramdiskId" : @"RamdiskId",
             @"rootDeviceName" : @"RootDeviceName",
             @"sriovNetSupport" : @"SriovNetSupport",
             @"virtualizationType" : @"VirtualizationType",
             };
}

+ (NSValueTransformer *)architectureJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"i386"]) {
            return @(AWSEC2ArchitectureValuesI386);
        }
        if ([value isEqualToString:@"x86_64"]) {
            return @(AWSEC2ArchitectureValuesX86_64);
        }
        return @(AWSEC2ArchitectureValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ArchitectureValuesI386:
                return @"i386";
            case AWSEC2ArchitectureValuesX86_64:
                return @"x86_64";
            case AWSEC2ArchitectureValuesUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
}

@end

@implementation AWSEC2RegisterImageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"ImageId",
             };
}

@end

@implementation AWSEC2RejectVpcPeeringConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"vpcPeeringConnectionId" : @"VpcPeeringConnectionId",
             };
}

@end

@implementation AWSEC2RejectVpcPeeringConnectionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returned" : @"Return",
             };
}

@end

@implementation AWSEC2ReleaseAddressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationId" : @"AllocationId",
             @"dryRun" : @"DryRun",
             @"publicIp" : @"PublicIp",
             };
}

@end

@implementation AWSEC2ReplaceNetworkAclAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"dryRun" : @"DryRun",
             @"networkAclId" : @"NetworkAclId",
             };
}

@end

@implementation AWSEC2ReplaceNetworkAclAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestAssociationId" : @"NewAssociationId",
             };
}

@end

@implementation AWSEC2ReplaceNetworkAclEntryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrBlock" : @"CidrBlock",
             @"dryRun" : @"DryRun",
             @"egress" : @"Egress",
             @"icmpTypeCode" : @"IcmpTypeCode",
             @"networkAclId" : @"NetworkAclId",
             @"portRange" : @"PortRange",
             @"protocol" : @"Protocol",
             @"ruleAction" : @"RuleAction",
             @"ruleNumber" : @"RuleNumber",
             };
}

+ (NSValueTransformer *)icmpTypeCodeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IcmpTypeCode class]];
}

+ (NSValueTransformer *)portRangeJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2PortRange class]];
}

+ (NSValueTransformer *)ruleActionJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"allow"]) {
            return @(AWSEC2RuleActionAllow);
        }
        if ([value isEqualToString:@"deny"]) {
            return @(AWSEC2RuleActionDeny);
        }
        return @(AWSEC2RuleActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RuleActionAllow:
                return @"allow";
            case AWSEC2RuleActionDeny:
                return @"deny";
            case AWSEC2RuleActionUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ReplaceRouteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCidrBlock" : @"DestinationCidrBlock",
             @"dryRun" : @"DryRun",
             @"gatewayId" : @"GatewayId",
             @"instanceId" : @"InstanceId",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"routeTableId" : @"RouteTableId",
             @"vpcPeeringConnectionId" : @"VpcPeeringConnectionId",
             };
}

@end

@implementation AWSEC2ReplaceRouteTableAssociationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associationId" : @"AssociationId",
             @"dryRun" : @"DryRun",
             @"routeTableId" : @"RouteTableId",
             };
}

@end

@implementation AWSEC2ReplaceRouteTableAssociationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latestAssociationId" : @"NewAssociationId",
             };
}

@end

@implementation AWSEC2ReplicateImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"detail" : @"Description",
             @"dryRun" : @"DryRun",
             @"name" : @"Name",
             @"sourceImageId" : @"SourceImageId",
             @"sourceRegion" : @"SourceRegion",
             };
}

@end

@implementation AWSEC2ReplicateImageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"imageId" : @"ImageId",
             };
}

@end

@implementation AWSEC2ReplicateSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationRegion" : @"DestinationRegion",
             @"detail" : @"Description",
             @"dryRun" : @"DryRun",
             @"presignedUrl" : @"PresignedUrl",
             @"sourceRegion" : @"SourceRegion",
             @"sourceSnapshotId" : @"SourceSnapshotId",
             };
}

@end

@implementation AWSEC2ReplicateSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snapshotId" : @"SnapshotId",
             };
}

@end

@implementation AWSEC2ReportInstanceStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"dryRun" : @"DryRun",
             @"endTime" : @"EndTime",
             @"instances" : @"Instances",
             @"reasonCodes" : @"ReasonCodes",
             @"startTime" : @"StartTime",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ok"]) {
            return @(AWSEC2ReportStatusTypeOK);
        }
        if ([value isEqualToString:@"impaired"]) {
            return @(AWSEC2ReportStatusTypeImpaired);
        }
        return @(AWSEC2ReportStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ReportStatusTypeOK:
                return @"ok";
            case AWSEC2ReportStatusTypeImpaired:
                return @"impaired";
            case AWSEC2ReportStatusTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2RequestSpotInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZoneGroup" : @"AvailabilityZoneGroup",
             @"dryRun" : @"DryRun",
             @"instanceCount" : @"InstanceCount",
             @"launchGroup" : @"LaunchGroup",
             @"launchSpecification" : @"LaunchSpecification",
             @"spotPrice" : @"SpotPrice",
             @"type" : @"Type",
             @"validFrom" : @"ValidFrom",
             @"validUntil" : @"ValidUntil",
             };
}

+ (NSValueTransformer *)launchSpecificationJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2RequestSpotLaunchSpecification class]];
}

+ (NSValueTransformer *)typeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"one-time"]) {
            return @(AWSEC2SpotInstanceTypeOneTime);
        }
        if ([value isEqualToString:@"persistent"]) {
            return @(AWSEC2SpotInstanceTypePersistent);
        }
        return @(AWSEC2SpotInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SpotInstanceTypeOneTime:
                return @"one-time";
            case AWSEC2SpotInstanceTypePersistent:
                return @"persistent";
            case AWSEC2SpotInstanceTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)validFromJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)validUntilJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2RequestSpotInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spotInstanceRequests" : @"SpotInstanceRequests",
             };
}

+ (NSValueTransformer *)spotInstanceRequestsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2SpotInstanceRequest class]];
}

@end

@implementation AWSEC2RequestSpotLaunchSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressingType" : @"AddressingType",
             @"blockDeviceMappings" : @"BlockDeviceMappings",
             @"ebsOptimized" : @"EbsOptimized",
             @"iamInstanceProfile" : @"IamInstanceProfile",
             @"imageId" : @"ImageId",
             @"instanceType" : @"InstanceType",
             @"kernelId" : @"KernelId",
             @"keyName" : @"KeyName",
             @"monitoring" : @"Monitoring",
             @"networkInterfaces" : @"NetworkInterfaces",
             @"placement" : @"Placement",
             @"ramdiskId" : @"RamdiskId",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"securityGroups" : @"SecurityGroups",
             @"subnetId" : @"SubnetId",
             @"userData" : @"UserData",
             };
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
}

+ (NSValueTransformer *)iamInstanceProfileJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IamInstanceProfileSpecification class]];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"t1.micro"]) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value isEqualToString:@"m1.small"]) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value isEqualToString:@"m1.medium"]) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value isEqualToString:@"m1.large"]) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value isEqualToString:@"m1.xlarge"]) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value isEqualToString:@"m3.medium"]) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value isEqualToString:@"m3.large"]) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value isEqualToString:@"m3.xlarge"]) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value isEqualToString:@"m3.2xlarge"]) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value isEqualToString:@"t2.micro"]) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value isEqualToString:@"t2.small"]) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value isEqualToString:@"t2.medium"]) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value isEqualToString:@"m2.xlarge"]) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value isEqualToString:@"m2.2xlarge"]) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value isEqualToString:@"m2.4xlarge"]) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value isEqualToString:@"cr1.8xlarge"]) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value isEqualToString:@"i2.xlarge"]) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value isEqualToString:@"i2.2xlarge"]) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value isEqualToString:@"i2.4xlarge"]) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value isEqualToString:@"i2.8xlarge"]) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value isEqualToString:@"hi1.4xlarge"]) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value isEqualToString:@"hs1.8xlarge"]) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value isEqualToString:@"c1.medium"]) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value isEqualToString:@"c1.xlarge"]) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value isEqualToString:@"c3.large"]) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value isEqualToString:@"c3.xlarge"]) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value isEqualToString:@"c3.2xlarge"]) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value isEqualToString:@"c3.4xlarge"]) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value isEqualToString:@"c3.8xlarge"]) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value isEqualToString:@"cc1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value isEqualToString:@"cc2.8xlarge"]) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value isEqualToString:@"g2.2xlarge"]) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value isEqualToString:@"cg1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value isEqualToString:@"r3.large"]) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value isEqualToString:@"r3.xlarge"]) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value isEqualToString:@"r3.2xlarge"]) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value isEqualToString:@"r3.4xlarge"]) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value isEqualToString:@"r3.8xlarge"]) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        return @(AWSEC2InstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceTypeT1_micro:
                return @"t1.micro";
            case AWSEC2InstanceTypeM1_small:
                return @"m1.small";
            case AWSEC2InstanceTypeM1_medium:
                return @"m1.medium";
            case AWSEC2InstanceTypeM1_large:
                return @"m1.large";
            case AWSEC2InstanceTypeM1_xlarge:
                return @"m1.xlarge";
            case AWSEC2InstanceTypeM3_medium:
                return @"m3.medium";
            case AWSEC2InstanceTypeM3_large:
                return @"m3.large";
            case AWSEC2InstanceTypeM3_xlarge:
                return @"m3.xlarge";
            case AWSEC2InstanceTypeM3_2xlarge:
                return @"m3.2xlarge";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeM2_xlarge:
                return @"m2.xlarge";
            case AWSEC2InstanceTypeM2_2xlarge:
                return @"m2.2xlarge";
            case AWSEC2InstanceTypeM2_4xlarge:
                return @"m2.4xlarge";
            case AWSEC2InstanceTypeCR1_8xlarge:
                return @"cr1.8xlarge";
            case AWSEC2InstanceTypeI2_xlarge:
                return @"i2.xlarge";
            case AWSEC2InstanceTypeI2_2xlarge:
                return @"i2.2xlarge";
            case AWSEC2InstanceTypeI2_4xlarge:
                return @"i2.4xlarge";
            case AWSEC2InstanceTypeI2_8xlarge:
                return @"i2.8xlarge";
            case AWSEC2InstanceTypeHI1_4xlarge:
                return @"hi1.4xlarge";
            case AWSEC2InstanceTypeHS1_8xlarge:
                return @"hs1.8xlarge";
            case AWSEC2InstanceTypeC1_medium:
                return @"c1.medium";
            case AWSEC2InstanceTypeC1_xlarge:
                return @"c1.xlarge";
            case AWSEC2InstanceTypeC3_large:
                return @"c3.large";
            case AWSEC2InstanceTypeC3_xlarge:
                return @"c3.xlarge";
            case AWSEC2InstanceTypeC3_2xlarge:
                return @"c3.2xlarge";
            case AWSEC2InstanceTypeC3_4xlarge:
                return @"c3.4xlarge";
            case AWSEC2InstanceTypeC3_8xlarge:
                return @"c3.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeCG1_4xlarge:
                return @"cg1.4xlarge";
            case AWSEC2InstanceTypeR3_large:
                return @"r3.large";
            case AWSEC2InstanceTypeR3_xlarge:
                return @"r3.xlarge";
            case AWSEC2InstanceTypeR3_2xlarge:
                return @"r3.2xlarge";
            case AWSEC2InstanceTypeR3_4xlarge:
                return @"r3.4xlarge";
            case AWSEC2InstanceTypeR3_8xlarge:
                return @"r3.8xlarge";
            case AWSEC2InstanceTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)monitoringJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2RunInstancesMonitoringEnabled class]];
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceNetworkInterfaceSpecification class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotPlacement class]];
}

@end

@implementation AWSEC2Reservation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groups" : @"Groups",
             @"instances" : @"Instances",
             @"ownerId" : @"OwnerId",
             @"requesterId" : @"RequesterId",
             @"reservationId" : @"ReservationId",
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

+ (NSValueTransformer *)instancesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Instance class]];
}

@end

@implementation AWSEC2ReservedInstanceLimitPrice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amount" : @"Amount",
             @"currencyCode" : @"CurrencyCode",
             };
}

+ (NSValueTransformer *)currencyCodeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"USD"]) {
            return @(AWSEC2CurrencyCodeValuesUSD);
        }
        return @(AWSEC2CurrencyCodeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2CurrencyCodeValuesUSD:
                return @"USD";
            case AWSEC2CurrencyCodeValuesUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ReservedInstances

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"currencyCode" : @"CurrencyCode",
             @"duration" : @"Duration",
             @"end" : @"End",
             @"fixedPrice" : @"FixedPrice",
             @"instanceCount" : @"InstanceCount",
             @"instanceTenancy" : @"InstanceTenancy",
             @"instanceType" : @"InstanceType",
             @"offeringType" : @"OfferingType",
             @"productDescription" : @"ProductDescription",
             @"recurringCharges" : @"RecurringCharges",
             @"reservedInstancesId" : @"ReservedInstancesId",
             @"start" : @"Start",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)currencyCodeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"USD"]) {
            return @(AWSEC2CurrencyCodeValuesUSD);
        }
        return @(AWSEC2CurrencyCodeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2CurrencyCodeValuesUSD:
                return @"USD";
            case AWSEC2CurrencyCodeValuesUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)endJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)instanceTenancyJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"default"]) {
            return @(AWSEC2TenancyDefault);
        }
        if ([value isEqualToString:@"dedicated"]) {
            return @(AWSEC2TenancyDedicated);
        }
        return @(AWSEC2TenancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TenancyDefault:
                return @"default";
            case AWSEC2TenancyDedicated:
                return @"dedicated";
            case AWSEC2TenancyUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"t1.micro"]) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value isEqualToString:@"m1.small"]) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value isEqualToString:@"m1.medium"]) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value isEqualToString:@"m1.large"]) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value isEqualToString:@"m1.xlarge"]) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value isEqualToString:@"m3.medium"]) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value isEqualToString:@"m3.large"]) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value isEqualToString:@"m3.xlarge"]) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value isEqualToString:@"m3.2xlarge"]) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value isEqualToString:@"t2.micro"]) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value isEqualToString:@"t2.small"]) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value isEqualToString:@"t2.medium"]) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value isEqualToString:@"m2.xlarge"]) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value isEqualToString:@"m2.2xlarge"]) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value isEqualToString:@"m2.4xlarge"]) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value isEqualToString:@"cr1.8xlarge"]) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value isEqualToString:@"i2.xlarge"]) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value isEqualToString:@"i2.2xlarge"]) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value isEqualToString:@"i2.4xlarge"]) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value isEqualToString:@"i2.8xlarge"]) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value isEqualToString:@"hi1.4xlarge"]) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value isEqualToString:@"hs1.8xlarge"]) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value isEqualToString:@"c1.medium"]) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value isEqualToString:@"c1.xlarge"]) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value isEqualToString:@"c3.large"]) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value isEqualToString:@"c3.xlarge"]) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value isEqualToString:@"c3.2xlarge"]) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value isEqualToString:@"c3.4xlarge"]) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value isEqualToString:@"c3.8xlarge"]) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value isEqualToString:@"cc1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value isEqualToString:@"cc2.8xlarge"]) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value isEqualToString:@"g2.2xlarge"]) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value isEqualToString:@"cg1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value isEqualToString:@"r3.large"]) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value isEqualToString:@"r3.xlarge"]) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value isEqualToString:@"r3.2xlarge"]) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value isEqualToString:@"r3.4xlarge"]) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value isEqualToString:@"r3.8xlarge"]) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        return @(AWSEC2InstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceTypeT1_micro:
                return @"t1.micro";
            case AWSEC2InstanceTypeM1_small:
                return @"m1.small";
            case AWSEC2InstanceTypeM1_medium:
                return @"m1.medium";
            case AWSEC2InstanceTypeM1_large:
                return @"m1.large";
            case AWSEC2InstanceTypeM1_xlarge:
                return @"m1.xlarge";
            case AWSEC2InstanceTypeM3_medium:
                return @"m3.medium";
            case AWSEC2InstanceTypeM3_large:
                return @"m3.large";
            case AWSEC2InstanceTypeM3_xlarge:
                return @"m3.xlarge";
            case AWSEC2InstanceTypeM3_2xlarge:
                return @"m3.2xlarge";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeM2_xlarge:
                return @"m2.xlarge";
            case AWSEC2InstanceTypeM2_2xlarge:
                return @"m2.2xlarge";
            case AWSEC2InstanceTypeM2_4xlarge:
                return @"m2.4xlarge";
            case AWSEC2InstanceTypeCR1_8xlarge:
                return @"cr1.8xlarge";
            case AWSEC2InstanceTypeI2_xlarge:
                return @"i2.xlarge";
            case AWSEC2InstanceTypeI2_2xlarge:
                return @"i2.2xlarge";
            case AWSEC2InstanceTypeI2_4xlarge:
                return @"i2.4xlarge";
            case AWSEC2InstanceTypeI2_8xlarge:
                return @"i2.8xlarge";
            case AWSEC2InstanceTypeHI1_4xlarge:
                return @"hi1.4xlarge";
            case AWSEC2InstanceTypeHS1_8xlarge:
                return @"hs1.8xlarge";
            case AWSEC2InstanceTypeC1_medium:
                return @"c1.medium";
            case AWSEC2InstanceTypeC1_xlarge:
                return @"c1.xlarge";
            case AWSEC2InstanceTypeC3_large:
                return @"c3.large";
            case AWSEC2InstanceTypeC3_xlarge:
                return @"c3.xlarge";
            case AWSEC2InstanceTypeC3_2xlarge:
                return @"c3.2xlarge";
            case AWSEC2InstanceTypeC3_4xlarge:
                return @"c3.4xlarge";
            case AWSEC2InstanceTypeC3_8xlarge:
                return @"c3.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeCG1_4xlarge:
                return @"cg1.4xlarge";
            case AWSEC2InstanceTypeR3_large:
                return @"r3.large";
            case AWSEC2InstanceTypeR3_xlarge:
                return @"r3.xlarge";
            case AWSEC2InstanceTypeR3_2xlarge:
                return @"r3.2xlarge";
            case AWSEC2InstanceTypeR3_4xlarge:
                return @"r3.4xlarge";
            case AWSEC2InstanceTypeR3_8xlarge:
                return @"r3.8xlarge";
            case AWSEC2InstanceTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Heavy Utilization"]) {
            return @(AWSEC2OfferingTypeValuesHeavyUtilization);
        }
        if ([value isEqualToString:@"Medium Utilization"]) {
            return @(AWSEC2OfferingTypeValuesMediumUtilization);
        }
        if ([value isEqualToString:@"Light Utilization"]) {
            return @(AWSEC2OfferingTypeValuesLightUtilization);
        }
        return @(AWSEC2OfferingTypeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2OfferingTypeValuesHeavyUtilization:
                return @"Heavy Utilization";
            case AWSEC2OfferingTypeValuesMediumUtilization:
                return @"Medium Utilization";
            case AWSEC2OfferingTypeValuesLightUtilization:
                return @"Light Utilization";
            case AWSEC2OfferingTypeValuesUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)productDescriptionJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Linux/UNIX"]) {
            return @(AWSEC2RIProductDescriptionLinuxUNIX);
        }
        if ([value isEqualToString:@"Linux/UNIX (Amazon VPC)"]) {
            return @(AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC);
        }
        if ([value isEqualToString:@"Windows"]) {
            return @(AWSEC2RIProductDescriptionWindows);
        }
        if ([value isEqualToString:@"Windows (Amazon VPC)"]) {
            return @(AWSEC2RIProductDescriptionWindowsAmazonVPC);
        }
        return @(AWSEC2RIProductDescriptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RIProductDescriptionLinuxUNIX:
                return @"Linux/UNIX";
            case AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC:
                return @"Linux/UNIX (Amazon VPC)";
            case AWSEC2RIProductDescriptionWindows:
                return @"Windows";
            case AWSEC2RIProductDescriptionWindowsAmazonVPC:
                return @"Windows (Amazon VPC)";
            case AWSEC2RIProductDescriptionUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2RecurringCharge class]];
}

+ (NSValueTransformer *)startJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"payment-pending"]) {
            return @(AWSEC2ReservedInstanceStatePaymentPending);
        }
        if ([value isEqualToString:@"active"]) {
            return @(AWSEC2ReservedInstanceStateActive);
        }
        if ([value isEqualToString:@"payment-failed"]) {
            return @(AWSEC2ReservedInstanceStatePaymentFailed);
        }
        if ([value isEqualToString:@"retired"]) {
            return @(AWSEC2ReservedInstanceStateRetired);
        }
        return @(AWSEC2ReservedInstanceStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ReservedInstanceStatePaymentPending:
                return @"payment-pending";
            case AWSEC2ReservedInstanceStateActive:
                return @"active";
            case AWSEC2ReservedInstanceStatePaymentFailed:
                return @"payment-failed";
            case AWSEC2ReservedInstanceStateRetired:
                return @"retired";
            case AWSEC2ReservedInstanceStateUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2ReservedInstancesConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"instanceCount" : @"InstanceCount",
             @"instanceType" : @"InstanceType",
             @"platform" : @"Platform",
             };
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"t1.micro"]) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value isEqualToString:@"m1.small"]) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value isEqualToString:@"m1.medium"]) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value isEqualToString:@"m1.large"]) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value isEqualToString:@"m1.xlarge"]) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value isEqualToString:@"m3.medium"]) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value isEqualToString:@"m3.large"]) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value isEqualToString:@"m3.xlarge"]) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value isEqualToString:@"m3.2xlarge"]) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value isEqualToString:@"t2.micro"]) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value isEqualToString:@"t2.small"]) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value isEqualToString:@"t2.medium"]) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value isEqualToString:@"m2.xlarge"]) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value isEqualToString:@"m2.2xlarge"]) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value isEqualToString:@"m2.4xlarge"]) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value isEqualToString:@"cr1.8xlarge"]) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value isEqualToString:@"i2.xlarge"]) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value isEqualToString:@"i2.2xlarge"]) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value isEqualToString:@"i2.4xlarge"]) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value isEqualToString:@"i2.8xlarge"]) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value isEqualToString:@"hi1.4xlarge"]) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value isEqualToString:@"hs1.8xlarge"]) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value isEqualToString:@"c1.medium"]) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value isEqualToString:@"c1.xlarge"]) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value isEqualToString:@"c3.large"]) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value isEqualToString:@"c3.xlarge"]) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value isEqualToString:@"c3.2xlarge"]) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value isEqualToString:@"c3.4xlarge"]) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value isEqualToString:@"c3.8xlarge"]) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value isEqualToString:@"cc1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value isEqualToString:@"cc2.8xlarge"]) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value isEqualToString:@"g2.2xlarge"]) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value isEqualToString:@"cg1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value isEqualToString:@"r3.large"]) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value isEqualToString:@"r3.xlarge"]) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value isEqualToString:@"r3.2xlarge"]) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value isEqualToString:@"r3.4xlarge"]) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value isEqualToString:@"r3.8xlarge"]) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        return @(AWSEC2InstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceTypeT1_micro:
                return @"t1.micro";
            case AWSEC2InstanceTypeM1_small:
                return @"m1.small";
            case AWSEC2InstanceTypeM1_medium:
                return @"m1.medium";
            case AWSEC2InstanceTypeM1_large:
                return @"m1.large";
            case AWSEC2InstanceTypeM1_xlarge:
                return @"m1.xlarge";
            case AWSEC2InstanceTypeM3_medium:
                return @"m3.medium";
            case AWSEC2InstanceTypeM3_large:
                return @"m3.large";
            case AWSEC2InstanceTypeM3_xlarge:
                return @"m3.xlarge";
            case AWSEC2InstanceTypeM3_2xlarge:
                return @"m3.2xlarge";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeM2_xlarge:
                return @"m2.xlarge";
            case AWSEC2InstanceTypeM2_2xlarge:
                return @"m2.2xlarge";
            case AWSEC2InstanceTypeM2_4xlarge:
                return @"m2.4xlarge";
            case AWSEC2InstanceTypeCR1_8xlarge:
                return @"cr1.8xlarge";
            case AWSEC2InstanceTypeI2_xlarge:
                return @"i2.xlarge";
            case AWSEC2InstanceTypeI2_2xlarge:
                return @"i2.2xlarge";
            case AWSEC2InstanceTypeI2_4xlarge:
                return @"i2.4xlarge";
            case AWSEC2InstanceTypeI2_8xlarge:
                return @"i2.8xlarge";
            case AWSEC2InstanceTypeHI1_4xlarge:
                return @"hi1.4xlarge";
            case AWSEC2InstanceTypeHS1_8xlarge:
                return @"hs1.8xlarge";
            case AWSEC2InstanceTypeC1_medium:
                return @"c1.medium";
            case AWSEC2InstanceTypeC1_xlarge:
                return @"c1.xlarge";
            case AWSEC2InstanceTypeC3_large:
                return @"c3.large";
            case AWSEC2InstanceTypeC3_xlarge:
                return @"c3.xlarge";
            case AWSEC2InstanceTypeC3_2xlarge:
                return @"c3.2xlarge";
            case AWSEC2InstanceTypeC3_4xlarge:
                return @"c3.4xlarge";
            case AWSEC2InstanceTypeC3_8xlarge:
                return @"c3.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeCG1_4xlarge:
                return @"cg1.4xlarge";
            case AWSEC2InstanceTypeR3_large:
                return @"r3.large";
            case AWSEC2InstanceTypeR3_xlarge:
                return @"r3.xlarge";
            case AWSEC2InstanceTypeR3_2xlarge:
                return @"r3.2xlarge";
            case AWSEC2InstanceTypeR3_4xlarge:
                return @"r3.4xlarge";
            case AWSEC2InstanceTypeR3_8xlarge:
                return @"r3.8xlarge";
            case AWSEC2InstanceTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ReservedInstancesId

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedInstancesId" : @"ReservedInstancesId",
             };
}

@end

@implementation AWSEC2ReservedInstancesListing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"createDate" : @"CreateDate",
             @"instanceCounts" : @"InstanceCounts",
             @"priceSchedules" : @"PriceSchedules",
             @"reservedInstancesId" : @"ReservedInstancesId",
             @"reservedInstancesListingId" : @"ReservedInstancesListingId",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"tags" : @"Tags",
             @"updateDate" : @"UpdateDate",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)instanceCountsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceCount class]];
}

+ (NSValueTransformer *)priceSchedulesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2PriceSchedule class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"active"]) {
            return @(AWSEC2ListingStatusActive);
        }
        if ([value isEqualToString:@"pending"]) {
            return @(AWSEC2ListingStatusPending);
        }
        if ([value isEqualToString:@"cancelled"]) {
            return @(AWSEC2ListingStatusCancelled);
        }
        if ([value isEqualToString:@"closed"]) {
            return @(AWSEC2ListingStatusClosed);
        }
        return @(AWSEC2ListingStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ListingStatusActive:
                return @"active";
            case AWSEC2ListingStatusPending:
                return @"pending";
            case AWSEC2ListingStatusCancelled:
                return @"cancelled";
            case AWSEC2ListingStatusClosed:
                return @"closed";
            case AWSEC2ListingStatusUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)updateDateJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2ReservedInstancesModification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"createDate" : @"CreateDate",
             @"effectiveDate" : @"EffectiveDate",
             @"modificationResults" : @"ModificationResults",
             @"reservedInstancesIds" : @"ReservedInstancesIds",
             @"reservedInstancesModificationId" : @"ReservedInstancesModificationId",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"updateDate" : @"UpdateDate",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)effectiveDateJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)modificationResultsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesModificationResult class]];
}

+ (NSValueTransformer *)reservedInstancesIdsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesId class]];
}

+ (NSValueTransformer *)updateDateJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2ReservedInstancesModificationResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedInstancesId" : @"ReservedInstancesId",
             @"targetConfiguration" : @"TargetConfiguration",
             };
}

+ (NSValueTransformer *)targetConfigurationJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ReservedInstancesConfiguration class]];
}

@end

@implementation AWSEC2ReservedInstancesOffering

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"currencyCode" : @"CurrencyCode",
             @"duration" : @"Duration",
             @"fixedPrice" : @"FixedPrice",
             @"instanceTenancy" : @"InstanceTenancy",
             @"instanceType" : @"InstanceType",
             @"marketplace" : @"Marketplace",
             @"offeringType" : @"OfferingType",
             @"pricingDetails" : @"PricingDetails",
             @"productDescription" : @"ProductDescription",
             @"recurringCharges" : @"RecurringCharges",
             @"reservedInstancesOfferingId" : @"ReservedInstancesOfferingId",
             @"usagePrice" : @"UsagePrice",
             };
}

+ (NSValueTransformer *)currencyCodeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"USD"]) {
            return @(AWSEC2CurrencyCodeValuesUSD);
        }
        return @(AWSEC2CurrencyCodeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2CurrencyCodeValuesUSD:
                return @"USD";
            case AWSEC2CurrencyCodeValuesUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTenancyJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"default"]) {
            return @(AWSEC2TenancyDefault);
        }
        if ([value isEqualToString:@"dedicated"]) {
            return @(AWSEC2TenancyDedicated);
        }
        return @(AWSEC2TenancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TenancyDefault:
                return @"default";
            case AWSEC2TenancyDedicated:
                return @"dedicated";
            case AWSEC2TenancyUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"t1.micro"]) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value isEqualToString:@"m1.small"]) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value isEqualToString:@"m1.medium"]) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value isEqualToString:@"m1.large"]) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value isEqualToString:@"m1.xlarge"]) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value isEqualToString:@"m3.medium"]) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value isEqualToString:@"m3.large"]) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value isEqualToString:@"m3.xlarge"]) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value isEqualToString:@"m3.2xlarge"]) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value isEqualToString:@"t2.micro"]) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value isEqualToString:@"t2.small"]) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value isEqualToString:@"t2.medium"]) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value isEqualToString:@"m2.xlarge"]) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value isEqualToString:@"m2.2xlarge"]) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value isEqualToString:@"m2.4xlarge"]) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value isEqualToString:@"cr1.8xlarge"]) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value isEqualToString:@"i2.xlarge"]) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value isEqualToString:@"i2.2xlarge"]) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value isEqualToString:@"i2.4xlarge"]) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value isEqualToString:@"i2.8xlarge"]) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value isEqualToString:@"hi1.4xlarge"]) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value isEqualToString:@"hs1.8xlarge"]) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value isEqualToString:@"c1.medium"]) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value isEqualToString:@"c1.xlarge"]) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value isEqualToString:@"c3.large"]) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value isEqualToString:@"c3.xlarge"]) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value isEqualToString:@"c3.2xlarge"]) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value isEqualToString:@"c3.4xlarge"]) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value isEqualToString:@"c3.8xlarge"]) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value isEqualToString:@"cc1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value isEqualToString:@"cc2.8xlarge"]) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value isEqualToString:@"g2.2xlarge"]) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value isEqualToString:@"cg1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value isEqualToString:@"r3.large"]) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value isEqualToString:@"r3.xlarge"]) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value isEqualToString:@"r3.2xlarge"]) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value isEqualToString:@"r3.4xlarge"]) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value isEqualToString:@"r3.8xlarge"]) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        return @(AWSEC2InstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceTypeT1_micro:
                return @"t1.micro";
            case AWSEC2InstanceTypeM1_small:
                return @"m1.small";
            case AWSEC2InstanceTypeM1_medium:
                return @"m1.medium";
            case AWSEC2InstanceTypeM1_large:
                return @"m1.large";
            case AWSEC2InstanceTypeM1_xlarge:
                return @"m1.xlarge";
            case AWSEC2InstanceTypeM3_medium:
                return @"m3.medium";
            case AWSEC2InstanceTypeM3_large:
                return @"m3.large";
            case AWSEC2InstanceTypeM3_xlarge:
                return @"m3.xlarge";
            case AWSEC2InstanceTypeM3_2xlarge:
                return @"m3.2xlarge";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeM2_xlarge:
                return @"m2.xlarge";
            case AWSEC2InstanceTypeM2_2xlarge:
                return @"m2.2xlarge";
            case AWSEC2InstanceTypeM2_4xlarge:
                return @"m2.4xlarge";
            case AWSEC2InstanceTypeCR1_8xlarge:
                return @"cr1.8xlarge";
            case AWSEC2InstanceTypeI2_xlarge:
                return @"i2.xlarge";
            case AWSEC2InstanceTypeI2_2xlarge:
                return @"i2.2xlarge";
            case AWSEC2InstanceTypeI2_4xlarge:
                return @"i2.4xlarge";
            case AWSEC2InstanceTypeI2_8xlarge:
                return @"i2.8xlarge";
            case AWSEC2InstanceTypeHI1_4xlarge:
                return @"hi1.4xlarge";
            case AWSEC2InstanceTypeHS1_8xlarge:
                return @"hs1.8xlarge";
            case AWSEC2InstanceTypeC1_medium:
                return @"c1.medium";
            case AWSEC2InstanceTypeC1_xlarge:
                return @"c1.xlarge";
            case AWSEC2InstanceTypeC3_large:
                return @"c3.large";
            case AWSEC2InstanceTypeC3_xlarge:
                return @"c3.xlarge";
            case AWSEC2InstanceTypeC3_2xlarge:
                return @"c3.2xlarge";
            case AWSEC2InstanceTypeC3_4xlarge:
                return @"c3.4xlarge";
            case AWSEC2InstanceTypeC3_8xlarge:
                return @"c3.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeCG1_4xlarge:
                return @"cg1.4xlarge";
            case AWSEC2InstanceTypeR3_large:
                return @"r3.large";
            case AWSEC2InstanceTypeR3_xlarge:
                return @"r3.xlarge";
            case AWSEC2InstanceTypeR3_2xlarge:
                return @"r3.2xlarge";
            case AWSEC2InstanceTypeR3_4xlarge:
                return @"r3.4xlarge";
            case AWSEC2InstanceTypeR3_8xlarge:
                return @"r3.8xlarge";
            case AWSEC2InstanceTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Heavy Utilization"]) {
            return @(AWSEC2OfferingTypeValuesHeavyUtilization);
        }
        if ([value isEqualToString:@"Medium Utilization"]) {
            return @(AWSEC2OfferingTypeValuesMediumUtilization);
        }
        if ([value isEqualToString:@"Light Utilization"]) {
            return @(AWSEC2OfferingTypeValuesLightUtilization);
        }
        return @(AWSEC2OfferingTypeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2OfferingTypeValuesHeavyUtilization:
                return @"Heavy Utilization";
            case AWSEC2OfferingTypeValuesMediumUtilization:
                return @"Medium Utilization";
            case AWSEC2OfferingTypeValuesLightUtilization:
                return @"Light Utilization";
            case AWSEC2OfferingTypeValuesUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pricingDetailsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2PricingDetail class]];
}

+ (NSValueTransformer *)productDescriptionJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Linux/UNIX"]) {
            return @(AWSEC2RIProductDescriptionLinuxUNIX);
        }
        if ([value isEqualToString:@"Linux/UNIX (Amazon VPC)"]) {
            return @(AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC);
        }
        if ([value isEqualToString:@"Windows"]) {
            return @(AWSEC2RIProductDescriptionWindows);
        }
        if ([value isEqualToString:@"Windows (Amazon VPC)"]) {
            return @(AWSEC2RIProductDescriptionWindowsAmazonVPC);
        }
        return @(AWSEC2RIProductDescriptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RIProductDescriptionLinuxUNIX:
                return @"Linux/UNIX";
            case AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC:
                return @"Linux/UNIX (Amazon VPC)";
            case AWSEC2RIProductDescriptionWindows:
                return @"Windows";
            case AWSEC2RIProductDescriptionWindowsAmazonVPC:
                return @"Windows (Amazon VPC)";
            case AWSEC2RIProductDescriptionUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2RecurringCharge class]];
}

@end

@implementation AWSEC2ResetImageAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"dryRun" : @"DryRun",
             @"imageId" : @"ImageId",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"launchPermission"]) {
            return @(AWSEC2ResetImageAttributeNameLaunchPermission);
        }
        return @(AWSEC2ResetImageAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ResetImageAttributeNameLaunchPermission:
                return @"launchPermission";
            case AWSEC2ResetImageAttributeNameUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ResetInstanceAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"dryRun" : @"DryRun",
             @"instanceId" : @"InstanceId",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"instanceType"]) {
            return @(AWSEC2InstanceAttributeNameInstanceType);
        }
        if ([value isEqualToString:@"kernel"]) {
            return @(AWSEC2InstanceAttributeNameKernel);
        }
        if ([value isEqualToString:@"ramdisk"]) {
            return @(AWSEC2InstanceAttributeNameRAMDisk);
        }
        if ([value isEqualToString:@"userData"]) {
            return @(AWSEC2InstanceAttributeNameUserData);
        }
        if ([value isEqualToString:@"disableApiTermination"]) {
            return @(AWSEC2InstanceAttributeNameDisableApiTermination);
        }
        if ([value isEqualToString:@"instanceInitiatedShutdownBehavior"]) {
            return @(AWSEC2InstanceAttributeNameInstanceInitiatedShutdownBehavior);
        }
        if ([value isEqualToString:@"rootDeviceName"]) {
            return @(AWSEC2InstanceAttributeNameRootDeviceName);
        }
        if ([value isEqualToString:@"blockDeviceMapping"]) {
            return @(AWSEC2InstanceAttributeNameBlockDeviceMapping);
        }
        if ([value isEqualToString:@"productCodes"]) {
            return @(AWSEC2InstanceAttributeNameProductCodes);
        }
        if ([value isEqualToString:@"sourceDestCheck"]) {
            return @(AWSEC2InstanceAttributeNameSourceDestCheck);
        }
        if ([value isEqualToString:@"groupSet"]) {
            return @(AWSEC2InstanceAttributeNameGroupSet);
        }
        if ([value isEqualToString:@"ebsOptimized"]) {
            return @(AWSEC2InstanceAttributeNameEBSOptimized);
        }
        if ([value isEqualToString:@"sriovNetSupport"]) {
            return @(AWSEC2InstanceAttributeNameSriovNetSupport);
        }
        return @(AWSEC2InstanceAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceAttributeNameInstanceType:
                return @"instanceType";
            case AWSEC2InstanceAttributeNameKernel:
                return @"kernel";
            case AWSEC2InstanceAttributeNameRAMDisk:
                return @"ramdisk";
            case AWSEC2InstanceAttributeNameUserData:
                return @"userData";
            case AWSEC2InstanceAttributeNameDisableApiTermination:
                return @"disableApiTermination";
            case AWSEC2InstanceAttributeNameInstanceInitiatedShutdownBehavior:
                return @"instanceInitiatedShutdownBehavior";
            case AWSEC2InstanceAttributeNameRootDeviceName:
                return @"rootDeviceName";
            case AWSEC2InstanceAttributeNameBlockDeviceMapping:
                return @"blockDeviceMapping";
            case AWSEC2InstanceAttributeNameProductCodes:
                return @"productCodes";
            case AWSEC2InstanceAttributeNameSourceDestCheck:
                return @"sourceDestCheck";
            case AWSEC2InstanceAttributeNameGroupSet:
                return @"groupSet";
            case AWSEC2InstanceAttributeNameEBSOptimized:
                return @"ebsOptimized";
            case AWSEC2InstanceAttributeNameSriovNetSupport:
                return @"sriovNetSupport";
            case AWSEC2InstanceAttributeNameUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ResetNetworkInterfaceAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"sourceDestCheck" : @"SourceDestCheck",
             };
}

@end

@implementation AWSEC2ResetSnapshotAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"dryRun" : @"DryRun",
             @"snapshotId" : @"SnapshotId",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"productCodes"]) {
            return @(AWSEC2SnapshotAttributeNameProductCodes);
        }
        if ([value isEqualToString:@"createVolumePermission"]) {
            return @(AWSEC2SnapshotAttributeNameCreateVolumePermission);
        }
        return @(AWSEC2SnapshotAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SnapshotAttributeNameProductCodes:
                return @"productCodes";
            case AWSEC2SnapshotAttributeNameCreateVolumePermission:
                return @"createVolumePermission";
            case AWSEC2SnapshotAttributeNameUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2RevokeSecurityGroupEgressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrIp" : @"CidrIp",
             @"dryRun" : @"DryRun",
             @"fromPort" : @"FromPort",
             @"groupId" : @"GroupId",
             @"ipPermissions" : @"IpPermissions",
             @"ipProtocol" : @"IpProtocol",
             @"sourceSecurityGroupName" : @"SourceSecurityGroupName",
             @"sourceSecurityGroupOwnerId" : @"SourceSecurityGroupOwnerId",
             @"toPort" : @"ToPort",
             };
}

+ (NSValueTransformer *)ipPermissionsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2IpPermission class]];
}

@end

@implementation AWSEC2RevokeSecurityGroupIngressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrIp" : @"CidrIp",
             @"dryRun" : @"DryRun",
             @"fromPort" : @"FromPort",
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             @"ipPermissions" : @"IpPermissions",
             @"ipProtocol" : @"IpProtocol",
             @"sourceSecurityGroupName" : @"SourceSecurityGroupName",
             @"sourceSecurityGroupOwnerId" : @"SourceSecurityGroupOwnerId",
             @"toPort" : @"ToPort",
             };
}

+ (NSValueTransformer *)ipPermissionsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2IpPermission class]];
}

@end

@implementation AWSEC2Route

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCidrBlock" : @"DestinationCidrBlock",
             @"gatewayId" : @"GatewayId",
             @"instanceId" : @"InstanceId",
             @"instanceOwnerId" : @"InstanceOwnerId",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"origin" : @"Origin",
             @"state" : @"State",
             @"vpcPeeringConnectionId" : @"VpcPeeringConnectionId",
             };
}

+ (NSValueTransformer *)originJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"CreateRouteTable"]) {
            return @(AWSEC2RouteOriginCreateRouteTable);
        }
        if ([value isEqualToString:@"CreateRoute"]) {
            return @(AWSEC2RouteOriginCreateRoute);
        }
        if ([value isEqualToString:@"EnableVgwRoutePropagation"]) {
            return @(AWSEC2RouteOriginEnableVgwRoutePropagation);
        }
        return @(AWSEC2RouteOriginUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RouteOriginCreateRouteTable:
                return @"CreateRouteTable";
            case AWSEC2RouteOriginCreateRoute:
                return @"CreateRoute";
            case AWSEC2RouteOriginEnableVgwRoutePropagation:
                return @"EnableVgwRoutePropagation";
            case AWSEC2RouteOriginUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"active"]) {
            return @(AWSEC2RouteStateActive);
        }
        if ([value isEqualToString:@"blackhole"]) {
            return @(AWSEC2RouteStateBlackhole);
        }
        return @(AWSEC2RouteStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RouteStateActive:
                return @"active";
            case AWSEC2RouteStateBlackhole:
                return @"blackhole";
            case AWSEC2RouteStateUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2RouteTable

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associations" : @"Associations",
             @"propagatingVgws" : @"PropagatingVgws",
             @"routeTableId" : @"RouteTableId",
             @"routes" : @"Routes",
             @"tags" : @"Tags",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)associationsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2RouteTableAssociation class]];
}

+ (NSValueTransformer *)propagatingVgwsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2PropagatingVgw class]];
}

+ (NSValueTransformer *)routesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Route class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2RouteTableAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"main" : @"Main",
             @"routeTableAssociationId" : @"RouteTableAssociationId",
             @"routeTableId" : @"RouteTableId",
             @"subnetId" : @"SubnetId",
             };
}

@end

@implementation AWSEC2RunInstancesMonitoringEnabled

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSEC2RunInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalInfo" : @"AdditionalInfo",
             @"blockDeviceMappings" : @"BlockDeviceMappings",
             @"clientToken" : @"ClientToken",
             @"disableApiTermination" : @"DisableApiTermination",
             @"dryRun" : @"DryRun",
             @"ebsOptimized" : @"EbsOptimized",
             @"iamInstanceProfile" : @"IamInstanceProfile",
             @"imageId" : @"ImageId",
             @"instanceInitiatedShutdownBehavior" : @"InstanceInitiatedShutdownBehavior",
             @"instanceType" : @"InstanceType",
             @"kernelId" : @"KernelId",
             @"keyName" : @"KeyName",
             @"maxCount" : @"MaxCount",
             @"minCount" : @"MinCount",
             @"monitoring" : @"Monitoring",
             @"networkInterfaces" : @"NetworkInterfaces",
             @"placement" : @"Placement",
             @"privateIpAddress" : @"PrivateIpAddress",
             @"ramdiskId" : @"RamdiskId",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"securityGroups" : @"SecurityGroups",
             @"subnetId" : @"SubnetId",
             @"userData" : @"UserData",
             };
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
}

+ (NSValueTransformer *)iamInstanceProfileJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IamInstanceProfileSpecification class]];
}

+ (NSValueTransformer *)instanceInitiatedShutdownBehaviorJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"stop"]) {
            return @(AWSEC2ShutdownBehaviorStop);
        }
        if ([value isEqualToString:@"terminate"]) {
            return @(AWSEC2ShutdownBehaviorTerminate);
        }
        return @(AWSEC2ShutdownBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ShutdownBehaviorStop:
                return @"stop";
            case AWSEC2ShutdownBehaviorTerminate:
                return @"terminate";
            case AWSEC2ShutdownBehaviorUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"t1.micro"]) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value isEqualToString:@"m1.small"]) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value isEqualToString:@"m1.medium"]) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value isEqualToString:@"m1.large"]) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value isEqualToString:@"m1.xlarge"]) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value isEqualToString:@"m3.medium"]) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value isEqualToString:@"m3.large"]) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value isEqualToString:@"m3.xlarge"]) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value isEqualToString:@"m3.2xlarge"]) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value isEqualToString:@"t2.micro"]) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value isEqualToString:@"t2.small"]) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value isEqualToString:@"t2.medium"]) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value isEqualToString:@"m2.xlarge"]) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value isEqualToString:@"m2.2xlarge"]) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value isEqualToString:@"m2.4xlarge"]) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value isEqualToString:@"cr1.8xlarge"]) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value isEqualToString:@"i2.xlarge"]) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value isEqualToString:@"i2.2xlarge"]) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value isEqualToString:@"i2.4xlarge"]) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value isEqualToString:@"i2.8xlarge"]) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value isEqualToString:@"hi1.4xlarge"]) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value isEqualToString:@"hs1.8xlarge"]) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value isEqualToString:@"c1.medium"]) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value isEqualToString:@"c1.xlarge"]) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value isEqualToString:@"c3.large"]) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value isEqualToString:@"c3.xlarge"]) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value isEqualToString:@"c3.2xlarge"]) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value isEqualToString:@"c3.4xlarge"]) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value isEqualToString:@"c3.8xlarge"]) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value isEqualToString:@"cc1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value isEqualToString:@"cc2.8xlarge"]) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value isEqualToString:@"g2.2xlarge"]) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value isEqualToString:@"cg1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value isEqualToString:@"r3.large"]) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value isEqualToString:@"r3.xlarge"]) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value isEqualToString:@"r3.2xlarge"]) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value isEqualToString:@"r3.4xlarge"]) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value isEqualToString:@"r3.8xlarge"]) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        return @(AWSEC2InstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceTypeT1_micro:
                return @"t1.micro";
            case AWSEC2InstanceTypeM1_small:
                return @"m1.small";
            case AWSEC2InstanceTypeM1_medium:
                return @"m1.medium";
            case AWSEC2InstanceTypeM1_large:
                return @"m1.large";
            case AWSEC2InstanceTypeM1_xlarge:
                return @"m1.xlarge";
            case AWSEC2InstanceTypeM3_medium:
                return @"m3.medium";
            case AWSEC2InstanceTypeM3_large:
                return @"m3.large";
            case AWSEC2InstanceTypeM3_xlarge:
                return @"m3.xlarge";
            case AWSEC2InstanceTypeM3_2xlarge:
                return @"m3.2xlarge";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeM2_xlarge:
                return @"m2.xlarge";
            case AWSEC2InstanceTypeM2_2xlarge:
                return @"m2.2xlarge";
            case AWSEC2InstanceTypeM2_4xlarge:
                return @"m2.4xlarge";
            case AWSEC2InstanceTypeCR1_8xlarge:
                return @"cr1.8xlarge";
            case AWSEC2InstanceTypeI2_xlarge:
                return @"i2.xlarge";
            case AWSEC2InstanceTypeI2_2xlarge:
                return @"i2.2xlarge";
            case AWSEC2InstanceTypeI2_4xlarge:
                return @"i2.4xlarge";
            case AWSEC2InstanceTypeI2_8xlarge:
                return @"i2.8xlarge";
            case AWSEC2InstanceTypeHI1_4xlarge:
                return @"hi1.4xlarge";
            case AWSEC2InstanceTypeHS1_8xlarge:
                return @"hs1.8xlarge";
            case AWSEC2InstanceTypeC1_medium:
                return @"c1.medium";
            case AWSEC2InstanceTypeC1_xlarge:
                return @"c1.xlarge";
            case AWSEC2InstanceTypeC3_large:
                return @"c3.large";
            case AWSEC2InstanceTypeC3_xlarge:
                return @"c3.xlarge";
            case AWSEC2InstanceTypeC3_2xlarge:
                return @"c3.2xlarge";
            case AWSEC2InstanceTypeC3_4xlarge:
                return @"c3.4xlarge";
            case AWSEC2InstanceTypeC3_8xlarge:
                return @"c3.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeCG1_4xlarge:
                return @"cg1.4xlarge";
            case AWSEC2InstanceTypeR3_large:
                return @"r3.large";
            case AWSEC2InstanceTypeR3_xlarge:
                return @"r3.xlarge";
            case AWSEC2InstanceTypeR3_2xlarge:
                return @"r3.2xlarge";
            case AWSEC2InstanceTypeR3_4xlarge:
                return @"r3.4xlarge";
            case AWSEC2InstanceTypeR3_8xlarge:
                return @"r3.8xlarge";
            case AWSEC2InstanceTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)monitoringJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2RunInstancesMonitoringEnabled class]];
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceNetworkInterfaceSpecification class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Placement class]];
}

@end

@implementation AWSEC2S3Storage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AWSAccessKeyId" : @"AWSAccessKeyId",
             @"bucket" : @"Bucket",
             @"prefix" : @"Prefix",
             @"uploadPolicy" : @"UploadPolicy",
             @"uploadPolicySignature" : @"UploadPolicySignature",
             };
}

@end

@implementation AWSEC2SecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             @"ipPermissions" : @"IpPermissions",
             @"ipPermissionsEgress" : @"IpPermissionsEgress",
             @"ownerId" : @"OwnerId",
             @"tags" : @"Tags",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)ipPermissionsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2IpPermission class]];
}

+ (NSValueTransformer *)ipPermissionsEgressJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2IpPermission class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2Snapshot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"encrypted" : @"Encrypted",
             @"ownerAlias" : @"OwnerAlias",
             @"ownerId" : @"OwnerId",
             @"progress" : @"Progress",
             @"snapshotId" : @"SnapshotId",
             @"startTime" : @"StartTime",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"volumeId" : @"VolumeId",
             @"volumeSize" : @"VolumeSize",
             };
}

+ (NSValueTransformer *)startTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"pending"]) {
            return @(AWSEC2SnapshotStatePending);
        }
        if ([value isEqualToString:@"completed"]) {
            return @(AWSEC2SnapshotStateCompleted);
        }
        if ([value isEqualToString:@"error"]) {
            return @(AWSEC2SnapshotStateError);
        }
        return @(AWSEC2SnapshotStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SnapshotStatePending:
                return @"pending";
            case AWSEC2SnapshotStateCompleted:
                return @"completed";
            case AWSEC2SnapshotStateError:
                return @"error";
            case AWSEC2SnapshotStateUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2SpotDatafeedSubscription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"fault" : @"Fault",
             @"ownerId" : @"OwnerId",
             @"prefix" : @"Prefix",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)faultJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotInstanceStateFault class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Active"]) {
            return @(AWSEC2DatafeedSubscriptionStateActive);
        }
        if ([value isEqualToString:@"Inactive"]) {
            return @(AWSEC2DatafeedSubscriptionStateInactive);
        }
        return @(AWSEC2DatafeedSubscriptionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DatafeedSubscriptionStateActive:
                return @"Active";
            case AWSEC2DatafeedSubscriptionStateInactive:
                return @"Inactive";
            case AWSEC2DatafeedSubscriptionStateUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2SpotInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZoneGroup" : @"AvailabilityZoneGroup",
             @"createTime" : @"CreateTime",
             @"fault" : @"Fault",
             @"instanceId" : @"InstanceId",
             @"launchGroup" : @"LaunchGroup",
             @"launchSpecification" : @"LaunchSpecification",
             @"launchedAvailabilityZone" : @"LaunchedAvailabilityZone",
             @"productDescription" : @"ProductDescription",
             @"spotInstanceRequestId" : @"SpotInstanceRequestId",
             @"spotPrice" : @"SpotPrice",
             @"state" : @"State",
             @"status" : @"Status",
             @"tags" : @"Tags",
             @"type" : @"Type",
             @"validFrom" : @"ValidFrom",
             @"validUntil" : @"ValidUntil",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)faultJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotInstanceStateFault class]];
}

+ (NSValueTransformer *)launchSpecificationJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2LaunchSpecification class]];
}

+ (NSValueTransformer *)productDescriptionJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Linux/UNIX"]) {
            return @(AWSEC2RIProductDescriptionLinuxUNIX);
        }
        if ([value isEqualToString:@"Linux/UNIX (Amazon VPC)"]) {
            return @(AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC);
        }
        if ([value isEqualToString:@"Windows"]) {
            return @(AWSEC2RIProductDescriptionWindows);
        }
        if ([value isEqualToString:@"Windows (Amazon VPC)"]) {
            return @(AWSEC2RIProductDescriptionWindowsAmazonVPC);
        }
        return @(AWSEC2RIProductDescriptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RIProductDescriptionLinuxUNIX:
                return @"Linux/UNIX";
            case AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC:
                return @"Linux/UNIX (Amazon VPC)";
            case AWSEC2RIProductDescriptionWindows:
                return @"Windows";
            case AWSEC2RIProductDescriptionWindowsAmazonVPC:
                return @"Windows (Amazon VPC)";
            case AWSEC2RIProductDescriptionUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"open"]) {
            return @(AWSEC2SpotInstanceStateOpen);
        }
        if ([value isEqualToString:@"active"]) {
            return @(AWSEC2SpotInstanceStateActive);
        }
        if ([value isEqualToString:@"closed"]) {
            return @(AWSEC2SpotInstanceStateClosed);
        }
        if ([value isEqualToString:@"cancelled"]) {
            return @(AWSEC2SpotInstanceStateCancelled);
        }
        if ([value isEqualToString:@"failed"]) {
            return @(AWSEC2SpotInstanceStateFailed);
        }
        return @(AWSEC2SpotInstanceStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SpotInstanceStateOpen:
                return @"open";
            case AWSEC2SpotInstanceStateActive:
                return @"active";
            case AWSEC2SpotInstanceStateClosed:
                return @"closed";
            case AWSEC2SpotInstanceStateCancelled:
                return @"cancelled";
            case AWSEC2SpotInstanceStateFailed:
                return @"failed";
            case AWSEC2SpotInstanceStateUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotInstanceStatus class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)typeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"one-time"]) {
            return @(AWSEC2SpotInstanceTypeOneTime);
        }
        if ([value isEqualToString:@"persistent"]) {
            return @(AWSEC2SpotInstanceTypePersistent);
        }
        return @(AWSEC2SpotInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SpotInstanceTypeOneTime:
                return @"one-time";
            case AWSEC2SpotInstanceTypePersistent:
                return @"persistent";
            case AWSEC2SpotInstanceTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)validFromJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)validUntilJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2SpotInstanceStateFault

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

@end

@implementation AWSEC2SpotInstanceStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             @"updateTime" : @"UpdateTime",
             };
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2SpotPlacement

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"groupName" : @"GroupName",
             };
}

@end

@implementation AWSEC2SpotPrice

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"instanceType" : @"InstanceType",
             @"productDescription" : @"ProductDescription",
             @"spotPrice" : @"SpotPrice",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"t1.micro"]) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value isEqualToString:@"m1.small"]) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value isEqualToString:@"m1.medium"]) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value isEqualToString:@"m1.large"]) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value isEqualToString:@"m1.xlarge"]) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value isEqualToString:@"m3.medium"]) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value isEqualToString:@"m3.large"]) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value isEqualToString:@"m3.xlarge"]) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value isEqualToString:@"m3.2xlarge"]) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value isEqualToString:@"t2.micro"]) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value isEqualToString:@"t2.small"]) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value isEqualToString:@"t2.medium"]) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value isEqualToString:@"m2.xlarge"]) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value isEqualToString:@"m2.2xlarge"]) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value isEqualToString:@"m2.4xlarge"]) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value isEqualToString:@"cr1.8xlarge"]) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value isEqualToString:@"i2.xlarge"]) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value isEqualToString:@"i2.2xlarge"]) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value isEqualToString:@"i2.4xlarge"]) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value isEqualToString:@"i2.8xlarge"]) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value isEqualToString:@"hi1.4xlarge"]) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value isEqualToString:@"hs1.8xlarge"]) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value isEqualToString:@"c1.medium"]) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value isEqualToString:@"c1.xlarge"]) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value isEqualToString:@"c3.large"]) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value isEqualToString:@"c3.xlarge"]) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value isEqualToString:@"c3.2xlarge"]) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value isEqualToString:@"c3.4xlarge"]) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value isEqualToString:@"c3.8xlarge"]) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value isEqualToString:@"cc1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value isEqualToString:@"cc2.8xlarge"]) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value isEqualToString:@"g2.2xlarge"]) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value isEqualToString:@"cg1.4xlarge"]) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value isEqualToString:@"r3.large"]) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value isEqualToString:@"r3.xlarge"]) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value isEqualToString:@"r3.2xlarge"]) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value isEqualToString:@"r3.4xlarge"]) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value isEqualToString:@"r3.8xlarge"]) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        return @(AWSEC2InstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceTypeT1_micro:
                return @"t1.micro";
            case AWSEC2InstanceTypeM1_small:
                return @"m1.small";
            case AWSEC2InstanceTypeM1_medium:
                return @"m1.medium";
            case AWSEC2InstanceTypeM1_large:
                return @"m1.large";
            case AWSEC2InstanceTypeM1_xlarge:
                return @"m1.xlarge";
            case AWSEC2InstanceTypeM3_medium:
                return @"m3.medium";
            case AWSEC2InstanceTypeM3_large:
                return @"m3.large";
            case AWSEC2InstanceTypeM3_xlarge:
                return @"m3.xlarge";
            case AWSEC2InstanceTypeM3_2xlarge:
                return @"m3.2xlarge";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeM2_xlarge:
                return @"m2.xlarge";
            case AWSEC2InstanceTypeM2_2xlarge:
                return @"m2.2xlarge";
            case AWSEC2InstanceTypeM2_4xlarge:
                return @"m2.4xlarge";
            case AWSEC2InstanceTypeCR1_8xlarge:
                return @"cr1.8xlarge";
            case AWSEC2InstanceTypeI2_xlarge:
                return @"i2.xlarge";
            case AWSEC2InstanceTypeI2_2xlarge:
                return @"i2.2xlarge";
            case AWSEC2InstanceTypeI2_4xlarge:
                return @"i2.4xlarge";
            case AWSEC2InstanceTypeI2_8xlarge:
                return @"i2.8xlarge";
            case AWSEC2InstanceTypeHI1_4xlarge:
                return @"hi1.4xlarge";
            case AWSEC2InstanceTypeHS1_8xlarge:
                return @"hs1.8xlarge";
            case AWSEC2InstanceTypeC1_medium:
                return @"c1.medium";
            case AWSEC2InstanceTypeC1_xlarge:
                return @"c1.xlarge";
            case AWSEC2InstanceTypeC3_large:
                return @"c3.large";
            case AWSEC2InstanceTypeC3_xlarge:
                return @"c3.xlarge";
            case AWSEC2InstanceTypeC3_2xlarge:
                return @"c3.2xlarge";
            case AWSEC2InstanceTypeC3_4xlarge:
                return @"c3.4xlarge";
            case AWSEC2InstanceTypeC3_8xlarge:
                return @"c3.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeCG1_4xlarge:
                return @"cg1.4xlarge";
            case AWSEC2InstanceTypeR3_large:
                return @"r3.large";
            case AWSEC2InstanceTypeR3_xlarge:
                return @"r3.xlarge";
            case AWSEC2InstanceTypeR3_2xlarge:
                return @"r3.2xlarge";
            case AWSEC2InstanceTypeR3_4xlarge:
                return @"r3.4xlarge";
            case AWSEC2InstanceTypeR3_8xlarge:
                return @"r3.8xlarge";
            case AWSEC2InstanceTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)productDescriptionJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Linux/UNIX"]) {
            return @(AWSEC2RIProductDescriptionLinuxUNIX);
        }
        if ([value isEqualToString:@"Linux/UNIX (Amazon VPC)"]) {
            return @(AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC);
        }
        if ([value isEqualToString:@"Windows"]) {
            return @(AWSEC2RIProductDescriptionWindows);
        }
        if ([value isEqualToString:@"Windows (Amazon VPC)"]) {
            return @(AWSEC2RIProductDescriptionWindowsAmazonVPC);
        }
        return @(AWSEC2RIProductDescriptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RIProductDescriptionLinuxUNIX:
                return @"Linux/UNIX";
            case AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC:
                return @"Linux/UNIX (Amazon VPC)";
            case AWSEC2RIProductDescriptionWindows:
                return @"Windows";
            case AWSEC2RIProductDescriptionWindowsAmazonVPC:
                return @"Windows (Amazon VPC)";
            case AWSEC2RIProductDescriptionUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2StartInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalInfo" : @"AdditionalInfo",
             @"dryRun" : @"DryRun",
             @"instanceIds" : @"InstanceIds",
             };
}

@end

@implementation AWSEC2StartInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"startingInstances" : @"StartingInstances",
             };
}

+ (NSValueTransformer *)startingInstancesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceStateChange class]];
}

@end

@implementation AWSEC2StateReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

@end

@implementation AWSEC2StopInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"force" : @"Force",
             @"instanceIds" : @"InstanceIds",
             };
}

@end

@implementation AWSEC2StopInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stoppingInstances" : @"StoppingInstances",
             };
}

+ (NSValueTransformer *)stoppingInstancesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceStateChange class]];
}

@end

@implementation AWSEC2Storage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3" : @"S3",
             };
}

+ (NSValueTransformer *)s3JSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2S3Storage class]];
}

@end

@implementation AWSEC2Subnet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"availableIpAddressCount" : @"AvailableIpAddressCount",
             @"cidrBlock" : @"CidrBlock",
             @"defaultForAz" : @"DefaultForAz",
             @"mapPublicIpOnLaunch" : @"MapPublicIpOnLaunch",
             @"state" : @"State",
             @"subnetId" : @"SubnetId",
             @"tags" : @"Tags",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"pending"]) {
            return @(AWSEC2SubnetStatePending);
        }
        if ([value isEqualToString:@"available"]) {
            return @(AWSEC2SubnetStateAvailable);
        }
        return @(AWSEC2SubnetStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SubnetStatePending:
                return @"pending";
            case AWSEC2SubnetStateAvailable:
                return @"available";
            case AWSEC2SubnetStateUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2Tag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSEC2TagDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"resourceId" : @"ResourceId",
             @"resourceType" : @"ResourceType",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"customer-gateway"]) {
            return @(AWSEC2ResourceTypeCustomerGateway);
        }
        if ([value isEqualToString:@"dhcp-options"]) {
            return @(AWSEC2ResourceTypeDHCPOptions);
        }
        if ([value isEqualToString:@"image"]) {
            return @(AWSEC2ResourceTypeImage);
        }
        if ([value isEqualToString:@"instance"]) {
            return @(AWSEC2ResourceTypeInstance);
        }
        if ([value isEqualToString:@"internet-gateway"]) {
            return @(AWSEC2ResourceTypeInternetGateway);
        }
        if ([value isEqualToString:@"network-acl"]) {
            return @(AWSEC2ResourceTypeNetworkACL);
        }
        if ([value isEqualToString:@"network-interface"]) {
            return @(AWSEC2ResourceTypeNetworkInterface);
        }
        if ([value isEqualToString:@"reserved-instances"]) {
            return @(AWSEC2ResourceTypeReservedInstances);
        }
        if ([value isEqualToString:@"route-table"]) {
            return @(AWSEC2ResourceTypeRouteTable);
        }
        if ([value isEqualToString:@"snapshot"]) {
            return @(AWSEC2ResourceTypeSnapshot);
        }
        if ([value isEqualToString:@"spot-instances-request"]) {
            return @(AWSEC2ResourceTypeSpotInstancesRequest);
        }
        if ([value isEqualToString:@"subnet"]) {
            return @(AWSEC2ResourceTypeSubnet);
        }
        if ([value isEqualToString:@"security-group"]) {
            return @(AWSEC2ResourceTypeSecurityGroup);
        }
        if ([value isEqualToString:@"volume"]) {
            return @(AWSEC2ResourceTypeVolume);
        }
        if ([value isEqualToString:@"vpc"]) {
            return @(AWSEC2ResourceTypeVPC);
        }
        if ([value isEqualToString:@"vpn-connection"]) {
            return @(AWSEC2ResourceTypeVpnConnection);
        }
        if ([value isEqualToString:@"vpn-gateway"]) {
            return @(AWSEC2ResourceTypeVpnGateway);
        }
        return @(AWSEC2ResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ResourceTypeCustomerGateway:
                return @"customer-gateway";
            case AWSEC2ResourceTypeDHCPOptions:
                return @"dhcp-options";
            case AWSEC2ResourceTypeImage:
                return @"image";
            case AWSEC2ResourceTypeInstance:
                return @"instance";
            case AWSEC2ResourceTypeInternetGateway:
                return @"internet-gateway";
            case AWSEC2ResourceTypeNetworkACL:
                return @"network-acl";
            case AWSEC2ResourceTypeNetworkInterface:
                return @"network-interface";
            case AWSEC2ResourceTypeReservedInstances:
                return @"reserved-instances";
            case AWSEC2ResourceTypeRouteTable:
                return @"route-table";
            case AWSEC2ResourceTypeSnapshot:
                return @"snapshot";
            case AWSEC2ResourceTypeSpotInstancesRequest:
                return @"spot-instances-request";
            case AWSEC2ResourceTypeSubnet:
                return @"subnet";
            case AWSEC2ResourceTypeSecurityGroup:
                return @"security-group";
            case AWSEC2ResourceTypeVolume:
                return @"volume";
            case AWSEC2ResourceTypeVPC:
                return @"vpc";
            case AWSEC2ResourceTypeVpnConnection:
                return @"vpn-connection";
            case AWSEC2ResourceTypeVpnGateway:
                return @"vpn-gateway";
            case AWSEC2ResourceTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2TerminateInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"instanceIds" : @"InstanceIds",
             };
}

@end

@implementation AWSEC2TerminateInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"terminatingInstances" : @"TerminatingInstances",
             };
}

+ (NSValueTransformer *)terminatingInstancesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceStateChange class]];
}

@end

@implementation AWSEC2UnassignPrivateIpAddressesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"privateIpAddresses" : @"PrivateIpAddresses",
             };
}

@end

@implementation AWSEC2UnmonitorInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"instanceIds" : @"InstanceIds",
             };
}

@end

@implementation AWSEC2UnmonitorInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceMonitorings" : @"InstanceMonitorings",
             };
}

+ (NSValueTransformer *)instanceMonitoringsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceMonitoring class]];
}

@end

@implementation AWSEC2UserIdGroupPair

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSEC2VgwTelemetry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptedRouteCount" : @"AcceptedRouteCount",
             @"lastStatusChange" : @"LastStatusChange",
             @"outsideIpAddress" : @"OutsideIpAddress",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             };
}

+ (NSValueTransformer *)lastStatusChangeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"UP"]) {
            return @(AWSEC2TelemetryStatusUp);
        }
        if ([value isEqualToString:@"DOWN"]) {
            return @(AWSEC2TelemetryStatusDown);
        }
        return @(AWSEC2TelemetryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TelemetryStatusUp:
                return @"UP";
            case AWSEC2TelemetryStatusDown:
                return @"DOWN";
            case AWSEC2TelemetryStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2Volume

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachments" : @"Attachments",
             @"availabilityZone" : @"AvailabilityZone",
             @"createTime" : @"CreateTime",
             @"encrypted" : @"Encrypted",
             @"iops" : @"Iops",
             @"size" : @"Size",
             @"snapshotId" : @"SnapshotId",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"volumeId" : @"VolumeId",
             @"volumeType" : @"VolumeType",
             };
}

+ (NSValueTransformer *)attachmentsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2VolumeAttachment class]];
}

+ (NSValueTransformer *)createTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"creating"]) {
            return @(AWSEC2VolumeStateCreating);
        }
        if ([value isEqualToString:@"available"]) {
            return @(AWSEC2VolumeStateAvailable);
        }
        if ([value isEqualToString:@"in-use"]) {
            return @(AWSEC2VolumeStateInUse);
        }
        if ([value isEqualToString:@"deleting"]) {
            return @(AWSEC2VolumeStateDeleting);
        }
        if ([value isEqualToString:@"deleted"]) {
            return @(AWSEC2VolumeStateDeleted);
        }
        if ([value isEqualToString:@"error"]) {
            return @(AWSEC2VolumeStateError);
        }
        return @(AWSEC2VolumeStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VolumeStateCreating:
                return @"creating";
            case AWSEC2VolumeStateAvailable:
                return @"available";
            case AWSEC2VolumeStateInUse:
                return @"in-use";
            case AWSEC2VolumeStateDeleting:
                return @"deleting";
            case AWSEC2VolumeStateDeleted:
                return @"deleted";
            case AWSEC2VolumeStateError:
                return @"error";
            case AWSEC2VolumeStateUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)volumeTypeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"standard"]) {
            return @(AWSEC2VolumeTypeStandard);
        }
        if ([value isEqualToString:@"io1"]) {
            return @(AWSEC2VolumeTypeIO1);
        }
        if ([value isEqualToString:@"gp2"]) {
            return @(AWSEC2VolumeTypeGp2);
        }
        return @(AWSEC2VolumeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VolumeTypeStandard:
                return @"standard";
            case AWSEC2VolumeTypeIO1:
                return @"io1";
            case AWSEC2VolumeTypeGp2:
                return @"gp2";
            case AWSEC2VolumeTypeUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2VolumeAttachment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attachTime" : @"AttachTime",
             @"deleteOnTermination" : @"DeleteOnTermination",
             @"device" : @"Device",
             @"instanceId" : @"InstanceId",
             @"state" : @"State",
             @"volumeId" : @"VolumeId",
             };
}

+ (NSValueTransformer *)attachTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"attaching"]) {
            return @(AWSEC2VolumeAttachmentStateAttaching);
        }
        if ([value isEqualToString:@"attached"]) {
            return @(AWSEC2VolumeAttachmentStateAttached);
        }
        if ([value isEqualToString:@"detaching"]) {
            return @(AWSEC2VolumeAttachmentStateDetaching);
        }
        if ([value isEqualToString:@"detached"]) {
            return @(AWSEC2VolumeAttachmentStateDetached);
        }
        return @(AWSEC2VolumeAttachmentStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VolumeAttachmentStateAttaching:
                return @"attaching";
            case AWSEC2VolumeAttachmentStateAttached:
                return @"attached";
            case AWSEC2VolumeAttachmentStateDetaching:
                return @"detaching";
            case AWSEC2VolumeAttachmentStateDetached:
                return @"detached";
            case AWSEC2VolumeAttachmentStateUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2VolumeDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"size" : @"Size",
             };
}

@end

@implementation AWSEC2VolumeStatusAction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"detail" : @"Description",
             @"eventId" : @"EventId",
             @"eventType" : @"EventType",
             };
}

@end

@implementation AWSEC2VolumeStatusDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"io-enabled"]) {
            return @(AWSEC2VolumeStatusNameIoEnabled);
        }
        if ([value isEqualToString:@"io-performance"]) {
            return @(AWSEC2VolumeStatusNameIoPerformance);
        }
        return @(AWSEC2VolumeStatusNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VolumeStatusNameIoEnabled:
                return @"io-enabled";
            case AWSEC2VolumeStatusNameIoPerformance:
                return @"io-performance";
            case AWSEC2VolumeStatusNameUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2VolumeStatusEvent

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"eventId" : @"EventId",
             @"eventType" : @"EventType",
             @"notAfter" : @"NotAfter",
             @"notBefore" : @"NotBefore",
             };
}

+ (NSValueTransformer *)notAfterJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)notBeforeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2VolumeStatusInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"details" : @"Details",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)detailsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2VolumeStatusDetails class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ok"]) {
            return @(AWSEC2VolumeStatusInfoStatusOK);
        }
        if ([value isEqualToString:@"impaired"]) {
            return @(AWSEC2VolumeStatusInfoStatusImpaired);
        }
        if ([value isEqualToString:@"insufficient-data"]) {
            return @(AWSEC2VolumeStatusInfoStatusInsufficientData);
        }
        return @(AWSEC2VolumeStatusInfoStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VolumeStatusInfoStatusOK:
                return @"ok";
            case AWSEC2VolumeStatusInfoStatusImpaired:
                return @"impaired";
            case AWSEC2VolumeStatusInfoStatusInsufficientData:
                return @"insufficient-data";
            case AWSEC2VolumeStatusInfoStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2VolumeStatusItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"availabilityZone" : @"AvailabilityZone",
             @"events" : @"Events",
             @"volumeId" : @"VolumeId",
             @"volumeStatus" : @"VolumeStatus",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2VolumeStatusAction class]];
}

+ (NSValueTransformer *)eventsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2VolumeStatusEvent class]];
}

+ (NSValueTransformer *)volumeStatusJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VolumeStatusInfo class]];
}

@end

@implementation AWSEC2Vpc

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrBlock" : @"CidrBlock",
             @"dhcpOptionsId" : @"DhcpOptionsId",
             @"instanceTenancy" : @"InstanceTenancy",
             @"isDefault" : @"IsDefault",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)instanceTenancyJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"default"]) {
            return @(AWSEC2TenancyDefault);
        }
        if ([value isEqualToString:@"dedicated"]) {
            return @(AWSEC2TenancyDedicated);
        }
        return @(AWSEC2TenancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TenancyDefault:
                return @"default";
            case AWSEC2TenancyDedicated:
                return @"dedicated";
            case AWSEC2TenancyUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"pending"]) {
            return @(AWSEC2VpcStatePending);
        }
        if ([value isEqualToString:@"available"]) {
            return @(AWSEC2VpcStateAvailable);
        }
        return @(AWSEC2VpcStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VpcStatePending:
                return @"pending";
            case AWSEC2VpcStateAvailable:
                return @"available";
            case AWSEC2VpcStateUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2VpcAttachment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"attaching"]) {
            return @(AWSEC2AttachmentStatusAttaching);
        }
        if ([value isEqualToString:@"attached"]) {
            return @(AWSEC2AttachmentStatusAttached);
        }
        if ([value isEqualToString:@"detaching"]) {
            return @(AWSEC2AttachmentStatusDetaching);
        }
        if ([value isEqualToString:@"detached"]) {
            return @(AWSEC2AttachmentStatusDetached);
        }
        return @(AWSEC2AttachmentStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2AttachmentStatusAttaching:
                return @"attaching";
            case AWSEC2AttachmentStatusAttached:
                return @"attached";
            case AWSEC2AttachmentStatusDetaching:
                return @"detaching";
            case AWSEC2AttachmentStatusDetached:
                return @"detached";
            case AWSEC2AttachmentStatusUnknown:
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2VpcPeeringConnection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accepterVpcInfo" : @"AccepterVpcInfo",
             @"expirationTime" : @"ExpirationTime",
             @"requesterVpcInfo" : @"RequesterVpcInfo",
             @"status" : @"Status",
             @"tags" : @"Tags",
             @"vpcPeeringConnectionId" : @"VpcPeeringConnectionId",
             };
}

+ (NSValueTransformer *)accepterVpcInfoJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcPeeringConnectionVpcInfo class]];
}

+ (NSValueTransformer *)expirationTimeJSONTransformer {
	return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
        return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)requesterVpcInfoJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcPeeringConnectionVpcInfo class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcPeeringConnectionStateReason class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2VpcPeeringConnectionStateReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

@end

@implementation AWSEC2VpcPeeringConnectionVpcInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrBlock" : @"CidrBlock",
             @"ownerId" : @"OwnerId",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2VpnConnection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerGatewayConfiguration" : @"CustomerGatewayConfiguration",
             @"customerGatewayId" : @"CustomerGatewayId",
             @"options" : @"Options",
             @"routes" : @"Routes",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"type" : @"Type",
             @"vgwTelemetry" : @"VgwTelemetry",
             @"vpnConnectionId" : @"VpnConnectionId",
             @"vpnGatewayId" : @"VpnGatewayId",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
	return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpnConnectionOptions class]];
}

+ (NSValueTransformer *)routesJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2VpnStaticRoute class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"pending"]) {
            return @(AWSEC2VpnStatePending);
        }
        if ([value isEqualToString:@"available"]) {
            return @(AWSEC2VpnStateAvailable);
        }
        if ([value isEqualToString:@"deleting"]) {
            return @(AWSEC2VpnStateDeleting);
        }
        if ([value isEqualToString:@"deleted"]) {
            return @(AWSEC2VpnStateDeleted);
        }
        return @(AWSEC2VpnStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VpnStatePending:
                return @"pending";
            case AWSEC2VpnStateAvailable:
                return @"available";
            case AWSEC2VpnStateDeleting:
                return @"deleting";
            case AWSEC2VpnStateDeleted:
                return @"deleted";
            case AWSEC2VpnStateUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)typeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ipsec.1"]) {
            return @(AWSEC2GatewayTypeIpsec1);
        }
        return @(AWSEC2GatewayTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2GatewayTypeIpsec1:
                return @"ipsec.1";
            case AWSEC2GatewayTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vgwTelemetryJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2VgwTelemetry class]];
}

@end

@implementation AWSEC2VpnConnectionOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"staticRoutesOnly" : @"StaticRoutesOnly",
             };
}

@end

@implementation AWSEC2VpnConnectionOptionsSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"staticRoutesOnly" : @"StaticRoutesOnly",
             };
}

@end

@implementation AWSEC2VpnGateway

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"type" : @"Type",
             @"vpcAttachments" : @"VpcAttachments",
             @"vpnGatewayId" : @"VpnGatewayId",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"pending"]) {
            return @(AWSEC2VpnStatePending);
        }
        if ([value isEqualToString:@"available"]) {
            return @(AWSEC2VpnStateAvailable);
        }
        if ([value isEqualToString:@"deleting"]) {
            return @(AWSEC2VpnStateDeleting);
        }
        if ([value isEqualToString:@"deleted"]) {
            return @(AWSEC2VpnStateDeleted);
        }
        return @(AWSEC2VpnStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VpnStatePending:
                return @"pending";
            case AWSEC2VpnStateAvailable:
                return @"available";
            case AWSEC2VpnStateDeleting:
                return @"deleting";
            case AWSEC2VpnStateDeleted:
                return @"deleted";
            case AWSEC2VpnStateUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)typeJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"ipsec.1"]) {
            return @(AWSEC2GatewayTypeIpsec1);
        }
        return @(AWSEC2GatewayTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2GatewayTypeIpsec1:
                return @"ipsec.1";
            case AWSEC2GatewayTypeUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcAttachmentsJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[AWSEC2VpcAttachment class]];
}

@end

@implementation AWSEC2VpnStaticRoute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCidrBlock" : @"DestinationCidrBlock",
             @"source" : @"Source",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)sourceJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Static"]) {
            return @(AWSEC2VpnStaticRouteSourceStatic);
        }
        return @(AWSEC2VpnStaticRouteSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VpnStaticRouteSourceStatic:
                return @"Static";
            case AWSEC2VpnStaticRouteSourceUnknown:
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"pending"]) {
            return @(AWSEC2VpnStatePending);
        }
        if ([value isEqualToString:@"available"]) {
            return @(AWSEC2VpnStateAvailable);
        }
        if ([value isEqualToString:@"deleting"]) {
            return @(AWSEC2VpnStateDeleting);
        }
        if ([value isEqualToString:@"deleted"]) {
            return @(AWSEC2VpnStateDeleted);
        }
        return @(AWSEC2VpnStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VpnStatePending:
                return @"pending";
            case AWSEC2VpnStateAvailable:
                return @"available";
            case AWSEC2VpnStateDeleting:
                return @"deleting";
            case AWSEC2VpnStateDeleted:
                return @"deleted";
            case AWSEC2VpnStateUnknown:
            default:
                return nil;
        }
    }];
}

@end
